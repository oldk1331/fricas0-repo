
(PUT '|LMOPS;makeUnit;$;1| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |LMOPS;makeUnit;$;1| (($ $)) NIL) 

(SDEFUN |LMOPS;size;$Nni;2| ((|l| $) ($ |NonNegativeInteger|))
        (LENGTH (SPADCALL |l| (QREFELT $ 13)))) 

(SDEFUN |LMOPS;coerce;S$;3| ((|s| S) ($ $)) (LIST (CONS |s| (QREFELT $ 8)))) 

(SDEFUN |LMOPS;coerce;$Of;4| ((|l| $) ($ |OutputForm|))
        (SPADCALL |l| (QREFELT $ 18))) 

(SDEFUN |LMOPS;makeTerm;SE$;5| ((|s| S) (|e| E) ($ $))
        (COND ((SPADCALL |e| (QREFELT $ 21)) (SPADCALL (QREFELT $ 10)))
              ('T (LIST (CONS |s| |e|))))) 

(PUT '|LMOPS;makeMulti;L$;6| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |LMOPS;makeMulti;L$;6|
        ((|l| |List| (|Record| (|:| |gen| S) (|:| |exp| E))) ($ $)) |l|) 

(SDEFUN |LMOPS;=;2$B;7| ((|f| $) (|g| $) ($ |Boolean|))
        (SPADCALL |f| |g| (QREFELT $ 24))) 

(PUT '|LMOPS;listOfMonoms;$L;8| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |LMOPS;listOfMonoms;$L;8|
        ((|l| $) ($ |List| (|Record| (|:| |gen| S) (|:| |exp| E)))) |l|) 

(SDEFUN |LMOPS;nthExpon;$IE;9| ((|f| $) (|i| |Integer|) ($ E))
        (QCDR
         (SPADCALL |f| (+ (- |i| 1) (SPADCALL |f| (QREFELT $ 27)))
                   (QREFELT $ 28)))) 

(SDEFUN |LMOPS;nthFactor;$IS;10| ((|f| $) (|i| |Integer|) ($ S))
        (QCAR
         (SPADCALL |f| (+ (- |i| 1) (SPADCALL |f| (QREFELT $ 27)))
                   (QREFELT $ 28)))) 

(PUT '|LMOPS;reverse;2$;11| '|SPADreplace| 'REVERSE) 

(SDEFUN |LMOPS;reverse;2$;11| ((|l| $) ($ $)) (REVERSE |l|)) 

(PUT '|LMOPS;reverse!;2$;12| '|SPADreplace| 'NREVERSE) 

(SDEFUN |LMOPS;reverse!;2$;12| ((|l| $) ($ $)) (NREVERSE |l|)) 

(SDEFUN |LMOPS;mapGen;M2$;13| ((|f| |Mapping| S S) (|l| $) ($ $))
        (SPROG ((#1=#:G147 NIL) (|x| NIL) (#2=#:G146 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |x| NIL) (LETT #1# |l|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (CONS (SPADCALL (QCAR |x|) |f|) (QCDR |x|))
                                    #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |LMOPS;mapExpon;M2$;14| ((|f| |Mapping| E E) (|l| $) ($ $))
        (SPROG
         ((|ans| (|List| (|Record| (|:| |gen| S) (|:| |exp| E)))) (|a| (E))
          (#1=#:G154 NIL) (|x| NIL))
         (SEQ (LETT |ans| NIL)
              (SEQ (LETT |x| NIL) (LETT #1# |l|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (LETT |a| (SPADCALL (QCDR |x|) |f|))
                                 (|spadConstant| $ 35) (QREFELT $ 36))
                       (LETT |ans| (CONS (CONS (QCAR |x|) |a|) |ans|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |ans| (QREFELT $ 32)))))) 

(SDEFUN |LMOPS;outputForm;$2MIOf;15|
        ((|l| $) (|op| |Mapping| (|OutputForm|) (|OutputForm|) (|OutputForm|))
         (|opexp| |Mapping| (|OutputForm|) (|OutputForm|) (|OutputForm|))
         (|id| |Integer|) ($ |OutputForm|))
        (SPROG ((#1=#:G164 NIL) (|p| NIL) (#2=#:G163 NIL))
               (SEQ
                (COND ((NULL |l|) (SPADCALL |id| (QREFELT $ 39)))
                      ('T
                       (SEQ
                        (LETT |l|
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |p| NIL) (LETT #1# |l|) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |p| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (COND
                                              ((SPADCALL (QCDR |p|)
                                                         (QREFELT $ 8)
                                                         (QREFELT $ 40))
                                               (SPADCALL (QCAR |p|)
                                                         (QREFELT $ 41)))
                                              ('T
                                               (SPADCALL
                                                (SPADCALL (QCAR |p|)
                                                          (QREFELT $ 41))
                                                (SPADCALL (QCDR |p|)
                                                          (QREFELT $ 42))
                                                |opexp|)))
                                             #2#))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT (NREVERSE #2#)))))
                        (EXIT (SPADCALL |op| |l| (QREFELT $ 45))))))))) 

(SDEFUN |LMOPS;retractIfCan;$U;16| ((|l| $) ($ |Union| S "failed"))
        (SEQ
         (COND
          ((NULL (NULL |l|))
           (COND
            ((NULL (CDR |l|))
             (COND
              ((SPADCALL (QCDR (|SPADfirst| |l|)) (QREFELT $ 8) (QREFELT $ 40))
               (EXIT (CONS 0 (QCAR (|SPADfirst| |l|))))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |LMOPS;rightMult;$S$;17| ((|f| $) (|s| S) ($ $))
        (SPROG ((|h| ($)))
               (SEQ
                (COND ((NULL |f|) (SPADCALL |s| (QREFELT $ 16)))
                      ((SPADCALL |s|
                                 (QCAR (SPADCALL |f| '|last| (QREFELT $ 50)))
                                 (QREFELT $ 51))
                       (SEQ
                        (SPADCALL (LETT |h| (SPADCALL |f| (QREFELT $ 52)))
                                  (CONS |s|
                                        (SPADCALL
                                         (QCDR
                                          (SPADCALL |f| '|last|
                                                    (QREFELT $ 50)))
                                         (QREFELT $ 8) (QREFELT $ 53)))
                                  (QREFELT $ 54))
                        (EXIT |h|)))
                      ('T
                       (SPADCALL |f| (CONS |s| (QREFELT $ 8))
                                 (QREFELT $ 55))))))) 

(SDEFUN |LMOPS;leftMult;S2$;18| ((|s| S) (|f| $) ($ $))
        (COND ((NULL |f|) (SPADCALL |s| (QREFELT $ 16)))
              ((SPADCALL |s| (QCAR (|SPADfirst| |f|)) (QREFELT $ 51))
               (CONS
                (CONS |s|
                      (SPADCALL (QCDR (|SPADfirst| |f|)) (QREFELT $ 8)
                                (QREFELT $ 53)))
                (CDR |f|)))
              ('T (CONS (CONS |s| (QREFELT $ 8)) |f|)))) 

(DECLAIM (NOTINLINE |ListMonoidOps;|)) 

(DEFUN |ListMonoidOps| (&REST #1=#:G186)
  (SPROG NIL
         (PROG (#2=#:G187)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ListMonoidOps|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ListMonoidOps;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|ListMonoidOps|)))))))))) 

(DEFUN |ListMonoidOps;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|ListMonoidOps| DV$1 DV$2 DV$3))
          (LETT $ (GETREFV 61))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ListMonoidOps|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (|List| (|Record| (|:| |gen| |#1|) (|:| |exp| |#2|))))
          $))) 

(MAKEPROP '|ListMonoidOps| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|Rep| |LMOPS;makeUnit;$;1|
              (|Record| (|:| |gen| 6) (|:| |exp| 7)) (|List| 11)
              |LMOPS;listOfMonoms;$L;8| (|NonNegativeInteger|)
              |LMOPS;size;$Nni;2| |LMOPS;coerce;S$;3| (|OutputForm|)
              (0 . |coerce|) |LMOPS;coerce;$Of;4| (|Boolean|) (5 . |zero?|)
              |LMOPS;makeTerm;SE$;5| |LMOPS;makeMulti;L$;6| (10 . =)
              |LMOPS;=;2$B;7| (|Integer|) (16 . |minIndex|) (21 . |elt|)
              |LMOPS;nthExpon;$IE;9| |LMOPS;nthFactor;$IS;10|
              |LMOPS;reverse;2$;11| |LMOPS;reverse!;2$;12| (|Mapping| 6 6)
              |LMOPS;mapGen;M2$;13| (27 . |Zero|) (31 . ~=) (|Mapping| 7 7)
              |LMOPS;mapExpon;M2$;14| (37 . |coerce|) (42 . =) (48 . |coerce|)
              (53 . |coerce|) (|Mapping| 17 17 17) (|List| 17) (58 . |reduce|)
              |LMOPS;outputForm;$2MIOf;15| (|Union| 6 '"failed")
              |LMOPS;retractIfCan;$U;16| '"last" (64 . |elt|) (70 . =)
              (76 . |copy|) (81 . +) (87 . |setlast!|) (93 . |concat|)
              |LMOPS;rightMult;$S$;17| |LMOPS;leftMult;S2$;18| (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 99 |size| 105 |rightMult| 110 |reverse!| 116 |reverse| 121
              |retractIfCan| 126 |retract| 131 |outputForm| 136 |nthFactor| 144
              |nthExpon| 150 |mapGen| 156 |mapExpon| 162 |makeUnit| 168
              |makeTerm| 172 |makeMulti| 178 |listOfMonoms| 183 |leftMult| 188
              |latex| 194 |hashUpdate!| 199 |hash| 205 |coerce| 210 = 220)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| |RetractableTo&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|RetractableTo| 6)
                           (|CoercibleTo| 17))
                        (|makeByteWordVec2| 60
                                            '(1 9 17 0 18 1 7 20 0 21 2 9 20 0
                                              0 24 1 9 26 0 27 2 9 11 0 26 28 0
                                              7 0 35 2 7 20 0 0 36 1 26 17 0 39
                                              2 7 20 0 0 40 1 6 17 0 41 1 7 17
                                              0 42 2 44 17 43 0 45 2 9 11 0 49
                                              50 2 6 20 0 0 51 1 9 0 0 52 2 7 0
                                              0 0 53 2 9 11 0 11 54 2 9 0 0 11
                                              55 2 0 20 0 0 1 1 0 14 0 15 2 0 0
                                              0 6 56 1 0 0 0 32 1 0 0 0 31 1 0
                                              47 0 48 1 0 6 0 1 4 0 17 0 43 43
                                              26 46 2 0 6 0 26 30 2 0 7 0 26 29
                                              2 0 0 33 0 34 2 0 0 37 0 38 0 0 0
                                              10 2 0 0 6 7 22 1 0 0 12 23 1 0
                                              12 0 13 2 0 0 6 0 57 1 0 58 0 1 2
                                              0 60 60 0 1 1 0 59 0 1 1 0 0 6 16
                                              1 0 17 0 19 2 0 20 0 0 25)))))
           '|lookupComplete|)) 
