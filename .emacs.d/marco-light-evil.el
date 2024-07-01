(load-file "~/.emacs.d/functions.el")

(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)

(require 'ivy)
(require 'evil)
(require 'evil-collection)

(evil-mode 1)
(evil-collection-init)

(evil-set-leader 'normal " ")
(evil-set-leader 'visual " ")

(evil-define-key 'normal 'global (kbd "<leader>g") 'counsel-ag)
(evil-define-key 'normal 'global (kbd "<leader>w") 'save-buffer)
(evil-define-key 'normal 'global (kbd "<leader>e") 'counsel-M-x)
(evil-define-key 'normal 'global (kbd "<leader>c") 'delete-window)
(evil-define-key 'normal 'global (kbd "<leader>O") 'delete-other-windows)
(evil-define-key 'normal 'global (kbd "<leader>h") 'horizontal-split-move)
(evil-define-key 'normal 'global (kbd "<leader>v") 'vertical-split-move)
(evil-define-key 'normal 'global (kbd "<leader>f") 'counsel-find-file)
(evil-define-key 'normal 'global (kbd "<leader>o") 'other-window)
(evil-define-key 'normal 'global (kbd "<leader>k") 'kill-current-buffer)
(evil-define-key 'normal 'global (kbd "<leader>b") 'counsel-switch-buffer)
(evil-define-key 'normal 'global (kbd "<leader>F") 'projectile-find-file)
(evil-define-key 'normal 'global (kbd "<leader>i") 'counsel-imenu)
(evil-define-key 'normal 'global (kbd "<leader>;") 'comment-line)
(evil-define-key 'normal 'global (kbd "<leader>n") 'next-error)
(evil-define-key 'normal 'global (kbd "<leader>p") 'previous-error)

(evil-define-key 'visual 'global (kbd "<leader>l") 'clang-format-region)

(define-key ivy-mode-map (kbd "C-j") 'ivy-next-line)
(define-key ivy-mode-map (kbd "C-k") 'ivy-previous-line)

(setq display-line-numbers-type 'relative) 
(global-display-line-numbers-mode)