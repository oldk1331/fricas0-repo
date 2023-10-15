
(SDEFUN |DFLOAT;doubleFloatFormat;2S;1| ((|s| |String|) ($ |String|))
        (SPROG ((|ss| (|String|)))
               (SEQ (LETT |ss| (QREFELT $ 6) |DFLOAT;doubleFloatFormat;2S;1|)
                    (SETELT $ 6 |s|) (EXIT |ss|)))) 

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
        (SPROG ((#1=#:G429 NIL))
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
                                      (QREFELT $ 24)))
                           |DFLOAT;bits;Pi;8|)
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

(SDEFUN |DFLOAT;coerce;$Of;16| ((|x| $) ($ |OutputForm|))
        (COND
         ((SPADCALL |x| 0.0 (QREFELT $ 33))
          (SPADCALL (FORMAT NIL (QREFELT $ 6) |x|) (QREFELT $ 35)))
         ('T
          (SPADCALL
           (SPADCALL (FORMAT NIL (QREFELT $ 6) (|minus_DF| |x|))
                     (QREFELT $ 35))
           (QREFELT $ 36))))) 

(SDEFUN |DFLOAT;convert;$If;17| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 39))) 

(PUT '|DFLOAT;<;2$B;18| '|SPADreplace| '|less_DF|) 

(SDEFUN |DFLOAT;<;2$B;18| ((|x| $) (|y| $) ($ |Boolean|)) (|less_DF| |x| |y|)) 

(PUT '|DFLOAT;-;2$;19| '|SPADreplace| '|minus_DF|) 

(SDEFUN |DFLOAT;-;2$;19| ((|x| $) ($ $)) (|minus_DF| |x|)) 

(PUT '|DFLOAT;+;3$;20| '|SPADreplace| '|add_DF|) 

(SDEFUN |DFLOAT;+;3$;20| ((|x| $) (|y| $) ($ $)) (|add_DF| |x| |y|)) 

(PUT '|DFLOAT;-;3$;21| '|SPADreplace| '|sub_DF|) 

(SDEFUN |DFLOAT;-;3$;21| ((|x| $) (|y| $) ($ $)) (|sub_DF| |x| |y|)) 

(PUT '|DFLOAT;*;3$;22| '|SPADreplace| '|mul_DF|) 

(SDEFUN |DFLOAT;*;3$;22| ((|x| $) (|y| $) ($ $)) (|mul_DF| |x| |y|)) 

(PUT '|DFLOAT;*;I2$;23| '|SPADreplace| '(XLAM (|i| |x|) (|mul_DF_I| |x| |i|))) 

(SDEFUN |DFLOAT;*;I2$;23| ((|i| |Integer|) (|x| $) ($ $)) (|mul_DF_I| |x| |i|)) 

(PUT '|DFLOAT;max;3$;24| '|SPADreplace| '|max_DF|) 

(SDEFUN |DFLOAT;max;3$;24| ((|x| $) (|y| $) ($ $)) (|max_DF| |x| |y|)) 

(PUT '|DFLOAT;min;3$;25| '|SPADreplace| '|min_DF|) 

(SDEFUN |DFLOAT;min;3$;25| ((|x| $) (|y| $) ($ $)) (|min_DF| |x| |y|)) 

(PUT '|DFLOAT;=;2$B;26| '|SPADreplace| '|eql_DF|) 

(SDEFUN |DFLOAT;=;2$B;26| ((|x| $) (|y| $) ($ |Boolean|)) (|eql_DF| |x| |y|)) 

(PUT '|DFLOAT;/;$I$;27| '|SPADreplace| '|div_DF_I|) 

(SDEFUN |DFLOAT;/;$I$;27| ((|x| $) (|i| |Integer|) ($ $)) (|div_DF_I| |x| |i|)) 

(SDEFUN |DFLOAT;sqrt;2$;28| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (|sqrt_DF| |x|) $)) 

(PUT '|DFLOAT;qsqrt;2$;29| '|SPADreplace| '|qsqrt_DF|) 

(SDEFUN |DFLOAT;qsqrt;2$;29| ((|x| $) ($ $)) (|qsqrt_DF| |x|)) 

(SDEFUN |DFLOAT;log10;2$;30| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (LOG10 |x|) $)) 

(PUT '|DFLOAT;^;$I$;31| '|SPADreplace| '|expt_DF_I|) 

(SDEFUN |DFLOAT;^;$I$;31| ((|x| $) (|i| |Integer|) ($ $)) (|expt_DF_I| |x| |i|)) 

(SDEFUN |DFLOAT;^;3$;32| ((|x| $) (|y| $) ($ $))
        (|DFLOAT;checkComplex| (|expt_DF| |x| |y|) $)) 

(PUT '|DFLOAT;coerce;I$;33| '|SPADreplace|
     '(XLAM (|i|) (FLOAT |i| MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |DFLOAT;coerce;I$;33| ((|i| |Integer|) ($ $))
        (FLOAT |i| MOST-POSITIVE-DOUBLE-FLOAT)) 

(PUT '|DFLOAT;exp;2$;34| '|SPADreplace| '|exp_DF|) 

(SDEFUN |DFLOAT;exp;2$;34| ((|x| $) ($ $)) (|exp_DF| |x|)) 

(SDEFUN |DFLOAT;log;2$;35| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (|log_DF| |x|) $)) 

(PUT '|DFLOAT;qlog;2$;36| '|SPADreplace| '|qlog_DF|) 

(SDEFUN |DFLOAT;qlog;2$;36| ((|x| $) ($ $)) (|qlog_DF| |x|)) 

(SDEFUN |DFLOAT;log2;2$;37| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (LOG2 |x|) $)) 

(PUT '|DFLOAT;sin;2$;38| '|SPADreplace| '|sin_DF|) 

(SDEFUN |DFLOAT;sin;2$;38| ((|x| $) ($ $)) (|sin_DF| |x|)) 

(PUT '|DFLOAT;cos;2$;39| '|SPADreplace| '|cos_DF|) 

(SDEFUN |DFLOAT;cos;2$;39| ((|x| $) ($ $)) (|cos_DF| |x|)) 

(PUT '|DFLOAT;tan;2$;40| '|SPADreplace| '|tan_DF|) 

(SDEFUN |DFLOAT;tan;2$;40| ((|x| $) ($ $)) (|tan_DF| |x|)) 

(PUT '|DFLOAT;cot;2$;41| '|SPADreplace| 'COT) 

(SDEFUN |DFLOAT;cot;2$;41| ((|x| $) ($ $)) (COT |x|)) 

(SDEFUN |DFLOAT;sec;2$;42| ((|x| $) ($ $)) (|div_DF| 1.0 (|cos_DF| |x|))) 

(SDEFUN |DFLOAT;csc;2$;43| ((|x| $) ($ $)) (|div_DF| 1.0 (|sin_DF| |x|))) 

(SDEFUN |DFLOAT;asin;2$;44| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (ASIN |x|) $)) 

(SDEFUN |DFLOAT;acos;2$;45| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (ACOS |x|) $)) 

(PUT '|DFLOAT;atan;2$;46| '|SPADreplace| '|atan_DF|) 

(SDEFUN |DFLOAT;atan;2$;46| ((|x| $) ($ $)) (|atan_DF| |x|)) 

(SDEFUN |DFLOAT;acsc;2$;47| ((|x| $) ($ $))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 66))) 

(SDEFUN |DFLOAT;acot;2$;48| ((|x| $) ($ $))
        (COND
         ((|less_DF| 0.0 |x|)
          (COND ((|less_DF| |x| 1.0) (|sub_DF| (QREFELT $ 70) (|atan_DF| |x|)))
                ('T (|atan_DF| (|div_DF| 1.0 |x|)))))
         ((NULL (|less_DF| (|minus_DF| 1.0) |x|))
          (|sub_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                    (|atan_DF| (|minus_DF| (|div_DF| 1.0 |x|)))))
         ('T (|add_DF| (QREFELT $ 70) (|atan_DF| (|minus_DF| |x|)))))) 

(SDEFUN |DFLOAT;asec;2$;49| ((|x| $) ($ $))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 67))) 

(PUT '|DFLOAT;sinh;2$;50| '|SPADreplace| '|sinh_DF|) 

(SDEFUN |DFLOAT;sinh;2$;50| ((|x| $) ($ $)) (|sinh_DF| |x|)) 

(PUT '|DFLOAT;cosh;2$;51| '|SPADreplace| '|cosh_DF|) 

(SDEFUN |DFLOAT;cosh;2$;51| ((|x| $) ($ $)) (|cosh_DF| |x|)) 

(PUT '|DFLOAT;tanh;2$;52| '|SPADreplace| '|tanh_DF|) 

(SDEFUN |DFLOAT;tanh;2$;52| ((|x| $) ($ $)) (|tanh_DF| |x|)) 

(SDEFUN |DFLOAT;csch;2$;53| ((|x| $) ($ $)) (|div_DF| 1.0 (|sinh_DF| |x|))) 

(SDEFUN |DFLOAT;coth;2$;54| ((|x| $) ($ $)) (|div_DF| 1.0 (|tanh_DF| |x|))) 

(SDEFUN |DFLOAT;sech;2$;55| ((|x| $) ($ $)) (|div_DF| 1.0 (|cosh_DF| |x|))) 

(PUT '|DFLOAT;asinh;2$;56| '|SPADreplace| 'ASINH) 

(SDEFUN |DFLOAT;asinh;2$;56| ((|x| $) ($ $)) (ASINH |x|)) 

(SDEFUN |DFLOAT;acosh;2$;57| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (ACOSH |x|) $)) 

(SDEFUN |DFLOAT;atanh;2$;58| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (ATANH |x|) $)) 

(SDEFUN |DFLOAT;acsch;2$;59| ((|x| $) ($ $)) (ASINH (|div_DF| 1.0 |x|))) 

(SDEFUN |DFLOAT;acoth;2$;60| ((|x| $) ($ $))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 81))) 

(SDEFUN |DFLOAT;asech;2$;61| ((|x| $) ($ $))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 80))) 

(PUT '|DFLOAT;/;3$;62| '|SPADreplace| '|div_DF|) 

(SDEFUN |DFLOAT;/;3$;62| ((|x| $) (|y| $) ($ $)) (|div_DF| |x| |y|)) 

(PUT '|DFLOAT;negative?;$B;63| '|SPADreplace| '|negative?_DF|) 

(SDEFUN |DFLOAT;negative?;$B;63| ((|x| $) ($ |Boolean|)) (|negative?_DF| |x|)) 

(PUT '|DFLOAT;zero?;$B;64| '|SPADreplace| '|zero?_DF|) 

(SDEFUN |DFLOAT;zero?;$B;64| ((|x| $) ($ |Boolean|)) (|zero?_DF| |x|)) 

(SDEFUN |DFLOAT;hashUpdate!;Hs$Hs;65|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(SDEFUN |DFLOAT;recip;$U;66| ((|x| $) ($ |Union| $ "failed"))
        (COND ((|zero?_DF| |x|) (CONS 1 "failed"))
              ('T (CONS 0 (|div_DF| 1.0 |x|))))) 

(PUT '|DFLOAT;differentiate;2$;67| '|SPADreplace| '(XLAM (|x|) 0.0)) 

(SDEFUN |DFLOAT;differentiate;2$;67| ((|x| $) ($ $)) 0.0) 

(SDEFUN |DFLOAT;airyAi;2$;68| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 94))) 

(SDEFUN |DFLOAT;airyBi;2$;69| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 96))) 

(SDEFUN |DFLOAT;besselI;3$;70| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 98))) 

(SDEFUN |DFLOAT;besselJ;3$;71| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 100))) 

(SDEFUN |DFLOAT;besselK;3$;72| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 102))) 

(SDEFUN |DFLOAT;besselY;3$;73| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 104))) 

(SDEFUN |DFLOAT;Beta;3$;74| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 106))) 

(SDEFUN |DFLOAT;digamma;2$;75| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 108))) 

(SDEFUN |DFLOAT;Gamma;2$;76| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 110))) 

(SDEFUN |DFLOAT;polygamma;3$;77| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G515 NIL) (|n| (|Union| (|Integer|) "failed")))
               (SEQ
                (LETT |n| (SPADCALL |x| (QREFELT $ 113))
                      . #2=(|DFLOAT;polygamma;3$;77|))
                (EXIT
                 (COND
                  ((QEQCAR |n| 0)
                   (COND
                    ((>= (QCDR |n|) 0)
                     (SPADCALL
                      (PROG1 (LETT #1# (QCDR |n|) . #2#)
                        (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #1#))
                      |y| (QREFELT $ 115)))
                    (#3='T
                     (|error|
                      #4="polygamma: first argument should be a nonnegative integer"))))
                  (#3# (|error| #4#))))))) 

(SDEFUN |DFLOAT;lambertW;2$;78| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 118))) 

(SDEFUN |DFLOAT;ellipticF;3$;79| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 121))) 

(SDEFUN |DFLOAT;ellipticK;2$;80| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 123))) 

(SDEFUN |DFLOAT;ellipticE;3$;81| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 125))) 

(SDEFUN |DFLOAT;ellipticE;2$;82| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 127))) 

(SDEFUN |DFLOAT;ellipticPi;4$;83| ((|x| $) (|y| $) (|z| $) ($ $))
        (SPADCALL |x| |y| |z| (QREFELT $ 129))) 

(SDEFUN |DFLOAT;jacobiSn;3$;84| ((|x| $) (|y| $) ($ $))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ
                (LETT |obits| (SPADCALL (QREFELT $ 132))
                      |DFLOAT;jacobiSn;3$;84|)
                (EXIT
                 (|finally|
                  (SEQ (SPADCALL 68 (QREFELT $ 133))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT $ 134))
                                   (SPADCALL |y| (QREFELT $ 134))
                                   (QREFELT $ 136))
                         (QREFELT $ 137))))
                  (SPADCALL |obits| (QREFELT $ 133))))))) 

(SDEFUN |DFLOAT;jacobiCn;3$;85| ((|x| $) (|y| $) ($ $))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ
                (LETT |obits| (SPADCALL (QREFELT $ 132))
                      |DFLOAT;jacobiCn;3$;85|)
                (EXIT
                 (|finally|
                  (SEQ (SPADCALL 68 (QREFELT $ 133))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT $ 134))
                                   (SPADCALL |y| (QREFELT $ 134))
                                   (QREFELT $ 139))
                         (QREFELT $ 137))))
                  (SPADCALL |obits| (QREFELT $ 133))))))) 

(SDEFUN |DFLOAT;jacobiDn;3$;86| ((|x| $) (|y| $) ($ $))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ
                (LETT |obits| (SPADCALL (QREFELT $ 132))
                      |DFLOAT;jacobiDn;3$;86|)
                (EXIT
                 (|finally|
                  (SEQ (SPADCALL 68 (QREFELT $ 133))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT $ 134))
                                   (SPADCALL |y| (QREFELT $ 134))
                                   (QREFELT $ 141))
                         (QREFELT $ 137))))
                  (SPADCALL |obits| (QREFELT $ 133))))))) 

(SDEFUN |DFLOAT;weierstrassP;4$;87| ((|x| $) (|y| $) (|z| $) ($ $))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ
                (LETT |obits| (SPADCALL (QREFELT $ 132))
                      |DFLOAT;weierstrassP;4$;87|)
                (EXIT
                 (|finally|
                  (SEQ (SPADCALL 68 (QREFELT $ 133))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT $ 134))
                                   (SPADCALL |y| (QREFELT $ 134))
                                   (SPADCALL |z| (QREFELT $ 134))
                                   (QREFELT $ 143))
                         (QREFELT $ 137))))
                  (SPADCALL |obits| (QREFELT $ 133))))))) 

(SDEFUN |DFLOAT;weierstrassPPrime;4$;88| ((|x| $) (|y| $) (|z| $) ($ $))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ
                (LETT |obits| (SPADCALL (QREFELT $ 132))
                      |DFLOAT;weierstrassPPrime;4$;88|)
                (EXIT
                 (|finally|
                  (SEQ (SPADCALL 68 (QREFELT $ 133))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT $ 134))
                                   (SPADCALL |y| (QREFELT $ 134))
                                   (SPADCALL |z| (QREFELT $ 134))
                                   (QREFELT $ 145))
                         (QREFELT $ 137))))
                  (SPADCALL |obits| (QREFELT $ 133))))))) 

(PUT '|DFLOAT;wholePart;$I;89| '|SPADreplace| 'TRUNCATE) 

(SDEFUN |DFLOAT;wholePart;$I;89| ((|x| $) ($ |Integer|)) (TRUNCATE |x|)) 

(SDEFUN |DFLOAT;float;2IPi$;90|
        ((|ma| . #1=(|Integer|)) (|ex| . #1#) (|b| |PositiveInteger|) ($ $))
        (|mul_DF_I| (|expt_DF_I| (FLOAT |b| MOST-POSITIVE-DOUBLE-FLOAT) |ex|)
                    |ma|)) 

(PUT '|DFLOAT;convert;2$;91| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DFLOAT;convert;2$;91| ((|x| $) ($ |DoubleFloat|)) |x|) 

(SDEFUN |DFLOAT;convert;$F;92| ((|x| $) ($ |Float|))
        (SPADCALL |x| (QREFELT $ 134))) 

(SDEFUN |DFLOAT;rationalApproximation;$NniF;93|
        ((|x| $) (|d| |NonNegativeInteger|) ($ |Fraction| (|Integer|)))
        (SPADCALL |x| |d| 10 (QREFELT $ 152))) 

(SDEFUN |DFLOAT;atan;3$;94| ((|x| $) (|y| $) ($ $))
        (SPROG ((|theta| ($)))
               (SEQ
                (COND
                 ((|eql_DF| |x| 0.0)
                  (COND
                   ((SPADCALL |y| 0.0 (QREFELT $ 154))
                    (|div_DF_I| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) 2))
                   ((|less_DF| |y| 0.0)
                    (|minus_DF|
                     (|div_DF_I| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) 2)))
                   (#1='T 0.0)))
                 (#1#
                  (SEQ
                   (LETT |theta| (|atan_DF| (|abs_DF| (|div_DF| |y| |x|)))
                         . #2=(|DFLOAT;atan;3$;94|))
                   (COND
                    ((|less_DF| |x| 0.0)
                     (LETT |theta|
                           (|sub_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                                     |theta|)
                           . #2#)))
                   (COND
                    ((|less_DF| |y| 0.0)
                     (LETT |theta| (|minus_DF| |theta|) . #2#)))
                   (EXIT |theta|))))))) 

(SDEFUN |DFLOAT;retract;$F;95| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL |x| (SPADCALL (SPADCALL (QREFELT $ 22)) 1 (QREFELT $ 156))
                  (SPADCALL (QREFELT $ 18)) (QREFELT $ 152))) 

(SDEFUN |DFLOAT;retractIfCan;$U;96|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (CONS 0
              (SPADCALL |x|
                        (SPADCALL (SPADCALL (QREFELT $ 22)) 1 (QREFELT $ 156))
                        (SPADCALL (QREFELT $ 18)) (QREFELT $ 152)))) 

(SDEFUN |DFLOAT;retract;$I;97| ((|x| $) ($ |Integer|))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (TRUNCATE |x|) |DFLOAT;retract;$I;97|)
                    (EXIT
                     (COND
                      ((|eql_DF| |x| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT))
                       |n|)
                      ('T (|error| "Not an integer"))))))) 

(SDEFUN |DFLOAT;retractIfCan;$U;98| ((|x| $) ($ |Union| (|Integer|) "failed"))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (TRUNCATE |x|) |DFLOAT;retractIfCan;$U;98|)
                    (EXIT
                     (COND
                      ((|eql_DF| |x| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT))
                       (CONS 0 |n|))
                      ('T (CONS 1 "failed"))))))) 

(SDEFUN |DFLOAT;sign;$I;99| ((|x| $) ($ |Integer|))
        (SPADCALL (FLOAT-SIGN |x| 1.0) (QREFELT $ 160))) 

(PUT '|DFLOAT;abs;2$;100| '|SPADreplace| '|abs_DF|) 

(SDEFUN |DFLOAT;abs;2$;100| ((|x| $) ($ $)) (|abs_DF| |x|)) 

(SDEFUN |DFLOAT;manexp|
        ((|x| $)
         ($ |Record| (|:| MANTISSA (|Integer|)) (|:| EXPONENT (|Integer|))))
        (SPROG
         ((|two53| (|PositiveInteger|))
          (|me| (|Record| (|:| |man| $) (|:| |exp| (|Integer|))))
          (#1=#:G568 NIL) (|s| (|Integer|)))
         (SEQ
          (EXIT
           (COND ((|zero?_DF| |x|) (CONS 0 0))
                 ('T
                  (SEQ
                   (LETT |s| (SPADCALL |x| (QREFELT $ 162))
                         . #2=(|DFLOAT;manexp|))
                   (LETT |x| (|abs_DF| |x|) . #2#)
                   (COND
                    ((SPADCALL |x| MOST-POSITIVE-DOUBLE-FLOAT (QREFELT $ 154))
                     (PROGN
                      (LETT #1#
                            (CONS
                             (+
                              (* |s|
                                 (SPADCALL MOST-POSITIVE-DOUBLE-FLOAT
                                           (QREFELT $ 20)))
                              1)
                             (SPADCALL MOST-POSITIVE-DOUBLE-FLOAT
                                       (QREFELT $ 21)))
                            . #2#)
                      (GO #3=#:G567))))
                   (LETT |me| (MANEXP |x|) . #2#)
                   (LETT |two53|
                         (SPADCALL (SPADCALL (QREFELT $ 18))
                                   (SPADCALL (QREFELT $ 22)) (QREFELT $ 164))
                         . #2#)
                   (EXIT
                    (CONS
                     (* |s|
                        (TRUNCATE
                         (SPADCALL |two53| (QCAR |me|) (QREFELT $ 24))))
                     (- (QCDR |me|) (SPADCALL (QREFELT $ 22)))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |DFLOAT;rationalApproximation;$2NniF;102|
        ((|f| $) (|d| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Fraction| (|Integer|)))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|#G143| #3=(|Integer|))
          (|#G142| #1#) (|q1| #4=(|Integer|)) (|q0| (|Integer|))
          (|#G141| #5=(|Integer|)) (|#G140| #4#) (|p1| #6=(|Integer|))
          (|p0| (|Integer|)) (|#G139| #5#) (|#G138| #6#) (#7=#:G599 NIL)
          (|q2| #5#) (|p2| #5#) (|r| #3#) (|q| #8=(|Integer|))
          (|#G137| (|Record| (|:| |quotient| #8#) (|:| |remainder| #3#)))
          (|tol| (|NonNegativeInteger|)) (|de| #1#) (#9=#:G590 NIL)
          (#10=#:G588 NIL) (BASE (|PositiveInteger|)) (|ex| #11=(|Integer|))
          (|nu| #2#)
          (|#G136| (|Record| (|:| MANTISSA #2#) (|:| EXPONENT #11#))))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G136| (|DFLOAT;manexp| |f| $)
                   . #12=(|DFLOAT;rationalApproximation;$2NniF;102|))
             (LETT |nu| (QCAR |#G136|) . #12#)
             (LETT |ex| (QCDR |#G136|) . #12#)
             |#G136|)
            (LETT BASE (SPADCALL (QREFELT $ 18)) . #12#)
            (EXIT
             (COND
              ((>= |ex| 0)
               (SPADCALL
                (SPADCALL |nu|
                          (EXPT BASE
                                (PROG1 (LETT #10# |ex| . #12#)
                                  (|check_subtype2| (>= #10# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #10#)))
                          (QREFELT $ 165))
                (QREFELT $ 166)))
              (#13='T
               (SEQ
                (LETT |de|
                      (EXPT BASE
                            (PROG1 (LETT #9# (- |ex|) . #12#)
                              (|check_subtype2| (>= #9# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #9#)))
                      . #12#)
                (EXIT
                 (COND ((< |b| 2) (|error| "base must be > 1"))
                       (#13#
                        (SEQ (LETT |tol| (EXPT |b| |d|) . #12#)
                             (LETT |s| |nu| . #12#) (LETT |t| |de| . #12#)
                             (LETT |p0| 0 . #12#) (LETT |p1| 1 . #12#)
                             (LETT |q0| 1 . #12#) (LETT |q1| 0 . #12#)
                             (EXIT
                              (SEQ G190 NIL
                                   (SEQ
                                    (PROGN
                                     (LETT |#G137| (DIVIDE2 |s| |t|) . #12#)
                                     (LETT |q| (QCAR |#G137|) . #12#)
                                     (LETT |r| (QCDR |#G137|) . #12#)
                                     |#G137|)
                                    (LETT |p2| (+ (* |q| |p1|) |p0|) . #12#)
                                    (LETT |q2| (+ (* |q| |q1|) |q0|) . #12#)
                                    (COND
                                     ((OR (EQL |r| 0)
                                          (<
                                           (SPADCALL |tol|
                                                     (ABS
                                                      (- (* |nu| |q2|)
                                                         (* |de| |p2|)))
                                                     (QREFELT $ 168))
                                           (* |de| (ABS |p2|))))
                                      (EXIT
                                       (PROGN
                                        (LETT #7#
                                              (SPADCALL |p2| |q2|
                                                        (QREFELT $ 167))
                                              . #12#)
                                        (GO #14=#:G598)))))
                                    (PROGN
                                     (LETT |#G138| |p1| . #12#)
                                     (LETT |#G139| |p2| . #12#)
                                     (LETT |p0| |#G138| . #12#)
                                     (LETT |p1| |#G139| . #12#))
                                    (PROGN
                                     (LETT |#G140| |q1| . #12#)
                                     (LETT |#G141| |q2| . #12#)
                                     (LETT |q0| |#G140| . #12#)
                                     (LETT |q1| |#G141| . #12#))
                                    (EXIT
                                     (PROGN
                                      (LETT |#G142| |t| . #12#)
                                      (LETT |#G143| |r| . #12#)
                                      (LETT |s| |#G142| . #12#)
                                      (LETT |t| |#G143| . #12#))))
                                   NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #14# (EXIT #7#)))) 

(SDEFUN |DFLOAT;^;$F$;103| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPROG ((#1=#:G609 NIL) (|d| (|Integer|)) (|n| (|Integer|)))
               (SEQ
                (EXIT
                 (COND
                  ((|zero?_DF| |x|)
                   (COND ((SPADCALL |r| (QREFELT $ 169)) 1.0)
                         ((SPADCALL |r| (QREFELT $ 170))
                          (|error| "division by 0"))
                         (#2='T 0.0)))
                  ((OR (SPADCALL |r| (QREFELT $ 169)) (|eql_DF| |x| 1.0)) 1.0)
                  ('T
                   (COND
                    ((SPADCALL |r| (|spadConstant| $ 171) (QREFELT $ 172)) |x|)
                    (#2#
                     (SEQ
                      (LETT |n| (SPADCALL |r| (QREFELT $ 173))
                            . #3=(|DFLOAT;^;$F$;103|))
                      (LETT |d| (SPADCALL |r| (QREFELT $ 174)) . #3#)
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
                                               (QREFELT $ 175)))
                                    . #3#)
                              (GO #4=#:G608)))
                            (#2#
                             (PROGN
                              (LETT #1#
                                    (SPADCALL (|minus_DF| |x|) |r|
                                              (QREFELT $ 175))
                                    . #3#)
                              (GO #4#)))))
                          (#2# (|error| "negative root"))))
                        ((EQL |d| 2)
                         (|expt_DF_I| (SPADCALL |x| (QREFELT $ 51)) |n|))
                        (#2#
                         (SPADCALL |x|
                                   (|div_DF|
                                    (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT)
                                    (FLOAT |d| MOST-POSITIVE-DOUBLE-FLOAT))
                                   (QREFELT $ 55)))))))))))
                #4# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |DoubleFloat;|)) 

(DEFUN |DoubleFloat| ()
  (SPROG NIL
         (PROG (#1=#:G623)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|DoubleFloat|)
                    . #2=(|DoubleFloat|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|DoubleFloat|
                             (LIST (CONS NIL (CONS 1 (|DoubleFloat;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|DoubleFloat|)))))))))) 

(DEFUN |DoubleFloat;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DoubleFloat|) . #1=(|DoubleFloat|))
          (LETT $ (GETREFV 190) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
          (QSETREFV $ 70
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
              |DFLOAT;precision;Pi;7| |DFLOAT;log2;2$;37| (16 . *)
              |DFLOAT;bits;Pi;8| |DFLOAT;max;$;9| |DFLOAT;min;$;10|
              |DFLOAT;order;$I;11|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |DFLOAT;Zero;$;12|) $))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |DFLOAT;One;$;13|) $))
              |DFLOAT;exp1;$;14| |DFLOAT;pi;$;15| (22 . >=) (|OutputForm|)
              (28 . |message|) (33 . -) |DFLOAT;coerce;$Of;16| (|InputForm|)
              (38 . |convert|) |DFLOAT;convert;$If;17| |DFLOAT;<;2$B;18|
              |DFLOAT;-;2$;19| |DFLOAT;+;3$;20| |DFLOAT;-;3$;21|
              |DFLOAT;*;3$;22| |DFLOAT;*;I2$;23| |DFLOAT;max;3$;24|
              |DFLOAT;min;3$;25| |DFLOAT;=;2$B;26| |DFLOAT;/;$I$;27|
              |DFLOAT;sqrt;2$;28| |DFLOAT;qsqrt;2$;29| |DFLOAT;log10;2$;30|
              |DFLOAT;^;$I$;31| |DFLOAT;^;3$;32| |DFLOAT;coerce;I$;33|
              |DFLOAT;exp;2$;34| |DFLOAT;log;2$;35| |DFLOAT;qlog;2$;36|
              |DFLOAT;sin;2$;38| |DFLOAT;cos;2$;39| |DFLOAT;tan;2$;40|
              |DFLOAT;cot;2$;41| |DFLOAT;sec;2$;42| |DFLOAT;csc;2$;43|
              |DFLOAT;asin;2$;44| |DFLOAT;acos;2$;45| |DFLOAT;atan;2$;46|
              |DFLOAT;acsc;2$;47| '|pi_half| |DFLOAT;acot;2$;48|
              |DFLOAT;asec;2$;49| |DFLOAT;sinh;2$;50| |DFLOAT;cosh;2$;51|
              |DFLOAT;tanh;2$;52| |DFLOAT;csch;2$;53| |DFLOAT;coth;2$;54|
              |DFLOAT;sech;2$;55| |DFLOAT;asinh;2$;56| |DFLOAT;acosh;2$;57|
              |DFLOAT;atanh;2$;58| |DFLOAT;acsch;2$;59| |DFLOAT;acoth;2$;60|
              |DFLOAT;asech;2$;61| |DFLOAT;/;3$;62| |DFLOAT;negative?;$B;63|
              |DFLOAT;zero?;$B;64| (|HashState|) |DFLOAT;hashUpdate!;Hs$Hs;65|
              (|Union| $ '"failed") |DFLOAT;recip;$U;66|
              |DFLOAT;differentiate;2$;67| (|DoubleFloatSpecialFunctions|)
              (43 . |airyAi|) |DFLOAT;airyAi;2$;68| (48 . |airyBi|)
              |DFLOAT;airyBi;2$;69| (53 . |besselI|) |DFLOAT;besselI;3$;70|
              (59 . |besselJ|) |DFLOAT;besselJ;3$;71| (65 . |besselK|)
              |DFLOAT;besselK;3$;72| (71 . |besselY|) |DFLOAT;besselY;3$;73|
              (77 . |Beta|) |DFLOAT;Beta;3$;74| (83 . |digamma|)
              |DFLOAT;digamma;2$;75| (88 . |Gamma|) |DFLOAT;Gamma;2$;76|
              (|Union| 19 '"failed") (93 . |retractIfCan|)
              (|NonNegativeInteger|) (98 . |polygamma|)
              |DFLOAT;polygamma;3$;77| (|FloatSpecialFunctions|)
              (104 . |lambertW|) |DFLOAT;lambertW;2$;78|
              (|DoubleFloatEllipticIntegrals|) (109 . |ellipticF|)
              |DFLOAT;ellipticF;3$;79| (115 . |ellipticK|)
              |DFLOAT;ellipticK;2$;80| (120 . |ellipticE|)
              |DFLOAT;ellipticE;3$;81| (126 . |ellipticE|)
              |DFLOAT;ellipticE;2$;82| (131 . |ellipticPi|)
              |DFLOAT;ellipticPi;4$;83| (|Float|) (138 . |bits|) (142 . |bits|)
              (147 . |convert|) (|FloatEllipticFunctions|) (152 . |jacobiSn|)
              (158 . |convert|) |DFLOAT;jacobiSn;3$;84| (163 . |jacobiCn|)
              |DFLOAT;jacobiCn;3$;85| (169 . |jacobiDn|)
              |DFLOAT;jacobiDn;3$;86| (175 . |weierstrassP|)
              |DFLOAT;weierstrassP;4$;87| (182 . |weierstrassPPrime|)
              |DFLOAT;weierstrassPPrime;4$;88| |DFLOAT;wholePart;$I;89|
              |DFLOAT;float;2IPi$;90| |DFLOAT;convert;2$;91|
              |DFLOAT;convert;$F;92| (|Fraction| 19)
              |DFLOAT;rationalApproximation;$2NniF;102|
              |DFLOAT;rationalApproximation;$NniF;93| (189 . >)
              |DFLOAT;atan;3$;94| (195 . -) |DFLOAT;retract;$F;95|
              (|Union| 151 '"failed") |DFLOAT;retractIfCan;$U;96|
              |DFLOAT;retract;$I;97| |DFLOAT;retractIfCan;$U;98|
              |DFLOAT;sign;$I;99| |DFLOAT;abs;2$;100| (201 . ^) (207 . *)
              (213 . |coerce|) (218 . /) (224 . *) (230 . |zero?|)
              (235 . |negative?|) (240 . |One|) (244 . =) (250 . |numer|)
              (255 . |denom|) |DFLOAT;^;$F$;103| (|List| $)
              (|PatternMatchResult| 131 $) (|Pattern| 131) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 180 '#1="failed") (|Union| 176 '#1#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |coef| 176) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|SingleInteger|))
           '#(~= 260 |zero?| 266 |wholePart| 271 |whittakerW| 276 |whittakerM|
              283 |weierstrassZeta| 290 |weierstrassSigma| 297
              |weierstrassPPrime| 304 |weierstrassPInverse| 311 |weierstrassP|
              318 |weberE| 325 |unitNormal| 331 |unitCanonical| 336 |unit?| 341
              |truncate| 346 |toString| 351 |tanh| 357 |tan| 362
              |subtractIfCan| 367 |struveL| 373 |struveH| 379 |squareFreePart|
              385 |squareFree| 390 |sqrt| 395 |smaller?| 400 |sizeLess?| 406
              |sinh| 412 |sin| 417 |sign| 422 |sech| 427 |sec| 432 |sample| 437
              |round| 441 |rightRecip| 446 |rightPower| 451 |riemannZeta| 463
              |retractIfCan| 468 |retract| 478 |rem| 488 |recip| 494
              |rationalApproximation| 499 |quo| 512 |qsqrt| 518 |qlog| 523
              |principalIdeal| 528 |prime?| 533 |precision| 538 |positive?| 547
              |polylog| 552 |polygamma| 558 |pi| 564 |patternMatch| 568 |order|
              575 |opposite?| 580 |one?| 586 |nthRoot| 591 |norm| 597
              |negative?| 602 |multiEuclidean| 607 |min| 613 |meixnerM| 623
              |meijerG| 631 |max| 640 |mantissa| 650 |lommelS2| 655 |lommelS1|
              662 |log2| 669 |log10| 674 |log| 679 |lerchPhi| 684 |legendreQ|
              691 |legendreP| 698 |leftRecip| 705 |leftPower| 710 |lcmCoef| 722
              |lcm| 728 |latex| 739 |lambertW| 744 |laguerreL| 749 |kummerU|
              756 |kummerM| 763 |kelvinKer| 770 |kelvinKei| 776 |kelvinBer| 782
              |kelvinBei| 788 |jacobiZeta| 794 |jacobiTheta| 800 |jacobiSn| 806
              |jacobiP| 812 |jacobiDn| 820 |jacobiCn| 826 |inv| 832
              |increasePrecision| 837 |hypergeometricF| 842 |hermiteH| 849
              |hashUpdate!| 855 |hash| 861 |hankelH2| 866 |hankelH1| 872
              |gcdPolynomial| 878 |gcd| 884 |fractionPart| 895 |floor| 900
              |float| 905 |factor| 918 |extendedEuclidean| 923 |exquo| 936
              |expressIdealMember| 942 |exponent| 948 |exp1| 953 |exp| 957
              |euclideanSize| 962 |ellipticPi| 967 |ellipticK| 974 |ellipticF|
              979 |ellipticE| 985 |doubleFloatFormat| 996 |divide| 1001
              |digits| 1007 |digamma| 1016 |differentiate| 1021
              |decreasePrecision| 1032 |csch| 1037 |csc| 1042 |coth| 1047 |cot|
              1052 |cosh| 1057 |cos| 1062 |convert| 1067 |commutator| 1087
              |coerce| 1093 |charlierC| 1123 |characteristic| 1130 |ceiling|
              1134 |bits| 1139 |besselY| 1148 |besselK| 1154 |besselJ| 1160
              |besselI| 1166 |base| 1172 |atanh| 1176 |atan| 1181 |associator|
              1192 |associates?| 1199 |asinh| 1205 |asin| 1210 |asech| 1215
              |asec| 1220 |antiCommutator| 1225 |annihilate?| 1231 |angerJ|
              1237 |airyBiPrime| 1243 |airyBi| 1248 |airyAiPrime| 1253 |airyAi|
              1258 |acsch| 1263 |acsc| 1268 |acoth| 1273 |acot| 1278 |acosh|
              1283 |acos| 1288 |abs| 1293 ^ 1298 |Zero| 1328 |One| 1332
              |OMwrite| 1336 |Gamma| 1360 D 1371 |Beta| 1382 >= 1388 > 1394 =
              1400 <= 1406 < 1412 / 1418 - 1430 + 1441 * 1447)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0))
            (CONS
             '#(|FloatingPointSystem&| |RealNumberSystem&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| |OrderedRing&| |DivisionRing&| NIL NIL
                |DifferentialRing&| NIL |Algebra&| NIL |EntireRing&| |Algebra&|
                NIL |Rng&| NIL |Module&| |Module&| NIL NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL |AbelianGroup&| NIL NIL NIL NIL |OrderedSet&| NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&| NIL
                NIL |Magma&| |AbelianSemiGroup&|
                |TranscendentalFunctionCategory&| NIL |SetCategory&| NIL NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| |OpenMath&| NIL NIL
                |RadicalCategory&| |RetractableTo&| |RetractableTo&| NIL NIL
                |PartialOrder&| NIL NIL NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|FloatingPointSystem|) (|RealNumberSystem|) (|Field|)
                 (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|OrderedRing|)
                 (|DivisionRing|) (|IntegralDomain|) (|LeftOreRing|)
                 (|DifferentialRing|) (|CharacteristicZero|) (|Algebra| 151)
                 (|CommutativeRing|) (|EntireRing|) (|Algebra| $$) (|Ring|)
                 (|Rng|) (|SemiRing|) (|Module| 151) (|Module| $$) (|SemiRng|)
                 (|OrderedAbelianGroup|) (|BiModule| 151 151)
                 (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| 151)
                 (|LeftModule| 151) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedSet|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|PatternMatchable| 131) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|TranscendentalFunctionCategory|)
                 (|RealConstant|) (|SetCategory|) (|ConvertibleTo| 38)
                 (|SpecialFunctionCategory|) (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|OpenMath|) (|Approximate|)
                 (|ConvertibleTo| 178) (|RadicalCategory|)
                 (|RetractableTo| 151) (|RetractableTo| 19)
                 (|ConvertibleTo| 131) (|ConvertibleTo| 12) (|PartialOrder|)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 34))
              (|makeByteWordVec2| 189
                                  '(1 10 9 0 11 2 10 9 0 12 13 1 10 9 0 14 2 0
                                    0 17 0 24 2 0 15 0 0 33 1 34 0 7 35 1 34 0
                                    0 36 1 38 0 12 39 1 93 12 12 94 1 93 12 12
                                    96 2 93 12 12 12 98 2 93 12 12 12 100 2 93
                                    12 12 12 102 2 93 12 12 12 104 2 93 12 12
                                    12 106 1 93 12 12 108 1 93 12 12 110 1 12
                                    112 0 113 2 93 12 114 12 115 1 117 12 12
                                    118 2 120 12 12 12 121 1 120 12 12 123 2
                                    120 12 12 12 125 1 120 12 12 127 3 120 12
                                    12 12 12 129 0 131 17 132 1 131 17 17 133 1
                                    131 0 12 134 2 135 131 131 131 136 1 131 12
                                    0 137 2 135 131 131 131 139 2 135 131 131
                                    131 141 3 135 131 131 131 131 143 3 135 131
                                    131 131 131 145 2 0 15 0 0 154 2 114 0 0 0
                                    156 2 17 0 0 17 164 2 114 0 19 0 165 1 151
                                    0 19 166 2 151 0 19 19 167 2 19 0 114 0 168
                                    1 151 15 0 169 1 151 15 0 170 0 151 0 171 2
                                    151 15 0 0 172 1 151 19 0 173 1 151 19 0
                                    174 2 0 15 0 0 1 1 0 15 0 87 1 0 19 0 147 3
                                    0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0
                                    0 0 0 0 1 3 0 0 0 0 0 146 3 0 0 0 0 0 1 3 0
                                    0 0 0 0 144 2 0 0 0 0 1 1 0 188 0 1 1 0 0 0
                                    1 1 0 15 0 1 1 0 0 0 1 2 0 7 0 114 1 1 0 0
                                    0 75 1 0 0 0 62 2 0 90 0 0 1 2 0 0 0 0 1 2
                                    0 0 0 0 1 1 0 0 0 1 1 0 179 0 1 1 0 0 0 51
                                    2 0 15 0 0 1 2 0 15 0 0 1 1 0 0 0 73 1 0 0
                                    0 60 1 0 19 0 162 1 0 0 0 78 1 0 0 0 64 0 0
                                    0 1 1 0 0 0 1 1 0 90 0 1 2 0 0 0 114 1 2 0
                                    0 0 17 1 1 0 0 0 1 1 0 158 0 159 1 0 112 0
                                    161 1 0 151 0 157 1 0 19 0 160 2 0 0 0 0 1
                                    1 0 90 0 91 3 0 151 0 114 114 152 2 0 151 0
                                    114 153 2 0 0 0 0 1 1 0 0 0 52 1 0 0 0 59 1
                                    0 186 176 1 1 0 15 0 1 1 1 17 17 1 0 0 17
                                    22 1 0 15 0 1 2 0 0 0 0 1 2 0 0 0 0 116 0 0
                                    0 32 3 0 177 0 178 177 1 1 0 19 0 28 2 0 15
                                    0 0 1 1 0 15 0 1 2 0 0 0 19 1 1 0 0 0 1 1 0
                                    15 0 86 2 0 182 176 0 1 0 2 0 27 2 0 0 0 0
                                    48 4 0 0 0 0 0 0 1 5 3 0 176 176 176 176 0
                                    1 0 2 0 26 2 0 0 0 0 47 1 0 19 0 20 3 0 0 0
                                    0 0 1 3 0 0 0 0 0 1 1 0 0 0 23 1 0 0 0 53 1
                                    0 0 0 58 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0
                                    0 0 0 1 1 0 90 0 1 2 0 0 0 114 1 2 0 0 0 17
                                    1 2 0 187 0 0 1 2 0 0 0 0 1 1 0 0 176 1 1 0
                                    7 0 1 1 0 0 0 119 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 0 0 138 4 0 0 0 0 0 0 1 2 0 0 0 0 142
                                    2 0 0 0 0 140 1 0 0 0 1 1 1 17 19 1 3 3 0
                                    176 176 0 1 2 0 0 0 0 1 2 0 88 88 0 89 1 0
                                    189 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 185 185
                                    185 1 2 0 0 0 0 1 1 0 0 176 1 1 0 0 0 1 1 0
                                    0 0 1 2 0 0 19 19 1 3 0 0 19 19 17 148 1 0
                                    179 0 1 3 0 181 0 0 0 1 2 0 183 0 0 1 2 0
                                    90 0 0 1 2 0 182 176 0 1 1 0 19 0 21 0 0 0
                                    31 1 0 0 0 57 1 0 114 0 1 3 0 0 0 0 0 130 1
                                    0 0 0 124 2 0 0 0 0 122 2 0 0 0 0 126 1 0 0
                                    0 128 1 0 7 7 8 2 0 184 0 0 1 1 1 17 17 1 0
                                    0 17 1 1 0 0 0 109 1 0 0 0 92 2 0 0 0 114 1
                                    1 1 17 19 1 1 0 0 0 76 1 0 0 0 65 1 0 0 0
                                    77 1 0 0 0 63 1 0 0 0 74 1 0 0 0 61 1 0 38
                                    0 40 1 0 178 0 1 1 0 131 0 150 1 0 12 0 149
                                    2 0 0 0 0 1 1 0 0 151 1 1 0 0 19 56 1 0 0
                                    151 1 1 0 0 0 1 1 0 0 19 56 1 0 34 0 37 3 0
                                    0 0 0 0 1 0 0 114 1 1 0 0 0 1 1 1 17 17 1 0
                                    0 17 25 2 0 0 0 0 105 2 0 0 0 0 103 2 0 0 0
                                    0 101 2 0 0 0 0 99 0 0 17 18 1 0 0 0 81 2 0
                                    0 0 0 155 1 0 0 0 68 3 0 0 0 0 0 1 2 0 15 0
                                    0 1 1 0 0 0 79 1 0 0 0 66 1 0 0 0 84 1 0 0
                                    0 72 2 0 0 0 0 1 2 0 15 0 0 1 2 0 0 0 0 1 1
                                    0 0 0 1 1 0 0 0 97 1 0 0 0 1 1 0 0 0 95 1 0
                                    0 0 82 1 0 0 0 69 1 0 0 0 83 1 0 0 0 71 1 0
                                    0 0 80 1 0 0 0 67 1 0 0 0 163 2 0 0 0 0 55
                                    2 0 0 0 151 175 2 0 0 0 19 54 2 0 0 0 114 1
                                    2 0 0 0 17 1 0 0 0 29 0 0 0 30 3 0 9 10 0
                                    15 16 2 0 7 0 15 1 2 0 9 10 0 1 1 0 7 0 1 2
                                    0 0 0 0 1 1 0 0 0 111 1 0 0 0 1 2 0 0 0 114
                                    1 2 0 0 0 0 107 2 0 15 0 0 33 2 0 15 0 0
                                    154 2 0 15 0 0 49 2 0 15 0 0 1 2 0 15 0 0
                                    41 2 0 0 0 19 50 2 0 0 0 0 85 2 0 0 0 0 44
                                    1 0 0 0 42 2 0 0 0 0 43 2 0 0 151 0 1 2 0 0
                                    0 151 1 2 0 0 114 0 1 2 0 0 19 0 46 2 0 0 0
                                    0 45 2 0 0 17 0 24)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloat| 'NILADIC T) 
