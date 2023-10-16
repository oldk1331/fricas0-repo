
(SDEFUN |ALGFF;branchPointAtInfinity?;B;1| (($ |Boolean|))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 13) (QREFELT $ 35)) (|ALGFF;startUp| NIL $)))
         (EXIT (SPADCALL (QREFELT $ 14) (QREFELT $ 36))))) 

(SDEFUN |ALGFF;discriminant;F;2| (($ |Fraction| UP))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 13) (QREFELT $ 35)) (|ALGFF;startUp| NIL $)))
         (EXIT (SPADCALL (QREFELT $ 21) (QREFELT $ 38))))) 

(SDEFUN |ALGFF;integralBasis;V;3| (($ |Vector| $))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 13) (QREFELT $ 35)) (|ALGFF;startUp| NIL $)))
         (EXIT (|ALGFF;vect| (QREFELT $ 30) $)))) 

(SDEFUN |ALGFF;integralBasisAtInfinity;V;4| (($ |Vector| $))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 13) (QREFELT $ 35)) (|ALGFF;startUp| NIL $)))
         (EXIT (|ALGFF;vect| (QREFELT $ 33) $)))) 

(SDEFUN |ALGFF;integralMatrix;M;5| (($ |Matrix| (|Fraction| UP)))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 13) (QREFELT $ 35)) (|ALGFF;startUp| NIL $)))
         (EXIT (QREFELT $ 30)))) 

(SDEFUN |ALGFF;inverseIntegralMatrix;M;6| (($ |Matrix| (|Fraction| UP)))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 13) (QREFELT $ 35)) (|ALGFF;startUp| NIL $)))
         (EXIT (QREFELT $ 32)))) 

(SDEFUN |ALGFF;integralMatrixAtInfinity;M;7| (($ |Matrix| (|Fraction| UP)))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 13) (QREFELT $ 35)) (|ALGFF;startUp| NIL $)))
         (EXIT (QREFELT $ 33)))) 

(SDEFUN |ALGFF;branchPoint?;FB;8| ((|a| F) ($ |Boolean|))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 39)) (QREFELT $ 46)) |a|
                   (QREFELT $ 47))
         (QREFELT $ 48))) 

(SDEFUN |ALGFF;definingPolynomial;UPUP;9| (($ UPUP)) (QREFELT $ 9)) 

(SDEFUN |ALGFF;inverseIntegralMatrixAtInfinity;M;10|
        (($ |Matrix| (|Fraction| UP)))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 13) (QREFELT $ 35)) (|ALGFF;startUp| NIL $)))
         (EXIT (QREFELT $ 34)))) 

(SDEFUN |ALGFF;vect| ((|m| |Matrix| (|Fraction| UP)) ($ |Vector| $))
        (SPROG ((#1=#:G147 NIL) (#2=#:G149 NIL) (|i| NIL) (#3=#:G148 NIL))
               (SEQ
                (PROGN
                 (LETT #3#
                       (GETREFV
                        (|inc_SI|
                         (- #4=(SPADCALL |m| (QREFELT $ 53))
                            #5=(PROGN |m| 1)))))
                 (SEQ (LETT |i| #5#) (LETT #2# #4#) (LETT #1# 0) G190
                      (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL (SPADCALL |m| |i| (QREFELT $ 55))
                                          (QREFELT $ 56)))))
                      (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1))))
                      (GO G190) G191 (EXIT NIL))
                 #3#)))) 

(SDEFUN |ALGFF;integralCoordinates;$R;12|
        ((|f| $) ($ |Record| (|:| |num| (|Vector| UP)) (|:| |den| UP)))
        (SPADCALL
         (SPADCALL (SPADCALL |f| (QREFELT $ 57)) (SPADCALL (QREFELT $ 44))
                   (QREFELT $ 58))
         (QREFELT $ 61))) 

(SDEFUN |ALGFF;knownInfBasis;NniV;13| ((|d| |NonNegativeInteger|) ($ |Void|))
        (SPROG
         ((#1=#:G167 NIL) (|j| NIL) (#2=#:G166 NIL) (|i| NIL)
          (|invib| #3=(|Matrix| (|Fraction| UP))) (|ib| #3#) (#4=#:G163 NIL)
          (#5=#:G165 NIL) (#6=#:G164 NIL) (|alpha| (|Vector| (|Fraction| UP)))
          (#7=#:G162 NIL) (#8=#:G161 NIL))
         (SEQ
          (COND
           ((SPADCALL (QREFELT $ 13) (QREFELT $ 35))
            (SEQ
             (LETT |alpha|
                   (PROGN
                    (LETT #8# (GETREFV (|inc_SI| #9=(QREFELT $ 27))))
                    (SEQ (LETT |i| 0) (LETT #7# #9#) G190
                         (COND ((|greater_SI| |i| #7#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SETELT #8# |i|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| $ 63) (* |d| |i|)
                                              (QREFELT $ 64))
                                    (QREFELT $ 65)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    #8#))
             (LETT |ib|
                   (SPADCALL
                    (PROGN
                     (LETT #6#
                           (GETREFV
                            (|inc_SI|
                             (- #10=(QVSIZE |alpha|)
                                #11=(SPADCALL |alpha| (QREFELT $ 66))))))
                     (SEQ (LETT |i| #11#) (LETT #5# #10#) (LETT #4# 0) G190
                          (COND ((> |i| #5#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #6# #4#
                                    (SPADCALL (QAREF1O |alpha| |i| 1)
                                              (QREFELT $ 67)))))
                          (LETT #4#
                                (PROG1 (|inc_SI| #4#) (LETT |i| (+ |i| 1))))
                          (GO G190) G191 (EXIT NIL))
                     #6#)
                    (QREFELT $ 68)))
             (LETT |invib| (SPADCALL |alpha| (QREFELT $ 68)))
             (EXIT
              (SEQ (LETT |i| (PROGN |ib| 1))
                   (LETT #2# (SPADCALL |ib| (QREFELT $ 53))) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN |ib| 1))
                          (LETT #1# (SPADCALL |ib| (QREFELT $ 69))) G190
                          (COND ((> |j| #1#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT $ 33) |i| |j|
                                     (QAREF2O |ib| |i| |j| 1 1) (QREFELT $ 70))
                           (EXIT
                            (SPADCALL (QREFELT $ 34) |i| |j|
                                      (SPADCALL |invib| |i| |j| (QREFELT $ 71))
                                      (QREFELT $ 70))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))))))
          (EXIT (SPADCALL (QREFELT $ 73)))))) 

(SDEFUN |ALGFF;getInfBasis| (($ |Void|))
        (SPROG
         ((#1=#:G190 NIL) (|j| NIL) (#2=#:G189 NIL) (|i| NIL)
          (|invib2| #3=(|Matrix| (|Fraction| UP))) (|ib2| #3#) (#4=#:G188 NIL)
          (#5=#:G187 NIL)
          (|invib|
           (|Record| (|:| |basis| (|Matrix| UP)) (|:| |basisDen| UP)
                     (|:| |basisInv| (|Matrix| UP))))
          (|invalpha| (|Vector| (|Fraction| UP))) (#6=#:G184 NIL)
          (#7=#:G186 NIL) (#8=#:G185 NIL) (|alpha| (|Vector| (|Fraction| UP)))
          (#9=#:G183 NIL) (#10=#:G182 NIL)
          (|ninvmod| (|SparseUnivariatePolynomial| UP))
          (|r| (|Record| (|:| |coef| (|Fraction| UP)) (|:| |poly| UPUP)))
          (|invmod| (UPUP)) (|x| (|Fraction| UP)))
         (SEQ
          (LETT |x|
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| $ 63) 1 (QREFELT $ 64))
                           (QREFELT $ 65))
                 (QREFELT $ 67)))
          (LETT |invmod|
                (SPADCALL (CONS #'|ALGFF;getInfBasis!0| (VECTOR $ |x|))
                          (QREFELT $ 9) (QREFELT $ 78)))
          (LETT |r| (SPADCALL |invmod| (QREFELT $ 81)))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 23)) (QREFELT $ 24)
                       (QREFELT $ 82))
             (|error| "Should not happen"))
            ('T
             (SEQ
              (LETT |ninvmod| (SPADCALL (ELT $ 46) (QCDR |r|) (QREFELT $ 86)))
              (LETT |alpha|
                    (PROGN
                     (LETT #10# (GETREFV (|inc_SI| #11=(QREFELT $ 27))))
                     (SEQ (LETT |i| 0) (LETT #9# #11#) G190
                          (COND ((|greater_SI| |i| #9#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #10# |i|
                                    (SPADCALL
                                     (SPADCALL (QCAR |r|) |i| (QREFELT $ 87))
                                     |x| (QREFELT $ 76)))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                     #10#))
              (LETT |invalpha|
                    (PROGN
                     (LETT #8#
                           (GETREFV
                            (|inc_SI|
                             (- #12=(QVSIZE |alpha|)
                                #13=(SPADCALL |alpha| (QREFELT $ 66))))))
                     (SEQ (LETT |i| #13#) (LETT #7# #12#) (LETT #6# 0) G190
                          (COND ((> |i| #7#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #8# #6#
                                    (SPADCALL (QAREF1O |alpha| |i| 1)
                                              (QREFELT $ 67)))))
                          (LETT #6#
                                (PROG1 (|inc_SI| #6#) (LETT |i| (+ |i| 1))))
                          (GO G190) G191 (EXIT NIL))
                     #8#))
              (LETT |invib|
                    (SPADCALL
                     (|compiledLookupCheck| '|integralBasis|
                                            (LIST
                                             (LIST '|Record|
                                                   (LIST '|:| '|basis|
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                (ELT $ 7))))
                                                   (LIST '|:| '|basisDen|
                                                         (|devaluate|
                                                          (ELT $ 7)))
                                                   (LIST '|:| '|basisInv|
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                (ELT $ 7))))))
                                            (|FunctionFieldIntegralBasis|
                                             (ELT $ 7)
                                             (|SparseUnivariatePolynomial|
                                              (ELT $ 7))
                                             (|SimpleAlgebraicExtension|
                                              (ELT $ 7)
                                              (|SparseUnivariatePolynomial|
                                               (ELT $ 7))
                                              |ninvmod|)))))
              (SEQ (LETT |i| (PROGN (QREFELT $ 30) 1))
                   (LETT #5# (SPADCALL (QREFELT $ 30) (QREFELT $ 53))) G190
                   (COND ((> |i| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN (QREFELT $ 30) 1))
                          (LETT #4# (SPADCALL (QREFELT $ 30) (QREFELT $ 69)))
                          G190 (COND ((> |j| #4#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT $ 33) |i| |j|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (QVELT |invib| 0) |i| |j|
                                                 (QREFELT $ 90))
                                       (QVELT |invib| 1) (QREFELT $ 91))
                                      |x| (QREFELT $ 76))
                                     (QREFELT $ 70))
                           (EXIT
                            (SPADCALL (QREFELT $ 34) |i| |j|
                                      (SPADCALL
                                       (SPADCALL (QVELT |invib| 2) |i| |j|
                                                 (QREFELT $ 90))
                                       |x| (QREFELT $ 92))
                                      (QREFELT $ 70))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (LETT |ib2|
                    (SPADCALL (QREFELT $ 33) (SPADCALL |alpha| (QREFELT $ 68))
                              (QREFELT $ 93)))
              (LETT |invib2|
                    (SPADCALL (SPADCALL |invalpha| (QREFELT $ 68))
                              (QREFELT $ 34) (QREFELT $ 93)))
              (SEQ (LETT |i| (PROGN |ib2| 1))
                   (LETT #2# (SPADCALL |ib2| (QREFELT $ 53))) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN (QREFELT $ 30) 1))
                          (LETT #1# (SPADCALL (QREFELT $ 30) (QREFELT $ 69)))
                          G190 (COND ((> |j| #1#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT $ 33) |i| |j|
                                     (QAREF2O |ib2| |i| |j| 1 1)
                                     (QREFELT $ 70))
                           (EXIT
                            (SPADCALL (QREFELT $ 34) |i| |j|
                                      (SPADCALL |invib2| |i| |j|
                                                (QREFELT $ 71))
                                      (QREFELT $ 70))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (QREFELT $ 73)))))))))) 

(SDEFUN |ALGFF;getInfBasis!0| ((|s| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |s| |x| (QREFELT $ 76)))))) 

(SDEFUN |ALGFF;startUp| ((|b| |Boolean|) ($ |Void|))
        (SPROG
         ((|dsc| (|Fraction| UP)) (|dsc0| (|Fraction| UP)) (#1=#:G209 NIL)
          (|j| NIL) (#2=#:G208 NIL) (|i| NIL)
          (|invib2| (|Matrix| (|Fraction| UP))) (#3=#:G198 NIL)
          (|ib2| (|Matrix| (|Fraction| UP))) (#4=#:G207 NIL) (#5=#:G206 NIL)
          (|ib|
           (|Record| (|:| |basis| (|Matrix| UP)) (|:| |basisDen| UP)
                     (|:| |basisInv| (|Matrix| UP))))
          (|nmod| (|SparseUnivariatePolynomial| UP)))
         (SEQ (SPADCALL (QREFELT $ 13) |b| (QREFELT $ 94))
              (LETT |nmod| (SPADCALL (ELT $ 46) (QREFELT $ 9) (QREFELT $ 86)))
              (LETT |ib|
                    (SPADCALL
                     (|compiledLookupCheck| '|integralBasis|
                                            (LIST
                                             (LIST '|Record|
                                                   (LIST '|:| '|basis|
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                (ELT $ 7))))
                                                   (LIST '|:| '|basisDen|
                                                         (|devaluate|
                                                          (ELT $ 7)))
                                                   (LIST '|:| '|basisInv|
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                (ELT $ 7))))))
                                            (|FunctionFieldIntegralBasis|
                                             (ELT $ 7)
                                             (|SparseUnivariatePolynomial|
                                              (ELT $ 7))
                                             (|SimpleAlgebraicExtension|
                                              (ELT $ 7)
                                              (|SparseUnivariatePolynomial|
                                               (ELT $ 7))
                                              |nmod|)))))
              (SEQ (LETT |i| (PROGN (QREFELT $ 30) 1))
                   (LETT #5# (SPADCALL (QREFELT $ 30) (QREFELT $ 53))) G190
                   (COND ((> |i| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN (QREFELT $ 30) 1))
                          (LETT #4# (SPADCALL (QREFELT $ 30) (QREFELT $ 69)))
                          G190 (COND ((> |j| #4#) (GO G191)))
                          (SEQ
                           (QSETAREF2O (QREFELT $ 30) |i| |j|
                                       (SPADCALL
                                        (SPADCALL (QVELT |ib| 0) |i| |j|
                                                  (QREFELT $ 90))
                                        (QVELT |ib| 1) (QREFELT $ 91))
                                       1 1)
                           (EXIT
                            (SPADCALL (QREFELT $ 32) |i| |j|
                                      (SPADCALL
                                       (SPADCALL (QVELT |ib| 2) |i| |j|
                                                 (QREFELT $ 90))
                                       (QREFELT $ 65))
                                      (QREFELT $ 70))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL
                 (SPADCALL (QREFELT $ 33) (PROGN (QREFELT $ 33) 1)
                           (PROGN (QREFELT $ 33) 1) (QREFELT $ 71))
                 (QREFELT $ 95))
                (|ALGFF;getInfBasis| $)))
              (LETT |ib2|
                    (SPADCALL
                     (SPADCALL (|ALGFF;vect| (QREFELT $ 30) $) (QREFELT $ 96))
                     (QREFELT $ 97)))
              (LETT |invib2|
                    (PROG2 (LETT #3# (SPADCALL |ib2| (QREFELT $ 99)))
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|Matrix| (|Fraction| (QREFELT $ 7)))
                                      (|Union|
                                       (|Matrix| (|Fraction| (QREFELT $ 7)))
                                       "failed")
                                      #3#)))
              (SEQ (LETT |i| (PROGN |ib2| 1))
                   (LETT #2# (SPADCALL |ib2| (QREFELT $ 53))) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN |ib2| 1))
                          (LETT #1# (SPADCALL |ib2| (QREFELT $ 69))) G190
                          (COND ((> |j| #1#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT $ 30) |i| |j|
                                     (QAREF2O |ib2| |i| |j| 1 1)
                                     (QREFELT $ 70))
                           (EXIT
                            (SPADCALL (QREFELT $ 32) |i| |j|
                                      (SPADCALL |invib2| |i| |j|
                                                (QREFELT $ 71))
                                      (QREFELT $ 70))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (LETT |dsc|
                    (SPADCALL (QREFELT $ 9)
                              (SPADCALL (QREFELT $ 9) (QREFELT $ 100))
                              (QREFELT $ 101)))
              (LETT |dsc0|
                    (SPADCALL |dsc|
                              (SPADCALL
                               (SPADCALL (QREFELT $ 33) (QREFELT $ 102)) 2
                               (QREFELT $ 87))
                              (QREFELT $ 103)))
              (EXIT
               (COND
                ((>
                  (SPADCALL (SPADCALL |dsc0| (QREFELT $ 104)) (QREFELT $ 105))
                  (SPADCALL (SPADCALL |dsc0| (QREFELT $ 106)) (QREFELT $ 105)))
                 (|error| "Shouldn't happen"))
                ('T
                 (SEQ
                  (SPADCALL (QREFELT $ 14)
                            (<
                             (SPADCALL (SPADCALL |dsc0| (QREFELT $ 104))
                                       (QREFELT $ 105))
                             (SPADCALL (SPADCALL |dsc0| (QREFELT $ 106))
                                       (QREFELT $ 105)))
                            (QREFELT $ 94))
                  (LETT |dsc|
                        (SPADCALL |dsc|
                                  (SPADCALL
                                   (SPADCALL (QREFELT $ 30) (QREFELT $ 102)) 2
                                   (QREFELT $ 87))
                                  (QREFELT $ 103)))
                  (SPADCALL (QREFELT $ 21)
                            (SPADCALL
                             (SPADCALL (SPADCALL |dsc| (QREFELT $ 104))
                                       (QREFELT $ 107))
                             (SPADCALL |dsc| (QREFELT $ 106)) (QREFELT $ 91))
                            (QREFELT $ 108))
                  (EXIT (SPADCALL (QREFELT $ 73)))))))))) 

(SDEFUN |ALGFF;integralDerivationMatrix;MR;16|
        ((|d| |Mapping| UP UP)
         ($ |Record| (|:| |num| (|Matrix| UP)) (|:| |den| UP)))
        (SPROG
         ((#1=#:G222 NIL) (#2=#:G224 NIL) (|i| NIL) (#3=#:G223 NIL)
          (|w| (|Vector| $)))
         (SEQ (LETT |w| (SPADCALL (QREFELT $ 41)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #3#
                         (GETREFV
                          (|inc_SI|
                           (- #4=(SPADCALL |w| (QREFELT $ 111))
                              #5=(SPADCALL |w| (QREFELT $ 110))))))
                   (SEQ (LETT |i| #5#) (LETT #2# #4#) (LETT #1# 0) G190
                        (COND ((> |i| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT #3# #1#
                                  (SPADCALL (SPADCALL |w| |i| (QREFELT $ 112))
                                            |d| (QREFELT $ 114)))))
                        (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1))))
                        (GO G190) G191 (EXIT NIL))
                   #3#)
                  (QREFELT $ 97))
                 (SPADCALL (QREFELT $ 44)) (QREFELT $ 93))
                (QREFELT $ 117)))))) 

(SDEFUN |ALGFF;integralRepresents;VUP$;17| ((|v| |Vector| UP) (|d| UP) ($ $))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |v| |d| (QREFELT $ 120)) (QREFELT $ 57))
                   (SPADCALL (QREFELT $ 43)) (QREFELT $ 58))
         (QREFELT $ 56))) 

(SDEFUN |ALGFF;branchPoint?;UPB;18| ((|p| UP) ($ |Boolean|))
        (SPROG ((|r| (|Union| F "failed")))
               (SEQ
                (COND
                 ((SPADCALL (QREFELT $ 13) (QREFELT $ 35))
                  (|ALGFF;startUp| NIL $)))
                (LETT |r| (SPADCALL |p| (QREFELT $ 123)))
                (EXIT
                 (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 49)))
                       ('T
                        (NULL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL (QREFELT $ 39)) (QREFELT $ 46))
                           |p| (QREFELT $ 124))
                          (QREFELT $ 125))))))))) 

(DECLAIM (NOTINLINE |AlgebraicFunctionField;|)) 

(DEFUN |AlgebraicFunctionField| (&REST #1=#:G278)
  (SPROG NIL
         (PROG (#2=#:G279)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AlgebraicFunctionField|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AlgebraicFunctionField;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AlgebraicFunctionField|)))))))))) 

(DEFUN |AlgebraicFunctionField;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((#1=#:G118 NIL) (|pv$| NIL) (#2=#:G276 NIL) (#3=#:G277 NIL) ($ NIL)
    (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|AlgebraicFunctionField| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 170))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|FiniteFieldCategory|))
                                        (LETT #3#
                                              (|HasCategory| (|Fraction| |#2|)
                                                             '(|Field|)))
                                        (OR #3#
                                            (|HasCategory| (|Fraction| |#2|)
                                                           '(|FiniteFieldCategory|)))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|Finite|))
                                        (OR
                                         (AND
                                          (|HasCategory| (|Fraction| |#2|)
                                                         '(|DifferentialRing|))
                                          #3#)
                                         (|HasCategory| (|Fraction| |#2|)
                                                        '(|FiniteFieldCategory|)))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| (|Fraction| |#2|)
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|)))
                                               (|HasCategory| (|Fraction| |#2|)
                                                              '(|Field|))))
                                        (OR #2#
                                            (AND
                                             (|HasCategory| (|Fraction| |#2|)
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (|HasCategory| (|Fraction| |#2|)
                                                            '(|FiniteFieldCategory|))))
                                        (OR
                                         (|HasCategory| (|Fraction| |#2|)
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3#)
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|Finite|))))))
    (|haddProp| |$ConstructorCache| '|AlgebraicFunctionField|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (AND (|HasCategory| $ '(|CharacteristicNonZero|))
         (|HasCategory| (|Fraction| |#2|) '(|FiniteFieldCategory|))
         (|augmentPredVector| $ 32768))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 13 (SPADCALL 'T (QREFELT $ 12)))
    (QSETREFV $ 14 (SPADCALL 'T (QREFELT $ 12)))
    (QSETREFV $ 21 (SPADCALL (|spadConstant| $ 18) (QREFELT $ 20)))
    (QSETREFV $ 24 (SPADCALL |#4| (QREFELT $ 23)))
    (QSETREFV $ 27
              (PROG1 (LETT #1# (- (QREFELT $ 24) 1))
                (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                  '(|Integer|) #1#)))
    (QSETREFV $ 30 (SPADCALL (QREFELT $ 24) (QREFELT $ 24) (QREFELT $ 29)))
    (QSETREFV $ 32 (SPADCALL (QREFELT $ 30) (QREFELT $ 31)))
    (QSETREFV $ 33 (SPADCALL (QREFELT $ 30) (QREFELT $ 31)))
    (QSETREFV $ 34 (SPADCALL (QREFELT $ 30) (QREFELT $ 31)))
    $))) 

(MAKEPROP '|AlgebraicFunctionField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SimpleAlgebraicExtension| 17 8 (NRTEVAL (QREFELT $ 9)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (|Boolean|) (|Reference| 10) (0 . |ref|) '|brandNew?| '|infBr?|
              (5 . |Zero|) (9 . |Zero|) (|Fraction| 7) (13 . |Zero|)
              (|Reference| 17) (17 . |ref|) '|discPoly| (|NonNegativeInteger|)
              (22 . |degree|) '|n| (27 . |One|) (31 . |One|) '|n1|
              (|Matrix| 17) (35 . |zero|) '|ibasis| (41 . |copy|) '|invibasis|
              '|infbasis| '|invinfbasis| (46 . |deref|) (51 . |elt|)
              |ALGFF;branchPointAtInfinity?;B;1| (56 . |elt|)
              |ALGFF;discriminant;F;2| (|Vector| $) |ALGFF;integralBasis;V;3|
              |ALGFF;integralBasisAtInfinity;V;4| |ALGFF;integralMatrix;M;5|
              |ALGFF;inverseIntegralMatrix;M;6|
              |ALGFF;integralMatrixAtInfinity;M;7| (61 . |retract|)
              (66 . |elt|) (72 . |zero?|) |ALGFF;branchPoint?;FB;8|
              |ALGFF;definingPolynomial;UPUP;9|
              |ALGFF;inverseIntegralMatrixAtInfinity;M;10| (|Integer|)
              (77 . |maxRowIndex|) (|Vector| 17) (82 . |row|)
              (88 . |represents|) (93 . |coordinates|) (98 . *)
              (|Record| (|:| |num| 119) (|:| |den| 7))
              (|InnerCommonDenominator| 7 17 119 54) (104 . |splitDenominator|)
              |ALGFF;integralCoordinates;$R;12| (109 . |One|)
              (113 . |monomial|) (119 . |coerce|) (124 . |minIndex|)
              (129 . |inv|) (134 . |diagonalMatrix|) (139 . |maxColIndex|)
              (144 . |setelt!|) (152 . |elt|) (|Void|) (159 . |void|)
              |ALGFF;knownInfBasis;NniV;13| (|Fraction| $) (163 . |elt|)
              (|Mapping| 17 17) (169 . |map|)
              (|Record| (|:| |coef| 17) (|:| |poly| 8))
              (|ChangeOfVariable| 6 7 8) (175 . |mkIntegral|) (180 . ~=)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 17)
              (|UnivariatePolynomialCategoryFunctions2| 17 8 7 83)
              (186 . |map|) (192 . ^) (198 . |basis|) (|Matrix| 7)
              (202 . |elt|) (209 . /) (215 . |elt|) (221 . *) (227 . |setelt!|)
              (233 . |zero?|) (238 . |normalizeAtInfinity|)
              (243 . |coordinates|) (|Union| $ '"failed") (248 . |inverse|)
              (253 . |differentiate|) (258 . |resultant|) (264 . |determinant|)
              (269 . *) (275 . |numer|) (280 . |degree|) (285 . |denom|)
              (290 . |primitivePart|) (295 . |setelt!|) (|Vector| $$)
              (301 . |minIndex|) (306 . |maxIndex|) (311 . |elt|)
              (|Mapping| 7 7) (317 . |differentiate|)
              (|Record| (|:| |num| 89) (|:| |den| 7))
              (|MatrixCommonDenominator| 7 17) (323 . |splitDenominator|)
              |ALGFF;integralDerivationMatrix;MR;16| (|Vector| 7)
              (328 . |represents|) |ALGFF;integralRepresents;VUP$;17|
              (|Union| 6 '#1="failed") (334 . |retractIfCan|) (339 . |gcd|)
              (345 . |ground?|) |ALGFF;branchPoint?;UPB;18| (|List| 129)
              (|List| 22) (|Symbol|) (|Union| 40 '#2="failed") (|Matrix| $)
              (|Fraction| 52)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |coef| 135) (|:| |generator| $))
              (|Union| 135 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 140 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $) (|Fraction| 8) (|PositiveInteger|) (|InputForm|)
              (|Union| 22 '"failed") (|OnePointCompletion| 145)
              (|Union| 150 '#2#) (|List| 136) (|Factored| 136)
              (|Record| (|:| |factor| 52) (|:| |exponent| 22)) (|List| 152)
              (|Table| 145 22)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Matrix| 52)
              (|Record| (|:| |mat| 156) (|:| |vec| (|Vector| 52)))
              (|Union| 132 '#1#) (|Union| 52 '#1#) (|List| (|Polynomial| 6))
              (|List| (|List| 6))
              (|Record| (|:| |num| $) (|:| |den| 7) (|:| |derivden| 7)
                        (|:| |gd| 7))
              (|Union| 7 '"failed") (|Record| (|:| |mat| 28) (|:| |vec| 54))
              (|Union| 17 '#1#) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(~= 350 |zero?| 356 |yCoordinates| 361 |unitNormal| 366
              |unitCanonical| 371 |unit?| 376 |traceMatrix| 381 |trace| 390
              |tableForDiscreteLogarithm| 395 |subtractIfCan| 400
              |squareFreePolynomial| 406 |squareFreePart| 411 |squareFree| 416
              |solveLinearPolynomialEquation| 421 |smaller?| 427 |sizeLess?|
              433 |size| 439 |singularAtInfinity?| 443 |singular?| 447 |sample|
              457 |rightRecip| 461 |rightPower| 466 |retractIfCan| 478
              |retract| 493 |represents| 508 |representationType| 525 |rem| 529
              |regularRepresentation| 535 |reducedSystem| 546
              |reduceBasisAtInfinity| 568 |reduce| 573 |recip| 583
              |rationalPoints| 588 |rationalPoint?| 592 |rank| 598 |random| 602
              |ramifiedAtInfinity?| 606 |ramified?| 610 |quo| 620
              |principalIdeal| 626 |primitivePart| 631 |primitiveElement| 636
              |primitive?| 640 |primeFrobenius| 645 |prime?| 656 |order| 661
              |opposite?| 671 |one?| 677 |numberOfComponents| 682
              |normalizeAtInfinity| 686 |norm| 691 |nonSingularModel| 696
              |nextItem| 701 |multiEuclidean| 706 |minimalPolynomial| 712
              |lookup| 717 |lift| 722 |leftRecip| 727 |leftPower| 732 |lcmCoef|
              744 |lcm| 750 |latex| 761 |knownInfBasis| 766
              |inverseIntegralMatrixAtInfinity| 771 |inverseIntegralMatrix| 775
              |inv| 779 |integralRepresents| 784 |integralMatrixAtInfinity| 790
              |integralMatrix| 794 |integralDerivationMatrix| 798
              |integralCoordinates| 803 |integralBasisAtInfinity| 808
              |integralBasis| 812 |integralAtInfinity?| 816 |integral?| 821
              |init| 838 |index| 842 |hyperelliptic| 847 |hashUpdate!| 851
              |hash| 857 |genus| 862 |generator| 866 |gcdPolynomial| 870 |gcd|
              876 |factorsOfCyclicGroupSize| 887 |factorSquareFreePolynomial|
              891 |factorPolynomial| 896 |factor| 901 |extendedEuclidean| 906
              |exquo| 919 |expressIdealMember| 925 |euclideanSize| 931
              |enumerate| 936 |elt| 940 |elliptic| 947 |divide| 951
              |discriminant| 957 |discreteLog| 966 |differentiate| 977
              |derivationCoordinates| 1033 |definingPolynomial| 1039
              |createPrimitiveElement| 1043 |coordinates| 1047 |convert| 1069
              |conditionP| 1094 |complementaryBasis| 1099 |commutator| 1104
              |coerce| 1110 |charthRoot| 1135 |characteristicPolynomial| 1145
              |characteristic| 1150 |branchPointAtInfinity?| 1154
              |branchPoint?| 1158 |basis| 1168 |associator| 1172 |associates?|
              1179 |antiCommutator| 1185 |annihilate?| 1191 |algSplitSimple|
              1197 |absolutelyIrreducible?| 1203 ^ 1207 |Zero| 1225 |One| 1229
              D 1233 = 1283 / 1289 - 1295 + 1306 * 1312)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 2 2 4 4 2 4 4 4 0 4 0 0 0 3 3 3 0 0 0 1 3
                                  3 5 7 12 10 0 0 0 0 0 0 3 0 0 0 0 3 0 0 0 0 0
                                  3 3 0 0 0 0 0 0 0 0 6 0 0 6 2 0 0 0 0 0 0 0 0
                                  0 3 3 3 6 8 9))
            (CONS
             '#(|FunctionFieldCategory&| |MonogenicAlgebra&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| |FramedAlgebra&| NIL
                |FiniteRankAlgebra&| |FullyLinearlyExplicitOver&| NIL NIL
                |DivisionRing&| |DifferentialExtension&| |Algebra&| NIL
                |Algebra&| NIL |EntireRing&| |Algebra&| NIL |DifferentialRing&|
                |PartialDifferentialRing&| NIL NIL |Rng&| NIL |Module&|
                |Module&| NIL |Module&| NIL |FramedModule&| NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| |Finite&| |Magma&|
                |AbelianSemiGroup&| NIL NIL |FullyRetractableTo&| NIL
                |SetCategory&| |RetractableTo&| NIL NIL NIL |BasicType&| NIL
                NIL NIL NIL NIL |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|FunctionFieldCategory| 6 7 8)
                 (|MonogenicAlgebra| (|Fraction| 7) 8) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|FramedAlgebra| (|Fraction| 7) 8) (|IntegralDomain|)
                 (|FiniteRankAlgebra| (|Fraction| 7) 8)
                 (|FullyLinearlyExplicitOver| (|Fraction| 7))
                 (|CommutativeRing|) (|LeftOreRing|) (|DivisionRing|)
                 (|DifferentialExtension| (|Fraction| 7))
                 (|Algebra| (|Fraction| 7))
                 (|LinearlyExplicitOver| (|Fraction| 7)) (|Algebra| $$)
                 (|CharacteristicZero|) (|EntireRing|) (|Algebra| 132)
                 (|CharacteristicNonZero|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 129) (|LinearlyExplicitOver| 52)
                 (|Ring|) (|Rng|) (|SemiRing|) (|Module| $$)
                 (|Module| (|Fraction| 7)) (|SemiRng|) (|Module| 132)
                 (|BiModule| $$ $$) (|FramedModule| (|Fraction| 7))
                 (|BiModule| (|Fraction| 7) (|Fraction| 7))
                 (|NonAssociativeRing|) (|BiModule| 132 132) (|LeftModule| $$)
                 (|RightModule| (|Fraction| 7)) (|LeftModule| (|Fraction| 7))
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| 132)
                 (|RightModule| 132) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Finite|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|StepThrough|)
                 (|FullyRetractableTo| (|Fraction| 7)) (|CommutativeStar|)
                 (|SetCategory|) (|RetractableTo| (|Fraction| 7))
                 (|ConvertibleTo| 8) (|TwoSidedRecip|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 169) (|noZeroDivisors|)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|ConvertibleTo| 146) (|RetractableTo| 132)
                 (|RetractableTo| 52))
              (|makeByteWordVec2| 169
                                  '(1 11 0 10 12 0 8 0 15 0 0 0 16 0 17 0 18 1
                                    19 0 17 20 1 8 22 0 23 0 8 0 25 0 0 0 26 2
                                    28 0 22 22 29 1 28 0 0 31 1 11 10 0 35 1 11
                                    10 0 36 1 19 17 0 38 1 17 7 0 46 2 7 6 0 6
                                    47 1 6 10 0 48 1 28 52 0 53 2 28 54 0 52 55
                                    1 0 0 54 56 1 0 54 0 57 2 28 54 54 0 58 1
                                    60 59 54 61 0 6 0 63 2 7 0 6 22 64 1 17 0 7
                                    65 1 54 52 0 66 1 17 0 0 67 1 28 0 54 68 1
                                    28 52 0 69 4 28 17 0 52 52 17 70 3 28 17 0
                                    52 52 71 0 72 0 73 2 7 75 75 75 76 2 8 0 77
                                    0 78 1 80 79 8 81 2 22 10 0 0 82 2 85 83 84
                                    8 86 2 17 0 0 52 87 0 0 40 88 3 89 7 0 52
                                    52 90 2 17 0 7 7 91 2 7 75 0 75 92 2 28 0 0
                                    0 93 2 11 10 0 10 94 1 17 10 0 95 1 0 40 40
                                    96 1 0 28 40 97 1 28 98 0 99 1 8 0 0 100 2
                                    8 17 0 0 101 1 28 17 0 102 2 17 0 0 0 103 1
                                    17 7 0 104 1 7 22 0 105 1 17 7 0 106 1 7 0
                                    0 107 2 19 17 0 17 108 1 109 52 0 110 1 109
                                    52 0 111 2 109 2 0 52 112 2 0 0 0 113 114 1
                                    116 115 28 117 2 0 0 119 7 120 1 7 122 0
                                    123 2 7 0 0 0 124 1 7 10 0 125 2 0 10 0 0 1
                                    1 0 10 0 1 1 0 59 0 1 1 3 133 0 1 1 3 0 0 1
                                    1 3 10 0 1 0 0 28 1 1 0 28 40 1 1 0 17 0 1
                                    1 2 154 52 1 2 0 98 0 0 1 1 2 151 136 1 1 3
                                    0 0 1 1 3 143 0 1 2 2 149 150 136 1 2 6 10
                                    0 0 1 2 3 10 0 0 1 0 6 22 1 0 0 10 1 1 0 10
                                    7 1 1 0 10 6 1 0 0 0 1 1 0 98 0 1 2 0 0 0
                                    22 1 2 0 0 0 145 1 1 8 158 0 1 1 9 159 0 1
                                    1 0 165 0 1 1 8 132 0 1 1 9 52 0 1 1 0 17 0
                                    1 2 0 0 119 7 120 1 0 0 54 56 2 0 0 54 40 1
                                    0 2 155 1 2 3 0 0 0 1 1 0 28 0 1 2 0 28 0
                                    40 1 1 10 156 131 1 2 10 157 131 40 1 1 0
                                    28 131 1 2 0 164 131 40 1 1 0 40 40 1 1 3
                                    98 144 1 1 0 0 8 1 1 0 98 0 1 0 15 161 1 2
                                    0 10 6 6 1 0 0 145 1 0 6 0 1 0 0 10 1 1 0
                                    10 7 1 1 0 10 6 1 2 3 0 0 0 1 1 3 137 135 1
                                    1 0 0 0 1 0 2 0 1 1 2 10 0 1 1 2 0 0 1 2 2
                                    0 0 22 1 1 3 10 0 1 1 2 148 0 1 1 2 145 0 1
                                    2 0 10 0 0 1 1 0 10 0 1 0 0 22 1 1 0 40 40
                                    96 1 0 17 0 1 1 14 160 129 1 1 2 98 0 1 2 3
                                    138 135 0 1 1 3 8 0 1 1 6 145 0 1 1 0 8 0 1
                                    1 0 98 0 1 2 0 0 0 22 1 2 0 0 0 145 1 2 3
                                    134 0 0 1 2 3 0 0 0 1 1 3 0 135 1 1 0 166 0
                                    1 1 0 72 22 74 0 0 28 51 0 0 28 44 1 3 0 0
                                    1 2 0 0 119 7 121 0 0 28 45 0 0 28 43 1 0
                                    115 113 118 1 0 59 0 62 0 0 40 42 0 0 40 41
                                    1 0 10 0 1 2 0 10 0 6 1 2 0 10 0 7 1 1 0 10
                                    0 1 0 2 0 1 1 6 0 145 1 0 0 163 1 2 0 168
                                    168 0 1 1 0 167 0 1 0 0 22 1 0 0 0 1 2 3
                                    136 136 136 1 1 3 0 135 1 2 3 0 0 0 1 0 2
                                    153 1 1 2 151 136 1 1 2 151 136 1 1 3 143 0
                                    1 3 3 141 0 0 0 1 2 3 142 0 0 1 2 3 98 0 0
                                    1 2 3 138 135 0 1 1 3 22 0 1 0 6 135 1 3 0
                                    6 0 6 6 1 0 0 163 1 2 3 139 0 0 1 0 0 17 39
                                    1 0 17 40 1 2 2 147 0 0 1 1 2 22 0 1 3 11 0
                                    0 129 22 1 3 11 0 0 127 128 1 2 11 0 0 127
                                    1 2 11 0 0 129 1 2 7 0 0 22 1 1 7 0 0 1 2 3
                                    0 0 77 1 3 3 0 0 77 22 1 2 0 0 0 113 114 2
                                    3 28 40 77 1 0 0 8 50 0 2 0 1 1 0 54 0 57 1
                                    0 28 40 97 2 0 54 0 40 1 2 0 28 40 40 1 1 6
                                    146 0 1 1 0 0 8 1 1 0 8 0 1 1 0 54 0 1 1 0
                                    0 54 1 1 16 130 131 1 1 0 40 40 1 2 0 0 0 0
                                    1 1 13 0 132 1 1 0 0 0 1 1 0 0 17 1 1 0 0
                                    52 1 1 0 169 0 1 1 5 98 0 1 1 2 0 0 1 1 0 8
                                    0 1 0 0 22 1 0 0 10 37 1 0 10 7 126 1 0 10
                                    6 49 0 0 40 88 3 0 0 0 0 0 1 2 3 10 0 0 1 2
                                    0 0 0 0 1 2 0 10 0 0 1 2 0 162 0 113 1 0 0
                                    10 1 2 3 0 0 52 1 2 0 0 0 22 1 2 0 0 0 145
                                    1 0 0 0 16 0 0 0 26 3 11 0 0 127 128 1 2 11
                                    0 0 127 1 3 11 0 0 129 22 1 2 11 0 0 129 1
                                    2 7 0 0 22 1 1 7 0 0 1 3 3 0 0 77 22 1 2 3
                                    0 0 77 1 2 0 10 0 0 1 2 3 0 0 0 1 1 0 0 0 1
                                    2 0 0 0 0 1 2 0 0 0 0 1 2 3 0 132 0 1 2 3 0
                                    0 132 1 2 0 0 17 0 1 2 0 0 0 17 1 2 0 0 22
                                    0 1 2 0 0 52 0 1 2 0 0 0 0 1 2 0 0 145 0
                                    1)))))
           '|lookupComplete|)) 
