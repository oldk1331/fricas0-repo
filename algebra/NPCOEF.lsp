
(SDEFUN |NPCOEF;npcoef;SupLLR;1|
        ((|u| |SparseUnivariatePolynomial| P) (|factlist| |List| BP)
         (|leadlist| |List| P)
         ($ |Record| (|:| |deter| (|List| (|SparseUnivariatePolynomial| P)))
          (|:| |dterm|
               (|List|
                (|List|
                 (|Record| (|:| |expt| (|NonNegativeInteger|))
                           (|:| |pcoef| P)))))
          (|:| |nfacts| (|List| BP)) (|:| |nlead| (|List| P))))
        (SPROG
         ((|detcoef|
           (|List|
            (|List|
             (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))))
          (#1=#:G164 NIL) (|i| NIL)
          (|ltodel| #2=(|List| (|NonNegativeInteger|)))
          (|detufact| (|List| (|SparseUnivariatePolynomial| P)))
          (#3=#:G152 NIL)
          (|uu| (|Union| (|SparseUnivariatePolynomial| P) "failed"))
          (#4=#:G140 NIL) (#5=#:G139 #6=(|SparseUnivariatePolynomial| P))
          (#7=#:G141 #6#) (#8=#:G163 NIL) (|pol| NIL) (|ltochange| #2#)
          (|tablecoef|
           (|List|
            (|Record| (|:| |coefu| P)
                      (|:| |detfacts|
                           (|List|
                            (|List|
                             (|Record| (|:| |expt| (|NonNegativeInteger|))
                                       (|:| |pcoef| P))))))))
          (#9=#:G162 NIL) (|changed| (|Boolean|))
          (|ndet| (|NonNegativeInteger|)) (#10=#:G130 NIL)
          (|nterm|
           #11=(|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))
          (|vexp| #12=(|NonNegativeInteger|))
          (|vpos| #13=(|NonNegativeInteger|))
          (|celtf|
           (|Record| (|:| |valexp| (|NonNegativeInteger|)) (|:| |valcoef| P)
                     (|:| |posit| (|NonNegativeInteger|))))
          (|cf|
           (|Union|
            (|Record| (|:| |valexp| #12#) (|:| |valcoef| P) (|:| |posit| #13#))
            "failed"))
          (|dt| (|NonNegativeInteger|))
          (|lexp| (|List| (|List| (|NonNegativeInteger|)))) (#14=#:G161 NIL)
          (|ep| NIL) (#15=#:G160 NIL) (|ldtcf| (|List| (|List| #11#)))
          (#16=#:G158 NIL) (#17=#:G159 NIL) (|lcu| NIL) (#18=#:G157 NIL)
          (|ulist| (|Vector| P)) (#19=#:G156 NIL) (#20=#:G155 NIL)
          (#21=#:G154 NIL) (|v| NIL) (#22=#:G153 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |detcoef| NIL . #23=(|NPCOEF;npcoef;SupLLR;1|))
                (LETT |detufact| NIL . #23#)
                (LETT |lexp|
                      (PROGN
                       (LETT #22# NIL . #23#)
                       (SEQ (LETT |v| NIL . #23#) (LETT #21# |factlist| . #23#)
                            G190
                            (COND
                             ((OR (ATOM #21#)
                                  (PROGN (LETT |v| (CAR #21#) . #23#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #22# (CONS (|NPCOEF;listexp| |v| $) #22#)
                                    . #23#)))
                            (LETT #21# (CDR #21#) . #23#) (GO G190) G191
                            (EXIT (NREVERSE #22#))))
                      . #23#)
                (LETT |ulist|
                      (SPADCALL
                       (PROGN
                        (LETT #20# NIL . #23#)
                        (SEQ (LETT |i| 0 . #23#)
                             (LETT #19# (SPADCALL |u| (QREFELT $ 13)) . #23#)
                             G190 (COND ((|greater_SI| |i| #19#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #20#
                                     (CONS (SPADCALL |u| |i| (QREFELT $ 14))
                                           #20#)
                                     . #23#)))
                             (LETT |i| (|inc_SI| |i|) . #23#) (GO G190) G191
                             (EXIT (NREVERSE #20#))))
                       (QREFELT $ 17))
                      . #23#)
                (LETT |tablecoef|
                      (|NPCOEF;buildtable| |ulist| |lexp| |leadlist| $) . #23#)
                (LETT |detcoef|
                      (PROGN
                       (LETT #18# NIL . #23#)
                       (SEQ (LETT |lcu| NIL . #23#)
                            (LETT #17# |leadlist| . #23#)
                            (LETT |ep| NIL . #23#) (LETT #16# |lexp| . #23#)
                            G190
                            (COND
                             ((OR (ATOM #16#)
                                  (PROGN (LETT |ep| (CAR #16#) . #23#) NIL)
                                  (ATOM #17#)
                                  (PROGN (LETT |lcu| (CAR #17#) . #23#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #18#
                                    (CONS
                                     (LIST (CONS (|SPADfirst| |ep|) |lcu|))
                                     #18#)
                                    . #23#)))
                            (LETT #16#
                                  (PROG1 (CDR #16#)
                                    (LETT #17# (CDR #17#) . #23#))
                                  . #23#)
                            (GO G190) G191 (EXIT (NREVERSE #18#))))
                      . #23#)
                (LETT |ldtcf| |detcoef| . #23#)
                (LETT |lexp|
                      (PROGN
                       (LETT #15# NIL . #23#)
                       (SEQ (LETT |ep| NIL . #23#) (LETT #14# |lexp| . #23#)
                            G190
                            (COND
                             ((OR (ATOM #14#)
                                  (PROGN (LETT |ep| (CAR #14#) . #23#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT (LETT #15# (CONS (CDR |ep|) #15#) . #23#)))
                            (LETT #14# (CDR #14#) . #23#) (GO G190) G191
                            (EXIT (NREVERSE #15#))))
                      . #23#)
                (LETT |ndet| (LENGTH |factlist|) . #23#)
                (LETT |changed| 'T . #23#) (LETT |ltochange| NIL . #23#)
                (LETT |ltodel| NIL . #23#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND (|changed| (SPADCALL |ndet| 1 (QREFELT $ 21)))
                              ('T 'NIL)))
                       (GO G191)))
                     (SEQ (LETT |changed| 'NIL . #23#)
                          (LETT |dt| (LENGTH |tablecoef|) . #23#)
                          (SEQ (LETT |i| 1 . #23#) G190
                               (COND
                                ((OR (|greater_SI| |i| |dt|)
                                     (NULL (COND (|changed| 'NIL) ('T 'T))))
                                 (GO G191)))
                               (SEQ
                                (LETT |cf|
                                      (|NPCOEF;check|
                                       (SPADCALL |tablecoef| |i|
                                                 (QREFELT $ 26))
                                       |ulist| $)
                                      . #23#)
                                (EXIT
                                 (COND ((QEQCAR |cf| 1) "next i")
                                       ('T
                                        (SEQ
                                         (LETT |ltochange|
                                               (CONS |i| |ltochange|) . #23#)
                                         (LETT |celtf| (QCDR |cf|) . #23#)
                                         (LETT |tablecoef|
                                               (|NPCOEF;modify| |tablecoef|
                                                |celtf| $)
                                               . #23#)
                                         (LETT |vpos| (QVELT |celtf| 2) . #23#)
                                         (LETT |vexp| (QVELT |celtf| 0) . #23#)
                                         (LETT |nterm|
                                               (CONS |vexp| (QVELT |celtf| 1))
                                               . #23#)
                                         (SPADCALL |detcoef| |vpos|
                                                   (CONS |nterm|
                                                         (SPADCALL |detcoef|
                                                                   |vpos|
                                                                   (QREFELT $
                                                                            29)))
                                                   (QREFELT $ 30))
                                         (SPADCALL |lexp| |vpos|
                                                   (SPADCALL
                                                    (SPADCALL |lexp| |vpos|
                                                              (QREFELT $ 33))
                                                    (SPADCALL |vexp|
                                                              (SPADCALL |lexp|
                                                                        |vpos|
                                                                        (QREFELT
                                                                         $ 33))
                                                              (QREFELT $ 34))
                                                    (QREFELT $ 35))
                                                   (QREFELT $ 36))
                                         (COND
                                          ((SPADCALL
                                            (SPADCALL |lexp| |vpos|
                                                      (QREFELT $ 33))
                                            NIL (QREFELT $ 37))
                                           (SEQ
                                            (LETT |ltodel|
                                                  (CONS |vpos| |ltodel|)
                                                  . #23#)
                                            (LETT |ndet|
                                                  (PROG1
                                                      (LETT #10# (- |ndet| 1)
                                                            . #23#)
                                                    (|check_subtype2|
                                                     (>= #10# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #10#))
                                                  . #23#)
                                            (EXIT
                                             (LETT |detufact|
                                                   (CONS
                                                    (|NPCOEF;constructp|
                                                     (SPADCALL |detcoef| |vpos|
                                                               (QREFELT $ 29))
                                                     $)
                                                    |detufact|)
                                                   . #23#)))))
                                         (EXIT (LETT |changed| 'T . #23#)))))))
                               (LETT |i| (|inc_SI| |i|) . #23#) (GO G190) G191
                               (EXIT NIL))
                          (SEQ (LETT |i| NIL . #23#)
                               (LETT #9# |ltochange| . #23#) G190
                               (COND
                                ((OR (ATOM #9#)
                                     (PROGN (LETT |i| (CAR #9#) . #23#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT |tablecoef|
                                       (SPADCALL |tablecoef| |i|
                                                 (QREFELT $ 38))
                                       . #23#)))
                               (LETT #9# (CDR #9#) . #23#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (LETT |ltochange| NIL . #23#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 ((EQL |ndet| 1)
                  (SEQ
                   (LETT |uu|
                         (SPADCALL |u|
                                   (PROGN
                                    (LETT #4# NIL . #23#)
                                    (SEQ (LETT |pol| NIL . #23#)
                                         (LETT #8# |detufact| . #23#) G190
                                         (COND
                                          ((OR (ATOM #8#)
                                               (PROGN
                                                (LETT |pol| (CAR #8#) . #23#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (PROGN
                                            (LETT #7# |pol| . #23#)
                                            (COND
                                             (#4#
                                              (LETT #5#
                                                    (SPADCALL #5# #7#
                                                              (QREFELT $ 39))
                                                    . #23#))
                                             ('T
                                              (PROGN
                                               (LETT #5# #7# . #23#)
                                               (LETT #4# 'T . #23#)))))))
                                         (LETT #8# (CDR #8#) . #23#) (GO G190)
                                         G191 (EXIT NIL))
                                    (COND (#4# #5#)
                                          (#24='T (|spadConstant| $ 40))))
                                   (QREFELT $ 42))
                         . #23#)
                   (EXIT
                    (COND
                     ((QEQCAR |uu| 1)
                      (PROGN
                       (LETT #3# (VECTOR NIL |ldtcf| |factlist| |leadlist|)
                             . #23#)
                       (GO #25=#:G151)))
                     (#24#
                      (LETT |detufact| (CONS (QCDR |uu|) |detufact|)
                            . #23#))))))
                 (#24#
                  (SEQ
                   (LETT |ltodel| (SPADCALL (ELT $ 43) |ltodel| (QREFELT $ 45))
                         . #23#)
                   (EXIT
                    (SEQ (LETT |i| NIL . #23#) (LETT #1# |ltodel| . #23#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |i| (CAR #1#) . #23#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |detcoef|
                                (SPADCALL |detcoef| |i| (QREFELT $ 46)) . #23#)
                          (LETT |factlist|
                                (SPADCALL |factlist| |i| (QREFELT $ 48))
                                . #23#)
                          (EXIT
                           (LETT |leadlist|
                                 (SPADCALL |leadlist| |i| (QREFELT $ 49))
                                 . #23#)))
                         (LETT #1# (CDR #1#) . #23#) (GO G190) G191
                         (EXIT NIL))))))
                (EXIT (VECTOR |detufact| |detcoef| |factlist| |leadlist|))))
          #25# (EXIT #3#)))) 

(SDEFUN |NPCOEF;check|
        ((|tterm| |Record| (|:| |coefu| P)
          (|:| |detfacts|
               #1=(|List|
                   (|List|
                    (|Record| (|:| |expt| (|NonNegativeInteger|))
                              (|:| |pcoef| P))))))
         (|ulist| |Vector| P)
         ($ |Union|
          (|Record| (|:| |valexp| (|NonNegativeInteger|)) (|:| |valcoef| P)
                    (|:| |posit| (|NonNegativeInteger|)))
          "failed"))
        (SPROG
         ((#2=#:G171 NIL) (#3=#:G184 NIL) (|pp| (|Union| P "failed"))
          (|poselt| #4=(|NonNegativeInteger|)) (#5=#:G176 NIL) (|doit| #4#)
          (|cfu| (P)) (|cu1| (P)) (#6=#:G185 NIL) (|elterm| NIL)
          (|vterm|
           (|List|
            (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P))))
          (|termlist| #1#))
         (SEQ (LETT |cfu| (|spadConstant| $ 52) . #7=(|NPCOEF;check|))
              (LETT |doit| 0 . #7#) (LETT |poselt| 0 . #7#)
              (LETT |termlist| (QCDR |tterm|) . #7#) (LETT |vterm| NIL . #7#)
              (EXIT
               (COND
                ((EQL (LENGTH |termlist|) 1)
                 (SEQ
                  (EXIT
                   (SEQ (LETT |vterm| (|SPADfirst| |termlist|) . #7#)
                        (SEQ (LETT |elterm| NIL . #7#) (LETT #6# |vterm| . #7#)
                             G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |elterm| (CAR #6#) . #7#) NIL)
                                   (NULL (< |doit| 2)))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (LETT |cu1| (QCDR |elterm|) . #7#)
                                           (|spadConstant| $ 53)
                                           (QREFELT $ 54))
                                 (LETT |cfu|
                                       (SPADCALL |cu1| |cfu| (QREFELT $ 55))
                                       . #7#))
                                ('T
                                 (SEQ (LETT |doit| (+ |doit| 1) . #7#)
                                      (EXIT
                                       (LETT |poselt|
                                             (PROG1
                                                 (LETT #5#
                                                       (SPADCALL |elterm|
                                                                 |vterm|
                                                                 (QREFELT $
                                                                          56))
                                                       . #7#)
                                               (|check_subtype2| (>= #5# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #5#))
                                             . #7#)))))))
                             (LETT #6# (CDR #6#) . #7#) (GO G190) G191
                             (EXIT NIL))
                        (COND ((EQL |doit| 2) (EXIT (CONS 1 #8="failed")))
                              (#9='T
                               (SEQ
                                (LETT |pp|
                                      (SPADCALL (QCAR |tterm|) |cfu|
                                                (QREFELT $ 57))
                                      . #7#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |pp| 1)
                                   (PROGN
                                    (LETT #3# (CONS 1 #8#) . #7#)
                                    (GO #10=#:G181))))))))
                        (EXIT
                         (CONS 0
                               (VECTOR
                                (QCAR
                                 (SPADCALL |vterm| |poselt| (QREFELT $ 58)))
                                (PROG2 (LETT #2# |pp| . #7#)
                                    (QCDR #2#)
                                  (|check_union2| (QEQCAR #2# 0) (QREFELT $ 10)
                                                  (|Union| (QREFELT $ 10)
                                                           "failed")
                                                  #2#))
                                |poselt|)))))
                  #10# (EXIT #3#)))
                (#9# (CONS 1 "failed"))))))) 

(SDEFUN |NPCOEF;buildvect|
        ((|lvterm| |List|
          (|List|
           (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P))))
         (|n| |NonNegativeInteger|)
         ($ |Vector|
          (|List|
           (|List|
            (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P))))))
        (SPROG
         ((#1=#:G203 NIL) (#2=#:G202 NIL) (|i| NIL)
          (|nexp| (|NonNegativeInteger|)) (#3=#:G201 NIL) (|term| NIL)
          (|ntable|
           #4=(|Vector|
               (|List|
                (|List|
                 (|Record| (|:| |expt| (|NonNegativeInteger|))
                           (|:| |pcoef| P))))))
          (|vtable| #4#) (#5=#:G200 NIL))
         (SEQ (LETT |vtable| (MAKEARR1 |n| NIL) . #6=(|NPCOEF;buildvect|))
              (EXIT
               (COND
                ((EQL (LENGTH |lvterm|) 1)
                 (SEQ
                  (SEQ (LETT |term| NIL . #6#)
                       (LETT #5# (|SPADfirst| |lvterm|) . #6#) G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |term| (CAR #5#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |vtable| (+ (QCAR |term|) 1)
                                   (LIST (LIST |term|)) (QREFELT $ 60))))
                       (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                  (EXIT |vtable|)))
                ('T
                 (SEQ
                  (LETT |vtable| (|NPCOEF;buildvect| (CDR |lvterm|) |n| $)
                        . #6#)
                  (LETT |ntable| (MAKEARR1 |n| NIL) . #6#)
                  (SEQ (LETT |term| NIL . #6#)
                       (LETT #3# (|SPADfirst| |lvterm|) . #6#) G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |term| (CAR #3#) . #6#) NIL))
                         (GO G191)))
                       (SEQ (LETT |nexp| (QCAR |term|) . #6#)
                            (EXIT
                             (SEQ (LETT |i| 1 . #6#) G190
                                  (COND
                                   ((OR (|greater_SI| |i| |n|)
                                        (NULL (< (+ |nexp| |i|) (+ |n| 1))))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |ntable| (+ |nexp| |i|)
                                              (APPEND
                                               (PROGN
                                                (LETT #2# NIL . #6#)
                                                (SEQ (LETT |lvterm| NIL . #6#)
                                                     (LETT #1#
                                                           (SPADCALL |vtable|
                                                                     |i|
                                                                     (QREFELT $
                                                                              61))
                                                           . #6#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #1#)
                                                           (PROGN
                                                            (LETT |lvterm|
                                                                  (CAR #1#)
                                                                  . #6#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #2#
                                                             (CONS
                                                              (CONS |term|
                                                                    |lvterm|)
                                                              #2#)
                                                             . #6#)))
                                                     (LETT #1# (CDR #1#) . #6#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #2#))))
                                               (SPADCALL |ntable|
                                                         (+ |nexp| |i|)
                                                         (QREFELT $ 61)))
                                              (QREFELT $ 60))))
                                  (LETT |i| (|inc_SI| |i|) . #6#) (GO G190)
                                  G191 (EXIT NIL))))
                       (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
                  (EXIT |ntable|)))))))) 

(SDEFUN |NPCOEF;buildtable|
        ((|vu| |Vector| P) (|lvect| |List| (|List| (|NonNegativeInteger|)))
         (|leadlist| |List| P)
         ($ |List|
          (|Record| (|:| |coefu| P)
                    (|:| |detfacts|
                         (|List|
                          (|List|
                           (|Record| (|:| |expt| (|NonNegativeInteger|))
                                     (|:| |pcoef| P))))))))
        (SPROG
         ((|table|
           (|List|
            (|Record| (|:| |coefu| P)
                      (|:| |detfacts|
                           (|List|
                            (|List|
                             (|Record| (|:| |expt| (|NonNegativeInteger|))
                                       (|:| |pcoef| P))))))))
          (|i| NIL)
          (|partialv|
           (|Vector|
            (|List|
             (|List|
              (|Record| (|:| |expt| (|NonNegativeInteger|))
                        (|:| |pcoef| P))))))
          (|prelim|
           (|List|
            (|List|
             (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))))
          (#1=#:G216 NIL) (|e| NIL) (#2=#:G215 NIL) (#3=#:G214 NIL) (|lv| NIL)
          (#4=#:G213 NIL) (|degu| (|NonNegativeInteger|)) (#5=#:G205 NIL)
          (|nfact| (|NonNegativeInteger|)))
         (SEQ (LETT |nfact| (LENGTH |leadlist|) . #6=(|NPCOEF;buildtable|))
              (LETT |table| NIL . #6#)
              (LETT |degu|
                    (PROG1 (LETT #5# (- (QVSIZE |vu|) 1) . #6#)
                      (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #5#))
                    . #6#)
              (LETT |prelim|
                    (PROGN
                     (LETT #4# NIL . #6#)
                     (SEQ (LETT |lv| NIL . #6#) (LETT #3# |lvect| . #6#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |lv| (CAR #3#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (PROGN
                                    (LETT #2# NIL . #6#)
                                    (SEQ (LETT |e| NIL . #6#)
                                         (LETT #1# |lv| . #6#) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |e| (CAR #1#) . #6#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #2#
                                                 (CONS
                                                  (CONS |e|
                                                        (|spadConstant| $ 53))
                                                  #2#)
                                                 . #6#)))
                                         (LETT #1# (CDR #1#) . #6#) (GO G190)
                                         G191 (EXIT (NREVERSE #2#))))
                                   #4#)
                                  . #6#)))
                          (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #6#)
              (SEQ (LETT |i| 1 . #6#) G190
                   (COND ((|greater_SI| |i| |nfact|) (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (RPLACD
                       (|SPADfirst| (SPADCALL |prelim| |i| (QREFELT $ 29)))
                       (SPADCALL |leadlist| |i| (QREFELT $ 62)))
                      (QCDR
                       (|SPADfirst| (SPADCALL |prelim| |i| (QREFELT $ 29)))))))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (LETT |partialv| (MAKEARR1 |nfact| NIL) . #6#)
              (LETT |partialv| (|NPCOEF;buildvect| |prelim| |degu| $) . #6#)
              (SEQ (LETT |i| 1 . #6#) G190
                   (COND ((|greater_SI| |i| |degu|) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |partialv| |i| (QREFELT $ 61)))
                       "next i")
                      ('T
                       (LETT |table|
                             (CONS
                              (CONS (SPADCALL |vu| |i| (QREFELT $ 63))
                                    (SPADCALL |partialv| |i| (QREFELT $ 61)))
                              |table|)
                             . #6#)))))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |table|)))) 

(SDEFUN |NPCOEF;modify|
        ((|tablecoef| |List|
          (|Record| (|:| |coefu| P)
                    (|:| |detfacts|
                         (|List|
                          (|List|
                           (|Record| (|:| |expt| (|NonNegativeInteger|))
                                     (|:| |pcoef| P)))))))
         (|cfter| |Record| (|:| |valexp| (|NonNegativeInteger|))
          (|:| |valcoef| P) (|:| |posit| (|NonNegativeInteger|)))
         ($ |List|
          (|Record| (|:| |coefu| P)
                    (|:| |detfacts|
                         (|List|
                          (|List|
                           (|Record| (|:| |expt| (|NonNegativeInteger|))
                                     (|:| |pcoef| P))))))))
        (SPROG
         ((|lterase| (|List| (|NonNegativeInteger|)))
          (|ctdet|
           (|List|
            (|List|
             (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))))
          (#1=#:G272 NIL) (|i| NIL) (#2=#:G254 NIL) (#3=#:G253 (P))
          (#4=#:G255 (P)) (#5=#:G271 NIL) (|cc| NIL)
          (|k| (|NonNegativeInteger|)) (#6=#:G252 NIL) (#7=#:G246 NIL)
          (#8=#:G245 #9=(|Boolean|)) (#10=#:G247 #9#) (#11=#:G270 NIL)
          (#12=#:G269 NIL) (|celt| NIL) (#13=#:G243 NIL)
          (#14=#:G242 #15=(|NonNegativeInteger|)) (#16=#:G244 #15#)
          (#17=#:G268 NIL) (|term| NIL) (#18=#:G267 NIL) (|cterm| NIL)
          (|cfpos| (|NonNegativeInteger|)) (|cfcoef| (P))
          (|cfexp| (|NonNegativeInteger|)))
         (SEQ (LETT |cfexp| (QVELT |cfter| 0) . #19=(|NPCOEF;modify|))
              (LETT |cfcoef| (QVELT |cfter| 1) . #19#)
              (LETT |cfpos| (QVELT |cfter| 2) . #19#)
              (LETT |lterase| NIL . #19#)
              (SEQ (LETT |cterm| NIL . #19#) (LETT #18# |tablecoef| . #19#)
                   G190
                   (COND
                    ((OR (ATOM #18#)
                         (PROGN (LETT |cterm| (CAR #18#) . #19#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND ((NULL (LETT |ctdet| (QCDR |cterm|) . #19#)) 'NIL)
                             ('T 'T))
                       (COND
                        ((<
                          (PROGN
                           (LETT #13# NIL . #19#)
                           (SEQ (LETT |term| NIL . #19#)
                                (LETT #17# (|SPADfirst| |ctdet|) . #19#) G190
                                (COND
                                 ((OR (ATOM #17#)
                                      (PROGN
                                       (LETT |term| (CAR #17#) . #19#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #16# (QCAR |term|) . #19#)
                                   (COND
                                    (#13# (LETT #14# (+ #14# #16#) . #19#))
                                    ('T
                                     (PROGN
                                      (LETT #14# #16# . #19#)
                                      (LETT #13# 'T . #19#)))))))
                                (LETT #17# (CDR #17#) . #19#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#13# #14#) ('T 0)))
                          |cfexp|)
                         "next term")
                        ('T
                         (SEQ
                          (SEQ (LETT |celt| NIL . #19#)
                               (LETT #12# |ctdet| . #19#) G190
                               (COND
                                ((OR (ATOM #12#)
                                     (PROGN
                                      (LETT |celt| (CAR #12#) . #19#)
                                      NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((EQL
                                    (QCAR
                                     (SPADCALL |celt| |cfpos| (QREFELT $ 58)))
                                    |cfexp|)
                                   (SEQ
                                    (PROGN
                                     (RPLACD
                                      (SPADCALL |celt| |cfpos| (QREFELT $ 58))
                                      |cfcoef|)
                                     (QCDR
                                      (SPADCALL |celt| |cfpos|
                                                (QREFELT $ 58))))
                                    (EXIT
                                     (COND
                                      ((PROGN
                                        (LETT #7# NIL . #19#)
                                        (SEQ (LETT |cc| NIL . #19#)
                                             (LETT #11# |celt| . #19#) G190
                                             (COND
                                              ((OR (ATOM #11#)
                                                   (PROGN
                                                    (LETT |cc| (CAR #11#)
                                                          . #19#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (PROGN
                                                (LETT #10#
                                                      (SPADCALL (QCDR |cc|)
                                                                (|spadConstant|
                                                                 $ 53)
                                                                (QREFELT $ 54))
                                                      . #19#)
                                                (COND
                                                 (#7#
                                                  (LETT #8#
                                                        (COND (#8# #10#)
                                                              ('T 'NIL))
                                                        . #19#))
                                                 ('T
                                                  (PROGN
                                                   (LETT #8# #10# . #19#)
                                                   (LETT #7# 'T . #19#)))))))
                                             (LETT #11# (CDR #11#) . #19#)
                                             (GO G190) G191 (EXIT NIL))
                                        (COND (#7# #8#) ('T 'T)))
                                       (SEQ
                                        (LETT |k|
                                              (PROG1
                                                  (LETT #6#
                                                        (SPADCALL |celt|
                                                                  |ctdet|
                                                                  (QREFELT $
                                                                           64))
                                                        . #19#)
                                                (|check_subtype2| (>= #6# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #6#))
                                              . #19#)
                                        (LETT |lterase| (CONS |k| |lterase|)
                                              . #19#)
                                        (EXIT
                                         (PROGN
                                          (RPLACA |cterm|
                                                  (SPADCALL (QCAR |cterm|)
                                                            (PROGN
                                                             (LETT #2# NIL
                                                                   . #19#)
                                                             (SEQ
                                                              (LETT |cc| NIL
                                                                    . #19#)
                                                              (LETT #5# |celt|
                                                                    . #19#)
                                                              G190
                                                              (COND
                                                               ((OR (ATOM #5#)
                                                                    (PROGN
                                                                     (LETT |cc|
                                                                           (CAR
                                                                            #5#)
                                                                           . #19#)
                                                                     NIL))
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (PROGN
                                                                 (LETT #4#
                                                                       (QCDR
                                                                        |cc|)
                                                                       . #19#)
                                                                 (COND
                                                                  (#2#
                                                                   (LETT #3#
                                                                         (SPADCALL
                                                                          #3#
                                                                          #4#
                                                                          (QREFELT
                                                                           $
                                                                           55))
                                                                         . #19#))
                                                                  ('T
                                                                   (PROGN
                                                                    (LETT #3#
                                                                          #4#
                                                                          . #19#)
                                                                    (LETT #2#
                                                                          'T
                                                                          . #19#)))))))
                                                              (LETT #5#
                                                                    (CDR #5#)
                                                                    . #19#)
                                                              (GO G190) G191
                                                              (EXIT NIL))
                                                             (COND (#2# #3#)
                                                                   ('T
                                                                    (|spadConstant|
                                                                     $ 52))))
                                                            (QREFELT $ 65)))
                                          (QCAR |cterm|))))))))))))
                               (LETT #12# (CDR #12#) . #19#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (COND
                            ((NULL (NULL |lterase|))
                             (SEQ
                              (LETT |lterase|
                                    (SPADCALL (ELT $ 43) |lterase|
                                              (QREFELT $ 45))
                                    . #19#)
                              (SEQ (LETT |i| NIL . #19#)
                                   (LETT #1# |lterase| . #19#) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |i| (CAR #1#) . #19#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |ctdet|
                                           (SPADCALL |ctdet| |i|
                                                     (QREFELT $ 46))
                                           . #19#)))
                                   (LETT #1# (CDR #1#) . #19#) (GO G190) G191
                                   (EXIT NIL))
                              (PROGN (RPLACD |cterm| |ctdet|) (QCDR |cterm|))
                              (EXIT (LETT |lterase| NIL . #19#)))))))))))))
                   (LETT #18# (CDR #18#) . #19#) (GO G190) G191 (EXIT NIL))
              (EXIT |tablecoef|)))) 

(SDEFUN |NPCOEF;listexp| ((|up| BP) ($ |List| (|NonNegativeInteger|)))
        (COND ((EQL (SPADCALL |up| (QREFELT $ 66)) 0) (LIST 0))
              ('T
               (CONS (SPADCALL |up| (QREFELT $ 66))
                     (|NPCOEF;listexp| (SPADCALL |up| (QREFELT $ 67)) $))))) 

(SDEFUN |NPCOEF;constructp|
        ((|lterm| |List|
          (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((#1=#:G276 NIL) (#2=#:G275 #3=(|SparseUnivariatePolynomial| P))
          (#4=#:G277 #3#) (#5=#:G279 NIL) (|term| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|NPCOEF;constructp|))
           (SEQ (LETT |term| NIL . #6#) (LETT #5# |lterm| . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |term| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL (QCDR |term|) (QCAR |term|) (QREFELT $ 68))
                         . #6#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 69)) . #6#))
                    ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 70))))))) 

(DECLAIM (NOTINLINE |NPCoef;|)) 

(DEFUN |NPCoef| (&REST #1=#:G280)
  (SPROG NIL
         (PROG (#2=#:G281)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|NPCoef|)
                                               '|domainEqualList|)
                    . #3=(|NPCoef|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |NPCoef;|) #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|NPCoef|)))))))))) 

(DEFUN |NPCoef;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|NPCoef|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|NPCoef| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 71) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|NPCoef| (LIST DV$1 DV$2 DV$3 DV$4 DV$5)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|NPCoef| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 10)
              (0 . |degree|) (5 . |coefficient|) (|List| 10) (|Vector| 10)
              (11 . |vector|) (16 . |One|) (20 . |One|) (|Boolean|) (24 . ~=)
              (|Record| (|:| |expt| 11) (|:| |pcoef| 10))
              (|Record| (|:| |coefu| 10) (|:| |detfacts| 28)) (|Integer|)
              (|List| 23) (30 . |elt|) (|List| 22) (|List| 27) (36 . |elt|)
              (42 . |setelt!|) (|List| 11) (|List| 31) (49 . |elt|)
              (55 . |position|) (61 . |delete|) (67 . |setelt!|) (74 . =)
              (80 . |delete|) (86 . *) (92 . |One|) (|Union| $ '"failed")
              (96 . |exquo|) (102 . >) (|Mapping| 20 11 11) (108 . |sort|)
              (114 . |delete|) (|List| 6) (120 . |delete|) (126 . |delete|)
              (|Record| (|:| |deter| (|List| 12)) (|:| |dterm| 28)
                        (|:| |nfacts| 47) (|:| |nlead| 15))
              |NPCOEF;npcoef;SupLLR;1| (132 . |One|) (136 . |Zero|) (140 . ~=)
              (146 . *) (152 . |position|) (158 . |exquo|) (164 . |elt|)
              (|Vector| 28) (170 . |setelt!|) (177 . |elt|) (183 . |elt|)
              (189 . |elt|) (195 . |position|) (201 . -) (207 . |degree|)
              (212 . |reductum|) (217 . |monomial|) (223 . +) (229 . |Zero|))
           '#(|npcoef| 233) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 70
                                                 '(1 12 11 0 13 2 12 10 0 11 14
                                                   1 16 0 15 17 0 6 0 18 0 9 0
                                                   19 2 11 20 0 0 21 2 25 23 0
                                                   24 26 2 28 27 0 24 29 3 28
                                                   27 0 24 27 30 2 32 31 0 24
                                                   33 2 31 24 11 0 34 2 31 0 0
                                                   24 35 3 32 31 0 24 31 36 2
                                                   31 20 0 0 37 2 25 0 0 24 38
                                                   2 12 0 0 0 39 0 12 0 40 2 12
                                                   41 0 0 42 2 11 20 0 0 43 2
                                                   31 0 44 0 45 2 28 0 0 24 46
                                                   2 47 0 0 24 48 2 15 0 0 24
                                                   49 0 10 0 52 0 10 0 53 2 10
                                                   20 0 0 54 2 10 0 0 0 55 2 27
                                                   24 22 0 56 2 10 41 0 0 57 2
                                                   27 22 0 24 58 3 59 28 0 24
                                                   28 60 2 59 28 0 24 61 2 15
                                                   10 0 24 62 2 16 10 0 24 63 2
                                                   28 24 27 0 64 2 10 0 0 0 65
                                                   1 6 11 0 66 1 6 0 0 67 2 12
                                                   0 10 11 68 2 12 0 0 0 69 0
                                                   12 0 70 3 0 50 12 47 15
                                                   51)))))
           '|lookupComplete|)) 
