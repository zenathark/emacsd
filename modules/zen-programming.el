(require 'magit)

(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode t)

(require 'smartparens-config)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)

(defun zen-set-programming-env ()
  (linum-mode 1)
  (hl-line-mode 1)
  (hlinum-activate)
  (toggle-truncate-lines)
  (smartparens-mode 1)
  (show-smartparens-mode 1))

(provide 'zen-programming)
