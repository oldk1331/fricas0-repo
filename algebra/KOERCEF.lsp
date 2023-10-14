
(DECLAIM (NOTINLINE |CoercibleFrom;|)) 

(DEFPARAMETER |CoercibleFrom;AL| 'NIL) 

(DEFUN |CoercibleFrom| (#1=#:G104)
  (LET (#2=#:G105)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |CoercibleFrom;AL|)) (CDR #2#))
     (T
      (SETQ |CoercibleFrom;AL|
              (|cons5| (CONS #3# (SETQ #2# (|CoercibleFrom;| #1#)))
                       |CoercibleFrom;AL|))
      #2#)))) 

(DEFUN |CoercibleFrom;| (|t#1|)
  (SPROG ((#1=#:G103 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (|Join|
                               (|mkCategory| '(((|coerce| ($ |t#1|)) T)) NIL
                                             'NIL NIL)))
                   |CoercibleFrom|)
           (SETELT #1# 0 (LIST '|CoercibleFrom| (|devaluate| |t#1|)))))) 
