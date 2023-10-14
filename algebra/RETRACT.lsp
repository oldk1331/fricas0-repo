
(DECLAIM (NOTINLINE |RetractableTo;|)) 

(DEFPARAMETER |RetractableTo;AL| 'NIL) 

(DEFUN |RetractableTo| (#1=#:G104)
  (LET (#2=#:G105)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |RetractableTo;AL|)) (CDR #2#))
     (T
      (SETQ |RetractableTo;AL|
              (|cons5| (CONS #3# (SETQ #2# (|RetractableTo;| #1#)))
                       |RetractableTo;AL|))
      #2#)))) 

(DEFUN |RetractableTo;| (|t#1|)
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (|Join|
                           (|mkCategory|
                            '(((|coerce| ($ |t#1|)) T)
                              ((|retractIfCan| ((|Union| |t#1| "failed") $)) T)
                              ((|retract| (|t#1| $)) T))
                            NIL 'NIL NIL)))
               |RetractableTo|)
       (SETELT #1# 0 (LIST '|RetractableTo| (|devaluate| |t#1|))))))) 
