;; sample config
(add-hook 'typescript-mode-hook
          (lambda ()
            (interactive)
            (local-set-key "\C-c\C-l" 'align-=)
            (tide-setup)
            (flycheck-mode +1)
            (setq flycheck-check-syntax-automatically '(save mode-enabled))
            (eldoc-mode +1)
            ;; company is an optional dependency. You have to
            ;; install it separately via package-install
            (company-mode-on)))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(if (os-type-is-mac?)
    (setq tide-tsserver-executable "/Users/a12360/.nodebrew/current/lib/node_modules/typescript/bin/tsserver"))
;; (setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log"))
