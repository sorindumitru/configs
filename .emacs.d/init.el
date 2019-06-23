(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(line-number-mode)
(hl-line-mode t)
(global-hl-line-mode)
(setq inhibit-startup-screen t)
(set-frame-font "Iosevka 13")

(global-set-key (kbd "<f2>")
                (lambda
                  ()
                  (interactive)
(find-file "~/.emacs.d/init.el")))

(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
(package-install 'use-package))

(require 'use-package)

(use-package popwin
  :ensure t
  :config
  (progn
    (setq popwin:special-display-config nil)
    (push '("*Backtrace*"
            :dedicated t :position bottom :stick t :noselect nil :height 0.33)
          popwin:special-display-config)
    (push '("*compilation*"
            :dedicated t :position bottom :stick t :noselect t   :height 0.2)
          popwin:special-display-config)
    (push '("*Compile-Log*"
            :dedicated t :position bottom :stick t :noselect t   :height 0.33)
          popwin:special-display-config)
    (push '("*Help*"
            :dedicated t :position bottom :stick t :noselect nil :height 0.33)
          popwin:special-display-config)
    (push '("*Shell Command Output*"
            :dedicated t :position bottom :stick t :noselect nil :height 0.33)
          popwin:special-display-config)
    (push '("*undo-tree*"
            :dedicated t :position bottom :stick t :noselect nil :height 0.33)
          popwin:special-display-config)
    (push '("*Warnings*"
            :dedicated t :position bottom :stick t :noselect nil :height 0.33)
          popwin:special-display-config)
    (push '("^\\*Man .*\\*$"
            :regexp t    :position bottom :stick t :noselect nil :height 0.33)
            popwin:special-display-config)
(popwin-mode t)))

(use-package evil
  :ensure t
  :config
  (evil-mode t)
  )

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode t)
  )

(use-package which-key
  :ensure t
  )

(use-package lab-themes
  :ensure t
  :config
  (load-theme 'lab-light t)
  )

(use-package spaceline
  :ensure t
  :config
  (setq powerline-default-separator 'slant)
  )

(use-package spaceline-config :ensure spaceline
  :config
  (spaceline-helm-mode 1)
  (spaceline-emacs-theme)
  (setq powerline-default-separator 'slant)
  )

(use-package helm
  :ensure t
  :bind (
	 ("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x f" . helm-recentf)
         ("C-x l" . helm-locate)
         ("C-SPC" . helm-dabbrev)
         ("M-y" . helm-show-kill-ring)
	 ("C-x b" . helm-buffers-list))
  :config
  (helm-mode 1)
  )

(use-package helm-swoop
  :ensure t
  :bind (("M-s" . helm-swoop)
	 ("M-M" . helm-swoop-back-to-last-point))
  :init
  (bind-key "M-m" 'helm-swoop-from-isearch isearch-mode-map))

(use-package helm-ag
  :ensure helm-ag
  :bind ("M-p" . helm-projectile-ag)
  :commands (helm-ag helm-projectile-ag)
  :init (setq helm-ag-insert-at-point 'symbol
helm-ag-command-option "--path-to-ignore ~/.agignore"))

(use-package go-mode
  :defer t
  :ensure t
  :mode ("\\.go$" . go-mode)
  )

(use-package rust-mode
  :defer t
  :ensure t
  :mode ("\\.rust$" . rust-mode)
  )

(use-package company               
  :ensure t
  :defer t
  :init (global-company-mode)
  :config
  (progn
    ;; Use Company for completion
    (bind-key [remap completion-at-point] #'company-complete company-mode-map)

    (setq company-tooltip-align-annotations t
          ;; Easy navigation to candidates with M-<n>
          company-show-numbers t)
    (setq company-dabbrev-downcase nil))
  :diminish company-mode
  )
(use-package lsp-mode
  :ensure t
  :hook (c++-mode . lsp)
  :hook (c-mode . lsp)
  :hook (go-mode . lsp)
  :commands lsp)
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  )
(use-package company-lsp
  :ensure t
  )
(use-package helm-lsp
  :ensure t
  :commands
  helm-lsp-workspace-symbol
  )
(use-package lsp-treemacs
  :ensure t
  :commands
  lsp-treemacs-errors-list
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("5e515425f8a5ce00097d707742eb5eee09b27cebc693b8998c734305cbdce1f5" "d14d421ff49120d2c2e0188bcef76008407b3ceff2cfb1d4bdf3684cf3190172" default)))
 '(package-selected-packages
   (quote
    (lsp-treemacs helm-lsp lsp-ui lsp-mode rust-mode which-key use-package tao-theme spaceline popwin lab-themes helm-swoop helm-ag go-mode evil-surround eink-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
