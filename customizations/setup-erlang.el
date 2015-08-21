;;;;
;; Erlang
;;;;


;; Change the path here, depending on where your Erlang install is.
(setq load-path (cons "/usr/lib64/erlang/lib/tools-2.7.1/emacs" load-path))
(setq erlang-root-dir "/usr/lib64/erlang")
(setq exec-path (cons "/usr/lib64/erlang/bin" exec-path))
(require 'erlang-start)

;; Expose this
(provide 'setup-erlang)
