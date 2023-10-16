
(SDEFUN |GAUSSFAC;reduction| ((|u| |Integer|) (|p| |Integer|) ($ |Integer|))
        (COND ((EQL |p| 0) |u|) ('T (SPADCALL |u| |p| (QREFELT $ 7))))) 

(SDEFUN |GAUSSFAC;merge|
        ((|p| |Integer|) (|q| |Integer|) ($ |Union| (|Integer|) "failed"))
        (COND ((EQL |p| |q|) (CONS 0 |p|)) ((EQL |p| 0) (CONS 0 |q|))
              ((EQL |q| 0) (CONS 0 |p|)) ('T (CONS 1 "failed")))) 

(SDEFUN |GAUSSFAC;exactquo|
        ((|u| |Integer|) (|v| |Integer|) (|p| |Integer|)
         ($ |Union| (|Integer|) "failed"))
        (SPROG ((#1=#:G121 NIL))
               (COND ((EQL |p| 0) (SPADCALL |u| |v| (QREFELT $ 9)))
                     ((EQL (REM |v| |p|) 0) (CONS 1 "failed"))
                     ('T
                      (CONS 0
                            (SPADCALL
                             (QCAR
                              (PROG2
                                  (LETT #1#
                                        (SPADCALL |v| |p| |u| (QREFELT $ 12)))
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 0)
                                                (|Record|
                                                 (|:| |coef1| (|Integer|))
                                                 (|:| |coef2| (|Integer|)))
                                                (|Union|
                                                 (|Record|
                                                  (|:| |coef1| (|Integer|))
                                                  (|:| |coef2| (|Integer|)))
                                                 "failed")
                                                #1#)))
                             |p| (QREFELT $ 7))))))) 

(SDEFUN |GAUSSFAC;findelt| ((|q| |Integer|) ($ |Integer|))
        (SPROG
         ((|t| (|FMod|)) (|s| (|FMod|)) (#1=#:G141 NIL) (|i| NIL)
          (|qq1| (|FMod|)) (|r1| (|Union| (|Integer|) "failed"))
          (|r| #2=(|Integer|)) (#3=#:G116 NIL) (|q1| #2#))
         (SEQ (LETT |q1| (- |q| 1)) (LETT |r| |q1|)
              (LETT |r1| (SPADCALL |r| 4 (QREFELT $ 9)))
              (SEQ G190 (COND ((NULL (NULL (QEQCAR |r1| 1))) (GO G191)))
                   (SEQ
                    (LETT |r|
                          (PROG2 (LETT #3# |r1|)
                              (QCDR #3#)
                            (|check_union2| (QEQCAR #3# 0) (|Integer|)
                                            (|Union| (|Integer|) "failed")
                                            #3#)))
                    (EXIT (LETT |r1| (SPADCALL |r| 2 (QREFELT $ 9)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |s| (SPADCALL 1 |q| (QREFELT $ 18)))
              (LETT |qq1| (SPADCALL |q1| |q| (QREFELT $ 18)))
              (SEQ (LETT |i| 2) G190
                   (COND
                    ((NULL
                      (COND
                       ((SPADCALL |s| (|spadConstant| $ 14) (QREFELT $ 20)) 'T)
                       ('T (SPADCALL |s| |qq1| (QREFELT $ 20)))))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |s|
                           (SPADCALL (SPADCALL |i| |q| (QREFELT $ 18))
                                     (PROG1 (LETT #1# |r|)
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                     (QREFELT $ 22)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |t| |s|)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |t| |qq1| (QREFELT $ 23))) (GO G191)))
                   (SEQ (LETT |s| |t|)
                        (EXIT (LETT |t| (SPADCALL |t| 2 (QREFELT $ 25)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |s| (QREFELT $ 26)))))) 

(SDEFUN |GAUSSFAC;sumsq1| ((|p| . #1=(|Integer|)) ($ |List| (|Integer|)))
        (SPROG ((|s| (|Integer|)) (|u| #1#) (|w| (|Integer|)))
               (SEQ (LETT |s| (|GAUSSFAC;findelt| |p| $)) (LETT |u| |p|)
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL (SPADCALL |u| 2 (QREFELT $ 27)) |p|
                                      (QREFELT $ 28)))
                           (GO G191)))
                         (SEQ (LETT |w| (REM |u| |s|)) (LETT |u| |s|)
                              (EXIT (LETT |s| |w|)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (LIST |u| |s|))))) 

(SDEFUN |GAUSSFAC;intfactor|
        ((|n| |Integer|) ($ |Factored| (|Complex| (|Integer|))))
        (SPROG
         ((|r|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|Complex| (|Integer|)))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|z| #1=(|Complex| (|Integer|))) (|sz| (|List| (|Integer|)))
          (|unity| #1#) (|exp| (|NonNegativeInteger|)) (#2=#:G165 NIL)
          (|term| NIL) (|lfn| (|Factored| (|Integer|))))
         (SEQ (LETT |lfn| (SPADCALL |n| (QREFELT $ 31))) (LETT |r| NIL)
              (LETT |unity|
                    (SPADCALL (SPADCALL |lfn| (QREFELT $ 32)) 0
                              (QREFELT $ 16)))
              (SEQ (LETT |term| NIL) (LETT #2# (SPADCALL |lfn| (QREFELT $ 36)))
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |term| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |n| (QVELT |term| 1))
                        (LETT |exp| (QVELT |term| 2))
                        (EXIT
                         (COND
                          ((EQL |n| 2)
                           (SEQ
                            (LETT |r|
                                  (CONS
                                   (VECTOR (CONS 3 "prime") (QREFELT $ 17)
                                           (SPADCALL 2 |exp| (QREFELT $ 37)))
                                   |r|))
                            (EXIT
                             (LETT |unity|
                                   (SPADCALL |unity|
                                             (SPADCALL
                                              (SPADCALL 0 -1 (QREFELT $ 16))
                                              (REM |exp| 4) (QREFELT $ 38))
                                             (QREFELT $ 39))))))
                          ((EQL (REM |n| 4) 3)
                           (LETT |r|
                                 (CONS
                                  (VECTOR (CONS 3 "prime")
                                          (SPADCALL |n| 0 (QREFELT $ 16))
                                          |exp|)
                                  |r|)))
                          ('T
                           (SEQ (LETT |sz| (|GAUSSFAC;sumsq1| |n| $))
                                (LETT |z|
                                      (SPADCALL
                                       (SPADCALL |sz| 1 (QREFELT $ 41))
                                       (SPADCALL |sz| 2 (QREFELT $ 41))
                                       (QREFELT $ 16)))
                                (EXIT
                                 (LETT |r|
                                       (CONS
                                        (VECTOR (CONS 3 "prime") |z| |exp|)
                                        (CONS
                                         (VECTOR (CONS 3 "prime")
                                                 (SPADCALL |z| (QREFELT $ 42))
                                                 |exp|)
                                         |r|)))))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |unity| |r| (QREFELT $ 46)))))) 

(SDEFUN |GAUSSFAC;factor;CF;7|
        ((|m| |Complex| (|Integer|)) ($ |Factored| (|Complex| (|Integer|))))
        (SPROG
         ((|unity| (|Complex| (|Integer|)))
          (|result|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|Complex| (|Integer|)))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|z| (|Complex| (|Integer|)))
          (|part|
           (|Record|
            (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
            (|:| |factor| (|Complex| (|Integer|)))
            (|:| |exponent| (|NonNegativeInteger|))))
          (|g0| (|Complex| (|Integer|))) (|exp| #5=(|NonNegativeInteger|))
          (|n| (|Integer|)) (#6=#:G186 NIL) (|term| NIL)
          (|factn|
           (|List|
            (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#))
                      (|:| |factor| (|Integer|)) (|:| |exponent| #5#))))
          (|r| #7=(|Factored| (|Complex| (|Integer|)))) (|b| (|Integer|))
          (#8=#:G116 NIL) (|a| (|Integer|)) (|d| (|Integer|)) (|ris| #7#))
         (SEQ
          (COND
           ((SPADCALL |m| (|spadConstant| $ 48) (QREFELT $ 49))
            (SPADCALL (|spadConstant| $ 48) 1 (QREFELT $ 50)))
           (#9='T
            (SEQ (LETT |a| (SPADCALL |m| (QREFELT $ 51)))
                 (LETT |b| (SPADCALL |m| (QREFELT $ 52)))
                 (EXIT
                  (COND ((EQL |b| 0) (|GAUSSFAC;intfactor| |a| $))
                        ((EQL |a| 0)
                         (SEQ (LETT |ris| (|GAUSSFAC;intfactor| |b| $))
                              (LETT |unity|
                                    (SPADCALL (SPADCALL |ris| (QREFELT $ 53))
                                              (SPADCALL 0 1 (QREFELT $ 16))
                                              (QREFELT $ 39)))
                              (EXIT
                               (SPADCALL |unity|
                                         (SPADCALL |ris| (QREFELT $ 54))
                                         (QREFELT $ 46)))))
                        (#9#
                         (SEQ (LETT |d| (GCD |a| |b|)) (LETT |result| NIL)
                              (LETT |unity| (|spadConstant| $ 55))
                              (COND
                               ((SPADCALL |d| 1 (QREFELT $ 56))
                                (SEQ
                                 (LETT |a|
                                       (PROG2
                                           (LETT #8#
                                                 (SPADCALL |a| |d|
                                                           (QREFELT $ 9)))
                                           (QCDR #8#)
                                         (|check_union2| (QEQCAR #8# 0)
                                                         (|Integer|)
                                                         (|Union| (|Integer|)
                                                                  #10="failed")
                                                         #8#)))
                                 (LETT |b|
                                       (PROG2
                                           (LETT #8#
                                                 (SPADCALL |b| |d|
                                                           (QREFELT $ 9)))
                                           (QCDR #8#)
                                         (|check_union2| (QEQCAR #8# 0)
                                                         (|Integer|)
                                                         (|Union| (|Integer|)
                                                                  #10#)
                                                         #8#)))
                                 (LETT |r| (|GAUSSFAC;intfactor| |d| $))
                                 (LETT |result| (SPADCALL |r| (QREFELT $ 54)))
                                 (LETT |unity| (SPADCALL |r| (QREFELT $ 53)))
                                 (EXIT
                                  (LETT |m|
                                        (SPADCALL |a| |b| (QREFELT $ 16)))))))
                              (LETT |n|
                                    (+ (SPADCALL |a| 2 (QREFELT $ 27))
                                       (SPADCALL |b| 2 (QREFELT $ 27))))
                              (LETT |factn|
                                    (SPADCALL (SPADCALL |n| (QREFELT $ 31))
                                              (QREFELT $ 36)))
                              (LETT |part|
                                    (VECTOR (CONS 3 "prime")
                                            (|spadConstant| $ 48) 0))
                              (SEQ (LETT |term| NIL) (LETT #6# |factn|) G190
                                   (COND
                                    ((OR (ATOM #6#)
                                         (PROGN (LETT |term| (CAR #6#)) NIL))
                                     (GO G191)))
                                   (SEQ (LETT |n| (QVELT |term| 1))
                                        (LETT |exp| (QVELT |term| 2))
                                        (EXIT
                                         (COND
                                          ((EQL |n| 2)
                                           (SEQ
                                            (LETT |part|
                                                  (VECTOR (CONS 3 "prime")
                                                          (QREFELT $ 17)
                                                          |exp|))
                                            (LETT |m|
                                                  (SPADCALL |m|
                                                            (SPADCALL
                                                             (QREFELT $ 17)
                                                             |exp|
                                                             (QREFELT $ 38))
                                                            (QREFELT $ 57)))
                                            (EXIT
                                             (LETT |result|
                                                   (CONS |part| |result|)))))
                                          ((EQL (REM |n| 4) 3)
                                           (SEQ
                                            (LETT |g0|
                                                  (SPADCALL |n| 0
                                                            (QREFELT $ 16)))
                                            (LETT |part|
                                                  (VECTOR (CONS 3 "prime") |g0|
                                                          (QUOTIENT2 |exp| 2)))
                                            (LETT |m|
                                                  (SPADCALL |m| |g0|
                                                            (QREFELT $ 57)))
                                            (EXIT
                                             (LETT |result|
                                                   (CONS |part| |result|)))))
                                          ('T
                                           (SEQ
                                            (LETT |z|
                                                  (SPADCALL |m|
                                                            (SPADCALL |n| 0
                                                                      (QREFELT
                                                                       $ 16))
                                                            (QREFELT $ 58)))
                                            (LETT |part|
                                                  (VECTOR (CONS 3 "prime") |z|
                                                          |exp|))
                                            (LETT |z|
                                                  (SPADCALL |z| |exp|
                                                            (QREFELT $ 38)))
                                            (LETT |m|
                                                  (SPADCALL |m| |z|
                                                            (QREFELT $ 57)))
                                            (EXIT
                                             (LETT |result|
                                                   (CONS |part|
                                                         |result|))))))))
                                   (LETT #6# (CDR #6#)) (GO G190) G191
                                   (EXIT NIL))
                              (COND
                               ((SPADCALL |m| (|spadConstant| $ 55)
                                          (QREFELT $ 59))
                                (LETT |unity|
                                      (SPADCALL |unity| |m| (QREFELT $ 39)))))
                              (EXIT
                               (SPADCALL |unity| |result|
                                         (QREFELT $ 46))))))))))))) 

(SDEFUN |GAUSSFAC;sumSquares;IL;8| ((|p| |Integer|) ($ |List| (|Integer|)))
        (COND ((EQL |p| 2) (LIST 1 1))
              ((SPADCALL (REM |p| 4) 1 (QREFELT $ 56))
               (|error| "no solutions"))
              ('T (|GAUSSFAC;sumsq1| |p| $)))) 

(SDEFUN |GAUSSFAC;prime?;CB;9| ((|a| |Complex| (|Integer|)) ($ |Boolean|))
        (SPROG
         ((|p| (|Integer|)) (|im| (|Integer|)) (|re| (|Integer|))
          (|n| (|Integer|)))
         (SEQ (LETT |n| (SPADCALL |a| (QREFELT $ 62)))
              (EXIT
               (COND ((OR (EQL |n| 0) (EQL |n| 1)) NIL)
                     ((SPADCALL |n| (QREFELT $ 64)) 'T)
                     (#1='T
                      (SEQ (LETT |re| (SPADCALL |a| (QREFELT $ 51)))
                           (LETT |im| (SPADCALL |a| (QREFELT $ 52)))
                           (COND
                            ((SPADCALL |re| 0 (QREFELT $ 56))
                             (COND
                              ((SPADCALL |im| 0 (QREFELT $ 56)) (EXIT NIL)))))
                           (LETT |p| (ABS (+ |re| |im|)))
                           (EXIT
                            (COND ((SPADCALL (REM |p| 4) 3 (QREFELT $ 56)) NIL)
                                  (#1# (SPADCALL |p| (QREFELT $ 64)))))))))))) 

(DECLAIM (NOTINLINE |GaussianFactorizationPackage;|)) 

(DEFUN |GaussianFactorizationPackage| ()
  (SPROG NIL
         (PROG (#1=#:G196)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|GaussianFactorizationPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|GaussianFactorizationPackage|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|GaussianFactorizationPackage;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|GaussianFactorizationPackage|)))))))))) 

(DEFUN |GaussianFactorizationPackage;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|GaussianFactorizationPackage|))
          (LETT $ (GETREFV 66))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|GaussianFactorizationPackage| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 13
                    (|ModularRing| (|Integer|) (|Integer|)
                                   (CONS (|function| |GAUSSFAC;reduction|) $)
                                   (CONS (|function| |GAUSSFAC;merge|) $)
                                   (CONS (|function| |GAUSSFAC;exactquo|) $)))
          (QSETREFV $ 17 (SPADCALL 1 1 (QREFELT $ 16)))
          $))) 

(MAKEPROP '|GaussianFactorizationPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (0 . |positiveRemainder|)
              (|Union| $ '"failed") (6 . |exquo|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 10 '"failed")
              (12 . |extendedEuclidean|) '|FMod| (19 . |One|) (|Complex| 6)
              (23 . |complex|) '|fact2| (29 . |reduce|) (|Boolean|) (35 . =)
              (|NonNegativeInteger|) (41 . ^) (47 . ~=) (|PositiveInteger|)
              (53 . ^) (59 . |coerce|) (64 . ^) (70 . >) (|Factored| 6)
              (|IntegerFactorizationPackage| 6) (76 . |factor|) (81 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 33) (|:| |factor| 6) (|:| |exponent| 21))
              (|List| 34) (86 . |factorList|) (91 . *) (97 . ^) (103 . *)
              (|List| 6) (109 . |elt|) (115 . |conjugate|)
              (|Record| (|:| |flag| 33) (|:| |factor| 15) (|:| |exponent| 21))
              (|List| 43) (|Factored| 15) (120 . |makeFR|) (126 . |Zero|)
              (130 . |Zero|) (134 . =) (140 . |primeFactor|) (146 . |real|)
              (151 . |imag|) (156 . |unit|) (161 . |factorList|) (166 . |One|)
              (170 . ~=) (176 . |quo|) (182 . |gcd|) (188 . ~=)
              |GAUSSFAC;factor;CF;7| |GAUSSFAC;sumSquares;IL;8| (194 . |norm|)
              (|IntegerPrimesPackage| 6) (199 . |prime?|)
              |GAUSSFAC;prime?;CB;9|)
           '#(|sumSquares| 204 |prime?| 209 |factor| 214) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|factor|
                                 ((|Factored| (|Complex| (|Integer|)))
                                  (|Complex| (|Integer|))))
                                T)
                              '((|sumSquares|
                                 ((|List| (|Integer|)) (|Integer|)))
                                T)
                              '((|prime?|
                                 ((|Boolean|) (|Complex| (|Integer|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 65
                                            '(2 6 0 0 0 7 2 6 8 0 0 9 3 6 11 0
                                              0 0 12 0 13 0 14 2 15 0 6 6 16 2
                                              13 0 6 6 18 2 13 19 0 0 20 2 13 0
                                              0 21 22 2 13 19 0 0 23 2 13 0 0
                                              24 25 1 13 6 0 26 2 6 0 0 24 27 2
                                              6 19 0 0 28 1 30 29 6 31 1 29 6 0
                                              32 1 29 35 0 36 2 21 0 24 0 37 2
                                              15 0 0 21 38 2 15 0 0 0 39 2 40 6
                                              0 6 41 1 15 0 0 42 2 45 0 15 44
                                              46 0 13 0 47 0 15 0 48 2 15 19 0
                                              0 49 2 45 0 15 21 50 1 15 6 0 51
                                              1 15 6 0 52 1 45 15 0 53 1 45 44
                                              0 54 0 15 0 55 2 6 19 0 0 56 2 15
                                              0 0 0 57 2 15 0 0 0 58 2 15 19 0
                                              0 59 1 15 6 0 62 1 63 19 6 64 1 0
                                              40 6 61 1 0 19 15 65 1 0 45 15
                                              60)))))
           '|lookupComplete|)) 

(MAKEPROP '|GaussianFactorizationPackage| 'NILADIC T) 
