
(SDEFUN |BTCAT-;copy;2A;1| ((|t| A) ($ A))
        (COND ((SPADCALL |t| (QREFELT $ 9)) (SPADCALL (QREFELT $ 10)))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |t| (QREFELT $ 11)) (QREFELT $ 12))
                (SPADCALL |t| (QREFELT $ 13))
                (SPADCALL (SPADCALL |t| (QREFELT $ 14)) (QREFELT $ 12))
                (QREFELT $ 15))))) 

(SDEFUN |BTCAT-;map!;M2A;2| ((|f| |Mapping| S S) (|t| A) ($ A))
        (SEQ
         (COND ((SPADCALL |t| (QREFELT $ 9)) |t|)
               ('T
                (SEQ
                 (SPADCALL |t| '|value|
                           (SPADCALL (SPADCALL |t| '|value| (QREFELT $ 18))
                                     |f|)
                           (QREFELT $ 19))
                 (SPADCALL |f| (SPADCALL |t| (QREFELT $ 11)) (QREFELT $ 21))
                 (SPADCALL |f| (SPADCALL |t| (QREFELT $ 14)) (QREFELT $ 21))
                 (EXIT |t|)))))) 

(SDEFUN |BTCAT-;#;ANni;3| ((|t| A) ($ |NonNegativeInteger|))
        (|BTCAT-;treeCount| |t| 0 $)) 

(SDEFUN |BTCAT-;treeCount|
        ((|t| A) (|k| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SEQ
         (COND ((SPADCALL |t| (QREFELT $ 9)) |k|)
               ('T
                (SEQ (LETT |k| (+ |k| 1) . #1=(|BTCAT-;treeCount|))
                     (COND
                      ((EQL |k| 5)
                       (COND
                        ((SPADCALL |t| (QREFELT $ 25))
                         (EXIT (|error| "cyclic binary tree"))))))
                     (LETT |k|
                           (|BTCAT-;treeCount| (SPADCALL |t| (QREFELT $ 11))
                            |k| $)
                           . #1#)
                     (EXIT
                      (|BTCAT-;treeCount| (SPADCALL |t| (QREFELT $ 14)) |k|
                       $))))))) 

(DECLAIM (NOTINLINE |BinaryTreeCategory&;|)) 

(DEFUN |BinaryTreeCategory&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|BinaryTreeCategory&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|BinaryTreeCategory&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 26) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#1| '(|shallowlyMutable|))
            (QSETREFV $ 22 (CONS (|dispatchFunction| |BTCAT-;map!;M2A;2|) $))))
          (COND
           ((|HasCategory| |#1| '(|finiteAggregate|))
            (PROGN
             (QSETREFV $ 24 (CONS (|dispatchFunction| |BTCAT-;#;ANni;3|) $)))))
          $))) 

(MAKEPROP '|BinaryTreeCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . |empty?|) (5 . |empty|) (9 . |left|) (14 . |copy|)
              (19 . |value|) (24 . |right|) (29 . |node|) |BTCAT-;copy;2A;1|
              '"value" (36 . |elt|) (42 . |setelt!|) (|Mapping| 7 7)
              (49 . |map!|) (55 . |map!|) (|NonNegativeInteger|) (61 . |#|)
              (66 . |cyclic?|))
           '#(|map!| 71 |copy| 77 |#| 82) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 25
                                                 '(1 6 8 0 9 0 6 0 10 1 6 0 0
                                                   11 1 6 0 0 12 1 6 7 0 13 1 6
                                                   0 0 14 3 6 0 0 7 0 15 2 6 7
                                                   0 17 18 3 6 7 0 17 7 19 2 6
                                                   0 20 0 21 2 0 0 20 0 22 1 0
                                                   23 0 24 1 6 8 0 25 2 0 0 20
                                                   0 22 1 0 0 0 16 1 0 23 0
                                                   24)))))
           '|lookupComplete|)) 
