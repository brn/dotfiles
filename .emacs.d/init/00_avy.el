(use-package avy
  :ensure t 
  :config
  (global-set-key (kbd "C-c C-j") 'avy-goto-char-timer)
  (global-set-key (kbd "C-c C-l") 'avy-goto-line))
