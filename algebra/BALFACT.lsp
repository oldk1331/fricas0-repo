
(DEFUN |BALFACT;balancedFactorisation;2UPF;1| (|a| |b| $)
  (SPADCALL |a| (LIST |b|) (QREFELT $ 10))) 

(DEFUN |BALFACT;balSqfr1| (|a| |n| |b| $)
  (PROG (#1=#:G108 |fa| |g|)
    (RETURN
     (SEQ
      (LETT |g| (SPADCALL |a| |b| (QREFELT $ 12)) . #2=(|BALFACT;balSqfr1|))
      (LETT |fa|
            (SPADCALL
             (PROG2 (LETT #1# (SPADCALL |a| |g| (QREFELT $ 14)) . #2#)
                 (QCDR #1#)
               (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
             |n| (QREFELT $ 16))
            . #2#)
      (EXIT
       (COND ((SPADCALL |g| (QREFELT $ 18)) |fa|)
             ('T
              (SPADCALL |fa|
                        (|BALFACT;balSqfr1| |g| |n|
                         (PROG2
                             (LETT #1#
                                   (SPADCALL |b|
                                             (SPADCALL |g|
                                                       (SPADCALL |b| |g|
                                                                 (QREFELT $
                                                                          20))
                                                       (QREFELT $ 21))
                                             (QREFELT $ 14))
                                   . #2#)
                             (QCDR #1#)
                           (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                         $)
                        (QREFELT $ 22))))))))) 

(DEFUN |BALFACT;balSqfr| (|a| |n| |l| $)
  (PROG (#1=#:G114 #2=#:G113 #3=#:G115 #4=#:G118 |f| |b|)
    (RETURN
     (SEQ (LETT |b| (|SPADfirst| |l|) . #5=(|BALFACT;balSqfr|))
          (EXIT
           (COND ((NULL (CDR |l|)) (|BALFACT;balSqfr1| |a| |n| |b| $))
                 (#6='T
                  (PROGN
                   (LETT #1# NIL . #5#)
                   (SEQ (LETT |f| NIL . #5#)
                        (LETT #4#
                              (SPADCALL (|BALFACT;balSqfr| |a| |n| (CDR |l|) $)
                                        (QREFELT $ 25))
                              . #5#)
                        G190
                        (COND
                         ((OR (ATOM #4#)
                              (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (PROGN
                           (LETT #3# (|BALFACT;balSqfr1| (QCAR |f|) |n| |b| $)
                                 . #5#)
                           (COND
                            (#1#
                             (LETT #2# (SPADCALL #2# #3# (QREFELT $ 22))
                                   . #5#))
                            ('T
                             (PROGN
                              (LETT #2# #3# . #5#)
                              (LETT #1# 'T . #5#)))))))
                        (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                   (COND (#1# #2#) (#6# (|spadConstant| $ 26))))))))))) 

(DEFUN |BALFACT;balancedFactorisation;UPLF;4| (|a| |l| $)
  (PROG (#1=#:G122 #2=#:G121 #3=#:G123 #4=#:G127 |f| |sa| |ll|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (LETT |ll|
               (SPADCALL (CONS #'|BALFACT;balancedFactorisation;UPLF;4!0| $)
                         |l| (QREFELT $ 31))
               . #5=(|BALFACT;balancedFactorisation;UPLF;4|)))
        (|error| "balancedFactorisation: 2nd argument is empty or all 0"))
       (#6='T
        (SEQ (LETT |sa| (SPADCALL |a| (QREFELT $ 33)) . #5#)
             (EXIT
              (SPADCALL (SPADCALL |sa| (QREFELT $ 34))
                        (PROGN
                         (LETT #1# NIL . #5#)
                         (SEQ (LETT |f| NIL . #5#)
                              (LETT #4# (SPADCALL |sa| (QREFELT $ 25)) . #5#)
                              G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #3#
                                       (|BALFACT;balSqfr| (QCAR |f|) (QCDR |f|)
                                        |ll| $)
                                       . #5#)
                                 (COND
                                  (#1#
                                   (LETT #2# (SPADCALL #2# #3# (QREFELT $ 22))
                                         . #5#))
                                  ('T
                                   (PROGN
                                    (LETT #2# #3# . #5#)
                                    (LETT #1# 'T . #5#)))))))
                              (LETT #4# (CDR #4#) . #5#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#1# #2#) (#6# (|spadConstant| $ 26))))
                        (QREFELT $ 35)))))))))) 

(DEFUN |BALFACT;balancedFactorisation;UPLF;4!0| (|z1| $)
  (SPADCALL |z1| (|spadConstant| $ 28) (QREFELT $ 29))) 

(DECLAIM (NOTINLINE |BalancedFactorisation;|)) 

(DEFUN |BalancedFactorisation| (&REST #1=#:G128)
  (PROG ()
    (RETURN
     (PROG (#2=#:G129)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|BalancedFactorisation|)
                                           '|domainEqualList|)
                . #3=(|BalancedFactorisation|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |BalancedFactorisation;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|BalancedFactorisation|))))))))))) 

(DEFUN |BalancedFactorisation;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|BalancedFactorisation|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|BalancedFactorisation| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 36) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|BalancedFactorisation| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|BalancedFactorisation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Factored| 7) (|List| 7) |BALFACT;balancedFactorisation;UPLF;4|
              |BALFACT;balancedFactorisation;2UPF;1| (0 . |gcd|)
              (|Union| $ '"failed") (6 . |exquo|) (|Integer|)
              (12 . |sqfrFactor|) (|Boolean|) (18 . |ground?|)
              (|NonNegativeInteger|) (23 . |order|) (29 . ^) (35 . *)
              (|Record| (|:| |factor| 7) (|:| |exponent| 15)) (|List| 23)
              (41 . |factors|) (46 . |One|) (50 . |Zero|) (54 . |Zero|)
              (58 . ~=) (|Mapping| 17 7) (64 . |select|) (|Factored| $)
              (70 . |squareFree|) (75 . |unit|) (80 . *))
           '#(|balancedFactorisation| 86) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 35
                                                 '(2 7 0 0 0 12 2 7 13 0 0 14 2
                                                   8 0 7 15 16 1 7 17 0 18 2 7
                                                   19 0 0 20 2 7 0 0 19 21 2 8
                                                   0 0 0 22 1 8 24 0 25 0 8 0
                                                   26 0 6 0 27 0 7 0 28 2 7 17
                                                   0 0 29 2 9 0 30 0 31 1 7 32
                                                   0 33 1 8 7 0 34 2 8 0 7 0 35
                                                   2 0 8 7 9 10 2 0 8 7 7
                                                   11)))))
           '|lookupComplete|)) 
