
(SDEFUN |GALPOLYU;factorsOfDegree;PiFL;1|
        ((|d| |PositiveInteger|) (|r| |Factored| UP) ($ |List| UP))
        (SPROG
         ((|lfact| (|List| UP)) (#1=#:G112 NIL) (|i| NIL) (#2=#:G111 NIL)
          (|fr| NIL))
         (SEQ (LETT |lfact| NIL . #3=(|GALPOLYU;factorsOfDegree;PiFL;1|))
              (SEQ (LETT |fr| NIL . #3#)
                   (LETT #2# (SPADCALL |r| (QREFELT $ 11)) . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |fr| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (SPADCALL (QCAR |fr|) (QREFELT $ 13)) |d|)
                       (SEQ (LETT |i| 1 . #3#) (LETT #1# (QCDR |fr|) . #3#)
                            G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |lfact| (CONS (QCAR |fr|) |lfact|) . #3#)))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL))))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |lfact|)))) 

(SDEFUN |GALPOLYU;factorOfDegree;PiFUP;2|
        ((|d| |PositiveInteger|) (|r| |Factored| UP) ($ UP))
        (SPROG ((#1=#:G118 NIL) (|factor| (UP)) (#2=#:G119 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |factor| (|spadConstant| $ 17)
                        . #3=(|GALPOLYU;factorOfDegree;PiFUP;2|))
                  (SEQ (LETT |i| NIL . #3#)
                       (LETT #2# (SPADCALL |r| (QREFELT $ 21)) . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ (LETT |factor| (QVELT |i| 1) . #3#)
                            (EXIT
                             (COND
                              ((EQL (SPADCALL |factor| (QREFELT $ 13)) |d|)
                               (PROGN
                                (LETT #1# |factor| . #3#)
                                (GO #4=#:G117))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT (|error| "factorOfDegree: Bad arguments"))))
                #4# (EXIT #1#)))) 

(SDEFUN |GALPOLYU;degreePartition;FM;3|
        ((|r| |Factored| UP) ($ |Multiset| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G124 NIL) (|i| NIL) (#2=#:G123 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|GALPOLYU;degreePartition;FM;3|))
                  (SEQ (LETT |i| NIL . #3#)
                       (LETT #1# (SPADCALL |r| (QREFELT $ 21)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS (SPADCALL (QVELT |i| 1) (QREFELT $ 13))
                                     #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 25))))) 

(SDEFUN |GALPOLYU;monic?;UPB;4| ((|p| UP) ($ |Boolean|))
        (SPADCALL (SPADCALL |p| (QREFELT $ 27)) (|spadConstant| $ 28)
                  (QREFELT $ 30))) 

(SDEFUN |GALPOLYU;reverse;2UP;5| ((|p| UP) ($ UP))
        (SPROG
         ((|r| (UP)) (#1=#:G126 NIL) (#2=#:G130 NIL) (|i| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |r| (|spadConstant| $ 17) . #3=(|GALPOLYU;reverse;2UP;5|))
              (LETT |n| (SPADCALL |p| (QREFELT $ 13)) . #3#)
              (SEQ (LETT |i| 0 . #3#) (LETT #2# |n| . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |r|
                           (SPADCALL |r|
                                     (SPADCALL
                                      (SPADCALL |p|
                                                (PROG1
                                                    (LETT #1# (- |n| |i|)
                                                          . #3#)
                                                  (|check_subtype2| (>= #1# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #1#))
                                                (QREFELT $ 32))
                                      |i| (QREFELT $ 33))
                                     (QREFELT $ 34))
                           . #3#)))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |GALPOLYU;scaleRoots;UPRUP;6| ((|p| UP) (|c| R) ($ UP))
        (SPROG ((|mc| (R)) (|r| (UP)) (|i| NIL) (|n| (|NonNegativeInteger|)))
               (SEQ
                (COND ((SPADCALL |c| (|spadConstant| $ 28) (QREFELT $ 30)) |p|)
                      (#1='T
                       (SEQ
                        (LETT |n| (SPADCALL |p| (QREFELT $ 13))
                              . #2=(|GALPOLYU;scaleRoots;UPRUP;6|))
                        (EXIT
                         (COND
                          ((SPADCALL |c| (QREFELT $ 37))
                           (SPADCALL (SPADCALL |p| (QREFELT $ 27)) |n|
                                     (QREFELT $ 33)))
                          (#1#
                           (SEQ (LETT |r| (|spadConstant| $ 17) . #2#)
                                (LETT |mc| (|spadConstant| $ 28) . #2#)
                                (SEQ (LETT |i| |n| . #2#) G190
                                     (COND ((< |i| 0) (GO G191)))
                                     (SEQ
                                      (LETT |r|
                                            (SPADCALL |r|
                                                      (SPADCALL
                                                       (SPADCALL |mc|
                                                                 (SPADCALL |p|
                                                                           |i|
                                                                           (QREFELT
                                                                            $
                                                                            32))
                                                                 (QREFELT $
                                                                          38))
                                                       |i| (QREFELT $ 33))
                                                      (QREFELT $ 34))
                                            . #2#)
                                      (EXIT
                                       (LETT |mc|
                                             (SPADCALL |mc| |c| (QREFELT $ 38))
                                             . #2#)))
                                     (LETT |i| (+ |i| -1) . #2#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT |r|))))))))))) 

(SDEFUN |GALPOLYU;shiftRoots;UPRUP;7| ((|p| UP) (|c| R) ($ UP))
        (SPADCALL (SPADCALL (ELT $ 40) |p| (QREFELT $ 44))
                  (SPADCALL (SPADCALL (|spadConstant| $ 28) 1 (QREFELT $ 33))
                            (SPADCALL |c| (QREFELT $ 40)) (QREFELT $ 45))
                  (QREFELT $ 46))) 

(DECLAIM (NOTINLINE |GaloisGroupPolynomialUtilities;|)) 

(DEFUN |GaloisGroupPolynomialUtilities| (&REST #1=#:G146)
  (SPROG NIL
         (PROG (#2=#:G147)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GaloisGroupPolynomialUtilities|)
                                               '|domainEqualList|)
                    . #3=(|GaloisGroupPolynomialUtilities|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GaloisGroupPolynomialUtilities;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GaloisGroupPolynomialUtilities|)))))))))) 

(DEFUN |GaloisGroupPolynomialUtilities;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|GaloisGroupPolynomialUtilities|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|GaloisGroupPolynomialUtilities| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 48) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|GaloisGroupPolynomialUtilities|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|GaloisGroupPolynomialUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 12)) (|List| 8)
              (|Factored| 7) (0 . |factors|) (|NonNegativeInteger|)
              (5 . |degree|) (|List| 7) (|PositiveInteger|)
              |GALPOLYU;factorsOfDegree;PiFL;1| (10 . |Zero|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 18) (|:| |factor| 7) (|:| |exponent| 12))
              (|List| 19) (14 . |factorList|) |GALPOLYU;factorOfDegree;PiFUP;2|
              (|List| 12) (|Multiset| 12) (19 . |multiset|)
              |GALPOLYU;degreePartition;FM;3| (24 . |leadingCoefficient|)
              (29 . |One|) (|Boolean|) (33 . =) |GALPOLYU;monic?;UPB;4|
              (39 . |coefficient|) (45 . |monomial|) (51 . +)
              |GALPOLYU;reverse;2UP;5| (57 . |One|) (61 . |zero?|) (66 . *)
              |GALPOLYU;scaleRoots;UPRUP;6| (72 . |coerce|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 7 41) (77 . |map|)
              (83 . -) (89 . |elt|) |GALPOLYU;shiftRoots;UPRUP;7|)
           '#(|shiftRoots| 95 |scaleRoots| 101 |reverse| 107 |monic?| 112
              |factorsOfDegree| 117 |factorOfDegree| 123 |degreePartition| 129)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 47
                                                 '(1 10 9 0 11 1 7 12 0 13 0 7
                                                   0 17 1 10 20 0 21 1 24 0 23
                                                   25 1 7 6 0 27 0 6 0 28 2 6
                                                   29 0 0 30 2 7 6 0 12 32 2 7
                                                   0 6 12 33 2 7 0 0 0 34 0 7 0
                                                   36 1 6 29 0 37 2 6 0 0 0 38
                                                   1 7 0 6 40 2 43 41 42 7 44 2
                                                   7 0 0 0 45 2 41 7 0 7 46 2 0
                                                   7 7 6 47 2 0 7 7 6 39 1 0 7
                                                   7 35 1 0 29 7 31 2 0 14 15
                                                   10 16 2 0 7 15 10 22 1 0 24
                                                   10 26)))))
           '|lookupComplete|)) 
