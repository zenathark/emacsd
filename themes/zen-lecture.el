(load-theme 'base16-hopscotch-light)
(require 'hlinum)
(hl-line-mode 1)

(set-face-attribute 'linum nil
		    :foreground "#303030"
		    :background "#ffffff")

(set-face-attribute 'linum-highlight-face nil
		    :foreground "#cccccc"
		    :background "#aaaaaa")

(set-face-attribute 'hl-line nil
		    :background "#dddddd")

(set-face-attribute 'region nil
		    :background "#aaaaaa")

(set-face-attribute 'cursor nil
		    :foreground "#000000")

;; (set-face-attribute 'mode-line nil
;; 		    :font "Lucida Grande-11")
;; (set-face-attribute 'mode-line-inactive nil
;; 		    :font "Lucida Grande-11")
;; (set-face-attribute 'minibuffer-prompt nil
;; 		    :font "Lucida Grande-11")

(provide 'zen-lecture)
