;;現在の位置からファイル名を取得、バッファ入れ替え
(defun jump-to-file()
  (interactive)
  (save-excursion
    (let ((ext (let (ext pos)
                 (message "%s" (string-match "\\.[a-z]+$" buffer-file-name))
                 (setq pos (string-match "\\.[a-z]$" buffer-file-name))
                 (setq ext (substring buffer-file-name (match-beginning 0) (match-end 0)))
                 (if (> (length ext) 0)
                     ext ""))))
      (let ((case-fold (setq case-fold-search nil))
            (match ""))
        (if (re-search-backward "[\s'\"]" nil t)
            (let (match fullpath)
              (forward-char 1)
              (if (looking-at "[a-zA-Z./\\-$_][a-zA-Z./\\-0-9$_]+")
                  (progn
                    (setq match (expand-file-name (match-string 0)))
                    (if (> (length match) 2)
                        (progn
                          (setq fullpath
                                (if (null (string-match (concat ext "$") match))
                                    (concat match ext)
                                  match))
                          (setq case-fold-search case-fold)
                          (if (file-exists-p fullpath)
                              (find-file fullpath)
                            (message "ENOENT %s is not a file." fullpath)))))))
          (progn
            (setq case-fold case-fold-search)))
        match))))
