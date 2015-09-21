(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("36affb6b6328d2bfa7a31b3183cd65d6dd1a8c0945382f94de729233b9737359" "57be31835729088a4a40e6ca28dae7779544dab6a321a44ade4d54d48f88933a" "8e8c04a15759044f46a78298a3b1ae524f8594511aa5173a3c0588fd0be8488d" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "13590cc9554286c8e893463fd8e0dad7134d6b7db10060afbb6850db3e395f17" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq inhibit-startup-message t)
(setq magit-last-seen-setup-instructions "1.4.0")
;;; Initialize package manager

(require 'cask "~/.cask/cask.el")
(add-to-list 'load-path "~/.emacs.d/modules/")
(add-to-list 'load-path "~/.emacs.d/themes/")

(package-initialize)

(cask-initialize)
(require 'pallet)
(pallet-mode t)
(set-language-environment "utf-8")
(require 'zen-look)
(require 'zen-programming)
(require 'zen-evil)
(require 'zen-helm)
(require 'zen-acejump)
(require 'zen-keymap)
(require 'zen-elisp)
(require 'zen-misc)
(require 'zen-web)
(require 'zen-ruby)
(require 'zen-racket)
(require 'zen-python)

;(if (eq system-type 'darwin)
;    (progn
;      (require 'env-var-import)
;      (env-var-import)))
