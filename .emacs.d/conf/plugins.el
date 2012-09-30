(add-to-list 'load-path "~/.emacs.d/vendor")

;; Ido mode:
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Flymake
(require 'flymake)

;; Tramp mode
(require 'tramp)
(setq tramp-default-user "sorin")

;; Color theme
(require 'color-theme)
(color-theme-initialize)
(setq load-path (cons "~/.emacs.d/conf/themes" load-path))
(load "color-theme-solarized")
(load "color-theme-molokai-ob")
(load "color-theme-blackboard")
(color-theme-blackboard)

;; Python mode
(econf:load-plugin "python-mode")
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;; Anything
(require 'anything)

;; Yasnippet
(econf:load-plugin "yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet/snippets/")

;; Haskell mode
(load "~/.emacs.d/conf/haskell/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; Whitespace
;(require 'whitespace)
;(global-whitespace-mode t)
;(global-whitespace-toggle-options '(N n N))

;; Octave
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))

;; Autocomplete
(econf:load-plugin "autocomplete")
(require 'auto-complete-config)
(ac-config-default)

(global-linum-mode t)
