
(/VERSIONCHECK 2) 

(DEFUN |DVARCAT-;coerce;SA;1| (|s| $) (SPADCALL |s| 0 (QREFELT $ 9))) 

(DEFUN |DVARCAT-;differentiate;2A;2| (|v| $) (SPADCALL |v| 1 (QREFELT $ 11))) 

(DEFUN |DVARCAT-;differentiate;ANniA;3| (|v| |n| $)
  (SPADCALL (SPADCALL |v| (QREFELT $ 13)) (+ |n| (SPADCALL |v| (QREFELT $ 14)))
            (QREFELT $ 9))) 

(DEFUN |DVARCAT-;retractIfCan;AU;4| (|v| $)
  (COND
   ((ZEROP (SPADCALL |v| (QREFELT $ 14)))
    (CONS 0 (SPADCALL |v| (QREFELT $ 13))))
   ('T (CONS 1 "failed")))) 

(DEFUN |DVARCAT-;=;2AB;5| (|v| |u| $)
  (COND
   ((SPADCALL (SPADCALL |v| (QREFELT $ 13)) (SPADCALL |u| (QREFELT $ 13))
              (QREFELT $ 19))
    (EQL (SPADCALL |v| (QREFELT $ 14)) (SPADCALL |u| (QREFELT $ 14))))
   ('T 'NIL))) 

(DEFUN |DVARCAT-;coerce;AOf;6| (|v| $)
  (PROG (|nn| |a|)
    (RETURN
     (SEQ
      (LETT |a| (SPADCALL (SPADCALL |v| (QREFELT $ 13)) (QREFELT $ 22))
            . #1=(|DVARCAT-;coerce;AOf;6|))
      (EXIT
       (COND ((ZEROP (LETT |nn| (SPADCALL |v| (QREFELT $ 14)) . #1#)) |a|)
             ('T
              (SPADCALL |a| (SPADCALL |nn| (QREFELT $ 24))
                        (QREFELT $ 25))))))))) 

(DEFUN |DVARCAT-;retract;AS;7| (|v| $)
  (COND ((ZEROP (SPADCALL |v| (QREFELT $ 14))) (SPADCALL |v| (QREFELT $ 13)))
        ('T (|error| "Not retractable")))) 

(DEFUN |DVARCAT-;<;2AB;8| (|v| |u| $)
  (COND
   ((EQL (SPADCALL |v| (QREFELT $ 14)) (SPADCALL |u| (QREFELT $ 14)))
    (SPADCALL (SPADCALL |v| (QREFELT $ 13)) (SPADCALL |u| (QREFELT $ 13))
              (QREFELT $ 28)))
   ('T (< (SPADCALL |v| (QREFELT $ 14)) (SPADCALL |u| (QREFELT $ 14)))))) 

(DEFUN |DVARCAT-;weight;ANni;9| (|v| $) (SPADCALL |v| (QREFELT $ 14))) 

(DEFUN |DifferentialVariableCategory&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|DifferentialVariableCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|DifferentialVariableCategory&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 31) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|DifferentialVariableCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |makeVariable|)
              |DVARCAT-;coerce;SA;1| (6 . |differentiate|)
              |DVARCAT-;differentiate;2A;2| (12 . |variable|) (17 . |order|)
              |DVARCAT-;differentiate;ANniA;3| (|Union| 7 '"failed")
              |DVARCAT-;retractIfCan;AU;4| (|Boolean|) (22 . =)
              |DVARCAT-;=;2AB;5| (|OutputForm|) (28 . |coerce|) (|Integer|)
              (33 . |outputForm|) (38 . |sub|) |DVARCAT-;coerce;AOf;6|
              |DVARCAT-;retract;AS;7| (44 . <) |DVARCAT-;<;2AB;8|
              |DVARCAT-;weight;ANni;9|)
           '#(|weight| 50 |retractIfCan| 55 |retract| 60 |differentiate| 65
              |coerce| 76 = 86 < 92)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 30
                                                 '(2 6 0 7 8 9 2 6 0 0 8 11 1 6
                                                   7 0 13 1 6 8 0 14 2 7 18 0 0
                                                   19 1 7 21 0 22 1 21 0 23 24
                                                   2 21 0 0 0 25 2 7 18 0 0 28
                                                   1 0 8 0 30 1 0 16 0 17 1 0 7
                                                   0 27 1 0 0 0 12 2 0 0 0 8 15
                                                   1 0 0 7 10 1 0 21 0 26 2 0
                                                   18 0 0 20 2 0 18 0 0 29)))))
           '|lookupComplete|)) 
