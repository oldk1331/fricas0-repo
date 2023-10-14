
(/VERSIONCHECK 2) 

(DEFUN |NLINSOL;solveInField;LL;1| (|l| $)
  (PROG (#1=#:G133 #2=#:G132 #3=#:G134 #4=#:G136 |p|)
    (RETURN
     (SEQ
      (SPADCALL |l|
                (PROGN
                 (LETT #1# NIL . #5=(|NLINSOL;solveInField;LL;1|))
                 (SEQ (LETT |p| NIL . #5#) (LETT #4# |l| . #5#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3# (SPADCALL |p| (QREFELT $ 9)) . #5#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 10)) . #5#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #5#)
                            (LETT #1# 'T . #5#)))))))
                      (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|IdentityError| '|setUnion|))))
                (QREFELT $ 13)))))) 

(DEFUN |NLINSOL;solve;LL;2| (|l| $)
  (PROG (#1=#:G138 #2=#:G137 #3=#:G139 #4=#:G141 |p|)
    (RETURN
     (SEQ
      (SPADCALL |l|
                (PROGN
                 (LETT #1# NIL . #5=(|NLINSOL;solve;LL;2|))
                 (SEQ (LETT |p| NIL . #5#) (LETT #4# |l| . #5#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3# (SPADCALL |p| (QREFELT $ 9)) . #5#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 10)) . #5#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #5#)
                            (LETT #1# 'T . #5#)))))))
                      (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|IdentityError| '|setUnion|))))
                (QREFELT $ 15)))))) 

(DEFUN |NLINSOL;solve;LLL;3| (|lp| |lv| $)
  (PROG (#1=#:G145 |sol| #2=#:G144)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|NLINSOL;solve;LLL;3|))
        (SEQ (LETT |sol| NIL . #3#)
             (LETT #1# (SPADCALL |lp| |lv| (QREFELT $ 13)) . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |sol| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT (LETT #2# (CONS (|NLINSOL;expandSol| |sol| $) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 18)))))) 

(DEFUN |NLINSOL;addRoot| (|eq| |l| $)
  (PROG (#1=#:G149 |sol| #2=#:G148)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|NLINSOL;addRoot|))
       (SEQ (LETT |sol| NIL . #3#) (LETT #1# |l| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |sol| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ (EXIT (LETT #2# (CONS (CONS |eq| |sol|) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |NLINSOL;evalSol| (|ls| |l| $)
  (PROG (#1=#:G153 |eq| #2=#:G152)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|NLINSOL;evalSol|))
       (SEQ (LETT |eq| NIL . #3#) (LETT #1# |ls| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2#
                    (CONS
                     (SPADCALL (SPADCALL |eq| (QREFELT $ 21))
                               (SPADCALL (SPADCALL |eq| (QREFELT $ 22)) |l|
                                         (QREFELT $ 25))
                               (QREFELT $ 26))
                     #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |NLINSOL;allRoots| (|l| $)
  (PROG (#1=#:G162 |a| #2=#:G161 |s| #3=#:G155 |p| |z|)
    (RETURN
     (SEQ
      (COND ((NULL |l|) (LIST NIL))
            ('T
             (SEQ
              (LETT |z| (|NLINSOL;allRoots| (CDR |l|) $)
                    . #4=(|NLINSOL;allRoots|))
              (LETT |s|
                    (SPADCALL
                     (SPADCALL
                      (PROG2
                          (LETT #3#
                                (SPADCALL (LETT |p| (|SPADfirst| |l|) . #4#)
                                          (QREFELT $ 28))
                                . #4#)
                          (QCDR #3#)
                        (|check_union| (QEQCAR #3# 0) (|Symbol|) #3#))
                      (QREFELT $ 30))
                     (QREFELT $ 31))
                    . #4#)
              (EXIT
               (SPADCALL
                (PROGN
                 (LETT #2# NIL . #4#)
                 (SEQ (LETT |a| NIL . #4#)
                      (LETT #1#
                            (SPADCALL (SPADCALL |p| (QREFELT $ 33))
                                      (QREFELT $ 35))
                            . #4#)
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (|NLINSOL;addRoot|
                                (SPADCALL |s|
                                          (SPADCALL
                                           (SPADCALL |a| (QREFELT $ 36))
                                           (QREFELT $ 31))
                                          (QREFELT $ 26))
                                |z| $)
                               #2#)
                              . #4#)))
                      (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 18)))))))))) 

(DEFUN |NLINSOL;expandSol| (|l| $)
  (PROG (#1=#:G183 |z| #2=#:G182 #3=#:G180 |luniv| |r| |u| |lsubs| |lassign|
         #4=#:G181 |eq|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |lassign| (LETT |lsubs| NIL . #5=(|NLINSOL;expandSol|)) . #5#)
        (LETT |luniv| NIL . #5#)
        (SEQ (LETT |eq| NIL . #5#) (LETT #4# |l| . #5#) G190
             (COND
              ((OR (ATOM #4#) (PROGN (LETT |eq| (CAR #4#) . #5#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((QEQCAR
                  (SPADCALL (SPADCALL |eq| (QREFELT $ 21)) (QREFELT $ 37)) 0)
                 (COND
                  ((QEQCAR (|NLINSOL;RIfCan| (SPADCALL |eq| (QREFELT $ 22)) $)
                           0)
                   (LETT |lassign| (CONS |eq| |lassign|) . #5#))
                  ('T (LETT |lsubs| (CONS |eq| |lsubs|) . #5#))))
                ('T
                 (SEQ
                  (LETT |u|
                        (SPADCALL (SPADCALL |eq| (QREFELT $ 21))
                                  (QREFELT $ 39))
                        . #5#)
                  (EXIT
                   (COND
                    ((QEQCAR |u| 0)
                     (COND
                      ((EQL (LENGTH (SPADCALL (QCDR |u|) (QREFELT $ 9))) 1)
                       (SEQ
                        (LETT |r|
                              (|NLINSOL;RIfCan| (SPADCALL |eq| (QREFELT $ 22))
                               $)
                              . #5#)
                        (EXIT
                         (COND
                          ((QEQCAR |r| 0)
                           (LETT |luniv|
                                 (CONS
                                  (SPADCALL (QCDR |u|)
                                            (SPADCALL (QCDR |r|)
                                                      (QREFELT $ 36))
                                            (QREFELT $ 41))
                                  |luniv|)
                                 . #5#))
                          ('T (PROGN (LETT #3# (LIST |l|) . #5#) (GO #3#)))))))
                      ('T (PROGN (LETT #3# (LIST |l|) . #5#) (GO #3#)))))
                    ('T (PROGN (LETT #3# (LIST |l|) . #5#) (GO #3#))))))))))
             (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (COND ((NULL |luniv|) (LIST |l|))
               ('T
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |z| NIL . #5#)
                      (LETT #1# (|NLINSOL;allRoots| |luniv| $) . #5#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |z| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL |z|
                                         (SPADCALL
                                          (|NLINSOL;evalSol| |lsubs| |z| $)
                                          |lassign| (QREFELT $ 42))
                                         (QREFELT $ 42))
                               #2#)
                              . #5#)))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))))))
      #3# (EXIT #3#))))) 

(DEFUN |NLINSOL;RIfCan| (|f| $)
  (PROG (#1=#:G189 |d| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |n| (SPADCALL (SPADCALL |f| (QREFELT $ 43)) (QREFELT $ 45))
               . #2=(|NLINSOL;RIfCan|))
         (EXIT
          (COND
           ((QEQCAR |n| 0)
            (SEQ
             (LETT |d| (SPADCALL (SPADCALL |f| (QREFELT $ 46)) (QREFELT $ 45))
                   . #2#)
             (EXIT
              (COND
               ((QEQCAR |d| 0)
                (PROGN
                 (LETT #1#
                       (CONS 0 (SPADCALL (QCDR |n|) (QCDR |d|) (QREFELT $ 47)))
                       . #2#)
                 (GO #1#))))))))))
        (EXIT (CONS 1 "failed"))))
      #1# (EXIT #1#))))) 

(DEFUN |NLINSOL;solve;LL;9| (|l| $) (SPADCALL |l| (QREFELT $ 14))) 

(DEFUN |NLINSOL;solve;LLL;10| (|lp| |lv| $) (SPADCALL |lp| |lv| (QREFELT $ 13))) 

(DEFUN |NLINSOL;solveInField;LLL;11| (|lp| |lv| $)
  (SPADCALL |lp| |lv| (QREFELT $ 49))) 

(DEFUN |NLINSOL;solveInField;LLL;12| (|lp| |lv| $)
  (SPADCALL |lp| |lv| (QREFELT $ 51))) 

(DEFUN |NLINSOL;solveInField;LLL;13| (|lp| |lv| $)
  (PROG (#1=#:G198 |p| #2=#:G197)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|NLINSOL;solveInField;LLL;13|))
        (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 31)) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       |lv| (QREFELT $ 54)))))) 

(DECLAIM (NOTINLINE |NonLinearSolvePackage;|)) 

(DEFUN |NonLinearSolvePackage| (#1=#:G199)
  (PROG ()
    (RETURN
     (PROG (#2=#:G200)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|NonLinearSolvePackage|)
                                           '|domainEqualList|)
                . #3=(|NonLinearSolvePackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|NonLinearSolvePackage;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|NonLinearSolvePackage|))))))))))) 

(DEFUN |NonLinearSolvePackage;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|NonLinearSolvePackage|))
      (LETT |dv$| (LIST '|NonLinearSolvePackage| DV$1) . #1#)
      (LETT $ (GETREFV 55) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|NonLinearSolvePackage| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| '(|AlgebraicallyClosedField|))
        (PROGN
         (QSETREFV $ 16 (CONS (|dispatchFunction| |NLINSOL;solve;LL;2|) $))
         (QSETREFV $ 15 (CONS (|dispatchFunction| |NLINSOL;solve;LLL;3|) $))))
       ('T
        (PROGN
         (QSETREFV $ 16 (CONS (|dispatchFunction| |NLINSOL;solve;LL;9|) $))
         (QSETREFV $ 15
                   (CONS (|dispatchFunction| |NLINSOL;solve;LLL;10|) $)))))
      (COND ((|domainEqual| |#1| (|Fraction| (|Integer|))))
            ((|HasCategory| |#1| '(|RetractableTo| (|Fraction| (|Integer|))))
             (QSETREFV $ 13
                       (CONS (|dispatchFunction| |NLINSOL;solveInField;LLL;11|)
                             $))))
      (COND ((|domainEqual| |#1| (|Integer|)))
            ((|HasCategory| |#1| '(|RetractableTo| (|Fraction| (|Integer|)))))
            ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
             (QSETREFV $ 13
                       (CONS (|dispatchFunction| |NLINSOL;solveInField;LLL;12|)
                             $))))
      (COND
       ((OR (|domainEqual| |#1| (|Integer|))
            (OR
             (|HasCategory| |#1| '(|RetractableTo| (|Fraction| (|Integer|))))
             (|HasCategory| |#1| '(|RetractableTo| (|Integer|))))))
       ('T
        (QSETREFV $ 13
                  (CONS (|dispatchFunction| |NLINSOL;solveInField;LLL;13|)
                        $))))
      $)))) 

(MAKEPROP '|NonLinearSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|List| 29)
              (|Polynomial| 6) (0 . |variables|) (5 . |setUnion|) (|List| 23)
              (|List| 8) (11 . |solveInField|) |NLINSOL;solveInField;LL;1|
              (17 . |solve|) (23 . |solve|) (|List| $) (28 . |concat|)
              (|Fraction| 8) (|Equation| 19) (33 . |lhs|) (38 . |rhs|)
              (|List| 20) (|RationalFunction| 6) (43 . |eval|)
              (49 . |equation|) (|Union| 29 '"failed") (55 . |mainVariable|)
              (|Symbol|) (60 . |coerce|) (65 . |coerce|)
              (|SparseUnivariatePolynomial| 6) (70 . |univariate|)
              (|SparseUnivariatePolynomial| $) (75 . |zerosOf|) (80 . |coerce|)
              (85 . |retractIfCan|) (|Union| 8 '"failed") (90 . |retractIfCan|)
              (95 . |One|) (99 . -) (105 . |concat|) (111 . |numer|)
              (|Union| 6 '"failed") (116 . |retractIfCan|) (121 . |denom|)
              (126 . /) (|RetractSolvePackage| (|Fraction| (|Integer|)) 6)
              (132 . |solveRetract|) (|RetractSolvePackage| (|Integer|) 6)
              (138 . |solveRetract|) (|List| 19) (|SystemSolvePackage| 6)
              (144 . |solve|))
           '#(|solveInField| 150 |solve| 161) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 54
                                                 '(1 8 7 0 9 2 7 0 0 0 10 2 0
                                                   11 12 7 13 2 0 11 12 7 15 1
                                                   0 11 12 16 1 11 0 17 18 1 20
                                                   19 0 21 1 20 19 0 22 2 24 19
                                                   19 23 25 2 20 0 19 19 26 1 8
                                                   27 0 28 1 8 0 29 30 1 19 0 8
                                                   31 1 8 32 0 33 1 6 17 34 35
                                                   1 8 0 6 36 1 19 27 0 37 1 19
                                                   38 0 39 0 6 0 40 2 8 0 0 0
                                                   41 2 23 0 0 0 42 1 19 8 0 43
                                                   1 8 44 0 45 1 19 8 0 46 2 6
                                                   0 0 0 47 2 48 11 12 7 49 2
                                                   50 11 12 7 51 2 53 11 52 7
                                                   54 1 0 11 12 14 2 0 11 12 7
                                                   13 1 0 11 12 16 2 0 11 12 7
                                                   15)))))
           '|lookupComplete|)) 
