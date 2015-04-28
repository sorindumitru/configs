(require 'helm)
(require 'helm-config)

(helm-mode 1)

(setq helm-idle-delay 0.1)
(setq helm-input-idle-delay 0.1)

(if (string-equal system-type "darwin")
  (setq helm-locate-command "locate-with-mdfind %.0s %s")
  (setq helm-locate-command "locate %.0s %s")
  )
(dolist (ext '("\\.swf$" "\\.elc$" "\\.pyc$"))
      (add-to-list 'helm-boring-file-regexp-list ext))

(global-set-key (kbd "C-c C-f") 'helm-for-files)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-unset-key (kbd "C-x c"))

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

(setq helm-split-window-in-sidep t
      helm-move-to-line-cycle-in-source t
      helm-ff-search-library-in-sexp t
      helm-scroll-amount 8
      helm-ff-file-name-history-use-recentf t)


;; Enable helm-cscope-mode
(add-hook 'c-mode-hook 'helm-cscope-mode)
(add-hook 'c++-mode-hook 'helm-cscope-mode)
;; Set key bindings
(eval-after-load "helm-cscope"
  '(progn
     (define-key helm-cscope-mode-map (kbd "M-t") 'helm-cscope-find-symbol)
     (define-key helm-cscope-mode-map (kbd "M-r") 'helm-cscope-find-global-definition)
     (define-key helm-cscope-mode-map (kbd "M-g M-c") 'helm-cscope-find-called-function)
     (define-key helm-cscope-mode-map (kbd "M-g M-p") 'helm-cscope-find-calling-this-funtcion)
     (define-key helm-cscope-mode-map (kbd "M-s") 'helm-cscope-select)))
