
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(add-to-list 'company-backends 'company-anaconda)

(mapc (lambda (extras)
	(add-hook 'python-mode-hook extras))
	    '(zen-set-programming-env
	      anaconda-mode
	      eldoc-mode))
					
(provide 'zen-python)
