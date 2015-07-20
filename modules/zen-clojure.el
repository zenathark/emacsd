(require 'smartparens-config)
(require 'eval-sexp-fu)
(require 'zen-evil)
(require 'clojure-mode)
(require 'cider)

(defun zen-eval-sexp ()
  (evil-insert-mode)
  (eval-sexp)
  (evil-normal-mode))

(mapc (lambda (extras)
	(add-hook 'clojure-mode-hook extras))
      '(rainbow-delimiters-mode
	evil-local-mode))

(provide 'zen-clojure)
