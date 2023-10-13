
(/VERSIONCHECK 2) 

(DEFUN |DIAGG-;dictionary;LA;1| (|l| $)
  (PROG (#1=#:G139 |x| |d|)
    (RETURN
     (SEQ (LETT |d| (SPADCALL (QREFELT $ 8)) . #2=(|DIAGG-;dictionary;LA;1|))
          (SEQ (LETT |x| NIL . #2#) (LETT #1# |l| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |x| |d| (QREFELT $ 9))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |d|))))) 

(DEFUN |DIAGG-;select!;M2A;2| (|f| |t| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|DIAGG-;select!;M2A;2!0| (VECTOR $ |f|)) |t|
               (QREFELT $ 16))))) 

(DEFUN |DIAGG-;select!;M2A;2!0| (|x| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|DIAGG-;select!;M2A;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (COND ((SPADCALL |x| |f|) (|spadConstant| $ 13))
            ('T (|spadConstant| $ 14))))))) 

(DEFUN |DIAGG-;=;2AB;3| (|s| |t| $)
  (PROG ()
    (RETURN
     (COND ((SPADCALL |s| |t| (QREFELT $ 18)) 'T)
           ((SPADCALL (SPADCALL |s| (QREFELT $ 20))
                      (SPADCALL |t| (QREFELT $ 20)) (QREFELT $ 21))
            'NIL)
           ('T
            (SPADCALL (CONS #'|DIAGG-;=;2AB;3!0| (VECTOR $ |t|))
                      (SPADCALL |s| (QREFELT $ 23)) (QREFELT $ 24))))))) 

(DEFUN |DIAGG-;=;2AB;3!0| (|x| $$)
  (PROG (|t| $)
    (LETT |t| (QREFELT $$ 1) . #1=(|DIAGG-;=;2AB;3|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |t| (QREFELT $ 22)))))) 

(DEFUN |DIAGG-;remove!;M2A;4| (|f| |t| $)
  (PROG (#1=#:G158 |m|)
    (RETURN
     (SEQ
      (SEQ (LETT |m| NIL . #2=(|DIAGG-;remove!;M2A;4|))
           (LETT #1# (SPADCALL |t| (QREFELT $ 23)) . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND ((SPADCALL |m| |f|) (SPADCALL |m| |t| (QREFELT $ 26))))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |t|))))) 

(DEFUN |Dictionary&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Dictionary&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|Dictionary&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 28) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| '(|finiteAggregate|))
        (PROGN
         (QSETREFV $ 17 (CONS (|dispatchFunction| |DIAGG-;select!;M2A;2|) $))
         (QSETREFV $ 25 (CONS (|dispatchFunction| |DIAGG-;=;2AB;3|) $))
         (QSETREFV $ 27
                   (CONS (|dispatchFunction| |DIAGG-;remove!;M2A;4|) $)))))
      $)))) 

(MAKEPROP '|Dictionary&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |dictionary|) (4 . |insert!|) (|List| 7)
              |DIAGG-;dictionary;LA;1| (|Boolean|) (10 . |false|) (14 . |true|)
              (|Mapping| 12 7) (18 . |remove!|) (24 . |select!|) (30 . |eq?|)
              (|NonNegativeInteger|) (36 . |#|) (41 . ~=) (47 . |member?|)
              (53 . |parts|) (58 . |every?|) (64 . =) (70 . |remove!|)
              (76 . |remove!|))
           '#(|select!| 82 |remove!| 88 |dictionary| 94 = 99) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 27
                                                 '(0 6 0 8 2 6 0 7 0 9 0 12 0
                                                   13 0 12 0 14 2 6 0 15 0 16 2
                                                   0 0 15 0 17 2 6 12 0 0 18 1
                                                   6 19 0 20 2 19 12 0 0 21 2 6
                                                   12 7 0 22 1 6 10 0 23 2 10
                                                   12 15 0 24 2 0 12 0 0 25 2 6
                                                   0 7 0 26 2 0 0 15 0 27 2 0 0
                                                   15 0 17 2 0 0 15 0 27 1 0 0
                                                   10 11 2 0 12 0 0 25)))))
           '|lookupComplete|)) 
