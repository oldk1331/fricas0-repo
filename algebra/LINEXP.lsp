
(DEFPARAMETER |LinearlyExplicitOver;CAT| 'NIL) 

(DECLAIM (NOTINLINE |LinearlyExplicitOver;|)) 

(DEFPARAMETER |LinearlyExplicitOver;AL| 'NIL) 

(DEFUN |LinearlyExplicitOver| (|t#1|)
  (LET (#1=#:G105 (#2=#:G106 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |LinearlyExplicitOver;AL|)) (CDR #1#))
          (T
           (SETQ |LinearlyExplicitOver;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|LinearlyExplicitOver;| #2#)))
                            |LinearlyExplicitOver;AL|))
           #1#)))) 

(DEFUN |LinearlyExplicitOver;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (COND (|LinearlyExplicitOver;CAT|)
                                    ('T
                                     (LETT |LinearlyExplicitOver;CAT|
                                           (|Join| (|Ring|)
                                                   (|mkCategory|
                                                    '(((|reducedSystem|
                                                        ((|Matrix| |t#1|)
                                                         (|Matrix| $)))
                                                       T)
                                                      ((|reducedSystem|
                                                        ((|Record|
                                                          (|:| |mat|
                                                               (|Matrix|
                                                                |t#1|))
                                                          (|:| |vec|
                                                               (|Vector|
                                                                |t#1|)))
                                                         (|Matrix| $)
                                                         (|Vector| $)))
                                                       T))
                                                    NIL
                                                    '((|Matrix| $) (|Vector| $)
                                                      (|Matrix| |t#1|))
                                                    NIL))
                                           . #2=(|LinearlyExplicitOver|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|LinearlyExplicitOver| (|devaluate| |t#1|)))))) 
