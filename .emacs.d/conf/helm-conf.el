(require 'helm-config)

(helm-mode 1)

(setq helm-idle-delay 0.1)
(setq helm-input-idle-delay 0.1)

(setq helm-locate-command "locate %.0s %s")
(dolist (ext '("\\.swf$" "\\.elc$" "\\.pyc$"))
      (add-to-list 'helm-boring-file-regexp-list ext))
(global-set-key (kbd "C-c C-f") 'helm-for-files)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)