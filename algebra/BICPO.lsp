
(DEFPARAMETER |BiCPO;CAT| 'NIL) 

(DECLAIM (NOTINLINE |BiCPO;|)) 

(DEFPARAMETER |BiCPO;AL| 'NIL) 

(DEFUN |BiCPO| (|t#1|)
  (LET (#1=#:G1 (#2=#:G2 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |BiCPO;AL|)) (CDR #1#))
          (T
           (SETQ |BiCPO;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|BiCPO;| #2#))) |BiCPO;AL|))
           #1#)))) 

(DEFUN |BiCPO;| (|t#1|)
  (SPROG ((#1=#:G0 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(|t#1|) (LIST |t#1|)
                                   (COND (|BiCPO;CAT|)
                                         ('T
                                          (LETT |BiCPO;CAT|
                                                (|Join| (|Dcpo| '|t#1|)
                                                        (|CoDcpo| '|t#1|)))))))
           (SETELT #1# 0 (LIST '|BiCPO| |t#1|))))) 
