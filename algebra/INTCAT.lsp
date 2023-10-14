
(/VERSIONCHECK 2) 

(DEFPARAMETER |IntervalCategory;CAT| 'NIL) 

(DEFPARAMETER |IntervalCategory;AL| 'NIL) 

(DEFUN |IntervalCategory| (#1=#:G129)
  (LET (#2=#:G130)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |IntervalCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |IntervalCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (|IntervalCategory;| #1#)))
                       |IntervalCategory;AL|))
      #2#)))) 

(DEFUN |IntervalCategory;| (|t#1|)
  (PROG (#1=#:G128)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (|sublisV| (PAIR '(#2=#:G127) (LIST '(|Integer|)))
                                     (COND (|IntervalCategory;CAT|)
                                           ('T
                                            (LETT |IntervalCategory;CAT|
                                                  (|Join| (|GcdDomain|)
                                                          (|OrderedSet|)
                                                          (|TranscendentalFunctionCategory|)
                                                          (|RadicalCategory|)
                                                          (|RetractableTo|
                                                           '#2#)
                                                          (|Approximate|)
                                                          (|mkCategory|
                                                           '(((|interval|
                                                               ($ |t#1| |t#1|))
                                                              T)
                                                             ((|qinterval|
                                                               ($ |t#1| |t#1|))
                                                              T)
                                                             ((|interval|
                                                               ($ |t#1|))
                                                              T)
                                                             ((|interval|
                                                               ($
                                                                (|Fraction|
                                                                 (|Integer|))))
                                                              T)
                                                             ((|inf| (|t#1| $))
                                                              T)
                                                             ((|sup| (|t#1| $))
                                                              T)
                                                             ((|width|
                                                               (|t#1| $))
                                                              T)
                                                             ((|positive?|
                                                               ((|Boolean|) $))
                                                              T)
                                                             ((|negative?|
                                                               ((|Boolean|) $))
                                                              T)
                                                             ((|contains?|
                                                               ((|Boolean|) $
                                                                |t#1|))
                                                              T))
                                                           NIL
                                                           '((|Boolean|)
                                                             (|Fraction|
                                                              (|Integer|)))
                                                           NIL))
                                                  . #3=(|IntervalCategory|))))))
               . #3#)
       (SETELT #1# 0 (LIST '|IntervalCategory| (|devaluate| |t#1|))))))) 
