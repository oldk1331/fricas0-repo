
(SDEFUN |SETMN;=;2$B;1| ((|s1| $) (|s2| $) ($ |Boolean|))
        (SPADCALL (QCAR |s1|) (QCAR |s2|) (QREFELT $ 20))) 

(SDEFUN |SETMN;coerce;$Of;2| ((|s| $) ($ |OutputForm|))
        (SPROG ((#1=#:G127 NIL) (|i| NIL) (#2=#:G126 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |i| NIL) (LETT #1# (SPADCALL |s| (QREFELT $ 23)))
                       G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |i| (QREFELT $ 26)) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 28))))) 

(SDEFUN |SETMN;reallyEnumerate| (($ |Vector| $))
        (SPROG
         ((#1=#:G130 NIL) (|i| NIL) (#2=#:G132 NIL) (|b| NIL) (#3=#:G131 NIL))
         (SEQ
          (PROGN
           (LETT #3#
                 (GETREFV
                  (SIZE
                   #4=(|SETMN;enum| (QREFELT $ 6) (QREFELT $ 7) (QREFELT $ 7)
                       $))))
           (SEQ (LETT |b| NIL) (LETT #2# #4#) (LETT |i| 1) (LETT #1# 0) G190
                (COND
                 ((OR (ATOM #2#) (PROGN (LETT |b| (CAR #2#)) NIL)) (GO G191)))
                (SEQ (EXIT (SETELT #3# #1# (CONS |b| |i|))))
                (LETT #1#
                      (PROG1 (|inc_SI| #1#)
                        (LETT |i|
                              (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))))
                (GO G190) G191 (EXIT NIL))
           #3#)))) 

(SDEFUN |SETMN;member?;Pi$B;4| ((|p| |PositiveInteger|) (|s| $) ($ |Boolean|))
        (SPADCALL (QCAR |s|) |p| (QREFELT $ 31))) 

(SDEFUN |SETMN;enumerate;V;5| (($ |Vector| $))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL (QREFELT $ 13) (QREFELT $ 33)) (QREFELT $ 34))
           (SPADCALL (QREFELT $ 13) (|SETMN;reallyEnumerate| $)
                     (QREFELT $ 35))))
         (EXIT (SPADCALL (QREFELT $ 13) (QREFELT $ 33))))) 

(SDEFUN |SETMN;enum|
        ((|p| |NonNegativeInteger|) (|q| |NonNegativeInteger|)
         (|n| |PositiveInteger|) ($ |List| (|Bits|)))
        (SPROG
         ((#1=#:G150 NIL) (|s| NIL) (|l| (|List| (|Bits|))) (#2=#:G143 NIL)
          (|q1| (|NonNegativeInteger|)) (#3=#:G142 NIL) (#4=#:G149 NIL)
          (|i| NIL) (|b| (|Bits|)))
         (SEQ
          (COND ((OR (ZEROP |p|) (ZEROP |q|)) NIL)
                ('T
                 (COND
                  ((EQL |p| |q|)
                   (SEQ (LETT |b| (SPADCALL (QREFELT $ 7) NIL (QREFELT $ 38)))
                        (SEQ (LETT |i| 1) (LETT #4# |p|) G190
                             (COND ((|greater_SI| |i| #4#) (GO G191)))
                             (SEQ (EXIT (SPADCALL |b| |i| 'T (QREFELT $ 39))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LIST |b|))))
                  ('T
                   (SEQ
                    (LETT |q1|
                          (PROG1 (LETT #3# (- |q| 1))
                            (|check_subtype2| (>= #3# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #3#)))
                    (LETT |l|
                          (|SETMN;enum|
                           (PROG1 (LETT #2# (- |p| 1))
                             (|check_subtype2| (>= #2# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #2#))
                           |q1| (QREFELT $ 7) $))
                    (COND
                     ((NULL |l|)
                      (LETT |l|
                            (LIST
                             (SPADCALL (QREFELT $ 7) NIL (QREFELT $ 38))))))
                    (SEQ (LETT |s| NIL) (LETT #1# |l|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ (EXIT (SPADCALL |s| |q| 'T (QREFELT $ 39))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL (|SETMN;enum| |p| |q1| (QREFELT $ 7) $) |l|
                               (QREFELT $ 41))))))))))) 

(SDEFUN |SETMN;size;Nni;7| (($ |NonNegativeInteger|))
        (SPROG ((#1=#:G151 NIL))
               (SEQ
                (COND
                 ((ZEROP (SPADCALL (QREFELT $ 17) (QREFELT $ 42)))
                  (SPADCALL (QREFELT $ 17)
                            (PROG1
                                (LETT #1#
                                      (SPADCALL (QREFELT $ 7) (QREFELT $ 6)
                                                (QREFELT $ 44)))
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#))
                            (QREFELT $ 45))))
                (EXIT (SPADCALL (QREFELT $ 17) (QREFELT $ 42)))))) 

(SDEFUN |SETMN;lookup;$Pi;8| ((|s| $) ($ |PositiveInteger|))
        (SPROG ((#1=#:G158 NIL) (#2=#:G156 NIL))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL (QREFELT $ 13) (QREFELT $ 33))
                            (QREFELT $ 34))
                  (SPADCALL (QREFELT $ 13) (|SETMN;reallyEnumerate| $)
                            (QREFELT $ 35))))
                (COND
                 ((ZEROP (QCDR |s|))
                  (PROGN
                   (RPLACD |s|
                           (PROG1
                               (LETT #2#
                                     (SPADCALL |s|
                                               (SPADCALL (QREFELT $ 13)
                                                         (QREFELT $ 33))
                                               (QREFELT $ 47)))
                             (|check_subtype2| (>= #2# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #2#)))
                   (QCDR |s|))))
                (EXIT
                 (PROG1 (LETT #1# (QCDR |s|))
                   (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                     '(|NonNegativeInteger|) #1#)))))) 

(SDEFUN |SETMN;index;Pi$;9| ((|p| |PositiveInteger|) ($ $))
        (SEQ
         (COND
          ((> |p| (SPADCALL (QREFELT $ 46)))
           (|error| "index: argument too large"))
          ('T
           (SEQ
            (COND
             ((SPADCALL (SPADCALL (QREFELT $ 13) (QREFELT $ 33))
                        (QREFELT $ 34))
              (SPADCALL (QREFELT $ 13) (|SETMN;reallyEnumerate| $)
                        (QREFELT $ 35))))
            (EXIT
             (SPADCALL (SPADCALL (QREFELT $ 13) (QREFELT $ 33)) |p|
                       (QREFELT $ 49)))))))) 

(SDEFUN |SETMN;setOfMinN;L$;10| ((|l| |List| (|PositiveInteger|)) ($ $))
        (SPROG
         ((|count| (|NonNegativeInteger|)) (#1=#:G171 NIL) (|i| NIL)
          (|s| (|Bits|)))
         (SEQ (LETT |s| (SPADCALL (QREFELT $ 7) NIL (QREFELT $ 38)))
              (LETT |count| 0)
              (SEQ (LETT |i| NIL) (LETT #1# |l|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |count| (+ |count| 1))
                        (COND
                         ((OR (> |count| (QREFELT $ 6))
                              (OR (OR (ZEROP |i|) (> |i| (QREFELT $ 7)))
                                  (SPADCALL |s| |i| (QREFELT $ 31))))
                          (EXIT
                           (|error| "setOfMinN: improper set of integers"))))
                        (EXIT (SPADCALL |s| |i| 'T (QREFELT $ 39))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((< |count| (QREFELT $ 6))
                 (|error| "setOfMinN: improper set of integers"))
                ('T (CONS |s| 0))))))) 

(SDEFUN |SETMN;elements;$L;11| ((|s| $) ($ |List| (|PositiveInteger|)))
        (SPROG
         ((|i| (|PositiveInteger|)) (|found| (|NonNegativeInteger|))
          (|l| (|List| (|PositiveInteger|))) (|b| (|Bits|)))
         (SEQ (LETT |b| (QCAR |s|)) (LETT |l| NIL) (LETT |found| 0)
              (LETT |i| 1)
              (SEQ G190 (COND ((NULL (< |found| (QREFELT $ 6))) (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL |b| |i| (QREFELT $ 31))
                      (SEQ (LETT |l| (CONS |i| |l|))
                           (EXIT (LETT |found| (+ |found| 1))))))
                    (EXIT (LETT |i| (+ |i| 1))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |l|))))) 

(SDEFUN |SETMN;incrementKthElement;$PiU;12|
        ((|s| $) (|k| |PositiveInteger|) ($ |Union| $ "failed"))
        (SPROG
         ((#1=#:G186 NIL) (|newb| (|Bits|)) (|i| (|NonNegativeInteger|))
          (|found| (|NonNegativeInteger|)) (|b| (|Bits|)))
         (SEQ (LETT |b| (QCAR |s|)) (LETT |found| 0) (LETT |i| 1)
              (SEQ G190 (COND ((NULL (< |found| |k|)) (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL |b| |i| (QREFELT $ 31))
                      (LETT |found| (+ |found| 1))))
                    (EXIT (LETT |i| (+ |i| 1))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND
               ((OR (> |i| (QREFELT $ 7)) (SPADCALL |b| |i| (QREFELT $ 31)))
                (EXIT (CONS 1 "failed"))))
              (LETT |newb| (SPADCALL |b| (QREFELT $ 52)))
              (SPADCALL |newb| |i| 'T (QREFELT $ 39))
              (SPADCALL |newb|
                        (PROG1 (LETT #1# (- |i| 1))
                          (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #1#))
                        NIL (QREFELT $ 39))
              (EXIT (CONS 0 (CONS |newb| 0)))))) 

(SDEFUN |SETMN;delta;$2PiNni;13|
        ((|s| $) (|k| |PositiveInteger|) (|p| |PositiveInteger|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((|i| (|PositiveInteger|)) (|count| #1=(|NonNegativeInteger|))
          (|found| #1#) (|b| (|Bits|)))
         (SEQ (LETT |b| (QCAR |s|)) (LETT |count| (LETT |found| 0))
              (LETT |i| 1)
              (SEQ G190 (COND ((NULL (< |found| |k|)) (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL |b| |i| (QREFELT $ 31))
                      (SEQ (LETT |found| (+ |found| 1))
                           (EXIT
                            (COND
                             ((> |i| |p|)
                              (COND
                               ((< |found| |k|)
                                (LETT |count| (+ |count| 1))))))))))
                    (EXIT (LETT |i| (+ |i| 1))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |count|)))) 

(SDEFUN |SETMN;replaceKthElement;$2PiU;14|
        ((|s| $) (|k| |PositiveInteger|) (|p| |PositiveInteger|)
         ($ |Union| $ "failed"))
        (SPROG
         ((|newb| (|Bits|)) (|i| (|PositiveInteger|))
          (|found| (|NonNegativeInteger|)) (|b| (|Bits|)))
         (SEQ (LETT |b| (QCAR |s|)) (LETT |found| 0) (LETT |i| 1)
              (SEQ G190 (COND ((NULL (< |found| |k|)) (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL |b| |i| (QREFELT $ 31))
                      (LETT |found| (+ |found| 1))))
                    (EXIT (COND ((< |found| |k|) (LETT |i| (+ |i| 1))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL |b| |p| (QREFELT $ 31))
                (COND
                 ((SPADCALL |i| |p| (QREFELT $ 56))
                  (EXIT (CONS 1 "failed"))))))
              (LETT |newb| (SPADCALL |b| (QREFELT $ 52)))
              (SPADCALL |newb| |p| 'T (QREFELT $ 39))
              (SPADCALL |newb| |i| NIL (QREFELT $ 39))
              (EXIT
               (CONS 0
                     (CONS |newb| (COND ((EQL |i| |p|) (QCDR |s|)) ('T 0)))))))) 

(DECLAIM (NOTINLINE |SetOfMIntegersInOneToN;|)) 

(DEFUN |SetOfMIntegersInOneToN| (&REST #1=#:G209)
  (SPROG NIL
         (PROG (#2=#:G210)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SetOfMIntegersInOneToN|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SetOfMIntegersInOneToN;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SetOfMIntegersInOneToN|)))))))))) 

(DEFUN |SetOfMIntegersInOneToN;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|SetOfMIntegersInOneToN| DV$1 DV$2))
          (LETT $ (GETREFV 62))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SetOfMIntegersInOneToN|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|Record| (|:| |bits| (|Bits|))
                              (|:| |pos| (|NonNegativeInteger|))))
          (QSETREFV $ 13 (SPADCALL (SPADCALL (QREFELT $ 10)) (QREFELT $ 12)))
          (QSETREFV $ 17 (SPADCALL 0 (QREFELT $ 16)))
          $))) 

(MAKEPROP '|SetOfMIntegersInOneToN| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Vector| $$) (0 . |empty|) (|Reference| 9) (4 . |ref|) '|all|
              (|NonNegativeInteger|) (|Reference| 14) (9 . |ref|) '|sz|
              (|Boolean|) (|Bits|) (14 . =) |SETMN;=;2$B;1| (|List| 25)
              |SETMN;elements;$L;11| (|OutputForm|) (|PositiveInteger|)
              (20 . |coerce|) (|List| $) (25 . |brace|) |SETMN;coerce;$Of;2|
              (|Integer|) (30 . |elt|) |SETMN;member?;Pi$B;4| (36 . |elt|)
              (41 . |empty?|) (46 . |setelt!|) (|Vector| $)
              |SETMN;enumerate;V;5| (52 . |new|) (58 . |setelt!|) (|List| 19)
              (65 . |concat!|) (71 . |elt|) (|IntegerCombinatoricFunctions| 30)
              (76 . |binomial|) (82 . |setelt!|) |SETMN;size;Nni;7|
              (88 . |position|) |SETMN;lookup;$Pi;8| (94 . |elt|)
              |SETMN;index;Pi$;9| |SETMN;setOfMinN;L$;10| (100 . |copy|)
              (|Union| $ '"failed") |SETMN;incrementKthElement;$PiU;12|
              |SETMN;delta;$2PiNni;13| (105 . ~=)
              |SETMN;replaceKthElement;$2PiU;14| (|String|) (|InputForm|)
              (|SingleInteger|) (|HashState|))
           '#(~= 111 |smaller?| 117 |size| 123 |setOfMinN| 127
              |replaceKthElement| 132 |random| 139 |member?| 143 |lookup| 149
              |latex| 154 |index| 159 |incrementKthElement| 164 |hashUpdate!|
              170 |hash| 176 |enumerate| 181 |elements| 189 |delta| 194
              |convert| 201 |coerce| 206 = 211)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0))
                 (CONS '#(|Finite&| NIL |SetCategory&| |BasicType&| NIL NIL)
                       (CONS
                        '#((|Finite|) (|Comparable|) (|SetCategory|)
                           (|BasicType|) (|ConvertibleTo| 59)
                           (|CoercibleTo| 24))
                        (|makeByteWordVec2| 61
                                            '(0 9 0 10 1 11 0 9 12 1 15 0 14 16
                                              2 19 18 0 0 20 1 25 24 0 26 1 24
                                              0 27 28 2 19 18 0 30 31 1 11 9 0
                                              33 1 9 18 0 34 2 11 9 0 9 35 2 19
                                              0 14 18 38 3 19 18 0 30 18 39 2
                                              40 0 0 0 41 1 15 14 0 42 2 43 30
                                              30 30 44 2 15 14 0 14 45 2 9 30 2
                                              0 47 2 9 2 0 30 49 1 19 0 0 52 2
                                              25 18 0 0 56 2 0 18 0 0 1 2 0 18
                                              0 0 1 0 0 14 46 1 0 0 22 51 3 0
                                              53 0 25 25 57 0 0 0 1 2 0 18 25 0
                                              32 1 0 25 0 48 1 0 58 0 1 1 0 0
                                              25 50 2 0 53 0 25 54 2 0 61 61 0
                                              1 1 0 60 0 1 0 0 36 37 0 0 27 1 1
                                              0 22 0 23 3 0 14 0 25 25 55 1 0
                                              59 0 1 1 0 24 0 29 2 0 18 0 0
                                              21)))))
           '|lookupComplete|)) 
