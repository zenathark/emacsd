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

(provide 'zen-helm)

;;; zen-helm.el ends here
