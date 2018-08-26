;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                            
;; GNU GLOBAL(gtags)                                                             
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                            
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         ))
(add-hook 'java-mode-hook (lambda () (gtags-mode 1))) 
(add-hook 'c-mode-hook (lambda () (gtags-mode 1))) 
;(add-hook 'c++-mode-hook (lambda () (gtags-mode 1))) 
