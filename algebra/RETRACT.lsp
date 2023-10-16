
(DECLAIM (NOTINLINE |RetractableTo;|)) 

(DEFPARAMETER |RetractableTo;AL| 'NIL) 

(DEFUN |RetractableTo| (|t#1|)
  (LET (#1=#:G105 (#2=#:G106 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |RetractableTo;AL|)) (CDR #1#))
          (T
           (SETQ |RetractableTo;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|RetractableTo;| #2#)))
                            |RetractableTo;AL|))
           #1#)))) 

(DEFUN |RetractableTo;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (|Join|
                               (|mkCategory|
                                '(((|coerce| ($ |t#1|)) T)
                                  ((|retractIfCan|
                                    ((|Union| |t#1| "failed") $))
                                   T)
                                  ((|retract| (|t#1| $)) T))
                                NIL NIL NIL)))
                   |RetractableTo|)
           (SETELT #1# 0 (LIST '|RetractableTo| |t#1|))))) 
