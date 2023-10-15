
(DEFPARAMETER |Dcpo;CAT| 'NIL) 

(DECLAIM (NOTINLINE |Dcpo;|)) 

(DEFPARAMETER |Dcpo;AL| 'NIL) 

(DEFUN |Dcpo| (#1=#:G105)
  (LET (#2=#:G106)
    (COND ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |Dcpo;AL|)) (CDR #2#))
          (T
           (SETQ |Dcpo;AL|
                   (|cons5| (CONS #3# (SETQ #2# (|Dcpo;| #1#))) |Dcpo;AL|))
           #2#)))) 

(DEFUN |Dcpo;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|Dcpo;CAT|)
                                    ('T
                                     (LETT |Dcpo;CAT|
                                           (|Join| (|Poset| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|join|
                                                        ((|NonNegativeInteger|)
                                                         $
                                                         (|NonNegativeInteger|)
                                                         (|NonNegativeInteger|)))
                                                       T))
                                                    NIL
                                                    '((|NonNegativeInteger|))
                                                    NIL))
                                           . #2=(|Dcpo|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|Dcpo| (|devaluate| |t#1|)))))) 
