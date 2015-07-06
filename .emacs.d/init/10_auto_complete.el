(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)

;;auto-completeを有効
(global-auto-complete-mode t)
;;3文字以上で補完
(setq ac-auto-start 3)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-completing-map (kbd "<tab>") nil)
(define-key ac-completing-map (kbd "M-/")   'ac-stop)
(define-key ac-completing-map (kbd "RET") nil) ; return での補完禁止
;; 補完が自動で起動するのを停止

(setq ac-use-menu-map t)       ;; 補完メニュー表示時にC-n/C-pで補完候補選択
(setq ac-use-fuzzy t)          ;; 曖昧マッチ

(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")
