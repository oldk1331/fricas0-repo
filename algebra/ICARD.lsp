
(PUT '|ICARD;<;2$B;1| '|SPADreplace| '(XLAM (|x| |y|) (CGREATERP |y| |x|))) 

(DEFUN |ICARD;<;2$B;1| (|x| |y| $) (CGREATERP |y| |x|)) 

(PUT '|ICARD;=;2$B;2| '|SPADreplace| 'EQUAL) 

(DEFUN |ICARD;=;2$B;2| (|x| |y| $) (EQUAL |x| |y|)) 

(DEFUN |ICARD;display;$V;3| (|x| $)
  (PROG (|type| |name|)
    (RETURN
     (SEQ (LETT |name| (|dbName| |x|) . #1=(|ICARD;display;$V;3|))
          (LETT |type| (|dbPart| |x| 4 1) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL |name| (SPADCALL " : " |type| (QREFELT $ 10))
                      (QREFELT $ 10))
            (QREFELT $ 13))))))) 

(DEFUN |ICARD;fullDisplay;$V;4| (|x| $)
  (PROG (|secondPart| |firstPart| |exposedPart| |exposed?| |ifPart| |condition|
         |fromPart| |origin| |type| |name|)
    (RETURN
     (SEQ (LETT |name| (|dbName| |x|) . #1=(|ICARD;fullDisplay;$V;4|))
          (LETT |type| (|dbPart| |x| 4 1) . #1#)
          (LETT |origin|
                (SPADCALL (|alqlGetOrigin| |x|) (|alqlGetParams| |x|)
                          (QREFELT $ 10))
                . #1#)
          (LETT |fromPart| (SPADCALL " from " |origin| (QREFELT $ 10)) . #1#)
          (LETT |condition| (|dbPart| |x| 6 1) . #1#)
          (LETT |ifPart|
                (COND ((EQUAL |condition| "") (SPADCALL (QREFELT $ 15)))
                      (#2='T
                       (SPADCALL " if " (SPADCALL |condition| (QREFELT $ 17))
                                 (QREFELT $ 10))))
                . #1#)
          (LETT |exposed?| (SUBSTRING (|dbPart| |x| 3 1) 0 1) . #1#)
          (LETT |exposedPart|
                (COND ((EQUAL |exposed?| "n") " (unexposed)")
                      (#2# (SPADCALL (QREFELT $ 15))))
                . #1#)
          (LETT |firstPart|
                (SPADCALL |name| (SPADCALL " : " |type| (QREFELT $ 10))
                          (QREFELT $ 10))
                . #1#)
          (LETT |secondPart|
                (SPADCALL |fromPart|
                          (SPADCALL |ifPart| |exposedPart| (QREFELT $ 10))
                          (QREFELT $ 10))
                . #1#)
          (EXIT
           (SPADCALL (SPADCALL |firstPart| |secondPart| (QREFELT $ 10))
                     (QREFELT $ 13))))))) 

(PUT '|ICARD;coerce;S$;5| '|SPADreplace| '(XLAM (|s|) |s|)) 

(DEFUN |ICARD;coerce;S$;5| (|s| $) |s|) 

(DEFUN |ICARD;coerce;$Of;6| (|x| $) (SPADCALL |x| (QREFELT $ 17))) 

(DEFUN |ICARD;elt;$SS;7| (|x| |sel| $)
  (PROG (|s|)
    (RETURN
     (SEQ (LETT |s| (PNAME |sel|) |ICARD;elt;$SS;7|)
          (EXIT
           (COND ((EQUAL |s| "name") (|dbName| |x|))
                 ((EQUAL |s| "nargs") (|dbPart| |x| 2 1))
                 ((EQUAL |s| "exposed") (SUBSTRING (|dbPart| |x| 3 1) 0 1))
                 ((EQUAL |s| "type") (|dbPart| |x| 4 1))
                 ((EQUAL |s| "abbreviation") (|dbPart| |x| 5 1))
                 ((EQUAL |s| "kind") (|alqlGetKindString| |x|))
                 ((EQUAL |s| "origin") (|alqlGetOrigin| |x|))
                 ((EQUAL |s| "params") (|alqlGetParams| |x|))
                 ((EQUAL |s| "condition") (|dbPart| |x| 6 1))
                 ((EQUAL |s| "doc") (|dbComments| |x|))
                 ('T (|error| "unknown selector")))))))) 

(DECLAIM (NOTINLINE |IndexCard;|)) 

(DEFUN |IndexCard| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G114)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|IndexCard|) . #2=(|IndexCard|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|IndexCard|
                         (LIST (CONS NIL (CONS 1 (|IndexCard;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|IndexCard|))))))))))) 

(DEFUN |IndexCard;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|IndexCard|) . #1=(|IndexCard|))
      (LETT $ (GETREFV 25) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|IndexCard| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|IndexCard| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Boolean|) |ICARD;<;2$B;1|
              |ICARD;=;2$B;2| (|OutputForm|) (0 . |hconcat|) (|Void|)
              (|OutputPackage|) (6 . |output|) |ICARD;display;$V;3|
              (11 . |empty|) (|String|) (15 . |coerce|)
              |ICARD;fullDisplay;$V;4| |ICARD;coerce;S$;5| |ICARD;coerce;$Of;6|
              (|Symbol|) |ICARD;elt;$SS;7| (|SingleInteger|) (|HashState|))
           '#(~= 20 |smaller?| 26 |min| 32 |max| 38 |latex| 44 |hashUpdate!| 49
              |hash| 55 |fullDisplay| 60 |elt| 65 |display| 71 |coerce| 76 >=
              86 > 92 = 98 <= 104 < 110)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL |SetCategory&| |BasicType&|
                     |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|) (|SetCategory|)
                      (|BasicType|) (|PartialOrder|) (|CoercibleTo| 9))
                   (|makeByteWordVec2| 24
                                       '(2 9 0 0 0 10 1 12 11 9 13 0 9 0 15 1
                                         16 9 0 17 2 0 6 0 0 1 2 0 6 0 0 1 2 0
                                         0 0 0 1 2 0 0 0 0 1 1 0 16 0 1 2 0 24
                                         24 0 1 1 0 23 0 1 1 0 11 0 18 2 0 16 0
                                         21 22 1 0 11 0 14 1 0 0 16 19 1 0 9 0
                                         20 2 0 6 0 0 1 2 0 6 0 0 1 2 0 6 0 0 8
                                         2 0 6 0 0 1 2 0 6 0 0 7)))))
           '|lookupComplete|)) 

(MAKEPROP '|IndexCard| 'NILADIC T) 
