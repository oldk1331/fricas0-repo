
(DEFPARAMETER |LieAlgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |LieAlgebra;|)) 

(DEFPARAMETER |LieAlgebra;AL| 'NIL) 

(DEFUN |LieAlgebra| (|t#1|)
  (LET (#1=#:G105 (#2=#:G106 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |LieAlgebra;AL|)) (CDR #1#))
          (T
           (SETQ |LieAlgebra;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|LieAlgebra;| #2#)))
                            |LieAlgebra;AL|))
           #1#)))) 

(DEFUN |LieAlgebra;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (COND (|LieAlgebra;CAT|)
                                    ('T
                                     (LETT |LieAlgebra;CAT|
                                           (|Join| (|Module| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|construct| ($ $ $)) T)
                                                      ((/ ($ $ |t#1|))
                                                       (|has| |t#1|
                                                              (|Field|))))
                                                    NIL 'NIL NIL))
                                           . #2=(|LieAlgebra|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|LieAlgebra| (|devaluate| |t#1|)))))) 
