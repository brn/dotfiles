;;; highlight2clipboard-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "highlight2clipboard" "highlight2clipboard.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from highlight2clipboard.el

(defvar highlight2clipboard-mode nil "\
Non-nil if Highlight2clipboard mode is enabled.
See the `highlight2clipboard-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `highlight2clipboard-mode'.")

(custom-autoload 'highlight2clipboard-mode "highlight2clipboard" nil)

(autoload 'highlight2clipboard-mode "highlight2clipboard" "\
When active, cuts and copies are exported with formatting to the clipboard.

\(fn &optional ARG)" t nil)

(autoload 'highlight2clipboard-ensure-buffer-is-fontified "highlight2clipboard" "\
Ensure that the buffer is fontified.

\(fn)" t nil)

(autoload 'highlight2clipboard-copy-region-to-clipboard "highlight2clipboard" "\
Copy region with formatting to system clipboard.

Unlike using Highlight2clipboard mode, this ensure that buffers
are fully fontified.

\(fn BEG END)" t nil)

(autoload 'highlight2clipboard-copy-buffer-to-clipboard "highlight2clipboard" "\
Copy buffer with formatting to system clipboard.

Unlike using Highlight2clipboard mode, this ensure that buffers
are fully fontified.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "highlight2clipboard" '("highlight2clipboard-")))

;;;***

;;;### (autoloads nil nil ("highlight2clipboard-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; highlight2clipboard-autoloads.el ends here
