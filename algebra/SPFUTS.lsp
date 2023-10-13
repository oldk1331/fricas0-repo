
(/VERSIONCHECK 2) 

(DEFUN |SPFUTS;lambertW0;2UTS;1| (|x| $)
  (PROG (|dx|)
    (RETURN
     (SEQ (LETT |dx| (SPADCALL |x| (QREFELT $ 8)) |SPFUTS;lambertW0;2UTS;1|)
          (EXIT
           (SPADCALL
            (SPADCALL (CONS #'|SPFUTS;lambertW0;2UTS;1!1| (VECTOR |dx| $))
                      (QREFELT $ 27))
            (QREFELT $ 12))))))) 

(DEFUN |SPFUTS;lambertW0;2UTS;1!1| (|s| $$)
  (PROG ($ |dx|)
    (LETT $ (QREFELT $$ 1) . #1=(|SPFUTS;lambertW0;2UTS;1|))
    (LETT |dx| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL (|spadConstant| $ 9)
                   (CONS #'|SPFUTS;lambertW0;2UTS;1!0| (VECTOR $ |s| |dx|))
                   (QREFELT $ 24)))))))) 

(DEFUN |SPFUTS;lambertW0;2UTS;1!0| ($$)
  (PROG (|dx| |s| $)
    (LETT |dx| (QREFELT $$ 2) NIL)
    (LETT |s| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL
        (SPADCALL |dx|
                  (SPADCALL
                   (SPADCALL (SPADCALL |s| (QREFELT $ 12)) (QREFELT $ 13))
                   (QREFELT $ 14))
                  (QREFELT $ 15))
        (SPADCALL
         (SPADCALL (|spadConstant| $ 16) (SPADCALL |s| (QREFELT $ 12))
                   (QREFELT $ 17))
         (SPADCALL (|spadConstant| $ 18) (QREFELT $ 19)) (QREFELT $ 20))
        (QREFELT $ 15))
       (QREFELT $ 21)))))) 

(DEFUN |SpecialFunctionUnivariateTaylorSeries| (&REST #1=#:G131)
  (PROG ()
    (RETURN
     (PROG (#2=#:G132)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|SpecialFunctionUnivariateTaylorSeries|)
                                           '|domainEqualList|)
                . #3=(|SpecialFunctionUnivariateTaylorSeries|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |SpecialFunctionUnivariateTaylorSeries;|)
                         #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|SpecialFunctionUnivariateTaylorSeries|))))))))))) 

(DEFUN |SpecialFunctionUnivariateTaylorSeries;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|SpecialFunctionUnivariateTaylorSeries|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|SpecialFunctionUnivariateTaylorSeries| DV$1 DV$2)
            . #1#)
      (LETT $ (GETREFV 29) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SpecialFunctionUnivariateTaylorSeries|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|SpecialFunctionUnivariateTaylorSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |differentiate|) (5 . |Zero|) (9 . |Zero|) (|Stream| 6)
              (13 . |series|) (18 . -) (23 . |exp|) (28 . *) (34 . |One|)
              (38 . +) (44 . |One|) (48 . -) (53 . ^) (59 . |coefficients|)
              (|Mapping| 11) (|StreamTaylorSeriesOperations| 6)
              (64 . |lazyIntegrate|) (|Mapping| 11 11)
              (|ParadoxicalCombinatorsForStreams| 6) (70 . Y)
              |SPFUTS;lambertW0;2UTS;1|)
           '#(|lambertW0| 75) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(1 7 0 0 8 0 6 0 9 0 7 0 10 1
                                                   7 0 11 12 1 7 0 0 13 1 7 0 0
                                                   14 2 7 0 0 0 15 0 7 0 16 2 7
                                                   0 0 0 17 0 6 0 18 1 6 0 0 19
                                                   2 7 0 0 6 20 1 7 11 0 21 2
                                                   23 11 6 22 24 1 26 11 25 27
                                                   1 0 7 7 28)))))
           '|lookupComplete|)) 
