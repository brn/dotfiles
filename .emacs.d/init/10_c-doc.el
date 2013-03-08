(custom-set-variables
 '(c-doc-mail-address "dobaw20@gmail.com")
 '(c-doc-author (format "Taketoshi Aono <%s>" c-doc-mail-address)))
(add-hook 'c-mode-common-hook
          '(lambda ()
             (local-set-key "\C-ci" 'c-doc-insert)))
