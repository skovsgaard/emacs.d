;;;;
;; Elixir
;;;;

;; Use the right modes
(require 'elixir-mode)
(require 'alchemist)

;; Use smartparens
(defun my-elixir-do-end-close-action (id action context)
  (when (eq action 'insert)
    (newline-and-indent)
    (forward-line -1)
    (indent-according-to-mode)))

(eval-after-load 'smartparens
  '(progn
     (defun my-elixir-do-end-close-action (id action context)
       (when (eq action 'insert)
         (newline-and-indent)
         (previous-line)
         (indent-according-to-mode)))

     (sp-with-modes '(elixir-mode)
       (sp-local-pair "->" "end"
                      :when '(("RET"))
                      :post-handlers '(:add my-elixir-do-end-close-action)
                      :actions '(insert)))

     (sp-with-modes '(elixir-mode)
       (sp-local-pair "do" "end"
                      :when '(("SPC" "RET"))
                      :post-handlers '(:add my-elixir-do-end-close-action)
                      :actions '(insert)))))

(defun t-elixir-mode-hook ()
  (alchemist-mode)
  (smartparens-mode))

(defun t-erlang-mode-hook ()
  (define-key erlang-mode-map (kbd "M-,") 'alchemist-goto-jump-back))

(add-hook 'elixir-mode-hook 't-elixir-mode-hook)
(add-hook 'erlang-mode-hook 't-erlang-mode-hook)

;; Make doc lookup easier
(global-set-key (kbd "C-x '") 'alchemist-help-search-at-point)

;; Expose this
(provide 'setup-elixir)
