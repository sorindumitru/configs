(require 'cl)

;(load-file "~/.emacs.d/load-directory.el")
;(require 'load-directory)

;(defconst emacs-config-dir "~/.emacs.d/configs")
;(load-directory emacs-config-dir)
(load "~/.emacs.d/configs/packages.el")
(load "~/.emacs.d/configs/indent.el")
(load "~/.emacs.d/configs/ui.el")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
