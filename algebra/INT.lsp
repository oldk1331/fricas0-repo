
(/VERSIONCHECK 2) 

(DEFUN |INT;writeOMInt| (|dev| |x| $)
  (SEQ
   (COND
    ((< |x| 0)
     (SEQ (SPADCALL |dev| (QREFELT $ 8))
          (SPADCALL |dev| "arith1" "unary_minus" (QREFELT $ 10))
          (SPADCALL |dev| (- |x|) (QREFELT $ 12))
          (EXIT (SPADCALL |dev| (QREFELT $ 13)))))
    ('T (SPADCALL |dev| |x| (QREFELT $ 12)))))) 

(DEFUN |INT;OMwrite;$S;2| (|x| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|INT;OMwrite;$S;2|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 15)) (QREFELT $ 16))
                . #1#)
          (SPADCALL |dev| (QREFELT $ 17)) (|INT;writeOMInt| |dev| |x| $)
          (SPADCALL |dev| (QREFELT $ 18)) (SPADCALL |dev| (QREFELT $ 19))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |INT;OMwrite;$BS;3| (|x| |wholeObj| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|INT;OMwrite;$BS;3|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 15)) (QREFELT $ 16))
                . #1#)
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 17))))
          (|INT;writeOMInt| |dev| |x| $)
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 18))))
          (SPADCALL |dev| (QREFELT $ 19))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |INT;OMwrite;Omd$V;4| (|dev| |x| $)
  (SEQ (SPADCALL |dev| (QREFELT $ 17)) (|INT;writeOMInt| |dev| |x| $)
       (EXIT (SPADCALL |dev| (QREFELT $ 18))))) 

(DEFUN |INT;OMwrite;Omd$BV;5| (|dev| |x| |wholeObj| $)
  (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 17))))
       (|INT;writeOMInt| |dev| |x| $)
       (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 18))))))) 

(PUT '|INT;zero?;$B;6| '|SPADreplace| 'ZEROP) 

(DEFUN |INT;zero?;$B;6| (|x| $) (ZEROP |x|)) 

(PUT '|INT;one?;$B;7| '|SPADreplace| '(XLAM (|x|) (EQL |x| 1))) 

(DEFUN |INT;one?;$B;7| (|x| $) (EQL |x| 1)) 

(PUT '|INT;Zero;$;8| '|SPADreplace| '(XLAM NIL 0)) 

(DEFUN |INT;Zero;$;8| ($) 0) 

(PUT '|INT;One;$;9| '|SPADreplace| '(XLAM NIL 1)) 

(DEFUN |INT;One;$;9| ($) 1) 

(PUT '|INT;base;$;10| '|SPADreplace| '(XLAM NIL 2)) 

(DEFUN |INT;base;$;10| ($) 2) 

(PUT '|INT;copy;2$;11| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |INT;copy;2$;11| (|x| $) |x|) 

(PUT '|INT;inc;2$;12| '|SPADreplace| '(XLAM (|x|) (+ |x| 1))) 

(DEFUN |INT;inc;2$;12| (|x| $) (+ |x| 1)) 

(PUT '|INT;dec;2$;13| '|SPADreplace| '(XLAM (|x|) (- |x| 1))) 

(DEFUN |INT;dec;2$;13| (|x| $) (- |x| 1)) 

(PUT '|INT;hash;2$;14| '|SPADreplace| 'SXHASH) 

(DEFUN |INT;hash;2$;14| (|x| $) (SXHASH |x|)) 

(PUT '|INT;negative?;$B;15| '|SPADreplace| 'MINUSP) 

(DEFUN |INT;negative?;$B;15| (|x| $) (MINUSP |x|)) 

(DEFUN |INT;coerce;$Of;16| (|x| $) (SPADCALL |x| (QREFELT $ 36))) 

(PUT '|INT;coerce;2$;17| '|SPADreplace| '(XLAM (|m|) |m|)) 

(DEFUN |INT;coerce;2$;17| (|m| $) |m|) 

(PUT '|INT;convert;2$;18| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |INT;convert;2$;18| (|x| $) |x|) 

(PUT '|INT;length;2$;19| '|SPADreplace| 'INTEGER-LENGTH) 

(DEFUN |INT;length;2$;19| (|a| $) (INTEGER-LENGTH |a|)) 

(DEFUN |INT;addmod;4$;20| (|a| |b| |p| $)
  (PROG (|c|)
    (RETURN
     (SEQ (LETT |c| (+ |a| |b|) |INT;addmod;4$;20|)
          (EXIT (COND ((>= |c| |p|) (- |c| |p|)) ('T |c|))))))) 

(DEFUN |INT;submod;4$;21| (|a| |b| |p| $)
  (PROG (|c|)
    (RETURN
     (SEQ (LETT |c| (- |a| |b|) |INT;submod;4$;21|)
          (EXIT (COND ((< |c| 0) (+ |c| |p|)) ('T |c|))))))) 

(DEFUN |INT;mulmod;4$;22| (|a| |b| |p| $) (REM (* |a| |b|) |p|)) 

(DEFUN |INT;convert;$F;23| (|x| $) (SPADCALL |x| (QREFELT $ 45))) 

(PUT '|INT;convert;$Df;24| '|SPADreplace|
     '(XLAM (|x|) (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT))) 

(DEFUN |INT;convert;$Df;24| (|x| $) (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)) 

(DEFUN |INT;convert;$If;25| (|x| $) (SPADCALL |x| (QREFELT $ 50))) 

(PUT '|INT;convert;$S;26| '|SPADreplace| 'STRINGIMAGE) 

(DEFUN |INT;convert;$S;26| (|x| $) (STRINGIMAGE |x|)) 

(DEFUN |INT;latex;$S;27| (|x| $)
  (PROG (|s|)
    (RETURN
     (SEQ (LETT |s| (STRINGIMAGE |x|) |INT;latex;$S;27|)
          (COND ((< -1 |x|) (COND ((< |x| 10) (EXIT |s|)))))
          (EXIT (STRCONC "{" (STRCONC |s| "}"))))))) 

(DEFUN |INT;positiveRemainder;3$;28| (|a| |b| $)
  (PROG (|r|)
    (RETURN
     (COND
      ((MINUSP (LETT |r| (REM |a| |b|) |INT;positiveRemainder;3$;28|))
       (COND ((MINUSP |b|) (- |r| |b|)) (#1='T (+ |r| |b|))))
      (#1# |r|))))) 

(PUT '|INT;reducedSystem;2M;29| '|SPADreplace| '(XLAM (|m|) |m|)) 

(DEFUN |INT;reducedSystem;2M;29| (|m| $) |m|) 

(DEFUN |INT;reducedSystem;MVR;30| (|m| |v| $) (CONS |m| '|vec|)) 

(PUT '|INT;abs;2$;31| '|SPADreplace| 'ABS) 

(DEFUN |INT;abs;2$;31| (|x| $) (ABS |x|)) 

(PUT '|INT;random;$;32| '|SPADreplace| '|random|) 

(DEFUN |INT;random;$;32| ($) (|random|)) 

(PUT '|INT;random;2$;33| '|SPADreplace| 'RANDOM) 

(DEFUN |INT;random;2$;33| (|x| $) (RANDOM |x|)) 

(PUT '|INT;=;2$B;34| '|SPADreplace| 'EQL) 

(DEFUN |INT;=;2$B;34| (|x| |y| $) (EQL |x| |y|)) 

(PUT '|INT;<;2$B;35| '|SPADreplace| '<) 

(DEFUN |INT;<;2$B;35| (|x| |y| $) (< |x| |y|)) 

(PUT '|INT;>=;2$B;36| '|SPADreplace| '>=) 

(DEFUN |INT;>=;2$B;36| (|x| |y| $) (>= |x| |y|)) 

(PUT '|INT;-;2$;37| '|SPADreplace| '-) 

(DEFUN |INT;-;2$;37| (|x| $) (- |x|)) 

(PUT '|INT;+;3$;38| '|SPADreplace| '+) 

(DEFUN |INT;+;3$;38| (|x| |y| $) (+ |x| |y|)) 

(PUT '|INT;-;3$;39| '|SPADreplace| '-) 

(DEFUN |INT;-;3$;39| (|x| |y| $) (- |x| |y|)) 

(PUT '|INT;*;3$;40| '|SPADreplace| '*) 

(DEFUN |INT;*;3$;40| (|x| |y| $) (* |x| |y|)) 

(PUT '|INT;*;3$;41| '|SPADreplace| '*) 

(DEFUN |INT;*;3$;41| (|m| |y| $) (* |m| |y|)) 

(PUT '|INT;^;$Nni$;42| '|SPADreplace| 'EXPT) 

(DEFUN |INT;^;$Nni$;42| (|x| |n| $) (EXPT |x| |n|)) 

(PUT '|INT;odd?;$B;43| '|SPADreplace| 'ODDP) 

(DEFUN |INT;odd?;$B;43| (|x| $) (ODDP |x|)) 

(PUT '|INT;max;3$;44| '|SPADreplace| 'MAX) 

(DEFUN |INT;max;3$;44| (|x| |y| $) (MAX |x| |y|)) 

(PUT '|INT;min;3$;45| '|SPADreplace| 'MIN) 

(DEFUN |INT;min;3$;45| (|x| |y| $) (MIN |x| |y|)) 

(PUT '|INT;divide;2$R;46| '|SPADreplace| 'DIVIDE2) 

(DEFUN |INT;divide;2$R;46| (|x| |y| $) (DIVIDE2 |x| |y|)) 

(PUT '|INT;quo;3$;47| '|SPADreplace| 'QUOTIENT2) 

(DEFUN |INT;quo;3$;47| (|x| |y| $) (QUOTIENT2 |x| |y|)) 

(PUT '|INT;rem;3$;48| '|SPADreplace| 'REM) 

(DEFUN |INT;rem;3$;48| (|x| |y| $) (REM |x| |y|)) 

(PUT '|INT;shift;3$;49| '|SPADreplace| 'ASH) 

(DEFUN |INT;shift;3$;49| (|x| |y| $) (ASH |x| |y|)) 

(DEFUN |INT;exquo;2$U;50| (|x| |y| $)
  (PROG (|z|)
    (RETURN
     (SEQ
      (COND ((ZEROP |y|) (CONS 1 "failed"))
            (#1='T
             (SEQ (LETT |z| (INTEXQUO |x| |y|) |INT;exquo;2$U;50|)
                  (EXIT
                   (COND ((SPADCALL |z| (QREFELT $ 83)) (CONS 0 |z|))
                         (#1# (CONS 1 "failed"))))))))))) 

(DEFUN |INT;recip;$U;51| (|x| $)
  (COND ((OR (EQL |x| 1) (EQL |x| -1)) (CONS 0 |x|)) ('T (CONS 1 "failed")))) 

(PUT '|INT;gcd;3$;52| '|SPADreplace| 'GCD) 

(DEFUN |INT;gcd;3$;52| (|x| |y| $) (GCD |x| |y|)) 

(DEFUN |INT;unitNormal;$R;53| (|x| $)
  (COND ((< |x| 0) (VECTOR -1 (- |x|) -1)) ('T (VECTOR 1 |x| 1)))) 

(PUT '|INT;unitCanonical;2$;54| '|SPADreplace| 'ABS) 

(DEFUN |INT;unitCanonical;2$;54| (|x| $) (ABS |x|)) 

(DEFUN |INT;solveLinearPolynomialEquation| (|lp| |p| $)
  (SPADCALL |lp| |p| (QREFELT $ 95))) 

(DEFUN |INT;squareFreePolynomial| (|p| $) (SPADCALL |p| (QREFELT $ 99))) 

(DEFUN |INT;factorPolynomial| (|p| $)
  (PROG (#1=#:G1468 |pp|)
    (RETURN
     (SEQ
      (LETT |pp| (SPADCALL |p| (QREFELT $ 100)) . #2=(|INT;factorPolynomial|))
      (EXIT
       (COND
        ((EQL (SPADCALL |pp| (QREFELT $ 101)) (SPADCALL |p| (QREFELT $ 101)))
         (SPADCALL |p| (QREFELT $ 103)))
        ('T
         (SPADCALL (SPADCALL |pp| (QREFELT $ 103))
                   (SPADCALL (ELT $ 104)
                             (SPADCALL
                              (PROG2
                                  (LETT #1#
                                        (SPADCALL
                                         (SPADCALL |p| (QREFELT $ 101))
                                         (SPADCALL |pp| (QREFELT $ 101))
                                         (QREFELT $ 85))
                                        . #2#)
                                  (QCDR #1#)
                                (|check_union| (QEQCAR #1# 0) $ #1#))
                              (QREFELT $ 106))
                             (QREFELT $ 110))
                   (QREFELT $ 112))))))))) 

(DEFUN |INT;factorSquareFreePolynomial| (|p| $) (SPADCALL |p| (QREFELT $ 113))) 

(DEFUN |INT;gcdPolynomial;3Sup;59| (|p| |q| $)
  (COND ((SPADCALL |p| (QREFELT $ 114)) (SPADCALL |q| (QREFELT $ 115)))
        ((SPADCALL |q| (QREFELT $ 114)) (SPADCALL |p| (QREFELT $ 115)))
        ('T (SPADCALL (LIST |p| |q|) (QREFELT $ 118))))) 

(DEFUN |Integer| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G1492)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|Integer|) . #2=(|Integer|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|Integer|
                         (LIST (CONS NIL (CONS 1 (|Integer;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|Integer|))))))))))) 

(DEFUN |Integer;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|Integer|) . #1=(|Integer|))
      (LETT $ (GETREFV 134) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Integer| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 71
                (QSETREFV $ 70 (CONS (|dispatchFunction| |INT;*;3$;41|) $)))
      $)))) 

(MAKEPROP '|Integer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Void|) (|OpenMathDevice|)
              (0 . |OMputApp|) (|String|) (5 . |OMputSymbol|) (|Integer|)
              (12 . |OMputInteger|) (18 . |OMputEndApp|) (|OpenMathEncoding|)
              (23 . |OMencodingXML|) (27 . |OMopenString|) (33 . |OMputObject|)
              (38 . |OMputEndObject|) (43 . |OMclose|) |INT;OMwrite;$S;2|
              (|Boolean|) |INT;OMwrite;$BS;3| |INT;OMwrite;Omd$V;4|
              |INT;OMwrite;Omd$BV;5| |INT;zero?;$B;6| |INT;one?;$B;7|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INT;Zero;$;8|) $))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INT;One;$;9|) $))
              |INT;base;$;10| |INT;copy;2$;11| |INT;inc;2$;12| |INT;dec;2$;13|
              |INT;hash;2$;14| |INT;negative?;$B;15| (|OutputForm|)
              (48 . |outputForm|) |INT;coerce;$Of;16| |INT;coerce;2$;17|
              |INT;convert;2$;18| |INT;length;2$;19| |INT;addmod;4$;20|
              |INT;submod;4$;21| |INT;mulmod;4$;22| (|Float|) (53 . |coerce|)
              |INT;convert;$F;23| (|DoubleFloat|) |INT;convert;$Df;24|
              (|InputForm|) (58 . |convert|) |INT;convert;$If;25|
              |INT;convert;$S;26| |INT;latex;$S;27|
              |INT;positiveRemainder;3$;28| (|Matrix| 11) (|Matrix| $)
              |INT;reducedSystem;2M;29|
              (|Record| (|:| |mat| 55) (|:| |vec| (|Vector| 11))) (|Vector| $)
              |INT;reducedSystem;MVR;30| |INT;abs;2$;31| |INT;random;$;32|
              |INT;random;2$;33| |INT;=;2$B;34| |INT;<;2$B;35| |INT;>=;2$B;36|
              |INT;-;2$;37| |INT;+;3$;38| |INT;-;3$;39| NIL NIL
              (|NonNegativeInteger|) |INT;^;$Nni$;42| |INT;odd?;$B;43|
              |INT;max;3$;44| |INT;min;3$;45|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |INT;divide;2$R;46| |INT;quo;3$;47| |INT;rem;3$;48|
              |INT;shift;3$;49| (|SExpression|) (63 . |integer?|)
              (|Union| $ '"failed") |INT;exquo;2$U;50| |INT;recip;$U;51|
              |INT;gcd;3$;52|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              |INT;unitNormal;$R;53| |INT;unitCanonical;2$;54|
              (|Union| 92 '"failed") (|List| 93)
              (|SparseUnivariatePolynomial| 11)
              (|IntegerSolveLinearPolynomialEquation|)
              (68 . |solveLinearPolynomialEquation|) (|Factored| 97)
              (|SparseUnivariatePolynomial| $$)
              (|UnivariatePolynomialSquareFree| $$ 97) (74 . |squareFree|)
              (79 . |primitivePart|) (84 . |leadingCoefficient|)
              (|GaloisGroupFactorizer| 97) (89 . |factor|) (94 . |coerce|)
              (|Factored| $) (99 . |factor|) (|Mapping| 97 $$) (|Factored| $$)
              (|FactoredFunctions2| $$ 97) (104 . |map|)
              (|FactoredFunctionUtilities| 97) (110 . |mergeFactors|)
              (116 . |factorSquareFree|) (121 . |zero?|)
              (126 . |unitCanonical|) (|List| 97) (|HeuGcd| 97) (131 . |gcd|)
              (|SparseUnivariatePolynomial| $) |INT;gcdPolynomial;3Sup;59|
              (|Fraction| 11) (|Union| 121 '"failed") (|Pattern| 11)
              (|PatternMatchResult| 11 $) (|Union| 11 '"failed")
              (|Record| (|:| |coef| 127) (|:| |generator| $)) (|List| $)
              (|Union| 127 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 130 '"failed") (|PositiveInteger|) (|SingleInteger|))
           '#(~= 136 |zero?| 142 |unitNormal| 147 |unitCanonical| 152 |unit?|
              157 |symmetricRemainder| 162 |subtractIfCan| 168 |submod| 174
              |squareFreePart| 181 |squareFree| 186 |smaller?| 191 |sizeLess?|
              197 |sign| 203 |shift| 208 |sample| 214 |retractIfCan| 218
              |retract| 223 |rem| 228 |reducedSystem| 234 |recip| 245
              |rationalIfCan| 250 |rational?| 255 |rational| 260 |random| 265
              |quo| 274 |principalIdeal| 280 |prime?| 285 |powmod| 290
              |positiveRemainder| 297 |positive?| 303 |permutation| 308
              |patternMatch| 314 |one?| 321 |odd?| 326 |nextItem| 331
              |negative?| 336 |multiEuclidean| 341 |mulmod| 347 |min| 354 |max|
              360 |mask| 366 |length| 371 |lcm| 376 |latex| 387 |invmod| 392
              |init| 398 |inc| 402 |hash| 407 |gcdPolynomial| 417 |gcd| 423
              |factorial| 434 |factor| 439 |extendedEuclidean| 444 |exquo| 457
              |expressIdealMember| 463 |even?| 469 |euclideanSize| 474 |divide|
              479 |differentiate| 485 |dec| 496 |copy| 501 |convert| 506
              |coerce| 536 |characteristic| 556 |bit?| 560 |binomial| 566
              |base| 572 |associates?| 576 |addmod| 582 |abs| 589 ^ 594 |Zero|
              606 |One| 610 |OMwrite| 614 D 638 >= 649 > 655 = 661 <= 667 < 673
              - 679 + 690 * 696)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |Algebra&| NIL NIL |DifferentialRing&| |OrderedRing&| NIL
                |EntireRing&| |Module&| NIL NIL |Ring&| NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |Monoid&| NIL NIL NIL NIL |SemiGroup&| |AbelianSemiGroup&| NIL
                |SetCategory&| NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |RetractableTo&| NIL |PartialOrder&| NIL NIL NIL |BasicType&|
                NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|OrderedIntegralDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|Algebra| $$) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 11) (|DifferentialRing|)
                 (|OrderedRing|) (|CommutativeRing|) (|EntireRing|)
                 (|Module| $$) (|OrderedAbelianGroup|) (|BiModule| $$ $$)
                 (|Ring|) (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedSet|) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|StepThrough|) (|PatternMatchable| 11)
                 (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|RealConstant|) (|SetCategory|) (|canonicalsClosed|)
                 (|Canonical|) (|OpenMath|) (|ConvertibleTo| 9)
                 (|multiplicativeValuation|) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 44) (|ConvertibleTo| 47)
                 (|CombinatorialFunctionCategory|) (|ConvertibleTo| 123)
                 (|ConvertibleTo| 49) (|RetractableTo| 11) (|ConvertibleTo| 11)
                 (|PartialOrder|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 35))
              (|makeByteWordVec2| 133
                                  '(1 7 6 0 8 3 7 6 0 9 9 10 2 7 6 0 11 12 1 7
                                    6 0 13 0 14 0 15 2 7 0 9 14 16 1 7 6 0 17 1
                                    7 6 0 18 1 7 6 0 19 1 35 0 11 36 1 44 0 11
                                    45 1 49 0 11 50 1 82 21 0 83 2 94 91 92 93
                                    95 1 98 96 97 99 1 97 0 0 100 1 97 2 0 101
                                    1 102 96 97 103 1 97 0 2 104 1 0 105 0 106
                                    2 109 96 107 108 110 2 111 96 96 96 112 1
                                    102 96 97 113 1 97 21 0 114 1 97 0 0 115 1
                                    117 97 116 118 2 0 21 0 0 1 1 0 21 0 25 1 0
                                    88 0 89 1 0 0 0 90 1 0 21 0 1 2 0 0 0 0 1 2
                                    0 84 0 0 1 3 0 0 0 0 0 42 1 0 0 0 1 1 0 105
                                    0 1 2 0 21 0 0 1 2 0 21 0 0 1 1 0 11 0 1 2
                                    0 0 0 0 81 0 0 0 1 1 0 125 0 1 1 0 11 0 1 2
                                    0 0 0 0 80 1 0 55 56 57 2 0 58 56 59 60 1 0
                                    84 0 86 1 0 122 0 1 1 0 21 0 1 1 0 121 0 1
                                    1 0 0 0 63 0 0 0 62 2 0 0 0 0 79 1 0 126
                                    127 1 1 0 21 0 1 3 0 0 0 0 0 1 2 0 0 0 0 54
                                    1 0 21 0 1 2 0 0 0 0 1 3 0 124 0 123 124 1
                                    1 0 21 0 26 1 0 21 0 74 1 0 84 0 1 1 0 21 0
                                    34 2 0 128 127 0 1 3 0 0 0 0 0 43 2 0 0 0 0
                                    76 2 0 0 0 0 75 1 0 0 0 1 1 0 0 0 40 2 0 0
                                    0 0 1 1 0 0 127 1 1 0 9 0 53 2 0 0 0 0 1 0
                                    0 0 1 1 0 0 0 31 1 0 0 0 33 1 0 133 0 1 2 0
                                    119 119 119 120 2 0 0 0 0 87 1 0 0 127 1 1
                                    0 0 0 1 1 0 105 0 106 2 0 129 0 0 1 3 0 131
                                    0 0 0 1 2 0 84 0 0 85 2 0 128 127 0 1 1 0
                                    21 0 1 1 0 72 0 1 2 0 77 0 0 78 1 0 0 0 1 2
                                    0 0 0 72 1 1 0 0 0 32 1 0 0 0 30 1 0 9 0 52
                                    1 0 44 0 46 1 0 47 0 48 1 0 123 0 1 1 0 49
                                    0 51 1 0 11 0 39 1 0 0 11 38 1 0 0 0 1 1 0
                                    0 11 38 1 0 35 0 37 0 0 72 1 2 0 21 0 0 1 2
                                    0 0 0 0 1 0 0 0 29 2 0 21 0 0 1 3 0 0 0 0 0
                                    41 1 0 0 0 61 2 0 0 0 72 73 2 0 0 0 132 1 0
                                    0 0 27 0 0 0 28 3 0 6 7 0 21 24 2 0 9 0 21
                                    22 2 0 6 7 0 23 1 0 9 0 20 1 0 0 0 1 2 0 0
                                    0 72 1 2 0 21 0 0 66 2 0 21 0 0 1 2 0 21 0
                                    0 64 2 0 21 0 0 1 2 0 21 0 0 65 2 0 0 0 0
                                    69 1 0 0 0 67 2 0 0 0 0 68 2 0 0 11 0 71 2
                                    0 0 0 0 70 2 0 0 72 0 1 2 0 0 132 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|Integer| 'NILADIC T) 
