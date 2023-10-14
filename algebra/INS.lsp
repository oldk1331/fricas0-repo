
(DECLAIM (NOTINLINE |IntegerNumberSystem;|)) 

(DEFPARAMETER |IntegerNumberSystem;AL| 'NIL) 

(DEFUN |IntegerNumberSystem| ()
  (LET (#:G123)
    (COND (|IntegerNumberSystem;AL|)
          (T (SETQ |IntegerNumberSystem;AL| (|IntegerNumberSystem;|)))))) 

(DEFUN |IntegerNumberSystem;| ()
  (PROG (#1=#:G121)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR
                 '(#2=#:G115 #3=#:G116 #4=#:G117 #5=#:G118 #6=#:G119 #7=#:G120)
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
                           ((|copy| ($ $)) T) ((|inc| ($ $)) T)
                           ((|dec| ($ $)) T) ((|mask| ($ $)) T)
                           ((|addmod| ($ $ $ $)) T) ((|submod| ($ $ $ $)) T)
                           ((|mulmod| ($ $ $ $)) T) ((|powmod| ($ $ $ $)) T)
                           ((|invmod| ($ $ $)) T))
                         NIL '((|Fraction| (|Integer|)) (|Boolean|)) NIL)))
               |IntegerNumberSystem|)
       (SETELT #1# 0 '(|IntegerNumberSystem|)))))) 

(MAKEPROP '|IntegerNumberSystem| 'NILADIC T) 
