;; ~/.emacs.d/init.el
;; Todo: bind: compile

;;
;; Some Settings
;;
(setq
 inhibit-startup-message t ; no motd
 ring-bell-function 'ignore ; Quiet
 scroll-margin 1 ; Space between cursor and top/bottom
 initial-scratch-message nil ; clean scratch buf
 create-lockfiles nil ; Disable lockfiles
 echo-keystrokes 0.1 ; Show keystrokes asap
 auto-revert-interval 1 ; Refresh buffers fast
 )

;; (desktop-save-mode)

(scroll-bar-mode -1) ; scrollbar
(tool-bar-mode -1) ; toolbar
(menu-bar-mode -1) ; menubar
(blink-cursor-mode 0) ; solid cursor

(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(setq-default
 tab-width 4 ; smaller tabs
 truncate-lines t ; dont fold lines
 indent-tabs-mode nil ; spaces instead of tabs
 frame-resize-pixelwise t ; Fine-grained frame resize
 sentence-end-double-space nil ; No double space
 )

;; Line Nums
(column-number-mode)
(global-display-line-numbers-mode t)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; disable line-numbers for some modes
(dolist (mode '(org-mode-hook
              term-mode-hook
              shell-mode-hook
              treemacs-mode-hook
              eshell-mode-hook
              neotree-mode-hook
              ))
  (add-hook mode (lambda () (display-line-numbers-mode 0)
                   )))
;; ??
(transient-mark-mode 1) ; No Region when it is not highlighted

;; autosave Directory
(defvar emacs-autosave-directory
  (concat user-emacs-directory "autosaves/")
  "This variable dictates where to put auto saves. It is set to a
  directory called autosaves located wherever your .emacs.d/ is
  located.")

(setq
 backup-directory-alist
 `((".*" . ,emacs-autosave-directory))
 auto-save-file-name-transforms
 `((".*" ,emacs-autosave-directory t))
 )


;;
;; Key Settings
;;
(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ; ESC quit
(cua-mode t) ; Copy & Paste & Cut Key-Bindings
(global-set-key (kbd "C-a") 'mark-whole-buffer) ; CTRL-A mark Buffer


;;
;; Package Management
;;
(setq package-archives
      '(
	("GNU ELPA" . "https://elpa.gnu.org/packages/")
	("MELPA STABLE" . "https://stable.melpa.org/packages/")
	("MELPA" . "https://melpa.org/packages/")
	)
      )
(setq package-archive-priorities
      '(
	("GNU ELPA" . 10)
	("MELPA" . 5)
	("MELPA STABLE" . 0)
	)
      )
(require 'package )
(require 'use-package)
(setq use-package-always-ensure t)
(unless (fboundp 'package-activate-all) (package-initialize))
(if package-archive-contents nil
  (package-refresh-contents)
  )


;;
;; Theme
;;

;; Transparency
(set-face-attribute 'default nil :height 100)
(set-frame-parameter nil 'alpha-background 90)

(use-package modus-themes
  :ensure t
  :init
  (require-theme 'modus-themes)

  :custom
  (modus-themes-italic-constructs t)
  (modus-themes-bold-constructs t)
  (modus-themes-mixed-fonts t)
  (modus-themes-variable-pitch-ui t)
  (modus-themes-custom-auto-reload t)
  (modus-themes-disable-other-themes t)
  (modus-themes-prompts '(italic bold))
  (modus-themes-completions
   '((matches . (extrabold))
     (selection . (semibold italic text-also))))

  (modus-themes-org-blocks 'gray-background)

  (modus-themes-headings
   '((1 . (variable-pitch 1.5))
     (2 . (1.3))
     (agenda-date . (1.3))
     (agenda-structure . (variable-pitch light 1.8))
     (t . (1.1))))


  (modus-vivendi-palette-overrides
   '(

     (bg-main     "#000000")
     (bg-dim      "#111111")
     (bg-active   "#222222")
     (bg-inactive "#333333")

     (fg-main     "#ffffff")
     (fg-dim      )

     (cursor      "#00ffff")
     (warning     "#fafad2")

     (bg-completion "#2e8b57")
     (bg-region     bg-active)
     (bg-tab-bar        bg-main)
     (bg-tab-current    bg-active)
     (bg-tab-other      bg-dim)
     (fringe unspecified)
     (bg-mode-line-active bg-dim)
     (border-mode-line-active unspecified)
     (bg-line-number-active  bg-main)
     (bg-line-number-inactive  bg-main)
     ))

  :config
  (load-theme 'modus-vivendi t)
  )

;; Font: Fira Code
(use-package ligature
  :ensure t
  :config
  (ligature-set-ligatures 't '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                     ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                     "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                     "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                     "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                     "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                     "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                     "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                     "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                     "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))
  (global-ligature-mode 't)
  (set-face-attribute 'default nil :font "Fira Code")
  )

;; Icons
(use-package nerd-icons
  :ensure t
  :custom
  (nerd-icons-font-family "Symbols Nerd Font Mono")
  )


;;(use-package nano-modeline
;;  :init
;;  (setq-default mode-line-format nil) ; Disable the default modeline

;;  :config
;;  (add-hook 'prog-mode-hook            #'nano-modeline-prog-mode)
;;  (add-hook 'text-mode-hook            #'nano-modeline-text-mode)
;;  )

;;(setq nano-font-family-monospaced "Roboto Mono")
;;(setq nano-font-size 14)


;;
;; Modes
;;

;; LSP
(use-package eglot
  :ensure t
  :defer t
  :hook (eglot-managed-mode . (lambda ()
                                ;;(eglot-inlay-hints-mode -1)
                                (add-hook 'before-save-hook 'eglot-format nil t)))
  :config
  (setq eglot-events-buffer-size 0)
  (add-hook 'prog-mode-hook 'eglot-ensure)
  )

;; auto-completion
(use-package company
  :ensure t
  :config
  (global-company-mode)
  ;; bind: tab => (company-complete)
  )

;; Markdown
(use-package markdown-mode
  :ensure t
  :defer t
  :hook (markdown-mode . (lambda () (setq fill-column 72)))
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  )

;; JSON
(use-package json-mode
  :ensure t
  :mode
    ("\\.json$" . json-mode)
    ("\\.jsonc$" . json-mode)
  )

;; Golang
(use-package go-mode
  :ensure t
  :defer t
  :mode "\\.go\\'"
  :hook (go-mode . eglot-ensure)
  :config
  (autoload 'go-mode "go-mode" nil t)
  (add-hook 'before-save-hook 'eglot-format-buffer)
  ;;:bind
  ;; ("C-c C-c" . ) ;; => go build/run .
  )

;; Python
(use-package python-mode
  :ensure t
  :hook (python-mode . (lambda () (setq forward-sexp-function nil)))
  :config
  (setq python-shell-interpreter "python3.11")
  )

;; Parethses
;;(use-package paredit
;;  :defer t
;;  :bind (:map paredit-mode-map ("RET" . nil))
;;  :hook ((
;;          lisp-mode
;;          emacs-lisp-mode
;;          lisp-interaction-mode
;;          scheme-mode)
;;         . paredit-mode)
;;  :config
;;  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
;;  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
;;  )


;;
;; Plugins
;;

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; Dashboard
(defun my/dashboard-banner ()
  """Set a dashboard banner including information on package initialization
   time and garbage collections."""
  (setq dashboard-banner-logo-title
        (format "Loaded in %.2f seconds with %d garbage collections."
                (float-time (time-subtract after-init-time before-init-time)) gcs-done)
	)
  )

(use-package dashboard
  :ensure t
  :init
  (add-hook 'after-init-hook 'dashboard-refresh-buffer)
  (add-hook 'dashboard-mode-hook 'my/dashboard-banner)
  
  :config
  (setq dashboard-startup-banner 4) ; banner
  (setq dashboard-center-content t) ; center content

  (setq dashboard-items '((recents   . 5)
                        (bookmarks . 5)
                        (projects  . 5)))

  ;; nerd-icons
  (setq dashboard-display-icons-p t)     ; display icons on both GUI and terminal
  (setq dashboard-icon-type 'nerd-icons) ; use `nerd-icons' package

  (setq dashboard-startupify-list '(dashboard-insert-banner
                                    dashboard-insert-newline
				    dashboard-insert-footer
				    dashboard-insert-banner-title
				    dashboard-insert-navigator
				    dashboard-insert-items
				    dashboard-insert-newline
				    )
	)
  (dashboard-setup-startup-hook)
  )

;; Ivy completion
(use-package counsel
  :ensure t
  :config
  (counsel-mode)
  )

(use-package ivy
  :ensure t
  :config
  (ivy-mode)
  (setopt ivy-use-virtual-buffers t)
  (setopt enable-recursive-minibuffers t)
  (setopt ivy-use-selectable-prompt t)
  ;; Enable this if you want `swiper' to use it:
  ;; (setopt search-default-mode #'char-fold-to-regexp)
  (keymap-global-set "C-s" #'swiper-isearch)
  (keymap-global-set "C-c C-r" #'ivy-resume)
  (keymap-global-set "<f6>" #'ivy-resume)
  (keymap-global-set "M-x" #'counsel-M-x)
  (keymap-global-set "C-x C-f" #'counsel-find-file)
  (keymap-global-set "<f1> f" #'counsel-describe-function)
  (keymap-global-set "<f1> v" #'counsel-describe-variable)
  (keymap-global-set "<f1> o" #'counsel-describe-symbol)
  (keymap-global-set "<f1> l" #'counsel-find-library)
  (keymap-global-set "<f2> i" #'counsel-info-lookup-symbol)
  (keymap-global-set "<f2> u" #'counsel-unicode-char)
  (keymap-global-set "C-c g" #'counsel-git)
  (keymap-global-set "C-c j" #'counsel-git-grep)
  (keymap-global-set "C-c k" #'counsel-ag)
  (keymap-global-set "C-x l" #'counsel-locate)
  (keymap-global-set "C-S-o" #'counsel-rhythmbox)
  (keymap-set minibuffer-local-map "C-r" #'counsel-minibuffer-history)
  )

;; Magit
(use-package magit
  :ensure t
  )


;; NeoTree
;;(use-package neotree
;;  :config
;;  (neotree-dir "~/Workspace")
;;  (setq neo-theme (if (display-graphic-p) 'nerd-icons 'classic))
;;  (setq projectile-switch-project-action 'neotree-projectile-action)
;;  )

;; Projectile
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :hook  (emacs-startup . treemacs)
  :config
  (progn
    (setq treemacs-display-in-side-window          t

          treemacs-follow-after-init               t
          treemacs-expand-after-init               t

          treemacs-hide-dot-git-directory          t
          
          treemacs-indentation                     2
          treemacs-indentation-string              " "

          treemacs-is-never-other-window           nil

          treemacs-move-files-by-mouse-dragging    t

          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)

          treemacs-position                        'left

          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")

          treemacs-show-cursor                     nil

          treemacs-show-hidden-files               t

          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t

          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t

          treemacs-workspace-switch-cleanup        nil
          )

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    ;; treemacs,treemacs-select-window, treemacs-add-and-display-current-project
    ;; treemacs-indent-guide-mode;;  = line
 
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (treemacs-git-mode 'deferred)
    ;; (treemacs-hide-gitignored-files-mode nil)) ??
    )

    :bind (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)
        )
    )

(use-package treemacs-nerd-icons
  :ensure t
  :after treemacs
  :config
  (treemacs-load-theme "nerd-icons")
  )
  
(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t
  )

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t
  )

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  :bind
  ("C-c p" . projectile-command-map)
  )

;; ?
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode)
  )

(use-package rainbow-identifiers
  :ensure t
  :hook (prog-mode . rainbow-identifiers-mode)
  )

;; Helpful Hydra
(use-package hydra
  :ensure t
  :defer t
  )

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1)
  )

;; Display available keybindings in popup
(use-package which-key
  :ensure t
  :config
  (which-key-mode 1)
  )

;; Terminal via libvterm
(use-package vterm
  :ensure t
  )

;; END OF FILE
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("de8f2d8b64627535871495d6fe65b7d0070c4a1eb51550ce258cd240ff9394b0" default))
 '(package-selected-packages '(nano-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
