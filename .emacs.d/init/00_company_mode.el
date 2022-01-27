(use-package company
  :ensure t
  :config

  (defun company--insert-candidate2 (candidate)
    (when (> (length candidate) 0)
      (setq candidate (substring-no-properties candidate))
      (if (eq (company-call-backend 'ignore-case) 'keep-prefix)
          (insert (company-strip-prefix candidate))
        (if (equal company-prefix candidate)
            (company-select-next)
          (delete-region (- (point) (length company-prefix)) (point))
          (insert candidate))
        )))

  (defun company-complete-common2 ()
    (interactive)
    (when (company-manual-begin)
      (if (and (not (cdr company-candidates))
               (equal company-common (car company-candidates)))
          (company-complete-selection)
        (company--insert-candidate2 company-common))))
  (define-key company-active-map [tab] 'company-indent-or-complete-common)
  (define-key company-active-map [backtab] 'company-select-previous)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map [tab] 'company-complete-selection)
  (define-key company-active-map (kbd "RET") nil)
  ;;; C-hがデフォルトでドキュメント表示にmapされているので、文字を消せるようにmapを外す
  (define-key company-active-map (kbd "C-h") nil)
;;; 1つしか候補がなかったらtabで補完、複数候補があればtabで次の候補へ行くように
  (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
;;; ドキュメント表示
  (define-key company-active-map (kbd "M-d") 'company-show-doc-buffer)

  (setq company-minimum-prefix-length 1) ;; 1文字入力で補完されるように
 ;;; 候補の一番上でselect-previousしたら一番下に、一番下でselect-nextしたら一番上に行くように
  (setq company-selection-wrap-around t)

  (custom-set-faces
   '(company-preview ((t (:foreground "darkgray" :underline t))))
   '(company-preview-common ((t (:inherit company-preview))))
   '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
   '(company-tooltip-selection ((t (:background "steelblue" :foreground "white"))))
   '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold))
                             (t (:inherit company-tooltip))))
   '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold))
                                       (t (:inherit company-tooltip-selection))))
   '(company-scrollbar-bg ((t (:background "#121212"))))
   '(company-scrollbar-fg ((t (:background "#121212")))))

  (use-package company-posframe
    :ensure t
    :config
    (company-posframe-mode +1))
  (use-package company-irony
    :ensure t
    :config      
    
    (use-package ac-company
      :config
      (use-package all-the-icons
        :ensure t
        :config
        (declare-function all-the-icons-faicon 'all-the-icons)
        (declare-function all-the-icons-fileicon 'all-the-icons)
        (declare-function all-the-icons-material 'all-the-icons)
        (declare-function all-the-icons-octicon 'all-the-icons)
        (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
        (setq company-box-icons-all-the-icons
              `((Unknown . ,(all-the-icons-material "find_in_page" :height 0.7 :v-adjust -0.15))
                (Text . ,(all-the-icons-faicon "book" :height 0.68 :v-adjust -0.15))
                (Method . ,(all-the-icons-faicon "cube" :height 0.7 :v-adjust -0.05 :face 'font-lock-constant-face))
                (Function . ,(all-the-icons-faicon "cube" :height 0.7 :v-adjust -0.05 :face 'font-lock-constant-face))
                (Constructor . ,(all-the-icons-faicon "cube" :height 0.7 :v-adjust -0.05 :face 'font-lock-constant-face))
                (Field . ,(all-the-icons-faicon "tags" :height 0.65 :v-adjust -0.15 :face 'font-lock-warning-face))
                (Variable . ,(all-the-icons-faicon "tag" :height 0.7 :v-adjust -0.05 :face 'font-lock-warning-face))
                (Class . ,(all-the-icons-faicon "clone" :height 0.65 :v-adjust 0.01 :face 'font-lock-constant-face))
                (Interface . ,(all-the-icons-faicon "clone" :height 0.65 :v-adjust 0.01))
                (Module . ,(all-the-icons-octicon "package" :height 0.7 :v-adjust -0.15))
                (Property . ,(all-the-icons-octicon "package" :height 0.7 :v-adjust -0.05 :face 'font-lock-warning-face)) ;; Golang module
                (Unit . ,(all-the-icons-material "settings_system_daydream" :height 0.7 :v-adjust -0.15))
                (Value . ,(all-the-icons-material "format_align_right" :height 0.7 :v-adjust -0.15 :face 'font-lock-constant-face))
                (Enum . ,(all-the-icons-material "storage" :height 0.7 :v-adjust -0.15 :face 'all-the-icons-orange))
                (Keyword . ,(all-the-icons-material "filter_center_focus" :height 0.7 :v-adjust -0.15))
                (Snippet . ,(all-the-icons-faicon "code" :height 0.7 :v-adjust 0.02 :face 'font-lock-variable-name-face))
                (Color . ,(all-the-icons-material "palette" :height 0.7 :v-adjust -0.15))
                (File . ,(all-the-icons-faicon "file-o" :height 0.7 :v-adjust -0.05))
                (Reference . ,(all-the-icons-material "collections_bookmark" :height 0.7 :v-adjust -0.15))
                (Folder . ,(all-the-icons-octicon "file-directory" :height 0.7 :v-adjust -0.05))
                (EnumMember . ,(all-the-icons-material "format_align_right" :height 0.7 :v-adjust -0.15 :face 'all-the-icons-blueb))
                (Constant . ,(all-the-icons-faicon "tag" :height 0.7 :v-adjust -0.05))
                (Struct . ,(all-the-icons-faicon "clone" :height 0.65 :v-adjust 0.01 :face 'font-lock-constant-face))
                (Event . ,(all-the-icons-faicon "bolt" :height 0.7 :v-adjust -0.05 :face 'all-the-icons-orange))
                (Operator . ,(all-the-icons-fileicon "typedoc" :height 0.65 :v-adjust 0.05))
                (TypeParameter . ,(all-the-icons-faicon "hashtag" :height 0.65 :v-adjust 0.07 :face 'font-lock-const-face))
                (Template . ,(all-the-icons-faicon "code" :height 0.7 :v-adjust 0.02 :face 'font-lock-variable-name-face))))
        (use-package company-box
          :ensure t
          :custom
          (company-box-icons-alist 'company-box-icons-all-the-icons)
          :hook (company-mode . company-box-mode)
          :config
          (setq company-box-backends-colors nil)
          (setq company-box-show-single-candidate t)
          (setq company-box-max-candidates 50)

          (defun company-box-icons--elisp (candidate)
            (when (derived-mode-p 'emacs-lisp-mode)
              (let ((sym (intern candidate)))
                (cond ((fboundp sym) 'Function)
                      ((featurep sym) 'Module)
                      ((facep sym) 'Color)
                      ((boundp sym) 'Variable)
                      ((symbolp sym) 'Text)
                      (t . nil)))))
          (use-package company-quickhelp
            :ensure t
            :defines company-quickhelp-delay
            :custom (company-quickhelp-delay 0.8)
            :bind (:map company-active-map
                        ("M-h" . company-quickhelp-manual-begin))
            :config
            (company-quickhelp-mode +1)))))))
