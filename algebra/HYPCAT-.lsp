
(DEFUN |HYPCAT-;csch;2S;1| (|x| $)
  (PROG (|a|)
    (RETURN
     (SEQ
      (LETT |a| (SPADCALL (SPADCALL |x| (QREFELT $ 7)) (QREFELT $ 9))
            |HYPCAT-;csch;2S;1|)
      (EXIT
       (COND ((QEQCAR |a| 1) (|error| "csch: no reciprocal"))
             ('T (QCDR |a|)))))))) 

(DEFUN |HYPCAT-;sech;2S;2| (|x| $)
  (PROG (|a|)
    (RETURN
     (SEQ
      (LETT |a| (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 9))
            |HYPCAT-;sech;2S;2|)
      (EXIT
       (COND ((QEQCAR |a| 1) (|error| "sech: no reciprocal"))
             ('T (QCDR |a|)))))))) 

(DEFUN |HYPCAT-;tanh;2S;3| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 7)) (SPADCALL |x| (QREFELT $ 13))
            (QREFELT $ 14))) 

(DEFUN |HYPCAT-;coth;2S;4| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (SPADCALL |x| (QREFELT $ 16))
            (QREFELT $ 14))) 

(DEFUN |HYPCAT-;cosh;2S;5| (|x| $)
  (PROG (#1=#:G128 |e|)
    (RETURN
     (SEQ (LETT |e| (SPADCALL |x| (QREFELT $ 18)) . #2=(|HYPCAT-;cosh;2S;5|))
          (EXIT
           (SPADCALL
            (SPADCALL |e|
                      (PROG2 (LETT #1# (SPADCALL |e| (QREFELT $ 9)) . #2#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                      (QREFELT $ 19))
            (PROG2
                (LETT #1# (SPADCALL (SPADCALL 2 (QREFELT $ 21)) (QREFELT $ 9))
                      . #2#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
            (QREFELT $ 14))))))) 

(DEFUN |HYPCAT-;sinh;2S;6| (|x| $)
  (PROG (#1=#:G133 |e|)
    (RETURN
     (SEQ (LETT |e| (SPADCALL |x| (QREFELT $ 18)) . #2=(|HYPCAT-;sinh;2S;6|))
          (EXIT
           (SPADCALL
            (SPADCALL |e|
                      (PROG2 (LETT #1# (SPADCALL |e| (QREFELT $ 9)) . #2#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                      (QREFELT $ 23))
            (PROG2
                (LETT #1# (SPADCALL (SPADCALL 2 (QREFELT $ 21)) (QREFELT $ 9))
                      . #2#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
            (QREFELT $ 14))))))) 

(DECLAIM (NOTINLINE |HyperbolicFunctionCategory&;|)) 

(DEFUN |HyperbolicFunctionCategory&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|HyperbolicFunctionCategory&|))
      (LETT |dv$| (LIST '|HyperbolicFunctionCategory&| DV$1) . #1#)
      (LETT $ (GETREFV 25) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| '(|Ring|))
        (PROGN
         (QSETREFV $ 10 (CONS (|dispatchFunction| |HYPCAT-;csch;2S;1|) $))
         (QSETREFV $ 12 (CONS (|dispatchFunction| |HYPCAT-;sech;2S;2|) $))
         (QSETREFV $ 15 (CONS (|dispatchFunction| |HYPCAT-;tanh;2S;3|) $))
         (QSETREFV $ 17 (CONS (|dispatchFunction| |HYPCAT-;coth;2S;4|) $))
         (COND
          ((|HasCategory| |#1| '(|ElementaryFunctionCategory|))
           (PROGN
            (QSETREFV $ 22 (CONS (|dispatchFunction| |HYPCAT-;cosh;2S;5|) $))
            (QSETREFV $ 24
                      (CONS (|dispatchFunction| |HYPCAT-;sinh;2S;6|) $))))))))
      $)))) 

(MAKEPROP '|HyperbolicFunctionCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |sinh|)
              (|Union| $ '"failed") (5 . |recip|) (10 . |csch|) (15 . |cosh|)
              (20 . |sech|) (25 . |sech|) (30 . *) (36 . |tanh|) (41 . |csch|)
              (46 . |coth|) (51 . |exp|) (56 . +) (|Integer|) (62 . |coerce|)
              (67 . |cosh|) (72 . -) (78 . |sinh|))
           '#(|tanh| 83 |sinh| 88 |sech| 93 |csch| 98 |coth| 103 |cosh| 108)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 24
                                                 '(1 6 0 0 7 1 6 8 0 9 1 0 0 0
                                                   10 1 6 0 0 11 1 0 0 0 12 1 6
                                                   0 0 13 2 6 0 0 0 14 1 0 0 0
                                                   15 1 6 0 0 16 1 0 0 0 17 1 6
                                                   0 0 18 2 6 0 0 0 19 1 6 0 20
                                                   21 1 0 0 0 22 2 6 0 0 0 23 1
                                                   0 0 0 24 1 0 0 0 15 1 0 0 0
                                                   24 1 0 0 0 12 1 0 0 0 10 1 0
                                                   0 0 17 1 0 0 0 22)))))
           '|lookupComplete|)) 
