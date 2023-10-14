
(/VERSIONCHECK 2) 

(DEFUN |FRNAALG-;min_poly_from_matrix| (|mx| |x| $)
  (PROG (|res| |i| |vectorOfCoef| |cond| |k|)
    (RETURN
     (SEQ (LETT |k| 1 . #1=(|FRNAALG-;min_poly_from_matrix|))
          (LETT |cond| (SPADCALL |x| (QREFELT $ 9)) . #1#)
          (SEQ G190
               (COND
                ((NULL (EQL (SPADCALL |cond| (QREFELT $ 13)) |k|)) (GO G191)))
               (SEQ (LETT |k| (+ |k| 1) . #1#)
                    (LETT |x| (SPADCALL |mx| |x| (QREFELT $ 17)) . #1#)
                    (EXIT
                     (LETT |cond| (SPADCALL |cond| |x| (QREFELT $ 18)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |vectorOfCoef| (|SPADfirst| (SPADCALL |cond| (QREFELT $ 20)))
                . #1#)
          (LETT |res| (|spadConstant| $ 21) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |k|) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL
                                  (SPADCALL |vectorOfCoef| |i| (QREFELT $ 25))
                                  |i| (QREFELT $ 26))
                                 (QREFELT $ 27))
                       . #1#)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |FRNAALG-;rank_polynomial| (|left| $)
  (PROG (|cijk| |mxjk| |k| |j| |mo| |i| |mx| |x| |symbolsForCoef| #1=#:G154
         #2=#:G156 #3=#:G155 |listOfNumbers| |q| #4=#:G153 |gamma| |b| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (QREFELT $ 11)) . #5=(|FRNAALG-;rank_polynomial|))
      (LETT |b| (SPADCALL (QREFELT $ 29)) . #5#)
      (LETT |gamma| (SPADCALL |b| (QREFELT $ 31)) . #5#)
      (LETT |listOfNumbers|
            (PROGN
             (LETT #4# NIL . #5#)
             (SEQ (LETT |q| 1 . #5#) G190
                  (COND ((|greater_SI| |q| |n|) (GO G191)))
                  (SEQ (EXIT (LETT #4# (CONS (STRINGIMAGE |q|) #4#) . #5#)))
                  (LETT |q| (|inc_SI| |q|) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (LETT |symbolsForCoef|
            (PROGN
             (LETT #3# (GETREFV (SIZE |listOfNumbers|)) . #5#)
             (SEQ (LETT |i| NIL . #5#) (LETT #2# |listOfNumbers| . #5#)
                  (LETT #1# 0 . #5#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #3# #1#
                            (SPADCALL (STRCONC "%" (STRCONC "x" |i|))
                                      (QREFELT $ 34)))))
                  (LETT #1# (PROG1 (|inc_SI| #1#) (LETT #2# (CDR #2#) . #5#))
                        . #5#)
                  (GO G190) G191 (EXIT NIL))
             #3#)
            . #5#)
      (LETT |x| (SPADCALL |n| 1 (|spadConstant| $ 35) (QREFELT $ 36)) . #5#)
      (LETT |mx| (SPADCALL |n| |n| (|spadConstant| $ 35) (QREFELT $ 36)) . #5#)
      (SEQ (LETT |i| 1 . #5#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ
            (LETT |mo|
                  (SPADCALL (|spadConstant| $ 39)
                            (LIST
                             (SPADCALL |symbolsForCoef| |i| (QREFELT $ 41)))
                            (LIST 1) (QREFELT $ 44))
                  . #5#)
            (QSETAREF2O |x| |i| 1 |mo| 1 1)
            (EXIT
             (SEQ (LETT |j| 1 . #5#) G190
                  (COND ((|greater_SI| |j| |n|) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |k| 1 . #5#) G190
                         (COND ((|greater_SI| |k| |n|) (GO G191)))
                         (SEQ (LETT |mxjk| (QAREF2O |mx| |j| |k| 1 1) . #5#)
                              (LETT |cijk|
                                    (COND
                                     ((OR |left| 'T)
                                      (SPADCALL
                                       (SPADCALL |gamma| |j| (QREFELT $ 46))
                                       |i| |k| (QREFELT $ 47))))
                                    . #5#)
                              (EXIT
                               (QSETAREF2O |mx| |j| |k|
                                           (SPADCALL |mxjk|
                                                     (SPADCALL |mo| |cijk|
                                                               (QREFELT $ 48))
                                                     (QREFELT $ 49))
                                           1 1)))
                         (LETT |k| (|inc_SI| |k|) . #5#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
      (EXIT (|FRNAALG-;min_poly_from_matrix| |mx| |x| $)))))) 

(DEFUN |FRNAALG-;leftRankPolynomial;Sup;3| ($)
  (|FRNAALG-;rank_polynomial| 'T $)) 

(DEFUN |FRNAALG-;rightRankPolynomial;Sup;4| ($)
  (|FRNAALG-;rank_polynomial| 'NIL $)) 

(DEFUN |FRNAALG-;leftUnitsInternal| ($)
  (PROG (|j| |addOn| |z| |i| |k| |rhs| |cond| |gamma| |b| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (QREFELT $ 11)) . #1=(|FRNAALG-;leftUnitsInternal|))
      (LETT |b| (SPADCALL (QREFELT $ 29)) . #1#)
      (LETT |gamma| (SPADCALL |b| (QREFELT $ 31)) . #1#)
      (LETT |cond|
            (SPADCALL (SPADCALL |n| 2 (QREFELT $ 52)) |n| (|spadConstant| $ 38)
                      (QREFELT $ 53))
            . #1#)
      (LETT |rhs|
            (MAKEARR1 (SPADCALL |n| 2 (QREFELT $ 52)) (|spadConstant| $ 38))
            . #1#)
      (LETT |z| 0 . #1#) (LETT |addOn| (|spadConstant| $ 38) . #1#)
      (SEQ (LETT |k| 1 . #1#) G190 (COND ((|greater_SI| |k| |n|) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |i| 1 . #1#) G190
                  (COND ((|greater_SI| |i| |n|) (GO G191)))
                  (SEQ (LETT |z| (+ |z| 1) . #1#)
                       (LETT |addOn|
                             (COND ((EQL |k| |i|) (|spadConstant| $ 14))
                                   ('T (|spadConstant| $ 38)))
                             . #1#)
                       (SPADCALL |rhs| |z| |addOn| (QREFELT $ 55))
                       (EXIT
                        (SEQ (LETT |j| 1 . #1#) G190
                             (COND ((|greater_SI| |j| |n|) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |cond| |z| |j|
                                         (SPADCALL
                                          (SPADCALL |gamma| |k| (QREFELT $ 46))
                                          |j| |i| (QREFELT $ 47))
                                         (QREFELT $ 56))))
                             (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                             (EXIT NIL))))
                  (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |cond| |rhs| (QREFELT $ 60))))))) 

(DEFUN |FRNAALG-;leftUnit;U;6| ($)
  (PROG (#1=#:G171 |res|)
    (RETURN
     (SEQ
      (LETT |res| (|FRNAALG-;leftUnitsInternal| $)
            . #2=(|FRNAALG-;leftUnit;U;6|))
      (EXIT
       (COND
        ((QEQCAR (QCAR |res|) 1)
         (SEQ (SPADCALL "this algebra has no left unit" (QREFELT $ 63))
              (EXIT (CONS 1 "failed"))))
        ('T
         (CONS 0
               (SPADCALL
                (PROG2 (LETT #1# (QCAR |res|) . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) (|Vector| (QREFELT $ 7)) #1#))
                (QREFELT $ 64)))))))))) 

(DEFUN |FRNAALG-;leftUnits;U;7| ($)
  (PROG (#1=#:G185 |res|)
    (RETURN
     (SEQ
      (LETT |res| (|FRNAALG-;leftUnitsInternal| $)
            . #2=(|FRNAALG-;leftUnits;U;7|))
      (EXIT
       (COND
        ((QEQCAR (QCAR |res|) 1)
         (SEQ (SPADCALL "this algebra has no left unit" (QREFELT $ 63))
              (EXIT (CONS 1 "failed"))))
        ('T
         (CONS 0
               (CONS
                (SPADCALL
                 (PROG2 (LETT #1# (QCAR |res|) . #2#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 0) (|Vector| (QREFELT $ 7)) #1#))
                 (QREFELT $ 64))
                (SPADCALL (ELT $ 64) (QCDR |res|) (QREFELT $ 71))))))))))) 

(DEFUN |FRNAALG-;rightUnitsInternal| ($)
  (PROG (|j| |addOn| |z| |i| |k| |rhs| |condo| |gamma| |b| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (QREFELT $ 11)) . #1=(|FRNAALG-;rightUnitsInternal|))
      (LETT |b| (SPADCALL (QREFELT $ 29)) . #1#)
      (LETT |gamma| (SPADCALL |b| (QREFELT $ 31)) . #1#)
      (LETT |condo|
            (SPADCALL (SPADCALL |n| 2 (QREFELT $ 52)) |n| (|spadConstant| $ 38)
                      (QREFELT $ 53))
            . #1#)
      (LETT |rhs|
            (MAKEARR1 (SPADCALL |n| 2 (QREFELT $ 52)) (|spadConstant| $ 38))
            . #1#)
      (LETT |z| 0 . #1#) (LETT |addOn| (|spadConstant| $ 38) . #1#)
      (SEQ (LETT |k| 1 . #1#) G190 (COND ((|greater_SI| |k| |n|) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |i| 1 . #1#) G190
                  (COND ((|greater_SI| |i| |n|) (GO G191)))
                  (SEQ (LETT |z| (+ |z| 1) . #1#)
                       (LETT |addOn|
                             (COND ((EQL |k| |i|) (|spadConstant| $ 14))
                                   ('T (|spadConstant| $ 38)))
                             . #1#)
                       (SPADCALL |rhs| |z| |addOn| (QREFELT $ 55))
                       (EXIT
                        (SEQ (LETT |j| 1 . #1#) G190
                             (COND ((|greater_SI| |j| |n|) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |condo| |z| |j|
                                         (SPADCALL
                                          (SPADCALL |gamma| |k| (QREFELT $ 46))
                                          |i| |j| (QREFELT $ 47))
                                         (QREFELT $ 56))))
                             (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                             (EXIT NIL))))
                  (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))))
           (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |condo| |rhs| (QREFELT $ 60))))))) 

(DEFUN |FRNAALG-;rightUnit;U;9| ($)
  (PROG (#1=#:G207 |res|)
    (RETURN
     (SEQ
      (LETT |res| (|FRNAALG-;rightUnitsInternal| $)
            . #2=(|FRNAALG-;rightUnit;U;9|))
      (EXIT
       (COND
        ((QEQCAR (QCAR |res|) 1)
         (SEQ (SPADCALL "this algebra has no right unit" (QREFELT $ 63))
              (EXIT (CONS 1 "failed"))))
        ('T
         (CONS 0
               (SPADCALL
                (PROG2 (LETT #1# (QCAR |res|) . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) (|Vector| (QREFELT $ 7)) #1#))
                (QREFELT $ 64)))))))))) 

(DEFUN |FRNAALG-;rightUnits;U;10| ($)
  (PROG (#1=#:G218 |res|)
    (RETURN
     (SEQ
      (LETT |res| (|FRNAALG-;rightUnitsInternal| $)
            . #2=(|FRNAALG-;rightUnits;U;10|))
      (EXIT
       (COND
        ((QEQCAR (QCAR |res|) 1)
         (SEQ (SPADCALL "this algebra has no right unit" (QREFELT $ 63))
              (EXIT (CONS 1 "failed"))))
        ('T
         (CONS 0
               (CONS
                (SPADCALL
                 (PROG2 (LETT #1# (QCAR |res|) . #2#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 0) (|Vector| (QREFELT $ 7)) #1#))
                 (QREFELT $ 64))
                (SPADCALL (ELT $ 64) (QCDR |res|) (QREFELT $ 71))))))))))) 

(DEFUN |FRNAALG-;unit;U;11| ($)
  (PROG (#1=#:G234 |res| |j| |addOn| |z| |i| |k| |u| |rhs| |cond| |gamma| |b|
         |n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL (QREFELT $ 11)) . #2=(|FRNAALG-;unit;U;11|))
          (LETT |b| (SPADCALL (QREFELT $ 29)) . #2#)
          (LETT |gamma| (SPADCALL |b| (QREFELT $ 31)) . #2#)
          (LETT |cond|
                (SPADCALL (* 2 (SPADCALL |n| 2 (QREFELT $ 52))) |n|
                          (|spadConstant| $ 38) (QREFELT $ 53))
                . #2#)
          (LETT |rhs|
                (MAKEARR1 (* 2 (SPADCALL |n| 2 (QREFELT $ 52)))
                          (|spadConstant| $ 38))
                . #2#)
          (LETT |z| 0 . #2#) (LETT |u| (* |n| |n|) . #2#)
          (LETT |addOn| (|spadConstant| $ 38) . #2#)
          (SEQ (LETT |k| 1 . #2#) G190
               (COND ((|greater_SI| |k| |n|) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |i| 1 . #2#) G190
                      (COND ((|greater_SI| |i| |n|) (GO G191)))
                      (SEQ (LETT |z| (+ |z| 1) . #2#)
                           (LETT |addOn|
                                 (COND ((EQL |k| |i|) (|spadConstant| $ 14))
                                       ('T (|spadConstant| $ 38)))
                                 . #2#)
                           (SPADCALL |rhs| |z| |addOn| (QREFELT $ 55))
                           (SPADCALL |rhs| |u| |addOn| (QREFELT $ 55))
                           (EXIT
                            (SEQ (LETT |j| 1 . #2#) G190
                                 (COND ((|greater_SI| |j| |n|) (GO G191)))
                                 (SEQ
                                  (SPADCALL |cond| |z| |j|
                                            (SPADCALL
                                             (SPADCALL |gamma| |k|
                                                       (QREFELT $ 46))
                                             |j| |i| (QREFELT $ 47))
                                            (QREFELT $ 56))
                                  (EXIT
                                   (SPADCALL |cond| |u| |j|
                                             (SPADCALL
                                              (SPADCALL |gamma| |k|
                                                        (QREFELT $ 46))
                                              |i| |j| (QREFELT $ 47))
                                             (QREFELT $ 56))))
                                 (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                                 (EXIT NIL))))
                      (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |res| (SPADCALL |cond| |rhs| (QREFELT $ 60)) . #2#)
          (EXIT
           (COND
            ((QEQCAR (QCAR |res|) 1)
             (SEQ (SPADCALL "this algebra has no unit" (QREFELT $ 63))
                  (EXIT (CONS 1 "failed"))))
            ('T
             (CONS 0
                   (SPADCALL
                    (PROG2 (LETT #1# (QCAR |res|) . #2#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0) (|Vector| (QREFELT $ 7))
                                     #1#))
                    (QREFELT $ 64)))))))))) 

(DEFUN |FRNAALG-;apply;M2S;12| (|m| |a| $)
  (PROG (|v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL |a| (QREFELT $ 78)) . #1=(|FRNAALG-;apply;M2S;12|))
      (LETT |v| (SPADCALL |m| |v| (QREFELT $ 79)) . #1#)
      (EXIT (SPADCALL |v| (QREFELT $ 80))))))) 

(DEFUN |FRNAALG-;structuralConstants;V;13| ($)
  (SPADCALL (SPADCALL (QREFELT $ 29)) (QREFELT $ 31))) 

(DEFUN |FRNAALG-;conditionsForIdempotents;L;14| ($)
  (SPADCALL (SPADCALL (QREFELT $ 29)) (QREFELT $ 84))) 

(DEFUN |FRNAALG-;convert;SV;15| (|x| $)
  (SPADCALL |x| (SPADCALL (QREFELT $ 29)) (QREFELT $ 86))) 

(DEFUN |FRNAALG-;convert;VS;16| (|v| $)
  (SPADCALL |v| (SPADCALL (QREFELT $ 29)) (QREFELT $ 88))) 

(DEFUN |FRNAALG-;leftTraceMatrix;M;17| ($)
  (SPADCALL (SPADCALL (QREFELT $ 29)) (QREFELT $ 90))) 

(DEFUN |FRNAALG-;rightTraceMatrix;M;18| ($)
  (SPADCALL (SPADCALL (QREFELT $ 29)) (QREFELT $ 92))) 

(DEFUN |FRNAALG-;leftDiscriminant;R;19| ($)
  (SPADCALL (SPADCALL (QREFELT $ 29)) (QREFELT $ 94))) 

(DEFUN |FRNAALG-;rightDiscriminant;R;20| ($)
  (SPADCALL (SPADCALL (QREFELT $ 29)) (QREFELT $ 96))) 

(DEFUN |FRNAALG-;leftRegularRepresentation;SM;21| (|x| $)
  (SPADCALL |x| (SPADCALL (QREFELT $ 29)) (QREFELT $ 98))) 

(DEFUN |FRNAALG-;rightRegularRepresentation;SM;22| (|x| $)
  (SPADCALL |x| (SPADCALL (QREFELT $ 29)) (QREFELT $ 100))) 

(DEFUN |FRNAALG-;coordinates;VM;23| (|x| $)
  (SPADCALL |x| (SPADCALL (QREFELT $ 29)) (QREFELT $ 102))) 

(DEFUN |FRNAALG-;represents;VS;24| (|v| $)
  (SPADCALL |v| (SPADCALL (QREFELT $ 29)) (QREFELT $ 88))) 

(DEFUN |FRNAALG-;coordinates;VM;25| (|v| $)
  (PROG (#1=#:G256 |i| |j| |m|)
    (RETURN
     (SEQ
      (LETT |m|
            (SPADCALL (QVSIZE |v|) (SPADCALL (QREFELT $ 11))
                      (|spadConstant| $ 38) (QREFELT $ 53))
            . #2=(|FRNAALG-;coordinates;VM;25|))
      (SEQ (LETT |j| 1 . #2#) (LETT |i| (SPADCALL |v| (QREFELT $ 106)) . #2#)
           (LETT #1# (QVSIZE |v|) . #2#) G190 (COND ((> |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |m| |j| (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 78))
                       (QREFELT $ 107))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (|inc_SI| |j|) . #2#)) . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |m|))))) 

(DECLAIM (NOTINLINE |FramedNonAssociativeAlgebra&;|)) 

(DEFUN |FramedNonAssociativeAlgebra&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FramedNonAssociativeAlgebra&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|FramedNonAssociativeAlgebra&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 108) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2| '(|Field|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 50
                   (CONS
                    (|dispatchFunction| |FRNAALG-;leftRankPolynomial;Sup;3|)
                    $))
         (QSETREFV $ 51
                   (CONS
                    (|dispatchFunction| |FRNAALG-;rightRankPolynomial;Sup;4|)
                    $))
         NIL
         (QSETREFV $ 66 (CONS (|dispatchFunction| |FRNAALG-;leftUnit;U;6|) $))
         (QSETREFV $ 74 (CONS (|dispatchFunction| |FRNAALG-;leftUnits;U;7|) $))
         NIL
         (QSETREFV $ 75 (CONS (|dispatchFunction| |FRNAALG-;rightUnit;U;9|) $))
         (QSETREFV $ 76
                   (CONS (|dispatchFunction| |FRNAALG-;rightUnits;U;10|) $))
         (QSETREFV $ 77 (CONS (|dispatchFunction| |FRNAALG-;unit;U;11|) $)))))
      $)))) 

(MAKEPROP '|FramedNonAssociativeAlgebra&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Matrix| 22) (0 . |copy|) (|PositiveInteger|) (5 . |rank|)
              (|NonNegativeInteger|) (9 . |rank|) (14 . |One|)
              (|SparseUnivariatePolynomial| 22) (18 . |One|) (22 . *)
              (28 . |horizConcat|) (|List| 24) (34 . |nullSpace|) (39 . |Zero|)
              (|Polynomial| 7) (|Integer|) (|Vector| 22) (43 . |elt|)
              (49 . |monomial|) (55 . +) (|Vector| $) (61 . |basis|)
              (|Vector| 45) (65 . |structuralConstants|) (|String|) (|Symbol|)
              (70 . |coerce|) (75 . |Zero|) (79 . |new|) (86 . |Zero|)
              (90 . |Zero|) (94 . |One|) (|Vector| 33) (98 . |elt|) (|List| 33)
              (|List| 12) (104 . |monomial|) (|Matrix| 7) (111 . |elt|)
              (117 . |elt|) (124 . *) (130 . +) (136 . |leftRankPolynomial|)
              (140 . |rightRankPolynomial|) (144 . ^) (150 . |new|)
              (|Vector| 7) (157 . |setelt|) (164 . |setelt|)
              (|Union| 54 '"failed")
              (|Record| (|:| |particular| 57) (|:| |basis| 69))
              (|LinearSystemMatrixPackage| 7 54 54 45) (172 . |solve|) (|Void|)
              (|OutputForm|) (178 . |messagePrint|) (183 . |represents|)
              (|Union| $ '#1="failed") (188 . |leftUnit|) (|List| 6)
              (|Mapping| 6 54) (|List| 54) (|ListFunctions2| 54 6)
              (192 . |map|)
              (|Record| (|:| |particular| $) (|:| |basis| (|List| $)))
              (|Union| 72 '#1#) (198 . |leftUnits|) (202 . |rightUnit|)
              (206 . |rightUnits|) (210 . |unit|) (214 . |coordinates|)
              (219 . *) (225 . |convert|) |FRNAALG-;apply;M2S;12|
              |FRNAALG-;structuralConstants;V;13| (|List| 22)
              (230 . |conditionsForIdempotents|)
              |FRNAALG-;conditionsForIdempotents;L;14| (235 . |coordinates|)
              |FRNAALG-;convert;SV;15| (241 . |represents|)
              |FRNAALG-;convert;VS;16| (247 . |leftTraceMatrix|)
              |FRNAALG-;leftTraceMatrix;M;17| (252 . |rightTraceMatrix|)
              |FRNAALG-;rightTraceMatrix;M;18| (257 . |leftDiscriminant|)
              |FRNAALG-;leftDiscriminant;R;19| (262 . |rightDiscriminant|)
              |FRNAALG-;rightDiscriminant;R;20|
              (267 . |leftRegularRepresentation|)
              |FRNAALG-;leftRegularRepresentation;SM;21|
              (273 . |rightRegularRepresentation|)
              |FRNAALG-;rightRegularRepresentation;SM;22| (279 . |coordinates|)
              |FRNAALG-;coordinates;VM;25| |FRNAALG-;represents;VS;24|
              (|Vector| 6) (285 . |minIndex|) (290 . |setRow!|))
           '#(|unit| 297 |structuralConstants| 301 |rightUnits| 305 |rightUnit|
              309 |rightTraceMatrix| 313 |rightRegularRepresentation| 317
              |rightRankPolynomial| 322 |rightDiscriminant| 326 |represents|
              330 |leftUnits| 335 |leftUnit| 339 |leftTraceMatrix| 343
              |leftRegularRepresentation| 347 |leftRankPolynomial| 352
              |leftDiscriminant| 356 |coordinates| 360 |convert| 365
              |conditionsForIdempotents| 375 |apply| 379)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 107
                                                 '(1 8 0 0 9 0 6 10 11 1 8 12 0
                                                   13 0 7 0 14 0 15 0 16 2 8 0
                                                   0 0 17 2 8 0 0 0 18 1 8 19 0
                                                   20 0 15 0 21 2 24 22 0 23 25
                                                   2 15 0 22 12 26 2 15 0 0 0
                                                   27 0 6 28 29 1 6 30 28 31 1
                                                   33 0 32 34 0 22 0 35 3 8 0
                                                   12 12 22 36 0 6 0 37 0 7 0
                                                   38 0 22 0 39 2 40 33 0 23 41
                                                   3 22 0 0 42 43 44 2 30 45 0
                                                   23 46 3 45 7 0 23 23 47 2 22
                                                   0 0 7 48 2 22 0 0 0 49 0 0
                                                   15 50 0 0 15 51 2 10 0 0 10
                                                   52 3 45 0 12 12 7 53 3 54 7
                                                   0 23 7 55 4 45 7 0 23 23 7
                                                   56 2 59 58 45 54 60 1 62 61
                                                   32 63 1 6 0 54 64 0 0 65 66
                                                   2 70 67 68 69 71 0 0 73 74 0
                                                   0 65 75 0 0 73 76 0 0 65 77
                                                   1 6 54 0 78 2 45 54 0 54 79
                                                   1 6 0 54 80 1 6 83 28 84 2 6
                                                   54 0 28 86 2 6 0 54 28 88 1
                                                   6 45 28 90 1 6 45 28 92 1 6
                                                   7 28 94 1 6 7 28 96 2 6 45 0
                                                   28 98 2 6 45 0 28 100 2 6 45
                                                   28 28 102 1 105 23 0 106 3
                                                   45 0 0 23 54 107 0 0 65 77 0
                                                   0 30 82 0 0 73 76 0 0 65 75
                                                   0 0 45 93 1 0 45 0 101 0 0
                                                   15 51 0 0 7 97 1 0 0 54 104
                                                   0 0 73 74 0 0 65 66 0 0 45
                                                   91 1 0 45 0 99 0 0 15 50 0 0
                                                   7 95 1 0 45 28 103 1 0 0 54
                                                   89 1 0 54 0 87 0 0 83 85 2 0
                                                   0 45 0 81)))))
           '|lookupComplete|)) 
