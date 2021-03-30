;;; marco-mode-exwm.el --- modal emacs bindings
;;; Version: 0.0.1
;;; License: zlib

;;; Commentary:
;;; Code:

(define-key x-map "b" 'exwm-workspace-switch-to-buffer)

(add-hook 'exwm-mode-hook 'marco-exwm-hook)

(exwm-input-set-key (kbd "`") 'toggle-marco-mode)

(define-key exwm-mode-map [?q] #'do-it-right)
(define-key exwm-mode-map [?x] x-map)
(define-key exwm-mode-map [?c] c-map)

(define-key exwm-mode-map [?\;] #'do-it-right)

(define-key exwm-mode-map [?m] #'do-it-right)

(define-key exwm-mode-map [?1] #'do-it-right)
(define-key exwm-mode-map [?2] #'do-it-right)
(define-key exwm-mode-map [?3] #'do-it-right)
(define-key exwm-mode-map [?4] #'do-it-right)
(define-key exwm-mode-map [?5] #'do-it-right)
(define-key exwm-mode-map [?0] #'do-it-right)

(define-key exwm-mode-map [?h] #'do-it-right)
(define-key exwm-mode-map [?j] #'do-it-right)
(define-key exwm-mode-map [?l] #'do-it-right)

(define-key exwm-mode-map [?'] #'do-it-right)

(define-key exwm-mode-map [?i] #'do-it-right)
(define-key exwm-mode-map [?w] #'do-it-right)
(define-key exwm-mode-map [?e] #'do-it-right)
(define-key exwm-mode-map [?r] #'do-it-right)
(define-key exwm-mode-map [?t] #'do-it-right)
(define-key exwm-mode-map [?y] #'do-it-right)
(define-key exwm-mode-map [?u] #'do-it-right)
(define-key exwm-mode-map [?o] #'do-it-right)
(define-key exwm-mode-map [?\[] #'do-it-right)
(define-key exwm-mode-map [?\]] #'do-it-right)
(define-key exwm-mode-map [?\\] #'do-it-right)

(define-key exwm-mode-map [?z] #'do-it-right)
(define-key exwm-mode-map [?,] #'do-it-right)
(define-key exwm-mode-map [?.] #'do-it-right)
(define-key exwm-mode-map [?/] #'do-it-right)

(define-key exwm-mode-map [?6] #'do-it-right)
(define-key exwm-mode-map [?7] #'do-it-right)
(define-key exwm-mode-map [?8] #'do-it-right)
(define-key exwm-mode-map [?9] #'do-it-right)

(define-key exwm-mode-map [?-] #'do-it-right)
(define-key exwm-mode-map [?=] #'do-it-right)

;; Mayus
(define-key exwm-mode-map [?A] #'do-it-right)
(define-key exwm-mode-map [?S] #'do-it-right)
(define-key exwm-mode-map [?H] #'do-it-right)
(define-key exwm-mode-map [?J] #'do-it-right)
(define-key exwm-mode-map [?K] #'kill-current-buffer)
(define-key exwm-mode-map [?L] #'do-it-right)

(define-key exwm-mode-map [?\:] #'do-it-right)
(define-key exwm-mode-map [?\"] #'do-it-right)

(define-key exwm-mode-map [?W] #'do-it-right)
(define-key exwm-mode-map [?E] #'do-it-right)
(define-key exwm-mode-map [?R] #'do-it-right)
(define-key exwm-mode-map [?T] #'do-it-right)
(define-key exwm-mode-map [?Y] #'do-it-right)
(define-key exwm-mode-map [?U] #'do-it-right)
(define-key exwm-mode-map [?I] #'do-it-right)
(define-key exwm-mode-map [?P] #'previous-buffer)
(define-key exwm-mode-map [?\{] #'do-it-right)
(define-key exwm-mode-map [?\}] #'do-it-right)
(define-key exwm-mode-map [?\|] #'do-it-right)

(define-key exwm-mode-map (kbd "X") 'counsel-M-x)

(define-key exwm-mode-map [?Z] #'do-it-right)
(define-key exwm-mode-map [?B] #'do-it-right)
(define-key exwm-mode-map [?N] #'next-buffer)
(define-key exwm-mode-map [?<] #'do-it-right)
(define-key exwm-mode-map [?>] #'do-it-right)
(define-key exwm-mode-map [?\?] #'do-it-right)

(define-key exwm-mode-map [?6] #'do-it-right)
(define-key exwm-mode-map [?7] #'do-it-right)
(define-key exwm-mode-map [?8] #'do-it-right)
(define-key exwm-mode-map [?9] #'do-it-right)

(define-key exwm-mode-map [?-] #'do-it-right)
(define-key exwm-mode-map [?=] #'do-it-right)

(setq exwm-input-simulation-keys
      '(
        ;; movement
        ([?\C-b] . [left])
        ([?\M-b] . [C-left])
        ([?\C-f] . [right])
        ([?\M-f] . [C-right])
        ([?\C-p] . [up])
        ([?\C-n] . [down])
        ([?\C-a] . [home])
        ([?\C-e] . [end])
        ([?\M-v] . [prior])
        ([?\C-v] . [next])
        ([?\C-d] . [delete])
        ([?\C-k] . [S-end delete])
        ;; cut/paste.
        ([?\C-w] . [?\C-x])
        ([?\M-w] . [?\C-c])
        ([?\C-y] . [?\C-v])
        ;; search
        ([?\C-s] . [?\C-f])

        ;; movement
        ([?b] . [C-left])
        ([?f] . [C-right])
        ([?p] . [up])
        ([?n] . [down])
        ([?a] . [home])
        ([?e] . [end])
        ([?d] . [S-C-right delete])
        ([?k] . [S-C-home delete])
        ([?D] . [delete])
        ([?v] . [next])
        ([?V] . [prior])

        ([?w] . [?\C-c])
        ([?y] . [?\C-v])
        ([?=] . [?\C-=])
        ([?-] . [?\C--])

        ;; search
        ([?s] . [?\C-f])))

(setq exwm-manage-configurations '((t char-mode t)))

(provide 'marco-mode-exwm)
;;; marco-mode-exwm.el ends here
