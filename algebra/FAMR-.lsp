
(SDEFUN |FAMR-;pomopo!;SRE2S;1| ((|p1| S) (|r| R) (|e| E) (|p2| S) ($ S))
        (SPROG NIL
               (SPADCALL |p1|
                         (SPADCALL |r|
                                   (SPADCALL
                                    (CONS #'|FAMR-;pomopo!;SRE2S;1!0|
                                          (VECTOR $ |e|))
                                    |p2| (QREFELT $ 11))
                                   (QREFELT $ 12))
                         (QREFELT $ 13)))) 

(SDEFUN |FAMR-;pomopo!;SRE2S;1!0| ((|x1| NIL) ($$ NIL))
        (PROG (|e| $)
          (LETT |e| (QREFELT $$ 1) . #1=(|FAMR-;pomopo!;SRE2S;1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |e| (QREFELT $ 9)))))) 

(SDEFUN |FAMR-;binomThmExpt;2SNniS;2|
        ((|x| S) (|y| S) (|nn| |NonNegativeInteger|) ($ S))
        (SPROG
         ((|yn| (S)) (|i| (|NonNegativeInteger|)) (|bincoef| (|Integer|))
          (|ans| (S)) (#1=#:G127 NIL) (|xn| NIL) (|powl| (|List| S)))
         (SEQ
          (COND ((EQL |nn| 0) (|spadConstant| $ 17))
                ('T
                 (SEQ
                  (LETT |powl| (LIST |x|) . #2=(|FAMR-;binomThmExpt;2SNniS;2|))
                  (SEQ (LETT |i| 2 . #2#) G190
                       (COND ((|greater_SI| |i| |nn|) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |powl|
                               (CONS
                                (SPADCALL |x| (|SPADfirst| |powl|)
                                          (QREFELT $ 18))
                                |powl|)
                               . #2#)))
                       (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (LETT |yn| |y| . #2#) (LETT |ans| (|SPADfirst| |powl|) . #2#)
                  (LETT |i| 1 . #2#) (LETT |bincoef| |nn| . #2#)
                  (SEQ (LETT |xn| NIL . #2#) (LETT #1# (CDR |powl|) . #2#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |xn| (CAR #1#) . #2#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ans|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |bincoef| |xn| (QREFELT $ 20)) |yn|
                                (QREFELT $ 18))
                               |ans| (QREFELT $ 13))
                              . #2#)
                        (LETT |bincoef|
                              (QUOTIENT2 (* (- |nn| |i|) |bincoef|) (+ |i| 1))
                              . #2#)
                        (LETT |i| (+ |i| 1) . #2#)
                        (EXIT
                         (LETT |yn| (SPADCALL |y| |yn| (QREFELT $ 18)) . #2#)))
                       (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL |ans| |yn| (QREFELT $ 13))))))))) 

(SDEFUN |FAMR-;ground?;SB;3| ((|x| S) ($ |Boolean|))
        (COND ((QEQCAR (SPADCALL |x| (QREFELT $ 24)) 1) 'NIL) ('T 'T))) 

(SDEFUN |FAMR-;ground;SR;4| ((|x| S) ($ R)) (SPADCALL |x| (QREFELT $ 27))) 

(SDEFUN |FAMR-;mapExponents;M2S;5| ((|fn| |Mapping| E E) (|x| S) ($ S))
        (COND ((SPADCALL |x| (QREFELT $ 29)) (|spadConstant| $ 15))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT $ 30))
                          (SPADCALL (SPADCALL |x| (QREFELT $ 31)) |fn|)
                          (QREFELT $ 32))
                (SPADCALL |fn| (SPADCALL |x| (QREFELT $ 33)) (QREFELT $ 11))
                (QREFELT $ 13))))) 

(SDEFUN |FAMR-;coefficients;SL;6| ((|x| S) ($ |List| R))
        (COND ((SPADCALL |x| (QREFELT $ 29)) NIL)
              ('T
               (CONS (SPADCALL |x| (QREFELT $ 30))
                     (SPADCALL (SPADCALL |x| (QREFELT $ 33)) (QREFELT $ 36)))))) 

(SDEFUN |FAMR-;/;SRS;7| ((|x| S) (|r| R) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|FAMR-;/;SRS;7!0| (VECTOR $ |r|)) |x|
                         (QREFELT $ 40)))) 

(SDEFUN |FAMR-;/;SRS;7!0| ((|x1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|FAMR-;/;SRS;7|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |r| (QREFELT $ 38)))))) 

(SDEFUN |FAMR-;exquo;SRU;8| ((|x| S) (|r| R) ($ |Union| S "failed"))
        (SPROG ((|ans| (S)) (#1=#:G155 NIL) (|t| (|Union| R "failed")))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |r| (QREFELT $ 42)) (|error| "Division by 0"))
                  ((SPADCALL |x| (QREFELT $ 29))
                   (CONS 0 (|spadConstant| $ 15)))
                  ('T
                   (SEQ
                    (LETT |ans| (|spadConstant| $ 15)
                          . #2=(|FAMR-;exquo;SRU;8|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((SPADCALL |x| (QREFELT $ 29)) 'NIL)
                                  ('T 'T)))
                           (GO G191)))
                         (SEQ
                          (LETT |t|
                                (SPADCALL (SPADCALL |x| (QREFELT $ 30)) |r|
                                          (QREFELT $ 44))
                                . #2#)
                          (EXIT
                           (COND
                            ((QEQCAR |t| 1)
                             (PROGN
                              (LETT #1# (CONS 1 "failed") . #2#)
                              (GO #3=#:G154)))
                            ('T
                             (SEQ
                              (LETT |ans|
                                    (SPADCALL |ans|
                                              (SPADCALL (QCDR |t|)
                                                        (SPADCALL |x|
                                                                  (QREFELT $
                                                                           31))
                                                        (QREFELT $ 32))
                                              (QREFELT $ 13))
                                    . #2#)
                              (EXIT
                               (LETT |x| (SPADCALL |x| (QREFELT $ 33))
                                     . #2#)))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS 0 |ans|))))))
                #3# (EXIT #1#)))) 

(SDEFUN |FAMR-;content;SR;9| ((|x| S) ($ R))
        (SPROG ((|r| (R)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 29)) (|spadConstant| $ 16))
                      ('T
                       (SEQ
                        (LETT |r| (SPADCALL |x| (QREFELT $ 30))
                              . #1=(|FAMR-;content;SR;9|))
                        (LETT |x| (SPADCALL |x| (QREFELT $ 33)) . #1#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND
                                 ((OR (SPADCALL |x| (QREFELT $ 29))
                                      (SPADCALL |r| (|spadConstant| $ 46)
                                                (QREFELT $ 47)))
                                  'NIL)
                                 ('T 'T)))
                               (GO G191)))
                             (SEQ
                              (LETT |r|
                                    (SPADCALL |r| (SPADCALL |x| (QREFELT $ 30))
                                              (QREFELT $ 48))
                                    . #1#)
                              (EXIT
                               (LETT |x| (SPADCALL |x| (QREFELT $ 33)) . #1#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT |r|))))))) 

(SDEFUN |FAMR-;primitivePart;2S;10| ((|x| S) ($ S))
        (SPROG ((#1=#:G163 NIL) (|c| (R)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 29)) |x|)
                      ('T
                       (SEQ
                        (LETT |c| (SPADCALL |x| (QREFELT $ 50))
                              . #2=(|FAMR-;primitivePart;2S;10|))
                        (EXIT
                         (SPADCALL
                          (PROG2
                              (LETT #1# (SPADCALL |x| |c| (QREFELT $ 51))
                                    . #2#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                            (|Union| (QREFELT $ 6) "failed")
                                            #1#))
                          (QREFELT $ 52))))))))) 

(DECLAIM (NOTINLINE |FiniteAbelianMonoidRing&;|)) 

(DEFUN |FiniteAbelianMonoidRing&| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteAbelianMonoidRing&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|FiniteAbelianMonoidRing&| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 54) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|GcdDomain|))
                                              (|HasCategory| |#2|
                                                             '(|EntireRing|))
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 22
                      (CONS (|dispatchFunction| |FAMR-;binomThmExpt;2SNniS;2|)
                            $))))
          (COND
           ((|HasCategory| |#2| '(|Field|))
            (QSETREFV $ 41 (CONS (|dispatchFunction| |FAMR-;/;SRS;7|) $))))
          (COND
           ((|testBitVector| |pv$| 2)
            (QSETREFV $ 45 (CONS (|dispatchFunction| |FAMR-;exquo;SRU;8|) $))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 49 (CONS (|dispatchFunction| |FAMR-;content;SR;9|) $))
             (QSETREFV $ 53
                       (CONS (|dispatchFunction| |FAMR-;primitivePart;2S;10|)
                             $)))))
          $))) 

(MAKEPROP '|FiniteAbelianMonoidRing&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . +) (|Mapping| 8 8) (6 . |mapExponents|)
              (12 . *) (18 . +) |FAMR-;pomopo!;SRE2S;1| (24 . |Zero|)
              (28 . |Zero|) (32 . |One|) (36 . *) (|Integer|) (42 . *)
              (|NonNegativeInteger|) (48 . |binomThmExpt|)
              (|Union| 7 '"failed") (55 . |retractIfCan|) (|Boolean|)
              |FAMR-;ground?;SB;3| (60 . |retract|) |FAMR-;ground;SR;4|
              (65 . |zero?|) (70 . |leadingCoefficient|) (75 . |degree|)
              (80 . |monomial|) (86 . |reductum|) |FAMR-;mapExponents;M2S;5|
              (|List| 7) (91 . |coefficients|) |FAMR-;coefficients;SL;6|
              (96 . /) (|Mapping| 7 7) (102 . |map|) (108 . /) (114 . |zero?|)
              (|Union| $ '"failed") (119 . |exquo|) (125 . |exquo|)
              (131 . |One|) (135 . =) (141 . |gcd|) (147 . |content|)
              (152 . |content|) (157 . |exquo|) (163 . |unitCanonical|)
              (168 . |primitivePart|))
           '#(|primitivePart| 173 |pomopo!| 178 |mapExponents| 186 |ground?|
              192 |ground| 197 |exquo| 202 |content| 208 |coefficients| 213
              |binomThmExpt| 218 / 225)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 53
                                                 '(2 8 0 0 0 9 2 6 0 10 0 11 2
                                                   6 0 7 0 12 2 6 0 0 0 13 0 6
                                                   0 15 0 7 0 16 0 6 0 17 2 6 0
                                                   0 0 18 2 6 0 19 0 20 3 0 0 0
                                                   0 21 22 1 6 23 0 24 1 6 7 0
                                                   27 1 6 25 0 29 1 6 7 0 30 1
                                                   6 8 0 31 2 6 0 7 8 32 1 6 0
                                                   0 33 1 6 35 0 36 2 7 0 0 0
                                                   38 2 6 0 39 0 40 2 0 0 0 7
                                                   41 1 7 25 0 42 2 7 43 0 0 44
                                                   2 0 43 0 7 45 0 7 0 46 2 7
                                                   25 0 0 47 2 7 0 0 0 48 1 0 7
                                                   0 49 1 6 7 0 50 2 6 43 0 7
                                                   51 1 6 0 0 52 1 0 0 0 53 1 0
                                                   0 0 53 4 0 0 0 7 8 0 14 2 0
                                                   0 10 0 34 1 0 25 0 26 1 0 7
                                                   0 28 2 0 43 0 7 45 1 0 7 0
                                                   49 1 0 35 0 37 3 0 0 0 0 21
                                                   22 2 0 0 0 7 41)))))
           '|lookupComplete|)) 
