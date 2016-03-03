;; PATH
(defvar amacbee/gopath (getenv "GOPATH"))
(defvar amacbee/gopath-bin (expand-file-name "bin" amacbee/gopath))

(setenv "GOPATH" amacbee/gopath)
(setenv "PATH" (concat (getenv "PATH") ":" amacbee/gopath-bin))
(add-to-list 'exec-path amacbee/gopath-bin)

;; autocomplete
(require 'go-autocomplete)

;; eldoc
(add-hook 'go-mode-hook 'go-eldoc-setup)

;; flycheck & key binding
(add-hook 'go-mode-hook
          (function (lambda ()
                      (flycheck-mode 1)
                      (local-set-key (kbd "M-.") 'godef-jump)
                      (local-set-key (kbd "M-,") 'pop-tag-mark))))

;; 保存時にgofmtをかける
(add-hook 'before-save-hook 'gofmt-before-save)

;; helm
(defvar my/helm-go-source
  '((name . "Helm Go")
    (candidates . (lambda ()
                    (cons "builtin" (go-packages))))
    (action . (("Show document" . godoc)
               ("Import package" . my/helm-go-import-add)))))
(defun my/helm-go-import-add (candidate)
  (dolist (package (helm-marked-candidates))
    (go-import-add current-prefix-arg package)))
(defun my/helm-go ()
  (interactive)
  (helm :sources '(my/helm-go-source) :buffer "*helm go*"))

(provide 'init-go)
