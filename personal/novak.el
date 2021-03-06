;; javascript indent level
(setq js-indent-level 2)

;; color long lines
(setq whitespace-line-column 100)

;; auto-add newlines at end of buffer
(setq next-line-add-newlines t)

;; line numbers on
(global-linum-mode t)

;; flycheck with jscs
(flycheck-def-config-file-var flycheck-jscs javascript-jscs "~/git/seurat/SEURAT-JavaScript/.jscs.json"
  :safe #'stringp)

(flycheck-define-checker javascript-jscs
  "A JavaScript code style checker.

See URL `https://github.com/mdevils/node-jscs'."
  :command ("jscs" "--reporter" "checkstyle"
            (config-file "--config" flycheck-jscs)
            source)
  :error-parser flycheck-parse-checkstyle
  :modes (js-mode js2-mode js3-mode)
  :next-checkers (javascript-jshint))

(add-to-list 'flycheck-checkers 'javascript-jscs)

(custom-set-faces
 '(flycheck-error ((((class color)) (:underline "Red"))))
 '(flycheck-warning ((((class color)) (:underline "Orange")))))

;; jshint
(require 'flymake-jshint)
(add-hook 'js-mode-hook 'flymake-mode)
(setq jshint-configuration-path "~/.jshint.json")

;; autocomplete on
(require 'auto-complete-config)
(ac-config-default)

;;yasnippet on
(require 'yasnippet)
(yas-global-mode 1)

;; Closure-snippets
(let ((closure-snippets "~/closure-snippets/emacs"))
  (add-to-list 'load-path closure-snippets)
  (require 'closure-snippets-support)
  (yas/load-directory closure-snippets))
(setq yas/prompt-functions '(yas/ido-prompt yas/dropdown-prompt yas/completing-prompt yas/x-prompt yas/no-prompt))

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-basic-offset 2)
(setq js2-bounce-indent-p t)

;; js2-refactor
(require 'js2-refactor)

;; calfw
(require 'calfw-ical)
(cfw:open-ical-calendar "https://www.google.com/calendar/ical/paul.novak%40schrodinger.com/private-4d1a87800c42350058a998d587720969/basic.ics")

;; keybindings
;; Invoke M-x without alt key
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
;; backward kill word
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
;; Move more quickly
(global-set-key (kbd "C-S-n")
                (lambda ()
                  (interactive)
                  (ignore-errors (next-line 5))))

(global-set-key (kbd "C-S-p")
                (lambda ()
                  (interactive)
                  (ignore-errors (previous-line 5))))

(global-set-key (kbd "C-S-f")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-char 5))))

(global-set-key (kbd "C-S-b")
                (lambda ()
                  (interactive)
                  (ignore-errors (backward-char 5))))
