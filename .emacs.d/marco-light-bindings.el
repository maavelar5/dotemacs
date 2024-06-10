(load-file "~/.emacs.d/marco-mode.el")
(load-file "~/.emacs.d/functions.el")

(set-keybind "C-s" 'isearch-forward-regexp)
(set-keybind "C-r" 'isearch-backward-regexp)
(set-keybind "C-;" 'comment-line)
(set-keybind "C-t" 'marco-ag)
(set-keybind "M-t" 'projectile-ag)

(set-keybind "M-/" 'xref-find-references)
(set-keybind "M-]" 'next-error)
(set-keybind "M-[" 'previous-error)
(set-keybind "M-e" 'execute-extended-command)
(set-keybind "M-h" 'hs-toggle-hiding)

(set-keybind "M-1" 'delete-other-windows)
(set-keybind "M-2" 'split-window-vertically)
(set-keybind "M-3" 'split-window-horizontally)
(set-keybind "M-4" 'other-window)
(set-keybind "M-0" 'delete-window)

(set-keybind "M-o" 'find-file)
(set-keybind "M-O" 'projectile-find-file)
(set-keybind "M-s" 'save-buffer)
(set-keybind "M-p" 'switch-to-buffer)

(set-keybind "M-i" 'imenu)
(set-keybind "M-k" 'kill-current-buffer)

(set-keybind "M-c" 'projectile-compile-project)
(set-keybind "M-r" 'projectile-run-project)

(set-keybind "<f10>" 'treemacs)

(set-keybind "<f1>" 'start-kbd-macro)
(set-keybind "<f2>" 'end-kbd-macro)
(set-keybind "<f3>" 'call-last-kbd-macro)

(set-keybind "M-l" 'clang-format-region)