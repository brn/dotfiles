(use-package irony
  :ensure t
  :config
  (custom-set-variables '(irony-additional-clang-options '("-std=c++17" "-stdlib=libc++" "-DPLATFORM_64BIT")))
  (add-to-list 'company-backends 'company-irony)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (unless (and buffer-file-name (file-remote-p buffer-file-name))
    (add-hook 'c-mode-common-hook 'irony-mode))
  (use-package flycheck-irony
    :ensure t
    :config
    (flycheck-irony-setup)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)))
