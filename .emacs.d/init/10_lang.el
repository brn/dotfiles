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

(if (eq window-system 'mac)
    (if (os-type-is-mac?)
        (progn
          (setq mac-option-modifier 'meta)
          (setq mac-command-modifier nil)
          (global-set-key "\C-c\C-cf" 'toggle-frame-maximized))))
