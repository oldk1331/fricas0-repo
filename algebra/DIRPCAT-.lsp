
(/VERSIONCHECK 2) 

(DEFUN |DIRPCAT-;coerce;IS;1| (|n| $)
  (SPADCALL (SPADCALL |n| (QREFELT $ 10)) (QREFELT $ 11))) 

(DEFUN |DIRPCAT-;characteristic;Nni;2| ($) (SPADCALL (QREFELT $ 14))) 

(DEFUN |DIRPCAT-;differentiate;SMS;3| (|z| |d| $)
  (SPADCALL |d| |z| (QREFELT $ 17))) 

(DEFUN |DIRPCAT-;equation2R| (|v| $)
  (PROG (#1=#:G147 |j| #2=#:G146 |i| |ans|)
    (RETURN
     (SEQ
      (LETT |ans|
            (SPADCALL (QREFELT $ 7) (QVSIZE |v|) (|spadConstant| $ 19)
                      (QREFELT $ 21))
            . #3=(|DIRPCAT-;equation2R|))
      (SEQ (LETT |i| 1 . #3#) (LETT #2# (SPADCALL |ans| (QREFELT $ 22)) . #3#)
           G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #3#)
                  (LETT #1# (SPADCALL |ans| (QREFELT $ 23)) . #3#) G190
                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (QSETAREF2O |ans| |i| |j|
                                (SPADCALL (QAREF1O |v| |j| 1) |i|
                                          (QREFELT $ 24))
                                1 1)))
                  (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |ans|))))) 

(DEFUN |DIRPCAT-;reducedSystem;MM;5| (|m| $)
  (PROG (#1=#:G154 |i| #2=#:G153)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |m| (QREFELT $ 27))
        (SPADCALL 0 0 (|spadConstant| $ 19) (QREFELT $ 21)))
       ('T
        (SPADCALL (ELT $ 28)
                  (PROGN
                   (LETT #2# NIL . #3=(|DIRPCAT-;reducedSystem;MM;5|))
                   (SEQ (LETT |i| 1 . #3#)
                        (LETT #1# (SPADCALL |m| (QREFELT $ 29)) . #3#) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (|DIRPCAT-;equation2R|
                                  (SPADCALL |m| |i| (QREFELT $ 31)) $)
                                 #2#)
                                . #3#)))
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 34)))))))) 

(DEFUN |DIRPCAT-;reducedSystem;MVR;6| (|m| |v| $)
  (PROG (|vh| |rh|)
    (RETURN
     (SEQ
      (LETT |vh|
            (COND ((SPADCALL |v| (QREFELT $ 37)) (MAKE-ARRAY 0))
                  ('T
                   (SEQ
                    (LETT |rh|
                          (SPADCALL (SPADCALL |v| (QREFELT $ 38))
                                    (QREFELT $ 39))
                          . #1=(|DIRPCAT-;reducedSystem;MVR;6|))
                    (EXIT (SPADCALL |rh| 1 (QREFELT $ 41))))))
            . #1#)
      (EXIT (CONS (SPADCALL |m| (QREFELT $ 39)) |vh|)))))) 

(DEFUN |DIRPCAT-;/;SRS;7| (|x| |b| $)
  (SPADCALL |x| (SPADCALL |b| (QREFELT $ 45)) (QREFELT $ 46))) 

(DEFUN |DIRPCAT-;dimension;Cn;8| ($) (SPADCALL (QREFELT $ 7) (QREFELT $ 49))) 

(DEFUN |DIRPCAT-;size;Nni;9| ($) (EXPT (SPADCALL (QREFELT $ 51)) (QREFELT $ 7))) 

(DEFUN |DIRPCAT-;index;PiS;10| (|n| $)
  (PROG (|n0| #1=#:G165 |d| #2=#:G170 |i| |r| |s|)
    (RETURN
     (SEQ (LETT |s| (SPADCALL (QREFELT $ 51)) . #3=(|DIRPCAT-;index;PiS;10|))
          (LETT |r| (MAKEARR1 (QREFELT $ 7) (SPADCALL 1 (QREFELT $ 54))) . #3#)
          (LETT |n0| (- |n| 1) . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #2# (QREFELT $ 7) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |d| (DIVIDE2 |n0| |s|) . #3#)
                    (SPADCALL |r| |i|
                              (SPADCALL
                               (PROG1 (LETT #1# (+ 1 (QCDR |d|)) . #3#)
                                 (|check_subtype| (> #1# 0)
                                                  '(|PositiveInteger|) #1#))
                               (QREFELT $ 54))
                              (QREFELT $ 55))
                    (EXIT (LETT |n0| (QCAR |d|) . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |r| (QREFELT $ 56))))))) 

(DEFUN |DIRPCAT-;lookup;SPi;11| (|v| $)
  (PROG (#1=#:G173 |pow| |res| #2=#:G176 |i| |s|)
    (RETURN
     (SEQ (LETT |s| (SPADCALL (QREFELT $ 51)) . #3=(|DIRPCAT-;lookup;SPi;11|))
          (LETT |pow| 1 . #3#) (LETT |res| 1 . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #2# (QREFELT $ 7) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (LETT |res|
                      (+ |res|
                         (*
                          (-
                           (SPADCALL (SPADCALL |v| |i| (QREFELT $ 58))
                                     (QREFELT $ 59))
                           1)
                          |pow|))
                      . #3#)
                (EXIT (LETT |pow| (* |pow| |s|) . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROG1 (LETT #1# |res| . #3#)
             (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))))) 

(DECLAIM (NOTINLINE |DirectProductCategory&;|)) 

(DEFUN |DirectProductCategory&| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|DirectProductCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|DirectProductCategory&| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 68) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST (|HasCategory| |#3| '(|Field|))
                                               (|HasCategory| |#3|
                                                              '(|OrderedAbelianMonoidSup|))
                                               (|HasCategory| |#3|
                                                              '(|OrderedRing|))
                                               (|HasCategory| |#3|
                                                              '(|unitsKnown|))
                                               (|HasCategory| |#3|
                                                              '(|CommutativeRing|))
                                               (|HasCategory| |#3| '(|Finite|))
                                               (|HasCategory| |#3| '(|Monoid|))
                                               (|HasCategory| |#3|
                                                              '(|CancellationAbelianMonoid|))
                                               (|HasCategory| |#3|
                                                              '(|AbelianSemiGroup|))
                                               (|HasCategory| |#3| '(|Ring|))
                                               (|HasCategory| |#3|
                                                              '(|SetCategory|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 10)
        (PROGN
         (QSETREFV $ 12 (CONS (|dispatchFunction| |DIRPCAT-;coerce;IS;1|) $))
         (QSETREFV $ 15
                   (CONS (|dispatchFunction| |DIRPCAT-;characteristic;Nni;2|)
                         $))
         (QSETREFV $ 18
                   (CONS (|dispatchFunction| |DIRPCAT-;differentiate;SMS;3|)
                         $))
         (QSETREFV $ 36
                   (CONS (|dispatchFunction| |DIRPCAT-;reducedSystem;MM;5|) $))
         (QSETREFV $ 44
                   (CONS (|dispatchFunction| |DIRPCAT-;reducedSystem;MVR;6|)
                         $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 47 (CONS (|dispatchFunction| |DIRPCAT-;/;SRS;7|) $))
         (QSETREFV $ 50
                   (CONS (|dispatchFunction| |DIRPCAT-;dimension;Cn;8|) $)))))
      (COND
       ((|testBitVector| |pv$| 6)
        (PROGN
         (QSETREFV $ 52 (CONS (|dispatchFunction| |DIRPCAT-;size;Nni;9|) $))
         (QSETREFV $ 57 (CONS (|dispatchFunction| |DIRPCAT-;index;PiS;10|) $))
         (QSETREFV $ 60
                   (CONS (|dispatchFunction| |DIRPCAT-;lookup;SPi;11|) $)))))
      $)))) 

(MAKEPROP '|DirectProductCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Integer|) (0 . |coerce|) (5 . |coerce|)
              (10 . |coerce|) (|NonNegativeInteger|) (15 . |characteristic|)
              (19 . |characteristic|) (|Mapping| 8 8) (23 . |map|)
              (29 . |differentiate|) (35 . |Zero|) (|Matrix| 8) (39 . |new|)
              (46 . |maxRowIndex|) (51 . |maxColIndex|) (56 . |qelt|)
              (|Boolean|) (|Matrix| 6) (62 . |empty?|) (67 . |vertConcat|)
              (73 . |maxRowIndex|) (|Vector| 6) (78 . |row|)
              (|Mapping| 20 20 20) (|List| 20) (84 . |reduce|) (|Matrix| $)
              (90 . |reducedSystem|) (95 . |empty?|) (100 . |coerce|)
              (105 . |reducedSystem|) (|Vector| 8) (110 . |column|)
              (|Record| (|:| |mat| 20) (|:| |vec| 40)) (|Vector| $)
              (116 . |reducedSystem|) (122 . |inv|) (127 . *) (133 . /)
              (|CardinalNumber|) (139 . |coerce|) (144 . |dimension|)
              (148 . |size|) (152 . |size|) (|PositiveInteger|) (156 . |index|)
              (161 . |setelt|) (168 . |directProduct|) (173 . |index|)
              (178 . |elt|) (184 . |lookup|) (189 . |lookup|) (|Fraction| 9)
              (|OutputForm|) (|Symbol|) (|List| 63) (|List| 13) (|Matrix| 9)
              (|Record| (|:| |mat| 66) (|:| |vec| (|Vector| 9))))
           '#(|size| 194 |reducedSystem| 198 |lookup| 209 |index| 214
              |dimension| 219 |differentiate| 223 |coerce| 229 |characteristic|
              234 / 238)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 60
                                                 '(1 8 0 9 10 1 6 0 8 11 1 0 0
                                                   9 12 0 8 13 14 0 0 13 15 2 6
                                                   0 16 0 17 2 0 0 0 16 18 0 8
                                                   0 19 3 20 0 13 13 8 21 1 20
                                                   9 0 22 1 20 9 0 23 2 6 8 0 9
                                                   24 1 26 25 0 27 2 20 0 0 0
                                                   28 1 26 9 0 29 2 26 30 0 9
                                                   31 2 33 20 32 0 34 1 0 20 35
                                                   36 1 30 25 0 37 1 26 0 30 38
                                                   1 6 20 35 39 2 20 40 0 9 41
                                                   2 0 42 35 43 44 1 8 0 0 45 2
                                                   6 0 0 8 46 2 0 0 0 8 47 1 48
                                                   0 13 49 0 0 48 50 0 8 13 51
                                                   0 0 13 52 1 8 0 53 54 3 40 8
                                                   0 9 8 55 1 6 0 40 56 1 0 0
                                                   53 57 2 6 8 0 9 58 1 8 53 0
                                                   59 1 0 53 0 60 0 0 13 52 1 0
                                                   20 35 36 2 0 42 35 43 44 1 0
                                                   53 0 60 1 0 0 53 57 0 0 48
                                                   50 2 0 0 0 16 18 1 0 0 9 12
                                                   0 0 13 15 2 0 0 0 8 47)))))
           '|lookupComplete|)) 
