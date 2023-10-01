(setq search-whitespace-regexp ".*?")

(defvar spc-map (make-sparse-keymap)
  "Keymap for \"leader key\" shortcuts.")

(define-key spc-map (kbd "M-0") 'delete-window)

(define-key spc-map (kbd "M-1") 'delete-other-windows)
(define-key spc-map (kbd "M-2") 'horizontal-split-move)
(define-key spc-map (kbd "M-3") 'vertical-split-move)
(define-key spc-map (kbd "M-4") 'other-window)

(define-key spc-map (kbd "M-o") 'counsel-find-file)
(define-key spc-map (kbd "M-O") 'counsel-projectile-find-file)
(define-key spc-map (kbd "M-s") 'delete-whitespace-and-save)
(define-key spc-map (kbd "M-p") 'counsel-switch-buffer)

(define-key spc-map (kbd "M-i") 'counsel-imenu)
(define-key spc-map (kbd "M-k") 'kill-current-buffer)

(define-key spc-map (kbd "M-c") 'projectile-compile-project)
(define-key spc-map (kbd "M-r") 'projectile-run-project)
(define-key spc-map (kbd "M-a") 'avy-goto-char)
(define-key spc-map (kbd "M-g") 'counsel-ag)

(define-key spc-map (kbd "C-s") 'swiper-isearch)
(define-key spc-map (kbd "C-;") 'comment-line)
(define-key spc-map (kbd "C-x C-s") 'delete-whitespace-and-save)

(define-key spc-map (kbd "M-]") 'forward-paragraph)
(define-key spc-map (kbd "M-[") 'backward-paragraph)
(define-key spc-map (kbd "C-z") 'do-it-right)

(define-key spc-map (kbd "M-e") 'counsel-M-x)
(define-key spc-map (kbd "C-S-SPC") 'rectangle-mark-mode)

(define-key spc-map (kbd "M-h") 'lsp-goto-type-definition)

(global-set-key (kbd "<escape>") 'keyboard-quit)
(define-key ivy-minibuffer-map (kbd "<escape>") 'keyboard-escape-quit)

(define-minor-mode marco-meta-mode
  "marco-meta-mode is a minor mode for doing modal editing."
  ;; initial value
  :init-value t
  :global nil
  ;; indicator for mode line
  :lighter "MarcoMeta"
  :group 'marco-meta-group

  :keymap spc-map

  (if marco-meta-mode
      (setq cursor-type 'box)
    (setq cursor-type 'bar)))

(setq marco-ivy-enabled t)
(marco-ivy)

(provide 'marco-meta-mode)
