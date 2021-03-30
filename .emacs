;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)

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
 '(custom-enabled-themes '(manoj-dark))
 '(custom-safe-themes
   '("57b7a22240508a8eb008a4b29d4c68f91f3b8e9ed60444c50d76d5fa8f9335e9" "7e22a8dcf2adcd8b330eab2ed6023fa20ba3b17704d4b186fa9c53f1fab3d4d2" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default))
 '(hl-todo-keyword-faces
   '(("HOLD" . "#cfdf30")
     ("TODO" . "#feacd0")
     ("NEXT" . "#b6a0ff")
     ("THEM" . "#f78fe7")
     ("PROG" . "#00d3d0")
     ("OKAY" . "#4ae8fc")
     ("DONT" . "#80d200")
     ("FAIL" . "#ff8059")
     ("BUG" . "#ff8059")
     ("DONE" . "#44bc44")
     ("NOTE" . "#f0ce43")
     ("KLUDGE" . "#eecc00")
     ("HACK" . "#eecc00")
     ("TEMP" . "#ffcccc")
     ("FIXME" . "#ff9977")
     ("XXX+" . "#f4923b")
     ("REVIEW" . "#6ae4b9")
     ("DEPRECATED" . "#bfd9ff")))
 '(package-selected-packages
   '(use-package))
 '(safe-local-variable-values
   '((projectile-project-run-cmd . "./snako.exe")
     (projectile-project-compilation-cmd . "make; ./snako.exe"))))

(use-package js2-mode :ensure t)
(use-package exwm :ensure t)
(use-package dotenv-mode :ensure t)
(use-package lsp-ui :ensure t)
(use-package highlight-indent-guides :ensure t)
(use-package highlight-indentation :ensure t)
(use-package git-gutter+ :ensure t)
(use-package yasnippet-snippets :ensure t)
(use-package yasnippet :ensure t)
(use-package company-box :ensure t)
(use-package glsl-mode :ensure t)
(use-package lsp-ivy :ensure t)
(use-package lsp-mode :ensure t)
(use-package winum :ensure t)
(use-package web-mode :ensure t)
(use-package smart-tab :ensure t)
(use-package slime :ensure t)
(use-package rainbow-delimiters :ensure t)
(use-package pug-mode :ensure t)
(use-package hl-todo :ensure t)
(use-package highlight-numbers :ensure t)
(use-package fira-code-mode :ensure t)
(use-package exec-path-from-shell :ensure t)
(use-package desktop-environment :ensure t)
(use-package counsel-projectile :ensure t)
(use-package column-enforce-mode :ensure t)
(use-package color-identifiers-mode :ensure t)
(use-package clang-format :ensure t)
(use-package avy-zap :ensure t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 134 :family "Fira Code"))))
 '(highlight-indent-guides-character-face ((t (:foreground "dark gray"))))
 '(markdown-bold-face ((t (:inherit bold :foreground "orange"))))
 '(markdown-header-face ((t (:foreground "deep pink"))))
 '(markdown-header-face-1 ((t (:foreground "hot pink"))))
 '(markdown-list-face ((t (:foreground "cyan" :slant oblique))))
 '(mode-line ((t (:background "#2f2f2f" :foreground "#f5f5f5" :box (:line-width 1 :color "spring green") :height 1.0))))
 '(mode-line-inactive ((t (:background "#202020" :foreground "#bebebe" :box (:line-width 1 :color "dim gray") :height 1.0))))
 '(rainbow-delimiters-base-face ((t (:inherit nil))))
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "cyan"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "green"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "yellow"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "deep pink"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "RoyalBlue1"))))
 '(rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "aquamarine"))))
 '(rainbow-delimiters-depth-7-face ((t (:inherit rainbow-delimiters-base-face :foreground "tomato"))))
 '(rainbow-delimiters-depth-8-face ((t (:inherit rainbow-delimiters-base-face :foreground "green yellow"))))
 '(rainbow-delimiters-depth-9-face ((t (:inherit rainbow-delimiters-base-face :foreground "white"))))
 '(web-mode-current-element-highlight-face ((t (:background "#000000" :foreground "red" :weight bold)))))

(load-file "~/.emacs.d/functions.el")

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(setq ivy-re-builders-alist
      '((swiper-isearch . ivy--regex-plus)
        (swiper-isearch-backward . ivy--regex-plus)
        (t . ivy--regex-plus)))

;; (setq ivy-initial-inputs-alist nil)

;; ui settings
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode 1)
(display-time-mode 1)
(display-battery-mode 1)

;; Server
(server-start)

;; Global hooks
(add-hook 'after-init-hook 'show-paren-mode)
(add-hook 'after-init-hook 'electric-pair-mode)

;; exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Auto-revert
(global-auto-revert-mode 1)

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq ring-bell-function nil)

;; Hihglighting current line
(global-hl-line-mode 1)
(set-face-foreground 'hl-line nil)

(autorandr)
(winum-mode)

(setq ring-bell-function nil)
(setq avy-all-windows 'nil)
(setq avy-styles-alist '((avy-goto-char . at)))
(setq avy-orders-alist
      '((avy-goto-char . avy-order-closest)
        (avy-goto-word-0 . avy-order-closest)
        (avy-goto-line . avy-order-closest)))

(load-file "~/.emacs.d/marco-mode-mode-line.el")
(load-file "~/.emacs.d/marco-weird.el")

(desktop-environment-mode)

(setq-default indent-tabs-mode nil)
(setq inferior-lisp-program "sbcl")

(load-file "~/secret.el")
(setq inhibit-startup-screen t)

(yas-global-mode)

(setq highlight-indent-guides-method 'character)

;; Suggestions from official docs
(setq gc-cons-threshold 100000000)
(setq lsp-completion-provider :capf)
(setq lsp-idle-delay 0.500)
(setq lsp-log-io nil)

;; Annoying stuff
(setq lsp-enable-links nil)
(setq lsp-signature-render-documentation nil)
(setq lsp-headerline-breadcrumb-enable nil)
(setq lsp-ui-doc-enable nil)
(setq lsp-completion-enable-additional-text-edit nil)

(setq web-mode-enable-current-element-highlight t)
