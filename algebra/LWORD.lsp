
(SDEFUN |LWORD;lyndon?;OfmB;1|
        ((|w| |OrderedFreeMonoid| |VarSet|) ($ |Boolean|))
        (SPROG ((|f| (|OrderedFreeMonoid| |VarSet|)) (#1=#:G115 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |w| (|spadConstant| $ 9) (QREFELT $ 11)) 'NIL)
                  ('T
                   (SEQ
                    (LETT |f| (SPADCALL |w| (QREFELT $ 12))
                          . #2=(|LWORD;lyndon?;OfmB;1|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |f| (|spadConstant| $ 9) (QREFELT $ 13)))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |w| |f| (QREFELT $ 14)))
                             (PROGN (LETT #1# 'NIL . #2#) (GO #1#)))
                            ('T
                             (LETT |f| (SPADCALL |f| (QREFELT $ 12)) . #2#)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT 'T)))))
                #1# (EXIT #1#)))) 

(SDEFUN |LWORD;lyndonIfCan;OfmU;2|
        ((|w| |OrderedFreeMonoid| |VarSet|) ($ |Union| $ "failed"))
        (SPROG ((|l| (|List| $)))
               (SEQ
                (LETT |l| (SPADCALL |w| (QREFELT $ 17))
                      |LWORD;lyndonIfCan;OfmU;2|)
                (EXIT
                 (COND
                  ((EQL (SPADCALL |l| (QREFELT $ 20)) 1)
                   (CONS 0 (SPADCALL |l| (QREFELT $ 21))))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |LWORD;lyndon;Ofm$;3| ((|w| |OrderedFreeMonoid| |VarSet|) ($ $))
        (SPROG ((|l| (|List| $)))
               (SEQ
                (LETT |l| (SPADCALL |w| (QREFELT $ 17)) |LWORD;lyndon;Ofm$;3|)
                (EXIT
                 (COND
                  ((EQL (SPADCALL |l| (QREFELT $ 20)) 1)
                   (SPADCALL |l| (QREFELT $ 21)))
                  ('T (|error| "This word is not a Lyndon word"))))))) 

(SDEFUN |LWORD;LetterList|
        ((|w| |OrderedFreeMonoid| |VarSet|) ($ |List| |VarSet|))
        (COND ((SPADCALL |w| (|spadConstant| $ 9) (QREFELT $ 11)) NIL)
              ('T
               (CONS (SPADCALL |w| (QREFELT $ 25))
                     (|LWORD;LetterList| (SPADCALL |w| (QREFELT $ 12)) $))))) 

(SDEFUN |LWORD;factor1|
        ((|gauche| . #1=(|List| $)) (|x| $) (|droite| . #2=(|List| $))
         ($ |List| $))
        (SPROG ((#3=#:G133 NIL) (|g| #1#) (|d| #2#))
               (SEQ
                (EXIT
                 (SEQ (LETT |g| |gauche| . #4=(|LWORD;factor1|))
                      (LETT |d| |droite| . #4#)
                      (SEQ G190
                           (COND
                            ((NULL
                              (COND ((SPADCALL |g| (QREFELT $ 26)) 'NIL)
                                    ('T 'T)))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |g| '|first| (QREFELT $ 28))
                                         |x| (QREFELT $ 29))
                               (SEQ
                                (LETT |x|
                                      (SPADCALL
                                       (SPADCALL |g| '|first| (QREFELT $ 28))
                                       |x| (QREFELT $ 30))
                                      . #4#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |d| (QREFELT $ 26))
                                   (LETT |g| (SPADCALL |g| (QREFELT $ 31))
                                         . #4#))
                                  ('T
                                   (SEQ
                                    (LETT |g|
                                          (SPADCALL |x|
                                                    (SPADCALL |g|
                                                              (QREFELT $ 31))
                                                    (QREFELT $ 32))
                                          . #4#)
                                    (LETT |x| (SPADCALL |d| (QREFELT $ 21))
                                          . #4#)
                                    (EXIT
                                     (LETT |d| (SPADCALL |d| (QREFELT $ 31))
                                           . #4#))))))))
                              ('T
                               (SEQ
                                (LETT |d| (SPADCALL |x| |d| (QREFELT $ 32))
                                      . #4#)
                                (LETT |x| (SPADCALL |g| (QREFELT $ 21)) . #4#)
                                (EXIT
                                 (LETT |g| (SPADCALL |g| (QREFELT $ 31))
                                       . #4#)))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (PROGN
                        (LETT #3# (SPADCALL |x| |d| (QREFELT $ 32)) . #4#)
                        (GO #3#)))))
                #3# (EXIT #3#)))) 

(SDEFUN |LWORD;factor;OfmL;6| ((|w| |OrderedFreeMonoid| |VarSet|) ($ |List| $))
        (SPROG ((|l| (|List| $)) (#1=#:G138 NIL) (|u| NIL) (#2=#:G137 NIL))
               (SEQ
                (COND ((SPADCALL |w| (|spadConstant| $ 9) (QREFELT $ 11)) NIL)
                      ('T
                       (SEQ
                        (LETT |l|
                              (SPADCALL
                               (PROGN
                                (LETT #2# NIL . #3=(|LWORD;factor;OfmL;6|))
                                (SEQ (LETT |u| NIL . #3#)
                                     (LETT #1# (|LWORD;LetterList| |w| $)
                                           . #3#)
                                     G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN
                                            (LETT |u| (CAR #1#) . #3#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL |u| (QREFELT $ 33))
                                              #2#)
                                             . #3#)))
                                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               (QREFELT $ 34))
                              . #3#)
                        (EXIT
                         (|LWORD;factor1| (SPADCALL |l| (QREFELT $ 31))
                          (SPADCALL |l| (QREFELT $ 21)) NIL $)))))))) 

(SDEFUN |LWORD;<;2$B;7| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((|ly| #1=(|PositiveInteger|)) (|lx| #1#))
               (SEQ
                (LETT |lx| (SPADCALL |x| (QREFELT $ 36))
                      . #2=(|LWORD;<;2$B;7|))
                (LETT |ly| (SPADCALL |y| (QREFELT $ 36)) . #2#)
                (EXIT
                 (COND ((EQL |lx| |ly|) (SPADCALL |x| |y| (QREFELT $ 29)))
                       ('T (< |lx| |ly|))))))) 

(SDEFUN |LWORD;coerce;$Of;8| ((|x| $) ($ |OutputForm|))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 38)) (QREFELT $ 40))
                  (QREFELT $ 41))) 

(PUT '|LWORD;coerce;$M;9| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |LWORD;coerce;$M;9| ((|x| $) ($ |Magma| |VarSet|)) |x|) 

(SDEFUN |LWORD;LyndonWordsList1;LPiOda;10|
        ((|vl| |List| |VarSet|) (|n| |PositiveInteger|)
         ($ |OneDimensionalArray| (|List| $)))
        (SPROG
         ((#1=#:G160 NIL) (|lbase1| (|List| $)) (#2=#:G167 NIL) (|b| NIL)
          (#3=#:G166 NIL) (|a| NIL) (#4=#:G165 NIL) (|i| NIL) (#5=#:G164 NIL)
          (#6=#:G163 NIL) (|ll| NIL) (#7=#:G162 NIL) (|w| NIL) (#8=#:G161 NIL)
          (|base| (|OneDimensionalArray| (|List| $))) (#9=#:G144 NIL))
         (SEQ
          (EXIT
           (COND ((NULL |vl|) (|error| "empty list"))
                 ('T
                  (SEQ
                   (LETT |base|
                         (SPADCALL
                          (PROG1
                              (LETT #9# |n|
                                    . #10=(|LWORD;LyndonWordsList1;LPiOda;10|))
                            (|check_subtype| (>= #9# 0) '(|NonNegativeInteger|)
                                             #9#))
                          NIL (QREFELT $ 45))
                         . #10#)
                   (LETT |lbase1|
                         (PROGN
                          (LETT #8# NIL . #10#)
                          (SEQ (LETT |w| NIL . #10#)
                               (LETT #7# (SPADCALL |vl| (QREFELT $ 47)) . #10#)
                               G190
                               (COND
                                ((OR (ATOM #7#)
                                     (PROGN (LETT |w| (CAR #7#) . #10#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #8#
                                       (CONS (SPADCALL |w| (QREFELT $ 33)) #8#)
                                       . #10#)))
                               (LETT #7# (CDR #7#) . #10#) (GO G190) G191
                               (EXIT (NREVERSE #8#))))
                         . #10#)
                   (SPADCALL |base| 1 |lbase1| (QREFELT $ 49))
                   (SEQ (LETT |ll| 2 . #10#) G190
                        (COND ((|greater_SI| |ll| |n|) (GO G191)))
                        (SEQ (LETT |lbase1| NIL . #10#)
                             (SEQ (LETT |a| NIL . #10#)
                                  (LETT #6# (SPADCALL |base| 1 (QREFELT $ 50))
                                        . #10#)
                                  G190
                                  (COND
                                   ((OR (ATOM #6#)
                                        (PROGN
                                         (LETT |a| (CAR #6#) . #10#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ (LETT |b| NIL . #10#)
                                         (LETT #5#
                                               (SPADCALL |base| (- |ll| 1)
                                                         (QREFELT $ 50))
                                               . #10#)
                                         G190
                                         (COND
                                          ((OR (ATOM #5#)
                                               (PROGN
                                                (LETT |b| (CAR #5#) . #10#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((SPADCALL |a| |b| (QREFELT $ 29))
                                             (LETT |lbase1|
                                                   (SPADCALL
                                                    (SPADCALL |a| |b|
                                                              (QREFELT $ 30))
                                                    |lbase1| (QREFELT $ 32))
                                                   . #10#)))))
                                         (LETT #5# (CDR #5#) . #10#) (GO G190)
                                         G191 (EXIT NIL))))
                                  (LETT #6# (CDR #6#) . #10#) (GO G190) G191
                                  (EXIT NIL))
                             (SEQ (LETT |i| 2 . #10#)
                                  (LETT #4# (- |ll| 1) . #10#) G190
                                  (COND ((|greater_SI| |i| #4#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ (LETT |a| NIL . #10#)
                                         (LETT #3#
                                               (SPADCALL |base| |i|
                                                         (QREFELT $ 50))
                                               . #10#)
                                         G190
                                         (COND
                                          ((OR (ATOM #3#)
                                               (PROGN
                                                (LETT |a| (CAR #3#) . #10#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SEQ (LETT |b| NIL . #10#)
                                                (LETT #2#
                                                      (SPADCALL |base|
                                                                (- |ll| |i|)
                                                                (QREFELT $ 50))
                                                      . #10#)
                                                G190
                                                (COND
                                                 ((OR (ATOM #2#)
                                                      (PROGN
                                                       (LETT |b| (CAR #2#)
                                                             . #10#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |a| |b|
                                                              (QREFELT $ 29))
                                                    (COND
                                                     ((OR
                                                       (SPADCALL |b|
                                                                 (SPADCALL |a|
                                                                           (QREFELT
                                                                            $
                                                                            51))
                                                                 (QREFELT $
                                                                          29))
                                                       (SPADCALL |b|
                                                                 (SPADCALL |a|
                                                                           (QREFELT
                                                                            $
                                                                            51))
                                                                 (QREFELT $
                                                                          52)))
                                                      (LETT |lbase1|
                                                            (SPADCALL
                                                             (SPADCALL |a| |b|
                                                                       (QREFELT
                                                                        $ 30))
                                                             |lbase1|
                                                             (QREFELT $ 32))
                                                            . #10#)))))))
                                                (LETT #2# (CDR #2#) . #10#)
                                                (GO G190) G191 (EXIT NIL))))
                                         (LETT #3# (CDR #3#) . #10#) (GO G190)
                                         G191 (EXIT NIL))))
                                  (LETT |i| (|inc_SI| |i|) . #10#) (GO G190)
                                  G191 (EXIT NIL))
                             (EXIT
                              (SPADCALL |base| |ll|
                                        (SPADCALL (ELT $ 29) |lbase1|
                                                  (QREFELT $ 54))
                                        (QREFELT $ 49))))
                        (LETT |ll| (|inc_SI| |ll|) . #10#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT (PROGN (LETT #1# |base| . #10#) (GO #1#)))))))
          #1# (EXIT #1#)))) 

(SDEFUN |LWORD;LyndonWordsList;LPiL;11|
        ((|vl| |List| |VarSet|) (|n| |PositiveInteger|) ($ |List| $))
        (SPROG
         ((#1=#:G169 NIL) (#2=#:G168 #3=(|List| $)) (#4=#:G170 #3#) (|i| NIL)
          (|v| (|OneDimensionalArray| (|List| $))))
         (SEQ
          (LETT |v| (SPADCALL |vl| |n| (QREFELT $ 56))
                . #5=(|LWORD;LyndonWordsList;LPiL;11|))
          (EXIT
           (PROGN
            (LETT #1# NIL . #5#)
            (SEQ (LETT |i| 1 . #5#) G190
                 (COND ((|greater_SI| |i| |n|) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #4# (SPADCALL |v| |i| (QREFELT $ 50)) . #5#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 57)) . #5#))
                     ('T (PROGN (LETT #2# #4# . #5#) (LETT #1# 'T . #5#)))))))
                 (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (SPADCALL (QREFELT $ 58))))))))) 

(DECLAIM (NOTINLINE |LyndonWord;|)) 

(DEFUN |LyndonWord| (#1=#:G176)
  (SPROG NIL
         (PROG (#2=#:G177)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|LyndonWord|)
                                               '|domainEqualList|)
                    . #3=(|LyndonWord|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|LyndonWord;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|LyndonWord|)))))))))) 

(DEFUN |LyndonWord;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|LyndonWord|))
          (LETT |dv$| (LIST '|LyndonWord| DV$1) . #1#)
          (LETT $ (GETREFV 64) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|LyndonWord| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|Magma| |#1|))
          $))) 

(MAKEPROP '|LyndonWord| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Magma| 6) (|local| |#1|) '|Rep|
              (|OrderedFreeMonoid| 6) (0 . |One|) (|Boolean|) (4 . =)
              (10 . |rest|) (15 . ~=) (21 . |lexico|) |LWORD;lyndon?;OfmB;1|
              (|List| $) |LWORD;factor;OfmL;6| (|NonNegativeInteger|)
              (|List| $$) (27 . |#|) (32 . |first|) (|Union| $ '"failed")
              |LWORD;lyndonIfCan;OfmU;2| |LWORD;lyndon;Ofm$;3| (37 . |first|)
              (42 . |null|) '"first" (47 . |elt|) (53 . |lexico|) (59 . *)
              (65 . |rest|) (70 . |cons|) (76 . |coerce|) (81 . |reverse|)
              (|PositiveInteger|) (86 . |length|) |LWORD;<;2$B;7|
              (91 . |coerce|) (|OutputForm|) (96 . |coerce|) (101 . |bracket|)
              |LWORD;coerce;$Of;8| |LWORD;coerce;$M;9|
              (|OneDimensionalArray| 19) (106 . |new|) (|List| 6)
              (112 . |sort|) (|Integer|) (117 . |setelt|) (124 . |elt|)
              (130 . |right|) (135 . =) (|Mapping| 10 $$ $$) (141 . |sort!|)
              (|OneDimensionalArray| 16) |LWORD;LyndonWordsList1;LPiOda;10|
              (147 . |append|) (153 . |nil|) |LWORD;LyndonWordsList;LPiL;11|
              (|Union| 6 '"failed") (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 157 |varList| 163 |smaller?| 168 |right| 174 |retractable?|
              179 |retractIfCan| 184 |retract| 189 |min| 194 |max| 200
              |lyndonIfCan| 206 |lyndon?| 211 |lyndon| 216 |lexico| 221
              |length| 227 |left| 232 |latex| 237 |hashUpdate!| 242 |hash| 248
              |factor| 253 |coerce| 258 |LyndonWordsList1| 278
              |LyndonWordsList| 284 >= 290 > 296 = 302 <= 308 < 314)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL |SetCategory&| |BasicType&|
                     |RetractableTo&| |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|) (|SetCategory|)
                      (|BasicType|) (|RetractableTo| 6) (|PartialOrder|)
                      (|CoercibleTo| 39))
                   (|makeByteWordVec2| 63
                                       '(0 8 0 9 2 8 10 0 0 11 1 8 0 0 12 2 8
                                         10 0 0 13 2 8 10 0 0 14 1 19 18 0 20 1
                                         19 2 0 21 1 8 6 0 25 1 19 10 0 26 2 19
                                         2 0 27 28 2 0 10 0 0 29 2 7 0 0 0 30 1
                                         19 0 0 31 2 19 0 2 0 32 1 0 0 6 33 1
                                         19 0 0 34 1 0 35 0 36 1 0 8 0 38 1 8
                                         39 0 40 1 39 0 0 41 2 44 0 18 19 45 1
                                         46 0 0 47 3 44 19 0 48 19 49 2 44 19 0
                                         48 50 1 0 0 0 51 2 0 10 0 0 52 2 19 0
                                         53 0 54 2 19 0 0 0 57 0 19 0 58 2 0 10
                                         0 0 1 1 0 46 0 1 2 0 10 0 0 1 1 0 0 0
                                         51 1 0 10 0 1 1 0 60 0 1 1 0 6 0 1 2 0
                                         0 0 0 1 2 0 0 0 0 1 1 0 22 8 23 1 0 10
                                         8 15 1 0 0 8 24 2 0 10 0 0 29 1 0 35 0
                                         36 1 0 0 0 1 1 0 62 0 1 2 0 61 61 0 1
                                         1 0 63 0 1 1 0 16 8 17 1 0 8 0 38 1 0
                                         5 0 43 1 0 0 6 33 1 0 39 0 42 2 0 55
                                         46 35 56 2 0 16 46 35 59 2 0 10 0 0 1
                                         2 0 10 0 0 1 2 0 10 0 0 52 2 0 10 0 0
                                         1 2 0 10 0 0 37)))))
           '|lookupComplete|)) 
