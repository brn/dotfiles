;;camp.moduleのパス自動補完機能
(defun get-module-path()
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
