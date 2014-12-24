(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@implementation" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@interface" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@protocol" . objc-mode))


(require 'flymake)

;; (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
;;   (setq flymake-check-was-interrupted t))
;; (ad-activate 'flymake-post-syntax-check)

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

(setq clang-completion-flags flymake-objc-compile-default-options)

;; objc-mode で補完候補を設定
(setq ac-modes (append ac-modes '(objc-mode)))
;(setq ac-clang-prefix-header "~/site-lisp/stdafx.pch")
;; hook
(add-hook 'objc-mode-hook
         (lambda ()
           (define-key objc-mode-map (kbd "\t") 'ac-complete)
           ;; XCode を利用した補完を有効にする
           (push 'ac-source-clang ac-sources)
           ;; C++ のキーワード補完をする Objective-C++ を利用する人だけ設定してください
           ;; (push 'ac-source-c++-keywords ac-sources)
           ;; 候補の最大件数 デフォルトは 10件
           (setq ac-candidate-max 20)

           (push '("\\.m$" flymake-simple-make-init) flymake-allowed-file-name-masks)
           (push '("\\.h$" flymake-simple-make-init) flymake-allowed-file-name-masks)
           (define-key objc-mode-map "\C-cd" 'flymake-display-err-minibuffer)
           (flymake-mode t)
           ;; 存在するファイルかつ書き込み可能ファイル時のみ flymake-mode を有効にします
           (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
               (flymake-mode t))
         ))
