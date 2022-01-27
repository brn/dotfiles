;; -*- lexical-binding: t -*-

(use-package eglot
  :ensure t
  :config
  (define-key eglot-mode-map (kbd "C-c C-d") 'eglot-help-at-point)
  (define-key eglot-mode-map (kbd "C-c C-r") 'eglot-code-actions)
  )

(use-package rustic
  :ensure t
  :config
  ;; rust-modeで開かれる時があるのでrustic-modeを末尾に追加し直す
  (setq rustic-lsp-server 'rust-analyzer)
  (setq lsp-rust-analyzer-server-command '("~/.cargo/bin/ra_lsp_server"))

  ;; 本当にwithout switchしているわけではなく前のウィンドウにフォーカスを戻すだけ
  (defun pop-to-buffer-without-switch (buffer-or-name &optional action norecord)
    (pop-to-buffer buffer-or-name action norecord)
    (other-window -1)
    )
  (defun rustic-mode-hooks()
    (setq rustic-format-on-save t)
    (setq rustic-indent-offset 2)
    (lsp-mode-hooks))
  (add-hook 'rustic-mode-hook 'rustic-mode-hooks)
  ;; エラーポップアップにフォーカスを移さない
  (custom-set-variables '(rustic-format-display-method 'pop-to-buffer-without-switch))
  :custom
  (lsp-rust-server 'rust-analyzer))
