(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; insert [aaa](#aaa)
(defun markdown-insert-hash-link()
  (interactive)
  (let ((cw (current-word)))
    (markdown-insert-link)
    (insert (concat "#" cw))
    ))

(defun markdown-insert-hook-link()
  (interactive)
  (let ((cw (current-word)))
    (backward-word)
    (insert (concat (concat "<a name=\"" cw) "\"> "))
    ))


(defun markdown-custom ()
  "markdown-mode-hook"
  (setq markdown-command-needs-filename t)
  )


(add-hook 'markdown-mode-hook '(lambda() 
                                 (local-set-key "\C-c\C-ah" 'markdown-insert-hash-link)
                                 (local-set-key "\C-c\C-ak" 'markdown-insert-hook-link)
                                 (markdown-custom)
                                 ))
