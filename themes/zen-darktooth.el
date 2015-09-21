(load-theme 'darktooth)
(require 'hlinum)
(hl-line-mode 1)

(set-face-attribute 'linum nil
		    :foreground "#303030"
		    :background "#222222")

(set-face-attribute 'linum-highlight-face nil
		    :foreground "#66999D"
		    :background "#161616")

(set-face-attribute 'hl-line nil
		    :background "#252525")

(set-face-attribute 'mode-line nil
		    :font "Source Code Pro-11")
(set-face-attribute 'mode-line-inactive nil
		    :font "Source Code Pro-11")
(set-face-attribute 'minibuffer-prompt nil
		    :font "Source Code Pro-11")

(provide 'zen-darktooth)
