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
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (package-initialize)
  (package-refresh-contents)
  (package-install 'async))

(defun marco-install-packages ()
  "lmao bitch"
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (package-initialize)
  (package-refresh-contents)

  (dolist (value packages-to-install)
    (install-if-not value)))

(marco-install-packages)

(provide 'install-if-not)
;;; install-if-not.el ends here
