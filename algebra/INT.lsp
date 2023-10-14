
(SDEFUN |INT;writeOMInt| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ
         (COND
          ((< |x| 0)
           (SEQ (SPADCALL |dev| (QREFELT $ 8))
                (SPADCALL |dev| "arith1" "unary_minus" (QREFELT $ 10))
                (SPADCALL |dev| (- |x|) (QREFELT $ 12))
                (EXIT (SPADCALL |dev| (QREFELT $ 13)))))
          ('T (SPADCALL |dev| |x| (QREFELT $ 12)))))) 

(SDEFUN |INT;OMwrite;$S;2| ((|x| $) ($ |String|))
        (SPROG ((|s| (|String|)) (|dev| (|OpenMathDevice|)) (|sp| NIL))
               (SEQ (LETT |s| "" . #1=(|INT;OMwrite;$S;2|))
                    (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
                    (LETT |dev|
                          (SPADCALL |sp| (SPADCALL (QREFELT $ 15))
                                    (QREFELT $ 16))
                          . #1#)
                    (SPADCALL |dev| (QREFELT $ 17))
                    (|INT;writeOMInt| |dev| |x| $)
                    (SPADCALL |dev| (QREFELT $ 18))
                    (SPADCALL |dev| (QREFELT $ 19))
                    (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|)))) 

(SDEFUN |INT;OMwrite;$BS;3| ((|x| $) (|wholeObj| |Boolean|) ($ |String|))
        (SPROG ((|s| (|String|)) (|dev| (|OpenMathDevice|)) (|sp| NIL))
               (SEQ (LETT |s| "" . #1=(|INT;OMwrite;$BS;3|))
                    (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
                    (LETT |dev|
                          (SPADCALL |sp| (SPADCALL (QREFELT $ 15))
                                    (QREFELT $ 16))
                          . #1#)
                    (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 17))))
                    (|INT;writeOMInt| |dev| |x| $)
                    (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 18))))
                    (SPADCALL |dev| (QREFELT $ 19))
                    (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|)))) 

(SDEFUN |INT;OMwrite;Omd$V;4| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 17)) (|INT;writeOMInt| |dev| |x| $)
             (EXIT (SPADCALL |dev| (QREFELT $ 18))))) 

(SDEFUN |INT;OMwrite;Omd$BV;5|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 17))))
             (|INT;writeOMInt| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 18))))))) 

(PUT '|INT;zero?;$B;6| '|SPADreplace| 'ZEROP) 

(SDEFUN |INT;zero?;$B;6| ((|x| $) ($ |Boolean|)) (ZEROP |x|)) 

(PUT '|INT;one?;$B;7| '|SPADreplace| '(XLAM (|x|) (EQL |x| 1))) 

(SDEFUN |INT;one?;$B;7| ((|x| $) ($ |Boolean|)) (EQL |x| 1)) 

(PUT '|INT;Zero;$;8| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |INT;Zero;$;8| (($ $)) 0) 

(PUT '|INT;One;$;9| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |INT;One;$;9| (($ $)) 1) 

(PUT '|INT;base;$;10| '|SPADreplace| '(XLAM NIL 2)) 

(SDEFUN |INT;base;$;10| (($ $)) 2) 

(PUT '|INT;copy;2$;11| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INT;copy;2$;11| ((|x| $) ($ $)) |x|) 

(PUT '|INT;inc;2$;12| '|SPADreplace| '(XLAM (|x|) (+ |x| 1))) 

(SDEFUN |INT;inc;2$;12| ((|x| $) ($ $)) (+ |x| 1)) 

(PUT '|INT;dec;2$;13| '|SPADreplace| '(XLAM (|x|) (- |x| 1))) 

(SDEFUN |INT;dec;2$;13| ((|x| $) ($ $)) (- |x| 1)) 

(SDEFUN |INT;hashUpdate!;Hs$Hs;14|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(PUT '|INT;negative?;$B;15| '|SPADreplace| 'MINUSP) 

(SDEFUN |INT;negative?;$B;15| ((|x| $) ($ |Boolean|)) (MINUSP |x|)) 

(SDEFUN |INT;coerce;$Of;16| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 37))) 

(PUT '|INT;coerce;2$;17| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |INT;coerce;2$;17| ((|m| |Integer|) ($ $)) |m|) 

(PUT '|INT;convert;2$;18| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INT;convert;2$;18| ((|x| $) ($ |Integer|)) |x|) 

(PUT '|INT;length;2$;19| '|SPADreplace| 'INTEGER-LENGTH) 

(SDEFUN |INT;length;2$;19| ((|a| $) ($ $)) (INTEGER-LENGTH |a|)) 

(SDEFUN |INT;addmod;4$;20| ((|a| $) (|b| $) (|p| $) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (+ |a| |b|) |INT;addmod;4$;20|)
                    (EXIT (COND ((>= |c| |p|) (- |c| |p|)) ('T |c|)))))) 

(SDEFUN |INT;submod;4$;21| ((|a| $) (|b| $) (|p| $) ($ $))
        (SPROG ((|c| ($)))
               (SEQ (LETT |c| (- |a| |b|) |INT;submod;4$;21|)
                    (EXIT (COND ((< |c| 0) (+ |c| |p|)) ('T |c|)))))) 

(SDEFUN |INT;mulmod;4$;22| ((|a| $) (|b| $) (|p| $) ($ $))
        (REM (* |a| |b|) |p|)) 

(SDEFUN |INT;convert;$F;23| ((|x| $) ($ |Float|)) (SPADCALL |x| (QREFELT $ 46))) 

(PUT '|INT;convert;$Df;24| '|SPADreplace|
     '(XLAM (|x|) (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |INT;convert;$Df;24| ((|x| $) ($ |DoubleFloat|))
        (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |INT;convert;$If;25| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 51))) 

(PUT '|INT;convert;$S;26| '|SPADreplace| 'STRINGIMAGE) 

(SDEFUN |INT;convert;$S;26| ((|x| $) ($ |String|)) (STRINGIMAGE |x|)) 

(SDEFUN |INT;latex;$S;27| ((|x| $) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ (LETT |s| (STRINGIMAGE |x|) |INT;latex;$S;27|)
                    (COND ((< -1 |x|) (COND ((< |x| 10) (EXIT |s|)))))
                    (EXIT (STRCONC "{" (STRCONC |s| "}")))))) 

(SDEFUN |INT;positiveRemainder;3$;28| ((|a| $) (|b| $) ($ $))
        (SPROG ((|r| ($)))
               (COND
                ((MINUSP
                  (LETT |r| (REM |a| |b|) |INT;positiveRemainder;3$;28|))
                 (COND ((MINUSP |b|) (- |r| |b|)) (#1='T (+ |r| |b|))))
                (#1# |r|)))) 

(PUT '|INT;reducedSystem;2M;29| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |INT;reducedSystem;2M;29| ((|m| |Matrix| $) ($ |Matrix| (|Integer|)))
        |m|) 

(SDEFUN |INT;reducedSystem;MVR;30|
        ((|m| |Matrix| . #1=($)) (|v| |Vector| . #1#)
         ($ |Record| (|:| |mat| (|Matrix| (|Integer|)))
          (|:| |vec| (|Vector| (|Integer|)))))
        (CONS |m| '|vec|)) 

(PUT '|INT;abs;2$;31| '|SPADreplace| 'ABS) 

(SDEFUN |INT;abs;2$;31| ((|x| $) ($ $)) (ABS |x|)) 

(PUT '|INT;random;$;32| '|SPADreplace| '|random|) 

(SDEFUN |INT;random;$;32| (($ $)) (|random|)) 

(PUT '|INT;random;2$;33| '|SPADreplace| 'RANDOM) 

(SDEFUN |INT;random;2$;33| ((|x| $) ($ $)) (RANDOM |x|)) 

(PUT '|INT;=;2$B;34| '|SPADreplace| 'EQL) 

(SDEFUN |INT;=;2$B;34| ((|x| $) (|y| $) ($ |Boolean|)) (EQL |x| |y|)) 

(PUT '|INT;<;2$B;35| '|SPADreplace| '<) 

(SDEFUN |INT;<;2$B;35| ((|x| $) (|y| $) ($ |Boolean|)) (< |x| |y|)) 

(PUT '|INT;>=;2$B;36| '|SPADreplace| '>=) 

(SDEFUN |INT;>=;2$B;36| ((|x| $) (|y| $) ($ |Boolean|)) (>= |x| |y|)) 

(PUT '|INT;-;2$;37| '|SPADreplace| '-) 

(SDEFUN |INT;-;2$;37| ((|x| $) ($ $)) (- |x|)) 

(PUT '|INT;+;3$;38| '|SPADreplace| '+) 

(SDEFUN |INT;+;3$;38| ((|x| $) (|y| $) ($ $)) (+ |x| |y|)) 

(PUT '|INT;-;3$;39| '|SPADreplace| '-) 

(SDEFUN |INT;-;3$;39| ((|x| $) (|y| $) ($ $)) (- |x| |y|)) 

(PUT '|INT;*;3$;40| '|SPADreplace| '*) 

(SDEFUN |INT;*;3$;40| ((|x| $) (|y| $) ($ $)) (* |x| |y|)) 

(PUT '|INT;*;3$;41| '|SPADreplace| '*) 

(SDEFUN |INT;*;3$;41| ((|m| |Integer|) (|y| $) ($ $)) (* |m| |y|)) 

(PUT '|INT;^;$Nni$;42| '|SPADreplace| 'EXPT) 

(SDEFUN |INT;^;$Nni$;42| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (EXPT |x| |n|)) 

(PUT '|INT;odd?;$B;43| '|SPADreplace| 'ODDP) 

(SDEFUN |INT;odd?;$B;43| ((|x| $) ($ |Boolean|)) (ODDP |x|)) 

(PUT '|INT;max;3$;44| '|SPADreplace| 'MAX) 

(SDEFUN |INT;max;3$;44| ((|x| $) (|y| $) ($ $)) (MAX |x| |y|)) 

(PUT '|INT;min;3$;45| '|SPADreplace| 'MIN) 

(SDEFUN |INT;min;3$;45| ((|x| $) (|y| $) ($ $)) (MIN |x| |y|)) 

(PUT '|INT;divide;2$R;46| '|SPADreplace| 'DIVIDE2) 

(SDEFUN |INT;divide;2$R;46|
        ((|x| $) (|y| $)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (DIVIDE2 |x| |y|)) 

(PUT '|INT;quo;3$;47| '|SPADreplace| 'QUOTIENT2) 

(SDEFUN |INT;quo;3$;47| ((|x| $) (|y| $) ($ $)) (QUOTIENT2 |x| |y|)) 

(PUT '|INT;rem;3$;48| '|SPADreplace| 'REM) 

(SDEFUN |INT;rem;3$;48| ((|x| $) (|y| $) ($ $)) (REM |x| |y|)) 

(PUT '|INT;shift;3$;49| '|SPADreplace| 'ASH) 

(SDEFUN |INT;shift;3$;49| ((|x| $) (|y| $) ($ $)) (ASH |x| |y|)) 

(SDEFUN |INT;exquo;2$U;50| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (SPROG ((|z| (|SExpression|)))
               (SEQ
                (COND ((ZEROP |y|) (CONS 1 "failed"))
                      (#1='T
                       (SEQ (LETT |z| (INTEXQUO |x| |y|) |INT;exquo;2$U;50|)
                            (EXIT
                             (COND ((SPADCALL |z| (QREFELT $ 84)) (CONS 0 |z|))
                                   (#1# (CONS 1 "failed")))))))))) 

(SDEFUN |INT;recip;$U;51| ((|x| $) ($ |Union| $ "failed"))
        (COND ((OR (EQL |x| 1) (EQL |x| -1)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(PUT '|INT;gcd;3$;52| '|SPADreplace| 'GCD) 

(SDEFUN |INT;gcd;3$;52| ((|x| $) (|y| $) ($ $)) (GCD |x| |y|)) 

(SDEFUN |INT;unitNormal;$R;53|
        ((|x| $)
         ($ |Record| (|:| |unit| . #1=($)) (|:| |canonical| . #1#)
          (|:| |associate| . #1#)))
        (COND ((< |x| 0) (VECTOR -1 (- |x|) -1)) ('T (VECTOR 1 |x| 1)))) 

(PUT '|INT;unitCanonical;2$;54| '|SPADreplace| 'ABS) 

(SDEFUN |INT;unitCanonical;2$;54| ((|x| $) ($ $)) (ABS |x|)) 

(SDEFUN |INT;solveLinearPolynomialEquation|
        ((|lp| |List| (|SparseUnivariatePolynomial| $))
         (|p| |SparseUnivariatePolynomial| $)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| $)) "failed"))
        (SPADCALL |lp| |p| (QREFELT $ 96))) 

(SDEFUN |INT;squareFreePolynomial|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |p| (QREFELT $ 100))) 

(SDEFUN |INT;factorPolynomial|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPROG ((#1=#:G1476 NIL) (|pp| (|SparseUnivariatePolynomial| $)))
               (SEQ
                (LETT |pp| (SPADCALL |p| (QREFELT $ 101))
                      . #2=(|INT;factorPolynomial|))
                (EXIT
                 (COND
                  ((EQL (SPADCALL |pp| (QREFELT $ 102))
                        (SPADCALL |p| (QREFELT $ 102)))
                   (SPADCALL |p| (QREFELT $ 104)))
                  ('T
                   (SPADCALL (SPADCALL |pp| (QREFELT $ 104))
                             (SPADCALL (ELT $ 105)
                                       (SPADCALL
                                        (PROG2
                                            (LETT #1#
                                                  (SPADCALL
                                                   (SPADCALL |p|
                                                             (QREFELT $ 102))
                                                   (SPADCALL |pp|
                                                             (QREFELT $ 102))
                                                   (QREFELT $ 86))
                                                  . #2#)
                                            (QCDR #1#)
                                          (|check_union| (QEQCAR #1# 0) $ #1#))
                                        (QREFELT $ 107))
                                       (QREFELT $ 111))
                             (QREFELT $ 113)))))))) 

(SDEFUN |INT;factorSquareFreePolynomial|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |p| (QREFELT $ 114))) 

(SDEFUN |INT;gcdPolynomial;3Sup;59|
        ((|p| . #1=(|SparseUnivariatePolynomial| $)) (|q| . #1#)
         ($ |SparseUnivariatePolynomial| $))
        (COND ((SPADCALL |p| (QREFELT $ 115)) (SPADCALL |q| (QREFELT $ 116)))
              ((SPADCALL |q| (QREFELT $ 115)) (SPADCALL |p| (QREFELT $ 116)))
              ('T (SPADCALL (LIST |p| |q|) (QREFELT $ 119))))) 

(SDEFUN |INT;opposite?;2$B;60| ((|x| $) (|y| $) ($ |Boolean|))
        (EQL |x| (- |y|))) 

(SDEFUN |INT;annihilate?;2$B;61| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((ZEROP |x|) 'T) ('T (ZEROP |y|)))) 

(DECLAIM (NOTINLINE |Integer;|)) 

(DEFUN |Integer| ()
  (SPROG NIL
         (PROG (#1=#:G1504)
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
          (LETT $ (GETREFV 138) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Integer| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 72
                    (QSETREFV $ 71
                              (CONS (|dispatchFunction| |INT;*;3$;41|) $)))
          $))) 

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
              (|HashState|) |INT;hashUpdate!;Hs$Hs;14| |INT;negative?;$B;15|
              (|OutputForm|) (48 . |outputForm|) |INT;coerce;$Of;16|
              |INT;coerce;2$;17| |INT;convert;2$;18| |INT;length;2$;19|
              |INT;addmod;4$;20| |INT;submod;4$;21| |INT;mulmod;4$;22|
              (|Float|) (53 . |coerce|) |INT;convert;$F;23| (|DoubleFloat|)
              |INT;convert;$Df;24| (|InputForm|) (58 . |convert|)
              |INT;convert;$If;25| |INT;convert;$S;26| |INT;latex;$S;27|
              |INT;positiveRemainder;3$;28| (|Matrix| 11) (|Matrix| $)
              |INT;reducedSystem;2M;29|
              (|Record| (|:| |mat| 56) (|:| |vec| (|Vector| 11))) (|Vector| $)
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
              (|Union| 93 '"failed") (|List| 94)
              (|SparseUnivariatePolynomial| 11)
              (|IntegerSolveLinearPolynomialEquation|)
              (68 . |solveLinearPolynomialEquation|) (|Factored| 98)
              (|SparseUnivariatePolynomial| $$)
              (|UnivariatePolynomialSquareFree| $$ 98) (74 . |squareFree|)
              (79 . |primitivePart|) (84 . |leadingCoefficient|)
              (|GaloisGroupFactorizer| 98) (89 . |factor|) (94 . |coerce|)
              (|Factored| $) (99 . |factor|) (|Mapping| 98 $$) (|Factored| $$)
              (|FactoredFunctions2| $$ 98) (104 . |map|)
              (|FactoredFunctionUtilities| 98) (110 . |mergeFactors|)
              (116 . |factorSquareFree|) (121 . |zero?|)
              (126 . |unitCanonical|) (|List| 98) (|HeuGcd| 98) (131 . |gcd|)
              (|SparseUnivariatePolynomial| $) |INT;gcdPolynomial;3Sup;59|
              |INT;opposite?;2$B;60| |INT;annihilate?;2$B;61| (|Fraction| 11)
              (|Union| 124 '"failed") (|PatternMatchResult| 11 $)
              (|Pattern| 11) (|Union| 11 '"failed")
              (|Record| (|:| |coef| 130) (|:| |generator| $)) (|List| $)
              (|Union| 130 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 133 '"failed")
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|PositiveInteger|) (|SingleInteger|))
           '#(~= 136 |zero?| 142 |unitNormal| 147 |unitCanonical| 152 |unit?|
              157 |symmetricRemainder| 162 |subtractIfCan| 168 |submod| 174
              |squareFreePart| 181 |squareFree| 186 |smaller?| 191 |sizeLess?|
              197 |sign| 203 |shift| 208 |sample| 214 |retractIfCan| 218
              |retract| 223 |rem| 228 |reducedSystem| 234 |recip| 245
              |rationalIfCan| 250 |rational?| 255 |rational| 260 |random| 265
              |quo| 274 |principalIdeal| 280 |prime?| 285 |powmod| 290
              |positiveRemainder| 297 |positive?| 303 |permutation| 308
              |patternMatch| 314 |opposite?| 321 |one?| 327 |odd?| 332
              |nextItem| 337 |negative?| 342 |multiEuclidean| 347 |mulmod| 353
              |min| 360 |max| 366 |mask| 372 |length| 377 |lcmCoef| 382 |lcm|
              388 |latex| 399 |invmod| 404 |init| 410 |inc| 414 |hashUpdate!|
              419 |hash| 425 |gcdPolynomial| 430 |gcd| 436 |factorial| 447
              |factor| 452 |extendedEuclidean| 457 |exquo| 470
              |expressIdealMember| 476 |even?| 482 |euclideanSize| 487 |divide|
              492 |differentiate| 498 |dec| 509 |copy| 514 |convert| 519
              |coerce| 549 |characteristic| 569 |bit?| 573 |binomial| 579
              |base| 585 |associates?| 589 |annihilate?| 595 |addmod| 601 |abs|
              608 ^ 613 |Zero| 625 |One| 629 |OMwrite| 633 D 657 >= 668 > 674 =
              680 <= 686 < 692 - 698 + 709 * 715)
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
                |SetCategory&| NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |RetractableTo&| NIL |PartialOrder&| NIL NIL NIL |BasicType&|
                NIL)
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
                 (|ConvertibleTo| 45) (|ConvertibleTo| 48)
                 (|CombinatorialFunctionCategory|) (|ConvertibleTo| 127)
                 (|ConvertibleTo| 50) (|RetractableTo| 11) (|ConvertibleTo| 11)
                 (|PartialOrder|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 36))
              (|makeByteWordVec2| 137
                                  '(1 7 6 0 8 3 7 6 0 9 9 10 2 7 6 0 11 12 1 7
                                    6 0 13 0 14 0 15 2 7 0 9 14 16 1 7 6 0 17 1
                                    7 6 0 18 1 7 6 0 19 1 36 0 11 37 1 45 0 11
                                    46 1 50 0 11 51 1 83 21 0 84 2 95 92 93 94
                                    96 1 99 97 98 100 1 98 0 0 101 1 98 2 0 102
                                    1 103 97 98 104 1 98 0 2 105 1 0 106 0 107
                                    2 110 97 108 109 111 2 112 97 97 97 113 1
                                    103 97 98 114 1 98 21 0 115 1 98 0 0 116 1
                                    118 98 117 119 2 0 21 0 0 1 1 0 21 0 25 1 0
                                    89 0 90 1 0 0 0 91 1 0 21 0 1 2 0 0 0 0 1 2
                                    0 85 0 0 1 3 0 0 0 0 0 43 1 0 0 0 1 1 0 106
                                    0 1 2 0 21 0 0 1 2 0 21 0 0 1 1 0 11 0 1 2
                                    0 0 0 0 82 0 0 0 1 1 0 128 0 1 1 0 11 0 1 2
                                    0 0 0 0 81 2 0 59 57 60 61 1 0 56 57 58 1 0
                                    85 0 87 1 0 125 0 1 1 0 21 0 1 1 0 124 0 1
                                    0 0 0 63 1 0 0 0 64 2 0 0 0 0 80 1 0 129
                                    130 1 1 0 21 0 1 3 0 0 0 0 0 1 2 0 0 0 0 55
                                    1 0 21 0 1 2 0 0 0 0 1 3 0 126 0 127 126 1
                                    2 0 21 0 0 122 1 0 21 0 26 1 0 21 0 75 1 0
                                    85 0 1 1 0 21 0 35 2 0 131 130 0 1 3 0 0 0
                                    0 0 44 2 0 0 0 0 77 2 0 0 0 0 76 1 0 0 0 1
                                    1 0 0 0 41 2 0 135 0 0 1 2 0 0 0 0 1 1 0 0
                                    130 1 1 0 9 0 54 2 0 0 0 0 1 0 0 0 1 1 0 0
                                    0 31 2 0 33 33 0 34 1 0 137 0 1 2 0 120 120
                                    120 121 1 0 0 130 1 2 0 0 0 0 88 1 0 0 0 1
                                    1 0 106 0 107 2 0 132 0 0 1 3 0 134 0 0 0 1
                                    2 0 85 0 0 86 2 0 131 130 0 1 1 0 21 0 1 1
                                    0 73 0 1 2 0 78 0 0 79 1 0 0 0 1 2 0 0 0 73
                                    1 1 0 0 0 32 1 0 0 0 30 1 0 9 0 53 1 0 48 0
                                    49 1 0 45 0 47 1 0 50 0 52 1 0 127 0 1 1 0
                                    11 0 40 1 0 0 11 39 1 0 0 11 39 1 0 0 0 1 1
                                    0 36 0 38 0 0 73 1 2 0 21 0 0 1 2 0 0 0 0 1
                                    0 0 0 29 2 0 21 0 0 1 2 0 21 0 0 123 3 0 0
                                    0 0 0 42 1 0 0 0 62 2 0 0 0 73 74 2 0 0 0
                                    136 1 0 0 0 27 0 0 0 28 3 0 6 7 0 21 24 2 0
                                    9 0 21 22 2 0 6 7 0 23 1 0 9 0 20 1 0 0 0 1
                                    2 0 0 0 73 1 2 0 21 0 0 67 2 0 21 0 0 1 2 0
                                    21 0 0 65 2 0 21 0 0 1 2 0 21 0 0 66 1 0 0
                                    0 68 2 0 0 0 0 70 2 0 0 0 0 69 2 0 0 11 0
                                    72 2 0 0 0 0 71 2 0 0 73 0 1 2 0 0 136 0
                                    1)))))
           '|lookupComplete|)) 

(MAKEPROP '|Integer| 'NILADIC T) 
