;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; for isolation environment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; default setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq ring-bell-function 'ignore)    ;; ビープ音を鳴らさない
(setq visible-bell t)                ;; ビープ音の代わりに画面をフラッシュ
(tool-bar-mode 0)                    ;; ツールバーを消す
(menu-bar-mode 0)                    ;; メニューバーを消す
(setq default-tab-width 4)           ;; タブは4文字分
(setq-default indent-tabs-mode nil)
(setq make-backup-files nil)         ;; バックアップファイルを作らない
(setq auto-save-default nil)
(show-paren-mode 1)                  ;; 対応する括弧のハイライト
(setq completion-ignore-case t)      ;; 大文字小文字を区別しない
(auto-image-file-mode t)             ;; 画像ファイルを表示
(setq scroll-conservatively 1)       ;; スクロールは一行ずつ


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/orig-lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp")

(require 'init-packages)
