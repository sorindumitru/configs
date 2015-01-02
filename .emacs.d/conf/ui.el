(setq inhibit-splash-screen t initial-scratch-message nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(defalias 'yes-or-no-p 'y-or-n-p)

(set-default-font "Pragmata Pro")

(when (window-system)
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1))

(load-theme 'hickey t)

(global-hl-line-mode 1)
(show-paren-mode 1)

(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(defun my-create-non-existent-directory ()
  (let ((parent-directory (file-name-directory buffer-file-name)))
    (when (and (not (file-exists-p parent-directory))
	       (y-or-n-p (format "Directory `%s' does not exist! Create it?" parent-directory)))
      (make-directory parent-directory t))))
(add-to-list 'find-file-not-found-functions #'my-create-non-existent-directory)

(add-hook 'org-mode-hook 'turn-on-flyspell)
