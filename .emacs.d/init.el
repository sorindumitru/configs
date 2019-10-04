(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(line-number-mode)
(hl-line-mode t)
(global-hl-line-mode)
(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(defalias 'yes-or-no-p 'y-or-n-p)

(set-frame-font "Fira Code 11")

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

(use-package eyebrowse
  :ensure t
  :defer t
  )

(use-package evil
  :ensure t
  :init
  (setq evil-toggle-key "C-`")
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
  (load-theme 'lab-dark t)
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

(use-package yasnippet
  :ensure t
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

(use-package magit
  :ensure t
  :defer t
  )

(load-theme 'badwolf t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c8f959fb1ea32ddfc0f50db85fea2e7d86b72bb4d106803018be1c3566fd6c72" "332e009a832c4d18d92b3a9440671873187ca5b73c2a42fbd4fc67ecf0379b8c" "071f5702a5445970105be9456a48423a87b8b9cfa4b1f76d15699b29123fb7d8" "018c8326bced5102b4c1b84e1739ba3c7602019c645875459f5e6dfc6b9d9437" "5e0b63e0373472b2e1cf1ebcc27058a683166ab544ef701a6e7f2a9f33a23726" "2d392972cbe692ee4ac61dc79907af65051450caf690a8c4d36eb40c1857ba7d" "a2286409934b11f2f3b7d89b1eaebb965fd63bc1e0be1c159c02e396afb893c8" "2b9dc43b786e36f68a9fd4b36dd050509a0e32fe3b0a803310661edb7402b8b6" "8e797edd9fa9afec181efbfeeebf96aeafbd11b69c4c85fa229bb5b9f7f7e66c" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "28335ebd9ad0ee69c9ce4157eb621bb93b1bc31d054b48952cb9887a4d863fad" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "bffb799032a7404b33e431e6a1c46dc0ca62f54fdd20744a35a57c3f78586646" "02199888a97767d7779269a39ba2e641d77661b31b3b8dd494b1a7250d1c8dc1" "801a567c87755fe65d0484cb2bded31a4c5bb24fd1fe0ed11e6c02254017acb2" "174502267725776b47bdd2d220f035cae2c00c818765b138fea376b2cdc15eb6" "9d36e7cbea9ab075fa1920275cbde349f5b80c9b901500d296856142b32c7516" "dbade2e946597b9cda3e61978b5fcc14fa3afa2d3c4391d477bdaeff8f5638c5" "341b2570a9bbfc1817074e3fad96a7eff06a75d8e2362c76a2c348d0e0877f31" "5e515425f8a5ce00097d707742eb5eee09b27cebc693b8998c734305cbdce1f5" "d14d421ff49120d2c2e0188bcef76008407b3ceff2cfb1d4bdf3684cf3190172" default)))
 '(package-selected-packages
   (quote
    (doom-themes nova-theme gruvbox-theme material-theme borland-blue-theme badwolf-theme srcery-theme lsp-treemacs helm-lsp lsp-ui lsp-mode rust-mode which-key use-package tao-theme spaceline popwin lab-themes helm-swoop helm-ag go-mode evil-surround eink-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
