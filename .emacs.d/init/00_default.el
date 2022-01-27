(use-package exec-path-from-shell
  :ensure t
  :config
  ;;パスの登録
  (dolist (dir (list
                "/sbin"
                "/usr/sbin"
                "/bin"
                "/usr/bin"
                "/sw/bin"
                "/usr/local/bin"
                (expand-file-name "~/bin")
                (expand-file-name "~/.emacs.d/bin")
                ))
    (when (and (file-exists-p dir) (not (member dir exec-path)))
      (setenv "PATH" (concat dir path-separator (getenv "PATH")))
      (setq exec-path (append (list dir) exec-path))))

  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize))

  (use-package nlinum
    :ensure t
    :config
    ;;行数表示
    ;; バッファの左側に行番号を表示する
    (global-nlinum-mode t)
    ;; 5 桁分の表示領域を確保する
    (setq nlinum-format "%5d ")
    )
  )
