;; -*- mode: elisp -*-
;; language: emacs lisp (elisp)
;; filename: emacs.el  (linked as .emacs)
;; purpose: Set configurations for the GNU Emacs text editor.


;; NOTE: Apologies, dear reader, for this is one of my most disorganized
;;       and aesthetically displeasing configuration files.  As time goes
;;       on, I should be able to clean this up more.


; This is the initialization ("init") file, or simply "dot emacs" file
; (or Emacs "dotfile") that configures the initial settings of Emacs
; upon starting up Emacs.
; In GNU/Linux, its location can be in the user home directory (~/.emacs).
; In Windows, its location can be in, for example:
;   C:\Users\username\AppData\Roaming
; (In Windows, one may have to use the Command Prompt to manipulate files whose
;  names begin with a period.)

; In overview, this file activates these major features:
; 1) Evil mode (to give vi key-bindings in emacs);
; 2) Org-Mode (and Evil-Org-Mode) for organizational functionality
;    (including TODO-list action management and scheduling,
;     as well as hierarchical outline note-taking);
; 3) undo-tree (to have complete control of undo-ing and re-doing actions);
; 4) ido-mode (smart search for buffers/files);
; 5) icomplete-mode (provides an incremental MiniBuffer Completion preview); and
; 6) color schemes (in general and for org-mode).


; This file references the following external directories and files:
; ~/.emacs.d
; ~/.emacs.d/evil
; ~/.emacs.d/evil/lib
; ~/.emacs.d/org-8.2.4/lisp
; ~/.emacs.d/plugins/evil-org-mode




;;=================================================
;; CONFIGS ELSEWHERE
;;-------------------------------------------------

; See ~/.config-repo/setup/run-setup-MacOS-env.sh
; ( In MacOS, the Caps Lock key is set to function as another Control key,
;   to make control-key combinations more ergonomic. )
; ( In Terminal and iTerm2, the Left Option key is set to function as
;   the Meta key or, equivalently, "Esc+", for usage in Emacs. )




;;=================================================
;; IDEAS
;;-------------------------------------------------

; See other people's init/config files, for example:
; https://github.com/ivoarch/.dot-org-files/blob/master/emacs.org

; TODO: Get rid of all the many unnecessary files in this repo.
; TODO: Get rid of all the many unnecessary lines of code/comments in this file.
;       (take notes elsewhere if wanted)
; TODO: Fix line-move-visual key bindings.
;       (el and txt files work)
;       (tex file half-works)
;       (org file doesn't work, although it doesn't need to work here)




;;=================================================
;; META INFO
;;-------------------------------------------------

; To find versions of Emacs and plugins, be in Emacs mode <E> or an Evil mode
; (such as Normal <N> or Insert <I>) and press/enter "M-x emacs-version", etc.

; 2013-12-09:
; Emacs:     GNU Emacs 24.3.1 (x86_64-unknown-linux-gnu, GTK+ Version 2.24.10)
; Org-Mode:  Org-mode version 8.2.4 (8.2.4-dist @ /home/zero/.emacs.d/org-8.2.4/lisp/)
; Evil:      Evil version 1.0-dev




;;=================================================
;; EMACS
;;-------------------------------------------------

; References:
;  https://github.com/ivoarch/.dot-org-files/blob/master/emacs.org
;  https://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/
;  https://github.com/larstvei/dot-emacs

; How often do I want to use eval-when-compile? Use it with (require 'package)?
(eval-when-compile
  (add-to-list 'load-path "~/.emacs.d/use-package")
  (require 'use-package))
(require 'bind-key)

; Package / plugin management can be done with a variety of tools:
;   - package (package.el)
;   - elpa (Emacs Lisp Package Archive)
;   - melpa (Milkypostman's elpa)
;   - marmalade
;   - etc

; We will use package:
;(require 'cl)
(require 'package)
(package-initialize)
; To see pages, use 'M-x package-list-packages'.

; Fetch more packages:
; (I get errors when trying to connect to these sites.)
;(ignore-errors
;    (add-to-list 'package-archives
;                 '("melpa" . "http://melpa.milkbox.net/packages/"))
;    (add-to-list 'package-archives
;                 '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
;    (add-to-list 'package-archives
;                 '("org" . "http://orgmode.org/elpa/"))
;    (package-refresh-contents)
;)

; Reference list of desired packages:
(setq required-packages
      (list
       ;'auto-complete ; auto-completion extension for GNU Emacs.
       ;'auto-complete-clang ; nice C & C++ autocomplete for Emacs.
       ;'autopair ; automagically pair braces and quotes.
       ;'dired-details ; hide/show the details of each file or directory in DiredMode.
       ;'flycheck ; fly syntax checking for GNU Emacs.
       ;'flx-ido ; Fuzzy matching for Emacs ... a la Sublime Text.
       ;'htmlize ; Convert buffer text and decorations to HTML.
       ;'ido-vertical-mode ; makes ido-mode display vertically.
       ;'js2-mode ; javascript-mode for emacs.
       ;'magit ; Emacs mode for Git.
       ;'markdown-mode ; Emacs mode for Markdown-formatted files.
       ;'multi-term ; managing multiple terminal buffers in Emacs.
       'multiple-cursors ; Multiple cursors for emacs.
       'org ; an Emacs Mode for Notes, Planning, and Authoring.
       ;'org-plus-contrib ; contrib files for org.
       ;'paredit ; minor mode for editing parentheses.
       'rainbow-mode ; Colorize color names in buffers.
       'rainbow-delimiters ; rainbow delimiters mode.
       'smex ; M-x enhancement for Emacs. Built on top of IDO.
       ;'web-mode ; web template editing mode for emacs.
       ;'xkcd ; Read xkcd from emacs.
       ;'zenburn-theme ; The Zenburn colour theme ported to Emacs.
       ))

;; Check if all desired packages are installed.
(require 'cl-lib)
(defun packages-installed-p ()
  (cl-every 'package-installed-p required-packages))
;; (alternatively)
;(defun packages-installed-p ()
;  (loop for p in required-packages
;        when (not (package-installed-p p)) do (return nil)
;        finally (return t)))

;; If any packages are missing, install them.
(unless (packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; Multiple Cursors
;; For simultaneous multi-line editing.
(require 'multiple-cursors)
;(global-set-key (kbd "C->") 'mc/mark-next-like-this)     ; can't do control-shift
;(global-set-key (kbd "C-<") 'mc/mark-previous-like-this) ; can't do control-shift
;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)  ; can't do control-shift
;(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
;(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
;(global-set-key (kbd "C-c C-.") 'mc/mark-all-like-this)
;(global-set-key (kbd "C-l") 'mc/mark-next-like-this)
;(global-set-key (kbd "C-h") 'mc/mark-previous-like-this)
;(global-set-key (kbd "C-c C-l") 'mc/mark-all-like-this)

;; Colors
;; For theme options and a nice dark theme and colorized color names.
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
;(color-theme-robin-hood)
(add-to-list 'load-path "~/.emacs.d/themes") ; where I put my color theme file
(require 'zenburn)
(zenburn)

; highlight trailing spaces in (pinkish) red
(setq-default show-trailing-whitespace t)


;(add-hook 'css-mode-hook 'rainbow-mode)


;; Smart M-x
;(require 'smex)
;(smex-initialize)
;(global-set-key (kbd "M-x") 'smex)
;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; I don't need the menu bar.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Get the colors right, even when using tmux
;(defun terminal-init-screen ()
;  "Terminal initialization function for screen."
;   ;; Use the xterm color initialization code.
;   (xterm-register-default-colors)
;   (tty-set-up-initial-frame-faces)
;)

;; Start with this file -- even when no files are specified.(?)
;(custom-set-variables
;'(initial-buffer-choice "[*]Buffer List[*]"))
;'(initial-buffer-choice "[*]Buffer List"))
;'(initial-buffer-choice "~/org/Review/R01_ActionList_Current.org"))

;; Don't split the screen at startup -- show only one buffer.
(add-hook 'emacs-startup-hook
          (lambda () (delete-other-windows)) t)

;;; Faster buffer switching
;; (Couldn't figure out how to get this to work.)
;; http://stackoverflow.com/questions/916797/emacs-global-set-key-to-c-tab
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Key-Sequences.html
;(global-set-key (kbd "<C-tab>") 'buffer-menu)
;(global-set-key (kbd "C-<tab>") 'buffer-menu)
; see .emacs_v1_20170214 for more attempts

;; Word wrap mode called visual line mode.
(mapc '(lambda (hook) (add-hook hook 'turn-on-visual-line-mode))
      '(text-mode-hook
        lisp-interaction-mode-hook))
;; Column line where text should be wrapped
(setq-default fill-column 75)
;; By default move up and down by logical lines, not visual lines
(setq line-move-visual nil)

;; Ido - "Interactively DO things"
;; How much of ido-mode do I want?
;(setq ido-enable-flex-matching t)
;(ido-everywhere 1)
(ido-mode 1)
(icomplete-mode 1)

;; Do I want to use icomplete-mode too?
;; see http://ergoemacs.org/emacs/emacs_iswitch_vs_ido.html

;; What about helm (also or instead of Ido)?




;;=================================================
;; EVIL
;;-------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/evil") ; only without ELPA/el-get
(require 'evil)
(evil-mode 1)

; maybe check here too: https://github.com/cofi/dotfiles/blob/master/emacs.d/config/cofi-evil.el#L149

; Activate undo-tree-mode (possibly just when evil is active)
; What code will do the trick?
; The following two lines causes an initialization error while loading .emacs
(add-to-list 'load-path "~/.emacs.d/emacs-24.3/lisp/emacs-lisp") ; to access let-alist.el, which undo-tree requires
(add-to-list 'load-path "~/.emacs.d/evil/lib")
(require 'undo-tree)
;(global-undo-tree-mode)
(global-undo-tree-mode t)
;(global-undo-tree-mode 1) ; I don't think this line worked.
; The following line of code made it impossible to exit edit mode (instead of giving me the "redo" functionality)!
;(add-hook 'evil-local-mode-hook 'turn-on-undo-tree-mode)

; I want to make sure that in the undo-tree mode, "h" and "l" switch the branch left and right, respectively.
; So, try this (to, I hope, load the "evil-integration" library)
;(require 'evil-integration)
; Nope, that didn't work, so try this instead...
;(add-hook 'undo-tree-mode-hook
;            '(lambda ()
;               (define-key undo-tree-mode-map "h" 'undo-tree-visualize-switch-branch-left)
;))
;(add-hook 'undo-tree-mode-hook
;            '(lambda ()
;               (define-key undo-tree-mode-map "l" 'undo-tree-visualize-switch-branch-right)
;))
; That didn't work either, so let's try some code from evil-integration.el
(when (boundp 'undo-tree-visualizer-mode-map)
       (define-key undo-tree-visualizer-mode-map
         [remap evil-backward-char] 'undo-tree-visualize-switch-branch-left)
       (define-key undo-tree-visualizer-mode-map
         [remap evil-forward-char] 'undo-tree-visualize-switch-branch-right)
       (define-key undo-tree-visualizer-mode-map
         [remap evil-next-line] 'undo-tree-visualize-redo)
       (define-key undo-tree-visualizer-mode-map
         [remap evil-previous-line] 'undo-tree-visualize-undo)
       (define-key undo-tree-visualizer-mode-map
         [remap evil-ret] 'undo-tree-visualizer-set))
; I don't understand why this wasn't already activated by requiring evil (since it refers-to/requires the evil-integration file).

;;; esc quits many things (everything?)
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)




;;=================================================
;; ORG-MODE
;;-------------------------------------------------

;; See https://orgmode.org/manual/Installation.html

;; Looks like I don't need to provide my own org files; org is included / pre-packaged with GNU Emacs. So I'll try just not referring to the files I've got saved here (eg ~/.emacs.d/org/lisp).
;; Nope, that didn't work because the problem below [*] is still there using that method.  I'll try referring to ~/.emacs.d/org/lisp again.
;; Everything here is so disorganized now; it needs a re-haul.

;(add-to-list 'load-path "~/.emacs.d/org-8.2.4/lisp") ; commenting out to see if I can fix this [*]
; [*] for some unknown reason, on a scheduled todo item with a repeater, I used to be able to press S-t d (DONE) and it would iterate the schedule date to the next state, give a "DONE" stamp and keep the item as scheduled. Now that key binding erases the scheduled repeating date and essentially marks the item as permanently done, leaving a blank schedule ("SCHEDULED: ").
(add-to-list 'load-path "~/.emacs.d/org/lisp")
; Not sure if the line above will work since I had to comment it out earlier:
;(add-to-list 'load-path "~/.emacs.d/org/lisp")  ; attempted `make' in org directory but had errors

;; [2021-10-12] An error/warning when opening an org file with emacs told me:
;; "
;;  WARNING: No org-loaddefs.el file could be found from where org.el is loaded.
;;  You need to run "make" or "make autoloads" from Org lisp directory
;; "
;; So I ran `make` and `make autoloads` from the Org lisp directory, but they
;; told me to run in the directory above that:
;; "
;;  Makefile:4: *** This make needs to be started as a sub-make from the toplevel directory..  Stop.
;; "
;; So I ran `make` and `make autoloads` successfully (first unsuccessfully since
;; "makeinfo: Command not found" -- then successfully after installing texinfo by
;; `sudo apt install texinfo` in order to use makeinfo).

(require 'org) ;; I was getting an error when trying to add org-habit to org-modules without this line.
(require 'org-install)

;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; not needed since Emacs 22.2
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on

;; Location of org files.
(defvar dir-where-you-store-org-files "~/org/")
(setq org-default-notes-file (concat org-directory "/Capture/capture.org")) ; set capture file
;; Might want to update the agenda-included files.  (Oh, also see custom-set-variables below, which has org-agenda-files.)
(setq org-agenda-files (mapcar (
   lambda (x) (concat dir-where-you-store-org-files x))
   '(
      "/Projects/Proj_SecurityMotionDetect.org"
      "/Review/R01_ActionList_Current.org" "/Review/R02_IdeaAction_PendPro.org"
      "/Review/R03_IdeaAction_PendChr.org" "/Review/R04_IdeaAction_PendFun.org"
      "/Review/R05_IdeaAction_DatedRv.org"
      "/Review/More/R06_IdeaAction_SmdyMyb.org"
    )
 )
)
;; archiving
(setq org-archive-location "~/org/Review/Archive/IdeaAction_Completed_archive.org::")


;; Basic org-mode commands.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)




;; Time and Agenda
(setq org-time-stamp-custom-formats
   (quote ("< %Y %b %d %a >" . "<%Y-%m-%d %a>"))
;   (quote ("<%Y-%m-%d %a>" . "< %Y %b %d %a >"))
)
;; Clocking work time - activate
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
;; Agenda stuff
(setq org-agenda-skip-scheduled-if-done t)
;(setq org-agenda-include-diary t)
;; Prevent automatic time-scheduling (by searching TODO item)
;; (got this from here: https://github.com/bastibe/org-journal/issues/48 )
(setq org-agenda-search-headline-for-time nil)



;; Turn on org-indent-mode to get "A cleaner outline view"
(setq org-startup-indented t)
;; Example: for indentation specific to one document, use this in that document...
;; #+STARTUP: indent

;; reveal folded headline when trying to edit
;org-catch-invisible-edits 'show



;;;; from Emilio Torres Manzanera's dotemacs file
;;;; http://uce.uniovi.es/tips/Emacs/mydotemacs.html#sec-4

;;;(setq calendar-holidays
;;;      (append general-holidays christian-holidays other-holidays solar-holidays))

;(setq calendar-holidays
;      (append general-holidays other-holidays solar-holidays))

;; remove some holidays
;(setq general-holidays nil)     ; get rid of too U.S.-centric holidays
;(setq christian-holidays nil)   ; get rid of religious holidays
(setq hebrew-holidays nil)       ; get rid of religious holidays
(setq islamic-holidays nil)      ; get rid of religious holidays
;(setq oriental-holidays nil)    ; get rid of Oriental holidays
(setq bahai-holidays nil)        ; get rid of Baha'i holidays

;; mark dates of holidays in the calendar
;(setq mark-holidays-in-calendar t)

;;;;
;;;;



;; Modify agenda display (spacing and name abbreviations)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; modify agenda "date headings" format (to abbreviate day and month names)
(setq org-agenda-format-date 'my-org-agenda-format-date-aligned)
;;Didn't need to use defalias, as suggested here:
; http://emacs.stackexchange.com/questions/30663/how-to-customize-date-headings-in-agenda-timeline-view?noredirect=1#comment47286_30663
; with detail here (http://superuser.com/questions/613694/agenda-view-custom-timestamp-format-a-b-d-y-im-p/652026#652026):
;(defalias 'org-agenda-format-date-aligned 'my-org-agenda-format-date-aligned)

(defun my-org-agenda-format-date-aligned (date)
  "Format a DATE string for display in the daily/weekly agenda, or timeline.
This function makes sure that dates are aligned for easy reading."
  (require 'cal-iso)
  (let* ((dayname (calendar-day-name date 1 nil))
	 (day (cadr date))
	 (day-of-week (calendar-day-of-week date))
	 (month (car date))
	 (monthname (calendar-month-name month 1))
	 (year (nth 2 date))
	 (iso-week (org-days-to-iso-week
		    (calendar-absolute-from-gregorian date)))
	 (weekyear (cond ((and (= month 1) (>= iso-week 52))
			  (1- year))
			 ((and (= month 12) (<= iso-week 1))
			  (1+ year))
			 (t year)))
	 (weekstring (if (= day-of-week 1)
			 (format " W%02d" iso-week)
		       "")))
         (format "%-8s %2d %s %4d%s"
	    dayname day monthname year weekstring)))

;; modify spacing too:
(setq org-agenda-prefix-format
  '((agenda  . " %i %-10:c%?-12t% s")
    (timeline  . "  % s")
    (todo  . " %i %-12:c")
    (tags  . " %i %-12:c")
    (search . " %i %-12:c")))


;; HABITS
(add-to-list 'org-modules 'org-habit)
(setq org-habit-show-habits-only-for-today t)
(setq org-habit-graph-column 80)

;; Modify the habits consistency graph (the Seinfeld "don't break the chain" device)
;; On my small laptop, I can only see so much of the graph
(defcustom org-habit-preceding-days 14
  "Number of days before today to appear in consistency graphs."
  :group 'org-habit
  :type 'integer)
(defcustom org-habit-following-days 2
  "Number of days after today to appear in consistency graphs."
  :group 'org-habit
  :type 'integer)
;; (I would prefer to make the graph go the other way, from left to right, rather than right to left, but I'll leave that trick for later.)
;; (Going left-to-right would make sure that the latest days are visible, even when the screen size is small, and the later days can trail off beyond the edge of the screen, no problem.)
;; (Then I wouldn't have to modify the variables above to fit my screen.)
;; (Another question: why is there so much red?)
;; (And what's the good of the yellow days? Isn't that just a successful day, which should be green? Are they just trying to emphasize the brokenness?)




;;=================================================
;; EVIL-ORG-MODE
;;-------------------------------------------------

;; See https://github.com/Somelauw/evil-org-mode
;; for key-bindings.  For example:
;; <<   promote a heading
;; >>   demote a heading
;; M-k  move subtree up
;; M-j  move subtree down

;; While using Emacs 24.3.1 (< 24.4), need to avoid using the undefined macro
;; `with-eval-after-load'.
;; For reference, see
;;  - https://www.masteringemacs.org/article/whats-new-in-emacs-24-4
;;  - https://github.com/girzel/gnorb/issues/19
;;  - https://emacs-leuven.readthedocs.io/en/stable/    (alternative soln code)
(unless (fboundp 'with-eval-after-load)
  (defmacro with-eval-after-load (file &rest body)
    `(eval-after-load ,file
       `(funcall (function ,(lambda () ,@body))))))


;; OLD VERSION:
;;(add-to-list 'load-path "~/.emacs.d/plugins/evil-org-mode")
;;(require 'evil-org)
;;
;;; add hook to load evil-org mappings in all org documents
;;(add-hook 'org-mode-hook 'evil-org-mode)
;;
;;(define-minor-mode evil-org-mode
;;"minor mode to add evil keymappings to Org-mode."
;;:keymap (make-sparse-keymap)
;;(evil-local-mode t))


(add-to-list 'load-path "~/.emacs.d/plugins/evil-org")
(require 'evil-org)

; add hook to load evil-org mappings in all org documents
(add-hook 'org-mode-hook 'evil-org-mode)

(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
; Not sure how these worked before -- I don't see where evil-org-agenda is defined.
;(require 'evil-org-agenda)
;(evil-org-agenda-set-keys)




; the ',<num>' keys give quick and easy way to hide/reveal outline
; structure of entire document (analogous to <shift-tab>);
(evil-define-key 'normal evil-org-mode-map ",1" '(lambda()
(interactive)(hide-sublevels 1)))
(evil-define-key 'normal evil-org-mode-map ",2" '(lambda()
(interactive)(hide-sublevels 2)))
(evil-define-key 'normal evil-org-mode-map ",3" '(lambda()
(interactive)(hide-sublevels 3)))
(evil-define-key 'normal evil-org-mode-map ",4" '(lambda()
(interactive)(hide-sublevels 4)))
(evil-define-key 'normal evil-org-mode-map ",5" '(lambda()
(interactive)(hide-sublevels 5)))
(evil-define-key 'normal evil-org-mode-map ",6" '(lambda()
(interactive)(hide-sublevels 6)))
(evil-define-key 'normal evil-org-mode-map ",7" '(lambda()
(interactive)(hide-sublevels 7)))
(evil-define-key 'normal evil-org-mode-map ",8" '(lambda()
(interactive)(hide-sublevels 8)))

; the ',,<num>' maps below give quick and easy way to hide/reveal outline
; structure of single subtree.  depending on what sort of org
; documents you have, and how you use them, you may prefer
; to have these mappings use single ',' and have entire-document
; mappings use ',,' prefix.
(evil-define-key 'normal evil-org-mode-map ",,1" '(lambda()
(interactive)(hide-sublevels 1)))
(evil-define-key 'normal evil-org-mode-map ",,2" '(lambda()
(interactive)(hide-sublevels 1)(show-children 1)))
(evil-define-key 'normal evil-org-mode-map ",,3" '(lambda()
(interactive)(hide-sublevels 1)(show-children 2)))
(evil-define-key 'normal evil-org-mode-map ",,4" '(lambda()
(interactive)(hide-sublevels 1)(show-children 3)))
(evil-define-key 'normal evil-org-mode-map ",,5" '(lambda()
(interactive)(hide-sublevels 1)(show-children 4)))
(evil-define-key 'normal evil-org-mode-map ",,6" '(lambda()
(interactive)(hide-sublevels 1)(show-children 5)))
(evil-define-key 'normal evil-org-mode-map ",,7" '(lambda()
(interactive)(hide-sublevels 1)(show-children 6)))
(evil-define-key 'normal evil-org-mode-map ",,8" '(lambda()
(interactive)(hide-sublevels 1)(show-children 7)))

; various commands mapped below
;(evil-define-key 'normal evil-org-mode-map ",dd" 'org-deadline)
;(evil-define-key 'normal evil-org-mode-map ",ds" 'org-schedule)
;(evil-define-key 'normal evil-org-mode-map ",te" 'org-set-tags-command)
;(evil-define-key 'normal evil-org-mode-map ",ts" 'org-todo)
;(evil-define-key 'normal evil-org-mode-map ",r" 'org-refile)
;(evil-define-key 'normal evil-org-mode-map ",c" 'org-capture)
;(evil-define-key 'normal evil-org-mode-map ",ag" 'org-agenda)
;(evil-define-key 'normal evil-org-mode-map "<<" 'org-promote-subtree)
;(evil-define-key 'normal evil-org-mode-map ">>" 'org-demote-subtree)
;(evil-define-key 'normal evil-org-mode-map ">." 'org-move-subtree-down)
;(evil-define-key 'normal evil-org-mode-map "<," 'org-move-subtree-up)
;(evil-define-key 'normal evil-org-mode-map "gj" 'org-forward-same-level)
;(evil-define-key 'normal evil-org-mode-map "gk" 'org-backward-same-level)
;(evil-define-key 'normal evil-org-mode-map "gh" 'outline-up-heading)
;(evil-define-key 'normal evil-org-mode-map "gl" 'outline-next-visible-heading)
;(evil-define-key 'normal evil-org-mode-map ",g" 'org-goto)
;(evil-define-key 'normal evil-org-mode-map ",ex" 'org-export)
;(evil-define-key 'normal evil-org-mode-map ",ns" 'org-narrow-to-subtree)
;(evil-define-key 'normal evil-org-mode-map ",nw" 'widen)
;(evil-define-key 'normal evil-org-mode-map [(return)]
;'org-insert-heading-respect-content)


;; from https://github.com/jgm/emacsd/blob/master/evil-customizations.el
;; also http://stackoverflow.com/questions/8483182/emacs-evil-mode-best-practice
;;--------------------------------------------------------------------
(define-key evil-normal-state-map (kbd "C-n") (lambda ()
                                               (interactive)
                                               (evil-next-buffer)))
(define-key evil-normal-state-map (kbd "C-p") (lambda ()
                                               (interactive)
                                               (evil-prev-buffer)))

(evil-define-key 'normal org-mode-map "t" (lambda ()
                     (interactive)
                     (end-of-line)
                     (org-insert-todo-heading nil)
                     (evil-append nil)
                     ))

(evil-define-key 'normal org-mode-map "T" 'org-todo) ; mark a TODO item as DONE
(evil-define-key 'normal org-mode-map ";a" 'org-agenda) ; access agenda buffer
(evil-define-key 'normal org-mode-map "-" 'org-cycle-list-bullet) ; change bullet style
(evil-define-key 'normal org-mode-map (kbd "TAB") 'org-cycle) ; cycle

; allow us to access org-mode keys directly from Evil's Normal mode
(evil-define-key 'normal org-mode-map (kbd "M-l") 'org-metaright)
(evil-define-key 'normal org-mode-map (kbd "M-h") 'org-metaleft)
(evil-define-key 'normal org-mode-map (kbd "M-k") 'org-metaup)
(evil-define-key 'normal org-mode-map (kbd "M-j") 'org-metadown)
(evil-define-key 'normal org-mode-map (kbd "M-L") 'org-shiftmetaright)
(evil-define-key 'normal org-mode-map (kbd "M-H") 'org-shiftmetaleft)
(evil-define-key 'normal org-mode-map (kbd "M-K") 'org-shiftmetaup)
(evil-define-key 'normal org-mode-map (kbd "M-J") 'org-shiftmetadown)

; Note:
;  In MacOS Terminal, Shift+Meta+Right works (shifting an org-mode bullet point rightward).
;  In MacOS iTerm2, Shift+Meta+Right doesn't work (instead deleting the line and entering insert mode).
;  However, with the key-bindings above, Meta-l works in both Terminal and iTerm2.

;;-------------------------------------------------------------------


;; redefine / reset org-agenda commands
;(org-defkey org-agenda-mode-map "j" 'org-agenda-next-line)
;(org-defkey org-agenda-mode-map "J" 'org-agenda-goto-date)
(add-hook 'org-agenda-mode-hook
            '(lambda ()
               (define-key org-agenda-mode-map "j" 'org-agenda-next-line)
))
(add-hook 'org-agenda-mode-hook
            '(lambda ()
               (define-key org-agenda-mode-map "k" 'org-agenda-previous-line)
))
(add-hook 'org-agenda-mode-hook
            '(lambda ()
               (define-key org-agenda-mode-map "J" 'org-agenda-goto-date)
))




;;=================================================
;; GENERAL COLORS
;;-------------------------------------------------

;; Cursor color
(set-cursor-color "white")

;; Color for selected text
(set-face-background 'region "gray60")




;;=================================================
;; ORG-MODE KEYWORDS & COLORS
;;-------------------------------------------------

; from : http://orgmode.org/worg/org-faq.html
; If you would like an overview of all the faces in org-mode, you can type C-u M-x list-faces-display [RET] org and you will be shown all the faces defined by org-mode along with an illustration of their current settings.

;; this section will give us ... fonts
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#888068" :background "#3f3f3f"))))
 '(isearch ((t (:foreground "#000000" :background "yellow"))))
 '(org-level-1 ((t (:foreground "#b8b8b8" :height 2.7))))
 '(org-level-10 ((t (:foreground "#383838" :height 1.1))))
 '(org-level-11 ((t (:foreground "#203858" :height 1.1))))
 '(org-level-2 ((t (:foreground "#b8b8b8" :height 2.7))))
 '(org-level-3 ((t (:foreground "#9a98c5" :height 2.5))))
 '(org-level-4 ((t (:foreground "#989898" :height 1.2))))
 '(org-level-5 ((t (:foreground "#8098b8" :height 1.1))))
 '(org-level-6 ((t (:foreground "#787878" :height 1.1))))
 '(org-level-7 ((t (:foreground "#607898" :height 1.1))))
 '(org-level-8 ((t (:foreground "#585858" :height 1.1))))
 '(org-level-9 ((t (:foreground "#405878" :height 1.1))))
 '(org-link ((t (:color inherit :underline t)))))


; from: https://gitorious.org/ryuslashdotfiles/dotemacs/source/da3b07864a2ae7577f3d84c80808353960127230:.emacs#L10
; see:  https://www.gnu.org/software/emacs/manual/html_node/org/Tracking-TODO-state-changes.html
; (looks like "@" makes comments, and "/!" de-activates in agenda?)
(setq org-todo-keywords (quote ((sequence "TODO(t)"
                                          "NEXT(n)"
                                          "PROJ(p)"
                                          "ACTV(a)"
                                          "SMDY(s!/!)"
                                          "MYBE(m)"
                                          "IDID(i)"
                                          "|" "CNCL(c@/!)" )
                                (sequence "TODO(t)"
                                          "NEXT(n)"
                                          "PROJ(p)"
                                          "ACTV(a)"
                                          "SMDY(s!/!)"
                                          "MYBE(m)"
                                          "IDID(i)"
                                          "|" "FAIL(f@/!)" )
                                (sequence "TODO(t)"
                                          "NEXT(n)"
                                          "PROJ(p)"
                                          "ACTV(a)"
                                          "SMDY(s!/!)"
                                          "MYBE(m)"
                                          "IDID(i)"
                                          "|" "DONE(d!/!)" )
                                (sequence "WTNG(w@)"
                                          "|" "CNCL(c@/!)" )
                                (sequence "WTNG(w@)"
                                          "|" "FAIL(f@/!)" )
                                (sequence "WTNG(w@)"
                                          "|" "DONE(d!/!)" )) ) )
; see more notes in .emacs_v1_20170214



;(setq org-tag-alist '(("URGENT" . ?u)
;                      ("@ERRANDS" . ?e)))

(setq org-todo-keyword-faces
;      (quote (("PROJ" :foreground "#c7c700" :background "#660286" :weight bold)
;      All of a sudden, the "TODO"s aren't colored correctly; I'll try re-ordering:
;      (quote (("PROJ" :foreground "#c7c700" :background "#580177")
;              ("TODO" :foreground "#c7c700" :background "#1a13e7")
;              ("NEXT" :foreground "#c7c700" :background "#96020b")
;              ("DONE" :foreground "#888888" :background "#1a1a1a")
;	       ("ACTV" :foreground "#96020b" :background "#c7c700" :weight bold)
;              ("WTNG" :foreground "#c7c700" :background "#313000")
;              ("SMDY" :foreground "#c7c700" :background "#000100")
; 	       ("MYBE" :foreground "#888888" :background "#555555")
; 	       ("IDID" :foreground "#96020b" :background "#cccccc")
;              ("CNCL" :foreground "#888888" :background "#1a1a1a")
;	       ("FAIL" :foreground "#B6222b" :background "#1a1a1a"))))
      (quote (("TODO" :foreground "#c7c700" :background "#1a13e7")
              ("NEXT" :foreground "#c7c700" :background "#96020b")
              ("PROJ" :foreground "#c7c700" :background "#580177")
	      ("ACTV" :foreground "#96020b" :background "#c7c700" :weight bold)
              ("SMDY" :foreground "#c7c700" :background "#000100")
 	      ("MYBE" :foreground "#888888" :background "#555555")
 	      ("IDID" :foreground "#96020b" :background "#cccccc")
              ("CNCL" :foreground "#888888" :background "#1a1a1a")
	      ("FAIL" :foreground "#B6222b" :background "#1a1a1a")
              ("DONE" :foreground "#888888" :background "#1a1a1a")
              ("WTNG" :foreground "#c7c700" :background "#313000"))))




;;=================================================
;; SOME KEY-BINDINGS
;;-------------------------------------------------

;; Key-Bindings  --  WARNING  --
;  Apparently, Emacs in text displays (terminals rather than in GUI displays)
;  cannot detect shifted control-key-combinations, or, in other words,
;  cannot distinguish bewteen shifted and unshifted versions of such combinations.
;  See http://ergoemacs.org/emacs/keyboard_shortcuts.html
;; (Is the same issue present with vim?)

;; Provide key-bindings for visual line movement
;;  (up and down in a single logical line that is wrapped or "word wrapped")
(defun line-move-visual-up ()
    "Move up one line in line-move-visual mode."
    (interactive)
    (setq line-move-visual t)
    (previous-line)
    (setq line-move-visual nil)
)
(defun line-move-visual-down ()
    "Move up one line in line-move-visual mode."
    (interactive)
    (setq line-move-visual t)
    (next-line)
    (setq line-move-visual nil)
)
;(global-unset-key (kbd "C-k") )
;(global-set-key   (kbd "C-k") 'line-move-visual-up)
;(global-unset-key (kbd "C-j") )
;(global-set-key   (kbd "C-j") 'line-move-visual-down)

;(require 'bind-key)  ; executed above
(bind-key* "C-k" 'line-move-visual-up)    ; NOW WORKS, SINCE INSTALLED use-package
(bind-key* "C-j" 'line-move-visual-down)  ; NOW WORKS, SINCE INSTALLED use-package
;; or could try defining my own (minor or major) mode keymap,
;; which could be turned on and off with a custom command

; test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text test multi-line text




;;=================================================
;; AUTO-GENERATED
;;-------------------------------------------------


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/org//Projects/Proj_SecurityMotionDetect.org" "~/org//Review/R01_ActionList_Current.org" "~/org//Review/R02_IdeaAction_PendPro.org" "~/org//Review/R03_IdeaAction_PendChr.org" "~/org//Review/R04_IdeaAction_PendFun.org" "~/org//Review/R05_IdeaAction_DatedRv.org" "~/org//Review/More/R06_IdeaAction_SmdyMyb.org"))))
