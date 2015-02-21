
(require 'magit)

(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode t)

(require 'flycheck)
(global-flycheck-mode)

(require 'smartparens-config)
(smartparens-global-mode t)
;; (show-smartparens-global-mode t)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(delete 'company-eclim company-backends)
(push '(company-semantic :with company-yasnippet) company-backends)
(defun company-yasnippet-or-completion ()
  (interactive)
  (if (yas/expansion-at-point)
  (progn (company-abort)
         (yas-expand))
  (company-complete-common)))

(defun yas/expansion-at-point ()
  (first (yas--current-key)))

(define-key company-active-map (kbd "TAB") 'company-yasnippet-or-completion)
(define-key company-active-map (kbd "<tab>") 'company-yasnippet-or-completion)
(provide 'zen-misc)
