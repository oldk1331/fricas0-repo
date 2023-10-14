
(/VERSIONCHECK 2) 

(DEFUN |PDRING-;differentiate;ALA;1| (|r| |l| $)
  (PROG (#1=#:G137 |s|)
    (RETURN
     (SEQ
      (SEQ (LETT |s| NIL . #2=(|PDRING-;differentiate;ALA;1|))
           (LETT #1# |l| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ (EXIT (LETT |r| (SPADCALL |r| |s| (QREFELT $ 8)) . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |r|))))) 

(DEFUN |PDRING-;differentiate;ASNniA;2| (|r| |s| |n| $)
  (PROG (|i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| 1 . #1=(|PDRING-;differentiate;ASNniA;2|)) G190
           (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (EXIT (LETT |r| (SPADCALL |r| |s| (QREFELT $ 8)) . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |r|))))) 

(DEFUN |PDRING-;differentiate;ALLA;3| (|r| |ls| |ln| $)
  (PROG (#1=#:G144 |s| #2=#:G145 |n|)
    (RETURN
     (SEQ
      (SEQ (LETT |n| NIL . #3=(|PDRING-;differentiate;ALLA;3|))
           (LETT #2# |ln| . #3#) (LETT |s| NIL . #3#) (LETT #1# |ls| . #3#)
           G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL) (ATOM #2#)
                 (PROGN (LETT |n| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ (EXIT (LETT |r| (SPADCALL |r| |s| |n| (QREFELT $ 13)) . #3#)))
           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |r|))))) 

(DEFUN |PDRING-;D;ASA;4| (|r| |v| $) (SPADCALL |r| |v| (QREFELT $ 8))) 

(DEFUN |PDRING-;D;ALA;5| (|r| |lv| $) (SPADCALL |r| |lv| (QREFELT $ 17))) 

(DEFUN |PDRING-;D;ASNniA;6| (|r| |v| |n| $)
  (SPADCALL |r| |v| |n| (QREFELT $ 13))) 

(DEFUN |PDRING-;D;ALLA;7| (|r| |lv| |ln| $)
  (SPADCALL |r| |lv| |ln| (QREFELT $ 20))) 

(DECLAIM (NOTINLINE |PartialDifferentialRing&;|)) 

(DEFUN |PartialDifferentialRing&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PartialDifferentialRing&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|PartialDifferentialRing&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 22) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PartialDifferentialRing&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |differentiate|) (|List| 7) |PDRING-;differentiate;ALA;1|
              (|NonNegativeInteger|) |PDRING-;differentiate;ASNniA;2|
              (6 . |differentiate|) (|List| 11) |PDRING-;differentiate;ALLA;3|
              |PDRING-;D;ASA;4| (13 . |differentiate|) |PDRING-;D;ALA;5|
              |PDRING-;D;ASNniA;6| (19 . |differentiate|) |PDRING-;D;ALLA;7|)
           '#(|differentiate| 26 D 46) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 21
                                                 '(2 6 0 0 7 8 3 6 0 0 7 11 13
                                                   2 6 0 0 9 17 3 6 0 0 9 14 20
                                                   3 0 0 0 7 11 12 3 0 0 0 9 14
                                                   15 2 0 0 0 9 10 3 0 0 0 7 11
                                                   19 3 0 0 0 9 14 21 2 0 0 0 7
                                                   16 2 0 0 0 9 18)))))
           '|lookupComplete|)) 
