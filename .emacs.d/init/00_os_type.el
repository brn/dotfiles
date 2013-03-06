(defvar os-type nil)

(cond ((string-match "apple-darwin" system-configuration) ;; Mac
       (setq os-type 'mac))
      ((string-match "linux" system-configuration)        ;; Linux
       (setq os-type 'linux))
      ((string-match "freebsd" system-configuration)      ;; FreeBSD
       (setq os-type 'bsd))
      ((string-match "mingw" system-configuration)        ;; Windows
       (setq os-type 'win)))

(defun os-type-is-mac? ()
  (eq os-type 'mac))

(defun os-type-is-linux? ()
  (eq os-type 'linux))

(defun os-type-is-bsd? ()
  (eq os-type 'freebsd))

(defun os-type-is-win? ()
  (eq os-type 'win))
