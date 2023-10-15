
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

(SDEFUN |FS-;variables;LL;19| ((|lx| |List| S) ($ |List| (|Symbol|)))
        (SPROG
         ((|l| (|List| (|Symbol|))) (|s| (|Union| (|Symbol|) "failed"))
          (#1=#:G199 NIL) (|k| NIL))
         (SEQ (LETT |l| NIL . #2=(|FS-;variables;LL;19|))
              (SEQ (LETT |k| NIL . #2#)
                   (LETT #1# (SPADCALL |lx| (QREFELT $ 75)) . #2#) G190
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

(SDEFUN |FS-;variables;SL;20| ((|x| S) ($ |List| (|Symbol|)))
        (SPADCALL (LIST |x|) (QREFELT $ 77))) 

(SDEFUN |FS-;retractIfCan;SU;21| ((|x| S) ($ |Union| (|Symbol|) "failed"))
        (SPROG ((|k| (|Union| (|Kernel| S) "failed")))
               (SEQ
                (LETT |k| (SPADCALL |x| (QREFELT $ 80))
                      |FS-;retractIfCan;SU;21|)
                (EXIT
                 (COND ((QEQCAR |k| 1) (CONS 1 "failed"))
                       ('T (SPADCALL (QCDR |k|) (QREFELT $ 30)))))))) 

(SDEFUN |FS-;characteristic;Nni;22| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 84))) 

(SDEFUN |FS-;coerce;KS;23| ((|k| |Kernel| S) ($ S))
        (SPADCALL (SPADCALL |k| (QREFELT $ 87)) (QREFELT $ 89))) 

(SDEFUN |FS-;symsub| ((|sy| |Symbol|) (|i| |Integer|) ($ |Symbol|))
        (SPADCALL (QREFELT $ 91))) 

(SDEFUN |FS-;numerator;2S;25| ((|x| S) ($ S))
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 89))) 

(SDEFUN |FS-;eval;SSNniMS;26|
        ((|x| S) (|s| |Symbol|) (|n| |NonNegativeInteger|) (|f| |Mapping| S S)
         ($ S))
        (SPROG NIL
               (SPADCALL |x| (LIST |s|) (LIST |n|)
                         (LIST (CONS #'|FS-;eval;SSNniMS;26!0| (VECTOR |f| $)))
                         (QREFELT $ 98)))) 

(SDEFUN |FS-;eval;SSNniMS;26!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1) . #1=(|FS-;eval;SSNniMS;26|))
          (LETT |f| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 94)) |f|))))) 

(SDEFUN |FS-;eval;SSNniMS;27|
        ((|x| S) (|s| |Symbol|) (|n| |NonNegativeInteger|)
         (|f| |Mapping| S (|List| S)) ($ S))
        (SPADCALL |x| (LIST |s|) (LIST |n|) (LIST |f|) (QREFELT $ 98))) 

(SDEFUN |FS-;eval;SLLS;28|
        ((|x| S) (|l| |List| (|Symbol|)) (|f| |List| (|Mapping| S (|List| S)))
         ($ S))
        (SPADCALL |x| |l| (SPADCALL (LENGTH |l|) 1 (QREFELT $ 101)) |f|
                  (QREFELT $ 98))) 

(SDEFUN |FS-;elt;BoLS;29| ((|op| |BasicOperator|) (|args| |List| S) ($ S))
        (SPROG ((#1=#:G234 NIL) (|x| (S)) (|od?| (|Boolean|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |op| (QREFELT $ 103))
                    (SEQ
                     (LETT |od?| (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 41))
                           . #2=(|FS-;elt;BoLS;29|))
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
                           (GO #3=#:G232))))))))))
                  (EXIT (SPADCALL |op| |args| (QREFELT $ 110)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FS-;eval;SLLLS;30|
        ((|x| S) (|s| |List| (|Symbol|)) (|n| |List| (|NonNegativeInteger|))
         (|l| |List| (|Mapping| S S)) ($ S))
        (SPROG ((#1=#:G239 NIL) (|f| NIL) (#2=#:G238 NIL))
               (SEQ
                (SPADCALL |x| |s| |n|
                          (PROGN
                           (LETT #2# NIL . #3=(|FS-;eval;SLLLS;30|))
                           (SEQ (LETT |f| NIL . #3#) (LETT #1# |l| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (CONS #'|FS-;eval;SLLLS;30!0|
                                               (VECTOR |f| $))
                                         #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 98))))) 

(SDEFUN |FS-;eval;SLLLS;30!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1) . #1=(|FS-;eval;SLLLS;30|))
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
          (|n| (|Integer|)) (|g| (S)) (|arg| (|List| S)) (#1=#:G268 NIL)
          (#2=#:G267 NIL) (|op| (|BasicOperator|)) (|k| (|Kernel| S))
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
         ((|m| (|List| (|OutputForm|))) (#1=#:G281 NIL) (|x| NIL)
          (#2=#:G280 NIL) (|i| (|Integer|))
          (|rec|
           (|Record| (|:| |name| (|OutputForm|)) (|:| |sub| (|OutputForm|))
                     (|:| |arg| (|List| (|OutputForm|)))
                     (|:| |orig_op| (|BasicOperator|))
                     (|:| |level| (|NonNegativeInteger|))))
          (|a| (|List| S)) (|k| (|Kernel| S)) (|t| (|OutputForm|))
          (|s| (|OutputForm|)))
         (SEQ
          (LETT |s| (SPADCALL (SPADCALL |l| (QREFELT $ 52)) (QREFELT $ 140))
                . #3=(|FS-;dispdiff|))
          (LETT |t| (SPADCALL (SPADCALL |l| (QREFELT $ 53)) (QREFELT $ 140))
                . #3#)
          (LETT |a|
                (SPADCALL
                 (LETT |k| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 28)) . #3#)
                 (QREFELT $ 46))
                . #3#)
          (EXIT
           (COND
            ((SPADCALL |k| (QREFELT $ 15) (QREFELT $ 141))
             (SEQ (LETT |rec| (|FS-;dispdiff| |a| $) . #3#)
                  (LETT |i| (SPADCALL |s| (QVELT |rec| 2) (QREFELT $ 143))
                        . #3#)
                  (SPADCALL (QVELT |rec| 2) |i| |t| (QREFELT $ 144))
                  (EXIT
                   (VECTOR (QVELT |rec| 0)
                           (SPADCALL (QVELT |rec| 1)
                                     (SPADCALL (SPADCALL '|,| (QREFELT $ 145))
                                               (SPADCALL
                                                (- (+ |i| 1)
                                                   (SPADCALL |a|
                                                             (QREFELT $ 147)))
                                                (QREFELT $ 148))
                                               (QREFELT $ 149))
                                     (QREFELT $ 149))
                           (QVELT |rec| 2) (QVELT |rec| 3)
                           (COND ((ZEROP (QVELT |rec| 4)) 0)
                                 (#4='T (+ (QVELT |rec| 4) 1)))))))
            (#4#
             (SEQ
              (LETT |i|
                    (SPADCALL (SPADCALL |l| (QREFELT $ 52)) |a|
                              (QREFELT $ 150))
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
                            (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 140)) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (SPADCALL |m| |i| |t| (QREFELT $ 144))
              (EXIT
               (VECTOR
                (SPADCALL
                 (SPADCALL (SPADCALL |k| (QREFELT $ 44)) (QREFELT $ 48))
                 (QREFELT $ 145))
                (SPADCALL (SPADCALL '|,| (QREFELT $ 145))
                          (SPADCALL
                           (- (+ |i| 1) (SPADCALL |a| (QREFELT $ 147)))
                           (QREFELT $ 148))
                          (QREFELT $ 149))
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
                                (QREFELT $ 151)))
                     (#2='T
                      (SPADCALL (QVELT |rec| 0) (QVELT |rec| 4)
                                (QREFELT $ 152))))
                    . #1#)
              (LETT |f| (SPADCALL (QVELT |rec| 3) '|%diffDisp| (QREFELT $ 154))
                    . #1#)
              (EXIT
               (COND
                ((QEQCAR |f| 0)
                 (SPADCALL (CONS |opname| (QVELT |rec| 2)) (QCDR |f|)))
                (#2# (SPADCALL |opname| (QVELT |rec| 2) (QREFELT $ 155)))))))) 

(SDEFUN |FS-;encode_diff|
        ((|ker| |Kernel| S) (|nsub| |List| (|Integer|)) (|args| |List| S)
         (|nd| |List| S) ($ S))
        (SPROG
         ((|res| (S)) (#1=#:G307 NIL) (|kk| NIL) (#2=#:G303 NIL)
          (|i| #3=(|Integer|)) (#4=#:G304 NIL) (|k| (|Integer|))
          (#5=#:G305 NIL) (|pt| NIL) (#6=#:G306 NIL) (|dm| NIL)
          (|pts| (|List| S)) (#7=#:G301 NIL) (#8=#:G302 NIL)
          (|nargs| (|List| S)) (|li| (|List| (|Integer|)))
          (|lk| (|List| (|Integer|))) (|ii| #3#))
         (SEQ (LETT |li| NIL . #9=(|FS-;encode_diff|)) (LETT |lk| NIL . #9#)
              (LETT |i| (|SPADfirst| |nsub|) . #9#) (LETT |k| 1 . #9#)
              (LETT |nsub| (CDR |nsub|) . #9#)
              (SEQ G190
                   (COND
                    ((NULL (COND ((NULL |nsub|) 'NIL) ('T 'T))) (GO G191)))
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
              (LETT |nargs| (SPADCALL |args| (QREFELT $ 156)) . #9#)
              (LETT |pts| NIL . #9#)
              (SEQ (LETT |dm| NIL . #9#) (LETT #8# |nd| . #9#)
                   (LETT |i| NIL . #9#) (LETT #7# (REVERSE |li|) . #9#) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |i| (CAR #7#) . #9#) NIL)
                         (ATOM #8#) (PROGN (LETT |dm| (CAR #8#) . #9#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |pts|
                          (CONS (SPADCALL |nargs| |i| (QREFELT $ 157)) |pts|)
                          . #9#)
                    (EXIT (SPADCALL |nargs| |i| |dm| (QREFELT $ 158))))
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
          (#1=#:G313 NIL) (|i| NIL))
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
                       ((NULL (SPADCALL |i| |j| (QREFELT $ 159)))
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
          (|k| (|NonNegativeInteger|)) (#2=#:G320 NIL) (#3=#:G321 NIL)
          (|j| NIL) (|ii| (|Integer|)) (|nsub| (|List| (|Integer|))))
         (SEQ
          (LETT |nsub| (|FS-;insert_sub| (QVELT |r1| 1) |i| $)
                . #4=(|FS-;pos_diff|))
          (LETT |nd| (QVELT |r1| 4) . #4#)
          (COND
           ((NULL (SPADCALL |i| (QVELT |r1| 1) (QREFELT $ 161)))
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
                            (PROGN (LETT #2# |$NoValue| . #4#) (GO #5=#:G315)))
                           ((NULL (EQL |ii| |j|))
                            (LETT |k| (+ |k| 1) . #4#)))))
                        (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                  #5# (EXIT #2#))
                 (LETT |nd1| (SPADCALL |nd| |k| (QREFELT $ 162)) . #4#)
                 (LETT |nd2| (SPADCALL |nd| |k| (QREFELT $ 163)) . #4#)
                 (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 91)) (QREFELT $ 38))
                       . #4#)
                 (EXIT
                  (LETT |nd| (SPADCALL |nd1| (CONS |dm| |nd2|) (QREFELT $ 164))
                        . #4#)))))
          (EXIT
           (|FS-;encode_diff| (QVELT |r1| 0) |nsub| (QVELT |r1| 3) |nd| $))))) 

(SDEFUN |FS-;diffdiff| ((|l| |List| S) (|x| |Symbol|) ($ S))
        (SPROG
         ((|res| (S)) (|db| (S)) (#1=#:G327 NIL) (|i| NIL) (#2=#:G328 NIL)
          (|b| NIL) (|args| #3=(|List| S))
          (|r1|
           (|Record| (|:| |orig_k| (|Kernel| S))
                     (|:| |sub| (|List| (|Integer|))) (|:| |oarg| (|List| S))
                     (|:| |arg| #3#) (|:| |dummies| (|List| S)))))
         (SEQ (LETT |r1| (|FS-;decode_diff| |l| $) . #4=(|FS-;diffdiff|))
              (LETT |args| (QVELT |r1| 3) . #4#)
              (LETT |res| (|spadConstant| $ 126) . #4#)
              (SEQ (LETT |b| NIL . #4#) (LETT #2# |args| . #4#)
                   (LETT |i| (SPADCALL |args| (QREFELT $ 147)) . #4#)
                   (LETT #1# (SPADCALL |args| (QREFELT $ 165)) . #4#) G190
                   (COND
                    ((OR (> |i| #1#) (ATOM #2#)
                         (PROGN (LETT |b| (CAR #2#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |db| (SPADCALL |b| |x| (QREFELT $ 166)) . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |db| (|spadConstant| $ 126)
                                     (QREFELT $ 167))
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
        (SPROG ((#1=#:G330 NIL))
               (SPADCALL
                (SPADCALL (|SPADfirst| |l|)
                          (PROG2
                              (LETT #1# (SPADCALL |g| (QREFELT $ 30))
                                    |FS-;dfeval|)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                            (|Union| (|Symbol|) "failed") #1#))
                          (QREFELT $ 166))
                |g| (SPADCALL |l| (QREFELT $ 53)) (QREFELT $ 54)))) 

(SDEFUN |FS-;diffEval| ((|l| |List| S) ($ S))
        (SPROG
         ((|d| (|List| (|Mapping| S (|List| S)))) (|n| (|Integer|))
          (|nl| (|List| S)) (|ss| (S)) (|dumm| (S))
          (|ud| (|Union| (|List| (|Mapping| S (|List| S))) "failed"))
          (|op| (|BasicOperator|)) (#1=#:G363 NIL) (|k| (|Kernel| S))
          (|u| (|Union| (|Kernel| S) "failed")) (|g| (|Kernel| S)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |g| (SPADCALL (SPADCALL |l| (QREFELT $ 52)) (QREFELT $ 28))
                  . #2=(|FS-;diffEval|))
            (SEQ (LETT |u| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 80)) . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |u| 1)
                    (PROGN
                     (LETT #1# (|FS-;dfeval| |l| |g| $) . #2#)
                     (GO #3=#:G361)))
                   ((QEQCAR |u| 0)
                    (COND
                     ((QEQCAR
                       (SPADCALL (LETT |k| (QCDR |u|) . #2#) (QREFELT $ 30)) 0)
                      (PROGN
                       (LETT #1# (|FS-;dfeval| |l| |g| $) . #2#)
                       (GO #3#))))))))
            (LETT |op| (SPADCALL |k| (QREFELT $ 44)) . #2#)
            (LETT |ud| (SPADCALL |op| (QREFELT $ 170)) . #2#)
            (EXIT
             (COND
              ((QEQCAR |ud| 1)
               (SEQ
                (LETT |dumm|
                      (SPADCALL (|FS-;symsub| (QREFELT $ 82) 1 $)
                                (QREFELT $ 38))
                      . #2#)
                (LETT |ss|
                      (SPADCALL (SPADCALL |l| 1 (QREFELT $ 157))
                                (SPADCALL (SPADCALL |l| 2 (QREFELT $ 157))
                                          |dumm| (QREFELT $ 172))
                                (QREFELT $ 174))
                      . #2#)
                (LETT |nl| (LIST |ss| |dumm| (SPADCALL |l| 3 (QREFELT $ 157)))
                      . #2#)
                (EXIT (SPADCALL (QREFELT $ 15) |nl| (QREFELT $ 47)))))
              ((<
                (LETT |n|
                      (SPADCALL (SPADCALL |l| (QREFELT $ 52))
                                (SPADCALL |k| (QREFELT $ 46)) (QREFELT $ 150))
                      . #2#)
                (SPADCALL |l| (QREFELT $ 147)))
               (|FS-;dfeval| |l| |g| $))
              ('T
               (SEQ (LETT |d| (QCDR |ud|) . #2#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |k| (QREFELT $ 46))
                                (SPADCALL |d| |n| (QREFELT $ 129)))
                      |g| (SPADCALL |l| (QREFELT $ 53)) (QREFELT $ 54)))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |FS-;diffArg|
        ((|l| |List| S) (|op| |BasicOperator|) (|i| |NonNegativeInteger|)
         ($ |List| S))
        (SPROG ((|g| (S)) (|z| (|List| S)) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (+ (- |i| 1) (SPADCALL |l| (QREFELT $ 147)))
                      . #1=(|FS-;diffArg|))
                (LETT |z| (SPADCALL |l| (QREFELT $ 156)) . #1#)
                (SPADCALL |z| |n|
                          (LETT |g|
                                (SPADCALL (|FS-;symsub| (QREFELT $ 82) |n| $)
                                          (QREFELT $ 38))
                                . #1#)
                          (QREFELT $ 158))
                (EXIT
                 (LIST (SPADCALL |op| |z| (QREFELT $ 47)) |g|
                       (SPADCALL |l| |n| (QREFELT $ 157))))))) 

(SDEFUN |FS-;opderiv|
        ((|op| |BasicOperator|) (|n| |NonNegativeInteger|)
         ($ |List| (|Mapping| S (|List| S))))
        (SPROG ((#1=#:G374 NIL) (|i| NIL) (#2=#:G373 NIL) (|g| (S)))
               (SEQ
                (COND
                 ((EQL |n| 1)
                  (SEQ
                   (LETT |g|
                         (SPADCALL (|FS-;symsub| (QREFELT $ 82) |n| $)
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
                      (LIST (SPADCALL |op| |g| (QREFELT $ 175)) |g|
                            (SPADCALL |x| (QREFELT $ 94)))
                      (QREFELT $ 47)))))) 

(SDEFUN |FS-;kderiv| ((|k| |Kernel| S) ($ |List| S))
        (SPROG
         ((#1=#:G386 NIL) (|g| NIL) (#2=#:G385 NIL)
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
                       (SEQ (LETT |u| (SPADCALL |op| (QREFELT $ 170)) . #3#)
                            (EXIT
                             (COND ((QEQCAR |u| 1) (|FS-;opderiv| |op| |n| $))
                                   (#4# (QCDR |u|)))))
                       . #3#)
                 (COND
                  ((SPADCALL (LENGTH |grad|) |n| (QREFELT $ 176))
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
         ((#1=#:G396 NIL) (#2=#:G395 (S)) (#3=#:G397 (S)) (#4=#:G401 NIL)
          (|g| NIL) (#5=#:G402 NIL) (|y| NIL)
          (|fn| (|Union| (|None|) "failed"))
          (|v| (|Union| (|Symbol|) "failed")))
         (SEQ (LETT |v| (SPADCALL |k| (QREFELT $ 30)) . #6=(|FS-;kerderiv|))
              (EXIT
               (COND
                ((QEQCAR |v| 0)
                 (COND ((EQUAL (QCDR |v|) |x|) (|spadConstant| $ 146))
                       (#7='T (|spadConstant| $ 126))))
                (#7#
                 (SEQ
                  (LETT |fn|
                        (SPADCALL (SPADCALL |k| (QREFELT $ 44)) (QREFELT $ 10)
                                  (QREFELT $ 154))
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
                                                        (QREFELT $ 166))
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
         ((#1=#:G429 NIL) (#2=#:G428 (S)) (#3=#:G430 (S)) (#4=#:G432 NIL)
          (|k| NIL))
         (SEQ
          (SPADCALL
           (SPADCALL
            (SPADCALL (CONS #'|FS-;smpderiv!0| (VECTOR |x| $)) |p|
                      (QREFELT $ 182))
            (QREFELT $ 89))
           (PROGN
            (LETT #1# NIL . #5=(|FS-;smpderiv|))
            (SEQ (LETT |k| NIL . #5#)
                 (LETT #4# (SPADCALL |p| (QREFELT $ 184)) . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |k| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #3#
                          (SPADCALL
                           (SPADCALL (SPADCALL |p| |k| (QREFELT $ 185))
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
             (SPADCALL (SPADCALL |s| (QREFELT $ 178)) |x| (QREFELT $ 179))
             (QREFELT $ 180)))))) 

(SDEFUN |FS-;coerce;PS;45| ((|p| |Polynomial| R) ($ S))
        (SPADCALL (ELT $ 38) (ELT $ 186) |p| (QREFELT $ 190))) 

(SDEFUN |FS-;worse?| ((|k1| |Kernel| S) (|k2| |Kernel| S) ($ |Boolean|))
        (SPROG ((|u| (|Union| (|Boolean|) "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL
                       (SPADCALL (SPADCALL |k1| (QREFELT $ 44)) (QREFELT $ 48))
                       (SPADCALL (SPADCALL |k2| (QREFELT $ 44)) (QREFELT $ 48))
                       (QREFELT $ 194))
                      |FS-;worse?|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (SPADCALL |k1| |k2| (QREFELT $ 195)))
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
        (SPROG ((|a| (|Kernel| S)) (#1=#:G446 NIL) (|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |p| (QREFELT $ 196)) . #2=(|FS-;smp2O|))
                (EXIT
                 (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 197)))
                       (#3='T
                        (SEQ
                         (LETT |a|
                               (COND
                                ((SPADCALL (QREFELT $ 198))
                                 (|FS-;bestKernel|
                                  (SPADCALL |p| (QREFELT $ 184)) $))
                                (#3#
                                 (PROG2
                                     (LETT #1# (SPADCALL |p| (QREFELT $ 114))
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
                           (SPADCALL (ELT $ 89)
                                     (SPADCALL |p| |a| (QREFELT $ 116))
                                     (QREFELT $ 121))
                           (SPADCALL |a| (QREFELT $ 199))
                           (QREFELT $ 200)))))))))) 

(SDEFUN |FS-;smpsubst|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S))
         (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|FS-;smpsubst!2| (VECTOR $ |lv| |lk|))
                         (ELT $ 186) |p| (QREFELT $ 206)))) 

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
                             (QREFELT $ 204))))))) 

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
          (RETURN (PROGN (SPADCALL |s| |lk| |lv| (QREFELT $ 201)))))) 

(SDEFUN |FS-;smpeval|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S))
         (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|FS-;smpeval!2| (VECTOR $ |lv| |lk|))
                         (ELT $ 186) |p| (QREFELT $ 206)))) 

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
                             (QREFELT $ 204))))))) 

(SDEFUN |FS-;smpeval!1| ((|z| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT |lk| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|FS-;smpeval!0| (VECTOR $ |lv| |lk|)) |z|
                             (QREFELT $ 208))))))) 

(SDEFUN |FS-;smpeval!0| ((|s| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |s| |lk| |lv| (QREFELT $ 207)))))) 

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
                                 (QREFELT $ 209))
                       |lk| (QREFELT $ 210))
                      (QREFELT $ 211))
                     |f|)
                    ('T (SPADCALL |k| |fn|)))))))) 

(SDEFUN |FS-;pushunq| ((|l| |List| (|Symbol|)) (|arg| |List| S) ($ |List| S))
        (SPROG
         ((#1=#:G503 NIL) (|a| NIL) (#2=#:G502 NIL) (#3=#:G501 NIL)
          (#4=#:G500 NIL))
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
                    (LETT #4# (CONS (SPADCALL |a| (QREFELT $ 212)) #4#)
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
        (SPROG ((#1=#:G553 NIL) (|a| NIL) (#2=#:G552 NIL) (|s| (|Symbol|)))
               (SEQ
                (COND
                 (|givenlist?|
                  (COND ((NULL |l|) (EXIT (SPADCALL |k| (QREFELT $ 26)))))))
                (COND
                 ((SPADCALL |k| (QREFELT $ 16) (QREFELT $ 141))
                  (COND
                   ((OR
                     (SPADCALL
                      (LETT |s|
                            (SPADCALL
                             (|SPADfirst| (SPADCALL |k| (QREFELT $ 46)))
                             (QREFELT $ 213))
                            . #3=(|FS-;kunq|))
                      |l| (QREFELT $ 214))
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
                      (QREFELT $ 216)))))))
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
                           (ELT $ 186) |p| (QREFELT $ 206)))))) 

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
         ((#1=#:G562 NIL) (#2=#:G561 #3=(|Boolean|)) (#4=#:G563 #3#)
          (#5=#:G570 NIL) (|k| NIL))
         (SEQ
          (COND
           ((PROGN
             (LETT #1# NIL . #6=(|FS-;smpret|))
             (SEQ (LETT |k| NIL . #6#)
                  (LETT #5# (SPADCALL |p| (QREFELT $ 184)) . #6#) G190
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
                  (SPADCALL (CONS #'|FS-;smpret!0| $) (ELT $ 178) |p|
                            (QREFELT $ 221)))))))) 

(SDEFUN |FS-;smpret!0| ((|x| NIL) ($ NIL))
        (SPROG ((#1=#:G565 NIL))
               (SPADCALL
                (PROG2 (LETT #1# (SPADCALL |x| (QREFELT $ 30)) NIL)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                  (|Union| (|Symbol|) "failed") #1#))
                (QREFELT $ 217)))) 

(SDEFUN |FS-;isExpt;SBoU;56|
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
          (LETT |u| (SPADCALL |x| (QREFELT $ 224)) . #2=(|FS-;isExpt;SBoU;56|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |v| (QCAR (QCDR |u|)) . #2#)
                       (COND
                        ((SPADCALL |v| |op| (QREFELT $ 141))
                         (COND
                          ((EQL (LENGTH (SPADCALL |v| (QREFELT $ 46))) 1)
                           (EXIT |u|)))))
                       (EXIT (CONS 1 "failed"))))))))) 

(SDEFUN |FS-;isExpt;SSU;57|
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
          (LETT |u| (SPADCALL |x| (QREFELT $ 224)) . #2=(|FS-;isExpt;SSU;57|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |v| (QCAR (QCDR |u|)) . #2#)
                       (COND
                        ((SPADCALL |v| |sy| (QREFELT $ 226))
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
         ((#1=#:G609 NIL) (|n| (|Union| (|Integer|) "failed"))
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
                    (QREFELT $ 228))
                   1)
                  (COND
                   ((SPADCALL
                     (SPADCALL (SPADCALL |q| (QREFELT $ 229)) (QREFELT $ 230))
                     (QREFELT $ 231))
                    (SEQ
                     (LETT |r|
                           (SPADCALL (SPADCALL |q| (QREFELT $ 230))
                                     (QREFELT $ 196))
                           . #2#)
                     (EXIT
                      (COND
                       ((QEQCAR |r| 0)
                        (SEQ
                         (LETT |n| (SPADCALL (QCDR |r|) (QREFELT $ 233)) . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |n| 0)
                            (PROGN
                             (LETT #1# (CONS 0 (CONS (QCDR |n|) (QCDR |u|)))
                                   . #2#)
                             (GO #3=#:G607))))))))))))))))))
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
            ((SPADCALL |k| (QREFELT $ 15) (QREFELT $ 141))
             (SEQ (LETT |rec| (|FS-;decode_diff| |a| $) . #3#)
                  (LETT |i| (SPADCALL |da| (QVELT |rec| 3) (QREFELT $ 150))
                        . #3#)
                  (SPADCALL (QVELT |rec| 3) |i| |pt| (QREFELT $ 158))
                  (LETT |nd| (QVELT |rec| 4) . #3#)
                  (COND
                   ((NULL (SPADCALL |i| (QVELT |rec| 1) (QREFELT $ 161)))
                    (LETT |nd| (CONS |da| |nd|) . #3#)))
                  (EXIT
                   (VECTOR (QVELT |rec| 0) (CONS |i| (QVELT |rec| 1))
                           (QVELT |rec| 2) (QVELT |rec| 3) |nd|))))
            ('T
             (SEQ (LETT |i| (SPADCALL |da| |a| (QREFELT $ 150)) . #3#)
                  (LETT |a1| (SPADCALL |a| (QREFELT $ 156)) . #3#)
                  (SPADCALL |a1| |i| |pt| (QREFELT $ 158))
                  (EXIT (VECTOR |k| (LIST |i|) |a| |a1| (LIST |da|)))))))))) 

(SDEFUN |FS-;equaldiff| ((|k1| |Kernel| S) (|k2| |Kernel| S) ($ |Boolean|))
        (SPROG
         ((|sk1| (S)) (|ok1| (S)) (|od| (|List| (|Kernel| S))) (#1=#:G629 NIL)
          (|dk| NIL) (#2=#:G628 NIL)
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
                              (SPADCALL |k2| (QREFELT $ 44)) (QREFELT $ 235))
                    . #5#)
              (EXIT
               (COND
                (|res|
                 (SEQ
                  (LETT |res|
                        (SPADCALL (SPADCALL |a1| 3 (QREFELT $ 157))
                                  (SPADCALL |a2| 3 (QREFELT $ 157))
                                  (QREFELT $ 167))
                        . #5#)
                  (EXIT
                   (COND
                    (|res|
                     (COND
                      ((SPADCALL (SPADCALL |a1| 2 (QREFELT $ 157))
                                 (SPADCALL |a2| 2 (QREFELT $ 157))
                                 (QREFELT $ 167))
                       (SPADCALL (SPADCALL |a1| 1 (QREFELT $ 157))
                                 (SPADCALL |a2| 1 (QREFELT $ 157))
                                 (QREFELT $ 167)))
                      (#6='T
                       (SEQ (LETT |r1| (|FS-;decode_diff| |a1| $) . #5#)
                            (LETT |r2| (|FS-;decode_diff| |a2| $) . #5#)
                            (COND
                             ((NULL
                               (SPADCALL
                                (SPADCALL (QVELT |r1| 0) (QREFELT $ 44))
                                (SPADCALL (QVELT |r2| 0) (QREFELT $ 44))
                                (QREFELT $ 235)))
                              (EXIT 'NIL)))
                            (COND
                             ((NULL
                               (SPADCALL (QVELT |r1| 1) (QVELT |r2| 1)
                                         (QREFELT $ 236)))
                              (EXIT 'NIL)))
                            (COND
                             ((NULL
                               (SPADCALL (QVELT |r1| 3) (QVELT |r2| 3)
                                         (QREFELT $ 237)))
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
                                            (QREFELT $ 201))
                                  . #5#)
                            (EXIT
                             (SPADCALL |sk1|
                                       (SPADCALL (QVELT |r2| 0) (QREFELT $ 26))
                                       (QREFELT $ 167)))))))
                    (#6# (|FS-;debugA| |a1| |a2| |res| $))))))
                (#6# (|FS-;debugA| |a1| |a2| |res| $))))))) 

(SDEFUN |FS-;mainKernel;SU;62| ((|x| S) ($ |Union| (|Kernel| S) "failed"))
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 114))) 

(SDEFUN |FS-;kernels;SL;63| ((|x| S) ($ |List| (|Kernel| S)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 184))) 

(SDEFUN |FS-;retract;SR;64| ((|x| S) ($ R))
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 240))) 

(SDEFUN |FS-;retract;SP;65| ((|x| S) ($ |Polynomial| R))
        (SPROG ((#1=#:G647 NIL))
               (PROG2
                   (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 92)) $)
                         |FS-;retract;SP;65|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                 (|Union| (|Polynomial| (QREFELT $ 7))
                                          "failed")
                                 #1#)))) 

(SDEFUN |FS-;retractIfCan;SU;66| ((|x| S) ($ |Union| R "failed"))
        (CONS 0 (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 240)))) 

(SDEFUN |FS-;retractIfCan;SU;67|
        ((|x| S) ($ |Union| (|Polynomial| R) "failed"))
        (|FS-;smpret| (SPADCALL |x| (QREFELT $ 92)) $)) 

(SDEFUN |FS-;eval;SLLS;68|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 92)) |lk| |lv| $)) 

(SDEFUN |FS-;subst;SLLS;69|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 92)) |lk| |lv| $)) 

(SDEFUN |FS-;differentiate;SSS;70| ((|x| S) (|s| |Symbol|) ($ S))
        (|FS-;smpderiv| (SPADCALL |x| (QREFELT $ 92)) |s| $)) 

(SDEFUN |FS-;coerce;SOf;71| ((|x| S) ($ |OutputForm|))
        (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 92)) $)) 

(SDEFUN |FS-;eval;SLS;72| ((|f| S) (|l| |List| (|Symbol|)) ($ S))
        (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 92)) |l| 'T $)) 

(SDEFUN |FS-;eval;2S;73| ((|f| S) ($ S))
        (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 92)) NIL 'NIL $)) 

(SDEFUN |FS-;eval;SLLLS;74|
        ((|x| S) (|s| |List| (|Symbol|)) (|n| |List| (|NonNegativeInteger|))
         (|f| |List| (|Mapping| S (|List| S))) ($ S))
        (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 92)) $)) 

(SDEFUN |FS-;isPlus;SU;75| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPROG
         ((#1=#:G678 NIL) (|p| NIL) (#2=#:G677 NIL)
          (|u|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| S)))
                    "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 254))
                . #3=(|FS-;isPlus;SU;75|))
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

(SDEFUN |FS-;isTimes;SU;76| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPROG
         ((#1=#:G689 NIL) (|p| NIL) (#2=#:G688 NIL)
          (|u|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| S)))
                    "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 256))
                . #3=(|FS-;isTimes;SU;76|))
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

(SDEFUN |FS-;isExpt;SU;77|
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
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 260))
                . #1=(|FS-;isExpt;SU;77|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |r| (QCDR |u|) . #1#)
                       (EXIT (CONS 0 (CONS (QCAR |r|) (QCDR |r|))))))))))) 

(SDEFUN |FS-;isPower;SU;78|
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
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 260))
                . #1=(|FS-;isPower;SU;78|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |r| (QCDR |u|) . #1#)
                       (EXIT
                        (CONS 0
                              (CONS (SPADCALL (QCAR |r|) (QREFELT $ 26))
                                    (QCDR |r|))))))))))) 

(SDEFUN |FS-;convert;SP;79| ((|x| S) ($ |Pattern| (|Integer|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 266))) 

(SDEFUN |FS-;convert;SP;80| ((|x| S) ($ |Pattern| (|Float|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 269))) 

(SDEFUN |FS-;isMult;SU;81|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S)))
          "failed"))
        (|FS-;smpIsMult| (SPADCALL |x| (QREFELT $ 92)) $)) 

(SDEFUN |FS-;*;R2S;82| ((|r| R) (|x| S) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |r| (QREFELT $ 274)) (QREFELT $ 89)) |x|
                  (QREFELT $ 136))) 

(SDEFUN |FS-;mainKernel;SU;83| ((|x| S) ($ |Union| (|Kernel| S) "failed"))
        (SPADCALL |x| (QREFELT $ 277))) 

(SDEFUN |FS-;kernels;SL;84| ((|x| S) ($ |List| (|Kernel| S)))
        (SPADCALL |x| (QREFELT $ 278))) 

(SDEFUN |FS-;univariate;SKF;85|
        ((|x| S) (|k| |Kernel| S)
         ($ |Fraction| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |x| |k| (QREFELT $ 280))) 

(SDEFUN |FS-;isPlus;SU;86| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPADCALL |x| (QREFELT $ 284))) 

(SDEFUN |FS-;isTimes;SU;87| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPADCALL |x| (QREFELT $ 285))) 

(SDEFUN |FS-;isExpt;SU;88|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |var| (|Kernel| S)) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPADCALL |x| (QREFELT $ 288))) 

(SDEFUN |FS-;isPower;SU;89|
        ((|x| S)
         ($ |Union| (|Record| (|:| |val| S) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPADCALL |x| (QREFELT $ 291))) 

(SDEFUN |FS-;denominator;2S;90| ((|x| S) ($ S))
        (SPADCALL (SPADCALL |x| (QREFELT $ 292)) (QREFELT $ 89))) 

(SDEFUN |FS-;coerce;FS;91| ((|q| |Fraction| R) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 295)) (QREFELT $ 274))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 296)) (QREFELT $ 274))
                  (QREFELT $ 297))) 

(SDEFUN |FS-;coerce;FS;92| ((|q| |Fraction| (|Polynomial| R)) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 300)) (QREFELT $ 301))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 302)) (QREFELT $ 301))
                  (QREFELT $ 303))) 

(SDEFUN |FS-;coerce;FS;93|
        ((|q| |Fraction| (|Polynomial| (|Fraction| R))) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 307)) (QREFELT $ 308))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 309)) (QREFELT $ 308))
                  (QREFELT $ 303))) 

(SDEFUN |FS-;retract;SP;94| ((|x| S) ($ |Polynomial| R))
        (SPADCALL (SPADCALL |x| (QREFELT $ 311)) (QREFELT $ 312))) 

(SDEFUN |FS-;retract;SF;95| ((|x| S) ($ |Fraction| (|Polynomial| R)))
        (SPROG ((#1=#:G758 NIL))
               (SPADCALL
                (PROG2
                    (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 92)) $)
                          . #2=(|FS-;retract;SF;95|))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                  (|Union| (|Polynomial| (QREFELT $ 7))
                                           #3="failed")
                                  #1#))
                (PROG2
                    (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 292)) $)
                          . #2#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                  (|Union| (|Polynomial| (QREFELT $ 7)) #3#)
                                  #1#))
                (QREFELT $ 313)))) 

(SDEFUN |FS-;retract;SR;96| ((|x| S) ($ R))
        (SPROG ((#1=#:G762 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| (QREFELT $ 92))
                                    (QREFELT $ 240))
                          (SPADCALL (SPADCALL |x| (QREFELT $ 292))
                                    (QREFELT $ 240))
                          (QREFELT $ 316))
                         |FS-;retract;SR;96|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                 (|Union| (QREFELT $ 7) "failed") #1#)))) 

(SDEFUN |FS-;coerce;SOf;97| ((|x| S) ($ |OutputForm|))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 292)) (|spadConstant| $ 317)
                    (QREFELT $ 318))
          (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 92)) $))
         ('T
          (SPADCALL (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 92)) $)
                    (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 292)) $)
                    (QREFELT $ 319))))) 

(SDEFUN |FS-;retractIfCan;SU;98| ((|x| S) ($ |Union| R "failed"))
        (SPROG
         ((#1=#:G775 NIL) (|r| (|Union| R "failed"))
          (|d| #2=(|Union| R "failed")) (|n| #2#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |n| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 196))
                   . #3=(|FS-;retractIfCan;SU;98|))
             (EXIT
              (COND
               ((QEQCAR |n| 1)
                (PROGN (LETT #1# (CONS 1 #4="failed") . #3#) (GO #5=#:G773)))
               (#6='T
                (SEQ
                 (LETT |d|
                       (SPADCALL (SPADCALL |x| (QREFELT $ 292))
                                 (QREFELT $ 196))
                       . #3#)
                 (EXIT
                  (COND
                   ((QEQCAR |d| 1)
                    (PROGN (LETT #1# (CONS 1 #4#) . #3#) (GO #5#)))
                   (#6#
                    (SEQ
                     (LETT |r| (SPADCALL (QCDR |n|) (QCDR |d|) (QREFELT $ 316))
                           . #3#)
                     (EXIT
                      (COND
                       ((QEQCAR |r| 1)
                        (PROGN
                         (LETT #1# (CONS 1 #4#) . #3#)
                         (GO #5#))))))))))))))
            (EXIT (CONS 0 (QCDR |r|)))))
          #5# (EXIT #1#)))) 

(SDEFUN |FS-;eval;SLS;99| ((|f| S) (|l| |List| (|Symbol|)) ($ S))
        (SPADCALL (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 92)) |l| 'T $)
                  (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 292)) |l| 'T $)
                  (QREFELT $ 303))) 

(SDEFUN |FS-;eval;2S;100| ((|f| S) ($ S))
        (SPADCALL (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 92)) NIL 'NIL $)
                  (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 292)) NIL 'NIL $)
                  (QREFELT $ 303))) 

(SDEFUN |FS-;eval;SLLLS;101|
        ((|x| S) (|s| |List| (|Symbol|)) (|n| |List| (|NonNegativeInteger|))
         (|f| |List| (|Mapping| S (|List| S))) ($ S))
        (SPADCALL (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 92)) $)
                  (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 292)) $)
                  (QREFELT $ 303))) 

(SDEFUN |FS-;differentiate;SSS;102| ((|f| S) (|x| |Symbol|) ($ S))
        (SPADCALL
         (SPADCALL
          (SPADCALL (|FS-;smpderiv| (SPADCALL |f| (QREFELT $ 92)) |x| $)
                    (SPADCALL (SPADCALL |f| (QREFELT $ 292)) (QREFELT $ 89))
                    (QREFELT $ 136))
          (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 92)) (QREFELT $ 89))
                    (|FS-;smpderiv| (SPADCALL |f| (QREFELT $ 292)) |x| $)
                    (QREFELT $ 136))
          (QREFELT $ 320))
         (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 292)) (QREFELT $ 89)) 2
                   (QREFELT $ 321))
         (QREFELT $ 303))) 

(SDEFUN |FS-;eval;SLLS;103|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPADCALL (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 92)) |lk| |lv| $)
                  (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 292)) |lk| |lv| $)
                  (QREFELT $ 303))) 

(SDEFUN |FS-;subst;SLLS;104|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPADCALL (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 92)) |lk| |lv| $)
                  (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 292)) |lk| |lv| $)
                  (QREFELT $ 303))) 

(SDEFUN |FS-;par| ((|x| S) ($ S))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 18)) |FS-;par|)
                    (EXIT
                     (COND ((QEQCAR |r| 0) |x|)
                           ('T (SPADCALL |x| (QREFELT $ 322)))))))) 

(SDEFUN |FS-;convert;FS;106| ((|x| |Factored| S) ($ S))
        (SPROG
         ((#1=#:G798 NIL) (#2=#:G797 (S)) (#3=#:G799 (S)) (#4=#:G801 NIL)
          (|f| NIL))
         (SEQ
          (SPADCALL (|FS-;par| (SPADCALL |x| (QREFELT $ 324)) $)
                    (PROGN
                     (LETT #1# NIL . #5=(|FS-;convert;FS;106|))
                     (SEQ (LETT |f| NIL . #5#)
                          (LETT #4# (SPADCALL |x| (QREFELT $ 327)) . #5#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3#
                                   (SPADCALL (|FS-;par| (QCAR |f|) $)
                                             (QCDR |f|) (QREFELT $ 321))
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
                     (COND (#1# #2#) ('T (|spadConstant| $ 146))))
                    (QREFELT $ 136))))) 

(SDEFUN |FS-;retractIfCan;SU;107|
        ((|x| S) ($ |Union| (|Polynomial| R) "failed"))
        (SPROG ((|u| (|Union| (|Fraction| (|Polynomial| R)) "failed")))
               (SEQ
                (LETT |u| (SPADCALL |x| (QREFELT $ 331))
                      |FS-;retractIfCan;SU;107|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T (SPADCALL (QCDR |u|) (QREFELT $ 332)))))))) 

(SDEFUN |FS-;retractIfCan;SU;108|
        ((|x| S) ($ |Union| (|Fraction| (|Polynomial| R)) "failed"))
        (SPROG ((|d| #1=(|Union| (|Polynomial| R) "failed")) (|n| #1#))
               (SEQ
                (LETT |n| (|FS-;smpret| (SPADCALL |x| (QREFELT $ 92)) $)
                      . #2=(|FS-;retractIfCan;SU;108|))
                (EXIT
                 (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                       (#3='T
                        (SEQ
                         (LETT |d|
                               (|FS-;smpret| (SPADCALL |x| (QREFELT $ 292)) $)
                               . #2#)
                         (EXIT
                          (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                (#3#
                                 (CONS 0
                                       (SPADCALL (QCDR |n|) (QCDR |d|)
                                                 (QREFELT $ 313))))))))))))) 

(SDEFUN |FS-;coerce;PS;109| ((|p| |Polynomial| (|Fraction| R)) ($ S))
        (SPADCALL (ELT $ 38) (ELT $ 334) |p| (QREFELT $ 337))) 

(SDEFUN |FS-;coerce;FS;110| ((|x| |Fraction| (|Integer|)) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 340)) (QREFELT $ 341))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 342)) (QREFELT $ 341))
                  (QREFELT $ 297))) 

(SDEFUN |FS-;isMult;SU;111|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S)))
          "failed"))
        (SPROG
         ((|q| (|Union| (|Integer|) "failed"))
          (|r| (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S))))
          (#1=#:G836 NIL) (|w| (|Union| (|Integer|) "failed"))
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
                   . #2=(|FS-;isMult;SU;111|))
             (EXIT
              (COND
               ((QEQCAR |u| 1)
                (PROGN (LETT #1# (CONS 1 #3="failed") . #2#) (GO #4=#:G834)))
               (#5='T
                (SEQ
                 (LETT |v|
                       (SPADCALL (SPADCALL |x| (QREFELT $ 292))
                                 (QREFELT $ 196))
                       . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |v| 1)
                    (PROGN (LETT #1# (CONS 1 #3#) . #2#) (GO #4#)))
                   (#5#
                    (SEQ (LETT |w| (SPADCALL (QCDR |v|) (QREFELT $ 233)) . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |w| 1)
                            (PROGN
                             (LETT #1# (CONS 1 #3#) . #2#)
                             (GO #4#))))))))))))))
            (LETT |r| (QCDR |u|) . #2#)
            (LETT |q| (SPADCALL (QCAR |r|) (QCDR |w|) (QREFELT $ 344)) . #2#)
            (EXIT
             (COND ((QEQCAR |q| 1) (CONS 1 "failed"))
                   (#5# (CONS 0 (CONS (QCDR |q|) (QCDR |r|))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |FS-;convert;SP;112| ((|x| S) ($ |Pattern| (|Integer|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 266))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 292)) (QREFELT $ 266))
                  (QREFELT $ 345))) 

(SDEFUN |FS-;convert;SP;113| ((|x| S) ($ |Pattern| (|Float|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 269))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 292)) (QREFELT $ 269))
                  (QREFELT $ 346))) 

(DECLAIM (NOTINLINE |FunctionSpace&;|)) 

(DEFUN |FunctionSpace&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionSpace&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FunctionSpace&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 350) . #1#)
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
             (QSETREFV $ 82 '%%0)
             (QSETREFV $ 85
                       (CONS (|dispatchFunction| |FS-;characteristic;Nni;22|)
                             $))
             (QSETREFV $ 90 (CONS (|dispatchFunction| |FS-;coerce;KS;23|) $))
             (QSETREFV $ 93
                       (CONS (|dispatchFunction| |FS-;numerator;2S;25|) $))
             (QSETREFV $ 99
                       (CONS (|dispatchFunction| |FS-;eval;SSNniMS;26|) $))
             (QSETREFV $ 100
                       (CONS (|dispatchFunction| |FS-;eval;SSNniMS;27|) $))
             (QSETREFV $ 102 (CONS (|dispatchFunction| |FS-;eval;SLLS;28|) $))
             (QSETREFV $ 111 (CONS (|dispatchFunction| |FS-;elt;BoLS;29|) $))
             (QSETREFV $ 112 (CONS (|dispatchFunction| |FS-;eval;SLLLS;30|) $))
             NIL
             (QSETREFV $ 191 (CONS (|dispatchFunction| |FS-;coerce;PS;45|) $))
             (COND ((|testBitVector| |pv$| 11)))
             (QSETREFV $ 225
                       (CONS (|dispatchFunction| |FS-;isExpt;SBoU;56|) $))
             (QSETREFV $ 227 (CONS (|dispatchFunction| |FS-;isExpt;SSU;57|) $))
             (COND ((|testBitVector| |pv$| 1)))
             (SPADCALL (QREFELT $ 15) (CONS (|function| |FS-;diffEval|) $)
                       (QREFELT $ 234))
             (SPADCALL (QREFELT $ 15) '|%specialEqual|
                       (CONS (|function| |FS-;equaldiff|) $) (QREFELT $ 73))
             (SPADCALL (QREFELT $ 15) (QREFELT $ 10)
                       (CONS (|function| |FS-;diffdiff|) $) (QREFELT $ 73))
             (SPADCALL (QREFELT $ 15) '|%specialDisp|
                       (CONS (|function| |FS-;ddiff|) $) (QREFELT $ 73))
             (COND ((|testBitVector| |pv$| 2))
                   ('T
                    (PROGN
                     (QSETREFV $ 238
                               (CONS
                                (|dispatchFunction| |FS-;mainKernel;SU;62|) $))
                     (QSETREFV $ 239
                               (CONS (|dispatchFunction| |FS-;kernels;SL;63|)
                                     $))
                     (QSETREFV $ 241
                               (CONS (|dispatchFunction| |FS-;retract;SR;64|)
                                     $))
                     (QSETREFV $ 242
                               (CONS (|dispatchFunction| |FS-;retract;SP;65|)
                                     $))
                     (QSETREFV $ 243
                               (CONS
                                (|dispatchFunction| |FS-;retractIfCan;SU;66|)
                                $))
                     (QSETREFV $ 245
                               (CONS
                                (|dispatchFunction| |FS-;retractIfCan;SU;67|)
                                $))
                     (QSETREFV $ 246
                               (CONS (|dispatchFunction| |FS-;eval;SLLS;68|)
                                     $))
                     (QSETREFV $ 247
                               (CONS (|dispatchFunction| |FS-;subst;SLLS;69|)
                                     $))
                     (QSETREFV $ 248
                               (CONS
                                (|dispatchFunction| |FS-;differentiate;SSS;70|)
                                $))
                     (QSETREFV $ 249
                               (CONS (|dispatchFunction| |FS-;coerce;SOf;71|)
                                     $))
                     (COND
                      ((|testBitVector| |pv$| 11)
                       (PROGN
                        (QSETREFV $ 250
                                  (CONS (|dispatchFunction| |FS-;eval;SLS;72|)
                                        $))
                        (QSETREFV $ 251
                                  (CONS (|dispatchFunction| |FS-;eval;2S;73|)
                                        $)))))
                     (QSETREFV $ 252
                               (CONS (|dispatchFunction| |FS-;eval;SLLLS;74|)
                                     $))
                     (QSETREFV $ 255
                               (CONS (|dispatchFunction| |FS-;isPlus;SU;75|)
                                     $))
                     (QSETREFV $ 257
                               (CONS (|dispatchFunction| |FS-;isTimes;SU;76|)
                                     $))
                     (QSETREFV $ 261
                               (CONS (|dispatchFunction| |FS-;isExpt;SU;77|)
                                     $))
                     (QSETREFV $ 264
                               (CONS (|dispatchFunction| |FS-;isPower;SU;78|)
                                     $))
                     (COND
                      ((|HasCategory| |#2|
                                      '(|ConvertibleTo|
                                        (|Pattern| (|Integer|))))
                       (QSETREFV $ 267
                                 (CONS (|dispatchFunction| |FS-;convert;SP;79|)
                                       $))))
                     (COND
                      ((|HasCategory| |#2|
                                      '(|ConvertibleTo| (|Pattern| (|Float|))))
                       (QSETREFV $ 270
                                 (CONS (|dispatchFunction| |FS-;convert;SP;80|)
                                       $))))
                     (COND
                      ((|testBitVector| |pv$| 1)
                       (QSETREFV $ 273
                                 (CONS (|dispatchFunction| |FS-;isMult;SU;81|)
                                       $))))))))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 275 (CONS (|dispatchFunction| |FS-;*;R2S;82|) $))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 238
                       (CONS (|dispatchFunction| |FS-;mainKernel;SU;83|) $))
             (QSETREFV $ 239 (CONS (|dispatchFunction| |FS-;kernels;SL;84|) $))
             (QSETREFV $ 282
                       (CONS (|dispatchFunction| |FS-;univariate;SKF;85|) $))
             (QSETREFV $ 255 (CONS (|dispatchFunction| |FS-;isPlus;SU;86|) $))
             (QSETREFV $ 257 (CONS (|dispatchFunction| |FS-;isTimes;SU;87|) $))
             (QSETREFV $ 261 (CONS (|dispatchFunction| |FS-;isExpt;SU;88|) $))
             (QSETREFV $ 264 (CONS (|dispatchFunction| |FS-;isPower;SU;89|) $))
             (QSETREFV $ 293
                       (CONS (|dispatchFunction| |FS-;denominator;2S;90|) $))
             (QSETREFV $ 298 (CONS (|dispatchFunction| |FS-;coerce;FS;91|) $))
             (QSETREFV $ 304 (CONS (|dispatchFunction| |FS-;coerce;FS;92|) $))
             (QSETREFV $ 310 (CONS (|dispatchFunction| |FS-;coerce;FS;93|) $))
             (QSETREFV $ 242 (CONS (|dispatchFunction| |FS-;retract;SP;94|) $))
             (QSETREFV $ 314 (CONS (|dispatchFunction| |FS-;retract;SF;95|) $))
             (QSETREFV $ 241 (CONS (|dispatchFunction| |FS-;retract;SR;96|) $))
             (QSETREFV $ 249 (CONS (|dispatchFunction| |FS-;coerce;SOf;97|) $))
             (QSETREFV $ 243
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;98|) $))
             (QSETREFV $ 250 (CONS (|dispatchFunction| |FS-;eval;SLS;99|) $))
             (COND
              ((|testBitVector| |pv$| 11)
               (PROGN
                (QSETREFV $ 251
                          (CONS (|dispatchFunction| |FS-;eval;2S;100|) $))
                (QSETREFV $ 252
                          (CONS (|dispatchFunction| |FS-;eval;SLLLS;101|)
                                $)))))
             (QSETREFV $ 248
                       (CONS (|dispatchFunction| |FS-;differentiate;SSS;102|)
                             $))
             (QSETREFV $ 246 (CONS (|dispatchFunction| |FS-;eval;SLLS;103|) $))
             (QSETREFV $ 247
                       (CONS (|dispatchFunction| |FS-;subst;SLLS;104|) $))
             (QSETREFV $ 329
                       (CONS (|dispatchFunction| |FS-;convert;FS;106|) $))
             (QSETREFV $ 245
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;107|) $))
             (QSETREFV $ 333
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;108|) $))
             (QSETREFV $ 338 (CONS (|dispatchFunction| |FS-;coerce;PS;109|) $))
             (COND
              ((|testBitVector| |pv$| 1)
               (PROGN
                (QSETREFV $ 343
                          (CONS (|dispatchFunction| |FS-;coerce;FS;110|) $))
                (QSETREFV $ 273
                          (CONS (|dispatchFunction| |FS-;isMult;SU;111|) $)))))
             (COND
              ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Integer|))))
               (QSETREFV $ 267
                         (CONS (|dispatchFunction| |FS-;convert;SP;112|) $))))
             (COND
              ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Float|))))
               (QSETREFV $ 270
                         (CONS (|dispatchFunction| |FS-;convert;SP;113|)
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
              (|List| 25) (178 . |tower|) |FS-;variables;LL;19|
              (183 . |variables|) |FS-;variables;SL;20| (|Union| 25 '#1#)
              (188 . |retractIfCan|) |FS-;retractIfCan;SU;21| '|gendiff|
              (|NonNegativeInteger|) (193 . |characteristic|)
              (197 . |characteristic|) (|SparseMultivariatePolynomial| 7 23)
              (201 . |coerce|) (|SparseMultivariatePolynomial| 7 25)
              (206 . |coerce|) (211 . |coerce|) (216 . |new|) (220 . |numer|)
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
              (411 . |reductum|) (|OutputForm|) (416 . |coerce|) (421 . |is?|)
              (|List| 139) (427 . |position|) (433 . |setelt!|)
              (440 . |coerce|) (445 . |One|) (449 . |minIndex|)
              (454 . |coerce|) (459 . |hconcat|) (465 . |position|)
              (471 . |sub|) (477 . |differentiate|) (|Union| 72 '"failed")
              (483 . |property|) (489 . |prefix|) (495 . |copy|) (500 . |elt|)
              (506 . |setelt!|) (513 . >) (|List| 122) (519 . |member?|)
              (525 . |first|) (531 . |rest|) (537 . |concat|)
              (543 . |maxIndex|) (548 . |differentiate|) (554 . =)
              (|Union| 128 '"failed") (|BasicOperatorFunctions1| 6)
              (560 . |derivative|) (|Equation| 6) (565 . =) (|Equation| $)
              (571 . |subst|) (577 . |kernel|) (583 . ~=) (|Polynomial| 7)
              (589 . |coerce|) (594 . |differentiate|) (600 . |retract|)
              (|Mapping| 7 7) (605 . |map|) (|List| 23) (611 . |variables|)
              (616 . |differentiate|) (622 . |coerce|) (|Mapping| 6 12)
              (|Mapping| 6 7)
              (|PolynomialCategoryLifting| (|IndexedExponents| 12) 12 7 177 6)
              (627 . |map|) (634 . |coerce|) (|Union| 19 '"failed")
              (|UserDefinedPartialOrdering| 12) (639 . |less?|) (645 . <)
              (651 . |retractIfCan|) (656 . |coerce|) (661 . |userOrdered?|)
              (665 . |coerce|) (670 . |outputForm|) (676 . |subst|)
              (|Mapping| 6 23) (|ListToMap| 23 6) (683 . |match|)
              (|PolynomialCategoryLifting| (|IndexedExponents| 23) 23 7 86 6)
              (691 . |map|) (698 . |eval|) (705 . |map|) (711 . |tower|)
              (716 . |setIntersection|) (722 . |empty?|) (727 . |eval|)
              (732 . |retract|) (737 . |member?|) (|InputFormFunctions1| 6)
              (743 . |interpret|) (748 . |coerce|) (|Mapping| 177 23)
              (|Mapping| 177 7)
              (|PolynomialCategoryLifting| (|IndexedExponents| 23) 23 7 86 177)
              (753 . |map|) (|Record| (|:| |var| 25) (|:| |exponent| 122))
              (|Union| 222 '"failed") (760 . |isExpt|) (765 . |isExpt|)
              (771 . |is?|) (777 . |isExpt|) (783 . |degree|)
              (788 . |reductum|) (793 . |leadingCoefficient|) (798 . |zero?|)
              (|Union| 122 '#1#) (803 . |retractIfCan|) (808 . |evaluate|)
              (814 . =) (820 . =) (826 . =) (832 . |mainKernel|)
              (837 . |kernels|) (842 . |retract|) (847 . |retract|)
              (852 . |retract|) (857 . |retractIfCan|) (|Union| 177 '"failed")
              (862 . |retractIfCan|) (867 . |eval|) (874 . |subst|)
              (881 . |differentiate|) (887 . |coerce|) (892 . |eval|)
              (898 . |eval|) (903 . |eval|) (|Union| 32 '#2="failed")
              (911 . |isPlus|) (916 . |isPlus|) (921 . |isTimes|)
              (926 . |isTimes|) (|Record| (|:| |var| 23) (|:| |exponent| 83))
              (|Union| 258 '#2#) (931 . |isExpt|) (936 . |isExpt|)
              (|Record| (|:| |val| $) (|:| |exponent| 122))
              (|Union| 262 '"failed") (941 . |isPower|) (|Pattern| 122)
              (946 . |convert|) (951 . |convert|) (|Pattern| (|Float|))
              (956 . |convert|) (961 . |convert|)
              (|Record| (|:| |coef| 122) (|:| |var| 25))
              (|Union| 271 '"failed") (966 . |isMult|) (971 . |coerce|)
              (976 . *)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 23) 23
                                                     7 86 6)
              (982 . |mainVariable|) (987 . |variables|) (|Fraction| 117)
              (992 . |univariate|) (|Fraction| 115) (998 . |univariate|)
              (|Union| 45 '"failed") (1004 . |isPlus|) (1009 . |isTimes|)
              (|Record| (|:| |var| 23) (|:| |exponent| 122))
              (|Union| 286 '"failed") (1014 . |isExpt|)
              (|Record| (|:| |val| 6) (|:| |exponent| 122))
              (|Union| 289 '"failed") (1019 . |isPower|) (1024 . |denom|)
              (1029 . |denominator|) (|Fraction| 7) (1034 . |numer|)
              (1039 . |denom|) (1044 . /) (1050 . |coerce|) (|Fraction| 177)
              (1055 . |numer|) (1060 . |coerce|) (1065 . |denom|) (1070 . /)
              (1076 . |coerce|) (|Polynomial| 294) (|Fraction| 305)
              (1081 . |numer|) (1086 . |coerce|) (1091 . |denom|)
              (1096 . |coerce|) (1101 . |retract|) (1106 . |retract|)
              (1111 . /) (1117 . |retract|) (|Union| $ '"failed")
              (1122 . |exquo|) (1128 . |One|) (1132 . =) (1138 . /) (1144 . -)
              (1150 . ^) (1156 . |paren|) (|Factored| 6) (1161 . |unit|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 122)) (|List| 325)
              (1166 . |factors|) (|Factored| $) (1171 . |convert|)
              (|Union| 299 '#1#) (1176 . |retractIfCan|)
              (1181 . |retractIfCan|) (1186 . |retractIfCan|) (1191 . |coerce|)
              (|Mapping| 6 294)
              (|PolynomialCategoryLifting| (|IndexedExponents| 12) 12 294 305
                                           6)
              (1196 . |map|) (1203 . |coerce|) (|Fraction| 122)
              (1208 . |numer|) (1213 . |coerce|) (1218 . |denom|)
              (1223 . |coerce|) (1228 . |exquo|) (1234 . /) (1240 . /)
              (|PositiveInteger|) (|Union| 339 '#1#) (|List| 173))
           '#(|variables| 1246 |univariate| 1256 |subst| 1262 |retractIfCan|
              1269 |retract| 1289 |operator| 1309 |numerator| 1314 |mainKernel|
              1319 |kernels| 1324 |isTimes| 1329 |isPower| 1334 |isPlus| 1339
              |isMult| 1344 |isExpt| 1349 |ground?| 1366 |ground| 1371 |eval|
              1376 |elt| 1455 |differentiate| 1461 |denominator| 1467 |convert|
              1472 |coerce| 1487 |characteristic| 1532 |belong?| 1536
              |applyQuote| 1541 * 1577)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 346
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
                                                   74 32 75 1 6 59 32 77 1 6 79
                                                   0 80 0 7 83 84 0 0 83 85 1
                                                   86 0 23 87 1 6 0 88 89 1 0 0
                                                   25 90 0 12 0 91 1 6 88 0 92
                                                   1 0 0 0 93 1 45 6 0 94 4 6 0
                                                   0 59 95 97 98 4 0 0 0 12 83
                                                   68 99 4 0 0 0 12 83 96 100 2
                                                   95 0 83 83 101 3 0 0 0 59 97
                                                   102 1 11 19 0 103 1 86 7 0
                                                   104 0 7 0 105 2 7 19 0 0 106
                                                   1 6 0 0 107 2 6 0 11 0 108 2
                                                   109 0 11 32 110 2 0 0 11 32
                                                   111 4 0 0 0 59 95 69 112 1
                                                   86 113 0 114 2 86 115 0 23
                                                   116 2 120 117 118 119 121 2
                                                   59 122 12 0 123 1 59 122 0
                                                   124 2 117 6 0 6 125 0 6 0
                                                   126 2 128 127 0 122 129 2 95
                                                   83 0 122 130 0 117 0 131 2
                                                   117 19 0 0 132 1 117 83 0
                                                   133 2 6 0 0 83 134 1 117 6 0
                                                   135 2 6 0 0 0 136 2 6 0 0 0
                                                   137 1 117 0 0 138 1 6 139 0
                                                   140 2 23 19 0 11 141 2 142
                                                   122 139 0 143 3 142 139 0
                                                   122 139 144 1 12 139 0 145 0
                                                   6 0 146 1 45 122 0 147 1 122
                                                   139 0 148 2 139 0 0 0 149 2
                                                   45 122 6 0 150 2 139 0 0 0
                                                   151 2 139 0 0 83 152 2 11
                                                   153 0 12 154 2 139 0 0 32
                                                   155 1 45 0 0 156 2 45 6 0
                                                   122 157 3 45 6 0 122 6 158 2
                                                   122 19 0 0 159 2 160 19 122
                                                   0 161 2 45 0 0 83 162 2 45 0
                                                   0 83 163 2 45 0 0 0 164 1 45
                                                   122 0 165 2 6 0 0 12 166 2 6
                                                   19 0 0 167 1 169 168 11 170
                                                   2 171 0 6 6 172 2 6 0 0 173
                                                   174 2 6 0 11 0 175 2 83 19 0
                                                   0 176 1 177 0 7 178 2 177 0
                                                   0 12 179 1 177 7 0 180 2 86
                                                   0 181 0 182 1 86 183 0 184 2
                                                   86 0 0 23 185 1 6 0 7 186 3
                                                   189 6 187 188 177 190 1 0 0
                                                   177 191 2 193 192 12 12 194
                                                   2 23 19 0 0 195 1 86 17 0
                                                   196 1 7 139 0 197 0 193 19
                                                   198 1 23 139 0 199 2 117 139
                                                   0 139 200 3 6 0 0 74 32 201
                                                   4 203 6 183 45 23 202 204 3
                                                   205 6 202 188 86 206 3 6 0 0
                                                   74 32 207 2 6 0 68 25 208 1
                                                   6 74 0 209 2 183 0 0 0 210 1
                                                   183 19 0 211 1 6 0 0 212 1 6
                                                   12 0 213 2 59 19 12 0 214 1
                                                   215 6 55 216 1 177 0 12 217
                                                   3 220 177 218 219 86 221 1 6
                                                   223 0 224 2 0 223 0 11 225 2
                                                   23 19 0 12 226 2 0 223 0 12
                                                   227 1 119 83 0 228 1 119 0 0
                                                   229 1 119 86 0 230 1 86 19 0
                                                   231 1 7 232 0 233 2 169 11
                                                   11 127 234 2 11 19 0 0 235 2
                                                   160 19 0 0 236 2 45 19 0 0
                                                   237 1 0 79 0 238 1 0 74 0
                                                   239 1 86 7 0 240 1 0 7 0 241
                                                   1 0 177 0 242 1 0 17 0 243 1
                                                   0 244 0 245 3 0 0 0 74 32
                                                   246 3 0 0 0 74 32 247 2 0 0
                                                   0 12 248 1 0 139 0 249 2 0 0
                                                   0 59 250 1 0 0 0 251 4 0 0 0
                                                   59 95 97 252 1 86 253 0 254
                                                   1 0 253 0 255 1 86 253 0 256
                                                   1 0 253 0 257 1 86 259 0 260
                                                   1 0 223 0 261 1 0 263 0 264
                                                   1 86 265 0 266 1 0 265 0 267
                                                   1 86 268 0 269 1 0 268 0 270
                                                   1 0 272 0 273 1 86 0 7 274 2
                                                   0 0 7 0 275 1 276 113 6 277
                                                   1 276 183 6 278 2 276 279 6
                                                   23 280 2 0 281 0 25 282 1
                                                   276 283 6 284 1 276 283 6
                                                   285 1 276 287 6 288 1 276
                                                   290 6 291 1 6 88 0 292 1 0 0
                                                   0 293 1 294 7 0 295 1 294 7
                                                   0 296 2 6 0 88 88 297 1 0 0
                                                   294 298 1 299 177 0 300 1 6
                                                   0 177 301 1 299 177 0 302 2
                                                   6 0 0 0 303 1 0 0 299 304 1
                                                   306 305 0 307 1 6 0 305 308
                                                   1 306 305 0 309 1 0 0 306
                                                   310 1 6 299 0 311 1 299 177
                                                   0 312 2 299 0 177 177 313 1
                                                   0 299 0 314 2 7 315 0 0 316
                                                   0 86 0 317 2 86 19 0 0 318 2
                                                   139 0 0 0 319 2 6 0 0 0 320
                                                   2 6 0 0 122 321 1 6 0 0 322
                                                   1 323 6 0 324 1 323 326 0
                                                   327 1 0 0 328 329 1 6 330 0
                                                   331 1 299 244 0 332 1 0 330
                                                   0 333 1 6 0 294 334 3 336 6
                                                   187 335 305 337 1 0 0 305
                                                   338 1 339 122 0 340 1 86 0
                                                   122 341 1 339 122 0 342 1 0
                                                   0 339 343 2 122 315 0 0 344
                                                   2 265 0 0 0 345 2 268 0 0 0
                                                   346 1 0 59 32 76 1 0 59 0 78
                                                   2 0 281 0 25 282 3 0 0 0 74
                                                   32 247 1 0 244 0 245 1 0 330
                                                   0 333 1 0 17 0 243 1 0 29 0
                                                   81 1 0 177 0 242 1 0 299 0
                                                   314 1 0 7 0 241 1 0 12 0 31
                                                   1 0 11 11 51 1 0 0 0 93 1 0
                                                   79 0 238 1 0 74 0 239 1 0
                                                   253 0 257 1 0 263 0 264 1 0
                                                   253 0 255 1 0 272 0 273 2 0
                                                   223 0 12 227 2 0 223 0 11
                                                   225 1 0 223 0 261 1 0 19 0
                                                   20 1 0 7 0 22 4 0 0 0 12 83
                                                   68 99 4 0 0 0 12 83 96 100 4
                                                   0 0 0 59 95 69 112 4 0 0 0
                                                   59 95 97 252 4 0 0 0 62 32
                                                   12 71 4 0 0 0 11 0 12 64 2 0
                                                   0 0 59 250 1 0 0 0 251 2 0 0
                                                   0 12 61 3 0 0 0 59 97 102 3
                                                   0 0 0 74 32 246 2 0 0 11 32
                                                   111 2 0 0 0 12 248 1 0 0 0
                                                   293 1 0 0 328 329 1 0 265 0
                                                   267 1 0 268 0 270 1 0 0 177
                                                   191 1 0 0 339 343 1 0 0 299
                                                   304 1 0 0 306 310 1 0 0 294
                                                   298 1 0 0 305 338 1 0 0 12
                                                   27 1 0 139 0 249 1 0 0 25 90
                                                   0 0 83 85 1 0 19 11 43 2 0 0
                                                   12 32 40 4 0 0 12 0 0 0 36 5
                                                   0 0 12 0 0 0 0 37 3 0 0 12 0
                                                   0 35 2 0 0 12 0 34 2 0 0 7 0
                                                   275)))))
           '|lookupComplete|)) 
