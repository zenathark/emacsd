(setq require-final-newline t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)

;;; graphene based config

;;; save frame geometry
(desktop-save-mode 0)

;;; improve rendering 
(setq redisplay-dont-pause t)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq scroll-step 1)
(setq scroll-margin 3)

(defun zen-look-startup-after-init (frame)
  "Load defaults for the overall look -- to be called after loading the init file so as to pick up custom settings."
  (progn 
  (select-frame frame)
    (progn
      (setq sml/theme 'respectful)
      (require 'zen-darktooth)
      (sml/setup)
      (menu-bar-mode 1)
      (setq-default line-spacing 2)
      (add-to-list 'default-frame-alist '(internal-border-width . 0))
      (set-fringe-mode '(4 . 0))
      (set-face-font 'default "DejaVu Sans Mono-12")
      (set-face-font 'variable-pitch "DejaVu Sans-12")
      (setq linum-format " %4d  ")
      (set-face-font 'fixed-pitch "DejaVu Sans Mono-12"))
    ;; (progn
    ;;   (setq sml/theme 'respectful)
    ;;   (require 'zen-lecture)
    ;;   (sml/setup)
    ;;   (setq linum-format " %4d  ")
    ;;   (menu-bar-mode 1)
      ))

(add-hook 'after-make-frame-functions 'zen-look-startup-after-init)

(provide 'zen-look)
