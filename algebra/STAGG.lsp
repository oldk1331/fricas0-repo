
(/VERSIONCHECK 2) 

(DEFPARAMETER |StreamAggregate;CAT| 'NIL) 

(DEFPARAMETER |StreamAggregate;AL| 'NIL) 

(DEFUN |StreamAggregate| (#1=#:G137)
  (LET (#2=#:G138)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |StreamAggregate;AL|)) (CDR #2#))
     (T
      (SETQ |StreamAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|StreamAggregate;| #1#)))
                       |StreamAggregate;AL|))
      #2#)))) 

(DEFUN |StreamAggregate;| (|t#1|)
  (PROG (#1=#:G136)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
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
       (SETELT #1# 0 (LIST '|StreamAggregate| (|devaluate| |t#1|))))))) 
