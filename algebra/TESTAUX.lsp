
(/VERSIONCHECK 2) 

(DEFUN |TESTAUX;nPassInc| (|s| |o| $) (SPADCALL (QREFELT $ 9))) 

(DEFUN |TESTAUX;nFailInc| (|s| |o| $) (SPADCALL |s| |o| (QREFELT $ 12))) 

(DEFUN |TESTAUX;xPassInc| (|s| |o| $) (SPADCALL |s| |o| (QREFELT $ 13))) 

(DEFUN |TESTAUX;xFailInc| (|s| |o| $) (SPADCALL (QREFELT $ 14))) 

(DEFUN |TESTAUX;testEqualsAuxCmp;2RB;5| (|ex1| |ex2| $)
  (SPADCALL (SPADCALL |ex1| (QREFELT $ 16)) (SPADCALL |ex2| (QREFELT $ 16))
            (QREFELT $ 18))) 

(DEFUN |TESTAUX;testEqualsAuxCmp;2RB;6| (|ex1| |ex2| $)
  (SPADCALL |ex1| |ex2| (QREFELT $ 20))) 

(DEFUN |TESTAUX;testEqualsAuxCmp;2RB;7| (|ex1| |ex2| $)
  (SEQ
   (SPADCALL (SPADCALL "testing in a domain without InputForm!" (QREFELT $ 22))
             (QREFELT $ 23))
   (EXIT (SPADCALL |ex1| |ex2| (QREFELT $ 20))))) 

(DEFUN |TESTAUX;testEqualsAux0| (|inp| |ex1| |ex2| |prep| |frep| $)
  (COND
   ((SPADCALL |ex1| |ex2| (QREFELT $ 19))
    (COND
     ((|HasCategory| (QREFELT $ 6) (LIST '|CoercibleTo| '(|OutputForm|)))
      (SPADCALL |inp|
                (LIST (SPADCALL |ex1| (QREFELT $ 24))
                      (SPADCALL |ex2| (QREFELT $ 24)))
                |prep|))
     (#1='T (SPADCALL |inp| NIL |prep|))))
   ((|HasCategory| (QREFELT $ 6) (LIST '|CoercibleTo| '(|OutputForm|)))
    (SPADCALL |inp|
              (LIST (SPADCALL |ex1| (QREFELT $ 24))
                    (SPADCALL |ex2| (QREFELT $ 24)))
              |frep|))
   (#1# (SPADCALL |inp| NIL |prep|)))) 

(DEFUN |TESTAUX;testEqualsAux;S2RV;9| (|inp| |ex1| |ex2| $)
  (|TESTAUX;testEqualsAux0| |inp| |ex1| |ex2|
   (CONS (|function| |TESTAUX;nPassInc|) $)
   (CONS (|function| |TESTAUX;nFailInc|) $) $)) 

(DEFUN |TESTAUX;xftestEqualsAux;S2RV;10| (|inp| |ex1| |ex2| $)
  (|TESTAUX;testEqualsAux0| |inp| |ex1| |ex2|
   (CONS (|function| |TESTAUX;xPassInc|) $)
   (CONS (|function| |TESTAUX;xFailInc|) $) $)) 

(DEFUN |TESTAUX;testRelativePrecision;2R;11| (|eps| $)
  (PROG (|old|)
    (RETURN
     (SEQ (LETT |old| (QREFELT $ 30) |TESTAUX;testRelativePrecision;2R;11|)
          (SETELT $ 30 |eps|) (EXIT |old|))))) 

(DEFUN |TESTAUX;testAbsolutePrecision;2R;12| (|eps| $)
  (PROG (|old|)
    (RETURN
     (SEQ (LETT |old| (QREFELT $ 31) |TESTAUX;testAbsolutePrecision;2R;12|)
          (SETELT $ 31 |eps|) (EXIT |old|))))) 

(DEFUN |TESTAUX;testRealEqualsAux0| (|inp| |ex1| |ex2| |prep| |frep| $)
  (PROG (|res| |relative| |absolute|)
    (RETURN
     (SEQ
      (LETT |absolute|
            (SPADCALL (SPADCALL |ex1| |ex2| (QREFELT $ 34)) (QREFELT $ 35))
            . #1=(|TESTAUX;testRealEqualsAux0|))
      (COND
       ((SPADCALL |ex2| (QREFELT $ 36))
        (LETT |relative| (|spadConstant| $ 37) . #1#))
       (#2='T
        (LETT |relative|
              (SPADCALL
               (SPADCALL (SPADCALL |ex1| |ex2| (QREFELT $ 38))
                         (|spadConstant| $ 39) (QREFELT $ 34))
               (QREFELT $ 35))
              . #1#)))
      (LETT |res| NIL . #1#)
      (COND
       ((SPADCALL |relative| (QREFELT $ 30) (QREFELT $ 40))
        (COND
         ((|HasCategory| (QREFELT $ 6) (LIST '|CoercibleTo| '(|OutputForm|)))
          (LETT |res|
                (CONS
                 (SPADCALL (SPADCALL "rel err: " (QREFELT $ 22))
                           (SPADCALL |relative| (QREFELT $ 24)) (QREFELT $ 41))
                 |res|)
                . #1#))
         (#2#
          (LETT |res| (CONS (SPADCALL "rel err " (QREFELT $ 22)) |res|)
                . #1#)))))
      (COND
       ((SPADCALL |absolute| (QREFELT $ 31) (QREFELT $ 40))
        (COND
         ((|HasCategory| (QREFELT $ 6) (LIST '|CoercibleTo| '(|OutputForm|)))
          (LETT |res|
                (CONS
                 (SPADCALL (SPADCALL "abs err: " (QREFELT $ 22))
                           (SPADCALL |absolute| (QREFELT $ 24)) (QREFELT $ 41))
                 |res|)
                . #1#))
         (#2#
          (LETT |res| (CONS (SPADCALL "abs err " (QREFELT $ 22)) |res|)
                . #1#)))))
      (EXIT
       (COND
        ((NULL |res|)
         (SPADCALL |inp|
                   (LIST (SPADCALL |ex1| (QREFELT $ 24))
                         (SPADCALL |ex2| (QREFELT $ 24)))
                   |prep|))
        (#2#
         (SPADCALL |inp|
                   (SPADCALL
                    (LIST (SPADCALL |ex1| (QREFELT $ 24))
                          (SPADCALL |ex2| (QREFELT $ 24)))
                    |res| (QREFELT $ 42))
                   |frep|)))))))) 

(DEFUN |TESTAUX;testRealEqualsAux;S2RV;14| (|inp| |ex1| |ex2| $)
  (|TESTAUX;testRealEqualsAux0| |inp| |ex1| |ex2|
   (CONS (|function| |TESTAUX;nPassInc|) $)
   (CONS (|function| |TESTAUX;nFailInc|) $) $)) 

(DEFUN |TESTAUX;xftestRealEqualsAux;S2RV;15| (|inp| |ex1| |ex2| $)
  (|TESTAUX;testRealEqualsAux0| |inp| |ex1| |ex2|
   (CONS (|function| |TESTAUX;xPassInc|) $)
   (CONS (|function| |TESTAUX;xFailInc|) $) $)) 

(DEFUN |TESTAUX;testComplexEqualsAux0| (|inp| |ex1| |ex2| |prep| |frep| $)
  (PROG (|res| |relative| |absolute|)
    (RETURN
     (SEQ
      (LETT |absolute|
            (SPADCALL (SPADCALL |ex1| |ex2| (QREFELT $ 46)) (QREFELT $ 47))
            . #1=(|TESTAUX;testComplexEqualsAux0|))
      (COND
       ((SPADCALL |ex2| (QREFELT $ 48))
        (LETT |relative| (|spadConstant| $ 37) . #1#))
       (#2='T
        (LETT |relative|
              (SPADCALL
               (SPADCALL (SPADCALL |ex1| |ex2| (QREFELT $ 49))
                         (|spadConstant| $ 50) (QREFELT $ 46))
               (QREFELT $ 47))
              . #1#)))
      (LETT |res| NIL . #1#)
      (COND
       ((SPADCALL |relative| (QREFELT $ 30) (QREFELT $ 40))
        (COND
         ((|HasCategory| (QREFELT $ 6) (LIST '|CoercibleTo| '(|OutputForm|)))
          (LETT |res|
                (CONS
                 (SPADCALL (SPADCALL "rel err: " (QREFELT $ 22))
                           (SPADCALL |relative| (QREFELT $ 24)) (QREFELT $ 41))
                 |res|)
                . #1#))
         (#2#
          (LETT |res| (CONS (SPADCALL "rel err " (QREFELT $ 22)) |res|)
                . #1#)))))
      (COND
       ((SPADCALL |absolute| (QREFELT $ 31) (QREFELT $ 40))
        (COND
         ((|HasCategory| (QREFELT $ 6) (LIST '|CoercibleTo| '(|OutputForm|)))
          (LETT |res|
                (CONS
                 (SPADCALL (SPADCALL "abs err: " (QREFELT $ 22))
                           (SPADCALL |absolute| (QREFELT $ 24)) (QREFELT $ 41))
                 |res|)
                . #1#))
         (#2#
          (LETT |res| (CONS (SPADCALL "abs err " (QREFELT $ 22)) |res|)
                . #1#)))))
      (EXIT
       (COND
        ((NULL |res|)
         (SPADCALL |inp|
                   (LIST (SPADCALL |ex1| (QREFELT $ 51))
                         (SPADCALL |ex2| (QREFELT $ 51)))
                   |prep|))
        (#2#
         (SPADCALL |inp|
                   (SPADCALL
                    (LIST (SPADCALL |ex1| (QREFELT $ 51))
                          (SPADCALL |ex2| (QREFELT $ 51)))
                    |res| (QREFELT $ 42))
                   |frep|)))))))) 

(DEFUN |TESTAUX;testComplexEqualsAux;S2CV;17| (|inp| |ex1| |ex2| $)
  (|TESTAUX;testComplexEqualsAux0| |inp| |ex1| |ex2|
   (CONS (|function| |TESTAUX;nPassInc|) $)
   (CONS (|function| |TESTAUX;nFailInc|) $) $)) 

(DEFUN |TESTAUX;xftestComplexEqualsAux;S2CV;18| (|inp| |ex1| |ex2| $)
  (|TESTAUX;testComplexEqualsAux0| |inp| |ex1| |ex2|
   (CONS (|function| |TESTAUX;xPassInc|) $)
   (CONS (|function| |TESTAUX;xFailInc|) $) $)) 

(DEFUN |TESTAUX;testNotEqualsAux;S2RV;19| (|inp| |ex1| |ex2| $)
  (|TESTAUX;testEqualsAux0| |inp| |ex1| |ex2|
   (CONS (|function| |TESTAUX;nFailInc|) $)
   (CONS (|function| |TESTAUX;nPassInc|) $) $)) 

(DEFUN |TESTAUX;xftestNotEqualsAux;S2RV;20| (|inp| |ex1| |ex2| $)
  (|TESTAUX;testEqualsAux0| |inp| |ex1| |ex2|
   (CONS (|function| |TESTAUX;xFailInc|) $)
   (CONS (|function| |TESTAUX;xPassInc|) $) $)) 

(DEFUN |TESTAUX;testTrueAux0| (|inp| |ex| |prep| |frep| $)
  (COND
   ((|domainEqual| (QREFELT $ 6) (|Boolean|))
    (COND (|ex| (SPADCALL |inp| (LIST (SPADCALL |ex| (QREFELT $ 56))) |prep|))
          (#1='T
           (SPADCALL |inp| (LIST (SPADCALL |ex| (QREFELT $ 56))) |frep|))))
   ((|HasCategory| (QREFELT $ 6) (LIST '|CoercibleTo| '(|OutputForm|)))
    (SPADCALL |inp| (LIST (SPADCALL |ex| (QREFELT $ 24))) |frep|))
   (#1# (SPADCALL |inp| NIL |frep|)))) 

(DEFUN |TESTAUX;testTrueAux;SRV;22| (|inp| |ex| $)
  (|TESTAUX;testTrueAux0| |inp| |ex| (CONS (|function| |TESTAUX;nPassInc|) $)
   (CONS (|function| |TESTAUX;nFailInc|) $) $)) 

(DEFUN |TESTAUX;xftestTrueAux;SRV;23| (|inp| |ex| $)
  (|TESTAUX;testTrueAux0| |inp| |ex| (CONS (|function| |TESTAUX;xPassInc|) $)
   (CONS (|function| |TESTAUX;xFailInc|) $) $)) 

(DEFUN |TESTAUX;testLibraryErrorAux;SRV;24| (|inp| |ex| $)
  (COND
   ((|HasCategory| (QREFELT $ 6) (LIST '|CoercibleTo| '(|OutputForm|)))
    (SPADCALL |inp| (LIST (SPADCALL |ex| (QREFELT $ 24))) (QREFELT $ 59)))
   ('T (SPADCALL |inp| NIL (QREFELT $ 59))))) 

(DEFUN |TESTAUX;xftestLibraryErrorAux;SRV;25| (|inp| |ex| $)
  (COND
   ((|HasCategory| (QREFELT $ 6) (LIST '|CoercibleTo| '(|OutputForm|)))
    (SPADCALL |inp| (LIST (SPADCALL |ex| (QREFELT $ 24))) (QREFELT $ 61)))
   ('T (SPADCALL |inp| NIL (QREFELT $ 61))))) 

(DEFUN |UnittestAux| (#1=#:G203)
  (PROG ()
    (RETURN
     (PROG (#2=#:G204)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|UnittestAux|)
                                           '|domainEqualList|)
                . #3=(|UnittestAux|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|UnittestAux;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|UnittestAux|))))))))))) 

(DEFUN |UnittestAux;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|UnittestAux|))
      (LETT |dv$| (LIST '|UnittestAux| DV$1) . #1#)
      (LETT $ (GETREFV 63) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|RealNumberSystem|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|UnittestAux| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| '(|ConvertibleTo| (|InputForm|)))
        (QSETREFV $ 19
                  (CONS (|dispatchFunction| |TESTAUX;testEqualsAuxCmp;2RB;5|)
                        $)))
       ((|domainEqual| |#1| (|InputForm|))
        (QSETREFV $ 19
                  (CONS (|dispatchFunction| |TESTAUX;testEqualsAuxCmp;2RB;6|)
                        $)))
       ('T
        (QSETREFV $ 19
                  (CONS (|dispatchFunction| |TESTAUX;testEqualsAuxCmp;2RB;7|)
                        $))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 30
                   (SPADCALL (SPADCALL 10 (QREFELT $ 28)) -15 (QREFELT $ 29)))
         (QSETREFV $ 31
                   (SPADCALL (SPADCALL 10 (QREFELT $ 28)) -15 (QREFELT $ 29)))
         (QSETREFV $ 32
                   (CONS
                    (|dispatchFunction| |TESTAUX;testRelativePrecision;2R;11|)
                    $))
         (QSETREFV $ 33
                   (CONS
                    (|dispatchFunction| |TESTAUX;testAbsolutePrecision;2R;12|)
                    $))
         NIL
         (QSETREFV $ 43
                   (CONS
                    (|dispatchFunction| |TESTAUX;testRealEqualsAux;S2RV;14|)
                    $))
         (QSETREFV $ 44
                   (CONS
                    (|dispatchFunction| |TESTAUX;xftestRealEqualsAux;S2RV;15|)
                    $))
         NIL
         (QSETREFV $ 52
                   (CONS
                    (|dispatchFunction| |TESTAUX;testComplexEqualsAux;S2CV;17|)
                    $))
         (QSETREFV $ 53
                   (CONS
                    (|dispatchFunction|
                     |TESTAUX;xftestComplexEqualsAux;S2CV;18|)
                    $)))))
      $)))) 

(MAKEPROP '|UnittestAux| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Void|) (|UnittestCount|)
              (0 . |incPass|) (|String|) (|List| 21) (4 . |incFail|)
              (10 . |incXfPass|) (16 . |incXfFail|) (|InputForm|)
              (20 . |convert|) (|Boolean|) (25 . =) (31 . |testEqualsAuxCmp|)
              (37 . =) (|OutputForm|) (43 . |message|) (48 . |addWarning|)
              (53 . |coerce|) |TESTAUX;testEqualsAux;S2RV;9|
              |TESTAUX;xftestEqualsAux;S2RV;10| (|Integer|) (58 . |coerce|)
              (63 . ^) '|epsilonRelative| '|epsilonAbsolute|
              (69 . |testRelativePrecision|) (74 . |testAbsolutePrecision|)
              (79 . -) (85 . |norm|) (90 . |zero?|) (95 . |Zero|) (99 . /)
              (105 . |One|) (109 . >) (115 . |hconcat|) (121 . |concat|)
              (127 . |testRealEqualsAux|) (134 . |xftestRealEqualsAux|)
              (|Complex| 6) (141 . -) (147 . |norm|) (152 . |zero?|) (157 . /)
              (163 . |One|) (167 . |coerce|) (172 . |testComplexEqualsAux|)
              (179 . |xftestComplexEqualsAux|)
              |TESTAUX;testNotEqualsAux;S2RV;19|
              |TESTAUX;xftestNotEqualsAux;S2RV;20| (186 . |coerce|)
              |TESTAUX;testTrueAux;SRV;22| |TESTAUX;xftestTrueAux;SRV;23|
              (191 . |incLibraryError|) |TESTAUX;testLibraryErrorAux;SRV;24|
              (197 . |incXfLibraryError|)
              |TESTAUX;xftestLibraryErrorAux;SRV;25|)
           '#(|xftestTrueAux| 203 |xftestRealEqualsAux| 209
              |xftestNotEqualsAux| 216 |xftestLibraryErrorAux| 223
              |xftestEqualsAux| 229 |xftestComplexEqualsAux| 236 |testTrueAux|
              243 |testRelativePrecision| 249 |testRealEqualsAux| 254
              |testNotEqualsAux| 261 |testLibraryErrorAux| 268
              |testEqualsAuxCmp| 274 |testEqualsAux| 280 |testComplexEqualsAux|
              287 |testAbsolutePrecision| 294)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 62
                                                 '(0 8 7 9 2 8 7 10 11 12 2 8 7
                                                   10 11 13 0 8 7 14 1 6 15 0
                                                   16 2 15 17 0 0 18 2 0 17 6 6
                                                   19 2 6 17 0 0 20 1 21 0 10
                                                   22 1 8 7 21 23 1 6 21 0 24 1
                                                   6 0 27 28 2 6 0 0 27 29 1 0
                                                   6 6 32 1 0 6 6 33 2 6 0 0 0
                                                   34 1 6 0 0 35 1 6 17 0 36 0
                                                   6 0 37 2 6 0 0 0 38 0 6 0 39
                                                   2 6 17 0 0 40 2 21 0 0 0 41
                                                   2 11 0 0 0 42 3 0 7 10 6 6
                                                   43 3 0 7 10 6 6 44 2 45 0 0
                                                   0 46 1 45 6 0 47 1 45 17 0
                                                   48 2 45 0 0 0 49 0 45 0 50 1
                                                   45 21 0 51 3 0 7 10 45 45 52
                                                   3 0 7 10 45 45 53 1 17 21 0
                                                   56 2 8 7 10 11 59 2 8 7 10
                                                   11 61 2 0 7 10 6 58 3 1 7 10
                                                   6 6 44 3 0 7 10 6 6 55 2 0 7
                                                   10 6 62 3 0 7 10 6 6 26 3 1
                                                   7 10 45 45 53 2 0 7 10 6 57
                                                   1 1 6 6 32 3 1 7 10 6 6 43 3
                                                   0 7 10 6 6 54 2 0 7 10 6 60
                                                   2 0 17 6 6 19 3 0 7 10 6 6
                                                   25 3 1 7 10 45 45 52 1 1 6 6
                                                   33)))))
           '|lookupComplete|)) 
