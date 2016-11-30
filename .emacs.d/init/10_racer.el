(setq racer-rust-src-path "/Users/a12360/GitHub/dotfiles/.emacs.d/rust/src/")
(setq racer-cmd "/Users/a12360/GitHub/dotfiles/.emacs.d/racer/target/release/racer")
(eval-after-load "rust-mode" '(require 'racer))

(add-hook 'rust-mode-hook
  '(lambda () 
     (racer-activate)
     (local-set-key (kbd "M-.") #'racer-find-definition)
     (local-set-key (kbd "TAB") #'racer-complete-or-indent)))
