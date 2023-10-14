
(/VERSIONCHECK 2) 

(PUT '|TABLEAU;tableau;L$;1| '|SPADreplace| '(XLAM (|lls|) |lls|)) 

(DEFUN |TABLEAU;tableau;L$;1| (|lls| $) |lls|) 

(PUT '|TABLEAU;listOfLists;$L;2| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |TABLEAU;listOfLists;$L;2| (|x| $) |x|) 

(DEFUN |TABLEAU;makeupv| (|n| |ls| $)
  (PROG (#1=#:G131 |i| #2=#:G132 |s| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL |n| (SPADCALL " " (QREFELT $ 13)) (QREFELT $ 16))
            . #3=(|TABLEAU;makeupv|))
      (SEQ (LETT |s| NIL . #3#) (LETT #2# |ls| . #3#) (LETT |i| 1 . #3#)
           (LETT #1# (LENGTH |ls|) . #3#) G190
           (COND
            ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                 (PROGN (LETT |s| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |v| |i|
                       (SPADCALL (SPADCALL |s| (QREFELT $ 17)) (QREFELT $ 18))
                       (QREFELT $ 20))))
           (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |v|))))) 

(DEFUN |TABLEAU;maketab| (|lls| $)
  (PROG (|ll| #1=#:G139 |i| #2=#:G138 |sz|)
    (RETURN
     (SEQ
      (LETT |ll|
            (COND ((NULL |lls|) (LIST (SPADCALL (QREFELT $ 21))))
                  ('T
                   (SEQ
                    (LETT |sz| (LENGTH (|SPADfirst| |lls|))
                          . #3=(|TABLEAU;maketab|))
                    (EXIT
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |i| NIL . #3#) (LETT #1# |lls| . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL (|TABLEAU;makeupv| |sz| |i| $)
                                              (QREFELT $ 23))
                                    #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))))))
            . #3#)
      (EXIT (SPADCALL |ll| (QREFELT $ 24))))))) 

(DEFUN |TABLEAU;coerce;$Of;5| (|x| $)
  (|TABLEAU;maketab| (SPADCALL |x| (QREFELT $ 10)) $)) 

(DEFUN |Tableau| (#1=#:G141)
  (PROG ()
    (RETURN
     (PROG (#2=#:G142)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|Tableau|)
                                           '|domainEqualList|)
                . #3=(|Tableau|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Tableau;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Tableau|))))))))))) 

(DEFUN |Tableau;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Tableau|))
      (LETT |dv$| (LIST '|Tableau| DV$1) . #1#)
      (LETT $ (GETREFV 26) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Tableau| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|List| (|List| |#1|)))
      $)))) 

(MAKEPROP '|Tableau| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| (|List| 6))
              |TABLEAU;tableau;L$;1| |TABLEAU;listOfLists;$L;2| (|String|)
              (|OutputForm|) (0 . |message|) (|NonNegativeInteger|) (|List| 12)
              (5 . |new|) (11 . |coerce|) (16 . |box|) (|Integer|)
              (21 . |setelt|) (28 . |empty|) (|List| $) (32 . |blankSeparate|)
              (37 . |pile|) |TABLEAU;coerce;$Of;5|)
           '#(|tableau| 42 |listOfLists| 47 |coerce| 52) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|CoercibleTo| 12))
                             (|makeByteWordVec2| 25
                                                 '(1 12 0 11 13 2 15 0 14 12 16
                                                   1 6 12 0 17 1 12 0 0 18 3 15
                                                   12 0 19 12 20 0 12 0 21 1 12
                                                   0 22 23 1 12 0 22 24 1 0 0 8
                                                   9 1 0 8 0 10 1 0 12 0
                                                   25)))))
           '|lookupComplete|)) 
