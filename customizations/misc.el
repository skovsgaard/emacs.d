;; Change all the yes/no's to y/n instead
(fset 'yes-or-no-p 'y-or-n-p)

;; Shell script stuff
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; Please don't use lockfiles
(setq create-lockfiles nil)

;; Start up a scratch buffer on bare startup
(setq inhibit-startup-message t)

;; Expose this
(provide 'misc)
