(use-package powerline
  :ensure t
  :config
  (powerline-default-theme)

  (set-face-attribute 'mode-line nil
                      :foreground "#000"
                      :background "#FFCC33"
                      :box t)

  (set-face-attribute 'powerline-active1 nil
                      :foreground "#000"
                      :background "#0099FF"
                      :inherit 'mode-line)

  (set-face-attribute 'powerline-active2 nil
                      :foreground "#000"
                      :background "#555"
                      :inherit 'mode-line)
  (add-hook 'desktop-after-read-hook 'powerline-reset)
  :custom
  (powerline-height 20)
  (powerline-default-separator 'slant)
  (powerline-default-separator (quote slant))
  (powerline-height 20))
