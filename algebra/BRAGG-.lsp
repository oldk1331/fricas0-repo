
(DEFUN |BRAGG-;elt;AleftA;1| (|x| T3 $) (SPADCALL |x| (QREFELT $ 8))) 

(DEFUN |BRAGG-;elt;ArightA;2| (|x| T4 $) (SPADCALL |x| (QREFELT $ 11))) 

(DEFUN |BRAGG-;leaf?;AB;3| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 15)) 'T)
        ((SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 15))
         (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 15)))
        ('T 'NIL))) 

(DEFUN |BRAGG-;leaves;AL;4| (|t| $)
  (COND ((SPADCALL |t| (QREFELT $ 15)) NIL)
        ((SPADCALL |t| (QREFELT $ 17)) (LIST (SPADCALL |t| (QREFELT $ 18))))
        ('T
         (SPADCALL (SPADCALL (SPADCALL |t| (QREFELT $ 8)) (QREFELT $ 20))
                   (SPADCALL (SPADCALL |t| (QREFELT $ 11)) (QREFELT $ 20))
                   (QREFELT $ 21))))) 

(DEFUN |BRAGG-;nodes;AL;5| (|x| $)
  (PROG (|l|)
    (RETURN
     (SEQ (LETT |l| NIL |BRAGG-;nodes;AL;5|)
          (EXIT
           (COND ((SPADCALL |x| (QREFELT $ 15)) |l|)
                 ('T
                  (SPADCALL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 24))
                   (SPADCALL (LIST |x|)
                             (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                       (QREFELT $ 24))
                             (QREFELT $ 26))
                   (QREFELT $ 26))))))))) 

(DEFUN |BRAGG-;children;AL;6| (|x| $)
  (PROG (|l|)
    (RETURN
     (SEQ (LETT |l| NIL |BRAGG-;children;AL;6|)
          (EXIT
           (COND ((SPADCALL |x| (QREFELT $ 15)) |l|)
                 ((SPADCALL (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 15))
                  (LIST (SPADCALL |x| (QREFELT $ 11))))
                 ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 15))
                  (LIST (SPADCALL |x| (QREFELT $ 8))))
                 ('T
                  (LIST (SPADCALL |x| (QREFELT $ 8))
                        (SPADCALL |x| (QREFELT $ 11)))))))))) 

(DEFUN |BRAGG-;node?;2AB;7| (|u| |v| $)
  (PROG (#1=#:G154 #2=#:G157 #3=#:G158 |y|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |v| (QREFELT $ 15)) 'NIL)
             ((SPADCALL |u| |v| (QREFELT $ 29)) 'T)
             ('T
              (SEQ
               (SEQ
                (EXIT
                 (SEQ (LETT |y| NIL . #4=(|BRAGG-;node?;2AB;7|))
                      (LETT #3# (SPADCALL |v| (QREFELT $ 30)) . #4#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |y| (CAR #3#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |u| |y| (QREFELT $ 31))
                          (PROGN
                           (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #2#))
                                 . #4#)
                           (GO #1#))))))
                      (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                #1# (EXIT #1#))
               (EXIT 'NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |BRAGG-;=;2AB;8| (|x| |y| $)
  (COND ((SPADCALL |x| (QREFELT $ 15)) (SPADCALL |y| (QREFELT $ 15)))
        ((OR
          (OR (SPADCALL |y| (QREFELT $ 15))
              (NULL
               (SPADCALL (SPADCALL |x| (QREFELT $ 18))
                         (SPADCALL |y| (QREFELT $ 18)) (QREFELT $ 33))))
          (NULL
           (SPADCALL (SPADCALL |x| (QREFELT $ 8)) (SPADCALL |y| (QREFELT $ 8))
                     (QREFELT $ 29))))
         'NIL)
        ('T
         (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (SPADCALL |y| (QREFELT $ 11))
                   (QREFELT $ 29))))) 

(DEFUN |BRAGG-;member?;SAB;9| (|x| |u| $)
  (COND ((SPADCALL |u| (QREFELT $ 15)) 'NIL)
        ((OR (SPADCALL |x| (SPADCALL |u| (QREFELT $ 18)) (QREFELT $ 33))
             (SPADCALL |x| (SPADCALL |u| (QREFELT $ 8)) (QREFELT $ 35)))
         'T)
        ('T (SPADCALL |x| (SPADCALL |u| (QREFELT $ 11)) (QREFELT $ 35))))) 

(DEFUN |BRAGG-;coerce;AOf;10| (|t| $)
  (PROG (|r| |l| |v|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |t| (QREFELT $ 15)) "[]")
            (#1='T
             (SEQ
              (LETT |v| (SPADCALL (SPADCALL |t| (QREFELT $ 18)) (QREFELT $ 38))
                    . #2=(|BRAGG-;coerce;AOf;10|))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |t| (QREFELT $ 8)) (QREFELT $ 15))
                 (COND
                  ((SPADCALL (SPADCALL |t| (QREFELT $ 11)) (QREFELT $ 15)) |v|)
                  (#1#
                   (SEQ
                    (LETT |r|
                          (SPADCALL (SPADCALL |t| (QREFELT $ 11))
                                    (QREFELT $ 39))
                          . #2#)
                    (EXIT (SPADCALL (LIST "." |v| |r|) (QREFELT $ 40)))))))
                (#1#
                 (SEQ
                  (LETT |l|
                        (SPADCALL (SPADCALL |t| (QREFELT $ 8)) (QREFELT $ 39))
                        . #2#)
                  (LETT |r|
                        (COND
                         ((SPADCALL (SPADCALL |t| (QREFELT $ 11))
                                    (QREFELT $ 15))
                          ".")
                         (#1#
                          (SPADCALL (SPADCALL |t| (QREFELT $ 11))
                                    (QREFELT $ 39))))
                        . #2#)
                  (EXIT (SPADCALL (LIST |l| |v| |r|) (QREFELT $ 40)))))))))))))) 

(DEFUN |BRAGG-;#;ANni;11| (|x| $) (|BRAGG-;aggCount| |x| 0 $)) 

(DEFUN |BRAGG-;aggCount| (|x| |k| $)
  (PROG (#1=#:G181 |y|)
    (RETURN
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
                       (LETT #1# (SPADCALL |x| (QREFELT $ 30)) . #2#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#) . #2#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT (LETT |k| (|BRAGG-;aggCount| |y| |k| $) . #2#)))
                       (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                  (EXIT |k|)))))))) 

(DEFUN |BRAGG-;cyclic?;AB;13| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 15)) 'NIL)
        ('T (|BRAGG-;isCycle?| |x| NIL $)))) 

(DEFUN |BRAGG-;isCycle?| (|x| |acc| $)
  (PROG (#1=#:G186 #2=#:G190 #3=#:G191 |y|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |x| (QREFELT $ 15)) 'NIL)
             ((|BRAGG-;eqMember?| |x| |acc| $) 'T)
             (#4='T
              (SEQ
               (SEQ
                (EXIT
                 (SEQ (LETT |y| NIL . #5=(|BRAGG-;isCycle?|))
                      (LETT #3# (SPADCALL |x| (QREFELT $ 30)) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |y| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND ((SPADCALL |y| (QREFELT $ 15)) 'NIL) (#4# 'T))
                          (COND
                           ((|BRAGG-;isCycle?| |y| |acc| $)
                            (PROGN
                             (LETT #1# (PROGN (LETT #2# 'T . #5#) (GO #2#))
                                   . #5#)
                             (GO #1#))))))))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL)))
                #1# (EXIT #1#))
               (EXIT 'NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |BRAGG-;eqMember?| (|y| |l| $)
  (PROG (#1=#:G193 #2=#:G195 #3=#:G196 |x|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |x| NIL . #4=(|BRAGG-;eqMember?|)) (LETT #3# |l| . #4#)
               G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x| |y| (QREFELT $ 46))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #2#)) . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |BRAGG-;setelt;Aleft2A;16| (|x| T5 |b| $)
  (SPADCALL |x| |b| (QREFELT $ 47))) 

(DEFUN |BRAGG-;setelt;Aright2A;17| (|x| T6 |b| $)
  (SPADCALL |x| |b| (QREFELT $ 49))) 

(DECLAIM (NOTINLINE |BinaryRecursiveAggregate&;|)) 

(DEFUN |BinaryRecursiveAggregate&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
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
           (QSETREFV $ 32 (CONS (|dispatchFunction| |BRAGG-;node?;2AB;7|) $))
           (QSETREFV $ 34 (CONS (|dispatchFunction| |BRAGG-;=;2AB;8|) $))
           (COND
            ((|HasCategory| |#1| '(|finiteAggregate|))
             (QSETREFV $ 36
                       (CONS (|dispatchFunction| |BRAGG-;member?;SAB;9|)
                             $)))))))))
      (COND
       ((|HasCategory| |#2| '(|SetCategory|))
        (QSETREFV $ 41 (CONS (|dispatchFunction| |BRAGG-;coerce;AOf;10|) $))))
      (COND
       ((|HasCategory| |#1| '(|finiteAggregate|))
        (PROGN
         (QSETREFV $ 43 (CONS (|dispatchFunction| |BRAGG-;#;ANni;11|) $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 48
                   (CONS (|dispatchFunction| |BRAGG-;setelt;Aleft2A;16|) $))
         (QSETREFV $ 50
                   (CONS (|dispatchFunction| |BRAGG-;setelt;Aright2A;17|)
                         $)))))
      $)))) 

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
