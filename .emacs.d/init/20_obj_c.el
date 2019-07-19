(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@implementation" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@interface" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@protocol" . objc-mode))

(add-hook 'objc-mode-hook
          (lambda ()
            (define-key c-mode-base-map (kbd "C-c o") 'ff-find-other-file)
            ))

(defvar flymake-objc-compile-default-options (list "-fsyntax-only" "-x" "objective-c" "-Weverything" "-std=c99"))

(defun objc-headline()
  (interactive)
  (let ((lines (let* ((result (with-current-buffer (current-buffer)
                                (goto-char (point-min))
                                (cl-loop while (re-search-forward "^[-+@]\\|^#pragma mark" nil t)
                                         collect (buffer-substring (point-at-bol) (point-at-eol)))))
                      (current-pos (point)))
                 (if result result (list "")))))
    (helm :sources '((name . "Test")
                     (candidates . lines)
                     (action . (lambda(x)                                   	
                                 (goto-char (point-min))
                                 (let* ((pos (search-forward x nil t)))
                                   (if pos
                                       (goto-char (point-at-bol))
                                     (goto-char current-pos)))))
                     :buffer "Objective-c Methods"))))

(setq ac-clang-clang-complete-at-flags flymake-objc-compile-default-options)

(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "clang" (list "-Wall" "-Wextra" "-fsyntax-only" "-objective-c" "-Weverything" "-std=c99" local-file))))

;; objc-mode で補完候補を設定
(setq ac-modes (append ac-modes '(objc-mode)))
                                        ;(setq ac-clang-prefix-header "~/site-lisp/stdafx.pch")
;; hook
(add-hook 'objc-mode-hook
          (lambda ()
            (ac-clang-initialize)
            (ac-clang-activate-after-modify)
            (setq ac-clang-async-autocompletion-manualtrigger-key "C-.")
            (define-key objc-mode-map (kbd "\t") 'ac-complete)
            (define-key objc-mode-map (kbd "\M-.") 'ac-clang-jump-smart)
            ;; XCode を利用した補完を有効にする
;            (push 'ac-source-clang ac-sources)
            ;; C++ のキーワード補完をする Objective-C++ を利用する人だけ設定してください
            ;; (push 'ac-source-c++-keywords ac-sources)
            ;; 候補の最大件数 デフォルトは 10件
            (setq ac-candidate-max 20)

            (push '("\\.m$" flymake-cc-init) flymake-allowed-file-name-masks)
            (push '("\\.h$" flymake-cc-init) flymake-allowed-file-name-masks)
            (define-key objc-mode-map "\C-cd" 'flymake-display-err-minibuffer)
            (define-key objc-mode-map "\C-xp" 'objc-headline)

            ;; 存在するファイルかつ書き込み可能ファイル時のみ flymake-mode を有効にします
            (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
                (flymake-mode t))))
