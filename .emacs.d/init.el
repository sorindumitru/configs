; Load packages config
(load "~/.emacs.d/conf/packages.el")
(load "~/.emacs.d/conf/ui.el")
(load "~/.emacs.d/conf/indent.el")
(load "~/.emacs.d/conf/keys.el")

; Put custom variables in their own file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
