
(DEFPARAMETER |StreamAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |StreamAggregate;|)) 

(DEFPARAMETER |StreamAggregate;AL| 'NIL) 

(DEFUN |StreamAggregate| (|t#1|)
  (LET (#1=#:G115 (#2=#:G116 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |StreamAggregate;AL|)) (CDR #1#))
          (T
           (SETQ |StreamAggregate;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|StreamAggregate;| #2#)))
                            |StreamAggregate;AL|))
           #1#)))) 

(DEFUN |StreamAggregate;| (|t#1|)
  (SPROG ((#1=#:G114 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (COND (|StreamAggregate;CAT|)
                                    ('T
                                     (LETT |StreamAggregate;CAT|
                                           (|Join|
                                            (|UnaryRecursiveAggregate| '|t#1|)
                                            (|LinearAggregate| '|t#1|)
                                            (|mkCategory|
                                             '(((|explicitlyFinite?|
                                                 ((|Boolean|) $))
                                                T)
                                               ((|possiblyInfinite?|
                                                 ((|Boolean|) $))
                                                T))
                                             NIL '((|Boolean|)) NIL))
                                           . #2=(|StreamAggregate|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|StreamAggregate| (|devaluate| |t#1|)))))) 
