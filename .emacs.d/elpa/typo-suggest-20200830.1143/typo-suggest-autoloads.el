;;; typo-suggest-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "typo-suggest" "typo-suggest.el" (0 0 0 0))
;;; Generated autoloads from typo-suggest.el

(autoload 'typo-suggest-ivy "typo-suggest" "\
Run typo suggest with ivy backend." t nil)

(autoload 'typo-suggest-helm "typo-suggest" "\
Get word suggestion from datamuse api with helm." t nil)

(autoload 'typo-suggest-company "typo-suggest" "\
Get word suggestion from datamuse api with company mode.
Argument COMMAND is used for company.
Optional argument ARG Is used from company to send which will search.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(autoload 'typo-suggest-company-mode "typo-suggest" "\
Disable all company backends and enable typo-suggest-company or wise versa.

If called interactively, toggle `typo-Suggest-Company mode'.  If
the prefix argument is positive, enable the mode, and if it is
zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `typo-suggest-company-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "typo-suggest" '("typo-suggest-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; typo-suggest-autoloads.el ends here
