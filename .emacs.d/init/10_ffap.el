(if (os-type-is-mac?)
    (progn
      (ffap-bindings)
      ;; 探すパスは ffap-c-path で設定する
      (setq ffap-c-path
          '("/usr/include" "/usr/local/include"))
      ;; 新規ファイルの場合には確認する
      (setq ffap-newfile-prompt t)
      ;; ffap-kpathsea-expand-path で展開するパスの深さ
      (setq ffap-kpathsea-depth 5)))
