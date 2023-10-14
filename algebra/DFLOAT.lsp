
(/VERSIONCHECK 2) 

(DEFUN |DFLOAT;doubleFloatFormat;2S;1| (|s| $)
  (PROG (|ss|)
    (RETURN
     (SEQ (LETT |ss| (QREFELT $ 6) |DFLOAT;doubleFloatFormat;2S;1|)
          (SETELT $ 6 |s|) (EXIT |ss|))))) 

(DEFUN |DFLOAT;OMwrite;$S;2| (|x| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|DFLOAT;OMwrite;$S;2|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 10)) (QREFELT $ 12))
                . #1#)
          (SPADCALL |dev| (QREFELT $ 14)) (SPADCALL |dev| |x| (QREFELT $ 16))
          (SPADCALL |dev| (QREFELT $ 17)) (SPADCALL |dev| (QREFELT $ 18))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |DFLOAT;OMwrite;$BS;3| (|x| |wholeObj| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|DFLOAT;OMwrite;$BS;3|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 10)) (QREFELT $ 12))
                . #1#)
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 14))))
          (SPADCALL |dev| |x| (QREFELT $ 16))
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 17))))
          (SPADCALL |dev| (QREFELT $ 18))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |DFLOAT;OMwrite;Omd$V;4| (|dev| |x| $)
  (SEQ (SPADCALL |dev| (QREFELT $ 14)) (SPADCALL |dev| |x| (QREFELT $ 16))
       (EXIT (SPADCALL |dev| (QREFELT $ 17))))) 

(DEFUN |DFLOAT;OMwrite;Omd$BV;5| (|dev| |x| |wholeObj| $)
  (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 14))))
       (SPADCALL |dev| |x| (QREFELT $ 16))
       (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 17))))))) 

(PUT '|DFLOAT;checkComplex| '|SPADreplace| '|c_to_r|) 

(DEFUN |DFLOAT;checkComplex| (|x| $) (|c_to_r| |x|)) 

(PUT '|DFLOAT;base;Pi;7| '|SPADreplace| '(XLAM NIL (FLOAT-RADIX 0.0))) 

(DEFUN |DFLOAT;base;Pi;7| ($) (FLOAT-RADIX 0.0)) 

(DEFUN |DFLOAT;mantissa;$I;8| (|x| $) (QCAR (|DFLOAT;manexp| |x| $))) 

(DEFUN |DFLOAT;exponent;$I;9| (|x| $) (QCDR (|DFLOAT;manexp| |x| $))) 

(PUT '|DFLOAT;precision;Pi;10| '|SPADreplace| '(XLAM NIL (FLOAT-DIGITS 0.0))) 

(DEFUN |DFLOAT;precision;Pi;10| ($) (FLOAT-DIGITS 0.0)) 

(DEFUN |DFLOAT;bits;Pi;11| ($)
  (PROG (#1=#:G445)
    (RETURN
     (COND ((EQL (FLOAT-RADIX 0.0) 2) (FLOAT-DIGITS 0.0))
           ((EQL (FLOAT-RADIX 0.0) 16) (* 4 (FLOAT-DIGITS 0.0)))
           ('T
            (PROG1
                (LETT #1#
                      (TRUNCATE
                       (SPADCALL (FLOAT-DIGITS 0.0)
                                 (SPADCALL
                                  (FLOAT (FLOAT-RADIX 0.0)
                                         MOST-POSITIVE-DOUBLE-FLOAT)
                                  (QREFELT $ 30))
                                 (QREFELT $ 31)))
                      |DFLOAT;bits;Pi;11|)
              (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))))) 

(PUT '|DFLOAT;max;$;12| '|SPADreplace| '(XLAM NIL MOST-POSITIVE-DOUBLE-FLOAT)) 

(DEFUN |DFLOAT;max;$;12| ($) MOST-POSITIVE-DOUBLE-FLOAT) 

(PUT '|DFLOAT;min;$;13| '|SPADreplace| '(XLAM NIL MOST-NEGATIVE-DOUBLE-FLOAT)) 

(DEFUN |DFLOAT;min;$;13| ($) MOST-NEGATIVE-DOUBLE-FLOAT) 

(DEFUN |DFLOAT;order;$I;14| (|a| $)
  (- (+ (FLOAT-DIGITS 0.0) (SPADCALL |a| (QREFELT $ 28))) 1)) 

(PUT '|DFLOAT;Zero;$;15| '|SPADreplace|
     '(XLAM NIL (FLOAT 0 MOST-POSITIVE-DOUBLE-FLOAT))) 

(DEFUN |DFLOAT;Zero;$;15| ($) (FLOAT 0 MOST-POSITIVE-DOUBLE-FLOAT)) 

(PUT '|DFLOAT;One;$;16| '|SPADreplace|
     '(XLAM NIL (FLOAT 1 MOST-POSITIVE-DOUBLE-FLOAT))) 

(DEFUN |DFLOAT;One;$;16| ($) (FLOAT 1 MOST-POSITIVE-DOUBLE-FLOAT)) 

(DEFUN |DFLOAT;exp1;$;17| ($)
  (|div_DF| (FLOAT 534625820200 MOST-POSITIVE-DOUBLE-FLOAT)
            (FLOAT 196677847971 MOST-POSITIVE-DOUBLE-FLOAT))) 

(PUT '|DFLOAT;pi;$;18| '|SPADreplace|
     '(XLAM NIL (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT))) 

(DEFUN |DFLOAT;pi;$;18| ($) (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)) 

(DEFUN |DFLOAT;coerce;$Of;19| (|x| $)
  (COND
   ((SPADCALL |x| 0.0 (QREFELT $ 40))
    (SPADCALL (FORMAT NIL (QREFELT $ 6) |x|) (QREFELT $ 42)))
   ('T
    (SPADCALL
     (SPADCALL (FORMAT NIL (QREFELT $ 6) (|minus_DF| |x|)) (QREFELT $ 42))
     (QREFELT $ 43))))) 

(DEFUN |DFLOAT;convert;$If;20| (|x| $) (SPADCALL |x| (QREFELT $ 46))) 

(PUT '|DFLOAT;<;2$B;21| '|SPADreplace| '|less_DF|) 

(DEFUN |DFLOAT;<;2$B;21| (|x| |y| $) (|less_DF| |x| |y|)) 

(PUT '|DFLOAT;-;2$;22| '|SPADreplace| '|minus_DF|) 

(DEFUN |DFLOAT;-;2$;22| (|x| $) (|minus_DF| |x|)) 

(PUT '|DFLOAT;+;3$;23| '|SPADreplace| '|add_DF|) 

(DEFUN |DFLOAT;+;3$;23| (|x| |y| $) (|add_DF| |x| |y|)) 

(PUT '|DFLOAT;-;3$;24| '|SPADreplace| '|sub_DF|) 

(DEFUN |DFLOAT;-;3$;24| (|x| |y| $) (|sub_DF| |x| |y|)) 

(PUT '|DFLOAT;*;3$;25| '|SPADreplace| '|mul_DF|) 

(DEFUN |DFLOAT;*;3$;25| (|x| |y| $) (|mul_DF| |x| |y|)) 

(PUT '|DFLOAT;*;I2$;26| '|SPADreplace| '(XLAM (|i| |x|) (|mul_DF_I| |x| |i|))) 

(DEFUN |DFLOAT;*;I2$;26| (|i| |x| $) (|mul_DF_I| |x| |i|)) 

(PUT '|DFLOAT;max;3$;27| '|SPADreplace| '|max_DF|) 

(DEFUN |DFLOAT;max;3$;27| (|x| |y| $) (|max_DF| |x| |y|)) 

(PUT '|DFLOAT;min;3$;28| '|SPADreplace| '|min_DF|) 

(DEFUN |DFLOAT;min;3$;28| (|x| |y| $) (|min_DF| |x| |y|)) 

(PUT '|DFLOAT;=;2$B;29| '|SPADreplace| '|eql_DF|) 

(DEFUN |DFLOAT;=;2$B;29| (|x| |y| $) (|eql_DF| |x| |y|)) 

(PUT '|DFLOAT;/;$I$;30| '|SPADreplace| '|div_DF_I|) 

(DEFUN |DFLOAT;/;$I$;30| (|x| |i| $) (|div_DF_I| |x| |i|)) 

(DEFUN |DFLOAT;sqrt;2$;31| (|x| $) (|DFLOAT;checkComplex| (|sqrt_DF| |x|) $)) 

(PUT '|DFLOAT;qsqrt;2$;32| '|SPADreplace| '|qsqrt_DF|) 

(DEFUN |DFLOAT;qsqrt;2$;32| (|x| $) (|qsqrt_DF| |x|)) 

(DEFUN |DFLOAT;log10;2$;33| (|x| $) (|DFLOAT;checkComplex| (LOG10 |x|) $)) 

(PUT '|DFLOAT;^;$I$;34| '|SPADreplace| '|expt_DF_I|) 

(DEFUN |DFLOAT;^;$I$;34| (|x| |i| $) (|expt_DF_I| |x| |i|)) 

(DEFUN |DFLOAT;^;3$;35| (|x| |y| $)
  (|DFLOAT;checkComplex| (|expt_DF| |x| |y|) $)) 

(PUT '|DFLOAT;coerce;I$;36| '|SPADreplace|
     '(XLAM (|i|) (FLOAT |i| MOST-POSITIVE-DOUBLE-FLOAT))) 

(DEFUN |DFLOAT;coerce;I$;36| (|i| $) (FLOAT |i| MOST-POSITIVE-DOUBLE-FLOAT)) 

(PUT '|DFLOAT;exp;2$;37| '|SPADreplace| '|exp_DF|) 

(DEFUN |DFLOAT;exp;2$;37| (|x| $) (|exp_DF| |x|)) 

(DEFUN |DFLOAT;log;2$;38| (|x| $) (|DFLOAT;checkComplex| (|log_DF| |x|) $)) 

(PUT '|DFLOAT;qlog;2$;39| '|SPADreplace| '|qlog_DF|) 

(DEFUN |DFLOAT;qlog;2$;39| (|x| $) (|qlog_DF| |x|)) 

(DEFUN |DFLOAT;log2;2$;40| (|x| $) (|DFLOAT;checkComplex| (LOG2 |x|) $)) 

(PUT '|DFLOAT;sin;2$;41| '|SPADreplace| '|sin_DF|) 

(DEFUN |DFLOAT;sin;2$;41| (|x| $) (|sin_DF| |x|)) 

(PUT '|DFLOAT;cos;2$;42| '|SPADreplace| '|cos_DF|) 

(DEFUN |DFLOAT;cos;2$;42| (|x| $) (|cos_DF| |x|)) 

(PUT '|DFLOAT;tan;2$;43| '|SPADreplace| '|tan_DF|) 

(DEFUN |DFLOAT;tan;2$;43| (|x| $) (|tan_DF| |x|)) 

(PUT '|DFLOAT;cot;2$;44| '|SPADreplace| 'COT) 

(DEFUN |DFLOAT;cot;2$;44| (|x| $) (COT |x|)) 

(DEFUN |DFLOAT;sec;2$;45| (|x| $) (|div_DF| 1.0 (|cos_DF| |x|))) 

(DEFUN |DFLOAT;csc;2$;46| (|x| $) (|div_DF| 1.0 (|sin_DF| |x|))) 

(DEFUN |DFLOAT;asin;2$;47| (|x| $) (|DFLOAT;checkComplex| (ASIN |x|) $)) 

(DEFUN |DFLOAT;acos;2$;48| (|x| $) (|DFLOAT;checkComplex| (ACOS |x|) $)) 

(PUT '|DFLOAT;atan;2$;49| '|SPADreplace| '|atan_DF|) 

(DEFUN |DFLOAT;atan;2$;49| (|x| $) (|atan_DF| |x|)) 

(DEFUN |DFLOAT;acsc;2$;50| (|x| $) (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 73))) 

(DEFUN |DFLOAT;acot;2$;51| (|x| $)
  (COND
   ((|less_DF| 0.0 |x|)
    (COND ((|less_DF| |x| 1.0) (|sub_DF| (QREFELT $ 77) (|atan_DF| |x|)))
          ('T (|atan_DF| (|div_DF| 1.0 |x|)))))
   ((NULL (|less_DF| (|minus_DF| 1.0) |x|))
    (|sub_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
              (|atan_DF| (|minus_DF| (|div_DF| 1.0 |x|)))))
   ('T (|add_DF| (QREFELT $ 77) (|atan_DF| (|minus_DF| |x|)))))) 

(DEFUN |DFLOAT;asec;2$;52| (|x| $) (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 74))) 

(PUT '|DFLOAT;sinh;2$;53| '|SPADreplace| '|sinh_DF|) 

(DEFUN |DFLOAT;sinh;2$;53| (|x| $) (|sinh_DF| |x|)) 

(PUT '|DFLOAT;cosh;2$;54| '|SPADreplace| '|cosh_DF|) 

(DEFUN |DFLOAT;cosh;2$;54| (|x| $) (|cosh_DF| |x|)) 

(PUT '|DFLOAT;tanh;2$;55| '|SPADreplace| '|tanh_DF|) 

(DEFUN |DFLOAT;tanh;2$;55| (|x| $) (|tanh_DF| |x|)) 

(DEFUN |DFLOAT;csch;2$;56| (|x| $) (|div_DF| 1.0 (|sinh_DF| |x|))) 

(DEFUN |DFLOAT;coth;2$;57| (|x| $) (|div_DF| 1.0 (|tanh_DF| |x|))) 

(DEFUN |DFLOAT;sech;2$;58| (|x| $) (|div_DF| 1.0 (|cosh_DF| |x|))) 

(PUT '|DFLOAT;asinh;2$;59| '|SPADreplace| 'ASINH) 

(DEFUN |DFLOAT;asinh;2$;59| (|x| $) (ASINH |x|)) 

(DEFUN |DFLOAT;acosh;2$;60| (|x| $) (|DFLOAT;checkComplex| (ACOSH |x|) $)) 

(DEFUN |DFLOAT;atanh;2$;61| (|x| $) (|DFLOAT;checkComplex| (ATANH |x|) $)) 

(DEFUN |DFLOAT;acsch;2$;62| (|x| $) (ASINH (|div_DF| 1.0 |x|))) 

(DEFUN |DFLOAT;acoth;2$;63| (|x| $)
  (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 88))) 

(DEFUN |DFLOAT;asech;2$;64| (|x| $)
  (SPADCALL (|div_DF| 1.0 |x|) (QREFELT $ 87))) 

(PUT '|DFLOAT;/;3$;65| '|SPADreplace| '|div_DF|) 

(DEFUN |DFLOAT;/;3$;65| (|x| |y| $) (|div_DF| |x| |y|)) 

(PUT '|DFLOAT;negative?;$B;66| '|SPADreplace| '|negative?_DF|) 

(DEFUN |DFLOAT;negative?;$B;66| (|x| $) (|negative?_DF| |x|)) 

(PUT '|DFLOAT;zero?;$B;67| '|SPADreplace| '|zero?_DF|) 

(DEFUN |DFLOAT;zero?;$B;67| (|x| $) (|zero?_DF| |x|)) 

(DEFUN |DFLOAT;hashUpdate!;Hs$Hs;68| (|hs| |s| $)
  (HASHSTATE-UPDATE |hs| (SXHASH |s|))) 

(DEFUN |DFLOAT;recip;$U;69| (|x| $)
  (COND ((|zero?_DF| |x|) (CONS 1 "failed")) ('T (CONS 0 (|div_DF| 1.0 |x|))))) 

(PUT '|DFLOAT;differentiate;2$;70| '|SPADreplace| '(XLAM (|x|) 0.0)) 

(DEFUN |DFLOAT;differentiate;2$;70| (|x| $) 0.0) 

(DEFUN |DFLOAT;airyAi;2$;71| (|x| $) (SPADCALL |x| (QREFELT $ 101))) 

(DEFUN |DFLOAT;airyBi;2$;72| (|x| $) (SPADCALL |x| (QREFELT $ 103))) 

(DEFUN |DFLOAT;besselI;3$;73| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 105))) 

(DEFUN |DFLOAT;besselJ;3$;74| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 107))) 

(DEFUN |DFLOAT;besselK;3$;75| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 109))) 

(DEFUN |DFLOAT;besselY;3$;76| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 111))) 

(DEFUN |DFLOAT;Beta;3$;77| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 113))) 

(DEFUN |DFLOAT;digamma;2$;78| (|x| $) (SPADCALL |x| (QREFELT $ 115))) 

(DEFUN |DFLOAT;Gamma;2$;79| (|x| $) (SPADCALL |x| (QREFELT $ 117))) 

(DEFUN |DFLOAT;polygamma;3$;80| (|x| |y| $)
  (PROG (#1=#:G531 |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL |x| (QREFELT $ 120)) . #2=(|DFLOAT;polygamma;3$;80|))
      (EXIT
       (COND
        ((QEQCAR |n| 0)
         (COND
          ((>= (QCDR |n|) 0)
           (SPADCALL
            (PROG1 (LETT #1# (QCDR |n|) . #2#)
              (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
            |y| (QREFELT $ 122)))
          (#3='T
           (|error|
            #4="polygamma: first argument should be a nonnegative integer"))))
        (#3# (|error| #4#)))))))) 

(DEFUN |DFLOAT;lambertW;2$;81| (|x| $) (SPADCALL |x| (QREFELT $ 125))) 

(DEFUN |DFLOAT;ellipticF;3$;82| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 128))) 

(DEFUN |DFLOAT;ellipticK;2$;83| (|x| $) (SPADCALL |x| (QREFELT $ 130))) 

(DEFUN |DFLOAT;ellipticE;3$;84| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 132))) 

(DEFUN |DFLOAT;ellipticE;2$;85| (|x| $) (SPADCALL |x| (QREFELT $ 134))) 

(DEFUN |DFLOAT;ellipticPi;4$;86| (|x| |y| |z| $)
  (SPADCALL |x| |y| |z| (QREFELT $ 136))) 

(DEFUN |DFLOAT;jacobiSn;3$;87| (|x| |y| $)
  (PROG (|obits|)
    (RETURN
     (SEQ (LETT |obits| (SPADCALL (QREFELT $ 139)) |DFLOAT;jacobiSn;3$;87|)
          (EXIT
           (|finally|
            (SEQ (SPADCALL 68 (QREFELT $ 140))
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 141))
                             (SPADCALL |y| (QREFELT $ 141)) (QREFELT $ 143))
                   (QREFELT $ 144))))
            (SPADCALL |obits| (QREFELT $ 140)))))))) 

(DEFUN |DFLOAT;jacobiCn;3$;88| (|x| |y| $)
  (PROG (|obits|)
    (RETURN
     (SEQ (LETT |obits| (SPADCALL (QREFELT $ 139)) |DFLOAT;jacobiCn;3$;88|)
          (EXIT
           (|finally|
            (SEQ (SPADCALL 68 (QREFELT $ 140))
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 141))
                             (SPADCALL |y| (QREFELT $ 141)) (QREFELT $ 146))
                   (QREFELT $ 144))))
            (SPADCALL |obits| (QREFELT $ 140)))))))) 

(DEFUN |DFLOAT;jacobiDn;3$;89| (|x| |y| $)
  (PROG (|obits|)
    (RETURN
     (SEQ (LETT |obits| (SPADCALL (QREFELT $ 139)) |DFLOAT;jacobiDn;3$;89|)
          (EXIT
           (|finally|
            (SEQ (SPADCALL 68 (QREFELT $ 140))
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 141))
                             (SPADCALL |y| (QREFELT $ 141)) (QREFELT $ 148))
                   (QREFELT $ 144))))
            (SPADCALL |obits| (QREFELT $ 140)))))))) 

(DEFUN |DFLOAT;weierstrassP;4$;90| (|x| |y| |z| $)
  (PROG (|obits|)
    (RETURN
     (SEQ (LETT |obits| (SPADCALL (QREFELT $ 139)) |DFLOAT;weierstrassP;4$;90|)
          (EXIT
           (|finally|
            (SEQ (SPADCALL 68 (QREFELT $ 140))
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 141))
                             (SPADCALL |y| (QREFELT $ 141))
                             (SPADCALL |z| (QREFELT $ 141)) (QREFELT $ 150))
                   (QREFELT $ 144))))
            (SPADCALL |obits| (QREFELT $ 140)))))))) 

(DEFUN |DFLOAT;weierstrassPPrime;4$;91| (|x| |y| |z| $)
  (PROG (|obits|)
    (RETURN
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
                         (SPADCALL |z| (QREFELT $ 141)) (QREFELT $ 152))
               (QREFELT $ 144))))
        (SPADCALL |obits| (QREFELT $ 140)))))))) 

(PUT '|DFLOAT;wholePart;$I;92| '|SPADreplace| 'TRUNCATE) 

(DEFUN |DFLOAT;wholePart;$I;92| (|x| $) (TRUNCATE |x|)) 

(DEFUN |DFLOAT;float;2IPi$;93| (|ma| |ex| |b| $)
  (|mul_DF_I| (|expt_DF_I| (FLOAT |b| MOST-POSITIVE-DOUBLE-FLOAT) |ex|) |ma|)) 

(PUT '|DFLOAT;convert;2$;94| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |DFLOAT;convert;2$;94| (|x| $) |x|) 

(DEFUN |DFLOAT;convert;$F;95| (|x| $) (SPADCALL |x| (QREFELT $ 141))) 

(DEFUN |DFLOAT;rationalApproximation;$NniF;96| (|x| |d| $)
  (SPADCALL |x| |d| 10 (QREFELT $ 159))) 

(DEFUN |DFLOAT;atan;3$;97| (|x| |y| $)
  (PROG (|theta|)
    (RETURN
     (SEQ
      (COND
       ((|eql_DF| |x| 0.0)
        (COND
         ((SPADCALL |y| 0.0 (QREFELT $ 161))
          (|div_DF_I| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) 2))
         ((|less_DF| |y| 0.0)
          (|minus_DF| (|div_DF_I| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) 2)))
         (#1='T 0.0)))
       (#1#
        (SEQ
         (LETT |theta|
               (|atan_DF| (SPADCALL (|div_DF| |y| |x|) (QREFELT $ 162)))
               . #2=(|DFLOAT;atan;3$;97|))
         (COND
          ((|less_DF| |x| 0.0)
           (LETT |theta|
                 (|sub_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) |theta|)
                 . #2#)))
         (COND ((|less_DF| |y| 0.0) (LETT |theta| (|minus_DF| |theta|) . #2#)))
         (EXIT |theta|)))))))) 

(DEFUN |DFLOAT;retract;$F;98| (|x| $)
  (PROG (#1=#:G562)
    (RETURN
     (SPADCALL |x|
               (PROG1
                   (LETT #1# (- (FLOAT-DIGITS 0.0) 1) |DFLOAT;retract;$F;98|)
                 (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
               (FLOAT-RADIX 0.0) (QREFELT $ 159))))) 

(DEFUN |DFLOAT;retractIfCan;$U;99| (|x| $)
  (PROG (#1=#:G567)
    (RETURN
     (CONS 0
           (SPADCALL |x|
                     (PROG1
                         (LETT #1# (- (FLOAT-DIGITS 0.0) 1)
                               |DFLOAT;retractIfCan;$U;99|)
                       (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                        #1#))
                     (FLOAT-RADIX 0.0) (QREFELT $ 159)))))) 

(DEFUN |DFLOAT;retract;$I;100| (|x| $)
  (PROG (|n|)
    (RETURN
     (SEQ (LETT |n| (TRUNCATE |x|) |DFLOAT;retract;$I;100|)
          (EXIT
           (COND ((|eql_DF| |x| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT)) |n|)
                 ('T (|error| "Not an integer")))))))) 

(DEFUN |DFLOAT;retractIfCan;$U;101| (|x| $)
  (PROG (|n|)
    (RETURN
     (SEQ (LETT |n| (TRUNCATE |x|) |DFLOAT;retractIfCan;$U;101|)
          (EXIT
           (COND
            ((|eql_DF| |x| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT))
             (CONS 0 |n|))
            ('T (CONS 1 "failed")))))))) 

(DEFUN |DFLOAT;sign;$I;102| (|x| $)
  (SPADCALL (FLOAT-SIGN |x| 1.0) (QREFELT $ 167))) 

(PUT '|DFLOAT;abs;2$;103| '|SPADreplace| '(XLAM (|x|) (FLOAT-SIGN 1.0 |x|))) 

(DEFUN |DFLOAT;abs;2$;103| (|x| $) (FLOAT-SIGN 1.0 |x|)) 

(DEFUN |DFLOAT;manexp| (|x| $)
  (PROG (|two53| |me| #1=#:G585 |s|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((|zero?_DF| |x|) (CONS 0 0))
             ('T
              (SEQ
               (LETT |s| (SPADCALL |x| (QREFELT $ 169)) . #2=(|DFLOAT;manexp|))
               (LETT |x| (FLOAT-SIGN 1.0 |x|) . #2#)
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
                         (SPADCALL MOST-POSITIVE-DOUBLE-FLOAT (QREFELT $ 28)))
                        . #2#)
                  (GO #1#))))
               (LETT |me| (MANEXP |x|) . #2#)
               (LETT |two53|
                     (SPADCALL (FLOAT-RADIX 0.0) (FLOAT-DIGITS 0.0)
                               (QREFELT $ 170))
                     . #2#)
               (EXIT
                (CONS
                 (* |s|
                    (TRUNCATE (SPADCALL |two53| (QCAR |me|) (QREFELT $ 31))))
                 (- (QCDR |me|) (FLOAT-DIGITS 0.0))))))))
      #1# (EXIT #1#))))) 

(DEFUN |DFLOAT;rationalApproximation;$2NniF;105| (|f| |d| |b| $)
  (PROG (|t| |s| |#G148| |#G147| |q1| |q0| |#G146| |#G145| |p1| |p0| |#G144|
         |#G143| #1=#:G615 |q2| |p2| |r| |q| |#G142| |tol| |de| #2=#:G607
         #3=#:G605 BASE |ex| |nu| |#G141|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (PROGN
         (LETT |#G141| (|DFLOAT;manexp| |f| $)
               . #4=(|DFLOAT;rationalApproximation;$2NniF;105|))
         (LETT |nu| (QCAR |#G141|) . #4#)
         (LETT |ex| (QCDR |#G141|) . #4#)
         |#G141|)
        (LETT BASE (FLOAT-RADIX 0.0) . #4#)
        (EXIT
         (COND
          ((>= |ex| 0)
           (SPADCALL
            (* |nu|
               (EXPT BASE
                     (PROG1 (LETT #3# |ex| . #4#)
                       (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                        #3#))))
            (QREFELT $ 171)))
          (#5='T
           (SEQ
            (LETT |de|
                  (EXPT BASE
                        (PROG1 (LETT #2# (- |ex|) . #4#)
                          (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                           #2#)))
                  . #4#)
            (EXIT
             (COND ((< |b| 2) (|error| "base must be > 1"))
                   (#5#
                    (SEQ (LETT |tol| (EXPT |b| |d|) . #4#)
                         (LETT |s| |nu| . #4#) (LETT |t| |de| . #4#)
                         (LETT |p0| 0 . #4#) (LETT |p1| 1 . #4#)
                         (LETT |q0| 1 . #4#) (LETT |q1| 0 . #4#)
                         (EXIT
                          (SEQ G190 NIL
                               (SEQ
                                (PROGN
                                 (LETT |#G142| (DIVIDE2 |s| |t|) . #4#)
                                 (LETT |q| (QCAR |#G142|) . #4#)
                                 (LETT |r| (QCDR |#G142|) . #4#)
                                 |#G142|)
                                (LETT |p2| (+ (* |q| |p1|) |p0|) . #4#)
                                (LETT |q2| (+ (* |q| |q1|) |q0|) . #4#)
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
                                    (LETT #1#
                                          (SPADCALL |p2| |q2| (QREFELT $ 172))
                                          . #4#)
                                    (GO #1#)))))
                                (PROGN
                                 (LETT |#G143| |p1| . #4#)
                                 (LETT |#G144| |p2| . #4#)
                                 (LETT |p0| |#G143| . #4#)
                                 (LETT |p1| |#G144| . #4#))
                                (PROGN
                                 (LETT |#G145| |q1| . #4#)
                                 (LETT |#G146| |q2| . #4#)
                                 (LETT |q0| |#G145| . #4#)
                                 (LETT |q1| |#G146| . #4#))
                                (EXIT
                                 (PROGN
                                  (LETT |#G147| |t| . #4#)
                                  (LETT |#G148| |r| . #4#)
                                  (LETT |s| |#G147| . #4#)
                                  (LETT |t| |#G148| . #4#))))
                               NIL (GO G190) G191 (EXIT NIL)))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |DFLOAT;^;$F$;106| (|x| |r| $)
  (PROG (#1=#:G624 |d| |n|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((|zero?_DF| |x|)
         (COND ((SPADCALL |r| (QREFELT $ 174)) (|error| "0^0 is undefined"))
               ((SPADCALL |r| (QREFELT $ 175)) (|error| "division by 0"))
               (#2='T 0.0)))
        ((OR (SPADCALL |r| (QREFELT $ 174)) (|eql_DF| |x| 1.0)) 1.0)
        ('T
         (COND ((SPADCALL |r| (|spadConstant| $ 176) (QREFELT $ 177)) |x|)
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
                         (GO #1#)))
                       (#2#
                        (PROGN
                         (LETT #1#
                               (SPADCALL (|minus_DF| |x|) |r| (QREFELT $ 180))
                               . #3#)
                         (GO #1#)))))
                     (#2# (|error| "negative root"))))
                   ((EQL |d| 2)
                    (|expt_DF_I| (SPADCALL |x| (QREFELT $ 58)) |n|))
                   (#2#
                    (SPADCALL |x|
                              (|div_DF| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT)
                                        (FLOAT |d| MOST-POSITIVE-DOUBLE-FLOAT))
                              (QREFELT $ 62)))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |DoubleFloat| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G638)
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
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|DoubleFloat|))))))))))) 

(DEFUN |DoubleFloat;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|DoubleFloat|) . #1=(|DoubleFloat|))
      (LETT $ (GETREFV 195) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|DoubleFloat| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (|HasCategory| $ '(|arbitraryPrecision|)) (|augmentPredVector| $ 1))
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
      $)))) 

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
              |DFLOAT;abs;2$;103| |DFLOAT;atan;3$;97| |DFLOAT;retract;$F;98|
              (|Union| 158 '"failed") |DFLOAT;retractIfCan;$U;99|
              |DFLOAT;retract;$I;100| |DFLOAT;retractIfCan;$U;101|
              |DFLOAT;sign;$I;102| (210 . ^) (216 . |coerce|) (221 . /)
              (227 . *) (233 . |zero?|) (238 . |negative?|) (243 . |One|)
              (247 . =) (253 . |numer|) (258 . |denom|) |DFLOAT;^;$F$;106|
              (|List| $) (|Pattern| 138) (|PatternMatchResult| 138 $)
              (|Factored| $) (|Union| 181 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 186 '#1#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
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
              554 |one?| 559 |nthRoot| 564 |norm| 570 |negative?| 575
              |multiEuclidean| 580 |min| 586 |meijerG| 596 |max| 605 |mantissa|
              615 |lommelS2| 620 |lommelS1| 627 |log2| 634 |log10| 639 |log|
              644 |lerchPhi| 649 |legendreQ| 656 |legendreP| 663 |lcmCoef| 670
              |lcm| 676 |latex| 687 |lambertW| 692 |kummerU| 697 |kummerM| 704
              |kelvinKer| 711 |kelvinKei| 717 |kelvinBer| 723 |kelvinBei| 729
              |jacobiZeta| 735 |jacobiTheta| 741 |jacobiSn| 747 |jacobiDn| 753
              |jacobiCn| 759 |inv| 765 |increasePrecision| 770
              |hypergeometricF| 775 |hashUpdate!| 782 |hash| 788 |hankelH2| 793
              |hankelH1| 799 |gcdPolynomial| 805 |gcd| 811 |fractionPart| 822
              |floor| 827 |float| 832 |factor| 845 |extendedEuclidean| 850
              |exquo| 863 |expressIdealMember| 869 |exponent| 875 |exp1| 880
              |exp| 884 |euclideanSize| 889 |ellipticPi| 894 |ellipticK| 901
              |ellipticF| 906 |ellipticE| 912 |doubleFloatFormat| 923 |divide|
              928 |digits| 934 |digamma| 943 |differentiate| 948
              |decreasePrecision| 959 |csch| 964 |csc| 969 |coth| 974 |cot| 979
              |cosh| 984 |cos| 989 |convert| 994 |coerce| 1014 |characteristic|
              1044 |ceiling| 1048 |bits| 1053 |besselY| 1062 |besselK| 1068
              |besselJ| 1074 |besselI| 1080 |base| 1086 |atanh| 1090 |atan|
              1095 |associates?| 1106 |asinh| 1112 |asin| 1117 |asech| 1122
              |asec| 1127 |angerJ| 1132 |airyBiPrime| 1138 |airyBi| 1143
              |airyAiPrime| 1148 |airyAi| 1153 |acsch| 1158 |acsc| 1163 |acoth|
              1168 |acot| 1173 |acosh| 1178 |acos| 1183 |abs| 1188 ^ 1193
              |Zero| 1223 |One| 1227 |OMwrite| 1231 |Gamma| 1255 D 1266 |Beta|
              1277 >= 1283 > 1289 = 1295 <= 1301 < 1307 / 1313 - 1325 + 1336 *
              1342)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|FloatingPointSystem&| |RealNumberSystem&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| |DivisionRing&| NIL |Algebra&| NIL |Algebra&|
                |DifferentialRing&| NIL |OrderedRing&| |Module&| NIL
                |EntireRing&| |Module&| NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL |OrderedSet&|
                |AbelianMonoid&| |Monoid&| NIL NIL NIL |SemiGroup&|
                |AbelianSemiGroup&| |TranscendentalFunctionCategory&| NIL
                |SetCategory&| NIL NIL |ElementaryFunctionCategory&| NIL
                |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL NIL NIL |RadicalCategory&|
                |RetractableTo&| |RetractableTo&| NIL NIL |PartialOrder&| NIL
                NIL NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|FloatingPointSystem|) (|RealNumberSystem|) (|Field|)
                 (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|Algebra| 158) (|LeftOreRing|)
                 (|Algebra| $$) (|DifferentialRing|) (|CharacteristicZero|)
                 (|OrderedRing|) (|Module| 158) (|CommutativeRing|)
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
                 (|ConvertibleTo| 182) (|RadicalCategory|)
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
                                    0 0 67 1 0 26 0 169 1 0 0 0 85 1 0 0 0 71 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 165 0 166 1 0
                                    119 0 168 1 0 158 0 164 1 0 26 0 167 2 0 0
                                    0 0 1 1 0 97 0 98 3 0 158 0 121 121 159 2 0
                                    158 0 121 160 2 0 0 0 0 1 1 0 0 0 59 1 0 0
                                    0 66 1 0 190 181 1 1 0 20 0 1 1 1 24 24 1 0
                                    0 24 29 1 0 20 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    123 0 0 0 39 3 0 183 0 182 183 1 1 0 26 0
                                    35 1 0 20 0 1 2 0 0 0 26 1 1 0 0 0 1 1 0 20
                                    0 93 2 0 185 181 0 1 0 2 0 34 2 0 0 0 0 55
                                    5 3 0 181 181 181 181 0 1 0 2 0 33 2 0 0 0
                                    0 54 1 0 26 0 27 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 1 0 0 0 30 1 0 0 0 60 1 0 0 0 65 3 0 0 0
                                    0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 2 0 192 0
                                    0 1 2 0 0 0 0 1 1 0 0 181 1 1 0 7 0 1 1 0 0
                                    0 126 3 0 0 0 0 0 1 3 0 0 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 0 0 145 2 0 0 0 0
                                    149 2 0 0 0 0 147 1 0 0 0 1 1 1 24 26 1 3 3
                                    0 181 181 0 1 2 0 95 95 0 96 1 0 194 0 1 2
                                    0 0 0 0 1 2 0 0 0 0 1 2 0 191 191 191 1 1 0
                                    0 181 1 2 0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 3 0
                                    0 26 26 24 155 2 0 0 26 26 1 1 0 184 0 1 3
                                    0 187 0 0 0 1 2 0 188 0 0 1 2 0 97 0 0 1 2
                                    0 185 181 0 1 1 0 26 0 28 0 0 0 38 1 0 0 0
                                    64 1 0 121 0 1 3 0 0 0 0 0 137 1 0 0 0 131
                                    2 0 0 0 0 129 2 0 0 0 0 133 1 0 0 0 135 1 0
                                    7 7 8 2 0 189 0 0 1 1 1 24 24 1 0 0 24 1 1
                                    0 0 0 116 1 0 0 0 99 2 0 0 0 121 1 1 1 24
                                    26 1 1 0 0 0 83 1 0 0 0 72 1 0 0 0 84 1 0 0
                                    0 70 1 0 0 0 81 1 0 0 0 68 1 0 45 0 47 1 0
                                    182 0 1 1 0 138 0 157 1 0 15 0 156 1 0 0
                                    158 1 1 0 0 26 63 1 0 0 158 1 1 0 0 26 63 1
                                    0 0 0 1 1 0 41 0 44 0 0 121 1 1 0 0 0 1 1 1
                                    24 24 1 0 0 24 32 2 0 0 0 0 112 2 0 0 0 0
                                    110 2 0 0 0 0 108 2 0 0 0 0 106 0 0 24 25 1
                                    0 0 0 88 2 0 0 0 0 163 1 0 0 0 75 2 0 20 0
                                    0 1 1 0 0 0 86 1 0 0 0 73 1 0 0 0 91 1 0 0
                                    0 79 2 0 0 0 0 1 1 0 0 0 1 1 0 0 0 104 1 0
                                    0 0 1 1 0 0 0 102 1 0 0 0 89 1 0 0 0 76 1 0
                                    0 0 90 1 0 0 0 78 1 0 0 0 87 1 0 0 0 74 1 0
                                    0 0 162 2 0 0 0 0 62 2 0 0 0 158 180 2 0 0
                                    0 26 61 2 0 0 0 121 1 2 0 0 0 24 1 0 0 0 36
                                    0 0 0 37 3 0 13 11 0 20 23 2 0 13 11 0 22 1
                                    0 7 0 19 2 0 7 0 20 21 2 0 0 0 0 1 1 0 0 0
                                    118 1 0 0 0 1 2 0 0 0 121 1 2 0 0 0 0 114 2
                                    0 20 0 0 40 2 0 20 0 0 161 2 0 20 0 0 56 2
                                    0 20 0 0 1 2 0 20 0 0 48 2 0 0 0 26 57 2 0
                                    0 0 0 92 1 0 0 0 49 2 0 0 0 0 51 2 0 0 0 0
                                    50 2 0 0 158 0 1 2 0 0 0 158 1 2 0 0 26 0
                                    53 2 0 0 0 0 52 2 0 0 121 0 1 2 0 0 24 0
                                    31)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloat| 'NILADIC T) 
