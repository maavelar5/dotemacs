;;; marco-mode-mode-line.el --- modal emacs bindings
;;; Version: 0.0.1
;;; License: zlib

;;; Commentary:
;;; Code:

(defun check-status ()
  "Check marco-mode status."
  (interactive)

  (if (equal major-mode 'exwm-mode)
      (progn
        (if resizer-mode
            (setq header-line-shit "RESIZE")
          (progn
            (if (equal exwm-mode-line-shit 1)
                (setq header-line-shit "CHAR")
            (setq header-line-shit "LINE")))))
    (progn
      (if resizer-mode
          (setq header-line-shit "RESIZE")
        (progn
          (if marco-mode
              (setq header-line-shit "MOVE")
            (setq header-line-shit "EDIT"))))))

  header-line-shit)

(defface marco-winum-mode
  '((t :foreground "orange"
       :weight bold))
  "Face for winum-mode."
  :group 'marco-mode)

(defface marco-mode
  '((t :foreground "cyan"
       :weight bold))
  "Face for current marco mode."
  :group 'marco-mode)

(defface marco-buffer
  '((t :foreground "IndianRed1"
       :weight bold))
  "Face for buffer name."
  :group 'marco-mode)

(defface marco-line-column
  '((t :foreground "light slate blue"
       :weight bold))
  "Face for line-column numbers."
  :group 'marco-mode)

(defface marco-major-mode
  '((t :foreground "white"
       :weight bold))
  "Face for global variables."
  :group 'marco-mode)

(defface marco-date
  '((t :foreground "yellow"
       :weight bold))
  "Face for global variables."
  :group 'marco-mode)

(defface marco-battery
  '((t :foreground "spring green"
       :weight bold))
  "Face for global variables."
  :group 'marco-mode)

(setq battery-mode-line-format "%p")

(setq display-time-string-forms
      '((propertize
         (concat 24-hours ":" minutes " " day "/" month "/" year)
         'face 'marco-date)))

(setq-default mode-line-format
              '("%e"
                "[" (:eval (propertize (winum-get-number-string) 'face 'marco-winum-mode)) "] "
                "[" (:eval (propertize (check-status) 'face 'marco-mode)) "] "
                "[" (:eval (propertize "%b" 'face 'marco-buffer)) "] "
                "[" (:eval (propertize display-time-string 'face 'marco-date)) "] "
                ;; "[" (:eval (propertize battery-mode-line-string 'face 'marco-battery)) "] "
                "[" (:eval (propertize "%m" 'face 'marco-major-mode)) "] "
                "[" (:eval (propertize "%l,%c" 'face 'marco-line-column)) "] "))

(provide 'marco-mode-mode-line)
;;; marco-mode-mode-line.el ends here
