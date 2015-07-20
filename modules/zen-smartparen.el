(require 'smartparens)

(sp-local-pair 'c++-mode "{" nil 
	       :post-handlers '((zen--sp-pair-electric-newline-and-indent "RET")))

(defun zen--sp-pair-electric-newline (&rest _ignored)
  (save-excursion
    (newline)
    (indent-according-to-mode)))

(defun zen--sp-pair-electric-newline-and-indent (&rest _ignored)
  (zen--sp-pair-electric-newline)
  (indent-according-to-mode))

;  (newline)
;  (indent-according-to-mode)
;  (forward-line -1)
;  (indent-according-to-mode))
