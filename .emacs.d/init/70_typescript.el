(defun typescript-mode-hooks ()
  (interactive)
  (prettier-js-mode)
  (local-set-key "\C-c\C-l" 'align-=)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (flycheck-mode +1)
  (eldoc-mode +1)
  (local-set-key (kbd "C-c C-j") 'avy-goto-char-timer)
  (local-set-key (kbd "C-c C-l") 'avy-goto-line)
  (company-mode)
  (lsp-mode-hooks t))

(use-package typescript-mode
  :ensure t
  :config
  ;; sample config
  (add-hook 'typescript-mode-hook 'typescript-mode-hooks))
