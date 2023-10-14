
(/VERSIONCHECK 2) 

(DEFUN |LIST2MAP;match;LLM;1| (|la| |lb| $)
  (PROG () (RETURN (CONS #'|LIST2MAP;match;LLM;1!0| (VECTOR $ |lb| |la|))))) 

(DEFUN |LIST2MAP;match;LLM;1!0| (|z1| $$)
  (PROG (|la| |lb| $)
    (LETT |la| (QREFELT $$ 2) . #1=(|LIST2MAP;match;LLM;1|))
    (LETT |lb| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |la| |lb| |z1| (QREFELT $ 10)))))) 

(DEFUN |LIST2MAP;match;LLAB;2| (|la| |lb| |a| $)
  (SPADCALL |lb| (SPADCALL |a| |la| (QREFELT $ 14)) (QREFELT $ 15))) 

(DEFUN |LIST2MAP;match;LLBM;3| (|la| |lb| |b| $)
  (PROG ()
    (RETURN (CONS #'|LIST2MAP;match;LLBM;3!0| (VECTOR $ |b| |lb| |la|))))) 

(DEFUN |LIST2MAP;match;LLBM;3!0| (|z1| $$)
  (PROG (|la| |lb| |b| $)
    (LETT |la| (QREFELT $$ 3) . #1=(|LIST2MAP;match;LLBM;3|))
    (LETT |lb| (QREFELT $$ 2) . #1#)
    (LETT |b| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |la| |lb| |z1| |b| (QREFELT $ 16)))))) 

(DEFUN |LIST2MAP;match;LL2M;4| (|la| |lb| |f| $)
  (PROG ()
    (RETURN (CONS #'|LIST2MAP;match;LL2M;4!0| (VECTOR $ |f| |lb| |la|))))) 

(DEFUN |LIST2MAP;match;LL2M;4!0| (|z1| $$)
  (PROG (|la| |lb| |f| $)
    (LETT |la| (QREFELT $$ 3) . #1=(|LIST2MAP;match;LL2M;4|))
    (LETT |lb| (QREFELT $$ 2) . #1#)
    (LETT |f| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |la| |lb| |z1| |f| (QREFELT $ 18)))))) 

(DEFUN |LIST2MAP;match;LLA2B;5| (|la| |lb| |a| |b| $)
  (PROG (|p|)
    (RETURN
     (COND
      ((<
        (LETT |p| (SPADCALL |a| |la| (QREFELT $ 14)) |LIST2MAP;match;LLA2B;5|)
        (SPADCALL |la| (QREFELT $ 20)))
       |b|)
      ('T (SPADCALL |lb| |p| (QREFELT $ 15))))))) 

(DEFUN |LIST2MAP;match;LLAMB;6| (|la| |lb| |a| |f| $)
  (PROG (|p|)
    (RETURN
     (COND
      ((<
        (LETT |p| (SPADCALL |a| |la| (QREFELT $ 14)) |LIST2MAP;match;LLAMB;6|)
        (SPADCALL |la| (QREFELT $ 20)))
       (SPADCALL |a| |f|))
      ('T (SPADCALL |lb| |p| (QREFELT $ 15))))))) 

(DEFUN |ListToMap| (&REST #1=#:G142)
  (PROG ()
    (RETURN
     (PROG (#2=#:G143)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ListToMap|)
                                           '|domainEqualList|)
                . #3=(|ListToMap|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ListToMap;|) #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|ListToMap|))))))))))) 

(DEFUN |ListToMap;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ListToMap|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ListToMap| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 21) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ListToMap| (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ListToMap| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| 6)
              (|List| 7) |LIST2MAP;match;LLAB;2| (|Mapping| 7 6)
              |LIST2MAP;match;LLM;1| (|Integer|) (0 . |position|) (6 . |elt|)
              |LIST2MAP;match;LLA2B;5| |LIST2MAP;match;LLBM;3|
              |LIST2MAP;match;LLAMB;6| |LIST2MAP;match;LL2M;4|
              (12 . |minIndex|))
           '#(|match| 17) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 20
                                                 '(2 8 13 6 0 14 2 9 7 0 13 15
                                                   1 8 13 0 20 2 0 11 8 9 12 3
                                                   0 11 8 9 7 17 3 0 7 8 9 6 10
                                                   4 0 7 8 9 6 7 16 4 0 7 8 9 6
                                                   11 18 3 0 11 8 9 11 19)))))
           '|lookupComplete|)) 
