;;; We put this in separate file to avoid problems with compilation.
(make-package "FRICAS-LISP" 
     :use (list (or (find-package "COMMON-LISP")
                    "LISP")))
#+:sbcl
(eval-when (:execute :compile-toplevel :load-toplevel)
    (setf SB-IMPL::*DEFAULT-EXTERNAL-FORMAT* :LATIN-1)
    (ignore-errors (require "SB-SPROF")))

#+:cmu
(eval-when (:execute :compile-toplevel :load-toplevel)
    (setf STREAM::*DEFAULT-EXTERNAL-FORMAT* :ISO8859-1))

#+:poplog
(eval-when (:compile-toplevel :execute :load-toplevel)
      (set-syntax-from-char #\@ #\@))

(in-package "FRICAS-LISP")
;;; Aldor 1.1.0 and before produces IN-PACKAGE statements with :use options.
;;; These are not allowed in ANSI Common Lisp, so we have to provide our own
;;; IN-PACKAGE.  The :use options can actually be ignored, so we do not use
;;; (defpackage package options)
;;; (in-package package)
#+:cmu
(shadow "UNION" "FRICAS-LISP")
#+:cmu
(shadow "NUNION" "FRICAS-LISP")

#-gcl
(shadow "IN-PACKAGE" "FRICAS-LISP")
#-gcl
(defmacro IN-PACKAGE (package &rest options) 
  `(COMMON-LISP:IN-PACKAGE ,package))

#+gcl
(shadow "QUIT")

;;; We use uninterned symbols because at this point we do not
;;; want to add symbols to FRICAS-LISP
(let ((#1=#:ls nil))
    (do-symbols (#2=#:el "FRICAS-LISP") (setf #1# (cons #2# #1#)))
    (mapcar (lambda (#3=#:x) (export (list #3#))) #1#)
)

(export '(quit chdir |getEnv| |getCLArgs| |load_quietly| get-current-directory
          fricas-probe-file trim-directory-name pad-directory-name
          file-kind makedir fricas-compile-file load-maybe-compiling
          maybe-compile DEFCONST exit-with-status MEMQ |quiet_load_alien|
          |handle_input_file| |handle_output_file| |maybe_delete_file|
          |remove_directory| |writeablep| |openServer| |sockGetInt|
          |sockSendInt| |sockSendString| |sockGetFloat| |sockSendFloat|
          |serverSwitch| |sockSendSignal| |sockGetStringFrom|))

#+:GCL
(progn
    (import '(LISP::LAMBDA-CLOSURE))
    (export '(LISP::LAMBDA-CLOSURE))
)
#+:ecl 
(progn
    (require 'cmp)
    (eval-when (:execute :compile-toplevel :load-toplevel)
         (proclaim '(optimize (safety 1))))
)
#+:openmcl
(eval-when (:execute :compile-toplevel :load-toplevel)
      (setf *features* (delete :CCL *features*)))

;;; Package containing Shoe to Lisp translator
(make-package "BOOTTRAN" :use '("FRICAS-LISP"))

;;; Main FriCAS package.  The interpreter and the algebra are run
;;; after switching to the boot package (in-package "BOOT") so any
;;; symbol that the interpreter or algebra uses has to appear here.
(make-package "BOOT" :use '("FRICAS-LISP"))

(in-package "BOOT")

(import '(BOOTTRAN::BOOTTOCLC BOOTTRAN::STTOSEX
          BOOTTRAN::|shoeRemovebootIfNec|))

;;; Package containing support routines for code generated
;;; by Aldor compiler.
(make-package "FOAM" :use '("FRICAS-LISP"))

;;; Package for code output by Aldor.
(make-package "FOAM-USER" :use '("FRICAS-LISP" "FOAM"))
