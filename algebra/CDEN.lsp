
(/VERSIONCHECK 2) 

(DEFUN |CDEN;clearDenominator;2A;1| (|l| $)
  (PROG (|d|)
    (RETURN
     (SEQ (LETT |d| (SPADCALL |l| (QREFELT $ 9)) |CDEN;clearDenominator;2A;1|)
          (EXIT
           (SPADCALL (CONS #'|CDEN;clearDenominator;2A;1!0| (VECTOR $ |d|)) |l|
                     (QREFELT $ 14))))))) 

(DEFUN |CDEN;clearDenominator;2A;1!0| (|x| $$)
  (PROG (|d| $)
    (LETT |d| (QREFELT $$ 1) . #1=(|CDEN;clearDenominator;2A;1|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL (SPADCALL |d| |x| (QREFELT $ 10)) (QREFELT $ 11))
                (QREFELT $ 12)))))) 

(DEFUN |CDEN;splitDenominator;AR;2| (|l| $)
  (PROG (|d|)
    (RETURN
     (SEQ (LETT |d| (SPADCALL |l| (QREFELT $ 9)) |CDEN;splitDenominator;AR;2|)
          (EXIT
           (CONS
            (SPADCALL (CONS #'|CDEN;splitDenominator;AR;2!0| (VECTOR $ |d|))
                      |l| (QREFELT $ 14))
            |d|)))))) 

(DEFUN |CDEN;splitDenominator;AR;2!0| (|x| $$)
  (PROG (|d| $)
    (LETT |d| (QREFELT $$ 1) . #1=(|CDEN;splitDenominator;AR;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL (SPADCALL |d| |x| (QREFELT $ 10)) (QREFELT $ 11))
                (QREFELT $ 12)))))) 

(DEFUN |CDEN;qlcm| (|a| |b| $)
  (SPADCALL
   (SPADCALL (SPADCALL |a| (QREFELT $ 11)) (SPADCALL |b| (QREFELT $ 11))
             (QREFELT $ 18))
   (QREFELT $ 12))) 

(DEFUN |CDEN;commonDenominator;AR;4| (|l| $)
  (SPADCALL
   (SPADCALL (CONS (|function| |CDEN;qlcm|) $)
             (SPADCALL (CONS #'|CDEN;commonDenominator;AR;4!0| $) |l|
                       (QREFELT $ 14))
             (|spadConstant| $ 20) (QREFELT $ 22))
   (QREFELT $ 11))) 

(DEFUN |CDEN;commonDenominator;AR;4!0| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 12))) 

(DEFUN |CDEN;commonDenominator;AR;5| (|l| $)
  (SPADCALL
   (SPADCALL (ELT $ 23)
             (SPADCALL (CONS #'|CDEN;commonDenominator;AR;5!0| $) |l|
                       (QREFELT $ 14))
             (|spadConstant| $ 20) (QREFELT $ 22))
   (QREFELT $ 11))) 

(DEFUN |CDEN;commonDenominator;AR;5!0| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 12))) 

(DECLAIM (NOTINLINE |CommonDenominator;|)) 

(DEFUN |CommonDenominator| (&REST #1=#:G120)
  (PROG ()
    (RETURN
     (PROG (#2=#:G121)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|CommonDenominator|)
                                           '|domainEqualList|)
                . #3=(|CommonDenominator|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |CommonDenominator;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|CommonDenominator|))))))))))) 

(DEFUN |CommonDenominator;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|CommonDenominator|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|CommonDenominator| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 24) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|CommonDenominator|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| '(|GcdDomain|))
        (PROGN
         (QSETREFV $ 9
                   (CONS (|dispatchFunction| |CDEN;commonDenominator;AR;4|)
                         $))))
       ('T
        (QSETREFV $ 9
                  (CONS (|dispatchFunction| |CDEN;commonDenominator;AR;5|)
                        $))))
      $)))) 

(MAKEPROP '|CommonDenominator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |commonDenominator|) (5 . *) (11 . |numer|)
              (16 . |coerce|) (|Mapping| 7 7) (21 . |map|)
              |CDEN;clearDenominator;2A;1|
              (|Record| (|:| |num| 8) (|:| |den| 6))
              |CDEN;splitDenominator;AR;2| (27 . |lcm|) (33 . |denom|)
              (38 . |One|) (|Mapping| 7 7 7) (42 . |reduce|) (49 . *))
           '#(|splitDenominator| 55 |commonDenominator| 60 |clearDenominator|
              65)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 23
                                                 '(1 0 6 8 9 2 7 0 6 0 10 1 7 6
                                                   0 11 1 7 0 6 12 2 8 0 13 0
                                                   14 2 6 0 0 0 18 1 7 6 0 19 0
                                                   7 0 20 3 8 7 21 0 7 22 2 7 0
                                                   0 0 23 1 0 16 8 17 1 0 6 8 9
                                                   1 0 8 8 15)))))
           '|lookupComplete|)) 
