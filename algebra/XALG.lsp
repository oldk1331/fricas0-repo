
(DEFPARAMETER |XAlgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |XAlgebra;|)) 

(DEFPARAMETER |XAlgebra;AL| 'NIL) 

(DEFUN |XAlgebra| (|t#1|)
  (LET (#1=#:G105 (#2=#:G106 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |XAlgebra;AL|)) (CDR #1#))
          (T
           (SETQ |XAlgebra;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|XAlgebra;| #2#)))
                            |XAlgebra;AL|))
           #1#)))) 

(DEFUN |XAlgebra;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (COND (|XAlgebra;CAT|)
                                    ('T
                                     (LETT |XAlgebra;CAT|
                                           (|Join| (|Ring|)
                                                   (|BiModule| '|t#1| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|coerce| ($ |t#1|)) T))
                                                    '(((|Algebra| |t#1|)
                                                       (|has| |t#1|
                                                              (|CommutativeRing|))))
                                                    NIL NIL)))))))
           (SETELT #1# 0 (LIST '|XAlgebra| |t#1|))))) 
