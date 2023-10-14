
(/VERSIONCHECK 2) 

(DEFUN |GENEEZ;compBound;BPLNni;1| (|m| |listpolys| $)
  (PROG (#1=#:G128 |normprod| #2=#:G123 #3=#:G122 #4=#:G124 #5=#:G126 #6=#:G138
         |g| #7=#:G139 |df| |nm| #8=#:G120 #9=#:G119 #10=#:G121 #11=#:G137 |u|
         |normlist| #12=#:G116 #13=#:G115 #14=#:G117 #15=#:G136 #16=#:G135 |f|
         #17=#:G134 |n| #18=#:G113 #19=#:G112 #20=#:G114 #21=#:G133 |ldeg|
         #22=#:G132 #23=#:G131)
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
  (PROG (#1=#:G144 #2=#:G143 #3=#:G145 #4=#:G147 #5=#:G146 #6=#:G148 #7=#:G152
         |u| #8=#:G151 |p| #9=#:G141 #10=#:G140 #11=#:G142 #12=#:G150)
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
  (PROG (#1=#:G164)
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
  (PROG (#1=#:G190 |ff| #2=#:G189)
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
  (PROG (#1=#:G194 |fm| #2=#:G193)
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

(DEFUN |GENEEZ;liftSol|
       (|oldsol| |err| |lmod| |lmodk| |lpolys| |ftab| |m| |bound| $)
  (PROG (#1=#:G168 #2=#:G210 |fs| #3=#:G204 #4=#:G203 #5=#:G205 #6=#:G221 |f|
         #7=#:G222 |g| |nsol| #8=#:G220 |slp| #9=#:G219 #10=#:G217 #11=#:G218
         #12=#:G216 |sln| #13=#:G214 |pp| #14=#:G215 #15=#:G213 |cc| |i|
         #16=#:G212 |xx| #17=#:G211 |d|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ G190 NIL
            (SEQ
             (EXIT
              (COND
               ((SPADCALL (SPADCALL |lmodk| (QREFELT $ 12)) |bound|
                          (QREFELT $ 43))
                (PROGN
                 (LETT #2# (CONS 1 "failed") . #18=(|GENEEZ;liftSol|))
                 (GO #2#)))
               ('T
                (SEQ (LETT |d| (SPADCALL |err| (QREFELT $ 9)) . #18#)
                     (LETT |sln|
                           (PROGN
                            (LETT #17# NIL . #18#)
                            (SEQ (LETT |xx| NIL . #18#)
                                 (LETT #16# (SPADCALL |ftab| 1 (QREFELT $ 47))
                                       . #18#)
                                 G190
                                 (COND
                                  ((OR (ATOM #16#)
                                       (PROGN
                                        (LETT |xx| (CAR #16#) . #18#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #17# (CONS (|spadConstant| $ 48) #17#)
                                         . #18#)))
                                 (LETT #16# (CDR #16#) . #18#) (GO G190) G191
                                 (EXIT (NREVERSE #17#))))
                           . #18#)
                     (SEQ (LETT |i| 0 . #18#) G190
                          (COND ((|greater_SI| |i| |d|) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (LETT |cc| (SPADCALL |err| |i| (QREFELT $ 49))
                                     . #18#)
                               (|spadConstant| $ 21) (QREFELT $ 50))
                              (LETT |sln|
                                    (PROGN
                                     (LETT #15# NIL . #18#)
                                     (SEQ (LETT |slp| NIL . #18#)
                                          (LETT #14# |sln| . #18#)
                                          (LETT |pp| NIL . #18#)
                                          (LETT #13#
                                                (SPADCALL |ftab| (+ |i| 1)
                                                          (QREFELT $ 47))
                                                . #18#)
                                          G190
                                          (COND
                                           ((OR (ATOM #13#)
                                                (PROGN
                                                 (LETT |pp| (CAR #13#) . #18#)
                                                 NIL)
                                                (ATOM #14#)
                                                (PROGN
                                                 (LETT |slp| (CAR #14#) . #18#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #15#
                                                  (CONS
                                                   (SPADCALL |slp|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL |cc|
                                                                         (QREFELT
                                                                          $
                                                                          51))
                                                               |lmod|
                                                               (QREFELT $ 41))
                                                              |pp|
                                                              (QREFELT $ 52))
                                                             (QREFELT $ 53))
                                                   #15#)
                                                  . #18#)))
                                          (LETT #13#
                                                (PROG1 (CDR #13#)
                                                  (LETT #14# (CDR #14#)
                                                        . #18#))
                                                . #18#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #15#))))
                                    . #18#)))))
                          (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191
                          (EXIT NIL))
                     (LETT |nsol|
                           (PROGN
                            (LETT #12# NIL . #18#)
                            (SEQ (LETT |g| NIL . #18#) (LETT #11# |sln| . #18#)
                                 (LETT |f| NIL . #18#)
                                 (LETT #10# |oldsol| . #18#) G190
                                 (COND
                                  ((OR (ATOM #10#)
                                       (PROGN (LETT |f| (CAR #10#) . #18#) NIL)
                                       (ATOM #11#)
                                       (PROGN
                                        (LETT |g| (CAR #11#) . #18#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #12#
                                         (CONS
                                          (SPADCALL |f|
                                                    (SPADCALL |lmodk|
                                                              (SPADCALL
                                                               (SPADCALL |g|
                                                                         (QREFELT
                                                                          $
                                                                          42))
                                                               |lmod|
                                                               (QREFELT $ 28))
                                                              (QREFELT $ 36))
                                                    (QREFELT $ 54))
                                          #12#)
                                         . #18#)))
                                 (LETT #10#
                                       (PROG1 (CDR #10#)
                                         (LETT #11# (CDR #11#) . #18#))
                                       . #18#)
                                 (GO G190) G191 (EXIT (NREVERSE #12#))))
                           . #18#)
                     (LETT |lmodk| (SPADCALL |lmod| |lmodk| (QREFELT $ 55))
                           . #18#)
                     (LETT |nsol|
                           (PROGN
                            (LETT #9# NIL . #18#)
                            (SEQ (LETT |slp| NIL . #18#)
                                 (LETT #8# |nsol| . #18#) G190
                                 (COND
                                  ((OR (ATOM #8#)
                                       (PROGN
                                        (LETT |slp| (CAR #8#) . #18#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #9#
                                         (CONS
                                          (SPADCALL |slp| |lmodk|
                                                    (QREFELT $ 28))
                                          #9#)
                                         . #18#)))
                                 (LETT #8# (CDR #8#) . #18#) (GO G190) G191
                                 (EXIT (NREVERSE #9#))))
                           . #18#)
                     (LETT |fs|
                           (PROGN
                            (LETT #3# NIL . #18#)
                            (SEQ (LETT |g| NIL . #18#) (LETT #7# |nsol| . #18#)
                                 (LETT |f| NIL . #18#)
                                 (LETT #6# |lpolys| . #18#) G190
                                 (COND
                                  ((OR (ATOM #6#)
                                       (PROGN (LETT |f| (CAR #6#) . #18#) NIL)
                                       (ATOM #7#)
                                       (PROGN (LETT |g| (CAR #7#) . #18#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #5# (SPADCALL |f| |g| (QREFELT $ 56))
                                          . #18#)
                                    (COND
                                     (#3#
                                      (LETT #4#
                                            (SPADCALL #4# #5# (QREFELT $ 57))
                                            . #18#))
                                     ('T
                                      (PROGN
                                       (LETT #4# #5# . #18#)
                                       (LETT #3# 'T . #18#)))))))
                                 (LETT #6#
                                       (PROG1 (CDR #6#)
                                         (LETT #7# (CDR #7#) . #18#))
                                       . #18#)
                                 (GO G190) G191 (EXIT NIL))
                            (COND (#3# #4#) ('T (|spadConstant| $ 22))))
                           . #18#)
                     (EXIT
                      (COND
                       ((SPADCALL |fs| |m| (QREFELT $ 58))
                        (PROGN (LETT #2# (CONS 0 |nsol|) . #18#) (GO #2#)))
                       ('T
                        (SEQ
                         (LETT |err|
                               (PROG2
                                   (LETT #1#
                                         (SPADCALL
                                          (SPADCALL |fs| |m| (QREFELT $ 54))
                                          |lmodk| (QREFELT $ 60))
                                         . #18#)
                                   (QCDR #1#)
                                 (|check_union| (QEQCAR #1# 0) (QREFELT $ 7)
                                                #1#))
                               . #18#)
                         (EXIT (LETT |oldsol| |nsol| . #18#)))))))))))
            NIL (GO G190) G191 (EXIT NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |GENEEZ;makeProducts| (|listPol| $)
  (PROG (#1=#:G233 |g| #2=#:G232 #3=#:G224 #4=#:G223 #5=#:G225 #6=#:G231
         #7=#:G103 |ll| |f|)
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
                           (LETT #4# (SPADCALL #4# #5# (QREFELT $ 56)) . #9#))
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
                        (LETT #2# (CONS (SPADCALL |f| |g| (QREFELT $ 56)) #2#)
                              . #9#)))
                      (LETT #1# (CDR #1#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))))))))) 

(DEFUN |GENEEZ;testModulus;RLB;13| (|pmod| |listPol| $)
  (PROG (#1=#:G238 #2=#:G242 #3=#:G245 |rpol2| |redListPol| |rpol| #4=#:G235
         #5=#:G243 |pol| #6=#:G244)
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
                             (QREFELT $ 61))
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
                               (SPADCALL |rpol| |rpol2| (QREFELT $ 62))
                               (|spadConstant| $ 44) (QREFELT $ 63))
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
  (PROG (#1=#:G258 |tpol| #2=#:G259 |fpol| #3=#:G257 |i| |x| |ptable| |multiE|)
    (RETURN
     (SEQ
      (LETT |multiE| (SPADCALL |listPol| (|spadConstant| $ 31) (QREFELT $ 67))
            . #4=(|GENEEZ;tablePow;NniRLU;14|))
      (EXIT
       (COND ((QEQCAR |multiE| 1) (CONS 1 "failed"))
             ('T
              (SEQ (LETT |ptable| (MAKEARR1 (+ |mdeg| 1) NIL) . #4#)
                   (SPADCALL |ptable| 1 (QCDR |multiE|) (QREFELT $ 69))
                   (LETT |x| (SPADCALL (|spadConstant| $ 30) 1 (QREFELT $ 70))
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
                                                          (QREFELT $ 71))
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
                                                              (QREFELT $ 56))
                                                    |fpol| (QREFELT $ 72))
                                                   #3#)
                                                  . #4#)))
                                          (LETT #1#
                                                (PROG1 (CDR #1#)
                                                  (LETT #2# (CDR #2#) . #4#))
                                                . #4#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #3#))))
                                    (QREFELT $ 69))))
                        (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                        (EXIT NIL))
                   (SPADCALL |ptable| (+ |mdeg| 1)
                             (|GENEEZ;makeProducts| |listPol| $)
                             (QREFELT $ 69))
                   (EXIT (CONS 0 |ptable|)))))))))) 

(DEFUN |GENEEZ;solveid;BPRVU;15| (|m| |pmod| |table| $)
  (PROG (|sln| #1=#:G271 |pp| #2=#:G272 |slp| #3=#:G270 |i| #4=#:G269 |xx|
         #5=#:G268 |d|)
    (RETURN
     (SEQ
      (LETT |d| (SPADCALL |m| (QREFELT $ 9)) . #6=(|GENEEZ;solveid;BPRVU;15|))
      (LETT |sln|
            (PROGN
             (LETT #5# NIL . #6#)
             (SEQ (LETT |xx| NIL . #6#)
                  (LETT #4# (SPADCALL |table| 1 (QREFELT $ 71)) . #6#) G190
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
              ((SPADCALL (SPADCALL |m| |i| (QREFELT $ 49))
                         (|spadConstant| $ 21) (QREFELT $ 50))
               (LETT |sln|
                     (PROGN
                      (LETT #3# NIL . #6#)
                      (SEQ (LETT |slp| NIL . #6#) (LETT #2# |sln| . #6#)
                           (LETT |pp| NIL . #6#)
                           (LETT #1#
                                 (SPADCALL |table| (+ |i| 1) (QREFELT $ 71))
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
                                                         (QREFELT $ 49))
                                               |pp| (QREFELT $ 36))
                                              (QREFELT $ 57))
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
  (PROG (|ptable| #1=#:G289 |tpol| #2=#:G290 |fpol| #3=#:G288 |i| |x| |fl|
         |ftable| |multiE| |listP| #4=#:G287 |pol| #5=#:G286)
    (RETURN
     (SEQ
      (LETT |listP|
            (PROGN
             (LETT #5# NIL . #6=(|GENEEZ;tablePow;NniRLU;16|))
             (SEQ (LETT |pol| NIL . #6#) (LETT #4# |listPol| . #6#) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |pol| (CAR #4#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #5# (CONS (SPADCALL |pol| |pmod| (QREFELT $ 41)) #5#)
                          . #6#)))
                  (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                  (EXIT (NREVERSE #5#))))
            . #6#)
      (LETT |multiE| (SPADCALL |listP| (|spadConstant| $ 44) (QREFELT $ 77))
            . #6#)
      (EXIT
       (COND ((QEQCAR |multiE| 1) (CONS 1 "failed"))
             ('T
              (SEQ (LETT |ftable| (MAKEARR1 (+ |mdeg| 1) NIL) . #6#)
                   (LETT |fl| (QCDR |multiE|) . #6#)
                   (SPADCALL |ftable| 1 |fl| (QREFELT $ 78))
                   (LETT |x|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 30) 1 (QREFELT $ 70))
                          |pmod| (QREFELT $ 41))
                         . #6#)
                   (SEQ (LETT |i| 2 . #6#) G190
                        (COND ((|greater_SI| |i| |mdeg|) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |ftable| |i|
                                    (PROGN
                                     (LETT #3# NIL . #6#)
                                     (SEQ (LETT |fpol| NIL . #6#)
                                          (LETT #2# |listP| . #6#)
                                          (LETT |tpol| NIL . #6#)
                                          (LETT #1#
                                                (SPADCALL |ftable| (- |i| 1)
                                                          (QREFELT $ 47))
                                                . #6#)
                                          G190
                                          (COND
                                           ((OR (ATOM #1#)
                                                (PROGN
                                                 (LETT |tpol| (CAR #1#) . #6#)
                                                 NIL)
                                                (ATOM #2#)
                                                (PROGN
                                                 (LETT |fpol| (CAR #2#) . #6#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #3#
                                                  (CONS
                                                   (SPADCALL
                                                    (SPADCALL |tpol| |x|
                                                              (QREFELT $ 52))
                                                    |fpol| (QREFELT $ 79))
                                                   #3#)
                                                  . #6#)))
                                          (LETT #1#
                                                (PROG1 (CDR #1#)
                                                  (LETT #2# (CDR #2#) . #6#))
                                                . #6#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #3#))))
                                    (QREFELT $ 78))))
                        (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |ptable|
                         (SPADCALL (CONS (|function| |GENEEZ;coerceLFP|) $)
                                   |ftable| (QREFELT $ 82))
                         . #6#)
                   (SPADCALL |ptable| (+ |mdeg| 1)
                             (|GENEEZ;makeProducts| |listPol| $)
                             (QREFELT $ 69))
                   (EXIT (CONS 0 |ptable|)))))))))) 

(DEFUN |GENEEZ;solveid;BPRVU;17| (|m| |pmod| |table| $)
  (PROG (|a| #1=#:G168 |bound| |fs| #2=#:G297 #3=#:G296 #4=#:G298 #5=#:G309 |f|
         #6=#:G310 |g| |soln| #7=#:G308 |slp| #8=#:G307 |sln| #9=#:G305 |pp|
         #10=#:G306 #11=#:G304 |i| #12=#:G303 |xx| #13=#:G302 |lpolys| |ftab|
         |d|)
    (RETURN
     (SEQ
      (LETT |d| (SPADCALL |m| (QREFELT $ 9)) . #14=(|GENEEZ;solveid;BPRVU;17|))
      (LETT |ftab|
            (SPADCALL (CONS #'|GENEEZ;solveid;BPRVU;17!0| (VECTOR $ |pmod|))
                      |table| (QREFELT $ 85))
            . #14#)
      (LETT |lpolys| (SPADCALL |table| (QVSIZE |table|) (QREFELT $ 71)) . #14#)
      (LETT |sln|
            (PROGN
             (LETT #13# NIL . #14#)
             (SEQ (LETT |xx| NIL . #14#)
                  (LETT #12# (SPADCALL |ftab| 1 (QREFELT $ 47)) . #14#) G190
                  (COND
                   ((OR (ATOM #12#) (PROGN (LETT |xx| (CAR #12#) . #14#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT (LETT #13# (CONS (|spadConstant| $ 48) #13#) . #14#)))
                  (LETT #12# (CDR #12#) . #14#) (GO G190) G191
                  (EXIT (NREVERSE #13#))))
            . #14#)
      (SEQ (LETT |i| 0 . #14#) G190 (COND ((|greater_SI| |i| |d|) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |m| |i| (QREFELT $ 49))
                         (|spadConstant| $ 21) (QREFELT $ 50))
               (LETT |sln|
                     (PROGN
                      (LETT #11# NIL . #14#)
                      (SEQ (LETT |slp| NIL . #14#) (LETT #10# |sln| . #14#)
                           (LETT |pp| NIL . #14#)
                           (LETT #9# (SPADCALL |ftab| (+ |i| 1) (QREFELT $ 47))
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
                                                           (QREFELT $ 49))
                                                 (QREFELT $ 51))
                                                |pmod| (QREFELT $ 41))
                                               |pp| (QREFELT $ 52))
                                              (QREFELT $ 53))
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
                     (LETT #4# (SPADCALL |f| |g| (QREFELT $ 56)) . #14#)
                     (COND
                      (#2# (LETT #3# (SPADCALL #3# #4# (QREFELT $ 57)) . #14#))
                      ('T
                       (PROGN (LETT #3# #4# . #14#) (LETT #2# 'T . #14#)))))))
                  (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #14#))
                        . #14#)
                  (GO G190) G191 (EXIT NIL))
             (COND (#2# #3#) (#15='T (|spadConstant| $ 22))))
            . #14#)
      (EXIT
       (COND ((SPADCALL |fs| |m| (QREFELT $ 58)) (CONS 0 |soln|))
             (#15#
              (SEQ (LETT |bound| (SPADCALL |m| |lpolys| (QREFELT $ 20)) . #14#)
                   (LETT |a|
                         (PROG2
                             (LETT #1#
                                   (SPADCALL (SPADCALL |fs| |m| (QREFELT $ 54))
                                             |pmod| (QREFELT $ 60))
                                   . #14#)
                             (QCDR #1#)
                           (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                         . #14#)
                   (EXIT
                    (|GENEEZ;liftSol| |soln| |a| |pmod| |pmod| |lpolys| |ftab|
                     |m| |bound| $)))))))))) 

(DEFUN |GENEEZ;solveid;BPRVU;17!0| (|x| $$)
  (PROG (|pmod| $)
    (LETT |pmod| (QREFELT $$ 1) . #1=(|GENEEZ;solveid;BPRVU;17|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|GENEEZ;reduceList| |x| |pmod| $))))) 

(DECLAIM (NOTINLINE |GenExEuclid;|)) 

(DEFUN |GenExEuclid| (&REST #1=#:G311)
  (PROG ()
    (RETURN
     (PROG (#2=#:G312)
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
         (QSETREFV $ 74
                   (CONS (|dispatchFunction| |GENEEZ;tablePow;NniRLU;14|) $))
         (QSETREFV $ 76
                   (CONS (|dispatchFunction| |GENEEZ;solveid;BPRVU;15|) $))))
       ('T
        (PROGN
         (QSETREFV $ 74
                   (CONS (|dispatchFunction| |GENEEZ;tablePow;NniRLU;16|) $))
         (QSETREFV $ 76
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
              (120 . |coerce|) (125 . >) (131 . |One|) (|List| 40)
              (|Vector| 45) (135 . |elt|) (141 . |Zero|) (145 . |coefficient|)
              (151 . ~=) (157 . |coerce|) (162 . *) (168 . +) (174 . -)
              (180 . *) (186 . *) (192 . +) (198 . =) (|Union| $ '"failed")
              (204 . |exquo|) (210 . ~=) (216 . |gcd|) (222 . ~=)
              |GENEEZ;testModulus;RLB;13| (|Union| 66 '#1#) (|List| $)
              (228 . |multiEuclidean|) (|Vector| 19) (234 . |setelt|)
              (241 . |monomial|) (247 . |elt|) (253 . |rem|)
              (|Union| 68 '"failed") (259 . |tablePow|) (|Union| 19 '"failed")
              (266 . |solveid|) (273 . |multiEuclidean|) (279 . |setelt|)
              (286 . |rem|) (|Mapping| 19 45) (|VectorFunctions2| 45 19)
              (292 . |map|) (|Mapping| 45 19) (|VectorFunctions2| 19 45)
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
                                                   0 42 2 8 23 0 0 43 0 40 0 44
                                                   2 46 45 0 15 47 0 40 0 48 2
                                                   7 6 0 8 49 2 6 23 0 0 50 1 7
                                                   0 6 51 2 40 0 0 0 52 2 40 0
                                                   0 0 53 2 7 0 0 0 54 2 6 0 0
                                                   0 55 2 7 0 0 0 56 2 7 0 0 0
                                                   57 2 7 23 0 0 58 2 7 59 0 6
                                                   60 2 8 23 0 0 61 2 40 0 0 0
                                                   62 2 40 23 0 0 63 2 7 65 66
                                                   0 67 3 68 19 0 15 19 69 2 7
                                                   0 6 8 70 2 68 19 0 15 71 2 7
                                                   0 0 0 72 3 0 73 8 6 19 74 3
                                                   0 75 7 6 68 76 2 40 65 66 0
                                                   77 3 46 45 0 15 45 78 2 40 0
                                                   0 0 79 2 81 68 80 46 82 2 84
                                                   46 83 68 85 2 0 23 6 19 64 3
                                                   0 73 8 6 19 74 3 0 75 7 6 68
                                                   76 2 0 7 7 6 28 2 0 8 7 19
                                                   20)))))
           '|lookupComplete|)) 
