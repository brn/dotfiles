
(defun brace-ret-brace ()
  (interactive)
  (save-excursion
    (insert "{") (newline-and-indent)
    (newline-and-indent)
    (insert "}") (indent-for-tab-command)
    )
  (next-line)
  (indent-for-tab-command)
  )
