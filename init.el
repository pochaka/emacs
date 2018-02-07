;;; init.el --- Emacs configuration

;;; Commentary:

;;; Code:

;; --------------------------------------
;;  INITIALIZATION
;; --------------------------------------

(add-to-list 'default-frame-alist '(width . 105))
(add-to-list 'default-frame-alist '(height . 45))

(setq inhibit-startup-message t
      initial-scratch-message nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; ---------------------------------------
;;  PACKAGES
;; ---------------------------------------

(require 'package)
(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("gnu" . "https://elpa.gnu.org/packages/")
			 ))

(package-initialize)

(defun package-install-if-not (package)
  "Install PACKAGE if it's not installed yet."
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

(package-install-if-not 'use-package)

(setq package-enable-at-startup nil)

(eval-when-compile
  (require 'use-package))
(put 'use-package 'lisp-indent-function 1)
(setq use-package-always-ensure t)

(use-package org
  :init
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (define-key global-map "\C-xq" 'org-agenda-exit)
  (setq org-log-done t)
  (setq org-agenda-files (list "/home/cittim/Documents/Agenda/work.org")))

<<<<<<< HEAD
(use-package org-agenda-property)
=======
(require 'ido)
  (ido-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; --------------------------------------
;;  PYTHON CONFIGURATION
;; --------------------------------------
>>>>>>> 54c60e9... garbage cleaning

(use-package magit
  :init
  (define-key global-map "\C-xg" 'magit-status))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

(use-package py-autopep8)

(use-package elpy
  :init
  (add-hook 'python-mode-hook 'elpy-mode)
  (add-hook 'after-init-hook 'flycheck-mode))

(use-package color-theme-modern
  :init
  (load-theme 'railscast t))

(use-package ido
  :config
  (ido-mode t))

(use-package powerline
  :init
  (powerline-default-theme))


;;; init.el ends here
