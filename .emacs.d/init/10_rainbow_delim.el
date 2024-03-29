(use-package rainbow-delimiters
  :ensure t
  :config
  (use-package cl-lib
    :ensure t
    :config
    (use-package color
      :ensure t
      :config
;      (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
      (defun rainbow-delimiters-using-stronger-colors ()
        (interactive)
        (cl-loop
         for index from 1 to rainbow-delimiters-max-face-count
         do
         (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
           (cl-callf color-saturate-name (face-foreground face) 30))))
      (add-hook 'emacs-startup-hook 'rainbow-delimiters-using-stronger-colors))))
