;; flycheck mode

(add-hook 'flycheck-mode-hook 'flycheck-popup-tip-mode)

(custom-set-variables
 '(flycheck-popup-tip-error-prefix "* ")
 ;; エラーをポップアップで表示
 ;; '(flycheck-display-errors-function
 ;;   (lambda (errors)
 ;;     (let ((messages (mapcar #'flycheck-error-message errors)))
 ;;       (popup-tip (mapconcat 'identity messages "\n")))))
 '(flycheck-display-errors-delay 0.5)
 '(flycheck-highlighting-mode 'lines))

(define-key flycheck-mode-map (kbd "C-M-n") 'flycheck-next-error)
(define-key flycheck-mode-map (kbd "C-M-p") 'flycheck-previous-error)
(add-hook 'c-mode-common-hook 'flycheck-mode)
