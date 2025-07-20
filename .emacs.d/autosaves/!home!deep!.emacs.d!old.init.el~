;; ~/.emacs.d/init.el by @Dr.Deep

;; Company for autocompletion
(use-package company
  :config
  (add-hook 'prog-mode-hook 'company-mode)
  )

;;    With autocomplete-mode: go-autocomplete
;;    Standalone completion: go-complete

;; Rainbow delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  )

;; Hydra
(use-package hydra
  :defer t
  )

;; Treemacs
;;(use-package treemacs
;;  :ensure t
;;  :defer t
;;  :hook  (emacs-startup . treemacs)
;;  )

;;(use-package treemacs-nerd-icons
;;  :after treemacs
;;  :config
;;  (treemacs-load-theme "nerd-icons")
;;  )

;; Treemacs Icons
;;(use-package all-the-icons
;;  :if (display-graphic-p)
;;  :config
;;  (setq inhibit-compacting-font-caches t)
;;  )

;;(use-package projectile
;;  :config
;;  (add-hook 'prog-mode-hook 'projectile-mode)
;;  )

;;(use-package treemacs-projectile
;;  :after (treemacs projectile)
;;  :ensure t
;;)

;; Custom Startpage
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner '4)
  )
