
(DEFPARAMETER |FiniteLinearAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FiniteLinearAggregate;|)) 

(DEFPARAMETER |FiniteLinearAggregate;AL| 'NIL) 

(DEFUN |FiniteLinearAggregate| (#1=#:G105)
  (LET (#2=#:G106)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |FiniteLinearAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |FiniteLinearAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|FiniteLinearAggregate;| #1#)))
                       |FiniteLinearAggregate;AL|))
      #2#)))) 

(DEFUN |FiniteLinearAggregate;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|FiniteLinearAggregate;CAT|)
                                    ('T
                                     (LETT |FiniteLinearAggregate;CAT|
                                           (|Join| (|LinearAggregate| '|t#1|)
                                                   (|finiteAggregate|)
                                                   (|mkCategory|
                                                    '(((|merge|
                                                        ($
                                                         (|Mapping| (|Boolean|)
                                                                    |t#1|
                                                                    |t#1|)
                                                         $ $))
                                                       T)
                                                      ((|reverse| ($ $)) T)
                                                      ((|sort|
                                                        ($
                                                         (|Mapping| (|Boolean|)
                                                                    |t#1|
                                                                    |t#1|)
                                                         $))
                                                       T)
                                                      ((|sorted?|
                                                        ((|Boolean|)
                                                         (|Mapping| (|Boolean|)
                                                                    |t#1|
                                                                    |t#1|)
                                                         $))
                                                       T)
                                                      ((|position|
                                                        ((|Integer|)
                                                         (|Mapping| (|Boolean|)
                                                                    |t#1|)
                                                         $))
                                                       T)
                                                      ((|position|
                                                        ((|Integer|) |t#1| $))
                                                       (|has| |t#1|
                                                              (|BasicType|)))
                                                      ((|position|
                                                        ((|Integer|) |t#1| $
                                                         (|Integer|)))
                                                       (|has| |t#1|
                                                              (|BasicType|)))
                                                      ((|merge| ($ $ $))
                                                       (|has| |t#1|
                                                              (|OrderedSet|)))
                                                      ((|sort| ($ $))
                                                       (|has| |t#1|
                                                              (|OrderedSet|)))
                                                      ((|sorted?|
                                                        ((|Boolean|) $))
                                                       (|has| |t#1|
                                                              (|OrderedSet|)))
                                                      ((|copyInto!|
                                                        ($ $ $ (|Integer|)))
                                                       (|has| $
                                                              (|shallowlyMutable|)))
                                                      ((|reverse!| ($ $))
                                                       (|has| $
                                                              (|shallowlyMutable|)))
                                                      ((|sort!|
                                                        ($
                                                         (|Mapping| (|Boolean|)
                                                                    |t#1|
                                                                    |t#1|)
                                                         $))
                                                       (|has| $
                                                              (|shallowlyMutable|)))
                                                      ((|sort!| ($ $))
                                                       (AND
                                                        (|has| |t#1|
                                                               (|OrderedSet|))
                                                        (|has| $
                                                               (|shallowlyMutable|)))))
                                                    '(((|OrderedSet|)
                                                       (|has| |t#1|
                                                              (|OrderedSet|))))
                                                    '((|Integer|) (|Boolean|))
                                                    NIL))
                                           . #2=(|FiniteLinearAggregate|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|FiniteLinearAggregate| (|devaluate| |t#1|)))))) 
