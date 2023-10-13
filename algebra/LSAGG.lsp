
(/VERSIONCHECK 2) 

(DEFPARAMETER |ListAggregate;CAT| 'NIL) 

(DEFPARAMETER |ListAggregate;AL| 'NIL) 

(DEFUN |ListAggregate| (#1=#:G174)
  (LET (#2=#:G175)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |ListAggregate;AL|)) (CDR #2#))
     (T
      (SETQ |ListAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|ListAggregate;| #1#)))
                       |ListAggregate;AL|))
      #2#)))) 

(DEFUN |ListAggregate;| (|t#1|)
  (PROG (#1=#:G173)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (COND (|ListAggregate;CAT|)
                                ('T
                                 (LETT |ListAggregate;CAT|
                                       (|Join| (|StreamAggregate| '|t#1|)
                                               (|FiniteLinearAggregate| '|t#1|)
                                               (|ExtensibleLinearAggregate|
                                                '|t#1|)
                                               (|mkCategory|
                                                '(((|list| ($ |t#1|)) T)) NIL
                                                'NIL NIL))
                                       . #2=(|ListAggregate|)))))
               . #2#)
       (SETELT #1# 0 (LIST '|ListAggregate| (|devaluate| |t#1|))))))) 
