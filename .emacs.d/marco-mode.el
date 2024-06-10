;;; install-if-not.el --- install package if no installed

;; Version: 0.0.1
;; License: zlib

;;; Commentary:
;;; Code:

(defvar marco-keymap (make-sparse-keymap)
  "Keymap for true global bindings.")

(defun set-keybind (key func)
  (define-key marco-keymap (kbd key) func))

(define-minor-mode marco-mode
  "marco-meta-mode are all my keybindings."
  :init-value t
  :global nil
  :lighter " mgk "
  :group 'marco-meta-group
  :keymap marco-keymap

  (if marco-meta-mode
      (setq cursor-type 'box)
    (setq cursor-type 'bar)))

(provide 'marco-mode)
;;; marco-keymap.el