
(/VERSIONCHECK 2) 

(DEFUN |TSEREXPL;taylor_via_deriv;ULSLLULS;1| (|f| |lx| |ld| $)
  (PROG (|lxt| #1=#:G129 |x| #2=#:G128 |ft|)
    (RETURN
     (SEQ
      (LETT |ft| (SPADCALL |f| (QREFELT $ 9))
            . #3=(|TSEREXPL;taylor_via_deriv;ULSLLULS;1|))
      (LETT |lxt|
            (PROGN
             (LETT #2# NIL . #3#)
             (SEQ (LETT |x| NIL . #3#) (LETT #1# |lx| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 9)) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (SPADCALL (SPADCALL |ft| |lxt| |ld| (QREFELT $ 14)) (QREFELT $ 15))))))) 

(DEFUN |TSEREXPL;taylor_via_lode;LULSLULS;2| (|la| |z| |lc| $)
  (PROG (|lat| #1=#:G134 |a| #2=#:G133 |zt|)
    (RETURN
     (SEQ
      (LETT |zt| (SPADCALL |z| (QREFELT $ 9))
            . #3=(|TSEREXPL;taylor_via_lode;LULSLULS;2|))
      (LETT |lat|
            (PROGN
             (LETT #2# NIL . #3#)
             (SEQ (LETT |a| NIL . #3#) (LETT #1# |la| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |a| (QREFELT $ 9)) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (SPADCALL (SPADCALL |lat| |zt| |lc| (QREFELT $ 19)) (QREFELT $ 15))))))) 

(DEFUN |TSEREXPL;applyTaylor;M2ULS;3| (|g| |f| $)
  (SPADCALL (SPADCALL |g| (SPADCALL |f| (QREFELT $ 9)) (QREFELT $ 22))
            (QREFELT $ 15))) 

(DEFUN |TaylorSeriesExpansionLaurent| (&REST #1=#:G137)
  (PROG ()
    (RETURN
     (PROG (#2=#:G138)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|TaylorSeriesExpansionLaurent|)
                                           '|domainEqualList|)
                . #3=(|TaylorSeriesExpansionLaurent|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |TaylorSeriesExpansionLaurent;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|TaylorSeriesExpansionLaurent|))))))))))) 

(DEFUN |TaylorSeriesExpansionLaurent;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|TaylorSeriesExpansionLaurent|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|TaylorSeriesExpansionLaurent| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 24) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TaylorSeriesExpansionLaurent|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|TaylorSeriesExpansionLaurent| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |taylor|) (|List| 7) (|Mapping| 6 6)
              (|List| 11) (|TaylorSeriesExpansionTaylor| 6 7)
              (5 . |taylor_via_deriv|) (12 . |coerce|) (|List| 8)
              |TSEREXPL;taylor_via_deriv;ULSLLULS;1| (|List| 6)
              (17 . |taylor_via_lode|) |TSEREXPL;taylor_via_lode;LULSLULS;2|
              (|Mapping| 7 7) (24 . |applyTaylor|)
              |TSEREXPL;applyTaylor;M2ULS;3|)
           '#(|taylor_via_lode| 30 |taylor_via_deriv| 37 |applyTaylor| 51) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(|TaylorSeriesExpansion&|)
                       (CONS
                        '#((|TaylorSeriesExpansion| 6 (|Integer|)
                                                    (|SingletonAsOrderedSet|) 8
                                                    7))
                        (|makeByteWordVec2| 23
                                            '(1 8 7 0 9 3 13 7 7 10 12 14 1 8 0
                                              7 15 3 13 7 10 7 18 19 2 13 7 21
                                              7 22 3 0 8 16 8 18 20 3 0 8 8 16
                                              12 17 3 0 8 6 16 12 1 2 0 8 21 8
                                              23)))))
           '|lookupComplete|)) 
