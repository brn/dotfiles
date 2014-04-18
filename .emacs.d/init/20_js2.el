;; js2-mode
(add-to-list 'auto-mode-alist '(".js$" . js2-mode))
(add-to-list 'auto-mode-alist '(".mayaa$" . xml-mode))
(add-to-list 'auto-mode-alist '(".as$" . javascript-mode))

(js2r-add-keybindings-with-prefix "C-c C-m")

(custom-set-variables
'(js2-strict-missing-semi-warning t)
'(js2-mirror-mode t)
'(js2-always-indent-assigned-expr-in-decls-p t)
'(js2-auto-indent-p t)
'(js2-basic-offset 2)
'(js2-bounce-indent-p nil)
'(js2-cleanup-whitespace t)
'(js2-consistent-level-indent-inner-bracket-p t)
'(js2-dynamic-idle-timer-adjust 2)
'(js2-enter-indents-newline t)
'(js2-global-externs t)
'(js2-highlight-level 3)
'(js2-idle-timer-delay 0)
'(js2-indent-on-enter-key t)
'(js2-missing-semi-one-line-override t)
'(js2-rebind-eol-bol-keys nil)
'(js2-skip-preprocessor-directives nil)
'(js2-strict-inconsistent-return-warning nil)
'(js2-use-ast-for-indentation-p t)
'(js2-auto-insert-semicolon t)
'(js2-allow-keywords-as-property-names t))

(add-hook 'js2-mode-hook
          '(lambda ()
             (local-set-key "\C-ci" 'js-doc-insert-function-doc)
             (local-set-key "\C-c@" 'js-doc-insert-tag)
             (local-set-key "\C-cf" 'js-doc-insert-file-doc)
             (local-set-key (kbd "RET") (key-binding (kbd "M-j")))
             (setq js2-additional-externs '("jQuery" "$" "goog" "ko" "camp" "describe" "it" "before" "beforeEach" "after" "afterEach" "assert" "cats"))
             (setq javascript-indent-level 2
                   javascript-expr-indent-offset 2
                   indent-tabs-mode nil)
             )
          )
