
(/VERSIONCHECK 2) 

(DEFPARAMETER |IntegerNumberSystem;AL| 'NIL) 

(DEFUN |IntegerNumberSystem| ()
  (LET (#:G145)
    (COND (|IntegerNumberSystem;AL|)
          (T (SETQ |IntegerNumberSystem;AL| (|IntegerNumberSystem;|)))))) 

(DEFUN |IntegerNumberSystem;| ()
  (PROG (#1=#:G143)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR
                 '(#2=#:G137 #3=#:G138 #4=#:G139 #5=#:G140 #6=#:G141 #7=#:G142)
                 (LIST '(|Integer|) '(|Integer|) '(|Integer|) '(|InputForm|)
                       '(|Pattern| (|Integer|)) '(|Integer|)))
                (|Join| (|UniqueFactorizationDomain|) (|EuclideanDomain|)
                        (|OrderedIntegralDomain|) (|DifferentialRing|)
                        (|ConvertibleTo| '#2#) (|RetractableTo| '#3#)
                        (|LinearlyExplicitRingOver| '#4#)
                        (|ConvertibleTo| '#5#) (|ConvertibleTo| '#6#)
                        (|PatternMatchable| '#7#)
                        (|CombinatorialFunctionCategory|) (|RealConstant|)
                        (|CharacteristicZero|) (|StepThrough|)
                        (|canonicalUnitNormal|) (|multiplicativeValuation|)
                        (|mkCategory|
                         '(((|odd?| ((|Boolean|) $)) T)
                           ((|even?| ((|Boolean|) $)) T) ((|base| ($)) T)
                           ((|length| ($ $)) T) ((|shift| ($ $ $)) T)
                           ((|bit?| ((|Boolean|) $ $)) T)
                           ((|positiveRemainder| ($ $ $)) T)
                           ((|symmetricRemainder| ($ $ $)) T)
                           ((|rational?| ((|Boolean|) $)) T)
                           ((|rational| ((|Fraction| (|Integer|)) $)) T)
                           ((|rationalIfCan|
                             ((|Union| (|Fraction| (|Integer|)) "failed") $))
                            T)
                           ((|random| ($)) T) ((|random| ($ $)) T)
                           ((|hash| ($ $)) T) ((|copy| ($ $)) T)
                           ((|inc| ($ $)) T) ((|dec| ($ $)) T)
                           ((|mask| ($ $)) T) ((|addmod| ($ $ $ $)) T)
                           ((|submod| ($ $ $ $)) T) ((|mulmod| ($ $ $ $)) T)
                           ((|powmod| ($ $ $ $)) T) ((|invmod| ($ $ $)) T))
                         NIL '((|Fraction| (|Integer|)) (|Boolean|)) NIL)))
               |IntegerNumberSystem|)
       (SETELT #1# 0 '(|IntegerNumberSystem|)))))) 

(MAKEPROP '|IntegerNumberSystem| 'NILADIC T) 
