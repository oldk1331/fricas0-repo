
(/VERSIONCHECK 2) 

(DEFUN |ALGFF;branchPointAtInfinity?;B;1| ($)
  (SEQ
   (COND ((SPADCALL (QREFELT $ 13) (QREFELT $ 35)) (|ALGFF;startUp| 'NIL $)))
   (EXIT (SPADCALL (QREFELT $ 14) (QREFELT $ 36))))) 

(DEFUN |ALGFF;discriminant;F;2| ($)
  (SEQ
   (COND ((SPADCALL (QREFELT $ 13) (QREFELT $ 35)) (|ALGFF;startUp| 'NIL $)))
   (EXIT (SPADCALL (QREFELT $ 21) (QREFELT $ 38))))) 

(DEFUN |ALGFF;integralBasis;V;3| ($)
  (SEQ
   (COND ((SPADCALL (QREFELT $ 13) (QREFELT $ 35)) (|ALGFF;startUp| 'NIL $)))
   (EXIT (|ALGFF;vect| (QREFELT $ 30) $)))) 

(DEFUN |ALGFF;integralBasisAtInfinity;V;4| ($)
  (SEQ
   (COND ((SPADCALL (QREFELT $ 13) (QREFELT $ 35)) (|ALGFF;startUp| 'NIL $)))
   (EXIT (|ALGFF;vect| (QREFELT $ 33) $)))) 

(DEFUN |ALGFF;integralMatrix;M;5| ($)
  (SEQ
   (COND ((SPADCALL (QREFELT $ 13) (QREFELT $ 35)) (|ALGFF;startUp| 'NIL $)))
   (EXIT (QREFELT $ 30)))) 

(DEFUN |ALGFF;inverseIntegralMatrix;M;6| ($)
  (SEQ
   (COND ((SPADCALL (QREFELT $ 13) (QREFELT $ 35)) (|ALGFF;startUp| 'NIL $)))
   (EXIT (QREFELT $ 32)))) 

(DEFUN |ALGFF;integralMatrixAtInfinity;M;7| ($)
  (SEQ
   (COND ((SPADCALL (QREFELT $ 13) (QREFELT $ 35)) (|ALGFF;startUp| 'NIL $)))
   (EXIT (QREFELT $ 33)))) 

(DEFUN |ALGFF;branchPoint?;FB;8| (|a| $)
  (SPADCALL
   (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 39)) (QREFELT $ 46)) |a|
             (QREFELT $ 47))
   (QREFELT $ 48))) 

(DEFUN |ALGFF;definingPolynomial;UPUP;9| ($) (QREFELT $ 9)) 

(DEFUN |ALGFF;inverseIntegralMatrixAtInfinity;M;10| ($)
  (SEQ
   (COND ((SPADCALL (QREFELT $ 13) (QREFELT $ 35)) (|ALGFF;startUp| 'NIL $)))
   (EXIT (QREFELT $ 34)))) 

(DEFUN |ALGFF;vect| (|m| $)
  (PROG (#1=#:G146 #2=#:G148 |i| #3=#:G147)
    (RETURN
     (SEQ
      (PROGN
       (LETT #3# (GETREFV #4=(SPADCALL |m| (QREFELT $ 53)))
             . #5=(|ALGFF;vect|))
       (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#) (LETT #1# 0 . #5#) G190
            (COND ((|greater_SI| |i| #2#) (GO G191)))
            (SEQ
             (EXIT
              (SETELT #3# #1#
                      (SPADCALL (SPADCALL |m| |i| (QREFELT $ 55))
                                (QREFELT $ 56)))))
            (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (|inc_SI| |i|) . #5#))
                  . #5#)
            (GO G190) G191 (EXIT NIL))
       #3#))))) 

(DEFUN |ALGFF;integralCoordinates;$R;12| (|f| $)
  (SPADCALL
   (SPADCALL (SPADCALL |f| (QREFELT $ 57)) (SPADCALL (QREFELT $ 44))
             (QREFELT $ 58))
   (QREFELT $ 61))) 

(DEFUN |ALGFF;knownInfBasis;NniV;13| (|d| $)
  (PROG (#1=#:G166 |j| #2=#:G165 |i| |invib| |ib| #3=#:G162 #4=#:G164 #5=#:G163
         |alpha| #6=#:G161 #7=#:G160)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (QREFELT $ 13) (QREFELT $ 35))
        (SEQ
         (LETT |alpha|
               (PROGN
                (LETT #7# (GETREFV (|inc_SI| #8=(QREFELT $ 27)))
                      . #9=(|ALGFF;knownInfBasis;NniV;13|))
                (SEQ (LETT |i| 0 . #9#) (LETT #6# #8# . #9#) G190
                     (COND ((|greater_SI| |i| #6#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SETELT #7# |i|
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 63) (* |d| |i|)
                                          (QREFELT $ 64))
                                (QREFELT $ 65)))))
                     (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
                #7#)
               . #9#)
         (LETT |ib|
               (SPADCALL
                (PROGN
                 (LETT #5#
                       (GETREFV
                        (|inc_SI|
                         (- #10=(QVSIZE |alpha|)
                            #11=(SPADCALL |alpha| (QREFELT $ 66)))))
                       . #9#)
                 (SEQ (LETT |i| #11# . #9#) (LETT #4# #10# . #9#)
                      (LETT #3# 0 . #9#) G190 (COND ((> |i| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #5# #3#
                                (SPADCALL (QAREF1O |alpha| |i| 1)
                                          (QREFELT $ 67)))))
                      (LETT #3#
                            (PROG1 (|inc_SI| #3#) (LETT |i| (+ |i| 1) . #9#))
                            . #9#)
                      (GO G190) G191 (EXIT NIL))
                 #5#)
                (QREFELT $ 68))
               . #9#)
         (LETT |invib| (SPADCALL |alpha| (QREFELT $ 68)) . #9#)
         (EXIT
          (SEQ (LETT |i| 1 . #9#)
               (LETT #2# (SPADCALL |ib| (QREFELT $ 53)) . #9#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #9#)
                      (LETT #1# (SPADCALL |ib| (QREFELT $ 69)) . #9#) G190
                      (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ
                       (SPADCALL (QREFELT $ 33) |i| |j|
                                 (QAREF2O |ib| |i| |j| 1 1) (QREFELT $ 70))
                       (EXIT
                        (SPADCALL (QREFELT $ 34) |i| |j|
                                  (SPADCALL |invib| |i| |j| (QREFELT $ 71))
                                  (QREFELT $ 70))))
                      (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))))))
      (EXIT (SPADCALL (QREFELT $ 73))))))) 

(DEFUN |ALGFF;getInfBasis| ($)
  (PROG (#1=#:G189 |j| #2=#:G188 |i| |invib2| |ib2| #3=#:G187 #4=#:G186 |invib|
         |invalpha| #5=#:G183 #6=#:G185 #7=#:G184 |alpha| #8=#:G182 #9=#:G181
         |ninvmod| |r| |invmod| |x|)
    (RETURN
     (SEQ
      (LETT |x|
            (SPADCALL
             (SPADCALL (SPADCALL (|spadConstant| $ 63) 1 (QREFELT $ 64))
                       (QREFELT $ 65))
             (QREFELT $ 67))
            . #10=(|ALGFF;getInfBasis|))
      (LETT |invmod|
            (SPADCALL (CONS #'|ALGFF;getInfBasis!0| (VECTOR $ |x|))
                      (QREFELT $ 9) (QREFELT $ 78))
            . #10#)
      (LETT |r| (SPADCALL |invmod| (QREFELT $ 81)) . #10#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 23)) (QREFELT $ 24)
                   (QREFELT $ 82))
         (|error| "Should not happen"))
        ('T
         (SEQ
          (LETT |ninvmod| (SPADCALL (ELT $ 46) (QCDR |r|) (QREFELT $ 86))
                . #10#)
          (LETT |alpha|
                (PROGN
                 (LETT #9# (GETREFV (|inc_SI| #11=(QREFELT $ 27))) . #10#)
                 (SEQ (LETT |i| 0 . #10#) (LETT #8# #11# . #10#) G190
                      (COND ((|greater_SI| |i| #8#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #9# |i|
                                (SPADCALL
                                 (SPADCALL (QCAR |r|) |i| (QREFELT $ 87)) |x|
                                 (QREFELT $ 76)))))
                      (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                      (EXIT NIL))
                 #9#)
                . #10#)
          (LETT |invalpha|
                (PROGN
                 (LETT #7#
                       (GETREFV
                        (|inc_SI|
                         (- #12=(QVSIZE |alpha|)
                            #13=(SPADCALL |alpha| (QREFELT $ 66)))))
                       . #10#)
                 (SEQ (LETT |i| #13# . #10#) (LETT #6# #12# . #10#)
                      (LETT #5# 0 . #10#) G190 (COND ((> |i| #6#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #7# #5#
                                (SPADCALL (QAREF1O |alpha| |i| 1)
                                          (QREFELT $ 67)))))
                      (LETT #5#
                            (PROG1 (|inc_SI| #5#) (LETT |i| (+ |i| 1) . #10#))
                            . #10#)
                      (GO G190) G191 (EXIT NIL))
                 #7#)
                . #10#)
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
                                                     (|devaluate| (ELT $ 7)))
                                               (LIST '|:| '|basisInv|
                                                     (LIST '|Matrix|
                                                           (|devaluate|
                                                            (ELT $ 7))))))
                                        (|FunctionFieldIntegralBasis| (ELT $ 7)
                                                                      (|SparseUnivariatePolynomial|
                                                                       (ELT $
                                                                            7))
                                                                      (|SimpleAlgebraicExtension|
                                                                       (ELT $
                                                                            7)
                                                                       (|SparseUnivariatePolynomial|
                                                                        (ELT $
                                                                             7))
                                                                       |ninvmod|))))
                . #10#)
          (SEQ (LETT |i| 1 . #10#)
               (LETT #4# (SPADCALL (QREFELT $ 30) (QREFELT $ 53)) . #10#) G190
               (COND ((|greater_SI| |i| #4#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #10#)
                      (LETT #3# (SPADCALL (QREFELT $ 30) (QREFELT $ 69))
                            . #10#)
                      G190 (COND ((|greater_SI| |j| #3#) (GO G191)))
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
                      (LETT |j| (|inc_SI| |j|) . #10#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))
          (LETT |ib2|
                (SPADCALL (QREFELT $ 33) (SPADCALL |alpha| (QREFELT $ 68))
                          (QREFELT $ 93))
                . #10#)
          (LETT |invib2|
                (SPADCALL (SPADCALL |invalpha| (QREFELT $ 68)) (QREFELT $ 34)
                          (QREFELT $ 93))
                . #10#)
          (SEQ (LETT |i| 1 . #10#)
               (LETT #2# (SPADCALL |ib2| (QREFELT $ 53)) . #10#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #10#)
                      (LETT #1# (SPADCALL (QREFELT $ 30) (QREFELT $ 69))
                            . #10#)
                      G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ
                       (SPADCALL (QREFELT $ 33) |i| |j|
                                 (QAREF2O |ib2| |i| |j| 1 1) (QREFELT $ 70))
                       (EXIT
                        (SPADCALL (QREFELT $ 34) |i| |j|
                                  (SPADCALL |invib2| |i| |j| (QREFELT $ 71))
                                  (QREFELT $ 70))))
                      (LETT |j| (|inc_SI| |j|) . #10#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (QREFELT $ 73))))))))))) 

(DEFUN |ALGFF;getInfBasis!0| (|s| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|ALGFF;getInfBasis|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |s| |x| (QREFELT $ 76)))))) 

(DEFUN |ALGFF;startUp| (|b| $)
  (PROG (|dsc| |dsc0| #1=#:G208 |j| #2=#:G207 |i| |invib2| #3=#:G197 |ib2|
         #4=#:G206 #5=#:G205 |ib| |nmod|)
    (RETURN
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
                                                     (|devaluate| (ELT $ 7)))
                                               (LIST '|:| '|basisInv|
                                                     (LIST '|Matrix|
                                                           (|devaluate|
                                                            (ELT $ 7))))))
                                        (|FunctionFieldIntegralBasis| (ELT $ 7)
                                                                      (|SparseUnivariatePolynomial|
                                                                       (ELT $
                                                                            7))
                                                                      (|SimpleAlgebraicExtension|
                                                                       (ELT $
                                                                            7)
                                                                       (|SparseUnivariatePolynomial|
                                                                        (ELT $
                                                                             7))
                                                                       |nmod|))))
                . #6#)
          (SEQ (LETT |i| 1 . #6#)
               (LETT #5# (SPADCALL (QREFELT $ 30) (QREFELT $ 53)) . #6#) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #6#)
                      (LETT #4# (SPADCALL (QREFELT $ 30) (QREFELT $ 69)) . #6#)
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
                  (|check_union| (QEQCAR #3# 0)
                                 (|Matrix| (|Fraction| (QREFELT $ 7))) #3#))
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
                                 (QAREF2O |ib2| |i| |j| 1 1) (QREFELT $ 70))
                       (EXIT
                        (SPADCALL (QREFELT $ 32) |i| |j|
                                  (SPADCALL |invib2| |i| |j| (QREFELT $ 71))
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
                          (SPADCALL (SPADCALL (QREFELT $ 33) (QREFELT $ 102)) 2
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
              (EXIT (SPADCALL (QREFELT $ 73))))))))))) 

(DEFUN |ALGFF;integralDerivationMatrix;MR;16| (|d| $)
  (PROG (#1=#:G221 #2=#:G223 |i| #3=#:G222 |w|)
    (RETURN
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
           (SEQ (LETT |i| #6# . #4#) (LETT #2# #5# . #4#) (LETT #1# 0 . #4#)
                G190 (COND ((> |i| #2#) (GO G191)))
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
        (QREFELT $ 118))))))) 

(DEFUN |ALGFF;integralRepresents;VUP$;17| (|v| |d| $)
  (SPADCALL
   (SPADCALL (SPADCALL (SPADCALL |v| |d| (QREFELT $ 121)) (QREFELT $ 57))
             (SPADCALL (QREFELT $ 43)) (QREFELT $ 58))
   (QREFELT $ 56))) 

(DEFUN |ALGFF;branchPoint?;UPB;18| (|p| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (QREFELT $ 13) (QREFELT $ 35)) (|ALGFF;startUp| 'NIL $)))
      (LETT |r| (SPADCALL |p| (QREFELT $ 124)) |ALGFF;branchPoint?;UPB;18|)
      (EXIT
       (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 49)))
             ((SPADCALL
               (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 39)) (QREFELT $ 46))
                         |p| (QREFELT $ 125))
               (QREFELT $ 126))
              'NIL)
             ('T 'T))))))) 

(DECLAIM (NOTINLINE |AlgebraicFunctionField;|)) 

(DEFUN |AlgebraicFunctionField| (&REST #1=#:G274)
  (PROG ()
    (RETURN
     (PROG (#2=#:G275)
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
              (HREM |$ConstructorCache| '|AlgebraicFunctionField|))))))))))) 

(DEFUN |AlgebraicFunctionField;| (|#1| |#2| |#3| |#4|)
  (PROG (#1=#:G117 |pv$| #2=#:G272 #3=#:G273 $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
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
                                                (|HasCategory|
                                                 (|Fraction| |#2|) '(|Field|))
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
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (LETT #2#
                                                (AND
                                                 (|HasCategory|
                                                  (|Fraction| |#2|)
                                                  '(|PartialDifferentialRing|
                                                    (|Symbol|)))
                                                 (|HasCategory|
                                                  (|Fraction| |#2|)
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
                  (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#)))
      (QSETREFV $ 30 (SPADCALL (QREFELT $ 24) (QREFELT $ 24) (QREFELT $ 29)))
      (QSETREFV $ 32 (SPADCALL (QREFELT $ 30) (QREFELT $ 31)))
      (QSETREFV $ 33 (SPADCALL (QREFELT $ 30) (QREFELT $ 31)))
      (QSETREFV $ 34 (SPADCALL (QREFELT $ 30) (QREFELT $ 31)))
      $)))) 

(MAKEPROP '|AlgebraicFunctionField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SimpleAlgebraicExtension| 17 8 9)
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
              (144 . |setelt|) (152 . |elt|) (|Void|) (159 . |void|)
              |ALGFF;knownInfBasis;NniV;13| (|Fraction| $) (163 . |elt|)
              (|Mapping| 17 17) (169 . |map|)
              (|Record| (|:| |coef| 17) (|:| |poly| 8))
              (|ChangeOfVariable| 6 7 8) (175 . |mkIntegral|) (180 . ~=)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 17)
              (|UnivariatePolynomialCategoryFunctions2| 17 8 7 83)
              (186 . |map|) (192 . ^) (198 . |basis|) (|Matrix| 7)
              (202 . |elt|) (209 . /) (215 . |elt|) (221 . *) (227 . |setelt|)
              (233 . |zero?|) (238 . |normalizeAtInfinity|)
              (243 . |coordinates|) (|Union| $ '"failed") (248 . |inverse|)
              (253 . |differentiate|) (258 . |resultant|) (264 . |determinant|)
              (269 . *) (275 . |numer|) (280 . |degree|) (285 . |denom|)
              (290 . >) (296 . |primitivePart|) (301 . |setelt|) (|Vector| $$)
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
              (|Union| 134 '"failed")
              (|Record| (|:| |coef| 134) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 140 '"failed") (|Factored| $) (|Fraction| 8)
              (|InputForm|) (|PositiveInteger|) (|OnePointCompletion| 145)
              (|Union| 22 '"failed")
              (|Record| (|:| |factor| 52) (|:| |exponent| 52)) (|List| 148)
              (|Union| 40 '"failed") (|Matrix| $) (|Table| 145 22)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Record| (|:| |mat| 155) (|:| |vec| (|Vector| 52)))
              (|Matrix| 52) (|Union| 131 '#1#) (|Union| 52 '#1#)
              (|List| (|Polynomial| 6)) (|List| (|List| 6))
              (|Union| 7 '"failed")
              (|Record| (|:| |num| $) (|:| |den| 7) (|:| |derivden| 7)
                        (|:| |gd| 7))
              (|Record| (|:| |mat| 28) (|:| |vec| 54)) (|Union| 17 '#1#)
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(|represents| 356 |normalizeAtInfinity| 367 |knownInfBasis| 372
              |inverseIntegralMatrixAtInfinity| 377 |inverseIntegralMatrix| 381
              |integralRepresents| 385 |integralMatrixAtInfinity| 391
              |integralMatrix| 395 |integralDerivationMatrix| 399
              |integralCoordinates| 404 |integralBasisAtInfinity| 409
              |integralBasis| 413 |discriminant| 417 |differentiate| 421
              |definingPolynomial| 427 |coordinates| 431
              |branchPointAtInfinity?| 441 |branchPoint?| 445 |basis| 455
              |Zero| 459 |One| 463)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 2 2 4 4 4 3 0 4 0 4 3 0 0 3 3 3 3 0 0 0 1
                                  3 3 3 5 7 12 10 0 0 0 3 0 0 0 0 0 3 3 0 0 0 0
                                  0 0 0 0 6 2 0 0 0 0 0 0 0 0 3 3 3 6 8 9))
            (CONS
             '#(|FunctionFieldCategory&| |MonogenicAlgebra&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |FramedAlgebra&| |GcdDomain&| |FiniteRankAlgebra&| NIL
                |DivisionRing&| |Algebra&| |FullyLinearlyExplicitRingOver&|
                |Algebra&| NIL |Algebra&| |DifferentialExtension&| NIL NIL
                |Module&| NIL |Module&| |EntireRing&| |Module&| NIL
                |DifferentialRing&| |PartialDifferentialRing&| NIL NIL |Ring&|
                NIL NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                |Finite&| NIL |FullyRetractableTo&| |SetCategory&|
                |RetractableTo&| NIL NIL NIL |BasicType&| NIL NIL NIL NIL NIL
                |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|FunctionFieldCategory| 6 7 8)
                 (|MonogenicAlgebra| (|Fraction| 7) 8) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|FramedAlgebra| (|Fraction| 7) 8) (|GcdDomain|)
                 (|FiniteRankAlgebra| (|Fraction| 7) 8) (|IntegralDomain|)
                 (|DivisionRing|) (|Algebra| (|Fraction| 7))
                 (|FullyLinearlyExplicitRingOver| (|Fraction| 7))
                 (|Algebra| $$) (|LeftOreRing|) (|Algebra| 131)
                 (|DifferentialExtension| (|Fraction| 7))
                 (|LinearlyExplicitRingOver| (|Fraction| 7))
                 (|CommutativeRing|) (|Module| (|Fraction| 7))
                 (|CharacteristicZero|) (|Module| $$) (|EntireRing|)
                 (|Module| 131) (|CharacteristicNonZero|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 130)
                 (|LinearlyExplicitRingOver| 52) (|BiModule| $$ $$) (|Ring|)
                 (|BiModule| (|Fraction| 7) (|Fraction| 7))
                 (|BiModule| 131 131) (|LeftModule| $$) (|RightModule| $$)
                 (|Rng|) (|RightModule| (|Fraction| 7))
                 (|LeftModule| (|Fraction| 7)) (|LeftModule| 131)
                 (|RightModule| 131) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Finite|) (|StepThrough|)
                 (|FullyRetractableTo| (|Fraction| 7)) (|SetCategory|)
                 (|RetractableTo| (|Fraction| 7)) (|ConvertibleTo| 8)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 167) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|ConvertibleTo| 144)
                 (|RetractableTo| 131) (|RetractableTo| 52))
              (|makeByteWordVec2| 127
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
                                    10 0 126 2 0 0 120 7 121 1 0 0 54 56 1 0 40
                                    40 96 1 0 72 22 74 0 0 28 51 0 0 28 44 2 0
                                    0 120 7 122 0 0 28 45 0 0 28 43 1 0 116 114
                                    119 1 0 59 0 62 0 0 40 42 0 0 40 41 0 0 17
                                    39 2 0 0 0 114 115 0 0 8 50 1 0 54 0 57 1 0
                                    28 40 97 0 0 10 37 1 0 10 6 49 1 0 10 7 127
                                    0 0 40 88 0 0 0 16 0 0 0 26)))))
           '|lookupIncomplete|)) 
