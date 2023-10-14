
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
                 (|check_union| (QEQCAR #1# 0) (|Symbol|) #1#)))) 

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
                (SPADCALL
                 (STRCONC "Unknown operator 4: "
                          (SPADCALL (SPADCALL |op| (QREFELT $ 48))
                                    (QREFELT $ 50)))
                 (QREFELT $ 52)))))) 

(SDEFUN |FS-;differentiand| ((|l| |List| S) ($ S))
        (SPADCALL (|SPADfirst| |l|)
                  (SPADCALL (SPADCALL |l| (QREFELT $ 54)) (QREFELT $ 28))
                  (SPADCALL |l| (QREFELT $ 55)) (QREFELT $ 56))) 

(SDEFUN |FS-;pint| ((|l| |List| (|InputForm|)) ($ |InputForm|))
        (SPADCALL (CONS (SPADCALL 'D (QREFELT $ 58)) |l|) (QREFELT $ 59))) 

(SDEFUN |FS-;indiff| ((|l| |List| S) ($ |InputForm|))
        (SPROG ((|r2| (|InputForm|)))
               (SEQ
                (LETT |r2|
                      (SPADCALL
                       (LIST (SPADCALL '|::| (QREFELT $ 58))
                             (SPADCALL (SPADCALL |l| (QREFELT $ 55))
                                       (QREFELT $ 60))
                             (SPADCALL '|Symbol| (QREFELT $ 58)))
                       (QREFELT $ 59))
                      |FS-;indiff|)
                (EXIT
                 (|FS-;pint|
                  (LIST (SPADCALL (|FS-;differentiand| |l| $) (QREFELT $ 60))
                        |r2|)
                  $))))) 

(SDEFUN |FS-;eval;SSS;16| ((|f| S) (|s| |Symbol|) ($ S))
        (SPADCALL |f| (LIST |s|) (QREFELT $ 62))) 

(SDEFUN |FS-;eval;SBoSSS;17|
        ((|f| S) (|s| |BasicOperator|) (|g| S) (|x| |Symbol|) ($ S))
        (SPADCALL |f| (LIST |s|) (LIST |g|) |x| (QREFELT $ 65))) 

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
                                        (CONS (SPADCALL |g| |x| (QREFELT $ 69))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 72))))) 

(SDEFUN |FS-;variables;SL;19| ((|x| S) ($ |List| (|Symbol|)))
        (SPROG
         ((|l| (|List| (|Symbol|))) (|s| (|Union| (|Symbol|) "failed"))
          (#1=#:G199 NIL) (|k| NIL))
         (SEQ (LETT |l| NIL . #2=(|FS-;variables;SL;19|))
              (SEQ (LETT |k| NIL . #2#)
                   (LETT #1# (SPADCALL |x| (QREFELT $ 77)) . #2#) G190
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
                (LETT |k| (SPADCALL |x| (QREFELT $ 80))
                      |FS-;retractIfCan;SU;20|)
                (EXIT
                 (COND ((QEQCAR |k| 1) (CONS 1 "failed"))
                       ('T (SPADCALL (QCDR |k|) (QREFELT $ 30)))))))) 

(SDEFUN |FS-;characteristic;Nni;21| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 84))) 

(SDEFUN |FS-;coerce;KS;22| ((|k| |Kernel| S) ($ S))
        (SPADCALL (SPADCALL |k| (QREFELT $ 87)) (QREFELT $ 89))) 

(SDEFUN |FS-;symsub| ((|sy| |Symbol|) (|i| |Integer|) ($ |Symbol|))
        (SPADCALL (QREFELT $ 91))) 

(SDEFUN |FS-;numerator;2S;24| ((|x| S) ($ S))
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 89))) 

(SDEFUN |FS-;eval;SSNniMS;25|
        ((|x| S) (|s| |Symbol|) (|n| |NonNegativeInteger|) (|f| |Mapping| S S)
         ($ S))
        (SPROG NIL
               (SPADCALL |x| (LIST |s|) (LIST |n|)
                         (LIST (CONS #'|FS-;eval;SSNniMS;25!0| (VECTOR |f| $)))
                         (QREFELT $ 98)))) 

(SDEFUN |FS-;eval;SSNniMS;25!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1) . #1=(|FS-;eval;SSNniMS;25|))
          (LETT |f| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 94)) |f|))))) 

(SDEFUN |FS-;eval;SSNniMS;26|
        ((|x| S) (|s| |Symbol|) (|n| |NonNegativeInteger|)
         (|f| |Mapping| S (|List| S)) ($ S))
        (SPADCALL |x| (LIST |s|) (LIST |n|) (LIST |f|) (QREFELT $ 98))) 

(SDEFUN |FS-;eval;SLLS;27|
        ((|x| S) (|l| |List| (|Symbol|)) (|f| |List| (|Mapping| S (|List| S)))
         ($ S))
        (SPADCALL |x| |l| (SPADCALL (LENGTH |l|) 1 (QREFELT $ 101)) |f|
                  (QREFELT $ 98))) 

(SDEFUN |FS-;elt;BoLS;28| ((|op| |BasicOperator|) (|args| |List| S) ($ S))
        (SPROG ((#1=#:G233 NIL) (|x| (S)) (|od?| (|Boolean|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |op| (QREFELT $ 103))
                    (SEQ
                     (LETT |od?| (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 41))
                           . #2=(|FS-;elt;BoLS;28|))
                     (EXIT
                      (COND
                       ((OR |od?| (SPADCALL |op| (QREFELT $ 9) (QREFELT $ 41)))
                        (COND
                         ((SPADCALL
                           (SPADCALL
                            (SPADCALL (|SPADfirst| |args|) (QREFELT $ 92))
                            (QREFELT $ 104))
                           (|spadConstant| $ 105) (QREFELT $ 106))
                          (PROGN
                           (LETT #1#
                                 (SEQ
                                  (LETT |x|
                                        (SPADCALL |op|
                                                  (SPADCALL
                                                   (|SPADfirst| |args|)
                                                   (QREFELT $ 107))
                                                  (QREFELT $ 108))
                                        . #2#)
                                  (EXIT
                                   (COND (|od?| (SPADCALL |x| (QREFELT $ 107)))
                                         ('T |x|))))
                                 . #2#)
                           (GO #3=#:G231))))))))))
                  (EXIT (SPADCALL |op| |args| (QREFELT $ 110)))))
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
                          (QREFELT $ 98))))) 

(SDEFUN |FS-;eval;SLLLS;29!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1) . #1=(|FS-;eval;SLLLS;29|))
          (LETT |f| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 94)) |f|))))) 

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
         (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 114)) . #3=(|FS-;smprep|))
              (EXIT
               (COND ((QEQCAR |v| 1) (SPADCALL |p| (QREFELT $ 89)))
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
                                                                          98))
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
                                  (SPADCALL |p| |k| (QREFELT $ 116))
                                  (QREFELT $ 121))
                                 . #3#)
                           (EXIT
                            (COND
                             ((<
                               (LETT |n|
                                     (SPADCALL (SPADCALL |op| (QREFELT $ 48))
                                               |lop| (QREFELT $ 123))
                                     . #3#)
                               (SPADCALL |lop| (QREFELT $ 124)))
                              (SPADCALL |q| |g| (QREFELT $ 125)))
                             (#4#
                              (SEQ (LETT |a| (|spadConstant| $ 126) . #3#)
                                   (LETT |f|
                                         (SPADCALL
                                          (SPADCALL |arg|
                                                    (SPADCALL |lfunc| |n|
                                                              (QREFELT $ 129)))
                                          |lop| |lexp| |lfunc| (QREFELT $ 98))
                                         . #3#)
                                   (LETT |e|
                                         (SPADCALL |lexp| |n| (QREFELT $ 130))
                                         . #3#)
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (SPADCALL |q| (|spadConstant| $ 131)
                                                     (QREFELT $ 132)))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |m|
                                               (SPADCALL |q| (QREFELT $ 133))
                                               . #3#)
                                         (LETT |qr| (DIVIDE2 |m| |e|) . #3#)
                                         (LETT |t1|
                                               (SPADCALL |f| (QCAR |qr|)
                                                         (QREFELT $ 134))
                                               . #3#)
                                         (LETT |t2|
                                               (SPADCALL |g| (QCDR |qr|)
                                                         (QREFELT $ 134))
                                               . #3#)
                                         (LETT |a|
                                               (SPADCALL |a|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |q|
                                                                     (QREFELT $
                                                                              135))
                                                           |t1|
                                                           (QREFELT $ 136))
                                                          |t2| (QREFELT $ 136))
                                                         (QREFELT $ 137))
                                               . #3#)
                                         (EXIT
                                          (LETT |q|
                                                (SPADCALL |q| (QREFELT $ 138))
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
            (SPADCALL (SPADCALL |y| (QREFELT $ 89)) |lop| |lexp| |lfunc|
                      (QREFELT $ 98)))))) 

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
          (LETT |s| (SPADCALL (SPADCALL |l| (QREFELT $ 54)) (QREFELT $ 139))
                . #3=(|FS-;dispdiff|))
          (LETT |t| (SPADCALL (SPADCALL |l| (QREFELT $ 55)) (QREFELT $ 139))
                . #3#)
          (LETT |a|
                (SPADCALL
                 (LETT |k| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 28)) . #3#)
                 (QREFELT $ 46))
                . #3#)
          (EXIT
           (COND
            ((SPADCALL |k| (QREFELT $ 15) (QREFELT $ 140))
             (SEQ (LETT |rec| (|FS-;dispdiff| |a| $) . #3#)
                  (LETT |i| (SPADCALL |s| (QVELT |rec| 2) (QREFELT $ 142))
                        . #3#)
                  (SPADCALL (QVELT |rec| 2) |i| |t| (QREFELT $ 143))
                  (EXIT
                   (VECTOR (QVELT |rec| 0)
                           (SPADCALL (QVELT |rec| 1)
                                     (SPADCALL (SPADCALL '|,| (QREFELT $ 144))
                                               (SPADCALL
                                                (- (+ |i| 1)
                                                   (SPADCALL |a|
                                                             (QREFELT $ 146)))
                                                (QREFELT $ 147))
                                               (QREFELT $ 148))
                                     (QREFELT $ 148))
                           (QVELT |rec| 2) (QVELT |rec| 3)
                           (COND ((ZEROP (QVELT |rec| 4)) 0)
                                 (#4='T (+ (QVELT |rec| 4) 1)))))))
            (#4#
             (SEQ
              (LETT |i|
                    (SPADCALL (SPADCALL |l| (QREFELT $ 54)) |a|
                              (QREFELT $ 149))
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
                            (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 139)) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (SPADCALL |m| |i| |t| (QREFELT $ 143))
              (EXIT
               (VECTOR
                (SPADCALL
                 (SPADCALL (SPADCALL |k| (QREFELT $ 44)) (QREFELT $ 48))
                 (QREFELT $ 144))
                (SPADCALL (SPADCALL '|,| (QREFELT $ 144))
                          (SPADCALL
                           (- (+ |i| 1) (SPADCALL |a| (QREFELT $ 146)))
                           (QREFELT $ 147))
                          (QREFELT $ 148))
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
                                (QREFELT $ 150)))
                     (#2='T
                      (SPADCALL (QVELT |rec| 0) (QVELT |rec| 4)
                                (QREFELT $ 151))))
                    . #1#)
              (LETT |f| (SPADCALL (QVELT |rec| 3) '|%diffDisp| (QREFELT $ 153))
                    . #1#)
              (EXIT
               (COND
                ((QEQCAR |f| 0)
                 (SPADCALL (CONS |opname| (QVELT |rec| 2)) (QCDR |f|)))
                (#2# (SPADCALL |opname| (QVELT |rec| 2) (QREFELT $ 154)))))))) 

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
              (LETT |nargs| (SPADCALL |args| (QREFELT $ 155)) . #8#)
              (LETT |pts| NIL . #8#)
              (SEQ (LETT |dm| NIL . #8#) (LETT #7# |nd| . #8#)
                   (LETT |i| NIL . #8#) (LETT #6# (REVERSE |li|) . #8#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#) . #8#) NIL)
                         (ATOM #7#) (PROGN (LETT |dm| (CAR #7#) . #8#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |pts|
                          (CONS (SPADCALL |nargs| |i| (QREFELT $ 156)) |pts|)
                          . #8#)
                    (EXIT (SPADCALL |nargs| |i| |dm| (QREFELT $ 157))))
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
                       ((NULL (SPADCALL |i| |j| (QREFELT $ 158)))
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
           ((NULL (SPADCALL |i| (QVELT |r1| 1) (QREFELT $ 160)))
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
                 (LETT |nd1| (SPADCALL |nd| |k| (QREFELT $ 161)) . #4#)
                 (LETT |nd2| (SPADCALL |nd| |k| (QREFELT $ 162)) . #4#)
                 (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 91)) (QREFELT $ 38))
                       . #4#)
                 (EXIT
                  (LETT |nd| (SPADCALL |nd1| (CONS |dm| |nd2|) (QREFELT $ 163))
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
              (LETT |res| (|spadConstant| $ 126) . #4#)
              (SEQ (LETT |b| NIL . #4#) (LETT #2# |args| . #4#)
                   (LETT |i| (SPADCALL |args| (QREFELT $ 146)) . #4#)
                   (LETT #1# (SPADCALL |args| (QREFELT $ 164)) . #4#) G190
                   (COND
                    ((OR (> |i| #1#) (ATOM #2#)
                         (PROGN (LETT |b| (CAR #2#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |db| (SPADCALL |b| |x| (QREFELT $ 165)) . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |db| (|spadConstant| $ 126)
                                     (QREFELT $ 166))
                           "iterate")
                          ('T
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL |db|
                                                     (|FS-;pos_diff| |l| |r1|
                                                      |i| $)
                                                     (QREFELT $ 136))
                                           (QREFELT $ 137))
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
                            (|check_union| (QEQCAR #1# 0) (|Symbol|) #1#))
                          (QREFELT $ 165))
                |g| (SPADCALL |l| (QREFELT $ 55)) (QREFELT $ 56)))) 

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
            (LETT |g| (SPADCALL (SPADCALL |l| (QREFELT $ 54)) (QREFELT $ 28))
                  . #2=(|FS-;diffEval|))
            (SEQ (LETT |u| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 80)) . #2#)
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
            (LETT |ud| (SPADCALL |op| (QREFELT $ 169)) . #2#)
            (EXIT
             (COND
              ((QEQCAR |ud| 1)
               (SEQ
                (LETT |dumm|
                      (SPADCALL (|FS-;symsub| (QREFELT $ 82) 1 $)
                                (QREFELT $ 38))
                      . #2#)
                (LETT |ss|
                      (SPADCALL (SPADCALL |l| 1 (QREFELT $ 156))
                                (SPADCALL (SPADCALL |l| 2 (QREFELT $ 156))
                                          |dumm| (QREFELT $ 171))
                                (QREFELT $ 173))
                      . #2#)
                (LETT |nl| (LIST |ss| |dumm| (SPADCALL |l| 3 (QREFELT $ 156)))
                      . #2#)
                (EXIT (SPADCALL (QREFELT $ 15) |nl| (QREFELT $ 47)))))
              ((<
                (LETT |n|
                      (SPADCALL (SPADCALL |l| (QREFELT $ 54))
                                (SPADCALL |k| (QREFELT $ 46)) (QREFELT $ 149))
                      . #2#)
                (SPADCALL |l| (QREFELT $ 146)))
               (|FS-;dfeval| |l| |g| $))
              ('T
               (SEQ (LETT |d| (QCDR |ud|) . #2#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |k| (QREFELT $ 46))
                                (SPADCALL |d| |n| (QREFELT $ 129)))
                      |g| (SPADCALL |l| (QREFELT $ 55)) (QREFELT $ 56)))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |FS-;diffArg|
        ((|l| |List| S) (|op| |BasicOperator|) (|i| |NonNegativeInteger|)
         ($ |List| S))
        (SPROG ((|g| (S)) (|z| (|List| S)) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (+ (- |i| 1) (SPADCALL |l| (QREFELT $ 146)))
                      . #1=(|FS-;diffArg|))
                (LETT |z| (SPADCALL |l| (QREFELT $ 155)) . #1#)
                (SPADCALL |z| |n|
                          (LETT |g|
                                (SPADCALL (|FS-;symsub| (QREFELT $ 82) |n| $)
                                          (QREFELT $ 38))
                                . #1#)
                          (QREFELT $ 157))
                (EXIT
                 (LIST (SPADCALL |op| |z| (QREFELT $ 47)) |g|
                       (SPADCALL |l| |n| (QREFELT $ 156))))))) 

(SDEFUN |FS-;opderiv|
        ((|op| |BasicOperator|) (|n| |NonNegativeInteger|)
         ($ |List| (|Mapping| S (|List| S))))
        (SPROG ((|i| NIL) (#1=#:G371 NIL) (|g| (S)))
               (SEQ
                (COND
                 ((EQL |n| 1)
                  (SEQ
                   (LETT |g|
                         (SPADCALL (|FS-;symsub| (QREFELT $ 82) |n| $)
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
                      (LIST (SPADCALL |op| |g| (QREFELT $ 174)) |g|
                            (SPADCALL |x| (QREFELT $ 94)))
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
                       (SEQ (LETT |u| (SPADCALL |op| (QREFELT $ 169)) . #3#)
                            (EXIT
                             (COND ((QEQCAR |u| 1) (|FS-;opderiv| |op| |n| $))
                                   (#4# (QCDR |u|)))))
                       . #3#)
                 (COND
                  ((SPADCALL (LENGTH |grad|) |n| (QREFELT $ 175))
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
                 (COND ((EQUAL (QCDR |v|) |x|) (|spadConstant| $ 145))
                       (#7='T (|spadConstant| $ 126))))
                (#7#
                 (SEQ
                  (LETT |fn|
                        (SPADCALL (SPADCALL |k| (QREFELT $ 44)) (QREFELT $ 10)
                                  (QREFELT $ 153))
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
                                                        (QREFELT $ 165))
                                              (QREFELT $ 136))
                                    . #6#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #3# (QREFELT $ 137))
                                      . #6#))
                               ('T
                                (PROGN
                                 (LETT #2# #3# . #6#)
                                 (LETT #1# 'T . #6#)))))))
                           (LETT #4#
                                 (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #6#))
                                 . #6#)
                           (GO G190) G191 (EXIT NIL))
                      (COND (#1# #2#) (#7# (|spadConstant| $ 126)))))))))))))) 

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
                      (QREFELT $ 181))
            (QREFELT $ 89))
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
                                     (QREFELT $ 89))
                           (|FS-;kerderiv| |k| |x| $) (QREFELT $ 136))
                          . #5#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 137)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 126))))
           (QREFELT $ 137))))) 

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
        (SPROG ((|a| (|Kernel| S)) (#1=#:G443 NIL) (|r| (|Union| R "failed")))
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
                                     (LETT #1# (SPADCALL |p| (QREFELT $ 114))
                                           . #2#)
                                     (QCDR #1#)
                                   (|check_union| (QEQCAR #1# 0)
                                                  (|Kernel| (QREFELT $ 6))
                                                  #1#))))
                               . #2#)
                         (EXIT
                          (SPADCALL
                           (SPADCALL (ELT $ 89)
                                     (SPADCALL |p| |a| (QREFELT $ 116))
                                     (QREFELT $ 121))
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
                                 (QREFELT $ 77))
                       |lk| (QREFELT $ 208))
                      (QREFELT $ 209))
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
                    (LETT #4# (CONS (SPADCALL |a| (QREFELT $ 210)) #4#)
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
                    (LETT #2# (CONS (SPADCALL |a| |l| (QREFELT $ 62)) #2#)
                          . #5#)))
                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |FS-;kunq|
        ((|k| |Kernel| S) (|l| |List| (|Symbol|)) (|givenlist?| |Boolean|)
         ($ S))
        (SPROG ((#1=#:G552 NIL) (|a| NIL) (#2=#:G551 NIL) (|s| (|Symbol|)))
               (SEQ
                (COND
                 (|givenlist?|
                  (COND ((NULL |l|) (EXIT (SPADCALL |k| (QREFELT $ 26)))))))
                (COND
                 ((SPADCALL |k| (QREFELT $ 16) (QREFELT $ 140))
                  (COND
                   ((OR
                     (SPADCALL
                      (LETT |s|
                            (SPADCALL
                             (|SPADfirst| (SPADCALL |k| (QREFELT $ 46)))
                             (QREFELT $ 211))
                            . #3=(|FS-;kunq|))
                      |l| (QREFELT $ 212))
                     (NULL |l|))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (CONS (SPADCALL |s| (QREFELT $ 58))
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
                                           (CONS (SPADCALL |a| (QREFELT $ 60))
                                                 #2#)
                                           . #3#)))
                                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                   (EXIT (NREVERSE #2#)))))
                       (QREFELT $ 59))
                      (QREFELT $ 214)))))))
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
                  (COND ((NULL |l|) (EXIT (SPADCALL |p| (QREFELT $ 89)))))))
                (EXIT
                 (SPADCALL (CONS #'|FS-;smpunq!0| (VECTOR $ |givenlist?| |l|))
                           (ELT $ 185) |p| (QREFELT $ 205)))))) 

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
         ((#1=#:G561 NIL) (#2=#:G560 #3=(|Boolean|)) (#4=#:G562 #3#)
          (#5=#:G569 NIL) (|k| NIL))
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
             (COND (#1# #2#) (#7='T 'NIL)))
            (CONS 1 "failed"))
           (#7#
            (CONS 0
                  (SPADCALL (CONS #'|FS-;smpret!0| $) (ELT $ 177) |p|
                            (QREFELT $ 219)))))))) 

(SDEFUN |FS-;smpret!0| ((|x| NIL) ($ NIL))
        (SPROG ((#1=#:G564 NIL))
               (SPADCALL
                (PROG2 (LETT #1# (SPADCALL |x| (QREFELT $ 30)) NIL)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) (|Symbol|) #1#))
                (QREFELT $ 215)))) 

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
          (LETT |u| (SPADCALL |x| (QREFELT $ 222)) . #2=(|FS-;isExpt;SBoU;55|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |v| (QCAR (QCDR |u|)) . #2#)
                       (COND
                        ((SPADCALL |v| |op| (QREFELT $ 140))
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
          (LETT |u| (SPADCALL |x| (QREFELT $ 222)) . #2=(|FS-;isExpt;SSU;56|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |v| (QCAR (QCDR |u|)) . #2#)
                       (COND
                        ((SPADCALL |v| |sy| (QREFELT $ 224))
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
         ((#1=#:G608 NIL) (|n| (|Union| (|Integer|) "failed"))
          (|r| (|Union| R "failed"))
          (|q|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| S))))
          (|u| (|Union| (|Kernel| S) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |u| (SPADCALL |p| (QREFELT $ 114)) . #2=(|FS-;smpIsMult|))
             (EXIT
              (COND
               ((QEQCAR |u| 0)
                (COND
                 ((EQL
                   (SPADCALL
                    (LETT |q| (SPADCALL |p| (QCDR |u|) (QREFELT $ 116)) . #2#)
                    (QREFELT $ 226))
                   1)
                  (COND
                   ((SPADCALL
                     (SPADCALL (SPADCALL |q| (QREFELT $ 227)) (QREFELT $ 228))
                     (QREFELT $ 229))
                    (SEQ
                     (LETT |r|
                           (SPADCALL (SPADCALL |q| (QREFELT $ 228))
                                     (QREFELT $ 195))
                           . #2#)
                     (EXIT
                      (COND
                       ((QEQCAR |r| 0)
                        (SEQ
                         (LETT |n| (SPADCALL (QCDR |r|) (QREFELT $ 231)) . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |n| 0)
                            (PROGN
                             (LETT #1# (CONS 0 (CONS (QCDR |n|) (QCDR |u|)))
                                   . #2#)
                             (GO #3=#:G606))))))))))))))))))
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
          (LETT |da| (SPADCALL |l| (QREFELT $ 54)) . #3=(|FS-;decode_diff|))
          (LETT |pt| (SPADCALL |l| (QREFELT $ 55)) . #3#)
          (LETT |a|
                (SPADCALL
                 (LETT |k| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 28)) . #3#)
                 (QREFELT $ 46))
                . #3#)
          (EXIT
           (COND
            ((SPADCALL |k| (QREFELT $ 15) (QREFELT $ 140))
             (SEQ (LETT |rec| (|FS-;decode_diff| |a| $) . #3#)
                  (LETT |i| (SPADCALL |da| (QVELT |rec| 3) (QREFELT $ 149))
                        . #3#)
                  (SPADCALL (QVELT |rec| 3) |i| |pt| (QREFELT $ 157))
                  (LETT |nd| (QVELT |rec| 4) . #3#)
                  (COND
                   ((NULL (SPADCALL |i| (QVELT |rec| 1) (QREFELT $ 160)))
                    (LETT |nd| (CONS |da| |nd|) . #3#)))
                  (EXIT
                   (VECTOR (QVELT |rec| 0) (CONS |i| (QVELT |rec| 1))
                           (QVELT |rec| 2) (QVELT |rec| 3) |nd|))))
            ('T
             (SEQ (LETT |i| (SPADCALL |da| |a| (QREFELT $ 149)) . #3#)
                  (LETT |a1| (SPADCALL |a| (QREFELT $ 155)) . #3#)
                  (SPADCALL |a1| |i| |pt| (QREFELT $ 157))
                  (EXIT (VECTOR |k| (LIST |i|) |a| |a1| (LIST |da|)))))))))) 

(SDEFUN |FS-;equaldiff| ((|k1| |Kernel| S) (|k2| |Kernel| S) ($ |Boolean|))
        (SPROG
         ((|sk1| (S)) (|ok1| (S)) (|od| (|List| (|Kernel| S))) (#1=#:G628 NIL)
          (|dk| NIL) (#2=#:G627 NIL)
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
                              (SPADCALL |k2| (QREFELT $ 44)) (QREFELT $ 233))
                    . #5#)
              (EXIT
               (COND
                (|res|
                 (SEQ
                  (LETT |res|
                        (SPADCALL (SPADCALL |a1| 3 (QREFELT $ 156))
                                  (SPADCALL |a2| 3 (QREFELT $ 156))
                                  (QREFELT $ 166))
                        . #5#)
                  (EXIT
                   (COND
                    (|res|
                     (COND
                      ((SPADCALL (SPADCALL |a1| 2 (QREFELT $ 156))
                                 (SPADCALL |a2| 2 (QREFELT $ 156))
                                 (QREFELT $ 166))
                       (SPADCALL (SPADCALL |a1| 1 (QREFELT $ 156))
                                 (SPADCALL |a2| 1 (QREFELT $ 156))
                                 (QREFELT $ 166)))
                      (#6='T
                       (SEQ (LETT |r1| (|FS-;decode_diff| |a1| $) . #5#)
                            (LETT |r2| (|FS-;decode_diff| |a2| $) . #5#)
                            (COND
                             ((NULL
                               (SPADCALL
                                (SPADCALL (QVELT |r1| 0) (QREFELT $ 44))
                                (SPADCALL (QVELT |r2| 0) (QREFELT $ 44))
                                (QREFELT $ 233)))
                              (EXIT 'NIL)))
                            (COND
                             ((NULL
                               (SPADCALL (QVELT |r1| 1) (QVELT |r2| 1)
                                         (QREFELT $ 234)))
                              (EXIT 'NIL)))
                            (COND
                             ((NULL
                               (SPADCALL (QVELT |r1| 3) (QVELT |r2| 3)
                                         (QREFELT $ 235)))
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
                                            (QREFELT $ 200))
                                  . #5#)
                            (EXIT
                             (SPADCALL |sk1|
                                       (SPADCALL (QVELT |r2| 0) (QREFELT $ 26))
                                       (QREFELT $ 166)))))))
                    (#6# (|FS-;debugA| |a1| |a2| |res| $))))))
                (#6# (|FS-;debugA| |a1| |a2| |res| $))))))) 

(SDEFUN |FS-;mainKernel;SU;61| ((|x| S) ($ |Union| (|Kernel| S) "failed"))
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 114))) 

(SDEFUN |FS-;kernels;SL;62| ((|x| S) ($ |List| (|Kernel| S)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 183))) 

(SDEFUN |FS-;retract;SR;63| ((|x| S) ($ R))
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 238))) 

(SDEFUN |FS-;retract;SP;64| ((|x| S) ($ |Polynomial| R))
        (SPROG ((#1=#:G646 NIL))
               (PROG2
                   (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 92)) $)
                         |FS-;retract;SP;64|)
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                #1#)))) 

(SDEFUN |FS-;retractIfCan;SU;65| ((|x| S) ($ |Union| R "failed"))
        (CONS 0 (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 238)))) 

(SDEFUN |FS-;retractIfCan;SU;66|
        ((|x| S) ($ |Union| (|Polynomial| R) "failed"))
        (|FS-;smpret| (SPADCALL |x| (QREFELT $ 92)) $)) 

(SDEFUN |FS-;eval;SLLS;67|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 92)) |lk| |lv| $)) 

(SDEFUN |FS-;subst;SLLS;68|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 92)) |lk| |lv| $)) 

(SDEFUN |FS-;differentiate;SSS;69| ((|x| S) (|s| |Symbol|) ($ S))
        (|FS-;smpderiv| (SPADCALL |x| (QREFELT $ 92)) |s| $)) 

(SDEFUN |FS-;coerce;SOf;70| ((|x| S) ($ |OutputForm|))
        (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 92)) $)) 

(SDEFUN |FS-;eval;SLS;71| ((|f| S) (|l| |List| (|Symbol|)) ($ S))
        (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 92)) |l| 'T $)) 

(SDEFUN |FS-;eval;2S;72| ((|f| S) ($ S))
        (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 92)) NIL 'NIL $)) 

(SDEFUN |FS-;eval;SLLLS;73|
        ((|x| S) (|s| |List| (|Symbol|)) (|n| |List| (|NonNegativeInteger|))
         (|f| |List| (|Mapping| S (|List| S))) ($ S))
        (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 92)) $)) 

(SDEFUN |FS-;isPlus;SU;74| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPROG
         ((#1=#:G677 NIL) (|p| NIL) (#2=#:G676 NIL)
          (|u|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| S)))
                    "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 252))
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
                                      (CONS (SPADCALL |p| (QREFELT $ 89)) #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |FS-;isTimes;SU;75| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPROG
         ((#1=#:G688 NIL) (|p| NIL) (#2=#:G687 NIL)
          (|u|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| S)))
                    "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 254))
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
                                      (CONS (SPADCALL |p| (QREFELT $ 89)) #2#)
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
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 258))
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
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 258))
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
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 264))) 

(SDEFUN |FS-;convert;SP;79| ((|x| S) ($ |Pattern| (|Float|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 267))) 

(SDEFUN |FS-;isMult;SU;80|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S)))
          "failed"))
        (|FS-;smpIsMult| (SPADCALL |x| (QREFELT $ 92)) $)) 

(SDEFUN |FS-;*;R2S;81| ((|r| R) (|x| S) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |r| (QREFELT $ 272)) (QREFELT $ 89)) |x|
                  (QREFELT $ 136))) 

(SDEFUN |FS-;mainKernel;SU;82| ((|x| S) ($ |Union| (|Kernel| S) "failed"))
        (SPADCALL |x| (QREFELT $ 275))) 

(SDEFUN |FS-;kernels;SL;83| ((|x| S) ($ |List| (|Kernel| S)))
        (SPADCALL |x| (QREFELT $ 276))) 

(SDEFUN |FS-;univariate;SKF;84|
        ((|x| S) (|k| |Kernel| S)
         ($ |Fraction| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |x| |k| (QREFELT $ 278))) 

(SDEFUN |FS-;isPlus;SU;85| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPADCALL |x| (QREFELT $ 282))) 

(SDEFUN |FS-;isTimes;SU;86| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPADCALL |x| (QREFELT $ 283))) 

(SDEFUN |FS-;isExpt;SU;87|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |var| (|Kernel| S)) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPADCALL |x| (QREFELT $ 286))) 

(SDEFUN |FS-;isPower;SU;88|
        ((|x| S)
         ($ |Union| (|Record| (|:| |val| S) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPADCALL |x| (QREFELT $ 289))) 

(SDEFUN |FS-;denominator;2S;89| ((|x| S) ($ S))
        (SPADCALL (SPADCALL |x| (QREFELT $ 290)) (QREFELT $ 89))) 

(SDEFUN |FS-;coerce;FS;90| ((|q| |Fraction| R) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 293)) (QREFELT $ 272))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 294)) (QREFELT $ 272))
                  (QREFELT $ 295))) 

(SDEFUN |FS-;coerce;FS;91| ((|q| |Fraction| (|Polynomial| R)) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 298)) (QREFELT $ 299))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 300)) (QREFELT $ 299))
                  (QREFELT $ 301))) 

(SDEFUN |FS-;coerce;FS;92|
        ((|q| |Fraction| (|Polynomial| (|Fraction| R))) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 305)) (QREFELT $ 306))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 307)) (QREFELT $ 306))
                  (QREFELT $ 301))) 

(SDEFUN |FS-;retract;SP;93| ((|x| S) ($ |Polynomial| R))
        (SPADCALL (SPADCALL |x| (QREFELT $ 309)) (QREFELT $ 310))) 

(SDEFUN |FS-;retract;SF;94| ((|x| S) ($ |Fraction| (|Polynomial| R)))
        (SPROG ((#1=#:G757 NIL))
               (SPADCALL
                (PROG2
                    (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 92)) $)
                          . #2=(|FS-;retract;SF;94|))
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                 #1#))
                (PROG2
                    (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 290)) $)
                          . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                 #1#))
                (QREFELT $ 311)))) 

(SDEFUN |FS-;retract;SR;95| ((|x| S) ($ R))
        (SPROG ((#1=#:G761 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| (QREFELT $ 92))
                                    (QREFELT $ 238))
                          (SPADCALL (SPADCALL |x| (QREFELT $ 290))
                                    (QREFELT $ 238))
                          (QREFELT $ 314))
                         |FS-;retract;SR;95|)
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#)))) 

(SDEFUN |FS-;coerce;SOf;96| ((|x| S) ($ |OutputForm|))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 290)) (|spadConstant| $ 315)
                    (QREFELT $ 316))
          (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 92)) $))
         ('T
          (SPADCALL (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 92)) $)
                    (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 290)) $)
                    (QREFELT $ 317))))) 

(SDEFUN |FS-;retractIfCan;SU;97| ((|x| S) ($ |Union| R "failed"))
        (SPROG
         ((#1=#:G774 NIL) (|r| (|Union| R "failed"))
          (|d| #2=(|Union| R "failed")) (|n| #2#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |n| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 195))
                   . #3=(|FS-;retractIfCan;SU;97|))
             (EXIT
              (COND
               ((QEQCAR |n| 1)
                (PROGN (LETT #1# (CONS 1 #4="failed") . #3#) (GO #5=#:G772)))
               (#6='T
                (SEQ
                 (LETT |d|
                       (SPADCALL (SPADCALL |x| (QREFELT $ 290))
                                 (QREFELT $ 195))
                       . #3#)
                 (EXIT
                  (COND
                   ((QEQCAR |d| 1)
                    (PROGN (LETT #1# (CONS 1 #4#) . #3#) (GO #5#)))
                   (#6#
                    (SEQ
                     (LETT |r| (SPADCALL (QCDR |n|) (QCDR |d|) (QREFELT $ 314))
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
        (SPADCALL (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 92)) |l| 'T $)
                  (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 290)) |l| 'T $)
                  (QREFELT $ 301))) 

(SDEFUN |FS-;eval;2S;99| ((|f| S) ($ S))
        (SPADCALL (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 92)) NIL 'NIL $)
                  (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 290)) NIL 'NIL $)
                  (QREFELT $ 301))) 

(SDEFUN |FS-;eval;SLLLS;100|
        ((|x| S) (|s| |List| (|Symbol|)) (|n| |List| (|NonNegativeInteger|))
         (|f| |List| (|Mapping| S (|List| S))) ($ S))
        (SPADCALL (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 92)) $)
                  (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 290)) $)
                  (QREFELT $ 301))) 

(SDEFUN |FS-;differentiate;SSS;101| ((|f| S) (|x| |Symbol|) ($ S))
        (SPADCALL
         (SPADCALL
          (SPADCALL (|FS-;smpderiv| (SPADCALL |f| (QREFELT $ 92)) |x| $)
                    (SPADCALL (SPADCALL |f| (QREFELT $ 290)) (QREFELT $ 89))
                    (QREFELT $ 136))
          (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 92)) (QREFELT $ 89))
                    (|FS-;smpderiv| (SPADCALL |f| (QREFELT $ 290)) |x| $)
                    (QREFELT $ 136))
          (QREFELT $ 318))
         (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 290)) (QREFELT $ 89)) 2
                   (QREFELT $ 319))
         (QREFELT $ 301))) 

(SDEFUN |FS-;eval;SLLS;102|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPADCALL (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 92)) |lk| |lv| $)
                  (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 290)) |lk| |lv| $)
                  (QREFELT $ 301))) 

(SDEFUN |FS-;subst;SLLS;103|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPADCALL (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 92)) |lk| |lv| $)
                  (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 290)) |lk| |lv| $)
                  (QREFELT $ 301))) 

(SDEFUN |FS-;par| ((|x| S) ($ S))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 18)) |FS-;par|)
                    (EXIT
                     (COND ((QEQCAR |r| 0) |x|)
                           ('T (SPADCALL |x| (QREFELT $ 320)))))))) 

(SDEFUN |FS-;convert;FS;105| ((|x| |Factored| S) ($ S))
        (SPROG
         ((#1=#:G797 NIL) (#2=#:G796 (S)) (#3=#:G798 (S)) (#4=#:G800 NIL)
          (|f| NIL))
         (SEQ
          (SPADCALL (|FS-;par| (SPADCALL |x| (QREFELT $ 322)) $)
                    (PROGN
                     (LETT #1# NIL . #5=(|FS-;convert;FS;105|))
                     (SEQ (LETT |f| NIL . #5#)
                          (LETT #4# (SPADCALL |x| (QREFELT $ 325)) . #5#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3#
                                   (SPADCALL (|FS-;par| (QCAR |f|) $)
                                             (QCDR |f|) (QREFELT $ 319))
                                   . #5#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #3# (QREFELT $ 136))
                                     . #5#))
                              ('T
                               (PROGN
                                (LETT #2# #3# . #5#)
                                (LETT #1# 'T . #5#)))))))
                          (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 145))))
                    (QREFELT $ 136))))) 

(SDEFUN |FS-;retractIfCan;SU;106|
        ((|x| S) ($ |Union| (|Polynomial| R) "failed"))
        (SPROG ((|u| (|Union| (|Fraction| (|Polynomial| R)) "failed")))
               (SEQ
                (LETT |u| (SPADCALL |x| (QREFELT $ 329))
                      |FS-;retractIfCan;SU;106|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T (SPADCALL (QCDR |u|) (QREFELT $ 330)))))))) 

(SDEFUN |FS-;retractIfCan;SU;107|
        ((|x| S) ($ |Union| (|Fraction| (|Polynomial| R)) "failed"))
        (SPROG ((|d| #1=(|Union| (|Polynomial| R) "failed")) (|n| #1#))
               (SEQ
                (LETT |n| (|FS-;smpret| (SPADCALL |x| (QREFELT $ 92)) $)
                      . #2=(|FS-;retractIfCan;SU;107|))
                (EXIT
                 (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                       (#3='T
                        (SEQ
                         (LETT |d|
                               (|FS-;smpret| (SPADCALL |x| (QREFELT $ 290)) $)
                               . #2#)
                         (EXIT
                          (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                (#3#
                                 (CONS 0
                                       (SPADCALL (QCDR |n|) (QCDR |d|)
                                                 (QREFELT $ 311))))))))))))) 

(SDEFUN |FS-;coerce;PS;108| ((|p| |Polynomial| (|Fraction| R)) ($ S))
        (SPADCALL (ELT $ 38) (ELT $ 332) |p| (QREFELT $ 335))) 

(SDEFUN |FS-;coerce;FS;109| ((|x| |Fraction| (|Integer|)) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 338)) (QREFELT $ 339))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 340)) (QREFELT $ 339))
                  (QREFELT $ 295))) 

(SDEFUN |FS-;isMult;SU;110|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S)))
          "failed"))
        (SPROG
         ((|q| (|Union| (|Integer|) "failed"))
          (|r| (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S))))
          (#1=#:G835 NIL) (|w| (|Union| (|Integer|) "failed"))
          (|v| (|Union| R "failed"))
          (|u|
           (|Union|
            (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S)))
            "failed")))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |u| (|FS-;smpIsMult| (SPADCALL |x| (QREFELT $ 92)) $)
                   . #2=(|FS-;isMult;SU;110|))
             (EXIT
              (COND
               ((QEQCAR |u| 1)
                (PROGN (LETT #1# (CONS 1 #3="failed") . #2#) (GO #4=#:G833)))
               (#5='T
                (SEQ
                 (LETT |v|
                       (SPADCALL (SPADCALL |x| (QREFELT $ 290))
                                 (QREFELT $ 195))
                       . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |v| 1)
                    (PROGN (LETT #1# (CONS 1 #3#) . #2#) (GO #4#)))
                   (#5#
                    (SEQ (LETT |w| (SPADCALL (QCDR |v|) (QREFELT $ 231)) . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |w| 1)
                            (PROGN
                             (LETT #1# (CONS 1 #3#) . #2#)
                             (GO #4#))))))))))))))
            (LETT |r| (QCDR |u|) . #2#)
            (LETT |q| (SPADCALL (QCAR |r|) (QCDR |w|) (QREFELT $ 342)) . #2#)
            (EXIT
             (COND ((QEQCAR |q| 1) (CONS 1 "failed"))
                   (#5# (CONS 0 (CONS (QCDR |q|) (QCDR |r|))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |FS-;convert;SP;111| ((|x| S) ($ |Pattern| (|Integer|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 264))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 290)) (QREFELT $ 264))
                  (QREFELT $ 343))) 

(SDEFUN |FS-;convert;SP;112| ((|x| S) ($ |Pattern| (|Float|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 267))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 290)) (QREFELT $ 267))
                  (QREFELT $ 344))) 

(DECLAIM (NOTINLINE |FunctionSpace&;|)) 

(DEFUN |FunctionSpace&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionSpace&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FunctionSpace&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 348) . #1#)
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
             (QSETREFV $ 63 (CONS (|dispatchFunction| |FS-;eval;SSS;16|) $))
             (QSETREFV $ 66 (CONS (|dispatchFunction| |FS-;eval;SBoSSS;17|) $))
             (QSETREFV $ 73 (CONS (|dispatchFunction| |FS-;eval;SLLSS;18|) $))
             (SPADCALL (QREFELT $ 15) '|%specialInput|
                       (CONS (|function| |FS-;indiff|) $) (QREFELT $ 75)))))
          (COND
           ((|testBitVector| |pv$| 6)
            (PROGN
             (QSETREFV $ 82 '%%0)
             (QSETREFV $ 85
                       (CONS (|dispatchFunction| |FS-;characteristic;Nni;21|)
                             $))
             (QSETREFV $ 90 (CONS (|dispatchFunction| |FS-;coerce;KS;22|) $))
             (QSETREFV $ 93
                       (CONS (|dispatchFunction| |FS-;numerator;2S;24|) $))
             (QSETREFV $ 99
                       (CONS (|dispatchFunction| |FS-;eval;SSNniMS;25|) $))
             (QSETREFV $ 100
                       (CONS (|dispatchFunction| |FS-;eval;SSNniMS;26|) $))
             (QSETREFV $ 102 (CONS (|dispatchFunction| |FS-;eval;SLLS;27|) $))
             (QSETREFV $ 111 (CONS (|dispatchFunction| |FS-;elt;BoLS;28|) $))
             (QSETREFV $ 112 (CONS (|dispatchFunction| |FS-;eval;SLLLS;29|) $))
             NIL
             (QSETREFV $ 190 (CONS (|dispatchFunction| |FS-;coerce;PS;44|) $))
             (COND ((|testBitVector| |pv$| 11)))
             (QSETREFV $ 223
                       (CONS (|dispatchFunction| |FS-;isExpt;SBoU;55|) $))
             (QSETREFV $ 225 (CONS (|dispatchFunction| |FS-;isExpt;SSU;56|) $))
             (COND ((|testBitVector| |pv$| 1)))
             (SPADCALL (QREFELT $ 15) (CONS (|function| |FS-;diffEval|) $)
                       (QREFELT $ 232))
             (SPADCALL (QREFELT $ 15) '|%specialEqual|
                       (CONS (|function| |FS-;equaldiff|) $) (QREFELT $ 75))
             (SPADCALL (QREFELT $ 15) (QREFELT $ 10)
                       (CONS (|function| |FS-;diffdiff|) $) (QREFELT $ 75))
             (SPADCALL (QREFELT $ 15) '|%specialDisp|
                       (CONS (|function| |FS-;ddiff|) $) (QREFELT $ 75))
             (COND ((|testBitVector| |pv$| 2))
                   ('T
                    (PROGN
                     (QSETREFV $ 236
                               (CONS
                                (|dispatchFunction| |FS-;mainKernel;SU;61|) $))
                     (QSETREFV $ 237
                               (CONS (|dispatchFunction| |FS-;kernels;SL;62|)
                                     $))
                     (QSETREFV $ 239
                               (CONS (|dispatchFunction| |FS-;retract;SR;63|)
                                     $))
                     (QSETREFV $ 240
                               (CONS (|dispatchFunction| |FS-;retract;SP;64|)
                                     $))
                     (QSETREFV $ 241
                               (CONS
                                (|dispatchFunction| |FS-;retractIfCan;SU;65|)
                                $))
                     (QSETREFV $ 243
                               (CONS
                                (|dispatchFunction| |FS-;retractIfCan;SU;66|)
                                $))
                     (QSETREFV $ 244
                               (CONS (|dispatchFunction| |FS-;eval;SLLS;67|)
                                     $))
                     (QSETREFV $ 245
                               (CONS (|dispatchFunction| |FS-;subst;SLLS;68|)
                                     $))
                     (QSETREFV $ 246
                               (CONS
                                (|dispatchFunction| |FS-;differentiate;SSS;69|)
                                $))
                     (QSETREFV $ 247
                               (CONS (|dispatchFunction| |FS-;coerce;SOf;70|)
                                     $))
                     (COND
                      ((|testBitVector| |pv$| 11)
                       (PROGN
                        (QSETREFV $ 248
                                  (CONS (|dispatchFunction| |FS-;eval;SLS;71|)
                                        $))
                        (QSETREFV $ 249
                                  (CONS (|dispatchFunction| |FS-;eval;2S;72|)
                                        $)))))
                     (QSETREFV $ 250
                               (CONS (|dispatchFunction| |FS-;eval;SLLLS;73|)
                                     $))
                     (QSETREFV $ 253
                               (CONS (|dispatchFunction| |FS-;isPlus;SU;74|)
                                     $))
                     (QSETREFV $ 255
                               (CONS (|dispatchFunction| |FS-;isTimes;SU;75|)
                                     $))
                     (QSETREFV $ 259
                               (CONS (|dispatchFunction| |FS-;isExpt;SU;76|)
                                     $))
                     (QSETREFV $ 262
                               (CONS (|dispatchFunction| |FS-;isPower;SU;77|)
                                     $))
                     (COND
                      ((|HasCategory| |#2|
                                      '(|ConvertibleTo|
                                        (|Pattern| (|Integer|))))
                       (QSETREFV $ 265
                                 (CONS (|dispatchFunction| |FS-;convert;SP;78|)
                                       $))))
                     (COND
                      ((|HasCategory| |#2|
                                      '(|ConvertibleTo| (|Pattern| (|Float|))))
                       (QSETREFV $ 268
                                 (CONS (|dispatchFunction| |FS-;convert;SP;79|)
                                       $))))
                     (COND
                      ((|testBitVector| |pv$| 1)
                       (QSETREFV $ 271
                                 (CONS (|dispatchFunction| |FS-;isMult;SU;80|)
                                       $))))))))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 273 (CONS (|dispatchFunction| |FS-;*;R2S;81|) $))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 236
                       (CONS (|dispatchFunction| |FS-;mainKernel;SU;82|) $))
             (QSETREFV $ 237 (CONS (|dispatchFunction| |FS-;kernels;SL;83|) $))
             (QSETREFV $ 280
                       (CONS (|dispatchFunction| |FS-;univariate;SKF;84|) $))
             (QSETREFV $ 253 (CONS (|dispatchFunction| |FS-;isPlus;SU;85|) $))
             (QSETREFV $ 255 (CONS (|dispatchFunction| |FS-;isTimes;SU;86|) $))
             (QSETREFV $ 259 (CONS (|dispatchFunction| |FS-;isExpt;SU;87|) $))
             (QSETREFV $ 262 (CONS (|dispatchFunction| |FS-;isPower;SU;88|) $))
             (QSETREFV $ 291
                       (CONS (|dispatchFunction| |FS-;denominator;2S;89|) $))
             (QSETREFV $ 296 (CONS (|dispatchFunction| |FS-;coerce;FS;90|) $))
             (QSETREFV $ 302 (CONS (|dispatchFunction| |FS-;coerce;FS;91|) $))
             (QSETREFV $ 308 (CONS (|dispatchFunction| |FS-;coerce;FS;92|) $))
             (QSETREFV $ 240 (CONS (|dispatchFunction| |FS-;retract;SP;93|) $))
             (QSETREFV $ 312 (CONS (|dispatchFunction| |FS-;retract;SF;94|) $))
             (QSETREFV $ 239 (CONS (|dispatchFunction| |FS-;retract;SR;95|) $))
             (QSETREFV $ 247 (CONS (|dispatchFunction| |FS-;coerce;SOf;96|) $))
             (QSETREFV $ 241
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;97|) $))
             (QSETREFV $ 248 (CONS (|dispatchFunction| |FS-;eval;SLS;98|) $))
             (COND
              ((|testBitVector| |pv$| 11)
               (PROGN
                (QSETREFV $ 249 (CONS (|dispatchFunction| |FS-;eval;2S;99|) $))
                (QSETREFV $ 250
                          (CONS (|dispatchFunction| |FS-;eval;SLLLS;100|)
                                $)))))
             (QSETREFV $ 246
                       (CONS (|dispatchFunction| |FS-;differentiate;SSS;101|)
                             $))
             (QSETREFV $ 244 (CONS (|dispatchFunction| |FS-;eval;SLLS;102|) $))
             (QSETREFV $ 245
                       (CONS (|dispatchFunction| |FS-;subst;SLLS;103|) $))
             (QSETREFV $ 327
                       (CONS (|dispatchFunction| |FS-;convert;FS;105|) $))
             (QSETREFV $ 243
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;106|) $))
             (QSETREFV $ 331
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;107|) $))
             (QSETREFV $ 336 (CONS (|dispatchFunction| |FS-;coerce;PS;108|) $))
             (COND
              ((|testBitVector| |pv$| 1)
               (PROGN
                (QSETREFV $ 341
                          (CONS (|dispatchFunction| |FS-;coerce;FS;109|) $))
                (QSETREFV $ 271
                          (CONS (|dispatchFunction| |FS-;isMult;SU;110|) $)))))
             (COND
              ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Integer|))))
               (QSETREFV $ 265
                         (CONS (|dispatchFunction| |FS-;convert;SP;111|) $))))
             (COND
              ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Float|))))
               (QSETREFV $ 268
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
              (85 . |string|) (|OutputForm|) (90 . |coerce|)
              |FS-;operator;2Bo;12| (95 . |second|) (100 . |third|)
              (105 . |eval|) (|InputForm|) (112 . |convert|) (117 . |convert|)
              (122 . |convert|) (|List| 12) (127 . |eval|) (133 . |eval|)
              (|List| 11) (139 . |eval|) (147 . |eval|) (|Mapping| 6 6)
              (|MakeUnaryCompiledFunction| 6 6 6) (155 . |compiledFunction|)
              (|Mapping| $ $) (|List| 70) (161 . |eval|) (168 . |eval|)
              (|None|) (176 . |setProperty|) (|List| 25) (183 . |tower|)
              |FS-;variables;SL;19| (|Union| 25 '#1#) (188 . |retractIfCan|)
              |FS-;retractIfCan;SU;20| '|gendiff| (|NonNegativeInteger|)
              (193 . |characteristic|) (197 . |characteristic|)
              (|SparseMultivariatePolynomial| 7 23) (201 . |coerce|)
              (|SparseMultivariatePolynomial| 7 25) (206 . |coerce|)
              (211 . |coerce|) (216 . |new|) (220 . |numer|)
              (225 . |numerator|) (230 . |first|) (|List| 83) (|Mapping| $ 32)
              (|List| 96) (235 . |eval|) (243 . |eval|) (251 . |eval|)
              (259 . |new|) (265 . |eval|) (272 . |unary?|)
              (277 . |leadingCoefficient|) (282 . |Zero|) (286 . |smaller?|)
              (292 . -) (297 . |elt|) (|ExpressionSpace&| 6) (303 . |elt|)
              (309 . |elt|) (315 . |eval|) (|Union| 23 '"failed")
              (323 . |mainVariable|) (|SparseUnivariatePolynomial| $)
              (328 . |univariate|) (|SparseUnivariatePolynomial| 6)
              (|Mapping| 6 86) (|SparseUnivariatePolynomial| 86)
              (|SparseUnivariatePolynomialFunctions2| 86 6) (334 . |map|)
              (|Integer|) (340 . |position|) (346 . |minIndex|) (351 . |elt|)
              (357 . |Zero|) (|Mapping| 6 45) (|List| 127) (361 . |elt|)
              (367 . |elt|) (373 . |Zero|) (377 . ~=) (383 . |degree|)
              (388 . ^) (394 . |leadingCoefficient|) (399 . *) (405 . +)
              (411 . |reductum|) (416 . |coerce|) (421 . |is?|) (|List| 51)
              (427 . |position|) (433 . |setelt!|) (440 . |coerce|)
              (445 . |One|) (449 . |minIndex|) (454 . |coerce|)
              (459 . |hconcat|) (465 . |position|) (471 . |sub|)
              (477 . |differentiate|) (|Union| 74 '"failed") (483 . |property|)
              (489 . |prefix|) (495 . |copy|) (500 . |elt|) (506 . |setelt!|)
              (513 . >) (|List| 122) (519 . |member?|) (525 . |first|)
              (531 . |rest|) (537 . |concat|) (543 . |maxIndex|)
              (548 . |differentiate|) (554 . =) (|Union| 128 '"failed")
              (|BasicOperatorFunctions1| 6) (560 . |derivative|) (|Equation| 6)
              (565 . =) (|Equation| $) (571 . |subst|) (577 . |kernel|)
              (583 . ~=) (|Polynomial| 7) (589 . |coerce|)
              (594 . |differentiate|) (600 . |retract|) (|Mapping| 7 7)
              (605 . |map|) (|List| 23) (611 . |variables|)
              (616 . |differentiate|) (622 . |coerce|) (|Mapping| 6 12)
              (|Mapping| 6 7)
              (|PolynomialCategoryLifting| (|IndexedExponents| 12) 12 7 176 6)
              (627 . |map|) (634 . |coerce|) (|Union| 19 '"failed")
              (|UserDefinedPartialOrdering| 12) (639 . |less?|) (645 . <)
              (651 . |retractIfCan|) (656 . |coerce|) (661 . |userOrdered?|)
              (665 . |coerce|) (670 . |outputForm|) (676 . |subst|)
              (|Mapping| 6 23) (|ListToMap| 23 6) (683 . |match|)
              (|PolynomialCategoryLifting| (|IndexedExponents| 23) 23 7 86 6)
              (691 . |map|) (698 . |eval|) (705 . |map|)
              (711 . |setIntersection|) (717 . |empty?|) (722 . |eval|)
              (727 . |retract|) (732 . |member?|) (|InputFormFunctions1| 6)
              (738 . |interpret|) (743 . |coerce|) (|Mapping| 176 23)
              (|Mapping| 176 7)
              (|PolynomialCategoryLifting| (|IndexedExponents| 23) 23 7 86 176)
              (748 . |map|) (|Record| (|:| |var| 25) (|:| |exponent| 122))
              (|Union| 220 '"failed") (755 . |isExpt|) (760 . |isExpt|)
              (766 . |is?|) (772 . |isExpt|) (778 . |degree|)
              (783 . |reductum|) (788 . |leadingCoefficient|) (793 . |zero?|)
              (|Union| 122 '#1#) (798 . |retractIfCan|) (803 . |evaluate|)
              (809 . =) (815 . =) (821 . =) (827 . |mainKernel|)
              (832 . |kernels|) (837 . |retract|) (842 . |retract|)
              (847 . |retract|) (852 . |retractIfCan|) (|Union| 176 '"failed")
              (857 . |retractIfCan|) (862 . |eval|) (869 . |subst|)
              (876 . |differentiate|) (882 . |coerce|) (887 . |eval|)
              (893 . |eval|) (898 . |eval|) (|Union| 32 '#2="failed")
              (906 . |isPlus|) (911 . |isPlus|) (916 . |isTimes|)
              (921 . |isTimes|) (|Record| (|:| |var| 23) (|:| |exponent| 83))
              (|Union| 256 '#2#) (926 . |isExpt|) (931 . |isExpt|)
              (|Record| (|:| |val| $) (|:| |exponent| 122))
              (|Union| 260 '"failed") (936 . |isPower|) (|Pattern| 122)
              (941 . |convert|) (946 . |convert|) (|Pattern| (|Float|))
              (951 . |convert|) (956 . |convert|)
              (|Record| (|:| |coef| 122) (|:| |var| 25))
              (|Union| 269 '"failed") (961 . |isMult|) (966 . |coerce|)
              (971 . *)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 23) 23
                                                     7 86 6)
              (977 . |mainVariable|) (982 . |variables|) (|Fraction| 117)
              (987 . |univariate|) (|Fraction| 115) (993 . |univariate|)
              (|Union| 45 '"failed") (999 . |isPlus|) (1004 . |isTimes|)
              (|Record| (|:| |var| 23) (|:| |exponent| 122))
              (|Union| 284 '"failed") (1009 . |isExpt|)
              (|Record| (|:| |val| 6) (|:| |exponent| 122))
              (|Union| 287 '"failed") (1014 . |isPower|) (1019 . |denom|)
              (1024 . |denominator|) (|Fraction| 7) (1029 . |numer|)
              (1034 . |denom|) (1039 . /) (1045 . |coerce|) (|Fraction| 176)
              (1050 . |numer|) (1055 . |coerce|) (1060 . |denom|) (1065 . /)
              (1071 . |coerce|) (|Polynomial| 292) (|Fraction| 303)
              (1076 . |numer|) (1081 . |coerce|) (1086 . |denom|)
              (1091 . |coerce|) (1096 . |retract|) (1101 . |retract|)
              (1106 . /) (1112 . |retract|) (|Union| $ '"failed")
              (1117 . |exquo|) (1123 . |One|) (1127 . =) (1133 . /) (1139 . -)
              (1145 . ^) (1151 . |paren|) (|Factored| 6) (1156 . |unit|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 122)) (|List| 323)
              (1161 . |factors|) (|Factored| $) (1166 . |convert|)
              (|Union| 297 '#1#) (1171 . |retractIfCan|)
              (1176 . |retractIfCan|) (1181 . |retractIfCan|) (1186 . |coerce|)
              (|Mapping| 6 292)
              (|PolynomialCategoryLifting| (|IndexedExponents| 12) 12 292 303
                                           6)
              (1191 . |map|) (1198 . |coerce|) (|Fraction| 122)
              (1203 . |numer|) (1208 . |coerce|) (1213 . |denom|)
              (1218 . |coerce|) (1223 . |exquo|) (1229 . /) (1235 . /)
              (|PositiveInteger|) (|Union| 337 '#1#) (|List| 172))
           '#(|variables| 1241 |univariate| 1246 |subst| 1252 |retractIfCan|
              1259 |retract| 1279 |operator| 1299 |numerator| 1304 |mainKernel|
              1309 |kernels| 1314 |isTimes| 1319 |isPower| 1324 |isPlus| 1329
              |isMult| 1334 |isExpt| 1339 |ground?| 1356 |ground| 1361 |eval|
              1366 |elt| 1445 |differentiate| 1451 |denominator| 1457 |convert|
              1462 |coerce| 1477 |characteristic| 1522 |belong?| 1526
              |applyQuote| 1531 * 1567)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 344
                                                 '(1 13 11 12 14 1 6 17 0 18 1
                                                   6 7 0 21 1 23 0 12 24 1 6 0
                                                   25 26 1 6 25 0 28 1 23 29 0
                                                   30 2 6 0 12 32 33 1 6 0 12
                                                   38 2 6 0 11 32 39 2 11 19 0
                                                   12 41 2 11 19 0 12 42 1 23
                                                   11 0 44 1 23 45 0 46 2 6 0
                                                   11 32 47 1 11 12 0 48 1 12
                                                   49 0 50 1 49 51 0 52 1 45 6
                                                   0 54 1 45 6 0 55 3 6 0 0 25
                                                   0 56 1 12 57 0 58 1 57 0 32
                                                   59 1 6 57 0 60 2 6 0 0 61 62
                                                   2 0 0 0 12 63 4 6 0 0 64 32
                                                   12 65 4 0 0 0 11 0 12 66 2
                                                   68 67 6 12 69 3 6 0 0 64 71
                                                   72 4 0 0 0 64 32 12 73 3 11
                                                   0 0 12 74 75 1 6 76 0 77 1 6
                                                   79 0 80 0 7 83 84 0 0 83 85
                                                   1 86 0 23 87 1 6 0 88 89 1 0
                                                   0 25 90 0 12 0 91 1 6 88 0
                                                   92 1 0 0 0 93 1 45 6 0 94 4
                                                   6 0 0 61 95 97 98 4 0 0 0 12
                                                   83 70 99 4 0 0 0 12 83 96
                                                   100 2 95 0 83 83 101 3 0 0 0
                                                   61 97 102 1 11 19 0 103 1 86
                                                   7 0 104 0 7 0 105 2 7 19 0 0
                                                   106 1 6 0 0 107 2 6 0 11 0
                                                   108 2 109 0 11 32 110 2 0 0
                                                   11 32 111 4 0 0 0 61 95 71
                                                   112 1 86 113 0 114 2 86 115
                                                   0 23 116 2 120 117 118 119
                                                   121 2 61 122 12 0 123 1 61
                                                   122 0 124 2 117 6 0 6 125 0
                                                   6 0 126 2 128 127 0 122 129
                                                   2 95 83 0 122 130 0 117 0
                                                   131 2 117 19 0 0 132 1 117
                                                   83 0 133 2 6 0 0 83 134 1
                                                   117 6 0 135 2 6 0 0 0 136 2
                                                   6 0 0 0 137 1 117 0 0 138 1
                                                   6 51 0 139 2 23 19 0 11 140
                                                   2 141 122 51 0 142 3 141 51
                                                   0 122 51 143 1 12 51 0 144 0
                                                   6 0 145 1 45 122 0 146 1 122
                                                   51 0 147 2 51 0 0 0 148 2 45
                                                   122 6 0 149 2 51 0 0 0 150 2
                                                   51 0 0 83 151 2 11 152 0 12
                                                   153 2 51 0 0 32 154 1 45 0 0
                                                   155 2 45 6 0 122 156 3 45 6
                                                   0 122 6 157 2 122 19 0 0 158
                                                   2 159 19 122 0 160 2 45 0 0
                                                   83 161 2 45 0 0 83 162 2 45
                                                   0 0 0 163 1 45 122 0 164 2 6
                                                   0 0 12 165 2 6 19 0 0 166 1
                                                   168 167 11 169 2 170 0 6 6
                                                   171 2 6 0 0 172 173 2 6 0 11
                                                   0 174 2 83 19 0 0 175 1 176
                                                   0 7 177 2 176 0 0 12 178 1
                                                   176 7 0 179 2 86 0 180 0 181
                                                   1 86 182 0 183 2 86 0 0 23
                                                   184 1 6 0 7 185 3 188 6 186
                                                   187 176 189 1 0 0 176 190 2
                                                   192 191 12 12 193 2 23 19 0
                                                   0 194 1 86 17 0 195 1 7 51 0
                                                   196 0 192 19 197 1 23 51 0
                                                   198 2 117 51 0 51 199 3 6 0
                                                   0 76 32 200 4 202 6 182 45
                                                   23 201 203 3 204 6 201 187
                                                   86 205 3 6 0 0 76 32 206 2 6
                                                   0 70 25 207 2 182 0 0 0 208
                                                   1 182 19 0 209 1 6 0 0 210 1
                                                   6 12 0 211 2 61 19 12 0 212
                                                   1 213 6 57 214 1 176 0 12
                                                   215 3 218 176 216 217 86 219
                                                   1 6 221 0 222 2 0 221 0 11
                                                   223 2 23 19 0 12 224 2 0 221
                                                   0 12 225 1 119 83 0 226 1
                                                   119 0 0 227 1 119 86 0 228 1
                                                   86 19 0 229 1 7 230 0 231 2
                                                   168 11 11 127 232 2 11 19 0
                                                   0 233 2 159 19 0 0 234 2 45
                                                   19 0 0 235 1 0 79 0 236 1 0
                                                   76 0 237 1 86 7 0 238 1 0 7
                                                   0 239 1 0 176 0 240 1 0 17 0
                                                   241 1 0 242 0 243 3 0 0 0 76
                                                   32 244 3 0 0 0 76 32 245 2 0
                                                   0 0 12 246 1 0 51 0 247 2 0
                                                   0 0 61 248 1 0 0 0 249 4 0 0
                                                   0 61 95 97 250 1 86 251 0
                                                   252 1 0 251 0 253 1 86 251 0
                                                   254 1 0 251 0 255 1 86 257 0
                                                   258 1 0 221 0 259 1 0 261 0
                                                   262 1 86 263 0 264 1 0 263 0
                                                   265 1 86 266 0 267 1 0 266 0
                                                   268 1 0 270 0 271 1 86 0 7
                                                   272 2 0 0 7 0 273 1 274 113
                                                   6 275 1 274 182 6 276 2 274
                                                   277 6 23 278 2 0 279 0 25
                                                   280 1 274 281 6 282 1 274
                                                   281 6 283 1 274 285 6 286 1
                                                   274 288 6 289 1 6 88 0 290 1
                                                   0 0 0 291 1 292 7 0 293 1
                                                   292 7 0 294 2 6 0 88 88 295
                                                   1 0 0 292 296 1 297 176 0
                                                   298 1 6 0 176 299 1 297 176
                                                   0 300 2 6 0 0 0 301 1 0 0
                                                   297 302 1 304 303 0 305 1 6
                                                   0 303 306 1 304 303 0 307 1
                                                   0 0 304 308 1 6 297 0 309 1
                                                   297 176 0 310 2 297 0 176
                                                   176 311 1 0 297 0 312 2 7
                                                   313 0 0 314 0 86 0 315 2 86
                                                   19 0 0 316 2 51 0 0 0 317 2
                                                   6 0 0 0 318 2 6 0 0 122 319
                                                   1 6 0 0 320 1 321 6 0 322 1
                                                   321 324 0 325 1 0 0 326 327
                                                   1 6 328 0 329 1 297 242 0
                                                   330 1 0 328 0 331 1 6 0 292
                                                   332 3 334 6 186 333 303 335
                                                   1 0 0 303 336 1 337 122 0
                                                   338 1 86 0 122 339 1 337 122
                                                   0 340 1 0 0 337 341 2 122
                                                   313 0 0 342 2 263 0 0 0 343
                                                   2 266 0 0 0 344 1 0 61 0 78
                                                   2 0 279 0 25 280 3 0 0 0 76
                                                   32 245 1 0 242 0 243 1 0 328
                                                   0 331 1 0 17 0 241 1 0 29 0
                                                   81 1 0 176 0 240 1 0 297 0
                                                   312 1 0 7 0 239 1 0 12 0 31
                                                   1 0 11 11 53 1 0 0 0 93 1 0
                                                   79 0 236 1 0 76 0 237 1 0
                                                   251 0 255 1 0 261 0 262 1 0
                                                   251 0 253 1 0 270 0 271 2 0
                                                   221 0 11 223 2 0 221 0 12
                                                   225 1 0 221 0 259 1 0 19 0
                                                   20 1 0 7 0 22 4 0 0 0 12 83
                                                   70 99 4 0 0 0 61 95 97 250 4
                                                   0 0 0 12 83 96 100 4 0 0 0
                                                   61 95 71 112 4 0 0 0 64 32
                                                   12 73 1 0 0 0 249 4 0 0 0 11
                                                   0 12 66 2 0 0 0 12 63 2 0 0
                                                   0 61 248 3 0 0 0 61 97 102 3
                                                   0 0 0 76 32 244 2 0 0 11 32
                                                   111 2 0 0 0 12 246 1 0 0 0
                                                   291 1 0 0 326 327 1 0 263 0
                                                   265 1 0 266 0 268 1 0 0 176
                                                   190 1 0 0 337 341 1 0 0 297
                                                   302 1 0 0 303 336 1 0 0 304
                                                   308 1 0 0 292 296 1 0 0 12
                                                   27 1 0 51 0 247 1 0 0 25 90
                                                   0 0 83 85 1 0 19 11 43 5 0 0
                                                   12 0 0 0 0 37 2 0 0 12 32 40
                                                   4 0 0 12 0 0 0 36 2 0 0 12 0
                                                   34 3 0 0 12 0 0 35 2 0 0 7 0
                                                   273)))))
           '|lookupComplete|)) 
