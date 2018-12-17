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

;; ;; set font
;; set font
(let ((ws window-system))
  (cond ((eq ws 'w32) ; windows
         (set-face-attribute 'default nil :family "Ricty Diminished" :height 110)
         (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty Diminished")))
        ((eq ws 'ns) ; mac
         (set-face-attribute 'default nil :family "Ricty Diminished" :height 110)
         (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty Diminished")))))

;; ;;; CamingoCode + Ricty Diminished
;; (create-fontset-from-ascii-font "CamingoCode:size=13:weight=normal:slant=normal"
;;                                 nil
;;                                 "CamingoCode_RictyDiminished")
;; (set-fontset-font "fontset-CamingoCode_RictyDiminished"
;;                   'unicode
;;                   (font-spec
;;                    :family "Ricty Diminished"
;;                    :size 14)
;;                   nil
;;                   'append)
;; ;;; 上記で作成したフォントセットをデフォルトに設定する.
;; (add-to-list 'default-frame-alist '(font . "fontset-CamingoCode_RictyDiminished"))

;; color theme
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (setq custom-theme-directory "~/.emacs.d/themes")
;; (load-theme 'desert t)
;; (enable-theme 'desert)

;; emacs起動時の読み込みを非表示
(setq init-loader-show-log-after-init nil)

;; メニューバーを非表示
(menu-bar-mode -1)

;; ewwで画像を非表示にする
(defun eww-disable-images ()
  "eww で画像表示させない"
  (interactive)
  (setq-local shr-put-image-function 'shr-put-image-alt)
  (eww-reload))
(defun eww-enable-images ()
  "eww で画像表示させる"
  (interactive)
  (setq-local shr-put-image-function 'shr-put-image)
  (eww-reload))
(defun shr-put-image-alt (spec alt &optional flags)
  (insert alt))
;;はじめから非表示
(defun eww-mode-hook--disable-image ()
  (setq-local shr-put-image-function 'shr-put-image-alt))
(add-hook 'eww-mode-hook 'eww-mode-hook--disable-image)

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
;; indent width 4
(setq-default c-basic-offset 4)
;; tab width 2
(setq-default tab-width 4)
;; タブの無効化
(setq-default indent-tabs-mode nil)

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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 文字コード
;;  機種依存文字例：～①㈱©
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'cp5022x)
;; 各種文字コード設定
(set-default-coding-systems 'utf-8-emacs)
(setq default-file-name-coding-system 'utf-8-emacs)
;; charset と coding-system の優先度設定
(set-charset-priority 'ascii
                      'japanese-jisx0208
                      'latin-jisx0201
                      'katakana-jisx0201
                      'iso-8859-1
                      'cp1252
                      'unicode)
(set-coding-system-priority 'utf-8
                            'euc-jp
                            'iso-2022-jp
                            'cp932)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
