
(/VERSIONCHECK 2) 

(DEFUN |INTHERAL;HermiteIntegrate;RMR;1| (|f| |derivation| $)
  (PROG (|iden| |inum| #1=#:G113 #2=#:G361 #3=#:G363 |i| #4=#:G362 |ratform|
         #5=#:G351 |sol| |p| |j| |nn| |sys| |u'| |u| #6=#:G349 |v| #7=#:G360
         |trm| |coef| |e| |cform| |m| |mat| |n|)
    (RETURN
     (SEQ
      (LETT |ratform| (|spadConstant| $ 10)
            . #8=(|INTHERAL;HermiteIntegrate;RMR;1|))
      (LETT |n| (SPADCALL (QREFELT $ 12)) . #8#)
      (LETT |m|
            (SPADCALL
             (QCAR (LETT |mat| (SPADCALL |derivation| (QREFELT $ 15)) . #8#))
             (QREFELT $ 17))
            . #8#)
      (LETT |inum| (QCAR (LETT |cform| (SPADCALL |f| (QREFELT $ 19)) . #8#))
            . #8#)
      (COND
       ((QEQCAR
         (SPADCALL (LETT |iden| (QCDR |cform|) . #8#)
                   (LETT |e| (QCDR |mat|) . #8#) (QREFELT $ 21))
         1)
        (SEQ
         (LETT |iden|
               (SPADCALL
                (LETT |coef|
                      (PROG2
                          (LETT #1#
                                (SPADCALL |e|
                                          (SPADCALL |e| |iden| (QREFELT $ 22))
                                          (QREFELT $ 21))
                                . #8#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                      . #8#)
                |iden| (QREFELT $ 23))
               . #8#)
         (EXIT (LETT |inum| (SPADCALL |coef| |inum| (QREFELT $ 25)) . #8#)))))
      (SEQ (LETT |trm| NIL . #8#)
           (LETT #7# (SPADCALL (SPADCALL |iden| (QREFELT $ 27)) (QREFELT $ 31))
                 . #8#)
           G190
           (COND
            ((OR (ATOM #7#) (PROGN (LETT |trm| (CAR #7#) . #8#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL (LETT |j| (QCDR |trm|) . #8#) 1 (QREFELT $ 34))
               (SEQ
                (LETT |u'|
                      (SPADCALL
                       (LETT |u|
                             (PROG2
                                 (LETT #1#
                                       (SPADCALL |iden|
                                                 (SPADCALL
                                                  (LETT |v| (QCAR |trm|) . #8#)
                                                  (PROG1 (LETT #6# |j| . #8#)
                                                    (|check_subtype| (>= #6# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     #6#))
                                                  (QREFELT $ 36))
                                                 (QREFELT $ 21))
                                       . #8#)
                                 (QCDR #1#)
                               (|check_union| (QEQCAR #1# 0) (QREFELT $ 7)
                                              #1#))
                             . #8#)
                       (SPADCALL |v| |derivation|) (QREFELT $ 23))
                      . #8#)
                (LETT |sys|
                      (SPADCALL
                       (PROG2
                           (LETT #1#
                                 (SPADCALL (SPADCALL |u| |v| (QREFELT $ 23))
                                           |e| (QREFELT $ 21))
                                 . #8#)
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                       |m| (QREFELT $ 37))
                      . #8#)
                (LETT |nn| (- 1 (SPADCALL |inum| (QREFELT $ 38))) . #8#)
                (SEQ G190
                     (COND ((NULL (SPADCALL |j| 1 (QREFELT $ 34))) (GO G191)))
                     (SEQ (LETT |j| (- |j| 1) . #8#)
                          (LETT |p|
                                (SPADCALL (SPADCALL |j| |u'| (QREFELT $ 41))
                                          (QREFELT $ 42))
                                . #8#)
                          (LETT |sol|
                                (|INTHERAL;localsolve|
                                 (SPADCALL |sys|
                                           (SPADCALL |n| |p| (QREFELT $ 43))
                                           (QREFELT $ 44))
                                 |inum| |v| $)
                                . #8#)
                          (LETT |ratform|
                                (SPADCALL |ratform|
                                          (SPADCALL |sol|
                                                    (SPADCALL |v|
                                                              (PROG1
                                                                  (LETT #5# |j|
                                                                        . #8#)
                                                                (|check_subtype|
                                                                 (>= #5# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #5#))
                                                              (QREFELT $ 36))
                                                    (QREFELT $ 45))
                                          (QREFELT $ 46))
                                . #8#)
                          (EXIT
                           (LETT |inum|
                                 (PROGN
                                  (LETT #4#
                                        (GETREFV
                                         (|inc_SI|
                                          (- #9=(QVSIZE |inum|)
                                             #10=(SPADCALL |inum|
                                                           (QREFELT $ 38)))))
                                        . #8#)
                                  (SEQ (LETT |i| #10# . #8#)
                                       (LETT #3# #9# . #8#) (LETT #2# 0 . #8#)
                                       G190 (COND ((> |i| #3#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SETELT #4# #2#
                                                 (SPADCALL
                                                  (PROG2
                                                      (LETT #1#
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QAREF1O |inum|
                                                                        |i| 1)
                                                               (SPADCALL |p|
                                                                         (QAREF1O
                                                                          |sol|
                                                                          |i|
                                                                          1)
                                                                         (QREFELT
                                                                          $
                                                                          23))
                                                               (QREFELT $ 47))
                                                              (SPADCALL
                                                               (SPADCALL |sys|
                                                                         (- |i|
                                                                            |nn|)
                                                                         (QREFELT
                                                                          $
                                                                          48))
                                                               |sol|
                                                               (QREFELT $ 49))
                                                              (QREFELT $ 47))
                                                             |v|
                                                             (QREFELT $ 21))
                                                            . #8#)
                                                      (QCDR #1#)
                                                    (|check_union|
                                                     (QEQCAR #1# 0)
                                                     (QREFELT $ 7) #1#))
                                                  (SPADCALL |u|
                                                            (SPADCALL
                                                             (QAREF1O |sol| |i|
                                                                      1)
                                                             |derivation|)
                                                            (QREFELT $ 23))
                                                  (QREFELT $ 47)))))
                                       (LETT #2#
                                             (PROG1 (|inc_SI| #2#)
                                               (LETT |i| (+ |i| 1) . #8#))
                                             . #8#)
                                       (GO G190) G191 (EXIT NIL))
                                  #4#)
                                 . #8#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (LETT |iden| (SPADCALL |u| |v| (QREFELT $ 23)) . #8#)))))))
           (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
      (EXIT (CONS |ratform| (SPADCALL |inum| |iden| (QREFELT $ 45)))))))) 

(DEFUN |INTHERAL;localsolve| (|mat| |vec| |modulus| $)
  (PROG (#1=#:G379 |bc| #2=#:G383 |i| |sol| #3=#:G380 #4=#:G381 |j| #5=#:G382
         |k| |ans|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ans| (MAKEARR1 (ANROWS |mat|) (|spadConstant| $ 52))
              . #6=(|INTHERAL;localsolve|))
        (EXIT
         (COND
          ((SPADCALL |mat| (QREFELT $ 53))
           (SEQ
            (SEQ (LETT |k| 1 . #6#)
                 (LETT #5# (SPADCALL |mat| (QREFELT $ 55)) . #6#)
                 (LETT |j| 1 . #6#)
                 (LETT #4# (SPADCALL |mat| (QREFELT $ 54)) . #6#)
                 (LETT |i| (SPADCALL |ans| (QREFELT $ 38)) . #6#)
                 (LETT #3# (QVSIZE |ans|) . #6#) G190
                 (COND
                  ((OR (> |i| #3#) (|greater_SI| |j| #4#)
                       (|greater_SI| |k| #5#))
                   (GO G191)))
                 (SEQ
                  (LETT |bc|
                        (SPADCALL (QAREF2O |mat| |j| |k| 1 1) |modulus|
                                  (QAREF1O |vec| |i| 1) (QREFELT $ 58))
                        . #6#)
                  (EXIT
                   (COND
                    ((QEQCAR |bc| 1)
                     (PROGN
                      (LETT #1# (MAKEARR1 0 (|spadConstant| $ 52)) . #6#)
                      (GO #1#)))
                    ('T (QSETAREF1O |ans| |i| (QCAR (QCDR |bc|)) 1)))))
                 (LETT |i|
                       (PROG1 (+ |i| 1)
                         (LETT |j|
                               (PROG1 (|inc_SI| |j|)
                                 (LETT |k| (|inc_SI| |k|) . #6#))
                               . #6#))
                       . #6#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT |ans|)))
          (#7='T
           (SEQ
            (LETT |sol|
                  (SPADCALL (SPADCALL (ELT $ 61) |mat| (QREFELT $ 65))
                            (SPADCALL (ELT $ 61) |vec| (QREFELT $ 68))
                            (QREFELT $ 71))
                  . #6#)
            (EXIT
             (COND ((QEQCAR |sol| 1) (MAKEARR1 0 (|spadConstant| $ 52)))
                   (#7#
                    (SEQ
                     (SEQ (LETT |i| (SPADCALL |ans| (QREFELT $ 38)) . #6#)
                          (LETT #2# (QVSIZE |ans|) . #6#) G190
                          (COND ((> |i| #2#) (GO G191)))
                          (SEQ
                           (LETT |bc|
                                 (SPADCALL
                                  (SPADCALL (QAREF1O (QCDR |sol|) |i| 1)
                                            (QREFELT $ 72))
                                  |modulus| (|spadConstant| $ 40)
                                  (QREFELT $ 58))
                                 . #6#)
                           (EXIT
                            (COND
                             ((QEQCAR |bc| 1)
                              (PROGN
                               (LETT #1# (MAKEARR1 0 (|spadConstant| $ 52))
                                     . #6#)
                               (GO #1#)))
                             ('T
                              (QSETAREF1O |ans| |i|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (QAREF1O (QCDR |sol|) |i| 1)
                                             (QREFELT $ 73))
                                            (QCAR (QCDR |bc|)) (QREFELT $ 23))
                                           |modulus| (QREFELT $ 74))
                                          1)))))
                          (LETT |i| (+ |i| 1) . #6#) (GO G190) G191 (EXIT NIL))
                     (EXIT |ans|)))))))))))
      #1# (EXIT #1#))))) 

(DECLAIM (NOTINLINE |AlgebraicHermiteIntegration;|)) 

(DEFUN |AlgebraicHermiteIntegration| (&REST #1=#:G384)
  (PROG ()
    (RETURN
     (PROG (#2=#:G385)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|AlgebraicHermiteIntegration|)
                                           '|domainEqualList|)
                . #3=(|AlgebraicHermiteIntegration|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |AlgebraicHermiteIntegration;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|AlgebraicHermiteIntegration|))))))))))) 

(DEFUN |AlgebraicHermiteIntegration;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|AlgebraicHermiteIntegration|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|AlgebraicHermiteIntegration| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 75) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|AlgebraicHermiteIntegration|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|AlgebraicHermiteIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |Zero|) (|PositiveInteger|)
              (4 . |rank|) (|Record| (|:| |num| 16) (|:| |den| 7))
              (|Mapping| 7 7) (8 . |integralDerivationMatrix|) (|Matrix| 7)
              (13 . |transpose|) (|Record| (|:| |num| 24) (|:| |den| 7))
              (18 . |integralCoordinates|) (|Union| $ '"failed") (23 . |exquo|)
              (29 . |gcd|) (35 . *) (|Vector| 7) (41 . *) (|Factored| $)
              (47 . |squareFree|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 33)) (|List| 28)
              (|Factored| 7) (52 . |factors|) (|Boolean|) (|Integer|) (57 . >)
              (|NonNegativeInteger|) (63 . ^) (69 . *) (75 . |minIndex|)
              (80 . |One|) (84 . |One|) (88 . *) (94 . -) (99 . |scalarMatrix|)
              (105 . +) (111 . |integralRepresents|) (117 . +) (123 . -)
              (129 . |row|) (135 . |dot|)
              (|Record| (|:| |answer| 9) (|:| |logpart| 9))
              |INTHERAL;HermiteIntegrate;RMR;1| (141 . |Zero|)
              (145 . |diagonal?|) (150 . |maxRowIndex|) (155 . |maxColIndex|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 56 '"failed")
              (160 . |extendedEuclidean|) (167 . |Zero|) (|Fraction| 7)
              (171 . |coerce|) (|Matrix| 60) (|Mapping| 60 7)
              (|MatrixCategoryFunctions2| 7 24 24 16 60 66 66 62) (176 . |map|)
              (|Vector| 60) (|VectorFunctions2| 7 60) (182 . |map|)
              (|Union| 66 '"failed") (|LinearSystemMatrixPackage| 60 66 66 62)
              (188 . |particularSolution|) (194 . |denom|) (199 . |numer|)
              (204 . |rem|))
           '#(|HermiteIntegrate| 210) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 74
                                                 '(0 9 0 10 0 9 11 12 1 9 13 14
                                                   15 1 16 0 0 17 1 9 18 0 19 2
                                                   7 20 0 0 21 2 7 0 0 0 22 2 7
                                                   0 0 0 23 2 24 0 7 0 25 1 7
                                                   26 0 27 1 30 29 0 31 2 33 32
                                                   0 0 34 2 7 0 0 35 36 2 16 0
                                                   7 0 37 1 24 33 0 38 0 6 0 39
                                                   0 7 0 40 2 7 0 33 0 41 1 7 0
                                                   0 42 2 16 0 35 7 43 2 16 0 0
                                                   0 44 2 9 0 24 7 45 2 9 0 0 0
                                                   46 2 7 0 0 0 47 2 16 24 0 33
                                                   48 2 24 7 0 0 49 0 7 0 52 1
                                                   16 32 0 53 1 16 33 0 54 1 16
                                                   33 0 55 3 7 57 0 0 0 58 0 6
                                                   0 59 1 60 0 7 61 2 64 62 63
                                                   16 65 2 67 66 63 24 68 2 70
                                                   69 62 66 71 1 60 7 0 72 1 60
                                                   7 0 73 2 7 0 0 0 74 2 0 50 9
                                                   14 51)))))
           '|lookupComplete|)) 
