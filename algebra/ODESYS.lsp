
(SDEFUN |ODESYS;solve;MVMU;1|
        ((|mm| |Matrix| F) (|v| |Vector| F)
         (|solve| |Mapping|
          #1=(|Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
                      "failed")
          LO F)
         ($ |Union|
          (|Record| (|:| |particular| (|Vector| F)) (|:| |basis| (|Matrix| F)))
          "failed"))
        (SPROG
         ((|k| #2=(|NonNegativeInteger|)) (|l| NIL) (|m| #2#)
          (|solVec| #3=(|Vector| F)) (#4=#:G153 NIL) (|s| NIL)
          (|nn| (|NonNegativeInteger|))
          (|er|
           (|Record| (|:| C (|Matrix| F)) (|:| |g| (|Vector| F)) (|:| |eq| LO)
                     (|:| |rh| F)))
          (|i| #2#) (#5=#:G152 NIL) (|sol| NIL) (|SolMatrix| (|Matrix| F))
          (#6=#:G151 NIL) (|part| #3#) (|n| (|NonNegativeInteger|))
          (|sols|
           (|List| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))))
          (#7=#:G149 NIL) (|u| #1#) (#8=#:G150 NIL) (|e| NIL)
          (|rec|
           (|Record| (|:| A (|Matrix| F))
                     (|:| |eqs|
                          (|List|
                           (|Record| (|:| C (|Matrix| F))
                                     (|:| |g| (|Vector| F)) (|:| |eq| LO)
                                     (|:| |rh| F)))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |rec| (SPADCALL |mm| |v| (QREFELT $ 14))
                  . #9=(|ODESYS;solve;MVMU;1|))
            (LETT |sols| NIL . #9#)
            (SEQ (LETT |e| NIL . #9#) (LETT #8# (QCDR |rec|) . #9#) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |e| (CAR #8#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |u| (SPADCALL (QVELT |e| 2) (QVELT |e| 3) |solve|)
                        . #9#)
                  (EXIT
                   (COND
                    ((QEQCAR |u| 1)
                     (PROGN
                      (LETT #7# (CONS 1 "failed") . #9#)
                      (GO #10=#:G148)))
                    ('T (LETT |sols| (CONS (QCDR |u|) |sols|) . #9#)))))
                 (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
            (LETT |n| (ANROWS (QCAR |rec|)) . #9#) (LETT |k| 0 . #9#)
            (LETT |i| 0 . #9#) (LETT |m| 0 . #9#)
            (LETT |part| (MAKEARR1 |n| (|spadConstant| $ 15)) . #9#)
            (SEQ (LETT |sol| NIL . #9#) (LETT #6# |sols| . #9#) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |sol| (CAR #6#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |m|
                         (+ |m|
                            (SPADCALL (CONS #'|ODESYS;solve;MVMU;1!0| $)
                                      (QCDR |sol|) (QREFELT $ 22)))
                         . #9#)))
                 (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL))
            (LETT |SolMatrix| (MAKE_MATRIX1 |n| |m| (|spadConstant| $ 15))
                  . #9#)
            (LETT |m| 0 . #9#)
            (SEQ (LETT |sol| NIL . #9#) (LETT #5# (NREVERSE |sols|) . #9#) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |sol| (CAR #5#) . #9#) NIL))
                   (GO G191)))
                 (SEQ (LETT |i| (+ |i| 1) . #9#)
                      (LETT |er| (SPADCALL (QCDR |rec|) |i| (QREFELT $ 27))
                            . #9#)
                      (LETT |nn| (QVSIZE (QVELT |er| 1)) . #9#)
                      (SEQ (LETT |s| NIL . #9#) (LETT #4# (QCDR |sol|) . #9#)
                           G190
                           (COND
                            ((OR (ATOM #4#)
                                 (PROGN (LETT |s| (CAR #4#) . #9#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |solVec| (MAKEARR1 |n| (|spadConstant| $ 15))
                                  . #9#)
                            (SPADCALL |solVec| (+ |k| 1) |s| (QREFELT $ 28))
                            (SEQ (LETT |l| 2 . #9#) G190
                                 (COND ((|greater_SI| |l| |nn|) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SPADCALL |solVec| (+ |k| |l|)
                                             (SPADCALL (QREFELT $ 9)
                                                       (SPADCALL |solVec|
                                                                 (- (+ |k| |l|)
                                                                    1)
                                                                 (QREFELT $
                                                                          29))
                                                       (QREFELT $ 30))
                                             (QREFELT $ 28))))
                                 (LETT |l| (|inc_SI| |l|) . #9#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |m| (+ |m| 1) . #9#)
                            (EXIT
                             (SPADCALL |SolMatrix| |m| |solVec|
                                       (QREFELT $ 31))))
                           (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                           (EXIT NIL))
                      (SPADCALL |part| (+ |k| 1) (QCAR |sol|) (QREFELT $ 28))
                      (SEQ (LETT |l| 2 . #9#) G190
                           (COND ((|greater_SI| |l| |nn|) (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |part| (+ |k| |l|)
                                       (SPADCALL
                                        (SPADCALL (QREFELT $ 9)
                                                  (SPADCALL |part|
                                                            (- (+ |k| |l|) 1)
                                                            (QREFELT $ 29))
                                                  (QREFELT $ 30))
                                        (SPADCALL (QVELT |er| 1) (- |l| 1)
                                                  (QREFELT $ 29))
                                        (QREFELT $ 32))
                                       (QREFELT $ 28))))
                           (LETT |l| (|inc_SI| |l|) . #9#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (LETT |k| (+ |k| |nn|) . #9#)))
                 (LETT #5# (CDR #5#) . #9#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (CONS 0
                   (CONS (SPADCALL (QCAR |rec|) |part| (QREFELT $ 33))
                         (SPADCALL (QCAR |rec|) |SolMatrix|
                                   (QREFELT $ 34)))))))
          #10# (EXIT #7#)))) 

(SDEFUN |ODESYS;solve;MVMU;1!0| ((|f1| NIL) ($ NIL))
        (SPADCALL |f1| (|spadConstant| $ 15) (QREFELT $ 18))) 

(SDEFUN |ODESYS;triangulate;MVR;2|
        ((|m| |Matrix| F) (|v| |Vector| F)
         ($ |Record| (|:| A (|Matrix| F))
          (|:| |eqs|
               (|List|
                (|Record| (|:| C (|Matrix| F)) (|:| |g| (|Vector| F))
                          (|:| |eq| LO) (|:| |rh| F))))))
        (SPROG
         ((|k| (|NonNegativeInteger|))
          (|ler|
           (|List|
            (|Record| (|:| C (|Matrix| F)) (|:| |g| (|Vector| F)) (|:| |eq| LO)
                      (|:| |rh| F))))
          (|h0| (F)) (|j| NIL) (#1=#:G168 NIL) (|sum| (|Vector| F)) (|op| (LO))
          (#2=#:G167 NIL) (|n| (|NonNegativeInteger|)) (#3=#:G166 NIL)
          (|er| NIL)
          (|l| (|List| (|Record| (|:| C (|Matrix| F)) (|:| |g| (|Vector| F)))))
          (|rat|
           (|Record| (|:| R (|Matrix| F)) (|:| A (|Matrix| F))
                     (|:| |Ainv| (|Matrix| F)))))
         (SEQ (LETT |k| 0 . #4=(|ODESYS;triangulate;MVR;2|))
              (LETT |rat|
                    (SPADCALL |m| (|spadConstant| $ 42)
                              (CONS #'|ODESYS;triangulate;MVR;2!0|
                                    (VECTOR $ (QREFELT $ 9)))
                              (QREFELT $ 47))
                    . #4#)
              (LETT |l|
                    (SPADCALL (QVELT |rat| 0)
                              (SPADCALL (QVELT |rat| 2) |v| (QREFELT $ 33))
                              (QREFELT $ 50))
                    . #4#)
              (LETT |ler| NIL . #4#)
              (SEQ (LETT |er| NIL . #4#) (LETT #3# |l| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |er| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |n| (ANROWS (QCAR |er|)) . #4#)
                        (LETT |op| (|spadConstant| $ 16) . #4#)
                        (SEQ (LETT |j| 0 . #4#) (LETT #2# (- |n| 1) . #4#) G190
                             (COND ((|greater_SI| |j| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |op|
                                     (SPADCALL |op|
                                               (SPADCALL
                                                (SPADCALL (QCAR |er|) |n|
                                                          (+ |j| 1)
                                                          (QREFELT $ 51))
                                                |j| (QREFELT $ 52))
                                               (QREFELT $ 53))
                                     . #4#)))
                             (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |op|
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 23) |n|
                                         (QREFELT $ 52))
                               |op| (QREFELT $ 54))
                              . #4#)
                        (LETT |sum| (MAKEARR1 |n| (|spadConstant| $ 15)) . #4#)
                        (SEQ (LETT |j| 1 . #4#) (LETT #1# (- |n| 1) . #4#) G190
                             (COND ((|greater_SI| |j| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |sum| (+ |j| 1)
                                         (SPADCALL
                                          (SPADCALL (QREFELT $ 9)
                                                    (SPADCALL |sum| |j|
                                                              (QREFELT $ 29))
                                                    (QREFELT $ 30))
                                          (SPADCALL (QCDR |er|) |j|
                                                    (QREFELT $ 29))
                                          (QREFELT $ 55))
                                         (QREFELT $ 28))))
                             (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |h0| (|spadConstant| $ 15) . #4#)
                        (SEQ (LETT |j| 1 . #4#) G190
                             (COND ((|greater_SI| |j| |n|) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |h0|
                                     (SPADCALL |h0|
                                               (SPADCALL
                                                (SPADCALL (QCAR |er|) |n| |j|
                                                          (QREFELT $ 51))
                                                (SPADCALL |sum| |j|
                                                          (QREFELT $ 29))
                                                (QREFELT $ 56))
                                               (QREFELT $ 32))
                                     . #4#)))
                             (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |h0|
                              (SPADCALL
                               (SPADCALL |h0|
                                         (SPADCALL (QREFELT $ 9)
                                                   (SPADCALL |sum| |n|
                                                             (QREFELT $ 29))
                                                   (QREFELT $ 30))
                                         (QREFELT $ 55))
                               (SPADCALL (QCDR |er|) |n| (QREFELT $ 29))
                               (QREFELT $ 55))
                              . #4#)
                        (LETT |ler|
                              (CONS (VECTOR (QCAR |er|) (QCDR |er|) |op| |h0|)
                                    |ler|)
                              . #4#)
                        (EXIT (LETT |k| (+ |k| |n|) . #4#)))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (QVELT |rat| 1) |ler|))))) 

(SDEFUN |ODESYS;triangulate;MVR;2!0| ((|f1| NIL) ($$ NIL))
        (PROG (|diff| $)
          (LETT |diff| (QREFELT $$ 1) . #1=(|ODESYS;triangulate;MVR;2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |diff| |f1| (QREFELT $ 30)) (QREFELT $ 43)))))) 

(SDEFUN |ODESYS;backsolve|
        ((|m| |Matrix| LO) (|v| |Vector| F)
         (|solve| |Mapping|
          #1=(|Record| (|:| |particular| #2=(|Union| F #3="failed"))
                       (|:| |basis| (|List| F)))
          LO F)
         ($ |Record| (|:| |particular| (|Union| (|Vector| F) "failed"))
          (|:| |basis| (|List| (|Vector| F)))))
        (SPROG
         ((|bas| (|List| (|Vector| F))) (#4=#:G197 NIL) (|i| NIL)
          (#5=#:G196 NIL) (|n| (|NonNegativeInteger|)) (#6=#:G195 NIL)
          (|a| (F)) (|eq| (LO)) (|c| (|Integer|)) (|r| (|Integer|))
          (#7=#:G193 NIL) (#8=#:G194 NIL) (|b| NIL) (|hom| (|Matrix| F))
          (#9=#:G175 NIL) (|part| (|Vector| F)) (|part?| (|Boolean|)) (|u| #2#)
          (|dim| (|NonNegativeInteger|)) (#10=#:G173 NIL) (|rec| #1#)
          (|offset| (|Integer|)) (|mr| (|Integer|)))
         (SEQ
          (LETT |r| (SPADCALL |m| (QREFELT $ 58)) . #11=(|ODESYS;backsolve|))
          (LETT |offset| (- (SPADCALL |v| (QREFELT $ 59)) (LETT |mr| 1 . #11#))
                . #11#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((>= |r| |mr|)
                    (SPADCALL (ELT $ 60) (SPADCALL |m| |r| (QREFELT $ 62))
                              (QREFELT $ 64)))
                   ('T 'NIL)))
                 (GO G191)))
               (SEQ (EXIT (LETT |r| (- |r| 1) . #11#))) NIL (GO G190) G191
               (EXIT NIL))
          (EXIT
           (COND ((< |r| |mr|) (|error| "backsolve: system has a 0 matrix"))
                 ((SPADCALL (LETT |c| (|ODESYS;firstnonzero| |m| |r| $) . #11#)
                            (SPADCALL |m| (QREFELT $ 65)) (QREFELT $ 66))
                  (|error| "backsolve: undetermined system"))
                 (#12='T
                  (SEQ
                   (LETT |rec|
                         (SPADCALL (SPADCALL |m| |r| |c| (QREFELT $ 67))
                                   (SPADCALL |v| (+ |r| |offset|)
                                             (QREFELT $ 29))
                                   |solve|)
                         . #11#)
                   (LETT |dim|
                         (PROG1 (LETT #10# (+ (- |r| |mr|) 1) . #11#)
                           (|check_subtype2| (>= #10# 0)
                                             '(|NonNegativeInteger|)
                                             '(|Integer|) #10#))
                         . #11#)
                   (SEQ
                    (LETT |part?| (QEQCAR (LETT |u| (QCAR |rec|) . #11#) 0)
                          . #11#)
                    (EXIT
                     (COND
                      (|part?|
                       (SEQ
                        (LETT |part| (MAKEARR1 |dim| (|spadConstant| $ 15))
                              . #11#)
                        (EXIT
                         (SPADCALL |part| (+ |r| |offset|)
                                   (PROG2 (LETT #9# |u| . #11#)
                                       (QCDR #9#)
                                     (|check_union2| (QEQCAR #9# 0)
                                                     (QREFELT $ 6)
                                                     (|Union| (QREFELT $ 6)
                                                              #3#)
                                                     #9#))
                                   (QREFELT $ 28))))))))
                   (LETT |hom|
                         (MAKE_MATRIX1 |dim| (LENGTH (QCDR |rec|))
                                       (|spadConstant| $ 15))
                         . #11#)
                   (SEQ (LETT |b| NIL . #11#) (LETT #8# (QCDR |rec|) . #11#)
                        (LETT |i| 1 . #11#)
                        (LETT #7# (SPADCALL |hom| (QREFELT $ 68)) . #11#) G190
                        (COND
                         ((OR (|greater_SI| |i| #7#) (ATOM #8#)
                              (PROGN (LETT |b| (CAR #8#) . #11#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT (SPADCALL |hom| |r| |i| |b| (QREFELT $ 69))))
                        (LETT |i|
                              (PROG1 (|inc_SI| |i|)
                                (LETT #8# (CDR #8#) . #11#))
                              . #11#)
                        (GO G190) G191 (EXIT NIL))
                   (LETT |n| 1 . #11#)
                   (SEQ G190
                        (COND
                         ((NULL (SPADCALL |r| |mr| (QREFELT $ 70))) (GO G191)))
                        (SEQ (LETT |r| (- |r| 1) . #11#)
                             (LETT |c| (- |c| 1) . #11#)
                             (EXIT
                              (COND
                               ((SPADCALL (|ODESYS;firstnonzero| |m| |r| $) |c|
                                          (QREFELT $ 66))
                                (|error| "backsolve: undetermined system"))
                               ((SPADCALL
                                 (SPADCALL
                                  (LETT |eq|
                                        (SPADCALL |m| |r| |c| (QREFELT $ 67))
                                        . #11#)
                                  (QREFELT $ 71))
                                 0 (QREFELT $ 72))
                                (|error| "backsolve: pivot of order > 0"))
                               ('T
                                (SEQ
                                 (LETT |a| (SPADCALL |eq| (QREFELT $ 73))
                                       . #11#)
                                 (COND
                                  (|part?|
                                   (SPADCALL |part| (+ |r| |offset|)
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |v| (+ |r| |offset|)
                                                         (QREFELT $ 29))
                                               (|ODESYS;applyLodo| |m| |r|
                                                |part| |n| $)
                                               (QREFELT $ 32))
                                              |a| (QREFELT $ 74))
                                             (QREFELT $ 28))))
                                 (SEQ (LETT |i| 1 . #11#)
                                      (LETT #6# (SPADCALL |hom| (QREFELT $ 68))
                                            . #11#)
                                      G190
                                      (COND ((|greater_SI| |i| #6#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL |hom| |r| |i|
                                                  (SPADCALL
                                                   (|ODESYS;applyLodo0| |m| |r|
                                                    |hom| |i| |n| $)
                                                   (QREFELT $ 43))
                                                  (QREFELT $ 69))))
                                      (LETT |i| (|inc_SI| |i|) . #11#)
                                      (GO G190) G191 (EXIT NIL))
                                 (EXIT (LETT |n| (+ |n| 1) . #11#)))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (LETT |bas|
                         (PROGN
                          (LETT #5# NIL . #11#)
                          (SEQ (LETT |i| 1 . #11#)
                               (LETT #4# (SPADCALL |hom| (QREFELT $ 68))
                                     . #11#)
                               G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #5#
                                       (CONS
                                        (SPADCALL |hom| |i| (QREFELT $ 75))
                                        #5#)
                                       . #11#)))
                               (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                               (EXIT (NREVERSE #5#))))
                         . #11#)
                   (EXIT
                    (COND (|part?| (CONS (CONS 0 |part|) |bas|))
                          (#12# (CONS (CONS 1 "failed") |bas|))))))))))) 

(SDEFUN |ODESYS;solveInField;MVMR;4|
        ((|m| |Matrix| LO) (|v| |Vector| F)
         (|solve| |Mapping|
          (|Record| (|:| |particular| (|Union| F "failed"))
                    (|:| |basis| (|List| F)))
          LO F)
         ($ |Record| (|:| |particular| (|Union| (|Vector| F) "failed"))
          (|:| |basis| (|List| (|Vector| F)))))
        (SPROG
         ((|rec| (|Record| (|:| |mat| (|Matrix| LO)) (|:| |vec| (|Vector| F))))
          (#1=#:G235 NIL) (#2=#:G239 NIL) (|i| NIL) (#3=#:G238 NIL)
          (|rc|
           (|Record| (|:| |particular| (|Vector| F))
                     (|:| |basis| (|Matrix| F))))
          (|uu|
           (|Union|
            (|Record| (|:| |particular| (|Vector| F))
                      (|:| |basis| (|Matrix| F)))
            "failed"))
          (|u| (|Union| (|Matrix| F) "failed")) (#4=#:G236 NIL) (#5=#:G237 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((EQL (LETT |n| (ANROWS |m|) . #6=(|ODESYS;solveInField;MVMR;4|))
                   (ANCOLS |m|))
              (SEQ
               (LETT |u|
                     (|ODESYS;M2F|
                      (SPADCALL
                       (SPADCALL
                        (PROGN
                         (LETT #5# (GETREFV |n|) . #6#)
                         (SEQ (LETT |i| 1 . #6#) (LETT #4# 0 . #6#) G190
                              (COND ((|greater_SI| |i| |n|) (GO G191)))
                              (SEQ (EXIT (SETELT #5# #4# (QREFELT $ 9))))
                              (LETT #4#
                                    (PROG1 (|inc_SI| #4#)
                                      (LETT |i| (|inc_SI| |i|) . #6#))
                                    . #6#)
                              (GO G190) G191 (EXIT NIL))
                         #5#)
                        (QREFELT $ 76))
                       |m| (QREFELT $ 77))
                      $)
                     . #6#)
               (EXIT
                (COND
                 ((QEQCAR |u| 0)
                  (PROGN
                   (LETT #1#
                         (SEQ
                          (LETT |uu|
                                (SPADCALL (QCDR |u|) |v|
                                          (CONS
                                           #'|ODESYS;solveInField;MVMR;4!0|
                                           (VECTOR $ |solve|))
                                          (QREFELT $ 40))
                                . #6#)
                          (EXIT
                           (COND ((QEQCAR |uu| 1) (CONS (CONS 1 "failed") NIL))
                                 ('T
                                  (SEQ (LETT |rc| (QCDR |uu|) . #6#)
                                       (EXIT
                                        (CONS (CONS 0 (QCAR |rc|))
                                              (PROGN
                                               (LETT #3# NIL . #6#)
                                               (SEQ (LETT |i| 1 . #6#)
                                                    (LETT #2#
                                                          (ANCOLS (QCDR |rc|))
                                                          . #6#)
                                                    G190
                                                    (COND
                                                     ((|greater_SI| |i| #2#)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #3#
                                                            (CONS
                                                             (SPADCALL
                                                              (QCDR |rc|) |i|
                                                              (QREFELT $ 75))
                                                             #3#)
                                                            . #6#)))
                                                    (LETT |i| (|inc_SI| |i|)
                                                          . #6#)
                                                    (GO G190) G191
                                                    (EXIT
                                                     (NREVERSE #3#)))))))))))
                         . #6#)
                   (GO #7=#:G224))))))))
            (LETT |rec| (SPADCALL |m| |v| (QREFELT $ 79)) . #6#)
            (EXIT (|ODESYS;backsolve| (QCAR |rec|) (QCDR |rec|) |solve| $))))
          #7# (EXIT #1#)))) 

(SDEFUN |ODESYS;solveInField;MVMR;4!0| ((|l1| NIL) (|f2| NIL) ($$ NIL))
        (PROG (|solve| $)
          (LETT |solve| (QREFELT $$ 1) . #1=(|ODESYS;solveInField;MVMR;4|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|ODESYS;FSL2USL| (SPADCALL |l1| |f2| |solve|) $))))) 

(SDEFUN |ODESYS;M2F| ((|m| |Matrix| LO) ($ |Union| (|Matrix| F) "failed"))
        (SPROG
         ((#1=#:G251 NIL) (|u| (|Union| F "failed")) (#2=#:G253 NIL) (|j| NIL)
          (#3=#:G252 NIL) (|i| NIL) (|mf| (|Matrix| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mf|
                  (MAKE_MATRIX1 (ANROWS |m|) (ANCOLS |m|)
                                (|spadConstant| $ 15))
                  . #4=(|ODESYS;M2F|))
            (SEQ (LETT |i| 1 . #4#)
                 (LETT #3# (SPADCALL |m| (QREFELT $ 58)) . #4#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1 . #4#)
                        (LETT #2# (SPADCALL |m| (QREFELT $ 65)) . #4#) G190
                        (COND ((|greater_SI| |j| #2#) (GO G191)))
                        (SEQ
                         (LETT |u|
                               (SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 67))
                                         (QREFELT $ 86))
                               . #4#)
                         (EXIT
                          (COND
                           ((QEQCAR |u| 1)
                            (PROGN
                             (LETT #1# (CONS 1 "failed") . #4#)
                             (GO #5=#:G250)))
                           ('T
                            (SPADCALL |mf| |i| |j| (QCDR |u|)
                                      (QREFELT $ 69))))))
                        (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                        (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |mf|))))
          #5# (EXIT #1#)))) 

(SDEFUN |ODESYS;FSL2USL|
        ((|rec| |Record| (|:| |particular| (|Union| F #1="failed"))
          (|:| |basis| (|List| F)))
         ($ |Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
          "failed"))
        (SPROG ((#2=#:G260 NIL))
               (COND ((QEQCAR (QCAR |rec|) 1) (CONS 1 "failed"))
                     ('T
                      (CONS 0
                            (CONS
                             (PROG2 (LETT #2# (QCAR |rec|) |ODESYS;FSL2USL|)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0) (QREFELT $ 6)
                                               (|Union| (QREFELT $ 6) #1#)
                                               #2#))
                             (QCDR |rec|))))))) 

(SDEFUN |ODESYS;firstnonzero| ((|m| |Matrix| LO) (|r| |Integer|) ($ |Integer|))
        (SPROG ((#1=#:G268 NIL) (#2=#:G269 NIL) (#3=#:G270 NIL) (|c| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |c| 1 . #4=(|ODESYS;firstnonzero|))
                         (LETT #3# (SPADCALL |m| (QREFELT $ 65)) . #4#) G190
                         (COND ((|greater_SI| |c| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |m| |r| |c| (QREFELT $ 67))
                                       (|spadConstant| $ 16) (QREFELT $ 87))
                             (PROGN
                              (LETT #1#
                                    (PROGN (LETT #2# |c| . #4#) (GO #5=#:G267))
                                    . #4#)
                              (GO #6=#:G265))))))
                         (LETT |c| (|inc_SI| |c|) . #4#) (GO G190) G191
                         (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT (|error| "firstnonzero: zero row"))))
                #5# (EXIT #2#)))) 

(SDEFUN |ODESYS;applyLodo|
        ((|m| |Matrix| LO) (|r| |Integer|) (|v| |Vector| F)
         (|n| |NonNegativeInteger|) ($ F))
        (SPROG ((|cv| (|Integer|)) (|c| (|Integer|)) (|ans| (F)) (|i| NIL))
               (SEQ
                (LETT |ans| (|spadConstant| $ 15) . #1=(|ODESYS;applyLodo|))
                (LETT |c| (SPADCALL |m| (QREFELT $ 65)) . #1#)
                (LETT |cv| (QVSIZE |v|) . #1#)
                (SEQ (LETT |i| 1 . #1#) G190
                     (COND ((|greater_SI| |i| |n|) (GO G191)))
                     (SEQ
                      (LETT |ans|
                            (SPADCALL |ans|
                                      (SPADCALL
                                       (SPADCALL |m| |r| |c| (QREFELT $ 67))
                                       (SPADCALL |v| |cv| (QREFELT $ 29))
                                       (QREFELT $ 30))
                                      (QREFELT $ 55))
                            . #1#)
                      (LETT |c| (- |c| 1) . #1#)
                      (EXIT (LETT |cv| (- |cv| 1) . #1#)))
                     (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))) 

(SDEFUN |ODESYS;applyLodo0|
        ((|m| |Matrix| LO) (|r| |Integer|) (|mm| |Matrix| F) (|c| |Integer|)
         (|n| |NonNegativeInteger|) ($ F))
        (SPROG ((|rr| (|Integer|)) (|cc| (|Integer|)) (|ans| (F)) (|i| NIL))
               (SEQ
                (LETT |ans| (|spadConstant| $ 15) . #1=(|ODESYS;applyLodo0|))
                (LETT |rr| (SPADCALL |mm| (QREFELT $ 88)) . #1#)
                (LETT |cc| (SPADCALL |m| (QREFELT $ 65)) . #1#)
                (SEQ (LETT |i| 1 . #1#) G190
                     (COND ((|greater_SI| |i| |n|) (GO G191)))
                     (SEQ
                      (LETT |ans|
                            (SPADCALL |ans|
                                      (SPADCALL
                                       (SPADCALL |m| |r| |cc| (QREFELT $ 67))
                                       (SPADCALL |mm| |rr| |c| (QREFELT $ 51))
                                       (QREFELT $ 30))
                                      (QREFELT $ 55))
                            . #1#)
                      (LETT |cc| (- |cc| 1) . #1#)
                      (EXIT (LETT |rr| (- |rr| 1) . #1#)))
                     (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))) 

(SDEFUN |ODESYS;triangulate;MVR;10|
        ((|m| |Matrix| LO) (|v| |Vector| F)
         ($ |Record| (|:| |mat| (|Matrix| LO)) (|:| |vec| (|Vector| F))))
        (SPROG
         ((|i| #1=(|Integer|)) (|k1| NIL) (|b| (LO)) (|a| (LO)) (|l| (LO))
          (|k| NIL) (|x| (|Matrix| LO)) (|rown| #2=(|Integer|)) (#3=#:G293 NIL)
          (|j| NIL) (|offset| #2#) (|minr| #1#) (|ncols| (|Integer|))
          (|nrows| (|Integer|)) (|w| (|Vector| F)))
         (SEQ
          (LETT |x| (SPADCALL |m| (QREFELT $ 89))
                . #4=(|ODESYS;triangulate;MVR;10|))
          (LETT |w| (SPADCALL |v| (QREFELT $ 90)) . #4#)
          (LETT |nrows| (SPADCALL |x| (QREFELT $ 58)) . #4#)
          (LETT |ncols| (SPADCALL |x| (QREFELT $ 65)) . #4#)
          (LETT |minr| (LETT |i| 1 . #4#) . #4#)
          (LETT |offset| (- (SPADCALL |w| (QREFELT $ 59)) |minr|) . #4#)
          (SEQ
           (EXIT
            (SEQ (LETT |j| 1 . #4#) G190
                 (COND ((|greater_SI| |j| |ncols|) (GO G191)))
                 (SEQ
                  (COND
                   ((SPADCALL |i| |nrows| (QREFELT $ 70))
                    (PROGN (LETT #3# |$NoValue| . #4#) (GO #5=#:G290))))
                  (LETT |rown| (- |minr| 1) . #4#)
                  (SEQ (LETT |k| |i| . #4#) G190
                       (COND ((> |k| |nrows|) (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL (SPADCALL |x| |k| |j| (QREFELT $ 67))
                                    (|spadConstant| $ 16) (QREFELT $ 87))
                          (COND
                           ((OR (EQL |rown| (- |minr| 1))
                                (<
                                 (SPADCALL
                                  (SPADCALL |x| |k| |j| (QREFELT $ 67))
                                  (QREFELT $ 71))
                                 (SPADCALL
                                  (SPADCALL |x| |rown| |j| (QREFELT $ 67))
                                  (QREFELT $ 71))))
                            (LETT |rown| |k| . #4#)))))
                        (EXIT
                         (COND ((EQL |rown| (- |minr| 1)) "enuf")
                               ('T
                                (SEQ
                                 (LETT |x|
                                       (SPADCALL |x| |i| |rown| (QREFELT $ 91))
                                       . #4#)
                                 (EXIT
                                  (SPADCALL |w| (+ |i| |offset|)
                                            (+ |rown| |offset|)
                                            (QREFELT $ 93))))))))
                       (LETT |k| (+ |k| 1) . #4#) (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |k| (+ |i| 1) . #4#) G190
                       (COND ((> |k| |nrows|) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |x| |k| |j| (QREFELT $ 67))
                                     (|spadConstant| $ 16) (QREFELT $ 87))
                           (SEQ
                            (LETT |l|
                                  (SPADCALL
                                   (SPADCALL |x| |i| |j| (QREFELT $ 67))
                                   (SPADCALL |x| |k| |j| (QREFELT $ 67))
                                   (QREFELT $ 94))
                                  . #4#)
                            (LETT |a|
                                  (SPADCALL |l|
                                            (SPADCALL |x| |i| |j|
                                                      (QREFELT $ 67))
                                            (QREFELT $ 95))
                                  . #4#)
                            (LETT |b|
                                  (SPADCALL |l|
                                            (SPADCALL |x| |k| |j|
                                                      (QREFELT $ 67))
                                            (QREFELT $ 95))
                                  . #4#)
                            (SEQ (LETT |k1| (+ |j| 1) . #4#) G190
                                 (COND ((> |k1| |ncols|) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SPADCALL |x| |k| |k1|
                                             (SPADCALL
                                              (SPADCALL |a|
                                                        (SPADCALL |x| |i| |k1|
                                                                  (QREFELT $
                                                                           67))
                                                        (QREFELT $ 96))
                                              (SPADCALL |b|
                                                        (SPADCALL |x| |k| |k1|
                                                                  (QREFELT $
                                                                           67))
                                                        (QREFELT $ 96))
                                              (QREFELT $ 54))
                                             (QREFELT $ 97))))
                                 (LETT |k1| (+ |k1| 1) . #4#) (GO G190) G191
                                 (EXIT NIL))
                            (SPADCALL |x| |k| |j| (|spadConstant| $ 16)
                                      (QREFELT $ 97))
                            (EXIT
                             (SPADCALL |w| (+ |k| |offset|)
                                       (SPADCALL
                                        (SPADCALL |a|
                                                  (SPADCALL |w|
                                                            (+ |i| |offset|)
                                                            (QREFELT $ 29))
                                                  (QREFELT $ 30))
                                        (SPADCALL |b|
                                                  (SPADCALL |w|
                                                            (+ |k| |offset|)
                                                            (QREFELT $ 29))
                                                  (QREFELT $ 30))
                                        (QREFELT $ 32))
                                       (QREFELT $ 28))))))))
                       (LETT |k| (+ |k| 1) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT (LETT |i| (+ |i| 1) . #4#)))
                 (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL)))
           #5# (EXIT #3#))
          (EXIT (CONS |x| |w|))))) 

(DECLAIM (NOTINLINE |SystemODESolver;|)) 

(DEFUN |SystemODESolver| (&REST #1=#:G294)
  (SPROG NIL
         (PROG (#2=#:G295)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SystemODESolver|)
                                               '|domainEqualList|)
                    . #3=(|SystemODESolver|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SystemODESolver;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SystemODESolver|)))))))))) 

(DEFUN |SystemODESolver;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SystemODESolver|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|SystemODESolver| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 98) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SystemODESolver| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (SPADCALL (QREFELT $ 8)))
          $))) 

(MAKEPROP '|SystemODESolver| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . D)
              '|diff|
              (|Record| (|:| C 12) (|:| |g| 13) (|:| |eq| 7) (|:| |rh| 6))
              (|Record| (|:| A 12) (|:| |eqs| 26)) (|Matrix| 6) (|Vector| 6)
              |ODESYS;triangulate;MVR;2| (4 . |Zero|) (8 . |Zero|) (|Boolean|)
              (12 . ~=) (|NonNegativeInteger|) (|Mapping| 17 6) (|List| 6)
              (18 . |count|) (24 . |One|) (28 . |One|) (|Integer|) (|List| 10)
              (32 . |elt|) (38 . |setelt!|) (45 . |elt|) (51 . |elt|)
              (57 . |setColumn!|) (64 . -) (70 . *) (76 . *)
              (|Record| (|:| |particular| 13) (|:| |basis| 12))
              (|Union| 35 '"failed")
              (|Record| (|:| |particular| 6) (|:| |basis| 21))
              (|Union| 37 '"failed") (|Mapping| 38 7 6) |ODESYS;solve;MVMU;1|
              (|Automorphism| 6) (82 . |One|) (86 . -)
              (|Record| (|:| R 12) (|:| A 12) (|:| |Ainv| 12)) (|Mapping| 6 6)
              (|PseudoLinearNormalForm| 6) (91 . |normalForm|)
              (|Record| (|:| C 12) (|:| |g| 13)) (|List| 48)
              (98 . |companionBlocks|) (104 . |elt|) (111 . |monomial|)
              (117 . +) (123 . -) (129 . +) (135 . *) (|Matrix| 7)
              (141 . |maxRowIndex|) (146 . |minIndex|) (151 . |zero?|)
              (|Vector| 7) (156 . |row|) (|Mapping| 17 7) (162 . |every?|)
              (168 . |maxColIndex|) (173 . ~=) (179 . |elt|)
              (186 . |maxColIndex|) (191 . |setelt!|) (199 . >)
              (205 . |degree|) (210 . >) (216 . |leadingCoefficient|) (221 . /)
              (227 . |column|) (233 . |diagonalMatrix|) (238 . -)
              (|Record| (|:| |mat| 57) (|:| |vec| 13))
              |ODESYS;triangulate;MVR;10| (|Union| 13 '"failed")
              (|Record| (|:| |particular| 80) (|:| |basis| (|List| 13)))
              (|Union| 6 '"failed")
              (|Record| (|:| |particular| 82) (|:| |basis| 21))
              (|Mapping| 83 7 6) |ODESYS;solveInField;MVMR;4|
              (244 . |retractIfCan|) (249 . ~=) (255 . |maxRowIndex|)
              (260 . |copy|) (265 . |copy|) (270 . |swapRows!|) (|Void|)
              (277 . |swap!|) (284 . |rightLcm|) (290 . |rightQuotient|)
              (296 . *) (302 . |setelt!|))
           '#(|triangulate| 310 |solveInField| 322 |solve| 329) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 97
                                                 '(0 7 0 8 0 6 0 15 0 7 0 16 2
                                                   6 17 0 0 18 2 21 19 20 0 22
                                                   0 6 0 23 0 7 0 24 2 26 10 0
                                                   25 27 3 13 6 0 25 6 28 2 13
                                                   6 0 25 29 2 7 6 0 6 30 3 12
                                                   0 0 25 13 31 2 6 0 0 0 32 2
                                                   12 13 0 13 33 2 12 0 0 0 34
                                                   0 41 0 42 1 6 0 0 43 3 46 44
                                                   12 41 45 47 2 46 49 12 13 50
                                                   3 12 6 0 25 25 51 2 7 0 6 19
                                                   52 2 7 0 0 0 53 2 7 0 0 0 54
                                                   2 6 0 0 0 55 2 6 0 0 0 56 1
                                                   57 25 0 58 1 13 25 0 59 1 7
                                                   17 0 60 2 57 61 0 25 62 2 61
                                                   17 63 0 64 1 57 25 0 65 2 25
                                                   17 0 0 66 3 57 7 0 25 25 67
                                                   1 12 25 0 68 4 12 6 0 25 25
                                                   6 69 2 25 17 0 0 70 1 7 19 0
                                                   71 2 19 17 0 0 72 1 7 6 0 73
                                                   2 6 0 0 0 74 2 12 13 0 25 75
                                                   1 57 0 61 76 2 57 0 0 0 77 1
                                                   7 82 0 86 2 7 17 0 0 87 1 12
                                                   25 0 88 1 57 0 0 89 1 13 0 0
                                                   90 3 57 0 0 25 25 91 3 13 92
                                                   0 25 25 93 2 7 0 0 0 94 2 7
                                                   0 0 0 95 2 7 0 0 0 96 4 57 7
                                                   0 25 25 7 97 2 0 78 57 13 79
                                                   2 0 11 12 13 14 3 0 81 57 13
                                                   84 85 3 0 36 12 13 39
                                                   40)))))
           '|lookupComplete|)) 
