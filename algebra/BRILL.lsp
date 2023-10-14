
(/VERSIONCHECK 2) 

(DEFUN |BRILL;squaredPolynomial| (|p| $)
  (PROG (|d|)
    (RETURN
     (SEQ (LETT |d| (SPADCALL |p| (QREFELT $ 8)) |BRILL;squaredPolynomial|)
          (EXIT
           (COND ((EQL |d| 0) 'T) ((ODDP |d|) 'NIL)
                 ('T
                  (|BRILL;squaredPolynomial| (SPADCALL |p| (QREFELT $ 10))
                   $)))))))) 

(DEFUN |BRILL;primeEnough?| (|n| |b| $)
  (PROG (#1=#:G148 |bb| #2=#:G142 |d| |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |bb| (SPADCALL |b| (QREFELT $ 13)) . #3=(|BRILL;primeEnough?|))
        (SEQ (LETT |i| 2 . #3#) G190 (COND ((|greater_SI| |i| |b|) (GO G191)))
             (SEQ
              (EXIT
               (SEQ G190
                    (COND
                     ((NULL
                       (QEQCAR
                        (LETT |d| (SPADCALL |n| |i| (QREFELT $ 15)) . #3#) 0))
                      (GO G191)))
                    (SEQ
                     (LETT |n|
                           (PROG2 (LETT #2# |d| . #3#)
                               (QCDR #2#)
                             (|check_union| (QEQCAR #2# 0) (|Integer|) #2#))
                           . #3#)
                     (LETT |bb|
                           (SPADCALL |bb| (SPADCALL |i| (QREFELT $ 13))
                                     (QREFELT $ 16))
                           . #3#)
                     (EXIT
                      (COND
                       ((SPADCALL |bb| (|spadConstant| $ 17) (QREFELT $ 19))
                        (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
                    NIL (GO G190) G191 (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT (SPADCALL |n| (QREFELT $ 20)))))
      #1# (EXIT #1#))))) 

(DEFUN |BRILL;brillhartTrials;Nni;3| ($) (QREFELT $ 21)) 

(DEFUN |BRILL;brillhartTrials;2Nni;4| (|n| $)
  (PROG (|#G9| |#G8|)
    (RETURN
     (SEQ
      (PROGN
       (LETT |#G8| |n| . #1=(|BRILL;brillhartTrials;2Nni;4|))
       (LETT |#G9| (QREFELT $ 21) . #1#)
       (SETELT $ 21 |#G8|)
       (LETT |n| |#G9| . #1#))
      (EXIT |n|))))) 

(DEFUN |BRILL;brillhartIrreducible?;UPB;5| (|p| $)
  (SPADCALL |p| (SPADCALL |p| (QREFELT $ 24)) (QREFELT $ 25))) 

(DEFUN |BRILL;brillhartIrreducible?;UP2B;6| (|p| |noLinears| $)
  (PROG (#1=#:G156 #2=#:G164 |small| |i| |count| |largeEnough| |polyx2| |even1|
         |even0| |origBound|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((ZEROP (QREFELT $ 21)) 'NIL)
             (#3='T
              (SEQ
               (LETT |origBound|
                     (LETT |largeEnough| (+ (SPADCALL |p| (QREFELT $ 28)) 1)
                           . #4=(|BRILL;brillhartIrreducible?;UP2B;6|))
                     . #4#)
               (LETT |even0|
                     (SPADCALL (SPADCALL |p| 0 (QREFELT $ 29)) (QREFELT $ 30))
                     . #4#)
               (LETT |even1|
                     (SPADCALL (SPADCALL |p| 1 (QREFELT $ 32)) (QREFELT $ 30))
                     . #4#)
               (LETT |polyx2| (|BRILL;squaredPolynomial| |p| $) . #4#)
               (EXIT
                (COND
                 ((SPADCALL (SPADCALL |p| |largeEnough| (QREFELT $ 32))
                            (QREFELT $ 20))
                  'T)
                 (#3#
                  (SEQ
                   (COND
                    ((NULL |polyx2|)
                     (COND
                      ((SPADCALL
                        (SPADCALL |p| (- |largeEnough|) (QREFELT $ 32))
                        (QREFELT $ 20))
                       (EXIT 'T)))))
                   (EXIT
                    (COND ((EQL (QREFELT $ 21) 1) 'NIL)
                          (#3#
                           (SEQ (LETT |largeEnough| (+ |largeEnough| 1) . #4#)
                                (EXIT
                                 (COND
                                  ((|BRILL;primeEnough?|
                                    (SPADCALL |p| |largeEnough| (QREFELT $ 32))
                                    (COND (|noLinears| 4) (#3# 2)) $)
                                   'T)
                                  (#3#
                                   (SEQ
                                    (COND
                                     ((NULL |polyx2|)
                                      (COND
                                       ((|BRILL;primeEnough?|
                                         (SPADCALL |p| (- |largeEnough|)
                                                   (QREFELT $ 32))
                                         (COND (|noLinears| 4) (#3# 2)) $)
                                        (EXIT 'T)))))
                                    (COND
                                     ((ODDP |largeEnough|)
                                      (COND
                                       ((OR |even0| |even1|)
                                        (LETT |largeEnough| (+ |largeEnough| 1)
                                              . #4#)))))
                                    (LETT |count|
                                          (+
                                           (* (COND (|polyx2| 2) (#3# 1))
                                              (- (QREFELT $ 21) 2))
                                           |largeEnough|)
                                          . #4#)
                                    (SEQ (LETT |i| (+ |largeEnough| 1) . #4#)
                                         G190
                                         (COND ((> |i| |count|) (GO G191)))
                                         (SEQ
                                          (LETT |small|
                                                (COND
                                                 (|noLinears|
                                                  (EXPT (- |i| |origBound|) 2))
                                                 ('T (- |i| |origBound|)))
                                                . #4#)
                                          (EXIT
                                           (COND
                                            ((|BRILL;primeEnough?|
                                              (SPADCALL |p| |i| (QREFELT $ 32))
                                              |small| $)
                                             (PROGN
                                              (LETT #2# 'T . #4#)
                                              (GO #2#)))
                                            ((NULL |polyx2|)
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((|BRILL;primeEnough?|
                                                  (SPADCALL |p| (- |i|)
                                                            (QREFELT $ 32))
                                                  |small| $)
                                                 (PROGN
                                                  (LETT #1#
                                                        (PROGN
                                                         (LETT #2# 'T . #4#)
                                                         (GO #2#))
                                                        . #4#)
                                                  (GO #1#)))))
                                              #1# (EXIT #1#))))))
                                         (LETT |i| (+ |i| 1) . #4#) (GO G190)
                                         G191 (EXIT NIL))
                                    (EXIT 'NIL)))))))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |BRILL;noLinearFactor?;UPB;7| (|p| $)
  (COND
   ((ODDP (SPADCALL |p| (QREFELT $ 33)))
    (COND
     ((ODDP (SPADCALL |p| 0 (QREFELT $ 29)))
      (ODDP (SPADCALL |p| 1 (QREFELT $ 32))))
     (#1='T 'NIL)))
   (#1# 'NIL))) 

(DEFUN |BrillhartTests| (#1=#:G168)
  (PROG ()
    (RETURN
     (PROG (#2=#:G169)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|BrillhartTests|)
                                           '|domainEqualList|)
                . #3=(|BrillhartTests|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|BrillhartTests;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|BrillhartTests|))))))))))) 

(DEFUN |BrillhartTests;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|BrillhartTests|))
      (LETT |dv$| (LIST '|BrillhartTests| DV$1) . #1#)
      (LETT $ (GETREFV 34) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|BrillhartTests| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 21 6)
      $)))) 

(MAKEPROP '|BrillhartTests| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              (0 . |degree|) (5 . |Zero|) (9 . |reductum|) (|Integer|)
              (|Float|) (14 . |coerce|) (|Union| $ '"failed") (19 . |exquo|)
              (25 . /) (31 . |One|) (|Boolean|) (35 . <) (41 . |prime?|)
              '|brillharttrials| |BRILL;brillhartTrials;Nni;3|
              |BRILL;brillhartTrials;2Nni;4| |BRILL;noLinearFactor?;UPB;7|
              |BRILL;brillhartIrreducible?;UP2B;6|
              |BRILL;brillhartIrreducible?;UPB;5|
              (|GaloisGroupFactorizationUtilities| 11 6 12) (46 . |rootBound|)
              (51 . |coefficient|) (57 . |even?|) (62 . |One|) (66 . |elt|)
              (72 . |leadingCoefficient|))
           '#(|noLinearFactor?| 77 |brillhartTrials| 82 |brillhartIrreducible?|
              91)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 33
                                                 '(1 6 7 0 8 0 6 0 9 1 6 0 0 10
                                                   1 12 0 11 13 2 11 14 0 0 15
                                                   2 12 0 0 0 16 0 12 0 17 2 12
                                                   18 0 0 19 1 11 18 0 20 1 27
                                                   11 6 28 2 6 11 0 7 29 1 11
                                                   18 0 30 0 6 0 31 2 6 11 0 11
                                                   32 1 6 11 0 33 1 0 18 6 24 0
                                                   0 7 22 1 0 7 7 23 2 0 18 6
                                                   18 25 1 0 18 6 26)))))
           '|lookupComplete|)) 
