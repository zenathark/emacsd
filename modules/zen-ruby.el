(require 'bundler)
(require 'rbenv)
(require 'slim-mode)

(global-rbenv-mode)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$'" . yaml-mode))

(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(require 'sass-mode)
(require 'haml-mode)

(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\(Rake\\|Thor\\|Guard\\|Gem\\|Cap\\|Vagrant\\|Berks\\|Pod\\|Puppet\\)file\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.\\(rb$\\|rabl\\|ru\\|builder\\|rake\\|thor\\|gemspec\\|jbuilder\\)\\'" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(add-to-list 'company-backends 'company-robe)

(mapc (lambda (extras)
	(add-hook 'enh-ruby-mode-hook extras))
	    '(flycheck-mode
	      evil-local-mode
	      robe-mode
	      rbenv-use-corresponding
	      projectile-rails-on
	      ))


					
(provide 'zen-ruby)
