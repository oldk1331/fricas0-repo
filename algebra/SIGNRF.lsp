
(/VERSIONCHECK 2) 

(DEFUN |SIGNRF;sign;FU;1| (|f| $)
  (PROG (|ud| |un|)
    (RETURN
     (SEQ
      (LETT |un| (|SIGNRF;psign| (SPADCALL |f| (QREFELT $ 9)) $)
            . #1=(|SIGNRF;sign;FU;1|))
      (EXIT
       (COND ((QEQCAR |un| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |ud| (|SIGNRF;psign| (SPADCALL |f| (QREFELT $ 10)) $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |ud| 1) (CONS 1 "failed"))
                      (#2# (CONS 0 (* (QCDR |un|) (QCDR |ud|)))))))))))))) 

(DEFUN |SIGNRF;finiteSign| (|g| |a| $)
  (PROG (|un| |ud|)
    (RETURN
     (SEQ
      (LETT |ud|
            (SPADCALL (SPADCALL |g| (QREFELT $ 15)) |a| (ELT $ 12)
                      (QREFELT $ 18))
            . #1=(|SIGNRF;finiteSign|))
      (EXIT
       (COND ((QEQCAR |ud| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |un|
                     (SPADCALL (SPADCALL |g| (QREFELT $ 19)) |a| (ELT $ 12)
                               (QREFELT $ 18))
                     . #1#)
               (EXIT
                (COND ((QEQCAR |un| 1) (CONS 1 "failed"))
                      (#2# (CONS 0 (* (QCDR |un|) (QCDR |ud|)))))))))))))) 

(DEFUN |SIGNRF;sign;FSOcU;3| (|f| |x| |a| $)
  (PROG (|un| |ud| |n| |g|)
    (RETURN
     (SEQ
      (LETT |g| (SPADCALL |f| |x| (QREFELT $ 22)) . #1=(|SIGNRF;sign;FSOcU;3|))
      (EXIT
       (COND
        ((ZEROP (LETT |n| (SPADCALL |a| (QREFELT $ 25)) . #1#))
         (|SIGNRF;finiteSign| |g| (SPADCALL |a| (QREFELT $ 26)) $))
        (#2='T
         (SEQ
          (LETT |ud|
                (SPADCALL (SPADCALL |g| (QREFELT $ 15)) |n| (ELT $ 12)
                          (QREFELT $ 28))
                . #1#)
          (EXIT
           (COND ((QEQCAR |ud| 1) (CONS 1 "failed"))
                 (#2#
                  (SEQ
                   (LETT |un|
                         (SPADCALL (SPADCALL |g| (QREFELT $ 19)) |n| (ELT $ 12)
                                   (QREFELT $ 28))
                         . #1#)
                   (EXIT
                    (COND ((QEQCAR |un| 1) (CONS 1 "failed"))
                          (#2#
                           (CONS 0 (* (QCDR |un|) (QCDR |ud|)))))))))))))))))) 

(DEFUN |SIGNRF;sign;FSFSU;4| (|f| |x| |a| |st| $)
  (PROG (|un| |ud| |d| |g|)
    (RETURN
     (SEQ
      (LETT |ud|
            (SPADCALL
             (SPADCALL
              (LETT |g| (SPADCALL |f| |x| (QREFELT $ 22))
                    . #1=(|SIGNRF;sign;FSFSU;4|))
              (QREFELT $ 15))
             |a| (LETT |d| (SPADCALL |st| (QREFELT $ 32)) . #1#) (ELT $ 12)
             (QREFELT $ 33))
            . #1#)
      (EXIT
       (COND ((QEQCAR |ud| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |un|
                     (SPADCALL (SPADCALL |g| (QREFELT $ 19)) |a| |d| (ELT $ 12)
                               (QREFELT $ 33))
                     . #1#)
               (EXIT
                (COND ((QEQCAR |un| 1) (CONS 1 "failed"))
                      (#2# (CONS 0 (* (QCDR |un|) (QCDR |ud|)))))))))))))) 

(DEFUN |SIGNRF;psign| (|p| $)
  (PROG (|ans| #1=#:G176 |u| #2=#:G177 |term| |s| |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |r| (SPADCALL |p| (QREFELT $ 36)) . #3=(|SIGNRF;psign|))
            (EXIT
             (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 37)))
                   (#4='T
                    (SEQ
                     (LETT |u|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (LETT |s| (SPADCALL |p| (QREFELT $ 39)) . #3#)
                              (QREFELT $ 41))
                             (QREFELT $ 42))
                            (QREFELT $ 37))
                           . #3#)
                     (EXIT
                      (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                            (#4#
                             (SEQ (LETT |ans| (QCDR |u|) . #3#)
                                  (SEQ (LETT |term| NIL . #3#)
                                       (LETT #2# (SPADCALL |s| (QREFELT $ 45))
                                             . #3#)
                                       G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN
                                              (LETT |term| (CAR #2#) . #3#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((ODDP (QCDR |term|))
                                           (SEQ
                                            (LETT |u|
                                                  (|SIGNRF;sqfrSign|
                                                   (QCAR |term|) $)
                                                  . #3#)
                                            (EXIT
                                             (COND
                                              ((QEQCAR |u| 1)
                                               (PROGN
                                                (LETT #1# (CONS 1 "failed")
                                                      . #3#)
                                                (GO #1#)))
                                              ('T
                                               (LETT |ans| (* |ans| (QCDR |u|))
                                                     . #3#)))))))))
                                       (LETT #2# (CDR #2#) . #3#) (GO G190)
                                       G191 (EXIT NIL))
                                  (EXIT (CONS 0 |ans|))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |SIGNRF;sqfrSign| (|p| $)
  (PROG (|u| |l|)
    (RETURN
     (SEQ
      (LETT |u|
            (|SIGNRF;termSign|
             (|SPADfirst|
              (LETT |l| (SPADCALL |p| (QREFELT $ 47))
                    . #1=(|SIGNRF;sqfrSign|)))
             $)
            . #1#)
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             ('T (|SIGNRF;listSign| (CDR |l|) (QCDR |u|) $)))))))) 

(DEFUN |SIGNRF;listSign| (|l| |s| $)
  (PROG (#1=#:G186 #2=#:G190 |u| #3=#:G191 |term|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |term| NIL . #4=(|SIGNRF;listSign|)) (LETT #3# |l| . #4#)
             G190
             (COND
              ((OR (ATOM #3#) (PROGN (LETT |term| (CAR #3#) . #4#) NIL))
               (GO G191)))
             (SEQ (LETT |u| (|SIGNRF;termSign| |term| $) . #4#)
                  (EXIT
                   (COND
                    ((QEQCAR |u| 1)
                     (PROGN (LETT #2# (CONS 1 "failed") . #4#) (GO #2#)))
                    ('T
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (QCDR |u|) |s| (QREFELT $ 49))
                         (PROGN
                          (LETT #1#
                                (PROGN
                                 (LETT #2# (CONS 1 "failed") . #4#)
                                 (GO #2#))
                                . #4#)
                          (GO #1#)))))
                      #1# (EXIT #1#))))))
             (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |s|))))
      #2# (EXIT #2#))))) 

(DEFUN |SIGNRF;termSign| (|term| $)
  (PROG (#1=#:G196 #2=#:G198 #3=#:G199 |var|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |var| NIL . #4=(|SIGNRF;termSign|))
               (LETT #3# (SPADCALL |term| (QREFELT $ 51)) . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |var| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((ODDP (SPADCALL |term| |var| (QREFELT $ 53)))
                   (PROGN
                    (LETT #1#
                          (PROGN (LETT #2# (CONS 1 "failed") . #4#) (GO #2#))
                          . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (SPADCALL (SPADCALL |term| (QREFELT $ 54)) (QREFELT $ 37)))))
      #2# (EXIT #2#))))) 

(DEFUN |RationalFunctionSign| (#1=#:G200)
  (PROG ()
    (RETURN
     (PROG (#2=#:G201)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|RationalFunctionSign|)
                                           '|domainEqualList|)
                . #3=(|RationalFunctionSign|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|RationalFunctionSign;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|RationalFunctionSign|))))))))))) 

(DEFUN |RationalFunctionSign;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|RationalFunctionSign|))
      (LETT |dv$| (LIST '|RationalFunctionSign| DV$1) . #1#)
      (LETT $ (GETREFV 55) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|RationalFunctionSign| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|RationalFunctionSign| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Polynomial| 6)
              (|Fraction| 7) (0 . |numer|) (5 . |denom|) (|Union| 27 '"failed")
              |SIGNRF;sign;FU;1| (|SparseUnivariatePolynomial| 8)
              (|Fraction| 13) (10 . |denom|) (|Mapping| 11 8)
              (|InnerPolySign| 8 13) (15 . |signAround|) (22 . |numer|)
              (|Symbol|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 20) 20
                                                     6 7 8)
              (27 . |univariate|) (|SingleInteger|) (|OrderedCompletion| 8)
              (33 . |whatInfinity|) (38 . |retract|) (|Integer|)
              (43 . |signAround|) |SIGNRF;sign;FSOcU;3| (|String|)
              (|ToolsForSign| 6) (50 . |direction|) (55 . |signAround|)
              |SIGNRF;sign;FSFSU;4| (|Union| 6 '"failed") (63 . |retractIfCan|)
              (68 . |sign|) (|Factored| $) (73 . |squareFree|) (|Factored| 7)
              (78 . |unit|) (83 . |retract|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 27)) (|List| 43)
              (88 . |factors|) (|List| $) (93 . |monomials|) (|Boolean|)
              (98 . ~=) (|List| 20) (104 . |variables|) (|NonNegativeInteger|)
              (109 . |degree|) (115 . |leadingCoefficient|))
           '#(|sign| 120) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 54
                                                 '(1 8 7 0 9 1 8 7 0 10 1 14 13
                                                   0 15 3 17 11 13 8 16 18 1 14
                                                   13 0 19 2 21 14 8 20 22 1 24
                                                   23 0 25 1 24 8 0 26 3 17 11
                                                   13 27 16 28 1 31 27 30 32 4
                                                   17 11 13 8 27 16 33 1 7 35 0
                                                   36 1 31 11 6 37 1 7 38 0 39
                                                   1 40 7 0 41 1 7 6 0 42 1 40
                                                   44 0 45 1 7 46 0 47 2 27 48
                                                   0 0 49 1 7 50 0 51 2 7 52 0
                                                   20 53 1 7 6 0 54 1 0 11 8 12
                                                   4 0 11 8 20 8 30 34 3 0 11 8
                                                   20 24 29)))))
           '|lookupComplete|)) 
