(require 'cc-mode)

(setq backup-directory-alist `(("." . "~/.saves")))
(setq make-backup-files nil)


(condition-case nil
    (require 'use-package)
  (file-error
   (require 'package)
   (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
   (package-initialize)
   (package-refresh-contents)
   (package-install 'use-package)
   (require 'use-package)))

(use-package swiper :ensure t)
(use-package counsel :ensure t)
(use-package ivy :ensure t)


(use-package magit
  :ensure t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
(setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-completion-system 'ivy)
  )

(projectile-global-mode +1)
(setq projectile-enable-caching t)


(use-package counsel-projectile
  :bind (("s-t" . counsel-projectile-find-file)
         ("s-o" . counsel-projectile-find-file)
         ("C-M-t" . jack-counsel-projectile-find-file-clear-cache)
         ("C-t" . counsel-projectile-find-file)
         :map dired-mode-map
         ("C-t" . counsel-projectile-find-file))
  :ensure)

(use-package yasnippet :ensure t)
(use-package lsp-mode :ensure t)
(use-package hydra :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-doc-enable nil
        lsp-ui-sideline-enable nil
        lsp-ui-flycheck-enable t)
  :after lsp-mode
  )

(use-package google-c-style
  :ensure t
  :after lsp-mode
  (google-c-style)
  )

(use-package lsp-java
  :ensure t
  :after lsp
  :config
  (add-hook 'java-mode-hook 'lsp)
  )

(use-package dap-mode
  :ensure t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package company-tabnine :ensure t)

(add-to-list 'company-backends #'company-tabnine)


(use-package dap-java :after (lsp-java))

(use-package htmlize
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "UTF-8")
 '(lsp-java-jdt-download-url
   "https://mirrors.tuna.tsinghua.edu.cn/eclipse/jdtls/snapshots/jdt-language-server-latest.tar.gz")
 '(org-agenda-files (quote ("d:/work/org/dailywork.org/index.org")))
 '(package-selected-packages
   (quote
    (mark-thing-at restclient counsel-projectile rg dumb-jump verb kotlin-mode kotlin zenburn-theme zenburn monokai-theme monokai cider google-c-style magit htmlize htmlize: company-tabnine counsel swiper yasnippet use-package projectile lsp-ui lsp-java dap-mode company-lsp)))
 '(safe-local-variable-values (quote ((flycheck-disabled-checkers emacs-lisp-checkdoc))))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'org-agenda)
(setq org-agenda-files (quote ("d:/work/org/dailywork.org/")))
(global-set-key (kbd "<f12>") 'org-agenda)

(add-to-list 'exec-path "F:/tools/curl-7.66.0-win64-mingw/bin/")
(defun dploy()
  "hhh"
    (interactive)
    (call-process "curl.exe" nil 0 nil "--insecure --user vsl:123..com -T D:\\work\\git\\extremevision-trace_jvm_back\\target\\reid-1.2.1-SNAPSHOT.jar sftp://192.168.9.34/tmp/reid_jinan.jar" ))


(use-package cider
  :ensure t)

(use-package zenburn-theme
  :ensure t)

;;(setq tramp-default-method "plink")

;;(use-package kotlin-mode
;;  :ensure t)

(use-package verb
  :ensure t)


(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g b" . dumb-jump-back)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :ensure t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((plantuml . t)))

(setq org-plantuml-jar-path "F:/tools/emacs/emacs-26.3-x86_64/bin/plantuml.jar")



(use-package restclient
  :ensure t)

(use-package mark-thing-at
  :ensure t
  :config
  (setq mark-thing-at-make-keybindings "\C-xn"))
