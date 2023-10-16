
(DEFPARAMETER |BiCPO;CAT| 'NIL) 

(DECLAIM (NOTINLINE |BiCPO;|)) 

(DEFPARAMETER |BiCPO;AL| 'NIL) 

(DEFUN |BiCPO| (|t#1|)
  (LET (#1=#:G105 (#2=#:G106 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |BiCPO;AL|)) (CDR #1#))
          (T
           (SETQ |BiCPO;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|BiCPO;| #2#))) |BiCPO;AL|))
           #1#)))) 

(DEFUN |BiCPO;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (COND (|BiCPO;CAT|)
                                    ('T
                                     (LETT |BiCPO;CAT|
                                           (|Join| (|Dcpo| '|t#1|)
                                                   (|CoDcpo| '|t#1|))
                                           . #2=(|BiCPO|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|BiCPO| (|devaluate| |t#1|)))))) 
