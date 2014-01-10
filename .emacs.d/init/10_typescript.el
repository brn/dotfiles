(require 'typescript)

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(add-hook 'typescript-mode-hook
          '(lambda ()
             (define-key typescript-mode-map  "{" 'brace-ret-brace)
             (auto-complete-mode 1)))

;;(require 'tss)

;; ポイントしている要素についてのヘルプをポップアップ表示するキー
;;(setq tss-popup-help-key "C-:")

;; ポイントしている要素の定義元へジャンプするキー
;;(setq tss-jump-to-definition-key "C->")

;; 推奨設定を行う
;;(tss-config-default)

