;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages (quote (rainbow-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; el-get enable or install from GitHub
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
 (with-current-buffer
     (url-retrieve-synchronously
      "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
   (goto-char (point-max))
       (eval-print-last-sexp)))

;; 同じフォルダ内にあるものを自動的に読み込んでくれる
(el-get-bundle init-loader)
;; helmを使えるようにするプラグイン
(el-get-bundle helm)
;; メソッドでジャンプ等ができるプラグイン
(el-get-bundle helm-gtags)
;; helm
(el-get-bundle helm-descbinds)
;; 今いるGitのプロジェクトの中でhelmを実行できる
(el-get-bundle helm-projectile)
;; bind-keyが使えるプラグイン
(el-get-bundle jwiegley/use-package)
;; web-modeを使えるプラグイン
(el-get-bundle web-mode)
;; scss-modeを使えるプラグイン
(el-get-bundle scss-mode)
;; 括弧の色を色分け
(el-get-bundle rainbow-delimiters)
;; カラーコードに色をつけて表示
(el-get-bundle emacsmirror/rainbow-mode)
;; 自動でウィンドウサイズの変更
(el-get-bundle golden-ratio)
;; フォルダをツリー表示
(el-get-bundle neotree)
;; endを自動的に入力してくれるプラグイン
(el-get-bundle ruby-end)
;; 同じコマンドを連続実行したときのコマンド
(el-get-bundle sequential-command)
(el-get-bundle! sequential-command-config)
;; ガイドキーの改良版
(el-get-bundle which-key)
;; キーコンボ（＝で自動スペース）を使えるプラグイン
(el-get-bundle uk-ar/key-combo)
;; カンパニーモードを使えるように
(el-get-bundle company-mode/company-mode)
;; スペース可視化
(el-get-bundle whitespace)
;; スニペットを使えるプラグイン
(el-get-bundle yasnippet)
;; 検索文字列を現在のバッファで検索
(el-get-bundle anzu)
;; 同じシンボルをすべてハイライト
(el-get-bundle auto-highlight-symbol)
;; バッファを切り替えた際にカーソルを一瞬だけ灯す
(el-get-bundle beacon)
;; rails開発モード
(el-get-bundle projectile-rails)
;; 指定したディレクトリ以下の文字を検索
(el-get-bundle moccur-edit)
;; (el-get-bundle minimap)
;; バッファの表示内容をWebブラウザで表示
(el-get-bundle htmlize)

;; エラーを自動で検出してくれるプラグイン
;;(el-get-bundle flycheck)
;; インデントの階層を可視化
;; (el-get-bundle indent-guide)

;; config
(init-loader-load "~/.emacs.d/inits")
