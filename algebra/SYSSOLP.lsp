
(/VERSIONCHECK 2) 

(DEFUN |SYSSOLP;makeR2F| (|r| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 8)) (QREFELT $ 10))) 

(DEFUN |SYSSOLP;makeP2F| (|p| $)
  (PROG (#1=#:G148 |v| |lv|)
    (RETURN
     (SEQ (LETT |lv| (SPADCALL |p| (QREFELT $ 13)) . #2=(|SYSSOLP;makeP2F|))
          (EXIT
           (COND
            ((SPADCALL |lv| NIL (QREFELT $ 15)) (SPADCALL |p| (QREFELT $ 16)))
            ('T
             (SEQ
              (SEQ (LETT |v| NIL . #2#) (LETT #1# |lv| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT (LETT |p| (SPADCALL |p| |v| (QREFELT $ 19)) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |p| (QREFELT $ 16))))))))))) 

(DEFUN |SYSSOLP;makeEq| (|p| |lv| $)
  (PROG (|up| #1=#:G150 #2=#:G153 |x| |lx| |np| |z|)
    (RETURN
     (SEQ (LETT |z| (SPADCALL |lv| (QREFELT $ 20)) . #3=(|SYSSOLP;makeEq|))
          (LETT |np| (SPADCALL (|SYSSOLP;makeP2F| |p| $) (QREFELT $ 21)) . #3#)
          (LETT |lx| (SPADCALL |np| (QREFELT $ 22)) . #3#)
          (SEQ
           (EXIT
            (SEQ (LETT |x| NIL . #3#) (LETT #2# |lv| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |x| |lx| (QREFELT $ 23))
                     (PROGN (LETT #1# |x| . #3#) (GO #1#))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL)))
           #1# (EXIT #1#))
          (LETT |up| (SPADCALL |np| |x| (QREFELT $ 25)) . #3#)
          (EXIT
           (COND
            ((EQL (SPADCALL |up| (QREFELT $ 28)) 1)
             (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 30)) (QREFELT $ 10))
                       (SPADCALL
                        (SPADCALL (SPADCALL |up| 0 (QREFELT $ 33))
                                  (SPADCALL |up| (QREFELT $ 34))
                                  (QREFELT $ 35))
                        (QREFELT $ 36))
                       (QREFELT $ 38)))
            ('T
             (SPADCALL (SPADCALL |np| (QREFELT $ 10)) (|spadConstant| $ 32)
                       (QREFELT $ 38))))))))) 

(DEFUN |SYSSOLP;varInF| (|v| $)
  (SPADCALL (SPADCALL |v| (QREFELT $ 30)) (QREFELT $ 10))) 

(DEFUN |SYSSOLP;newInF| (|n| $) (|SYSSOLP;varInF| (SPADCALL (QREFELT $ 39)) $)) 

(DEFUN |SYSSOLP;testDegree| (|f| |lv| $)
  (PROG (#1=#:G157 #2=#:G156 #3=#:G158 #4=#:G160 |vv|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|SYSSOLP;testDegree|))
       (SEQ (LETT |vv| NIL . #5#) (LETT #4# |lv| . #5#) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |vv| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (SPADCALL |f| |vv| (QREFELT $ 40)) 0
                               (QREFELT $ 41))
                     . #5#)
               (COND (#1# (LETT #2# (COND (#2# 'T) ('T #3#)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T 'NIL))))))) 

(DEFUN |SYSSOLP;triangularSystems;LLL;7| (|lf| |lv| $)
  (PROG (#1=#:G197 |pf| #2=#:G196 #3=#:G195 |pr| #4=#:G194 |parRes| #5=#:G171
         #6=#:G170 #7=#:G172 #8=#:G193 |fq| #9=#:G192 #10=#:G191 |gb| |lp|
         #11=#:G190 |f| #12=#:G189 |lq| |df| #13=#:G188 #14=#:G187 |lvv|
         #15=#:G165 #16=#:G186 |vv| #17=#:G185 |push| DP OV |dmp| #18=#:G184
         |ff| #19=#:G183 |fp| |p|)
    (RETURN
     (SEQ
      (COND ((OR (NULL |lv|) (NULL |lf|)) NIL)
            ((EQL (LENGTH |lf|) 1)
             (SEQ
              (LETT |p| (SPADCALL (|SPADfirst| |lf|) (QREFELT $ 21))
                    . #20=(|SYSSOLP;triangularSystems;LLL;7|))
              (LETT |fp| (SPADCALL |p| (QREFELT $ 44)) . #20#)
              (EXIT
               (PROGN
                (LETT #19# NIL . #20#)
                (SEQ (LETT |ff| NIL . #20#)
                     (LETT #18# (SPADCALL |fp| (QREFELT $ 47)) . #20#) G190
                     (COND
                      ((OR (ATOM #18#)
                           (PROGN (LETT |ff| (CAR #18#) . #20#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((|SYSSOLP;testDegree| (QCAR |ff|) |lv| $)
                         (LETT #19# (CONS (LIST (QCAR |ff|)) #19#) . #20#)))))
                     (LETT #18# (CDR #18#) . #20#) (GO G190) G191
                     (EXIT (NREVERSE #19#)))))))
            (#21='T
             (SEQ
              (LETT |dmp|
                    (|DistributedMultivariatePolynomial| |lv|
                                                         (|Polynomial|
                                                          (QREFELT $ 6)))
                    . #20#)
              (LETT OV (|OrderedVariableList| |lv|) . #20#)
              (LETT DP (|DirectProduct| (LENGTH |lv|) (|NonNegativeInteger|))
                    . #20#)
              (LETT |push| (|PushVariables| (QREFELT $ 6) DP OV |dmp|) . #20#)
              (LETT |lvv|
                    (PROGN
                     (LETT #17# NIL . #20#)
                     (SEQ (LETT |vv| NIL . #20#) (LETT #16# |lv| . #20#) G190
                          (COND
                           ((OR (ATOM #16#)
                                (PROGN (LETT |vv| (CAR #16#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #17#
                                  (CONS
                                   (PROG2
                                       (LETT #15#
                                             (SPADCALL |vv|
                                                       (|compiledLookupCheck|
                                                        '|variable|
                                                        (LIST
                                                         (LIST '|Union| '$
                                                               '"failed")
                                                         (LIST '|Symbol|))
                                                        OV))
                                             . #20#)
                                       (QCDR #15#)
                                     (|check_union| (QEQCAR #15# 0) OV #15#))
                                   #17#)
                                  . #20#)))
                          (LETT #16# (CDR #16#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #17#))))
                    . #20#)
              (LETT |lq|
                    (PROGN
                     (LETT #14# NIL . #20#)
                     (SEQ (LETT |f| NIL . #20#) (LETT #13# |lf| . #20#) G190
                          (COND
                           ((OR (ATOM #13#)
                                (PROGN (LETT |f| (CAR #13#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (LETT |df| (SPADCALL |f| (QREFELT $ 48)) . #20#)
                               (|spadConstant| $ 49) (QREFELT $ 50))
                              (LETT #14#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL |df|
                                                (|compiledLookupCheck|
                                                 '|coerce|
                                                 (LIST '$
                                                       (LIST '|Polynomial|
                                                             (|devaluate|
                                                              (ELT $ 6))))
                                                 |dmp|))
                                      |lvv|
                                      (|compiledLookupCheck| '|pushup|
                                                             (LIST
                                                              (|devaluate|
                                                               |dmp|)
                                                              (|devaluate|
                                                               |dmp|)
                                                              (LIST '|List|
                                                                    (|devaluate|
                                                                     OV)))
                                                             |push|))
                                     #14#)
                                    . #20#)))))
                          (LETT #13# (CDR #13#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #14#))))
                    . #20#)
              (LETT |lp|
                    (PROGN
                     (LETT #12# NIL . #20#)
                     (SEQ (LETT |f| NIL . #20#) (LETT #11# |lf| . #20#) G190
                          (COND
                           ((OR (ATOM #11#)
                                (PROGN (LETT |f| (CAR #11#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #12#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |f| (QREFELT $ 21))
                                              (|compiledLookupCheck| '|coerce|
                                                                     (LIST '$
                                                                           (LIST
                                                                            '|Polynomial|
                                                                            (|devaluate|
                                                                             (ELT
                                                                              $
                                                                              6))))
                                                                     |dmp|))
                                    |lvv|
                                    (|compiledLookupCheck| '|pushup|
                                                           (LIST
                                                            (|devaluate| |dmp|)
                                                            (|devaluate| |dmp|)
                                                            (LIST '|List|
                                                                  (|devaluate|
                                                                   OV)))
                                                           |push|))
                                   #12#)
                                  . #20#)))
                          (LETT #11# (CDR #11#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #12#))))
                    . #20#)
              (LETT |parRes|
                    (SPADCALL |lp| |lvv|
                              (|compiledLookupCheck| '|groebSolve|
                                                     (LIST
                                                      (LIST '|List|
                                                            (LIST '|List|
                                                                  (LIST
                                                                   '|DistributedMultivariatePolynomial|
                                                                   |lv|
                                                                   (LIST
                                                                    '|Polynomial|
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          6))))))
                                                      (LIST '|List|
                                                            (LIST
                                                             '|DistributedMultivariatePolynomial|
                                                             |lv|
                                                             (LIST
                                                              '|Polynomial|
                                                              (|devaluate|
                                                               (ELT $ 6)))))
                                                      (LIST '|List|
                                                            (LIST
                                                             '|OrderedVariableList|
                                                             |lv|)))
                                                     (|GroebnerSolve| |lv|
                                                                      (|Polynomial|
                                                                       (ELT $
                                                                            6))
                                                                      (ELT $
                                                                           6))))
                    . #20#)
              (COND
               ((SPADCALL |lq| NIL
                          (|compiledLookupCheck| '~=
                                                 (LIST (LIST '|Boolean|) '$ '$)
                                                 (|List| |dmp|)))
                (SEQ
                 (LETT |gb|
                       (|GroebnerInternalPackage| (|Polynomial| (QREFELT $ 6))
                                                  (|DirectProduct|
                                                   (LENGTH |lv|)
                                                   (|NonNegativeInteger|))
                                                  OV |dmp|)
                       . #20#)
                 (EXIT
                  (LETT |parRes|
                        (PROGN
                         (LETT #10# NIL . #20#)
                         (SEQ (LETT |pr| NIL . #20#) (LETT #9# |parRes| . #20#)
                              G190
                              (COND
                               ((OR (ATOM #9#)
                                    (PROGN (LETT |pr| (CAR #9#) . #20#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((PROGN
                                   (LETT #5# NIL . #20#)
                                   (SEQ (LETT |fq| NIL . #20#)
                                        (LETT #8# |lq| . #20#) G190
                                        (COND
                                         ((OR (ATOM #8#)
                                              (PROGN
                                               (LETT |fq| (CAR #8#) . #20#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (PROGN
                                           (LETT #7#
                                                 (SPADCALL
                                                  (SPADCALL |fq| |pr|
                                                            (|compiledLookupCheck|
                                                             '|redPol|
                                                             (LIST
                                                              (|devaluate|
                                                               |dmp|)
                                                              (|devaluate|
                                                               |dmp|)
                                                              (LIST '|List|
                                                                    (|devaluate|
                                                                     |dmp|)))
                                                             |gb|))
                                                  (SPADCALL
                                                   (|compiledLookupCheck|
                                                    '|Zero| (LIST '$) |dmp|))
                                                  (|compiledLookupCheck| '~=
                                                                         (LIST
                                                                          (LIST
                                                                           '|Boolean|)
                                                                          '$
                                                                          '$)
                                                                         |dmp|))
                                                 . #20#)
                                           (COND
                                            (#5#
                                             (LETT #6#
                                                   (COND (#6# #7#) ('T 'NIL))
                                                   . #20#))
                                            ('T
                                             (PROGN
                                              (LETT #6# #7# . #20#)
                                              (LETT #5# 'T . #20#)))))))
                                        (LETT #8# (CDR #8#) . #20#) (GO G190)
                                        G191 (EXIT NIL))
                                   (COND (#5# #6#) (#21# 'T)))
                                  (LETT #10# (CONS |pr| #10#) . #20#)))))
                              (LETT #9# (CDR #9#) . #20#) (GO G190) G191
                              (EXIT (NREVERSE #10#))))
                        . #20#)))))
              (EXIT
               (PROGN
                (LETT #4# NIL . #20#)
                (SEQ (LETT |pr| NIL . #20#) (LETT #3# |parRes| . #20#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |pr| (CAR #3#) . #20#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #4#
                             (CONS
                              (PROGN
                               (LETT #2# NIL . #20#)
                               (SEQ (LETT |pf| NIL . #20#)
                                    (LETT #1# |pr| . #20#) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |pf| (CAR #1#) . #20#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL |pf| |lvv|
                                                        (|compiledLookupCheck|
                                                         '|pushdown|
                                                         (LIST
                                                          (|devaluate| |dmp|)
                                                          (|devaluate| |dmp|)
                                                          (LIST '|List|
                                                                (|devaluate|
                                                                 OV)))
                                                         |push|))
                                              (|compiledLookupCheck| '|retract|
                                                                     (LIST
                                                                      (LIST
                                                                       '|Polynomial|
                                                                       (|devaluate|
                                                                        (ELT $
                                                                             6)))
                                                                      '$)
                                                                     |dmp|))
                                             #2#)
                                            . #20#)))
                                    (LETT #1# (CDR #1#) . #20#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              #4#)
                             . #20#)))
                     (LETT #3# (CDR #3#) . #20#) (GO G190) G191
                     (EXIT (NREVERSE #4#)))))))))))) 

(DEFUN |SYSSOLP;solve;FL;8| (|pol| $)
  (PROG (|lv|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |pol| (QREFELT $ 54))
        (|error| "equation is always satisfied"))
       (#1='T
        (SEQ
         (LETT |lv|
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |pol| (QREFELT $ 21)) (QREFELT $ 22))
                 (SPADCALL (SPADCALL |pol| (QREFELT $ 48)) (QREFELT $ 22))
                 (QREFELT $ 55))
                (QREFELT $ 56))
               |SYSSOLP;solve;FL;8|)
         (EXIT
          (COND ((NULL |lv|) (|error| "inconsistent equation"))
                ((SPADCALL (LENGTH |lv|) 1 (QREFELT $ 41))
                 (|error| "too many variables"))
                (#1#
                 (SPADCALL |pol| (|SPADfirst| |lv|) (QREFELT $ 58)))))))))))) 

(DEFUN |SYSSOLP;solve;EL;9| (|eq| $)
  (PROG (|lv| |pol|)
    (RETURN
     (SEQ
      (LETT |pol|
            (SPADCALL (SPADCALL |eq| (QREFELT $ 60))
                      (SPADCALL |eq| (QREFELT $ 61)) (QREFELT $ 62))
            . #1=(|SYSSOLP;solve;EL;9|))
      (EXIT
       (COND
        ((SPADCALL |pol| (QREFELT $ 54))
         (|error| "equation is always satisfied"))
        (#2='T
         (SEQ
          (LETT |lv|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |pol| (QREFELT $ 21)) (QREFELT $ 22))
                  (SPADCALL (SPADCALL |pol| (QREFELT $ 48)) (QREFELT $ 22))
                  (QREFELT $ 55))
                 (QREFELT $ 56))
                . #1#)
          (EXIT
           (COND ((NULL |lv|) (|error| "inconsistent equation"))
                 ((SPADCALL (LENGTH |lv|) 1 (QREFELT $ 41))
                  (|error| "too many variables"))
                 (#2#
                  (SPADCALL |pol| (|SPADfirst| |lv|) (QREFELT $ 58))))))))))))) 

(DEFUN |SYSSOLP;solve;ESL;10| (|eq| |var| $)
  (SPADCALL
   (SPADCALL (SPADCALL |eq| (QREFELT $ 60)) (SPADCALL |eq| (QREFELT $ 61))
             (QREFELT $ 62))
   |var| (QREFELT $ 58))) 

(DEFUN |SYSSOLP;solve;FSL;11| (|pol| |var| $)
  (PROG (#1=#:G213 |ff| #2=#:G212 |fp| |p|)
    (RETURN
     (SEQ
      (COND
       ((|HasCategory| (QREFELT $ 6) '(|GcdDomain|))
        (SEQ
         (LETT |p|
               (SPADCALL (SPADCALL |pol| (QREFELT $ 21)) |var| (QREFELT $ 65))
               . #3=(|SYSSOLP;solve;FSL;11|))
         (LETT |fp| (SPADCALL |p| (QREFELT $ 44)) . #3#)
         (EXIT
          (PROGN
           (LETT #2# NIL . #3#)
           (SEQ (LETT |ff| NIL . #3#)
                (LETT #1# (SPADCALL |fp| (QREFELT $ 47)) . #3#) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |ff| (CAR #1#) . #3#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #2#
                        (CONS
                         (|SYSSOLP;makeEq|
                          (SPADCALL (CONS (|function| |SYSSOLP;makeR2F|) $)
                                    (QCAR |ff|) (QREFELT $ 68))
                          (LIST |var|) $)
                         #2#)
                        . #3#)))
                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                (EXIT (NREVERSE #2#)))))))
       ('T NIL)))))) 

(DEFUN |SYSSOLP;makePolys| (|l| $)
  (PROG (#1=#:G217 |e| #2=#:G216)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|SYSSOLP;makePolys|))
       (SEQ (LETT |e| NIL . #3#) (LETT #1# |l| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2#
                    (CONS
                     (SPADCALL (SPADCALL |e| (QREFELT $ 60))
                               (SPADCALL |e| (QREFELT $ 61)) (QREFELT $ 62))
                     #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |SYSSOLP;linSolve| (|lp| |lv| $)
  (PROG (|eqs| #1=#:G237 |i| #2=#:G236 |sym| #3=#:G235 |p| |zeron| |rhs|
         #4=#:G224 |rec| |lr| #5=#:G234 |f| #6=#:G233)
    (RETURN
     (SEQ
      (LETT |lr|
            (PROGN
             (LETT #6# NIL . #7=(|SYSSOLP;linSolve|))
             (SEQ (LETT |f| NIL . #7#) (LETT #5# |lp| . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #6# (CONS (SPADCALL |f| (QREFELT $ 21)) #6#) . #7#)))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            . #7#)
      (LETT |rec| (SPADCALL |lr| |lv| (QREFELT $ 73)) . #7#)
      (EXIT
       (COND ((QEQCAR (QCAR |rec|) 1) (CONS 1 "failed"))
             ('T
              (SEQ
               (LETT |rhs|
                     (PROG2 (LETT #4# (QCAR |rec|) . #7#)
                         (QCDR #4#)
                       (|check_union| (QEQCAR #4# 0)
                                      (|Vector|
                                       (|Fraction|
                                        (|Polynomial| (QREFELT $ 6))))
                                      #4#))
                     . #7#)
               (LETT |zeron| (SPADCALL (LENGTH |lv|) (QREFELT $ 75)) . #7#)
               (SEQ (LETT |p| NIL . #7#) (LETT #3# (QCDR |rec|) . #7#) G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #7#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL |p| |zeron| (QREFELT $ 76))
                        (SEQ (LETT |sym| (|SYSSOLP;newInF| 1 $) . #7#)
                             (EXIT
                              (SEQ (LETT |i| 1 . #7#)
                                   (LETT #2# (LENGTH |lv|) . #7#) G190
                                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |rhs| |i|
                                               (SPADCALL
                                                (SPADCALL |rhs| |i|
                                                          (QREFELT $ 78))
                                                (SPADCALL |sym|
                                                          (SPADCALL |p| |i|
                                                                    (QREFELT $
                                                                             78))
                                                          (QREFELT $ 79))
                                                (QREFELT $ 80))
                                               (QREFELT $ 81))))
                                   (LETT |i| (|inc_SI| |i|) . #7#) (GO G190)
                                   G191 (EXIT NIL))))))))
                    (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
               (LETT |eqs| NIL . #7#)
               (SEQ (LETT |i| 1 . #7#) (LETT #1# (LENGTH |lv|) . #7#) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT |eqs|
                            (APPEND |eqs|
                                    (LIST
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |lv| |i| (QREFELT $ 82))
                                        (QREFELT $ 30))
                                       (QREFELT $ 10))
                                      (SPADCALL |rhs| |i| (QREFELT $ 78))
                                      (QREFELT $ 83))))
                            . #7#)))
                    (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
               (EXIT (CONS 0 |eqs|)))))))))) 

(DEFUN |SYSSOLP;solve;LL;14| (|lr| $)
  (PROG (|lv| #1=#:G239 #2=#:G238 #3=#:G240 #4=#:G243 |p|)
    (RETURN
     (SEQ
      (LETT |lv|
            (PROGN
             (LETT #1# NIL . #5=(|SYSSOLP;solve;LL;14|))
             (SEQ (LETT |p| NIL . #5#) (LETT #4# |lr| . #5#) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #3#
                           (SPADCALL
                            (SPADCALL (SPADCALL |p| (QREFELT $ 21))
                                      (QREFELT $ 22))
                            (SPADCALL (SPADCALL |p| (QREFELT $ 48))
                                      (QREFELT $ 22))
                            (QREFELT $ 84))
                           . #5#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 84)) . #5#))
                      ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                  (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) ('T (|IdentityError| '|setUnion|))))
            . #5#)
      (EXIT (SPADCALL |lr| |lv| (QREFELT $ 86))))))) 

(DEFUN |SYSSOLP;solve;LL;15| (|le| $)
  (PROG (|lv| #1=#:G245 #2=#:G244 #3=#:G246 #4=#:G249 |p| |lr|)
    (RETURN
     (SEQ (LETT |lr| (|SYSSOLP;makePolys| |le| $) . #5=(|SYSSOLP;solve;LL;15|))
          (LETT |lv|
                (PROGN
                 (LETT #1# NIL . #5#)
                 (SEQ (LETT |p| NIL . #5#) (LETT #4# |lr| . #5#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3#
                               (SPADCALL
                                (SPADCALL (SPADCALL |p| (QREFELT $ 21))
                                          (QREFELT $ 22))
                                (SPADCALL (SPADCALL |p| (QREFELT $ 48))
                                          (QREFELT $ 22))
                                (QREFELT $ 84))
                               . #5#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 84)) . #5#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #5#)
                            (LETT #1# 'T . #5#)))))))
                      (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|IdentityError| '|setUnion|))))
                . #5#)
          (EXIT (SPADCALL |lr| |lv| (QREFELT $ 86))))))) 

(DEFUN |SYSSOLP;solve;LLL;16| (|le| |lv| $)
  (SPADCALL (|SYSSOLP;makePolys| |le| $) |lv| (QREFELT $ 86))) 

(DEFUN |SYSSOLP;checkLinear| (|lr| |vl| $)
  (PROG (#1=#:G258 #2=#:G257 #3=#:G259 #4=#:G266 |pol| #5=#:G261 #6=#:G253
         #7=#:G252 #8=#:G254 #9=#:G265 |x| #10=#:G264 |f| |ld| #11=#:G263
         #12=#:G262)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ld|
              (PROGN
               (LETT #12# NIL . #13=(|SYSSOLP;checkLinear|))
               (SEQ (LETT |pol| NIL . #13#) (LETT #11# |lr| . #13#) G190
                    (COND
                     ((OR (ATOM #11#)
                          (PROGN (LETT |pol| (CAR #11#) . #13#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #12# (CONS (SPADCALL |pol| (QREFELT $ 48)) #12#)
                            . #13#)))
                    (LETT #11# (CDR #11#) . #13#) (GO G190) G191
                    (EXIT (NREVERSE #12#))))
              . #13#)
        (SEQ (LETT |f| NIL . #13#) (LETT #10# |ld| . #13#) G190
             (COND
              ((OR (ATOM #10#) (PROGN (LETT |f| (CAR #10#) . #13#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((PROGN
                  (LETT #6# NIL . #13#)
                  (SEQ (LETT |x| NIL . #13#)
                       (LETT #9# (SPADCALL |f| (QREFELT $ 22)) . #13#) G190
                       (COND
                        ((OR (ATOM #9#)
                             (PROGN (LETT |x| (CAR #9#) . #13#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #8# (SPADCALL |x| |vl| (QREFELT $ 23)) . #13#)
                          (COND
                           (#6# (LETT #7# (COND (#7# 'T) ('T #8#)) . #13#))
                           ('T
                            (PROGN
                             (LETT #7# #8# . #13#)
                             (LETT #6# 'T . #13#)))))))
                       (LETT #9# (CDR #9#) . #13#) (GO G190) G191 (EXIT NIL))
                  (COND (#6# #7#) ('T 'NIL)))
                 (PROGN (LETT #5# 'NIL . #13#) (GO #5#))))))
             (LETT #10# (CDR #10#) . #13#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (PROGN
          (LETT #1# NIL . #13#)
          (SEQ (LETT |pol| NIL . #13#) (LETT #4# |lr| . #13#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |pol| (CAR #4#) . #13#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (PROGN
                  (LETT #3#
                        (<
                         (SPADCALL (SPADCALL |pol| (QREFELT $ 21)) |vl|
                                   (QREFELT $ 90))
                         2)
                        . #13#)
                  (COND (#1# (LETT #2# (COND (#2# #3#) ('T 'NIL)) . #13#))
                        ('T
                         (PROGN
                          (LETT #2# #3# . #13#)
                          (LETT #1# 'T . #13#)))))))
               (LETT #4# (CDR #4#) . #13#) (GO G190) G191 (EXIT NIL))
          (COND (#1# #2#) ('T 'T))))))
      #5# (EXIT #5#))))) 

(DEFUN |SYSSOLP;solve;LLL;18| (|lr| |vl| $)
  (PROG (#1=#:G282 |f| #2=#:G281 #3=#:G280 |pr| #4=#:G279 |parRes| |eqns| |rhs|
         |lhs| #5=#:G278 |i| |soln|)
    (RETURN
     (SEQ
      (COND ((NULL |vl|) NIL)
            ((|SYSSOLP;checkLinear| |lr| |vl| $)
             (SEQ
              (LETT |soln| (|SYSSOLP;linSolve| |lr| |vl| $)
                    . #6=(|SYSSOLP;solve;LLL;18|))
              (EXIT
               (COND ((QEQCAR |soln| 1) NIL)
                     (#7='T
                      (SEQ (LETT |eqns| NIL . #6#)
                           (SEQ (LETT |i| 1 . #6#)
                                (LETT #5# (LENGTH |vl|) . #6#) G190
                                (COND ((|greater_SI| |i| #5#) (GO G191)))
                                (SEQ
                                 (LETT |lhs|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |vl| |i| (QREFELT $ 82))
                                         (QREFELT $ 30))
                                        (QREFELT $ 10))
                                       . #6#)
                                 (LETT |rhs|
                                       (SPADCALL
                                        (SPADCALL (QCDR |soln|) |i|
                                                  (QREFELT $ 91))
                                        (QREFELT $ 61))
                                       . #6#)
                                 (EXIT
                                  (LETT |eqns|
                                        (APPEND |eqns|
                                                (LIST
                                                 (SPADCALL |lhs| |rhs|
                                                           (QREFELT $ 83))))
                                        . #6#)))
                                (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (LIST |eqns|))))))))
            ((|HasCategory| (QREFELT $ 6) '(|GcdDomain|))
             (SEQ (LETT |parRes| (SPADCALL |lr| |vl| (QREFELT $ 53)) . #6#)
                  (EXIT
                   (PROGN
                    (LETT #4# NIL . #6#)
                    (SEQ (LETT |pr| NIL . #6#) (LETT #3# |parRes| . #6#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |pr| (CAR #3#) . #6#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #4#
                                 (CONS
                                  (PROGN
                                   (LETT #2# NIL . #6#)
                                   (SEQ (LETT |f| NIL . #6#)
                                        (LETT #1# |pr| . #6#) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |f| (CAR #1#) . #6#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (|SYSSOLP;makeEq|
                                                  (SPADCALL
                                                   (CONS
                                                    (|function|
                                                     |SYSSOLP;makeR2F|)
                                                    $)
                                                   |f| (QREFELT $ 68))
                                                  |vl| $)
                                                 #2#)
                                                . #6#)))
                                        (LETT #1# (CDR #1#) . #6#) (GO G190)
                                        G191 (EXIT (NREVERSE #2#))))
                                  #4#)
                                 . #6#)))
                         (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                         (EXIT (NREVERSE #4#)))))))
            (#7# (LIST NIL))))))) 

(DECLAIM (NOTINLINE |SystemSolvePackage;|)) 

(DEFUN |SystemSolvePackage| (#1=#:G283)
  (PROG ()
    (RETURN
     (PROG (#2=#:G284)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|SystemSolvePackage|)
                                           '|domainEqualList|)
                . #3=(|SystemSolvePackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|SystemSolvePackage;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|SystemSolvePackage|))))))))))) 

(DEFUN |SystemSolvePackage;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SystemSolvePackage|))
      (LETT |dv$| (LIST '|SystemSolvePackage| DV$1) . #1#)
      (LETT $ (GETREFV 92) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SystemSolvePackage| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|SystemSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Polynomial| 6)
              (0 . |coerce|) (|Fraction| 7) (5 . |coerce|) (|List| 17)
              (|Polynomial| 9) (10 . |variables|) (|Boolean|) (15 . =)
              (21 . |retract|) (|Symbol|)
              (|MPolyCatRationalFunctionFactorizer| (|IndexedExponents| 17) 17
                                                    6 12)
              (26 . |pushdown|) (32 . |last|) (37 . |numer|) (42 . |variables|)
              (47 . |member?|) (|SparseUnivariatePolynomial| $)
              (53 . |univariate|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 7) (59 . |degree|) (64 . |One|)
              (68 . |coerce|) (73 . |Zero|) (77 . |Zero|) (81 . |coefficient|)
              (87 . |leadingCoefficient|) (92 . /) (98 . -) (|Equation| 9)
              (103 . |equation|) (109 . |new|) (113 . |degree|) (119 . >)
              (|Factored| 7)
              (|GeneralizedMultivariateFactorize| 17 (|IndexedExponents| 17) 6
                                                  6 7)
              (125 . |factor|) (|Record| (|:| |factor| 7) (|:| |exponent| 77))
              (|List| 45) (130 . |factors|) (135 . |denom|) (140 . |One|)
              (144 . ~=) (|List| 71) (|List| 9)
              |SYSSOLP;triangularSystems;LLL;7| (150 . |zero?|)
              (155 . |concat|) (161 . |removeDuplicates|) (|List| 37)
              |SYSSOLP;solve;FSL;11| |SYSSOLP;solve;FL;8| (166 . |lhs|)
              (171 . |rhs|) (176 . -) |SYSSOLP;solve;EL;9|
              |SYSSOLP;solve;ESL;10| (182 . |primitivePart|) (|Mapping| 9 6)
              (|PolynomialFunctions2| 6 9) (188 . |map|) (|Union| 74 '"failed")
              (|Record| (|:| |particular| 69) (|:| |basis| (|List| 74)))
              (|List| 7)
              (|LinearSystemPolynomialPackage| 6 (|IndexedExponents| 17) 17 7)
              (194 . |linSolve|) (|Vector| 9) (200 . |zero|) (205 . ~=)
              (|Integer|) (211 . |elt|) (217 . *) (223 . +) (229 . |setelt|)
              (236 . |elt|) (242 . =) (248 . |setUnion|) (|List| 57)
              |SYSSOLP;solve;LLL;18| |SYSSOLP;solve;LL;14|
              |SYSSOLP;solve;LL;15| |SYSSOLP;solve;LLL;16|
              (254 . |totalDegree|) (260 . |elt|))
           '#(|triangularSystems| 266 |solve| 272) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 91
                                                 '(1 7 0 6 8 1 9 0 7 10 1 12 11
                                                   0 13 2 11 14 0 0 15 1 12 9 0
                                                   16 2 18 12 12 17 19 1 11 17
                                                   0 20 1 9 7 0 21 1 7 11 0 22
                                                   2 11 14 17 0 23 2 7 24 0 17
                                                   25 1 27 26 0 28 0 6 0 29 1 7
                                                   0 17 30 0 6 0 31 0 9 0 32 2
                                                   27 7 0 26 33 1 27 7 0 34 2 9
                                                   0 7 7 35 1 9 0 0 36 2 37 0 9
                                                   9 38 0 17 0 39 2 7 26 0 17
                                                   40 2 26 14 0 0 41 1 43 42 7
                                                   44 1 42 46 0 47 1 9 7 0 48 0
                                                   7 0 49 2 7 14 0 0 50 1 9 14
                                                   0 54 2 11 0 0 0 55 1 11 0 0
                                                   56 1 37 9 0 60 1 37 9 0 61 2
                                                   9 0 0 0 62 2 7 0 0 17 65 2
                                                   67 12 66 7 68 2 72 70 71 11
                                                   73 1 74 0 26 75 2 74 14 0 0
                                                   76 2 74 9 0 77 78 2 9 0 0 0
                                                   79 2 9 0 0 0 80 3 74 9 0 77
                                                   9 81 2 11 17 0 77 82 2 37 0
                                                   9 9 83 2 11 0 0 0 84 2 7 26
                                                   0 11 90 2 57 37 0 77 91 2 0
                                                   51 52 11 53 2 0 85 57 11 89
                                                   2 0 85 52 11 86 1 0 85 57 88
                                                   1 0 85 52 87 2 0 57 37 17 64
                                                   2 0 57 9 17 58 1 0 57 9 59 1
                                                   0 57 37 63)))))
           '|lookupComplete|)) 
