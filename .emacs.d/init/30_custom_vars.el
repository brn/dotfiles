(global-set-key [?\C-;] 'jump-to-file)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-hanging-braces-alist (quote set-from-style))
 '(c-hanging-semi&comma-criteria (quote set-from-style))
 '(c-report-syntactic-errors t)
 '(indent-tabs-mode nil)
 '(typescript-indent-level 2)
 '(nxml-attribute-indent 4)
 '(nxml-child-indent 4)
 '(nxml-outline-child-indent 4)
 '(sgml-basic-offset 4)
 '(speedbar-show-unknown-files t)
 '(speedbar-tag-hierarchy-method (quote (speedbar-prefix-group-tag-hierarchy spe edbar-trim-words-tag-hierarchy speedbar-simple-group-tag-hierarchy speedbar-sort -tag-hierarchy)))
 '(sr-speedbar-auto-refresh t)
 '(sr-speedbar-max-width 200)
 '(sr-speedbar-width 60 t)
 '(sr-speedbar-width-console 150))
 '(speedbar-add-supported-extension '(".js" ".as" ".html" ".css" ".php"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "outline" :family "Bitstream Vera Sans Mono"))))
 '(dired-symlink ((t (:foreground "brightblue"))))
 '(font-lock-builtin-face ((((class color) (min-colors 88) (background dark)) (:foreground "#0000ff"))))
 '(font-lock-function-name-face ((t (:foreground "#66ff00"))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "#22aaff" :weight bold))))
 '(hi-blue-b ((((min-colors 88)) (:foreground "brightblue" :weight bold))))
 '(js2-instance-member-face ((t (:foreground "green"))))
 '(link ((((class color) (min-colors 88) (background light)) (:foreground "green
" :underline t))))
 '(minibuffer-prompt ((t (:foreground "yellow"))))
 '(speedbar-directory-face ((((class color) (background light)) (:foreground "yellow"))))
 '(vhdl-speedbar-architecture-selected-face ((((min-colors 88) (class color) (background light)) (:foreground "brightblue" :underline t)))))

(setq-default line-spacing 2)



;;windowsの際のフォントサイズ修正
(if (os-type-is-win?)
    (progn
      (create-fontset-from-ascii-font "-apple-Bitstream_Vera_Sans_Mono-medium-normal-normal-*-10-*-*-*-m-0-iso10646-1" nil "BitstreamMarugo")
      (set-frame-font "fontset-bitstreammarugo")
      (set-fontset-font (frame-parameter nil 'font)
                        'unicode
                        (font-spec :family "A-OTF Shin Go Pro" :size 8)
                        nil
                        'append)))

(if (os-type-is-mac?)
    (progn
      (create-fontset-from-ascii-font "-apple-Bitstream_Vera_Sans_Mono-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1" nil "BitstreamMarugo")
      (set-frame-font "fontset-bitstreammarugo")
      (set-fontset-font (frame-parameter nil 'font)
                        'unicode
                        (font-spec :family "A-OTF Shin Go Pro" :size 10)
                        nil
                        'append)))

(setq face-font-rescale-alist '(("A-OTF.*" . 1.2)))
