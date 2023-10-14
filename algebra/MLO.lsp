
(/VERSIONCHECK 2) 

(DEFPARAMETER |MonogenicLinearOperator;CAT| 'NIL) 

(DEFPARAMETER |MonogenicLinearOperator;AL| 'NIL) 

(DEFUN |MonogenicLinearOperator| (#1=#:G128)
  (LET (#2=#:G129)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |MonogenicLinearOperator;AL|))
      (CDR #2#))
     (T
      (SETQ |MonogenicLinearOperator;AL|
              (|cons5| (CONS #3# (SETQ #2# (|MonogenicLinearOperator;| #1#)))
                       |MonogenicLinearOperator;AL|))
      #2#)))) 

(DEFUN |MonogenicLinearOperator;| (|t#1|)
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (COND (|MonogenicLinearOperator;CAT|)
                                ('T
                                 (LETT |MonogenicLinearOperator;CAT|
                                       (|Join| (|Ring|)
                                               (|BiModule| '|t#1| '|t#1|)
                                               (|mkCategory|
                                                '(((|degree|
                                                    ((|NonNegativeInteger|) $))
                                                   T)
                                                  ((|minimumDegree|
                                                    ((|NonNegativeInteger|) $))
                                                   T)
                                                  ((|leadingCoefficient|
                                                    (|t#1| $))
                                                   T)
                                                  ((|reductum| ($ $)) T)
                                                  ((|coefficient|
                                                    (|t#1| $
                                                     (|NonNegativeInteger|)))
                                                   T)
                                                  ((|monomial|
                                                    ($ |t#1|
                                                     (|NonNegativeInteger|)))
                                                   T))
                                                '(((|Algebra| |t#1|)
                                                   (|has| |t#1|
                                                          (|CommutativeRing|))))
                                                '((|NonNegativeInteger|)) NIL))
                                       . #2=(|MonogenicLinearOperator|)))))
               . #2#)
       (SETELT #1# 0 (LIST '|MonogenicLinearOperator| (|devaluate| |t#1|))))))) 
