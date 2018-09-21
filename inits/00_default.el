;; startup message hide
(setq inhibit-startup-message t)

;; default utf-8
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)


;; color theme
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (setq custom-theme-directory "~/.emacs.d/themes")
;; (load-theme 'desert t)
;; (enable-theme 'desert)

;; emacs起動時の読み込みを非表示
(setq init-loader-show-log-after-init nil)

;; メニューバーを非表示
(menu-bar-mode -1)

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; 行数を表示する
(global-linum-mode t)

;; 5 桁分の領域を確保して行番号のあとにスペースを入れる
(setq linum-format "%3d ")

;; C-kで行全体を削除する
(setq kill-whole-line t)

;; （t >>常にインデントを揃えるのみ（default）、 nill >> 左端（文字前）ではインデント、それ以外はタブの挿入）
(setq tab-always-indent nil)

;; インデントとタブの設定
(setq c-tab-always-indent nil)

;; 閉じ括弧などを自動入力
(electric-pair-mode 1)

;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)

;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;; auto-save-list-fileを作らない
(setq auto-save-list-file-prefix nil)

;; 行単に不要なスペースがある場合、backspaceを一度するだけで全て削除
(setq backward-delete-char-untabify-method 'hungry)

;; ファイルに変更があった場合、バッファを自動反映
(global-auto-revert-mode 1)

;; yes or no =>  y or n に変更
(defalias 'yes-or-no-p 'y-or-n-p)

;; emacsからgoogle検索
(setq eww-search-prefix "https://www.google.co.jp/search?q=")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; コードの折りたたみ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'ruby-mode-hook
  (lambda () (hs-minor-mode)))

(eval-after-load "hideshow"
  '(add-to-list 'hs-special-modes-alist
    `(ruby-mode
      ,(rx (or "def" "class" "module" "do" "{" "[")) ; Block start
      ,(rx (or "}" "]" "end"))                       ; Block end
      ,(rx (or "#" "=begin"))                        ; Comment start
      ruby-forward-sexp nil)))

(global-set-key (kbd "M-\\") 'hs-hide-block)
(global-set-key (kbd "C-\\") 'hs-show-block)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 背景の透明度の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun set-alpha (alpha-num)
  "set frame parameter 'alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(90))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
