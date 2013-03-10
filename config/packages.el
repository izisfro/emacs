(require 'package)

;;common lisp
(require 'cl)

;; Marmalade
(add-to-list 'package-archives 
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

;; Melpa
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

; Fix for melpa
(setq url-http-attempt-keepalives nil)

(defvar my-packages
  '(molokai-theme monokai-theme
		  auto-complete exec-path-from-shell smex
		  ido-ubiquitous undo-tree
		  n3-mode php-mode scala-mode2))

;;Check if packages are installed
(defun packages-installed-p ()
  (loop for p in my-packages
	when (not (package-installed-p p)) do (return nil)
	finally (return t)))

(defun install-packages ()
  (unless (packages-installed-p)
    (message "%s" "Refreshing packages..")
    (package-refresh-contents)
    (message "%s" "done.")
    (dolist (p my-packages)
      (unless (package-installed-p p)
	(package-install p)))))

(install-packages)
(provide 'packages)
