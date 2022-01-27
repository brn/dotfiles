(use-package json-mode
  :ensure t
  :config
  (setq js-indent-level 2)
  (defun json-mode-hooks ()
    (prettier-js-mode)
    (make-local-variable 'js-indent-level)
    (setq js-indent-level 2))
  (add-hook 'json-mode-hook 'json-mode-hooks))
