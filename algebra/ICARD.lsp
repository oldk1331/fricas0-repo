
(SDEFUN |ICARD;sig_to_string| ((|sig| (|SExpression|)) (% (|String|)))
        (SPROG ((|sl| (|List| (|SExpression|))))
               (SEQ
                (LETT |sl|
                      (CONS (SPADCALL '|Mapping| (QREFELT % 9))
                            (SPADCALL |sig| (QREFELT % 11))))
                (EXIT (|form2LispString| |sl|))))) 

(SDEFUN |ICARD;get_origin_op| ((|xr| (|Rep|)) (% (|Symbol|)))
        (SPADCALL (SPADCALL (QVELT (QVELT |xr| 2) 2) (QREFELT % 12))
                  (QREFELT % 13))) 

(SDEFUN |ICARD;get_abbreviation| ((|xr| (|Rep|)) (% (|String|)))
        (SPROG ((|abbr| (|SExpression|)))
               (SEQ
                (COND ((EQUAL (QVELT |xr| 1) '|o|) "")
                      ('T
                       (SEQ
                        (LETT |abbr|
                              (|get_database| (QVELT |xr| 0) 'ABBREVIATION))
                        (COND
                         ((NULL (SPADCALL |abbr| (QREFELT % 15)))
                          (EXIT
                           (SPADCALL (SPADCALL |abbr| (QREFELT % 13))
                                     (QREFELT % 17)))))
                        (EXIT ""))))))) 

(SDEFUN |ICARD;get_condition| ((|xr| (|Rep|)) (% (|String|)))
        (COND ((NULL (EQUAL (QVELT |xr| 1) '|o|)) "")
              ('T
               (COND ((SPADCALL (QVELT (QVELT |xr| 2) 1) 'T (QREFELT % 18)) "")
                     ('T (|form2LispString| (QVELT (QVELT |xr| 2) 1))))))) 

(SDEFUN |ICARD;get_exposed1| ((|c| (|Symbol|)) (% (|String|)))
        (COND ((SPADCALL |c| (QREFELT % 20)) "x") ('T "n"))) 

(SDEFUN |ICARD;get_exposed| ((|xr| (|Rep|)) (% (|String|)))
        (COND
         ((NULL (EQUAL (QVELT |xr| 1) '|o|))
          (|ICARD;get_exposed1| (QVELT |xr| 0) %))
         ('T (|ICARD;get_exposed1| (|ICARD;get_origin_op| |xr| %) %)))) 

(SDEFUN |ICARD;get_kind| ((|xr| (|Rep|)) (% (|String|)))
        (SPROG ((|o_kind| (|Symbol|)))
               (SEQ
                (COND
                 ((NULL (EQUAL (QVELT |xr| 1) '|o|))
                  (SPADCALL (QVELT |xr| 1) (QREFELT % 17)))
                 ('T
                  (SEQ
                   (LETT |o_kind|
                         (SPADCALL (|ICARD;get_origin_op| |xr| %)
                                   (QREFELT % 21)))
                   (EXIT
                    (COND ((EQUAL |o_kind| '|category|) "c")
                          ((EQUAL |o_kind| '|domain|) "d")
                          ((EQUAL |o_kind| '|package|) "p")
                          ('T (|error| "get_kind: impossible")))))))))) 

(SDEFUN |ICARD;get_origin| ((|xr| (|Rep|)) (% (|String|)))
        (SPROG ((|os| (|SExpression|)) (|oe| (|SExpression|)))
               (SEQ
                (COND ((NULL (EQUAL (QVELT |xr| 1) '|o|)) "")
                      ('T
                       (SEQ (LETT |oe| (QVELT (QVELT |xr| 2) 2))
                            (COND
                             ((NULL (SPADCALL |oe| (QREFELT % 22))) (EXIT "")))
                            (LETT |os| (SPADCALL |oe| (QREFELT % 12)))
                            (EXIT
                             (COND
                              ((SPADCALL |os| (QREFELT % 23))
                               (SPADCALL (SPADCALL |os| (QREFELT % 13))
                                         (QREFELT % 17)))
                              ('T ""))))))))) 

(SDEFUN |ICARD;convert_params|
        ((|params| (|List| (|SExpression|))) (% (|String|)))
        (SPROG
         ((|rl| (|List| (|String|))) (#1=#:G72 NIL) (|a1| NIL)
          (|first| (|Boolean|)))
         (SEQ
          (COND ((NULL |params|) "")
                ('T
                 (SEQ (LETT |rl| (LIST "(")) (LETT |first| 'T)
                      (SEQ (LETT |a1| NIL) (LETT #1# |params|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |a1| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((NULL |first|) (LETT |rl| (CONS ", " |rl|))))
                            (EXIT
                             (LETT |rl|
                                   (CONS
                                    (SPADCALL (SPADCALL |a1| (QREFELT % 13))
                                              (QREFELT % 17))
                                    |rl|))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (LETT |rl| (CONS ")" |rl|))
                      (EXIT (SPADCALL (NREVERSE |rl|) (QREFELT % 24))))))))) 

(SDEFUN |ICARD;get_params| ((|xr| (|Rep|)) (% (|String|)))
        (SPROG ((|cf| (|SExpression|)) (|op| (|Symbol|)))
               (SEQ
                (COND
                 ((NULL (EQUAL (QVELT |xr| 1) '|o|))
                  (COND
                   ((OR (EQUAL (QVELT |xr| 0) '|Union|)
                        (EQUAL (QVELT |xr| 0) '|Record|))
                    "(a : A, b : B)")
                   (#1='T
                    (|ICARD;convert_params|
                     (SPADCALL (QVELT (QVELT |xr| 2) 2) (QREFELT % 11)) %))))
                 (#1#
                  (SEQ
                   (LETT |op|
                         (SPADCALL
                          (SPADCALL (QVELT (QVELT |xr| 2) 2) (QREFELT % 12))
                          (QREFELT % 13)))
                   (LETT |cf| (SPADCALL |op| (QREFELT % 25)))
                   (EXIT
                    (|ICARD;convert_params|
                     (CDR (SPADCALL |cf| (QREFELT % 11))) %)))))))) 

(SDEFUN |ICARD;short_oform| ((|xr| (|Rep|)) (% (|OutputForm|)))
        (SPADCALL
         (LIST (SPADCALL (QVELT |xr| 0) (QREFELT % 27))
               (SPADCALL " : " (QREFELT % 28))
               (SPADCALL (|ICARD;sig_to_string| (QVELT (QVELT |xr| 2) 0) %)
                         (QREFELT % 28)))
         (QREFELT % 29))) 

(SDEFUN |ICARD;display;%V;12| ((|x| (%)) (% (|Void|)))
        (SPROG ((|xr| (|Rep|)))
               (SEQ (LETT |xr| |x|)
                    (EXIT
                     (SPADCALL (|ICARD;short_oform| |xr| %) (QREFELT % 32)))))) 

(SDEFUN |ICARD;fullDisplay;%V;13| ((|x| (%)) (% (|Void|)))
        (SPROG
         ((|of2| (|OutputForm|)) (|ff| (|OutputForm|)) (|os| (|String|))
          (|ef| (|OutputForm|)) (|cf| (|OutputForm|)) (|cs| (|String|))
          (|of1| (|OutputForm|)) (|xr| (|Rep|)))
         (SEQ (LETT |xr| |x|) (LETT |of1| (|ICARD;short_oform| |xr| %))
              (COND
               ((NULL (EQUAL (QVELT |xr| 1) '|o|))
                (EXIT (SPADCALL |of1| (QREFELT % 32)))))
              (LETT |ef|
                    (COND
                     ((EQUAL (|ICARD;get_exposed| |xr| %) "n")
                      (SPADCALL " (unexposed)" (QREFELT % 28)))
                     (#1='T (SPADCALL (QREFELT % 34)))))
              (LETT |cf|
                    (SEQ (LETT |cs| (|ICARD;get_condition| |xr| %))
                         (EXIT
                          (COND ((EQUAL |cs| "") (SPADCALL (QREFELT % 34)))
                                (#1#
                                 (SPADCALL (SPADCALL " if " (QREFELT % 28))
                                           (SPADCALL |cs| (QREFELT % 28))
                                           (QREFELT % 35)))))))
              (LETT |ef|
                    (COND
                     ((EQUAL (|ICARD;get_exposed| |xr| %) "n")
                      (SPADCALL " (unexposed)" (QREFELT % 28)))
                     (#1# (SPADCALL (QREFELT % 34)))))
              (LETT |os| (|form2LispString| (QVELT (QVELT |xr| 2) 2)))
              (LETT |ff|
                    (SPADCALL (SPADCALL " from " (QREFELT % 28))
                              (SPADCALL |os| (QREFELT % 28)) (QREFELT % 35)))
              (LETT |of2| (SPADCALL (LIST |ff| |cf| |ef|) (QREFELT % 29)))
              (EXIT
               (SPADCALL (SPADCALL |of1| |of2| (QREFELT % 35))
                         (QREFELT % 32)))))) 

(SDEFUN |ICARD;=;2%B;14| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND
         ((OR (SPADCALL |x| |y| (QREFELT % 37))
              (SPADCALL |y| |x| (QREFELT % 37)))
          NIL)
         ('T 'T))) 

(SDEFUN |ICARD;<;2%B;15| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G106 NIL) (|yc| #2=(|String|)) (|xc| #2#) (|yp| #3=(|String|))
          (|xp| #3#) (|yo| #4=(|String|)) (|xo| #4#) (|ys| #5=(|String|))
          (|xs| #5#) (|ye| #6=(|String|)) (|xe| #6#) (|ny| #7=(|Integer|))
          (|nx| #7#) (|yr| (|Rep|)) (|xr| (|Rep|)))
         (SEQ
          (EXIT
           (SEQ (LETT |xr| |x|) (LETT |yr| |y|)
                (COND
                 ((NULL (EQUAL (QVELT |xr| 1) (QVELT |yr| 1)))
                  (EXIT
                   (SPADCALL (QVELT |xr| 1) (QVELT |yr| 1) (QREFELT % 39)))))
                (COND
                 ((NULL (EQUAL (QVELT |xr| 0) (QVELT |yr| 0)))
                  (EXIT
                   (SPADCALL (QVELT |xr| 0) (QVELT |yr| 0) (QREFELT % 39)))))
                (SEQ
                 (LETT |nx| (SPADCALL (QVELT (QVELT |xr| 2) 0) (QREFELT % 41)))
                 (LETT |ny| (SPADCALL (QVELT (QVELT |yr| 2) 0) (QREFELT % 41)))
                 (EXIT
                  (COND
                   ((NULL (EQL |nx| |ny|))
                    (PROGN (LETT #1# (< |nx| |ny|)) (GO #8=#:G104))))))
                (SEQ (LETT |xe| (|ICARD;get_exposed| |xr| %))
                     (LETT |ye| (|ICARD;get_exposed| |yr| %))
                     (EXIT
                      (COND
                       ((NULL (EQUAL |xe| |ye|))
                        (PROGN (LETT #1# (CGREATERP |ye| |xe|)) (GO #8#))))))
                (SEQ
                 (LETT |xs| (|ICARD;sig_to_string| (QVELT (QVELT |xr| 2) 0) %))
                 (LETT |ys| (|ICARD;sig_to_string| (QVELT (QVELT |yr| 2) 0) %))
                 (EXIT
                  (COND
                   ((NULL (EQUAL |xs| |ys|))
                    (PROGN (LETT #1# (CGREATERP |ys| |xs|)) (GO #8#))))))
                (SEQ (LETT |xo| (|ICARD;get_origin| |xr| %))
                     (LETT |yo| (|ICARD;get_origin| |yr| %))
                     (EXIT
                      (COND
                       ((NULL (EQUAL |xo| |yo|))
                        (PROGN (LETT #1# (CGREATERP |yo| |xo|)) (GO #8#))))))
                (SEQ (LETT |xp| (|ICARD;get_params| |xr| %))
                     (LETT |yp| (|ICARD;get_params| |yr| %))
                     (EXIT
                      (COND
                       ((NULL (EQUAL |xp| |yp|))
                        (PROGN (LETT #1# (CGREATERP |yp| |xp|)) (GO #8#))))))
                (SEQ (LETT |xc| (|ICARD;get_condition| |xr| %))
                     (LETT |yc| (|ICARD;get_condition| |yr| %))
                     (EXIT
                      (COND
                       ((NULL (EQUAL |xc| |yc|))
                        (PROGN (LETT #1# (CGREATERP |yc| |xc|)) (GO #8#))))))
                (EXIT
                 (CGREATERP (QVELT (QVELT |yr| 2) 3)
                            (QVELT (QVELT |xr| 2) 3)))))
          #8# (EXIT #1#)))) 

(SDEFUN |ICARD;coerce;%Of;16| ((|x| (%)) (% (|OutputForm|)))
        (|coerceRe2E| |x|
                      (ELT
                       (|Record| (|:| |name| (|Symbol|))
                                 (|:| |kind| (|Symbol|))
                                 (|:| |sd|
                                      (|Record|
                                       (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|)))))
                       0))) 

(SDEFUN |ICARD;elt;%SS;17| ((|x| (%)) (|s| (|Symbol|)) (% (|String|)))
        (SPROG ((#1=#:G121 NIL) (|xr| (|Rep|)))
               (SEQ (LETT |xr| |x|)
                    (EXIT
                     (COND
                      ((EQUAL |s| '|abbreviation|)
                       (|ICARD;get_abbreviation| |xr| %))
                      ((EQUAL |s| '|condition|) (|ICARD;get_condition| |xr| %))
                      ((EQUAL |s| '|exposed|) (|ICARD;get_exposed| |xr| %))
                      ((EQUAL |s| '|doc|) (QVELT (QVELT |xr| 2) 3))
                      ((EQUAL |s| '|kind|) (|ICARD;get_kind| |xr| %))
                      ((EQUAL |s| '|name|)
                       (SPADCALL (QVELT |xr| 0) (QREFELT % 17)))
                      ((EQUAL |s| '|nargs|)
                       (STRINGIMAGE
                        (- (SPADCALL (QVELT (QVELT |xr| 2) 0) (QREFELT % 41))
                           1)))
                      ((EQUAL |s| '|origin|) (|ICARD;get_origin| |xr| %))
                      ((EQUAL |s| '|params|) (|ICARD;get_params| |xr| %))
                      ('T
                       (SEQ
                        (EXIT
                         (COND
                          ((EQUAL |s| '|type|)
                           (PROGN
                            (LETT #1#
                                  (|ICARD;sig_to_string|
                                   (QVELT (QVELT |xr| 2) 0) %))
                            (GO #2=#:G110)))))
                        #2# (EXIT #1#)))))))) 

(DECLAIM (NOTINLINE |IndexCard;|)) 

(DEFUN |IndexCard;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|IndexCard|))
          (LETT % (GETREFV 44))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|IndexCard| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Record| (|:| |name| (|Symbol|)) (|:| |kind| (|Symbol|))
                              (|:| |sd|
                                   (|Record| (|:| |signature| (|SExpression|))
                                             (|:| |condition| (|SExpression|))
                                             (|:| |origin| (|SExpression|))
                                             (|:| |documentation|
                                                  (|String|))))))
          %))) 

(DEFUN |IndexCard| ()
  (SPROG NIL
         (PROG (#1=#:G123)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|IndexCard|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|IndexCard|
                             (LIST (CONS NIL (CONS 1 (|IndexCard;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|IndexCard|)))))))))) 

(MAKEPROP '|IndexCard| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Symbol|) (|SExpression|)
              (0 . |convert|) (|List| %) (5 . |destruct|) (10 . |car|)
              (15 . |symbol|) (|Boolean|) (20 . |null?|) (|String|)
              (25 . |string|) (30 . =) (|BrowserInformation|)
              (36 . |exposed_constructor?|) (41 . |constructor_kind|)
              (46 . |list?|) (51 . |symbol?|) (56 . |concat|)
              (61 . |constructor_form|) (|OutputForm|) (66 . |coerce|)
              (71 . |message|) (76 . |hconcat|) (|Void|) (|OutputPackage|)
              (81 . |output|) |ICARD;display;%V;12| (86 . |empty|)
              (90 . |hconcat|) |ICARD;fullDisplay;%V;13| |ICARD;<;2%B;15|
              |ICARD;=;2%B;14| (96 . <) (|Integer|) (102 . |#|)
              |ICARD;coerce;%Of;16| |ICARD;elt;%SS;17|)
           '#(~= 107 |smaller?| 113 |min| 119 |max| 125 |latex| 131
              |fullDisplay| 136 |elt| 141 |display| 147 |coerce| 152 >= 157 >
              163 = 169 <= 175 < 181)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL |SetCategory&| NIL |PartialOrder&|
                     |BasicType&|)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|) (|SetCategory|)
                      (|CoercibleTo| 26) (|PartialOrder|) (|BasicType|))
                   (|makeByteWordVec2| 43
                                       '(1 8 0 7 9 1 8 10 0 11 1 8 0 0 12 1 8 7
                                         0 13 1 8 14 0 15 1 7 16 0 17 2 8 14 0
                                         0 18 1 19 14 7 20 1 19 7 7 21 1 8 14 0
                                         22 1 8 14 0 23 1 16 0 10 24 1 19 8 7
                                         25 1 7 26 0 27 1 26 0 16 28 1 26 0 10
                                         29 1 31 30 26 32 0 26 0 34 2 26 0 0 0
                                         35 2 7 14 0 0 39 1 8 40 0 41 2 0 14 0
                                         0 1 2 0 14 0 0 1 2 0 0 0 0 1 2 0 0 0 0
                                         1 1 0 16 0 1 1 0 30 0 36 2 0 16 0 7 43
                                         1 0 30 0 33 1 0 26 0 42 2 0 14 0 0 1 2
                                         0 14 0 0 1 2 0 14 0 0 38 2 0 14 0 0 1
                                         2 0 14 0 0 37)))))
           '|lookupComplete|)) 
