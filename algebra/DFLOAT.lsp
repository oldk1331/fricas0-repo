
(SDEFUN |DFLOAT;doubleFloatFormat;2S;1| ((|s| (|String|)) ($ (|String|)))
        (SPROG ((|ss| (|String|)))
               (SEQ (LETT |ss| (QREFELT $ 6)) (SETELT $ 6 |s|) (EXIT |ss|)))) 

(SDEFUN |DFLOAT;OMwrite;Omd$BV;2|
        ((|dev| (|OpenMathDevice|)) (|x| ($)) (|wholeObj| (|Boolean|))
         ($ (|Void|)))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 11))))
             (SPADCALL |dev| |x| (QREFELT $ 13))
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 14))))))) 

(PUT '|DFLOAT;checkComplex| '|SPADreplace| '|c_to_r|) 

(SDEFUN |DFLOAT;checkComplex| ((|x| ($)) ($ ($))) (|c_to_r| |x|)) 

(PUT '|DFLOAT;base;Pi;4| '|SPADreplace| '(XLAM NIL (FLOAT-RADIX 0.0))) 

(SDEFUN |DFLOAT;base;Pi;4| (($ (|PositiveInteger|))) (FLOAT-RADIX 0.0)) 

(SDEFUN |DFLOAT;mantissa;$I;5| ((|x| ($)) ($ (|Integer|)))
        (QCAR (|DFLOAT;manexp| |x| $))) 

(SDEFUN |DFLOAT;exponent;$I;6| ((|x| ($)) ($ (|Integer|)))
        (QCDR (|DFLOAT;manexp| |x| $))) 

(PUT '|DFLOAT;precision;Pi;7| '|SPADreplace| '(XLAM NIL (FLOAT-DIGITS 0.0))) 

(SDEFUN |DFLOAT;precision;Pi;7| (($ (|PositiveInteger|))) (FLOAT-DIGITS 0.0)) 

(SDEFUN |DFLOAT;bits;Pi;8| (($ (|PositiveInteger|)))
        (SPROG ((#1=#:G439 NIL))
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

(SDEFUN |DFLOAT;max;$;9| (($ ($))) MOST-POSITIVE-DOUBLE-FLOAT) 

(PUT '|DFLOAT;min;$;10| '|SPADreplace| '(XLAM NIL MOST-NEGATIVE-DOUBLE-FLOAT)) 

(SDEFUN |DFLOAT;min;$;10| (($ ($))) MOST-NEGATIVE-DOUBLE-FLOAT) 

(SDEFUN |DFLOAT;order;$I;11| ((|a| ($)) ($ (|Integer|)))
        (- (+ (SPADCALL (QREFELT $ 22)) (SPADCALL |a| (QREFELT $ 21))) 1)) 

(PUT '|DFLOAT;Zero;$;12| '|SPADreplace|
     '(XLAM NIL (FLOAT 0 MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |DFLOAT;Zero;$;12| (($ ($))) (FLOAT 0 MOST-POSITIVE-DOUBLE-FLOAT)) 

(PUT '|DFLOAT;One;$;13| '|SPADreplace|
     '(XLAM NIL (FLOAT 1 MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |DFLOAT;One;$;13| (($ ($))) (FLOAT 1 MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |DFLOAT;exp1;$;14| (($ ($)))
        (|div_DF| (FLOAT 534625820200 MOST-POSITIVE-DOUBLE-FLOAT)
                  (FLOAT 196677847971 MOST-POSITIVE-DOUBLE-FLOAT))) 

(PUT '|DFLOAT;pi;$;15| '|SPADreplace|
     '(XLAM NIL (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |DFLOAT;pi;$;15| (($ ($))) (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |DFLOAT;convert;$S;16| ((|x| ($)) ($ (|String|)))
        (FORMAT NIL (QREFELT $ 6) |x|)) 

(SDEFUN |DFLOAT;coerce;$Of;17| ((|x| ($)) ($ (|OutputForm|)))
        (COND
         ((SPADCALL |x| 0.0 (QREFELT $ 34))
          (SPADCALL (SPADCALL |x| (QREFELT $ 33)) (QREFELT $ 36)))
         ('T
          (SPADCALL (SPADCALL (|minus_DF| |x|) (QREFELT $ 37))
                    (QREFELT $ 38))))) 

(SDEFUN |DFLOAT;convert;$If;18| ((|x| ($)) ($ (|InputForm|)))
        (SPADCALL |x| (QREFELT $ 40))) 

(PUT '|DFLOAT;<;2$B;19| '|SPADreplace| '|less_DF|) 

(SDEFUN |DFLOAT;<;2$B;19| ((|x| ($)) (|y| ($)) ($ (|Boolean|)))
        (|less_DF| |x| |y|)) 

(PUT '|DFLOAT;-;2$;20| '|SPADreplace| '|minus_DF|) 

(SDEFUN |DFLOAT;-;2$;20| ((|x| ($)) ($ ($))) (|minus_DF| |x|)) 

(PUT '|DFLOAT;+;3$;21| '|SPADreplace| '|add_DF|) 

(SDEFUN |DFLOAT;+;3$;21| ((|x| ($)) (|y| ($)) ($ ($))) (|add_DF| |x| |y|)) 

(PUT '|DFLOAT;-;3$;22| '|SPADreplace| '|sub_DF|) 

(SDEFUN |DFLOAT;-;3$;22| ((|x| ($)) (|y| ($)) ($ ($))) (|sub_DF| |x| |y|)) 

(PUT '|DFLOAT;*;3$;23| '|SPADreplace| '|mul_DF|) 

(SDEFUN |DFLOAT;*;3$;23| ((|x| ($)) (|y| ($)) ($ ($))) (|mul_DF| |x| |y|)) 

(PUT '|DFLOAT;*;I2$;24| '|SPADreplace| '(XLAM (|i| |x|) (|mul_DF_I| |x| |i|))) 

(SDEFUN |DFLOAT;*;I2$;24| ((|i| (|Integer|)) (|x| ($)) ($ ($)))
        (|mul_DF_I| |x| |i|)) 

(PUT '|DFLOAT;max;3$;25| '|SPADreplace| '|max_DF|) 

(SDEFUN |DFLOAT;max;3$;25| ((|x| ($)) (|y| ($)) ($ ($))) (|max_DF| |x| |y|)) 

(PUT '|DFLOAT;min;3$;26| '|SPADreplace| '|min_DF|) 

(SDEFUN |DFLOAT;min;3$;26| ((|x| ($)) (|y| ($)) ($ ($))) (|min_DF| |x| |y|)) 

(PUT '|DFLOAT;=;2$B;27| '|SPADreplace| '|eql_DF|) 

(SDEFUN |DFLOAT;=;2$B;27| ((|x| ($)) (|y| ($)) ($ (|Boolean|)))
        (|eql_DF| |x| |y|)) 

(PUT '|DFLOAT;/;$I$;28| '|SPADreplace| '|div_DF_I|) 

(SDEFUN |DFLOAT;/;$I$;28| ((|x| ($)) (|i| (|Integer|)) ($ ($)))
        (|div_DF_I| |x| |i|)) 

(SDEFUN |DFLOAT;sqrt;2$;29| ((|x| ($)) ($ ($)))
        (|DFLOAT;checkComplex| (|sqrt_DF| |x|) $)) 

(PUT '|DFLOAT;qsqrt;2$;30| '|SPADreplace| '|qsqrt_DF|) 

(SDEFUN |DFLOAT;qsqrt;2$;30| ((|x| ($)) ($ ($))) (|qsqrt_DF| |x|)) 

(SDEFUN |DFLOAT;log10;2$;31| ((|x| ($)) ($ ($)))
        (|DFLOAT;checkComplex| (LOG10 |x|) $)) 

(PUT '|DFLOAT;^;$I$;32| '|SPADreplace| '|expt_DF_I|) 

(SDEFUN |DFLOAT;^;$I$;32| ((|x| ($)) (|i| (|Integer|)) ($ ($)))
        (|expt_DF_I| |x| |i|)) 

(SDEFUN |DFLOAT;^;3$;33| ((|x| ($)) (|y| ($)) ($ ($)))
        (|DFLOAT;checkComplex| (|expt_DF| |x| |y|) $)) 

(PUT '|DFLOAT;coerce;I$;34| '|SPADreplace|
     '(XLAM (|i|) (FLOAT |i| MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |DFLOAT;coerce;I$;34| ((|i| (|Integer|)) ($ ($)))
        (FLOAT |i| MOST-POSITIVE-DOUBLE-FLOAT)) 

(PUT '|DFLOAT;exp;2$;35| '|SPADreplace| '|exp_DF|) 

(SDEFUN |DFLOAT;exp;2$;35| ((|x| ($)) ($ ($))) (|exp_DF| |x|)) 

(SDEFUN |DFLOAT;log;2$;36| ((|x| ($)) ($ ($)))
        (|DFLOAT;checkComplex| (|log_DF| |x|) $)) 

(PUT '|DFLOAT;qlog;2$;37| '|SPADreplace| '|qlog_DF|) 

(SDEFUN |DFLOAT;qlog;2$;37| ((|x| ($)) ($ ($))) (|qlog_DF| |x|)) 

(SDEFUN |DFLOAT;log2;2$;38| ((|x| ($)) ($ ($)))
        (|DFLOAT;checkComplex| (LOG2 |x|) $)) 

(PUT '|DFLOAT;sin;2$;39| '|SPADreplace| '|sin_DF|) 

(SDEFUN |DFLOAT;sin;2$;39| ((|x| ($)) ($ ($))) (|sin_DF| |x|)) 

(PUT '|DFLOAT;cos;2$;40| '|SPADreplace| '|cos_DF|) 

(SDEFUN |DFLOAT;cos;2$;40| ((|x| ($)) ($ ($))) (|cos_DF| |x|)) 

(PUT '|DFLOAT;tan;2$;41| '|SPADreplace| '|tan_DF|) 

(SDEFUN |DFLOAT;tan;2$;41| ((|x| ($)) ($ ($))) (|tan_DF| |x|)) 

(PUT '|DFLOAT;cot;2$;42| '|SPADreplace| 'COT) 

(SDEFUN |DFLOAT;cot;2$;42| ((|x| ($)) ($ ($))) (COT |x|)) 

(SDEFUN |DFLOAT;sec;2$;43| ((|x| ($)) ($ ($))) (|div_DF| 1.0 (|cos_DF| |x|))) 

(SDEFUN |DFLOAT;csc;2$;44| ((|x| ($)) ($ ($))) (|div_DF| 1.0 (|sin_DF| |x|))) 

(SDEFUN |DFLOAT;asin;2$;45| ((|x| ($)) ($ ($)))
        (|DFLOAT;checkComplex| (ASIN |x|) $)) 

(SDEFUN |DFLOAT;acos;2$;46| ((|x| ($)) ($ ($)))
        (|DFLOAT;checkComplex| (ACOS |x|) $)) 

(PUT '|DFLOAT;atan;2$;47| '|SPADreplace| '|atan_DF|) 

(SDEFUN |DFLOAT;atan;2$;47| ((|x| ($)) ($ ($))) (|atan_DF| |x|)) 

(SDEFUN |DFLOAT;acsc;2$;48| ((|x| ($)) ($ ($)))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 67))) 

(SDEFUN |DFLOAT;acot;2$;49| ((|x| ($)) ($ ($)))
        (COND
         ((|less_DF| 0.0 |x|)
          (COND ((|less_DF| |x| 1.0) (|sub_DF| (QREFELT $ 71) (|atan_DF| |x|)))
                ('T (|atan_DF| (|div_DF| 1.0 |x|)))))
         ((NULL (|less_DF| (|minus_DF| 1.0) |x|))
          (|sub_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                    (|atan_DF| (|minus_DF| (|div_DF| 1.0 |x|)))))
         ('T (|add_DF| (QREFELT $ 71) (|atan_DF| (|minus_DF| |x|)))))) 

(SDEFUN |DFLOAT;asec;2$;50| ((|x| ($)) ($ ($)))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 68))) 

(PUT '|DFLOAT;sinh;2$;51| '|SPADreplace| '|sinh_DF|) 

(SDEFUN |DFLOAT;sinh;2$;51| ((|x| ($)) ($ ($))) (|sinh_DF| |x|)) 

(PUT '|DFLOAT;cosh;2$;52| '|SPADreplace| '|cosh_DF|) 

(SDEFUN |DFLOAT;cosh;2$;52| ((|x| ($)) ($ ($))) (|cosh_DF| |x|)) 

(PUT '|DFLOAT;tanh;2$;53| '|SPADreplace| '|tanh_DF|) 

(SDEFUN |DFLOAT;tanh;2$;53| ((|x| ($)) ($ ($))) (|tanh_DF| |x|)) 

(SDEFUN |DFLOAT;csch;2$;54| ((|x| ($)) ($ ($))) (|div_DF| 1.0 (|sinh_DF| |x|))) 

(SDEFUN |DFLOAT;coth;2$;55| ((|x| ($)) ($ ($))) (|div_DF| 1.0 (|tanh_DF| |x|))) 

(SDEFUN |DFLOAT;sech;2$;56| ((|x| ($)) ($ ($))) (|div_DF| 1.0 (|cosh_DF| |x|))) 

(PUT '|DFLOAT;asinh;2$;57| '|SPADreplace| 'ASINH) 

(SDEFUN |DFLOAT;asinh;2$;57| ((|x| ($)) ($ ($))) (ASINH |x|)) 

(SDEFUN |DFLOAT;acosh;2$;58| ((|x| ($)) ($ ($)))
        (|DFLOAT;checkComplex| (ACOSH |x|) $)) 

(SDEFUN |DFLOAT;atanh;2$;59| ((|x| ($)) ($ ($)))
        (|DFLOAT;checkComplex| (ATANH |x|) $)) 

(SDEFUN |DFLOAT;acsch;2$;60| ((|x| ($)) ($ ($))) (ASINH (|div_DF| 1.0 |x|))) 

(SDEFUN |DFLOAT;acoth;2$;61| ((|x| ($)) ($ ($)))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 82))) 

(SDEFUN |DFLOAT;asech;2$;62| ((|x| ($)) ($ ($)))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 81))) 

(PUT '|DFLOAT;/;3$;63| '|SPADreplace| '|div_DF|) 

(SDEFUN |DFLOAT;/;3$;63| ((|x| ($)) (|y| ($)) ($ ($))) (|div_DF| |x| |y|)) 

(PUT '|DFLOAT;negative?;$B;64| '|SPADreplace| '|negative?_DF|) 

(SDEFUN |DFLOAT;negative?;$B;64| ((|x| ($)) ($ (|Boolean|)))
        (|negative?_DF| |x|)) 

(PUT '|DFLOAT;zero?;$B;65| '|SPADreplace| '|zero?_DF|) 

(SDEFUN |DFLOAT;zero?;$B;65| ((|x| ($)) ($ (|Boolean|))) (|zero?_DF| |x|)) 

(SDEFUN |DFLOAT;hashUpdate!;Hs$Hs;66|
        ((|hs| #1=(|HashState|)) (|s| ($)) ($ #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(SDEFUN |DFLOAT;recip;$U;67| ((|x| ($)) ($ (|Union| $ "failed")))
        (COND ((|zero?_DF| |x|) (CONS 1 "failed"))
              ('T (CONS 0 (|div_DF| 1.0 |x|))))) 

(PUT '|DFLOAT;differentiate;2$;68| '|SPADreplace| '(XLAM (|x|) 0.0)) 

(SDEFUN |DFLOAT;differentiate;2$;68| ((|x| ($)) ($ ($))) 0.0) 

(SDEFUN |DFLOAT;besselI;3$;69| ((|x| ($)) (|y| ($)) ($ ($)))
        (SPADCALL |x| |y| (QREFELT $ 95))) 

(SDEFUN |DFLOAT;besselJ;3$;70| ((|x| ($)) (|y| ($)) ($ ($)))
        (SPADCALL |x| |y| (QREFELT $ 97))) 

(SDEFUN |DFLOAT;besselK;3$;71| ((|x| ($)) (|y| ($)) ($ ($)))
        (SPADCALL |x| |y| (QREFELT $ 99))) 

(SDEFUN |DFLOAT;besselY;3$;72| ((|x| ($)) (|y| ($)) ($ ($)))
        (SPADCALL |x| |y| (QREFELT $ 101))) 

(SDEFUN |DFLOAT;digamma;2$;73| ((|x| ($)) ($ ($)))
        (SPADCALL |x| (QREFELT $ 103))) 

(SDEFUN |DFLOAT;polygamma;3$;74| ((|x| ($)) (|y| ($)) ($ ($)))
        (SPROG ((#1=#:G519 NIL) (|n| (|Union| (|Integer|) "failed")))
               (SEQ (LETT |n| (SPADCALL |x| (QREFELT $ 106)))
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
                          |y| (QREFELT $ 108)))
                        (#2='T
                         (|error|
                          #3="polygamma: first argument should be a nonnegative integer"))))
                      (#2# (|error| #3#))))))) 

(SDEFUN |DFLOAT;Beta;3$;75| ((|x| ($)) (|y| ($)) ($ ($)))
        (SPADCALL |x| |y| (QREFELT $ 111))) 

(SDEFUN |DFLOAT;Gamma;2$;76| ((|x| ($)) ($ ($))) (SPADCALL |x| (QREFELT $ 113))) 

(SDEFUN |DFLOAT;airyAi;2$;77| ((|x| ($)) ($ ($)))
        (SPADCALL |x| (QREFELT $ 115))) 

(SDEFUN |DFLOAT;airyAiPrime;2$;78| ((|x| ($)) ($ ($)))
        (SPADCALL |x| (QREFELT $ 117))) 

(SDEFUN |DFLOAT;airyBi;2$;79| ((|x| ($)) ($ ($)))
        (SPADCALL |x| (QREFELT $ 119))) 

(SDEFUN |DFLOAT;airyBiPrime;2$;80| ((|x| ($)) ($ ($)))
        (SPADCALL |x| (QREFELT $ 121))) 

(SDEFUN |DFLOAT;lambertW;2$;81| ((|x| ($)) ($ ($)))
        (SPADCALL |x| (QREFELT $ 124))) 

(SDEFUN |DFLOAT;ellipticF;3$;82| ((|x| ($)) (|y| ($)) ($ ($)))
        (SPADCALL |x| |y| (QREFELT $ 127))) 

(SDEFUN |DFLOAT;ellipticK;2$;83| ((|x| ($)) ($ ($)))
        (SPADCALL |x| (QREFELT $ 129))) 

(SDEFUN |DFLOAT;ellipticE;3$;84| ((|x| ($)) (|y| ($)) ($ ($)))
        (SPADCALL |x| |y| (QREFELT $ 131))) 

(SDEFUN |DFLOAT;ellipticE;2$;85| ((|x| ($)) ($ ($)))
        (SPADCALL |x| (QREFELT $ 133))) 

(SDEFUN |DFLOAT;ellipticPi;4$;86| ((|x| ($)) (|y| ($)) (|z| ($)) ($ ($)))
        (SPADCALL |x| |y| |z| (QREFELT $ 135))) 

(SDEFUN |DFLOAT;jacobiSn;3$;87| ((|x| ($)) (|y| ($)) ($ ($)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 138)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 139))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 140))
                                       (SPADCALL |y| (QREFELT $ 140))
                                       (QREFELT $ 142))
                             (QREFELT $ 143))))
                      (SPADCALL |obits| (QREFELT $ 139))))))) 

(SDEFUN |DFLOAT;jacobiCn;3$;88| ((|x| ($)) (|y| ($)) ($ ($)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 138)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 139))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 140))
                                       (SPADCALL |y| (QREFELT $ 140))
                                       (QREFELT $ 145))
                             (QREFELT $ 143))))
                      (SPADCALL |obits| (QREFELT $ 139))))))) 

(SDEFUN |DFLOAT;jacobiDn;3$;89| ((|x| ($)) (|y| ($)) ($ ($)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 138)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 139))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 140))
                                       (SPADCALL |y| (QREFELT $ 140))
                                       (QREFELT $ 147))
                             (QREFELT $ 143))))
                      (SPADCALL |obits| (QREFELT $ 139))))))) 

(SDEFUN |DFLOAT;weierstrassP;4$;90| ((|x| ($)) (|y| ($)) (|z| ($)) ($ ($)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 138)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 139))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 140))
                                       (SPADCALL |y| (QREFELT $ 140))
                                       (SPADCALL |z| (QREFELT $ 140))
                                       (QREFELT $ 149))
                             (QREFELT $ 143))))
                      (SPADCALL |obits| (QREFELT $ 139))))))) 

(SDEFUN |DFLOAT;weierstrassPPrime;4$;91|
        ((|x| ($)) (|y| ($)) (|z| ($)) ($ ($)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT $ 138)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT $ 139))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 140))
                                       (SPADCALL |y| (QREFELT $ 140))
                                       (SPADCALL |z| (QREFELT $ 140))
                                       (QREFELT $ 151))
                             (QREFELT $ 143))))
                      (SPADCALL |obits| (QREFELT $ 139))))))) 

(PUT '|DFLOAT;wholePart;$I;92| '|SPADreplace| 'TRUNCATE) 

(SDEFUN |DFLOAT;wholePart;$I;92| ((|x| ($)) ($ (|Integer|))) (TRUNCATE |x|)) 

(SDEFUN |DFLOAT;float;2IPi$;93|
        ((|ma| #1=(|Integer|)) (|ex| #1#) (|b| (|PositiveInteger|)) ($ ($)))
        (|mul_DF_I| (|expt_DF_I| (FLOAT |b| MOST-POSITIVE-DOUBLE-FLOAT) |ex|)
                    |ma|)) 

(PUT '|DFLOAT;convert;2$;94| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DFLOAT;convert;2$;94| ((|x| ($)) ($ (|DoubleFloat|))) |x|) 

(SDEFUN |DFLOAT;convert;$F;95| ((|x| ($)) ($ (|Float|)))
        (SPADCALL |x| (QREFELT $ 140))) 

(SDEFUN |DFLOAT;rationalApproximation;$NniF;96|
        ((|x| ($)) (|d| (|NonNegativeInteger|)) ($ (|Fraction| (|Integer|))))
        (SPADCALL |x| |d| 10 (QREFELT $ 158))) 

(SDEFUN |DFLOAT;atan;3$;97| ((|x| ($)) (|y| ($)) ($ ($)))
        (SPROG ((|theta| ($)))
               (SEQ
                (COND
                 ((|eql_DF| |x| 0.0)
                  (COND
                   ((SPADCALL |y| 0.0 (QREFELT $ 160))
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

(SDEFUN |DFLOAT;retract;$F;98| ((|x| ($)) ($ (|Fraction| (|Integer|))))
        (SPROG ((#1=#:G556 NIL))
               (SPADCALL |x|
                         (PROG1 (LETT #1# (- (SPADCALL (QREFELT $ 22)) 1))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         (SPADCALL (QREFELT $ 18)) (QREFELT $ 158)))) 

(SDEFUN |DFLOAT;retractIfCan;$U;99|
        ((|x| ($)) ($ (|Union| (|Fraction| (|Integer|)) "failed")))
        (SPROG ((#1=#:G561 NIL))
               (CONS 0
                     (SPADCALL |x|
                               (PROG1
                                   (LETT #1# (- (SPADCALL (QREFELT $ 22)) 1))
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               (SPADCALL (QREFELT $ 18)) (QREFELT $ 158))))) 

(SDEFUN |DFLOAT;retract;$I;100| ((|x| ($)) ($ (|Integer|)))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (TRUNCATE |x|))
                    (EXIT
                     (COND
                      ((|eql_DF| |x| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT))
                       |n|)
                      ('T (|error| "Not an integer"))))))) 

(SDEFUN |DFLOAT;retractIfCan;$U;101|
        ((|x| ($)) ($ (|Union| (|Integer|) "failed")))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (TRUNCATE |x|))
                    (EXIT
                     (COND
                      ((|eql_DF| |x| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT))
                       (CONS 0 |n|))
                      ('T (CONS 1 "failed"))))))) 

(SDEFUN |DFLOAT;sign;$I;102| ((|x| ($)) ($ (|Integer|)))
        (SPADCALL (FLOAT-SIGN |x| 1.0) (QREFELT $ 165))) 

(PUT '|DFLOAT;abs;2$;103| '|SPADreplace| '|abs_DF|) 

(SDEFUN |DFLOAT;abs;2$;103| ((|x| ($)) ($ ($))) (|abs_DF| |x|)) 

(PUT '|DFLOAT;conjugate;2$;104| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DFLOAT;conjugate;2$;104| ((|x| ($)) ($ ($))) |x|) 

(SDEFUN |DFLOAT;manexp|
        ((|x| ($))
         ($ (|Record| (|:| MANTISSA (|Integer|)) (|:| EXPONENT (|Integer|)))))
        (SPROG
         ((|two53| (|PositiveInteger|))
          (|me| (|Record| (|:| |man| $) (|:| |exp| (|Integer|))))
          (#1=#:G581 NIL) (|s| (|Integer|)))
         (SEQ
          (EXIT
           (COND ((|zero?_DF| |x|) (CONS 0 0))
                 ('T
                  (SEQ (LETT |s| (SPADCALL |x| (QREFELT $ 167)))
                       (LETT |x| (|abs_DF| |x|))
                       (COND
                        ((SPADCALL |x| MOST-POSITIVE-DOUBLE-FLOAT
                                   (QREFELT $ 160))
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
                          (GO #2=#:G580))))
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

(SDEFUN |DFLOAT;rationalApproximation;$2NniF;106|
        ((|f| ($)) (|d| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         ($ (|Fraction| (|Integer|))))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|#G147| #3=(|Integer|))
          (|#G146| #1#) (|q1| #4=(|Integer|)) (|q0| (|Integer|))
          (|#G145| #5=(|Integer|)) (|#G144| #4#) (|p1| #6=(|Integer|))
          (|p0| (|Integer|)) (|#G143| #5#) (|#G142| #6#) (#7=#:G615 NIL)
          (|q2| #5#) (|p2| #5#) (|r| #3#) (|q| #8=(|Integer|))
          (|#G141| (|Record| (|:| |quotient| #8#) (|:| |remainder| #3#)))
          (|tol| (|NonNegativeInteger|)) (|de| #1#) (#9=#:G605 NIL)
          (#10=#:G603 NIL) (BASE (|PositiveInteger|)) (|ex| #11=(|Integer|))
          (|nu| #2#)
          (|#G140| (|Record| (|:| MANTISSA #2#) (|:| EXPONENT #11#))))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G140| (|DFLOAT;manexp| |f| $))
             (LETT |nu| (QCAR |#G140|))
             (LETT |ex| (QCDR |#G140|))
             |#G140|)
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
                (QREFELT $ 170)))
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
                                     (LETT |#G141| (DIVIDE2 |s| |t|))
                                     (LETT |q| (QCAR |#G141|))
                                     (LETT |r| (QCDR |#G141|))
                                     |#G141|)
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
                                                        (QREFELT $ 171)))
                                        (GO #13=#:G614)))))
                                    (PROGN
                                     (LETT |#G142| |p1|)
                                     (LETT |#G143| |p2|)
                                     (LETT |p0| |#G142|)
                                     (LETT |p1| |#G143|))
                                    (PROGN
                                     (LETT |#G144| |q1|)
                                     (LETT |#G145| |q2|)
                                     (LETT |q0| |#G144|)
                                     (LETT |q1| |#G145|))
                                    (EXIT
                                     (PROGN
                                      (LETT |#G146| |t|)
                                      (LETT |#G147| |r|)
                                      (LETT |s| |#G146|)
                                      (LETT |t| |#G147|))))
                                   NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #13# (EXIT #7#)))) 

(SDEFUN |DFLOAT;^;$F$;107| ((|x| ($)) (|r| (|Fraction| (|Integer|))) ($ ($)))
        (SPROG ((#1=#:G625 NIL) (|d| (|Integer|)) (|n| (|Integer|)))
               (SEQ
                (EXIT
                 (COND
                  ((|zero?_DF| |x|)
                   (COND ((SPADCALL |r| (QREFELT $ 172)) 1.0)
                         ((SPADCALL |r| (QREFELT $ 173))
                          (|error| "division by 0"))
                         (#2='T 0.0)))
                  ((OR (SPADCALL |r| (QREFELT $ 172)) (|eql_DF| |x| 1.0)) 1.0)
                  ('T
                   (COND
                    ((SPADCALL |r| (|spadConstant| $ 174) (QREFELT $ 175)) |x|)
                    (#2#
                     (SEQ (LETT |n| (SPADCALL |r| (QREFELT $ 176)))
                          (LETT |d| (SPADCALL |r| (QREFELT $ 177)))
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
                                                   (QREFELT $ 178))))
                                  (GO #3=#:G624)))
                                (#2#
                                 (PROGN
                                  (LETT #1#
                                        (SPADCALL (|minus_DF| |x|) |r|
                                                  (QREFELT $ 178)))
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
         (PROG (#1=#:G639)
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
          (LETT $ (GETREFV 193))
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
              (|DoubleFloatSpecialFunctions|) (43 . |besselI|)
              |DFLOAT;besselI;3$;69| (49 . |besselJ|) |DFLOAT;besselJ;3$;70|
              (55 . |besselK|) |DFLOAT;besselK;3$;71| (61 . |besselY|)
              |DFLOAT;besselY;3$;72| (67 . |digamma|) |DFLOAT;digamma;2$;73|
              (|Union| 19 '"failed") (72 . |retractIfCan|)
              (|NonNegativeInteger|) (77 . |polygamma|)
              |DFLOAT;polygamma;3$;74| (|DoubleFloatSpecialFunctions2|)
              (83 . |Beta|) |DFLOAT;Beta;3$;75| (89 . |Gamma|)
              |DFLOAT;Gamma;2$;76| (94 . |airyAi|) |DFLOAT;airyAi;2$;77|
              (99 . |airyAiPrime|) |DFLOAT;airyAiPrime;2$;78| (104 . |airyBi|)
              |DFLOAT;airyBi;2$;79| (109 . |airyBiPrime|)
              |DFLOAT;airyBiPrime;2$;80| (|FloatSpecialFunctions|)
              (114 . |lambertW|) |DFLOAT;lambertW;2$;81|
              (|DoubleFloatEllipticIntegrals|) (119 . |ellipticF|)
              |DFLOAT;ellipticF;3$;82| (125 . |ellipticK|)
              |DFLOAT;ellipticK;2$;83| (130 . |ellipticE|)
              |DFLOAT;ellipticE;3$;84| (136 . |ellipticE|)
              |DFLOAT;ellipticE;2$;85| (141 . |ellipticPi|)
              |DFLOAT;ellipticPi;4$;86| (|Float|) (148 . |bits|) (152 . |bits|)
              (157 . |convert|) (|FloatEllipticFunctions|) (162 . |jacobiSn|)
              (168 . |convert|) |DFLOAT;jacobiSn;3$;87| (173 . |jacobiCn|)
              |DFLOAT;jacobiCn;3$;88| (179 . |jacobiDn|)
              |DFLOAT;jacobiDn;3$;89| (185 . |weierstrassP|)
              |DFLOAT;weierstrassP;4$;90| (192 . |weierstrassPPrime|)
              |DFLOAT;weierstrassPPrime;4$;91| |DFLOAT;wholePart;$I;92|
              |DFLOAT;float;2IPi$;93| |DFLOAT;convert;2$;94|
              |DFLOAT;convert;$F;95| (|Fraction| 19)
              |DFLOAT;rationalApproximation;$2NniF;106|
              |DFLOAT;rationalApproximation;$NniF;96| (199 . >)
              |DFLOAT;atan;3$;97| |DFLOAT;retract;$F;98|
              (|Union| 157 '"failed") |DFLOAT;retractIfCan;$U;99|
              |DFLOAT;retract;$I;100| |DFLOAT;retractIfCan;$U;101|
              |DFLOAT;sign;$I;102| |DFLOAT;abs;2$;103|
              |DFLOAT;conjugate;2$;104| (205 . |coerce|) (210 . /)
              (216 . |zero?|) (221 . |negative?|) (226 . |One|) (230 . =)
              (236 . |numer|) (241 . |denom|) |DFLOAT;^;$F$;107| (|List| $)
              (|PatternMatchResult| 137 $) (|Pattern| 137) (|Factored| $)
              (|Union| 179 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 184 '#1#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |coef| 179) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|SingleInteger|))
           '#(~= 246 |zero?| 252 |wholePart| 257 |whittakerW| 262 |whittakerM|
              269 |weierstrassZeta| 276 |weierstrassSigma| 283
              |weierstrassPPrime| 290 |weierstrassPInverse| 297 |weierstrassP|
              304 |weberE| 311 |unitNormal| 317 |unitCanonical| 322 |unit?| 327
              |truncate| 332 |toString| 337 |tanh| 348 |tan| 353
              |subtractIfCan| 358 |struveL| 364 |struveH| 370 |squareFreePart|
              376 |squareFree| 381 |sqrt| 386 |smaller?| 391 |sizeLess?| 397
              |sinh| 403 |sin| 408 |sign| 413 |sech| 418 |sec| 423 |sample| 428
              |round| 432 |rightRecip| 437 |rightPower| 442 |riemannZeta| 454
              |retractIfCan| 459 |retract| 469 |rem| 479 |recip| 485
              |rationalApproximation| 490 |quo| 503 |qsqrt| 509 |qlog| 514
              |principalIdeal| 519 |prime?| 524 |precision| 529 |positive?| 538
              |polylog| 543 |polygamma| 549 |pi| 555 |patternMatch| 559 |order|
              566 |opposite?| 571 |one?| 577 |nthRoot| 582 |norm| 588
              |negative?| 593 |multiEuclidean| 598 |min| 604 |meixnerM| 614
              |meijerG| 622 |max| 631 |mantissa| 641 |lommelS2| 646 |lommelS1|
              653 |log2| 660 |log10| 665 |log| 670 |lerchPhi| 675 |legendreQ|
              682 |legendreP| 689 |leftRecip| 696 |leftPower| 701 |lcmCoef| 713
              |lcm| 719 |latex| 730 |lambertW| 735 |laguerreL| 740 |kummerU|
              747 |kummerM| 754 |kelvinKer| 761 |kelvinKei| 767 |kelvinBer| 773
              |kelvinBei| 779 |jacobiZeta| 785 |jacobiTheta| 791 |jacobiSn| 797
              |jacobiP| 803 |jacobiDn| 811 |jacobiCn| 817 |inv| 823
              |increasePrecision| 828 |hypergeometricF| 833 |hermiteH| 840
              |hashUpdate!| 846 |hash| 852 |hankelH2| 857 |hankelH1| 863
              |gcdPolynomial| 869 |gcd| 875 |fractionPart| 886 |floor| 891
              |float| 896 |factor| 909 |extendedEuclidean| 914 |exquo| 927
              |expressIdealMember| 933 |exponent| 939 |exp1| 944 |exp| 948
              |euclideanSize| 953 |ellipticPi| 958 |ellipticK| 965 |ellipticF|
              970 |ellipticE| 976 |doubleFloatFormat| 987 |divide| 992 |digits|
              998 |digamma| 1007 |differentiate| 1012 |decreasePrecision| 1023
              |csch| 1028 |csc| 1033 |coth| 1038 |cot| 1043 |cosh| 1048 |cos|
              1053 |convert| 1058 |conjugate| 1083 |commutator| 1088 |coerce|
              1094 |charlierC| 1114 |characteristic| 1121 |ceiling| 1125 |bits|
              1130 |besselY| 1139 |besselK| 1145 |besselJ| 1151 |besselI| 1157
              |base| 1163 |atanh| 1167 |atan| 1172 |associator| 1183
              |associates?| 1190 |asinh| 1196 |asin| 1201 |asech| 1206 |asec|
              1211 |antiCommutator| 1216 |annihilate?| 1222 |angerJ| 1228
              |airyBiPrime| 1234 |airyBi| 1239 |airyAiPrime| 1244 |airyAi| 1249
              |acsch| 1254 |acsc| 1259 |acoth| 1264 |acot| 1269 |acosh| 1274
              |acos| 1279 |abs| 1284 ^ 1289 |Zero| 1319 |One| 1323 |OMwrite|
              1327 |Gamma| 1351 D 1362 |Beta| 1373 >= 1379 > 1385 = 1391 <=
              1397 < 1403 / 1409 - 1421 + 1432 * 1438)
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
                 (|Algebra| 157) (|EntireRing|) (|Algebra| $$) (|Ring|) (|Rng|)
                 (|SemiRing|) (|Module| 157) (|Module| $$) (|SemiRng|)
                 (|OrderedAbelianGroup|) (|BiModule| 157 157)
                 (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| 157)
                 (|LeftModule| 157) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedSet|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|PatternMatchable| 137) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|TranscendentalFunctionCategory|)
                 (|RetractableTo| 157) (|RetractableTo| 19) (|RealConstant|)
                 (|CommutativeStar|) (|SetCategory|) (|ConvertibleTo| 39)
                 (|SpecialFunctionCategory|) (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|OpenMath|)
                 (|ConvertibleTo| 7) (|Approximate|) (|ConvertibleTo| 181)
                 (|RadicalCategory|) (|CoercibleFrom| 157) (|CoercibleFrom| 19)
                 (|ConvertibleTo| 137) (|ConvertibleTo| 12) (|PartialOrder|)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 35))
              (|makeByteWordVec2| 192
                                  '(1 10 9 0 11 2 10 9 0 12 13 1 10 9 0 14 2 0
                                    0 17 0 24 2 0 15 0 0 34 1 35 0 7 36 1 35 0
                                    0 38 1 39 0 12 40 2 94 12 12 12 95 2 94 12
                                    12 12 97 2 94 12 12 12 99 2 94 12 12 12 101
                                    1 94 12 12 103 1 12 105 0 106 2 94 12 107
                                    12 108 2 110 12 12 12 111 1 110 12 12 113 1
                                    110 12 12 115 1 110 12 12 117 1 110 12 12
                                    119 1 110 12 12 121 1 123 12 12 124 2 126
                                    12 12 12 127 1 126 12 12 129 2 126 12 12 12
                                    131 1 126 12 12 133 3 126 12 12 12 12 135 0
                                    137 17 138 1 137 17 17 139 1 137 0 12 140 2
                                    141 137 137 137 142 1 137 12 0 143 2 141
                                    137 137 137 145 2 141 137 137 137 147 3 141
                                    137 137 137 137 149 3 141 137 137 137 137
                                    151 2 0 15 0 0 160 1 157 0 19 170 2 157 0
                                    19 19 171 1 157 15 0 172 1 157 15 0 173 0
                                    157 0 174 2 157 15 0 0 175 1 157 19 0 176 1
                                    157 19 0 177 2 0 15 0 0 1 1 0 15 0 88 1 0
                                    19 0 153 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0
                                    0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 152 3 0 0
                                    0 0 0 1 3 0 0 0 0 0 150 2 0 0 0 0 1 1 0 191
                                    0 1 1 0 0 0 1 1 0 15 0 1 1 0 0 0 1 2 0 7 0
                                    107 1 1 0 7 0 1 1 0 0 0 76 1 0 0 0 63 2 0
                                    91 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1
                                    1 0 182 0 1 1 0 0 0 52 2 0 15 0 0 1 2 0 15
                                    0 0 1 1 0 0 0 74 1 0 0 0 61 1 0 19 0 167 1
                                    0 0 0 79 1 0 0 0 65 0 0 0 1 1 0 0 0 1 1 0
                                    91 0 1 2 0 0 0 107 1 2 0 0 0 17 1 1 0 0 0 1
                                    1 0 163 0 164 1 0 105 0 166 1 0 157 0 162 1
                                    0 19 0 165 2 0 0 0 0 1 1 0 91 0 92 3 0 157
                                    0 107 107 158 2 0 157 0 107 159 2 0 0 0 0 1
                                    1 0 0 0 53 1 0 0 0 60 1 0 189 179 1 1 0 15
                                    0 1 1 1 17 17 1 0 0 17 22 1 0 15 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 109 0 0 0 32 3 0 180 0 181
                                    180 1 1 0 19 0 28 2 0 15 0 0 1 1 0 15 0 1 2
                                    0 0 0 19 1 1 0 0 0 1 1 0 15 0 87 2 0 183
                                    179 0 1 0 2 0 27 2 0 0 0 0 49 4 0 0 0 0 0 0
                                    1 5 3 0 179 179 179 179 0 1 0 2 0 26 2 0 0
                                    0 0 48 1 0 19 0 20 3 0 0 0 0 0 1 3 0 0 0 0
                                    0 1 1 0 0 0 23 1 0 0 0 54 1 0 0 0 59 3 0 0
                                    0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0 91
                                    0 1 2 0 0 0 107 1 2 0 0 0 17 1 2 0 190 0 0
                                    1 2 0 0 0 0 1 1 0 0 179 1 1 0 7 0 1 1 0 0 0
                                    125 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 144
                                    4 0 0 0 0 0 0 1 2 0 0 0 0 148 2 0 0 0 0 146
                                    1 0 0 0 1 1 1 17 19 1 3 3 0 179 179 0 1 2 0
                                    0 0 0 1 2 0 89 89 0 90 1 0 192 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 2 0 188 188 188 1 2 0 0 0 0
                                    1 1 0 0 179 1 1 0 0 0 1 1 0 0 0 1 2 0 0 19
                                    19 1 3 0 0 19 19 17 154 1 0 182 0 1 3 0 185
                                    0 0 0 1 2 0 186 0 0 1 2 0 91 0 0 1 2 0 183
                                    179 0 1 1 0 19 0 21 0 0 0 31 1 0 0 0 58 1 0
                                    107 0 1 3 0 0 0 0 0 136 1 0 0 0 130 2 0 0 0
                                    0 128 2 0 0 0 0 132 1 0 0 0 134 1 0 7 7 8 2
                                    0 187 0 0 1 1 1 17 17 1 0 0 17 1 1 0 0 0
                                    104 1 0 0 0 93 2 0 0 0 107 1 1 1 17 19 1 1
                                    0 0 0 77 1 0 0 0 66 1 0 0 0 78 1 0 0 0 64 1
                                    0 0 0 75 1 0 0 0 62 1 0 39 0 41 1 0 7 0 33
                                    1 0 181 0 1 1 0 12 0 155 1 0 137 0 156 1 0
                                    0 0 169 2 0 0 0 0 1 1 0 0 157 1 1 0 0 19 57
                                    1 0 0 0 1 1 0 35 0 37 3 0 0 0 0 0 1 0 0 107
                                    1 1 0 0 0 1 1 1 17 17 1 0 0 17 25 2 0 0 0 0
                                    102 2 0 0 0 0 100 2 0 0 0 0 98 2 0 0 0 0 96
                                    0 0 17 18 1 0 0 0 82 2 0 0 0 0 161 1 0 0 0
                                    69 3 0 0 0 0 0 1 2 0 15 0 0 1 1 0 0 0 80 1
                                    0 0 0 67 1 0 0 0 85 1 0 0 0 73 2 0 0 0 0 1
                                    2 0 15 0 0 1 2 0 0 0 0 1 1 0 0 0 122 1 0 0
                                    0 120 1 0 0 0 118 1 0 0 0 116 1 0 0 0 83 1
                                    0 0 0 70 1 0 0 0 84 1 0 0 0 72 1 0 0 0 81 1
                                    0 0 0 68 1 0 0 0 168 2 0 0 0 0 56 2 0 0 0
                                    157 178 2 0 0 0 19 55 2 0 0 0 107 1 2 0 0 0
                                    17 1 0 0 0 29 0 0 0 30 3 0 9 10 0 15 16 2 0
                                    9 10 0 1 1 0 7 0 1 2 0 7 0 15 1 2 0 0 0 0 1
                                    1 0 0 0 114 1 0 0 0 1 2 0 0 0 107 1 2 0 0 0
                                    0 112 2 0 15 0 0 34 2 0 15 0 0 160 2 0 15 0
                                    0 50 2 0 15 0 0 1 2 0 15 0 0 42 2 0 0 0 19
                                    51 2 0 0 0 0 86 2 0 0 0 0 45 1 0 0 0 43 2 0
                                    0 0 0 44 2 0 0 0 157 1 2 0 0 157 0 1 2 0 0
                                    107 0 1 2 0 0 19 0 47 2 0 0 0 0 46 2 0 0 17
                                    0 24)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloat| 'NILADIC T) 
