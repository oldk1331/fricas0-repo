
(/VERSIONCHECK 2) 

(DEFUN |EVALCYC;evp| (|fn| |pt| $)
  (PROG (#1=#:G128 #2=#:G127 #3=#:G129 #4=#:G131 |i|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|EVALCYC;evp|))
       (SEQ (LETT |i| NIL . #5#) (LETT #4# (SPADCALL |pt| (QREFELT $ 9)) . #5#)
            G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3# (SPADCALL |i| |fn|) . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 10)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 11)))))))) 

(DEFUN |EVALCYC;eval;MSpF;2| (|fn| |spol| $)
  (COND
   ((SPADCALL |spol| (|spadConstant| $ 15) (QREFELT $ 17))
    (|spadConstant| $ 12))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL |spol| (QREFELT $ 19))
               (|EVALCYC;evp| |fn| (SPADCALL |spol| (QREFELT $ 20)) $)
               (QREFELT $ 21))
     (SPADCALL |fn| (SPADCALL |spol| (QREFELT $ 22)) (QREFELT $ 24))
     (QREFELT $ 25))))) 

(DEFUN |EvaluateCycleIndicators| (#1=#:G135)
  (PROG ()
    (RETURN
     (PROG (#2=#:G136)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|EvaluateCycleIndicators|)
                                           '|domainEqualList|)
                . #3=(|EvaluateCycleIndicators|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|EvaluateCycleIndicators;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|EvaluateCycleIndicators|))))))))))) 

(DEFUN |EvaluateCycleIndicators;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|EvaluateCycleIndicators|))
      (LETT |dv$| (LIST '|EvaluateCycleIndicators| DV$1) . #1#)
      (LETT $ (GETREFV 26) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|EvaluateCycleIndicators| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|EvaluateCycleIndicators| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|List| (|Integer|))
              (|Partition|) (0 . |coerce|) (5 . *) (11 . |One|) (15 . |Zero|)
              (19 . |Zero|) (|SymmetricPolynomial| 18) (23 . |Zero|)
              (|Boolean|) (27 . =) (|Fraction| (|Integer|))
              (33 . |leadingCoefficient|) (38 . |degree|) (43 . *)
              (49 . |reductum|) (|Mapping| 6 (|Integer|)) |EVALCYC;eval;MSpF;2|
              (54 . +))
           '#(|eval| 60) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 25
                                                 '(1 8 7 0 9 2 6 0 0 0 10 0 6 0
                                                   11 0 6 0 12 0 8 0 13 0 14 0
                                                   15 2 14 16 0 0 17 1 14 18 0
                                                   19 1 14 8 0 20 2 6 0 18 0 21
                                                   1 14 0 0 22 2 6 0 0 0 25 2 0
                                                   6 23 14 24)))))
           '|lookupComplete|)) 
