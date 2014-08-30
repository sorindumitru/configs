(require 'package)
(package-initialize)

(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defvar elpa-package-list '(
			  ack-and-a-half
			  aurel
			  cmake-mode
			  helm
			  magit
			  sublime-themes
			  twilight-theme
			  ))


(package-refresh-contents)
(dolist (pkg elpa-package-list)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(load "~/.emacs.d/conf/helm-conf.el")
