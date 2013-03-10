(defvar root-dir (file-name-directory load-file-name))
(defvar config-dir (concat root-dir "config/"))
(setq custom-file (concat config-dir "custom.el"))
(add-to-list 'load-path config-dir)

(require 'packages)
(require 'gui)
(require 'defuns)
;;;;;;;;;;;;;;;;;
;; Backup stuff;;
(setq make-backup-files t)
(setq version-control t)

(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/.backup")))
(setq backup-directory-alist '((".*" . "~/.emacs.d/.backup")))

(setq delete-old-versions t)

(when (eq system-type 'darwin)
  (require 'osx))

(require 'undo-tree)
(require 'bindings)
