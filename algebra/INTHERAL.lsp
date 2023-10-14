
(SDEFUN |INTHERAL;HermiteIntegrate;RMR;1|
        ((|f| R) (|derivation| |Mapping| UP UP)
         ($ |Record| (|:| |answer| R) (|:| |logpart| R)))
        (SPROG
         ((|iden| (UP)) (|inum| #1=(|Vector| UP)) (#2=#:G118 NIL)
          (#3=#:G366 NIL) (#4=#:G368 NIL) (|i| NIL) (#5=#:G367 NIL)
          (|ratform| (R)) (#6=#:G356 NIL) (|sol| (|Vector| UP)) (|p| (UP))
          (|j| (|Integer|)) (|nn| (|Integer|)) (|sys| (|Matrix| UP))
          (|u'| (UP)) (|u| (UP)) (#7=#:G354 NIL) (|v| (UP)) (#8=#:G365 NIL)
          (|trm| NIL) (|coef| (UP)) (|e| (UP))
          (|cform| (|Record| (|:| |num| #1#) (|:| |den| UP)))
          (|m| (|Matrix| UP))
          (|mat| (|Record| (|:| |num| (|Matrix| UP)) (|:| |den| UP)))
          (|n| (|PositiveInteger|)))
         (SEQ
          (LETT |ratform| (|spadConstant| $ 10)
                . #9=(|INTHERAL;HermiteIntegrate;RMR;1|))
          (LETT |n| (SPADCALL (QREFELT $ 12)) . #9#)
          (LETT |m|
                (SPADCALL
                 (QCAR
                  (LETT |mat| (SPADCALL |derivation| (QREFELT $ 15)) . #9#))
                 (QREFELT $ 17))
                . #9#)
          (LETT |inum|
                (QCAR (LETT |cform| (SPADCALL |f| (QREFELT $ 19)) . #9#))
                . #9#)
          (COND
           ((QEQCAR
             (SPADCALL (LETT |iden| (QCDR |cform|) . #9#)
                       (LETT |e| (QCDR |mat|) . #9#) (QREFELT $ 21))
             1)
            (SEQ
             (LETT |iden|
                   (SPADCALL
                    (LETT |coef|
                          (PROG2
                              (LETT #2#
                                    (SPADCALL |e|
                                              (SPADCALL |e| |iden|
                                                        (QREFELT $ 22))
                                              (QREFELT $ 21))
                                    . #9#)
                              (QCDR #2#)
                            (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#))
                          . #9#)
                    |iden| (QREFELT $ 23))
                   . #9#)
             (EXIT
              (LETT |inum| (SPADCALL |coef| |inum| (QREFELT $ 25)) . #9#)))))
          (SEQ (LETT |trm| NIL . #9#)
               (LETT #8#
                     (SPADCALL (SPADCALL |iden| (QREFELT $ 27)) (QREFELT $ 31))
                     . #9#)
               G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |trm| (CAR #8#) . #9#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (LETT |j| (QCDR |trm|) . #9#) 1 (QREFELT $ 34))
                   (SEQ
                    (LETT |u'|
                          (SPADCALL
                           (LETT |u|
                                 (PROG2
                                     (LETT #2#
                                           (SPADCALL |iden|
                                                     (SPADCALL
                                                      (LETT |v| (QCAR |trm|)
                                                            . #9#)
                                                      (PROG1
                                                          (LETT #7# |j| . #9#)
                                                        (|check_subtype|
                                                         (>= #7# 0)
                                                         '(|NonNegativeInteger|)
                                                         #7#))
                                                      (QREFELT $ 36))
                                                     (QREFELT $ 21))
                                           . #9#)
                                     (QCDR #2#)
                                   (|check_union| (QEQCAR #2# 0) (QREFELT $ 7)
                                                  #2#))
                                 . #9#)
                           (SPADCALL |v| |derivation|) (QREFELT $ 23))
                          . #9#)
                    (LETT |sys|
                          (SPADCALL
                           (PROG2
                               (LETT #2#
                                     (SPADCALL
                                      (SPADCALL |u| |v| (QREFELT $ 23)) |e|
                                      (QREFELT $ 21))
                                     . #9#)
                               (QCDR #2#)
                             (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#))
                           |m| (QREFELT $ 37))
                          . #9#)
                    (LETT |nn| (- 1 (SPADCALL |inum| (QREFELT $ 38))) . #9#)
                    (SEQ G190
                         (COND
                          ((NULL (SPADCALL |j| 1 (QREFELT $ 34))) (GO G191)))
                         (SEQ (LETT |j| (- |j| 1) . #9#)
                              (LETT |p|
                                    (SPADCALL
                                     (SPADCALL |j| |u'| (QREFELT $ 41))
                                     (QREFELT $ 42))
                                    . #9#)
                              (LETT |sol|
                                    (|INTHERAL;localsolve|
                                     (SPADCALL |sys|
                                               (SPADCALL |n| |p|
                                                         (QREFELT $ 43))
                                               (QREFELT $ 44))
                                     |inum| |v| $)
                                    . #9#)
                              (LETT |ratform|
                                    (SPADCALL |ratform|
                                              (SPADCALL |sol|
                                                        (SPADCALL |v|
                                                                  (PROG1
                                                                      (LETT #6#
                                                                            |j|
                                                                            . #9#)
                                                                    (|check_subtype|
                                                                     (>= #6# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     #6#))
                                                                  (QREFELT $
                                                                           36))
                                                        (QREFELT $ 45))
                                              (QREFELT $ 46))
                                    . #9#)
                              (EXIT
                               (LETT |inum|
                                     (PROGN
                                      (LETT #5#
                                            (GETREFV
                                             (|inc_SI|
                                              (- #10=(QVSIZE |inum|)
                                                 #11=(SPADCALL |inum|
                                                               (QREFELT $
                                                                        38)))))
                                            . #9#)
                                      (SEQ (LETT |i| #11# . #9#)
                                           (LETT #4# #10# . #9#)
                                           (LETT #3# 0 . #9#) G190
                                           (COND ((> |i| #4#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (SETELT #5# #3#
                                                     (SPADCALL
                                                      (PROG2
                                                          (LETT #2#
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QAREF1O
                                                                    |inum| |i|
                                                                    1)
                                                                   (SPADCALL
                                                                    |p|
                                                                    (QAREF1O
                                                                     |sol| |i|
                                                                     1)
                                                                    (QREFELT $
                                                                             23))
                                                                   (QREFELT $
                                                                            47))
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |sys|
                                                                    (- |i|
                                                                       |nn|)
                                                                    (QREFELT $
                                                                             48))
                                                                   |sol|
                                                                   (QREFELT $
                                                                            49))
                                                                  (QREFELT $
                                                                           47))
                                                                 |v|
                                                                 (QREFELT $
                                                                          21))
                                                                . #9#)
                                                          (QCDR #2#)
                                                        (|check_union|
                                                         (QEQCAR #2# 0)
                                                         (QREFELT $ 7) #2#))
                                                      (SPADCALL |u|
                                                                (SPADCALL
                                                                 (QAREF1O |sol|
                                                                          |i|
                                                                          1)
                                                                 |derivation|)
                                                                (QREFELT $ 23))
                                                      (QREFELT $ 47)))))
                                           (LETT #3#
                                                 (PROG1 (|inc_SI| #3#)
                                                   (LETT |i| (+ |i| 1) . #9#))
                                                 . #9#)
                                           (GO G190) G191 (EXIT NIL))
                                      #5#)
                                     . #9#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |iden| (SPADCALL |u| |v| (QREFELT $ 23))
                           . #9#)))))))
               (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |ratform| (SPADCALL |inum| |iden| (QREFELT $ 45))))))) 

(SDEFUN |INTHERAL;localsolve|
        ((|mat| |Matrix| UP) (|vec| |Vector| UP) (|modulus| UP)
         ($ |Vector| UP))
        (SPROG
         ((#1=#:G385 NIL)
          (|bc|
           (|Union| (|Record| (|:| |coef1| UP) (|:| |coef2| UP)) "failed"))
          (#2=#:G389 NIL) (|i| NIL)
          (|sol| (|Union| (|Vector| (|Fraction| UP)) "failed")) (#3=#:G386 NIL)
          (#4=#:G387 NIL) (|j| NIL) (#5=#:G388 NIL) (|k| NIL)
          (|ans| (|Vector| UP)))
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
                          (GO #7=#:G384)))
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
              (#8='T
               (SEQ
                (LETT |sol|
                      (SPADCALL (SPADCALL (ELT $ 61) |mat| (QREFELT $ 65))
                                (SPADCALL (ELT $ 61) |vec| (QREFELT $ 68))
                                (QREFELT $ 71))
                      . #6#)
                (EXIT
                 (COND ((QEQCAR |sol| 1) (MAKEARR1 0 (|spadConstant| $ 52)))
                       (#8#
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
                                   (GO #7#)))
                                 ('T
                                  (QSETAREF1O |ans| |i|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL
                                                 (QAREF1O (QCDR |sol|) |i| 1)
                                                 (QREFELT $ 73))
                                                (QCAR (QCDR |bc|))
                                                (QREFELT $ 23))
                                               |modulus| (QREFELT $ 74))
                                              1)))))
                              (LETT |i| (+ |i| 1) . #6#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT |ans|)))))))))))
          #7# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |AlgebraicHermiteIntegration;|)) 

(DEFUN |AlgebraicHermiteIntegration| (&REST #1=#:G390)
  (SPROG NIL
         (PROG (#2=#:G391)
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
                  (PROG1
                      (APPLY (|function| |AlgebraicHermiteIntegration;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|AlgebraicHermiteIntegration|)))))))))) 

(DEFUN |AlgebraicHermiteIntegration;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
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
    $))) 

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
