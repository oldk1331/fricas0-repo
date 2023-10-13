
(/VERSIONCHECK 2) 

(DEFPARAMETER |GradedAlgebra;CAT| 'NIL) 

(DEFPARAMETER |GradedAlgebra;AL| 'NIL) 

(DEFUN |GradedAlgebra| (&REST #1=#:G126)
  (LET (#2=#:G127)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |GradedAlgebra;AL|))
      (CDR #2#))
     (T
      (SETQ |GradedAlgebra;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|GradedAlgebra;| #1#)))
                       |GradedAlgebra;AL|))
      #2#)))) 

(DEFUN |GradedAlgebra;| (|t#1| |t#2|)
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR '(|t#1| |t#2|)
                      (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                (COND (|GradedAlgebra;CAT|)
                      ('T
                       (LETT |GradedAlgebra;CAT|
                             (|Join| (|GradedModule| '|t#1| '|t#2|)
                                     (|RetractableTo| '|t#1|)
                                     (|mkCategory|
                                      '(((|One| ($) |constant|) T)
                                        ((|product| ($ $ $)) T))
                                      NIL 'NIL NIL))
                             . #2=(|GradedAlgebra|)))))
               . #2#)
       (SETELT #1# 0
               (LIST '|GradedAlgebra| (|devaluate| |t#1|)
                     (|devaluate| |t#2|))))))) 
