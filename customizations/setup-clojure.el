;;;;
;; CLOJURE :D
;;;;

;; Use with paredit
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

;; In case of Java, prepare for camelCase
(add-hook 'clojure-mode-hook 'subword-mode)

;; Use the tasty syntax highlighting
(require 'clojure-mode-extra-font-locking)

;; Normal highlighting
(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "lein repl")
            (font-lock-add-keywords
             nil
             '(("(\\(facts?\\)"
                (1 font-lock-keyword-face))
               ("(\\(background?\\)"
                (1 font-lock-keyword-face))))
            (define-clojure-indent (fact 1))
            (define-clojure-indent (facts 2))))

;;;;
;; Stuff for working with CIDER
;;;;

;; Get a minibuf for documentation, live
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; Hop into the REPL when connected to nREPL
(setq cider-repl-pop-to-buffer-on-connect t)

;; Hop into error minibufs when they appear
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Where do we keep CIDER history?
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap navigation history
(setq cider-repl-wrap-history t)

;; Use paredit in the REPL too
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; Also use the clojure-mode for other relevant fileexts
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

;; Special keybinds for stuff like webdev
(defun cider-start-http-server ()
  (interactive)
  (cider-load-current-buffer)
  (let ((ns (cider-current-ns)))
    (cider-repl-set-ns ns)
    (cider-interactive-eval (format "(println '(def server (%s/start))) (println 'server)" ns))
    (cider-interactive-eval (format "(def server (%s/start)) (println server)" ns))))

(defun cider-refresh ()
  (interactive)
  (cider-interactive-eval (format "(user/reset)")))

(defun cider-user-ns ()
  (interactive)
  (cider-repl-set-ns "user"))

(eval-after-load 'cider
  '(progn
     (define-key clojure-mode-map (kbd "C-c C-v") 'cider-start-http-server)
     (define-key clojure-mode-map (kbd "C-M-r") 'cider-refresh)
     (define-key clojure-mode-map (kbd "C-c u") 'cider-user-ns)
     (define-key cider-mode-map (kbd "C-c u") 'cider-user-ns)))

;; Expose this
(provide 'setup-clojure)
