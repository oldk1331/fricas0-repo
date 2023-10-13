
(/VERSIONCHECK 2) 

(DEFUN |IXAGG-;elt;SIndex2Entry;1| (|a| |i| |x| $)
  (COND ((SPADCALL |i| |a| (QREFELT $ 10)) (SPADCALL |a| |i| (QREFELT $ 11)))
        ('T |x|))) 

(DEFUN |IXAGG-;entries;SL;2| (|x| $) (SPADCALL |x| (QREFELT $ 14))) 

(DEFUN |IXAGG-;entry?;EntrySB;3| (|x| |a| $) (SPADCALL |x| |a| (QREFELT $ 16))) 

(DEFUN |IXAGG-;maxIndex;SIndex;4| (|a| $)
  (PROG (#1=#:G140 #2=#:G139 #3=#:G141 #4=#:G143 #5=#:G125)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #6=(|IXAGG-;maxIndex;SIndex;4|))
       (SEQ (LETT #5# NIL . #6#) (LETT #4# (SPADCALL |a| (QREFELT $ 19)) . #6#)
            G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#) . #6#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3# #5# . #6#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 20)) . #6#))
                     ('T (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
            (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|IdentityError| '|max|)))))))) 

(DEFUN |IXAGG-;minIndex;SIndex;5| (|a| $)
  (PROG (#1=#:G145 #2=#:G144 #3=#:G146 #4=#:G148 #5=#:G126)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #6=(|IXAGG-;minIndex;SIndex;5|))
       (SEQ (LETT #5# NIL . #6#) (LETT #4# (SPADCALL |a| (QREFELT $ 19)) . #6#)
            G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#) . #6#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3# #5# . #6#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 22)) . #6#))
                     ('T (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
            (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|IdentityError| '|min|)))))))) 

(DEFUN |IXAGG-;first;SEntry;6| (|a| $)
  (SPADCALL |a| (SPADCALL |a| (QREFELT $ 24)) (QREFELT $ 25))) 

(DEFUN |IXAGG-;map;M2S;7| (|f| |a| $)
  (SPADCALL |f| (SPADCALL |a| (QREFELT $ 27)) (QREFELT $ 29))) 

(DEFUN |IXAGG-;map!;M2S;8| (|f| |a| $)
  (PROG (#1=#:G155 |i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| NIL . #2=(|IXAGG-;map!;M2S;8|))
           (LETT #1# (SPADCALL |a| (QREFELT $ 19)) . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |a| |i| (SPADCALL (SPADCALL |a| |i| (QREFELT $ 11)) |f|)
                       (QREFELT $ 31))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |a|))))) 

(DEFUN |IXAGG-;fill!;SEntryS;9| (|a| |x| $)
  (PROG (#1=#:G159 |i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| NIL . #2=(|IXAGG-;fill!;SEntryS;9|))
           (LETT #1# (SPADCALL |a| (QREFELT $ 19)) . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ (EXIT (SPADCALL |a| |i| |x| (QREFELT $ 31))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |a|))))) 

(DEFUN |IXAGG-;swap!;S2IndexV;10| (|a| |i| |j| $)
  (PROG (|t|)
    (RETURN
     (SEQ
      (LETT |t| (SPADCALL |a| |i| (QREFELT $ 25)) |IXAGG-;swap!;S2IndexV;10|)
      (SPADCALL |a| |i| (SPADCALL |a| |j| (QREFELT $ 25)) (QREFELT $ 31))
      (SPADCALL |a| |j| |t| (QREFELT $ 31)) (EXIT (SPADCALL (QREFELT $ 35))))))) 

(DEFUN |IndexedAggregate&| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|IndexedAggregate&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|IndexedAggregate&| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 37) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|shallowlyMutable|))
                                          (|HasCategory| |#2| '(|OrderedSet|))
                                          (|HasCategory| |#1|
                                                         '(|finiteAggregate|))
                                          (|HasCategory| |#3|
                                                         '(|SetCategory|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 15 (CONS (|dispatchFunction| |IXAGG-;entries;SL;2|) $))
         (COND
          ((|testBitVector| |pv$| 4)
           (QSETREFV $ 17
                     (CONS (|dispatchFunction| |IXAGG-;entry?;EntrySB;3|)
                           $)))))))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 21
                   (CONS (|dispatchFunction| |IXAGG-;maxIndex;SIndex;4|) $))
         (QSETREFV $ 23
                   (CONS (|dispatchFunction| |IXAGG-;minIndex;SIndex;5|) $))
         (QSETREFV $ 26
                   (CONS (|dispatchFunction| |IXAGG-;first;SEntry;6|) $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 30 (CONS (|dispatchFunction| |IXAGG-;map;M2S;7|) $))
         (QSETREFV $ 32 (CONS (|dispatchFunction| |IXAGG-;map!;M2S;8|) $))
         (QSETREFV $ 33 (CONS (|dispatchFunction| |IXAGG-;fill!;SEntryS;9|) $))
         (QSETREFV $ 36
                   (CONS (|dispatchFunction| |IXAGG-;swap!;S2IndexV;10|) $)))))
      $)))) 

(MAKEPROP '|IndexedAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Boolean|) (0 . |index?|) (6 . |qelt|)
              |IXAGG-;elt;SIndex2Entry;1| (|List| 8) (12 . |parts|)
              (17 . |entries|) (22 . |member?|) (28 . |entry?|) (|List| 7)
              (34 . |indices|) (39 . |max|) (45 . |maxIndex|) (50 . |min|)
              (56 . |minIndex|) (61 . |minIndex|) (66 . |elt|) (72 . |first|)
              (77 . |copy|) (|Mapping| 8 8) (82 . |map!|) (88 . |map|)
              (94 . |qsetelt!|) (101 . |map!|) (107 . |fill!|) (|Void|)
              (113 . |void|) (117 . |swap!|))
           '#(|swap!| 124 |minIndex| 131 |maxIndex| 136 |map!| 141 |map| 147
              |first| 153 |fill!| 158 |entry?| 164 |entries| 170 |elt| 175)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 36
                                                 '(2 6 9 7 0 10 2 6 8 0 7 11 1
                                                   6 13 0 14 1 0 13 0 15 2 6 9
                                                   8 0 16 2 0 9 8 0 17 1 6 18 0
                                                   19 2 7 0 0 0 20 1 0 7 0 21 2
                                                   7 0 0 0 22 1 0 7 0 23 1 6 7
                                                   0 24 2 6 8 0 7 25 1 0 8 0 26
                                                   1 6 0 0 27 2 6 0 28 0 29 2 0
                                                   0 28 0 30 3 6 8 0 7 8 31 2 0
                                                   0 28 0 32 2 0 0 0 8 33 0 34
                                                   0 35 3 0 34 0 7 7 36 3 0 34
                                                   0 7 7 36 1 0 7 0 23 1 0 7 0
                                                   21 2 0 0 28 0 32 2 0 0 28 0
                                                   30 1 0 8 0 26 2 0 0 0 8 33 2
                                                   0 9 8 0 17 1 0 13 0 15 3 0 8
                                                   0 7 8 12)))))
           '|lookupComplete|)) 
