
(PUT '|DFSFUN;polygamma;Nni2C;1| '|SPADreplace| '|c_psi|) 

(SDEFUN |DFSFUN;polygamma;Nni2C;1|
        ((|k| (|NonNegativeInteger|)) (|z| (|Complex| (|DoubleFloat|)))
         ($ (|Complex| (|DoubleFloat|))))
        (|c_psi| |k| |z|)) 

(PUT '|DFSFUN;polygamma;Nni2Df;2| '|SPADreplace| '|r_psi|) 

(SDEFUN |DFSFUN;polygamma;Nni2Df;2|
        ((|k| (|NonNegativeInteger|)) (|x| (|DoubleFloat|))
         ($ (|DoubleFloat|)))
        (|r_psi| |k| |x|)) 

(PUT '|DFSFUN;besselJ;3C;3| '|SPADreplace| '|c_besselj|) 

(SDEFUN |DFSFUN;besselJ;3C;3|
        ((|v| (|Complex| (|DoubleFloat|))) (|z| (|Complex| (|DoubleFloat|)))
         ($ (|Complex| (|DoubleFloat|))))
        (|c_besselj| |v| |z|)) 

(PUT '|DFSFUN;besselJ;3Df;4| '|SPADreplace| '|r_besselj|) 

(SDEFUN |DFSFUN;besselJ;3Df;4|
        ((|n| (|DoubleFloat|)) (|x| (|DoubleFloat|)) ($ (|DoubleFloat|)))
        (|r_besselj| |n| |x|)) 

(PUT '|DFSFUN;besselI;3C;5| '|SPADreplace| '|c_besseli|) 

(SDEFUN |DFSFUN;besselI;3C;5|
        ((|v| (|Complex| (|DoubleFloat|))) (|z| (|Complex| (|DoubleFloat|)))
         ($ (|Complex| (|DoubleFloat|))))
        (|c_besseli| |v| |z|)) 

(PUT '|DFSFUN;besselI;3Df;6| '|SPADreplace| '|r_besseli|) 

(SDEFUN |DFSFUN;besselI;3Df;6|
        ((|n| (|DoubleFloat|)) (|x| (|DoubleFloat|)) ($ (|DoubleFloat|)))
        (|r_besseli| |n| |x|)) 

(SDEFUN |DFSFUN;digamma;2Df;7| ((|x| (|DoubleFloat|)) ($ (|DoubleFloat|)))
        (SPADCALL 0 |x| (QREFELT $ 10))) 

(SDEFUN |DFSFUN;digamma;2C;8|
        ((|z| (|Complex| (|DoubleFloat|))) ($ (|Complex| (|DoubleFloat|))))
        (SPADCALL 0 |z| (QREFELT $ 8))) 

(SDEFUN |DFSFUN;besselY;3Df;9|
        ((|n| (|DoubleFloat|)) (|x| (|DoubleFloat|)) ($ (|DoubleFloat|)))
        (SPROG ((|vp| (|DoubleFloat|)))
               (SEQ
                (COND
                 ((SPADCALL |n| (QREFELT $ 21))
                  (LETT |n| (|add_DF| |n| (QREFELT $ 18)))))
                (LETT |vp|
                      (|mul_DF| |n| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)))
                (EXIT
                 (|div_DF|
                  (|sub_DF|
                   (|mul_DF| (|cos_DF| |vp|) (SPADCALL |n| |x| (QREFELT $ 12)))
                   (SPADCALL (|minus_DF| |n|) |x| (QREFELT $ 12)))
                  (|sin_DF| |vp|)))))) 

(SDEFUN |DFSFUN;besselY;3C;10|
        ((|v| (|Complex| (|DoubleFloat|))) (|z| (|Complex| (|DoubleFloat|)))
         ($ (|Complex| (|DoubleFloat|))))
        (SPROG ((|vp| (|Complex| (|DoubleFloat|))))
               (SEQ
                (COND
                 ((SPADCALL |v| (QREFELT $ 24))
                  (LETT |v|
                        (SPADCALL |v| (SPADCALL (QREFELT $ 18) (QREFELT $ 25))
                                  (QREFELT $ 26)))))
                (LETT |vp|
                      (SPADCALL |v| (SPADCALL (QREFELT $ 27)) (QREFELT $ 28)))
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |vp| (QREFELT $ 29))
                             (SPADCALL |v| |z| (QREFELT $ 11)) (QREFELT $ 28))
                   (SPADCALL (SPADCALL |v| (QREFELT $ 30)) |z| (QREFELT $ 11))
                   (QREFELT $ 31))
                  (SPADCALL |vp| (QREFELT $ 32)) (QREFELT $ 33)))))) 

(SDEFUN |DFSFUN;besselK;3Df;11|
        ((|n| (|DoubleFloat|)) (|x| (|DoubleFloat|)) ($ (|DoubleFloat|)))
        (SPROG
         ((|ahalf| (|DoubleFloat|)) (|vp| (|DoubleFloat|))
          (|p| (|DoubleFloat|)))
         (SEQ
          (COND
           ((SPADCALL |n| (QREFELT $ 21))
            (LETT |n| (|add_DF| |n| (QREFELT $ 18)))))
          (LETT |p| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT))
          (LETT |vp| (|mul_DF| |n| |p|))
          (LETT |ahalf| (|div_DF| 1.0 (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)))
          (EXIT
           (|div_DF|
            (|mul_DF| (|mul_DF| |p| |ahalf|)
                      (|sub_DF| (SPADCALL (|minus_DF| |n|) |x| (QREFELT $ 14))
                                (SPADCALL |n| |x| (QREFELT $ 14))))
            (|sin_DF| |vp|)))))) 

(SDEFUN |DFSFUN;besselK;3C;12|
        ((|v| (|Complex| (|DoubleFloat|))) (|z| (|Complex| (|DoubleFloat|)))
         ($ (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|ahalf| (|Complex| (|DoubleFloat|)))
          (|vp| (|Complex| (|DoubleFloat|))) (|p| (|Complex| (|DoubleFloat|))))
         (SEQ
          (COND
           ((SPADCALL |v| (QREFELT $ 24))
            (LETT |v|
                  (SPADCALL |v| (SPADCALL (QREFELT $ 18) (QREFELT $ 25))
                            (QREFELT $ 26)))))
          (LETT |p| (SPADCALL (QREFELT $ 27)))
          (LETT |vp| (SPADCALL |v| |p| (QREFELT $ 28)))
          (LETT |ahalf|
                (SPADCALL (|spadConstant| $ 35) (SPADCALL 2 (QREFELT $ 38))
                          (QREFELT $ 33)))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |p| |ahalf| (QREFELT $ 28))
                      (SPADCALL
                       (SPADCALL (SPADCALL |v| (QREFELT $ 30)) |z|
                                 (QREFELT $ 13))
                       (SPADCALL |v| |z| (QREFELT $ 13)) (QREFELT $ 31))
                      (QREFELT $ 28))
            (SPADCALL |vp| (QREFELT $ 32)) (QREFELT $ 33)))))) 

(DECLAIM (NOTINLINE |DoubleFloatSpecialFunctions;|)) 

(DEFUN |DoubleFloatSpecialFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G128)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|DoubleFloatSpecialFunctions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|DoubleFloatSpecialFunctions|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|DoubleFloatSpecialFunctions;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|DoubleFloatSpecialFunctions|)))))))))) 

(DEFUN |DoubleFloatSpecialFunctions;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DoubleFloatSpecialFunctions|))
          (LETT $ (GETREFV 40))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DoubleFloatSpecialFunctions| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 18
                    (|expt_DF_I| (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT) -7))
          $))) 

(MAKEPROP '|DoubleFloatSpecialFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Complex| 9) (|NonNegativeInteger|)
              |DFSFUN;polygamma;Nni2C;1| (|DoubleFloat|)
              |DFSFUN;polygamma;Nni2Df;2| |DFSFUN;besselJ;3C;3|
              |DFSFUN;besselJ;3Df;4| |DFSFUN;besselI;3C;5|
              |DFSFUN;besselI;3Df;6| (0 . |Zero|) |DFSFUN;digamma;2Df;7|
              |DFSFUN;digamma;2C;8| '|fuzz| (|Boolean|)
              (|IntegerRetractions| 9) (4 . |integer?|) |DFSFUN;besselY;3Df;9|
              (|IntegerRetractions| 6) (9 . |integer?|) (14 . |coerce|)
              (19 . +) (25 . |pi|) (29 . *) (35 . |cos|) (40 . -) (45 . -)
              (51 . |sin|) (56 . /) |DFSFUN;besselY;3C;10| (62 . |One|)
              |DFSFUN;besselK;3Df;11| (|Integer|) (66 . |coerce|)
              |DFSFUN;besselK;3C;12|)
           '#(|polygamma| 71 |digamma| 83 |besselY| 93 |besselK| 105 |besselJ|
              117 |besselI| 129)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|digamma| ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|digamma|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|polygamma|
                                 ((|DoubleFloat|) (|NonNegativeInteger|)
                                  (|DoubleFloat|)))
                                T)
                              '((|polygamma|
                                 ((|Complex| (|DoubleFloat|))
                                  (|NonNegativeInteger|)
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|besselJ|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                                T)
                              '((|besselJ|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|besselY|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                                T)
                              '((|besselY|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|besselI|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                                T)
                              '((|besselI|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|besselK|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                                T)
                              '((|besselK|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 39
                                            '(0 6 0 15 1 20 19 9 21 1 23 19 6
                                              24 1 6 0 9 25 2 6 0 0 0 26 0 6 0
                                              27 2 6 0 0 0 28 1 6 0 0 29 1 6 0
                                              0 30 2 6 0 0 0 31 1 6 0 0 32 2 6
                                              0 0 0 33 0 6 0 35 1 6 0 37 38 2 0
                                              9 7 9 10 2 0 6 7 6 8 1 0 9 9 16 1
                                              0 6 6 17 2 0 9 9 9 22 2 0 6 6 6
                                              34 2 0 6 6 6 39 2 0 9 9 9 36 2 0
                                              6 6 6 11 2 0 9 9 9 12 2 0 9 9 9
                                              14 2 0 6 6 6 13)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloatSpecialFunctions| 'NILADIC T) 
