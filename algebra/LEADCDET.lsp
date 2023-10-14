
(SDEFUN |LEADCDET;polCase;ZNniLB;1|
        ((|d| Z) (|nk| |NonNegativeInteger|) (|lval| |List| Z) ($ |Boolean|))
        (SPROG
         ((|distlist| (|List| Z)) (#1=#:G122 NIL) (|q| (Z)) (|y| (Z))
          (#2=#:G113 NIL) (#3=#:G124 NIL) (#4=#:G112 NIL) (|j| NIL)
          (#5=#:G123 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |distlist| (LIST |d|) . #6=(|LEADCDET;polCase;ZNniLB;1|))
                (SEQ (LETT |i| 1 . #6#) (LETT #5# |nk| . #6#) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (LETT |q|
                            (QVELT
                             (SPADCALL (SPADCALL |lval| |i| (QREFELT $ 12))
                                       (QREFELT $ 14))
                             1)
                            . #6#)
                      (SEQ (LETT |j| 0 . #6#)
                           (LETT #3#
                                 (PROG1 (LETT #4# (- |i| 1) . #6#)
                                   (|check_subtype2| (>= #4# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #4#))
                                 . #6#)
                           G190 (COND ((|greater_SI| |j| #3#) (GO G191)))
                           (SEQ
                            (LETT |y|
                                  (SPADCALL |distlist|
                                            (PROG1 (LETT #2# (- |i| |j|) . #6#)
                                              (|check_subtype2| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #2#))
                                            (QREFELT $ 12))
                                  . #6#)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (SPADCALL |y| (|spadConstant| $ 15)
                                              (QREFELT $ 18)))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |y| (SPADCALL |y| |q| (QREFELT $ 19))
                                        . #6#)
                                  (EXIT
                                   (LETT |q| (SPADCALL |q| |y| (QREFELT $ 20))
                                         . #6#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (COND
                              ((SPADCALL |q| (|spadConstant| $ 15)
                                         (QREFELT $ 21))
                               (PROGN (LETT #1# 'NIL . #6#) (GO #7=#:G121))))))
                           (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (LETT |distlist| (APPEND |distlist| (LIST |q|)) . #6#)))
                     (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #7# (EXIT #1#)))) 

(SDEFUN |LEADCDET;checkpow| ((|a| Z) (|b| Z) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G132 NIL) (|qt| (|Union| Z "failed")) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |i| 0 . #2=(|LEADCDET;checkpow|)) G190 NIL
                      (SEQ (LETT |qt| (SPADCALL |b| |a| (QREFELT $ 25)) . #2#)
                           (COND
                            ((QEQCAR |qt| 1)
                             (PROGN (LETT #1# |i| . #2#) (GO #3=#:G131))))
                           (EXIT (LETT |b| (QCDR |qt|) . #2#)))
                      (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                      (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |LEADCDET;distribute|
        ((|contm| Z) (|unilist| |List| (|SparseUnivariatePolynomial| Z))
         (|pl| |List| P) (|vl| |List| Z) (|lvar| |List| OV) (|lval| |List| Z)
         ($ |Record| (|:| |polfac| (|List| P)) (|:| |correct| Z)
          (|:| |corrfact| (|List| (|SparseUnivariatePolynomial| Z)))))
        (SPROG
         ((#1=#:G141 NIL) (|i| NIL) (|d| (Z)) (|lcp| (Z)) (#2=#:G140 NIL)
          (|nf| (|NonNegativeInteger|)))
         (SEQ (LETT |nf| (LENGTH |unilist|) . #3=(|LEADCDET;distribute|))
              (SEQ (LETT |i| 1 . #3#) (LETT #2# |nf| . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (LETT |lcp|
                          (SPADCALL (SPADCALL |unilist| |i| (QREFELT $ 28))
                                    (QREFELT $ 29))
                          . #3#)
                    (LETT |d|
                          (SPADCALL |lcp| (SPADCALL |vl| |i| (QREFELT $ 12))
                                    (QREFELT $ 19))
                          . #3#)
                    (SPADCALL |pl| |i|
                              (SPADCALL (SPADCALL |lcp| |d| (QREFELT $ 20))
                                        (SPADCALL |pl| |i| (QREFELT $ 31))
                                        (QREFELT $ 32))
                              (QREFELT $ 33))
                    (LETT |d|
                          (SPADCALL (SPADCALL |vl| |i| (QREFELT $ 12)) |d|
                                    (QREFELT $ 20))
                          . #3#)
                    (SPADCALL |unilist| |i|
                              (SPADCALL |d|
                                        (SPADCALL |unilist| |i| (QREFELT $ 28))
                                        (QREFELT $ 34))
                              (QREFELT $ 35))
                    (EXIT
                     (LETT |contm| (SPADCALL |contm| |d| (QREFELT $ 20))
                           . #3#)))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL |contm| (|spadConstant| $ 15) (QREFELT $ 18))
                (SEQ (LETT |i| 1 . #3#) (LETT #1# |nf| . #3#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |pl| |i|
                                 (SPADCALL |contm|
                                           (SPADCALL |pl| |i| (QREFELT $ 31))
                                           (QREFELT $ 32))
                                 (QREFELT $ 33))))
                     (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                     (EXIT NIL))))
              (EXIT (VECTOR |pl| |contm| |unilist|))))) 

(SDEFUN |LEADCDET;distFact;ZLRLLLU;4|
        ((|contm| Z) (|unilist| |List| (|SparseUnivariatePolynomial| Z))
         (|plead| |Record| (|:| |contp| Z)
          (|:| |factors|
               (|List| (|Record| (|:| |irr| P) (|:| |pow| (|Integer|))))))
         (|vl| |List| Z) (|lvar| |List| OV) (|lval| |List| Z)
         ($ |Union|
          (|Record| (|:| |polfac| (|List| P)) (|:| |correct| Z)
                    (|:| |corrfact| (|List| (|SparseUnivariatePolynomial| Z))))
          "failed"))
        (SPROG
         ((#1=#:G180 NIL) (|i| NIL) (#2=#:G179 NIL) (#3=#:G170 NIL)
          (#4=#:G178 NIL) (|k| NIL) (|c| (Z)) (|d| (Z))
          (|h| (|NonNegativeInteger|)) (#5=#:G177 NIL) (#6=#:G176 NIL)
          (|aux| (|List| P)) (#7=#:G175 NIL) (#8=#:G174 NIL) (|vlp| (|List| Z))
          (#9=#:G173 NIL) (#10=#:G172 NIL) (|lexp| (|List| (|Integer|)))
          (|lpol| (|List| P)) (#11=#:G171 NIL) (|fpl| NIL)
          (|nf| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |lpol| NIL . #12=(|LEADCDET;distFact;ZLRLLLU;4|))
                (LETT |lexp| NIL . #12#) (LETT |nf| (LENGTH |unilist|) . #12#)
                (LETT |vl| (REVERSE |vl|) . #12#)
                (SEQ (LETT |fpl| NIL . #12#) (LETT #11# (QCDR |plead|) . #12#)
                     G190
                     (COND
                      ((OR (ATOM #11#)
                           (PROGN (LETT |fpl| (CAR #11#) . #12#) NIL))
                       (GO G191)))
                     (SEQ (LETT |lpol| (CONS (QCAR |fpl|) |lpol|) . #12#)
                          (EXIT
                           (LETT |lexp| (CONS (QCDR |fpl|) |lexp|) . #12#)))
                     (LETT #11# (CDR #11#) . #12#) (GO G190) G191 (EXIT NIL))
                (LETT |vlp|
                      (PROGN
                       (LETT #10# NIL . #12#)
                       (SEQ (LETT |i| 1 . #12#) (LETT #9# |nf| . #12#) G190
                            (COND ((|greater_SI| |i| #9#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #10# (CONS (|spadConstant| $ 15) #10#)
                                    . #12#)))
                            (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                            (EXIT (NREVERSE #10#))))
                      . #12#)
                (LETT |aux|
                      (PROGN
                       (LETT #8# NIL . #12#)
                       (SEQ (LETT |i| 1 . #12#) (LETT #7# |nf| . #12#) G190
                            (COND ((|greater_SI| |i| #7#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #8# (CONS (|spadConstant| $ 16) #8#)
                                    . #12#)))
                            (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                            (EXIT (NREVERSE #8#))))
                      . #12#)
                (SEQ (LETT |i| 1 . #12#) (LETT #6# |nf| . #12#) G190
                     (COND ((|greater_SI| |i| #6#) (GO G191)))
                     (SEQ
                      (LETT |c|
                            (SPADCALL |contm|
                                      (SPADCALL
                                       (SPADCALL |unilist| |i| (QREFELT $ 28))
                                       (QREFELT $ 29))
                                      (QREFELT $ 36))
                            . #12#)
                      (COND
                       ((OR (SPADCALL |c| (|spadConstant| $ 15) (QREFELT $ 21))
                            (SPADCALL |c|
                                      (SPADCALL (|spadConstant| $ 15)
                                                (QREFELT $ 37))
                                      (QREFELT $ 21)))
                        (EXIT "next i")))
                      (SEQ (LETT |k| 1 . #12#)
                           (LETT #5# (LENGTH |lpol|) . #12#) G190
                           (COND ((|greater_SI| |k| #5#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((EQL (SPADCALL |lexp| |k| (QREFELT $ 39)) 0)
                               "next factor")
                              ('T
                               (SEQ
                                (LETT |h|
                                      (|LEADCDET;checkpow|
                                       (SPADCALL |vl| |k| (QREFELT $ 12)) |c|
                                       $)
                                      . #12#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |h| 0 (QREFELT $ 42))
                                   (SEQ
                                    (COND
                                     ((SPADCALL |h|
                                                (SPADCALL |lexp| |k|
                                                          (QREFELT $ 39))
                                                (QREFELT $ 43))
                                      (PROGN
                                       (LETT #3# (CONS 1 "failed") . #12#)
                                       (GO #13=#:G169))))
                                    (SPADCALL |lexp| |k|
                                              (-
                                               (SPADCALL |lexp| |k|
                                                         (QREFELT $ 39))
                                               |h|)
                                              (QREFELT $ 44))
                                    (SPADCALL |aux| |i|
                                              (SPADCALL
                                               (SPADCALL |aux| |i|
                                                         (QREFELT $ 31))
                                               (SPADCALL
                                                (SPADCALL |lpol| |k|
                                                          (QREFELT $ 31))
                                                |h| (QREFELT $ 45))
                                               (QREFELT $ 46))
                                              (QREFELT $ 33))
                                    (LETT |d|
                                          (SPADCALL
                                           (SPADCALL |vl| |k| (QREFELT $ 12))
                                           |h| (QREFELT $ 47))
                                          . #12#)
                                    (SPADCALL |vlp| |i|
                                              (SPADCALL
                                               (SPADCALL |vlp| |i|
                                                         (QREFELT $ 12))
                                               |d| (QREFELT $ 36))
                                              (QREFELT $ 48))
                                    (EXIT
                                     (LETT |c|
                                           (SPADCALL |c| |d| (QREFELT $ 20))
                                           . #12#)))))))))))
                           (LETT |k| (|inc_SI| |k|) . #12#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        ((SPADCALL |contm| (|spadConstant| $ 15)
                                   (QREFELT $ 21))
                         (SPADCALL |vlp| |i| |c| (QREFELT $ 48))))))
                     (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                     (EXIT NIL))
                (SEQ (LETT |k| 1 . #12#) (LETT #4# (LENGTH |lpol|) . #12#) G190
                     (COND ((|greater_SI| |k| #4#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |lexp| |k| (QREFELT $ 39)) 0
                                   (QREFELT $ 49))
                         (PROGN
                          (LETT #3# (CONS 1 "failed") . #12#)
                          (GO #13#))))))
                     (LETT |k| (|inc_SI| |k|) . #12#) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (COND
                  ((SPADCALL |contm| (|spadConstant| $ 15) (QREFELT $ 21))
                   (CONS 0
                         (VECTOR
                          (PROGN
                           (LETT #2# NIL . #12#)
                           (SEQ (LETT |i| 1 . #12#) (LETT #1# |nf| . #12#) G190
                                (COND ((|greater_SI| |i| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |vlp| |i| (QREFELT $ 12))
                                          (SPADCALL |aux| |i| (QREFELT $ 31))
                                          (QREFELT $ 32))
                                         #2#)
                                        . #12#)))
                                (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (|spadConstant| $ 15) |unilist|)))
                  ('T
                   (CONS 0
                         (|LEADCDET;distribute| |contm| |unilist| |aux| |vlp|
                          |lvar| |lval| $)))))))
          #13# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |LeadingCoefDetermination;|)) 

(DEFUN |LeadingCoefDetermination| (&REST #1=#:G181)
  (SPROG NIL
         (PROG (#2=#:G182)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LeadingCoefDetermination|)
                                               '|domainEqualList|)
                    . #3=(|LeadingCoefDetermination|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LeadingCoefDetermination;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LeadingCoefDetermination|)))))))))) 

(DEFUN |LeadingCoefDetermination;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|LeadingCoefDetermination|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|LeadingCoefDetermination| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 56) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|LeadingCoefDetermination|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|LeadingCoefDetermination| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|) (|List| 8) (0 . |elt|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (6 . |unitNormal|) (11 . |One|) (15 . |One|) (|Boolean|)
              (19 . ~=) (25 . |gcd|) (31 . |quo|) (37 . =)
              (|NonNegativeInteger|) |LEADCDET;polCase;ZNniLB;1|
              (|Union| $ '"failed") (43 . |exquo|)
              (|SparseUnivariatePolynomial| 8) (|List| 26) (49 . |elt|)
              (55 . |leadingCoefficient|) (|List| 9) (60 . |elt|) (66 . *)
              (72 . |setelt!|) (79 . *) (85 . |setelt!|) (92 . *) (98 . -)
              (|List| 10) (103 . |elt|) (109 . |Zero|) (113 . |Zero|)
              (117 . ~=) (123 . >) (129 . |setelt!|) (136 . ^) (142 . *)
              (148 . ^) (154 . |setelt!|) (161 . ~=)
              (|Record| (|:| |polfac| 30) (|:| |correct| 8)
                        (|:| |corrfact| 27))
              (|Union| 50 '"failed") (|Record| (|:| |irr| 9) (|:| |pow| 10))
              (|Record| (|:| |contp| 8) (|:| |factors| (|List| 52))) (|List| 6)
              |LEADCDET;distFact;ZLRLLLU;4|)
           '#(|polCase| 167 |distFact| 174) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 55
                                                 '(2 11 8 0 10 12 1 8 13 0 14 0
                                                   8 0 15 0 9 0 16 2 8 17 0 0
                                                   18 2 8 0 0 0 19 2 8 0 0 0 20
                                                   2 8 17 0 0 21 2 8 24 0 0 25
                                                   2 27 26 0 10 28 1 26 8 0 29
                                                   2 30 9 0 10 31 2 9 0 8 0 32
                                                   3 30 9 0 10 9 33 2 26 0 8 0
                                                   34 3 27 26 0 10 26 35 2 8 0
                                                   0 0 36 1 8 0 0 37 2 38 10 0
                                                   10 39 0 7 0 40 0 8 0 41 2 22
                                                   17 0 0 42 2 10 17 0 0 43 3
                                                   38 10 0 10 10 44 2 9 0 0 22
                                                   45 2 9 0 0 0 46 2 8 0 0 22
                                                   47 3 11 8 0 10 8 48 2 10 17
                                                   0 0 49 3 0 17 8 22 11 23 6 0
                                                   51 8 27 53 11 54 11 55)))))
           '|lookupComplete|)) 
