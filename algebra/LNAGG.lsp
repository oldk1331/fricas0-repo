
(DEFPARAMETER |LinearAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |LinearAggregate;|)) 

(DEFPARAMETER |LinearAggregate;AL| 'NIL) 

(DEFUN |LinearAggregate| (#1=#:G106)
  (LET (#2=#:G107)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |LinearAggregate;AL|)) (CDR #2#))
     (T
      (SETQ |LinearAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|LinearAggregate;| #1#)))
                       |LinearAggregate;AL|))
      #2#)))) 

(DEFUN |LinearAggregate;| (|t#1|)
  (PROG (#1=#:G105)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (|sublisV| (PAIR '(#2=#:G104) (LIST '(|Integer|)))
                                     (COND (|LinearAggregate;CAT|)
                                           ('T
                                            (LETT |LinearAggregate;CAT|
                                                  (|Join|
                                                   (|IndexedAggregate| '#2#
                                                                       '|t#1|)
                                                   (|Collection| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|new|
                                                        ($
                                                         (|NonNegativeInteger|)
                                                         |t#1|))
                                                       T)
                                                      ((|concat| ($ $ |t#1|))
                                                       T)
                                                      ((|concat| ($ |t#1| $))
                                                       T)
                                                      ((|concat| ($ $ $)) T)
                                                      ((|concat|
                                                        ($ (|List| $)))
                                                       T)
                                                      ((|map|
                                                        ($
                                                         (|Mapping| |t#1| |t#1|
                                                                    |t#1|)
                                                         $ $))
                                                       T)
                                                      ((|elt|
                                                        ($ $
                                                         (|UniversalSegment|
                                                          (|Integer|))))
                                                       T)
                                                      ((|delete|
                                                        ($ $ (|Integer|)))
                                                       T)
                                                      ((|delete|
                                                        ($ $
                                                         (|UniversalSegment|
                                                          (|Integer|))))
                                                       T)
                                                      ((|insert|
                                                        ($ |t#1| $
                                                         (|Integer|)))
                                                       T)
                                                      ((|insert|
                                                        ($ $ $ (|Integer|)))
                                                       T)
                                                      ((|setelt|
                                                        (|t#1| $
                                                         (|UniversalSegment|
                                                          (|Integer|))
                                                         |t#1|))
                                                       (|has| $
                                                              (|shallowlyMutable|))))
                                                    NIL
                                                    '((|UniversalSegment|
                                                       (|Integer|))
                                                      (|Integer|) (|List| $)
                                                      (|NonNegativeInteger|))
                                                    NIL))
                                                  . #3=(|LinearAggregate|))))))
               . #3#)
       (SETELT #1# 0 (LIST '|LinearAggregate| (|devaluate| |t#1|))))))) 
