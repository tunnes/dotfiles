(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; Projectile ------------------------------------------------------------------------------
;; An package to enable projec navitation
;; https://github.com/bbatsov/projectile
(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(require 'projectile)
(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

(setq projectile-project-search-path '("~/dev/"))

;; Counsel
;; [WIP] https://github.com/abo-abo/swiper#ivy
;; An package that makes more visual nice the mini buffer interactions
(unless (package-installed-p 'counsel)
  (package-install 'counsel))

(ivy-mode 1)

(setq projectile-completion-system 'ivy)

;; Clojure mode

;; Enables to work with clojure script language
;; https://github.com/clojure-emacs/clojure-mode
(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))

;; Cider -----------------------------------------------------------------------------------
;; It is a interactive tool to work with nREPL of Clojure
;; https://github.com/clojure-emacs/cider
(unless (package-installed-p 'cider)
  (package-install 'cider))

;; Markdown --------------------------------------------------------------------------------
;; Enables markdown edition via major mode
;; https://github.com/jrblevin/markdown-mode
(unless (package-installed-p 'markdown-mode)
  (package-install 'markdown-mode))

;; Dracula Theme  --------------------------------------------------------------------------------
;; Enables emacs dracula theme
;; https://github.com/dracula/emacs/tree/e5cbc350f49a30ad78a84e68b4e1682d018c9b7f
(unless (package-installed-p 'dracula-theme)
  (package-install 'dracula-theme))

(load-theme 'dracula t)


;; Clojure Refactor ---------------------------------------------------------------------------
(unless (package-installed-p 'clj-refactor)
  (package-install 'clj-refactor))

(require 'clj-refactor)

(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

;; Rainbow-delimiters ----------------------------------------------------------------------------------------------

(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; ----------------------------------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers-width 2)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages (quote (plantuml-mode clojure-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number ((t (:background "#262626" :foreground "white" :slant italic))))
 '(line-number-current-line ((t (:background "color-234" :weight ultra-bold))))
 '(mode-line ((t (:background "#767676")))))

;; Enables the line number:
(global-display-line-numbers-mode)


(defun pt-pbpaste ()
  "Paste data from pasteboard."
  (interactive)
  (shell-command-on-region
   (point)
   (if mark-active (mark) (point))
   "pbpaste" nil t))

(defun pt-pbcopy ()
  "Copy region to pasteboard."
  (interactive)
  (print (mark))
  (when mark-active
    (shell-command-on-region
     (point) (mark) "pbcopy")
     (kill-ring-save (point) (mark))
     (keyboard-quit)
     (kill-buffer "Copied!")
     ))

(global-set-key [?\C-x ?\C-y] 'pt-pbpaste)
(global-set-key [?\M-w] 'pt-pbcopy)

(setq backup-directory-alist `(("." . "~/.saves")))


;; Multiple cursor package ====================================
;; An package to add multiple cursor mode to emacs
;; https://github.com/magnars/multiple-cursors.el
(unless (package-installed-p 'multiple-cursors)
  (package-install 'multiple-cursors))

(require 'multiple-cursors)


(setq mac-command-modifier 'super)

(defun seila ()
  (kill-buffer "Seila!"))

;(global-set-key [?\C-S-b] 'seila)
 
(global-set-key (kbd "C-q") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

