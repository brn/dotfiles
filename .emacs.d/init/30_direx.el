(use-package direx
  :ensure t
  :config
  (use-package direx-project
    :config
    (custom-set-variables
     '(direx-project:project-root-predicate-functions (quote (my/direx-root-p)))))
  (use-package cl
    :config
    (defun my/direx-root-p (dirname)
      (loop for vc-dir in '(".git" ".hg" ".bzr" ".metadata")
            thereis (file-exists-p (expand-file-name vc-dir dirname))))

    (defun my/dired-jump ()
      (interactive)
      (cond (current-prefix-arg
             (dired-jump))
            ((not (one-window-p))
             (or (ignore-errors
                   (direx-project:jump-to-project-root-other-window) t)
                 (direx:jump-to-directory-other-window)))
            (t
             (or (ignore-errors
                   (direx-project:jump-to-project-root-other-window) t)
                 (direx:jump-to-directory-other-window)))))

    (setq direx:leaf-icon "  "
          direx:open-icon "▾ "
          direx:closed-icon "▸ ")
    (push '(direx:direx-mode :position left :width 100 :dedicated t)
          popwin:special-display-config)

    (global-set-key (kbd "C-q") 'my/dired-jump)))
