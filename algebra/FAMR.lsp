
(DEFPARAMETER |FiniteAbelianMonoidRing;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FiniteAbelianMonoidRing;|)) 

(DEFPARAMETER |FiniteAbelianMonoidRing;AL| 'NIL) 

(DEFUN |FiniteAbelianMonoidRing| (&REST #1=#:G113)
  (LET (#2=#:G114)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#) |FiniteAbelianMonoidRing;AL|))
      (CDR #2#))
     (T
      (SETQ |FiniteAbelianMonoidRing;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|FiniteAbelianMonoidRing;| #1#)))
               |FiniteAbelianMonoidRing;AL|))
      #2#)))) 

(DEFUN |FiniteAbelianMonoidRing;| (|t#1| |t#2|)
  (PROG (#1=#:G112)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR '(|t#1| |t#2|)
                      (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                (COND (|FiniteAbelianMonoidRing;CAT|)
                      ('T
                       (LETT |FiniteAbelianMonoidRing;CAT|
                             (|Join| (|AbelianMonoidRing| '|t#1| '|t#2|)
                                     (|FullyRetractableTo| '|t#1|)
                                     (|mkCategory|
                                      '(((|ground?| ((|Boolean|) $)) T)
                                        ((|ground| (|t#1| $)) T)
                                        ((|coefficients| ((|List| |t#1|) $)) T)
                                        ((|numberOfMonomials|
                                          ((|NonNegativeInteger|) $))
                                         T)
                                        ((|minimumDegree| (|t#2| $)) T)
                                        ((|mapExponents|
                                          ($ (|Mapping| |t#2| |t#2|) $))
                                         T)
                                        ((|pomopo!| ($ $ |t#1| |t#2| $)) T)
                                        ((|binomThmExpt|
                                          ($ $ $ (|NonNegativeInteger|)))
                                         (|has| $ (|CommutativeRing|)))
                                        ((|exquo|
                                          ((|Union| $ "failed") $ |t#1|))
                                         (|has| |t#1| (|EntireRing|)))
                                        ((|content| (|t#1| $))
                                         (|has| |t#1| (|GcdDomain|)))
                                        ((|primitivePart| ($ $))
                                         (|has| |t#1| (|GcdDomain|))))
                                      '(((|EntireRing|)
                                         (|has| |t#1| (|EntireRing|))))
                                      '((|NonNegativeInteger|) (|List| |t#1|)
                                        (|Boolean|))
                                      NIL))
                             . #2=(|FiniteAbelianMonoidRing|)))))
               . #2#)
       (SETELT #1# 0
               (LIST '|FiniteAbelianMonoidRing| (|devaluate| |t#1|)
                     (|devaluate| |t#2|))))))) 
