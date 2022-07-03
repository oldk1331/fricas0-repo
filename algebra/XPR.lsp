
(SDEFUN |XPR;One;$;1| (($ ($)))
        (LIST (CONS (|spadConstant| $ 9) (|spadConstant| $ 10)))) 

(SDEFUN |XPR;characteristic;Nni;2| (($ (|NonNegativeInteger|)))
        (SPADCALL (QREFELT $ 13))) 

(PUT '|XPR;#;$Nni;3| '|SPADreplace| 'LENGTH) 

(SDEFUN |XPR;#;$Nni;3| ((|x| ($)) ($ (|NonNegativeInteger|))) (LENGTH |x|)) 

(SDEFUN |XPR;maxdeg;$E;4| ((|p| ($)) ($ (E)))
        (COND ((NULL |p|) (|error| "zero polynomial !!"))
              ('T (QCAR (|SPADfirst| |p|))))) 

(SDEFUN |XPR;mindeg;$E;5| ((|p| ($)) ($ (E)))
        (COND ((NULL |p|) (|error| "zero polynomial !!"))
              ('T (QCAR (SPADCALL |p| (QREFELT $ 18)))))) 

(SDEFUN |XPR;coef;$ER;6| ((|p| ($)) (|e| (E)) ($ (R)))
        (SPROG ((#1=#:G153 NIL) (#2=#:G154 NIL) (#3=#:G155 NIL) (|tm| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |tm| NIL) (LETT #3# |p|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |tm| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (QCAR |tm|) |e| (QREFELT $ 21))
                           (PROGN (LETT #2# (QCDR |tm|)) (GO #4=#:G152)))
                          ('T
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (QCAR |tm|) |e| (QREFELT $ 22))
                               (PROGN
                                (LETT #1#
                                      (PROGN
                                       (LETT #2# (|spadConstant| $ 23))
                                       (GO #4#)))
                                (GO #5=#:G148)))))
                            #5# (EXIT #1#))))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (|spadConstant| $ 23))))
                #4# (EXIT #2#)))) 

(SDEFUN |XPR;constant?;$B;7| ((|p| ($)) ($ (|Boolean|)))
        (COND ((SPADCALL |p| (|spadConstant| $ 25) (QREFELT $ 26)) 'T)
              ('T
               (SPADCALL (SPADCALL |p| (QREFELT $ 16)) (|spadConstant| $ 9)
                         (QREFELT $ 21))))) 

(SDEFUN |XPR;constant;$R;8| ((|p| ($)) ($ (R)))
        (SPADCALL |p| (|spadConstant| $ 9) (QREFELT $ 24))) 

(SDEFUN |XPR;quasiRegular?;$B;9| ((|p| ($)) ($ (|Boolean|)))
        (COND ((SPADCALL |p| (|spadConstant| $ 25) (QREFELT $ 26)) 'T)
              ('T
               (SPADCALL (QCAR (SPADCALL |p| (QREFELT $ 18)))
                         (|spadConstant| $ 9) (QREFELT $ 29))))) 

(SDEFUN |XPR;quasiRegular;2$;10| ((|p| ($)) ($ ($)))
        (SPROG ((#1=#:G167 NIL) (|t| NIL) (#2=#:G166 NIL))
               (SEQ
                (COND ((SPADCALL |p| (QREFELT $ 30)) |p|)
                      ('T
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL
                                  (SPADCALL (QCAR |t|) (|spadConstant| $ 9)
                                            (QREFELT $ 21)))
                                 (LETT #2# (CONS |t| #2#))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |XPR;recip;$U;11| ((|p| ($)) ($ (|Union| $ #1="failed")))
        (SPROG ((|u| (|Union| R #1#)))
               (SEQ
                (COND
                 ((OR (SPADCALL |p| (|spadConstant| $ 25) (QREFELT $ 26))
                      (SPADCALL (QCAR (|SPADfirst| |p|)) (|spadConstant| $ 9)
                                (QREFELT $ 32)))
                  (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |u|
                         (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 34)))
                   (EXIT
                    (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                          ('T
                           (CONS 0
                                 (SPADCALL (QCDR |u|) (QREFELT $ 35)))))))))))) 

(SDEFUN |XPR;coerce;R$;12| ((|r| (R)) ($ ($)))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 23) (QREFELT $ 37))
          (|spadConstant| $ 25))
         ('T (LIST (CONS (|spadConstant| $ 9) |r|))))) 

(SDEFUN |XPR;coerce;I$;13| ((|n| (|Integer|)) ($ ($)))
        (SPADCALL (SPADCALL |n| (QREFELT $ 39)) (QREFELT $ 35))) 

(SDEFUN |XPR;*;3$;14| ((|p1| ($)) (|p2| ($)) ($ ($)))
        (SPROG
         ((#1=#:G185 NIL) (#2=#:G184 ($)) (#3=#:G186 ($)) (#4=#:G194 NIL)
          (|t2| NIL) (#5=#:G193 NIL) (#6=#:G192 NIL) (|t1| NIL))
         (SEQ
          (COND ((OR (NULL |p1|) (NULL |p2|)) (|spadConstant| $ 25))
                ((SPADCALL (QCAR (|SPADfirst| |p1|)) (|spadConstant| $ 9)
                           (QREFELT $ 21))
                 (SPADCALL (QCDR (|SPADfirst| |p1|)) |p2| (QREFELT $ 41)))
                ((SPADCALL |p2| (|spadConstant| $ 11) (QREFELT $ 26)) |p1|)
                (#7='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |t1| NIL) (LETT #6# |p1|) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |t1| (CAR #6#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (PROGN
                                 (LETT #5# NIL)
                                 (SEQ (LETT |t2| NIL) (LETT #4# |p2|) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN (LETT |t2| (CAR #4#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #5#
                                              (CONS
                                               (CONS
                                                (SPADCALL (QCAR |t1|)
                                                          (QCAR |t2|)
                                                          (QREFELT $ 42))
                                                (SPADCALL (QCDR |t1|)
                                                          (QCDR |t2|)
                                                          (QREFELT $ 43)))
                                               #5#))))
                                      (LETT #4# (CDR #4#)) (GO G190) G191
                                      (EXIT (NREVERSE #5#)))))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 44))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                       (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#7# (|spadConstant| $ 25))))))))) 

(SDEFUN |XPR;*;3$;15| ((|p1| ($)) (|p2| ($)) ($ ($)))
        (SPROG
         ((#1=#:G197 NIL) (#2=#:G196 ($)) (#3=#:G198 ($)) (|r| (R))
          (#4=#:G207 NIL) (|t2| NIL) (#5=#:G206 NIL) (#6=#:G205 NIL)
          (|t1| NIL))
         (SEQ
          (COND ((OR (NULL |p1|) (NULL |p2|)) (|spadConstant| $ 25))
                ((SPADCALL (QCAR (|SPADfirst| |p1|)) (|spadConstant| $ 9)
                           (QREFELT $ 21))
                 (SPADCALL (QCDR (|SPADfirst| |p1|)) |p2| (QREFELT $ 41)))
                ((SPADCALL |p2| (|spadConstant| $ 11) (QREFELT $ 26)) |p1|)
                (#7='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |t1| NIL) (LETT #6# |p1|) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |t1| (CAR #6#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (PROGN
                                 (LETT #5# NIL)
                                 (SEQ (LETT |t2| NIL) (LETT #4# |p2|) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN (LETT |t2| (CAR #4#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SEQ
                                           (LETT |r|
                                                 (SPADCALL (QCDR |t1|)
                                                           (QCDR |t2|)
                                                           (QREFELT $ 43)))
                                           (EXIT
                                            (NULL
                                             (SPADCALL |r|
                                                       (|spadConstant| $ 23)
                                                       (QREFELT $ 37)))))
                                          (LETT #5#
                                                (CONS
                                                 (CONS
                                                  (SPADCALL (QCAR |t1|)
                                                            (QCAR |t2|)
                                                            (QREFELT $ 42))
                                                  |r|)
                                                 #5#))))))
                                      (LETT #4# (CDR #4#)) (GO G190) G191
                                      (EXIT (NREVERSE #5#)))))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 44))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                       (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#7# (|spadConstant| $ 25))))))))) 

(SDEFUN |XPR;^;$Nni$;16| ((|p| ($)) (|nn| (|NonNegativeInteger|)) ($ ($)))
        (|XPR;repeatMultExpt| |p| |nn| $)) 

(SDEFUN |XPR;repeatMultExpt| ((|x| ($)) (|nn| (|NonNegativeInteger|)) ($ ($)))
        (SPROG ((|y| ($)) (#1=#:G212 NIL) (|i| NIL))
               (SEQ
                (COND ((EQL |nn| 0) (|spadConstant| $ 11))
                      ('T
                       (SEQ (LETT |y| |x|)
                            (SEQ (LETT |i| 2) (LETT #1# |nn|) G190
                                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |y|
                                         (SPADCALL |x| |y| (QREFELT $ 45)))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |y|))))))) 

(SDEFUN |XPR;outTerm| ((|r| (R)) (|m| (E)) ($ (|OutputForm|)))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 10) (QREFELT $ 37))
          (SPADCALL |m| (QREFELT $ 48)))
         ((SPADCALL |m| (|spadConstant| $ 9) (QREFELT $ 21))
          (SPADCALL |r| (QREFELT $ 49)))
         ('T
          (SPADCALL (SPADCALL |r| (QREFELT $ 49)) (SPADCALL |m| (QREFELT $ 48))
                    (QREFELT $ 50))))) 

(SDEFUN |XPR;coerce;$Of;19| ((|a| ($)) ($ (|OutputForm|)))
        (SPROG ((#1=#:G221 NIL) (|t| NIL) (#2=#:G220 NIL))
               (SEQ
                (COND
                 ((NULL |a|) (SPADCALL (|spadConstant| $ 23) (QREFELT $ 49)))
                 ('T
                  (SPADCALL (ELT $ 51)
                            (NREVERSE
                             (PROGN
                              (LETT #2# NIL)
                              (SEQ (LETT |t| NIL) (LETT #1# |a|) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |t| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (|XPR;outTerm| (QCDR |t|)
                                             (QCAR |t|) $)
                                            #2#))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT (NREVERSE #2#)))))
                            (QREFELT $ 54))))))) 

(SDEFUN |XPR;/;$R$;20| ((|x| ($)) (|r| (R)) ($ ($)))
        (SPADCALL (SPADCALL |r| (QREFELT $ 56)) |x| (QREFELT $ 41))) 

(DECLAIM (NOTINLINE |XPolynomialRing;|)) 

(DEFUN |XPolynomialRing| (&REST #1=#:G228)
  (SPROG NIL
         (PROG (#2=#:G229)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|XPolynomialRing|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |XPolynomialRing;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|XPolynomialRing|)))))))))) 

(DEFUN |XPolynomialRing;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G227 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|XPolynomialRing| DV$1 DV$2))
    (LETT $ (GETREFV 68))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#1|
                                                       '(|noZeroDivisors|))
                                        (LETT #1#
                                              (|HasCategory| |#2|
                                                             '(|Comparable|)))
                                        (AND
                                         (|HasCategory| |#1| '(|Comparable|))
                                         #1#)
                                        (|HasCategory| |#1| '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|XPolynomialRing| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|List| (|Record| (|:| |k| |#2|) (|:| |c| |#1|))))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV $ 45 (CONS (|dispatchFunction| |XPR;*;3$;14|) $)))
     ('T (QSETREFV $ 45 (CONS (|dispatchFunction| |XPR;*;3$;15|) $))))
    (COND
     ((|testBitVector| |pv$| 6)
      (QSETREFV $ 57 (CONS (|dispatchFunction| |XPR;/;$R$;20|) $))))
    $))) 

(MAKEPROP '|XPolynomialRing| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 6 7) (|local| |#1|)
              (|local| |#2|) '|Rep| (0 . |One|) (4 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |XPR;One;$;1|) $))
              (|NonNegativeInteger|) (8 . |characteristic|)
              |XPR;characteristic;Nni;2| |XPR;#;$Nni;3| |XPR;maxdeg;$E;4|
              (|Record| (|:| |k| 7) (|:| |c| 6)) (12 . |last|)
              |XPR;mindeg;$E;5| (|Boolean|) (17 . =) (23 . <) (29 . |Zero|)
              |XPR;coef;$ER;6| (33 . |Zero|) (37 . =) |XPR;constant?;$B;7|
              |XPR;constant;$R;8| (43 . ~=) |XPR;quasiRegular?;$B;9|
              |XPR;quasiRegular;2$;10| (49 . >) (|Union| $ '"failed")
              (55 . |recip|) |XPR;coerce;R$;12| |XPR;recip;$U;11| (60 . =)
              (|Integer|) (66 . |coerce|) |XPR;coerce;I$;13| (71 . *) (77 . *)
              (83 . *) (89 . +) (95 . *) |XPR;^;$Nni$;16| (|OutputForm|)
              (101 . |coerce|) (106 . |coerce|) (111 . *) (117 . +)
              (|Mapping| 47 47 47) (|List| 47) (123 . |reduce|)
              |XPR;coerce;$Of;19| (129 . |inv|) (134 . /) (|List| 17)
              (|Mapping| 6 7) (|List| 6) (|Mapping| 6 6) (|List| $) (|List| 7)
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 140 |zero?| 146 |support| 151 |subtractIfCan| 156 |smaller?|
              162 |sample| 168 |rightRecip| 172 |rightPower| 177 |reductum| 189
              |recip| 194 |quasiRegular?| 199 |quasiRegular| 204 |opposite?|
              209 |one?| 215 |numberOfMonomials| 220 |monomials| 225
              |monomial?| 230 |monomial| 235 |mindeg| 241 |maxdeg| 246 |map|
              251 |listOfTerms| 257 |linearExtend| 262 |leftRecip| 268
              |leftPower| 273 |leadingTerm| 285 |leadingSupport| 290
              |leadingMonomial| 295 |leadingCoefficient| 300 |latex| 305
              |hashUpdate!| 310 |hash| 316 |constructOrdered| 321 |construct|
              326 |constant?| 331 |constant| 336 |commutator| 341 |coerce| 347
              |coefficients| 367 |coefficient| 372 |coef| 378 |characteristic|
              384 |associator| 388 |antiCommutator| 395 |annihilate?| 401 ^ 407
              |Zero| 419 |One| 423 = 427 / 433 - 439 + 450 * 456 |#| 492)
           'NIL
           (CONS
            (|makeByteWordVec2| 5
                                '(0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 5 0 0 0 0 2 3))
            (CONS
             '#(NIL |Algebra&| NIL |Rng&| |FreeModuleCategory&| NIL NIL NIL
                |Module&| NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL |AbelianGroup&| NIL NIL NIL NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&|
                |Magma&| |AbelianSemiGroup&| NIL |SetCategory&| NIL
                |BasicType&| NIL NIL NIL)
             (CONS
              '#((|XAlgebra| 6) (|Algebra| 6) (|Ring|) (|Rng|)
                 (|FreeModuleCategory| 6 7) (|SemiRing|)
                 (|IndexedDirectProductCategory| 6 7) (|SemiRng|) (|Module| 6)
                 (|IndexedProductCategory| 6 7) (|BiModule| 6 6)
                 (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|AbelianProductCategory| 6) (|LeftModule| 6)
                 (|RightModule| 6) (|NonAssociativeRng|) (|RightModule| $$)
                 (|LeftModule| $$) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|SetCategory|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 47) (|canonicalUnitNormal|) (|noZeroDivisors|))
              (|makeByteWordVec2| 67
                                  '(0 7 0 9 0 6 0 10 0 6 12 13 1 8 17 0 18 2 7
                                    20 0 0 21 2 7 20 0 0 22 0 6 0 23 0 0 0 25 2
                                    0 20 0 0 26 2 7 20 0 0 29 2 7 20 0 0 32 1 6
                                    33 0 34 2 6 20 0 0 37 1 6 0 38 39 2 0 0 6 0
                                    41 2 7 0 0 0 42 2 6 0 0 0 43 2 0 0 0 0 44 2
                                    0 0 0 0 45 1 7 47 0 48 1 6 47 0 49 2 47 0 0
                                    0 50 2 47 0 0 0 51 2 53 47 52 0 54 1 6 0 0
                                    56 2 0 0 0 6 57 2 0 20 0 0 1 1 0 20 0 1 1 0
                                    63 0 1 2 0 33 0 0 1 2 5 20 0 0 1 0 0 0 1 1
                                    0 33 0 1 2 0 0 0 12 1 2 0 0 0 64 1 1 0 0 0
                                    1 1 0 33 0 36 1 0 20 0 30 1 0 0 0 31 2 0 20
                                    0 0 1 1 0 20 0 1 1 0 12 0 1 1 0 62 0 1 1 0
                                    20 0 1 2 0 0 6 7 1 1 0 7 0 19 1 0 7 0 16 2
                                    0 0 61 0 1 1 0 58 0 1 2 1 6 59 0 1 1 0 33 0
                                    1 2 0 0 0 12 1 2 0 0 0 64 1 1 4 17 0 1 1 4
                                    7 0 1 1 4 0 0 1 1 4 6 0 1 1 0 65 0 1 2 0 67
                                    67 0 1 1 0 66 0 1 1 4 0 58 1 1 0 0 58 1 1 0
                                    20 0 27 1 0 6 0 28 2 0 0 0 0 1 1 0 0 7 1 1
                                    0 0 6 35 1 0 0 38 40 1 0 47 0 55 1 0 60 0 1
                                    2 0 6 0 7 1 2 0 6 0 7 24 0 0 12 14 3 0 0 0
                                    0 0 1 2 0 0 0 0 1 2 0 20 0 0 1 2 0 0 0 12
                                    46 2 0 0 0 64 1 0 0 0 25 0 0 0 11 2 0 20 0
                                    0 26 2 6 0 0 6 57 1 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 0 0 44 2 0 0 6 0 41 2 0 0 0 6 1 2 0 0 12
                                    0 1 2 0 0 38 0 1 2 0 0 0 0 45 2 0 0 64 0 1
                                    1 0 12 0 15)))))
           '|lookupComplete|)) 
