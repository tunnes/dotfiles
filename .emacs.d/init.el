(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; Clojure mode
;; Enables to work with clojure script language
;; https://github.com/clojure-emacs/clojure-mode
(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))

;; Cider
;; It is a interactive tool to work with nREPL of Clojure
;; https://github.com/clojure-emacs/cider
(unless (package-installed-p 'cider)
  (package-install 'cider))

(custom-set-variables
 ;; Default charactere space of line numbers bar:
 '(display-line-numbers-width 2)

 ;; Enables line number:
 '(global-display-line-numbers-mode t)

 ;; Enable code hightlight to Clojure Script:
 '(package-selected-packages (quote (clojure-mode))))

(custom-set-faces
 ;; Customization of current line on line numbers bar:
 '(line-number-current-line ((t (:weight extra-bold)))))

;; Enables the line number:
(global-display-line-numbers-mode)