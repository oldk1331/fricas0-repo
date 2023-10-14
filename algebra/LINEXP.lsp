
(/VERSIONCHECK 2) 

(DEFPARAMETER |LinearlyExplicitRingOver;CAT| 'NIL) 

(DECLAIM (NOTINLINE |LinearlyExplicitRingOver;|)) 

(DEFPARAMETER |LinearlyExplicitRingOver;AL| 'NIL) 

(DEFUN |LinearlyExplicitRingOver| (#1=#:G104)
  (LET (#2=#:G105)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |LinearlyExplicitRingOver;AL|))
      (CDR #2#))
     (T
      (SETQ |LinearlyExplicitRingOver;AL|
              (|cons5| (CONS #3# (SETQ #2# (|LinearlyExplicitRingOver;| #1#)))
                       |LinearlyExplicitRingOver;AL|))
      #2#)))) 

(DEFUN |LinearlyExplicitRingOver;| (|t#1|)
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (COND (|LinearlyExplicitRingOver;CAT|)
                                ('T
                                 (LETT |LinearlyExplicitRingOver;CAT|
                                       (|Join| (|Ring|)
                                               (|mkCategory|
                                                '(((|reducedSystem|
                                                    ((|Matrix| |t#1|)
                                                     (|Matrix| $)))
                                                   T)
                                                  ((|reducedSystem|
                                                    ((|Record|
                                                      (|:| |mat|
                                                           (|Matrix| |t#1|))
                                                      (|:| |vec|
                                                           (|Vector| |t#1|)))
                                                     (|Matrix| $)
                                                     (|Vector| $)))
                                                   T))
                                                NIL
                                                '((|Matrix| $) (|Vector| $)
                                                  (|Matrix| |t#1|))
                                                NIL))
                                       . #2=(|LinearlyExplicitRingOver|)))))
               . #2#)
       (SETELT #1# 0 (LIST '|LinearlyExplicitRingOver| (|devaluate| |t#1|))))))) 
