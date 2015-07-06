;; (eval-after-load 'linum
;;   '(progn
;;      (defface linum-leading-zero
;;        `((t :inherit 'linum
;;             :foreground ,(face-attribute 'linum :background nil t)))
;;        "Face for displaying leading zeroes for line numbers in display margin."
;;        :group 'linum)
     
;;      (defvar my-linum-max-length)

;;      (add-hook 'linum-before-numbering-hook 'my-linum-get-format-string)

;;      (defun my-linum-get-format-string ()
;;        (let* ((width (length (number-to-string
;;                               (count-lines (point-min) (point-max)))))
;;               (format (concat "%" (number-to-string width) "d")))
;;          (setq my-linum-max-length width)))

;;      (defun my-linum-format (line-number)
;;        (concat
;;         (propertize (make-string (- my-linum-max-length (length (number-to-string line-number))) ?0)
;;                     'face 'linum-leading-zero)
;;         (propertize (number-to-string line-number) 'face 'linum)))

;;      (setq linum-format 'my-linum-format)))
