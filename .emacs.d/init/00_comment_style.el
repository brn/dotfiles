(setq comment-style 'multi-line)

(defun java-doc-like ()
  (interactive)
  (save-excursion
    (insert "/**") (indent-for-tab-command) (newline-and-indent)
    (insert "*") (indent-for-tab-command) (newline-and-indent)
    (insert "*/") (indent-for-tab-command)
    )
  (next-line)
  (indent-for-tab-command) (forward-char 1) (insert " ")
  )

