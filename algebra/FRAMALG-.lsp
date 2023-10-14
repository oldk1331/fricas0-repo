
(/VERSIONCHECK 2) 

(DEFUN |FRAMALG-;convert;SV;1| (|x| $) (SPADCALL |x| (QREFELT $ 10))) 

(DEFUN |FRAMALG-;convert;VS;2| (|v| $) (SPADCALL |v| (QREFELT $ 12))) 

(DEFUN |FRAMALG-;traceMatrix;M;3| ($)
  (SPADCALL (SPADCALL (QREFELT $ 15)) (QREFELT $ 17))) 

(DEFUN |FRAMALG-;discriminant;R;4| ($)
  (SPADCALL (SPADCALL (QREFELT $ 15)) (QREFELT $ 19))) 

(DEFUN |FRAMALG-;regularRepresentation;SM;5| (|x| $)
  (SPADCALL |x| (SPADCALL (QREFELT $ 15)) (QREFELT $ 21))) 

(DEFUN |FRAMALG-;coordinates;VM;6| (|x| $)
  (SPADCALL |x| (SPADCALL (QREFELT $ 15)) (QREFELT $ 23))) 

(DEFUN |FRAMALG-;represents;VS;7| (|x| $)
  (SPADCALL |x| (SPADCALL (QREFELT $ 15)) (QREFELT $ 25))) 

(DEFUN |FRAMALG-;coordinates;VM;8| (|v| $)
  (PROG (#1=#:G142 |i| |j| |m|)
    (RETURN
     (SEQ
      (LETT |m|
            (SPADCALL (QVSIZE |v|) (SPADCALL (QREFELT $ 28))
                      (|spadConstant| $ 29) (QREFELT $ 31))
            . #2=(|FRAMALG-;coordinates;VM;8|))
      (SEQ (LETT |j| 1 . #2#) (LETT |i| (SPADCALL |v| (QREFELT $ 34)) . #2#)
           (LETT #1# (QVSIZE |v|) . #2#) G190 (COND ((> |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |m| |j| (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 10))
                       (QREFELT $ 35))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (|inc_SI| |j|) . #2#)) . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |m|))))) 

(DEFUN |FRAMALG-;regularRepresentation;SM;9| (|x| $)
  (PROG (#1=#:G146 |i| |j| |b| |m| |n|)
    (RETURN
     (SEQ
      (LETT |m|
            (SPADCALL
             (LETT |n| (SPADCALL (QREFELT $ 28))
                   . #2=(|FRAMALG-;regularRepresentation;SM;9|))
             |n| (|spadConstant| $ 29) (QREFELT $ 31))
            . #2#)
      (LETT |b| (SPADCALL (QREFELT $ 15)) . #2#)
      (SEQ (LETT |j| 1 . #2#) (LETT |i| (SPADCALL |b| (QREFELT $ 34)) . #2#)
           (LETT #1# (QVSIZE |b|) . #2#) G190 (COND ((> |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |m| |j|
                       (SPADCALL
                        (SPADCALL |x| (QAREF1O |b| |i| 1) (QREFELT $ 36))
                        (QREFELT $ 10))
                       (QREFELT $ 35))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (|inc_SI| |j|) . #2#)) . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |m| (QREFELT $ 37))))))) 

(DEFUN |FRAMALG-;characteristicPolynomial;SUP;10| (|x| $)
  (PROG (|mat1| |mat0| |mat00|)
    (RETURN
     (SEQ
      (LETT |mat00| (SPADCALL |x| (QREFELT $ 38))
            . #1=(|FRAMALG-;characteristicPolynomial;SUP;10|))
      (LETT |mat0| (SPADCALL (ELT $ 39) |mat00| (QREFELT $ 43)) . #1#)
      (LETT |mat1|
            (SPADCALL (SPADCALL (QREFELT $ 28))
                      (SPADCALL (|spadConstant| $ 45) 1 (QREFELT $ 46))
                      (QREFELT $ 47))
            . #1#)
      (EXIT
       (SPADCALL (SPADCALL |mat1| |mat0| (QREFELT $ 48)) (QREFELT $ 49))))))) 

(DEFUN |FRAMALG-;minimalPolynomial;SUP;11| (|x| $)
  (PROG (#1=#:G152 #2=#:G151 #3=#:G153 #4=#:G157 |i| |v| |y| #5=#:G156 |m| |n|)
    (RETURN
     (SEQ
      (LETT |y| (|spadConstant| $ 44)
            . #6=(|FRAMALG-;minimalPolynomial;SUP;11|))
      (LETT |n| (SPADCALL (QREFELT $ 28)) . #6#)
      (LETT |m| (SPADCALL |n| (+ |n| 1) (QREFELT $ 51)) . #6#)
      (SEQ (LETT |i| 1 . #6#) (LETT #5# (+ |n| 1) . #6#) G190
           (COND ((|greater_SI| |i| #5#) (GO G191)))
           (SEQ (SPADCALL |m| |i| (SPADCALL |y| (QREFELT $ 10)) (QREFELT $ 52))
                (EXIT (LETT |y| (SPADCALL |y| |x| (QREFELT $ 36)) . #6#)))
           (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
      (LETT |v| (|SPADfirst| (SPADCALL |m| (QREFELT $ 54))) . #6#)
      (EXIT
       (PROGN
        (LETT #1# NIL . #6#)
        (SEQ (LETT |i| 0 . #6#) (LETT #4# (- (QVSIZE |v|) 1) . #6#) G190
             (COND ((|greater_SI| |i| #4#) (GO G191)))
             (SEQ
              (EXIT
               (PROGN
                (LETT #3#
                      (SPADCALL (SPADCALL |v| (+ |i| 1) (QREFELT $ 55)) |i|
                                (QREFELT $ 46))
                      . #6#)
                (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 56)) . #6#))
                      ('T (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
             (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
        (COND (#1# #2#) ('T (|spadConstant| $ 57))))))))) 

(DEFUN |FramedAlgebra&| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FramedAlgebra&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|FramedAlgebra&| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 59) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#3| '(|CommutativeRing|))
        (QSETREFV $ 50
                  (CONS
                   (|dispatchFunction|
                    |FRAMALG-;characteristicPolynomial;SUP;10|)
                   $))))
      (COND
       ((|HasCategory| |#2| '(|Field|))
        (QSETREFV $ 58
                  (CONS
                   (|dispatchFunction| |FRAMALG-;minimalPolynomial;SUP;11|)
                   $))))
      $)))) 

(MAKEPROP '|FramedAlgebra&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Vector| 7) (0 . |coordinates|)
              |FRAMALG-;convert;SV;1| (5 . |represents|)
              |FRAMALG-;convert;VS;2| (|Vector| $) (10 . |basis|) (|Matrix| 7)
              (14 . |traceMatrix|) |FRAMALG-;traceMatrix;M;3|
              (19 . |discriminant|) |FRAMALG-;discriminant;R;4|
              (24 . |regularRepresentation|)
              |FRAMALG-;regularRepresentation;SM;9| (30 . |coordinates|)
              |FRAMALG-;coordinates;VM;8| (36 . |represents|)
              |FRAMALG-;represents;VS;7| (|PositiveInteger|) (42 . |rank|)
              (46 . |Zero|) (|NonNegativeInteger|) (50 . |new|) (|Integer|)
              (|Vector| 6) (57 . |minIndex|) (62 . |setRow!|) (69 . *)
              (75 . |transpose|) (80 . |regularRepresentation|) (85 . |coerce|)
              (|Matrix| 8) (|Mapping| 8 7)
              (|MatrixCategoryFunctions2| 7 9 9 16 8 (|Vector| 8) (|Vector| 8)
                                          40)
              (90 . |map|) (96 . |One|) (100 . |One|) (104 . |monomial|)
              (110 . |scalarMatrix|) (116 . -) (122 . |determinant|)
              (127 . |characteristicPolynomial|) (132 . |zero|)
              (138 . |setColumn!|) (|List| 9) (145 . |nullSpace|) (150 . |elt|)
              (156 . +) (162 . |Zero|) (166 . |minimalPolynomial|))
           '#(|traceMatrix| 171 |represents| 175 |regularRepresentation| 180
              |minimalPolynomial| 185 |discriminant| 190 |coordinates| 194
              |convert| 199 |characteristicPolynomial| 209)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 58
                                                 '(1 6 9 0 10 1 6 0 9 12 0 6 14
                                                   15 1 6 16 14 17 1 6 7 14 19
                                                   2 6 16 0 14 21 2 6 16 14 14
                                                   23 2 6 0 9 14 25 0 6 27 28 0
                                                   7 0 29 3 16 0 30 30 7 31 1
                                                   33 32 0 34 3 16 0 0 32 9 35
                                                   2 6 0 0 0 36 1 16 0 0 37 1 6
                                                   16 0 38 1 8 0 7 39 2 42 40
                                                   41 16 43 0 6 0 44 0 7 0 45 2
                                                   8 0 7 30 46 2 40 0 30 8 47 2
                                                   40 0 0 0 48 1 40 8 0 49 1 0
                                                   8 0 50 2 16 0 30 30 51 3 16
                                                   0 0 32 9 52 1 16 53 0 54 2 9
                                                   7 0 32 55 2 8 0 0 0 56 0 8 0
                                                   57 1 0 8 0 58 0 0 16 18 1 0
                                                   0 9 26 1 0 16 0 22 1 0 8 0
                                                   58 0 0 7 20 1 0 16 14 24 1 0
                                                   0 9 13 1 0 9 0 11 1 0 8 0
                                                   50)))))
           '|lookupComplete|)) 
