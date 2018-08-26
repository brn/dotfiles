;; Tide can be used along with web-mode to edit tsx files
(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
      (funcall (cdr my-pair)))))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tag\\'" . web-mode))
(setq web-mode-engines-alist
  '(("riot" . "\\.tag\\'")))
(flycheck-add-mode 'typescript-tslint 'web-mode)
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (flycheck-add-next-checker 'tsx-tide '(warning . typescript-tslint) 'append)
              (local-set-key "\C-c\C-l" 'align-=)
              (setq web-mode-markup-indent-offset 2)
              (tide-setup)
              (flycheck-mode +1)
              (flycheck-popup-tip-mode)
              (tide-hl-identifier-mode +1)
              (enable-minor-mode
                             '("\\.\\(js\\|ts\\)x?" . prettier-js-mode))
              (define-fringe-bitmap 'my-flycheck-fringe-indicator
                (vector #b00000000
                        #b00000000
                        #b00000000
                        #b00000000
                        #b00000000
                        #b00011100
                        #b00111110
                        #b00111110
                        #b00111110
                        #b00011100
                        #b00000000
                        #b00000000
                        #b01111111))
              (flycheck-define-error-level 'error
                :overlay-category 'flycheck-error-overlay
                :fringe-bitmap 'my-flycheck-fringe-indicator
                :fringe-face 'flycheck-fringe-error)
              (flycheck-define-error-level 'warning
                :overlay-category 'flycheck-warning-overlay
                :fringe-bitmap 'my-flycheck-fringe-indicator
                :fringe-face 'flycheck-fringe-warning)
              (flycheck-define-error-level 'info
                :overlay-category 'flycheck-info-overlay
                :fringe-bitmap 'my-flycheck-fringe-indicator
                :fringe-face 'flycheck-fringe-info)
              (setq flycheck-check-syntax-automatically '(save mode-enabled))
              (local-set-key (kbd "C-c C-j") 'avy-goto-char-timer)
              (local-set-key (kbd "C-c C-l") 'avy-goto-line)
              (eldoc-mode +1)
              (company-mode-on))))

(defun web-mode-indent (num)
  (interactive "nIndent: ")
  (setq web-mode-markup-indent-offset num)
  (setq web-mode-css-indent-offset num)
  (setq web-mode-style-padding num)
  (setq web-mode-code-indent-offset num)
  (setq web-mode-script-padding num)
  (setq web-mode-block-padding num)
  )
(web-mode-indent 2)
