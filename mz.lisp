;;;; Source code for the mz-program.
;;;; This file is structured and written to be *read* by humans, not necessarily by machines.
;;;; Common Lisp lends itself well to quasi-Literate Programming, and so I've taken advantage of
;;;; this.

;;;; I have structured this overall into Parts and Sections. A part is a large, logical division of
;;;; content. A section is a similar division, but at a much smaller level. Other divisions not
;;;; explicitly named are designated by a row of 100 semicolons (the maximum length of a column here
;;;; is 100 characters).

;;;; This file and all ideas that it contains are placed entirely into the public domain by its
;;;; author, that is, any person or entity may do whatever they like with it or with the mz-program;
;;;; however, if any modification is made, the name of this file ("mz.lisp") and the name of the
;;;; program (as defined below in line 30) must be changed.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; PART 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; "Prelude"

;;; Section 1. Introduction.
;;; This is the mz-program, a system for musical composition and notation. It has been written in a
;;; strict subset of the Common Lisp language, so as to be completely portable (provided that there
;;; is a conforming implementation of Common Lisp for the target platform). Lisp code by itself is
;;; very expressive and is in general quite easy to follow; but some of the algorithms used in the
;;; mz-program are *very* complicated, hence the "literate" style used here.
;;; We shall begin by defining some important constants and variables that are used all throughout
;;; the execution of the mz-program.

;;; This is printed when the mz-program starts.
(defconstant +version+ 0)
(defconstant +banner+ (format nil "This is the mz-program, version ~a." 0))

;;; These are seperate because the filename is used often.
(defparameter *input-file-name* nil)
(defparameter *input-file* nil) ; here will go the actual file object

;;; The possibilities for this variable are defined later with all the error codes.
(defparameter *exit-code* 0)

;;; These are various ``switches'' that change the behaviour of some parts of the program.
;;; Most of these correspond directly to a command that you can give the mz-program.
(defparameter *outputting* t) ; are we producing output?
(defparameter *normalizing* nil) ; are we going to normalize the input file?
(defparameter *tracing-level* 1) ; how verbose will we be?
(defparameter *logging-level* 1) ; how verbose will the .log file be?
(defparameter *pausing-level* 0) ; when will we pause processing?

;;; Prompts for interaction
(defconstant +file-prompt+ ">>") ; first prompt
(defconstant +main-prompt+ ">")
(defconstant +error-prompt+ "#")

(defconstant +indication-char+ ".") ; For showing context and indentation. The precise use of this
                                        ; will become apparent later

(defparameter *interacting* nil) ; are we currently running interactively? (note that this value is
                                        ; not referring to the first file prompt)

;;; I'd like to take an aside here to say that, to me, strings inline in a program are no better than
;;; magic numbers. This is why most strings are declared as a constant before they are used.

;;; Common Lisp does not provide a standard way to exit the program, so we have a function that does
;;; literally nothing. The final thing after files have been closed and output has been written is
;;; always text being printed, which is handled by FINAL-PRINT; internally, this uses DUMMY.

(defun dummy ()
  nil)

;;; Since all that FINAL-PRINT does is, well, print, the call to DUMMY is not necessarily necessary,
;;; but to keep things semantically sound, it's used anyway.

(defun final-print (str)
  (mz-print-ln str) ; defined later
  (dummy))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; The PRELUDE function is where things actually begin to happen. It handles getting an input
;;; filename and setting various switches.

(defun parse-input-file (s)
  (format t s))

(defun parse-input-path (s)
  (format t s))

(defun prompt-for-input (p)
  (format t "~a " p)
  (read-line))

(defun mz-print-ln (s)
  (format t "~&~a~%" s))

;;; We print +BANNER+ if FIRST-TIME is T.
(defun prelude (first-time)
  (if first-time
      (mz-print-ln +banner+)
      ())
  (let ((input (prompt-for-input +file-prompt+))) 
    (cond ((equal input "\\relax")
           (setf *interacting* t) ; we are now in interaction
           nil)
          ((equal input "\\quit")
           (mz-print-ln "(No output produced)")
           (final-print "Goodbye!"))
          ((equal input "\\path")
           (parse-input-path (prompt-for-input "Path >"))) ; we interpret the next input as a path to a
                                                           ; file
          ((equal input "")                                
           (mz-print-ln (concatenate 'string
                                     "Please enter a filename (or \\path <enter> and then a full "
                                     "path to a file), \\relax to go straight into interaction, "
                                     "or \\quit to exit."))
           (prelude nil))
          (t
           (parse-input-file input)))))
