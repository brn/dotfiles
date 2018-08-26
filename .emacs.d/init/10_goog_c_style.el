;; google-c-style
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(setq c-auto-newline nil)
(add-hook 'c-mode-common-hook 'flymake-google-cpplint-load)

(custom-set-variables
 '(flymake-google-cpplint-command "~/GitHub/styleguide/cpplint/cpplint.py"))
