(defun sh-mode-indent ()
  (interactive)
  (setq sh-indentation 2
        sh-basic-offset 2
        sh-indent-for-case-label 0
        sh-indent-for-case-label 0
        sh-indent-for-case-alt '+))

(add-hook 'sh-mode-hook 'sh-mode-indent)
