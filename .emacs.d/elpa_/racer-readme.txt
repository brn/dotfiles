You will need to configure Emacs to find racer:

(setq racer-rust-src-path "<path-to-rust-srcdir>/src/")
(setq racer-cmd "<path-to-racer>/target/release/racer")

To set up racer for completion in Rust buffers, add it
`rust-mode-hook':

(add-hook 'rust-mode-hook #'racer-activate)

To use TAB for both indent and completion in Rust:

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'racer-complete-or-indent)

You can also use racer to find definitions. To bind this to a key:

(require 'rust-mode)
(define-key rust-mode-map (kbd "M-.") #'racer-find-definition)
