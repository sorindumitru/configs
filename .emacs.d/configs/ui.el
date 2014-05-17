(setq inhibit-splash-screen t initial-scratch-message nil)
(setq make-backup-files nil)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Set font
(set-default-font "Terminus-9")

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(load-theme 'ample-zen t)
