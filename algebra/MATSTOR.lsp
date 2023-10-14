
(/VERSIONCHECK 2) 

(PUT '|MATSTOR;rep| '|SPADreplace| '(XLAM (|m|) |m|)) 

(DEFUN |MATSTOR;rep| (|m| $) |m|) 

(DEFUN |MATSTOR;copy!;3M;2| (|c| |a| $)
  (PROG (#1=#:G163 |j| |cRow| |aRow| #2=#:G162 |i| |cc| |aa| |n| |m|)
    (RETURN
     (SEQ (LETT |m| (ANROWS |a|) . #3=(|MATSTOR;copy!;3M;2|))
          (LETT |n| (ANCOLS |a|) . #3#)
          (COND
           ((EQL (ANROWS |c|) |m|)
            (COND
             ((NULL (EQL (ANCOLS |c|) |n|))
              (EXIT
               (|error| #4="copy!: matrices of incompatible dimensions")))))
           ('T (EXIT (|error| #4#))))
          (LETT |aa| (|MATSTOR;rep| |a| $) . #3#)
          (LETT |cc| (|MATSTOR;rep| |c| $) . #3#)
          (SEQ (LETT |i| 0 . #3#) (LETT #2# (- |m| 1) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |aRow| (QAREF1 |aa| |i|) . #3#)
                    (LETT |cRow| (QAREF1 |cc| |i|) . #3#)
                    (EXIT
                     (SEQ (LETT |j| 0 . #3#) (LETT #1# (- |n| 1) . #3#) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT (QSETAREF1 |cRow| |j| (QAREF1 |aRow| |j|))))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |c|))))) 

(DEFUN |MATSTOR;plus!;4M;3| (|c| |a| |b| $)
  (PROG (#1=#:G174 |j| |cRow| |bRow| |aRow| #2=#:G173 |i| |cc| |bb| |aa| |n|
         |m|)
    (RETURN
     (SEQ (LETT |m| (ANROWS |a|) . #3=(|MATSTOR;plus!;4M;3|))
          (LETT |n| (ANCOLS |a|) . #3#)
          (COND
           ((EQL (ANROWS |b|) |m|)
            (COND
             ((NULL (EQL (ANCOLS |b|) |n|))
              (EXIT
               (|error| #4="plus!: matrices of incompatible dimensions")))))
           (#5='T (EXIT (|error| #4#))))
          (COND
           ((EQL (ANROWS |c|) |m|)
            (COND
             ((NULL (EQL (ANCOLS |c|) |n|))
              (EXIT
               (|error| #6="plus!: matrices of incompatible dimensions")))))
           (#5# (EXIT (|error| #6#))))
          (LETT |aa| (|MATSTOR;rep| |a| $) . #3#)
          (LETT |bb| (|MATSTOR;rep| |b| $) . #3#)
          (LETT |cc| (|MATSTOR;rep| |c| $) . #3#)
          (SEQ (LETT |i| 0 . #3#) (LETT #2# (- |m| 1) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |aRow| (QAREF1 |aa| |i|) . #3#)
                    (LETT |bRow| (QAREF1 |bb| |i|) . #3#)
                    (LETT |cRow| (QAREF1 |cc| |i|) . #3#)
                    (EXIT
                     (SEQ (LETT |j| 0 . #3#) (LETT #1# (- |n| 1) . #3#) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF1 |cRow| |j|
                                       (SPADCALL (QAREF1 |aRow| |j|)
                                                 (QAREF1 |bRow| |j|)
                                                 (QREFELT $ 10)))))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |c|))))) 

(DEFUN |MATSTOR;minus!;3M;4| (|c| |a| $)
  (PROG (#1=#:G183 |j| |cRow| |aRow| #2=#:G182 |i| |cc| |aa| |n| |m|)
    (RETURN
     (SEQ (LETT |m| (ANROWS |a|) . #3=(|MATSTOR;minus!;3M;4|))
          (LETT |n| (ANCOLS |a|) . #3#)
          (COND
           ((EQL (ANROWS |c|) |m|)
            (COND
             ((NULL (EQL (ANCOLS |c|) |n|))
              (EXIT
               (|error| #4="minus!: matrices of incompatible dimensions")))))
           ('T (EXIT (|error| #4#))))
          (LETT |aa| (|MATSTOR;rep| |a| $) . #3#)
          (LETT |cc| (|MATSTOR;rep| |c| $) . #3#)
          (SEQ (LETT |i| 0 . #3#) (LETT #2# (- |m| 1) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |aRow| (QAREF1 |aa| |i|) . #3#)
                    (LETT |cRow| (QAREF1 |cc| |i|) . #3#)
                    (EXIT
                     (SEQ (LETT |j| 0 . #3#) (LETT #1# (- |n| 1) . #3#) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF1 |cRow| |j|
                                       (SPADCALL (QAREF1 |aRow| |j|)
                                                 (QREFELT $ 12)))))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |c|))))) 

(DEFUN |MATSTOR;minus!;4M;5| (|c| |a| |b| $)
  (PROG (#1=#:G194 |j| |cRow| |bRow| |aRow| #2=#:G193 |i| |cc| |bb| |aa| |n|
         |m|)
    (RETURN
     (SEQ (LETT |m| (ANROWS |a|) . #3=(|MATSTOR;minus!;4M;5|))
          (LETT |n| (ANCOLS |a|) . #3#)
          (COND
           ((EQL (ANROWS |b|) |m|)
            (COND
             ((NULL (EQL (ANCOLS |b|) |n|))
              (EXIT
               (|error| #4="minus!: matrices of incompatible dimensions")))))
           (#5='T (EXIT (|error| #4#))))
          (COND
           ((EQL (ANROWS |c|) |m|)
            (COND
             ((NULL (EQL (ANCOLS |c|) |n|))
              (EXIT
               (|error| #6="minus!: matrices of incompatible dimensions")))))
           (#5# (EXIT (|error| #6#))))
          (LETT |aa| (|MATSTOR;rep| |a| $) . #3#)
          (LETT |bb| (|MATSTOR;rep| |b| $) . #3#)
          (LETT |cc| (|MATSTOR;rep| |c| $) . #3#)
          (SEQ (LETT |i| 0 . #3#) (LETT #2# (- |m| 1) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |aRow| (QAREF1 |aa| |i|) . #3#)
                    (LETT |bRow| (QAREF1 |bb| |i|) . #3#)
                    (LETT |cRow| (QAREF1 |cc| |i|) . #3#)
                    (EXIT
                     (SEQ (LETT |j| 0 . #3#) (LETT #1# (- |n| 1) . #3#) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF1 |cRow| |j|
                                       (SPADCALL (QAREF1 |aRow| |j|)
                                                 (QAREF1 |bRow| |j|)
                                                 (QREFELT $ 14)))))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |c|))))) 

(DEFUN |MATSTOR;leftScalarTimes!;MR2M;6| (|c| |r| |a| $)
  (PROG (#1=#:G203 |j| |cRow| |aRow| #2=#:G202 |i| |cc| |aa| |n| |m|)
    (RETURN
     (SEQ (LETT |m| (ANROWS |a|) . #3=(|MATSTOR;leftScalarTimes!;MR2M;6|))
          (LETT |n| (ANCOLS |a|) . #3#)
          (COND
           ((EQL (ANROWS |c|) |m|)
            (COND
             ((NULL (EQL (ANCOLS |c|) |n|))
              (EXIT
               (|error|
                #4="leftScalarTimes!: matrices of incompatible dimensions")))))
           ('T (EXIT (|error| #4#))))
          (LETT |aa| (|MATSTOR;rep| |a| $) . #3#)
          (LETT |cc| (|MATSTOR;rep| |c| $) . #3#)
          (SEQ (LETT |i| 0 . #3#) (LETT #2# (- |m| 1) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |aRow| (QAREF1 |aa| |i|) . #3#)
                    (LETT |cRow| (QAREF1 |cc| |i|) . #3#)
                    (EXIT
                     (SEQ (LETT |j| 0 . #3#) (LETT #1# (- |n| 1) . #3#) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF1 |cRow| |j|
                                       (SPADCALL |r| (QAREF1 |aRow| |j|)
                                                 (QREFELT $ 16)))))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |c|))))) 

(DEFUN |MATSTOR;rightScalarTimes!;2MRM;7| (|c| |a| |r| $)
  (PROG (#1=#:G212 |j| |cRow| |aRow| #2=#:G211 |i| |cc| |aa| |n| |m|)
    (RETURN
     (SEQ (LETT |m| (ANROWS |a|) . #3=(|MATSTOR;rightScalarTimes!;2MRM;7|))
          (LETT |n| (ANCOLS |a|) . #3#)
          (COND
           ((EQL (ANROWS |c|) |m|)
            (COND
             ((NULL (EQL (ANCOLS |c|) |n|))
              (EXIT
               (|error|
                #4="rightScalarTimes!: matrices of incompatible dimensions")))))
           ('T (EXIT (|error| #4#))))
          (LETT |aa| (|MATSTOR;rep| |a| $) . #3#)
          (LETT |cc| (|MATSTOR;rep| |c| $) . #3#)
          (SEQ (LETT |i| 0 . #3#) (LETT #2# (- |m| 1) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |aRow| (QAREF1 |aa| |i|) . #3#)
                    (LETT |cRow| (QAREF1 |cc| |i|) . #3#)
                    (EXIT
                     (SEQ (LETT |j| 0 . #3#) (LETT #1# (- |n| 1) . #3#) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF1 |cRow| |j|
                                       (SPADCALL (QAREF1 |aRow| |j|) |r|
                                                 (QREFELT $ 16)))))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |c|))))) 

(DEFUN |MATSTOR;copyCol!| (|bCol| |bb| |j| |n1| $)
  (PROG (|i|)
    (RETURN
     (SEQ (LETT |i| 0 . #1=(|MATSTOR;copyCol!|)) G190
          (COND ((|greater_SI| |i| |n1|) (GO G191)))
          (SEQ (EXIT (QSETAREF1 |bCol| |i| (QAREF1 (QAREF1 |bb| |i|) |j|))))
          (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))))) 

(DEFUN |MATSTOR;times!;4M;9| (|c| |a| |b| $)
  (PROG (|sum| |k| |cRow| |aRow| |i| #1=#:G225 |j| |n1| |m1| |bCol| |cc| |bb|
         |aa| |p| |n| |m|)
    (RETURN
     (SEQ (LETT |m| (ANROWS |a|) . #2=(|MATSTOR;times!;4M;9|))
          (LETT |n| (ANCOLS |a|) . #2#) (LETT |p| (ANCOLS |b|) . #2#)
          (COND
           ((EQL (ANROWS |b|) |n|)
            (COND
             ((EQL (ANROWS |c|) |m|)
              (COND
               ((NULL (EQL (ANCOLS |c|) |p|))
                (EXIT
                 (|error| #3="times!: matrices of incompatible dimensions")))))
             (#4='T (EXIT (|error| #3#)))))
           (#4# (EXIT (|error| #3#))))
          (LETT |aa| (|MATSTOR;rep| |a| $) . #2#)
          (LETT |bb| (|MATSTOR;rep| |b| $) . #2#)
          (LETT |cc| (|MATSTOR;rep| |c| $) . #2#)
          (LETT |bCol| (MAKEARR1 |n| (|spadConstant| $ 19)) . #2#)
          (LETT |m1| (- |m| 1) . #2#) (LETT |n1| (- |n| 1) . #2#)
          (SEQ (LETT |j| 0 . #2#) (LETT #1# (- |p| 1) . #2#) G190
               (COND ((|greater_SI| |j| #1#) (GO G191)))
               (SEQ (|MATSTOR;copyCol!| |bCol| |bb| |j| |n1| $)
                    (EXIT
                     (SEQ (LETT |i| 0 . #2#) G190
                          (COND ((|greater_SI| |i| |m1|) (GO G191)))
                          (SEQ (LETT |aRow| (QAREF1 |aa| |i|) . #2#)
                               (LETT |cRow| (QAREF1 |cc| |i|) . #2#)
                               (LETT |sum| (|spadConstant| $ 19) . #2#)
                               (SEQ (LETT |k| 0 . #2#) G190
                                    (COND ((|greater_SI| |k| |n1|) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |sum|
                                            (SPADCALL |sum|
                                                      (SPADCALL
                                                       (QAREF1 |aRow| |k|)
                                                       (QAREF1 |bCol| |k|)
                                                       (QREFELT $ 16))
                                                      (QREFELT $ 10))
                                            . #2#)))
                                    (LETT |k| (|inc_SI| |k|) . #2#) (GO G190)
                                    G191 (EXIT NIL))
                               (EXIT (QSETAREF1 |cRow| |j| |sum|)))
                          (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                          (EXIT NIL))))
               (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |c|))))) 

(DEFUN |MATSTOR;power!;4MNniM;10| (|a| |b| |c| |m| |p| $)
  (PROG (#1=#:G240 |flag| |nn| |mm|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |mm| (ANROWS |a|) . #2=(|MATSTOR;power!;4MNniM;10|))
            (LETT |nn| (ANCOLS |a|) . #2#)
            (EXIT
             (COND
              ((EQL |mm| |nn|)
               (SEQ
                (COND
                 ((EQL (ANROWS |b|) |mm|)
                  (COND
                   ((NULL (EQL (ANCOLS |b|) |nn|))
                    (EXIT
                     (|error|
                      #3="power!: matrices of incompatible dimensions")))))
                 (#4='T (EXIT (|error| #3#))))
                (COND
                 ((EQL (ANROWS |c|) |mm|)
                  (COND
                   ((NULL (EQL (ANCOLS |c|) |nn|))
                    (EXIT
                     (|error|
                      #5="power!: matrices of incompatible dimensions")))))
                 (#4# (EXIT (|error| #5#))))
                (COND
                 ((EQL (ANROWS |m|) |mm|)
                  (COND
                   ((NULL (EQL (ANCOLS |m|) |nn|))
                    (EXIT
                     (|error|
                      #6="power!: matrices of incompatible dimensions")))))
                 (#4# (EXIT (|error| #6#))))
                (LETT |flag| 'NIL . #2#) (SPADCALL |b| |m| (QREFELT $ 9))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (COND
                        ((ODDP |p|)
                         (COND
                          (|flag|
                           (SEQ (SPADCALL |c| |b| |a| (QREFELT $ 20))
                                (EXIT (SPADCALL |a| |c| (QREFELT $ 9)))))
                          ('T
                           (SEQ (LETT |flag| 'T . #2#)
                                (EXIT (SPADCALL |a| |b| (QREFELT $ 9))))))))
                       (EXIT
                        (COND
                         ((EQL |p| 1) (PROGN (LETT #1# |a| . #2#) (GO #1#)))
                         ('T
                          (SEQ (LETT |p| (QUOTIENT2 |p| 2) . #2#)
                               (SPADCALL |c| |b| |b| (QREFELT $ 20))
                               (EXIT (SPADCALL |b| |c| (QREFELT $ 9))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
              (#4# (|error| "power!: matrix must be square"))))))
      #1# (EXIT #1#))))) 

(DEFUN |MATSTOR;^;MNniM;11| (|m| |n| $)
  (PROG (|c| |b| |a|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |m| (QREFELT $ 24)))
        (|error| "^: matrix must be square"))
       ('T
        (SEQ
         (LETT |a| (SPADCALL |m| (QREFELT $ 25)) . #1=(|MATSTOR;^;MNniM;11|))
         (LETT |b| (SPADCALL |m| (QREFELT $ 25)) . #1#)
         (LETT |c| (SPADCALL |m| (QREFELT $ 25)) . #1#)
         (EXIT (SPADCALL |a| |b| |c| |m| |n| (QREFELT $ 22)))))))))) 

(DECLAIM (NOTINLINE |StorageEfficientMatrixOperations;|)) 

(DEFUN |StorageEfficientMatrixOperations| (#1=#:G244)
  (PROG ()
    (RETURN
     (PROG (#2=#:G245)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|StorageEfficientMatrixOperations|)
                                           '|domainEqualList|)
                . #3=(|StorageEfficientMatrixOperations|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|StorageEfficientMatrixOperations;| #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|StorageEfficientMatrixOperations|))))))))))) 

(DEFUN |StorageEfficientMatrixOperations;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|StorageEfficientMatrixOperations|))
      (LETT |dv$| (LIST '|StorageEfficientMatrixOperations| DV$1) . #1#)
      (LETT $ (GETREFV 27) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|StorageEfficientMatrixOperations|
                  (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|StorageEfficientMatrixOperations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |One|) (|Matrix| 6)
              |MATSTOR;copy!;3M;2| (4 . +) |MATSTOR;plus!;4M;3| (10 . -)
              |MATSTOR;minus!;3M;4| (15 . -) |MATSTOR;minus!;4M;5| (21 . *)
              |MATSTOR;leftScalarTimes!;MR2M;6|
              |MATSTOR;rightScalarTimes!;2MRM;7| (27 . |Zero|)
              |MATSTOR;times!;4M;9| (|NonNegativeInteger|)
              |MATSTOR;power!;4MNniM;10| (|Boolean|) (31 . |square?|)
              (36 . |copy|) |MATSTOR;^;MNniM;11|)
           '#(|times!| 41 |rightScalarTimes!| 48 |power!| 55 |plus!| 64
              |minus!| 71 |leftScalarTimes!| 84 |copy!| 91 ^ 97)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 26
                                                 '(0 6 0 7 2 6 0 0 0 10 1 6 0 0
                                                   12 2 6 0 0 0 14 2 6 0 0 0 16
                                                   0 6 0 19 1 8 23 0 24 1 8 0 0
                                                   25 3 0 8 8 8 8 20 3 0 8 8 8
                                                   6 18 5 0 8 8 8 8 8 21 22 3 0
                                                   8 8 8 8 11 3 0 8 8 8 8 15 2
                                                   0 8 8 8 13 3 0 8 8 6 8 17 2
                                                   0 8 8 8 9 2 0 8 8 21 26)))))
           '|lookupComplete|)) 
