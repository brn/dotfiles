(defun emacs-lisp-mode-hooks ()
  (company-mode)
  (add-hook 'after-save-hook 'emacs-lisp-native-compile-and-load))
(use-package auto-async-byte-compile
             :ensure t
             :config
             (setq auto-async-byte-compile-init-file "~/.emacs.d/init.el")
             (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
             (add-hook 'emacs-lisp-mode-hook 'emacs-lisp-mode-hooks))
