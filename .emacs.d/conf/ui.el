(setq inhibit-splash-screen t initial-scratch-message nil)
(setq make-backup-files nil)
(defalias 'yes-or-no-p 'y-or-n-p)

;(set-default-font "Pragmata Pro")

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(load-theme 'wilson t)

(global-hl-line-mode 1)
(show-paren-mode 1)
