;;; zen-evil.el --- Provides evil custom config

;; Author: Juan C. Galan-Hernandez <jcgalanh@gmail.com>
;; Version: 0.1
;; Package-Requires: ()
;; Keywords: keybinding

;;; Commentary:

;; This package provides a custom keybinding environment

;;; Code:

(require 'zen-keybindings)

;; Ace jump
(add-to-list 'z-evil-normal-keys '("j w" evil-ace-jump-word-mode))
(add-to-list 'z-evil-normal-keys '("j l" evil-ace-jump-line-mode))
(add-to-list 'z-evil-normal-keys '("j c" evil-ace-jump-char-mode))
(add-to-list 'z-evil-visual-keys '("j w" evil-ace-jump-word-mode))
(add-to-list 'z-evil-visual-keys '("j l" evil-ace-jump-line-mode))
(add-to-list 'z-evil-visual-keys '("j c" evil-ace-jump-char-mode))
(add-to-list 'z-emacs-keys '("j w" ace-jump-word-mode))
(add-to-list 'z-emacs-keys '("j l" ace-jump-line-mode))
(add-to-list 'z-emacs-keys '("j c" ace-jump-char-mode))
(add-to-list 'z-emacs-keys '("j w" ace-jump-word-mode))
(add-to-list 'z-emacs-keys '("j l" ace-jump-line-mode))
(add-to-list 'z-emacs-keys '("j c" ace-jump-char-mode))
(add-to-list 'z-global-keys '("w" ace-window))
(add-to-list 'z-global-keys '("s" ace-swap-window))
(add-to-list 'z-global-keys '("d" ace-delete-window))

;; zen-evil
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(add-to-list 'z-emacs-keys '("l" evilnc-quick-comment-or-uncomment-to-the-line))
(add-to-list 'z-emacs-keys '("c l" evilnc-copy-and-comment-lines))
(add-to-list 'z-emacs-keys '("c p" evilnc-comment-or-uncomment-paragraphs))
(add-to-list 'z-global-keys '("C-c i" evilnc-comment-or-uncomment-lines))
(add-to-list 'z-global-keys '("C-c l" evilnc-quick-comment-or-uncomment-to-the-line))
(add-to-list 'z-global-keys '("C-c c" evilnc-copy-and-comment-lines))
(add-to-list 'z-global-keys '("C-c p" evilnc-comment-or-uncomment-paragraphs))
(add-to-list 'z-global-keys '("C-c r" comment-or-uncomment-region))
(add-to-list 'z-global-keys '("C-c v" evilnc-toggle-invert-comment-line-by-line))

;; Helm

(add-to-list 'z-evil-normal-keys '("M-x" helm-M-x))
(add-to-list 'z-evil-normal-keys '("C-f" helm-find-files))
(add-to-list 'z-evil-normal-keys '("C-b" helm-buffers-list))

(add-to-list 'z-global-keys '("p h" helm-projectile))
(add-to-list 'z-global-keys '("p p" helm-projectile-switch-project))
(add-to-list 'z-global-keys '("p f" helm-projectile-find-file))
(add-to-list 'z-global-keys '("p F" helm-projectile-find-file-in-known-projects))
(add-to-list 'z-global-keys '("p g" helm-projectile-find-file-dwim))
(add-to-list 'z-global-keys '("p d" helm-projectile-find-dir))
(add-to-list 'z-global-keys '("p e" helm-projectile-recentf))
(add-to-list 'z-global-keys '("p a" helm-projectile-find-other-file))
(add-to-list 'z-global-keys '("p i" projectile-invalidate-cache))
(add-to-list 'z-global-keys '("p z" projectile-cache-current-file))
(add-to-list 'z-global-keys '("p b" helm-projectile-switch-project))
(add-to-list 'z-global-keys '("p s g" helm-projectile-grep))
(add-to-list 'z-global-keys '("p s a" helm-projectile-ack))
(add-to-list 'z-global-keys '("p s s" helm-projectile-ag))
(add-to-list 'z-global-keys '("u f" helm-gtags-find-tag))
(add-to-list 'z-global-keys '("u s" helm-gtags-find-symbol))
;; Special keybindings

(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(provide 'zen-keymap)
;;; zen-keymap ends here
