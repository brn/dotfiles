(use-package js-doc
  :ensure t
  :config
  ;;js-doc.elのfile-docを上書き
  (defvar js-doc-file-doc-lines
    '(js-doc-top-line
      " * @fileoverview\n"
      " * @author %a\n"
      js-doc-bottom-line)
    "JsDoc style file document format.
When the `js-doc-insert-file-doc' is called,
each lines in a list will be formatted by `js-doc-format-string'
and inserted to the top of current buffer.")

  ;;authorだけ設定
  (setq js-doc-author "Taketoshi Aono")

  (add-hook 'typescript-mode-hook
            '(lambda ()
               (local-set-key "\C-ci" 'java-doc-like)
               (local-set-key "\C-c@" 'js-doc-insert-tag)
               (local-set-key "\C-cf" 'js-doc-insert-file-doc)
               )
            )


  (add-hook 'web-mode-hook
            '(lambda ()
               (local-set-key "\C-ci" 'java-doc-like)
               (local-set-key "\C-c@" 'js-doc-insert-tag)
               (local-set-key "\C-cf" 'js-doc-insert-file-doc)
               )
            ))
