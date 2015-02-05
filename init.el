;;; Initialize package manager
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)
(require 'use-package)

(if (eq system-type 'darwin)
    (use-package env-var-import
      :ensure
      :init
      (env-var-import)))

;;; CUA Mode
(cua-mode t)

;;; Remove welcome screen
(setq inhibit-startup-message t)

;;; evil setup
(use-package evil-leader
  :ensure
  :init
  (global-evil-leader-mode)
  (evil-leader/set-leader ","))

(use-package evil
  :ensure
  :init
  (progn
    (evil-mode t)
    (define-key evil-normal-state-map (kbd "SPC") 'evil-execute-in-emacs-state)))

(use-package evil-surround
  :ensure
  :init
  (global-evil-surround-mode 1))

(use-package evil-numbers
  :ensure
  :init
  (progn
    (global-set-key (kbd "C-a") 'evil-numbers/dec-at-pt)
    (global-set-key (kbd "C-o") 'evil-numbers/dec-at-pt)))
(use-package key-chord
  :ensure
  :init
  (progn
    (key-chord-mode 1)
    (key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
    (key-chord-define evil-insert-state-map "th" 'evil-normal-state)
    (key-chord-define evil-visual-state-map "th" 'evil-normal-state)
    (key-chord-define evil-visual-state-map "ht" 'evil-normal-state)
    (key-chord-define evil-visual-state-map "ht" 'evil-normal-state)))

;;Insert only one character, it can be usefull for more stuff

(use-package ace-jump-mode
  :ensure
  :init
  (progn
    (evil-leader/set-key "e" 'evil-ace-jump-word-mode)
    (evil-leader/set-key "l" 'evil-ace-jump-line-mode)
    (evil-leader/set-key "x" 'evil-ace-jump-char-mode)
    (evil-leader/set-key "w" 'ace-window)
    (evil-leader/set-key "sw" 'ace-swap-window)
    (evil-leader/set-key "dw" 'ace-delete-window)
    (setq aw-keys '(?a ?o ?e ?u ?i ?h ?t ?n ?s))))

;;;Fix text object
;;;bind evil-args text objects
(use-package evil-args
  :ensure
  :init
  (progn
    (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
    (define-key evil-outer-text-objects-map "a" 'evil-outer-arg)
    (define-key evil-normal-state-map "L" 'evil-forward-arg)
    (define-key evil-normal-state-map "H" 'evil-backward-arg)
    (define-key evil-motion-state-map "L" 'evil-forward-arg)
    (define-key evil-motion-state-map "H" 'evil-backward-arg)
    (define-key evil-normal-state-map "K" 'evil-jump-out-args)))

(use-package evil-nerd-commenter
  :ensure
  :init
  (progn
    (evilnc-default-hotkeys)
    (evil-leader/set-key ",ci" 'evilnc-comment-or-uncomment-lines)))

(use-package ace-window
  :ensure
  :init
  (global-set-key (kbd "M-p") 'ace-window))

(use-package helm
  :ensure
  :init
  (progn
    (require 'helm-config)
    (helm-mode t)
    (evil-leader/set-key "f" 'helm-find-files)
    (evil-leader/set-key "b" 'helm-buffers-list)
    (key-chord-define-global ";;" 'helm-M-x)
    ;; esc quits
    (defun minibuffer-keyboard-quit ()
      "Abort recursive edit. In Delete Selection mode, if the mark is active, just deactivate it;then it takes a second \\[keyboard-quit] to abort the minibuffer."
      (interactive)
      (if (and delete-selection-mode transient-mark-mode mark-active)
	  (setq deactivate-mark  t)
	(when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
	(abort-recursive-edit)))
    (define-key evil-normal-state-map [escape] 'keyboard-quit)
    (define-key evil-visual-state-map [escape] 'keyboard-quit)
    (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
    (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
    (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
    (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
    (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
    (global-set-key [escape] 'evil-exit-emacs-state)))

;;; Visual Tweaks

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default))))

(use-package smart-mode-line
  :ensure
  :init
  (sml/setup))

(column-number-mode 1)


(scroll-bar-mode 0)

(tool-bar-mode 0)

(menu-bar-mode 0)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t (:background "gray19")))))

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (linum-mode 1)))
(setq linum-format " %4d ")

(use-package moe-theme
  :ensure
  :init
  (moe-dark)
  (moe-theme-set-color 'cyan)
)

(add-to-list 'default-frame-alist '(font . "Source Code Pro-14"))
(set-frame-font "Source Code Pro-14" nil t)

(use-package markdown-mode
  :ensure
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))))

(use-package magit
  :ensure)

(use-package cider
  :ensure)

(use-package clojure-mode
  :ensure)

(use-package paredit
  :ensure
  :init
  (add-hook 'scheme-mode-hook #'enable-paredit-mode))

(use-package rainbow-delimiters
  :ensure
  :init
  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode))

(use-package mic-paren
  :ensure
  :init
  (paren-activate))

(use-package smartparens
  :ensure
  :init
  (smartparens-mode))

(use-package eval-sexp-fu
  :ensure)
