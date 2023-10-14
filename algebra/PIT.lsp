
(/VERSIONCHECK 2) 

(DEFUN |PIT;split;PMR;1| (|p| |der| $)
  (PROG (|rec1| #1=#:G133 |pbar| |gdif| |gder| |p1| |rec0| |up1| |p0| |up| |v|)
    (RETURN
     (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 10)) . #2=(|PIT;split;PMR;1|))
          (EXIT
           (COND ((QEQCAR |v| 1) (CONS |p| (|spadConstant| $ 12)))
                 (#3='T
                  (SEQ
                   (LETT |up| (SPADCALL |p| (QCDR |v|) (QREFELT $ 14)) . #2#)
                   (LETT |p0| (SPADCALL |up| (QREFELT $ 16)) . #2#)
                   (LETT |up1|
                         (SPADCALL
                          (CONS #'|PIT;split;PMR;1!0|
                                (VECTOR (QREFELT $ 8) $ |p0|))
                          |up| (QREFELT $ 20))
                         . #2#)
                   (LETT |rec0| (SPADCALL |p0| |der| (QREFELT $ 22)) . #2#)
                   (LETT |p1| (SPADCALL |up1| (QCDR |v|) (QREFELT $ 23)) . #2#)
                   (LETT |gder|
                         (SPADCALL |p1| (SPADCALL |p| |der|) (QREFELT $ 24))
                         . #2#)
                   (LETT |gdif|
                         (SPADCALL |p1|
                                   (SPADCALL |p1| (QCDR |v|) (QREFELT $ 25))
                                   (QREFELT $ 24))
                         . #2#)
                   (LETT |pbar|
                         (PROG2
                             (LETT #1# (SPADCALL |gder| |gdif| (QREFELT $ 18))
                                   . #2#)
                             (QCDR #1#)
                           (|check_union| (QEQCAR #1# 0) (QREFELT $ 8) #1#))
                         . #2#)
                   (EXIT
                    (COND
                     ((SPADCALL |pbar| (QREFELT $ 27))
                      (CONS (SPADCALL (QCAR |rec0|) |p1| (QREFELT $ 28))
                            (QCDR |rec0|)))
                     (#3#
                      (SEQ
                       (LETT |rec1|
                             (SPADCALL
                              (PROG2
                                  (LETT #1#
                                        (SPADCALL |p1| |pbar| (QREFELT $ 18))
                                        . #2#)
                                  (QCDR #1#)
                                (|check_union| (QEQCAR #1# 0) (QREFELT $ 8)
                                               #1#))
                              |der| (QREFELT $ 22))
                             . #2#)
                       (EXIT
                        (CONS
                         (SPADCALL (QCAR |rec0|) (QCAR |rec1|) (QREFELT $ 28))
                         (SPADCALL
                          (SPADCALL (QCDR |rec0|) |pbar| (QREFELT $ 28))
                          (QCDR |rec1|) (QREFELT $ 28)))))))))))))))) 

(DEFUN |PIT;split;PMR;1!0| (|x| $$)
  (PROG (|p0| $ P)
    (LETT |p0| (QREFELT $$ 2) . #1=(|PIT;split;PMR;1|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT P (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G133)
        (RETURN
         (PROG2 (LETT #2# (SPADCALL |x| |p0| (QREFELT $ 18)) NIL)
             (QCDR #2#)
           (|check_union| (QEQCAR #2# 0) P #2#)))))))) 

(DEFUN |ParallelIntegrationTools| (&REST #1=#:G145)
  (PROG ()
    (RETURN
     (PROG (#2=#:G146)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ParallelIntegrationTools|)
                                           '|domainEqualList|)
                . #3=(|ParallelIntegrationTools|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ParallelIntegrationTools;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ParallelIntegrationTools|))))))))))) 

(DEFUN |ParallelIntegrationTools;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ParallelIntegrationTools|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|ParallelIntegrationTools| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 29) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ParallelIntegrationTools|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ParallelIntegrationTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Union| 7 '"failed") (0 . |mainVariable|)
              (5 . |One|) (9 . |One|) (|SparseUnivariatePolynomial| $)
              (13 . |univariate|) (|SparseUnivariatePolynomial| 8)
              (19 . |content|) (|Union| $ '"failed") (24 . |exquo|)
              (|Mapping| 8 8) (30 . |map|)
              (|Record| (|:| |normal| 8) (|:| |special| 8)) |PIT;split;PMR;1|
              (36 . |multivariate|) (42 . |gcd|) (48 . |differentiate|)
              (|Boolean|) (54 . |ground?|) (59 . *))
           '#(|split| 65) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(1 8 9 0 10 0 6 0 11 0 8 0 12
                                                   2 8 13 0 7 14 1 15 8 0 16 2
                                                   8 17 0 0 18 2 15 0 19 0 20 2
                                                   8 0 13 7 23 2 8 0 0 0 24 2 8
                                                   0 0 7 25 1 8 26 0 27 2 8 0 0
                                                   0 28 2 0 21 8 19 22)))))
           '|lookupComplete|)) 
