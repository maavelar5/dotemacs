;;; functions.el --- Layout and program launchers

;; Version: 0.0.1
;; License: zlib

;;; Commentary:
;;; Code:

(defun suspend ()
  "Suspends the machine."
  (interactive)
  (shell-command "sudo systemctl suspend"))

(defun poweroff ()
  "Suspends the machine."
  (interactive)
  (shell-command "sudo systemctl poweroff"))

(defun pulsemixer ()
  "Pulsemixer."
  (interactive)
  (start-process-shell-command "st pulsemixer" nil "st pulsemixer"))

(defun alacritty ()
  "Exec alacritty."
  (interactive)
  (start-process-shell-command "alacritty" nil "alacritty"))

(defun autorandr ()
  "Exec autorandr change."
  (interactive)
  (start-process-shell-command "autorandr -c" nil "autorandr -c"))

(defun toggle-laptop-mic ()
  "Toggle laptop mic"
  (interactive)
  (start-process-shell-command "toggle laptop mic" nil "pulsemixer --toggle-mute --id source-0"))

(defun js-beautify ()
  (interactive)
  (setq js-beautify-cmd (concat "js-beautify -r " (buffer-file-name)))
  (shell-command js-beautify-cmd))

(defun delete-whitespace-and-save ()
  "Delete whitespace and save buffer."
  (interactive)
  (progn
    (when (and (locate-dominating-file "." ".clang-format") (or (equal major-mode 'c++-mode) (equal major-mode 'c-mode) (equal major-mode 'glsl-mode)))
      (clang-format-buffer))
    (when (or (equal major-mode 'web-mode) (equal major-mode 'js-mode))
      (setq current-point (point))
      (mark-whole-buffer)
      (indent-region (region-beginning) (region-end))
      (delete-trailing-whitespace)
      (goto-char current-point)))
    (when t
      (delete-trailing-whitespace))
    (save-buffer))

(defun indent-file ()
  "Indent file. "
  (interactive)
  (indent-region (point-min) (point-max) nil))

(setq dev-lsp t)
(setq dev-fancy t)
(setq dev-ggtags nil)
(setq dev-column t)

(defun development-mode ()
  "Modes used for development."
  (interactive)
  (when dev-fancy
      (hl-todo-mode t)
      (highlight-numbers-mode t)
      (rainbow-delimiters-mode t)
      (color-identifiers-mode t)
      (if (window-system)
          (fira-code-mode)))

  (when dev-column
    (column-enforce-mode))

  (company-mode t)
  (hs-minor-mode t)

  (smart-tab-mode t)
  (projectile-mode)

  (when dev-lsp
    (when (equal major-mode 'c++-mode)
      (lsp t)))

  (when dev-ggtags
    (when (equal major-mode 'c++-mode)
      (ggtags-mode t)))

  (setq show-trailing-whitespace t)
  (setq indent-tabs-mode nil)
  (git-gutter+-mode))

(defun v-split-move ()
  "Needed a mid shit."
  (interactive)
  (enable-marco-mode)
  (split-window-right)
  (other-window 1))

(defun h-split-move ()
  "Needed a mid shit."
  (interactive)
  (enable-marco-mode)
  (split-window-below)
  (other-window 1))

(defun v-split-move-find-file ()
  "Needed a mid shit."
  (interactive)
  (split-window-right)
  (other-window 1)
  (counsel-find-file))

(defun h-split-move-find-file ()
  "Needed a mid shit."
  (interactive)
  (split-window-below)
  (other-window 1)
  (counsel-find-file))

(defun marco-find-file ()
  (interactive)
  (if 'projetile-mode
      (counsel-projectile-find-file)
    (counsel-find-file)))

(defun exec-x-app (command)
  "Run (COMMAND) X program."
  (interactive (list (read-shell-command "$ ")))
  (start-process-shell-command command nil command))

(defun arepg ()
  "Run arepg project."
  (interactive)
  (exwm-workspace-switch-create 3)
  (delete-other-windows)
  (eshell)
  (with-current-buffer "*eshell*"
    (eshell-return-to-prompt)
    (insert "clear 1")
    (eshell-send-input)
    (insert "~/gamedev/arepg/debug/arepg")
    (eshell-send-input))
  (sleep-for 1)
  (v-split-move)
  (exwm-workspace-switch-to-buffer "arepg")
  (h-split-move)
  (exwm-workspace-switch-to-buffer "*eshell*")
  (other-window 2))

(defun do-it-right ()
  "Error message for incorrect shortcut."
  (interactive)
  (message "Do it right Bruh!"))

(defvar path-to-ctags "/bin/ctags")

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name))))

(defun connect-to-headset-force ()
  "Connect to headset and turn on pulseaudio just in case."
  (interactive)
  (start-process-shell-command "start pulseaudio" nil "pulseaudio --kill")
  (sleep-for 1)
  (start-process-shell-command "start pulseaudio" nil "pulseaudio --start")
  (sleep-for 1)
  (start-process-shell-command "connect to HD4.40" nil "bluetoothctl connect 00:16:94:32:82:61"))

(defun connect-to-headset ()
  "Connect to headset and turn on pulseaudio just in case."
  (interactive)
  (start-process-shell-command "connect to HD4.40" nil "bluetoothctl connect 00:16:94:32:82:61")
  (sleep-for 1))

(defun disable-marco-mode ()
  "Nothing."
  (interactive)
  (marco-mode -1))

(defun enable-marco-mode ()
  "Nothing."
  (interactive)
  (marco-mode 1))

(defun marco-exwm-hook ()
  "Placeholder."
  (interactive)
  (setq exwm-mode-line-shit 1)
  (make-local-variable 'exwm-mode-line-shit)
  (marco-mode -1))

(defun disable-resizer-mode ()
  "Nothing."
  (interactive)
  (resizer-mode -1))

(defun toggle-resizer-mode (&optional set-state)
  "Toggle `resizer-mode', optionally ensuring its state with `SET-STATE'."
  (interactive)
  (cond
   ((active-minibuffer-window)
    (resizer-mode -1))

   ((equal set-state -1)
    (when resizer-mode
      (resizer-mode 1)))

   ((equal set-state nil)
    (resizer-mode (if resizer-mode -1 1)))))

(setq exwm-mode-line-shit 1)

(defun exwm-marco-mode ()
  "EXWM + marco-mode."
  (interactive)
  (marco-mode -1)

  (if (equal exwm-mode-line-shit 1)
      (setq exwm-mode-line-shit 0)
    (setq exwm-mode-line-shit 1))
  (call-interactively #'exwm-input-toggle-keyboard)
  (message "%s" major-mode))

(defun toggle-marco-mode (&optional set-state)
  "Toggle `marco-mode', optionally ensuring its state with `SET-STATE'."
  (interactive)
  (disable-resizer-mode)

  (cond
   ((equal major-mode 'exwm-mode)
    (exwm-marco-mode))

   ((equal set-state -1)
    (when marco-mode
      (marco-mode 1)))

   ((equal set-state nil)
    (marco-mode (if marco-mode -1 1)))))

(defun n-key-marco-mode ()
  "N key mapping for marco-mode."
  (interactive)
  (if (not current-prefix-arg)
      (setq number 1)
    (setq number current-prefix-arg))

  (if (active-minibuffer-window)
      (ido-next-match)
    (next-line number)))

(defun n-key-ivy-marco-mode ()
  "N key mapping ivy + marco"
  (interactive)
  (if (not current-prefix-arg)
      (setq number 1)
    (setq number current-prefix-arg))

  (if (active-minibuffer-window)
      (ivy-next-line number)
    (next-line number)))

(defun n-key-helm-marco-mode ()
  "N key mapping helm + marco"
  (interactive)
  (if (active-minibuffer-window)
      (helm-next-line)
    (next-line)))

(defun p-key-marco-mode ()
  "P key mapping for marco-mode."
  (interactive)
  (if (not current-prefix-arg)
      (setq number 1)
    (setq number current-prefix-arg))

  (if (active-minibuffer-window)
      (ido-prev-match)
    (previous-line number)))

(defun p-key-ivy-marco-mode ()
  "P key mapping ivy + marco"
  (interactive)
  (if (not current-prefix-arg)
      (setq number 1)
    (setq number current-prefix-arg))

  (if (active-minibuffer-window)
      (ivy-previous-line)
    (previous-line number)))

(defun p-key-helm-marco-mode ()
  "P key mapping helm + marco"
  (interactive)
  (if (active-minibuffer-window)
      (helm-previous-line)
    (previous-line)))

(defun l-key-marco-mode ()
  "L key mapping for marco-mode."
  (interactive)
  (if (active-minibuffer-window)
      (helm-find-files-up-one-level 1)
    (recenter-top-bottom)))

(defun escape-key-marco-mode ()
  "ESC key mapping for marco-mode."
  (interactive)
  (if (active-minibuffer-window)
      (keyboard-escape-quit)
    (keyboard-quit))
  (enable-marco-mode))

(defun ret-key-marco-mode ()
  "RET key mapping for marco-mode."
  (interactive)
  (if (active-minibuffer-window)
      (ido-exit-minibuffer)
    (do-it-right)))

(defun tab-key-marco-mode ()
  "TAB key mapping for marco-mode."
  (interactive)
  (if (active-minibuffer-window)
      (ido-completion-help)
    (forward-char)))

(defun run-new-shit ()
  "Run arepg project."
  (interactive)
  (exwm-workspace-switch-create 3)
  (delete-other-windows)
  (eshell)
  (with-current-buffer "*eshell*"
    (eshell-return-to-prompt)
    (insert "clear 1")
    (eshell-send-input)
    (insert "~/new_shit/")
    (eshell-send-input)
    (insert "./arepg")
    (eshell-send-input))
  (sleep-for 1)
  (v-split-move)
  (exwm-workspace-switch-to-buffer "*eshell*")
  (exwm-workspace-switch-to-buffer "Wine")
  (other-window 2))

(defun marco-other-window ()
  "Switch and disable marco mode"
  (interactive)
  (if (equal major-mode 'exwm-mode)
      (exwm-marco-mode)
    (enable-marco-mode))

  (other-window 1))

(defun hide-mode-line ()
  (interactive)
  (setq mode-line-format nil))

(defun dual-frenzy-mode ()
  "nothing."
  (interactive)
  (split-window-below)
  (enlarge-window 18)
  (find-file "~/gamedev/snako/main.cc")
  (split-window-right)
  (other-window 1)
  (eshell)
  (other-window 1)
  (switch-to-buffer "irc.chat.twitch.tv:6697")
  (erc-join-channel "maavelar")
  (hide-mode-line))

(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . web-mode))

(add-hook 'c-mode-hook 'development-mode)
(add-hook 'c++-mode-hook 'development-mode)
(add-hook 'emacs-lisp-mode-hook 'development-mode)
(add-hook 'javascript-mode-hook 'development-mode)
(add-hook 'js-mode-hook 'development-mode)
(add-hook 'web-mode-hook 'development-mode)
(add-hook 'fundamental-mode 'development-mode)

(setq dmenu-cfg " | dmenu -i -l 20 -p .")

(defun dmenu-ag ()
  (interactive)

  (setq my_shell_output (shell-command-to-string (concat "ag . " dmenu-cfg)))
  (setq splitted (split-string my_shell_output ":"))

  (when (> (length splitted) 1)
    (find-file (car splitted))
    (goto-line (string-to-number (nth 1 splitted)))))

(defun dmenu-ag-in-file ()
  (interactive)

  (setq my_command (concat "ag . " buffer-file-name dmenu-cfg))
  (setq my_shell_output (shell-command-to-string my_command))
  (setq splitted (split-string my_shell_output ":"))

  (when (> (length splitted) 1)
    (goto-line (string-to-number (car splitted)))))

(defun dmenu-find-file (&optional dir)
  (interactive)

  (setq command (concat "ls -a" dmenu-cfg))
  (setq output (shell-command-to-string command))

  (when (> (length output) 1)
    (find-file (substring output 0 -1))))

(defun dmenu-switch-buffer (&optional dir)
  (interactive)

  (setq command (concat (format "%s" (buffer-list)) dmenu-cfg))
  (setq splitted (split-string my_shell_output ":"))

  (print command))

(defun twitch-brewing-coffee ()
  (interactive)

  (setq string "(defun brewing-coffee () \"BRB...Starting soon\")")

  (dolist (char (append string nil))
    (insert char)
    (sit-for 0.1))

  (sit-for 5)

  (beginning-of-line)
  (kill-line)

  (twitch-brewing-coffee))

(setq random-index 1)
(setq random-string "my animation")
(setq current-string "")

(defun random-stuff ()
  (interactive)

  (if (>= random-index (length random-string))
      (setq random-index 1)
    (setq random-index (+ random-index 1)))

  (message (substring random-string 0 random-index)))

;; variable for the timer object
(defvar idle-timer-cookbook-timer nil)

;; callback function
(defun idle-timer-cookbook-callback ()
  (if (>= random-index (length random-string))
      (setq random-index 1)
    (setq random-index (+ random-index 1)))

  (setq current-string (substring random-string 0 random-index))
  (message current-string))

(defun check-string () current-string)
;; start functions
(defun idle-timer-cookbook-run-once ()
  (interactive)
  (when (timerp idle-timer-cookbook-timer)
    (cancel-timer idle-timer-cookbook-timer))
  (setq idle-timer-cookbook-timer
          (run-with-idle-timer 1 nil #'idle-timer-cookbook-callback)))

(defun idle-timer-cookbook-start ()
  (interactive)
  (when (timerp idle-timer-cookbook-timer)
    (cancel-timer idle-timer-cookbook-timer))
  (setq idle-timer-cookbook-timer
          (run-with-timer .01 1 #'idle-timer-cookbook-callback)))

;; stop function
(defun idle-timer-cookbook-stop ()
  (interactive)
  (when (timerp idle-timer-cookbook-timer)
    (cancel-timer idle-timer-cookbook-timer))
  (setq idle-timer-cookbook-timer nil))

(defun keyboard-shit ()
  "Reconnect keyboard settings."
  (interactive)
  (shell-command "xset r rate 200 60")
  (shell-command "setxkbmap -option caps:super"))

(provide 'functions)
;;; functions.el ends here
