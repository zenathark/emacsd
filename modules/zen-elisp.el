(require 'eval-sexp-fu)

(mapc (lambda (extras)
	(add-hook 'emacs-lisp-mode-hook extras))
	    '(rainbow-delimiters-mode
	      ;evil-local-mode
	      zen-set-programming-env))
					
(provide 'zen-elisp)
