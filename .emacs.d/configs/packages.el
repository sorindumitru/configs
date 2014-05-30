(require 'package)
(package-initialize)

(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defvar elpa-package-list '(
			    ack-and-a-half
			    ac-etags
			    ac-c-headers
			    auto-complete
			    auto-complete-clang
			    blank-mode
			    cmake-mode
			    cmake-project
			    cpputils-cmake
			    ecb
			    flycheck
			    flymake
			    guru-mode
			    magit
			    yasnippet
			    yasnippet-bundle
			    helm
			    helm-ack
			    helm-c-yasnippet
			    helm-flycheck
			    helm-flymake
			    helm-ls-git
			    smart-tabs-mode
			    ;; Themes
			    afternoon-theme
			    ample-zen-theme
			    busybee-theme
			    flatui-theme
			    gandalf-theme
			    inkpot-theme
			    late-night-theme
			    monokai-theme
			    noctilux-theme
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
  (package-refresh-contents)
  (dolist (pkg elpa-package-list)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(load "~/.emacs.d/configs/packages/ack.el")
(load "~/.emacs.d/configs/packages/cedet.el")
(load "~/.emacs.d/configs/packages/ecb.el")
(load "~/.emacs.d/configs/packages/helm-conf.el")
(load "~/.emacs.d/configs/packages/smarttabs.el")
(load "~/.emacs.d/configs/packages/yas.el")
