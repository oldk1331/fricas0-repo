
(SDEFUN |ISMITH;smith;MMM;1|
        ((|m| |Matrix| (|Integer|))
         (|full| |Mapping| (|Matrix| (|Integer|)) (|Matrix| (|Integer|)))
         ($ |Matrix| (|Integer|)))
        (SPROG
         ((#1=#:G112 NIL) (|i| NIL) (|nn2| #2=(|Integer|)) (#3=#:G111 NIL)
          (|res| (|Matrix| (|Integer|))) (|count| #2#)
          (|nn| (|NonNegativeInteger|)) (|k| (|NonNegativeInteger|))
          (|j| (|NonNegativeInteger|)) (|m3| (|Matrix| (|Integer|)))
          (|m2| (|Matrix| (|Integer|))) (|m1| (|Matrix| (|Integer|))))
         (SEQ (LETT |m1| (SPADCALL |m| (QREFELT $ 7)))
              (LETT |m2| (SPADCALL |m1| (QREFELT $ 9)))
              (LETT |m3| (SPADCALL |m2| |full|)) (LETT |j| (ANROWS |m|))
              (LETT |k| (ANCOLS |m|)) (LETT |nn| (MIN |j| |k|))
              (LETT |count| (- |j| (ANROWS |m2|)))
              (LETT |res| (SPADCALL |j| |k| (QREFELT $ 11)))
              (SEQ (LETT |i| 1) (LETT #3# |count|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (EXIT (QSETAREF2O |res| |i| |i| 1 1 1)))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |nn2| (- |nn| |count|))
              (SEQ (LETT |i| 1) (LETT #1# |nn2|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF2O |res| (+ |i| |count|) (+ |i| |count|)
                                 (QAREF2O |m3| |i| |i| 1 1) 1 1)))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |ISMITH;smith;2M;2|
        ((|m| |Matrix| (|Integer|)) ($ |Matrix| (|Integer|)))
        (SPADCALL |m| (ELT $ 15) (QREFELT $ 13))) 

(SDEFUN |ISMITH;completeSmith;MMR;3|
        ((|m| |Matrix| (|Integer|))
         (|full| |Mapping|
          (|Record| (|:| |Smith| (|Matrix| (|Integer|)))
                    (|:| |leftEqMat| (|Matrix| (|Integer|)))
                    (|:| |rightEqMat| (|Matrix| (|Integer|))))
          (|Matrix| (|Integer|)))
         ($ |Record| (|:| |Smith| (|Matrix| (|Integer|)))
          (|:| |leftEqMat| (|Matrix| (|Integer|)))
          (|:| |rightEqMat| (|Matrix| (|Integer|)))))
        (SPROG
         ((#1=#:G159 NIL) (|n| NIL) (#2=#:G158 NIL) (|pp| (|Integer|))
          (#3=#:G157 NIL) (|l| NIL) (#4=#:G156 NIL) (#5=#:G155 NIL)
          (#6=#:G154 NIL) (#7=#:G153 NIL) (|i| NIL)
          (|m16| #8=(|Matrix| (|Integer|))) (|m15| #9=(|Matrix| (|Integer|)))
          (|m14| #8#) (|m13| #9#) (#10=#:G151 NIL) (#11=#:G152 NIL)
          (|m12| (|Matrix| (|Integer|))) (|m11| #12=(|Matrix| (|Integer|)))
          (|m10| #9#) (|m9| #13=(|Matrix| (|Integer|))) (|m8| #12#) (|m7| #9#)
          (|m6| #13#)
          (|res1|
           (|Record| (|:| |Smith| (|Matrix| (|Integer|)))
                     (|:| |leftEqMat| (|Matrix| (|Integer|)))
                     (|:| |rightEqMat| (|Matrix| (|Integer|)))))
          (|m5| #13#) (|count| (|NonNegativeInteger|))
          (|m4| (|Matrix| (|Integer|))) (|m3| (|Matrix| (|Integer|)))
          (|lks| #14=(|List| (|Integer|))) (|ljs| #14#)
          (|lk| (|List| (|Integer|))) (|s| (|Integer|)) (#15=#:G150 NIL)
          (#16=#:G149 NIL) (|lk0| (|List| (|Integer|))) (#17=#:G148 NIL)
          (#18=#:G147 NIL) (|lj2| (|List| (|Integer|))) (#19=#:G146 NIL)
          (#20=#:G145 NIL) (|lj1| (|List| (|Integer|))) (#21=#:G144 NIL)
          (#22=#:G143 NIL) (|lj0| (|List| (|Integer|))) (#23=#:G142 NIL)
          (#24=#:G141 NIL) (|m2| (|Matrix| (|Integer|)))
          (|m1| (|Matrix| (|Integer|))) (|pivotsk| #25=(|Vector| (|Integer|)))
          (|pivotsj| #25#)
          (|res0|
           (|Record| (|:| |Smith| (|Matrix| (|Integer|)))
                     (|:| |leftEqMat| (|Matrix| (|Integer|)))
                     (|:| |rightEqMat| (|Matrix| (|Integer|)))))
          (|k| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|)))
         (SEQ (LETT |j| (ANROWS |m|)) (LETT |k| (ANCOLS |m|))
              (EXIT
               (COND
                ((SPADCALL |j| |k| (QREFELT $ 18))
                 (SEQ
                  (LETT |res0|
                        (SPADCALL (SPADCALL |m| (QREFELT $ 19)) |full|
                                  (QREFELT $ 22)))
                  (EXIT
                   (VECTOR (SPADCALL (QVELT |res0| 0) (QREFELT $ 19))
                           (SPADCALL (QVELT |res0| 2) (QREFELT $ 19))
                           (SPADCALL (QVELT |res0| 1) (QREFELT $ 19))))))
                ('T
                 (SEQ (LETT |pivotsj| (SPADCALL |j| (QREFELT $ 24)))
                      (LETT |pivotsk| (SPADCALL |k| (QREFELT $ 24)))
                      (LETT |m1| (SPADCALL |m| (QREFELT $ 7)))
                      (LETT |m2|
                            (SPADCALL |m1| |pivotsj| |pivotsk| (QREFELT $ 25)))
                      (LETT |lj0|
                            (PROGN
                             (LETT #24# NIL)
                             (SEQ (LETT |i| 1) (LETT #23# |j|) G190
                                  (COND ((|greater_SI| |i| #23#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((EQL
                                       (SPADCALL |pivotsj| |i| (QREFELT $ 27))
                                       0)
                                      (LETT #24# (CONS |i| #24#))))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT (NREVERSE #24#)))))
                      (LETT |lj1|
                            (PROGN
                             (LETT #22# NIL)
                             (SEQ (LETT |i| 1) (LETT #21# |j|) G190
                                  (COND ((|greater_SI| |i| #21#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (LETT |s|
                                             (SPADCALL |pivotsj| |i|
                                                       (QREFELT $ 27)))
                                       0 (QREFELT $ 28))
                                      (LETT #22# (CONS |s| #22#))))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT (NREVERSE #22#)))))
                      (LETT |lj2|
                            (PROGN
                             (LETT #20# NIL)
                             (SEQ (LETT |i| 1) (LETT #19# |j|) G190
                                  (COND ((|greater_SI| |i| #19#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |pivotsj| |i| (QREFELT $ 27))
                                       0 (QREFELT $ 28))
                                      (LETT #20# (CONS |i| #20#))))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT (NREVERSE #20#)))))
                      (LETT |lk0|
                            (PROGN
                             (LETT #18# NIL)
                             (SEQ (LETT |i| 1) (LETT #17# |k|) G190
                                  (COND ((|greater_SI| |i| #17#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((EQL
                                       (SPADCALL |pivotsk| |i| (QREFELT $ 27))
                                       0)
                                      (LETT #18# (CONS |i| #18#))))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT (NREVERSE #18#)))))
                      (LETT |lk|
                            (PROGN
                             (LETT #16# NIL)
                             (SEQ (LETT |i| 1) (LETT #15# |k|) G190
                                  (COND ((|greater_SI| |i| #15#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (LETT |s|
                                             (SPADCALL |pivotsk| |i|
                                                       (QREFELT $ 27)))
                                       0 (QREFELT $ 28))
                                      (LETT #16# (CONS |s| #16#))))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT (NREVERSE #16#)))))
                      (LETT |ljs| (SPADCALL |lj2| |lj0| (QREFELT $ 30)))
                      (LETT |lks| (SPADCALL |lj1| |lk0| (QREFELT $ 30)))
                      (LETT |m3| (SPADCALL |m1| |ljs| |lks| (QREFELT $ 31)))
                      (LETT |m4|
                            (SPADCALL |m2| |ljs|
                                      (SPADCALL 1 |j| (QREFELT $ 33))
                                      (QREFELT $ 34)))
                      (LETT |count| (LENGTH |lj2|))
                      (LETT |m5|
                            (SPADCALL |m3|
                                      (SPADCALL (+ |count| 1) |j|
                                                (QREFELT $ 33))
                                      (SPADCALL (+ |count| 1) |k|
                                                (QREFELT $ 33))
                                      (QREFELT $ 35)))
                      (LETT |res1| (SPADCALL |m5| |full|))
                      (LETT |m6|
                            (SPADCALL |m4|
                                      (SPADCALL (+ |count| 1) |j|
                                                (QREFELT $ 33))
                                      (SPADCALL 1 |j| (QREFELT $ 33))
                                      (QREFELT $ 35)))
                      (LETT |m7|
                            (SPADCALL (QVELT |res1| 1) |m6| (QREFELT $ 36)))
                      (LETT |m8|
                            (SPADCALL
                             (SPADCALL |m4| (SPADCALL 1 |count| (QREFELT $ 33))
                                       (SPADCALL 1 |j| (QREFELT $ 33))
                                       (QREFELT $ 35))
                             |m7| (QREFELT $ 37)))
                      (LETT |m9|
                            (SPADCALL |m3|
                                      (SPADCALL (+ |count| 1) |j|
                                                (QREFELT $ 33))
                                      (SPADCALL 1 |k| (QREFELT $ 33))
                                      (QREFELT $ 35)))
                      (LETT |m10|
                            (SPADCALL (QVELT |res1| 1) |m9| (QREFELT $ 36)))
                      (LETT |m11|
                            (SPADCALL
                             (SPADCALL |m3| (SPADCALL 1 |count| (QREFELT $ 33))
                                       (SPADCALL 1 |k| (QREFELT $ 33))
                                       (QREFELT $ 35))
                             |m10| (QREFELT $ 37)))
                      (LETT |m12| (SPADCALL |k| |k| (QREFELT $ 11)))
                      (SEQ (LETT |l| NIL) (LETT #11# |lks|) (LETT |i| 1)
                           (LETT #10# |k|) G190
                           (COND
                            ((OR (|greater_SI| |i| #10#) (ATOM #11#)
                                 (PROGN (LETT |l| (CAR #11#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT (SPADCALL |m12| |l| |i| 1 (QREFELT $ 38))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|) (LETT #11# (CDR #11#))))
                           (GO G190) G191 (EXIT NIL))
                      (LETT |m13|
                            (SPADCALL
                             (SPADCALL |m12| (SPADCALL 1 |k| (QREFELT $ 33))
                                       (SPADCALL (+ |count| 1) |k|
                                                 (QREFELT $ 33))
                                       (QREFELT $ 35))
                             (QVELT |res1| 2) (QREFELT $ 36)))
                      (LETT |m14|
                            (SPADCALL
                             (SPADCALL |m12| (SPADCALL 1 |k| (QREFELT $ 33))
                                       (SPADCALL 1 |count| (QREFELT $ 33))
                                       (QREFELT $ 35))
                             |m13| (QREFELT $ 41)))
                      (LETT |m15|
                            (SPADCALL
                             (SPADCALL |m11| (SPADCALL 1 |j| (QREFELT $ 33))
                                       (SPADCALL (+ |count| 1) |k|
                                                 (QREFELT $ 33))
                                       (QREFELT $ 35))
                             (QVELT |res1| 2) (QREFELT $ 36)))
                      (LETT |m16|
                            (SPADCALL
                             (SPADCALL |m11| (SPADCALL 1 |j| (QREFELT $ 33))
                                       (SPADCALL 1 |count| (QREFELT $ 33))
                                       (QREFELT $ 35))
                             |m15| (QREFELT $ 41)))
                      (SEQ (LETT |i| |count|) G190 (COND ((< |i| 1) (GO G191)))
                           (SEQ
                            (COND
                             ((EQL (QAREF2O |m16| |i| |i| 1 1) -1)
                              (SEQ
                               (SEQ (LETT |l| 1) (LETT #7# |i|) G190
                                    (COND ((|greater_SI| |l| #7#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (QSETAREF2O |m16| |l| |i|
                                                  (-
                                                   (QAREF2O |m16| |l| |i| 1 1))
                                                  1 1)))
                                    (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (SEQ (LETT |l| 1) (LETT #6# |k|) G190
                                     (COND ((|greater_SI| |l| #6#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (QSETAREF2O |m14| |l| |i|
                                                   (-
                                                    (QAREF2O |m14| |l| |i| 1
                                                             1))
                                                   1 1)))
                                     (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                                     (EXIT NIL))))))
                            (EXIT
                             (COND
                              ((SPADCALL (QAREF2O |m16| |i| |i| 1 1) 1
                                         (QREFELT $ 28))
                               (|error| "completeSmith: wrong diagonal"))
                              ('T
                               (SEQ
                                (SEQ (LETT |l| 1) (LETT #5# (- |i| 1)) G190
                                     (COND ((|greater_SI| |l| #5#) (GO G191)))
                                     (SEQ
                                      (LETT |pp| (QAREF2O |m16| |l| |i| 1 1))
                                      (EXIT
                                       (SEQ (LETT |n| (+ |i| 1)) (LETT #4# |k|)
                                            G190 (COND ((> |n| #4#) (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (QSETAREF2O |m16| |l| |n|
                                                          (-
                                                           (QAREF2O |m16| |l|
                                                                    |n| 1 1)
                                                           (* |pp|
                                                              (QAREF2O |m16|
                                                                       |i| |n|
                                                                       1 1)))
                                                          1 1)))
                                            (LETT |n| (+ |n| 1)) (GO G190) G191
                                            (EXIT NIL))))
                                     (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                                     (EXIT NIL))
                                (SEQ (LETT |l| 1) (LETT #3# |k|) G190
                                     (COND ((|greater_SI| |l| #3#) (GO G191)))
                                     (SEQ
                                      (LETT |pp| (QAREF2O |m14| |l| |i| 1 1))
                                      (EXIT
                                       (SEQ (LETT |n| (+ |i| 1)) (LETT #2# |k|)
                                            G190 (COND ((> |n| #2#) (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (QSETAREF2O |m14| |l| |n|
                                                          (-
                                                           (QAREF2O |m14| |l|
                                                                    |n| 1 1)
                                                           (* |pp|
                                                              (QAREF2O |m16|
                                                                       |i| |n|
                                                                       1 1)))
                                                          1 1)))
                                            (LETT |n| (+ |n| 1)) (GO G190) G191
                                            (EXIT NIL))))
                                     (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (SEQ (LETT |n| (+ |i| 1)) (LETT #1# |k|) G190
                                      (COND ((> |n| #1#) (GO G191)))
                                      (SEQ
                                       (EXIT (QSETAREF2O |m16| |i| |n| 0 1 1)))
                                      (LETT |n| (+ |n| 1)) (GO G190) G191
                                      (EXIT NIL))))))))
                           (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                      (EXIT (VECTOR |m16| |m8| |m14|))))))))) 

(DECLAIM (NOTINLINE |IntegerSmithNormalForm;|)) 

(DEFUN |IntegerSmithNormalForm| ()
  (SPROG NIL
         (PROG (#1=#:G161)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|IntegerSmithNormalForm|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|IntegerSmithNormalForm|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|IntegerSmithNormalForm;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|IntegerSmithNormalForm|)))))))))) 

(DEFUN |IntegerSmithNormalForm;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|IntegerSmithNormalForm|))
          (LETT $ (GETREFV 42))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|IntegerSmithNormalForm| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|IntegerSmithNormalForm| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Matrix| 26) (0 . |copy|)
              (|UnitGaussianElimination|) (5 . |pre_smith|)
              (|NonNegativeInteger|) (10 . |zero|) (|Mapping| 6 6)
              |ISMITH;smith;MMM;1| (|SmithNormalForm| 26 23 23 6)
              (16 . |smith|) |ISMITH;smith;2M;2| (|Boolean|) (21 . >)
              (27 . |transpose|)
              (|Record| (|:| |Smith| 6) (|:| |leftEqMat| 6)
                        (|:| |rightEqMat| 6))
              (|Mapping| 20 6) |ISMITH;completeSmith;MMR;3| (|Vector| 26)
              (32 . |zero|) (37 . |pre_lr|) (|Integer|) (44 . |elt|) (50 . ~=)
              (|List| 26) (56 . |concat|) (62 . |elt|) (|Segment| 26)
              (69 . SEGMENT) (75 . |elt|) (82 . |elt|) (89 . *)
              (95 . |vertConcat|) (101 . |setelt!|) (|UniversalSegment| 26)
              (109 . SEGMENT) (115 . |horizConcat|))
           '#(|smith| 121 |completeSmith| 132) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|smith|
                                 ((|Matrix| (|Integer|))
                                  (|Matrix| (|Integer|))))
                                T)
                              '((|smith|
                                 ((|Matrix| (|Integer|)) (|Matrix| (|Integer|))
                                  (|Mapping| (|Matrix| (|Integer|))
                                             (|Matrix| (|Integer|)))))
                                T)
                              '((|completeSmith|
                                 ((|Record|
                                   (|:| |Smith| (|Matrix| (|Integer|)))
                                   (|:| |leftEqMat| (|Matrix| (|Integer|)))
                                   (|:| |rightEqMat| (|Matrix| (|Integer|))))
                                  (|Matrix| (|Integer|))
                                  (|Mapping|
                                   (|Record|
                                    (|:| |Smith| (|Matrix| (|Integer|)))
                                    (|:| |leftEqMat| (|Matrix| (|Integer|)))
                                    (|:| |rightEqMat| (|Matrix| (|Integer|))))
                                   (|Matrix| (|Integer|)))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 41
                                            '(1 6 0 0 7 1 8 6 6 9 2 6 0 10 10
                                              11 1 14 6 6 15 2 10 17 0 0 18 1 6
                                              0 0 19 1 23 0 10 24 3 8 6 6 23 23
                                              25 2 23 26 0 26 27 2 26 17 0 0 28
                                              2 29 0 0 0 30 3 6 0 0 29 29 31 2
                                              32 0 26 26 33 3 6 0 0 29 32 34 3
                                              6 0 0 32 32 35 2 6 0 0 0 36 2 6 0
                                              0 0 37 4 6 26 0 26 26 26 38 2 39
                                              0 26 26 40 2 6 0 0 0 41 1 0 6 6
                                              16 2 0 6 6 12 13 2 0 20 6 21
                                              22)))))
           '|lookupComplete|)) 

(MAKEPROP '|IntegerSmithNormalForm| 'NILADIC T) 
