(use-package foreign-regexp
  :ensure t
  :config
  (custom-set-variables
   ;; 正規表現、perlかrubyを選択
   '(foreign-regexp/regexp-type 'javascript) ;; Choose by your preference.
   '(reb-re-syntax 'foreign-regexp)) ;; Tell re-builder to use foreign regexp.
  )
