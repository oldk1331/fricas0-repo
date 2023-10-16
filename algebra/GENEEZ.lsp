
(SDEFUN |GENEEZ;compBound;BPLNni;1|
        ((|m| BP) (|listpolys| |List| BP) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G129 NIL) (|normprod| #2=(|NonNegativeInteger|))
          (#3=#:G124 NIL) (#4=#:G123 #2#) (#5=#:G125 #2#) (#6=#:G127 NIL)
          (#7=#:G139 NIL) (|g| NIL) (#8=#:G140 NIL) (|df| NIL)
          (|nm| #9=(|NonNegativeInteger|)) (#10=#:G121 NIL) (#11=#:G120 #9#)
          (#12=#:G122 #9#) (#13=#:G138 NIL) (|u| NIL) (|normlist| (|List| #9#))
          (#14=#:G117 NIL) (#15=#:G116 #9#) (#16=#:G118 #9#) (#17=#:G137 NIL)
          (#18=#:G136 NIL) (|f| NIL) (#19=#:G135 NIL)
          (|n| #20=(|NonNegativeInteger|)) (#21=#:G114 NIL) (#22=#:G113 #20#)
          (#23=#:G115 #20#) (#24=#:G134 NIL) (|ldeg| (|List| #20#))
          (#25=#:G133 NIL) (#26=#:G132 NIL))
         (SEQ
          (LETT |ldeg|
                (PROGN
                 (LETT #26# NIL)
                 (SEQ (LETT |f| NIL) (LETT #25# |listpolys|) G190
                      (COND
                       ((OR (ATOM #25#) (PROGN (LETT |f| (CAR #25#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #26# (CONS (SPADCALL |f| (QREFELT $ 9)) #26#))))
                      (LETT #25# (CDR #25#)) (GO G190) G191
                      (EXIT (NREVERSE #26#)))))
          (LETT |n|
                (PROGN
                 (LETT #21# NIL)
                 (SEQ (LETT |df| NIL) (LETT #24# |ldeg|) G190
                      (COND
                       ((OR (ATOM #24#) (PROGN (LETT |df| (CAR #24#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #23# |df|)
                         (COND (#21# (LETT #22# (+ #22# #23#)))
                               ('T (PROGN (LETT #22# #23#) (LETT #21# 'T)))))))
                      (LETT #24# (CDR #24#)) (GO G190) G191 (EXIT NIL))
                 (COND (#21# #22#) (#27='T 0))))
          (LETT |normlist|
                (PROGN
                 (LETT #19# NIL)
                 (SEQ (LETT |f| NIL) (LETT #18# |listpolys|) G190
                      (COND
                       ((OR (ATOM #18#) (PROGN (LETT |f| (CAR #18#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #19#
                              (CONS
                               (PROGN
                                (LETT #14# NIL)
                                (SEQ (LETT |u| NIL)
                                     (LETT #17# (SPADCALL |f| (QREFELT $ 11)))
                                     G190
                                     (COND
                                      ((OR (ATOM #17#)
                                           (PROGN (LETT |u| (CAR #17#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #16#
                                              (SPADCALL
                                               (SPADCALL |u| (QREFELT $ 12)) 2
                                               (QREFELT $ 14)))
                                        (COND (#14# (LETT #15# (+ #15# #16#)))
                                              ('T
                                               (PROGN
                                                (LETT #15# #16#)
                                                (LETT #14# 'T)))))))
                                     (LETT #17# (CDR #17#)) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#14# #15#) ('T 0)))
                               #19#))))
                      (LETT #18# (CDR #18#)) (GO G190) G191
                      (EXIT (NREVERSE #19#)))))
          (LETT |nm|
                (PROGN
                 (LETT #10# NIL)
                 (SEQ (LETT |u| NIL) (LETT #13# (SPADCALL |m| (QREFELT $ 11)))
                      G190
                      (COND
                       ((OR (ATOM #13#) (PROGN (LETT |u| (CAR #13#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #12#
                               (SPADCALL (SPADCALL |u| (QREFELT $ 12)) 2
                                         (QREFELT $ 14)))
                         (COND (#10# (LETT #11# (+ #11# #12#)))
                               ('T (PROGN (LETT #11# #12#) (LETT #10# 'T)))))))
                      (LETT #13# (CDR #13#)) (GO G190) G191 (EXIT NIL))
                 (COND (#10# #11#) (#27# 0))))
          (LETT |normprod|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |df| NIL) (LETT #8# |ldeg|) (LETT |g| NIL)
                      (LETT #7# |normlist|) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |g| (CAR #7#)) NIL)
                            (ATOM #8#) (PROGN (LETT |df| (CAR #8#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #5#
                               (EXPT |g|
                                     (PROG1 (LETT #6# (- |n| |df|))
                                       (|check_subtype2| (>= #6# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #6#))))
                         (COND (#3# (LETT #4# (* #4# #5#)))
                               ('T (PROGN (LETT #4# #5#) (LETT #3# 'T)))))))
                      (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#))))
                      (GO G190) G191 (EXIT NIL))
                 (COND (#3# #4#) (#27# 1))))
          (EXIT
           (SPADCALL 2
                     (PROG1
                         (LETT #1#
                               (SPADCALL (* |normprod| |nm|) (QREFELT $ 17)))
                       (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #1#))
                     (QREFELT $ 18)))))) 

(SDEFUN |GENEEZ;compBound;BPLNni;2|
        ((|m| BP) (|listpolys| |List| BP) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G145 NIL) (#2=#:G144 #3=(|NonNegativeInteger|)) (#4=#:G146 #3#)
          (#5=#:G148 NIL) (#6=#:G147 #3#) (#7=#:G149 #3#) (#8=#:G153 NIL)
          (|u| NIL) (#9=#:G152 NIL) (|p| NIL) (#10=#:G142 NIL) (#11=#:G141 #3#)
          (#12=#:G143 #3#) (#13=#:G151 NIL))
         (SEQ
          (+
           (PROGN
            (LETT #10# NIL)
            (SEQ (LETT |u| NIL) (LETT #13# (SPADCALL |m| (QREFELT $ 11))) G190
                 (COND
                  ((OR (ATOM #13#) (PROGN (LETT |u| (CAR #13#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #12# (SPADCALL |u| (QREFELT $ 12)))
                    (COND (#10# (LETT #11# (MAX #11# #12#)))
                          ('T (PROGN (LETT #11# #12#) (LETT #10# 'T)))))))
                 (LETT #13# (CDR #13#)) (GO G190) G191 (EXIT NIL))
            (COND (#10# #11#) (#14='T (|IdentityError| '|max|))))
           (PROGN
            (LETT #1# NIL)
            (SEQ (LETT |p| NIL) (LETT #9# |listpolys|) G190
                 (COND
                  ((OR (ATOM #9#) (PROGN (LETT |p| (CAR #9#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #4#
                          (PROGN
                           (LETT #5# NIL)
                           (SEQ (LETT |u| NIL)
                                (LETT #8# (SPADCALL |p| (QREFELT $ 11))) G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN (LETT |u| (CAR #8#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #7# (SPADCALL |u| (QREFELT $ 12)))
                                   (COND (#5# (LETT #6# (MAX #6# #7#)))
                                         ('T
                                          (PROGN
                                           (LETT #6# #7#)
                                           (LETT #5# 'T)))))))
                                (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                           (COND (#5# #6#) ('T (|IdentityError| '|max|)))))
                    (COND (#1# (LETT #2# (+ #2# #4#)))
                          ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                 (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) (#14# 0))))))) 

(PUT '|GENEEZ;compBound;BPLNni;3| '|SPADreplace|
     '(XLAM (|m| |listpolys|)
       (|error|
        "attempt to use compBound without a well-understood valuation"))) 

(SDEFUN |GENEEZ;compBound;BPLNni;3|
        ((|m| BP) (|listpolys| |List| BP) ($ |NonNegativeInteger|))
        (|error|
         "attempt to use compBound without a well-understood valuation")) 

(SDEFUN |GENEEZ;reduction;BPRBP;4| ((|u| BP) (|p| R) ($ BP))
        (SPROG NIL
               (COND ((SPADCALL |p| (|spadConstant| $ 21) (QREFELT $ 24)) |u|)
                     ('T
                      (SPADCALL
                       (CONS #'|GENEEZ;reduction;BPRBP;4!0| (VECTOR $ |p|)) |u|
                       (QREFELT $ 27)))))) 

(SDEFUN |GENEEZ;reduction;BPRBP;4!0| ((|x| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |p| (QREFELT $ 25)))))) 

(SDEFUN |GENEEZ;reduction;BPRBP;5| ((|u| BP) (|p| R) ($ BP))
        (SPROG NIL
               (COND ((SPADCALL |p| (|spadConstant| $ 21) (QREFELT $ 24)) |u|)
                     ('T
                      (SPADCALL
                       (CONS #'|GENEEZ;reduction;BPRBP;5!0| (VECTOR $ |p|)) |u|
                       (QREFELT $ 27)))))) 

(SDEFUN |GENEEZ;reduction;BPRBP;5!0| ((|x| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |p| (QREFELT $ 29)))))) 

(SDEFUN |GENEEZ;merge| ((|p| R) (|q| R) ($ |Union| R "failed"))
        (COND ((SPADCALL |p| |q| (QREFELT $ 24)) (CONS 0 |p|))
              ((SPADCALL |p| (|spadConstant| $ 21) (QREFELT $ 24))
               (CONS 0 |q|))
              ((SPADCALL |q| (|spadConstant| $ 21) (QREFELT $ 24))
               (CONS 0 |p|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |GENEEZ;modInverse| ((|c| R) (|p| R) ($ R))
        (SPROG ((#1=#:G165 NIL))
               (QCAR
                (PROG2
                    (LETT #1#
                          (SPADCALL |c| |p| (|spadConstant| $ 30)
                                    (QREFELT $ 34)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|Record| (|:| |coef1| (QREFELT $ 6))
                                            (|:| |coef2| (QREFELT $ 6)))
                                  (|Union|
                                   (|Record| (|:| |coef1| (QREFELT $ 6))
                                             (|:| |coef2| (QREFELT $ 6)))
                                   "failed")
                                  #1#))))) 

(SDEFUN |GENEEZ;exactquo| ((|u| BP) (|v| BP) (|p| R) ($ |Union| BP "failed"))
        (SPROG
         ((|r| (|Record| (|:| |quotient| BP) (|:| |remainder| BP)))
          (|invlcv| (R)))
         (SEQ
          (LETT |invlcv|
                (|GENEEZ;modInverse| (SPADCALL |v| (QREFELT $ 35)) |p| $))
          (LETT |r|
                (SPADCALL |u|
                          (SPADCALL (SPADCALL |invlcv| |v| (QREFELT $ 36)) |p|
                                    (QREFELT $ 28))
                          (QREFELT $ 38)))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (QCDR |r|) |p| (QREFELT $ 28))
                       (|spadConstant| $ 22) (QREFELT $ 39))
             (CONS 1 "failed"))
            ('T
             (CONS 0
                   (SPADCALL (SPADCALL |invlcv| (QCAR |r|) (QREFELT $ 36)) |p|
                             (QREFELT $ 28))))))))) 

(SDEFUN |GENEEZ;reduceList| ((|lp| |List| BP) (|lmod| R) ($ |List| FP))
        (SPROG ((#1=#:G191 NIL) (|ff| NIL) (#2=#:G190 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |ff| NIL) (LETT #1# |lp|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ff| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |ff| |lmod| (QREFELT $ 41))
                                    #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GENEEZ;coerceLFP| ((|lf| |List| FP) ($ |List| BP))
        (SPROG ((#1=#:G195 NIL) (|fm| NIL) (#2=#:G194 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |fm| NIL) (LETT #1# |lf|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |fm| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |fm| (QREFELT $ 42)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GENEEZ;liftSol|
        ((|oldsol| |List| BP) (|err| BP) (|lmod| R) (|lmodk| R)
         (|lpolys| |List| BP) (|ftab| |Vector| (|List| FP)) (|m| BP)
         (|bound| |NonNegativeInteger|) ($ |Union| (|List| BP) "failed"))
        (SPROG
         ((#1=#:G169 NIL) (#2=#:G212 NIL) (|fs| (BP)) (#3=#:G205 NIL)
          (#4=#:G204 (BP)) (#5=#:G206 (BP)) (#6=#:G224 NIL) (|f| NIL)
          (#7=#:G225 NIL) (|g| NIL) (|nsol| (|List| BP)) (#8=#:G223 NIL)
          (|slp| NIL) (#9=#:G222 NIL) (#10=#:G220 NIL) (#11=#:G221 NIL)
          (#12=#:G219 NIL) (|sln| (|List| FP)) (#13=#:G217 NIL) (|pp| NIL)
          (#14=#:G218 NIL) (#15=#:G216 NIL) (|cc| (R)) (#16=#:G215 NIL)
          (|i| NIL) (#17=#:G214 NIL) (|xx| NIL) (#18=#:G213 NIL)
          (|d| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ G190 NIL
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL |lmodk| (QREFELT $ 12)) |bound|
                              (QREFELT $ 43))
                    (PROGN (LETT #2# (CONS 1 "failed")) (GO #19=#:G211)))
                   ('T
                    (SEQ (LETT |d| (SPADCALL |err| (QREFELT $ 9)))
                         (LETT |sln|
                               (PROGN
                                (LETT #18# NIL)
                                (SEQ (LETT |xx| NIL)
                                     (LETT #17#
                                           (SPADCALL |ftab| 1 (QREFELT $ 46)))
                                     G190
                                     (COND
                                      ((OR (ATOM #17#)
                                           (PROGN (LETT |xx| (CAR #17#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #18#
                                             (CONS (|spadConstant| $ 47)
                                                   #18#))))
                                     (LETT #17# (CDR #17#)) (GO G190) G191
                                     (EXIT (NREVERSE #18#)))))
                         (SEQ (LETT |i| 0) (LETT #16# |d|) G190
                              (COND ((|greater_SI| |i| #16#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (LETT |cc|
                                         (SPADCALL |err| |i| (QREFELT $ 48)))
                                   (|spadConstant| $ 21) (QREFELT $ 49))
                                  (LETT |sln|
                                        (PROGN
                                         (LETT #15# NIL)
                                         (SEQ (LETT |slp| NIL)
                                              (LETT #14# |sln|) (LETT |pp| NIL)
                                              (LETT #13#
                                                    (SPADCALL |ftab| (+ |i| 1)
                                                              (QREFELT $ 46)))
                                              G190
                                              (COND
                                               ((OR (ATOM #13#)
                                                    (PROGN
                                                     (LETT |pp| (CAR #13#))
                                                     NIL)
                                                    (ATOM #14#)
                                                    (PROGN
                                                     (LETT |slp| (CAR #14#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #15#
                                                      (CONS
                                                       (SPADCALL |slp|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |cc|
                                                                    (QREFELT $
                                                                             50))
                                                                   |lmod|
                                                                   (QREFELT $
                                                                            41))
                                                                  |pp|
                                                                  (QREFELT $
                                                                           51))
                                                                 (QREFELT $
                                                                          52))
                                                       #15#))))
                                              (LETT #13#
                                                    (PROG1 (CDR #13#)
                                                      (LETT #14# (CDR #14#))))
                                              (GO G190) G191
                                              (EXIT (NREVERSE #15#)))))))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL))
                         (LETT |nsol|
                               (PROGN
                                (LETT #12# NIL)
                                (SEQ (LETT |g| NIL) (LETT #11# |sln|)
                                     (LETT |f| NIL) (LETT #10# |oldsol|) G190
                                     (COND
                                      ((OR (ATOM #10#)
                                           (PROGN (LETT |f| (CAR #10#)) NIL)
                                           (ATOM #11#)
                                           (PROGN (LETT |g| (CAR #11#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #12#
                                             (CONS
                                              (SPADCALL |f|
                                                        (SPADCALL |lmodk|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |g|
                                                                    (QREFELT $
                                                                             42))
                                                                   |lmod|
                                                                   (QREFELT $
                                                                            28))
                                                                  (QREFELT $
                                                                           36))
                                                        (QREFELT $ 53))
                                              #12#))))
                                     (LETT #10#
                                           (PROG1 (CDR #10#)
                                             (LETT #11# (CDR #11#))))
                                     (GO G190) G191 (EXIT (NREVERSE #12#)))))
                         (LETT |lmodk|
                               (SPADCALL |lmod| |lmodk| (QREFELT $ 54)))
                         (LETT |nsol|
                               (PROGN
                                (LETT #9# NIL)
                                (SEQ (LETT |slp| NIL) (LETT #8# |nsol|) G190
                                     (COND
                                      ((OR (ATOM #8#)
                                           (PROGN (LETT |slp| (CAR #8#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #9#
                                             (CONS
                                              (SPADCALL |slp| |lmodk|
                                                        (QREFELT $ 28))
                                              #9#))))
                                     (LETT #8# (CDR #8#)) (GO G190) G191
                                     (EXIT (NREVERSE #9#)))))
                         (LETT |fs|
                               (PROGN
                                (LETT #3# NIL)
                                (SEQ (LETT |g| NIL) (LETT #7# |nsol|)
                                     (LETT |f| NIL) (LETT #6# |lpolys|) G190
                                     (COND
                                      ((OR (ATOM #6#)
                                           (PROGN (LETT |f| (CAR #6#)) NIL)
                                           (ATOM #7#)
                                           (PROGN (LETT |g| (CAR #7#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #5#
                                              (SPADCALL |f| |g|
                                                        (QREFELT $ 55)))
                                        (COND
                                         (#3#
                                          (LETT #4#
                                                (SPADCALL #4# #5#
                                                          (QREFELT $ 56))))
                                         ('T
                                          (PROGN
                                           (LETT #4# #5#)
                                           (LETT #3# 'T)))))))
                                     (LETT #6#
                                           (PROG1 (CDR #6#)
                                             (LETT #7# (CDR #7#))))
                                     (GO G190) G191 (EXIT NIL))
                                (COND (#3# #4#) ('T (|spadConstant| $ 22)))))
                         (EXIT
                          (COND
                           ((SPADCALL |fs| |m| (QREFELT $ 57))
                            (PROGN (LETT #2# (CONS 0 |nsol|)) (GO #19#)))
                           ('T
                            (SEQ
                             (LETT |err|
                                   (PROG2
                                       (LETT #1#
                                             (SPADCALL
                                              (SPADCALL |fs| |m|
                                                        (QREFELT $ 53))
                                              |lmodk| (QREFELT $ 59)))
                                       (QCDR #1#)
                                     (|check_union2| (QEQCAR #1# 0)
                                                     (QREFELT $ 7)
                                                     (|Union| (QREFELT $ 7)
                                                              "failed")
                                                     #1#)))
                             (EXIT (LETT |oldsol| |nsol|)))))))))))
                NIL (GO G190) G191 (EXIT NIL)))
          #19# (EXIT #2#)))) 

(SDEFUN |GENEEZ;makeProducts| ((|listPol| |List| BP) ($ |List| BP))
        (SPROG
         ((#1=#:G236 NIL) (|g| NIL) (#2=#:G235 NIL) (#3=#:G227 NIL)
          (#4=#:G226 (BP)) (#5=#:G228 (BP)) (#6=#:G234 NIL) (#7=#:G104 NIL)
          (|ll| (|List| BP)) (|f| (BP)))
         (SEQ
          (COND ((< (LENGTH |listPol|) 2) |listPol|)
                ((EQL (LENGTH |listPol|) 2) (REVERSE |listPol|))
                (#8='T
                 (SEQ (LETT |f| (|SPADfirst| |listPol|))
                      (LETT |ll| (CDR |listPol|))
                      (EXIT
                       (CONS
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT #7# NIL) (LETT #6# |ll|) G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT #7# (CAR #6#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #5# #7#)
                                 (COND
                                  (#3#
                                   (LETT #4#
                                         (SPADCALL #4# #5# (QREFELT $ 55))))
                                  ('T (PROGN (LETT #4# #5#) (LETT #3# 'T)))))))
                              (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                         (COND (#3# #4#) (#8# (|spadConstant| $ 31))))
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |g| NIL)
                              (LETT #1# (|GENEEZ;makeProducts| |ll| $)) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |g| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |f| |g| (QREFELT $ 55))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |GENEEZ;testModulus;RLB;13|
        ((|pmod| R) (|listPol| |List| BP) ($ |Boolean|))
        (SPROG
         ((#1=#:G246 NIL) (#2=#:G248 NIL) (#3=#:G251 NIL) (|rpol2| NIL)
          (|redListPol| (|List| FP)) (|rpol| (FP)) (#4=#:G247 NIL)
          (#5=#:G249 NIL) (|pol| NIL) (#6=#:G250 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |redListPol| (|GENEEZ;reduceList| |listPol| |pmod| $))
                (SEQ
                 (EXIT
                  (SEQ (LETT |rpol| NIL) (LETT #6# |redListPol|)
                       (LETT |pol| NIL) (LETT #5# |listPol|) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |pol| (CAR #5#)) NIL)
                             (ATOM #6#) (PROGN (LETT |rpol| (CAR #6#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |pol| (QREFELT $ 9))
                                     (SPADCALL (SPADCALL |rpol| (QREFELT $ 42))
                                               (QREFELT $ 9))
                                     (QREFELT $ 60))
                           (PROGN
                            (LETT #4# (PROGN (LETT #2# NIL) (GO #7=#:G245)))
                            (GO #8=#:G238))))))
                       (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#))))
                       (GO G190) G191 (EXIT NIL)))
                 #8# (EXIT #4#))
                (SEQ G190 (COND ((NULL (NULL (NULL |redListPol|))) (GO G191)))
                     (SEQ (LETT |rpol| (|SPADfirst| |redListPol|))
                          (LETT |redListPol| (CDR |redListPol|))
                          (EXIT
                           (SEQ
                            (EXIT
                             (SEQ (LETT |rpol2| NIL) (LETT #3# |redListPol|)
                                  G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN (LETT |rpol2| (CAR #3#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |rpol| |rpol2| (QREFELT $ 61))
                                       (|spadConstant| $ 62) (QREFELT $ 63))
                                      (PROGN
                                       (LETT #1#
                                             (PROGN (LETT #2# NIL) (GO #7#)))
                                       (GO #9=#:G241))))))
                                  (LETT #3# (CDR #3#)) (GO G190) G191
                                  (EXIT NIL)))
                            #9# (EXIT #1#))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #7# (EXIT #2#)))) 

(SDEFUN |GENEEZ;tablePow;NniRLU;14|
        ((|mdeg| |NonNegativeInteger|) (|pmod| R) (|listPol| |List| BP)
         ($ |Union| (|Vector| (|List| BP)) "failed"))
        (SPROG
         ((#1=#:G265 NIL) (|tpol| NIL) (#2=#:G266 NIL) (|fpol| NIL)
          (#3=#:G264 NIL) (#4=#:G263 NIL) (|i| NIL) (|x| (BP))
          (|ptable| (|Vector| (|List| BP)))
          (|multiE| (|Union| (|List| BP) "failed")))
         (SEQ
          (LETT |multiE|
                (SPADCALL |listPol| (|spadConstant| $ 31) (QREFELT $ 67)))
          (EXIT
           (COND ((QEQCAR |multiE| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |ptable| (MAKEARR1 (+ |mdeg| 1) NIL))
                       (SPADCALL |ptable| 1 (QCDR |multiE|) (QREFELT $ 69))
                       (LETT |x|
                             (SPADCALL (|spadConstant| $ 30) 1 (QREFELT $ 70)))
                       (SEQ (LETT |i| 2) (LETT #4# |mdeg|) G190
                            (COND ((|greater_SI| |i| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |ptable| |i|
                                        (PROGN
                                         (LETT #3# NIL)
                                         (SEQ (LETT |fpol| NIL)
                                              (LETT #2# |listPol|)
                                              (LETT |tpol| NIL)
                                              (LETT #1#
                                                    (SPADCALL |ptable|
                                                              (- |i| 1)
                                                              (QREFELT $ 71)))
                                              G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |tpol| (CAR #1#))
                                                     NIL)
                                                    (ATOM #2#)
                                                    (PROGN
                                                     (LETT |fpol| (CAR #2#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #3#
                                                      (CONS
                                                       (SPADCALL
                                                        (SPADCALL |tpol| |x|
                                                                  (QREFELT $
                                                                           55))
                                                        |fpol| (QREFELT $ 72))
                                                       #3#))))
                                              (LETT #1#
                                                    (PROG1 (CDR #1#)
                                                      (LETT #2# (CDR #2#))))
                                              (GO G190) G191
                                              (EXIT (NREVERSE #3#))))
                                        (QREFELT $ 69))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL))
                       (SPADCALL |ptable| (+ |mdeg| 1)
                                 (|GENEEZ;makeProducts| |listPol| $)
                                 (QREFELT $ 69))
                       (EXIT (CONS 0 |ptable|))))))))) 

(SDEFUN |GENEEZ;solveid;BPRVU;15|
        ((|m| BP) (|pmod| R) (|table| |Vector| (|List| BP))
         ($ |Union| (|List| BP) "failed"))
        (SPROG
         ((|sln| (|List| BP)) (#1=#:G279 NIL) (|pp| NIL) (#2=#:G280 NIL)
          (|slp| NIL) (#3=#:G278 NIL) (#4=#:G277 NIL) (|i| NIL) (#5=#:G276 NIL)
          (|xx| NIL) (#6=#:G275 NIL) (|d| (|NonNegativeInteger|)))
         (SEQ (LETT |d| (SPADCALL |m| (QREFELT $ 9)))
              (LETT |sln|
                    (PROGN
                     (LETT #6# NIL)
                     (SEQ (LETT |xx| NIL)
                          (LETT #5# (SPADCALL |table| 1 (QREFELT $ 71))) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |xx| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT #6# (CONS (|spadConstant| $ 22) #6#))))
                          (LETT #5# (CDR #5#)) (GO G190) G191
                          (EXIT (NREVERSE #6#)))))
              (SEQ (LETT |i| 0) (LETT #4# |d|) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |m| |i| (QREFELT $ 48))
                                 (|spadConstant| $ 21) (QREFELT $ 49))
                       (LETT |sln|
                             (PROGN
                              (LETT #3# NIL)
                              (SEQ (LETT |slp| NIL) (LETT #2# |sln|)
                                   (LETT |pp| NIL)
                                   (LETT #1#
                                         (SPADCALL |table| (+ |i| 1)
                                                   (QREFELT $ 71)))
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |pp| (CAR #1#)) NIL)
                                         (ATOM #2#)
                                         (PROGN (LETT |slp| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #3#
                                           (CONS
                                            (SPADCALL |slp|
                                                      (SPADCALL
                                                       (SPADCALL |m| |i|
                                                                 (QREFELT $
                                                                          48))
                                                       |pp| (QREFELT $ 36))
                                                      (QREFELT $ 56))
                                            #3#))))
                                   (LETT #1#
                                         (PROG1 (CDR #1#)
                                           (LETT #2# (CDR #2#))))
                                   (GO G190) G191 (EXIT (NREVERSE #3#)))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 0 |sln|))))) 

(SDEFUN |GENEEZ;tablePow;NniRLU;16|
        ((|mdeg| |NonNegativeInteger|) (|pmod| R) (|listPol| |List| BP)
         ($ |Union| (|Vector| (|List| BP)) "failed"))
        (SPROG
         ((|ptable| (|Vector| (|List| BP))) (#1=#:G298 NIL) (|tpol| NIL)
          (#2=#:G299 NIL) (|fpol| NIL) (#3=#:G297 NIL) (#4=#:G296 NIL)
          (|i| NIL) (|x| (FP)) (|fl| (|List| FP))
          (|ftable| (|Vector| (|List| FP)))
          (|multiE| (|Union| (|List| FP) "failed")) (|listP| (|List| FP))
          (#5=#:G295 NIL) (|pol| NIL) (#6=#:G294 NIL))
         (SEQ
          (LETT |listP|
                (PROGN
                 (LETT #6# NIL)
                 (SEQ (LETT |pol| NIL) (LETT #5# |listPol|) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |pol| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS (SPADCALL |pol| |pmod| (QREFELT $ 41))
                                    #6#))))
                      (LETT #5# (CDR #5#)) (GO G190) G191
                      (EXIT (NREVERSE #6#)))))
          (LETT |multiE|
                (SPADCALL |listP| (|spadConstant| $ 62) (QREFELT $ 77)))
          (EXIT
           (COND ((QEQCAR |multiE| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |ftable| (MAKEARR1 (+ |mdeg| 1) NIL))
                       (LETT |fl| (QCDR |multiE|))
                       (SPADCALL |ftable| 1 |fl| (QREFELT $ 78))
                       (LETT |x|
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 30) 1 (QREFELT $ 70))
                              |pmod| (QREFELT $ 41)))
                       (SEQ (LETT |i| 2) (LETT #4# |mdeg|) G190
                            (COND ((|greater_SI| |i| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |ftable| |i|
                                        (PROGN
                                         (LETT #3# NIL)
                                         (SEQ (LETT |fpol| NIL)
                                              (LETT #2# |listP|)
                                              (LETT |tpol| NIL)
                                              (LETT #1#
                                                    (SPADCALL |ftable|
                                                              (- |i| 1)
                                                              (QREFELT $ 46)))
                                              G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |tpol| (CAR #1#))
                                                     NIL)
                                                    (ATOM #2#)
                                                    (PROGN
                                                     (LETT |fpol| (CAR #2#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #3#
                                                      (CONS
                                                       (SPADCALL
                                                        (SPADCALL |tpol| |x|
                                                                  (QREFELT $
                                                                           51))
                                                        |fpol| (QREFELT $ 79))
                                                       #3#))))
                                              (LETT #1#
                                                    (PROG1 (CDR #1#)
                                                      (LETT #2# (CDR #2#))))
                                              (GO G190) G191
                                              (EXIT (NREVERSE #3#))))
                                        (QREFELT $ 78))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL))
                       (LETT |ptable|
                             (SPADCALL (CONS (|function| |GENEEZ;coerceLFP|) $)
                                       |ftable| (QREFELT $ 82)))
                       (SPADCALL |ptable| (+ |mdeg| 1)
                                 (|GENEEZ;makeProducts| |listPol| $)
                                 (QREFELT $ 69))
                       (EXIT (CONS 0 |ptable|))))))))) 

(SDEFUN |GENEEZ;solveid;BPRVU;17|
        ((|m| BP) (|pmod| R) (|table| |Vector| (|List| BP))
         ($ |Union| (|List| BP) "failed"))
        (SPROG
         ((|a| (BP)) (#1=#:G169 NIL) (|bound| (|NonNegativeInteger|))
          (|fs| (BP)) (#2=#:G306 NIL) (#3=#:G305 (BP)) (#4=#:G307 (BP))
          (#5=#:G319 NIL) (|f| NIL) (#6=#:G320 NIL) (|g| NIL)
          (|soln| (|List| BP)) (#7=#:G318 NIL) (|slp| NIL) (#8=#:G317 NIL)
          (|sln| (|List| FP)) (#9=#:G315 NIL) (|pp| NIL) (#10=#:G316 NIL)
          (#11=#:G314 NIL) (#12=#:G313 NIL) (|i| NIL) (#13=#:G312 NIL)
          (|xx| NIL) (#14=#:G311 NIL) (|lpolys| (|List| BP))
          (|ftab| (|Vector| (|List| FP))) (|d| (|NonNegativeInteger|)))
         (SEQ (LETT |d| (SPADCALL |m| (QREFELT $ 9)))
              (LETT |ftab|
                    (SPADCALL
                     (CONS #'|GENEEZ;solveid;BPRVU;17!0| (VECTOR $ |pmod|))
                     |table| (QREFELT $ 85)))
              (LETT |lpolys|
                    (SPADCALL |table| (QVSIZE |table|) (QREFELT $ 71)))
              (LETT |sln|
                    (PROGN
                     (LETT #14# NIL)
                     (SEQ (LETT |xx| NIL)
                          (LETT #13# (SPADCALL |ftab| 1 (QREFELT $ 46))) G190
                          (COND
                           ((OR (ATOM #13#) (PROGN (LETT |xx| (CAR #13#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #14# (CONS (|spadConstant| $ 47) #14#))))
                          (LETT #13# (CDR #13#)) (GO G190) G191
                          (EXIT (NREVERSE #14#)))))
              (SEQ (LETT |i| 0) (LETT #12# |d|) G190
                   (COND ((|greater_SI| |i| #12#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |m| |i| (QREFELT $ 48))
                                 (|spadConstant| $ 21) (QREFELT $ 49))
                       (LETT |sln|
                             (PROGN
                              (LETT #11# NIL)
                              (SEQ (LETT |slp| NIL) (LETT #10# |sln|)
                                   (LETT |pp| NIL)
                                   (LETT #9#
                                         (SPADCALL |ftab| (+ |i| 1)
                                                   (QREFELT $ 46)))
                                   G190
                                   (COND
                                    ((OR (ATOM #9#)
                                         (PROGN (LETT |pp| (CAR #9#)) NIL)
                                         (ATOM #10#)
                                         (PROGN (LETT |slp| (CAR #10#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #11#
                                           (CONS
                                            (SPADCALL |slp|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL |m| |i|
                                                                   (QREFELT $
                                                                            48))
                                                         (QREFELT $ 50))
                                                        |pmod| (QREFELT $ 41))
                                                       |pp| (QREFELT $ 51))
                                                      (QREFELT $ 52))
                                            #11#))))
                                   (LETT #9#
                                         (PROG1 (CDR #9#)
                                           (LETT #10# (CDR #10#))))
                                   (GO G190) G191 (EXIT (NREVERSE #11#)))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |soln|
                    (PROGN
                     (LETT #8# NIL)
                     (SEQ (LETT |slp| NIL) (LETT #7# |sln|) G190
                          (COND
                           ((OR (ATOM #7#) (PROGN (LETT |slp| (CAR #7#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #8#
                                  (CONS (SPADCALL |slp| (QREFELT $ 42)) #8#))))
                          (LETT #7# (CDR #7#)) (GO G190) G191
                          (EXIT (NREVERSE #8#)))))
              (LETT |fs|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |g| NIL) (LETT #6# |soln|) (LETT |f| NIL)
                          (LETT #5# |lpolys|) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#)) NIL)
                                (ATOM #6#) (PROGN (LETT |g| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4# (SPADCALL |f| |g| (QREFELT $ 55)))
                             (COND
                              (#2#
                               (LETT #3# (SPADCALL #3# #4# (QREFELT $ 56))))
                              ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                          (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#))))
                          (GO G190) G191 (EXIT NIL))
                     (COND (#2# #3#) (#15='T (|spadConstant| $ 22)))))
              (EXIT
               (COND ((SPADCALL |fs| |m| (QREFELT $ 57)) (CONS 0 |soln|))
                     (#15#
                      (SEQ
                       (LETT |bound| (SPADCALL |m| |lpolys| (QREFELT $ 20)))
                       (LETT |a|
                             (PROG2
                                 (LETT #1#
                                       (SPADCALL
                                        (SPADCALL |fs| |m| (QREFELT $ 53))
                                        |pmod| (QREFELT $ 59)))
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                               (|Union| (QREFELT $ 7) "failed")
                                               #1#)))
                       (EXIT
                        (|GENEEZ;liftSol| |soln| |a| |pmod| |pmod| |lpolys|
                         |ftab| |m| |bound| $))))))))) 

(SDEFUN |GENEEZ;solveid;BPRVU;17!0| ((|x| NIL) ($$ NIL))
        (PROG (|pmod| $)
          (LETT |pmod| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GENEEZ;reduceList| |x| |pmod| $))))) 

(DECLAIM (NOTINLINE |GenExEuclid;|)) 

(DEFUN |GenExEuclid| (&REST #1=#:G321)
  (SPROG NIL
         (PROG (#2=#:G322)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GenExEuclid|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GenExEuclid;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|GenExEuclid|)))))))))) 

(DEFUN |GenExEuclid;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|GenExEuclid| DV$1 DV$2))
          (LETT $ (GETREFV 86))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|GenExEuclid| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#1| '(|multiplicativeValuation|))
            (QSETREFV $ 20
                      (CONS (|dispatchFunction| |GENEEZ;compBound;BPLNni;1|)
                            $)))
           ((|HasCategory| |#1| '(|additiveValuation|))
            (QSETREFV $ 20
                      (CONS (|dispatchFunction| |GENEEZ;compBound;BPLNni;2|)
                            $)))
           ('T
            (QSETREFV $ 20
                      (CONS (|dispatchFunction| |GENEEZ;compBound;BPLNni;3|)
                            $))))
          (COND
           ((|HasCategory| |#1| '(|IntegerNumberSystem|))
            (QSETREFV $ 28
                      (CONS (|dispatchFunction| |GENEEZ;reduction;BPRBP;4|)
                            $)))
           ('T
            (QSETREFV $ 28
                      (CONS (|dispatchFunction| |GENEEZ;reduction;BPRBP;5|)
                            $))))
          (QSETREFV $ 40
                    (|EuclideanModularRing| |#1| |#2| |#1| (ELT $ 28)
                                            (CONS (|function| |GENEEZ;merge|)
                                                  $)
                                            (CONS
                                             (|function| |GENEEZ;exactquo|)
                                             $)))
          (COND
           ((|HasCategory| |#1| '(|Field|))
            (PROGN
             (QSETREFV $ 74
                       (CONS (|dispatchFunction| |GENEEZ;tablePow;NniRLU;14|)
                             $))
             (QSETREFV $ 76
                       (CONS (|dispatchFunction| |GENEEZ;solveid;BPRVU;15|)
                             $))))
           ('T
            (PROGN
             (QSETREFV $ 74
                       (CONS (|dispatchFunction| |GENEEZ;tablePow;NniRLU;16|)
                             $))
             (QSETREFV $ 76
                       (CONS (|dispatchFunction| |GENEEZ;solveid;BPRVU;17|)
                             $)))))
          $))) 

(MAKEPROP '|GenExEuclid| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |degree|) (|List| 6)
              (5 . |coefficients|) (10 . |euclideanSize|) (|PositiveInteger|)
              (15 . ^) (|Integer|) (|IntegerRoots| 15) (21 . |approxSqrt|)
              (26 . *) (|List| 7) (32 . |compBound|) (38 . |Zero|)
              (42 . |Zero|) (|Boolean|) (46 . =) (52 . |symmetricRemainder|)
              (|Mapping| 6 6) (58 . |map|) (64 . |reduction|) (70 . |rem|)
              (76 . |One|) (80 . |One|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 32 '#1="failed") (84 . |extendedEuclidean|)
              (91 . |leadingCoefficient|) (96 . *)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (102 . |monicDivide|) (108 . ~=) 'FP (114 . |reduce|)
              (120 . |coerce|) (125 . >) (|List| 40) (|Vector| 44)
              (131 . |elt|) (137 . |Zero|) (141 . |coefficient|) (147 . ~=)
              (153 . |coerce|) (158 . *) (164 . +) (170 . -) (176 . *)
              (182 . *) (188 . +) (194 . =) (|Union| $ '"failed")
              (200 . |exquo|) (206 . ~=) (212 . |gcd|) (218 . |One|) (222 . ~=)
              |GENEEZ;testModulus;RLB;13| (|Union| 66 '#1#) (|List| $)
              (228 . |multiEuclidean|) (|Vector| 19) (234 . |setelt!|)
              (241 . |monomial|) (247 . |elt|) (253 . |rem|)
              (|Union| 68 '#2="failed") (259 . |tablePow|)
              (|Union| 19 '"failed") (266 . |solveid|) (273 . |multiEuclidean|)
              (279 . |setelt!|) (286 . |rem|) (|Mapping| 19 44)
              (|VectorFunctions2| 44 19) (292 . |map|) (|Mapping| 44 19)
              (|VectorFunctions2| 19 44) (298 . |map|))
           '#(|testModulus| 304 |tablePow| 310 |solveid| 317 |reduction| 324
              |compBound| 330)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|reduction| (|#2| |#2| |#1|)) T)
                                   '((|compBound|
                                      ((|NonNegativeInteger|) |#2|
                                       (|List| |#2|)))
                                     T)
                                   '((|tablePow|
                                      ((|Union| (|Vector| (|List| |#2|)) #2#)
                                       (|NonNegativeInteger|) |#1|
                                       (|List| |#2|)))
                                     T)
                                   '((|solveid|
                                      ((|Union| (|List| |#2|) "failed") |#2|
                                       |#1| (|Vector| (|List| |#2|))))
                                     T)
                                   '((|testModulus|
                                      ((|Boolean|) |#1| (|List| |#2|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 85
                                            '(1 7 8 0 9 1 7 10 0 11 1 6 8 0 12
                                              2 8 0 0 13 14 1 16 15 15 17 2 8 0
                                              13 0 18 2 0 8 7 19 20 0 6 0 21 0
                                              7 0 22 2 6 23 0 0 24 2 6 0 0 0 25
                                              2 7 0 26 0 27 2 0 7 7 6 28 2 6 0
                                              0 0 29 0 6 0 30 0 7 0 31 3 6 33 0
                                              0 0 34 1 7 6 0 35 2 7 0 6 0 36 2
                                              7 37 0 0 38 2 7 23 0 0 39 2 40 0
                                              7 6 41 1 40 7 0 42 2 8 23 0 0 43
                                              2 45 44 0 15 46 0 40 0 47 2 7 6 0
                                              8 48 2 6 23 0 0 49 1 7 0 6 50 2
                                              40 0 0 0 51 2 40 0 0 0 52 2 7 0 0
                                              0 53 2 6 0 0 0 54 2 7 0 0 0 55 2
                                              7 0 0 0 56 2 7 23 0 0 57 2 7 58 0
                                              6 59 2 8 23 0 0 60 2 40 0 0 0 61
                                              0 40 0 62 2 40 23 0 0 63 2 7 65
                                              66 0 67 3 68 19 0 15 19 69 2 7 0
                                              6 8 70 2 68 19 0 15 71 2 7 0 0 0
                                              72 3 0 73 8 6 19 74 3 0 75 7 6 68
                                              76 2 40 65 66 0 77 3 45 44 0 15
                                              44 78 2 40 0 0 0 79 2 81 68 80 45
                                              82 2 84 45 83 68 85 2 0 23 6 19
                                              64 3 0 73 8 6 19 74 3 0 75 7 6 68
                                              76 2 0 7 7 6 28 2 0 8 7 19
                                              20)))))
           '|lookupComplete|)) 
