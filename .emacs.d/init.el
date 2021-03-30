;;; init.el --- modal emacs bindings
;; Version: 0.0.1
;;; License: zlib

;;; Commentary:
;;; Code:

;;;; Below are configurations for EXWM.

;; Add paths (not required if EXWM is installed from GNU ELPA).
;(add-to-list 'load-path "/path/to/xelb/")
;(add-to-list 'load-path "/path/to/exwm/")

;; Load EXWM.
(require 'exwm)

;; Fix problems with Ido (if you use it).
(require 'exwm-config)
;;(exwm-config-ido)

;; Set the initial number of workspaces (they can also be created later).
(setq exwm-workspace-number 4)

;; All buffers created in EXWM mode are named "*EXWM*". You may want to
;; change it in `exwm-update-class-hook' and `exwm-update-title-hook', which
;; are run when a new X window class name or title is available.  Here's
;; some advice on this topic:
;; + Always use `exwm-workspace-rename-buffer` to avoid naming conflict.
;; + For applications with multiple windows (e.g. GIMP), the class names of
;    all windows are probably the same.  Using window titles for them makes
;;   more sense.
;; In the following example, we use class names for all windows expect for
;; Java applications and GIMP.
(add-hook 'exwm-update-class-hook
          (lambda ()
            (unless (or (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                        (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-class-name))))
(add-hook 'exwm-update-title-hook
          (lambda ()
            (when (or (not exwm-instance-name)
                      (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                      (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-title))))

;; Global keybindings can be defined with `exwm-input-global-keys'.
;; Here are a few examples:
(setq exwm-input-global-keys
      `(
        ;; Bind "s-r" exwm reset layout
        ([?\M-r] . exwm-reset)
        ;; Bind "s-w" to switch workspace interactively.
        ([?\M-w] . exwm-workspace-switch)
        ;; bind "s-f" toggle full-screen
        ([?\M-f] . exwm-layout-toggle-fullscreen)
        ;; Bind "s-m" toggle line mode
        ([?\M-m] . exwm-layout-toggle-mode-line)
        ;; Bind "s-c" toggle char mode.
        ;; ([?\M-c] . exwm-input-toggle-keyboard)
        ([?\M-c] . toggle-marco-mode)

        ,@(mapcar (lambda (i)
                    `(,(kbd (format "M-%d" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-switch-create ,i))))
                  (number-sequence 0 9))
	;; Bind "s-0" to "s-9" to send window to another workspace.
        ,@(mapcar (lambda (i)
                    `(,(kbd (format "M-s-%d" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-move-window ,i))))
                  (number-sequence 0 9))
        ;; Bind "s-&" to launch applications ('M-&' also works if the output
        ;; buffer does not bother you).
        ([?\M-d] . (lambda (command)
		     (interactive (list (read-shell-command "$ ")))
		     (start-process-shell-command command nil command)))))

;; To add a key binding only available in line-mode, simply define it in
;; `exwm-mode-map'.  The following example shortens 'C-c q' to 'C-q'.
(define-key exwm-mode-map [?\C-q] #'exwm-input-send-next-key)

;; Do not forget to enable EXWM. It will start by itself when things are
;; ready.  You can put it _anywhere_ in your configuration.
(exwm-enable)

(require 'exwm-randr)
(setq exwm-randr-workspace-monitor-plist '(0 "HDMI-1" 1 "LVDS-1" 2 "LVDS-1" 3 "HDMI-1" 4 "HDMI-1"))

(exwm-randr-enable)

(require 'exwm-systemtray)
(exwm-systemtray-enable)

(provide 'init)
;;; init.el ends here
