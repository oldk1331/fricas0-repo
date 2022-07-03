
(SDEFUN |DFLOAT;doubleFloatFormat;2S;1| ((|s| |String|) ($ |String|))
        (SPROG ((|ss| (|String|)))
               (SEQ (LETT |ss| (QREFELT $ 6)) (SETELT $ 6 |s|) (EXIT |ss|)))) 

(SDEFUN |DFLOAT;OMwrite;Omd$BV;2|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 11))))
             (SPADCALL |dev| |x| (QREFELT $ 13))
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 14))))))) 

(PUT '|DFLOAT;checkComplex| '|SPADreplace| '|c_to_r|) 

(SDEFUN |DFLOAT;checkComplex| ((|x| $) ($ $)) (|c_to_r| |x|)) 

(PUT '|DFLOAT;base;Pi;4| '|SPADreplace| '(XLAM NIL (FLOAT-RADIX 0.0))) 

(SDEFUN |DFLOAT;base;Pi;4| (($ |PositiveInteger|)) (FLOAT-RADIX 0.0)) 

(SDEFUN |DFLOAT;mantissa;$I;5| ((|x| $) ($ |Integer|))
        (QCAR (|DFLOAT;manexp| |x| $))) 

(SDEFUN |DFLOAT;exponent;$I;6| ((|x| $) ($ |Integer|))
        (QCDR (|DFLOAT;manexp| |x| $))) 

(PUT '|DFLOAT;precision;Pi;7| '|SPADreplace| '(XLAM NIL (FLOAT-DIGITS 0.0))) 

(SDEFUN |DFLOAT;precision;Pi;7| (($ |PositiveInteger|)) (FLOAT-DIGITS 0.0)) 

(SDEFUN |DFLOAT;bits;Pi;8| (($ |PositiveInteger|))
        (SPROG ((#1=#:G434 NIL))
               (COND
                ((EQL (SPADCALL (QREFELT $ 18)) 2) (SPADCALL (QREFELT $ 22)))
                ((EQL (SPADCALL (QREFELT $ 18)) 16)
                 (* 4 (SPADCALL (QREFELT $ 22))))
                ('T
                 (PROG1
                     (LETT #1#
                           (TRUNCATE
                            (SPADCALL (SPADCALL (QREFELT $ 22))
                                      (SPADCALL
                                       (FLOAT (SPADCALL (QREFELT $ 18))
                                              MOST-POSITIVE-DOUBLE-FLOAT)
                                       (QREFELT $ 23))
                                      (QREFELT $ 24))))
                   (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                     '(|Integer|) #1#)))))) 

(PUT '|DFLOAT;max;$;9| '|SPADreplace| '(XLAM NIL MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |DFLOAT;max;$;9| (($ $)) MOST-POSITIVE-DOUBLE-FLOAT) 

(PUT '|DFLOAT;min;$;10| '|SPADreplace| '(XLAM NIL MOST-NEGATIVE-DOUBLE-FLOAT)) 

(SDEFUN |DFLOAT;min;$;10| (($ $)) MOST-NEGATIVE-DOUBLE-FLOAT) 

(SDEFUN |DFLOAT;order;$I;11| ((|a| $) ($ |Integer|))
        (- (+ (SPADCALL (QREFELT $ 22)) (SPADCALL |a| (QREFELT $ 21))) 1)) 

(PUT '|DFLOAT;Zero;$;12| '|SPADreplace|
     '(XLAM NIL (FLOAT 0 MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |DFLOAT;Zero;$;12| (($ $)) (FLOAT 0 MOST-POSITIVE-DOUBLE-FLOAT)) 

(PUT '|DFLOAT;One;$;13| '|SPADreplace|
     '(XLAM NIL (FLOAT 1 MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |DFLOAT;One;$;13| (($ $)) (FLOAT 1 MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |DFLOAT;exp1;$;14| (($ $))
        (|div_DF| (FLOAT 534625820200 MOST-POSITIVE-DOUBLE-FLOAT)
                  (FLOAT 196677847971 MOST-POSITIVE-DOUBLE-FLOAT))) 

(PUT '|DFLOAT;pi;$;15| '|SPADreplace|
     '(XLAM NIL (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |DFLOAT;pi;$;15| (($ $)) (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |DFLOAT;convert;$S;16| ((|x| $) ($ |String|))
        (FORMAT NIL (QREFELT $ 6) |x|)) 

(SDEFUN |DFLOAT;coerce;$Of;17| ((|x| $) ($ |OutputForm|))
        (COND
         ((SPADCALL |x| 0.0 (QREFELT $ 34))
          (SPADCALL (SPADCALL |x| (QREFELT $ 33)) (QREFELT $ 36)))
         ('T
          (SPADCALL (SPADCALL (|minus_DF| |x|) (QREFELT $ 37))
                    (QREFELT $ 38))))) 

(SDEFUN |DFLOAT;convert;$If;18| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 40))) 

(PUT '|DFLOAT;<;2$B;19| '|SPADreplace| '|less_DF|) 

(SDEFUN |DFLOAT;<;2$B;19| ((|x| $) (|y| $) ($ |Boolean|)) (|less_DF| |x| |y|)) 

(PUT '|DFLOAT;-;2$;20| '|SPADreplace| '|minus_DF|) 

(SDEFUN |DFLOAT;-;2$;20| ((|x| $) ($ $)) (|minus_DF| |x|)) 

(PUT '|DFLOAT;+;3$;21| '|SPADreplace| '|add_DF|) 

(SDEFUN |DFLOAT;+;3$;21| ((|x| $) (|y| $) ($ $)) (|add_DF| |x| |y|)) 

(PUT '|DFLOAT;-;3$;22| '|SPADreplace| '|sub_DF|) 

(SDEFUN |DFLOAT;-;3$;22| ((|x| $) (|y| $) ($ $)) (|sub_DF| |x| |y|)) 

(PUT '|DFLOAT;*;3$;23| '|SPADreplace| '|mul_DF|) 

(SDEFUN |DFLOAT;*;3$;23| ((|x| $) (|y| $) ($ $)) (|mul_DF| |x| |y|)) 

(PUT '|DFLOAT;*;I2$;24| '|SPADreplace| '(XLAM (|i| |x|) (|mul_DF_I| |x| |i|))) 

(SDEFUN |DFLOAT;*;I2$;24| ((|i| |Integer|) (|x| $) ($ $)) (|mul_DF_I| |x| |i|)) 

(PUT '|DFLOAT;max;3$;25| '|SPADreplace| '|max_DF|) 

(SDEFUN |DFLOAT;max;3$;25| ((|x| $) (|y| $) ($ $)) (|max_DF| |x| |y|)) 

(PUT '|DFLOAT;min;3$;26| '|SPADreplace| '|min_DF|) 

(SDEFUN |DFLOAT;min;3$;26| ((|x| $) (|y| $) ($ $)) (|min_DF| |x| |y|)) 

(PUT '|DFLOAT;=;2$B;27| '|SPADreplace| '|eql_DF|) 

(SDEFUN |DFLOAT;=;2$B;27| ((|x| $) (|y| $) ($ |Boolean|)) (|eql_DF| |x| |y|)) 

(PUT '|DFLOAT;/;$I$;28| '|SPADreplace| '|div_DF_I|) 

(SDEFUN |DFLOAT;/;$I$;28| ((|x| $) (|i| |Integer|) ($ $)) (|div_DF_I| |x| |i|)) 

(SDEFUN |DFLOAT;sqrt;2$;29| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (|sqrt_DF| |x|) $)) 

(PUT '|DFLOAT;qsqrt;2$;30| '|SPADreplace| '|qsqrt_DF|) 

(SDEFUN |DFLOAT;qsqrt;2$;30| ((|x| $) ($ $)) (|qsqrt_DF| |x|)) 

(SDEFUN |DFLOAT;log10;2$;31| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (LOG10 |x|) $)) 

(PUT '|DFLOAT;^;$I$;32| '|SPADreplace| '|expt_DF_I|) 

(SDEFUN |DFLOAT;^;$I$;32| ((|x| $) (|i| |Integer|) ($ $)) (|expt_DF_I| |x| |i|)) 

(SDEFUN |DFLOAT;^;3$;33| ((|x| $) (|y| $) ($ $))
        (|DFLOAT;checkComplex| (|expt_DF| |x| |y|) $)) 

(PUT '|DFLOAT;coerce;I$;34| '|SPADreplace|
     '(XLAM (|i|) (FLOAT |i| MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |DFLOAT;coerce;I$;34| ((|i| |Integer|) ($ $))
        (FLOAT |i| MOST-POSITIVE-DOUBLE-FLOAT)) 

(PUT '|DFLOAT;exp;2$;35| '|SPADreplace| '|exp_DF|) 

(SDEFUN |DFLOAT;exp;2$;35| ((|x| $) ($ $)) (|exp_DF| |x|)) 

(SDEFUN |DFLOAT;log;2$;36| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (|log_DF| |x|) $)) 

(PUT '|DFLOAT;qlog;2$;37| '|SPADreplace| '|qlog_DF|) 

(SDEFUN |DFLOAT;qlog;2$;37| ((|x| $) ($ $)) (|qlog_DF| |x|)) 

(SDEFUN |DFLOAT;log2;2$;38| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (LOG2 |x|) $)) 

(PUT '|DFLOAT;sin;2$;39| '|SPADreplace| '|sin_DF|) 

(SDEFUN |DFLOAT;sin;2$;39| ((|x| $) ($ $)) (|sin_DF| |x|)) 

(PUT '|DFLOAT;cos;2$;40| '|SPADreplace| '|cos_DF|) 

(SDEFUN |DFLOAT;cos;2$;40| ((|x| $) ($ $)) (|cos_DF| |x|)) 

(PUT '|DFLOAT;tan;2$;41| '|SPADreplace| '|tan_DF|) 

(SDEFUN |DFLOAT;tan;2$;41| ((|x| $) ($ $)) (|tan_DF| |x|)) 

(PUT '|DFLOAT;cot;2$;42| '|SPADreplace| 'COT) 

(SDEFUN |DFLOAT;cot;2$;42| ((|x| $) ($ $)) (COT |x|)) 

(SDEFUN |DFLOAT;sec;2$;43| ((|x| $) ($ $)) (|div_DF| 1.0 (|cos_DF| |x|))) 

(SDEFUN |DFLOAT;csc;2$;44| ((|x| $) ($ $)) (|div_DF| 1.0 (|sin_DF| |x|))) 

(SDEFUN |DFLOAT;asin;2$;45| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (ASIN |x|) $)) 

(SDEFUN |DFLOAT;acos;2$;46| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (ACOS |x|) $)) 

(PUT '|DFLOAT;atan;2$;47| '|SPADreplace| '|atan_DF|) 

(SDEFUN |DFLOAT;atan;2$;47| ((|x| $) ($ $)) (|atan_DF| |x|)) 

(SDEFUN |DFLOAT;acsc;2$;48| ((|x| $) ($ $))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 67))) 

(SDEFUN |DFLOAT;acot;2$;49| ((|x| $) ($ $))
        (COND
         ((|less_DF| 0.0 |x|)
          (COND ((|less_DF| |x| 1.0) (|sub_DF| (QREFELT $ 71) (|atan_DF| |x|)))
                ('T (|atan_DF| (|div_DF| 1.0 |x|)))))
         ((NULL (|less_DF| (|minus_DF| 1.0) |x|))
          (|sub_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                    (|atan_DF| (|minus_DF| (|div_DF| 1.0 |x|)))))
         ('T (|add_DF| (QREFELT $ 71) (|atan_DF| (|minus_DF| |x|)))))) 

(SDEFUN |DFLOAT;asec;2$;50| ((|x| $) ($ $))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 68))) 

(PUT '|DFLOAT;sinh;2$;51| '|SPADreplace| '|sinh_DF|) 

(SDEFUN |DFLOAT;sinh;2$;51| ((|x| $) ($ $)) (|sinh_DF| |x|)) 

(PUT '|DFLOAT;cosh;2$;52| '|SPADreplace| '|cosh_DF|) 

(SDEFUN |DFLOAT;cosh;2$;52| ((|x| $) ($ $)) (|cosh_DF| |x|)) 

(PUT '|DFLOAT;tanh;2$;53| '|SPADreplace| '|tanh_DF|) 

(SDEFUN |DFLOAT;tanh;2$;53| ((|x| $) ($ $)) (|tanh_DF| |x|)) 

(SDEFUN |DFLOAT;csch;2$;54| ((|x| $) ($ $)) (|div_DF| 1.0 (|sinh_DF| |x|))) 

(SDEFUN |DFLOAT;coth;2$;55| ((|x| $) ($ $)) (|div_DF| 1.0 (|tanh_DF| |x|))) 

(SDEFUN |DFLOAT;sech;2$;56| ((|x| $) ($ $)) (|div_DF| 1.0 (|cosh_DF| |x|))) 

(PUT '|DFLOAT;asinh;2$;57| '|SPADreplace| 'ASINH) 

(SDEFUN |DFLOAT;asinh;2$;57| ((|x| $) ($ $)) (ASINH |x|)) 

(SDEFUN |DFLOAT;acosh;2$;58| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (ACOSH |x|) $)) 

(SDEFUN |DFLOAT;atanh;2$;59| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (ATANH |x|) $)) 

(SDEFUN |DFLOAT;acsch;2$;60| ((|x| $) ($ $)) (ASINH (|div_DF| 1.0 |x|))) 

(SDEFUN |DFLOAT;acoth;2$;61| ((|x| $) ($ $))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 82))) 

(SDEFUN |DFLOAT;asech;2$;62| ((|x| $) ($ $))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 81))) 

(PUT '|DFLOAT;/;3$;63| '|SPADreplace| '|div_DF|) 

(SDEFUN |DFLOAT;/;3$;63| ((|x| $) (|y| $) ($ $)) (|div_DF| |x| |y|)) 

(PUT '|DFLOAT;negative?;$B;64| '|SPADreplace| '|negative?_DF|) 

(SDEFUN |DFLOAT;negative?;$B;64| ((|x| $) ($ |Boolean|)) (|negative?_DF| |x|)) 

(PUT '|DFLOAT;zero?;$B;65| '|SPADreplace| '|zero?_DF|) 

(SDEFUN |DFLOAT;zero?;$B;65| ((|x| $) ($ |Boolean|)) (|zero?_DF| |x|)) 

(SDEFUN |DFLOAT;hashUpdate!;Hs$Hs;66|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(SDEFUN |DFLOAT;recip;$U;67| ((|x| $) ($ |Union| $ "failed"))
        (COND ((|zero?_DF| |x|) (CONS 1 "failed"))
              ('T (CONS 0 (|div_DF| 1.0 |x|))))) 

(PUT '|DFLOAT;differentiate;2$;68| '|SPADreplace| '(XLAM (|x|) 0.0)) 

(SDEFUN |DFLOAT;differentiate;2$;68| ((|x| $) ($ $)) 0.0) 

(SDEFUN |DFLOAT;airyAi;2$;69| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 95))) 

(SDEFUN |DFLOAT;airyBi;2$;70| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 97))) 

(SDEFUN |DFLOAT;besselI;3$;71| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 99))) 

(SDEFUN |DFLOAT;besselJ;3$;72| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 101))) 

(SDEFUN |DFLOAT;besselK;3$;73| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 103))) 

(SDEFUN |DFLOAT;besselY;3$;74| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 105))) 

(SDEFUN |DFLOAT;digamma;2$;75| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 107))) 

(SDEFUN |DFLOAT;polygamma;3$;76| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G519 NIL) (|n| (|Union| (|Integer|) "failed")))
               (SEQ (LETT |n| (SPADCALL |x| (QREFELT $ 110)))
                    (EXIT
                     (COND
                      ((QEQCAR |n| 0)
                       (COND
                        ((>= (QCDR |n|) 0)
                         (SPADCALL
                          (PROG1 (LETT #1# (QCDR |n|))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          |y| (QREFELT $ 112)))
                        (#2='T
                         (|error|
                          #3="polygamma: first argument should be a nonnegative integer"))))
                      (#2# (|error| #3#))))))) 

(SDEFUN |DFLOAT;Beta;3$;77| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 115))) 

(SDEFUN |DFLOAT;Gamma;2$;78| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 117))) 

(SDEFUN |DFLOAT;lambertW;2$;79| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 120))) 

(SDEFUN |DFLOAT;ellipticF;3$;80| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 123))) 

(SDEFUN |DFLOAT;ellipticK;2$;81| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 125))) 

(SDEFUN |DFLOAT;ellipticE;3$;82| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 127))) 

(SDEFUN |DFLOAT;ellipticE;2$;83| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 129))) 

(SDEFUN |DFLOAT;ellipticPi;4$;84| ((|x| $) (|y| $) (|z| $) ($ $))
        (SPADCALL |x| |y| |z| (QREFELT $ 131))) 

(SDEFUN |DFLOAT;jacobiSn;3$;85| ((|x| $) (|y| $) ($ $))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 134)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 135))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 136))
                                       (SPADCALL |y| (QREFELT $ 136))
                                       (QREFELT $ 138))
                             (QREFELT $ 139))))
                      (SPADCALL |obits| (QREFELT $ 135))))))) 

(SDEFUN |DFLOAT;jacobiCn;3$;86| ((|x| $) (|y| $) ($ $))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 134)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 135))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 136))
                                       (SPADCALL |y| (QREFELT $ 136))
                                       (QREFELT $ 141))
                             (QREFELT $ 139))))
                      (SPADCALL |obits| (QREFELT $ 135))))))) 

(SDEFUN |DFLOAT;jacobiDn;3$;87| ((|x| $) (|y| $) ($ $))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 134)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 135))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 136))
                                       (SPADCALL |y| (QREFELT $ 136))
                                       (QREFELT $ 143))
                             (QREFELT $ 139))))
                      (SPADCALL |obits| (QREFELT $ 135))))))) 

(SDEFUN |DFLOAT;weierstrassP;4$;88| ((|x| $) (|y| $) (|z| $) ($ $))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 134)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 135))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 136))
                                       (SPADCALL |y| (QREFELT $ 136))
                                       (SPADCALL |z| (QREFELT $ 136))
                                       (QREFELT $ 145))
                             (QREFELT $ 139))))
                      (SPADCALL |obits| (QREFELT $ 135))))))) 

(SDEFUN |DFLOAT;weierstrassPPrime;4$;89| ((|x| $) (|y| $) (|z| $) ($ $))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 134)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 135))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 136))
                                       (SPADCALL |y| (QREFELT $ 136))
                                       (SPADCALL |z| (QREFELT $ 136))
                                       (QREFELT $ 147))
                             (QREFELT $ 139))))
                      (SPADCALL |obits| (QREFELT $ 135))))))) 

(PUT '|DFLOAT;wholePart;$I;90| '|SPADreplace| 'TRUNCATE) 

(SDEFUN |DFLOAT;wholePart;$I;90| ((|x| $) ($ |Integer|)) (TRUNCATE |x|)) 

(SDEFUN |DFLOAT;float;2IPi$;91|
        ((|ma| . #1=(|Integer|)) (|ex| . #1#) (|b| |PositiveInteger|) ($ $))
        (|mul_DF_I| (|expt_DF_I| (FLOAT |b| MOST-POSITIVE-DOUBLE-FLOAT) |ex|)
                    |ma|)) 

(PUT '|DFLOAT;convert;2$;92| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DFLOAT;convert;2$;92| ((|x| $) ($ |DoubleFloat|)) |x|) 

(SDEFUN |DFLOAT;convert;$F;93| ((|x| $) ($ |Float|))
        (SPADCALL |x| (QREFELT $ 136))) 

(SDEFUN |DFLOAT;rationalApproximation;$NniF;94|
        ((|x| $) (|d| |NonNegativeInteger|) ($ |Fraction| (|Integer|)))
        (SPADCALL |x| |d| 10 (QREFELT $ 154))) 

(SDEFUN |DFLOAT;atan;3$;95| ((|x| $) (|y| $) ($ $))
        (SPROG ((|theta| ($)))
               (SEQ
                (COND
                 ((|eql_DF| |x| 0.0)
                  (COND
                   ((SPADCALL |y| 0.0 (QREFELT $ 156))
                    (|div_DF_I| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) 2))
                   ((|less_DF| |y| 0.0)
                    (|minus_DF|
                     (|div_DF_I| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) 2)))
                   (#1='T 0.0)))
                 (#1#
                  (SEQ (LETT |theta| (|atan_DF| (|abs_DF| (|div_DF| |y| |x|))))
                       (COND
                        ((|less_DF| |x| 0.0)
                         (LETT |theta|
                               (|sub_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                                         |theta|))))
                       (COND
                        ((|less_DF| |y| 0.0)
                         (LETT |theta| (|minus_DF| |theta|))))
                       (EXIT |theta|))))))) 

(SDEFUN |DFLOAT;retract;$F;96| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPROG ((#1=#:G552 NIL))
               (SPADCALL |x|
                         (PROG1 (LETT #1# (- (SPADCALL (QREFELT $ 22)) 1))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         (SPADCALL (QREFELT $ 18)) (QREFELT $ 154)))) 

(SDEFUN |DFLOAT;retractIfCan;$U;97|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPROG ((#1=#:G557 NIL))
               (CONS 0
                     (SPADCALL |x|
                               (PROG1
                                   (LETT #1# (- (SPADCALL (QREFELT $ 22)) 1))
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               (SPADCALL (QREFELT $ 18)) (QREFELT $ 154))))) 

(SDEFUN |DFLOAT;retract;$I;98| ((|x| $) ($ |Integer|))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (TRUNCATE |x|))
                    (EXIT
                     (COND
                      ((|eql_DF| |x| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT))
                       |n|)
                      ('T (|error| "Not an integer"))))))) 

(SDEFUN |DFLOAT;retractIfCan;$U;99| ((|x| $) ($ |Union| (|Integer|) "failed"))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (TRUNCATE |x|))
                    (EXIT
                     (COND
                      ((|eql_DF| |x| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT))
                       (CONS 0 |n|))
                      ('T (CONS 1 "failed"))))))) 

(SDEFUN |DFLOAT;sign;$I;100| ((|x| $) ($ |Integer|))
        (SPADCALL (FLOAT-SIGN |x| 1.0) (QREFELT $ 161))) 

(PUT '|DFLOAT;abs;2$;101| '|SPADreplace| '|abs_DF|) 

(SDEFUN |DFLOAT;abs;2$;101| ((|x| $) ($ $)) (|abs_DF| |x|)) 

(PUT '|DFLOAT;conjugate;2$;102| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DFLOAT;conjugate;2$;102| ((|x| $) ($ $)) |x|) 

(SDEFUN |DFLOAT;manexp|
        ((|x| $)
         ($ |Record| (|:| MANTISSA (|Integer|)) (|:| EXPONENT (|Integer|))))
        (SPROG
         ((|two53| (|PositiveInteger|))
          (|me| (|Record| (|:| |man| $) (|:| |exp| (|Integer|))))
          (#1=#:G577 NIL) (|s| (|Integer|)))
         (SEQ
          (EXIT
           (COND ((|zero?_DF| |x|) (CONS 0 0))
                 ('T
                  (SEQ (LETT |s| (SPADCALL |x| (QREFELT $ 163)))
                       (LETT |x| (|abs_DF| |x|))
                       (COND
                        ((SPADCALL |x| MOST-POSITIVE-DOUBLE-FLOAT
                                   (QREFELT $ 156))
                         (PROGN
                          (LETT #1#
                                (CONS
                                 (+
                                  (* |s|
                                     (SPADCALL MOST-POSITIVE-DOUBLE-FLOAT
                                               (QREFELT $ 20)))
                                  1)
                                 (SPADCALL MOST-POSITIVE-DOUBLE-FLOAT
                                           (QREFELT $ 21))))
                          (GO #2=#:G576))))
                       (LETT |me| (MANEXP |x|))
                       (LETT |two53|
                             (EXPT (SPADCALL (QREFELT $ 18))
                                   (SPADCALL (QREFELT $ 22))))
                       (EXIT
                        (CONS
                         (* |s|
                            (TRUNCATE
                             (SPADCALL |two53| (QCAR |me|) (QREFELT $ 24))))
                         (- (QCDR |me|) (SPADCALL (QREFELT $ 22)))))))))
          #2# (EXIT #1#)))) 

(SDEFUN |DFLOAT;rationalApproximation;$2NniF;104|
        ((|f| $) (|d| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Fraction| (|Integer|)))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|#G145| #3=(|Integer|))
          (|#G144| #1#) (|q1| #4=(|Integer|)) (|q0| (|Integer|))
          (|#G143| #5=(|Integer|)) (|#G142| #4#) (|p1| #6=(|Integer|))
          (|p0| (|Integer|)) (|#G141| #5#) (|#G140| #6#) (#7=#:G610 NIL)
          (|q2| #5#) (|p2| #5#) (|r| #3#) (|q| #8=(|Integer|))
          (|#G139| (|Record| (|:| |quotient| #8#) (|:| |remainder| #3#)))
          (|tol| (|NonNegativeInteger|)) (|de| #1#) (#9=#:G601 NIL)
          (#10=#:G599 NIL) (BASE (|PositiveInteger|)) (|ex| #11=(|Integer|))
          (|nu| #2#)
          (|#G138| (|Record| (|:| MANTISSA #2#) (|:| EXPONENT #11#))))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G138| (|DFLOAT;manexp| |f| $))
             (LETT |nu| (QCAR |#G138|))
             (LETT |ex| (QCDR |#G138|))
             |#G138|)
            (LETT BASE (SPADCALL (QREFELT $ 18)))
            (EXIT
             (COND
              ((>= |ex| 0)
               (SPADCALL
                (* |nu|
                   (EXPT BASE
                         (PROG1 (LETT #10# |ex|)
                           (|check_subtype2| (>= #10# 0)
                                             '(|NonNegativeInteger|)
                                             '(|Integer|) #10#))))
                (QREFELT $ 166)))
              (#12='T
               (SEQ
                (LETT |de|
                      (EXPT BASE
                            (PROG1 (LETT #9# (- |ex|))
                              (|check_subtype2| (>= #9# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #9#))))
                (EXIT
                 (COND ((< |b| 2) (|error| "base must be > 1"))
                       (#12#
                        (SEQ (LETT |tol| (EXPT |b| |d|)) (LETT |s| |nu|)
                             (LETT |t| |de|) (LETT |p0| 0) (LETT |p1| 1)
                             (LETT |q0| 1) (LETT |q1| 0)
                             (EXIT
                              (SEQ G190 NIL
                                   (SEQ
                                    (PROGN
                                     (LETT |#G139| (DIVIDE2 |s| |t|))
                                     (LETT |q| (QCAR |#G139|))
                                     (LETT |r| (QCDR |#G139|))
                                     |#G139|)
                                    (LETT |p2| (+ (* |q| |p1|) |p0|))
                                    (LETT |q2| (+ (* |q| |q1|) |q0|))
                                    (COND
                                     ((OR (EQL |r| 0)
                                          (<
                                           (* |tol|
                                              (ABS
                                               (- (* |nu| |q2|)
                                                  (* |de| |p2|))))
                                           (* |de| (ABS |p2|))))
                                      (EXIT
                                       (PROGN
                                        (LETT #7#
                                              (SPADCALL |p2| |q2|
                                                        (QREFELT $ 167)))
                                        (GO #13=#:G609)))))
                                    (PROGN
                                     (LETT |#G140| |p1|)
                                     (LETT |#G141| |p2|)
                                     (LETT |p0| |#G140|)
                                     (LETT |p1| |#G141|))
                                    (PROGN
                                     (LETT |#G142| |q1|)
                                     (LETT |#G143| |q2|)
                                     (LETT |q0| |#G142|)
                                     (LETT |q1| |#G143|))
                                    (EXIT
                                     (PROGN
                                      (LETT |#G144| |t|)
                                      (LETT |#G145| |r|)
                                      (LETT |s| |#G144|)
                                      (LETT |t| |#G145|))))
                                   NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #13# (EXIT #7#)))) 

(SDEFUN |DFLOAT;^;$F$;105| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPROG ((#1=#:G620 NIL) (|d| (|Integer|)) (|n| (|Integer|)))
               (SEQ
                (EXIT
                 (COND
                  ((|zero?_DF| |x|)
                   (COND ((SPADCALL |r| (QREFELT $ 168)) 1.0)
                         ((SPADCALL |r| (QREFELT $ 169))
                          (|error| "division by 0"))
                         (#2='T 0.0)))
                  ((OR (SPADCALL |r| (QREFELT $ 168)) (|eql_DF| |x| 1.0)) 1.0)
                  ('T
                   (COND
                    ((SPADCALL |r| (|spadConstant| $ 170) (QREFELT $ 171)) |x|)
                    (#2#
                     (SEQ (LETT |n| (SPADCALL |r| (QREFELT $ 172)))
                          (LETT |d| (SPADCALL |r| (QREFELT $ 173)))
                          (EXIT
                           (COND
                            ((|negative?_DF| |x|)
                             (COND
                              ((ODDP |d|)
                               (COND
                                ((ODDP |n|)
                                 (PROGN
                                  (LETT #1#
                                        (|minus_DF|
                                         (SPADCALL (|minus_DF| |x|) |r|
                                                   (QREFELT $ 174))))
                                  (GO #3=#:G619)))
                                (#2#
                                 (PROGN
                                  (LETT #1#
                                        (SPADCALL (|minus_DF| |x|) |r|
                                                  (QREFELT $ 174)))
                                  (GO #3#)))))
                              (#2# (|error| "negative root"))))
                            ((EQL |d| 2)
                             (|expt_DF_I| (SPADCALL |x| (QREFELT $ 52)) |n|))
                            (#2#
                             (SPADCALL |x|
                                       (|div_DF|
                                        (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT)
                                        (FLOAT |d| MOST-POSITIVE-DOUBLE-FLOAT))
                                       (QREFELT $ 56)))))))))))
                #3# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |DoubleFloat;|)) 

(DEFUN |DoubleFloat| ()
  (SPROG NIL
         (PROG (#1=#:G634)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|DoubleFloat|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|DoubleFloat|
                             (LIST (CONS NIL (CONS 1 (|DoubleFloat;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|DoubleFloat|)))))))))) 

(DEFUN |DoubleFloat;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DoubleFloat|))
          (LETT $ (GETREFV 189))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DoubleFloat| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (AND (|HasCategory| $ '(|arbitraryPrecision|))
               (|augmentPredVector| $ 1))
          (AND (|not| (|HasCategory| $ '(|arbitraryExponent|)))
               (|not| (|HasCategory| $ '(|arbitraryPrecision|)))
               (|augmentPredVector| $ 2))
          (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
               (|augmentPredVector| $ 4))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 "~A")
          (QSETREFV $ 71
                    (|div_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)))
          $))) 

(MAKEPROP '|DoubleFloat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|format| (|String|)
              |DFLOAT;doubleFloatFormat;2S;1| (|Void|) (|OpenMathDevice|)
              (0 . |OMputObject|) (|DoubleFloat|) (5 . |OMputFloat|)
              (11 . |OMputEndObject|) (|Boolean|) |DFLOAT;OMwrite;Omd$BV;2|
              (|PositiveInteger|) |DFLOAT;base;Pi;4| (|Integer|)
              |DFLOAT;mantissa;$I;5| |DFLOAT;exponent;$I;6|
              |DFLOAT;precision;Pi;7| |DFLOAT;log2;2$;38| (16 . *)
              |DFLOAT;bits;Pi;8| |DFLOAT;max;$;9| |DFLOAT;min;$;10|
              |DFLOAT;order;$I;11|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |DFLOAT;Zero;$;12|) $))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |DFLOAT;One;$;13|) $))
              |DFLOAT;exp1;$;14| |DFLOAT;pi;$;15| |DFLOAT;convert;$S;16|
              (22 . >=) (|OutputForm|) (28 . |message|) |DFLOAT;coerce;$Of;17|
              (33 . -) (|InputForm|) (38 . |convert|) |DFLOAT;convert;$If;18|
              |DFLOAT;<;2$B;19| |DFLOAT;-;2$;20| |DFLOAT;+;3$;21|
              |DFLOAT;-;3$;22| |DFLOAT;*;3$;23| |DFLOAT;*;I2$;24|
              |DFLOAT;max;3$;25| |DFLOAT;min;3$;26| |DFLOAT;=;2$B;27|
              |DFLOAT;/;$I$;28| |DFLOAT;sqrt;2$;29| |DFLOAT;qsqrt;2$;30|
              |DFLOAT;log10;2$;31| |DFLOAT;^;$I$;32| |DFLOAT;^;3$;33|
              |DFLOAT;coerce;I$;34| |DFLOAT;exp;2$;35| |DFLOAT;log;2$;36|
              |DFLOAT;qlog;2$;37| |DFLOAT;sin;2$;39| |DFLOAT;cos;2$;40|
              |DFLOAT;tan;2$;41| |DFLOAT;cot;2$;42| |DFLOAT;sec;2$;43|
              |DFLOAT;csc;2$;44| |DFLOAT;asin;2$;45| |DFLOAT;acos;2$;46|
              |DFLOAT;atan;2$;47| |DFLOAT;acsc;2$;48| '|pi_half|
              |DFLOAT;acot;2$;49| |DFLOAT;asec;2$;50| |DFLOAT;sinh;2$;51|
              |DFLOAT;cosh;2$;52| |DFLOAT;tanh;2$;53| |DFLOAT;csch;2$;54|
              |DFLOAT;coth;2$;55| |DFLOAT;sech;2$;56| |DFLOAT;asinh;2$;57|
              |DFLOAT;acosh;2$;58| |DFLOAT;atanh;2$;59| |DFLOAT;acsch;2$;60|
              |DFLOAT;acoth;2$;61| |DFLOAT;asech;2$;62| |DFLOAT;/;3$;63|
              |DFLOAT;negative?;$B;64| |DFLOAT;zero?;$B;65| (|HashState|)
              |DFLOAT;hashUpdate!;Hs$Hs;66| (|Union| $ '"failed")
              |DFLOAT;recip;$U;67| |DFLOAT;differentiate;2$;68|
              (|DoubleFloatSpecialFunctions|) (43 . |airyAi|)
              |DFLOAT;airyAi;2$;69| (48 . |airyBi|) |DFLOAT;airyBi;2$;70|
              (53 . |besselI|) |DFLOAT;besselI;3$;71| (59 . |besselJ|)
              |DFLOAT;besselJ;3$;72| (65 . |besselK|) |DFLOAT;besselK;3$;73|
              (71 . |besselY|) |DFLOAT;besselY;3$;74| (77 . |digamma|)
              |DFLOAT;digamma;2$;75| (|Union| 19 '"failed")
              (82 . |retractIfCan|) (|NonNegativeInteger|) (87 . |polygamma|)
              |DFLOAT;polygamma;3$;76| (|DoubleFloatSpecialFunctions2|)
              (93 . |Beta|) |DFLOAT;Beta;3$;77| (99 . |Gamma|)
              |DFLOAT;Gamma;2$;78| (|FloatSpecialFunctions|) (104 . |lambertW|)
              |DFLOAT;lambertW;2$;79| (|DoubleFloatEllipticIntegrals|)
              (109 . |ellipticF|) |DFLOAT;ellipticF;3$;80| (115 . |ellipticK|)
              |DFLOAT;ellipticK;2$;81| (120 . |ellipticE|)
              |DFLOAT;ellipticE;3$;82| (126 . |ellipticE|)
              |DFLOAT;ellipticE;2$;83| (131 . |ellipticPi|)
              |DFLOAT;ellipticPi;4$;84| (|Float|) (138 . |bits|) (142 . |bits|)
              (147 . |convert|) (|FloatEllipticFunctions|) (152 . |jacobiSn|)
              (158 . |convert|) |DFLOAT;jacobiSn;3$;85| (163 . |jacobiCn|)
              |DFLOAT;jacobiCn;3$;86| (169 . |jacobiDn|)
              |DFLOAT;jacobiDn;3$;87| (175 . |weierstrassP|)
              |DFLOAT;weierstrassP;4$;88| (182 . |weierstrassPPrime|)
              |DFLOAT;weierstrassPPrime;4$;89| |DFLOAT;wholePart;$I;90|
              |DFLOAT;float;2IPi$;91| |DFLOAT;convert;2$;92|
              |DFLOAT;convert;$F;93| (|Fraction| 19)
              |DFLOAT;rationalApproximation;$2NniF;104|
              |DFLOAT;rationalApproximation;$NniF;94| (189 . >)
              |DFLOAT;atan;3$;95| |DFLOAT;retract;$F;96|
              (|Union| 153 '"failed") |DFLOAT;retractIfCan;$U;97|
              |DFLOAT;retract;$I;98| |DFLOAT;retractIfCan;$U;99|
              |DFLOAT;sign;$I;100| |DFLOAT;abs;2$;101|
              |DFLOAT;conjugate;2$;102| (195 . |coerce|) (200 . /)
              (206 . |zero?|) (211 . |negative?|) (216 . |One|) (220 . =)
              (226 . |numer|) (231 . |denom|) |DFLOAT;^;$F$;105| (|List| $)
              (|PatternMatchResult| 133 $) (|Pattern| 133) (|Factored| $)
              (|Union| 175 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 180 '#1#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |coef| 175) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|SingleInteger|))
           '#(~= 236 |zero?| 242 |wholePart| 247 |whittakerW| 252 |whittakerM|
              259 |weierstrassZeta| 266 |weierstrassSigma| 273
              |weierstrassPPrime| 280 |weierstrassPInverse| 287 |weierstrassP|
              294 |weberE| 301 |unitNormal| 307 |unitCanonical| 312 |unit?| 317
              |truncate| 322 |toString| 327 |tanh| 338 |tan| 343
              |subtractIfCan| 348 |struveL| 354 |struveH| 360 |squareFreePart|
              366 |squareFree| 371 |sqrt| 376 |smaller?| 381 |sizeLess?| 387
              |sinh| 393 |sin| 398 |sign| 403 |sech| 408 |sec| 413 |sample| 418
              |round| 422 |rightRecip| 427 |rightPower| 432 |riemannZeta| 444
              |retractIfCan| 449 |retract| 459 |rem| 469 |recip| 475
              |rationalApproximation| 480 |quo| 493 |qsqrt| 499 |qlog| 504
              |principalIdeal| 509 |prime?| 514 |precision| 519 |positive?| 528
              |polylog| 533 |polygamma| 539 |pi| 545 |patternMatch| 549 |order|
              556 |opposite?| 561 |one?| 567 |nthRoot| 572 |norm| 578
              |negative?| 583 |multiEuclidean| 588 |min| 594 |meixnerM| 604
              |meijerG| 612 |max| 621 |mantissa| 631 |lommelS2| 636 |lommelS1|
              643 |log2| 650 |log10| 655 |log| 660 |lerchPhi| 665 |legendreQ|
              672 |legendreP| 679 |leftRecip| 686 |leftPower| 691 |lcmCoef| 703
              |lcm| 709 |latex| 720 |lambertW| 725 |laguerreL| 730 |kummerU|
              737 |kummerM| 744 |kelvinKer| 751 |kelvinKei| 757 |kelvinBer| 763
              |kelvinBei| 769 |jacobiZeta| 775 |jacobiTheta| 781 |jacobiSn| 787
              |jacobiP| 793 |jacobiDn| 801 |jacobiCn| 807 |inv| 813
              |increasePrecision| 818 |hypergeometricF| 823 |hermiteH| 830
              |hashUpdate!| 836 |hash| 842 |hankelH2| 847 |hankelH1| 853
              |gcdPolynomial| 859 |gcd| 865 |fractionPart| 876 |floor| 881
              |float| 886 |factor| 899 |extendedEuclidean| 904 |exquo| 917
              |expressIdealMember| 923 |exponent| 929 |exp1| 934 |exp| 938
              |euclideanSize| 943 |ellipticPi| 948 |ellipticK| 955 |ellipticF|
              960 |ellipticE| 966 |doubleFloatFormat| 977 |divide| 982 |digits|
              988 |digamma| 997 |differentiate| 1002 |decreasePrecision| 1013
              |csch| 1018 |csc| 1023 |coth| 1028 |cot| 1033 |cosh| 1038 |cos|
              1043 |convert| 1048 |conjugate| 1073 |commutator| 1078 |coerce|
              1084 |charlierC| 1104 |characteristic| 1111 |ceiling| 1115 |bits|
              1120 |besselY| 1129 |besselK| 1135 |besselJ| 1141 |besselI| 1147
              |base| 1153 |atanh| 1157 |atan| 1162 |associator| 1173
              |associates?| 1180 |asinh| 1186 |asin| 1191 |asech| 1196 |asec|
              1201 |antiCommutator| 1206 |annihilate?| 1212 |angerJ| 1218
              |airyBiPrime| 1224 |airyBi| 1229 |airyAiPrime| 1234 |airyAi| 1239
              |acsch| 1244 |acsc| 1249 |acoth| 1254 |acot| 1259 |acosh| 1264
              |acos| 1269 |abs| 1274 ^ 1279 |Zero| 1309 |One| 1313 |OMwrite|
              1317 |Gamma| 1341 D 1352 |Beta| 1363 >= 1369 > 1375 = 1381 <=
              1387 < 1393 / 1399 - 1411 + 1422 * 1428)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|FloatingPointSystem&| |RealNumberSystem&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| NIL |OrderedRing&| |DivisionRing&| NIL NIL
                |DifferentialRing&| NIL |Algebra&| |EntireRing&| |Algebra&| NIL
                |Rng&| NIL |Module&| |Module&| NIL NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL |AbelianGroup&| NIL NIL NIL NIL |OrderedSet&| NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&| NIL
                NIL |Magma&| |AbelianSemiGroup&|
                |TranscendentalFunctionCategory&| |RetractableTo&|
                |RetractableTo&| NIL NIL |SetCategory&| NIL NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| |OpenMath&| NIL NIL NIL
                |RadicalCategory&| NIL NIL NIL NIL |PartialOrder&| NIL NIL NIL
                NIL NIL |BasicType&| NIL)
             (CONS
              '#((|FloatingPointSystem|) (|RealNumberSystem|) (|Field|)
                 (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|OrderedRing|) (|DivisionRing|) (|CommutativeRing|)
                 (|LeftOreRing|) (|DifferentialRing|) (|CharacteristicZero|)
                 (|Algebra| 153) (|EntireRing|) (|Algebra| $$) (|Ring|) (|Rng|)
                 (|SemiRing|) (|Module| 153) (|Module| $$) (|SemiRng|)
                 (|OrderedAbelianGroup|) (|BiModule| 153 153)
                 (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| 153)
                 (|LeftModule| 153) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedSet|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|PatternMatchable| 133) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|TranscendentalFunctionCategory|)
                 (|RetractableTo| 153) (|RetractableTo| 19) (|RealConstant|)
                 (|CommutativeStar|) (|SetCategory|) (|ConvertibleTo| 39)
                 (|SpecialFunctionCategory|) (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|OpenMath|)
                 (|ConvertibleTo| 7) (|Approximate|) (|ConvertibleTo| 177)
                 (|RadicalCategory|) (|CoercibleFrom| 153) (|CoercibleFrom| 19)
                 (|ConvertibleTo| 133) (|ConvertibleTo| 12) (|PartialOrder|)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 35))
              (|makeByteWordVec2| 188
                                  '(1 10 9 0 11 2 10 9 0 12 13 1 10 9 0 14 2 0
                                    0 17 0 24 2 0 15 0 0 34 1 35 0 7 36 1 35 0
                                    0 38 1 39 0 12 40 1 94 12 12 95 1 94 12 12
                                    97 2 94 12 12 12 99 2 94 12 12 12 101 2 94
                                    12 12 12 103 2 94 12 12 12 105 1 94 12 12
                                    107 1 12 109 0 110 2 94 12 111 12 112 2 114
                                    12 12 12 115 1 114 12 12 117 1 119 12 12
                                    120 2 122 12 12 12 123 1 122 12 12 125 2
                                    122 12 12 12 127 1 122 12 12 129 3 122 12
                                    12 12 12 131 0 133 17 134 1 133 17 17 135 1
                                    133 0 12 136 2 137 133 133 133 138 1 133 12
                                    0 139 2 137 133 133 133 141 2 137 133 133
                                    133 143 3 137 133 133 133 133 145 3 137 133
                                    133 133 133 147 2 0 15 0 0 156 1 153 0 19
                                    166 2 153 0 19 19 167 1 153 15 0 168 1 153
                                    15 0 169 0 153 0 170 2 153 15 0 0 171 1 153
                                    19 0 172 1 153 19 0 173 2 0 15 0 0 1 1 0 15
                                    0 88 1 0 19 0 149 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    148 3 0 0 0 0 0 1 3 0 0 0 0 0 146 2 0 0 0 0
                                    1 1 0 187 0 1 1 0 0 0 1 1 0 15 0 1 1 0 0 0
                                    1 2 0 7 0 111 1 1 0 7 0 1 1 0 0 0 76 1 0 0
                                    0 63 2 0 91 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1
                                    0 0 0 1 1 0 178 0 1 1 0 0 0 52 2 0 15 0 0 1
                                    2 0 15 0 0 1 1 0 0 0 74 1 0 0 0 61 1 0 19 0
                                    163 1 0 0 0 79 1 0 0 0 65 0 0 0 1 1 0 0 0 1
                                    1 0 91 0 1 2 0 0 0 111 1 2 0 0 0 17 1 1 0 0
                                    0 1 1 0 159 0 160 1 0 109 0 162 1 0 153 0
                                    158 1 0 19 0 161 2 0 0 0 0 1 1 0 91 0 92 3
                                    0 153 0 111 111 154 2 0 153 0 111 155 2 0 0
                                    0 0 1 1 0 0 0 53 1 0 0 0 60 1 0 185 175 1 1
                                    0 15 0 1 1 1 17 17 1 0 0 17 22 1 0 15 0 1 2
                                    0 0 0 0 1 2 0 0 0 0 113 0 0 0 32 3 0 176 0
                                    177 176 1 1 0 19 0 28 2 0 15 0 0 1 1 0 15 0
                                    1 2 0 0 0 19 1 1 0 0 0 1 1 0 15 0 87 2 0
                                    179 175 0 1 0 2 0 27 2 0 0 0 0 49 4 0 0 0 0
                                    0 0 1 5 3 0 175 175 175 175 0 1 0 2 0 26 2
                                    0 0 0 0 48 1 0 19 0 20 3 0 0 0 0 0 1 3 0 0
                                    0 0 0 1 1 0 0 0 23 1 0 0 0 54 1 0 0 0 59 3
                                    0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0
                                    91 0 1 2 0 0 0 111 1 2 0 0 0 17 1 2 0 186 0
                                    0 1 2 0 0 0 0 1 1 0 0 175 1 1 0 7 0 1 1 0 0
                                    0 121 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    140 4 0 0 0 0 0 0 1 2 0 0 0 0 144 2 0 0 0 0
                                    142 1 0 0 0 1 1 1 17 19 1 3 3 0 175 175 0 1
                                    2 0 0 0 0 1 2 0 89 89 0 90 1 0 188 0 1 2 0
                                    0 0 0 1 2 0 0 0 0 1 2 0 184 184 184 1 2 0 0
                                    0 0 1 1 0 0 175 1 1 0 0 0 1 1 0 0 0 1 2 0 0
                                    19 19 1 3 0 0 19 19 17 150 1 0 178 0 1 3 0
                                    181 0 0 0 1 2 0 182 0 0 1 2 0 91 0 0 1 2 0
                                    179 175 0 1 1 0 19 0 21 0 0 0 31 1 0 0 0 58
                                    1 0 111 0 1 3 0 0 0 0 0 132 1 0 0 0 126 2 0
                                    0 0 0 124 2 0 0 0 0 128 1 0 0 0 130 1 0 7 7
                                    8 2 0 183 0 0 1 1 1 17 17 1 0 0 17 1 1 0 0
                                    0 108 1 0 0 0 93 2 0 0 0 111 1 1 1 17 19 1
                                    1 0 0 0 77 1 0 0 0 66 1 0 0 0 78 1 0 0 0 64
                                    1 0 0 0 75 1 0 0 0 62 1 0 39 0 41 1 0 7 0
                                    33 1 0 177 0 1 1 0 12 0 151 1 0 133 0 152 1
                                    0 0 0 165 2 0 0 0 0 1 1 0 0 153 1 1 0 0 19
                                    57 1 0 0 0 1 1 0 35 0 37 3 0 0 0 0 0 1 0 0
                                    111 1 1 0 0 0 1 1 1 17 17 1 0 0 17 25 2 0 0
                                    0 0 106 2 0 0 0 0 104 2 0 0 0 0 102 2 0 0 0
                                    0 100 0 0 17 18 1 0 0 0 82 2 0 0 0 0 157 1
                                    0 0 0 69 3 0 0 0 0 0 1 2 0 15 0 0 1 1 0 0 0
                                    80 1 0 0 0 67 1 0 0 0 85 1 0 0 0 73 2 0 0 0
                                    0 1 2 0 15 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 0
                                    0 0 98 1 0 0 0 1 1 0 0 0 96 1 0 0 0 83 1 0
                                    0 0 70 1 0 0 0 84 1 0 0 0 72 1 0 0 0 81 1 0
                                    0 0 68 1 0 0 0 164 2 0 0 0 0 56 2 0 0 0 153
                                    174 2 0 0 0 19 55 2 0 0 0 111 1 2 0 0 0 17
                                    1 0 0 0 29 0 0 0 30 3 0 9 10 0 15 16 2 0 9
                                    10 0 1 1 0 7 0 1 2 0 7 0 15 1 2 0 0 0 0 1 1
                                    0 0 0 118 1 0 0 0 1 2 0 0 0 111 1 2 0 0 0 0
                                    116 2 0 15 0 0 34 2 0 15 0 0 156 2 0 15 0 0
                                    50 2 0 15 0 0 1 2 0 15 0 0 42 2 0 0 0 19 51
                                    2 0 0 0 0 86 2 0 0 0 0 45 1 0 0 0 43 2 0 0
                                    0 0 44 2 0 0 0 153 1 2 0 0 153 0 1 2 0 0
                                    111 0 1 2 0 0 19 0 47 2 0 0 0 0 46 2 0 0 17
                                    0 24)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloat| 'NILADIC T) 
