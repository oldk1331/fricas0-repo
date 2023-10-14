
(SDEFUN |MAGCDT2;pack_modulus;LLIU;1|
        ((|lm| |List| (|Polynomial| #1=(|Integer|))) (|lvz| |List| (|Symbol|))
         (|p| . #1#)
         ($ |Union|
          (|Record| (|:| |svz| (|Symbol|)) (|:| |sm| (|U32Vector|))
                    (|:| |sp| (|Integer|)))
          "failed"))
        (SPROG ((|m| (|U32Vector|)) (|vz| (|Symbol|)))
               (SEQ
                (COND
                 ((SPADCALL (LENGTH |lvz|) 1 (QREFELT $ 8))
                  (|error| "unsupported"))
                 ((SPADCALL (LENGTH |lvz|) (LENGTH |lm|) (QREFELT $ 8))
                  (|error| "pack_modulus: #lvz ~= #lm"))
                 ('T
                  (SEQ
                   (LETT |vz| (|SPADfirst| |lvz|)
                         . #2=(|MAGCDT2;pack_modulus;LLIU;1|))
                   (LETT |m|
                         (SPADCALL (SPADCALL (|SPADfirst| |lm|) (QREFELT $ 11))
                                   |p| (QREFELT $ 14))
                         . #2#)
                   (EXIT (CONS 0 (VECTOR |vz| |m| |p|))))))))) 

(SDEFUN |MAGCDT2;pack_exps;2IRSev;2|
        ((|dg| . #1=(|Integer|)) (|msize| . #1#)
         (|mu| |Record| (|:| |svz| (|Symbol|)) (|:| |sm| (|U32Vector|))
          (|:| |sp| (|Integer|)))
         ($ |SortedExponentVector|))
        (SPROG
         ((|ii| (|Integer|)) (#2=#:G130 NIL) (|j| NIL) (|i| NIL)
          (|exps| (|SortedExponentVector|)) (|nsize| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nsize| (* (+ |dg| 1) |msize|)
                . #3=(|MAGCDT2;pack_exps;2IRSev;2|))
          (LETT |exps| (GETREFV_U32 (SPADCALL 2 |nsize| (QREFELT $ 22)) 0)
                . #3#)
          (SEQ (LETT |i| 0 . #3#) G190
               (COND ((|greater_SI| |i| |dg|) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 0 . #3#) (LETT #2# (- |msize| 1) . #3#) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ
                       (LETT |ii| (+ (SPADCALL |i| |msize| (QREFELT $ 23)) |j|)
                             . #3#)
                       (SETELT_U32 |exps| (SPADCALL 2 |ii| (QREFELT $ 24)) |i|)
                       (EXIT
                        (SETELT_U32 |exps|
                                    (+ (SPADCALL 2 |ii| (QREFELT $ 24)) 1)
                                    |j|)))
                      (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |exps|)))) 

(SDEFUN |MAGCDT2;repack1;PaUvIRV;3|
        ((|res0| |PrimitiveArray| (|U32Vector|)) (|coeffs| |U32Vector|)
         (|dg| |Integer|)
         (|mu| |Record| (|:| |svz| (|Symbol|)) (|:| |sm| (|U32Vector|))
          (|:| |sp| (|Integer|)))
         ($ |Void|))
        (SPROG
         ((|ii| (|Integer|)) (#1=#:G138 NIL) (|j| NIL) (|di| #2=(|Integer|))
          (|ci| (|U32Vector|)) (|i| NIL) (|msize| #2#) (|vz| (|Symbol|)))
         (SEQ (LETT |vz| (QVELT |mu| 0) . #3=(|MAGCDT2;repack1;PaUvIRV;3|))
              (LETT |msize| (SPADCALL (QVELT |mu| 1) (QREFELT $ 27)) . #3#)
              (EXIT
               (SEQ (LETT |i| 0 . #3#) G190
                    (COND ((|greater_SI| |i| |dg|) (GO G191)))
                    (SEQ (LETT |ci| (QAREF1 |res0| |i|) . #3#)
                         (LETT |di| (SPADCALL |ci| (QREFELT $ 27)) . #3#)
                         (EXIT
                          (SEQ (LETT |j| 0 . #3#)
                               (LETT #1# (- |msize| 1) . #3#) G190
                               (COND ((|greater_SI| |j| #1#) (GO G191)))
                               (SEQ
                                (LETT |ii|
                                      (+ (SPADCALL |i| |msize| (QREFELT $ 23))
                                         |j|)
                                      . #3#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |j| |di| (QREFELT $ 28))
                                   (SETELT_U32 |coeffs| |ii|
                                               (ELT_U32 |ci| |j|)))
                                  ('T (SETELT_U32 |coeffs| |ii| 0)))))
                               (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                               (EXIT NIL))))
                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                    (EXIT NIL)))))) 

(SDEFUN |MAGCDT2;MPtoMPT;PSLRPa;4|
        ((|x| |Polynomial| (|Integer|)) (|ivx| . #1=(|Symbol|))
         (|ivz| |List| #1#)
         (|mu| |Record| (|:| |svz| (|Symbol|)) (|:| |sm| (|U32Vector|))
          (|:| |sp| (|Integer|)))
         ($ |PrimitiveArray| (|U32Vector|)))
        (SPROG
         ((|xu| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|k| (|NonNegativeInteger|)) (|cl| (|Polynomial| (|Integer|)))
          (|res| (|PrimitiveArray| (|U32Vector|))) (|zz| (|U32Vector|))
          (|p| (|Integer|)) (|vz| (|Symbol|)))
         (SEQ (LETT |vz| (QVELT |mu| 0) . #2=(|MAGCDT2;MPtoMPT;PSLRPa;4|))
              (LETT |p| (QVELT |mu| 2) . #2#)
              (LETT |xu| (SPADCALL |x| |ivx| (QREFELT $ 34)) . #2#)
              (LETT |zz| (GETREFV_U32 1 0) . #2#)
              (LETT |res| (MAKEARR1 (+ (SPADCALL |xu| (QREFELT $ 37)) 1) |zz|)
                    . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |xu| (|spadConstant| $ 39) (QREFELT $ 40)))
                     (GO G191)))
                   (SEQ (LETT |cl| (SPADCALL |xu| (QREFELT $ 41)) . #2#)
                        (LETT |k| (SPADCALL |xu| (QREFELT $ 37)) . #2#)
                        (QSETAREF1 |res| |k|
                                   (SPADCALL (SPADCALL |cl| (QREFELT $ 11)) |p|
                                             (QREFELT $ 14)))
                        (EXIT
                         (LETT |xu| (SPADCALL |xu| (QREFELT $ 42)) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MAGCDT2;is_zero?| ((|v| |U32Vector|) ($ |Boolean|))
        (SPROG
         ((#1=#:G148 NIL) (#2=#:G149 NIL) (|i| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (QV_LEN_U32 |v|) . #3=(|MAGCDT2;is_zero?|))
                (SEQ
                 (EXIT
                  (SEQ (LETT |i| (- |n| 1) . #3#) G190
                       (COND ((< |i| 0) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (ELT_U32 |v| |i|) 0 (QREFELT $ 8))
                           (PROGN
                            (LETT #1#
                                  (PROGN (LETT #2# 'NIL . #3#) (GO #4=#:G147))
                                  . #3#)
                            (GO #5=#:G145))))))
                       (LETT |i| (+ |i| -1) . #3#) (GO G190) G191 (EXIT NIL)))
                 #5# (EXIT #1#))
                (EXIT 'T)))
          #4# (EXIT #2#)))) 

(SDEFUN |MAGCDT2;zero?;PaB;6|
        ((|v| |PrimitiveArray| (|U32Vector|)) ($ |Boolean|))
        (EQL (SPADCALL |v| (QREFELT $ 44)) -1)) 

(SDEFUN |MAGCDT2;degree;PaI;7|
        ((|v| |PrimitiveArray| (|U32Vector|)) ($ |Integer|))
        (SPROG
         ((#1=#:G155 NIL) (#2=#:G156 NIL) (|i| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (QVSIZE |v|) . #3=(|MAGCDT2;degree;PaI;7|))
                (SEQ
                 (EXIT
                  (SEQ (LETT |i| (- |n| 1) . #3#) G190
                       (COND ((< |i| 0) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (|MAGCDT2;is_zero?| (QAREF1 |v| |i|) $))
                           (PROGN
                            (LETT #1#
                                  (PROGN (LETT #2# |i| . #3#) (GO #4=#:G154))
                                  . #3#)
                            (GO #5=#:G152))))))
                       (LETT |i| (+ |i| -1) . #3#) (GO G190) G191 (EXIT NIL)))
                 #5# (EXIT #1#))
                (EXIT -1)))
          #4# (EXIT #2#)))) 

(SDEFUN |MAGCDT2;leadingCoefficient|
        ((|v| |PrimitiveArray| (|U32Vector|)) ($ |U32Vector|))
        (SPROG
         ((#1=#:G161 NIL) (#2=#:G162 NIL) (|pp| (|U32Vector|)) (|i| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (QVSIZE |v|) . #3=(|MAGCDT2;leadingCoefficient|))
                (SEQ
                 (EXIT
                  (SEQ (LETT |i| (- |n| 1) . #3#) G190
                       (COND ((< |i| 0) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (|MAGCDT2;is_zero?|
                             (LETT |pp| (QAREF1 |v| |i|) . #3#) $))
                           (PROGN
                            (LETT #1#
                                  (PROGN (LETT #2# |pp| . #3#) (GO #4=#:G160))
                                  . #3#)
                            (GO #5=#:G158))))))
                       (LETT |i| (+ |i| -1) . #3#) (GO G190) G191 (EXIT NIL)))
                 #5# (EXIT #1#))
                (EXIT (GETREFV_U32 1 0))))
          #4# (EXIT #2#)))) 

(SDEFUN |MAGCDT2;canonicalIfCan;PaRU;9|
        ((|x| |PrimitiveArray| (|U32Vector|))
         (|mu| |Record| (|:| |svz| (|Symbol|)) (|:| |sm| (|U32Vector|))
          (|:| |sp| (|Integer|)))
         ($ |Union| (|PrimitiveArray| (|U32Vector|)) "failed"))
        (SPROG
         ((|npp| (|U32Vector|)) (|dnpp| #1=(|Integer|)) (|dpp| #1#)
          (|pp| (|U32Vector|)) (#2=#:G176 NIL) (|l| NIL)
          (|res| (|PrimitiveArray| (|U32Vector|))) (|dx| (|Integer|))
          (|icl| (|U32Vector|)) (|rr1| (|U32Vector|))
          (|rr| (|List| (|U32Vector|))) (|cl| (|U32Vector|)) (|p| (|Integer|))
          (|m| (|U32Vector|)))
         (SEQ (LETT |m| (QVELT |mu| 1) . #3=(|MAGCDT2;canonicalIfCan;PaRU;9|))
              (LETT |p| (QVELT |mu| 2) . #3#)
              (LETT |cl| (|MAGCDT2;leadingCoefficient| |x| $) . #3#)
              (LETT |rr| (SPADCALL |cl| |m| |p| (QREFELT $ 47)) . #3#)
              (LETT |rr1| (|SPADfirst| |rr|) . #3#)
              (EXIT
               (COND
                ((OR (SPADCALL (SPADCALL |rr1| (QREFELT $ 27)) 0 (QREFELT $ 8))
                     (SPADCALL (ELT_U32 |rr1| 0) 1 (QREFELT $ 8)))
                 (CONS 1 "failed"))
                ('T
                 (SEQ (LETT |icl| (SPADCALL |rr| 2 (QREFELT $ 48)) . #3#)
                      (LETT |dx| (SPADCALL |x| (QREFELT $ 44)) . #3#)
                      (LETT |res| (MAKEARR1 (+ |dx| 1) (QAREF1 |x| 0)) . #3#)
                      (SEQ (LETT |l| 0 . #3#) (LETT #2# (- |dx| 1) . #3#) G190
                           (COND ((|greater_SI| |l| #2#) (GO G191)))
                           (SEQ
                            (LETT |pp|
                                  (SPADCALL |icl| (QAREF1 |x| |l|) |p|
                                            (QREFELT $ 49))
                                  . #3#)
                            (SPADCALL |pp| |m| |p| (QREFELT $ 50))
                            (LETT |dpp| (SPADCALL |pp| (QREFELT $ 27)) . #3#)
                            (LETT |dnpp| (COND ((< |dpp| 0) 0) ('T |dpp|))
                                  . #3#)
                            (LETT |npp| (GETREFV_U32 (+ |dnpp| 1) 0) . #3#)
                            (SPADCALL |npp| |pp| (+ |dpp| 1) (QREFELT $ 51))
                            (EXIT (QSETAREF1 |res| |l| |npp|)))
                           (LETT |l| (|inc_SI| |l|) . #3#) (GO G190) G191
                           (EXIT NIL))
                      (QSETAREF1 |res| |dx| (GETREFV_U32 1 1))
                      (EXIT (CONS 0 |res|))))))))) 

(SDEFUN |MAGCDT2;pseudoRem;2PaRPa;10|
        ((|x| . #1=(|PrimitiveArray| (|U32Vector|))) (|y| . #1#)
         (|mu| |Record| (|:| |svz| (|Symbol|)) (|:| |sm| (|U32Vector|))
          (|:| |sp| (|Integer|)))
         ($ |PrimitiveArray| (|U32Vector|)))
        (SPROG
         ((|npp1| (|U32Vector|)) (|degnpp1| #2=(|Integer|)) (|degpp1| #2#)
          (|pp1| #3=(|U32Vector|)) (|dp2| #2#) (|dp1| #2#) (|pp2| #3#)
          (|l1| (|NonNegativeInteger|)) (#4=#:G187 NIL) (|l| NIL)
          (#5=#:G186 NIL) (|del| #6=(|NonNegativeInteger|)) (|p| (|Integer|))
          (|m| (|U32Vector|)) (|res| (|PrimitiveArray| (|U32Vector|)))
          (|i1| #6#) (|c| #7=(|U32Vector|)) (|cy| #7#) (|j| #8=(|Integer|))
          (|i| #8#))
         (SEQ
          (LETT |i| (SPADCALL |x| (QREFELT $ 44))
                . #9=(|MAGCDT2;pseudoRem;2PaRPa;10|))
          (LETT |j| (SPADCALL |y| (QREFELT $ 44)) . #9#)
          (EXIT
           (COND ((EQL |j| 0) (MAKEARR1 1 (GETREFV_U32 1 0))) ((< |i| |j|) |x|)
                 ('T
                  (SEQ (LETT |cy| (|MAGCDT2;leadingCoefficient| |y| $) . #9#)
                       (LETT |c| (|MAGCDT2;leadingCoefficient| |x| $) . #9#)
                       (LETT |i1| (- |i| 1) . #9#)
                       (LETT |res| (MAKEARR1 (+ |i1| 1) (QAREF1 |x| 0)) . #9#)
                       (LETT |m| (QVELT |mu| 1) . #9#)
                       (LETT |p| (QVELT |mu| 2) . #9#)
                       (LETT |del| (- |i| |j|) . #9#)
                       (SEQ (LETT |l| 0 . #9#) (LETT #5# (- |del| 1) . #9#)
                            G190 (COND ((|greater_SI| |l| #5#) (GO G191)))
                            (SEQ
                             (LETT |pp1|
                                   (SPADCALL |cy| (QAREF1 |x| |l|) |p|
                                             (QREFELT $ 49))
                                   . #9#)
                             (SPADCALL |pp1| |m| |p| (QREFELT $ 50))
                             (LETT |degpp1| (SPADCALL |pp1| (QREFELT $ 27))
                                   . #9#)
                             (LETT |degnpp1|
                                   (COND ((< |degpp1| 0) 0) ('T |degpp1|))
                                   . #9#)
                             (LETT |npp1| (GETREFV_U32 (+ |degnpp1| 1) 0)
                                   . #9#)
                             (SPADCALL |npp1| |pp1| (+ |degpp1| 1)
                                       (QREFELT $ 51))
                             (EXIT (QSETAREF1 |res| |l| |npp1|)))
                            (LETT |l| (|inc_SI| |l|) . #9#) (GO G190) G191
                            (EXIT NIL))
                       (SEQ (LETT |l| 0 . #9#) (LETT #4# (- |j| 1) . #9#) G190
                            (COND ((|greater_SI| |l| #4#) (GO G191)))
                            (SEQ (LETT |l1| (+ |l| |del|) . #9#)
                                 (LETT |pp1|
                                       (SPADCALL |cy| (QAREF1 |x| |l1|) |p|
                                                 (QREFELT $ 49))
                                       . #9#)
                                 (LETT |pp2|
                                       (SPADCALL |c| (QAREF1 |y| |l|) |p|
                                                 (QREFELT $ 49))
                                       . #9#)
                                 (LETT |dp1| (SPADCALL |pp1| (QREFELT $ 27))
                                       . #9#)
                                 (LETT |dp2| (SPADCALL |pp2| (QREFELT $ 27))
                                       . #9#)
                                 (COND
                                  ((>= |dp1| |dp2|)
                                   (SPADCALL |pp1| |pp2| 0 |dp2| (- |p| 1) |p|
                                             (QREFELT $ 54)))
                                  ('T
                                   (SEQ
                                    (SPADCALL |pp2| |pp1| 0 |dp1| (- |p| 1) |p|
                                              (QREFELT $ 54))
                                    (SPADCALL |pp2| |dp2| (- |p| 1) |p|
                                              (QREFELT $ 55))
                                    (EXIT (LETT |pp1| |pp2| . #9#)))))
                                 (SPADCALL |pp1| |m| |p| (QREFELT $ 50))
                                 (LETT |degpp1| (SPADCALL |pp1| (QREFELT $ 27))
                                       . #9#)
                                 (LETT |degnpp1|
                                       (COND ((< |degpp1| 0) 0) ('T |degpp1|))
                                       . #9#)
                                 (LETT |npp1| (GETREFV_U32 (+ |degnpp1| 1) 0)
                                       . #9#)
                                 (SPADCALL |npp1| |pp1| (+ |degpp1| 1)
                                           (QREFELT $ 51))
                                 (EXIT (QSETAREF1 |res| |l1| |npp1|)))
                            (LETT |l| (|inc_SI| |l|) . #9#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |res|)))))))) 

(DECLAIM (NOTINLINE |ModularAlgebraicGcdTools2;|)) 

(DEFUN |ModularAlgebraicGcdTools2| ()
  (SPROG NIL
         (PROG (#1=#:G191)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ModularAlgebraicGcdTools2|)
                    . #2=(|ModularAlgebraicGcdTools2|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ModularAlgebraicGcdTools2|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|ModularAlgebraicGcdTools2;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|ModularAlgebraicGcdTools2|)))))))))) 

(DEFUN |ModularAlgebraicGcdTools2;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ModularAlgebraicGcdTools2|)
                . #1=(|ModularAlgebraicGcdTools2|))
          (LETT $ (GETREFV 57) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ModularAlgebraicGcdTools2| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ModularAlgebraicGcdTools2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Boolean|) (|Integer|) (0 . ~=)
              (|SparseUnivariatePolynomial| 7) (|Polynomial| 7)
              (6 . |univariate|) (|U32Vector|)
              (|U32VectorPolynomialOperations|) (11 . |to_mod_pa|)
              (|Record| (|:| |svz| 33) (|:| |sm| 12) (|:| |sp| 7))
              (|Union| 15 '"failed") (|List| 10) (|List| 33)
              |MAGCDT2;pack_modulus;LLIU;1| (|PositiveInteger|)
              (|NonNegativeInteger|) (17 . *) (23 . *) (29 . *)
              (|SortedExponentVector|) |MAGCDT2;pack_exps;2IRSev;2|
              (35 . |degree|) (40 . <=) (|Void|) (|PrimitiveArray| 12)
              |MAGCDT2;repack1;PaUvIRV;3| (|SparseUnivariatePolynomial| $)
              (|Symbol|) (46 . |univariate|) (52 . |One|)
              (|SparseUnivariatePolynomial| 10) (56 . |degree|) (61 . |Zero|)
              (65 . |Zero|) (69 . ~=) (75 . |leadingCoefficient|)
              (80 . |reductum|) |MAGCDT2;MPtoMPT;PSLRPa;4|
              |MAGCDT2;degree;PaI;7| |MAGCDT2;zero?;PaB;6| (|List| 12)
              (85 . |extended_gcd|) (92 . |elt|) (98 . |mul|)
              (105 . |remainder!|) (112 . |copy_first|) (|Union| 30 '"failed")
              |MAGCDT2;canonicalIfCan;PaRU;9| (119 . |vector_add_mul|)
              (129 . |mul_by_scalar|) |MAGCDT2;pseudoRem;2PaRPa;10|)
           '#(|zero?| 137 |repack1| 142 |pseudoRem| 150 |pack_modulus| 157
              |pack_exps| 164 |degree| 171 |canonicalIfCan| 176 |MPtoMPT| 182)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|ModularAlgebraicGcdOperations| 30 15))
                             (|makeByteWordVec2| 56
                                                 '(2 7 6 0 0 8 1 10 9 0 11 2 13
                                                   12 9 7 14 2 21 0 20 0 22 2 7
                                                   0 21 0 23 2 7 0 20 0 24 1 13
                                                   7 12 27 2 7 6 0 0 28 2 10 32
                                                   0 33 34 0 10 0 35 1 36 21 0
                                                   37 0 10 0 38 0 36 0 39 2 36
                                                   6 0 0 40 1 36 10 0 41 1 36 0
                                                   0 42 3 13 46 12 12 7 47 2 46
                                                   12 0 7 48 3 13 12 12 12 7 49
                                                   3 13 29 12 12 7 50 3 13 29
                                                   12 12 7 51 6 13 29 12 12 7 7
                                                   7 7 54 4 13 29 12 7 7 7 55 1
                                                   0 6 30 45 4 0 29 30 12 7 15
                                                   31 3 0 30 30 30 15 56 3 0 16
                                                   17 18 7 19 3 0 25 7 7 15 26
                                                   1 0 7 30 44 2 0 52 30 15 53
                                                   4 0 30 10 33 18 15 43)))))
           '|lookupComplete|)) 

(MAKEPROP '|ModularAlgebraicGcdTools2| 'NILADIC T) 
