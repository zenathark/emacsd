(setq html-packages
      '(
	company
	css-mode
	emmet-mode
	evil-matchit
	flycheck
	helm-css-scss
	less-css-mode
	rainbow-delimiters
	scss-mode
	sass-mode
	tagedit
	web-mode
	haml-mode
	slim-mode
	company-web-html
	company-web-slim
	))

(zen-require html-packages)

(with-eval-after-load 'scss-mode
  (evil-leader/set-key-for-mode 'scss-mode "mgh" 'helm-css-scss))

(add-hook 'web-mode-hook (lambda ()
                          (add-to-list 'company-backends 'company-web-html)
                          ))
;; (zen-company-backends-hook 'web-mode-hook
;; 			   '(
;; 			     company-web-html
;; 			     company-css
;; 			     company-semantic
;; 			     company-capf
;; 			     company-dabbrev-code
;; 			     company-keywords
;; 			     company-files
;; 			     company-dabbrev
;; 			     ))

;; (zen-company-backends-hook 'css-mode-hook
;; 			   '(
;; 			     company-css
;; 			     company-semantic
;; 			     company-capf
;; 			     company-dabbrev-code
;; 			     company-keywords
;; 			     company-files
;; 			     company-dabbrev
;; 			     ))

(sp-local-pair 'web-mode "<% " " %>")
(sp-local-pair 'web-mode "{ " " }")
(sp-local-pair 'web-mode "<%= " " %>")
(sp-local-pair 'web-mode "<%# " " %>")
(sp-local-pair 'web-mode "<%$ " " %>")
(sp-local-pair 'web-mode "<%@ " " %>")
(sp-local-pair 'web-mode "<%: " " %>")
(sp-local-pair 'web-mode "{{ " " }}")
(sp-local-pair 'web-mode "{% " " %}")
(sp-local-pair 'web-mode "{%- " " %}")
(sp-local-pair 'web-mode "{# " " #}")

(evil-leader/set-key-for-mode 'web-mode
        "meh" 'web-mode-dom-errors-show
        "mgb" 'web-mode-element-beginning
        "mgc" 'web-mode-element-child
        "mgp" 'web-mode-element-parent
        "mgs" 'web-mode-element-sibling-next
        "mhp" 'web-mode-dom-xpath
        "mrc" 'web-mode-element-clone
        "mrd" 'web-mode-element-vanish
        "mrk" 'web-mode-element-kill
        "mrr" 'web-mode-element-rename
        "mrw" 'web-mode-element-wrap
        "mz" 'web-mode-fold-or-unfold
        ;; TODO element close would be nice but broken with evil.
        )

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.htm\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'"        . web-mode))
(add-to-list 'auto-mode-alist '("\\.eco\\'"        . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'"     . web-mode))

(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

(evil-define-key 'insert emmet-mode-keymap (kbd "TAB") 'emmet-expand-yas)
(evil-define-key 'insert emmet-mode-keymap (kbd "<tab>") 'emmet-expand-yas)
(evil-define-key 'emacs emmet-mode-keymap (kbd "TAB") 'emmet-expand-yas)
(evil-define-key 'emacs emmet-mode-keymap (kbd "<tab>") 'emmet-expand-yas)

(add-hook 'web-mode-hook 'evil-matchit-mode)

(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.less\\'" . less-css-mode))

(add-hook 'web-mode-hook 'flycheck-mode)
(add-hook 'scss-mode-hook 'flycheck-mode)
(add-hook 'sass-mode-hook 'flycheck-mode)
(add-hook 'less-css-mode 'flycheck-mode)

(with-eval-after-load 'tagedit
  (tagedit-add-experimental-features)
  (add-hook 'html-mode-hook (lambda () (tagedit-mode 1))))

(with-eval-after-load 'rainbow-delimiters
  (add-hook 'less-css-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'scss-mode-hook 'rainbow-delimiters-mode))

(provide 'zen-web)
