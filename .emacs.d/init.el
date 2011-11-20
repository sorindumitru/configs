(defconst sd:emacs-config-dir "~/.emacs.d/conf/" "")

(defun sd:load-config-file (filelist)
  (dolist (file filelist)
    (load (expand-file-name
	   (concat sd:emacs-config-dir file)))
    (message "Loaded config file:%s" file)
  )
)

(sd:load-config-file '("general.el"
		       "plugins.el"
		       "bindings.el"
		       "indent.el"
		       )
)