
(/VERSIONCHECK 2) 

(DEFUN |XEXPPKG;log;XPOLYNniXPOLY;1| (|p| |n| $)
  (PROG (|k| |s| |k2| |k1| |i| |p1|)
    (RETURN
     (SEQ
      (LETT |p1| (SPADCALL |p| (|spadConstant| $ 10) (QREFELT $ 11))
            . #1=(|XEXPPKG;log;XPOLYNniXPOLY;1|))
      (COND
       ((NULL (SPADCALL |p1| (QREFELT $ 13)))
        (EXIT (|error| "constant term <> 1, impossible log"))))
      (LETT |s| (|spadConstant| $ 14) . #1#) (LETT |k| |n| . #1#)
      (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (LETT |k1| (SPADCALL 1 |k| (QREFELT $ 17)) . #1#)
                (LETT |k2| (SPADCALL |k1| (|spadConstant| $ 9) (QREFELT $ 18))
                      . #1#)
                (LETT |s|
                      (SPADCALL
                       (SPADCALL (SPADCALL |p1| |i| (QREFELT $ 20))
                                 (SPADCALL (SPADCALL |k2| (QREFELT $ 21)) |s|
                                           (QREFELT $ 11))
                                 (QREFELT $ 22))
                       |i| (QREFELT $ 20))
                      . #1#)
                (EXIT (LETT |k| (- |k| 1) . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |s|))))) 

(DEFUN |XEXPPKG;exp;XPOLYNniXPOLY;2| (|p| |n| $)
  (PROG (|k| |s| |k2| |k1| |i|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |p| (QREFELT $ 13)))
        (|error| "constant term <> 0, exp impossible"))
       ('T
        (COND
         ((SPADCALL |p| (|spadConstant| $ 14) (QREFELT $ 25))
          (|spadConstant| $ 10))
         ('T
          (SEQ
           (LETT |s| (|spadConstant| $ 10)
                 . #1=(|XEXPPKG;exp;XPOLYNniXPOLY;2|))
           (LETT |k| |n| . #1#)
           (SEQ (LETT |i| 1 . #1#) G190
                (COND ((|greater_SI| |i| |n|) (GO G191)))
                (SEQ (LETT |k1| (SPADCALL 1 |k| (QREFELT $ 17)) . #1#)
                     (LETT |k2|
                           (SPADCALL |k1| (|spadConstant| $ 9) (QREFELT $ 18))
                           . #1#)
                     (LETT |s|
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 10)
                                      (SPADCALL
                                       (SPADCALL |k2|
                                                 (SPADCALL |p| |i|
                                                           (QREFELT $ 20))
                                                 (QREFELT $ 26))
                                       |s| (QREFELT $ 22))
                                      (QREFELT $ 27))
                            |i| (QREFELT $ 20))
                           . #1#)
                     (EXIT (LETT |k| (- |k| 1) . #1#)))
                (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
           (EXIT |s|)))))))))) 

(DEFUN |XEXPPKG;Hausdorff;2XPOLYNniXPOLY;3| (|p| |q| |n| $)
  (PROG (|q1| |p1|)
    (RETURN
     (SEQ
      (LETT |p1| (SPADCALL |p| |n| (QREFELT $ 28))
            . #1=(|XEXPPKG;Hausdorff;2XPOLYNniXPOLY;3|))
      (LETT |q1| (SPADCALL |q| |n| (QREFELT $ 28)) . #1#)
      (EXIT
       (SPADCALL (SPADCALL |p1| |q1| (QREFELT $ 22)) |n| (QREFELT $ 23))))))) 

(DEFUN |XExponentialPackage| (&REST #1=#:G142)
  (PROG ()
    (RETURN
     (PROG (#2=#:G143)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|XExponentialPackage|)
                                           '|domainEqualList|)
                . #3=(|XExponentialPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |XExponentialPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|XExponentialPackage|))))))))))) 

(DEFUN |XExponentialPackage;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|XExponentialPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|XExponentialPackage| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 30) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|XExponentialPackage|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|XExponentialPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |One|) (4 . |One|) (8 . -) (|Boolean|)
              (14 . |quasiRegular?|) (19 . |Zero|) (|Integer|) (|Fraction| 15)
              (23 . /) (29 . *) (|NonNegativeInteger|) (35 . |trunc|)
              (41 . |coerce|) (46 . *) |XEXPPKG;log;XPOLYNniXPOLY;1|
              (52 . |Zero|) (56 . =) (62 . *) (68 . +)
              |XEXPPKG;exp;XPOLYNniXPOLY;2|
              |XEXPPKG;Hausdorff;2XPOLYNniXPOLY;3|)
           '#(|log| 74 |exp| 80 |Hausdorff| 86) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 29
                                                 '(0 6 0 9 0 8 0 10 2 8 0 0 0
                                                   11 1 8 12 0 13 0 8 0 14 2 16
                                                   0 15 15 17 2 6 0 16 0 18 2 8
                                                   0 0 19 20 1 8 0 6 21 2 8 0 0
                                                   0 22 0 6 0 24 2 8 12 0 0 25
                                                   2 8 0 6 0 26 2 8 0 0 0 27 2
                                                   0 8 8 19 23 2 0 8 8 19 28 3
                                                   0 8 8 8 19 29)))))
           '|lookupComplete|)) 
