(require 'smartparens-config)
(require 'eval-sexp-fu)
(require 'zen-evil)

(mapc (lambda (extras)
	(add-hook 'emacs-lisp-mode-hook extras))
	    '(rainbow-delimiters-mode
	      evil-local-mode))
					
(provide 'zen-elisp)
