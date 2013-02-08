;; js2-mode
(autoload 'js-mode "js")
(require 'js)
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '(".js$" . js2-mode))
(add-to-list 'auto-mode-alist '(".mayaa$" . xml-mode))
(add-to-list 'auto-mode-alist '(".as$" . javascript-mode))
(setq js2-strict-missing-semi-warning nil)
(add-hook 'js2-mode-hook
          '(lambda ()
             (local-set-key "\C-ci" 'js-doc-insert-function-doc)
             (local-set-key "\C-c@" 'js-doc-insert-tag)
             (local-set-key "\C-cf" 'js-doc-insert-file-doc)
             (setq js2-additional-externs '("jQuery"))
             (setq js2-additional-externs '("$"))
             (setq js2-additional-externs '("goog"))
             (setq js2-additional-externs '("ko"))
             (setq js2-additional-externs '("camp"))
             (setq javascript-indent-level 2
                   javascript-expr-indent-offset 2
                   indent-tabs-mode nil)
             )
          )

;; (defun my-js-indent-line-function ()
;;   (save-restriction
;;     (widen)
;;     (interactive)
;;     (let* ((inhibit-point-motion-hooks t)
;;            (parse-status (save-excursion (syntax-ppss (point-at-bol))))
;;            (offset (- (current-column) (current-indentation)))
;;            (indentation (js-proper-indentation parse-status))
;;            node)
;;       (save-excursion
;;         ;; I like to indent case and labels to half of the tab width
;;         (back-to-indentation)
;;         (if (looking-at "case\\s-")
;;             (indent-line-to (+ indentation (/ js-indent-level 2))))
;;         (when (> offset 0) (forward-char offset))
;;         )
;;       )
;;     )
;;   )
;; (set (make-local-variable 'indent-line-function) 'my-js-indent-line-function)
