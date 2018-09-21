
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; default
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-h を back spaceに設定
(bind-key "C-h" 'backward-delete-char-untabify)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; search buffer history
(bind-key "C-x b" 'helm-mini)
;; 今いるGitのプロジェクトの中でhelmを実行できる
(bind-key "C-x C-b" 'helm-projectile-recentf)
;; 今いるバッファ内のメソッド検索
(bind-key "C-c C-i" 'helm-imenu)
;; helmの中でも補完できるようにする
(bind-key "C-c i" 'helm-execute-persistent-action helm-find-files-map)
(bind-key "C-c i" 'helm-execute-persistent-action helm-read-file-map)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-highlight-symbol
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ハイライトされている同じ文字へジャンプ
(bind-key "M-n" 'ahs-forward)
(bind-key "M-p" 'ahs-backward)
;; 画面内の範囲か、範囲外のところへもジャンプ可能に切り替え
(bind-key "M-c" 'ahs-change-range)
;; ハイライトされている文字すべてを同時に変更
(bind-key "M-r" 'ahs-edit-mode)


(bind-key "C-c C-g" 'moccur-grep-find)
