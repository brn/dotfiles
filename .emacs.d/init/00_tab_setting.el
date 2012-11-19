(defun set-aurora-tab-width (num &optional local redraw)
  "タブ幅をセットします。タブ5とかタブ20も設定できたりします。
localが non-nilの場合は、カレントバッファでのみ有効になります。
redrawが non-nilの場合は、Windowを再描画します。"
  (interactive "nTab Width: ")
  (when local
    (make-local-variable 'tab-width)
    (make-local-variable 'tab-stop-list))
  (setq tab-width num)
  (setq tab-stop-list ())
  (while (<= num 256)
    (setq tab-stop-list `(,@tab-stop-list ,num))
    (setq num (+ num tab-width)))
  (when redraw (redraw-display)) tab-width)

(set-aurora-tab-width (setq tab-width (setq-default tab-width 2)))

(global-set-key "\C-c2" (lambda () (interactive) (set-aurora-tab-width 2 t t)))
(global-set-key "\C-c4" (lambda () (interactive) (set-aurora-tab-width 4 t t)))
(global-set-key "\C-c8" (lambda () (interactive) (set-aurora-tab-width 8 t t)))

(setq c-default-style
      '((java-mode . "java") (other . "google")))
