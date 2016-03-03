;;(autoload 'markdown-mode "markdown-mode"
;;  "Major mode for editing Markdown files" t)
(require 'markdown-mode)

(add-to-list 'auto-mode-alist '("\\.text\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

;; see: http://blog.shinofara.xyz/archives/354/
(defun markdown-custom ()
  "markdown-mode-hook"
  (setq markdown-command-needs-filename t)
  )
(add-hook 'markdown-mode-hook '(lambda() (markdown-custom)))

;; whitespace-actionの無効化
(add-hook 'markdown-mode-hook
          '(lambda ()
             (set (make-local-variable 'whitespace-action) nil)))

(provide 'init-markdown)
