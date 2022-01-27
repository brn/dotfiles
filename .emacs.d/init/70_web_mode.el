(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
          (funcall (cdr my-pair)))))

(defun web-mode-indent (num)
  (interactive "nIndent: ")
  (setq web-mode-markup-indent-offset num)
  (setq web-mode-css-indent-offset num)
  (setq web-mode-style-padding num)
  (setq web-mode-code-indent-offset num)
  (setq web-mode-script-padding num)
  (setq web-mode-block-padding num)
  )

(defun jsx-setup ()
  (setq web-mode-enable-current-element-highlight t)
  (lsp-mode-hooks t)
  (local-set-key "\C-c\C-l" 'align-=)
  (setq web-mode-markup-indent-offset 2)
  (flycheck-mode +1)
  (enable-minor-mode
   '("\\.\\(js\\|ts\\)x?" . prettier-js-mode))
  (enable-minor-mode '("\\.vue" . prettier-js-mode))
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
  (setq web-mode-enable-auto-indentation t)
  (local-set-key (kbd "C-c C-j") 'avy-goto-char-timer)
  (local-set-key (kbd "C-c C-l") 'avy-goto-line)
  (eldoc-mode +1)
  (setq web-mode-enable-auto-indentation nil)
  (setq web-mode-enable-current-element-highlight t)
  (company-mode))

(defun typescript-minormode-hooks ()
  (let ((case-fold-search nil))
    (highlight-regexp "\\_<number\\|string\\|boolean\\|enum\\|unknown\\|any\\|void\\|null\\|undefined\\|never\\|object\\|symbol\\_>" 'font-lock-type-face)))

(defun web-mode-hooks ()
  (interactive)
  (yas-minor-mode -1)
  (setq web-mode-enable-auto-indentation nil)
  (remove-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (when (or (equal web-mode-content-type "jsx") (equal web-mode-content-type "tsx") (equal web-mode-content-type "vue"))
    (jsx-setup))
  (when (equal web-mode-content-type "tsx")
    (typescript-minormode-hooks)))

(use-package web-mode
  :ensure nil
  :config
  (add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tag\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  (setq web-mode-content-types-alist
        '(("jsx" . "\\.js[x]?\\'") ("jsx" . "\\.ts[x]?\\'") ("vue" . "\\.vue\\'") ("html" . "\\.tag\\'") ("html" . "\\.html\\'")))
  (add-hook 'web-mode-hook 'web-mode-hooks)
  (web-mode-indent 2))
