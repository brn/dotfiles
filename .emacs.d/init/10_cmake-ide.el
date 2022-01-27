(use-package cmake-ide
  :bind
  (("<f9>" . cmake-ide-compile))
  :config
  (progn
    (setq 
     ; rdm & rcコマンドへのパス。コマンドはRTagsのインストール・ディレクトリ下。
     cmake-ide-rdm-executable "/usr/local/bin/rdm"
     cmake-ide-rc-executable  "/usr/local/bin/rc"
     )
    )
  )
