;;パスの登録
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
  (delete-selection-mode t)
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir path-separator (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))

;;言語設定
(coding-system-put 'utf-8 'category 'utf-8)
(set-language-info
 "Japanese"
 'coding-priority (cons 'utf-8
                        (get-language-info "Japanese" 'coding-priority)))
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;vc-consultの停止
;;gitを使うと重くなる
(setq vc-consult-headers nil)

;;同じフレームで開く
(setq ns-pop-up-frames nil)
;;バックアップファイルを作らない
(setq make-backup-files nil)
;;自動保存を行わない
(setq auto-save-default nil)
;;保存時にバックアップしない
(setq backup-inhibited t)
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


:::::::::::::::::::::::::::::::::::::::::::::::::::::
::コメント
:::::::::::::::::::::::::::::::::::::::::::::::::::::
(setq comment-style 'multi-line)

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
(setq vc-handled-backends ())
