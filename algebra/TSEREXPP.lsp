
(/VERSIONCHECK 2) 

(DEFUN |TSEREXPP;rescale| (|p| |r0| |rn| $)
  (PROG (|s| #1=#:G125)
    (RETURN
     (SEQ
      (LETT |s|
            (PROG1
                (LETT #1#
                      (SPADCALL (SPADCALL |r0| |rn| (QREFELT $ 11))
                                (QREFELT $ 13))
                      . #2=(|TSEREXPP;rescale|))
              (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
            . #2#)
      (EXIT (SPADCALL (SPADCALL |p| (QREFELT $ 14)) |s| (QREFELT $ 16))))))) 

(DEFUN |TSEREXPP;common_rep| (|lp| $)
  (PROG (#1=#:G170 |p| #2=#:G171 |r| #3=#:G169 |rn| #4=#:G168 #5=#:G167
         #6=#:G166 #7=#:G165 |lr| #8=#:G164 #9=#:G163)
    (RETURN
     (SEQ
      (LETT |lr|
            (PROGN
             (LETT #9# NIL . #10=(|TSEREXPP;common_rep|))
             (SEQ (LETT |p| NIL . #10#) (LETT #8# |lp| . #10#) G190
                  (COND
                   ((OR (ATOM #8#) (PROGN (LETT |p| (CAR #8#) . #10#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #9# (CONS (SPADCALL |p| (QREFELT $ 17)) #9#)
                          . #10#)))
                  (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                  (EXIT (NREVERSE #9#))))
            . #10#)
      (LETT |rn|
            (SPADCALL
             (SPADCALL
              (PROGN
               (LETT #7# NIL . #10#)
               (SEQ (LETT |r| NIL . #10#) (LETT #6# |lr| . #10#) G190
                    (COND
                     ((OR (ATOM #6#) (PROGN (LETT |r| (CAR #6#) . #10#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #7# (CONS (SPADCALL |r| (QREFELT $ 18)) #7#)
                            . #10#)))
                    (LETT #6# (CDR #6#) . #10#) (GO G190) G191
                    (EXIT (NREVERSE #7#))))
              (QREFELT $ 20))
             (SPADCALL
              (PROGN
               (LETT #5# NIL . #10#)
               (SEQ (LETT |r| NIL . #10#) (LETT #4# |lr| . #10#) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |r| (CAR #4#) . #10#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #5# (CONS (SPADCALL |r| (QREFELT $ 21)) #5#)
                            . #10#)))
                    (LETT #4# (CDR #4#) . #10#) (GO G190) G191
                    (EXIT (NREVERSE #5#))))
              (QREFELT $ 22))
             (QREFELT $ 23))
            . #10#)
      (EXIT
       (CONS
        (PROGN
         (LETT #3# NIL . #10#)
         (SEQ (LETT |r| NIL . #10#) (LETT #2# |lr| . #10#)
              (LETT |p| NIL . #10#) (LETT #1# |lp| . #10#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #10#) NIL)
                    (ATOM #2#) (PROGN (LETT |r| (CAR #2#) . #10#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (LETT #3# (CONS (|TSEREXPP;rescale| |p| |r| |rn| $) #3#)
                      . #10#)))
              (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #10#)) . #10#)
              (GO G190) G191 (EXIT (NREVERSE #3#))))
        |rn|)))))) 

(DEFUN |TSEREXPP;taylor_via_deriv;UPSLLUPS;3| (|f| |lx| |ld| $)
  (PROG (|lres| |lla| |nrep|)
    (RETURN
     (SEQ
      (LETT |nrep| (|TSEREXPP;common_rep| (CONS |f| |lx|) $)
            . #1=(|TSEREXPP;taylor_via_deriv;UPSLLUPS;3|))
      (LETT |lla| (QCAR |nrep|) . #1#)
      (LETT |lres|
            (SPADCALL (|SPADfirst| |lla|) (CDR |lla|) |ld| (QREFELT $ 28))
            . #1#)
      (EXIT (SPADCALL (QCDR |nrep|) |lres| (QREFELT $ 29))))))) 

(DEFUN |TSEREXPP;taylor_via_lode;LUPSLUPS;4| (|la| |z| |lc| $)
  (PROG (|lres| |lla| |nrep|)
    (RETURN
     (SEQ
      (LETT |nrep| (|TSEREXPP;common_rep| (CONS |z| |la|) $)
            . #1=(|TSEREXPP;taylor_via_lode;LUPSLUPS;4|))
      (LETT |lla| (QCAR |nrep|) . #1#)
      (LETT |lres|
            (SPADCALL (CDR |lla|) (|SPADfirst| |lla|) |lc| (QREFELT $ 33))
            . #1#)
      (EXIT (SPADCALL (QCDR |nrep|) |lres| (QREFELT $ 29))))))) 

(DEFUN |TSEREXPP;applyTaylor;M2UPS;5| (|g| |f| $)
  (PROG (|lres| |nrep|)
    (RETURN
     (SEQ
      (LETT |nrep| (|TSEREXPP;common_rep| (LIST |f|) $)
            . #1=(|TSEREXPP;applyTaylor;M2UPS;5|))
      (LETT |lres| (SPADCALL |g| (|SPADfirst| (QCAR |nrep|)) (QREFELT $ 36))
            . #1#)
      (EXIT (SPADCALL (QCDR |nrep|) |lres| (QREFELT $ 29))))))) 

(DEFUN |TaylorSeriesExpansionPuiseux| (&REST #1=#:G179)
  (PROG ()
    (RETURN
     (PROG (#2=#:G180)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|TaylorSeriesExpansionPuiseux|)
                                           '|domainEqualList|)
                . #3=(|TaylorSeriesExpansionPuiseux|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |TaylorSeriesExpansionPuiseux;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|TaylorSeriesExpansionPuiseux|))))))))))) 

(DEFUN |TaylorSeriesExpansionPuiseux;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|TaylorSeriesExpansionPuiseux|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|TaylorSeriesExpansionPuiseux| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 38) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TaylorSeriesExpansionPuiseux|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|TaylorSeriesExpansionPuiseux| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Fraction| 12) (0 . /) (|Integer|)
              (6 . |retract|) (11 . |laurentRep|) (|PositiveInteger|)
              (16 . |multiplyExponents|) (22 . |rationalPower|) (27 . |numer|)
              (|List| $) (32 . |gcd|) (37 . |denom|) (42 . |lcm|) (47 . /)
              (|List| 8) (|Mapping| 6 6) (|List| 25)
              (|TaylorSeriesExpansionLaurent| 6 7 8) (53 . |taylor_via_deriv|)
              (60 . |puiseux|) (|List| 9)
              |TSEREXPP;taylor_via_deriv;UPSLLUPS;3| (|List| 6)
              (66 . |taylor_via_lode|) |TSEREXPP;taylor_via_lode;LUPSLUPS;4|
              (|Mapping| 7 7) (73 . |applyTaylor|)
              |TSEREXPP;applyTaylor;M2UPS;5|)
           '#(|taylor_via_lode| 79 |taylor_via_deriv| 86 |applyTaylor| 100)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(|TaylorSeriesExpansion&|)
                       (CONS
                        '#((|TaylorSeriesExpansion| 6 10
                                                    (|SingletonAsOrderedSet|) 9
                                                    7))
                        (|makeByteWordVec2| 37
                                            '(2 10 0 0 0 11 1 10 12 0 13 1 9 8
                                              0 14 2 8 0 0 15 16 1 9 10 0 17 1
                                              10 12 0 18 1 12 0 19 20 1 10 12 0
                                              21 1 12 0 19 22 2 10 0 12 12 23 3
                                              27 8 8 24 26 28 2 9 0 10 8 29 3
                                              27 8 24 8 32 33 2 27 8 35 8 36 3
                                              0 9 30 9 32 34 3 0 9 9 30 26 31 3
                                              0 9 6 30 26 1 2 0 9 35 9 37)))))
           '|lookupComplete|)) 
