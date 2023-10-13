
(/VERSIONCHECK 2) 

(DEFUN |SMATCAT-;positivePower| (|x| |n| $)
  (PROG (|y|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 1) |x|)
            ((ODDP |n|)
             (SPADCALL |x| (|SMATCAT-;positivePower| |x| (- |n| 1) $)
                       (QREFELT $ 11)))
            ('T
             (SEQ
              (LETT |y| (|SMATCAT-;positivePower| |x| (QUOTIENT2 |n| 2) $)
                    |SMATCAT-;positivePower|)
              (EXIT (SPADCALL |y| |y| (QREFELT $ 11)))))))))) 

(DEFUN |SMATCAT-;^;SNniS;2| (|x| |n| $)
  (COND ((ZEROP |n|) (SPADCALL (|spadConstant| $ 12) (QREFELT $ 13)))
        ('T (|SMATCAT-;positivePower| |x| |n| $)))) 

(DEFUN |SMATCAT-;coerce;RS;3| (|r| $) (SPADCALL |r| (QREFELT $ 13))) 

(DEFUN |SMATCAT-;differentiate;SMS;4| (|x| |d| $)
  (SPADCALL |d| |x| (QREFELT $ 18))) 

(DEFUN |SMATCAT-;diagonal;SRow;5| (|x| $)
  (PROG (#1=#:G151 |i| #2=#:G152 |j| #3=#:G153 |k| |v|)
    (RETURN
     (SEQ
      (LETT |v| (MAKEARR1 (QREFELT $ 7) (|spadConstant| $ 20))
            . #4=(|SMATCAT-;diagonal;SRow;5|))
      (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 27)) . #4#)
           (LETT #3# (QVSIZE |v|) . #4#)
           (LETT |j| (SPADCALL |x| (QREFELT $ 24)) . #4#)
           (LETT #2# (SPADCALL |x| (QREFELT $ 25)) . #4#)
           (LETT |i| (SPADCALL |x| (QREFELT $ 22)) . #4#)
           (LETT #1# (SPADCALL |x| (QREFELT $ 23)) . #4#) G190
           (COND ((OR (> |i| #1#) (> |j| #2#) (> |k| #3#)) (GO G191)))
           (SEQ
            (EXIT
             (QSETAREF1O |v| |k| (SPADCALL |x| |i| |j| (QREFELT $ 28)) 1)))
           (LETT |i|
                 (PROG1 (+ |i| 1)
                   (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #4#))
                         . #4#))
                 . #4#)
           (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |v| (QREFELT $ 29))))))) 

(DEFUN |SMATCAT-;retract;SR;6| (|x| $)
  (COND
   ((SPADCALL |x| (QREFELT $ 32))
    (SPADCALL (SPADCALL |x| (QREFELT $ 33)) (QREFELT $ 34)))
   ('T (|error| "Not retractable")))) 

(DEFUN |SMATCAT-;retractIfCan;SU;7| (|x| $)
  (COND
   ((SPADCALL |x| (QREFELT $ 32))
    (SPADCALL (SPADCALL |x| (QREFELT $ 33)) (QREFELT $ 37)))
   ('T (CONS 1 "failed")))) 

(DEFUN |SMATCAT-;equation2R| (|v| $)
  (PROG (#1=#:G166 |j| #2=#:G165 |i| |ans|)
    (RETURN
     (SEQ
      (LETT |ans|
            (SPADCALL (QREFELT $ 7) (QVSIZE |v|) (|spadConstant| $ 39)
                      (QREFELT $ 41))
            . #3=(|SMATCAT-;equation2R|))
      (SEQ (LETT |i| 1 . #3#) (LETT #2# (SPADCALL |ans| (QREFELT $ 42)) . #3#)
           G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #3#)
                  (LETT #1# (SPADCALL |ans| (QREFELT $ 43)) . #3#) G190
                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (QSETAREF2O |ans| |i| |j|
                                (SPADCALL (QAREF1O |v| |j| 1) |i|
                                          (QREFELT $ 44))
                                1 1)))
                  (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |ans| (QREFELT $ 47))))))) 

(DEFUN |SMATCAT-;reducedSystem;MM;9| (|x| $)
  (PROG (#1=#:G173 |i| #2=#:G172)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (QREFELT $ 49))
        (SPADCALL 0 0 (|spadConstant| $ 20) (QREFELT $ 50)))
       ('T
        (SPADCALL (ELT $ 51)
                  (PROGN
                   (LETT #2# NIL . #3=(|SMATCAT-;reducedSystem;MM;9|))
                   (SEQ (LETT |i| 1 . #3#)
                        (LETT #1# (SPADCALL |x| (QREFELT $ 52)) . #3#) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (|SMATCAT-;equation2R|
                                  (SPADCALL |x| |i| (QREFELT $ 54)) $)
                                 #2#)
                                . #3#)))
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 57)))))))) 

(DEFUN |SMATCAT-;reducedSystem;MVR;10| (|m| |v| $)
  (PROG (|vh| |rh|)
    (RETURN
     (SEQ
      (LETT |vh|
            (COND
             ((SPADCALL |v| (QREFELT $ 59)) (MAKEARR1 0 (|spadConstant| $ 20)))
             ('T
              (SEQ
               (LETT |rh|
                     (SPADCALL (SPADCALL |v| (QREFELT $ 60)) (QREFELT $ 61))
                     . #1=(|SMATCAT-;reducedSystem;MVR;10|))
               (EXIT (SPADCALL |rh| 1 (QREFELT $ 62))))))
            . #1#)
      (EXIT (CONS (SPADCALL |m| (QREFELT $ 61)) |vh|)))))) 

(DEFUN |SMATCAT-;trace;SR;11| (|x| $)
  (PROG (|tr| #1=#:G183 |i| #2=#:G184 |j|)
    (RETURN
     (SEQ (LETT |tr| (|spadConstant| $ 20) . #3=(|SMATCAT-;trace;SR;11|))
          (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 24)) . #3#)
               (LETT #2# (SPADCALL |x| (QREFELT $ 25)) . #3#)
               (LETT |i| (SPADCALL |x| (QREFELT $ 22)) . #3#)
               (LETT #1# (SPADCALL |x| (QREFELT $ 23)) . #3#) G190
               (COND ((OR (> |i| #1#) (> |j| #2#)) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |tr|
                       (SPADCALL |tr| (SPADCALL |x| |i| |j| (QREFELT $ 66))
                                 (QREFELT $ 67))
                       . #3#)))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |tr|))))) 

(DEFUN |SMATCAT-;diagonalProduct;SR;12| (|x| $)
  (PROG (|pr| #1=#:G188 |i| #2=#:G189 |j|)
    (RETURN
     (SEQ
      (LETT |pr|
            (SPADCALL |x| (SPADCALL |x| (QREFELT $ 22))
                      (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 66))
            . #3=(|SMATCAT-;diagonalProduct;SR;12|))
      (SEQ (LETT |j| (+ (SPADCALL |x| (QREFELT $ 24)) 1) . #3#)
           (LETT #2# (SPADCALL |x| (QREFELT $ 25)) . #3#)
           (LETT |i| (+ (SPADCALL |x| (QREFELT $ 22)) 1) . #3#)
           (LETT #1# (SPADCALL |x| (QREFELT $ 23)) . #3#) G190
           (COND ((OR (> |i| #1#) (> |j| #2#)) (GO G191)))
           (SEQ
            (EXIT
             (LETT |pr|
                   (SPADCALL |pr| (SPADCALL |x| |i| |j| (QREFELT $ 66))
                             (QREFELT $ 69))
                   . #3#)))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |pr|))))) 

(DEFUN |SMATCAT-;^;SIS;13| (|x| |n| $)
  (PROG (|xInv|)
    (RETURN
     (SEQ
      (COND ((ZEROP |n|) (SPADCALL (|spadConstant| $ 12) (QREFELT $ 13)))
            ((SPADCALL |n| (QREFELT $ 71))
             (|SMATCAT-;positivePower| |x| |n| $))
            (#1='T
             (SEQ
              (LETT |xInv| (SPADCALL |x| (QREFELT $ 73)) |SMATCAT-;^;SIS;13|)
              (EXIT
               (COND
                ((QEQCAR |xInv| 1) (|error| "^: matrix must be invertible"))
                (#1#
                 (|SMATCAT-;positivePower| (QCDR |xInv|) (- |n|) $))))))))))) 

(DEFUN |SquareMatrixCategory&| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SquareMatrixCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$| (LIST '|SquareMatrixCategory&| DV$1 DV$2 DV$3 DV$4 DV$5)
            . #1#)
      (LETT $ (GETREFV 85) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST (|HasCategory| |#3| '(|Field|))
                                               (|HasCategory| |#3|
                                                              '(|CommutativeRing|))
                                               (|HasCategory| |#3| '(|Ring|))
                                               (|HasCategory| |#3|
                                                              '(|SemiRing|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#3| '(|Monoid|))
        (QSETREFV $ 15 (CONS (|dispatchFunction| |SMATCAT-;^;SNniS;2|) $))))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 58
                   (CONS (|dispatchFunction| |SMATCAT-;reducedSystem;MM;9|) $))
         (QSETREFV $ 65
                   (CONS (|dispatchFunction| |SMATCAT-;reducedSystem;MVR;10|)
                         $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 74 (CONS (|dispatchFunction| |SMATCAT-;^;SIS;13|) $))))
      $)))) 

(MAKEPROP '|SquareMatrixCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (0 . *) (6 . |One|)
              (10 . |scalarMatrix|) (|NonNegativeInteger|) (15 . ^)
              |SMATCAT-;coerce;RS;3| (|Mapping| 8 8) (21 . |map|)
              |SMATCAT-;differentiate;SMS;4| (27 . |Zero|) (|Integer|)
              (31 . |minRowIndex|) (36 . |maxRowIndex|) (41 . |minColIndex|)
              (46 . |maxColIndex|) (|Vector| 8) (51 . |minIndex|) (56 . |qelt|)
              (63 . |directProduct|) |SMATCAT-;diagonal;SRow;5| (|Boolean|)
              (68 . |diagonal?|) (73 . |diagonal|) (78 . |retract|)
              |SMATCAT-;retract;SR;6| (|Union| 8 '#1="failed")
              (83 . |retractIfCan|) |SMATCAT-;retractIfCan;SU;7| (88 . |Zero|)
              (|Matrix| 10) (92 . |new|) (99 . |maxRowIndex|)
              (104 . |maxColIndex|) (109 . |column|) (|Matrix| 8) (|Matrix| $)
              (115 . |reducedSystem|) (|Matrix| 6) (120 . |empty?|)
              (125 . |new|) (132 . |vertConcat|) (138 . |maxRowIndex|)
              (|Vector| 6) (143 . |row|) (|Mapping| 45 45 45) (|List| 45)
              (149 . |reduce|) (155 . |reducedSystem|) (160 . |empty?|)
              (165 . |coerce|) (170 . |reducedSystem|) (175 . |column|)
              (|Record| (|:| |mat| 45) (|:| |vec| 26)) (|Vector| $)
              (181 . |reducedSystem|) (187 . |elt|) (194 . +)
              |SMATCAT-;trace;SR;11| (200 . *) |SMATCAT-;diagonalProduct;SR;12|
              (206 . |positive?|) (|Union| $ '"failed") (211 . |inverse|)
              (216 . ^) (|List| 77) (|List| 14) (|Symbol|) (|Matrix| 21)
              (|Record| (|:| |mat| 78) (|:| |vec| (|Vector| 21)))
              (|Fraction| 21) (|Union| 80 '#1#) (|Union| 21 '#1#)
              (|OutputForm|) (|PositiveInteger|))
           '#(|trace| 222 |retractIfCan| 227 |retract| 232 |reducedSystem| 237
              |differentiate| 248 |diagonalProduct| 254 |diagonal| 259 |coerce|
              264 ^ 269)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 74
                                                 '(2 6 0 0 0 11 0 8 0 12 1 6 0
                                                   8 13 2 0 0 0 14 15 2 6 0 17
                                                   0 18 0 8 0 20 1 6 21 0 22 1
                                                   6 21 0 23 1 6 21 0 24 1 6 21
                                                   0 25 1 26 21 0 27 3 6 8 0 21
                                                   21 28 1 9 0 26 29 1 6 31 0
                                                   32 1 6 9 0 33 1 9 8 0 34 1 9
                                                   36 0 37 0 10 0 39 3 40 0 14
                                                   14 10 41 1 40 21 0 42 1 40
                                                   21 0 43 2 6 10 0 21 44 1 10
                                                   45 46 47 1 48 31 0 49 3 45 0
                                                   14 14 8 50 2 45 0 0 0 51 1
                                                   48 21 0 52 2 48 53 0 21 54 2
                                                   56 45 55 0 57 1 0 45 46 58 1
                                                   53 31 0 59 1 48 0 53 60 1 6
                                                   45 46 61 2 45 26 0 21 62 2 0
                                                   63 46 64 65 3 6 8 0 21 21 66
                                                   2 8 0 0 0 67 2 8 0 0 0 69 1
                                                   21 31 0 71 1 6 72 0 73 2 0 0
                                                   0 21 74 1 0 8 0 68 1 0 36 0
                                                   38 1 0 8 0 35 2 0 63 46 64
                                                   65 1 0 45 46 58 2 0 0 0 17
                                                   19 1 0 8 0 70 1 0 9 0 30 1 0
                                                   0 8 16 2 0 0 0 14 15 2 0 0 0
                                                   21 74)))))
           '|lookupComplete|)) 
