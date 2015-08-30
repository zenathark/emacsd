(require 'smartparens-config)
(require 'eval-sexp-fu)
(require 'zen-evil)
(require 'racket-mode)

(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))

(mapc (lambda (extras)
	(add-hook 'racket-mode-hook extras))
      '(rainbow-delimiters-mode
	evil-local-mode))

(provide 'zen-racket)
