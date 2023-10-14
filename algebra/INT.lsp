
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

(SDEFUN |INT;solveLinearPolynomialEquation;LSupU;52|
        ((|lp| |List| #1=(|SparseUnivariatePolynomial| $)) (|p| . #1#)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| $)) "failed"))
        (SPADCALL |lp| |p| (QREFELT $ 89))) 

(SDEFUN |INT;squareFreePolynomial;SupF;53|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |p| (QREFELT $ 97))) 

(SDEFUN |INT;factorPolynomial;SupF;54|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPROG ((#1=#:G1467 NIL) (|pp| (|SparseUnivariatePolynomial| $)))
               (SEQ
                (LETT |pp| (SPADCALL |p| (QREFELT $ 100))
                      . #2=(|INT;factorPolynomial;SupF;54|))
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

(SDEFUN |INT;factorSquareFreePolynomial;SupF;55|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |p| (QREFELT $ 114))) 

(SDEFUN |INT;gcdPolynomial;3Sup;56|
        ((|p| . #1=(|SparseUnivariatePolynomial| $)) (|q| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (COND ((SPADCALL |p| (QREFELT $ 116)) (SPADCALL |q| (QREFELT $ 117)))
              ((SPADCALL |q| (QREFELT $ 116)) (SPADCALL |p| (QREFELT $ 117)))
              ('T (SPADCALL (LIST |p| |q|) (QREFELT $ 120))))) 

(SDEFUN |INT;opposite?;2$B;57| ((|x| $) (|y| $) ($ |Boolean|))
        (EQL |x| (- |y|))) 

(SDEFUN |INT;annihilate?;2$B;58| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((ZEROP |x|) 'T) ('T (ZEROP |y|)))) 

(DECLAIM (NOTINLINE |Integer;|)) 

(DEFUN |Integer| ()
  (SPROG NIL
         (PROG (#1=#:G1498)
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
              (53 . |solveLinearPolynomialEquation|) (|Union| 91 '"failed")
              (|List| 92) (|SparseUnivariatePolynomial| $)
              |INT;solveLinearPolynomialEquation;LSupU;52| (|Factored| 95)
              (|SparseUnivariatePolynomial| $$)
              (|UnivariatePolynomialSquareFree| $$ 95) (59 . |squareFree|)
              (|Factored| 92) |INT;squareFreePolynomial;SupF;53|
              (64 . |primitivePart|) (69 . |leadingCoefficient|)
              (|GaloisGroupFactorizer| 95) (74 . |factor|) (79 . |coerce|)
              (|Factored| $) (84 . |factor|) (|Mapping| 95 $$) (|Factored| $$)
              (|FactoredFunctions2| $$ 95) (89 . |map|)
              (|FactoredFunctionUtilities| 95) (95 . |mergeFactors|)
              |INT;factorPolynomial;SupF;54| (101 . |factorSquareFree|)
              |INT;factorSquareFreePolynomial;SupF;55| (106 . |zero?|)
              (111 . |unitCanonical|) (|List| 95) (|HeuGcd| 95) (116 . |gcd|)
              |INT;gcdPolynomial;3Sup;56| |INT;opposite?;2$B;57|
              |INT;annihilate?;2$B;58| (|Union| 53 '"failed")
              (|Union| 126 '"failed") (|Fraction| 11)
              (|PatternMatchResult| 11 $) (|Pattern| 11) (|Union| 11 '"failed")
              (|Record| (|:| |coef| 131) (|:| |generator| $)) (|List| $)
              (|Union| 131 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 134 '"failed")
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|PositiveInteger|) (|SingleInteger|))
           '#(~= 121 |zero?| 127 |unitNormal| 132 |unitCanonical| 137 |unit?|
              142 |symmetricRemainder| 147 |subtractIfCan| 153 |submod| 159
              |squareFreePolynomial| 166 |squareFreePart| 171 |squareFree| 176
              |solveLinearPolynomialEquation| 181 |smaller?| 187 |sizeLess?|
              193 |sign| 199 |shift| 204 |sample| 210 |retractIfCan| 214
              |retract| 219 |rem| 224 |reducedSystem| 230 |recip| 241
              |rationalIfCan| 246 |rational?| 251 |rational| 256 |random| 261
              |quo| 270 |principalIdeal| 276 |prime?| 281 |powmod| 286
              |positiveRemainder| 293 |positive?| 299 |permutation| 304
              |patternMatch| 310 |opposite?| 317 |one?| 323 |odd?| 328
              |nextItem| 333 |negative?| 338 |multiEuclidean| 343 |mulmod| 349
              |min| 356 |max| 362 |mask| 368 |length| 373 |lcmCoef| 378 |lcm|
              384 |latex| 395 |invmod| 400 |init| 406 |inc| 410 |hashUpdate!|
              415 |hash| 421 |gcdPolynomial| 426 |gcd| 432 |factorial| 443
              |factorSquareFreePolynomial| 448 |factorPolynomial| 453 |factor|
              458 |extendedEuclidean| 463 |exquo| 476 |expressIdealMember| 482
              |even?| 488 |euclideanSize| 493 |divide| 498 |differentiate| 504
              |dec| 515 |copy| 520 |convert| 525 |conditionP| 555 |coerce| 560
              |charthRoot| 580 |characteristic| 585 |bit?| 589 |binomial| 595
              |base| 601 |associates?| 605 |annihilate?| 611 |addmod| 617 |abs|
              624 ^ 629 |Zero| 641 |One| 645 |OMwrite| 649 D 673 >= 684 > 690 =
              696 <= 702 < 708 - 714 + 725 * 731)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |PolynomialFactorizationExplicit&|
                |EuclideanDomain&| |UniqueFactorizationDomain&| NIL NIL
                |GcdDomain&| NIL |OrderedRing&| NIL |Algebra&| NIL
                |DifferentialRing&| NIL NIL |EntireRing&| |Module&| NIL NIL
                |Ring&| NIL NIL |Rng&| NIL NIL |AbelianGroup&| NIL NIL NIL
                |OrderedSet&| |AbelianMonoid&| |Monoid&| NIL NIL NIL NIL
                |SemiGroup&| |AbelianSemiGroup&| NIL |SetCategory&| NIL NIL
                |OpenMath&| NIL NIL NIL NIL NIL NIL NIL NIL |RetractableTo&|
                NIL |PartialOrder&| NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|PolynomialFactorizationExplicit|)
                 (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|OrderedIntegralDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|OrderedRing|)
                 (|LeftOreRing|) (|Algebra| $$) (|LinearlyExplicitRingOver| 11)
                 (|DifferentialRing|) (|CharacteristicZero|)
                 (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|OrderedAbelianGroup|) (|BiModule| $$ $$) (|Ring|)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedSet|) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|StepThrough|) (|PatternMatchable| 11)
                 (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|RealConstant|) (|SetCategory|) (|canonicalsClosed|)
                 (|Canonical|) (|OpenMath|) (|ConvertibleTo| 9)
                 (|multiplicativeValuation|) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 38) (|ConvertibleTo| 41)
                 (|CombinatorialFunctionCategory|) (|ConvertibleTo| 128)
                 (|ConvertibleTo| 43) (|RetractableTo| 11) (|ConvertibleTo| 11)
                 (|PartialOrder|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 29))
              (|makeByteWordVec2| 138
                                  '(1 7 6 0 8 3 7 6 0 9 9 10 2 7 6 0 11 12 1 7
                                    6 0 13 1 7 6 0 14 1 7 6 0 15 1 29 0 11 30 1
                                    38 0 11 39 1 43 0 11 44 1 76 16 0 77 2 88
                                    85 86 87 89 1 96 94 95 97 1 95 0 0 100 1 95
                                    2 0 101 1 102 94 95 103 1 95 0 2 104 1 0
                                    105 0 106 2 109 94 107 108 110 2 111 94 94
                                    94 112 1 102 94 95 114 1 95 16 0 116 1 95 0
                                    0 117 1 119 95 118 120 2 0 16 0 0 1 1 0 16
                                    0 18 1 0 82 0 83 1 0 0 0 84 1 0 16 0 1 2 0
                                    0 0 0 1 2 0 78 0 0 1 3 0 0 0 0 0 36 1 0 98
                                    92 99 1 0 0 0 1 1 0 105 0 1 2 0 90 91 92 93
                                    2 0 16 0 0 1 2 0 16 0 0 1 1 0 11 0 1 2 0 0
                                    0 0 75 0 0 0 1 1 0 129 0 1 1 0 11 0 1 2 0 0
                                    0 0 74 1 0 49 50 51 2 0 52 50 53 54 1 0 78
                                    0 80 1 0 125 0 1 1 0 16 0 1 1 0 126 0 1 1 0
                                    0 0 57 0 0 0 56 2 0 0 0 0 73 1 0 130 131 1
                                    1 0 16 0 1 3 0 0 0 0 0 1 2 0 0 0 0 48 1 0
                                    16 0 1 2 0 0 0 0 1 3 0 127 0 128 127 1 2 0
                                    16 0 0 122 1 0 16 0 19 1 0 16 0 68 1 0 78 0
                                    1 1 0 16 0 28 2 0 132 131 0 1 3 0 0 0 0 0
                                    37 2 0 0 0 0 70 2 0 0 0 0 69 1 0 0 0 1 1 0
                                    0 0 34 2 0 136 0 0 1 2 0 0 0 0 1 1 0 0 131
                                    1 1 0 9 0 47 2 0 0 0 0 1 0 0 0 1 1 0 0 0 24
                                    2 0 26 26 0 27 1 0 138 0 1 2 0 92 92 92 121
                                    2 0 0 0 0 81 1 0 0 131 1 1 0 0 0 1 1 0 98
                                    92 115 1 0 98 92 113 1 0 105 0 106 2 0 133
                                    0 0 1 3 0 135 0 0 0 1 2 0 78 0 0 79 2 0 132
                                    131 0 1 1 0 16 0 1 1 0 66 0 1 2 0 71 0 0 72
                                    1 0 0 0 1 2 0 0 0 66 1 1 0 0 0 25 1 0 0 0
                                    23 1 0 9 0 46 1 0 41 0 42 1 0 38 0 40 1 0
                                    43 0 45 1 0 128 0 1 1 0 11 0 33 1 1 124 50
                                    1 1 0 0 11 32 1 0 0 0 1 1 0 0 11 32 1 0 29
                                    0 31 1 1 78 0 1 0 0 66 1 2 0 16 0 0 1 2 0 0
                                    0 0 1 0 0 0 22 2 0 16 0 0 1 2 0 16 0 0 123
                                    3 0 0 0 0 0 35 1 0 0 0 55 2 0 0 0 66 67 2 0
                                    0 0 137 1 0 0 0 20 0 0 0 21 3 0 6 7 0 16 17
                                    2 0 6 7 0 1 1 0 9 0 1 2 0 9 0 16 1 1 0 0 0
                                    1 2 0 0 0 66 1 2 0 16 0 0 60 2 0 16 0 0 1 2
                                    0 16 0 0 58 2 0 16 0 0 1 2 0 16 0 0 59 2 0
                                    0 0 0 63 1 0 0 0 61 2 0 0 0 0 62 2 0 0 0 0
                                    64 2 0 0 11 0 65 2 0 0 66 0 1 2 0 0 137 0
                                    1)))))
           '|lookupComplete|)) 

(MAKEPROP '|Integer| 'NILADIC T) 
