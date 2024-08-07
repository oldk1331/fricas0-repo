
(SDEFUN |INT;writeOMInt| ((|dev| (|OpenMathDevice|)) (|x| (%)) (% (|Void|)))
        (SEQ
         (COND
          ((< |x| 0)
           (SEQ (SPADCALL |dev| (QREFELT % 8))
                (SPADCALL |dev| "arith1" "unary_minus" (QREFELT % 10))
                (SPADCALL |dev| (- |x|) (QREFELT % 12))
                (EXIT (SPADCALL |dev| (QREFELT % 13)))))
          ('T (SPADCALL |dev| |x| (QREFELT % 12)))))) 

(SDEFUN |INT;OMwrite;Omd%BV;2|
        ((|dev| (|OpenMathDevice|)) (|x| (%)) (|wholeObj| (|Boolean|))
         (% (|Void|)))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 14))))
             (|INT;writeOMInt| |dev| |x| %)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 15))))))) 

(PUT '|INT;zero?;%B;3| '|SPADreplace| 'ZEROP) 

(SDEFUN |INT;zero?;%B;3| ((|x| (%)) (% (|Boolean|))) (ZEROP |x|)) 

(PUT '|INT;one?;%B;4| '|SPADreplace| '(XLAM (|x|) (EQL |x| 1))) 

(SDEFUN |INT;one?;%B;4| ((|x| (%)) (% (|Boolean|))) (EQL |x| 1)) 

(PUT '|INT;Zero;%;5| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |INT;Zero;%;5| ((% (%))) 0) 

(PUT '|INT;One;%;6| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |INT;One;%;6| ((% (%))) 1) 

(PUT '|INT;base;%;7| '|SPADreplace| '(XLAM NIL 2)) 

(SDEFUN |INT;base;%;7| ((% (%))) 2) 

(PUT '|INT;copy;2%;8| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INT;copy;2%;8| ((|x| (%)) (% (%))) |x|) 

(PUT '|INT;inc;2%;9| '|SPADreplace| '(XLAM (|x|) (+ |x| 1))) 

(SDEFUN |INT;inc;2%;9| ((|x| (%)) (% (%))) (+ |x| 1)) 

(PUT '|INT;dec;2%;10| '|SPADreplace| '(XLAM (|x|) (- |x| 1))) 

(SDEFUN |INT;dec;2%;10| ((|x| (%)) (% (%))) (- |x| 1)) 

(SDEFUN |INT;hashUpdate!;Hs%Hs;11| ((|hs| #1=(|HashState|)) (|s| (%)) (% #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(PUT '|INT;negative?;%B;12| '|SPADreplace| 'MINUSP) 

(SDEFUN |INT;negative?;%B;12| ((|x| (%)) (% (|Boolean|))) (MINUSP |x|)) 

(PUT '|INT;positive?;%B;13| '|SPADreplace| 'PLUSP) 

(SDEFUN |INT;positive?;%B;13| ((|x| (%)) (% (|Boolean|))) (PLUSP |x|)) 

(SDEFUN |INT;coerce;%Of;14| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL |x| (QREFELT % 31))) 

(PUT '|INT;coerce;2%;15| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |INT;coerce;2%;15| ((|m| (|Integer|)) (% (%))) |m|) 

(PUT '|INT;convert;2%;16| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INT;convert;2%;16| ((|x| (%)) (% (|Integer|))) |x|) 

(PUT '|INT;length;2%;17| '|SPADreplace| 'INTEGER-LENGTH) 

(SDEFUN |INT;length;2%;17| ((|a| (%)) (% (%))) (INTEGER-LENGTH |a|)) 

(SDEFUN |INT;addmod;4%;18| ((|a| (%)) (|b| (%)) (|p| (%)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (+ |a| |b|))
                    (EXIT (COND ((>= |c| |p|) (- |c| |p|)) ('T |c|)))))) 

(SDEFUN |INT;submod;4%;19| ((|a| (%)) (|b| (%)) (|p| (%)) (% (%)))
        (SPROG ((|c| (%)))
               (SEQ (LETT |c| (- |a| |b|))
                    (EXIT (COND ((< |c| 0) (+ |c| |p|)) ('T |c|)))))) 

(SDEFUN |INT;mulmod;4%;20| ((|a| (%)) (|b| (%)) (|p| (%)) (% (%)))
        (REM (* |a| |b|) |p|)) 

(SDEFUN |INT;convert;%F;21| ((|x| (%)) (% (|Float|)))
        (SPADCALL |x| (QREFELT % 40))) 

(PUT '|INT;convert;%Df;22| '|SPADreplace|
     '(XLAM (|x|) (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |INT;convert;%Df;22| ((|x| (%)) (% (|DoubleFloat|)))
        (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |INT;convert;%If;23| ((|x| (%)) (% (|InputForm|)))
        (SPADCALL |x| (QREFELT % 45))) 

(PUT '|INT;convert;%S;24| '|SPADreplace| 'STRINGIMAGE) 

(SDEFUN |INT;convert;%S;24| ((|x| (%)) (% (|String|))) (STRINGIMAGE |x|)) 

(SDEFUN |INT;positiveRemainder;3%;25| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG ((|r| (%)))
               (COND
                ((MINUSP (LETT |r| (REM |a| |b|)))
                 (COND ((MINUSP |b|) (- |r| |b|)) (#1='T (+ |r| |b|))))
                (#1# |r|)))) 

(PUT '|INT;reducedSystem;2M;26| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |INT;reducedSystem;2M;26|
        ((|m| (|Matrix| %)) (% (|Matrix| (|Integer|)))) |m|) 

(PUT '|INT;reducedSystem;MVR;27| '|SPADreplace| 'CONS) 

(SDEFUN |INT;reducedSystem;MVR;27|
        ((|m| (|Matrix| . #1=(%))) (|vec| (|Vector| . #1#))
         (%
          (|Record| (|:| |mat| (|Matrix| (|Integer|)))
                    (|:| |vec| (|Vector| (|Integer|))))))
        (CONS |m| |vec|)) 

(PUT '|INT;abs;2%;28| '|SPADreplace| 'ABS) 

(SDEFUN |INT;abs;2%;28| ((|x| (%)) (% (%))) (ABS |x|)) 

(PUT '|INT;random;2%;29| '|SPADreplace| 'RANDOM) 

(SDEFUN |INT;random;2%;29| ((|x| (%)) (% (%))) (RANDOM |x|)) 

(PUT '|INT;seedRandom;V;30| '|SPADreplace| 'SEEDRANDOM) 

(SDEFUN |INT;seedRandom;V;30| ((% (|Void|))) (SEEDRANDOM)) 

(PUT '|INT;=;2%B;31| '|SPADreplace| 'EQL) 

(SDEFUN |INT;=;2%B;31| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (EQL |x| |y|)) 

(PUT '|INT;<;2%B;32| '|SPADreplace| '<) 

(SDEFUN |INT;<;2%B;32| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (< |x| |y|)) 

(PUT '|INT;>;2%B;33| '|SPADreplace| '>) 

(SDEFUN |INT;>;2%B;33| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (> |x| |y|)) 

(PUT '|INT;>=;2%B;34| '|SPADreplace| '>=) 

(SDEFUN |INT;>=;2%B;34| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (>= |x| |y|)) 

(PUT '|INT;<=;2%B;35| '|SPADreplace| '<=) 

(SDEFUN |INT;<=;2%B;35| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (<= |x| |y|)) 

(PUT '|INT;-;2%;36| '|SPADreplace| '-) 

(SDEFUN |INT;-;2%;36| ((|x| (%)) (% (%))) (- |x|)) 

(PUT '|INT;+;3%;37| '|SPADreplace| '+) 

(SDEFUN |INT;+;3%;37| ((|x| (%)) (|y| (%)) (% (%))) (+ |x| |y|)) 

(PUT '|INT;-;3%;38| '|SPADreplace| '-) 

(SDEFUN |INT;-;3%;38| ((|x| (%)) (|y| (%)) (% (%))) (- |x| |y|)) 

(PUT '|INT;*;3%;39| '|SPADreplace| '*) 

(SDEFUN |INT;*;3%;39| ((|x| (%)) (|y| (%)) (% (%))) (* |x| |y|)) 

(PUT '|INT;*;3%;40| '|SPADreplace| '*) 

(SDEFUN |INT;*;3%;40| ((|m| (|Integer|)) (|y| (%)) (% (%))) (* |m| |y|)) 

(PUT '|INT;*;Pi2%;41| '|SPADreplace| '*) 

(SDEFUN |INT;*;Pi2%;41| ((|m| (|PositiveInteger|)) (|y| (%)) (% (%)))
        (* |m| |y|)) 

(PUT '|INT;*;Nni2%;42| '|SPADreplace| '*) 

(SDEFUN |INT;*;Nni2%;42| ((|m| (|NonNegativeInteger|)) (|y| (%)) (% (%)))
        (* |m| |y|)) 

(PUT '|INT;^;%Nni%;43| '|SPADreplace| 'EXPT) 

(SDEFUN |INT;^;%Nni%;43| ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (EXPT |x| |n|)) 

(PUT '|INT;^;%Pi%;44| '|SPADreplace| 'EXPT) 

(SDEFUN |INT;^;%Pi%;44| ((|x| (%)) (|n| (|PositiveInteger|)) (% (%)))
        (EXPT |x| |n|)) 

(PUT '|INT;odd?;%B;45| '|SPADreplace| 'ODDP) 

(SDEFUN |INT;odd?;%B;45| ((|x| (%)) (% (|Boolean|))) (ODDP |x|)) 

(PUT '|INT;even?;%B;46| '|SPADreplace| 'EVENP) 

(SDEFUN |INT;even?;%B;46| ((|x| (%)) (% (|Boolean|))) (EVENP |x|)) 

(PUT '|INT;max;3%;47| '|SPADreplace| 'MAX) 

(SDEFUN |INT;max;3%;47| ((|x| (%)) (|y| (%)) (% (%))) (MAX |x| |y|)) 

(PUT '|INT;min;3%;48| '|SPADreplace| 'MIN) 

(SDEFUN |INT;min;3%;48| ((|x| (%)) (|y| (%)) (% (%))) (MIN |x| |y|)) 

(PUT '|INT;divide;2%R;49| '|SPADreplace| 'DIVIDE2) 

(SDEFUN |INT;divide;2%R;49|
        ((|x| (%)) (|y| (%))
         (% (|Record| (|:| |quotient| . #1=(%)) (|:| |remainder| . #1#))))
        (DIVIDE2 |x| |y|)) 

(PUT '|INT;quo;3%;50| '|SPADreplace| 'QUOTIENT2) 

(SDEFUN |INT;quo;3%;50| ((|x| (%)) (|y| (%)) (% (%))) (QUOTIENT2 |x| |y|)) 

(PUT '|INT;rem;3%;51| '|SPADreplace| 'REM) 

(SDEFUN |INT;rem;3%;51| ((|x| (%)) (|y| (%)) (% (%))) (REM |x| |y|)) 

(PUT '|INT;shift;3%;52| '|SPADreplace| 'ASH) 

(SDEFUN |INT;shift;3%;52| ((|x| (%)) (|y| (%)) (% (%))) (ASH |x| |y|)) 

(SDEFUN |INT;exquo;2%U;53| ((|x| (%)) (|y| (%)) (% (|Union| % "failed")))
        (SPROG ((|z| (|SExpression|)))
               (SEQ
                (COND ((ZEROP |y|) (CONS 1 "failed"))
                      (#1='T
                       (SEQ (LETT |z| (INTEXQUO |x| |y|))
                            (EXIT
                             (COND ((SPADCALL |z| (QREFELT % 84)) (CONS 0 |z|))
                                   (#1# (CONS 1 "failed")))))))))) 

(SDEFUN |INT;recip;%U;54| ((|x| (%)) (% (|Union| % "failed")))
        (COND ((OR (EQL |x| 1) (EQL |x| -1)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(PUT '|INT;gcd;3%;55| '|SPADreplace| 'GCD) 

(SDEFUN |INT;gcd;3%;55| ((|x| (%)) (|y| (%)) (% (%))) (GCD |x| |y|)) 

(SDEFUN |INT;unitNormal;%R;56|
        ((|x| (%))
         (%
          (|Record| (|:| |unit| . #1=(%)) (|:| |canonical| . #1#)
                    (|:| |associate| . #1#))))
        (COND ((< |x| 0) (VECTOR -1 (- |x|) -1)) ('T (VECTOR 1 |x| 1)))) 

(PUT '|INT;unitCanonical;2%;57| '|SPADreplace| 'ABS) 

(SDEFUN |INT;unitCanonical;2%;57| ((|x| (%)) (% (%))) (ABS |x|)) 

(SDEFUN |INT;solveLinearPolynomialEquation;LSupU;58|
        ((|lp| (|List| #1=(|SparseUnivariatePolynomial| %))) (|p| #1#)
         (% (|Union| (|List| (|SparseUnivariatePolynomial| %)) "failed")))
        (SPADCALL |lp| |p| (QREFELT % 96))) 

(SDEFUN |INT;squareFreePolynomial;SupF;59|
        ((|p| (|SparseUnivariatePolynomial| %))
         (% (|Factored| (|SparseUnivariatePolynomial| %))))
        (SPADCALL |p| (QREFELT % 104))) 

(SDEFUN |INT;factorPolynomial;SupF;60|
        ((|p| (|SparseUnivariatePolynomial| %))
         (% (|Factored| (|SparseUnivariatePolynomial| %))))
        (SPROG ((#1=#:G1239 NIL) (|pp| (|SparseUnivariatePolynomial| %)))
               (SEQ (LETT |pp| (SPADCALL |p| (QREFELT % 107)))
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |pp| (QREFELT % 108))
                            (SPADCALL |p| (QREFELT % 108)))
                       (SPADCALL |p| (QREFELT % 110)))
                      ('T
                       (SPADCALL (SPADCALL |pp| (QREFELT % 110))
                                 (SPADCALL (ELT % 111)
                                           (SPADCALL
                                            (PROG2
                                                (LETT #1#
                                                      (SPADCALL
                                                       (SPADCALL |p|
                                                                 (QREFELT %
                                                                          108))
                                                       (SPADCALL |pp|
                                                                 (QREFELT %
                                                                          108))
                                                       (QREFELT % 86)))
                                                (QCDR #1#)
                                              (|check_union2| (QEQCAR #1# 0) %
                                                              (|Union| %
                                                                       "failed")
                                                              #1#))
                                            (QREFELT % 113))
                                           (QREFELT % 117))
                                 (QREFELT % 118)))))))) 

(SDEFUN |INT;factorSquareFreePolynomial;SupF;61|
        ((|p| (|SparseUnivariatePolynomial| %))
         (% (|Factored| (|SparseUnivariatePolynomial| %))))
        (SPADCALL |p| (QREFELT % 120))) 

(SDEFUN |INT;gcdPolynomial;3Sup;62|
        ((|p| #1=(|SparseUnivariatePolynomial| %)) (|q| #1#)
         (% (|SparseUnivariatePolynomial| %)))
        (COND ((SPADCALL |p| (QREFELT % 122)) (SPADCALL |q| (QREFELT % 123)))
              ((SPADCALL |q| (QREFELT % 122)) (SPADCALL |p| (QREFELT % 123)))
              ('T (SPADCALL (LIST |p| |q|) (QREFELT % 126))))) 

(SDEFUN |INT;opposite?;2%B;63| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (EQL |x| (- |y|))) 

(SDEFUN |INT;annihilate?;2%B;64| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND ((ZEROP |x|) 'T) ('T (ZEROP |y|)))) 

(SDEFUN |INT;powmod;4%;65| ((|x| (%)) (|n| (%)) (|p| (%)) (% (%)))
        (SPROG ((|z| (%)) (#1=#:G1259 NIL) (|y| (%)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((MINUSP |x|) (LETT |x| (SPADCALL |x| |p| (QREFELT % 48)))))
                  (EXIT
                   (COND ((ZEROP |x|) 0) ((ZEROP |n|) 1)
                         ('T
                          (SEQ (LETT |y| 1) (LETT |z| |x|)
                               (EXIT
                                (SEQ G190 NIL
                                     (SEQ
                                      (COND
                                       ((ODDP |n|)
                                        (LETT |y|
                                              (SPADCALL |y| |z| |p|
                                                        (QREFELT % 38)))))
                                      (EXIT
                                       (COND
                                        ((ZEROP (LETT |n| (ASH |n| -1)))
                                         (PROGN
                                          (LETT #1# |y|)
                                          (GO #2=#:G1258)))
                                        ('T
                                         (LETT |z|
                                               (SPADCALL |z| |z| |p|
                                                         (QREFELT % 38)))))))
                                     NIL (GO G190) G191 (EXIT NIL)))))))))
                #2# (EXIT #1#)))) 

(SDEFUN |INT;symmetricRemainder;3%;66| ((|x| (%)) (|n| (%)) (% (%)))
        (SPROG ((|r| (%)))
               (SEQ (LETT |r| (REM |x| |n|))
                    (EXIT
                     (COND ((EQL |r| 0) 0)
                           (#1='T
                            (SEQ (COND ((< |n| 0) (LETT |n| (- |n|))))
                                 (EXIT
                                  (COND
                                   ((> |r| 0)
                                    (COND ((> (* 2 |r|) |n|) (- |r| |n|))
                                          (#1# |r|)))
                                   ((<= (+ (* 2 |r|) |n|) 0) (+ |r| |n|))
                                   (#1# |r|)))))))))) 

(DECLAIM (NOTINLINE |Integer;|)) 

(DEFUN |Integer| ()
  (SPROG NIL
         (PROG (#1=#:G1285)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Integer|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Integer|
                             (LIST (CONS NIL (CONS 1 (|Integer;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Integer|)))))))))) 

(DEFUN |Integer;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Integer|))
          (LETT % (GETREFV 146))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Integer| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|CharacteristicNonZero|))
               (|augmentPredVector| % 1))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 66
                    (QSETREFV % 67
                              (CONS (|dispatchFunction| |INT;*;3%;40|) %)))
          %))) 

(MAKEPROP '|Integer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Void|) (|OpenMathDevice|)
              (0 . |OMputApp|) (|String|) (5 . |OMputSymbol|) (|Integer|)
              (12 . |OMputInteger|) (18 . |OMputEndApp|) (23 . |OMputObject|)
              (28 . |OMputEndObject|) (|Boolean|) |INT;OMwrite;Omd%BV;2|
              |INT;zero?;%B;3| |INT;one?;%B;4|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INT;Zero;%;5|) %))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INT;One;%;6|) %))
              |INT;base;%;7| |INT;copy;2%;8| |INT;inc;2%;9| |INT;dec;2%;10|
              (|HashState|) |INT;hashUpdate!;Hs%Hs;11| |INT;negative?;%B;12|
              |INT;positive?;%B;13| (|OutputForm|) (33 . |outputForm|)
              |INT;coerce;%Of;14| |INT;coerce;2%;15| |INT;convert;2%;16|
              |INT;length;2%;17| |INT;addmod;4%;18| |INT;submod;4%;19|
              |INT;mulmod;4%;20| (|Float|) (38 . |coerce|) |INT;convert;%F;21|
              (|DoubleFloat|) |INT;convert;%Df;22| (|InputForm|)
              (43 . |convert|) |INT;convert;%If;23| |INT;convert;%S;24|
              |INT;positiveRemainder;3%;25| (|Matrix| 11) (|Matrix| %)
              |INT;reducedSystem;2M;26|
              (|Record| (|:| |mat| 49) (|:| |vec| (|Vector| 11))) (|Vector| %)
              |INT;reducedSystem;MVR;27| |INT;abs;2%;28| |INT;random;2%;29|
              |INT;seedRandom;V;30| |INT;=;2%B;31| |INT;<;2%B;32|
              |INT;>;2%B;33| |INT;>=;2%B;34| |INT;<=;2%B;35| |INT;-;2%;36|
              |INT;+;3%;37| |INT;-;3%;38| NIL NIL (|PositiveInteger|)
              |INT;*;Pi2%;41| (|NonNegativeInteger|) |INT;*;Nni2%;42|
              |INT;^;%Nni%;43| |INT;^;%Pi%;44| |INT;odd?;%B;45|
              |INT;even?;%B;46| |INT;max;3%;47| |INT;min;3%;48|
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              |INT;divide;2%R;49| |INT;quo;3%;50| |INT;rem;3%;51|
              |INT;shift;3%;52| (|SExpression|) (48 . |integer?|)
              (|Union| % '"failed") |INT;exquo;2%U;53| |INT;recip;%U;54|
              |INT;gcd;3%;55|
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              |INT;unitNormal;%R;56| |INT;unitCanonical;2%;57|
              (|Union| 93 '"failed") (|List| 94)
              (|SparseUnivariatePolynomial| 11)
              (|IntegerSolveLinearPolynomialEquation|)
              (53 . |solveLinearPolynomialEquation|) (|Union| 98 '"failed")
              (|List| 99) (|SparseUnivariatePolynomial| %)
              |INT;solveLinearPolynomialEquation;LSupU;58| (|Factored| 102)
              (|SparseUnivariatePolynomial| $$)
              (|UnivariatePolynomialSquareFree| $$ 102) (59 . |squareFree|)
              (|Factored| 99) |INT;squareFreePolynomial;SupF;59|
              (64 . |primitivePart|) (69 . |leadingCoefficient|)
              (|GaloisGroupFactorizer| 102) (74 . |factor|) (79 . |coerce|)
              (|Factored| %) (84 . |factor|) (|Mapping| 102 $$) (|Factored| $$)
              (|FactoredFunctions2| $$ 102) (89 . |map|) (95 . |mergeFactors|)
              |INT;factorPolynomial;SupF;60| (101 . |factorSquareFree|)
              |INT;factorSquareFreePolynomial;SupF;61| (106 . |zero?|)
              (111 . |unitCanonical|) (|List| 102) (|HeuGcd| 102) (116 . |gcd|)
              |INT;gcdPolynomial;3Sup;62| |INT;opposite?;2%B;63|
              |INT;annihilate?;2%B;64| |INT;powmod;4%;65|
              |INT;symmetricRemainder;3%;66|
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 134 '#1="failed") (|Union| 133 '#1#)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef| 133) (|:| |generator| %))
              (|Union| 11 '"failed") (|PatternMatchResult| 11 %) (|Pattern| 11)
              (|Union| 143 '"failed") (|Fraction| 11) (|SingleInteger|)
              (|Union| 53 '"failed"))
           '#(~= 121 |zero?| 127 |unitNormal| 132 |unitCanonical| 137 |unit?|
              142 |symmetricRemainder| 147 |subtractIfCan| 153 |submod| 159
              |squareFreePolynomial| 166 |squareFreePart| 171 |squareFree| 176
              |solveLinearPolynomialEquation| 181 |smaller?| 187 |sizeLess?|
              193 |sign| 199 |shift| 204 |seedRandom| 210 |sample| 214
              |rightRecip| 218 |rightPower| 223 |retractIfCan| 235 |retract|
              240 |rem| 245 |reducedSystem| 251 |recip| 262 |rationalIfCan| 267
              |rational?| 272 |rational| 277 |random| 282 |quo| 287
              |principalIdeal| 293 |prime?| 298 |powmod| 303
              |positiveRemainder| 310 |positive?| 316 |plenaryPower| 321
              |permutation| 327 |patternMatch| 333 |opposite?| 340 |one?| 346
              |odd?| 351 |nextItem| 356 |negative?| 361 |multiEuclidean| 366
              |mulmod| 372 |min| 379 |max| 385 |mask| 391 |length| 396
              |leftRecip| 401 |leftPower| 406 |lcmCoef| 418 |lcm| 424 |latex|
              435 |invmod| 440 |init| 446 |inc| 450 |hashUpdate!| 455 |hash|
              461 |gcdPolynomial| 466 |gcd| 472 |factorial| 483
              |factorSquareFreePolynomial| 488 |factorPolynomial| 493 |factor|
              498 |extendedEuclidean| 503 |exquo| 516 |expressIdealMember| 522
              |even?| 528 |euclideanSize| 533 |divide| 538 |differentiate| 544
              |dec| 555 |copy| 560 |convert| 565 |conditionP| 595 |commutator|
              600 |coerce| 606 |charthRoot| 621 |characteristic| 626 |bit?| 630
              |binomial| 636 |base| 642 |associator| 646 |associates?| 653
              |antiCommutator| 659 |annihilate?| 665 |addmod| 671 |abs| 678 ^
              683 |Zero| 695 |One| 699 |OMwrite| 703 D 727 >= 738 > 744 = 750
              <= 756 < 762 - 768 + 779 * 785)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL NIL NIL NIL
                |OrderedRing&| |Algebra&| |EntireRing&| NIL |DifferentialRing&|
                NIL NIL |Rng&| |NonAssociativeAlgebra&| NIL |Module&|
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL |OrderedSet&|
                |AbelianSemiGroup&| |Magma&| NIL NIL NIL |SetCategory&| NIL
                |RetractableTo&| NIL |Hashable&| NIL |BasicType&| NIL NIL NIL
                |PartialOrder&| NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |OpenMath&| NIL NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|OrderedIntegralDomain|) (|IntegralDomain|) (|LeftOreRing|)
                 (|CommutativeRing|) (|OrderedRing|) (|Algebra| $$)
                 (|EntireRing|) (|CharacteristicZero|) (|DifferentialRing|)
                 (|Ring|) (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|SemiRng|) (|Module| $$) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|OrderedAbelianGroup|)
                 (|LinearlyExplicitOver| 11) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| 11)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|OrderedAbelianSemiGroup|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|OrderedSet|) (|AbelianSemiGroup|) (|Magma|) (|Comparable|)
                 (|PatternMatchable| 11) (|StepThrough|) (|SetCategory|)
                 (|CommutativeStar|) (|RetractableTo| 11) (|RealConstant|)
                 (|Hashable|) (|CoercibleTo| 30) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|PartialOrder|)
                 (|ConvertibleTo| 11) (|CoercibleFrom| 11) (|ConvertibleTo| 44)
                 (|ConvertibleTo| 141) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 42) (|ConvertibleTo| 39)
                 (|canonicalUnitNormal|) (|multiplicativeValuation|)
                 (|ConvertibleTo| 9) (|OpenMath|) (|Canonical|)
                 (|canonicalsClosed|))
              (|makeByteWordVec2| 145
                                  '(1 7 6 0 8 3 7 6 0 9 9 10 2 7 6 0 11 12 1 7
                                    6 0 13 1 7 6 0 14 1 7 6 0 15 1 30 0 11 31 1
                                    39 0 11 40 1 44 0 11 45 1 83 16 0 84 2 95
                                    92 93 94 96 1 103 101 102 104 1 102 0 0 107
                                    1 102 2 0 108 1 109 101 102 110 1 102 0 2
                                    111 1 0 112 0 113 2 116 101 114 115 117 2
                                    101 0 0 0 118 1 109 101 102 120 1 102 16 0
                                    122 1 102 0 0 123 1 125 102 124 126 2 0 16
                                    0 0 1 1 0 16 0 18 1 0 89 0 90 1 0 0 0 91 1
                                    0 16 0 1 2 0 0 0 0 131 2 0 85 0 0 1 3 0 0 0
                                    0 0 37 1 0 105 99 106 1 0 0 0 1 1 0 112 0 1
                                    2 0 97 98 99 100 2 0 16 0 0 1 2 0 16 0 0 1
                                    1 0 11 0 1 2 0 0 0 0 82 0 0 6 57 0 0 0 1 1
                                    0 85 0 1 2 0 0 0 68 1 2 0 0 0 70 1 1 0 139
                                    0 1 1 0 11 0 1 2 0 0 0 0 81 1 0 49 50 51 2
                                    0 52 50 53 54 1 0 85 0 87 1 0 142 0 1 1 0
                                    16 0 1 1 0 143 0 1 1 0 0 0 56 2 0 0 0 0 80
                                    1 0 138 133 1 1 0 16 0 1 3 0 0 0 0 0 130 2
                                    0 0 0 0 48 1 0 16 0 29 2 0 0 0 68 1 2 0 0 0
                                    0 1 3 0 140 0 141 140 1 2 0 16 0 0 128 1 0
                                    16 0 19 1 0 16 0 74 1 0 85 0 1 1 0 16 0 28
                                    2 0 136 133 0 1 3 0 0 0 0 0 38 2 0 0 0 0 77
                                    2 0 0 0 0 76 1 0 0 0 1 1 0 0 0 35 1 0 85 0
                                    1 2 0 0 0 68 1 2 0 0 0 70 1 2 0 132 0 0 1 2
                                    0 0 0 0 1 1 0 0 133 1 1 0 9 0 1 2 0 0 0 0 1
                                    0 0 0 1 1 0 0 0 24 2 0 26 26 0 27 1 0 144 0
                                    1 2 0 99 99 99 127 2 0 0 0 0 88 1 0 0 133 1
                                    1 0 0 0 1 1 0 105 99 121 1 0 105 99 119 1 0
                                    112 0 113 3 0 135 0 0 0 1 2 0 137 0 0 1 2 0
                                    85 0 0 86 2 0 136 133 0 1 1 0 16 0 75 1 0
                                    70 0 1 2 0 78 0 0 79 2 0 0 0 70 1 1 0 0 0 1
                                    1 0 0 0 25 1 0 0 0 23 1 0 11 0 34 1 0 44 0
                                    46 1 0 141 0 1 1 0 39 0 41 1 0 42 0 43 1 0
                                    9 0 47 1 1 145 50 1 2 0 0 0 0 1 1 0 30 0 32
                                    1 0 0 11 33 1 0 0 0 1 1 1 85 0 1 0 0 70 1 2
                                    0 16 0 0 1 2 0 0 0 0 1 0 0 0 22 3 0 0 0 0 0
                                    1 2 0 16 0 0 1 2 0 0 0 0 1 2 0 16 0 0 129 3
                                    0 0 0 0 0 36 1 0 0 0 55 2 0 0 0 68 73 2 0 0
                                    0 70 72 0 0 0 20 0 0 0 21 2 0 9 0 16 1 1 0
                                    9 0 1 3 0 6 7 0 16 17 2 0 6 7 0 1 2 0 0 0
                                    70 1 1 0 0 0 1 2 0 16 0 0 61 2 0 16 0 0 60
                                    2 0 16 0 0 58 2 0 16 0 0 62 2 0 16 0 0 59 1
                                    0 0 0 63 2 0 0 0 0 65 2 0 0 0 0 64 2 0 0 68
                                    0 69 2 0 0 0 0 66 2 0 0 11 0 67 2 0 0 70 0
                                    71 2 0 0 0 11 1)))))
           '|lookupComplete|)) 
