
(/VERSIONCHECK 2) 

(DEFUN |GOSPER;deg0| (|p| |v| $)
  (COND ((SPADCALL |p| (QREFELT $ 13)) -1)
        ('T (SPADCALL |p| |v| (QREFELT $ 17))))) 

(DEFUN |GOSPER;rat?| (|x| $)
  (QEQCAR
   (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 19))
             (QREFELT $ 21))
   0)) 

(DEFUN |GOSPER;RFQ2R| (|f| $)
  (SPADCALL (|GOSPER;PQ2R| (SPADCALL |f| (QREFELT $ 23)) $)
            (|GOSPER;PQ2R| (SPADCALL |f| (QREFELT $ 24)) $) (QREFELT $ 25))) 

(DEFUN |GOSPER;PQ2R| (|p| $)
  (SPADCALL (CONS #'|GOSPER;PQ2R!0| $) (ELT $ 28) |p| (QREFELT $ 32))) 

(DEFUN |GOSPER;PQ2R!0| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 26)) (QREFELT $ 19))) 

(DEFUN |GOSPER;GospersMethod;QVMU;5| (|aquo| |n| |newV| $)
  (PROG (#1=#:G149 |u| |q|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |q| (|GOSPER;RF2QIfCan| |aquo| $)
               . #2=(|GOSPER;GospersMethod;QVMU;5|))
         (EXIT
          (COND
           ((QEQCAR |q| 1)
            (PROGN (LETT #1# (CONS 1 #3="failed") . #2#) (GO #1#)))
           ('T
            (SEQ
             (LETT |u| (|GOSPER;InnerGospersMethod| (QCDR |q|) |n| |newV| $)
                   . #2#)
             (EXIT
              (COND
               ((QEQCAR |u| 1)
                (PROGN (LETT #1# (CONS 1 #3#) . #2#) (GO #1#))))))))))
        (EXIT (CONS 0 (|GOSPER;RFQ2R| (QCDR |u|) $)))))
      #1# (EXIT #1#))))) 

(DEFUN |GOSPER;RF2QIfCan| (|f| $)
  (PROG (|d| |n|)
    (RETURN
     (SEQ
      (LETT |n| (|GOSPER;UP2QIfCan| (SPADCALL |f| (QREFELT $ 36)) $)
            . #1=(|GOSPER;RF2QIfCan|))
      (EXIT
       (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |d| (|GOSPER;UP2QIfCan| (SPADCALL |f| (QREFELT $ 37)) $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (SPADCALL (QCDR |n|) (QCDR |d|)
                                       (QREFELT $ 38)))))))))))))) 

(DEFUN |GOSPER;UP2QIfCan| (|p| $)
  (PROG ()
    (RETURN
     (COND
      ((SPADCALL (CONS (|function| |GOSPER;rat?|) $)
                 (SPADCALL |p| (QREFELT $ 40)) (QREFELT $ 42))
       (CONS 0
             (SPADCALL (ELT $ 43) (CONS #'|GOSPER;UP2QIfCan!0| $) |p|
                       (QREFELT $ 48))))
      ('T (CONS 1 "failed")))))) 

(DEFUN |GOSPER;UP2QIfCan!0| (|y| $)
  (PROG (#1=#:G169)
    (RETURN
     (SPADCALL
      (PROG2
          (LETT #1#
                (SPADCALL
                 (SPADCALL (SPADCALL |y| (QREFELT $ 18)) (QREFELT $ 19))
                 (QREFELT $ 21))
                NIL)
          (QCDR #1#)
        (|check_union| (QEQCAR #1# 0) (|Fraction| (|Integer|)) #1#))
      (QREFELT $ 44))))) 

(DEFUN |GOSPER;InnerGospersMethod| (|aquo| |n| |newV| $)
  (PROG (|qn1| |fn| |ufn| |k| |rn| |qn| |pn| |pqr| |anm1| |an|)
    (RETURN
     (SEQ
      (LETT |an| (SPADCALL |aquo| (QREFELT $ 23))
            . #1=(|GOSPER;InnerGospersMethod|))
      (LETT |anm1| (SPADCALL |aquo| (QREFELT $ 24)) . #1#)
      (LETT |pqr| (|GOSPER;GosperPQR| |an| |anm1| |n| |newV| $) . #1#)
      (LETT |pn| (|SPADfirst| |pqr|) . #1#)
      (LETT |qn| (SPADCALL |pqr| (QREFELT $ 50)) . #1#)
      (LETT |rn| (SPADCALL |pqr| (QREFELT $ 51)) . #1#)
      (LETT |k| (|GOSPER;GosperDegBd| |pn| |qn| |rn| |n| |newV| $) . #1#)
      (EXIT
       (COND ((< |k| 0) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |ufn| (|GOSPER;GosperF| |k| |pn| |qn| |rn| |n| |newV| $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |ufn| 1) (CONS 1 "failed"))
                      (#2#
                       (SEQ (LETT |fn| (QCDR |ufn|) . #1#)
                            (LETT |qn1|
                                  (SPADCALL |qn| |n|
                                            (SPADCALL
                                             (SPADCALL |n| (QREFELT $ 43))
                                             (|spadConstant| $ 54)
                                             (QREFELT $ 55))
                                            (QREFELT $ 56))
                                  . #1#)
                            (EXIT
                             (CONS 0
                                   (SPADCALL
                                    (SPADCALL |qn1| |pn| (QREFELT $ 38)) |fn|
                                    (QREFELT $ 57)))))))))))))))) 

(DEFUN |GOSPER;GosperF| (|k| |pn| |qn| |rn| |n| |newV| $)
  (PROG (#1=#:G196 #2=#:G195 #3=#:G197 |i| |vec| |soln| |mz| |dmz| |cmz| |zron|
         |dz| |cz| |mat| #4=#:G187 |zro| |qnplus1| |fnminus1| |fn| #5=#:G185
         #6=#:G184 #7=#:G186 |np| |mp| |mv|)
    (RETURN
     (SEQ (LETT |mv| (SPADCALL |newV|) . #8=(|GOSPER;GosperF|))
          (LETT |mp| (SPADCALL |mv| (QREFELT $ 43)) . #8#)
          (LETT |np| (SPADCALL |n| (QREFELT $ 43)) . #8#)
          (LETT |fn|
                (PROGN
                 (LETT #5# NIL . #8#)
                 (SEQ (LETT |i| 0 . #8#) G190
                      (COND ((|greater_SI| |i| |k|) (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #7#
                               (SPADCALL
                                (SPADCALL |mp| (+ |i| 1) (QREFELT $ 58))
                                (SPADCALL |np| |i| (QREFELT $ 58))
                                (QREFELT $ 59))
                               . #8#)
                         (COND
                          (#5#
                           (LETT #6# (SPADCALL #6# #7# (QREFELT $ 55)) . #8#))
                          ('T
                           (PROGN
                            (LETT #6# #7# . #8#)
                            (LETT #5# 'T . #8#)))))))
                      (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                      (EXIT NIL))
                 (COND (#5# #6#) (#9='T (|spadConstant| $ 60))))
                . #8#)
          (LETT |fnminus1|
                (SPADCALL |fn| |n|
                          (SPADCALL |np| (|spadConstant| $ 54) (QREFELT $ 61))
                          (QREFELT $ 56))
                . #8#)
          (LETT |qnplus1|
                (SPADCALL |qn| |n|
                          (SPADCALL |np| (|spadConstant| $ 54) (QREFELT $ 55))
                          (QREFELT $ 56))
                . #8#)
          (LETT |zro|
                (SPADCALL
                 (SPADCALL (SPADCALL |qnplus1| |fn| (QREFELT $ 59))
                           (SPADCALL |rn| |fnminus1| (QREFELT $ 59))
                           (QREFELT $ 61))
                 |pn| (QREFELT $ 61))
                . #8#)
          (LETT |zron| (SPADCALL |zro| |n| (QREFELT $ 63)) . #8#)
          (LETT |dz| (SPADCALL |zron| (QREFELT $ 65)) . #8#)
          (LETT |mat|
                (SPADCALL (+ |dz| 1)
                          (PROG1 (LETT #4# (+ |k| 1) . #8#)
                            (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|)
                                             #4#))
                          (QREFELT $ 67))
                . #8#)
          (LETT |vec| (MAKEARR1 (+ |dz| 1) (|spadConstant| $ 68)) . #8#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |zron| (|spadConstant| $ 69) (QREFELT $ 70)))
                 (GO G191)))
               (SEQ (LETT |cz| (SPADCALL |zron| (QREFELT $ 71)) . #8#)
                    (LETT |dz| (SPADCALL |zron| (QREFELT $ 65)) . #8#)
                    (LETT |zron| (SPADCALL |zron| (QREFELT $ 72)) . #8#)
                    (LETT |mz| (SPADCALL |cz| |mv| (QREFELT $ 63)) . #8#)
                    (EXIT
                     (SEQ G190
                          (COND
                           ((NULL
                             (SPADCALL |mz| (|spadConstant| $ 69)
                                       (QREFELT $ 70)))
                            (GO G191)))
                          (SEQ
                           (LETT |cmz|
                                 (SPADCALL (SPADCALL |mz| (QREFELT $ 71))
                                           (QREFELT $ 73))
                                 . #8#)
                           (LETT |dmz| (SPADCALL |mz| (QREFELT $ 65)) . #8#)
                           (LETT |mz| (SPADCALL |mz| (QREFELT $ 72)) . #8#)
                           (EXIT
                            (COND
                             ((EQL |dmz| 0)
                              (SPADCALL |vec|
                                        (+ |dz|
                                           (SPADCALL |vec| (QREFELT $ 76)))
                                        (SPADCALL |cmz| (QREFELT $ 77))
                                        (QREFELT $ 78)))
                             ('T
                              (QSETAREF2O |mat| (+ |dz| 1) (- (+ |dmz| 1) 1)
                                          |cmz| 1 1)))))
                          NIL (GO G190) G191 (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |soln| (SPADCALL |mat| |vec| (QREFELT $ 81)) . #8#)
          (EXIT
           (COND ((QEQCAR |soln| 1) (CONS 1 "failed"))
                 (#9#
                  (SEQ (LETT |vec| (QCDR |soln|) . #8#)
                       (EXIT
                        (CONS 0
                              (PROGN
                               (LETT #1# NIL . #8#)
                               (SEQ (LETT |i| 0 . #8#) G190
                                    (COND ((|greater_SI| |i| |k|) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #3#
                                             (SPADCALL
                                              (SPADCALL |np| |i|
                                                        (QREFELT $ 58))
                                              (SPADCALL |vec|
                                                        (+ |i|
                                                           (SPADCALL |vec|
                                                                     (QREFELT $
                                                                              76)))
                                                        (QREFELT $ 82))
                                              (QREFELT $ 83))
                                             . #8#)
                                       (COND
                                        (#1#
                                         (LETT #2#
                                               (SPADCALL #2# #3#
                                                         (QREFELT $ 84))
                                               . #8#))
                                        ('T
                                         (PROGN
                                          (LETT #2# #3# . #8#)
                                          (LETT #1# 'T . #8#)))))))
                                    (LETT |i| (|inc_SI| |i|) . #8#) (GO G190)
                                    G191 (EXIT NIL))
                               (COND (#1# #2#)
                                     (#9# (|spadConstant| $ 68)))))))))))))) 

(DEFUN |GOSPER;GosperPQR| (|an| |anm1| |n| |newV| $)
  (PROG (|pn| #1=#:G213 #2=#:G212 #3=#:G214 #4=#:G222 |i| |rn| #5=#:G207 |qn|
         |gn| |rtp| #6=#:G221 |rt| |js| #7=#:G203 #8=#:G220 |fe| #9=#:G219
         |fres| |res| |rnj| |j| |np|)
    (RETURN
     (SEQ (LETT |np| (SPADCALL |n| (QREFELT $ 43)) . #10=(|GOSPER;GosperPQR|))
          (LETT |pn| (|spadConstant| $ 54) . #10#) (LETT |qn| |an| . #10#)
          (LETT |rn| |anm1| . #10#) (LETT |j| (SPADCALL |newV|) . #10#)
          (LETT |rnj|
                (SPADCALL |rn| |n|
                          (SPADCALL |np| (SPADCALL |j| (QREFELT $ 43))
                                    (QREFELT $ 55))
                          (QREFELT $ 56))
                . #10#)
          (LETT |res| (SPADCALL |qn| |rnj| |n| (QREFELT $ 85)) . #10#)
          (LETT |fres| (SPADCALL |res| (QREFELT $ 88)) . #10#)
          (LETT |js|
                (PROGN
                 (LETT #9# NIL . #10#)
                 (SEQ (LETT |fe| NIL . #10#)
                      (LETT #8# (SPADCALL |fres| (QREFELT $ 91)) . #10#) G190
                      (COND
                       ((OR (ATOM #8#)
                            (PROGN (LETT |fe| (CAR #8#) . #10#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((QEQCAR
                           (LETT |rt|
                                 (|GOSPER;linearAndNNIntRoot| (QCAR |fe|) |j|
                                  $)
                                 . #10#)
                           0)
                          (LETT #9#
                                (CONS
                                 (PROG2 (LETT #7# |rt| . #10#)
                                     (QCDR #7#)
                                   (|check_union| (QEQCAR #7# 0) (|Integer|)
                                                  #7#))
                                 #9#)
                                . #10#)))))
                      (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                      (EXIT (NREVERSE #9#))))
                . #10#)
          (SEQ (LETT |rt| NIL . #10#) (LETT #6# |js| . #10#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |rt| (CAR #6#) . #10#) NIL))
                 (GO G191)))
               (SEQ (LETT |rtp| (SPADCALL |rt| (QREFELT $ 92)) . #10#)
                    (LETT |gn|
                          (SPADCALL |qn|
                                    (SPADCALL |rn| |n|
                                              (SPADCALL |np| |rtp|
                                                        (QREFELT $ 55))
                                              (QREFELT $ 56))
                                    (QREFELT $ 93))
                          . #10#)
                    (LETT |qn|
                          (PROG2
                              (LETT #5# (SPADCALL |qn| |gn| (QREFELT $ 95))
                                    . #10#)
                              (QCDR #5#)
                            (|check_union| (QEQCAR #5# 0)
                                           (|SparseMultivariatePolynomial|
                                            (|Fraction| (|Integer|))
                                            (QREFELT $ 7))
                                           #5#))
                          . #10#)
                    (LETT |rn|
                          (PROG2
                              (LETT #5#
                                    (SPADCALL |rn|
                                              (SPADCALL |gn| |n|
                                                        (SPADCALL |np| |rtp|
                                                                  (QREFELT $
                                                                           61))
                                                        (QREFELT $ 56))
                                              (QREFELT $ 95))
                                    . #10#)
                              (QCDR #5#)
                            (|check_union| (QEQCAR #5# 0)
                                           (|SparseMultivariatePolynomial|
                                            (|Fraction| (|Integer|))
                                            (QREFELT $ 7))
                                           #5#))
                          . #10#)
                    (EXIT
                     (LETT |pn|
                           (SPADCALL |pn|
                                     (PROGN
                                      (LETT #1# NIL . #10#)
                                      (SEQ (LETT |i| 0 . #10#)
                                           (LETT #4# (- |rt| 1) . #10#) G190
                                           (COND
                                            ((|greater_SI| |i| #4#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (PROGN
                                              (LETT #3#
                                                    (SPADCALL |gn| |n|
                                                              (SPADCALL |np|
                                                                        (SPADCALL
                                                                         |i|
                                                                         (QREFELT
                                                                          $
                                                                          92))
                                                                        (QREFELT
                                                                         $ 61))
                                                              (QREFELT $ 56))
                                                    . #10#)
                                              (COND
                                               (#1#
                                                (LETT #2#
                                                      (SPADCALL #2# #3#
                                                                (QREFELT $ 59))
                                                      . #10#))
                                               ('T
                                                (PROGN
                                                 (LETT #2# #3# . #10#)
                                                 (LETT #1# 'T . #10#)))))))
                                           (LETT |i| (|inc_SI| |i|) . #10#)
                                           (GO G190) G191 (EXIT NIL))
                                      (COND (#1# #2#)
                                            ('T (|spadConstant| $ 54))))
                                     (QREFELT $ 59))
                           . #10#)))
               (LETT #6# (CDR #6#) . #10#) (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |pn| |qn| |rn|)))))) 

(DEFUN |GOSPER;GosperDegBd| (|pn| |qn| |rn| |n| |newV| $)
  (PROG (|k0| #1=#:G224 |lcpk| |pk| |headfnm1| |headfn| |nk| |nkm1| |ckm1| |ck|
         |kk| |k| |degp| |lminus| |lplus| |qnplus1| |np|)
    (RETURN
     (SEQ (LETT |np| (SPADCALL |n| (QREFELT $ 43)) . #2=(|GOSPER;GosperDegBd|))
          (LETT |qnplus1|
                (SPADCALL |qn| |n|
                          (SPADCALL |np| (|spadConstant| $ 54) (QREFELT $ 55))
                          (QREFELT $ 56))
                . #2#)
          (LETT |lplus|
                (|GOSPER;deg0| (SPADCALL |qnplus1| |rn| (QREFELT $ 55)) |n| $)
                . #2#)
          (LETT |lminus|
                (|GOSPER;deg0| (SPADCALL |qnplus1| |rn| (QREFELT $ 61)) |n| $)
                . #2#)
          (LETT |degp| (|GOSPER;deg0| |pn| |n| $) . #2#)
          (LETT |k| (- |degp| (MAX (- |lplus| 1) |lminus|)) . #2#)
          (EXIT
           (COND ((SPADCALL |lplus| |lminus| (QREFELT $ 96)) |k|)
                 (#3='T
                  (SEQ
                   (LETT |kk| (SPADCALL (SPADCALL |newV|) (QREFELT $ 43))
                         . #2#)
                   (LETT |ck| (SPADCALL (SPADCALL |newV|) (QREFELT $ 43))
                         . #2#)
                   (LETT |ckm1| (SPADCALL (SPADCALL |newV|) (QREFELT $ 43))
                         . #2#)
                   (LETT |nkm1| (SPADCALL (SPADCALL |newV|) (QREFELT $ 43))
                         . #2#)
                   (LETT |nk| (SPADCALL |np| |nkm1| (QREFELT $ 59)) . #2#)
                   (LETT |headfn|
                         (SPADCALL (SPADCALL |ck| |nk| (QREFELT $ 59))
                                   (SPADCALL |ckm1| |nkm1| (QREFELT $ 59))
                                   (QREFELT $ 55))
                         . #2#)
                   (LETT |headfnm1|
                         (SPADCALL (SPADCALL |ck| |nk| (QREFELT $ 59))
                                   (SPADCALL
                                    (SPADCALL |ckm1|
                                              (SPADCALL |kk| |ck|
                                                        (QREFELT $ 59))
                                              (QREFELT $ 61))
                                    |nkm1| (QREFELT $ 59))
                                   (QREFELT $ 55))
                         . #2#)
                   (LETT |pk|
                         (SPADCALL (SPADCALL |qnplus1| |headfn| (QREFELT $ 59))
                                   (SPADCALL |rn| |headfnm1| (QREFELT $ 59))
                                   (QREFELT $ 61))
                         . #2#)
                   (LETT |lcpk|
                         (|GOSPER;pCoef| |pk|
                          (SPADCALL (SPADCALL |ck| |np| (QREFELT $ 59)) |nkm1|
                                    (QREFELT $ 59))
                          $)
                         . #2#)
                   (LETT |k0|
                         (|GOSPER;linearAndNNIntRoot| |lcpk|
                          (PROG2
                              (LETT #1# (SPADCALL |kk| (QREFELT $ 98)) . #2#)
                              (QCDR #1#)
                            (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                          $)
                         . #2#)
                   (EXIT
                    (COND ((QEQCAR |k0| 1) |k|)
                          (#3# (MAX (QCDR |k0|) |k|)))))))))))) 

(DEFUN |GOSPER;pCoef| (|p| |nom| $)
  (PROG (|up| |pow| |unom| #1=#:G237 |v| |vlist|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |nom| (QREFELT $ 99)))
        (|error| "pCoef requires a monomial 2nd arg"))
       ('T
        (SEQ
         (LETT |vlist| (SPADCALL |nom| (QREFELT $ 101)) . #2=(|GOSPER;pCoef|))
         (SEQ (LETT |v| NIL . #2#) (LETT #1# |vlist| . #2#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #2#) NIL)
                    (NULL
                     (SPADCALL |p| (|spadConstant| $ 60) (QREFELT $ 102))))
                (GO G191)))
              (SEQ (LETT |unom| (SPADCALL |nom| |v| (QREFELT $ 63)) . #2#)
                   (LETT |pow| (SPADCALL |unom| (QREFELT $ 65)) . #2#)
                   (LETT |nom| (SPADCALL |unom| (QREFELT $ 71)) . #2#)
                   (LETT |up| (SPADCALL |p| |v| (QREFELT $ 63)) . #2#)
                   (EXIT
                    (LETT |p| (SPADCALL |up| |pow| (QREFELT $ 103)) . #2#)))
              (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
         (EXIT |p|)))))))) 

(DEFUN |GOSPER;linearAndNNIntRoot| (|mp| |v| $)
  (PROG (|rt| #1=#:G247 |p0| |p1| |p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |mp| |v| (QREFELT $ 63))
            . #2=(|GOSPER;linearAndNNIntRoot|))
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |p| (QREFELT $ 65)) 1 (QREFELT $ 104))
         (CONS 1 "failed"))
        (#3='T
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |p1|
                   (SPADCALL (SPADCALL |p| 1 (QREFELT $ 103)) (QREFELT $ 105))
                   . #2#)
             (EXIT
              (COND
               ((QEQCAR |p1| 1)
                (PROGN (LETT #1# (CONS 1 #4="failed") . #2#) (GO #1#)))
               (#3#
                (SEQ
                 (LETT |p0|
                       (SPADCALL (SPADCALL |p| 0 (QREFELT $ 103))
                                 (QREFELT $ 105))
                       . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |p0| 1)
                    (PROGN (LETT #1# (CONS 1 #4#) . #2#) (GO #1#))))))))))
            (LETT |rt|
                  (SPADCALL (SPADCALL (QCDR |p0|) (QCDR |p1|) (QREFELT $ 106))
                            (QREFELT $ 107))
                  . #2#)
            (COND
             ((OR (SPADCALL |rt| (|spadConstant| $ 108) (QREFELT $ 109))
                  (SPADCALL (SPADCALL |rt| (QREFELT $ 110)) 1 (QREFELT $ 104)))
              (EXIT (CONS 1 "failed"))))
            (EXIT (CONS 0 (SPADCALL |rt| (QREFELT $ 111))))))
          #1# (EXIT #1#))))))))) 

(DEFUN |GosperSummationMethod| (&REST #1=#:G250)
  (PROG ()
    (RETURN
     (PROG (#2=#:G251)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|GosperSummationMethod|)
                                           '|domainEqualList|)
                . #3=(|GosperSummationMethod|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |GosperSummationMethod;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|GosperSummationMethod|))))))))))) 

(DEFUN |GosperSummationMethod;| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|GosperSummationMethod|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$| (LIST '|GosperSummationMethod| DV$1 DV$2 DV$3 DV$4 DV$5)
            . #1#)
      (LETT $ (GETREFV 112) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|GosperSummationMethod|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|GosperSummationMethod| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|Boolean|)
              (|SparseMultivariatePolynomial| 27 7) (0 . |zero?|) (5 . |One|)
              (9 . |One|) (|NonNegativeInteger|) (13 . |degree|)
              (19 . |coerce|) (24 . |coerce|) (|Union| 27 '"failed")
              (29 . |retractIfCan|) (|Fraction| 12) (34 . |numer|)
              (39 . |denom|) (44 . /) (50 . |coerce|) (|Fraction| 74)
              (55 . |coerce|) (|Mapping| 10 7) (|Mapping| 10 27)
              (|PolynomialCategoryLifting| (|IndexedExponents| 7) 7 27 12 10)
              (60 . |map|) (|Union| 10 '"failed") (|Mapping| 7)
              |GOSPER;GospersMethod;QVMU;5| (67 . |numer|) (72 . |denom|)
              (77 . /) (|List| 8) (83 . |coefficients|) (|Mapping| 11 8)
              (88 . |every?|) (94 . |coerce|) (99 . |coerce|) (|Mapping| 12 7)
              (|Mapping| 12 8) (|PolynomialCategoryLifting| 6 7 8 9 12)
              (104 . |map|) (|List| 12) (111 . |second|) (116 . |third|)
              (121 . |Zero|) (125 . |Zero|) (129 . |One|) (133 . +)
              (139 . |eval|) (146 . *) (152 . ^) (158 . *) (164 . |Zero|)
              (168 . -) (|SparseUnivariatePolynomial| $) (174 . |univariate|)
              (|SparseUnivariatePolynomial| 12) (180 . |degree|) (|Matrix| 22)
              (185 . |zero|) (191 . |Zero|) (195 . |Zero|) (199 . ~=)
              (205 . |leadingCoefficient|) (210 . |reductum|) (215 . |coerce|)
              (|Integer|) (|Vector| 22) (220 . |minIndex|) (225 . -)
              (230 . |setelt|) (|Union| 75 '"failed")
              (|LinearSystemMatrixPackage| 22 75 75 66)
              (237 . |particularSolution|) (243 . |elt|) (249 . *) (255 . +)
              (261 . |resultant|) (|Factored| 12)
              (|MRationalFactorize| (|IndexedExponents| 7) 7 74 12)
              (268 . |factor|) (|Record| (|:| |factor| 12) (|:| |exponent| 74))
              (|List| 89) (273 . |factors|) (278 . |coerce|) (283 . |gcd|)
              (|Union| $ '"failed") (289 . |exquo|) (295 . <=)
              (|Union| 7 '"failed") (301 . |mainVariable|) (306 . |monomial?|)
              (|List| 7) (311 . |variables|) (316 . ~=) (322 . |coefficient|)
              (328 . ~=) (334 . |retractIfCan|) (339 . /) (345 . -)
              (350 . |Zero|) (354 . <) (360 . |denom|) (365 . |numer|))
           '#(|GospersMethod| 370) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 111
                                                 '(1 12 11 0 13 0 8 0 14 0 9 0
                                                   15 2 12 16 0 7 17 1 9 0 8 18
                                                   1 10 0 9 19 1 10 20 0 21 1
                                                   22 12 0 23 1 22 12 0 24 2 10
                                                   0 0 0 25 1 9 0 7 26 1 10 0
                                                   27 28 3 31 10 29 30 12 32 1
                                                   10 9 0 36 1 10 9 0 37 2 22 0
                                                   12 12 38 1 9 39 0 40 2 39 11
                                                   41 0 42 1 12 0 7 43 1 12 0
                                                   27 44 3 47 12 45 46 9 48 1
                                                   49 12 0 50 1 49 12 0 51 0 6
                                                   0 52 0 8 0 53 0 12 0 54 2 12
                                                   0 0 0 55 3 12 0 0 7 0 56 2
                                                   22 0 0 0 57 2 12 0 0 16 58 2
                                                   12 0 0 0 59 0 12 0 60 2 12 0
                                                   0 0 61 2 12 62 0 7 63 1 64
                                                   16 0 65 2 66 0 16 16 67 0 22
                                                   0 68 0 64 0 69 2 64 11 0 0
                                                   70 1 64 12 0 71 1 64 0 0 72
                                                   1 22 0 12 73 1 75 74 0 76 1
                                                   22 0 0 77 3 75 22 0 74 22 78
                                                   2 80 79 66 75 81 2 75 22 0
                                                   74 82 2 22 0 12 0 83 2 22 0
                                                   0 0 84 3 12 0 0 0 7 85 1 87
                                                   86 12 88 1 86 90 0 91 1 12 0
                                                   74 92 2 12 0 0 0 93 2 12 94
                                                   0 0 95 2 74 11 0 0 96 1 12
                                                   97 0 98 1 12 11 0 99 1 12
                                                   100 0 101 2 12 11 0 0 102 2
                                                   64 12 0 16 103 2 74 11 0 0
                                                   104 1 12 20 0 105 2 27 0 0 0
                                                   106 1 27 0 0 107 0 27 0 108
                                                   2 27 11 0 0 109 1 27 74 0
                                                   110 1 27 74 0 111 3 0 33 10
                                                   7 34 35)))))
           '|lookupComplete|)) 
