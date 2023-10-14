
(/VERSIONCHECK 2) 

(DEFUN |MMAP;rfmap| (|f| |q| $)
  (SPADCALL (SPADCALL |f| (SPADCALL |q| (QREFELT $ 13)) (QREFELT $ 16))
            (SPADCALL |f| (SPADCALL |q| (QREFELT $ 17)) (QREFELT $ 16))
            (QREFELT $ 19))) 

(DEFUN |MMAP;map;MUPUP1UPUP2;2| (|f| |p| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|MMAP;map;MUPUP1UPUP2;2!0| (VECTOR $ |f|)) |p|
               (QREFELT $ 22))))) 

(DEFUN |MMAP;map;MUPUP1UPUP2;2!0| (|x| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|MMAP;map;MUPUP1UPUP2;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|MMAP;rfmap| |f| |x| $))))) 

(DEFUN |MultipleMap| (&REST #1=#:G133)
  (PROG ()
    (RETURN
     (PROG (#2=#:G134)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|MultipleMap|)
                                           '|domainEqualList|)
                . #3=(|MultipleMap|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |MultipleMap;|) #1#)
                (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|MultipleMap|))))))))))) 

(DEFUN |MultipleMap;| (|#1| |#2| |#3| |#4| |#5| |#6|)
  (PROG (|pv$| $ |dv$| DV$6 DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MultipleMap|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT DV$6 (|devaluate| |#6|) . #1#)
      (LETT |dv$| (LIST '|MultipleMap| DV$1 DV$2 DV$3 DV$4 DV$5 DV$6) . #1#)
      (LETT $ (GETREFV 24) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MultipleMap|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (QSETREFV $ 11 |#6|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MultipleMap| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|Fraction| 7) (0 . |numer|) (|Mapping| 9 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 9 10) (5 . |map|)
              (11 . |denom|) (|Fraction| 10) (16 . /) (|Mapping| 18 12)
              (|UnivariatePolynomialCategoryFunctions2| 12 8 18 11)
              (22 . |map|) |MMAP;map;MUPUP1UPUP2;2|)
           '#(|map| 28) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 23
                                                 '(1 12 7 0 13 2 15 10 14 7 16
                                                   1 12 7 0 17 2 18 0 10 10 19
                                                   2 21 11 20 8 22 2 0 11 14 8
                                                   23)))))
           '|lookupComplete|)) 
