(defun yas-util-upper-to-lower-camel(text)
  (if (/= (length text) 0)
      (concat
       (downcase 
        (char-to-string
         (car (string-to-list text))))
       (coerce
        (cdr (string-to-list text))
        'string))
    text))
