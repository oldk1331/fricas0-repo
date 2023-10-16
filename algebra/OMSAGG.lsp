
(DEFPARAMETER |OrderedMultisetAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |OrderedMultisetAggregate;|)) 

(DEFPARAMETER |OrderedMultisetAggregate;AL| 'NIL) 

(DEFUN |OrderedMultisetAggregate| (|t#1|)
  (LET (#1=#:G105 (#2=#:G106 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |OrderedMultisetAggregate;AL|)) (CDR #1#))
          (T
           (SETQ |OrderedMultisetAggregate;AL|
                   (|cons5|
                    (CONS #2# (SETQ #1# (|OrderedMultisetAggregate;| #2#)))
                    |OrderedMultisetAggregate;AL|))
           #1#)))) 

(DEFUN |OrderedMultisetAggregate;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (COND (|OrderedMultisetAggregate;CAT|)
                                    ('T
                                     (LETT |OrderedMultisetAggregate;CAT|
                                           (|Join| (|MultisetAggregate| '|t#1|)
                                                   (|PriorityQueueAggregate|
                                                    '|t#1|)
                                                   (|mkCategory|
                                                    '(((|min| (|t#1| $)) T))
                                                    NIL 'NIL NIL))
                                           . #2=(|OrderedMultisetAggregate|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|OrderedMultisetAggregate| (|devaluate| |t#1|)))))) 
