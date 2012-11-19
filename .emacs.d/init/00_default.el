(set-language-environment  'utf-8)
(prefer-coding-system 'utf-8)
(setq vc-consult-headers nil)

(setq ns-pop-up-frames nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-inhibited t)
(setq menu-bar-mode nil)
(tool-bar-mode 0)
(autoload 'linum-mode "linum" nil t)

(display-time)
(set-face-foreground 'font-lock-function-name-face "#66FFFF")

(global-linum-mode)
(setq-default c-basic-offset 4)
(setq-default comment-style 'multi-line)
(setq-default shift-select-mode t)
(setq make-backup-files nil)                                             
(setq auto-save-default nil)

(modify-all-frames-parameters
 (list (cons 'alpha  '(85 100 100 100))))
(setq default-input-method "MacOSX")
(setq dabbrev-case-fold-search nil)
(setq completion-ignore-case t)

(cua-mode t)
(global-set-key "\C-c\C-m" 'cua-set-rectangle-mark) ;;region selectable on terminal
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(show-paren-mode t)
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
