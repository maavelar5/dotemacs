(setq packages-to-install
      (list 'ag
            'clang-format+
            'projectile
            'cmake-mode
            'company
            'exec-path-from-shell
            'smart-tab))

(load-file "~/.emacs.d/install-if-not.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(completion-styles '(flex basic partial-completion emacs22))
 '(custom-enabled-themes '(leuven-dark))
 '(package-selected-packages '(async ztree projectile exec-path-from-shell company ag)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 110 :family "Liberation Mono")))))

(load-file "~/.emacs.d/marco-mode.el")
(load-file "~/.emacs.d/config-common.el")
(load-file "~/.emacs.d/marco-light-bindings.el")
