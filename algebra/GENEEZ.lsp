
(/VERSIONCHECK 2) 

(DEFUN |GENEEZ;compBound;BPLNni;1| (|m| |listpolys| $)
  (PROG (#1=#:G152 |normprod| #2=#:G147 #3=#:G146 #4=#:G148 #5=#:G150 #6=#:G162
         |g| #7=#:G163 |df| |nm| #8=#:G144 #9=#:G143 #10=#:G145 #11=#:G161 |u|
         |normlist| #12=#:G140 #13=#:G139 #14=#:G141 #15=#:G160 #16=#:G159 |f|
         #17=#:G158 |n| #18=#:G137 #19=#:G136 #20=#:G138 #21=#:G157 |ldeg|
         #22=#:G156 #23=#:G155)
    (RETURN
     (SEQ
      (LETT |ldeg|
            (PROGN
             (LETT #23# NIL . #24=(|GENEEZ;compBound;BPLNni;1|))
             (SEQ (LETT |f| NIL . #24#) (LETT #22# |listpolys| . #24#) G190
                  (COND
                   ((OR (ATOM #22#) (PROGN (LETT |f| (CAR #22#) . #24#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #23# (CONS (SPADCALL |f| (QREFELT $ 9)) #23#)
                          . #24#)))
                  (LETT #22# (CDR #22#) . #24#) (GO G190) G191
                  (EXIT (NREVERSE #23#))))
            . #24#)
      (LETT |n|
            (PROGN
             (LETT #18# NIL . #24#)
             (SEQ (LETT |df| NIL . #24#) (LETT #21# |ldeg| . #24#) G190
                  (COND
                   ((OR (ATOM #21#) (PROGN (LETT |df| (CAR #21#) . #24#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #20# |df| . #24#)
                     (COND (#18# (LETT #19# (+ #19# #20#) . #24#))
                           ('T
                            (PROGN
                             (LETT #19# #20# . #24#)
                             (LETT #18# 'T . #24#)))))))
                  (LETT #21# (CDR #21#) . #24#) (GO G190) G191 (EXIT NIL))
             (COND (#18# #19#) (#25='T 0)))
            . #24#)
      (LETT |normlist|
            (PROGN
             (LETT #17# NIL . #24#)
             (SEQ (LETT |f| NIL . #24#) (LETT #16# |listpolys| . #24#) G190
                  (COND
                   ((OR (ATOM #16#) (PROGN (LETT |f| (CAR #16#) . #24#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #17#
                          (CONS
                           (PROGN
                            (LETT #12# NIL . #24#)
                            (SEQ (LETT |u| NIL . #24#)
                                 (LETT #15# (SPADCALL |f| (QREFELT $ 11))
                                       . #24#)
                                 G190
                                 (COND
                                  ((OR (ATOM #15#)
                                       (PROGN
                                        (LETT |u| (CAR #15#) . #24#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #14#
                                          (SPADCALL
                                           (SPADCALL |u| (QREFELT $ 12)) 2
                                           (QREFELT $ 14))
                                          . #24#)
                                    (COND
                                     (#12# (LETT #13# (+ #13# #14#) . #24#))
                                     ('T
                                      (PROGN
                                       (LETT #13# #14# . #24#)
                                       (LETT #12# 'T . #24#)))))))
                                 (LETT #15# (CDR #15#) . #24#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#12# #13#) ('T 0)))
                           #17#)
                          . #24#)))
                  (LETT #16# (CDR #16#) . #24#) (GO G190) G191
                  (EXIT (NREVERSE #17#))))
            . #24#)
      (LETT |nm|
            (PROGN
             (LETT #8# NIL . #24#)
             (SEQ (LETT |u| NIL . #24#)
                  (LETT #11# (SPADCALL |m| (QREFELT $ 11)) . #24#) G190
                  (COND
                   ((OR (ATOM #11#) (PROGN (LETT |u| (CAR #11#) . #24#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #10#
                           (SPADCALL (SPADCALL |u| (QREFELT $ 12)) 2
                                     (QREFELT $ 14))
                           . #24#)
                     (COND (#8# (LETT #9# (+ #9# #10#) . #24#))
                           ('T
                            (PROGN
                             (LETT #9# #10# . #24#)
                             (LETT #8# 'T . #24#)))))))
                  (LETT #11# (CDR #11#) . #24#) (GO G190) G191 (EXIT NIL))
             (COND (#8# #9#) (#25# 0)))
            . #24#)
      (LETT |normprod|
            (PROGN
             (LETT #2# NIL . #24#)
             (SEQ (LETT |df| NIL . #24#) (LETT #7# |ldeg| . #24#)
                  (LETT |g| NIL . #24#) (LETT #6# |normlist| . #24#) G190
                  (COND
                   ((OR (ATOM #6#) (PROGN (LETT |g| (CAR #6#) . #24#) NIL)
                        (ATOM #7#) (PROGN (LETT |df| (CAR #7#) . #24#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (EXPT |g|
                                 (PROG1 (LETT #5# (- |n| |df|) . #24#)
                                   (|check_subtype| (>= #5# 0)
                                                    '(|NonNegativeInteger|)
                                                    #5#)))
                           . #24#)
                     (COND (#2# (LETT #3# (* #3# #4#) . #24#))
                           ('T
                            (PROGN
                             (LETT #3# #4# . #24#)
                             (LETT #2# 'T . #24#)))))))
                  (LETT #6# (PROG1 (CDR #6#) (LETT #7# (CDR #7#) . #24#))
                        . #24#)
                  (GO G190) G191 (EXIT NIL))
             (COND (#2# #3#) (#25# 1)))
            . #24#)
      (EXIT
       (SPADCALL 2
                 (PROG1
                     (LETT #1# (SPADCALL (* |normprod| |nm|) (QREFELT $ 17))
                           . #24#)
                   (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                 (QREFELT $ 18))))))) 

(DEFUN |GENEEZ;compBound;BPLNni;2| (|m| |listpolys| $)
  (PROG (#1=#:G168 #2=#:G167 #3=#:G169 #4=#:G171 #5=#:G170 #6=#:G172 #7=#:G176
         |u| #8=#:G175 |p| #9=#:G165 #10=#:G164 #11=#:G166 #12=#:G174)
    (RETURN
     (SEQ
      (+
       (PROGN
        (LETT #9# NIL . #13=(|GENEEZ;compBound;BPLNni;2|))
        (SEQ (LETT |u| NIL . #13#)
             (LETT #12# (SPADCALL |m| (QREFELT $ 11)) . #13#) G190
             (COND
              ((OR (ATOM #12#) (PROGN (LETT |u| (CAR #12#) . #13#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (PROGN
                (LETT #11# (SPADCALL |u| (QREFELT $ 12)) . #13#)
                (COND (#9# (LETT #10# (MAX #10# #11#) . #13#))
                      ('T
                       (PROGN
                        (LETT #10# #11# . #13#)
                        (LETT #9# 'T . #13#)))))))
             (LETT #12# (CDR #12#) . #13#) (GO G190) G191 (EXIT NIL))
        (COND (#9# #10#) (#14='T (|IdentityError| '|max|))))
       (PROGN
        (LETT #1# NIL . #13#)
        (SEQ (LETT |p| NIL . #13#) (LETT #8# |listpolys| . #13#) G190
             (COND
              ((OR (ATOM #8#) (PROGN (LETT |p| (CAR #8#) . #13#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (PROGN
                (LETT #3#
                      (PROGN
                       (LETT #4# NIL . #13#)
                       (SEQ (LETT |u| NIL . #13#)
                            (LETT #7# (SPADCALL |p| (QREFELT $ 11)) . #13#)
                            G190
                            (COND
                             ((OR (ATOM #7#)
                                  (PROGN (LETT |u| (CAR #7#) . #13#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #6# (SPADCALL |u| (QREFELT $ 12)) . #13#)
                               (COND (#4# (LETT #5# (MAX #5# #6#) . #13#))
                                     ('T
                                      (PROGN
                                       (LETT #5# #6# . #13#)
                                       (LETT #4# 'T . #13#)))))))
                            (LETT #7# (CDR #7#) . #13#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#4# #5#) ('T (|IdentityError| '|max|))))
                      . #13#)
                (COND (#1# (LETT #2# (+ #2# #3#) . #13#))
                      ('T
                       (PROGN (LETT #2# #3# . #13#) (LETT #1# 'T . #13#)))))))
             (LETT #8# (CDR #8#) . #13#) (GO G190) G191 (EXIT NIL))
        (COND (#1# #2#) (#14# 0)))))))) 

(PUT '|GENEEZ;compBound;BPLNni;3| '|SPADreplace|
     '(XLAM (|m| |listpolys|)
       (|error|
        "attempt to use compBound without a well-understood valuation"))) 

(DEFUN |GENEEZ;compBound;BPLNni;3| (|m| |listpolys| $)
  (|error| "attempt to use compBound without a well-understood valuation")) 

(DEFUN |GENEEZ;reduction;BPRBP;4| (|u| |p| $)
  (PROG ()
    (RETURN
     (COND ((SPADCALL |p| (|spadConstant| $ 21) (QREFELT $ 24)) |u|)
           ('T
            (SPADCALL (CONS #'|GENEEZ;reduction;BPRBP;4!0| (VECTOR $ |p|)) |u|
                      (QREFELT $ 27))))))) 

(DEFUN |GENEEZ;reduction;BPRBP;4!0| (|x| $$)
  (PROG (|p| $)
    (LETT |p| (QREFELT $$ 1) . #1=(|GENEEZ;reduction;BPRBP;4|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |p| (QREFELT $ 25)))))) 

(DEFUN |GENEEZ;reduction;BPRBP;5| (|u| |p| $)
  (PROG ()
    (RETURN
     (COND ((SPADCALL |p| (|spadConstant| $ 21) (QREFELT $ 24)) |u|)
           ('T
            (SPADCALL (CONS #'|GENEEZ;reduction;BPRBP;5!0| (VECTOR $ |p|)) |u|
                      (QREFELT $ 27))))))) 

(DEFUN |GENEEZ;reduction;BPRBP;5!0| (|x| $$)
  (PROG (|p| $)
    (LETT |p| (QREFELT $$ 1) . #1=(|GENEEZ;reduction;BPRBP;5|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |p| (QREFELT $ 29)))))) 

(DEFUN |GENEEZ;merge| (|p| |q| $)
  (COND ((SPADCALL |p| |q| (QREFELT $ 24)) (CONS 0 |p|))
        ((SPADCALL |p| (|spadConstant| $ 21) (QREFELT $ 24)) (CONS 0 |q|))
        ((SPADCALL |q| (|spadConstant| $ 21) (QREFELT $ 24)) (CONS 0 |p|))
        ('T (CONS 1 "failed")))) 

(DEFUN |GENEEZ;modInverse| (|c| |p| $)
  (PROG (#1=#:G188)
    (RETURN
     (QCAR
      (PROG2
          (LETT #1# (SPADCALL |c| |p| (|spadConstant| $ 30) (QREFELT $ 34))
                |GENEEZ;modInverse|)
          (QCDR #1#)
        (|check_union| (QEQCAR #1# 0)
                       (|Record| (|:| |coef1| (QREFELT $ 6))
                                 (|:| |coef2| (QREFELT $ 6)))
                       #1#)))))) 

(DEFUN |GENEEZ;exactquo| (|u| |v| |p| $)
  (PROG (|r| |invlcv|)
    (RETURN
     (SEQ
      (LETT |invlcv| (|GENEEZ;modInverse| (SPADCALL |v| (QREFELT $ 35)) |p| $)
            . #1=(|GENEEZ;exactquo|))
      (LETT |r|
            (SPADCALL |u|
                      (SPADCALL (SPADCALL |invlcv| |v| (QREFELT $ 36)) |p|
                                (QREFELT $ 28))
                      (QREFELT $ 38))
            . #1#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL (QCDR |r|) |p| (QREFELT $ 28))
                   (|spadConstant| $ 22) (QREFELT $ 39))
         (CONS 1 "failed"))
        ('T
         (CONS 0
               (SPADCALL (SPADCALL |invlcv| (QCAR |r|) (QREFELT $ 36)) |p|
                         (QREFELT $ 28)))))))))) 

(DEFUN |GENEEZ;reduceList| (|lp| |lmod| $)
  (PROG (#1=#:G214 |ff| #2=#:G213)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|GENEEZ;reduceList|))
       (SEQ (LETT |ff| NIL . #3#) (LETT #1# |lp| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |ff| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL |ff| |lmod| (QREFELT $ 41)) #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |GENEEZ;coerceLFP| (|lf| $)
  (PROG (#1=#:G218 |fm| #2=#:G217)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|GENEEZ;coerceLFP|))
       (SEQ (LETT |fm| NIL . #3#) (LETT #1# |lf| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |fm| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT (LETT #2# (CONS (SPADCALL |fm| (QREFELT $ 42)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |GENEEZ;liftSol| (|oldsol| |err| |lmod| |lmodk| |table| |m| |bound| $)
  (PROG (|a| #1=#:G192 |fs| #2=#:G229 #3=#:G228 #4=#:G230 #5=#:G245 |f|
         #6=#:G246 |g| |lpolys| |nsol| #7=#:G244 |slp| #8=#:G243 |lmodk1|
         #9=#:G241 #10=#:G242 #11=#:G240 |sln| #12=#:G238 |pp| #13=#:G239
         #14=#:G237 |cc| |i| #15=#:G236 |xx| #16=#:G235 |ftab| |d|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |lmodk| (QREFELT $ 12)) |bound| (QREFELT $ 43))
        (CONS 1 "failed"))
       (#17='T
        (SEQ (LETT |d| (SPADCALL |err| (QREFELT $ 9)) . #18=(|GENEEZ;liftSol|))
             (LETT |ftab|
                   (SPADCALL (CONS #'|GENEEZ;liftSol!0| (VECTOR $ |lmod|))
                             |table| (QREFELT $ 48))
                   . #18#)
             (LETT |sln|
                   (PROGN
                    (LETT #16# NIL . #18#)
                    (SEQ (LETT |xx| NIL . #18#)
                         (LETT #15# (SPADCALL |ftab| 1 (QREFELT $ 51)) . #18#)
                         G190
                         (COND
                          ((OR (ATOM #15#)
                               (PROGN (LETT |xx| (CAR #15#) . #18#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #16# (CONS (|spadConstant| $ 52) #16#)
                                 . #18#)))
                         (LETT #15# (CDR #15#) . #18#) (GO G190) G191
                         (EXIT (NREVERSE #16#))))
                   . #18#)
             (SEQ (LETT |i| 0 . #18#) G190
                  (COND ((|greater_SI| |i| |d|) (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL
                       (LETT |cc| (SPADCALL |err| |i| (QREFELT $ 53)) . #18#)
                       (|spadConstant| $ 21) (QREFELT $ 54))
                      (LETT |sln|
                            (PROGN
                             (LETT #14# NIL . #18#)
                             (SEQ (LETT |slp| NIL . #18#)
                                  (LETT #13# |sln| . #18#)
                                  (LETT |pp| NIL . #18#)
                                  (LETT #12#
                                        (SPADCALL |ftab| (+ |i| 1)
                                                  (QREFELT $ 51))
                                        . #18#)
                                  G190
                                  (COND
                                   ((OR (ATOM #12#)
                                        (PROGN
                                         (LETT |pp| (CAR #12#) . #18#)
                                         NIL)
                                        (ATOM #13#)
                                        (PROGN
                                         (LETT |slp| (CAR #13#) . #18#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #14#
                                          (CONS
                                           (SPADCALL |slp|
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |cc|
                                                                 (QREFELT $
                                                                          55))
                                                       |lmod| (QREFELT $ 41))
                                                      |pp| (QREFELT $ 56))
                                                     (QREFELT $ 57))
                                           #14#)
                                          . #18#)))
                                  (LETT #12#
                                        (PROG1 (CDR #12#)
                                          (LETT #13# (CDR #13#) . #18#))
                                        . #18#)
                                  (GO G190) G191 (EXIT (NREVERSE #14#))))
                            . #18#)))))
                  (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191 (EXIT NIL))
             (LETT |nsol|
                   (PROGN
                    (LETT #11# NIL . #18#)
                    (SEQ (LETT |g| NIL . #18#) (LETT #10# |sln| . #18#)
                         (LETT |f| NIL . #18#) (LETT #9# |oldsol| . #18#) G190
                         (COND
                          ((OR (ATOM #9#)
                               (PROGN (LETT |f| (CAR #9#) . #18#) NIL)
                               (ATOM #10#)
                               (PROGN (LETT |g| (CAR #10#) . #18#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #11#
                                 (CONS
                                  (SPADCALL |f|
                                            (SPADCALL |lmodk|
                                                      (SPADCALL
                                                       (SPADCALL |g|
                                                                 (QREFELT $
                                                                          42))
                                                       |lmod| (QREFELT $ 28))
                                                      (QREFELT $ 36))
                                            (QREFELT $ 58))
                                  #11#)
                                 . #18#)))
                         (LETT #9#
                               (PROG1 (CDR #9#) (LETT #10# (CDR #10#) . #18#))
                               . #18#)
                         (GO G190) G191 (EXIT (NREVERSE #11#))))
                   . #18#)
             (LETT |lmodk1| (SPADCALL |lmod| |lmodk| (QREFELT $ 59)) . #18#)
             (LETT |nsol|
                   (PROGN
                    (LETT #8# NIL . #18#)
                    (SEQ (LETT |slp| NIL . #18#) (LETT #7# |nsol| . #18#) G190
                         (COND
                          ((OR (ATOM #7#)
                               (PROGN (LETT |slp| (CAR #7#) . #18#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #8#
                                 (CONS (SPADCALL |slp| |lmodk1| (QREFELT $ 28))
                                       #8#)
                                 . #18#)))
                         (LETT #7# (CDR #7#) . #18#) (GO G190) G191
                         (EXIT (NREVERSE #8#))))
                   . #18#)
             (LETT |lpolys| (SPADCALL |table| (QVSIZE |table|) (QREFELT $ 60))
                   . #18#)
             (LETT |fs|
                   (PROGN
                    (LETT #2# NIL . #18#)
                    (SEQ (LETT |g| NIL . #18#) (LETT #6# |nsol| . #18#)
                         (LETT |f| NIL . #18#) (LETT #5# |lpolys| . #18#) G190
                         (COND
                          ((OR (ATOM #5#)
                               (PROGN (LETT |f| (CAR #5#) . #18#) NIL)
                               (ATOM #6#)
                               (PROGN (LETT |g| (CAR #6#) . #18#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #4# (SPADCALL |f| |g| (QREFELT $ 61)) . #18#)
                            (COND
                             (#2#
                              (LETT #3# (SPADCALL #3# #4# (QREFELT $ 62))
                                    . #18#))
                             ('T
                              (PROGN
                               (LETT #3# #4# . #18#)
                               (LETT #2# 'T . #18#)))))))
                         (LETT #5#
                               (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #18#))
                               . #18#)
                         (GO G190) G191 (EXIT NIL))
                    (COND (#2# #3#) (#17# (|spadConstant| $ 22))))
                   . #18#)
             (EXIT
              (COND ((SPADCALL |fs| |m| (QREFELT $ 63)) (CONS 0 |nsol|))
                    (#17#
                     (SEQ
                      (LETT |a|
                            (PROG2
                                (LETT #1#
                                      (SPADCALL
                                       (SPADCALL |fs| |m| (QREFELT $ 58))
                                       |lmodk1| (QREFELT $ 65))
                                      . #18#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                            . #18#)
                      (EXIT
                       (|GENEEZ;liftSol| |nsol| |a| |lmod| |lmodk1| |table| |m|
                        |bound| $))))))))))))) 

(DEFUN |GENEEZ;liftSol!0| (|x| $$)
  (PROG (|lmod| $)
    (LETT |lmod| (QREFELT $$ 1) . #1=(|GENEEZ;liftSol|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|GENEEZ;reduceList| |x| |lmod| $))))) 

(DEFUN |GENEEZ;makeProducts| (|listPol| $)
  (PROG (#1=#:G257 |g| #2=#:G256 #3=#:G248 #4=#:G247 #5=#:G249 #6=#:G255
         #7=#:G127 |ll| |f|)
    (RETURN
     (SEQ
      (COND ((< (LENGTH |listPol|) 2) |listPol|)
            ((EQL (LENGTH |listPol|) 2) (REVERSE |listPol|))
            (#8='T
             (SEQ
              (LETT |f| (|SPADfirst| |listPol|) . #9=(|GENEEZ;makeProducts|))
              (LETT |ll| (CDR |listPol|) . #9#)
              (EXIT
               (CONS
                (PROGN
                 (LETT #3# NIL . #9#)
                 (SEQ (LETT #7# NIL . #9#) (LETT #6# |ll| . #9#) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT #7# (CAR #6#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #5# #7# . #9#)
                         (COND
                          (#3#
                           (LETT #4# (SPADCALL #4# #5# (QREFELT $ 61)) . #9#))
                          ('T
                           (PROGN
                            (LETT #4# #5# . #9#)
                            (LETT #3# 'T . #9#)))))))
                      (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL))
                 (COND (#3# #4#) (#8# (|spadConstant| $ 31))))
                (PROGN
                 (LETT #2# NIL . #9#)
                 (SEQ (LETT |g| NIL . #9#)
                      (LETT #1# (|GENEEZ;makeProducts| |ll| $) . #9#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |f| |g| (QREFELT $ 61)) #2#)
                              . #9#)))
                      (LETT #1# (CDR #1#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))))))))) 

(DEFUN |GENEEZ;testModulus;RLB;13| (|pmod| |listPol| $)
  (PROG (#1=#:G262 #2=#:G266 #3=#:G269 |rpol2| |redListPol| |rpol| #4=#:G259
         #5=#:G267 |pol| #6=#:G268)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |redListPol| (|GENEEZ;reduceList| |listPol| |pmod| $)
              . #7=(|GENEEZ;testModulus;RLB;13|))
        (SEQ
         (EXIT
          (SEQ (LETT |rpol| NIL . #7#) (LETT #6# |redListPol| . #7#)
               (LETT |pol| NIL . #7#) (LETT #5# |listPol| . #7#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |pol| (CAR #5#) . #7#) NIL)
                     (ATOM #6#) (PROGN (LETT |rpol| (CAR #6#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |pol| (QREFELT $ 9))
                             (SPADCALL (SPADCALL |rpol| (QREFELT $ 42))
                                       (QREFELT $ 9))
                             (QREFELT $ 66))
                   (PROGN
                    (LETT #4# (PROGN (LETT #2# 'NIL . #7#) (GO #2#)) . #7#)
                    (GO #4#))))))
               (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #7#)) . #7#)
               (GO G190) G191 (EXIT NIL)))
         #4# (EXIT #4#))
        (SEQ G190
             (COND
              ((NULL (COND ((NULL |redListPol|) 'NIL) ('T 'T))) (GO G191)))
             (SEQ (LETT |rpol| (|SPADfirst| |redListPol|) . #7#)
                  (LETT |redListPol| (CDR |redListPol|) . #7#)
                  (EXIT
                   (SEQ
                    (EXIT
                     (SEQ (LETT |rpol2| NIL . #7#)
                          (LETT #3# |redListPol| . #7#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |rpol2| (CAR #3#) . #7#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (SPADCALL |rpol| |rpol2| (QREFELT $ 67))
                               (|spadConstant| $ 49) (QREFELT $ 68))
                              (PROGN
                               (LETT #1# (PROGN (LETT #2# 'NIL . #7#) (GO #2#))
                                     . #7#)
                               (GO #1#))))))
                          (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                          (EXIT NIL)))
                    #1# (EXIT #1#))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |GENEEZ;tablePow;NniRLU;14| (|mdeg| |pmod| |listPol| $)
  (PROG (#1=#:G282 |tpol| #2=#:G283 |fpol| #3=#:G281 |i| |x| |ptable| |multiE|)
    (RETURN
     (SEQ
      (LETT |multiE| (SPADCALL |listPol| (|spadConstant| $ 31) (QREFELT $ 72))
            . #4=(|GENEEZ;tablePow;NniRLU;14|))
      (EXIT
       (COND ((QEQCAR |multiE| 1) (CONS 1 "failed"))
             ('T
              (SEQ (LETT |ptable| (MAKEARR1 (+ |mdeg| 1) NIL) . #4#)
                   (SPADCALL |ptable| 1 (QCDR |multiE|) (QREFELT $ 73))
                   (LETT |x| (SPADCALL (|spadConstant| $ 30) 1 (QREFELT $ 74))
                         . #4#)
                   (SEQ (LETT |i| 2 . #4#) G190
                        (COND ((|greater_SI| |i| |mdeg|) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |ptable| |i|
                                    (PROGN
                                     (LETT #3# NIL . #4#)
                                     (SEQ (LETT |fpol| NIL . #4#)
                                          (LETT #2# |listPol| . #4#)
                                          (LETT |tpol| NIL . #4#)
                                          (LETT #1#
                                                (SPADCALL |ptable| (- |i| 1)
                                                          (QREFELT $ 60))
                                                . #4#)
                                          G190
                                          (COND
                                           ((OR (ATOM #1#)
                                                (PROGN
                                                 (LETT |tpol| (CAR #1#) . #4#)
                                                 NIL)
                                                (ATOM #2#)
                                                (PROGN
                                                 (LETT |fpol| (CAR #2#) . #4#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #3#
                                                  (CONS
                                                   (SPADCALL
                                                    (SPADCALL |tpol| |x|
                                                              (QREFELT $ 61))
                                                    |fpol| (QREFELT $ 75))
                                                   #3#)
                                                  . #4#)))
                                          (LETT #1#
                                                (PROG1 (CDR #1#)
                                                  (LETT #2# (CDR #2#) . #4#))
                                                . #4#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #3#))))
                                    (QREFELT $ 73))))
                        (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                        (EXIT NIL))
                   (SPADCALL |ptable| (+ |mdeg| 1)
                             (|GENEEZ;makeProducts| |listPol| $)
                             (QREFELT $ 73))
                   (EXIT (CONS 0 |ptable|)))))))))) 

(DEFUN |GENEEZ;solveid;BPRVU;15| (|m| |pmod| |table| $)
  (PROG (|sln| #1=#:G295 |pp| #2=#:G296 |slp| #3=#:G294 |i| #4=#:G293 |xx|
         #5=#:G292 |d|)
    (RETURN
     (SEQ
      (LETT |d| (SPADCALL |m| (QREFELT $ 9)) . #6=(|GENEEZ;solveid;BPRVU;15|))
      (LETT |sln|
            (PROGN
             (LETT #5# NIL . #6#)
             (SEQ (LETT |xx| NIL . #6#)
                  (LETT #4# (SPADCALL |table| 1 (QREFELT $ 60)) . #6#) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |xx| (CAR #4#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT (LETT #5# (CONS (|spadConstant| $ 22) #5#) . #6#)))
                  (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                  (EXIT (NREVERSE #5#))))
            . #6#)
      (SEQ (LETT |i| 0 . #6#) G190 (COND ((|greater_SI| |i| |d|) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |m| |i| (QREFELT $ 53))
                         (|spadConstant| $ 21) (QREFELT $ 54))
               (LETT |sln|
                     (PROGN
                      (LETT #3# NIL . #6#)
                      (SEQ (LETT |slp| NIL . #6#) (LETT #2# |sln| . #6#)
                           (LETT |pp| NIL . #6#)
                           (LETT #1#
                                 (SPADCALL |table| (+ |i| 1) (QREFELT $ 60))
                                 . #6#)
                           G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |pp| (CAR #1#) . #6#) NIL)
                                 (ATOM #2#)
                                 (PROGN (LETT |slp| (CAR #2#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #3#
                                   (CONS
                                    (SPADCALL |slp|
                                              (SPADCALL
                                               (SPADCALL |m| |i|
                                                         (QREFELT $ 53))
                                               |pp| (QREFELT $ 36))
                                              (QREFELT $ 62))
                                    #3#)
                                   . #6#)))
                           (LETT #1#
                                 (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #6#))
                                 . #6#)
                           (GO G190) G191 (EXIT (NREVERSE #3#))))
                     . #6#)))))
           (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
      (EXIT (CONS 0 |sln|)))))) 

(DEFUN |GENEEZ;tablePow;NniRLU;16| (|mdeg| |pmod| |listPol| $)
  (PROG (|ptable| #1=#:G319 |tpol| #2=#:G320 |fpol| #3=#:G318 |i| |x| #4=#:G317
         #5=#:G316 |fl| #6=#:G315 |ff| #7=#:G314 |ftable| |multiE| |listP|
         #8=#:G313 |pol| #9=#:G312)
    (RETURN
     (SEQ
      (LETT |listP|
            (PROGN
             (LETT #9# NIL . #10=(|GENEEZ;tablePow;NniRLU;16|))
             (SEQ (LETT |pol| NIL . #10#) (LETT #8# |listPol| . #10#) G190
                  (COND
                   ((OR (ATOM #8#) (PROGN (LETT |pol| (CAR #8#) . #10#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #9# (CONS (SPADCALL |pol| |pmod| (QREFELT $ 41)) #9#)
                          . #10#)))
                  (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                  (EXIT (NREVERSE #9#))))
            . #10#)
      (LETT |multiE| (SPADCALL |listP| (|spadConstant| $ 49) (QREFELT $ 80))
            . #10#)
      (EXIT
       (COND ((QEQCAR |multiE| 1) (CONS 1 "failed"))
             ('T
              (SEQ (LETT |ftable| (MAKEARR1 (+ |mdeg| 1) NIL) . #10#)
                   (LETT |fl|
                         (PROGN
                          (LETT #7# NIL . #10#)
                          (SEQ (LETT |ff| NIL . #10#)
                               (LETT #6# (QCDR |multiE|) . #10#) G190
                               (COND
                                ((OR (ATOM #6#)
                                     (PROGN (LETT |ff| (CAR #6#) . #10#) NIL))
                                 (GO G191)))
                               (SEQ (EXIT (LETT #7# (CONS |ff| #7#) . #10#)))
                               (LETT #6# (CDR #6#) . #10#) (GO G190) G191
                               (EXIT (NREVERSE #7#))))
                         . #10#)
                   (SPADCALL |ftable| 1
                             (PROGN
                              (LETT #5# NIL . #10#)
                              (SEQ (LETT |fpol| NIL . #10#)
                                   (LETT #4# |fl| . #10#) G190
                                   (COND
                                    ((OR (ATOM #4#)
                                         (PROGN
                                          (LETT |fpol| (CAR #4#) . #10#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT (LETT #5# (CONS |fpol| #5#) . #10#)))
                                   (LETT #4# (CDR #4#) . #10#) (GO G190) G191
                                   (EXIT (NREVERSE #5#))))
                             (QREFELT $ 81))
                   (LETT |x|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 30) 1 (QREFELT $ 74))
                          |pmod| (QREFELT $ 41))
                         . #10#)
                   (SEQ (LETT |i| 2 . #10#) G190
                        (COND ((|greater_SI| |i| |mdeg|) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |ftable| |i|
                                    (PROGN
                                     (LETT #3# NIL . #10#)
                                     (SEQ (LETT |fpol| NIL . #10#)
                                          (LETT #2# |listP| . #10#)
                                          (LETT |tpol| NIL . #10#)
                                          (LETT #1#
                                                (SPADCALL |ftable| (- |i| 1)
                                                          (QREFELT $ 51))
                                                . #10#)
                                          G190
                                          (COND
                                           ((OR (ATOM #1#)
                                                (PROGN
                                                 (LETT |tpol| (CAR #1#) . #10#)
                                                 NIL)
                                                (ATOM #2#)
                                                (PROGN
                                                 (LETT |fpol| (CAR #2#) . #10#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #3#
                                                  (CONS
                                                   (SPADCALL
                                                    (SPADCALL |tpol| |x|
                                                              (QREFELT $ 56))
                                                    |fpol| (QREFELT $ 82))
                                                   #3#)
                                                  . #10#)))
                                          (LETT #1#
                                                (PROG1 (CDR #1#)
                                                  (LETT #2# (CDR #2#) . #10#))
                                                . #10#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #3#))))
                                    (QREFELT $ 81))))
                        (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |ptable|
                         (SPADCALL (CONS (|function| |GENEEZ;coerceLFP|) $)
                                   |ftable| (QREFELT $ 85))
                         . #10#)
                   (SPADCALL |ptable| (+ |mdeg| 1)
                             (|GENEEZ;makeProducts| |listPol| $)
                             (QREFELT $ 73))
                   (EXIT (CONS 0 |ptable|)))))))))) 

(DEFUN |GENEEZ;solveid;BPRVU;17| (|m| |pmod| |table| $)
  (PROG (|a| #1=#:G192 |bound| |fs| #2=#:G327 #3=#:G326 #4=#:G328 #5=#:G339 |f|
         #6=#:G340 |g| |soln| #7=#:G338 |slp| #8=#:G337 |sln| #9=#:G335 |pp|
         #10=#:G336 #11=#:G334 |i| #12=#:G333 |xx| #13=#:G332 |lpolys| |ftab|
         |d|)
    (RETURN
     (SEQ
      (LETT |d| (SPADCALL |m| (QREFELT $ 9)) . #14=(|GENEEZ;solveid;BPRVU;17|))
      (LETT |ftab|
            (SPADCALL (CONS #'|GENEEZ;solveid;BPRVU;17!0| (VECTOR $ |pmod|))
                      |table| (QREFELT $ 48))
            . #14#)
      (LETT |lpolys| (SPADCALL |table| (QVSIZE |table|) (QREFELT $ 60)) . #14#)
      (LETT |sln|
            (PROGN
             (LETT #13# NIL . #14#)
             (SEQ (LETT |xx| NIL . #14#)
                  (LETT #12# (SPADCALL |ftab| 1 (QREFELT $ 51)) . #14#) G190
                  (COND
                   ((OR (ATOM #12#) (PROGN (LETT |xx| (CAR #12#) . #14#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT (LETT #13# (CONS (|spadConstant| $ 52) #13#) . #14#)))
                  (LETT #12# (CDR #12#) . #14#) (GO G190) G191
                  (EXIT (NREVERSE #13#))))
            . #14#)
      (SEQ (LETT |i| 0 . #14#) G190 (COND ((|greater_SI| |i| |d|) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |m| |i| (QREFELT $ 53))
                         (|spadConstant| $ 21) (QREFELT $ 54))
               (LETT |sln|
                     (PROGN
                      (LETT #11# NIL . #14#)
                      (SEQ (LETT |slp| NIL . #14#) (LETT #10# |sln| . #14#)
                           (LETT |pp| NIL . #14#)
                           (LETT #9# (SPADCALL |ftab| (+ |i| 1) (QREFELT $ 51))
                                 . #14#)
                           G190
                           (COND
                            ((OR (ATOM #9#)
                                 (PROGN (LETT |pp| (CAR #9#) . #14#) NIL)
                                 (ATOM #10#)
                                 (PROGN (LETT |slp| (CAR #10#) . #14#) NIL))
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
                                                           (QREFELT $ 53))
                                                 (QREFELT $ 55))
                                                |pmod| (QREFELT $ 41))
                                               |pp| (QREFELT $ 56))
                                              (QREFELT $ 57))
                                    #11#)
                                   . #14#)))
                           (LETT #9#
                                 (PROG1 (CDR #9#)
                                   (LETT #10# (CDR #10#) . #14#))
                                 . #14#)
                           (GO G190) G191 (EXIT (NREVERSE #11#))))
                     . #14#)))))
           (LETT |i| (|inc_SI| |i|) . #14#) (GO G190) G191 (EXIT NIL))
      (LETT |soln|
            (PROGN
             (LETT #8# NIL . #14#)
             (SEQ (LETT |slp| NIL . #14#) (LETT #7# |sln| . #14#) G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |slp| (CAR #7#) . #14#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #8# (CONS (SPADCALL |slp| (QREFELT $ 42)) #8#)
                          . #14#)))
                  (LETT #7# (CDR #7#) . #14#) (GO G190) G191
                  (EXIT (NREVERSE #8#))))
            . #14#)
      (LETT |fs|
            (PROGN
             (LETT #2# NIL . #14#)
             (SEQ (LETT |g| NIL . #14#) (LETT #6# |soln| . #14#)
                  (LETT |f| NIL . #14#) (LETT #5# |lpolys| . #14#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#) . #14#) NIL)
                        (ATOM #6#) (PROGN (LETT |g| (CAR #6#) . #14#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4# (SPADCALL |f| |g| (QREFELT $ 61)) . #14#)
                     (COND
                      (#2# (LETT #3# (SPADCALL #3# #4# (QREFELT $ 62)) . #14#))
                      ('T
                       (PROGN (LETT #3# #4# . #14#) (LETT #2# 'T . #14#)))))))
                  (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #14#))
                        . #14#)
                  (GO G190) G191 (EXIT NIL))
             (COND (#2# #3#) (#15='T (|spadConstant| $ 22))))
            . #14#)
      (EXIT
       (COND ((SPADCALL |fs| |m| (QREFELT $ 63)) (CONS 0 |soln|))
             (#15#
              (SEQ (LETT |bound| (SPADCALL |m| |lpolys| (QREFELT $ 20)) . #14#)
                   (LETT |a|
                         (PROG2
                             (LETT #1#
                                   (SPADCALL (SPADCALL |fs| |m| (QREFELT $ 58))
                                             |pmod| (QREFELT $ 65))
                                   . #14#)
                             (QCDR #1#)
                           (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                         . #14#)
                   (EXIT
                    (|GENEEZ;liftSol| |soln| |a| |pmod| |pmod| |table| |m|
                     |bound| $)))))))))) 

(DEFUN |GENEEZ;solveid;BPRVU;17!0| (|x| $$)
  (PROG (|pmod| $)
    (LETT |pmod| (QREFELT $$ 1) . #1=(|GENEEZ;solveid;BPRVU;17|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|GENEEZ;reduceList| |x| |pmod| $))))) 

(DEFUN |GenExEuclid| (&REST #1=#:G341)
  (PROG ()
    (RETURN
     (PROG (#2=#:G342)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|GenExEuclid|)
                                           '|domainEqualList|)
                . #3=(|GenExEuclid|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |GenExEuclid;|) #1#)
                (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|GenExEuclid|))))))))))) 

(DEFUN |GenExEuclid;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|GenExEuclid|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|GenExEuclid| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 86) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|GenExEuclid| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| '(|multiplicativeValuation|))
        (QSETREFV $ 20
                  (CONS (|dispatchFunction| |GENEEZ;compBound;BPLNni;1|) $)))
       ((|HasCategory| |#1| '(|additiveValuation|))
        (QSETREFV $ 20
                  (CONS (|dispatchFunction| |GENEEZ;compBound;BPLNni;2|) $)))
       ('T
        (QSETREFV $ 20
                  (CONS (|dispatchFunction| |GENEEZ;compBound;BPLNni;3|) $))))
      (COND
       ((|HasCategory| |#1| '(|IntegerNumberSystem|))
        (QSETREFV $ 28
                  (CONS (|dispatchFunction| |GENEEZ;reduction;BPRBP;4|) $)))
       ('T
        (QSETREFV $ 28
                  (CONS (|dispatchFunction| |GENEEZ;reduction;BPRBP;5|) $))))
      (QSETREFV $ 40
                (|EuclideanModularRing| |#1| |#2| |#1| (ELT $ 28)
                                        (CONS (|function| |GENEEZ;merge|) $)
                                        (CONS (|function| |GENEEZ;exactquo|)
                                              $)))
      (COND
       ((|HasCategory| |#1| '(|Field|))
        (PROGN
         (QSETREFV $ 77
                   (CONS (|dispatchFunction| |GENEEZ;tablePow;NniRLU;14|) $))
         (QSETREFV $ 79
                   (CONS (|dispatchFunction| |GENEEZ;solveid;BPRVU;15|) $))))
       ('T
        (PROGN
         (QSETREFV $ 77
                   (CONS (|dispatchFunction| |GENEEZ;tablePow;NniRLU;16|) $))
         (QSETREFV $ 79
                   (CONS (|dispatchFunction| |GENEEZ;solveid;BPRVU;17|) $)))))
      $)))) 

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
              (120 . |coerce|) (125 . >) (|Vector| 50) (|Mapping| 50 19)
              (|Vector| 19) (|VectorFunctions2| 19 50) (131 . |map|)
              (137 . |One|) (|List| 40) (141 . |elt|) (147 . |Zero|)
              (151 . |coefficient|) (157 . ~=) (163 . |coerce|) (168 . *)
              (174 . +) (180 . -) (186 . *) (192 . |elt|) (198 . *) (204 . +)
              (210 . =) (|Union| $ '"failed") (216 . |exquo|) (222 . ~=)
              (228 . |gcd|) (234 . ~=) |GENEEZ;testModulus;RLB;13|
              (|Union| 71 '#1#) (|List| $) (240 . |multiEuclidean|)
              (246 . |setelt|) (253 . |monomial|) (259 . |rem|)
              (|Union| 46 '"failed") (265 . |tablePow|) (|Union| 19 '"failed")
              (272 . |solveid|) (279 . |multiEuclidean|) (285 . |setelt|)
              (292 . |rem|) (|Mapping| 19 50) (|VectorFunctions2| 50 19)
              (298 . |map|))
           '#(|testModulus| 304 |tablePow| 310 |solveid| 317 |reduction| 324
              |compBound| 330)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 85
                                                 '(1 7 8 0 9 1 7 10 0 11 1 6 8
                                                   0 12 2 8 0 0 13 14 1 16 15
                                                   15 17 2 8 0 13 0 18 2 0 8 7
                                                   19 20 0 6 0 21 0 7 0 22 2 6
                                                   23 0 0 24 2 6 0 0 0 25 2 7 0
                                                   26 0 27 2 0 7 7 6 28 2 6 0 0
                                                   0 29 0 6 0 30 0 7 0 31 3 6
                                                   33 0 0 0 34 1 7 6 0 35 2 7 0
                                                   6 0 36 2 7 37 0 0 38 2 7 23
                                                   0 0 39 2 40 0 7 6 41 1 40 7
                                                   0 42 2 8 23 0 0 43 2 47 44
                                                   45 46 48 0 40 0 49 2 44 50 0
                                                   15 51 0 40 0 52 2 7 6 0 8 53
                                                   2 6 23 0 0 54 1 7 0 6 55 2
                                                   40 0 0 0 56 2 40 0 0 0 57 2
                                                   7 0 0 0 58 2 6 0 0 0 59 2 46
                                                   19 0 15 60 2 7 0 0 0 61 2 7
                                                   0 0 0 62 2 7 23 0 0 63 2 7
                                                   64 0 6 65 2 8 23 0 0 66 2 40
                                                   0 0 0 67 2 40 23 0 0 68 2 7
                                                   70 71 0 72 3 46 19 0 15 19
                                                   73 2 7 0 6 8 74 2 7 0 0 0 75
                                                   3 0 76 8 6 19 77 3 0 78 7 6
                                                   46 79 2 40 70 71 0 80 3 44
                                                   50 0 15 50 81 2 40 0 0 0 82
                                                   2 84 46 83 44 85 2 0 23 6 19
                                                   69 3 0 76 8 6 19 77 3 0 78 7
                                                   6 46 79 2 0 7 7 6 28 2 0 8 7
                                                   19 20)))))
           '|lookupComplete|)) 
