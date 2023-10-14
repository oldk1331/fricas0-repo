
(/VERSIONCHECK 2) 

(DEFPARAMETER |AssociationListAggregate;CAT| 'NIL) 

(DEFPARAMETER |AssociationListAggregate;AL| 'NIL) 

(DEFUN |AssociationListAggregate| (&REST #1=#:G131)
  (LET (#2=#:G132)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#) |AssociationListAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |AssociationListAggregate;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|AssociationListAggregate;| #1#)))
               |AssociationListAggregate;AL|))
      #2#)))) 

(DEFUN |AssociationListAggregate;| (|t#1| |t#2|)
  (PROG (#1=#:G130)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR '(|t#1| |t#2|)
                      (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                (|sublisV|
                 (PAIR '(#2=#:G129)
                       (LIST
                        '(|Record| (|:| |key| |t#1|) (|:| |entry| |t#2|))))
                 (COND (|AssociationListAggregate;CAT|)
                       ('T
                        (LETT |AssociationListAggregate;CAT|
                              (|Join| (|TableAggregate| '|t#1| '|t#2|)
                                      (|ListAggregate| '#2#)
                                      (|mkCategory|
                                       '(((|assoc|
                                           ((|Union|
                                             (|Record| (|:| |key| |t#1|)
                                                       (|:| |entry| |t#2|))
                                             "failed")
                                            |t#1| $))
                                          T))
                                       NIL 'NIL NIL))
                              . #3=(|AssociationListAggregate|))))))
               . #3#)
       (SETELT #1# 0
               (LIST '|AssociationListAggregate| (|devaluate| |t#1|)
                     (|devaluate| |t#2|))))))) 
