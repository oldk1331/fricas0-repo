
(/VERSIONCHECK 2) 

(DEFUN |M3D;matrixConcat3D;S3$;1| (|dir| |mat1| |mat2| $)
  (PROG (|retVal| #1=#:G153 |j| |temp| #2=#:G152 |i| #3=#:G151 |matRep2|
         |matRep1| |kDim2| |jDim2| |iDim2| |kDim1| |jDim1| |iDim1| |mat2Dim|
         |mat1Dim|)
    (RETURN
     (SEQ
      (COND
       ((NULL (EQUAL |dir| '|i|))
        (COND
         ((NULL (EQUAL |dir| '|j|))
          (COND
           ((NULL (EQUAL |dir| '|k|))
            (EXIT (|error| "the axis of concatenation must be i,j or k"))))))))
      (LETT |mat1Dim| (SPADCALL |mat1| (QREFELT $ 8))
            . #4=(|M3D;matrixConcat3D;S3$;1|))
      (LETT |mat2Dim| (SPADCALL |mat2| (QREFELT $ 8)) . #4#)
      (LETT |iDim1| (SPADCALL |mat1Dim| 1 (QREFELT $ 11)) . #4#)
      (LETT |jDim1| (SPADCALL |mat1Dim| 2 (QREFELT $ 11)) . #4#)
      (LETT |kDim1| (SPADCALL |mat1Dim| 3 (QREFELT $ 11)) . #4#)
      (LETT |iDim2| (SPADCALL |mat2Dim| 1 (QREFELT $ 11)) . #4#)
      (LETT |jDim2| (SPADCALL |mat2Dim| 2 (QREFELT $ 11)) . #4#)
      (LETT |kDim2| (SPADCALL |mat2Dim| 3 (QREFELT $ 11)) . #4#)
      (LETT |matRep1|
            (SPADCALL (SPADCALL |mat1| (QREFELT $ 12)) (QREFELT $ 13)) . #4#)
      (LETT |matRep2|
            (SPADCALL (SPADCALL |mat2| (QREFELT $ 12)) (QREFELT $ 13)) . #4#)
      (COND
       ((EQUAL |dir| '|i|)
        (COND
         ((EQL |jDim1| |jDim2|)
          (COND
           ((EQL |kDim1| |kDim2|)
            (LETT |retVal|
                  (SPADCALL (SPADCALL |matRep1| |matRep2| (QREFELT $ 14))
                            (QREFELT $ 15))
                  . #4#))
           (#5='T (|error| #6="jxk do not agree"))))
         (#5# (|error| #6#)))))
      (COND
       ((EQUAL |dir| '|j|)
        (COND
         ((EQL |iDim1| |iDim2|)
          (COND
           ((EQL |kDim1| |kDim2|)
            (SEQ
             (SEQ (LETT |i| 0 . #4#) (LETT #3# (- |iDim1| 1) . #4#) G190
                  (COND ((|greater_SI| |i| #3#) (GO G191)))
                  (SEQ
                   (EXIT
                    (QSETAREF1 |matRep1| |i|
                               (SPADCALL (QAREF1 |matRep1| |i|)
                                         (QAREF1 |matRep2| |i|)
                                         (QREFELT $ 17)))))
                  (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
             (EXIT (LETT |retVal| (SPADCALL |matRep1| (QREFELT $ 15)) . #4#))))
           (#5# (|error| #7="ixk do not agree"))))
         (#5# (|error| #7#)))))
      (COND
       ((EQUAL |dir| '|k|)
        (COND
         ((EQL |iDim1| |iDim2|)
          (COND
           ((EQL |jDim1| |jDim2|)
            (SEQ
             (SEQ (LETT |i| 0 . #4#) (LETT #2# (- |iDim1| 1) . #4#) G190
                  (COND ((|greater_SI| |i| #2#) (GO G191)))
                  (SEQ
                   (LETT |temp|
                         (SPADCALL (QAREF1 |matRep1| |i|) (QREFELT $ 18))
                         . #4#)
                   (SEQ (LETT |j| 0 . #4#) (LETT #1# (- |jDim1| 1) . #4#) G190
                        (COND ((|greater_SI| |j| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (QSETAREF1 |temp| |j|
                                     (SPADCALL
                                      (QAREF1 (QAREF1 |matRep1| |i|) |j|)
                                      (QAREF1 (QAREF1 |matRep2| |i|) |j|)
                                      (QREFELT $ 20)))))
                        (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT (QSETAREF1 |matRep1| |i| |temp|)))
                  (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
             (EXIT (LETT |retVal| (SPADCALL |matRep1| (QREFELT $ 15)) . #4#))))
           (#5# (|error| #8="ixj do not agree"))))
         (#5# (|error| #8#)))))
      (EXIT |retVal|))))) 

(DEFUN |M3D;matrixDimensions;$V;2| (|mat| $)
  (PROG (|retVal| |kDim| |matRep3| |jDim| |matRep2| |iDim| |matRep|)
    (RETURN
     (SEQ
      (LETT |matRep| (SPADCALL |mat| (QREFELT $ 12))
            . #1=(|M3D;matrixDimensions;$V;2|))
      (LETT |iDim| (QVSIZE |matRep|) . #1#)
      (LETT |matRep2| (QAREF1 |matRep| 0) . #1#)
      (LETT |jDim| (QVSIZE |matRep2|) . #1#)
      (LETT |matRep3| (QAREF1 |matRep2| 0) . #1#)
      (LETT |kDim| (QVSIZE |matRep3|) . #1#)
      (LETT |retVal| (SPADCALL 3 0 (QREFELT $ 23)) . #1#)
      (SPADCALL |retVal| 1 |iDim| (QREFELT $ 24))
      (SPADCALL |retVal| 2 |jDim| (QREFELT $ 24))
      (SPADCALL |retVal| 3 |kDim| (QREFELT $ 24)) (EXIT |retVal|))))) 

(PUT '|M3D;coerce;Pa$;3| '|SPADreplace| '(XLAM (|matrixRep|) |matrixRep|)) 

(DEFUN |M3D;coerce;Pa$;3| (|matrixRep| $) |matrixRep|) 

(PUT '|M3D;coerce;$Pa;4| '|SPADreplace| '(XLAM (|mat|) |mat|)) 

(DEFUN |M3D;coerce;$Pa;4| (|mat| $) |mat|) 

(DEFUN |M3D;elt;$3NniR;5| (|mat| |i| |j| |k| $)
  (PROG (|matrixRep| |kLength| |jLength| |iLength| |matDims|)
    (RETURN
     (SEQ
      (LETT |matDims| (SPADCALL |mat| (QREFELT $ 8)) . #1=(|M3D;elt;$3NniR;5|))
      (LETT |iLength| (SPADCALL |matDims| 1 (QREFELT $ 11)) . #1#)
      (LETT |jLength| (SPADCALL |matDims| 2 (QREFELT $ 11)) . #1#)
      (LETT |kLength| (SPADCALL |matDims| 3 (QREFELT $ 11)) . #1#)
      (COND
       ((OR
         (OR
          (OR
           (OR
            (OR (SPADCALL |i| |iLength| (QREFELT $ 26))
                (SPADCALL |j| |jLength| (QREFELT $ 26)))
            (SPADCALL |k| |kLength| (QREFELT $ 26)))
           (EQL |i| 0))
          (EQL |j| 0))
         (EQL |k| 0))
        (EXIT
         (|error| "coordinates must be within the bounds of the matrix"))))
      (LETT |matrixRep| (SPADCALL |mat| (QREFELT $ 12)) . #1#)
      (EXIT
       (QAREF1 (QAREF1 (QAREF1 |matrixRep| (- |i| 1)) (- |j| 1)) (- |k| 1))))))) 

(DEFUN |M3D;setelt!;$3Nni2R;6| (|mat| |i| |j| |k| |val| $)
  (PROG (|row1| |row2| |matrixRep| |kLength| |jLength| |iLength| |matDims|)
    (RETURN
     (SEQ
      (LETT |matDims| (SPADCALL |mat| (QREFELT $ 8))
            . #1=(|M3D;setelt!;$3Nni2R;6|))
      (LETT |iLength| (SPADCALL |matDims| 1 (QREFELT $ 11)) . #1#)
      (LETT |jLength| (SPADCALL |matDims| 2 (QREFELT $ 11)) . #1#)
      (LETT |kLength| (SPADCALL |matDims| 3 (QREFELT $ 11)) . #1#)
      (COND
       ((OR
         (OR
          (OR
           (OR
            (OR (SPADCALL |i| |iLength| (QREFELT $ 26))
                (SPADCALL |j| |jLength| (QREFELT $ 26)))
            (SPADCALL |k| |kLength| (QREFELT $ 26)))
           (EQL |i| 0))
          (EQL |j| 0))
         (EQL |k| 0))
        (EXIT
         (|error| "coordinates must be within the bounds of the matrix"))))
      (LETT |matrixRep| (SPADCALL |mat| (QREFELT $ 12)) . #1#)
      (LETT |row2| (SPADCALL (QAREF1 |matrixRep| (- |i| 1)) (QREFELT $ 18))
            . #1#)
      (LETT |row1| (SPADCALL (QAREF1 |row2| (- |j| 1)) (QREFELT $ 28)) . #1#)
      (QSETAREF1 |row1| (- |k| 1) |val|) (QSETAREF1 |row2| (- |j| 1) |row1|)
      (QSETAREF1 |matrixRep| (- |i| 1) |row2|) (EXIT |val|))))) 

(DEFUN |M3D;zeroMatrix;3Nni$;7| (|iLength| |jLength| |kLength| $)
  (SPADCALL
   (MAKEARR1 |iLength|
             (MAKEARR1 |jLength| (MAKEARR1 |kLength| (|spadConstant| $ 30))))
   (QREFELT $ 15))) 

(DEFUN |M3D;identityMatrix;Nni$;8| (|iLength| $)
  (PROG (|row2| |row1| #1=#:G167 |count| |row2empty| |row1empty| |retValueRep|)
    (RETURN
     (SEQ
      (LETT |retValueRep|
            (SPADCALL (SPADCALL |iLength| |iLength| |iLength| (QREFELT $ 31))
                      (QREFELT $ 12))
            . #2=(|M3D;identityMatrix;Nni$;8|))
      (LETT |row1empty| (MAKEARR1 |iLength| (|spadConstant| $ 30)) . #2#)
      (LETT |row2empty|
            (MAKEARR1 |iLength| (SPADCALL |row1empty| (QREFELT $ 28))) . #2#)
      (SEQ (LETT |count| 0 . #2#) (LETT #1# (- |iLength| 1) . #2#) G190
           (COND ((|greater_SI| |count| #1#) (GO G191)))
           (SEQ (LETT |row1| (SPADCALL |row1empty| (QREFELT $ 28)) . #2#)
                (QSETAREF1 |row1| |count| (|spadConstant| $ 32))
                (LETT |row2| (SPADCALL |row2empty| (QREFELT $ 18)) . #2#)
                (QSETAREF1 |row2| |count| (SPADCALL |row1| (QREFELT $ 28)))
                (EXIT
                 (QSETAREF1 |retValueRep| |count|
                            (SPADCALL |row2| (QREFELT $ 18)))))
           (LETT |count| (|inc_SI| |count|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |retValueRep| (QREFELT $ 15))))))) 

(DEFUN |M3D;plus;3$;9| (|mat1| |mat2| $)
  (PROG (|resultMatrix| |sum| |k| |j| |i| |row3| |row2| |row1| |kLength2|
         |jLength2| |iLength2| |mat2Dims| |kLength1| |jLength1| |iLength1|
         |mat1Dims|)
    (RETURN
     (SEQ
      (LETT |mat1Dims| (SPADCALL |mat1| (QREFELT $ 8)) . #1=(|M3D;plus;3$;9|))
      (LETT |iLength1| (SPADCALL |mat1Dims| 1 (QREFELT $ 11)) . #1#)
      (LETT |jLength1| (SPADCALL |mat1Dims| 2 (QREFELT $ 11)) . #1#)
      (LETT |kLength1| (SPADCALL |mat1Dims| 3 (QREFELT $ 11)) . #1#)
      (LETT |mat2Dims| (SPADCALL |mat2| (QREFELT $ 8)) . #1#)
      (LETT |iLength2| (SPADCALL |mat2Dims| 1 (QREFELT $ 11)) . #1#)
      (LETT |jLength2| (SPADCALL |mat2Dims| 2 (QREFELT $ 11)) . #1#)
      (LETT |kLength2| (SPADCALL |mat2Dims| 3 (QREFELT $ 11)) . #1#)
      (COND
       ((EQL |iLength1| |iLength2|)
        (COND
         ((EQL |jLength1| |jLength2|)
          (COND
           ((NULL (EQL |kLength1| |kLength2|))
            (EXIT (|error| #2="error the matrices are different sizes")))))
         (#3='T (EXIT (|error| #2#)))))
       (#3# (EXIT (|error| #2#))))
      (LETT |row1| (MAKEARR1 |kLength1| (|spadConstant| $ 30)) . #1#)
      (LETT |row2| (MAKEARR1 |jLength1| (SPADCALL |row1| (QREFELT $ 28)))
            . #1#)
      (LETT |row3| (MAKEARR1 |iLength1| (SPADCALL |row2| (QREFELT $ 18)))
            . #1#)
      (SEQ (LETT |i| 1 . #1#) G190
           (COND ((|greater_SI| |i| |iLength1|) (GO G191)))
           (SEQ
            (SEQ (LETT |j| 1 . #1#) G190
                 (COND ((|greater_SI| |j| |jLength1|) (GO G191)))
                 (SEQ
                  (SEQ (LETT |k| 1 . #1#) G190
                       (COND ((|greater_SI| |k| |kLength1|) (GO G191)))
                       (SEQ
                        (LETT |sum|
                              (SPADCALL
                               (SPADCALL |mat1| |i| |j| |k| (QREFELT $ 27))
                               (SPADCALL |mat2| |i| |j| |k| (QREFELT $ 27))
                               (QREFELT $ 34))
                              . #1#)
                        (EXIT (QSETAREF1 |row1| (- |k| 1) |sum|)))
                       (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT
                   (QSETAREF1 |row2| (- |j| 1)
                              (SPADCALL |row1| (QREFELT $ 28)))))
                 (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (QSETAREF1 |row3| (- |i| 1) (SPADCALL |row2| (QREFELT $ 18)))))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (LETT |resultMatrix| |row3| . #1#) (EXIT |resultMatrix|))))) 

(DEFUN |M3D;construct;L$;10| (|listRep| $)
  (PROG (|resultMatrix| |element| |k| |j| |i| |row3| |row2| |row1| #1=#:G178
         #2=#:G193 |subSubList| #3=#:G192 |subList| |kLength| |jLength|
         |iLength|)
    (RETURN
     (SEQ
      (COND
       ((OR (EQL (LENGTH |listRep|) 0)
            (OR (EQL (LENGTH (SPADCALL |listRep| 1 (QREFELT $ 38))) 0)
                (EQL
                 (LENGTH
                  (SPADCALL (SPADCALL |listRep| 1 (QREFELT $ 38)) 1
                            (QREFELT $ 40)))
                 0)))
        (|error| "empty list"))
       ('T
        (SEQ (LETT |iLength| (LENGTH |listRep|) . #4=(|M3D;construct;L$;10|))
             (LETT |jLength| (LENGTH (SPADCALL |listRep| 1 (QREFELT $ 38)))
                   . #4#)
             (LETT |kLength|
                   (LENGTH
                    (SPADCALL (SPADCALL |listRep| 1 (QREFELT $ 38)) 1
                              (QREFELT $ 40)))
                   . #4#)
             (SEQ (LETT |subList| NIL . #4#) (LETT #3# |listRep| . #4#) G190
                  (COND
                   ((OR (ATOM #3#)
                        (PROGN (LETT |subList| (CAR #3#) . #4#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((NULL (EQL (LENGTH |subList|) |jLength|))
                      (|error| "can not have an irregular shaped matrix"))
                     ('T
                      (SEQ
                       (EXIT
                        (SEQ (LETT |subSubList| NIL . #4#)
                             (LETT #2# |subList| . #4#) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN
                                    (LETT |subSubList| (CAR #2#) . #4#)
                                    NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL (EQL (LENGTH |subSubList|) |kLength|))
                                 (PROGN
                                  (LETT #1#
                                        (|error|
                                         "can not have an irregular shaped matrix")
                                        . #4#)
                                  (GO #1#))))))
                             (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                             (EXIT NIL)))
                       #1# (EXIT #1#))))))
                  (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
             (LETT |row1|
                   (MAKEARR1 |kLength|
                             (SPADCALL
                              (SPADCALL (SPADCALL |listRep| 1 (QREFELT $ 38)) 1
                                        (QREFELT $ 40))
                              1 (QREFELT $ 41)))
                   . #4#)
             (LETT |row2| (MAKEARR1 |jLength| (SPADCALL |row1| (QREFELT $ 28)))
                   . #4#)
             (LETT |row3| (MAKEARR1 |iLength| (SPADCALL |row2| (QREFELT $ 18)))
                   . #4#)
             (SEQ (LETT |i| 1 . #4#) G190
                  (COND ((|greater_SI| |i| |iLength|) (GO G191)))
                  (SEQ
                   (SEQ (LETT |j| 1 . #4#) G190
                        (COND ((|greater_SI| |j| |jLength|) (GO G191)))
                        (SEQ
                         (SEQ (LETT |k| 1 . #4#) G190
                              (COND ((|greater_SI| |k| |kLength|) (GO G191)))
                              (SEQ
                               (LETT |element|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |listRep| |i| (QREFELT $ 38))
                                       |j| (QREFELT $ 40))
                                      |k| (QREFELT $ 41))
                                     . #4#)
                               (EXIT (QSETAREF1 |row1| (- |k| 1) |element|)))
                              (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (QSETAREF1 |row2| (- |j| 1)
                                     (SPADCALL |row1| (QREFELT $ 28)))))
                        (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT
                    (QSETAREF1 |row3| (- |i| 1)
                               (SPADCALL |row2| (QREFELT $ 18)))))
                  (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
             (LETT |resultMatrix| |row3| . #4#) (EXIT |resultMatrix|)))))))) 

(DEFUN |ThreeDimensionalMatrix| (#1=#:G198)
  (PROG ()
    (RETURN
     (PROG (#2=#:G199)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|ThreeDimensionalMatrix|)
                                           '|domainEqualList|)
                . #3=(|ThreeDimensionalMatrix|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|ThreeDimensionalMatrix;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ThreeDimensionalMatrix|))))))))))) 

(DEFUN |ThreeDimensionalMatrix;| (|#1|)
  (PROG (|pv$| #1=#:G196 #2=#:G197 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|ThreeDimensionalMatrix|))
      (LETT |dv$| (LIST '|ThreeDimensionalMatrix| DV$1) . #3#)
      (LETT $ (GETREFV 50) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1| '(|SetCategory|))
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           (|HasCategory| |#1|
                                                          '(|SetCategory|)))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #3#)
                                          (OR #2#
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               (|HasCategory| |#1|
                                                              '(|SetCategory|))))
                                          (LETT #1#
                                                (|HasCategory| |#1| '(|Ring|))
                                                . #3#)
                                          (OR
                                           (AND
                                            (|HasCategory| |#1|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            #1#)
                                           (AND
                                            (|HasCategory| |#1|
                                                           (LIST '|Evalable|
                                                                 (|devaluate|
                                                                  |#1|)))
                                            (|HasCategory| |#1|
                                                           '(|SetCategory|))))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|ThreeDimensionalMatrix| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 64))
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 128))
      (AND (|HasCategory| |#1| '(|SetCategory|))
           (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 256))
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 5)
        (PROGN
         (QSETREFV $ 31 (CONS (|dispatchFunction| |M3D;zeroMatrix;3Nni$;7|) $))
         (QSETREFV $ 33
                   (CONS (|dispatchFunction| |M3D;identityMatrix;Nni$;8|) $))
         (QSETREFV $ 35 (CONS (|dispatchFunction| |M3D;plus;3$;9|) $)))))
      $)))) 

(MAKEPROP '|ThreeDimensionalMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PrimitiveArray| 16) (|local| |#1|)
              (|Vector| 9) |M3D;matrixDimensions;$V;2| (|NonNegativeInteger|)
              (|Integer|) (0 . |elt|) |M3D;coerce;$Pa;4| (6 . |copy|)
              (11 . |concat|) |M3D;coerce;Pa$;3| (|PrimitiveArray| 19)
              (17 . |concat|) (23 . |copy|) (|PrimitiveArray| 6)
              (28 . |concat|) (|Symbol|) |M3D;matrixConcat3D;S3$;1|
              (34 . |new|) (40 . |setelt|) (|Boolean|) (47 . >)
              |M3D;elt;$3NniR;5| (53 . |copy|) |M3D;setelt!;$3Nni2R;6|
              (58 . |Zero|) (62 . |zeroMatrix|) (69 . |One|)
              (73 . |identityMatrix|) (78 . +) (84 . |plus|) (|List| 39)
              (|List| 36) (90 . |elt|) (|List| 6) (96 . |elt|) (102 . |elt|)
              |M3D;construct;L$;10| (|Equation| 6) (|List| 43) (|Mapping| 25 6)
              (|Mapping| 6 6) (|OutputForm|) (|String|) (|SingleInteger|))
           '#(~= 108 |zeroMatrix| 114 |size?| 121 |setelt!| 127 |sample| 136
              |plus| 140 |parts| 146 |more?| 151 |members| 157 |member?| 162
              |matrixDimensions| 168 |matrixConcat3D| 173 |map!| 180 |map| 186
              |less?| 192 |latex| 198 |identityMatrix| 203 |hash| 208 |every?|
              213 |eval| 219 |eq?| 245 |empty?| 251 |empty| 256 |elt| 260
              |count| 268 |copy| 280 |construct| 285 |coerce| 290 |any?| 305 =
              311 |#| 317)
           'NIL
           (CONS (|makeByteWordVec2| 6 '(0 0 6 1 0 6 1 4))
                 (CONS
                  '#(|HomogeneousAggregate&| |Aggregate&| |Evalable&|
                     |SetCategory&| NIL |InnerEvalable&| |BasicType&| NIL)
                  (CONS
                   '#((|HomogeneousAggregate| 6) (|Aggregate|) (|Evalable| 6)
                      (|SetCategory|) (|Type|) (|InnerEvalable| 6 6)
                      (|BasicType|) (|CoercibleTo| 47))
                   (|makeByteWordVec2| 49
                                       '(2 7 9 0 10 11 1 5 0 0 13 2 5 0 0 0 14
                                         2 16 0 0 0 17 1 16 0 0 18 2 19 0 0 0
                                         20 2 7 0 9 9 23 3 7 9 0 10 9 24 2 9 25
                                         0 0 26 1 19 0 0 28 0 6 0 30 3 0 0 9 9
                                         9 31 0 6 0 32 1 0 0 9 33 2 6 0 0 0 34
                                         2 0 0 0 0 35 2 37 36 0 10 38 2 36 39 0
                                         10 40 2 39 6 0 10 41 2 1 25 0 0 1 3 5
                                         0 9 9 9 31 2 0 25 0 9 1 5 0 6 0 9 9 9
                                         6 29 0 0 0 1 2 5 0 0 0 35 1 8 39 0 1 2
                                         0 25 0 9 1 1 8 39 0 1 2 9 25 6 0 1 1 0
                                         7 0 8 3 0 0 21 0 0 22 2 7 0 46 0 1 2 0
                                         0 46 0 1 2 0 25 0 9 1 1 1 48 0 1 1 5 0
                                         9 33 1 1 49 0 1 2 8 25 45 0 1 3 2 0 0
                                         39 39 1 2 2 0 0 43 1 3 2 0 0 6 6 1 2 2
                                         0 0 44 1 2 0 25 0 0 1 1 0 25 0 1 0 0 0
                                         1 4 0 6 0 9 9 9 27 2 9 9 6 0 1 2 8 9
                                         45 0 1 1 0 0 0 1 1 0 0 37 42 1 3 47 0
                                         1 1 0 0 5 15 1 0 5 0 12 2 8 25 45 0 1
                                         2 1 25 0 0 1 1 8 9 0 1)))))
           '|lookupComplete|)) 
