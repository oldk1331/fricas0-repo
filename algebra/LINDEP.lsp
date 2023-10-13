
(/VERSIONCHECK 2) 

(DEFUN |LINDEP;aNonZeroSolution| (|m| $)
  (PROG (|ns|)
    (RETURN
     (COND
      ((NULL
        (LETT |ns| (SPADCALL |m| (QREFELT $ 10)) |LINDEP;aNonZeroSolution|))
       (CONS 1 "failed"))
      ('T (CONS 0 (|SPADfirst| |ns|))))))) 

(DEFUN |LINDEP;linearlyDependent?;VB;2| (|v| $)
  (PROG (|n|)
    (RETURN
     (COND
      ((ZEROP (LETT |n| (QVSIZE |v|) |LINDEP;linearlyDependent?;VB;2|)) 'T)
      ((EQL |n| 1)
       (SPADCALL (SPADCALL |v| (SPADCALL |v| (QREFELT $ 15)) (QREFELT $ 16))
                 (QREFELT $ 18)))
      ('T
       (SPADCALL
        (SPADCALL (SPADCALL (SPADCALL |v| (QREFELT $ 20)) (QREFELT $ 22))
                  (QREFELT $ 24))
        (QREFELT $ 25))))))) 

(DEFUN |LINDEP;linearDependence;VU;3| (|v| $)
  (PROG (|n|)
    (RETURN
     (COND
      ((ZEROP (LETT |n| (QVSIZE |v|) |LINDEP;linearDependence;VU;3|))
       (CONS 0 (MAKE-ARRAY 0)))
      ((EQL |n| 1)
       (COND
        ((SPADCALL (SPADCALL |v| (SPADCALL |v| (QREFELT $ 15)) (QREFELT $ 16))
                   (QREFELT $ 18))
         (CONS 0 (MAKEARR1 1 (|spadConstant| $ 11))))
        (#1='T (CONS 1 "failed"))))
      (#1#
       (|LINDEP;aNonZeroSolution|
        (SPADCALL (SPADCALL |v| (QREFELT $ 20)) (QREFELT $ 22)) $)))))) 

(DEFUN |LINDEP;solveLinear;VRU;4| (|v| |c| $)
  (COND
   ((SPADCALL |c| (QREFELT $ 18))
    (CONS 0 (MAKEARR1 (QVSIZE |v|) (|spadConstant| $ 29))))
   ((SPADCALL |v| (QREFELT $ 30)) (CONS 1 "failed"))
   ('T
    (SPADCALL (SPADCALL |v| (QREFELT $ 20)) (MAKEARR1 1 |c|) (QREFELT $ 31))))) 

(DEFUN |LINDEP;solveLinear;MVU;5| (|m| |v| $)
  (PROG (|sys|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |v| (SPADCALL (QVSIZE |v|) (QREFELT $ 33)) (QREFELT $ 34))
        (CONS 0
              (MAKEARR1 (SPADCALL |m| (QREFELT $ 35)) (|spadConstant| $ 29))))
       ('T
        (SEQ
         (LETT |sys| (SPADCALL |m| |v| (QREFELT $ 38))
               |LINDEP;solveLinear;MVU;5|)
         (EXIT (SPADCALL (QCAR |sys|) (QCDR |sys|) (QREFELT $ 41)))))))))) 

(DEFUN |LINDEP;solveLinear;VRU;6| (|v| |c| $)
  (COND
   ((SPADCALL |c| (QREFELT $ 18))
    (CONS 0 (MAKEARR1 (QVSIZE |v|) (|spadConstant| $ 43))))
   ((SPADCALL |v| (QREFELT $ 30)) (CONS 1 "failed"))
   ('T
    (SPADCALL (SPADCALL |v| (QREFELT $ 20)) (MAKEARR1 1 |c|) (QREFELT $ 45))))) 

(DEFUN |LINDEP;solveLinear;MVU;7| (|m| |v| $)
  (PROG (|sys|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |v| (SPADCALL (QVSIZE |v|) (QREFELT $ 33)) (QREFELT $ 34))
        (CONS 0
              (MAKEARR1 (SPADCALL |m| (QREFELT $ 35)) (|spadConstant| $ 43))))
       ('T
        (SEQ
         (LETT |sys| (SPADCALL |m| |v| (QREFELT $ 38))
               |LINDEP;solveLinear;MVU;7|)
         (EXIT
          (SPADCALL (SPADCALL (ELT $ 47) (QCAR |sys|) (QREFELT $ 51))
                    (SPADCALL (ELT $ 47) (QCDR |sys|) (QREFELT $ 54))
                    (QREFELT $ 56)))))))))) 

(DEFUN |LinearDependence| (&REST #1=#:G178)
  (PROG ()
    (RETURN
     (PROG (#2=#:G179)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|LinearDependence|)
                                           '|domainEqualList|)
                . #3=(|LinearDependence|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |LinearDependence;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|LinearDependence|))))))))))) 

(DEFUN |LinearDependence;| (|#1| |#2|)
  (PROG (|pv$| #1=#:G177 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|LinearDependence|))
      (LETT DV$2 (|devaluate| |#2|) . #2#)
      (LETT |dv$| (LIST '|LinearDependence| DV$1 DV$2) . #2#)
      (LETT $ (GETREFV 57) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #1#
                                                (|HasCategory| |#1| '(|Field|))
                                                . #2#)
                                          (|not| #1#)))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|LinearDependence| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 32
                   (CONS (|dispatchFunction| |LINDEP;solveLinear;VRU;4|) $))
         (QSETREFV $ 31
                   (CONS (|dispatchFunction| |LINDEP;solveLinear;MVU;5|) $))))
       ('T
        (PROGN
         (QSETREFV $ 46
                   (CONS (|dispatchFunction| |LINDEP;solveLinear;VRU;6|) $))
         (QSETREFV $ 45
                   (CONS (|dispatchFunction| |LINDEP;solveLinear;MVU;7|) $)))))
      $)))) 

(MAKEPROP '|LinearDependence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| 39)
              (|Matrix| 6) (0 . |nullSpace|) (5 . |One|) (9 . |One|)
              (|Integer|) (|Vector| 7) (13 . |minIndex|) (18 . |elt|)
              (|Boolean|) (24 . |zero?|) (|Matrix| 7) (29 . |transpose|)
              (|Matrix| $) (34 . |reducedSystem|) (|NonNegativeInteger|)
              (39 . |nullity|) (44 . |positive?|)
              |LINDEP;linearlyDependent?;VB;2| (|Union| 39 '"failed")
              |LINDEP;linearDependence;VU;3| (49 . |Zero|) (53 . |empty?|)
              (58 . |solveLinear|) (64 . |solveLinear|) (70 . |zero|) (75 . =)
              (81 . |ncols|) (|Record| (|:| |mat| 9) (|:| |vec| 39))
              (|Vector| $) (86 . |reducedSystem|) (|Vector| 6)
              (|LinearSystemMatrixPackage| 6 39 39 9)
              (92 . |particularSolution|) (|Fraction| 6) (98 . |Zero|)
              (|Union| 52 '"failed") (102 . |solveLinear|)
              (108 . |solveLinear|) (114 . |coerce|) (|Matrix| 42)
              (|Mapping| 42 6)
              (|MatrixCategoryFunctions2| 6 39 39 9 42 52 52 48) (119 . |map|)
              (|Vector| 42) (|VectorFunctions2| 6 42) (125 . |map|)
              (|LinearSystemMatrixPackage| 42 52 52 48)
              (131 . |particularSolution|))
           '#(|solveLinear| 137 |linearlyDependent?| 161 |linearDependence|
              166)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 56
                                                 '(1 9 8 0 10 0 6 0 11 0 7 0 12
                                                   1 14 13 0 15 2 14 7 0 13 16
                                                   1 7 17 0 18 1 19 0 14 20 1 7
                                                   9 21 22 1 9 23 0 24 1 13 17
                                                   0 25 0 6 0 29 1 14 17 0 30 2
                                                   0 27 19 14 31 2 0 27 14 7 32
                                                   1 14 0 23 33 2 14 17 0 0 34
                                                   1 19 23 0 35 2 7 36 21 37 38
                                                   2 40 27 9 39 41 0 42 0 43 2
                                                   0 44 19 14 45 2 0 44 14 7 46
                                                   1 42 0 6 47 2 50 48 49 9 51
                                                   2 53 52 49 39 54 2 55 44 48
                                                   52 56 2 1 27 14 7 32 2 1 27
                                                   19 14 31 2 2 44 19 14 45 2 2
                                                   44 14 7 46 1 0 17 14 26 1 0
                                                   27 14 28)))))
           '|lookupComplete|)) 
