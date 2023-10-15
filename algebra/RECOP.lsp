
(SDEFUN |RECOP;getINFOREC|
        ((|infoOp| |BasicOperator|)
         ($ |Record| (|:| |eqn| F) (|:| |idx| (|Symbol|))
          (|:| |fnc| (|BasicOperator|)) (|:| |par| (|List| F))
          (|:| |val| (|Stream| F))
          (|:| |ord| (|Union| (|NonNegativeInteger|) "failed"))
          (|:| |gen| (|Union| (|Mapping| (|List| F) (|List| F)) "failed"))))
        (SPROG ((#1=#:G142 NIL))
               (PROG2
                   (LETT #1# (SPADCALL |infoOp| '%INFOREC (QREFELT $ 18))
                         |RECOP;getINFOREC|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (|None|)
                                 (|Union| (|None|) "failed") #1#)))) 

(SDEFUN |RECOP;setINFOREC|
        ((|infoOp| |BasicOperator|)
         (|rec| |Record| (|:| |eqn| F) (|:| |idx| (|Symbol|))
          (|:| |fnc| (|BasicOperator|)) (|:| |par| (|List| F))
          (|:| |val| (|Stream| F))
          (|:| |ord| (|Union| (|NonNegativeInteger|) "failed"))
          (|:| |gen| (|Union| (|Mapping| (|List| F) (|List| F)) "failed")))
         ($ |Void|))
        (SPADCALL |infoOp| '%INFOREC |rec| (QREFELT $ 16))) 

(SDEFUN |RECOP;getINFOSER|
        ((|infoOp| |BasicOperator|)
         ($ |Record| (|:| |eqn| F) (|:| |idx| (|Symbol|))
          (|:| |fnc| (|BasicOperator|)) (|:| |var| (|Symbol|))
          (|:| |par| (|List| F)) (|:| |val| (|Stream| F))
          (|:| |ord| (|Union| (|NonNegativeInteger|) "failed"))
          (|:| |gen| (|Union| (|Mapping| (|Stream| F)) "failed"))
          (|:| |ex?| (|Boolean|))))
        (SPROG ((#1=#:G148 NIL))
               (PROG2
                   (LETT #1# (SPADCALL |infoOp| '%INFOSER (QREFELT $ 18))
                         |RECOP;getINFOSER|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (|None|)
                                 (|Union| (|None|) "failed") #1#)))) 

(SDEFUN |RECOP;setINFOSER|
        ((|infoOp| |BasicOperator|)
         (|ser| |Record| (|:| |eqn| F) (|:| |idx| (|Symbol|))
          (|:| |fnc| (|BasicOperator|)) (|:| |var| (|Symbol|))
          (|:| |par| (|List| F)) (|:| |val| (|Stream| F))
          (|:| |ord| (|Union| (|NonNegativeInteger|) "failed"))
          (|:| |gen| (|Union| (|Mapping| (|Stream| F)) "failed"))
          (|:| |ex?| (|Boolean|)))
         ($ |Void|))
        (SPADCALL |infoOp| '%INFOSER |ser| (QREFELT $ 16))) 

(SDEFUN |RECOP;getShiftRec|
        ((|op| |BasicOperator|) (|f| |Kernel| F) (|n| |Symbol|)
         ($ |Union| (|Integer|) "failed"))
        (SPROG
         ((#1=#:G164 NIL) (|num| (|SparseUnivariatePolynomial| F))
          (|p| (|Fraction| (|SparseUnivariatePolynomial| F))) (|a| (|List| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |a| (SPADCALL |f| (QREFELT $ 21)) . #2=(|RECOP;getShiftRec|))
            (COND
             ((SPADCALL (CONS #'|RECOP;getShiftRec!0| (VECTOR $ |n|)) |a|
                        (QREFELT $ 26))
              (PROGN (LETT #1# (CONS 0 0) . #2#) (GO #3=#:G163))))
            (COND
             ((SPADCALL (LENGTH |a|) 1 (QREFELT $ 28))
              (|error| "RECOP: operator should have only one argument")))
            (LETT |p|
                  (SPADCALL (SPADCALL |a| 1 (QREFELT $ 29))
                            (SPADCALL (SPADCALL |n| (QREFELT $ 22))
                                      (QREFELT $ 31))
                            (QREFELT $ 33))
                  . #2#)
            (COND
             ((SPADCALL (SPADCALL |p| (QREFELT $ 35)) (|spadConstant| $ 36)
                        (QREFELT $ 37))
              (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #3#))))
            (LETT |num| (SPADCALL |p| (QREFELT $ 39)) . #2#)
            (EXIT
             (COND
              ((EQL (SPADCALL |num| (QREFELT $ 41)) 1)
               (COND
                ((SPADCALL (SPADCALL |num| 1 (QREFELT $ 42))
                           (|spadConstant| $ 14) (QREFELT $ 43))
                 (COND
                  ((SPADCALL (CONS #'|RECOP;getShiftRec!1| (VECTOR $ |n|))
                             (SPADCALL |num| (QREFELT $ 44)) (QREFELT $ 26))
                   (PROGN
                    (LETT #1#
                          (SPADCALL (SPADCALL |num| 0 (QREFELT $ 42))
                                    (QREFELT $ 48))
                          . #2#)
                    (GO #3#)))
                  (#4='T
                   (PROGN (LETT #1# (CONS 1 #5="failed") . #2#) (GO #3#)))))
                (#4# (PROGN (LETT #1# (CONS 1 #5#) . #2#) (GO #3#)))))
              (#4# (PROGN (LETT #1# (CONS 1 #5#) . #2#) (GO #3#)))))))
          #3# (EXIT #1#)))) 

(SDEFUN |RECOP;getShiftRec!1| ((|z| NIL) ($$ NIL))
        (PROG (|n| $)
          (LETT |n| (QREFELT $$ 1) . #1=(|RECOP;getShiftRec|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z| (SPADCALL |n| (QREFELT $ 22)) (QREFELT $ 24)))))) 

(SDEFUN |RECOP;getShiftRec!0| ((|z| NIL) ($$ NIL))
        (PROG (|n| $)
          (LETT |n| (QREFELT $$ 1) . #1=(|RECOP;getShiftRec|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |z| (SPADCALL |n| (QREFELT $ 22)) (QREFELT $ 24)))))) 

(SDEFUN |RECOP;shiftInfoRec|
        ((|op| |BasicOperator|) (|argsym| |Symbol|) (|eq| F)
         ($ |Union|
          (|Record| (|:| |ord| (|NonNegativeInteger|)) (|:| |max| (|Integer|))
                    (|:| |ker| (|Kernel| F)))
          "failed"))
        (SPROG
         ((#1=#:G176 NIL) (#2=#:G179 NIL) (|minShift| (|Integer|))
          (|nextKernel| (|Kernel| F)) (|maxShift| (|Integer|))
          (|error?| (|Boolean|)) (|shift| (|Union| (|Integer|) "failed"))
          (#3=#:G180 NIL) (|f| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |error?| 'T . #4=(|RECOP;shiftInfoRec|))
                (SEQ (LETT |f| NIL . #4#)
                     (LETT #3# (SPADCALL |eq| (QREFELT $ 50)) . #4#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |f| |op| (QREFELT $ 51))
                         (SEQ
                          (LETT |shift|
                                (|RECOP;getShiftRec| |op| |f| |argsym| $)
                                . #4#)
                          (EXIT
                           (COND
                            (|error?|
                             (SEQ (LETT |error?| 'NIL . #4#)
                                  (LETT |nextKernel| |f| . #4#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |shift| 0)
                                     (SEQ
                                      (LETT |maxShift| (QCDR |shift|) . #4#)
                                      (EXIT
                                       (LETT |minShift| (QCDR |shift|)
                                             . #4#))))
                                    ('T
                                     (PROGN
                                      (LETT #2# (CONS 1 "failed") . #4#)
                                      (GO #5=#:G178)))))))
                            ((QEQCAR |shift| 0)
                             (SEQ
                              (COND
                               ((< |maxShift| (QCDR |shift|))
                                (SEQ (LETT |maxShift| (QCDR |shift|) . #4#)
                                     (EXIT (LETT |nextKernel| |f| . #4#)))))
                              (EXIT
                               (COND
                                ((SPADCALL |minShift| (QCDR |shift|)
                                           (QREFELT $ 52))
                                 (LETT |minShift| (QCDR |shift|) . #4#))))))
                            ('T
                             (PROGN
                              (LETT #2# (CONS 1 "failed") . #4#)
                              (GO #5#))))))))))
                     (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                (COND
                 (|error?|
                  (|error| "evalRec: equation does not contain operator")))
                (EXIT
                 (CONS 0
                       (VECTOR
                        (PROG1 (LETT #1# (- |maxShift| |minShift|) . #4#)
                          (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #1#))
                        |maxShift| |nextKernel|)))))
          #5# (EXIT #2#)))) 

(SDEFUN |RECOP;makeRec;BoSFLSF;7|
        ((|op| |BasicOperator|) (|argsym| |Symbol|) (|eq| F)
         (|params| |List| F) (|values| |Stream| F) ($ F))
        (SPROG
         ((#1=#:G226 NIL) (|info| (|BasicOperator|))
          (|fn| (|Mapping| (|List| F) (|List| F))) (|fl| (|List| F))
          (#2=#:G230 NIL) (|i| NIL) (#3=#:G229 NIL) (|ord1| (|Integer|))
          (|max1| (|Integer|)) (|next| (F)) (#4=#:G228 NIL) (#5=#:G227 NIL)
          (|uc1| #6=(|Fraction| (|SparseUnivariatePolynomial| F))) (|uc0| #6#)
          (|c1| (F)) (|c0| (F)) (|argsymKer| (|Kernel| F))
          (|num| (|SparseUnivariatePolynomial| F)) (|p| #6#)
          (|shiftInfo|
           (|Union|
            (|Record| (|:| |ord| (|NonNegativeInteger|))
                      (|:| |max| (|Integer|)) (|:| |ker| (|Kernel| F)))
            "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |shiftInfo| (|RECOP;shiftInfoRec| |op| |argsym| |eq| $)
                  . #7=(|RECOP;makeRec;BoSFLSF;7|))
            (EXIT
             (COND
              ((QEQCAR |shiftInfo| 1)
               (SEQ
                (LETT |info|
                      (SPADCALL (SPADCALL '|inforec| (QREFELT $ 53)) 0
                                (QREFELT $ 54))
                      . #7#)
                (|RECOP;setINFOREC| |info|
                 (VECTOR |eq| |argsym| |op| |params| |values| (CONS 1 "failed")
                         (CONS 1 "failed"))
                 $)
                (EXIT
                 (PROGN
                  (LETT #1#
                        (SPADCALL (QREFELT $ 11)
                                  (SPADCALL
                                   (LIST (SPADCALL |argsym| (QREFELT $ 22))
                                         (SPADCALL |info| NIL (QREFELT $ 57)))
                                   |params| (QREFELT $ 58))
                                  (QREFELT $ 57))
                        . #7#)
                  (GO #8=#:G225)))))
              (#9='T
               (SEQ
                (LETT |p|
                      (SPADCALL |eq| (QVELT (QCDR |shiftInfo|) 2)
                                (QREFELT $ 33))
                      . #7#)
                (LETT |num| (SPADCALL |p| (QREFELT $ 39)) . #7#)
                (COND
                 ((NULL
                   (SPADCALL (SPADCALL |p| (QREFELT $ 59)) (QREFELT $ 60)))
                  (|error|
                   "makeRec assumes that the equation has no denominator")))
                (EXIT
                 (COND
                  ((EQL (SPADCALL |num| (QREFELT $ 41)) 1)
                   (SEQ
                    (LETT |argsymKer|
                          (SPADCALL (SPADCALL |argsym| (QREFELT $ 22))
                                    (QREFELT $ 31))
                          . #7#)
                    (LETT |c0| (SPADCALL |num| 0 (QREFELT $ 42)) . #7#)
                    (LETT |c1| (SPADCALL |num| 1 (QREFELT $ 42)) . #7#)
                    (EXIT
                     (COND
                      ((ZEROP (QVELT (QCDR |shiftInfo|) 0))
                       (COND
                        ((OR (SPADCALL |c1| |argsym| (QREFELT $ 61))
                             (NULL
                              (OR
                               (OR (SPADCALL |c0| (QREFELT $ 67))
                                   (NULL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (LETT |uc0|
                                             (SPADCALL |c0| |argsymKer|
                                                       (QREFELT $ 33))
                                             . #7#)
                                       (QREFELT $ 39))
                                      (SPADCALL
                                       (LETT |uc1|
                                             (SPADCALL |c1| |argsymKer|
                                                       (QREFELT $ 33))
                                             . #7#)
                                       (QREFELT $ 39))
                                      (QREFELT $ 75))
                                     (QREFELT $ 60))))
                               (NULL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |uc0| (QREFELT $ 59))
                                           (SPADCALL |uc1| (QREFELT $ 59))
                                           (QREFELT $ 75))
                                 (QREFELT $ 60))))))
                         (PROGN
                          (LETT #1#
                                (SPADCALL
                                 (SPADCALL (SPADCALL |c0| |c1| (QREFELT $ 62))
                                           (QREFELT $ 63))
                                 (SPADCALL |argsym| (QREFELT $ 22))
                                 (SPADCALL (SPADCALL |argsym| (QREFELT $ 22))
                                           (SPADCALL
                                            (QVELT (QCDR |shiftInfo|) 1)
                                            (QREFELT $ 64))
                                           (QREFELT $ 65))
                                 (QREFELT $ 66))
                                . #7#)
                          (GO #8#)))
                        ('T
                         (SEQ
                          (LETT |next|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |num| 0 (QREFELT $ 42))
                                           (SPADCALL |num| 1 (QREFELT $ 42))
                                           (QREFELT $ 62))
                                 (QREFELT $ 63))
                                . #7#)
                          (LETT |max1| (QVELT (QCDR |shiftInfo|) 1) . #7#)
                          (LETT |ord1| (- (QVELT (QCDR |shiftInfo|) 0) 1)
                                . #7#)
                          (LETT |fl|
                                (CONS (SPADCALL |argsym| (QREFELT $ 22))
                                      (PROGN
                                       (LETT #5# NIL . #7#)
                                       (SEQ (LETT |i| 1 . #7#)
                                            (LETT #4# (+ |ord1| 1) . #7#) G190
                                            (COND
                                             ((|greater_SI| |i| #4#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #5#
                                                    (CONS
                                                     (SPADCALL |op|
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 |argsym|
                                                                 (QREFELT $
                                                                          22))
                                                                (SPADCALL
                                                                 (- |max1| |i|)
                                                                 (QREFELT $
                                                                          64))
                                                                (QREFELT $ 68))
                                                               (QREFELT $ 69))
                                                     #5#)
                                                    . #7#)))
                                            (LETT |i| (|inc_SI| |i|) . #7#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #5#)))))
                                . #7#)
                          (COND
                           ((>= |ord1| 0)
                            (LETT |fn|
                                  (CONS #'|RECOP;makeRec;BoSFLSF;7!0|
                                        (VECTOR |ord1| |fl| |next| $))
                                  . #7#))
                           (#9#
                            (LETT |fn|
                                  (CONS #'|RECOP;makeRec;BoSFLSF;7!1|
                                        (VECTOR |fl| |next| $))
                                  . #7#)))
                          (LETT |info|
                                (SPADCALL (SPADCALL '|inforec| (QREFELT $ 53))
                                          0 (QREFELT $ 54))
                                . #7#)
                          (|RECOP;setINFOREC| |info|
                           (VECTOR |eq| |argsym| |op| |params| |values|
                                   (CONS 0 (QVELT (QCDR |shiftInfo|) 0))
                                   (CONS 0 |fn|))
                           $)
                          (EXIT
                           (PROGN
                            (LETT #1#
                                  (SPADCALL (QREFELT $ 11)
                                            (SPADCALL
                                             (LIST
                                              (SPADCALL |argsym|
                                                        (QREFELT $ 22))
                                              (SPADCALL |info| NIL
                                                        (QREFELT $ 57)))
                                             |params| (QREFELT $ 58))
                                            (QREFELT $ 57))
                                  . #7#)
                            (GO #8#)))))))
                      (#9#
                       (SEQ
                        (LETT |next|
                              (SPADCALL
                               (SPADCALL (SPADCALL |num| 0 (QREFELT $ 42))
                                         (SPADCALL |num| 1 (QREFELT $ 42))
                                         (QREFELT $ 62))
                               (QREFELT $ 63))
                              . #7#)
                        (LETT |max1| (QVELT (QCDR |shiftInfo|) 1) . #7#)
                        (LETT |ord1| (- (QVELT (QCDR |shiftInfo|) 0) 1) . #7#)
                        (LETT |fl|
                              (CONS (SPADCALL |argsym| (QREFELT $ 22))
                                    (PROGN
                                     (LETT #3# NIL . #7#)
                                     (SEQ (LETT |i| 1 . #7#)
                                          (LETT #2# (+ |ord1| 1) . #7#) G190
                                          (COND
                                           ((|greater_SI| |i| #2#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #3#
                                                  (CONS
                                                   (SPADCALL |op|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               |argsym|
                                                               (QREFELT $ 22))
                                                              (SPADCALL
                                                               (- |max1| |i|)
                                                               (QREFELT $ 64))
                                                              (QREFELT $ 68))
                                                             (QREFELT $ 69))
                                                   #3#)
                                                  . #7#)))
                                          (LETT |i| (|inc_SI| |i|) . #7#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #3#)))))
                              . #7#)
                        (COND
                         ((>= |ord1| 0)
                          (LETT |fn|
                                (CONS #'|RECOP;makeRec;BoSFLSF;7!2|
                                      (VECTOR |ord1| |fl| |next| $))
                                . #7#))
                         (#9#
                          (LETT |fn|
                                (CONS #'|RECOP;makeRec;BoSFLSF;7!3|
                                      (VECTOR |fl| |next| $))
                                . #7#)))
                        (LETT |info|
                              (SPADCALL (SPADCALL '|inforec| (QREFELT $ 53)) 0
                                        (QREFELT $ 54))
                              . #7#)
                        (|RECOP;setINFOREC| |info|
                         (VECTOR |eq| |argsym| |op| |params| |values|
                                 (CONS 0 (QVELT (QCDR |shiftInfo|) 0))
                                 (CONS 0 |fn|))
                         $)
                        (EXIT
                         (PROGN
                          (LETT #1#
                                (SPADCALL (QREFELT $ 11)
                                          (SPADCALL
                                           (LIST
                                            (SPADCALL |argsym| (QREFELT $ 22))
                                            (SPADCALL |info| NIL
                                                      (QREFELT $ 57)))
                                           |params| (QREFELT $ 58))
                                          (QREFELT $ 57))
                                . #7#)
                          (GO #8#)))))))))
                  (#9#
                   (SEQ
                    (LETT |info|
                          (SPADCALL (SPADCALL '|inforec| (QREFELT $ 53)) 0
                                    (QREFELT $ 54))
                          . #7#)
                    (|RECOP;setINFOREC| |info|
                     (VECTOR |eq| |argsym| |op| |params| |values|
                             (CONS 0 (QVELT (QCDR |shiftInfo|) 0))
                             (CONS 1 "failed"))
                     $)
                    (EXIT
                     (PROGN
                      (LETT #1#
                            (SPADCALL (QREFELT $ 11)
                                      (SPADCALL
                                       (LIST (SPADCALL |argsym| (QREFELT $ 22))
                                             (SPADCALL |info| NIL
                                                       (QREFELT $ 57)))
                                       |params| (QREFELT $ 58))
                                      (QREFELT $ 57))
                            . #7#)
                      (GO #8#)))))))))))))
          #8# (EXIT #1#)))) 

(SDEFUN |RECOP;makeRec;BoSFLSF;7!3| ((|l| NIL) ($$ NIL))
        (PROG ($ |next| |fl|)
          (LETT $ (QREFELT $$ 2) . #1=(|RECOP;makeRec;BoSFLSF;7|))
          (LETT |next| (QREFELT $$ 1) . #1#)
          (LETT |fl| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (LIST
             (SPADCALL (SPADCALL |l| (QREFELT $ 70)) (|spadConstant| $ 14)
                       (QREFELT $ 68))
             (SPADCALL |next| |fl| |l| (QREFELT $ 71))))))) 

(SDEFUN |RECOP;makeRec;BoSFLSF;7!2| ((|l| NIL) ($$ NIL))
        (PROG ($ |next| |fl| |ord1|)
          (LETT $ (QREFELT $$ 3) . #1=(|RECOP;makeRec;BoSFLSF;7|))
          (LETT |next| (QREFELT $$ 2) . #1#)
          (LETT |fl| (QREFELT $$ 1) . #1#)
          (LETT |ord1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G217 NIL))
                   (SPADCALL
                    (LIST
                     (SPADCALL (SPADCALL |l| (QREFELT $ 70))
                               (|spadConstant| $ 14) (QREFELT $ 68))
                     (SPADCALL |next| |fl| |l| (QREFELT $ 71)))
                    (SPADCALL (SPADCALL |l| (QREFELT $ 72))
                              (PROG1 (LETT #2# |ord1| NIL)
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#))
                              (QREFELT $ 73))
                    (QREFELT $ 58))))))) 

(SDEFUN |RECOP;makeRec;BoSFLSF;7!1| ((|l| NIL) ($$ NIL))
        (PROG ($ |next| |fl|)
          (LETT $ (QREFELT $$ 2) . #1=(|RECOP;makeRec;BoSFLSF;7|))
          (LETT |next| (QREFELT $$ 1) . #1#)
          (LETT |fl| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (LIST
             (SPADCALL (SPADCALL |l| (QREFELT $ 70)) (|spadConstant| $ 14)
                       (QREFELT $ 68))
             (SPADCALL |next| |fl| |l| (QREFELT $ 71))))))) 

(SDEFUN |RECOP;makeRec;BoSFLSF;7!0| ((|l| NIL) ($$ NIL))
        (PROG ($ |next| |fl| |ord1|)
          (LETT $ (QREFELT $$ 3) . #1=(|RECOP;makeRec;BoSFLSF;7|))
          (LETT |next| (QREFELT $$ 2) . #1#)
          (LETT |fl| (QREFELT $$ 1) . #1#)
          (LETT |ord1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G192 NIL))
                   (SPADCALL
                    (LIST
                     (SPADCALL (SPADCALL |l| (QREFELT $ 70))
                               (|spadConstant| $ 14) (QREFELT $ 68))
                     (SPADCALL |next| |fl| |l| (QREFELT $ 71)))
                    (SPADCALL (SPADCALL |l| (QREFELT $ 72))
                              (PROG1 (LETT #2# |ord1| NIL)
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#))
                              (QREFELT $ 73))
                    (QREFELT $ 58))))))) 

(SDEFUN |RECOP;irecur| ((|l| |List| F) ($ F))
        (SPROG
         ((#1=#:G255 NIL) (|s| (|Stream| F)) (|ll| (|List| F)) (#2=#:G257 NIL)
          (|i| NIL) (#3=#:G256 NIL) (|o| (|NonNegativeInteger|))
          (#4=#:G244 NIL) (|g| (|Mapping| (|List| F) (|List| F)))
          (#5=#:G240 NIL) (N (|NonNegativeInteger|)) (#6=#:G238 NIL)
          (|info|
           (|Record| (|:| |eqn| F) (|:| |idx| (|Symbol|))
                     (|:| |fnc| (|BasicOperator|)) (|:| |par| (|List| F))
                     (|:| |val| (|Stream| F))
                     (|:| |ord| (|Union| (|NonNegativeInteger|) #7="failed"))
                     (|:| |gen|
                          (|Union| (|Mapping| (|List| F) (|List| F))
                                   #8="failed"))))
          (|n| (|Union| (|Integer|) "failed")) (|arg| (F)))
         (SEQ
          (EXIT
           (SEQ (LETT |arg| (|SPADfirst| |l|) . #9=(|RECOP;irecur|))
                (LETT |n| (SPADCALL |arg| (QREFELT $ 48)) . #9#)
                (EXIT
                 (COND
                  ((QEQCAR |n| 0)
                   (COND
                    ((>= (QCDR |n|) 0)
                     (SEQ
                      (LETT |info|
                            (|RECOP;getINFOREC|
                             (SPADCALL
                              (SPADCALL (SPADCALL |l| (QREFELT $ 78))
                                        (QREFELT $ 31))
                              (QREFELT $ 79))
                             $)
                            . #9#)
                      (COND
                       ((SPADCALL (QVELT |info| 4)
                                  (+
                                   (PROG1 (LETT #6# (QCDR |n|) . #9#)
                                     (|check_subtype2| (>= #6# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #6#))
                                   1)
                                  (QREFELT $ 80))
                        (COND
                         ((QEQCAR (QVELT |info| 6) 1)
                          (PROGN
                           (LETT #1#
                                 (SPADCALL (QREFELT $ 11) |l| (QREFELT $ 57))
                                 . #9#)
                           (GO #10=#:G254)))
                         (#11='T
                          (SEQ
                           (LETT N (SPADCALL (QVELT |info| 4) (QREFELT $ 81))
                                 . #9#)
                           (LETT |g|
                                 (PROG2 (LETT #5# (QVELT |info| 6) . #9#)
                                     (QCDR #5#)
                                   (|check_union2| (QEQCAR #5# 0)
                                                   (|Mapping|
                                                    (|List| (QREFELT $ 7))
                                                    (|List| (QREFELT $ 7)))
                                                   (|Union|
                                                    (|Mapping|
                                                     (|List| (QREFELT $ 7))
                                                     (|List| (QREFELT $ 7)))
                                                    #8#)
                                                   #5#))
                                 . #9#)
                           (LETT |o|
                                 (PROG2 (LETT #4# (QVELT |info| 5) . #9#)
                                     (QCDR #4#)
                                   (|check_union2| (QEQCAR #4# 0)
                                                   (|NonNegativeInteger|)
                                                   (|Union|
                                                    (|NonNegativeInteger|) #7#)
                                                   #4#))
                                 . #9#)
                           (LETT |ll|
                                 (CONS
                                  (SPADCALL (SPADCALL N (QREFELT $ 64))
                                            (SPADCALL |o| (QREFELT $ 64))
                                            (QREFELT $ 65))
                                  (PROGN
                                   (LETT #3# NIL . #9#)
                                   (SEQ (LETT |i| 0 . #9#)
                                        (LETT #2# (- |o| 1) . #9#) G190
                                        (COND
                                         ((|greater_SI| |i| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #3#
                                                (CONS
                                                 (SPADCALL (QVELT |info| 4)
                                                           (- N |i|)
                                                           (QREFELT $ 82))
                                                 #3#)
                                                . #9#)))
                                        (LETT |i| (|inc_SI| |i|) . #9#)
                                        (GO G190) G191 (EXIT (NREVERSE #3#)))))
                                 . #9#)
                           (LETT |s|
                                 (SPADCALL (ELT $ 78)
                                           (SPADCALL
                                            (SPADCALL |g| |ll| (QREFELT $ 85))
                                            (QREFELT $ 86))
                                           (QREFELT $ 89))
                                 . #9#)
                           (EXIT
                            (QSETVELT |info| 4
                                      (SPADCALL (QVELT |info| 4) |s|
                                                (QREFELT $ 90)))))))))
                      (EXIT
                       (PROGN
                        (LETT #1#
                              (SPADCALL
                               (SPADCALL (QVELT |info| 4) (+ (QCDR |n|) 1)
                                         (QREFELT $ 82))
                               (QVELT |info| 3) (SPADCALL |l| 2 (QREFELT $ 91))
                               (QREFELT $ 71))
                              . #9#)
                        (GO #10#)))))
                    (#11#
                     (PROGN
                      (LETT #1# (SPADCALL (QREFELT $ 11) |l| (QREFELT $ 57))
                            . #9#)
                      (GO #10#)))))
                  (#11#
                   (PROGN
                    (LETT #1# (SPADCALL (QREFELT $ 11) |l| (QREFELT $ 57))
                          . #9#)
                    (GO #10#)))))))
          #10# (EXIT #1#)))) 

(SDEFUN |RECOP;ddrec| ((|l| |List| F) ($ |OutputForm|))
        (SPROG
         ((|RecList| (|List| (|OutputForm|))) (#1=#:G267 NIL) (|i| NIL)
          (#2=#:G266 NIL) (|RecEq| #3=(|OutputForm|)) (|RecCoeff| #3#)
          (|v| (|NonNegativeInteger|)) (#4=#:G260 NIL) (|e| (F))
          (|lv| #5=(|List| F)) (|lp| #5#) (|f| (|BasicOperator|)) (|n0| (F))
          (|n| (F))
          (|info|
           (|Record| (|:| |eqn| F) (|:| |idx| (|Symbol|))
                     (|:| |fnc| (|BasicOperator|)) (|:| |par| (|List| F))
                     (|:| |val| (|Stream| F))
                     (|:| |ord| (|Union| (|NonNegativeInteger|) #6="failed"))
                     (|:| |gen|
                          (|Union| (|Mapping| (|List| F) (|List| F))
                                   "failed")))))
         (SEQ
          (LETT |info|
                (|RECOP;getINFOREC|
                 (SPADCALL
                  (SPADCALL (SPADCALL |l| (QREFELT $ 78)) (QREFELT $ 31))
                  (QREFELT $ 79))
                 $)
                . #7=(|RECOP;ddrec|))
          (LETT |n| (|SPADfirst| |l|) . #7#)
          (LETT |n0| (SPADCALL (QVELT |info| 1) (QREFELT $ 22)) . #7#)
          (LETT |f| (QVELT |info| 2) . #7#)
          (LETT |lp| (CONS |n0| (QVELT |info| 3)) . #7#)
          (LETT |lv| (CONS |n| (SPADCALL |l| 2 (QREFELT $ 91))) . #7#)
          (LETT |e| (SPADCALL (QVELT |info| 0) |lp| |lv| (QREFELT $ 71)) . #7#)
          (LETT |v| (SPADCALL (QREFELT $ 55)) . #7#)
          (COND
           ((QEQCAR (QVELT |info| 5) 0)
            (LETT |v|
                  (MIN |v|
                       (PROG2 (LETT #4# (QVELT |info| 5) . #7#)
                           (QCDR #4#)
                         (|check_union2| (QEQCAR #4# 0) (|NonNegativeInteger|)
                                         (|Union| (|NonNegativeInteger|) #6#)
                                         #4#)))
                  . #7#)))
          (LETT |RecCoeff|
                (SPADCALL
                 (SPADCALL (SPADCALL |f| |n| (QREFELT $ 69)) (QREFELT $ 95))
                 ": " (QREFELT $ 96))
                . #7#)
          (LETT |RecEq|
                (SPADCALL |RecCoeff|
                          (SPADCALL (SPADCALL |e| (QREFELT $ 95))
                                    (SPADCALL (|spadConstant| $ 45)
                                              (QREFELT $ 97))
                                    (QREFELT $ 98))
                          (QREFELT $ 96))
                . #7#)
          (LETT |RecList|
                (PROGN
                 (LETT #2# NIL . #7#)
                 (SEQ (LETT |i| 0 . #7#) (LETT #1# (- |v| 1) . #7#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL |f| (SPADCALL |i| (QREFELT $ 64))
                                           (QREFELT $ 69))
                                 (QREFELT $ 95))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (QVELT |info| 4) (+ |i| 1)
                                            (QREFELT $ 82))
                                  |lp| |lv| (QREFELT $ 71))
                                 (QREFELT $ 95))
                                (QREFELT $ 98))
                               #2#)
                              . #7#)))
                      (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #7#)
          (EXIT
           (SPADCALL (SPADCALL (CONS |RecEq| |RecList|) (QREFELT $ 99))
                     (QREFELT $ 100)))))) 

(SDEFUN |RECOP;diffRec| ((|l| |List| F) (|x| |Symbol|) ($ F))
        (SPROG ((|xF| (F)) (|dummyF| (F)))
               (SEQ
                (LETT |dummyF|
                      (SPADCALL (SPADCALL (QREFELT $ 105)) (QREFELT $ 22))
                      . #1=(|RECOP;diffRec|))
                (LETT |xF| (SPADCALL |x| (QREFELT $ 22)) . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 104)
                           (LIST
                            (SPADCALL
                             (SPADCALL (QREFELT $ 11) |l| (QREFELT $ 57)) |xF|
                             |dummyF| (QREFELT $ 66))
                            |dummyF| |xF|)
                           (QREFELT $ 57)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11|
        ((|op| |BasicOperator|) (|v| |Symbol|) (|argsym| |Symbol|) (|eq| F)
         (|params| |List| F) (|values| |Stream| F) ($ F))
        (SPROG
         ((#1=#:G312 NIL) (|fn| (|Mapping| (|Stream| F)))
          (|explicit?| (|Boolean|)) (|s| (|uts|)) (|a| (|Any|))
          (|uts|
           (|Join| (|UnivariateTaylorSeriesCategory| F)
                   (CATEGORY |domain|
                    (SIGNATURE |coerce| ($ (|UnivariatePolynomial| |v| F)))
                    (SIGNATURE |univariatePolynomial|
                     ((|UnivariatePolynomial| |v| F) $ (|NonNegativeInteger|)))
                    (SIGNATURE |coerce| ($ (|Variable| |v|)))
                    (SIGNATURE |differentiate| ($ $ (|Variable| |v|)))
                    (SIGNATURE |lagrange| ($ $)) (SIGNATURE |lambert| ($ $))
                    (SIGNATURE |oddlambert| ($ $))
                    (SIGNATURE |evenlambert| ($ $))
                    (SIGNATURE |generalLambert| ($ $ (|Integer|) (|Integer|)))
                    (SIGNATURE |revert| ($ $))
                    (SIGNATURE |multisect| ($ (|Integer|) (|Integer|) $))
                    (SIGNATURE |invmultisect| ($ (|Integer|) (|Integer|) $))
                    (IF (|has| F (|Algebra| (|Fraction| (|Integer|))))
                        (SIGNATURE |integrate| ($ $ (|Variable| |v|)))
                        |noBranch|))))
          (|info| (|BasicOperator|)) (|den| (|SparseUnivariatePolynomial| F))
          (|num| (|SparseUnivariatePolynomial| F))
          (|p| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((NULL (SPADCALL |eq| |argsym| (QREFELT $ 61)))
              (|error|
               "RECOP: The argument should not be used in the equation of the ADE")))
            (LETT |p|
                  (SPADCALL |eq|
                            (SPADCALL
                             (SPADCALL |op| (SPADCALL |v| (QREFELT $ 22))
                                       (QREFELT $ 69))
                             (QREFELT $ 31))
                            (QREFELT $ 33))
                  . #2=(|RECOP;makeFEq;Bo2SFLSF;11|))
            (LETT |num| (SPADCALL |p| (QREFELT $ 39)) . #2#)
            (LETT |den| (SPADCALL |p| (QREFELT $ 59)) . #2#)
            (LETT |info|
                  (SPADCALL (SPADCALL '|infoser| (QREFELT $ 53)) 0
                            (QREFELT $ 54))
                  . #2#)
            (COND
             ((|HasCategory| (QREFELT $ 6) '(|GcdDomain|))
              (COND
               ((|HasCategory| (QREFELT $ 6)
                               (LIST '|RetractableTo| '(|Integer|)))
                (COND
                 ((|HasCategory| (QREFELT $ 6)
                                 (LIST '|LinearlyExplicitRingOver|
                                       '(|Integer|)))
                  (COND
                   ((|HasCategory| (QREFELT $ 7) '(|AlgebraicallyClosedField|))
                    (COND
                     ((|HasCategory| (QREFELT $ 7)
                                     '(|TranscendentalFunctionCategory|))
                      (COND
                       ((ZEROP (SPADCALL |den| (QREFELT $ 41)))
                        (COND
                         ((EQL (SPADCALL |num| (QREFELT $ 41)) 1)
                          (COND
                           ((SPADCALL (SPADCALL |den| 0 (QREFELT $ 42))
                                      (SPADCALL |op| (QREFELT $ 106))
                                      (QREFELT $ 61))
                            (COND
                             ((SPADCALL (SPADCALL |num| 0 (QREFELT $ 42))
                                        (SPADCALL |op| (QREFELT $ 106))
                                        (QREFELT $ 61))
                              (COND
                               ((SPADCALL (SPADCALL |num| 1 (QREFELT $ 42))
                                          (SPADCALL |op| (QREFELT $ 106))
                                          (QREFELT $ 61))
                                (SEQ (LETT |explicit?| 'T . #2#)
                                     (LETT |eq|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |num| 0 (QREFELT $ 42))
                                              (SPADCALL |num| 1 (QREFELT $ 42))
                                              (QREFELT $ 62))
                                             (SPADCALL |den| 0 (QREFELT $ 42))
                                             (QREFELT $ 62))
                                            (QREFELT $ 63))
                                           . #2#)
                                     (LETT |uts|
                                           (|UnivariateTaylorSeries|
                                            (QREFELT $ 7) |v|
                                            (|spadConstant| $ 46))
                                           . #2#)
                                     (LETT |a|
                                           (SPADCALL |eq|
                                                     (SPADCALL
                                                      (SPADCALL |v|
                                                                (QREFELT $ 22))
                                                      (|spadConstant| $ 46)
                                                      (QREFELT $ 108))
                                                     (QREFELT $ 111))
                                           . #2#)
                                     (LETT |s|
                                           (SPADCALL |a|
                                                     (|compiledLookupCheck|
                                                      '|retract|
                                                      (LIST (|devaluate| |uts|)
                                                            (LIST '|Any|))
                                                      (|AnyFunctions1| |uts|)))
                                           . #2#)
                                     (EXIT
                                      (LETT |fn|
                                            (CONS
                                             #'|RECOP;makeFEq;Bo2SFLSF;11!0|
                                             (VECTOR |uts| $ |s|))
                                            . #2#))))
                               (#3='T
                                (SEQ (LETT |explicit?| 'NIL . #2#)
                                     (EXIT
                                      (LETT |fn|
                                            (CONS
                                             #'|RECOP;makeFEq;Bo2SFLSF;11!1|
                                             (VECTOR $ |values| |v| |op| |eq|))
                                            . #2#))))))
                             (#3#
                              (SEQ (LETT |explicit?| 'NIL . #2#)
                                   (EXIT
                                    (LETT |fn|
                                          (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!2|
                                                (VECTOR $ |values| |v| |op|
                                                        |eq|))
                                          . #2#))))))
                           (#3#
                            (SEQ (LETT |explicit?| 'NIL . #2#)
                                 (EXIT
                                  (LETT |fn|
                                        (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!3|
                                              (VECTOR $ |values| |v| |op|
                                                      |eq|))
                                        . #2#))))))
                         (#3#
                          (SEQ (LETT |explicit?| 'NIL . #2#)
                               (EXIT
                                (LETT |fn|
                                      (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!4|
                                            (VECTOR $ |values| |v| |op| |eq|))
                                      . #2#))))))
                       (#3#
                        (SEQ (LETT |explicit?| 'NIL . #2#)
                             (EXIT
                              (LETT |fn|
                                    (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!5|
                                          (VECTOR $ |values| |v| |op| |eq|))
                                    . #2#))))))
                     (#3#
                      (SEQ (LETT |explicit?| 'NIL . #2#)
                           (EXIT
                            (LETT |fn|
                                  (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!6|
                                        (VECTOR $ |values| |v| |op| |eq|))
                                  . #2#))))))
                   (#3#
                    (SEQ (LETT |explicit?| 'NIL . #2#)
                         (EXIT
                          (LETT |fn|
                                (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!7|
                                      (VECTOR $ |values| |v| |op| |eq|))
                                . #2#))))))
                 (#3#
                  (SEQ (LETT |explicit?| 'NIL . #2#)
                       (EXIT
                        (LETT |fn|
                              (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!8|
                                    (VECTOR $ |values| |v| |op| |eq|))
                              . #2#))))))
               (#3#
                (SEQ (LETT |explicit?| 'NIL . #2#)
                     (EXIT
                      (LETT |fn|
                            (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!9|
                                  (VECTOR $ |values| |v| |op| |eq|))
                            . #2#))))))
             (#3#
              (SEQ (LETT |explicit?| 'NIL . #2#)
                   (EXIT
                    (LETT |fn|
                          (CONS #'|RECOP;makeFEq;Bo2SFLSF;11!10|
                                (VECTOR $ |values| |v| |op| |eq|))
                          . #2#)))))
            (|RECOP;setINFOSER| |info|
             (VECTOR |eq| |argsym| |op| |v| |params| |values| (CONS 1 "failed")
                     (CONS 0 |fn|) |explicit?|)
             $)
            (EXIT
             (PROGN
              (LETT #1#
                    (SPADCALL (QREFELT $ 12)
                              (SPADCALL
                               (LIST (SPADCALL |argsym| (QREFELT $ 22))
                                     (SPADCALL |info| NIL (QREFELT $ 57)))
                               |params| (QREFELT $ 58))
                              (QREFELT $ 57))
                    . #2#)
              (GO #4=#:G311)))))
          #4# (EXIT #1#)))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!10| (($$ NIL))
        (PROG (|eq| |op| |v| |values| $)
          (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
          (LETT |op| (QREFELT $$ 3) . #1#)
          (LETT |v| (QREFELT $$ 2) . #1#)
          (LETT |values| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT $ 112))
                                 (QREFELT $ 113))
                       (QREFELT $ 116))
             (QREFELT $ 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!9| (($$ NIL))
        (PROG (|eq| |op| |v| |values| $)
          (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
          (LETT |op| (QREFELT $$ 3) . #1#)
          (LETT |v| (QREFELT $$ 2) . #1#)
          (LETT |values| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT $ 112))
                                 (QREFELT $ 113))
                       (QREFELT $ 116))
             (QREFELT $ 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!8| (($$ NIL))
        (PROG (|eq| |op| |v| |values| $)
          (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
          (LETT |op| (QREFELT $$ 3) . #1#)
          (LETT |v| (QREFELT $$ 2) . #1#)
          (LETT |values| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT $ 112))
                                 (QREFELT $ 113))
                       (QREFELT $ 116))
             (QREFELT $ 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!7| (($$ NIL))
        (PROG (|eq| |op| |v| |values| $)
          (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
          (LETT |op| (QREFELT $$ 3) . #1#)
          (LETT |v| (QREFELT $$ 2) . #1#)
          (LETT |values| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT $ 112))
                                 (QREFELT $ 113))
                       (QREFELT $ 116))
             (QREFELT $ 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!6| (($$ NIL))
        (PROG (|eq| |op| |v| |values| $)
          (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
          (LETT |op| (QREFELT $$ 3) . #1#)
          (LETT |v| (QREFELT $$ 2) . #1#)
          (LETT |values| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT $ 112))
                                 (QREFELT $ 113))
                       (QREFELT $ 116))
             (QREFELT $ 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!5| (($$ NIL))
        (PROG (|eq| |op| |v| |values| $)
          (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
          (LETT |op| (QREFELT $$ 3) . #1#)
          (LETT |v| (QREFELT $$ 2) . #1#)
          (LETT |values| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT $ 112))
                                 (QREFELT $ 113))
                       (QREFELT $ 116))
             (QREFELT $ 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!4| (($$ NIL))
        (PROG (|eq| |op| |v| |values| $)
          (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
          (LETT |op| (QREFELT $$ 3) . #1#)
          (LETT |v| (QREFELT $$ 2) . #1#)
          (LETT |values| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT $ 112))
                                 (QREFELT $ 113))
                       (QREFELT $ 116))
             (QREFELT $ 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!3| (($$ NIL))
        (PROG (|eq| |op| |v| |values| $)
          (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
          (LETT |op| (QREFELT $$ 3) . #1#)
          (LETT |v| (QREFELT $$ 2) . #1#)
          (LETT |values| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT $ 112))
                                 (QREFELT $ 113))
                       (QREFELT $ 116))
             (QREFELT $ 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!2| (($$ NIL))
        (PROG (|eq| |op| |v| |values| $)
          (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
          (LETT |op| (QREFELT $$ 3) . #1#)
          (LETT |v| (QREFELT $$ 2) . #1#)
          (LETT |values| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT $ 112))
                                 (QREFELT $ 113))
                       (QREFELT $ 116))
             (QREFELT $ 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!1| (($$ NIL))
        (PROG (|eq| |op| |v| |values| $)
          (LETT |eq| (QREFELT $$ 4) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
          (LETT |op| (QREFELT $$ 3) . #1#)
          (LETT |v| (QREFELT $$ 2) . #1#)
          (LETT |values| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |eq| |op| |v|
                       (SPADCALL (SPADCALL |values| (QREFELT $ 112))
                                 (QREFELT $ 113))
                       (QREFELT $ 116))
             (QREFELT $ 117)))))) 

(SDEFUN |RECOP;makeFEq;Bo2SFLSF;11!0| (($$ NIL))
        (PROG (|s| $ |uts|)
          (LETT |s| (QREFELT $$ 2) . #1=(|RECOP;makeFEq;Bo2SFLSF;11|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |uts| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |s|
                      (|compiledLookupCheck| '|coefficients|
                                             (LIST
                                              (LIST '|Stream|
                                                    (|devaluate| (ELT $ 7)))
                                              '$)
                                             |uts|)))))) 

(SDEFUN |RECOP;iADE| ((|l| |List| F) ($ F))
        (SPROG
         ((#1=#:G330 NIL) (|g| (|Mapping| (|Stream| F))) (#2=#:G322 NIL)
          (N (|NonNegativeInteger|)) (#3=#:G320 NIL)
          (|info|
           (|Record| (|:| |eqn| F) (|:| |idx| (|Symbol|))
                     (|:| |fnc| (|BasicOperator|)) (|:| |var| (|Symbol|))
                     (|:| |par| (|List| F)) (|:| |val| (|Stream| F))
                     (|:| |ord| (|Union| (|NonNegativeInteger|) "failed"))
                     (|:| |gen| (|Union| (|Mapping| (|Stream| F)) #4="failed"))
                     (|:| |ex?| (|Boolean|))))
          (|n| (|Union| (|Integer|) "failed")) (|arg| (F)))
         (SEQ
          (EXIT
           (SEQ (LETT |arg| (|SPADfirst| |l|) . #5=(|RECOP;iADE|))
                (LETT |n| (SPADCALL |arg| (QREFELT $ 48)) . #5#)
                (EXIT
                 (COND
                  ((QEQCAR |n| 0)
                   (COND
                    ((>= (QCDR |n|) 0)
                     (SEQ
                      (LETT |info|
                            (|RECOP;getINFOSER|
                             (SPADCALL
                              (SPADCALL (SPADCALL |l| (QREFELT $ 78))
                                        (QREFELT $ 31))
                              (QREFELT $ 79))
                             $)
                            . #5#)
                      (COND
                       ((SPADCALL (QVELT |info| 5)
                                  (+
                                   (PROG1 (LETT #3# (QCDR |n|) . #5#)
                                     (|check_subtype2| (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #3#))
                                   1)
                                  (QREFELT $ 80))
                        (COND
                         ((QEQCAR (QVELT |info| 7) 1)
                          (PROGN
                           (LETT #1#
                                 (SPADCALL (QREFELT $ 12) |l| (QREFELT $ 57))
                                 . #5#)
                           (GO #6=#:G329)))
                         (#7='T
                          (SEQ
                           (LETT N (SPADCALL (QVELT |info| 5) (QREFELT $ 81))
                                 . #5#)
                           (LETT |g|
                                 (PROG2 (LETT #2# (QVELT |info| 7) . #5#)
                                     (QCDR #2#)
                                   (|check_union2| (QEQCAR #2# 0)
                                                   (|Mapping|
                                                    (|Stream| (QREFELT $ 7)))
                                                   (|Union|
                                                    (|Mapping|
                                                     (|Stream| (QREFELT $ 7)))
                                                    #4#)
                                                   #2#))
                                 . #5#)
                           (EXIT (QSETVELT |info| 5 (SPADCALL |g|))))))))
                      (EXIT
                       (PROGN
                        (LETT #1#
                              (SPADCALL
                               (SPADCALL (QVELT |info| 5) (+ (QCDR |n|) 1)
                                         (QREFELT $ 82))
                               (QVELT |info| 4) (SPADCALL |l| 2 (QREFELT $ 91))
                               (QREFELT $ 71))
                              . #5#)
                        (GO #6#)))))
                    (#7#
                     (PROGN
                      (LETT #1# (SPADCALL (QREFELT $ 12) |l| (QREFELT $ 57))
                            . #5#)
                      (GO #6#)))))
                  (#7#
                   (PROGN
                    (LETT #1# (SPADCALL (QREFELT $ 12) |l| (QREFELT $ 57))
                          . #5#)
                    (GO #6#)))))))
          #6# (EXIT #1#)))) 

(SDEFUN |RECOP;getEq;2F;13| ((|f| F) ($ F))
        (SPROG
         ((#1=#:G339 NIL) (|info| #2=(|BasicOperator|)) (|arg| (|List| F))
          (|op| #2#) (|kl| (|List| (|Kernel| F))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |kl| (SPADCALL |f| (QREFELT $ 50))
                  . #3=(|RECOP;getEq;2F;13|))
            (COND
             ((EQL (LENGTH |kl|) 1)
              (SEQ
               (LETT |op| (SPADCALL (|SPADfirst| |kl|) (QREFELT $ 79)) . #3#)
               (LETT |arg| (SPADCALL (|SPADfirst| |kl|) (QREFELT $ 21)) . #3#)
               (COND
                ((SPADCALL |op| '|rootOfADE| (QREFELT $ 119))
                 (SEQ
                  (LETT |info|
                        (SPADCALL
                         (SPADCALL (SPADCALL |arg| (QREFELT $ 78))
                                   (QREFELT $ 31))
                         (QREFELT $ 79))
                        . #3#)
                  (EXIT
                   (PROGN
                    (LETT #1# (QVELT (|RECOP;getINFOSER| |info| $) 0) . #3#)
                    (GO #4=#:G338))))))
               (EXIT
                (COND
                 ((SPADCALL |op| '|rootOfRec| (QREFELT $ 119))
                  (SEQ
                   (LETT |info|
                         (SPADCALL
                          (SPADCALL (SPADCALL |arg| (QREFELT $ 78))
                                    (QREFELT $ 31))
                          (QREFELT $ 79))
                         . #3#)
                   (EXIT
                    (PROGN
                     (LETT #1# (QVELT (|RECOP;getINFOREC| |info| $) 0) . #3#)
                     (GO #4#))))))))))
            (EXIT
             (|error|
              "getEq: argument should be a single rootOfADE or rootOfRec object"))))
          #4# (EXIT #1#)))) 

(SDEFUN |RECOP;eltable?;FB;14| ((|f| F) ($ |Boolean|))
        (SPROG
         ((#1=#:G355 NIL) (|info| #2=(|BasicOperator|)) (|arg| (|List| F))
          (|op| #2#) (|kl| (|List| (|Kernel| F))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |kl| (SPADCALL |f| (QREFELT $ 50))
                  . #3=(|RECOP;eltable?;FB;14|))
            (COND
             ((EQL (LENGTH |kl|) 1)
              (SEQ
               (LETT |op| (SPADCALL (|SPADfirst| |kl|) (QREFELT $ 79)) . #3#)
               (LETT |arg| (SPADCALL (|SPADfirst| |kl|) (QREFELT $ 21)) . #3#)
               (COND
                ((SPADCALL |op| '|rootOfADE| (QREFELT $ 119))
                 (SEQ
                  (LETT |info|
                        (SPADCALL
                         (SPADCALL (SPADCALL |arg| (QREFELT $ 78))
                                   (QREFELT $ 31))
                         (QREFELT $ 79))
                        . #3#)
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (COND
                           ((QEQCAR (QVELT (|RECOP;getINFOSER| |info| $) 7) 1)
                            'NIL)
                           (#4='T 'T))
                          . #3#)
                    (GO #5=#:G354))))))
               (EXIT
                (COND
                 ((SPADCALL |op| '|rootOfRec| (QREFELT $ 119))
                  (SEQ
                   (LETT |info|
                         (SPADCALL
                          (SPADCALL (SPADCALL |arg| (QREFELT $ 78))
                                    (QREFELT $ 31))
                          (QREFELT $ 79))
                         . #3#)
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (COND
                            ((QEQCAR (QVELT (|RECOP;getINFOREC| |info| $) 6) 1)
                             'NIL)
                            (#4# 'T))
                           . #3#)
                     (GO #5#))))))))))
            (EXIT
             (|error|
              "eltable?: argument should be a single rootOfADE or rootOfRec object"))))
          #5# (EXIT #1#)))) 

(SDEFUN |RECOP;values;Nni;15| (($ |NonNegativeInteger|)) (QREFELT $ 122)) 

(SDEFUN |RECOP;values;2Nni;16|
        ((|n| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((|v| (|NonNegativeInteger|)))
               (SEQ (LETT |v| (SPADCALL (QREFELT $ 55)) |RECOP;values;2Nni;16|)
                    (SETELT $ 122 |n|) (EXIT |v|)))) 

(SDEFUN |RECOP;ddADE| ((|l| |List| F) ($ |OutputForm|))
        (SPROG
         ((|TaylorPoly| (|OutputForm|)) (|TaylorO| (|OutputForm|))
          (|TaylorList| (|List| (|OutputForm|))) (#1=#:G371 NIL) (|i| NIL)
          (#2=#:G370 NIL) (|v| (|NonNegativeInteger|)) (#3=#:G360 NIL)
          (|DiffEq| (|OutputForm|)) (|TaylorCoeff| (|OutputForm|)) (|e| (F))
          (|f| (|BasicOperator|)) (|n| (F)) (|x| (F))
          (|info|
           (|Record| (|:| |eqn| F) (|:| |idx| (|Symbol|))
                     (|:| |fnc| (|BasicOperator|)) (|:| |var| (|Symbol|))
                     (|:| |par| (|List| F)) (|:| |val| (|Stream| F))
                     (|:| |ord| (|Union| (|NonNegativeInteger|) #4="failed"))
                     (|:| |gen| (|Union| (|Mapping| (|Stream| F)) "failed"))
                     (|:| |ex?| (|Boolean|)))))
         (SEQ
          (LETT |info|
                (|RECOP;getINFOSER|
                 (SPADCALL
                  (SPADCALL (SPADCALL |l| (QREFELT $ 78)) (QREFELT $ 31))
                  (QREFELT $ 79))
                 $)
                . #5=(|RECOP;ddADE|))
          (LETT |x| (SPADCALL (QVELT |info| 3) (QREFELT $ 22)) . #5#)
          (LETT |n| (|SPADfirst| |l|) . #5#) (LETT |f| (QVELT |info| 2) . #5#)
          (LETT |e| (QVELT |info| 0) . #5#)
          (LETT |TaylorCoeff|
                (SPADCALL
                 (SPADCALL (SPADCALL |x| (QREFELT $ 95))
                           (SPADCALL |n| (QREFELT $ 95)) (QREFELT $ 124))
                 (QREFELT $ 100))
                . #5#)
          (EXIT
           (COND
            ((QVELT |info| 8)
             (SPADCALL
              (SPADCALL |TaylorCoeff| (SPADCALL |e| (QREFELT $ 95))
                        (QREFELT $ 96))
              (QREFELT $ 100)))
            (#6='T
             (SEQ
              (LETT |DiffEq|
                    (SPADCALL
                     (LIST |TaylorCoeff|
                           (SPADCALL (SPADCALL |f| |x| (QREFELT $ 69))
                                     (QREFELT $ 95))
                           ": "
                           (SPADCALL (SPADCALL |e| (QREFELT $ 95))
                                     (SPADCALL (|spadConstant| $ 45)
                                               (QREFELT $ 97))
                                     (QREFELT $ 98)))
                     (QREFELT $ 125))
                    . #5#)
              (LETT |v| (SPADCALL (QREFELT $ 55)) . #5#)
              (COND
               ((QEQCAR (QVELT |info| 6) 0)
                (LETT |v|
                      (MIN |v|
                           (PROG2 (LETT #3# (QVELT |info| 6) . #5#)
                               (QCDR #3#)
                             (|check_union2| (QEQCAR #3# 0)
                                             (|NonNegativeInteger|)
                                             (|Union| (|NonNegativeInteger|)
                                                      #4#)
                                             #3#)))
                      . #5#)))
              (LETT |TaylorList|
                    (PROGN
                     (LETT #2# NIL . #5#)
                     (SEQ (LETT |i| 1 . #5#) (LETT #1# |v| . #5#) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND
                               ((SPADCALL
                                 (SPADCALL (QVELT |info| 5) |i| (QREFELT $ 82))
                                 (QREFELT $ 67))
                                'NIL)
                               (#6# 'T))
                              (LETT #2#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (QVELT |info| 5) |i|
                                                 (QREFELT $ 82))
                                       (SPADCALL |x| (- |i| 1) (QREFELT $ 126))
                                       (QREFELT $ 127))
                                      (QREFELT $ 95))
                                     #2#)
                                    . #5#)))))
                          (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #5#)
              (LETT |TaylorO|
                    (SPADCALL (SPADCALL 'O (QREFELT $ 128))
                              (LIST
                               (SPADCALL (SPADCALL |x| |v| (QREFELT $ 129))
                                         (QREFELT $ 95)))
                              (QREFELT $ 130))
                    . #5#)
              (LETT |TaylorPoly|
                    (SPADCALL
                     (SPADCALL (SPADCALL |f| |x| (QREFELT $ 69))
                               (QREFELT $ 95))
                     (SPADCALL (ELT $ 131)
                               (SPADCALL |TaylorList| |TaylorO|
                                         (QREFELT $ 133))
                               (QREFELT $ 135))
                     (QREFELT $ 98))
                    . #5#)
              (EXIT
               (SPADCALL (SPADCALL (LIST |DiffEq| |TaylorPoly|) (QREFELT $ 99))
                         (QREFELT $ 100)))))))))) 

(SDEFUN |RECOP;diffADE| ((|l| |List| F) (|x| |Symbol|) ($ F))
        (SPROG ((|xF| (F)) (|dummyF| (F)))
               (SEQ
                (LETT |dummyF|
                      (SPADCALL (SPADCALL (QREFELT $ 105)) (QREFELT $ 22))
                      . #1=(|RECOP;diffADE|))
                (LETT |xF| (SPADCALL |x| (QREFELT $ 22)) . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 104)
                           (LIST
                            (SPADCALL
                             (SPADCALL (QREFELT $ 12) |l| (QREFELT $ 57)) |xF|
                             |dummyF| (QREFELT $ 66))
                            |dummyF| |xF|)
                           (QREFELT $ 57)))))) 

(DECLAIM (NOTINLINE |RecurrenceOperator;|)) 

(DEFUN |RecurrenceOperator| (&REST #1=#:G380)
  (SPROG NIL
         (PROG (#2=#:G381)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RecurrenceOperator|)
                                               '|domainEqualList|)
                    . #3=(|RecurrenceOperator|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RecurrenceOperator;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RecurrenceOperator|)))))))))) 

(DEFUN |RecurrenceOperator;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RecurrenceOperator|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|RecurrenceOperator| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 136) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RecurrenceOperator|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 11 (SPADCALL '|rootOfRec| (QREFELT $ 10)))
          (QSETREFV $ 12 (SPADCALL '|rootOfADE| (QREFELT $ 10)))
          (SPADCALL (QREFELT $ 11) '|%dummyVar| (|spadConstant| $ 13)
                    (QREFELT $ 16))
          (SPADCALL (QREFELT $ 12) '|%dummyVar| (|spadConstant| $ 13)
                    (QREFELT $ 16))
          (SPADCALL (QREFELT $ 11) (CONS (|function| |RECOP;irecur|) $)
                    (QREFELT $ 93))
          (SPADCALL (QREFELT $ 11) '|%specialDisp|
                    (CONS (|function| |RECOP;ddrec|) $) (QREFELT $ 16))
          (QSETREFV $ 104
                    (SPADCALL (SPADCALL '|%diff| (QREFELT $ 102))
                              (QREFELT $ 103)))
          (SPADCALL (QREFELT $ 11) '|%specialDiff|
                    (CONS (|function| |RECOP;diffRec|) $) (QREFELT $ 16))
          (SPADCALL (QREFELT $ 12) (CONS (|function| |RECOP;iADE|) $)
                    (QREFELT $ 93))
          (QSETREFV $ 122 4)
          (SPADCALL (QREFELT $ 12) '|%specialDisp|
                    (CONS (|function| |RECOP;ddADE|) $) (QREFELT $ 16))
          (SPADCALL (QREFELT $ 12) '|%specialDiff|
                    (CONS (|function| |RECOP;diffADE|) $) (QREFELT $ 16))
          $))) 

(MAKEPROP '|RecurrenceOperator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (|BasicOperator|) (0 . |operator|) '|oprecur| '|opADE|
              (5 . |One|) (9 . |One|) (|None|) (13 . |setProperty|)
              (|Union| 15 '"failed") (20 . |property|) (|List| 7) (|Kernel| 7)
              (26 . |argument|) (31 . |coerce|) (|Boolean|) (36 . |freeOf?|)
              (|Mapping| 23 7) (42 . |every?|) (|Integer|) (48 . ~=)
              (54 . |elt|) (|Kernel| $) (60 . |retract|) (|Fraction| 74)
              (65 . |univariate|) (|Fraction| 38) (71 . |denominator|)
              (76 . |One|) (80 . ~=) (|SparseUnivariatePolynomial| 7)
              (86 . |numer|) (|NonNegativeInteger|) (91 . |degree|)
              (96 . |coefficient|) (102 . =) (108 . |coefficients|)
              (113 . |Zero|) (117 . |Zero|) (|Union| 27 '"failed")
              (121 . |retractIfCan|) (|List| 30) (126 . |kernels|)
              (131 . |is?|) (137 . >) (143 . |new|) (148 . |operator|)
              |RECOP;values;Nni;15| (|List| $) (154 . |kernel|)
              (160 . |concat|) (166 . |denom|) (171 . |one?|) (176 . |freeOf?|)
              (182 . /) (188 . -) (193 . |coerce|) (198 . -) (204 . |eval|)
              (211 . |zero?|) (216 . +) (222 . |elt|) (228 . |first|)
              (233 . |eval|) (240 . |rest|) (245 . |first|)
              (|SparseUnivariatePolynomial| $) (251 . |gcdPolynomial|)
              (|Stream| 7) |RECOP;makeRec;BoSFLSF;7| (257 . |second|)
              (262 . |operator|) (267 . |less?|)
              (273 . |numberOfComputedEntries|) (278 . |elt|) (|Mapping| 19 19)
              (|Stream| 19) (284 . |stream|) (290 . |rest|) (|Mapping| 7 19)
              (|StreamFunctions2| 19 7) (295 . |map|) (301 . |concat|)
              (307 . |rest|) (|BasicOperatorFunctions1| 7) (313 . |evaluate|)
              (|OutputForm|) (319 . |coerce|) (324 . |hconcat|)
              (330 . |coerce|) (335 . =) (341 . |commaSeparate|)
              (346 . |bracket|) (|CommonOperators|) (351 . |operator|)
              (356 . |operator|) '|opdiff| (361 . |new|) (365 . |name|)
              (|Equation| 7) (370 . |equation|) (|Any|)
              (|ExpressionToUnivariatePowerSeries| 6 7) (376 . |taylor|)
              (382 . |complete|) (387 . |entries|)
              (|UnivariateFormalPowerSeries| 7)
              (|ExpressionSolve| 6 7 114
                                 (|UnivariateFormalPowerSeries|
                                  (|SparseMultivariatePolynomialExpressions|
                                   7)))
              (392 . |seriesSolve|) (400 . |coefficients|)
              |RECOP;makeFEq;Bo2SFLSF;11| (405 . |is?|) |RECOP;getEq;2F;13|
              |RECOP;eltable?;FB;14| '|vals| |RECOP;values;2Nni;16| (411 . ^)
              (417 . |hconcat|) (422 . ^) (428 . *) (434 . |coerce|) (439 . ^)
              (445 . |prefix|) (451 . +) (|List| 94) (457 . |concat|)
              (|Mapping| 94 94 94) (463 . |reduce|))
           '#(|values| 469 |makeRec| 478 |makeFEq| 487 |getEq| 497 |eltable?|
              502)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 135
                                                 '(1 9 0 8 10 0 6 0 13 0 7 0 14
                                                   3 9 0 0 8 15 16 2 9 17 0 8
                                                   18 1 20 19 0 21 1 7 0 8 22 2
                                                   7 23 0 0 24 2 19 23 25 0 26
                                                   2 27 23 0 0 28 2 19 7 0 27
                                                   29 1 7 30 0 31 2 7 32 0 30
                                                   33 1 34 0 0 35 0 34 0 36 2
                                                   34 23 0 0 37 1 34 38 0 39 1
                                                   38 40 0 41 2 38 7 0 40 42 2
                                                   7 23 0 0 43 1 38 19 0 44 0 6
                                                   0 45 0 7 0 46 1 7 47 0 48 1
                                                   7 49 0 50 2 20 23 0 9 51 2
                                                   27 23 0 0 52 1 8 0 0 53 2 9
                                                   0 8 40 54 2 7 0 9 56 57 2 19
                                                   0 0 0 58 1 34 38 0 59 1 38
                                                   23 0 60 2 7 23 0 8 61 2 7 0
                                                   0 0 62 1 7 0 0 63 1 7 0 27
                                                   64 2 7 0 0 0 65 3 7 0 0 0 0
                                                   66 1 7 23 0 67 2 7 0 0 0 68
                                                   2 7 0 9 0 69 1 19 7 0 70 3 7
                                                   0 0 56 56 71 1 19 0 0 72 2
                                                   19 0 0 40 73 2 7 74 74 74 75
                                                   1 19 7 0 78 1 20 9 0 79 2 76
                                                   23 0 40 80 1 76 40 0 81 2 76
                                                   7 0 27 82 2 84 0 83 19 85 1
                                                   84 0 0 86 2 88 76 87 84 89 2
                                                   76 0 0 0 90 2 19 0 0 40 91 2
                                                   92 9 9 87 93 1 7 94 0 95 2
                                                   94 0 0 0 96 1 6 94 0 97 2 94
                                                   0 0 0 98 1 94 0 56 99 1 94 0
                                                   0 100 1 101 9 8 102 1 7 9 9
                                                   103 0 8 0 105 1 9 8 0 106 2
                                                   107 0 7 7 108 2 110 109 7
                                                   107 111 1 76 0 0 112 1 76 19
                                                   0 113 4 115 114 7 9 8 19 116
                                                   1 114 76 0 117 2 9 23 0 8
                                                   119 2 94 0 0 0 124 1 94 0 56
                                                   125 2 7 0 0 27 126 2 7 0 0 0
                                                   127 1 8 94 0 128 2 7 0 0 40
                                                   129 2 94 0 0 56 130 2 94 0 0
                                                   0 131 2 132 0 0 94 133 2 132
                                                   94 134 0 135 0 0 40 55 1 0
                                                   40 40 123 5 0 7 9 8 7 19 76
                                                   77 6 0 7 9 8 8 7 19 76 118 1
                                                   0 7 7 120 1 0 23 7 121)))))
           '|lookupComplete|)) 
