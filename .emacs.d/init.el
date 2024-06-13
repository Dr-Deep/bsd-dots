;; ~/.emacs.d/init.el by @Dr.Deep

;; Visuelles Zeug
(setq inhibit-startup-message t) ; keine startup-mesg
(set-fringe-mode 10)  ; raum
(setq visible-bell t) ; sichtbare warnung
(scroll-bar-mode -1)  ; keine scrollbar
(menu-bar-mode -1)    ; disable menubar
(tool-bar-mode -1)    ; disable Toolbar


;; Line-Numbers
(column-number-mode)
(global-display-line-numbers-mode t)

;; disable line-numbers for some modes
(dolist (mode '(org-mode-hook
	      term-mode-hook
	      shell-mode-hook
	      treemacs-mode-hook
	      eshell-mode-hook)
	      )
  (add-hook mode (lambda () (display-line-numbers-mode 0)
		   )))

;; Copy & Paste & Cut Key-Bindings
(cua-mode t)
(transient-mark-mode 1) ;; No region when it is not highlighted

;; <ESC> quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Transparency
(defvar efs/frame-transparency '(90 . 90))
(set-frame-parameter (selected-frame) 'alpha efs/frame-transparency)
(add-to-list 'default-frame-alist '(alpha . ,efs/frame-transparency))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen .maximized))

;; Font
;;(set-face-attribute 'default nil :font "Fira Code")

;;
;; Package Sources
;;
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa")
			 ("elpa" . "https://elpa.gnu.org/packages/")
			 ))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; initialize use-package on non-linux
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


;; Straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;
;; END PACKAGE SOURCES END
;;

(use-package eglot
  :hook ((go-mode . eglot-ensure))
  )

(use-package rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(use-package hydra
  :defer t
  )

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

;; Theme
;;(use-package flatland-black-theme)
;;(use-package kosmos-theme)
;;(load-theme 'kosmos-theme)
(use-package doom-themes
  :config
  (load-theme 'doom-acario-dark t)

  ;; Buffer background
  (set-background-color "#000000")

  ;; Modeline
  (face-remap-add-relative 'mode-line :background "#0D0D0D")

  ;; Line-Numbers
  )

;;  (line-number              (:foreground gruvbox-dark2 :background gruvbox-dark0))
;;  (line-number-current-line (:foreground gruvbox-faded_yellow :background gruvbox-dark0_soft))


;; Doom modeline
(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 15)
  )


(use-package fira-code-mode
  :config (global-fira-code-mode)
  )












;; ENDE GELÄNDE
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5ec088e25ddfcfe37b6ae7712c9cb37fd283ea5df7ac609d007cafa27dab6c64" "d43860349c9f7a5b96a090ecf5f698ff23a8eb49cd1e5c8a83bb2068f24ea563" "a67b6cb65db241e033b6aed5eeaf0805a1b62e598cedc605c71d003a1d5c00c6" "405e3c03af0df3a7d25b18e2762dfe343d60ae4632e0f4075494782c469445eb" "469226ef4cbecc9ab9733aaa8b0a5e53b2974f789cc450b519da3484cdc1e682" "85dfc58d150f35da8c788e04b21e282e45dc09c8ace7ff669c3c7b5a35f95afc" "9d5124bef86c2348d7d4774ca384ae7b6027ff7f6eb3c401378e298ce605f83a" "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" default))
 '(package-selected-packages
   '(rainbow-delimiters kosmos-theme flatland-black-theme flatland-black eglot hydra all-the-icons doom-modeline ivy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
