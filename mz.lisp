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
;;;; program (as defined below in line xx) must be changed.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; PART 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; "Prelude"

;;; Section 1. Introduction.
;;; First we have all of the most commonly used and reused functions, macros, variables, and
;;; constants. Things that are *truly* trivial are deferred until they are necessary or until 
;;; everything else has been done.
