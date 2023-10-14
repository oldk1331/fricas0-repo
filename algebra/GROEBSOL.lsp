
(/VERSIONCHECK 2) 

(DEFUN |GROEBSOL;testPower| (|uf| |x| |lpol| $)
  (PROG (|g| |linp| |lc| #1=#:G146 |trailp| |gg| |testquo| #2=#:G148 |df|)
    (RETURN
     (SEQ
      (LETT |df| (SPADCALL |uf| (QREFELT $ 12)) . #3=(|GROEBSOL;testPower|))
      (LETT |trailp|
            (SPADCALL |uf|
                      (PROG1 (LETT #2# (- |df| 1) . #3#)
                        (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                         #2#))
                      (QREFELT $ 16))
            . #3#)
      (LETT |testquo|
            (SPADCALL |trailp| (SPADCALL |df| (QREFELT $ 18)) (QREFELT $ 20))
            . #3#)
      (EXIT
       (COND ((QEQCAR |testquo| 1) (CONS 1 "failed"))
             (#4='T
              (SEQ (LETT |trailp| (QCDR |testquo|) . #3#)
                   (LETT |gg|
                         (SPADCALL
                          (LETT |lc| (SPADCALL |uf| (QREFELT $ 21)) . #3#)
                          |trailp| (QREFELT $ 22))
                         . #3#)
                   (LETT |trailp|
                         (PROG2
                             (LETT #1# (SPADCALL |trailp| |gg| (QREFELT $ 23))
                                   . #3#)
                             (QCDR #1#)
                           (|check_union| (QEQCAR #1# 0)
                                          (|DistributedMultivariatePolynomial|
                                           (QREFELT $ 6) (QREFELT $ 7))
                                          #1#))
                         . #3#)
                   (LETT |lc|
                         (PROG2
                             (LETT #1# (SPADCALL |lc| |gg| (QREFELT $ 23))
                                   . #3#)
                             (QCDR #1#)
                           (|check_union| (QEQCAR #1# 0)
                                          (|DistributedMultivariatePolynomial|
                                           (QREFELT $ 6) (QREFELT $ 7))
                                          #1#))
                         . #3#)
                   (LETT |linp|
                         (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 24))
                                   (SPADCALL |trailp| 0 (QREFELT $ 24))
                                   (QREFELT $ 25))
                         . #3#)
                   (LETT |g|
                         (SPADCALL
                          (SPADCALL |uf| (SPADCALL |linp| |df| (QREFELT $ 26))
                                    (QREFELT $ 27))
                          |x| (QREFELT $ 30))
                         . #3#)
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |g| |lpol| (QREFELT $ 33))
                                (|spadConstant| $ 34) (QREFELT $ 36))
                      (CONS 1 "failed"))
                     (#4#
                      (CONS 0 (SPADCALL |linp| |x| (QREFELT $ 30)))))))))))))) 

(DEFUN |GROEBSOL;testGenPos| (|lpol| |lvar| $)
  (PROG (#1=#:G165 |rlvar| |newlpol| |g| |fi| |x| #2=#:G166 |f| |rlpol|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |rlpol| (REVERSE |lpol|) . #3=(|GROEBSOL;testGenPos|))
            (LETT |f| (|SPADfirst| |rlpol|) . #3#)
            (EXIT
             (COND ((EQL (LENGTH |lvar|) 1) (CONS 0 (LIST |f|)))
                   ('T
                    (SEQ (LETT |rlvar| (CDR (REVERSE |lvar|)) . #3#)
                         (LETT |newlpol| (LIST |f|) . #3#)
                         (SEQ (LETT |f| NIL . #3#)
                              (LETT #2# (CDR |rlpol|) . #3#) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
                                (GO G191)))
                              (SEQ (LETT |x| (|SPADfirst| |rlvar|) . #3#)
                                   (LETT |fi| (SPADCALL |f| |x| (QREFELT $ 37))
                                         . #3#)
                                   (EXIT
                                    (COND
                                     ((QEQCAR
                                       (SPADCALL (SPADCALL |fi| (QREFELT $ 21))
                                                 (QREFELT $ 39))
                                       1)
                                      (SEQ
                                       (SEQ
                                        (LETT |g|
                                              (|GROEBSOL;testPower| |fi| |x|
                                               |newlpol| $)
                                              . #3#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR |g| 1)
                                           (PROGN
                                            (LETT #1# (CONS 1 "failed") . #3#)
                                            (GO #1#))))))
                                       (LETT |newlpol|
                                             (CONS
                                              (SPADCALL (QCDR |g|) |newlpol|
                                                        (QREFELT $ 33))
                                              |newlpol|)
                                             . #3#)
                                       (EXIT
                                        (LETT |rlvar| (CDR |rlvar|) . #3#))))
                                     ((SPADCALL
                                       (SPADCALL |f| |newlpol| (QREFELT $ 33))
                                       (|spadConstant| $ 34) (QREFELT $ 36))
                                      (PROGN
                                       (LETT #1# (CONS 1 "failed") . #3#)
                                       (GO #1#))))))
                              (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (CONS 0 |newlpol|))))))))
      #1# (EXIT #1#))))) 

(DEFUN |GROEBSOL;genPos| (|lp| |lvar| $)
  (PROG (#1=#:G153 |testfail| |gb1| |gbt| |gb| #2=#:G185 |p| #3=#:G184 |val|
         #4=#:G171 #5=#:G170 #6=#:G172 #7=#:G182 |vv| #8=#:G183 |rv| |ranvals|
         #9=#:G181 #10=#:G180 |count| |rlvar| |x| |lnp| #11=#:G179 |f|
         #12=#:G178)
    (RETURN
     (SEQ (LETT |rlvar| (REVERSE |lvar|) . #13=(|GROEBSOL;genPos|))
          (LETT |lnp|
                (PROGN
                 (LETT #12# NIL . #13#)
                 (SEQ (LETT |f| NIL . #13#) (LETT #11# |lp| . #13#) G190
                      (COND
                       ((OR (ATOM #11#)
                            (PROGN (LETT |f| (CAR #11#) . #13#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #12# (CONS (SPADCALL |f| (QREFELT $ 42)) #12#)
                              . #13#)))
                      (LETT #11# (CDR #11#) . #13#) (GO G190) G191
                      (EXIT (NREVERSE #12#))))
                . #13#)
          (LETT |x| (|SPADfirst| |rlvar|) . #13#)
          (LETT |rlvar| (CDR |rlvar|) . #13#) (LETT |testfail| 'T . #13#)
          (SEQ (LETT |count| 1 . #13#) G190
               (COND ((NULL |testfail|) (GO G191)))
               (SEQ
                (LETT |ranvals|
                      (PROGN
                       (LETT #10# NIL . #13#)
                       (SEQ (LETT |vv| NIL . #13#) (LETT #9# |rlvar| . #13#)
                            G190
                            (COND
                             ((OR (ATOM #9#)
                                  (PROGN (LETT |vv| (CAR #9#) . #13#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #10#
                                    (CONS
                                     (+ 1 (RANDOM (* |count| (LENGTH |lvar|))))
                                     #10#)
                                    . #13#)))
                            (LETT #9# (CDR #9#) . #13#) (GO G190) G191
                            (EXIT (NREVERSE #10#))))
                      . #13#)
                (LETT |val|
                      (PROGN
                       (LETT #4# NIL . #13#)
                       (SEQ (LETT |rv| NIL . #13#) (LETT #8# |ranvals| . #13#)
                            (LETT |vv| NIL . #13#) (LETT #7# |rlvar| . #13#)
                            G190
                            (COND
                             ((OR (ATOM #7#)
                                  (PROGN (LETT |vv| (CAR #7#) . #13#) NIL)
                                  (ATOM #8#)
                                  (PROGN (LETT |rv| (CAR #8#) . #13#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #6#
                                     (SPADCALL |rv|
                                               (SPADCALL |vv| (QREFELT $ 43))
                                               (QREFELT $ 44))
                                     . #13#)
                               (COND
                                (#4#
                                 (LETT #5# (SPADCALL #5# #6# (QREFELT $ 45))
                                       . #13#))
                                ('T
                                 (PROGN
                                  (LETT #5# #6# . #13#)
                                  (LETT #4# 'T . #13#)))))))
                            (LETT #7#
                                  (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #13#))
                                  . #13#)
                            (GO G190) G191 (EXIT NIL))
                       (COND (#4# #5#) ('T (|spadConstant| $ 46))))
                      . #13#)
                (LETT |val|
                      (SPADCALL |val| (SPADCALL |x| (QREFELT $ 43))
                                (QREFELT $ 45))
                      . #13#)
                (LETT |gb|
                      (PROGN
                       (LETT #3# NIL . #13#)
                       (SEQ (LETT |p| NIL . #13#) (LETT #2# |lnp| . #13#) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |p| (CAR #2#) . #13#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #3#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL |p| |x| (QREFELT $ 47)) |val|
                                      (QREFELT $ 49))
                                     #3#)
                                    . #13#)))
                            (LETT #2# (CDR #2#) . #13#) (GO G190) G191
                            (EXIT (NREVERSE #3#))))
                      . #13#)
                (LETT |gb| (SPADCALL |gb| (QREFELT $ 52)) . #13#)
                (LETT |gbt| (SPADCALL |gb| (QREFELT $ 54)) . #13#)
                (LETT |gb1| (|GROEBSOL;testGenPos| |gbt| |lvar| $) . #13#)
                (EXIT
                 (COND ((QEQCAR |gb1| 1) "try again")
                       ('T (LETT |testfail| 'NIL . #13#)))))
               (LETT |count| (|inc_SI| |count|) . #13#) (GO G190) G191
               (EXIT NIL))
          (EXIT
           (VECTOR |gb| |gbt| |ranvals|
                   (SPADCALL
                    (SPADCALL
                     (PROG2 (LETT #1# |gb1| . #13#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 0)
                                      (|List|
                                       (|DistributedMultivariatePolynomial|
                                        (QREFELT $ 6) (QREFELT $ 7)))
                                      #1#))
                     (QREFELT $ 55))
                    (QREFELT $ 42)))))))) 

(DEFUN |GROEBSOL;genericPosition;LLR;4| (|lp| |lvar| $)
  (PROG (|nans|)
    (RETURN
     (SEQ
      (LETT |nans| (|GROEBSOL;genPos| |lp| |lvar| $)
            |GROEBSOL;genericPosition;LLR;4|)
      (EXIT (CONS (QVELT |nans| 1) (QVELT |nans| 2))))))) 

(DEFUN |GROEBSOL;select| (|lup| $)
  (PROG (#1=#:G191 #2=#:G190 #3=#:G192 #4=#:G197 |lsel| #5=#:G196 #6=#:G195
         |f|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |lup| NIL (QREFELT $ 60)) (SPADCALL NIL (QREFELT $ 61)))
            (#7='T
             (PROGN
              (LETT #1# NIL . #8=(|GROEBSOL;select|))
              (SEQ (LETT |f| NIL . #8#) (LETT #6# (|SPADfirst| |lup|) . #8#)
                   G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |f| (CAR #6#) . #8#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3#
                            (PROGN
                             (LETT #5# NIL . #8#)
                             (SEQ (LETT |lsel| NIL . #8#)
                                  (LETT #4# (|GROEBSOL;select| (CDR |lup|) $)
                                        . #8#)
                                  G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN
                                         (LETT |lsel| (CAR #4#) . #8#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #5# (CONS (CONS |f| |lsel|) #5#)
                                          . #8#)))
                                  (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                                  (EXIT (NREVERSE #5#))))
                            . #8#)
                      (COND (#1# (LETT #2# (APPEND #2# #3#) . #8#))
                            ('T
                             (PROGN
                              (LETT #2# #3# . #8#)
                              (LETT #1# 'T . #8#)))))))
                   (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#7# NIL))))))))) 

(DEFUN |GROEBSOL;findCompon| (|leq| |lvar| $)
  (PROG (#1=#:G222 |ll| #2=#:G221 |ans| #3=#:G220 |p| #4=#:G219 #5=#:G218 |lp|
         #6=#:G217 |val| #7=#:G203 #8=#:G202 #9=#:G204 #10=#:G215 |vv|
         #11=#:G216 |rv| |rlvar| |x| |ranvals| |result| |tlfact| #12=#:G214
         |tfact| |lfact| #13=#:G213 |ff| #14=#:G212 |fg| |g| |lgp| |gp| |teq|)
    (RETURN
     (SEQ
      (LETT |teq| (SPADCALL |leq| (QREFELT $ 54))
            . #15=(|GROEBSOL;findCompon|))
      (EXIT
       (COND ((EQL (LENGTH |teq|) (LENGTH |lvar|)) (LIST |teq|))
             (#16='T
              (SEQ (LETT |gp| (|GROEBSOL;genPos| |teq| |lvar| $) . #15#)
                   (LETT |lgp| (QVELT |gp| 0) . #15#)
                   (LETT |g| (QVELT |gp| 3) . #15#)
                   (LETT |fg| (SPADCALL |g| (QREFELT $ 64)) . #15#)
                   (LETT |lfact|
                         (PROGN
                          (LETT #14# NIL . #15#)
                          (SEQ (LETT |ff| NIL . #15#)
                               (LETT #13# (SPADCALL |fg| (QREFELT $ 67))
                                     . #15#)
                               G190
                               (COND
                                ((OR (ATOM #13#)
                                     (PROGN (LETT |ff| (CAR #13#) . #15#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #14# (CONS (QCAR |ff|) #14#) . #15#)))
                               (LETT #13# (CDR #13#) . #15#) (GO G190) G191
                               (EXIT (NREVERSE #14#))))
                         . #15#)
                   (LETT |result| NIL . #15#)
                   (EXIT
                    (COND ((EQL (LENGTH |lfact|) 1) (LIST |teq|))
                          (#16#
                           (SEQ
                            (SEQ (LETT |tfact| NIL . #15#)
                                 (LETT #12# |lfact| . #15#) G190
                                 (COND
                                  ((OR (ATOM #12#)
                                       (PROGN
                                        (LETT |tfact| (CAR #12#) . #15#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |tlfact| (CONS |tfact| |lgp|) . #15#)
                                  (EXIT
                                   (LETT |result| (CONS |tlfact| |result|)
                                         . #15#)))
                                 (LETT #12# (CDR #12#) . #15#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |ranvals| (QVELT |gp| 2) . #15#)
                            (LETT |rlvar| (REVERSE |lvar|) . #15#)
                            (LETT |x| (|SPADfirst| |rlvar|) . #15#)
                            (LETT |rlvar| (CDR |rlvar|) . #15#)
                            (LETT |val|
                                  (PROGN
                                   (LETT #7# NIL . #15#)
                                   (SEQ (LETT |rv| NIL . #15#)
                                        (LETT #11# |ranvals| . #15#)
                                        (LETT |vv| NIL . #15#)
                                        (LETT #10# |rlvar| . #15#) G190
                                        (COND
                                         ((OR (ATOM #10#)
                                              (PROGN
                                               (LETT |vv| (CAR #10#) . #15#)
                                               NIL)
                                              (ATOM #11#)
                                              (PROGN
                                               (LETT |rv| (CAR #11#) . #15#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (PROGN
                                           (LETT #9#
                                                 (SPADCALL |rv|
                                                           (SPADCALL |vv|
                                                                     (QREFELT $
                                                                              43))
                                                           (QREFELT $ 44))
                                                 . #15#)
                                           (COND
                                            (#7#
                                             (LETT #8#
                                                   (SPADCALL #8# #9#
                                                             (QREFELT $ 45))
                                                   . #15#))
                                            ('T
                                             (PROGN
                                              (LETT #8# #9# . #15#)
                                              (LETT #7# 'T . #15#)))))))
                                        (LETT #10#
                                              (PROG1 (CDR #10#)
                                                (LETT #11# (CDR #11#) . #15#))
                                              . #15#)
                                        (GO G190) G191 (EXIT NIL))
                                   (COND (#7# #8#)
                                         (#16# (|spadConstant| $ 46))))
                                  . #15#)
                            (LETT |val|
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 43)) |val|
                                            (QREFELT $ 68))
                                  . #15#)
                            (LETT |ans|
                                  (PROGN
                                   (LETT #6# NIL . #15#)
                                   (SEQ (LETT |lp| NIL . #15#)
                                        (LETT #5# |result| . #15#) G190
                                        (COND
                                         ((OR (ATOM #5#)
                                              (PROGN
                                               (LETT |lp| (CAR #5#) . #15#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #6#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (PROGN
                                                    (LETT #4# NIL . #15#)
                                                    (SEQ (LETT |p| NIL . #15#)
                                                         (LETT #3# |lp| . #15#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #3#)
                                                               (PROGN
                                                                (LETT |p|
                                                                      (CAR #3#)
                                                                      . #15#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #4#
                                                                 (CONS
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |p| |x|
                                                                    (QREFELT $
                                                                             47))
                                                                   |val|
                                                                   (QREFELT $
                                                                            49))
                                                                  #4#)
                                                                 . #15#)))
                                                         (LETT #3# (CDR #3#)
                                                               . #15#)
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #4#))))
                                                   (QREFELT $ 52))
                                                  (QREFELT $ 54))
                                                 #6#)
                                                . #15#)))
                                        (LETT #5# (CDR #5#) . #15#) (GO G190)
                                        G191 (EXIT (NREVERSE #6#))))
                                  . #15#)
                            (EXIT
                             (PROGN
                              (LETT #2# NIL . #15#)
                              (SEQ (LETT |ll| NIL . #15#)
                                   (LETT #1# |ans| . #15#) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |ll| (CAR #1#) . #15#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((SPADCALL |ll|
                                                 (LIST (|spadConstant| $ 69))
                                                 (QREFELT $ 70))
                                       (LETT #2# (CONS |ll| #2#) . #15#)))))
                                   (LETT #1# (CDR #1#) . #15#) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))))))))))))))) 

(DEFUN |GROEBSOL;zeroDim?| (|lp| |lvar| $)
  (PROG (|lvint1| |x| #1=#:G225 |g| #2=#:G233 |f| |n|)
    (RETURN
     (SEQ
      (COND ((NULL |lp|) 'NIL)
            (#3='T
             (SEQ (LETT |n| (LENGTH |lvar|) . #4=(|GROEBSOL;zeroDim?|))
                  (EXIT
                   (COND ((< (LENGTH |lp|) |n|) 'NIL)
                         (#3#
                          (SEQ (LETT |lvint1| |lvar| . #4#)
                               (SEQ (LETT |f| NIL . #4#) (LETT #2# |lp| . #4#)
                                    G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN
                                           (LETT |f| (CAR #2#) . #4#)
                                           NIL)
                                          (NULL
                                           (COND ((NULL |lvint1|) 'NIL)
                                                 ('T 'T))))
                                      (GO G191)))
                                    (SEQ
                                     (LETT |g|
                                           (SPADCALL |f|
                                                     (SPADCALL |f|
                                                               (QREFELT $ 71))
                                                     (QREFELT $ 68))
                                           . #4#)
                                     (LETT |x|
                                           (PROG2
                                               (LETT #1#
                                                     (SPADCALL |g|
                                                               (QREFELT $ 72))
                                                     . #4#)
                                               (QCDR #1#)
                                             (|check_union| (QEQCAR #1# 0)
                                                            (|OrderedVariableList|
                                                             (QREFELT $ 6))
                                                            #1#))
                                           . #4#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL
                                          (SPADCALL |g| |x| (QREFELT $ 47))
                                          (QREFELT $ 73))
                                         (QREFELT $ 74))
                                        (LETT |lvint1|
                                              (SPADCALL |x| |lvint1|
                                                        (QREFELT $ 75))
                                              . #4#)))))
                                    (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (NULL |lvint1|))))))))))))) 

(DEFUN |GROEBSOL;groebSolve;LLL;8| (|leq| |lvar| $)
  (PROG (|result| |tfact| #1=#:G254 |lfact| #2=#:G253 |ff| #3=#:G252 #4=#:G251
         |llf| #5=#:G250 #6=#:G239 |llfact| |fg| |g| #7=#:G249 |x| |lup|
         |basis| |leq1| |lnp| #8=#:G248 |f| #9=#:G247)
    (RETURN
     (SEQ
      (LETT |lnp|
            (PROGN
             (LETT #9# NIL . #10=(|GROEBSOL;groebSolve;LLL;8|))
             (SEQ (LETT |f| NIL . #10#) (LETT #8# |leq| . #10#) G190
                  (COND
                   ((OR (ATOM #8#) (PROGN (LETT |f| (CAR #8#) . #10#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #9# (CONS (SPADCALL |f| (QREFELT $ 42)) #9#)
                          . #10#)))
                  (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                  (EXIT (NREVERSE #9#))))
            . #10#)
      (LETT |leq1| (SPADCALL |lnp| (QREFELT $ 52)) . #10#)
      (COND
       ((EQL (LENGTH |leq1|) 1)
        (COND
         ((SPADCALL (|SPADfirst| |leq1|) (|spadConstant| $ 76) (QREFELT $ 77))
          (EXIT (SPADCALL NIL (QREFELT $ 79)))))))
      (COND
       ((NULL (|GROEBSOL;zeroDim?| |leq1| |lvar| $))
        (EXIT (|error| "system does not have a finite number of solutions"))))
      (LETT |basis| (SPADCALL |leq1| (QREFELT $ 80)) . #10#)
      (LETT |lup| NIL . #10#) (LETT |llfact| NIL . #10#)
      (SEQ
       (EXIT
        (SEQ (LETT |x| NIL . #10#) (LETT #7# |lvar| . #10#) G190
             (COND
              ((OR (ATOM #7#) (PROGN (LETT |x| (CAR #7#) . #10#) NIL))
               (GO G191)))
             (SEQ
              (LETT |g| (SPADCALL |leq1| |basis| |x| (QREFELT $ 81)) . #10#)
              (LETT |fg| (SPADCALL |g| (QREFELT $ 64)) . #10#)
              (LETT |llfact| (CONS |fg| |llfact|) . #10#)
              (EXIT
               (COND
                ((EQL (SPADCALL |g| |x| (QREFELT $ 82)) (LENGTH |basis|))
                 (PROGN (LETT #6# |$NoValue| . #10#) (GO #6#))))))
             (LETT #7# (CDR #7#) . #10#) (GO G190) G191 (EXIT NIL)))
       #6# (EXIT #6#))
      (LETT |result| NIL . #10#)
      (LETT |lfact|
            (|GROEBSOL;select|
             (PROGN
              (LETT #5# NIL . #10#)
              (SEQ (LETT |llf| NIL . #10#) (LETT #4# |llfact| . #10#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |llf| (CAR #4#) . #10#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #5#
                           (CONS
                            (PROGN
                             (LETT #3# NIL . #10#)
                             (SEQ (LETT |ff| NIL . #10#)
                                  (LETT #2# (SPADCALL |llf| (QREFELT $ 67))
                                        . #10#)
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN
                                         (LETT |ff| (CAR #2#) . #10#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3# (CONS (QCAR |ff|) #3#) . #10#)))
                                  (LETT #2# (CDR #2#) . #10#) (GO G190) G191
                                  (EXIT (NREVERSE #3#))))
                            #5#)
                           . #10#)))
                   (LETT #4# (CDR #4#) . #10#) (GO G190) G191
                   (EXIT (NREVERSE #5#))))
             $)
            . #10#)
      (SEQ (LETT |tfact| NIL . #10#) (LETT #1# |lfact| . #10#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |tfact| (CAR #1#) . #10#) NIL))
             (GO G191)))
           (SEQ
            (LETT |tfact|
                  (SPADCALL (SPADCALL |tfact| |leq1| (QREFELT $ 83))
                            (QREFELT $ 52))
                  . #10#)
            (EXIT
             (COND
              ((SPADCALL |tfact| (LIST (|spadConstant| $ 76)) (QREFELT $ 84))
               "next value")
              ('T
               (LETT |result|
                     (SPADCALL |result|
                               (|GROEBSOL;findCompon| |tfact| |lvar| $)
                               (QREFELT $ 85))
                     . #10#)))))
           (LETT #1# (CDR #1#) . #10#) (GO G190) G191 (EXIT NIL))
      (EXIT |result|))))) 

(DEFUN |GROEBSOL;testDim;LLU;9| (|leq| |lvar| $)
  (PROG (|leq1|)
    (RETURN
     (SEQ
      (LETT |leq1| (SPADCALL |leq| (QREFELT $ 52)) |GROEBSOL;testDim;LLU;9|)
      (COND
       ((EQL (LENGTH |leq1|) 1)
        (COND
         ((SPADCALL (|SPADfirst| |leq1|) (|spadConstant| $ 76) (QREFELT $ 77))
          (EXIT (CONS 0 NIL))))))
      (COND
       ((NULL (|GROEBSOL;zeroDim?| |leq1| |lvar| $)) (EXIT (CONS 1 "failed"))))
      (EXIT (CONS 0 |leq1|)))))) 

(DECLAIM (NOTINLINE |GroebnerSolve;|)) 

(DEFUN |GroebnerSolve| (&REST #1=#:G266)
  (PROG ()
    (RETURN
     (PROG (#2=#:G267)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|GroebnerSolve|)
                                           '|domainEqualList|)
                . #3=(|GroebnerSolve|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |GroebnerSolve;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|GroebnerSolve|))))))))))) 

(DEFUN |GroebnerSolve;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|GroebnerSolve|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|GroebnerSolve| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 89) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|GroebnerSolve| (LIST DV$1 DV$2 DV$3)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (LENGTH |#1|))
      $)))) 

(MAKEPROP '|GroebnerSolve| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|nv| (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 15) (0 . |degree|) (5 . |One|)
              (9 . |One|) (|DistributedMultivariatePolynomial| 6 7)
              (13 . |coefficient|) (|Integer|) (19 . |coerce|)
              (|Union| $ '"failed") (24 . |exquo|) (30 . |leadingCoefficient|)
              (35 . |gcd|) (41 . |exquo|) (47 . |monomial|) (53 . +) (59 . ^)
              (65 . -) (|SparseUnivariatePolynomial| $)
              (|OrderedVariableList| 6) (71 . |multivariate|) (|List| 15)
              (|GroebnerInternalPackage| 7
                                         (|DirectProduct|
                                          (NRTEVAL (LENGTH (QREFELT $ 6))) 10)
                                         29 15)
              (77 . |redPol|) (83 . |Zero|) (|Boolean|) (87 . ~=)
              (93 . |univariate|) (|Union| 29 '"failed") (99 . |mainVariable|)
              (|HomogeneousDistributedMultivariatePolynomial| 6 7)
              (|PolToPol| 6 7) (104 . |dmpToHdmp|) (109 . |coerce|) (114 . *)
              (120 . +) (126 . |Zero|) (130 . |univariate|)
              (|SparseUnivariatePolynomial| 40) (136 . |elt|) (|List| 40)
              (|GroebnerPackage| 7
                                 (|HomogeneousDirectProduct|
                                  (NRTEVAL (LENGTH (QREFELT $ 6))) 10)
                                 29 40)
              (142 . |groebner|) (|LinGroebnerPackage| 6 7) (147 . |totolex|)
              (152 . |last|)
              (|Record| (|:| |dpolys| 31) (|:| |coords| (|List| 17)))
              (|List| 29) |GROEBSOL;genericPosition;LLR;4| (|List| 50)
              (157 . =) (163 . |list|) (|Factored| 40)
              (|GeneralizedMultivariateFactorize| 29
                                                  (|HomogeneousDirectProduct|
                                                   (NRTEVAL
                                                    (LENGTH (QREFELT $ 6)))
                                                   10)
                                                  8 7 40)
              (168 . |factor|) (|Record| (|:| |factor| 40) (|:| |exponent| 17))
              (|List| 65) (173 . |factors|) (178 . -) (184 . |One|) (188 . ~=)
              (194 . |reductum|) (199 . |mainVariable|)
              (204 . |leadingCoefficient|) (209 . |ground?|) (214 . |remove|)
              (220 . |One|) (224 . =) (|List| 31) (230 . |list|)
              (235 . |computeBasis|) (240 . |minPol|) (247 . |degree|)
              (253 . |concat|) (259 . =) (265 . |concat|)
              |GROEBSOL;groebSolve;LLL;8| (|Union| 50 '"failed")
              |GROEBSOL;testDim;LLU;9|)
           '#(|testDim| 271 |groebSolve| 277 |genericPosition| 283) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 88
                                                 '(1 11 10 0 12 0 7 0 13 0 8 0
                                                   14 2 11 15 0 10 16 1 7 0 17
                                                   18 2 15 19 0 7 20 1 11 15 0
                                                   21 2 15 0 0 0 22 2 15 19 0 0
                                                   23 2 11 0 15 10 24 2 11 0 0
                                                   0 25 2 11 0 0 10 26 2 11 0 0
                                                   0 27 2 15 0 28 29 30 2 32 15
                                                   15 31 33 0 15 0 34 2 15 35 0
                                                   0 36 2 15 28 0 29 37 1 15 38
                                                   0 39 1 41 40 15 42 1 40 0 29
                                                   43 2 40 0 17 0 44 2 40 0 0 0
                                                   45 0 40 0 46 2 40 28 0 29 47
                                                   2 48 40 0 40 49 1 51 50 50
                                                   52 1 53 31 50 54 1 31 15 0
                                                   55 2 59 35 0 0 60 1 59 0 50
                                                   61 1 63 62 40 64 1 62 66 0
                                                   67 2 40 0 0 0 68 0 15 0 69 2
                                                   31 35 0 0 70 1 40 0 0 71 1
                                                   40 38 0 72 1 48 40 0 73 1 40
                                                   35 0 74 2 57 0 29 0 75 0 40
                                                   0 76 2 40 35 0 0 77 1 78 0
                                                   31 79 1 53 50 50 80 3 53 40
                                                   50 50 29 81 2 40 10 0 29 82
                                                   2 50 0 0 0 83 2 50 35 0 0 84
                                                   2 78 0 0 0 85 2 0 87 50 57
                                                   88 2 0 78 31 57 86 2 0 56 31
                                                   57 58)))))
           '|lookupComplete|)) 
