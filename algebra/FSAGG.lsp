
(DEFPARAMETER |FiniteSetAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FiniteSetAggregate;|)) 

(DEFPARAMETER |FiniteSetAggregate;AL| 'NIL) 

(DEFUN |FiniteSetAggregate| (|t#1|)
  (LET (#1=#:G112 (#2=#:G113 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |FiniteSetAggregate;AL|)) (CDR #1#))
          (T
           (SETQ |FiniteSetAggregate;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|FiniteSetAggregate;| #2#)))
                            |FiniteSetAggregate;AL|))
           #1#)))) 

(DEFUN |FiniteSetAggregate;| (|t#1|)
  (SPROG ((#1=#:G111 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (COND (|FiniteSetAggregate;CAT|)
                                    ('T
                                     (LETT |FiniteSetAggregate;CAT|
                                           (|Join| (|Dictionary| '|t#1|)
                                                   (|SetAggregate| '|t#1|)
                                                   (|finiteAggregate|)
                                                   (|mkCategory|
                                                    '(((|cardinality|
                                                        ((|NonNegativeInteger|)
                                                         $))
                                                       T)
                                                      ((|complement| ($ $))
                                                       (|has| |t#1|
                                                              (|Finite|)))
                                                      ((|universe| ($))
                                                       (|has| |t#1|
                                                              (|Finite|)))
                                                      ((|max| (|t#1| $))
                                                       (|has| |t#1|
                                                              (|OrderedSet|)))
                                                      ((|min| (|t#1| $))
                                                       (|has| |t#1|
                                                              (|OrderedSet|))))
                                                    '(((|Finite|)
                                                       (|has| |t#1|
                                                              (|Finite|)))
                                                      ((|Comparable|)
                                                       (|has| |t#1|
                                                              (|Comparable|))))
                                                    '((|NonNegativeInteger|))
                                                    NIL))
                                           . #2=(|FiniteSetAggregate|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|FiniteSetAggregate| (|devaluate| |t#1|)))))) 
