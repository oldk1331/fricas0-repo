
(DEFUN |ULSCCAT-;zero?;SB;1| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 9)) (QREFELT $ 11))) 

(DEFUN |ULSCCAT-;retract;SUTS;2| (|x| $) (SPADCALL |x| (QREFELT $ 13))) 

(DEFUN |ULSCCAT-;retractIfCan;SU;3| (|x| $) (SPADCALL |x| (QREFELT $ 16))) 

(DECLAIM (NOTINLINE |UnivariateLaurentSeriesConstructorCategory&;|)) 

(DEFUN |UnivariateLaurentSeriesConstructorCategory&| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|UnivariateLaurentSeriesConstructorCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$|
            (LIST '|UnivariateLaurentSeriesConstructorCategory&| DV$1 DV$2
                  DV$3)
            . #1#)
      (LETT $ (GETREFV 24) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2| '(|Field|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|UnivariateLaurentSeriesConstructorCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |taylorRep|) (|Boolean|) (5 . |zero?|)
              |ULSCCAT-;zero?;SB;1| (10 . |taylor|) |ULSCCAT-;retract;SUTS;2|
              (|Union| 8 '"failed") (15 . |taylorIfCan|)
              |ULSCCAT-;retractIfCan;SU;3| (|Union| 20 '#1="failed")
              (|Union| 22 '#1#) (|Symbol|) (|Union| 23 '#1#) (|Fraction| 23)
              (|Integer|))
           '#(|zero?| 20 |retractIfCan| 25 |retract| 30) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 17
                                                 '(1 6 8 0 9 1 8 10 0 11 1 6 8
                                                   0 13 1 6 15 0 16 1 0 10 0 12
                                                   1 0 15 0 17 1 0 8 0 14)))))
           '|lookupComplete|)) 
