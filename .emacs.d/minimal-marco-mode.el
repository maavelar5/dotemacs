;;; marco-mode.el --- modal emacs bindings

;; Version: 0.0.1
;; License: zlib

;;; Commentary:
;;; Code:

(defun zap-change-disable-marco-mode ()
  "Zap to char and disable marco-mode"
  (interactive)
  (avy-zap-to-char)
  (disable-marco-mode))

(defun marco-mode-delete (&optional start end)
  "Delete word or region."
  (interactive)
  (if (not current-prefix-arg)
      (setq number 1)
    (setq number current-prefix-arg))

  (if (use-region-p)
      (kill-region (region-beginning) (region-end))
    (kill-word number)))

(define-minor-mode marco-mode
  "marco-mode is a minor mode for doing modal editing."
  ;; initial value
  :init-value t
  :global nil
  ;; indicator for mode line
  :lighter ""
  :group 'marco-group
  ;; minor mode bindings
  :keymap '(
            ((kbd "a") . beginning-of-line)
            ((kbd "b") . backward-word)
            ((kbd "c") . do-it-right)
            ((kbd "d") . marco-mode-delete)
            ((kbd "e") . end-of-line)
            ((kbd "f") . forward-word)
            ((kbd "g") . do-it-right)
            ((kbd "h") . help-command)
            ((kbd "i") . indent-for-tab-command)
            ((kbd "j") . electric-newline-and-maybe-indent)
            ((kbd "k") . kill-line)
            ((kbd "l") . recenter-top-bottom)
            ((kbd "m") . newline)
            ((kbd "n") . n-key-ivy-marco-mode)
            ((kbd "o") . open-line)
            ((kbd "p") . p-key-ivy-marco-mode)
            ((kbd "q") . quoted-insert)
            ((kbd "r") . swiper-isearch-backward)
            ((kbd "s") . swiper-isearch)

            ((kbd "t") . transpose-chars)
            ((kbd "u") . universal-argument)
            ((kbd "v") . scroll-up-command)
            ((kbd "w") . kill-region)
            ((kbd "x") . do-it-right)
            ((kbd "y") . yank)
            ((kbd "z") . avy-zap-to-char)

            ((kbd " ") . set-mark-command)

            ((kbd ";") . comment-line)

            ((kbd "]") . forward-paragraph)
            ((kbd "[") . backward-paragraph)
            ((kbd "{") . backward-paragraph)
            ((kbd "}") . forward-paragraph)

            ((kbd "\\") . toggle-input-method)
            ((kbd "/") . undo)

            ((kbd "<") . beginning-of-buffer)
            ((kbd ">") . end-of-buffer)
            ((kbd "'") . do-it-right)
            ((kbd "\"") . do-it-right)
            ((kbd ",") . xref-pop-marker-stack)
            ((kbd ".") . xref-find-definitions)

            ((kbd ":") . eval-expression)
            ((kbd "(") . start-kbd-macro)
            ((kbd ")") . end-kbd-macro)
            ((kbd "?") . xref-find-references)

            ((kbd "$") . ispell-word)
            ((kbd "!") . shell-command)
            ((kbd "&") . async-shell-command)
            ((kbd "%") . query-replace)
            ((kbd "@") . mark-word)
            ((kbd "#") . server-edit)
            ((kbd "^") . delete-indentation)
            ((kbd "*") . quick-calc)
            ((kbd "~") . do-it-right)

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

            ((kbd "-") . negative-argument)
            ((kbd "_") . undo)
            ((kbd "+") . do-it-right)
            ((kbd "=") . count-words-region)

            ((kbd "A") . backward-sentence)
            ((kbd "B") . backward-char)
            ((kbd "C") . capitalize-word)
            ((kbd "D") . delete-char)
            ((kbd "E") . forward-sentence)
            ((kbd "F") . forward-char)
            ((kbd "G") . escape-key-marco-mode)
            ((kbd "H") . mark-paragraph)
            ((kbd "I") . tab-to-tab-stop)
            ((kbd "J") . default-indent-new-line)
            ((kbd "K") . kill-sentence)
            ((kbd "L") . downcase-word)
            ((kbd "M") . back-to-indentation)
            ((kbd "N") . next-buffer)
            ((kbd "O") . facemenu-keymap)
            ((kbd "P") . previous-buffer)
            ((kbd "Q") . fill-paragraph)
            ((kbd "R") . move-to-window-line-top-bottom)
            ((kbd "S") . eshell)
            ((kbd "T") . transpose-words)
            ((kbd "U") . upcase-word)
            ((kbd "V") . scroll-down-command)
            ((kbd "W") . kill-ring-save)
            ((kbd "X") . counsel-M-x)
            ((kbd "Y") . yank-pop)
            ((kbd "Z") . zap-change-disable-marco-mode))

  (if marco-mode
      (setq cursor-type 'box)
    (setq cursor-type 'bar)))

(define-key marco-mode-map (kbd "C-v") 'scroll-other-window)
(define-key marco-mode-map (kbd "M-v") 'scroll-other-window-down)

(load-file "~/.emacs.d/marco-resizer-mode.el")

(load-file "~/.emacs.d/marco-mode-c-map.el")
(load-file "~/.emacs.d/marco-mode-x-map.el")

(add-hook 'minibuffer-setup-hook 'disable-marco-mode)
(add-hook 'minibuffer-setup-hook 'disable-resizer-mode)

(global-set-key (kbd "`") 'toggle-marco-mode)

(global-set-key (kbd "<escape>") 'escape-key-marco-mode)
(define-key resizer-mode-map (kbd "<escape>") 'disable-resizer-mode)
(define-key resizer-mode-map (kbd "g") 'disable-resizer-mode)

(global-set-key (kbd "C-g") 'escape-key-marco-mode)

(provide 'marco-mode)
;;; marco-mode.el ends here
