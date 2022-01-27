(use-package compile
  :ensure t
  :config
  (defvar yel-compile-auto-close t "* If non-nil, a window is automatically closed after (\\[compile]).")

  (defadvice compile (after compile-aftercheck activate compile)
    "Adds a funcion of windows auto-close." 
    (let ((proc (get-buffer-process "*compilation*")))
      (if (and proc yel-compile-auto-close)
          (set-process-sentinel proc 'yel-compile-teardown))))


  (defun yel-compile-teardown (proc status)
    "Closes window automatically, if compile succeed."
    (let ((ps (process-status proc)))
      (if (eq ps 'exit)
          (if (eq 0 (process-exit-status proc))
              (progn (delete-other-windows) (kill-buffer "*compilation*")
                     (message "---- Compile Success ----") )
            (message "Compile Failer")))
      (if (eq ps 'signal)
          (message "Compile Abnormal end")))))
