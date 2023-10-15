
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
                    (COND
                     ((< (SPADCALL 1 (QREFELT $ 48)) |x|)
                      (COND ((< |x| 10) (EXIT |s|)))))
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

(PUT '|INT;random;2$;29| '|SPADreplace| 'RANDOM) 

(SDEFUN |INT;random;2$;29| ((|x| $) ($ $)) (RANDOM |x|)) 

(PUT '|INT;=;2$B;30| '|SPADreplace| 'EQL) 

(SDEFUN |INT;=;2$B;30| ((|x| $) (|y| $) ($ |Boolean|)) (EQL |x| |y|)) 

(PUT '|INT;<;2$B;31| '|SPADreplace| '<) 

(SDEFUN |INT;<;2$B;31| ((|x| $) (|y| $) ($ |Boolean|)) (< |x| |y|)) 

(PUT '|INT;>=;2$B;32| '|SPADreplace| '>=) 

(SDEFUN |INT;>=;2$B;32| ((|x| $) (|y| $) ($ |Boolean|)) (>= |x| |y|)) 

(PUT '|INT;-;2$;33| '|SPADreplace| '-) 

(SDEFUN |INT;-;2$;33| ((|x| $) ($ $)) (- |x|)) 

(PUT '|INT;+;3$;34| '|SPADreplace| '+) 

(SDEFUN |INT;+;3$;34| ((|x| $) (|y| $) ($ $)) (+ |x| |y|)) 

(PUT '|INT;-;3$;35| '|SPADreplace| '-) 

(SDEFUN |INT;-;3$;35| ((|x| $) (|y| $) ($ $)) (- |x| |y|)) 

(PUT '|INT;*;3$;36| '|SPADreplace| '*) 

(SDEFUN |INT;*;3$;36| ((|x| $) (|y| $) ($ $)) (* |x| |y|)) 

(PUT '|INT;*;3$;37| '|SPADreplace| '*) 

(SDEFUN |INT;*;3$;37| ((|m| |Integer|) (|y| $) ($ $)) (* |m| |y|)) 

(PUT '|INT;^;$Nni$;38| '|SPADreplace| 'EXPT) 

(SDEFUN |INT;^;$Nni$;38| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (EXPT |x| |n|)) 

(PUT '|INT;odd?;$B;39| '|SPADreplace| 'ODDP) 

(SDEFUN |INT;odd?;$B;39| ((|x| $) ($ |Boolean|)) (ODDP |x|)) 

(PUT '|INT;max;3$;40| '|SPADreplace| 'MAX) 

(SDEFUN |INT;max;3$;40| ((|x| $) (|y| $) ($ $)) (MAX |x| |y|)) 

(PUT '|INT;min;3$;41| '|SPADreplace| 'MIN) 

(SDEFUN |INT;min;3$;41| ((|x| $) (|y| $) ($ $)) (MIN |x| |y|)) 

(PUT '|INT;divide;2$R;42| '|SPADreplace| 'DIVIDE2) 

(SDEFUN |INT;divide;2$R;42|
        ((|x| $) (|y| $)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (DIVIDE2 |x| |y|)) 

(PUT '|INT;quo;3$;43| '|SPADreplace| 'QUOTIENT2) 

(SDEFUN |INT;quo;3$;43| ((|x| $) (|y| $) ($ $)) (QUOTIENT2 |x| |y|)) 

(PUT '|INT;rem;3$;44| '|SPADreplace| 'REM) 

(SDEFUN |INT;rem;3$;44| ((|x| $) (|y| $) ($ $)) (REM |x| |y|)) 

(PUT '|INT;shift;3$;45| '|SPADreplace| 'ASH) 

(SDEFUN |INT;shift;3$;45| ((|x| $) (|y| $) ($ $)) (ASH |x| |y|)) 

(SDEFUN |INT;exquo;2$U;46| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (SPROG ((|z| (|SExpression|)))
               (SEQ
                (COND ((ZEROP |y|) (CONS 1 "failed"))
                      (#1='T
                       (SEQ (LETT |z| (INTEXQUO |x| |y|) |INT;exquo;2$U;46|)
                            (EXIT
                             (COND ((SPADCALL |z| (QREFELT $ 77)) (CONS 0 |z|))
                                   (#1# (CONS 1 "failed")))))))))) 

(SDEFUN |INT;recip;$U;47| ((|x| $) ($ |Union| $ "failed"))
        (COND ((OR (EQL |x| 1) (EQL |x| -1)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(PUT '|INT;gcd;3$;48| '|SPADreplace| 'GCD) 

(SDEFUN |INT;gcd;3$;48| ((|x| $) (|y| $) ($ $)) (GCD |x| |y|)) 

(SDEFUN |INT;unitNormal;$R;49|
        ((|x| $)
         ($ |Record| (|:| |unit| . #1=($)) (|:| |canonical| . #1#)
          (|:| |associate| . #1#)))
        (COND ((< |x| 0) (VECTOR -1 (- |x|) -1)) ('T (VECTOR 1 |x| 1)))) 

(PUT '|INT;unitCanonical;2$;50| '|SPADreplace| 'ABS) 

(SDEFUN |INT;unitCanonical;2$;50| ((|x| $) ($ $)) (ABS |x|)) 

(SDEFUN |INT;solveLinearPolynomialEquation;LSupU;51|
        ((|lp| |List| #1=(|SparseUnivariatePolynomial| $)) (|p| . #1#)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| $)) "failed"))
        (SPADCALL |lp| |p| (QREFELT $ 89))) 

(SDEFUN |INT;squareFreePolynomial;SupF;52|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |p| (QREFELT $ 97))) 

(SDEFUN |INT;factorPolynomial;SupF;53|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPROG ((#1=#:G1464 NIL) (|pp| (|SparseUnivariatePolynomial| $)))
               (SEQ
                (LETT |pp| (SPADCALL |p| (QREFELT $ 100))
                      . #2=(|INT;factorPolynomial;SupF;53|))
                (EXIT
                 (COND
                  ((EQL (SPADCALL |pp| (QREFELT $ 101))
                        (SPADCALL |p| (QREFELT $ 101)))
                   (SPADCALL |p| (QREFELT $ 103)))
                  ('T
                   (SPADCALL (SPADCALL |pp| (QREFELT $ 103))
                             (SPADCALL (ELT $ 104)
                                       (SPADCALL
                                        (PROG2
                                            (LETT #1#
                                                  (SPADCALL
                                                   (SPADCALL |p|
                                                             (QREFELT $ 101))
                                                   (SPADCALL |pp|
                                                             (QREFELT $ 101))
                                                   (QREFELT $ 79))
                                                  . #2#)
                                            (QCDR #1#)
                                          (|check_union2| (QEQCAR #1# 0) $
                                                          (|Union| $ "failed")
                                                          #1#))
                                        (QREFELT $ 106))
                                       (QREFELT $ 110))
                             (QREFELT $ 112)))))))) 

(SDEFUN |INT;factorSquareFreePolynomial;SupF;54|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |p| (QREFELT $ 114))) 

(SDEFUN |INT;gcdPolynomial;3Sup;55|
        ((|p| . #1=(|SparseUnivariatePolynomial| $)) (|q| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (COND ((SPADCALL |p| (QREFELT $ 116)) (SPADCALL |q| (QREFELT $ 117)))
              ((SPADCALL |q| (QREFELT $ 116)) (SPADCALL |p| (QREFELT $ 117)))
              ('T (SPADCALL (LIST |p| |q|) (QREFELT $ 120))))) 

(SDEFUN |INT;opposite?;2$B;56| ((|x| $) (|y| $) ($ |Boolean|))
        (EQL |x| (- |y|))) 

(SDEFUN |INT;annihilate?;2$B;57| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((ZEROP |x|) 'T) ('T (ZEROP |y|)))) 

(DECLAIM (NOTINLINE |Integer;|)) 

(DEFUN |Integer| ()
  (SPROG NIL
         (PROG (#1=#:G1495)
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
          (LETT $ (GETREFV 139) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Integer| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (AND (|HasCategory| $ '(|CharacteristicNonZero|))
               (|augmentPredVector| $ 1))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 65
                    (QSETREFV $ 66
                              (CONS (|dispatchFunction| |INT;*;3$;37|) $)))
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
              |INT;convert;$If;22| |INT;convert;$S;23| (|NonNegativeInteger|)
              (48 . -) |INT;latex;$S;24| |INT;positiveRemainder;3$;25|
              (|Matrix| 11) (|Matrix| $) |INT;reducedSystem;2M;26|
              (|Record| (|:| |mat| 51) (|:| |vec| (|Vector| 11))) (|Vector| $)
              |INT;reducedSystem;MVR;27| |INT;abs;2$;28| |INT;random;2$;29|
              |INT;=;2$B;30| |INT;<;2$B;31| |INT;>=;2$B;32| |INT;-;2$;33|
              |INT;+;3$;34| |INT;-;3$;35| NIL NIL |INT;^;$Nni$;38|
              |INT;odd?;$B;39| |INT;max;3$;40| |INT;min;3$;41|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |INT;divide;2$R;42| |INT;quo;3$;43| |INT;rem;3$;44|
              |INT;shift;3$;45| (|SExpression|) (53 . |integer?|)
              (|Union| $ '"failed") |INT;exquo;2$U;46| |INT;recip;$U;47|
              |INT;gcd;3$;48|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              |INT;unitNormal;$R;49| |INT;unitCanonical;2$;50|
              (|Union| 86 '"failed") (|List| 87)
              (|SparseUnivariatePolynomial| 11)
              (|IntegerSolveLinearPolynomialEquation|)
              (58 . |solveLinearPolynomialEquation|) (|Union| 91 '"failed")
              (|List| 92) (|SparseUnivariatePolynomial| $)
              |INT;solveLinearPolynomialEquation;LSupU;51| (|Factored| 95)
              (|SparseUnivariatePolynomial| $$)
              (|UnivariatePolynomialSquareFree| $$ 95) (64 . |squareFree|)
              (|Factored| 92) |INT;squareFreePolynomial;SupF;52|
              (69 . |primitivePart|) (74 . |leadingCoefficient|)
              (|GaloisGroupFactorizer| 95) (79 . |factor|) (84 . |coerce|)
              (|Factored| $) (89 . |factor|) (|Mapping| 95 $$) (|Factored| $$)
              (|FactoredFunctions2| $$ 95) (94 . |map|)
              (|FactoredFunctionUtilities| 95) (100 . |mergeFactors|)
              |INT;factorPolynomial;SupF;53| (106 . |factorSquareFree|)
              |INT;factorSquareFreePolynomial;SupF;54| (111 . |zero?|)
              (116 . |unitCanonical|) (|List| 95) (|HeuGcd| 95) (121 . |gcd|)
              |INT;gcdPolynomial;3Sup;55| |INT;opposite?;2$B;56|
              |INT;annihilate?;2$B;57| (|Union| 55 '"failed") (|Fraction| 11)
              (|Union| 125 '"failed") (|PatternMatchResult| 11 $)
              (|Pattern| 11) (|Union| 11 '"failed") (|Union| 131 '"failed")
              (|List| $) (|Record| (|:| |coef| 131) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 134 '"failed")
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|PositiveInteger|) (|SingleInteger|))
           '#(~= 126 |zero?| 132 |unitNormal| 137 |unitCanonical| 142 |unit?|
              147 |symmetricRemainder| 152 |subtractIfCan| 158 |submod| 164
              |squareFreePolynomial| 171 |squareFreePart| 176 |squareFree| 181
              |solveLinearPolynomialEquation| 186 |smaller?| 192 |sizeLess?|
              198 |sign| 204 |shift| 209 |sample| 215 |rightRecip| 219
              |rightPower| 224 |retractIfCan| 236 |retract| 241 |rem| 246
              |reducedSystem| 252 |recip| 263 |rationalIfCan| 268 |rational?|
              273 |rational| 278 |random| 283 |quo| 288 |principalIdeal| 294
              |prime?| 299 |powmod| 304 |positiveRemainder| 311 |positive?| 317
              |permutation| 322 |patternMatch| 328 |opposite?| 335 |one?| 341
              |odd?| 346 |nextItem| 351 |negative?| 356 |multiEuclidean| 361
              |mulmod| 367 |min| 374 |max| 380 |mask| 386 |length| 391
              |leftRecip| 396 |leftPower| 401 |lcmCoef| 413 |lcm| 419 |latex|
              430 |invmod| 435 |init| 441 |inc| 445 |hashUpdate!| 450 |hash|
              456 |gcdPolynomial| 461 |gcd| 467 |factorial| 478
              |factorSquareFreePolynomial| 483 |factorPolynomial| 488 |factor|
              493 |extendedEuclidean| 498 |exquo| 511 |expressIdealMember| 517
              |even?| 523 |euclideanSize| 528 |divide| 533 |differentiate| 539
              |dec| 550 |copy| 555 |convert| 560 |conditionP| 590 |commutator|
              595 |coerce| 601 |charthRoot| 621 |characteristic| 626 |bit?| 630
              |binomial| 636 |base| 642 |associator| 646 |associates?| 653
              |antiCommutator| 659 |annihilate?| 665 |addmod| 671 |abs| 678 ^
              683 |Zero| 695 |One| 699 |OMwrite| 703 D 727 >= 738 > 744 = 750
              <= 756 < 762 - 768 + 779 * 785)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |PolynomialFactorizationExplicit&|
                |EuclideanDomain&| |UniqueFactorizationDomain&| NIL NIL
                |GcdDomain&| |OrderedRing&| NIL NIL NIL |DifferentialRing&| NIL
                NIL |EntireRing&| |Algebra&| NIL |Rng&| NIL |Module&| NIL NIL
                NIL |NonAssociativeRing&| NIL NIL |NonAssociativeRng&| NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL |OrderedSet&| NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&| NIL
                NIL NIL |Magma&| |AbelianSemiGroup&| NIL |SetCategory&| NIL NIL
                |OpenMath&| NIL NIL NIL NIL NIL NIL NIL NIL |RetractableTo&|
                NIL |PartialOrder&| NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|PolynomialFactorizationExplicit|)
                 (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|OrderedIntegralDomain|)
                 (|GcdDomain|) (|OrderedRing|) (|IntegralDomain|)
                 (|LeftOreRing|) (|LinearlyExplicitOver| 11)
                 (|DifferentialRing|) (|CharacteristicZero|)
                 (|CommutativeRing|) (|EntireRing|) (|Algebra| $$) (|Ring|)
                 (|Rng|) (|SemiRing|) (|Module| $$) (|SemiRng|)
                 (|OrderedAbelianGroup|) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| $$) (|NonAssociativeRng|) (|RightModule| $$)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedSet|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|StepThrough|)
                 (|PatternMatchable| 11) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|RealConstant|) (|SetCategory|)
                 (|canonicalsClosed|) (|Canonical|) (|OpenMath|)
                 (|ConvertibleTo| 9) (|multiplicativeValuation|)
                 (|canonicalUnitNormal|) (|ConvertibleTo| 38)
                 (|ConvertibleTo| 41) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 128) (|ConvertibleTo| 43)
                 (|RetractableTo| 11) (|ConvertibleTo| 11) (|PartialOrder|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 29))
              (|makeByteWordVec2| 138
                                  '(1 7 6 0 8 3 7 6 0 9 9 10 2 7 6 0 11 12 1 7
                                    6 0 13 1 7 6 0 14 1 7 6 0 15 1 29 0 11 30 1
                                    38 0 11 39 1 43 0 11 44 1 47 0 0 48 1 76 16
                                    0 77 2 88 85 86 87 89 1 96 94 95 97 1 95 0
                                    0 100 1 95 2 0 101 1 102 94 95 103 1 95 0 2
                                    104 1 0 105 0 106 2 109 94 107 108 110 2
                                    111 94 94 94 112 1 102 94 95 114 1 95 16 0
                                    116 1 95 0 0 117 1 119 95 118 120 2 0 16 0
                                    0 1 1 0 16 0 18 1 0 82 0 83 1 0 0 0 84 1 0
                                    16 0 1 2 0 0 0 0 1 2 0 78 0 0 1 3 0 0 0 0 0
                                    36 1 0 98 92 99 1 0 0 0 1 1 0 105 0 1 2 0
                                    90 91 92 93 2 0 16 0 0 1 2 0 16 0 0 1 1 0
                                    11 0 1 2 0 0 0 0 75 0 0 0 1 1 0 78 0 1 2 0
                                    0 0 47 1 2 0 0 0 137 1 1 0 129 0 1 1 0 11 0
                                    1 2 0 0 0 0 74 2 0 54 52 55 56 1 0 51 52 53
                                    1 0 78 0 80 1 0 126 0 1 1 0 16 0 1 1 0 125
                                    0 1 1 0 0 0 58 2 0 0 0 0 73 1 0 132 131 1 1
                                    0 16 0 1 3 0 0 0 0 0 1 2 0 0 0 0 50 1 0 16
                                    0 1 2 0 0 0 0 1 3 0 127 0 128 127 1 2 0 16
                                    0 0 122 1 0 16 0 19 1 0 16 0 68 1 0 78 0 1
                                    1 0 16 0 28 2 0 130 131 0 1 3 0 0 0 0 0 37
                                    2 0 0 0 0 70 2 0 0 0 0 69 1 0 0 0 1 1 0 0 0
                                    34 1 0 78 0 1 2 0 0 0 47 1 2 0 0 0 137 1 2
                                    0 136 0 0 1 1 0 0 131 1 2 0 0 0 0 1 1 0 9 0
                                    49 2 0 0 0 0 1 0 0 0 1 1 0 0 0 24 2 0 26 26
                                    0 27 1 0 138 0 1 2 0 92 92 92 121 1 0 0 131
                                    1 2 0 0 0 0 81 1 0 0 0 1 1 0 98 92 115 1 0
                                    98 92 113 1 0 105 0 106 2 0 133 0 0 1 3 0
                                    135 0 0 0 1 2 0 78 0 0 79 2 0 130 131 0 1 1
                                    0 16 0 1 1 0 47 0 1 2 0 71 0 0 72 1 0 0 0 1
                                    2 0 0 0 47 1 1 0 0 0 25 1 0 0 0 23 1 0 9 0
                                    46 1 0 38 0 40 1 0 41 0 42 1 0 43 0 45 1 0
                                    128 0 1 1 0 11 0 33 1 1 124 52 1 2 0 0 0 0
                                    1 1 0 0 11 32 1 0 0 0 1 1 0 0 11 32 1 0 29
                                    0 31 1 1 78 0 1 0 0 47 1 2 0 16 0 0 1 2 0 0
                                    0 0 1 0 0 0 22 3 0 0 0 0 0 1 2 0 16 0 0 1 2
                                    0 0 0 0 1 2 0 16 0 0 123 3 0 0 0 0 0 35 1 0
                                    0 0 57 2 0 0 0 47 67 2 0 0 0 137 1 0 0 0 20
                                    0 0 0 21 3 0 6 7 0 16 17 2 0 9 0 16 1 2 0 6
                                    7 0 1 1 0 9 0 1 1 0 0 0 1 2 0 0 0 47 1 2 0
                                    16 0 0 61 2 0 16 0 0 1 2 0 16 0 0 59 2 0 16
                                    0 0 1 2 0 16 0 0 60 2 0 0 0 0 64 1 0 0 0 62
                                    2 0 0 0 0 63 2 0 0 47 0 1 2 0 0 11 0 66 2 0
                                    0 0 0 65 2 0 0 137 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|Integer| 'NILADIC T) 
