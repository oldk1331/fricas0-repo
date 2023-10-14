
(/VERSIONCHECK 2) 

(DEFPARAMETER |MultisetAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |MultisetAggregate;|)) 

(DEFPARAMETER |MultisetAggregate;AL| 'NIL) 

(DEFUN |MultisetAggregate| (#1=#:G104)
  (LET (#2=#:G105)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |MultisetAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |MultisetAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|MultisetAggregate;| #1#)))
                       |MultisetAggregate;AL|))
      #2#)))) 

(DEFUN |MultisetAggregate;| (|t#1|)
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (COND (|MultisetAggregate;CAT|)
                                ('T
                                 (LETT |MultisetAggregate;CAT|
                                       (|Join| (|MultiDictionary| '|t#1|)
                                               (|SetAggregate| '|t#1|))
                                       . #2=(|MultisetAggregate|)))))
               . #2#)
       (SETELT #1# 0 (LIST '|MultisetAggregate| (|devaluate| |t#1|))))))) 
