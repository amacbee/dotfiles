;; auto-complete
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; flycheck
(add-hook 'python-mode-hook
          (function (lambda ()
                      (setq indent-tabs-mode nil)
                      (flycheck-mode 1)
                      (setq-default flycheck-flake8-maximum-line-length 120)
                      (local-set-key (kbd "C-c C-p") 'flycheck-previous-error)
                      (local-set-key (kbd "C-c C-n") 'flycheck-next-error))))

(provide 'init-python)
