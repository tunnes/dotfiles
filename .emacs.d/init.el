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

;; Clojure mode ----------------------------------------------------------------------------
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers-width 2)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages (quote (clojure-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number-current-line ((t (:weight extra-bold)))))

;; Enables the line number:
(global-display-line-numbers-mode)

;; TODO TABS
;; (global-set-key (kbd "TAB") 'self-insert-command)
;; https://www.emacswiki.org/emacs/IndentationBasics

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
    (kill-buffer "Copied!")))

(global-set-key [?\C-x ?\C-y] 'pt-pbpaste)
(global-set-key [?\M-w] 'pt-pbcopy)
