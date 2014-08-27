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

(custom-set-variables
 '(powerline-height 20)
 '(powerline-default-separator 'slant)
)
