
(DECLAIM (NOTINLINE |CoercibleFrom;|)) 

(DEFPARAMETER |CoercibleFrom;AL| 'NIL) 

(DEFUN |CoercibleFrom| (|t#1|)
  (LET (#1=#:G105 (#2=#:G106 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |CoercibleFrom;AL|)) (CDR #1#))
          (T
           (SETQ |CoercibleFrom;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|CoercibleFrom;| #2#)))
                            |CoercibleFrom;AL|))
           #1#)))) 

(DEFUN |CoercibleFrom;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (|Join|
                               (|mkCategory| '(((|coerce| ($ |t#1|)) T)) NIL
                                             'NIL NIL)))
                   |CoercibleFrom|)
           (SETELT #1# 0 (LIST '|CoercibleFrom| (|devaluate| |t#1|)))))) 
