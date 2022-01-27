(let ((default-directory (expand-file-name "~/.emacs.d/elisps")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
       (normal-top-level-add-subdirs-to-load-path)))

(let ((default-directory (expand-file-name "~/.emacs.d/elpa")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(setenv "HOME" (getenv "HOME"))
(setenv "LIBRARY_PATH" "/usr/local/opt/gcc@11/lib/gcc/11:/usr/local/opt/libgccjit/lib/gcc/11/:/usr/local/opt/gcc/lib/gcc/11/gcc/x86_64-apple-darwin20/11.2.0")

;;バックアップファイルを作らない
(setq make-backup-files nil)
;;自動保存を行わない
(setq auto-save-default nil)
;;保存時にバックアップしない
(setq backup-inhibited t)
;;自動保存リストの無効化　
(setq auto-save-list-file-prefix nil)
;;lockファイルを作成しない
(setq create-lockfiles nil)
;;同じフレームで開く
(setq ns-pop-up-frames nil)
;;メニューバーとツールバー非表示
(menu-bar-mode 1)
(tool-bar-mode 0)
;;ウインドウのsplitを防ぐ
(setq pop-up-windows nil)
;;同じウインドウで開く
(add-to-list
 'display-buffer-alist
 '(".+" . (display-buffer-same-window
           . ((reusable-frames . t)))))
(setq package-native-compile t)

(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)
(global-linum-mode 0)

(setq auto-window-vscroll nil)

(autoload 'abbrev-mode "abbrev" nil t)
(abbrev-mode)

;;時間表示
(display-time)
;;関数名の色
(set-face-foreground 'font-lock-function-name-face "#66FFFF")

;;式が複数行にまたがる場合のオフセット
(setq-default c-basic-offset 4)
;;コメントのタイプ
(setq-default comment-style 'multi-line)
;;shiftキーでの選択機能
(setq-default shift-select-mode t)
;;フレームの透過
(modify-all-frames-parameters
 (list (cons 'alpha  '(85 100 100 100))))

;;略語展開の大文字小文字の区別
(setq dabbrev-case-fold-search nil)

;;find-files等での文字の区別をしない
(setq completion-ignore-case t)

;;通常のコピペができる
(cua-mode t)
(setq cua-enable-cua-keys nil)
(global-set-key "\C-v" 'forward-page)
(global-set-key "\M-v" 'backward-page)
(global-set-key "\C-z" 'undo)

;;ボックス選択のキー
;;ターミナルから起動した時用
(global-set-key "\C-c\C-m" 'cua-set-rectangle-mark)
(global-set-key "\C-c\C-o" 'anything-filelist+)

;;コピーせずに削除
(defun delete-word (arg)
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun backward-delete-word (arg)
  (interactive "p")
  (delete-word (- arg)))

(global-set-key [C-backspace] 'backward-delete-word)

;;tabifyしない
(setq cua-auto-tabify-rectangles nil)
;;選択領域のハイライト
(transient-mark-mode 1)
;;対応する括弧を光らせる
(show-paren-mode t)
;;背景色
(set-background-color "black")


;;入力メソッド
(if (boundp 'input-method-alist)
    (progn
      (if (assoc "japanese-egg-wnn" input-method-alist)
          (activate-input-method "japanese-egg-wnn")
        )

      (and
       default-input-method
       (assoc default-input-method input-method-alist)
       (activate-input-method default-input-method)
       )
      (inactivate-input-method)
      ))


(setq nxml-mode-hook
      '(lambda ()
         (setq indent-tabs-mode t)
         (setq tab-width 4)))

(setq sgml-mode-hook
      '(lambda ()
         (setq indent-tabs-mode t)
         (setq tab-width 4)))

(setq java-mode-hook
      '(lambda ()
         (setq indent-tabs-mode t)
         (setq tab-width 4)
         (c-set-style "java")))

(setq c-auto-newline t)

(setq auto-mode-alist
      (append '((".h$" . c++-mode))
              auto-mode-alist))
(setq inhibit-startup-screen -1)

(setq font-lock-maximum-decoration '((c++-mode . 2) (web-mode . t)))

;; 閉じる前に確認
(setq confirm-kill-emacs 'y-or-n-p)

(setq ff-other-file-alist
      '(("\\.mm?$" (".h"))
        ("\\.cc$"  (".hh" ".h"))
        ("\\.hh$"  (".cc" ".C"))

        ("\\.c$"   (".h"))
        ("\\.h$"   (".c" ".cc" ".C" ".CC" ".cxx" ".cpp" ".m" ".mm"))

        ("\\.C$"   (".H"  ".hh" ".h"))
        ("\\.H$"   (".C"  ".CC"))

        ("\\.CC$"  (".HH" ".H"  ".hh" ".h"))
        ("\\.HH$"  (".CC"))

        ("\\.cxx$" (".hh" ".h"))
        ("\\.cpp$" (".hpp" ".hh" ".h"))

        ("\\.hpp$" (".cpp" ".c"))))
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer 
        (delq (current-buffer) 
              (remove-if-not 'buffer-file-name (buffer-list)))))
(delete-selection-mode t)
