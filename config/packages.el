(require 'package)

;;common lisp
(require 'cl)

;; Melpa
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

; Fix for melpa
(setq url-http-attempt-keepalives nil)

(defvar my-packages
  '(monokai-pro-theme molokai-theme
		  auto-complete exec-path-from-shell smex
		   undo-tree
		  php-mode ))

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
