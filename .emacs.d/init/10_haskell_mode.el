(defun haskell-mode-delete-key ()
  "delete key binding for haskell-mode"
  (setq delete-selection-mode t)
  )

(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))
(if (os-type-is-mac?) (setq haskell-program-name "/usr/bin/ghci"))
(if (os-type-is-win?) (setq haskell-program-name "ghci"))
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'haskell-mode-delete-key)
(add-hook 'haskell-mode-hook (lambda () (set-input-method "haskell-unicode")))
(setq haskell-program-name "/usr/local/bin/ghci")
