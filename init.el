;;; init.el --- Emacs configuration

;; --------------------------------------
;;  INITIALIZATION
;; --------------------------------------

;; Repos
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; Packages list
(defvar myPackages
  '(elpy                ;; Python IDE
    py-autopep8		;; Python PEP8 compliance
    flycheck            ;; Syntax check
    magit		;; Git integration
    org                 ;;
    org-agenda-property ;;
    material-theme ))   ;;
    

;; Install packages if not exist
(mapc #'(lambda (package)
  (unless (package-installed-p package)
    (package-install package)))
    myPackages)

;; --------------------------------------
;;  BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t)         ;; load material theme
(global-linum-mode t)            ;; enable line numbers globaly

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
(setq org-log-done t)

(setq org-agenda-files (list "/home/cittim/Documents/agenda/network.org"
                             "/home/cittim/Documents/agenda/servers.org"
                             "/home/cittim/Documents/agenda/organisation.org"
                             "/home/cittim/Documents/agenda/other.org"))
;;; init.el ends here
