;;パスの登録
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/sw/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir path-separator (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))

(setenv "HOME" (getenv "HOME"))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(delete-selection-mode t)

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
(menu-bar-mode 0)
(tool-bar-mode 0)

;;行数表示
(autoload 'linum-mode "linum" nil t)
(global-linum-mode)

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

;;ボックス選択のキー
;;ターミナルから起動した時用
(global-set-key "\C-c\C-m" 'cua-set-rectangle-mark)
;;tabifyしない
(setq cua-auto-tabify-rectangles nil)
;;選択領域のハイライト
(transient-mark-mode 1)
;;対応する括弧を光らせる
(show-paren-mode t)
;;背景色
(set-background-color "black")

;;バッファの分割を楽に
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)


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
         (setq indent-tabs-mode t)))

(setq sgml-mode-hook
      '(lambda ()
         (setq indent-tabs-mode t)))

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
