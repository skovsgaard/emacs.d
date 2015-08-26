;; Highlight matching parens (always)
(show-paren-mode 1)

;; Set to 1 to highlight current line
(global-hl-line-mode 0)

;; Interactive bindings for isearch
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-r") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; NEVER hard tabs please and thank you :>
(setq-default indent-tabs-mode nil)

;; Remember where we were
(require 'saveplace)
(setq-default save-place t)

;; and keep track of it in here
(setq save-place-file (concat user-emacs-directory "places"))

;; Tell Emacs where to put the backup files
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)

;; How do we handle comments?
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

;; YAY RAINBOWS!
(rainbow-delimiters-mode-enable)

;; ALWAYS 2 space indents please and thank you :>
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

;; Force autoindent
(global-set-key (kbd "RET") 'newline-and-indent)

;; Don't need this
(setq electric-indent-mode nil)

;; Use company
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.5)

;; Expose this
(provide 'editing)
