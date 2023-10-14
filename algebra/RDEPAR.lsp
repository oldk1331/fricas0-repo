
(SDEFUN |RDEPAR;get_denom|
        ((|f| |Fraction| (|SparseUnivariatePolynomial| F))
         (|lg| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |List| (|SparseUnivariatePolynomial| F)))
        (SPROG
         ((|h| (|SparseUnivariatePolynomial| F)) (#1=#:G137 NIL)
          (|gg| (|SparseUnivariatePolynomial| F))
          (|s| #2=(|SparseUnivariatePolynomial| F))
          (|e| #3=(|SparseUnivariatePolynomial| F))
          (|#G8| (|Record| (|:| |normal| #3#) (|:| |special| #2#)))
          (|e0| (|SparseUnivariatePolynomial| F)) (#4=#:G142 NIL) (|g| NIL)
          (#5=#:G141 NIL) (|d| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |d| (SPADCALL |f| |der| (QREFELT $ 14))
                . #6=(|RDEPAR;get_denom|))
          (LETT |e0|
                (SPADCALL
                 (PROGN
                  (LETT #5# NIL . #6#)
                  (SEQ (LETT |g| NIL . #6#) (LETT #4# |lg| . #6#) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |g| (CAR #4#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #5# (CONS (SPADCALL |g| (QREFELT $ 15)) #5#)
                               . #6#)))
                       (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                       (EXIT (NREVERSE #5#))))
                 (QREFELT $ 17))
                . #6#)
          (PROGN
           (LETT |#G8| (SPADCALL |e0| |der| (QREFELT $ 19)) . #6#)
           (LETT |e| (QCAR |#G8|) . #6#)
           (LETT |s| (QCDR |#G8|) . #6#)
           |#G8|)
          (LETT |gg| (SPADCALL |d| |e| (QREFELT $ 20)) . #6#)
          (LETT |h|
                (PROG2
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL |e| (SPADCALL |e| (QREFELT $ 21))
                                     (QREFELT $ 20))
                           (SPADCALL |gg| (SPADCALL |gg| (QREFELT $ 21))
                                     (QREFELT $ 20))
                           (QREFELT $ 23))
                          . #6#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                   "failed")
                                  #1#))
                . #6#)
          (EXIT (LIST |d| |h|))))) 

(SDEFUN |RDEPAR;normalize|
        ((|f| |Fraction| (|SparseUnivariatePolynomial| F))
         (|der| |Mapping| #1=(|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |List|
          (|Record| (|:| |fctr| (|SparseUnivariatePolynomial| F))
                    (|:| |xpnt| (|Integer|)))))
        (SPROG
         ((|rl|
           (|List|
            (|Record| (|:| |fctr| (|SparseUnivariatePolynomial| F))
                      (|:| |xpnt| (|Integer|)))))
          (|pi| #2=(|SparseUnivariatePolynomial| F)) (|m| (|Integer|))
          (|mu| (|Union| (|Integer|) "failed")) (#3=#:G161 NIL) (|rq| NIL)
          (|rql| (|List| (|Fraction| (|Integer|)))) (|r| (F)) (|dd1| #1#)
          (|zk| (|Kernel| F)) (|b| #4=(|SparseUnivariatePolynomial| F))
          (|a| #5=(|SparseUnivariatePolynomial| F))
          (|#G11|
           (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                     (|:| |coef2| (|SparseUnivariatePolynomial| F))))
          (#6=#:G150 NIL)
          (|eeu|
           (|Union| (|Record| (|:| |coef1| #5#) (|:| |coef2| #4#))
                    #7="failed"))
          (|d2| (|SparseUnivariatePolynomial| F)) (#8=#:G146 NIL)
          (|d1| (|SparseUnivariatePolynomial| F)) (|dd| #2#)
          (|d0| (|SparseUnivariatePolynomial| F)) (|g| #2#)
          (|d| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |d| (SPADCALL |f| |der| (QREFELT $ 14))
                . #9=(|RDEPAR;normalize|))
          (LETT |g| (SPADCALL |d| (SPADCALL |d| (QREFELT $ 21)) (QREFELT $ 20))
                . #9#)
          (LETT |d0|
                (PROG2 (LETT #8# (SPADCALL |d| |g| (QREFELT $ 23)) . #9#)
                    (QCDR #8#)
                  (|check_union2| (QEQCAR #8# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                   #10="failed")
                                  #8#))
                . #9#)
          (LETT |dd| (SPADCALL |d0| |g| (QREFELT $ 20)) . #9#)
          (LETT |d1|
                (PROG2 (LETT #8# (SPADCALL |d0| |dd| (QREFELT $ 23)) . #9#)
                    (QCDR #8#)
                  (|check_union2| (QEQCAR #8# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                   #10#)
                                  #8#))
                . #9#)
          (LETT |d2|
                (PROG2
                    (LETT #8#
                          (SPADCALL (SPADCALL |f| (QREFELT $ 15)) |d1|
                                    (QREFELT $ 23))
                          . #9#)
                    (QCDR #8#)
                  (|check_union2| (QEQCAR #8# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                   #10#)
                                  #8#))
                . #9#)
          (LETT |eeu|
                (SPADCALL |d2| |d1| (SPADCALL |f| (QREFELT $ 24))
                          (QREFELT $ 27))
                . #9#)
          (PROGN
           (LETT |#G11|
                 (PROG2 (LETT #6# |eeu| . #9#)
                     (QCDR #6#)
                   (|check_union2| (QEQCAR #6# 0)
                                   (|Record|
                                    (|:| |coef1|
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT $ 7)))
                                    (|:| |coef2|
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT $ 7))))
                                   (|Union|
                                    (|Record|
                                     (|:| |coef1|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7)))
                                     (|:| |coef2|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))))
                                    #7#)
                                   #6#))
                 . #9#)
           (LETT |a| (QCAR |#G11|) . #9#)
           (LETT |b| (QCDR |#G11|) . #9#)
           |#G11|)
          (LETT |zk| (SPADCALL (SPADCALL (QREFELT $ 29)) (QREFELT $ 31)) . #9#)
          (LETT |dd1| (SPADCALL |d1| |der|) . #9#)
          (LETT |r|
                (SPADCALL
                 (SPADCALL |a|
                           (SPADCALL (SPADCALL |zk| (QREFELT $ 33)) |dd1|
                                     (QREFELT $ 34))
                           (QREFELT $ 35))
                 |d1| (QREFELT $ 36))
                . #9#)
          (LETT |rql| (SPADCALL |r| |zk| (QREFELT $ 39)) . #9#)
          (LETT |rl| NIL . #9#)
          (SEQ (LETT |rq| NIL . #9#) (LETT #3# |rql| . #9#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |rq| (CAR #3#) . #9#) NIL))
                 (GO G191)))
               (SEQ (LETT |mu| (SPADCALL |rq| (QREFELT $ 42)) . #9#)
                    (EXIT
                     (COND
                      ((QEQCAR |mu| 0)
                       (SEQ (LETT |m| (QCDR |mu|) . #9#)
                            (EXIT
                             (COND
                              ((SPADCALL |m| 0 (QREFELT $ 47))
                               (SEQ
                                (LETT |pi|
                                      (SPADCALL
                                       (SPADCALL |a|
                                                 (SPADCALL
                                                  (SPADCALL |m| (QREFELT $ 48))
                                                  |dd1| (QREFELT $ 34))
                                                 (QREFELT $ 35))
                                       |d1| (QREFELT $ 20))
                                      . #9#)
                                (EXIT
                                 (LETT |rl| (CONS (CONS |pi| |m|) |rl|)
                                       . #9#)))))))))))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT |rl|)))) 

(SDEFUN |RDEPAR;RF_to_GP|
        ((|f| |Fraction| (|SparseUnivariatePolynomial| F))
         ($ |LaurentPolynomial| F (|SparseUnivariatePolynomial| F)))
        (SPROG ((#1=#:G163 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL |f| (QREFELT $ 24))
                                    (QREFELT $ 51))
                          (SPADCALL (SPADCALL |f| (QREFELT $ 15))
                                    (QREFELT $ 51))
                          (QREFELT $ 52))
                         |RDEPAR;RF_to_GP|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0)
                                 (|LaurentPolynomial| (QREFELT $ 7)
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT $ 7)))
                                 (|Union|
                                  (|LaurentPolynomial| (QREFELT $ 7)
                                                       (|SparseUnivariatePolynomial|
                                                        (QREFELT $ 7)))
                                  "failed")
                                 #1#)))) 

(SDEFUN |RDEPAR;do_spde1|
        ((|b| |SparseUnivariatePolynomial| F)
         (|lc| |List| (|SparseUnivariatePolynomial| F)) (|d| |Integer|)
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|get_rs| |Mapping| #1=(|Matrix| F) (|Matrix| F))
         ($ |List|
          (|Record| (|:| |ratpart| (|SparseUnivariatePolynomial| F))
                    (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#2=#:G181 NIL) (|kv| NIL) (#3=#:G180 NIL)
          (|lkv| (|List| (|Vector| F))) (|rs2| #1#) (|rs1| (|Matrix| F))
          (|lrem| (|List| (|SparseUnivariatePolynomial| F))) (#4=#:G178 NIL)
          (|a1| NIL) (#5=#:G179 NIL) (|c| NIL) (#6=#:G177 NIL)
          (|la| (|List| (|SparseUnivariatePolynomial| F))) (#7=#:G176 NIL)
          (#8=#:G175 NIL))
         (SEQ
          (LETT |la|
                (PROGN
                 (LETT #8# NIL . #9=(|RDEPAR;do_spde1|))
                 (SEQ (LETT |c| NIL . #9#) (LETT #7# |lc| . #9#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |c| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8#
                              (CONS
                               (QCAR
                                (SPADCALL |b| |c| |d| |der| (QREFELT $ 55)))
                               #8#)
                              . #9#)))
                      (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (LETT |lrem|
                (PROGN
                 (LETT #6# NIL . #9#)
                 (SEQ (LETT |c| NIL . #9#) (LETT #5# |lc| . #9#)
                      (LETT |a1| NIL . #9#) (LETT #4# |la| . #9#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |a1| (CAR #4#) . #9#) NIL)
                            (ATOM #5#) (PROGN (LETT |c| (CAR #5#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS
                               (SPADCALL
                                (SPADCALL (SPADCALL |a1| |der|)
                                          (SPADCALL |b| |a1| (QREFELT $ 56))
                                          (QREFELT $ 57))
                                |c| (QREFELT $ 35))
                               #6#)
                              . #9#)))
                      (LETT #4# (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #9#))
                            . #9#)
                      (GO G190) G191 (EXIT (NREVERSE #6#))))
                . #9#)
          (LETT |rs1|
                (SPADCALL (SPADCALL (LIST |lrem|) (QREFELT $ 60))
                          (QREFELT $ 63))
                . #9#)
          (LETT |rs2| (SPADCALL |rs1| |get_rs|) . #9#)
          (LETT |lkv| (SPADCALL |rs2| (QREFELT $ 65)) . #9#)
          (EXIT
           (PROGN
            (LETT #3# NIL . #9#)
            (SEQ (LETT |kv| NIL . #9#) (LETT #2# |lkv| . #9#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |kv| (CAR #2#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #3#
                         (CONS (CONS (SPADCALL |kv| |la| (QREFELT $ 69)) |kv|)
                               #3#)
                         . #9#)))
                 (LETT #2# (CDR #2#) . #9#) (GO G190) G191
                 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |RDEPAR;param_SPDE|
        ((|a| |SparseUnivariatePolynomial| F)
         (|b| |SparseUnivariatePolynomial| F)
         (|lc| |List| (|SparseUnivariatePolynomial| F)) (|d| |Integer|)
         (|der| |Mapping| #1=(|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|get_rs| |Mapping| #2=(|Matrix| F) (|Matrix| F)) (|x| |Symbol|)
         ($
          . #3=(|List|
                (|Record| (|:| |ratpart| (|SparseUnivariatePolynomial| F))
                          (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|nres|
           (|List|
            (|Record| (|:| |ratpart| (|SparseUnivariatePolynomial| F))
                      (|:| |coeffs| (|Vector| F)))))
          (|ans1| (|SparseUnivariatePolynomial| F)) (|bv| (|Vector| F))
          (#4=#:G231 NIL) (|be| NIL) (|s2| #3#) (|n2| (|NonNegativeInteger|))
          (|nlc| (|List| (|SparseUnivariatePolynomial| F))) (#5=#:G230 NIL)
          (|kv| NIL) (#6=#:G229 NIL) (|q| NIL) (#7=#:G228 NIL)
          (|lkv| (|List| (|Vector| F))) (|rs2| #2#) (|rs1| (|Matrix| F))
          (|lr| (|List| #8=(|SparseUnivariatePolynomial| F))) (#9=#:G227 NIL)
          (#10=#:G226 NIL)
          (|lq|
           (|List|
            (|Record| (|:| |quotient| (|SparseUnivariatePolynomial| F))
                      (|:| |remainder| #8#))))
          (#11=#:G225 NIL) (|c| NIL) (#12=#:G224 NIL)
          (|oans| #13=(|List| (|SparseUnivariatePolynomial| F)))
          (|aa| #14=(|SparseUnivariatePolynomial| F)) (#15=#:G201 NIL)
          (|g| #16=(|SparseUnivariatePolynomial| F))
          (|dres|
           (|Record| (|:| |ans| (|List| (|SparseUnivariatePolynomial| F)))
                     (|:| |acoeff| (|SparseUnivariatePolynomial| F))
                     (|:| |eegen| (|SparseUnivariatePolynomial| F))
                     (|:| |bpar| (|SparseUnivariatePolynomial| F))
                     (|:| |lcpar| (|List| (|SparseUnivariatePolynomial| F)))
                     (|:| |dpar| (|Integer|))))
          (#17=#:G223 NIL) (#18=#:G222 NIL)
          (|a1l| (|List| #19=(|SparseUnivariatePolynomial| F)))
          (#20=#:G221 NIL) (|rsol| NIL) (#21=#:G220 NIL)
          (|m1| (|Matrix| (|SparseUnivariatePolynomial| F))) (#22=#:G219 NIL)
          (#23=#:G218 NIL)
          (|lrs|
           (|List|
            (|Record| (|:| |ans| (|SparseUnivariatePolynomial| F))
                      (|:| |remainder| (|SparseUnivariatePolynomial| F)))))
          (|s1|
           (|Union|
            (|List|
             (|Record| (|:| |ans| #19#)
                       (|:| |remainder| (|SparseUnivariatePolynomial| F))))
            (|Record| (|:| |ans| #13#) (|:| |acoeff| #14#) (|:| |eegen| #16#)
                      (|:| |bpar| (|SparseUnivariatePolynomial| F))
                      (|:| |lcpar| (|List| (|SparseUnivariatePolynomial| F)))
                      (|:| |dpar| (|Integer|)))))
          (|n1| (|NonNegativeInteger|)) (|base_case| (|Boolean|))
          (|degt| (|Integer|)) (|dt| #1#))
         (SEQ
          (LETT |dt|
                (SPADCALL (SPADCALL (|spadConstant| $ 71) 1 (QREFELT $ 73))
                          |der|)
                . #24=(|RDEPAR;param_SPDE|))
          (EXIT
           (COND
            ((EQL (SPADCALL |a| (QREFELT $ 74)) 0)
             (COND
              ((SPADCALL |a| (|spadConstant| $ 75) (QREFELT $ 76))
               (|error| "param_SPDE: degree(a) = 0 but a ~= 1"))
              (#25='T
               (SEQ (LETT |degt| (- (SPADCALL |dt| (QREFELT $ 74)) 1) . #24#)
                    (LETT |base_case|
                          (SPADCALL |dt| (|spadConstant| $ 75) (QREFELT $ 77))
                          . #24#)
                    (EXIT
                     (COND
                      ((SPADCALL |b| (|spadConstant| $ 78) (QREFELT $ 77))
                       (|error| "param_SPDE: b = 0"))
                      ((OR |base_case|
                           (SPADCALL (SPADCALL |b| (QREFELT $ 74))
                                     (MAX 0 |degt|) (QREFELT $ 47)))
                       (|RDEPAR;do_spde1| |b| |lc| |d| |der| |get_rs| $))
                      ('T
                       (|error|
                        "param_SPDE: degree(a) = 0 unimplemented"))))))))
            (#25#
             (SEQ (LETT |n1| (LENGTH |lc|) . #24#)
                  (LETT |s1| (SPADCALL |a| |b| |lc| |d| |der| (QREFELT $ 83))
                        . #24#)
                  (EXIT
                   (COND
                    ((QEQCAR |s1| 0)
                     (SEQ (LETT |lrs| (QCDR |s1|) . #24#)
                          (LETT |m1|
                                (SPADCALL
                                 (LIST
                                  (PROGN
                                   (LETT #23# NIL . #24#)
                                   (SEQ (LETT |rsol| NIL . #24#)
                                        (LETT #22# |lrs| . #24#) G190
                                        (COND
                                         ((OR (ATOM #22#)
                                              (PROGN
                                               (LETT |rsol| (CAR #22#) . #24#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #23# (CONS (QCDR |rsol|) #23#)
                                                . #24#)))
                                        (LETT #22# (CDR #22#) . #24#) (GO G190)
                                        G191 (EXIT (NREVERSE #23#)))))
                                 (QREFELT $ 60))
                                . #24#)
                          (LETT |rs1| (SPADCALL |m1| (QREFELT $ 63)) . #24#)
                          (LETT |rs2| (SPADCALL |rs1| |get_rs|) . #24#)
                          (LETT |lkv| (SPADCALL |rs2| (QREFELT $ 65)) . #24#)
                          (LETT |a1l|
                                (PROGN
                                 (LETT #21# NIL . #24#)
                                 (SEQ (LETT |rsol| NIL . #24#)
                                      (LETT #20# |lrs| . #24#) G190
                                      (COND
                                       ((OR (ATOM #20#)
                                            (PROGN
                                             (LETT |rsol| (CAR #20#) . #24#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #21# (CONS (QCAR |rsol|) #21#)
                                              . #24#)))
                                      (LETT #20# (CDR #20#) . #24#) (GO G190)
                                      G191 (EXIT (NREVERSE #21#))))
                                . #24#)
                          (EXIT
                           (PROGN
                            (LETT #18# NIL . #24#)
                            (SEQ (LETT |kv| NIL . #24#)
                                 (LETT #17# |lkv| . #24#) G190
                                 (COND
                                  ((OR (ATOM #17#)
                                       (PROGN
                                        (LETT |kv| (CAR #17#) . #24#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #18#
                                         (CONS
                                          (CONS
                                           (SPADCALL |kv| |a1l| (QREFELT $ 69))
                                           |kv|)
                                          #18#)
                                         . #24#)))
                                 (LETT #17# (CDR #17#) . #24#) (GO G190) G191
                                 (EXIT (NREVERSE #18#)))))))
                    (#25#
                     (SEQ (LETT |dres| (QCDR |s1|) . #24#)
                          (LETT |g| (QVELT |dres| 2) . #24#)
                          (LETT |a|
                                (PROG2
                                    (LETT #15#
                                          (SPADCALL |a| |g| (QREFELT $ 23))
                                          . #24#)
                                    (QCDR #15#)
                                  (|check_union2| (QEQCAR #15# 0)
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 7))
                                                  (|Union|
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 7))
                                                   #26="failed")
                                                  #15#))
                                . #24#)
                          (LETT |b|
                                (PROG2
                                    (LETT #15#
                                          (SPADCALL (QVELT |dres| 3) |g|
                                                    (QREFELT $ 23))
                                          . #24#)
                                    (QCDR #15#)
                                  (|check_union2| (QEQCAR #15# 0)
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 7))
                                                  (|Union|
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 7))
                                                   #26#)
                                                  #15#))
                                . #24#)
                          (LETT |aa| (QVELT |dres| 1) . #24#)
                          (LETT |oans| (QVELT |dres| 0) . #24#)
                          (LETT |lq|
                                (PROGN
                                 (LETT #12# NIL . #24#)
                                 (SEQ (LETT |c| NIL . #24#)
                                      (LETT #11# (QVELT |dres| 4) . #24#) G190
                                      (COND
                                       ((OR (ATOM #11#)
                                            (PROGN
                                             (LETT |c| (CAR #11#) . #24#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #12#
                                              (CONS
                                               (SPADCALL |c| |g|
                                                         (QREFELT $ 85))
                                               #12#)
                                              . #24#)))
                                      (LETT #11# (CDR #11#) . #24#) (GO G190)
                                      G191 (EXIT (NREVERSE #12#))))
                                . #24#)
                          (LETT |lr|
                                (PROGN
                                 (LETT #10# NIL . #24#)
                                 (SEQ (LETT |q| NIL . #24#)
                                      (LETT #9# |lq| . #24#) G190
                                      (COND
                                       ((OR (ATOM #9#)
                                            (PROGN
                                             (LETT |q| (CAR #9#) . #24#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #10# (CONS (QCDR |q|) #10#)
                                              . #24#)))
                                      (LETT #9# (CDR #9#) . #24#) (GO G190)
                                      G191 (EXIT (NREVERSE #10#))))
                                . #24#)
                          (LETT |rs1|
                                (SPADCALL (SPADCALL (LIST |lr|) (QREFELT $ 60))
                                          (QREFELT $ 63))
                                . #24#)
                          (LETT |rs2| (SPADCALL |rs1| |get_rs|) . #24#)
                          (LETT |lkv| (SPADCALL |rs2| (QREFELT $ 65)) . #24#)
                          (EXIT
                           (COND ((NULL |lkv|) NIL)
                                 (#25#
                                  (SEQ
                                   (LETT |lc|
                                         (PROGN
                                          (LETT #7# NIL . #24#)
                                          (SEQ (LETT |q| NIL . #24#)
                                               (LETT #6# |lq| . #24#) G190
                                               (COND
                                                ((OR (ATOM #6#)
                                                     (PROGN
                                                      (LETT |q| (CAR #6#)
                                                            . #24#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #7#
                                                       (CONS (QCAR |q|) #7#)
                                                       . #24#)))
                                               (LETT #6# (CDR #6#) . #24#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #7#))))
                                         . #24#)
                                   (LETT |nlc| NIL . #24#)
                                   (SEQ (LETT |kv| NIL . #24#)
                                        (LETT #5# |lkv| . #24#) G190
                                        (COND
                                         ((OR (ATOM #5#)
                                              (PROGN
                                               (LETT |kv| (CAR #5#) . #24#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |nlc|
                                                (CONS
                                                 (SPADCALL |kv| |lc|
                                                           (QREFELT $ 69))
                                                 |nlc|)
                                                . #24#)))
                                        (LETT #5# (CDR #5#) . #24#) (GO G190)
                                        G191 (EXIT NIL))
                                   (LETT |nlc| (NREVERSE |nlc|) . #24#)
                                   (LETT |n2| (LENGTH |lkv|) . #24#)
                                   (LETT |s2|
                                         (|RDEPAR;param_SPDE| |a| |b| |nlc|
                                          (QVELT |dres| 5) |der| |get_rs| |x|
                                          $)
                                         . #24#)
                                   (LETT |nres| NIL . #24#)
                                   (SEQ (LETT |be| NIL . #24#)
                                        (LETT #4# |s2| . #24#) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN
                                               (LETT |be| (CAR #4#) . #24#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |bv|
                                               (SPADCALL (QCDR |be|) |lkv|
                                                         (QREFELT $ 86))
                                               . #24#)
                                         (LETT |ans1|
                                               (SPADCALL
                                                (SPADCALL |bv| |oans|
                                                          (QREFELT $ 69))
                                                (SPADCALL |aa| (QCAR |be|)
                                                          (QREFELT $ 56))
                                                (QREFELT $ 57))
                                               . #24#)
                                         (EXIT
                                          (LETT |nres|
                                                (CONS (CONS |ans1| |bv|)
                                                      |nres|)
                                                . #24#)))
                                        (LETT #4# (CDR #4#) . #24#) (GO G190)
                                        G191 (EXIT NIL))
                                   (EXIT (NREVERSE |nres|))))))))))))))))) 

(SDEFUN |RDEPAR;integer_vector|
        ((|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Union| (|Vector| (|Integer|)) "failed"))
        (SPROG
         ((#1=#:G241 NIL) (|i| NIL) (#2=#:G240 NIL) (|d| #3=(|Integer|))
          (|nv| #4=(|Vector| (|Fraction| (|Integer|))))
          (|#G40| (|Record| (|:| |num| #4#) (|:| |den| #3#))))
         (SEQ
          (PROGN
           (LETT |#G40| (SPADCALL |v| (QREFELT $ 90))
                 . #5=(|RDEPAR;integer_vector|))
           (LETT |nv| (QCAR |#G40|) . #5#)
           (LETT |d| (QCDR |#G40|) . #5#)
           |#G40|)
          (EXIT
           (COND
            ((OR (SPADCALL |d| 1 (QREFELT $ 91))
                 (SPADCALL (SPADCALL |nv| 1 (QREFELT $ 92))
                           (|spadConstant| $ 93) (QREFELT $ 94)))
             (CONS 1 "failed"))
            ('T
             (CONS 0
                   (SPADCALL
                    (PROGN
                     (LETT #2# NIL . #5#)
                     (SEQ (LETT |i| 1 . #5#) (LETT #1# (QVSIZE |nv|) . #5#)
                          G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL (SPADCALL |nv| |i| (QREFELT $ 92))
                                             (QREFELT $ 95))
                                   #2#)
                                  . #5#)))
                          (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (QREFELT $ 98))))))))) 

(SDEFUN |RDEPAR;do_SPDE_prim0|
        ((|b| F) (|lc| |List| (|SparseUnivariatePolynomial| F))
         (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|get_rs| |Mapping| (|Matrix| F) (|Matrix| F)) (|x| |Symbol|)
         ($ |List|
          (|Record|
           (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G292 NIL) (|ba| NIL) (#2=#:G293 NIL) (|bv| NIL) (#3=#:G291 NIL)
          (|lba| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|cb| (|List| (|Vector| F)))
          (|nlba| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#4=#:G265 NIL) (#5=#:G290 NIL) (|be| NIL) (#6=#:G289 NIL)
          (|cba| (|List| F)) (#7=#:G288 NIL) (#8=#:G287 NIL)
          (|ncb| (|List| (|Vector| F))) (#9=#:G286 NIL) (#10=#:G285 NIL)
          (|s2f|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|lgj1| (|List| F)) (|ff| (F)) (#11=#:G283 NIL) (#12=#:G284 NIL)
          (|aa| NIL) (|lgj| (|List| F)) (|gij| (F))
          (|gi| (|SparseUnivariatePolynomial| F)) (#13=#:G282 NIL) (|i| NIL)
          (|n1| (|NonNegativeInteger|)) (|j| NIL) (#14=#:G281 NIL)
          (#15=#:G280 NIL) (#16=#:G279 NIL) (#17=#:G278 NIL) (|dk| (F))
          (|d| (|Integer|)) (#18=#:G277 NIL) (|c| NIL) (#19=#:G276 NIL)
          (#20=#:G274 NIL) (#21=#:G275 NIL) (#22=#:G273 NIL) (#23=#:G272 NIL)
          (|vg2| (|Vector| (|SparseUnivariatePolynomial| F)))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |lc|) . #24=(|RDEPAR;do_SPDE_prim0|))
              (LETT |vg2| (SPADCALL |lc| (QREFELT $ 100)) . #24#)
              (LETT |cb|
                    (PROGN
                     (LETT #23# NIL . #24#)
                     (SEQ (LETT |i| 1 . #24#) (LETT #22# |n| . #24#) G190
                          (COND ((|greater_SI| |i| #22#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #23#
                                  (CONS (MAKEARR1 |n| (|spadConstant| $ 44))
                                        #23#)
                                  . #24#)))
                          (LETT |i| (|inc_SI| |i|) . #24#) (GO G190) G191
                          (EXIT (NREVERSE #23#))))
                    . #24#)
              (SEQ (LETT |bv| NIL . #24#) (LETT #21# |cb| . #24#)
                   (LETT |i| 1 . #24#) (LETT #20# |n| . #24#) G190
                   (COND
                    ((OR (|greater_SI| |i| #20#) (ATOM #21#)
                         (PROGN (LETT |bv| (CAR #21#) . #24#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |bv| |i| (|spadConstant| $ 71)
                               (QREFELT $ 101))))
                   (LETT |i|
                         (PROG1 (|inc_SI| |i|) (LETT #21# (CDR #21#) . #24#))
                         . #24#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |d|
                    (SPADCALL (ELT $ 102)
                              (PROGN
                               (LETT #19# NIL . #24#)
                               (SEQ (LETT |c| NIL . #24#)
                                    (LETT #18# |lc| . #24#) G190
                                    (COND
                                     ((OR (ATOM #18#)
                                          (PROGN
                                           (LETT |c| (CAR #18#) . #24#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #19#
                                            (CONS (SPADCALL |c| (QREFELT $ 74))
                                                  #19#)
                                            . #24#)))
                                    (LETT #18# (CDR #18#) . #24#) (GO G190)
                                    G191 (EXIT (NREVERSE #19#))))
                              0 (QREFELT $ 104))
                    . #24#)
              (LETT |dk|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 71) 1 (QREFELT $ 73)) |der|)
                     (QREFELT $ 105))
                    . #24#)
              (LETT |lba|
                    (PROGN
                     (LETT #17# NIL . #24#)
                     (SEQ (LETT |bv| NIL . #24#) (LETT #16# |cb| . #24#) G190
                          (COND
                           ((OR (ATOM #16#)
                                (PROGN (LETT |bv| (CAR #16#) . #24#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #17# (CONS (|spadConstant| $ 106) #17#)
                                  . #24#)))
                          (LETT #16# (CDR #16#) . #24#) (GO G190) G191
                          (EXIT (NREVERSE #17#))))
                    . #24#)
              (LETT |cba|
                    (PROGN
                     (LETT #15# NIL . #24#)
                     (SEQ (LETT |bv| NIL . #24#) (LETT #14# |cb| . #24#) G190
                          (COND
                           ((OR (ATOM #14#)
                                (PROGN (LETT |bv| (CAR #14#) . #24#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #15# (CONS (|spadConstant| $ 44) #15#)
                                  . #24#)))
                          (LETT #14# (CDR #14#) . #24#) (GO G190) G191
                          (EXIT (NREVERSE #15#))))
                    . #24#)
              (SEQ (LETT |j| |d| . #24#) G190 (COND ((< |j| 0) (GO G191)))
                   (SEQ (LETT |n1| (LENGTH |cb|) . #24#)
                        (LETT |lgj| NIL . #24#)
                        (SEQ (LETT |i| 1 . #24#) (LETT #13# |n| . #24#) G190
                             (COND ((|greater_SI| |i| #13#) (GO G191)))
                             (SEQ
                              (LETT |gi| (SPADCALL |vg2| |i| (QREFELT $ 107))
                                    . #24#)
                              (LETT |gij| (|spadConstant| $ 44) . #24#)
                              (COND
                               ((EQL (SPADCALL |gi| (QREFELT $ 74)) |j|)
                                (SEQ
                                 (LETT |gij| (SPADCALL |gi| (QREFELT $ 108))
                                       . #24#)
                                 (EXIT
                                  (SPADCALL |vg2| |i|
                                            (SPADCALL |gi| (QREFELT $ 109))
                                            (QREFELT $ 110))))))
                              (EXIT
                               (LETT |lgj|
                                     (CONS (SPADCALL |gij| (QREFELT $ 111))
                                           |lgj|)
                                     . #24#)))
                             (LETT |i| (|inc_SI| |i|) . #24#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |lgj| (NREVERSE |lgj|) . #24#)
                        (LETT |lgj1| NIL . #24#)
                        (SEQ (LETT |aa| NIL . #24#) (LETT #12# |cba| . #24#)
                             (LETT |bv| NIL . #24#) (LETT #11# |cb| . #24#)
                             G190
                             (COND
                              ((OR (ATOM #11#)
                                   (PROGN (LETT |bv| (CAR #11#) . #24#) NIL)
                                   (ATOM #12#)
                                   (PROGN (LETT |aa| (CAR #12#) . #24#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |ff|
                                    (SPADCALL
                                     (SPADCALL |bv| |lgj| (QREFELT $ 113))
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (+ |j| 1) (QREFELT $ 48)) |dk|
                                       (QREFELT $ 114))
                                      |aa| (QREFELT $ 114))
                                     (QREFELT $ 115))
                                    . #24#)
                              (EXIT (LETT |lgj1| (CONS |ff| |lgj1|) . #24#)))
                             (LETT #11#
                                   (PROG1 (CDR #11#)
                                     (LETT #12# (CDR #12#) . #24#))
                                   . #24#)
                             (GO G190) G191 (EXIT NIL))
                        (LETT |lgj1| (NREVERSE |lgj1|) . #24#)
                        (LETT |s2f|
                              (SPADCALL |b| |lgj1| |x| |lk| |ext| |logi|
                                        (QREFELT $ 122))
                              . #24#)
                        (LETT |ncb|
                              (PROGN
                               (LETT #10# NIL . #24#)
                               (SEQ (LETT |be| NIL . #24#)
                                    (LETT #9# |s2f| . #24#) G190
                                    (COND
                                     ((OR (ATOM #9#)
                                          (PROGN
                                           (LETT |be| (CAR #9#) . #24#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #10#
                                            (CONS
                                             (SPADCALL (QCDR |be|) |cb|
                                                       (QREFELT $ 86))
                                             #10#)
                                            . #24#)))
                                    (LETT #9# (CDR #9#) . #24#) (GO G190) G191
                                    (EXIT (NREVERSE #10#))))
                              . #24#)
                        (LETT |cba|
                              (PROGN
                               (LETT #8# NIL . #24#)
                               (SEQ (LETT |be| NIL . #24#)
                                    (LETT #7# |s2f| . #24#) G190
                                    (COND
                                     ((OR (ATOM #7#)
                                          (PROGN
                                           (LETT |be| (CAR #7#) . #24#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #8# (CONS (QCAR |be|) #8#)
                                            . #24#)))
                                    (LETT #7# (CDR #7#) . #24#) (GO G190) G191
                                    (EXIT (NREVERSE #8#))))
                              . #24#)
                        (LETT |nlba|
                              (PROGN
                               (LETT #6# NIL . #24#)
                               (SEQ (LETT |be| NIL . #24#)
                                    (LETT #5# |s2f| . #24#) G190
                                    (COND
                                     ((OR (ATOM #5#)
                                          (PROGN
                                           (LETT |be| (CAR #5#) . #24#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #6#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL (QCDR |be|) |lba|
                                                        (QREFELT $ 124))
                                              (SPADCALL
                                               (SPADCALL (QCAR |be|)
                                                         (PROG1
                                                             (LETT #4# |j|
                                                                   . #24#)
                                                           (|check_subtype2|
                                                            (>= #4# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #4#))
                                                         (QREFELT $ 73))
                                               (QREFELT $ 125))
                                              (QREFELT $ 126))
                                             #6#)
                                            . #24#)))
                                    (LETT #5# (CDR #5#) . #24#) (GO G190) G191
                                    (EXIT (NREVERSE #6#))))
                              . #24#)
                        (LETT |cb| |ncb| . #24#)
                        (EXIT (LETT |lba| |nlba| . #24#)))
                   (LETT |j| (+ |j| -1) . #24#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #3# NIL . #24#)
                (SEQ (LETT |bv| NIL . #24#) (LETT #2# |cb| . #24#)
                     (LETT |ba| NIL . #24#) (LETT #1# |lba| . #24#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |ba| (CAR #1#) . #24#) NIL)
                           (ATOM #2#) (PROGN (LETT |bv| (CAR #2#) . #24#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (LETT #3# (CONS (CONS |ba| |bv|) #3#) . #24#)))
                     (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #24#))
                           . #24#)
                     (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |RDEPAR;do_ext|
        ((|ext| |Mapping|
          #1=(|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|lcr| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|k| |Kernel| F) (|lk| |List| (|Kernel| F))
         ($ |List|
          (|Record|
           (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#2=#:G302 NIL) (|be| NIL) (#3=#:G301 NIL) (|res1| #1#)
          (|lc| (|List| F)) (#4=#:G300 NIL) (|cr| NIL) (#5=#:G299 NIL))
         (SEQ
          (LETT |lc|
                (PROGN
                 (LETT #5# NIL . #6=(|RDEPAR;do_ext|))
                 (SEQ (LETT |cr| NIL . #6#) (LETT #4# |lcr| . #6#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |cr| (CAR #4#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5#
                              (CONS (SPADCALL |cr| |k| (QREFELT $ 128)) #5#)
                              . #6#)))
                      (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #6#)
          (LETT |res1| (SPADCALL |lk| |lc| |ext|) . #6#)
          (EXIT
           (PROGN
            (LETT #3# NIL . #6#)
            (SEQ (LETT |be| NIL . #6#) (LETT #2# |res1| . #6#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |be| (CAR #2#) . #6#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #3#
                         (CONS
                          (CONS (SPADCALL (QCAR |be|) |k| (QREFELT $ 130))
                                (QCDR |be|))
                          #3#)
                         . #6#)))
                 (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |RDEPAR;do_SPDE_prim|
        ((|a| |SparseUnivariatePolynomial| F)
         (|bbr| |Fraction| (|SparseUnivariatePolynomial| F))
         (|lcr| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|k| |Kernel| F) (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          #1=(|Record| (|:| |logands| #2=(|List| F))
                       (|:| |basis|
                            #3=(|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|get_rs| |Mapping| (|Matrix| F) (|Matrix| F)) (|x| |Symbol|)
         ($ |List|
          (|Record|
           (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#4=#:G346 NIL) (|re| NIL) (#5=#:G345 NIL)
          (|res1|
           (|List|
            (|Record| (|:| |ratpart| (|SparseUnivariatePolynomial| F))
                      (|:| |coeffs| (|Vector| F)))))
          (|n| (|Integer|)) (|mu| (|Union| (|Integer|) "failed")) (|mf| (F))
          (|r0|
           (|Union| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))
                    "failed"))
          (|f1| (F)) (|b1| (|SparseUnivariatePolynomial| F)) (|f0| (F))
          (|bvu| (|Union| (|Vector| (|Integer|)) "failed"))
          (|bv| (|Vector| (|Fraction| (|Integer|)))) (|bl| #3#) (|ll| #2#)
          (|#G83| #1#) (|dc| (|Integer|)) (#6=#:G344 NIL) (|c| NIL)
          (#7=#:G343 NIL) (|db| #8=(|NonNegativeInteger|)) (|da| #8#)
          (|lc| (|List| (|SparseUnivariatePolynomial| F))) (#9=#:G342 NIL)
          (|cr| NIL) (#10=#:G341 NIL) (|b| (|SparseUnivariatePolynomial| F))
          (|base_case| (|Boolean|)) (|fp| (F)))
         (SEQ
          (LETT |fp|
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| $ 71) 1 (QREFELT $ 73))
                           |der|)
                 (QREFELT $ 105))
                . #11=(|RDEPAR;do_SPDE_prim|))
          (LETT |base_case|
                (SPADCALL |fp| (|spadConstant| $ 71) (QREFELT $ 131)) . #11#)
          (LETT |b| (SPADCALL |bbr| (QREFELT $ 132)) . #11#)
          (LETT |lc|
                (PROGN
                 (LETT #10# NIL . #11#)
                 (SEQ (LETT |cr| NIL . #11#) (LETT #9# |lcr| . #11#) G190
                      (COND
                       ((OR (ATOM #9#)
                            (PROGN (LETT |cr| (CAR #9#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10# (CONS (SPADCALL |cr| (QREFELT $ 132)) #10#)
                              . #11#)))
                      (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #10#))))
                . #11#)
          (LETT |da| (SPADCALL |a| (QREFELT $ 74)) . #11#)
          (LETT |db| (SPADCALL |b| (QREFELT $ 74)) . #11#)
          (LETT |dc|
                (SPADCALL (ELT $ 102)
                          (PROGN
                           (LETT #7# NIL . #11#)
                           (SEQ (LETT |c| NIL . #11#) (LETT #6# |lc| . #11#)
                                G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |c| (CAR #6#) . #11#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #7#
                                        (CONS (SPADCALL |c| (QREFELT $ 74))
                                              #7#)
                                        . #11#)))
                                (LETT #6# (CDR #6#) . #11#) (GO G190) G191
                                (EXIT (NREVERSE #7#))))
                          (QREFELT $ 133))
                . #11#)
          (COND
           ((NULL |base_case|)
            (COND
             ((EQL |da| 0)
              (COND
               ((EQL |db| 0)
                (EXIT
                 (SEQ
                  (LETT |b1|
                        (SPADCALL (SPADCALL |b| (QREFELT $ 105))
                                  (SPADCALL |a| (QREFELT $ 105))
                                  (QREFELT $ 134))
                        . #11#)
                  (EXIT
                   (COND
                    ((SPADCALL |b1| (|spadConstant| $ 44) (QREFELT $ 131))
                     (|RDEPAR;do_ext| |ext| |lcr| |k| |lk| $))
                    (#12='T
                     (SEQ
                      (PROGN
                       (LETT |#G83| (SPADCALL |lk| (LIST |b1|) |logi|) . #11#)
                       (LETT |ll| (QCAR |#G83|) . #11#)
                       (LETT |bl| (QCDR |#G83|) . #11#)
                       |#G83|)
                      (COND
                       ((NULL (NULL |bl|))
                        (SEQ (LETT |bv| (|SPADfirst| |bl|) . #11#)
                             (LETT |bvu| (|RDEPAR;integer_vector| |bv| $)
                                   . #11#)
                             (EXIT
                              (COND
                               ((QEQCAR |bvu| 0)
                                (|error| "need transform and call ext")))))))
                      (EXIT
                       (|RDEPAR;do_SPDE_prim0| |b1| |lc| |lk| |ext| |logi|
                        |der| |get_rs| |x| $))))))))))))))
          (LETT |n|
                (COND
                 ((SPADCALL |db| |da| (QREFELT $ 135)) (MAX 0 (- |dc| |db|)))
                 (#12# (MAX 0 (+ (- |dc| |da|) 1))))
                . #11#)
          (COND
           ((EQL |da| (+ |db| 1))
            (SEQ
             (LETT |f0|
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT $ 108))
                              (SPADCALL |a| (QREFELT $ 108)) (QREFELT $ 134))
                    (QREFELT $ 111))
                   . #11#)
             (EXIT
              (COND
               (|base_case|
                (SEQ (LETT |mu| (SPADCALL |f0| (QREFELT $ 136)) . #11#)
                     (EXIT
                      (COND
                       ((QEQCAR |mu| 0)
                        (LETT |n| (MAX |n| (QCDR |mu|)) . #11#))))))
               (#12#
                (SEQ
                 (LETT |r0|
                       (QCAR
                        (SPADCALL
                         (SPADCALL |lk|
                                   (LIST (SPADCALL |f0| (QREFELT $ 111)) |fp|)
                                   |ext|)
                         (QREFELT $ 139)))
                       . #11#)
                 (EXIT
                  (COND
                   ((NULL (QEQCAR |r0| 1))
                    (SEQ
                     (LETT |mf| (SPADCALL (QCDR (QCDR |r0|)) 1 (QREFELT $ 140))
                           . #11#)
                     (LETT |mu| (SPADCALL |mf| (QREFELT $ 136)) . #11#)
                     (EXIT
                      (COND
                       ((QEQCAR |mu| 0)
                        (LETT |n| (MAX |n| (QCDR |mu|)) . #11#)))))))))))))))
          (COND
           ((NULL |base_case|)
            (COND
             ((EQL |da| |db|)
              (SEQ
               (LETT |f0|
                     (SPADCALL
                      (SPADCALL (SPADCALL |b| (QREFELT $ 108))
                                (SPADCALL |a| (QREFELT $ 108)) (QREFELT $ 134))
                      (QREFELT $ 111))
                     . #11#)
               (LETT |b1|
                     (SPADCALL (SPADCALL |f0| |a| (QREFELT $ 34)) |b|
                               (QREFELT $ 57))
                     . #11#)
               (EXIT
                (COND
                 ((EQL (+ (SPADCALL |b1| (QREFELT $ 74)) 1) |da|)
                  (SEQ
                   (LETT |f1|
                         (SPADCALL
                          (SPADCALL (SPADCALL |b1| (QREFELT $ 108))
                                    (SPADCALL |a| (QREFELT $ 108))
                                    (QREFELT $ 134))
                          (QREFELT $ 111))
                         . #11#)
                   (LETT |r0|
                         (QCAR
                          (SPADCALL
                           (SPADCALL |lk|
                                     (LIST (SPADCALL |f1| (QREFELT $ 111))
                                           |fp|)
                                     |ext|)
                           (QREFELT $ 139)))
                         . #11#)
                   (EXIT
                    (COND
                     ((NULL (QEQCAR |r0| 1))
                      (SEQ
                       (LETT |mf|
                             (SPADCALL (QCDR (QCDR |r0|)) 1 (QREFELT $ 140))
                             . #11#)
                       (LETT |mu| (SPADCALL |mf| (QREFELT $ 136)) . #11#)
                       (EXIT
                        (COND
                         ((QEQCAR |mu| 0)
                          (LETT |n| (MAX |n| (QCDR |mu|))
                                . #11#)))))))))))))))))
          (LETT |res1|
                (|RDEPAR;param_SPDE| |a| |b| |lc| |n| |der| |get_rs| |x| $)
                . #11#)
          (EXIT
           (PROGN
            (LETT #5# NIL . #11#)
            (SEQ (LETT |re| NIL . #11#) (LETT #4# |res1| . #11#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |re| (CAR #4#) . #11#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #5#
                         (CONS
                          (CONS (SPADCALL (QCAR |re|) (QREFELT $ 125))
                                (QCDR |re|))
                          #5#)
                         . #11#)))
                 (LETT #4# (CDR #4#) . #11#) (GO G190) G191
                 (EXIT (NREVERSE #5#)))))))) 

(SDEFUN |RDEPAR;do_SPDE_exp0|
        ((|a| F) (|b| F)
         (|lcr| |List|
          (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F)))
         (|lk| |List| (|Kernel| F)) (|eta| F)
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         (|x| |Symbol|)
         ($ |List|
          (|Record|
           (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G390 NIL) (|re| NIL) (#2=#:G391 NIL) (|bv| NIL) (#3=#:G389 NIL)
          (|j| #4=(|Integer|))
          (|lba|
           (|List| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F))))
          (|cb| (|List| (|Vector| F)))
          (|nlba|
           (|List| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F))))
          (#5=#:G388 NIL) (|be| NIL) (#6=#:G387 NIL)
          (|ncb| (|List| (|Vector| F))) (#7=#:G386 NIL) (#8=#:G385 NIL)
          (|s2f|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|lgj1| (|List| F)) (|ff| (F)) (#9=#:G384 NIL) (|lgj| (|List| F))
          (#10=#:G374 NIL) (|gij| (F)) (|last_iter| (|Boolean|))
          (|gi| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F)))
          (#11=#:G383 NIL) (|i| NIL) (|n1| (|NonNegativeInteger|)) (|f0| (F))
          (|d| #4#) (#12=#:G382 NIL) (|cr| NIL) (#13=#:G381 NIL)
          (#14=#:G380 NIL) (#15=#:G379 NIL) (#16=#:G377 NIL) (#17=#:G378 NIL)
          (#18=#:G376 NIL) (#19=#:G375 NIL)
          (|vg2|
           (|Vector| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F))))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |lcr|) . #20=(|RDEPAR;do_SPDE_exp0|))
              (LETT |vg2| (SPADCALL |lcr| (QREFELT $ 143)) . #20#)
              (LETT |cb|
                    (PROGN
                     (LETT #19# NIL . #20#)
                     (SEQ (LETT |cr| NIL . #20#) (LETT #18# |lcr| . #20#) G190
                          (COND
                           ((OR (ATOM #18#)
                                (PROGN (LETT |cr| (CAR #18#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #19#
                                  (CONS (MAKEARR1 |n| (|spadConstant| $ 44))
                                        #19#)
                                  . #20#)))
                          (LETT #18# (CDR #18#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #19#))))
                    . #20#)
              (SEQ (LETT |bv| NIL . #20#) (LETT #17# |cb| . #20#)
                   (LETT |i| 1 . #20#) (LETT #16# |n| . #20#) G190
                   (COND
                    ((OR (|greater_SI| |i| #16#) (ATOM #17#)
                         (PROGN (LETT |bv| (CAR #17#) . #20#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |bv| |i| (|spadConstant| $ 71)
                               (QREFELT $ 101))))
                   (LETT |i|
                         (PROG1 (|inc_SI| |i|) (LETT #17# (CDR #17#) . #20#))
                         . #20#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |lba|
                    (PROGN
                     (LETT #15# NIL . #20#)
                     (SEQ (LETT |cr| NIL . #20#) (LETT #14# |lcr| . #20#) G190
                          (COND
                           ((OR (ATOM #14#)
                                (PROGN (LETT |cr| (CAR #14#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #15# (CONS (|spadConstant| $ 144) #15#)
                                  . #20#)))
                          (LETT #14# (CDR #14#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #15#))))
                    . #20#)
              (LETT |d|
                    (SPADCALL (ELT $ 102)
                              (PROGN
                               (LETT #13# NIL . #20#)
                               (SEQ (LETT |cr| NIL . #20#)
                                    (LETT #12# |lcr| . #20#) G190
                                    (COND
                                     ((OR (ATOM #12#)
                                          (PROGN
                                           (LETT |cr| (CAR #12#) . #20#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #13#
                                            (CONS
                                             (SPADCALL |cr| (QREFELT $ 145))
                                             #13#)
                                            . #20#)))
                                    (LETT #12# (CDR #12#) . #20#) (GO G190)
                                    G191 (EXIT (NREVERSE #13#))))
                              (QREFELT $ 133))
                    . #20#)
              (LETT |j| |d| . #20#)
              (LETT |f0| (SPADCALL |b| |a| (QREFELT $ 134)) . #20#)
              (SEQ
               (EXIT
                (SEQ G190 NIL
                     (SEQ (LETT |last_iter| 'T . #20#)
                          (LETT |n1| (LENGTH |cb|) . #20#)
                          (LETT |lgj| NIL . #20#)
                          (SEQ (LETT |i| 1 . #20#) (LETT #11# |n| . #20#) G190
                               (COND ((|greater_SI| |i| #11#) (GO G191)))
                               (SEQ
                                (LETT |gi| (SPADCALL |vg2| |i| (QREFELT $ 146))
                                      . #20#)
                                (LETT |gij| (|spadConstant| $ 44) . #20#)
                                (COND
                                 ((SPADCALL |gi| (|spadConstant| $ 144)
                                            (QREFELT $ 147))
                                  (SEQ (LETT |last_iter| 'NIL . #20#)
                                       (EXIT
                                        (COND
                                         ((EQL (SPADCALL |gi| (QREFELT $ 145))
                                               |j|)
                                          (SEQ
                                           (LETT |gij|
                                                 (SPADCALL |gi|
                                                           (QREFELT $ 148))
                                                 . #20#)
                                           (EXIT
                                            (SPADCALL |vg2| |i|
                                                      (SPADCALL |gi|
                                                                (QREFELT $
                                                                         149))
                                                      (QREFELT $ 150))))))))))
                                (EXIT (LETT |lgj| (CONS |gij| |lgj|) . #20#)))
                               (LETT |i| (|inc_SI| |i|) . #20#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (COND
                            (|last_iter|
                             (PROGN
                              (LETT #10# |$NoValue| . #20#)
                              (GO #21=#:G370)))
                            ('T
                             (SEQ (LETT |lgj| (NREVERSE |lgj|) . #20#)
                                  (LETT |lgj1| NIL . #20#)
                                  (SEQ (LETT |bv| NIL . #20#)
                                       (LETT #9# |cb| . #20#) G190
                                       (COND
                                        ((OR (ATOM #9#)
                                             (PROGN
                                              (LETT |bv| (CAR #9#) . #20#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |ff|
                                              (SPADCALL |bv| |lgj|
                                                        (QREFELT $ 113))
                                              . #20#)
                                        (EXIT
                                         (LETT |lgj1|
                                               (CONS
                                                (SPADCALL |ff| (QREFELT $ 111))
                                                |lgj1|)
                                               . #20#)))
                                       (LETT #9# (CDR #9#) . #20#) (GO G190)
                                       G191 (EXIT NIL))
                                  (LETT |lgj1| (NREVERSE |lgj1|) . #20#)
                                  (LETT |s2f|
                                        (SPADCALL
                                         (SPADCALL |f0|
                                                   (SPADCALL
                                                    (SPADCALL |j|
                                                              (QREFELT $ 48))
                                                    |eta| (QREFELT $ 114))
                                                   (QREFELT $ 115))
                                         |lgj1| |x| |lk| |ext| |logi|
                                         (QREFELT $ 122))
                                        . #20#)
                                  (LETT |ncb|
                                        (PROGN
                                         (LETT #8# NIL . #20#)
                                         (SEQ (LETT |be| NIL . #20#)
                                              (LETT #7# |s2f| . #20#) G190
                                              (COND
                                               ((OR (ATOM #7#)
                                                    (PROGN
                                                     (LETT |be| (CAR #7#)
                                                           . #20#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #8#
                                                      (CONS
                                                       (SPADCALL (QCDR |be|)
                                                                 |cb|
                                                                 (QREFELT $
                                                                          86))
                                                       #8#)
                                                      . #20#)))
                                              (LETT #7# (CDR #7#) . #20#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #8#))))
                                        . #20#)
                                  (LETT |nlba|
                                        (PROGN
                                         (LETT #6# NIL . #20#)
                                         (SEQ (LETT |be| NIL . #20#)
                                              (LETT #5# |s2f| . #20#) G190
                                              (COND
                                               ((OR (ATOM #5#)
                                                    (PROGN
                                                     (LETT |be| (CAR #5#)
                                                           . #20#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #6#
                                                      (CONS
                                                       (SPADCALL
                                                        (SPADCALL (QCDR |be|)
                                                                  |lba|
                                                                  (QREFELT $
                                                                           151))
                                                        (SPADCALL (QCAR |be|)
                                                                  |j|
                                                                  (QREFELT $
                                                                           152))
                                                        (QREFELT $ 153))
                                                       #6#)
                                                      . #20#)))
                                              (LETT #5# (CDR #5#) . #20#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #6#))))
                                        . #20#)
                                  (LETT |cb| |ncb| . #20#)
                                  (LETT |lba| |nlba| . #20#)
                                  (EXIT (LETT |j| (- |j| 1) . #20#)))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #21# (EXIT #10#))
              (EXIT
               (PROGN
                (LETT #3# NIL . #20#)
                (SEQ (LETT |bv| NIL . #20#) (LETT #2# |cb| . #20#)
                     (LETT |re| NIL . #20#) (LETT #1# |lba| . #20#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |re| (CAR #1#) . #20#) NIL)
                           (ATOM #2#) (PROGN (LETT |bv| (CAR #2#) . #20#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #3#
                             (CONS (CONS (SPADCALL |re| (QREFELT $ 154)) |bv|)
                                   #3#)
                             . #20#)))
                     (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #20#))
                           . #20#)
                     (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |RDEPAR;exp_lower_bound;SupLp2ILFMI;11|
        ((|a| |SparseUnivariatePolynomial| F)
         (|b| |LaurentPolynomial| F (|SparseUnivariatePolynomial| F))
         (|ob| |Integer|) (|nc0| |Integer|) (|lk| |List| (|Kernel| F))
         (|eta| F)
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($ |Integer|))
        (SPROG
         ((|nu| (|Union| (|Integer|) "failed"))
          (|bv| (|Vector| (|Fraction| (|Integer|))))
          (|bl| #1=(|List| (|Vector| (|Fraction| (|Integer|)))))
          (|ll| #2=(|List| F))
          (|#G113| (|Record| (|:| |logands| #2#) (|:| |basis| #1#))) (|c0| (F))
          (|n0| (|Integer|)))
         (SEQ
          (COND ((< |ob| 0) (MIN 0 (- |nc0| |ob|)))
                (#3='T
                 (SEQ
                  (LETT |n0| (MIN 0 |nc0|)
                        . #4=(|RDEPAR;exp_lower_bound;SupLp2ILFMI;11|))
                  (EXIT
                   (COND ((< 0 |ob|) |n0|)
                         (#3#
                          (SEQ
                           (LETT |c0|
                                 (SPADCALL (SPADCALL |b| 0 (QREFELT $ 155))
                                           (SPADCALL |a| 0 (QREFELT $ 156))
                                           (QREFELT $ 134))
                                 . #4#)
                           (PROGN
                            (LETT |#G113|
                                  (SPADCALL |lk| (LIST |c0| |eta|) |logi|)
                                  . #4#)
                            (LETT |ll| (QCAR |#G113|) . #4#)
                            (LETT |bl| (QCDR |#G113|) . #4#)
                            |#G113|)
                           (EXIT
                            (COND ((NULL |bl|) |n0|)
                                  (#3#
                                   (SEQ (LETT |bv| (|SPADfirst| |bl|) . #4#)
                                        (LETT |nu|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |bv| 2
                                                          (QREFELT $ 92))
                                                (SPADCALL |bv| 1
                                                          (QREFELT $ 92))
                                                (QREFELT $ 161))
                                               (QREFELT $ 42))
                                              . #4#)
                                        (EXIT
                                         (COND ((QEQCAR |nu| 1) |n0|)
                                               (#3#
                                                (MIN (QCDR |nu|)
                                                     |n0|)))))))))))))))))) 

(SDEFUN |RDEPAR;exp_upper_bound|
        ((|a| |SparseUnivariatePolynomial| F)
         (|b| |SparseUnivariatePolynomial| F) (|nc1| |Integer|)
         (|lk| |List| (|Kernel| F)) (|eta| F)
         (|logi| |Mapping|
          #1=(|Record| (|:| |logands| #2=(|List| F))
                       (|:| |basis|
                            #3=(|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($ |Integer|))
        (SPROG
         ((|nu| (|Union| (|Integer|) "failed"))
          (|bv| (|Vector| (|Fraction| (|Integer|)))) (|bl| #3#) (|ll| #2#)
          (|#G120| #1#) (|c1| (F)) (|n0| (|Integer|))
          (|db| #4=(|NonNegativeInteger|)) (|da| #4#))
         (SEQ
          (LETT |da| (SPADCALL |a| (QREFELT $ 74))
                . #5=(|RDEPAR;exp_upper_bound|))
          (LETT |db| (SPADCALL |b| (QREFELT $ 74)) . #5#)
          (EXIT
           (COND ((< |da| |db|) (- |nc1| |db|))
                 (#6='T
                  (SEQ (LETT |n0| (MAX 0 (- |nc1| |da|)) . #5#)
                       (EXIT
                        (COND ((< |db| |da|) |n0|)
                              (#6#
                               (SEQ
                                (LETT |c1|
                                      (SPADCALL (SPADCALL |b| (QREFELT $ 108))
                                                (SPADCALL |a| (QREFELT $ 108))
                                                (QREFELT $ 134))
                                      . #5#)
                                (PROGN
                                 (LETT |#G120|
                                       (SPADCALL |lk| (LIST |c1| |eta|) |logi|)
                                       . #5#)
                                 (LETT |ll| (QCAR |#G120|) . #5#)
                                 (LETT |bl| (QCDR |#G120|) . #5#)
                                 |#G120|)
                                (EXIT
                                 (COND ((NULL |bl|) |n0|)
                                       (#6#
                                        (SEQ
                                         (LETT |bv| (|SPADfirst| |bl|) . #5#)
                                         (LETT |nu|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |bv| 2
                                                           (QREFELT $ 92))
                                                 (SPADCALL |bv| 1
                                                           (QREFELT $ 92))
                                                 (QREFELT $ 161))
                                                (QREFELT $ 42))
                                               . #5#)
                                         (EXIT
                                          (COND ((QEQCAR |nu| 1) |n0|)
                                                (#6#
                                                 (MAX (QCDR |nu|)
                                                      |n0|))))))))))))))))))) 

(SDEFUN |RDEPAR;do_SPDE_exp|
        ((|a| |SparseUnivariatePolynomial| F)
         (|bbr| |Fraction| (|SparseUnivariatePolynomial| F))
         (|lcr| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|get_rs| |Mapping| (|Matrix| F) (|Matrix| F)) (|x| |Symbol|)
         ($ |List|
          (|Record|
           (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G455 NIL) (|re| NIL) (#2=#:G454 NIL)
          (|tt| (|Fraction| (|SparseUnivariatePolynomial| F))) (#3=#:G440 NIL)
          (|res1|
           (|List|
            (|Record| (|:| |ratpart| (|SparseUnivariatePolynomial| F))
                      (|:| |coeffs| (|Vector| F)))))
          (|n1| (|Integer|)) (|nc1| #4=(|Integer|)) (#5=#:G453 NIL) (|cu| NIL)
          (#6=#:G452 NIL) (|lcu| (|List| #7=(|SparseUnivariatePolynomial| F)))
          (#8=#:G451 NIL) (|c| NIL) (#9=#:G450 NIL)
          (|lc|
           (|List|
            #10=(|LaurentPolynomial| F (|SparseUnivariatePolynomial| F))))
          (#11=#:G449 NIL) (#12=#:G448 NIL)
          (|t1| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F)))
          (#13=#:G428 NIL) (|m0| (|Integer|)) (|bu| #7#) (|b| #10#)
          (#14=#:G426 NIL) (|n0| (|Integer|)) (|eta| (F)) (#15=#:G414 NIL)
          (|nc0| #4#) (#16=#:G447 NIL) (#17=#:G446 NIL) (|nb0| (|Integer|))
          (#18=#:G445 NIL) (|cr| NIL) (#19=#:G444 NIL))
         (SEQ
          (LETT |b| (|RDEPAR;RF_to_GP| |bbr| $) . #20=(|RDEPAR;do_SPDE_exp|))
          (LETT |lc|
                (PROGN
                 (LETT #19# NIL . #20#)
                 (SEQ (LETT |cr| NIL . #20#) (LETT #18# |lcr| . #20#) G190
                      (COND
                       ((OR (ATOM #18#)
                            (PROGN (LETT |cr| (CAR #18#) . #20#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #19# (CONS (|RDEPAR;RF_to_GP| |cr| $) #19#)
                              . #20#)))
                      (LETT #18# (CDR #18#) . #20#) (GO G190) G191
                      (EXIT (NREVERSE #19#))))
                . #20#)
          (LETT |nb0| (SPADCALL |b| (QREFELT $ 163)) . #20#)
          (LETT |nc0|
                (SPADCALL (ELT $ 164)
                          (PROGN
                           (LETT #17# NIL . #20#)
                           (SEQ (LETT |c| NIL . #20#) (LETT #16# |lc| . #20#)
                                G190
                                (COND
                                 ((OR (ATOM #16#)
                                      (PROGN (LETT |c| (CAR #16#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #17#
                                        (CONS (SPADCALL |c| (QREFELT $ 163))
                                              #17#)
                                        . #20#)))
                                (LETT #16# (CDR #16#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #17#))))
                          (QREFELT $ 133))
                . #20#)
          (LETT |eta|
                (SPADCALL
                 (PROG2
                     (LETT #15#
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 71) 1 (QREFELT $ 73))
                             |der|)
                            (SPADCALL (|spadConstant| $ 71) 1 (QREFELT $ 73))
                            (QREFELT $ 23))
                           . #20#)
                     (QCDR #15#)
                   (|check_union2| (QEQCAR #15# 0)
                                   (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                   (|Union|
                                    (|SparseUnivariatePolynomial|
                                     (QREFELT $ 7))
                                    "failed")
                                   #15#))
                 (QREFELT $ 105))
                . #20#)
          (COND
           ((EQL (SPADCALL |a| (QREFELT $ 74)) 0)
            (COND
             ((EQL (SPADCALL |b| (QREFELT $ 145)) 0)
              (COND
               ((EQL |nb0| 0)
                (EXIT
                 (|RDEPAR;do_SPDE_exp0| (SPADCALL |a| (QREFELT $ 105))
                  (SPADCALL |b| (QREFELT $ 165)) |lc| |lk| |eta| |ext| |logi|
                  |x| $))))))))
          (LETT |n0|
                (SPADCALL |a| |b| |nb0| |nc0| |lk| |eta| |logi|
                          (QREFELT $ 162))
                . #20#)
          (COND
           ((< |n0| 0)
            (LETT |b|
                  (SPADCALL |b|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |n0| (QREFELT $ 48)) |eta|
                                        (QREFELT $ 114))
                              (QREFELT $ 166))
                             (SPADCALL |a| (QREFELT $ 51)) (QREFELT $ 167))
                            (QREFELT $ 153))
                  . #20#)))
          (COND
           ((< |nb0| 0)
            (SEQ
             (LETT |t1|
                   (SPADCALL (|spadConstant| $ 71)
                             (PROG1 (LETT #14# (- |nb0|) . #20#)
                               (|check_subtype2| (>= #14# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #14#))
                             (QREFELT $ 73))
                   . #20#)
             (LETT |b|
                   (SPADCALL (SPADCALL |t1| (QREFELT $ 51)) |b|
                             (QREFELT $ 167))
                   . #20#)
             (EXIT (LETT |a| (SPADCALL |t1| |a| (QREFELT $ 56)) . #20#)))))
          (LETT |bu| (SPADCALL |b| (QREFELT $ 168)) . #20#)
          (LETT |m0| (+ (MIN 0 |n0|) (MIN 0 |nb0|)) . #20#)
          (COND
           ((< |m0| 0)
            (SEQ
             (LETT |t1|
                   (SPADCALL (|spadConstant| $ 71)
                             (PROG1 (LETT #13# (- |m0|) . #20#)
                               (|check_subtype2| (>= #13# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #13#))
                             (QREFELT $ 152))
                   . #20#)
             (EXIT
              (LETT |lc|
                    (PROGN
                     (LETT #12# NIL . #20#)
                     (SEQ (LETT |c| NIL . #20#) (LETT #11# |lc| . #20#) G190
                          (COND
                           ((OR (ATOM #11#)
                                (PROGN (LETT |c| (CAR #11#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #12#
                                  (CONS (SPADCALL |t1| |c| (QREFELT $ 167))
                                        #12#)
                                  . #20#)))
                          (LETT #11# (CDR #11#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #12#))))
                    . #20#)))))
          (LETT |lcu|
                (PROGN
                 (LETT #9# NIL . #20#)
                 (SEQ (LETT |c| NIL . #20#) (LETT #8# |lc| . #20#) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |c| (CAR #8#) . #20#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #9# (CONS (SPADCALL |c| (QREFELT $ 168)) #9#)
                              . #20#)))
                      (LETT #8# (CDR #8#) . #20#) (GO G190) G191
                      (EXIT (NREVERSE #9#))))
                . #20#)
          (LETT |nc1|
                (SPADCALL (ELT $ 102)
                          (PROGN
                           (LETT #6# NIL . #20#)
                           (SEQ (LETT |cu| NIL . #20#) (LETT #5# |lcu| . #20#)
                                G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |cu| (CAR #5#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #6#
                                        (CONS (SPADCALL |cu| (QREFELT $ 74))
                                              #6#)
                                        . #20#)))
                                (LETT #5# (CDR #5#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #6#))))
                          (QREFELT $ 133))
                . #20#)
          (LETT |n1|
                (|RDEPAR;exp_upper_bound| |a| |bu| |nc1| |lk| |eta| |logi| $)
                . #20#)
          (LETT |res1|
                (|RDEPAR;param_SPDE| |a| |bu| |lcu| |n1| |der| |get_rs| |x| $)
                . #20#)
          (LETT |tt|
                (COND
                 ((< |n0| 0)
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 71)
                             (PROG1 (LETT #3# (- |n0|) . #20#)
                               (|check_subtype2| (>= #3# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #3#))
                             (QREFELT $ 73))
                   (QREFELT $ 125)))
                 ('T (|spadConstant| $ 160)))
                . #20#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #20#)
            (SEQ (LETT |re| NIL . #20#) (LETT #1# |res1| . #20#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |re| (CAR #1#) . #20#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (CONS
                           (SPADCALL (SPADCALL (QCAR |re|) (QREFELT $ 125))
                                     |tt| (QREFELT $ 169))
                           (QCDR |re|))
                          #2#)
                         . #20#)))
                 (LETT #1# (CDR #1#) . #20#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |RDEPAR;param_rde;I2FLSLMMR;14|
        ((|m| |Integer|) (|f| F) (|g0| F) (|lg| |List| F) (|x| |Symbol|)
         (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($ |Record|
          (|:| |particular|
               (|Union|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))
                "failed"))
          (|:| |basis|
               (|List|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))))
        (SPROG
         ((|res1|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|lg1| (|List| F)))
         (SEQ
          (LETT |lg1| (CONS (SPADCALL |g0| (QREFELT $ 111)) |lg|)
                . #1=(|RDEPAR;param_rde;I2FLSLMMR;14|))
          (LETT |res1|
                (SPADCALL |m| |f| |lg1| |x| |lk| |ext| |logi| (QREFELT $ 170))
                . #1#)
          (EXIT (SPADCALL |res1| (QREFELT $ 139)))))) 

(SDEFUN |RDEPAR;param_rde2;FLSLMML;15|
        ((|fp| F) (|lg| |List| F) (|x| |Symbol|) (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((|lg1| (|List| F)) (#1=#:G490 NIL) (|g| NIL) (#2=#:G489 NIL)
          (|pf| (F)) (|p| (|SparseUnivariatePolynomial| F))
          (|fpu| #3=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|ni| (|Integer|)) (|pi| (|SparseUnivariatePolynomial| F))
          (|#G152|
           #4=(|Record| (|:| |fctr| (|SparseUnivariatePolynomial| F))
                        (|:| |xpnt| (|Integer|))))
          (#5=#:G488 NIL) (|re| NIL) (|rl| (|List| #4#))
          (|der1|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|denfp| (|SparseUnivariatePolynomial| F))
          (|dk| (|SparseUnivariatePolynomial| F)) (|dku| #3#) (#6=#:G487 NIL)
          (|k1| NIL) (#7=#:G486 NIL) (|k| (|Kernel| F)))
         (SEQ
          (LETT |k| (SPADCALL |lk| (QREFELT $ 173))
                . #8=(|RDEPAR;param_rde2;FLSLMML;15|))
          (LETT |lk|
                (PROGN
                 (LETT #7# NIL . #8#)
                 (SEQ (LETT |k1| NIL . #8#) (LETT #6# |lk| . #8#) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |k1| (CAR #6#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |k1| |k| (QREFELT $ 174))
                          (LETT #7# (CONS |k1| #7#) . #8#)))))
                      (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #8#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |k| (QREFELT $ 176)) (QREFELT $ 8)
                       (QREFELT $ 177))
             (|RDEPAR;do_alg_rde| |fp| |lg| |x| |k| |lk| |ext| |logi| $))
            (#9='T
             (SEQ
              (LETT |dku|
                    (SPADCALL
                     (SPADCALL (SPADCALL |k| (QREFELT $ 33)) |x|
                               (QREFELT $ 178))
                     |k| (QREFELT $ 130))
                    . #8#)
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |dku| (QREFELT $ 15))
                           (|spadConstant| $ 75) (QREFELT $ 76))
                 NIL)
                (#9#
                 (SEQ (LETT |dk| (SPADCALL |dku| (QREFELT $ 24)) . #8#)
                      (LETT |fpu| (SPADCALL |fp| |k| (QREFELT $ 130)) . #8#)
                      (LETT |denfp| (SPADCALL |fpu| (QREFELT $ 15)) . #8#)
                      (LETT |der1|
                            (CONS #'|RDEPAR;param_rde2;FLSLMML;15!1|
                                  (VECTOR |dk| |x| $))
                            . #8#)
                      (LETT |rl| (|RDEPAR;normalize| |fpu| |der1| $) . #8#)
                      (LETT |p| (|spadConstant| $ 75) . #8#)
                      (SEQ (LETT |re| NIL . #8#) (LETT #5# |rl| . #8#) G190
                           (COND
                            ((OR (ATOM #5#)
                                 (PROGN (LETT |re| (CAR #5#) . #8#) NIL))
                             (GO G191)))
                           (SEQ
                            (PROGN
                             (LETT |#G152| |re| . #8#)
                             (LETT |pi| (QCAR |#G152|) . #8#)
                             (LETT |ni| (QCDR |#G152|) . #8#)
                             |#G152|)
                            (LETT |fpu|
                                  (SPADCALL |fpu|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |ni| (QREFELT $ 48))
                                              (SPADCALL |pi| |der1|)
                                              (QREFELT $ 34))
                                             |pi| (QREFELT $ 181))
                                            (QREFELT $ 182))
                                  . #8#)
                            (EXIT
                             (LETT |p|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL (QREFELT $ 49)) |ni|
                                              (QREFELT $ 183))
                                    |p| (QREFELT $ 34))
                                   . #8#)))
                           (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |fp| (SPADCALL |fpu| |k| (QREFELT $ 128)) . #8#)
                      (LETT |pf|
                            (SPADCALL (SPADCALL |p| (QREFELT $ 125)) |k|
                                      (QREFELT $ 128))
                            . #8#)
                      (LETT |lg1|
                            (PROGN
                             (LETT #2# NIL . #8#)
                             (SEQ (LETT |g| NIL . #8#) (LETT #1# |lg| . #8#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |g| (CAR #1#) . #8#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (SPADCALL |pf| |g| (QREFELT $ 114))
                                           #2#)
                                          . #8#)))
                                  (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            . #8#)
                      (EXIT
                       (|RDEPAR;do_param_rde| |fp| |lg| |x| |k| |lk| |ext|
                        |logi| $))))))))))))) 

(SDEFUN |RDEPAR;param_rde2;FLSLMML;15!1| ((|z1| NIL) ($$ NIL))
        (PROG ($ |x| |dk|)
          (LETT $ (QREFELT $$ 2) . #1=(|RDEPAR;param_rde2;FLSLMML;15|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |dk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |z1|
                             (CONS #'|RDEPAR;param_rde2;FLSLMML;15!0|
                                   (VECTOR $ |x|))
                             |dk| (QREFELT $ 180))))))) 

(SDEFUN |RDEPAR;param_rde2;FLSLMML;15!0| ((|z2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 178)))))) 

(SDEFUN |RDEPAR;do_alg_rde0|
        ((|fp| F) (|lg| |List| F) (|x| |Symbol|) (|k| |Kernel| F)
         (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G528 NIL) (|ba| NIL) (#2=#:G529 NIL) (|bv| NIL) (#3=#:G527 NIL)
          (|kfi| (F)) (|lba| (|List| F)) (|cb| (|List| (|Vector| F)))
          (|nlba| (|List| F)) (#4=#:G526 NIL) (|be| NIL) (#5=#:G525 NIL)
          (|ncb| (|List| (|Vector| F))) (#6=#:G524 NIL) (#7=#:G523 NIL)
          (|s1|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|lgi1| (|List| F)) (#8=#:G522 NIL) (#9=#:G521 NIL)
          (|lgi| (|List| F)) (#10=#:G520 NIL) (|j| NIL) (#11=#:G519 NIL)
          (|i| NIL) (#12=#:G518 NIL) (#13=#:G517 NIL) (#14=#:G515 NIL)
          (#15=#:G516 NIL) (#16=#:G514 NIL) (#17=#:G513 NIL)
          (|m| (|NonNegativeInteger|)) (|llv| (|Vector| (|List| F)))
          (#18=#:G512 NIL) (|g| NIL) (#19=#:G511 NIL) (|kf| (F)) (|dlk| (F))
          (|ak1| (F)) (|n| (|Integer|)) (|ak2| (F)) (|ak| (|List| F)))
         (SEQ
          (LETT |ak| (SPADCALL |k| (QREFELT $ 184))
                . #20=(|RDEPAR;do_alg_rde0|))
          (LETT |ak2| (SPADCALL |ak| 2 (QREFELT $ 185)) . #20#)
          (LETT |n| (SPADCALL |ak2| (QREFELT $ 186)) . #20#)
          (LETT |ak1| (SPADCALL |ak| 1 (QREFELT $ 185)) . #20#)
          (LETT |dlk|
                (SPADCALL (SPADCALL |ak1| |x| (QREFELT $ 187))
                          (SPADCALL |ak2| |ak1| (QREFELT $ 114))
                          (QREFELT $ 134))
                . #20#)
          (LETT |kf| (SPADCALL |k| (QREFELT $ 33)) . #20#)
          (LETT |kfi| (|spadConstant| $ 71) . #20#)
          (LETT |llv|
                (SPADCALL
                 (PROGN
                  (LETT #19# NIL . #20#)
                  (SEQ (LETT |g| NIL . #20#) (LETT #18# |lg| . #20#) G190
                       (COND
                        ((OR (ATOM #18#)
                             (PROGN (LETT |g| (CAR #18#) . #20#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #19#
                               (CONS (SPADCALL |g| |k| |n| (QREFELT $ 189))
                                     #19#)
                               . #20#)))
                       (LETT #18# (CDR #18#) . #20#) (GO G190) G191
                       (EXIT (NREVERSE #19#))))
                 (QREFELT $ 192))
                . #20#)
          (LETT |m| (LENGTH |lg|) . #20#)
          (LETT |cb|
                (PROGN
                 (LETT #17# NIL . #20#)
                 (SEQ (LETT |i| 1 . #20#) (LETT #16# |m| . #20#) G190
                      (COND ((|greater_SI| |i| #16#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #17#
                              (CONS (MAKEARR1 |m| (|spadConstant| $ 44)) #17#)
                              . #20#)))
                      (LETT |i| (|inc_SI| |i|) . #20#) (GO G190) G191
                      (EXIT (NREVERSE #17#))))
                . #20#)
          (SEQ (LETT |bv| NIL . #20#) (LETT #15# |cb| . #20#)
               (LETT |i| 1 . #20#) (LETT #14# |m| . #20#) G190
               (COND
                ((OR (|greater_SI| |i| #14#) (ATOM #15#)
                     (PROGN (LETT |bv| (CAR #15#) . #20#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |bv| |i| (|spadConstant| $ 71) (QREFELT $ 101))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #15# (CDR #15#) . #20#))
                     . #20#)
               (GO G190) G191 (EXIT NIL))
          (LETT |lba|
                (PROGN
                 (LETT #13# NIL . #20#)
                 (SEQ (LETT |bv| NIL . #20#) (LETT #12# |cb| . #20#) G190
                      (COND
                       ((OR (ATOM #12#)
                            (PROGN (LETT |bv| (CAR #12#) . #20#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #13# (CONS (|spadConstant| $ 44) #13#) . #20#)))
                      (LETT #12# (CDR #12#) . #20#) (GO G190) G191
                      (EXIT (NREVERSE #13#))))
                . #20#)
          (SEQ (LETT |i| 0 . #20#) (LETT #11# (- |n| 1) . #20#) G190
               (COND ((|greater_SI| |i| #11#) (GO G191)))
               (SEQ (LETT |lgi| NIL . #20#)
                    (SEQ (LETT |j| 1 . #20#) (LETT #10# |m| . #20#) G190
                         (COND ((|greater_SI| |j| #10#) (GO G191)))
                         (SEQ
                          (LETT |lgi|
                                (CONS
                                 (|SPADfirst|
                                  (SPADCALL |llv| |j| (QREFELT $ 193)))
                                 |lgi|)
                                . #20#)
                          (EXIT
                           (SPADCALL |llv| |j|
                                     (CDR (SPADCALL |llv| |j| (QREFELT $ 193)))
                                     (QREFELT $ 194))))
                         (LETT |j| (|inc_SI| |j|) . #20#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |lgi| (NREVERSE |lgi|) . #20#)
                    (LETT |lgi1|
                          (PROGN
                           (LETT #9# NIL . #20#)
                           (SEQ (LETT |bv| NIL . #20#) (LETT #8# |cb| . #20#)
                                G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN (LETT |bv| (CAR #8#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #9#
                                        (CONS
                                         (SPADCALL |bv| |lgi| (QREFELT $ 113))
                                         #9#)
                                        . #20#)))
                                (LETT #8# (CDR #8#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #9#))))
                          . #20#)
                    (LETT |s1|
                          (SPADCALL
                           (SPADCALL |fp|
                                     (SPADCALL (SPADCALL |i| (QREFELT $ 48))
                                               |dlk| (QREFELT $ 114))
                                     (QREFELT $ 115))
                           |lgi1| |x| |lk| |ext| |logi| (QREFELT $ 122))
                          . #20#)
                    (LETT |ncb|
                          (PROGN
                           (LETT #7# NIL . #20#)
                           (SEQ (LETT |be| NIL . #20#) (LETT #6# |s1| . #20#)
                                G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |be| (CAR #6#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #7#
                                        (CONS
                                         (SPADCALL (QCDR |be|) |cb|
                                                   (QREFELT $ 86))
                                         #7#)
                                        . #20#)))
                                (LETT #6# (CDR #6#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #7#))))
                          . #20#)
                    (LETT |nlba|
                          (PROGN
                           (LETT #5# NIL . #20#)
                           (SEQ (LETT |be| NIL . #20#) (LETT #4# |s1| . #20#)
                                G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |be| (CAR #4#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL (QCDR |be|) |lba|
                                                    (QREFELT $ 113))
                                          (SPADCALL (QCAR |be|) |kfi|
                                                    (QREFELT $ 114))
                                          (QREFELT $ 115))
                                         #5#)
                                        . #20#)))
                                (LETT #4# (CDR #4#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #5#))))
                          . #20#)
                    (LETT |cb| |ncb| . #20#) (LETT |lba| |nlba| . #20#)
                    (EXIT
                     (LETT |kfi| (SPADCALL |kf| |kfi| (QREFELT $ 114))
                           . #20#)))
               (LETT |i| (|inc_SI| |i|) . #20#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROGN
            (LETT #3# NIL . #20#)
            (SEQ (LETT |bv| NIL . #20#) (LETT #2# |cb| . #20#)
                 (LETT |ba| NIL . #20#) (LETT #1# |lba| . #20#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |ba| (CAR #1#) . #20#) NIL)
                       (ATOM #2#) (PROGN (LETT |bv| (CAR #2#) . #20#) NIL))
                   (GO G191)))
                 (SEQ (EXIT (LETT #3# (CONS (CONS |ba| |bv|) #3#) . #20#)))
                 (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #20#))
                       . #20#)
                 (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |RDEPAR;do_alg_rde|
        ((|fp| F) (|lg| |List| F) (|x| |Symbol|) (|k| |Kernel| F)
         (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((|part2|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (#1=#:G549 NIL) (|f| NIL) (#2=#:G548 NIL)
          (|part1|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (#3=#:G547 NIL) (|be| NIL) (#4=#:G546 NIL)
          (|n| (|NonNegativeInteger|))
          (|res1|
           (|Record|
            (|:| |particular|
                 (|List|
                  (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
            (|:| |basis| (|List| F))))
          (|k1| (|Kernel| F)))
         (SEQ
          (COND
           ((SPADCALL |k| '|nthRoot| (QREFELT $ 195))
            (COND
             ((NULL
               (SPADCALL |k| (SPADCALL |fp| (QREFELT $ 197)) (QREFELT $ 198)))
              (EXIT
               (|RDEPAR;do_alg_rde0| |fp| |lg| |x| |k| |lk| |ext| |logi|
                $))))))
          (LETT |k1| (SPADCALL |lk| (QREFELT $ 173))
                . #5=(|RDEPAR;do_alg_rde|))
          (EXIT
           (COND
            ((QEQCAR (SPADCALL |k1| (QREFELT $ 200)) 0)
             (SEQ
              (LETT |res1| (SPADCALL |fp| |lg| |k1| |k| (QREFELT $ 203)) . #5#)
              (LETT |n| (LENGTH |lg|) . #5#)
              (LETT |part1|
                    (PROGN
                     (LETT #4# NIL . #5#)
                     (SEQ (LETT |be| NIL . #5#) (LETT #3# (QCAR |res1|) . #5#)
                          G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |be| (CAR #3#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (CONS (SPADCALL (QCAR |be|) (QREFELT $ 111))
                                         (QCDR |be|))
                                   #4#)
                                  . #5#)))
                          (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #5#)
              (LETT |part2|
                    (PROGN
                     (LETT #2# NIL . #5#)
                     (SEQ (LETT |f| NIL . #5#) (LETT #1# (QCDR |res1|) . #5#)
                          G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |f| (CAR #1#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (CONS |f|
                                         (MAKEARR1 |n| (|spadConstant| $ 44)))
                                   #2#)
                                  . #5#)))
                          (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #5#)
              (EXIT (SPADCALL |part1| |part2| (QREFELT $ 204)))))
            ('T (|error| "do_alg_rde: unimplemented kernel"))))))) 

(SDEFUN |RDEPAR;param_rde;IFLSLMML;18|
        ((|m| |Integer|) (|f| F) (|lg| |List| F) (|x| |Symbol|)
         (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G560 NIL) (|k1| NIL) (#2=#:G559 NIL) (|k| (|Kernel| F))
          (|fp| (F)))
         (SEQ
          (LETT |fp|
                (SPADCALL (SPADCALL |m| |f| (QREFELT $ 205)) |x|
                          (QREFELT $ 187))
                . #3=(|RDEPAR;param_rde;IFLSLMML;18|))
          (EXIT
           (COND
            ((SPADCALL |fp| (|spadConstant| $ 44) (QREFELT $ 131))
             (SPADCALL |lk| |lg| |ext|))
            ('T
             (SEQ (LETT |k| (SPADCALL |lk| (QREFELT $ 173)) . #3#)
                  (LETT |lk|
                        (PROGN
                         (LETT #2# NIL . #3#)
                         (SEQ (LETT |k1| NIL . #3#) (LETT #1# |lk| . #3#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |k1| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |k1| |k| (QREFELT $ 174))
                                  (LETT #2# (CONS |k1| #2#) . #3#)))))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #3#)
                  (EXIT
                   (|RDEPAR;do_param_rde| |fp| |lg| |x| |k| |lk| |ext| |logi|
                    $))))))))) 

(SDEFUN |RDEPAR;do_param_rde|
        ((|fp| F) (|lg| |List| F) (|x| |Symbol|) (|k| |Kernel| F)
         (|lk| |List| (|Kernel| F))
         (|ext| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| (|Kernel| F)) (|List| F))
         (|logi| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| (|Kernel| F)) (|List| F))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((|res2|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|anf| (F)) (|ans1| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|bv| (|Vector| F)) (#1=#:G629 NIL) (|re| NIL)
          (|res1|
           (|List|
            (|Record|
             (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |coeffs| (|Vector| F)))))
          (|lgu1| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#2=#:G628 NIL) (|kv| NIL) (|n2| (|NonNegativeInteger|))
          (|n1| (|NonNegativeInteger|))
          (|lgu| (|List| #3=(|Fraction| (|SparseUnivariatePolynomial| F))))
          (#4=#:G627 NIL) (|dr| NIL) (#5=#:G626 NIL)
          (|lker| (|List| (|Vector| F))) (|rs3| #6=(|Matrix| F))
          (|get_rs| (|Mapping| #6# (|Matrix| F))) (|rs2| (|Matrix| F))
          (|rs1| (|Matrix| (|SparseUnivariatePolynomial| F)))
          (|lnor1| (|List| #7=(|Fraction| (|SparseUnivariatePolynomial| F))))
          (#8=#:G625 NIL) (#9=#:G624 NIL)
          (|lgd|
           (|List|
            (|Record| (|:| |poly| (|SparseUnivariatePolynomial| F))
                      (|:| |normal| #7#)
                      (|:| |special|
                           (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (#10=#:G623 NIL) (|gu| NIL) (#11=#:G622 NIL) (#12=#:G621 NIL)
          (#13=#:G620 NIL) (|aa1| #14=(|SparseUnivariatePolynomial| F))
          (|bbr| (|Fraction| (|SparseUnivariatePolynomial| F))) (|aa| #14#)
          (|h| NIL) (|#G199| #15=(|List| (|SparseUnivariatePolynomial| F)))
          (|d| NIL) (|#G198| #15#)
          (|der1|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (#16=#:G619 NIL) (|g| NIL) (#17=#:G618 NIL)
          (|nfp| #18=(|SparseUnivariatePolynomial| F))
          (|denfp| (|SparseUnivariatePolynomial| F)) (|fpu| #3#) (|dk| #18#)
          (|dku| #3#))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |k| (QREFELT $ 176)) (QREFELT $ 8)
                      (QREFELT $ 177))
            (|RDEPAR;do_alg_rde| |fp| |lg| |x| |k| |lk| |ext| |logi| $))
           (#19='T
            (SEQ
             (LETT |dku|
                   (SPADCALL
                    (SPADCALL (SPADCALL |k| (QREFELT $ 33)) |x|
                              (QREFELT $ 178))
                    |k| (QREFELT $ 130))
                   . #20=(|RDEPAR;do_param_rde|))
             (EXIT
              (COND
               ((SPADCALL (SPADCALL |dku| (QREFELT $ 15)) (|spadConstant| $ 75)
                          (QREFELT $ 76))
                NIL)
               (#19#
                (SEQ (LETT |dk| (SPADCALL |dku| (QREFELT $ 24)) . #20#)
                     (LETT |fpu| (SPADCALL |fp| |k| (QREFELT $ 130)) . #20#)
                     (LETT |denfp| (SPADCALL |fpu| (QREFELT $ 15)) . #20#)
                     (LETT |nfp| (SPADCALL |fpu| (QREFELT $ 24)) . #20#)
                     (LETT |lgu|
                           (PROGN
                            (LETT #17# NIL . #20#)
                            (SEQ (LETT |g| NIL . #20#) (LETT #16# |lg| . #20#)
                                 G190
                                 (COND
                                  ((OR (ATOM #16#)
                                       (PROGN
                                        (LETT |g| (CAR #16#) . #20#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #17#
                                         (CONS
                                          (SPADCALL |g| |k| (QREFELT $ 130))
                                          #17#)
                                         . #20#)))
                                 (LETT #16# (CDR #16#) . #20#) (GO G190) G191
                                 (EXIT (NREVERSE #17#))))
                           . #20#)
                     (LETT |der1|
                           (CONS #'|RDEPAR;do_param_rde!1| (VECTOR |dk| |x| $))
                           . #20#)
                     (PROGN
                      (LETT |#G198| (|RDEPAR;get_denom| |fpu| |lgu| |der1| $)
                            . #20#)
                      (LETT |#G199| |#G198| . #20#)
                      (LETT |d| (|SPADfirst| |#G199|) . #20#)
                      (LETT |#G199| (CDR |#G199|) . #20#)
                      (LETT |h| (|SPADfirst| |#G199|) . #20#)
                      |#G198|)
                     (LETT |aa| (SPADCALL |d| |h| (QREFELT $ 56)) . #20#)
                     (LETT |bbr|
                           (SPADCALL (SPADCALL |aa| |fpu| (QREFELT $ 206))
                                     (SPADCALL
                                      (SPADCALL |d| (SPADCALL |h| |der1|)
                                                (QREFELT $ 56))
                                      (QREFELT $ 125))
                                     (QREFELT $ 182))
                           . #20#)
                     (LETT |aa1| (SPADCALL |aa| |h| (QREFELT $ 56)) . #20#)
                     (LETT |lgu|
                           (PROGN
                            (LETT #13# NIL . #20#)
                            (SEQ (LETT |gu| NIL . #20#)
                                 (LETT #12# |lgu| . #20#) G190
                                 (COND
                                  ((OR (ATOM #12#)
                                       (PROGN
                                        (LETT |gu| (CAR #12#) . #20#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #13#
                                         (CONS
                                          (SPADCALL |aa1| |gu| (QREFELT $ 206))
                                          #13#)
                                         . #20#)))
                                 (LETT #12# (CDR #12#) . #20#) (GO G190) G191
                                 (EXIT (NREVERSE #13#))))
                           . #20#)
                     (LETT |lgd|
                           (PROGN
                            (LETT #11# NIL . #20#)
                            (SEQ (LETT |gu| NIL . #20#)
                                 (LETT #10# |lgu| . #20#) G190
                                 (COND
                                  ((OR (ATOM #10#)
                                       (PROGN
                                        (LETT |gu| (CAR #10#) . #20#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #11#
                                         (CONS
                                          (SPADCALL |gu| |der1|
                                                    (QREFELT $ 208))
                                          #11#)
                                         . #20#)))
                                 (LETT #10# (CDR #10#) . #20#) (GO G190) G191
                                 (EXIT (NREVERSE #11#))))
                           . #20#)
                     (LETT |lnor1|
                           (PROGN
                            (LETT #9# NIL . #20#)
                            (SEQ (LETT |dr| NIL . #20#) (LETT #8# |lgd| . #20#)
                                 G190
                                 (COND
                                  ((OR (ATOM #8#)
                                       (PROGN
                                        (LETT |dr| (CAR #8#) . #20#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #9# (CONS (QVELT |dr| 1) #9#)
                                         . #20#)))
                                 (LETT #8# (CDR #8#) . #20#) (GO G190) G191
                                 (EXIT (NREVERSE #9#))))
                           . #20#)
                     (LETT |rs1|
                           (SPADCALL (SPADCALL (LIST |lnor1|) (QREFELT $ 211))
                                     (QREFELT $ 212))
                           . #20#)
                     (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 63)) . #20#)
                     (LETT |get_rs|
                           (CONS #'|RDEPAR;do_param_rde!3| (VECTOR |x| $))
                           . #20#)
                     (LETT |rs3| (SPADCALL |rs2| |get_rs|) . #20#)
                     (LETT |lker| (SPADCALL |rs3| (QREFELT $ 65)) . #20#)
                     (EXIT
                      (COND ((NULL |lker|) NIL)
                            (#19#
                             (SEQ
                              (LETT |lgu|
                                    (PROGN
                                     (LETT #5# NIL . #20#)
                                     (SEQ (LETT |dr| NIL . #20#)
                                          (LETT #4# |lgd| . #20#) G190
                                          (COND
                                           ((OR (ATOM #4#)
                                                (PROGN
                                                 (LETT |dr| (CAR #4#) . #20#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #5#
                                                  (CONS
                                                   (SPADCALL
                                                    (SPADCALL (QVELT |dr| 0)
                                                              (QREFELT $ 125))
                                                    (QVELT |dr| 2)
                                                    (QREFELT $ 126))
                                                   #5#)
                                                  . #20#)))
                                          (LETT #4# (CDR #4#) . #20#) (GO G190)
                                          G191 (EXIT (NREVERSE #5#))))
                                    . #20#)
                              (LETT |n1| (LENGTH |lgu|) . #20#)
                              (LETT |n2| (LENGTH |lker|) . #20#)
                              (LETT |lgu1| NIL . #20#)
                              (SEQ (LETT |kv| NIL . #20#)
                                   (LETT #2# |lker| . #20#) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN
                                          (LETT |kv| (CAR #2#) . #20#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |lgu1|
                                           (CONS
                                            (SPADCALL |kv| |lgu|
                                                      (QREFELT $ 124))
                                            |lgu1|)
                                           . #20#)))
                                   (LETT #2# (CDR #2#) . #20#) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |lgu1| (NREVERSE |lgu1|) . #20#)
                              (LETT |res1|
                                    (COND
                                     ((OR
                                       (QEQCAR (SPADCALL |k| (QREFELT $ 200))
                                               0)
                                       (OR
                                        (SPADCALL |k| '|log| (QREFELT $ 195))
                                        (SPADCALL
                                         (SPADCALL |k| (QREFELT $ 176))
                                         (QREFELT $ 9) (QREFELT $ 177))))
                                      (|RDEPAR;do_SPDE_prim| |aa| |bbr| |lgu1|
                                       |k| |lk| |ext| |logi| |der1| |get_rs|
                                       |x| $))
                                     ((SPADCALL |k| '|exp| (QREFELT $ 195))
                                      (|RDEPAR;do_SPDE_exp| |aa| |bbr| |lgu1|
                                       |lk| |ext| |logi| |der1| |get_rs| |x|
                                       $))
                                     (#19#
                                      (|error|
                                       "param_rde: unimplemented kernel")))
                                    . #20#)
                              (LETT |res2| NIL . #20#)
                              (SEQ (LETT |re| NIL . #20#)
                                   (LETT #1# |res1| . #20#) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |re| (CAR #1#) . #20#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |bv|
                                          (SPADCALL (QCDR |re|) |lker|
                                                    (QREFELT $ 86))
                                          . #20#)
                                    (LETT |ans1|
                                          (SPADCALL
                                           (SPADCALL (QCAR |re|)
                                                     (SPADCALL |h|
                                                               (QREFELT $ 125))
                                                     (QREFELT $ 169))
                                           (QREFELT $ 216))
                                          . #20#)
                                    (LETT |anf|
                                          (SPADCALL |ans1| |k| (QREFELT $ 128))
                                          . #20#)
                                    (EXIT
                                     (LETT |res2|
                                           (CONS (CONS |anf| |bv|) |res2|)
                                           . #20#)))
                                   (LETT #1# (CDR #1#) . #20#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT (NREVERSE |res2|)))))))))))))))) 

(SDEFUN |RDEPAR;do_param_rde!3| ((|m| NIL) ($$ NIL))
        (PROG ($ |x|)
          (LETT $ (QREFELT $$ 1) . #1=(|RDEPAR;do_param_rde|))
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |m|
                             (LIST
                              (CONS #'|RDEPAR;do_param_rde!2| (VECTOR $ |x|)))
                             (QREFELT $ 215))))))) 

(SDEFUN |RDEPAR;do_param_rde!2| ((|ff| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |ff| |x| (QREFELT $ 178)))))) 

(SDEFUN |RDEPAR;do_param_rde!1| ((|z1| NIL) ($$ NIL))
        (PROG ($ |x| |dk|)
          (LETT $ (QREFELT $$ 2) . #1=(|RDEPAR;do_param_rde|))
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |dk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |z1|
                             (CONS #'|RDEPAR;do_param_rde!0| (VECTOR $ |x|))
                             |dk| (QREFELT $ 180))))))) 

(SDEFUN |RDEPAR;do_param_rde!0| ((|z2| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT $ 178)))))) 

(DECLAIM (NOTINLINE |ParametricRischDE;|)) 

(DEFUN |ParametricRischDE| (&REST #1=#:G630)
  (SPROG NIL
         (PROG (#2=#:G631)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ParametricRischDE|)
                                               '|domainEqualList|)
                    . #3=(|ParametricRischDE|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ParametricRischDE;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ParametricRischDE|)))))))))) 

(DEFUN |ParametricRischDE;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ParametricRischDE|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ParametricRischDE| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 217) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ParametricRischDE| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|%alg|)
          (QSETREFV $ 9 '|prim|)
          $))) 

(MAKEPROP '|ParametricRischDE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              'PRIM (|SparseUnivariatePolynomial| 7) (|Fraction| 10)
              (|Mapping| 10 10) (|MonomialExtensionTools| 7 10)
              (0 . |normalDenom|) (6 . |denom|) (|List| $) (11 . |lcm|)
              (|Record| (|:| |normal| 10) (|:| |special| 10)) (16 . |split|)
              (22 . |gcd|) (28 . |differentiate|) (|Union| $ '"failed")
              (33 . |exquo|) (39 . |numer|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 25 '"failed")
              (44 . |extendedEuclidean|) (|Symbol|) (51 . |new|) (|Kernel| 7)
              (55 . |kernel|) (|Kernel| $) (60 . |coerce|) (65 . *) (71 . -)
              (77 . |resultant|) (|List| 41) (|FunctionSpaceRationalRoots| 6 7)
              (83 . |get_rational_roots|) (|Union| 46 '"failed")
              (|Fraction| 46) (89 . |retractIfCan|) (94 . |Zero|) (98 . |Zero|)
              (|Boolean|) (|Integer|) (102 . >) (108 . |coerce|) (113 . |pi|)
              (|LaurentPolynomial| 7 10) (117 . |coerce|) (122 . |exquo|)
              (|Record| (|:| |ans| 10) (|:| |nosol| 45))
              (|TranscendentalRischDE| 7 10) (128 . |SPDEnocancel1|) (136 . *)
              (142 . +) (|List| 67) (|Matrix| 10) (148 . |matrix|) (|Matrix| 7)
              (|Matrix| $) (153 . |reducedSystem|) (|List| 66)
              (158 . |nullSpace|) (|Vector| 7) (|List| 10)
              (|LinearCombinationUtilities| 7 10) (163 . |lin_comb|)
              (169 . |One|) (173 . |One|) (|NonNegativeInteger|)
              (177 . |monomial|) (183 . |degree|) (188 . |One|) (192 . ~=)
              (198 . =) (204 . |Zero|)
              (|Record| (|:| |ans| 10) (|:| |remainder| 10))
              (|Record| (|:| |ans| 67) (|:| |acoeff| 10) (|:| |eegen| 10)
                        (|:| |bpar| 10) (|:| |lcpar| 67) (|:| |dpar| 46))
              (|Union| (|List| 79) 80) (|RDEaux| 7) (208 . |multi_SPDE|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (217 . |divide|) (223 . |lin_comb|)
              (|Record| (|:| |num| 88) (|:| |den| 46)) (|Vector| 41)
              (|CommonDenominator| 46 41 88) (229 . |splitDenominator|)
              (234 . ~=) (240 . |elt|) (246 . |One|) (250 . ~=)
              (256 . |retract|) (|List| 46) (|Vector| 46) (261 . |vector|)
              (|Vector| 10) (266 . |vector|) (271 . |setelt!|) (278 . |max|)
              (|Mapping| 46 46 46) (284 . |reduce|) (291 . |retract|)
              (296 . |Zero|) (300 . |elt|) (306 . |leadingCoefficient|)
              (311 . |reductum|) (316 . |setelt!|) (323 . -) (|List| 7)
              (328 . |lin_comb|) (334 . *) (340 . +)
              (|Record| (|:| |ratpart| 7) (|:| |coeffs| 66)) (|List| 116)
              (|List| 30) (|Mapping| 117 118 112)
              (|Record| (|:| |logands| 112) (|:| |basis| (|List| 88)))
              (|Mapping| 120 118 112) |RDEPAR;param_rde2;FLSLMML;15|
              (|List| 11) (346 . |lin_comb|) (352 . |coerce|) (357 . +)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 30) 30
                                                     6 158 7)
              (363 . |multivariate|)
              (|Fraction| (|SparseUnivariatePolynomial| $))
              (369 . |univariate|) (375 . =) (381 . |retract|) (386 . |reduce|)
              (392 . /) (398 . >) (404 . |retractIfCan|)
              (|Union| 116 '"failed")
              (|Record| (|:| |particular| 137) (|:| |basis| 117))
              (409 . |dehomogenize|) (414 . |elt|) (|List| 50) (|Vector| 50)
              (420 . |vector|) (425 . |Zero|) (429 . |degree|) (434 . |elt|)
              (440 . ~=) (446 . |leadingCoefficient|) (451 . |reductum|)
              (456 . |setelt!|) (463 . |lin_comb|) (469 . |monomial|) (475 . +)
              (481 . |convert|) (486 . |coefficient|) (492 . |coefficient|)
              (498 . |One|) (|SparseMultivariatePolynomial| 6 30) (502 . |One|)
              (506 . |One|) (510 . /) |RDEPAR;exp_lower_bound;SupLp2ILFMI;11|
              (516 . |order|) (521 . |min|) (527 . |retract|) (532 . |coerce|)
              (537 . *) (543 . |retract|) (548 . /)
              |RDEPAR;param_rde;IFLSLMML;18| |RDEPAR;param_rde;I2FLSLMMR;14|
              (|IntegrationTools| 6 7) (554 . |kmax|) (559 . ~=)
              (|BasicOperator|) (565 . |operator|) (570 . |has?|)
              (576 . |differentiate|) (|Mapping| 7 7) (582 . |differentiate|)
              (589 . /) (595 . -) (601 . ^) (607 . |argument|) (612 . |elt|)
              (618 . |retract|) (623 . D) (|RootFSSplit| 6 7)
              (629 . |alg_split_root0|) (|List| 112) (|Vector| 112)
              (636 . |vector|) (641 . |elt|) (647 . |setelt!|) (654 . |is?|)
              (|List| 32) (660 . |kernels|) (665 . |member?|)
              (|Union| 28 '"failed") (671 . |symbolIfCan|)
              (|Record| (|:| |particular| 117) (|:| |basis| 112))
              (|PureAlgebraicIntegration| 6 7 7) (676 . |param_RDE|)
              (684 . |concat|) (690 . *) (696 . *)
              (|Record| (|:| |poly| 10) (|:| |normal| 11) (|:| |special| 11))
              (702 . |decompose|) (|List| 123) (|Matrix| 11) (708 . |matrix|)
              (713 . |reducedSystem|) (|List| 179)
              (|ConstantLinearDependence| 6 7) (718 . |reducedSystem|)
              (724 . -))
           '#(|param_rde2| 729 |param_rde| 739 |exp_lower_bound| 762) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 216
                                                 '(2 13 10 11 12 14 1 11 10 0
                                                   15 1 10 0 16 17 2 13 18 10
                                                   12 19 2 10 0 0 0 20 1 10 0 0
                                                   21 2 10 22 0 0 23 1 11 10 0
                                                   24 3 10 26 0 0 0 27 0 28 0
                                                   29 1 30 0 28 31 1 7 0 32 33
                                                   2 10 0 7 0 34 2 10 0 0 0 35
                                                   2 10 7 0 0 36 2 38 37 7 30
                                                   39 1 41 40 0 42 0 6 0 43 0 7
                                                   0 44 2 46 45 0 0 47 1 7 0 46
                                                   48 0 7 0 49 1 50 0 10 51 2
                                                   50 22 0 0 52 4 54 53 10 10
                                                   46 12 55 2 10 0 0 0 56 2 10
                                                   0 0 0 57 1 59 0 58 60 1 10
                                                   61 62 63 1 61 64 0 65 2 68
                                                   10 66 67 69 0 6 0 70 0 7 0
                                                   71 2 10 0 7 72 73 1 10 72 0
                                                   74 0 10 0 75 2 10 45 0 0 76
                                                   2 10 45 0 0 77 0 10 0 78 5
                                                   82 81 10 10 67 46 12 83 2 10
                                                   84 0 0 85 2 68 66 66 64 86 1
                                                   89 87 88 90 2 46 45 0 0 91 2
                                                   88 41 0 46 92 0 41 0 93 2 41
                                                   45 0 0 94 1 41 46 0 95 1 97
                                                   0 96 98 1 99 0 67 100 3 66 7
                                                   0 46 7 101 2 46 0 0 0 102 3
                                                   96 46 103 0 46 104 1 10 7 0
                                                   105 0 11 0 106 2 99 10 0 46
                                                   107 1 10 7 0 108 1 10 0 0
                                                   109 3 99 10 0 46 10 110 1 7
                                                   0 0 111 2 68 7 66 112 113 2
                                                   7 0 0 0 114 2 7 0 0 0 115 2
                                                   68 11 66 123 124 1 11 0 10
                                                   125 2 11 0 0 0 126 2 127 7
                                                   11 30 128 2 7 129 0 32 130 2
                                                   7 45 0 0 131 1 11 10 0 132 2
                                                   96 46 103 0 133 2 7 0 0 0
                                                   134 2 72 45 0 0 135 1 7 40 0
                                                   136 1 68 138 117 139 2 66 7
                                                   0 46 140 1 142 0 141 143 0
                                                   50 0 144 1 50 46 0 145 2 142
                                                   50 0 46 146 2 50 45 0 0 147
                                                   1 50 7 0 148 1 50 0 0 149 3
                                                   142 50 0 46 50 150 2 68 50
                                                   66 141 151 2 50 0 7 46 152 2
                                                   50 0 0 0 153 1 50 11 0 154 2
                                                   50 7 0 46 155 2 10 7 0 72
                                                   156 0 50 0 157 0 158 0 159 0
                                                   11 0 160 2 41 0 0 0 161 1 50
                                                   46 0 163 2 46 0 0 0 164 1 50
                                                   7 0 165 1 50 0 7 166 2 50 0
                                                   0 0 167 1 50 10 0 168 2 11 0
                                                   0 0 169 1 172 30 118 173 2
                                                   30 45 0 0 174 1 30 175 0 176
                                                   2 175 45 0 28 177 2 7 0 0 28
                                                   178 3 10 0 0 179 0 180 2 11
                                                   0 10 10 181 2 11 0 0 0 182 2
                                                   7 0 0 46 183 1 30 112 0 184
                                                   2 112 7 0 46 185 1 7 46 0
                                                   186 2 7 0 0 28 187 3 188 112
                                                   7 30 46 189 1 191 0 190 192
                                                   2 191 112 0 46 193 3 191 112
                                                   0 46 112 194 2 30 45 0 28
                                                   195 1 7 196 0 197 2 118 45
                                                   30 0 198 1 30 199 0 200 4
                                                   202 201 7 112 30 30 203 2
                                                   117 0 0 0 204 2 7 0 46 0 205
                                                   2 11 0 10 0 206 2 13 207 11
                                                   12 208 1 210 0 209 211 1 11
                                                   59 62 212 2 214 61 61 213
                                                   215 1 11 0 0 216 6 0 117 7
                                                   112 28 118 119 121 122 8 0
                                                   138 46 7 7 112 28 118 119
                                                   121 171 7 0 117 46 7 112 28
                                                   118 119 121 170 7 0 46 10 50
                                                   46 46 118 7 121 162)))))
           '|lookupComplete|)) 
