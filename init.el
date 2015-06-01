;;; Initialize package manager
(if (eq system-type 'darwin)
    (require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
  (require 'cask "~/.cask/cask.el"))
(add-to-list 'load-path "~/.emacs.d/modules/")
(add-to-list 'load-path "~/.emacs.d/themes/")

(package-initialize)

(cask-initialize)
(require 'pallet)
(pallet-mode t)


(if (eq system-type 'darwin)
    (progn
      (require 'env-var-import)
      (env-var-import)))

(setq magit-last-seen-setup-instructions "1.4.0")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))))

(require 'zen-moe)
(require 'zen-misc)
(require 'zen-helm)
(require 'zen-acejump)
(require 'zen-elisp)
(require 'zen-clojure)
(require 'zen-python)

;(add-hook 'emacs-lisp-mode-hook
;	  (lambda ()
;	    (linum-mode 1)))
;(setq linum-format " %4d ")



;;; Development Customs

;(require 'markdown-mode)
;(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
;(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;(require 'yasnippet)
;(setq yas-snippet-dirs '("~/.emacs.d/yasnippets"))
;(yas-global-mode t)

;; (require 'auto-complete-config)
;; (ac-config-default)
;; (push 'ac-source-gtags ac-sources)
;; (push 'ac-source-yasnippet ac-sources)

;(require 'flycheck)
;(add-hook 'prog-mode-hook 'flycheck-mode)

;;; Web Development

;(require 'web-mode)
;(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
;(add-hook 'web-mode-hook
;	  (lambda ()
;	    (progn
;	      (setq web-mode-markup-indent-offset 2))))

;(require 'know-your-http-well)

;(require 'restclient)

;(require 'company-restclient)
;(push 'company-restclient company-backends)

;(require 'less-css-mode)
;(add-to-list 'auto-mode-alist '("\\.less\\'" . less-css-mode))

;;(require 'js2-mode)
;;(push '("\\.js\\'" . js2-mode) auto-mode-alist)
;;(push '("node" . js2-mode) interpreter-mode-alist)

;(require 'impatient-mode)
;(add-hook 'web-mode-hook 'impatient-mode)

;(require 'cider)

;(require 'clojure-mode)

;; (require 'paredit)
;; (add-hook 'scheme-mode-hook #'enable-paredit-mode)

;(require 'rainbow-delimiters)
;(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
;(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
;(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)

;(require 'mic-paren)
;(paren-activate)

;(require 'smartparens-config)

;(require 'eval-sexp-fu)

;;; Java

;;(add-hook 'java-mode-hook 'rainbow-delimiters-mode)
;;(add-hook 'java-mode-hook 'ggtags-mode)
;; 	  '(when (derived-mode-p 'java-mode)
;; 	    (ggtags-mode 1)))

;;; Evil Mode


;;; Keyboard bindings

;; ; Ace Window
;; (global-set-key (kbd "M-p") 'ace-window)
;; (key-chord-define-global ",w" 'ace-window)
;; (key-chord-define-global ",s" 'ace-swap-window)
;; (key-chord-define-global ",d" 'ace-delete-window)


;; ; evil
;; (define-key evil-normal-state-map (kbd "SPC") 'evil-execute-in-emacs-state)
;; (evil-leader/set-leader ",")
;; (evil-leader/set-key "ci" 'evilnc-comment-or-uncomment-lines)
;; (evil-leader/set-key "e" 'evil-ace-jump-word-mode)
;; (evil-leader/set-key "l" 'evil-ace-jump-line-mode)
;; (evil-leader/set-key "." 'evil-ace-jump-char-mode)
;; (key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
;; (key-chord-define evil-insert-state-map "th" 'evil-normal-state)
;; (key-chord-define evil-visual-state-map "th" 'evil-normal-state)
;; (key-chord-define evil-visual-state-map "ht" 'evil-normal-state)
;; (key-chord-define evil-visual-state-map "ht" 'evil-normal-state)
;; (define-key evil-normal-state-map [escape] 'keyboard-quit)
;; (define-key evil-visual-state-map [escape] 'keyboard-quit)
;; (global-set-key [escape] 'evil-exit-emacs-state)

;; ;; HELM 
;; (key-chord-define-global ",x" 'helm-M-x)
;; (key-chord-define-global ",f" 'helm-find-files)
;; (key-chord-define-global ",b" 'helm-buffers-list)
;; (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; ;; Projectile

;; (key-chord-define-global ",r" 'helm-projectile)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t (:background "gray19")))))
