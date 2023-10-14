
(DEFPARAMETER |Algebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |Algebra;|)) 

(DEFPARAMETER |Algebra;AL| 'NIL) 

(DEFUN |Algebra| (#1=#:G105)
  (LET (#2=#:G106)
    (COND ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |Algebra;AL|)) (CDR #2#))
          (T
           (SETQ |Algebra;AL|
                   (|cons5| (CONS #3# (SETQ #2# (|Algebra;| #1#)))
                            |Algebra;AL|))
           #2#)))) 

(DEFUN |Algebra;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|Algebra;CAT|)
                                    ('T
                                     (LETT |Algebra;CAT|
                                           (|Join| (|Ring|) (|Module| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|coerce| ($ |t#1|)) T))
                                                    NIL 'NIL NIL))
                                           . #2=(|Algebra|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|Algebra| (|devaluate| |t#1|)))))) 
