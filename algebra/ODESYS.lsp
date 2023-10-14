
(/VERSIONCHECK 2) 

(DEFUN |ODESYS;solve;MVMU;1| (|mm| |v| |solve| $)
  (PROG (|k| |l| |m| |solVec| #1=#:G175 |s| |nn| |er| |i| #2=#:G174 |sol|
         |SolMatrix| #3=#:G173 |part| |n| |sols| #4=#:G171 |u| #5=#:G172 |e|
         |rec|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |rec| (SPADCALL |mm| |v| (QREFELT $ 14))
              . #6=(|ODESYS;solve;MVMU;1|))
        (LETT |sols| NIL . #6#)
        (SEQ (LETT |e| NIL . #6#) (LETT #5# (QCDR |rec|) . #6#) G190
             (COND
              ((OR (ATOM #5#) (PROGN (LETT |e| (CAR #5#) . #6#) NIL))
               (GO G191)))
             (SEQ
              (LETT |u| (SPADCALL (QVELT |e| 2) (QVELT |e| 3) |solve|) . #6#)
              (EXIT
               (COND
                ((QEQCAR |u| 1)
                 (PROGN (LETT #4# (CONS 1 "failed") . #6#) (GO #4#)))
                ('T (LETT |sols| (CONS (QCDR |u|) |sols|) . #6#)))))
             (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
        (LETT |n| (QVSIZE (QCAR |rec|)) . #6#) (LETT |k| 0 . #6#)
        (LETT |i| 0 . #6#) (LETT |m| 0 . #6#)
        (LETT |part| (MAKEARR1 |n| (|spadConstant| $ 15)) . #6#)
        (SEQ (LETT |sol| NIL . #6#) (LETT #3# |sols| . #6#) G190
             (COND
              ((OR (ATOM #3#) (PROGN (LETT |sol| (CAR #3#) . #6#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT |m|
                     (+ |m|
                        (SPADCALL (CONS #'|ODESYS;solve;MVMU;1!0| $)
                                  (QCDR |sol|) (QREFELT $ 22)))
                     . #6#)))
             (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
        (LETT |SolMatrix|
              (SPADCALL |n| |m| (|spadConstant| $ 15) (QREFELT $ 23)) . #6#)
        (LETT |m| 0 . #6#)
        (SEQ (LETT |sol| NIL . #6#) (LETT #2# (NREVERSE |sols|) . #6#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |sol| (CAR #2#) . #6#) NIL))
               (GO G191)))
             (SEQ (LETT |i| (+ |i| 1) . #6#)
                  (LETT |er| (SPADCALL (QCDR |rec|) |i| (QREFELT $ 28)) . #6#)
                  (LETT |nn| (QVSIZE (QVELT |er| 1)) . #6#)
                  (SEQ (LETT |s| NIL . #6#) (LETT #1# (QCDR |sol|) . #6#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |solVec| (MAKEARR1 |n| (|spadConstant| $ 15))
                              . #6#)
                        (SPADCALL |solVec| (+ |k| 1) |s| (QREFELT $ 29))
                        (SEQ (LETT |l| 2 . #6#) G190
                             (COND ((|greater_SI| |l| |nn|) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |solVec| (+ |k| |l|)
                                         (SPADCALL (QREFELT $ 9)
                                                   (SPADCALL |solVec|
                                                             (- (+ |k| |l|) 1)
                                                             (QREFELT $ 30))
                                                   (QREFELT $ 31))
                                         (QREFELT $ 29))))
                             (LETT |l| (|inc_SI| |l|) . #6#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |m| (+ |m| 1) . #6#)
                        (EXIT
                         (SPADCALL |SolMatrix| |m| |solVec| (QREFELT $ 32))))
                       (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
                  (SPADCALL |part| (+ |k| 1) (QCAR |sol|) (QREFELT $ 29))
                  (SEQ (LETT |l| 2 . #6#) G190
                       (COND ((|greater_SI| |l| |nn|) (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |part| (+ |k| |l|)
                                   (SPADCALL
                                    (SPADCALL (QREFELT $ 9)
                                              (SPADCALL |part|
                                                        (- (+ |k| |l|) 1)
                                                        (QREFELT $ 30))
                                              (QREFELT $ 31))
                                    (SPADCALL (QVELT |er| 1) (- |l| 1)
                                              (QREFELT $ 30))
                                    (QREFELT $ 33))
                                   (QREFELT $ 29))))
                       (LETT |l| (|inc_SI| |l|) . #6#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (LETT |k| (+ |k| |nn|) . #6#)))
             (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (CONS 0
               (CONS (SPADCALL (QCAR |rec|) |part| (QREFELT $ 34))
                     (SPADCALL (QCAR |rec|) |SolMatrix| (QREFELT $ 35)))))))
      #4# (EXIT #4#))))) 

(DEFUN |ODESYS;solve;MVMU;1!0| (|f1| $)
  (SPADCALL |f1| (|spadConstant| $ 15) (QREFELT $ 18))) 

(DEFUN |ODESYS;triangulate;MVR;2| (|m| |v| $)
  (PROG (|k| |ler| |h0| |j| #1=#:G190 |sum| |op| #2=#:G189 |n| #3=#:G188 |er|
         |l| |rat|)
    (RETURN
     (SEQ (LETT |k| 0 . #4=(|ODESYS;triangulate;MVR;2|))
          (LETT |rat|
                (SPADCALL |m| (|spadConstant| $ 43)
                          (CONS #'|ODESYS;triangulate;MVR;2!0|
                                (VECTOR $ (QREFELT $ 9)))
                          (QREFELT $ 48))
                . #4#)
          (LETT |l|
                (SPADCALL (QVELT |rat| 0)
                          (SPADCALL (QVELT |rat| 2) |v| (QREFELT $ 34))
                          (QREFELT $ 51))
                . #4#)
          (LETT |ler| NIL . #4#)
          (SEQ (LETT |er| NIL . #4#) (LETT #3# |l| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |er| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |n| (QVSIZE (QCAR |er|)) . #4#)
                    (LETT |op| (|spadConstant| $ 16) . #4#)
                    (SEQ (LETT |j| 0 . #4#) (LETT #2# (- |n| 1) . #4#) G190
                         (COND ((|greater_SI| |j| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |op|
                                 (SPADCALL |op|
                                           (SPADCALL
                                            (SPADCALL (QCAR |er|) |n| (+ |j| 1)
                                                      (QREFELT $ 52))
                                            |j| (QREFELT $ 53))
                                           (QREFELT $ 54))
                                 . #4#)))
                         (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |op|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 24) |n| (QREFELT $ 53))
                           |op| (QREFELT $ 55))
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
                                                          (QREFELT $ 30))
                                                (QREFELT $ 31))
                                      (SPADCALL (QCDR |er|) |j| (QREFELT $ 30))
                                      (QREFELT $ 56))
                                     (QREFELT $ 29))))
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
                                                      (QREFELT $ 52))
                                            (SPADCALL |sum| |j| (QREFELT $ 30))
                                            (QREFELT $ 57))
                                           (QREFELT $ 33))
                                 . #4#)))
                         (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |h0|
                          (SPADCALL
                           (SPADCALL |h0|
                                     (SPADCALL (QREFELT $ 9)
                                               (SPADCALL |sum| |n|
                                                         (QREFELT $ 30))
                                               (QREFELT $ 31))
                                     (QREFELT $ 56))
                           (SPADCALL (QCDR |er|) |n| (QREFELT $ 30))
                           (QREFELT $ 56))
                          . #4#)
                    (LETT |ler|
                          (CONS (VECTOR (QCAR |er|) (QCDR |er|) |op| |h0|)
                                |ler|)
                          . #4#)
                    (EXIT (LETT |k| (+ |k| |n|) . #4#)))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS (QVELT |rat| 1) |ler|)))))) 

(DEFUN |ODESYS;triangulate;MVR;2!0| (|f1| $$)
  (PROG (|diff| $)
    (LETT |diff| (QREFELT $$ 1) . #1=(|ODESYS;triangulate;MVR;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |diff| |f1| (QREFELT $ 31)) (QREFELT $ 44)))))) 

(DEFUN |ODESYS;backsolve| (|m| |v| |solve| $)
  (PROG (|bas| #1=#:G219 |i| #2=#:G218 |n| #3=#:G217 |a| |eq| |c| |r| #4=#:G215
         #5=#:G216 |b| |hom| #6=#:G197 |part| |part?| |u| |dim| #7=#:G195 |rec|
         |offset| |mr|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |m| (QREFELT $ 59)) . #8=(|ODESYS;backsolve|))
          (LETT |offset| (- (SPADCALL |v| (QREFELT $ 60)) (LETT |mr| 1 . #8#))
                . #8#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((>= |r| |mr|)
                    (SPADCALL (ELT $ 61) (SPADCALL |m| |r| (QREFELT $ 63))
                              (QREFELT $ 65)))
                   ('T 'NIL)))
                 (GO G191)))
               (SEQ (EXIT (LETT |r| (- |r| 1) . #8#))) NIL (GO G190) G191
               (EXIT NIL))
          (EXIT
           (COND ((< |r| |mr|) (|error| "backsolve: system has a 0 matrix"))
                 ((SPADCALL (LETT |c| (|ODESYS;firstnonzero| |m| |r| $) . #8#)
                            (SPADCALL |m| (QREFELT $ 66)) (QREFELT $ 67))
                  (|error| "backsolve: undetermined system"))
                 (#9='T
                  (SEQ
                   (LETT |rec|
                         (SPADCALL (SPADCALL |m| |r| |c| (QREFELT $ 68))
                                   (SPADCALL |v| (+ |r| |offset|)
                                             (QREFELT $ 30))
                                   |solve|)
                         . #8#)
                   (LETT |dim|
                         (PROG1 (LETT #7# (+ (- |r| |mr|) 1) . #8#)
                           (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|)
                                            #7#))
                         . #8#)
                   (SEQ
                    (LETT |part?| (QEQCAR (LETT |u| (QCAR |rec|) . #8#) 0)
                          . #8#)
                    (EXIT
                     (COND
                      (|part?|
                       (SEQ
                        (LETT |part| (MAKEARR1 |dim| (|spadConstant| $ 15))
                              . #8#)
                        (EXIT
                         (SPADCALL |part| (+ |r| |offset|)
                                   (PROG2 (LETT #6# |u| . #8#)
                                       (QCDR #6#)
                                     (|check_union| (QEQCAR #6# 0)
                                                    (QREFELT $ 6) #6#))
                                   (QREFELT $ 29))))))))
                   (LETT |hom|
                         (SPADCALL |dim| (LENGTH (QCDR |rec|))
                                   (|spadConstant| $ 15) (QREFELT $ 23))
                         . #8#)
                   (SEQ (LETT |b| NIL . #8#) (LETT #5# (QCDR |rec|) . #8#)
                        (LETT |i| 1 . #8#)
                        (LETT #4# (SPADCALL |hom| (QREFELT $ 69)) . #8#) G190
                        (COND
                         ((OR (|greater_SI| |i| #4#) (ATOM #5#)
                              (PROGN (LETT |b| (CAR #5#) . #8#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT (SPADCALL |hom| |r| |i| |b| (QREFELT $ 70))))
                        (LETT |i|
                              (PROG1 (|inc_SI| |i|) (LETT #5# (CDR #5#) . #8#))
                              . #8#)
                        (GO G190) G191 (EXIT NIL))
                   (LETT |n| 1 . #8#)
                   (SEQ G190
                        (COND
                         ((NULL (SPADCALL |r| |mr| (QREFELT $ 71))) (GO G191)))
                        (SEQ (LETT |r| (- |r| 1) . #8#)
                             (LETT |c| (- |c| 1) . #8#)
                             (EXIT
                              (COND
                               ((SPADCALL (|ODESYS;firstnonzero| |m| |r| $) |c|
                                          (QREFELT $ 67))
                                (|error| "backsolve: undetermined system"))
                               ((SPADCALL
                                 (SPADCALL
                                  (LETT |eq|
                                        (SPADCALL |m| |r| |c| (QREFELT $ 68))
                                        . #8#)
                                  (QREFELT $ 72))
                                 0 (QREFELT $ 73))
                                (|error| "backsolve: pivot of order > 0"))
                               ('T
                                (SEQ
                                 (LETT |a| (SPADCALL |eq| (QREFELT $ 74))
                                       . #8#)
                                 (COND
                                  (|part?|
                                   (SPADCALL |part| (+ |r| |offset|)
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |v| (+ |r| |offset|)
                                                         (QREFELT $ 30))
                                               (|ODESYS;applyLodo| |m| |r|
                                                |part| |n| $)
                                               (QREFELT $ 33))
                                              |a| (QREFELT $ 75))
                                             (QREFELT $ 29))))
                                 (SEQ (LETT |i| 1 . #8#)
                                      (LETT #3# (SPADCALL |hom| (QREFELT $ 69))
                                            . #8#)
                                      G190
                                      (COND ((|greater_SI| |i| #3#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL |hom| |r| |i|
                                                  (SPADCALL
                                                   (|ODESYS;applyLodo0| |m| |r|
                                                    |hom| |i| |n| $)
                                                   (QREFELT $ 44))
                                                  (QREFELT $ 70))))
                                      (LETT |i| (|inc_SI| |i|) . #8#) (GO G190)
                                      G191 (EXIT NIL))
                                 (EXIT (LETT |n| (+ |n| 1) . #8#)))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (LETT |bas|
                         (PROGN
                          (LETT #2# NIL . #8#)
                          (SEQ (LETT |i| 1 . #8#)
                               (LETT #1# (SPADCALL |hom| (QREFELT $ 69)) . #8#)
                               G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS
                                        (SPADCALL |hom| |i| (QREFELT $ 76))
                                        #2#)
                                       . #8#)))
                               (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         . #8#)
                   (EXIT
                    (COND (|part?| (CONS (CONS 0 |part|) |bas|))
                          (#9# (CONS (CONS 1 "failed") |bas|)))))))))))) 

(DEFUN |ODESYS;solveInField;MVMR;4| (|m| |v| |solve| $)
  (PROG (|rec| #1=#:G246 #2=#:G260 |i| #3=#:G259 |rc| |uu| |u| #4=#:G257
         #5=#:G258 |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((EQL (LETT |n| (QVSIZE |m|) . #6=(|ODESYS;solveInField;MVMR;4|))
               (SPADCALL |m| (QREFELT $ 77)))
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
                    (QREFELT $ 78))
                   |m| (QREFELT $ 79))
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
                                      (CONS #'|ODESYS;solveInField;MVMR;4!0|
                                            (VECTOR $ |solve|))
                                      (QREFELT $ 41))
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
                                                      (SPADCALL (QCDR |rc|)
                                                                (QREFELT $ 80))
                                                      . #6#)
                                                G190
                                                (COND
                                                 ((|greater_SI| |i| #2#)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #3#
                                                        (CONS
                                                         (SPADCALL (QCDR |rc|)
                                                                   |i|
                                                                   (QREFELT $
                                                                            76))
                                                         #3#)
                                                        . #6#)))
                                                (LETT |i| (|inc_SI| |i|) . #6#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #3#)))))))))))
                     . #6#)
               (GO #1#))))))))
        (LETT |rec| (SPADCALL |m| |v| (QREFELT $ 82)) . #6#)
        (EXIT (|ODESYS;backsolve| (QCAR |rec|) (QCDR |rec|) |solve| $))))
      #1# (EXIT #1#))))) 

(DEFUN |ODESYS;solveInField;MVMR;4!0| (|l1| |f2| $$)
  (PROG (|solve| $)
    (LETT |solve| (QREFELT $$ 1) . #1=(|ODESYS;solveInField;MVMR;4|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|ODESYS;FSL2USL| (SPADCALL |l1| |f2| |solve|) $))))) 

(DEFUN |ODESYS;M2F| (|m| $)
  (PROG (#1=#:G271 |u| #2=#:G273 |j| #3=#:G272 |i| |mf|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |mf|
              (SPADCALL (QVSIZE |m|) (SPADCALL |m| (QREFELT $ 77))
                        (|spadConstant| $ 15) (QREFELT $ 23))
              . #4=(|ODESYS;M2F|))
        (SEQ (LETT |i| 1 . #4#) (LETT #3# (SPADCALL |m| (QREFELT $ 59)) . #4#)
             G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| 1 . #4#)
                    (LETT #2# (SPADCALL |m| (QREFELT $ 66)) . #4#) G190
                    (COND ((|greater_SI| |j| #2#) (GO G191)))
                    (SEQ
                     (LETT |u|
                           (SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 68))
                                     (QREFELT $ 89))
                           . #4#)
                     (EXIT
                      (COND
                       ((QEQCAR |u| 1)
                        (PROGN (LETT #1# (CONS 1 "failed") . #4#) (GO #1#)))
                       ('T
                        (SPADCALL |mf| |i| |j| (QCDR |u|) (QREFELT $ 70))))))
                    (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                    (EXIT NIL))))
             (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |mf|))))
      #1# (EXIT #1#))))) 

(DEFUN |ODESYS;FSL2USL| (|rec| $)
  (PROG (#1=#:G280)
    (RETURN
     (COND ((QEQCAR (QCAR |rec|) 1) (CONS 1 "failed"))
           ('T
            (CONS 0
                  (CONS
                   (PROG2 (LETT #1# (QCAR |rec|) |ODESYS;FSL2USL|)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                   (QCDR |rec|)))))))) 

(DEFUN |ODESYS;firstnonzero| (|m| |r| $)
  (PROG (#1=#:G285 #2=#:G287 #3=#:G288 |c|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |c| 1 . #4=(|ODESYS;firstnonzero|))
               (LETT #3# (SPADCALL |m| (QREFELT $ 66)) . #4#) G190
               (COND ((|greater_SI| |c| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |m| |r| |c| (QREFELT $ 68))
                             (|spadConstant| $ 16) (QREFELT $ 90))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# |c| . #4#) (GO #2#)) . #4#)
                    (GO #1#))))))
               (LETT |c| (|inc_SI| |c|) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (|error| "firstnonzero: zero row"))))
      #2# (EXIT #2#))))) 

(DEFUN |ODESYS;applyLodo| (|m| |r| |v| |n| $)
  (PROG (|cv| |c| |ans| |i|)
    (RETURN
     (SEQ (LETT |ans| (|spadConstant| $ 15) . #1=(|ODESYS;applyLodo|))
          (LETT |c| (SPADCALL |m| (QREFELT $ 66)) . #1#)
          (LETT |cv| (QVSIZE |v|) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ
                (LETT |ans|
                      (SPADCALL |ans|
                                (SPADCALL (SPADCALL |m| |r| |c| (QREFELT $ 68))
                                          (SPADCALL |v| |cv| (QREFELT $ 30))
                                          (QREFELT $ 31))
                                (QREFELT $ 56))
                      . #1#)
                (LETT |c| (- |c| 1) . #1#) (EXIT (LETT |cv| (- |cv| 1) . #1#)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |ODESYS;applyLodo0| (|m| |r| |mm| |c| |n| $)
  (PROG (|rr| |cc| |ans| |i|)
    (RETURN
     (SEQ (LETT |ans| (|spadConstant| $ 15) . #1=(|ODESYS;applyLodo0|))
          (LETT |rr| (SPADCALL |mm| (QREFELT $ 91)) . #1#)
          (LETT |cc| (SPADCALL |m| (QREFELT $ 66)) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ
                (LETT |ans|
                      (SPADCALL |ans|
                                (SPADCALL
                                 (SPADCALL |m| |r| |cc| (QREFELT $ 68))
                                 (SPADCALL |mm| |rr| |c| (QREFELT $ 52))
                                 (QREFELT $ 31))
                                (QREFELT $ 56))
                      . #1#)
                (LETT |cc| (- |cc| 1) . #1#)
                (EXIT (LETT |rr| (- |rr| 1) . #1#)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |ODESYS;triangulate;MVR;10| (|m| |v| $)
  (PROG (|i| |k1| |b| |a| |l| |k| |x| |rown| #1=#:G308 |j| |offset| |minr|
         |ncols| |nrows| |w|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL |m| (QREFELT $ 92))
            . #2=(|ODESYS;triangulate;MVR;10|))
      (LETT |w| (SPADCALL |v| (QREFELT $ 93)) . #2#)
      (LETT |nrows| (SPADCALL |x| (QREFELT $ 59)) . #2#)
      (LETT |ncols| (SPADCALL |x| (QREFELT $ 66)) . #2#)
      (LETT |minr| (LETT |i| 1 . #2#) . #2#)
      (LETT |offset| (- (SPADCALL |w| (QREFELT $ 60)) |minr|) . #2#)
      (SEQ
       (EXIT
        (SEQ (LETT |j| 1 . #2#) G190
             (COND ((|greater_SI| |j| |ncols|) (GO G191)))
             (SEQ
              (COND
               ((SPADCALL |i| |nrows| (QREFELT $ 71))
                (PROGN (LETT #1# |$NoValue| . #2#) (GO #1#))))
              (LETT |rown| (- |minr| 1) . #2#)
              (SEQ (LETT |k| |i| . #2#) G190 (COND ((> |k| |nrows|) (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |x| |k| |j| (QREFELT $ 68))
                                (|spadConstant| $ 16) (QREFELT $ 90))
                      (COND
                       ((OR (EQL |rown| (- |minr| 1))
                            (<
                             (SPADCALL (SPADCALL |x| |k| |j| (QREFELT $ 68))
                                       (QREFELT $ 72))
                             (SPADCALL (SPADCALL |x| |rown| |j| (QREFELT $ 68))
                                       (QREFELT $ 72))))
                        (LETT |rown| |k| . #2#)))))
                    (EXIT
                     (COND ((EQL |rown| (- |minr| 1)) "enuf")
                           ('T
                            (SEQ
                             (LETT |x| (SPADCALL |x| |i| |rown| (QREFELT $ 94))
                                   . #2#)
                             (EXIT
                              (SPADCALL |w| (+ |i| |offset|)
                                        (+ |rown| |offset|)
                                        (QREFELT $ 96))))))))
                   (LETT |k| (+ |k| 1) . #2#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |k| (+ |i| 1) . #2#) G190
                   (COND ((> |k| |nrows|) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |x| |k| |j| (QREFELT $ 68))
                                 (|spadConstant| $ 16) (QREFELT $ 90))
                       (SEQ
                        (LETT |l|
                              (SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 68))
                                        (SPADCALL |x| |k| |j| (QREFELT $ 68))
                                        (QREFELT $ 97))
                              . #2#)
                        (LETT |a|
                              (SPADCALL |l|
                                        (SPADCALL |x| |i| |j| (QREFELT $ 68))
                                        (QREFELT $ 98))
                              . #2#)
                        (LETT |b|
                              (SPADCALL |l|
                                        (SPADCALL |x| |k| |j| (QREFELT $ 68))
                                        (QREFELT $ 98))
                              . #2#)
                        (SEQ (LETT |k1| (+ |j| 1) . #2#) G190
                             (COND ((> |k1| |ncols|) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |x| |k| |k1|
                                         (SPADCALL
                                          (SPADCALL |a|
                                                    (SPADCALL |x| |i| |k1|
                                                              (QREFELT $ 68))
                                                    (QREFELT $ 99))
                                          (SPADCALL |b|
                                                    (SPADCALL |x| |k| |k1|
                                                              (QREFELT $ 68))
                                                    (QREFELT $ 99))
                                          (QREFELT $ 55))
                                         (QREFELT $ 100))))
                             (LETT |k1| (+ |k1| 1) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (SPADCALL |x| |k| |j| (|spadConstant| $ 16)
                                  (QREFELT $ 100))
                        (EXIT
                         (SPADCALL |w| (+ |k| |offset|)
                                   (SPADCALL
                                    (SPADCALL |a|
                                              (SPADCALL |w| (+ |i| |offset|)
                                                        (QREFELT $ 30))
                                              (QREFELT $ 31))
                                    (SPADCALL |b|
                                              (SPADCALL |w| (+ |k| |offset|)
                                                        (QREFELT $ 30))
                                              (QREFELT $ 31))
                                    (QREFELT $ 33))
                                   (QREFELT $ 29))))))))
                   (LETT |k| (+ |k| 1) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (LETT |i| (+ |i| 1) . #2#)))
             (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191 (EXIT NIL)))
       #1# (EXIT #1#))
      (EXIT (CONS |x| |w|)))))) 

(DECLAIM (NOTINLINE |SystemODESolver;|)) 

(DEFUN |SystemODESolver| (&REST #1=#:G311)
  (PROG ()
    (RETURN
     (PROG (#2=#:G312)
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
             ((NOT #2#) (HREM |$ConstructorCache| '|SystemODESolver|))))))))))) 

(DEFUN |SystemODESolver;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SystemODESolver|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|SystemODESolver| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 101) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SystemODESolver| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (SPADCALL (QREFELT $ 8)))
      $)))) 

(MAKEPROP '|SystemODESolver| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . D)
              '|diff|
              (|Record| (|:| C 12) (|:| |g| 13) (|:| |eq| 7) (|:| |rh| 6))
              (|Record| (|:| A 12) (|:| |eqs| 27)) (|Matrix| 6) (|Vector| 6)
              |ODESYS;triangulate;MVR;2| (4 . |Zero|) (8 . |Zero|) (|Boolean|)
              (12 . ~=) (|NonNegativeInteger|) (|Mapping| 17 6) (|List| 6)
              (18 . |count|) (24 . |new|) (31 . |One|) (35 . |One|) (|Integer|)
              (|List| 10) (39 . |elt|) (45 . |setelt|) (52 . |elt|)
              (58 . |elt|) (64 . |setColumn!|) (71 . -) (77 . *) (83 . *)
              (|Record| (|:| |particular| 13) (|:| |basis| 12))
              (|Union| 36 '"failed")
              (|Record| (|:| |particular| 6) (|:| |basis| 21))
              (|Union| 38 '"failed") (|Mapping| 39 7 6) |ODESYS;solve;MVMU;1|
              (|Automorphism| 6) (89 . |One|) (93 . -)
              (|Record| (|:| R 12) (|:| A 12) (|:| |Ainv| 12)) (|Mapping| 6 6)
              (|PseudoLinearNormalForm| 6) (98 . |normalForm|)
              (|Record| (|:| C 12) (|:| |g| 13)) (|List| 49)
              (105 . |companionBlocks|) (111 . |elt|) (118 . |monomial|)
              (124 . +) (130 . -) (136 . +) (142 . *) (|Matrix| 7)
              (148 . |maxRowIndex|) (153 . |minIndex|) (158 . |zero?|)
              (|Vector| 7) (163 . |row|) (|Mapping| 17 7) (169 . |every?|)
              (175 . |maxColIndex|) (180 . ~=) (186 . |elt|)
              (193 . |maxColIndex|) (198 . |setelt|) (206 . >) (212 . |degree|)
              (217 . >) (223 . |leadingCoefficient|) (228 . /) (234 . |column|)
              (240 . |ncols|) (245 . |diagonalMatrix|) (250 . -)
              (256 . |ncols|) (|Record| (|:| |mat| 58) (|:| |vec| 13))
              |ODESYS;triangulate;MVR;10| (|Union| 13 '"failed")
              (|Record| (|:| |particular| 83) (|:| |basis| (|List| 13)))
              (|Union| 6 '"failed")
              (|Record| (|:| |particular| 85) (|:| |basis| 21))
              (|Mapping| 86 7 6) |ODESYS;solveInField;MVMR;4|
              (261 . |retractIfCan|) (266 . ~=) (272 . |maxRowIndex|)
              (277 . |copy|) (282 . |copy|) (287 . |swapRows!|) (|Void|)
              (294 . |swap!|) (301 . |rightLcm|) (307 . |rightQuotient|)
              (313 . *) (319 . |setelt|))
           '#(|triangulate| 327 |solveInField| 339 |solve| 346) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 100
                                                 '(0 7 0 8 0 6 0 15 0 7 0 16 2
                                                   6 17 0 0 18 2 21 19 20 0 22
                                                   3 12 0 19 19 6 23 0 6 0 24 0
                                                   7 0 25 2 27 10 0 26 28 3 13
                                                   6 0 26 6 29 2 13 6 0 26 30 2
                                                   7 6 0 6 31 3 12 0 0 26 13 32
                                                   2 6 0 0 0 33 2 12 13 0 13 34
                                                   2 12 0 0 0 35 0 42 0 43 1 6
                                                   0 0 44 3 47 45 12 42 46 48 2
                                                   47 50 12 13 51 3 12 6 0 26
                                                   26 52 2 7 0 6 19 53 2 7 0 0
                                                   0 54 2 7 0 0 0 55 2 6 0 0 0
                                                   56 2 6 0 0 0 57 1 58 26 0 59
                                                   1 13 26 0 60 1 7 17 0 61 2
                                                   58 62 0 26 63 2 62 17 64 0
                                                   65 1 58 26 0 66 2 26 17 0 0
                                                   67 3 58 7 0 26 26 68 1 12 26
                                                   0 69 4 12 6 0 26 26 6 70 2
                                                   26 17 0 0 71 1 7 19 0 72 2
                                                   19 17 0 0 73 1 7 6 0 74 2 6
                                                   0 0 0 75 2 12 13 0 26 76 1
                                                   58 19 0 77 1 58 0 62 78 2 58
                                                   0 0 0 79 1 12 19 0 80 1 7 85
                                                   0 89 2 7 17 0 0 90 1 12 26 0
                                                   91 1 58 0 0 92 1 13 0 0 93 3
                                                   58 0 0 26 26 94 3 13 95 0 26
                                                   26 96 2 7 0 0 0 97 2 7 0 0 0
                                                   98 2 7 0 0 0 99 4 58 7 0 26
                                                   26 7 100 2 0 81 58 13 82 2 0
                                                   11 12 13 14 3 0 84 58 13 87
                                                   88 3 0 37 12 13 40 41)))))
           '|lookupComplete|)) 
