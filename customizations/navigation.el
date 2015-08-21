;; Fix the dumb some-buffer<num> view of identical buffers
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Let's have a view of recently edited files
(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 40)

;; Use ido-mode for easier choice navigation when switching buffers
;; like with a list or whatevs. Like minimizing the list of buffers
;; from partially typed input
(ido-mode t)

;; Let's also match on multiple partials.
(setq ido-enable-flex-matching t)

;; This is purely stolen from emacs-for-clojure.
;; Not sure if it's actually helpful.
(setq ido-use-filename-at-point nil)

;; Don't match on all working dirs; just this one.
(setq ido-auto-merge-work-directories-length -1)

;; Remember recent buffers when matching with ido
(setq ido-use-virtual-buffers t)

;; Use ido wherever
(ido-ubiquitous-mode 1)

;; Show buffer list with C-x C-b
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Use smex with M-x to run commands more easily.
;; Mostly to not use a minibuf to list choices.
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; Projectile is everywhere
(projectile-global-mode)

;; Expose this
(provide 'navigation)
