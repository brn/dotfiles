(setq multi-term-program shell-file-name)
(add-hook 'term-mode-hook
          '(lambda ()
                   (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
                   (define-key term-raw-map (kbd "C-y") 'term-paste)
                   ))
