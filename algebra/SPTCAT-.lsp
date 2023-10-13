
(/VERSIONCHECK 2) 

(DEFUN |SPTCAT-;colinearity;2SDf;1| (|x| |y| $)
  (|div_DF| (|expt_DF_I| (SPADCALL |x| |y| (QREFELT $ 8)) 2)
            (|mul_DF| (SPADCALL |x| |x| (QREFELT $ 8))
                      (SPADCALL |y| |y| (QREFELT $ 8))))) 

(DEFUN |SPTCAT-;sipnt;2IS;2| (|a| |b| $)
  (SPADCALL (FLOAT |a| MOST-POSITIVE-DOUBLE-FLOAT)
            (FLOAT |b| MOST-POSITIVE-DOUBLE-FLOAT) (QREFELT $ 10))) 

(DEFUN |SPTCAT-;sipnt;3IS;3| (|a| |b| |c| $)
  (SPADCALL (FLOAT |a| MOST-POSITIVE-DOUBLE-FLOAT)
            (FLOAT |b| MOST-POSITIVE-DOUBLE-FLOAT)
            (FLOAT |c| MOST-POSITIVE-DOUBLE-FLOAT) (QREFELT $ 13))) 

(DEFUN |SPTCAT-;sivec;2IS;4| (|a| |b| $)
  (SPADCALL (FLOAT |a| MOST-POSITIVE-DOUBLE-FLOAT)
            (FLOAT |b| MOST-POSITIVE-DOUBLE-FLOAT) (QREFELT $ 15))) 

(DEFUN |SPTCAT-;sivec;3IS;5| (|a| |b| |c| $)
  (SPADCALL (FLOAT |a| MOST-POSITIVE-DOUBLE-FLOAT)
            (FLOAT |b| MOST-POSITIVE-DOUBLE-FLOAT)
            (FLOAT |c| MOST-POSITIVE-DOUBLE-FLOAT) (QREFELT $ 17))) 

(DEFUN |SPTCAT-;distance;2SDf;6| (|p1| |p2| $)
  (SPADCALL (SPADCALL |p1| |p2| (QREFELT $ 19)) (QREFELT $ 20))) 

(DEFUN |SPointCategory&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SPointCategory&|))
      (LETT |dv$| (LIST '|SPointCategory&| DV$1) . #1#)
      (LETT $ (GETREFV 22) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|SPointCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|DoubleFloat|)
              (0 . |parallel|) |SPTCAT-;colinearity;2SDf;1| (6 . |spnt|)
              (|Integer|) |SPTCAT-;sipnt;2IS;2| (12 . |spnt|)
              |SPTCAT-;sipnt;3IS;3| (19 . |svec|) |SPTCAT-;sivec;2IS;4|
              (25 . |svec|) |SPTCAT-;sivec;3IS;5| (32 . |distanceSquared|)
              (38 . |sqrt|) |SPTCAT-;distance;2SDf;6|)
           '#(|sivec| 43 |sipnt| 56 |distance| 69 |colinearity| 75) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 21
                                                 '(2 6 7 0 0 8 2 6 0 7 7 10 3 6
                                                   0 7 7 7 13 2 6 0 7 7 15 3 6
                                                   0 7 7 7 17 2 6 7 0 0 19 1 7
                                                   0 0 20 3 0 0 11 11 11 18 2 0
                                                   0 11 11 16 2 0 0 11 11 12 3
                                                   0 0 11 11 11 14 2 0 7 0 0 21
                                                   2 0 7 0 0 9)))))
           '|lookupComplete|)) 
