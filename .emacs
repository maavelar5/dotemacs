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
 '(custom-enabled-themes '(manoj-dark)))

;; (use-package exwm :ensure t)

(use-package avy-zap                 :ensure t)
(use-package clang-format            :ensure t)
(use-package column-enforce-mode     :ensure t)
(use-package company                 :ensure t)
(use-package counsel-projectile      :ensure t)
(use-package desktop-environment     :ensure t)
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
(use-package smart-tab               :ensure t)
(use-package tide                    :ensure t)
(use-package use-package             :ensure t)
(use-package web-mode                :ensure t)
(use-package winum                   :ensure t)
(use-package yasnippet-snippets      :ensure t)
(use-package rainbow-delimiters      :ensure t)
(use-package rainbow-identifiers     :ensure t)
(use-package color-identifiers-mode  :ensure t)
(use-package fancy-battery      :ensure t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 120 :foundry "1ASC" :family "Liberation Mono"))))
 '(column-enforce-face ((t (:foreground "gray20" :underline t))))
 '(mode-line ((t (:background "black" :foreground "white" :box (:line-width (1 . 1) :color "cyan") :height 0.9))))
 '(mode-line-buffer-id ((t (:weight bold :height 0.9))))
 '(mode-line-inactive ((t (:background "black" :foreground "dim gray" :box (:line-width (1 . 1) :color "white" :style released-button) :weight light :height 0.9))))
 '(mood-line-buffer-name ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "green"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "violet red"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "yellow"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "medium slate blue"))))
 '(rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "deep pink"))))
 '(rainbow-delimiters-depth-7-face ((t (:inherit rainbow-delimiters-base-face :foreground "orange red"))))
 '(rainbow-delimiters-depth-8-face ((t (:inherit rainbow-delimiters-base-face :foreground "dark violet"))))
 '(rainbow-delimiters-depth-9-face ((t (:inherit rainbow-delimiters-base-face :foreground "medium blue")))))

(load-file "~/.emacs.d/functions.el")
(load-file "~/.emacs.d/config.el")

(setq config 'marco-meta)

(cond
 ((eql config 'marco-evil) (load-file "~/.emacs.d/marco-evil.el"))
 ((eql config 'marco-meta) (load-file "~/.emacs.d/marco-meta.el"))
 ((eql config 'marco-weird) (load-file "~/.emacs.d/marco-weird.el"))
 ((eql config 'marco-vanilla) (load-file "~/.emacs.d/marco-vanilla.el")))
