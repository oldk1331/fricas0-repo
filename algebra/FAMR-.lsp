
(/VERSIONCHECK 2) 

(DEFUN |FAMR-;pomopo!;SRE2S;1| (|p1| |r| |e| |p2| $)
  (PROG ()
    (RETURN
     (SPADCALL |p1|
               (SPADCALL |r|
                         (SPADCALL
                          (CONS #'|FAMR-;pomopo!;SRE2S;1!0| (VECTOR $ |e|))
                          |p2| (QREFELT $ 11))
                         (QREFELT $ 12))
               (QREFELT $ 13))))) 

(DEFUN |FAMR-;pomopo!;SRE2S;1!0| (|x1| $$)
  (PROG (|e| $)
    (LETT |e| (QREFELT $$ 1) . #1=(|FAMR-;pomopo!;SRE2S;1|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |e| (QREFELT $ 9)))))) 

(DEFUN |FAMR-;binomThmExpt;2SNniS;2| (|x| |y| |nn| $)
  (PROG (|yn| |i| |bincoef| |ans| #1=#:G148 |xn| |powl|)
    (RETURN
     (SEQ
      (COND ((EQL |nn| 0) (|spadConstant| $ 17))
            ('T
             (SEQ (LETT |powl| (LIST |x|) . #2=(|FAMR-;binomThmExpt;2SNniS;2|))
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
                  (EXIT (SPADCALL |ans| |yn| (QREFELT $ 13)))))))))) 

(DEFUN |FAMR-;ground?;SB;3| (|x| $)
  (COND ((QEQCAR (SPADCALL |x| (QREFELT $ 25)) 1) 'NIL) ('T 'T))) 

(DEFUN |FAMR-;ground;SR;4| (|x| $) (SPADCALL |x| (QREFELT $ 28))) 

(DEFUN |FAMR-;mapExponents;M2S;5| (|fn| |x| $)
  (COND ((SPADCALL |x| (QREFELT $ 30)) (|spadConstant| $ 15))
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL |x| (QREFELT $ 31))
                    (SPADCALL (SPADCALL |x| (QREFELT $ 32)) |fn|)
                    (QREFELT $ 33))
          (SPADCALL |fn| (SPADCALL |x| (QREFELT $ 34)) (QREFELT $ 11))
          (QREFELT $ 13))))) 

(DEFUN |FAMR-;coefficients;SL;6| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 30)) NIL)
        ('T
         (CONS (SPADCALL |x| (QREFELT $ 31))
               (SPADCALL (SPADCALL |x| (QREFELT $ 34)) (QREFELT $ 37)))))) 

(DEFUN |FAMR-;/;SRS;7| (|x| |r| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|FAMR-;/;SRS;7!0| (VECTOR $ |r|)) |x| (QREFELT $ 41))))) 

(DEFUN |FAMR-;/;SRS;7!0| (|x1| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|FAMR-;/;SRS;7|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |r| (QREFELT $ 39)))))) 

(DEFUN |FAMR-;exquo;SRU;8| (|x| |r| $)
  (PROG (|ans| #1=#:G175 |t|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |r| (QREFELT $ 43)) (|error| "Division by 0"))
             ((SPADCALL |x| (QREFELT $ 30)) (CONS 0 (|spadConstant| $ 15)))
             ('T
              (SEQ
               (LETT |ans| (|spadConstant| $ 15) . #2=(|FAMR-;exquo;SRU;8|))
               (SEQ G190
                    (COND
                     ((NULL
                       (COND ((SPADCALL |x| (QREFELT $ 30)) 'NIL) ('T 'T)))
                      (GO G191)))
                    (SEQ
                     (LETT |t|
                           (SPADCALL (SPADCALL |x| (QREFELT $ 31)) |r|
                                     (QREFELT $ 45))
                           . #2#)
                     (EXIT
                      (COND
                       ((QEQCAR |t| 1)
                        (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#)))
                       ('T
                        (SEQ
                         (LETT |ans|
                               (SPADCALL |ans|
                                         (SPADCALL (QCDR |t|)
                                                   (SPADCALL |x|
                                                             (QREFELT $ 32))
                                                   (QREFELT $ 33))
                                         (QREFELT $ 13))
                               . #2#)
                         (EXIT
                          (LETT |x| (SPADCALL |x| (QREFELT $ 34)) . #2#)))))))
                    NIL (GO G190) G191 (EXIT NIL))
               (EXIT (CONS 0 |ans|))))))
      #1# (EXIT #1#))))) 

(DEFUN |FAMR-;content;SR;9| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 30)) (|spadConstant| $ 16))
            ('T
             (SEQ
              (LETT |r| (SPADCALL |x| (QREFELT $ 31))
                    . #1=(|FAMR-;content;SR;9|))
              (LETT |x| (SPADCALL |x| (QREFELT $ 34)) . #1#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((OR (SPADCALL |x| (QREFELT $ 30))
                            (SPADCALL |r| (|spadConstant| $ 21)
                                      (QREFELT $ 47)))
                        'NIL)
                       ('T 'T)))
                     (GO G191)))
                   (SEQ
                    (LETT |r|
                          (SPADCALL |r| (SPADCALL |x| (QREFELT $ 31))
                                    (QREFELT $ 48))
                          . #1#)
                    (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 34)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))))))) 

(DEFUN |FAMR-;primitivePart;2S;10| (|x| $)
  (PROG (#1=#:G183 |c|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 30)) |x|)
            ('T
             (SEQ
              (LETT |c| (SPADCALL |x| (QREFELT $ 50))
                    . #2=(|FAMR-;primitivePart;2S;10|))
              (EXIT
               (SPADCALL
                (PROG2 (LETT #1# (SPADCALL |x| |c| (QREFELT $ 51)) . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                (QREFELT $ 52)))))))))) 

(DEFUN |FiniteAbelianMonoidRing&| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
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
                                          (|HasCategory| |#2| '(|GcdDomain|))
                                          (|HasCategory| |#2|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 3)
        (QSETREFV $ 23
                  (CONS (|dispatchFunction| |FAMR-;binomThmExpt;2SNniS;2|)
                        $))))
      (COND
       ((|HasCategory| |#2| '(|Field|))
        (QSETREFV $ 42 (CONS (|dispatchFunction| |FAMR-;/;SRS;7|) $))))
      (COND
       ((|testBitVector| |pv$| 2)
        (QSETREFV $ 46 (CONS (|dispatchFunction| |FAMR-;exquo;SRU;8|) $))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 49 (CONS (|dispatchFunction| |FAMR-;content;SR;9|) $))
         (QSETREFV $ 53
                   (CONS (|dispatchFunction| |FAMR-;primitivePart;2S;10|)
                         $)))))
      $)))) 

(MAKEPROP '|FiniteAbelianMonoidRing&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . +) (|Mapping| 8 8) (6 . |mapExponents|)
              (12 . *) (18 . +) |FAMR-;pomopo!;SRE2S;1| (24 . |Zero|)
              (28 . |Zero|) (32 . |One|) (36 . *) (|Integer|) (42 . *)
              (48 . |One|) (|NonNegativeInteger|) (52 . |binomThmExpt|)
              (|Union| 7 '"failed") (59 . |retractIfCan|) (|Boolean|)
              |FAMR-;ground?;SB;3| (64 . |retract|) |FAMR-;ground;SR;4|
              (69 . |zero?|) (74 . |leadingCoefficient|) (79 . |degree|)
              (84 . |monomial|) (90 . |reductum|) |FAMR-;mapExponents;M2S;5|
              (|List| 7) (95 . |coefficients|) |FAMR-;coefficients;SL;6|
              (100 . /) (|Mapping| 7 7) (106 . |map|) (112 . /) (118 . |zero?|)
              (|Union| $ '"failed") (123 . |exquo|) (129 . |exquo|) (135 . =)
              (141 . |gcd|) (147 . |content|) (152 . |content|) (157 . |exquo|)
              (163 . |unitCanonical|) (168 . |primitivePart|))
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
                                                   0 0 18 2 6 0 19 0 20 0 7 0
                                                   21 3 0 0 0 0 22 23 1 6 24 0
                                                   25 1 6 7 0 28 1 6 26 0 30 1
                                                   6 7 0 31 1 6 8 0 32 2 6 0 7
                                                   8 33 1 6 0 0 34 1 6 36 0 37
                                                   2 7 0 0 0 39 2 6 0 40 0 41 2
                                                   0 0 0 7 42 1 7 26 0 43 2 7
                                                   44 0 0 45 2 0 44 0 7 46 2 7
                                                   26 0 0 47 2 7 0 0 0 48 1 0 7
                                                   0 49 1 6 7 0 50 2 6 44 0 7
                                                   51 1 6 0 0 52 1 0 0 0 53 1 0
                                                   0 0 53 4 0 0 0 7 8 0 14 2 0
                                                   0 10 0 35 1 0 26 0 27 1 0 7
                                                   0 29 2 0 44 0 7 46 1 0 7 0
                                                   49 1 0 36 0 38 3 0 0 0 0 22
                                                   23 2 0 0 0 7 42)))))
           '|lookupComplete|)) 
