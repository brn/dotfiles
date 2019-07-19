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

(flycheck-define-checker c/c++
  "A C/C++ checker using clang++."
  :command ("clang++" "-std=c++1y" "-Wall" "-Wextra" "-fsyntax-only" "-DPLATFORM_64BIT" source)
  :error-patterns  ((error line-start
                           (file-name) ":" line ":" column ":" " Error: " (message)
                           line-end)
                    (warning line-start
                           (file-name) ":" line ":" column ":" " Warnings: " (message)
                           line-end))
  :modes (c-mode c++-mode))

(define-key flycheck-mode-map (kbd "C-M-n") 'flycheck-next-error)
(define-key flycheck-mode-map (kbd "C-M-p") 'flycheck-previous-error)
(add-hook 'c-mode-common-hook 'flycheck-mode)
