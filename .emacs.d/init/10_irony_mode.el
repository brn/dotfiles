(eval-after-load "irony"
  '(progn
     (custom-set-variables '(irony-additional-clang-options '("-std=c++1y" "-stdlib=libc++" "-DPLATFORM_64BIT")))
     (add-to-list 'company-backends 'company-irony)
     (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
     (unless (and buffer-file-name (file-remote-p buffer-file-name))
                   (add-hook 'c-mode-common-hook 'irony-mode))))

(eval-after-load "flycheck"
  '(progn
     (when (locate-library "flycheck-irony")
       (flycheck-irony-setup))))

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
