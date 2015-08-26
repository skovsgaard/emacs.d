;; We don't really need a top bar
(menu-bar-mode -1)

;; Show line numbers
(global-linum-mode t)

;; Show column numbers too
(setq column-number-mode t)

;; This is mostly a thing for X-windowed Emacs
;; No scroll bars, please.
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Let's use Zenburn here because pretty fadedness.
(require 'zenburn-theme)

;; Make sure cut and paste works half okay.
(setq
 ;; Use the X windows clipbawd
 x-select-enable-clipboard t

 ;; In case of multi clipboards
 x-select-enable-primary t

 ;; Make sure Emacs has the pasted stuff in the kill ring when killing bufs
 save-interprogram-paste-before-kill t

 ;; Show opts before running apropos
 ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html

 ;; Allow mouse yank
 mouse-yank-at-point t)

;; Turn this off (set to 0) if you hate a blinky cursor.
(blink-cursor-mode 1)

;; Show full path in title bar
(setq-default frame-title-format "%b (%f)")

;; Don't pop up a font menu (also for Xorg stuff)
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; Don't ring a dumb, distracting bell
(setq ring-bell-function 'ignore)

;; Expose this
(provide 'ui)
