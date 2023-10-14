
(SDEFUN |UGAUSS;pre_gauss0|
        ((|m| |Matrix| (|Integer|)) (|pivotsj| |Vector| (|Integer|))
         (|pivotsk| |Vector| (|Integer|)) ($ |Void|))
        (SPROG
         ((|l| NIL) (|pp| (|Integer|)) (|n| NIL) (|ml| #1=(|Integer|))
          (|l0| (|Integer|)) (#2=#:G128 NIL) (|pv| #1#) (|i| NIL)
          (|k| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|)))
         (SEQ (LETT |j| (ANROWS |m|) . #3=(|UGAUSS;pre_gauss0|))
              (LETT |k| (ANCOLS |m|) . #3#)
              (EXIT
               (SEQ (LETT |i| 1 . #3#) G190
                    (COND ((|greater_SI| |i| |j|) (GO G191)))
                    (SEQ
                     (SEQ
                      (EXIT
                       (SEQ (LETT |l| 1 . #3#) G190
                            (COND ((|greater_SI| |l| |k|) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL
                                 (SPADCALL |pivotsk| |l| (QREFELT $ 8)) 0
                                 (QREFELT $ 10))
                                "iterate")
                               ('T
                                (SEQ
                                 (LETT |pv| (QAREF2O |m| |i| |l| 1 1) . #3#)
                                 (EXIT
                                  (COND
                                   ((OR (EQL |pv| 1) (EQL |pv| -1))
                                    (SEQ
                                     (SPADCALL |pivotsj| |i| |l|
                                               (QREFELT $ 11))
                                     (SPADCALL |pivotsk| |l| |i|
                                               (QREFELT $ 11))
                                     (EXIT
                                      (PROGN
                                       (LETT #2# |$NoValue| . #3#)
                                       (GO #4=#:G117))))))))))))
                            (LETT |l| (|inc_SI| |l|) . #3#) (GO G190) G191
                            (EXIT NIL)))
                      #4# (EXIT #2#))
                     (EXIT
                      (COND
                       ((EQL (SPADCALL |pivotsj| |i| (QREFELT $ 8)) 0)
                        "iterate")
                       ('T
                        (SEQ
                         (LETT |l0| (SPADCALL |pivotsj| |i| (QREFELT $ 8))
                               . #3#)
                         (LETT |ml| (QAREF2O |m| |i| |l0| 1 1) . #3#)
                         (EXIT
                          (SEQ (LETT |n| 1 . #3#) G190
                               (COND ((|greater_SI| |n| |j|) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((EQL (QAREF1O |pivotsj| |n| 1) 0)
                                   (COND
                                    ((SPADCALL (QAREF2O |m| |n| |l0| 1 1) 0
                                               (QREFELT $ 10))
                                     (SEQ
                                      (LETT |pp|
                                            (-
                                             (* |ml|
                                                (QAREF2O |m| |n| |l0| 1 1)))
                                            . #3#)
                                      (EXIT
                                       (SEQ (LETT |l| 1 . #3#) G190
                                            (COND
                                             ((|greater_SI| |l| |k|)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (QSETAREF2O |m| |n| |l|
                                                          (+
                                                           (QAREF2O |m| |n| |l|
                                                                    1 1)
                                                           (* |pp|
                                                              (QAREF2O |m| |i|
                                                                       |l| 1
                                                                       1)))
                                                          1 1)))
                                            (LETT |l| (|inc_SI| |l|) . #3#)
                                            (GO G190) G191 (EXIT NIL))))))))))
                               (LETT |n| (|inc_SI| |n|) . #3#) (GO G190) G191
                               (EXIT NIL))))))))
                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                    (EXIT NIL)))))) 

(SDEFUN |UGAUSS;pre_gauss;2M;2|
        ((|m| |Matrix| (|Integer|)) ($ |Matrix| (|Integer|)))
        (SPROG
         ((|pivotsk| #1=(|Vector| (|Integer|))) (|pivotsj| #1#)
          (|k| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|)))
         (SEQ (LETT |j| (ANROWS |m|) . #2=(|UGAUSS;pre_gauss;2M;2|))
              (LETT |k| (ANCOLS |m|) . #2#)
              (LETT |pivotsj| (SPADCALL |j| (QREFELT $ 13)) . #2#)
              (LETT |pivotsk| (SPADCALL |k| (QREFELT $ 13)) . #2#)
              (|UGAUSS;pre_gauss0| |m| |pivotsj| |pivotsk| $) (EXIT |m|)))) 

(SDEFUN |UGAUSS;pre_smith;2M;3|
        ((|m| |Matrix| (|Integer|)) ($ |Matrix| (|Integer|)))
        (SPROG
         ((|l0| #1=(|NonNegativeInteger|)) (|l| NIL) (|i0| #1#) (|i| NIL)
          (|ress| (|Matrix| (|Integer|))) (#2=#:G134 NIL) (#3=#:G133 NIL)
          (|count| #1#) (|pivotsk| #4=(|Vector| (|Integer|))) (|pivotsj| #4#)
          (|k| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|)))
         (SEQ (LETT |j| (ANROWS |m|) . #5=(|UGAUSS;pre_smith;2M;3|))
              (LETT |k| (ANCOLS |m|) . #5#)
              (LETT |pivotsj| (SPADCALL |j| (QREFELT $ 13)) . #5#)
              (LETT |pivotsk| (SPADCALL |k| (QREFELT $ 13)) . #5#)
              (|UGAUSS;pre_gauss0| |m| |pivotsj| |pivotsk| $)
              (LETT |count| 0 . #5#)
              (SEQ (LETT |i| 1 . #5#) G190
                   (COND ((|greater_SI| |i| |j|) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |pivotsj| |i| (QREFELT $ 8)) 0
                                 (QREFELT $ 10))
                       (LETT |count| (+ |count| 1) . #5#)))))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((EQL |count| 0) |m|)
                     ('T
                      (SEQ
                       (LETT |ress|
                             (SPADCALL
                              (PROG1 (LETT #3# (- |j| |count|) . #5#)
                                (|check_subtype| (>= #3# 0)
                                                 '(|NonNegativeInteger|) #3#))
                              (PROG1 (LETT #2# (- |k| |count|) . #5#)
                                (|check_subtype| (>= #2# 0)
                                                 '(|NonNegativeInteger|) #2#))
                              (QREFELT $ 16))
                             . #5#)
                       (LETT |i0| 0 . #5#)
                       (SEQ (LETT |i| 1 . #5#) G190
                            (COND ((|greater_SI| |i| |j|) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((EQL (SPADCALL |pivotsj| |i| (QREFELT $ 8)) 0)
                                (SEQ (LETT |i0| (+ |i0| 1) . #5#)
                                     (LETT |l0| 0 . #5#)
                                     (EXIT
                                      (SEQ (LETT |l| 1 . #5#) G190
                                           (COND
                                            ((|greater_SI| |l| |k|) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (COND
                                              ((EQL (QAREF1O |pivotsk| |l| 1)
                                                    0)
                                               (SEQ
                                                (LETT |l0| (+ |l0| 1) . #5#)
                                                (EXIT
                                                 (QSETAREF2O |ress| |i0| |l0|
                                                             (QAREF2O |m| |i|
                                                                      |l| 1 1)
                                                             1 1)))))))
                                           (LETT |l| (|inc_SI| |l|) . #5#)
                                           (GO G190) G191 (EXIT NIL))))))))
                            (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |ress|)))))))) 

(DECLAIM (NOTINLINE |UnitGaussianElimination;|)) 

(DEFUN |UnitGaussianElimination| ()
  (SPROG NIL
         (PROG (#1=#:G145)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|UnitGaussianElimination|)
                    . #2=(|UnitGaussianElimination|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|UnitGaussianElimination|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|UnitGaussianElimination;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|UnitGaussianElimination|)))))))))) 

(DEFUN |UnitGaussianElimination;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|UnitGaussianElimination|)
                . #1=(|UnitGaussianElimination|))
          (LETT $ (GETREFV 18) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|UnitGaussianElimination| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|UnitGaussianElimination| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|Vector| 6) (0 . |elt|)
              (|Boolean|) (6 . ~=) (12 . |setelt!|) (|NonNegativeInteger|)
              (19 . |zero|) (|Matrix| 6) |UGAUSS;pre_gauss;2M;2| (24 . |zero|)
              |UGAUSS;pre_smith;2M;3|)
           '#(|pre_smith| 30 |pre_gauss| 35) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 17
                                                 '(2 7 6 0 6 8 2 6 9 0 0 10 3 7
                                                   6 0 6 6 11 1 7 0 12 13 2 14
                                                   0 12 12 16 1 0 14 14 17 1 0
                                                   14 14 15)))))
           '|lookupComplete|)) 

(MAKEPROP '|UnitGaussianElimination| 'NILADIC T) 
