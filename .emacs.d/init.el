(defconst econf:emacs-config-dir "~/.emacs.d/conf/" "")
(defconst econf:emacs-vendor-dir "~/.emacs.d/vendor/" "")

(defun econf:load-config-file (filelist)
  (dolist (file filelist)
    (load (expand-file-name
	   (concat econf:emacs-config-dir file)))
    (message "Loaded config file:%s" file)
  )
)

(defun econf:load-plugin (plugin)
  (add-to-list 'load-path (expand-file-name
			  (concat econf:emacs-vendor-dir plugin)
			  )
	       )
)

(econf:load-config-file '("general.el"
		       "plugins.el"
		       "bindings.el"
		       "indent.el"
		       )
)

(put 'dired-find-alternate-file 'disabled nil)
