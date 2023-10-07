(setq search-whitespace-regexp ".*?")

(defvar spc-map (make-sparse-keymap)
  "Keymap for \"leader key\" shortcuts.")

(define-key spc-map (kbd "M-0") 'delete-window)

(define-key spc-map (kbd "M-1") 'delete-other-windows)
(define-key spc-map (kbd "M-2") 'horizontal-split-move)
(define-key spc-map (kbd "M-3") 'vertical-split-move)
(define-key spc-map (kbd "M-4") 'other-window)

(define-key spc-map (kbd "M-o") 'find-file)
(define-key spc-map (kbd "M-O") 'projectile-find-file)
(define-key spc-map (kbd "M-s") 'delete-whitespace-and-save)
(define-key spc-map (kbd "M-p") 'switch-to-buffer)

(define-key spc-map (kbd "M-i") 'idomenu)
(define-key spc-map (kbd "M-k") 'kill-current-buffer)

(define-key spc-map (kbd "M-c") 'projectile-compile-project)
(define-key spc-map (kbd "M-r") 'projectile-run-project)
(define-key spc-map (kbd "M-a") 'avy-goto-char)
(define-key spc-map (kbd "M-g") 'rgrep)

(define-key spc-map (kbd "C-s") 'ctrlf-forward-fuzzy)
(define-key spc-map (kbd "C-r") 'ctrlf-backward-fuzzy)
(define-key spc-map (kbd "C-;") 'comment-line)
(define-key spc-map (kbd "C-x C-s") 'delete-whitespace-and-save)

(define-key spc-map (kbd "M-]") 'next-error)
(define-key spc-map (kbd "M-[") 'previous-error)
(define-key spc-map (kbd "C-z") 'do-it-right)

(define-key spc-map (kbd "M-e") 'smex)
(define-key spc-map (kbd "C-S-SPC") 'rectangle-mark-mode)

(global-set-key (kbd "<escape>") 'keyboard-quit)

(define-key spc-map (kbd "M-h") 'grep-for-media-server)

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

(setq marco-completion-system 'marco-ido-vertical)

(provide 'marco-meta-mode)
