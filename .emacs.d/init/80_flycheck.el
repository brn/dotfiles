(defun flycheck-get-proper-typescript-linter ()
  "tslintが使えるプロジェクトだとtslintを有効化して,それ以外ではeslintを有効化する"
  (if (and
       ;; 大前提としてtslint.jsonがないとだめ
       (locate-dominating-file default-directory "tslint.json")
       (or
        ;; メジャーモードがTypeScriptなら良い
        (equal major-mode 'typescript-mode)
        ;; それ以外のメジャーモード(web-modeとか)でも拡張子がts, tsxなら良い
        (member (file-name-extension (buffer-file-name)) '("ts" "tsx"))))
      'typescript-tslint
    (when (executable-find "eslint")
      (progn
        (add-hook 'after-save-hook 'eslint-fix nil t)
        'javascript-eslint))))

(use-package flycheck
  :ensure t
  :config
  (use-package flycheck-popup-tip
    :ensure t
    :config
    (use-package flycheck-posframe
      :ensure t
      :config
      ;; flycheck mode

      ;; aligns annotation to the right hand side
      (setq company-tooltip-align-annotations t)

      (defun prettier-js-mode-enable ()
        (interactive)
        (prettier-js-mode t))

      (flycheck-add-mode 'javascript-eslint 'web-mode)
      (flycheck-add-mode 'typescript-tslint 'web-mode)

      (flycheck-add-mode 'javascript-eslint 'typescript-mode)
      (flycheck-add-mode 'javascript-eslint 'typescript-tsx-mode)

      (flycheck-define-checker c/c++
        "A C/C++ checker using clang++."
        :command ("clang++" "-std=c++1y" "-Wall" "-Wextra" "-fsyntax-only" "-DPLATFORM_64BIT" source)
        :error-patterns  ((error line-start
                                 (file-name) ":" line ":" column ":" " Error: " (message)
                                 line-end)
                          (warning line-start
                                   (file-name) ":" line ":" column ":" " Warnings: " (message)
                                   line-end))
        :modes (c-mode c++-mode))

      (define-key flycheck-mode-map (kbd "C-M-n") 'flycheck-next-error)
      (define-key flycheck-mode-map (kbd "C-M-p") 'flycheck-previous-error)
      (add-hook 'c-mode-common-hook 'flycheck-mode)
      (add-hook 'flycheck-mode-hook #'flycheck-posframe-mode)
      (custom-set-variables
       '(help-at-pt-timer-delay 0.1)
       '(help-at-pt-display-when-idle '(flymake-diagnostic))
       '(flycheck-display-errors-delay 0.5)
       '(flycheck-highlighting-mode 'lines)
       '(flycheck-popup-tip-error-prefix "* ")
       '(flycheck-popup-tip-error-prefix "* ")
       '(flycheck-display-errors-delay 0.5))
      (define-key flycheck-mode-map (kbd "C-M-n") 'flycheck-next-error)
      (define-key flycheck-mode-map (kbd "C-M-p") 'flycheck-previous-error))))
