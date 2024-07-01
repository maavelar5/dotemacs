;; UI
(fringe-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-auto-revert-mode)
(server-start)

;; Variables
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(setq mode-require-final-newline nil)
(setq inhibit-startup-screen t)
(setq-default indent-tabs-mode nil)
(setq org-image-actual-width nil)
(setq eglot-events-buffer-size 0)
(setq eglot-sync-connect nil)
(setq eglot-connect-timeout nil)
(fset #'jsonrpc--log-event #'ignore)

(add-hook 'focus-out-hook 'garbage-collect)
(exec-path-from-shell-copy-env "LD_LIBRARY_PATH")
(exec-path-from-shell-copy-env "KEPLER_SDK_PATH")

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Modes
;; (fido-vertical-mode)
(ivy-mode)
(global-company-mode)
(global-smart-tab-mode)
(electric-pair-mode)
(global-git-gutter+-mode)

(provide 'config-common)
