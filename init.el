;;; Initialize package manager
(if (eq system-type 'darwin)
    (require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
  (require 'cask "~/.cask/cask.el"))

(cask-initialize)
(require 'pallet)
(pallet-mode t)

(if (eq system-type 'darwin)
    (progn
      (require 'env-var-import)
      (env-var-import)))

;;; CUA Mode
(cua-mode t)

;;; Remove welcome screen
(setq inhibit-startup-message t)



(require 'helm-config)
(helm-mode t)
;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit. In Delete Selection mode, if the mark is active, just deactivate it;then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(add-hook 'prog-mode-hook 'helm-gtags-mode)


;;; Visual Tweaks

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default))))

(require 'smart-mode-line)
(sml/setup)

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

(require 'moe-theme)
(moe-dark)
(moe-theme-set-color 'blue)


(add-to-list 'default-frame-alist '(font . "Source Code Pro-12"))
(set-frame-font "Source Code Pro-12" nil t)

(require 'magit)

;;; Development Customs

(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(require 'yasnippet)
(yas-global-mode t)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(delete 'company-eclim company-backends)

;; (require 'ac-helm
;;   :ensure
;;   )

(require 'flycheck)
(add-hook 'prog-mode-hook 'flycheck-mode)

(require 'projectile)
(projectile-global-mode)

(require 'helm-projectile)
(helm-projectile-on)

(defun gtags-root-dir ()
  "Return GTAGS root directory or nil if doesn't exists."
  (with-temp-buffer
    (if (zerop (call-process "global" nil t nil "-pr"))
	(buffer-substring (point-min) (1- (point-max)))
      nil)))

(defun gtags-update ()
  "Make GTAGS incremental update"
  (call-process "global" nil nil nil "-u"))

(defun gtags-update-hook ()
  (when (gtags-root-dir)
    (gtags-update)))

(add-hook 'after-save-hook #'gtags-update-hook)
;;; Web Development

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-hook 'web-mode-hook
	  (lambda ()
	    (progn
	      (setq web-mode-markup-indent-offset 2))))

(require 'know-your-http-well)

(require 'restclient)

(require 'company-restclient)
(push 'company-restclient company-backends)

(require 'less-css-mode)
(add-to-list 'auto-mode-alist '("\\.less\\'" . less-css-mode))

(require 'js2-mode)
(push '("\\.js\\'" . js2-mode) auto-mode-alist)
(push '("node" . js2-mode) interpreter-mode-alist)

(require 'impatient-mode)
(add-hook 'web-mode-hook 'impatient-mode)

(require 'cider)

(require 'clojure-mode)

(require 'paredit)
(add-hook 'scheme-mode-hook #'enable-paredit-mode)

(require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)

(require 'mic-paren)
(paren-activate)

(require 'smartparens-config)

(require 'eval-sexp-fu)

;;; Evil Mode

(require 'evil-leader)
(global-evil-leader-mode)

(require 'evil)
(evil-mode t)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'evil-numbers)
(global-set-key (kbd "C-a") 'evil-numbers/dec-at-pt)
(global-set-key (kbd "C-o") 'evil-numbers/dec-at-pt)

(require 'key-chord)
(key-chord-mode 1)

(require 'ace-jump-mode)
(setq aw-keys '(?a ?o ?e ?u ?i ?h ?t ?n ?s))

;;;Fix text object
;;;bind evil-args text objects
(require 'evil-args)
(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)
(define-key evil-normal-state-map "L" 'evil-forward-arg)
(define-key evil-normal-state-map "H" 'evil-backward-arg)
(define-key evil-motion-state-map "L" 'evil-forward-arg)
(define-key evil-motion-state-map "H" 'evil-backward-arg)
(define-key evil-normal-state-map "K" 'evil-jump-out-args)

(require 'evil-nerd-commenter)
(evilnc-default-hotkeys)

(require 'ace-window)

;;; Keyboard bindings

; Ace Window
(global-set-key (kbd "M-p") 'ace-window)
(key-chord-define-global ",w" 'ace-window)
(key-chord-define-global ",s" 'ace-swap-window)
(key-chord-define-global ",d" 'ace-delete-window)


; evil
(define-key evil-normal-state-map (kbd "SPC") 'evil-execute-in-emacs-state)
(evil-leader/set-leader ",")
(evil-leader/set-key "ci" 'evilnc-comment-or-uncomment-lines)
(evil-leader/set-key "e" 'evil-ace-jump-word-mode)
(evil-leader/set-key "l" 'evil-ace-jump-line-mode)
(evil-leader/set-key "h" 'evil-ace-jump-char-mode)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
(key-chord-define evil-insert-state-map "th" 'evil-normal-state)
(key-chord-define evil-visual-state-map "th" 'evil-normal-state)
(key-chord-define evil-visual-state-map "ht" 'evil-normal-state)
(key-chord-define evil-visual-state-map "ht" 'evil-normal-state)
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;; HELM 
(key-chord-define-global ",x" 'helm-M-x)
(key-chord-define-global ",f" 'helm-find-files)
(key-chord-define-global ",b" 'helm-buffers-list)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; Projectile

(key-chord-define-global ",r" 'helm-projectile)
