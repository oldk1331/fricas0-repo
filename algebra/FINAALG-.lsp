
(SDEFUN |FINAALG-;leftCharacteristicPolynomial;SSup;1|
        ((|a| S) ($ |SparseUnivariatePolynomial| R))
        (SPROG
         ((#1=#:G137 NIL) (|j| NIL) (#2=#:G136 NIL) (|i| NIL)
          (|mb| (|Matrix| (|SparseUnivariatePolynomial| R)))
          (|ma| (|Matrix| R)) (|n| (|PositiveInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT $ 9)))
              (LETT |ma|
                    (SPADCALL |a| (SPADCALL (QREFELT $ 11)) (QREFELT $ 13)))
              (LETT |mb| (SPADCALL |n| |n| (QREFELT $ 16)))
              (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #1# |n|) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |mb| |i| |j|
                                      (COND
                                       ((EQL |i| |j|)
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |ma| |i| |j|
                                                    (QREFELT $ 18))
                                          0 (QREFELT $ 20))
                                         (SPADCALL (|spadConstant| $ 21) 1
                                                   (QREFELT $ 20))
                                         (QREFELT $ 22)))
                                       ('T
                                        (SPADCALL
                                         (SPADCALL |ma| |i| |j| (QREFELT $ 18))
                                         1 (QREFELT $ 20))))
                                      (QREFELT $ 23))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |mb| (QREFELT $ 24)))))) 

(SDEFUN |FINAALG-;rightCharacteristicPolynomial;SSup;2|
        ((|a| S) ($ |SparseUnivariatePolynomial| R))
        (SPROG
         ((#1=#:G143 NIL) (|j| NIL) (#2=#:G142 NIL) (|i| NIL)
          (|mb| (|Matrix| (|SparseUnivariatePolynomial| R)))
          (|ma| (|Matrix| R)) (|n| (|PositiveInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT $ 9)))
              (LETT |ma|
                    (SPADCALL |a| (SPADCALL (QREFELT $ 11)) (QREFELT $ 26)))
              (LETT |mb| (SPADCALL |n| |n| (QREFELT $ 16)))
              (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #1# |n|) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |mb| |i| |j|
                                      (COND
                                       ((EQL |i| |j|)
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |ma| |i| |j|
                                                    (QREFELT $ 18))
                                          0 (QREFELT $ 20))
                                         (SPADCALL (|spadConstant| $ 21) 1
                                                   (QREFELT $ 20))
                                         (QREFELT $ 22)))
                                       ('T
                                        (SPADCALL
                                         (SPADCALL |ma| |i| |j| (QREFELT $ 18))
                                         1 (QREFELT $ 20))))
                                      (QREFELT $ 23))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |mb| (QREFELT $ 24)))))) 

(SDEFUN |FINAALG-;leftTrace;SR;3| ((|a| S) ($ R))
        (SPROG ((|t| (R)) (#1=#:G147 NIL) (|i| NIL) (|ma| (|Matrix| R)))
               (SEQ (LETT |t| (|spadConstant| $ 28))
                    (LETT |ma|
                          (SPADCALL |a| (SPADCALL (QREFELT $ 11))
                                    (QREFELT $ 13)))
                    (SEQ (LETT |i| 1) (LETT #1# (SPADCALL (QREFELT $ 9))) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |t|
                                 (SPADCALL |t|
                                           (SPADCALL |ma| |i| |i|
                                                     (QREFELT $ 18))
                                           (QREFELT $ 29)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |t|)))) 

(SDEFUN |FINAALG-;rightTrace;SR;4| ((|a| S) ($ R))
        (SPROG ((|t| (R)) (#1=#:G151 NIL) (|i| NIL) (|ma| (|Matrix| R)))
               (SEQ (LETT |t| (|spadConstant| $ 28))
                    (LETT |ma|
                          (SPADCALL |a| (SPADCALL (QREFELT $ 11))
                                    (QREFELT $ 26)))
                    (SEQ (LETT |i| 1) (LETT #1# (SPADCALL (QREFELT $ 9))) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |t|
                                 (SPADCALL |t|
                                           (SPADCALL |ma| |i| |i|
                                                     (QREFELT $ 18))
                                           (QREFELT $ 29)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |t|)))) 

(SDEFUN |FINAALG-;leftNorm;SR;5| ((|a| S) ($ R))
        (SPADCALL (SPADCALL |a| (SPADCALL (QREFELT $ 11)) (QREFELT $ 13))
                  (QREFELT $ 32))) 

(SDEFUN |FINAALG-;rightNorm;SR;6| ((|a| S) ($ R))
        (SPADCALL (SPADCALL |a| (SPADCALL (QREFELT $ 11)) (QREFELT $ 26))
                  (QREFELT $ 32))) 

(SDEFUN |FINAALG-;antiAssociative?;B;7| (($ |Boolean|))
        (SPROG
         ((#1=#:G161 NIL) (#2=#:G162 NIL) (#3=#:G165 NIL) (|k| NIL)
          (#4=#:G164 NIL) (|j| NIL) (#5=#:G163 NIL) (|i| NIL)
          (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT $ 11)))
                (LETT |n| (SPADCALL (QREFELT $ 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |b| |i| (QREFELT $ 36))
                                            (SPADCALL |b| |j| (QREFELT $ 36))
                                            (QREFELT $ 37))
                                           (SPADCALL |b| |k| (QREFELT $ 36))
                                           (QREFELT $ 37))
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT $ 36))
                                           (SPADCALL
                                            (SPADCALL |b| |j| (QREFELT $ 36))
                                            (SPADCALL |b| |k| (QREFELT $ 36))
                                            (QREFELT $ 37))
                                           (QREFELT $ 37))
                                          (QREFELT $ 38))
                                         (QREFELT $ 40)))
                                       (PROGN
                                        (LETT #1#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not anti-associative"
                                                (QREFELT $ 44))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (GO #6=#:G160)))))
                                        (GO #7=#:G156))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "algebra is anti-associative" (QREFELT $ 44))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;jordanAdmissible?;B;8| (($ |Boolean|))
        (SPROG
         ((#1=#:G179 NIL) (#2=#:G180 NIL) (#3=#:G184 NIL) (|l| NIL)
          (#4=#:G183 NIL) (|k| NIL) (#5=#:G182 NIL) (|j| NIL) (#6=#:G181 NIL)
          (|i| NIL) (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT $ 11)))
                (LETT |n| (SPADCALL (QREFELT $ 9)))
                (EXIT
                 (COND
                  ((QEQCAR
                    (SPADCALL (SPADCALL 2 (|spadConstant| $ 21) (QREFELT $ 46))
                              (QREFELT $ 48))
                    1)
                   (SEQ
                    (SPADCALL
                     "this algebra is not Jordan admissible, as 2 is not invertible in the ground ring"
                     (QREFELT $ 44))
                    (EXIT NIL)))
                  ('T
                   (SEQ
                    (SEQ (LETT |i| 1) (LETT #6# |n|) G190
                         (COND ((|greater_SI| |i| #6#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #5# |n|) G190
                                (COND ((|greater_SI| |j| #5#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |k| 1) (LETT #4# |n|) G190
                                       (COND
                                        ((|greater_SI| |k| #4#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |l| 1) (LETT #3# |n|) G190
                                              (COND
                                               ((|greater_SI| |l| #3#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((NULL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |b| |i|
                                                                  (QREFELT $
                                                                           36))
                                                        (SPADCALL |b| |j|
                                                                  (QREFELT $
                                                                           36))
                                                        (QREFELT $ 49))
                                                       (SPADCALL
                                                        (SPADCALL |b| |l|
                                                                  (QREFELT $
                                                                           36))
                                                        (SPADCALL |b| |k|
                                                                  (QREFELT $
                                                                           36))
                                                        (QREFELT $ 49))
                                                       (QREFELT $ 49))
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |b| |l|
                                                                  (QREFELT $
                                                                           36))
                                                        (SPADCALL |b| |j|
                                                                  (QREFELT $
                                                                           36))
                                                        (QREFELT $ 49))
                                                       (SPADCALL
                                                        (SPADCALL |b| |k|
                                                                  (QREFELT $
                                                                           36))
                                                        (SPADCALL |b| |i|
                                                                  (QREFELT $
                                                                           36))
                                                        (QREFELT $ 49))
                                                       (QREFELT $ 49))
                                                      (QREFELT $ 38))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |b| |k|
                                                                 (QREFELT $
                                                                          36))
                                                       (SPADCALL |b| |j|
                                                                 (QREFELT $
                                                                          36))
                                                       (QREFELT $ 49))
                                                      (SPADCALL
                                                       (SPADCALL |b| |i|
                                                                 (QREFELT $
                                                                          36))
                                                       (SPADCALL |b| |l|
                                                                 (QREFELT $
                                                                          36))
                                                       (QREFELT $ 49))
                                                      (QREFELT $ 49))
                                                     (QREFELT $ 38))
                                                    (QREFELT $ 40)))
                                                  (PROGN
                                                   (LETT #1#
                                                         (SEQ
                                                          (SPADCALL
                                                           "this algebra is not Jordan admissible"
                                                           (QREFELT $ 44))
                                                          (EXIT
                                                           (PROGN
                                                            (LETT #2# NIL)
                                                            (GO #7=#:G178)))))
                                                   (GO #8=#:G172))))))
                                              (LETT |l| (|inc_SI| |l|))
                                              (GO G190) G191 (EXIT NIL)))
                                        #8# (EXIT #1#))
                                       (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                       (EXIT NIL))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (SPADCALL "this algebra is Jordan admissible"
                              (QREFELT $ 44))
                    (EXIT 'T)))))))
          #7# (EXIT #2#)))) 

(SDEFUN |FINAALG-;lieAdmissible?;B;9| (($ |Boolean|))
        (SPROG
         ((#1=#:G192 NIL) (#2=#:G193 NIL) (#3=#:G196 NIL) (|k| NIL)
          (#4=#:G195 NIL) (|j| NIL) (#5=#:G194 NIL) (|i| NIL)
          (|b| (|Vector| S)) (|n| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL (QREFELT $ 9)))
                (LETT |b| (SPADCALL (QREFELT $ 11)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |b| |i| (QREFELT $ 36))
                                             (SPADCALL |b| |j| (QREFELT $ 36))
                                             (QREFELT $ 51))
                                            (SPADCALL |b| |k| (QREFELT $ 36))
                                            (QREFELT $ 51))
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |b| |j| (QREFELT $ 36))
                                             (SPADCALL |b| |k| (QREFELT $ 36))
                                             (QREFELT $ 51))
                                            (SPADCALL |b| |i| (QREFELT $ 36))
                                            (QREFELT $ 51))
                                           (QREFELT $ 38))
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |b| |k| (QREFELT $ 36))
                                            (SPADCALL |b| |i| (QREFELT $ 36))
                                            (QREFELT $ 51))
                                           (SPADCALL |b| |j| (QREFELT $ 36))
                                           (QREFELT $ 51))
                                          (QREFELT $ 38))
                                         (QREFELT $ 40)))
                                       (PROGN
                                        (LETT #1#
                                              (SEQ
                                               (SPADCALL
                                                "this algebra is not Lie admissible"
                                                (QREFELT $ 44))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (GO #6=#:G191)))))
                                        (GO #7=#:G187))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "this algebra is Lie admissible" (QREFELT $ 44))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;structuralConstants;VV;10|
        ((|b| |Vector| S) ($ |Vector| (|Matrix| R)))
        (SPROG
         ((#1=#:G210 NIL) (|k| NIL) (|covec| (|Vector| R)) (#2=#:G209 NIL)
          (|j| NIL) (#3=#:G208 NIL) (|i| NIL) (|sC| (|Vector| (|Matrix| R)))
          (#4=#:G205 NIL) (#5=#:G207 NIL) (#6=#:G206 NIL)
          (|m| (|NonNegativeInteger|)) (#7=#:G197 NIL))
         (SEQ
          (LETT |m|
                (PROG1 (LETT #7# (QVSIZE |b|))
                  (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #7#)))
          (LETT |sC|
                (PROGN
                 (LETT #6# (GETREFV |m|))
                 (SEQ (LETT |k| 1) (LETT #5# |m|) (LETT #4# 0) G190
                      (COND ((|greater_SI| |k| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #6# #4#
                                (MAKE_MATRIX1 |m| |m| (|spadConstant| $ 28)))))
                      (LETT #4#
                            (PROG1 (|inc_SI| #4#) (LETT |k| (|inc_SI| |k|))))
                      (GO G190) G191 (EXIT NIL))
                 #6#))
          (SEQ (LETT |i| 1) (LETT #3# |m|) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #2# |m|) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ
                       (LETT |covec|
                             (SPADCALL
                              (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                        (SPADCALL |b| |j| (QREFELT $ 36))
                                        (QREFELT $ 37))
                              |b| (QREFELT $ 54)))
                       (EXIT
                        (SEQ (LETT |k| 1) (LETT #1# |m|) G190
                             (COND ((|greater_SI| |k| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL (SPADCALL |sC| |k| (QREFELT $ 56)) |i|
                                         |j|
                                         (SPADCALL |covec| |k| (QREFELT $ 57))
                                         (QREFELT $ 58))))
                             (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |sC|)))) 

(SDEFUN |FINAALG-;leftRecip;SU;11| ((|x| S) ($ |Union| S "failed"))
        (SPROG
         ((#1=#:G227 NIL) (#2=#:G229 NIL) (|power| NIL) (#3=#:G230 NIL)
          (|i| NIL) (#4=#:G228 NIL) (|invCR| (R)) (|invC| (|Union| R "failed"))
          (|vectorOfCoef| (|Vector| R)) (|cond| (|Matrix| R))
          (|listOfPowers| (|List| S)) (|xx| (S)) (|k| (|PositiveInteger|))
          (|b| (|Vector| S)) (|lu| (|Union| S "failed")))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 40)) (CONS 1 "failed"))
                (#5='T
                 (SEQ (LETT |lu| (SPADCALL (QREFELT $ 60)))
                      (EXIT
                       (COND ((QEQCAR |lu| 1) (CONS 1 "failed"))
                             (#5#
                              (SEQ (LETT |b| (SPADCALL (QREFELT $ 11)))
                                   (LETT |xx| (QCDR |lu|)) (LETT |k| 1)
                                   (LETT |cond|
                                         (SPADCALL
                                          (SPADCALL |xx| |b| (QREFELT $ 54))
                                          (QREFELT $ 61)))
                                   (LETT |listOfPowers| (LIST |xx|))
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (EQL
                                            (SPADCALL |cond| (QREFELT $ 62))
                                            |k|))
                                          (GO G191)))
                                        (SEQ (LETT |k| (+ |k| 1))
                                             (LETT |xx|
                                                   (SPADCALL |xx| |x|
                                                             (QREFELT $ 37)))
                                             (LETT |listOfPowers|
                                                   (CONS |xx| |listOfPowers|))
                                             (EXIT
                                              (LETT |cond|
                                                    (SPADCALL |cond|
                                                              (SPADCALL
                                                               (SPADCALL |xx|
                                                                         |b|
                                                                         (QREFELT
                                                                          $
                                                                          54))
                                                               (QREFELT $ 61))
                                                              (QREFELT $
                                                                       63)))))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (LETT |vectorOfCoef|
                                         (|SPADfirst|
                                          (SPADCALL |cond| (QREFELT $ 65))))
                                   (LETT |invC|
                                         (SPADCALL
                                          (SPADCALL |vectorOfCoef| 1
                                                    (QREFELT $ 57))
                                          (QREFELT $ 48)))
                                   (EXIT
                                    (COND ((QEQCAR |invC| 1) (CONS 1 "failed"))
                                          (#5#
                                           (SEQ
                                            (LETT |invCR|
                                                  (SPADCALL (QCDR |invC|)
                                                            (QREFELT $ 66)))
                                            (EXIT
                                             (CONS 0
                                                   (SPADCALL (ELT $ 38)
                                                             (PROGN
                                                              (LETT #4#
                                                                    (GETREFV
                                                                     (MIN
                                                                      (|inc_SI|
                                                                       (-
                                                                        #6=(QVSIZE
                                                                            |vectorOfCoef|)
                                                                        2))
                                                                      (SIZE
                                                                       #7=(REVERSE
                                                                           |listOfPowers|)))))
                                                              (SEQ (LETT |i| 2)
                                                                   (LETT #3#
                                                                         #6#)
                                                                   (LETT
                                                                    |power|
                                                                    NIL)
                                                                   (LETT #2#
                                                                         #7#)
                                                                   (LETT #1# 0)
                                                                   G190
                                                                   (COND
                                                                    ((OR
                                                                      (ATOM
                                                                       #2#)
                                                                      (PROGN
                                                                       (LETT
                                                                        |power|
                                                                        (CAR
                                                                         #2#))
                                                                       NIL)
                                                                      (|greater_SI|
                                                                       |i|
                                                                       #3#))
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (EXIT
                                                                     (SETELT
                                                                      #4# #1#
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        |invCR|
                                                                        (SPADCALL
                                                                         |vectorOfCoef|
                                                                         |i|
                                                                         (QREFELT
                                                                          $
                                                                          57))
                                                                        (QREFELT
                                                                         $ 67))
                                                                       |power|
                                                                       (QREFELT
                                                                        $
                                                                        68)))))
                                                                   (LETT #1#
                                                                         (PROG1
                                                                             (|inc_SI|
                                                                              #1#)
                                                                           (LETT
                                                                            #2#
                                                                            (PROG1
                                                                                (CDR
                                                                                 #2#)
                                                                              (LETT
                                                                               |i|
                                                                               (|inc_SI|
                                                                                |i|))))))
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL))
                                                              #4#)
                                                             (QREFELT $
                                                                      70)))))))))))))))))) 

(SDEFUN |FINAALG-;rightRecip;SU;12| ((|x| S) ($ |Union| S "failed"))
        (SPROG
         ((#1=#:G247 NIL) (#2=#:G249 NIL) (|power| NIL) (#3=#:G250 NIL)
          (|i| NIL) (#4=#:G248 NIL) (|invCR| (R)) (|invC| (|Union| R "failed"))
          (|vectorOfCoef| (|Vector| R)) (|cond| (|Matrix| R))
          (|listOfPowers| (|List| S)) (|xx| (S)) (|k| (|PositiveInteger|))
          (|b| (|Vector| S)) (|ru| (|Union| S "failed")))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 40)) (CONS 1 "failed"))
                (#5='T
                 (SEQ (LETT |ru| (SPADCALL (QREFELT $ 72)))
                      (EXIT
                       (COND ((QEQCAR |ru| 1) (CONS 1 "failed"))
                             (#5#
                              (SEQ (LETT |b| (SPADCALL (QREFELT $ 11)))
                                   (LETT |xx| (QCDR |ru|)) (LETT |k| 1)
                                   (LETT |cond|
                                         (SPADCALL
                                          (SPADCALL |xx| |b| (QREFELT $ 54))
                                          (QREFELT $ 61)))
                                   (LETT |listOfPowers| (LIST |xx|))
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (EQL
                                            (SPADCALL |cond| (QREFELT $ 62))
                                            |k|))
                                          (GO G191)))
                                        (SEQ (LETT |k| (+ |k| 1))
                                             (LETT |xx|
                                                   (SPADCALL |x| |xx|
                                                             (QREFELT $ 37)))
                                             (LETT |listOfPowers|
                                                   (CONS |xx| |listOfPowers|))
                                             (EXIT
                                              (LETT |cond|
                                                    (SPADCALL |cond|
                                                              (SPADCALL
                                                               (SPADCALL |xx|
                                                                         |b|
                                                                         (QREFELT
                                                                          $
                                                                          54))
                                                               (QREFELT $ 61))
                                                              (QREFELT $
                                                                       63)))))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (LETT |vectorOfCoef|
                                         (|SPADfirst|
                                          (SPADCALL |cond| (QREFELT $ 65))))
                                   (LETT |invC|
                                         (SPADCALL
                                          (SPADCALL |vectorOfCoef| 1
                                                    (QREFELT $ 57))
                                          (QREFELT $ 48)))
                                   (EXIT
                                    (COND ((QEQCAR |invC| 1) (CONS 1 "failed"))
                                          (#5#
                                           (SEQ
                                            (LETT |invCR|
                                                  (SPADCALL (QCDR |invC|)
                                                            (QREFELT $ 66)))
                                            (EXIT
                                             (CONS 0
                                                   (SPADCALL (ELT $ 38)
                                                             (PROGN
                                                              (LETT #4#
                                                                    (GETREFV
                                                                     (MIN
                                                                      (|inc_SI|
                                                                       (-
                                                                        #6=(QVSIZE
                                                                            |vectorOfCoef|)
                                                                        2))
                                                                      (SIZE
                                                                       #7=(REVERSE
                                                                           |listOfPowers|)))))
                                                              (SEQ (LETT |i| 2)
                                                                   (LETT #3#
                                                                         #6#)
                                                                   (LETT
                                                                    |power|
                                                                    NIL)
                                                                   (LETT #2#
                                                                         #7#)
                                                                   (LETT #1# 0)
                                                                   G190
                                                                   (COND
                                                                    ((OR
                                                                      (ATOM
                                                                       #2#)
                                                                      (PROGN
                                                                       (LETT
                                                                        |power|
                                                                        (CAR
                                                                         #2#))
                                                                       NIL)
                                                                      (|greater_SI|
                                                                       |i|
                                                                       #3#))
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (EXIT
                                                                     (SETELT
                                                                      #4# #1#
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        |invCR|
                                                                        (SPADCALL
                                                                         |vectorOfCoef|
                                                                         |i|
                                                                         (QREFELT
                                                                          $
                                                                          57))
                                                                        (QREFELT
                                                                         $ 67))
                                                                       |power|
                                                                       (QREFELT
                                                                        $
                                                                        68)))))
                                                                   (LETT #1#
                                                                         (PROG1
                                                                             (|inc_SI|
                                                                              #1#)
                                                                           (LETT
                                                                            #2#
                                                                            (PROG1
                                                                                (CDR
                                                                                 #2#)
                                                                              (LETT
                                                                               |i|
                                                                               (|inc_SI|
                                                                                |i|))))))
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL))
                                                              #4#)
                                                             (QREFELT $
                                                                      70)))))))))))))))))) 

(SDEFUN |FINAALG-;recip;SU;13| ((|x| S) ($ |Union| S "failed"))
        (SPROG ((|rrx| (|Union| S "failed")) (|lrx| (|Union| S "failed")))
               (SEQ (LETT |lrx| (SPADCALL |x| (QREFELT $ 74)))
                    (EXIT
                     (COND ((QEQCAR |lrx| 1) (CONS 1 "failed"))
                           ('T
                            (SEQ (LETT |rrx| (SPADCALL |x| (QREFELT $ 75)))
                                 (EXIT
                                  (COND
                                   ((OR (QEQCAR |rrx| 1)
                                        (SPADCALL (QCDR |lrx|) (QCDR |rrx|)
                                                  (QREFELT $ 76)))
                                    (CONS 1 "failed"))
                                   ('T (CONS 0 (QCDR |lrx|)))))))))))) 

(SDEFUN |FINAALG-;leftMinimalPolynomial;SSup;14|
        ((|x| S) ($ |SparseUnivariatePolynomial| R))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| R)) (#1=#:G264 NIL) (|i| NIL)
          (|vectorOfCoef| (|Vector| R)) (|cond| (|Matrix| R)) (|xx| (S))
          (|k| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 40))
            (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 20)))
           ('T
            (SEQ (LETT |b| (SPADCALL (QREFELT $ 11))) (LETT |xx| |x|)
                 (LETT |k| 1)
                 (LETT |cond|
                       (SPADCALL (SPADCALL |xx| |b| (QREFELT $ 54))
                                 (QREFELT $ 61)))
                 (SEQ G190
                      (COND
                       ((NULL (EQL (SPADCALL |cond| (QREFELT $ 62)) |k|))
                        (GO G191)))
                      (SEQ (LETT |k| (+ |k| 1))
                           (LETT |xx| (SPADCALL |x| |xx| (QREFELT $ 37)))
                           (EXIT
                            (LETT |cond|
                                  (SPADCALL |cond|
                                            (SPADCALL
                                             (SPADCALL |xx| |b| (QREFELT $ 54))
                                             (QREFELT $ 61))
                                            (QREFELT $ 63)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |vectorOfCoef|
                       (|SPADfirst| (SPADCALL |cond| (QREFELT $ 65))))
                 (LETT |res| (|spadConstant| $ 78))
                 (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |vectorOfCoef| |i|
                                                   (QREFELT $ 57))
                                         |i| (QREFELT $ 20))
                                        (QREFELT $ 79)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT |res|))))))) 

(SDEFUN |FINAALG-;rightMinimalPolynomial;SSup;15|
        ((|x| S) ($ |SparseUnivariatePolynomial| R))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| R)) (#1=#:G271 NIL) (|i| NIL)
          (|vectorOfCoef| (|Vector| R)) (|cond| (|Matrix| R)) (|xx| (S))
          (|k| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 40))
            (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 20)))
           ('T
            (SEQ (LETT |b| (SPADCALL (QREFELT $ 11))) (LETT |xx| |x|)
                 (LETT |k| 1)
                 (LETT |cond|
                       (SPADCALL (SPADCALL |xx| |b| (QREFELT $ 54))
                                 (QREFELT $ 61)))
                 (SEQ G190
                      (COND
                       ((NULL (EQL (SPADCALL |cond| (QREFELT $ 62)) |k|))
                        (GO G191)))
                      (SEQ (LETT |k| (+ |k| 1))
                           (LETT |xx| (SPADCALL |xx| |x| (QREFELT $ 37)))
                           (EXIT
                            (LETT |cond|
                                  (SPADCALL |cond|
                                            (SPADCALL
                                             (SPADCALL |xx| |b| (QREFELT $ 54))
                                             (QREFELT $ 61))
                                            (QREFELT $ 63)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |vectorOfCoef|
                       (|SPADfirst| (SPADCALL |cond| (QREFELT $ 65))))
                 (LETT |res| (|spadConstant| $ 78))
                 (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |vectorOfCoef| |i|
                                                   (QREFELT $ 57))
                                         |i| (QREFELT $ 20))
                                        (QREFELT $ 79)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT |res|))))))) 

(SDEFUN |FINAALG-;associatorDependence;L;16| (($ |List| (|Vector| R)))
        (SPROG
         ((|z| (|Integer|)) (#1=#:G283 NIL) (|r| NIL) (|a213| #2=(|Vector| R))
          (|a321| #2#) (|a132| #2#) (|a312| #2#) (|a231| #2#) (|a123| #2#)
          (#3=#:G282 NIL) (|k| NIL) (#4=#:G281 NIL) (|j| NIL) (#5=#:G280 NIL)
          (|i| NIL) (|cond| (|Matrix| R)) (|b| (|Vector| S))
          (|n| (|PositiveInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT $ 9)))
              (LETT |b| (SPADCALL (QREFELT $ 11)))
              (LETT |cond|
                    (MAKE_MATRIX1 (SPADCALL |n| 4 (QREFELT $ 82)) 6
                                  (|spadConstant| $ 28)))
              (LETT |z| 0)
              (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                   (COND ((|greater_SI| |i| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                          (COND ((|greater_SI| |j| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                 (COND ((|greater_SI| |k| #3#) (GO G191)))
                                 (SEQ
                                  (LETT |a123|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |i| (QREFELT $ 36))
                                          (SPADCALL |b| |j| (QREFELT $ 36))
                                          (SPADCALL |b| |k| (QREFELT $ 36))
                                          (QREFELT $ 83))
                                         |b| (QREFELT $ 54)))
                                  (LETT |a231|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |j| (QREFELT $ 36))
                                          (SPADCALL |b| |k| (QREFELT $ 36))
                                          (SPADCALL |b| |i| (QREFELT $ 36))
                                          (QREFELT $ 83))
                                         |b| (QREFELT $ 54)))
                                  (LETT |a312|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |k| (QREFELT $ 36))
                                          (SPADCALL |b| |i| (QREFELT $ 36))
                                          (SPADCALL |b| |j| (QREFELT $ 36))
                                          (QREFELT $ 83))
                                         |b| (QREFELT $ 54)))
                                  (LETT |a132|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |i| (QREFELT $ 36))
                                          (SPADCALL |b| |k| (QREFELT $ 36))
                                          (SPADCALL |b| |j| (QREFELT $ 36))
                                          (QREFELT $ 83))
                                         |b| (QREFELT $ 54)))
                                  (LETT |a321|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |k| (QREFELT $ 36))
                                          (SPADCALL |b| |j| (QREFELT $ 36))
                                          (SPADCALL |b| |i| (QREFELT $ 36))
                                          (QREFELT $ 83))
                                         |b| (QREFELT $ 54)))
                                  (LETT |a213|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |j| (QREFELT $ 36))
                                          (SPADCALL |b| |i| (QREFELT $ 36))
                                          (SPADCALL |b| |k| (QREFELT $ 36))
                                          (QREFELT $ 83))
                                         |b| (QREFELT $ 54)))
                                  (EXIT
                                   (SEQ (LETT |r| 1) (LETT #1# |n|) G190
                                        (COND
                                         ((|greater_SI| |r| #1#) (GO G191)))
                                        (SEQ (LETT |z| (+ |z| 1))
                                             (SPADCALL |cond| |z| 1
                                                       (SPADCALL |a123| |r|
                                                                 (QREFELT $
                                                                          57))
                                                       (QREFELT $ 58))
                                             (SPADCALL |cond| |z| 2
                                                       (SPADCALL |a231| |r|
                                                                 (QREFELT $
                                                                          57))
                                                       (QREFELT $ 58))
                                             (SPADCALL |cond| |z| 3
                                                       (SPADCALL |a312| |r|
                                                                 (QREFELT $
                                                                          57))
                                                       (QREFELT $ 58))
                                             (SPADCALL |cond| |z| 4
                                                       (SPADCALL |a132| |r|
                                                                 (QREFELT $
                                                                          57))
                                                       (QREFELT $ 58))
                                             (SPADCALL |cond| |z| 5
                                                       (SPADCALL |a321| |r|
                                                                 (QREFELT $
                                                                          57))
                                                       (QREFELT $ 58))
                                             (EXIT
                                              (SPADCALL |cond| |z| 6
                                                        (SPADCALL |a213| |r|
                                                                  (QREFELT $
                                                                           57))
                                                        (QREFELT $ 58))))
                                        (LETT |r| (|inc_SI| |r|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |cond| (QREFELT $ 65)))))) 

(SDEFUN |FINAALG-;jacobiIdentity?;B;17| (($ |Boolean|))
        (SPROG
         ((#1=#:G291 NIL) (#2=#:G292 NIL) (#3=#:G295 NIL) (|k| NIL)
          (#4=#:G294 NIL) (|j| NIL) (#5=#:G293 NIL) (|i| NIL)
          (|b| (|Vector| S)) (|n| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL (QREFELT $ 9)))
                (LETT |b| (SPADCALL (QREFELT $ 11)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |b| |i| (QREFELT $ 36))
                                             (SPADCALL |b| |j| (QREFELT $ 36))
                                             (QREFELT $ 37))
                                            (SPADCALL |b| |k| (QREFELT $ 36))
                                            (QREFELT $ 37))
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |b| |j| (QREFELT $ 36))
                                             (SPADCALL |b| |k| (QREFELT $ 36))
                                             (QREFELT $ 37))
                                            (SPADCALL |b| |i| (QREFELT $ 36))
                                            (QREFELT $ 37))
                                           (QREFELT $ 38))
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |b| |k| (QREFELT $ 36))
                                            (SPADCALL |b| |i| (QREFELT $ 36))
                                            (QREFELT $ 37))
                                           (SPADCALL |b| |j| (QREFELT $ 36))
                                           (QREFELT $ 37))
                                          (QREFELT $ 38))
                                         (QREFELT $ 40)))
                                       (PROGN
                                        (LETT #1#
                                              (SEQ
                                               (SPADCALL
                                                "Jacobi identity does not hold"
                                                (QREFELT $ 44))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (GO #6=#:G290)))))
                                        (GO #7=#:G286))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "Jacobi identity holds" (QREFELT $ 44)) (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;lieAlgebra?;B;18| (($ |Boolean|))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 86))
           (COND
            ((SPADCALL (QREFELT $ 87))
             (SEQ (SPADCALL "this is a Lie algebra" (QREFELT $ 44)) (EXIT 'T)))
            (#1='T
             (SEQ (SPADCALL "this is not a Lie algebra" (QREFELT $ 44))
                  (EXIT NIL)))))
          (#1#
           (SEQ (SPADCALL "this is not a Lie algebra" (QREFELT $ 44))
                (EXIT NIL)))))) 

(SDEFUN |FINAALG-;jordanAlgebra?;B;19| (($ |Boolean|))
        (SPROG
         ((#1=#:G314 NIL) (#2=#:G315 NIL) (#3=#:G319 NIL) (|l| NIL)
          (#4=#:G318 NIL) (|k| NIL) (#5=#:G317 NIL) (|j| NIL) (#6=#:G316 NIL)
          (|i| NIL) (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT $ 11)))
                (LETT |n| (SPADCALL (QREFELT $ 9)))
                (EXIT
                 (COND
                  ((QEQCAR
                    (SPADCALL (SPADCALL 2 (|spadConstant| $ 21) (QREFELT $ 46))
                              (QREFELT $ 48))
                    1)
                   (SEQ
                    (SPADCALL
                     "this is not a Jordan algebra, as 2 is not invertible in the ground ring"
                     (QREFELT $ 44))
                    (EXIT NIL)))
                  ((SPADCALL (QREFELT $ 89))
                   (SEQ
                    (SEQ (LETT |i| 1) (LETT #6# |n|) G190
                         (COND ((|greater_SI| |i| #6#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #5# |n|) G190
                                (COND ((|greater_SI| |j| #5#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |k| 1) (LETT #4# |n|) G190
                                       (COND
                                        ((|greater_SI| |k| #4#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |l| 1) (LETT #3# |n|) G190
                                              (COND
                                               ((|greater_SI| |l| #3#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((NULL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |b| |i|
                                                                 (QREFELT $
                                                                          36))
                                                       (SPADCALL |b| |j|
                                                                 (QREFELT $
                                                                          36))
                                                       (SPADCALL
                                                        (SPADCALL |b| |l|
                                                                  (QREFELT $
                                                                           36))
                                                        (SPADCALL |b| |k|
                                                                  (QREFELT $
                                                                           36))
                                                        (QREFELT $ 37))
                                                       (QREFELT $ 83))
                                                      (SPADCALL
                                                       (SPADCALL |b| |l|
                                                                 (QREFELT $
                                                                          36))
                                                       (SPADCALL |b| |j|
                                                                 (QREFELT $
                                                                          36))
                                                       (SPADCALL
                                                        (SPADCALL |b| |k|
                                                                  (QREFELT $
                                                                           36))
                                                        (SPADCALL |b| |i|
                                                                  (QREFELT $
                                                                           36))
                                                        (QREFELT $ 37))
                                                       (QREFELT $ 83))
                                                      (QREFELT $ 38))
                                                     (SPADCALL
                                                      (SPADCALL |b| |k|
                                                                (QREFELT $ 36))
                                                      (SPADCALL |b| |j|
                                                                (QREFELT $ 36))
                                                      (SPADCALL
                                                       (SPADCALL |b| |i|
                                                                 (QREFELT $
                                                                          36))
                                                       (SPADCALL |b| |l|
                                                                 (QREFELT $
                                                                          36))
                                                       (QREFELT $ 37))
                                                      (QREFELT $ 83))
                                                     (QREFELT $ 38))
                                                    (QREFELT $ 40)))
                                                  (PROGN
                                                   (LETT #1#
                                                         (SEQ
                                                          (SPADCALL
                                                           "not a Jordan algebra"
                                                           (QREFELT $ 44))
                                                          (EXIT
                                                           (PROGN
                                                            (LETT #2# NIL)
                                                            (GO #7=#:G313)))))
                                                   (GO #8=#:G306))))))
                                              (LETT |l| (|inc_SI| |l|))
                                              (GO G190) G191 (EXIT NIL)))
                                        #8# (EXIT #1#))
                                       (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                       (EXIT NIL))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (SPADCALL "this is a Jordan algebra" (QREFELT $ 44))
                    (EXIT 'T)))
                  ('T
                   (SEQ
                    (SPADCALL "this is not a Jordan algebra" (QREFELT $ 44))
                    (EXIT NIL)))))))
          #7# (EXIT #2#)))) 

(SDEFUN |FINAALG-;noncommutativeJordanAlgebra?;B;20| (($ |Boolean|))
        (SPROG ((|n| (|PositiveInteger|)) (|b| (|Vector| S)))
               (SEQ (LETT |b| (SPADCALL (QREFELT $ 11)))
                    (LETT |n| (SPADCALL (QREFELT $ 9)))
                    (EXIT
                     (COND
                      ((QEQCAR
                        (SPADCALL
                         (SPADCALL 2 (|spadConstant| $ 21) (QREFELT $ 46))
                         (QREFELT $ 48))
                        1)
                       (SEQ
                        (SPADCALL
                         "this is not a noncommutative Jordan algebra, as 2 is not invertible in the ground ring"
                         (QREFELT $ 44))
                        (EXIT NIL)))
                      ((SPADCALL (QREFELT $ 91))
                       (COND
                        ((SPADCALL (QREFELT $ 92))
                         (SEQ
                          (SPADCALL "this is a noncommutative Jordan algebra"
                                    (QREFELT $ 44))
                          (EXIT 'T)))
                        (#1='T
                         (SEQ
                          (SPADCALL
                           "this is not a noncommutative Jordan algebra, as it is not Jordan admissible"
                           (QREFELT $ 44))
                          (EXIT NIL)))))
                      (#1#
                       (SEQ
                        (SPADCALL
                         "this is not a noncommutative Jordan algebra, as it is not flexible"
                         (QREFELT $ 44))
                        (EXIT NIL)))))))) 

(SDEFUN |FINAALG-;antiCommutative?;B;21| (($ |Boolean|))
        (SPROG
         ((#1=#:G335 NIL) (#2=#:G336 NIL) (#3=#:G338 NIL) (|j| NIL)
          (#4=#:G337 NIL) (|i| NIL) (|n| (|PositiveInteger|))
          (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT $ 11)))
                (LETT |n| (SPADCALL (QREFELT $ 9)))
                (SEQ (LETT |i| 1) (LETT #4# |n|) G190
                     (COND ((|greater_SI| |i| #4#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| |i|) (LETT #3# |n|) G190
                            (COND ((> |j| #3#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL
                                 (SPADCALL
                                  (COND
                                   ((EQL |i| |j|)
                                    (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                              (SPADCALL |b| |i| (QREFELT $ 36))
                                              (QREFELT $ 37)))
                                   ('T
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |b| |i| (QREFELT $ 36))
                                      (SPADCALL |b| |j| (QREFELT $ 36))
                                      (QREFELT $ 37))
                                     (SPADCALL
                                      (SPADCALL |b| |j| (QREFELT $ 36))
                                      (SPADCALL |b| |i| (QREFELT $ 36))
                                      (QREFELT $ 37))
                                     (QREFELT $ 38))))
                                  (QREFELT $ 40)))
                                (PROGN
                                 (LETT #1#
                                       (SEQ
                                        (SPADCALL
                                         "algebra is not anti-commutative"
                                         (QREFELT $ 44))
                                        (EXIT
                                         (PROGN
                                          (LETT #2# NIL)
                                          (GO #5=#:G334)))))
                                 (GO #6=#:G331))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                      #6# (EXIT #1#))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "algebra is anti-commutative" (QREFELT $ 44))
                (EXIT 'T)))
          #5# (EXIT #2#)))) 

(SDEFUN |FINAALG-;commutative?;B;22| (($ |Boolean|))
        (SPROG
         ((#1=#:G345 NIL) (#2=#:G346 NIL) (#3=#:G348 NIL) (|j| NIL)
          (#4=#:G347 NIL) (|i| NIL) (|n| (|PositiveInteger|))
          (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT $ 11)))
                (LETT |n| (SPADCALL (QREFELT $ 9)))
                (SEQ (LETT |i| 1) (LETT #4# |n|) G190
                     (COND ((|greater_SI| |i| #4#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| (+ |i| 1)) (LETT #3# |n|) G190
                            (COND ((> |j| #3#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                            (SPADCALL |b| |j| (QREFELT $ 36))
                                            (QREFELT $ 51))
                                  (QREFELT $ 40)))
                                (PROGN
                                 (LETT #1#
                                       (SEQ
                                        (SPADCALL "algebra is not commutative"
                                                  (QREFELT $ 44))
                                        (EXIT
                                         (PROGN
                                          (LETT #2# NIL)
                                          (GO #5=#:G344)))))
                                 (GO #6=#:G341))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                      #6# (EXIT #1#))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "algebra is commutative" (QREFELT $ 44)) (EXIT 'T)))
          #5# (EXIT #2#)))) 

(SDEFUN |FINAALG-;associative?;B;23| (($ |Boolean|))
        (SPROG
         ((#1=#:G356 NIL) (#2=#:G357 NIL) (#3=#:G360 NIL) (|k| NIL)
          (#4=#:G359 NIL) (|j| NIL) (#5=#:G358 NIL) (|i| NIL)
          (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT $ 11)))
                (LETT |n| (SPADCALL (QREFELT $ 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |i| (QREFELT $ 36))
                                          (SPADCALL |b| |j| (QREFELT $ 36))
                                          (SPADCALL |b| |k| (QREFELT $ 36))
                                          (QREFELT $ 83))
                                         (QREFELT $ 40)))
                                       (PROGN
                                        (LETT #1#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not associative"
                                                (QREFELT $ 44))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (GO #6=#:G355)))))
                                        (GO #7=#:G351))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "algebra is associative" (QREFELT $ 44)) (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;leftAlternative?;B;24| (($ |Boolean|))
        (SPROG
         ((#1=#:G368 NIL) (#2=#:G369 NIL) (#3=#:G372 NIL) (|k| NIL)
          (#4=#:G371 NIL) (|j| NIL) (#5=#:G370 NIL) (|i| NIL)
          (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT $ 11)))
                (LETT |n| (SPADCALL (QREFELT $ 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT $ 36))
                                           (SPADCALL |b| |j| (QREFELT $ 36))
                                           (SPADCALL |b| |k| (QREFELT $ 36))
                                           (QREFELT $ 83))
                                          (SPADCALL
                                           (SPADCALL |b| |j| (QREFELT $ 36))
                                           (SPADCALL |b| |i| (QREFELT $ 36))
                                           (SPADCALL |b| |k| (QREFELT $ 36))
                                           (QREFELT $ 83))
                                          (QREFELT $ 38))
                                         (QREFELT $ 40)))
                                       (PROGN
                                        (LETT #1#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not left alternative"
                                                (QREFELT $ 44))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (GO #6=#:G367)))))
                                        (GO #7=#:G363))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "algebra satisfies 2*associator(a,a,b) = 0"
                          (QREFELT $ 44))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;rightAlternative?;B;25| (($ |Boolean|))
        (SPROG
         ((#1=#:G380 NIL) (#2=#:G381 NIL) (#3=#:G384 NIL) (|k| NIL)
          (#4=#:G383 NIL) (|j| NIL) (#5=#:G382 NIL) (|i| NIL)
          (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT $ 11)))
                (LETT |n| (SPADCALL (QREFELT $ 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT $ 36))
                                           (SPADCALL |b| |j| (QREFELT $ 36))
                                           (SPADCALL |b| |k| (QREFELT $ 36))
                                           (QREFELT $ 83))
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT $ 36))
                                           (SPADCALL |b| |k| (QREFELT $ 36))
                                           (SPADCALL |b| |j| (QREFELT $ 36))
                                           (QREFELT $ 83))
                                          (QREFELT $ 38))
                                         (QREFELT $ 40)))
                                       (PROGN
                                        (LETT #1#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not right alternative"
                                                (QREFELT $ 44))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (GO #6=#:G379)))))
                                        (GO #7=#:G375))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "algebra satisfies 2*associator(a,b,b) = 0"
                          (QREFELT $ 44))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;flexible?;B;26| (($ |Boolean|))
        (SPROG
         ((#1=#:G392 NIL) (#2=#:G393 NIL) (#3=#:G396 NIL) (|k| NIL)
          (#4=#:G395 NIL) (|j| NIL) (#5=#:G394 NIL) (|i| NIL)
          (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT $ 11)))
                (LETT |n| (SPADCALL (QREFELT $ 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT $ 36))
                                           (SPADCALL |b| |j| (QREFELT $ 36))
                                           (SPADCALL |b| |k| (QREFELT $ 36))
                                           (QREFELT $ 83))
                                          (SPADCALL
                                           (SPADCALL |b| |k| (QREFELT $ 36))
                                           (SPADCALL |b| |j| (QREFELT $ 36))
                                           (SPADCALL |b| |i| (QREFELT $ 36))
                                           (QREFELT $ 83))
                                          (QREFELT $ 38))
                                         (QREFELT $ 40)))
                                       (PROGN
                                        (LETT #1#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not flexible"
                                                (QREFELT $ 44))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (GO #6=#:G391)))))
                                        (GO #7=#:G387))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "algebra satisfies 2*associator(a,b,a) = 0"
                          (QREFELT $ 44))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;alternative?;B;27| (($ |Boolean|))
        (SPROG
         ((#1=#:G406 NIL) (#2=#:G407 NIL) (#3=#:G410 NIL) (|k| NIL)
          (#4=#:G409 NIL) (|j| NIL) (#5=#:G408 NIL) (|i| NIL)
          (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT $ 11)))
                (LETT |n| (SPADCALL (QREFELT $ 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT $ 36))
                                           (SPADCALL |b| |j| (QREFELT $ 36))
                                           (SPADCALL |b| |k| (QREFELT $ 36))
                                           (QREFELT $ 83))
                                          (SPADCALL
                                           (SPADCALL |b| |j| (QREFELT $ 36))
                                           (SPADCALL |b| |i| (QREFELT $ 36))
                                           (SPADCALL |b| |k| (QREFELT $ 36))
                                           (QREFELT $ 83))
                                          (QREFELT $ 38))
                                         (QREFELT $ 40)))
                                       (SEQ
                                        (SPADCALL "algebra is not alternative"
                                                  (QREFELT $ 44))
                                        (EXIT
                                         (PROGN
                                          (LETT #2# NIL)
                                          (GO #6=#:G405)))))
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT $ 36))
                                           (SPADCALL |b| |j| (QREFELT $ 36))
                                           (SPADCALL |b| |k| (QREFELT $ 36))
                                           (QREFELT $ 83))
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT $ 36))
                                           (SPADCALL |b| |k| (QREFELT $ 36))
                                           (SPADCALL |b| |j| (QREFELT $ 36))
                                           (QREFELT $ 83))
                                          (QREFELT $ 38))
                                         (QREFELT $ 40)))
                                       (PROGN
                                        (LETT #1#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not alternative"
                                                (QREFELT $ 44))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (GO #6#)))))
                                        (GO #7=#:G400)))))
                                    #7# (EXIT #1#))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL
                 "algebra satisfies 2*associator(a,b,b) = 0 =  2*associator(a,a,b) = 0"
                 (QREFELT $ 44))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;leftDiscriminant;VR;28| ((|v| |Vector| S) ($ R))
        (SPADCALL (SPADCALL |v| (QREFELT $ 101)) (QREFELT $ 32))) 

(SDEFUN |FINAALG-;rightDiscriminant;VR;29| ((|v| |Vector| S) ($ R))
        (SPADCALL (SPADCALL |v| (QREFELT $ 103)) (QREFELT $ 32))) 

(SDEFUN |FINAALG-;coordinates;2VM;30|
        ((|v| |Vector| S) (|b| |Vector| S) ($ |Matrix| R))
        (SPROG ((#1=#:G416 NIL) (|i| NIL) (|j| NIL) (|m| (|Matrix| R)))
               (SEQ
                (LETT |m|
                      (MAKE_MATRIX1 (QVSIZE |v|) (QVSIZE |b|)
                                    (|spadConstant| $ 28)))
                (SEQ (LETT |j| (PROGN |m| 1))
                     (LETT |i| (SPADCALL |v| (QREFELT $ 105)))
                     (LETT #1# (QVSIZE |v|)) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |m| |j|
                                 (SPADCALL (QAREF1O |v| |i| 1) |b|
                                           (QREFELT $ 54))
                                 (QREFELT $ 106))))
                     (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |FINAALG-;represents;VVS;31| ((|v| |Vector| R) (|b| |Vector| S) ($ S))
        (SPROG
         ((#1=#:G422 NIL) (#2=#:G424 NIL) (|i| NIL) (#3=#:G423 NIL)
          (|m| (|Integer|)))
         (SEQ (LETT |m| (- (SPADCALL |v| (QREFELT $ 108)) 1))
              (EXIT
               (SPADCALL (ELT $ 38)
                         (PROGN
                          (LETT #3# (GETREFV #4=(QVSIZE |b|)))
                          (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #1# 0) G190
                               (COND ((|greater_SI| |i| #2#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SETELT #3# #1#
                                         (SPADCALL
                                          (SPADCALL |v| (+ |i| |m|)
                                                    (QREFELT $ 57))
                                          (SPADCALL |b| (+ |i| |m|)
                                                    (QREFELT $ 36))
                                          (QREFELT $ 68)))))
                               (LETT #1#
                                     (PROG1 (|inc_SI| #1#)
                                       (LETT |i| (|inc_SI| |i|))))
                               (GO G190) G191 (EXIT NIL))
                          #3#)
                         (QREFELT $ 70)))))) 

(SDEFUN |FINAALG-;leftTraceMatrix;VM;32| ((|v| |Vector| S) ($ |Matrix| R))
        (SPROG
         ((#1=#:G431 NIL) (|j| NIL) (#2=#:G430 NIL) (#3=#:G429 NIL) (|i| NIL)
          (#4=#:G428 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #4# NIL)
            (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 105)))
                 (LETT #3# (QVSIZE |v|)) G190 (COND ((> |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 105)))
                                (LETT #1# (QVSIZE |v|)) G190
                                (COND ((> |j| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |v| |i| (QREFELT $ 36))
                                           (SPADCALL |v| |j| (QREFELT $ 36))
                                           (QREFELT $ 37))
                                          (QREFELT $ 110))
                                         #2#))))
                                (LETT |j| (+ |j| 1)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          #4#))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT (NREVERSE #4#))))
           (QREFELT $ 112))))) 

(SDEFUN |FINAALG-;rightTraceMatrix;VM;33| ((|v| |Vector| S) ($ |Matrix| R))
        (SPROG
         ((#1=#:G438 NIL) (|j| NIL) (#2=#:G437 NIL) (#3=#:G436 NIL) (|i| NIL)
          (#4=#:G435 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #4# NIL)
            (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 105)))
                 (LETT #3# (QVSIZE |v|)) G190 (COND ((> |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 105)))
                                (LETT #1# (QVSIZE |v|)) G190
                                (COND ((> |j| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |v| |i| (QREFELT $ 36))
                                           (SPADCALL |v| |j| (QREFELT $ 36))
                                           (QREFELT $ 37))
                                          (QREFELT $ 114))
                                         #2#))))
                                (LETT |j| (+ |j| 1)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          #4#))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT (NREVERSE #4#))))
           (QREFELT $ 112))))) 

(SDEFUN |FINAALG-;leftRegularRepresentation;SVM;34|
        ((|x| S) (|b| |Vector| S) ($ |Matrix| R))
        (SPROG ((#1=#:G444 NIL) (|i| NIL) (#2=#:G443 NIL) (|m| (|Integer|)))
               (SEQ (LETT |m| (- (SPADCALL |b| (QREFELT $ 105)) 1))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |i| 1) (LETT #1# (SPADCALL (QREFELT $ 9)))
                             G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |x|
                                                  (SPADCALL |b| (+ |i| |m|)
                                                            (QREFELT $ 36))
                                                  (QREFELT $ 37))
                                        |b| (QREFELT $ 54))
                                       (QREFELT $ 117))
                                      #2#))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT $ 112))
                      (QREFELT $ 118)))))) 

(SDEFUN |FINAALG-;rightRegularRepresentation;SVM;35|
        ((|x| S) (|b| |Vector| S) ($ |Matrix| R))
        (SPROG ((#1=#:G450 NIL) (|i| NIL) (#2=#:G449 NIL) (|m| (|Integer|)))
               (SEQ (LETT |m| (- (SPADCALL |b| (QREFELT $ 105)) 1))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |i| 1) (LETT #1# (SPADCALL (QREFELT $ 9)))
                             G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |b| (+ |i| |m|)
                                                   (QREFELT $ 36))
                                         |x| (QREFELT $ 37))
                                        |b| (QREFELT $ 54))
                                       (QREFELT $ 117))
                                      #2#))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT $ 112))
                      (QREFELT $ 118)))))) 

(DECLAIM (NOTINLINE |FiniteRankNonAssociativeAlgebra&;|)) 

(DEFUN |FiniteRankNonAssociativeAlgebra&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|FiniteRankNonAssociativeAlgebra&| DV$1 DV$2))
          (LETT $ (GETREFV 121))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|))))))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| (|SparseUnivariatePolynomial| |#2|)
                           '(|CommutativeRing|))
            (PROGN
             (QSETREFV $ 25
                       (CONS
                        (|dispatchFunction|
                         |FINAALG-;leftCharacteristicPolynomial;SSup;1|)
                        $))
             (QSETREFV $ 27
                       (CONS
                        (|dispatchFunction|
                         |FINAALG-;rightCharacteristicPolynomial;SSup;2|)
                        $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 71
                       (CONS (|dispatchFunction| |FINAALG-;leftRecip;SU;11|)
                             $))
             (QSETREFV $ 73
                       (CONS (|dispatchFunction| |FINAALG-;rightRecip;SU;12|)
                             $))
             (QSETREFV $ 77
                       (CONS (|dispatchFunction| |FINAALG-;recip;SU;13|) $))
             (QSETREFV $ 80
                       (CONS
                        (|dispatchFunction|
                         |FINAALG-;leftMinimalPolynomial;SSup;14|)
                        $))
             (QSETREFV $ 81
                       (CONS
                        (|dispatchFunction|
                         |FINAALG-;rightMinimalPolynomial;SSup;15|)
                        $))
             (QSETREFV $ 84
                       (CONS
                        (|dispatchFunction|
                         |FINAALG-;associatorDependence;L;16|)
                        $)))))
          $))) 

(MAKEPROP '|FiniteRankNonAssociativeAlgebra&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|PositiveInteger|) (0 . |rank|) (|Vector| $) (4 . |someBasis|)
              (|Matrix| 7) (8 . |leftRegularRepresentation|)
              (|NonNegativeInteger|) (|Matrix| 19) (14 . |zero|) (|Integer|)
              (20 . |elt|) (|SparseUnivariatePolynomial| 7) (27 . |monomial|)
              (33 . |One|) (37 . -) (43 . |setelt!|) (51 . |determinant|)
              (56 . |leftCharacteristicPolynomial|)
              (61 . |rightRegularRepresentation|)
              (67 . |rightCharacteristicPolynomial|) (72 . |Zero|) (76 . +)
              |FINAALG-;leftTrace;SR;3| |FINAALG-;rightTrace;SR;4|
              (82 . |determinant|) |FINAALG-;leftNorm;SR;5|
              |FINAALG-;rightNorm;SR;6| (|Vector| 6) (87 . |elt|) (93 . *)
              (99 . +) (|Boolean|) (105 . |zero?|) (|Void|) (|String|)
              (|OutputForm|) (110 . |messagePrint|)
              |FINAALG-;antiAssociative?;B;7| (115 . *) (|Union| $ '"failed")
              (121 . |recip|) (126 . |antiCommutator|)
              |FINAALG-;jordanAdmissible?;B;8| (132 . |commutator|)
              |FINAALG-;lieAdmissible?;B;9| (|Vector| 7) (138 . |coordinates|)
              (|Vector| 12) (144 . |elt|) (150 . |elt|) (156 . |setelt!|)
              |FINAALG-;structuralConstants;VV;10| (164 . |leftUnit|)
              (168 . |coerce|) (173 . |rank|) (178 . |horizConcat|) (|List| 53)
              (184 . |nullSpace|) (189 . -) (194 . *) (200 . *)
              (|Mapping| 6 6 6) (206 . |reduce|) (212 . |leftRecip|)
              (217 . |rightUnit|) (221 . |rightRecip|) (226 . |leftRecip|)
              (231 . |rightRecip|) (236 . ~=) (242 . |recip|) (247 . |Zero|)
              (251 . +) (257 . |leftMinimalPolynomial|)
              (262 . |rightMinimalPolynomial|) (267 . ^) (273 . |associator|)
              (280 . |associatorDependence|) |FINAALG-;jacobiIdentity?;B;17|
              (284 . |antiCommutative?|) (288 . |jacobiIdentity?|)
              |FINAALG-;lieAlgebra?;B;18| (292 . |commutative?|)
              |FINAALG-;jordanAlgebra?;B;19| (296 . |flexible?|)
              (300 . |jordanAdmissible?|)
              |FINAALG-;noncommutativeJordanAlgebra?;B;20|
              |FINAALG-;antiCommutative?;B;21| |FINAALG-;commutative?;B;22|
              |FINAALG-;associative?;B;23| |FINAALG-;leftAlternative?;B;24|
              |FINAALG-;rightAlternative?;B;25| |FINAALG-;flexible?;B;26|
              |FINAALG-;alternative?;B;27| (304 . |leftTraceMatrix|)
              |FINAALG-;leftDiscriminant;VR;28| (309 . |rightTraceMatrix|)
              |FINAALG-;rightDiscriminant;VR;29| (314 . |minIndex|)
              (319 . |setRow!|) |FINAALG-;coordinates;2VM;30|
              (326 . |minIndex|) |FINAALG-;represents;VVS;31|
              (331 . |leftTrace|) (|List| 116) (336 . |matrix|)
              |FINAALG-;leftTraceMatrix;VM;32| (341 . |rightTrace|)
              |FINAALG-;rightTraceMatrix;VM;33| (|List| 7) (346 . |parts|)
              (351 . |transpose|) |FINAALG-;leftRegularRepresentation;SVM;34|
              |FINAALG-;rightRegularRepresentation;SVM;35|)
           '#(|structuralConstants| 356 |rightTraceMatrix| 361 |rightTrace| 366
              |rightRegularRepresentation| 371 |rightRecip| 377 |rightNorm| 382
              |rightMinimalPolynomial| 387 |rightDiscriminant| 392
              |rightCharacteristicPolynomial| 397 |rightAlternative?| 402
              |represents| 406 |recip| 412 |noncommutativeJordanAlgebra?| 417
              |lieAlgebra?| 421 |lieAdmissible?| 425 |leftTraceMatrix| 429
              |leftTrace| 434 |leftRegularRepresentation| 439 |leftRecip| 445
              |leftNorm| 450 |leftMinimalPolynomial| 455 |leftDiscriminant| 460
              |leftCharacteristicPolynomial| 465 |leftAlternative?| 470
              |jordanAlgebra?| 474 |jordanAdmissible?| 478 |jacobiIdentity?|
              482 |flexible?| 486 |coordinates| 490 |commutative?| 496
              |associatorDependence| 500 |associative?| 504 |antiCommutative?|
              508 |antiAssociative?| 512 |alternative?| 516)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 120
                                                 '(0 6 8 9 0 6 10 11 2 6 12 0
                                                   10 13 2 15 0 14 14 16 3 12 7
                                                   0 17 17 18 2 19 0 7 14 20 0
                                                   7 0 21 2 19 0 0 0 22 4 15 19
                                                   0 17 17 19 23 1 15 19 0 24 1
                                                   0 19 0 25 2 6 12 0 10 26 1 0
                                                   19 0 27 0 7 0 28 2 7 0 0 0
                                                   29 1 12 7 0 32 2 35 6 0 17
                                                   36 2 6 0 0 0 37 2 6 0 0 0 38
                                                   1 6 39 0 40 1 43 41 42 44 2
                                                   7 0 8 0 46 1 7 47 0 48 2 6 0
                                                   0 0 49 2 6 0 0 0 51 2 6 53 0
                                                   10 54 2 55 12 0 17 56 2 53 7
                                                   0 17 57 4 12 7 0 17 17 7 58
                                                   0 6 47 60 1 12 0 53 61 1 12
                                                   14 0 62 2 12 0 0 0 63 1 12
                                                   64 0 65 1 7 0 0 66 2 7 0 0 0
                                                   67 2 6 0 7 0 68 2 35 6 69 0
                                                   70 1 0 47 0 71 0 6 47 72 1 0
                                                   47 0 73 1 6 47 0 74 1 6 47 0
                                                   75 2 6 39 0 0 76 1 0 47 0 77
                                                   0 19 0 78 2 19 0 0 0 79 1 0
                                                   19 0 80 1 0 19 0 81 2 8 0 0
                                                   8 82 3 6 0 0 0 0 83 0 0 64
                                                   84 0 6 39 86 0 6 39 87 0 6
                                                   39 89 0 6 39 91 0 6 39 92 1
                                                   6 12 10 101 1 6 12 10 103 1
                                                   35 17 0 105 3 12 0 0 17 53
                                                   106 1 53 17 0 108 1 6 7 0
                                                   110 1 12 0 111 112 1 6 7 0
                                                   114 1 53 116 0 117 1 12 0 0
                                                   118 1 0 55 10 59 1 0 12 10
                                                   115 1 0 7 0 31 2 0 12 0 10
                                                   120 1 0 47 0 73 1 0 7 0 34 1
                                                   0 19 0 81 1 0 7 10 104 1 0
                                                   19 0 27 0 0 39 98 2 0 0 53
                                                   10 109 1 0 47 0 77 0 0 39 93
                                                   0 0 39 88 0 0 39 52 1 0 12
                                                   10 113 1 0 7 0 30 2 0 12 0
                                                   10 119 1 0 47 0 71 1 0 7 0
                                                   33 1 0 19 0 80 1 0 7 10 102
                                                   1 0 19 0 25 0 0 39 97 0 0 39
                                                   90 0 0 39 50 0 0 39 85 0 0
                                                   39 99 2 0 12 10 10 107 0 0
                                                   39 95 0 0 64 84 0 0 39 96 0
                                                   0 39 94 0 0 39 45 0 0 39
                                                   100)))))
           '|lookupComplete|)) 
