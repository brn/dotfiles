(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(require 'auto-complete-config)
(ac-config-default)

;;auto-completeを有効
(global-auto-complete-mode t)
;;3文字以上で補完
(setq ac-auto-start 3)
;;C-TABで補完開始
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
