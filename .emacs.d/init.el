(setq custom-file "~/.emacs-custom.el")

;; add repositories
(require 'package)
(add-to-list 'package-archives '("gnu". "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org". "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

;; initialize use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; design
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-splash-screen t)
(use-package zenburn-theme)
(set-face-attribute 'default nil :height 100) ;set font size to 10

;; interface
(use-package evil) ;vi bindings
(evil-mode t)
(use-package helm) ;fuzzy search
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;; packages
(use-package magit)
(use-package org
  :pin org)

