(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-t") 'helm-gtags-find-tag) ; function define
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag) ; function use
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol))) ; symbol
             ;; (local-set-key (kbd "M-s") 'helm-gtags-find-files);
(setq helm-gtags-path-style 'root) ; display for search result file path
(setq helm-gtags-ignore-case t) ; ignore
(setq helm-gtags-auto-update t) ; auto update gtags when buffer edited
