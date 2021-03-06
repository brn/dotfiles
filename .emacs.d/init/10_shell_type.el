(if (os-type-is-mac?)
    (progn
      (defun skt:shell ()
        (or (executable-find "zsh")
            (executable-find "bash")
            ;; (executable-find "f_zsh") ;; Emacs + Cygwin を利用する人は Zsh の代りにこれにしてください
            ;; (executable-find "f_bash") ;; Emacs + Cygwin を利用する人は Bash の代りにこれにしてください
            (executable-find "cmdproxy")
            (error "can't find 'shell' command in PATH!!")))
      ;; Shell 名の設定
      (setq shell-file-name (skt:shell))
      (setenv "SHELL" shell-file-name)
      (setq explicit-shell-file-name shell-file-name)))
