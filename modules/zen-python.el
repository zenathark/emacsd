(require 'smartparens-config)
(require 'eval-sexp-fu)
(require 'zen-evil)
(require 'python-mode)

(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(add-to-list 'company-backends 'company-anaconda)

(mapc (lambda (extras)
	(add-hook 'python-mode-hook extras))
	    '(flycheck-mode
	      evil-local-mode
	      anaconda-mode
	      eldoc-mode))


					
(provide 'zen-python)
