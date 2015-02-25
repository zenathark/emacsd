;;; zen-helm.el --- Provides helm custom config

;; Author: Juan C. Galan-Hernandez <jcgalanh@gmail.com>
;; Version: 0.1
;; Package-Requires: ()
;; Keywords: helm
;;; Commentary:

;; This package provides a custom helm environment

;;; Code:
(require 'zen-keybindings)

(require 'projectile)

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

(require 'helm-projectile)
(helm-projectile-on)
(require 'helm-gtags)
(helm-gtags-mode)
;; Keybindings

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


(provide 'zen-helm)

;;; zen-helm.el ends here
