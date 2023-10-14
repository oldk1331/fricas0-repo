
(/VERSIONCHECK 2) 

(DEFUN |FFCGP;tableForDiscreteLogarithm;IT;1| (|fac| $)
  (SPADCALL (QREFELT $ 40))) 

(DEFUN |FFCGP;getZechTable;Pa;2| ($) (QREFELT $ 24)) 

(DEFUN |FFCGP;order;$Pi;3| (|x| $)
  (PROG (#1=#:G148)
    (RETURN
     (COND
      ((SPADCALL |x| (QREFELT $ 45))
       (|error| "order: order of zero undefined"))
      ('T
       (PROG1
           (LETT #1# (QUOTIENT2 (QREFELT $ 22) (GCD (QREFELT $ 22) |x|))
                 |FFCGP;order;$Pi;3|)
         (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))))) 

(DEFUN |FFCGP;primitive?;$B;4| (|x| $)
  (COND
   ((OR (SPADCALL |x| (QREFELT $ 45))
        (SPADCALL |x| (|spadConstant| $ 21) (QREFELT $ 47)))
    'NIL)
   ('T
    (COND ((SPADCALL (GCD |x| (QREFELT $ 22)) 1 (QREFELT $ 47)) 'T)
          ('T 'NIL))))) 

(DEFUN |FFCGP;coordinates;$V;5| (|x| $)
  (PROG (|primElement|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 47))
        (MAKEARR1 (QREFELT $ 12) (|spadConstant| $ 49)))
       ('T
        (SEQ
         (LETT |primElement|
               (SPADCALL (SPADCALL (|spadConstant| $ 50) 1 (QREFELT $ 51))
                         (QREFELT $ 53))
               |FFCGP;coordinates;$V;5|)
         (EXIT
          (SPADCALL (SPADCALL |primElement| |x| (QREFELT $ 54))
                    (QREFELT $ 56)))))))))) 

(DEFUN |FFCGP;+;3$;6| (|x| |y| $)
  (PROG (|d|)
    (RETURN
     (SEQ (COND ((QREFELT $ 36) (|FFCGP;initializeZech| $)))
          (EXIT
           (COND ((|eql_SI| |x| -1) |y|) ((|eql_SI| |y| -1) |x|)
                 (#1='T
                  (SEQ
                   (LETT |d| (|submod_SI| |y| |x| (QREFELT $ 22))
                         . #2=(|FFCGP;+;3$;6|))
                   (EXIT
                    (COND
                     ((SPADCALL |d| (|lshift_SI| (QREFELT $ 22) -1)
                                (QREFELT $ 58))
                      (COND ((|eql_SI| (QAREF1 (QREFELT $ 24) |d|) -1) -1)
                            (#1#
                             (|addmod_SI| |x| (QAREF1 (QREFELT $ 24) |d|)
                                          (QREFELT $ 22)))))
                     (#1#
                      (SEQ (LETT |d| (|sub_SI| (QREFELT $ 22) |d|) . #2#)
                           (EXIT
                            (|addmod_SI| |y| (QAREF1 (QREFELT $ 24) |d|)
                                         (QREFELT $ 22))))))))))))))) 

(DEFUN |FFCGP;initializeZech| ($)
  (SEQ (SETELT $ 24 (SPADCALL (QREFELT $ 7) (QREFELT $ 61))) (SETELT $ 36 'NIL)
       (EXIT (SPADCALL (QREFELT $ 63))))) 

(DEFUN |FFCGP;basis;PiV;8| (|n| $)
  (PROG (#1=#:G163 #2=#:G169 |i| #3=#:G168 |m|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (REM (SPADCALL (QREFELT $ 66)) |n|) 0 (QREFELT $ 67))
        (|error| "argument must divide extension degree"))
       ('T
        (SEQ
         (LETT |m|
               (QUOTIENT2 (QREFELT $ 22)
                          (-
                           (SPADCALL (SPADCALL (QREFELT $ 13)) |n|
                                     (QREFELT $ 16))
                           1))
               . #4=(|FFCGP;basis;PiV;8|))
         (EXIT
          (PROGN
           (LETT #3# (GETREFV |n|) . #4#)
           (SEQ (LETT |i| 0 . #4#) (LETT #2# (- |n| 1) . #4#) G190
                (COND ((|greater_SI| |i| #2#) (GO G191)))
                (SEQ
                 (EXIT
                  (SETELT #3# |i|
                          (SPADCALL
                           (PROG1
                               (LETT #1#
                                     (+ 1 (SPADCALL |i| |m| (QREFELT $ 68)))
                                     . #4#)
                             (|check_subtype| (> #1# 0) '(|PositiveInteger|)
                                              #1#))
                           (QREFELT $ 69)))))
                (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
           #3#))))))))) 

(DEFUN |FFCGP;*;I2$;9| (|n| |x| $)
  (SPADCALL (SPADCALL (SPADCALL |n| (QREFELT $ 72)) (QREFELT $ 73)) |x|
            (QREFELT $ 74))) 

(DEFUN |FFCGP;minimalPolynomial;$Sup;10| (|a| $)
  (PROG (|f| |p| |g| |u|)
    (RETURN
     (SEQ
      (LETT |f|
            (SPADCALL (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 77))
                      (SPADCALL |a| 0 (QREFELT $ 77)) (QREFELT $ 78))
            . #1=(|FFCGP;minimalPolynomial;$Sup;10|))
      (LETT |u| (SPADCALL |a| (QREFELT $ 79)) . #1#)
      (SEQ G190
           (COND
            ((NULL (COND ((SPADCALL |u| |a| (QREFELT $ 47)) 'NIL) ('T 'T)))
             (GO G191)))
           (SEQ
            (LETT |f|
                  (SPADCALL |f|
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 77))
                             (SPADCALL |u| 0 (QREFELT $ 77)) (QREFELT $ 78))
                            (QREFELT $ 80))
                  . #1#)
            (EXIT (LETT |u| (SPADCALL |u| (QREFELT $ 79)) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (LETT |p| (|spadConstant| $ 30) . #1#)
      (SEQ G190
           (COND
            ((NULL (COND ((SPADCALL |f| (QREFELT $ 81)) 'NIL) ('T 'T)))
             (GO G191)))
           (SEQ
            (LETT |g| (SPADCALL (SPADCALL |f| (QREFELT $ 82)) (QREFELT $ 83))
                  . #1#)
            (LETT |p|
                  (SPADCALL |p|
                            (SPADCALL |g| (SPADCALL |f| (QREFELT $ 84))
                                      (QREFELT $ 51))
                            (QREFELT $ 85))
                  . #1#)
            (EXIT (LETT |f| (SPADCALL |f| (QREFELT $ 86)) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |p|))))) 

(DEFUN |FFCGP;factorsOfCyclicGroupSize;L;11| ($)
  (SEQ (COND ((NULL (QREFELT $ 35)) (|FFCGP;initializeElt| $)))
       (EXIT (QREFELT $ 35)))) 

(PUT '|FFCGP;representationType;U;12| '|SPADreplace|
     '(XLAM NIL (CONS 3 "cyclic"))) 

(DEFUN |FFCGP;representationType;U;12| ($) (CONS 3 "cyclic")) 

(DEFUN |FFCGP;definingPolynomial;Sup;13| ($) (QREFELT $ 7)) 

(DEFUN |FFCGP;random;$;14| ($) (|sub_SI| (RANDOM (QREFELT $ 14)) 1)) 

(DEFUN |FFCGP;represents;V$;15| (|v| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |v| (QREFELT $ 96)) |FFCGP;represents;V$;15|)
          (EXIT
           (COND
            ((SPADCALL |u| (|spadConstant| $ 97) (QREFELT $ 98))
             (|spadConstant| $ 31))
            ('T (SPADCALL |u| (QREFELT $ 99))))))))) 

(DEFUN |FFCGP;coerce;GF$;16| (|e| $)
  (PROG (|log| #1=#:G199)
    (RETURN
     (SEQ
      (COND ((SPADCALL |e| (QREFELT $ 101)) (|spadConstant| $ 31))
            ('T
             (SEQ
              (LETT |log|
                    (*
                     (PROG2
                         (LETT #1#
                               (SPADCALL (QREFELT $ 34) |e| (QREFELT $ 103))
                               . #2=(|FFCGP;coerce;GF$;16|))
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                      #1#))
                     (QREFELT $ 23))
                    . #2#)
              (EXIT (SPADCALL |log| (QREFELT $ 22) (QREFELT $ 104)))))))))) 

(DEFUN |FFCGP;retractIfCan;$U;17| (|x| $)
  (PROG (#1=#:G208 |u|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 45)) (CONS 0 (|spadConstant| $ 49)))
            (#2='T
             (SEQ
              (LETT |u| (SPADCALL |x| (QREFELT $ 23) (QREFELT $ 106))
                    . #3=(|FFCGP;retractIfCan;$U;17|))
              (EXIT
               (COND
                ((SPADCALL |u| (CONS 1 "failed") (QREFELT $ 108))
                 (CONS 1 "failed"))
                (#2#
                 (CONS 0
                       (SPADCALL (QREFELT $ 34)
                                 (PROG2 (LETT #1# |u| . #3#)
                                     (QCDR #1#)
                                   (|check_union| (QEQCAR #1# 0) $ #1#))
                                 (QREFELT $ 109))))))))))))) 

(DEFUN |FFCGP;retract;$GF;18| (|x| $)
  (PROG (#1=#:G220 |a|)
    (RETURN
     (SEQ
      (LETT |a| (SPADCALL |x| (QREFELT $ 111)) . #2=(|FFCGP;retract;$GF;18|))
      (EXIT
       (COND
        ((SPADCALL |a| (CONS 1 "failed") (QREFELT $ 112))
         (|error| "element not in ground field"))
        ('T
         (PROG2 (LETT #1# |a| . #2#)
             (QCDR #1#)
           (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))))))))) 

(DEFUN |FFCGP;basis;V;19| ($)
  (PROG (#1=#:G225 #2=#:G228 #3=#:G230 |i| #4=#:G229)
    (RETURN
     (SEQ
      (PROGN
       (LETT #4# (GETREFV #5=(QREFELT $ 12)) . #6=(|FFCGP;basis;V;19|))
       (SEQ (LETT |i| 1 . #6#) (LETT #3# #5# . #6#) (LETT #2# 0 . #6#) G190
            (COND ((|greater_SI| |i| #3#) (GO G191)))
            (SEQ
             (EXIT
              (SETELT #4# #2#
                      (SPADCALL
                       (PROG1 (LETT #1# |i| . #6#)
                         (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
                       (QREFELT $ 69)))))
            (LETT #2# (PROG1 (|inc_SI| #2#) (LETT |i| (|inc_SI| |i|) . #6#))
                  . #6#)
            (GO G190) G191 (EXIT NIL))
       #4#))))) 

(DEFUN |FFCGP;inGroundField?;$B;20| (|x| $)
  (COND
   ((OR (SPADCALL |x| (QREFELT $ 45))
        (|eql_SI| (SPADCALL |x| (QREFELT $ 23) (QREFELT $ 114)) 0))
    'T)
   ('T 'NIL))) 

(DEFUN |FFCGP;discreteLog;2$U;21| (|b| |x| $)
  (PROG (|e1| #1=#:G239 |e|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 45)) (CONS 1 "failed"))
            (#2='T
             (SEQ
              (LETT |e| (SPADCALL |b| (QREFELT $ 22) |x| (QREFELT $ 118))
                    . #3=(|FFCGP;discreteLog;2$U;21|))
              (EXIT
               (COND
                ((SPADCALL |e| (CONS 1 "failed") (QREFELT $ 121))
                 (CONS 1 "failed"))
                (#2#
                 (SEQ
                  (LETT |e1|
                        (PROG2 (LETT #1# |e| . #3#)
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 0)
                                         (|Record| (|:| |coef1| $)
                                                   (|:| |coef2| $))
                                         #1#))
                        . #3#)
                  (EXIT
                   (CONS 0
                         (SPADCALL (QCAR |e1|) (QREFELT $ 22)
                                   (QREFELT $ 114))))))))))))))) 

(DEFUN |FFCGP;-;2$;22| (|x| $)
  (COND ((|eql_SI| |x| -1) -1) ((EQL (SPADCALL (QREFELT $ 123)) 2) |x|)
        ('T (|addmod_SI| |x| (|lshift_SI| (QREFELT $ 22) -1) (QREFELT $ 22))))) 

(PUT '|FFCGP;generator;$;23| '|SPADreplace| '(XLAM NIL 1)) 

(DEFUN |FFCGP;generator;$;23| ($) 1) 

(PUT '|FFCGP;createPrimitiveElement;$;24| '|SPADreplace| '(XLAM NIL 1)) 

(DEFUN |FFCGP;createPrimitiveElement;$;24| ($) 1) 

(PUT '|FFCGP;primitiveElement;$;25| '|SPADreplace| '(XLAM NIL 1)) 

(DEFUN |FFCGP;primitiveElement;$;25| ($) 1) 

(DEFUN |FFCGP;discreteLog;$Nni;26| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 45)) (|error| "discrete logarithm error"))
        ('T |x|))) 

(DEFUN |FFCGP;normalElement;$;27| ($)
  (SEQ (COND ((QREFELT $ 37) (|FFCGP;initializeElt| $))) (EXIT (QREFELT $ 38)))) 

(DEFUN |FFCGP;initializeElt| ($)
  (SEQ
   (SETELT $ 35
           (SPADCALL (SPADCALL (QREFELT $ 22) (QREFELT $ 131))
                     (QREFELT $ 133)))
   (SETELT $ 38 (SPADCALL (QREFELT $ 134))) (SETELT $ 37 'NIL)
   (EXIT (SPADCALL (QREFELT $ 63))))) 

(DEFUN |FFCGP;extensionDegree;Pi;29| ($) (QREFELT $ 12)) 

(DEFUN |FFCGP;characteristic;Nni;30| ($) (SPADCALL (QREFELT $ 135))) 

(DEFUN |FFCGP;lookup;$Pi;31| (|x| $)
  (COND ((|eql_SI| |x| -1) (QREFELT $ 14)) ('T (|add_SI| |x| 1)))) 

(DEFUN |FFCGP;index;Pi$;32| (|a| $)
  (|sub_SI| (SPADCALL |a| (QREFELT $ 14) (QREFELT $ 104)) 1)) 

(PUT '|FFCGP;Zero;$;33| '|SPADreplace| '(XLAM NIL -1)) 

(DEFUN |FFCGP;Zero;$;33| ($) -1) 

(PUT '|FFCGP;One;$;34| '|SPADreplace| '(XLAM NIL 0)) 

(DEFUN |FFCGP;One;$;34| ($) 0) 

(DEFUN |FFCGP;coerce;$Of;35| (|x| $)
  (PROG (|y|)
    (RETURN
     (SEQ
      (COND ((|eql_SI| |x| -1) "0") ((|eql_SI| |x| 0) "1")
            ('T
             (SEQ
              (LETT |y| (- (SPADCALL |x| (QREFELT $ 137)) 1)
                    |FFCGP;coerce;$Of;35|)
              (EXIT
               (SPADCALL (QREFELT $ 29) (SPADCALL |y| (QREFELT $ 138))
                         (QREFELT $ 139)))))))))) 

(PUT '|FFCGP;=;2$B;36| '|SPADreplace| '|eql_SI|) 

(DEFUN |FFCGP;=;2$B;36| (|x| |y| $) (|eql_SI| |x| |y|)) 

(DEFUN |FFCGP;*;3$;37| (|x| |y| $)
  (COND ((OR (|eql_SI| |x| -1) (|eql_SI| |y| -1)) -1)
        ('T (|addmod_SI| |x| |y| (QREFELT $ 22))))) 

(DEFUN |FFCGP;*;GF2$;38| (|a| |x| $)
  (SPADCALL (SPADCALL |a| (QREFELT $ 73)) |x| (QREFELT $ 74))) 

(DEFUN |FFCGP;/;$GF$;39| (|x| |a| $)
  (SPADCALL |x| (SPADCALL |a| (QREFELT $ 73)) (QREFELT $ 142))) 

(DEFUN |FFCGP;inv;2$;40| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 45)) (|error| "inv: not invertible"))
        ((SPADCALL |x| (|spadConstant| $ 21) (QREFELT $ 47))
         (|spadConstant| $ 21))
        ('T (|sub_SI| (QREFELT $ 22) |x|)))) 

(DEFUN |FFCGP;^;$Pi$;41| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 145))) 

(DEFUN |FFCGP;^;$Nni$;42| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 145))) 

(DEFUN |FFCGP;^;$I$;43| (|x| |n| $)
  (PROG (|m|)
    (RETURN
     (SEQ
      (LETT |m| (SPADCALL |n| (QREFELT $ 22) (QREFELT $ 104)) |FFCGP;^;$I$;43|)
      (EXIT
       (COND ((|eql_SI| |m| 0) (|spadConstant| $ 21))
             ((SPADCALL |x| (|spadConstant| $ 31) (QREFELT $ 47))
              (|spadConstant| $ 31))
             ('T (|mulmod_SI| |m| |x| (QREFELT $ 22))))))))) 

(DEFUN |FiniteFieldCyclicGroupExtensionByPolynomial| (&REST #1=#:G292)
  (PROG ()
    (RETURN
     (PROG (#2=#:G293)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|FiniteFieldCyclicGroupExtensionByPolynomial|)
                                           '|domainEqualList|)
                . #3=(|FiniteFieldCyclicGroupExtensionByPolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY
                   (|function| |FiniteFieldCyclicGroupExtensionByPolynomial;|)
                   #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|FiniteFieldCyclicGroupExtensionByPolynomial|))))))))))) 

(DEFUN |FiniteFieldCyclicGroupExtensionByPolynomial;| (|#1| |#2|)
  (PROG (|pv$| #1=#:G291 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #2=(|FiniteFieldCyclicGroupExtensionByPolynomial|))
      (LETT DV$2 (|devaluate| |#2|) . #2#)
      (LETT |dv$|
            (LIST '|FiniteFieldCyclicGroupExtensionByPolynomial| DV$1 DV$2)
            . #2#)
      (LETT $ (GETREFV 164) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|Finite|))
                                                . #2#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           #1#)))
                      . #2#))
      (|haddProp| |$ConstructorCache|
                  '|FiniteFieldCyclicGroupExtensionByPolynomial|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|SingleInteger|))
      (QSETREFV $ 12 (SPADCALL |#2| (QREFELT $ 11)))
      (QSETREFV $ 14 (EXPT (SPADCALL (QREFELT $ 13)) (QREFELT $ 12)))
      (QSETREFV $ 19
                (SPADCALL (QREFELT $ 14) (SPADCALL 2 20 (QREFELT $ 16))
                          (QREFELT $ 18)))
      (COND
       ((QREFELT $ 19) (|error| "field too large for this representation")))
      (QSETREFV $ 22 (- (QREFELT $ 14) 1))
      (QSETREFV $ 23
                (QUOTIENT2 (QREFELT $ 22) (- (SPADCALL (QREFELT $ 13)) 1)))
      (QSETREFV $ 24 (MAKEARR1 (QUOTIENT2 (+ (QREFELT $ 14) 1) 2) -1))
      (QSETREFV $ 29 (SPADCALL (SPADCALL (QREFELT $ 26)) (QREFELT $ 28)))
      (QSETREFV $ 34
                (COND
                 ((ODDP (QREFELT $ 12))
                  (SPADCALL (SPADCALL |#2| 0 (QREFELT $ 32)) (QREFELT $ 33)))
                 ('T (SPADCALL |#2| 0 (QREFELT $ 32)))))
      (QSETREFV $ 35 NIL)
      (QSETREFV $ 36 'T)
      (QSETREFV $ 37 'T)
      (QSETREFV $ 38 0)
      $)))) 

(MAKEPROP '|FiniteFieldCyclicGroupExtensionByPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 6)
              (0 . |degree|) '|extdeg| (5 . |size|) '|sizeFF|
              (|PositiveInteger|) (9 . ^) (|Boolean|) (15 . >) '#:G125
              (21 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FFCGP;One;$;34|) $))
              '|sizeCG| '|sizeFG| '|zechlog| (|Symbol|) (25 . |new|)
              (|OutputForm|) (29 . |coerce|) '|alpha| (34 . |Zero|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |FFCGP;Zero;$;33|) $))
              (38 . |coefficient|) (44 . -) '|primEltGF| '|facOfGroupSize|
              '|initzech?| '|initelt?| '|normalElt| (|Table| 15 9)
              (49 . |table|) (|Integer|) |FFCGP;tableForDiscreteLogarithm;IT;1|
              (|PrimitiveArray| 163) |FFCGP;getZechTable;Pa;2| (53 . |zero?|)
              |FFCGP;order;$Pi;3| |FFCGP;=;2$B;36| |FFCGP;primitive?;$B;4|
              (58 . |Zero|) (62 . |One|) (66 . |monomial|)
              (|SimpleAlgebraicExtension| 6 10 7) (72 . |convert|) (77 . ^)
              (|Vector| 6) (83 . |coordinates|) |FFCGP;coordinates;$V;5|
              (88 . <=) |FFCGP;+;3$;6| (|FiniteFieldFunctions| 6)
              (94 . |createZechTable|) (|Void|) (99 . |void|)
              (|OnePointCompletion| 15) (103 . |extensionDegree|)
              |FFCGP;extensionDegree;Pi;29| (107 . ~=) (113 . *)
              |FFCGP;index;Pi$;32| (|Vector| $) |FFCGP;basis;PiV;8|
              (119 . |coerce|) |FFCGP;coerce;GF$;16| |FFCGP;*;3$;37|
              |FFCGP;*;I2$;9| (|SparseUnivariatePolynomial| $$)
              (124 . |monomial|) (130 . -) (136 . |Frobenius|) (141 . *)
              (147 . |zero?|) (152 . |leadingCoefficient|)
              |FFCGP;retract;$GF;18| (157 . |degree|) (162 . +)
              (168 . |reductum|) |FFCGP;minimalPolynomial;$Sup;10|
              (|Record| (|:| |factor| 41) (|:| |exponent| 41)) (|List| 88)
              |FFCGP;factorsOfCyclicGroupSize;L;11|
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              |FFCGP;representationType;U;12| |FFCGP;definingPolynomial;Sup;13|
              |FFCGP;random;$;14| (|FiniteFieldExtensionByPolynomial| 6 7)
              (173 . |represents|) (178 . |Zero|) (182 . =)
              (188 . |discreteLog|) |FFCGP;represents;V$;15| (193 . |zero?|)
              (|Union| 9 '"failed") (198 . |discreteLog|)
              (204 . |positiveRemainder|) (|Union| $ '#1="failed")
              (210 . |exquo|) (|Union| $$ '#1#) (216 . =) (222 . ^)
              (|Union| 6 '"failed") |FFCGP;retractIfCan;$U;17| (228 . =)
              |FFCGP;basis;V;19| (234 . |positiveRemainder|)
              |FFCGP;inGroundField?;$B;20|
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 116 '#2="failed") (240 . |extendedEuclidean|)
              (|Record| (|:| |coef1| $$) (|:| |coef2| $$)) (|Union| 119 '#2#)
              (247 . =) |FFCGP;discreteLog;2$U;21| (253 . |characteristic|)
              |FFCGP;-;2$;22| |FFCGP;generator;$;23|
              |FFCGP;createPrimitiveElement;$;24| |FFCGP;primitiveElement;$;25|
              |FFCGP;discreteLog;$Nni;26| |FFCGP;normalElement;$;27|
              (|Factored| $) (257 . |factor|) (|Factored| 41) (262 . |factors|)
              (267 . |createNormalElement|) (271 . |characteristic|)
              |FFCGP;characteristic;Nni;30| |FFCGP;lookup;$Pi;31|
              (275 . |coerce|) (280 . ^) |FFCGP;coerce;$Of;35|
              |FFCGP;*;GF2$;38| (286 . /) |FFCGP;/;$GF$;39| |FFCGP;inv;2$;40|
              |FFCGP;^;$I$;43| |FFCGP;^;$Pi$;41| |FFCGP;^;$Nni$;42| (|List| $)
              (|InputForm|) (|Union| 70 '"failed") (|Matrix| $)
              (|Union| 10 '"failed") (|SparseUnivariatePolynomial| $)
              (|Matrix| 6) (|CardinalNumber|) (|Fraction| 41)
              (|Union| 148 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 148) (|:| |generator| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|))
           '#(~= 292 |zero?| 298 |unitNormal| 303 |unitCanonical| 308 |unit?|
              313 |transcendent?| 318 |transcendenceDegree| 323 |trace| 327
              |tableForDiscreteLogarithm| 338 |subtractIfCan| 343
              |squareFreePart| 349 |squareFree| 354 |sizeLess?| 359 |size| 365
              |sample| 369 |retractIfCan| 373 |retract| 378 |represents| 383
              |representationType| 388 |rem| 392 |recip| 398 |random| 403 |quo|
              407 |principalIdeal| 413 |primitiveElement| 418 |primitive?| 422
              |primeFrobenius| 427 |prime?| 438 |order| 443 |one?| 453
              |normalElement| 458 |normal?| 462 |norm| 467 |nextItem| 478
              |multiEuclidean| 483 |minimalPolynomial| 489 |lookup| 500
              |linearAssociatedOrder| 505 |linearAssociatedLog| 510
              |linearAssociatedExp| 521 |lcm| 527 |latex| 538 |inv| 543 |init|
              548 |index| 552 |inGroundField?| 557 |hash| 562 |getZechTable|
              567 |generator| 571 |gcdPolynomial| 575 |gcd| 581
              |factorsOfCyclicGroupSize| 592 |factor| 596 |extensionDegree| 601
              |extendedEuclidean| 609 |exquo| 622 |expressIdealMember| 628
              |euclideanSize| 634 |enumerate| 639 |divide| 643 |discreteLog|
              649 |dimension| 660 |differentiate| 664 |degree| 675
              |definingPolynomial| 685 |createPrimitiveElement| 689
              |createNormalElement| 693 |coordinates| 697 |convert| 707
              |conditionP| 712 |coerce| 717 |charthRoot| 742 |characteristic|
              752 |basis| 756 |associates?| 765 |algebraic?| 771 ^ 776 |Zero|
              794 |One| 798 |Frobenius| 802 D 813 = 824 / 830 - 842 + 853 *
              859)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 2 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 1 2 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 2 0 0 0
                                  0 0 0 0 0 0 2))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |ExtensionField&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| |DivisionRing&| NIL |VectorSpace&| |Algebra&|
                |Algebra&| |Module&| |Module&| |EntireRing&| NIL |Module&| NIL
                NIL |DifferentialRing&| NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL
                NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |SemiGroup&| |AbelianSemiGroup&| |Finite&| NIL |SetCategory&|
                |RetractableTo&| NIL NIL NIL NIL NIL |BasicType&| NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| 6) (|ExtensionField| 6)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|VectorSpace| 6) (|Algebra| 156)
                 (|Algebra| $$) (|Module| 6) (|Module| 156) (|EntireRing|)
                 (|CommutativeRing|) (|Module| $$) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|DifferentialRing|) (|BiModule| 6 6)
                 (|BiModule| 156 156) (|BiModule| $$ $$) (|Ring|)
                 (|RightModule| 6) (|LeftModule| 6) (|RightModule| 156)
                 (|LeftModule| 156) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Finite|) (|StepThrough|) (|SetCategory|) (|RetractableTo| 6)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 27) (|ConvertibleTo| 149))
              (|makeByteWordVec2| 163
                                  '(1 10 9 0 11 0 6 9 13 2 9 0 0 15 16 2 9 17 0
                                    0 18 0 10 0 20 0 25 0 26 1 25 27 0 28 0 10
                                    0 30 2 10 6 0 9 32 1 6 0 0 33 0 39 0 40 1 0
                                    17 0 45 0 6 0 49 0 6 0 50 2 10 0 6 9 51 1
                                    52 0 10 53 2 52 0 0 41 54 1 52 55 0 56 2 8
                                    17 0 0 58 1 60 43 10 61 0 62 0 63 0 0 64 65
                                    2 9 17 0 0 67 2 41 0 9 0 68 1 6 0 41 72 2
                                    76 0 2 9 77 2 76 0 0 0 78 1 0 0 0 79 2 76 0
                                    0 0 80 1 76 17 0 81 1 76 2 0 82 1 76 9 0 84
                                    2 10 0 0 0 85 1 76 0 0 86 1 95 0 55 96 0 95
                                    0 97 2 95 17 0 0 98 1 95 9 0 99 1 6 17 0
                                    101 2 6 102 0 0 103 2 41 0 0 0 104 2 8 105
                                    0 0 106 2 107 17 0 0 108 2 6 0 0 41 109 2
                                    110 17 0 0 112 2 8 0 0 0 114 3 8 117 0 0 0
                                    118 2 120 17 0 0 121 0 10 9 123 1 41 130 0
                                    131 1 132 89 0 133 0 0 0 134 0 6 9 135 1 41
                                    27 0 138 2 27 0 0 0 139 2 0 0 0 0 142 2 0
                                    17 0 0 1 1 0 17 0 45 1 0 161 0 1 1 0 0 0 1
                                    1 0 17 0 1 1 0 17 0 1 0 0 9 1 2 2 0 0 15 1
                                    1 0 6 0 1 1 2 39 41 42 2 0 105 0 0 1 1 0 0
                                    0 1 1 0 130 0 1 2 0 17 0 0 1 0 2 9 1 0 0 0
                                    1 1 0 110 0 111 1 0 6 0 83 1 0 0 55 100 0 2
                                    91 92 2 0 0 0 0 1 1 0 105 0 1 0 2 0 94 2 0
                                    0 0 0 1 1 0 160 148 1 0 2 0 127 1 2 17 0 48
                                    1 3 0 0 1 2 3 0 0 9 1 1 0 17 0 1 1 3 64 0 1
                                    1 2 15 0 46 1 0 17 0 1 0 2 0 129 1 2 17 0 1
                                    2 2 0 0 15 1 1 0 6 0 1 1 2 105 0 1 2 0 157
                                    148 0 1 2 2 153 0 15 1 1 0 10 0 87 1 2 15 0
                                    137 1 2 10 0 1 2 2 152 0 0 1 1 2 10 0 1 2 2
                                    0 0 10 1 1 0 0 148 1 2 0 0 0 0 1 1 0 162 0
                                    1 1 0 0 0 144 0 2 0 1 1 2 0 15 69 1 0 17 0
                                    115 1 0 163 0 1 0 0 43 44 0 2 0 125 2 0 153
                                    153 153 1 1 0 0 148 1 2 0 0 0 0 1 0 2 89 90
                                    1 0 130 0 1 0 0 15 66 0 0 64 65 3 0 117 0 0
                                    0 1 2 0 158 0 0 1 2 0 105 0 0 1 2 0 157 148
                                    0 1 1 0 9 0 1 0 2 148 1 2 0 159 0 0 1 2 3
                                    102 0 0 122 1 2 9 0 128 0 0 155 1 2 2 0 0 9
                                    1 1 2 0 0 1 1 0 15 0 1 1 0 64 0 1 0 0 10 93
                                    0 2 0 126 0 2 0 134 1 0 154 70 1 1 0 55 0
                                    57 1 2 149 0 1 1 2 150 151 1 1 0 0 6 73 1 0
                                    0 156 1 1 0 0 0 1 1 0 0 41 1 1 0 27 0 140 1
                                    3 105 0 1 1 2 0 0 1 0 0 9 136 1 0 70 15 71
                                    0 0 70 113 2 0 17 0 0 1 1 0 17 0 1 2 0 0 0
                                    41 145 2 0 0 0 9 147 2 0 0 0 15 146 0 0 0
                                    31 0 0 0 21 2 2 0 0 9 1 1 2 0 0 79 2 2 0 0
                                    9 1 1 2 0 0 1 2 0 17 0 0 47 2 0 0 0 6 143 2
                                    0 0 0 0 142 1 0 0 0 124 2 0 0 0 0 1 2 0 0 0
                                    0 59 2 0 0 6 0 141 2 0 0 0 6 1 2 0 0 156 0
                                    1 2 0 0 0 156 1 2 0 0 0 0 74 2 0 0 41 0 75
                                    2 0 0 9 0 1 2 0 0 15 0 1)))))
           '|lookupComplete|)) 
