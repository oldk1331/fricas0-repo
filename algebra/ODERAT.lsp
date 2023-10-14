
(/VERSIONCHECK 2) 

(DEFUN |ODERAT;infOrder| (|f| $)
  (- (SPADCALL (SPADCALL |f| (QREFELT $ 12)) (QREFELT $ 14))
     (SPADCALL (SPADCALL |f| (QREFELT $ 15)) (QREFELT $ 14)))) 

(DEFUN |ODERAT;evenodd| (|n| $)
  (COND ((SPADCALL |n| (QREFELT $ 18)) (|spadConstant| $ 19))
        ('T (SPADCALL (|spadConstant| $ 19) (QREFELT $ 21))))) 

(DEFUN |ODERAT;ratDsolve1| (|op| |lg| $)
  (PROG (|sys1| |l| #1=#:G138 |i| #2=#:G137 #3=#:G136 |q| #4=#:G135 |rec| |d|)
    (RETURN
     (SEQ
      (LETT |d| (SPADCALL |op| |lg| (QREFELT $ 25)) . #5=(|ODERAT;ratDsolve1|))
      (LETT |rec| (|ODERAT;candidates| |op| |lg| |d| $) . #5#)
      (LETT |l|
            (SPADCALL
             (PROGN
              (LETT #4# NIL . #5#)
              (SEQ (LETT |q| NIL . #5#) (LETT #3# (QCAR |rec|) . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |q| (CAR #3#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #4# (CONS (SPADCALL |op| |q| (QREFELT $ 26)) #4#)
                           . #5#)))
                   (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                   (EXIT (NREVERSE #4#))))
             (PROGN
              (LETT #2# NIL . #5#)
              (SEQ (LETT |i| 1 . #5#) (LETT #1# (LENGTH (QCDR |rec|)) . #5#)
                   G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #2#
                           (CONS
                            (SPADCALL
                             (SPADCALL |op|
                                       (SPADCALL (QCDR |rec|) |i|
                                                 (QREFELT $ 27))
                                       (QREFELT $ 26))
                             (SPADCALL |lg| |i| (QREFELT $ 27)) (QREFELT $ 28))
                            #2#)
                           . #5#)))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))
             (QREFELT $ 29))
            . #5#)
      (LETT |sys1|
            (SPADCALL (SPADCALL (LIST |l|) (QREFELT $ 32)) (QREFELT $ 35))
            . #5#)
      (EXIT (CONS (QCAR |rec|) (SPADCALL |sys1| (QREFELT $ 37)))))))) 

(DEFUN |ODERAT;ratDsolve0| (|op| |g| $)
  (PROG (#1=#:G178 |v| #2=#:G177 |part| #3=#:G164 |sol| |m| |sys2| |sys1| |h|
         |lb| |l| |lsol| |opq| #4=#:G176 |q| |rec| |u| #5=#:G141 |b| |uu|
         #6=#:G175 |f|)
    (RETURN
     (SEQ
      (COND
       ((ZEROP (SPADCALL |op| (QREFELT $ 38)))
        (CONS
         (CONS 0
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |op| (QREFELT $ 39)) (QREFELT $ 40))
                 (QREFELT $ 41))
                |g| (QREFELT $ 42)))
         NIL))
       ((SPADCALL (SPADCALL |op| (QREFELT $ 43)) 0 (QREFELT $ 44))
        (SEQ
         (LETT |sol|
               (|ODERAT;ratDsolve0|
                (QCAR
                 (SPADCALL |op|
                           (SPADCALL (|spadConstant| $ 20) 1 (QREFELT $ 45))
                           (QREFELT $ 47)))
                |g| $)
               . #7=(|ODERAT;ratDsolve0|))
         (LETT |b| (LIST (|spadConstant| $ 48)) . #7#)
         (SEQ (LETT |f| NIL . #7#) (LETT #6# (QCDR |sol|) . #7#) G190
              (COND
               ((OR (ATOM #6#) (PROGN (LETT |f| (CAR #6#) . #7#) NIL))
                (GO G191)))
              (SEQ (LETT |uu| (SPADCALL |f| (QREFELT $ 51)) . #7#)
                   (EXIT
                    (COND
                     ((QEQCAR |uu| 0)
                      (LETT |b| (CONS (QCDR |uu|) |b|) . #7#)))))
              (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
         (EXIT
          (COND ((QEQCAR (QCAR |sol|) 1) (CONS (CONS 1 "failed") |b|))
                (#8='T
                 (CONS
                  (SPADCALL
                   (PROG2 (LETT #5# (QCAR |sol|) . #7#)
                       (QCDR #5#)
                     (|check_union| (QEQCAR #5# 0) (|Fraction| (QREFELT $ 7))
                                    #5#))
                   (QREFELT $ 51))
                  |b|))))))
       (#8#
        (SEQ (LETT |u| (SPADCALL |op| |g| (QREFELT $ 53)) . #7#)
             (EXIT
              (COND ((QEQCAR |u| 1) (CONS (CONS 1 "failed") NIL))
                    (#8#
                     (SEQ
                      (LETT |rec|
                            (|ODERAT;candidates| |op| (LIST |g|) (QCDR |u|) $)
                            . #7#)
                      (LETT |l| (LETT |lb| (LETT |lsol| NIL . #7#) . #7#)
                            . #7#)
                      (SEQ (LETT |q| NIL . #7#) (LETT #4# (QCAR |rec|) . #7#)
                           G190
                           (COND
                            ((OR (ATOM #4#)
                                 (PROGN (LETT |q| (CAR #4#) . #7#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL
                                (LETT |opq| (SPADCALL |op| |q| (QREFELT $ 26))
                                      . #7#)
                                (QREFELT $ 54))
                               (LETT |lsol| (CONS |q| |lsol|) . #7#))
                              ('T
                               (SEQ (LETT |l| (CONS |opq| |l|) . #7#)
                                    (EXIT
                                     (LETT |lb| (CONS |q| |lb|) . #7#)))))))
                           (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |h|
                            (COND
                             ((SPADCALL |g| (QREFELT $ 54))
                              (|spadConstant| $ 55))
                             (#8# (|SPADfirst| (QCDR |rec|))))
                            . #7#)
                      (EXIT
                       (COND
                        ((NULL |l|)
                         (COND
                          ((SPADCALL |g| (QREFELT $ 54))
                           (CONS (CONS 0 (|spadConstant| $ 55)) |lsol|))
                          (#8#
                           (CONS
                            (COND
                             ((SPADCALL |g| (SPADCALL |op| |h| (QREFELT $ 26))
                                        (QREFELT $ 58))
                              (CONS 0 |h|))
                             (#8# (CONS 1 "failed")))
                            |lsol|))))
                        (#8#
                         (SEQ
                          (COND
                           ((SPADCALL |g| (QREFELT $ 54))
                            (SEQ
                             (LETT |m|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (LIST |l|) (QREFELT $ 32))
                                     (QREFELT $ 35))
                                    (QREFELT $ 37))
                                   . #7#)
                             (EXIT
                              (LETT |v|
                                    (MAKEARR1 (ANCOLS |m|)
                                              (|spadConstant| $ 56))
                                    . #7#))))
                           (#8#
                            (SEQ
                             (LETT |sys1|
                                   (SPADCALL
                                    (SPADCALL (LIST |l|) (QREFELT $ 32))
                                    (SPADCALL
                                     (LIST
                                      (SPADCALL |g|
                                                (SPADCALL |op| |h|
                                                          (QREFELT $ 26))
                                                (QREFELT $ 28)))
                                     (QREFELT $ 60))
                                    (QREFELT $ 63))
                                   . #7#)
                             (LETT |sys2|
                                   (SPADCALL (QCAR |sys1|) (QCDR |sys1|)
                                             (QREFELT $ 65))
                                   . #7#)
                             (LETT |m| (QCAR |sys2|) . #7#)
                             (EXIT (LETT |v| (QCDR |sys2|) . #7#)))))
                          (LETT |sol| (SPADCALL |m| |v| (QREFELT $ 70)) . #7#)
                          (LETT |part|
                                (COND
                                 ((SPADCALL |g| (QREFELT $ 54))
                                  (CONS 0 (|spadConstant| $ 55)))
                                 ((QEQCAR (QCAR |sol|) 1) (CONS 1 "failed"))
                                 (#8#
                                  (CONS 0
                                        (SPADCALL
                                         (|ODERAT;makeDot|
                                          (PROG2 (LETT #3# (QCAR |sol|) . #7#)
                                              (QCDR #3#)
                                            (|check_union| (QEQCAR #3# 0)
                                                           (|Vector|
                                                            (QREFELT $ 6))
                                                           #3#))
                                          |lb| $)
                                         (|SPADfirst| (QCDR |rec|))
                                         (QREFELT $ 71)))))
                                . #7#)
                          (EXIT
                           (CONS |part|
                                 (SPADCALL |lsol|
                                           (PROGN
                                            (LETT #2# NIL . #7#)
                                            (SEQ (LETT |v| NIL . #7#)
                                                 (LETT #1# (QCDR |sol|) . #7#)
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #1#)
                                                       (PROGN
                                                        (LETT |v| (CAR #1#)
                                                              . #7#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (COND
                                                    ((|ODERAT;nzero?| |v| $)
                                                     (LETT #2#
                                                           (CONS
                                                            (|ODERAT;makeDot|
                                                             |v| |lb| $)
                                                            #2#)
                                                           . #7#)))))
                                                 (LETT #1# (CDR #1#) . #7#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #2#))))
                                           (QREFELT $ 72))))))))))))))))))) 

(DEFUN |ODERAT;indicialEquationAtInfinity;LodoUP;5| (|op| $)
  (PROG (|rec|)
    (RETURN
     (SEQ
      (LETT |rec| (|ODERAT;infMuLambda| |op| $)
            |ODERAT;indicialEquationAtInfinity;LodoUP;5|)
      (EXIT
       (|ODERAT;infIndicialEquation| (QVELT |rec| 1) (QVELT |rec| 2) $)))))) 

(DEFUN |ODERAT;indicialEquationAtInfinity;LodoUP;6| (|op| $)
  (PROG (|rec|)
    (RETURN
     (SEQ
      (LETT |rec| (SPADCALL |op| NIL (QREFELT $ 76))
            |ODERAT;indicialEquationAtInfinity;LodoUP;6|)
      (EXIT (SPADCALL (QCAR |rec|) (QREFELT $ 73))))))) 

(DEFUN |ODERAT;regularPoint| (|l| |lg| $)
  (PROG (#1=#:G185 #2=#:G189 |j| |i| |a|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |a|
              (SPADCALL (SPADCALL |l| (QREFELT $ 39))
                        (SPADCALL |lg| (QREFELT $ 79)) (QREFELT $ 80))
              . #3=(|ODERAT;regularPoint|))
        (EXIT
         (COND
          ((SPADCALL (SPADCALL |a| 0 (QREFELT $ 81)) (|spadConstant| $ 56)
                     (QREFELT $ 82))
           0)
          ('T
           (SEQ (LETT |i| 1 . #3#) G190 NIL
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL
                     (SPADCALL |a|
                               (LETT |j| (SPADCALL |i| (QREFELT $ 83)) . #3#)
                               (QREFELT $ 84))
                     (|spadConstant| $ 56) (QREFELT $ 82))
                    (PROGN (LETT #2# |i| . #3#) (GO #2#)))
                   ('T
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL
                         (SPADCALL |a| (SPADCALL |j| (QREFELT $ 21))
                                   (QREFELT $ 84))
                         (|spadConstant| $ 56) (QREFELT $ 82))
                        (PROGN
                         (LETT #1# (PROGN (LETT #2# (- |i|) . #3#) (GO #2#))
                               . #3#)
                         (GO #1#)))))
                     #1# (EXIT #1#))))))
                (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL)))))))
      #2# (EXIT #2#))))) 

(DEFUN |ODERAT;unitlist| (|i| |q| $)
  (PROG (|v|)
    (RETURN
     (SEQ (LETT |v| (MAKEARR1 |q| (|spadConstant| $ 56)) |ODERAT;unitlist|)
          (SPADCALL |v| |i| (|spadConstant| $ 19) (QREFELT $ 85))
          (EXIT (SPADCALL |v| (QREFELT $ 87))))))) 

(DEFUN |ODERAT;candidates| (|op| |lg| |d| $)
  (PROG (|part| #1=#:G204 |g| #2=#:G203 |a1| |hom| |i| #3=#:G202 |e| |q| |f|
         |dd| |solver| |tools| |uts| |m| |n|)
    (RETURN
     (SEQ
      (LETT |n|
            (+ (SPADCALL |d| (QREFELT $ 14)) (|ODERAT;infBound| |op| |lg| $))
            . #4=(|ODERAT;candidates|))
      (LETT |m| (|ODERAT;regularPoint| |op| |lg| $) . #4#)
      (LETT |uts|
            (|UnivariateTaylorSeries| (QREFELT $ 6) (QREFELT $ 10)
                                      (SPADCALL |m| (QREFELT $ 83)))
            . #4#)
      (LETT |tools|
            (|UTSodetools| (QREFELT $ 6) (QREFELT $ 7)
                           (|LinearOrdinaryDifferentialOperator2| (QREFELT $ 7)
                                                                  (|Fraction|
                                                                   (QREFELT $
                                                                            7)))
                           |uts|)
            . #4#)
      (LETT |solver| (|UnivariateTaylorSeriesODESolver| (QREFELT $ 6) |uts|)
            . #4#)
      (LETT |dd|
            (SPADCALL |d|
                      (|compiledLookupCheck| 'UP2UTS
                                             (LIST (|devaluate| |uts|)
                                                   (|devaluate| (ELT $ 7)))
                                             |tools|))
            . #4#)
      (LETT |f|
            (SPADCALL |op|
                      (|compiledLookupCheck| 'LODO2FUN
                                             (LIST
                                              (LIST '|Mapping|
                                                    (|devaluate| |uts|)
                                                    (LIST '|List|
                                                          (|devaluate| |uts|)))
                                              (LIST
                                               '|LinearOrdinaryDifferentialOperator2|
                                               (|devaluate| (ELT $ 7))
                                               (LIST '|Fraction|
                                                     (|devaluate| (ELT $ 7)))))
                                             |tools|))
            . #4#)
      (LETT |q| (SPADCALL |op| (QREFELT $ 38)) . #4#)
      (LETT |e| (|ODERAT;unitlist| 1 |q| $) . #4#)
      (LETT |hom|
            (PROGN
             (LETT #3# NIL . #4#)
             (SEQ (LETT |i| 1 . #4#) G190
                  (COND ((|greater_SI| |i| |q|) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #3#
                          (CONS
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL |dd|
                                       (SPADCALL |f|
                                                 (|ODERAT;unitlist| |i| |q| $)
                                                 (|compiledLookupCheck| '|ode|
                                                                        (LIST
                                                                         (|devaluate|
                                                                          |uts|)
                                                                         (LIST
                                                                          '|Mapping|
                                                                          (|devaluate|
                                                                           |uts|)
                                                                          (LIST
                                                                           '|List|
                                                                           (|devaluate|
                                                                            |uts|)))
                                                                         (LIST
                                                                          '|List|
                                                                          (|devaluate|
                                                                           (ELT
                                                                            $
                                                                            6))))
                                                                        |solver|))
                                       (|compiledLookupCheck| '*
                                                              (LIST '$ '$ '$)
                                                              |uts|))
                             |n|
                             (|compiledLookupCheck| 'UTS2UP
                                                    (LIST
                                                     (|devaluate| (ELT $ 7))
                                                     (|devaluate| |uts|)
                                                     (LIST
                                                      '|NonNegativeInteger|))
                                                    |tools|))
                            |d| (QREFELT $ 88))
                           #3#)
                          . #4#)))
                  (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #3#))))
            . #4#)
      (LETT |a1|
            (SPADCALL (SPADCALL (SPADCALL |op| (QREFELT $ 39)) (QREFELT $ 40))
                      (QREFELT $ 41))
            . #4#)
      (LETT |part|
            (PROGN
             (LETT #2# NIL . #4#)
             (SEQ (LETT |g| NIL . #4#) (LETT #1# |lg| . #4#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#) . #4#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL |g| (|spadConstant| $ 55) (QREFELT $ 89))
                      (LETT #2#
                            (CONS
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL |dd|
                                         (SPADCALL
                                          (CONS #'|ODERAT;candidates!0|
                                                (VECTOR |f| |tools| |uts| $ |g|
                                                        |a1|))
                                          |e|
                                          (|compiledLookupCheck| '|ode|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |uts|)
                                                                  (LIST
                                                                   '|Mapping|
                                                                   (|devaluate|
                                                                    |uts|)
                                                                   (LIST
                                                                    '|List|
                                                                    (|devaluate|
                                                                     |uts|)))
                                                                  (LIST '|List|
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              6))))
                                                                 |solver|))
                                         (|compiledLookupCheck| '*
                                                                (LIST '$ '$ '$)
                                                                |uts|))
                               |n|
                               (|compiledLookupCheck| 'UTS2UP
                                                      (LIST
                                                       (|devaluate| (ELT $ 7))
                                                       (|devaluate| |uts|)
                                                       (LIST
                                                        '|NonNegativeInteger|))
                                                      |tools|))
                              |d| (QREFELT $ 88))
                             #2#)
                            . #4#)))))
                  (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #4#)
      (EXIT (CONS |hom| |part|)))))) 

(DEFUN |ODERAT;candidates!0| (|l1| $$)
  (PROG (|a1| |g| $ |uts| |tools| |f|)
    (LETT |a1| (QREFELT $$ 5) . #1=(|ODERAT;candidates|))
    (LETT |g| (QREFELT $$ 4) . #1#)
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |uts| (QREFELT $$ 2) . #1#)
    (LETT |tools| (QREFELT $$ 1) . #1#)
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL (SPADCALL |a1| |g| (QREFELT $ 42))
                 (|compiledLookupCheck| 'RF2UTS
                                        (LIST (|devaluate| |uts|)
                                              (LIST '|Fraction|
                                                    (|devaluate| (ELT $ 7))))
                                        |tools|))
       (SPADCALL |l1| |f|) (|compiledLookupCheck| '+ (LIST '$ '$ '$) |uts|)))))) 

(DEFUN |ODERAT;nzero?| (|v| $)
  (PROG (#1=#:G206 #2=#:G208 #3=#:G209 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 90)) . #4=(|ODERAT;nzero?|))
               (LETT #3# (QVSIZE |v|) . #4#) G190
               (COND ((> |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 91)))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #2#)) . #4#)
                    (GO #1#))))))
               (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |ODERAT;UPfact| (|n| $)
  (PROG (#1=#:G213 #2=#:G212 #3=#:G214 #4=#:G218 #5=#:G211 |i| |z|)
    (RETURN
     (SEQ
      (COND ((ZEROP |n|) (|spadConstant| $ 20))
            (#6='T
             (SEQ
              (LETT |z| (SPADCALL (|spadConstant| $ 19) 1 (QREFELT $ 92))
                    . #7=(|ODERAT;UPfact|))
              (EXIT
               (PROGN
                (LETT #1# NIL . #7#)
                (SEQ (LETT |i| 0 . #7#)
                     (LETT #4#
                           (PROG1 (LETT #5# (- |n| 1) . #7#)
                             (|check_subtype| (>= #5# 0)
                                              '(|NonNegativeInteger|) #5#))
                           . #7#)
                     G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #3#
                              (SPADCALL |z|
                                        (SPADCALL (SPADCALL |i| (QREFELT $ 83))
                                                  (QREFELT $ 93))
                                        (QREFELT $ 94))
                              . #7#)
                        (COND
                         (#1#
                          (LETT #2# (SPADCALL #2# #3# (QREFELT $ 80)) . #7#))
                         ('T
                          (PROGN (LETT #2# #3# . #7#) (LETT #1# 'T . #7#)))))))
                     (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) (#6# (|spadConstant| $ 20)))))))))))) 

(DEFUN |ODERAT;infMuLambda| (|l| $)
  (PROG (|lf| |lamb| |mup| |m| |d| |a|)
    (RETURN
     (SEQ
      (LETT |lamb|
            (LIST
             (LETT |d| (SPADCALL |l| (QREFELT $ 38))
                   . #1=(|ODERAT;infMuLambda|)))
            . #1#)
      (LETT |lf| (LIST (LETT |a| (SPADCALL |l| (QREFELT $ 39)) . #1#)) . #1#)
      (LETT |mup| (- (SPADCALL |a| (QREFELT $ 14)) |d|) . #1#)
      (SEQ G190
           (COND
            ((NULL
              (SPADCALL (LETT |l| (SPADCALL |l| (QREFELT $ 95)) . #1#)
                        (|spadConstant| $ 96) (QREFELT $ 97)))
             (GO G191)))
           (SEQ (LETT |a| (SPADCALL |l| (QREFELT $ 39)) . #1#)
                (LETT |m|
                      (- (SPADCALL |a| (QREFELT $ 14))
                         (LETT |d| (SPADCALL |l| (QREFELT $ 38)) . #1#))
                      . #1#)
                (EXIT
                 (COND
                  ((SPADCALL |m| |mup| (QREFELT $ 98))
                   (SEQ (LETT |mup| |m| . #1#) (LETT |lamb| (LIST |d|) . #1#)
                        (EXIT (LETT |lf| (LIST |a|) . #1#))))
                  ((EQL |m| |mup|)
                   (SEQ (LETT |lamb| (CONS |d| |lamb|) . #1#)
                        (EXIT (LETT |lf| (CONS |a| |lf|) . #1#)))))))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT (VECTOR |mup| |lamb| |lf|)))))) 

(DEFUN |ODERAT;infIndicialEquation| (|lambda| |lf| $)
  (PROG (|ans| #1=#:G229 |i| #2=#:G230 |f|)
    (RETURN
     (SEQ
      (LETT |ans| (|spadConstant| $ 57) . #3=(|ODERAT;infIndicialEquation|))
      (SEQ (LETT |f| NIL . #3#) (LETT #2# |lf| . #3#) (LETT |i| NIL . #3#)
           (LETT #1# |lambda| . #3#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #3#) NIL) (ATOM #2#)
                 (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (LETT |ans|
                   (SPADCALL |ans|
                             (SPADCALL
                              (SPADCALL (|ODERAT;evenodd| |i| $)
                                        (SPADCALL |f| (QREFELT $ 99))
                                        (QREFELT $ 100))
                              (|ODERAT;UPfact| |i| $) (QREFELT $ 101))
                             (QREFELT $ 94))
                   . #3#)))
           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |ans|))))) 

(DEFUN |ODERAT;infBound| (|l| |lg| $)
  (PROG (#1=#:G238 |m| |mm| #2=#:G242 |g| #3=#:G234 |n| |rec|)
    (RETURN
     (SEQ (LETT |rec| (|ODERAT;infMuLambda| |l| $) . #4=(|ODERAT;infBound|))
          (LETT |n|
                (MIN (- (- (SPADCALL |l| (QREFELT $ 38))) 1)
                     (SPADCALL
                      (|ODERAT;infIndicialEquation| (QVELT |rec| 1)
                       (QVELT |rec| 2) $)
                      (QREFELT $ 103)))
                . #4#)
          (SEQ G190
               (COND
                ((NULL
                  (COND ((NULL |lg|) 'NIL)
                        ('T (SPADCALL (|SPADfirst| |lg|) (QREFELT $ 54)))))
                 (GO G191)))
               (SEQ (EXIT (LETT |lg| (CDR |lg|) . #4#))) NIL (GO G190) G191
               (EXIT NIL))
          (EXIT
           (COND
            ((NULL |lg|)
             (PROG1 (LETT #3# (- |n|) . #4#)
               (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#)))
            ('T
             (SEQ (LETT |m| (|ODERAT;infOrder| (|SPADfirst| |lg|) $) . #4#)
                  (SEQ (LETT |g| NIL . #4#) (LETT #2# (CDR |lg|) . #4#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |g| (QREFELT $ 54)))
                           (SEQ (LETT |mm| (|ODERAT;infOrder| |g| $) . #4#)
                                (EXIT
                                 (COND
                                  ((< |mm| |m|) (LETT |m| |mm| . #4#)))))))))
                       (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (PROG1
                       (LETT #1#
                             (-
                              (MIN |n|
                                   (+
                                    (- (QVELT |rec| 0)
                                       (SPADCALL (SPADCALL |l| (QREFELT $ 39))
                                                 (QREFELT $ 14)))
                                    |m|)))
                             . #4#)
                     (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                      #1#))))))))))) 

(DEFUN |ODERAT;makeDot| (|v| |bas| $)
  (PROG (|ans| |i| #1=#:G246 |b|)
    (RETURN
     (SEQ (LETT |ans| (|spadConstant| $ 55) . #2=(|ODERAT;makeDot|))
          (SEQ (LETT |b| NIL . #2#) (LETT #1# |bas| . #2#) (LETT |i| 1 . #2#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |b| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |ans|
                       (SPADCALL |ans|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |v| |i| (QREFELT $ 104))
                                            (QREFELT $ 93))
                                  |b| (QREFELT $ 105))
                                 (QREFELT $ 71))
                       . #2#)))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#) . #2#))
                     . #2#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |ODERAT;ratDsolve;LodoFR;16| (|op| |g| $)
  (PROG (|rec|)
    (RETURN
     (SEQ
      (LETT |rec| (SPADCALL |op| (LIST |g|) (QREFELT $ 76))
            |ODERAT;ratDsolve;LodoFR;16|)
      (EXIT (|ODERAT;ratDsolve0| (QCAR |rec|) (|SPADfirst| (QCDR |rec|)) $)))))) 

(DEFUN |ODERAT;ratDsolve;LodoLR;17| (|op| |lg| $)
  (PROG (|rec|)
    (RETURN
     (SEQ
      (LETT |rec| (SPADCALL |op| |lg| (QREFELT $ 76))
            |ODERAT;ratDsolve;LodoLR;17|)
      (EXIT (|ODERAT;ratDsolve1| (QCAR |rec|) (QCDR |rec|) $)))))) 

(DEFUN |ODERAT;ratDsolve;LodoFR;18| (|op| |g| $)
  (PROG (#1=#:G259 |c|)
    (RETURN
     (COND
      ((SPADCALL
        (LETT |c| (SPADCALL |op| (QREFELT $ 110))
              . #2=(|ODERAT;ratDsolve;LodoFR;18|))
        (QREFELT $ 111))
       (|ODERAT;ratDsolve0| |op| |g| $))
      ('T
       (|ODERAT;ratDsolve0|
        (PROG2 (LETT #1# (SPADCALL |op| |c| (QREFELT $ 113)) . #2#)
            (QCDR #1#)
          (|check_union| (QEQCAR #1# 0)
                         (|LinearOrdinaryDifferentialOperator2| (QREFELT $ 7)
                                                                (|Fraction|
                                                                 (QREFELT $
                                                                          7)))
                         #1#))
        (SPADCALL (SPADCALL (SPADCALL |c| (QREFELT $ 40)) (QREFELT $ 41)) |g|
                  (QREFELT $ 42))
        $)))))) 

(DEFUN |ODERAT;ratDsolve;LodoLR;19| (|op| |lg| $)
  (PROG (#1=#:G271 |g| #2=#:G270 #3=#:G265 |c|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |c| (SPADCALL |op| (QREFELT $ 110))
               . #4=(|ODERAT;ratDsolve;LodoLR;19|))
         (QREFELT $ 111))
        (|ODERAT;ratDsolve1| |op| |lg| $))
       ('T
        (|ODERAT;ratDsolve1|
         (PROG2 (LETT #3# (SPADCALL |op| |c| (QREFELT $ 113)) . #4#)
             (QCDR #3#)
           (|check_union| (QEQCAR #3# 0)
                          (|LinearOrdinaryDifferentialOperator2| (QREFELT $ 7)
                                                                 (|Fraction|
                                                                  (QREFELT $
                                                                           7)))
                          #3#))
         (PROGN
          (LETT #2# NIL . #4#)
          (SEQ (LETT |g| NIL . #4#) (LETT #1# |lg| . #4#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT #2#
                       (CONS
                        (SPADCALL
                         (SPADCALL (SPADCALL |c| (QREFELT $ 40))
                                   (QREFELT $ 41))
                         |g| (QREFELT $ 42))
                        #2#)
                       . #4#)))
               (LETT #1# (CDR #1#) . #4#) (GO G190) G191
               (EXIT (NREVERSE #2#))))
         $))))))) 

(DECLAIM (NOTINLINE |RationalLODE;|)) 

(DEFUN |RationalLODE| (&REST #1=#:G272)
  (PROG ()
    (RETURN
     (PROG (#2=#:G273)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|RationalLODE|)
                                           '|domainEqualList|)
                . #3=(|RationalLODE|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |RationalLODE;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|RationalLODE|))))))))))) 

(DEFUN |RationalLODE;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|RationalLODE|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|RationalLODE| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 116) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|RationalLODE| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
      $)))) 

(MAKEPROP '|RationalLODE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (0 . |new|) '|dummy| (|Fraction| 7) (4 . |denom|)
              (|NonNegativeInteger|) (9 . |degree|) (14 . |numer|) (|Boolean|)
              (|Integer|) (19 . |even?|) (24 . |One|) (28 . |One|) (32 . -)
              (|LinearOrdinaryDifferentialOperator2| 7 11) (|List| 11)
              (|PrimitiveRatDE| 6 7 22 75) (37 . |denomLODE|) (43 . |elt|)
              (49 . |elt|) (55 . -) (61 . |concat|) (|List| 23) (|Matrix| 11)
              (67 . |matrix|) (|Matrix| 7) (|Matrix| $) (72 . |reducedSystem|)
              (|Matrix| 6) (77 . |reducedSystem|) (82 . |degree|)
              (87 . |leadingCoefficient|) (92 . |coerce|) (97 . |inv|)
              (102 . *) (108 . |minimumDegree|) (113 . >) (119 . |monomial|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (125 . |monicRightDivide|) (131 . |One|) (|Union| 11 '"failed")
              (|RationalIntegration| 6 7) (135 . |infieldint|)
              (|Union| 7 '"failed") (140 . |denomLODE|) (146 . |zero?|)
              (151 . |Zero|) (155 . |Zero|) (159 . |Zero|) (163 . =)
              (|Vector| 11) (169 . |vector|)
              (|Record| (|:| |mat| 33) (|:| |vec| (|Vector| 7))) (|Vector| $)
              (174 . |reducedSystem|) (|Record| (|:| |mat| 36) (|:| |vec| 68))
              (180 . |reducedSystem|) (|Union| 68 '"failed")
              (|Record| (|:| |particular| 66) (|:| |basis| (|List| 68)))
              (|Vector| 6) (|LinearSystemMatrixPackage| 6 68 68 36)
              (186 . |solve|) (192 . +) (198 . |concat!|)
              |ODERAT;indicialEquationAtInfinity;LodoUP;5|
              (|Record| (|:| |eq| 22) (|:| |rh| 23))
              (|LinearOrdinaryDifferentialOperator1| 11)
              (204 . |splitDenominator|)
              |ODERAT;indicialEquationAtInfinity;LodoUP;6|
              (|InnerCommonDenominator| 7 11 (|List| 7) 23)
              (210 . |commonDenominator|) (215 . *) (221 . |coefficient|)
              (227 . ~=) (233 . |coerce|) (238 . |elt|) (244 . |setelt|)
              (|List| 6) (251 . |parts|) (256 . /) (262 . ~=)
              (268 . |minIndex|) (273 . |zero?|) (278 . |monomial|)
              (284 . |coerce|) (289 . +) (295 . |reductum|) (300 . |Zero|)
              (304 . ~=) (310 . >) (316 . |leadingCoefficient|) (321 . *)
              (327 . *) (|BoundIntegerRoots| 6 7) (333 . |integerBound|)
              (338 . |elt|) (344 . *)
              (|Record| (|:| |particular| 49) (|:| |basis| 23))
              |ODERAT;ratDsolve;LodoFR;16|
              (|Record| (|:| |basis| 23) (|:| |mat| 36))
              |ODERAT;ratDsolve;LodoLR;17| (350 . |content|) (355 . |unit?|)
              (|Union| $ '"failed") (360 . |exquo|)
              |ODERAT;ratDsolve;LodoFR;18| |ODERAT;ratDsolve;LodoLR;19|)
           '#(|ratDsolve| 366 |indicialEquationAtInfinity| 390) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 115
                                                 '(0 8 0 9 1 11 7 0 12 1 7 13 0
                                                   14 1 11 7 0 15 1 17 16 0 18
                                                   0 6 0 19 0 7 0 20 1 6 0 0 21
                                                   2 24 7 22 23 25 2 22 11 0 11
                                                   26 2 23 11 0 17 27 2 11 0 0
                                                   0 28 2 23 0 0 0 29 1 31 0 30
                                                   32 1 11 33 34 35 1 7 36 34
                                                   37 1 22 13 0 38 1 22 7 0 39
                                                   1 11 0 7 40 1 11 0 0 41 2 11
                                                   0 0 0 42 1 22 13 0 43 2 13
                                                   16 0 0 44 2 22 0 7 13 45 2
                                                   22 46 0 0 47 0 11 0 48 1 50
                                                   49 11 51 2 24 52 22 11 53 1
                                                   11 16 0 54 0 11 0 55 0 6 0
                                                   56 0 7 0 57 2 11 16 0 0 58 1
                                                   59 0 23 60 2 11 61 34 62 63
                                                   2 7 64 34 62 65 2 69 67 36
                                                   68 70 2 11 0 0 0 71 2 23 0 0
                                                   0 72 2 24 74 75 23 76 1 78 7
                                                   23 79 2 7 0 0 0 80 2 7 6 0
                                                   13 81 2 6 16 0 0 82 1 6 0 17
                                                   83 2 7 6 0 6 84 3 68 6 0 17
                                                   6 85 1 68 86 0 87 2 11 0 7 7
                                                   88 2 11 16 0 0 89 1 68 17 0
                                                   90 1 6 16 0 91 2 7 0 6 13 92
                                                   1 7 0 6 93 2 7 0 0 0 94 1 22
                                                   0 0 95 0 22 0 96 2 22 16 0 0
                                                   97 2 17 16 0 0 98 1 7 6 0 99
                                                   2 6 0 0 0 100 2 7 0 6 0 101
                                                   1 102 17 7 103 2 68 6 0 17
                                                   104 2 11 0 7 0 105 1 22 7 0
                                                   110 1 7 16 0 111 2 22 112 0
                                                   7 113 2 0 106 75 11 107 2 0
                                                   106 22 11 114 2 0 108 75 23
                                                   109 2 0 108 22 23 115 1 0 7
                                                   22 73 1 0 7 75 77)))))
           '|lookupComplete|)) 
