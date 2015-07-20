(require 'magit)

(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode t)

(require 'smartparens-config)
(add-hook 'after-init-hook 'global-company-mode)
(smartparens-global-mode 1)
(add-hook 'after-init-hook #'global-flycheck-mode)

(defun zen-set-programming-env ()
  (linum-mode 1)
  (hl-line-mode 1)
  (hlinum-activate)
  (toggle-truncate-lines))

(provide 'zen-programming)
