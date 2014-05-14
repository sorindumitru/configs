(require 'package)
(package-initialize)

(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defvar elpa-package-list '(
			    ack-and-a-half
			    cmake-mode
			    cmake-project
			    cpputils-cmake
			    flycheck
			    flymake
			    guru-mode
			    magit
			    yasnippet
			    yasnippet-bundle
			    helm
			    helm-ack
			    helm-flycheck
			    helm-flymakeo
			    ;; Themes
			    ample-zen-theme
			    gandalf-theme
			    late-night-theme
			    monokai-theme
			    tron-theme
			    twilight-theme
			    waher-theme
			    zenburn-theme
			     ))


(defun elpa-packages-installed-p ()
  (loop for pkg in elpa-package-list
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (elpa-packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg elpa-package-list)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
