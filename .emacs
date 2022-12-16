;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)

(setq evil-want-keybinding nil)
;;; Code:

(setq package-archives
      '(("gnu" . "http://mirrors.163.com/elpa/gnu/")
        ("melpa" . "https://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(light-blue)))

;; (use-package exwm :ensure t)

(use-package avy-zap                 :ensure t)
(use-package clang-format            :ensure t)
(use-package column-enforce-mode     :ensure t)
(use-package company                 :ensure t)
(use-package counsel-projectile      :ensure t)
(use-package desktop-environment     :ensure t)
(use-package dirvish                 :ensure t)
(use-package dotenv-mode             :ensure t)
(use-package evil-collection         :ensure t)
(use-package exec-path-from-shell    :ensure t)
(use-package glsl-mode               :ensure t)
(use-package highlight-indent-guides :ensure t)
(use-package highlight-numbers       :ensure t)
(use-package hl-todo                 :ensure t)
(use-package ivy-posframe            :ensure t)
(use-package js2-mode                :ensure t)
(use-package lsp-ivy                 :ensure t)
(use-package lsp-ui                  :ensure t)
(use-package lua-mode                :ensure t)
(use-package mood-line               :ensure t)
(use-package pdf-tools               :ensure t)
(use-package pug-mode                :ensure t)
(use-package slime                   :ensure t)
(use-package smart-tab               :ensure t)
(use-package tide                    :ensure t)
(use-package use-package             :ensure t)
(use-package web-mode                :ensure t)
(use-package winum                   :ensure t)
(use-package yasnippet-snippets      :ensure t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-file "~/.emacs.d/functions.el")
(load-file "~/.emacs.d/config.el")

(setq config 'marco-meta)

(cond
 ((eql config 'marco-evil) (load-file "~/.emacs.d/marco-evil.el"))
 ((eql config 'marco-meta) (load-file "~/.emacs.d/marco-meta.el"))
 ((eql config 'marco-weird) (load-file "~/.emacs.d/marco-weird.el"))
 ((eql config 'marco-vanilla) (load-file "~/.emacs.d/marco-vanilla.el")))
