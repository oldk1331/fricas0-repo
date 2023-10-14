
(/VERSIONCHECK 2) 

(DEFUN |MCALCFN;localGradient| (|v| |xlist| $)
  (PROG (#1=#:G130 |x| #2=#:G129)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|MCALCFN;localGradient|))
        (SEQ (LETT |x| NIL . #3#) (LETT #1# |xlist| . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2# (CONS (SPADCALL |v| |x| (QREFELT $ 10)) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 13)))))) 

(DEFUN |MCALCFN;gradient;FFLASV;2| (|v| |xflas| $)
  (PROG (|xlist|)
    (RETURN
     (SEQ
      (LETT |xlist| (SPADCALL |xflas| (QREFELT $ 15))
            |MCALCFN;gradient;FFLASV;2|)
      (EXIT (|MCALCFN;localGradient| |v| |xlist| $)))))) 

(DEFUN |MCALCFN;localDivergence| (|vf| |xlist| $)
  (PROG (|ans| |i| |n| #1=#:G133)
    (RETURN
     (SEQ
      (LETT |n|
            (MIN (LENGTH |xlist|)
                 (PROG1
                     (LETT #1# (QVSIZE |vf|) . #2=(|MCALCFN;localDivergence|))
                   (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#)))
            . #2#)
      (LETT |ans| (|spadConstant| $ 17) . #2#)
      (SEQ (LETT |i| 1 . #2#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ
            (EXIT
             (LETT |ans|
                   (SPADCALL |ans|
                             (SPADCALL (SPADCALL |vf| |i| (QREFELT $ 19))
                                       (SPADCALL |xlist| |i| (QREFELT $ 20))
                                       (QREFELT $ 10))
                             (QREFELT $ 21))
                   . #2#)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |ans|))))) 

(DEFUN |MCALCFN;divergence;FLAFFLASF;4| (|vf| |xflas| $)
  (PROG (|ans| |i| |n| #1=#:G137 |xlist|)
    (RETURN
     (SEQ
      (LETT |xlist| (SPADCALL |xflas| (QREFELT $ 15))
            . #2=(|MCALCFN;divergence;FLAFFLASF;4|))
      (LETT |n|
            (MIN (LENGTH |xlist|)
                 (PROG1 (LETT #1# (SPADCALL |vf| (QREFELT $ 22)) . #2#)
                   (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#)))
            . #2#)
      (LETT |ans| (|spadConstant| $ 17) . #2#)
      (SEQ (LETT |i| 1 . #2#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ
            (EXIT
             (LETT |ans|
                   (SPADCALL |ans|
                             (SPADCALL (SPADCALL |vf| |i| (QREFELT $ 23))
                                       (SPADCALL |xlist| |i| (QREFELT $ 20))
                                       (QREFELT $ 10))
                             (QREFELT $ 21))
                   . #2#)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |ans|))))) 

(DEFUN |MCALCFN;laplacian;FFLASF;5| (|v| |xflas| $)
  (PROG (|gv| |xlist|)
    (RETURN
     (SEQ
      (LETT |xlist| (SPADCALL |xflas| (QREFELT $ 15))
            . #1=(|MCALCFN;laplacian;FFLASF;5|))
      (LETT |gv| (|MCALCFN;localGradient| |v| |xlist| $) . #1#)
      (EXIT (|MCALCFN;localDivergence| |gv| |xlist| $)))))) 

(DEFUN |MCALCFN;hessian;FFLASM;6| (|v| |xflas| $)
  (PROG (#1=#:G150 |x| #2=#:G149 #3=#:G148 |y| #4=#:G147 |xlist|)
    (RETURN
     (SEQ
      (LETT |xlist| (SPADCALL |xflas| (QREFELT $ 15))
            . #5=(|MCALCFN;hessian;FFLASM;6|))
      (EXIT
       (SPADCALL
        (PROGN
         (LETT #4# NIL . #5#)
         (SEQ (LETT |y| NIL . #5#) (LETT #3# |xlist| . #5#) G190
              (COND
               ((OR (ATOM #3#) (PROGN (LETT |y| (CAR #3#) . #5#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (LETT #4#
                      (CONS
                       (PROGN
                        (LETT #2# NIL . #5#)
                        (SEQ (LETT |x| NIL . #5#) (LETT #1# |xlist| . #5#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |x| (CAR #1#) . #5#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (SPADCALL |v| (LIST |x| |y|)
                                                (QREFELT $ 26))
                                      #2#)
                                     . #5#)))
                             (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       #4#)
                      . #5#)))
              (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT (NREVERSE #4#))))
        (QREFELT $ 29))))))) 

(DEFUN |MCALCFN;jacobian;FLAFFLASM;7| (|vf| |xflas| $)
  (PROG (#1=#:G158 |x| #2=#:G157 #3=#:G156 |i| #4=#:G155 |xlist|)
    (RETURN
     (SEQ
      (LETT |xlist| (SPADCALL |xflas| (QREFELT $ 15))
            . #5=(|MCALCFN;jacobian;FLAFFLASM;7|))
      (EXIT
       (SPADCALL
        (PROGN
         (LETT #4# NIL . #5#)
         (SEQ (LETT |i| 1 . #5#)
              (LETT #3# (SPADCALL |vf| (QREFELT $ 22)) . #5#) G190
              (COND ((|greater_SI| |i| #3#) (GO G191)))
              (SEQ
               (EXIT
                (LETT #4#
                      (CONS
                       (PROGN
                        (LETT #2# NIL . #5#)
                        (SEQ (LETT |x| NIL . #5#) (LETT #1# |xlist| . #5#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |x| (CAR #1#) . #5#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (SPADCALL
                                       (SPADCALL |vf| |i| (QREFELT $ 23)) |x|
                                       (QREFELT $ 10))
                                      #2#)
                                     . #5#)))
                             (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       #4#)
                      . #5#)))
              (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
              (EXIT (NREVERSE #4#))))
        (QREFELT $ 29))))))) 

(DEFUN |MCALCFN;bandedHessian;FFLASNniM;8| (|v| |xflas| |k| $)
  (PROG (#1=#:G165 |j| #2=#:G164 |iw| |bandM| |n| |xlist|)
    (RETURN
     (SEQ
      (LETT |xlist| (SPADCALL |xflas| (QREFELT $ 15))
            . #3=(|MCALCFN;bandedHessian;FFLASNniM;8|))
      (LETT |n| (LENGTH |xlist|) . #3#)
      (LETT |bandM| (MAKE_MATRIX1 (+ |k| 1) |n| (|spadConstant| $ 17)) . #3#)
      (SEQ (LETT |j| 1 . #3#) G190 (COND ((|greater_SI| |j| |n|) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |bandM| 1 |j|
                       (SPADCALL |v| (SPADCALL |xlist| |j| (QREFELT $ 20)) 2
                                 (QREFELT $ 34))
                       (QREFELT $ 35))))
           (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
      (SEQ (LETT |iw| 2 . #3#) (LETT #2# (+ |k| 1) . #3#) G190
           (COND ((|greater_SI| |iw| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #3#) (LETT #1# (+ (- |n| |iw|) 1) . #3#) G190
                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |bandM| |iw| |j|
                              (SPADCALL |v|
                                        (LIST
                                         (SPADCALL |xlist| |j| (QREFELT $ 20))
                                         (SPADCALL |xlist| (- (+ |j| |iw|) 1)
                                                   (QREFELT $ 20)))
                                        (QREFELT $ 26))
                              (QREFELT $ 35))))
                  (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |iw| (|inc_SI| |iw|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |bandM|))))) 

(DEFUN |MCALCFN;jacobian;FLAFFLASM;9| (|vf| |xflas| $)
  (PROG (#1=#:G173 |x| #2=#:G172 #3=#:G171 |i| #4=#:G170 |xlist|)
    (RETURN
     (SEQ
      (LETT |xlist| (SPADCALL |xflas| (QREFELT $ 15))
            . #5=(|MCALCFN;jacobian;FLAFFLASM;9|))
      (EXIT
       (SPADCALL
        (PROGN
         (LETT #4# NIL . #5#)
         (SEQ (LETT |i| 1 . #5#)
              (LETT #3# (SPADCALL |vf| (QREFELT $ 22)) . #5#) G190
              (COND ((|greater_SI| |i| #3#) (GO G191)))
              (SEQ
               (EXIT
                (LETT #4#
                      (CONS
                       (PROGN
                        (LETT #2# NIL . #5#)
                        (SEQ (LETT |x| NIL . #5#) (LETT #1# |xlist| . #5#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |x| (CAR #1#) . #5#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (SPADCALL
                                       (SPADCALL |vf| |i| (QREFELT $ 23)) |x|
                                       (QREFELT $ 10))
                                      #2#)
                                     . #5#)))
                             (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       #4#)
                      . #5#)))
              (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
              (EXIT (NREVERSE #4#))))
        (QREFELT $ 29))))))) 

(DEFUN |MCALCFN;bandedJacobian;FLAFFLAS2NniM;10| (|vf| |xflas| |kl| |ku| $)
  (PROG (|j| |iw| #1=#:G182 #2=#:G181 |bandM| |n| |xlist|)
    (RETURN
     (SEQ
      (LETT |xlist| (SPADCALL |xflas| (QREFELT $ 15))
            . #3=(|MCALCFN;bandedJacobian;FLAFFLAS2NniM;10|))
      (LETT |n| (LENGTH |xlist|) . #3#)
      (LETT |bandM|
            (MAKE_MATRIX1 (+ (+ |kl| |ku|) 1) |n| (|spadConstant| $ 17)) . #3#)
      (SEQ (LETT |j| 1 . #3#) G190 (COND ((|greater_SI| |j| |n|) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |bandM| (+ |ku| 1) |j|
                       (SPADCALL (SPADCALL |vf| |j| (QREFELT $ 23))
                                 (SPADCALL |xlist| |j| (QREFELT $ 20))
                                 (QREFELT $ 10))
                       (QREFELT $ 35))))
           (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
      (SEQ (LETT |iw| (+ |ku| 2) . #3#) (LETT #2# (+ (+ |ku| |kl|) 1) . #3#)
           G190 (COND ((> |iw| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #3#)
                  (LETT #1# (+ (+ (- |n| |iw|) |ku|) 1) . #3#) G190
                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |bandM| |iw| |j|
                              (SPADCALL
                               (SPADCALL |vf| (- (- (+ |j| |iw|) 1) |ku|)
                                         (QREFELT $ 23))
                               (SPADCALL |xlist| |j| (QREFELT $ 20))
                               (QREFELT $ 10))
                              (QREFELT $ 35))))
                  (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |iw| (+ |iw| 1) . #3#) (GO G190) G191 (EXIT NIL))
      (SEQ (LETT |iw| 1 . #3#) G190 (COND ((|greater_SI| |iw| |ku|) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| (- (+ |ku| 2) |iw|) . #3#) G190
                  (COND ((> |j| |n|) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |bandM| |iw| |j|
                              (SPADCALL
                               (SPADCALL |vf| (- (- (+ |j| |iw|) 1) |ku|)
                                         (QREFELT $ 23))
                               (SPADCALL |xlist| |j| (QREFELT $ 20))
                               (QREFELT $ 10))
                              (QREFELT $ 35))))
                  (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |iw| (|inc_SI| |iw|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |bandM|))))) 

(DECLAIM (NOTINLINE |MultiVariableCalculusFunctions;|)) 

(DEFUN |MultiVariableCalculusFunctions| (&REST #1=#:G183)
  (PROG ()
    (RETURN
     (PROG (#2=#:G184)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|MultiVariableCalculusFunctions|)
                                           '|domainEqualList|)
                . #3=(|MultiVariableCalculusFunctions|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |MultiVariableCalculusFunctions;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|MultiVariableCalculusFunctions|))))))))))) 

(DEFUN |MultiVariableCalculusFunctions;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MultiVariableCalculusFunctions|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|MultiVariableCalculusFunctions| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 38) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MultiVariableCalculusFunctions|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MultiVariableCalculusFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . D) (|List| 7) (|Vector| 7)
              (6 . |vector|) (|List| 6) (11 . |parts|)
              |MCALCFN;gradient;FFLASV;2| (16 . |Zero|) (|Integer|)
              (20 . |elt|) (26 . |elt|) (32 . +) (38 . |maxIndex|) (43 . |elt|)
              |MCALCFN;divergence;FLAFFLASF;4| |MCALCFN;laplacian;FFLASF;5|
              (49 . D) (|List| 11) (|Matrix| 7) (55 . |matrix|)
              |MCALCFN;hessian;FFLASM;6| |MCALCFN;jacobian;FLAFFLASM;9|
              (60 . |One|) (|NonNegativeInteger|) (64 . D) (71 . |setelt|)
              |MCALCFN;bandedHessian;FFLASNniM;8|
              |MCALCFN;bandedJacobian;FLAFFLAS2NniM;10|)
           '#(|laplacian| 79 |jacobian| 85 |hessian| 91 |gradient| 97
              |divergence| 103 |bandedJacobian| 109 |bandedHessian| 117)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 37
                                                 '(2 7 0 0 6 10 1 12 0 11 13 1
                                                   9 14 0 15 0 7 0 17 2 12 7 0
                                                   18 19 2 14 6 0 18 20 2 7 0 0
                                                   0 21 1 8 18 0 22 2 8 7 0 18
                                                   23 2 7 0 0 14 26 1 28 0 27
                                                   29 0 7 0 32 3 7 0 0 6 33 34
                                                   4 28 7 0 18 18 7 35 2 0 7 7
                                                   9 25 2 0 28 8 9 31 2 0 28 7
                                                   9 30 2 0 12 7 9 16 2 0 7 8 9
                                                   24 4 0 28 8 9 33 33 37 3 0
                                                   28 7 9 33 36)))))
           '|lookupComplete|)) 
