
(SDEFUN |DDFACT;ranpol| ((|d| |NonNegativeInteger|) ($ FP))
        (SPROG
         ((|u| (FP)) (#1=#:G120 NIL) (|j| NIL) (|k1| (|NonNegativeInteger|)))
         (SEQ (LETT |k1| 0 . #2=(|DDFACT;ranpol|))
              (SEQ G190 (COND ((NULL (EQL |k1| 0)) (GO G191)))
                   (SEQ (EXIT (LETT |k1| (RANDOM |d|) . #2#))) NIL (GO G190)
                   G191 (EXIT NIL))
              (EXIT
               (COND
                ((QREFELT $ 11)
                 (SEQ (LETT |u| (|spadConstant| $ 13) . #2#)
                      (SEQ (LETT |j| 1 . #2#) G190
                           (COND ((|greater_SI| |j| |k1|) (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |u|
                                   (SPADCALL |u|
                                             (SPADCALL
                                              (SPADCALL (QREFELT $ 14)) |j|
                                              (QREFELT $ 15))
                                             (QREFELT $ 16))
                                   . #2#)))
                           (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT |u|)))
                ('T
                 (SEQ
                  (LETT |u|
                        (SPADCALL (|spadConstant| $ 17) |k1| (QREFELT $ 15))
                        . #2#)
                  (SEQ (LETT |j| 0 . #2#) (LETT #1# (- |k1| 1) . #2#) G190
                       (COND ((|greater_SI| |j| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |u|
                               (SPADCALL |u|
                                         (SPADCALL (SPADCALL (QREFELT $ 14))
                                                   |j| (QREFELT $ 15))
                                         (QREFELT $ 16))
                               . #2#)))
                       (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |u|)))))))) 

(SDEFUN |DDFACT;notSqFr|
        ((|m| FP) (|appl| |Mapping| (|List| FP) FP)
         ($ |List| (|Record| (|:| |irr| FP) (|:| |pow| (|Integer|)))))
        (SPROG
         ((|factlist|
           (|List| (|Record| (|:| |irr| FP) (|:| |pow| (|Integer|)))))
          (#1=#:G133 NIL) (|pf| NIL) (#2=#:G132 NIL) (|fln| (|List| FP))
          (|pol| (FP)) (|lcp| (F)) (|d1| (|Integer|)) (#3=#:G131 NIL)
          (|lf| NIL)
          (|llf|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| FP) (|:| |xpnt| (|Integer|)))))
          (|lcm| (F)))
         (SEQ (LETT |factlist| NIL . #4=(|DDFACT;notSqFr|))
              (LETT |fln| NIL . #4#)
              (COND
               ((SPADCALL (LETT |lcm| (SPADCALL |m| (QREFELT $ 19)) . #4#)
                          (|spadConstant| $ 17) (QREFELT $ 21))
                (LETT |m|
                      (SPADCALL (SPADCALL |lcm| (QREFELT $ 22)) |m|
                                (QREFELT $ 23))
                      . #4#)))
              (LETT |llf|
                    (SPADCALL (SPADCALL |m| (QREFELT $ 25)) (QREFELT $ 30))
                    . #4#)
              (SEQ (LETT |lf| NIL . #4#) (LETT #3# |llf| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |lf| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |d1| (QVELT |lf| 2) . #4#)
                        (LETT |pol| (QVELT |lf| 1) . #4#)
                        (COND
                         ((SPADCALL
                           (LETT |lcp| (SPADCALL |pol| (QREFELT $ 19)) . #4#)
                           (|spadConstant| $ 17) (QREFELT $ 21))
                          (LETT |pol|
                                (SPADCALL (SPADCALL |lcp| (QREFELT $ 22)) |pol|
                                          (QREFELT $ 23))
                                . #4#)))
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |pol| (QREFELT $ 31)) 1)
                           (LETT |factlist| (CONS (CONS |pol| |d1|) |factlist|)
                                 . #4#))
                          ('T
                           (SEQ (LETT |fln| (SPADCALL |pol| |appl|) . #4#)
                                (EXIT
                                 (LETT |factlist|
                                       (APPEND
                                        (PROGN
                                         (LETT #2# NIL . #4#)
                                         (SEQ (LETT |pf| NIL . #4#)
                                              (LETT #1# |fln| . #4#) G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |pf| (CAR #1#)
                                                           . #4#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS (CONS |pf| |d1|)
                                                            #2#)
                                                      . #4#)))
                                              (LETT #1# (CDR #1#) . #4#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #2#))))
                                        |factlist|)
                                       . #4#)))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |factlist|)))) 

(SDEFUN |DDFACT;exptMod;FPNni2FP;3|
        ((|u| FP) (|k| |NonNegativeInteger|) (|v| FP) ($ FP))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 32)) |k| (QREFELT $ 33))
                  |v| (QREFELT $ 34))) 

(SDEFUN |DDFACT;trace2PowMod;FPNni2FP;4|
        ((|u| FP) (|k| |NonNegativeInteger|) (|v| FP) ($ FP))
        (SPROG ((|uu| (FP)) (|i| NIL))
               (SEQ (LETT |uu| |u| . #1=(|DDFACT;trace2PowMod;FPNni2FP;4|))
                    (SEQ (LETT |i| 1 . #1#) G190
                         (COND ((|greater_SI| |i| |k|) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |uu|
                                 (SPADCALL
                                  (SPADCALL |u|
                                            (SPADCALL |uu| |uu| (QREFELT $ 36))
                                            (QREFELT $ 16))
                                  |v| (QREFELT $ 34))
                                 . #1#)))
                         (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |uu|)))) 

(SDEFUN |DDFACT;tracePowMod;FPNni2FP;5|
        ((|u| FP) (|k| |NonNegativeInteger|) (|v| FP) ($ FP))
        (SPROG ((|uu| (D)) (|i| NIL) (|u1| (D)))
               (SEQ
                (LETT |u1| (SPADCALL |u| (QREFELT $ 32))
                      . #1=(|DDFACT;tracePowMod;FPNni2FP;5|))
                (LETT |uu| |u1| . #1#)
                (SEQ (LETT |i| 1 . #1#) G190
                     (COND ((|greater_SI| |i| |k|) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |uu|
                             (SPADCALL |u1| (SPADCALL |uu| (QREFELT $ 38))
                                       (QREFELT $ 39))
                             . #1#)))
                     (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL (SPADCALL |uu| (QREFELT $ 40)) |v|
                           (QREFELT $ 34)))))) 

(SDEFUN |DDFACT;normPowMod|
        ((|u| FP) (|k| |NonNegativeInteger|) (|v| FP) ($ FP))
        (SPROG ((|uu| (D)) (|i| NIL) (|u1| (D)))
               (SEQ
                (LETT |u1| (SPADCALL |u| (QREFELT $ 32))
                      . #1=(|DDFACT;normPowMod|))
                (LETT |uu| |u1| . #1#)
                (SEQ (LETT |i| 1 . #1#) G190
                     (COND ((|greater_SI| |i| |k|) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |uu|
                             (SPADCALL |u1| (SPADCALL |uu| (QREFELT $ 38))
                                       (QREFELT $ 42))
                             . #1#)))
                     (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL (SPADCALL |uu| (QREFELT $ 40)) |v|
                           (QREFELT $ 34)))))) 

(SDEFUN |DDFACT;ddffact1|
        ((|m| FP) (|testirr| |Boolean|)
         ($ |List|
          (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |prod| FP))))
        (SPROG
         ((#1=#:G152 NIL) (|du| (|NonNegativeInteger|)) (|u| (FP))
          (|ddfact|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |prod| FP))))
          (|g| (FP)) (|dg| (|NonNegativeInteger|)) (|v| (FP)) (|k1| NIL)
          (|mon| (FP)) (|p| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |p| (SPADCALL (QREFELT $ 43)) . #2=(|DDFACT;ddffact1|))
                (LETT |dg| 0 . #2#) (LETT |ddfact| NIL . #2#)
                (LETT |u| |m| . #2#)
                (LETT |du| (SPADCALL |u| (QREFELT $ 31)) . #2#)
                (SPADCALL |u| (QREFELT $ 44))
                (LETT |mon| (SPADCALL (|spadConstant| $ 17) 1 (QREFELT $ 15))
                      . #2#)
                (LETT |v| |mon| . #2#)
                (SEQ (LETT |k1| 1 . #2#) G190
                     (COND
                      ((NULL (SPADCALL |k1| (QUOTIENT2 |du| 2) (QREFELT $ 45)))
                       (GO G191)))
                     (SEQ
                      (LETT |v|
                            (SPADCALL
                             (SPADCALL (SPADCALL |v| (QREFELT $ 32))
                                       (QREFELT $ 38))
                             (QREFELT $ 40))
                            . #2#)
                      (LETT |g|
                            (SPADCALL (SPADCALL |v| |mon| (QREFELT $ 46)) |u|
                                      (QREFELT $ 47))
                            . #2#)
                      (LETT |dg| (SPADCALL |g| (QREFELT $ 31)) . #2#)
                      (EXIT
                       (COND ((EQL |dg| 0) "next k1")
                             ('T
                              (SEQ
                               (COND
                                ((SPADCALL (SPADCALL |g| (QREFELT $ 19))
                                           (|spadConstant| $ 17)
                                           (QREFELT $ 21))
                                 (LETT |g|
                                       (SPADCALL
                                        (SPADCALL (SPADCALL |g| (QREFELT $ 19))
                                                  (QREFELT $ 22))
                                        |g| (QREFELT $ 23))
                                       . #2#)))
                               (LETT |ddfact| (CONS (CONS |k1| |g|) |ddfact|)
                                     . #2#)
                               (EXIT
                                (COND
                                 (|testirr|
                                  (PROGN
                                   (LETT #1# |ddfact| . #2#)
                                   (GO #3=#:G151)))
                                 ('T
                                  (SEQ
                                   (LETT |u| (SPADCALL |u| |g| (QREFELT $ 48))
                                         . #2#)
                                   (LETT |du| (SPADCALL |u| (QREFELT $ 31))
                                         . #2#)
                                   (EXIT
                                    (COND
                                     ((EQL |du| 0)
                                      (PROGN
                                       (LETT #1# |ddfact| . #2#)
                                       (GO #3#)))
                                     ('T
                                      (SPADCALL |u| (QREFELT $ 44))))))))))))))
                     (LETT |k1| (|inc_SI| |k1|) . #2#) (GO G190) G191
                     (EXIT NIL))
                (EXIT (CONS (CONS |du| |u|) |ddfact|))))
          #3# (EXIT #1#)))) 

(SDEFUN |DDFACT;irreducible?;FPB;8| ((|m| FP) ($ |Boolean|))
        (SPROG
         ((|mf| (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |prod| FP))))
         (SEQ
          (LETT |mf| (|SPADfirst| (|DDFACT;ddffact1| |m| 'T $))
                |DDFACT;irreducible?;FPB;8|)
          (EXIT (EQL (SPADCALL |m| (QREFELT $ 31)) (QCAR |mf|)))))) 

(SDEFUN |DDFACT;separateDegrees;FPL;9|
        ((|m| FP)
         ($ |List|
          (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |prod| FP))))
        (|DDFACT;ddffact1| |m| 'NIL $)) 

(SDEFUN |DDFACT;separateFactors;LL;10|
        ((|distf| |List|
          (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |prod| FP)))
         ($ |List| FP))
        (SPROG
         ((|aux| (|List| FP)) (|newaux| #1=(|List| FP)) (|ris| #1#) (|v| (FP))
          (|dg| (|NonNegativeInteger|)) (|g| (FP)) (#2=#:G172 NIL) (|u| NIL)
          (|t| (FP)) (#3=#:G160 NIL) (#4=#:G159 NIL)
          (|d| (|NonNegativeInteger|)) (|fprod| (FP)) (#5=#:G171 NIL)
          (|ffprod| NIL) (|n1| (|Integer|)) (|p1| (|NonNegativeInteger|))
          (|ddfact|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |prod| FP)))))
         (SEQ (LETT |ddfact| |distf| . #6=(|DDFACT;separateFactors;LL;10|))
              (LETT |p1| (SPADCALL (QREFELT $ 43)) . #6#)
              (COND
               ((QREFELT $ 11) (LETT |n1| (- (INTEGER-LENGTH |p1|) 1) . #6#)))
              (LETT |ris| NIL . #6#)
              (SEQ (LETT |ffprod| NIL . #6#) (LETT #5# |ddfact| . #6#) G190
                   (COND
                    ((OR (ATOM #5#)
                         (PROGN (LETT |ffprod| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ (LETT |fprod| (QCDR |ffprod|) . #6#)
                        (LETT |d| (QCAR |ffprod|) . #6#)
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |fprod| (QREFELT $ 31)) |d|)
                           (LETT |ris| (CONS |fprod| |ris|) . #6#))
                          ('T
                           (SEQ (LETT |aux| (LIST |fprod|) . #6#)
                                (SPADCALL |fprod| (QREFELT $ 44))
                                (EXIT
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND ((NULL |aux|) 'NIL) ('T 'T)))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |t|
                                             (|DDFACT;ranpol|
                                              (SPADCALL 2 |d| (QREFELT $ 54))
                                              $)
                                             . #6#)
                                       (COND
                                        ((QREFELT $ 11)
                                         (LETT |t|
                                               (SPADCALL |t|
                                                         (PROG1
                                                             (LETT #4#
                                                                   (-
                                                                    (* |n1|
                                                                       |d|)
                                                                    1)
                                                                   . #6#)
                                                           (|check_subtype|
                                                            (>= #4# 0)
                                                            '(|NonNegativeInteger|)
                                                            #4#))
                                                         |fprod|
                                                         (QREFELT $ 37))
                                               . #6#))
                                        ('T
                                         (LETT |t|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |t|
                                                           (PROG1
                                                               (LETT #3#
                                                                     (- |d| 1)
                                                                     . #6#)
                                                             (|check_subtype|
                                                              (>= #3# 0)
                                                              '(|NonNegativeInteger|)
                                                              #3#))
                                                           |fprod|
                                                           (QREFELT $ 41))
                                                 (QUOTIENT2 |p1| 2) |fprod|
                                                 (QREFELT $ 35))
                                                (|spadConstant| $ 18)
                                                (QREFELT $ 46))
                                               . #6#)))
                                       (LETT |newaux| NIL . #6#)
                                       (SEQ (LETT |u| NIL . #6#)
                                            (LETT #2# |aux| . #6#) G190
                                            (COND
                                             ((OR (ATOM #2#)
                                                  (PROGN
                                                   (LETT |u| (CAR #2#) . #6#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |g|
                                                   (SPADCALL |u| |t|
                                                             (QREFELT $ 47))
                                                   . #6#)
                                             (LETT |dg|
                                                   (SPADCALL |g|
                                                             (QREFELT $ 31))
                                                   . #6#)
                                             (COND
                                              ((OR (EQL |dg| 0)
                                                   (EQL |dg|
                                                        (SPADCALL |u|
                                                                  (QREFELT $
                                                                           31))))
                                               (EXIT
                                                (LETT |newaux|
                                                      (CONS |u| |newaux|)
                                                      . #6#))))
                                             (LETT |v|
                                                   (SPADCALL |u| |g|
                                                             (QREFELT $ 48))
                                                   . #6#)
                                             (COND
                                              ((EQL |dg| |d|)
                                               (LETT |ris|
                                                     (CONS
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |g|
                                                                  (QREFELT $
                                                                           19))
                                                        (QREFELT $ 22))
                                                       |g| (QREFELT $ 23))
                                                      |ris|)
                                                     . #6#))
                                              ('T
                                               (LETT |newaux|
                                                     (CONS |g| |newaux|)
                                                     . #6#)))
                                             (EXIT
                                              (COND
                                               ((EQL
                                                 (SPADCALL |v| (QREFELT $ 31))
                                                 |d|)
                                                (LETT |ris|
                                                      (CONS
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL |v|
                                                                   (QREFELT $
                                                                            19))
                                                         (QREFELT $ 22))
                                                        |v| (QREFELT $ 23))
                                                       |ris|)
                                                      . #6#))
                                               ('T
                                                (LETT |newaux|
                                                      (CONS |v| |newaux|)
                                                      . #6#)))))
                                            (LETT #2# (CDR #2#) . #6#)
                                            (GO G190) G191 (EXIT NIL))
                                       (EXIT (LETT |aux| |newaux| . #6#)))
                                      NIL (GO G190) G191 (EXIT NIL))))))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |ris|)))) 

(SDEFUN |DDFACT;ddffact| ((|m| FP) ($ |List| FP))
        (SPROG
         ((|ddfact|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |prod| FP)))))
         (SEQ (LETT |ddfact| (|DDFACT;ddffact1| |m| 'NIL $) |DDFACT;ddffact|)
              (EXIT
               (COND ((NULL |ddfact|) (LIST |m|))
                     ('T (SPADCALL |ddfact| (QREFELT $ 56)))))))) 

(SDEFUN |DDFACT;distdfact;FPBR;12|
        ((|m| FP) (|test| |Boolean|)
         ($ |Record| (|:| |cont| F)
          (|:| |factors|
               (|List| (|Record| (|:| |irr| FP) (|:| |pow| (|Integer|)))))))
        (SPROG
         ((|factlist|
           (|List| (|Record| (|:| |irr| FP) (|:| |pow| (|Integer|)))))
          (#1=#:G189 NIL) (|pol| NIL) (#2=#:G188 NIL) (|fln| (|List| FP))
          (|d| (|NonNegativeInteger|)) (|lcm| (F)))
         (SEQ (LETT |factlist| NIL . #3=(|DDFACT;distdfact;FPBR;12|))
              (LETT |fln| NIL . #3#)
              (COND
               ((SPADCALL (LETT |lcm| (SPADCALL |m| (QREFELT $ 19)) . #3#)
                          (|spadConstant| $ 17) (QREFELT $ 21))
                (LETT |m|
                      (SPADCALL (SPADCALL |lcm| (QREFELT $ 22)) |m|
                                (QREFELT $ 23))
                      . #3#)))
              (SEQ (LETT |d| (SPADCALL |m| (QREFELT $ 57)) . #3#)
                   (EXIT
                    (COND
                     ((SPADCALL |d| 0 (QREFELT $ 58))
                      (SEQ
                       (LETT |m|
                             (QCAR
                              (SPADCALL |m|
                                        (SPADCALL (|spadConstant| $ 17) |d|
                                                  (QREFELT $ 15))
                                        (QREFELT $ 60)))
                             . #3#)
                       (EXIT
                        (LETT |factlist|
                              (LIST
                               (CONS
                                (SPADCALL (|spadConstant| $ 17) 1
                                          (QREFELT $ 15))
                                |d|))
                              . #3#)))))))
              (LETT |d| (SPADCALL |m| (QREFELT $ 31)) . #3#)
              (EXIT
               (COND ((EQL |d| 0) (CONS |lcm| |factlist|))
                     ((EQL |d| 1)
                      (CONS |lcm| (CONS (CONS |m| |d|) |factlist|)))
                     (|test|
                      (SEQ (LETT |fln| (|DDFACT;ddffact| |m| $) . #3#)
                           (LETT |factlist|
                                 (APPEND
                                  (PROGN
                                   (LETT #2# NIL . #3#)
                                   (SEQ (LETT |pol| NIL . #3#)
                                        (LETT #1# |fln| . #3#) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |pol| (CAR #1#) . #3#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2# (CONS (CONS |pol| 1) #2#)
                                                . #3#)))
                                        (LETT #1# (CDR #1#) . #3#) (GO G190)
                                        G191 (EXIT (NREVERSE #2#))))
                                  |factlist|)
                                 . #3#)
                           (EXIT (CONS |lcm| |factlist|))))
                     ('T
                      (SEQ
                       (LETT |factlist|
                             (APPEND
                              (|DDFACT;notSqFr| |m|
                               (CONS (|function| |DDFACT;ddffact|) $) $)
                              |factlist|)
                             . #3#)
                       (EXIT (CONS |lcm| |factlist|))))))))) 

(SDEFUN |DDFACT;factor;FPF;13| ((|m| FP) ($ |Factored| FP))
        (SPROG
         ((#1=#:G201 NIL) (|u| NIL) (#2=#:G200 NIL)
          (|flist|
           (|Record| (|:| |cont| F)
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| FP)
                                     (|:| |pow| (|Integer|))))))))
         (SEQ
          (COND
           ((SPADCALL |m| (|spadConstant| $ 13) (QREFELT $ 64))
            (|spadConstant| $ 65))
           ('T
            (SEQ
             (LETT |flist| (SPADCALL |m| 'NIL (QREFELT $ 63))
                   . #3=(|DDFACT;factor;FPF;13|))
             (EXIT
              (SPADCALL (SPADCALL (QCAR |flist|) (QREFELT $ 66))
                        (PROGN
                         (LETT #2# NIL . #3#)
                         (SEQ (LETT |u| NIL . #3#)
                              (LETT #1# (QCDR |flist|) . #3#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (VECTOR (CONS 3 "prime") (QCAR |u|)
                                               (QCDR |u|))
                                       #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QREFELT $ 69))))))))) 

(SDEFUN |DDFACT;factorSquareFree;FPF;14| ((|m| FP) ($ |Factored| FP))
        (SPROG
         ((#1=#:G213 NIL) (|u| NIL) (#2=#:G212 NIL)
          (|flist|
           (|Record| (|:| |cont| F)
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| FP)
                                     (|:| |pow| (|Integer|))))))))
         (SEQ
          (COND
           ((SPADCALL |m| (|spadConstant| $ 13) (QREFELT $ 64))
            (|spadConstant| $ 65))
           ('T
            (SEQ
             (LETT |flist| (SPADCALL |m| 'T (QREFELT $ 63))
                   . #3=(|DDFACT;factorSquareFree;FPF;14|))
             (EXIT
              (SPADCALL (SPADCALL (QCAR |flist|) (QREFELT $ 66))
                        (PROGN
                         (LETT #2# NIL . #3#)
                         (SEQ (LETT |u| NIL . #3#)
                              (LETT #1# (QCDR |flist|) . #3#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (VECTOR (CONS 3 "prime") (QCAR |u|)
                                               (QCDR |u|))
                                       #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QREFELT $ 69))))))))) 

(DECLAIM (NOTINLINE |DistinctDegreeFactorize;|)) 

(DEFUN |DistinctDegreeFactorize| (&REST #1=#:G214)
  (SPROG NIL
         (PROG (#2=#:G215)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|DistinctDegreeFactorize|)
                                               '|domainEqualList|)
                    . #3=(|DistinctDegreeFactorize|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DistinctDegreeFactorize;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|DistinctDegreeFactorize|)))))))))) 

(DEFUN |DistinctDegreeFactorize;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|DistinctDegreeFactorize|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|DistinctDegreeFactorize| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 72) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|DistinctDegreeFactorize|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 (|ModMonic| |#1| |#2|))
          (QSETREFV $ 11 (EQL (SPADCALL (QREFELT $ 10)) 2))
          $))) 

(MAKEPROP '|DistinctDegreeFactorize| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'D
              (|NonNegativeInteger|) (0 . |characteristic|) '|charF|
              (4 . |Zero|) (8 . |Zero|) (12 . |random|) (16 . |monomial|)
              (22 . +) (28 . |One|) (32 . |One|) (36 . |leadingCoefficient|)
              (|Boolean|) (41 . ~=) (47 . |inv|) (52 . *) (|Factored| $)
              (58 . |squareFree|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 26) (|:| |fctr| 7) (|:| |xpnt| (|Integer|)))
              (|List| 27) (|Factored| 7) (63 . |factorList|) (68 . |degree|)
              (73 . |reduce|) (78 . ^) (84 . |rem|) |DDFACT;exptMod;FPNni2FP;3|
              (90 . *) |DDFACT;trace2PowMod;FPNni2FP;4| (96 . |frobenius|)
              (101 . +) (107 . |lift|) |DDFACT;tracePowMod;FPNni2FP;5|
              (112 . *) (118 . |size|) (122 . |setPoly|) (127 . <=) (133 . -)
              (139 . |gcd|) (145 . |quo|) |DDFACT;irreducible?;FPB;8|
              (|Record| (|:| |deg| 9) (|:| |prod| 7)) (|List| 50)
              |DDFACT;separateDegrees;FPL;9| (|PositiveInteger|) (151 . *)
              (|List| 7) |DDFACT;separateFactors;LL;10| (157 . |minimumDegree|)
              (162 . >) (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (168 . |monicDivide|)
              (|Record| (|:| |irr| 7) (|:| |pow| (|Integer|)))
              (|Record| (|:| |cont| 6) (|:| |factors| (|List| 61)))
              |DDFACT;distdfact;FPBR;12| (174 . =) (180 . |Zero|)
              (184 . |coerce|) (|PrimitiveArray| $) (189 . |pow|)
              (193 . |makeFR|) |DDFACT;factor;FPF;13|
              |DDFACT;factorSquareFree;FPF;14|)
           '#(|tracePowMod| 199 |trace2PowMod| 206 |separateFactors| 213
              |separateDegrees| 218 |irreducible?| 223 |factorSquareFree| 228
              |factor| 233 |exptMod| 238 |distdfact| 245)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 71
                                                 '(0 6 9 10 0 6 0 12 0 7 0 13 0
                                                   6 0 14 2 7 0 6 9 15 2 7 0 0
                                                   0 16 0 6 0 17 0 7 0 18 1 7 6
                                                   0 19 2 6 20 0 0 21 1 6 0 0
                                                   22 2 7 0 6 0 23 1 7 24 0 25
                                                   1 29 28 0 30 1 7 9 0 31 1 8
                                                   0 7 32 2 8 0 0 9 33 2 7 0 0
                                                   0 34 2 7 0 0 0 36 1 8 0 0 38
                                                   2 8 0 0 0 39 1 8 7 0 40 2 8
                                                   0 0 0 42 0 6 9 43 1 8 7 7 44
                                                   2 9 20 0 0 45 2 7 0 0 0 46 2
                                                   7 0 0 0 47 2 7 0 0 0 48 2 9
                                                   0 53 0 54 1 7 9 0 57 2 9 20
                                                   0 0 58 2 7 59 0 0 60 2 7 20
                                                   0 0 64 0 29 0 65 1 7 0 6 66
                                                   0 8 67 68 2 29 0 7 28 69 3 0
                                                   7 7 9 7 41 3 0 7 7 9 7 37 1
                                                   0 55 51 56 1 0 51 7 52 1 0
                                                   20 7 49 1 0 29 7 71 1 0 29 7
                                                   70 3 0 7 7 9 7 35 2 0 62 7
                                                   20 63)))))
           '|lookupComplete|)) 
