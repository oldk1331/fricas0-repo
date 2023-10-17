
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

(PUT '|DFSFUN;hypergeometric0F1;3C;7| '|SPADreplace| '|c_hyper0f1|) 

(SDEFUN |DFSFUN;hypergeometric0F1;3C;7|
        ((|a| (|Complex| (|DoubleFloat|))) (|z| (|Complex| (|DoubleFloat|)))
         ($ (|Complex| (|DoubleFloat|))))
        (|c_hyper0f1| |a| |z|)) 

(SDEFUN |DFSFUN;hypergeometric0F1;3Df;8|
        ((|n| (|DoubleFloat|)) (|x| (|DoubleFloat|)) ($ (|DoubleFloat|)))
        (SPADCALL
         (SPADCALL (SPADCALL |n| (QREFELT $ 16)) (SPADCALL |x| (QREFELT $ 16))
                   (QREFELT $ 15))
         (QREFELT $ 17))) 

(SDEFUN |DFSFUN;digamma;2Df;9| ((|x| (|DoubleFloat|)) ($ (|DoubleFloat|)))
        (SPADCALL 0 |x| (QREFELT $ 10))) 

(SDEFUN |DFSFUN;digamma;2C;10|
        ((|z| (|Complex| (|DoubleFloat|))) ($ (|Complex| (|DoubleFloat|))))
        (SPADCALL 0 |z| (QREFELT $ 8))) 

(SDEFUN |DFSFUN;besselY;3Df;11|
        ((|n| (|DoubleFloat|)) (|x| (|DoubleFloat|)) ($ (|DoubleFloat|)))
        (SPROG ((|vp| (|DoubleFloat|)))
               (SEQ
                (COND
                 ((SPADCALL |n| (QREFELT $ 25))
                  (LETT |n| (|add_DF| |n| (QREFELT $ 22)))))
                (LETT |vp|
                      (|mul_DF| |n| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)))
                (EXIT
                 (|div_DF|
                  (|sub_DF|
                   (|mul_DF| (|cos_DF| |vp|) (SPADCALL |n| |x| (QREFELT $ 12)))
                   (SPADCALL (|minus_DF| |n|) |x| (QREFELT $ 12)))
                  (|sin_DF| |vp|)))))) 

(SDEFUN |DFSFUN;besselY;3C;12|
        ((|v| (|Complex| (|DoubleFloat|))) (|z| (|Complex| (|DoubleFloat|)))
         ($ (|Complex| (|DoubleFloat|))))
        (SPROG ((|vp| (|Complex| (|DoubleFloat|))))
               (SEQ
                (COND
                 ((SPADCALL |v| (QREFELT $ 28))
                  (LETT |v|
                        (SPADCALL |v| (SPADCALL (QREFELT $ 22) (QREFELT $ 16))
                                  (QREFELT $ 29)))))
                (LETT |vp|
                      (SPADCALL |v| (SPADCALL (QREFELT $ 30)) (QREFELT $ 31)))
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |vp| (QREFELT $ 32))
                             (SPADCALL |v| |z| (QREFELT $ 11)) (QREFELT $ 31))
                   (SPADCALL (SPADCALL |v| (QREFELT $ 33)) |z| (QREFELT $ 11))
                   (QREFELT $ 34))
                  (SPADCALL |vp| (QREFELT $ 35)) (QREFELT $ 36)))))) 

(SDEFUN |DFSFUN;besselK;3Df;13|
        ((|n| (|DoubleFloat|)) (|x| (|DoubleFloat|)) ($ (|DoubleFloat|)))
        (SPROG
         ((|ahalf| (|DoubleFloat|)) (|vp| (|DoubleFloat|))
          (|p| (|DoubleFloat|)))
         (SEQ
          (COND
           ((SPADCALL |n| (QREFELT $ 25))
            (LETT |n| (|add_DF| |n| (QREFELT $ 22)))))
          (LETT |p| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT))
          (LETT |vp| (|mul_DF| |n| |p|))
          (LETT |ahalf| (|div_DF| 1.0 (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)))
          (EXIT
           (|div_DF|
            (|mul_DF| (|mul_DF| |p| |ahalf|)
                      (|sub_DF| (SPADCALL (|minus_DF| |n|) |x| (QREFELT $ 14))
                                (SPADCALL |n| |x| (QREFELT $ 14))))
            (|sin_DF| |vp|)))))) 

(SDEFUN |DFSFUN;besselK;3C;14|
        ((|v| (|Complex| (|DoubleFloat|))) (|z| (|Complex| (|DoubleFloat|)))
         ($ (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|ahalf| (|Complex| (|DoubleFloat|)))
          (|vp| (|Complex| (|DoubleFloat|))) (|p| (|Complex| (|DoubleFloat|))))
         (SEQ
          (COND
           ((SPADCALL |v| (QREFELT $ 28))
            (LETT |v|
                  (SPADCALL |v| (SPADCALL (QREFELT $ 22) (QREFELT $ 16))
                            (QREFELT $ 29)))))
          (LETT |p| (SPADCALL (QREFELT $ 30)))
          (LETT |vp| (SPADCALL |v| |p| (QREFELT $ 31)))
          (LETT |ahalf|
                (SPADCALL (|spadConstant| $ 38) (SPADCALL 2 (QREFELT $ 41))
                          (QREFELT $ 36)))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |p| |ahalf| (QREFELT $ 31))
                      (SPADCALL
                       (SPADCALL (SPADCALL |v| (QREFELT $ 33)) |z|
                                 (QREFELT $ 13))
                       (SPADCALL |v| |z| (QREFELT $ 13)) (QREFELT $ 34))
                      (QREFELT $ 31))
            (SPADCALL |vp| (QREFELT $ 35)) (QREFELT $ 36)))))) 

(SDEFUN |DFSFUN;airyAi;2Df;15| ((|x| (|DoubleFloat|)) ($ (|DoubleFloat|)))
        (SPROG
         ((|eta| (|DoubleFloat|)) (|athird| (|DoubleFloat|)) (#1=#:G130 NIL)
          (|ahalf| (|DoubleFloat|)))
         (SEQ
          (LETT |ahalf|
                (PROG2
                    (LETT #1#
                          (SPADCALL (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                    (QREFELT $ 44)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|DoubleFloat|)
                                  (|Union| (|DoubleFloat|) #2="failed") #1#)))
          (LETT |athird|
                (PROG2
                    (LETT #1#
                          (SPADCALL (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                                    (QREFELT $ 44)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|DoubleFloat|)
                                  (|Union| (|DoubleFloat|) #2#) #1#)))
          (LETT |eta|
                (|mul_DF| (SPADCALL 2 |athird| (QREFELT $ 46))
                          (SPADCALL (|minus_DF| |x|)
                                    (SPADCALL 3 |ahalf| (QREFELT $ 46))
                                    (QREFELT $ 47))))
          (EXIT
           (|mul_DF|
            (|mul_DF| (SPADCALL (|minus_DF| |x|) |ahalf| (QREFELT $ 47))
                      |athird|)
            (|add_DF| (SPADCALL (|minus_DF| |athird|) |eta| (QREFELT $ 12))
                      (SPADCALL |athird| |eta| (QREFELT $ 12)))))))) 

(SDEFUN |DFSFUN;airyAi;2C;16|
        ((|z| (|Complex| (|DoubleFloat|))) ($ (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|eta| (|Complex| (|DoubleFloat|)))
          (|athird| (|Complex| (|DoubleFloat|))) (#1=#:G135 NIL)
          (|ahalf| (|Complex| (|DoubleFloat|))))
         (SEQ
          (LETT |ahalf|
                (PROG2
                    (LETT #1#
                          (SPADCALL (SPADCALL 2 (QREFELT $ 41))
                                    (QREFELT $ 49)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Complex| (|DoubleFloat|))
                                  (|Union| (|Complex| (|DoubleFloat|))
                                           #2="failed")
                                  #1#)))
          (LETT |athird|
                (PROG2
                    (LETT #1#
                          (SPADCALL (SPADCALL 3 (QREFELT $ 41))
                                    (QREFELT $ 49)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Complex| (|DoubleFloat|))
                                  (|Union| (|Complex| (|DoubleFloat|)) #2#)
                                  #1#)))
          (LETT |eta|
                (SPADCALL (SPADCALL 2 |athird| (QREFELT $ 50))
                          (SPADCALL (SPADCALL |z| (QREFELT $ 33))
                                    (SPADCALL 3 |ahalf| (QREFELT $ 50))
                                    (QREFELT $ 51))
                          (QREFELT $ 31)))
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL (SPADCALL |z| (QREFELT $ 33)) |ahalf| (QREFELT $ 51))
             |athird| (QREFELT $ 31))
            (SPADCALL
             (SPADCALL (SPADCALL |athird| (QREFELT $ 33)) |eta| (QREFELT $ 11))
             (SPADCALL |athird| |eta| (QREFELT $ 11)) (QREFELT $ 29))
            (QREFELT $ 31)))))) 

(SDEFUN |DFSFUN;airyBi;2Df;17| ((|x| (|DoubleFloat|)) ($ (|DoubleFloat|)))
        (SPROG
         ((|eta| (|DoubleFloat|)) (|athird| (|DoubleFloat|)) (#1=#:G140 NIL)
          (|ahalf| (|DoubleFloat|)))
         (SEQ
          (LETT |ahalf|
                (PROG2
                    (LETT #1#
                          (SPADCALL (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                    (QREFELT $ 44)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|DoubleFloat|)
                                  (|Union| (|DoubleFloat|) #2="failed") #1#)))
          (LETT |athird|
                (PROG2
                    (LETT #1#
                          (SPADCALL (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                                    (QREFELT $ 44)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|DoubleFloat|)
                                  (|Union| (|DoubleFloat|) #2#) #1#)))
          (LETT |eta|
                (|mul_DF| (SPADCALL 2 |athird| (QREFELT $ 46))
                          (SPADCALL (|minus_DF| |x|)
                                    (SPADCALL 3 |ahalf| (QREFELT $ 46))
                                    (QREFELT $ 47))))
          (EXIT
           (|mul_DF|
            (SPADCALL (|minus_DF| (|mul_DF| |x| |athird|)) |ahalf|
                      (QREFELT $ 47))
            (|sub_DF| (SPADCALL (|minus_DF| |athird|) |eta| (QREFELT $ 12))
                      (SPADCALL |athird| |eta| (QREFELT $ 12)))))))) 

(SDEFUN |DFSFUN;airyBi;2C;18|
        ((|z| (|Complex| (|DoubleFloat|))) ($ (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|eta| (|Complex| (|DoubleFloat|)))
          (|athird| (|Complex| (|DoubleFloat|))) (#1=#:G145 NIL)
          (|ahalf| (|Complex| (|DoubleFloat|))))
         (SEQ
          (LETT |ahalf|
                (PROG2
                    (LETT #1#
                          (SPADCALL (SPADCALL 2 (QREFELT $ 41))
                                    (QREFELT $ 49)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Complex| (|DoubleFloat|))
                                  (|Union| (|Complex| (|DoubleFloat|))
                                           #2="failed")
                                  #1#)))
          (LETT |athird|
                (PROG2
                    (LETT #1#
                          (SPADCALL (SPADCALL 3 (QREFELT $ 41))
                                    (QREFELT $ 49)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Complex| (|DoubleFloat|))
                                  (|Union| (|Complex| (|DoubleFloat|)) #2#)
                                  #1#)))
          (LETT |eta|
                (SPADCALL (SPADCALL 2 |athird| (QREFELT $ 50))
                          (SPADCALL (SPADCALL |z| (QREFELT $ 33))
                                    (SPADCALL 3 |ahalf| (QREFELT $ 50))
                                    (QREFELT $ 51))
                          (QREFELT $ 31)))
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL (SPADCALL |z| |athird| (QREFELT $ 31)) (QREFELT $ 33))
             |ahalf| (QREFELT $ 51))
            (SPADCALL
             (SPADCALL (SPADCALL |athird| (QREFELT $ 33)) |eta| (QREFELT $ 11))
             (SPADCALL |athird| |eta| (QREFELT $ 11)) (QREFELT $ 34))
            (QREFELT $ 31)))))) 

(DECLAIM (NOTINLINE |DoubleFloatSpecialFunctions;|)) 

(DEFUN |DoubleFloatSpecialFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G150)
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
          (LETT $ (GETREFV 55))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DoubleFloatSpecialFunctions| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 22
                    (|expt_DF_I| (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT) -7))
          $))) 

(MAKEPROP '|DoubleFloatSpecialFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Complex| 9) (|NonNegativeInteger|)
              |DFSFUN;polygamma;Nni2C;1| (|DoubleFloat|)
              |DFSFUN;polygamma;Nni2Df;2| |DFSFUN;besselJ;3C;3|
              |DFSFUN;besselJ;3Df;4| |DFSFUN;besselI;3C;5|
              |DFSFUN;besselI;3Df;6| |DFSFUN;hypergeometric0F1;3C;7|
              (0 . |coerce|) (5 . |retract|) |DFSFUN;hypergeometric0F1;3Df;8|
              (10 . |Zero|) |DFSFUN;digamma;2Df;9| |DFSFUN;digamma;2C;10|
              '|fuzz| (|Boolean|) (|IntegerRetractions| 9) (14 . |integer?|)
              |DFSFUN;besselY;3Df;11| (|IntegerRetractions| 6)
              (19 . |integer?|) (24 . +) (30 . |pi|) (34 . *) (40 . |cos|)
              (45 . -) (50 . -) (56 . |sin|) (61 . /) |DFSFUN;besselY;3C;12|
              (67 . |One|) |DFSFUN;besselK;3Df;13| (|Integer|) (71 . |coerce|)
              |DFSFUN;besselK;3C;14| (|Union| $ '"failed") (76 . |recip|)
              (|PositiveInteger|) (81 . *) (87 . ^) |DFSFUN;airyAi;2Df;15|
              (93 . |recip|) (98 . *) (104 . ^) |DFSFUN;airyAi;2C;16|
              |DFSFUN;airyBi;2Df;17| |DFSFUN;airyBi;2C;18|)
           '#(|polygamma| 110 |hypergeometric0F1| 122 |digamma| 134 |besselY|
              144 |besselK| 156 |besselJ| 168 |besselI| 180 |airyBi| 192
              |airyAi| 202)
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
                                T)
                              '((|airyAi|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|airyAi| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|airyBi| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|airyBi|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|hypergeometric0F1|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                                T)
                              '((|hypergeometric0F1|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 54
                                            '(1 6 0 9 16 1 6 9 0 17 0 6 0 19 1
                                              24 23 9 25 1 27 23 6 28 2 6 0 0 0
                                              29 0 6 0 30 2 6 0 0 0 31 1 6 0 0
                                              32 1 6 0 0 33 2 6 0 0 0 34 1 6 0
                                              0 35 2 6 0 0 0 36 0 6 0 38 1 6 0
                                              40 41 1 9 43 0 44 2 9 0 45 0 46 2
                                              9 0 0 0 47 1 6 43 0 49 2 6 0 45 0
                                              50 2 6 0 0 0 51 2 0 6 7 6 8 2 0 9
                                              7 9 10 2 0 6 6 6 15 2 0 9 9 9 18
                                              1 0 6 6 21 1 0 9 9 20 2 0 9 9 9
                                              26 2 0 6 6 6 37 2 0 9 9 9 39 2 0
                                              6 6 6 42 2 0 6 6 6 11 2 0 9 9 9
                                              12 2 0 9 9 9 14 2 0 6 6 6 13 1 0
                                              9 9 53 1 0 6 6 54 1 0 6 6 52 1 0
                                              9 9 48)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloatSpecialFunctions| 'NILADIC T) 
