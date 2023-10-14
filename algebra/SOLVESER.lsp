
(/VERSIONCHECK 2) 

(DEFUN |SOLVESER;unvectorise;VFIF;1| (|vect| |var| |n| $)
  (PROG (|polyvar| #1=#:G130 |vecti| #2=#:G135 |i| Z)
    (RETURN
     (SEQ
      (LETT Z (SPADCALL (QREFELT $ 8)) . #3=(|SOLVESER;unvectorise;VFIF;1|))
      (LETT |polyvar| (|spadConstant| $ 10) . #3#)
      (SEQ (LETT |i| 1 . #3#) (LETT #2# (+ |n| 1) . #3#) G190
           (COND ((|greater_SI| |i| #2#) (GO G191)))
           (SEQ
            (LETT |vecti|
                  (SPADCALL (SPADCALL |vect| |i| (QREFELT $ 17))
                            (|SPADfirst|
                             (SPADCALL (SPADCALL Z (QREFELT $ 18))
                                       (QREFELT $ 20)))
                            (QREFELT $ 23))
                  . #3#)
            (EXIT
             (LETT |polyvar|
                   (SPADCALL |polyvar|
                             (SPADCALL |vecti|
                                       (SPADCALL |var|
                                                 (PROG1
                                                     (LETT #1#
                                                           (+ (- |n| |i|) 1)
                                                           . #3#)
                                                   (|check_subtype| (>= #1# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    #1#))
                                                 (QREFELT $ 24))
                                       (QREFELT $ 25))
                             (QREFELT $ 26))
                   . #3#)))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |polyvar|))))) 

(DEFUN |SOLVESER;decomposeFunc;4F;2| (|exprf| |exprg| |newH| $)
  (PROG (|newF| #1=#:G144 |newF2| |newF1| |m| N |degG| |degF| |g2| |g1| |f2|
         |f1| X)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT X (SPADCALL (QREFELT $ 8)) . #2=(|SOLVESER;decomposeFunc;4F;2|))
        (LETT |f1| (SPADCALL |exprf| (QREFELT $ 29)) . #2#)
        (LETT |f2| (SPADCALL |exprf| (QREFELT $ 30)) . #2#)
        (LETT |g1| (SPADCALL |exprg| (QREFELT $ 29)) . #2#)
        (LETT |g2| (SPADCALL |exprg| (QREFELT $ 30)) . #2#)
        (LETT |degF|
              (MAX (SPADCALL (SPADCALL |exprf| (QREFELT $ 29)) (QREFELT $ 32))
                   (SPADCALL (SPADCALL |exprf| (QREFELT $ 30)) (QREFELT $ 32)))
              . #2#)
        (LETT |degG|
              (MAX (SPADCALL |g1| (QREFELT $ 32))
                   (SPADCALL |g2| (QREFELT $ 32)))
              . #2#)
        (LETT N (SPADCALL |degF| |degG| (QREFELT $ 34)) . #2#)
        (EXIT
         (COND ((QEQCAR N 1) (PROGN (LETT #1# |exprf| . #2#) (GO #1#)))
               (#3='T
                (SEQ (LETT |m| (QCDR N) . #2#)
                     (LETT |newF1|
                           (|SOLVESER;subsSolve| |f1| |degF| |g1| |g2| |m|
                            |newH| $)
                           . #2#)
                     (COND
                      ((SPADCALL |f2| (|spadConstant| $ 35) (QREFELT $ 37))
                       (LETT |newF2| (CONS 0 (|spadConstant| $ 35)) . #2#))
                      (#3#
                       (LETT |newF2|
                             (|SOLVESER;subsSolve| |f2| |degF| |g1| |g2| |m|
                              |newH| $)
                             . #2#)))
                     (EXIT
                      (COND
                       ((OR (QEQCAR |newF1| 1) (QEQCAR |newF2| 1))
                        (PROGN (LETT #1# |exprf| . #2#) (GO #1#)))
                       ('T
                        (LETT |newF|
                              (SPADCALL (QCDR |newF1|) (QCDR |newF2|)
                                        (QREFELT $ 38))
                              . #2#))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |SOLVESER;subsSolve| (F |DegF| G1 G2 M HH $)
  (PROG (|resul| |solvevarlist| #1=#:G194 #2=#:G198 |solvar| |coeffma| |vec|
         |coeffmat| #3=#:G190 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |coeffmat|
              (SPADCALL (+ |DegF| 1) 1 (|spadConstant| $ 40) (QREFELT $ 42))
              . #4=(|SOLVESER;subsSolve|))
        (SEQ (LETT |i| 0 . #4#) G190 (COND ((|greater_SI| |i| M) (GO G191)))
             (SEQ
              (EXIT
               (LETT |coeffmat|
                     (SPADCALL |coeffmat|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL G1
                                            (PROG1 (LETT #3# (- M |i|) . #4#)
                                              (|check_subtype| (>= #3# 0)
                                                               '(|NonNegativeInteger|)
                                                               #3#))
                                            (QREFELT $ 43))
                                  (SPADCALL G2 |i| (QREFELT $ 43))
                                  (QREFELT $ 44))
                                 (+ |DegF| 1) (QREFELT $ 45))
                                (QREFELT $ 46))
                               (QREFELT $ 47))
                     . #4#)))
             (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
        (LETT |vec| (SPADCALL F (+ |DegF| 1) (QREFELT $ 45)) . #4#)
        (LETT |coeffma|
              (SPADCALL |coeffmat| 1 (+ |DegF| 1) 2 (+ M 2) (QREFELT $ 48))
              . #4#)
        (LETT |solvar| (SPADCALL |coeffma| |vec| (QREFELT $ 52)) . #4#)
        (EXIT
         (COND
          ((QEQCAR (QCAR |solvar|) 1)
           (PROGN (LETT #2# (CONS 1 "failed") . #4#) (GO #2#)))
          ('T
           (SEQ
            (LETT |solvevarlist|
                  (PROG2 (LETT #1# (QCAR |solvar|) . #4#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0)
                                   (|Vector| (|Expression| (QREFELT $ 6)))
                                   #1#))
                  . #4#)
            (LETT |resul|
                  (SPADCALL (SPADCALL |solvevarlist| HH M (QREFELT $ 27))
                            (QREFELT $ 29))
                  . #4#)
            (EXIT (CONS 0 |resul|))))))))
      #2# (EXIT #2#))))) 

(DECLAIM (NOTINLINE |TransSolvePackageService;|)) 

(DEFUN |TransSolvePackageService| (#1=#:G199)
  (PROG ()
    (RETURN
     (PROG (#2=#:G200)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|TransSolvePackageService|)
                                           '|domainEqualList|)
                . #3=(|TransSolvePackageService|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|TransSolvePackageService;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|TransSolvePackageService|))))))))))) 

(DEFUN |TransSolvePackageService;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|TransSolvePackageService|))
      (LETT |dv$| (LIST '|TransSolvePackageService| DV$1) . #1#)
      (LETT $ (GETREFV 53) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TransSolvePackageService| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|TransSolvePackageService| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|) (0 . |new|)
              (|Fraction| 28) (4 . |Zero|) (8 . |One|)
              (|SparseUnivariatePolynomial| 6) (12 . |One|) (|Expression| 6)
              (|Integer|) (|Vector| 14) (16 . |elt|) (22 . |coerce|)
              (|List| 22) (27 . |kernels|)
              (|Fraction| (|SparseUnivariatePolynomial| $)) (|Kernel| $)
              (32 . |univariate|) (38 . ^) (44 . *) (50 . +)
              |SOLVESER;unvectorise;VFIF;1| (|SparseUnivariatePolynomial| 14)
              (56 . |numer|) (61 . |denom|) (|NonNegativeInteger|)
              (66 . |degree|) (|Union| $ '"failed") (71 . |exquo|) (77 . |One|)
              (|Boolean|) (81 . =) (87 . /) |SOLVESER;decomposeFunc;4F;2|
              (93 . |Zero|) (|Matrix| 14) (97 . |new|) (104 . ^) (110 . *)
              (116 . |vectorise|) (122 . |coerce|) (127 . |horizConcat|)
              (133 . |subMatrix|) (|Union| 16 '"failed")
              (|Record| (|:| |particular| 49) (|:| |basis| (|List| 16)))
              (|LinearSystemMatrixPackage| 14 16 16 41) (142 . |solve|))
           '#(|unvectorise| 148 |decomposeFunc| 155) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 52
                                                 '(0 7 0 8 0 9 0 10 0 6 0 11 0
                                                   12 0 13 2 16 14 0 15 17 1 14
                                                   0 7 18 1 14 19 0 20 2 14 21
                                                   0 22 23 2 9 0 0 15 24 2 9 0
                                                   0 0 25 2 9 0 0 0 26 1 9 28 0
                                                   29 1 9 28 0 30 1 28 31 0 32
                                                   2 31 33 0 0 34 0 28 0 35 2
                                                   28 36 0 0 37 2 9 0 28 28 38
                                                   0 14 0 40 3 41 0 31 31 14 42
                                                   2 28 0 0 31 43 2 28 0 0 0 44
                                                   2 28 16 0 31 45 1 41 0 16 46
                                                   2 41 0 0 0 47 5 41 0 0 15 15
                                                   15 15 48 2 51 50 41 16 52 3
                                                   0 9 16 9 15 27 3 0 9 9 9 9
                                                   39)))))
           '|lookupComplete|)) 
