
(SDEFUN |RDEEFX2;do_risch_DE;2FSLR;1|
        ((|f| F) (|g| F) (|x| |Symbol|) (|lk| |List| (|Kernel| F))
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG
         ((|p1| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|part|
           #1=(|Union| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))
                       "failed"))
          (|res1|
           (|Record| (|:| |particular| #1#)
                     (|:| |basis|
                          (|List|
                           (|Record| (|:| |ratpart| F)
                                     (|:| |coeffs| (|Vector| F)))))))
          (|logi|
           (|Mapping|
            (|Record| (|:| |logands| (|List| F))
                      (|:| |basis|
                           (|List| (|Vector| (|Fraction| (|Integer|))))))
            (|List| (|Kernel| F)) (|List| F)))
          (|ext|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| (|Kernel| F)) (|List| F))))
         (SEQ
          (LETT |ext| (CONS #'|RDEEFX2;do_risch_DE;2FSLR;1!0| (VECTOR $ |x|))
                . #2=(|RDEEFX2;do_risch_DE;2FSLR;1|))
          (LETT |logi| (CONS #'|RDEEFX2;do_risch_DE;2FSLR;1!1| (VECTOR $ |x|))
                . #2#)
          (LETT |res1|
                (SPADCALL 1 |f| |g| NIL |x| |lk| |ext| |logi| (QREFELT $ 25))
                . #2#)
          (LETT |part| (QCAR |res1|) . #2#)
          (EXIT
           (COND
            ((QEQCAR |part| 1)
             (VECTOR (|spadConstant| $ 27) (|spadConstant| $ 27)
                     (|spadConstant| $ 27) NIL))
            ('T
             (SEQ (LETT |p1| (QCDR |part|) . #2#)
                  (EXIT
                   (VECTOR (QCAR |p1|) |g| (|spadConstant| $ 27) 'T))))))))) 

(SDEFUN |RDEEFX2;do_risch_DE;2FSLR;1!1| ((|x2| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|RDEEFX2;do_risch_DE;2FSLR;1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |x2| |x3| (QREFELT $ 16)))))) 

(SDEFUN |RDEEFX2;do_risch_DE;2FSLR;1!0| ((|x4| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|RDEEFX2;do_risch_DE;2FSLR;1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |x4| |x3| (QREFELT $ 14)))))) 

(SDEFUN |RDEEFX2;risch_de_ext;I2FSR;2|
        ((|n| |Integer|) (|f| F) (|g| F) (|x| |Symbol|)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPADCALL |n| |f| |g| |x| (QREFELT $ 31))) 

(SDEFUN |RDEEFX2;risch_de_ext;I2FSR;3|
        ((|n| |Integer|) (|f| F) (|g| F) (|x| |Symbol|)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG ((|lk| (|List| (|Kernel| F))))
               (SEQ
                (LETT |lk|
                      (SPADCALL
                       (SPADCALL (SPADCALL |f| (QREFELT $ 34))
                                 (SPADCALL |g| (QREFELT $ 34)) (QREFELT $ 36))
                       |x| (QREFELT $ 37))
                      |RDEEFX2;risch_de_ext;I2FSR;3|)
                (EXIT
                 (SPADCALL (SPADCALL |n| |f| (QREFELT $ 38)) |g| |x| |lk|
                           (QREFELT $ 29)))))) 

(SDEFUN |RDEEFX2;risch_de_ext;I2FSR;4|
        ((|n| |Integer|) (|f| F) (|g| F) (|x| |Symbol|)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG ((|lk| (|List| (|Kernel| F))))
               (SEQ
                (LETT |lk|
                      (SPADCALL
                       (SPADCALL (SPADCALL |f| (QREFELT $ 34))
                                 (SPADCALL |g| (QREFELT $ 34)) (QREFELT $ 36))
                       |x| (QREFELT $ 37))
                      |RDEEFX2;risch_de_ext;I2FSR;4|)
                (EXIT
                 (SPADCALL (SPADCALL |n| |f| (QREFELT $ 38)) |g| |x| |lk|
                           (QREFELT $ 29)))))) 

(SDEFUN |RDEEFX2;risch_de_ext;I2FSR;5|
        ((|n| |Integer|) (|f| F) (|g| F) (|x| |Symbol|)
         ($ |Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
          (|:| |sol?| (|Boolean|))))
        (SPROG ((|lk| (|List| (|Kernel| F))))
               (SEQ
                (LETT |lk|
                      (SPADCALL
                       (SPADCALL (SPADCALL |f| (QREFELT $ 34))
                                 (SPADCALL |g| (QREFELT $ 34)) (QREFELT $ 36))
                       |x| (QREFELT $ 37))
                      |RDEEFX2;risch_de_ext;I2FSR;5|)
                (EXIT
                 (SPADCALL (SPADCALL |n| |f| (QREFELT $ 38)) |g| |x| |lk|
                           (QREFELT $ 29)))))) 

(DECLAIM (NOTINLINE |ElementaryRischDEX2;|)) 

(DEFUN |ElementaryRischDEX2| (&REST #1=#:G132)
  (SPROG NIL
         (PROG (#2=#:G133)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryRischDEX2|)
                                               '|domainEqualList|)
                    . #3=(|ElementaryRischDEX2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ElementaryRischDEX2;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ElementaryRischDEX2|)))))))))) 

(DEFUN |ElementaryRischDEX2;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryRischDEX2|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ElementaryRischDEX2| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 39) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ElementaryRischDEX2|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#1| '(|EuclideanDomain|))
            (COND
             ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
              (COND
               ((|HasCategory| |#2| '(|SpecialFunctionCategory|))
                (QSETREFV $ 32
                          (CONS
                           (|dispatchFunction| |RDEEFX2;risch_de_ext;I2FSR;2|)
                           $)))
               ('T
                (PROGN
                 (QSETREFV $ 32
                           (CONS
                            (|dispatchFunction| |RDEEFX2;risch_de_ext;I2FSR;3|)
                            $))))))
             ('T
              (PROGN
               (QSETREFV $ 32
                         (CONS
                          (|dispatchFunction| |RDEEFX2;risch_de_ext;I2FSR;4|)
                          $))))))
           ('T
            (PROGN
             (QSETREFV $ 32
                       (CONS
                        (|dispatchFunction| |RDEEFX2;risch_de_ext;I2FSR;5|)
                        $)))))
          $))) 

(MAKEPROP '|ElementaryRischDEX2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |ratpart| 7) (|:| |coeffs| (|Vector| 7)))
              (|List| 8) (|Symbol|) (|List| (|Kernel| 7)) (|List| 7)
              (|ParametricIntegration| 6 7) (0 . |extendedint|)
              (|Record| (|:| |logands| 12)
                        (|:| |basis| (|List| (|Vector| (|Fraction| 21)))))
              (7 . |logextint|) (14 . |One|) (18 . |One|) (|Union| 8 '"failed")
              (|Record| (|:| |particular| 19) (|:| |basis| 9)) (|Integer|)
              (|Mapping| 9 11 12) (|Mapping| 15 11 12)
              (|ParametricRischDE| 6 7) (22 . |param_rde|) (34 . |Zero|)
              (38 . |Zero|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |primpart| 7)
                        (|:| |sol?| (|Boolean|)))
              |RDEEFX2;do_risch_DE;2FSLR;1| (|ElementaryRischDEX| 6 7)
              (42 . |ei_int|) (50 . |risch_de_ext|) (|List| (|Kernel| $))
              (58 . |tower|) (|IntegrationTools| 6 7) (63 . |union|)
              (69 . |varselect|) (75 . *))
           '#(|risch_de_ext| 81 |do_risch_DE| 89) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 38
                                                 '(3 13 9 10 11 12 14 3 13 15
                                                   10 11 12 16 0 6 0 17 0 7 0
                                                   18 8 24 20 21 7 7 12 10 11
                                                   22 23 25 0 6 0 26 0 7 0 27 4
                                                   30 28 21 7 7 10 31 4 0 28 21
                                                   7 7 10 32 1 7 33 0 34 2 35
                                                   11 11 11 36 2 35 11 11 10 37
                                                   2 7 0 21 0 38 4 0 28 21 7 7
                                                   10 32 4 0 28 7 7 10 11
                                                   29)))))
           '|lookupComplete|)) 
