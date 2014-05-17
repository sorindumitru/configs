(require 'yasnippet)
(require 'yasnippet-bundle)
(yas-global-mode 1)

(defun helm-yas-select (prompt choices &optional display-fn)
  "Use helm to select a snippet. Put this into `yas/prompt-functions.'"
  (interactive)
  (setq display-fn (or display-fn 'identity))
  (if (require 'helm-config)
      (let (tmpsource cands result rmap)
	(setq cands (mapcar (lambda (x) (funcall display-fn x)) choices))
	(setq rmap (mapcar (lambda (x) (cons (funcall display-fn x) x)) choices))
	(setq tmpsource
	      (list
	       (cons 'name prompt)
	       (cons 'candidates cands)
	       '(action . (("Expand" . (lambda (selection) selection))))
	       ))
	(setq result (helm-other-buffer '(tmpsource) "*helm-select-yasnippet"))
	(if (null result)
	    (signal 'quit "user quit!")
	  (cdr (assoc result rmap))))
    nil))

(global-set-key (kbd "<C-tab>") 'helm-yas-select)
