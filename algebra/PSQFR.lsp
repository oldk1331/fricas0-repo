
(/VERSIONCHECK 2) 

(DEFUN |PSQFR;pPolRoot| (|f| $)
  (PROG (|uf| #1=#:G134 |mv| |lvar|)
    (RETURN
     (SEQ (LETT |lvar| (SPADCALL |f| (QREFELT $ 14)) . #2=(|PSQFR;pPolRoot|))
          (EXIT
           (COND ((NULL |lvar|) |f|)
                 ('T
                  (SEQ (LETT |mv| (|SPADfirst| |lvar|) . #2#)
                       (LETT |uf| (SPADCALL |f| |mv| (QREFELT $ 16)) . #2#)
                       (LETT |uf|
                             (PROG2
                                 (LETT #1#
                                       (SPADCALL |uf| (QREFELT $ 12)
                                                 (QREFELT $ 19))
                                       . #2#)
                                 (QCDR #1#)
                               (|check_union| (QEQCAR #1# 0)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 9))
                                              #1#))
                             . #2#)
                       (LETT |uf|
                             (SPADCALL (CONS (|function| |PSQFR;pPolRoot|) $)
                                       |uf| (QREFELT $ 21))
                             . #2#)
                       (EXIT (SPADCALL |uf| |mv| (QREFELT $ 22))))))))))) 

(DEFUN |PSQFR;putPth| (|f| $)
  (PROG (|uf| |mv| |lvar|)
    (RETURN
     (SEQ (LETT |lvar| (SPADCALL |f| (QREFELT $ 14)) . #1=(|PSQFR;putPth|))
          (EXIT
           (COND ((NULL |lvar|) |f|)
                 ('T
                  (SEQ (LETT |mv| (|SPADfirst| |lvar|) . #1#)
                       (LETT |uf| (SPADCALL |f| |mv| (QREFELT $ 16)) . #1#)
                       (LETT |uf| (SPADCALL |uf| (QREFELT $ 12) (QREFELT $ 23))
                             . #1#)
                       (LETT |uf|
                             (SPADCALL (CONS (|function| |PSQFR;putPth|) $)
                                       |uf| (QREFELT $ 21))
                             . #1#)
                       (EXIT (SPADCALL |uf| |mv| (QREFELT $ 22))))))))))) 

(DEFUN |PSQFR;pthPower| (|f| $)
  (PROG (#1=#:G162 |u| #2=#:G161 #3=#:G160 #4=#:G159 |psqfr| |isSq| |proot|
         |g|)
    (RETURN
     (SEQ (LETT |proot| (|spadConstant| $ 24) . #5=(|PSQFR;pthPower|))
          (LETT |isSq| 'NIL . #5#)
          (SEQ (LETT |g| (SPADCALL |f| (QREFELT $ 25)) . #5#)
               (EXIT
                (COND
                 ((QEQCAR |g| 1) (LETT |proot| (|PSQFR;pPolRoot| |f| $) . #5#))
                 (#6='T
                  (SEQ (LETT |proot| (QCDR |g|) . #5#)
                       (EXIT (LETT |isSq| 'T . #5#)))))))
          (LETT |psqfr|
                (|PSQFR;finSqFr| |proot| (SPADCALL |f| (QREFELT $ 14)) $)
                . #5#)
          (EXIT
           (COND
            (|isSq|
             (SPADCALL
              (SPADCALL (SPADCALL |psqfr| (QREFELT $ 27)) (QREFELT $ 12)
                        (QREFELT $ 28))
              (PROGN
               (LETT #4# NIL . #5#)
               (SEQ (LETT |u| NIL . #5#)
                    (LETT #3# (SPADCALL |psqfr| (QREFELT $ 32)) . #5#) G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |u| (CAR #3#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #4#
                            (CONS
                             (VECTOR (QVELT |u| 0) (QVELT |u| 1)
                                     (* (QVELT |u| 2) (QREFELT $ 12)))
                             #4#)
                            . #5#)))
                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                    (EXIT (NREVERSE #4#))))
              (QREFELT $ 33)))
            (#6#
             (SPADCALL (SPADCALL |psqfr| (QREFELT $ 27))
                       (PROGN
                        (LETT #2# NIL . #5#)
                        (SEQ (LETT |u| NIL . #5#)
                             (LETT #1# (SPADCALL |psqfr| (QREFELT $ 32)) . #5#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |u| (CAR #1#) . #5#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (VECTOR (CONS 0 "nil")
                                              (|PSQFR;putPth| (QVELT |u| 1) $)
                                              (QVELT |u| 2))
                                      #2#)
                                     . #5#)))
                             (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT $ 33))))))))) 

(DEFUN |PSQFR;finSqFr| (|f| |lvar| $)
  (PROG (|pfaclist| |sqp| |cont| |cont1| |flistfin1| #1=#:G185 |uu| #2=#:G184
         |listfin1| |uexp| #3=#:G168 #4=#:G183 |u| |squf| |uf| #5=#:G164 |mv|)
    (RETURN
     (SEQ
      (COND ((NULL |lvar|) (|PSQFR;pthPower| |f| $))
            (#6='T
             (SEQ (LETT |mv| (|SPADfirst| |lvar|) . #7=(|PSQFR;finSqFr|))
                  (LETT |lvar| (CDR |lvar|) . #7#)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |f| |mv| (QREFELT $ 34))
                               (|spadConstant| $ 24) (QREFELT $ 36))
                     (|PSQFR;finSqFr| |f| |lvar| $))
                    (#6#
                     (SEQ (LETT |uf| (SPADCALL |f| |mv| (QREFELT $ 16)) . #7#)
                          (LETT |cont| (SPADCALL |uf| (QREFELT $ 37)) . #7#)
                          (LETT |cont1| (|spadConstant| $ 38) . #7#)
                          (LETT |uf|
                                (PROG2
                                    (LETT #5#
                                          (SPADCALL |uf| |cont| (QREFELT $ 39))
                                          . #7#)
                                    (QCDR #5#)
                                  (|check_union| (QEQCAR #5# 0)
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT $ 9))
                                                 #5#))
                                . #7#)
                          (LETT |squf| (SPADCALL |uf| (QREFELT $ 42)) . #7#)
                          (LETT |pfaclist| NIL . #7#)
                          (SEQ (LETT |u| NIL . #7#)
                               (LETT #4# (SPADCALL |squf| (QREFELT $ 45))
                                     . #7#)
                               G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |u| (CAR #4#) . #7#) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |uexp|
                                      (PROG1 (LETT #3# (QVELT |u| 2) . #7#)
                                        (|check_subtype| (>= #3# 0)
                                                         '(|NonNegativeInteger|)
                                                         #3#))
                                      . #7#)
                                (EXIT
                                 (COND
                                  ((SPADCALL (QVELT |u| 0) (CONS 1 "sqfr")
                                             (QREFELT $ 46))
                                   (LETT |pfaclist|
                                         (CONS
                                          (VECTOR (QVELT |u| 0)
                                                  (SPADCALL (QVELT |u| 1) |mv|
                                                            (QREFELT $ 22))
                                                  |uexp|)
                                          |pfaclist|)
                                         . #7#))
                                  ('T
                                   (SEQ
                                    (LETT |listfin1|
                                          (SPADCALL
                                           (SPADCALL (QVELT |u| 1) |mv|
                                                     (QREFELT $ 22))
                                           (QREFELT $ 47))
                                          . #7#)
                                    (LETT |flistfin1|
                                          (PROGN
                                           (LETT #2# NIL . #7#)
                                           (SEQ (LETT |uu| NIL . #7#)
                                                (LETT #1#
                                                      (SPADCALL |listfin1|
                                                                (QREFELT $ 32))
                                                      . #7#)
                                                G190
                                                (COND
                                                 ((OR (ATOM #1#)
                                                      (PROGN
                                                       (LETT |uu| (CAR #1#)
                                                             . #7#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #2#
                                                        (CONS
                                                         (VECTOR (QVELT |uu| 0)
                                                                 (QVELT |uu| 1)
                                                                 (*
                                                                  (QVELT |uu|
                                                                         2)
                                                                  |uexp|))
                                                         #2#)
                                                        . #7#)))
                                                (LETT #1# (CDR #1#) . #7#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #2#))))
                                          . #7#)
                                    (LETT |cont1|
                                          (SPADCALL |cont1|
                                                    (SPADCALL
                                                     (SPADCALL |listfin1|
                                                               (QREFELT $ 27))
                                                     |uexp| (QREFELT $ 28))
                                                    (QREFELT $ 48))
                                          . #7#)
                                    (EXIT
                                     (LETT |pfaclist|
                                           (APPEND |flistfin1| |pfaclist|)
                                           . #7#)))))))
                               (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                               (EXIT NIL))
                          (LETT |cont| (SPADCALL |cont| |cont1| (QREFELT $ 48))
                                . #7#)
                          (EXIT
                           (COND
                            ((SPADCALL |cont| (|spadConstant| $ 38)
                                       (QREFELT $ 50))
                             (SEQ
                              (LETT |sqp| (SPADCALL |cont| (QREFELT $ 47))
                                    . #7#)
                              (LETT |pfaclist|
                                    (APPEND (SPADCALL |sqp| (QREFELT $ 32))
                                            |pfaclist|)
                                    . #7#)
                              (EXIT
                               (SPADCALL
                                (SPADCALL (SPADCALL |sqp| (QREFELT $ 27))
                                          (SPADCALL
                                           (SPADCALL |squf| (QREFELT $ 51)) 0
                                           (QREFELT $ 52))
                                          (QREFELT $ 48))
                                |pfaclist| (QREFELT $ 33)))))
                            (#6#
                             (SPADCALL
                              (SPADCALL (SPADCALL |squf| (QREFELT $ 51)) 0
                                        (QREFELT $ 52))
                              |pfaclist| (QREFELT $ 33)))))))))))))))) 

(DEFUN |PSQFR;squareFree;PF;5| (|p| $)
  (PROG (|sqp| |pfaclist| #1=#:G206 |u| #2=#:G205 |squp| |up| #3=#:G191 |cont|
         |mv|)
    (RETURN
     (SEQ
      (LETT |mv| (SPADCALL |p| (QREFELT $ 54)) . #4=(|PSQFR;squareFree;PF;5|))
      (EXIT
       (COND ((QEQCAR |mv| 1) (SPADCALL |p| NIL (QREFELT $ 33)))
             ((SPADCALL (SPADCALL (QREFELT $ 11)) 0 (QREFELT $ 57))
              (|PSQFR;finSqFr| |p| (SPADCALL |p| (QREFELT $ 14)) $))
             (#5='T
              (SEQ (LETT |up| (SPADCALL |p| (QCDR |mv|) (QREFELT $ 16)) . #4#)
                   (LETT |cont| (SPADCALL |up| (QREFELT $ 37)) . #4#)
                   (LETT |up|
                         (PROG2
                             (LETT #3# (SPADCALL |up| |cont| (QREFELT $ 39))
                                   . #4#)
                             (QCDR #3#)
                           (|check_union| (QEQCAR #3# 0)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 9))
                                          #3#))
                         . #4#)
                   (LETT |squp| (SPADCALL |up| (QREFELT $ 42)) . #4#)
                   (LETT |pfaclist|
                         (PROGN
                          (LETT #2# NIL . #4#)
                          (SEQ (LETT |u| NIL . #4#)
                               (LETT #1# (SPADCALL |squp| (QREFELT $ 45))
                                     . #4#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |u| (CAR #1#) . #4#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS
                                        (VECTOR (QVELT |u| 0)
                                                (SPADCALL (QVELT |u| 1)
                                                          (QCDR |mv|)
                                                          (QREFELT $ 22))
                                                (QVELT |u| 2))
                                        #2#)
                                       . #4#)))
                               (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         . #4#)
                   (EXIT
                    (COND
                     ((SPADCALL |cont| (|spadConstant| $ 38) (QREFELT $ 50))
                      (SEQ (LETT |sqp| (SPADCALL |cont| (QREFELT $ 47)) . #4#)
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |sqp| (QREFELT $ 27))
                                       (SPADCALL
                                        (SPADCALL |squp| (QREFELT $ 51)) 0
                                        (QREFELT $ 52))
                                       (QREFELT $ 48))
                             (APPEND (SPADCALL |sqp| (QREFELT $ 32))
                                     |pfaclist|)
                             (QREFELT $ 33)))))
                     (#5#
                      (SPADCALL
                       (SPADCALL (SPADCALL |squp| (QREFELT $ 51)) 0
                                 (QREFELT $ 52))
                       |pfaclist| (QREFELT $ 33))))))))))))) 

(DEFUN |PolynomialSquareFree| (&REST #1=#:G207)
  (PROG ()
    (RETURN
     (PROG (#2=#:G208)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PolynomialSquareFree|)
                                           '|domainEqualList|)
                . #3=(|PolynomialSquareFree|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PolynomialSquareFree;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|PolynomialSquareFree|))))))))))) 

(DEFUN |PolynomialSquareFree;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialSquareFree|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|PolynomialSquareFree| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 58) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PolynomialSquareFree|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 12 (SPADCALL (QREFELT $ 11)))
      $)))) 

(MAKEPROP '|PolynomialSquareFree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|NonNegativeInteger|)
              (0 . |characteristic|) '|chrc| (|List| 6) (4 . |variables|)
              (|SparseUnivariatePolynomial| $) (9 . |univariate|)
              (|Union| $ '"failed") (|SparseUnivariatePolynomial| 9)
              (15 . |divideExponents|) (|Mapping| 9 9) (21 . |map|)
              (27 . |multivariate|) (33 . |multiplyExponents|) (39 . |Zero|)
              (43 . |charthRoot|) (|Factored| 9) (48 . |unit|) (53 . ^)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 29) (|:| |fctr| 9) (|:| |xpnt| (|Integer|)))
              (|List| 30) (59 . |factorList|) (64 . |makeFR|)
              (70 . |differentiate|) (|Boolean|) (76 . =) (82 . |content|)
              (87 . |One|) (91 . |exquo|) (|Factored| 18)
              (|UnivariatePolynomialSquareFree| 9 18) (97 . |squareFree|)
              (|Record| (|:| |flg| 29) (|:| |fctr| 18)
                        (|:| |xpnt| (|Integer|)))
              (|List| 43) (102 . |factorList|) (107 . =)
              |PSQFR;squareFree;PF;5| (113 . *) (119 . |One|) (123 . ~=)
              (129 . |unit|) (134 . |coefficient|) (|Union| 6 '"failed")
              (140 . |mainVariable|) (145 . |Zero|) (149 . |Zero|) (153 . ~=))
           '#(|squareFree| 159) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 57
                                                 '(0 8 10 11 1 9 13 0 14 2 9 15
                                                   0 6 16 2 18 17 0 10 19 2 18
                                                   0 20 0 21 2 9 0 15 6 22 2 18
                                                   0 0 10 23 0 9 0 24 1 9 17 0
                                                   25 1 26 9 0 27 2 9 0 0 10 28
                                                   1 26 31 0 32 2 26 0 9 31 33
                                                   2 9 0 0 6 34 2 9 35 0 0 36 1
                                                   18 9 0 37 0 9 0 38 2 18 17 0
                                                   9 39 1 41 40 18 42 1 40 44 0
                                                   45 2 29 35 0 0 46 2 9 0 0 0
                                                   48 0 8 0 49 2 9 35 0 0 50 1
                                                   40 18 0 51 2 18 9 0 10 52 1
                                                   9 53 0 54 0 7 0 55 0 8 0 56
                                                   2 10 35 0 0 57 1 0 26 9
                                                   47)))))
           '|lookupComplete|)) 
