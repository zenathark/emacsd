(require 'smartparens-config)
(require 'eval-sexp-fu)
(require 'zen-evil)
(require 'clojure-mode)
(require 'cider)

(mapc (lambda (extras)
	(add-hook 'clojure-mode extras))
	    '(rainbow-delimiters-mode
	      evil-local-mode
	      turn-on-eval-sexp-fu-flash-mode))
					
(provide 'zen-clojure)
