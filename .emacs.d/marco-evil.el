;;; marco-mode.el --- modal emacs bindings

;; Version: 0.0.1
;; License: zlib

;;; Commentary:
;;; Code:

(require 'evil)
(require 'evil-collection)

(evil-set-leader 'normal " ")
(evil-set-leader 'visual " ")

(evil-define-key 'normal 'global (kbd "<leader>w") 'delete-whitespace-and-save)
(evil-define-key 'normal 'global (kbd "<leader>g") 'counsel-ag)
(evil-define-key 'normal 'global (kbd "<leader>s") 'swiper)
(evil-define-key 'normal 'global (kbd "<leader>e") 'counsel-M-x)
(evil-define-key 'normal 'global (kbd "<leader>0") 'delete-window)
(evil-define-key 'normal 'global (kbd "<leader>1") 'delete-other-windows)
(evil-define-key 'normal 'global (kbd "<leader>2") 'horizontal-split-move)
(evil-define-key 'normal 'global (kbd "<leader>3") 'vertical-split-move)
(evil-define-key 'normal 'global (kbd "<leader>d") 'kill-current-buffer)
(evil-define-key 'normal 'global (kbd "<leader>f") 'counsel-find-file)
(evil-define-key 'normal 'global (kbd "<leader>o") 'other-window)
(evil-define-key 'normal 'global (kbd "<leader>q") 'save-buffers-kill-terminal)
(evil-define-key 'normal 'global (kbd "<leader>c") 'projectile-compile-project)
(evil-define-key 'normal 'global (kbd "<leader>r") 'projectile-run-project)
(evil-define-key 'normal 'global (kbd "<leader>b") 'counsel-switch-buffer)
(evil-define-key 'normal 'global (kbd "<leader>F") 'counsel-projectile-find-file)
(evil-define-key 'normal 'global (kbd "<leader>i") 'counsel-imenu)
(evil-define-key 'normal 'global (kbd "<leader>;") 'comment-line)
(evil-define-key 'normal 'global (kbd "<leader>j") 'next-buffer)
(evil-define-key 'normal 'global (kbd "<leader>k") 'previous-buffer)
(evil-define-key 'normal 'global (kbd "<leader>n") 'next-error)
(evil-define-key 'normal 'global (kbd "<leader>p") 'previous-error)

(evil-collection-init)

(evil-mode 1)

(setq marco-completion-system 'marco-ido-vertical)

(provide 'marco-mode)
;;; marco-mode.el ends here
