
(DECLAIM (NOTINLINE |IntegerNumberSystem;|)) 

(DEFPARAMETER |IntegerNumberSystem;AL| 'NIL) 

(DEFUN |IntegerNumberSystem| ()
  (COND (|IntegerNumberSystem;AL|)
        (T (SETQ |IntegerNumberSystem;AL| (|IntegerNumberSystem;|))))) 

(DEFUN |IntegerNumberSystem;| ()
  (SPROG ((#1=#:G136 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (MAKE_PAIRS
                     '(#2=#:G131 #3=#:G132 #4=#:G133 #5=#:G134 #6=#:G135)
                     (LIST '(|Integer|) '(|Integer|) '(|InputForm|)
                           '(|Pattern| (|Integer|)) '(|Integer|)))
                    (|Join| (|UniqueFactorizationDomain|) (|EuclideanDomain|)
                            (|OrderedIntegralDomain|) (|DifferentialRing|)
                            (|ConvertibleTo| '#2#) (|RetractableTo| '#3#)
                            (|ConvertibleTo| '#4#) (|ConvertibleTo| '#5#)
                            (|PatternMatchable| '#6#)
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
                             NIL NIL NIL))))
           (SETELT #1# 0 '(|IntegerNumberSystem|))))) 

(MAKEPROP '|IntegerNumberSystem| 'NILADIC T) 
