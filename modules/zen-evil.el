;;; zen-evil.el --- Provides evil custom config

;; Author: Juan C. Galan-Hernandez <jcgalanh@gmail.com>
;; Version: 0.1
;; Package-Requires: ()
;; Keywords: evil

;;; Commentary:

;; This package provides a custom evil environment

;;; Code:

(require 'zen-keybindings)

(require 'evil-leader)
(global-evil-leader-mode)

(require 'evil)
(evil-mode 1)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'evil-numbers)

(require 'key-chord)
(key-chord-mode 1)

;;;Fix text object
;;;bind evil-args text objects
(require 'evil-args)

(require 'key-chord)

(require 'evil-nerd-commenter)

;; Keybindings (fix)
(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)
(define-key evil-normal-state-map "L" 'evil-forward-arg)
(define-key evil-normal-state-map "H" 'evil-backward-arg)
(define-key evil-motion-state-map "L" 'evil-forward-arg)
(define-key evil-motion-state-map "H" 'evil-backward-arg)
(define-key evil-normal-state-map "K" 'evil-jump-out-args)
(define-key evil-normal-state-map (kbd "SPC") 'evil-execute-in-emacs-state)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
(key-chord-define evil-insert-state-map "th" 'evil-normal-state)
(key-chord-define evil-visual-state-map "th" 'evil-normal-state)
(key-chord-define evil-visual-state-map "ht" 'evil-normal-state)
(key-chord-define evil-visual-state-map "ht" 'evil-normal-state)
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)


;; Keybindings

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

(provide 'zen-evil)

;;; zen-evil.el ends here
