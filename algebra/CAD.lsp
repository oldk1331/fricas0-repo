
(SDEFUN |CAD;cylindricalDecomposition;LL;1|
        ((|lpols| |List| (|Polynomial| |TheField|))
         ($ |List| (|Cell| |TheField|)))
        (SPROG ((|lv| (|List| (|Symbol|))) (#1=#:G119 NIL) (|pol| NIL))
               (SEQ (LETT |lv| NIL . #2=(|CAD;cylindricalDecomposition;LL;1|))
                    (SEQ (LETT |pol| NIL . #2#) (LETT #1# |lpols| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |pol| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND ((SPADCALL |pol| (QREFELT $ 9)) "next pol")
                                 ('T
                                  (LETT |lv|
                                        (SPADCALL
                                         (APPEND
                                          (SPADCALL |pol| (QREFELT $ 11)) |lv|)
                                         (QREFELT $ 12))
                                        . #2#)))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (LETT |lv| (REVERSE (SPADCALL |lv| (QREFELT $ 13))) . #2#)
                    (EXIT (SPADCALL |lpols| |lv| (QREFELT $ 16)))))) 

(SDEFUN |CAD;cylindricalDecomposition;LLL;2|
        ((|lpols| |List| (|Polynomial| |TheField|)) (|lvars| |List| (|Symbol|))
         ($ |List| (|Cell| |TheField|)))
        (SPROG
         ((|res| (|List| (|Cell| |TheField|))) (#1=#:G138 NIL) (|scell| NIL)
          (#2=#:G137 NIL)
          (|scells|
           (|List|
            (|SimpleCell| |TheField|
                          (|SparseUnivariatePolynomial| |TheField|))))
          (|lspec| (|List| (|SparseUnivariatePolynomial| |TheField|)))
          (#3=#:G136 NIL) (|cell| NIL)
          (|previousCad| (|List| (|Cell| |TheField|)))
          (|lpols1| (|List| (|Polynomial| |TheField|))) (#4=#:G135 NIL)
          (|pol| NIL) (#5=#:G134 NIL) (#6=#:G133 NIL) (#7=#:G132 NIL)
          (|lp1| (|List| (|SparseUnivariatePolynomial| |TheField|)))
          (#8=#:G131 NIL) (#9=#:G130 NIL) (|lv| (|List| (|Symbol|)))
          (|mv| (|Symbol|)))
         (SEQ
          (COND
           ((SPADCALL |lvars| NIL (QREFELT $ 18))
            (|error| "cylindricalDecomposition: empty list of vars"))
           (#10='T
            (SEQ
             (LETT |mv| (|SPADfirst| |lvars|)
                   . #11=(|CAD;cylindricalDecomposition;LLL;2|))
             (LETT |lv| (CDR |lvars|) . #11#)
             (EXIT
              (COND
               ((SPADCALL |lv| NIL (QREFELT $ 18))
                (SEQ
                 (LETT |lp1|
                       (PROGN
                        (LETT #9# NIL . #11#)
                        (SEQ (LETT |pol| NIL . #11#) (LETT #8# |lpols| . #11#)
                             G190
                             (COND
                              ((OR (ATOM #8#)
                                   (PROGN (LETT |pol| (CAR #8#) . #11#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #9#
                                     (CONS (SPADCALL |pol| (QREFELT $ 20)) #9#)
                                     . #11#)))
                             (LETT #8# (CDR #8#) . #11#) (GO G190) G191
                             (EXIT (NREVERSE #9#))))
                       . #11#)
                 (LETT |scells| (SPADCALL |lp1| |mv| (QREFELT $ 25)) . #11#)
                 (EXIT
                  (PROGN
                   (LETT #7# NIL . #11#)
                   (SEQ (LETT |scell| NIL . #11#) (LETT #6# |scells| . #11#)
                        G190
                        (COND
                         ((OR (ATOM #6#)
                              (PROGN (LETT |scell| (CAR #6#) . #11#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #7#
                                (CONS (SPADCALL (LIST |scell|) (QREFELT $ 28))
                                      #7#)
                                . #11#)))
                        (LETT #6# (CDR #6#) . #11#) (GO G190) G191
                        (EXIT (NREVERSE #7#)))))))
               (#10#
                (SEQ
                 (LETT |lpols1|
                       (SPADCALL
                        (PROGN
                         (LETT #5# NIL . #11#)
                         (SEQ (LETT |pol| NIL . #11#) (LETT #4# |lpols| . #11#)
                              G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |pol| (CAR #4#) . #11#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #5#
                                      (CONS
                                       (SPADCALL |pol| |mv| (QREFELT $ 30))
                                       #5#)
                                      . #11#)))
                              (LETT #4# (CDR #4#) . #11#) (GO G190) G191
                              (EXIT (NREVERSE #5#))))
                        (QREFELT $ 32))
                       . #11#)
                 (LETT |previousCad| (SPADCALL |lpols1| |lv| (QREFELT $ 16))
                       . #11#)
                 (LETT |res| NIL . #11#)
                 (SEQ (LETT |cell| NIL . #11#) (LETT #3# |previousCad| . #11#)
                      G190
                      (COND
                       ((OR (ATOM #3#)
                            (PROGN (LETT |cell| (CAR #3#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |lspec| (SPADCALL |lpols| |cell| (QREFELT $ 33))
                             . #11#)
                       (LETT |scells| (SPADCALL |lspec| |mv| (QREFELT $ 25))
                             . #11#)
                       (EXIT
                        (LETT |res|
                              (APPEND |res|
                                      (PROGN
                                       (LETT #2# NIL . #11#)
                                       (SEQ (LETT |scell| NIL . #11#)
                                            (LETT #1# |scells| . #11#) G190
                                            (COND
                                             ((OR (ATOM #1#)
                                                  (PROGN
                                                   (LETT |scell| (CAR #1#)
                                                         . #11#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #2#
                                                    (CONS
                                                     (SPADCALL |scell| |cell|
                                                               (QREFELT $ 34))
                                                     #2#)
                                                    . #11#)))
                                            (LETT #1# (CDR #1#) . #11#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #2#)))))
                              . #11#)))
                      (LETT #3# (CDR #3#) . #11#) (GO G190) G191 (EXIT NIL))
                 (EXIT |res|))))))))))) 

(SDEFUN |CAD;specialise;LCL;3|
        ((|lpols| |List| (|Polynomial| |TheField|)) (|cell| |Cell| |TheField|)
         ($ |List| (|SparseUnivariatePolynomial| |TheField|)))
        (SPROG
         ((|res| (|List| (|SparseUnivariatePolynomial| |TheField|)))
          (|p1| (|SparseUnivariatePolynomial| |TheField|)) (#1=#:G143 NIL)
          (|pol| NIL) (|vl| (|List| (|Symbol|))) (|sp| (|List| |TheField|)))
         (SEQ
          (COND
           ((SPADCALL |lpols| NIL (QREFELT $ 35))
            (|error| "specialise: empty list of pols"))
           ('T
            (SEQ
             (LETT |sp| (SPADCALL |cell| (QREFELT $ 37))
                   . #2=(|CAD;specialise;LCL;3|))
             (LETT |vl| (SPADCALL |cell| (QREFELT $ 38)) . #2#)
             (LETT |res| NIL . #2#)
             (SEQ (LETT |pol| NIL . #2#) (LETT #1# |lpols| . #2#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |pol| (CAR #1#) . #2#) NIL))
                    (GO G191)))
                  (SEQ
                   (LETT |p1|
                         (SPADCALL (SPADCALL |pol| |vl| |sp| (QREFELT $ 39))
                                   (QREFELT $ 20))
                         . #2#)
                   (EXIT
                    (COND ((EQL (SPADCALL |p1| (QREFELT $ 41)) 0) "next pol")
                          ('T (LETT |res| (CONS |p1| |res|) . #2#)))))
                  (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
             (EXIT |res|))))))) 

(SDEFUN |CAD;coefficientSet;SupL;4|
        ((|pol| |SparseUnivariatePolynomial| (|Polynomial| |TheField|))
         ($ |List| (|Polynomial| |TheField|)))
        (SPROG
         ((|res| (|List| (|Polynomial| |TheField|))) (#1=#:G148 NIL)
          (#2=#:G149 NIL) (|c| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |res| NIL . #3=(|CAD;coefficientSet;SupL;4|))
                (SEQ (LETT |c| NIL . #3#)
                     (LETT #2# (SPADCALL |pol| (QREFELT $ 44)) . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |c| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |c| (QREFELT $ 9))
                         (PROGN (LETT #1# |res| . #3#) (GO #4=#:G147)))
                        ('T (LETT |res| (CONS |c| |res|) . #3#)))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #4# (EXIT #1#)))) 

(SDEFUN |CAD;discriminantSet;LL;5|
        ((|lpols| |List|
          (|SparseUnivariatePolynomial| (|Polynomial| |TheField|)))
         ($ |List| (|Polynomial| |TheField|)))
        (SPROG
         ((|res| (|List| (|Polynomial| |TheField|))) (#1=#:G156 NIL)
          (|d| (|Polynomial| |TheField|))
          (|v|
           (|PrimitiveArray|
            (|SparseUnivariatePolynomial| (|Polynomial| |TheField|))))
          (#2=#:G157 NIL) (|p| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |res| NIL . #3=(|CAD;discriminantSet;LL;5|))
                (SEQ (LETT |p| NIL . #3#) (LETT #2# |lpols| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |v|
                            (SPADCALL |p| (SPADCALL |p| (QREFELT $ 46))
                                      (QREFELT $ 49))
                            . #3#)
                      (COND
                       ((NULL (ZEROP (SPADCALL (QAREF1 |v| 0) (QREFELT $ 51))))
                        (EXIT
                         (PROGN
                          (LETT #1# (|error| "Bad discriminant") . #3#)
                          (GO #4=#:G155)))))
                      (LETT |d| (SPADCALL (QAREF1 |v| 0) (QREFELT $ 52)) . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL |d| (QREFELT $ 53))
                         (PROGN
                          (LETT #1# (|error| "Non Square Free polynomial")
                                . #3#)
                          (GO #4#)))
                        ((NULL (SPADCALL |d| (QREFELT $ 9)))
                         (LETT |res| (CONS |d| |res|) . #3#)))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #4# (EXIT #1#)))) 

(SDEFUN |CAD;principalSubResultantSet;2SupL;6|
        ((|p| . #1=(|SparseUnivariatePolynomial| (|Polynomial| |TheField|)))
         (|q| . #2=(|SparseUnivariatePolynomial| (|Polynomial| |TheField|)))
         ($ |List| (|Polynomial| |TheField|)))
        (SPROG
         ((#3=#:G166 NIL) (#4=#:G161 NIL) (|i| NIL) (#5=#:G165 NIL)
          (|v|
           (|PrimitiveArray|
            (|SparseUnivariatePolynomial| (|Polynomial| |TheField|))))
          (|#G27| (|SparseUnivariatePolynomial| (|Polynomial| |TheField|)))
          (|#G26| #2#) (|#G25| #1#) (|#G24| #2#))
         (SEQ
          (COND
           ((< (SPADCALL |p| (QREFELT $ 51)) (SPADCALL |q| (QREFELT $ 51)))
            (PROGN
             (LETT |#G24| |q| . #6=(|CAD;principalSubResultantSet;2SupL;6|))
             (LETT |#G25| |p| . #6#)
             (LETT |p| |#G24| . #6#)
             (LETT |q| |#G25| . #6#))))
          (COND
           ((EQL (SPADCALL |p| (QREFELT $ 51)) (SPADCALL |q| (QREFELT $ 51)))
            (PROGN
             (LETT |#G26| |q| . #6#)
             (LETT |#G27| (SPADCALL |p| |q| (QREFELT $ 55)) . #6#)
             (LETT |p| |#G26| . #6#)
             (LETT |q| |#G27| . #6#))))
          (LETT |v| (SPADCALL |p| |q| (QREFELT $ 49)) . #6#)
          (EXIT
           (PROGN
            (LETT #5# NIL . #6#)
            (SEQ (LETT |i| 0 . #6#)
                 (LETT #3#
                       (PROG1 (LETT #4# (- (QVSIZE |v|) 2) . #6#)
                         (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #4#))
                       . #6#)
                 G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #5#
                         (CONS (SPADCALL (QAREF1 |v| |i|) |i| (QREFELT $ 56))
                               #5#)
                         . #6#)))
                 (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                 (EXIT (NREVERSE #5#)))))))) 

(SDEFUN |CAD;resultantSet;LL;7|
        ((|lpols|
          . #1=(|List|
                (|SparseUnivariatePolynomial| (|Polynomial| |TheField|))))
         ($ |List| (|Polynomial| |TheField|)))
        (SPROG
         ((|res| (|List| (|Polynomial| |TheField|))) (#2=#:G174 NIL)
          (|r| (|Polynomial| |TheField|)) (#3=#:G176 NIL) (|q| NIL)
          (|laux| #1#) (#4=#:G175 NIL) (|p| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |res| NIL . #5=(|CAD;resultantSet;LL;7|))
                (LETT |laux| |lpols| . #5#)
                (SEQ (LETT |p| NIL . #5#) (LETT #4# |lpols| . #5#) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #5#) NIL))
                       (GO G191)))
                     (SEQ (LETT |laux| (CDR |laux|) . #5#)
                          (EXIT
                           (SEQ (LETT |q| NIL . #5#) (LETT #3# |laux| . #5#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |q| (CAR #3#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |r|
                                       (|SPADfirst|
                                        (SPADCALL |p| |q| (QREFELT $ 57)))
                                       . #5#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |r| (QREFELT $ 53))
                                    (PROGN
                                     (LETT #2#
                                           (|error|
                                            "Non relatively prime polynomials")
                                           . #5#)
                                     (GO #6=#:G173)))
                                   ((NULL (SPADCALL |r| (QREFELT $ 9)))
                                    (LETT |res| (CONS |r| |res|) . #5#)))))
                                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                (EXIT NIL))))
                     (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #6# (EXIT #2#)))) 

(SDEFUN |CAD;projectionSet;LL;8|
        ((|lpols| |List|
          (|SparseUnivariatePolynomial| (|Polynomial| |TheField|)))
         ($ |List| (|Polynomial| |TheField|)))
        (SPROG
         ((|res| (|List| (|Polynomial| |TheField|))) (#1=#:G191 NIL) (|p| NIL)
          (|lsqfrb|
           (|List| (|SparseUnivariatePolynomial| (|Polynomial| |TheField|))))
          (|lp1|
           (|List| (|SparseUnivariatePolynomial| (|Polynomial| |TheField|))))
          (|f|
           (|Mapping| (|Boolean|)
                      (|SparseUnivariatePolynomial| (|Polynomial| |TheField|))
                      (|SparseUnivariatePolynomial|
                       (|Polynomial| |TheField|))))
          (#2=#:G190 NIL) (#3=#:G189 NIL) (|c| (|Polynomial| |TheField|))
          (#4=#:G188 NIL))
         (SEQ (LETT |res| NIL . #5=(|CAD;projectionSet;LL;8|))
              (SEQ (LETT |p| NIL . #5#) (LETT #4# |lpols| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |c| (SPADCALL |p| (QREFELT $ 59)) . #5#)
                        (EXIT
                         (COND ((SPADCALL |c| (QREFELT $ 9)) "next p")
                               ('T (LETT |res| (CONS |c| |res|) . #5#)))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |lp1|
                    (PROGN
                     (LETT #3# NIL . #5#)
                     (SEQ (LETT |p| NIL . #5#) (LETT #2# |lpols| . #5#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |p| (CAR #2#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3# (CONS (SPADCALL |p| (QREFELT $ 60)) #3#)
                                  . #5#)))
                          (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    . #5#)
              (LETT |f| (CONS #'|CAD;projectionSet;LL;8!0| $) . #5#)
              (LETT |lp1| (SPADCALL |f| |lp1| (QREFELT $ 63)) . #5#)
              (LETT |lsqfrb| (SPADCALL |lp1| (QREFELT $ 65)) . #5#)
              (LETT |lsqfrb| (SPADCALL |f| |lsqfrb| (QREFELT $ 63)) . #5#)
              (SEQ (LETT |p| NIL . #5#) (LETT #1# |lp1| . #5#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res| (APPEND |res| (SPADCALL |p| (QREFELT $ 45)))
                           . #5#)))
                   (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |res| (APPEND |res| (SPADCALL |lsqfrb| (QREFELT $ 54)))
                    . #5#)
              (EXIT (APPEND |res| (SPADCALL |lsqfrb| (QREFELT $ 58))))))) 

(SDEFUN |CAD;projectionSet;LL;8!0| ((|x1| NIL) (|x2| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 51)) (SPADCALL |x2| (QREFELT $ 51))
                  (QREFELT $ 61))) 

(DECLAIM (NOTINLINE |CylindricalAlgebraicDecompositionPackage;|)) 

(DEFUN |CylindricalAlgebraicDecompositionPackage| (#1=#:G192)
  (SPROG NIL
         (PROG (#2=#:G193)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|CylindricalAlgebraicDecompositionPackage|)
                                               '|domainEqualList|)
                    . #3=(|CylindricalAlgebraicDecompositionPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|CylindricalAlgebraicDecompositionPackage;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|CylindricalAlgebraicDecompositionPackage|)))))))))) 

(DEFUN |CylindricalAlgebraicDecompositionPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|CylindricalAlgebraicDecompositionPackage|))
          (LETT |dv$| (LIST '|CylindricalAlgebraicDecompositionPackage| DV$1)
                . #1#)
          (LETT $ (GETREFV 66) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache|
                      '|CylindricalAlgebraicDecompositionPackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|CylindricalAlgebraicDecompositionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|)
              (|Polynomial| 6) (0 . |ground?|) (|List| 23) (5 . |variables|)
              (10 . |removeDuplicates|) (15 . |sort|) (|List| 27) (|List| 8)
              |CAD;cylindricalDecomposition;LLL;2|
              |CAD;cylindricalDecomposition;LL;1| (20 . =)
              (|SparseUnivariatePolynomial| 6) (26 . |univariate|) (|List| $)
              (|List| 19) (|Symbol|) (|SimpleCell| 6 19)
              (31 . |allSimpleCells|) (|List| 24) (|Cell| 6) (37 . |makeCell|)
              (|SparseUnivariatePolynomial| $) (42 . |univariate|) (|List| 43)
              |CAD;projectionSet;LL;8| |CAD;specialise;LCL;3| (48 . |makeCell|)
              (54 . =) (|List| 6) (60 . |samplePoint|) (65 . |variablesOf|)
              (70 . |eval|) (|NonNegativeInteger|) (77 . |degree|)
              (82 . |Zero|) (|SparseUnivariatePolynomial| 8)
              (86 . |coefficients|) |CAD;coefficientSet;SupL;4|
              (91 . |differentiate|) (|PrimitiveArray| 43)
              (|SubResultantPackage| 8 43) (96 . |subresultantVector|)
              (102 . |Zero|) (106 . |degree|) (111 . |leadingCoefficient|)
              (116 . |zero?|) |CAD;discriminantSet;LL;5|
              (121 . |pseudoRemainder|) (127 . |coefficient|)
              |CAD;principalSubResultantSet;2SupL;6| |CAD;resultantSet;LL;7|
              (133 . |content|) (138 . |primitivePart|) (143 . <=)
              (|Mapping| 7 43 43) (149 . |sort|)
              (|CylindricalAlgebraicDecompositionUtilities| 8 43)
              (155 . |squareFreeBasis|))
           '#(|specialise| 160 |resultantSet| 166 |projectionSet| 171
              |principalSubResultantSet| 176 |discriminantSet| 182
              |cylindricalDecomposition| 187 |coefficientSet| 198)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 65
                                                 '(1 8 7 0 9 1 8 10 0 11 1 10 0
                                                   0 12 1 10 0 0 13 2 10 7 0 0
                                                   18 1 8 19 0 20 2 24 21 22 23
                                                   25 1 27 0 26 28 2 8 29 0 23
                                                   30 2 27 0 24 0 34 2 15 7 0 0
                                                   35 1 27 36 0 37 1 27 10 0 38
                                                   3 8 0 0 10 36 39 1 19 40 0
                                                   41 0 6 0 42 1 43 15 0 44 1
                                                   43 0 0 46 2 48 47 43 43 49 0
                                                   8 0 50 1 43 40 0 51 1 43 8 0
                                                   52 1 8 7 0 53 2 43 0 0 0 55
                                                   2 43 8 0 40 56 1 43 8 0 59 1
                                                   43 0 0 60 2 40 7 0 0 61 2 31
                                                   0 62 0 63 1 64 31 31 65 2 0
                                                   22 15 27 33 1 0 15 31 58 1 0
                                                   15 31 32 2 0 15 43 43 57 1 0
                                                   15 31 54 2 0 14 15 10 16 1 0
                                                   14 15 17 1 0 15 43 45)))))
           '|lookupComplete|)) 
