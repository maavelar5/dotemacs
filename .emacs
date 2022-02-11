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
 '(custom-enabled-themes '(manoj-dark))
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
 '(mode-line-format
   '("%e"
     (:eval
      (format winum-format
              (winum-get-number-string)))
     mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position evil-mode-line-tag
     (vc-mode vc-mode)
     "  " "%m  " mode-line-misc-info mode-line-end-spaces))
 '(org-src-block-faces 'nil)
 '(package-selected-packages
   '(prettier-js modus-themes evil-collection evil sexy-monochrome-theme python-black smex ido-vertical-mode w3m company-arduino arduino-mode flycheck-grammarly org-inline-pdf org-preview-html flyspell-correct ivy-posframe which-key emacsql-mysql yaml-mode yaml multi-term ag yasnippet-snippets winum web-mode vterm use-package tide smart-tab slime rainbow-delimiters pug-mode prettier lsp-ui lsp-ivy js2-mode hl-todo highlight-numbers highlight-indentation highlight-indent-guides glsl-mode git-gutter+ fira-code-mode exwm exec-path-from-shell dotenv-mode desktop-environment counsel-projectile company column-enforce-mode color-identifiers-mode clang-format avy-zap)))

(use-package js2-mode :ensure t)
(use-package exwm :ensure t)
(use-package dotenv-mode :ensure t)
(use-package lsp-ui :ensure t)
(use-package highlight-indent-guides :ensure t)
(use-package highlight-indentation :ensure t)
(use-package git-gutter+ :ensure t)
(use-package yasnippet-snippets :ensure t)
(use-package yasnippet :ensure t)
;; (use-package company-box :ensure t)
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
(use-package evil :ensure t)
(use-package ivy-posframe :ensure t)
(use-package evil-collection :ensure t)
(use-package tide :ensure t)
(use-package company :ensure t)
(use-package flycheck :ensure t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "black" :foreground "WhiteSmoke" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 111 :width normal :foundry "1ASC" :family "Liberation Mono"))))
 '(column-enforce-face ((t (:inherit nil :foreground "gray30"))))
 '(cursor ((t (:background "green"))))
 '(mode-line ((t (:background "black" :foreground "white" :box (:line-width 1 :color "cyan") :height 1.0))))
 '(mode-line-buffer-id ((t (:background "black" :foreground "yellow1" :weight bold :height 1.0))))
 '(mode-line-inactive ((t (:background "black" :foreground "white" :box (:line-width 1 :color "dim gray") :weight light :height 1.0))))
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
 '(web-mode-current-element-highlight-face ((t (:background "#000000" :foreground "red" :weight bold))))
 '(winum-face ((t (:foreground "green" :weight bold))) t))

(load-file "~/.emacs.d/functions.el")
(load-file "~/.emacs.d/config.el")

(setq config 'marco-evil)

(cond
 ((eql config 'marco-evil) (load-file "~/.emacs.d/marco-evil.el"))
 ((eql config 'marco-weird) (load-file "~/.emacs.d/marco-weird.el"))
 ((eql config 'marco-vanilla) (load-file "~/.emacs.d/marco-vanilla.el")))
