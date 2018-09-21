(when (< emacs-major-version 24)
  (defalias 'prog-mode 'fundamental-mode))
(add-to-list 'auto-mode-alist '("\\.html$"      . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.ctp$"       . web-mode))
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq tab-width 2)
  ;; (setq indent-tabs-mode t)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-offset 2)
  (setq web-mode-script-offset 2)
  ;; (setq web-mode-php-offset 2)
  ;; (setq web-mode-java-offset 2)
  ;; (setq web-mode-javascript-offset 2)
  (setq web-mode-asp-offset 2)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-pairing t) ; erb
  ;; auto tag closing
  ;0=no auto-closing
  ;1=auto-close with </
  ;2=auto-close with > and </
  (setq web-mode-tag-auto-close-style 2)
  (setq web-mode-auto-close-style 2))
(add-hook 'web-mode-hook 'web-mode-hook)
