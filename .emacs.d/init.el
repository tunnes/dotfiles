;;; package --- Summary
;;; Commentary:
(global-set-key (kbd "s-<right>") 'move-end-of-line)
(require 'package)
;;; Code:
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; Projectile ---------------------------------------------------------------------------------------------
;; It is a project interaction library for Emacs. Its goal is to provide a nice set of features operating on
;; a project level without introducing external dependencies.
;; https://github.com/bbatsov/projectile
(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(require 'projectile)
(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
(projectile-mode +1)

(setq projectile-project-search-path '("~/dev/"))

;; Swiper --------------------------------------------------------------------------------------------------
;; An package that enables a autocompletion aka selection box feature on the mini buffer.
;; https://github.com/abo-abo/swiper
(unless (package-installed-p 'counsel)
  (package-install 'counsel))

(ivy-mode 1)

(setq projectile-completion-system 'ivy)

;; Clojure Mode -------------------------------------------------------------------------------------------
;; Enables to work with clojure script language.
;; https://github.com/clojure-emacs/clojure-mode
(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))

;; Cider --------------------------------------------------------------------------------------------------
;; It is a interactive tool to work with nREPL of Clojure.
;; https://github.com/clojure-emacs/cider
(unless (package-installed-p 'cider)
  (package-install 'cider))

;; Markdown -----------------------------------------------------------------------------------------------
;; Enables markdown edition via major mode.
;; https://github.com/jrblevin/markdown-mode
(unless (package-installed-p 'markdown-mode)
  (package-install 'markdown-mode))

;; Rainbow Delimiters -------------------------------------------------------------------------------------
;; It Highlights delimiters such as parentheses, brackets or braces according to their depth, each
;; successive level is highlighted in a different color.
;; https://github.com/Fanael/rainbow-delimiters
(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; LSP Mode -----------------------------------------------------------------------------------------------
;; Notice that to work with Ruby I've need to ensure the installation of solargraph gem to the current
;; version of the project.
;; https://github.com/emacs-lsp/lsp-mode
(unless (package-installed-p 'lsp-mode)
  (package-install 'lsp-mode))

(require 'lsp-mode)

(add-hook 'ruby-mode-hook #'lsp)

;; Hides the breadcrumb on the top of emacs
(setq lsp-headerline-breadcrumb-enable nil)

;; Changing prefix for lsp-mode keybindings.
(setq lsp-keymap-prefix "C-c")

;; Flycheck Mode ------------------------------------------------------------------------------------------
;; Modern on-the-fly syntax checking extension for GNU Emacs.
;; https://github.com/flycheck/flycheck
(unless (package-installed-p 'flycheck)
  (package-install 'flycheck))

(add-hook 'after-init-hook #'global-flycheck-mode)

;; Company Mode -------------------------------------------------------------------------------------------
;; Company is a text completion framework for Emacs. The name stands for "complete anything". It uses
;; pluggable back-ends and front-ends to retrieve and display completion candidates.
;; https://github.com/company-mode/company-mode
(unless (package-installed-p 'company)
  (package-install 'company))

(add-hook 'after-init-hook 'global-company-mode)

;; Inf Ruby -------------------------------------------------------------------------------------------
;; Provides a REPL buffer connected to a Ruby subprocess.
;; https://github.com/nonsequitur/inf-ruby
(unless (package-installed-p 'inf-ruby)
  (package-install 'inf-ruby))

;; RSpec Mode -------------------------------------------------------------------------------------------
;; RSpec mode provides some convenience functions for dealing with RSpec.
;; https://github.com/pezra/rspec-mode
(unless (package-installed-p 'inf-ruby)
  (package-install 'inf-ruby))

(add-hook 'after-init-hook 'inf-ruby-switch-setup)

;; PbCopy Trick/Workaround --------------------------------------------------------------------------------
;; An trick using pbcopy to be able to copy the code from terminal into the OS pasteboard, running emacs on
;; the terminal.
(defun pt-pbcopy ()
  "Copy region to pasteboard."
  (interactive)
  (print (mark))
  (when mark-active
    (shell-command-on-region (point) (mark) "pbcopy")
    (kill-ring-save (point) (mark))
    (keyboard-quit)
    (kill-buffer "Copied!")))

(global-set-key (kbd "M-w") 'pt-pbcopy)

;; Dracula Theme ------------------------------------------------------------------------------------------
;; Enables emacs dracula theme.
;; https://github.com/dracula/emacs
(unless (package-installed-p 'dracula-theme)
  (package-install 'dracula-theme))

(load-theme 'dracula t)

;; Configuration Stuff ------------------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers-width 2)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(git-auto-commit-mode
     git-commit
     git-modes
     dracula-theme
     inf-ruby
     company
     flycheck
     lsp-mode
     rainbow-delimiters
     markdown-mode
     cider
     clojure-mode
     counsel
     projectile)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number ((t (:background "undefined" :foreground "#44475a"))))
 '(line-number-current-line ((t (:background "#474246" :weight ultra-bold))))
 '(mode-line ((t (:background "#44475a")))))

;; Enables the line number:
(global-display-line-numbers-mode)

;; Defines to emacs use the current terminal background color.
(set-face-background 'default "undefined")

;; It sets the comment color.
(set-face-foreground 'font-lock-comment-face "#404a53")
(set-face-foreground 'font-lock-comment-delimiter-face "#404a53")

(setq backup-directory-alist `(("." . "~/.saves")))

(provide 'init)
;;; init.el ends here
