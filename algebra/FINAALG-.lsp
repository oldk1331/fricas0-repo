
(/VERSIONCHECK 2) 

(DEFUN |FINAALG-;leftCharacteristicPolynomial;SSup;1| (|a| $)
  (PROG (|j| |i| |mb| |ma| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (QREFELT $ 9))
            . #1=(|FINAALG-;leftCharacteristicPolynomial;SSup;1|))
      (LETT |ma| (SPADCALL |a| (SPADCALL (QREFELT $ 11)) (QREFELT $ 13)) . #1#)
      (LETT |mb| (SPADCALL |n| |n| (QREFELT $ 16)) . #1#)
      (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #1#) G190
                  (COND ((|greater_SI| |j| |n|) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |mb| |i| |j|
                              (COND
                               ((EQL |i| |j|)
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL |ma| |i| |j| (QREFELT $ 18)) 0
                                  (QREFELT $ 20))
                                 (SPADCALL (|spadConstant| $ 21) 1
                                           (QREFELT $ 20))
                                 (QREFELT $ 23)))
                               ('T
                                (SPADCALL
                                 (SPADCALL |ma| |i| |j| (QREFELT $ 18)) 1
                                 (QREFELT $ 20))))
                              (QREFELT $ 24))))
                  (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |mb| (QREFELT $ 25))))))) 

(DEFUN |FINAALG-;rightCharacteristicPolynomial;SSup;2| (|a| $)
  (PROG (|j| |i| |mb| |ma| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (QREFELT $ 9))
            . #1=(|FINAALG-;rightCharacteristicPolynomial;SSup;2|))
      (LETT |ma| (SPADCALL |a| (SPADCALL (QREFELT $ 11)) (QREFELT $ 27)) . #1#)
      (LETT |mb| (SPADCALL |n| |n| (QREFELT $ 16)) . #1#)
      (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #1#) G190
                  (COND ((|greater_SI| |j| |n|) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |mb| |i| |j|
                              (COND
                               ((EQL |i| |j|)
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL |ma| |i| |j| (QREFELT $ 18)) 0
                                  (QREFELT $ 20))
                                 (SPADCALL (|spadConstant| $ 21) 1
                                           (QREFELT $ 20))
                                 (QREFELT $ 23)))
                               ('T
                                (SPADCALL
                                 (SPADCALL |ma| |i| |j| (QREFELT $ 18)) 1
                                 (QREFELT $ 20))))
                              (QREFELT $ 24))))
                  (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |mb| (QREFELT $ 25))))))) 

(DEFUN |FINAALG-;leftTrace;SR;3| (|a| $)
  (PROG (|t| #1=#:G164 |i| |ma|)
    (RETURN
     (SEQ (LETT |t| (|spadConstant| $ 29) . #2=(|FINAALG-;leftTrace;SR;3|))
          (LETT |ma| (SPADCALL |a| (SPADCALL (QREFELT $ 11)) (QREFELT $ 13))
                . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (SPADCALL (QREFELT $ 9)) . #2#)
               G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |t|
                       (SPADCALL |t| (SPADCALL |ma| |i| |i| (QREFELT $ 18))
                                 (QREFELT $ 30))
                       . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |t|))))) 

(DEFUN |FINAALG-;rightTrace;SR;4| (|a| $)
  (PROG (|t| #1=#:G168 |i| |ma|)
    (RETURN
     (SEQ (LETT |t| (|spadConstant| $ 29) . #2=(|FINAALG-;rightTrace;SR;4|))
          (LETT |ma| (SPADCALL |a| (SPADCALL (QREFELT $ 11)) (QREFELT $ 27))
                . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (SPADCALL (QREFELT $ 9)) . #2#)
               G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |t|
                       (SPADCALL |t| (SPADCALL |ma| |i| |i| (QREFELT $ 18))
                                 (QREFELT $ 30))
                       . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |t|))))) 

(DEFUN |FINAALG-;leftNorm;SR;5| (|a| $)
  (SPADCALL (SPADCALL |a| (SPADCALL (QREFELT $ 11)) (QREFELT $ 13))
            (QREFELT $ 33))) 

(DEFUN |FINAALG-;rightNorm;SR;6| (|a| $)
  (SPADCALL (SPADCALL |a| (SPADCALL (QREFELT $ 11)) (QREFELT $ 27))
            (QREFELT $ 33))) 

(DEFUN |FINAALG-;antiAssociative?;B;7| ($)
  (PROG (#1=#:G173 #2=#:G177 |k| |j| |i| |n| |b|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |b| (SPADCALL (QREFELT $ 11))
              . #3=(|FINAALG-;antiAssociative?;B;7|))
        (LETT |n| (SPADCALL (QREFELT $ 9)) . #3#)
        (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| 1 . #3#) G190
                    (COND ((|greater_SI| |j| |n|) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |k| 1 . #3#) G190
                           (COND ((|greater_SI| |k| |n|) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                             (SPADCALL |b| |j| (QREFELT $ 37))
                                             (QREFELT $ 38))
                                   (SPADCALL |b| |k| (QREFELT $ 37))
                                   (QREFELT $ 38))
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                            (SPADCALL
                                             (SPADCALL |b| |j| (QREFELT $ 37))
                                             (SPADCALL |b| |k| (QREFELT $ 37))
                                             (QREFELT $ 38))
                                            (QREFELT $ 38))
                                  (QREFELT $ 39))
                                 (QREFELT $ 41)))
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (SPADCALL
                                        "algebra is not anti-associative"
                                        (QREFELT $ 45))
                                       (EXIT
                                        (PROGN
                                         (LETT #2# 'NIL . #3#)
                                         (GO #2#))))
                                      . #3#)
                                (GO #1#))))))
                           (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                           (EXIT NIL)))
                     #1# (EXIT #1#))
                    (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                    (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "algebra is anti-associative" (QREFELT $ 45)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;jordanAdmissible?;B;8| ($)
  (PROG (#1=#:G184 #2=#:G190 |l| |k| |j| |i| |n| |b|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |b| (SPADCALL (QREFELT $ 11))
              . #3=(|FINAALG-;jordanAdmissible?;B;8|))
        (LETT |n| (SPADCALL (QREFELT $ 9)) . #3#)
        (EXIT
         (COND
          ((QEQCAR
            (SPADCALL (SPADCALL 2 (|spadConstant| $ 21) (QREFELT $ 47))
                      (QREFELT $ 49))
            1)
           (SEQ
            (SPADCALL
             "this algebra is not Jordan admissible, as 2 is not invertible in the ground ring"
             (QREFELT $ 45))
            (EXIT 'NIL)))
          ('T
           (SEQ
            (SEQ (LETT |i| 1 . #3#) G190
                 (COND ((|greater_SI| |i| |n|) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1 . #3#) G190
                        (COND ((|greater_SI| |j| |n|) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1 . #3#) G190
                               (COND ((|greater_SI| |k| |n|) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |l| 1 . #3#) G190
                                      (COND ((|greater_SI| |l| |n|) (GO G191)))
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
                                                          (QREFELT $ 37))
                                                (SPADCALL |b| |j|
                                                          (QREFELT $ 37))
                                                (QREFELT $ 50))
                                               (SPADCALL
                                                (SPADCALL |b| |l|
                                                          (QREFELT $ 37))
                                                (SPADCALL |b| |k|
                                                          (QREFELT $ 37))
                                                (QREFELT $ 50))
                                               (QREFELT $ 50))
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |b| |l|
                                                          (QREFELT $ 37))
                                                (SPADCALL |b| |j|
                                                          (QREFELT $ 37))
                                                (QREFELT $ 50))
                                               (SPADCALL
                                                (SPADCALL |b| |k|
                                                          (QREFELT $ 37))
                                                (SPADCALL |b| |i|
                                                          (QREFELT $ 37))
                                                (QREFELT $ 50))
                                               (QREFELT $ 50))
                                              (QREFELT $ 39))
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |b| |k|
                                                         (QREFELT $ 37))
                                               (SPADCALL |b| |j|
                                                         (QREFELT $ 37))
                                               (QREFELT $ 50))
                                              (SPADCALL
                                               (SPADCALL |b| |i|
                                                         (QREFELT $ 37))
                                               (SPADCALL |b| |l|
                                                         (QREFELT $ 37))
                                               (QREFELT $ 50))
                                              (QREFELT $ 50))
                                             (QREFELT $ 39))
                                            (QREFELT $ 41)))
                                          (PROGN
                                           (LETT #1#
                                                 (SEQ
                                                  (SPADCALL
                                                   "this algebra is not Jordan admissible"
                                                   (QREFELT $ 45))
                                                  (EXIT
                                                   (PROGN
                                                    (LETT #2# 'NIL . #3#)
                                                    (GO #2#))))
                                                 . #3#)
                                           (GO #1#))))))
                                      (LETT |l| (|inc_SI| |l|) . #3#) (GO G190)
                                      G191 (EXIT NIL)))
                                #1# (EXIT #1#))
                               (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                        (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
            (SPADCALL "this algebra is Jordan admissible" (QREFELT $ 45))
            (EXIT 'T)))))))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;lieAdmissible?;B;9| ($)
  (PROG (#1=#:G193 #2=#:G197 |k| |j| |i| |b| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |n| (SPADCALL (QREFELT $ 9))
              . #3=(|FINAALG-;lieAdmissible?;B;9|))
        (LETT |b| (SPADCALL (QREFELT $ 11)) . #3#)
        (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| 1 . #3#) G190
                    (COND ((|greater_SI| |j| |n|) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |k| 1 . #3#) G190
                           (COND ((|greater_SI| |k| |n|) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                              (SPADCALL |b| |j| (QREFELT $ 37))
                                              (QREFELT $ 52))
                                    (SPADCALL |b| |k| (QREFELT $ 37))
                                    (QREFELT $ 52))
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |b| |j| (QREFELT $ 37))
                                              (SPADCALL |b| |k| (QREFELT $ 37))
                                              (QREFELT $ 52))
                                    (SPADCALL |b| |i| (QREFELT $ 37))
                                    (QREFELT $ 52))
                                   (QREFELT $ 39))
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |b| |k| (QREFELT $ 37))
                                             (SPADCALL |b| |i| (QREFELT $ 37))
                                             (QREFELT $ 52))
                                   (SPADCALL |b| |j| (QREFELT $ 37))
                                   (QREFELT $ 52))
                                  (QREFELT $ 39))
                                 (QREFELT $ 41)))
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (SPADCALL
                                        "this algebra is not Lie admissible"
                                        (QREFELT $ 45))
                                       (EXIT
                                        (PROGN
                                         (LETT #2# 'NIL . #3#)
                                         (GO #2#))))
                                      . #3#)
                                (GO #1#))))))
                           (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                           (EXIT NIL)))
                     #1# (EXIT #1#))
                    (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                    (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "this algebra is Lie admissible" (QREFELT $ 45)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;structuralConstants;VV;10| (|b| $)
  (PROG (|k| |covec| |j| |i| |sC| #1=#:G206 #2=#:G207 |m| #3=#:G198)
    (RETURN
     (SEQ
      (LETT |m|
            (PROG1
                (LETT #3# (QVSIZE |b|)
                      . #4=(|FINAALG-;structuralConstants;VV;10|))
              (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
            . #4#)
      (LETT |sC|
            (PROGN
             (LETT #2# (GETREFV |m|) . #4#)
             (SEQ (LETT |k| 1 . #4#) (LETT #1# 0 . #4#) G190
                  (COND ((|greater_SI| |k| |m|) (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #2# #1#
                            (SPADCALL |m| |m| (|spadConstant| $ 29)
                                      (QREFELT $ 54)))))
                  (LETT #1#
                        (PROG1 (|inc_SI| #1#) (LETT |k| (|inc_SI| |k|) . #4#))
                        . #4#)
                  (GO G190) G191 (EXIT NIL))
             #2#)
            . #4#)
      (SEQ (LETT |i| 1 . #4#) G190 (COND ((|greater_SI| |i| |m|) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #4#) G190
                  (COND ((|greater_SI| |j| |m|) (GO G191)))
                  (SEQ
                   (LETT |covec|
                         (SPADCALL
                          (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                    (SPADCALL |b| |j| (QREFELT $ 37))
                                    (QREFELT $ 38))
                          |b| (QREFELT $ 56))
                         . #4#)
                   (EXIT
                    (SEQ (LETT |k| 1 . #4#) G190
                         (COND ((|greater_SI| |k| |m|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL (SPADCALL |sC| |k| (QREFELT $ 58)) |i| |j|
                                     (SPADCALL |covec| |k| (QREFELT $ 59))
                                     (QREFELT $ 60))))
                         (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT |sC|))))) 

(DEFUN |FINAALG-;leftRecip;SU;11| (|x| $)
  (PROG (#1=#:G224 #2=#:G226 |power| #3=#:G227 |i| #4=#:G225 |invCR| |invC|
         |vectorOfCoef| |cond| |listOfPowers| |xx| |k| |b| |lu|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 41)) (CONS 1 "failed"))
            (#5='T
             (SEQ
              (LETT |lu| (SPADCALL (QREFELT $ 62))
                    . #6=(|FINAALG-;leftRecip;SU;11|))
              (EXIT
               (COND ((QEQCAR |lu| 1) (CONS 1 "failed"))
                     (#5#
                      (SEQ (LETT |b| (SPADCALL (QREFELT $ 11)) . #6#)
                           (LETT |xx| (QCDR |lu|) . #6#) (LETT |k| 1 . #6#)
                           (LETT |cond|
                                 (SPADCALL (SPADCALL |xx| |b| (QREFELT $ 56))
                                           (QREFELT $ 63))
                                 . #6#)
                           (LETT |listOfPowers| (LIST |xx|) . #6#)
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (EQL (SPADCALL |cond| (QREFELT $ 64)) |k|))
                                  (GO G191)))
                                (SEQ (LETT |k| (+ |k| 1) . #6#)
                                     (LETT |xx|
                                           (SPADCALL |xx| |x| (QREFELT $ 38))
                                           . #6#)
                                     (LETT |listOfPowers|
                                           (CONS |xx| |listOfPowers|) . #6#)
                                     (EXIT
                                      (LETT |cond|
                                            (SPADCALL |cond|
                                                      (SPADCALL
                                                       (SPADCALL |xx| |b|
                                                                 (QREFELT $
                                                                          56))
                                                       (QREFELT $ 63))
                                                      (QREFELT $ 65))
                                            . #6#)))
                                NIL (GO G190) G191 (EXIT NIL))
                           (LETT |vectorOfCoef|
                                 (|SPADfirst| (SPADCALL |cond| (QREFELT $ 67)))
                                 . #6#)
                           (LETT |invC|
                                 (SPADCALL
                                  (SPADCALL |vectorOfCoef| 1 (QREFELT $ 59))
                                  (QREFELT $ 49))
                                 . #6#)
                           (EXIT
                            (COND ((QEQCAR |invC| 1) (CONS 1 "failed"))
                                  (#5#
                                   (SEQ
                                    (LETT |invCR|
                                          (SPADCALL (QCDR |invC|)
                                                    (QREFELT $ 68))
                                          . #6#)
                                    (EXIT
                                     (CONS 0
                                           (SPADCALL (ELT $ 39)
                                                     (PROGN
                                                      (LETT #4#
                                                            (GETREFV
                                                             (MIN
                                                              (|inc_SI|
                                                               (-
                                                                #7=(QVSIZE
                                                                    |vectorOfCoef|)
                                                                2))
                                                              (SIZE
                                                               #8=(REVERSE
                                                                   |listOfPowers|))))
                                                            . #6#)
                                                      (SEQ (LETT |i| 2 . #6#)
                                                           (LETT #3# #7# . #6#)
                                                           (LETT |power| NIL
                                                                 . #6#)
                                                           (LETT #2# #8# . #6#)
                                                           (LETT #1# 0 . #6#)
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #2#)
                                                                 (PROGN
                                                                  (LETT |power|
                                                                        (CAR
                                                                         #2#)
                                                                        . #6#)
                                                                  NIL)
                                                                 (|greater_SI|
                                                                  |i| #3#))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (SETELT #4# #1#
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       |invCR|
                                                                       (SPADCALL
                                                                        |vectorOfCoef|
                                                                        |i|
                                                                        (QREFELT
                                                                         $ 59))
                                                                       (QREFELT
                                                                        $ 69))
                                                                      |power|
                                                                      (QREFELT
                                                                       $
                                                                       70)))))
                                                           (LETT #1#
                                                                 (PROG1
                                                                     (|inc_SI|
                                                                      #1#)
                                                                   (LETT #2#
                                                                         (PROG1
                                                                             (CDR
                                                                              #2#)
                                                                           (LETT
                                                                            |i|
                                                                            (|inc_SI|
                                                                             |i|)
                                                                            . #6#))
                                                                         . #6#))
                                                                 . #6#)
                                                           (GO G190) G191
                                                           (EXIT NIL))
                                                      #4#)
                                                     (QREFELT $
                                                              72))))))))))))))))))) 

(DEFUN |FINAALG-;rightRecip;SU;12| (|x| $)
  (PROG (#1=#:G244 #2=#:G246 |power| #3=#:G247 |i| #4=#:G245 |invCR| |invC|
         |vectorOfCoef| |cond| |listOfPowers| |xx| |k| |b| |ru|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 41)) (CONS 1 "failed"))
            (#5='T
             (SEQ
              (LETT |ru| (SPADCALL (QREFELT $ 74))
                    . #6=(|FINAALG-;rightRecip;SU;12|))
              (EXIT
               (COND ((QEQCAR |ru| 1) (CONS 1 "failed"))
                     (#5#
                      (SEQ (LETT |b| (SPADCALL (QREFELT $ 11)) . #6#)
                           (LETT |xx| (QCDR |ru|) . #6#) (LETT |k| 1 . #6#)
                           (LETT |cond|
                                 (SPADCALL (SPADCALL |xx| |b| (QREFELT $ 56))
                                           (QREFELT $ 63))
                                 . #6#)
                           (LETT |listOfPowers| (LIST |xx|) . #6#)
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (EQL (SPADCALL |cond| (QREFELT $ 64)) |k|))
                                  (GO G191)))
                                (SEQ (LETT |k| (+ |k| 1) . #6#)
                                     (LETT |xx|
                                           (SPADCALL |x| |xx| (QREFELT $ 38))
                                           . #6#)
                                     (LETT |listOfPowers|
                                           (CONS |xx| |listOfPowers|) . #6#)
                                     (EXIT
                                      (LETT |cond|
                                            (SPADCALL |cond|
                                                      (SPADCALL
                                                       (SPADCALL |xx| |b|
                                                                 (QREFELT $
                                                                          56))
                                                       (QREFELT $ 63))
                                                      (QREFELT $ 65))
                                            . #6#)))
                                NIL (GO G190) G191 (EXIT NIL))
                           (LETT |vectorOfCoef|
                                 (|SPADfirst| (SPADCALL |cond| (QREFELT $ 67)))
                                 . #6#)
                           (LETT |invC|
                                 (SPADCALL
                                  (SPADCALL |vectorOfCoef| 1 (QREFELT $ 59))
                                  (QREFELT $ 49))
                                 . #6#)
                           (EXIT
                            (COND ((QEQCAR |invC| 1) (CONS 1 "failed"))
                                  (#5#
                                   (SEQ
                                    (LETT |invCR|
                                          (SPADCALL (QCDR |invC|)
                                                    (QREFELT $ 68))
                                          . #6#)
                                    (EXIT
                                     (CONS 0
                                           (SPADCALL (ELT $ 39)
                                                     (PROGN
                                                      (LETT #4#
                                                            (GETREFV
                                                             (MIN
                                                              (|inc_SI|
                                                               (-
                                                                #7=(QVSIZE
                                                                    |vectorOfCoef|)
                                                                2))
                                                              (SIZE
                                                               #8=(REVERSE
                                                                   |listOfPowers|))))
                                                            . #6#)
                                                      (SEQ (LETT |i| 2 . #6#)
                                                           (LETT #3# #7# . #6#)
                                                           (LETT |power| NIL
                                                                 . #6#)
                                                           (LETT #2# #8# . #6#)
                                                           (LETT #1# 0 . #6#)
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #2#)
                                                                 (PROGN
                                                                  (LETT |power|
                                                                        (CAR
                                                                         #2#)
                                                                        . #6#)
                                                                  NIL)
                                                                 (|greater_SI|
                                                                  |i| #3#))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (SETELT #4# #1#
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       |invCR|
                                                                       (SPADCALL
                                                                        |vectorOfCoef|
                                                                        |i|
                                                                        (QREFELT
                                                                         $ 59))
                                                                       (QREFELT
                                                                        $ 69))
                                                                      |power|
                                                                      (QREFELT
                                                                       $
                                                                       70)))))
                                                           (LETT #1#
                                                                 (PROG1
                                                                     (|inc_SI|
                                                                      #1#)
                                                                   (LETT #2#
                                                                         (PROG1
                                                                             (CDR
                                                                              #2#)
                                                                           (LETT
                                                                            |i|
                                                                            (|inc_SI|
                                                                             |i|)
                                                                            . #6#))
                                                                         . #6#))
                                                                 . #6#)
                                                           (GO G190) G191
                                                           (EXIT NIL))
                                                      #4#)
                                                     (QREFELT $
                                                              72))))))))))))))))))) 

(DEFUN |FINAALG-;recip;SU;13| (|x| $)
  (PROG (|rrx| |lrx|)
    (RETURN
     (SEQ
      (LETT |lrx| (SPADCALL |x| (QREFELT $ 76)) . #1=(|FINAALG-;recip;SU;13|))
      (EXIT
       (COND ((QEQCAR |lrx| 1) (CONS 1 "failed"))
             ('T
              (SEQ (LETT |rrx| (SPADCALL |x| (QREFELT $ 77)) . #1#)
                   (EXIT
                    (COND
                     ((OR (QEQCAR |rrx| 1)
                          (SPADCALL (QCDR |lrx|) (QCDR |rrx|) (QREFELT $ 78)))
                      (CONS 1 "failed"))
                     ('T (CONS 0 (QCDR |lrx|))))))))))))) 

(DEFUN |FINAALG-;leftMinimalPolynomial;SSup;14| (|x| $)
  (PROG (|res| |i| |vectorOfCoef| |cond| |xx| |k| |b|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (QREFELT $ 41))
        (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 20)))
       ('T
        (SEQ
         (LETT |b| (SPADCALL (QREFELT $ 11))
               . #1=(|FINAALG-;leftMinimalPolynomial;SSup;14|))
         (LETT |xx| |x| . #1#) (LETT |k| 1 . #1#)
         (LETT |cond|
               (SPADCALL (SPADCALL |xx| |b| (QREFELT $ 56)) (QREFELT $ 63))
               . #1#)
         (SEQ G190
              (COND
               ((NULL (EQL (SPADCALL |cond| (QREFELT $ 64)) |k|)) (GO G191)))
              (SEQ (LETT |k| (+ |k| 1) . #1#)
                   (LETT |xx| (SPADCALL |x| |xx| (QREFELT $ 38)) . #1#)
                   (EXIT
                    (LETT |cond|
                          (SPADCALL |cond|
                                    (SPADCALL
                                     (SPADCALL |xx| |b| (QREFELT $ 56))
                                     (QREFELT $ 63))
                                    (QREFELT $ 65))
                          . #1#)))
              NIL (GO G190) G191 (EXIT NIL))
         (LETT |vectorOfCoef| (|SPADfirst| (SPADCALL |cond| (QREFELT $ 67)))
               . #1#)
         (LETT |res| (|spadConstant| $ 80) . #1#)
         (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |k|) (GO G191)))
              (SEQ
               (EXIT
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL |vectorOfCoef| |i| (QREFELT $ 59))
                                 |i| (QREFELT $ 20))
                                (QREFELT $ 81))
                      . #1#)))
              (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
         (EXIT |res|)))))))) 

(DEFUN |FINAALG-;rightMinimalPolynomial;SSup;15| (|x| $)
  (PROG (|res| |i| |vectorOfCoef| |cond| |xx| |k| |b|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (QREFELT $ 41))
        (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 20)))
       ('T
        (SEQ
         (LETT |b| (SPADCALL (QREFELT $ 11))
               . #1=(|FINAALG-;rightMinimalPolynomial;SSup;15|))
         (LETT |xx| |x| . #1#) (LETT |k| 1 . #1#)
         (LETT |cond|
               (SPADCALL (SPADCALL |xx| |b| (QREFELT $ 56)) (QREFELT $ 63))
               . #1#)
         (SEQ G190
              (COND
               ((NULL (EQL (SPADCALL |cond| (QREFELT $ 64)) |k|)) (GO G191)))
              (SEQ (LETT |k| (+ |k| 1) . #1#)
                   (LETT |xx| (SPADCALL |xx| |x| (QREFELT $ 38)) . #1#)
                   (EXIT
                    (LETT |cond|
                          (SPADCALL |cond|
                                    (SPADCALL
                                     (SPADCALL |xx| |b| (QREFELT $ 56))
                                     (QREFELT $ 63))
                                    (QREFELT $ 65))
                          . #1#)))
              NIL (GO G190) G191 (EXIT NIL))
         (LETT |vectorOfCoef| (|SPADfirst| (SPADCALL |cond| (QREFELT $ 67)))
               . #1#)
         (LETT |res| (|spadConstant| $ 80) . #1#)
         (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |k|) (GO G191)))
              (SEQ
               (EXIT
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL |vectorOfCoef| |i| (QREFELT $ 59))
                                 |i| (QREFELT $ 20))
                                (QREFELT $ 81))
                      . #1#)))
              (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
         (EXIT |res|)))))))) 

(DEFUN |FINAALG-;associatorDependence;L;16| ($)
  (PROG (|z| |r| |a213| |a321| |a132| |a312| |a231| |a123| |k| |j| |i| |cond|
         |b| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (QREFELT $ 9))
            . #1=(|FINAALG-;associatorDependence;L;16|))
      (LETT |b| (SPADCALL (QREFELT $ 11)) . #1#)
      (LETT |cond|
            (SPADCALL (SPADCALL |n| 4 (QREFELT $ 84)) 6 (|spadConstant| $ 29)
                      (QREFELT $ 54))
            . #1#)
      (LETT |z| 0 . #1#)
      (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #1#) G190
                  (COND ((|greater_SI| |j| |n|) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |k| 1 . #1#) G190
                         (COND ((|greater_SI| |k| |n|) (GO G191)))
                         (SEQ
                          (LETT |a123|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                           (SPADCALL |b| |j| (QREFELT $ 37))
                                           (SPADCALL |b| |k| (QREFELT $ 37))
                                           (QREFELT $ 85))
                                 |b| (QREFELT $ 56))
                                . #1#)
                          (LETT |a231|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |b| |j| (QREFELT $ 37))
                                           (SPADCALL |b| |k| (QREFELT $ 37))
                                           (SPADCALL |b| |i| (QREFELT $ 37))
                                           (QREFELT $ 85))
                                 |b| (QREFELT $ 56))
                                . #1#)
                          (LETT |a312|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |b| |k| (QREFELT $ 37))
                                           (SPADCALL |b| |i| (QREFELT $ 37))
                                           (SPADCALL |b| |j| (QREFELT $ 37))
                                           (QREFELT $ 85))
                                 |b| (QREFELT $ 56))
                                . #1#)
                          (LETT |a132|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                           (SPADCALL |b| |k| (QREFELT $ 37))
                                           (SPADCALL |b| |j| (QREFELT $ 37))
                                           (QREFELT $ 85))
                                 |b| (QREFELT $ 56))
                                . #1#)
                          (LETT |a321|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |b| |k| (QREFELT $ 37))
                                           (SPADCALL |b| |j| (QREFELT $ 37))
                                           (SPADCALL |b| |i| (QREFELT $ 37))
                                           (QREFELT $ 85))
                                 |b| (QREFELT $ 56))
                                . #1#)
                          (LETT |a213|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |b| |j| (QREFELT $ 37))
                                           (SPADCALL |b| |i| (QREFELT $ 37))
                                           (SPADCALL |b| |k| (QREFELT $ 37))
                                           (QREFELT $ 85))
                                 |b| (QREFELT $ 56))
                                . #1#)
                          (EXIT
                           (SEQ (LETT |r| 1 . #1#) G190
                                (COND ((|greater_SI| |r| |n|) (GO G191)))
                                (SEQ (LETT |z| (+ |z| 1) . #1#)
                                     (SPADCALL |cond| |z| 1
                                               (SPADCALL |a123| |r|
                                                         (QREFELT $ 59))
                                               (QREFELT $ 60))
                                     (SPADCALL |cond| |z| 2
                                               (SPADCALL |a231| |r|
                                                         (QREFELT $ 59))
                                               (QREFELT $ 60))
                                     (SPADCALL |cond| |z| 3
                                               (SPADCALL |a312| |r|
                                                         (QREFELT $ 59))
                                               (QREFELT $ 60))
                                     (SPADCALL |cond| |z| 4
                                               (SPADCALL |a132| |r|
                                                         (QREFELT $ 59))
                                               (QREFELT $ 60))
                                     (SPADCALL |cond| |z| 5
                                               (SPADCALL |a321| |r|
                                                         (QREFELT $ 59))
                                               (QREFELT $ 60))
                                     (EXIT
                                      (SPADCALL |cond| |z| 6
                                                (SPADCALL |a213| |r|
                                                          (QREFELT $ 59))
                                                (QREFELT $ 60))))
                                (LETT |r| (|inc_SI| |r|) . #1#) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |cond| (QREFELT $ 67))))))) 

(DEFUN |FINAALG-;jacobiIdentity?;B;17| ($)
  (PROG (#1=#:G277 #2=#:G281 |k| |j| |i| |b| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |n| (SPADCALL (QREFELT $ 9))
              . #3=(|FINAALG-;jacobiIdentity?;B;17|))
        (LETT |b| (SPADCALL (QREFELT $ 11)) . #3#)
        (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| 1 . #3#) G190
                    (COND ((|greater_SI| |j| |n|) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |k| 1 . #3#) G190
                           (COND ((|greater_SI| |k| |n|) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                              (SPADCALL |b| |j| (QREFELT $ 37))
                                              (QREFELT $ 38))
                                    (SPADCALL |b| |k| (QREFELT $ 37))
                                    (QREFELT $ 38))
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |b| |j| (QREFELT $ 37))
                                              (SPADCALL |b| |k| (QREFELT $ 37))
                                              (QREFELT $ 38))
                                    (SPADCALL |b| |i| (QREFELT $ 37))
                                    (QREFELT $ 38))
                                   (QREFELT $ 39))
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |b| |k| (QREFELT $ 37))
                                             (SPADCALL |b| |i| (QREFELT $ 37))
                                             (QREFELT $ 38))
                                   (SPADCALL |b| |j| (QREFELT $ 37))
                                   (QREFELT $ 38))
                                  (QREFELT $ 39))
                                 (QREFELT $ 41)))
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (SPADCALL
                                        "Jacobi identity does not hold"
                                        (QREFELT $ 45))
                                       (EXIT
                                        (PROGN
                                         (LETT #2# 'NIL . #3#)
                                         (GO #2#))))
                                      . #3#)
                                (GO #1#))))))
                           (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                           (EXIT NIL)))
                     #1# (EXIT #1#))
                    (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                    (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "Jacobi identity holds" (QREFELT $ 45)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;lieAlgebra?;B;18| ($)
  (SEQ
   (COND
    ((SPADCALL (QREFELT $ 88))
     (COND
      ((SPADCALL (QREFELT $ 89))
       (SEQ (SPADCALL "this is a Lie algebra" (QREFELT $ 45)) (EXIT 'T)))
      (#1='T
       (SEQ (SPADCALL "this is not a Lie algebra" (QREFELT $ 45))
            (EXIT 'NIL)))))
    (#1#
     (SEQ (SPADCALL "this is not a Lie algebra" (QREFELT $ 45)) (EXIT 'NIL)))))) 

(DEFUN |FINAALG-;jordanAlgebra?;B;19| ($)
  (PROG (#1=#:G292 #2=#:G299 |l| |k| |j| |i| |n| |b|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |b| (SPADCALL (QREFELT $ 11))
              . #3=(|FINAALG-;jordanAlgebra?;B;19|))
        (LETT |n| (SPADCALL (QREFELT $ 9)) . #3#)
        (EXIT
         (COND
          ((QEQCAR
            (SPADCALL (SPADCALL 2 (|spadConstant| $ 21) (QREFELT $ 47))
                      (QREFELT $ 49))
            1)
           (SEQ
            (SPADCALL
             "this is not a Jordan algebra, as 2 is not invertible in the ground ring"
             (QREFELT $ 45))
            (EXIT 'NIL)))
          ((SPADCALL (QREFELT $ 91))
           (SEQ
            (SEQ (LETT |i| 1 . #3#) G190
                 (COND ((|greater_SI| |i| |n|) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1 . #3#) G190
                        (COND ((|greater_SI| |j| |n|) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1 . #3#) G190
                               (COND ((|greater_SI| |k| |n|) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |l| 1 . #3#) G190
                                      (COND ((|greater_SI| |l| |n|) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((NULL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |b| |i|
                                                         (QREFELT $ 37))
                                               (SPADCALL |b| |j|
                                                         (QREFELT $ 37))
                                               (SPADCALL
                                                (SPADCALL |b| |l|
                                                          (QREFELT $ 37))
                                                (SPADCALL |b| |k|
                                                          (QREFELT $ 37))
                                                (QREFELT $ 38))
                                               (QREFELT $ 85))
                                              (SPADCALL
                                               (SPADCALL |b| |l|
                                                         (QREFELT $ 37))
                                               (SPADCALL |b| |j|
                                                         (QREFELT $ 37))
                                               (SPADCALL
                                                (SPADCALL |b| |k|
                                                          (QREFELT $ 37))
                                                (SPADCALL |b| |i|
                                                          (QREFELT $ 37))
                                                (QREFELT $ 38))
                                               (QREFELT $ 85))
                                              (QREFELT $ 39))
                                             (SPADCALL
                                              (SPADCALL |b| |k| (QREFELT $ 37))
                                              (SPADCALL |b| |j| (QREFELT $ 37))
                                              (SPADCALL
                                               (SPADCALL |b| |i|
                                                         (QREFELT $ 37))
                                               (SPADCALL |b| |l|
                                                         (QREFELT $ 37))
                                               (QREFELT $ 38))
                                              (QREFELT $ 85))
                                             (QREFELT $ 39))
                                            (QREFELT $ 41)))
                                          (PROGN
                                           (LETT #1#
                                                 (SEQ
                                                  (SPADCALL
                                                   "not a Jordan algebra"
                                                   (QREFELT $ 45))
                                                  (EXIT
                                                   (PROGN
                                                    (LETT #2# 'NIL . #3#)
                                                    (GO #2#))))
                                                 . #3#)
                                           (GO #1#))))))
                                      (LETT |l| (|inc_SI| |l|) . #3#) (GO G190)
                                      G191 (EXIT NIL)))
                                #1# (EXIT #1#))
                               (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                        (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
            (SPADCALL "this is a Jordan algebra" (QREFELT $ 45)) (EXIT 'T)))
          ('T
           (SEQ (SPADCALL "this is not a Jordan algebra" (QREFELT $ 45))
                (EXIT 'NIL)))))))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;noncommutativeJordanAlgebra?;B;20| ($)
  (PROG (|n| |b|)
    (RETURN
     (SEQ
      (LETT |b| (SPADCALL (QREFELT $ 11))
            . #1=(|FINAALG-;noncommutativeJordanAlgebra?;B;20|))
      (LETT |n| (SPADCALL (QREFELT $ 9)) . #1#)
      (EXIT
       (COND
        ((QEQCAR
          (SPADCALL (SPADCALL 2 (|spadConstant| $ 21) (QREFELT $ 47))
                    (QREFELT $ 49))
          1)
         (SEQ
          (SPADCALL
           "this is not a noncommutative Jordan algebra, as 2 is not invertible in the ground ring"
           (QREFELT $ 45))
          (EXIT 'NIL)))
        ((SPADCALL (QREFELT $ 93))
         (COND
          ((SPADCALL (QREFELT $ 94))
           (SEQ
            (SPADCALL "this is a noncommutative Jordan algebra" (QREFELT $ 45))
            (EXIT 'T)))
          (#2='T
           (SEQ
            (SPADCALL
             "this is not a noncommutative Jordan algebra, as it is not Jordan admissible"
             (QREFELT $ 45))
            (EXIT 'NIL)))))
        (#2#
         (SEQ
          (SPADCALL
           "this is not a noncommutative Jordan algebra, as it is not flexible"
           (QREFELT $ 45))
          (EXIT 'NIL))))))))) 

(DEFUN |FINAALG-;antiCommutative?;B;21| ($)
  (PROG (#1=#:G311 #2=#:G314 |j| |i| |n| |b|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |b| (SPADCALL (QREFELT $ 11))
              . #3=(|FINAALG-;antiCommutative?;B;21|))
        (LETT |n| (SPADCALL (QREFELT $ 9)) . #3#)
        (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| |i| . #3#) G190 (COND ((> |j| |n|) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((NULL
                         (SPADCALL
                          (COND
                           ((EQL |i| |j|)
                            (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                      (SPADCALL |b| |i| (QREFELT $ 37))
                                      (QREFELT $ 38)))
                           ('T
                            (SPADCALL
                             (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                       (SPADCALL |b| |j| (QREFELT $ 37))
                                       (QREFELT $ 38))
                             (SPADCALL (SPADCALL |b| |j| (QREFELT $ 37))
                                       (SPADCALL |b| |i| (QREFELT $ 37))
                                       (QREFELT $ 38))
                             (QREFELT $ 39))))
                          (QREFELT $ 41)))
                        (PROGN
                         (LETT #1#
                               (SEQ
                                (SPADCALL "algebra is not anti-commutative"
                                          (QREFELT $ 45))
                                (EXIT (PROGN (LETT #2# 'NIL . #3#) (GO #2#))))
                               . #3#)
                         (GO #1#))))))
                    (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL)))
              #1# (EXIT #1#))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "algebra is anti-commutative" (QREFELT $ 45)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;commutative?;B;22| ($)
  (PROG (#1=#:G317 #2=#:G320 |j| |i| |n| |b|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |b| (SPADCALL (QREFELT $ 11))
              . #3=(|FINAALG-;commutative?;B;22|))
        (LETT |n| (SPADCALL (QREFELT $ 9)) . #3#)
        (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| (+ |i| 1) . #3#) G190
                    (COND ((> |j| |n|) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((NULL
                         (SPADCALL
                          (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                    (SPADCALL |b| |j| (QREFELT $ 37))
                                    (QREFELT $ 52))
                          (QREFELT $ 41)))
                        (PROGN
                         (LETT #1#
                               (SEQ
                                (SPADCALL "algebra is not commutative"
                                          (QREFELT $ 45))
                                (EXIT (PROGN (LETT #2# 'NIL . #3#) (GO #2#))))
                               . #3#)
                         (GO #1#))))))
                    (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL)))
              #1# (EXIT #1#))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "algebra is commutative" (QREFELT $ 45)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;associative?;B;23| ($)
  (PROG (#1=#:G323 #2=#:G327 |k| |j| |i| |n| |b|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |b| (SPADCALL (QREFELT $ 11))
              . #3=(|FINAALG-;associative?;B;23|))
        (LETT |n| (SPADCALL (QREFELT $ 9)) . #3#)
        (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| 1 . #3#) G190
                    (COND ((|greater_SI| |j| |n|) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |k| 1 . #3#) G190
                           (COND ((|greater_SI| |k| |n|) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                           (SPADCALL |b| |j| (QREFELT $ 37))
                                           (SPADCALL |b| |k| (QREFELT $ 37))
                                           (QREFELT $ 85))
                                 (QREFELT $ 41)))
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (SPADCALL "algebra is not associative"
                                                 (QREFELT $ 45))
                                       (EXIT
                                        (PROGN
                                         (LETT #2# 'NIL . #3#)
                                         (GO #2#))))
                                      . #3#)
                                (GO #1#))))))
                           (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                           (EXIT NIL)))
                     #1# (EXIT #1#))
                    (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                    (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "algebra is associative" (QREFELT $ 45)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;leftAlternative?;B;24| ($)
  (PROG (#1=#:G330 #2=#:G334 |k| |j| |i| |n| |b|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |b| (SPADCALL (QREFELT $ 11))
              . #3=(|FINAALG-;leftAlternative?;B;24|))
        (LETT |n| (SPADCALL (QREFELT $ 9)) . #3#)
        (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| 1 . #3#) G190
                    (COND ((|greater_SI| |j| |n|) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |k| 1 . #3#) G190
                           (COND ((|greater_SI| |k| |n|) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                            (SPADCALL |b| |j| (QREFELT $ 37))
                                            (SPADCALL |b| |k| (QREFELT $ 37))
                                            (QREFELT $ 85))
                                  (SPADCALL (SPADCALL |b| |j| (QREFELT $ 37))
                                            (SPADCALL |b| |i| (QREFELT $ 37))
                                            (SPADCALL |b| |k| (QREFELT $ 37))
                                            (QREFELT $ 85))
                                  (QREFELT $ 39))
                                 (QREFELT $ 41)))
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (SPADCALL
                                        "algebra is not left alternative"
                                        (QREFELT $ 45))
                                       (EXIT
                                        (PROGN
                                         (LETT #2# 'NIL . #3#)
                                         (GO #2#))))
                                      . #3#)
                                (GO #1#))))))
                           (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                           (EXIT NIL)))
                     #1# (EXIT #1#))
                    (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                    (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "algebra satisfies 2*associator(a,a,b) = 0" (QREFELT $ 45))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;rightAlternative?;B;25| ($)
  (PROG (#1=#:G337 #2=#:G341 |k| |j| |i| |n| |b|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |b| (SPADCALL (QREFELT $ 11))
              . #3=(|FINAALG-;rightAlternative?;B;25|))
        (LETT |n| (SPADCALL (QREFELT $ 9)) . #3#)
        (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| 1 . #3#) G190
                    (COND ((|greater_SI| |j| |n|) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |k| 1 . #3#) G190
                           (COND ((|greater_SI| |k| |n|) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                            (SPADCALL |b| |j| (QREFELT $ 37))
                                            (SPADCALL |b| |k| (QREFELT $ 37))
                                            (QREFELT $ 85))
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                            (SPADCALL |b| |k| (QREFELT $ 37))
                                            (SPADCALL |b| |j| (QREFELT $ 37))
                                            (QREFELT $ 85))
                                  (QREFELT $ 39))
                                 (QREFELT $ 41)))
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (SPADCALL
                                        "algebra is not right alternative"
                                        (QREFELT $ 45))
                                       (EXIT
                                        (PROGN
                                         (LETT #2# 'NIL . #3#)
                                         (GO #2#))))
                                      . #3#)
                                (GO #1#))))))
                           (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                           (EXIT NIL)))
                     #1# (EXIT #1#))
                    (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                    (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "algebra satisfies 2*associator(a,b,b) = 0" (QREFELT $ 45))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;flexible?;B;26| ($)
  (PROG (#1=#:G344 #2=#:G348 |k| |j| |i| |n| |b|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |b| (SPADCALL (QREFELT $ 11)) . #3=(|FINAALG-;flexible?;B;26|))
        (LETT |n| (SPADCALL (QREFELT $ 9)) . #3#)
        (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| 1 . #3#) G190
                    (COND ((|greater_SI| |j| |n|) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |k| 1 . #3#) G190
                           (COND ((|greater_SI| |k| |n|) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                            (SPADCALL |b| |j| (QREFELT $ 37))
                                            (SPADCALL |b| |k| (QREFELT $ 37))
                                            (QREFELT $ 85))
                                  (SPADCALL (SPADCALL |b| |k| (QREFELT $ 37))
                                            (SPADCALL |b| |j| (QREFELT $ 37))
                                            (SPADCALL |b| |i| (QREFELT $ 37))
                                            (QREFELT $ 85))
                                  (QREFELT $ 39))
                                 (QREFELT $ 41)))
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (SPADCALL "algebra is not flexible"
                                                 (QREFELT $ 45))
                                       (EXIT
                                        (PROGN
                                         (LETT #2# 'NIL . #3#)
                                         (GO #2#))))
                                      . #3#)
                                (GO #1#))))))
                           (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                           (EXIT NIL)))
                     #1# (EXIT #1#))
                    (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                    (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "algebra satisfies 2*associator(a,b,a) = 0" (QREFELT $ 45))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;alternative?;B;27| ($)
  (PROG (#1=#:G352 #2=#:G357 |k| |j| |i| |n| |b|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |b| (SPADCALL (QREFELT $ 11))
              . #3=(|FINAALG-;alternative?;B;27|))
        (LETT |n| (SPADCALL (QREFELT $ 9)) . #3#)
        (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| 1 . #3#) G190
                    (COND ((|greater_SI| |j| |n|) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |k| 1 . #3#) G190
                           (COND ((|greater_SI| |k| |n|) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                            (SPADCALL |b| |j| (QREFELT $ 37))
                                            (SPADCALL |b| |k| (QREFELT $ 37))
                                            (QREFELT $ 85))
                                  (SPADCALL (SPADCALL |b| |j| (QREFELT $ 37))
                                            (SPADCALL |b| |i| (QREFELT $ 37))
                                            (SPADCALL |b| |k| (QREFELT $ 37))
                                            (QREFELT $ 85))
                                  (QREFELT $ 39))
                                 (QREFELT $ 41)))
                               (SEQ
                                (SPADCALL "algebra is not alternative"
                                          (QREFELT $ 45))
                                (EXIT (PROGN (LETT #2# 'NIL . #3#) (GO #2#)))))
                              ((NULL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                            (SPADCALL |b| |j| (QREFELT $ 37))
                                            (SPADCALL |b| |k| (QREFELT $ 37))
                                            (QREFELT $ 85))
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT $ 37))
                                            (SPADCALL |b| |k| (QREFELT $ 37))
                                            (SPADCALL |b| |j| (QREFELT $ 37))
                                            (QREFELT $ 85))
                                  (QREFELT $ 39))
                                 (QREFELT $ 41)))
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (SPADCALL "algebra is not alternative"
                                                 (QREFELT $ 45))
                                       (EXIT
                                        (PROGN
                                         (LETT #2# 'NIL . #3#)
                                         (GO #2#))))
                                      . #3#)
                                (GO #1#)))))
                            #1# (EXIT #1#))
                           (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                    (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (SPADCALL
         "algebra satisfies 2*associator(a,b,b) = 0 =  2*associator(a,a,b) = 0"
         (QREFELT $ 45))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;leftDiscriminant;VR;28| (|v| $)
  (SPADCALL (SPADCALL |v| (QREFELT $ 103)) (QREFELT $ 33))) 

(DEFUN |FINAALG-;rightDiscriminant;VR;29| (|v| $)
  (SPADCALL (SPADCALL |v| (QREFELT $ 105)) (QREFELT $ 33))) 

(DEFUN |FINAALG-;coordinates;2VM;30| (|v| |b| $)
  (PROG (#1=#:G363 |i| |j| |m|)
    (RETURN
     (SEQ
      (LETT |m|
            (SPADCALL (QVSIZE |v|) (QVSIZE |b|) (|spadConstant| $ 29)
                      (QREFELT $ 54))
            . #2=(|FINAALG-;coordinates;2VM;30|))
      (SEQ (LETT |j| 1 . #2#) (LETT |i| (SPADCALL |v| (QREFELT $ 107)) . #2#)
           (LETT #1# (QVSIZE |v|) . #2#) G190 (COND ((> |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |m| |j|
                       (SPADCALL (QAREF1O |v| |i| 1) |b| (QREFELT $ 56))
                       (QREFELT $ 108))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (|inc_SI| |j|) . #2#)) . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |m|))))) 

(DEFUN |FINAALG-;represents;VVS;31| (|v| |b| $)
  (PROG (#1=#:G369 #2=#:G371 |i| #3=#:G370 |m|)
    (RETURN
     (SEQ
      (LETT |m| (- (SPADCALL |v| (QREFELT $ 110)) 1)
            . #4=(|FINAALG-;represents;VVS;31|))
      (EXIT
       (SPADCALL (ELT $ 39)
                 (PROGN
                  (LETT #3# (GETREFV #5=(QVSIZE |b|)) . #4#)
                  (SEQ (LETT |i| 1 . #4#) (LETT #2# #5# . #4#)
                       (LETT #1# 0 . #4#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SETELT #3# #1#
                                 (SPADCALL
                                  (SPADCALL |v| (+ |i| |m|) (QREFELT $ 59))
                                  (SPADCALL |b| (+ |i| |m|) (QREFELT $ 37))
                                  (QREFELT $ 70)))))
                       (LETT #1#
                             (PROG1 (|inc_SI| #1#)
                               (LETT |i| (|inc_SI| |i|) . #4#))
                             . #4#)
                       (GO G190) G191 (EXIT NIL))
                  #3#)
                 (QREFELT $ 72))))))) 

(DEFUN |FINAALG-;leftTraceMatrix;VM;32| (|v| $)
  (PROG (#1=#:G378 |j| #2=#:G377 #3=#:G376 |i| #4=#:G375)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #4# NIL . #5=(|FINAALG-;leftTraceMatrix;VM;32|))
        (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 107)) . #5#)
             (LETT #3# (QVSIZE |v|) . #5#) G190 (COND ((> |i| #3#) (GO G191)))
             (SEQ
              (EXIT
               (LETT #4#
                     (CONS
                      (PROGN
                       (LETT #2# NIL . #5#)
                       (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 107)) . #5#)
                            (LETT #1# (QVSIZE |v|) . #5#) G190
                            (COND ((> |j| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |v| |i| (QREFELT $ 37))
                                       (SPADCALL |v| |j| (QREFELT $ 37))
                                       (QREFELT $ 38))
                                      (QREFELT $ 112))
                                     #2#)
                                    . #5#)))
                            (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      #4#)
                     . #5#)))
             (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT (NREVERSE #4#))))
       (QREFELT $ 114)))))) 

(DEFUN |FINAALG-;rightTraceMatrix;VM;33| (|v| $)
  (PROG (#1=#:G385 |j| #2=#:G384 #3=#:G383 |i| #4=#:G382)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #4# NIL . #5=(|FINAALG-;rightTraceMatrix;VM;33|))
        (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 107)) . #5#)
             (LETT #3# (QVSIZE |v|) . #5#) G190 (COND ((> |i| #3#) (GO G191)))
             (SEQ
              (EXIT
               (LETT #4#
                     (CONS
                      (PROGN
                       (LETT #2# NIL . #5#)
                       (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 107)) . #5#)
                            (LETT #1# (QVSIZE |v|) . #5#) G190
                            (COND ((> |j| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |v| |i| (QREFELT $ 37))
                                       (SPADCALL |v| |j| (QREFELT $ 37))
                                       (QREFELT $ 38))
                                      (QREFELT $ 116))
                                     #2#)
                                    . #5#)))
                            (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      #4#)
                     . #5#)))
             (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT (NREVERSE #4#))))
       (QREFELT $ 114)))))) 

(DEFUN |FINAALG-;leftRegularRepresentation;SVM;34| (|x| |b| $)
  (PROG (#1=#:G390 |i| #2=#:G389 |m|)
    (RETURN
     (SEQ
      (LETT |m| (- (SPADCALL |b| (QREFELT $ 107)) 1)
            . #3=(|FINAALG-;leftRegularRepresentation;SVM;34|))
      (EXIT
       (SPADCALL
        (SPADCALL
         (PROGN
          (LETT #2# NIL . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #1# (SPADCALL (QREFELT $ 9)) . #3#)
               G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT #2#
                       (CONS
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |x|
                                    (SPADCALL |b| (+ |i| |m|) (QREFELT $ 37))
                                    (QREFELT $ 38))
                          |b| (QREFELT $ 56))
                         (QREFELT $ 119))
                        #2#)
                       . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
               (EXIT (NREVERSE #2#))))
         (QREFELT $ 114))
        (QREFELT $ 120))))))) 

(DEFUN |FINAALG-;rightRegularRepresentation;SVM;35| (|x| |b| $)
  (PROG (#1=#:G395 |i| #2=#:G394 |m|)
    (RETURN
     (SEQ
      (LETT |m| (- (SPADCALL |b| (QREFELT $ 107)) 1)
            . #3=(|FINAALG-;rightRegularRepresentation;SVM;35|))
      (EXIT
       (SPADCALL
        (SPADCALL
         (PROGN
          (LETT #2# NIL . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #1# (SPADCALL (QREFELT $ 9)) . #3#)
               G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT #2#
                       (CONS
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |b| (+ |i| |m|) (QREFELT $ 37))
                                    |x| (QREFELT $ 38))
                          |b| (QREFELT $ 56))
                         (QREFELT $ 119))
                        #2#)
                       . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
               (EXIT (NREVERSE #2#))))
         (QREFELT $ 114))
        (QREFELT $ 120))))))) 

(DEFUN |FiniteRankNonAssociativeAlgebra&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteRankNonAssociativeAlgebra&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|FiniteRankNonAssociativeAlgebra&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 123) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|IntegralDomain|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| (|SparseUnivariatePolynomial| |#2|)
                       '(|CommutativeRing|))
        (PROGN
         (QSETREFV $ 26
                   (CONS
                    (|dispatchFunction|
                     |FINAALG-;leftCharacteristicPolynomial;SSup;1|)
                    $))
         (QSETREFV $ 28
                   (CONS
                    (|dispatchFunction|
                     |FINAALG-;rightCharacteristicPolynomial;SSup;2|)
                    $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 73
                   (CONS (|dispatchFunction| |FINAALG-;leftRecip;SU;11|) $))
         (QSETREFV $ 75
                   (CONS (|dispatchFunction| |FINAALG-;rightRecip;SU;12|) $))
         (QSETREFV $ 79 (CONS (|dispatchFunction| |FINAALG-;recip;SU;13|) $))
         (QSETREFV $ 82
                   (CONS
                    (|dispatchFunction|
                     |FINAALG-;leftMinimalPolynomial;SSup;14|)
                    $))
         (QSETREFV $ 83
                   (CONS
                    (|dispatchFunction|
                     |FINAALG-;rightMinimalPolynomial;SSup;15|)
                    $))
         (QSETREFV $ 86
                   (CONS
                    (|dispatchFunction| |FINAALG-;associatorDependence;L;16|)
                    $)))))
      $)))) 

(MAKEPROP '|FiniteRankNonAssociativeAlgebra&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|PositiveInteger|) (0 . |rank|) (|Vector| $) (4 . |someBasis|)
              (|Matrix| 7) (8 . |leftRegularRepresentation|)
              (|NonNegativeInteger|) (|Matrix| 19) (14 . |zero|) (|Integer|)
              (20 . |elt|) (|SparseUnivariatePolynomial| 7) (27 . |monomial|)
              (33 . |One|) (37 . |One|) (41 . -) (47 . |setelt|)
              (55 . |determinant|) (60 . |leftCharacteristicPolynomial|)
              (65 . |rightRegularRepresentation|)
              (71 . |rightCharacteristicPolynomial|) (76 . |Zero|) (80 . +)
              |FINAALG-;leftTrace;SR;3| |FINAALG-;rightTrace;SR;4|
              (86 . |determinant|) |FINAALG-;leftNorm;SR;5|
              |FINAALG-;rightNorm;SR;6| (|Vector| 6) (91 . |elt|) (97 . *)
              (103 . +) (|Boolean|) (109 . |zero?|) (|Void|) (|String|)
              (|OutputForm|) (114 . |messagePrint|)
              |FINAALG-;antiAssociative?;B;7| (119 . *) (|Union| $ '"failed")
              (125 . |recip|) (130 . |antiCommutator|)
              |FINAALG-;jordanAdmissible?;B;8| (136 . |commutator|)
              |FINAALG-;lieAdmissible?;B;9| (142 . |new|) (|Vector| 7)
              (149 . |coordinates|) (|Vector| 12) (155 . |elt|) (161 . |elt|)
              (167 . |setelt|) |FINAALG-;structuralConstants;VV;10|
              (175 . |leftUnit|) (179 . |coerce|) (184 . |rank|)
              (189 . |horizConcat|) (|List| 55) (195 . |nullSpace|) (200 . -)
              (205 . *) (211 . *) (|Mapping| 6 6 6) (217 . |reduce|)
              (223 . |leftRecip|) (228 . |rightUnit|) (232 . |rightRecip|)
              (237 . |leftRecip|) (242 . |rightRecip|) (247 . ~=)
              (253 . |recip|) (258 . |Zero|) (262 . +)
              (268 . |leftMinimalPolynomial|) (273 . |rightMinimalPolynomial|)
              (278 . ^) (284 . |associator|) (291 . |associatorDependence|)
              |FINAALG-;jacobiIdentity?;B;17| (295 . |antiCommutative?|)
              (299 . |jacobiIdentity?|) |FINAALG-;lieAlgebra?;B;18|
              (303 . |commutative?|) |FINAALG-;jordanAlgebra?;B;19|
              (307 . |flexible?|) (311 . |jordanAdmissible?|)
              |FINAALG-;noncommutativeJordanAlgebra?;B;20|
              |FINAALG-;antiCommutative?;B;21| |FINAALG-;commutative?;B;22|
              |FINAALG-;associative?;B;23| |FINAALG-;leftAlternative?;B;24|
              |FINAALG-;rightAlternative?;B;25| |FINAALG-;flexible?;B;26|
              |FINAALG-;alternative?;B;27| (315 . |leftTraceMatrix|)
              |FINAALG-;leftDiscriminant;VR;28| (320 . |rightTraceMatrix|)
              |FINAALG-;rightDiscriminant;VR;29| (325 . |minIndex|)
              (330 . |setRow!|) |FINAALG-;coordinates;2VM;30|
              (337 . |minIndex|) |FINAALG-;represents;VVS;31|
              (342 . |leftTrace|) (|List| 118) (347 . |matrix|)
              |FINAALG-;leftTraceMatrix;VM;32| (352 . |rightTrace|)
              |FINAALG-;rightTraceMatrix;VM;33| (|List| 7) (357 . |parts|)
              (362 . |transpose|) |FINAALG-;leftRegularRepresentation;SVM;34|
              |FINAALG-;rightRegularRepresentation;SVM;35|)
           '#(|structuralConstants| 367 |rightTraceMatrix| 372 |rightTrace| 377
              |rightRegularRepresentation| 382 |rightRecip| 388 |rightNorm| 393
              |rightMinimalPolynomial| 398 |rightDiscriminant| 403
              |rightCharacteristicPolynomial| 408 |rightAlternative?| 413
              |represents| 417 |recip| 423 |noncommutativeJordanAlgebra?| 428
              |lieAlgebra?| 432 |lieAdmissible?| 436 |leftTraceMatrix| 440
              |leftTrace| 445 |leftRegularRepresentation| 450 |leftRecip| 456
              |leftNorm| 461 |leftMinimalPolynomial| 466 |leftDiscriminant| 471
              |leftCharacteristicPolynomial| 476 |leftAlternative?| 481
              |jordanAlgebra?| 485 |jordanAdmissible?| 489 |jacobiIdentity?|
              493 |flexible?| 497 |coordinates| 501 |commutative?| 507
              |associatorDependence| 511 |associative?| 515 |antiCommutative?|
              519 |antiAssociative?| 523 |alternative?| 527)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 122
                                                 '(0 6 8 9 0 6 10 11 2 6 12 0
                                                   10 13 2 15 0 14 14 16 3 12 7
                                                   0 17 17 18 2 19 0 7 14 20 0
                                                   7 0 21 0 19 0 22 2 19 0 0 0
                                                   23 4 15 19 0 17 17 19 24 1
                                                   15 19 0 25 1 0 19 0 26 2 6
                                                   12 0 10 27 1 0 19 0 28 0 7 0
                                                   29 2 7 0 0 0 30 1 12 7 0 33
                                                   2 36 6 0 17 37 2 6 0 0 0 38
                                                   2 6 0 0 0 39 1 6 40 0 41 1
                                                   44 42 43 45 2 7 0 8 0 47 1 7
                                                   48 0 49 2 6 0 0 0 50 2 6 0 0
                                                   0 52 3 12 0 14 14 7 54 2 6
                                                   55 0 10 56 2 57 12 0 17 58 2
                                                   55 7 0 17 59 4 12 7 0 17 17
                                                   7 60 0 6 48 62 1 12 0 55 63
                                                   1 12 14 0 64 2 12 0 0 0 65 1
                                                   12 66 0 67 1 7 0 0 68 2 7 0
                                                   0 0 69 2 6 0 7 0 70 2 36 6
                                                   71 0 72 1 0 48 0 73 0 6 48
                                                   74 1 0 48 0 75 1 6 48 0 76 1
                                                   6 48 0 77 2 6 40 0 0 78 1 0
                                                   48 0 79 0 19 0 80 2 19 0 0 0
                                                   81 1 0 19 0 82 1 0 19 0 83 2
                                                   8 0 0 8 84 3 6 0 0 0 0 85 0
                                                   0 66 86 0 6 40 88 0 6 40 89
                                                   0 6 40 91 0 6 40 93 0 6 40
                                                   94 1 6 12 10 103 1 6 12 10
                                                   105 1 36 17 0 107 3 12 0 0
                                                   17 55 108 1 55 17 0 110 1 6
                                                   7 0 112 1 12 0 113 114 1 6 7
                                                   0 116 1 55 118 0 119 1 12 0
                                                   0 120 1 0 57 10 61 1 0 12 10
                                                   117 1 0 7 0 32 2 0 12 0 10
                                                   122 1 0 48 0 75 1 0 7 0 35 1
                                                   0 19 0 83 1 0 7 10 106 1 0
                                                   19 0 28 0 0 40 100 2 0 0 55
                                                   10 111 1 0 48 0 79 0 0 40 95
                                                   0 0 40 90 0 0 40 53 1 0 12
                                                   10 115 1 0 7 0 31 2 0 12 0
                                                   10 121 1 0 48 0 73 1 0 7 0
                                                   34 1 0 19 0 82 1 0 7 10 104
                                                   1 0 19 0 26 0 0 40 99 0 0 40
                                                   92 0 0 40 51 0 0 40 87 0 0
                                                   40 101 2 0 12 10 10 109 0 0
                                                   40 97 0 0 66 86 0 0 40 98 0
                                                   0 40 96 0 0 40 46 0 0 40
                                                   102)))))
           '|lookupComplete|)) 
