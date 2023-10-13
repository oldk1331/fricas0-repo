
(/VERSIONCHECK 2) 

(DEFUN |PATTERN1;st| (|p| |l| $)
  (SPADCALL |p| (SPADCALL (SPADCALL |p| (QREFELT $ 10)) |l| (QREFELT $ 11))
            (QREFELT $ 12))) 

(DEFUN |PATTERN1;predicate;PM;2| (|p| $)
  (PROG () (RETURN (CONS #'|PATTERN1;predicate;PM;2!0| (VECTOR $ |p|))))) 

(DEFUN |PATTERN1;predicate;PM;2!0| (|d1| $$)
  (PROG (|p| $)
    (LETT |p| (QREFELT $$ 1) . #1=(|PATTERN1;predicate;PM;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (|PATTERN1;applyAll| (SPADCALL |p| (QREFELT $ 10)) |d1| $))))) 

(DEFUN |PATTERN1;addBadValue;PDP;3| (|p| |v| $)
  (SPADCALL |p| (SPADCALL |v| (QREFELT $ 17)) (QREFELT $ 18))) 

(DEFUN |PATTERN1;badValues;PL;4| (|p| $)
  (PROG (#1=#:G135 |v| #2=#:G134)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|PATTERN1;badValues;PL;4|))
       (SEQ (LETT |v| NIL . #3#) (LETT #1# (SPADCALL |p| (QREFELT $ 20)) . #3#)
            G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 21)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |PATTERN1;suchThat;PLMP;5| (|p| |l| |f| $)
  (SPADCALL (SPADCALL |p| (QREFELT $ 24)) |l| (SPADCALL |f| (QREFELT $ 27))
            (QREFELT $ 29))) 

(DEFUN |PATTERN1;suchThat;PMP;6| (|p| |f| $)
  (|PATTERN1;st| |p| (LIST (SPADCALL |f| (QREFELT $ 32))) $)) 

(DEFUN |PATTERN1;satisfy?;DPB;7| (|d| |p| $)
  (|PATTERN1;applyAll| (SPADCALL |p| (QREFELT $ 10)) |d| $)) 

(DEFUN |PATTERN1;satisfy?;LPB;8| (|l| |p| $)
  (PROG (|rec|)
    (RETURN
     (COND
      ((NULL
        (QCAR
         (LETT |rec| (SPADCALL |p| (QREFELT $ 37)) |PATTERN1;satisfy?;LPB;8|)))
       'T)
      ('T (SPADCALL |l| (SPADCALL (QCDR |rec|) (QREFELT $ 38)))))))) 

(DEFUN |PATTERN1;applyAll| (|l| |d| $)
  (PROG (#1=#:G147 #2=#:G149 #3=#:G150 |f|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |f| NIL . #4=(|PATTERN1;applyAll|)) (LETT #3# |l| . #4#)
               G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL (SPADCALL |d| (SPADCALL |f| (QREFELT $ 40))))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#)) . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |PATTERN1;suchThat;PLP;10| (|p| |l| $)
  (PROG (#1=#:G156 |f| #2=#:G155)
    (RETURN
     (SEQ
      (|PATTERN1;st| |p|
       (PROGN
        (LETT #2# NIL . #3=(|PATTERN1;suchThat;PLP;10|))
        (SEQ (LETT |f| NIL . #3#) (LETT #1# |l| . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT (LETT #2# (CONS (SPADCALL |f| (QREFELT $ 32)) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       $))))) 

(DEFUN |PatternFunctions1| (&REST #1=#:G157)
  (PROG ()
    (RETURN
     (PROG (#2=#:G158)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PatternFunctions1|)
                                           '|domainEqualList|)
                . #3=(|PatternFunctions1|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PatternFunctions1;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|PatternFunctions1|))))))))))) 

(DEFUN |PatternFunctions1;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PatternFunctions1|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|PatternFunctions1| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 43) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PatternFunctions1| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PatternFunctions1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| 15)
              (|Pattern| 6) (0 . |predicates|) (5 . |concat|)
              (11 . |withPredicates|) (|Mapping| 34 7)
              |PATTERN1;predicate;PM;2| (|Any|) (|AnyFunctions1| 7)
              (17 . |coerce|) (22 . |addBadValue|) |PATTERN1;addBadValue;PDP;3|
              (28 . |getBadValues|) (33 . |retract|) (|List| 7)
              |PATTERN1;badValues;PL;4| (38 . |copy|) (|Mapping| 34 22)
              (|AnyFunctions1| 25) (43 . |coerce|) (|List| (|Symbol|))
              (48 . |setTopPredicate|) |PATTERN1;suchThat;PLMP;5|
              (|AnyFunctions1| 13) (55 . |coerce|) |PATTERN1;suchThat;PMP;6|
              (|Boolean|) |PATTERN1;satisfy?;DPB;7|
              (|Record| (|:| |var| 28) (|:| |pred| 15)) (60 . |topPredicate|)
              (65 . |retract|) |PATTERN1;satisfy?;LPB;8| (70 . |retract|)
              (|List| 13) |PATTERN1;suchThat;PLP;10|)
           '#(|suchThat| 75 |satisfy?| 94 |predicate| 106 |badValues| 111
              |addBadValue| 116)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 42
                                                 '(1 9 8 0 10 2 8 0 0 0 11 2 9
                                                   0 0 8 12 1 16 15 7 17 2 9 0
                                                   0 15 18 1 9 8 0 20 1 16 7 15
                                                   21 1 9 0 0 24 1 26 15 25 27
                                                   3 9 0 0 28 15 29 1 31 15 13
                                                   32 1 9 36 0 37 1 26 25 15 38
                                                   1 31 13 15 40 2 0 9 9 41 42
                                                   2 0 9 9 13 33 3 0 9 9 28 25
                                                   30 2 0 34 22 9 39 2 0 34 7 9
                                                   35 1 0 13 9 14 1 0 22 9 23 2
                                                   0 9 9 7 19)))))
           '|lookupComplete|)) 
