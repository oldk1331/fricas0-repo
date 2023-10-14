
(/VERSIONCHECK 2) 

(DEFPARAMETER |FreeModuleCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FreeModuleCategory;|)) 

(DEFPARAMETER |FreeModuleCategory;AL| 'NIL) 

(DEFUN |FreeModuleCategory| (&REST #1=#:G108)
  (LET (#2=#:G109)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |FreeModuleCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |FreeModuleCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|FreeModuleCategory;| #1#)))
               |FreeModuleCategory;AL|))
      #2#)))) 

(DEFUN |FreeModuleCategory;| (|t#1| |t#2|)
  (PROG (#1=#:G107)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR '(|t#1| |t#2|)
                      (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                (COND (|FreeModuleCategory;CAT|)
                      ('T
                       (LETT |FreeModuleCategory;CAT|
                             (|Join| (|BiModule| '|t#1| '|t#1|)
                                     (|IndexedDirectProductCategory| '|t#1|
                                                                     '|t#2|)
                                     (|mkCategory|
                                      '(((* ($ |t#1| |t#2|)) T)
                                        ((* ($ |t#2| |t#1|)) T)
                                        ((|coefficients| ((|List| |t#1|) $)) T)
                                        ((|support| ((|List| |t#2|) $)) T)
                                        ((|monomials| ((|List| $) $)) T)
                                        ((|numberOfMonomials|
                                          ((|NonNegativeInteger|) $))
                                         T)
                                        ((|monomial?| ((|Boolean|) $)) T)
                                        ((|leadingMonomial| (|t#2| $)) T)
                                        ((|leadingCoefficient| (|t#1| $)) T)
                                        ((|monom| ($ |t#2| |t#1|)) T)
                                        ((|coefficient| (|t#1| $ |t#2|)) T)
                                        ((|linearExtend|
                                          (|t#1| (|Mapping| |t#1| |t#2|) $))
                                         (|has| |t#1| (|CommutativeRing|))))
                                      '(((|RetractableTo| |t#2|)
                                         (|has| |t#1| (|SemiRing|)))
                                        ((|Module| |t#1|)
                                         (|has| |t#1| (|CommutativeRing|)))
                                        ((|Comparable|)
                                         (|has| |t#1| (|Comparable|))))
                                      '((|Boolean|) (|NonNegativeInteger|)
                                        (|List| $) (|List| |t#2|)
                                        (|List| |t#1|))
                                      NIL))
                             . #2=(|FreeModuleCategory|)))))
               . #2#)
       (SETELT #1# 0
               (LIST '|FreeModuleCategory| (|devaluate| |t#1|)
                     (|devaluate| |t#2|))))))) 
