
(SDEFUN |GBF;createGroebnerBases|
        ((|basis| |List|
          (|Record| (|:| |totdeg| (|NonNegativeInteger|)) (|:| |pol| |Dpol|)))
         (|redPols| |List| |Dpol|) (|nonZeroRestrictions| |List| |Dpol|)
         (|inputPolys| |List| |Dpol|)
         (|lcP| |List|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|)))
         (|listOfBases| |List| (|List| |Dpol|)) (|info| |Boolean|)
         ($ |List| (|List| |Dpol|)))
        (SPROG
         ((|newBasis| (|List| |Dpol|)) (#1=#:G157 NIL) (|p| (|Dpol|))
          (#2=#:G156 NIL) (|newInputPolys| (|List| |Dpol|)) (#3=#:G155 NIL)
          (|fnP| (|Dpol|)) (#4=#:G151 NIL) (|nP| (|Dpol|))
          (|allReducedFactors| (|List| |Dpol|)) (#5=#:G154 NIL)
          (|doSplitting?| #6=(|Boolean|))
          (|irreducibleFactors| (|List| |Dpol|)) (|terminateWithBasis| #6#)
          (|stopDividing| #6#) (#7=#:G118 NIL)
          (|nPq| (|Union| |Dpol| #8="failed")) (#9=#:G153 NIL) (#10=#:G152 NIL)
          (|q| NIL) (|h| (|Dpol|)))
         (SEQ (LETT |doSplitting?| NIL . #11=(|GBF;createGroebnerBases|))
              (LETT |terminateWithBasis| NIL . #11#)
              (LETT |allReducedFactors| NIL . #11#)
              (SEQ G190
                   (COND
                    ((NULL (NULL (OR |doSplitting?| |terminateWithBasis|)))
                     (GO G191)))
                   (SEQ
                    (LETT |terminateWithBasis|
                          (COND ((NULL |inputPolys|) (NULL |lcP|)) ('T NIL))
                          . #11#)
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
                                       . #11#)
                                 (LETT |lcP| (CDR |lcP|) . #11#)
                                 (EXIT
                                  (SPADCALL
                                   (SPADCALL |h| |redPols| (QREFELT $ 14))
                                   (QREFELT $ 15)))))
                               ('T
                                (SEQ
                                 (LETT |p| (|SPADfirst| |inputPolys|) . #11#)
                                 (LETT |inputPolys| (CDR |inputPolys|) . #11#)
                                 (EXIT
                                  (SPADCALL
                                   (SPADCALL |p| |redPols| (QREFELT $ 14))
                                   (QREFELT $ 15))))))
                              . #11#)
                        (EXIT
                         (COND
                          ((SPADCALL |nP| (|spadConstant| $ 16) (QREFELT $ 18))
                           (SEQ
                            (LETT |basis| (LIST (CONS 0 (|spadConstant| $ 16)))
                                  . #11#)
                            (EXIT (LETT |terminateWithBasis| 'T . #11#))))
                          ('T
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |nP| (|spadConstant| $ 21)
                                         (QREFELT $ 22))
                               (PROGN
                                (LETT #4#
                                      (SEQ
                                       (SEQ (LETT |q| NIL . #11#)
                                            (LETT #10# |nonZeroRestrictions|
                                                  . #11#)
                                            G190
                                            (COND
                                             ((OR (ATOM #10#)
                                                  (PROGN
                                                   (LETT |q| (CAR #10#) . #11#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |stopDividing| NIL . #11#)
                                             (EXIT
                                              (SEQ (LETT #9# NIL . #11#) G190
                                                   (COND (#9# (GO G191)))
                                                   (SEQ
                                                    (LETT |nPq|
                                                          (SPADCALL |nP| |q|
                                                                    (QREFELT $
                                                                             24))
                                                          . #11#)
                                                    (LETT |stopDividing|
                                                          (QEQCAR |nPq| 1)
                                                          . #11#)
                                                    (COND
                                                     ((NULL |stopDividing|)
                                                      (LETT |nP|
                                                            (PROG2
                                                                (LETT #7# |nPq|
                                                                      . #11#)
                                                                (QCDR #7#)
                                                              (|check_union2|
                                                               (QEQCAR #7# 0)
                                                               (QREFELT $ 9)
                                                               (|Union|
                                                                (QREFELT $ 9)
                                                                #8#)
                                                               #7#))
                                                            . #11#)))
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
                                                           . #11#)))
                                                   (LETT #9# |stopDividing|
                                                         . #11#)
                                                   (GO G190) G191 (EXIT NIL))))
                                            (LETT #10# (CDR #10#) . #11#)
                                            (GO G190) G191 (EXIT NIL))
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
                                                 . #11#)
                                           (EXIT
                                            (LETT |terminateWithBasis| 'T
                                                  . #11#))))
                                         ('T
                                          (SEQ
                                           (LETT |nP|
                                                 (SPADCALL
                                                  (SPADCALL |nP| |redPols|
                                                            (QREFELT $ 14))
                                                  (QREFELT $ 15))
                                                 . #11#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL
                                               (SPADCALL |nP| (QREFELT $ 25))
                                               (QREFELT $ 26))
                                              (SEQ
                                               (LETT |basis|
                                                     (LIST
                                                      (CONS 0
                                                            (|spadConstant| $
                                                                            16)))
                                                     . #11#)
                                               (EXIT
                                                (LETT |terminateWithBasis| 'T
                                                      . #11#))))
                                             ((SPADCALL |nP|
                                                        (|spadConstant| $ 21)
                                                        (QREFELT $ 22))
                                              (SEQ
                                               (LETT |irreducibleFactors|
                                                     (|GBF;createAllFactors|
                                                      |nP| $)
                                                     . #11#)
                                               (LETT |doSplitting?|
                                                     (NULL
                                                      (NULL
                                                       (CDR
                                                        |irreducibleFactors|)))
                                                     . #11#)
                                               (EXIT
                                                (COND
                                                 (|doSplitting?|
                                                  (SEQ
                                                   (SEQ (LETT |fnP| NIL . #11#)
                                                        (LETT #5#
                                                              |irreducibleFactors|
                                                              . #11#)
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #5#)
                                                              (PROGN
                                                               (LETT |fnP|
                                                                     (CAR #5#)
                                                                     . #11#)
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (LETT |fnP|
                                                               (SPADCALL
                                                                (SPADCALL |fnP|
                                                                          |redPols|
                                                                          (QREFELT
                                                                           $
                                                                           14))
                                                                (QREFELT $ 15))
                                                               . #11#)
                                                         (EXIT
                                                          (LETT
                                                           |allReducedFactors|
                                                           (CONS |fnP|
                                                                 |allReducedFactors|)
                                                           . #11#)))
                                                        (LETT #5# (CDR #5#)
                                                              . #11#)
                                                        (GO G190) G191
                                                        (EXIT NIL))
                                                   (EXIT
                                                    (LETT |allReducedFactors|
                                                          (REVERSE
                                                           |allReducedFactors|)
                                                          . #11#))))
                                                 ('T
                                                  (SEQ
                                                   (LETT |nP|
                                                         (|SPADfirst|
                                                          |irreducibleFactors|)
                                                         . #11#)
                                                   (LETT |lcP|
                                                         (|GBF;updateCritPairs|
                                                          |lcP|
                                                          (|GBF;newPairs|
                                                           |basis| |nP| $)
                                                          |nP| $)
                                                         . #11#)
                                                   (LETT |basis|
                                                         (|GBF;updateBasis|
                                                          |basis| |nP|
                                                          (SPADCALL |nP|
                                                                    (QREFELT $
                                                                             28))
                                                          $)
                                                         . #11#)
                                                   (EXIT
                                                    (LETT |redPols|
                                                          (SPADCALL |redPols|
                                                                    |nP|
                                                                    (QREFELT $
                                                                             29))
                                                          . #11#)))))))))))))))
                                      . #11#)
                                (GO #12=#:G135)))))
                            #12# (EXIT #4#))))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                (|doSplitting?|
                 (SEQ
                  (SEQ (LETT |fnP| NIL . #11#)
                       (LETT #3# |allReducedFactors| . #11#) G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |fnP| (CAR #3#) . #11#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |fnP| (|spadConstant| $ 16)
                                     (QREFELT $ 22))
                           (SEQ
                            (LETT |newInputPolys|
                                  (SPADCALL
                                   (CONS #'|GBF;createGroebnerBases!0| $)
                                   (CONS |fnP| |inputPolys|) (QREFELT $ 32))
                                  . #11#)
                            (LETT |listOfBases|
                                  (|GBF;createGroebnerBases| |basis| |redPols|
                                   |nonZeroRestrictions| |newInputPolys| |lcP|
                                   |listOfBases| |info| $)
                                  . #11#)
                            (EXIT
                             (LETT |nonZeroRestrictions|
                                   (CONS |fnP| |nonZeroRestrictions|)
                                   . #11#))))
                          ('T
                           (SEQ
                            (COND
                             (|info|
                              (SPADCALL "we terminated with [1]"
                                        (QREFELT $ 36))))
                            (EXIT
                             (LETT |listOfBases|
                                   (CONS (LIST (|spadConstant| $ 16))
                                         |listOfBases|)
                                   . #11#)))))))
                       (LETT #3# (CDR #3#) . #11#) (GO G190) G191 (EXIT NIL))
                  (EXIT |listOfBases|)))
                ('T
                 (SEQ
                  (LETT |newBasis|
                        (SPADCALL
                         (SPADCALL (CONS #'|GBF;createGroebnerBases!1| $)
                                   (PROGN
                                    (LETT #2# NIL . #11#)
                                    (SEQ (LETT |p| NIL . #11#)
                                         (LETT #1# |basis| . #11#) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |p| (CAR #1#) . #11#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #2# (CONS (QCDR |p|) #2#)
                                                 . #11#)))
                                         (LETT #1# (CDR #1#) . #11#) (GO G190)
                                         G191 (EXIT (NREVERSE #2#))))
                                   (QREFELT $ 32))
                         (QREFELT $ 37))
                        . #11#)
                  (COND
                   (|info|
                    (SEQ
                     (SPADCALL
                      "we found a groebner basis and check whether it "
                      (QREFELT $ 36))
                     (SPADCALL "contains reducible polynomials" (QREFELT $ 36))
                     (EXIT
                      (SPADCALL (SPADCALL |newBasis| (QREFELT $ 38))
                                (QREFELT $ 39))))))
                  (EXIT
                   (SPADCALL
                    (APPEND (SPADCALL |newBasis| |info| (QREFELT $ 41))
                            |listOfBases|)
                    (QREFELT $ 42)))))))))) 

(SDEFUN |GBF;createGroebnerBases!1| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (SPADCALL |y| (QREFELT $ 25))
                  (QREFELT $ 30))) 

(SDEFUN |GBF;createGroebnerBases!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (SPADCALL |y| (QREFELT $ 25))
                  (QREFELT $ 30))) 

(SDEFUN |GBF;createAllFactors| ((|p| |Dpol|) ($ |List| |Dpol|))
        (SPROG
         ((|loF| (|List| |Dpol|)) (#1=#:G164 NIL) (|el| NIL) (#2=#:G163 NIL))
         (SEQ
          (LETT |loF|
                (PROGN
                 (LETT #2# NIL . #3=(|GBF;createAllFactors|))
                 (SEQ (LETT |el| NIL . #3#)
                      (LETT #1#
                            (SPADCALL (SPADCALL |p| (QREFELT $ 45))
                                      (QREFELT $ 49))
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
           (SPADCALL (CONS #'|GBF;createAllFactors!0| $) |loF|
                     (QREFELT $ 32)))))) 

(SDEFUN |GBF;createAllFactors!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (SPADCALL |y| (QREFELT $ 25))
                  (QREFELT $ 50))) 

(SDEFUN |GBF;newPairs|
        ((|lp| |List|
          (|Record| (|:| |totdeg| (|NonNegativeInteger|)) (|:| |pol| |Dpol|)))
         (|p| |Dpol|)
         ($ |List|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|))))
        (SPROG
         ((|lcP|
           (|List|
            (|Record| (|:| |lcmfij| |Expon|)
                      (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                      (|:| |polj| |Dpol|))))
          (#1=#:G175 NIL) (|q| NIL) (#2=#:G174 NIL)
          (|totdegreeOfp| (|NonNegativeInteger|)))
         (SEQ
          (LETT |totdegreeOfp| (SPADCALL |p| (QREFELT $ 28))
                . #3=(|GBF;newPairs|))
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
           (SPADCALL (SPADCALL (ELT $ 53) |lcP| (QREFELT $ 56))
                     (QREFELT $ 57)))))) 

(SDEFUN |GBF;updateCritPairs|
        ((|oldListOfcritPairs| |List|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|)))
         (|newListOfcritPairs| |List|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|)))
         (|p| |Dpol|)
         ($ |List|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|))))
        (SPADCALL |newListOfcritPairs|
                  (SPADCALL |p| |oldListOfcritPairs| (QREFELT $ 58))
                  (QREFELT $ 59))) 

(SDEFUN |GBF;updateBasis|
        ((|lp| |List|
          (|Record| (|:| |totdeg| (|NonNegativeInteger|)) (|:| |pol| |Dpol|)))
         (|p| |Dpol|) (|deg| |NonNegativeInteger|)
         ($ |List|
          (|Record| (|:| |totdeg| (|NonNegativeInteger|)) (|:| |pol| |Dpol|))))
        (SPADCALL |p| |deg| |lp| (QREFELT $ 61))) 

(SDEFUN |GBF;factorGroebnerBasis;LL;6|
        ((|basis| |List| |Dpol|) ($ |List| (|List| |Dpol|)))
        (SPADCALL |basis| NIL (QREFELT $ 41))) 

(SDEFUN |GBF;factorGroebnerBasis;LBL;7|
        ((|basis| |List| |Dpol|) (|info| |Boolean|) ($ |List| (|List| |Dpol|)))
        (SPROG
         ((|foundAReducible| (|Boolean|)) (#1=#:G191 NIL) (|el| NIL)
          (#2=#:G190 NIL) (#3=#:G189 NIL) (|p| NIL))
         (SEQ
          (LETT |foundAReducible| NIL . #4=(|GBF;factorGroebnerBasis;LBL;7|))
          (SEQ (LETT |p| NIL . #4#) (LETT #3# |basis| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #4#) NIL)
                     (NULL (NULL |foundAReducible|)))
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
              (EXIT (LIST |basis|))))))))) 

(SDEFUN |GBF;groebnerFactorize;2LL;8|
        ((|basis| |List| |Dpol|) (|nonZeroRestrictions| |List| |Dpol|)
         ($ |List| (|List| |Dpol|)))
        (SPADCALL |basis| |nonZeroRestrictions| NIL (QREFELT $ 64))) 

(SDEFUN |GBF;groebnerFactorize;2LBL;9|
        ((|basis| |List| |Dpol|) (|nonZeroRestrictions| |List| |Dpol|)
         (|info| |Boolean|) ($ |List| (|List| |Dpol|)))
        (SPROG ((#1=#:G202 NIL) (|p| NIL) (#2=#:G201 NIL))
               (SEQ
                (COND ((SPADCALL |basis| NIL (QREFELT $ 66)) (LIST |basis|))
                      (#3='T
                       (SEQ
                        (LETT |basis|
                              (SPADCALL (ELT $ 67) |basis| (QREFELT $ 69))
                              . #4=(|GBF;groebnerFactorize;2LBL;9|))
                        (EXIT
                         (COND
                          ((SPADCALL |basis| NIL (QREFELT $ 66))
                           (LIST (LIST (|spadConstant| $ 21))))
                          (#3#
                           (SEQ
                            (LETT |basis|
                                  (PROGN
                                   (LETT #2# NIL . #4#)
                                   (SEQ (LETT |p| NIL . #4#)
                                        (LETT #1# |basis| . #4#) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |p| (CAR #1#) . #4#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL |p| (QREFELT $ 15))
                                                 #2#)
                                                . #4#)))
                                        (LETT #1# (CDR #1#) . #4#) (GO G190)
                                        G191 (EXIT (NREVERSE #2#))))
                                  . #4#)
                            (EXIT
                             (COND
                              ((SPADCALL (|spadConstant| $ 16) |basis|
                                         (QREFELT $ 70))
                               (LIST (LIST (|spadConstant| $ 16))))
                              (#3#
                               (SEQ
                                (LETT |basis|
                                      (SPADCALL
                                       (CONS #'|GBF;groebnerFactorize;2LBL;9!0|
                                             $)
                                       |basis| (QREFELT $ 32))
                                      . #4#)
                                (EXIT
                                 (|GBF;createGroebnerBases| NIL NIL
                                  |nonZeroRestrictions| |basis| NIL NIL |info|
                                  $)))))))))))))))) 

(SDEFUN |GBF;groebnerFactorize;2LBL;9!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (SPADCALL |y| (QREFELT $ 25))
                  (QREFELT $ 30))) 

(SDEFUN |GBF;groebnerFactorize;LL;10|
        ((|basis| |List| |Dpol|) ($ |List| (|List| |Dpol|)))
        (SPADCALL |basis| NIL NIL (QREFELT $ 64))) 

(SDEFUN |GBF;groebnerFactorize;LBL;11|
        ((|basis| |List| |Dpol|) (|info| |Boolean|) ($ |List| (|List| |Dpol|)))
        (SPADCALL |basis| NIL |info| (QREFELT $ 64))) 

(DECLAIM (NOTINLINE |GroebnerFactorizationPackage;|)) 

(DEFUN |GroebnerFactorizationPackage| (&REST #1=#:G205)
  (SPROG NIL
         (PROG (#2=#:G206)
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
                  (PROG1
                      (APPLY (|function| |GroebnerFactorizationPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GroebnerFactorizationPackage|)))))))))) 

(DEFUN |GroebnerFactorizationPackage;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|GroebnerFactorizationPackage|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|GroebnerFactorizationPackage| DV$1 DV$2 DV$3 DV$4)
          . #1#)
    (LETT $ (GETREFV 73) . #1#)
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
    $))) 

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
              |GBF;factorGroebnerBasis;LL;6| (167 . |One|)
              |GBF;groebnerFactorize;2LBL;9| |GBF;groebnerFactorize;2LL;8|
              (171 . =) (177 . |zero?|) (|Mapping| 17 9) (182 . |remove|)
              (188 . |member?|) |GBF;groebnerFactorize;LL;10|
              |GBF;groebnerFactorize;LBL;11|)
           '#(|groebnerFactorize| 194 |factorGroebnerBasis| 218) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 72
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
                                                   0 63 2 13 17 0 0 66 1 9 17 0
                                                   67 2 13 0 68 0 69 2 13 17 9
                                                   0 70 2 0 40 13 13 65 3 0 40
                                                   13 13 17 64 2 0 40 13 17 72
                                                   1 0 40 13 71 1 0 40 13 62 2
                                                   0 40 13 17 41)))))
           '|lookupComplete|)) 
