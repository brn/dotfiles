(let ((default-directory (expand-file-name "~/.emacs.d/elisps")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
       (normal-top-level-add-subdirs-to-load-path)))

(let ((default-directory (expand-file-name "~/.emacs.d/elpa")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
       (normal-top-level-add-subdirs-to-load-path)))

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'cl)

(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    init-loader
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
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))

(require 'exec-path-from-shell)
(require 'coffee-mode)
(require 'anything-startup)
(require 'anything-config)
(require 'auto-complete)
(require 'auto-complete-config)
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
(init-loader-load "~/.emacs.d/init/cmp")
(require 'js-doc)
(require 'moccur-edit)
(require 'multi-term)
