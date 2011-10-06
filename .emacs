;; Place autosaves in one directory
(setq backup-directory-alist
	  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
	  `((".*" ,temporary-file-directory t)))

;; Open files from the finder in an existing frame
(setq-default ns-pop-up-frames nil)

;; Save desktop sessions when closing
(desktop-save-mode t)

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

;; Open recent file
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Add .emacs.d/plugins to load path for extra modes
(add-to-list 'load-path "~/.emacs.d/plugins")

;; Autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/ac-dict")
(ac-config-default)
(define-key ac-complete-mode-map [(shift tab)] 'ac-complete)
(define-key ac-complete-mode-map "\t" nil)
(define-key ac-complete-mode-map "\r" nil)

;; Shift+T file browser
(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(require 'textmate)
(add-to-list 'load-path "~/.emacs.d/vendor")
(require 'peepopen)
(textmate-mode)

;; tabbar
(add-to-list 'load-path "~/.emacs.d/plugins/tabbar")
(require 'tabbar)
(tabbar-mode 1)
(global-set-key (kbd "s-{") 'tabbar-backward)
(global-set-key (kbd "s-}") 'tabbar-forward)
(global-set-key (kbd "s-[") 'tabbar-backward-group)
(global-set-key (kbd "s-]") 'tabbar-forward-group)
;; Only show non-scratch buffers
(setq tabbar-buffer-groups-function
           (lambda ()
             (list "All Buffers")))
 (setq tabbar-buffer-list-function
     	(lambda ()
     	  (remove-if
     	   (lambda(buffer)
     	     (find (aref (buffer-name buffer) 0) " *"))
     	   (buffer-list))))

;; Enable overwrite mode
;; (overwrite-mode 1)


;;; Modes

;; Javascript Mode
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(autoload 'js2-mode "js2" nil t)
(setq js2-mode-escape-quotes nil)

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
			 (setq haml-indent-offset 4)
			 (setq indent-tabs-mode t)))

;; Markdown Mode
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(autoload 'markdown-mode "markdown-mode" "Markdown!" t)

;; Tabs in HTML Mode
(add-hook 'html-mode-hook
		  (lambda ()
			(setq sgml-basic-offset 4)
			(setq indent-tabs-mode t)))

;; HTML Helper Mode
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(add-hook 'html-helper-load-hook '(lambda () (require 'html-font)))
(setq html-helper-never-indent t)e

;;; End Modes

;; YASnippets
(require 'yasnippet-bundle)
(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt
							 yas/ido-prompt
							 yas/completing-prompt))


;; Load development snippets
(setq yas/root-directory "~/.emacs.d/plugins/mysnippets/")
(yas/load-directory yas/root-directory)

;; Set default tabs
(global-set-key (kbd "TAB") 'indent-relative-maybe)
(setq default-tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24))

;; Paren Matching
(show-paren-mode 1)
(put 'downcase-region 'disabled nil)

;; Set key for deleting a region
(global-set-key (kbd "C-x C-d") 'delete-region)
(put 'upcase-region 'disabled nil)

;; Color theme
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
	 (font-lock-variable-name-face ((t (:foreground "#d287f7"))))

     (font-lock-constant-face ((t (:foreground "salmon"))))
     (font-lock-doc-face ((t (:foreground "orange"))))
     (font-lock-negation-char-face ((t (nil))))
     (font-lock-preprocessor-face ((t (:foreground "LightSteelBlue"))))
     (font-lock-regexp-grouping-backslash ((t (:bold t :weight bold))))
     (font-lock-regexp-grouping-construct ((t (:bold t :weight bold))))

	 (minibuffer-prompt ((t (:foreground "#329efb" :bold t))))
	 (font-lock-warning-face ((t (:foreground "Red" :bold t))))
	 (yas/field-highlight-face ((t (:background "DimGrey"))))
	)))
(provide 'color-theme-timmy)

(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
(require 'color-theme)
(eval-after-load "color-theme"
	'(progn
		(color-theme-initialize)
		(color-theme-timmy)))





;;; lorem-ipsum.el --- Insert dummy pseudo Latin text.
;; Author & Maintainer: Jean-Philippe Theberge (jphil21@sourceforge.net)
;; Special Thanks: The emacswiki users, the #emacs@freenode.net citizens 
;;                 and Marcus Tullius Cicero
;;
;; version :
(defconst lorem-ipsum-version "0.1")
;; last update: 16/09/2003

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Copyright (c) 2003 Jean-Philippe Theberge
;;
;; This file is not (yet?) part of GNU Emacs.
;;
;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst Lorem-ipsum-text
  '(("Lorem ipsum dolor sit amet, consectetuer adipiscing elit."
     "Donec hendrerit tempor tellus."
     "Donec pretium posuere tellus."
     "Proin quam nisl, tincidunt et, mattis eget, convallis nec, purus."
     "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
     "Nulla posuere."
     "Donec vitae dolor."
     "Nullam tristique diam non turpis."
     "Cras placerat accumsan nulla."
     "Nullam rutrum."
     "Nam vestibulum accumsan nisl.")

    ("Pellentesque dapibus suscipit ligula."
     "Donec posuere augue in quam."
     "Etiam vel tortor sodales tellus ultricies commodo."
     "Suspendisse potenti."
     "Aenean in sem ac leo mollis blandit."
     "Donec neque quam, dignissim in, mollis nec, sagittis eu, wisi."
     "Phasellus lacus."
     "Etiam laoreet quam sed arcu."
     "Phasellus at dui in ligula mollis ultricies."
     "Integer placerat tristique nisl."
     "Praesent augue."
     "Fusce commodo."
     "Vestibulum convallis, lorem a tempus semper, dui dui euismod elit, vitae placerat urna tortor vitae lacus."
     "Nullam libero mauris, consequat quis, varius et, dictum id, arcu."
     "Mauris mollis tincidunt felis."
     "Aliquam feugiat tellus ut neque."
     "Nulla facilisis, risus a rhoncus fermentum, tellus tellus lacinia purus, et dictum nunc justo sit amet elit.")

    ("Aliquam erat volutpat."
     "Nunc eleifend leo vitae magna."
     "In id erat non orci commodo lobortis."
     "Proin neque massa, cursus ut, gravida ut, lobortis eget, lacus."
     "Sed diam."
     "Praesent fermentum tempor tellus."
     "Nullam tempus."
     "Mauris ac felis vel velit tristique imperdiet."
     "Donec at pede."
     "Etiam vel neque nec dui dignissim bibendum."
     "Vivamus id enim."
     "Phasellus neque orci, porta a, aliquet quis, semper a, massa."
     "Phasellus purus."
     "Pellentesque tristique imperdiet tortor."
     "Nam euismod tellus id erat.")

    ("Nullam eu ante vel est convallis dignissim."
     "Fusce suscipit, wisi nec facilisis facilisis, est dui fermentum leo, quis tempor ligula erat quis odio."
     "Nunc porta vulputate tellus."
     "Nunc rutrum turpis sed pede."
     "Sed bibendum."
     "Aliquam posuere."
     "Nunc aliquet, augue nec adipiscing interdum, lacus tellus malesuada massa, quis varius mi purus non odio."
     "Pellentesque condimentum, magna ut suscipit hendrerit, ipsum augue ornare nulla, non luctus diam neque sit amet urna."
     "Curabitur vulputate vestibulum lorem."
     "Fusce sagittis, libero non molestie mollis, magna orci ultrices dolor, at vulputate neque nulla lacinia eros."
     "Sed id ligula quis est convallis tempor."
     "Curabitur lacinia pulvinar nibh."
     "Nam a sapien.")))

(defvar Lorem-ipsum-paragraph-separator "\n\n")
(defvar Lorem-ipsum-sentence-separator "  ")
(defvar Lorem-ipsum-list-beginning "")
(defvar Lorem-ipsum-list-bullet "* ")
(defvar Lorem-ipsum-list-item-end "\n")
(defvar Lorem-ipsum-list-end "")

(make-variable-buffer-local 'Lorem-ipsum-paragraph-separator)
(make-variable-buffer-local 'Lorem-ipsum-sentence-separator)
(make-variable-buffer-local 'Lorem-ipsum-list-beginning)
(make-variable-buffer-local 'Lorem-ipsum-list-bullet)
(make-variable-buffer-local 'Lorem-ipsum-list-item-end)
(make-variable-buffer-local 'Lorem-ipsum-list-end)

(add-hook 'sgml-mode-hook (lambda ()
			    (setq Lorem-ipsum-paragraph-separator "<br><br>\n"
				  Lorem-ipsum-sentence-separator "&nbsp;&nbsp;"
				  Lorem-ipsum-list-beginning "<ul>\n"
				  Lorem-ipsum-list-bullet "<li>"
				  Lorem-ipsum-list-item-end "</li>\n"
				  Lorem-ipsum-list-end "</ul>\n")))

(defun Lorem-ipsum-insert-paragraphs (&optional num)
  (interactive "p")
  (if (not num)(setq num 1))
  (if (> num 0)
      (progn
	(insert (concat 
		 (mapconcat 'identity 
			    (nth (if (interactive-p) 0 (random (length Lorem-ipsum-text)))
				 Lorem-ipsum-text) " ")
		 Lorem-ipsum-paragraph-separator))
	(Lorem-ipsum-insert-paragraphs (- num 1)))))

(defun Lorem-ipsum-insert-sentences (&optional num)
  (interactive "p")
  (if (not num)(setq num 1))
  (if (> num 0)
      (progn
	(let ((para 
	       (nth (if (interactive-p) 0 (random (length Lorem-ipsum-text))) Lorem-ipsum-text)))
	  (insert (concat (nth (if (interactive-p) 0 (random (length para))) para) Lorem-ipsum-sentence-separator)))
	(Lorem-ipsum-insert-sentences (- num 1)))))
	  
(defun Lorem-ipsum-insert-list (&optional num)
  (interactive "p")
  (if (not num)(setq num 1))
  (if (> num 0)
      (progn
	(if (interactive-p) (insert Lorem-ipsum-list-beginning))
	(let ((para (nth (if (interactive-p) 0 (random (length Lorem-ipsum-text))) Lorem-ipsum-text)))
	  (insert (concat Lorem-ipsum-list-bullet 
			  (nth (if (interactive-p) 0 (random (length para))) para) 
			  Lorem-ipsum-list-item-end)))
	(Lorem-ipsum-insert-list (- num 1)))
    (insert Lorem-ipsum-list-end)))


(provide 'lorem-ipsum)

;;; lorem-ipsum.el ends here
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-auto-update-methods-after-save t)
 '(ecb-expand-methods-switch-off-auto-expand t)
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(text-mode-hook (quote (text-mode-hook-identify)))
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
