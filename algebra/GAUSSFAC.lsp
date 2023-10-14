
(/VERSIONCHECK 2) 

(DEFUN |GAUSSFAC;reduction| (|u| |p| $)
  (COND ((EQL |p| 0) |u|) ('T (SPADCALL |u| |p| (QREFELT $ 7))))) 

(DEFUN |GAUSSFAC;merge| (|p| |q| $)
  (COND ((EQL |p| |q|) (CONS 0 |p|)) ((EQL |p| 0) (CONS 0 |q|))
        ((EQL |q| 0) (CONS 0 |p|)) ('T (CONS 1 "failed")))) 

(DEFUN |GAUSSFAC;exactquo| (|u| |v| |p| $)
  (PROG (#1=#:G144)
    (RETURN
     (COND ((EQL |p| 0) (SPADCALL |u| |v| (QREFELT $ 9)))
           ((EQL (REM |v| |p|) 0) (CONS 1 "failed"))
           ('T
            (CONS 0
                  (SPADCALL
                   (QCAR
                    (PROG2
                        (LETT #1# (SPADCALL |v| |p| |u| (QREFELT $ 12))
                              |GAUSSFAC;exactquo|)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0)
                                     (|Record| (|:| |coef1| (|Integer|))
                                               (|:| |coef2| (|Integer|)))
                                     #1#)))
                   |p| (QREFELT $ 7)))))))) 

(DEFUN |GAUSSFAC;findelt| (|q| $)
  (PROG (|t| |s| #1=#:G164 |i| |qq1| |r1| |r| #2=#:G139 |q1|)
    (RETURN
     (SEQ (LETT |q1| (- |q| 1) . #3=(|GAUSSFAC;findelt|)) (LETT |r| |q1| . #3#)
          (LETT |r1| (SPADCALL |r| 4 (QREFELT $ 9)) . #3#)
          (SEQ G190
               (COND ((NULL (COND ((QEQCAR |r1| 1) 'NIL) ('T 'T))) (GO G191)))
               (SEQ
                (LETT |r|
                      (PROG2 (LETT #2# |r1| . #3#)
                          (QCDR #2#)
                        (|check_union| (QEQCAR #2# 0) (|Integer|) #2#))
                      . #3#)
                (EXIT (LETT |r1| (SPADCALL |r| 2 (QREFELT $ 9)) . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |s| (SPADCALL 1 |q| (QREFELT $ 18)) . #3#)
          (LETT |qq1| (SPADCALL |q1| |q| (QREFELT $ 18)) . #3#)
          (SEQ (LETT |i| 2 . #3#) G190
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
                                 (PROG1 (LETT #1# |r| . #3#)
                                   (|check_subtype| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    #1#))
                                 (QREFELT $ 22))
                       . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |t| |s| . #3#)
          (SEQ G190
               (COND ((NULL (SPADCALL |t| |qq1| (QREFELT $ 23))) (GO G191)))
               (SEQ (LETT |s| |t| . #3#)
                    (EXIT (LETT |t| (SPADCALL |t| 2 (QREFELT $ 25)) . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |s| (QREFELT $ 26))))))) 

(DEFUN |GAUSSFAC;sumsq1| (|p| $)
  (PROG (|s| |u| |w|)
    (RETURN
     (SEQ (LETT |s| (|GAUSSFAC;findelt| |p| $) . #1=(|GAUSSFAC;sumsq1|))
          (LETT |u| |p| . #1#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL |u| 2 (QREFELT $ 27)) |p|
                            (QREFELT $ 28)))
                 (GO G191)))
               (SEQ (LETT |w| (REM |u| |s|) . #1#) (LETT |u| |s| . #1#)
                    (EXIT (LETT |s| |w| . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |u| |s|)))))) 

(DEFUN |GAUSSFAC;intfactor| (|n| $)
  (PROG (|r| |z| |sz| |unity| #1=#:G186 |exp| #2=#:G194 |term| |lfn|)
    (RETURN
     (SEQ
      (LETT |lfn| (SPADCALL |n| (QREFELT $ 31)) . #3=(|GAUSSFAC;intfactor|))
      (LETT |r| NIL . #3#)
      (LETT |unity| (SPADCALL (SPADCALL |lfn| (QREFELT $ 32)) 0 (QREFELT $ 16))
            . #3#)
      (SEQ (LETT |term| NIL . #3#)
           (LETT #2# (SPADCALL |lfn| (QREFELT $ 36)) . #3#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |term| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ (LETT |n| (QVELT |term| 1) . #3#)
                (LETT |exp| (QVELT |term| 2) . #3#)
                (EXIT
                 (COND
                  ((EQL |n| 2)
                   (SEQ
                    (LETT |r|
                          (CONS
                           (VECTOR (CONS 3 "prime") (QREFELT $ 17)
                                   (SPADCALL 2 |exp| (QREFELT $ 37)))
                           |r|)
                          . #3#)
                    (EXIT
                     (LETT |unity|
                           (SPADCALL |unity|
                                     (SPADCALL (SPADCALL 0 -1 (QREFELT $ 16))
                                               (PROG1
                                                   (LETT #1# (REM |exp| 4)
                                                         . #3#)
                                                 (|check_subtype| (>= #1# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  #1#))
                                               (QREFELT $ 38))
                                     (QREFELT $ 39))
                           . #3#))))
                  ((EQL (REM |n| 4) 3)
                   (LETT |r|
                         (CONS
                          (VECTOR (CONS 3 "prime")
                                  (SPADCALL |n| 0 (QREFELT $ 16)) |exp|)
                          |r|)
                         . #3#))
                  ('T
                   (SEQ (LETT |sz| (|GAUSSFAC;sumsq1| |n| $) . #3#)
                        (LETT |z|
                              (SPADCALL (SPADCALL |sz| 1 (QREFELT $ 41))
                                        (SPADCALL |sz| 2 (QREFELT $ 41))
                                        (QREFELT $ 16))
                              . #3#)
                        (EXIT
                         (LETT |r|
                               (CONS (VECTOR (CONS 3 "prime") |z| |exp|)
                                     (CONS
                                      (VECTOR (CONS 3 "prime")
                                              (SPADCALL |z| (QREFELT $ 42))
                                              |exp|)
                                      |r|))
                               . #3#)))))))
           (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |unity| |r| (QREFELT $ 46))))))) 

(DEFUN |GAUSSFAC;factor;CF;7| (|m| $)
  (PROG (|unity| |result| |z| #1=#:G210 |part| |g0| #2=#:G206 |exp| |n|
         #3=#:G219 |term| |factn| |r| |b| #4=#:G139 |a| |d| |ris|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |m| (|spadConstant| $ 48) (QREFELT $ 49))
        (SPADCALL (|spadConstant| $ 48) 1 (QREFELT $ 50)))
       (#5='T
        (SEQ
         (LETT |a| (SPADCALL |m| (QREFELT $ 51)) . #6=(|GAUSSFAC;factor;CF;7|))
         (LETT |b| (SPADCALL |m| (QREFELT $ 52)) . #6#)
         (EXIT
          (COND ((EQL |b| 0) (|GAUSSFAC;intfactor| |a| $))
                ((EQL |a| 0)
                 (SEQ (LETT |ris| (|GAUSSFAC;intfactor| |b| $) . #6#)
                      (LETT |unity|
                            (SPADCALL (SPADCALL |ris| (QREFELT $ 53))
                                      (SPADCALL 0 1 (QREFELT $ 16))
                                      (QREFELT $ 39))
                            . #6#)
                      (EXIT
                       (SPADCALL |unity| (SPADCALL |ris| (QREFELT $ 54))
                                 (QREFELT $ 46)))))
                (#5#
                 (SEQ (LETT |d| (GCD |a| |b|) . #6#) (LETT |result| NIL . #6#)
                      (LETT |unity| (|spadConstant| $ 55) . #6#)
                      (COND
                       ((SPADCALL |d| 1 (QREFELT $ 56))
                        (SEQ
                         (LETT |a|
                               (PROG2
                                   (LETT #4# (SPADCALL |a| |d| (QREFELT $ 9))
                                         . #6#)
                                   (QCDR #4#)
                                 (|check_union| (QEQCAR #4# 0) (|Integer|)
                                                #4#))
                               . #6#)
                         (LETT |b|
                               (PROG2
                                   (LETT #4# (SPADCALL |b| |d| (QREFELT $ 9))
                                         . #6#)
                                   (QCDR #4#)
                                 (|check_union| (QEQCAR #4# 0) (|Integer|)
                                                #4#))
                               . #6#)
                         (LETT |r| (|GAUSSFAC;intfactor| |d| $) . #6#)
                         (LETT |result| (SPADCALL |r| (QREFELT $ 54)) . #6#)
                         (LETT |unity| (SPADCALL |r| (QREFELT $ 53)) . #6#)
                         (EXIT
                          (LETT |m| (SPADCALL |a| |b| (QREFELT $ 16))
                                . #6#)))))
                      (LETT |n|
                            (+ (SPADCALL |a| 2 (QREFELT $ 27))
                               (SPADCALL |b| 2 (QREFELT $ 27)))
                            . #6#)
                      (LETT |factn|
                            (SPADCALL (SPADCALL |n| (QREFELT $ 31))
                                      (QREFELT $ 36))
                            . #6#)
                      (LETT |part|
                            (VECTOR (CONS 3 "prime") (|spadConstant| $ 48) 0)
                            . #6#)
                      (SEQ (LETT |term| NIL . #6#) (LETT #3# |factn| . #6#)
                           G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN (LETT |term| (CAR #3#) . #6#) NIL))
                             (GO G191)))
                           (SEQ (LETT |n| (QVELT |term| 1) . #6#)
                                (LETT |exp| (QVELT |term| 2) . #6#)
                                (EXIT
                                 (COND
                                  ((EQL |n| 2)
                                   (SEQ
                                    (LETT |part|
                                          (VECTOR (CONS 3 "prime")
                                                  (QREFELT $ 17) |exp|)
                                          . #6#)
                                    (LETT |m|
                                          (SPADCALL |m|
                                                    (SPADCALL (QREFELT $ 17)
                                                              (PROG1
                                                                  (LETT #2#
                                                                        |exp|
                                                                        . #6#)
                                                                (|check_subtype|
                                                                 (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #2#))
                                                              (QREFELT $ 38))
                                                    (QREFELT $ 57))
                                          . #6#)
                                    (EXIT
                                     (LETT |result| (CONS |part| |result|)
                                           . #6#))))
                                  ((EQL (REM |n| 4) 3)
                                   (SEQ
                                    (LETT |g0| (SPADCALL |n| 0 (QREFELT $ 16))
                                          . #6#)
                                    (LETT |part|
                                          (VECTOR (CONS 3 "prime") |g0|
                                                  (QUOTIENT2 |exp| 2))
                                          . #6#)
                                    (LETT |m|
                                          (SPADCALL |m| |g0| (QREFELT $ 57))
                                          . #6#)
                                    (EXIT
                                     (LETT |result| (CONS |part| |result|)
                                           . #6#))))
                                  ('T
                                   (SEQ
                                    (LETT |z|
                                          (SPADCALL |m|
                                                    (SPADCALL |n| 0
                                                              (QREFELT $ 16))
                                                    (QREFELT $ 58))
                                          . #6#)
                                    (LETT |part|
                                          (VECTOR (CONS 3 "prime") |z| |exp|)
                                          . #6#)
                                    (LETT |z|
                                          (SPADCALL |z|
                                                    (PROG1
                                                        (LETT #1# |exp| . #6#)
                                                      (|check_subtype|
                                                       (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       #1#))
                                                    (QREFELT $ 38))
                                          . #6#)
                                    (LETT |m| (SPADCALL |m| |z| (QREFELT $ 57))
                                          . #6#)
                                    (EXIT
                                     (LETT |result| (CONS |part| |result|)
                                           . #6#)))))))
                           (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (COND
                       ((SPADCALL |m| (|spadConstant| $ 55) (QREFELT $ 59))
                        (LETT |unity| (SPADCALL |unity| |m| (QREFELT $ 39))
                              . #6#)))
                      (EXIT
                       (SPADCALL |unity| |result| (QREFELT $ 46)))))))))))))) 

(DEFUN |GAUSSFAC;sumSquares;IL;8| (|p| $)
  (COND ((EQL |p| 2) (LIST 1 1))
        ((SPADCALL (REM |p| 4) 1 (QREFELT $ 56)) (|error| "no solutions"))
        ('T (|GAUSSFAC;sumsq1| |p| $)))) 

(DEFUN |GAUSSFAC;prime?;CB;9| (|a| $)
  (PROG (|p| |im| |re| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL |a| (QREFELT $ 62)) . #1=(|GAUSSFAC;prime?;CB;9|))
      (EXIT
       (COND ((OR (EQL |n| 0) (EQL |n| 1)) 'NIL)
             ((SPADCALL |n| (QREFELT $ 64)) 'T)
             (#2='T
              (SEQ (LETT |re| (SPADCALL |a| (QREFELT $ 51)) . #1#)
                   (LETT |im| (SPADCALL |a| (QREFELT $ 52)) . #1#)
                   (COND
                    ((SPADCALL |re| 0 (QREFELT $ 56))
                     (COND ((SPADCALL |im| 0 (QREFELT $ 56)) (EXIT 'NIL)))))
                   (LETT |p| (ABS (+ |re| |im|)) . #1#)
                   (EXIT
                    (COND ((SPADCALL (REM |p| 4) 3 (QREFELT $ 56)) 'NIL)
                          (#2# (SPADCALL |p| (QREFELT $ 64))))))))))))) 

(DEFUN |GaussianFactorizationPackage| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G229)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|GaussianFactorizationPackage|)
                . #2=(|GaussianFactorizationPackage|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|GaussianFactorizationPackage|
                         (LIST
                          (CONS NIL
                                (CONS 1 (|GaussianFactorizationPackage;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache|
                    '|GaussianFactorizationPackage|))))))))))) 

(DEFUN |GaussianFactorizationPackage;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|GaussianFactorizationPackage|)
            . #1=(|GaussianFactorizationPackage|))
      (LETT $ (GETREFV 66) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
      $)))) 

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
              (|Record| (|:| |flg| 33) (|:| |fctr| 6) (|:| |xpnt| 6))
              (|List| 34) (86 . |factorList|) (91 . *) (97 . ^) (103 . *)
              (|List| 6) (109 . |elt|) (115 . |conjugate|)
              (|Record| (|:| |flg| 33) (|:| |fctr| 15) (|:| |xpnt| 6))
              (|List| 43) (|Factored| 15) (120 . |makeFR|) (126 . |Zero|)
              (130 . |Zero|) (134 . =) (140 . |primeFactor|) (146 . |real|)
              (151 . |imag|) (156 . |unit|) (161 . |factorList|) (166 . |One|)
              (170 . ~=) (176 . |quo|) (182 . |gcd|) (188 . ~=)
              |GAUSSFAC;factor;CF;7| |GAUSSFAC;sumSquares;IL;8| (194 . |norm|)
              (|IntegerPrimesPackage| 6) (199 . |prime?|)
              |GAUSSFAC;prime?;CB;9|)
           '#(|sumSquares| 204 |prime?| 209 |factor| 214) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 65
                                                 '(2 6 0 0 0 7 2 6 8 0 0 9 3 6
                                                   11 0 0 0 12 0 13 0 14 2 15 0
                                                   6 6 16 2 13 0 6 6 18 2 13 19
                                                   0 0 20 2 13 0 0 21 22 2 13
                                                   19 0 0 23 2 13 0 0 24 25 1
                                                   13 6 0 26 2 6 0 0 24 27 2 6
                                                   19 0 0 28 1 30 29 6 31 1 29
                                                   6 0 32 1 29 35 0 36 2 6 0 24
                                                   0 37 2 15 0 0 21 38 2 15 0 0
                                                   0 39 2 40 6 0 6 41 1 15 0 0
                                                   42 2 45 0 15 44 46 0 13 0 47
                                                   0 15 0 48 2 15 19 0 0 49 2
                                                   45 0 15 6 50 1 15 6 0 51 1
                                                   15 6 0 52 1 45 15 0 53 1 45
                                                   44 0 54 0 15 0 55 2 6 19 0 0
                                                   56 2 15 0 0 0 57 2 15 0 0 0
                                                   58 2 15 19 0 0 59 1 15 6 0
                                                   62 1 63 19 6 64 1 0 40 6 61
                                                   1 0 19 15 65 1 0 45 15
                                                   60)))))
           '|lookupComplete|)) 

(MAKEPROP '|GaussianFactorizationPackage| 'NILADIC T) 
