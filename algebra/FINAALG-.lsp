
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
                                 (QREFELT $ 22)))
                               ('T
                                (SPADCALL
                                 (SPADCALL |ma| |i| |j| (QREFELT $ 18)) 1
                                 (QREFELT $ 20))))
                              (QREFELT $ 23))))
                  (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |mb| (QREFELT $ 24))))))) 

(DEFUN |FINAALG-;rightCharacteristicPolynomial;SSup;2| (|a| $)
  (PROG (|j| |i| |mb| |ma| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (QREFELT $ 9))
            . #1=(|FINAALG-;rightCharacteristicPolynomial;SSup;2|))
      (LETT |ma| (SPADCALL |a| (SPADCALL (QREFELT $ 11)) (QREFELT $ 26)) . #1#)
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
                                 (QREFELT $ 22)))
                               ('T
                                (SPADCALL
                                 (SPADCALL |ma| |i| |j| (QREFELT $ 18)) 1
                                 (QREFELT $ 20))))
                              (QREFELT $ 23))))
                  (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |mb| (QREFELT $ 24))))))) 

(DEFUN |FINAALG-;leftTrace;SR;3| (|a| $)
  (PROG (|t| #1=#:G166 |i| |ma|)
    (RETURN
     (SEQ (LETT |t| (|spadConstant| $ 28) . #2=(|FINAALG-;leftTrace;SR;3|))
          (LETT |ma| (SPADCALL |a| (SPADCALL (QREFELT $ 11)) (QREFELT $ 13))
                . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (SPADCALL (QREFELT $ 9)) . #2#)
               G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |t|
                       (SPADCALL |t| (SPADCALL |ma| |i| |i| (QREFELT $ 18))
                                 (QREFELT $ 29))
                       . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |t|))))) 

(DEFUN |FINAALG-;rightTrace;SR;4| (|a| $)
  (PROG (|t| #1=#:G170 |i| |ma|)
    (RETURN
     (SEQ (LETT |t| (|spadConstant| $ 28) . #2=(|FINAALG-;rightTrace;SR;4|))
          (LETT |ma| (SPADCALL |a| (SPADCALL (QREFELT $ 11)) (QREFELT $ 26))
                . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (SPADCALL (QREFELT $ 9)) . #2#)
               G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |t|
                       (SPADCALL |t| (SPADCALL |ma| |i| |i| (QREFELT $ 18))
                                 (QREFELT $ 29))
                       . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |t|))))) 

(DEFUN |FINAALG-;leftNorm;SR;5| (|a| $)
  (SPADCALL (SPADCALL |a| (SPADCALL (QREFELT $ 11)) (QREFELT $ 13))
            (QREFELT $ 32))) 

(DEFUN |FINAALG-;rightNorm;SR;6| (|a| $)
  (SPADCALL (SPADCALL |a| (SPADCALL (QREFELT $ 11)) (QREFELT $ 26))
            (QREFELT $ 32))) 

(DEFUN |FINAALG-;antiAssociative?;B;7| ($)
  (PROG (#1=#:G175 #2=#:G179 |k| |j| |i| |n| |b|)
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
                                   (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                             (SPADCALL |b| |j| (QREFELT $ 36))
                                             (QREFELT $ 37))
                                   (SPADCALL |b| |k| (QREFELT $ 36))
                                   (QREFELT $ 37))
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
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
        (SPADCALL "algebra is anti-associative" (QREFELT $ 44)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;jordanAdmissible?;B;8| ($)
  (PROG (#1=#:G186 #2=#:G192 |l| |k| |j| |i| |n| |b|)
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
            (SPADCALL (SPADCALL 2 (|spadConstant| $ 21) (QREFELT $ 46))
                      (QREFELT $ 48))
            1)
           (SEQ
            (SPADCALL
             "this algebra is not Jordan admissible, as 2 is not invertible in the ground ring"
             (QREFELT $ 44))
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
                                                          (QREFELT $ 36))
                                                (SPADCALL |b| |j|
                                                          (QREFELT $ 36))
                                                (QREFELT $ 49))
                                               (SPADCALL
                                                (SPADCALL |b| |l|
                                                          (QREFELT $ 36))
                                                (SPADCALL |b| |k|
                                                          (QREFELT $ 36))
                                                (QREFELT $ 49))
                                               (QREFELT $ 49))
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |b| |l|
                                                          (QREFELT $ 36))
                                                (SPADCALL |b| |j|
                                                          (QREFELT $ 36))
                                                (QREFELT $ 49))
                                               (SPADCALL
                                                (SPADCALL |b| |k|
                                                          (QREFELT $ 36))
                                                (SPADCALL |b| |i|
                                                          (QREFELT $ 36))
                                                (QREFELT $ 49))
                                               (QREFELT $ 49))
                                              (QREFELT $ 38))
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |b| |k|
                                                         (QREFELT $ 36))
                                               (SPADCALL |b| |j|
                                                         (QREFELT $ 36))
                                               (QREFELT $ 49))
                                              (SPADCALL
                                               (SPADCALL |b| |i|
                                                         (QREFELT $ 36))
                                               (SPADCALL |b| |l|
                                                         (QREFELT $ 36))
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
            (SPADCALL "this algebra is Jordan admissible" (QREFELT $ 44))
            (EXIT 'T)))))))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;lieAdmissible?;B;9| ($)
  (PROG (#1=#:G195 #2=#:G199 |k| |j| |i| |b| |n|)
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
                                    (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                              (SPADCALL |b| |j| (QREFELT $ 36))
                                              (QREFELT $ 51))
                                    (SPADCALL |b| |k| (QREFELT $ 36))
                                    (QREFELT $ 51))
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |b| |j| (QREFELT $ 36))
                                              (SPADCALL |b| |k| (QREFELT $ 36))
                                              (QREFELT $ 51))
                                    (SPADCALL |b| |i| (QREFELT $ 36))
                                    (QREFELT $ 51))
                                   (QREFELT $ 38))
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |b| |k| (QREFELT $ 36))
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
        (SPADCALL "this algebra is Lie admissible" (QREFELT $ 44)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;structuralConstants;VV;10| (|b| $)
  (PROG (|k| |covec| |j| |i| |sC| #1=#:G208 #2=#:G209 |m| #3=#:G200)
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
                            (SPADCALL |m| |m| (|spadConstant| $ 28)
                                      (QREFELT $ 53)))))
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
                          (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                    (SPADCALL |b| |j| (QREFELT $ 36))
                                    (QREFELT $ 37))
                          |b| (QREFELT $ 55))
                         . #4#)
                   (EXIT
                    (SEQ (LETT |k| 1 . #4#) G190
                         (COND ((|greater_SI| |k| |m|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL (SPADCALL |sC| |k| (QREFELT $ 57)) |i| |j|
                                     (SPADCALL |covec| |k| (QREFELT $ 58))
                                     (QREFELT $ 59))))
                         (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT |sC|))))) 

(DEFUN |FINAALG-;leftRecip;SU;11| (|x| $)
  (PROG (#1=#:G226 #2=#:G228 |power| #3=#:G229 |i| #4=#:G227 |invCR| |invC|
         |vectorOfCoef| |cond| |listOfPowers| |xx| |k| |b| |lu|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 40)) (CONS 1 "failed"))
            (#5='T
             (SEQ
              (LETT |lu| (SPADCALL (QREFELT $ 61))
                    . #6=(|FINAALG-;leftRecip;SU;11|))
              (EXIT
               (COND ((QEQCAR |lu| 1) (CONS 1 "failed"))
                     (#5#
                      (SEQ (LETT |b| (SPADCALL (QREFELT $ 11)) . #6#)
                           (LETT |xx| (QCDR |lu|) . #6#) (LETT |k| 1 . #6#)
                           (LETT |cond|
                                 (SPADCALL (SPADCALL |xx| |b| (QREFELT $ 55))
                                           (QREFELT $ 62))
                                 . #6#)
                           (LETT |listOfPowers| (LIST |xx|) . #6#)
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (EQL (SPADCALL |cond| (QREFELT $ 63)) |k|))
                                  (GO G191)))
                                (SEQ (LETT |k| (+ |k| 1) . #6#)
                                     (LETT |xx|
                                           (SPADCALL |xx| |x| (QREFELT $ 37))
                                           . #6#)
                                     (LETT |listOfPowers|
                                           (CONS |xx| |listOfPowers|) . #6#)
                                     (EXIT
                                      (LETT |cond|
                                            (SPADCALL |cond|
                                                      (SPADCALL
                                                       (SPADCALL |xx| |b|
                                                                 (QREFELT $
                                                                          55))
                                                       (QREFELT $ 62))
                                                      (QREFELT $ 64))
                                            . #6#)))
                                NIL (GO G190) G191 (EXIT NIL))
                           (LETT |vectorOfCoef|
                                 (|SPADfirst| (SPADCALL |cond| (QREFELT $ 66)))
                                 . #6#)
                           (LETT |invC|
                                 (SPADCALL
                                  (SPADCALL |vectorOfCoef| 1 (QREFELT $ 58))
                                  (QREFELT $ 48))
                                 . #6#)
                           (EXIT
                            (COND ((QEQCAR |invC| 1) (CONS 1 "failed"))
                                  (#5#
                                   (SEQ
                                    (LETT |invCR|
                                          (SPADCALL (QCDR |invC|)
                                                    (QREFELT $ 67))
                                          . #6#)
                                    (EXIT
                                     (CONS 0
                                           (SPADCALL (ELT $ 38)
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
                                                                         $ 58))
                                                                       (QREFELT
                                                                        $ 68))
                                                                      |power|
                                                                      (QREFELT
                                                                       $
                                                                       69)))))
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
                                                              71))))))))))))))))))) 

(DEFUN |FINAALG-;rightRecip;SU;12| (|x| $)
  (PROG (#1=#:G246 #2=#:G248 |power| #3=#:G249 |i| #4=#:G247 |invCR| |invC|
         |vectorOfCoef| |cond| |listOfPowers| |xx| |k| |b| |ru|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 40)) (CONS 1 "failed"))
            (#5='T
             (SEQ
              (LETT |ru| (SPADCALL (QREFELT $ 73))
                    . #6=(|FINAALG-;rightRecip;SU;12|))
              (EXIT
               (COND ((QEQCAR |ru| 1) (CONS 1 "failed"))
                     (#5#
                      (SEQ (LETT |b| (SPADCALL (QREFELT $ 11)) . #6#)
                           (LETT |xx| (QCDR |ru|) . #6#) (LETT |k| 1 . #6#)
                           (LETT |cond|
                                 (SPADCALL (SPADCALL |xx| |b| (QREFELT $ 55))
                                           (QREFELT $ 62))
                                 . #6#)
                           (LETT |listOfPowers| (LIST |xx|) . #6#)
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (EQL (SPADCALL |cond| (QREFELT $ 63)) |k|))
                                  (GO G191)))
                                (SEQ (LETT |k| (+ |k| 1) . #6#)
                                     (LETT |xx|
                                           (SPADCALL |x| |xx| (QREFELT $ 37))
                                           . #6#)
                                     (LETT |listOfPowers|
                                           (CONS |xx| |listOfPowers|) . #6#)
                                     (EXIT
                                      (LETT |cond|
                                            (SPADCALL |cond|
                                                      (SPADCALL
                                                       (SPADCALL |xx| |b|
                                                                 (QREFELT $
                                                                          55))
                                                       (QREFELT $ 62))
                                                      (QREFELT $ 64))
                                            . #6#)))
                                NIL (GO G190) G191 (EXIT NIL))
                           (LETT |vectorOfCoef|
                                 (|SPADfirst| (SPADCALL |cond| (QREFELT $ 66)))
                                 . #6#)
                           (LETT |invC|
                                 (SPADCALL
                                  (SPADCALL |vectorOfCoef| 1 (QREFELT $ 58))
                                  (QREFELT $ 48))
                                 . #6#)
                           (EXIT
                            (COND ((QEQCAR |invC| 1) (CONS 1 "failed"))
                                  (#5#
                                   (SEQ
                                    (LETT |invCR|
                                          (SPADCALL (QCDR |invC|)
                                                    (QREFELT $ 67))
                                          . #6#)
                                    (EXIT
                                     (CONS 0
                                           (SPADCALL (ELT $ 38)
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
                                                                         $ 58))
                                                                       (QREFELT
                                                                        $ 68))
                                                                      |power|
                                                                      (QREFELT
                                                                       $
                                                                       69)))))
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
                                                              71))))))))))))))))))) 

(DEFUN |FINAALG-;recip;SU;13| (|x| $)
  (PROG (|rrx| |lrx|)
    (RETURN
     (SEQ
      (LETT |lrx| (SPADCALL |x| (QREFELT $ 75)) . #1=(|FINAALG-;recip;SU;13|))
      (EXIT
       (COND ((QEQCAR |lrx| 1) (CONS 1 "failed"))
             ('T
              (SEQ (LETT |rrx| (SPADCALL |x| (QREFELT $ 76)) . #1#)
                   (EXIT
                    (COND
                     ((OR (QEQCAR |rrx| 1)
                          (SPADCALL (QCDR |lrx|) (QCDR |rrx|) (QREFELT $ 77)))
                      (CONS 1 "failed"))
                     ('T (CONS 0 (QCDR |lrx|))))))))))))) 

(DEFUN |FINAALG-;leftMinimalPolynomial;SSup;14| (|x| $)
  (PROG (|res| |i| |vectorOfCoef| |cond| |xx| |k| |b|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (QREFELT $ 40))
        (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 20)))
       ('T
        (SEQ
         (LETT |b| (SPADCALL (QREFELT $ 11))
               . #1=(|FINAALG-;leftMinimalPolynomial;SSup;14|))
         (LETT |xx| |x| . #1#) (LETT |k| 1 . #1#)
         (LETT |cond|
               (SPADCALL (SPADCALL |xx| |b| (QREFELT $ 55)) (QREFELT $ 62))
               . #1#)
         (SEQ G190
              (COND
               ((NULL (EQL (SPADCALL |cond| (QREFELT $ 63)) |k|)) (GO G191)))
              (SEQ (LETT |k| (+ |k| 1) . #1#)
                   (LETT |xx| (SPADCALL |x| |xx| (QREFELT $ 37)) . #1#)
                   (EXIT
                    (LETT |cond|
                          (SPADCALL |cond|
                                    (SPADCALL
                                     (SPADCALL |xx| |b| (QREFELT $ 55))
                                     (QREFELT $ 62))
                                    (QREFELT $ 64))
                          . #1#)))
              NIL (GO G190) G191 (EXIT NIL))
         (LETT |vectorOfCoef| (|SPADfirst| (SPADCALL |cond| (QREFELT $ 66)))
               . #1#)
         (LETT |res| (|spadConstant| $ 79) . #1#)
         (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |k|) (GO G191)))
              (SEQ
               (EXIT
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL |vectorOfCoef| |i| (QREFELT $ 58))
                                 |i| (QREFELT $ 20))
                                (QREFELT $ 80))
                      . #1#)))
              (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
         (EXIT |res|)))))))) 

(DEFUN |FINAALG-;rightMinimalPolynomial;SSup;15| (|x| $)
  (PROG (|res| |i| |vectorOfCoef| |cond| |xx| |k| |b|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (QREFELT $ 40))
        (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 20)))
       ('T
        (SEQ
         (LETT |b| (SPADCALL (QREFELT $ 11))
               . #1=(|FINAALG-;rightMinimalPolynomial;SSup;15|))
         (LETT |xx| |x| . #1#) (LETT |k| 1 . #1#)
         (LETT |cond|
               (SPADCALL (SPADCALL |xx| |b| (QREFELT $ 55)) (QREFELT $ 62))
               . #1#)
         (SEQ G190
              (COND
               ((NULL (EQL (SPADCALL |cond| (QREFELT $ 63)) |k|)) (GO G191)))
              (SEQ (LETT |k| (+ |k| 1) . #1#)
                   (LETT |xx| (SPADCALL |xx| |x| (QREFELT $ 37)) . #1#)
                   (EXIT
                    (LETT |cond|
                          (SPADCALL |cond|
                                    (SPADCALL
                                     (SPADCALL |xx| |b| (QREFELT $ 55))
                                     (QREFELT $ 62))
                                    (QREFELT $ 64))
                          . #1#)))
              NIL (GO G190) G191 (EXIT NIL))
         (LETT |vectorOfCoef| (|SPADfirst| (SPADCALL |cond| (QREFELT $ 66)))
               . #1#)
         (LETT |res| (|spadConstant| $ 79) . #1#)
         (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |k|) (GO G191)))
              (SEQ
               (EXIT
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL |vectorOfCoef| |i| (QREFELT $ 58))
                                 |i| (QREFELT $ 20))
                                (QREFELT $ 80))
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
            (SPADCALL (SPADCALL |n| 4 (QREFELT $ 83)) 6 (|spadConstant| $ 28)
                      (QREFELT $ 53))
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
                                 (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                           (SPADCALL |b| |j| (QREFELT $ 36))
                                           (SPADCALL |b| |k| (QREFELT $ 36))
                                           (QREFELT $ 84))
                                 |b| (QREFELT $ 55))
                                . #1#)
                          (LETT |a231|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |b| |j| (QREFELT $ 36))
                                           (SPADCALL |b| |k| (QREFELT $ 36))
                                           (SPADCALL |b| |i| (QREFELT $ 36))
                                           (QREFELT $ 84))
                                 |b| (QREFELT $ 55))
                                . #1#)
                          (LETT |a312|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |b| |k| (QREFELT $ 36))
                                           (SPADCALL |b| |i| (QREFELT $ 36))
                                           (SPADCALL |b| |j| (QREFELT $ 36))
                                           (QREFELT $ 84))
                                 |b| (QREFELT $ 55))
                                . #1#)
                          (LETT |a132|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                           (SPADCALL |b| |k| (QREFELT $ 36))
                                           (SPADCALL |b| |j| (QREFELT $ 36))
                                           (QREFELT $ 84))
                                 |b| (QREFELT $ 55))
                                . #1#)
                          (LETT |a321|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |b| |k| (QREFELT $ 36))
                                           (SPADCALL |b| |j| (QREFELT $ 36))
                                           (SPADCALL |b| |i| (QREFELT $ 36))
                                           (QREFELT $ 84))
                                 |b| (QREFELT $ 55))
                                . #1#)
                          (LETT |a213|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |b| |j| (QREFELT $ 36))
                                           (SPADCALL |b| |i| (QREFELT $ 36))
                                           (SPADCALL |b| |k| (QREFELT $ 36))
                                           (QREFELT $ 84))
                                 |b| (QREFELT $ 55))
                                . #1#)
                          (EXIT
                           (SEQ (LETT |r| 1 . #1#) G190
                                (COND ((|greater_SI| |r| |n|) (GO G191)))
                                (SEQ (LETT |z| (+ |z| 1) . #1#)
                                     (SPADCALL |cond| |z| 1
                                               (SPADCALL |a123| |r|
                                                         (QREFELT $ 58))
                                               (QREFELT $ 59))
                                     (SPADCALL |cond| |z| 2
                                               (SPADCALL |a231| |r|
                                                         (QREFELT $ 58))
                                               (QREFELT $ 59))
                                     (SPADCALL |cond| |z| 3
                                               (SPADCALL |a312| |r|
                                                         (QREFELT $ 58))
                                               (QREFELT $ 59))
                                     (SPADCALL |cond| |z| 4
                                               (SPADCALL |a132| |r|
                                                         (QREFELT $ 58))
                                               (QREFELT $ 59))
                                     (SPADCALL |cond| |z| 5
                                               (SPADCALL |a321| |r|
                                                         (QREFELT $ 58))
                                               (QREFELT $ 59))
                                     (EXIT
                                      (SPADCALL |cond| |z| 6
                                                (SPADCALL |a213| |r|
                                                          (QREFELT $ 58))
                                                (QREFELT $ 59))))
                                (LETT |r| (|inc_SI| |r|) . #1#) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |cond| (QREFELT $ 66))))))) 

(DEFUN |FINAALG-;jacobiIdentity?;B;17| ($)
  (PROG (#1=#:G279 #2=#:G283 |k| |j| |i| |b| |n|)
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
                                    (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                              (SPADCALL |b| |j| (QREFELT $ 36))
                                              (QREFELT $ 37))
                                    (SPADCALL |b| |k| (QREFELT $ 36))
                                    (QREFELT $ 37))
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |b| |j| (QREFELT $ 36))
                                              (SPADCALL |b| |k| (QREFELT $ 36))
                                              (QREFELT $ 37))
                                    (SPADCALL |b| |i| (QREFELT $ 36))
                                    (QREFELT $ 37))
                                   (QREFELT $ 38))
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |b| |k| (QREFELT $ 36))
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
        (SPADCALL "Jacobi identity holds" (QREFELT $ 44)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;lieAlgebra?;B;18| ($)
  (SEQ
   (COND
    ((SPADCALL (QREFELT $ 87))
     (COND
      ((SPADCALL (QREFELT $ 88))
       (SEQ (SPADCALL "this is a Lie algebra" (QREFELT $ 44)) (EXIT 'T)))
      (#1='T
       (SEQ (SPADCALL "this is not a Lie algebra" (QREFELT $ 44))
            (EXIT 'NIL)))))
    (#1#
     (SEQ (SPADCALL "this is not a Lie algebra" (QREFELT $ 44)) (EXIT 'NIL)))))) 

(DEFUN |FINAALG-;jordanAlgebra?;B;19| ($)
  (PROG (#1=#:G294 #2=#:G301 |l| |k| |j| |i| |n| |b|)
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
            (SPADCALL (SPADCALL 2 (|spadConstant| $ 21) (QREFELT $ 46))
                      (QREFELT $ 48))
            1)
           (SEQ
            (SPADCALL
             "this is not a Jordan algebra, as 2 is not invertible in the ground ring"
             (QREFELT $ 44))
            (EXIT 'NIL)))
          ((SPADCALL (QREFELT $ 90))
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
                                                         (QREFELT $ 36))
                                               (SPADCALL |b| |j|
                                                         (QREFELT $ 36))
                                               (SPADCALL
                                                (SPADCALL |b| |l|
                                                          (QREFELT $ 36))
                                                (SPADCALL |b| |k|
                                                          (QREFELT $ 36))
                                                (QREFELT $ 37))
                                               (QREFELT $ 84))
                                              (SPADCALL
                                               (SPADCALL |b| |l|
                                                         (QREFELT $ 36))
                                               (SPADCALL |b| |j|
                                                         (QREFELT $ 36))
                                               (SPADCALL
                                                (SPADCALL |b| |k|
                                                          (QREFELT $ 36))
                                                (SPADCALL |b| |i|
                                                          (QREFELT $ 36))
                                                (QREFELT $ 37))
                                               (QREFELT $ 84))
                                              (QREFELT $ 38))
                                             (SPADCALL
                                              (SPADCALL |b| |k| (QREFELT $ 36))
                                              (SPADCALL |b| |j| (QREFELT $ 36))
                                              (SPADCALL
                                               (SPADCALL |b| |i|
                                                         (QREFELT $ 36))
                                               (SPADCALL |b| |l|
                                                         (QREFELT $ 36))
                                               (QREFELT $ 37))
                                              (QREFELT $ 84))
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
            (SPADCALL "this is a Jordan algebra" (QREFELT $ 44)) (EXIT 'T)))
          ('T
           (SEQ (SPADCALL "this is not a Jordan algebra" (QREFELT $ 44))
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
          (SPADCALL (SPADCALL 2 (|spadConstant| $ 21) (QREFELT $ 46))
                    (QREFELT $ 48))
          1)
         (SEQ
          (SPADCALL
           "this is not a noncommutative Jordan algebra, as 2 is not invertible in the ground ring"
           (QREFELT $ 44))
          (EXIT 'NIL)))
        ((SPADCALL (QREFELT $ 92))
         (COND
          ((SPADCALL (QREFELT $ 93))
           (SEQ
            (SPADCALL "this is a noncommutative Jordan algebra" (QREFELT $ 44))
            (EXIT 'T)))
          (#2='T
           (SEQ
            (SPADCALL
             "this is not a noncommutative Jordan algebra, as it is not Jordan admissible"
             (QREFELT $ 44))
            (EXIT 'NIL)))))
        (#2#
         (SEQ
          (SPADCALL
           "this is not a noncommutative Jordan algebra, as it is not flexible"
           (QREFELT $ 44))
          (EXIT 'NIL))))))))) 

(DEFUN |FINAALG-;antiCommutative?;B;21| ($)
  (PROG (#1=#:G313 #2=#:G316 |j| |i| |n| |b|)
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
                            (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                      (SPADCALL |b| |i| (QREFELT $ 36))
                                      (QREFELT $ 37)))
                           ('T
                            (SPADCALL
                             (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                       (SPADCALL |b| |j| (QREFELT $ 36))
                                       (QREFELT $ 37))
                             (SPADCALL (SPADCALL |b| |j| (QREFELT $ 36))
                                       (SPADCALL |b| |i| (QREFELT $ 36))
                                       (QREFELT $ 37))
                             (QREFELT $ 38))))
                          (QREFELT $ 40)))
                        (PROGN
                         (LETT #1#
                               (SEQ
                                (SPADCALL "algebra is not anti-commutative"
                                          (QREFELT $ 44))
                                (EXIT (PROGN (LETT #2# 'NIL . #3#) (GO #2#))))
                               . #3#)
                         (GO #1#))))))
                    (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL)))
              #1# (EXIT #1#))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "algebra is anti-commutative" (QREFELT $ 44)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;commutative?;B;22| ($)
  (PROG (#1=#:G319 #2=#:G322 |j| |i| |n| |b|)
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
                          (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                    (SPADCALL |b| |j| (QREFELT $ 36))
                                    (QREFELT $ 51))
                          (QREFELT $ 40)))
                        (PROGN
                         (LETT #1#
                               (SEQ
                                (SPADCALL "algebra is not commutative"
                                          (QREFELT $ 44))
                                (EXIT (PROGN (LETT #2# 'NIL . #3#) (GO #2#))))
                               . #3#)
                         (GO #1#))))))
                    (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL)))
              #1# (EXIT #1#))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (SPADCALL "algebra is commutative" (QREFELT $ 44)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;associative?;B;23| ($)
  (PROG (#1=#:G325 #2=#:G329 |k| |j| |i| |n| |b|)
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
                                 (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                           (SPADCALL |b| |j| (QREFELT $ 36))
                                           (SPADCALL |b| |k| (QREFELT $ 36))
                                           (QREFELT $ 84))
                                 (QREFELT $ 40)))
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (SPADCALL "algebra is not associative"
                                                 (QREFELT $ 44))
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
        (SPADCALL "algebra is associative" (QREFELT $ 44)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;leftAlternative?;B;24| ($)
  (PROG (#1=#:G332 #2=#:G336 |k| |j| |i| |n| |b|)
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
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                            (SPADCALL |b| |j| (QREFELT $ 36))
                                            (SPADCALL |b| |k| (QREFELT $ 36))
                                            (QREFELT $ 84))
                                  (SPADCALL (SPADCALL |b| |j| (QREFELT $ 36))
                                            (SPADCALL |b| |i| (QREFELT $ 36))
                                            (SPADCALL |b| |k| (QREFELT $ 36))
                                            (QREFELT $ 84))
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
        (SPADCALL "algebra satisfies 2*associator(a,a,b) = 0" (QREFELT $ 44))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;rightAlternative?;B;25| ($)
  (PROG (#1=#:G339 #2=#:G343 |k| |j| |i| |n| |b|)
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
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                            (SPADCALL |b| |j| (QREFELT $ 36))
                                            (SPADCALL |b| |k| (QREFELT $ 36))
                                            (QREFELT $ 84))
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                            (SPADCALL |b| |k| (QREFELT $ 36))
                                            (SPADCALL |b| |j| (QREFELT $ 36))
                                            (QREFELT $ 84))
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
        (SPADCALL "algebra satisfies 2*associator(a,b,b) = 0" (QREFELT $ 44))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;flexible?;B;26| ($)
  (PROG (#1=#:G346 #2=#:G350 |k| |j| |i| |n| |b|)
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
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                            (SPADCALL |b| |j| (QREFELT $ 36))
                                            (SPADCALL |b| |k| (QREFELT $ 36))
                                            (QREFELT $ 84))
                                  (SPADCALL (SPADCALL |b| |k| (QREFELT $ 36))
                                            (SPADCALL |b| |j| (QREFELT $ 36))
                                            (SPADCALL |b| |i| (QREFELT $ 36))
                                            (QREFELT $ 84))
                                  (QREFELT $ 38))
                                 (QREFELT $ 40)))
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (SPADCALL "algebra is not flexible"
                                                 (QREFELT $ 44))
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
        (SPADCALL "algebra satisfies 2*associator(a,b,a) = 0" (QREFELT $ 44))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;alternative?;B;27| ($)
  (PROG (#1=#:G354 #2=#:G359 |k| |j| |i| |n| |b|)
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
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                            (SPADCALL |b| |j| (QREFELT $ 36))
                                            (SPADCALL |b| |k| (QREFELT $ 36))
                                            (QREFELT $ 84))
                                  (SPADCALL (SPADCALL |b| |j| (QREFELT $ 36))
                                            (SPADCALL |b| |i| (QREFELT $ 36))
                                            (SPADCALL |b| |k| (QREFELT $ 36))
                                            (QREFELT $ 84))
                                  (QREFELT $ 38))
                                 (QREFELT $ 40)))
                               (SEQ
                                (SPADCALL "algebra is not alternative"
                                          (QREFELT $ 44))
                                (EXIT (PROGN (LETT #2# 'NIL . #3#) (GO #2#)))))
                              ((NULL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                            (SPADCALL |b| |j| (QREFELT $ 36))
                                            (SPADCALL |b| |k| (QREFELT $ 36))
                                            (QREFELT $ 84))
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT $ 36))
                                            (SPADCALL |b| |k| (QREFELT $ 36))
                                            (SPADCALL |b| |j| (QREFELT $ 36))
                                            (QREFELT $ 84))
                                  (QREFELT $ 38))
                                 (QREFELT $ 40)))
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (SPADCALL "algebra is not alternative"
                                                 (QREFELT $ 44))
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
         (QREFELT $ 44))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |FINAALG-;leftDiscriminant;VR;28| (|v| $)
  (SPADCALL (SPADCALL |v| (QREFELT $ 102)) (QREFELT $ 32))) 

(DEFUN |FINAALG-;rightDiscriminant;VR;29| (|v| $)
  (SPADCALL (SPADCALL |v| (QREFELT $ 104)) (QREFELT $ 32))) 

(DEFUN |FINAALG-;coordinates;2VM;30| (|v| |b| $)
  (PROG (#1=#:G365 |i| |j| |m|)
    (RETURN
     (SEQ
      (LETT |m|
            (SPADCALL (QVSIZE |v|) (QVSIZE |b|) (|spadConstant| $ 28)
                      (QREFELT $ 53))
            . #2=(|FINAALG-;coordinates;2VM;30|))
      (SEQ (LETT |j| 1 . #2#) (LETT |i| (SPADCALL |v| (QREFELT $ 106)) . #2#)
           (LETT #1# (QVSIZE |v|) . #2#) G190 (COND ((> |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |m| |j|
                       (SPADCALL (QAREF1O |v| |i| 1) |b| (QREFELT $ 55))
                       (QREFELT $ 107))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (|inc_SI| |j|) . #2#)) . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |m|))))) 

(DEFUN |FINAALG-;represents;VVS;31| (|v| |b| $)
  (PROG (#1=#:G371 #2=#:G373 |i| #3=#:G372 |m|)
    (RETURN
     (SEQ
      (LETT |m| (- (SPADCALL |v| (QREFELT $ 109)) 1)
            . #4=(|FINAALG-;represents;VVS;31|))
      (EXIT
       (SPADCALL (ELT $ 38)
                 (PROGN
                  (LETT #3# (GETREFV #5=(QVSIZE |b|)) . #4#)
                  (SEQ (LETT |i| 1 . #4#) (LETT #2# #5# . #4#)
                       (LETT #1# 0 . #4#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SETELT #3# #1#
                                 (SPADCALL
                                  (SPADCALL |v| (+ |i| |m|) (QREFELT $ 58))
                                  (SPADCALL |b| (+ |i| |m|) (QREFELT $ 36))
                                  (QREFELT $ 69)))))
                       (LETT #1#
                             (PROG1 (|inc_SI| #1#)
                               (LETT |i| (|inc_SI| |i|) . #4#))
                             . #4#)
                       (GO G190) G191 (EXIT NIL))
                  #3#)
                 (QREFELT $ 71))))))) 

(DEFUN |FINAALG-;leftTraceMatrix;VM;32| (|v| $)
  (PROG (#1=#:G380 |j| #2=#:G379 #3=#:G378 |i| #4=#:G377)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #4# NIL . #5=(|FINAALG-;leftTraceMatrix;VM;32|))
        (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 106)) . #5#)
             (LETT #3# (QVSIZE |v|) . #5#) G190 (COND ((> |i| #3#) (GO G191)))
             (SEQ
              (EXIT
               (LETT #4#
                     (CONS
                      (PROGN
                       (LETT #2# NIL . #5#)
                       (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 106)) . #5#)
                            (LETT #1# (QVSIZE |v|) . #5#) G190
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
                                      (QREFELT $ 111))
                                     #2#)
                                    . #5#)))
                            (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      #4#)
                     . #5#)))
             (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT (NREVERSE #4#))))
       (QREFELT $ 113)))))) 

(DEFUN |FINAALG-;rightTraceMatrix;VM;33| (|v| $)
  (PROG (#1=#:G387 |j| #2=#:G386 #3=#:G385 |i| #4=#:G384)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #4# NIL . #5=(|FINAALG-;rightTraceMatrix;VM;33|))
        (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 106)) . #5#)
             (LETT #3# (QVSIZE |v|) . #5#) G190 (COND ((> |i| #3#) (GO G191)))
             (SEQ
              (EXIT
               (LETT #4#
                     (CONS
                      (PROGN
                       (LETT #2# NIL . #5#)
                       (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 106)) . #5#)
                            (LETT #1# (QVSIZE |v|) . #5#) G190
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
                                      (QREFELT $ 115))
                                     #2#)
                                    . #5#)))
                            (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      #4#)
                     . #5#)))
             (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT (NREVERSE #4#))))
       (QREFELT $ 113)))))) 

(DEFUN |FINAALG-;leftRegularRepresentation;SVM;34| (|x| |b| $)
  (PROG (#1=#:G392 |i| #2=#:G391 |m|)
    (RETURN
     (SEQ
      (LETT |m| (- (SPADCALL |b| (QREFELT $ 106)) 1)
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
                                    (SPADCALL |b| (+ |i| |m|) (QREFELT $ 36))
                                    (QREFELT $ 37))
                          |b| (QREFELT $ 55))
                         (QREFELT $ 118))
                        #2#)
                       . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
               (EXIT (NREVERSE #2#))))
         (QREFELT $ 113))
        (QREFELT $ 119))))))) 

(DEFUN |FINAALG-;rightRegularRepresentation;SVM;35| (|x| |b| $)
  (PROG (#1=#:G397 |i| #2=#:G396 |m|)
    (RETURN
     (SEQ
      (LETT |m| (- (SPADCALL |b| (QREFELT $ 106)) 1)
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
                          (SPADCALL (SPADCALL |b| (+ |i| |m|) (QREFELT $ 36))
                                    |x| (QREFELT $ 37))
                          |b| (QREFELT $ 55))
                         (QREFELT $ 118))
                        #2#)
                       . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
               (EXIT (NREVERSE #2#))))
         (QREFELT $ 113))
        (QREFELT $ 119))))))) 

(DECLAIM (NOTINLINE |FiniteRankNonAssociativeAlgebra&;|)) 

(DEFUN |FiniteRankNonAssociativeAlgebra&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteRankNonAssociativeAlgebra&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|FiniteRankNonAssociativeAlgebra&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 122) . #1#)
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
         (QSETREFV $ 72
                   (CONS (|dispatchFunction| |FINAALG-;leftRecip;SU;11|) $))
         (QSETREFV $ 74
                   (CONS (|dispatchFunction| |FINAALG-;rightRecip;SU;12|) $))
         (QSETREFV $ 78 (CONS (|dispatchFunction| |FINAALG-;recip;SU;13|) $))
         (QSETREFV $ 81
                   (CONS
                    (|dispatchFunction|
                     |FINAALG-;leftMinimalPolynomial;SSup;14|)
                    $))
         (QSETREFV $ 82
                   (CONS
                    (|dispatchFunction|
                     |FINAALG-;rightMinimalPolynomial;SSup;15|)
                    $))
         (QSETREFV $ 85
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
              (33 . |One|) (37 . -) (43 . |setelt|) (51 . |determinant|)
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
              |FINAALG-;lieAdmissible?;B;9| (138 . |new|) (|Vector| 7)
              (145 . |coordinates|) (|Vector| 12) (151 . |elt|) (157 . |elt|)
              (163 . |setelt|) |FINAALG-;structuralConstants;VV;10|
              (171 . |leftUnit|) (175 . |coerce|) (180 . |rank|)
              (185 . |horizConcat|) (|List| 54) (191 . |nullSpace|) (196 . -)
              (201 . *) (207 . *) (|Mapping| 6 6 6) (213 . |reduce|)
              (219 . |leftRecip|) (224 . |rightUnit|) (228 . |rightRecip|)
              (233 . |leftRecip|) (238 . |rightRecip|) (243 . ~=)
              (249 . |recip|) (254 . |Zero|) (258 . +)
              (264 . |leftMinimalPolynomial|) (269 . |rightMinimalPolynomial|)
              (274 . ^) (280 . |associator|) (287 . |associatorDependence|)
              |FINAALG-;jacobiIdentity?;B;17| (291 . |antiCommutative?|)
              (295 . |jacobiIdentity?|) |FINAALG-;lieAlgebra?;B;18|
              (299 . |commutative?|) |FINAALG-;jordanAlgebra?;B;19|
              (303 . |flexible?|) (307 . |jordanAdmissible?|)
              |FINAALG-;noncommutativeJordanAlgebra?;B;20|
              |FINAALG-;antiCommutative?;B;21| |FINAALG-;commutative?;B;22|
              |FINAALG-;associative?;B;23| |FINAALG-;leftAlternative?;B;24|
              |FINAALG-;rightAlternative?;B;25| |FINAALG-;flexible?;B;26|
              |FINAALG-;alternative?;B;27| (311 . |leftTraceMatrix|)
              |FINAALG-;leftDiscriminant;VR;28| (316 . |rightTraceMatrix|)
              |FINAALG-;rightDiscriminant;VR;29| (321 . |minIndex|)
              (326 . |setRow!|) |FINAALG-;coordinates;2VM;30|
              (333 . |minIndex|) |FINAALG-;represents;VVS;31|
              (338 . |leftTrace|) (|List| 117) (343 . |matrix|)
              |FINAALG-;leftTraceMatrix;VM;32| (348 . |rightTrace|)
              |FINAALG-;rightTraceMatrix;VM;33| (|List| 7) (353 . |parts|)
              (358 . |transpose|) |FINAALG-;leftRegularRepresentation;SVM;34|
              |FINAALG-;rightRegularRepresentation;SVM;35|)
           '#(|structuralConstants| 363 |rightTraceMatrix| 368 |rightTrace| 373
              |rightRegularRepresentation| 378 |rightRecip| 384 |rightNorm| 389
              |rightMinimalPolynomial| 394 |rightDiscriminant| 399
              |rightCharacteristicPolynomial| 404 |rightAlternative?| 409
              |represents| 413 |recip| 419 |noncommutativeJordanAlgebra?| 424
              |lieAlgebra?| 428 |lieAdmissible?| 432 |leftTraceMatrix| 436
              |leftTrace| 441 |leftRegularRepresentation| 446 |leftRecip| 452
              |leftNorm| 457 |leftMinimalPolynomial| 462 |leftDiscriminant| 467
              |leftCharacteristicPolynomial| 472 |leftAlternative?| 477
              |jordanAlgebra?| 481 |jordanAdmissible?| 485 |jacobiIdentity?|
              489 |flexible?| 493 |coordinates| 497 |commutative?| 503
              |associatorDependence| 507 |associative?| 511 |antiCommutative?|
              515 |antiAssociative?| 519 |alternative?| 523)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 121
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
                                                   0 0 49 2 6 0 0 0 51 3 12 0
                                                   14 14 7 53 2 6 54 0 10 55 2
                                                   56 12 0 17 57 2 54 7 0 17 58
                                                   4 12 7 0 17 17 7 59 0 6 47
                                                   61 1 12 0 54 62 1 12 14 0 63
                                                   2 12 0 0 0 64 1 12 65 0 66 1
                                                   7 0 0 67 2 7 0 0 0 68 2 6 0
                                                   7 0 69 2 35 6 70 0 71 1 0 47
                                                   0 72 0 6 47 73 1 0 47 0 74 1
                                                   6 47 0 75 1 6 47 0 76 2 6 39
                                                   0 0 77 1 0 47 0 78 0 19 0 79
                                                   2 19 0 0 0 80 1 0 19 0 81 1
                                                   0 19 0 82 2 8 0 0 8 83 3 6 0
                                                   0 0 0 84 0 0 65 85 0 6 39 87
                                                   0 6 39 88 0 6 39 90 0 6 39
                                                   92 0 6 39 93 1 6 12 10 102 1
                                                   6 12 10 104 1 35 17 0 106 3
                                                   12 0 0 17 54 107 1 54 17 0
                                                   109 1 6 7 0 111 1 12 0 112
                                                   113 1 6 7 0 115 1 54 117 0
                                                   118 1 12 0 0 119 1 0 56 10
                                                   60 1 0 12 10 116 1 0 7 0 31
                                                   2 0 12 0 10 121 1 0 47 0 74
                                                   1 0 7 0 34 1 0 19 0 82 1 0 7
                                                   10 105 1 0 19 0 27 0 0 39 99
                                                   2 0 0 54 10 110 1 0 47 0 78
                                                   0 0 39 94 0 0 39 89 0 0 39
                                                   52 1 0 12 10 114 1 0 7 0 30
                                                   2 0 12 0 10 120 1 0 47 0 72
                                                   1 0 7 0 33 1 0 19 0 81 1 0 7
                                                   10 103 1 0 19 0 25 0 0 39 98
                                                   0 0 39 91 0 0 39 50 0 0 39
                                                   86 0 0 39 100 2 0 12 10 10
                                                   108 0 0 39 96 0 0 65 85 0 0
                                                   39 97 0 0 39 95 0 0 39 45 0
                                                   0 39 101)))))
           '|lookupComplete|)) 
