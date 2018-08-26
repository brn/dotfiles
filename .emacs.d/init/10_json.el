(setq js-indent-level 2)
(add-hook 'json-mode-hook
          (lambda ()
            (prettier-js-mode)
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))
