# My emacs.d

Totally untested. Some parts may be missing like something I forgot to shove in the package list.

If I'm really lucky and it just works, the only thing this needs is for you to `git clone https://github.com/skovsgaard/emacs.d ~/.emacs.d` and fire up emacs.

The idea is to list appropriate packages in `init.el`.

This whole thing is largely stolen from [emacs-for-clojure](https://github.com/flyingmachine/emacs-for-clojure) but with additions for Elixir and Erlang. Also, inexplicably, Vala.

*Note:* Make sure to remove the `(require 'setup-erlang)` from `init.el` if you don't have Erlang installed. Also, even if you do, you should probably check in `customizations/setup-erlang.el` to see whether you have it installed in the same folder as I do.
