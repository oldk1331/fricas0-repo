
(DEFUN |FFF;createLowComplexityNormalBasis;PiU;1| (|n| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL |n| (QREFELT $ 10))
            |FFF;createLowComplexityNormalBasis;PiU;1|)
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 0 (SPADCALL |n| (QREFELT $ 13))))
             ('T (CONS 1 (QCDR |u|))))))))) 

(DEFUN |FFF;createLowComplexityTable;PiU;2| (|n| $)
  (PROG (|l| |term| |j| |v| |i| |multtable| |m| |lvjh| |help| |lvj| |x| |vec|
         |vt| |jt| |t| |pkn| |p1| |multmat| #1=#:G132 |t1| |k| |a| #2=#:G166
         |p| |q|)
    (RETURN
     (SEQ
      (LETT |q| (SPADCALL (QREFELT $ 17))
            . #3=(|FFF;createLowComplexityTable;PiU;2|))
      (LETT |p| (SPADCALL (QREFELT $ 18)) . #3#) (LETT |k| 0 . #3#)
      (SEQ (LETT |i| 1 . #3#) (LETT #2# (- |n| 1) . #3#) G190
           (COND ((OR (|greater_SI| |i| #2#) (NULL (EQL |k| 0))) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL (+ (* |i| |n|) 1) (QREFELT $ 23))
               (COND
                ((NULL (EQL |p| (+ (* |i| |n|) 1)))
                 (COND
                  ((SPADCALL
                    (SPADCALL |q|
                              (|compiledLookupCheck| '|coerce|
                                                     (LIST '$
                                                           (LIST '|Integer|))
                                                     (|PrimeField|
                                                      (+ (* |i| |n|)
                                                         (|One|)))))
                    (|compiledLookupCheck| '|primitive?|
                                           (LIST (LIST '|Boolean|) '$)
                                           (|PrimeField|
                                            (+ (* |i| |n|) (|One|)))))
                   (SEQ (LETT |a| 1 . #3#) (LETT |k| |i| . #3#)
                        (EXIT
                         (LETT |t1|
                               (SPADCALL
                                (SPADCALL |q|
                                          (|compiledLookupCheck| '|coerce|
                                                                 (LIST '$
                                                                       (LIST
                                                                        '|Integer|))
                                                                 (|PrimeField|
                                                                  (+
                                                                   (* |k| |n|)
                                                                   (|One|)))))
                                |n|
                                (|compiledLookupCheck| '^
                                                       (LIST '$ '$
                                                             (LIST '|Integer|))
                                                       (|PrimeField|
                                                        (+ (* |k| |n|)
                                                           (|One|)))))
                               . #3#))))
                  ('T
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL
                        (GCD |n|
                             (LETT |a|
                                   (SPADCALL
                                    (SPADCALL |q|
                                              (|compiledLookupCheck| '|coerce|
                                                                     (LIST '$
                                                                           (LIST
                                                                            '|Integer|))
                                                                     (|PrimeField|
                                                                      (+
                                                                       (* |n|
                                                                          |i|)
                                                                       (|One|)))))
                                    (|compiledLookupCheck| '|discreteLog|
                                                           (LIST
                                                            (LIST
                                                             '|NonNegativeInteger|)
                                                            '$)
                                                           (|PrimeField|
                                                            (+ (* |n| |i|)
                                                               (|One|)))))
                                   . #3#))
                        1)
                       (PROGN
                        (LETT #1#
                              (SEQ (LETT |k| |i| . #3#)
                                   (EXIT
                                    (LETT |t1|
                                          (SPADCALL
                                           (SPADCALL
                                            (|compiledLookupCheck|
                                             '|primitiveElement| (LIST '$)
                                             (|PrimeField|
                                              (+ (* |k| |n|) (|One|)))))
                                           |n|
                                           (|compiledLookupCheck| '^
                                                                  (LIST '$ '$
                                                                        (LIST
                                                                         '|Integer|))
                                                                  (|PrimeField|
                                                                   (+
                                                                    (* |k| |n|)
                                                                    (|One|)))))
                                          . #3#)))
                              . #3#)
                        (GO #1#)))))
                    #1# (EXIT #1#))))))))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND ((EQL |k| 0) (CONS 1 "failed"))
             (#4='T
              (SEQ
               (LETT |multmat|
                     (SPADCALL |n| |n|
                               (|compiledLookupCheck| '|zero|
                                                      (LIST '$
                                                            (LIST
                                                             '|NonNegativeInteger|)
                                                            (LIST
                                                             '|NonNegativeInteger|))
                                                      (|Matrix|
                                                       (|PrimeField| |p|))))
                     . #3#)
               (LETT |p1| (+ (* |k| |n|) 1) . #3#)
               (LETT |pkn|
                     (SPADCALL |q|
                               (|compiledLookupCheck| '|coerce|
                                                      (LIST '$
                                                            (LIST '|Integer|))
                                                      (|PrimeField| |p1|)))
                     . #3#)
               (LETT |t| |t1| . #3#)
               (COND
                ((ODDP |k|)
                 (SEQ (LETT |jt| (+ (QUOTIENT2 |n| 2) 1) . #3#)
                      (EXIT
                       (LETT |vt|
                             (+
                              (SPADCALL (QUOTIENT2 (- |k| |a|) 2) |k|
                                        (QREFELT $ 24))
                              1)
                             . #3#))))
                (#4#
                 (SEQ (LETT |jt| 1 . #3#)
                      (EXIT (LETT |vt| (+ (QUOTIENT2 |k| 2) 1) . #3#)))))
               (LETT |vec| (SPADCALL |p1| (QREFELT $ 26)) . #3#)
               (SEQ (LETT |x| 1 . #3#) G190
                    (COND ((|greater_SI| |x| |k|) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |l| 1 . #3#) G190
                           (COND ((|greater_SI| |l| |n|) (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |vec|
                                       (+
                                        (SPADCALL
                                         (SPADCALL |t| (- |x| 1)
                                                   (|compiledLookupCheck| '^
                                                                          (LIST
                                                                           '$
                                                                           '$
                                                                           (LIST
                                                                            '|Integer|))
                                                                          (|PrimeField|
                                                                           |p1|)))
                                         (SPADCALL |pkn| (- |l| 1)
                                                   (|compiledLookupCheck| '^
                                                                          (LIST
                                                                           '$
                                                                           '$
                                                                           (LIST
                                                                            '|Integer|))
                                                                          (|PrimeField|
                                                                           |p1|)))
                                         (|compiledLookupCheck| '*
                                                                (LIST '$ '$ '$)
                                                                (|PrimeField|
                                                                 (+ (* |k| |n|)
                                                                    (|One|)))))
                                        1)
                                       (SPADCALL |l| |p1| (QREFELT $ 24))
                                       (QREFELT $ 27))))
                           (LETT |l| (|inc_SI| |l|) . #3#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191 (EXIT NIL))
               (LETT |lvj| (SPADCALL |k| |n| (QREFELT $ 29)) . #3#)
               (SEQ (LETT |v| 1 . #3#) G190
                    (COND ((|greater_SI| |v| |k|) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |j| 1 . #3#) G190
                           (COND ((|greater_SI| |j| |n|) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((OR (SPADCALL |j| |jt| (QREFELT $ 30))
                                   (SPADCALL |v| |vt| (QREFELT $ 30)))
                               (SEQ
                                (LETT |help|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |t| (- |v| 1)
                                                  (|compiledLookupCheck| '^
                                                                         (LIST
                                                                          '$ '$
                                                                          (LIST
                                                                           '|Integer|))
                                                                         (|PrimeField|
                                                                          |p1|)))
                                        (SPADCALL |pkn| (- |j| 1)
                                                  (|compiledLookupCheck| '^
                                                                         (LIST
                                                                          '$ '$
                                                                          (LIST
                                                                           '|Integer|))
                                                                         (|PrimeField|
                                                                          |p1|)))
                                        (|compiledLookupCheck| '*
                                                               (LIST '$ '$ '$)
                                                               (|PrimeField|
                                                                (+ (* |k| |n|)
                                                                   (|One|)))))
                                       (SPADCALL
                                        (|compiledLookupCheck| '|One| (LIST '$)
                                                               (|PrimeField|
                                                                (+ (* |k| |n|)
                                                                   (|One|)))))
                                       (|compiledLookupCheck| '+
                                                              (LIST '$ '$ '$)
                                                              (|PrimeField|
                                                               (+ (* |k| |n|)
                                                                  (|One|)))))
                                      . #3#)
                                (EXIT
                                 (SPADCALL |lvj| |v| |j|
                                           (SPADCALL |vec| (+ |help| 1)
                                                     (QREFELT $ 31))
                                           (QREFELT $ 32))))))))
                           (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |v| (|inc_SI| |v|) . #3#) (GO G190) G191 (EXIT NIL))
               (SEQ (LETT |j| 1 . #3#) G190
                    (COND ((|greater_SI| |j| |n|) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL |j| |jt| (QREFELT $ 30))
                        (SEQ (LETT |v| 1 . #3#) G190
                             (COND ((|greater_SI| |v| |k|) (GO G191)))
                             (SEQ
                              (LETT |lvjh|
                                    (SPADCALL |lvj| |v| |j| (QREFELT $ 33))
                                    . #3#)
                              (EXIT
                               (SPADCALL |multmat| |j| |lvjh|
                                         (SPADCALL
                                          (SPADCALL |multmat| |j| |lvjh|
                                                    (|compiledLookupCheck|
                                                     '|elt|
                                                     (LIST
                                                      (LIST '|PrimeField| |p|)
                                                      '$ (LIST '|Integer|)
                                                      (LIST '|Integer|))
                                                     (|Matrix|
                                                      (|PrimeField| |p|))))
                                          (SPADCALL
                                           (|compiledLookupCheck| '|One|
                                                                  (LIST '$)
                                                                  (|PrimeField|
                                                                   |p|)))
                                          (|compiledLookupCheck| '+
                                                                 (LIST '$ '$
                                                                       '$)
                                                                 (|PrimeField|
                                                                  |p|)))
                                         (|compiledLookupCheck| '|setelt|
                                                                (LIST
                                                                 (LIST
                                                                  '|PrimeField|
                                                                  |p|)
                                                                 '$
                                                                 (LIST
                                                                  '|Integer|)
                                                                 (LIST
                                                                  '|Integer|)
                                                                 (LIST
                                                                  '|PrimeField|
                                                                  |p|))
                                                                (|Matrix|
                                                                 (|PrimeField|
                                                                  |p|))))))
                             (LETT |v| (|inc_SI| |v|) . #3#) (GO G190) G191
                             (EXIT NIL))))))
                    (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
               (SEQ (LETT |i| 1 . #3#) G190
                    (COND ((|greater_SI| |i| |n|) (GO G191)))
                    (SEQ
                     (EXIT
                      (SPADCALL |multmat| |jt| |i|
                                (SPADCALL (SPADCALL (- |k|) |p| (QREFELT $ 24))
                                          (|compiledLookupCheck| '|coerce|
                                                                 (LIST '$
                                                                       (LIST
                                                                        '|Integer|))
                                                                 (|PrimeField|
                                                                  |p|)))
                                (|compiledLookupCheck| '|setelt|
                                                       (LIST
                                                        (LIST '|PrimeField|
                                                              |p|)
                                                        '$ (LIST '|Integer|)
                                                        (LIST '|Integer|)
                                                        (LIST '|PrimeField|
                                                              |p|))
                                                       (|Matrix|
                                                        (|PrimeField| |p|))))))
                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
               (SEQ (LETT |v| 1 . #3#) G190
                    (COND ((|greater_SI| |v| |k|) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL |v| |vt| (QREFELT $ 30))
                        (SEQ
                         (LETT |lvjh| (SPADCALL |lvj| |v| |jt| (QREFELT $ 33))
                               . #3#)
                         (EXIT
                          (SPADCALL |multmat| |jt| |lvjh|
                                    (SPADCALL
                                     (SPADCALL |multmat| |jt| |lvjh|
                                               (|compiledLookupCheck| '|elt|
                                                                      (LIST
                                                                       (LIST
                                                                        '|PrimeField|
                                                                        |p|)
                                                                       '$
                                                                       (LIST
                                                                        '|Integer|)
                                                                       (LIST
                                                                        '|Integer|))
                                                                      (|Matrix|
                                                                       (|PrimeField|
                                                                        |p|))))
                                     (SPADCALL
                                      (|compiledLookupCheck| '|One| (LIST '$)
                                                             (|PrimeField|
                                                              |p|)))
                                     (|compiledLookupCheck| '+ (LIST '$ '$ '$)
                                                            (|PrimeField|
                                                             |p|)))
                                    (|compiledLookupCheck| '|setelt|
                                                           (LIST
                                                            (LIST '|PrimeField|
                                                                  |p|)
                                                            '$
                                                            (LIST '|Integer|)
                                                            (LIST '|Integer|)
                                                            (LIST '|PrimeField|
                                                                  |p|))
                                                           (|Matrix|
                                                            (|PrimeField|
                                                             |p|))))))))))
                    (LETT |v| (|inc_SI| |v|) . #3#) (GO G190) G191 (EXIT NIL))
               (LETT |m| (ANROWS |multmat|) . #3#)
               (LETT |multtable| (MAKEARR1 |m| NIL) . #3#)
               (SEQ (LETT |i| 1 . #3#) G190
                    (COND ((|greater_SI| |i| |m|) (GO G191)))
                    (SEQ (LETT |l| NIL . #3#)
                         (LETT |v|
                               (SPADCALL |multmat| |i|
                                         (|compiledLookupCheck| '|row|
                                                                (LIST
                                                                 (LIST
                                                                  '|Vector|
                                                                  (LIST
                                                                   '|PrimeField|
                                                                   |p|))
                                                                 '$
                                                                 (LIST
                                                                  '|Integer|))
                                                                (|Matrix|
                                                                 (|PrimeField|
                                                                  |p|))))
                               . #3#)
                         (SEQ (LETT |j| 1 . #3#) G190
                              (COND ((|greater_SI| |j| |m|) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |v| |j|
                                             (|compiledLookupCheck| '|elt|
                                                                    (LIST
                                                                     (LIST
                                                                      '|PrimeField|
                                                                      |p|)
                                                                     '$
                                                                     (LIST
                                                                      '|Integer|))
                                                                    (|Vector|
                                                                     (|PrimeField|
                                                                      |p|))))
                                   (SPADCALL
                                    (|compiledLookupCheck| '|Zero| (LIST '$)
                                                           (|PrimeField| |p|)))
                                   (|compiledLookupCheck| '~=
                                                          (LIST
                                                           (LIST '|Boolean|) '$
                                                           '$)
                                                          (|PrimeField| |p|)))
                                  (SEQ
                                   (LETT |term|
                                         (CONS
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |v| |j|
                                                       (|compiledLookupCheck|
                                                        '|elt|
                                                        (LIST
                                                         (LIST '|PrimeField|
                                                               |p|)
                                                         '$ (LIST '|Integer|))
                                                        (|Vector|
                                                         (|PrimeField| |p|))))
                                             (|compiledLookupCheck| '-
                                                                    (LIST '$
                                                                          '$)
                                                                    (|PrimeField|
                                                                     |p|)))
                                            (|compiledLookupCheck| '|convert|
                                                                   (LIST
                                                                    (LIST
                                                                     '|Integer|)
                                                                    '$)
                                                                   (|PrimeField|
                                                                    |p|)))
                                           (QREFELT $ 34))
                                          (- |j| 2))
                                         . #3#)
                                   (EXIT
                                    (LETT |l| (CONS |term| |l|) . #3#)))))))
                              (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (QSETAREF1O |multtable| |i|
                                      (SPADCALL |l| (QREFELT $ 36)) 1)))
                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
               (EXIT (CONS 0 |multtable|)))))))))) 

(DEFUN |FFF;sizeMultiplication;VNni;3| (|m| $)
  (PROG (|s| #1=#:G174 |i|)
    (RETURN
     (SEQ (LETT |s| 0 . #2=(|FFF;sizeMultiplication;VNni;3|))
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (QVSIZE |m|) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |s| (+ |s| (LENGTH (SPADCALL |m| |i| (QREFELT $ 38))))
                       . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |s|))))) 

(DEFUN |FFF;createMultiplicationTable;SupV;4| (|f| $)
  (PROG (|l| |term| #1=#:G197 |j| |v| |i| |multtable| |mat| #2=#:G182 |mat1|
         |h| |g| |qexp| |w| |qpow| |e| |m1| |m| |sizeGF|)
    (RETURN
     (SEQ
      (LETT |sizeGF| (SPADCALL (QREFELT $ 17))
            . #3=(|FFF;createMultiplicationTable;SupV;4|))
      (LETT |m| (SPADCALL |f| (QREFELT $ 40)) . #3#)
      (EXIT
       (COND
        ((EQL |m| 1)
         (VECTOR
          (LIST
           (CONS (SPADCALL (SPADCALL |f| 0 (QREFELT $ 43)) (QREFELT $ 44))
                 -1))))
        (#4='T
         (SEQ (LETT |m1| (- |m| 1) . #3#) (SPADCALL |f| (QREFELT $ 46))
              (LETT |e|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 19) 1 (QREFELT $ 47))
                      (QREFELT $ 48))
                     |sizeGF| (QREFELT $ 49))
                    . #3#)
              (LETT |w| (|spadConstant| $ 50) . #3#)
              (LETT |qpow| (MAKEARR1 |m| (|spadConstant| $ 51)) . #3#)
              (QSETAREF1 |qpow| 0 (|spadConstant| $ 50))
              (SEQ (LETT |i| 1 . #3#) G190
                   (COND ((|greater_SI| |i| |m1|) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |qpow| |i|
                                (LETT |w| (SPADCALL |w| |e| (QREFELT $ 52))
                                      . #3#))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |qexp| (MAKEARR1 |m| (|spadConstant| $ 51)) . #3#)
              (QSETAREF1 |qexp| 0
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 19) 1 (QREFELT $ 47))
                          (QREFELT $ 48)))
              (LETT |mat| (SPADCALL |m| |m| (QREFELT $ 54)) . #3#)
              (QSETAREF2O |mat| 2 1 (|spadConstant| $ 19) 1 1)
              (LETT |h| (QAREF1 |qpow| 1) . #3#) (QSETAREF1 |qexp| 1 |h|)
              (SPADCALL |mat| 2 (SPADCALL |h| (QREFELT $ 56)) (QREFELT $ 57))
              (SEQ (LETT |i| 2 . #3#) G190
                   (COND ((|greater_SI| |i| |m1|) (GO G191)))
                   (SEQ (LETT |g| (|spadConstant| $ 51) . #3#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (SPADCALL |h| (|spadConstant| $ 51)
                                          (QREFELT $ 58)))
                               (GO G191)))
                             (SEQ
                              (LETT |g|
                                    (SPADCALL |g|
                                              (SPADCALL
                                               (SPADCALL |h| (QREFELT $ 59))
                                               (QAREF1 |qpow|
                                                       (SPADCALL |h|
                                                                 (QREFELT $
                                                                          60)))
                                               (QREFELT $ 61))
                                              (QREFELT $ 62))
                                    . #3#)
                              (EXIT
                               (LETT |h| (SPADCALL |h| (QREFELT $ 63)) . #3#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (QSETAREF1 |qexp| |i| |g|)
                        (EXIT
                         (SPADCALL |mat| (+ |i| 1)
                                   (SPADCALL (LETT |h| |g| . #3#)
                                             (QREFELT $ 56))
                                   (QREFELT $ 57))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |mat1| (SPADCALL |mat| (QREFELT $ 65)) . #3#)
              (EXIT
               (COND
                ((SPADCALL |mat1| (CONS 1 "failed") (QREFELT $ 67))
                 (|error|
                  "createMultiplicationTable: polynomial must be normal"))
                (#4#
                 (SEQ
                  (LETT |mat|
                        (PROG2 (LETT #2# |mat1| . #3#)
                            (QCDR #2#)
                          (|check_union| (QEQCAR #2# 0)
                                         (|Matrix| (QREFELT $ 6)) #2#))
                        . #3#)
                  (LETT |multtable| (MAKEARR1 |m| NIL) . #3#)
                  (SEQ (LETT |i| 1 . #3#) G190
                       (COND ((|greater_SI| |i| |m|) (GO G191)))
                       (SEQ (LETT |l| NIL . #3#)
                            (LETT |v|
                                  (SPADCALL |mat|
                                            (SPADCALL
                                             (SPADCALL
                                              (QAREF1 |qexp| (- |i| 1))
                                              (QAREF1 |qexp| 0) (QREFELT $ 52))
                                             (QREFELT $ 56))
                                            (QREFELT $ 68))
                                  . #3#)
                            (SEQ (LETT |j| 1 . #3#)
                                 (LETT #1# (SPADCALL |m| (QREFELT $ 70)) . #3#)
                                 G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL |v| |j| (QREFELT $ 71))
                                      (|spadConstant| $ 20) (QREFELT $ 72))
                                     (SEQ
                                      (LETT |term|
                                            (CONS
                                             (SPADCALL |v| |j| (QREFELT $ 71))
                                             (|sub_SI| |j| 2))
                                            . #3#)
                                      (EXIT
                                       (LETT |l| (CONS |term| |l|) . #3#)))))))
                                 (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (QSETAREF1O |multtable| |i|
                                         (SPADCALL |l| (QREFELT $ 36)) 1)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |multtable|))))))))))))) 

(DEFUN |FFF;createZechTable;SupPa;5| (|f| $)
  (PROG (|a| #1=#:G211 |i| #2=#:G210 #3=#:G209 |primElement| |helparr|
         |zechlog| |qm1| |m| #4=#:G198 |sizeGF|)
    (RETURN
     (SEQ
      (LETT |sizeGF| (SPADCALL (QREFELT $ 17))
            . #5=(|FFF;createZechTable;SupPa;5|))
      (LETT |m|
            (PROG1 (LETT #4# (SPADCALL |f| (QREFELT $ 40)) . #5#)
              (|check_subtype| (> #4# 0) '(|PositiveInteger|) #4#))
            . #5#)
      (LETT |qm1| (- (SPADCALL |sizeGF| |m| (QREFELT $ 74)) 1) . #5#)
      (LETT |zechlog|
            (MAKEARR1
             (QUOTIENT2 (+ (SPADCALL |sizeGF| |m| (QREFELT $ 74)) 1) 2) -1)
            . #5#)
      (LETT |helparr| (MAKEARR1 (EXPT |sizeGF| |m|) 0) . #5#)
      (LETT |primElement|
            (SPADCALL (SPADCALL (|spadConstant| $ 19) 1 (QREFELT $ 47))
                      (|compiledLookupCheck| '|reduce|
                                             (LIST '$
                                                   (LIST
                                                    '|SparseUnivariatePolynomial|
                                                    (|devaluate| (ELT $ 6))))
                                             (|SimpleAlgebraicExtension|
                                              (ELT $ 6)
                                              (|SparseUnivariatePolynomial|
                                               (ELT $ 6))
                                              |f|)))
            . #5#)
      (LETT |a| |primElement| . #5#)
      (SEQ (LETT |i| 1 . #5#) (LETT #3# (|sub_SI| |qm1| 1) . #5#) G190
           (COND ((|greater_SI| |i| #3#) (GO G191)))
           (SEQ
            (QSETAREF1 |helparr|
                       (SPADCALL
                        (SPADCALL |a|
                                  (SPADCALL
                                   (|compiledLookupCheck| '|One| (LIST '$)
                                                          (|SimpleAlgebraicExtension|
                                                           (ELT $ 6)
                                                           (|SparseUnivariatePolynomial|
                                                            (ELT $ 6))
                                                           |f|)))
                                  (|compiledLookupCheck| '- (LIST '$ '$ '$)
                                                         (|SimpleAlgebraicExtension|
                                                          (ELT $ 6)
                                                          (|SparseUnivariatePolynomial|
                                                           (ELT $ 6))
                                                          |f|)))
                        (|compiledLookupCheck| '|lookup|
                                               (LIST (LIST '|PositiveInteger|)
                                                     '$)
                                               (|SimpleAlgebraicExtension|
                                                (ELT $ 6)
                                                (|SparseUnivariatePolynomial|
                                                 (ELT $ 6))
                                                |f|)))
                       (SPADCALL |i| (QREFELT $ 70)))
            (EXIT
             (LETT |a|
                   (SPADCALL |a| |primElement|
                             (|compiledLookupCheck| '* (LIST '$ '$ '$)
                                                    (|SimpleAlgebraicExtension|
                                                     (ELT $ 6)
                                                     (|SparseUnivariatePolynomial|
                                                      (ELT $ 6))
                                                     |f|)))
                   . #5#)))
           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND
        ((EQL (SPADCALL (QREFELT $ 18)) 2)
         (SEQ (LETT |a| |primElement| . #5#)
              (SEQ (LETT |i| 1 . #5#) (LETT #2# (|quo_SI| |qm1| 2) . #5#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (QSETAREF1 |zechlog| |i|
                               (QAREF1 |helparr|
                                       (SPADCALL |a|
                                                 (|compiledLookupCheck|
                                                  '|lookup|
                                                  (LIST
                                                   (LIST '|PositiveInteger|)
                                                   '$)
                                                  (|SimpleAlgebraicExtension|
                                                   (ELT $ 6)
                                                   (|SparseUnivariatePolynomial|
                                                    (ELT $ 6))
                                                   |f|)))))
                    (EXIT
                     (LETT |a|
                           (SPADCALL |a| |primElement|
                                     (|compiledLookupCheck| '* (LIST '$ '$ '$)
                                                            (|SimpleAlgebraicExtension|
                                                             (ELT $ 6)
                                                             (|SparseUnivariatePolynomial|
                                                              (ELT $ 6))
                                                             |f|)))
                           . #5#)))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |zechlog|)))
        ('T
         (SEQ
          (LETT |a|
                (SPADCALL
                 (|compiledLookupCheck| '|One| (LIST '$)
                                        (|SimpleAlgebraicExtension| (ELT $ 6)
                                                                    (|SparseUnivariatePolynomial|
                                                                     (ELT $ 6))
                                                                    |f|)))
                . #5#)
          (SEQ (LETT |i| 0 . #5#)
               (LETT #1# (|quo_SI| (|sub_SI| |qm1| 2) 2) . #5#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (QSETAREF1 |zechlog| |i|
                           (QAREF1 |helparr|
                                   (SPADCALL |a|
                                             (|compiledLookupCheck| '|lookup|
                                                                    (LIST
                                                                     (LIST
                                                                      '|PositiveInteger|)
                                                                     '$)
                                                                    (|SimpleAlgebraicExtension|
                                                                     (ELT $ 6)
                                                                     (|SparseUnivariatePolynomial|
                                                                      (ELT $
                                                                           6))
                                                                     |f|)))))
                (EXIT
                 (LETT |a|
                       (SPADCALL |a| |primElement|
                                 (|compiledLookupCheck| '* (LIST '$ '$ '$)
                                                        (|SimpleAlgebraicExtension|
                                                         (ELT $ 6)
                                                         (|SparseUnivariatePolynomial|
                                                          (ELT $ 6))
                                                         |f|)))
                       . #5#)))
               (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT |zechlog|))))))))) 

(DEFUN |FFF;createMultiplicationMatrix;VM;6| (|m| $)
  (PROG (#1=#:G218 |t| |i| |mat| |n|)
    (RETURN
     (SEQ (LETT |n| (QVSIZE |m|) . #2=(|FFF;createMultiplicationMatrix;VM;6|))
          (LETT |mat| (SPADCALL |n| |n| (QREFELT $ 54)) . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |t| NIL . #2#)
                      (LETT #1# (SPADCALL |m| |i| (QREFELT $ 38)) . #2#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #2#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF2O |mat| |i| (|add_SI| (QCDR |t|) 2)
                                    (QCAR |t|) 1 1)))
                      (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |mat|))))) 

(DECLAIM (NOTINLINE |FiniteFieldFunctions;|)) 

(DEFUN |FiniteFieldFunctions| (#1=#:G219)
  (PROG ()
    (RETURN
     (PROG (#2=#:G220)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|FiniteFieldFunctions|)
                                           '|domainEqualList|)
                . #3=(|FiniteFieldFunctions|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|FiniteFieldFunctions;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|FiniteFieldFunctions|))))))))))) 

(DEFUN |FiniteFieldFunctions;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteFieldFunctions|))
      (LETT |dv$| (LIST '|FiniteFieldFunctions| DV$1) . #1#)
      (LETT $ (GETREFV 83) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FiniteFieldFunctions| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FiniteFieldFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|Record| (|:| |value| 6) (|:| |index| 69))
              (|Union| 37 '"failed") (|PositiveInteger|)
              |FFF;createLowComplexityTable;PiU;2|
              (|SparseUnivariatePolynomial| 6)
              (|FiniteFieldPolynomialPackage| 6) (0 . |createNormalPoly|)
              (|Union| 11 37) |FFF;createLowComplexityNormalBasis;PiU;1|
              (|NonNegativeInteger|) (5 . |size|) (9 . |characteristic|)
              (13 . |One|) (17 . |Zero|) (|Boolean|) (|Integer|)
              (21 . |prime?|) (26 . |positiveRemainder|) (|Vector| 22)
              (32 . |zero|) (37 . |setelt|) (|Matrix| 22) (44 . |zero|)
              (50 . ~=) (56 . |elt|) (62 . |setelt|) (70 . |elt|)
              (77 . |coerce|) (|List| 7) (82 . |copy|) (|Vector| 35)
              (87 . |elt|) |FFF;sizeMultiplication;VNni;3| (93 . |degree|)
              (98 . |One|) (102 . |Zero|) (106 . |coefficient|) (112 . -)
              (|ModMonic| 6 11) (117 . |setPoly|) (122 . |monomial|)
              (128 . |reduce|) (133 . ^) (139 . |One|) (143 . |Zero|) (147 . *)
              (|Matrix| 6) (153 . |zero|) (|Vector| 6) (159 . |Vectorise|)
              (164 . |setColumn!|) (171 . ~=) (177 . |leadingCoefficient|)
              (182 . |degree|) (187 . *) (193 . +) (199 . |reductum|)
              (|Union| $ '#1="failed") (204 . |inverse|) (|Union| 53 '#1#)
              (209 . =) (215 . *) (|SingleInteger|) (221 . |coerce|)
              (226 . |elt|) (232 . ~=) |FFF;createMultiplicationTable;SupV;4|
              (238 . ^) (244 . |characteristic|) (248 . |characteristic|)
              (252 . |characteristic|) (|Fraction| 11) (256 . |characteristic|)
              (|PrimitiveArray| 69) |FFF;createZechTable;SupPa;5|
              |FFF;createMultiplicationMatrix;VM;6|)
           '#(|sizeMultiplication| 260 |createZechTable| 265
              |createMultiplicationTable| 270 |createMultiplicationMatrix| 275
              |createLowComplexityTable| 280 |createLowComplexityNormalBasis|
              285)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 82
                                                 '(1 12 11 9 13 0 6 16 17 0 6
                                                   16 18 0 6 0 19 0 6 0 20 1 22
                                                   21 0 23 2 22 0 0 0 24 1 25 0
                                                   16 26 3 25 22 0 22 22 27 2
                                                   28 0 16 16 29 2 22 21 0 0 30
                                                   2 25 22 0 22 31 4 28 22 0 22
                                                   22 22 32 3 28 22 0 22 22 33
                                                   1 6 0 22 34 1 35 0 0 36 2 37
                                                   35 0 22 38 1 11 16 0 40 0 11
                                                   0 41 0 11 0 42 2 11 6 0 16
                                                   43 1 6 0 0 44 1 45 11 11 46
                                                   2 11 0 6 16 47 1 45 0 11 48
                                                   2 45 0 0 16 49 0 45 0 50 0
                                                   45 0 51 2 45 0 0 0 52 2 53 0
                                                   16 16 54 1 45 55 0 56 3 53 0
                                                   0 22 55 57 2 45 21 0 0 58 1
                                                   45 6 0 59 1 45 16 0 60 2 45
                                                   0 6 0 61 2 45 0 0 0 62 1 45
                                                   0 0 63 1 53 64 0 65 2 66 21
                                                   0 0 67 2 53 55 0 55 68 1 69
                                                   0 22 70 2 55 6 0 22 71 2 6
                                                   21 0 0 72 2 16 0 0 9 74 0 11
                                                   16 75 0 69 16 76 0 22 16 77
                                                   0 78 16 79 1 0 16 37 39 1 0
                                                   80 11 81 1 0 37 11 73 1 0 53
                                                   37 82 1 0 8 9 10 1 0 14 9
                                                   15)))))
           '|lookupComplete|)) 
