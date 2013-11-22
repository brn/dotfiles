(autoload 'scss-mode "scss-mode")
(setq exec-path (cons (expand-file-name "~/.rbenv/shims") exec-path))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil) ;; 自動コンパイルをオフにする
