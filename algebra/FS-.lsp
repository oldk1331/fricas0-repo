
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
         (#1# 'NIL))) 

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

(SDEFUN |FS-;eval;SSS;16| ((|f| S) (|s| |Symbol|) ($ S))
        (SPADCALL |f| (LIST |s|) (QREFELT $ 60))) 

(SDEFUN |FS-;eval;SBoSSS;17|
        ((|f| S) (|s| |BasicOperator|) (|g| S) (|x| |Symbol|) ($ S))
        (SPADCALL |f| (LIST |s|) (LIST |g|) |x| (QREFELT $ 63))) 

(SDEFUN |FS-;eval;SLLSS;18|
        ((|f| S) (|ls| |List| (|BasicOperator|)) (|lg| |List| S) (|x| |Symbol|)
         ($ S))
        (SPROG ((#1=#:G189 NIL) (|g| NIL) (#2=#:G188 NIL))
               (SEQ
                (SPADCALL |f| |ls|
                          (PROGN
                           (LETT #2# NIL . #3=(|FS-;eval;SLLSS;18|))
                           (SEQ (LETT |g| NIL . #3#) (LETT #1# |lg| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |g| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |g| |x| (QREFELT $ 67))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 70))))) 

(SDEFUN |FS-;variables;SL;19| ((|x| S) ($ |List| (|Symbol|)))
        (SPROG
         ((|l| (|List| (|Symbol|))) (|s| (|Union| (|Symbol|) "failed"))
          (#1=#:G199 NIL) (|k| NIL))
         (SEQ (LETT |l| NIL . #2=(|FS-;variables;SL;19|))
              (SEQ (LETT |k| NIL . #2#)
                   (LETT #1# (SPADCALL |x| (QREFELT $ 75)) . #2#) G190
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
        (SPROG ((#1=#:G233 NIL) (|x| (S)) (|od?| (|Boolean|)))
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
                           (GO #3=#:G231))))))))))
                  (EXIT (SPADCALL |op| |args| (QREFELT $ 108)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FS-;eval;SLLLS;29|
        ((|x| S) (|s| |List| (|Symbol|)) (|n| |List| (|NonNegativeInteger|))
         (|l| |List| (|Mapping| S S)) ($ S))
        (SPROG ((#1=#:G238 NIL) (|f| NIL) (#2=#:G237 NIL))
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
          (|n| (|Integer|)) (|g| (S)) (|arg| (|List| S)) (#1=#:G267 NIL)
          (#2=#:G266 NIL) (|op| (|BasicOperator|)) (|k| (|Kernel| S))
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
         ((|m| (|List| (|OutputForm|))) (#1=#:G280 NIL) (|x| NIL)
          (#2=#:G279 NIL) (|i| (|Integer|))
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
         ((|res| (S)) (|kk| NIL) (#1=#:G302 NIL) (|i| #2=(|Integer|))
          (#3=#:G303 NIL) (|k| (|Integer|)) (#4=#:G304 NIL) (|pt| NIL)
          (#5=#:G305 NIL) (|dm| NIL) (|pts| (|List| S)) (#6=#:G300 NIL)
          (#7=#:G301 NIL) (|nargs| (|List| S)) (|li| (|List| (|Integer|)))
          (|lk| (|List| (|Integer|))) (|ii| #2#))
         (SEQ (LETT |li| NIL . #8=(|FS-;encode_diff|)) (LETT |lk| NIL . #8#)
              (LETT |i| (|SPADfirst| |nsub|) . #8#) (LETT |k| 1 . #8#)
              (LETT |nsub| (CDR |nsub|) . #8#)
              (SEQ G190
                   (COND
                    ((NULL (COND ((NULL |nsub|) 'NIL) ('T 'T))) (GO G191)))
                   (SEQ (LETT |ii| (|SPADfirst| |nsub|) . #8#)
                        (LETT |nsub| (CDR |nsub|) . #8#)
                        (EXIT
                         (COND ((EQL |ii| |i|) (LETT |k| (+ |k| 1) . #8#))
                               ('T
                                (SEQ (LETT |lk| (CONS |k| |lk|) . #8#)
                                     (LETT |li| (CONS |i| |li|) . #8#)
                                     (LETT |i| |ii| . #8#)
                                     (EXIT (LETT |k| 1 . #8#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |lk| (CONS |k| |lk|) . #8#)
              (LETT |li| (CONS |i| |li|) . #8#)
              (LETT |nargs| (SPADCALL |args| (QREFELT $ 154)) . #8#)
              (LETT |pts| NIL . #8#)
              (SEQ (LETT |dm| NIL . #8#) (LETT #7# |nd| . #8#)
                   (LETT |i| NIL . #8#) (LETT #6# (REVERSE |li|) . #8#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#) . #8#) NIL)
                         (ATOM #7#) (PROGN (LETT |dm| (CAR #7#) . #8#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |pts|
                          (CONS (SPADCALL |nargs| |i| (QREFELT $ 155)) |pts|)
                          . #8#)
                    (EXIT (SPADCALL |nargs| |i| |dm| (QREFELT $ 156))))
                   (LETT #6# (PROG1 (CDR #6#) (LETT #7# (CDR #7#) . #8#))
                         . #8#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |res|
                    (SPADCALL (SPADCALL |ker| (QREFELT $ 44)) |nargs|
                              (QREFELT $ 47))
                    . #8#)
              (SEQ (LETT |dm| NIL . #8#) (LETT #5# (REVERSE |nd|) . #8#)
                   (LETT |pt| NIL . #8#) (LETT #4# |pts| . #8#)
                   (LETT |k| NIL . #8#) (LETT #3# |lk| . #8#)
                   (LETT |i| NIL . #8#) (LETT #1# |li| . #8#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #8#) NIL)
                         (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #8#) NIL)
                         (ATOM #4#) (PROGN (LETT |pt| (CAR #4#) . #8#) NIL)
                         (ATOM #5#) (PROGN (LETT |dm| (CAR #5#) . #8#) NIL))
                     (GO G191)))
                   (SEQ
                    (SEQ (LETT |kk| 2 . #8#) G190
                         (COND ((|greater_SI| |kk| |k|) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL (QREFELT $ 15)
                                           (LIST |res| |dm| |dm|)
                                           (QREFELT $ 47))
                                 . #8#)))
                         (LETT |kk| (|inc_SI| |kk|) . #8#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (LETT |res|
                           (SPADCALL (QREFELT $ 15) (LIST |res| |dm| |pt|)
                                     (QREFELT $ 47))
                           . #8#)))
                   (LETT #1#
                         (PROG1 (CDR #1#)
                           (LETT #3#
                                 (PROG1 (CDR #3#)
                                   (LETT #4#
                                         (PROG1 (CDR #4#)
                                           (LETT #5# (CDR #5#) . #8#))
                                         . #8#))
                                 . #8#))
                         . #8#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FS-;insert_sub|
        ((|lsub| |List| (|Integer|)) (|j| |Integer|) ($ |List| (|Integer|)))
        (SPROG
         ((|nsub| (|List| (|Integer|))) (|to_insert| (|Boolean|))
          (#1=#:G311 NIL) (|i| NIL))
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
                             (EXIT (LETT |to_insert| 'NIL . #2#)))))))
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
          (|k| (|NonNegativeInteger|)) (#2=#:G318 NIL) (#3=#:G319 NIL)
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
                            (PROGN (LETT #2# |$NoValue| . #4#) (GO #5=#:G313)))
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
         ((|res| (S)) (|db| (S)) (#1=#:G325 NIL) (|i| NIL) (#2=#:G326 NIL)
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
        (SPROG ((#1=#:G328 NIL))
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
          (|op| (|BasicOperator|)) (#1=#:G361 NIL) (|k| (|Kernel| S))
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
                     (GO #3=#:G359)))
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
        (SPROG ((|i| NIL) (#1=#:G371 NIL) (|g| (S)))
               (SEQ
                (COND
                 ((EQL |n| 1)
                  (SEQ
                   (LETT |g|
                         (SPADCALL (|FS-;symsub| (QREFELT $ 80) |n| $)
                                   (QREFELT $ 38))
                         . #2=(|FS-;opderiv|))
                   (EXIT
                    (LIST
                     (CONS #'|FS-;opderiv!0|
                           (VECTOR $ |g| |op| (QREFELT $ 15)))))))
                 ('T
                  (PROGN
                   (LETT #1# NIL . #2#)
                   (SEQ (LETT |i| 1 . #2#) G190
                        (COND ((|greater_SI| |i| |n|) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #1#
                                (CONS
                                 (CONS #'|FS-;opderiv!1|
                                       (VECTOR $ |i| |op| (QREFELT $ 15)))
                                 #1#)
                                . #2#)))
                        (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                        (EXIT (NREVERSE #1#))))))))) 

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

(SDEFUN |FS-;kderiv| ((|k| |Kernel| S) ($ |List| S))
        (SPROG
         ((#1=#:G383 NIL) (|g| NIL) (#2=#:G382 NIL)
          (|grad| (|List| (|Mapping| S (|List| S))))
          (|u| (|Union| (|List| (|Mapping| S (|List| S))) "failed"))
          (|op| (|BasicOperator|)) (|n| (|NonNegativeInteger|))
          (|args| (|List| S)))
         (SEQ
          (COND
           ((ZEROP
             (LETT |n|
                   (LENGTH
                    (LETT |args| (SPADCALL |k| (QREFELT $ 46))
                          . #3=(|FS-;kderiv|)))
                   . #3#))
            NIL)
           (#4='T
            (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 44)) . #3#)
                 (LETT |grad|
                       (SEQ (LETT |u| (SPADCALL |op| (QREFELT $ 168)) . #3#)
                            (EXIT
                             (COND ((QEQCAR |u| 1) (|FS-;opderiv| |op| |n| $))
                                   (#4# (QCDR |u|)))))
                       . #3#)
                 (COND
                  ((SPADCALL (LENGTH |grad|) |n| (QREFELT $ 174))
                   (LETT |grad| (|FS-;opderiv| |op| |n| $) . #3#)))
                 (EXIT
                  (PROGN
                   (LETT #2# NIL . #3#)
                   (SEQ (LETT |g| NIL . #3#) (LETT #1# |grad| . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |g| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |args| |g|) #2#) . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |FS-;kerderiv| ((|k| |Kernel| S) (|x| |Symbol|) ($ S))
        (SPROG
         ((#1=#:G393 NIL) (#2=#:G392 (S)) (#3=#:G394 (S)) (#4=#:G398 NIL)
          (|g| NIL) (#5=#:G399 NIL) (|y| NIL)
          (|fn| (|Union| (|None|) "failed"))
          (|v| (|Union| (|Symbol|) "failed")))
         (SEQ (LETT |v| (SPADCALL |k| (QREFELT $ 30)) . #6=(|FS-;kerderiv|))
              (EXIT
               (COND
                ((QEQCAR |v| 0)
                 (COND ((EQUAL (QCDR |v|) |x|) (|spadConstant| $ 144))
                       (#7='T (|spadConstant| $ 124))))
                (#7#
                 (SEQ
                  (LETT |fn|
                        (SPADCALL (SPADCALL |k| (QREFELT $ 44)) (QREFELT $ 10)
                                  (QREFELT $ 152))
                        . #6#)
                  (EXIT
                   (COND
                    ((QEQCAR |fn| 0)
                     (SPADCALL (SPADCALL |k| (QREFELT $ 46)) |x| (QCDR |fn|)))
                    (#7#
                     (PROGN
                      (LETT #1# NIL . #6#)
                      (SEQ (LETT |y| NIL . #6#)
                           (LETT #5# (SPADCALL |k| (QREFELT $ 46)) . #6#)
                           (LETT |g| NIL . #6#)
                           (LETT #4# (|FS-;kderiv| |k| $) . #6#) G190
                           (COND
                            ((OR (ATOM #4#)
                                 (PROGN (LETT |g| (CAR #4#) . #6#) NIL)
                                 (ATOM #5#)
                                 (PROGN (LETT |y| (CAR #5#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #3#
                                    (SPADCALL |g|
                                              (SPADCALL |y| |x|
                                                        (QREFELT $ 164))
                                              (QREFELT $ 134))
                                    . #6#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #3# (QREFELT $ 135))
                                      . #6#))
                               ('T
                                (PROGN
                                 (LETT #2# #3# . #6#)
                                 (LETT #1# 'T . #6#)))))))
                           (LETT #4#
                                 (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #6#))
                                 . #6#)
                           (GO G190) G191 (EXIT NIL))
                      (COND (#1# #2#) (#7# (|spadConstant| $ 124)))))))))))))) 

(SDEFUN |FS-;smpderiv|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S)) (|x| |Symbol|)
         ($ S))
        (SPROG
         ((#1=#:G426 NIL) (#2=#:G425 (S)) (#3=#:G427 (S)) (#4=#:G429 NIL)
          (|k| NIL))
         (SEQ
          (SPADCALL
           (SPADCALL
            (SPADCALL (CONS #'|FS-;smpderiv!0| (VECTOR |x| $)) |p|
                      (QREFELT $ 180))
            (QREFELT $ 87))
           (PROGN
            (LETT #1# NIL . #5=(|FS-;smpderiv|))
            (SEQ (LETT |k| NIL . #5#)
                 (LETT #4# (SPADCALL |p| (QREFELT $ 182)) . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |k| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #3#
                          (SPADCALL
                           (SPADCALL (SPADCALL |p| |k| (QREFELT $ 183))
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
                       (QREFELT $ 192))
                      |FS-;worse?|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (SPADCALL |k1| |k2| (QREFELT $ 193)))
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
        (SPROG ((|a| (|Kernel| S)) (#1=#:G443 NIL) (|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |p| (QREFELT $ 194)) . #2=(|FS-;smp2O|))
                (EXIT
                 (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 195)))
                       (#3='T
                        (SEQ
                         (LETT |a|
                               (COND
                                ((SPADCALL (QREFELT $ 196))
                                 (|FS-;bestKernel|
                                  (SPADCALL |p| (QREFELT $ 182)) $))
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
                             (QREFELT $ 202))))))) 

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
          (RETURN (PROGN (SPADCALL |s| |lk| |lv| (QREFELT $ 199)))))) 

(SDEFUN |FS-;smpeval|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S))
         (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|FS-;smpeval!2| (VECTOR $ |lv| |lk|))
                         (ELT $ 184) |p| (QREFELT $ 204)))) 

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
                             (QREFELT $ 202))))))) 

(SDEFUN |FS-;smpeval!1| ((|z| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT |lk| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|FS-;smpeval!0| (VECTOR $ |lv| |lk|)) |z|
                             (QREFELT $ 206))))))) 

(SDEFUN |FS-;smpeval!0| ((|s| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |s| |lk| |lv| (QREFELT $ 205)))))) 

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
                                 (QREFELT $ 75))
                       |lk| (QREFELT $ 207))
                      (QREFELT $ 208))
                     |f|)
                    ('T (SPADCALL |k| |fn|)))))))) 

(SDEFUN |FS-;pushunq| ((|l| |List| (|Symbol|)) (|arg| |List| S) ($ |List| S))
        (SPROG
         ((#1=#:G500 NIL) (|a| NIL) (#2=#:G499 NIL) (#3=#:G498 NIL)
          (#4=#:G497 NIL))
         (SEQ
          (COND
           ((NULL |l|)
            (PROGN
             (LETT #4# NIL . #5=(|FS-;pushunq|))
             (SEQ (LETT |a| NIL . #5#) (LETT #3# |arg| . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4# (CONS (SPADCALL |a| (QREFELT $ 209)) #4#)
                          . #5#)))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#)))))
           ('T
            (PROGN
             (LETT #2# NIL . #5#)
             (SEQ (LETT |a| NIL . #5#) (LETT #1# |arg| . #5#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |a| |l| (QREFELT $ 60)) #2#)
                          . #5#)))
                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |FS-;kunq|
        ((|k| |Kernel| S) (|l| |List| (|Symbol|)) (|givenlist?| |Boolean|)
         ($ S))
        (SPROG ((#1=#:G550 NIL) (|a| NIL) (#2=#:G549 NIL) (|s| (|Symbol|)))
               (SEQ
                (COND
                 (|givenlist?|
                  (COND ((NULL |l|) (EXIT (SPADCALL |k| (QREFELT $ 26)))))))
                (COND
                 ((SPADCALL |k| (QREFELT $ 16) (QREFELT $ 139))
                  (COND
                   ((OR
                     (SPADCALL
                      (LETT |s|
                            (SPADCALL
                             (|SPADfirst| (SPADCALL |k| (QREFELT $ 46)))
                             (QREFELT $ 210))
                            . #3=(|FS-;kunq|))
                      |l| (QREFELT $ 211))
                     (NULL |l|))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (CONS (SPADCALL |s| (QREFELT $ 56))
                             (PROGN
                              (LETT #2# NIL . #3#)
                              (SEQ (LETT |a| NIL . #3#)
                                   (LETT #1#
                                         (|FS-;pushunq| |l|
                                          (CDR (SPADCALL |k| (QREFELT $ 46)))
                                          $)
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
                                           (CONS (SPADCALL |a| (QREFELT $ 58))
                                                 #2#)
                                           . #3#)))
                                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                   (EXIT (NREVERSE #2#)))))
                       (QREFELT $ 57))
                      (QREFELT $ 213)))))))
                (EXIT
                 (SPADCALL (SPADCALL |k| (QREFELT $ 44))
                           (|FS-;pushunq| |l| (SPADCALL |k| (QREFELT $ 46)) $)
                           (QREFELT $ 39)))))) 

(SDEFUN |FS-;smpunq|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S))
         (|l| |List| (|Symbol|)) (|givenlist?| |Boolean|) ($ S))
        (SPROG NIL
               (SEQ
                (COND
                 (|givenlist?|
                  (COND ((NULL |l|) (EXIT (SPADCALL |p| (QREFELT $ 87)))))))
                (EXIT
                 (SPADCALL (CONS #'|FS-;smpunq!0| (VECTOR $ |givenlist?| |l|))
                           (ELT $ 184) |p| (QREFELT $ 204)))))) 

(SDEFUN |FS-;smpunq!0| ((|x| NIL) ($$ NIL))
        (PROG (|l| |givenlist?| $)
          (LETT |l| (QREFELT $$ 2) . #1=(|FS-;smpunq|))
          (LETT |givenlist?| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FS-;kunq| |x| |l| |givenlist?| $))))) 

(SDEFUN |FS-;smpret|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S))
         ($ |Union| (|Polynomial| R) "failed"))
        (SPROG
         ((#1=#:G559 NIL) (#2=#:G558 #3=(|Boolean|)) (#4=#:G560 #3#)
          (#5=#:G567 NIL) (|k| NIL))
         (SEQ
          (COND
           ((PROGN
             (LETT #1# NIL . #6=(|FS-;smpret|))
             (SEQ (LETT |k| NIL . #6#)
                  (LETT #5# (SPADCALL |p| (QREFELT $ 182)) . #6#) G190
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
             (COND (#1# #2#) (#7='T 'NIL)))
            (CONS 1 "failed"))
           (#7#
            (CONS 0
                  (SPADCALL (CONS #'|FS-;smpret!0| $) (ELT $ 176) |p|
                            (QREFELT $ 218)))))))) 

(SDEFUN |FS-;smpret!0| ((|x| NIL) ($ NIL))
        (SPROG ((#1=#:G562 NIL))
               (SPADCALL
                (PROG2 (LETT #1# (SPADCALL |x| (QREFELT $ 30)) NIL)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                  (|Union| (|Symbol|) "failed") #1#))
                (QREFELT $ 214)))) 

(SDEFUN |FS-;isExpt;SBoU;55|
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
          (LETT |u| (SPADCALL |x| (QREFELT $ 221)) . #2=(|FS-;isExpt;SBoU;55|))
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

(SDEFUN |FS-;isExpt;SSU;56|
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
          (LETT |u| (SPADCALL |x| (QREFELT $ 221)) . #2=(|FS-;isExpt;SSU;56|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |v| (QCAR (QCDR |u|)) . #2#)
                       (COND
                        ((SPADCALL |v| |sy| (QREFELT $ 223))
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
         ((#1=#:G606 NIL) (|n| (|Union| (|Integer|) "failed"))
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
                    (QREFELT $ 225))
                   1)
                  (COND
                   ((SPADCALL
                     (SPADCALL (SPADCALL |q| (QREFELT $ 226)) (QREFELT $ 227))
                     (QREFELT $ 228))
                    (SEQ
                     (LETT |r|
                           (SPADCALL (SPADCALL |q| (QREFELT $ 227))
                                     (QREFELT $ 194))
                           . #2#)
                     (EXIT
                      (COND
                       ((QEQCAR |r| 0)
                        (SEQ
                         (LETT |n| (SPADCALL (QCDR |r|) (QREFELT $ 230)) . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |n| 0)
                            (PROGN
                             (LETT #1# (CONS 0 (CONS (QCDR |n|) (QCDR |u|)))
                                   . #2#)
                             (GO #3=#:G604))))))))))))))))))
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
         ((|sk1| (S)) (|ok1| (S)) (|od| (|List| (|Kernel| S))) (#1=#:G626 NIL)
          (|dk| NIL) (#2=#:G625 NIL)
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
                              (SPADCALL |k2| (QREFELT $ 44)) (QREFELT $ 232))
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
                                (QREFELT $ 232)))
                              (EXIT 'NIL)))
                            (COND
                             ((NULL
                               (SPADCALL (QVELT |r1| 1) (QVELT |r2| 1)
                                         (QREFELT $ 233)))
                              (EXIT 'NIL)))
                            (COND
                             ((NULL
                               (SPADCALL (QVELT |r1| 3) (QVELT |r2| 3)
                                         (QREFELT $ 234)))
                              (EXIT 'NIL)))
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
                                            (QREFELT $ 199))
                                  . #5#)
                            (EXIT
                             (SPADCALL |sk1|
                                       (SPADCALL (QVELT |r2| 0) (QREFELT $ 26))
                                       (QREFELT $ 165)))))))
                    (#6# (|FS-;debugA| |a1| |a2| |res| $))))))
                (#6# (|FS-;debugA| |a1| |a2| |res| $))))))) 

(SDEFUN |FS-;mainKernel;SU;61| ((|x| S) ($ |Union| (|Kernel| S) "failed"))
        (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 112))) 

(SDEFUN |FS-;kernels;SL;62| ((|x| S) ($ |List| (|Kernel| S)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 182))) 

(SDEFUN |FS-;retract;SR;63| ((|x| S) ($ R))
        (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 237))) 

(SDEFUN |FS-;retract;SP;64| ((|x| S) ($ |Polynomial| R))
        (SPROG ((#1=#:G644 NIL))
               (PROG2
                   (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 90)) $)
                         |FS-;retract;SP;64|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                 (|Union| (|Polynomial| (QREFELT $ 7))
                                          "failed")
                                 #1#)))) 

(SDEFUN |FS-;retractIfCan;SU;65| ((|x| S) ($ |Union| R "failed"))
        (CONS 0 (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 237)))) 

(SDEFUN |FS-;retractIfCan;SU;66|
        ((|x| S) ($ |Union| (|Polynomial| R) "failed"))
        (|FS-;smpret| (SPADCALL |x| (QREFELT $ 90)) $)) 

(SDEFUN |FS-;eval;SLLS;67|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 90)) |lk| |lv| $)) 

(SDEFUN |FS-;subst;SLLS;68|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 90)) |lk| |lv| $)) 

(SDEFUN |FS-;differentiate;SSS;69| ((|x| S) (|s| |Symbol|) ($ S))
        (|FS-;smpderiv| (SPADCALL |x| (QREFELT $ 90)) |s| $)) 

(SDEFUN |FS-;coerce;SOf;70| ((|x| S) ($ |OutputForm|))
        (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 90)) $)) 

(SDEFUN |FS-;eval;SLS;71| ((|f| S) (|l| |List| (|Symbol|)) ($ S))
        (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 90)) |l| 'T $)) 

(SDEFUN |FS-;eval;2S;72| ((|f| S) ($ S))
        (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 90)) NIL 'NIL $)) 

(SDEFUN |FS-;eval;SLLLS;73|
        ((|x| S) (|s| |List| (|Symbol|)) (|n| |List| (|NonNegativeInteger|))
         (|f| |List| (|Mapping| S (|List| S))) ($ S))
        (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 90)) $)) 

(SDEFUN |FS-;isPlus;SU;74| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPROG
         ((#1=#:G675 NIL) (|p| NIL) (#2=#:G674 NIL)
          (|u|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| S)))
                    "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 251))
                . #3=(|FS-;isPlus;SU;74|))
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

(SDEFUN |FS-;isTimes;SU;75| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPROG
         ((#1=#:G686 NIL) (|p| NIL) (#2=#:G685 NIL)
          (|u|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| S)))
                    "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 253))
                . #3=(|FS-;isTimes;SU;75|))
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

(SDEFUN |FS-;isExpt;SU;76|
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
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 257))
                . #1=(|FS-;isExpt;SU;76|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |r| (QCDR |u|) . #1#)
                       (EXIT (CONS 0 (CONS (QCAR |r|) (QCDR |r|))))))))))) 

(SDEFUN |FS-;isPower;SU;77|
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
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 257))
                . #1=(|FS-;isPower;SU;77|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |r| (QCDR |u|) . #1#)
                       (EXIT
                        (CONS 0
                              (CONS (SPADCALL (QCAR |r|) (QREFELT $ 26))
                                    (QCDR |r|))))))))))) 

(SDEFUN |FS-;convert;SP;78| ((|x| S) ($ |Pattern| (|Integer|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 263))) 

(SDEFUN |FS-;convert;SP;79| ((|x| S) ($ |Pattern| (|Float|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 266))) 

(SDEFUN |FS-;isMult;SU;80|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S)))
          "failed"))
        (|FS-;smpIsMult| (SPADCALL |x| (QREFELT $ 90)) $)) 

(SDEFUN |FS-;*;R2S;81| ((|r| R) (|x| S) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |r| (QREFELT $ 271)) (QREFELT $ 87)) |x|
                  (QREFELT $ 134))) 

(SDEFUN |FS-;mainKernel;SU;82| ((|x| S) ($ |Union| (|Kernel| S) "failed"))
        (SPADCALL |x| (QREFELT $ 274))) 

(SDEFUN |FS-;kernels;SL;83| ((|x| S) ($ |List| (|Kernel| S)))
        (SPADCALL |x| (QREFELT $ 275))) 

(SDEFUN |FS-;univariate;SKF;84|
        ((|x| S) (|k| |Kernel| S)
         ($ |Fraction| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |x| |k| (QREFELT $ 277))) 

(SDEFUN |FS-;isPlus;SU;85| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPADCALL |x| (QREFELT $ 281))) 

(SDEFUN |FS-;isTimes;SU;86| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPADCALL |x| (QREFELT $ 282))) 

(SDEFUN |FS-;isExpt;SU;87|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |var| (|Kernel| S)) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPADCALL |x| (QREFELT $ 285))) 

(SDEFUN |FS-;isPower;SU;88|
        ((|x| S)
         ($ |Union| (|Record| (|:| |val| S) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPADCALL |x| (QREFELT $ 288))) 

(SDEFUN |FS-;denominator;2S;89| ((|x| S) ($ S))
        (SPADCALL (SPADCALL |x| (QREFELT $ 289)) (QREFELT $ 87))) 

(SDEFUN |FS-;coerce;FS;90| ((|q| |Fraction| R) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 292)) (QREFELT $ 271))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 293)) (QREFELT $ 271))
                  (QREFELT $ 294))) 

(SDEFUN |FS-;coerce;FS;91| ((|q| |Fraction| (|Polynomial| R)) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 297)) (QREFELT $ 298))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 299)) (QREFELT $ 298))
                  (QREFELT $ 300))) 

(SDEFUN |FS-;coerce;FS;92|
        ((|q| |Fraction| (|Polynomial| (|Fraction| R))) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 304)) (QREFELT $ 305))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 306)) (QREFELT $ 305))
                  (QREFELT $ 300))) 

(SDEFUN |FS-;retract;SP;93| ((|x| S) ($ |Polynomial| R))
        (SPADCALL (SPADCALL |x| (QREFELT $ 308)) (QREFELT $ 309))) 

(SDEFUN |FS-;retract;SF;94| ((|x| S) ($ |Fraction| (|Polynomial| R)))
        (SPROG ((#1=#:G755 NIL))
               (SPADCALL
                (PROG2
                    (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 90)) $)
                          . #2=(|FS-;retract;SF;94|))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                  (|Union| (|Polynomial| (QREFELT $ 7))
                                           #3="failed")
                                  #1#))
                (PROG2
                    (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 289)) $)
                          . #2#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                  (|Union| (|Polynomial| (QREFELT $ 7)) #3#)
                                  #1#))
                (QREFELT $ 310)))) 

(SDEFUN |FS-;retract;SR;95| ((|x| S) ($ R))
        (SPROG ((#1=#:G759 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| (QREFELT $ 90))
                                    (QREFELT $ 237))
                          (SPADCALL (SPADCALL |x| (QREFELT $ 289))
                                    (QREFELT $ 237))
                          (QREFELT $ 313))
                         |FS-;retract;SR;95|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                 (|Union| (QREFELT $ 7) "failed") #1#)))) 

(SDEFUN |FS-;coerce;SOf;96| ((|x| S) ($ |OutputForm|))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 289)) (|spadConstant| $ 314)
                    (QREFELT $ 315))
          (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 90)) $))
         ('T
          (SPADCALL (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 90)) $)
                    (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 289)) $)
                    (QREFELT $ 316))))) 

(SDEFUN |FS-;retractIfCan;SU;97| ((|x| S) ($ |Union| R "failed"))
        (SPROG
         ((#1=#:G772 NIL) (|r| (|Union| R "failed"))
          (|d| #2=(|Union| R "failed")) (|n| #2#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |n| (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 194))
                   . #3=(|FS-;retractIfCan;SU;97|))
             (EXIT
              (COND
               ((QEQCAR |n| 1)
                (PROGN (LETT #1# (CONS 1 #4="failed") . #3#) (GO #5=#:G770)))
               (#6='T
                (SEQ
                 (LETT |d|
                       (SPADCALL (SPADCALL |x| (QREFELT $ 289))
                                 (QREFELT $ 194))
                       . #3#)
                 (EXIT
                  (COND
                   ((QEQCAR |d| 1)
                    (PROGN (LETT #1# (CONS 1 #4#) . #3#) (GO #5#)))
                   (#6#
                    (SEQ
                     (LETT |r| (SPADCALL (QCDR |n|) (QCDR |d|) (QREFELT $ 313))
                           . #3#)
                     (EXIT
                      (COND
                       ((QEQCAR |r| 1)
                        (PROGN
                         (LETT #1# (CONS 1 #4#) . #3#)
                         (GO #5#))))))))))))))
            (EXIT (CONS 0 (QCDR |r|)))))
          #5# (EXIT #1#)))) 

(SDEFUN |FS-;eval;SLS;98| ((|f| S) (|l| |List| (|Symbol|)) ($ S))
        (SPADCALL (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 90)) |l| 'T $)
                  (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 289)) |l| 'T $)
                  (QREFELT $ 300))) 

(SDEFUN |FS-;eval;2S;99| ((|f| S) ($ S))
        (SPADCALL (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 90)) NIL 'NIL $)
                  (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 289)) NIL 'NIL $)
                  (QREFELT $ 300))) 

(SDEFUN |FS-;eval;SLLLS;100|
        ((|x| S) (|s| |List| (|Symbol|)) (|n| |List| (|NonNegativeInteger|))
         (|f| |List| (|Mapping| S (|List| S))) ($ S))
        (SPADCALL (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 90)) $)
                  (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 289)) $)
                  (QREFELT $ 300))) 

(SDEFUN |FS-;differentiate;SSS;101| ((|f| S) (|x| |Symbol|) ($ S))
        (SPADCALL
         (SPADCALL
          (SPADCALL (|FS-;smpderiv| (SPADCALL |f| (QREFELT $ 90)) |x| $)
                    (SPADCALL (SPADCALL |f| (QREFELT $ 289)) (QREFELT $ 87))
                    (QREFELT $ 134))
          (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 90)) (QREFELT $ 87))
                    (|FS-;smpderiv| (SPADCALL |f| (QREFELT $ 289)) |x| $)
                    (QREFELT $ 134))
          (QREFELT $ 317))
         (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 289)) (QREFELT $ 87)) 2
                   (QREFELT $ 318))
         (QREFELT $ 300))) 

(SDEFUN |FS-;eval;SLLS;102|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPADCALL (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 90)) |lk| |lv| $)
                  (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 289)) |lk| |lv| $)
                  (QREFELT $ 300))) 

(SDEFUN |FS-;subst;SLLS;103|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPADCALL (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 90)) |lk| |lv| $)
                  (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 289)) |lk| |lv| $)
                  (QREFELT $ 300))) 

(SDEFUN |FS-;par| ((|x| S) ($ S))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 18)) |FS-;par|)
                    (EXIT
                     (COND ((QEQCAR |r| 0) |x|)
                           ('T (SPADCALL |x| (QREFELT $ 319)))))))) 

(SDEFUN |FS-;convert;FS;105| ((|x| |Factored| S) ($ S))
        (SPROG
         ((#1=#:G795 NIL) (#2=#:G794 (S)) (#3=#:G796 (S)) (#4=#:G798 NIL)
          (|f| NIL))
         (SEQ
          (SPADCALL (|FS-;par| (SPADCALL |x| (QREFELT $ 321)) $)
                    (PROGN
                     (LETT #1# NIL . #5=(|FS-;convert;FS;105|))
                     (SEQ (LETT |f| NIL . #5#)
                          (LETT #4# (SPADCALL |x| (QREFELT $ 324)) . #5#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3#
                                   (SPADCALL (|FS-;par| (QCAR |f|) $)
                                             (QCDR |f|) (QREFELT $ 318))
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

(SDEFUN |FS-;retractIfCan;SU;106|
        ((|x| S) ($ |Union| (|Polynomial| R) "failed"))
        (SPROG ((|u| (|Union| (|Fraction| (|Polynomial| R)) "failed")))
               (SEQ
                (LETT |u| (SPADCALL |x| (QREFELT $ 328))
                      |FS-;retractIfCan;SU;106|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T (SPADCALL (QCDR |u|) (QREFELT $ 329)))))))) 

(SDEFUN |FS-;retractIfCan;SU;107|
        ((|x| S) ($ |Union| (|Fraction| (|Polynomial| R)) "failed"))
        (SPROG ((|d| #1=(|Union| (|Polynomial| R) "failed")) (|n| #1#))
               (SEQ
                (LETT |n| (|FS-;smpret| (SPADCALL |x| (QREFELT $ 90)) $)
                      . #2=(|FS-;retractIfCan;SU;107|))
                (EXIT
                 (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                       (#3='T
                        (SEQ
                         (LETT |d|
                               (|FS-;smpret| (SPADCALL |x| (QREFELT $ 289)) $)
                               . #2#)
                         (EXIT
                          (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                (#3#
                                 (CONS 0
                                       (SPADCALL (QCDR |n|) (QCDR |d|)
                                                 (QREFELT $ 310))))))))))))) 

(SDEFUN |FS-;coerce;PS;108| ((|p| |Polynomial| (|Fraction| R)) ($ S))
        (SPADCALL (ELT $ 38) (ELT $ 331) |p| (QREFELT $ 334))) 

(SDEFUN |FS-;coerce;FS;109| ((|x| |Fraction| (|Integer|)) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 337)) (QREFELT $ 338))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 339)) (QREFELT $ 338))
                  (QREFELT $ 294))) 

(SDEFUN |FS-;isMult;SU;110|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S)))
          "failed"))
        (SPROG
         ((|q| (|Union| (|Integer|) "failed"))
          (|r| (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S))))
          (#1=#:G833 NIL) (|w| (|Union| (|Integer|) "failed"))
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
                   . #2=(|FS-;isMult;SU;110|))
             (EXIT
              (COND
               ((QEQCAR |u| 1)
                (PROGN (LETT #1# (CONS 1 #3="failed") . #2#) (GO #4=#:G831)))
               (#5='T
                (SEQ
                 (LETT |v|
                       (SPADCALL (SPADCALL |x| (QREFELT $ 289))
                                 (QREFELT $ 194))
                       . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |v| 1)
                    (PROGN (LETT #1# (CONS 1 #3#) . #2#) (GO #4#)))
                   (#5#
                    (SEQ (LETT |w| (SPADCALL (QCDR |v|) (QREFELT $ 230)) . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |w| 1)
                            (PROGN
                             (LETT #1# (CONS 1 #3#) . #2#)
                             (GO #4#))))))))))))))
            (LETT |r| (QCDR |u|) . #2#)
            (LETT |q| (SPADCALL (QCAR |r|) (QCDR |w|) (QREFELT $ 341)) . #2#)
            (EXIT
             (COND ((QEQCAR |q| 1) (CONS 1 "failed"))
                   (#5# (CONS 0 (CONS (QCDR |q|) (QCDR |r|))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |FS-;convert;SP;111| ((|x| S) ($ |Pattern| (|Integer|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 263))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 289)) (QREFELT $ 263))
                  (QREFELT $ 342))) 

(SDEFUN |FS-;convert;SP;112| ((|x| S) ($ |Pattern| (|Float|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 266))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 289)) (QREFELT $ 266))
                  (QREFELT $ 343))) 

(DECLAIM (NOTINLINE |FunctionSpace&;|)) 

(DEFUN |FunctionSpace&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionSpace&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FunctionSpace&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 347) . #1#)
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
             (QSETREFV $ 61 (CONS (|dispatchFunction| |FS-;eval;SSS;16|) $))
             (QSETREFV $ 64 (CONS (|dispatchFunction| |FS-;eval;SBoSSS;17|) $))
             (QSETREFV $ 71 (CONS (|dispatchFunction| |FS-;eval;SLLSS;18|) $))
             (SPADCALL (QREFELT $ 15) '|%specialInput|
                       (CONS (|function| |FS-;indiff|) $) (QREFELT $ 73)))))
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
             (COND ((|testBitVector| |pv$| 11)))
             (QSETREFV $ 222
                       (CONS (|dispatchFunction| |FS-;isExpt;SBoU;55|) $))
             (QSETREFV $ 224 (CONS (|dispatchFunction| |FS-;isExpt;SSU;56|) $))
             (COND ((|testBitVector| |pv$| 1)))
             (SPADCALL (QREFELT $ 15) (CONS (|function| |FS-;diffEval|) $)
                       (QREFELT $ 231))
             (SPADCALL (QREFELT $ 15) '|%specialEqual|
                       (CONS (|function| |FS-;equaldiff|) $) (QREFELT $ 73))
             (SPADCALL (QREFELT $ 15) (QREFELT $ 10)
                       (CONS (|function| |FS-;diffdiff|) $) (QREFELT $ 73))
             (SPADCALL (QREFELT $ 15) '|%specialDisp|
                       (CONS (|function| |FS-;ddiff|) $) (QREFELT $ 73))
             (COND ((|testBitVector| |pv$| 2))
                   ('T
                    (PROGN
                     (QSETREFV $ 235
                               (CONS
                                (|dispatchFunction| |FS-;mainKernel;SU;61|) $))
                     (QSETREFV $ 236
                               (CONS (|dispatchFunction| |FS-;kernels;SL;62|)
                                     $))
                     (QSETREFV $ 238
                               (CONS (|dispatchFunction| |FS-;retract;SR;63|)
                                     $))
                     (QSETREFV $ 239
                               (CONS (|dispatchFunction| |FS-;retract;SP;64|)
                                     $))
                     (QSETREFV $ 240
                               (CONS
                                (|dispatchFunction| |FS-;retractIfCan;SU;65|)
                                $))
                     (QSETREFV $ 242
                               (CONS
                                (|dispatchFunction| |FS-;retractIfCan;SU;66|)
                                $))
                     (QSETREFV $ 243
                               (CONS (|dispatchFunction| |FS-;eval;SLLS;67|)
                                     $))
                     (QSETREFV $ 244
                               (CONS (|dispatchFunction| |FS-;subst;SLLS;68|)
                                     $))
                     (QSETREFV $ 245
                               (CONS
                                (|dispatchFunction| |FS-;differentiate;SSS;69|)
                                $))
                     (QSETREFV $ 246
                               (CONS (|dispatchFunction| |FS-;coerce;SOf;70|)
                                     $))
                     (COND
                      ((|testBitVector| |pv$| 11)
                       (PROGN
                        (QSETREFV $ 247
                                  (CONS (|dispatchFunction| |FS-;eval;SLS;71|)
                                        $))
                        (QSETREFV $ 248
                                  (CONS (|dispatchFunction| |FS-;eval;2S;72|)
                                        $)))))
                     (QSETREFV $ 249
                               (CONS (|dispatchFunction| |FS-;eval;SLLLS;73|)
                                     $))
                     (QSETREFV $ 252
                               (CONS (|dispatchFunction| |FS-;isPlus;SU;74|)
                                     $))
                     (QSETREFV $ 254
                               (CONS (|dispatchFunction| |FS-;isTimes;SU;75|)
                                     $))
                     (QSETREFV $ 258
                               (CONS (|dispatchFunction| |FS-;isExpt;SU;76|)
                                     $))
                     (QSETREFV $ 261
                               (CONS (|dispatchFunction| |FS-;isPower;SU;77|)
                                     $))
                     (COND
                      ((|HasCategory| |#2|
                                      '(|ConvertibleTo|
                                        (|Pattern| (|Integer|))))
                       (QSETREFV $ 264
                                 (CONS (|dispatchFunction| |FS-;convert;SP;78|)
                                       $))))
                     (COND
                      ((|HasCategory| |#2|
                                      '(|ConvertibleTo| (|Pattern| (|Float|))))
                       (QSETREFV $ 267
                                 (CONS (|dispatchFunction| |FS-;convert;SP;79|)
                                       $))))
                     (COND
                      ((|testBitVector| |pv$| 1)
                       (QSETREFV $ 270
                                 (CONS (|dispatchFunction| |FS-;isMult;SU;80|)
                                       $))))))))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 272 (CONS (|dispatchFunction| |FS-;*;R2S;81|) $))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 235
                       (CONS (|dispatchFunction| |FS-;mainKernel;SU;82|) $))
             (QSETREFV $ 236 (CONS (|dispatchFunction| |FS-;kernels;SL;83|) $))
             (QSETREFV $ 279
                       (CONS (|dispatchFunction| |FS-;univariate;SKF;84|) $))
             (QSETREFV $ 252 (CONS (|dispatchFunction| |FS-;isPlus;SU;85|) $))
             (QSETREFV $ 254 (CONS (|dispatchFunction| |FS-;isTimes;SU;86|) $))
             (QSETREFV $ 258 (CONS (|dispatchFunction| |FS-;isExpt;SU;87|) $))
             (QSETREFV $ 261 (CONS (|dispatchFunction| |FS-;isPower;SU;88|) $))
             (QSETREFV $ 290
                       (CONS (|dispatchFunction| |FS-;denominator;2S;89|) $))
             (QSETREFV $ 295 (CONS (|dispatchFunction| |FS-;coerce;FS;90|) $))
             (QSETREFV $ 301 (CONS (|dispatchFunction| |FS-;coerce;FS;91|) $))
             (QSETREFV $ 307 (CONS (|dispatchFunction| |FS-;coerce;FS;92|) $))
             (QSETREFV $ 239 (CONS (|dispatchFunction| |FS-;retract;SP;93|) $))
             (QSETREFV $ 311 (CONS (|dispatchFunction| |FS-;retract;SF;94|) $))
             (QSETREFV $ 238 (CONS (|dispatchFunction| |FS-;retract;SR;95|) $))
             (QSETREFV $ 246 (CONS (|dispatchFunction| |FS-;coerce;SOf;96|) $))
             (QSETREFV $ 240
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;97|) $))
             (QSETREFV $ 247 (CONS (|dispatchFunction| |FS-;eval;SLS;98|) $))
             (COND
              ((|testBitVector| |pv$| 11)
               (PROGN
                (QSETREFV $ 248 (CONS (|dispatchFunction| |FS-;eval;2S;99|) $))
                (QSETREFV $ 249
                          (CONS (|dispatchFunction| |FS-;eval;SLLLS;100|)
                                $)))))
             (QSETREFV $ 245
                       (CONS (|dispatchFunction| |FS-;differentiate;SSS;101|)
                             $))
             (QSETREFV $ 243 (CONS (|dispatchFunction| |FS-;eval;SLLS;102|) $))
             (QSETREFV $ 244
                       (CONS (|dispatchFunction| |FS-;subst;SLLS;103|) $))
             (QSETREFV $ 326
                       (CONS (|dispatchFunction| |FS-;convert;FS;105|) $))
             (QSETREFV $ 242
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;106|) $))
             (QSETREFV $ 330
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;107|) $))
             (QSETREFV $ 335 (CONS (|dispatchFunction| |FS-;coerce;PS;108|) $))
             (COND
              ((|testBitVector| |pv$| 1)
               (PROGN
                (QSETREFV $ 340
                          (CONS (|dispatchFunction| |FS-;coerce;FS;109|) $))
                (QSETREFV $ 270
                          (CONS (|dispatchFunction| |FS-;isMult;SU;110|) $)))))
             (COND
              ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Integer|))))
               (QSETREFV $ 264
                         (CONS (|dispatchFunction| |FS-;convert;SP;111|) $))))
             (COND
              ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Float|))))
               (QSETREFV $ 267
                         (CONS (|dispatchFunction| |FS-;convert;SP;112|)
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
              (112 . |convert|) (117 . |convert|) (|List| 12) (122 . |eval|)
              (128 . |eval|) (|List| 11) (134 . |eval|) (142 . |eval|)
              (|Mapping| 6 6) (|MakeUnaryCompiledFunction| 6 6 6)
              (150 . |compiledFunction|) (|Mapping| $ $) (|List| 68)
              (156 . |eval|) (163 . |eval|) (|None|) (171 . |setProperty|)
              (|List| 25) (178 . |tower|) |FS-;variables;SL;19|
              (|Union| 25 '#1#) (183 . |retractIfCan|) |FS-;retractIfCan;SU;20|
              '|gendiff| (|NonNegativeInteger|) (188 . |characteristic|)
              (192 . |characteristic|) (|SparseMultivariatePolynomial| 7 23)
              (196 . |coerce|) (|SparseMultivariatePolynomial| 7 25)
              (201 . |coerce|) (206 . |coerce|) (211 . |new|) (215 . |numer|)
              (220 . |numerator|) (225 . |first|) (|List| 81) (|Mapping| $ 32)
              (|List| 94) (230 . |eval|) (238 . |eval|) (246 . |eval|)
              (254 . |new|) (260 . |eval|) (267 . |unary?|)
              (272 . |leadingCoefficient|) (277 . |Zero|) (281 . |smaller?|)
              (287 . -) (292 . |elt|) (|ExpressionSpace&| 6) (298 . |elt|)
              (304 . |elt|) (310 . |eval|) (|Union| 23 '"failed")
              (318 . |mainVariable|) (|SparseUnivariatePolynomial| $)
              (323 . |univariate|) (|SparseUnivariatePolynomial| 6)
              (|Mapping| 6 84) (|SparseUnivariatePolynomial| 84)
              (|SparseUnivariatePolynomialFunctions2| 84 6) (329 . |map|)
              (|Integer|) (335 . |position|) (341 . |minIndex|) (346 . |elt|)
              (352 . |Zero|) (|Mapping| 6 45) (|List| 125) (356 . |elt|)
              (362 . |elt|) (368 . |Zero|) (372 . ~=) (378 . |degree|)
              (383 . ^) (389 . |leadingCoefficient|) (394 . *) (400 . +)
              (406 . |reductum|) (|OutputForm|) (411 . |coerce|) (416 . |is?|)
              (|List| 137) (422 . |position|) (428 . |setelt!|)
              (435 . |coerce|) (440 . |One|) (444 . |minIndex|)
              (449 . |coerce|) (454 . |hconcat|) (460 . |position|)
              (466 . |sub|) (472 . |differentiate|) (|Union| 72 '"failed")
              (478 . |property|) (484 . |prefix|) (490 . |copy|) (495 . |elt|)
              (501 . |setelt!|) (508 . >) (|List| 120) (514 . |member?|)
              (520 . |first|) (526 . |rest|) (532 . |concat|)
              (538 . |maxIndex|) (543 . |differentiate|) (549 . =)
              (|Union| 126 '"failed") (|BasicOperatorFunctions1| 6)
              (555 . |derivative|) (|Equation| 6) (560 . =) (|Equation| $)
              (566 . |subst|) (572 . |kernel|) (578 . ~=) (|Polynomial| 7)
              (584 . |coerce|) (589 . |differentiate|) (595 . |retract|)
              (|Mapping| 7 7) (600 . |map|) (|List| 23) (606 . |variables|)
              (611 . |differentiate|) (617 . |coerce|) (|Mapping| 6 12)
              (|Mapping| 6 7)
              (|PolynomialCategoryLifting| (|IndexedExponents| 12) 12 7 175 6)
              (622 . |map|) (629 . |coerce|) (|Union| 19 '"failed")
              (|UserDefinedPartialOrdering| 12) (634 . |less?|) (640 . <)
              (646 . |retractIfCan|) (651 . |coerce|) (656 . |userOrdered?|)
              (660 . |coerce|) (665 . |outputForm|) (671 . |subst|)
              (|Mapping| 6 23) (|ListToMap| 23 6) (678 . |match|)
              (|PolynomialCategoryLifting| (|IndexedExponents| 23) 23 7 84 6)
              (686 . |map|) (693 . |eval|) (700 . |map|)
              (706 . |setIntersection|) (712 . |empty?|) (717 . |eval|)
              (722 . |retract|) (727 . |member?|) (|InputFormFunctions1| 6)
              (733 . |interpret|) (738 . |coerce|) (|Mapping| 175 23)
              (|Mapping| 175 7)
              (|PolynomialCategoryLifting| (|IndexedExponents| 23) 23 7 84 175)
              (743 . |map|) (|Record| (|:| |var| 25) (|:| |exponent| 120))
              (|Union| 219 '"failed") (750 . |isExpt|) (755 . |isExpt|)
              (761 . |is?|) (767 . |isExpt|) (773 . |degree|)
              (778 . |reductum|) (783 . |leadingCoefficient|) (788 . |zero?|)
              (|Union| 120 '#1#) (793 . |retractIfCan|) (798 . |evaluate|)
              (804 . =) (810 . =) (816 . =) (822 . |mainKernel|)
              (827 . |kernels|) (832 . |retract|) (837 . |retract|)
              (842 . |retract|) (847 . |retractIfCan|) (|Union| 175 '"failed")
              (852 . |retractIfCan|) (857 . |eval|) (864 . |subst|)
              (871 . |differentiate|) (877 . |coerce|) (882 . |eval|)
              (888 . |eval|) (893 . |eval|) (|Union| 32 '#2="failed")
              (901 . |isPlus|) (906 . |isPlus|) (911 . |isTimes|)
              (916 . |isTimes|) (|Record| (|:| |var| 23) (|:| |exponent| 81))
              (|Union| 255 '#2#) (921 . |isExpt|) (926 . |isExpt|)
              (|Record| (|:| |val| $) (|:| |exponent| 120))
              (|Union| 259 '"failed") (931 . |isPower|) (|Pattern| 120)
              (936 . |convert|) (941 . |convert|) (|Pattern| (|Float|))
              (946 . |convert|) (951 . |convert|)
              (|Record| (|:| |coef| 120) (|:| |var| 25))
              (|Union| 268 '"failed") (956 . |isMult|) (961 . |coerce|)
              (966 . *)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 23) 23
                                                     7 84 6)
              (972 . |mainVariable|) (977 . |variables|) (|Fraction| 115)
              (982 . |univariate|) (|Fraction| 113) (988 . |univariate|)
              (|Union| 45 '"failed") (994 . |isPlus|) (999 . |isTimes|)
              (|Record| (|:| |var| 23) (|:| |exponent| 120))
              (|Union| 283 '"failed") (1004 . |isExpt|)
              (|Record| (|:| |val| 6) (|:| |exponent| 120))
              (|Union| 286 '"failed") (1009 . |isPower|) (1014 . |denom|)
              (1019 . |denominator|) (|Fraction| 7) (1024 . |numer|)
              (1029 . |denom|) (1034 . /) (1040 . |coerce|) (|Fraction| 175)
              (1045 . |numer|) (1050 . |coerce|) (1055 . |denom|) (1060 . /)
              (1066 . |coerce|) (|Polynomial| 291) (|Fraction| 302)
              (1071 . |numer|) (1076 . |coerce|) (1081 . |denom|)
              (1086 . |coerce|) (1091 . |retract|) (1096 . |retract|)
              (1101 . /) (1107 . |retract|) (|Union| $ '"failed")
              (1112 . |exquo|) (1118 . |One|) (1122 . =) (1128 . /) (1134 . -)
              (1140 . ^) (1146 . |paren|) (|Factored| 6) (1151 . |unit|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 120)) (|List| 322)
              (1156 . |factors|) (|Factored| $) (1161 . |convert|)
              (|Union| 296 '#1#) (1166 . |retractIfCan|)
              (1171 . |retractIfCan|) (1176 . |retractIfCan|) (1181 . |coerce|)
              (|Mapping| 6 291)
              (|PolynomialCategoryLifting| (|IndexedExponents| 12) 12 291 302
                                           6)
              (1186 . |map|) (1193 . |coerce|) (|Fraction| 120)
              (1198 . |numer|) (1203 . |coerce|) (1208 . |denom|)
              (1213 . |coerce|) (1218 . |exquo|) (1224 . /) (1230 . /)
              (|PositiveInteger|) (|Union| 336 '#1#) (|List| 171))
           '#(|variables| 1236 |univariate| 1241 |subst| 1247 |retractIfCan|
              1254 |retract| 1274 |operator| 1294 |numerator| 1299 |mainKernel|
              1304 |kernels| 1309 |isTimes| 1314 |isPower| 1319 |isPlus| 1324
              |isMult| 1329 |isExpt| 1334 |ground?| 1351 |ground| 1356 |eval|
              1361 |elt| 1440 |differentiate| 1446 |denominator| 1452 |convert|
              1457 |coerce| 1472 |characteristic| 1517 |belong?| 1521
              |applyQuote| 1526 * 1562)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 343
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
                                                   2 6 0 0 59 60 2 0 0 0 12 61
                                                   4 6 0 0 62 32 12 63 4 0 0 0
                                                   11 0 12 64 2 66 65 6 12 67 3
                                                   6 0 0 62 69 70 4 0 0 0 62 32
                                                   12 71 3 11 0 0 12 72 73 1 6
                                                   74 0 75 1 6 77 0 78 0 7 81
                                                   82 0 0 81 83 1 84 0 23 85 1
                                                   6 0 86 87 1 0 0 25 88 0 12 0
                                                   89 1 6 86 0 90 1 0 0 0 91 1
                                                   45 6 0 92 4 6 0 0 59 93 95
                                                   96 4 0 0 0 12 81 68 97 4 0 0
                                                   0 12 81 94 98 2 93 0 81 81
                                                   99 3 0 0 0 59 95 100 1 11 19
                                                   0 101 1 84 7 0 102 0 7 0 103
                                                   2 7 19 0 0 104 1 6 0 0 105 2
                                                   6 0 11 0 106 2 107 0 11 32
                                                   108 2 0 0 11 32 109 4 0 0 0
                                                   59 93 69 110 1 84 111 0 112
                                                   2 84 113 0 23 114 2 118 115
                                                   116 117 119 2 59 120 12 0
                                                   121 1 59 120 0 122 2 115 6 0
                                                   6 123 0 6 0 124 2 126 125 0
                                                   120 127 2 93 81 0 120 128 0
                                                   115 0 129 2 115 19 0 0 130 1
                                                   115 81 0 131 2 6 0 0 81 132
                                                   1 115 6 0 133 2 6 0 0 0 134
                                                   2 6 0 0 0 135 1 115 0 0 136
                                                   1 6 137 0 138 2 23 19 0 11
                                                   139 2 140 120 137 0 141 3
                                                   140 137 0 120 137 142 1 12
                                                   137 0 143 0 6 0 144 1 45 120
                                                   0 145 1 120 137 0 146 2 137
                                                   0 0 0 147 2 45 120 6 0 148 2
                                                   137 0 0 0 149 2 137 0 0 81
                                                   150 2 11 151 0 12 152 2 137
                                                   0 0 32 153 1 45 0 0 154 2 45
                                                   6 0 120 155 3 45 6 0 120 6
                                                   156 2 120 19 0 0 157 2 158
                                                   19 120 0 159 2 45 0 0 81 160
                                                   2 45 0 0 81 161 2 45 0 0 0
                                                   162 1 45 120 0 163 2 6 0 0
                                                   12 164 2 6 19 0 0 165 1 167
                                                   166 11 168 2 169 0 6 6 170 2
                                                   6 0 0 171 172 2 6 0 11 0 173
                                                   2 81 19 0 0 174 1 175 0 7
                                                   176 2 175 0 0 12 177 1 175 7
                                                   0 178 2 84 0 179 0 180 1 84
                                                   181 0 182 2 84 0 0 23 183 1
                                                   6 0 7 184 3 187 6 185 186
                                                   175 188 1 0 0 175 189 2 191
                                                   190 12 12 192 2 23 19 0 0
                                                   193 1 84 17 0 194 1 7 137 0
                                                   195 0 191 19 196 1 23 137 0
                                                   197 2 115 137 0 137 198 3 6
                                                   0 0 74 32 199 4 201 6 181 45
                                                   23 200 202 3 203 6 200 186
                                                   84 204 3 6 0 0 74 32 205 2 6
                                                   0 68 25 206 2 181 0 0 0 207
                                                   1 181 19 0 208 1 6 0 0 209 1
                                                   6 12 0 210 2 59 19 12 0 211
                                                   1 212 6 55 213 1 175 0 12
                                                   214 3 217 175 215 216 84 218
                                                   1 6 220 0 221 2 0 220 0 11
                                                   222 2 23 19 0 12 223 2 0 220
                                                   0 12 224 1 117 81 0 225 1
                                                   117 0 0 226 1 117 84 0 227 1
                                                   84 19 0 228 1 7 229 0 230 2
                                                   167 11 11 125 231 2 11 19 0
                                                   0 232 2 158 19 0 0 233 2 45
                                                   19 0 0 234 1 0 77 0 235 1 0
                                                   74 0 236 1 84 7 0 237 1 0 7
                                                   0 238 1 0 175 0 239 1 0 17 0
                                                   240 1 0 241 0 242 3 0 0 0 74
                                                   32 243 3 0 0 0 74 32 244 2 0
                                                   0 0 12 245 1 0 137 0 246 2 0
                                                   0 0 59 247 1 0 0 0 248 4 0 0
                                                   0 59 93 95 249 1 84 250 0
                                                   251 1 0 250 0 252 1 84 250 0
                                                   253 1 0 250 0 254 1 84 256 0
                                                   257 1 0 220 0 258 1 0 260 0
                                                   261 1 84 262 0 263 1 0 262 0
                                                   264 1 84 265 0 266 1 0 265 0
                                                   267 1 0 269 0 270 1 84 0 7
                                                   271 2 0 0 7 0 272 1 273 111
                                                   6 274 1 273 181 6 275 2 273
                                                   276 6 23 277 2 0 278 0 25
                                                   279 1 273 280 6 281 1 273
                                                   280 6 282 1 273 284 6 285 1
                                                   273 287 6 288 1 6 86 0 289 1
                                                   0 0 0 290 1 291 7 0 292 1
                                                   291 7 0 293 2 6 0 86 86 294
                                                   1 0 0 291 295 1 296 175 0
                                                   297 1 6 0 175 298 1 296 175
                                                   0 299 2 6 0 0 0 300 1 0 0
                                                   296 301 1 303 302 0 304 1 6
                                                   0 302 305 1 303 302 0 306 1
                                                   0 0 303 307 1 6 296 0 308 1
                                                   296 175 0 309 2 296 0 175
                                                   175 310 1 0 296 0 311 2 7
                                                   312 0 0 313 0 84 0 314 2 84
                                                   19 0 0 315 2 137 0 0 0 316 2
                                                   6 0 0 0 317 2 6 0 0 120 318
                                                   1 6 0 0 319 1 320 6 0 321 1
                                                   320 323 0 324 1 0 0 325 326
                                                   1 6 327 0 328 1 296 241 0
                                                   329 1 0 327 0 330 1 6 0 291
                                                   331 3 333 6 185 332 302 334
                                                   1 0 0 302 335 1 336 120 0
                                                   337 1 84 0 120 338 1 336 120
                                                   0 339 1 0 0 336 340 2 120
                                                   312 0 0 341 2 262 0 0 0 342
                                                   2 265 0 0 0 343 1 0 59 0 76
                                                   2 0 278 0 25 279 3 0 0 0 74
                                                   32 244 1 0 241 0 242 1 0 327
                                                   0 330 1 0 17 0 240 1 0 29 0
                                                   79 1 0 175 0 239 1 0 296 0
                                                   311 1 0 7 0 238 1 0 12 0 31
                                                   1 0 11 11 51 1 0 0 0 91 1 0
                                                   77 0 235 1 0 74 0 236 1 0
                                                   250 0 254 1 0 260 0 261 1 0
                                                   250 0 252 1 0 269 0 270 2 0
                                                   220 0 11 222 2 0 220 0 12
                                                   224 1 0 220 0 258 1 0 19 0
                                                   20 1 0 7 0 22 4 0 0 0 12 81
                                                   68 97 4 0 0 0 59 93 95 249 4
                                                   0 0 0 12 81 94 98 4 0 0 0 59
                                                   93 69 110 4 0 0 0 62 32 12
                                                   71 1 0 0 0 248 4 0 0 0 11 0
                                                   12 64 2 0 0 0 12 61 2 0 0 0
                                                   59 247 3 0 0 0 59 95 100 3 0
                                                   0 0 74 32 243 2 0 0 11 32
                                                   109 2 0 0 0 12 245 1 0 0 0
                                                   290 1 0 0 325 326 1 0 262 0
                                                   264 1 0 265 0 267 1 0 0 175
                                                   189 1 0 0 336 340 1 0 0 296
                                                   301 1 0 0 302 335 1 0 0 303
                                                   307 1 0 0 291 295 1 0 0 12
                                                   27 1 0 137 0 246 1 0 0 25 88
                                                   0 0 81 83 1 0 19 11 43 5 0 0
                                                   12 0 0 0 0 37 2 0 0 12 32 40
                                                   4 0 0 12 0 0 0 36 2 0 0 12 0
                                                   34 3 0 0 12 0 0 35 2 0 0 7 0
                                                   272)))))
           '|lookupComplete|)) 
