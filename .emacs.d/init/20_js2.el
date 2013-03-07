;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '(".js$" . js2-mode))
(add-to-list 'auto-mode-alist '(".mayaa$" . xml-mode))
(add-to-list 'auto-mode-alist '(".as$" . javascript-mode))
(setq js2-strict-missing-semi-warning t)
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
