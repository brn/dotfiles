(defun inside-class-enum-p (pos)
  "Checks if POS is within the braces of a C++ \"enum class\"."
  (ignore-errors
    (save-excursion
      (goto-char pos)
      (up-list -1)
      (backward-sexp 1)
      (looking-back "enum[ \t]+class[ \t]+[^}]+"))))

(defun align-enum-class (langelem)
  (if (inside-class-enum-p (c-langelem-pos langelem))
      0
    (c-lineup-topmost-intro-cont langelem)))

(defun align-enum-class-closing-brace (langelem)
  (if (inside-class-enum-p (c-langelem-pos langelem))
      '-
    '+))

(defun fix-enum-class ()
  "Setup `c++-mode' to better handle \"class enum\"."
  (add-to-list 'c-offsets-alist '(topmost-intro-cont . align-enum-class))
  (add-to-list 'c-offsets-alist
               '(statement-cont . align-enum-class-closing-brace)))


(defadvice c-lineup-arglist (around my activate)
  "Improve indentation of continued C++11 lambda function opened as argument."
  (setq ad-return-value
        (if (and (equal major-mode 'c++-mode)
                 (ignore-errors
                   (save-excursion
                     (goto-char (c-langelem-pos langelem))
                     ;; Detect "[...](" or "[...]{". preceded by "," or "(",
                     ;;   and with unclosed brace.
                     (looking-at ".*[(,][ \t]*\\[[^]]*\\][ \t]*[({][^}]*$"))))
            0                           ; no additional indent
          ad-do-it)))                   ; default behavior

(add-hook 'c++-mode-hook 'fix-enum-class)
(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)

(add-hook 'c++-mode-hook
          (lambda ()
            (rtags-enable-standard-keybindings c-mode-base-map)
            (local-set-key (kbd "M-.") 'rtags-find-symbol-at-point)
            (local-set-key (kbd "M-;") 'rtags-find-symbol)
            (local-set-key (kbd "M-@") 'rtags-find-references)
            (local-set-key (kbd "M-,") 'rtags-location-stack-back)))


;; (defun flymake-cc-init ()
;;   (let* ((temp-file   (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;          (local-file  (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;     (list "clang++" (list "-std=c++1y" "-Wall" "-Wextra" "-fsyntax-only" "-DPLATFORM_64BIT" local-file))))

;; (push '("\\.cc$" flymake-cc-init) flymake-allowed-file-name-masks)

;; (add-hook 'c++-mode-hook
;;           '(lambda ()
;;              (add-hook 'before-save-hook 'clang-format-buffer nil 'local)))
(setq rtags-tramp-enabled t) ;; TODO remove newer version.
