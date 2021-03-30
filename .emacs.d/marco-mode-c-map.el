(defvar c-m-map (make-sparse-keymap)
  "Keymap for \"leader key\" shortcuts.")

(define-key c-m-map "u" 'magit-push)
(define-key c-m-map "p" 'magit-pull)
(define-key c-m-map "s" 'magit-status)
(define-key c-m-map "c" 'magit-commit)
(define-key c-m-map "d" 'magit-diff-dwim)

(defvar c-w-map (make-sparse-keymap)
  "Keymap for \"leader key\" shortcuts.")

(define-key c-w-map "1" 'winum-select-window-1)
(define-key c-w-map "2" 'winum-select-window-2)
(define-key c-w-map "3" 'winum-select-window-3)
(define-key c-w-map "4" 'winum-select-window-4)
(define-key c-w-map "5" 'winum-select-window-5)
(define-key c-w-map "6" 'winum-select-window-6)
(define-key c-w-map "7" 'winum-select-window-7)
(define-key c-w-map "8" 'winum-select-window-8)
(define-key c-w-map "9" 'winum-select-window-9)
(define-key c-w-map "0" 'winum-select-window-by-number)

(defvar c-map (make-sparse-keymap)
  "Keymap for \"leader key\" shortcuts.")

(define-key c-map "a" 'avy-goto-char)
(define-key c-map "d" 'avy-zap-to-char)
(define-key c-map "h" 'hs-toggle-hiding)
(define-key c-map "t" 'create-tags)
(define-key c-map "l" 'avy-goto-line)

(define-key c-map "w" c-w-map)
(define-key c-map "m" c-m-map)

(define-key c-map "f" 'counsel-projectile-find-file)
(define-key c-map "r" 'projectile-run-project)
(define-key c-map "c" 'projectile-compile-project)
(define-key c-map "b" 'counsel-projectile-switch-to-buffer)

(define-key c-map "g" 'golden-ratio)

(define-key c-map "i" 'counsel-imenu)
(define-key c-map "e" 'exec-x-app)
(define-key c-map "o" 'occur)
(define-key c-map "s" 'eshell)
