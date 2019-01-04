(let ((default-directory (expand-file-name "~/.emacs.d/elisps")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
       (normal-top-level-add-subdirs-to-load-path)))

(let ((default-directory (expand-file-name "~/.emacs.d/elpa")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'package)

(setq package-check-signature nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(require 'cl)

(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    init-loader
    helm 
    auto-complete
    actionscript-mode
    color-moccur
    nodejs-repl
    log4e
    powershell-mode
    coffee-mode
    exec-path-from-shell
    multiple-cursors
    zencoding-mode
    yasnippet
    dash
    js-doc
    js2-mode
    js2-refactor
    markdown-mode
    popup
    json-mode
    google-c-style
    yaml-mode
    open-junk-file
    haskell-mode
    pretty-symbols
    mark-multiple
    powerline
;    jaunte
    gtags
    foreign-regexp
    popwin
    direx
    company
    clojure-mode
    cider
    ac-cider
    clojure-cheatsheet
    slamhound
    smartparens
    rainbow-delimiters
    w3m
    web-mode
    tide
    edbi
    magit
    avy
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))

(require 'tramp)
(require 'flycheck)
(require 'flycheck-popup-tip)
(require 'helm-config)
(require 'haskell-unicode-input-method)
(require 'powerline)
(require 'exec-path-from-shell)
(require 'coffee-mode)
(require 'auto-complete)
(require 'auto-complete-config)
(require 'company)
(require 'ac-company)
(require 'typescript)
(require 'less-mode)
(ac-config-default)
(setq ac-auto-start 3)
(require 'auto-install)
(require 'google-c-style)
(require 'zencoding-mode)
(require 'textile-mode)
(require 'yasnippet)
(require 'js2-mode)
(require 'js2-refactor)
(require 'init-loader)
(require 'c-doc)
(require 'color-moccur)
(require 'powershell-mode)
(require 'log4e)
(require 'yaxception)
(require 'uuid)
(require 'ftl)
(require 'haskell-mode)
(require 'haskell-cabal)
(require 'inline-string-rectangle)
(require 'mark-more-like-this)
;(require 'jaunte)
(require 'flymake-google-cpplint)
(require 'irony)
(require 'foreign-regexp)
(require 'popwin)
(require 'direx)
(require 'direx-project)
(require 'ac-clang)
(require 'whitespace)
(require 'tern)
(require 'w3m)
(require 'web-mode)
(require 'edbi)
(require 'magit)
(require 'edbi)
(init-loader-load "~/.emacs.d/init/cmp")
(require 'js-doc)
(require 'moccur-edit)
(require 'scala-mode2)
(require 'tide)
(require 'avy)
(require 'prettier-js)
(require 'rtags)
(require 'helm-rtags)
(require 'clang-format)
(setq debug-on-error nil)
(smartparens-global-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-doc-author (format "Taketoshi Aono <%s>" c-doc-mail-address))
 '(c-doc-mail-address "dobaw20@gmail.com")
 '(c-hanging-braces-alist (quote set-from-style))
 '(c-hanging-semi&comma-criteria (quote set-from-style))
 '(c-report-syntactic-errors t)
 '(clang-format-style "Google")
 '(direx-project:project-root-predicate-functions (quote (my/direx-root-p)))
 '(flycheck-display-errors-delay 0.5)
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(flycheck-highlighting-mode (quote lines))
 '(flycheck-popup-tip-error-prefix "* ")
 '(flymake-google-cpplint-command "~/GitHub/styleguide/cpplint/cpplint.py")
 '(foreign-regexp/regexp-type (quote javascript))
 '(haskell-font-lock-symbols t)
 '(indent-tabs-mode nil)
 '(irony-additional-clang-options (quote ("-std=c++1y" "-stdlib=libc++" "-DPLATFORM_64BIT")))
 '(js-indent-level 2)
 '(js2-allow-keywords-as-property-names t)
 '(js2-always-indent-assigned-expr-in-decls-p t)
 '(js2-auto-indent-p t)
 '(js2-auto-insert-semicolon t)
 '(js2-bounce-indent-p nil)
 '(js2-cleanup-whitespace t)
 '(js2-consistent-level-indent-inner-bracket-p t)
 '(js2-dynamic-idle-timer-adjust 2)
 '(js2-enter-indents-newline t)
 '(js2-global-externs t)
 '(js2-highlight-level 3)
 '(js2-idle-timer-delay 0)
 '(js2-indent-on-enter-key t)
 '(js2-mirror-mode t)
 '(js2-missing-semi-one-line-override t)
 '(js2-rebind-eol-bol-keys nil)
 '(js2-skip-preprocessor-directives nil)
 '(js2-strict-inconsistent-return-warning nil)
 '(js2-strict-missing-semi-warning t)
 '(js2-strict-trailing-comma-warning nil)
 '(js2-use-ast-for-indentation-p t)
 '(nxml-attribute-indent 4)
 '(nxml-child-indent 4)
 '(nxml-outline-child-indent 4)
 '(package-selected-packages
   (quote
    (js2-refactor js2-mode highlight2clipboard python-mode zencoding-mode yaml-mode w3m tss slamhound rainbow-delimiters racer pretty-symbols powershell-mode powerline popwin open-junk-file nodejs-repl markdown-mode mark-multiple magit js-doc jaunte init-loader haskell-mode gtags fuzzy flycheck-objc-clang exec-path-from-shell ensime eimp edbi dockerfile-mode direx company-irony color-moccur coffee-mode cmake-mode clojure-cheatsheet clang-format avy auto-complete-clang-async auto-complete-clang actionscript-mode ace-jump-mode ac-js2 ac-clang ac-cider ac-c-headers)))
 '(powerline-default-separator (quote slant))
 '(powerline-height 20)
 '(reb-re-syntax (quote foreign-regexp))
 '(rtags-tramp-enabled t)
 '(sgml-basic-offset 4)
 '(speedbar-add-supported-extension (quote (".js" ".as" ".html" ".css" ".php")))
 '(speedbar-show-unknown-files t)
 '(speedbar-tag-hierarchy-method
   (quote
    (speedbar-prefix-group-tag-hierarchy spe edbar-trim-words-tag-hierarchy speedbar-simple-group-tag-hierarchy speedbar-sort -tag-hierarchy)))
 '(sr-speedbar-auto-refresh t)
 '(sr-speedbar-max-width 200)
 '(sr-speedbar-width 60 t)
 '(sr-speedbar-width-console 150)
 '(typescript-indent-level 2)
 '(yas-trigger-key "TAB"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal))))
 '(dired-symlink ((t (:foreground "#00AAFF"))))
 '(font-lock-builtin-face ((t (:bold t :foreground "#00AAFF"))))
 '(font-lock-function-name-face ((t (:foreground "#66ff00"))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "#22aaff" :weight bold))))
 '(helm-ff-directory ((t (:inherit font-lock-builtin-face :foreground "#0099FF"))))
 '(helm-ff-file ((t (:inherit font-lock-builtin-face :foreground "#FFFFFF"))))
 '(hi-blue-b ((((min-colors 88)) (:foreground "#00AAFF" :weight bold))))
 '(js2-instance-member-face ((t (:foreground "green"))))
 '(link ((((class color) (min-colors 88) (background light)) (:foreground "green" :underline t))))
 '(minibuffer-prompt ((t (:foreground "yellow"))))
 '(speedbar-directory-face ((((class color) (background light)) (:foreground "yellow"))))
 '(vhdl-speedbar-architecture-selected-face ((((min-colors 88) (class color) (background light)) (:foreground "#00AAFF" :underline t)))))
