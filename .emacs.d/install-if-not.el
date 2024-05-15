;;; functions.el --- Layout and program launchers

;; Version: 0.0.1
;; License: zlib

;;; Commentary:
;;; Code:

(require 'package)

(defun install-if-not (package)
  (when (not (package-installed-p package))
    (package-install package)))


(when (not (package-installed-p 'async))
  (package-initialize)
  (package-refresh-contents)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (package-install 'async))


(defun marco-install-packages ()
  "lmao bitch"
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

  (package-initialize)
  (package-refresh-contents)

  (install-if-not 'ag)
  (install-if-not 'async)
  (install-if-not 'atomic-chrome)
  (install-if-not 'cmake-mode)
  (install-if-not 'clang-format+)
  (install-if-not 'counsel)
  (install-if-not 'company)
  (install-if-not 'exec-path-from-shell)
  (install-if-not 'eldoc-box)
  (install-if-not 'ivy)
  (install-if-not 'git-gutter+)
  (install-if-not 'lua-mode)
  (install-if-not 'markdown-mode)
  (install-if-not 'mood-line)
  (install-if-not 'projectile)
  (install-if-not 'smart-tab)
  (install-if-not 'typescript-mode)
  (install-if-not 'yasnippet)
  (install-if-not 'yasnippet-snippets)
  (install-if-not 'yaml-mode))

(provide 'install-if-not)
;;; install-if-not.el ends here