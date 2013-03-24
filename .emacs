;; Color themes
;; (dark)
(defun color-theme-timmy()
  (interactive)
  (color-theme-install
   '(color-theme-timmy
     ((background-color . "#111111")
      (background-mode . light)
      (border-color . "#3b3a3a")
      (cursor-color . "#d0cdcd")
      (foreground-color . "#fafafa")
      (mouse-color . "black"))
     (fringe ((t (:background "#3b3a3a"))))
     (mode-line ((t (:foreground "#2f2d2d" :background "#919290"))))
     (region ((t (:background "#7d7d7d"))))

     (font-lock-builtin-face ((t (:foreground "#ff5757"))))
     (font-lock-comment-face ((t (:foreground "#9bdf9d"))))
     (font-lock-function-name-face ((t (:foreground "#7c9ffe"))))
     (font-lock-keyword-face ((t (:foreground "#ff94d4"))))
     (font-lock-string-face ((t (:foreground "#f09f70"))))
     (font-lock-type-face ((t (:foreground "#50a2e7"))))
     (font-lock-variable-name-face ((t (:foreground "#07909a"))))
     (font-lock-constant-face ((t (:foreground "salmon"))))
     (font-lock-doc-face ((t (:foreground "orange"))))
     (font-lock-negation-char-face ((t (nil))))
     (font-lock-preprocessor-face ((t (:foreground "LightSteelBlue"))))
     (font-lock-regexp-grouping-backslash ((t (:bold t :weight bold))))
     (font-lock-regexp-grouping-construct ((t (:bold t :weight bold))))

		 ;; Magit Colors
     (magit-diff-add ((t (:foreground "green2" :background "#222222"))))
     (magit-diff-del ((t (:foreground "red2" :background "#222222"))))
     (magit-diff-file-header ((t (:background "#222222"))))
		 (magit-diff-hunk-header ((t (:background "#222222"))))
		 (magit-item-highlight ((t (:background "#222222"))))

     (minibuffer-prompt ((t (:foreground "#329efb" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     (yas/field-highlight-face ((t (:background "DimGrey"))))
     )))
(provide 'color-theme-timmy)

;; (light)
(defun color-theme-timmy-light ()
  (interactive)
  (color-theme-install
   '(color-theme-timmy-light
		 ((background-color . "#ffffff")
      (background-mode . light)
      (border-color . "#7a7a7a")
      (cursor-color . "#191919")
      (foreground-color . "#000000")
      (mouse-color . "black"))
     (fringe ((t (:background "#7a7a7a"))))
     (mode-line ((t (:foreground "#000000" :background "#cccccc"))))
     (region ((t (:background "#c0c0c0"))))
     (font-lock-builtin-face ((t (:foreground "#994500"))))
     (font-lock-comment-face ((t (:foreground "#007400"))))
     (font-lock-function-name-face ((t (:foreground "#0037c8"))))
     (font-lock-keyword-face ((t (:foreground "#aa0d91"))))
     (font-lock-string-face ((t (:foreground "#c41a16"))))
     (font-lock-type-face ((t (:foreground"#0000ee"))))
     (font-lock-variable-name-face ((t (:foreground "#4e8087"))))
     (minibuffer-prompt ((t (:foreground "#2533da" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))
(provide 'color-theme-timmy-light)

(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
(require 'color-theme)
(eval-after-load "color-theme"
	'(progn
		 (color-theme-initialize)
		 (color-theme-timmy)))

;; Place autosaves in one directory
(setq backup-directory-alist
			`((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
			`((".*" ,temporary-file-directory t)))

;; Set default tabs
(global-set-key (kbd "TAB") 'indent-relative-maybe)
(setq default-tab-width 2)
(setq tab-stop-list '(2 4 6 8 10 12 14 16 18 20 22 24))
(setq js-indent-level 2)

;; Turn off the emacs bell completely
(setq ring-bell-function 'ignore)

;; Paren Matching
(show-paren-mode 1)
(put 'downcase-region 'disabled nil)

;; Set key for deleting a region
(global-set-key (kbd "C-x C-d") 'delete-region)
(put 'upcase-region 'disabled nil)

;; Open files from the finder in an existing frame
(setq-default ns-pop-up-frames nil)

;; Save desktop sessions when closing
;; (desktop-save-mode t)

;; Line numbers
(global-linum-mode t)
(column-number-mode t)

;; More colors
(global-font-lock-mode t)

;; GOTO Line command
(global-set-key "\M-g" `goto-line)

;; Align equal signs
(global-set-key (kbd "C-=") 'align-regexp)

;; Delete key
(global-set-key [delete] 'delete-char)
(global-set-key [M-delete] 'kill-word)

;; Comment region
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; No Word Wrap/Transient Mark
(setq-default truncate-lines t)
(setq transient-mark-mode t)
(setq mac-option-modifier 'meta)

;; Add .emacs.d/plugins to load path for extra modes
(add-to-list 'load-path "~/.emacs.d/plugins")

;; Enable overwrite mode
;; (overwrite-mode 1)

;; Custom utilities for emacs lisp
(require 'utility)

;; Show whitespace
(require 'whitespace)

;; Open recent file
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Magit
(add-to-list 'load-path "~/.emacs.d/plugins/magit")
(require 'magit)

;; Org mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Use hippie expand
(global-set-key (kbd "M-/") 'hippie-expand)


;;; Modes

;; For the sake of flymake (copy appropriate bin directories here)
(setq exec-path
			'(
				"/usr/local/bin"
				"/usr/bin"
				"/bin"
				"/usr/local/git/bin"
				"/usr/local/share/npm/bin"
				"/Library/PostgreSQL/9.1/bin"
				"/Users/timmy/.rbenv/bin"
				))

;; Add nodepath to environment for node modules
(setenv "NODE_PATH" "/usr/local/lib/node:/usr/local/lib/node_modules")

;; JSHint Mode
(add-to-list 'load-path "~/.emacs.d/plugins/jshint-mode")
(require 'flymake-jshint)
(add-hook 'javascript-mode-hook
					(lambda () (flymake-mode t)))

;; Turns on flymake for all files which have a flymake mode
(add-hook 'find-file-hook 'flymake-find-file-hook)

;; Javascript (js2)  Mode
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (setq js2-mode-escape-quotes nil)
;; (autoload 'js2-mode "js2" nil t)

;; CSS Mode
;; C-c C-u => css-insert-url
;; C-c C-c => css-insert-comment
;; C-c TAB => TAB completion
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(autoload 'css-mode "css-mode" nil t)

;; HAML Mode
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(autoload 'haml-mode "haml-mode" nil t)
(add-hook 'haml-mode-hook
					'(lambda ()
						 (setq haml-indent-offset 2)))

;; Markdown Mode
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(autoload 'markdown-mode "markdown-mode" "Markdown!" t)

;; Tidy for HTML Mode
(autoload 'tidy-buffer "tidy" "Run Tidy HTML parser on current buffer" t)
(autoload 'tidy-parse-config-file "tidy" "Parse the `tidy-config-file'" t)
(autoload 'tidy-save-settings "tidy" "Save settings to `tidy-config-file'" t)
(autoload 'tidy-build-menu  "tidy" "Install an options menu for HTML Tidy." t)

;; Tabs in HTML Mode
(add-hook 'html-mode-hook
					(lambda ()
						(setq sgml-basic-offset 2)
						(setq indent-tabs-mode nil)
						(tidy-build-menu html-mode-map)
						(local-set-key (kbd "C-x t") 'tidy-buffer)
						(setq sgml-validate-command "tidy")))

;; HTML Helper Mode
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(add-hook 'html-helper-load-hook '(lambda () (require 'html-font)))
(setq html-helper-never-indent t)

;; PHP Mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;;; End Modes

;; YASnippets
(add-to-list 'load-path
						 "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(setq yas/root-directory "~/.emacs.d/plugins/mysnippets/")
(yas/load-directory yas/root-directory)

;; Load snippets
(setq yas-snippet-dirs
			'("~/.emacs.d/plugins/mysnippets"  ;; personal snippets
				))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(ecb-auto-update-methods-after-save t)
 '(ecb-expand-methods-switch-off-auto-expand t)
 '(face-font-family-alternatives (quote (("Menlo" "Monospace" "courier" "fixed") ("courier" "CMU Typewriter Text" "fixed") ("Sans Serif" "helv" "helvetica" "arial" "fixed") ("helv" "helvetica" "arial" "fixed"))))
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(text-mode-hook (quote (text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(whitespace-space (quote whitespace-space)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#111111" :foreground "#fafafa" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Monaco"))))
 '(cursor ((t (:background "gray80"))))
 '(highlight ((t (:background "SkyBlue3"))))
 '(lazy-highlight ((t (:background "dark cyan"))))
 '(magit-log-graph ((t (:background "gray18" :foreground "white")))))
(put 'scroll-left 'disabled nil)
