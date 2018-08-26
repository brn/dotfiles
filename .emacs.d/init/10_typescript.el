;; sample config
(add-hook 'typescript-mode-hook
          (lambda ()
            (interactive)
            (local-set-key "\C-c\C-l" 'align-=)
            (setq flycheck-check-syntax-automatically '(save mode-enabled))
            (flycheck-add-next-checker 'typescript-tide '(t . typescript-tslint) 'append)
            (tide-setup)
            (flycheck-mode +1)
            (eldoc-mode +1)
            (prettier-js-mode)
            (local-set-key (kbd "C-c C-j") 'avy-goto-char-timer)
            (local-set-key (kbd "C-c C-l") 'avy-goto-line)
            ;; company is an optional dependency. You have to
            ;; install it separately via package-install
            (company-mode-on)
            (tide-hl-identifier-mode +1)))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
;; (add-hook 'before-save-hook 'tide-format-before-save)

(if (os-type-is-mac?)
    (setq tide-tsserver-executable (format "%s%s" (getenv "HOME") "/.nodebrew/current/lib/node_modules/typescript/bin/tsserver")))
;; (setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log"))
