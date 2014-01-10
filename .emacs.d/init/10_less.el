(require 'less-mode)
(add-to-list 'auto-mode-alist '("\\.less$" . less-mode))
(add-hook 'css-mode-hook
              (lambda ()
                (setq css-indent-offset 2)
                (define-key css-mode-map "{" 'brace-ret-brace)
                ))
