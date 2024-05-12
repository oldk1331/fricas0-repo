
(PUT '|GSERIES;coerce;Ups%;1| '|SPADreplace| '(XLAM (|upxs|) |upxs|)) 

(SDEFUN |GSERIES;coerce;Ups%;1|
        ((|upxs| (|UnivariatePuiseuxSeries| |Coef| |var| |cen|)) (% (%)))
        |upxs|) 

(PUT '|GSERIES;puiseux| '|SPADreplace| '(XLAM (|f|) |f|)) 

(SDEFUN |GSERIES;puiseux|
        ((|f| (%)) (% (|UnivariatePuiseuxSeries| |Coef| |var| |cen|))) |f|) 

(SDEFUN |GSERIES;differentiate;2%;3| ((|f| (%)) (% (%)))
        (SPROG ((|str2| (|String|)) (|str1| (|String|)))
               (SEQ
                (LETT |str1| "'differentiate' unavailable on this domain;  ")
                (LETT |str2| "use 'approximate' first")
                (EXIT (|error| (STRCONC |str1| |str2|)))))) 

(SDEFUN |GSERIES;differentiate;%V%;4|
        ((|f| (%)) (|v| (|Variable| |var|)) (% (%)))
        (SPADCALL |f| (QREFELT % 10))) 

(SDEFUN |GSERIES;differentiate;%S%;5| ((|f| (%)) (|s| (|Symbol|)) (% (%)))
        (SPROG
         ((|deriv| (%)) (|dcds| (|Coef|)) (|str2| (|String|))
          (|str1| (|String|)))
         (SEQ
          (COND
           ((EQUAL |s| (SPADCALL |f| (QREFELT % 14)))
            (SEQ (LETT |str1| "'differentiate' unavailable on this domain;  ")
                 (LETT |str2| "use 'approximate' first")
                 (EXIT (|error| (STRCONC |str1| |str2|)))))
           ('T
            (SEQ
             (LETT |dcds|
                   (SPADCALL (SPADCALL |f| (QREFELT % 15)) |s| (QREFELT % 16)))
             (LETT |deriv|
                   (SPADCALL
                    (SPADCALL (|GSERIES;puiseux| |f| %) (QREFELT % 17))
                    (QREFELT % 9)))
             (EXIT
              (SPADCALL
               (SPADCALL
                (CONS #'|GSERIES;differentiate;%S%;5!0| (VECTOR % |s|)) |f|
                (QREFELT % 19))
               (SPADCALL |dcds| |deriv| (QREFELT % 20)) (QREFELT % 21))))))))) 

(SDEFUN |GSERIES;differentiate;%S%;5!0| ((|x| NIL) ($$ NIL))
        (PROG (|s| %)
          (LETT |s| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |s| (QREFELT % 16)))))) 

(SDEFUN |GSERIES;integrate;2%;6| ((|f| (%)) (% (%)))
        (SPROG ((|str2| (|String|)) (|str1| (|String|)))
               (SEQ (LETT |str1| "'integrate' unavailable on this domain;  ")
                    (LETT |str2| "use 'approximate' first")
                    (EXIT (|error| (STRCONC |str1| |str2|)))))) 

(SDEFUN |GSERIES;integrate;%V%;7| ((|f| (%)) (|v| (|Variable| |var|)) (% (%)))
        (SPADCALL |f| (QREFELT % 23))) 

(SDEFUN |GSERIES;integrate;%S%;8| ((|f| (%)) (|s| (|Symbol|)) (% (%)))
        (SPROG ((|str2| (|String|)) (|str1| (|String|)))
               (SEQ
                (COND
                 ((EQUAL |s| (SPADCALL |f| (QREFELT % 14)))
                  (SEQ
                   (LETT |str1| "'integrate' unavailable on this domain;  ")
                   (LETT |str2| "use 'approximate' first")
                   (EXIT (|error| (STRCONC |str1| |str2|)))))
                 ((NULL
                   (SPADCALL |s|
                             (SPADCALL (SPADCALL |f| (QREFELT % 15))
                                       (QREFELT % 26))
                             (QREFELT % 28)))
                  (SPADCALL (CONS #'|GSERIES;integrate;%S%;8!0| (VECTOR % |s|))
                            |f| (QREFELT % 19)))
                 ('T
                  (|error|
                   "integrate: center is a function of variable of integration")))))) 

(SDEFUN |GSERIES;integrate;%S%;8!0| ((|x| NIL) ($$ NIL))
        (PROG (|s| %)
          (LETT |s| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |s| (QREFELT % 29)))))) 

(SDEFUN |GSERIES;integrateWithOneAnswer|
        ((|f| (|Coef|)) (|s| (|Symbol|)) (% (|Coef|)))
        (SPROG ((|res| (|Union| |Coef| (|List| |Coef|))))
               (SEQ (LETT |res| (SPADCALL |f| |s| (QREFELT % 33)))
                    (EXIT
                     (COND ((QEQCAR |res| 0) (QCDR |res|))
                           ('T (|SPADfirst| (QCDR |res|)))))))) 

(SDEFUN |GSERIES;integrate;%S%;10| ((|f| (%)) (|s| (|Symbol|)) (% (%)))
        (SPROG ((|str2| (|String|)) (|str1| (|String|)))
               (SEQ
                (COND
                 ((EQUAL |s| (SPADCALL |f| (QREFELT % 14)))
                  (SEQ
                   (LETT |str1| "'integrate' unavailable on this domain;  ")
                   (LETT |str2| "use 'approximate' first")
                   (EXIT (|error| (STRCONC |str1| |str2|)))))
                 ((NULL
                   (SPADCALL |s|
                             (SPADCALL (SPADCALL |f| (QREFELT % 15))
                                       (QREFELT % 26))
                             (QREFELT % 28)))
                  (SPADCALL
                   (CONS #'|GSERIES;integrate;%S%;10!0| (VECTOR % |s|)) |f|
                   (QREFELT % 19)))
                 ('T
                  (|error|
                   "integrate: center is a function of variable of integration")))))) 

(SDEFUN |GSERIES;integrate;%S%;10!0| ((|x| NIL) ($$ NIL))
        (PROG (|s| %)
          (LETT |s| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GSERIES;integrateWithOneAnswer| |x| |s| %))))) 

(DECLAIM (NOTINLINE |GeneralUnivariatePowerSeries;|)) 

(DEFUN |GeneralUnivariatePowerSeries| (&REST #1=#:G62)
  (SPROG NIL
         (PROG (#2=#:G63)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL))
                     (HGET |$ConstructorCache| '|GeneralUnivariatePowerSeries|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GeneralUnivariatePowerSeries;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GeneralUnivariatePowerSeries|)))))))))) 

(DEFUN |GeneralUnivariatePowerSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G55 NIL) (#2=#:G56 NIL) (#3=#:G57 NIL) (#4=#:G58 NIL)
    (#5=#:G60 NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT |dv$| (LIST '|GeneralUnivariatePowerSeries| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 57))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Fraction|
                                                                 (|Integer|))
                                                               (|devaluate|
                                                                |#1|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| (|Fraction| (|Integer|))
                                                       '(|SemiGroup|))
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| (|Fraction| (|Integer|))
                                                       '(|Comparable|))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #5#
                                            (|HasCategory| |#1| '(|Field|)))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Fraction|
                                                                 (|Integer|)))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|)))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasSignature| |#1|
                                                         (LIST '|integrate|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|))))
                                         (|HasSignature| |#1|
                                                         (LIST '|variables|
                                                               (LIST
                                                                '(|List|
                                                                  (|Symbol|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR #5# (|HasCategory| |#1| '(|Field|))
                                            #4#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|)))
                                        (OR #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (LETT #2#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR #2#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5# (|HasCategory| |#1| '(|Field|))
                                         #4# #2#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         #1#
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #1#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))))))
    (|haddProp| |$ConstructorCache| '|GeneralUnivariatePowerSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| % 134217728))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 268435456))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 536870912))
    (AND
     (OR (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1073741824))
    (AND
     (OR (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #3#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 2147483648))
    (AND
     (OR (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #2#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianMonoid|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 8589934592))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 17179869184))
    (AND
     (OR #1# (AND #5# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 34359738368))
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 6)
      (PROGN
       (QSETREFV % 10
                 (CONS (|dispatchFunction| |GSERIES;differentiate;2%;3|) %))
       (QSETREFV % 12
                 (CONS (|dispatchFunction| |GSERIES;differentiate;%V%;4|) %))
       (COND
        ((|HasCategory| |#1| '(|PartialDifferentialRing| (|Symbol|)))
         (QSETREFV % 22
                   (CONS (|dispatchFunction| |GSERIES;differentiate;%S%;5|)
                         %))))
       (QSETREFV % 23 (CONS (|dispatchFunction| |GSERIES;integrate;2%;6|) %))
       (QSETREFV % 24 (CONS (|dispatchFunction| |GSERIES;integrate;%V%;7|) %))
       (COND
        ((|HasSignature| |#1|
                         (LIST '|integrate|
                               (LIST (|devaluate| |#1|) (|devaluate| |#1|)
                                     '(|Symbol|))))
         (COND
          ((|HasSignature| |#1|
                           (LIST '|variables|
                                 (LIST '(|List| (|Symbol|))
                                       (|devaluate| |#1|))))
           (QSETREFV % 30
                     (CONS (|dispatchFunction| |GSERIES;integrate;%S%;8|)
                           %))))))
       (COND
        ((|HasCategory| |#1| '(|TranscendentalFunctionCategory|))
         (COND
          ((|HasCategory| |#1| '(|PrimitiveFunctionCategory|))
           (COND
            ((|HasCategory| |#1|
                            '(|AlgebraicallyClosedFunctionSpace| (|Integer|)))
             (PROGN
              (QSETREFV % 30
                        (CONS (|dispatchFunction| |GSERIES;integrate;%S%;10|)
                              %))))))))))))
    %))) 

(MAKEPROP '|GeneralUnivariatePowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|UnivariatePuiseuxSeries| 6 (NRTEVAL (QREFELT % 7))
                                         (NRTEVAL (QREFELT % 8)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|)
              |GSERIES;coerce;Ups%;1| (0 . |differentiate|)
              (|Variable| (NRTEVAL (QREFELT % 7))) (5 . |differentiate|)
              (|Symbol|) (11 . |variable|) (16 . |center|)
              (21 . |differentiate|) (27 . |differentiate|) (|Mapping| 6 6)
              (32 . |map|) (38 . *) (44 . -) (50 . |differentiate|)
              (56 . |integrate|) (61 . |integrate|) (|List| 13)
              (67 . |variables|) (|Boolean|) (72 . |entry?|) (78 . |integrate|)
              (84 . |integrate|) (|Union| 6 (|List| 6))
              (|FunctionSpaceIntegration| 43 6) (90 . |integrate|)
              (|OutputForm|) (|String|) (|PositiveInteger|)
              (|Record| (|:| |k| 39) (|:| |c| 6)) (|List| 37) (|Fraction| 43)
              (|Stream| 37) (|NonNegativeInteger|) (|List| 41) (|Integer|)
              (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Factored| %) (|Union| 48 '#1="failed") (|List| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 50 '#1#)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 48) (|:| |generator| %))
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Stream| 6))
           '#(~= 96 |zero?| 102 |variable| 107 |unitNormal| 112 |unitCanonical|
              117 |unit?| 122 |truncate| 127 |terms| 140 |tanh| 145 |tan| 150
              |subtractIfCan| 155 |squareFreePart| 161 |squareFree| 166 |sqrt|
              171 |sizeLess?| 176 |sinh| 182 |sin| 187 |series| 192 |sech| 198
              |sec| 203 |sample| 208 |rightRecip| 212 |rightPower| 217 |rem|
              229 |reductum| 235 |recip| 240 |quo| 245 |principalIdeal| 251
              |prime?| 256 |pole?| 261 |plenaryPower| 266 |pi| 272 |order| 276
              |opposite?| 287 |one?| 293 |nthRoot| 298 |multiplyExponents| 304
              |multiEuclidean| 316 |monomial?| 322 |monomial| 327 |map| 333
              |log| 339 |leftRecip| 344 |leftPower| 349 |leadingTerm| 361
              |leadingSupport| 366 |leadingMonomial| 371 |leadingCoefficient|
              376 |lcmCoef| 381 |lcm| 387 |latex| 398 |inv| 403 |integrate| 408
              |gcdPolynomial| 425 |gcd| 431 |factor| 442 |extendedEuclidean|
              447 |extend| 460 |exquo| 466 |expressIdealMember| 472 |exp| 478
              |eval| 483 |euclideanSize| 489 |elt| 494 |divide| 506
              |differentiate| 512 |degree| 555 |csch| 560 |csc| 565 |coth| 570
              |cot| 575 |cosh| 580 |cos| 585 |constructOrdered| 590 |construct|
              595 |complete| 600 |commutator| 605 |coerce| 611 |coefficient|
              646 |charthRoot| 652 |characteristic| 657 |center| 661 |atanh|
              666 |atan| 671 |associator| 676 |associates?| 683 |asinh| 689
              |asin| 694 |asech| 699 |asec| 704 |approximate| 709
              |antiCommutator| 715 |annihilate?| 721 |acsch| 727 |acsc| 732
              |acoth| 737 |acot| 742 |acosh| 747 |acos| 752 ^ 757 |Zero| 787
              |One| 791 D 795 = 832 / 838 - 850 + 861 * 867)
           'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 7 0 7 0 7 7 0 7 0 16 7 15 7 6 16 15 3 4 10
                                  2 1 21 6 21 15 18 10 6 15 10 0 6 20 0 0 0 6 6
                                  21 0 0 0 0 0 27 18 18 26 18 25 0 0 0 0 15 6 0
                                  7 7 16 15 20 6 6 6 6 6 6 5 0 0 0))
            (CONS
             '#(NIL |Field&| NIL |EuclideanDomain&|
                |UnivariatePowerSeriesCategory&| |UniqueFactorizationDomain&|
                NIL |PowerSeriesCategory&| |GcdDomain&| |AbelianMonoidRing&|
                NIL |DivisionRing&| NIL NIL |Algebra&| |EntireRing&| |Algebra&|
                |DifferentialRing&| |PartialDifferentialRing&| |Algebra&| NIL
                NIL NIL |NonAssociativeAlgebra&| |Rng&|
                |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&| |Module&|
                |Module&| |Module&| NIL NIL |NonAssociativeRing&| NIL NIL NIL
                NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |MagmaWithUnit&| |AbelianMonoid&|
                NIL |NonAssociativeSemiRng&| |AbelianSemiGroup&| |Magma&| NIL
                |TranscendentalFunctionCategory&| |SetCategory&| NIL NIL NIL
                NIL NIL |RadicalCategory&| |ElementaryFunctionCategory&| NIL
                |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL NIL |BasicType&| NIL)
             (CONS
              '#((|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariateSeriesWithRationalExponents| 6 39)
                 (|EuclideanDomain|) (|UnivariatePowerSeriesCategory| 6 39)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|PowerSeriesCategory| 6 39 (|SingletonAsOrderedSet|))
                 (|GcdDomain|) (|AbelianMonoidRing| 6 39) (|IntegralDomain|)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| 39) (|EntireRing|) (|Algebra| $$)
                 (|DifferentialRing|) (|PartialDifferentialRing| 13)
                 (|Algebra| 6) (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Ring|) (|NonAssociativeAlgebra| 39) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|NonAssociativeAlgebra| 6) (|Module| 39) (|Module| $$)
                 (|Module| 6) (|SemiRng|) (|BiModule| 39 39)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 39) (|RightModule| 39)
                 (|LeftModule| 39) (|NonAssociativeRng|) (|LeftModule| $$)
                 (|RightModule| $$) (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|MagmaWithUnit|) (|AbelianMonoid|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|AbelianSemiGroup|) (|Magma|)
                 (|CommutativeStar|) (|TranscendentalFunctionCategory|)
                 (|SetCategory|) (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|RadicalCategory|) (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|Eltable| $$ $$)
                 (|CoercibleTo| 34) (|BasicType|)
                 (|VariablesCommuteWithCoefficients|))
              (|makeByteWordVec2| 56
                                  '(1 0 0 0 10 2 0 0 0 11 12 1 0 13 0 14 1 0 6
                                    0 15 2 6 0 0 13 16 1 5 0 0 17 2 0 0 18 0 19
                                    2 0 0 6 0 20 2 0 0 0 0 21 2 0 0 0 13 22 1 0
                                    0 0 23 2 0 0 0 11 24 1 6 25 0 26 2 25 27 13
                                    0 28 2 6 0 0 13 29 2 0 0 0 13 30 2 32 31 6
                                    13 33 2 0 27 0 0 1 1 34 27 0 1 1 0 13 0 14
                                    1 29 45 0 1 1 29 0 0 1 1 29 27 0 1 2 0 0 0
                                    39 1 3 0 0 0 39 39 1 1 0 40 0 1 1 6 0 0 1 1
                                    6 0 0 1 2 35 44 0 0 1 1 7 0 0 1 1 7 46 0 1
                                    1 6 0 0 1 2 7 27 0 0 1 1 6 0 0 1 1 6 0 0 1
                                    2 0 0 41 40 1 1 6 0 0 1 1 6 0 0 1 0 34 0 1
                                    1 32 44 0 1 2 0 0 0 36 1 2 32 0 0 41 1 2 7
                                    0 0 0 1 1 8 0 0 1 1 32 44 0 1 2 7 0 0 0 1 1
                                    7 53 48 1 1 7 27 0 1 1 0 27 0 1 2 30 0 0 36
                                    1 0 6 0 1 1 0 39 0 1 2 0 39 0 39 1 2 34 27
                                    0 0 1 1 32 27 0 1 2 6 0 0 43 1 2 0 0 0 36 1
                                    2 0 0 0 39 1 2 7 47 48 0 1 1 0 27 0 1 2 0 0
                                    6 39 1 2 0 0 18 0 19 1 6 0 0 1 1 32 44 0 1
                                    2 0 0 0 36 1 2 32 0 0 41 1 1 8 37 0 1 1 8
                                    39 0 1 1 0 0 0 1 1 0 6 0 1 2 7 55 0 0 1 1 7
                                    0 48 1 2 7 0 0 0 1 1 0 35 0 1 1 7 0 0 1 2
                                    13 0 0 13 30 1 6 0 0 23 2 6 0 0 11 24 2 7
                                    54 54 54 1 1 7 0 48 1 2 7 0 0 0 1 1 7 46 0
                                    1 2 7 49 0 0 1 3 7 51 0 0 0 1 2 0 0 0 39 1
                                    2 29 44 0 0 1 2 7 47 48 0 1 1 6 0 0 1 2 11
                                    56 0 6 1 1 7 41 0 1 2 0 6 0 39 1 2 5 0 0 0
                                    1 2 7 52 0 0 1 2 0 0 0 11 12 3 4 0 0 13 41
                                    1 3 4 0 0 25 42 1 2 4 0 0 13 22 2 4 0 0 25
                                    1 2 3 0 0 41 1 1 3 0 0 10 1 0 39 0 1 1 6 0
                                    0 1 1 6 0 0 1 1 6 0 0 1 1 6 0 0 1 1 6 0 0 1
                                    1 6 0 0 1 1 8 0 38 1 1 0 0 38 1 1 0 0 0 1 2
                                    33 0 0 0 1 1 0 34 0 1 1 0 0 5 9 1 0 0 11 1
                                    1 28 0 6 1 1 31 0 0 1 1 33 0 43 1 1 6 0 39
                                    1 2 0 6 0 39 1 1 1 44 0 1 0 33 41 1 1 0 6 0
                                    15 1 6 0 0 1 1 6 0 0 1 3 33 0 0 0 0 1 2 29
                                    27 0 0 1 1 6 0 0 1 1 6 0 0 1 1 6 0 0 1 1 6
                                    0 0 1 2 12 6 0 39 1 2 0 0 0 0 1 2 33 27 0 0
                                    1 1 6 0 0 1 1 6 0 0 1 1 6 0 0 1 1 6 0 0 1 1
                                    6 0 0 1 1 6 0 0 1 2 0 0 0 36 1 2 32 0 0 41
                                    1 2 6 0 0 0 1 2 6 0 0 39 1 2 7 0 0 43 1 0
                                    34 0 1 0 32 0 1 3 4 0 0 25 42 1 2 4 0 0 25
                                    1 3 4 0 0 13 41 1 2 4 0 0 13 1 2 3 0 0 41 1
                                    1 3 0 0 1 2 0 27 0 0 1 2 7 0 0 6 1 2 7 0 0
                                    0 1 1 36 0 0 1 2 36 0 0 0 21 2 0 0 0 0 1 2
                                    0 0 36 0 1 2 0 0 0 0 1 2 0 0 0 6 1 2 0 0 6
                                    0 20 2 36 0 43 0 1 2 34 0 41 0 1 2 6 0 39 0
                                    1 2 6 0 0 39 1)))))
           '|lookupComplete|)) 
