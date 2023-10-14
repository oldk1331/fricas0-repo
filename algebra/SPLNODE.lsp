
(PUT '|SPLNODE;rep| '|SPADreplace| '(XLAM (|n|) |n|)) 

(DEFUN |SPLNODE;rep| (|n| $) |n|) 

(PUT '|SPLNODE;per| '|SPADreplace| '(XLAM (|r|) |r|)) 

(DEFUN |SPLNODE;per| (|r| $) |r|) 

(DEFUN |SPLNODE;empty;$;3| ($)
  (|SPLNODE;per|
   (VECTOR (SPADCALL (QREFELT $ 8)) (SPADCALL (QREFELT $ 9)) 'NIL) $)) 

(DEFUN |SPLNODE;empty?;$B;4| (|n| $)
  (COND
   ((SPADCALL (QVELT (|SPLNODE;rep| |n| $) 0) (QREFELT $ 12))
    (SPADCALL (QVELT (|SPLNODE;rep| |n| $) 1) (QREFELT $ 13)))
   ('T 'NIL))) 

(DEFUN |SPLNODE;value;$V;5| (|n| $) (QVELT (|SPLNODE;rep| |n| $) 0)) 

(DEFUN |SPLNODE;condition;$C;6| (|n| $) (QVELT (|SPLNODE;rep| |n| $) 1)) 

(DEFUN |SPLNODE;status;$B;7| (|n| $) (QVELT (|SPLNODE;rep| |n| $) 2)) 

(DEFUN |SPLNODE;construct;VCB$;8| (|v| |t| |b| $)
  (|SPLNODE;per| (VECTOR |v| |t| |b|) $)) 

(DEFUN |SPLNODE;construct;VC$;9| (|v| |t| $)
  (SPADCALL |v| |t| 'NIL (QREFELT $ 18))) 

(DEFUN |SPLNODE;construct;R$;10| (|vt| $)
  (SPADCALL (QCAR |vt|) (QCDR |vt|) (QREFELT $ 19))) 

(DEFUN |SPLNODE;construct;LL;11| (|lvt| $)
  (PROG (#1=#:G129 |vt| #2=#:G128)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|SPLNODE;construct;LL;11|))
       (SEQ (LETT |vt| NIL . #3#) (LETT #1# |lvt| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |vt| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT (LETT #2# (CONS (SPADCALL |vt| (QREFELT $ 21)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |SPLNODE;construct;VLL;12| (|v| |lt| $)
  (PROG (#1=#:G133 |t| #2=#:G132)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|SPLNODE;construct;VLL;12|))
       (SEQ (LETT |t| NIL . #3#) (LETT #1# |lt| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL |v| |t| (QREFELT $ 19)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |SPLNODE;copy;2$;13| (|n| $)
  (|SPLNODE;per| (MOVEVEC (MAKE-VEC 3) (|SPLNODE;rep| |n| $)) $)) 

(DEFUN |SPLNODE;setValue!;$V$;14| (|n| |v| $)
  (SEQ (QSETVELT (|SPLNODE;rep| |n| $) 0 |v|) (EXIT |n|))) 

(DEFUN |SPLNODE;setCondition!;$C$;15| (|n| |t| $)
  (SEQ (QSETVELT (|SPLNODE;rep| |n| $) 1 |t|) (EXIT |n|))) 

(DEFUN |SPLNODE;setStatus!;$B$;16| (|n| |b| $)
  (SEQ (QSETVELT (|SPLNODE;rep| |n| $) 2 |b|) (EXIT |n|))) 

(DEFUN |SPLNODE;setEmpty!;2$;17| (|n| $)
  (SEQ (QSETVELT (|SPLNODE;rep| |n| $) 0 (SPADCALL (QREFELT $ 8)))
       (QSETVELT (|SPLNODE;rep| |n| $) 1 (SPADCALL (QREFELT $ 9))) (EXIT |n|))) 

(DEFUN |SPLNODE;infLex?;2$MMB;18| (|n1| |n2| |o1| |o2| $)
  (COND
   ((SPADCALL (QVELT (|SPLNODE;rep| |n1| $) 0) (QVELT (|SPLNODE;rep| |n2| $) 0)
              |o1|)
    'T)
   ((SPADCALL (QVELT (|SPLNODE;rep| |n1| $) 0) (QVELT (|SPLNODE;rep| |n2| $) 0)
              (QREFELT $ 32))
    (SPADCALL (QVELT (|SPLNODE;rep| |n1| $) 1) (QVELT (|SPLNODE;rep| |n2| $) 1)
              |o2|))
   ('T 'NIL))) 

(DEFUN |SPLNODE;subNode?;2$MB;19| (|n1| |n2| |o2| $)
  (COND
   ((SPADCALL (QVELT (|SPLNODE;rep| |n1| $) 0) (QVELT (|SPLNODE;rep| |n2| $) 0)
              (QREFELT $ 32))
    (SPADCALL (QVELT (|SPLNODE;rep| |n1| $) 1) (QVELT (|SPLNODE;rep| |n2| $) 1)
              |o2|))
   ('T 'NIL))) 

(DEFUN |SPLNODE;=;2$B;20| (|n1| |n2| $)
  (COND
   ((SPADCALL (QVELT (|SPLNODE;rep| |n1| $) 0) (QVELT (|SPLNODE;rep| |n2| $) 0)
              (QREFELT $ 37))
    'NIL)
   ('T
    (SPADCALL (QVELT (|SPLNODE;rep| |n1| $) 1) (QVELT (|SPLNODE;rep| |n2| $) 1)
              (QREFELT $ 38))))) 

(DEFUN |SPLNODE;~=;2$B;21| (|n1| |n2| $)
  (COND
   ((SPADCALL (QVELT (|SPLNODE;rep| |n1| $) 0) (QVELT (|SPLNODE;rep| |n2| $) 0)
              (QREFELT $ 32))
    'NIL)
   ('T
    (SPADCALL (QVELT (|SPLNODE;rep| |n1| $) 1) (QVELT (|SPLNODE;rep| |n2| $) 1)
              (QREFELT $ 40))))) 

(DEFUN |SPLNODE;coerce;$Of;22| (|n| $)
  (PROG (|l| |o3| |o2| |l2| |o1| |l1|)
    (RETURN
     (SEQ
      (LETT |l1|
            (LIST (SPADCALL "value == " (QREFELT $ 44))
                  (SPADCALL (QVELT (|SPLNODE;rep| |n| $) 0) (QREFELT $ 45)))
            . #1=(|SPLNODE;coerce;$Of;22|))
      (LETT |o1| (SPADCALL |l1| (QREFELT $ 46)) . #1#)
      (LETT |l2|
            (LIST (SPADCALL " tower == " (QREFELT $ 44))
                  (SPADCALL (QVELT (|SPLNODE;rep| |n| $) 1) (QREFELT $ 47)))
            . #1#)
      (LETT |o2| (SPADCALL |l2| (QREFELT $ 46)) . #1#)
      (COND
       ((QVELT (|SPLNODE;rep| |n| $) 2)
        (LETT |o3| (SPADCALL " closed == true" (QREFELT $ 44)) . #1#))
       ('T (LETT |o3| (SPADCALL " closed == false" (QREFELT $ 44)) . #1#)))
      (LETT |l| (LIST |o1| |o2| |o3|) . #1#)
      (EXIT (SPADCALL (SPADCALL |l| (QREFELT $ 48)) (QREFELT $ 49))))))) 

(DECLAIM (NOTINLINE |SplittingNode;|)) 

(DEFUN |SplittingNode| (&REST #1=#:G157)
  (PROG ()
    (RETURN
     (PROG (#2=#:G158)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|SplittingNode|)
                                           '|domainEqualList|)
                . #3=(|SplittingNode|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |SplittingNode;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|SplittingNode|))))))))))) 

(DEFUN |SplittingNode;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SplittingNode|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|SplittingNode| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 53) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SplittingNode| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|SplittingNode| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |empty|) (4 . |empty|) |SPLNODE;empty;$;3| (|Boolean|)
              (8 . |empty?|) (13 . |empty?|) |SPLNODE;empty?;$B;4|
              |SPLNODE;value;$V;5| |SPLNODE;condition;$C;6|
              |SPLNODE;status;$B;7| |SPLNODE;construct;VCB$;8|
              |SPLNODE;construct;VC$;9|
              (|Record| (|:| |val| 6) (|:| |tower| 7))
              |SPLNODE;construct;R$;10| (|List| $) (|List| 20)
              |SPLNODE;construct;LL;11| (|List| 7) |SPLNODE;construct;VLL;12|
              |SPLNODE;copy;2$;13| |SPLNODE;setValue!;$V$;14|
              |SPLNODE;setCondition!;$C$;15| |SPLNODE;setStatus!;$B$;16|
              |SPLNODE;setEmpty!;2$;17| (18 . =) (|Mapping| 11 6 6)
              (|Mapping| 11 7 7) |SPLNODE;infLex?;2$MMB;18|
              |SPLNODE;subNode?;2$MB;19| (24 . ~=) (30 . =) |SPLNODE;=;2$B;20|
              (36 . ~=) |SPLNODE;~=;2$B;21| (|String|) (|OutputForm|)
              (42 . |message|) (47 . |coerce|) (52 . |blankSeparate|)
              (57 . |coerce|) (62 . |commaSeparate|) (67 . |bracket|)
              |SPLNODE;coerce;$Of;22| (|SingleInteger|) (|HashState|))
           '#(~= 72 |value| 78 |subNode?| 83 |status| 90 |setValue!| 95
              |setStatus!| 101 |setEmpty!| 107 |setCondition!| 112 |latex| 118
              |infLex?| 123 |hashUpdate!| 131 |hash| 137 |empty?| 142 |empty|
              147 |copy| 151 |construct| 156 |condition| 185 |coerce| 190 =
              195)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 43))
                        (|makeByteWordVec2| 52
                                            '(0 6 0 8 0 7 0 9 1 6 11 0 12 1 7
                                              11 0 13 2 6 11 0 0 32 2 6 11 0 0
                                              37 2 7 11 0 0 38 2 7 11 0 0 40 1
                                              43 0 42 44 1 6 43 0 45 1 43 0 22
                                              46 1 7 43 0 47 1 43 0 22 48 1 43
                                              0 0 49 2 0 11 0 0 41 1 0 6 0 15 3
                                              0 11 0 0 34 36 1 0 11 0 17 2 0 0
                                              0 6 28 2 0 0 0 11 30 1 0 0 0 31 2
                                              0 0 0 7 29 1 0 42 0 1 4 0 11 0 0
                                              33 34 35 2 0 52 52 0 1 1 0 51 0 1
                                              1 0 11 0 14 0 0 0 10 1 0 0 0 27 2
                                              0 22 6 25 26 1 0 22 23 24 2 0 0 6
                                              7 19 1 0 0 20 21 3 0 0 6 7 11 18
                                              1 0 7 0 16 1 0 43 0 50 2 0 11 0 0
                                              39)))))
           '|lookupComplete|)) 
