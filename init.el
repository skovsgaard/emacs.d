(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(;; Elixir basics!
    elixir-mode 

    ;; Elixir extensive!
    alchemist

    ;; Clojure basics!
    clojure-mode

    ;; Clojure highlighting!
    clojure-mode-extra-font-locking

    ;; Clojure extensive!
    cider

    ;; Get ido everywhere
    ido-ubiquitous

    ;; Lisp Flavored Erl mode
    lfe-mode

    ;; Better execs!
    smex

    ;; SmartParens
    smartparens

    ;; Better navigation!
    projectile

    ;; Fancy parens!
    rainbow-delimiters

    ;; Fancy HTML!
    tagedit

    ;; Parens handling!
    paredit

    ;; Pretty colors!
    zenburn-theme))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/vendor")

;; Customization stuff!

(add-to-list 'load-path "~/.emacs.d/customizations")

;; Load the whole dang thing
(require 'navigation)
(require 'ui)
(require 'editing)
(require 'misc)
(require 'elisp-editing)
(require 'setup-clojure)
(require 'setup-elixir)
(require 'setup-erlang)
(require 'setup-lfe)
(require 'setup-js)
