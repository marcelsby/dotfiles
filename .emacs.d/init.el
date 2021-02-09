;; Install MELPA and configure package manager
(require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Clear init.el
(setq custom-file (concat user-emacs-directory "custom.el")) 

;; Clear interface
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(set-fringe-style 1)
(setq inhibit-startup-screen t) 

;; Improve Interface
(column-number-mode)
(global-display-line-numbers-mode t)
(setq x-select-enable-clipboard t)

;; Font appearance and size settings
(set-face-attribute 'default nil :font "Fira Mono" :height 155)

;; Install and load and configure theme
(use-package doom-themes)
(load-theme 'doom-dracula t)
(setq doom-themes-enable-bold 'nil)

(use-package ivy-hydra)

;; Ivy, a very top package
(use-package ivy
 :diminish
 :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
 :config
 (ivy-mode 1))

;; Improve defaults likes M-x
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)))

;; all-the-icons-package - icons for Doom Modeline
;; First launch: M-x all-the-icons-install-fonts
(use-package all-the-icons)

;; Doom Modeline, thats amazing!
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((Doom-modeline-height 23)))

(use-package all-the-icons)

;; Rainbow Delimiters, kinda of syntax highlighting for delimiters {}, (), [], "", ''
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Which-key shows a minibuffer with all available completions for pressed key combination at the moment
 (use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.7))

;; Show a brief describe of each function when "counsel-M-x" are executed
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;; General package setup
(use-package general)

(general-define-key
 "C-M-k" 'kill-buffer
 "C-M-j" 'counsel-switch-buffer)



;; ;; EVIL - Extensible VI Layer for Emacs
;; ;; C-z toogle mode on and off
;; (use-package evil
;;   (evil-mode 1))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

;; Use visual line motions even outside of visual-line-mode buffers
(evil-global-set-key 'motion "j" 'evil-next-visual-line)
(evil-global-set-key 'motion "k" 'evil-previous-visual-line)

(evil-set-initial-state 'messages-buffer-mode 'normal)
(evil-set-initial-state 'dashboard-mode 'normal))

;; Auto-complete delimiters
(electric-pair-mode 1)
