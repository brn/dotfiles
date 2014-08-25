(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)

;;auto-completeを有効
(global-auto-complete-mode t)
;;3文字以上で補完
(setq ac-auto-start 3)
;;C-TABで補完開始
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(define-key ac-menu-map (kbd "C-n")         'ac-next)
(define-key ac-menu-map (kbd "C-p")         'ac-previous)
(define-key ac-completing-map (kbd "<tab>") 'nil)
(define-key ac-completing-map (kbd "M-/")   'ac-stop)
(define-key ac-completing-map (kbd "RET") nil) ; return での補完禁止
