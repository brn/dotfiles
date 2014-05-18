(autoload 'haskell-mode "haskell-mode")
(autoload 'haskell-cabal "haskell-cabal")
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))
(if (os-type-is-mac?) (setq haskell-program-name "/usr/bin/ghci"))
(if (os-type-is-win?) (setq haskell-program-name "ghci"))
  
