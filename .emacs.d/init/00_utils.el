;;;
;;; 整列のためのコマンド
;;;

(defun align-= (p1 p2)
  "Align lines by =" 
  (interactive "r")
  (align-regexp p1 p2 "\\(\\s-*\\)=" 1 1 nil)
)

(global-set-key "\C-c\C-l" 'align-=)
