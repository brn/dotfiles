(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@implementation" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@interface" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@protocol" . objc-mode))


(require 'flymake)

(defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
  (setq flymake-check-was-interrupted t))
(ad-activate 'flymake-post-syntax-check)

(add-hook 'objc-mode-hook
          (lambda ()
            (define-key c-mode-base-map (kbd "C-c o") 'ff-find-other-file)
            ))

(defvar flymake-objc-compile-default-options (list "-fsyntax-only" "-x" "objective-c" "-Weverything" "-std=c99"))

(defun flymake-display-err-minibuffer ()
  (interactive)
  (let* ((line-no (line-number-at-pos))
         (line-err-info-list 
           (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count (length line-err-info-list)))
    (while (> count 0)
      (when line-err-info-list
        (let* ((file (flymake-ler-file (nth (1- count) line-err-info-list)))
               (full-file (flymake-ler-full-file 
                            (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)))
      (setq count (1- count)))))


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

(defun flymake-display-err-minibuffer-safe () 
  (ignore-errors flymake-display-err-minibuffer))

(setq flymake-err-line-patterns
      (cons
       '("\\(.+\\):\\([0-9]+\\):\\([0-9]+\\): \\(.+\\)" 1 2 3 4)
       flymake-err-line-patterns))

(set-face-background 'flymake-warnline "dark orange")
(set-face-foreground 'flymake-warnline "black")
(set-face-background 'flymake-errline "orange red")
(set-face-foreground 'flymake-errline "black")

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
