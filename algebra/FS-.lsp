
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
                                   (QREFELT $ 30))
                         |FS-;retract;SS;4|)
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
                           (LETT #2# NIL . #3=(|FS-;subs|))
                           (SEQ (LETT |x| NIL . #3#)
                                (LETT #1# (SPADCALL |k| (QREFELT $ 46)) . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2# (CONS (SPADCALL |x| |fn|) #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
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
                       (QREFELT $ 57))
                      |FS-;indiff|)
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
                           (LETT #2# NIL . #3=(|FS-;eval;SLLSS;17|))
                           (SEQ (LETT |g| NIL . #3#) (LETT #1# |lg| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |g| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |g| |x| (QREFELT $ 64))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 67))))) 

(SDEFUN |FS-;variables;LL;18| ((|lx| |List| S) ($ |List| (|Symbol|)))
        (SPROG
         ((|l| (|List| (|Symbol|))) (|s| (|Union| (|Symbol|) "failed"))
          (#1=#:G198 NIL) (|k| NIL))
         (SEQ (LETT |l| NIL . #2=(|FS-;variables;LL;18|))
              (SEQ (LETT |k| NIL . #2#)
                   (LETT #1# (SPADCALL |lx| (QREFELT $ 72)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |s| (SPADCALL |k| (QREFELT $ 30)) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |s| 0)
                           (LETT |l| (CONS (QCDR |s|) |l|) . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |l|))))) 

(SDEFUN |FS-;variables;SL;19| ((|x| S) ($ |List| (|Symbol|)))
        (SPADCALL (LIST |x|) (QREFELT $ 75))) 

(SDEFUN |FS-;retractIfCan;SU;20| ((|x| S) ($ |Union| (|Symbol|) "failed"))
        (SPROG ((|k| (|Union| (|Kernel| S) "failed")))
               (SEQ
                (LETT |k| (SPADCALL |x| (QREFELT $ 78))
                      |FS-;retractIfCan;SU;20|)
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
          (LETT $ (QREFELT $$ 1) . #1=(|FS-;eval;SSNniMS;25|))
          (LETT |f| (QREFELT $$ 0) . #1#)
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
                     (LETT |od?| (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 41))
                           . #2=(|FS-;elt;BoLS;28|))
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
                                                  (QREFELT $ 106))
                                        . #2#)
                                  (EXIT
                                   (COND (|od?| (SPADCALL |x| (QREFELT $ 105)))
                                         ('T |x|))))
                                 . #2#)
                           (GO #3=#:G241))))))))))
                  (EXIT (SPADCALL |op| |args| (QREFELT $ 108)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FS-;eval;SLLLS;29|
        ((|x| S) (|s| |List| (|Symbol|)) (|n| |List| (|NonNegativeInteger|))
         (|l| |List| (|Mapping| S S)) ($ S))
        (SPROG ((#1=#:G248 NIL) (|f| NIL) (#2=#:G247 NIL))
               (SEQ
                (SPADCALL |x| |s| |n|
                          (PROGN
                           (LETT #2# NIL . #3=(|FS-;eval;SLLLS;29|))
                           (SEQ (LETT |f| NIL . #3#) (LETT #1# |l| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (CONS #'|FS-;eval;SLLLS;29!0|
                                               (VECTOR |f| $))
                                         #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 96))))) 

(SDEFUN |FS-;eval;SLLLS;29!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1) . #1=(|FS-;eval;SLLLS;29|))
          (LETT |f| (QREFELT $$ 0) . #1#)
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
         (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 112)) . #3=(|FS-;smprep|))
              (EXIT
               (COND ((QEQCAR |v| 1) (SPADCALL |p| (QREFELT $ 87)))
                     (#4='T
                      (SEQ (LETT |k| (QCDR |v|) . #3#)
                           (LETT |g|
                                 (SPADCALL
                                  (LETT |op| (SPADCALL |k| (QREFELT $ 44))
                                        . #3#)
                                  (LETT |arg|
                                        (PROGN
                                         (LETT #2# NIL . #3#)
                                         (SEQ (LETT |a| NIL . #3#)
                                              (LETT #1#
                                                    (SPADCALL |k|
                                                              (QREFELT $ 46))
                                                    . #3#)
                                              G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |a| (CAR #1#) . #3#)
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
                                                       #2#)
                                                      . #3#)))
                                              (LETT #1# (CDR #1#) . #3#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #2#))))
                                        . #3#)
                                  (QREFELT $ 39))
                                 . #3#)
                           (LETT |q|
                                 (SPADCALL
                                  (CONS #'|FS-;smprep!0|
                                        (VECTOR |lfunc| |lexp| |lop| $))
                                  (SPADCALL |p| |k| (QREFELT $ 114))
                                  (QREFELT $ 119))
                                 . #3#)
                           (EXIT
                            (COND
                             ((<
                               (LETT |n|
                                     (SPADCALL (SPADCALL |op| (QREFELT $ 48))
                                               |lop| (QREFELT $ 121))
                                     . #3#)
                               (SPADCALL |lop| (QREFELT $ 122)))
                              (SPADCALL |q| |g| (QREFELT $ 123)))
                             (#4#
                              (SEQ (LETT |a| (|spadConstant| $ 124) . #3#)
                                   (LETT |f|
                                         (SPADCALL
                                          (SPADCALL |arg|
                                                    (SPADCALL |lfunc| |n|
                                                              (QREFELT $ 127)))
                                          |lop| |lexp| |lfunc| (QREFELT $ 96))
                                         . #3#)
                                   (LETT |e|
                                         (SPADCALL |lexp| |n| (QREFELT $ 128))
                                         . #3#)
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (SPADCALL |q| (|spadConstant| $ 129)
                                                     (QREFELT $ 130)))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |m|
                                               (SPADCALL |q| (QREFELT $ 131))
                                               . #3#)
                                         (LETT |qr| (DIVIDE2 |m| |e|) . #3#)
                                         (LETT |t1|
                                               (SPADCALL |f| (QCAR |qr|)
                                                         (QREFELT $ 132))
                                               . #3#)
                                         (LETT |t2|
                                               (SPADCALL |g| (QCDR |qr|)
                                                         (QREFELT $ 132))
                                               . #3#)
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
                                                         (QREFELT $ 135))
                                               . #3#)
                                         (EXIT
                                          (LETT |q|
                                                (SPADCALL |q| (QREFELT $ 136))
                                                . #3#)))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT |a|)))))))))))) 

(SDEFUN |FS-;smprep!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |lop| |lexp| |lfunc|)
          (LETT $ (QREFELT $$ 3) . #1=(|FS-;smprep|))
          (LETT |lop| (QREFELT $$ 2) . #1#)
          (LETT |lexp| (QREFELT $$ 1) . #1#)
          (LETT |lfunc| (QREFELT $$ 0) . #1#)
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
          (LETT |s| (SPADCALL (SPADCALL |l| (QREFELT $ 52)) (QREFELT $ 138))
                . #3=(|FS-;dispdiff|))
          (LETT |t| (SPADCALL (SPADCALL |l| (QREFELT $ 53)) (QREFELT $ 138))
                . #3#)
          (LETT |a|
                (SPADCALL
                 (LETT |k| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 28)) . #3#)
                 (QREFELT $ 46))
                . #3#)
          (EXIT
           (COND
            ((SPADCALL |k| (QREFELT $ 15) (QREFELT $ 139))
             (SEQ (LETT |rec| (|FS-;dispdiff| |a| $) . #3#)
                  (LETT |i| (SPADCALL |s| (QVELT |rec| 2) (QREFELT $ 141))
                        . #3#)
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
                                 (#4='T (+ (QVELT |rec| 4) 1)))))))
            (#4#
             (SEQ
              (LETT |i|
                    (SPADCALL (SPADCALL |l| (QREFELT $ 52)) |a|
                              (QREFELT $ 148))
                    . #3#)
              (LETT |m|
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |x| NIL . #3#) (LETT #1# |a| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 138)) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
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
                (COND ((NULL (CDR |a|)) 1) (#4# 0))))))))))) 

(SDEFUN |FS-;ddiff| ((|l| |List| S) ($ |OutputForm|))
        (SPROG
         ((|f| (|Union| (|None|) "failed")) (|opname| (|OutputForm|))
          (|rec|
           (|Record| (|:| |name| (|OutputForm|)) (|:| |sub| (|OutputForm|))
                     (|:| |arg| (|List| (|OutputForm|)))
                     (|:| |orig_op| (|BasicOperator|))
                     (|:| |level| (|NonNegativeInteger|)))))
         (SEQ (LETT |rec| (|FS-;dispdiff| |l| $) . #1=(|FS-;ddiff|))
              (LETT |opname|
                    (COND
                     ((ZEROP (QVELT |rec| 4))
                      (SPADCALL (QVELT |rec| 0) (QVELT |rec| 1)
                                (QREFELT $ 149)))
                     (#2='T
                      (SPADCALL (QVELT |rec| 0) (QVELT |rec| 4)
                                (QREFELT $ 150))))
                    . #1#)
              (LETT |f| (SPADCALL (QVELT |rec| 3) '|%diffDisp| (QREFELT $ 152))
                    . #1#)
              (EXIT
               (COND
                ((QEQCAR |f| 0)
                 (SPADCALL (CONS |opname| (QVELT |rec| 2)) (QCDR |f|)))
                (#2# (SPADCALL |opname| (QVELT |rec| 2) (QREFELT $ 153)))))))) 

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
         (SEQ (LETT |li| NIL . #9=(|FS-;encode_diff|)) (LETT |lk| NIL . #9#)
              (LETT |i| (|SPADfirst| |nsub|) . #9#) (LETT |k| 1 . #9#)
              (LETT |nsub| (CDR |nsub|) . #9#)
              (SEQ G190 (COND ((NULL (NULL (NULL |nsub|))) (GO G191)))
                   (SEQ (LETT |ii| (|SPADfirst| |nsub|) . #9#)
                        (LETT |nsub| (CDR |nsub|) . #9#)
                        (EXIT
                         (COND ((EQL |ii| |i|) (LETT |k| (+ |k| 1) . #9#))
                               ('T
                                (SEQ (LETT |lk| (CONS |k| |lk|) . #9#)
                                     (LETT |li| (CONS |i| |li|) . #9#)
                                     (LETT |i| |ii| . #9#)
                                     (EXIT (LETT |k| 1 . #9#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |lk| (CONS |k| |lk|) . #9#)
              (LETT |li| (CONS |i| |li|) . #9#)
              (LETT |nargs| (SPADCALL |args| (QREFELT $ 154)) . #9#)
              (LETT |pts| NIL . #9#)
              (SEQ (LETT |dm| NIL . #9#) (LETT #8# |nd| . #9#)
                   (LETT |i| NIL . #9#) (LETT #7# (REVERSE |li|) . #9#) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |i| (CAR #7#) . #9#) NIL)
                         (ATOM #8#) (PROGN (LETT |dm| (CAR #8#) . #9#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |pts|
                          (CONS (SPADCALL |nargs| |i| (QREFELT $ 155)) |pts|)
                          . #9#)
                    (EXIT (SPADCALL |nargs| |i| |dm| (QREFELT $ 156))))
                   (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #9#))
                         . #9#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |res|
                    (SPADCALL (SPADCALL |ker| (QREFELT $ 44)) |nargs|
                              (QREFELT $ 47))
                    . #9#)
              (SEQ (LETT |dm| NIL . #9#) (LETT #6# (REVERSE |nd|) . #9#)
                   (LETT |pt| NIL . #9#) (LETT #5# |pts| . #9#)
                   (LETT |k| NIL . #9#) (LETT #4# |lk| . #9#)
                   (LETT |i| NIL . #9#) (LETT #2# |li| . #9#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #9#) NIL)
                         (ATOM #4#) (PROGN (LETT |k| (CAR #4#) . #9#) NIL)
                         (ATOM #5#) (PROGN (LETT |pt| (CAR #5#) . #9#) NIL)
                         (ATOM #6#) (PROGN (LETT |dm| (CAR #6#) . #9#) NIL))
                     (GO G191)))
                   (SEQ
                    (SEQ (LETT |kk| 2 . #9#) (LETT #1# |k| . #9#) G190
                         (COND ((|greater_SI| |kk| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL (QREFELT $ 15)
                                           (LIST |res| |dm| |dm|)
                                           (QREFELT $ 47))
                                 . #9#)))
                         (LETT |kk| (|inc_SI| |kk|) . #9#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (LETT |res|
                           (SPADCALL (QREFELT $ 15) (LIST |res| |dm| |pt|)
                                     (QREFELT $ 47))
                           . #9#)))
                   (LETT #2#
                         (PROG1 (CDR #2#)
                           (LETT #4#
                                 (PROG1 (CDR #4#)
                                   (LETT #5#
                                         (PROG1 (CDR #5#)
                                           (LETT #6# (CDR #6#) . #9#))
                                         . #9#))
                                 . #9#))
                         . #9#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FS-;insert_sub|
        ((|lsub| |List| (|Integer|)) (|j| |Integer|) ($ |List| (|Integer|)))
        (SPROG
         ((|nsub| (|List| (|Integer|))) (|to_insert| (|Boolean|))
          (#1=#:G322 NIL) (|i| NIL))
         (SEQ (LETT |nsub| NIL . #2=(|FS-;insert_sub|))
              (LETT |to_insert| 'T . #2#)
              (SEQ (LETT |i| NIL . #2#) (LETT #1# |lsub| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|to_insert|
                      (COND
                       ((NULL (SPADCALL |i| |j| (QREFELT $ 157)))
                        (SEQ (LETT |nsub| (CONS |j| |nsub|) . #2#)
                             (EXIT (LETT |to_insert| NIL . #2#)))))))
                    (EXIT (LETT |nsub| (CONS |i| |nsub|) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (COND (|to_insert| (LETT |nsub| (CONS |j| |nsub|) . #2#)))
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
         (SEQ
          (LETT |nsub| (|FS-;insert_sub| (QVELT |r1| 1) |i| $)
                . #4=(|FS-;pos_diff|))
          (LETT |nd| (QVELT |r1| 4) . #4#)
          (COND
           ((NULL (SPADCALL |i| (QVELT |r1| 1) (QREFELT $ 159)))
            (SEQ (LETT |k| 0 . #4#) (LETT |ii| (|SPADfirst| |nsub|) . #4#)
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| NIL . #4#) (LETT #3# |nsub| . #4#) G190
                        (COND
                         ((OR (ATOM #3#)
                              (PROGN (LETT |j| (CAR #3#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((EQL |i| |j|)
                            (PROGN (LETT #2# |$NoValue| . #4#) (GO #5=#:G324)))
                           ((NULL (EQL |ii| |j|))
                            (LETT |k| (+ |k| 1) . #4#)))))
                        (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                  #5# (EXIT #2#))
                 (LETT |nd1| (SPADCALL |nd| |k| (QREFELT $ 160)) . #4#)
                 (LETT |nd2| (SPADCALL |nd| |k| (QREFELT $ 161)) . #4#)
                 (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 89)) (QREFELT $ 38))
                       . #4#)
                 (EXIT
                  (LETT |nd| (SPADCALL |nd1| (CONS |dm| |nd2|) (QREFELT $ 162))
                        . #4#)))))
          (EXIT
           (|FS-;encode_diff| (QVELT |r1| 0) |nsub| (QVELT |r1| 3) |nd| $))))) 

(SDEFUN |FS-;diffdiff| ((|l| |List| S) (|x| |Symbol|) ($ S))
        (SPROG
         ((|res| (S)) (|db| (S)) (#1=#:G336 NIL) (|i| NIL) (#2=#:G337 NIL)
          (|b| NIL) (|args| #3=(|List| S))
          (|r1|
           (|Record| (|:| |orig_k| (|Kernel| S))
                     (|:| |sub| (|List| (|Integer|))) (|:| |oarg| (|List| S))
                     (|:| |arg| #3#) (|:| |dummies| (|List| S)))))
         (SEQ (LETT |r1| (|FS-;decode_diff| |l| $) . #4=(|FS-;diffdiff|))
              (LETT |args| (QVELT |r1| 3) . #4#)
              (LETT |res| (|spadConstant| $ 124) . #4#)
              (SEQ (LETT |b| NIL . #4#) (LETT #2# |args| . #4#)
                   (LETT |i| (SPADCALL |args| (QREFELT $ 145)) . #4#)
                   (LETT #1# (SPADCALL |args| (QREFELT $ 163)) . #4#) G190
                   (COND
                    ((OR (> |i| #1#) (ATOM #2#)
                         (PROGN (LETT |b| (CAR #2#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |db| (SPADCALL |b| |x| (QREFELT $ 164)) . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |db| (|spadConstant| $ 124)
                                     (QREFELT $ 165))
                           "iterate")
                          ('T
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL |db|
                                                     (|FS-;pos_diff| |l| |r1|
                                                      |i| $)
                                                     (QREFELT $ 134))
                                           (QREFELT $ 135))
                                 . #4#)))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #2# (CDR #2#) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FS-;dfeval| ((|l| |List| S) (|g| |Kernel| S) ($ S))
        (SPROG ((#1=#:G339 NIL))
               (SPADCALL
                (SPADCALL (|SPADfirst| |l|)
                          (PROG2
                              (LETT #1# (SPADCALL |g| (QREFELT $ 30))
                                    |FS-;dfeval|)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                            (|Union| (|Symbol|) "failed") #1#))
                          (QREFELT $ 164))
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
            (LETT |g| (SPADCALL (SPADCALL |l| (QREFELT $ 52)) (QREFELT $ 28))
                  . #2=(|FS-;diffEval|))
            (SEQ (LETT |u| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 78)) . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |u| 1)
                    (PROGN
                     (LETT #1# (|FS-;dfeval| |l| |g| $) . #2#)
                     (GO #3=#:G370)))
                   ((QEQCAR |u| 0)
                    (COND
                     ((QEQCAR
                       (SPADCALL (LETT |k| (QCDR |u|) . #2#) (QREFELT $ 30)) 0)
                      (PROGN
                       (LETT #1# (|FS-;dfeval| |l| |g| $) . #2#)
                       (GO #3#))))))))
            (LETT |op| (SPADCALL |k| (QREFELT $ 44)) . #2#)
            (LETT |ud| (SPADCALL |op| (QREFELT $ 168)) . #2#)
            (EXIT
             (COND
              ((QEQCAR |ud| 1)
               (SEQ
                (LETT |dumm|
                      (SPADCALL (|FS-;symsub| (QREFELT $ 80) 1 $)
                                (QREFELT $ 38))
                      . #2#)
                (LETT |ss|
                      (SPADCALL (SPADCALL |l| 1 (QREFELT $ 155))
                                (SPADCALL (SPADCALL |l| 2 (QREFELT $ 155))
                                          |dumm| (QREFELT $ 170))
                                (QREFELT $ 172))
                      . #2#)
                (LETT |nl| (LIST |ss| |dumm| (SPADCALL |l| 3 (QREFELT $ 155)))
                      . #2#)
                (EXIT (SPADCALL (QREFELT $ 15) |nl| (QREFELT $ 47)))))
              ((<
                (LETT |n|
                      (SPADCALL (SPADCALL |l| (QREFELT $ 52))
                                (SPADCALL |k| (QREFELT $ 46)) (QREFELT $ 148))
                      . #2#)
                (SPADCALL |l| (QREFELT $ 145)))
               (|FS-;dfeval| |l| |g| $))
              ('T
               (SEQ (LETT |d| (QCDR |ud|) . #2#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |k| (QREFELT $ 46))
                                (SPADCALL |d| |n| (QREFELT $ 127)))
                      |g| (SPADCALL |l| (QREFELT $ 53)) (QREFELT $ 54)))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |FS-;diffArg|
        ((|l| |List| S) (|op| |BasicOperator|) (|i| |NonNegativeInteger|)
         ($ |List| S))
        (SPROG ((|g| (S)) (|z| (|List| S)) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (+ (- |i| 1) (SPADCALL |l| (QREFELT $ 145)))
                      . #1=(|FS-;diffArg|))
                (LETT |z| (SPADCALL |l| (QREFELT $ 154)) . #1#)
                (SPADCALL |z| |n|
                          (LETT |g|
                                (SPADCALL (|FS-;symsub| (QREFELT $ 80) |n| $)
                                          (QREFELT $ 38))
                                . #1#)
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
                                   (QREFELT $ 38))
                         . #3=(|FS-;opderiv|))
                   (EXIT
                    (LIST
                     (CONS #'|FS-;opderiv!0|
                           (VECTOR $ |g| |op| (QREFELT $ 15)))))))
                 ('T
                  (PROGN
                   (LETT #2# NIL . #3#)
                   (SEQ (LETT |i| 1 . #3#) (LETT #1# |n| . #3#) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (CONS #'|FS-;opderiv!1|
                                       (VECTOR $ |i| |op| (QREFELT $ 15)))
                                 #2#)
                                . #3#)))
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |FS-;opderiv!1| ((|x| NIL) ($$ NIL))
        (PROG (|opdiff| |op| |i| $)
          (LETT |opdiff| (QREFELT $$ 3) . #1=(|FS-;opderiv|))
          (LETT |op| (QREFELT $$ 2) . #1#)
          (LETT |i| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |opdiff| (|FS-;diffArg| |x| |op| |i| $)
                      (QREFELT $ 47)))))) 

(SDEFUN |FS-;opderiv!0| ((|x| NIL) ($$ NIL))
        (PROG (|opdiff| |op| |g| $)
          (LETT |opdiff| (QREFELT $$ 3) . #1=(|FS-;opderiv|))
          (LETT |op| (QREFELT $$ 2) . #1#)
          (LETT |g| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |opdiff|
                      (LIST (SPADCALL |op| |g| (QREFELT $ 173)) |g|
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
             (LETT |n|
                   (LENGTH
                    (LETT |args| (SPADCALL |k| (QREFELT $ 46))
                          . #1=(|FS-;kgrad|)))
                   . #1#))
            NIL)
           (#2='T
            (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 44)) . #1#)
                 (LETT |grad|
                       (SEQ (LETT |u| (SPADCALL |op| (QREFELT $ 168)) . #1#)
                            (EXIT
                             (COND ((QEQCAR |u| 1) (|FS-;opderiv| |op| |n| $))
                                   (#2# (QCDR |u|)))))
                       . #1#)
                 (EXIT
                  (COND
                   ((SPADCALL (LENGTH |grad|) |n| (QREFELT $ 174))
                    (|FS-;opderiv| |op| |n| $))
                   (#2# |grad|))))))))) 

(SDEFUN |FS-;kerderiv| ((|k| |Kernel| S) (|x| |Symbol|) ($ S))
        (SPROG
         ((#1=#:G401 NIL) (#2=#:G400 (S)) (#3=#:G402 (S)) (|dyx| (S))
          (#4=#:G406 NIL) (|g| NIL) (#5=#:G407 NIL) (|y| NIL)
          (|fn| (|Union| (|None|) "failed")) (|ak| (|List| S))
          (|v| (|Union| (|Symbol|) "failed")))
         (SEQ (LETT |v| (SPADCALL |k| (QREFELT $ 30)) . #6=(|FS-;kerderiv|))
              (EXIT
               (COND
                ((QEQCAR |v| 0)
                 (COND ((EQUAL (QCDR |v|) |x|) (|spadConstant| $ 144))
                       (#7='T (|spadConstant| $ 124))))
                (#7#
                 (SEQ (LETT |ak| (SPADCALL |k| (QREFELT $ 46)) . #6#)
                      (LETT |fn|
                            (SPADCALL (SPADCALL |k| (QREFELT $ 44))
                                      (QREFELT $ 10) (QREFELT $ 152))
                            . #6#)
                      (EXIT
                       (COND ((QEQCAR |fn| 0) (SPADCALL |ak| |x| (QCDR |fn|)))
                             (#7#
                              (PROGN
                               (LETT #1# NIL . #6#)
                               (SEQ (LETT |y| NIL . #6#) (LETT #5# |ak| . #6#)
                                    (LETT |g| NIL . #6#)
                                    (LETT #4# (|FS-;kgrad| |k| $) . #6#) G190
                                    (COND
                                     ((OR (ATOM #4#)
                                          (PROGN
                                           (LETT |g| (CAR #4#) . #6#)
                                           NIL)
                                          (ATOM #5#)
                                          (PROGN
                                           (LETT |y| (CAR #5#) . #6#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (LETT |dyx|
                                               (SPADCALL |y| |x|
                                                         (QREFELT $ 164))
                                               . #6#)
                                         (|spadConstant| $ 124)
                                         (QREFELT $ 175))
                                        (PROGN
                                         (LETT #3#
                                               (SPADCALL (SPADCALL |ak| |g|)
                                                         |dyx| (QREFELT $ 134))
                                               . #6#)
                                         (COND
                                          (#1#
                                           (LETT #2#
                                                 (SPADCALL #2# #3#
                                                           (QREFELT $ 135))
                                                 . #6#))
                                          ('T
                                           (PROGN
                                            (LETT #2# #3# . #6#)
                                            (LETT #1# 'T . #6#)))))))))
                                    (LETT #4#
                                          (PROG1 (CDR #4#)
                                            (LETT #5# (CDR #5#) . #6#))
                                          . #6#)
                                    (GO G190) G191 (EXIT NIL))
                               (COND (#1# #2#)
                                     (#7# (|spadConstant| $ 124)))))))))))))) 

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
                      (QREFELT $ 181))
            (QREFELT $ 87))
           (PROGN
            (LETT #1# NIL . #5=(|FS-;smpderiv|))
            (SEQ (LETT |k| NIL . #5#)
                 (LETT #4# (SPADCALL |p| (QREFELT $ 183)) . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |k| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #3#
                          (SPADCALL
                           (SPADCALL (SPADCALL |p| |k| (QREFELT $ 184))
                                     (QREFELT $ 87))
                           (|FS-;kerderiv| |k| |x| $) (QREFELT $ 134))
                          . #5#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 135)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 124))))
           (QREFELT $ 135))))) 

(SDEFUN |FS-;smpderiv!0| ((|s| NIL) ($$ NIL))
        (PROG ($ |x|)
          (LETT $ (QREFELT $$ 1) . #1=(|FS-;smpderiv|))
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (SPADCALL |s| (QREFELT $ 177)) |x| (QREFELT $ 178))
             (QREFELT $ 179)))))) 

(SDEFUN |FS-;coerce;PS;44| ((|p| |Polynomial| R) ($ S))
        (SPADCALL (ELT $ 38) (ELT $ 185) |p| (QREFELT $ 189))) 

(SDEFUN |FS-;worse?| ((|k1| |Kernel| S) (|k2| |Kernel| S) ($ |Boolean|))
        (SPROG ((|u| (|Union| (|Boolean|) "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL
                       (SPADCALL (SPADCALL |k1| (QREFELT $ 44)) (QREFELT $ 48))
                       (SPADCALL (SPADCALL |k2| (QREFELT $ 44)) (QREFELT $ 48))
                       (QREFELT $ 193))
                      |FS-;worse?|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (SPADCALL |k1| |k2| (QREFELT $ 194)))
                       ('T (QCDR |u|))))))) 

(SDEFUN |FS-;bestKernel| ((|l| |List| (|Kernel| S)) ($ |Kernel| S))
        (SPROG ((|a| (|Kernel| S)))
               (SEQ
                (COND ((NULL (CDR |l|)) (|SPADfirst| |l|))
                      (#1='T
                       (SEQ
                        (LETT |a| (|FS-;bestKernel| (CDR |l|) $)
                              |FS-;bestKernel|)
                        (EXIT
                         (COND ((|FS-;worse?| (|SPADfirst| |l|) |a| $) |a|)
                               (#1# (|SPADfirst| |l|)))))))))) 

(SDEFUN |FS-;smp2O|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S)) ($ |OutputForm|))
        (SPROG ((|a| (|Kernel| S)) (#1=#:G451 NIL) (|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |p| (QREFELT $ 195)) . #2=(|FS-;smp2O|))
                (EXIT
                 (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 196)))
                       (#3='T
                        (SEQ
                         (LETT |a|
                               (COND
                                ((SPADCALL (QREFELT $ 197))
                                 (|FS-;bestKernel|
                                  (SPADCALL |p| (QREFELT $ 183)) $))
                                (#3#
                                 (PROG2
                                     (LETT #1# (SPADCALL |p| (QREFELT $ 112))
                                           . #2#)
                                     (QCDR #1#)
                                   (|check_union2| (QEQCAR #1# 0)
                                                   (|Kernel| (QREFELT $ 6))
                                                   (|Union|
                                                    (|Kernel| (QREFELT $ 6))
                                                    "failed")
                                                   #1#))))
                               . #2#)
                         (EXIT
                          (SPADCALL
                           (SPADCALL (ELT $ 87)
                                     (SPADCALL |p| |a| (QREFELT $ 114))
                                     (QREFELT $ 119))
                           (SPADCALL |a| (QREFELT $ 198))
                           (QREFELT $ 199)))))))))) 

(SDEFUN |FS-;smpsubst|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S))
         (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|FS-;smpsubst!2| (VECTOR $ |lv| |lk|))
                         (ELT $ 185) |p| (QREFELT $ 205)))) 

(SDEFUN |FS-;smpsubst!2| ((|x| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) . #1=(|FS-;smpsubst|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |lk| |lv| |x|
                             (|FS-;notfound|
                              (CONS #'|FS-;smpsubst!1| (VECTOR |lk| |lv| $))
                              |lk| $)
                             (QREFELT $ 203))))))) 

(SDEFUN |FS-;smpsubst!1| ((|z| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT |lk| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG NIL
                   (|FS-;subs| (CONS #'|FS-;smpsubst!0| (VECTOR $ |lv| |lk|))
                    |z| $)))))) 

(SDEFUN |FS-;smpsubst!0| ((|s| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |s| |lk| |lv| (QREFELT $ 200)))))) 

(SDEFUN |FS-;smpeval|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S))
         (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|FS-;smpeval!2| (VECTOR $ |lv| |lk|))
                         (ELT $ 185) |p| (QREFELT $ 205)))) 

(SDEFUN |FS-;smpeval!2| ((|x| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) . #1=(|FS-;smpeval|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |lk| |lv| |x|
                             (|FS-;notfound|
                              (CONS #'|FS-;smpeval!1| (VECTOR |lk| |lv| $))
                              |lk| $)
                             (QREFELT $ 203))))))) 

(SDEFUN |FS-;smpeval!1| ((|z| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT |lk| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|FS-;smpeval!0| (VECTOR $ |lv| |lk|)) |z|
                             (QREFELT $ 207))))))) 

(SDEFUN |FS-;smpeval!0| ((|s| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |s| |lk| |lv| (QREFELT $ 206)))))) 

(SDEFUN |FS-;notfound|
        ((|fn| |Mapping| S (|Kernel| S)) (|lk| |List| (|Kernel| S))
         ($ |Mapping| S (|Kernel| S)))
        (SPROG NIL (CONS #'|FS-;notfound!0| (VECTOR |fn| |lk| $)))) 

(SDEFUN |FS-;notfound!0| ((|k| NIL) ($$ NIL))
        (PROG ($ |lk| |fn|)
          (LETT $ (QREFELT $$ 2) . #1=(|FS-;notfound|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |fn| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|f| NIL))
                   (COND
                    ((SPADCALL
                      (SPADCALL
                       (SPADCALL (LETT |f| (SPADCALL |k| (QREFELT $ 26)) NIL)
                                 (QREFELT $ 208))
                       |lk| (QREFELT $ 209))
                      (QREFELT $ 210))
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
             (LETT #1# NIL . #6=(|FS-;smpret|))
             (SEQ (LETT |k| NIL . #6#)
                  (LETT #5# (SPADCALL |p| (QREFELT $ 183)) . #6#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |k| (CAR #5#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4# (QEQCAR (SPADCALL |k| (QREFELT $ 30)) 1) . #6#)
                     (COND (#1# (LETT #2# (COND (#2# 'T) ('T #4#)) . #6#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #6#)
                             (LETT #1# 'T . #6#)))))))
                  (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#7='T NIL)))
            (CONS 1 "failed"))
           (#7#
            (CONS 0
                  (SPADCALL (CONS #'|FS-;smpret!0| $) (ELT $ 177) |p|
                            (QREFELT $ 215)))))))) 

(SDEFUN |FS-;smpret!0| ((|x| NIL) ($ NIL))
        (SPROG ((#1=#:G508 NIL))
               (SPADCALL
                (PROG2 (LETT #1# (SPADCALL |x| (QREFELT $ 30)) NIL)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                  (|Union| (|Symbol|) "failed") #1#))
                (QREFELT $ 211)))) 

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
         (SEQ
          (LETT |u| (SPADCALL |x| (QREFELT $ 218)) . #2=(|FS-;isExpt;SBoU;52|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |v| (QCAR (QCDR |u|)) . #2#)
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
         (SEQ
          (LETT |u| (SPADCALL |x| (QREFELT $ 218)) . #2=(|FS-;isExpt;SSU;53|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |v| (QCAR (QCDR |u|)) . #2#)
                       (COND
                        ((SPADCALL |v| |sy| (QREFELT $ 220))
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
            (SEQ
             (LETT |u| (SPADCALL |p| (QREFELT $ 112)) . #2=(|FS-;smpIsMult|))
             (EXIT
              (COND
               ((QEQCAR |u| 0)
                (COND
                 ((EQL
                   (SPADCALL
                    (LETT |q| (SPADCALL |p| (QCDR |u|) (QREFELT $ 114)) . #2#)
                    (QREFELT $ 222))
                   1)
                  (COND
                   ((SPADCALL
                     (SPADCALL (SPADCALL |q| (QREFELT $ 223)) (QREFELT $ 224))
                     (QREFELT $ 225))
                    (SEQ
                     (LETT |r|
                           (SPADCALL (SPADCALL |q| (QREFELT $ 224))
                                     (QREFELT $ 195))
                           . #2#)
                     (EXIT
                      (COND
                       ((QEQCAR |r| 0)
                        (SEQ
                         (LETT |n| (SPADCALL (QCDR |r|) (QREFELT $ 227)) . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |n| 0)
                            (PROGN
                             (LETT #1# (CONS 0 (CONS (QCDR |n|) (QCDR |u|)))
                                   . #2#)
                             (GO #3=#:G550))))))))))))))))))
            (EXIT (CONS 1 "failed"))))
          #3# (EXIT #1#)))) 

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
         (SEQ
          (LETT |da| (SPADCALL |l| (QREFELT $ 52)) . #3=(|FS-;decode_diff|))
          (LETT |pt| (SPADCALL |l| (QREFELT $ 53)) . #3#)
          (LETT |a|
                (SPADCALL
                 (LETT |k| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 28)) . #3#)
                 (QREFELT $ 46))
                . #3#)
          (EXIT
           (COND
            ((SPADCALL |k| (QREFELT $ 15) (QREFELT $ 139))
             (SEQ (LETT |rec| (|FS-;decode_diff| |a| $) . #3#)
                  (LETT |i| (SPADCALL |da| (QVELT |rec| 3) (QREFELT $ 148))
                        . #3#)
                  (SPADCALL (QVELT |rec| 3) |i| |pt| (QREFELT $ 156))
                  (LETT |nd| (QVELT |rec| 4) . #3#)
                  (COND
                   ((NULL (SPADCALL |i| (QVELT |rec| 1) (QREFELT $ 159)))
                    (LETT |nd| (CONS |da| |nd|) . #3#)))
                  (EXIT
                   (VECTOR (QVELT |rec| 0) (CONS |i| (QVELT |rec| 1))
                           (QVELT |rec| 2) (QVELT |rec| 3) |nd|))))
            ('T
             (SEQ (LETT |i| (SPADCALL |da| |a| (QREFELT $ 148)) . #3#)
                  (LETT |a1| (SPADCALL |a| (QREFELT $ 154)) . #3#)
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
         (SEQ (LETT |a1| (SPADCALL |k1| (QREFELT $ 46)) . #5=(|FS-;equaldiff|))
              (LETT |a2| (SPADCALL |k2| (QREFELT $ 46)) . #5#)
              (LETT |res|
                    (SPADCALL (SPADCALL |k1| (QREFELT $ 44))
                              (SPADCALL |k2| (QREFELT $ 44)) (QREFELT $ 229))
                    . #5#)
              (EXIT
               (COND
                (|res|
                 (SEQ
                  (LETT |res|
                        (SPADCALL (SPADCALL |a1| 3 (QREFELT $ 155))
                                  (SPADCALL |a2| 3 (QREFELT $ 155))
                                  (QREFELT $ 165))
                        . #5#)
                  (EXIT
                   (COND
                    (|res|
                     (COND
                      ((SPADCALL (SPADCALL |a1| 2 (QREFELT $ 155))
                                 (SPADCALL |a2| 2 (QREFELT $ 155))
                                 (QREFELT $ 165))
                       (SPADCALL (SPADCALL |a1| 1 (QREFELT $ 155))
                                 (SPADCALL |a2| 1 (QREFELT $ 155))
                                 (QREFELT $ 165)))
                      (#6='T
                       (SEQ (LETT |r1| (|FS-;decode_diff| |a1| $) . #5#)
                            (LETT |r2| (|FS-;decode_diff| |a2| $) . #5#)
                            (COND
                             ((NULL
                               (SPADCALL
                                (SPADCALL (QVELT |r1| 0) (QREFELT $ 44))
                                (SPADCALL (QVELT |r2| 0) (QREFELT $ 44))
                                (QREFELT $ 229)))
                              (EXIT NIL)))
                            (COND
                             ((NULL
                               (SPADCALL (QVELT |r1| 1) (QVELT |r2| 1)
                                         (QREFELT $ 230)))
                              (EXIT NIL)))
                            (COND
                             ((NULL
                               (SPADCALL (QVELT |r1| 3) (QVELT |r2| 3)
                                         (QREFELT $ 231)))
                              (EXIT NIL)))
                            (LETT |od|
                                  (PROGN
                                   (LETT #2# NIL . #5#)
                                   (SEQ (LETT |dk| NIL . #5#)
                                        (LETT #1# (QVELT |r1| 4) . #5#) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |dk| (CAR #1#) . #5#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL |dk| (QREFELT $ 28))
                                                 #2#)
                                                . #5#)))
                                        (LETT #1# (CDR #1#) . #5#) (GO G190)
                                        G191 (EXIT (NREVERSE #2#))))
                                  . #5#)
                            (LETT |ok1|
                                  (SPADCALL (QVELT |r1| 0) (QREFELT $ 26))
                                  . #5#)
                            (LETT |sk1|
                                  (SPADCALL |ok1| |od| (QVELT |r2| 4)
                                            (QREFELT $ 200))
                                  . #5#)
                            (EXIT
                             (SPADCALL |sk1|
                                       (SPADCALL (QVELT |r2| 0) (QREFELT $ 26))
                                       (QREFELT $ 165)))))))
                    (#6# (|FS-;debugA| |a1| |a2| |res| $))))))
                (#6# (|FS-;debugA| |a1| |a2| |res| $))))))) 

(SDEFUN |FS-;mainKernel;SU;58| ((|x| S) ($ |Union| (|Kernel| S) "failed"))
        (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 112))) 

(SDEFUN |FS-;kernels;SL;59| ((|x| S) ($ |List| (|Kernel| S)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 183))) 

(SDEFUN |FS-;retract;SR;60| ((|x| S) ($ R))
        (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 234))) 

(SDEFUN |FS-;retract;SP;61| ((|x| S) ($ |Polynomial| R))
        (SPROG ((#1=#:G590 NIL))
               (PROG2
                   (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 90)) $)
                         |FS-;retract;SP;61|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                 (|Union| (|Polynomial| (QREFELT $ 7))
                                          "failed")
                                 #1#)))) 

(SDEFUN |FS-;retractIfCan;SU;62| ((|x| S) ($ |Union| R "failed"))
        (CONS 0 (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 234)))) 

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
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 246))
                . #3=(|FS-;isPlus;SU;69|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (PROGN
                         (LETT #2# NIL . #3#)
                         (SEQ (LETT |p| NIL . #3#) (LETT #1# (QCDR |u|) . #3#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |p| (QREFELT $ 87)) #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |FS-;isTimes;SU;70| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPROG
         ((#1=#:G630 NIL) (|p| NIL) (#2=#:G629 NIL)
          (|u|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| S)))
                    "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 248))
                . #3=(|FS-;isTimes;SU;70|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (PROGN
                         (LETT #2# NIL . #3#)
                         (SEQ (LETT |p| NIL . #3#) (LETT #1# (QCDR |u|) . #3#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |p| (QREFELT $ 87)) #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
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
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 252))
                . #1=(|FS-;isExpt;SU;71|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |r| (QCDR |u|) . #1#)
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
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 252))
                . #1=(|FS-;isPower;SU;72|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |r| (QCDR |u|) . #1#)
                       (EXIT
                        (CONS 0
                              (CONS (SPADCALL (QCAR |r|) (QREFELT $ 26))
                                    (QCDR |r|))))))))))) 

(SDEFUN |FS-;convert;SP;73| ((|x| S) ($ |Pattern| (|Integer|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 258))) 

(SDEFUN |FS-;convert;SP;74| ((|x| S) ($ |Pattern| (|Float|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 261))) 

(SDEFUN |FS-;isMult;SU;75|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S)))
          "failed"))
        (|FS-;smpIsMult| (SPADCALL |x| (QREFELT $ 90)) $)) 

(SDEFUN |FS-;*;R2S;76| ((|r| R) (|x| S) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |r| (QREFELT $ 266)) (QREFELT $ 87)) |x|
                  (QREFELT $ 134))) 

(SDEFUN |FS-;mainKernel;SU;77| ((|x| S) ($ |Union| (|Kernel| S) "failed"))
        (SPADCALL |x| (QREFELT $ 269))) 

(SDEFUN |FS-;kernels;SL;78| ((|x| S) ($ |List| (|Kernel| S)))
        (SPADCALL |x| (QREFELT $ 270))) 

(SDEFUN |FS-;univariate;SKF;79|
        ((|x| S) (|k| |Kernel| S)
         ($ |Fraction| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |x| |k| (QREFELT $ 272))) 

(SDEFUN |FS-;isPlus;SU;80| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPADCALL |x| (QREFELT $ 276))) 

(SDEFUN |FS-;isTimes;SU;81| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPADCALL |x| (QREFELT $ 277))) 

(SDEFUN |FS-;isExpt;SU;82|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |var| (|Kernel| S)) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPADCALL |x| (QREFELT $ 280))) 

(SDEFUN |FS-;isPower;SU;83|
        ((|x| S)
         ($ |Union| (|Record| (|:| |val| S) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPADCALL |x| (QREFELT $ 283))) 

(SDEFUN |FS-;denominator;2S;84| ((|x| S) ($ S))
        (SPADCALL (SPADCALL |x| (QREFELT $ 284)) (QREFELT $ 87))) 

(SDEFUN |FS-;coerce;FS;85| ((|q| |Fraction| R) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 287)) (QREFELT $ 266))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 288)) (QREFELT $ 266))
                  (QREFELT $ 289))) 

(SDEFUN |FS-;coerce;FS;86| ((|q| |Fraction| (|Polynomial| R)) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 292)) (QREFELT $ 293))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 294)) (QREFELT $ 293))
                  (QREFELT $ 295))) 

(SDEFUN |FS-;coerce;FS;87|
        ((|q| |Fraction| (|Polynomial| (|Fraction| R))) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 299)) (QREFELT $ 300))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 301)) (QREFELT $ 300))
                  (QREFELT $ 295))) 

(SDEFUN |FS-;retract;SP;88| ((|x| S) ($ |Polynomial| R))
        (SPADCALL (SPADCALL |x| (QREFELT $ 303)) (QREFELT $ 304))) 

(SDEFUN |FS-;retract;SF;89| ((|x| S) ($ |Fraction| (|Polynomial| R)))
        (SPROG ((#1=#:G699 NIL))
               (SPADCALL
                (PROG2
                    (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 90)) $)
                          . #2=(|FS-;retract;SF;89|))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                  (|Union| (|Polynomial| (QREFELT $ 7))
                                           #3="failed")
                                  #1#))
                (PROG2
                    (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 284)) $)
                          . #2#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                  (|Union| (|Polynomial| (QREFELT $ 7)) #3#)
                                  #1#))
                (QREFELT $ 305)))) 

(SDEFUN |FS-;retract;SR;90| ((|x| S) ($ R))
        (SPROG ((#1=#:G703 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| (QREFELT $ 90))
                                    (QREFELT $ 234))
                          (SPADCALL (SPADCALL |x| (QREFELT $ 284))
                                    (QREFELT $ 234))
                          (QREFELT $ 308))
                         |FS-;retract;SR;90|)
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
         (SEQ (LETT |resl| NIL . #8=(|FS-;alg_ker_set|)) (LETT |ak1| NIL . #8#)
              (SEQ (LETT |x| NIL . #8#) (LETT #7# |lx| . #8#) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |x| (CAR #7#) . #8#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |k| NIL . #8#)
                          (LETT #6# (SPADCALL |x| (QREFELT $ 309)) . #8#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |k| (CAR #6#) . #8#) NIL))
                            (GO G191)))
                          (SEQ
                           (COND
                            ((NULL (SPADCALL |k| '|nthRoot| (QREFELT $ 220)))
                             (COND
                              ((NULL (SPADCALL |k| '|rootOf| (QREFELT $ 220)))
                               (EXIT "iterate")))))
                           (EXIT (LETT |ak1| (CONS |k| |ak1|) . #8#)))
                          (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
              (SEQ G190 (COND ((NULL (NULL (NULL |ak1|))) (GO G191)))
                   (SEQ (LETT |ak| |ak1| . #8#) (LETT |ak1| NIL . #8#)
                        (EXIT
                         (SEQ (LETT |k| NIL . #8#) (LETT #5# |ak| . #8#) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |k| (CAR #5#) . #8#) NIL))
                                (GO G191)))
                              (SEQ (LETT |needed| 'T . #8#)
                                   (SEQ (LETT |k1| NIL . #8#)
                                        (LETT #4# |resl| . #8#) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN
                                               (LETT |k1| (CAR #4#) . #8#)
                                               NIL)
                                              (NULL |needed|))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((EQ |k1| |k|)
                                            (LETT |needed| NIL . #8#)))))
                                        (LETT #4# (CDR #4#) . #8#) (GO G190)
                                        G191 (EXIT NIL))
                                   (SEQ (LETT |k1| NIL . #8#)
                                        (LETT #3# |resl| . #8#) G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN
                                               (LETT |k1| (CAR #3#) . #8#)
                                               NIL)
                                              (NULL |needed|))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |k1| |k| (QREFELT $ 310))
                                            (LETT |needed| NIL . #8#)))))
                                        (LETT #3# (CDR #3#) . #8#) (GO G190)
                                        G191 (EXIT NIL))
                                   (EXIT
                                    (COND
                                     (|needed|
                                      (SEQ
                                       (LETT |resl| (CONS |k| |resl|) . #8#)
                                       (LETT |ak1| (CONS |k| |ak1|) . #8#)
                                       (LETT |arg|
                                             (SPADCALL |k| (QREFELT $ 46))
                                             . #8#)
                                       (EXIT
                                        (SEQ (LETT |k1| NIL . #8#)
                                             (LETT #2#
                                                   (SPADCALL
                                                    (SPADCALL |arg| 1
                                                              (QREFELT $ 155))
                                                    (QREFELT $ 309))
                                                   . #8#)
                                             G190
                                             (COND
                                              ((OR (ATOM #2#)
                                                   (PROGN
                                                    (LETT |k1| (CAR #2#) . #8#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((OR
                                                  (SPADCALL |k1| '|nthRoot|
                                                            (QREFELT $ 220))
                                                  (SPADCALL |k1| '|rootOf|
                                                            (QREFELT $ 220)))
                                                 (LETT |ak1| (CONS |k1| |ak1|)
                                                       . #8#)))))
                                             (LETT #2# (CDR #2#) . #8#)
                                             (GO G190) G191 (EXIT NIL)))))
                                     ('T "iterate"))))
                              (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                              (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |resl|)))) 

(SDEFUN |FS-;algtower;LL;92| ((|lx| |List| S) ($ |List| (|Kernel| S)))
        (NREVERSE (SPADCALL (|FS-;alg_ker_set| |lx| $) (QREFELT $ 311)))) 

(SDEFUN |FS-;algtower;SL;93| ((|x| S) ($ |List| (|Kernel| S)))
        (SPADCALL (LIST |x|) (QREFELT $ 313))) 

(SDEFUN |FS-;coerce;SOf;94| ((|x| S) ($ |OutputForm|))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 284)) (|spadConstant| $ 315)
                    (QREFELT $ 316))
          (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 90)) $))
         ('T
          (SPADCALL (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 90)) $)
                    (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 284)) $)
                    (QREFELT $ 317))))) 

(SDEFUN |FS-;retractIfCan;SU;95| ((|x| S) ($ |Union| R "failed"))
        (SPROG
         ((#1=#:G743 NIL) (|r| (|Union| R "failed"))
          (|d| #2=(|Union| R "failed")) (|n| #2#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |n| (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 195))
                   . #3=(|FS-;retractIfCan;SU;95|))
             (EXIT
              (COND
               ((QEQCAR |n| 1)
                (PROGN (LETT #1# (CONS 1 #4="failed") . #3#) (GO #5=#:G741)))
               (#6='T
                (SEQ
                 (LETT |d|
                       (SPADCALL (SPADCALL |x| (QREFELT $ 284))
                                 (QREFELT $ 195))
                       . #3#)
                 (EXIT
                  (COND
                   ((QEQCAR |d| 1)
                    (PROGN (LETT #1# (CONS 1 #4#) . #3#) (GO #5#)))
                   (#6#
                    (SEQ
                     (LETT |r| (SPADCALL (QCDR |n|) (QCDR |d|) (QREFELT $ 308))
                           . #3#)
                     (EXIT
                      (COND
                       ((QEQCAR |r| 1)
                        (PROGN
                         (LETT #1# (CONS 1 #4#) . #3#)
                         (GO #5#))))))))))))))
            (EXIT (CONS 0 (QCDR |r|)))))
          #5# (EXIT #1#)))) 

(SDEFUN |FS-;eval;SLLLS;96|
        ((|x| S) (|s| |List| (|Symbol|)) (|n| |List| (|NonNegativeInteger|))
         (|f| |List| (|Mapping| S (|List| S))) ($ S))
        (SPADCALL (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 90)) $)
                  (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 284)) $)
                  (QREFELT $ 295))) 

(SDEFUN |FS-;differentiate;SSS;97| ((|f| S) (|x| |Symbol|) ($ S))
        (SPADCALL
         (SPADCALL
          (SPADCALL (|FS-;smpderiv| (SPADCALL |f| (QREFELT $ 90)) |x| $)
                    (SPADCALL (SPADCALL |f| (QREFELT $ 284)) (QREFELT $ 87))
                    (QREFELT $ 134))
          (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 90)) (QREFELT $ 87))
                    (|FS-;smpderiv| (SPADCALL |f| (QREFELT $ 284)) |x| $)
                    (QREFELT $ 134))
          (QREFELT $ 318))
         (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 284)) (QREFELT $ 87)) 2
                   (QREFELT $ 319))
         (QREFELT $ 295))) 

(SDEFUN |FS-;eval;SLLS;98|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPADCALL (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 90)) |lk| |lv| $)
                  (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 284)) |lk| |lv| $)
                  (QREFELT $ 295))) 

(SDEFUN |FS-;subst;SLLS;99|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPADCALL (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 90)) |lk| |lv| $)
                  (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 284)) |lk| |lv| $)
                  (QREFELT $ 295))) 

(SDEFUN |FS-;par| ((|x| S) ($ S))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 18)) |FS-;par|)
                    (EXIT
                     (COND ((QEQCAR |r| 0) |x|)
                           ('T (SPADCALL |x| (QREFELT $ 320)))))))) 

(SDEFUN |FS-;convert;FS;101| ((|x| |Factored| S) ($ S))
        (SPROG
         ((#1=#:G764 NIL) (#2=#:G763 (S)) (#3=#:G765 (S)) (#4=#:G767 NIL)
          (|f| NIL))
         (SEQ
          (SPADCALL (|FS-;par| (SPADCALL |x| (QREFELT $ 322)) $)
                    (PROGN
                     (LETT #1# NIL . #5=(|FS-;convert;FS;101|))
                     (SEQ (LETT |f| NIL . #5#)
                          (LETT #4# (SPADCALL |x| (QREFELT $ 326)) . #5#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3#
                                   (SPADCALL (|FS-;par| (QVELT |f| 1) $)
                                             (QVELT |f| 2) (QREFELT $ 319))
                                   . #5#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #3# (QREFELT $ 134))
                                     . #5#))
                              ('T
                               (PROGN
                                (LETT #2# #3# . #5#)
                                (LETT #1# 'T . #5#)))))))
                          (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 144))))
                    (QREFELT $ 134))))) 

(SDEFUN |FS-;retractIfCan;SU;102|
        ((|x| S) ($ |Union| (|Polynomial| R) "failed"))
        (SPROG ((|u| (|Union| (|Fraction| (|Polynomial| R)) "failed")))
               (SEQ
                (LETT |u| (SPADCALL |x| (QREFELT $ 330))
                      |FS-;retractIfCan;SU;102|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T (SPADCALL (QCDR |u|) (QREFELT $ 331)))))))) 

(SDEFUN |FS-;retractIfCan;SU;103|
        ((|x| S) ($ |Union| (|Fraction| (|Polynomial| R)) "failed"))
        (SPROG ((|d| #1=(|Union| (|Polynomial| R) "failed")) (|n| #1#))
               (SEQ
                (LETT |n| (|FS-;smpret| (SPADCALL |x| (QREFELT $ 90)) $)
                      . #2=(|FS-;retractIfCan;SU;103|))
                (EXIT
                 (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                       (#3='T
                        (SEQ
                         (LETT |d|
                               (|FS-;smpret| (SPADCALL |x| (QREFELT $ 284)) $)
                               . #2#)
                         (EXIT
                          (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                (#3#
                                 (CONS 0
                                       (SPADCALL (QCDR |n|) (QCDR |d|)
                                                 (QREFELT $ 305))))))))))))) 

(SDEFUN |FS-;coerce;PS;104| ((|p| |Polynomial| (|Fraction| R)) ($ S))
        (SPADCALL (ELT $ 38) (ELT $ 333) |p| (QREFELT $ 336))) 

(SDEFUN |FS-;coerce;FS;105| ((|x| |Fraction| (|Integer|)) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 339)) (QREFELT $ 340))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 341)) (QREFELT $ 340))
                  (QREFELT $ 289))) 

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
            (SEQ
             (LETT |u| (|FS-;smpIsMult| (SPADCALL |x| (QREFELT $ 90)) $)
                   . #2=(|FS-;isMult;SU;106|))
             (EXIT
              (COND
               ((QEQCAR |u| 1)
                (PROGN (LETT #1# (CONS 1 #3="failed") . #2#) (GO #4=#:G800)))
               (#5='T
                (SEQ
                 (LETT |v|
                       (SPADCALL (SPADCALL |x| (QREFELT $ 284))
                                 (QREFELT $ 195))
                       . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |v| 1)
                    (PROGN (LETT #1# (CONS 1 #3#) . #2#) (GO #4#)))
                   (#5#
                    (SEQ (LETT |w| (SPADCALL (QCDR |v|) (QREFELT $ 227)) . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |w| 1)
                            (PROGN
                             (LETT #1# (CONS 1 #3#) . #2#)
                             (GO #4#))))))))))))))
            (LETT |r| (QCDR |u|) . #2#)
            (LETT |q| (SPADCALL (QCAR |r|) (QCDR |w|) (QREFELT $ 343)) . #2#)
            (EXIT
             (COND ((QEQCAR |q| 1) (CONS 1 "failed"))
                   (#5# (CONS 0 (CONS (QCDR |q|) (QCDR |r|))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |FS-;convert;SP;107| ((|x| S) ($ |Pattern| (|Integer|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 258))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 284)) (QREFELT $ 258))
                  (QREFELT $ 344))) 

(SDEFUN |FS-;convert;SP;108| ((|x| S) ($ |Pattern| (|Float|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 261))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 284)) (QREFELT $ 261))
                  (QREFELT $ 345))) 

(DECLAIM (NOTINLINE |FunctionSpace&;|)) 

(DEFUN |FunctionSpace&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionSpace&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FunctionSpace&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 349) . #1#)
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
                                                               (|InputForm|)))))
                          . #1#))
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
             (QSETREFV $ 190 (CONS (|dispatchFunction| |FS-;coerce;PS;44|) $))
             (QSETREFV $ 219
                       (CONS (|dispatchFunction| |FS-;isExpt;SBoU;52|) $))
             (QSETREFV $ 221 (CONS (|dispatchFunction| |FS-;isExpt;SSU;53|) $))
             (COND ((|testBitVector| |pv$| 1)))
             (SPADCALL (QREFELT $ 15) (CONS (|function| |FS-;diffEval|) $)
                       (QREFELT $ 228))
             (SPADCALL (QREFELT $ 15) '|%specialEqual|
                       (CONS (|function| |FS-;equaldiff|) $) (QREFELT $ 70))
             (SPADCALL (QREFELT $ 15) (QREFELT $ 10)
                       (CONS (|function| |FS-;diffdiff|) $) (QREFELT $ 70))
             (SPADCALL (QREFELT $ 15) '|%specialDisp|
                       (CONS (|function| |FS-;ddiff|) $) (QREFELT $ 70))
             (COND ((|testBitVector| |pv$| 2))
                   ('T
                    (PROGN
                     (QSETREFV $ 232
                               (CONS
                                (|dispatchFunction| |FS-;mainKernel;SU;58|) $))
                     (QSETREFV $ 233
                               (CONS (|dispatchFunction| |FS-;kernels;SL;59|)
                                     $))
                     (QSETREFV $ 235
                               (CONS (|dispatchFunction| |FS-;retract;SR;60|)
                                     $))
                     (QSETREFV $ 236
                               (CONS (|dispatchFunction| |FS-;retract;SP;61|)
                                     $))
                     (QSETREFV $ 237
                               (CONS
                                (|dispatchFunction| |FS-;retractIfCan;SU;62|)
                                $))
                     (QSETREFV $ 239
                               (CONS
                                (|dispatchFunction| |FS-;retractIfCan;SU;63|)
                                $))
                     (QSETREFV $ 240
                               (CONS (|dispatchFunction| |FS-;eval;SLLS;64|)
                                     $))
                     (QSETREFV $ 241
                               (CONS (|dispatchFunction| |FS-;subst;SLLS;65|)
                                     $))
                     (QSETREFV $ 242
                               (CONS
                                (|dispatchFunction| |FS-;differentiate;SSS;66|)
                                $))
                     (QSETREFV $ 243
                               (CONS (|dispatchFunction| |FS-;coerce;SOf;67|)
                                     $))
                     (QSETREFV $ 244
                               (CONS (|dispatchFunction| |FS-;eval;SLLLS;68|)
                                     $))
                     (QSETREFV $ 247
                               (CONS (|dispatchFunction| |FS-;isPlus;SU;69|)
                                     $))
                     (QSETREFV $ 249
                               (CONS (|dispatchFunction| |FS-;isTimes;SU;70|)
                                     $))
                     (QSETREFV $ 253
                               (CONS (|dispatchFunction| |FS-;isExpt;SU;71|)
                                     $))
                     (QSETREFV $ 256
                               (CONS (|dispatchFunction| |FS-;isPower;SU;72|)
                                     $))
                     (COND
                      ((|HasCategory| |#2|
                                      '(|ConvertibleTo|
                                        (|Pattern| (|Integer|))))
                       (QSETREFV $ 259
                                 (CONS (|dispatchFunction| |FS-;convert;SP;73|)
                                       $))))
                     (COND
                      ((|HasCategory| |#2|
                                      '(|ConvertibleTo| (|Pattern| (|Float|))))
                       (QSETREFV $ 262
                                 (CONS (|dispatchFunction| |FS-;convert;SP;74|)
                                       $))))
                     (COND
                      ((|testBitVector| |pv$| 1)
                       (QSETREFV $ 265
                                 (CONS (|dispatchFunction| |FS-;isMult;SU;75|)
                                       $))))))))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 267 (CONS (|dispatchFunction| |FS-;*;R2S;76|) $))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 232
                       (CONS (|dispatchFunction| |FS-;mainKernel;SU;77|) $))
             (QSETREFV $ 233 (CONS (|dispatchFunction| |FS-;kernels;SL;78|) $))
             (QSETREFV $ 274
                       (CONS (|dispatchFunction| |FS-;univariate;SKF;79|) $))
             (QSETREFV $ 247 (CONS (|dispatchFunction| |FS-;isPlus;SU;80|) $))
             (QSETREFV $ 249 (CONS (|dispatchFunction| |FS-;isTimes;SU;81|) $))
             (QSETREFV $ 253 (CONS (|dispatchFunction| |FS-;isExpt;SU;82|) $))
             (QSETREFV $ 256 (CONS (|dispatchFunction| |FS-;isPower;SU;83|) $))
             (QSETREFV $ 285
                       (CONS (|dispatchFunction| |FS-;denominator;2S;84|) $))
             (QSETREFV $ 290 (CONS (|dispatchFunction| |FS-;coerce;FS;85|) $))
             (QSETREFV $ 296 (CONS (|dispatchFunction| |FS-;coerce;FS;86|) $))
             (QSETREFV $ 302 (CONS (|dispatchFunction| |FS-;coerce;FS;87|) $))
             (QSETREFV $ 236 (CONS (|dispatchFunction| |FS-;retract;SP;88|) $))
             (QSETREFV $ 306 (CONS (|dispatchFunction| |FS-;retract;SF;89|) $))
             (QSETREFV $ 235 (CONS (|dispatchFunction| |FS-;retract;SR;90|) $))
             (QSETREFV $ 312
                       (CONS (|dispatchFunction| |FS-;algtower;LL;92|) $))
             (QSETREFV $ 314
                       (CONS (|dispatchFunction| |FS-;algtower;SL;93|) $))
             (QSETREFV $ 243 (CONS (|dispatchFunction| |FS-;coerce;SOf;94|) $))
             (QSETREFV $ 237
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;95|) $))
             (COND
              ((|testBitVector| |pv$| 11)
               (QSETREFV $ 244
                         (CONS (|dispatchFunction| |FS-;eval;SLLLS;96|) $))))
             (QSETREFV $ 242
                       (CONS (|dispatchFunction| |FS-;differentiate;SSS;97|)
                             $))
             (QSETREFV $ 240 (CONS (|dispatchFunction| |FS-;eval;SLLS;98|) $))
             (QSETREFV $ 241 (CONS (|dispatchFunction| |FS-;subst;SLLS;99|) $))
             (QSETREFV $ 328
                       (CONS (|dispatchFunction| |FS-;convert;FS;101|) $))
             (QSETREFV $ 239
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;102|) $))
             (QSETREFV $ 332
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;103|) $))
             (QSETREFV $ 337 (CONS (|dispatchFunction| |FS-;coerce;PS;104|) $))
             (COND
              ((|testBitVector| |pv$| 1)
               (PROGN
                (QSETREFV $ 342
                          (CONS (|dispatchFunction| |FS-;coerce;FS;105|) $))
                (QSETREFV $ 265
                          (CONS (|dispatchFunction| |FS-;isMult;SU;106|) $)))))
             (COND
              ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Integer|))))
               (QSETREFV $ 259
                         (CONS (|dispatchFunction| |FS-;convert;SP;107|) $))))
             (COND
              ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Float|))))
               (QSETREFV $ 262
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
              (494 . |setelt!|) (501 . >) (|List| 120) (507 . |member?|)
              (513 . |first|) (519 . |rest|) (525 . |concat|)
              (531 . |maxIndex|) (536 . |differentiate|) (542 . =)
              (|Union| 126 '"failed") (|BasicOperatorFunctions1| 6)
              (548 . |derivative|) (|Equation| 6) (553 . =) (|Equation| $)
              (559 . |subst|) (565 . |kernel|) (571 . ~=) (577 . ~=)
              (|Polynomial| 7) (583 . |coerce|) (588 . |differentiate|)
              (594 . |retract|) (|Mapping| 7 7) (599 . |map|) (|List| 23)
              (605 . |variables|) (610 . |differentiate|) (616 . |coerce|)
              (|Mapping| 6 12) (|Mapping| 6 7)
              (|PolynomialCategoryLifting| (|IndexedExponents| 12) 12 7 176 6)
              (621 . |map|) (628 . |coerce|) (|Union| 19 '"failed")
              (|UserDefinedPartialOrdering| 12) (633 . |less?|) (639 . <)
              (645 . |retractIfCan|) (650 . |coerce|) (655 . |userOrdered?|)
              (659 . |coerce|) (664 . |outputForm|) (670 . |subst|)
              (|Mapping| 6 23) (|ListToMap| 23 6) (677 . |match|)
              (|PolynomialCategoryLifting| (|IndexedExponents| 23) 23 7 84 6)
              (685 . |map|) (692 . |eval|) (699 . |map|) (705 . |tower|)
              (710 . |setIntersection|) (716 . |empty?|) (721 . |coerce|)
              (|Mapping| 176 23) (|Mapping| 176 7)
              (|PolynomialCategoryLifting| (|IndexedExponents| 23) 23 7 84 176)
              (726 . |map|) (|Record| (|:| |var| 25) (|:| |exponent| 120))
              (|Union| 216 '"failed") (733 . |isExpt|) (738 . |isExpt|)
              (744 . |is?|) (750 . |isExpt|) (756 . |degree|)
              (761 . |reductum|) (766 . |leadingCoefficient|) (771 . |zero?|)
              (|Union| 120 '#1#) (776 . |retractIfCan|) (781 . |evaluate|)
              (787 . =) (793 . =) (799 . =) (805 . |mainKernel|)
              (810 . |kernels|) (815 . |retract|) (820 . |retract|)
              (825 . |retract|) (830 . |retractIfCan|) (|Union| 176 '"failed")
              (835 . |retractIfCan|) (840 . |eval|) (847 . |subst|)
              (854 . |differentiate|) (860 . |coerce|) (865 . |eval|)
              (|Union| 32 '#2="failed") (873 . |isPlus|) (878 . |isPlus|)
              (883 . |isTimes|) (888 . |isTimes|)
              (|Record| (|:| |var| 23) (|:| |exponent| 81)) (|Union| 250 '#2#)
              (893 . |isExpt|) (898 . |isExpt|)
              (|Record| (|:| |val| $) (|:| |exponent| 120))
              (|Union| 254 '"failed") (903 . |isPower|) (|Pattern| 120)
              (908 . |convert|) (913 . |convert|) (|Pattern| (|Float|))
              (918 . |convert|) (923 . |convert|)
              (|Record| (|:| |coef| 120) (|:| |var| 25))
              (|Union| 263 '"failed") (928 . |isMult|) (933 . |coerce|)
              (938 . *)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 23) 23
                                                     7 84 6)
              (944 . |mainVariable|) (949 . |variables|) (|Fraction| 115)
              (954 . |univariate|) (|Fraction| 113) (960 . |univariate|)
              (|Union| 45 '"failed") (966 . |isPlus|) (971 . |isTimes|)
              (|Record| (|:| |var| 23) (|:| |exponent| 120))
              (|Union| 278 '"failed") (976 . |isExpt|)
              (|Record| (|:| |val| 6) (|:| |exponent| 120))
              (|Union| 281 '"failed") (981 . |isPower|) (986 . |denom|)
              (991 . |denominator|) (|Fraction| 7) (996 . |numer|)
              (1001 . |denom|) (1006 . /) (1012 . |coerce|) (|Fraction| 176)
              (1017 . |numer|) (1022 . |coerce|) (1027 . |denom|) (1032 . /)
              (1038 . |coerce|) (|Polynomial| 286) (|Fraction| 297)
              (1043 . |numer|) (1048 . |coerce|) (1053 . |denom|)
              (1058 . |coerce|) (1063 . |retract|) (1068 . |retract|)
              (1073 . /) (1079 . |retract|) (|Union| $ '"failed")
              (1084 . |exquo|) (1090 . |kernels|) (1095 . =) (1101 . |sort!|)
              (1106 . |algtower|) (1111 . |algtower|) (1116 . |algtower|)
              (1121 . |One|) (1125 . =) (1131 . /) (1137 . -) (1143 . ^)
              (1149 . |paren|) (|Factored| 6) (1154 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 323) (|:| |factor| 6) (|:| |exponent| 81))
              (|List| 324) (1159 . |factorList|) (|Factored| $)
              (1164 . |convert|) (|Union| 291 '#1#) (1169 . |retractIfCan|)
              (1174 . |retractIfCan|) (1179 . |retractIfCan|) (1184 . |coerce|)
              (|Mapping| 6 286)
              (|PolynomialCategoryLifting| (|IndexedExponents| 12) 12 286 297
                                           6)
              (1189 . |map|) (1196 . |coerce|) (|Fraction| 120)
              (1201 . |numer|) (1206 . |coerce|) (1211 . |denom|)
              (1216 . |coerce|) (1221 . |exquo|) (1227 . /) (1233 . /)
              (|PositiveInteger|) (|Union| 338 '#1#) (|List| 171))
           '#(|variables| 1239 |univariate| 1249 |subst| 1255 |retractIfCan|
              1262 |retract| 1282 |operator| 1302 |numerator| 1307 |mainKernel|
              1312 |kernels| 1317 |isTimes| 1322 |isPower| 1327 |isPlus| 1332
              |isMult| 1337 |isExpt| 1342 |ground?| 1359 |ground| 1364 |eval|
              1369 |elt| 1431 |differentiate| 1437 |denominator| 1443 |convert|
              1448 |coerce| 1463 |characteristic| 1508 |belong?| 1512
              |applyQuote| 1517 |algtower| 1553 * 1563)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 345
                                                 '(1 13 11 12 14 1 6 17 0 18 1
                                                   6 7 0 21 1 23 0 12 24 1 6 0
                                                   25 26 1 6 25 0 28 1 23 29 0
                                                   30 2 6 0 12 32 33 1 6 0 12
                                                   38 2 6 0 11 32 39 2 11 19 0
                                                   12 41 2 11 19 0 12 42 1 23
                                                   11 0 44 1 23 45 0 46 2 6 0
                                                   11 32 47 1 11 12 0 48 1 12
                                                   49 0 50 1 45 6 0 52 1 45 6 0
                                                   53 3 6 0 0 25 0 54 1 12 55 0
                                                   56 1 55 0 32 57 1 6 55 0 58
                                                   4 6 0 0 59 32 12 60 4 0 0 0
                                                   11 0 12 61 2 63 62 6 12 64 3
                                                   6 0 0 59 66 67 4 0 0 0 59 32
                                                   12 68 3 11 0 0 12 69 70 1 6
                                                   71 32 72 1 6 73 32 75 1 6 77
                                                   0 78 0 7 81 82 0 0 81 83 1
                                                   84 0 23 85 1 6 0 86 87 1 0 0
                                                   25 88 0 12 0 89 1 6 86 0 90
                                                   1 0 0 0 91 1 45 6 0 92 4 6 0
                                                   0 73 93 95 96 4 0 0 0 12 81
                                                   65 97 4 0 0 0 12 81 94 98 2
                                                   93 0 81 81 99 3 0 0 0 73 95
                                                   100 1 11 19 0 101 1 84 7 0
                                                   102 0 7 0 103 2 7 19 0 0 104
                                                   1 6 0 0 105 2 6 0 11 0 106 2
                                                   107 0 11 32 108 2 0 0 11 32
                                                   109 4 0 0 0 73 93 66 110 1
                                                   84 111 0 112 2 84 113 0 23
                                                   114 2 118 115 116 117 119 2
                                                   73 120 12 0 121 1 73 120 0
                                                   122 2 115 6 0 6 123 0 6 0
                                                   124 2 126 125 0 120 127 2 93
                                                   81 0 120 128 0 115 0 129 2
                                                   115 19 0 0 130 1 115 81 0
                                                   131 2 6 0 0 81 132 1 115 6 0
                                                   133 2 6 0 0 0 134 2 6 0 0 0
                                                   135 1 115 0 0 136 1 6 137 0
                                                   138 2 23 19 0 11 139 2 140
                                                   120 137 0 141 3 140 137 0
                                                   120 137 142 1 12 137 0 143 0
                                                   6 0 144 1 45 120 0 145 1 120
                                                   137 0 146 2 137 0 0 0 147 2
                                                   45 120 6 0 148 2 137 0 0 0
                                                   149 2 137 0 0 81 150 2 11
                                                   151 0 12 152 2 137 0 0 32
                                                   153 1 45 0 0 154 2 45 6 0
                                                   120 155 3 45 6 0 120 6 156 2
                                                   120 19 0 0 157 2 158 19 120
                                                   0 159 2 45 0 0 81 160 2 45 0
                                                   0 81 161 2 45 0 0 0 162 1 45
                                                   120 0 163 2 6 0 0 12 164 2 6
                                                   19 0 0 165 1 167 166 11 168
                                                   2 169 0 6 6 170 2 6 0 0 171
                                                   172 2 6 0 11 0 173 2 81 19 0
                                                   0 174 2 6 19 0 0 175 1 176 0
                                                   7 177 2 176 0 0 12 178 1 176
                                                   7 0 179 2 84 0 180 0 181 1
                                                   84 182 0 183 2 84 0 0 23 184
                                                   1 6 0 7 185 3 188 6 186 187
                                                   176 189 1 0 0 176 190 2 192
                                                   191 12 12 193 2 23 19 0 0
                                                   194 1 84 17 0 195 1 7 137 0
                                                   196 0 192 19 197 1 23 137 0
                                                   198 2 115 137 0 137 199 3 6
                                                   0 0 71 32 200 4 202 6 182 45
                                                   23 201 203 3 204 6 201 187
                                                   84 205 3 6 0 0 71 32 206 2 6
                                                   0 65 25 207 1 6 71 0 208 2
                                                   182 0 0 0 209 1 182 19 0 210
                                                   1 176 0 12 211 3 214 176 212
                                                   213 84 215 1 6 217 0 218 2 0
                                                   217 0 11 219 2 23 19 0 12
                                                   220 2 0 217 0 12 221 1 117
                                                   81 0 222 1 117 0 0 223 1 117
                                                   84 0 224 1 84 19 0 225 1 7
                                                   226 0 227 2 167 11 11 125
                                                   228 2 11 19 0 0 229 2 158 19
                                                   0 0 230 2 45 19 0 0 231 1 0
                                                   77 0 232 1 0 71 0 233 1 84 7
                                                   0 234 1 0 7 0 235 1 0 176 0
                                                   236 1 0 17 0 237 1 0 238 0
                                                   239 3 0 0 0 71 32 240 3 0 0
                                                   0 71 32 241 2 0 0 0 12 242 1
                                                   0 137 0 243 4 0 0 0 73 93 95
                                                   244 1 84 245 0 246 1 0 245 0
                                                   247 1 84 245 0 248 1 0 245 0
                                                   249 1 84 251 0 252 1 0 217 0
                                                   253 1 0 255 0 256 1 84 257 0
                                                   258 1 0 257 0 259 1 84 260 0
                                                   261 1 0 260 0 262 1 0 264 0
                                                   265 1 84 0 7 266 2 0 0 7 0
                                                   267 1 268 111 6 269 1 268
                                                   182 6 270 2 268 271 6 23 272
                                                   2 0 273 0 25 274 1 268 275 6
                                                   276 1 268 275 6 277 1 268
                                                   279 6 280 1 268 282 6 283 1
                                                   6 86 0 284 1 0 0 0 285 1 286
                                                   7 0 287 1 286 7 0 288 2 6 0
                                                   86 86 289 1 0 0 286 290 1
                                                   291 176 0 292 1 6 0 176 293
                                                   1 291 176 0 294 2 6 0 0 0
                                                   295 1 0 0 291 296 1 298 297
                                                   0 299 1 6 0 297 300 1 298
                                                   297 0 301 1 0 0 298 302 1 6
                                                   291 0 303 1 291 176 0 304 2
                                                   291 0 176 176 305 1 0 291 0
                                                   306 2 7 307 0 0 308 1 6 71 0
                                                   309 2 23 19 0 0 310 1 182 0
                                                   0 311 1 0 71 32 312 1 6 71
                                                   32 313 1 0 71 0 314 0 84 0
                                                   315 2 84 19 0 0 316 2 137 0
                                                   0 0 317 2 6 0 0 0 318 2 6 0
                                                   0 120 319 1 6 0 0 320 1 321
                                                   6 0 322 1 321 325 0 326 1 0
                                                   0 327 328 1 6 329 0 330 1
                                                   291 238 0 331 1 0 329 0 332
                                                   1 6 0 286 333 3 335 6 186
                                                   334 297 336 1 0 0 297 337 1
                                                   338 120 0 339 1 84 0 120 340
                                                   1 338 120 0 341 1 0 0 338
                                                   342 2 120 307 0 0 343 2 257
                                                   0 0 0 344 2 260 0 0 0 345 1
                                                   0 73 32 74 1 0 73 0 76 2 0
                                                   273 0 25 274 3 0 0 0 71 32
                                                   241 1 0 238 0 239 1 0 329 0
                                                   332 1 0 17 0 237 1 0 29 0 79
                                                   1 0 176 0 236 1 0 291 0 306
                                                   1 0 7 0 235 1 0 12 0 31 1 0
                                                   11 11 51 1 0 0 0 91 1 0 77 0
                                                   232 1 0 71 0 233 1 0 245 0
                                                   249 1 0 255 0 256 1 0 245 0
                                                   247 1 0 264 0 265 2 0 217 0
                                                   12 221 2 0 217 0 11 219 1 0
                                                   217 0 253 1 0 19 0 20 1 0 7
                                                   0 22 4 0 0 0 12 81 65 97 4 0
                                                   0 0 73 93 95 244 4 0 0 0 12
                                                   81 94 98 4 0 0 0 73 93 66
                                                   110 4 0 0 0 59 32 12 68 4 0
                                                   0 0 11 0 12 61 3 0 0 0 73 95
                                                   100 3 0 0 0 71 32 240 2 0 0
                                                   11 32 109 2 0 0 0 12 242 1 0
                                                   0 0 285 1 0 0 327 328 1 0
                                                   257 0 259 1 0 260 0 262 1 0
                                                   0 176 190 1 0 0 338 342 1 0
                                                   0 291 296 1 0 0 297 337 1 0
                                                   0 298 302 1 0 0 286 290 1 0
                                                   0 12 27 1 0 137 0 243 1 0 0
                                                   25 88 0 0 81 83 1 0 19 11 43
                                                   2 0 0 12 32 40 4 0 0 12 0 0
                                                   0 36 5 0 0 12 0 0 0 0 37 3 0
                                                   0 12 0 0 35 2 0 0 12 0 34 1
                                                   0 71 32 312 1 0 71 0 314 2 0
                                                   0 7 0 267)))))
           '|lookupComplete|)) 
