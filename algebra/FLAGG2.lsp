
(/VERSIONCHECK 2) 

(DEFUN |FLAGG2;reduce;MA2R;1| (|fn| |l| |ident| $)
  (COND ((SPADCALL |l| (QREFELT $ 11)) |ident|)
        ('T
         (SPADCALL |fn| (SPADCALL |l| (QREFELT $ 12))
                   (SPADCALL (SPADCALL |l| (QREFELT $ 13)) |ident| |fn|)
                   (QREFELT $ 15))))) 

(DEFUN |FLAGG2;map;MAB;2| (|f| |l| $)
  (PROG (#1=#:G137 |s| #2=#:G136)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|FLAGG2;map;MAB;2|))
        (SEQ (LETT |s| NIL . #3#)
             (LETT #1# (SPADCALL |l| (QREFELT $ 17)) . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ (EXIT (LETT #2# (CONS (SPADCALL |s| |f|) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 19)))))) 

(DEFUN |FLAGG2;scan;MARB;3| (|fn| |l| |ident| $)
  (PROG (|val|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |l| (QREFELT $ 11)) (SPADCALL (QREFELT $ 22)))
            ('T
             (SEQ
              (LETT |val| (SPADCALL (SPADCALL |l| (QREFELT $ 13)) |ident| |fn|)
                    |FLAGG2;scan;MARB;3|)
              (EXIT
               (SPADCALL |val|
                         (SPADCALL |fn| (SPADCALL |l| (QREFELT $ 12)) |val|
                                   (QREFELT $ 23))
                         (QREFELT $ 24)))))))))) 

(DEFUN |FLAGG2;map;MAB;4| (|f| |l| $)
  (PROG (|i| #1=#:G147 |a| |w|)
    (RETURN
     (SEQ
      (LETT |i|
            (SPADCALL
             (LETT |w|
                   (SPADCALL (SPADCALL |l| (QREFELT $ 26)) NIL (QREFELT $ 27))
                   . #2=(|FLAGG2;map;MAB;4|))
             (QREFELT $ 29))
            . #2#)
      (SEQ (LETT |a| NIL . #2#) (LETT #1# (SPADCALL |l| (QREFELT $ 17)) . #2#)
           G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ (SPADCALL |w| |i| (SPADCALL |a| |f|) (QREFELT $ 30))
                (EXIT (LETT |i| (+ |i| 1) . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |w|))))) 

(DEFUN |FLAGG2;scan;MARB;5| (|fn| |l| |ident| $)
  (PROG (|i| |vl| #1=#:G152 |a| |w|)
    (RETURN
     (SEQ
      (LETT |i|
            (SPADCALL
             (LETT |w|
                   (SPADCALL (SPADCALL |l| (QREFELT $ 26)) NIL (QREFELT $ 27))
                   . #2=(|FLAGG2;scan;MARB;5|))
             (QREFELT $ 29))
            . #2#)
      (LETT |vl| |ident| . #2#)
      (SEQ (LETT |a| NIL . #2#) (LETT #1# (SPADCALL |l| (QREFELT $ 17)) . #2#)
           G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (LETT |vl|
                  (SPADCALL |w| |i| (SPADCALL |a| |vl| |fn|) (QREFELT $ 30))
                  . #2#)
            (EXIT (LETT |i| (+ |i| 1) . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |w|))))) 

(DEFUN |FLAGG2;map;MAB;6| (|f| |l| $)
  (PROG (#1=#:G156 |s| #2=#:G155)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|FLAGG2;map;MAB;6|))
        (SEQ (LETT |s| NIL . #3#)
             (LETT #1# (SPADCALL |l| (QREFELT $ 17)) . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ (EXIT (LETT #2# (CONS (SPADCALL |s| |f|) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 19)))))) 

(DEFUN |FLAGG2;scan;MARB;7| (|fn| |l| |ident| $)
  (PROG (|val|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |l| (QREFELT $ 11)) (SPADCALL (QREFELT $ 22)))
            ('T
             (SEQ
              (LETT |val| (SPADCALL (SPADCALL |l| (QREFELT $ 13)) |ident| |fn|)
                    |FLAGG2;scan;MARB;7|)
              (EXIT
               (SPADCALL |val|
                         (SPADCALL |fn| (SPADCALL |l| (QREFELT $ 12)) |val|
                                   (QREFELT $ 23))
                         (QREFELT $ 24)))))))))) 

(DEFUN |FLAGG2;reduce;MA2R;8| (|fn| |v| |ident| $)
  (PROG (|val| #1=#:G165 |i|)
    (RETURN
     (SEQ (LETT |val| |ident| . #2=(|FLAGG2;reduce;MA2R;8|))
          (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 31)) . #2#)
               (LETT #1# (SPADCALL |v| (QREFELT $ 32)) . #2#) G190
               (COND ((> |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |val|
                       (SPADCALL (SPADCALL |v| |i| (QREFELT $ 33)) |val| |fn|)
                       . #2#)))
               (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |val|))))) 

(DEFUN |FLAGG2;map;MAB;9| (|f| |v| $)
  (PROG (#1=#:G169 |i| #2=#:G168)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|FLAGG2;map;MAB;9|))
        (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 31)) . #3#)
             (LETT #1# (SPADCALL |v| (QREFELT $ 32)) . #3#) G190
             (COND ((> |i| #1#) (GO G191)))
             (SEQ
              (EXIT
               (LETT #2#
                     (CONS (SPADCALL (SPADCALL |v| |i| (QREFELT $ 33)) |f|)
                           #2#)
                     . #3#)))
             (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 19)))))) 

(DEFUN |FLAGG2;scan;MARB;10| (|fn| |v| |ident| $)
  (PROG (|w| #1=#:G174 |i|)
    (RETURN
     (SEQ (LETT |w| (SPADCALL (QREFELT $ 22)) . #2=(|FLAGG2;scan;MARB;10|))
          (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 31)) . #2#)
               (LETT #1# (SPADCALL |v| (QREFELT $ 32)) . #2#) G190
               (COND ((> |i| #1#) (GO G191)))
               (SEQ
                (LETT |ident|
                      (SPADCALL (SPADCALL |v| |i| (QREFELT $ 33)) |ident| |fn|)
                      . #2#)
                (EXIT (LETT |w| (SPADCALL |ident| |w| (QREFELT $ 24)) . #2#)))
               (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |w| (QREFELT $ 34))))))) 

(DEFUN |FLAGG2;map;MAB;11| (|f| |v| $)
  (PROG (#1=#:G178 |i| |w|)
    (RETURN
     (SEQ
      (LETT |w| (SPADCALL (SPADCALL |v| (QREFELT $ 26)) NIL (QREFELT $ 27))
            . #2=(|FLAGG2;map;MAB;11|))
      (SEQ (LETT |i| (SPADCALL |w| (QREFELT $ 29)) . #2#)
           (LETT #1# (SPADCALL |w| (QREFELT $ 35)) . #2#) G190
           (COND ((> |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |w| |i| (SPADCALL (SPADCALL |v| |i| (QREFELT $ 33)) |f|)
                       (QREFELT $ 30))))
           (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |w|))))) 

(DEFUN |FLAGG2;scan;MARB;12| (|fn| |v| |ident| $)
  (PROG (|vl| #1=#:G182 |i| |w|)
    (RETURN
     (SEQ
      (LETT |w| (SPADCALL (SPADCALL |v| (QREFELT $ 26)) NIL (QREFELT $ 27))
            . #2=(|FLAGG2;scan;MARB;12|))
      (LETT |vl| |ident| . #2#)
      (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 31)) . #2#)
           (LETT #1# (SPADCALL |v| (QREFELT $ 32)) . #2#) G190
           (COND ((> |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (LETT |vl|
                   (SPADCALL |w| |i|
                             (SPADCALL (SPADCALL |v| |i| (QREFELT $ 33)) |vl|
                                       |fn|)
                             (QREFELT $ 30))
                   . #2#)))
           (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |w|))))) 

(DEFUN |FLAGG2;map;MAB;13| (|f| |v| $)
  (PROG (#1=#:G186 |i| #2=#:G185)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|FLAGG2;map;MAB;13|))
        (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 31)) . #3#)
             (LETT #1# (SPADCALL |v| (QREFELT $ 32)) . #3#) G190
             (COND ((> |i| #1#) (GO G191)))
             (SEQ
              (EXIT
               (LETT #2#
                     (CONS (SPADCALL (SPADCALL |v| |i| (QREFELT $ 33)) |f|)
                           #2#)
                     . #3#)))
             (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 19)))))) 

(DEFUN |FLAGG2;scan;MARB;14| (|fn| |v| |ident| $)
  (PROG (|w| #1=#:G191 |i|)
    (RETURN
     (SEQ (LETT |w| (SPADCALL (QREFELT $ 22)) . #2=(|FLAGG2;scan;MARB;14|))
          (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 31)) . #2#)
               (LETT #1# (SPADCALL |v| (QREFELT $ 32)) . #2#) G190
               (COND ((> |i| #1#) (GO G191)))
               (SEQ
                (LETT |ident|
                      (SPADCALL (SPADCALL |v| |i| (QREFELT $ 33)) |ident| |fn|)
                      . #2#)
                (EXIT (LETT |w| (SPADCALL |w| |ident| (QREFELT $ 36)) . #2#)))
               (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |w|))))) 

(DECLAIM (NOTINLINE |FiniteLinearAggregateFunctions2;|)) 

(DEFUN |FiniteLinearAggregateFunctions2| (&REST #1=#:G192)
  (PROG ()
    (RETURN
     (PROG (#2=#:G193)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|FiniteLinearAggregateFunctions2|)
                                           '|domainEqualList|)
                . #3=(|FiniteLinearAggregateFunctions2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |FiniteLinearAggregateFunctions2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|FiniteLinearAggregateFunctions2|))))))))))) 

(DEFUN |FiniteLinearAggregateFunctions2;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteLinearAggregateFunctions2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|FiniteLinearAggregateFunctions2| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 37) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FiniteLinearAggregateFunctions2|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#2| (LIST '|ListAggregate| (|devaluate| |#1|)))
        (PROGN
         (QSETREFV $ 15 (CONS (|dispatchFunction| |FLAGG2;reduce;MA2R;1|) $))
         (COND
          ((|HasCategory| |#4| (LIST '|ListAggregate| (|devaluate| |#3|)))
           (PROGN
            (QSETREFV $ 21 (CONS (|dispatchFunction| |FLAGG2;map;MAB;2|) $))
            (QSETREFV $ 23
                      (CONS (|dispatchFunction| |FLAGG2;scan;MARB;3|) $))))
          ((|HasCategory| |#4| '(|shallowlyMutable|))
           (PROGN
            (QSETREFV $ 21 (CONS (|dispatchFunction| |FLAGG2;map;MAB;4|) $))
            (QSETREFV $ 23
                      (CONS (|dispatchFunction| |FLAGG2;scan;MARB;5|) $))))
          ('T
           (PROGN
            (QSETREFV $ 21 (CONS (|dispatchFunction| |FLAGG2;map;MAB;6|) $))
            (QSETREFV $ 23
                      (CONS (|dispatchFunction| |FLAGG2;scan;MARB;7|) $)))))))
       ('T
        (PROGN
         (QSETREFV $ 15 (CONS (|dispatchFunction| |FLAGG2;reduce;MA2R;8|) $))
         (COND
          ((|HasCategory| |#4| (LIST '|ListAggregate| (|devaluate| |#3|)))
           (PROGN
            (QSETREFV $ 21 (CONS (|dispatchFunction| |FLAGG2;map;MAB;9|) $))
            (QSETREFV $ 23
                      (CONS (|dispatchFunction| |FLAGG2;scan;MARB;10|) $))))
          ((|HasCategory| |#4| '(|shallowlyMutable|))
           (PROGN
            (QSETREFV $ 21 (CONS (|dispatchFunction| |FLAGG2;map;MAB;11|) $))
            (QSETREFV $ 23
                      (CONS (|dispatchFunction| |FLAGG2;scan;MARB;12|) $))))
          ('T
           (PROGN
            (QSETREFV $ 21 (CONS (|dispatchFunction| |FLAGG2;map;MAB;13|) $))
            (QSETREFV $ 23
                      (CONS (|dispatchFunction| |FLAGG2;scan;MARB;14|)
                            $))))))))
      $)))) 

(MAKEPROP '|FiniteLinearAggregateFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Boolean|) (0 . |empty?|)
              (5 . |rest|) (10 . |first|) (|Mapping| 8 6 8) (15 . |reduce|)
              (|List| 6) (22 . |entries|) (|List| 8) (27 . |construct|)
              (|Mapping| 8 6) (32 . |map|) (38 . |empty|) (42 . |scan|)
              (49 . |concat|) (|NonNegativeInteger|) (55 . |#|) (60 . |new|)
              (|Integer|) (66 . |minIndex|) (71 . |qsetelt!|) (78 . |minIndex|)
              (83 . |maxIndex|) (88 . |qelt|) (94 . |reverse!|)
              (99 . |maxIndex|) (104 . |concat|))
           '#(|scan| 110 |reduce| 117 |map| 124) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 36
                                                 '(1 7 10 0 11 1 7 0 0 12 1 7 6
                                                   0 13 3 0 8 14 7 8 15 1 7 16
                                                   0 17 1 9 0 18 19 2 0 9 20 7
                                                   21 0 9 0 22 3 0 9 14 7 8 23
                                                   2 9 0 8 0 24 1 7 25 0 26 2 9
                                                   0 25 8 27 1 9 28 0 29 3 9 8
                                                   0 28 8 30 1 7 28 0 31 1 7 28
                                                   0 32 2 7 6 0 28 33 1 9 0 0
                                                   34 1 9 28 0 35 2 9 0 0 8 36
                                                   3 0 9 14 7 8 23 3 0 8 14 7 8
                                                   15 2 0 9 20 7 21)))))
           '|lookupComplete|)) 
