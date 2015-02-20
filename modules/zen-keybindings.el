;;; zen-keybindings.el --- Provides keybinding functions

;; Author: Juan C. Galan-Hernandez <jcgalanh@gmail.com>
;; Version: 0.1
;; Package-Requires: ((flange "1.0"))
;; Keywords: keys

;;; Commentary:

;; This package provides functions for double keybinding
;; emacs and evil


(require 'evil-leader)


;;; Code:
(defvar z-leader)
(defvar z-emacs-leader)
(defvar z-global-keys)
(defvar z-evil-normal-keys)
(defvar z-evil-visual-keys)
(defvar z-emacs-keys)

(setq z-leader ",")
(setq z-emacs-leader)
(setq z-global-keys (list))
(setq z-evil-normal-keys (list))
(setq z-evil-visual-keys (list))
(setq z-emacs-keys (list))

(defun emacs-to-evil (keys)
  (mapconcat (lambda (key)
		 (if (string-equal "M-" (substring key 0 2))
		     (concat "g " (substring key 2))
		   (substring key 2)))
	     (split-string keys)
	     " "))


(defun z-set-global-key ()
  (evil-leader/set-leader z-leader)
  ;;; Global keys
  (mapc (lambda (args)
	  (let ((key (car args)) (command (nth 1 args)))
	    (evil-leader/set-key (emacs-to-evil key) command)
	    (global-set-key (kbd (concat z-emacs-leader " " key)) command)))
	z-global-keys
	;; (list '("C-w" ace-window)
	;;       '("M-w C-s" ace-swap-window)
	;;       '("M-w C-d" ace-delete-window)
	;;       '("M-h C-w" evil-ace-jump-word-mode)
	;;       '("M-h C-l" evil-ace-jump-line-mode)
	;;       '("C-h" evil-ace-jump-char-mode)
	;;       '("M-f C-f" helm-find-files
	      )
  ;;; Evil normal mode keys
  (mapc (lambda (args)
	  (let ((key (car args)) (command (nth 1 args)))
	    (evil-leader/set-key (emacs-to-evil key) command)))
	z-evil-normal-keys
	      )
  ;;; Evil visual mode keys
  ;; (mapc (lambda (args)
  ;; 	  (let ((key (car args)) (command (nth 1 args)))
  ;; 	    (evil-leader/set-key-for-mode evil-visual-state-map key command)))
  ;; 	(list '("C-w" ace-window)
  ;; 	      ))
  ;;; EMACS mode keys
  (mapc (lambda (args)
	  (let ((key (car args)) (command (nth 1 args)))
	    (global-set-key (kbd (concat z-emacs-leader " " key)) command)))
	z-emacs-keys
	;; (list '("C-w" ace-window)
	;;       '("C-s" ace-swap-window)
	;;       '("C-d" ace-delete-window)
	;;       )
	))

(add-hook 'after-init-hook 'z-set-global-key)


(provide 'zen-keybindings)
;;; zen-keybindings.el ends here
