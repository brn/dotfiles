;;; -*- coding: utf-8; lexical-binding: t -*-


;; 現在のバッファから拡張子を抜きだす
(defun extname-from-current-buffer()
  "Extract extname from `buffer-file-name`"
  (extname-from buffer-file-name nil)
)


(defun extname-from(filepath nil?)
  "Extract extname from file path"
  (let (ext pos)
    (setq pos (string-match "\\.[a-z]+$" filepath))
    (if pos
        (setq ext (substring filepath (match-beginning 0) (match-end 0)))
      (setq ext (if nil nil ""))
    ext)))


;; 現在の位置からファイル名を取得、バッファ入れ替え
(defun do-jum-to-file()
  "Extract file path and jump to that."
  (let ((ext (extname-from-current-buffer)) success)
       (let ((case-fold (setq case-fold-search nil))
             (match ""))
         (save-excursion
           (if (re-search-backward "[\s'\"]" nil t)
               (let (match fullpath)
                 (forward-char 1)
                 (if (looking-at "[a-zA-Z./\\-$_][a-zA-Z./\\-0-9$_]+")
                     (progn
                       (setq match (expand-file-name (match-string 0)))
                       (if (> (length match) 2)
                           (progn
                             (setq fullpath
                                   (if (null (extname-from match t))
                                       (concat match ext)
                                     match))
                             (setq case-fold-search case-fold)
                             (if (file-exists-p fullpath)
                                 (find-file fullpath)
                               (message "ENOENT %s is not a file." fullpath)))))))
             (progn
               (setq case-fold case-fold-search)
               (setq success nil)))))
       success))


;; 現在の位置からファイル名を取得、バッファ入れ替え
(defun jump-to-file()
  (interactive)
  (save-excursion (do-jum-to-file)))


;; 現在の位置に選択されたファイル名を相対パスで挿入する
(defun insert-file-name()
  "Insert the file path which is specified through the `anything-find-file`."
  (interactive)
  (let ((file-name buffer-file-name) set-current-dot target-filename (target (car (anything-find-file))))
    (if target
        (progn
          (setq target-filename (file-relative-name target (file-name-directory file-name)))
          (setq set-current-dot (string= (file-name-directory target-filename) (file-name-directory file-name)))
          (message "%s" set-current-dot)
          (anything-run-after-quit
           '(lambda(target-filename file-name set-current-dot)
              (find-file file-name)
              (if set-current-dot
                  (insert (concat "./" target-filename))
                (insert target-filename))
              ) target-filename file-name set-current-dot)))))
