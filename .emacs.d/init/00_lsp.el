(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-prefer-flymake 'flymake)
  :custom
  (lsp-eslint-auto-fix-on-save t)
  (lsp-eslint-format t)
  (lsp-prefer-capf t)
  (lsp-clients-typescript-log-verbosity "warn")
  (lsp-clients-typescript-tls-path (expand-file-name "~/.nodebrew/current/bin/typescript-language-server"))
  (lsp-eslint-server-command 
   '("node" 
     (expand-file-name "~/GitHub/vscode-eslint/server/out/eslintServer.js")
     "--stdio"))
  (lsp-clients-typescript-plugins
   (vector
    (list :name "typescript-styled-plugin"
          :location (expand-file-name "~/.nodebrew/current/lib/node_modules/typescript-styled-plugin"))))
  
  :config
  ;; config
  (setq lsp-log-io nil)
  (setq lsp-server-trace nil)
  (setq lsp-print-performance nil)
  (setq lsp-auto-guess-root nil)
  (setq lsp-document-sync-method 2)
  (setq lsp-response-timeout 5)
  (setq read-process-output-max (* (* 1024 1024) 3))
  ;; depends
  (use-package helm-lsp :commands helm-lsp-workspace-symbol)
  (use-package lsp-ui
    :ensure t
    :custom
    (lsp-ui-sideline-enable nil)
    (lsp-ui-sideline-ignore-duplicate t)
    (lsp-ui-sideline-show-hover t)
    (lsp-ui-sideline-show-symbol t)
    (lsp-ui-sideline-show-diagnostics t)
    (lsp-ui-sideline-show-code-actions nil)
    ;; lsp-ui-imenu
    (lsp-ui-imenu-enable nil)
    (lsp-ui-imenu-kind-position 'top)
    ;; lsp-ui-peek
    (lsp-ui-peek-enable t)
    (lsp-ui-peek-peek-height 20)
    (lsp-ui-peek-list-width 50)
    (lsp-ui-peek-fontify 'on-demand)
    :config
    ;; config
    (setq lsp-ui-doc-enable nil)
    (setq lsp-ui-doc-header nil)
    (setq lsp-ui-doc-include-signature nil)
    (setq lsp-ui-doc-max-width 150)
    (setq lsp-ui-doc-max-height 30)
    (setq lsp-ui-peek-enable t)
    ;; lsp-ui-sideline
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    ))

(defun lsp-mode-hooks (&optional disable-sideline)
  (lsp-deferred)
  (local-set-key "\M-," 'xref-pop-marker-stack)
  ;; (local-set-key "\M-." 'lsp-ui-peek-find-definitions)
  ;; (local-set-key "\M-/" 'lsp-ui-peek-find-references)
  (local-set-key "\M-." 'xref-find-definitions)
  (local-set-key "\M-/" 'xref-find-references)
  (if (not disable-sideline)
      (progn
        (lsp-ui-sideline-enable nil)))
                                        ;(add-hook 'after-save-hook 'lsp-restart-workspace nil t)
  )
