
(SDEFUN |INTHERAL;HermiteIntegrate;RMR;1|
        ((|f| R) (|derivation| |Mapping| UP UP)
         ($ |Record| (|:| |answer| R) (|:| |logpart| R)))
        (SPADCALL |f| |derivation| (|spadConstant| $ 12) (QREFELT $ 15))) 

(SDEFUN |INTHERAL;HermiteIntegrate;RMRR;2|
        ((|f| R) (|derivation| |Mapping| UP UP) (|d0| R)
         ($ |Record| (|:| |answer| R) (|:| |logpart| R)))
        (SPROG
         ((|iden| (UP)) (|inum| #1=(|Vector| UP)) (#2=#:G121 NIL)
          (#3=#:G137 NIL) (#4=#:G139 NIL) (|i| NIL) (#5=#:G138 NIL)
          (|ratform| (R)) (|cnum| #1#)
          (|corr| #6=(|Record| (|:| |num| #1#) (|:| |den| UP))) (|s0| (R))
          (|sol| (|Vector| UP)) (|p| (UP)) (|j| (|NonNegativeInteger|))
          (#7=#:G126 NIL) (|nn| (|Integer|)) (|sys| (|Matrix| UP)) (|u'| (UP))
          (|u| (UP)) (|v| (UP)) (#8=#:G136 NIL) (|trm| NIL) (|coef| (UP))
          (|e| (UP)) (|cform| #6#) (|m| (|Matrix| UP))
          (|mat| (|Record| (|:| |num| (|Matrix| UP)) (|:| |den| UP)))
          (|n| (|PositiveInteger|)))
         (SEQ (LETT |ratform| (|spadConstant| $ 12))
              (LETT |n| (SPADCALL (QREFELT $ 18)))
              (LETT |m|
                    (SPADCALL
                     (QCAR (LETT |mat| (SPADCALL |derivation| (QREFELT $ 20))))
                     (QREFELT $ 22)))
              (EXIT
               (COND
                ((SPADCALL (QCDR (SPADCALL |d0| (QREFELT $ 24)))
                           (|spadConstant| $ 25) (QREFELT $ 27))
                 (|error| "nonintegral d0"))
                ('T
                 (SEQ
                  (LETT |inum|
                        (QCAR (LETT |cform| (SPADCALL |f| (QREFELT $ 24)))))
                  (COND
                   ((QEQCAR
                     (SPADCALL (LETT |iden| (QCDR |cform|))
                               (LETT |e| (QCDR |mat|)) (QREFELT $ 29))
                     1)
                    (SEQ
                     (LETT |iden|
                           (SPADCALL
                            (LETT |coef|
                                  (PROG2
                                      (LETT #2#
                                            (SPADCALL |e|
                                                      (SPADCALL |e| |iden|
                                                                (QREFELT $ 30))
                                                      (QREFELT $ 29)))
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (QREFELT $ 7)
                                                    (|Union| (QREFELT $ 7)
                                                             #9="failed")
                                                    #2#)))
                            |iden| (QREFELT $ 31)))
                     (EXIT
                      (LETT |inum| (SPADCALL |coef| |inum| (QREFELT $ 33)))))))
                  (SEQ (LETT |trm| NIL)
                       (LETT #8#
                             (SPADCALL (SPADCALL |iden| (QREFELT $ 35))
                                       (QREFELT $ 40)))
                       G190
                       (COND
                        ((OR (ATOM #8#) (PROGN (LETT |trm| (CAR #8#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (LETT |j| (QVELT |trm| 2)) 1
                                     (QREFELT $ 42))
                           (SEQ
                            (LETT |u'|
                                  (SPADCALL
                                   (LETT |u|
                                         (PROG2
                                             (LETT #2#
                                                   (SPADCALL |iden|
                                                             (SPADCALL
                                                              (LETT |v|
                                                                    (QVELT
                                                                     |trm| 1))
                                                              |j|
                                                              (QREFELT $ 43))
                                                             (QREFELT $ 29)))
                                             (QCDR #2#)
                                           (|check_union2| (QEQCAR #2# 0)
                                                           (QREFELT $ 7)
                                                           (|Union|
                                                            (QREFELT $ 7) #9#)
                                                           #2#)))
                                   (SPADCALL |v| |derivation|) (QREFELT $ 31)))
                            (LETT |sys|
                                  (SPADCALL
                                   (PROG2
                                       (LETT #2#
                                             (SPADCALL
                                              (SPADCALL |u| |v| (QREFELT $ 31))
                                              |e| (QREFELT $ 29)))
                                       (QCDR #2#)
                                     (|check_union2| (QEQCAR #2# 0)
                                                     (QREFELT $ 7)
                                                     (|Union| (QREFELT $ 7)
                                                              #9#)
                                                     #2#))
                                   |m| (QREFELT $ 44)))
                            (LETT |nn|
                                  (- (PROGN |sys| 1)
                                     (SPADCALL |inum| (QREFELT $ 46))))
                            (SEQ G190
                                 (COND
                                  ((NULL (SPADCALL |j| 1 (QREFELT $ 42)))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |j|
                                        (PROG1 (LETT #7# (- |j| 1))
                                          (|check_subtype2| (>= #7# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #7#)))
                                  (LETT |p|
                                        (SPADCALL
                                         (SPADCALL |j| |u'| (QREFELT $ 48))
                                         (QREFELT $ 49)))
                                  (LETT |sol|
                                        (|INTHERAL;localsolve|
                                         (SPADCALL |sys|
                                                   (SPADCALL |n| |p|
                                                             (QREFELT $ 50))
                                                   (QREFELT $ 51))
                                         |inum| |v| $))
                                  (LETT |s0|
                                        (SPADCALL |sol| (|spadConstant| $ 25)
                                                  (QREFELT $ 52)))
                                  (LETT |corr|
                                        (SPADCALL
                                         (SPADCALL |d0| |s0| (QREFELT $ 53))
                                         (QREFELT $ 24)))
                                  (EXIT
                                   (COND
                                    ((SPADCALL (QCDR |corr|)
                                               (|spadConstant| $ 25)
                                               (QREFELT $ 27))
                                     (|error| "impossible"))
                                    ('T
                                     (SEQ (LETT |cnum| (QCAR |corr|))
                                          (LETT |ratform|
                                                (SPADCALL |ratform|
                                                          (SPADCALL |sol|
                                                                    (SPADCALL
                                                                     |v| |j|
                                                                     (QREFELT $
                                                                              43))
                                                                    (QREFELT $
                                                                             52))
                                                          (QREFELT $ 54)))
                                          (EXIT
                                           (LETT |inum|
                                                 (PROGN
                                                  (LETT #5#
                                                        (GETREFV
                                                         (|inc_SI|
                                                          (-
                                                           #10=(QVSIZE |inum|)
                                                           #11=(SPADCALL |inum|
                                                                         (QREFELT
                                                                          $
                                                                          46))))))
                                                  (SEQ (LETT |i| #11#)
                                                       (LETT #4# #10#)
                                                       (LETT #3# 0) G190
                                                       (COND
                                                        ((> |i| #4#)
                                                         (GO G191)))
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
                                                                                |inum|
                                                                                |i|
                                                                                1)
                                                                               (SPADCALL
                                                                                |p|
                                                                                (QAREF1O
                                                                                 |sol|
                                                                                 |i|
                                                                                 1)
                                                                                (QREFELT
                                                                                 $
                                                                                 31))
                                                                               (QREFELT
                                                                                $
                                                                                55))
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                |sys|
                                                                                (-
                                                                                 |i|
                                                                                 |nn|)
                                                                                (QREFELT
                                                                                 $
                                                                                 56))
                                                                               |sol|
                                                                               (QREFELT
                                                                                $
                                                                                57))
                                                                              (QREFELT
                                                                               $
                                                                               55))
                                                                             |v|
                                                                             (QREFELT
                                                                              $
                                                                              29)))
                                                                      (QCDR
                                                                       #2#)
                                                                    (|check_union2|
                                                                     (QEQCAR
                                                                      #2# 0)
                                                                     (QREFELT $
                                                                              7)
                                                                     (|Union|
                                                                      (QREFELT
                                                                       $ 7)
                                                                      #9#)
                                                                     #2#))
                                                                  (SPADCALL |u|
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QAREF1O
                                                                               |sol|
                                                                               |i|
                                                                               1)
                                                                              |derivation|)
                                                                             (QAREF1O
                                                                              |cnum|
                                                                              |i|
                                                                              1)
                                                                             (QREFELT
                                                                              $
                                                                              58))
                                                                            (QREFELT
                                                                             $
                                                                             31))
                                                                  (QREFELT $
                                                                           55)))))
                                                       (LETT #3#
                                                             (PROG1
                                                                 (|inc_SI| #3#)
                                                               (LETT |i|
                                                                     (+ |i|
                                                                        1))))
                                                       (GO G190) G191
                                                       (EXIT NIL))
                                                  #5#))))))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (LETT |iden|
                                   (SPADCALL |u| |v| (QREFELT $ 31)))))))))
                       (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (CONS |ratform|
                         (SPADCALL |inum| |iden| (QREFELT $ 52))))))))))) 

(SDEFUN |INTHERAL;localsolve|
        ((|mat| |Matrix| UP) (|vec| |Vector| UP) (|modulus| UP)
         ($ |Vector| UP))
        (SPROG
         ((#1=#:G156 NIL)
          (|bc|
           (|Union| (|Record| (|:| |coef1| UP) (|:| |coef2| UP)) "failed"))
          (#2=#:G160 NIL) (|i| NIL)
          (|sol| (|Union| (|Vector| (|Fraction| UP)) "failed")) (#3=#:G157 NIL)
          (#4=#:G158 NIL) (|j| NIL) (#5=#:G159 NIL) (|k| NIL)
          (|ans| (|Vector| UP)))
         (SEQ
          (EXIT
           (SEQ (LETT |ans| (MAKEARR1 (ANROWS |mat|) (|spadConstant| $ 11)))
                (EXIT
                 (COND
                  ((SPADCALL |mat| (QREFELT $ 59))
                   (SEQ
                    (SEQ (LETT |k| (PROGN |mat| 1))
                         (LETT #5# (SPADCALL |mat| (QREFELT $ 61)))
                         (LETT |j| (PROGN |mat| 1))
                         (LETT #4# (SPADCALL |mat| (QREFELT $ 60)))
                         (LETT |i| (SPADCALL |ans| (QREFELT $ 46)))
                         (LETT #3# (QVSIZE |ans|)) G190
                         (COND
                          ((OR (> |i| #3#) (> |j| #4#) (> |k| #5#)) (GO G191)))
                         (SEQ
                          (LETT |bc|
                                (SPADCALL (QAREF2O |mat| |j| |k| 1 1) |modulus|
                                          (QAREF1O |vec| |i| 1)
                                          (QREFELT $ 64)))
                          (EXIT
                           (COND
                            ((QEQCAR |bc| 1)
                             (PROGN
                              (LETT #1# (MAKEARR1 0 (|spadConstant| $ 11)))
                              (GO #6=#:G155)))
                            ('T (QSETAREF1O |ans| |i| (QCAR (QCDR |bc|)) 1)))))
                         (LETT |i|
                               (PROG1 (+ |i| 1)
                                 (LETT |j|
                                       (PROG1 (+ |j| 1)
                                         (LETT |k| (+ |k| 1))))))
                         (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))
                  (#7='T
                   (SEQ
                    (LETT |sol|
                          (SPADCALL (SPADCALL (ELT $ 66) |mat| (QREFELT $ 70))
                                    (SPADCALL (ELT $ 66) |vec| (QREFELT $ 73))
                                    (QREFELT $ 76)))
                    (EXIT
                     (COND
                      ((QEQCAR |sol| 1) (MAKEARR1 0 (|spadConstant| $ 11)))
                      (#7#
                       (SEQ
                        (SEQ (LETT |i| (SPADCALL |ans| (QREFELT $ 46)))
                             (LETT #2# (QVSIZE |ans|)) G190
                             (COND ((> |i| #2#) (GO G191)))
                             (SEQ
                              (LETT |bc|
                                    (SPADCALL
                                     (SPADCALL (QAREF1O (QCDR |sol|) |i| 1)
                                               (QREFELT $ 77))
                                     |modulus| (|spadConstant| $ 25)
                                     (QREFELT $ 64)))
                              (EXIT
                               (COND
                                ((QEQCAR |bc| 1)
                                 (PROGN
                                  (LETT #1# (MAKEARR1 0 (|spadConstant| $ 11)))
                                  (GO #6#)))
                                ('T
                                 (QSETAREF1O |ans| |i|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (QAREF1O (QCDR |sol|) |i| 1)
                                                (QREFELT $ 78))
                                               (QCAR (QCDR |bc|))
                                               (QREFELT $ 31))
                                              |modulus| (QREFELT $ 79))
                                             1)))))
                             (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                        (EXIT |ans|)))))))))))
          #6# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |AlgebraicHermiteIntegration;|)) 

(DEFUN |AlgebraicHermiteIntegration| (&REST #1=#:G161)
  (SPROG NIL
         (PROG (#2=#:G162)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AlgebraicHermiteIntegration|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |AlgebraicHermiteIntegration;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|AlgebraicHermiteIntegration|)))))))))) 

(DEFUN |AlgebraicHermiteIntegration;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|AlgebraicHermiteIntegration| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 80))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
              (|local| |#3|) (|local| |#4|) (0 . |Zero|) (4 . |Zero|)
              (8 . |Zero|) (|Record| (|:| |answer| 9) (|:| |logpart| 9))
              (|Mapping| 7 7) |INTHERAL;HermiteIntegrate;RMRR;2|
              |INTHERAL;HermiteIntegrate;RMR;1| (|PositiveInteger|)
              (12 . |rank|) (|Record| (|:| |num| 21) (|:| |den| 7))
              (16 . |integralDerivationMatrix|) (|Matrix| 7) (21 . |transpose|)
              (|Record| (|:| |num| 32) (|:| |den| 7))
              (26 . |integralCoordinates|) (31 . |One|) (|Boolean|) (35 . ~=)
              (|Union| $ '"failed") (41 . |exquo|) (47 . |gcd|) (53 . *)
              (|Vector| 7) (59 . *) (|Factored| $) (65 . |squareFree|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 36) (|:| |factor| 7) (|:| |exponent| 41))
              (|List| 37) (|Factored| 7) (70 . |factorList|)
              (|NonNegativeInteger|) (75 . >) (81 . ^) (87 . *) (|Integer|)
              (93 . |minIndex|) (98 . |One|) (102 . *) (108 . -)
              (113 . |scalarMatrix|) (119 . +) (125 . |integralRepresents|)
              (131 . *) (137 . +) (143 . -) (149 . |row|) (155 . |dot|)
              (161 . +) (167 . |diagonal?|) (172 . |maxRowIndex|)
              (177 . |maxColIndex|) (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 62 '"failed") (182 . |extendedEuclidean|) (|Fraction| 7)
              (189 . |coerce|) (|Matrix| 65) (|Mapping| 65 7)
              (|MatrixCategoryFunctions2| 7 32 32 21 65 71 71 67) (194 . |map|)
              (|Vector| 65) (|VectorFunctions2| 7 65) (200 . |map|)
              (|Union| 71 '"failed") (|LinearSystemMatrixPackage| 65 71 71 67)
              (206 . |particularSolution|) (212 . |denom|) (217 . |numer|)
              (222 . |rem|))
           '#(|HermiteIntegrate| 228) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 79
                                                 '(0 6 0 10 0 7 0 11 0 9 0 12 0
                                                   9 17 18 1 9 19 14 20 1 21 0
                                                   0 22 1 9 23 0 24 0 7 0 25 2
                                                   7 26 0 0 27 2 7 28 0 0 29 2
                                                   7 0 0 0 30 2 7 0 0 0 31 2 32
                                                   0 7 0 33 1 7 34 0 35 1 39 38
                                                   0 40 2 41 26 0 0 42 2 7 0 0
                                                   41 43 2 21 0 7 0 44 1 32 45
                                                   0 46 0 6 0 47 2 7 0 41 0 48
                                                   1 7 0 0 49 2 21 0 41 7 50 2
                                                   21 0 0 0 51 2 9 0 32 7 52 2
                                                   9 0 0 0 53 2 9 0 0 0 54 2 7
                                                   0 0 0 55 2 21 32 0 45 56 2
                                                   32 7 0 0 57 2 7 0 0 0 58 1
                                                   21 26 0 59 1 21 45 0 60 1 21
                                                   45 0 61 3 7 63 0 0 0 64 1 65
                                                   0 7 66 2 69 67 68 21 70 2 72
                                                   71 68 32 73 2 75 74 67 71 76
                                                   1 65 7 0 77 1 65 7 0 78 2 7
                                                   0 0 0 79 3 0 13 9 14 9 15 2
                                                   0 13 9 14 16)))))
           '|lookupComplete|)) 
