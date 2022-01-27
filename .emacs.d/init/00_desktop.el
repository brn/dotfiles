(if (not (daemonp))
    (use-package desktop
      :config
      (push '(company-posframe-mode . nil)
            desktop-minor-mode-table)))
