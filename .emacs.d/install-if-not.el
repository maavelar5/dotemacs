;;; install-if-not.el --- Packages needed

;; Version: 0.0.1
;; License: zlib

;;; Commentary:
;;; Code:

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(defun install-if-not (package)
  (when (not (package-installed-p package))
    (package-install package)))

(defun marco-install-packages ()
  "marco-install-packages"
  (package-initialize)
  (package-refresh-contents)

  (dolist (value packages-to-install)
    (install-if-not value)))

(defun marco-install-packages-async (packages-to-install)
  "marco-install-packages"
  (install-if-not 'async)

  (async-start
   `(lambda ()
      (require 'package)

      (package-initialize)
      (package-refresh-contents)

      ,(dolist (value packages-to-install)
	 (install-if-not value))
      'ignore)
   (lambda (result)
     (message "already here?")
     (load-file "~/.emacs.d/config-common.el")
     ;; (load-file "~/.emacs.d/marco-light-bindings.el")
     (load-file "~/.emacs.d/marco-light-evil.el")
   )))

(provide 'install-if-not)
;;; install-if-not.el ends here