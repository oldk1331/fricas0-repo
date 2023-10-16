
(DEFPARAMETER |StackAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |StackAggregate;|)) 

(DEFPARAMETER |StackAggregate;AL| 'NIL) 

(DEFUN |StackAggregate| (|t#1|)
  (LET (#1=#:G105 (#2=#:G106 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |StackAggregate;AL|)) (CDR #1#))
          (T
           (SETQ |StackAggregate;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|StackAggregate;| #2#)))
                            |StackAggregate;AL|))
           #1#)))) 

(DEFUN |StackAggregate;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (COND (|StackAggregate;CAT|)
                                    ('T
                                     (LETT |StackAggregate;CAT|
                                           (|Join| (|BagAggregate| '|t#1|)
                                                   (|finiteAggregate|)
                                                   (|mkCategory|
                                                    '(((|push!|
                                                        (|t#1| |t#1| $))
                                                       T)
                                                      ((|pop!| (|t#1| $)) T)
                                                      ((|top| (|t#1| $)) T))
                                                    NIL 'NIL NIL))
                                           . #2=(|StackAggregate|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|StackAggregate| (|devaluate| |t#1|)))))) 
