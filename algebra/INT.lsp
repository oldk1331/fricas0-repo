
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

(DEFUN |INT;hashUpdate!;Hs$Hs;14| (|hs| |s| $)
  (SPADCALL |hs| (SXHASH |s|) (QREFELT $ 35))) 

(PUT '|INT;negative?;$B;15| '|SPADreplace| 'MINUSP) 

(DEFUN |INT;negative?;$B;15| (|x| $) (MINUSP |x|)) 

(DEFUN |INT;coerce;$Of;16| (|x| $) (SPADCALL |x| (QREFELT $ 39))) 

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

(DEFUN |INT;convert;$F;23| (|x| $) (SPADCALL |x| (QREFELT $ 48))) 

(PUT '|INT;convert;$Df;24| '|SPADreplace|
     '(XLAM (|x|) (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT))) 

(DEFUN |INT;convert;$Df;24| (|x| $) (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)) 

(DEFUN |INT;convert;$If;25| (|x| $) (SPADCALL |x| (QREFELT $ 53))) 

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
                   (COND ((SPADCALL |z| (QREFELT $ 86)) (CONS 0 |z|))
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
  (SPADCALL |lp| |p| (QREFELT $ 98))) 

(DEFUN |INT;squareFreePolynomial| (|p| $) (SPADCALL |p| (QREFELT $ 102))) 

(DEFUN |INT;factorPolynomial| (|p| $)
  (PROG (#1=#:G1486 |pp|)
    (RETURN
     (SEQ
      (LETT |pp| (SPADCALL |p| (QREFELT $ 103)) . #2=(|INT;factorPolynomial|))
      (EXIT
       (COND
        ((EQL (SPADCALL |pp| (QREFELT $ 104)) (SPADCALL |p| (QREFELT $ 104)))
         (SPADCALL |p| (QREFELT $ 106)))
        ('T
         (SPADCALL (SPADCALL |pp| (QREFELT $ 106))
                   (SPADCALL (ELT $ 107)
                             (SPADCALL
                              (PROG2
                                  (LETT #1#
                                        (SPADCALL
                                         (SPADCALL |p| (QREFELT $ 104))
                                         (SPADCALL |pp| (QREFELT $ 104))
                                         (QREFELT $ 88))
                                        . #2#)
                                  (QCDR #1#)
                                (|check_union| (QEQCAR #1# 0) $ #1#))
                              (QREFELT $ 109))
                             (QREFELT $ 113))
                   (QREFELT $ 115))))))))) 

(DEFUN |INT;factorSquareFreePolynomial| (|p| $) (SPADCALL |p| (QREFELT $ 116))) 

(DEFUN |INT;gcdPolynomial;3Sup;59| (|p| |q| $)
  (COND ((SPADCALL |p| (QREFELT $ 117)) (SPADCALL |q| (QREFELT $ 118)))
        ((SPADCALL |q| (QREFELT $ 117)) (SPADCALL |p| (QREFELT $ 118)))
        ('T (SPADCALL (LIST |p| |q|) (QREFELT $ 121))))) 

(DEFUN |Integer| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G1511)
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
      (LETT $ (GETREFV 137) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Integer| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 74
                (QSETREFV $ 73 (CONS (|dispatchFunction| |INT;*;3$;41|) $)))
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
              (|SingleInteger|) (|HashState|) (48 . |update!|)
              |INT;hashUpdate!;Hs$Hs;14| |INT;negative?;$B;15| (|OutputForm|)
              (54 . |outputForm|) |INT;coerce;$Of;16| |INT;coerce;2$;17|
              |INT;convert;2$;18| |INT;length;2$;19| |INT;addmod;4$;20|
              |INT;submod;4$;21| |INT;mulmod;4$;22| (|Float|) (59 . |coerce|)
              |INT;convert;$F;23| (|DoubleFloat|) |INT;convert;$Df;24|
              (|InputForm|) (64 . |convert|) |INT;convert;$If;25|
              |INT;convert;$S;26| |INT;latex;$S;27|
              |INT;positiveRemainder;3$;28| (|Matrix| 11) (|Matrix| $)
              |INT;reducedSystem;2M;29|
              (|Record| (|:| |mat| 58) (|:| |vec| (|Vector| 11))) (|Vector| $)
              |INT;reducedSystem;MVR;30| |INT;abs;2$;31| |INT;random;$;32|
              |INT;random;2$;33| |INT;=;2$B;34| |INT;<;2$B;35| |INT;>=;2$B;36|
              |INT;-;2$;37| |INT;+;3$;38| |INT;-;3$;39| NIL NIL
              (|NonNegativeInteger|) |INT;^;$Nni$;42| |INT;odd?;$B;43|
              |INT;max;3$;44| |INT;min;3$;45|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |INT;divide;2$R;46| |INT;quo;3$;47| |INT;rem;3$;48|
              |INT;shift;3$;49| (|SExpression|) (69 . |integer?|)
              (|Union| $ '"failed") |INT;exquo;2$U;50| |INT;recip;$U;51|
              |INT;gcd;3$;52|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              |INT;unitNormal;$R;53| |INT;unitCanonical;2$;54|
              (|Union| 95 '"failed") (|List| 96)
              (|SparseUnivariatePolynomial| 11)
              (|IntegerSolveLinearPolynomialEquation|)
              (74 . |solveLinearPolynomialEquation|) (|Factored| 100)
              (|SparseUnivariatePolynomial| $$)
              (|UnivariatePolynomialSquareFree| $$ 100) (80 . |squareFree|)
              (85 . |primitivePart|) (90 . |leadingCoefficient|)
              (|GaloisGroupFactorizer| 100) (95 . |factor|) (100 . |coerce|)
              (|Factored| $) (105 . |factor|) (|Mapping| 100 $$)
              (|Factored| $$) (|FactoredFunctions2| $$ 100) (110 . |map|)
              (|FactoredFunctionUtilities| 100) (116 . |mergeFactors|)
              (122 . |factorSquareFree|) (127 . |zero?|)
              (132 . |unitCanonical|) (|List| 100) (|HeuGcd| 100) (137 . |gcd|)
              (|SparseUnivariatePolynomial| $) |INT;gcdPolynomial;3Sup;59|
              (|Fraction| 11) (|Union| 124 '"failed") (|Pattern| 11)
              (|PatternMatchResult| 11 $) (|Union| 11 '"failed")
              (|Union| 130 '"failed") (|List| $)
              (|Record| (|:| |coef| 130) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 132 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|PositiveInteger|))
           '#(~= 142 |zero?| 148 |unitNormal| 153 |unitCanonical| 158 |unit?|
              163 |symmetricRemainder| 168 |subtractIfCan| 174 |submod| 180
              |squareFreePart| 187 |squareFree| 192 |smaller?| 197 |sizeLess?|
              203 |sign| 209 |shift| 214 |sample| 220 |retractIfCan| 224
              |retract| 229 |rem| 234 |reducedSystem| 240 |recip| 251
              |rationalIfCan| 256 |rational?| 261 |rational| 266 |random| 271
              |quo| 280 |principalIdeal| 286 |prime?| 291 |powmod| 296
              |positiveRemainder| 303 |positive?| 309 |permutation| 314
              |patternMatch| 320 |one?| 327 |odd?| 332 |nextItem| 337
              |negative?| 342 |multiEuclidean| 347 |mulmod| 353 |min| 360 |max|
              366 |mask| 372 |length| 377 |lcmCoef| 382 |lcm| 388 |latex| 399
              |invmod| 404 |init| 410 |inc| 414 |hashUpdate!| 419 |hash| 425
              |gcdPolynomial| 430 |gcd| 436 |factorial| 447 |factor| 452
              |extendedEuclidean| 457 |exquo| 470 |expressIdealMember| 476
              |even?| 482 |euclideanSize| 487 |divide| 492 |differentiate| 498
              |dec| 509 |copy| 514 |convert| 519 |coerce| 549 |characteristic|
              569 |bit?| 573 |binomial| 579 |base| 585 |associates?| 589
              |addmod| 595 |abs| 602 ^ 607 |Zero| 619 |One| 623 |OMwrite| 627 D
              651 >= 662 > 668 = 674 <= 680 < 686 - 692 + 703 * 709)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL NIL
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
                 (|LeftOreRing|) (|Algebra| $$) (|CharacteristicZero|)
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
                 (|ConvertibleTo| 47) (|ConvertibleTo| 50)
                 (|CombinatorialFunctionCategory|) (|ConvertibleTo| 126)
                 (|ConvertibleTo| 52) (|RetractableTo| 11) (|ConvertibleTo| 11)
                 (|PartialOrder|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 38))
              (|makeByteWordVec2| 136
                                  '(1 7 6 0 8 3 7 6 0 9 9 10 2 7 6 0 11 12 1 7
                                    6 0 13 0 14 0 15 2 7 0 9 14 16 1 7 6 0 17 1
                                    7 6 0 18 1 7 6 0 19 2 34 0 0 33 35 1 38 0
                                    11 39 1 47 0 11 48 1 52 0 11 53 1 85 21 0
                                    86 2 97 94 95 96 98 1 101 99 100 102 1 100
                                    0 0 103 1 100 2 0 104 1 105 99 100 106 1
                                    100 0 2 107 1 0 108 0 109 2 112 99 110 111
                                    113 2 114 99 99 99 115 1 105 99 100 116 1
                                    100 21 0 117 1 100 0 0 118 1 120 100 119
                                    121 2 0 21 0 0 1 1 0 21 0 25 1 0 91 0 92 1
                                    0 0 0 93 1 0 21 0 1 2 0 0 0 0 1 2 0 87 0 0
                                    1 3 0 0 0 0 0 45 1 0 0 0 1 1 0 108 0 1 2 0
                                    21 0 0 1 2 0 21 0 0 1 1 0 11 0 1 2 0 0 0 0
                                    84 0 0 0 1 1 0 128 0 1 1 0 11 0 1 2 0 0 0 0
                                    83 1 0 58 59 60 2 0 61 59 62 63 1 0 87 0 89
                                    1 0 125 0 1 1 0 21 0 1 1 0 124 0 1 0 0 0 65
                                    1 0 0 0 66 2 0 0 0 0 82 1 0 131 130 1 1 0
                                    21 0 1 3 0 0 0 0 0 1 2 0 0 0 0 57 1 0 21 0
                                    1 2 0 0 0 0 1 3 0 127 0 126 127 1 1 0 21 0
                                    26 1 0 21 0 77 1 0 87 0 1 1 0 21 0 37 2 0
                                    129 130 0 1 3 0 0 0 0 0 46 2 0 0 0 0 79 2 0
                                    0 0 0 78 1 0 0 0 1 1 0 0 0 43 2 0 135 0 0 1
                                    1 0 0 130 1 2 0 0 0 0 1 1 0 9 0 56 2 0 0 0
                                    0 1 0 0 0 1 1 0 0 0 31 2 0 34 34 0 36 1 0
                                    33 0 1 2 0 122 122 122 123 2 0 0 0 0 90 1 0
                                    0 130 1 1 0 0 0 1 1 0 108 0 109 3 0 133 0 0
                                    0 1 2 0 134 0 0 1 2 0 87 0 0 88 2 0 129 130
                                    0 1 1 0 21 0 1 1 0 75 0 1 2 0 80 0 0 81 1 0
                                    0 0 1 2 0 0 0 75 1 1 0 0 0 32 1 0 0 0 30 1
                                    0 9 0 55 1 0 50 0 51 1 0 47 0 49 1 0 126 0
                                    1 1 0 52 0 54 1 0 11 0 42 1 0 0 11 41 1 0 0
                                    0 1 1 0 0 11 41 1 0 38 0 40 0 0 75 1 2 0 21
                                    0 0 1 2 0 0 0 0 1 0 0 0 29 2 0 21 0 0 1 3 0
                                    0 0 0 0 44 1 0 0 0 64 2 0 0 0 75 76 2 0 0 0
                                    136 1 0 0 0 27 0 0 0 28 3 0 6 7 0 21 24 2 0
                                    9 0 21 22 2 0 6 7 0 23 1 0 9 0 20 1 0 0 0 1
                                    2 0 0 0 75 1 2 0 21 0 0 69 2 0 21 0 0 1 2 0
                                    21 0 0 67 2 0 21 0 0 1 2 0 21 0 0 68 2 0 0
                                    0 0 72 1 0 0 0 70 2 0 0 0 0 71 2 0 0 0 0 73
                                    2 0 0 11 0 74 2 0 0 75 0 1 2 0 0 136 0
                                    1)))))
           '|lookupComplete|)) 

(MAKEPROP '|Integer| 'NILADIC T) 
