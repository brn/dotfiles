;;camp.moduleのパス自動補完機能
(defun yas-util-get-module-path()
  (let*
      (
       ;;modules/で分割する
       (dir-path (car (cdr (split-string default-directory "modules/"))))
       (ret "")
       path-arr)
    (defun replace-cases(ch-num next-ch-num list result-str skip?)
      (let*
          (
           (ch-str (char-to-string ch-num))
           next-ch-str
           appended
           skip-next?)
        (if (not skip?)
            (progn
              (if next-ch-num (setq next-ch-str (char-to-string next-ch-num)))
              (if next-ch-str
                  (if (equal ch-str "/")
                      (setq appended (concat result-str "."))
                    (if (equal ch-str "_")
                        (progn
                          (setq appended (concat result-str (upcase next-ch-str)))
                          (setq skip-next? t))
                      (setq appended (concat result-str ch-str))))
                ;;最後が/の場合破棄する
                (if (equal ch-str "/")
                    (setq appended result-str)
                  (setq appended (concat result-str ch-str)))))
          (setq appended result-str))
        (if list
            (replace-cases (car list) (car (cdr list)) (cdr list) appended skip-next?)
          appended)))
    (if dir-path
        (progn
          (setq path-arr (string-to-list dir-path))
          (replace-cases (car path-arr) (car (cdr path-arr)) (cdr path-arr) ret nil))
      ret)))


;;アッパーキャメルからローワーキャメルに変換
(defun yas-util-upper-to-lower-camel(text)
  (if (/= (length text) 0)
      (concat
       (downcase 
        (char-to-string
         (car (string-to-list text))))
       (coerce
        (cdr (string-to-list text))
        'string))
    text))


;;ローワーキャメルからアッパーキャメルに変換
(defun yas-util-lower-to-upper-camel(text)
  (if (/= (length text) 0)
      (concat
       (upcase
        (char-to-string
         (car (string-to-list text))))
       (coerce
        (cdr (string-to-list text))
        'string))
    text))


;;パスからクラス名を取得
(defun yas-util-get-class-from-module(text sep)
  (if (string-match (concat "\\" sep) text) (car (last (split-string text (concat "\\" sep)))) text))


;;現在の位置から最も近いコンストラクタ名を取得
(defun yas-util-get-last-constructor()
  "Return the most closest constructor"
  (save-excursion
    (progn
      (let* ((case-fold (setq case-fold-search nil))
             (match "")
             (regexp-list '(("\\(exports\\.\\([A-Z][a-zA-Z0-9$_]*\\)\\)" "exports")
                            ("\\(@constructor\\)" "constructor")
                            ("\\(@interface\\)" "interface")
                            ("\\(@struct\\)" "struct")
                            ("\\(@dict\\)" "dict")
                            ("\\(@enum\\)" "enum")))
             (p (point)))
        
        (defun collect-point(regexp-list)
          (if (= (length regexp-list) 0)
              '()
            (progn
              (goto-char p)
              (let* ((regexp-pair (car regexp-list))
                     (regexp (car regexp-pair)))
                (if (re-search-backward regexp nil t)
                    (cons (cons (count-lines 1 (point)) regexp-pair) (collect-point (cdr regexp-list)))
                  (collect-point (cdr regexp-list)))))))

        (defun find-min(pos-list)
          (if (= (length pos-list) 1)
              (car pos-list)
            (let* ((pos (car pos-list))
                   (rest (cdr pos-list))
                   (min (find-min rest)))
              (if (> (car pos) (car min)) 
                  pos
                min))))
        
        (let* ((regexp-item (find-min (collect-point regexp-list)))
               (regexp (car (cdr regexp-item)))
               (symbol (car (cdr (cdr regexp-item)))))
          (goto-char p)
          (re-search-backward regexp nil t)
          (re-search-forward "\\*\\/" nil t)
          (progn
            (if (equal symbol "exports")
                (re-search-forward "\\(exports\\.[a-zA-Z0-9$_.]+?\\s-*\\(?:\\.prototype\\|=\\))" nil t)
              (re-search-forward "\\(?:function\\s-+?\\|var\\s-+?\\)?\\([a-zA-Z0-9$_.]+\\)"))
            (setq case-fold-search case-fold)
            (setq case-fold case-fold-search))
          (match-string 1))))))
