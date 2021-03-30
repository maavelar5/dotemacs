;;; marco-mode.el --- modal emacs bindings

;; Version: 0.0.1
;; License: zlib

;;; Commentary:
;;; Code:

(defun marco-mode-delete (&optional start end)
  "Delete word or region."
  (interactive)
  (if (not current-prefix-arg)
      (setq number 1)
    (setq number current-prefix-arg))

  (if (use-region-p)
      (kill-region (region-beginning) (region-end))
    (kill-word number)))

(add-hook 'after-load-functions 'my-keys-have-priority)

(defun my-keys-have-priority (_file)
  "Try to ensure that my keybindings retain priority over other minor modes.
  Called via the `after-load-functions' special hook."
  (unless (eq (caar minor-mode-map-alist) 'marco-mode)
    (let ((mykeys (assq 'marco-mode minor-mode-map-alist)))
      (assq-delete-all 'marco-mode minor-mode-map-alist)
      (add-to-list 'minor-mode-map-alist mykeys))))

(define-minor-mode marco-replace-mode
  "replacing shit."
  ;; initial value
  :init-value nil
  :global nil
  ;; indicator for mode line
  :lighter ""
  :group 'marco-group)

(defun toggle-marco-replace-mode ()
  "toggle it."
  (marco-mode nil)
  (marco-replace-mode (if marco-replace-mode nil t)))

(defun enable-marco-replace-mode ()
  "enable marco-replace-mode."
  (marco-replace-mode t))

(defun disable-marco-replace-mode ()
  "enable marco-replace-mode."
  (marco-replace-mode nil))

(defun marco-replace-char (c)
  "marco replace forward char"
  (interactive "cchar: ")
  (delete-char)
  (insert-char c))

(define-minor-mode marco-mode
  "marco-mode is a minor mode for doing modal editing."
  ;; initial value
  :init-value t
  :global nil
  ;; indicator for mode line
  :lighter ""
  :group 'marco-group

  :keymap '(((kbd "a") . avy-goto-char)
            ((kbd "b") . counsel-switch-buffer)
            ((kbd "c") . comment-line)
            ((kbd "d") . do-it-right)
            ((kbd "e") . counsel-M-x)
            ((kbd "f") . avy-goto-char-in-line)
            ((kbd "g") . do-it-right)
            ((kbd "h") . backward-char)
            ((kbd "i") . disable-marco-mode)
            ((kbd "j") . next-line)
            ((kbd "k") . previous-line)
            ((kbd "l") . forward-char)
            ((kbd "m") . end-of-line)
            ((kbd "n") . beginning-of-line)
            ((kbd "o") . other-window)
            ((kbd "p") . yank)
            ((kbd "q") . v-split-move)
            ((kbd "r") . h-split-move)
            ((kbd "s") . swiper-isearch)
            ((kbd "t") . delete-window)
            ((kbd "u") . undo)
            ((kbd "v") . set-mark-command)
            ((kbd "w") . delete-whitespace-and-save)
            ((kbd "x") . delete-char)
            ((kbd "y") . kill-ring-save)
            ((kbd "z") . avy-zap-to-char)

            ((kbd " ") . do-it-right)

            ((kbd ";") . comment-line)

            ((kbd "]") . do-it-right)
            ((kbd "[") . do-it-right)
            ((kbd "{") . do-it-right)
            ((kbd "}") . do-it-right)

            ((kbd "\\") . do-it-right)
            ((kbd "/") . do-it-right)

            ((kbd "<") . do-it-right)
            ((kbd ">") . do-it-right)
            ((kbd "'") . do-it-right)
            ((kbd "\"") .do-it-right)
            ((kbd ",") . do-it-right)
            ((kbd ".") . repeat)

            ((kbd ":") . do-it-right)
            ((kbd "(") . do-it-right)
            ((kbd ")") . do-it-right)
            ((kbd "?") . do-it-right)

            ((kbd "$") . start-kbd-macro)
            ((kbd "!") . shell-command)
            ((kbd "&") . do-it-right)
            ((kbd "%") . end-kbd-macro)
            ((kbd "@") . async-shell-command)
            ((kbd "#") . query-replace)
            ((kbd "^") . do-it-right)
            ((kbd "*") . do-it-right)
            ((kbd "~") . do-it-right)

            ((kbd "`") . do-it-right)

            ((kbd "0") . digit-argument)
            ((kbd "1") . digit-argument)
            ((kbd "2") . digit-argument)
            ((kbd "3") . digit-argument)
            ((kbd "4") . digit-argument)
            ((kbd "5") . digit-argument)
            ((kbd "6") . digit-argument)
            ((kbd "7") . digit-argument)
            ((kbd "8") . digit-argument)
            ((kbd "9") . digit-argument)

            ((kbd "-") . do-it-right)
            ((kbd "_") . do-it-right)
            ((kbd "+") . do-it-right)
            ((kbd "=") . do-it-right)

            ((kbd "A") . previous-buffer)
            ((kbd "B") . do-it-right)
            ((kbd "C") . do-it-right)
            ((kbd "D") . kill-current-buffer)
            ((kbd "E") . do-it-right)
            ((kbd "F") . do-it-right)
            ((kbd "G") . do-it-right)
            ((kbd "H") . backward-word)
            ((kbd "I") . do-it-right)
            ((kbd "J") . scroll-up-command)
            ((kbd "K") . scroll-down-command)
            ((kbd "L") . forward-word)
            ((kbd "M") . end-of-buffer)
            ((kbd "N") . beginning-of-buffer)
            ((kbd "O") . do-it-right)
            ((kbd "P") . do-it-right)
            ((kbd "Q") . delete-indentation)
            ((kbd "R") . do-it-right)
            ((kbd "S") . next-buffer)
            ((kbd "T") . delete-other-windows)
            ((kbd "U") . do-it-right)
            ((kbd "V") . rectangle-mark-mode)
            ((kbd "W") . do-it-right)
            ((kbd "X") . do-it-right)
            ((kbd "Y") . do-it-right)
            ((kbd "Z") . do-it-right))

  (if marco-mode
      (setq cursor-type 'box)
    (setq cursor-type 'bar)))

(add-hook 'minibuffer-setup-hook 'disable-marco-mode)
(add-hook 'minibuffer-setup-hook 'disable-resizer-mode)

(load-file "~/.emacs.d/marco-resizer-mode.el")

(global-set-key (kbd "<escape>") 'escape-key-marco-mode)
(global-set-key (kbd "C-g") 'escape-key-marco-mode)

(defun open-dot-emacs ()
  (interactive)
  (find-file "~/.emacs"))

(defvar spc-map (make-sparse-keymap)
  "Keymap for \"leader key\" shortcuts.")

(define-key spc-map (kbd "a") 'counsel-ag)
;; (define-key spc-map (kbd "a") 'dmenu-ag)
(define-key spc-map (kbd "c") 'projectile-compile-project)
(define-key spc-map (kbd "e") 'open-dot-emacs)
(define-key spc-map (kbd "f") 'counsel-find-file)
(define-key spc-map (kbd "p") 'counsel-projectile-find-file)
;; (define-key spc-map (kbd "f") 'dmenu-find-file)
(define-key spc-map (kbd "i") 'counsel-imenu)
(define-key spc-map (kbd "q") 'save-buffers-kill-terminal)
(define-key spc-map (kbd "r") 'projectile-run-project)
(define-key spc-map (kbd "F") 'counsel-projectile-find-file)

(define-key spc-map (kbd "l") 'lsp-ivy-workspace-symbol)

(define-key marco-mode-map (kbd "SPC") spc-map)

(defvar g-map (make-sparse-keymap)
  "Keymap for \"leader key\" shortcuts.")

(define-key g-map (kbd "g") 'goto-line)
(define-key g-map (kbd "l") 'avy-goto-line)
(define-key g-map (kbd "n") 'next-error)
(define-key g-map (kbd "p") 'previous-error)

(define-key g-map (kbd "d") 'lsp-find-definition)
(define-key g-map (kbd "r") 'lsp-find-references)

(define-key marco-mode-map (kbd "g") g-map)

(defvar d-map (make-sparse-keymap)
  "Keymap for \"leader key\" shortcuts.")

(defun marco-kill-line (&optional disable)
  "go to beg and kill line."
  (interactive)
  (beginning-of-line)
  (if (not current-prefix-arg)
      (setq number 1)
    (setq number current-prefix-arg))
  (kill-line number)
  (when disable (disable-marco-mode) (open-line 1)))

(defun marco-avy-zap-in-line (c &optional disable)
  "marco-mode yank line"
  (interactive "cchar: ")
  (set-mark (point))
  (setq previous-point (point))
  (avy-goto-char-in-line c)

  (when (> (point) previous-point)
      (forward-char))

  (if (use-region-p)
      (kill-region (region-beginning) (region-end)))

  (when disable (disable-marco-mode)))

(defun marco-kill-word (&optional disable)
  (interactive)
  (if (not current-prefix-arg)
      (setq number 1)
    (setq number current-prefix-arg))
  (kill-word number)

  (when disable (disable-marco-mode)))

(defun marco-kill-line-to-end (&optional disable)
  (interactive)
  (if (not current-prefix-arg)
      (setq number 1)
    (setq number current-prefix-arg))
  (kill-line number)
  (when disable (disable-marco-mode)))

(define-key d-map (kbd "d") 'marco-kill-line)
(define-key d-map (kbd "a") 'avy-zap-to-char)
(define-key d-map (kbd "e") 'marco-kill-line-to-end)
(define-key d-map (kbd "w") 'marco-kill-word)
(define-key d-map (kbd "f") 'marco-avy-zap-in-line)

(define-key marco-mode-map (kbd "d") d-map)

(defun marco-kill-line-disable ()
  (interactive)
  (marco-kill-line t))

(defun marco-kill-world-disable ()
  (interactive)
  (marco-kill-word t))

(defun marco-kill-line-to-end-disable ()
  (interactive)
  (marco-kill-line-to-end t))

(defun marco-avy-zap-in-line-disable (c)
  (interactive "cchar: ")
  (marco-avy-zap-in-line c t))

(defun marco-avy-zap-disable ()
  (interactive)
  (avy-zap-to-char)
  (disable-marco-mode))

(defvar c-map (make-sparse-keymap)
  "c-map for marco-mode")

(define-key c-map (kbd "c") 'marco-kill-line-disable)
(define-key c-map (kbd "f") 'marco-avy-zap-in-line-disable)
(define-key c-map (kbd "w") 'marco-kill-world-disable)
(define-key c-map (kbd "e") 'marco-kill-line-to-end-disable)
(define-key c-map (kbd "a") 'marco-avy-zap-disable)

(define-key marco-mode-map (kbd "c") c-map)

(defvar y-map (make-sparse-keymap)
  "Keymap for yanking.")

(defun marco-yank-region (c)
  "marco-mode yank line"
  (interactive "cchar: ")
  (set-mark (point))
  (setq previous-point (point))
  (avy-goto-char c)

  (if (> (point) previous-point)
      (forward-char))

  (if (use-region-p)
     (kill-ring-save (region-beginning) (region-end))))

(defun marco-yank (&optional start end)
  (interactive)

  (setq pos (point))

  (when current-prefix-arg
    (beginning-of-line)
    (set-mark (point))
    (next-line (- current-prefix-arg 1))
    (end-of-line))

  (if (use-region-p)
      (kill-ring-save (region-beginning) (region-end))
    (kill-ring-save (line-beginning-position) (line-end-position)))

  (goto-char pos))

(define-key y-map (kbd "y") 'marco-yank)
(define-key y-map (kbd "a") 'marco-yank-region)

(define-key marco-mode-map (kbd "y") y-map)

(defun j-cases ()
  "j j to escape."
  (interactive)
  (setq char (read-char nil nil 0.20))

  (if char
      (progn
        (setq char (byte-to-string char))
        (cond ((string-equal char "j") (toggle-marco-mode))
              ((string-equal char "\^M") (insert "j"))
              (t (insert "j" char))))
    (insert "j")))

(global-set-key (kbd "j") 'j-cases)

(provide 'marco-mode)
;;; marco-mode.el ends here
