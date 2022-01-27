(use-package magit
  :ensure t
  :config
  (remove-hook 'server-switch-hook 'magit-commit-diff))
