
(SDEFUN |DFLOAT;doubleFloatFormat;2S;1| ((|s| |String|) ($ |String|))
        (SPROG ((|ss| (|String|)))
               (SEQ (LETT |ss| (QREFELT $ 6) |DFLOAT;doubleFloatFormat;2S;1|)
                    (SETELT $ 6 |s|) (EXIT |ss|)))) 

(SDEFUN |DFLOAT;OMwrite;$S;2| ((|x| $) ($ |String|))
        (SPROG ((|s| (|String|)) (|dev| (|OpenMathDevice|)) (|sp| NIL))
               (SEQ (LETT |s| "" . #1=(|DFLOAT;OMwrite;$S;2|))
                    (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
                    (LETT |dev|
                          (SPADCALL |sp| (SPADCALL (QREFELT $ 10))
                                    (QREFELT $ 12))
                          . #1#)
                    (SPADCALL |dev| (QREFELT $ 14))
                    (SPADCALL |dev| |x| (QREFELT $ 16))
                    (SPADCALL |dev| (QREFELT $ 17))
                    (SPADCALL |dev| (QREFELT $ 18))
                    (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|)))) 

(SDEFUN |DFLOAT;OMwrite;$BS;3| ((|x| $) (|wholeObj| |Boolean|) ($ |String|))
        (SPROG ((|s| (|String|)) (|dev| (|OpenMathDevice|)) (|sp| NIL))
               (SEQ (LETT |s| "" . #1=(|DFLOAT;OMwrite;$BS;3|))
                    (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
                    (LETT |dev|
                          (SPADCALL |sp| (SPADCALL (QREFELT $ 10))
                                    (QREFELT $ 12))
                          . #1#)
                    (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 14))))
                    (SPADCALL |dev| |x| (QREFELT $ 16))
                    (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 17))))
                    (SPADCALL |dev| (QREFELT $ 18))
                    (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|)))) 

(SDEFUN |DFLOAT;OMwrite;Omd$V;4| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 14))
             (SPADCALL |dev| |x| (QREFELT $ 16))
             (EXIT (SPADCALL |dev| (QREFELT $ 17))))) 

(SDEFUN |DFLOAT;OMwrite;Omd$BV;5|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 14))))
             (SPADCALL |dev| |x| (QREFELT $ 16))
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 17))))))) 

(PUT '|DFLOAT;checkComplex| '|SPADreplace| '|c_to_r|) 

(SDEFUN |DFLOAT;checkComplex| ((|x| $) ($ $)) (|c_to_r| |x|)) 

(PUT '|DFLOAT;base;Pi;7| '|SPADreplace| '(XLAM NIL (FLOAT-RADIX 0.0))) 

(SDEFUN |DFLOAT;base;Pi;7| (($ |PositiveInteger|)) (FLOAT-RADIX 0.0)) 

(SDEFUN |DFLOAT;mantissa;$I;8| ((|x| $) ($ |Integer|))
        (QCAR (|DFLOAT;manexp| |x| $))) 

(SDEFUN |DFLOAT;exponent;$I;9| ((|x| $) ($ |Integer|))
        (QCDR (|DFLOAT;manexp| |x| $))) 

(PUT '|DFLOAT;precision;Pi;10| '|SPADreplace| '(XLAM NIL (FLOAT-DIGITS 0.0))) 

(SDEFUN |DFLOAT;precision;Pi;10| (($ |PositiveInteger|)) (FLOAT-DIGITS 0.0)) 

(SDEFUN |DFLOAT;bits;Pi;11| (($ |PositiveInteger|))
        (SPROG ((#1=#:G406 NIL))
               (COND
                ((EQL (SPADCALL (QREFELT $ 25)) 2) (SPADCALL (QREFELT $ 29)))
                ((EQL (SPADCALL (QREFELT $ 25)) 16)
                 (* 4 (SPADCALL (QREFELT $ 29))))
                ('T
                 (PROG1
                     (LETT #1#
                           (TRUNCATE
                            (SPADCALL (SPADCALL (QREFELT $ 29))
                                      (SPADCALL
                                       (FLOAT (SPADCALL (QREFELT $ 25))
                                              MOST-POSITIVE-DOUBLE-FLOAT)
                                       (QREFELT $ 30))
                                      (QREFELT $ 31)))
                           |DFLOAT;bits;Pi;11|)
                   (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#)))))) 

(PUT '|DFLOAT;max;$;12| '|SPADreplace| '(XLAM NIL MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |DFLOAT;max;$;12| (($ $)) MOST-POSITIVE-DOUBLE-FLOAT) 

(PUT '|DFLOAT;min;$;13| '|SPADreplace| '(XLAM NIL MOST-NEGATIVE-DOUBLE-FLOAT)) 

(SDEFUN |DFLOAT;min;$;13| (($ $)) MOST-NEGATIVE-DOUBLE-FLOAT) 

(SDEFUN |DFLOAT;order;$I;14| ((|a| $) ($ |Integer|))
        (- (+ (SPADCALL (QREFELT $ 29)) (SPADCALL |a| (QREFELT $ 28))) 1)) 

(PUT '|DFLOAT;Zero;$;15| '|SPADreplace|
     '(XLAM NIL (FLOAT 0 MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |DFLOAT;Zero;$;15| (($ $)) (FLOAT 0 MOST-POSITIVE-DOUBLE-FLOAT)) 

(PUT '|DFLOAT;One;$;16| '|SPADreplace|
     '(XLAM NIL (FLOAT 1 MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |DFLOAT;One;$;16| (($ $)) (FLOAT 1 MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |DFLOAT;exp1;$;17| (($ $))
        (|div_DF| (FLOAT 534625820200 MOST-POSITIVE-DOUBLE-FLOAT)
                  (FLOAT 196677847971 MOST-POSITIVE-DOUBLE-FLOAT))) 

(PUT '|DFLOAT;pi;$;18| '|SPADreplace|
     '(XLAM NIL (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |DFLOAT;pi;$;18| (($ $)) (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |DFLOAT;coerce;$Of;19| ((|x| $) ($ |OutputForm|))
        (COND
         ((SPADCALL |x| 0.0 (QREFELT $ 40))
          (SPADCALL (FORMAT NIL (QREFELT $ 6) |x|) (QREFELT $ 42)))
         ('T
          (SPADCALL
           (SPADCALL (FORMAT NIL (QREFELT $ 6) (|minus_DF| |x|))
                     (QREFELT $ 42))
           (QREFELT $ 43))))) 

(SDEFUN |DFLOAT;convert;$If;20| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 46))) 

(PUT '|DFLOAT;<;2$B;21| '|SPADreplace| '|less_DF|) 

(SDEFUN |DFLOAT;<;2$B;21| ((|x| $) (|y| $) ($ |Boolean|)) (|less_DF| |x| |y|)) 

(PUT '|DFLOAT;-;2$;22| '|SPADreplace| '|minus_DF|) 

(SDEFUN |DFLOAT;-;2$;22| ((|x| $) ($ $)) (|minus_DF| |x|)) 

(PUT '|DFLOAT;+;3$;23| '|SPADreplace| '|add_DF|) 

(SDEFUN |DFLOAT;+;3$;23| ((|x| $) (|y| $) ($ $)) (|add_DF| |x| |y|)) 

(PUT '|DFLOAT;-;3$;24| '|SPADreplace| '|sub_DF|) 

(SDEFUN |DFLOAT;-;3$;24| ((|x| $) (|y| $) ($ $)) (|sub_DF| |x| |y|)) 

(PUT '|DFLOAT;*;3$;25| '|SPADreplace| '|mul_DF|) 

(SDEFUN |DFLOAT;*;3$;25| ((|x| $) (|y| $) ($ $)) (|mul_DF| |x| |y|)) 

(PUT '|DFLOAT;*;I2$;26| '|SPADreplace| '(XLAM (|i| |x|) (|mul_DF_I| |x| |i|))) 

(SDEFUN |DFLOAT;*;I2$;26| ((|i| |Integer|) (|x| $) ($ $)) (|mul_DF_I| |x| |i|)) 

(PUT '|DFLOAT;max;3$;27| '|SPADreplace| '|max_DF|) 

(SDEFUN |DFLOAT;max;3$;27| ((|x| $) (|y| $) ($ $)) (|max_DF| |x| |y|)) 

(PUT '|DFLOAT;min;3$;28| '|SPADreplace| '|min_DF|) 

(SDEFUN |DFLOAT;min;3$;28| ((|x| $) (|y| $) ($ $)) (|min_DF| |x| |y|)) 

(PUT '|DFLOAT;=;2$B;29| '|SPADreplace| '|eql_DF|) 

(SDEFUN |DFLOAT;=;2$B;29| ((|x| $) (|y| $) ($ |Boolean|)) (|eql_DF| |x| |y|)) 

(PUT '|DFLOAT;/;$I$;30| '|SPADreplace| '|div_DF_I|) 

(SDEFUN |DFLOAT;/;$I$;30| ((|x| $) (|i| |Integer|) ($ $)) (|div_DF_I| |x| |i|)) 

(SDEFUN |DFLOAT;sqrt;2$;31| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (|sqrt_DF| |x|) $)) 

(PUT '|DFLOAT;qsqrt;2$;32| '|SPADreplace| '|qsqrt_DF|) 

(SDEFUN |DFLOAT;qsqrt;2$;32| ((|x| $) ($ $)) (|qsqrt_DF| |x|)) 

(SDEFUN |DFLOAT;log10;2$;33| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (LOG10 |x|) $)) 

(PUT '|DFLOAT;^;$I$;34| '|SPADreplace| '|expt_DF_I|) 

(SDEFUN |DFLOAT;^;$I$;34| ((|x| $) (|i| |Integer|) ($ $)) (|expt_DF_I| |x| |i|)) 

(SDEFUN |DFLOAT;^;3$;35| ((|x| $) (|y| $) ($ $))
        (|DFLOAT;checkComplex| (|expt_DF| |x| |y|) $)) 

(PUT '|DFLOAT;coerce;I$;36| '|SPADreplace|
     '(XLAM (|i|) (FLOAT |i| MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |DFLOAT;coerce;I$;36| ((|i| |Integer|) ($ $))
        (FLOAT |i| MOST-POSITIVE-DOUBLE-FLOAT)) 

(PUT '|DFLOAT;exp;2$;37| '|SPADreplace| '|exp_DF|) 

(SDEFUN |DFLOAT;exp;2$;37| ((|x| $) ($ $)) (|exp_DF| |x|)) 

(SDEFUN |DFLOAT;log;2$;38| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (|log_DF| |x|) $)) 

(PUT '|DFLOAT;qlog;2$;39| '|SPADreplace| '|qlog_DF|) 

(SDEFUN |DFLOAT;qlog;2$;39| ((|x| $) ($ $)) (|qlog_DF| |x|)) 

(SDEFUN |DFLOAT;log2;2$;40| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (LOG2 |x|) $)) 

(PUT '|DFLOAT;sin;2$;41| '|SPADreplace| '|sin_DF|) 

(SDEFUN |DFLOAT;sin;2$;41| ((|x| $) ($ $)) (|sin_DF| |x|)) 

(PUT '|DFLOAT;cos;2$;42| '|SPADreplace| '|cos_DF|) 

(SDEFUN |DFLOAT;cos;2$;42| ((|x| $) ($ $)) (|cos_DF| |x|)) 

(PUT '|DFLOAT;tan;2$;43| '|SPADreplace| '|tan_DF|) 

(SDEFUN |DFLOAT;tan;2$;43| ((|x| $) ($ $)) (|tan_DF| |x|)) 

(PUT '|DFLOAT;cot;2$;44| '|SPADreplace| 'COT) 

(SDEFUN |DFLOAT;cot;2$;44| ((|x| $) ($ $)) (COT |x|)) 

(SDEFUN |DFLOAT;sec;2$;45| ((|x| $) ($ $)) (|div_DF| 1.0 (|cos_DF| |x|))) 

(SDEFUN |DFLOAT;csc;2$;46| ((|x| $) ($ $)) (|div_DF| 1.0 (|sin_DF| |x|))) 

(SDEFUN |DFLOAT;asin;2$;47| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (ASIN |x|) $)) 

(SDEFUN |DFLOAT;acos;2$;48| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (ACOS |x|) $)) 

(PUT '|DFLOAT;atan;2$;49| '|SPADreplace| '|atan_DF|) 

(SDEFUN |DFLOAT;atan;2$;49| ((|x| $) ($ $)) (|atan_DF| |x|)) 

(SDEFUN |DFLOAT;acsc;2$;50| ((|x| $) ($ $))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 73))) 

(SDEFUN |DFLOAT;acot;2$;51| ((|x| $) ($ $))
        (COND
         ((|less_DF| 0.0 |x|)
          (COND ((|less_DF| |x| 1.0) (|sub_DF| (QREFELT $ 77) (|atan_DF| |x|)))
                ('T (|atan_DF| (|div_DF| 1.0 |x|)))))
         ((NULL (|less_DF| (|minus_DF| 1.0) |x|))
          (|sub_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                    (|atan_DF| (|minus_DF| (|div_DF| 1.0 |x|)))))
         ('T (|add_DF| (QREFELT $ 77) (|atan_DF| (|minus_DF| |x|)))))) 

(SDEFUN |DFLOAT;asec;2$;52| ((|x| $) ($ $))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 74))) 

(PUT '|DFLOAT;sinh;2$;53| '|SPADreplace| '|sinh_DF|) 

(SDEFUN |DFLOAT;sinh;2$;53| ((|x| $) ($ $)) (|sinh_DF| |x|)) 

(PUT '|DFLOAT;cosh;2$;54| '|SPADreplace| '|cosh_DF|) 

(SDEFUN |DFLOAT;cosh;2$;54| ((|x| $) ($ $)) (|cosh_DF| |x|)) 

(PUT '|DFLOAT;tanh;2$;55| '|SPADreplace| '|tanh_DF|) 

(SDEFUN |DFLOAT;tanh;2$;55| ((|x| $) ($ $)) (|tanh_DF| |x|)) 

(SDEFUN |DFLOAT;csch;2$;56| ((|x| $) ($ $)) (|div_DF| 1.0 (|sinh_DF| |x|))) 

(SDEFUN |DFLOAT;coth;2$;57| ((|x| $) ($ $)) (|div_DF| 1.0 (|tanh_DF| |x|))) 

(SDEFUN |DFLOAT;sech;2$;58| ((|x| $) ($ $)) (|div_DF| 1.0 (|cosh_DF| |x|))) 

(PUT '|DFLOAT;asinh;2$;59| '|SPADreplace| 'ASINH) 

(SDEFUN |DFLOAT;asinh;2$;59| ((|x| $) ($ $)) (ASINH |x|)) 

(SDEFUN |DFLOAT;acosh;2$;60| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (ACOSH |x|) $)) 

(SDEFUN |DFLOAT;atanh;2$;61| ((|x| $) ($ $))
        (|DFLOAT;checkComplex| (ATANH |x|) $)) 

(SDEFUN |DFLOAT;acsch;2$;62| ((|x| $) ($ $)) (ASINH (|div_DF| 1.0 |x|))) 

(SDEFUN |DFLOAT;acoth;2$;63| ((|x| $) ($ $))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 88))) 

(SDEFUN |DFLOAT;asech;2$;64| ((|x| $) ($ $))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 87))) 

(PUT '|DFLOAT;/;3$;65| '|SPADreplace| '|div_DF|) 

(SDEFUN |DFLOAT;/;3$;65| ((|x| $) (|y| $) ($ $)) (|div_DF| |x| |y|)) 

(PUT '|DFLOAT;negative?;$B;66| '|SPADreplace| '|negative?_DF|) 

(SDEFUN |DFLOAT;negative?;$B;66| ((|x| $) ($ |Boolean|)) (|negative?_DF| |x|)) 

(PUT '|DFLOAT;zero?;$B;67| '|SPADreplace| '|zero?_DF|) 

(SDEFUN |DFLOAT;zero?;$B;67| ((|x| $) ($ |Boolean|)) (|zero?_DF| |x|)) 

(SDEFUN |DFLOAT;hashUpdate!;Hs$Hs;68|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(SDEFUN |DFLOAT;recip;$U;69| ((|x| $) ($ |Union| $ "failed"))
        (COND ((|zero?_DF| |x|) (CONS 1 "failed"))
              ('T (CONS 0 (|div_DF| 1.0 |x|))))) 

(PUT '|DFLOAT;differentiate;2$;70| '|SPADreplace| '(XLAM (|x|) 0.0)) 

(SDEFUN |DFLOAT;differentiate;2$;70| ((|x| $) ($ $)) 0.0) 

(SDEFUN |DFLOAT;airyAi;2$;71| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 101))) 

(SDEFUN |DFLOAT;airyBi;2$;72| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 103))) 

(SDEFUN |DFLOAT;besselI;3$;73| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 105))) 

(SDEFUN |DFLOAT;besselJ;3$;74| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 107))) 

(SDEFUN |DFLOAT;besselK;3$;75| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 109))) 

(SDEFUN |DFLOAT;besselY;3$;76| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 111))) 

(SDEFUN |DFLOAT;Beta;3$;77| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 113))) 

(SDEFUN |DFLOAT;digamma;2$;78| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 115))) 

(SDEFUN |DFLOAT;Gamma;2$;79| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 117))) 

(SDEFUN |DFLOAT;polygamma;3$;80| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G492 NIL) (|n| (|Union| (|Integer|) "failed")))
               (SEQ
                (LETT |n| (SPADCALL |x| (QREFELT $ 120))
                      . #2=(|DFLOAT;polygamma;3$;80|))
                (EXIT
                 (COND
                  ((QEQCAR |n| 0)
                   (COND
                    ((>= (QCDR |n|) 0)
                     (SPADCALL
                      (PROG1 (LETT #1# (QCDR |n|) . #2#)
                        (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                         #1#))
                      |y| (QREFELT $ 122)))
                    (#3='T
                     (|error|
                      #4="polygamma: first argument should be a nonnegative integer"))))
                  (#3# (|error| #4#))))))) 

(SDEFUN |DFLOAT;lambertW;2$;81| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 125))) 

(SDEFUN |DFLOAT;ellipticF;3$;82| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 128))) 

(SDEFUN |DFLOAT;ellipticK;2$;83| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 130))) 

(SDEFUN |DFLOAT;ellipticE;3$;84| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 132))) 

(SDEFUN |DFLOAT;ellipticE;2$;85| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 134))) 

(SDEFUN |DFLOAT;ellipticPi;4$;86| ((|x| $) (|y| $) (|z| $) ($ $))
        (SPADCALL |x| |y| |z| (QREFELT $ 136))) 

(SDEFUN |DFLOAT;jacobiSn;3$;87| ((|x| $) (|y| $) ($ $))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ
                (LETT |obits| (SPADCALL (QREFELT $ 139))
                      |DFLOAT;jacobiSn;3$;87|)
                (EXIT
                 (|finally|
                  (SEQ (SPADCALL 68 (QREFELT $ 140))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT $ 141))
                                   (SPADCALL |y| (QREFELT $ 141))
                                   (QREFELT $ 143))
                         (QREFELT $ 144))))
                  (SPADCALL |obits| (QREFELT $ 140))))))) 

(SDEFUN |DFLOAT;jacobiCn;3$;88| ((|x| $) (|y| $) ($ $))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ
                (LETT |obits| (SPADCALL (QREFELT $ 139))
                      |DFLOAT;jacobiCn;3$;88|)
                (EXIT
                 (|finally|
                  (SEQ (SPADCALL 68 (QREFELT $ 140))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT $ 141))
                                   (SPADCALL |y| (QREFELT $ 141))
                                   (QREFELT $ 146))
                         (QREFELT $ 144))))
                  (SPADCALL |obits| (QREFELT $ 140))))))) 

(SDEFUN |DFLOAT;jacobiDn;3$;89| ((|x| $) (|y| $) ($ $))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ
                (LETT |obits| (SPADCALL (QREFELT $ 139))
                      |DFLOAT;jacobiDn;3$;89|)
                (EXIT
                 (|finally|
                  (SEQ (SPADCALL 68 (QREFELT $ 140))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT $ 141))
                                   (SPADCALL |y| (QREFELT $ 141))
                                   (QREFELT $ 148))
                         (QREFELT $ 144))))
                  (SPADCALL |obits| (QREFELT $ 140))))))) 

(SDEFUN |DFLOAT;weierstrassP;4$;90| ((|x| $) (|y| $) (|z| $) ($ $))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ
                (LETT |obits| (SPADCALL (QREFELT $ 139))
                      |DFLOAT;weierstrassP;4$;90|)
                (EXIT
                 (|finally|
                  (SEQ (SPADCALL 68 (QREFELT $ 140))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT $ 141))
                                   (SPADCALL |y| (QREFELT $ 141))
                                   (SPADCALL |z| (QREFELT $ 141))
                                   (QREFELT $ 150))
                         (QREFELT $ 144))))
                  (SPADCALL |obits| (QREFELT $ 140))))))) 

(SDEFUN |DFLOAT;weierstrassPPrime;4$;91| ((|x| $) (|y| $) (|z| $) ($ $))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ
                (LETT |obits| (SPADCALL (QREFELT $ 139))
                      |DFLOAT;weierstrassPPrime;4$;91|)
                (EXIT
                 (|finally|
                  (SEQ (SPADCALL 68 (QREFELT $ 140))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT $ 141))
                                   (SPADCALL |y| (QREFELT $ 141))
                                   (SPADCALL |z| (QREFELT $ 141))
                                   (QREFELT $ 152))
                         (QREFELT $ 144))))
                  (SPADCALL |obits| (QREFELT $ 140))))))) 

(PUT '|DFLOAT;wholePart;$I;92| '|SPADreplace| 'TRUNCATE) 

(SDEFUN |DFLOAT;wholePart;$I;92| ((|x| $) ($ |Integer|)) (TRUNCATE |x|)) 

(SDEFUN |DFLOAT;float;2IPi$;93|
        ((|ma| . #1=(|Integer|)) (|ex| . #1#) (|b| |PositiveInteger|) ($ $))
        (|mul_DF_I| (|expt_DF_I| (FLOAT |b| MOST-POSITIVE-DOUBLE-FLOAT) |ex|)
                    |ma|)) 

(PUT '|DFLOAT;convert;2$;94| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DFLOAT;convert;2$;94| ((|x| $) ($ |DoubleFloat|)) |x|) 

(SDEFUN |DFLOAT;convert;$F;95| ((|x| $) ($ |Float|))
        (SPADCALL |x| (QREFELT $ 141))) 

(SDEFUN |DFLOAT;rationalApproximation;$NniF;96|
        ((|x| $) (|d| |NonNegativeInteger|) ($ |Fraction| (|Integer|)))
        (SPADCALL |x| |d| 10 (QREFELT $ 159))) 

(SDEFUN |DFLOAT;atan;3$;97| ((|x| $) (|y| $) ($ $))
        (SPROG ((|theta| ($)))
               (SEQ
                (COND
                 ((|eql_DF| |x| 0.0)
                  (COND
                   ((SPADCALL |y| 0.0 (QREFELT $ 161))
                    (|div_DF_I| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) 2))
                   ((|less_DF| |y| 0.0)
                    (|minus_DF|
                     (|div_DF_I| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) 2)))
                   (#1='T 0.0)))
                 (#1#
                  (SEQ
                   (LETT |theta| (|atan_DF| (|abs_DF| (|div_DF| |y| |x|)))
                         . #2=(|DFLOAT;atan;3$;97|))
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

(SDEFUN |DFLOAT;retract;$F;98| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPROG ((#1=#:G523 NIL))
               (SPADCALL |x|
                         (PROG1
                             (LETT #1# (- (SPADCALL (QREFELT $ 29)) 1)
                                   |DFLOAT;retract;$F;98|)
                           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                            #1#))
                         (SPADCALL (QREFELT $ 25)) (QREFELT $ 159)))) 

(SDEFUN |DFLOAT;retractIfCan;$U;99|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPROG ((#1=#:G528 NIL))
               (CONS 0
                     (SPADCALL |x|
                               (PROG1
                                   (LETT #1# (- (SPADCALL (QREFELT $ 29)) 1)
                                         |DFLOAT;retractIfCan;$U;99|)
                                 (|check_subtype| (>= #1# 0)
                                                  '(|NonNegativeInteger|) #1#))
                               (SPADCALL (QREFELT $ 25)) (QREFELT $ 159))))) 

(SDEFUN |DFLOAT;retract;$I;100| ((|x| $) ($ |Integer|))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (TRUNCATE |x|) |DFLOAT;retract;$I;100|)
                    (EXIT
                     (COND
                      ((|eql_DF| |x| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT))
                       |n|)
                      ('T (|error| "Not an integer"))))))) 

(SDEFUN |DFLOAT;retractIfCan;$U;101| ((|x| $) ($ |Union| (|Integer|) "failed"))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (TRUNCATE |x|) |DFLOAT;retractIfCan;$U;101|)
                    (EXIT
                     (COND
                      ((|eql_DF| |x| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT))
                       (CONS 0 |n|))
                      ('T (CONS 1 "failed"))))))) 

(SDEFUN |DFLOAT;sign;$I;102| ((|x| $) ($ |Integer|))
        (SPADCALL (FLOAT-SIGN |x| 1.0) (QREFELT $ 166))) 

(PUT '|DFLOAT;abs;2$;103| '|SPADreplace| '|abs_DF|) 

(SDEFUN |DFLOAT;abs;2$;103| ((|x| $) ($ $)) (|abs_DF| |x|)) 

(SDEFUN |DFLOAT;manexp|
        ((|x| $)
         ($ |Record| (|:| MANTISSA (|Integer|)) (|:| EXPONENT (|Integer|))))
        (SPROG
         ((|two53| (|PositiveInteger|))
          (|me| (|Record| (|:| |man| $) (|:| |exp| (|Integer|))))
          (#1=#:G547 NIL) (|s| (|Integer|)))
         (SEQ
          (EXIT
           (COND ((|zero?_DF| |x|) (CONS 0 0))
                 ('T
                  (SEQ
                   (LETT |s| (SPADCALL |x| (QREFELT $ 168))
                         . #2=(|DFLOAT;manexp|))
                   (LETT |x| (|abs_DF| |x|) . #2#)
                   (COND
                    ((SPADCALL |x| MOST-POSITIVE-DOUBLE-FLOAT (QREFELT $ 161))
                     (PROGN
                      (LETT #1#
                            (CONS
                             (+
                              (* |s|
                                 (SPADCALL MOST-POSITIVE-DOUBLE-FLOAT
                                           (QREFELT $ 27)))
                              1)
                             (SPADCALL MOST-POSITIVE-DOUBLE-FLOAT
                                       (QREFELT $ 28)))
                            . #2#)
                      (GO #3=#:G546))))
                   (LETT |me| (MANEXP |x|) . #2#)
                   (LETT |two53|
                         (SPADCALL (SPADCALL (QREFELT $ 25))
                                   (SPADCALL (QREFELT $ 29)) (QREFELT $ 170))
                         . #2#)
                   (EXIT
                    (CONS
                     (* |s|
                        (TRUNCATE
                         (SPADCALL |two53| (QCAR |me|) (QREFELT $ 31))))
                     (- (QCDR |me|) (SPADCALL (QREFELT $ 29)))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |DFLOAT;rationalApproximation;$2NniF;105|
        ((|f| $) (|d| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Fraction| (|Integer|)))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|#G148| #3=(|Integer|))
          (|#G147| #1#) (|q1| #4=(|Integer|)) (|q0| (|Integer|))
          (|#G146| #5=(|Integer|)) (|#G145| #4#) (|p1| #6=(|Integer|))
          (|p0| (|Integer|)) (|#G144| #5#) (|#G143| #6#) (#7=#:G578 NIL)
          (|q2| #5#) (|p2| #5#) (|r| #3#) (|q| #8=(|Integer|))
          (|#G142| (|Record| (|:| |quotient| #8#) (|:| |remainder| #3#)))
          (|tol| (|NonNegativeInteger|)) (|de| #1#) (#9=#:G569 NIL)
          (#10=#:G567 NIL) (BASE (|PositiveInteger|)) (|ex| #11=(|Integer|))
          (|nu| #2#)
          (|#G141| (|Record| (|:| MANTISSA #2#) (|:| EXPONENT #11#))))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G141| (|DFLOAT;manexp| |f| $)
                   . #12=(|DFLOAT;rationalApproximation;$2NniF;105|))
             (LETT |nu| (QCAR |#G141|) . #12#)
             (LETT |ex| (QCDR |#G141|) . #12#)
             |#G141|)
            (LETT BASE (SPADCALL (QREFELT $ 25)) . #12#)
            (EXIT
             (COND
              ((>= |ex| 0)
               (SPADCALL
                (* |nu|
                   (EXPT BASE
                         (PROG1 (LETT #10# |ex| . #12#)
                           (|check_subtype| (>= #10# 0) '(|NonNegativeInteger|)
                                            #10#))))
                (QREFELT $ 171)))
              (#13='T
               (SEQ
                (LETT |de|
                      (EXPT BASE
                            (PROG1 (LETT #9# (- |ex|) . #12#)
                              (|check_subtype| (>= #9# 0)
                                               '(|NonNegativeInteger|) #9#)))
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
                                     (LETT |#G142| (DIVIDE2 |s| |t|) . #12#)
                                     (LETT |q| (QCAR |#G142|) . #12#)
                                     (LETT |r| (QCDR |#G142|) . #12#)
                                     |#G142|)
                                    (LETT |p2| (+ (* |q| |p1|) |p0|) . #12#)
                                    (LETT |q2| (+ (* |q| |q1|) |q0|) . #12#)
                                    (COND
                                     ((OR (EQL |r| 0)
                                          (<
                                           (SPADCALL |tol|
                                                     (ABS
                                                      (- (* |nu| |q2|)
                                                         (* |de| |p2|)))
                                                     (QREFELT $ 173))
                                           (* |de| (ABS |p2|))))
                                      (EXIT
                                       (PROGN
                                        (LETT #7#
                                              (SPADCALL |p2| |q2|
                                                        (QREFELT $ 172))
                                              . #12#)
                                        (GO #14=#:G577)))))
                                    (PROGN
                                     (LETT |#G143| |p1| . #12#)
                                     (LETT |#G144| |p2| . #12#)
                                     (LETT |p0| |#G143| . #12#)
                                     (LETT |p1| |#G144| . #12#))
                                    (PROGN
                                     (LETT |#G145| |q1| . #12#)
                                     (LETT |#G146| |q2| . #12#)
                                     (LETT |q0| |#G145| . #12#)
                                     (LETT |q1| |#G146| . #12#))
                                    (EXIT
                                     (PROGN
                                      (LETT |#G147| |t| . #12#)
                                      (LETT |#G148| |r| . #12#)
                                      (LETT |s| |#G147| . #12#)
                                      (LETT |t| |#G148| . #12#))))
                                   NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #14# (EXIT #7#)))) 

(SDEFUN |DFLOAT;^;$F$;106| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPROG ((#1=#:G588 NIL) (|d| (|Integer|)) (|n| (|Integer|)))
               (SEQ
                (EXIT
                 (COND
                  ((|zero?_DF| |x|)
                   (COND
                    ((SPADCALL |r| (QREFELT $ 174))
                     (|error| "0^0 is undefined"))
                    ((SPADCALL |r| (QREFELT $ 175)) (|error| "division by 0"))
                    (#2='T 0.0)))
                  ((OR (SPADCALL |r| (QREFELT $ 174)) (|eql_DF| |x| 1.0)) 1.0)
                  ('T
                   (COND
                    ((SPADCALL |r| (|spadConstant| $ 176) (QREFELT $ 177)) |x|)
                    (#2#
                     (SEQ
                      (LETT |n| (SPADCALL |r| (QREFELT $ 178))
                            . #3=(|DFLOAT;^;$F$;106|))
                      (LETT |d| (SPADCALL |r| (QREFELT $ 179)) . #3#)
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
                                               (QREFELT $ 180)))
                                    . #3#)
                              (GO #4=#:G587)))
                            (#2#
                             (PROGN
                              (LETT #1#
                                    (SPADCALL (|minus_DF| |x|) |r|
                                              (QREFELT $ 180))
                                    . #3#)
                              (GO #4#)))))
                          (#2# (|error| "negative root"))))
                        ((EQL |d| 2)
                         (|expt_DF_I| (SPADCALL |x| (QREFELT $ 58)) |n|))
                        (#2#
                         (SPADCALL |x|
                                   (|div_DF|
                                    (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT)
                                    (FLOAT |d| MOST-POSITIVE-DOUBLE-FLOAT))
                                   (QREFELT $ 62)))))))))))
                #4# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |DoubleFloat;|)) 

(DEFUN |DoubleFloat| ()
  (SPROG NIL
         (PROG (#1=#:G602)
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
          (LETT $ (GETREFV 195) . #1#)
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
          (QSETREFV $ 77
                    (|div_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)))
          $))) 

(MAKEPROP '|DoubleFloat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|format| (|String|)
              |DFLOAT;doubleFloatFormat;2S;1| (|OpenMathEncoding|)
              (0 . |OMencodingXML|) (|OpenMathDevice|) (4 . |OMopenString|)
              (|Void|) (10 . |OMputObject|) (|DoubleFloat|) (15 . |OMputFloat|)
              (21 . |OMputEndObject|) (26 . |OMclose|) |DFLOAT;OMwrite;$S;2|
              (|Boolean|) |DFLOAT;OMwrite;$BS;3| |DFLOAT;OMwrite;Omd$V;4|
              |DFLOAT;OMwrite;Omd$BV;5| (|PositiveInteger|) |DFLOAT;base;Pi;7|
              (|Integer|) |DFLOAT;mantissa;$I;8| |DFLOAT;exponent;$I;9|
              |DFLOAT;precision;Pi;10| |DFLOAT;log2;2$;40| (31 . *)
              |DFLOAT;bits;Pi;11| |DFLOAT;max;$;12| |DFLOAT;min;$;13|
              |DFLOAT;order;$I;14|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |DFLOAT;Zero;$;15|) $))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |DFLOAT;One;$;16|) $))
              |DFLOAT;exp1;$;17| |DFLOAT;pi;$;18| (37 . >=) (|OutputForm|)
              (43 . |message|) (48 . -) |DFLOAT;coerce;$Of;19| (|InputForm|)
              (53 . |convert|) |DFLOAT;convert;$If;20| |DFLOAT;<;2$B;21|
              |DFLOAT;-;2$;22| |DFLOAT;+;3$;23| |DFLOAT;-;3$;24|
              |DFLOAT;*;3$;25| |DFLOAT;*;I2$;26| |DFLOAT;max;3$;27|
              |DFLOAT;min;3$;28| |DFLOAT;=;2$B;29| |DFLOAT;/;$I$;30|
              |DFLOAT;sqrt;2$;31| |DFLOAT;qsqrt;2$;32| |DFLOAT;log10;2$;33|
              |DFLOAT;^;$I$;34| |DFLOAT;^;3$;35| |DFLOAT;coerce;I$;36|
              |DFLOAT;exp;2$;37| |DFLOAT;log;2$;38| |DFLOAT;qlog;2$;39|
              |DFLOAT;sin;2$;41| |DFLOAT;cos;2$;42| |DFLOAT;tan;2$;43|
              |DFLOAT;cot;2$;44| |DFLOAT;sec;2$;45| |DFLOAT;csc;2$;46|
              |DFLOAT;asin;2$;47| |DFLOAT;acos;2$;48| |DFLOAT;atan;2$;49|
              |DFLOAT;acsc;2$;50| '|pi_half| |DFLOAT;acot;2$;51|
              |DFLOAT;asec;2$;52| |DFLOAT;sinh;2$;53| |DFLOAT;cosh;2$;54|
              |DFLOAT;tanh;2$;55| |DFLOAT;csch;2$;56| |DFLOAT;coth;2$;57|
              |DFLOAT;sech;2$;58| |DFLOAT;asinh;2$;59| |DFLOAT;acosh;2$;60|
              |DFLOAT;atanh;2$;61| |DFLOAT;acsch;2$;62| |DFLOAT;acoth;2$;63|
              |DFLOAT;asech;2$;64| |DFLOAT;/;3$;65| |DFLOAT;negative?;$B;66|
              |DFLOAT;zero?;$B;67| (|HashState|) |DFLOAT;hashUpdate!;Hs$Hs;68|
              (|Union| $ '"failed") |DFLOAT;recip;$U;69|
              |DFLOAT;differentiate;2$;70| (|DoubleFloatSpecialFunctions|)
              (58 . |airyAi|) |DFLOAT;airyAi;2$;71| (63 . |airyBi|)
              |DFLOAT;airyBi;2$;72| (68 . |besselI|) |DFLOAT;besselI;3$;73|
              (74 . |besselJ|) |DFLOAT;besselJ;3$;74| (80 . |besselK|)
              |DFLOAT;besselK;3$;75| (86 . |besselY|) |DFLOAT;besselY;3$;76|
              (92 . |Beta|) |DFLOAT;Beta;3$;77| (98 . |digamma|)
              |DFLOAT;digamma;2$;78| (103 . |Gamma|) |DFLOAT;Gamma;2$;79|
              (|Union| 26 '"failed") (108 . |retractIfCan|)
              (|NonNegativeInteger|) (113 . |polygamma|)
              |DFLOAT;polygamma;3$;80| (|FloatSpecialFunctions|)
              (119 . |lambertW|) |DFLOAT;lambertW;2$;81|
              (|DoubleFloatEllipticIntegrals|) (124 . |ellipticF|)
              |DFLOAT;ellipticF;3$;82| (130 . |ellipticK|)
              |DFLOAT;ellipticK;2$;83| (135 . |ellipticE|)
              |DFLOAT;ellipticE;3$;84| (141 . |ellipticE|)
              |DFLOAT;ellipticE;2$;85| (146 . |ellipticPi|)
              |DFLOAT;ellipticPi;4$;86| (|Float|) (153 . |bits|) (157 . |bits|)
              (162 . |convert|) (|FloatEllipticFunctions|) (167 . |jacobiSn|)
              (173 . |convert|) |DFLOAT;jacobiSn;3$;87| (178 . |jacobiCn|)
              |DFLOAT;jacobiCn;3$;88| (184 . |jacobiDn|)
              |DFLOAT;jacobiDn;3$;89| (190 . |weierstrassP|)
              |DFLOAT;weierstrassP;4$;90| (197 . |weierstrassPPrime|)
              |DFLOAT;weierstrassPPrime;4$;91| |DFLOAT;wholePart;$I;92|
              |DFLOAT;float;2IPi$;93| |DFLOAT;convert;2$;94|
              |DFLOAT;convert;$F;95| (|Fraction| 26)
              |DFLOAT;rationalApproximation;$2NniF;105|
              |DFLOAT;rationalApproximation;$NniF;96| (204 . >)
              |DFLOAT;atan;3$;97| |DFLOAT;retract;$F;98|
              (|Union| 158 '"failed") |DFLOAT;retractIfCan;$U;99|
              |DFLOAT;retract;$I;100| |DFLOAT;retractIfCan;$U;101|
              |DFLOAT;sign;$I;102| |DFLOAT;abs;2$;103| (210 . ^)
              (216 . |coerce|) (221 . /) (227 . *) (233 . |zero?|)
              (238 . |negative?|) (243 . |One|) (247 . =) (253 . |numer|)
              (258 . |denom|) |DFLOAT;^;$F$;106| (|List| $)
              (|PatternMatchResult| 138 $) (|Pattern| 138) (|Factored| $)
              (|Union| 181 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 187 '#1#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 181) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|SingleInteger|))
           '#(~= 263 |zero?| 269 |wholePart| 274 |whittakerW| 279 |whittakerM|
              286 |weierstrassZeta| 293 |weierstrassSigma| 300
              |weierstrassPPrime| 307 |weierstrassP| 314 |weberE| 321
              |unitNormal| 327 |unitCanonical| 332 |unit?| 337 |truncate| 342
              |toString| 347 |tanh| 353 |tan| 358 |subtractIfCan| 363 |struveL|
              369 |struveH| 375 |squareFreePart| 381 |squareFree| 386 |sqrt|
              391 |smaller?| 396 |sizeLess?| 402 |sinh| 408 |sin| 413 |sign|
              418 |sech| 423 |sec| 428 |sample| 433 |round| 437 |riemannZeta|
              442 |retractIfCan| 447 |retract| 457 |rem| 467 |recip| 473
              |rationalApproximation| 478 |quo| 491 |qsqrt| 497 |qlog| 502
              |principalIdeal| 507 |prime?| 512 |precision| 517 |positive?| 526
              |polylog| 531 |polygamma| 537 |pi| 543 |patternMatch| 547 |order|
              554 |opposite?| 559 |one?| 565 |nthRoot| 570 |norm| 576
              |negative?| 581 |multiEuclidean| 586 |min| 592 |meijerG| 602
              |max| 611 |mantissa| 621 |lommelS2| 626 |lommelS1| 633 |log2| 640
              |log10| 645 |log| 650 |lerchPhi| 655 |legendreQ| 662 |legendreP|
              669 |lcmCoef| 676 |lcm| 682 |latex| 693 |lambertW| 698 |kummerU|
              703 |kummerM| 710 |kelvinKer| 717 |kelvinKei| 723 |kelvinBer| 729
              |kelvinBei| 735 |jacobiZeta| 741 |jacobiTheta| 747 |jacobiSn| 753
              |jacobiDn| 759 |jacobiCn| 765 |inv| 771 |increasePrecision| 776
              |hypergeometricF| 781 |hashUpdate!| 788 |hash| 794 |hankelH2| 799
              |hankelH1| 805 |gcdPolynomial| 811 |gcd| 817 |fractionPart| 828
              |floor| 833 |float| 838 |factor| 851 |extendedEuclidean| 856
              |exquo| 869 |expressIdealMember| 875 |exponent| 881 |exp1| 886
              |exp| 890 |euclideanSize| 895 |ellipticPi| 900 |ellipticK| 907
              |ellipticF| 912 |ellipticE| 918 |doubleFloatFormat| 929 |divide|
              934 |digits| 940 |digamma| 949 |differentiate| 954
              |decreasePrecision| 965 |csch| 970 |csc| 975 |coth| 980 |cot| 985
              |cosh| 990 |cos| 995 |convert| 1000 |coerce| 1020
              |characteristic| 1050 |ceiling| 1054 |bits| 1059 |besselY| 1068
              |besselK| 1074 |besselJ| 1080 |besselI| 1086 |base| 1092 |atanh|
              1096 |atan| 1101 |associates?| 1112 |asinh| 1118 |asin| 1123
              |asech| 1128 |asec| 1133 |annihilate?| 1138 |angerJ| 1144
              |airyBiPrime| 1150 |airyBi| 1155 |airyAiPrime| 1160 |airyAi| 1165
              |acsch| 1170 |acsc| 1175 |acoth| 1180 |acot| 1185 |acosh| 1190
              |acos| 1195 |abs| 1200 ^ 1205 |Zero| 1235 |One| 1239 |OMwrite|
              1243 |Gamma| 1267 D 1278 |Beta| 1289 >= 1295 > 1301 = 1307 <=
              1313 < 1319 / 1325 - 1337 + 1348 * 1354)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|FloatingPointSystem&| |RealNumberSystem&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| |DivisionRing&| NIL |OrderedRing&| |Algebra&| NIL
                |Algebra&| |DifferentialRing&| NIL |Module&| NIL |EntireRing&|
                |Module&| NIL NIL NIL |Ring&| NIL NIL NIL NIL |Rng&| NIL NIL
                |AbelianGroup&| NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |Monoid&| NIL NIL NIL |SemiGroup&| |AbelianSemiGroup&|
                |TranscendentalFunctionCategory&| NIL |SetCategory&| NIL NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL NIL NIL |RadicalCategory&|
                |RetractableTo&| |RetractableTo&| NIL NIL |PartialOrder&| NIL
                NIL NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|FloatingPointSystem|) (|RealNumberSystem|) (|Field|)
                 (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|OrderedRing|) (|Algebra| 158)
                 (|LeftOreRing|) (|Algebra| $$) (|DifferentialRing|)
                 (|CharacteristicZero|) (|Module| 158) (|CommutativeRing|)
                 (|EntireRing|) (|Module| $$) (|OrderedAbelianGroup|)
                 (|BiModule| 158 158) (|BiModule| $$ $$) (|Ring|)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| 158)
                 (|LeftModule| 158) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedSet|) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|PatternMatchable| 138) (|Comparable|)
                 (|SemiGroup|) (|AbelianSemiGroup|)
                 (|TranscendentalFunctionCategory|) (|RealConstant|)
                 (|SetCategory|) (|ConvertibleTo| 45)
                 (|SpecialFunctionCategory|) (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|OpenMath|) (|Approximate|)
                 (|ConvertibleTo| 183) (|RadicalCategory|)
                 (|RetractableTo| 158) (|RetractableTo| 26)
                 (|ConvertibleTo| 138) (|ConvertibleTo| 15) (|PartialOrder|)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 41))
              (|makeByteWordVec2| 194
                                  '(0 9 0 10 2 11 0 7 9 12 1 11 13 0 14 2 11 13
                                    0 15 16 1 11 13 0 17 1 11 13 0 18 2 0 0 24
                                    0 31 2 0 20 0 0 40 1 41 0 7 42 1 41 0 0 43
                                    1 45 0 15 46 1 100 15 15 101 1 100 15 15
                                    103 2 100 15 15 15 105 2 100 15 15 15 107 2
                                    100 15 15 15 109 2 100 15 15 15 111 2 100
                                    15 15 15 113 1 100 15 15 115 1 100 15 15
                                    117 1 15 119 0 120 2 100 15 121 15 122 1
                                    124 15 15 125 2 127 15 15 15 128 1 127 15
                                    15 130 2 127 15 15 15 132 1 127 15 15 134 3
                                    127 15 15 15 15 136 0 138 24 139 1 138 24
                                    24 140 1 138 0 15 141 2 142 138 138 138 143
                                    1 138 15 0 144 2 142 138 138 138 146 2 142
                                    138 138 138 148 3 142 138 138 138 138 150 3
                                    142 138 138 138 138 152 2 0 20 0 0 161 2 24
                                    0 0 24 170 1 158 0 26 171 2 158 0 26 26 172
                                    2 26 0 121 0 173 1 158 20 0 174 1 158 20 0
                                    175 0 158 0 176 2 158 20 0 0 177 1 158 26 0
                                    178 1 158 26 0 179 2 0 20 0 0 1 1 0 20 0 94
                                    1 0 26 0 154 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3
                                    0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 153 3
                                    0 0 0 0 0 151 2 0 0 0 0 1 1 0 193 0 1 1 0 0
                                    0 1 1 0 20 0 1 1 0 0 0 1 2 0 7 0 121 1 1 0
                                    0 0 82 1 0 0 0 69 2 0 97 0 0 1 2 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 0 0 1 1 0 184 0 1 1 0 0 0
                                    58 2 0 20 0 0 1 2 0 20 0 0 1 1 0 0 0 80 1 0
                                    0 0 67 1 0 26 0 168 1 0 0 0 85 1 0 0 0 71 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 164 0 165 1 0
                                    119 0 167 1 0 158 0 163 1 0 26 0 166 2 0 0
                                    0 0 1 1 0 97 0 98 3 0 158 0 121 121 159 2 0
                                    158 0 121 160 2 0 0 0 0 1 1 0 0 0 59 1 0 0
                                    0 66 1 0 190 181 1 1 0 20 0 1 1 1 24 24 1 0
                                    0 24 29 1 0 20 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    123 0 0 0 39 3 0 182 0 183 182 1 1 0 26 0
                                    35 2 0 20 0 0 1 1 0 20 0 1 2 0 0 0 26 1 1 0
                                    0 0 1 1 0 20 0 93 2 0 185 181 0 1 0 2 0 34
                                    2 0 0 0 0 55 5 3 0 181 181 181 181 0 1 0 2
                                    0 33 2 0 0 0 0 54 1 0 26 0 27 3 0 0 0 0 0 1
                                    3 0 0 0 0 0 1 1 0 0 0 30 1 0 0 0 60 1 0 0 0
                                    65 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 2 0 192 0 0 1 1 0 0 181 1 2 0 0 0 0 1 1 0
                                    7 0 1 1 0 0 0 126 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 145
                                    2 0 0 0 0 149 2 0 0 0 0 147 1 0 0 0 1 1 1
                                    24 26 1 3 3 0 181 181 0 1 2 0 95 95 0 96 1
                                    0 194 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 191
                                    191 191 1 2 0 0 0 0 1 1 0 0 181 1 1 0 0 0 1
                                    1 0 0 0 1 3 0 0 26 26 24 155 2 0 0 26 26 1
                                    1 0 184 0 1 2 0 186 0 0 1 3 0 188 0 0 0 1 2
                                    0 97 0 0 1 2 0 185 181 0 1 1 0 26 0 28 0 0
                                    0 38 1 0 0 0 64 1 0 121 0 1 3 0 0 0 0 0 137
                                    1 0 0 0 131 2 0 0 0 0 129 2 0 0 0 0 133 1 0
                                    0 0 135 1 0 7 7 8 2 0 189 0 0 1 1 1 24 24 1
                                    0 0 24 1 1 0 0 0 116 1 0 0 0 99 2 0 0 0 121
                                    1 1 1 24 26 1 1 0 0 0 83 1 0 0 0 72 1 0 0 0
                                    84 1 0 0 0 70 1 0 0 0 81 1 0 0 0 68 1 0 45
                                    0 47 1 0 183 0 1 1 0 15 0 156 1 0 138 0 157
                                    1 0 0 158 1 1 0 0 26 63 1 0 0 158 1 1 0 0 0
                                    1 1 0 0 26 63 1 0 41 0 44 0 0 121 1 1 0 0 0
                                    1 1 1 24 24 1 0 0 24 32 2 0 0 0 0 112 2 0 0
                                    0 0 110 2 0 0 0 0 108 2 0 0 0 0 106 0 0 24
                                    25 1 0 0 0 88 2 0 0 0 0 162 1 0 0 0 75 2 0
                                    20 0 0 1 1 0 0 0 86 1 0 0 0 73 1 0 0 0 91 1
                                    0 0 0 79 2 0 20 0 0 1 2 0 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 104 1 0 0 0 1 1 0 0 0 102 1 0 0 0
                                    89 1 0 0 0 76 1 0 0 0 90 1 0 0 0 78 1 0 0 0
                                    87 1 0 0 0 74 1 0 0 0 169 2 0 0 0 0 62 2 0
                                    0 0 158 180 2 0 0 0 26 61 2 0 0 0 121 1 2 0
                                    0 0 24 1 0 0 0 36 0 0 0 37 2 0 13 11 0 22 3
                                    0 13 11 0 20 23 2 0 7 0 20 21 1 0 7 0 19 2
                                    0 0 0 0 1 1 0 0 0 118 1 0 0 0 1 2 0 0 0 121
                                    1 2 0 0 0 0 114 2 0 20 0 0 40 2 0 20 0 0
                                    161 2 0 20 0 0 56 2 0 20 0 0 1 2 0 20 0 0
                                    48 2 0 0 0 26 57 2 0 0 0 0 92 2 0 0 0 0 51
                                    1 0 0 0 49 2 0 0 0 0 50 2 0 0 158 0 1 2 0 0
                                    0 158 1 2 0 0 0 0 52 2 0 0 26 0 53 2 0 0
                                    121 0 1 2 0 0 24 0 31)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloat| 'NILADIC T) 
