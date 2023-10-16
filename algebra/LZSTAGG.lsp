
(DEFPARAMETER |LazyStreamAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |LazyStreamAggregate;|)) 

(DEFPARAMETER |LazyStreamAggregate;AL| 'NIL) 

(DEFUN |LazyStreamAggregate| (|t#1|)
  (LET (#1=#:G201 (#2=#:G202 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |LazyStreamAggregate;AL|)) (CDR #1#))
          (T
           (SETQ |LazyStreamAggregate;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|LazyStreamAggregate;| #2#)))
                            |LazyStreamAggregate;AL|))
           #1#)))) 

(DEFUN |LazyStreamAggregate;| (|t#1|)
  (SPROG ((#1=#:G200 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (COND (|LazyStreamAggregate;CAT|)
                                    ('T
                                     (LETT |LazyStreamAggregate;CAT|
                                           (|Join| (|StreamAggregate| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|remove|
                                                        ($
                                                         (|Mapping| (|Boolean|)
                                                                    |t#1|)
                                                         $))
                                                       T)
                                                      ((|select|
                                                        ($
                                                         (|Mapping| (|Boolean|)
                                                                    |t#1|)
                                                         $))
                                                       T)
                                                      ((|explicitEntries?|
                                                        ((|Boolean|) $))
                                                       T)
                                                      ((|explicitlyEmpty?|
                                                        ((|Boolean|) $))
                                                       T)
                                                      ((|lazy?|
                                                        ((|Boolean|) $))
                                                       T)
                                                      ((|lazyEvaluate| ($ $))
                                                       T)
                                                      ((|frst| (|t#1| $)) T)
                                                      ((|rst| ($ $)) T)
                                                      ((|numberOfComputedEntries|
                                                        ((|NonNegativeInteger|)
                                                         $))
                                                       T)
                                                      ((|extend|
                                                        ($ $ (|Integer|)))
                                                       T)
                                                      ((|complete| ($ $)) T))
                                                    NIL
                                                    '((|Integer|)
                                                      (|NonNegativeInteger|)
                                                      (|Boolean|))
                                                    NIL))
                                           . #2=(|LazyStreamAggregate|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|LazyStreamAggregate| (|devaluate| |t#1|)))))) 
