
(DEFPARAMETER |TableAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |TableAggregate;|)) 

(DEFPARAMETER |TableAggregate;AL| 'NIL) 

(DEFUN |TableAggregate| (|t#1| |t#2|)
  (LET (#1=#:G112 (#2=#:G113 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND ((SETQ #1# (|assoc| #2# |TableAggregate;AL|)) (CDR #1#))
          (T
           (SETQ |TableAggregate;AL|
                   (|cons5|
                    (CONS #2# (SETQ #1# (APPLY #'|TableAggregate;| #2#)))
                    |TableAggregate;AL|))
           #1#)))) 

(DEFUN |TableAggregate;| (|t#1| |t#2|)
  (SPROG ((#1=#:G111 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1| |t#2|) (LIST |t#1| |t#2|))
                              (COND (|TableAggregate;CAT|)
                                    ('T
                                     (LETT |TableAggregate;CAT|
                                           (|Join|
                                            (|KeyedDictionary| '|t#1| '|t#2|)
                                            (|IndexedAggregate| '|t#1| '|t#2|)
                                            (|mkCategory|
                                             '(((|setelt!|
                                                 (|t#2| $ |t#1| |t#2|))
                                                T)
                                               ((|table| ($)) T)
                                               ((|table|
                                                 ($
                                                  (|List|
                                                   (|Record| (|:| |key| |t#1|)
                                                             (|:| |entry|
                                                                  |t#2|)))))
                                                T)
                                               ((|map|
                                                 ($
                                                  (|Mapping| |t#2| |t#2| |t#2|)
                                                  $ $))
                                                T))
                                             NIL
                                             '((|List|
                                                (|Record| (|:| |key| |t#1|)
                                                          (|:| |entry|
                                                               |t#2|))))
                                             NIL))
                                           . #2=(|TableAggregate|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|TableAggregate| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
