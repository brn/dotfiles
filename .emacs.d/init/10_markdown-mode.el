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


(defun w3m-browse-url-other-window (url &optional newwin)
  (let ((w3m-pop-up-windows t))
    (if (one-window-p) (split-window))
    (other-window 1)
    (w3m-browse-url url newwin)))

(defun markdown-render-w3m (n)
  (interactive "p")
  (message (buffer-file-name))
  (call-process "/usr/local/bin/grip" nil nil nil
                "--gfm" "--export"
                (buffer-file-name)
                "/tmp/grip.html")
  (w3m-browse-url-other-window "file:///tmp/grip.html")
  )


(add-hook 'markdown-mode-hook '(lambda() 
                                 (local-set-key "\C-c\C-ah" 'markdown-insert-hash-link)
                                 (local-set-key "\C-c\C-ak" 'markdown-insert-hook-link)
                                 (local-set-key "\C-c\C-ap" 'markdown-render-w3m)
                                 (markdown-custom)
                                 ))
