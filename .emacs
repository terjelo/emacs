(require 'cl)

;; (setq debug-on-error t)

;;;------------------------------------------------------------------------
;;; Basic stuff. Set up which packages we've got.
;;; These are set to non-nil in .emacs-local.
(defvar have-backup-dir nil "Set to non-nil if you have backup")
(defvar have-calculator nil "Set to non-nil if you have calculator")
(defvar have-eol-conversion-modified nil "Set to non-nil if you have eol-conversion-modified")
(defvar have-filladapt nil "Set to non-nil if you have Filladapt")
(defvar have-folding nil "Set to non-nil if you have Folding")
(defvar have-gnuserv nil "Set to non-nil if you have gnuserv")
(defvar have-html-helper-mode nil "Set to non-nil if you have HTML-Helper-Mode")
(defvar have-htmlize nil "Set to non-nil if you have HTMLize")
(defvar have-ishl nil "Set to non-nil if you have Ishl")
(defvar have-jde nil "Set to non-nil if you have jde")
(defvar have-msdos-shell-fix nil "Set to non-nil if you have msdos-shell-fix")
(defvar have-nc nil "Set to non-nil if you have nc")
(defvar have-oo-browser nil "Set to non-nil if you have oo-browser")
(defvar have-paren-face nil "Set to non-nil if you have paren-face")
(defvar have-pc-bufsw nil "Set to non-nil if you have pc-bufsw")
(defvar have-php nil "Set to non-nil if you have php-mode")
(defvar have-redo nil "Set to non-nil if you have redo")
(defvar have-unscroll nil "Set to non-nil if you have unscroll")
(defvar have-whitespace nil "Set to non-nil if you have whitespace")
(defvar have-shell-toggle nil "Set to non-nil if you have shell-toggle")
(defvar have-camelcase nil "Set to non-nil if you have camelCase")
(defvar have-auctex nil "Set to non-nil if you have AUCTeX")
(defvar have-python nil "Set to non-nil if you have Python mode")
(defvar have-tramp nil "Set to non-nil if you have Tramp")
(defvar have-testsuite nil "Set to non-nil if you have Testsuite")
(defvar have-docbookide nil "Set to non-nil if you have Docbook IDE")
(defvar have-psgml nil "Set to non-nil if you have PSGML")
(defvar have-css nil "Set to non-nil if you have CSS mode")
(defvar have-markdown nil "Set to non-nil if you have Markdown mode")
(defvar have-autotest nil "Set to non-nil if you have Autotest mode")
(defvar have-rubyblock nil "Set to non-nil if you have ruby-block mode")
(defvar have-browse-kill-ring nil "Set to non-nil if you have browse-kill-ring mode")
(defvar have-colortheme nil "Set to non-nil if you have colortheme mode")
(defvar have-psvn nil "Set to non-nil if you have psvn")
(defvar have-espresso nil "Set to non-nil if you have (and need) espresso mode for javascript")
(defvar have-javascript nil "Set to non-nil if you have (and need) javascript mode for javascript")
(defvar have-coffeecript nil "Set to non-nil if you have coffescript mode")

(setq emacs21 (eq emacs-major-version 21)) 
(setq emacs22 (eq emacs-major-version 22)) 
(setq emacs23 (eq emacs-major-version 23)) 
;;; General look and feel
;;;

(setq load-path (cons "~/elisp" load-path))
(setq frame-title-format "Emacs - %f")
(setq-default inhibit-startup-message t)
(setq user-full-name "Terje Loken")
(fset 'yes-or-no-p 'y-or-n-p)

;;; Colorized fonts
; (add-hook 'font-lock-mode-hook 'turn-on-lazy-lock)
; (setq font-lock-support-mode 'lazy-lock-mode)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)

;; colours
(set-background-color "Black")
(set-foreground-color "white")

(setq visible-bell t)
(setq transient-mark-mode t)
(setq scroll-step 1)                 ; Scroll a line at a time
(show-paren-mode t)                  ; Show matching parenthesis
(column-number-mode t)
(display-time)
(setq display-time-24hr-format t)
(setq next-line-add-newlines nil)    ; Don't add newlines to end of buffer
(setq compilation-window-height 10)  ; Make compile window smaller.
(setq compilation-scroll-output t)   ; Make the compile window auto-scroll
(require 'iswitchb)                  ;; Easy switching to buffers
(iswitchb-default-keybindings)
(menu-bar-mode -1)                   ;; Ditch the menu.
;(tabbar-mode -1)                     ;; Ditch the tabbar
(scroll-bar-mode nil)                ;; Ditch the scrollbar.
(setq default-major-mode 'text-mode) ;; Open unidentified files in text mode


(auto-compression-mode 1)            ;; Load and edit compressed files.
;(require 'dircolors)                 ;; Colorize intermediates, e.g. C-c C-f
(require 'generic-x)                 ;; Editing mode for X resource files.

;; Set up the global keys.
(global-set-key [C-right] 'forward-sexp)
(global-set-key [C-left] 'backward-sexp)
(global-set-key [C-up] 'beginning-of-defun)
(global-set-key [C-down] 'end-of-defun)
;; f2 - cppt-mode, test suite
;; f3 - cppt-mode, run test
(global-set-key [f4] 'compile)
(global-set-key [f5] 'shell)
(global-set-key [f6] 'toggle-source-header)
;; f7 reserved for cppt-mode, switch code-test
(global-set-key [f8] 'revert-buffer)
(global-set-key [f9] 'call-last-kbd-macro)
(global-set-key [f10] 'advertised-undo)
(global-set-key [f11] 'next-error)
(global-set-key [S-f11] 'previous-error)
(global-set-key [end] 'end-of-line)
(global-set-key [home] 'beginning-of-line)
(global-set-key "\C-xg" 'goto-line)
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key [\S-tab] 'indent-region)
(global-set-key [\C-backspace] 'backward-kill-word)
(global-set-key "\C-o" 'dabbrev-expand)
;(global-set-key "\C-s" 'isearch-forward-regexp)
;(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-x\C-n" 'find-file-other-frame) ;open new frame with a file
(global-set-key "\M-u" 'void) ;don't bind upcase word
(global-set-key "\M-l" 'void) ;don't bind downcase word
;(global-set-key "\M-g" 'grep) ;Useful...
(global-set-key "\M-g" 'grep-find) ;Useful...
(global-set-key "\M-c" 'cvs-examine) ;Very useful...
;(global-set-key [(control =)] 'joc-bounce-sexp) ; Bounce between parens
(global-set-key [(control =)] 'align-equals) ; Align selection on equal sign.
(global-set-key [\C-tab] 'align) ; Align selection.

(custom-set-variables '(aquamacs-styles-mode t))

;;;---------------------------------------------------------------------

;; Auto revert - automatically revert to file on disk.
;(autoload 'auto-revert-mode "autorevert" nil t)
;(autoload 'turn-on-auto-revert-mode "autorevert" nil nil)
;(autoload 'global-auto-revert-mode "autorevert" nil t)
;(global-auto-revert-mode 1)


;; Don't wrap the lines.
; (require 'auto-show)
; (setq-default truncate-lines t)


; (set-input-mode (car (current-input-mode))
; 		(nth 1 (current-input-mode))
;		0 )
(setq standard-indent 2)

; (standard-display-european t)

(put 'eval-expression 'disabled nil)

(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(setq default-frame-alist
     '((top . 50) (left . 10)
	(width . 82) (height . 200)
	(cursor-color . "yellow")
	(foreground-color . "white")
	(background-color . "darkslateblue")
	))

;; (add-hook 'text-mode-hook
;; 		 '(lambda ()
;; 		    (set-fill-column 90)
;; 		    (auto-fill-mode)))

(add-hook 'c-mode-common-hook
	  #'(lambda ()
	      (c-set-style "gnu")
	      (c-set-offset 'inline-open 0)
	      (c-set-offset 'access-label -2)
	      (c-set-offset 'case-label '+)
	      (setq indent-tabs-mode nil)
	      (c-set-offset 'inher-intro 0)
	      (c-set-offset 'label 2)))

(setq indent-tabs-mode nil)

;;; Positioning of new frames:
(defvar top-step 10
  "The increment for top in default-frame-alist.")
(defvar left-step 50
  "The increment for left in default-frame-alist.")

(add-hook 'after-make-frame-hook
	  (lambda ()
	    (let ((top (assq 'top default-frame-alist))
		  (left (assq 'left default-frame-alist)))
	      (if left (incf (cdr left) left-step)
		  (push '(left . left-step) default-frame-alist))
	      (if top (incf (cdr top) top-step)
		  (push '(top . top-step) default-frame-alist)))))


(when (or emacs21 emacs22 emacs23)
    (blink-cursor-mode -1) 
    (tool-bar-mode -1) 
    (tooltip-mode -1)
    (tabbar-mode -1))

(load "comint")
(fset 'original-comint-exec-1 (symbol-function 'comint-exec-1))
(defun comint-exec-1 (name buffer command switches)
  (let ((binary-process-input t)
        (binary-process-output nil))
    (original-comint-exec-1 name buffer command switches)))


;;;----------------------------------------------------------------
;;; Function definitions
;;; Do some clever stuff.
;;;

;; Made by Joe Casadonte (joc)
;; (defun joc-bounce-sexp ()
;;   "Will bounce between matching parens just like % in vi"
;;   (interactive)
;;   (let ((prev-char (char-to-string (preceding-char)))
;;         (next-char (char-to-string (following-char))))
;;         (cond ((string-match "[[{(<]" next-char) (forward-sexp 1))
;;                   ((string-match "[\]})>]" prev-char) (backward-sexp 1))
;;                   (t (error "%s" "Not on a paren, brace, or bracket")))))


;; Insert the current date.
(defun insert-date ()
  "Insert date at the current cursor position in the current buffer."
  (interactive)
  (insert (format-time-string "%c")))

;show ascii table
(defun ascii-table ()
  "Print the ascii table. Based on a defun by Alex Schroeder <asc@bsiag.com>"
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))
  (let ((i 0))
    (while (< i 254)
      (setq i (+ i 1))
      (insert (format "%4d %c\n" i i))))
  (beginning-of-buffer))

;convert a buffer from dos ^M end of lines to unix end of lines
(defun dos2unix () (interactive) (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;;Convert UNIX newline to DOS cr-lf
(defun unix2dos () (interactive) (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))

;; Default regexp for c++ header files.
(defvar c++-header-ext-regexp "\\.\\(hpp\\|h\\|\hh\\|H\\)$")
;; Default regexp for c++ source files.
(defvar c++-source-ext-regexp "\\.\\(cpp\\|c\\|\cc\\|C\\)$")

(defvar c++-source-extension-list '("c" "cc" "C" "cpp" "c++"))
(defvar c++-header-extension-list '("h" "hh" "H" "hpp"))

; Read .h files as c++, not c.
(setq auto-mode-alist (cons '("\\.h$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.c$" . c++-mode) auto-mode-alist))

;; Add extra types for font-lock.
;;(setq c++-font-lock-extra-types
;;     (append
;;       '("Fast_String" "FastOS_File" "FastOS_StatInfo" "LPC?\\(W\\|T\\|OLE\\)?\\STR"
;;	 "BYTE" "DWORD" "SOCKET" "idl_char"
;;	 "idl_boolean" "idl_byte" "idl_\\(short\\|long\\)_float"
;;	 "idl_u?\\(small\\|short\\|long\\)_int"
;;	 "boolean32" "unsigned\\(32\\|16\\)"
;;	 "Fast_Hashtable" "UINT" "ULONG" "VARIANT")       c++-font-lock-extra-types))


;; Switches between source/header files
(defun toggle-source-header()
  "Switches to the source buffer if currently in the header buffer and vice versa."
  (interactive)
  (let ((buf (current-buffer))
        (name (file-name-nondirectory (buffer-file-name)))
        file
        offs)
    (setq offs (string-match c++-header-ext-regexp name))
    (if offs
        (let ((lst c++-source-extension-list)
              (ok nil)
              ext)
          (setq file (substring name 0 offs))
          (while (and lst (not ok))
            (setq ext (car lst))
            (if (file-exists-p (concat file "." ext))
                  (setq ok t))
            (setq lst (cdr lst)))
          (if ok
              (find-file (concat file "." ext))))
      (let ()
        (setq offs (string-match c++-source-ext-regexp name))
        (if offs
            (let ((lst c++-header-extension-list)
                  (ok nil)
                  ext)
              (setq file (substring name 0 offs))
              (while (and lst (not ok))
                (setq ext (car lst))
                (if (file-exists-p (concat file "." ext))
                    (setq ok t))
                (setq lst (cdr lst)))
              (if ok
                  (find-file (concat file "." ext)))))))))


;;; Make FIXME and XXX stand out as big ugly warnings.
(setq font-lock-fixme-face (make-face 'font-lock-fixme-face))
(set-face-foreground 'font-lock-fixme-face "Red")
(set-face-background 'font-lock-fixme-face "Yellow")
(font-lock-add-keywords 'c++-mode
			'(("\\(XXX.*\\|TODO.*\\|\@todo.*\\)" 1 font-lock-fixme-face prepend)))

;;; align equal signs in marked block
(defun align-equals (start end)
  "make the first assignment operator on each line line up vertically"
 (interactive "*r")
 (save-excursion
   (let ((indent 0))
     (narrow-to-region start end)
     (beginning-of-buffer)
     (while (not (eobp))
       (if (find-assignment)
	   (progn
	     (exchange-point-and-mark)
	     (setq indent (max indent (current-column)))
	     (delete-horizontal-space)
	     (insert " ")))
       (forward-line 1))
     (beginning-of-buffer)
     (while (not (eobp))
       (if (find-assignment)
	   (indent-to-column (1+ (- indent  (- (mark) (point))))))
       (forward-line 1)))
   (widen)))

(defun find-assignment ()
  (if (re-search-forward
	     "[^<>=!]=\\|\\+=\\|-=\\|\\*=\\|/=\\|&=\\||=\\|\\^=\\|<<=\\|>>="
	     (save-excursion (end-of-line) (point)) t)
      (progn
	(goto-char (match-beginning 0))
	(if (looking-at ".==")
	    nil
	  (if (looking-at "\\+=\\|-=\\|\\*=\\|/=\\|&=\\||=\\|\\^=\\|<<=\\|>>=")
	      (set-mark (match-end 0))
	    (forward-char 1)
	    (set-mark (1+ (point))))
	  (delete-horizontal-space)
	  t))
    nil))



;; IntelliMouse scroll down action:
(defun intellimouse-scroll-down ()
  "Function to scroll the current window down 3 lines"
  (interactive)
  (scroll-down 4))

;; IntelliMouse scroll up action:
(defun intellimouse-scroll-up ()
  "Function to scroll the current window up 3 lines"
  (interactive)
  (scroll-up 4))

(global-set-key [mouse-5] 'intellimouse-scroll-up )
(global-set-key [mouse-4] 'intellimouse-scroll-down )
(global-set-key [button5] 'intellimouse-scroll-up )
(global-set-key [button4] 'intellimouse-scroll-down )
(global-set-key [C-mouse-5] 'scroll-up )
(global-set-key [C-mouse-4] 'scroll-down )
(global-set-key [C-button5] 'scroll-up )
(global-set-key [C-button4] 'scroll-down ) 

;; -------------------------------------------------------------------
;; load customizations split into pieces for better maintainance
;; put information about what was loaded into the messages buffer
;; -------------------------------------------------------------------
;;
;; check which Emacs we are running and on which platform
;; load the right customizations.
;;
(cond
 ((string-match "GNU" (emacs-version))
  (cond 
   ((string-match "linux" system-configuration)
    (if (file-exists-p "~/.emacs-gnu-linux")
	(progn
	  (message "loading GNU Emacs customizations for Linux")
	  (load-file "~/.emacs-gnu-linux"))))
   ((string-match "nt5" system-configuration)
    (if (file-exists-p "~/.emacs-gnu-win")
	(progn 
	  (message "loading GNU Emacs customizations for Win NT")
	  (load-file "~/.emacs-gnu-win"))))
   ((string-match "solaris" system-configuration)
    (if (file-exists-p "~/.emacs-gnu-solaris")
	(progn 
	  (message "loading GNU Emacs customizations for Solaris")
	  (load-file "~/.emacs-gnu-solaris"))))
   )
  ) ; matched GNU
 )

;; Load gnus setup.
(if (file-exists-p "~/.emacs-gnus")
    (progn
      (message "loading gnus setup")
      (load-file "~/.emacs-gnus")))

;; Load local setup stuff.
(if (file-exists-p "~/.emacs-local")
    (progn
      (message "loading local setup")
      (load-file "~/.emacs-local")))

;;;-------------------------------------------------------------------
;; Setup for specific packages. Define variables to use package.
;;;-------------------------------------------------------------------

;; Shell toggle. Mode to toggle between a buffer and a shell in the
;; buffer's directory.
(if have-shell-toggle
    (progn
      (autoload 'shell-toggle "shell-toggle" 
	"Toggles between the *shell* buffer and whatever buffer you are editing."
	t)
      (autoload 'shell-toggle-cd "shell-toggle" 
	"Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
      (global-set-key [f5] 'shell-toggle-cd)
      (global-set-key [C-f5] 'shell-toggle)))

(if have-colortheme
    (progn
      (color-theme-initialize)
      (color-theme-charcoal-black)))


; camelCase for thoseAnnoyingMixedCaseWords
(if have-camelcase
    (progn
      (autoload 'camelCase-mode "camelCase/camelCase-mode" nil t)
      (add-hook 'java-mode-hook '(lambda () (camelCase-mode 1)))))
;(add-hook 'c-mode-common-hook '(lambda () (camelCase-mode 1)))

;; Put backup files in a separate folder, avoiding pollution.
(if have-backup-dir
    (progn
      (require 'backup-dir)
      (setq bkup-backup-directory-info
	    '(("/h/lte/.*" "~/.backups/" ok-create prepend-name)
;; 	      ("^/[^/:]+:"     ".backups/") ; handle EFS files specially: don't
;; 	      ("^/[^/:]+:"     "./")        ; search-upward... its very slow
	      (t               "~/.backups/" ok-create prepend-name)))))

;; Save backup files to temp dir.
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; TeX stuff.
;;
;; AUC TeX.
(if have-auctex
    (progn
      (require 'tex-site)
      (setq-default TeX-master nil) ;; Query for master file.
       ;; Change the prefix for outline mode to avoid conflicts with AUC TeX.
      (setq outline-minor-mode-prefix "\C-c\C-o")
      ;; Enable parsing at load and save. May slow emacs down.
      ;; Manual parse is C-c C-n.
      (setq TeX-parse-self t)
      (setq TeX-auto-save t)))


;; Python stuff.
(if have-python
    (progn
      (setq auto-mode-alist
	    (cons '("\\.py$" . python-mode) auto-mode-alist))
      (setq interpreter-mode-alist
	    (cons '("python" . python-mode)
		  interpreter-mode-alist))
      (autoload 'python-mode "python-mode" "Python editing mode." t)))
      
;; Tramp - edit remote files / dirs.
(if have-tramp
    (progn
      (require 'tramp)
      (setq tramp-default-method "sm")))

;; Testsuite - fastlib stuff for automatic generation and running of tests.
(if have-testsuite
    (progn
      (setq cppt-use-function-keys-flag nil)
      (require 'cpptest)
      (setq cppt-LD_LIBRARY_PATH "/h/lte/rtsearch.2.7.linux/lib;/h/lte/rtsearch.2.7.solaris/lib")
      (setq cppt-make-plain-args nil)
      ;; (global-set-key [f6]   'cppt-toggle-header-src)
      (global-set-key [f7]   'cppt-switch-code-test)
      (global-set-key [S-f7] 'cppt-verify-test-methods)
      (global-set-key [f3]   'cppt-run-test)
      (global-set-key [S-f3] 'cppt-run-test-purify)
      (global-set-key [C-f3] 'cppt-run-test-debug)
      (global-set-key [C-S-f3] 'cppt-run-single-test-debug)
      (global-set-key [f2]   'cppt-test-suite)
      (global-set-key [S-f2] 'cppt-suite-debug)
      (global-set-key [C-f2] 'cppt-suite-verbose)
      (global-set-key [S-f12]  'cppt-insert-class-doc)
      (global-set-key [f12] 'cppt-insert-method-doc)
      (global-set-key [f4]   'cppt-make-plain)))
;;       (local-set-key [S-f8] 'cppt-make-build)
;;       (local-set-key [f9]   'cppt-root-make-plain)
;;       (local-set-key [S-f9] 'cppt-root-make-build)))


;; DocBook IDE mode
(if have-docbookide
    (progn
      (autoload 'docbook-mode "docbookide" "Major mode for DocBook documents." t)))
  ;;   (setq auto-mode-alist
;; 	(append
;; 	 '("\\.xml" . docbook-mode)
;; 	 auto-mode-alist)))

(if have-psgml
    (progn
      (autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
      (autoload 'xml-mode "psgml" "Major mode to edit XML files." t)))
      
(if have-css
    (progn
      (autoload 'css-mode "css-mode")
      (setq auto-mode-alist       
	    (cons '("\\.css\\'" . css-mode) auto-mode-alist))))

(if have-markdown
    (progn
      (require 'markdown-mode)
      (setq auto-mode-alist
	    (cons '("\\.markdown" . markdown-mode) auto-mode-alist))))

(if have-autotest
    (progn
      (autoload 'autotest-switch "autotest" "doco" t)
      (autoload 'autotest "autotest" "doco" t)
      (add-hook 'ruby-mode-hook
		'(lambda ()
		   (define-key ruby-mode-map (kbd "C-c C-a") 'autotest-switch)))))

(if have-espresso
    (progn
      (autoload #'espresso-mode "espresso" "Start espresso mode" t)
      (add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
      (add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))))

(if have-javascript
    (progn
      (add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
      (autoload 'javascript-mode "javascript" nil t)))

(if have-coffeecript
    (progn
      (when (or emacs22 emacs23)
	(require 'coffee-mode)
	(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
	(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode)))))

;; Emacs 23 specifics go here for now.
(when emacs23
  (if have-rubyblock
      (progn
	(require 'ruby-block)
	(ruby-block-mode t)))
  
  ;; Working javascript mode - enable it.
  (setq auto-mode-alist (cons '("\\.js$" . js-mode) auto-mode-alist))
  
  ;; for xml files, use nxml-mode instead of sgml-mode
  (add-to-list 'auto-mode-alist '("\\.xml\\'" . nxml-mode)))

(if have-browse-kill-ring
    (progn
      (require 'browse-kill-ring)
      (browse-kill-ring-default-keybindings)))

;psvn - subversion explorer
(if have-psvn
    (progn
      (require 'psvn)))



(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(font-lock-support-mode nil)
 '(py-indent-offset 2))

; Start with the same buffers, major modes and buffer positions:
; You must do a M-x desktop-save the first time it's used. Emacs
; must be started in the same current directory.
(load "desktop")
(desktop-load-default)
(desktop-read)

(global-set-key [\C-c\C-c] 'comment-region)

