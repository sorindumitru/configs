(require 'package)
(package-initialize)

(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defvar elpa-package-list '(
			  ack-and-a-half
			  aurel
			  bookmark+
			  cmake-mode
			  evil
			  helm
			  haskell-mode
			  magit
			  oldlace-theme
			  powerline
			  perspective
			  rust-mode
			  sublime-themes
			  twilight-theme
			  ))


(defun package-install-all ()
  (dolist (pkg elpa-package-list)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(load "~/.emacs.d/conf/helm-conf.el")
(load "~/.emacs.d/conf/evil-conf.el")
(load "~/.emacs.d/conf/rust-conf.el")
