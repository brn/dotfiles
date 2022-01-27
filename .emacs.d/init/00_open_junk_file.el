(use-package open-junk-file
  :ensure t
  :config
  (setq open-junk-file-format "~/tmp/junk/%Y/%m/%Y-%m-%d-%H%M%S.")
  (global-set-key (kbd "C-x j") 'open-junk-file))
