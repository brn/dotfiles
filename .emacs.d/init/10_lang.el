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

;;windowsの際のフォントサイズ修正
(if (os-type-is-win?) (
            (add-to-list 'default-frame-alist
                         '(font . "-outline-Monaco-normal-normal-normal-mono-12-*-*-*-c-*-iso8859-1"))
            ))
