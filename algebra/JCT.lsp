
(DEFUN |JCT;num1| ($)
  (COND
   ((OR
     (SPADCALL (SPADCALL (QREFELT $ 11)) (SPADCALL (QREFELT $ 12))
               (QREFELT $ 14))
     (SPADCALL (SPADCALL (QREFELT $ 11)) (QVSIZE (QREFELT $ 8))
               (QREFELT $ 16)))
    (|error| "Number of variables must match"))
   ('T (SPADCALL (QREFELT $ 11))))) 

(DEFUN |JCT;num2| ($)
  (COND
   ((OR
     (SPADCALL (SPADCALL (QREFELT $ 17)) (SPADCALL (QREFELT $ 18))
               (QREFELT $ 14))
     (SPADCALL (SPADCALL (QREFELT $ 17)) (QVSIZE (QREFELT $ 9))
               (QREFELT $ 16)))
    (|error| "Number of variables must match"))
   ('T (SPADCALL (QREFELT $ 17))))) 

(DEFUN |JCT;jacobi| (|y| $)
  (PROG (|res| |tmp| #1=#:G114 #2=#:G120 |i| JM |ly|)
    (RETURN
     (SEQ (LETT |ly| (SPADCALL |y| (QREFELT $ 26)) . #3=(|JCT;jacobi|))
          (LETT JM (SPADCALL |ly| (QREFELT $ 30)) . #3#)
          (LETT |res|
                (MAKE_MATRIX1 (QVSIZE |y|) (QREFELT $ 19)
                              (|spadConstant| $ 31))
                . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #2# (QREFELT $ 19) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (LETT |tmp|
                      (SPADCALL |ly|
                                (PROG1 (LETT #1# |i| . #3#)
                                  (|check_subtype| (> #1# 0)
                                                   '(|PositiveInteger|) #1#))
                                JM (QREFELT $ 33))
                      . #3#)
                (EXIT
                 (LETT |res|
                       (SPADCALL |res| |i|
                                 (SPADCALL (QCAR |tmp|) (QREFELT $ 34))
                                 (QREFELT $ 37))
                       . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |JCT;transform;JB1Jbe;4| (|jv| $)
  (PROG (|res| #1=#:G136 #2=#:G142 #3=#:G144 |k| #4=#:G143 |qint| |pint|
         #5=#:G126 |i| |jt| |ans|)
    (RETURN
     (SEQ
      (LETT |ans|
            (SPADCALL (SPADCALL |jv| (QREFELT $ 43)) (QREFELT $ 23)
                      (QREFELT $ 45))
            . #6=(|JCT;transform;JB1Jbe;4|))
      (EXIT
       (COND ((QEQCAR |ans| 0) (QCDR |ans|))
             (#7='T
              (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT $ 47)) . #6#)
                   (COND
                    ((EQUAL |jt| '|Const|)
                     (LETT |res| (|spadConstant| $ 48) . #6#))
                    ((EQUAL |jt| '|Indep|)
                     (LETT |res|
                           (QAREF1O (QREFELT $ 8)
                                    (-
                                     (+ (SPADCALL |jv| (QREFELT $ 49))
                                        (SPADCALL (QREFELT $ 8)
                                                  (QREFELT $ 50)))
                                     1)
                                    1)
                           . #6#))
                    ((EQUAL |jt| '|Dep|)
                     (LETT |res|
                           (QAREF1O (QREFELT $ 9)
                                    (-
                                     (+ (SPADCALL |jv| (QREFELT $ 49))
                                        (SPADCALL (QREFELT $ 9)
                                                  (QREFELT $ 50)))
                                     1)
                                    1)
                           . #6#))
                    (#7#
                     (SEQ (LETT |i| (SPADCALL |jv| (QREFELT $ 51)) . #6#)
                          (LETT |pint|
                                (SPADCALL |jv|
                                          (PROG1 (LETT #5# |i| . #6#)
                                            (|check_subtype| (> #5# 0)
                                                             '(|PositiveInteger|)
                                                             #5#))
                                          (QREFELT $ 52))
                                . #6#)
                          (LETT |qint| (SPADCALL |pint| (QREFELT $ 53)) . #6#)
                          (EXIT
                           (LETT |res|
                                 (SPADCALL (ELT $ 54)
                                           (PROGN
                                            (LETT #4#
                                                  (GETREFV #8=(QREFELT $ 19))
                                                  . #6#)
                                            (SEQ (LETT |k| 1 . #6#)
                                                 (LETT #3# #8# . #6#)
                                                 (LETT #2# 0 . #6#) G190
                                                 (COND
                                                  ((|greater_SI| |k| #3#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (SETELT #4# #2#
                                                           (SPADCALL
                                                            (QAREF2O
                                                             (QCAR
                                                              (QREFELT $ 41))
                                                             |i| |k| 1 1)
                                                            (SPADCALL |qint|
                                                                      (PROG1
                                                                          (LETT
                                                                           #1#
                                                                           |k|
                                                                           . #6#)
                                                                        (|check_subtype|
                                                                         (> #1#
                                                                            0)
                                                                         '(|PositiveInteger|)
                                                                         #1#))
                                                                      (QREFELT
                                                                       $ 55))
                                                            (QREFELT $ 56)))))
                                                 (LETT #2#
                                                       (PROG1 (|inc_SI| #2#)
                                                         (LETT |k|
                                                               (|inc_SI| |k|)
                                                               . #6#))
                                                       . #6#)
                                                 (GO G190) G191 (EXIT NIL))
                                            #4#)
                                           (|spadConstant| $ 31)
                                           (QREFELT $ 58))
                                 . #6#)))))
                   (EXIT
                    (SPADCALL (QREFELT $ 23) (SPADCALL |jv| (QREFELT $ 43))
                              |res| (QREFELT $ 59))))))))))) 

(DEFUN |JCT;transform;JbeJbe;5| (|e1| $)
  (PROG (|e2| #1=#:G151 |jv| #2=#:G152 |je| JE #3=#:G150 #4=#:G149 JV)
    (RETURN
     (SEQ
      (LETT JV (SPADCALL |e1| (QREFELT $ 62)) . #5=(|JCT;transform;JbeJbe;5|))
      (LETT JE
            (PROGN
             (LETT #4# NIL . #5#)
             (SEQ (LETT |jv| NIL . #5#) (LETT #3# JV . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |jv| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4#
                          (CONS
                           (SPADCALL (SPADCALL |jv| (QREFELT $ 43))
                                     (QREFELT $ 63))
                           #4#)
                          . #5#)))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (LETT |e2| (SPADCALL (SPADCALL |e1| (QREFELT $ 64)) (QREFELT $ 63))
            . #5#)
      (SEQ (LETT |je| NIL . #5#) (LETT #2# JE . #5#) (LETT |jv| NIL . #5#)
           (LETT #1# JV . #5#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |jv| (CAR #1#) . #5#) NIL) (ATOM #2#)
                 (PROGN (LETT |je| (CAR #2#) . #5#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (LETT |e2|
                   (SPADCALL |e2|
                             (SPADCALL |je| (SPADCALL |jv| (QREFELT $ 53))
                                       (QREFELT $ 66))
                             (QREFELT $ 68))
                   . #5#)))
           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #5#)) . #5#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |e2|))))) 

(DECLAIM (NOTINLINE |JetCoordinateTransformation;|)) 

(DEFUN |JetCoordinateTransformation| (&REST #1=#:G153)
  (PROG ()
    (RETURN
     (PROG (#2=#:G154)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|JetCoordinateTransformation|)
                                           '|domainEqualList|)
                . #3=(|JetCoordinateTransformation|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |JetCoordinateTransformation;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|JetCoordinateTransformation|))))))))))) 

(DEFUN |JetCoordinateTransformation;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|JetCoordinateTransformation|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|JetCoordinateTransformation| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 70) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|JetCoordinateTransformation|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 19 (|JCT;num1| $))
      (QSETREFV $ 20 (|JCT;num2| $))
      (QSETREFV $ 23 (SPADCALL (QREFELT $ 22)))
      (QSETREFV $ 41 (SPADCALL (|JCT;jacobi| |#3| $) (QREFELT $ 40)))
      $)))) 

(MAKEPROP '|JetCoordinateTransformation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|PositiveInteger|)
              (0 . |numIndVar|) (4 . |numIndVar|) (|Boolean|) (8 . ~=)
              (|NonNegativeInteger|) (14 . ~=) (20 . |numDepVar|)
              (24 . |numDepVar|) '|nn| '|mm| (|Table| 42 29)
              (28 . |dictionary|) '|remember| (|List| 29) (|Vector| 29)
              (32 . |entries|) (|SparseEchelonMatrix| 7 $) (|List| $)
              (|JetBundleExpression| 7) (37 . |jacobiMatrix|) (42 . |Zero|)
              (|Record| (|:| |DSys| 28) (|:| |JVars| (|List| (|List| 7))))
              (46 . |formalDiff2|) (53 . |vector|) (|Integer|) (|Matrix| 29)
              (58 . |setColumn!|) (|Record| (|:| |Inv| 36) (|:| |Pivots| 24))
              (|LUDecomposition| 29) (65 . |LUInverse|) 'DYI (|Expression| 35)
              (70 . |coerce|) (|Union| 29 '"failed") (75 . |search|) (|Symbol|)
              (81 . |type|) (86 . |One|) (90 . |index|) (95 . |minIndex|)
              (100 . |class|) (105 . |integrate|) |JCT;transform;JB1Jbe;4|
              (111 . +) (117 . |formalDiff|) (123 . *) (|Mapping| 29 29 29)
              (129 . |reduce|) (136 . |setelt|) (|List| 6)
              (|JetBundleExpression| 6) (143 . |jetVariables|) (148 . |coerce|)
              (153 . |coerce|) (|Equation| 29) (158 . =) (|Equation| $)
              (164 . |eval|) |JCT;transform;JbeJbe;5|)
           '#(|transform| 170) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 69
                                                 '(0 6 10 11 0 7 10 12 2 10 13
                                                   0 0 14 2 15 13 0 0 16 0 6 10
                                                   17 0 7 10 18 0 21 0 22 1 25
                                                   24 0 26 1 29 27 28 30 0 29 0
                                                   31 3 29 32 28 10 27 33 1 25
                                                   0 24 34 3 36 0 0 35 25 37 1
                                                   39 38 36 40 1 6 42 0 43 2 21
                                                   44 42 0 45 1 6 46 0 47 0 29
                                                   0 48 1 6 10 0 49 1 25 35 0
                                                   50 1 6 15 0 51 2 6 0 0 10 52
                                                   2 29 0 0 0 54 2 29 0 0 10 55
                                                   2 29 0 0 0 56 3 25 29 57 0
                                                   29 58 3 21 29 0 42 29 59 1
                                                   61 60 0 62 1 29 0 42 63 1 61
                                                   42 0 64 2 65 0 29 29 66 2 29
                                                   0 0 67 68 1 0 29 61 69 1 0
                                                   29 6 53)))))
           '|lookupComplete|)) 
