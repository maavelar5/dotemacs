;; UI
(fringe-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Variables
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(setq mode-require-final-newline nil)
(setq inhibit-startup-screen t)
(setq-default indent-tabs-mode nil)

(global-auto-revert-mode)
(server-start)

(exec-path-from-shell-copy-env "LD_LIBRARY_PATH")
(exec-path-from-shell-copy-env "KEPLER_SDK_PATH")

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Modes
(fido-vertical-mode)
(global-company-mode)
(global-smart-tab-mode)

(provide 'config-common)