;;; graphene based config

(defun zen-look-startup-after-init ()
  "Load defaults for the overall look -- to be called after loading the init file so as to pick up custom settings."
  (if t
      (progn
        (setq-default line-spacing 2)
        (add-to-list 'default-frame-alist '(internal-border-width . 0))
        (set-fringe-mode '(8 . 0)))
    ;; Menu bar always off in text mode
    (menu-bar-mode 1)))

(add-hook 'after-init-hook 'zen-look-startup-after-init)

(provide 'zen-look)
