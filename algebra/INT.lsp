
(SDEFUN |INT;writeOMInt| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ
         (COND
          ((< |x| 0)
           (SEQ (SPADCALL |dev| (QREFELT $ 8))
                (SPADCALL |dev| "arith1" "unary_minus" (QREFELT $ 10))
                (SPADCALL |dev| (- |x|) (QREFELT $ 12))
                (EXIT (SPADCALL |dev| (QREFELT $ 13)))))
          ('T (SPADCALL |dev| |x| (QREFELT $ 12)))))) 

(SDEFUN |INT;OMwrite;Omd$BV;2|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 14))))
             (|INT;writeOMInt| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 15))))))) 

(PUT '|INT;zero?;$B;3| '|SPADreplace| 'ZEROP) 

(SDEFUN |INT;zero?;$B;3| ((|x| $) ($ |Boolean|)) (ZEROP |x|)) 

(PUT '|INT;one?;$B;4| '|SPADreplace| '(XLAM (|x|) (EQL |x| 1))) 

(SDEFUN |INT;one?;$B;4| ((|x| $) ($ |Boolean|)) (EQL |x| 1)) 

(PUT '|INT;Zero;$;5| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |INT;Zero;$;5| (($ $)) 0) 

(PUT '|INT;One;$;6| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |INT;One;$;6| (($ $)) 1) 

(PUT '|INT;base;$;7| '|SPADreplace| '(XLAM NIL 2)) 

(SDEFUN |INT;base;$;7| (($ $)) 2) 

(PUT '|INT;copy;2$;8| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INT;copy;2$;8| ((|x| $) ($ $)) |x|) 

(PUT '|INT;inc;2$;9| '|SPADreplace| '(XLAM (|x|) (+ |x| 1))) 

(SDEFUN |INT;inc;2$;9| ((|x| $) ($ $)) (+ |x| 1)) 

(PUT '|INT;dec;2$;10| '|SPADreplace| '(XLAM (|x|) (- |x| 1))) 

(SDEFUN |INT;dec;2$;10| ((|x| $) ($ $)) (- |x| 1)) 

(SDEFUN |INT;hashUpdate!;Hs$Hs;11|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(PUT '|INT;negative?;$B;12| '|SPADreplace| 'MINUSP) 

(SDEFUN |INT;negative?;$B;12| ((|x| $) ($ |Boolean|)) (MINUSP |x|)) 

(SDEFUN |INT;coerce;$Of;13| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 30))) 

(PUT '|INT;coerce;2$;14| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |INT;coerce;2$;14| ((|m| |Integer|) ($ $)) |m|) 

(PUT '|INT;convert;2$;15| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INT;convert;2$;15| ((|x| $) ($ |Integer|)) |x|) 

(PUT '|INT;length;2$;16| '|SPADreplace| 'INTEGER-LENGTH) 

(SDEFUN |INT;length;2$;16| ((|a| $) ($ $)) (INTEGER-LENGTH |a|)) 

(SDEFUN |INT;addmod;4$;17| ((|a| $) (|b| $) (|p| $) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (+ |a| |b|) |INT;addmod;4$;17|)
                    (EXIT (COND ((>= |c| |p|) (- |c| |p|)) ('T |c|)))))) 

(SDEFUN |INT;submod;4$;18| ((|a| $) (|b| $) (|p| $) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (- |a| |b|) |INT;submod;4$;18|)
                    (EXIT (COND ((< |c| 0) (+ |c| |p|)) ('T |c|)))))) 

(SDEFUN |INT;mulmod;4$;19| ((|a| $) (|b| $) (|p| $) ($ $))
        (REM (* |a| |b|) |p|)) 

(SDEFUN |INT;convert;$F;20| ((|x| $) ($ |Float|)) (SPADCALL |x| (QREFELT $ 39))) 

(PUT '|INT;convert;$Df;21| '|SPADreplace|
     '(XLAM (|x|) (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |INT;convert;$Df;21| ((|x| $) ($ |DoubleFloat|))
        (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |INT;convert;$If;22| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 44))) 

(PUT '|INT;convert;$S;23| '|SPADreplace| 'STRINGIMAGE) 

(SDEFUN |INT;convert;$S;23| ((|x| $) ($ |String|)) (STRINGIMAGE |x|)) 

(SDEFUN |INT;latex;$S;24| ((|x| $) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ (LETT |s| (STRINGIMAGE |x|) |INT;latex;$S;24|)
                    (COND ((< -1 |x|) (COND ((< |x| 10) (EXIT |s|)))))
                    (EXIT (STRCONC "{" (STRCONC |s| "}")))))) 

(SDEFUN |INT;positiveRemainder;3$;25| ((|a| $) (|b| $) ($ $))
        (SPROG ((|r| ($)))
               (COND
                ((MINUSP
                  (LETT |r| (REM |a| |b|) |INT;positiveRemainder;3$;25|))
                 (COND ((MINUSP |b|) (- |r| |b|)) (#1='T (+ |r| |b|))))
                (#1# |r|)))) 

(PUT '|INT;reducedSystem;2M;26| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |INT;reducedSystem;2M;26| ((|m| |Matrix| $) ($ |Matrix| (|Integer|)))
        |m|) 

(PUT '|INT;reducedSystem;MVR;27| '|SPADreplace| 'CONS) 

(SDEFUN |INT;reducedSystem;MVR;27|
        ((|m| |Matrix| . #1=($)) (|vec| |Vector| . #1#)
         ($ |Record| (|:| |mat| (|Matrix| (|Integer|)))
          (|:| |vec| (|Vector| (|Integer|)))))
        (CONS |m| |vec|)) 

(PUT '|INT;abs;2$;28| '|SPADreplace| 'ABS) 

(SDEFUN |INT;abs;2$;28| ((|x| $) ($ $)) (ABS |x|)) 

(PUT '|INT;random;$;29| '|SPADreplace| '|random|) 

(SDEFUN |INT;random;$;29| (($ $)) (|random|)) 

(PUT '|INT;random;2$;30| '|SPADreplace| 'RANDOM) 

(SDEFUN |INT;random;2$;30| ((|x| $) ($ $)) (RANDOM |x|)) 

(PUT '|INT;=;2$B;31| '|SPADreplace| 'EQL) 

(SDEFUN |INT;=;2$B;31| ((|x| $) (|y| $) ($ |Boolean|)) (EQL |x| |y|)) 

(PUT '|INT;<;2$B;32| '|SPADreplace| '<) 

(SDEFUN |INT;<;2$B;32| ((|x| $) (|y| $) ($ |Boolean|)) (< |x| |y|)) 

(PUT '|INT;>=;2$B;33| '|SPADreplace| '>=) 

(SDEFUN |INT;>=;2$B;33| ((|x| $) (|y| $) ($ |Boolean|)) (>= |x| |y|)) 

(PUT '|INT;-;2$;34| '|SPADreplace| '-) 

(SDEFUN |INT;-;2$;34| ((|x| $) ($ $)) (- |x|)) 

(PUT '|INT;+;3$;35| '|SPADreplace| '+) 

(SDEFUN |INT;+;3$;35| ((|x| $) (|y| $) ($ $)) (+ |x| |y|)) 

(PUT '|INT;-;3$;36| '|SPADreplace| '-) 

(SDEFUN |INT;-;3$;36| ((|x| $) (|y| $) ($ $)) (- |x| |y|)) 

(PUT '|INT;*;3$;37| '|SPADreplace| '*) 

(SDEFUN |INT;*;3$;37| ((|x| $) (|y| $) ($ $)) (* |x| |y|)) 

(PUT '|INT;*;3$;38| '|SPADreplace| '*) 

(SDEFUN |INT;*;3$;38| ((|m| |Integer|) (|y| $) ($ $)) (* |m| |y|)) 

(PUT '|INT;^;$Nni$;39| '|SPADreplace| 'EXPT) 

(SDEFUN |INT;^;$Nni$;39| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (EXPT |x| |n|)) 

(PUT '|INT;odd?;$B;40| '|SPADreplace| 'ODDP) 

(SDEFUN |INT;odd?;$B;40| ((|x| $) ($ |Boolean|)) (ODDP |x|)) 

(PUT '|INT;max;3$;41| '|SPADreplace| 'MAX) 

(SDEFUN |INT;max;3$;41| ((|x| $) (|y| $) ($ $)) (MAX |x| |y|)) 

(PUT '|INT;min;3$;42| '|SPADreplace| 'MIN) 

(SDEFUN |INT;min;3$;42| ((|x| $) (|y| $) ($ $)) (MIN |x| |y|)) 

(PUT '|INT;divide;2$R;43| '|SPADreplace| 'DIVIDE2) 

(SDEFUN |INT;divide;2$R;43|
        ((|x| $) (|y| $)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (DIVIDE2 |x| |y|)) 

(PUT '|INT;quo;3$;44| '|SPADreplace| 'QUOTIENT2) 

(SDEFUN |INT;quo;3$;44| ((|x| $) (|y| $) ($ $)) (QUOTIENT2 |x| |y|)) 

(PUT '|INT;rem;3$;45| '|SPADreplace| 'REM) 

(SDEFUN |INT;rem;3$;45| ((|x| $) (|y| $) ($ $)) (REM |x| |y|)) 

(PUT '|INT;shift;3$;46| '|SPADreplace| 'ASH) 

(SDEFUN |INT;shift;3$;46| ((|x| $) (|y| $) ($ $)) (ASH |x| |y|)) 

(SDEFUN |INT;exquo;2$U;47| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (SPROG ((|z| (|SExpression|)))
               (SEQ
                (COND ((ZEROP |y|) (CONS 1 "failed"))
                      (#1='T
                       (SEQ (LETT |z| (INTEXQUO |x| |y|) |INT;exquo;2$U;47|)
                            (EXIT
                             (COND ((SPADCALL |z| (QREFELT $ 77)) (CONS 0 |z|))
                                   (#1# (CONS 1 "failed")))))))))) 

(SDEFUN |INT;recip;$U;48| ((|x| $) ($ |Union| $ "failed"))
        (COND ((OR (EQL |x| 1) (EQL |x| -1)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(PUT '|INT;gcd;3$;49| '|SPADreplace| 'GCD) 

(SDEFUN |INT;gcd;3$;49| ((|x| $) (|y| $) ($ $)) (GCD |x| |y|)) 

(SDEFUN |INT;unitNormal;$R;50|
        ((|x| $)
         ($ |Record| (|:| |unit| . #1=($)) (|:| |canonical| . #1#)
          (|:| |associate| . #1#)))
        (COND ((< |x| 0) (VECTOR -1 (- |x|) -1)) ('T (VECTOR 1 |x| 1)))) 

(PUT '|INT;unitCanonical;2$;51| '|SPADreplace| 'ABS) 

(SDEFUN |INT;unitCanonical;2$;51| ((|x| $) ($ $)) (ABS |x|)) 

(SDEFUN |INT;solveLinearPolynomialEquation|
        ((|lp| |List| (|SparseUnivariatePolynomial| $))
         (|p| |SparseUnivariatePolynomial| $)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| $)) "failed"))
        (SPADCALL |lp| |p| (QREFELT $ 89))) 

(SDEFUN |INT;squareFreePolynomial|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |p| (QREFELT $ 93))) 

(SDEFUN |INT;factorPolynomial|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPROG ((#1=#:G1461 NIL) (|pp| (|SparseUnivariatePolynomial| $)))
               (SEQ
                (LETT |pp| (SPADCALL |p| (QREFELT $ 94))
                      . #2=(|INT;factorPolynomial|))
                (EXIT
                 (COND
                  ((EQL (SPADCALL |pp| (QREFELT $ 95))
                        (SPADCALL |p| (QREFELT $ 95)))
                   (SPADCALL |p| (QREFELT $ 97)))
                  ('T
                   (SPADCALL (SPADCALL |pp| (QREFELT $ 97))
                             (SPADCALL (ELT $ 98)
                                       (SPADCALL
                                        (PROG2
                                            (LETT #1#
                                                  (SPADCALL
                                                   (SPADCALL |p|
                                                             (QREFELT $ 95))
                                                   (SPADCALL |pp|
                                                             (QREFELT $ 95))
                                                   (QREFELT $ 79))
                                                  . #2#)
                                            (QCDR #1#)
                                          (|check_union2| (QEQCAR #1# 0) $
                                                          (|Union| $ "failed")
                                                          #1#))
                                        (QREFELT $ 100))
                                       (QREFELT $ 104))
                             (QREFELT $ 106)))))))) 

(SDEFUN |INT;factorSquareFreePolynomial|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |p| (QREFELT $ 107))) 

(SDEFUN |INT;gcdPolynomial;3Sup;56|
        ((|p| . #1=(|SparseUnivariatePolynomial| $)) (|q| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (COND ((SPADCALL |p| (QREFELT $ 108)) (SPADCALL |q| (QREFELT $ 109)))
              ((SPADCALL |q| (QREFELT $ 108)) (SPADCALL |p| (QREFELT $ 109)))
              ('T (SPADCALL (LIST |p| |q|) (QREFELT $ 112))))) 

(SDEFUN |INT;opposite?;2$B;57| ((|x| $) (|y| $) ($ |Boolean|))
        (EQL |x| (- |y|))) 

(SDEFUN |INT;annihilate?;2$B;58| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((ZEROP |x|) 'T) ('T (ZEROP |y|)))) 

(DECLAIM (NOTINLINE |Integer;|)) 

(DEFUN |Integer| ()
  (SPROG NIL
         (PROG (#1=#:G1489)
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
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Integer|)))))))))) 

(DEFUN |Integer;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Integer|) . #1=(|Integer|))
          (LETT $ (GETREFV 131) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Integer| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 65
                    (QSETREFV $ 64
                              (CONS (|dispatchFunction| |INT;*;3$;38|) $)))
          $))) 

(MAKEPROP '|Integer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Void|) (|OpenMathDevice|)
              (0 . |OMputApp|) (|String|) (5 . |OMputSymbol|) (|Integer|)
              (12 . |OMputInteger|) (18 . |OMputEndApp|) (23 . |OMputObject|)
              (28 . |OMputEndObject|) (|Boolean|) |INT;OMwrite;Omd$BV;2|
              |INT;zero?;$B;3| |INT;one?;$B;4|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INT;Zero;$;5|) $))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INT;One;$;6|) $))
              |INT;base;$;7| |INT;copy;2$;8| |INT;inc;2$;9| |INT;dec;2$;10|
              (|HashState|) |INT;hashUpdate!;Hs$Hs;11| |INT;negative?;$B;12|
              (|OutputForm|) (33 . |outputForm|) |INT;coerce;$Of;13|
              |INT;coerce;2$;14| |INT;convert;2$;15| |INT;length;2$;16|
              |INT;addmod;4$;17| |INT;submod;4$;18| |INT;mulmod;4$;19|
              (|Float|) (38 . |coerce|) |INT;convert;$F;20| (|DoubleFloat|)
              |INT;convert;$Df;21| (|InputForm|) (43 . |convert|)
              |INT;convert;$If;22| |INT;convert;$S;23| |INT;latex;$S;24|
              |INT;positiveRemainder;3$;25| (|Matrix| 11) (|Matrix| $)
              |INT;reducedSystem;2M;26|
              (|Record| (|:| |mat| 49) (|:| |vec| (|Vector| 11))) (|Vector| $)
              |INT;reducedSystem;MVR;27| |INT;abs;2$;28| |INT;random;$;29|
              |INT;random;2$;30| |INT;=;2$B;31| |INT;<;2$B;32| |INT;>=;2$B;33|
              |INT;-;2$;34| |INT;+;3$;35| |INT;-;3$;36| NIL NIL
              (|NonNegativeInteger|) |INT;^;$Nni$;39| |INT;odd?;$B;40|
              |INT;max;3$;41| |INT;min;3$;42|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |INT;divide;2$R;43| |INT;quo;3$;44| |INT;rem;3$;45|
              |INT;shift;3$;46| (|SExpression|) (48 . |integer?|)
              (|Union| $ '"failed") |INT;exquo;2$U;47| |INT;recip;$U;48|
              |INT;gcd;3$;49|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              |INT;unitNormal;$R;50| |INT;unitCanonical;2$;51|
              (|Union| 86 '"failed") (|List| 87)
              (|SparseUnivariatePolynomial| 11)
              (|IntegerSolveLinearPolynomialEquation|)
              (53 . |solveLinearPolynomialEquation|) (|Factored| 91)
              (|SparseUnivariatePolynomial| $$)
              (|UnivariatePolynomialSquareFree| $$ 91) (59 . |squareFree|)
              (64 . |primitivePart|) (69 . |leadingCoefficient|)
              (|GaloisGroupFactorizer| 91) (74 . |factor|) (79 . |coerce|)
              (|Factored| $) (84 . |factor|) (|Mapping| 91 $$) (|Factored| $$)
              (|FactoredFunctions2| $$ 91) (89 . |map|)
              (|FactoredFunctionUtilities| 91) (95 . |mergeFactors|)
              (101 . |factorSquareFree|) (106 . |zero?|)
              (111 . |unitCanonical|) (|List| 91) (|HeuGcd| 91) (116 . |gcd|)
              (|SparseUnivariatePolynomial| $) |INT;gcdPolynomial;3Sup;56|
              |INT;opposite?;2$B;57| |INT;annihilate?;2$B;58| (|Fraction| 11)
              (|Union| 117 '"failed") (|PatternMatchResult| 11 $)
              (|Pattern| 11) (|Union| 11 '"failed")
              (|Record| (|:| |coef| 123) (|:| |generator| $)) (|List| $)
              (|Union| 123 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 126 '"failed")
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|PositiveInteger|) (|SingleInteger|))
           '#(~= 121 |zero?| 127 |unitNormal| 132 |unitCanonical| 137 |unit?|
              142 |symmetricRemainder| 147 |subtractIfCan| 153 |submod| 159
              |squareFreePart| 166 |squareFree| 171 |smaller?| 176 |sizeLess?|
              182 |sign| 188 |shift| 193 |sample| 199 |retractIfCan| 203
              |retract| 208 |rem| 213 |reducedSystem| 219 |recip| 230
              |rationalIfCan| 235 |rational?| 240 |rational| 245 |random| 250
              |quo| 259 |principalIdeal| 265 |prime?| 270 |powmod| 275
              |positiveRemainder| 282 |positive?| 288 |permutation| 293
              |patternMatch| 299 |opposite?| 306 |one?| 312 |odd?| 317
              |nextItem| 322 |negative?| 327 |multiEuclidean| 332 |mulmod| 338
              |min| 345 |max| 351 |mask| 357 |length| 362 |lcmCoef| 367 |lcm|
              373 |latex| 384 |invmod| 389 |init| 395 |inc| 399 |hashUpdate!|
              404 |hash| 410 |gcdPolynomial| 415 |gcd| 421 |factorial| 432
              |factor| 437 |extendedEuclidean| 442 |exquo| 455
              |expressIdealMember| 461 |even?| 467 |euclideanSize| 472 |divide|
              477 |differentiate| 483 |dec| 494 |copy| 499 |convert| 504
              |coerce| 534 |characteristic| 554 |bit?| 558 |binomial| 564
              |base| 570 |associates?| 574 |annihilate?| 580 |addmod| 586 |abs|
              593 ^ 598 |Zero| 610 |One| 614 |OMwrite| 618 D 642 >= 653 > 659 =
              665 <= 671 < 677 - 683 + 694 * 700)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |OrderedRing&| NIL |Algebra&| NIL |DifferentialRing&| NIL NIL
                |EntireRing&| |Module&| NIL NIL |Ring&| NIL NIL |Rng&| NIL NIL
                |AbelianGroup&| NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |Monoid&| NIL NIL NIL NIL |SemiGroup&| |AbelianSemiGroup&| NIL
                |SetCategory&| NIL NIL |OpenMath&| NIL NIL NIL NIL NIL NIL NIL
                NIL |RetractableTo&| NIL |PartialOrder&| NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|OrderedIntegralDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|OrderedRing|) (|LeftOreRing|) (|Algebra| $$)
                 (|LinearlyExplicitRingOver| 11) (|DifferentialRing|)
                 (|CharacteristicZero|) (|CommutativeRing|) (|EntireRing|)
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
                 (|ConvertibleTo| 38) (|ConvertibleTo| 41)
                 (|CombinatorialFunctionCategory|) (|ConvertibleTo| 120)
                 (|ConvertibleTo| 43) (|RetractableTo| 11) (|ConvertibleTo| 11)
                 (|PartialOrder|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 29))
              (|makeByteWordVec2| 130
                                  '(1 7 6 0 8 3 7 6 0 9 9 10 2 7 6 0 11 12 1 7
                                    6 0 13 1 7 6 0 14 1 7 6 0 15 1 29 0 11 30 1
                                    38 0 11 39 1 43 0 11 44 1 76 16 0 77 2 88
                                    85 86 87 89 1 92 90 91 93 1 91 0 0 94 1 91
                                    2 0 95 1 96 90 91 97 1 91 0 2 98 1 0 99 0
                                    100 2 103 90 101 102 104 2 105 90 90 90 106
                                    1 96 90 91 107 1 91 16 0 108 1 91 0 0 109 1
                                    111 91 110 112 2 0 16 0 0 1 1 0 16 0 18 1 0
                                    82 0 83 1 0 0 0 84 1 0 16 0 1 2 0 0 0 0 1 2
                                    0 78 0 0 1 3 0 0 0 0 0 36 1 0 0 0 1 1 0 99
                                    0 1 2 0 16 0 0 1 2 0 16 0 0 1 1 0 11 0 1 2
                                    0 0 0 0 75 0 0 0 1 1 0 121 0 1 1 0 11 0 1 2
                                    0 0 0 0 74 2 0 52 50 53 54 1 0 49 50 51 1 0
                                    78 0 80 1 0 118 0 1 1 0 16 0 1 1 0 117 0 1
                                    0 0 0 56 1 0 0 0 57 2 0 0 0 0 73 1 0 122
                                    123 1 1 0 16 0 1 3 0 0 0 0 0 1 2 0 0 0 0 48
                                    1 0 16 0 1 2 0 0 0 0 1 3 0 119 0 120 119 1
                                    2 0 16 0 0 115 1 0 16 0 19 1 0 16 0 68 1 0
                                    78 0 1 1 0 16 0 28 2 0 124 123 0 1 3 0 0 0
                                    0 0 37 2 0 0 0 0 70 2 0 0 0 0 69 1 0 0 0 1
                                    1 0 0 0 34 2 0 128 0 0 1 2 0 0 0 0 1 1 0 0
                                    123 1 1 0 9 0 47 2 0 0 0 0 1 0 0 0 1 1 0 0
                                    0 24 2 0 26 26 0 27 1 0 130 0 1 2 0 113 113
                                    113 114 1 0 0 123 1 2 0 0 0 0 81 1 0 0 0 1
                                    1 0 99 0 100 2 0 125 0 0 1 3 0 127 0 0 0 1
                                    2 0 78 0 0 79 2 0 124 123 0 1 1 0 16 0 1 1
                                    0 66 0 1 2 0 71 0 0 72 1 0 0 0 1 2 0 0 0 66
                                    1 1 0 0 0 25 1 0 0 0 23 1 0 9 0 46 1 0 41 0
                                    42 1 0 38 0 40 1 0 43 0 45 1 0 120 0 1 1 0
                                    11 0 33 1 0 0 11 32 1 0 0 11 32 1 0 0 0 1 1
                                    0 29 0 31 0 0 66 1 2 0 16 0 0 1 2 0 0 0 0 1
                                    0 0 0 22 2 0 16 0 0 1 2 0 16 0 0 116 3 0 0
                                    0 0 0 35 1 0 0 0 55 2 0 0 0 66 67 2 0 0 0
                                    129 1 0 0 0 20 0 0 0 21 3 0 6 7 0 16 17 2 0
                                    9 0 16 1 2 0 6 7 0 1 1 0 9 0 1 1 0 0 0 1 2
                                    0 0 0 66 1 2 0 16 0 0 60 2 0 16 0 0 1 2 0
                                    16 0 0 58 2 0 16 0 0 1 2 0 16 0 0 59 1 0 0
                                    0 61 2 0 0 0 0 63 2 0 0 0 0 62 2 0 0 11 0
                                    65 2 0 0 0 0 64 2 0 0 66 0 1 2 0 0 129 0
                                    1)))))
           '|lookupComplete|)) 

(MAKEPROP '|Integer| 'NILADIC T) 
