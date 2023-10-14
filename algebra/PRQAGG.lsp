
(/VERSIONCHECK 2) 

(DEFPARAMETER |PriorityQueueAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |PriorityQueueAggregate;|)) 

(DEFPARAMETER |PriorityQueueAggregate;AL| 'NIL) 

(DEFUN |PriorityQueueAggregate| (#1=#:G104)
  (LET (#2=#:G105)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |PriorityQueueAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |PriorityQueueAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|PriorityQueueAggregate;| #1#)))
                       |PriorityQueueAggregate;AL|))
      #2#)))) 

(DEFUN |PriorityQueueAggregate;| (|t#1|)
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (COND (|PriorityQueueAggregate;CAT|)
                                ('T
                                 (LETT |PriorityQueueAggregate;CAT|
                                       (|Join| (|BagAggregate| '|t#1|)
                                               (|finiteAggregate|)
                                               (|mkCategory|
                                                '(((|max| (|t#1| $)) T)
                                                  ((|merge| ($ $ $)) T)
                                                  ((|merge!| ($ $ $)) T))
                                                NIL 'NIL NIL))
                                       . #2=(|PriorityQueueAggregate|)))))
               . #2#)
       (SETELT #1# 0 (LIST '|PriorityQueueAggregate| (|devaluate| |t#1|))))))) 
