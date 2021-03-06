(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(tool-bar-mode -1)
(menu-bar-mode -1)
(show-paren-mode 1)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; exec path from shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; company
(add-hook 'after-init-hook #'global-company-mode)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; lsp
(require 'lsp-mode)
(define-key lsp-mode-map (kbd "C-c l") lsp-command-map)

;; elm
(require 'elm-mode)
(add-hook 'elm-mode-hook #'lsp)
(add-to-list 'auto-mode-alist '("\\.elm\\'" . elm-mode))
(setq lsp-elm-elm-language-server-path "~/.nvm/versions/node/v12.18.4/bin/elm-language-server")
(add-hook 'elm-mode-hook #'elm-format-on-save-mode)

;; java
(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp)

;; ivy
(ivy-mode 1)
(global-set-key (kbd "C-s") #'swiper)
(global-set-key (kbd "M-x") #'counsel-M-x)
(global-set-key (kbd "C-x C-f") #'counsel-find-file)

;; projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") #'projectile-command-map)

;; paredit
(add-hook 'scheme-mode-hook #'paredit-mode)
(add-hook 'emacs-lisp-mode-hook #'paredit-mode)

;; clojure
(add-hook 'clojure-mode-hook #'paredit-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elm-format-on-save t)
 '(package-selected-packages
   '(lsp-java projectile flycheck company exec-path-from-shell web-mode prettier paredit magit lsp-mode haskell-mode elm-mode counsel cider)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
