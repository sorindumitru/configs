(add-to-list 'load-path "~/.emacs.d")

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq make-backup-files nil)
(setq inhibit-default-init t)
(setq transient-mark-mode t)
(column-number-mode t)
(setq frame-title-format "%b - emacs")
(fset 'yes-or-no-p 'y-or-n-p)
(mouse-wheel-mode t)
(global-hl-line-mode t)
(setq undo-limit 100000)

;; Font
(set-default-font "Inconsolata-10")
