
(/VERSIONCHECK 2) 

(DEFUN |NPCOEF;npcoef;SupLLR;1| (|u| |factlist| |leadlist| $)
  (PROG (|detcoef| #1=#:G186 |i| |ltodel| |detufact| #2=#:G174 |uu| #3=#:G163
         #4=#:G162 #5=#:G164 #6=#:G185 |pol| |ltochange| |tablecoef| #7=#:G184
         |changed| |ndet| #8=#:G153 |nterm| |vexp| |vpos| |celtf| |cf| |dt|
         |lexp| #9=#:G183 |ep| #10=#:G182 |ldtcf| #11=#:G180 #12=#:G181 |lcu|
         #13=#:G179 |ulist| #14=#:G178 #15=#:G177 #16=#:G176 |v| #17=#:G175)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |detcoef| NIL . #18=(|NPCOEF;npcoef;SupLLR;1|))
            (LETT |detufact| NIL . #18#)
            (LETT |lexp|
                  (PROGN
                   (LETT #17# NIL . #18#)
                   (SEQ (LETT |v| NIL . #18#) (LETT #16# |factlist| . #18#)
                        G190
                        (COND
                         ((OR (ATOM #16#)
                              (PROGN (LETT |v| (CAR #16#) . #18#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #17# (CONS (|NPCOEF;listexp| |v| $) #17#)
                                . #18#)))
                        (LETT #16# (CDR #16#) . #18#) (GO G190) G191
                        (EXIT (NREVERSE #17#))))
                  . #18#)
            (LETT |ulist|
                  (SPADCALL
                   (PROGN
                    (LETT #15# NIL . #18#)
                    (SEQ (LETT |i| 0 . #18#)
                         (LETT #14# (SPADCALL |u| (QREFELT $ 13)) . #18#) G190
                         (COND ((|greater_SI| |i| #14#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #15#
                                 (CONS (SPADCALL |u| |i| (QREFELT $ 14)) #15#)
                                 . #18#)))
                         (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191
                         (EXIT (NREVERSE #15#))))
                   (QREFELT $ 17))
                  . #18#)
            (LETT |tablecoef| (|NPCOEF;buildtable| |ulist| |lexp| |leadlist| $)
                  . #18#)
            (LETT |detcoef|
                  (PROGN
                   (LETT #13# NIL . #18#)
                   (SEQ (LETT |lcu| NIL . #18#) (LETT #12# |leadlist| . #18#)
                        (LETT |ep| NIL . #18#) (LETT #11# |lexp| . #18#) G190
                        (COND
                         ((OR (ATOM #11#)
                              (PROGN (LETT |ep| (CAR #11#) . #18#) NIL)
                              (ATOM #12#)
                              (PROGN (LETT |lcu| (CAR #12#) . #18#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #13#
                                (CONS (LIST (CONS (|SPADfirst| |ep|) |lcu|))
                                      #13#)
                                . #18#)))
                        (LETT #11#
                              (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #18#))
                              . #18#)
                        (GO G190) G191 (EXIT (NREVERSE #13#))))
                  . #18#)
            (LETT |ldtcf| |detcoef| . #18#)
            (LETT |lexp|
                  (PROGN
                   (LETT #10# NIL . #18#)
                   (SEQ (LETT |ep| NIL . #18#) (LETT #9# |lexp| . #18#) G190
                        (COND
                         ((OR (ATOM #9#)
                              (PROGN (LETT |ep| (CAR #9#) . #18#) NIL))
                          (GO G191)))
                        (SEQ (EXIT (LETT #10# (CONS (CDR |ep|) #10#) . #18#)))
                        (LETT #9# (CDR #9#) . #18#) (GO G190) G191
                        (EXIT (NREVERSE #10#))))
                  . #18#)
            (LETT |ndet| (LENGTH |factlist|) . #18#) (LETT |changed| 'T . #18#)
            (LETT |ltochange| NIL . #18#) (LETT |ltodel| NIL . #18#)
            (SEQ G190
                 (COND
                  ((NULL
                    (COND (|changed| (SPADCALL |ndet| 1 (QREFELT $ 21)))
                          ('T 'NIL)))
                   (GO G191)))
                 (SEQ (LETT |changed| 'NIL . #18#)
                      (LETT |dt| (LENGTH |tablecoef|) . #18#)
                      (SEQ (LETT |i| 1 . #18#) G190
                           (COND
                            ((OR (|greater_SI| |i| |dt|)
                                 (NULL (COND (|changed| 'NIL) ('T 'T))))
                             (GO G191)))
                           (SEQ
                            (LETT |cf|
                                  (|NPCOEF;check|
                                   (SPADCALL |tablecoef| |i| (QREFELT $ 26))
                                   |ulist| $)
                                  . #18#)
                            (EXIT
                             (COND ((QEQCAR |cf| 1) "next i")
                                   ('T
                                    (SEQ
                                     (LETT |ltochange| (CONS |i| |ltochange|)
                                           . #18#)
                                     (LETT |celtf| (QCDR |cf|) . #18#)
                                     (LETT |tablecoef|
                                           (|NPCOEF;modify| |tablecoef| |celtf|
                                            $)
                                           . #18#)
                                     (LETT |vpos| (QVELT |celtf| 2) . #18#)
                                     (LETT |vexp| (QVELT |celtf| 0) . #18#)
                                     (LETT |nterm|
                                           (CONS |vexp| (QVELT |celtf| 1))
                                           . #18#)
                                     (SPADCALL |detcoef| |vpos|
                                               (CONS |nterm|
                                                     (SPADCALL |detcoef| |vpos|
                                                               (QREFELT $ 29)))
                                               (QREFELT $ 30))
                                     (SPADCALL |lexp| |vpos|
                                               (SPADCALL
                                                (SPADCALL |lexp| |vpos|
                                                          (QREFELT $ 33))
                                                (SPADCALL |vexp|
                                                          (SPADCALL |lexp|
                                                                    |vpos|
                                                                    (QREFELT $
                                                                             33))
                                                          (QREFELT $ 34))
                                                (QREFELT $ 35))
                                               (QREFELT $ 36))
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL |lexp| |vpos| (QREFELT $ 33))
                                        NIL (QREFELT $ 37))
                                       (SEQ
                                        (LETT |ltodel| (CONS |vpos| |ltodel|)
                                              . #18#)
                                        (LETT |ndet|
                                              (PROG1
                                                  (LETT #8# (- |ndet| 1)
                                                        . #18#)
                                                (|check_subtype| (>= #8# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #8#))
                                              . #18#)
                                        (EXIT
                                         (LETT |detufact|
                                               (CONS
                                                (|NPCOEF;constructp|
                                                 (SPADCALL |detcoef| |vpos|
                                                           (QREFELT $ 29))
                                                 $)
                                                |detufact|)
                                               . #18#)))))
                                     (EXIT (LETT |changed| 'T . #18#)))))))
                           (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191
                           (EXIT NIL))
                      (SEQ (LETT |i| NIL . #18#) (LETT #7# |ltochange| . #18#)
                           G190
                           (COND
                            ((OR (ATOM #7#)
                                 (PROGN (LETT |i| (CAR #7#) . #18#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |tablecoef|
                                   (SPADCALL |tablecoef| |i| (QREFELT $ 38))
                                   . #18#)))
                           (LETT #7# (CDR #7#) . #18#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (LETT |ltochange| NIL . #18#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (COND
             ((EQL |ndet| 1)
              (SEQ
               (LETT |uu|
                     (SPADCALL |u|
                               (PROGN
                                (LETT #3# NIL . #18#)
                                (SEQ (LETT |pol| NIL . #18#)
                                     (LETT #6# |detufact| . #18#) G190
                                     (COND
                                      ((OR (ATOM #6#)
                                           (PROGN
                                            (LETT |pol| (CAR #6#) . #18#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #5# |pol| . #18#)
                                        (COND
                                         (#3#
                                          (LETT #4#
                                                (SPADCALL #4# #5#
                                                          (QREFELT $ 39))
                                                . #18#))
                                         ('T
                                          (PROGN
                                           (LETT #4# #5# . #18#)
                                           (LETT #3# 'T . #18#)))))))
                                     (LETT #6# (CDR #6#) . #18#) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#3# #4#)
                                      (#19='T (|spadConstant| $ 40))))
                               (QREFELT $ 42))
                     . #18#)
               (EXIT
                (COND
                 ((QEQCAR |uu| 1)
                  (PROGN
                   (LETT #2# (VECTOR NIL |ldtcf| |factlist| |leadlist|) . #18#)
                   (GO #2#)))
                 (#19#
                  (LETT |detufact| (CONS (QCDR |uu|) |detufact|) . #18#))))))
             (#19#
              (SEQ
               (LETT |ltodel| (SPADCALL (ELT $ 43) |ltodel| (QREFELT $ 45))
                     . #18#)
               (EXIT
                (SEQ (LETT |i| NIL . #18#) (LETT #1# |ltodel| . #18#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #18#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |detcoef| (SPADCALL |detcoef| |i| (QREFELT $ 46))
                            . #18#)
                      (LETT |factlist| (SPADCALL |factlist| |i| (QREFELT $ 48))
                            . #18#)
                      (EXIT
                       (LETT |leadlist|
                             (SPADCALL |leadlist| |i| (QREFELT $ 49)) . #18#)))
                     (LETT #1# (CDR #1#) . #18#) (GO G190) G191 (EXIT NIL))))))
            (EXIT (VECTOR |detufact| |detcoef| |factlist| |leadlist|))))
      #2# (EXIT #2#))))) 

(DEFUN |NPCOEF;check| (|tterm| |ulist| $)
  (PROG (#1=#:G193 #2=#:G203 |pp| |poselt| #3=#:G198 |doit| |cfu| |cu1|
         #4=#:G206 |elterm| |vterm| |termlist|)
    (RETURN
     (SEQ (LETT |cfu| (|spadConstant| $ 52) . #5=(|NPCOEF;check|))
          (LETT |doit| 0 . #5#) (LETT |poselt| 0 . #5#)
          (LETT |termlist| (QCDR |tterm|) . #5#) (LETT |vterm| NIL . #5#)
          (EXIT
           (COND
            ((EQL (LENGTH |termlist|) 1)
             (SEQ
              (EXIT
               (SEQ (LETT |vterm| (|SPADfirst| |termlist|) . #5#)
                    (SEQ (LETT |elterm| NIL . #5#) (LETT #4# |vterm| . #5#)
                         G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |elterm| (CAR #4#) . #5#) NIL)
                               (NULL (< |doit| 2)))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (LETT |cu1| (QCDR |elterm|) . #5#)
                                       (|spadConstant| $ 53) (QREFELT $ 54))
                             (LETT |cfu| (SPADCALL |cu1| |cfu| (QREFELT $ 55))
                                   . #5#))
                            ('T
                             (SEQ (LETT |doit| (+ |doit| 1) . #5#)
                                  (EXIT
                                   (LETT |poselt|
                                         (PROG1
                                             (LETT #3#
                                                   (SPADCALL |elterm| |vterm|
                                                             (QREFELT $ 56))
                                                   . #5#)
                                           (|check_subtype| (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            #3#))
                                         . #5#)))))))
                         (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                    (COND ((EQL |doit| 2) (EXIT (CONS 1 #6="failed")))
                          (#7='T
                           (SEQ
                            (LETT |pp|
                                  (SPADCALL (QCAR |tterm|) |cfu|
                                            (QREFELT $ 57))
                                  . #5#)
                            (EXIT
                             (COND
                              ((QEQCAR |pp| 1)
                               (PROGN
                                (LETT #2# (CONS 1 #6#) . #5#)
                                (GO #2#))))))))
                    (EXIT
                     (CONS 0
                           (VECTOR
                            (QCAR (SPADCALL |vterm| |poselt| (QREFELT $ 58)))
                            (PROG2 (LETT #1# |pp| . #5#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0) (QREFELT $ 10)
                                             #1#))
                            |poselt|)))))
              #2# (EXIT #2#)))
            (#7# (CONS 1 "failed")))))))) 

(DEFUN |NPCOEF;buildvect| (|lvterm| |n| $)
  (PROG (#1=#:G224 #2=#:G223 |i| |nexp| #3=#:G222 |term| |ntable| |vtable|
         #4=#:G221)
    (RETURN
     (SEQ (LETT |vtable| (MAKEARR1 |n| NIL) . #5=(|NPCOEF;buildvect|))
          (EXIT
           (COND
            ((EQL (LENGTH |lvterm|) 1)
             (SEQ
              (SEQ (LETT |term| NIL . #5#)
                   (LETT #4# (|SPADfirst| |lvterm|) . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |term| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |vtable| (+ (QCAR |term|) 1)
                               (LIST (LIST |term|)) (QREFELT $ 60))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |vtable|)))
            ('T
             (SEQ
              (LETT |vtable| (|NPCOEF;buildvect| (CDR |lvterm|) |n| $) . #5#)
              (LETT |ntable| (MAKEARR1 |n| NIL) . #5#)
              (SEQ (LETT |term| NIL . #5#)
                   (LETT #3# (|SPADfirst| |lvterm|) . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |term| (CAR #3#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |nexp| (QCAR |term|) . #5#)
                        (EXIT
                         (SEQ (LETT |i| 1 . #5#) G190
                              (COND
                               ((OR (|greater_SI| |i| |n|)
                                    (NULL (< (+ |nexp| |i|) (+ |n| 1))))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (SPADCALL |ntable| (+ |nexp| |i|)
                                          (APPEND
                                           (PROGN
                                            (LETT #2# NIL . #5#)
                                            (SEQ (LETT |lvterm| NIL . #5#)
                                                 (LETT #1#
                                                       (SPADCALL |vtable| |i|
                                                                 (QREFELT $
                                                                          61))
                                                       . #5#)
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #1#)
                                                       (PROGN
                                                        (LETT |lvterm|
                                                              (CAR #1#) . #5#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #2#
                                                         (CONS
                                                          (CONS |term|
                                                                |lvterm|)
                                                          #2#)
                                                         . #5#)))
                                                 (LETT #1# (CDR #1#) . #5#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #2#))))
                                           (SPADCALL |ntable| (+ |nexp| |i|)
                                                     (QREFELT $ 61)))
                                          (QREFELT $ 60))))
                              (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |ntable|))))))))) 

(DEFUN |NPCOEF;buildtable| (|vu| |lvect| |leadlist| $)
  (PROG (|table| |i| |partialv| |prelim| #1=#:G237 |e| #2=#:G236 #3=#:G235 |lv|
         #4=#:G234 |degu| #5=#:G226 |nfact|)
    (RETURN
     (SEQ (LETT |nfact| (LENGTH |leadlist|) . #6=(|NPCOEF;buildtable|))
          (LETT |table| NIL . #6#)
          (LETT |degu|
                (PROG1 (LETT #5# (- (QVSIZE |vu|) 1) . #6#)
                  (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                . #6#)
          (LETT |prelim|
                (PROGN
                 (LETT #4# NIL . #6#)
                 (SEQ (LETT |lv| NIL . #6#) (LETT #3# |lvect| . #6#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |lv| (CAR #3#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL . #6#)
                                (SEQ (LETT |e| NIL . #6#) (LETT #1# |lv| . #6#)
                                     G190
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
                                              (CONS |e| (|spadConstant| $ 53))
                                              #2#)
                                             . #6#)))
                                     (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
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
                  (RPLACD (|SPADfirst| (SPADCALL |prelim| |i| (QREFELT $ 29)))
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
                  ((NULL (SPADCALL |partialv| |i| (QREFELT $ 61))) "next i")
                  ('T
                   (LETT |table|
                         (CONS
                          (CONS (SPADCALL |vu| |i| (QREFELT $ 63))
                                (SPADCALL |partialv| |i| (QREFELT $ 61)))
                          |table|)
                         . #6#)))))
               (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT |table|))))) 

(DEFUN |NPCOEF;modify| (|tablecoef| |cfter| $)
  (PROG (|lterase| |ctdet| #1=#:G293 |i| #2=#:G275 #3=#:G274 #4=#:G276
         #5=#:G292 |cc| |k| #6=#:G273 #7=#:G267 #8=#:G266 #9=#:G268 #10=#:G291
         #11=#:G290 |celt| #12=#:G264 #13=#:G263 #14=#:G265 #15=#:G289 |term|
         #16=#:G288 |cterm| |cfpos| |cfcoef| |cfexp|)
    (RETURN
     (SEQ (LETT |cfexp| (QVELT |cfter| 0) . #17=(|NPCOEF;modify|))
          (LETT |cfcoef| (QVELT |cfter| 1) . #17#)
          (LETT |cfpos| (QVELT |cfter| 2) . #17#) (LETT |lterase| NIL . #17#)
          (SEQ (LETT |cterm| NIL . #17#) (LETT #16# |tablecoef| . #17#) G190
               (COND
                ((OR (ATOM #16#) (PROGN (LETT |cterm| (CAR #16#) . #17#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((COND ((NULL (LETT |ctdet| (QCDR |cterm|) . #17#)) 'NIL)
                         ('T 'T))
                   (COND
                    ((<
                      (PROGN
                       (LETT #12# NIL . #17#)
                       (SEQ (LETT |term| NIL . #17#)
                            (LETT #15# (|SPADfirst| |ctdet|) . #17#) G190
                            (COND
                             ((OR (ATOM #15#)
                                  (PROGN (LETT |term| (CAR #15#) . #17#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #14# (QCAR |term|) . #17#)
                               (COND (#12# (LETT #13# (+ #13# #14#) . #17#))
                                     ('T
                                      (PROGN
                                       (LETT #13# #14# . #17#)
                                       (LETT #12# 'T . #17#)))))))
                            (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#12# #13#) ('T 0)))
                      |cfexp|)
                     "next term")
                    ('T
                     (SEQ
                      (SEQ (LETT |celt| NIL . #17#) (LETT #11# |ctdet| . #17#)
                           G190
                           (COND
                            ((OR (ATOM #11#)
                                 (PROGN (LETT |celt| (CAR #11#) . #17#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((EQL
                                (QCAR (SPADCALL |celt| |cfpos| (QREFELT $ 58)))
                                |cfexp|)
                               (SEQ
                                (PROGN
                                 (RPLACD
                                  (SPADCALL |celt| |cfpos| (QREFELT $ 58))
                                  |cfcoef|)
                                 (QCDR
                                  (SPADCALL |celt| |cfpos| (QREFELT $ 58))))
                                (EXIT
                                 (COND
                                  ((PROGN
                                    (LETT #7# NIL . #17#)
                                    (SEQ (LETT |cc| NIL . #17#)
                                         (LETT #10# |celt| . #17#) G190
                                         (COND
                                          ((OR (ATOM #10#)
                                               (PROGN
                                                (LETT |cc| (CAR #10#) . #17#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (PROGN
                                            (LETT #9#
                                                  (SPADCALL (QCDR |cc|)
                                                            (|spadConstant| $
                                                                            53)
                                                            (QREFELT $ 54))
                                                  . #17#)
                                            (COND
                                             (#7#
                                              (LETT #8#
                                                    (COND (#8# #9#) ('T 'NIL))
                                                    . #17#))
                                             ('T
                                              (PROGN
                                               (LETT #8# #9# . #17#)
                                               (LETT #7# 'T . #17#)))))))
                                         (LETT #10# (CDR #10#) . #17#)
                                         (GO G190) G191 (EXIT NIL))
                                    (COND (#7# #8#) ('T 'T)))
                                   (SEQ
                                    (LETT |k|
                                          (PROG1
                                              (LETT #6#
                                                    (SPADCALL |celt| |ctdet|
                                                              (QREFELT $ 64))
                                                    . #17#)
                                            (|check_subtype| (>= #6# 0)
                                                             '(|NonNegativeInteger|)
                                                             #6#))
                                          . #17#)
                                    (LETT |lterase| (CONS |k| |lterase|)
                                          . #17#)
                                    (EXIT
                                     (PROGN
                                      (RPLACA |cterm|
                                              (SPADCALL (QCAR |cterm|)
                                                        (PROGN
                                                         (LETT #2# NIL . #17#)
                                                         (SEQ
                                                          (LETT |cc| NIL
                                                                . #17#)
                                                          (LETT #5# |celt|
                                                                . #17#)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #5#)
                                                                (PROGN
                                                                 (LETT |cc|
                                                                       (CAR
                                                                        #5#)
                                                                       . #17#)
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (PROGN
                                                             (LETT #4#
                                                                   (QCDR |cc|)
                                                                   . #17#)
                                                             (COND
                                                              (#2#
                                                               (LETT #3#
                                                                     (SPADCALL
                                                                      #3# #4#
                                                                      (QREFELT
                                                                       $ 55))
                                                                     . #17#))
                                                              ('T
                                                               (PROGN
                                                                (LETT #3# #4#
                                                                      . #17#)
                                                                (LETT #2# 'T
                                                                      . #17#)))))))
                                                          (LETT #5# (CDR #5#)
                                                                . #17#)
                                                          (GO G190) G191
                                                          (EXIT NIL))
                                                         (COND (#2# #3#)
                                                               ('T
                                                                (|spadConstant|
                                                                 $ 52))))
                                                        (QREFELT $ 65)))
                                      (QCAR |cterm|))))))))))))
                           (LETT #11# (CDR #11#) . #17#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL (NULL |lterase|))
                         (SEQ
                          (LETT |lterase|
                                (SPADCALL (ELT $ 43) |lterase| (QREFELT $ 45))
                                . #17#)
                          (SEQ (LETT |i| NIL . #17#)
                               (LETT #1# |lterase| . #17#) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |i| (CAR #1#) . #17#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT |ctdet|
                                       (SPADCALL |ctdet| |i| (QREFELT $ 46))
                                       . #17#)))
                               (LETT #1# (CDR #1#) . #17#) (GO G190) G191
                               (EXIT NIL))
                          (PROGN (RPLACD |cterm| |ctdet|) (QCDR |cterm|))
                          (EXIT (LETT |lterase| NIL . #17#)))))))))))))
               (LETT #16# (CDR #16#) . #17#) (GO G190) G191 (EXIT NIL))
          (EXIT |tablecoef|))))) 

(DEFUN |NPCOEF;listexp| (|up| $)
  (COND ((EQL (SPADCALL |up| (QREFELT $ 66)) 0) (LIST 0))
        ('T
         (CONS (SPADCALL |up| (QREFELT $ 66))
               (|NPCOEF;listexp| (SPADCALL |up| (QREFELT $ 67)) $))))) 

(DEFUN |NPCOEF;constructp| (|lterm| $)
  (PROG (#1=#:G297 #2=#:G296 #3=#:G298 #4=#:G300 |term|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|NPCOEF;constructp|))
       (SEQ (LETT |term| NIL . #5#) (LETT #4# |lterm| . #5#) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |term| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3# (SPADCALL (QCDR |term|) (QCAR |term|) (QREFELT $ 68))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 69)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 70)))))))) 

(DECLAIM (NOTINLINE |NPCoef;|)) 

(DEFUN |NPCoef| (&REST #1=#:G301)
  (PROG ()
    (RETURN
     (PROG (#2=#:G302)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache| '|NPCoef|)
                                           '|domainEqualList|)
                . #3=(|NPCoef|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |NPCoef;|) #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|NPCoef|))))))))))) 

(DEFUN |NPCoef;| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
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
      $)))) 

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
              (42 . |setelt|) (|List| 11) (|List| 31) (49 . |elt|)
              (55 . |position|) (61 . |delete|) (67 . |setelt|) (74 . =)
              (80 . |delete|) (86 . *) (92 . |One|) (|Union| $ '"failed")
              (96 . |exquo|) (102 . >) (|Mapping| 20 11 11) (108 . |sort|)
              (114 . |delete|) (|List| 6) (120 . |delete|) (126 . |delete|)
              (|Record| (|:| |deter| (|List| 12)) (|:| |dterm| 28)
                        (|:| |nfacts| 47) (|:| |nlead| 15))
              |NPCOEF;npcoef;SupLLR;1| (132 . |One|) (136 . |Zero|) (140 . ~=)
              (146 . *) (152 . |position|) (158 . |exquo|) (164 . |elt|)
              (|Vector| 28) (170 . |setelt|) (177 . |elt|) (183 . |elt|)
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
