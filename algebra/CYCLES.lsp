
(SDEFUN |CYCLES;trm|
        ((|pt| |Partition|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |pt| (QREFELT $ 8)) (QREFELT $ 10))
                   (QREFELT $ 11))
         |pt| (QREFELT $ 13))) 

(SDEFUN |CYCLES;list|
        ((|st| |Stream| (|List| (|Integer|))) ($ |List| (|List| (|Integer|))))
        (SPADCALL (SPADCALL |st| (QREFELT $ 15)) (QREFELT $ 17))) 

(SDEFUN |CYCLES;complete;ISp;3|
        ((|i| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G118 NIL)
          (#2=#:G117 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G119 #3#) (#5=#:G121 NIL) (|pt| NIL))
         (SEQ
          (COND ((EQL |i| 0) (|spadConstant| $ 19))
                ((< |i| 0) (|spadConstant| $ 18))
                (#6='T
                 (PROGN
                  (LETT #1# NIL . #7=(|CYCLES;complete;ISp;3|))
                  (SEQ (LETT |pt| NIL . #7#)
                       (LETT #5#
                             (|CYCLES;list| (SPADCALL |i| (QREFELT $ 21)) $)
                             . #7#)
                       G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |pt| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (|CYCLES;trm| (SPADCALL |pt| (QREFELT $ 23)) $)
                                . #7#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #4# (QREFELT $ 24)) . #7#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #7#)
                             (LETT #1# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# (|spadConstant| $ 18))))))))) 

(SDEFUN |CYCLES;even?| ((|li| |List| (|Integer|)) ($ |Boolean|))
        (SPROG ((#1=#:G126 NIL) (|i| NIL) (#2=#:G125 NIL))
               (SEQ
                (SPADCALL
                 (LENGTH
                  (PROGN
                   (LETT #2# NIL . #3=(|CYCLES;even?|))
                   (SEQ (LETT |i| NIL . #3#) (LETT #1# |li| . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |i| (QREFELT $ 27))
                            (LETT #2# (CONS |i| #2#) . #3#)))))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))
                 (QREFELT $ 27))))) 

(SDEFUN |CYCLES;alternating;ISp;5|
        ((|i| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G128 NIL)
          (#2=#:G127 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G129 #3#) (#5=#:G131 NIL) (|li| NIL))
         (SEQ
          (SPADCALL 2
                    (PROGN
                     (LETT #1# NIL . #6=(|CYCLES;alternating;ISp;5|))
                     (SEQ (LETT |li| NIL . #6#)
                          (LETT #5#
                                (|CYCLES;list| (SPADCALL |i| (QREFELT $ 21)) $)
                                . #6#)
                          G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |li| (CAR #5#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((|CYCLES;even?| |li| $)
                              (PROGN
                               (LETT #4#
                                     (|CYCLES;trm|
                                      (SPADCALL |li| (QREFELT $ 23)) $)
                                     . #6#)
                               (COND
                                (#1#
                                 (LETT #2# (SPADCALL #2# #4# (QREFELT $ 24))
                                       . #6#))
                                ('T
                                 (PROGN
                                  (LETT #2# #4# . #6#)
                                  (LETT #1# 'T . #6#)))))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 18))))
                    (QREFELT $ 29))))) 

(SDEFUN |CYCLES;elementary;ISp;6|
        ((|i| |Integer|)
         ($ . #1=(|SymmetricPolynomial| (|Fraction| (|Integer|)))))
        (SPROG
         ((#2=#:G133 NIL) (#3=#:G132 #1#) (#4=#:G134 #1#)
          (|spol| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#5=#:G137 NIL) (|pt| NIL))
         (SEQ
          (COND ((EQL |i| 0) (|spadConstant| $ 19))
                ((< |i| 0) (|spadConstant| $ 18))
                (#6='T
                 (PROGN
                  (LETT #2# NIL . #7=(|CYCLES;elementary;ISp;6|))
                  (SEQ (LETT |pt| NIL . #7#)
                       (LETT #5#
                             (|CYCLES;list| (SPADCALL |i| (QREFELT $ 21)) $)
                             . #7#)
                       G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |pt| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SEQ
                                 (LETT |spol|
                                       (|CYCLES;trm|
                                        (SPADCALL |pt| (QREFELT $ 23)) $)
                                       . #7#)
                                 (EXIT
                                  (COND ((|CYCLES;even?| |pt| $) |spol|)
                                        ('T
                                         (SPADCALL |spol| (QREFELT $ 31))))))
                                . #7#)
                          (COND
                           (#2#
                            (LETT #3# (SPADCALL #3# #4# (QREFELT $ 24)) . #7#))
                           ('T
                            (PROGN
                             (LETT #3# #4# . #7#)
                             (LETT #2# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#2# #3#) (#6# (|spadConstant| $ 18))))))))) 

(SDEFUN |CYCLES;divisors| ((|n| |Integer|) ($ |List| (|Integer|)))
        (SPROG
         ((|c| (|List| (|Integer|))) (#1=#:G140 NIL)
          (#2=#:G139 #3=(|List| (|Integer|))) (#4=#:G141 #3#) (#5=#:G148 NIL)
          (|j| NIL) (#6=#:G147 NIL) (#7=#:G146 NIL) (|a| NIL)
          (|b|
           (|List|
            (|Record| (|:| |factor| (|Integer|))
                      (|:| |exponent| (|Integer|))))))
         (SEQ
          (LETT |b| (SPADCALL (SPADCALL |n| (QREFELT $ 34)) (QREFELT $ 37))
                . #8=(|CYCLES;divisors|))
          (LETT |c|
                (CONS 1
                      (PROGN
                       (LETT #1# NIL . #8#)
                       (SEQ (LETT |a| NIL . #8#) (LETT #7# |b| . #8#) G190
                            (COND
                             ((OR (ATOM #7#)
                                  (PROGN (LETT |a| (CAR #7#) . #8#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #4#
                                     (PROGN
                                      (LETT #6# NIL . #8#)
                                      (SEQ (LETT |j| 1 . #8#)
                                           (LETT #5# (QCDR |a|) . #8#) G190
                                           (COND
                                            ((|greater_SI| |j| #5#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #6#
                                                   (CONS (EXPT (QCAR |a|) |j|)
                                                         #6#)
                                                   . #8#)))
                                           (LETT |j| (|inc_SI| |j|) . #8#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #6#))))
                                     . #8#)
                               (COND (#1# (LETT #2# (APPEND #2# #4#) . #8#))
                                     ('T
                                      (PROGN
                                       (LETT #2# #4# . #8#)
                                       (LETT #1# 'T . #8#)))))))
                            (LETT #7# (CDR #7#) . #8#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#1# #2#) (#9='T NIL))))
                . #8#)
          (EXIT (COND ((EQL (LENGTH |b|) 1) |c|) (#9# (CONS |n| |c|))))))) 

(SDEFUN |CYCLES;ss|
        ((|n| |Integer|) (|m| |Integer|)
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG ((|li| (|List| (|Integer|))) (|j| NIL) (#1=#:G152 NIL))
               (SEQ
                (LETT |li|
                      (PROGN
                       (LETT #1# NIL . #2=(|CYCLES;ss|))
                       (SEQ (LETT |j| 1 . #2#) G190
                            (COND ((|greater_SI| |j| |m|) (GO G191)))
                            (SEQ (EXIT (LETT #1# (CONS |n| #1#) . #2#)))
                            (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                            (EXIT (NREVERSE #1#))))
                      . #2#)
                (EXIT
                 (SPADCALL (|spadConstant| $ 39) (SPADCALL |li| (QREFELT $ 23))
                           (QREFELT $ 13)))))) 

(SDEFUN |CYCLES;powerSum;ISp;9|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (|CYCLES;ss| |n| 1 $)) 

(SDEFUN |CYCLES;cyclic;ISp;10|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G155 NIL)
          (#2=#:G154 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G156 #3#) (#5=#:G158 NIL) (|i| NIL))
         (SEQ
          (COND ((EQL |n| 1) (SPADCALL 1 (QREFELT $ 40)))
                (#6='T
                 (PROGN
                  (LETT #1# NIL . #7=(|CYCLES;cyclic;ISp;10|))
                  (SEQ (LETT |i| NIL . #7#)
                       (LETT #5# (|CYCLES;divisors| |n| $) . #7#) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SPADCALL
                                 (SPADCALL (SPADCALL |i| (QREFELT $ 42)) |n|
                                           (QREFELT $ 43))
                                 (|CYCLES;ss| |i|
                                  (SPADCALL (SPADCALL |n| |i| (QREFELT $ 43))
                                            (QREFELT $ 44))
                                  $)
                                 (QREFELT $ 45))
                                . #7#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #4# (QREFELT $ 24)) . #7#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #7#)
                             (LETT #1# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# (|spadConstant| $ 18))))))))) 

(SDEFUN |CYCLES;dihedral;ISp;11|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG ((|k| (|Integer|)))
               (SEQ (LETT |k| (QUOTIENT2 |n| 2) |CYCLES;dihedral;ISp;11|)
                    (EXIT
                     (COND
                      ((ODDP |n|)
                       (SPADCALL
                        (SPADCALL (SPADCALL 1 2 (QREFELT $ 43))
                                  (SPADCALL |n| (QREFELT $ 46)) (QREFELT $ 45))
                        (SPADCALL
                         (SPADCALL (SPADCALL 1 2 (QREFELT $ 43))
                                   (|CYCLES;ss| 2 |k| $) (QREFELT $ 45))
                         (SPADCALL 1 (QREFELT $ 40)) (QREFELT $ 47))
                        (QREFELT $ 24)))
                      ('T
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL 1 2 (QREFELT $ 43))
                                   (SPADCALL |n| (QREFELT $ 46))
                                   (QREFELT $ 45))
                         (SPADCALL (SPADCALL 1 4 (QREFELT $ 43))
                                   (|CYCLES;ss| 2 |k| $) (QREFELT $ 45))
                         (QREFELT $ 24))
                        (SPADCALL
                         (SPADCALL (SPADCALL 1 4 (QREFELT $ 43))
                                   (|CYCLES;ss| 2 (- |k| 1) $) (QREFELT $ 45))
                         (|CYCLES;ss| 1 2 $) (QREFELT $ 47))
                        (QREFELT $ 24)))))))) 

(SDEFUN |CYCLES;trm2|
        ((|li| |List| (|Integer|))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|prod| #1=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (|prod2| #1#) (|r1| #2=(|Integer|)) (|r0| #3=(|Integer|))
          (#4=#:G169 NIL) (|r| NIL)
          (|c| (|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (|k| (|Integer|)) (|ll1| #2#) (|ll0| #3#) (#5=#:G168 NIL) (|ll| NIL)
          (|xx| (|Fraction| (|Integer|)))
          (|lli| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |lli| (SPADCALL |li| (QREFELT $ 49)) . #6=(|CYCLES;trm2|))
              (LETT |xx|
                    (SPADCALL 1
                              (SPADCALL (SPADCALL |li| (QREFELT $ 23))
                                        (QREFELT $ 8))
                              (QREFELT $ 43))
                    . #6#)
              (LETT |prod| (|spadConstant| $ 19) . #6#)
              (SEQ (LETT |ll| NIL . #6#) (LETT #5# |lli| . #6#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |ll| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ll0| (|SPADfirst| |ll|) . #6#)
                        (LETT |ll1| (SPADCALL |ll| (QREFELT $ 50)) . #6#)
                        (LETT |k| (QUOTIENT2 |ll0| 2) . #6#)
                        (LETT |c|
                              (COND
                               ((ODDP |ll0|)
                                (|CYCLES;ss| |ll0| (* |ll1| |k|) $))
                               ('T
                                (SPADCALL (|CYCLES;ss| |k| |ll1| $)
                                          (|CYCLES;ss| |ll0|
                                           (* |ll1| (- |k| 1)) $)
                                          (QREFELT $ 47))))
                              . #6#)
                        (LETT |c|
                              (SPADCALL |c|
                                        (|CYCLES;ss| |ll0|
                                         (* |ll0|
                                            (QUOTIENT2 (* |ll1| (- |ll1| 1))
                                                       2))
                                         $)
                                        (QREFELT $ 47))
                              . #6#)
                        (LETT |prod2| (|spadConstant| $ 19) . #6#)
                        (SEQ (LETT |r| NIL . #6#) (LETT #4# |lli| . #6#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |r| (CAR #4#) . #6#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((< (|SPADfirst| |r|) |ll0|)
                                 (SEQ (LETT |r0| (|SPADfirst| |r|) . #6#)
                                      (LETT |r1| (SPADCALL |r| (QREFELT $ 50))
                                            . #6#)
                                      (EXIT
                                       (LETT |prod2|
                                             (SPADCALL
                                              (|CYCLES;ss|
                                               (SPADCALL |r0| |ll0|
                                                         (QREFELT $ 51))
                                               (* (* (GCD |r0| |ll0|) |r1|)
                                                  |ll1|)
                                               $)
                                              |prod2| (QREFELT $ 47))
                                             . #6#)))))))
                             (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |prod|
                               (SPADCALL (SPADCALL |c| |prod2| (QREFELT $ 47))
                                         |prod| (QREFELT $ 47))
                               . #6#)))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |xx| |prod| (QREFELT $ 45)))))) 

(SDEFUN |CYCLES;graphs;ISp;13|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((#1=#:G171 NIL)
          (#2=#:G170 #3=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#4=#:G172 #3#) (#5=#:G174 NIL) (|li| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|CYCLES;graphs;ISp;13|))
           (SEQ (LETT |li| NIL . #6#)
                (LETT #5# (|CYCLES;list| (SPADCALL |n| (QREFELT $ 21)) $)
                      . #6#)
                G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |li| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (|CYCLES;trm2| |li| $) . #6#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 24)) . #6#))
                    ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 18))))))) 

(SDEFUN |CYCLES;cupp|
        ((|pt| |Partition|)
         (|spol| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG ((|dg| (|Partition|)))
               (SEQ
                (COND ((SPADCALL |spol| (QREFELT $ 53)) (|spadConstant| $ 18))
                      (#1='T
                       (SEQ
                        (LETT |dg| (SPADCALL |spol| (QREFELT $ 54))
                              |CYCLES;cupp|)
                        (EXIT
                         (COND
                          ((SPADCALL |dg| |pt| (QREFELT $ 55))
                           (|spadConstant| $ 18))
                          ((SPADCALL |dg| |pt| (QREFELT $ 56))
                           (SPADCALL (SPADCALL |pt| (QREFELT $ 8))
                                     (SPADCALL (SPADCALL |spol| (QREFELT $ 57))
                                               |dg| (QREFELT $ 13))
                                     (QREFELT $ 58)))
                          (#1#
                           (|CYCLES;cupp| |pt| (SPADCALL |spol| (QREFELT $ 59))
                            $)))))))))) 

(SDEFUN |CYCLES;cup;3Sp;15|
        ((|spol1| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         (|spol2| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG ((|p| (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
               (SEQ
                (COND ((SPADCALL |spol1| (QREFELT $ 53)) (|spadConstant| $ 18))
                      ('T
                       (SEQ
                        (LETT |p|
                              (SPADCALL (SPADCALL |spol1| (QREFELT $ 57))
                                        (|CYCLES;cupp|
                                         (SPADCALL |spol1| (QREFELT $ 54))
                                         |spol2| $)
                                        (QREFELT $ 45))
                              |CYCLES;cup;3Sp;15|)
                        (EXIT
                         (SPADCALL |p|
                                   (SPADCALL (SPADCALL |spol1| (QREFELT $ 59))
                                             |spol2| (QREFELT $ 60))
                                   (QREFELT $ 24))))))))) 

(SDEFUN |CYCLES;eval;SpF;16|
        ((|spol| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |Fraction| (|Integer|)))
        (COND ((SPADCALL |spol| (QREFELT $ 53)) (|spadConstant| $ 61))
              ('T
               (SPADCALL (SPADCALL |spol| (QREFELT $ 57))
                         (SPADCALL (SPADCALL |spol| (QREFELT $ 59))
                                   (QREFELT $ 62))
                         (QREFELT $ 63))))) 

(SDEFUN |CYCLES;cap;2SpF;17|
        ((|spol1| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         (|spol2| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL |spol1| |spol2| (QREFELT $ 60)) (QREFELT $ 62))) 

(SDEFUN |CYCLES;mtpol|
        ((|n| |Integer|)
         (|spol| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|deg| (|Partition|)) (#1=#:G190 NIL) (|k| NIL) (#2=#:G189 NIL))
         (SEQ
          (COND ((SPADCALL |spol| (QREFELT $ 53)) (|spadConstant| $ 18))
                ('T
                 (SEQ
                  (LETT |deg|
                        (SPADCALL
                         (PROGN
                          (LETT #2# NIL . #3=(|CYCLES;mtpol|))
                          (SEQ (LETT |k| NIL . #3#)
                               (LETT #1#
                                     (SPADCALL (SPADCALL |spol| (QREFELT $ 54))
                                               (QREFELT $ 65))
                                     . #3#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT (LETT #2# (CONS (* |n| |k|) #2#) . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT $ 23))
                        . #3#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |spol| (QREFELT $ 57)) |deg|
                              (QREFELT $ 13))
                    (|CYCLES;mtpol| |n| (SPADCALL |spol| (QREFELT $ 59)) $)
                    (QREFELT $ 24))))))))) 

(SDEFUN |CYCLES;evspol|
        ((|fn2| |Mapping| (|SymmetricPolynomial| (|Fraction| (|Integer|)))
          (|Integer|))
         (|spol| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|prod| #1=(|SymmetricPolynomial| (|Fraction| (|Integer|))))
          (#2=#:G192 NIL) (#3=#:G191 #1#) (#4=#:G193 #1#) (#5=#:G198 NIL)
          (|i| NIL) (|lc| (|Fraction| (|Integer|))))
         (SEQ
          (COND ((SPADCALL |spol| (QREFELT $ 53)) (|spadConstant| $ 18))
                (#6='T
                 (SEQ
                  (LETT |lc| (SPADCALL |spol| (QREFELT $ 57))
                        . #7=(|CYCLES;evspol|))
                  (LETT |prod|
                        (PROGN
                         (LETT #2# NIL . #7#)
                         (SEQ (LETT |i| NIL . #7#)
                              (LETT #5#
                                    (SPADCALL (SPADCALL |spol| (QREFELT $ 54))
                                              (QREFELT $ 65))
                                    . #7#)
                              G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |i| (CAR #5#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4# (SPADCALL |i| |fn2|) . #7#)
                                 (COND
                                  (#2#
                                   (LETT #3# (SPADCALL #3# #4# (QREFELT $ 47))
                                         . #7#))
                                  ('T
                                   (PROGN
                                    (LETT #3# #4# . #7#)
                                    (LETT #2# 'T . #7#)))))))
                              (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#2# #3#) (#6# (|spadConstant| $ 19))))
                        . #7#)
                  (EXIT
                   (SPADCALL (SPADCALL |lc| |prod| (QREFELT $ 45))
                             (|CYCLES;evspol| |fn2|
                              (SPADCALL |spol| (QREFELT $ 59)) $)
                             (QREFELT $ 24))))))))) 

(SDEFUN |CYCLES;wreath;3Sp;20|
        ((|spol1| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         (|spol2| |SymmetricPolynomial| (|Fraction| (|Integer|)))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG NIL
               (|CYCLES;evspol|
                (CONS #'|CYCLES;wreath;3Sp;20!0| (VECTOR $ |spol2|)) |spol1|
                $))) 

(SDEFUN |CYCLES;wreath;3Sp;20!0| ((|x| NIL) ($$ NIL))
        (PROG (|spol2| $)
          (LETT |spol2| (QREFELT $$ 1) . #1=(|CYCLES;wreath;3Sp;20|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|CYCLES;mtpol| |x| |spol2| $))))) 

(SDEFUN |CYCLES;hh|
        ((|n| |Integer|) ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (COND ((EQL |n| 0) (|spadConstant| $ 19))
              ((< |n| 0) (|spadConstant| $ 18))
              ('T (SPADCALL |n| (QREFELT $ 25))))) 

(SDEFUN |CYCLES;SFunction;LSp;22|
        ((|li| |List| (|Integer|))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|a| (|Matrix| (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
          (#1=#:G209 NIL) (|k| NIL) (#2=#:G210 NIL) (|j| NIL) (#3=#:G208 NIL)
          (#4=#:G207 NIL) (|i| NIL) (#5=#:G206 NIL))
         (SEQ
          (LETT |a|
                (SPADCALL
                 (PROGN
                  (LETT #5# NIL . #6=(|CYCLES;SFunction;LSp;22|))
                  (SEQ (LETT |i| 1 . #6#) (LETT #4# (LENGTH |li|) . #6#) G190
                       (COND ((|greater_SI| |i| #4#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #5#
                               (CONS
                                (PROGN
                                 (LETT #3# NIL . #6#)
                                 (SEQ (LETT |j| 1 . #6#)
                                      (LETT #2# (LENGTH |li|) . #6#)
                                      (LETT |k| NIL . #6#)
                                      (LETT #1# |li| . #6#) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |k| (CAR #1#) . #6#)
                                             NIL)
                                            (|greater_SI| |j| #2#))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #3#
                                              (CONS
                                               (|CYCLES;hh| (+ (- |k| |j|) |i|)
                                                $)
                                               #3#)
                                              . #6#)))
                                      (LETT #1#
                                            (PROG1 (CDR #1#)
                                              (LETT |j| (|inc_SI| |j|) . #6#))
                                            . #6#)
                                      (GO G190) G191 (EXIT (NREVERSE #3#))))
                                #5#)
                               . #6#)))
                       (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                       (EXIT (NREVERSE #5#))))
                 (QREFELT $ 69))
                . #6#)
          (EXIT (SPADCALL |a| (QREFELT $ 70)))))) 

(SDEFUN |CYCLES;roundup|
        ((|li1| |List| (|Integer|)) (|li2| |List| (|Integer|))
         ($ |List| (|Integer|)))
        (COND
         ((SPADCALL (LENGTH |li1|) (LENGTH |li2|) (QREFELT $ 72))
          (|CYCLES;roundup| |li1| (SPADCALL |li2| 0 (QREFELT $ 73)) $))
         ('T |li2|))) 

(SDEFUN |CYCLES;skewSFunction;2LSp;24|
        ((|li1| |List| (|Integer|)) (|li2| |List| (|Integer|))
         ($ |SymmetricPolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|a| (|Matrix| (|SymmetricPolynomial| (|Fraction| (|Integer|)))))
          (#1=#:G221 NIL) (|k| NIL) (#2=#:G222 NIL) (|j| NIL) (#3=#:G220 NIL)
          (#4=#:G219 NIL) (|i| NIL) (#5=#:G218 NIL))
         (SEQ
          (COND
           ((< (LENGTH |li1|) (LENGTH |li2|))
            (|error| "skewSFunction: partition1 does not include partition2"))
           ('T
            (SEQ
             (LETT |li2| (|CYCLES;roundup| |li1| |li2| $)
                   . #6=(|CYCLES;skewSFunction;2LSp;24|))
             (LETT |a|
                   (SPADCALL
                    (PROGN
                     (LETT #5# NIL . #6#)
                     (SEQ (LETT |i| 1 . #6#) (LETT #4# (LENGTH |li1|) . #6#)
                          G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS
                                   (PROGN
                                    (LETT #3# NIL . #6#)
                                    (SEQ (LETT |j| 1 . #6#)
                                         (LETT #2# (LENGTH |li1|) . #6#)
                                         (LETT |k| NIL . #6#)
                                         (LETT #1# |li1| . #6#) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |k| (CAR #1#) . #6#)
                                                NIL)
                                               (|greater_SI| |j| #2#))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #3#
                                                 (CONS
                                                  (|CYCLES;hh|
                                                   (+
                                                    (-
                                                     (- |k|
                                                        (SPADCALL |li2| |i|
                                                                  (QREFELT $
                                                                           74)))
                                                     |j|)
                                                    |i|)
                                                   $)
                                                  #3#)
                                                 . #6#)))
                                         (LETT #1#
                                               (PROG1 (CDR #1#)
                                                 (LETT |j| (|inc_SI| |j|)
                                                       . #6#))
                                               . #6#)
                                         (GO G190) G191 (EXIT (NREVERSE #3#))))
                                   #5#)
                                  . #6#)))
                          (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    (QREFELT $ 69))
                   . #6#)
             (EXIT (SPADCALL |a| (QREFELT $ 70))))))))) 

(DECLAIM (NOTINLINE |CycleIndicators;|)) 

(DEFUN |CycleIndicators| ()
  (SPROG NIL
         (PROG (#1=#:G224)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|CycleIndicators|)
                    . #2=(|CycleIndicators|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CycleIndicators|
                             (LIST (CONS NIL (CONS 1 (|CycleIndicators;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|CycleIndicators|)))))))))) 

(DEFUN |CycleIndicators;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CycleIndicators|) . #1=(|CycleIndicators|))
          (LETT $ (GETREFV 76) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|CycleIndicators| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| (|SymmetricPolynomial| (|Fraction| (|Integer|)))
                           '(|CommutativeRing|))
            (PROGN
             (QSETREFV $ 71
                       (CONS (|dispatchFunction| |CYCLES;SFunction;LSp;22|) $))
             NIL
             (QSETREFV $ 75
                       (CONS
                        (|dispatchFunction| |CYCLES;skewSFunction;2LSp;24|)
                        $)))))
          $))) 

(MAKEPROP '|CycleIndicators| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|Partition|) (0 . |pdct|)
              (|Fraction| 6) (5 . |coerce|) (10 . |inv|)
              (|SymmetricPolynomial| 9) (15 . |monomial|) (|Stream| 22)
              (21 . |complete|) (|List| 22) (26 . |entries|) (31 . |Zero|)
              (35 . |One|) (|PartitionsAndPermutations|) (39 . |partitions|)
              (|List| 6) (44 . |partition|) (49 . +) |CYCLES;complete;ISp;3|
              (|Boolean|) (55 . |even?|) (|PositiveInteger|) (60 . *)
              |CYCLES;alternating;ISp;5| (66 . -) |CYCLES;elementary;ISp;6|
              (|Factored| 6) (71 . |coerce|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 6)) (|List| 35)
              (76 . |factors|) (81 . |One|) (85 . |One|)
              |CYCLES;powerSum;ISp;9| (|IntegerNumberTheoryFunctions|)
              (89 . |eulerPhi|) (94 . /) (100 . |numer|) (105 . *)
              |CYCLES;cyclic;ISp;10| (111 . *) |CYCLES;dihedral;ISp;11|
              (117 . |powers|) (122 . |second|) (127 . |lcm|)
              |CYCLES;graphs;ISp;13| (133 . |zero?|) (138 . |degree|) (143 . <)
              (149 . =) (155 . |leadingCoefficient|) (160 . *)
              (166 . |reductum|) |CYCLES;cup;3Sp;15| (171 . |Zero|)
              |CYCLES;eval;SpF;16| (175 . +) |CYCLES;cap;2SpF;17|
              (181 . |coerce|) |CYCLES;wreath;3Sp;20| (|List| (|List| 12))
              (|Matrix| 12) (186 . |matrix|) (191 . |determinant|)
              (196 . |SFunction|) (201 . >) (207 . |concat|) (213 . |elt|)
              (219 . |skewSFunction|))
           '#(|wreath| 225 |skewSFunction| 231 |powerSum| 237 |graphs| 242
              |eval| 247 |elementary| 252 |dihedral| 257 |cyclic| 262 |cup| 267
              |complete| 273 |cap| 278 |alternating| 284 |SFunction| 289)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 75
                                                 '(1 7 6 0 8 1 9 0 6 10 1 9 0 0
                                                   11 2 12 0 9 7 13 1 14 0 0 15
                                                   1 14 16 0 17 0 12 0 18 0 12
                                                   0 19 1 20 14 6 21 1 7 0 22
                                                   23 2 12 0 0 0 24 1 6 26 0 27
                                                   2 12 0 28 0 29 1 12 0 0 31 1
                                                   33 0 6 34 1 33 36 0 37 0 33
                                                   0 38 0 9 0 39 1 41 6 6 42 2
                                                   9 0 6 6 43 1 9 6 0 44 2 12 0
                                                   9 0 45 2 12 0 0 0 47 1 7 16
                                                   22 49 1 22 6 0 50 2 6 0 0 0
                                                   51 1 12 26 0 53 1 12 7 0 54
                                                   2 7 26 0 0 55 2 7 26 0 0 56
                                                   1 12 9 0 57 2 12 0 6 0 58 1
                                                   12 0 0 59 0 9 0 61 2 9 0 0 0
                                                   63 1 7 22 0 65 1 68 0 67 69
                                                   1 68 12 0 70 1 0 12 22 71 2
                                                   6 26 0 0 72 2 22 0 0 6 73 2
                                                   22 6 0 6 74 2 0 12 22 22 75
                                                   2 0 12 12 12 66 2 0 12 22 22
                                                   75 1 0 12 6 40 1 0 12 6 52 1
                                                   0 9 12 62 1 0 12 6 32 1 0 12
                                                   6 48 1 0 12 6 46 2 0 12 12
                                                   12 60 1 0 12 6 25 2 0 9 12
                                                   12 64 1 0 12 6 30 1 0 12 22
                                                   71)))))
           '|lookupComplete|)) 

(MAKEPROP '|CycleIndicators| 'NILADIC T) 
