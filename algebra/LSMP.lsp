
(/VERSIONCHECK 2) 

(DEFUN |LSMP;hasSolution?;MColB;1| (A |b| $)
  (EQL (SPADCALL A (QREFELT $ 11))
       (SPADCALL (|LSMP;systemMatrix| A |b| $) (QREFELT $ 11)))) 

(DEFUN |LSMP;systemMatrix| (|m| |v| $)
  (SPADCALL |m| (SPADCALL (SPADCALL |v| (QREFELT $ 14)) (QREFELT $ 15))
            (QREFELT $ 16))) 

(DEFUN |LSMP;rank;MColNni;3| (A |b| $)
  (SPADCALL (|LSMP;systemMatrix| A |b| $) (QREFELT $ 11))) 

(DEFUN |LSMP;particularSolution;MColU;4| (A |b| $)
  (|LSMP;aSolution| (SPADCALL (|LSMP;systemMatrix| A |b| $) (QREFELT $ 18)) $)) 

(DEFUN |LSMP;aSolution| (|m| $)
  (PROG (#1=#:G161 |j| |i| |v| |sol| |ck| |rk| |nvar| #2=#:G146)
    (RETURN
     (SEQ
      (LETT |nvar|
            (PROG1
                (LETT #2# (- (SPADCALL |m| (QREFELT $ 21)) 1)
                      . #3=(|LSMP;aSolution|))
              (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
            . #3#)
      (LETT |rk| (SPADCALL |m| (QREFELT $ 24)) . #3#)
      (SEQ G190
           (COND
            ((NULL
              (COND
               ((>= |rk| (SPADCALL |m| (QREFELT $ 25)))
                (SPADCALL (ELT $ 26) (SPADCALL |m| |rk| (QREFELT $ 27))
                          (QREFELT $ 29)))
               ('T 'NIL)))
             (GO G191)))
           (SEQ (EXIT (LETT |rk| (- |rk| 1) . #3#))) NIL (GO G190) G191
           (EXIT NIL))
      (EXIT
       (COND
        ((< |rk| (SPADCALL |m| (QREFELT $ 25)))
         (CONS 0 (SPADCALL |nvar| (|spadConstant| $ 30) (QREFELT $ 31))))
        (#4='T
         (SEQ (LETT |ck| (SPADCALL |m| (QREFELT $ 32)) . #3#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((< |ck| (SPADCALL |m| (QREFELT $ 33)))
                        (SPADCALL (SPADCALL |m| |rk| |ck| (QREFELT $ 34))
                                  (QREFELT $ 26)))
                       ('T 'NIL)))
                     (GO G191)))
                   (SEQ (EXIT (LETT |ck| (+ |ck| 1) . #3#))) NIL (GO G190) G191
                   (EXIT NIL))
              (EXIT
               (COND
                ((EQL |ck| (SPADCALL |m| (QREFELT $ 33))) (CONS 1 "failed"))
                (#4#
                 (SEQ
                  (LETT |sol|
                        (SPADCALL |nvar| (|spadConstant| $ 30) (QREFELT $ 31))
                        . #3#)
                  (LETT |v|
                        (MAKEARR1 |nvar| (- (SPADCALL |m| (QREFELT $ 25)) 1))
                        . #3#)
                  (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 25)) . #3#) G190
                       (COND ((> |i| |rk|) (GO G191)))
                       (SEQ
                        (SEQ (LETT |j| 0 . #3#) G190
                             (COND
                              ((NULL
                                (SPADCALL
                                 (SPADCALL |m| |i|
                                           (+ |j|
                                              (SPADCALL |m| (QREFELT $ 32)))
                                           (QREFELT $ 34))
                                 (QREFELT $ 26)))
                               (GO G191)))
                             (SEQ (EXIT (|spadConstant| $ 30)))
                             (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (QSETAREF1 |v| |j| |i|)))
                       (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |j| 0 . #3#) (LETT #1# (- |nvar| 1) . #3#) G190
                       (COND ((|greater_SI| |j| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((>= (QAREF1 |v| |j|) (SPADCALL |m| (QREFELT $ 25)))
                           (SPADCALL |sol|
                                     (+ |j| (SPADCALL |sol| (QREFELT $ 35)))
                                     (SPADCALL
                                      (SPADCALL |m| (QAREF1 |v| |j|)
                                                (SPADCALL |m| (QREFELT $ 33))
                                                (QREFELT $ 34))
                                      (QREFELT $ 36))
                                     (QREFELT $ 37))))))
                       (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (CONS 0 |sol|)))))))))))))) 

(DEFUN |LSMP;solve;MColR;6| (A |b| $)
  (PROG (|m|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (ELT $ 26) |b| (QREFELT $ 38))
        (CONS
         (CONS 0
               (SPADCALL (SPADCALL A (QREFELT $ 21)) (|spadConstant| $ 30)
                         (QREFELT $ 31)))
         (SPADCALL A (QREFELT $ 40))))
       ('T
        (SEQ
         (LETT |m| (SPADCALL (|LSMP;systemMatrix| A |b| $) (QREFELT $ 18))
               |LSMP;solve;MColR;6|)
         (EXIT
          (CONS (|LSMP;aSolution| |m| $)
                (SPADCALL
                 (SPADCALL |m| (SPADCALL |m| (QREFELT $ 25))
                           (SPADCALL |m| (QREFELT $ 24))
                           (SPADCALL |m| (QREFELT $ 32))
                           (- (SPADCALL |m| (QREFELT $ 33)) 1) (QREFELT $ 41))
                 (QREFELT $ 40))))))))))) 

(DEFUN |LSMP;solve;MLL;7| (A |l| $)
  (PROG (#1=#:G181 |b| #2=#:G180 |nl| |sol0|)
    (RETURN
     (SEQ
      (COND
       ((NULL |l|)
        (LIST
         (CONS
          (CONS 0
                (SPADCALL (SPADCALL A (QREFELT $ 21)) (|spadConstant| $ 30)
                          (QREFELT $ 31)))
          (SPADCALL A (QREFELT $ 40)))))
       ('T
        (SEQ
         (LETT |nl|
               (QCDR
                (LETT |sol0| (SPADCALL A (|SPADfirst| |l|) (QREFELT $ 43))
                      . #3=(|LSMP;solve;MLL;7|)))
               . #3#)
         (EXIT
          (CONS |sol0|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |b| NIL . #3#) (LETT #1# (CDR |l|) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |b| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS
                                (|LSMP;aSolution|
                                 (SPADCALL (|LSMP;systemMatrix| A |b| $)
                                           (QREFELT $ 18))
                                 $)
                                |nl|)
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))))))))) 

(DECLAIM (NOTINLINE |LinearSystemMatrixPackage;|)) 

(DEFUN |LinearSystemMatrixPackage| (&REST #1=#:G182)
  (PROG ()
    (RETURN
     (PROG (#2=#:G183)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|LinearSystemMatrixPackage|)
                                           '|domainEqualList|)
                . #3=(|LinearSystemMatrixPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |LinearSystemMatrixPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|LinearSystemMatrixPackage|))))))))))) 

(DEFUN |LinearSystemMatrixPackage;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|LinearSystemMatrixPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|LinearSystemMatrixPackage| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 46) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|LinearSystemMatrixPackage|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|LinearSystemMatrixPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|NonNegativeInteger|) (0 . |rank|)
              (|Boolean|) |LSMP;hasSolution?;MColB;1| (5 . |coerce|) (10 . -)
              (15 . |horizConcat|) |LSMP;rank;MColNni;3| (21 . |rowEchelon|)
              (|Union| 8 '"failed") |LSMP;particularSolution;MColU;4|
              (26 . |ncols|) (31 . |One|) (|Integer|) (35 . |maxRowIndex|)
              (40 . |minRowIndex|) (45 . |zero?|) (50 . |row|) (|Mapping| 12 6)
              (56 . |every?|) (62 . |Zero|) (66 . |new|) (72 . |minColIndex|)
              (77 . |maxColIndex|) (82 . |qelt|) (89 . |minIndex|) (94 . -)
              (99 . |qsetelt!|) (106 . |every?|) (|List| 8) (112 . |nullSpace|)
              (117 . |subMatrix|)
              (|Record| (|:| |particular| 19) (|:| |basis| 39))
              |LSMP;solve;MColR;6| (|List| 42) |LSMP;solve;MLL;7|)
           '#(|solve| 126 |rank| 138 |particularSolution| 144 |hasSolution?|
              150)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 45
                                                 '(1 9 10 0 11 1 9 0 8 14 1 9 0
                                                   0 15 2 9 0 0 0 16 1 9 0 0 18
                                                   1 9 10 0 21 0 6 0 22 1 9 23
                                                   0 24 1 9 23 0 25 1 6 12 0 26
                                                   2 9 7 0 23 27 2 7 12 28 0 29
                                                   0 6 0 30 2 8 0 10 6 31 1 9
                                                   23 0 32 1 9 23 0 33 3 9 6 0
                                                   23 23 34 1 8 23 0 35 1 6 0 0
                                                   36 3 8 6 0 23 6 37 2 8 12 28
                                                   0 38 1 9 39 0 40 5 9 0 0 23
                                                   23 23 23 41 2 0 44 9 39 45 2
                                                   0 42 9 8 43 2 0 10 9 8 17 2
                                                   0 19 9 8 20 2 0 12 9 8
                                                   13)))))
           '|lookupComplete|)) 
