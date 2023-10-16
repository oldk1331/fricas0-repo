
(SDEFUN |FS-;ground?;SB;1| ((|x| S) ($ |Boolean|))
        (QEQCAR (SPADCALL |x| (QREFELT $ 18)) 0)) 

(SDEFUN |FS-;ground;SR;2| ((|x| S) ($ R)) (SPADCALL |x| (QREFELT $ 21))) 

(SDEFUN |FS-;coerce;SS;3| ((|x| |Symbol|) ($ S))
        (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 26))) 

(SDEFUN |FS-;retract;SS;4| ((|x| S) ($ |Symbol|))
        (SPROG ((#1=#:G161 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL (SPADCALL |x| (QREFELT $ 28))
                                   (QREFELT $ 30)))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                 (|Union| (|Symbol|) "failed") #1#)))) 

(SDEFUN |FS-;applyQuote;S2S;5| ((|s| |Symbol|) (|x| S) ($ S))
        (SPADCALL |s| (LIST |x|) (QREFELT $ 33))) 

(SDEFUN |FS-;applyQuote;S3S;6| ((|s| |Symbol|) (|x| S) (|y| S) ($ S))
        (SPADCALL |s| (LIST |x| |y|) (QREFELT $ 33))) 

(SDEFUN |FS-;applyQuote;S4S;7| ((|s| |Symbol|) (|x| S) (|y| S) (|z| S) ($ S))
        (SPADCALL |s| (LIST |x| |y| |z|) (QREFELT $ 33))) 

(SDEFUN |FS-;applyQuote;S5S;8|
        ((|s| |Symbol|) (|x| S) (|y| S) (|z| S) (|t| S) ($ S))
        (SPADCALL |s| (LIST |x| |y| |z| |t|) (QREFELT $ 33))) 

(SDEFUN |FS-;applyQuote;SLS;9| ((|s| |Symbol|) (|l| |List| S) ($ S))
        (SPADCALL (QREFELT $ 16) (CONS (SPADCALL |s| (QREFELT $ 38)) |l|)
                  (QREFELT $ 39))) 

(SDEFUN |FS-;belong?;BoB;10| ((|op| |BasicOperator|) ($ |Boolean|))
        (COND
         ((SPADCALL |op| '|any| (QREFELT $ 41))
          (COND ((SPADCALL |op| '|%diff| (QREFELT $ 42)) 'T)
                (#1='T (SPADCALL |op| '|%quote| (QREFELT $ 42)))))
         (#1# NIL))) 

(SDEFUN |FS-;subs| ((|fn| |Mapping| S S) (|k| |Kernel| S) ($ S))
        (SPROG ((#1=#:G175 NIL) (|x| NIL) (#2=#:G174 NIL))
               (SEQ
                (SPADCALL (SPADCALL |k| (QREFELT $ 44))
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |x| NIL)
                                (LETT #1# (SPADCALL |k| (QREFELT $ 46))) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |x| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2# (CONS (SPADCALL |x| |fn|) #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 47))))) 

(SDEFUN |FS-;operator;2Bo;12| ((|op| |BasicOperator|) ($ |BasicOperator|))
        (COND ((SPADCALL |op| '|%diff| (QREFELT $ 42)) (QREFELT $ 15))
              ((SPADCALL |op| '|%quote| (QREFELT $ 42)) (QREFELT $ 16))
              ('T
               (|error|
                (STRCONC "Unknown operator 4: "
                         (SPADCALL (SPADCALL |op| (QREFELT $ 48))
                                   (QREFELT $ 50))))))) 

(SDEFUN |FS-;differentiand| ((|l| |List| S) ($ S))
        (SPADCALL (|SPADfirst| |l|)
                  (SPADCALL (SPADCALL |l| (QREFELT $ 52)) (QREFELT $ 28))
                  (SPADCALL |l| (QREFELT $ 53)) (QREFELT $ 54))) 

(SDEFUN |FS-;pint| ((|l| |List| (|InputForm|)) ($ |InputForm|))
        (SPADCALL (CONS (SPADCALL 'D (QREFELT $ 56)) |l|) (QREFELT $ 57))) 

(SDEFUN |FS-;indiff| ((|l| |List| S) ($ |InputForm|))
        (SPROG ((|r2| (|InputForm|)))
               (SEQ
                (LETT |r2|
                      (SPADCALL
                       (LIST (SPADCALL '|::| (QREFELT $ 56))
                             (SPADCALL (SPADCALL |l| (QREFELT $ 53))
                                       (QREFELT $ 58))
                             (SPADCALL '|Symbol| (QREFELT $ 56)))
                       (QREFELT $ 57)))
                (EXIT
                 (|FS-;pint|
                  (LIST (SPADCALL (|FS-;differentiand| |l| $) (QREFELT $ 58))
                        |r2|)
                  $))))) 

(SDEFUN |FS-;eval;SBoSSS;16|
        ((|f| S) (|s| |BasicOperator|) (|g| S) (|x| |Symbol|) ($ S))
        (SPADCALL |f| (LIST |s|) (LIST |g|) |x| (QREFELT $ 60))) 

(SDEFUN |FS-;eval;SLLSS;17|
        ((|f| S) (|ls| |List| (|BasicOperator|)) (|lg| |List| S) (|x| |Symbol|)
         ($ S))
        (SPROG ((#1=#:G188 NIL) (|g| NIL) (#2=#:G187 NIL))
               (SEQ
                (SPADCALL |f| |ls|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |g| NIL) (LETT #1# |lg|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |g| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |g| |x| (QREFELT $ 64))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 67))))) 

(SDEFUN |FS-;variables;LL;18| ((|lx| |List| S) ($ |List| (|Symbol|)))
        (SPROG
         ((|l| (|List| (|Symbol|))) (|s| (|Union| (|Symbol|) "failed"))
          (#1=#:G198 NIL) (|k| NIL))
         (SEQ (LETT |l| NIL)
              (SEQ (LETT |k| NIL) (LETT #1# (SPADCALL |lx| (QREFELT $ 72)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |s| (SPADCALL |k| (QREFELT $ 30)))
                        (EXIT
                         (COND
                          ((QEQCAR |s| 0) (LETT |l| (CONS (QCDR |s|) |l|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |l|))))) 

(SDEFUN |FS-;variables;SL;19| ((|x| S) ($ |List| (|Symbol|)))
        (SPADCALL (LIST |x|) (QREFELT $ 75))) 

(SDEFUN |FS-;retractIfCan;SU;20| ((|x| S) ($ |Union| (|Symbol|) "failed"))
        (SPROG ((|k| (|Union| (|Kernel| S) "failed")))
               (SEQ (LETT |k| (SPADCALL |x| (QREFELT $ 78)))
                    (EXIT
                     (COND ((QEQCAR |k| 1) (CONS 1 "failed"))
                           ('T (SPADCALL (QCDR |k|) (QREFELT $ 30)))))))) 

(SDEFUN |FS-;characteristic;Nni;21| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 82))) 

(SDEFUN |FS-;coerce;KS;22| ((|k| |Kernel| S) ($ S))
        (SPADCALL (SPADCALL |k| (QREFELT $ 85)) (QREFELT $ 87))) 

(SDEFUN |FS-;symsub| ((|sy| |Symbol|) (|i| |Integer|) ($ |Symbol|))
        (SPADCALL (QREFELT $ 89))) 

(SDEFUN |FS-;numerator;2S;24| ((|x| S) ($ S))
        (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 87))) 

(SDEFUN |FS-;eval;SSNniMS;25|
        ((|x| S) (|s| |Symbol|) (|n| |NonNegativeInteger|) (|f| |Mapping| S S)
         ($ S))
        (SPROG NIL
               (SPADCALL |x| (LIST |s|) (LIST |n|)
                         (LIST (CONS #'|FS-;eval;SSNniMS;25!0| (VECTOR |f| $)))
                         (QREFELT $ 96)))) 

(SDEFUN |FS-;eval;SSNniMS;25!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 92)) |f|))))) 

(SDEFUN |FS-;eval;SSNniMS;26|
        ((|x| S) (|s| |Symbol|) (|n| |NonNegativeInteger|)
         (|f| |Mapping| S (|List| S)) ($ S))
        (SPADCALL |x| (LIST |s|) (LIST |n|) (LIST |f|) (QREFELT $ 96))) 

(SDEFUN |FS-;eval;SLLS;27|
        ((|x| S) (|l| |List| (|Symbol|)) (|f| |List| (|Mapping| S (|List| S)))
         ($ S))
        (SPADCALL |x| |l| (SPADCALL (LENGTH |l|) 1 (QREFELT $ 99)) |f|
                  (QREFELT $ 96))) 

(SDEFUN |FS-;elt;BoLS;28| ((|op| |BasicOperator|) (|args| |List| S) ($ S))
        (SPROG ((#1=#:G243 NIL) (|x| (S)) (|od?| (|Boolean|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |op| (QREFELT $ 101))
                    (SEQ
                     (LETT |od?| (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 41)))
                     (EXIT
                      (COND
                       ((OR |od?| (SPADCALL |op| (QREFELT $ 9) (QREFELT $ 41)))
                        (COND
                         ((SPADCALL
                           (SPADCALL
                            (SPADCALL (|SPADfirst| |args|) (QREFELT $ 90))
                            (QREFELT $ 102))
                           (|spadConstant| $ 103) (QREFELT $ 104))
                          (PROGN
                           (LETT #1#
                                 (SEQ
                                  (LETT |x|
                                        (SPADCALL |op|
                                                  (SPADCALL
                                                   (|SPADfirst| |args|)
                                                   (QREFELT $ 105))
                                                  (QREFELT $ 106)))
                                  (EXIT
                                   (COND (|od?| (SPADCALL |x| (QREFELT $ 105)))
                                         ('T |x|)))))
                           (GO #2=#:G241))))))))))
                  (EXIT (SPADCALL |op| |args| (QREFELT $ 108)))))
                #2# (EXIT #1#)))) 

(SDEFUN |FS-;eval;SLLLS;29|
        ((|x| S) (|s| |List| (|Symbol|)) (|n| |List| (|NonNegativeInteger|))
         (|l| |List| (|Mapping| S S)) ($ S))
        (SPROG ((#1=#:G248 NIL) (|f| NIL) (#2=#:G247 NIL))
               (SEQ
                (SPADCALL |x| |s| |n|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |f| NIL) (LETT #1# |l|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (CONS #'|FS-;eval;SLLLS;29!0|
                                               (VECTOR |f| $))
                                         #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 96))))) 

(SDEFUN |FS-;eval;SLLLS;29!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 92)) |f|))))) 

(SDEFUN |FS-;smprep|
        ((|lop| |List| (|Symbol|)) (|lexp| |List| (|NonNegativeInteger|))
         (|lfunc| |List| (|Mapping| S (|List| S)))
         (|p| |SparseMultivariatePolynomial| R (|Kernel| S)) ($ S))
        (SPROG
         ((|q| (|SparseUnivariatePolynomial| S)) (|a| (S)) (|t2| (S))
          (|t1| (S))
          (|qr|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (|m| (|NonNegativeInteger|)) (|e| (|NonNegativeInteger|)) (|f| (S))
          (|n| (|Integer|)) (|g| (S)) (|arg| (|List| S)) (#1=#:G277 NIL)
          (#2=#:G276 NIL) (|op| (|BasicOperator|)) (|k| (|Kernel| S))
          (|v| (|Union| (|Kernel| S) "failed")))
         (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 112)))
              (EXIT
               (COND ((QEQCAR |v| 1) (SPADCALL |p| (QREFELT $ 87)))
                     (#3='T
                      (SEQ (LETT |k| (QCDR |v|))
                           (LETT |g|
                                 (SPADCALL
                                  (LETT |op| (SPADCALL |k| (QREFELT $ 44)))
                                  (LETT |arg|
                                        (PROGN
                                         (LETT #2# NIL)
                                         (SEQ (LETT |a| NIL)
                                              (LETT #1#
                                                    (SPADCALL |k|
                                                              (QREFELT $ 46)))
                                              G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |a| (CAR #1#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS
                                                       (SPADCALL |a| |lop|
                                                                 |lexp| |lfunc|
                                                                 (QREFELT $
                                                                          96))
                                                       #2#))))
                                              (LETT #1# (CDR #1#)) (GO G190)
                                              G191 (EXIT (NREVERSE #2#)))))
                                  (QREFELT $ 39)))
                           (LETT |q|
                                 (SPADCALL
                                  (CONS #'|FS-;smprep!0|
                                        (VECTOR |lfunc| |lexp| |lop| $))
                                  (SPADCALL |p| |k| (QREFELT $ 114))
                                  (QREFELT $ 119)))
                           (EXIT
                            (COND
                             ((<
                               (LETT |n|
                                     (SPADCALL (SPADCALL |op| (QREFELT $ 48))
                                               |lop| (QREFELT $ 121)))
                               (SPADCALL |lop| (QREFELT $ 122)))
                              (SPADCALL |q| |g| (QREFELT $ 123)))
                             (#3#
                              (SEQ (LETT |a| (|spadConstant| $ 124))
                                   (LETT |f|
                                         (SPADCALL
                                          (SPADCALL |arg|
                                                    (SPADCALL |lfunc| |n|
                                                              (QREFELT $ 127)))
                                          |lop| |lexp| |lfunc| (QREFELT $ 96)))
                                   (LETT |e|
                                         (SPADCALL |lexp| |n| (QREFELT $ 128)))
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (SPADCALL |q| (|spadConstant| $ 129)
                                                     (QREFELT $ 130)))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |m|
                                               (SPADCALL |q| (QREFELT $ 131)))
                                         (LETT |qr| (DIVIDE2 |m| |e|))
                                         (LETT |t1|
                                               (SPADCALL |f| (QCAR |qr|)
                                                         (QREFELT $ 132)))
                                         (LETT |t2|
                                               (SPADCALL |g| (QCDR |qr|)
                                                         (QREFELT $ 132)))
                                         (LETT |a|
                                               (SPADCALL |a|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |q|
                                                                     (QREFELT $
                                                                              133))
                                                           |t1|
                                                           (QREFELT $ 134))
                                                          |t2| (QREFELT $ 134))
                                                         (QREFELT $ 135)))
                                         (EXIT
                                          (LETT |q|
                                                (SPADCALL |q|
                                                          (QREFELT $ 136)))))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT |a|)))))))))))) 

(SDEFUN |FS-;smprep!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |lop| |lexp| |lfunc|)
          (LETT $ (QREFELT $$ 3))
          (LETT |lop| (QREFELT $$ 2))
          (LETT |lexp| (QREFELT $$ 1))
          (LETT |lfunc| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |y| (QREFELT $ 87)) |lop| |lexp| |lfunc|
                      (QREFELT $ 96)))))) 

(SDEFUN |FS-;dispdiff|
        ((|l| |List| S)
         ($ |Record| (|:| |name| (|OutputForm|)) (|:| |sub| (|OutputForm|))
          (|:| |arg| (|List| (|OutputForm|))) (|:| |orig_op| (|BasicOperator|))
          (|:| |level| (|NonNegativeInteger|))))
        (SPROG
         ((|m| (|List| (|OutputForm|))) (#1=#:G290 NIL) (|x| NIL)
          (#2=#:G289 NIL) (|i| (|Integer|))
          (|rec|
           (|Record| (|:| |name| (|OutputForm|)) (|:| |sub| (|OutputForm|))
                     (|:| |arg| (|List| (|OutputForm|)))
                     (|:| |orig_op| (|BasicOperator|))
                     (|:| |level| (|NonNegativeInteger|))))
          (|a| (|List| S)) (|k| (|Kernel| S)) (|t| (|OutputForm|))
          (|s| (|OutputForm|)))
         (SEQ
          (LETT |s| (SPADCALL (SPADCALL |l| (QREFELT $ 52)) (QREFELT $ 138)))
          (LETT |t| (SPADCALL (SPADCALL |l| (QREFELT $ 53)) (QREFELT $ 138)))
          (LETT |a|
                (SPADCALL
                 (LETT |k| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 28)))
                 (QREFELT $ 46)))
          (EXIT
           (COND
            ((SPADCALL |k| (QREFELT $ 15) (QREFELT $ 139))
             (SEQ (LETT |rec| (|FS-;dispdiff| |a| $))
                  (LETT |i| (SPADCALL |s| (QVELT |rec| 2) (QREFELT $ 141)))
                  (SPADCALL (QVELT |rec| 2) |i| |t| (QREFELT $ 142))
                  (EXIT
                   (VECTOR (QVELT |rec| 0)
                           (SPADCALL (QVELT |rec| 1)
                                     (SPADCALL (SPADCALL '|,| (QREFELT $ 143))
                                               (SPADCALL
                                                (- (+ |i| 1)
                                                   (SPADCALL |a|
                                                             (QREFELT $ 145)))
                                                (QREFELT $ 146))
                                               (QREFELT $ 147))
                                     (QREFELT $ 147))
                           (QVELT |rec| 2) (QVELT |rec| 3)
                           (COND ((ZEROP (QVELT |rec| 4)) 0)
                                 (#3='T (+ (QVELT |rec| 4) 1)))))))
            (#3#
             (SEQ
              (LETT |i|
                    (SPADCALL (SPADCALL |l| (QREFELT $ 52)) |a|
                              (QREFELT $ 148)))
              (LETT |m|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |x| NIL) (LETT #1# |a|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (SPADCALL |x| (QREFELT $ 138)) #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (SPADCALL |m| |i| |t| (QREFELT $ 142))
              (EXIT
               (VECTOR
                (SPADCALL
                 (SPADCALL (SPADCALL |k| (QREFELT $ 44)) (QREFELT $ 48))
                 (QREFELT $ 143))
                (SPADCALL (SPADCALL '|,| (QREFELT $ 143))
                          (SPADCALL
                           (- (+ |i| 1) (SPADCALL |a| (QREFELT $ 145)))
                           (QREFELT $ 146))
                          (QREFELT $ 147))
                |m| (SPADCALL |k| (QREFELT $ 44))
                (COND ((NULL (CDR |a|)) 1) (#3# 0))))))))))) 

(SDEFUN |FS-;ddiff| ((|l| |List| S) ($ |OutputForm|))
        (SPROG
         ((|f| (|Union| (|None|) "failed")) (|opname| (|OutputForm|))
          (|rec|
           (|Record| (|:| |name| (|OutputForm|)) (|:| |sub| (|OutputForm|))
                     (|:| |arg| (|List| (|OutputForm|)))
                     (|:| |orig_op| (|BasicOperator|))
                     (|:| |level| (|NonNegativeInteger|)))))
         (SEQ (LETT |rec| (|FS-;dispdiff| |l| $))
              (LETT |opname|
                    (COND
                     ((ZEROP (QVELT |rec| 4))
                      (SPADCALL (QVELT |rec| 0) (QVELT |rec| 1)
                                (QREFELT $ 149)))
                     (#1='T
                      (SPADCALL (QVELT |rec| 0) (QVELT |rec| 4)
                                (QREFELT $ 150)))))
              (LETT |f|
                    (SPADCALL (QVELT |rec| 3) '|%diffDisp| (QREFELT $ 152)))
              (EXIT
               (COND
                ((QEQCAR |f| 0)
                 (SPADCALL (CONS |opname| (QVELT |rec| 2)) (QCDR |f|)))
                (#1# (SPADCALL |opname| (QVELT |rec| 2) (QREFELT $ 153)))))))) 

(SDEFUN |FS-;encode_diff|
        ((|ker| |Kernel| S) (|nsub| |List| (|Integer|)) (|args| |List| S)
         (|nd| |List| S) ($ S))
        (SPROG
         ((|res| (S)) (#1=#:G316 NIL) (|kk| NIL) (#2=#:G312 NIL)
          (|i| #3=(|Integer|)) (#4=#:G313 NIL) (|k| (|Integer|))
          (#5=#:G314 NIL) (|pt| NIL) (#6=#:G315 NIL) (|dm| NIL)
          (|pts| (|List| S)) (#7=#:G310 NIL) (#8=#:G311 NIL)
          (|nargs| (|List| S)) (|li| (|List| (|Integer|)))
          (|lk| (|List| (|Integer|))) (|ii| #3#))
         (SEQ (LETT |li| NIL) (LETT |lk| NIL) (LETT |i| (|SPADfirst| |nsub|))
              (LETT |k| 1) (LETT |nsub| (CDR |nsub|))
              (SEQ G190 (COND ((NULL (NULL (NULL |nsub|))) (GO G191)))
                   (SEQ (LETT |ii| (|SPADfirst| |nsub|))
                        (LETT |nsub| (CDR |nsub|))
                        (EXIT
                         (COND ((EQL |ii| |i|) (LETT |k| (+ |k| 1)))
                               ('T
                                (SEQ (LETT |lk| (CONS |k| |lk|))
                                     (LETT |li| (CONS |i| |li|))
                                     (LETT |i| |ii|) (EXIT (LETT |k| 1)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |lk| (CONS |k| |lk|)) (LETT |li| (CONS |i| |li|))
              (LETT |nargs| (SPADCALL |args| (QREFELT $ 154))) (LETT |pts| NIL)
              (SEQ (LETT |dm| NIL) (LETT #8# |nd|) (LETT |i| NIL)
                   (LETT #7# (REVERSE |li|)) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |i| (CAR #7#)) NIL) (ATOM #8#)
                         (PROGN (LETT |dm| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |pts|
                          (CONS (SPADCALL |nargs| |i| (QREFELT $ 155)) |pts|))
                    (EXIT (SPADCALL |nargs| |i| |dm| (QREFELT $ 156))))
                   (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#)))) (GO G190)
                   G191 (EXIT NIL))
              (LETT |res|
                    (SPADCALL (SPADCALL |ker| (QREFELT $ 44)) |nargs|
                              (QREFELT $ 47)))
              (SEQ (LETT |dm| NIL) (LETT #6# (REVERSE |nd|)) (LETT |pt| NIL)
                   (LETT #5# |pts|) (LETT |k| NIL) (LETT #4# |lk|)
                   (LETT |i| NIL) (LETT #2# |li|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL) (ATOM #4#)
                         (PROGN (LETT |k| (CAR #4#)) NIL) (ATOM #5#)
                         (PROGN (LETT |pt| (CAR #5#)) NIL) (ATOM #6#)
                         (PROGN (LETT |dm| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (SEQ (LETT |kk| 2) (LETT #1# |k|) G190
                         (COND ((|greater_SI| |kk| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL (QREFELT $ 15)
                                           (LIST |res| |dm| |dm|)
                                           (QREFELT $ 47)))))
                         (LETT |kk| (|inc_SI| |kk|)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |res|
                           (SPADCALL (QREFELT $ 15) (LIST |res| |dm| |pt|)
                                     (QREFELT $ 47)))))
                   (LETT #2#
                         (PROG1 (CDR #2#)
                           (LETT #4#
                                 (PROG1 (CDR #4#)
                                   (LETT #5#
                                         (PROG1 (CDR #5#)
                                           (LETT #6# (CDR #6#))))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FS-;insert_sub|
        ((|lsub| |List| (|Integer|)) (|j| |Integer|) ($ |List| (|Integer|)))
        (SPROG
         ((|nsub| (|List| (|Integer|))) (|to_insert| (|Boolean|))
          (#1=#:G322 NIL) (|i| NIL))
         (SEQ (LETT |nsub| NIL) (LETT |to_insert| 'T)
              (SEQ (LETT |i| NIL) (LETT #1# |lsub|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|to_insert|
                      (COND
                       ((NULL (> |i| |j|))
                        (SEQ (LETT |nsub| (CONS |j| |nsub|))
                             (EXIT (LETT |to_insert| NIL)))))))
                    (EXIT (LETT |nsub| (CONS |i| |nsub|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (COND (|to_insert| (LETT |nsub| (CONS |j| |nsub|))))
              (EXIT (NREVERSE |nsub|))))) 

(SDEFUN |FS-;pos_diff|
        ((|l| |List| S)
         (|r1| |Record| (|:| |orig_k| (|Kernel| S))
          (|:| |sub| (|List| (|Integer|))) (|:| |oarg| (|List| S))
          (|:| |arg| (|List| S)) (|:| |dummies| #1=(|List| S)))
         (|i| |Integer|) ($ S))
        (SPROG
         ((|nd| #1#) (|dm| (S)) (|nd2| (|List| S)) (|nd1| (|List| S))
          (|k| (|NonNegativeInteger|)) (#2=#:G329 NIL) (#3=#:G330 NIL)
          (|j| NIL) (|ii| (|Integer|)) (|nsub| (|List| (|Integer|))))
         (SEQ (LETT |nsub| (|FS-;insert_sub| (QVELT |r1| 1) |i| $))
              (LETT |nd| (QVELT |r1| 4))
              (COND
               ((NULL (SPADCALL |i| (QVELT |r1| 1) (QREFELT $ 158)))
                (SEQ (LETT |k| 0) (LETT |ii| (|SPADfirst| |nsub|))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| NIL) (LETT #3# |nsub|) G190
                            (COND
                             ((OR (ATOM #3#) (PROGN (LETT |j| (CAR #3#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((EQL |i| |j|)
                                (PROGN (LETT #2# |$NoValue|) (GO #4=#:G324)))
                               ((NULL (EQL |ii| |j|)) (LETT |k| (+ |k| 1))))))
                            (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                      #4# (EXIT #2#))
                     (LETT |nd1| (SPADCALL |nd| |k| (QREFELT $ 159)))
                     (LETT |nd2| (SPADCALL |nd| |k| (QREFELT $ 160)))
                     (LETT |dm|
                           (SPADCALL (SPADCALL (QREFELT $ 89)) (QREFELT $ 38)))
                     (EXIT
                      (LETT |nd|
                            (SPADCALL |nd1| (CONS |dm| |nd2|)
                                      (QREFELT $ 161)))))))
              (EXIT
               (|FS-;encode_diff| (QVELT |r1| 0) |nsub| (QVELT |r1| 3) |nd|
                $))))) 

(SDEFUN |FS-;diffdiff| ((|l| |List| S) (|x| |Symbol|) ($ S))
        (SPROG
         ((|res| (S)) (|db| (S)) (#1=#:G336 NIL) (|i| NIL) (#2=#:G337 NIL)
          (|b| NIL) (|args| #3=(|List| S))
          (|r1|
           (|Record| (|:| |orig_k| (|Kernel| S))
                     (|:| |sub| (|List| (|Integer|))) (|:| |oarg| (|List| S))
                     (|:| |arg| #3#) (|:| |dummies| (|List| S)))))
         (SEQ (LETT |r1| (|FS-;decode_diff| |l| $))
              (LETT |args| (QVELT |r1| 3)) (LETT |res| (|spadConstant| $ 124))
              (SEQ (LETT |b| NIL) (LETT #2# |args|)
                   (LETT |i| (SPADCALL |args| (QREFELT $ 145)))
                   (LETT #1# (SPADCALL |args| (QREFELT $ 162))) G190
                   (COND
                    ((OR (> |i| #1#) (ATOM #2#)
                         (PROGN (LETT |b| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |db| (SPADCALL |b| |x| (QREFELT $ 163)))
                        (EXIT
                         (COND
                          ((SPADCALL |db| (|spadConstant| $ 124)
                                     (QREFELT $ 164))
                           "iterate")
                          ('T
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL |db|
                                                     (|FS-;pos_diff| |l| |r1|
                                                      |i| $)
                                                     (QREFELT $ 134))
                                           (QREFELT $ 135)))))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #2# (CDR #2#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FS-;dfeval| ((|l| |List| S) (|g| |Kernel| S) ($ S))
        (SPROG ((#1=#:G339 NIL))
               (SPADCALL
                (SPADCALL (|SPADfirst| |l|)
                          (PROG2 (LETT #1# (SPADCALL |g| (QREFELT $ 30)))
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                            (|Union| (|Symbol|) "failed") #1#))
                          (QREFELT $ 163))
                |g| (SPADCALL |l| (QREFELT $ 53)) (QREFELT $ 54)))) 

(SDEFUN |FS-;diffEval| ((|l| |List| S) ($ S))
        (SPROG
         ((|d| (|List| (|Mapping| S (|List| S)))) (|n| (|Integer|))
          (|nl| (|List| S)) (|ss| (S)) (|dumm| (S))
          (|ud| (|Union| (|List| (|Mapping| S (|List| S))) "failed"))
          (|op| (|BasicOperator|)) (#1=#:G372 NIL) (|k| (|Kernel| S))
          (|u| (|Union| (|Kernel| S) "failed")) (|g| (|Kernel| S)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |g| (SPADCALL (SPADCALL |l| (QREFELT $ 52)) (QREFELT $ 28)))
            (SEQ (LETT |u| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 78)))
                 (EXIT
                  (COND
                   ((QEQCAR |u| 1)
                    (PROGN (LETT #1# (|FS-;dfeval| |l| |g| $)) (GO #2=#:G370)))
                   ((QEQCAR |u| 0)
                    (COND
                     ((QEQCAR (SPADCALL (LETT |k| (QCDR |u|)) (QREFELT $ 30))
                              0)
                      (PROGN
                       (LETT #1# (|FS-;dfeval| |l| |g| $))
                       (GO #2#))))))))
            (LETT |op| (SPADCALL |k| (QREFELT $ 44)))
            (LETT |ud| (SPADCALL |op| (QREFELT $ 167)))
            (EXIT
             (COND
              ((QEQCAR |ud| 1)
               (SEQ
                (LETT |dumm|
                      (SPADCALL (|FS-;symsub| (QREFELT $ 80) 1 $)
                                (QREFELT $ 38)))
                (LETT |ss|
                      (SPADCALL (SPADCALL |l| 1 (QREFELT $ 155))
                                (SPADCALL (SPADCALL |l| 2 (QREFELT $ 155))
                                          |dumm| (QREFELT $ 169))
                                (QREFELT $ 171)))
                (LETT |nl| (LIST |ss| |dumm| (SPADCALL |l| 3 (QREFELT $ 155))))
                (EXIT (SPADCALL (QREFELT $ 15) |nl| (QREFELT $ 47)))))
              ((<
                (LETT |n|
                      (SPADCALL (SPADCALL |l| (QREFELT $ 52))
                                (SPADCALL |k| (QREFELT $ 46)) (QREFELT $ 148)))
                (SPADCALL |l| (QREFELT $ 145)))
               (|FS-;dfeval| |l| |g| $))
              ('T
               (SEQ (LETT |d| (QCDR |ud|))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |k| (QREFELT $ 46))
                                (SPADCALL |d| |n| (QREFELT $ 127)))
                      |g| (SPADCALL |l| (QREFELT $ 53)) (QREFELT $ 54)))))))))
          #2# (EXIT #1#)))) 

(SDEFUN |FS-;diffArg|
        ((|l| |List| S) (|op| |BasicOperator|) (|i| |NonNegativeInteger|)
         ($ |List| S))
        (SPROG ((|g| (S)) (|z| (|List| S)) (|n| (|Integer|)))
               (SEQ (LETT |n| (+ (- |i| 1) (SPADCALL |l| (QREFELT $ 145))))
                    (LETT |z| (SPADCALL |l| (QREFELT $ 154)))
                    (SPADCALL |z| |n|
                              (LETT |g|
                                    (SPADCALL
                                     (|FS-;symsub| (QREFELT $ 80) |n| $)
                                     (QREFELT $ 38)))
                              (QREFELT $ 156))
                    (EXIT
                     (LIST (SPADCALL |op| |z| (QREFELT $ 47)) |g|
                           (SPADCALL |l| |n| (QREFELT $ 155))))))) 

(SDEFUN |FS-;opderiv|
        ((|op| |BasicOperator|) (|n| |NonNegativeInteger|)
         ($ |List| (|Mapping| S (|List| S))))
        (SPROG ((#1=#:G383 NIL) (|i| NIL) (#2=#:G382 NIL) (|g| (S)))
               (SEQ
                (COND
                 ((EQL |n| 1)
                  (SEQ
                   (LETT |g|
                         (SPADCALL (|FS-;symsub| (QREFELT $ 80) |n| $)
                                   (QREFELT $ 38)))
                   (EXIT
                    (LIST
                     (CONS #'|FS-;opderiv!0|
                           (VECTOR $ |g| |op| (QREFELT $ 15)))))))
                 ('T
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (CONS #'|FS-;opderiv!1|
                                       (VECTOR $ |i| |op| (QREFELT $ 15)))
                                 #2#))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |FS-;opderiv!1| ((|x| NIL) ($$ NIL))
        (PROG (|opdiff| |op| |i| $)
          (LETT |opdiff| (QREFELT $$ 3))
          (LETT |op| (QREFELT $$ 2))
          (LETT |i| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |opdiff| (|FS-;diffArg| |x| |op| |i| $)
                      (QREFELT $ 47)))))) 

(SDEFUN |FS-;opderiv!0| ((|x| NIL) ($$ NIL))
        (PROG (|opdiff| |op| |g| $)
          (LETT |opdiff| (QREFELT $$ 3))
          (LETT |op| (QREFELT $$ 2))
          (LETT |g| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |opdiff|
                      (LIST (SPADCALL |op| |g| (QREFELT $ 172)) |g|
                            (SPADCALL |x| (QREFELT $ 92)))
                      (QREFELT $ 47)))))) 

(SDEFUN |FS-;kgrad| ((|k| |Kernel| S) ($ |List| (|Mapping| S (|List| S))))
        (SPROG
         ((|grad| (|List| (|Mapping| S (|List| S))))
          (|u| (|Union| (|List| (|Mapping| S (|List| S))) "failed"))
          (|op| (|BasicOperator|)) (|n| (|NonNegativeInteger|))
          (|args| (|List| S)))
         (SEQ
          (COND
           ((ZEROP
             (LETT |n| (LENGTH (LETT |args| (SPADCALL |k| (QREFELT $ 46))))))
            NIL)
           (#1='T
            (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 44)))
                 (LETT |grad|
                       (SEQ (LETT |u| (SPADCALL |op| (QREFELT $ 167)))
                            (EXIT
                             (COND ((QEQCAR |u| 1) (|FS-;opderiv| |op| |n| $))
                                   (#1# (QCDR |u|))))))
                 (EXIT
                  (COND
                   ((SPADCALL (LENGTH |grad|) |n| (QREFELT $ 173))
                    (|FS-;opderiv| |op| |n| $))
                   (#1# |grad|))))))))) 

(SDEFUN |FS-;kerderiv| ((|k| |Kernel| S) (|x| |Symbol|) ($ S))
        (SPROG
         ((#1=#:G401 NIL) (#2=#:G400 (S)) (#3=#:G402 (S)) (|dyx| (S))
          (#4=#:G406 NIL) (|g| NIL) (#5=#:G407 NIL) (|y| NIL)
          (|fn| (|Union| (|None|) "failed")) (|ak| (|List| S))
          (|v| (|Union| (|Symbol|) "failed")))
         (SEQ (LETT |v| (SPADCALL |k| (QREFELT $ 30)))
              (EXIT
               (COND
                ((QEQCAR |v| 0)
                 (COND ((EQUAL (QCDR |v|) |x|) (|spadConstant| $ 144))
                       (#6='T (|spadConstant| $ 124))))
                (#6#
                 (SEQ (LETT |ak| (SPADCALL |k| (QREFELT $ 46)))
                      (LETT |fn|
                            (SPADCALL (SPADCALL |k| (QREFELT $ 44))
                                      (QREFELT $ 10) (QREFELT $ 152)))
                      (EXIT
                       (COND ((QEQCAR |fn| 0) (SPADCALL |ak| |x| (QCDR |fn|)))
                             (#6#
                              (PROGN
                               (LETT #1# NIL)
                               (SEQ (LETT |y| NIL) (LETT #5# |ak|)
                                    (LETT |g| NIL)
                                    (LETT #4# (|FS-;kgrad| |k| $)) G190
                                    (COND
                                     ((OR (ATOM #4#)
                                          (PROGN (LETT |g| (CAR #4#)) NIL)
                                          (ATOM #5#)
                                          (PROGN (LETT |y| (CAR #5#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (LETT |dyx|
                                               (SPADCALL |y| |x|
                                                         (QREFELT $ 163)))
                                         (|spadConstant| $ 124)
                                         (QREFELT $ 174))
                                        (PROGN
                                         (LETT #3#
                                               (SPADCALL (SPADCALL |ak| |g|)
                                                         |dyx|
                                                         (QREFELT $ 134)))
                                         (COND
                                          (#1#
                                           (LETT #2#
                                                 (SPADCALL #2# #3#
                                                           (QREFELT $ 135))))
                                          ('T
                                           (PROGN
                                            (LETT #2# #3#)
                                            (LETT #1# 'T)))))))))
                                    (LETT #4#
                                          (PROG1 (CDR #4#)
                                            (LETT #5# (CDR #5#))))
                                    (GO G190) G191 (EXIT NIL))
                               (COND (#1# #2#)
                                     (#6# (|spadConstant| $ 124)))))))))))))) 

(SDEFUN |FS-;smpderiv|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S)) (|x| |Symbol|)
         ($ S))
        (SPROG
         ((#1=#:G434 NIL) (#2=#:G433 (S)) (#3=#:G435 (S)) (#4=#:G437 NIL)
          (|k| NIL))
         (SEQ
          (SPADCALL
           (SPADCALL
            (SPADCALL (CONS #'|FS-;smpderiv!0| (VECTOR |x| $)) |p|
                      (QREFELT $ 180))
            (QREFELT $ 87))
           (PROGN
            (LETT #1# NIL)
            (SEQ (LETT |k| NIL) (LETT #4# (SPADCALL |p| (QREFELT $ 182))) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |k| (CAR #4#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #3#
                          (SPADCALL
                           (SPADCALL (SPADCALL |p| |k| (QREFELT $ 183))
                                     (QREFELT $ 87))
                           (|FS-;kerderiv| |k| |x| $) (QREFELT $ 134)))
                    (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 135))))
                          ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 124))))
           (QREFELT $ 135))))) 

(SDEFUN |FS-;smpderiv!0| ((|s| NIL) ($$ NIL))
        (PROG ($ |x|)
          (LETT $ (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (SPADCALL |s| (QREFELT $ 176)) |x| (QREFELT $ 177))
             (QREFELT $ 178)))))) 

(SDEFUN |FS-;coerce;PS;44| ((|p| |Polynomial| R) ($ S))
        (SPADCALL (ELT $ 38) (ELT $ 184) |p| (QREFELT $ 188))) 

(SDEFUN |FS-;worse?| ((|k1| |Kernel| S) (|k2| |Kernel| S) ($ |Boolean|))
        (SPROG ((|u| (|Union| (|Boolean|) "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL
                       (SPADCALL (SPADCALL |k1| (QREFELT $ 44)) (QREFELT $ 48))
                       (SPADCALL (SPADCALL |k2| (QREFELT $ 44)) (QREFELT $ 48))
                       (QREFELT $ 192)))
                (EXIT
                 (COND ((QEQCAR |u| 1) (SPADCALL |k1| |k2| (QREFELT $ 193)))
                       ('T (QCDR |u|))))))) 

(SDEFUN |FS-;bestKernel| ((|l| |List| (|Kernel| S)) ($ |Kernel| S))
        (SPROG ((|a| (|Kernel| S)))
               (SEQ
                (COND ((NULL (CDR |l|)) (|SPADfirst| |l|))
                      (#1='T
                       (SEQ (LETT |a| (|FS-;bestKernel| (CDR |l|) $))
                            (EXIT
                             (COND ((|FS-;worse?| (|SPADfirst| |l|) |a| $) |a|)
                                   (#1# (|SPADfirst| |l|)))))))))) 

(SDEFUN |FS-;smp2O|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S)) ($ |OutputForm|))
        (SPROG ((|a| (|Kernel| S)) (#1=#:G451 NIL) (|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |p| (QREFELT $ 194)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 195)))
                      (#2='T
                       (SEQ
                        (LETT |a|
                              (COND
                               ((SPADCALL (QREFELT $ 196))
                                (|FS-;bestKernel|
                                 (SPADCALL |p| (QREFELT $ 182)) $))
                               (#2#
                                (PROG2
                                    (LETT #1# (SPADCALL |p| (QREFELT $ 112)))
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0)
                                                  (|Kernel| (QREFELT $ 6))
                                                  (|Union|
                                                   (|Kernel| (QREFELT $ 6))
                                                   "failed")
                                                  #1#)))))
                        (EXIT
                         (SPADCALL
                          (SPADCALL (ELT $ 87)
                                    (SPADCALL |p| |a| (QREFELT $ 114))
                                    (QREFELT $ 119))
                          (SPADCALL |a| (QREFELT $ 197))
                          (QREFELT $ 198)))))))))) 

(SDEFUN |FS-;smpsubst|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S))
         (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|FS-;smpsubst!2| (VECTOR $ |lv| |lk|))
                         (ELT $ 184) |p| (QREFELT $ 204)))) 

(SDEFUN |FS-;smpsubst!2| ((|x| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |lk| |lv| |x|
                             (|FS-;notfound|
                              (CONS #'|FS-;smpsubst!1| (VECTOR |lk| |lv| $))
                              |lk| $)
                             (QREFELT $ 202))))))) 

(SDEFUN |FS-;smpsubst!1| ((|z| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT |lk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (|FS-;subs| (CONS #'|FS-;smpsubst!0| (VECTOR $ |lv| |lk|))
                    |z| $)))))) 

(SDEFUN |FS-;smpsubst!0| ((|s| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |s| |lk| |lv| (QREFELT $ 199)))))) 

(SDEFUN |FS-;smpeval|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S))
         (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|FS-;smpeval!2| (VECTOR $ |lv| |lk|))
                         (ELT $ 184) |p| (QREFELT $ 204)))) 

(SDEFUN |FS-;smpeval!2| ((|x| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |lk| |lv| |x|
                             (|FS-;notfound|
                              (CONS #'|FS-;smpeval!1| (VECTOR |lk| |lv| $))
                              |lk| $)
                             (QREFELT $ 202))))))) 

(SDEFUN |FS-;smpeval!1| ((|z| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT |lk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|FS-;smpeval!0| (VECTOR $ |lv| |lk|)) |z|
                             (QREFELT $ 206))))))) 

(SDEFUN |FS-;smpeval!0| ((|s| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |s| |lk| |lv| (QREFELT $ 205)))))) 

(SDEFUN |FS-;notfound|
        ((|fn| |Mapping| S (|Kernel| S)) (|lk| |List| (|Kernel| S))
         ($ |Mapping| S (|Kernel| S)))
        (SPROG NIL (CONS #'|FS-;notfound!0| (VECTOR |fn| |lk| $)))) 

(SDEFUN |FS-;notfound!0| ((|k| NIL) ($$ NIL))
        (PROG ($ |lk| |fn|)
          (LETT $ (QREFELT $$ 2))
          (LETT |lk| (QREFELT $$ 1))
          (LETT |fn| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|f| NIL))
                   (COND
                    ((SPADCALL
                      (SPADCALL
                       (SPADCALL (LETT |f| (SPADCALL |k| (QREFELT $ 26)))
                                 (QREFELT $ 207))
                       |lk| (QREFELT $ 208))
                      (QREFELT $ 209))
                     |f|)
                    ('T (SPADCALL |k| |fn|)))))))) 

(SDEFUN |FS-;smpret|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S))
         ($ |Union| (|Polynomial| R) "failed"))
        (SPROG
         ((#1=#:G505 NIL) (#2=#:G504 #3=(|Boolean|)) (#4=#:G506 #3#)
          (#5=#:G513 NIL) (|k| NIL))
         (SEQ
          (COND
           ((PROGN
             (LETT #1# NIL)
             (SEQ (LETT |k| NIL) (LETT #5# (SPADCALL |p| (QREFELT $ 182))) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |k| (CAR #5#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4# (QEQCAR (SPADCALL |k| (QREFELT $ 30)) 1))
                     (COND (#1# (LETT #2# (COND (#2# 'T) ('T #4#))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                  (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6='T NIL)))
            (CONS 1 "failed"))
           (#6#
            (CONS 0
                  (SPADCALL (CONS #'|FS-;smpret!0| $) (ELT $ 176) |p|
                            (QREFELT $ 214)))))))) 

(SDEFUN |FS-;smpret!0| ((|x| NIL) ($ NIL))
        (SPROG ((#1=#:G508 NIL))
               (SPADCALL
                (PROG2 (LETT #1# (SPADCALL |x| (QREFELT $ 30)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                  (|Union| (|Symbol|) "failed") #1#))
                (QREFELT $ 210)))) 

(SDEFUN |FS-;isExpt;SBoU;52|
        ((|x| S) (|op| |BasicOperator|)
         ($ |Union|
          (|Record| (|:| |var| #1=(|Kernel| S)) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPROG
         ((|v| #1#)
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| S)) (|:| |exponent| (|Integer|)))
            "failed")))
         (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 217)))
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                     ('T
                      (SEQ (LETT |v| (QCAR (QCDR |u|)))
                           (COND
                            ((SPADCALL |v| |op| (QREFELT $ 139))
                             (COND
                              ((EQL (LENGTH (SPADCALL |v| (QREFELT $ 46))) 1)
                               (EXIT |u|)))))
                           (EXIT (CONS 1 "failed"))))))))) 

(SDEFUN |FS-;isExpt;SSU;53|
        ((|x| S) (|sy| |Symbol|)
         ($ |Union|
          (|Record| (|:| |var| #1=(|Kernel| S)) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPROG
         ((|v| #1#)
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| S)) (|:| |exponent| (|Integer|)))
            "failed")))
         (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 217)))
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                     ('T
                      (SEQ (LETT |v| (QCAR (QCDR |u|)))
                           (COND
                            ((SPADCALL |v| |sy| (QREFELT $ 219))
                             (COND
                              ((EQL (LENGTH (SPADCALL |v| (QREFELT $ 46))) 1)
                               (EXIT |u|)))))
                           (EXIT (CONS 1 "failed"))))))))) 

(SDEFUN |FS-;smpIsMult|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S))
         ($ |Union|
          (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S)))
          "failed"))
        (SPROG
         ((#1=#:G552 NIL) (|n| (|Union| (|Integer|) "failed"))
          (|r| (|Union| R "failed"))
          (|q|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| S))))
          (|u| (|Union| (|Kernel| S) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |u| (SPADCALL |p| (QREFELT $ 112)))
                 (EXIT
                  (COND
                   ((QEQCAR |u| 0)
                    (COND
                     ((EQL
                       (SPADCALL
                        (LETT |q| (SPADCALL |p| (QCDR |u|) (QREFELT $ 114)))
                        (QREFELT $ 221))
                       1)
                      (COND
                       ((SPADCALL
                         (SPADCALL (SPADCALL |q| (QREFELT $ 222))
                                   (QREFELT $ 223))
                         (QREFELT $ 224))
                        (SEQ
                         (LETT |r|
                               (SPADCALL (SPADCALL |q| (QREFELT $ 223))
                                         (QREFELT $ 194)))
                         (EXIT
                          (COND
                           ((QEQCAR |r| 0)
                            (SEQ
                             (LETT |n| (SPADCALL (QCDR |r|) (QREFELT $ 226)))
                             (EXIT
                              (COND
                               ((QEQCAR |n| 0)
                                (PROGN
                                 (LETT #1#
                                       (CONS 0 (CONS (QCDR |n|) (QCDR |u|))))
                                 (GO #2=#:G550))))))))))))))))))
            (EXIT (CONS 1 "failed"))))
          #2# (EXIT #1#)))) 

(PUT '|FS-;debugA| '|SPADreplace| '(XLAM (|a1| |a2| |t|) |t|)) 

(SDEFUN |FS-;debugA|
        ((|a1| |List| S) (|a2| |List| S) (|t| |Boolean|) ($ |Boolean|)) |t|) 

(SDEFUN |FS-;decode_diff|
        ((|l| |List| S)
         ($
          . #1=(|Record| (|:| |orig_k| (|Kernel| S))
                         (|:| |sub| (|List| (|Integer|)))
                         (|:| |oarg| (|List| S)) (|:| |arg| (|List| S))
                         (|:| |dummies| #2=(|List| S)))))
        (SPROG
         ((|a1| (|List| S)) (|i| (|Integer|)) (|nd| #2#) (|rec| #1#)
          (|a| (|List| S)) (|k| (|Kernel| S)) (|pt| (S)) (|da| (S)))
         (SEQ (LETT |da| (SPADCALL |l| (QREFELT $ 52)))
              (LETT |pt| (SPADCALL |l| (QREFELT $ 53)))
              (LETT |a|
                    (SPADCALL
                     (LETT |k| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 28)))
                     (QREFELT $ 46)))
              (EXIT
               (COND
                ((SPADCALL |k| (QREFELT $ 15) (QREFELT $ 139))
                 (SEQ (LETT |rec| (|FS-;decode_diff| |a| $))
                      (LETT |i|
                            (SPADCALL |da| (QVELT |rec| 3) (QREFELT $ 148)))
                      (SPADCALL (QVELT |rec| 3) |i| |pt| (QREFELT $ 156))
                      (LETT |nd| (QVELT |rec| 4))
                      (COND
                       ((NULL (SPADCALL |i| (QVELT |rec| 1) (QREFELT $ 158)))
                        (LETT |nd| (CONS |da| |nd|))))
                      (EXIT
                       (VECTOR (QVELT |rec| 0) (CONS |i| (QVELT |rec| 1))
                               (QVELT |rec| 2) (QVELT |rec| 3) |nd|))))
                ('T
                 (SEQ (LETT |i| (SPADCALL |da| |a| (QREFELT $ 148)))
                      (LETT |a1| (SPADCALL |a| (QREFELT $ 154)))
                      (SPADCALL |a1| |i| |pt| (QREFELT $ 156))
                      (EXIT (VECTOR |k| (LIST |i|) |a| |a1| (LIST |da|)))))))))) 

(SDEFUN |FS-;equaldiff| ((|k1| |Kernel| S) (|k2| |Kernel| S) ($ |Boolean|))
        (SPROG
         ((|sk1| (S)) (|ok1| (S)) (|od| (|List| (|Kernel| S))) (#1=#:G572 NIL)
          (|dk| NIL) (#2=#:G571 NIL)
          (|r2|
           #3=(|Record| (|:| |orig_k| (|Kernel| S))
                        (|:| |sub| (|List| (|Integer|)))
                        (|:| |oarg| (|List| S)) (|:| |arg| (|List| S))
                        (|:| |dummies| (|List| S))))
          (|r1| #3#) (|res| (|Boolean|)) (|a2| #4=(|List| S)) (|a1| #4#))
         (SEQ (LETT |a1| (SPADCALL |k1| (QREFELT $ 46)))
              (LETT |a2| (SPADCALL |k2| (QREFELT $ 46)))
              (LETT |res|
                    (SPADCALL (SPADCALL |k1| (QREFELT $ 44))
                              (SPADCALL |k2| (QREFELT $ 44)) (QREFELT $ 228)))
              (EXIT
               (COND
                (|res|
                 (SEQ
                  (LETT |res|
                        (SPADCALL (SPADCALL |a1| 3 (QREFELT $ 155))
                                  (SPADCALL |a2| 3 (QREFELT $ 155))
                                  (QREFELT $ 164)))
                  (EXIT
                   (COND
                    (|res|
                     (COND
                      ((SPADCALL (SPADCALL |a1| 2 (QREFELT $ 155))
                                 (SPADCALL |a2| 2 (QREFELT $ 155))
                                 (QREFELT $ 164))
                       (SPADCALL (SPADCALL |a1| 1 (QREFELT $ 155))
                                 (SPADCALL |a2| 1 (QREFELT $ 155))
                                 (QREFELT $ 164)))
                      (#5='T
                       (SEQ (LETT |r1| (|FS-;decode_diff| |a1| $))
                            (LETT |r2| (|FS-;decode_diff| |a2| $))
                            (COND
                             ((NULL
                               (SPADCALL
                                (SPADCALL (QVELT |r1| 0) (QREFELT $ 44))
                                (SPADCALL (QVELT |r2| 0) (QREFELT $ 44))
                                (QREFELT $ 228)))
                              (EXIT NIL)))
                            (COND
                             ((NULL
                               (SPADCALL (QVELT |r1| 1) (QVELT |r2| 1)
                                         (QREFELT $ 229)))
                              (EXIT NIL)))
                            (COND
                             ((NULL
                               (SPADCALL (QVELT |r1| 3) (QVELT |r2| 3)
                                         (QREFELT $ 230)))
                              (EXIT NIL)))
                            (LETT |od|
                                  (PROGN
                                   (LETT #2# NIL)
                                   (SEQ (LETT |dk| NIL)
                                        (LETT #1# (QVELT |r1| 4)) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |dk| (CAR #1#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL |dk| (QREFELT $ 28))
                                                 #2#))))
                                        (LETT #1# (CDR #1#)) (GO G190) G191
                                        (EXIT (NREVERSE #2#)))))
                            (LETT |ok1|
                                  (SPADCALL (QVELT |r1| 0) (QREFELT $ 26)))
                            (LETT |sk1|
                                  (SPADCALL |ok1| |od| (QVELT |r2| 4)
                                            (QREFELT $ 199)))
                            (EXIT
                             (SPADCALL |sk1|
                                       (SPADCALL (QVELT |r2| 0) (QREFELT $ 26))
                                       (QREFELT $ 164)))))))
                    (#5# (|FS-;debugA| |a1| |a2| |res| $))))))
                (#5# (|FS-;debugA| |a1| |a2| |res| $))))))) 

(SDEFUN |FS-;mainKernel;SU;58| ((|x| S) ($ |Union| (|Kernel| S) "failed"))
        (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 112))) 

(SDEFUN |FS-;kernels;SL;59| ((|x| S) ($ |List| (|Kernel| S)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 182))) 

(SDEFUN |FS-;retract;SR;60| ((|x| S) ($ R))
        (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 233))) 

(SDEFUN |FS-;retract;SP;61| ((|x| S) ($ |Polynomial| R))
        (SPROG ((#1=#:G590 NIL))
               (PROG2 (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 90)) $))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                 (|Union| (|Polynomial| (QREFELT $ 7))
                                          "failed")
                                 #1#)))) 

(SDEFUN |FS-;retractIfCan;SU;62| ((|x| S) ($ |Union| R "failed"))
        (CONS 0 (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 233)))) 

(SDEFUN |FS-;retractIfCan;SU;63|
        ((|x| S) ($ |Union| (|Polynomial| R) "failed"))
        (|FS-;smpret| (SPADCALL |x| (QREFELT $ 90)) $)) 

(SDEFUN |FS-;eval;SLLS;64|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 90)) |lk| |lv| $)) 

(SDEFUN |FS-;subst;SLLS;65|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 90)) |lk| |lv| $)) 

(SDEFUN |FS-;differentiate;SSS;66| ((|x| S) (|s| |Symbol|) ($ S))
        (|FS-;smpderiv| (SPADCALL |x| (QREFELT $ 90)) |s| $)) 

(SDEFUN |FS-;coerce;SOf;67| ((|x| S) ($ |OutputForm|))
        (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 90)) $)) 

(SDEFUN |FS-;eval;SLLLS;68|
        ((|x| S) (|s| |List| (|Symbol|)) (|n| |List| (|NonNegativeInteger|))
         (|f| |List| (|Mapping| S (|List| S))) ($ S))
        (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 90)) $)) 

(SDEFUN |FS-;isPlus;SU;69| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPROG
         ((#1=#:G619 NIL) (|p| NIL) (#2=#:G618 NIL)
          (|u|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| S)))
                    "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 245)))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |p| NIL) (LETT #1# (QCDR |u|)) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |p| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |p| (QREFELT $ 87))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |FS-;isTimes;SU;70| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPROG
         ((#1=#:G630 NIL) (|p| NIL) (#2=#:G629 NIL)
          (|u|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| S)))
                    "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 247)))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |p| NIL) (LETT #1# (QCDR |u|)) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |p| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |p| (QREFELT $ 87))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |FS-;isExpt;SU;71|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |var| (|Kernel| S)) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPROG
         ((|r|
           (|Record| (|:| |var| (|Kernel| S))
                     (|:| |exponent| (|NonNegativeInteger|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| S))
                      (|:| |exponent| (|NonNegativeInteger|)))
            "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 251)))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |r| (QCDR |u|))
                       (EXIT (CONS 0 (CONS (QCAR |r|) (QCDR |r|))))))))))) 

(SDEFUN |FS-;isPower;SU;72|
        ((|x| S)
         ($ |Union| (|Record| (|:| |val| S) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPROG
         ((|r|
           (|Record| (|:| |var| (|Kernel| S))
                     (|:| |exponent| (|NonNegativeInteger|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| S))
                      (|:| |exponent| (|NonNegativeInteger|)))
            "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 251)))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |r| (QCDR |u|))
                       (EXIT
                        (CONS 0
                              (CONS (SPADCALL (QCAR |r|) (QREFELT $ 26))
                                    (QCDR |r|))))))))))) 

(SDEFUN |FS-;convert;SP;73| ((|x| S) ($ |Pattern| (|Integer|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 257))) 

(SDEFUN |FS-;convert;SP;74| ((|x| S) ($ |Pattern| (|Float|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 260))) 

(SDEFUN |FS-;isMult;SU;75|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S)))
          "failed"))
        (|FS-;smpIsMult| (SPADCALL |x| (QREFELT $ 90)) $)) 

(SDEFUN |FS-;*;R2S;76| ((|r| R) (|x| S) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |r| (QREFELT $ 265)) (QREFELT $ 87)) |x|
                  (QREFELT $ 134))) 

(SDEFUN |FS-;mainKernel;SU;77| ((|x| S) ($ |Union| (|Kernel| S) "failed"))
        (SPADCALL |x| (QREFELT $ 268))) 

(SDEFUN |FS-;kernels;SL;78| ((|x| S) ($ |List| (|Kernel| S)))
        (SPADCALL |x| (QREFELT $ 269))) 

(SDEFUN |FS-;univariate;SKF;79|
        ((|x| S) (|k| |Kernel| S)
         ($ |Fraction| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |x| |k| (QREFELT $ 271))) 

(SDEFUN |FS-;isPlus;SU;80| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPADCALL |x| (QREFELT $ 275))) 

(SDEFUN |FS-;isTimes;SU;81| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPADCALL |x| (QREFELT $ 276))) 

(SDEFUN |FS-;isExpt;SU;82|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |var| (|Kernel| S)) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPADCALL |x| (QREFELT $ 279))) 

(SDEFUN |FS-;isPower;SU;83|
        ((|x| S)
         ($ |Union| (|Record| (|:| |val| S) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPADCALL |x| (QREFELT $ 282))) 

(SDEFUN |FS-;denominator;2S;84| ((|x| S) ($ S))
        (SPADCALL (SPADCALL |x| (QREFELT $ 283)) (QREFELT $ 87))) 

(SDEFUN |FS-;coerce;FS;85| ((|q| |Fraction| R) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 286)) (QREFELT $ 265))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 287)) (QREFELT $ 265))
                  (QREFELT $ 288))) 

(SDEFUN |FS-;coerce;FS;86| ((|q| |Fraction| (|Polynomial| R)) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 291)) (QREFELT $ 292))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 293)) (QREFELT $ 292))
                  (QREFELT $ 294))) 

(SDEFUN |FS-;coerce;FS;87|
        ((|q| |Fraction| (|Polynomial| (|Fraction| R))) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 298)) (QREFELT $ 299))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 300)) (QREFELT $ 299))
                  (QREFELT $ 294))) 

(SDEFUN |FS-;retract;SP;88| ((|x| S) ($ |Polynomial| R))
        (SPADCALL (SPADCALL |x| (QREFELT $ 302)) (QREFELT $ 303))) 

(SDEFUN |FS-;retract;SF;89| ((|x| S) ($ |Fraction| (|Polynomial| R)))
        (SPROG ((#1=#:G699 NIL))
               (SPADCALL
                (PROG2
                    (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 90)) $))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                  (|Union| (|Polynomial| (QREFELT $ 7))
                                           #2="failed")
                                  #1#))
                (PROG2
                    (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 283)) $))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                  (|Union| (|Polynomial| (QREFELT $ 7)) #2#)
                                  #1#))
                (QREFELT $ 304)))) 

(SDEFUN |FS-;retract;SR;90| ((|x| S) ($ R))
        (SPROG ((#1=#:G703 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| (QREFELT $ 90))
                                    (QREFELT $ 233))
                          (SPADCALL (SPADCALL |x| (QREFELT $ 283))
                                    (QREFELT $ 233))
                          (QREFELT $ 307)))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                 (|Union| (QREFELT $ 7) "failed") #1#)))) 

(SDEFUN |FS-;alg_ker_set| ((|lx| |List| S) ($ |List| (|Kernel| S)))
        (SPROG
         ((|ak1| (|List| #1=(|Kernel| S))) (#2=#:G730 NIL) (|k1| NIL)
          (|arg| (|List| S)) (|resl| (|List| (|Kernel| S)))
          (|needed| (|Boolean|)) (#3=#:G729 NIL) (#4=#:G728 NIL)
          (#5=#:G727 NIL) (|k| NIL) (|ak| (|List| #1#)) (#6=#:G726 NIL)
          (#7=#:G725 NIL) (|x| NIL))
         (SEQ (LETT |resl| NIL) (LETT |ak1| NIL)
              (SEQ (LETT |x| NIL) (LETT #7# |lx|) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |x| (CAR #7#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |k| NIL)
                          (LETT #6# (SPADCALL |x| (QREFELT $ 308))) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |k| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (COND
                            ((NULL (SPADCALL |k| '|nthRoot| (QREFELT $ 219)))
                             (COND
                              ((NULL (SPADCALL |k| '|rootOf| (QREFELT $ 219)))
                               (EXIT "iterate")))))
                           (EXIT (LETT |ak1| (CONS |k| |ak1|))))
                          (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
              (SEQ G190 (COND ((NULL (NULL (NULL |ak1|))) (GO G191)))
                   (SEQ (LETT |ak| |ak1|) (LETT |ak1| NIL)
                        (EXIT
                         (SEQ (LETT |k| NIL) (LETT #5# |ak|) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |k| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |needed| 'T)
                                   (SEQ (LETT |k1| NIL) (LETT #4# |resl|) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN (LETT |k1| (CAR #4#)) NIL)
                                              (NULL |needed|))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((EQ |k1| |k|)
                                            (LETT |needed| NIL)))))
                                        (LETT #4# (CDR #4#)) (GO G190) G191
                                        (EXIT NIL))
                                   (SEQ (LETT |k1| NIL) (LETT #3# |resl|) G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN (LETT |k1| (CAR #3#)) NIL)
                                              (NULL |needed|))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |k1| |k| (QREFELT $ 309))
                                            (LETT |needed| NIL)))))
                                        (LETT #3# (CDR #3#)) (GO G190) G191
                                        (EXIT NIL))
                                   (EXIT
                                    (COND
                                     (|needed|
                                      (SEQ (LETT |resl| (CONS |k| |resl|))
                                           (LETT |ak1| (CONS |k| |ak1|))
                                           (LETT |arg|
                                                 (SPADCALL |k| (QREFELT $ 46)))
                                           (EXIT
                                            (SEQ (LETT |k1| NIL)
                                                 (LETT #2#
                                                       (SPADCALL
                                                        (SPADCALL |arg| 1
                                                                  (QREFELT $
                                                                           155))
                                                        (QREFELT $ 308)))
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #2#)
                                                       (PROGN
                                                        (LETT |k1| (CAR #2#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (COND
                                                    ((OR
                                                      (SPADCALL |k1| '|nthRoot|
                                                                (QREFELT $
                                                                         219))
                                                      (SPADCALL |k1| '|rootOf|
                                                                (QREFELT $
                                                                         219)))
                                                     (LETT |ak1|
                                                           (CONS |k1|
                                                                 |ak1|))))))
                                                 (LETT #2# (CDR #2#)) (GO G190)
                                                 G191 (EXIT NIL)))))
                                     ('T "iterate"))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |resl|)))) 

(SDEFUN |FS-;algtower;LL;92| ((|lx| |List| S) ($ |List| (|Kernel| S)))
        (NREVERSE (SPADCALL (|FS-;alg_ker_set| |lx| $) (QREFELT $ 310)))) 

(SDEFUN |FS-;algtower;SL;93| ((|x| S) ($ |List| (|Kernel| S)))
        (SPADCALL (LIST |x|) (QREFELT $ 312))) 

(SDEFUN |FS-;coerce;SOf;94| ((|x| S) ($ |OutputForm|))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 283)) (|spadConstant| $ 314)
                    (QREFELT $ 315))
          (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 90)) $))
         ('T
          (SPADCALL (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 90)) $)
                    (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 283)) $)
                    (QREFELT $ 316))))) 

(SDEFUN |FS-;retractIfCan;SU;95| ((|x| S) ($ |Union| R "failed"))
        (SPROG
         ((#1=#:G743 NIL) (|r| (|Union| R "failed"))
          (|d| #2=(|Union| R "failed")) (|n| #2#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |n|
                   (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 194)))
             (EXIT
              (COND
               ((QEQCAR |n| 1)
                (PROGN (LETT #1# (CONS 1 #3="failed")) (GO #4=#:G741)))
               (#5='T
                (SEQ
                 (LETT |d|
                       (SPADCALL (SPADCALL |x| (QREFELT $ 283))
                                 (QREFELT $ 194)))
                 (EXIT
                  (COND
                   ((QEQCAR |d| 1) (PROGN (LETT #1# (CONS 1 #3#)) (GO #4#)))
                   (#5#
                    (SEQ
                     (LETT |r|
                           (SPADCALL (QCDR |n|) (QCDR |d|) (QREFELT $ 307)))
                     (EXIT
                      (COND
                       ((QEQCAR |r| 1)
                        (PROGN (LETT #1# (CONS 1 #3#)) (GO #4#))))))))))))))
            (EXIT (CONS 0 (QCDR |r|)))))
          #4# (EXIT #1#)))) 

(SDEFUN |FS-;eval;SLLLS;96|
        ((|x| S) (|s| |List| (|Symbol|)) (|n| |List| (|NonNegativeInteger|))
         (|f| |List| (|Mapping| S (|List| S))) ($ S))
        (SPADCALL (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 90)) $)
                  (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 283)) $)
                  (QREFELT $ 294))) 

(SDEFUN |FS-;differentiate;SSS;97| ((|f| S) (|x| |Symbol|) ($ S))
        (SPADCALL
         (SPADCALL
          (SPADCALL (|FS-;smpderiv| (SPADCALL |f| (QREFELT $ 90)) |x| $)
                    (SPADCALL (SPADCALL |f| (QREFELT $ 283)) (QREFELT $ 87))
                    (QREFELT $ 134))
          (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 90)) (QREFELT $ 87))
                    (|FS-;smpderiv| (SPADCALL |f| (QREFELT $ 283)) |x| $)
                    (QREFELT $ 134))
          (QREFELT $ 317))
         (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 283)) (QREFELT $ 87)) 2
                   (QREFELT $ 318))
         (QREFELT $ 294))) 

(SDEFUN |FS-;eval;SLLS;98|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPADCALL (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 90)) |lk| |lv| $)
                  (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 283)) |lk| |lv| $)
                  (QREFELT $ 294))) 

(SDEFUN |FS-;subst;SLLS;99|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPADCALL (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 90)) |lk| |lv| $)
                  (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 283)) |lk| |lv| $)
                  (QREFELT $ 294))) 

(SDEFUN |FS-;par| ((|x| S) ($ S))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 18)))
                    (EXIT
                     (COND ((QEQCAR |r| 0) |x|)
                           ('T (SPADCALL |x| (QREFELT $ 319)))))))) 

(SDEFUN |FS-;convert;FS;101| ((|x| |Factored| S) ($ S))
        (SPROG
         ((#1=#:G764 NIL) (#2=#:G763 (S)) (#3=#:G765 (S)) (#4=#:G767 NIL)
          (|f| NIL))
         (SEQ
          (SPADCALL (|FS-;par| (SPADCALL |x| (QREFELT $ 321)) $)
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |f| NIL)
                          (LETT #4# (SPADCALL |x| (QREFELT $ 325))) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3#
                                   (SPADCALL (|FS-;par| (QVELT |f| 1) $)
                                             (QVELT |f| 2) (QREFELT $ 318)))
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #3# (QREFELT $ 134))))
                              ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                          (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 144))))
                    (QREFELT $ 134))))) 

(SDEFUN |FS-;retractIfCan;SU;102|
        ((|x| S) ($ |Union| (|Polynomial| R) "failed"))
        (SPROG ((|u| (|Union| (|Fraction| (|Polynomial| R)) "failed")))
               (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 329)))
                    (EXIT
                     (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                           ('T (SPADCALL (QCDR |u|) (QREFELT $ 330)))))))) 

(SDEFUN |FS-;retractIfCan;SU;103|
        ((|x| S) ($ |Union| (|Fraction| (|Polynomial| R)) "failed"))
        (SPROG ((|d| #1=(|Union| (|Polynomial| R) "failed")) (|n| #1#))
               (SEQ (LETT |n| (|FS-;smpret| (SPADCALL |x| (QREFELT $ 90)) $))
                    (EXIT
                     (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                           (#2='T
                            (SEQ
                             (LETT |d|
                                   (|FS-;smpret| (SPADCALL |x| (QREFELT $ 283))
                                    $))
                             (EXIT
                              (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                    (#2#
                                     (CONS 0
                                           (SPADCALL (QCDR |n|) (QCDR |d|)
                                                     (QREFELT $ 304))))))))))))) 

(SDEFUN |FS-;coerce;PS;104| ((|p| |Polynomial| (|Fraction| R)) ($ S))
        (SPADCALL (ELT $ 38) (ELT $ 332) |p| (QREFELT $ 335))) 

(SDEFUN |FS-;coerce;FS;105| ((|x| |Fraction| (|Integer|)) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 338)) (QREFELT $ 339))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 340)) (QREFELT $ 339))
                  (QREFELT $ 288))) 

(SDEFUN |FS-;isMult;SU;106|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S)))
          "failed"))
        (SPROG
         ((|q| (|Union| (|Integer|) "failed"))
          (|r| (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S))))
          (#1=#:G802 NIL) (|w| (|Union| (|Integer|) "failed"))
          (|v| (|Union| R "failed"))
          (|u|
           (|Union|
            (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S)))
            "failed")))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |u| (|FS-;smpIsMult| (SPADCALL |x| (QREFELT $ 90)) $))
                 (EXIT
                  (COND
                   ((QEQCAR |u| 1)
                    (PROGN (LETT #1# (CONS 1 #2="failed")) (GO #3=#:G800)))
                   (#4='T
                    (SEQ
                     (LETT |v|
                           (SPADCALL (SPADCALL |x| (QREFELT $ 283))
                                     (QREFELT $ 194)))
                     (EXIT
                      (COND
                       ((QEQCAR |v| 1)
                        (PROGN (LETT #1# (CONS 1 #2#)) (GO #3#)))
                       (#4#
                        (SEQ (LETT |w| (SPADCALL (QCDR |v|) (QREFELT $ 226)))
                             (EXIT
                              (COND
                               ((QEQCAR |w| 1)
                                (PROGN
                                 (LETT #1# (CONS 1 #2#))
                                 (GO #3#))))))))))))))
            (LETT |r| (QCDR |u|))
            (LETT |q| (SPADCALL (QCAR |r|) (QCDR |w|) (QREFELT $ 342)))
            (EXIT
             (COND ((QEQCAR |q| 1) (CONS 1 "failed"))
                   (#4# (CONS 0 (CONS (QCDR |q|) (QCDR |r|))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |FS-;convert;SP;107| ((|x| S) ($ |Pattern| (|Integer|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 257))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 283)) (QREFELT $ 257))
                  (QREFELT $ 343))) 

(SDEFUN |FS-;convert;SP;108| ((|x| S) ($ |Pattern| (|Float|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 260))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 283)) (QREFELT $ 260))
                  (QREFELT $ 344))) 

(DECLAIM (NOTINLINE |FunctionSpace&;|)) 

(DEFUN |FunctionSpace&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|FunctionSpace&| DV$1 DV$2))
          (LETT $ (GETREFV 348))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| |#2| '(|Ring|))
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#2|
                                                             '(|AbelianSemiGroup|))
                                              (|HasCategory| |#2| '(|Group|))
                                              (|HasCategory| |#2|
                                                             '(|SemiGroup|))
                                              (|HasCategory| |#2|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))))))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|odd|)
          (QSETREFV $ 9 '|even|)
          (QSETREFV $ 10 '|%specialDiff|)
          (QSETREFV $ 15 (SPADCALL '|%diff| (QREFELT $ 14)))
          (QSETREFV $ 16 (SPADCALL '|%quote| (QREFELT $ 14)))
          (COND
           ((|testBitVector| |pv$| 11)
            (PROGN
             (QSETREFV $ 61 (CONS (|dispatchFunction| |FS-;eval;SBoSSS;16|) $))
             (QSETREFV $ 68 (CONS (|dispatchFunction| |FS-;eval;SLLSS;17|) $))
             (SPADCALL (QREFELT $ 15) '|%specialInput|
                       (CONS (|function| |FS-;indiff|) $) (QREFELT $ 70)))))
          (COND
           ((|testBitVector| |pv$| 6)
            (PROGN
             (QSETREFV $ 80 '%%0)
             (QSETREFV $ 83
                       (CONS (|dispatchFunction| |FS-;characteristic;Nni;21|)
                             $))
             (QSETREFV $ 88 (CONS (|dispatchFunction| |FS-;coerce;KS;22|) $))
             (QSETREFV $ 91
                       (CONS (|dispatchFunction| |FS-;numerator;2S;24|) $))
             (QSETREFV $ 97
                       (CONS (|dispatchFunction| |FS-;eval;SSNniMS;25|) $))
             (QSETREFV $ 98
                       (CONS (|dispatchFunction| |FS-;eval;SSNniMS;26|) $))
             (QSETREFV $ 100 (CONS (|dispatchFunction| |FS-;eval;SLLS;27|) $))
             (QSETREFV $ 109 (CONS (|dispatchFunction| |FS-;elt;BoLS;28|) $))
             (QSETREFV $ 110 (CONS (|dispatchFunction| |FS-;eval;SLLLS;29|) $))
             NIL
             (QSETREFV $ 189 (CONS (|dispatchFunction| |FS-;coerce;PS;44|) $))
             (QSETREFV $ 218
                       (CONS (|dispatchFunction| |FS-;isExpt;SBoU;52|) $))
             (QSETREFV $ 220 (CONS (|dispatchFunction| |FS-;isExpt;SSU;53|) $))
             (COND ((|testBitVector| |pv$| 1)))
             (SPADCALL (QREFELT $ 15) (CONS (|function| |FS-;diffEval|) $)
                       (QREFELT $ 227))
             (SPADCALL (QREFELT $ 15) '|%specialEqual|
                       (CONS (|function| |FS-;equaldiff|) $) (QREFELT $ 70))
             (SPADCALL (QREFELT $ 15) (QREFELT $ 10)
                       (CONS (|function| |FS-;diffdiff|) $) (QREFELT $ 70))
             (SPADCALL (QREFELT $ 15) '|%specialDisp|
                       (CONS (|function| |FS-;ddiff|) $) (QREFELT $ 70))
             (COND ((|testBitVector| |pv$| 2))
                   ('T
                    (PROGN
                     (QSETREFV $ 231
                               (CONS
                                (|dispatchFunction| |FS-;mainKernel;SU;58|) $))
                     (QSETREFV $ 232
                               (CONS (|dispatchFunction| |FS-;kernels;SL;59|)
                                     $))
                     (QSETREFV $ 234
                               (CONS (|dispatchFunction| |FS-;retract;SR;60|)
                                     $))
                     (QSETREFV $ 235
                               (CONS (|dispatchFunction| |FS-;retract;SP;61|)
                                     $))
                     (QSETREFV $ 236
                               (CONS
                                (|dispatchFunction| |FS-;retractIfCan;SU;62|)
                                $))
                     (QSETREFV $ 238
                               (CONS
                                (|dispatchFunction| |FS-;retractIfCan;SU;63|)
                                $))
                     (QSETREFV $ 239
                               (CONS (|dispatchFunction| |FS-;eval;SLLS;64|)
                                     $))
                     (QSETREFV $ 240
                               (CONS (|dispatchFunction| |FS-;subst;SLLS;65|)
                                     $))
                     (QSETREFV $ 241
                               (CONS
                                (|dispatchFunction| |FS-;differentiate;SSS;66|)
                                $))
                     (QSETREFV $ 242
                               (CONS (|dispatchFunction| |FS-;coerce;SOf;67|)
                                     $))
                     (QSETREFV $ 243
                               (CONS (|dispatchFunction| |FS-;eval;SLLLS;68|)
                                     $))
                     (QSETREFV $ 246
                               (CONS (|dispatchFunction| |FS-;isPlus;SU;69|)
                                     $))
                     (QSETREFV $ 248
                               (CONS (|dispatchFunction| |FS-;isTimes;SU;70|)
                                     $))
                     (QSETREFV $ 252
                               (CONS (|dispatchFunction| |FS-;isExpt;SU;71|)
                                     $))
                     (QSETREFV $ 255
                               (CONS (|dispatchFunction| |FS-;isPower;SU;72|)
                                     $))
                     (COND
                      ((|HasCategory| |#2|
                                      '(|ConvertibleTo|
                                        (|Pattern| (|Integer|))))
                       (QSETREFV $ 258
                                 (CONS (|dispatchFunction| |FS-;convert;SP;73|)
                                       $))))
                     (COND
                      ((|HasCategory| |#2|
                                      '(|ConvertibleTo| (|Pattern| (|Float|))))
                       (QSETREFV $ 261
                                 (CONS (|dispatchFunction| |FS-;convert;SP;74|)
                                       $))))
                     (COND
                      ((|testBitVector| |pv$| 1)
                       (QSETREFV $ 264
                                 (CONS (|dispatchFunction| |FS-;isMult;SU;75|)
                                       $))))))))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 266 (CONS (|dispatchFunction| |FS-;*;R2S;76|) $))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 231
                       (CONS (|dispatchFunction| |FS-;mainKernel;SU;77|) $))
             (QSETREFV $ 232 (CONS (|dispatchFunction| |FS-;kernels;SL;78|) $))
             (QSETREFV $ 273
                       (CONS (|dispatchFunction| |FS-;univariate;SKF;79|) $))
             (QSETREFV $ 246 (CONS (|dispatchFunction| |FS-;isPlus;SU;80|) $))
             (QSETREFV $ 248 (CONS (|dispatchFunction| |FS-;isTimes;SU;81|) $))
             (QSETREFV $ 252 (CONS (|dispatchFunction| |FS-;isExpt;SU;82|) $))
             (QSETREFV $ 255 (CONS (|dispatchFunction| |FS-;isPower;SU;83|) $))
             (QSETREFV $ 284
                       (CONS (|dispatchFunction| |FS-;denominator;2S;84|) $))
             (QSETREFV $ 289 (CONS (|dispatchFunction| |FS-;coerce;FS;85|) $))
             (QSETREFV $ 295 (CONS (|dispatchFunction| |FS-;coerce;FS;86|) $))
             (QSETREFV $ 301 (CONS (|dispatchFunction| |FS-;coerce;FS;87|) $))
             (QSETREFV $ 235 (CONS (|dispatchFunction| |FS-;retract;SP;88|) $))
             (QSETREFV $ 305 (CONS (|dispatchFunction| |FS-;retract;SF;89|) $))
             (QSETREFV $ 234 (CONS (|dispatchFunction| |FS-;retract;SR;90|) $))
             (QSETREFV $ 311
                       (CONS (|dispatchFunction| |FS-;algtower;LL;92|) $))
             (QSETREFV $ 313
                       (CONS (|dispatchFunction| |FS-;algtower;SL;93|) $))
             (QSETREFV $ 242 (CONS (|dispatchFunction| |FS-;coerce;SOf;94|) $))
             (QSETREFV $ 236
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;95|) $))
             (COND
              ((|testBitVector| |pv$| 11)
               (QSETREFV $ 243
                         (CONS (|dispatchFunction| |FS-;eval;SLLLS;96|) $))))
             (QSETREFV $ 241
                       (CONS (|dispatchFunction| |FS-;differentiate;SSS;97|)
                             $))
             (QSETREFV $ 239 (CONS (|dispatchFunction| |FS-;eval;SLLS;98|) $))
             (QSETREFV $ 240 (CONS (|dispatchFunction| |FS-;subst;SLLS;99|) $))
             (QSETREFV $ 327
                       (CONS (|dispatchFunction| |FS-;convert;FS;101|) $))
             (QSETREFV $ 238
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;102|) $))
             (QSETREFV $ 331
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;103|) $))
             (QSETREFV $ 336 (CONS (|dispatchFunction| |FS-;coerce;PS;104|) $))
             (COND
              ((|testBitVector| |pv$| 1)
               (PROGN
                (QSETREFV $ 341
                          (CONS (|dispatchFunction| |FS-;coerce;FS;105|) $))
                (QSETREFV $ 264
                          (CONS (|dispatchFunction| |FS-;isMult;SU;106|) $)))))
             (COND
              ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Integer|))))
               (QSETREFV $ 258
                         (CONS (|dispatchFunction| |FS-;convert;SP;107|) $))))
             (COND
              ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Float|))))
               (QSETREFV $ 261
                         (CONS (|dispatchFunction| |FS-;convert;SP;108|)
                               $)))))))
          $))) 

(MAKEPROP '|FunctionSpace&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ODD 'EVEN
              'SPECIALDIFF (|BasicOperator|) (|Symbol|) (|CommonOperators|)
              (0 . |operator|) '|opdiff| '|opquote| (|Union| 7 '#1="failed")
              (5 . |retractIfCan|) (|Boolean|) |FS-;ground?;SB;1|
              (10 . |retract|) |FS-;ground;SR;2| (|Kernel| 6) (15 . |kernel|)
              (|Kernel| $) (20 . |coerce|) |FS-;coerce;SS;3| (25 . |retract|)
              (|Union| 12 '"failed") (30 . |symbolIfCan|) |FS-;retract;SS;4|
              (|List| $) (35 . |applyQuote|) |FS-;applyQuote;S2S;5|
              |FS-;applyQuote;S3S;6| |FS-;applyQuote;S4S;7|
              |FS-;applyQuote;S5S;8| (41 . |coerce|) (46 . |elt|)
              |FS-;applyQuote;SLS;9| (52 . |has?|) (58 . |is?|)
              |FS-;belong?;BoB;10| (64 . |operator|) (|List| 6)
              (69 . |argument|) (74 . |kernel|) (80 . |name|) (|String|)
              (85 . |string|) |FS-;operator;2Bo;12| (90 . |second|)
              (95 . |third|) (100 . |eval|) (|InputForm|) (107 . |convert|)
              (112 . |convert|) (117 . |convert|) (|List| 11) (122 . |eval|)
              (130 . |eval|) (|Mapping| 6 6)
              (|MakeUnaryCompiledFunction| 6 6 6) (138 . |compiledFunction|)
              (|Mapping| $ $) (|List| 65) (144 . |eval|) (151 . |eval|)
              (|None|) (159 . |setProperty|) (|List| 25) (166 . |tower|)
              (|List| 12) |FS-;variables;LL;18| (171 . |variables|)
              |FS-;variables;SL;19| (|Union| 25 '#1#) (176 . |retractIfCan|)
              |FS-;retractIfCan;SU;20| '|gendiff| (|NonNegativeInteger|)
              (181 . |characteristic|) (185 . |characteristic|)
              (|SparseMultivariatePolynomial| 7 23) (189 . |coerce|)
              (|SparseMultivariatePolynomial| 7 25) (194 . |coerce|)
              (199 . |coerce|) (204 . |new|) (208 . |numer|)
              (213 . |numerator|) (218 . |first|) (|List| 81) (|Mapping| $ 32)
              (|List| 94) (223 . |eval|) (231 . |eval|) (239 . |eval|)
              (247 . |new|) (253 . |eval|) (260 . |unary?|)
              (265 . |leadingCoefficient|) (270 . |Zero|) (274 . |smaller?|)
              (280 . -) (285 . |elt|) (|ExpressionSpace&| 6) (291 . |elt|)
              (297 . |elt|) (303 . |eval|) (|Union| 23 '"failed")
              (311 . |mainVariable|) (|SparseUnivariatePolynomial| $)
              (316 . |univariate|) (|SparseUnivariatePolynomial| 6)
              (|Mapping| 6 84) (|SparseUnivariatePolynomial| 84)
              (|SparseUnivariatePolynomialFunctions2| 84 6) (322 . |map|)
              (|Integer|) (328 . |position|) (334 . |minIndex|) (339 . |elt|)
              (345 . |Zero|) (|Mapping| 6 45) (|List| 125) (349 . |elt|)
              (355 . |elt|) (361 . |Zero|) (365 . ~=) (371 . |degree|)
              (376 . ^) (382 . |leadingCoefficient|) (387 . *) (393 . +)
              (399 . |reductum|) (|OutputForm|) (404 . |coerce|) (409 . |is?|)
              (|List| 137) (415 . |position|) (421 . |setelt!|)
              (428 . |coerce|) (433 . |One|) (437 . |minIndex|)
              (442 . |coerce|) (447 . |hconcat|) (453 . |position|)
              (459 . |sub|) (465 . |differentiate|) (|Union| 69 '"failed")
              (471 . |property|) (477 . |prefix|) (483 . |copy|) (488 . |elt|)
              (494 . |setelt!|) (|List| 120) (501 . |member?|) (507 . |first|)
              (513 . |rest|) (519 . |concat|) (525 . |maxIndex|)
              (530 . |differentiate|) (536 . =) (|Union| 126 '"failed")
              (|BasicOperatorFunctions1| 6) (542 . |derivative|) (|Equation| 6)
              (547 . =) (|Equation| $) (553 . |subst|) (559 . |kernel|)
              (565 . ~=) (571 . ~=) (|Polynomial| 7) (577 . |coerce|)
              (582 . |differentiate|) (588 . |retract|) (|Mapping| 7 7)
              (593 . |map|) (|List| 23) (599 . |variables|)
              (604 . |differentiate|) (610 . |coerce|) (|Mapping| 6 12)
              (|Mapping| 6 7)
              (|PolynomialCategoryLifting| (|IndexedExponents| 12) 12 7 175 6)
              (615 . |map|) (622 . |coerce|) (|Union| 19 '"failed")
              (|UserDefinedPartialOrdering| 12) (627 . |less?|) (633 . <)
              (639 . |retractIfCan|) (644 . |coerce|) (649 . |userOrdered?|)
              (653 . |coerce|) (658 . |outputForm|) (664 . |subst|)
              (|Mapping| 6 23) (|ListToMap| 23 6) (671 . |match|)
              (|PolynomialCategoryLifting| (|IndexedExponents| 23) 23 7 84 6)
              (679 . |map|) (686 . |eval|) (693 . |map|) (699 . |tower|)
              (704 . |setIntersection|) (710 . |empty?|) (715 . |coerce|)
              (|Mapping| 175 23) (|Mapping| 175 7)
              (|PolynomialCategoryLifting| (|IndexedExponents| 23) 23 7 84 175)
              (720 . |map|) (|Record| (|:| |var| 25) (|:| |exponent| 120))
              (|Union| 215 '#2="failed") (727 . |isExpt|) (732 . |isExpt|)
              (738 . |is?|) (744 . |isExpt|) (750 . |degree|)
              (755 . |reductum|) (760 . |leadingCoefficient|) (765 . |zero?|)
              (|Union| 120 '#1#) (770 . |retractIfCan|) (775 . |evaluate|)
              (781 . =) (787 . =) (793 . =) (799 . |mainKernel|)
              (804 . |kernels|) (809 . |retract|) (814 . |retract|)
              (819 . |retract|) (824 . |retractIfCan|) (|Union| 175 '"failed")
              (829 . |retractIfCan|) (834 . |eval|) (841 . |subst|)
              (848 . |differentiate|) (854 . |coerce|) (859 . |eval|)
              (|Union| 32 '#3="failed") (867 . |isPlus|) (872 . |isPlus|)
              (877 . |isTimes|) (882 . |isTimes|)
              (|Record| (|:| |var| 23) (|:| |exponent| 81)) (|Union| 249 '#3#)
              (887 . |isExpt|) (892 . |isExpt|)
              (|Record| (|:| |val| $) (|:| |exponent| 120))
              (|Union| 253 '#4="failed") (897 . |isPower|) (|Pattern| 120)
              (902 . |convert|) (907 . |convert|) (|Pattern| (|Float|))
              (912 . |convert|) (917 . |convert|)
              (|Record| (|:| |coef| 120) (|:| |var| 25))
              (|Union| 262 '#5="failed") (922 . |isMult|) (927 . |coerce|)
              (932 . *)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 23) 23
                                                     7 84 6)
              (938 . |mainVariable|) (943 . |variables|) (|Fraction| 115)
              (948 . |univariate|) (|Fraction| 113) (954 . |univariate|)
              (|Union| 45 '"failed") (960 . |isPlus|) (965 . |isTimes|)
              (|Record| (|:| |var| 23) (|:| |exponent| 120))
              (|Union| 277 '"failed") (970 . |isExpt|)
              (|Record| (|:| |val| 6) (|:| |exponent| 120))
              (|Union| 280 '"failed") (975 . |isPower|) (980 . |denom|)
              (985 . |denominator|) (|Fraction| 7) (990 . |numer|)
              (995 . |denom|) (1000 . /) (1006 . |coerce|) (|Fraction| 175)
              (1011 . |numer|) (1016 . |coerce|) (1021 . |denom|) (1026 . /)
              (1032 . |coerce|) (|Polynomial| 285) (|Fraction| 296)
              (1037 . |numer|) (1042 . |coerce|) (1047 . |denom|)
              (1052 . |coerce|) (1057 . |retract|) (1062 . |retract|)
              (1067 . /) (1073 . |retract|) (|Union| $ '"failed")
              (1078 . |exquo|) (1084 . |kernels|) (1089 . =) (1095 . |sort!|)
              (1100 . |algtower|) (1105 . |algtower|) (1110 . |algtower|)
              (1115 . |One|) (1119 . =) (1125 . /) (1131 . -) (1137 . ^)
              (1143 . |paren|) (|Factored| 6) (1148 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 322) (|:| |factor| 6) (|:| |exponent| 81))
              (|List| 323) (1153 . |factorList|) (|Factored| $)
              (1158 . |convert|) (|Union| 290 '#1#) (1163 . |retractIfCan|)
              (1168 . |retractIfCan|) (1173 . |retractIfCan|) (1178 . |coerce|)
              (|Mapping| 6 285)
              (|PolynomialCategoryLifting| (|IndexedExponents| 12) 12 285 296
                                           6)
              (1183 . |map|) (1190 . |coerce|) (|Fraction| 120)
              (1195 . |numer|) (1200 . |coerce|) (1205 . |denom|)
              (1210 . |coerce|) (1215 . |exquo|) (1221 . /) (1227 . /)
              (|PositiveInteger|) (|Union| 337 '#1#) (|List| 170))
           '#(|variables| 1233 |univariate| 1243 |subst| 1249 |retractIfCan|
              1256 |retract| 1276 |operator| 1296 |numerator| 1301 |mainKernel|
              1306 |kernels| 1311 |isTimes| 1316 |isPower| 1321 |isPlus| 1326
              |isMult| 1331 |isExpt| 1336 |ground?| 1353 |ground| 1358 |eval|
              1363 |elt| 1425 |differentiate| 1431 |denominator| 1437 |convert|
              1442 |coerce| 1457 |characteristic| 1502 |belong?| 1506
              |applyQuote| 1511 |algtower| 1547 * 1557)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|convert| ((|InputForm|) |#1|)) T)
                                   '((* (|#1| |#1| |#1|)) T)
                                   '((* (|#1| (|PositiveInteger|) |#1|)) T)
                                   '((* (|#1| (|NonNegativeInteger|) |#1|)) T)
                                   '((* (|#1| (|Integer|) |#1|)) T)
                                   '((|coerce| (|#1| (|Integer|))) T)
                                   '((|retract| ((|Polynomial| |#2|) |#1|)) T)
                                   '((|retractIfCan|
                                      ((|Union| (|Polynomial| |#2|) #1#) |#1|))
                                     T)
                                   '((|coerce| (|#1| (|Polynomial| |#2|))) T)
                                   '((|differentiate| (|#1| |#1| (|Symbol|)))
                                     T)
                                   '((|differentiate|
                                      (|#1| |#1| (|List| (|Symbol|))))
                                     T)
                                   '((|differentiate|
                                      (|#1| |#1| (|Symbol|)
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|differentiate|
                                      (|#1| |#1| (|List| (|Symbol|))
                                       (|List| (|NonNegativeInteger|))))
                                     T)
                                   '((|characteristic|
                                      ((|NonNegativeInteger|)))
                                     T)
                                   '((* (|#1| |#1| |#2|)) T)
                                   '((* (|#1| |#2| |#1|)) T)
                                   '((|coerce| (|#1| |#1|)) T)
                                   '((* (|#1| |#1| (|Fraction| (|Integer|))))
                                     T)
                                   '((* (|#1| (|Fraction| (|Integer|)) |#1|))
                                     T)
                                   '((|coerce| (|#1| (|Fraction| (|Integer|))))
                                     T)
                                   '((|retract|
                                      ((|Fraction| (|Polynomial| |#2|)) |#1|))
                                     T)
                                   '((|retractIfCan|
                                      ((|Union|
                                        (|Fraction| (|Polynomial| |#2|)) #1#)
                                       |#1|))
                                     T)
                                   '((|coerce|
                                      (|#1| (|Fraction| (|Polynomial| |#2|))))
                                     T)
                                   '((|retract|
                                      ((|Fraction| (|Integer|)) |#1|))
                                     T)
                                   '((|retractIfCan|
                                      ((|Union| (|Fraction| (|Integer|)) #1#)
                                       |#1|))
                                     T)
                                   '((|univariate|
                                      ((|Fraction|
                                        (|SparseUnivariatePolynomial| |#1|))
                                       |#1| (|Kernel| |#1|)))
                                     T)
                                   '((|coerce|
                                      (|#1|
                                       (|Fraction|
                                        (|Polynomial| (|Fraction| |#2|)))))
                                     T)
                                   '((|coerce|
                                      (|#1| (|Polynomial| (|Fraction| |#2|))))
                                     T)
                                   '((|coerce| (|#1| (|Fraction| |#2|))) T)
                                   '((|denominator| (|#1| |#1|)) T)
                                   '((|convert| (|#1| (|Factored| |#1|))) T)
                                   '((|algtower|
                                      ((|List| (|Kernel| |#1|)) (|List| |#1|)))
                                     T)
                                   '((|algtower|
                                      ((|List| (|Kernel| |#1|)) |#1|))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|Symbol|)
                                       (|NonNegativeInteger|)
                                       (|Mapping| |#1| |#1|)))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|Symbol|)
                                       (|NonNegativeInteger|)
                                       (|Mapping| |#1| (|List| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Symbol|))
                                       (|List| (|NonNegativeInteger|))
                                       (|List|
                                        (|Mapping| |#1| (|List| |#1|)))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Symbol|))
                                       (|List| (|NonNegativeInteger|))
                                       (|List| (|Mapping| |#1| |#1|))))
                                     T)
                                   '((|isPower|
                                      ((|Union|
                                        (|Record| (|:| |val| |#1|)
                                                  (|:| |exponent| (|Integer|)))
                                        #4#)
                                       |#1|))
                                     T)
                                   '((|isExpt|
                                      ((|Union|
                                        (|Record| (|:| |var| (|Kernel| |#1|))
                                                  (|:| |exponent| (|Integer|)))
                                        "failed")
                                       |#1| (|Symbol|)))
                                     T)
                                   '((|isExpt|
                                      ((|Union|
                                        (|Record| (|:| |var| (|Kernel| |#1|))
                                                  (|:| |exponent| (|Integer|)))
                                        "failed")
                                       |#1| (|BasicOperator|)))
                                     T)
                                   '((|numerator| (|#1| |#1|)) T)
                                   '((|coerce|
                                      (|#1|
                                       (|SparseMultivariatePolynomial| |#2|
                                                                       (|Kernel|
                                                                        |#1|))))
                                     T)
                                   '((|isMult|
                                      ((|Union|
                                        (|Record| (|:| |coef| (|Integer|))
                                                  (|:| |var| (|Kernel| |#1|)))
                                        #5#)
                                       |#1|))
                                     T)
                                   '((|isPlus|
                                      ((|Union| (|List| |#1|) "failed") |#1|))
                                     T)
                                   '((|isExpt|
                                      ((|Union|
                                        (|Record| (|:| |var| (|Kernel| |#1|))
                                                  (|:| |exponent| (|Integer|)))
                                        #2#)
                                       |#1|))
                                     T)
                                   '((|isTimes|
                                      ((|Union| (|List| |#1|) "failed") |#1|))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|BasicOperator|))
                                       (|List| |#1|) (|Symbol|)))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|BasicOperator|) |#1|
                                       (|Symbol|)))
                                     T)
                                   '((|applyQuote|
                                      (|#1| (|Symbol|) (|List| |#1|)))
                                     T)
                                   '((|applyQuote|
                                      (|#1| (|Symbol|) |#1| |#1| |#1| |#1|))
                                     T)
                                   '((|applyQuote|
                                      (|#1| (|Symbol|) |#1| |#1| |#1|))
                                     T)
                                   '((|applyQuote| (|#1| (|Symbol|) |#1| |#1|))
                                     T)
                                   '((|applyQuote| (|#1| (|Symbol|) |#1|)) T)
                                   '((|variables|
                                      ((|List| (|Symbol|)) (|List| |#1|)))
                                     T)
                                   '((|variables| ((|List| (|Symbol|)) |#1|))
                                     T)
                                   '((|ground| (|#2| |#1|)) T)
                                   '((|ground?| ((|Boolean|) |#1|)) T)
                                   '((|retract| (|#2| |#1|)) T)
                                   '((|retractIfCan| ((|Union| |#2| #1#) |#1|))
                                     T)
                                   '((|coerce| (|#1| |#2|)) T)
                                   '((|retractIfCan|
                                      ((|Union| (|Integer|) #1#) |#1|))
                                     T)
                                   '((|retract| ((|Integer|) |#1|)) T)
                                   '((|convert| ((|Pattern| (|Float|)) |#1|))
                                     T)
                                   '((|convert| ((|Pattern| (|Integer|)) |#1|))
                                     T)
                                   '((|retract| ((|Symbol|) |#1|)) T)
                                   '((|retractIfCan|
                                      ((|Union| (|Symbol|) #1#) |#1|))
                                     T)
                                   '((|coerce| (|#1| (|Symbol|))) T)
                                   '((|eval|
                                      (|#1| |#1| (|BasicOperator|)
                                       (|Mapping| |#1| |#1|)))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|BasicOperator|)
                                       (|Mapping| |#1| (|List| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|BasicOperator|))
                                       (|List|
                                        (|Mapping| |#1| (|List| |#1|)))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|BasicOperator|))
                                       (|List| (|Mapping| |#1| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|Symbol|)
                                       (|Mapping| |#1| |#1|)))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|Symbol|)
                                       (|Mapping| |#1| (|List| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Symbol|))
                                       (|List|
                                        (|Mapping| |#1| (|List| |#1|)))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Symbol|))
                                       (|List| (|Mapping| |#1| |#1|))))
                                     T)
                                   '((|belong?|
                                      ((|Boolean|) (|BasicOperator|)))
                                     T)
                                   '((|operator|
                                      ((|BasicOperator|) (|BasicOperator|)))
                                     T)
                                   '((|kernels|
                                      ((|List| (|Kernel| |#1|)) (|List| |#1|)))
                                     T)
                                   '((|kernels|
                                      ((|List| (|Kernel| |#1|)) |#1|))
                                     T)
                                   '((|mainKernel|
                                      ((|Union| (|Kernel| |#1|) "failed")
                                       |#1|))
                                     T)
                                   '((|subst|
                                      (|#1| |#1| (|List| (|Kernel| |#1|))
                                       (|List| |#1|)))
                                     T)
                                   '((|subst|
                                      (|#1| |#1| (|List| (|Equation| |#1|))))
                                     T)
                                   '((|subst| (|#1| |#1| (|Equation| |#1|))) T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) (|List| |#1|)))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1| |#1| |#1| |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1| |#1| |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1| |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|))
                                     T)
                                   '((|elt| (|#1| (|BasicOperator|) |#1| |#1|))
                                     T)
                                   '((|elt| (|#1| (|BasicOperator|) |#1|)) T)
                                   '((|eval|
                                      (|#1| |#1| (|List| |#1|) (|List| |#1|)))
                                     T)
                                   '((|eval| (|#1| |#1| |#1| |#1|)) T)
                                   '((|eval| (|#1| |#1| (|Equation| |#1|))) T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Equation| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Kernel| |#1|))
                                       (|List| |#1|)))
                                     T)
                                   '((|eval| (|#1| |#1| (|Kernel| |#1|) |#1|))
                                     T)
                                   '((|retract| ((|Kernel| |#1|) |#1|)) T)
                                   '((|retractIfCan|
                                      ((|Union| (|Kernel| |#1|) #1#) |#1|))
                                     T)
                                   '((|coerce| (|#1| (|Kernel| |#1|))) T)
                                   '((|coerce| ((|OutputForm|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 344
                                            '(1 13 11 12 14 1 6 17 0 18 1 6 7 0
                                              21 1 23 0 12 24 1 6 0 25 26 1 6
                                              25 0 28 1 23 29 0 30 2 6 0 12 32
                                              33 1 6 0 12 38 2 6 0 11 32 39 2
                                              11 19 0 12 41 2 11 19 0 12 42 1
                                              23 11 0 44 1 23 45 0 46 2 6 0 11
                                              32 47 1 11 12 0 48 1 12 49 0 50 1
                                              45 6 0 52 1 45 6 0 53 3 6 0 0 25
                                              0 54 1 12 55 0 56 1 55 0 32 57 1
                                              6 55 0 58 4 6 0 0 59 32 12 60 4 0
                                              0 0 11 0 12 61 2 63 62 6 12 64 3
                                              6 0 0 59 66 67 4 0 0 0 59 32 12
                                              68 3 11 0 0 12 69 70 1 6 71 32 72
                                              1 6 73 32 75 1 6 77 0 78 0 7 81
                                              82 0 0 81 83 1 84 0 23 85 1 6 0
                                              86 87 1 0 0 25 88 0 12 0 89 1 6
                                              86 0 90 1 0 0 0 91 1 45 6 0 92 4
                                              6 0 0 73 93 95 96 4 0 0 0 12 81
                                              65 97 4 0 0 0 12 81 94 98 2 93 0
                                              81 81 99 3 0 0 0 73 95 100 1 11
                                              19 0 101 1 84 7 0 102 0 7 0 103 2
                                              7 19 0 0 104 1 6 0 0 105 2 6 0 11
                                              0 106 2 107 0 11 32 108 2 0 0 11
                                              32 109 4 0 0 0 73 93 66 110 1 84
                                              111 0 112 2 84 113 0 23 114 2 118
                                              115 116 117 119 2 73 120 12 0 121
                                              1 73 120 0 122 2 115 6 0 6 123 0
                                              6 0 124 2 126 125 0 120 127 2 93
                                              81 0 120 128 0 115 0 129 2 115 19
                                              0 0 130 1 115 81 0 131 2 6 0 0 81
                                              132 1 115 6 0 133 2 6 0 0 0 134 2
                                              6 0 0 0 135 1 115 0 0 136 1 6 137
                                              0 138 2 23 19 0 11 139 2 140 120
                                              137 0 141 3 140 137 0 120 137 142
                                              1 12 137 0 143 0 6 0 144 1 45 120
                                              0 145 1 120 137 0 146 2 137 0 0 0
                                              147 2 45 120 6 0 148 2 137 0 0 0
                                              149 2 137 0 0 81 150 2 11 151 0
                                              12 152 2 137 0 0 32 153 1 45 0 0
                                              154 2 45 6 0 120 155 3 45 6 0 120
                                              6 156 2 157 19 120 0 158 2 45 0 0
                                              81 159 2 45 0 0 81 160 2 45 0 0 0
                                              161 1 45 120 0 162 2 6 0 0 12 163
                                              2 6 19 0 0 164 1 166 165 11 167 2
                                              168 0 6 6 169 2 6 0 0 170 171 2 6
                                              0 11 0 172 2 81 19 0 0 173 2 6 19
                                              0 0 174 1 175 0 7 176 2 175 0 0
                                              12 177 1 175 7 0 178 2 84 0 179 0
                                              180 1 84 181 0 182 2 84 0 0 23
                                              183 1 6 0 7 184 3 187 6 185 186
                                              175 188 1 0 0 175 189 2 191 190
                                              12 12 192 2 23 19 0 0 193 1 84 17
                                              0 194 1 7 137 0 195 0 191 19 196
                                              1 23 137 0 197 2 115 137 0 137
                                              198 3 6 0 0 71 32 199 4 201 6 181
                                              45 23 200 202 3 203 6 200 186 84
                                              204 3 6 0 0 71 32 205 2 6 0 65 25
                                              206 1 6 71 0 207 2 181 0 0 0 208
                                              1 181 19 0 209 1 175 0 12 210 3
                                              213 175 211 212 84 214 1 6 216 0
                                              217 2 0 216 0 11 218 2 23 19 0 12
                                              219 2 0 216 0 12 220 1 117 81 0
                                              221 1 117 0 0 222 1 117 84 0 223
                                              1 84 19 0 224 1 7 225 0 226 2 166
                                              11 11 125 227 2 11 19 0 0 228 2
                                              157 19 0 0 229 2 45 19 0 0 230 1
                                              0 77 0 231 1 0 71 0 232 1 84 7 0
                                              233 1 0 7 0 234 1 0 175 0 235 1 0
                                              17 0 236 1 0 237 0 238 3 0 0 0 71
                                              32 239 3 0 0 0 71 32 240 2 0 0 0
                                              12 241 1 0 137 0 242 4 0 0 0 73
                                              93 95 243 1 84 244 0 245 1 0 244
                                              0 246 1 84 244 0 247 1 0 244 0
                                              248 1 84 250 0 251 1 0 216 0 252
                                              1 0 254 0 255 1 84 256 0 257 1 0
                                              256 0 258 1 84 259 0 260 1 0 259
                                              0 261 1 0 263 0 264 1 84 0 7 265
                                              2 0 0 7 0 266 1 267 111 6 268 1
                                              267 181 6 269 2 267 270 6 23 271
                                              2 0 272 0 25 273 1 267 274 6 275
                                              1 267 274 6 276 1 267 278 6 279 1
                                              267 281 6 282 1 6 86 0 283 1 0 0
                                              0 284 1 285 7 0 286 1 285 7 0 287
                                              2 6 0 86 86 288 1 0 0 285 289 1
                                              290 175 0 291 1 6 0 175 292 1 290
                                              175 0 293 2 6 0 0 0 294 1 0 0 290
                                              295 1 297 296 0 298 1 6 0 296 299
                                              1 297 296 0 300 1 0 0 297 301 1 6
                                              290 0 302 1 290 175 0 303 2 290 0
                                              175 175 304 1 0 290 0 305 2 7 306
                                              0 0 307 1 6 71 0 308 2 23 19 0 0
                                              309 1 181 0 0 310 1 0 71 32 311 1
                                              6 71 32 312 1 0 71 0 313 0 84 0
                                              314 2 84 19 0 0 315 2 137 0 0 0
                                              316 2 6 0 0 0 317 2 6 0 0 120 318
                                              1 6 0 0 319 1 320 6 0 321 1 320
                                              324 0 325 1 0 0 326 327 1 6 328 0
                                              329 1 290 237 0 330 1 0 328 0 331
                                              1 6 0 285 332 3 334 6 185 333 296
                                              335 1 0 0 296 336 1 337 120 0 338
                                              1 84 0 120 339 1 337 120 0 340 1
                                              0 0 337 341 2 120 306 0 0 342 2
                                              256 0 0 0 343 2 259 0 0 0 344 1 0
                                              73 32 74 1 0 73 0 76 2 0 272 0 25
                                              273 3 0 0 0 71 32 240 1 0 237 0
                                              238 1 0 328 0 331 1 0 17 0 236 1
                                              0 29 0 79 1 0 175 0 235 1 0 290 0
                                              305 1 0 7 0 234 1 0 12 0 31 1 0
                                              11 11 51 1 0 0 0 91 1 0 77 0 231
                                              1 0 71 0 232 1 0 244 0 248 1 0
                                              254 0 255 1 0 244 0 246 1 0 263 0
                                              264 2 0 216 0 12 220 2 0 216 0 11
                                              218 1 0 216 0 252 1 0 19 0 20 1 0
                                              7 0 22 4 0 0 0 12 81 65 97 4 0 0
                                              0 73 93 95 243 4 0 0 0 12 81 94
                                              98 4 0 0 0 73 93 66 110 4 0 0 0
                                              59 32 12 68 4 0 0 0 11 0 12 61 3
                                              0 0 0 73 95 100 3 0 0 0 71 32 239
                                              2 0 0 11 32 109 2 0 0 0 12 241 1
                                              0 0 0 284 1 0 0 326 327 1 0 256 0
                                              258 1 0 259 0 261 1 0 0 175 189 1
                                              0 0 337 341 1 0 0 290 295 1 0 0
                                              296 336 1 0 0 297 301 1 0 0 285
                                              289 1 0 0 12 27 1 0 137 0 242 1 0
                                              0 25 88 0 0 81 83 1 0 19 11 43 2
                                              0 0 12 32 40 4 0 0 12 0 0 0 36 5
                                              0 0 12 0 0 0 0 37 3 0 0 12 0 0 35
                                              2 0 0 12 0 34 1 0 71 32 311 1 0
                                              71 0 313 2 0 0 7 0 266)))))
           '|lookupComplete|)) 
