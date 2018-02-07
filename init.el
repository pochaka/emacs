;;; init.el --- Emacs configuration

;;; Commentary:

;;; Code:

;; --------------------------------------
;;  INITIALIZATION
;; --------------------------------------

;; Repos
(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("gnu" . "https://elpa.gnu.org/packages/")
			 ))

;; Activate packages
(package-initialize)

;; Fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; List of my packages
(setq package-list '(elpy
		     py-autopep8
		     flycheck
		     magit
		     org
		     org-agenda-property
		     color-theme-modern ))

;; Install missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; --------------------------------------
;;  BASIC CUSTOMIZATION
;; --------------------------------------

(add-to-list 'default-frame-alist '(width . 105))
(add-to-list 'default-frame-alist '(height . 45))

(setq inhibit-startup-message t
      initial-scratch-message nil)

(load-theme 'railscast t)

(require 'ido)
  (ido-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; --------------------------------------
;;  PYTHON CONFIGURATION
;; --------------------------------------

(add-hook 'python-mode-hook 'elpy-mode)
(add-hook 'after-init-hook 'global-flycheck-mode)
(define-key global-map "\C-xg" 'magit-status)

;; --------------------------------------
;;  ORG-MODE
;; --------------------------------------

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-xq" 'org-agenda-exit)
(setq org-log-done t)

(setq org-agenda-files (list "/home/cittim/Documents/Agenda/work.org"))
;;; init.el ends here
