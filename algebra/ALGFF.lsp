
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
                 (LETT #3# (GETREFV #4=(SPADCALL |m| (QREFELT $ 53)))
                       . #5=(|ALGFF;vect|))
                 (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#)
                      (LETT #1# 0 . #5#) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL (SPADCALL |m| |i| (QREFELT $ 55))
                                          (QREFELT $ 56)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#)
                              (LETT |i| (|inc_SI| |i|) . #5#))
                            . #5#)
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
                    (LETT #8# (GETREFV (|inc_SI| #9=(QREFELT $ 27)))
                          . #10=(|ALGFF;knownInfBasis;NniV;13|))
                    (SEQ (LETT |i| 0 . #10#) (LETT #7# #9# . #10#) G190
                         (COND ((|greater_SI| |i| #7#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SETELT #8# |i|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| $ 63) (* |d| |i|)
                                              (QREFELT $ 64))
                                    (QREFELT $ 65)))))
                         (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                         (EXIT NIL))
                    #8#)
                   . #10#)
             (LETT |ib|
                   (SPADCALL
                    (PROGN
                     (LETT #6#
                           (GETREFV
                            (|inc_SI|
                             (- #11=(QVSIZE |alpha|)
                                #12=(SPADCALL |alpha| (QREFELT $ 66)))))
                           . #10#)
                     (SEQ (LETT |i| #12# . #10#) (LETT #5# #11# . #10#)
                          (LETT #4# 0 . #10#) G190
                          (COND ((> |i| #5#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #6# #4#
                                    (SPADCALL (QAREF1O |alpha| |i| 1)
                                              (QREFELT $ 67)))))
                          (LETT #4#
                                (PROG1 (|inc_SI| #4#)
                                  (LETT |i| (+ |i| 1) . #10#))
                                . #10#)
                          (GO G190) G191 (EXIT NIL))
                     #6#)
                    (QREFELT $ 68))
                   . #10#)
             (LETT |invib| (SPADCALL |alpha| (QREFELT $ 68)) . #10#)
             (EXIT
              (SEQ (LETT |i| 1 . #10#)
                   (LETT #2# (SPADCALL |ib| (QREFELT $ 53)) . #10#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #10#)
                          (LETT #1# (SPADCALL |ib| (QREFELT $ 69)) . #10#) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT $ 33) |i| |j|
                                     (QAREF2O |ib| |i| |j| 1 1) (QREFELT $ 70))
                           (EXIT
                            (SPADCALL (QREFELT $ 34) |i| |j|
                                      (SPADCALL |invib| |i| |j| (QREFELT $ 71))
                                      (QREFELT $ 70))))
                          (LETT |j| (|inc_SI| |j|) . #10#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                   (EXIT NIL))))))
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
                 (QREFELT $ 67))
                . #11=(|ALGFF;getInfBasis|))
          (LETT |invmod|
                (SPADCALL (CONS #'|ALGFF;getInfBasis!0| (VECTOR $ |x|))
                          (QREFELT $ 9) (QREFELT $ 78))
                . #11#)
          (LETT |r| (SPADCALL |invmod| (QREFELT $ 81)) . #11#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 23)) (QREFELT $ 24)
                       (QREFELT $ 82))
             (|error| "Should not happen"))
            ('T
             (SEQ
              (LETT |ninvmod| (SPADCALL (ELT $ 46) (QCDR |r|) (QREFELT $ 86))
                    . #11#)
              (LETT |alpha|
                    (PROGN
                     (LETT #10# (GETREFV (|inc_SI| #12=(QREFELT $ 27))) . #11#)
                     (SEQ (LETT |i| 0 . #11#) (LETT #9# #12# . #11#) G190
                          (COND ((|greater_SI| |i| #9#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #10# |i|
                                    (SPADCALL
                                     (SPADCALL (QCAR |r|) |i| (QREFELT $ 87))
                                     |x| (QREFELT $ 76)))))
                          (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                          (EXIT NIL))
                     #10#)
                    . #11#)
              (LETT |invalpha|
                    (PROGN
                     (LETT #8#
                           (GETREFV
                            (|inc_SI|
                             (- #13=(QVSIZE |alpha|)
                                #14=(SPADCALL |alpha| (QREFELT $ 66)))))
                           . #11#)
                     (SEQ (LETT |i| #14# . #11#) (LETT #7# #13# . #11#)
                          (LETT #6# 0 . #11#) G190
                          (COND ((> |i| #7#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #8# #6#
                                    (SPADCALL (QAREF1O |alpha| |i| 1)
                                              (QREFELT $ 67)))))
                          (LETT #6#
                                (PROG1 (|inc_SI| #6#)
                                  (LETT |i| (+ |i| 1) . #11#))
                                . #11#)
                          (GO G190) G191 (EXIT NIL))
                     #8#)
                    . #11#)
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
                                              |ninvmod|))))
                    . #11#)
              (SEQ (LETT |i| 1 . #11#)
                   (LETT #5# (SPADCALL (QREFELT $ 30) (QREFELT $ 53)) . #11#)
                   G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #11#)
                          (LETT #4# (SPADCALL (QREFELT $ 30) (QREFELT $ 69))
                                . #11#)
                          G190 (COND ((|greater_SI| |j| #4#) (GO G191)))
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
                          (LETT |j| (|inc_SI| |j|) . #11#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191 (EXIT NIL))
              (LETT |ib2|
                    (SPADCALL (QREFELT $ 33) (SPADCALL |alpha| (QREFELT $ 68))
                              (QREFELT $ 93))
                    . #11#)
              (LETT |invib2|
                    (SPADCALL (SPADCALL |invalpha| (QREFELT $ 68))
                              (QREFELT $ 34) (QREFELT $ 93))
                    . #11#)
              (SEQ (LETT |i| 1 . #11#)
                   (LETT #2# (SPADCALL |ib2| (QREFELT $ 53)) . #11#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #11#)
                          (LETT #1# (SPADCALL (QREFELT $ 30) (QREFELT $ 69))
                                . #11#)
                          G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT $ 33) |i| |j|
                                     (QAREF2O |ib2| |i| |j| 1 1)
                                     (QREFELT $ 70))
                           (EXIT
                            (SPADCALL (QREFELT $ 34) |i| |j|
                                      (SPADCALL |invib2| |i| |j|
                                                (QREFELT $ 71))
                                      (QREFELT $ 70))))
                          (LETT |j| (|inc_SI| |j|) . #11#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (QREFELT $ 73)))))))))) 

(SDEFUN |ALGFF;getInfBasis!0| ((|s| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|ALGFF;getInfBasis|))
          (LETT $ (QREFELT $$ 0) . #1#)
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
              (LETT |nmod| (SPADCALL (ELT $ 46) (QREFELT $ 9) (QREFELT $ 86))
                    . #6=(|ALGFF;startUp|))
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
                                              |nmod|))))
                    . #6#)
              (SEQ (LETT |i| 1 . #6#)
                   (LETT #5# (SPADCALL (QREFELT $ 30) (QREFELT $ 53)) . #6#)
                   G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #6#)
                          (LETT #4# (SPADCALL (QREFELT $ 30) (QREFELT $ 69))
                                . #6#)
                          G190 (COND ((|greater_SI| |j| #4#) (GO G191)))
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
                          (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL (SPADCALL (QREFELT $ 33) 1 1 (QREFELT $ 71))
                          (QREFELT $ 95))
                (|ALGFF;getInfBasis| $)))
              (LETT |ib2|
                    (SPADCALL
                     (SPADCALL (|ALGFF;vect| (QREFELT $ 30) $) (QREFELT $ 96))
                     (QREFELT $ 97))
                    . #6#)
              (LETT |invib2|
                    (PROG2 (LETT #3# (SPADCALL |ib2| (QREFELT $ 99)) . #6#)
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|Matrix| (|Fraction| (QREFELT $ 7)))
                                      (|Union|
                                       (|Matrix| (|Fraction| (QREFELT $ 7)))
                                       "failed")
                                      #3#))
                    . #6#)
              (SEQ (LETT |i| 1 . #6#)
                   (LETT #2# (SPADCALL |ib2| (QREFELT $ 53)) . #6#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #6#)
                          (LETT #1# (SPADCALL |ib2| (QREFELT $ 69)) . #6#) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT $ 30) |i| |j|
                                     (QAREF2O |ib2| |i| |j| 1 1)
                                     (QREFELT $ 70))
                           (EXIT
                            (SPADCALL (QREFELT $ 32) |i| |j|
                                      (SPADCALL |invib2| |i| |j|
                                                (QREFELT $ 71))
                                      (QREFELT $ 70))))
                          (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (LETT |dsc|
                    (SPADCALL (QREFELT $ 9)
                              (SPADCALL (QREFELT $ 9) (QREFELT $ 100))
                              (QREFELT $ 101))
                    . #6#)
              (LETT |dsc0|
                    (SPADCALL |dsc|
                              (SPADCALL
                               (SPADCALL (QREFELT $ 33) (QREFELT $ 102)) 2
                               (QREFELT $ 87))
                              (QREFELT $ 103))
                    . #6#)
              (EXIT
               (COND
                ((SPADCALL
                  (SPADCALL (SPADCALL |dsc0| (QREFELT $ 104)) (QREFELT $ 105))
                  (SPADCALL (SPADCALL |dsc0| (QREFELT $ 106)) (QREFELT $ 105))
                  (QREFELT $ 107))
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
                                  (QREFELT $ 103))
                        . #6#)
                  (SPADCALL (QREFELT $ 21)
                            (SPADCALL
                             (SPADCALL (SPADCALL |dsc| (QREFELT $ 104))
                                       (QREFELT $ 108))
                             (SPADCALL |dsc| (QREFELT $ 106)) (QREFELT $ 91))
                            (QREFELT $ 109))
                  (EXIT (SPADCALL (QREFELT $ 73)))))))))) 

(SDEFUN |ALGFF;integralDerivationMatrix;MR;16|
        ((|d| |Mapping| UP UP)
         ($ |Record| (|:| |num| (|Matrix| UP)) (|:| |den| UP)))
        (SPROG
         ((#1=#:G222 NIL) (#2=#:G224 NIL) (|i| NIL) (#3=#:G223 NIL)
          (|w| (|Vector| $)))
         (SEQ
          (LETT |w| (SPADCALL (QREFELT $ 41))
                . #4=(|ALGFF;integralDerivationMatrix;MR;16|))
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (PROGN
               (LETT #3#
                     (GETREFV
                      (|inc_SI|
                       (- #5=(SPADCALL |w| (QREFELT $ 112))
                          #6=(SPADCALL |w| (QREFELT $ 111)))))
                     . #4#)
               (SEQ (LETT |i| #6# . #4#) (LETT #2# #5# . #4#)
                    (LETT #1# 0 . #4#) G190 (COND ((> |i| #2#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SETELT #3# #1#
                              (SPADCALL (SPADCALL |w| |i| (QREFELT $ 113)) |d|
                                        (QREFELT $ 115)))))
                    (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #4#))
                          . #4#)
                    (GO G190) G191 (EXIT NIL))
               #3#)
              (QREFELT $ 97))
             (SPADCALL (QREFELT $ 44)) (QREFELT $ 93))
            (QREFELT $ 118)))))) 

(SDEFUN |ALGFF;integralRepresents;VUP$;17| ((|v| |Vector| UP) (|d| UP) ($ $))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |v| |d| (QREFELT $ 121)) (QREFELT $ 57))
                   (SPADCALL (QREFELT $ 43)) (QREFELT $ 58))
         (QREFELT $ 56))) 

(SDEFUN |ALGFF;branchPoint?;UPB;18| ((|p| UP) ($ |Boolean|))
        (SPROG ((|r| (|Union| F "failed")))
               (SEQ
                (COND
                 ((SPADCALL (QREFELT $ 13) (QREFELT $ 35))
                  (|ALGFF;startUp| NIL $)))
                (LETT |r| (SPADCALL |p| (QREFELT $ 124))
                      |ALGFF;branchPoint?;UPB;18|)
                (EXIT
                 (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 49)))
                       ('T
                        (NULL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL (QREFELT $ 39)) (QREFELT $ 46))
                           |p| (QREFELT $ 125))
                          (QREFELT $ 126))))))))) 

(DECLAIM (NOTINLINE |AlgebraicFunctionField;|)) 

(DEFUN |AlgebraicFunctionField| (&REST #1=#:G275)
  (SPROG NIL
         (PROG (#2=#:G276)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AlgebraicFunctionField|)
                                               '|domainEqualList|)
                    . #3=(|AlgebraicFunctionField|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AlgebraicFunctionField;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AlgebraicFunctionField|)))))))))) 

(DEFUN |AlgebraicFunctionField;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((#1=#:G118 NIL) (|pv$| NIL) (#2=#:G273 NIL) (#3=#:G274 NIL) ($ NIL)
    (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #4=(|AlgebraicFunctionField|))
    (LETT DV$2 (|devaluate| |#2|) . #4#)
    (LETT DV$3 (|devaluate| |#3|) . #4#)
    (LETT DV$4 (|devaluate| |#4|) . #4#)
    (LETT |dv$| (LIST '|AlgebraicFunctionField| DV$1 DV$2 DV$3 DV$4) . #4#)
    (LETT $ (GETREFV 168) . #4#)
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
                                                             '(|Field|))
                                              . #4#)
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
                                                              '(|Field|)))
                                              . #4#)
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
                                        (|HasCategory| |#1| '(|Finite|))))
                    . #4#))
    (|haddProp| |$ConstructorCache| '|AlgebraicFunctionField|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 13 (SPADCALL 'T (QREFELT $ 12)))
    (QSETREFV $ 14 (SPADCALL 'T (QREFELT $ 12)))
    (QSETREFV $ 21 (SPADCALL (|spadConstant| $ 18) (QREFELT $ 20)))
    (QSETREFV $ 24 (SPADCALL |#4| (QREFELT $ 23)))
    (QSETREFV $ 27
              (PROG1 (LETT #1# (- (QREFELT $ 24) 1) . #4#)
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
              (|Record| (|:| |num| 120) (|:| |den| 7))
              (|InnerCommonDenominator| 7 17 120 54) (104 . |splitDenominator|)
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
              (290 . >) (296 . |primitivePart|) (301 . |setelt!|) (|Vector| $$)
              (307 . |minIndex|) (312 . |maxIndex|) (317 . |elt|)
              (|Mapping| 7 7) (323 . |differentiate|)
              (|Record| (|:| |num| 89) (|:| |den| 7))
              (|MatrixCommonDenominator| 7 17) (329 . |splitDenominator|)
              |ALGFF;integralDerivationMatrix;MR;16| (|Vector| 7)
              (334 . |represents|) |ALGFF;integralRepresents;VUP$;17|
              (|Union| 6 '#1="failed") (340 . |retractIfCan|) (345 . |gcd|)
              (351 . |ground?|) |ALGFF;branchPoint?;UPB;18| (|List| 130)
              (|List| 22) (|Symbol|) (|Fraction| 52)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |coef| 134) (|:| |generator| $))
              (|Union| 134 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 139 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $) (|Fraction| 8) (|PositiveInteger|) (|InputForm|)
              (|Union| 22 '"failed") (|OnePointCompletion| 144)
              (|Record| (|:| |factor| 52) (|:| |exponent| 52)) (|List| 148)
              (|Union| 40 '"failed") (|Matrix| $) (|Table| 144 22)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Matrix| 52)
              (|Record| (|:| |mat| 154) (|:| |vec| (|Vector| 52)))
              (|Union| 131 '#1#) (|Union| 52 '#1#) (|List| (|Polynomial| 6))
              (|List| (|List| 6)) (|Union| 7 '"failed")
              (|Record| (|:| |num| $) (|:| |den| 7) (|:| |derivden| 7)
                        (|:| |gd| 7))
              (|Record| (|:| |mat| 28) (|:| |vec| 54)) (|Union| 17 '#1#)
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 356 |zero?| 362 |yCoordinates| 367 |unitNormal| 372
              |unitCanonical| 377 |unit?| 382 |traceMatrix| 387 |trace| 396
              |tableForDiscreteLogarithm| 401 |subtractIfCan| 406
              |squareFreePart| 412 |squareFree| 417 |smaller?| 422 |sizeLess?|
              428 |size| 434 |singularAtInfinity?| 438 |singular?| 442 |sample|
              452 |rightRecip| 456 |rightPower| 461 |retractIfCan| 473
              |retract| 488 |represents| 503 |representationType| 520 |rem| 524
              |regularRepresentation| 530 |reducedSystem| 541
              |reduceBasisAtInfinity| 563 |reduce| 568 |recip| 578
              |rationalPoints| 583 |rationalPoint?| 587 |rank| 593 |random| 597
              |ramifiedAtInfinity?| 601 |ramified?| 605 |quo| 615
              |principalIdeal| 621 |primitivePart| 626 |primitiveElement| 631
              |primitive?| 635 |primeFrobenius| 640 |prime?| 651 |order| 656
              |opposite?| 666 |one?| 672 |numberOfComponents| 677
              |normalizeAtInfinity| 681 |norm| 686 |nonSingularModel| 691
              |nextItem| 696 |multiEuclidean| 701 |minimalPolynomial| 707
              |lookup| 712 |lift| 717 |leftRecip| 722 |leftPower| 727 |lcmCoef|
              739 |lcm| 745 |latex| 756 |knownInfBasis| 761
              |inverseIntegralMatrixAtInfinity| 766 |inverseIntegralMatrix| 770
              |inv| 774 |integralRepresents| 779 |integralMatrixAtInfinity| 785
              |integralMatrix| 789 |integralDerivationMatrix| 793
              |integralCoordinates| 798 |integralBasisAtInfinity| 803
              |integralBasis| 807 |integralAtInfinity?| 811 |integral?| 816
              |init| 833 |index| 837 |hyperelliptic| 842 |hashUpdate!| 846
              |hash| 852 |genus| 857 |generator| 861 |gcdPolynomial| 865 |gcd|
              871 |factorsOfCyclicGroupSize| 882 |factor| 886
              |extendedEuclidean| 891 |exquo| 904 |expressIdealMember| 910
              |euclideanSize| 916 |enumerate| 921 |elt| 925 |elliptic| 932
              |divide| 936 |discriminant| 942 |discreteLog| 951 |differentiate|
              962 |derivationCoordinates| 1018 |definingPolynomial| 1024
              |createPrimitiveElement| 1028 |coordinates| 1032 |convert| 1054
              |conditionP| 1079 |complementaryBasis| 1084 |commutator| 1089
              |coerce| 1095 |charthRoot| 1120 |characteristicPolynomial| 1130
              |characteristic| 1135 |branchPointAtInfinity?| 1139
              |branchPoint?| 1143 |basis| 1153 |associator| 1157 |associates?|
              1164 |antiCommutator| 1170 |annihilate?| 1176 |algSplitSimple|
              1182 |absolutelyIrreducible?| 1188 ^ 1192 |Zero| 1210 |One| 1214
              D 1218 = 1268 / 1274 - 1280 + 1291 * 1297)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 2 2 4 4 4 3 0 4 0 0 3 4 3 3 0 0 0 1 3 3 3
                                  5 7 12 10 0 0 0 0 0 3 3 0 0 0 0 3 0 0 0 0 0 3
                                  3 0 0 0 0 0 0 0 0 6 0 0 6 2 0 0 0 0 0 0 0 0 3
                                  3 3 6 8 9))
            (CONS
             '#(|FunctionFieldCategory&| |MonogenicAlgebra&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |FramedAlgebra&| |GcdDomain&| |FiniteRankAlgebra&|
                |FullyLinearlyExplicitOver&| NIL NIL |DivisionRing&|
                |DifferentialExtension&| |Algebra&| NIL NIL NIL |Algebra&|
                |EntireRing&| |Algebra&| NIL |DifferentialRing&|
                |PartialDifferentialRing&| NIL NIL |Rng&| NIL |Module&| NIL
                |Module&| |Module&| |FramedModule&| NIL |NonAssociativeRing&|
                NIL NIL NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| |Finite&| |Magma&|
                |AbelianSemiGroup&| NIL NIL |FullyRetractableTo&|
                |SetCategory&| |RetractableTo&| NIL NIL NIL |BasicType&| NIL
                NIL NIL NIL NIL |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|FunctionFieldCategory| 6 7 8)
                 (|MonogenicAlgebra| (|Fraction| 7) 8) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|FramedAlgebra| (|Fraction| 7) 8) (|GcdDomain|)
                 (|FiniteRankAlgebra| (|Fraction| 7) 8)
                 (|FullyLinearlyExplicitOver| (|Fraction| 7)) (|LeftOreRing|)
                 (|IntegralDomain|) (|DivisionRing|)
                 (|DifferentialExtension| (|Fraction| 7))
                 (|Algebra| (|Fraction| 7))
                 (|LinearlyExplicitOver| (|Fraction| 7)) (|CommutativeRing|)
                 (|CharacteristicZero|) (|Algebra| $$) (|EntireRing|)
                 (|Algebra| 131) (|CharacteristicNonZero|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 130) (|LinearlyExplicitOver| 52)
                 (|Ring|) (|Rng|) (|SemiRing|) (|Module| (|Fraction| 7))
                 (|SemiRng|) (|Module| $$) (|Module| 131)
                 (|FramedModule| (|Fraction| 7))
                 (|BiModule| (|Fraction| 7) (|Fraction| 7))
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 131 131)
                 (|RightModule| (|Fraction| 7)) (|LeftModule| (|Fraction| 7))
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 131) (|RightModule| 131) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Finite|)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|FullyRetractableTo| (|Fraction| 7)) (|SetCategory|)
                 (|RetractableTo| (|Fraction| 7)) (|ConvertibleTo| 8)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 167) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|ConvertibleTo| 145)
                 (|RetractableTo| 131) (|RetractableTo| 52))
              (|makeByteWordVec2| 167
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
                                    17 7 0 104 1 7 22 0 105 1 17 7 0 106 2 22
                                    10 0 0 107 1 7 0 0 108 2 19 17 0 17 109 1
                                    110 52 0 111 1 110 52 0 112 2 110 2 0 52
                                    113 2 0 0 0 114 115 1 117 116 28 118 2 0 0
                                    120 7 121 1 7 123 0 124 2 7 0 0 0 125 1 7
                                    10 0 126 2 0 10 0 0 1 1 0 10 0 1 1 0 59 0 1
                                    1 3 132 0 1 1 3 0 0 1 1 3 10 0 1 0 0 28 1 1
                                    0 28 40 1 1 0 17 0 1 1 2 152 52 1 2 0 98 0
                                    0 1 1 3 0 0 1 1 3 142 0 1 2 6 10 0 0 1 2 3
                                    10 0 0 1 0 6 22 1 0 0 10 1 1 0 10 6 1 1 0
                                    10 7 1 0 0 0 1 1 0 98 0 1 2 0 0 0 22 1 2 0
                                    0 0 144 1 1 8 156 0 1 1 9 157 0 1 1 0 163 0
                                    1 1 8 131 0 1 1 9 52 0 1 1 0 17 0 1 2 0 0
                                    120 7 121 1 0 0 54 56 2 0 0 54 40 1 0 2 153
                                    1 2 3 0 0 0 1 1 0 28 0 1 2 0 28 0 40 1 1 10
                                    154 151 1 2 10 155 151 40 1 1 0 28 151 1 2
                                    0 162 151 40 1 1 0 40 40 1 1 3 98 143 1 1 0
                                    0 8 1 1 0 98 0 1 0 15 159 1 2 0 10 6 6 1 0
                                    0 144 1 0 6 0 1 0 0 10 1 1 0 10 6 1 1 0 10
                                    7 1 2 3 0 0 0 1 1 3 136 134 1 1 0 0 0 1 0 2
                                    0 1 1 2 10 0 1 1 2 0 0 1 2 2 0 0 22 1 1 3
                                    10 0 1 1 2 147 0 1 1 2 144 0 1 2 0 10 0 0 1
                                    1 0 10 0 1 0 0 22 1 1 0 40 40 96 1 0 17 0 1
                                    1 14 158 130 1 1 2 98 0 1 2 3 137 134 0 1 1
                                    3 8 0 1 1 6 144 0 1 1 0 8 0 1 1 0 98 0 1 2
                                    0 0 0 22 1 2 0 0 0 144 1 2 3 133 0 0 1 2 3
                                    0 0 0 1 1 3 0 134 1 1 0 164 0 1 1 0 72 22
                                    74 0 0 28 51 0 0 28 44 1 3 0 0 1 2 0 0 120
                                    7 122 0 0 28 45 0 0 28 43 1 0 116 114 119 1
                                    0 59 0 62 0 0 40 42 0 0 40 41 1 0 10 0 1 2
                                    0 10 0 7 1 2 0 10 0 6 1 1 0 10 0 1 0 2 0 1
                                    1 6 0 144 1 0 0 160 1 2 0 166 166 0 1 1 0
                                    165 0 1 0 0 22 1 0 0 0 1 2 3 135 135 135 1
                                    1 3 0 134 1 2 3 0 0 0 1 0 2 149 1 1 3 142 0
                                    1 3 3 140 0 0 0 1 2 3 141 0 0 1 2 3 98 0 0
                                    1 2 3 137 134 0 1 1 3 22 0 1 0 6 134 1 3 0
                                    6 0 6 6 1 0 0 160 1 2 3 138 0 0 1 0 0 17 39
                                    1 0 17 40 1 2 2 146 0 0 1 1 2 22 0 1 3 11 0
                                    0 130 22 1 3 11 0 0 128 129 1 2 11 0 0 128
                                    1 2 11 0 0 130 1 2 7 0 0 22 1 1 7 0 0 1 2 3
                                    0 0 77 1 3 3 0 0 77 22 1 2 0 0 0 114 115 2
                                    3 28 40 77 1 0 0 8 50 0 2 0 1 1 0 54 0 57 1
                                    0 28 40 97 2 0 54 0 40 1 2 0 28 40 40 1 1 6
                                    145 0 1 1 0 0 8 1 1 0 8 0 1 1 0 54 0 1 1 0
                                    0 54 1 1 2 150 151 1 1 0 40 40 1 2 0 0 0 0
                                    1 1 13 0 131 1 1 3 0 0 1 1 0 0 17 1 1 0 0
                                    52 1 1 0 167 0 1 1 5 98 0 1 1 2 0 0 1 1 0 8
                                    0 1 0 0 22 1 0 0 10 37 1 0 10 6 49 1 0 10 7
                                    127 0 0 40 88 3 0 0 0 0 0 1 2 3 10 0 0 1 2
                                    0 0 0 0 1 2 0 10 0 0 1 2 0 161 0 114 1 0 0
                                    10 1 2 3 0 0 52 1 2 0 0 0 22 1 2 0 0 0 144
                                    1 0 0 0 16 0 0 0 26 3 11 0 0 128 129 1 2 11
                                    0 0 128 1 3 11 0 0 130 22 1 2 11 0 0 130 1
                                    2 7 0 0 22 1 1 7 0 0 1 3 3 0 0 77 22 1 2 3
                                    0 0 77 1 2 0 10 0 0 1 2 3 0 0 0 1 1 0 0 0 1
                                    2 0 0 0 0 1 2 0 0 0 0 1 2 3 0 131 0 1 2 3 0
                                    0 131 1 2 0 0 17 0 1 2 0 0 0 17 1 2 0 0 22
                                    0 1 2 0 0 52 0 1 2 0 0 0 0 1 2 0 0 144 0
                                    1)))))
           '|lookupComplete|)) 
