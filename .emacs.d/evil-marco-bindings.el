;;; marco-mode.el --- modal emacs bindings

;; Version: 0.0.1
;; License: zlib

;;; Commentary:
;;; Code:

(defun check-status ()
  "Check marco-mode status."
  (interactive)

  (cond
   ((eq evil-state 'visual) (setq header-line-shit "VISUAL"))
   ((eq evil-state 'normal) (setq header-line-shit "NORMAL"))
   ((eq evil-state 'insert) (setq header-line-shit "INSERT"))
   ((eq evil-state 'emacs) (setq header-line-shit "EMACS")))

  header-line-shit)

(setq-default mode-line-format
              '("%e"
                "[" (:eval (propertize (winum-get-number-string) 'face 'marco-winum-mode)) "] "
                "[" (:eval (propertize (check-status) 'face 'marco-mode)) "] "
                "[" (:eval (propertize "%b" 'face 'marco-buffer)) "] "
                "[" (:eval (propertize "%m" 'face 'marco-major-mode)) "] "
                "[" (:eval (propertize "%l,%c" 'face 'marco-line-column)) "] "))

(setq evil-want-keybinding nil)
(evil-mode 1)
(evil-collection-init)

(setq-default evil-escape-delay 0.2)
(setq-default evil-escape-key-sequence "jj")

(evil-escape-mode)

(evil-set-leader 'normal (kbd "SPC"))

(evil-define-key 'normal 'global (kbd "<leader>f") 'counsel-find-file)
(evil-define-key 'normal 'global (kbd "<leader>w") 'delete-whitespace-and-save)
(evil-define-key 'normal 'global (kbd "<leader>b") 'counsel-switch-buffer)
(evil-define-key 'normal 'global (kbd "<leader>j") 'previous-buffer)
(evil-define-key 'normal 'global (kbd "<leader>k") 'next-buffer)
(evil-define-key 'normal 'global (kbd "<leader>q") 'kill-current-buffer)
(evil-define-key 'normal 'global (kbd "<leader>e") 'counsel-M-x)

(evil-define-key 'normal 'global (kbd "<leader>0") 'delete-window)
(evil-define-key 'normal 'global (kbd "<leader>1") 'delete-other-windows)
(evil-define-key 'normal 'global (kbd "<leader>2") 'split-window-below)
(evil-define-key 'normal 'global (kbd "<leader>3") 'split-window-right)

(evil-define-key 'normal 'global (kbd "<leader>o") 'other-window)

(evil-define-key 'normal 'global (kbd "<leader>r") 'projectile-compile-project)

(evil-define-key 'normal 'global (kbd "<leader>;") 'comment-line)

(evil-define-key 'normal 'global (kbd "<leader>s") 'swiper-isearch)
(evil-define-key 'normal 'global (kbd "<leader>S") 'swiper-isearch-backward)

(evil-define-key 'normal 'global (kbd "<leader>g") 'counsel-ag)
(evil-define-key 'normal 'global (kbd "<leader>a") 'ace-jump-mode)
(evil-define-key 'normal 'global (kbd "<leader>d") 'ace-jump-zap-to-char)

(defun escape-key ()
  "ESC key mapping for marco-mode."
  (interactive)
  (if (active-minibuffer-window)
      (keyboard-escape-quit)
    (keyboard-quit))
  (enable-marco-mode))

(setq ivy-re-builders-alist
      '((swiper-isearch . ivy--regex-plus)
        (swiper-isearch-backward . ivy--regex-plus)
        (counsel-ag . ivy--regex-plus)
        (t . ivy--regex-fuzzy)))

;; (setq ivy-re-builders-alist
      ;; '((t . ivy--regex-fuzzy)))

(setq ivy-initial-inputs-alist nil)

(global-set-key (kbd "<escape>") 'escape-key)

(provide 'marco-mode)
;;; marco-mode.el ends here
