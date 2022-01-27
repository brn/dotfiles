(global-set-key [?\C-;] 'jump-to-file)
(global-set-key (kbd "C-c C-;") 'insert-file-name)
(global-set-key "\C-c\C-u" 'insert-uuid-4)
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
 '(sr-speedbar-width-console 150)
 '(speedbar-add-supported-extension '(".js" ".as" ".html" ".css" ".php"))
 '(reb-re-syntax 'foreign-regexp)
 '(direx-project:project-root-predicate-functions '(my/direx-root-p))
 '(haskell-font-lock-symbols t)
 `(rtags-tramp-enabled t)
 `(clang-format-style "Google")
 `(company-lsp-cache-candidates nil)
 `(company-lsp-async t)
 `(company-lsp-enable-recompletion t)
 `(company-lsp-enable-snippet t)
 )

(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal))))
 '(font-lock-builtin-face ((t (:bold t :foreground "#00AAFF"))))
 '(dired-symlink ((t (:foreground "#00AAFF"))))
 '(font-lock-function-name-face ((t (:foreground "#66ff00"))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "#22aaff" :weight bold))))
 '(hi-blue-b ((((min-colors 88)) (:foreground "#00AAFF" :weight bold))))
 '(js2-instance-member-face ((t (:foreground "green"))))
 '(link ((((class color) (min-colors 88) (background light)) (:foreground "green" :underline t))))
 '(minibuffer-prompt ((t (:foreground "yellow"))))
 '(speedbar-directory-face ((((class color) (background light)) (:foreground "yellow"))))
 '(helm-ff-file ((t (:inherit font-lock-builtin-face :foreground "#FFFFFF"))))
 '(helm-ff-directory ((t (:inherit font-lock-builtin-face :foreground "#0099FF"))))
 '(vhdl-speedbar-architecture-selected-face ((((min-colors 88) (class color) (background light)) (:foreground "#00AAFF" :underline t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minibuffer-prompt ((t (:foreground "#00AAFF")))))

(setq-default line-spacing 2)

;;macの際のフォントサイズ修正
(if (or (eq window-system 'mac) (eq window-system 'ns))
    (if (os-type-is-mac?)
        (let* ((fontset-name "dejavumarugo")
               (jp-fontspec (font-spec :family "Hiragino Kaku Gothic ProN"))
               (fsn (create-fontset-from-ascii-font "-*-DejaVu Sans Mono-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1" nil fontset-name)))
          (set-fontset-font fsn 'japanese-jisx0213.2004-1 jp-fontspec)
          (set-fontset-font fsn 'japanese-jisx0213-2 jp-fontspec)
          (set-fontset-font fsn 'katakana-jisx0201 jp-fontspec)
          (add-to-list 'default-frame-alist '(font . "fontset-dejavumarugo"))
          (setq face-font-rescale-alist
                '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2)))
          (set-face-font 'default "fontset-dejavumarugo"))
      (let* ((fontset-name "dejavumarugo")
             (jp-fontspec (font-spec :family "A-OTF Shin Maru Go Pro" :size 10))
             (fsn (create-fontset-from-ascii-font "-outline-DejaVu Sans Mono-medium-normal-normal-mono-12-*-*-*-c-*-iso10646-1" nil fontset-name)))
        (set-fontset-font fsn 'japanese-jisx0213.2004-1 jp-fontspec)
        (set-fontset-font fsn 'japanese-jisx0213-2 jp-fontspec)
        (set-fontset-font fsn 'katakana-jisx0201 jp-fontspec)
        (add-to-list 'default-frame-alist '(font . "fontset-dejavumarugo"))
        (setq face-font-rescale-alist
              '((".*A-OTF.*" . 1.2)))
        (set-face-font 'default "fontset-dejavumarugo"))))
