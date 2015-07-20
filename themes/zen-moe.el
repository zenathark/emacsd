;;; Remove welcome screen
(setq inhibit-startup-message t)

;(add-hook 'prog-mode-hook 'helm-gtags-mode)
;;; Visual Tweaks


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t (:background "gray19")))))

(require 'smart-mode-line)
(sml/setup)

(scroll-bar-mode 0)

(tool-bar-mode 0)

(menu-bar-mode 1)

;; (require 'moe-theme)
;; (moe-dark)
;; (moe-theme-set-color 'w/b)


(add-to-list 'default-frame-alist '(font . "Source Code Pro-11"))
(set-frame-font "Source Code Pro-11" nil t)

(provide 'zen-moe)
