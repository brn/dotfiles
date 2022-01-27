(use-package coffee-mode
  :ensure t
  :config
  (autoload 'js2-mode "coffee-mode" nil t)
  (add-to-list 'auto-mode-alist '(".coffee$" . coffee-mode)))
