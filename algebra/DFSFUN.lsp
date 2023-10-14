
(/VERSIONCHECK 2) 

(PUT '|DFSFUN;Gamma;2C;1| '|SPADreplace| '|c_gamma|) 

(DEFUN |DFSFUN;Gamma;2C;1| (|z| $) (|c_gamma| |z|)) 

(PUT '|DFSFUN;Gamma;2Df;2| '|SPADreplace| '|r_gamma|) 

(DEFUN |DFSFUN;Gamma;2Df;2| (|x| $) (|r_gamma| |x|)) 

(PUT '|DFSFUN;polygamma;Nni2C;3| '|SPADreplace| '|c_psi|) 

(DEFUN |DFSFUN;polygamma;Nni2C;3| (|k| |z| $) (|c_psi| |k| |z|)) 

(PUT '|DFSFUN;polygamma;Nni2Df;4| '|SPADreplace| '|r_psi|) 

(DEFUN |DFSFUN;polygamma;Nni2Df;4| (|k| |x| $) (|r_psi| |k| |x|)) 

(PUT '|DFSFUN;logGamma;2C;5| '|SPADreplace| '|c_lngamma|) 

(DEFUN |DFSFUN;logGamma;2C;5| (|z| $) (|c_lngamma| |z|)) 

(PUT '|DFSFUN;logGamma;2Df;6| '|SPADreplace| '|r_lngamma|) 

(DEFUN |DFSFUN;logGamma;2Df;6| (|x| $) (|r_lngamma| |x|)) 

(PUT '|DFSFUN;besselJ;3C;7| '|SPADreplace| '|c_besselj|) 

(DEFUN |DFSFUN;besselJ;3C;7| (|v| |z| $) (|c_besselj| |v| |z|)) 

(PUT '|DFSFUN;besselJ;3Df;8| '|SPADreplace| '|r_besselj|) 

(DEFUN |DFSFUN;besselJ;3Df;8| (|n| |x| $) (|r_besselj| |n| |x|)) 

(PUT '|DFSFUN;besselI;3C;9| '|SPADreplace| '|c_besseli|) 

(DEFUN |DFSFUN;besselI;3C;9| (|v| |z| $) (|c_besseli| |v| |z|)) 

(PUT '|DFSFUN;besselI;3Df;10| '|SPADreplace| '|r_besseli|) 

(DEFUN |DFSFUN;besselI;3Df;10| (|n| |x| $) (|r_besseli| |n| |x|)) 

(PUT '|DFSFUN;hypergeometric0F1;3C;11| '|SPADreplace| '|c_hyper0f1|) 

(DEFUN |DFSFUN;hypergeometric0F1;3C;11| (|a| |z| $) (|c_hyper0f1| |a| |z|)) 

(DEFUN |DFSFUN;hypergeometric0F1;3Df;12| (|n| |x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |n| (QREFELT $ 20)) (SPADCALL |x| (QREFELT $ 20))
             (QREFELT $ 19))
   (QREFELT $ 21))) 

(DEFUN |DFSFUN;digamma;2Df;13| (|x| $) (SPADCALL 0 |x| (QREFELT $ 12))) 

(DEFUN |DFSFUN;digamma;2C;14| (|z| $) (SPADCALL 0 |z| (QREFELT $ 11))) 

(DEFUN |DFSFUN;Beta;3Df;15| (|x| |y| $)
  (|div_DF|
   (|mul_DF| (SPADCALL |x| (QREFELT $ 9)) (SPADCALL |y| (QREFELT $ 9)))
   (SPADCALL (|add_DF| |x| |y|) (QREFELT $ 9)))) 

(DEFUN |DFSFUN;Beta;3C;16| (|w| |z| $)
  (SPADCALL
   (SPADCALL (SPADCALL |w| (QREFELT $ 7)) (SPADCALL |z| (QREFELT $ 7))
             (QREFELT $ 27))
   (SPADCALL (SPADCALL |w| |z| (QREFELT $ 28)) (QREFELT $ 7)) (QREFELT $ 29))) 

(DEFUN |DFSFUN;besselY;3Df;17| (|n| |x| $)
  (PROG (|vp|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |n| (QREFELT $ 34))
        (LETT |n| (|add_DF| |n| (QREFELT $ 31))
              . #1=(|DFSFUN;besselY;3Df;17|))))
      (LETT |vp| (|mul_DF| |n| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)) . #1#)
      (EXIT
       (|div_DF|
        (|sub_DF| (|mul_DF| (|cos_DF| |vp|) (SPADCALL |n| |x| (QREFELT $ 16)))
                  (SPADCALL (|minus_DF| |n|) |x| (QREFELT $ 16)))
        (|sin_DF| |vp|))))))) 

(DEFUN |DFSFUN;besselY;3C;18| (|v| |z| $)
  (PROG (|vp|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |v| (QREFELT $ 37))
        (LETT |v|
              (SPADCALL |v| (SPADCALL (QREFELT $ 31) (QREFELT $ 20))
                        (QREFELT $ 28))
              . #1=(|DFSFUN;besselY;3C;18|))))
      (LETT |vp| (SPADCALL |v| (SPADCALL (QREFELT $ 38)) (QREFELT $ 27)) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL
         (SPADCALL (SPADCALL |vp| (QREFELT $ 39))
                   (SPADCALL |v| |z| (QREFELT $ 15)) (QREFELT $ 27))
         (SPADCALL (SPADCALL |v| (QREFELT $ 40)) |z| (QREFELT $ 15))
         (QREFELT $ 41))
        (SPADCALL |vp| (QREFELT $ 42)) (QREFELT $ 29))))))) 

(DEFUN |DFSFUN;besselK;3Df;19| (|n| |x| $)
  (PROG (|ahalf| |vp| |p|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |n| (QREFELT $ 34))
        (LETT |n| (|add_DF| |n| (QREFELT $ 31))
              . #1=(|DFSFUN;besselK;3Df;19|))))
      (LETT |p| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) . #1#)
      (LETT |vp| (|mul_DF| |n| |p|) . #1#)
      (LETT |ahalf| (|div_DF| 1.0 (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)) . #1#)
      (EXIT
       (|div_DF|
        (|mul_DF| (|mul_DF| |p| |ahalf|)
                  (|sub_DF| (SPADCALL (|minus_DF| |n|) |x| (QREFELT $ 18))
                            (SPADCALL |n| |x| (QREFELT $ 18))))
        (|sin_DF| |vp|))))))) 

(DEFUN |DFSFUN;besselK;3C;20| (|v| |z| $)
  (PROG (|ahalf| |vp| |p|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |v| (QREFELT $ 37))
        (LETT |v|
              (SPADCALL |v| (SPADCALL (QREFELT $ 31) (QREFELT $ 20))
                        (QREFELT $ 28))
              . #1=(|DFSFUN;besselK;3C;20|))))
      (LETT |p| (SPADCALL (QREFELT $ 38)) . #1#)
      (LETT |vp| (SPADCALL |v| |p| (QREFELT $ 27)) . #1#)
      (LETT |ahalf|
            (SPADCALL (|spadConstant| $ 44) (SPADCALL 2 (QREFELT $ 47))
                      (QREFELT $ 29))
            . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL |p| |ahalf| (QREFELT $ 27))
                  (SPADCALL
                   (SPADCALL (SPADCALL |v| (QREFELT $ 40)) |z| (QREFELT $ 17))
                   (SPADCALL |v| |z| (QREFELT $ 17)) (QREFELT $ 41))
                  (QREFELT $ 27))
        (SPADCALL |vp| (QREFELT $ 42)) (QREFELT $ 29))))))) 

(DEFUN |DFSFUN;airyAi;2Df;21| (|x| $)
  (PROG (|eta| |athird| #1=#:G136 |ahalf|)
    (RETURN
     (SEQ
      (LETT |ahalf|
            (PROG2
                (LETT #1#
                      (SPADCALL (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                (QREFELT $ 50))
                      . #2=(|DFSFUN;airyAi;2Df;21|))
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (|DoubleFloat|) #1#))
            . #2#)
      (LETT |athird|
            (PROG2
                (LETT #1#
                      (SPADCALL (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                                (QREFELT $ 50))
                      . #2#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (|DoubleFloat|) #1#))
            . #2#)
      (LETT |eta|
            (|mul_DF| (SPADCALL 2 |athird| (QREFELT $ 52))
                      (SPADCALL (|minus_DF| |x|)
                                (SPADCALL 3 |ahalf| (QREFELT $ 52))
                                (QREFELT $ 53)))
            . #2#)
      (EXIT
       (|mul_DF|
        (|mul_DF| (SPADCALL (|minus_DF| |x|) |ahalf| (QREFELT $ 53)) |athird|)
        (|add_DF| (SPADCALL (|minus_DF| |athird|) |eta| (QREFELT $ 16))
                  (SPADCALL |athird| |eta| (QREFELT $ 16))))))))) 

(DEFUN |DFSFUN;airyAi;2C;22| (|z| $)
  (PROG (|eta| |athird| #1=#:G141 |ahalf|)
    (RETURN
     (SEQ
      (LETT |ahalf|
            (PROG2
                (LETT #1# (SPADCALL (SPADCALL 2 (QREFELT $ 47)) (QREFELT $ 55))
                      . #2=(|DFSFUN;airyAi;2C;22|))
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (|Complex| (|DoubleFloat|)) #1#))
            . #2#)
      (LETT |athird|
            (PROG2
                (LETT #1# (SPADCALL (SPADCALL 3 (QREFELT $ 47)) (QREFELT $ 55))
                      . #2#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (|Complex| (|DoubleFloat|)) #1#))
            . #2#)
      (LETT |eta|
            (SPADCALL (SPADCALL 2 |athird| (QREFELT $ 56))
                      (SPADCALL (SPADCALL |z| (QREFELT $ 40))
                                (SPADCALL 3 |ahalf| (QREFELT $ 56))
                                (QREFELT $ 57))
                      (QREFELT $ 27))
            . #2#)
      (EXIT
       (SPADCALL
        (SPADCALL
         (SPADCALL (SPADCALL |z| (QREFELT $ 40)) |ahalf| (QREFELT $ 57))
         |athird| (QREFELT $ 27))
        (SPADCALL
         (SPADCALL (SPADCALL |athird| (QREFELT $ 40)) |eta| (QREFELT $ 15))
         (SPADCALL |athird| |eta| (QREFELT $ 15)) (QREFELT $ 28))
        (QREFELT $ 27))))))) 

(DEFUN |DFSFUN;airyBi;2Df;23| (|x| $)
  (PROG (|eta| |athird| #1=#:G146 |ahalf|)
    (RETURN
     (SEQ
      (LETT |ahalf|
            (PROG2
                (LETT #1#
                      (SPADCALL (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                (QREFELT $ 50))
                      . #2=(|DFSFUN;airyBi;2Df;23|))
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (|DoubleFloat|) #1#))
            . #2#)
      (LETT |athird|
            (PROG2
                (LETT #1#
                      (SPADCALL (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                                (QREFELT $ 50))
                      . #2#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (|DoubleFloat|) #1#))
            . #2#)
      (LETT |eta|
            (|mul_DF| (SPADCALL 2 |athird| (QREFELT $ 52))
                      (SPADCALL (|minus_DF| |x|)
                                (SPADCALL 3 |ahalf| (QREFELT $ 52))
                                (QREFELT $ 53)))
            . #2#)
      (EXIT
       (|mul_DF|
        (SPADCALL (|minus_DF| (|mul_DF| |x| |athird|)) |ahalf| (QREFELT $ 53))
        (|sub_DF| (SPADCALL (|minus_DF| |athird|) |eta| (QREFELT $ 16))
                  (SPADCALL |athird| |eta| (QREFELT $ 16))))))))) 

(DEFUN |DFSFUN;airyBi;2C;24| (|z| $)
  (PROG (|eta| |athird| #1=#:G151 |ahalf|)
    (RETURN
     (SEQ
      (LETT |ahalf|
            (PROG2
                (LETT #1# (SPADCALL (SPADCALL 2 (QREFELT $ 47)) (QREFELT $ 55))
                      . #2=(|DFSFUN;airyBi;2C;24|))
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (|Complex| (|DoubleFloat|)) #1#))
            . #2#)
      (LETT |athird|
            (PROG2
                (LETT #1# (SPADCALL (SPADCALL 3 (QREFELT $ 47)) (QREFELT $ 55))
                      . #2#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (|Complex| (|DoubleFloat|)) #1#))
            . #2#)
      (LETT |eta|
            (SPADCALL (SPADCALL 2 |athird| (QREFELT $ 56))
                      (SPADCALL (SPADCALL |z| (QREFELT $ 40))
                                (SPADCALL 3 |ahalf| (QREFELT $ 56))
                                (QREFELT $ 57))
                      (QREFELT $ 27))
            . #2#)
      (EXIT
       (SPADCALL
        (SPADCALL
         (SPADCALL (SPADCALL |z| |athird| (QREFELT $ 27)) (QREFELT $ 40))
         |ahalf| (QREFELT $ 57))
        (SPADCALL
         (SPADCALL (SPADCALL |athird| (QREFELT $ 40)) |eta| (QREFELT $ 15))
         (SPADCALL |athird| |eta| (QREFELT $ 15)) (QREFELT $ 41))
        (QREFELT $ 27))))))) 

(DECLAIM (NOTINLINE |DoubleFloatSpecialFunctions;|)) 

(DEFUN |DoubleFloatSpecialFunctions| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G156)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|DoubleFloatSpecialFunctions|)
                . #2=(|DoubleFloatSpecialFunctions|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|DoubleFloatSpecialFunctions|
                         (LIST
                          (CONS NIL
                                (CONS 1 (|DoubleFloatSpecialFunctions;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache|
                    '|DoubleFloatSpecialFunctions|))))))))))) 

(DEFUN |DoubleFloatSpecialFunctions;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|DoubleFloatSpecialFunctions|)
            . #1=(|DoubleFloatSpecialFunctions|))
      (LETT $ (GETREFV 61) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|DoubleFloatSpecialFunctions| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 31 (|expt_DF_I| (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT) -7))
      $)))) 

(MAKEPROP '|DoubleFloatSpecialFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Complex| 8) |DFSFUN;Gamma;2C;1|
              (|DoubleFloat|) |DFSFUN;Gamma;2Df;2| (|NonNegativeInteger|)
              |DFSFUN;polygamma;Nni2C;3| |DFSFUN;polygamma;Nni2Df;4|
              |DFSFUN;logGamma;2C;5| |DFSFUN;logGamma;2Df;6|
              |DFSFUN;besselJ;3C;7| |DFSFUN;besselJ;3Df;8|
              |DFSFUN;besselI;3C;9| |DFSFUN;besselI;3Df;10|
              |DFSFUN;hypergeometric0F1;3C;11| (0 . |coerce|) (5 . |retract|)
              |DFSFUN;hypergeometric0F1;3Df;12| (10 . |Zero|)
              |DFSFUN;digamma;2Df;13| |DFSFUN;digamma;2C;14|
              |DFSFUN;Beta;3Df;15| (14 . *) (20 . +) (26 . /)
              |DFSFUN;Beta;3C;16| '|fuzz| (|Boolean|) (|IntegerRetractions| 8)
              (32 . |integer?|) |DFSFUN;besselY;3Df;17|
              (|IntegerRetractions| 6) (37 . |integer?|) (42 . |pi|)
              (46 . |cos|) (51 . -) (56 . -) (62 . |sin|)
              |DFSFUN;besselY;3C;18| (67 . |One|) |DFSFUN;besselK;3Df;19|
              (|Integer|) (71 . |coerce|) |DFSFUN;besselK;3C;20|
              (|Union| $ '"failed") (76 . |recip|) (|PositiveInteger|) (81 . *)
              (87 . ^) |DFSFUN;airyAi;2Df;21| (93 . |recip|) (98 . *) (104 . ^)
              |DFSFUN;airyAi;2C;22| |DFSFUN;airyBi;2Df;23|
              |DFSFUN;airyBi;2C;24|)
           '#(|polygamma| 110 |logGamma| 122 |hypergeometric0F1| 132 |digamma|
              144 |besselY| 154 |besselK| 166 |besselJ| 178 |besselI| 190
              |airyBi| 202 |airyAi| 212 |Gamma| 222 |Beta| 232)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 60
                                                 '(1 6 0 8 20 1 6 8 0 21 0 6 0
                                                   23 2 6 0 0 0 27 2 6 0 0 0 28
                                                   2 6 0 0 0 29 1 33 32 8 34 1
                                                   36 32 6 37 0 6 0 38 1 6 0 0
                                                   39 1 6 0 0 40 2 6 0 0 0 41 1
                                                   6 0 0 42 0 6 0 44 1 6 0 46
                                                   47 1 8 49 0 50 2 8 0 51 0 52
                                                   2 8 0 0 0 53 1 6 49 0 55 2 6
                                                   0 51 0 56 2 6 0 0 0 57 2 0 8
                                                   10 8 12 2 0 6 10 6 11 1 0 6
                                                   6 13 1 0 8 8 14 2 0 6 6 6 19
                                                   2 0 8 8 8 22 1 0 8 8 24 1 0
                                                   6 6 25 2 0 8 8 8 35 2 0 6 6
                                                   6 43 2 0 6 6 6 48 2 0 8 8 8
                                                   45 2 0 6 6 6 15 2 0 8 8 8 16
                                                   2 0 8 8 8 18 2 0 6 6 6 17 1
                                                   0 8 8 59 1 0 6 6 60 1 0 6 6
                                                   58 1 0 8 8 54 1 0 8 8 9 1 0
                                                   6 6 7 2 0 8 8 8 26 2 0 6 6 6
                                                   30)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloatSpecialFunctions| 'NILADIC T) 
