(require 'package)

(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defvar elpa-package-list '(
			  aurel
			  bookmark+
			  cmake-mode
			  company
			  emms
			  evil
			  go-mode
			  go-projectile
			  helm
			  helm-cscope
			  haskell-mode
			  helm-gtags
			  helm-projectile
			  lenlen-theme
			  magit
			  oldlace-theme
			  powerline
			  perspective
			  persp-projectile
			  projectile
			  rust-mode
			  smart-mode-line
			  smart-mode-line-powerline-theme
			  solarized-theme
			  sublime-themes
			  twilight-theme
			  xcscope
			  ))

(package-initialize)
(dolist (pkg elpa-package-list)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(load "~/.emacs.d/conf/helm-conf.el")
(load "~/.emacs.d/conf/evil-conf.el")
(load "~/.emacs.d/conf/rust-conf.el")
(load "~/.emacs.d/conf/irc-conf.el")
(load "~/.emacs.d/conf/org-conf.el")
(load "~/.emacs.d/conf/emms-conf.el")
(load "~/.emacs.d/conf/sml-conf.el")
(load "~/.emacs.d/conf/go-conf.el")
(load "~/.emacs.d/conf/ggtags-conf.el")
