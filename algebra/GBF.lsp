
(/VERSIONCHECK 2) 

(DEFUN |GBF;createGroebnerBases|
       (|basis| |redPols| |nonZeroRestrictions| |inputPolys| |lcP|
        |listOfBases| |info| $)
  (PROG (|newBasis| #1=#:G176 |p| #2=#:G175 |newInputPolys| #3=#:G174 |fnP|
         #4=#:G155 |nP| |allReducedFactors| #5=#:G173 |doSplitting?|
         |irreducibleFactors| |terminateWithBasis| |stopDividing| |nPq|
         #6=#:G172 #7=#:G171 |q| |h|)
    (RETURN
     (SEQ (LETT |doSplitting?| 'NIL . #8=(|GBF;createGroebnerBases|))
          (LETT |terminateWithBasis| 'NIL . #8#)
          (LETT |allReducedFactors| NIL . #8#)
          (SEQ G190
               (COND
                ((NULL
                  (COND ((OR |doSplitting?| |terminateWithBasis|) 'NIL)
                        ('T 'T)))
                 (GO G191)))
               (SEQ
                (LETT |terminateWithBasis|
                      (COND ((NULL |inputPolys|) (NULL |lcP|)) ('T 'NIL))
                      . #8#)
                (EXIT
                 (COND
                  ((NULL |terminateWithBasis|)
                   (SEQ
                    (LETT |nP|
                          (COND
                           ((NULL |inputPolys|)
                            (SEQ
                             (LETT |h|
                                   (SPADCALL (|SPADfirst| |lcP|)
                                             (QREFELT $ 12))
                                   . #8#)
                             (LETT |lcP| (CDR |lcP|) . #8#)
                             (EXIT
                              (SPADCALL (SPADCALL |h| |redPols| (QREFELT $ 14))
                                        (QREFELT $ 15)))))
                           ('T
                            (SEQ (LETT |p| (|SPADfirst| |inputPolys|) . #8#)
                                 (LETT |inputPolys| (CDR |inputPolys|) . #8#)
                                 (EXIT
                                  (SPADCALL
                                   (SPADCALL |p| |redPols| (QREFELT $ 14))
                                   (QREFELT $ 15))))))
                          . #8#)
                    (EXIT
                     (COND
                      ((SPADCALL |nP| (|spadConstant| $ 16) (QREFELT $ 18))
                       (SEQ
                        (LETT |basis| (LIST (CONS 0 (|spadConstant| $ 16)))
                              . #8#)
                        (EXIT (LETT |terminateWithBasis| 'T . #8#))))
                      ('T
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |nP| (|spadConstant| $ 21) (QREFELT $ 22))
                           (PROGN
                            (LETT #4#
                                  (SEQ
                                   (SEQ (LETT |q| NIL . #8#)
                                        (LETT #7# |nonZeroRestrictions| . #8#)
                                        G190
                                        (COND
                                         ((OR (ATOM #7#)
                                              (PROGN
                                               (LETT |q| (CAR #7#) . #8#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ (LETT |stopDividing| 'NIL . #8#)
                                             (EXIT
                                              (SEQ (LETT #6# NIL . #8#) G190
                                                   (COND (#6# (GO G191)))
                                                   (SEQ
                                                    (LETT |nPq|
                                                          (SPADCALL |nP| |q|
                                                                    (QREFELT $
                                                                             24))
                                                          . #8#)
                                                    (LETT |stopDividing|
                                                          (QEQCAR |nPq| 1)
                                                          . #8#)
                                                    (COND
                                                     ((NULL |stopDividing|)
                                                      (LETT |nP| (QCDR |nPq|)
                                                            . #8#)))
                                                    (EXIT
                                                     (LETT |stopDividing|
                                                           (COND
                                                            (|stopDividing| 'T)
                                                            ('T
                                                             (SPADCALL
                                                              (SPADCALL |nP|
                                                                        (QREFELT
                                                                         $ 25))
                                                              (QREFELT $ 26))))
                                                           . #8#)))
                                                   (LETT #6# |stopDividing|
                                                         . #8#)
                                                   (GO G190) G191 (EXIT NIL))))
                                        (LETT #7# (CDR #7#) . #8#) (GO G190)
                                        G191 (EXIT NIL))
                                   (EXIT
                                    (COND
                                     ((SPADCALL (SPADCALL |nP| (QREFELT $ 25))
                                                (QREFELT $ 26))
                                      (SEQ
                                       (LETT |basis|
                                             (LIST
                                              (CONS 0 (|spadConstant| $ 16)))
                                             . #8#)
                                       (EXIT
                                        (LETT |terminateWithBasis| 'T . #8#))))
                                     ('T
                                      (SEQ
                                       (LETT |nP|
                                             (SPADCALL
                                              (SPADCALL |nP| |redPols|
                                                        (QREFELT $ 14))
                                              (QREFELT $ 15))
                                             . #8#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |nP| (QREFELT $ 25))
                                           (QREFELT $ 26))
                                          (SEQ
                                           (LETT |basis|
                                                 (LIST
                                                  (CONS 0
                                                        (|spadConstant| $ 16)))
                                                 . #8#)
                                           (EXIT
                                            (LETT |terminateWithBasis| 'T
                                                  . #8#))))
                                         ((SPADCALL |nP| (|spadConstant| $ 21)
                                                    (QREFELT $ 22))
                                          (SEQ
                                           (LETT |irreducibleFactors|
                                                 (|GBF;createAllFactors| |nP|
                                                  $)
                                                 . #8#)
                                           (LETT |doSplitting?|
                                                 (COND
                                                  ((NULL
                                                    (CDR |irreducibleFactors|))
                                                   'NIL)
                                                  ('T 'T))
                                                 . #8#)
                                           (EXIT
                                            (COND
                                             (|doSplitting?|
                                              (SEQ
                                               (SEQ (LETT |fnP| NIL . #8#)
                                                    (LETT #5#
                                                          |irreducibleFactors|
                                                          . #8#)
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #5#)
                                                          (PROGN
                                                           (LETT |fnP|
                                                                 (CAR #5#)
                                                                 . #8#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (LETT |fnP|
                                                           (SPADCALL
                                                            (SPADCALL |fnP|
                                                                      |redPols|
                                                                      (QREFELT
                                                                       $ 14))
                                                            (QREFELT $ 15))
                                                           . #8#)
                                                     (EXIT
                                                      (LETT |allReducedFactors|
                                                            (CONS |fnP|
                                                                  |allReducedFactors|)
                                                            . #8#)))
                                                    (LETT #5# (CDR #5#) . #8#)
                                                    (GO G190) G191 (EXIT NIL))
                                               (EXIT
                                                (LETT |allReducedFactors|
                                                      (REVERSE
                                                       |allReducedFactors|)
                                                      . #8#))))
                                             ('T
                                              (SEQ
                                               (LETT |nP|
                                                     (|SPADfirst|
                                                      |irreducibleFactors|)
                                                     . #8#)
                                               (LETT |lcP|
                                                     (|GBF;updateCritPairs|
                                                      |lcP|
                                                      (|GBF;newPairs| |basis|
                                                       |nP| $)
                                                      |nP| $)
                                                     . #8#)
                                               (LETT |basis|
                                                     (|GBF;updateBasis| |basis|
                                                      |nP|
                                                      (SPADCALL |nP|
                                                                (QREFELT $ 28))
                                                      $)
                                                     . #8#)
                                               (EXIT
                                                (LETT |redPols|
                                                      (SPADCALL |redPols| |nP|
                                                                (QREFELT $ 29))
                                                      . #8#)))))))))))))))
                                  . #8#)
                            (GO #4#)))))
                        #4# (EXIT #4#))))))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            (|doSplitting?|
             (SEQ
              (SEQ (LETT |fnP| NIL . #8#) (LETT #3# |allReducedFactors| . #8#)
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |fnP| (CAR #3#) . #8#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |fnP| (|spadConstant| $ 16) (QREFELT $ 22))
                       (SEQ
                        (LETT |newInputPolys|
                              (SPADCALL (CONS #'|GBF;createGroebnerBases!0| $)
                                        (CONS |fnP| |inputPolys|)
                                        (QREFELT $ 32))
                              . #8#)
                        (LETT |listOfBases|
                              (|GBF;createGroebnerBases| |basis| |redPols|
                               |nonZeroRestrictions| |newInputPolys| |lcP|
                               |listOfBases| |info| $)
                              . #8#)
                        (EXIT
                         (LETT |nonZeroRestrictions|
                               (CONS |fnP| |nonZeroRestrictions|) . #8#))))
                      ('T
                       (SEQ
                        (COND
                         (|info|
                          (SPADCALL "we terminated with [1]" (QREFELT $ 36))))
                        (EXIT
                         (LETT |listOfBases|
                               (CONS (LIST (|spadConstant| $ 16))
                                     |listOfBases|)
                               . #8#)))))))
                   (LETT #3# (CDR #3#) . #8#) (GO G190) G191 (EXIT NIL))
              (EXIT |listOfBases|)))
            ('T
             (SEQ
              (LETT |newBasis|
                    (SPADCALL
                     (SPADCALL (CONS #'|GBF;createGroebnerBases!1| $)
                               (PROGN
                                (LETT #2# NIL . #8#)
                                (SEQ (LETT |p| NIL . #8#)
                                     (LETT #1# |basis| . #8#) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN
                                            (LETT |p| (CAR #1#) . #8#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2# (CONS (QCDR |p|) #2#) . #8#)))
                                     (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               (QREFELT $ 32))
                     (QREFELT $ 37))
                    . #8#)
              (COND
               (|info|
                (SEQ
                 (SPADCALL "we found a groebner basis and check whether it "
                           (QREFELT $ 36))
                 (SPADCALL "contains reducible polynomials" (QREFELT $ 36))
                 (EXIT
                  (SPADCALL (SPADCALL |newBasis| (QREFELT $ 38))
                            (QREFELT $ 39))))))
              (EXIT
               (SPADCALL
                (APPEND (SPADCALL |newBasis| |info| (QREFELT $ 41))
                        |listOfBases|)
                (QREFELT $ 42))))))))))) 

(DEFUN |GBF;createGroebnerBases!1| (|x| |y| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (SPADCALL |y| (QREFELT $ 25))
            (QREFELT $ 30))) 

(DEFUN |GBF;createGroebnerBases!0| (|x| |y| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (SPADCALL |y| (QREFELT $ 25))
            (QREFELT $ 30))) 

(DEFUN |GBF;createAllFactors| (|p| $)
  (PROG (|loF| #1=#:G183 |el| #2=#:G182)
    (RETURN
     (SEQ
      (LETT |loF|
            (PROGN
             (LETT #2# NIL . #3=(|GBF;createAllFactors|))
             (SEQ (LETT |el| NIL . #3#)
                  (LETT #1#
                        (SPADCALL (SPADCALL |p| (QREFELT $ 45)) (QREFELT $ 49))
                        . #3#)
                  G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #2# (CONS (QVELT |el| 1) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (SPADCALL (CONS #'|GBF;createAllFactors!0| $) |loF| (QREFELT $ 32))))))) 

(DEFUN |GBF;createAllFactors!0| (|x| |y| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (SPADCALL |y| (QREFELT $ 25))
            (QREFELT $ 50))) 

(DEFUN |GBF;newPairs| (|lp| |p| $)
  (PROG (|lcP| #1=#:G193 |q| #2=#:G192 |totdegreeOfp|)
    (RETURN
     (SEQ
      (LETT |totdegreeOfp| (SPADCALL |p| (QREFELT $ 28)) . #3=(|GBF;newPairs|))
      (LETT |lcP|
            (PROGN
             (LETT #2# NIL . #3#)
             (SEQ (LETT |q| NIL . #3#) (LETT #1# |lp| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |q| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (SPADCALL |q| |p| |totdegreeOfp| (QREFELT $ 52))
                           #2#)
                          . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (SPADCALL (SPADCALL (ELT $ 53) |lcP| (QREFELT $ 56)) (QREFELT $ 57))))))) 

(DEFUN |GBF;updateCritPairs| (|oldListOfcritPairs| |newListOfcritPairs| |p| $)
  (SPADCALL |newListOfcritPairs|
            (SPADCALL |p| |oldListOfcritPairs| (QREFELT $ 58)) (QREFELT $ 59))) 

(DEFUN |GBF;updateBasis| (|lp| |p| |deg| $)
  (SPADCALL |p| |deg| |lp| (QREFELT $ 61))) 

(DEFUN |GBF;factorGroebnerBasis;LL;6| (|basis| $)
  (SPADCALL |basis| 'NIL (QREFELT $ 41))) 

(DEFUN |GBF;factorGroebnerBasis;LBL;7| (|basis| |info| $)
  (PROG (|foundAReducible| #1=#:G209 |el| #2=#:G208 #3=#:G207 |p|)
    (RETURN
     (SEQ (LETT |foundAReducible| 'NIL . #4=(|GBF;factorGroebnerBasis;LBL;7|))
          (SEQ (LETT |p| NIL . #4#) (LETT #3# |basis| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #4#) NIL)
                     (NULL (COND (|foundAReducible| 'NIL) ('T 'T))))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |foundAReducible|
                       (< 1
                          (LENGTH
                           (PROGN
                            (LETT #2# NIL . #4#)
                            (SEQ (LETT |el| NIL . #4#)
                                 (LETT #1#
                                       (SPADCALL (SPADCALL |p| (QREFELT $ 45))
                                                 (QREFELT $ 49))
                                       . #4#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |el| (CAR #1#) . #4#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2# (CONS (QVELT |el| 1) #2#) . #4#)))
                                 (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))))
                       . #4#)))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            (|foundAReducible|
             (SEQ
              (COND
               (|info|
                (SPADCALL
                 "factorGroebnerBasis:        we found reducible polynomials and continue splitting"
                 (QREFELT $ 36))))
              (EXIT
               (|GBF;createGroebnerBases| NIL NIL NIL |basis| NIL NIL |info|
                $))))
            ('T
             (SEQ
              (COND
               (|info|
                (SPADCALL
                 "factorGroebnerBasis: no reducible polynomials in this basis"
                 (QREFELT $ 36))))
              (EXIT (LIST |basis|)))))))))) 

(DEFUN |GBF;groebnerFactorize;2LL;8| (|basis| |nonZeroRestrictions| $)
  (SPADCALL |basis| |nonZeroRestrictions| 'NIL (QREFELT $ 65))) 

(DEFUN |GBF;groebnerFactorize;2LBL;9| (|basis| |nonZeroRestrictions| |info| $)
  (PROG (#1=#:G220 |p| #2=#:G219)
    (RETURN
     (SEQ
      (COND ((SPADCALL |basis| NIL (QREFELT $ 67)) (LIST |basis|))
            (#3='T
             (SEQ
              (LETT |basis| (SPADCALL (ELT $ 68) |basis| (QREFELT $ 70))
                    . #4=(|GBF;groebnerFactorize;2LBL;9|))
              (EXIT
               (COND
                ((SPADCALL |basis| NIL (QREFELT $ 67))
                 (LIST (LIST (|spadConstant| $ 21))))
                (#3#
                 (SEQ
                  (LETT |basis|
                        (PROGN
                         (LETT #2# NIL . #4#)
                         (SEQ (LETT |p| NIL . #4#) (LETT #1# |basis| . #4#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |p| (CAR #1#) . #4#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |p| (QREFELT $ 15)) #2#)
                                      . #4#)))
                              (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #4#)
                  (EXIT
                   (COND
                    ((SPADCALL (|spadConstant| $ 16) |basis| (QREFELT $ 71))
                     (LIST (LIST (|spadConstant| $ 16))))
                    (#3#
                     (SEQ
                      (LETT |basis|
                            (SPADCALL
                             (CONS #'|GBF;groebnerFactorize;2LBL;9!0| $)
                             |basis| (QREFELT $ 32))
                            . #4#)
                      (EXIT
                       (|GBF;createGroebnerBases| NIL NIL |nonZeroRestrictions|
                        |basis| NIL NIL |info| $))))))))))))))))) 

(DEFUN |GBF;groebnerFactorize;2LBL;9!0| (|x| |y| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (SPADCALL |y| (QREFELT $ 25))
            (QREFELT $ 30))) 

(DEFUN |GBF;groebnerFactorize;LL;10| (|basis| $)
  (SPADCALL |basis| NIL 'NIL (QREFELT $ 65))) 

(DEFUN |GBF;groebnerFactorize;LBL;11| (|basis| |info| $)
  (SPADCALL |basis| NIL |info| (QREFELT $ 65))) 

(DEFUN |GroebnerFactorizationPackage| (&REST #1=#:G223)
  (PROG ()
    (RETURN
     (PROG (#2=#:G224)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|GroebnerFactorizationPackage|)
                                           '|domainEqualList|)
                . #3=(|GroebnerFactorizationPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |GroebnerFactorizationPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|GroebnerFactorizationPackage|))))))))))) 

(DEFUN |GroebnerFactorizationPackage;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|GroebnerFactorizationPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|GroebnerFactorizationPackage| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 74) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|GroebnerFactorizationPackage|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|GroebnerFactorizationPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|)
              (|Record| (|:| |lcmfij| 7) (|:| |totdeg| 27) (|:| |poli| 9)
                        (|:| |polj| 9))
              (|GroebnerInternalPackage| 6 7 8 9) (0 . |sPol|) (|List| 9)
              (5 . |redPol|) (11 . |hMonic|) (16 . |One|) (|Boolean|) (20 . =)
              (26 . |Zero|) (30 . |Zero|) (34 . |Zero|) (38 . ~=)
              (|Union| $ '"failed") (44 . |exquo|) (50 . |degree|)
              (55 . |zero?|) (|NonNegativeInteger|) (60 . |virtualDegree|)
              (65 . |concat|) (71 . >) (|Mapping| 17 9 9) (77 . |sort|)
              (|Void|) (|String|) (|OutputForm|) (83 . |messagePrint|)
              (88 . |minGbasis|) (93 . |coerce|) (98 . |print|) (|List| 13)
              |GBF;factorGroebnerBasis;LBL;7| (103 . |removeDuplicates|)
              (|Factored| 9) (|MultivariateFactorize| 8 7 6 9) (108 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 46) (|:| |fctr| 9) (|:| |xpnt| (|Integer|)))
              (|List| 47) (113 . |factorList|) (118 . <)
              (|Record| (|:| |totdeg| 27) (|:| |pol| 9)) (124 . |makeCrit|)
              (131 . |critpOrder|) (|Mapping| 17 10 10) (|List| 10)
              (137 . |sort|) (143 . |critMTonD1|) (148 . |critBonD|)
              (154 . |updatD|) (|List| 51) (160 . |updatF|)
              |GBF;factorGroebnerBasis;LL;6| (167 . |One|) (171 . |One|)
              |GBF;groebnerFactorize;2LBL;9| |GBF;groebnerFactorize;2LL;8|
              (175 . =) (181 . |zero?|) (|Mapping| 17 9) (186 . |remove|)
              (192 . |member?|) |GBF;groebnerFactorize;LL;10|
              |GBF;groebnerFactorize;LBL;11|)
           '#(|groebnerFactorize| 198 |factorGroebnerBasis| 222) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 73
                                                 '(1 11 9 10 12 2 11 9 9 13 14
                                                   1 11 9 9 15 0 9 0 16 2 9 17
                                                   0 0 18 0 6 0 19 0 7 0 20 0 9
                                                   0 21 2 9 17 0 0 22 2 9 23 0
                                                   0 24 1 9 7 0 25 1 7 17 0 26
                                                   1 11 27 9 28 2 13 0 0 9 29 2
                                                   7 17 0 0 30 2 13 0 31 0 32 1
                                                   35 33 34 36 1 11 13 13 37 1
                                                   13 35 0 38 1 35 33 0 39 1 40
                                                   0 0 42 1 44 43 9 45 1 43 48
                                                   0 49 2 7 17 0 0 50 3 11 10
                                                   51 9 27 52 2 11 17 10 10 53
                                                   2 55 0 54 0 56 1 11 55 55 57
                                                   2 11 55 9 55 58 2 11 55 55
                                                   55 59 3 11 60 9 27 60 61 0 6
                                                   0 63 0 43 0 64 2 13 17 0 0
                                                   67 1 9 17 0 68 2 13 0 69 0
                                                   70 2 13 17 9 0 71 2 0 40 13
                                                   13 66 3 0 40 13 13 17 65 2 0
                                                   40 13 17 73 1 0 40 13 72 1 0
                                                   40 13 62 2 0 40 13 17
                                                   41)))))
           '|lookupComplete|)) 
