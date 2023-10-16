
(DEFPARAMETER |LeftAlgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |LeftAlgebra;|)) 

(DEFPARAMETER |LeftAlgebra;AL| 'NIL) 

(DEFUN |LeftAlgebra| (|t#1|)
  (LET (#1=#:G105 (#2=#:G106 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |LeftAlgebra;AL|)) (CDR #1#))
          (T
           (SETQ |LeftAlgebra;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|LeftAlgebra;| #2#)))
                            |LeftAlgebra;AL|))
           #1#)))) 

(DEFUN |LeftAlgebra;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (COND (|LeftAlgebra;CAT|)
                                    ('T
                                     (LETT |LeftAlgebra;CAT|
                                           (|Join| (|Ring|)
                                                   (|LeftModule| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|coerce| ($ |t#1|)) T))
                                                    NIL NIL NIL)))))))
           (SETELT #1# 0 (LIST '|LeftAlgebra| |t#1|))))) 
