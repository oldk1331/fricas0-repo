
(DEFPARAMETER |FullyLinearlyExplicitOver;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FullyLinearlyExplicitOver;|)) 

(DEFPARAMETER |FullyLinearlyExplicitOver;AL| 'NIL) 

(DEFUN |FullyLinearlyExplicitOver| (#1=#:G105)
  (LET (#2=#:G106)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |FullyLinearlyExplicitOver;AL|))
      (CDR #2#))
     (T
      (SETQ |FullyLinearlyExplicitOver;AL|
              (|cons5| (CONS #3# (SETQ #2# (|FullyLinearlyExplicitOver;| #1#)))
                       |FullyLinearlyExplicitOver;AL|))
      #2#)))) 

(DEFUN |FullyLinearlyExplicitOver;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|FullyLinearlyExplicitOver;CAT|)
                                    ('T
                                     (LETT |FullyLinearlyExplicitOver;CAT|
                                           (|Join|
                                            (|LinearlyExplicitOver| '|t#1|)
                                            (|mkCategory| NIL
                                                          '(((|LinearlyExplicitOver|
                                                              (|Integer|))
                                                             (|has| |t#1|
                                                                    (|LinearlyExplicitOver|
                                                                     (|Integer|)))))
                                                          'NIL NIL))
                                           . #2=(|FullyLinearlyExplicitOver|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|FullyLinearlyExplicitOver| (|devaluate| |t#1|)))))) 
