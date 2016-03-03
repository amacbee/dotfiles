;; see: http://emacs-jp.github.io/packages/package-management/package-el.html
;;      http://qiita.com/hottestseason/items/1e8a46ad1ebcf7d0e11c

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(defvar my/favorite-packages
  '(
    auto-complete
    flycheck
    go-mode
    go-autocomplete
    go-eldoc
    helm
    jedi
    markdown-mode
    powerline
    smartparens
    undo-tree
    yasnippet
    hc-zenburn-theme
    hlinum
    mwim
    anzu
    ))
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
        (package-install package)))

(load-theme 'hc-zenburn t)  ;; theme
(global-anzu-mode t)        ;; anzu-mode


;; requires

(require 'smartparens-config)  ;; 括弧の自動補完
(smartparens-global-mode t)

(require 'init-go)
(require 'init-mwin)
(require 'init-hlinum)
(require 'init-auto-complete)
(require 'init-helm)
(require 'init-markdown)
(require 'init-python)
(require 'init-term)
(require 'init-whitespace)

(provide 'init-packages)
