
(SDEFUN |REAL0;negate|
        ((|int| |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|))))
         ($ |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|)))))
        (CONS (SPADCALL (QCDR |int|) (QREFELT $ 8))
              (SPADCALL (QCAR |int|) (QREFELT $ 8)))) 

(SDEFUN |REAL0;midpoint;RF;2|
        ((|i| |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|))))
         ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL 1 2 (QREFELT $ 12))
                  (SPADCALL (QCAR |i|) (QCDR |i|) (QREFELT $ 13))
                  (QREFELT $ 14))) 

(SDEFUN |REAL0;midpoints;LL;3|
        ((|li| |List|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|)))))
         ($ |List| (|Fraction| (|Integer|))))
        (SPROG ((#1=#:G119 NIL) (|x| NIL) (#2=#:G118 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |x| NIL) (LETT #1# |li|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 16)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |REAL0;makeSqfr| ((F |Pol|) ($ |Pol|))
        (SPROG
         ((#1=#:G122 NIL) (#2=#:G121 (|Pol|)) (#3=#:G123 (|Pol|))
          (#4=#:G126 NIL) (|s| NIL) (|sqfr| (|Factored| |Pol|)))
         (SEQ (LETT |sqfr| (SPADCALL F (QREFELT $ 21)))
              (EXIT
               (LETT F
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |s| NIL)
                           (LETT #4# (SPADCALL |sqfr| (QREFELT $ 26))) G190
                           (COND
                            ((OR (ATOM #4#) (PROGN (LETT |s| (CAR #4#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #3# (QVELT |s| 1))
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #3# (QREFELT $ 27))))
                               ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                           (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                      (COND (#1# #2#) ('T (|spadConstant| $ 9))))))))) 

(SDEFUN |REAL0;realZeros;PolL;5|
        ((F |Pol|)
         ($ |List|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))))
        (|REAL0;ReZeroSqfr| (|REAL0;makeSqfr| F $) $)) 

(SDEFUN |REAL0;realZeros;PolFL;6|
        ((F |Pol|) (|rn| |Fraction| (|Integer|))
         ($ |List|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))))
        (SPROG ((#1=#:G132 NIL) (|int| NIL) (#2=#:G131 NIL))
               (SEQ (LETT F (|REAL0;makeSqfr| F $))
                    (EXIT
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |int| NIL) (LETT #1# (|REAL0;ReZeroSqfr| F $))
                           G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |int| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL F |int| |rn| (QREFELT $ 29))
                                         #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |REAL0;realZeros;PolRL;7|
        ((F |Pol|)
         (|bounds| |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|))))
         ($ |List|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))))
        (SPROG
         ((#1=#:G134 NIL)
          (|rint|
           (|Union|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))
            #2="failed"))
          (#3=#:G140 NIL) (|int| NIL) (#4=#:G139 NIL))
         (SEQ (LETT F (|REAL0;makeSqfr| F $))
              (EXIT
               (PROGN
                (LETT #4# NIL)
                (SEQ (LETT |int| NIL) (LETT #3# (|REAL0;ReZeroSqfr| F $)) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |int| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((QEQCAR
                          (LETT |rint|
                                (SPADCALL F |int| |bounds| (QREFELT $ 32)))
                          0)
                         (LETT #4#
                               (CONS
                                (PROG2 (LETT #1# |rint|)
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0)
                                                  (|Record|
                                                   (|:| |left|
                                                        (|Fraction|
                                                         (|Integer|)))
                                                   (|:| |right|
                                                        (|Fraction|
                                                         (|Integer|))))
                                                  (|Union|
                                                   (|Record|
                                                    (|:| |left|
                                                         (|Fraction|
                                                          (|Integer|)))
                                                    (|:| |right|
                                                         (|Fraction|
                                                          (|Integer|))))
                                                   #2#)
                                                  #1#))
                                #4#))))))
                     (LETT #3# (CDR #3#)) (GO G190) G191
                     (EXIT (NREVERSE #4#)))))))) 

(SDEFUN |REAL0;realZeros;PolRFL;8|
        ((F |Pol|)
         (|bounds| |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|))))
         (|rn| |Fraction| (|Integer|))
         ($ |List|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))))
        (SPROG ((#1=#:G145 NIL) (|int| NIL) (#2=#:G144 NIL))
               (SEQ (LETT F (|REAL0;makeSqfr| F $))
                    (EXIT
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |int| NIL)
                           (LETT #1# (SPADCALL F |bounds| (QREFELT $ 33))) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |int| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL F |int| |rn| (QREFELT $ 29))
                                         #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |REAL0;ReZeroSqfr|
        ((F |Pol|)
         ($ |List|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))))
        (SPROG
         ((K
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (J
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (#1=#:G157 NIL) (|int| NIL) (#2=#:G156 NIL)
          (|tempF| (|Union| |Pol| "failed"))
          (L
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (|r| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL F (|spadConstant| $ 35) (QREFELT $ 37))
            (|error| "ReZeroSqfr: zero polynomial"))
           (#3='T
            (SEQ (LETT L NIL)
                 (EXIT
                  (COND ((EQL (SPADCALL F (QREFELT $ 39)) 0) L)
                        (#3#
                         (SEQ
                          (SEQ (LETT |r| (SPADCALL F (QREFELT $ 40)))
                               (EXIT
                                (COND
                                 ((SPADCALL |r| 0 (QREFELT $ 41))
                                  (SEQ
                                   (LETT L
                                         (LIST
                                          (CONS (|spadConstant| $ 42)
                                                (|spadConstant| $ 42))))
                                   (LETT |tempF|
                                         (SPADCALL F
                                                   (SPADCALL 1 |r|
                                                             (QREFELT $ 43))
                                                   (QREFELT $ 45)))
                                   (EXIT
                                    (COND
                                     ((NULL (QEQCAR |tempF| 1))
                                      (LETT F (QCDR |tempF|))))))))))
                          (LETT J
                                (PROGN
                                 (LETT #2# NIL)
                                 (SEQ (LETT |int| NIL)
                                      (LETT #1#
                                            (REVERSE
                                             (|REAL0;PosZero|
                                              (|REAL0;minus| F $) $)))
                                      G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN (LETT |int| (CAR #1#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS (|REAL0;negate| |int| $)
                                                    #2#))))
                                      (LETT #1# (CDR #1#)) (GO G190) G191
                                      (EXIT (NREVERSE #2#)))))
                          (LETT K (|REAL0;PosZero| F $))
                          (EXIT
                           (SPADCALL (SPADCALL J L (QREFELT $ 46)) K
                                     (QREFELT $ 46))))))))))))) 

(SDEFUN |REAL0;PosZero|
        ((F |Pol|)
         ($ |List|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))))
        (SPROG
         ((L
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (#1=#:G162 NIL) (|int| NIL) (#2=#:G161 NIL) (|b| (|Integer|)))
         (SEQ (LETT |b| (|REAL0;rootBound| F $))
              (LETT F (|REAL0;transMult| |b| F $)) (LETT L (|REAL0;Zero1| F $))
              (EXIT
               (LETT L
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |int| NIL) (LETT #1# L) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |int| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (CONS
                                     (SPADCALL |b| (QCAR |int|) (QREFELT $ 47))
                                     (SPADCALL |b| (QCDR |int|)
                                               (QREFELT $ 47)))
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |REAL0;Zero1|
        ((F |Pol|)
         ($ |List|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))))
        (SPROG
         ((K
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (#1=#:G176 NIL) (|int| NIL) (#2=#:G175 NIL)
          (J
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (#3=#:G174 NIL) (#4=#:G173 NIL) (G (|Pol|))
          (|tempG| #5=(|Union| |Pol| "failed")) (Q (|Pol|)) (H (|Pol|))
          (|tempH| #5#)
          (L
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (|v| (|Integer|)))
         (SEQ (LETT L NIL)
              (LETT |v|
                    (|REAL0;var| (|REAL0;transAdd1| (|REAL0;invert| F $) $) $))
              (EXIT
               (COND ((EQL |v| 0) NIL)
                     ((EQL |v| 1)
                      (LETT L
                            (LIST
                             (CONS (|spadConstant| $ 42)
                                   (|spadConstant| $ 10)))))
                     ('T
                      (SEQ (LETT G (|REAL0;transMultInv| 2 F $))
                           (LETT H (|REAL0;transAdd1| G $))
                           (COND
                            ((SPADCALL (SPADCALL H (QREFELT $ 40)) 0
                                       (QREFELT $ 48))
                             (SEQ
                              (LETT L
                                    (LIST
                                     (CONS (SPADCALL 1 2 (QREFELT $ 12))
                                           (SPADCALL 1 2 (QREFELT $ 12)))))
                              (LETT Q (SPADCALL 1 1 (QREFELT $ 43)))
                              (LETT |tempH| (SPADCALL H Q (QREFELT $ 45)))
                              (COND
                               ((NULL (QEQCAR |tempH| 1))
                                (LETT H (QCDR |tempH|))))
                              (LETT Q
                                    (SPADCALL Q (SPADCALL -1 0 (QREFELT $ 43))
                                              (QREFELT $ 49)))
                              (LETT |tempG| (SPADCALL G Q (QREFELT $ 45)))
                              (EXIT
                               (COND
                                ((NULL (QEQCAR |tempG| 1))
                                 (LETT G (QCDR |tempG|))))))))
                           (LETT J
                                 (PROGN
                                  (LETT #4# NIL)
                                  (SEQ (LETT |int| NIL)
                                       (LETT #3# (|REAL0;Zero1| H $)) G190
                                       (COND
                                        ((OR (ATOM #3#)
                                             (PROGN
                                              (LETT |int| (CAR #3#))
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #4#
                                               (CONS
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL (QCAR |int|)
                                                            (|spadConstant| $
                                                                            10)
                                                            (QREFELT $ 13))
                                                  (SPADCALL 1 2 (QREFELT $ 12))
                                                  (QREFELT $ 14))
                                                 (SPADCALL
                                                  (SPADCALL (QCDR |int|)
                                                            (|spadConstant| $
                                                                            10)
                                                            (QREFELT $ 13))
                                                  (SPADCALL 1 2 (QREFELT $ 12))
                                                  (QREFELT $ 14)))
                                                #4#))))
                                       (LETT #3# (CDR #3#)) (GO G190) G191
                                       (EXIT (NREVERSE #4#)))))
                           (LETT K
                                 (PROGN
                                  (LETT #2# NIL)
                                  (SEQ (LETT |int| NIL)
                                       (LETT #1# (|REAL0;Zero1| G $)) G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |int| (CAR #1#))
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (CONS
                                                 (SPADCALL (QCAR |int|)
                                                           (SPADCALL 1 2
                                                                     (QREFELT $
                                                                              12))
                                                           (QREFELT $ 14))
                                                 (SPADCALL (QCDR |int|)
                                                           (SPADCALL 1 2
                                                                     (QREFELT $
                                                                              12))
                                                           (QREFELT $ 14)))
                                                #2#))))
                                       (LETT #1# (CDR #1#)) (GO G190) G191
                                       (EXIT (NREVERSE #2#)))))
                           (EXIT
                            (SPADCALL (SPADCALL J L (QREFELT $ 46)) K
                                      (QREFELT $ 46)))))))))) 

(SDEFUN |REAL0;rootBound| ((F |Pol|) ($ |Integer|))
        (SPROG
         ((|b| (|Integer|)) (|i| (|Integer|)) (|an| #1=(|Integer|))
          (|lcoef| #1#))
         (SEQ
          (COND
           ((< (SPADCALL F (QREFELT $ 50)) 0)
            (LETT F (SPADCALL F (QREFELT $ 51)))))
          (LETT |lcoef| (SPADCALL F (QREFELT $ 50)))
          (LETT F (SPADCALL F (QREFELT $ 52))) (LETT |i| 0)
          (SEQ G190
               (COND
                ((NULL
                  (NULL (SPADCALL F (|spadConstant| $ 35) (QREFELT $ 37))))
                 (GO G191)))
               (SEQ
                (SEQ (LETT |an| (SPADCALL F (QREFELT $ 50)))
                     (EXIT (COND ((< |an| 0) (LETT |i| (- |i| |an|))))))
                (EXIT (LETT F (SPADCALL F (QREFELT $ 52)))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |b| 1)
          (SEQ G190
               (COND
                ((NULL (SPADCALL (* |b| |lcoef|) |i| (QREFELT $ 53)))
                 (GO G191)))
               (SEQ (EXIT (LETT |b| (SPADCALL 2 |b| (QREFELT $ 55))))) NIL
               (GO G190) G191 (EXIT NIL))
          (EXIT |b|)))) 

(SDEFUN |REAL0;transMult| ((|c| |Integer|) (F |Pol|) ($ |Pol|))
        (SPROG ((G (|Pol|)) (|n| (|NonNegativeInteger|)))
               (SEQ (LETT G (|spadConstant| $ 35))
                    (SEQ G190
                         (COND
                          ((NULL
                            (NULL
                             (SPADCALL F (|spadConstant| $ 35)
                                       (QREFELT $ 37))))
                           (GO G191)))
                         (SEQ (LETT |n| (SPADCALL F (QREFELT $ 39)))
                              (LETT G
                                    (SPADCALL G
                                              (SPADCALL
                                               (* (EXPT |c| |n|)
                                                  (SPADCALL F (QREFELT $ 50)))
                                               |n| (QREFELT $ 43))
                                              (QREFELT $ 49)))
                              (EXIT (LETT F (SPADCALL F (QREFELT $ 52)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT G)))) 

(SDEFUN |REAL0;transMultInv| ((|c| |Integer|) (F |Pol|) ($ |Pol|))
        (SPROG
         ((|d| #1=(|NonNegativeInteger|)) (G (|Pol|)) (|cc| (|Integer|))
          (#2=#:G189 NIL) (|n| #1#))
         (SEQ (LETT |d| (SPADCALL F (QREFELT $ 39))) (LETT |cc| 1)
              (LETT G
                    (SPADCALL (SPADCALL F (QREFELT $ 50)) |d| (QREFELT $ 43)))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL (LETT F (SPADCALL F (QREFELT $ 52)))
                                (|spadConstant| $ 35) (QREFELT $ 56)))
                     (GO G191)))
                   (SEQ (LETT |n| (SPADCALL F (QREFELT $ 39)))
                        (LETT |cc|
                              (* |cc|
                                 (EXPT |c|
                                       (PROG1 (LETT #2# (- |d| |n|))
                                         (|check_subtype2| (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|)
                                                           #2#)))))
                        (LETT G
                              (SPADCALL G
                                        (SPADCALL
                                         (* |cc| (SPADCALL F (QREFELT $ 50)))
                                         |n| (QREFELT $ 43))
                                        (QREFELT $ 49)))
                        (EXIT (LETT |d| |n|)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT G)))) 

(SDEFUN |REAL0;transAdd1| ((F |Pol|) ($ |Pol|))
        (SPROG
         ((|ans| (|Pol|)) (#1=#:G201 NIL) (|i| NIL) (#2=#:G200 NIL) (|j| NIL)
          (#3=#:G199 NIL) (|v| (|Vector| (|Integer|)))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL F (QREFELT $ 39)))
              (LETT |v| (SPADCALL F (+ |n| 1) (QREFELT $ 58)))
              (SEQ (LETT |i| 0) (LETT #3# (- |n| 1)) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (- |n| |i|)) (LETT #2# |n|) G190
                          (COND ((> |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF1O |v| |j|
                                        (+ (QAREF1O |v| |j| 1)
                                           (QAREF1O |v| (+ |j| 1) 1))
                                        1)))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |ans| (|spadConstant| $ 35))
              (SEQ (LETT |i| 0) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |ans|
                           (SPADCALL |ans|
                                     (SPADCALL (QAREF1O |v| (+ |i| 1) 1) |i|
                                               (QREFELT $ 43))
                                     (QREFELT $ 49)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |REAL0;minus| ((F |Pol|) ($ |Pol|))
        (SPROG ((G (|Pol|)) (|coef| (|Integer|)) (|n| (|NonNegativeInteger|)))
               (SEQ (LETT G (|spadConstant| $ 35))
                    (SEQ G190
                         (COND
                          ((NULL
                            (NULL
                             (SPADCALL F (|spadConstant| $ 35)
                                       (QREFELT $ 37))))
                           (GO G191)))
                         (SEQ (LETT |n| (SPADCALL F (QREFELT $ 39)))
                              (LETT |coef| (SPADCALL F (QREFELT $ 50)))
                              (EXIT
                               (COND
                                ((ODDP |n|)
                                 (SEQ
                                  (LETT G
                                        (SPADCALL G
                                                  (SPADCALL (- |coef|) |n|
                                                            (QREFELT $ 43))
                                                  (QREFELT $ 49)))
                                  (EXIT (LETT F (SPADCALL F (QREFELT $ 52))))))
                                ('T
                                 (SEQ
                                  (LETT G
                                        (SPADCALL G
                                                  (SPADCALL |coef| |n|
                                                            (QREFELT $ 43))
                                                  (QREFELT $ 49)))
                                  (EXIT
                                   (LETT F (SPADCALL F (QREFELT $ 52)))))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT G)))) 

(SDEFUN |REAL0;invert| ((F |Pol|) ($ |Pol|))
        (SPROG ((G (|Pol|)) (#1=#:G208 NIL) (|n| (|NonNegativeInteger|)))
               (SEQ (LETT G (|spadConstant| $ 35))
                    (LETT |n| (SPADCALL F (QREFELT $ 39)))
                    (SEQ G190
                         (COND
                          ((NULL
                            (NULL
                             (SPADCALL F (|spadConstant| $ 35)
                                       (QREFELT $ 37))))
                           (GO G191)))
                         (SEQ
                          (LETT G
                                (SPADCALL G
                                          (SPADCALL (SPADCALL F (QREFELT $ 50))
                                                    (PROG1
                                                        (LETT #1#
                                                              (- |n|
                                                                 (SPADCALL F
                                                                           (QREFELT
                                                                            $
                                                                            39))))
                                                      (|check_subtype2|
                                                       (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                                    (QREFELT $ 43))
                                          (QREFELT $ 49)))
                          (EXIT (LETT F (SPADCALL F (QREFELT $ 52)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT G)))) 

(SDEFUN |REAL0;var| ((F |Pol|) ($ |Integer|))
        (SPROG ((|LastCoef| #1=(|Boolean|)) (|i| (|Integer|)) (|next| #1#))
               (SEQ (LETT |i| 0)
                    (LETT |LastCoef| (< (SPADCALL F (QREFELT $ 50)) 0))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SEQ (LETT F (SPADCALL F (QREFELT $ 52)))
                                 (EXIT
                                  (NULL
                                   (SPADCALL F (|spadConstant| $ 35)
                                             (QREFELT $ 37))))))
                           (GO G191)))
                         (SEQ (LETT |next| (< (SPADCALL F (QREFELT $ 50)) 0))
                              (COND
                               (|LastCoef|
                                (COND
                                 ((NULL |next|)
                                  (COND (|LastCoef| (LETT |i| (+ |i| 1)))))))
                               ((OR |next| |LastCoef|) (LETT |i| (+ |i| 1))))
                              (EXIT (LETT |LastCoef| |next|)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |i|)))) 

(SDEFUN |REAL0;refine;Pol2RU;19|
        ((F |Pol|)
         (|int| |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|))))
         (|bounds| |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|))))
         ($ |Union|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))
          "failed"))
        (SPROG
         ((|pt| (|Fraction| (|Integer|))) (|lseg| (|Fraction| (|Integer|))))
         (SEQ
          (LETT |lseg|
                (SPADCALL
                 (SPADCALL (QCDR |int|) (QCDR |bounds|) (QREFELT $ 59))
                 (SPADCALL (QCAR |int|) (QCAR |bounds|) (QREFELT $ 60))
                 (QREFELT $ 61)))
          (EXIT
           (COND
            ((SPADCALL |lseg| (|spadConstant| $ 42) (QREFELT $ 62))
             (CONS 1 "failed"))
            ((SPADCALL |lseg| (|spadConstant| $ 42) (QREFELT $ 63))
             (SEQ
              (LETT |pt|
                    (COND
                     ((SPADCALL (QCAR |int|) (QCDR |bounds|) (QREFELT $ 63))
                      (QCAR |int|))
                     (#1='T (QCDR |int|))))
              (EXIT
               (COND
                ((EQL
                  (SPADCALL
                   (|REAL0;transMultInv| (SPADCALL |pt| (QREFELT $ 64)) F $)
                   (SPADCALL |pt| (QREFELT $ 65)) (QREFELT $ 66))
                  0)
                 (CONS 0 (CONS |pt| |pt|)))
                (#1# (CONS 1 "failed"))))))
            (#1#
             (COND
              ((SPADCALL |lseg|
                         (SPADCALL (QCDR |int|) (QCAR |int|) (QREFELT $ 61))
                         (QREFELT $ 63))
               (CONS 0 |int|))
              (#1#
               (SPADCALL F (SPADCALL F |int| |lseg| (QREFELT $ 29)) |bounds|
                         (QREFELT $ 32)))))))))) 

(SDEFUN |REAL0;refine;PolRFR;20|
        ((F |Pol|)
         (|int| |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|))))
         (|eps| |Fraction| (|Integer|))
         ($ |Record| (|:| |left| (|Fraction| (|Integer|)))
          (|:| |right| (|Fraction| (|Integer|)))))
        (SPROG
         ((|xfl| (|Boolean|)) (|ad| #1=(|Integer|)) (|an| #2=(|Integer|))
          (|b| (|Fraction| (|Integer|))) (|a| (|Fraction| (|Integer|)))
          (|bd| #1#) (|bn| #2#) (|v| #3=(|Integer|)) (|midd| #1#) (|midn| #2#)
          (|mid| (|Fraction| (|Integer|))) (|u| #3#) (#4=#:G229 NIL))
         (SEQ (LETT |a| (QCAR |int|)) (LETT |b| (QCDR |int|))
              (EXIT
               (COND ((SPADCALL |a| |b| (QREFELT $ 63)) (CONS |a| |b|))
                     ('T
                      (SEQ (LETT |an| (SPADCALL |a| (QREFELT $ 65)))
                           (LETT |ad| (SPADCALL |a| (QREFELT $ 64)))
                           (LETT |bn| (SPADCALL |b| (QREFELT $ 65)))
                           (LETT |bd| (SPADCALL |b| (QREFELT $ 64)))
                           (LETT |xfl| NIL)
                           (SEQ
                            (LETT |u|
                                  (SPADCALL (|REAL0;transMultInv| |ad| F $)
                                            |an| (QREFELT $ 66)))
                            (EXIT
                             (COND
                              ((EQL |u| 0)
                               (SEQ
                                (LETT F
                                      (PROG2
                                          (LETT #4#
                                                (SPADCALL F
                                                          (SPADCALL
                                                           (SPADCALL |ad| 1
                                                                     (QREFELT $
                                                                              43))
                                                           (SPADCALL |an| 0
                                                                     (QREFELT $
                                                                              43))
                                                           (QREFELT $ 67))
                                                          (QREFELT $ 45)))
                                          (QCDR #4#)
                                        (|check_union2| (QEQCAR #4# 0)
                                                        (QREFELT $ 6)
                                                        (|Union| (QREFELT $ 6)
                                                                 #5="failed")
                                                        #4#)))
                                (EXIT
                                 (LETT |u|
                                       (SPADCALL
                                        (|REAL0;transMultInv| |ad| F $) |an|
                                        (QREFELT $ 66)))))))))
                           (SEQ
                            (LETT |v|
                                  (SPADCALL (|REAL0;transMultInv| |bd| F $)
                                            |bn| (QREFELT $ 66)))
                            (EXIT
                             (COND
                              ((EQL |v| 0)
                               (SEQ
                                (LETT F
                                      (PROG2
                                          (LETT #4#
                                                (SPADCALL F
                                                          (SPADCALL
                                                           (SPADCALL |bd| 1
                                                                     (QREFELT $
                                                                              43))
                                                           (SPADCALL |bn| 0
                                                                     (QREFELT $
                                                                              43))
                                                           (QREFELT $ 67))
                                                          (QREFELT $ 45)))
                                          (QCDR #4#)
                                        (|check_union2| (QEQCAR #4# 0)
                                                        (QREFELT $ 6)
                                                        (|Union| (QREFELT $ 6)
                                                                 #5#)
                                                        #4#)))
                                (LETT |v|
                                      (SPADCALL (|REAL0;transMultInv| |bd| F $)
                                                |bn| (QREFELT $ 66)))
                                (EXIT
                                 (LETT |u|
                                       (SPADCALL
                                        (|REAL0;transMultInv| |ad| F $) |an|
                                        (QREFELT $ 66)))))))))
                           (COND
                            ((SPADCALL |u| 0 (QREFELT $ 48))
                             (SEQ (LETT F (SPADCALL F (QREFELT $ 51)))
                                  (EXIT (LETT |v| (- |v|))))))
                           (COND
                            ((< |v| 0)
                             (|error|
                              (LIST '|mathprint|
                                    (LIST 'CONCAT
                                          (|coerceRe2E| |int|
                                                        (ELT
                                                         (|Record|
                                                          (|:| |left|
                                                               (|Fraction|
                                                                (|Integer|)))
                                                          (|:| |right|
                                                               (|Fraction|
                                                                (|Integer|))))
                                                         0))
                                          (SPADCALL
                                           "is not a valid isolation interval for"
                                           (QREFELT $ 70))
                                          (SPADCALL F (QREFELT $ 71)))))))
                           (COND
                            ((SPADCALL |eps| (|spadConstant| $ 42)
                                       (QREFELT $ 72))
                             (|error| "precision must be positive")))
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (SPADCALL (SPADCALL |b| |a| (QREFELT $ 61))
                                             |eps| (QREFELT $ 73)))
                                  (GO G191)))
                                (SEQ
                                 (LETT |mid|
                                       (SPADCALL
                                        (SPADCALL |b| |a| (QREFELT $ 13))
                                        (SPADCALL 1 2 (QREFELT $ 12))
                                        (QREFELT $ 14)))
                                 (LETT |midn| (SPADCALL |mid| (QREFELT $ 65)))
                                 (LETT |midd| (SPADCALL |mid| (QREFELT $ 64)))
                                 (LETT |v|
                                       (SPADCALL
                                        (|REAL0;transMultInv| |midd| F $)
                                        |midn| (QREFELT $ 66)))
                                 (EXIT
                                  (COND
                                   ((< |v| 0)
                                    (SEQ (LETT |a| |mid|) (LETT |an| |midn|)
                                         (EXIT (LETT |ad| |midd|))))
                                   ((SPADCALL |v| 0 (QREFELT $ 48))
                                    (SEQ (LETT |b| |mid|) (LETT |bn| |midn|)
                                         (EXIT (LETT |bd| |midd|))))
                                   ((EQL |v| 0)
                                    (SEQ (LETT |a| |mid|) (LETT |b| |mid|)
                                         (LETT |an| |midn|) (LETT |ad| |midd|)
                                         (EXIT (LETT |xfl| 'T)))))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT (CONS |a| |b|))))))))) 

(DECLAIM (NOTINLINE |RealZeroPackage;|)) 

(DEFUN |RealZeroPackage| (#1=#:G244)
  (SPROG NIL
         (PROG (#2=#:G245)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RealZeroPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|RealZeroPackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RealZeroPackage|)))))))))) 

(DEFUN |RealZeroPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|RealZeroPackage| DV$1))
          (LETT $ (GETREFV 74))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|RealZeroPackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|RealZeroPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Fraction| 11) (0 . -)
              (5 . |One|) (9 . |One|) (|Integer|) (13 . /) (19 . +) (25 . *)
              (|Record| (|:| |left| 7) (|:| |right| 7)) |REAL0;midpoint;RF;2|
              (|List| 7) (|List| 15) |REAL0;midpoints;LL;3| (|Factored| $)
              (31 . |squareFree|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 22) (|:| |factor| 6) (|:| |exponent| 38))
              (|List| 23) (|Factored| 6) (36 . |factorList|) (41 . *)
              |REAL0;realZeros;PolL;5| |REAL0;refine;PolRFR;20|
              |REAL0;realZeros;PolFL;6| (|Union| 15 '#1="failed")
              |REAL0;refine;Pol2RU;19| |REAL0;realZeros;PolRL;7|
              |REAL0;realZeros;PolRFL;8| (47 . |Zero|) (|Boolean|) (51 . =)
              (|NonNegativeInteger|) (57 . |degree|) (62 . |minimumDegree|)
              (67 . >) (73 . |Zero|) (77 . |monomial|) (|Union| $ '"failed")
              (83 . |exquo|) (89 . |append|) (95 . *) (101 . >) (107 . +)
              (113 . |leadingCoefficient|) (118 . -) (123 . |reductum|)
              (128 . <=) (|PositiveInteger|) (134 . *) (140 . ~=) (|Vector| 11)
              (146 . |vectorise|) (152 . |min|) (158 . |max|) (164 . -)
              (170 . <) (176 . =) (182 . |denom|) (187 . |numer|) (192 . |elt|)
              (198 . -) (|OutputForm|) (|String|) (204 . |coerce|)
              (209 . |coerce|) (214 . <=) (220 . >=))
           '#(|refine| 226 |realZeros| 240 |midpoints| 264 |midpoint| 269) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|realZeros|
                                 ((|List|
                                   (|Record|
                                    (|:| |left| (|Fraction| (|Integer|)))
                                    (|:| |right| (|Fraction| (|Integer|)))))
                                  |#1|))
                                T)
                              '((|realZeros|
                                 ((|List|
                                   (|Record|
                                    (|:| |left| (|Fraction| (|Integer|)))
                                    (|:| |right| (|Fraction| (|Integer|)))))
                                  |#1|
                                  (|Record|
                                   (|:| |left| (|Fraction| (|Integer|)))
                                   (|:| |right| (|Fraction| (|Integer|))))))
                                T)
                              '((|realZeros|
                                 ((|List|
                                   (|Record|
                                    (|:| |left| (|Fraction| (|Integer|)))
                                    (|:| |right| (|Fraction| (|Integer|)))))
                                  |#1| (|Fraction| (|Integer|))))
                                T)
                              '((|realZeros|
                                 ((|List|
                                   (|Record|
                                    (|:| |left| (|Fraction| (|Integer|)))
                                    (|:| |right| (|Fraction| (|Integer|)))))
                                  |#1|
                                  (|Record|
                                   (|:| |left| (|Fraction| (|Integer|)))
                                   (|:| |right| (|Fraction| (|Integer|))))
                                  (|Fraction| (|Integer|))))
                                T)
                              '((|refine|
                                 ((|Record|
                                   (|:| |left| (|Fraction| (|Integer|)))
                                   (|:| |right| (|Fraction| (|Integer|))))
                                  |#1|
                                  (|Record|
                                   (|:| |left| (|Fraction| (|Integer|)))
                                   (|:| |right| (|Fraction| (|Integer|))))
                                  (|Fraction| (|Integer|))))
                                T)
                              '((|refine|
                                 ((|Union|
                                   (|Record|
                                    (|:| |left| (|Fraction| (|Integer|)))
                                    (|:| |right| (|Fraction| (|Integer|))))
                                   #1#)
                                  |#1|
                                  (|Record|
                                   (|:| |left| (|Fraction| (|Integer|)))
                                   (|:| |right| (|Fraction| (|Integer|))))
                                  (|Record|
                                   (|:| |left| (|Fraction| (|Integer|)))
                                   (|:| |right| (|Fraction| (|Integer|))))))
                                T)
                              '((|midpoint|
                                 ((|Fraction| (|Integer|))
                                  (|Record|
                                   (|:| |left| (|Fraction| (|Integer|)))
                                   (|:| |right| (|Fraction| (|Integer|))))))
                                T)
                              '((|midpoints|
                                 ((|List| (|Fraction| (|Integer|)))
                                  (|List|
                                   (|Record|
                                    (|:| |left| (|Fraction| (|Integer|)))
                                    (|:| |right| (|Fraction| (|Integer|)))))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 73
                                            '(1 7 0 0 8 0 6 0 9 0 7 0 10 2 7 0
                                              11 11 12 2 7 0 0 0 13 2 7 0 0 7
                                              14 1 6 20 0 21 1 25 24 0 26 2 6 0
                                              0 0 27 0 6 0 35 2 6 36 0 0 37 1 6
                                              38 0 39 1 6 38 0 40 2 38 36 0 0
                                              41 0 7 0 42 2 6 0 11 38 43 2 6 44
                                              0 0 45 2 18 0 0 0 46 2 7 0 11 0
                                              47 2 11 36 0 0 48 2 6 0 0 0 49 1
                                              6 11 0 50 1 6 0 0 51 1 6 0 0 52 2
                                              11 36 0 0 53 2 11 0 54 0 55 2 6
                                              36 0 0 56 2 6 57 0 38 58 2 7 0 0
                                              0 59 2 7 0 0 0 60 2 7 0 0 0 61 2
                                              7 36 0 0 62 2 7 36 0 0 63 1 7 11
                                              0 64 1 7 11 0 65 2 6 11 0 11 66 2
                                              6 0 0 0 67 1 69 68 0 70 1 6 68 0
                                              71 2 7 36 0 0 72 2 7 36 0 0 73 3
                                              0 31 6 15 15 32 3 0 15 6 15 7 29
                                              2 0 18 6 15 33 1 0 18 6 28 3 0 18
                                              6 15 7 34 2 0 18 6 7 30 1 0 17 18
                                              19 1 0 7 15 16)))))
           '|lookupComplete|)) 
