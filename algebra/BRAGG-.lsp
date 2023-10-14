
(SDEFUN |BRAGG-;elt;AleftA;1| ((|x| A) (T3 "left") ($ A))
        (SPADCALL |x| (QREFELT $ 8))) 

(SDEFUN |BRAGG-;elt;ArightA;2| ((|x| A) (T4 "right") ($ A))
        (SPADCALL |x| (QREFELT $ 11))) 

(SDEFUN |BRAGG-;leaf?;AB;3| ((|x| A) ($ |Boolean|))
        (COND ((SPADCALL |x| (QREFELT $ 15)) 'T)
              ((SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 15))
               (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 15)))
              ('T 'NIL))) 

(SDEFUN |BRAGG-;leaves;AL;4| ((|t| A) ($ |List| S))
        (COND ((SPADCALL |t| (QREFELT $ 15)) NIL)
              ((SPADCALL |t| (QREFELT $ 17))
               (LIST (SPADCALL |t| (QREFELT $ 18))))
              ('T
               (SPADCALL (SPADCALL (SPADCALL |t| (QREFELT $ 8)) (QREFELT $ 20))
                         (SPADCALL (SPADCALL |t| (QREFELT $ 11))
                                   (QREFELT $ 20))
                         (QREFELT $ 21))))) 

(SDEFUN |BRAGG-;nodes;AL;5| ((|x| A) ($ |List| A))
        (SPROG ((|l| (|List| A)))
               (SEQ (LETT |l| NIL |BRAGG-;nodes;AL;5|)
                    (EXIT
                     (COND ((SPADCALL |x| (QREFELT $ 15)) |l|)
                           ('T
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 8))
                                       (QREFELT $ 24))
                             (SPADCALL (LIST |x|)
                                       (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                                 (QREFELT $ 24))
                                       (QREFELT $ 26))
                             (QREFELT $ 26)))))))) 

(SDEFUN |BRAGG-;children;AL;6| ((|x| A) ($ |List| A))
        (SPROG ((|l| (|List| A)))
               (SEQ (LETT |l| NIL |BRAGG-;children;AL;6|)
                    (EXIT
                     (COND ((SPADCALL |x| (QREFELT $ 15)) |l|)
                           ((SPADCALL (SPADCALL |x| (QREFELT $ 8))
                                      (QREFELT $ 15))
                            (LIST (SPADCALL |x| (QREFELT $ 11))))
                           ((SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                      (QREFELT $ 15))
                            (LIST (SPADCALL |x| (QREFELT $ 8))))
                           ('T
                            (LIST (SPADCALL |x| (QREFELT $ 8))
                                  (SPADCALL |x| (QREFELT $ 11))))))))) 

(SDEFUN |BRAGG-;node?;2AB;7| ((|u| A) (|v| A) ($ |Boolean|))
        (SPROG ((#1=#:G158 NIL) (#2=#:G159 NIL) (#3=#:G160 NIL) (|y| NIL))
               (SEQ
                (EXIT
                 (COND ((SPADCALL |v| (QREFELT $ 15)) 'NIL)
                       ((SPADCALL |u| |v| (QREFELT $ 29)) 'T)
                       ('T
                        (SEQ
                         (SEQ
                          (EXIT
                           (SEQ (LETT |y| NIL . #4=(|BRAGG-;node?;2AB;7|))
                                (LETT #3# (SPADCALL |v| (QREFELT $ 30)) . #4#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |y| (CAR #3#) . #4#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL |u| |y| (QREFELT $ 31))
                                    (PROGN
                                     (LETT #1#
                                           (PROGN
                                            (LETT #2# 'T . #4#)
                                            (GO #5=#:G157))
                                           . #4#)
                                     (GO #6=#:G154))))))
                                (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                                (EXIT NIL)))
                          #6# (EXIT #1#))
                         (EXIT 'NIL)))))
                #5# (EXIT #2#)))) 

(SDEFUN |BRAGG-;=;2AB;8| ((|x| A) (|y| A) ($ |Boolean|))
        (COND ((SPADCALL |x| (QREFELT $ 15)) (SPADCALL |y| (QREFELT $ 15)))
              ((OR
                (OR (SPADCALL |y| (QREFELT $ 15))
                    (NULL
                     (SPADCALL (SPADCALL |x| (QREFELT $ 18))
                               (SPADCALL |y| (QREFELT $ 18)) (QREFELT $ 33))))
                (NULL
                 (SPADCALL (SPADCALL |x| (QREFELT $ 8))
                           (SPADCALL |y| (QREFELT $ 8)) (QREFELT $ 29))))
               'NIL)
              ('T
               (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                         (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 29))))) 

(SDEFUN |BRAGG-;member?;SAB;9| ((|x| S) (|u| A) ($ |Boolean|))
        (COND ((SPADCALL |u| (QREFELT $ 15)) 'NIL)
              ((OR (SPADCALL |x| (SPADCALL |u| (QREFELT $ 18)) (QREFELT $ 33))
                   (SPADCALL |x| (SPADCALL |u| (QREFELT $ 8)) (QREFELT $ 35)))
               'T)
              ('T (SPADCALL |x| (SPADCALL |u| (QREFELT $ 11)) (QREFELT $ 35))))) 

(SDEFUN |BRAGG-;coerce;AOf;10| ((|t| A) ($ |OutputForm|))
        (SPROG ((|r| #1=(|OutputForm|)) (|l| #1#) (|v| (|OutputForm|)))
               (SEQ
                (COND ((SPADCALL |t| (QREFELT $ 15)) "[]")
                      (#2='T
                       (SEQ
                        (LETT |v|
                              (SPADCALL (SPADCALL |t| (QREFELT $ 18))
                                        (QREFELT $ 38))
                              . #3=(|BRAGG-;coerce;AOf;10|))
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |t| (QREFELT $ 8))
                                     (QREFELT $ 15))
                           (COND
                            ((SPADCALL (SPADCALL |t| (QREFELT $ 11))
                                       (QREFELT $ 15))
                             |v|)
                            (#2#
                             (SEQ
                              (LETT |r|
                                    (SPADCALL (SPADCALL |t| (QREFELT $ 11))
                                              (QREFELT $ 39))
                                    . #3#)
                              (EXIT
                               (SPADCALL (LIST "." |v| |r|)
                                         (QREFELT $ 40)))))))
                          (#2#
                           (SEQ
                            (LETT |l|
                                  (SPADCALL (SPADCALL |t| (QREFELT $ 8))
                                            (QREFELT $ 39))
                                  . #3#)
                            (LETT |r|
                                  (COND
                                   ((SPADCALL (SPADCALL |t| (QREFELT $ 11))
                                              (QREFELT $ 15))
                                    ".")
                                   (#2#
                                    (SPADCALL (SPADCALL |t| (QREFELT $ 11))
                                              (QREFELT $ 39))))
                                  . #3#)
                            (EXIT
                             (SPADCALL (LIST |l| |v| |r|)
                                       (QREFELT $ 40))))))))))))) 

(SDEFUN |BRAGG-;#;ANni;11| ((|x| A) ($ |NonNegativeInteger|))
        (|BRAGG-;aggCount| |x| 0 $)) 

(SDEFUN |BRAGG-;aggCount|
        ((|x| A) (|k| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G183 NIL) (|y| NIL))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 15)) 0)
                      ('T
                       (SEQ (LETT |k| (+ |k| 1) . #2=(|BRAGG-;aggCount|))
                            (COND
                             ((EQL |k| 1000)
                              (COND
                               ((SPADCALL |x| (QREFELT $ 44))
                                (EXIT (|error| "cyclic tree"))))))
                            (SEQ (LETT |y| NIL . #2#)
                                 (LETT #1# (SPADCALL |x| (QREFELT $ 30)) . #2#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |y| (CAR #1#) . #2#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |k| (|BRAGG-;aggCount| |y| |k| $)
                                         . #2#)))
                                 (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |k|))))))) 

(SDEFUN |BRAGG-;cyclic?;AB;13| ((|x| A) ($ |Boolean|))
        (COND ((SPADCALL |x| (QREFELT $ 15)) 'NIL)
              ('T (|BRAGG-;isCycle?| |x| NIL $)))) 

(SDEFUN |BRAGG-;isCycle?| ((|x| A) (|acc| |List| A) ($ |Boolean|))
        (SPROG ((#1=#:G193 NIL) (#2=#:G194 NIL) (#3=#:G195 NIL) (|y| NIL))
               (SEQ
                (EXIT
                 (COND ((SPADCALL |x| (QREFELT $ 15)) 'NIL)
                       ((|BRAGG-;eqMember?| |x| |acc| $) 'T)
                       (#4='T
                        (SEQ
                         (SEQ
                          (EXIT
                           (SEQ (LETT |y| NIL . #5=(|BRAGG-;isCycle?|))
                                (LETT #3# (SPADCALL |x| (QREFELT $ 30)) . #5#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |y| (CAR #3#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((COND ((SPADCALL |y| (QREFELT $ 15)) 'NIL)
                                          (#4# 'T))
                                    (COND
                                     ((|BRAGG-;isCycle?| |y| |acc| $)
                                      (PROGN
                                       (LETT #1#
                                             (PROGN
                                              (LETT #2# 'T . #5#)
                                              (GO #6=#:G192))
                                             . #5#)
                                       (GO #7=#:G188))))))))
                                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                (EXIT NIL)))
                          #7# (EXIT #1#))
                         (EXIT 'NIL)))))
                #6# (EXIT #2#)))) 

(SDEFUN |BRAGG-;eqMember?| ((|y| A) (|l| |List| A) ($ |Boolean|))
        (SPROG ((#1=#:G200 NIL) (#2=#:G201 NIL) (#3=#:G202 NIL) (|x| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |x| NIL . #4=(|BRAGG-;eqMember?|))
                         (LETT #3# |l| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |x| |y| (QREFELT $ 46))
                             (PROGN
                              (LETT #1#
                                    (PROGN (LETT #2# 'T . #4#) (GO #5=#:G199))
                                    . #4#)
                              (GO #6=#:G197))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT 'NIL)))
                #5# (EXIT #2#)))) 

(SDEFUN |BRAGG-;setelt;Aleft2A;16| ((|x| A) (T5 "left") (|b| A) ($ A))
        (SPADCALL |x| |b| (QREFELT $ 47))) 

(SDEFUN |BRAGG-;setelt;Aright2A;17| ((|x| A) (T6 "right") (|b| A) ($ A))
        (SPADCALL |x| |b| (QREFELT $ 49))) 

(DECLAIM (NOTINLINE |BinaryRecursiveAggregate&;|)) 

(DEFUN |BinaryRecursiveAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|BinaryRecursiveAggregate&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|BinaryRecursiveAggregate&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 52) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|shallowlyMutable|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#1| (LIST '|SetAggregate| (|devaluate| |#2|)))
            (COND
             ((|HasCategory| |#2| '(|SetCategory|))
              (PROGN
               (QSETREFV $ 32
                         (CONS (|dispatchFunction| |BRAGG-;node?;2AB;7|) $))
               (QSETREFV $ 34 (CONS (|dispatchFunction| |BRAGG-;=;2AB;8|) $))
               (COND
                ((|HasCategory| |#1| '(|finiteAggregate|))
                 (QSETREFV $ 36
                           (CONS (|dispatchFunction| |BRAGG-;member?;SAB;9|)
                                 $)))))))))
          (COND
           ((|HasCategory| |#2| '(|SetCategory|))
            (QSETREFV $ 41
                      (CONS (|dispatchFunction| |BRAGG-;coerce;AOf;10|) $))))
          (COND
           ((|HasCategory| |#1| '(|finiteAggregate|))
            (PROGN
             (QSETREFV $ 43
                       (CONS (|dispatchFunction| |BRAGG-;#;ANni;11|) $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 48
                       (CONS (|dispatchFunction| |BRAGG-;setelt;Aleft2A;16|)
                             $))
             (QSETREFV $ 50
                       (CONS (|dispatchFunction| |BRAGG-;setelt;Aright2A;17|)
                             $)))))
          $))) 

(MAKEPROP '|BinaryRecursiveAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |left|) '"left" |BRAGG-;elt;AleftA;1| (5 . |right|) '"right"
              |BRAGG-;elt;ArightA;2| (|Boolean|) (10 . |empty?|)
              |BRAGG-;leaf?;AB;3| (15 . |leaf?|) (20 . |value|) (|List| 7)
              (25 . |leaves|) (30 . |concat|) |BRAGG-;leaves;AL;4| (|List| $)
              (36 . |nodes|) (|List| 6) (41 . |concat|) |BRAGG-;nodes;AL;5|
              |BRAGG-;children;AL;6| (47 . =) (53 . |children|) (58 . |node?|)
              (64 . |node?|) (70 . =) (76 . =) (82 . |member?|)
              (88 . |member?|) (|OutputForm|) (94 . |coerce|) (99 . |coerce|)
              (104 . |bracket|) (109 . |coerce|) (|NonNegativeInteger|)
              (114 . |#|) (119 . |cyclic?|) |BRAGG-;cyclic?;AB;13|
              (124 . |eq?|) (130 . |setleft!|) (136 . |setelt|)
              (143 . |setright!|) (149 . |setelt|) '"value")
           '#(|setelt| 156 |nodes| 170 |node?| 175 |member?| 181 |leaves| 187
              |leaf?| 192 |elt| 197 |cyclic?| 209 |coerce| 214 |children| 219 =
              224 |#| 230)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 50
                                                 '(1 6 0 0 8 1 6 0 0 11 1 6 14
                                                   0 15 1 6 14 0 17 1 6 7 0 18
                                                   1 6 19 0 20 2 19 0 0 0 21 1
                                                   6 23 0 24 2 25 0 0 0 26 2 6
                                                   14 0 0 29 1 6 23 0 30 2 6 14
                                                   0 0 31 2 0 14 0 0 32 2 7 14
                                                   0 0 33 2 0 14 0 0 34 2 6 14
                                                   7 0 35 2 0 14 7 0 36 1 7 37
                                                   0 38 1 6 37 0 39 1 37 0 23
                                                   40 1 0 37 0 41 1 0 42 0 43 1
                                                   6 14 0 44 2 6 14 0 0 46 2 6
                                                   0 0 0 47 3 0 0 0 9 0 48 2 6
                                                   0 0 0 49 3 0 0 0 12 0 50 3 0
                                                   0 0 9 0 48 3 0 0 0 12 0 50 1
                                                   0 23 0 27 2 0 14 0 0 32 2 0
                                                   14 7 0 36 1 0 19 0 22 1 0 14
                                                   0 16 2 0 0 0 9 10 2 0 0 0 12
                                                   13 1 0 14 0 45 1 0 37 0 41 1
                                                   0 23 0 28 2 0 14 0 0 34 1 0
                                                   42 0 43)))))
           '|lookupComplete|)) 
