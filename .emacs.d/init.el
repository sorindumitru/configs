(require 'cl)

(load-file "~/.emacs.d/load-directory.el")
(require 'load-directory)

(defconst emacs-config-dir "~/.emacs.d/configs")
(load-directory emacs-config-dir)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("e890fd7b5137356ef5b88be1350acf94af90d9d6dd5c234978cd59a6b873ea94" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
