(let ((default-directory (expand-file-name "~/.emacs.d/elisps")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
  (delete-selection-mode t)
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir path-separator (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))

(coding-system-put 'utf-8 'category 'utf-8)
(set-language-info
 "Japanese"
 'coding-priority (cons 'utf-8
                        (get-language-info "Japanese" 'coding-priority)))
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(require 'coffee-mode)
(require 'anything-startup)
(require 'anything-config)
(require 'auto-complete)
(require 'auto-install)
(require 'google-c-style)
(require 'js-doc)
(require 'textile-mode)
(require 'init-loader)
(init-loader-load "~/.emacs.d/init/cmp")
(require 'moccur-edit)

(setq js2-strict-missing-semi-warning nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-hanging-braces-alist (quote set-from-style))
 '(c-hanging-semi&comma-criteria (quote set-from-style))
 '(c-report-syntactic-errors t)
 '(indent-tabs-mode nil)
 '(js-doc-author "Taketshi Aono")
 '(js-doc-url "your url")
 '(js-indent-level 2)
 '(js2-always-indent-assigned-expr-in-decls-p t)
 '(js2-auto-indent-p t)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p nil)
 '(js2-cleanup-whitespace t)
 '(js2-consistent-level-indent-inner-bracket-p t)
 '(js2-dynamic-idle-timer-adjust 2)
 '(js2-enter-indents-newline t)
 '(js2-global-externs t)
 '(js2-highlight-level 3)
 '(js2-idle-timer-delay 0)
 '(js2-indent-on-enter-key t)
 '(js2-missing-semi-one-line-override t)
 '(js2-rebind-eol-bol-keys nil)
 '(js2-skip-preprocessor-directives t)
 '(js2-strict-inconsistent-return-warning nil)
 '(js2-use-ast-for-indentation-p t)
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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "apple" :family "Monaco"))))
 '(dired-symlink ((t (:foreground "brightblue"))))
 '(font-lock-builtin-face ((t (:foreground "#3479ff"))))
 '(font-lock-function-name-face ((t (:foreground "#66ff00"))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "#22aaff" :weight bold))))
 '(hi-blue-b ((((min-colors 88)) (:foreground "brightblue" :weight bold))))
 '(js2-instance-member-face ((t (:foreground "green"))))
 '(link ((((class color) (min-colors 88) (background light)) (:foreground "green
" :underline t))))
 '(minibuffer-prompt ((t (:foreground "yellow"))))
 '(speedbar-directory-face ((((class color) (background light)) (:foreground "yellow"))))
 '(vhdl-speedbar-architecture-selected-face ((((min-colors 88) (class color) (background light)) (:foreground "brightblue" :underline t)))))
