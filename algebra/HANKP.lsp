
(/VERSIONCHECK 2) 

(DEFUN |HANKP;HankelMatrix;LM;1| (|l| $)
  (PROG (#1=#:G139 |x| |i| #2=#:G138 |lloc| |j| #3=#:G137 |n| #4=#:G128)
    (RETURN
     (SEQ
      (COND ((NULL (ODDP (LENGTH |l|))) (|error| "n must be odd"))
            ('T
             (SEQ
              (LETT |n|
                    (PROG2
                        (LETT #4#
                              (SPADCALL (+ (LENGTH |l|) 1) 2 (QREFELT $ 10))
                              . #5=(|HANKP;HankelMatrix;LM;1|))
                        (QCDR #4#)
                      (|check_union| (QEQCAR #4# 0) (|NonNegativeInteger|)
                                     #4#))
                    . #5#)
              (LETT |lloc| (CONS (|spadConstant| $ 11) |l|) . #5#)
              (EXIT
               (SPADCALL (ELT $ 13)
                         (PROGN
                          (LETT #3# NIL . #5#)
                          (SEQ (LETT |j| 1 . #5#) G190
                               (COND ((|greater_SI| |j| |n|) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #3#
                                       (CONS
                                        (SEQ (LETT |lloc| (CDR |lloc|) . #5#)
                                             (EXIT
                                              (SPADCALL
                                               (LIST
                                                (PROGN
                                                 (LETT #2# NIL . #5#)
                                                 (SEQ (LETT |i| 1 . #5#)
                                                      (LETT |x| NIL . #5#)
                                                      (LETT #1# |lloc| . #5#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #1#)
                                                            (PROGN
                                                             (LETT |x|
                                                                   (CAR #1#)
                                                                   . #5#)
                                                             NIL)
                                                            (|greater_SI| |i|
                                                                          |n|))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #2#
                                                              (CONS |x| #2#)
                                                              . #5#)))
                                                      (LETT #1#
                                                            (PROG1 (CDR #1#)
                                                              (LETT |i|
                                                                    (|inc_SI|
                                                                     |i|)
                                                                    . #5#))
                                                            . #5#)
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #2#)))))
                                               (QREFELT $ 15))))
                                        #3#)
                                       . #5#)))
                               (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                               (EXIT (NREVERSE #3#))))
                         (QREFELT $ 18)))))))))) 

(DEFUN |HankelPackage| (#1=#:G140)
  (PROG ()
    (RETURN
     (PROG (#2=#:G141)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|HankelPackage|)
                                           '|domainEqualList|)
                . #3=(|HankelPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|HankelPackage;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|HankelPackage|))))))))))) 

(DEFUN |HankelPackage;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|HankelPackage|))
      (LETT |dv$| (LIST '|HankelPackage| DV$1) . #1#)
      (LETT $ (GETREFV 21) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|HankelPackage| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|HankelPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |One|)
              (|Union| $ '"failed") (|NonNegativeInteger|) (4 . |exquo|)
              (10 . |Zero|) (|Matrix| 6) (14 . |vertConcat|) (|List| 19)
              (20 . |matrix|) (|Mapping| 12 12 12) (|List| 12) (25 . |reduce|)
              (|List| 6) |HANKP;HankelMatrix;LM;1|)
           '#(|HankelMatrix| 31) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 20
                                                 '(0 6 0 7 2 9 8 0 0 10 0 6 0
                                                   11 2 12 0 0 0 13 1 12 0 14
                                                   15 2 17 12 16 0 18 1 0 12 19
                                                   20)))))
           '|lookupComplete|)) 
