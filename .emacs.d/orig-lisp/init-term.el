;; Emacsが保持するterminfoを利用
;; run: tic -o ~/.terminfo /usr/local/share/emacs/24.5/etc/e/eterm-color.ti
(setq multi-term-program "/bin/zsh")
(setenv "TERMINFO" "~/.terminfo")

(provide 'init-term)
