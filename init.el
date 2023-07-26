;; ~/.emacs.d/init.el

;; Set MELPA to run
(require 'package)
(add-to-list 'package-archives '("melpa"."http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Installing package from MELPA
(defvar myPackages
  '(better-defaults
    git-gutter
    elpy
    monokai-theme
    goto-chg
    evil
    flycheck
    doom-modeline
    smartparens
    )
  )

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

;; Set our integrated Python dev-env to work
(elpy-enable)

;; Load smartparens so it got autopairs
(require 'smartparens-config)
;; Add hook for elpy
(add-hook 'elpy-mode-hook #'smartparens-mode)

;; Set Monokai theme
(load-theme 'monokai t)

;; Basic costumization for better defaults
(setq inhibit-startup-mesaage t)
(global-linum-mode t)
(menu-bar-mode -1)
(set-display-table-slot standard-display-table 'wrap ?\ )

;; Enable Flycheck syntax checking
(when (require 'flycheck nil t)
  (setq elpy-modules
	(delq 'elpy-module-flymake elpy-modules)
	)
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Activate evil-mode
(require 'evil)
(evil-mode 1)

;; Enable gitgutter for git tracker
(global-git-gutter-mode +1)

;; Change statusbar to doom-modeline
(require 'doom-modeline)
(setq doom-modeline-modal 1)
(setq doom-modeline-modal-icon 1)
(doom-modeline-mode 1)

;; Put an end to the practice of backup files
(setq make-backup-files nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company-jedi better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
