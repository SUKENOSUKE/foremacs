;;; P30 デバッグモードでの起動
;; cl-libパッケージを読み込む
(require 'cl-lib)
;; スタートアップメッセージを非表示
(setq inhibit-startup-screen t)

;;; P61 Elisp配置用のディレクトリを作成
;; load-pathを追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;;引数のディレクトリとそのサブディレクトリをload-pathに追加
(add-to-load-path "elisp" "conf" "public_repos")

;;; P63 Emacsが自動的に書き込む設定をcustom,elに保存する
;; カスタムファイルを別ファイルにする
(setq custom-file (locate-user-emacs-file "custm.el"))
;; カスタムファイルが存在しない場合は作成する
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
;; カスタムファイルを読み込む
(load custom-file)



;;; P65 OSの違いによる分岐
;; Macだけに読み込ませる内容を書く
;macじゃないのでコメントアウト
;(when (eq system-type 'darwin)
    ;;省略

;;; P65-66 CUIとGUIによる分岐
;; ターミナル以外はツールバー、スクロールバーを非表示
(when window-system
  ;; tool-barを非表示
  (tool-bar-mode 0)
  ;; scroll-barを非表示
  (scroll-bar-mode 0))


