
(DECLAIM (NOTINLINE |IntegerNumberSystem;|)) 

(DEFPARAMETER |IntegerNumberSystem;AL| 'NIL) 

(DEFUN |IntegerNumberSystem| ()
  (LET (#:G124)
    (COND (|IntegerNumberSystem;AL|)
          (T (SETQ |IntegerNumberSystem;AL| (|IntegerNumberSystem;|)))))) 

(DEFUN |IntegerNumberSystem;| ()
  (SPROG ((#1=#:G122 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR
                     '(#2=#:G116 #3=#:G117 #4=#:G118 #5=#:G119 #6=#:G120
                       #7=#:G121)
                     (LIST '(|Integer|) '(|Integer|) '(|Integer|)
                           '(|InputForm|) '(|Pattern| (|Integer|))
                           '(|Integer|)))
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
                                 ((|Union| (|Fraction| (|Integer|)) "failed")
                                  $))
                                T)
                               ((|random| ($ $)) T) ((|copy| ($ $)) T)
                               ((|inc| ($ $)) T) ((|dec| ($ $)) T)
                               ((|mask| ($ $)) T) ((|addmod| ($ $ $ $)) T)
                               ((|submod| ($ $ $ $)) T)
                               ((|mulmod| ($ $ $ $)) T)
                               ((|powmod| ($ $ $ $)) T) ((|invmod| ($ $ $)) T))
                             NIL '((|Fraction| (|Integer|)) (|Boolean|)) NIL)))
                   |IntegerNumberSystem|)
           (SETELT #1# 0 '(|IntegerNumberSystem|))))) 

(MAKEPROP '|IntegerNumberSystem| 'NILADIC T) 
