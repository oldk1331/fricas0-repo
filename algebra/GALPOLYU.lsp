
(/VERSIONCHECK 2) 

(DEFUN |GALPOLYU;factorsOfDegree;PiFL;1| (|d| |r| $)
  (PROG (|lfact| #1=#:G133 |i| #2=#:G132 |fr|)
    (RETURN
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
                   (SEQ (LETT |i| 1 . #3#) (LETT #1# (QCDR |fr|) . #3#) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |lfact| (CONS (QCAR |fr|) |lfact|) . #3#)))
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT NIL))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |lfact|))))) 

(DEFUN |GALPOLYU;factorOfDegree;PiFUP;2| (|d| |r| $)
  (PROG (#1=#:G137 |factor| #2=#:G138 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |factor| (|spadConstant| $ 17)
              . #3=(|GALPOLYU;factorOfDegree;PiFUP;2|))
        (SEQ (LETT |i| 1 . #3#) (LETT #2# (SPADCALL |r| (QREFELT $ 18)) . #3#)
             G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
             (SEQ (LETT |factor| (SPADCALL |r| |i| (QREFELT $ 20)) . #3#)
                  (EXIT
                   (COND
                    ((EQL (SPADCALL |factor| (QREFELT $ 13)) |d|)
                     (PROGN (LETT #1# |factor| . #3#) (GO #1#))))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT (|error| "factorOfDegree: Bad arguments"))))
      #1# (EXIT #1#))))) 

(DEFUN |GALPOLYU;degreePartition;FM;3| (|r| $)
  (PROG (#1=#:G142 |i| #2=#:G141)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|GALPOLYU;degreePartition;FM;3|))
        (SEQ (LETT |i| 1 . #3#) (LETT #1# (SPADCALL |r| (QREFELT $ 18)) . #3#)
             G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
             (SEQ
              (EXIT
               (LETT #2#
                     (CONS
                      (SPADCALL (SPADCALL |r| |i| (QREFELT $ 20))
                                (QREFELT $ 13))
                      #2#)
                     . #3#)))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
             (EXIT (NREVERSE #2#))))
       (QREFELT $ 24)))))) 

(DEFUN |GALPOLYU;monic?;UPB;4| (|p| $)
  (SPADCALL (SPADCALL |p| (QREFELT $ 26)) (|spadConstant| $ 27) (QREFELT $ 29))) 

(DEFUN |GALPOLYU;unvectorise;VUP;5| (|v| $)
  (PROG (|p| #1=#:G144 #2=#:G148 |i|)
    (RETURN
     (SEQ (LETT |p| (|spadConstant| $ 17) . #3=(|GALPOLYU;unvectorise;VUP;5|))
          (SEQ (LETT |i| 1 . #3#) (LETT #2# (QVSIZE |v|) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |p|
                       (SPADCALL |p|
                                 (SPADCALL (SPADCALL |v| |i| (QREFELT $ 32))
                                           (PROG1 (LETT #1# (- |i| 1) . #3#)
                                             (|check_subtype| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              #1#))
                                           (QREFELT $ 34))
                                 (QREFELT $ 35))
                       . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |p|))))) 

(DEFUN |GALPOLYU;reverse;2UP;6| (|p| $)
  (PROG (|r| #1=#:G149 |i| |n|)
    (RETURN
     (SEQ (LETT |r| (|spadConstant| $ 17) . #2=(|GALPOLYU;reverse;2UP;6|))
          (LETT |n| (SPADCALL |p| (QREFELT $ 13)) . #2#)
          (SEQ (LETT |i| 0 . #2#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |r|
                       (SPADCALL |r|
                                 (SPADCALL
                                  (SPADCALL |p|
                                            (PROG1 (LETT #1# (- |n| |i|) . #2#)
                                              (|check_subtype| (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               #1#))
                                            (QREFELT $ 37))
                                  |i| (QREFELT $ 34))
                                 (QREFELT $ 35))
                       . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |r|))))) 

(DEFUN |GALPOLYU;scaleRoots;UPRUP;7| (|p| |c| $)
  (PROG (|mc| |r| |i| |n|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |c| (|spadConstant| $ 27) (QREFELT $ 29)) |p|)
            (#1='T
             (SEQ
              (LETT |n| (SPADCALL |p| (QREFELT $ 13))
                    . #2=(|GALPOLYU;scaleRoots;UPRUP;7|))
              (EXIT
               (COND
                ((SPADCALL |c| (QREFELT $ 39))
                 (SPADCALL (SPADCALL |p| (QREFELT $ 26)) |n| (QREFELT $ 34)))
                (#1#
                 (SEQ (LETT |r| (|spadConstant| $ 17) . #2#)
                      (LETT |mc| (|spadConstant| $ 27) . #2#)
                      (SEQ (LETT |i| |n| . #2#) G190
                           (COND ((< |i| 0) (GO G191)))
                           (SEQ
                            (LETT |r|
                                  (SPADCALL |r|
                                            (SPADCALL
                                             (SPADCALL |mc|
                                                       (SPADCALL |p| |i|
                                                                 (QREFELT $
                                                                          37))
                                                       (QREFELT $ 40))
                                             |i| (QREFELT $ 34))
                                            (QREFELT $ 35))
                                  . #2#)
                            (EXIT
                             (LETT |mc| (SPADCALL |mc| |c| (QREFELT $ 40))
                                   . #2#)))
                           (LETT |i| (+ |i| -1) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT |r|)))))))))))) 

(DEFUN |GALPOLYU;shiftRoots;UPRUP;8| (|p| |c| $)
  (SPADCALL (SPADCALL (ELT $ 42) |p| (QREFELT $ 46))
            (SPADCALL (SPADCALL (|spadConstant| $ 27) 1 (QREFELT $ 34))
                      (SPADCALL |c| (QREFELT $ 42)) (QREFELT $ 47))
            (QREFELT $ 48))) 

(DEFUN |GaloisGroupPolynomialUtilities| (&REST #1=#:G168)
  (PROG ()
    (RETURN
     (PROG (#2=#:G169)
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
              (PROG1 (APPLY (|function| |GaloisGroupPolynomialUtilities;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|GaloisGroupPolynomialUtilities|))))))))))) 

(DEFUN |GaloisGroupPolynomialUtilities;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|GaloisGroupPolynomialUtilities|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|GaloisGroupPolynomialUtilities| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 50) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|GaloisGroupPolynomialUtilities|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|GaloisGroupPolynomialUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 19)) (|List| 8)
              (|Factored| 7) (0 . |factors|) (|NonNegativeInteger|)
              (5 . |degree|) (|List| 7) (|PositiveInteger|)
              |GALPOLYU;factorsOfDegree;PiFL;1| (10 . |Zero|)
              (14 . |numberOfFactors|) (|Integer|) (19 . |nthFactor|)
              |GALPOLYU;factorOfDegree;PiFUP;2| (|List| 12) (|Multiset| 12)
              (25 . |multiset|) |GALPOLYU;degreePartition;FM;3|
              (30 . |leadingCoefficient|) (35 . |One|) (|Boolean|) (39 . =)
              |GALPOLYU;monic?;UPB;4| (|Vector| 6) (45 . |elt|) (51 . |One|)
              (55 . |monomial|) (61 . +) |GALPOLYU;unvectorise;VUP;5|
              (67 . |coefficient|) |GALPOLYU;reverse;2UP;6| (73 . |zero?|)
              (78 . *) |GALPOLYU;scaleRoots;UPRUP;7| (84 . |coerce|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 7 43) (89 . |map|)
              (95 . -) (101 . |elt|) |GALPOLYU;shiftRoots;UPRUP;8|)
           '#(|unvectorise| 107 |shiftRoots| 112 |scaleRoots| 118 |reverse| 124
              |monic?| 129 |factorsOfDegree| 134 |factorOfDegree| 140
              |degreePartition| 146)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 49
                                                 '(1 10 9 0 11 1 7 12 0 13 0 7
                                                   0 17 1 10 12 0 18 2 10 7 0
                                                   19 20 1 23 0 22 24 1 7 6 0
                                                   26 0 6 0 27 2 6 28 0 0 29 2
                                                   31 6 0 19 32 0 7 0 33 2 7 0
                                                   6 12 34 2 7 0 0 0 35 2 7 6 0
                                                   12 37 1 6 28 0 39 2 6 0 0 0
                                                   40 1 7 0 6 42 2 45 43 44 7
                                                   46 2 7 0 0 0 47 2 43 7 0 7
                                                   48 1 0 7 31 36 2 0 7 7 6 49
                                                   2 0 7 7 6 41 1 0 7 7 38 1 0
                                                   28 7 30 2 0 14 15 10 16 2 0
                                                   7 15 10 21 1 0 23 10 25)))))
           '|lookupComplete|)) 
