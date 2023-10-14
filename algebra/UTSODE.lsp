
(/VERSIONCHECK 2) 

(DEFUN |UTSODE;stFunc1;MM;1| (|f| $)
  (PROG () (RETURN (CONS #'|UTSODE;stFunc1;MM;1!0| (VECTOR |f| $))))) 

(DEFUN |UTSODE;stFunc1;MM;1!0| (|s| $$)
  (PROG ($ |f|)
    (LETT $ (QREFELT $$ 1) . #1=(|UTSODE;stFunc1;MM;1|))
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL (SPADCALL |s| (QREFELT $ 9)) |f|) (QREFELT $ 10)))))) 

(DEFUN |UTSODE;stFunc2;MM;2| (|f| $)
  (PROG () (RETURN (CONS #'|UTSODE;stFunc2;MM;2!0| (VECTOR |f| $))))) 

(DEFUN |UTSODE;stFunc2;MM;2!0| (|s1| |s2| $$)
  (PROG ($ |f|)
    (LETT $ (QREFELT $$ 1) . #1=(|UTSODE;stFunc2;MM;2|))
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL (SPADCALL |s1| (QREFELT $ 9)) (SPADCALL |s2| (QREFELT $ 9))
                 |f|)
       (QREFELT $ 10)))))) 

(DEFUN |UTSODE;stFuncN;MM;3| (|f| $)
  (PROG () (RETURN (CONS #'|UTSODE;stFuncN;MM;3!0| (VECTOR |f| $))))) 

(DEFUN |UTSODE;stFuncN;MM;3!0| (|ls| $$)
  (PROG ($ |f|)
    (LETT $ (QREFELT $$ 1) . #1=(|UTSODE;stFuncN;MM;3|))
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL (SPADCALL (ELT $ 9) |ls| (QREFELT $ 21)) |f|)
                (QREFELT $ 10)))))) 

(DEFUN |UTSODE;divloopre| (|hx| |tx| |hy| |ty| |c| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|UTSODE;divloopre!0| (VECTOR |c| |ty| |tx| $ |hy| |hx|))
               (QREFELT $ 32))))) 

(DEFUN |UTSODE;divloopre!0| ($$)
  (PROG (|hx| |hy| $ |tx| |ty| |c|)
    (LETT |hx| (QREFELT $$ 5) . #1=(|UTSODE;divloopre|))
    (LETT |hy| (QREFELT $$ 4) . #1#)
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |tx| (QREFELT $$ 2) . #1#)
    (LETT |ty| (QREFELT $$ 1) . #1#)
    (LETT |c| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |hx| |hy| (QREFELT $ 25))
                (SPADCALL |hy|
                          (SPADCALL |tx| (SPADCALL |ty| |c| (QREFELT $ 27))
                                    (QREFELT $ 28))
                          (QREFELT $ 29))
                (QREFELT $ 30)))))) 

(DEFUN |UTSODE;divloop| (|hx| |tx| |hy| |ty| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|UTSODE;divloop!0| (VECTOR $ |ty| |hy| |tx| |hx|))
               (QREFELT $ 34))))) 

(DEFUN |UTSODE;divloop!0| (|s| $$)
  (PROG (|hx| |tx| |hy| |ty| $)
    (LETT |hx| (QREFELT $$ 4) . #1=(|UTSODE;divloop|))
    (LETT |tx| (QREFELT $$ 3) . #1#)
    (LETT |hy| (QREFELT $$ 2) . #1#)
    (LETT |ty| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|UTSODE;divloopre| |hx| |tx| |hy| |ty| |s| $))))) 

(DEFUN |UTSODE;sdiv| (|x| |y| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL (CONS #'|UTSODE;sdiv!0| (VECTOR |y| $ |x|)) (QREFELT $ 32)))))) 

(DEFUN |UTSODE;sdiv!0| ($$)
  (PROG (|x| $ |y|)
    (LETT |x| (QREFELT $$ 2) . #1=(|UTSODE;sdiv|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |y| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|hx| |tx| |hy| |ty| |rhy|)
        (RETURN
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 36)) (SPADCALL (QREFELT $ 37)))
                ((SPADCALL |y| (QREFELT $ 36))
                 (|error| "stream division by zero"))
                ('T
                 (SEQ (LETT |hx| (SPADCALL |x| (QREFELT $ 38)) NIL)
                      (LETT |tx| (SPADCALL |x| (QREFELT $ 39)) NIL)
                      (LETT |hy| (SPADCALL |y| (QREFELT $ 38)) NIL)
                      (LETT |ty| (SPADCALL |y| (QREFELT $ 39)) NIL)
                      (EXIT
                       (COND
                        ((SPADCALL |hy| (QREFELT $ 40))
                         (COND
                          ((SPADCALL |hx| (QREFELT $ 40))
                           (|UTSODE;sdiv| |tx| |ty| $))
                          ('T (|error| "stream division by zero"))))
                        ('T
                         (SEQ (LETT |rhy| (SPADCALL |hy| (QREFELT $ 42)) NIL)
                              (EXIT
                               (COND
                                ((QEQCAR |rhy| 1)
                                 (|error| "stream division:no reciprocal"))
                                ('T
                                 (|UTSODE;divloop| |hx| |tx| (QCDR |rhy|) |ty|
                                  $)))))))))))))))))) 

(DEFUN |UTSODE;fixedPointExquo;3UTS;7| (|f| |g| $)
  (SPADCALL
   (|UTSODE;sdiv| (SPADCALL |f| (QREFELT $ 10)) (SPADCALL |g| (QREFELT $ 10))
    $)
   (QREFELT $ 9))) 

(DEFUN |UTSODE;ode1re| (|f| |c| |y| $)
  (PROG ()
    (RETURN
     (SPADCALL |c| (CONS #'|UTSODE;ode1re!0| (VECTOR |f| |y|))
               (QREFELT $ 45))))) 

(DEFUN |UTSODE;ode1re!0| ($$)
  (PROG (|y| |f|)
    (LETT |y| (QREFELT $$ 1) . #1=(|UTSODE;ode1re|))
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |y| |f|))))) 

(DEFUN |UTSODE;iOde1| (|f| |c| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|UTSODE;iOde1!0| (VECTOR $ |c| |f|)) (QREFELT $ 34))))) 

(DEFUN |UTSODE;iOde1!0| (|s| $$)
  (PROG (|f| |c| $)
    (LETT |f| (QREFELT $$ 2) . #1=(|UTSODE;iOde1|))
    (LETT |c| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|UTSODE;ode1re| |f| |c| |s| $))))) 

(DEFUN |UTSODE;ode1;MCoefUTS;10| (|f| |c| $)
  (SPADCALL (|UTSODE;iOde1| (SPADCALL |f| (QREFELT $ 13)) |c| $) (QREFELT $ 9))) 

(DEFUN |UTSODE;ode2re| (|f| |c0| |c1| |y| $)
  (PROG (|yi|)
    (RETURN
     (SEQ
      (LETT |yi|
            (SPADCALL |c1| (CONS #'|UTSODE;ode2re!0| (VECTOR |f| $ |y|))
                      (QREFELT $ 45))
            |UTSODE;ode2re|)
      (EXIT (SPADCALL |c0| (CONS #'|UTSODE;ode2re!1| |yi|) (QREFELT $ 45))))))) 

(DEFUN |UTSODE;ode2re!1| (|yi|) |yi|) 

(DEFUN |UTSODE;ode2re!0| ($$)
  (PROG (|y| $ |f|)
    (LETT |y| (QREFELT $$ 2) . #1=(|UTSODE;ode2re|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |y| (SPADCALL |y| (QREFELT $ 47)) |f|))))) 

(DEFUN |UTSODE;iOde2| (|f| |c0| |c1| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|UTSODE;iOde2!0| (VECTOR $ |c1| |c0| |f|))
               (QREFELT $ 34))))) 

(DEFUN |UTSODE;iOde2!0| (|s| $$)
  (PROG (|f| |c0| |c1| $)
    (LETT |f| (QREFELT $$ 3) . #1=(|UTSODE;iOde2|))
    (LETT |c0| (QREFELT $$ 2) . #1#)
    (LETT |c1| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|UTSODE;ode2re| |f| |c0| |c1| |s| $))))) 

(DEFUN |UTSODE;ode2;M2CoefUTS;13| (|f| |c0| |c1| $)
  (SPADCALL (|UTSODE;iOde2| (SPADCALL |f| (QREFELT $ 16)) |c0| |c1| $)
            (QREFELT $ 9))) 

(DEFUN |UTSODE;odeNre| (|f| |cl| |yl| $)
  (PROG (|yil| #1=#:G202 |c| #2=#:G203 |y| #3=#:G201)
    (RETURN
     (SEQ
      (LETT |yil|
            (PROGN
             (LETT #3# NIL . #4=(|UTSODE;odeNre|))
             (SEQ (LETT |y| NIL . #4#) (LETT #2# (CDR |yl|) . #4#)
                  (LETT |c| NIL . #4#) (LETT #1# |cl| . #4#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #4#) NIL)
                        (ATOM #2#) (PROGN (LETT |y| (CAR #2#) . #4#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #3#
                          (CONS
                           (SPADCALL |c| (CONS #'|UTSODE;odeNre!0| |y|)
                                     (QREFELT $ 45))
                           #3#)
                          . #4#)))
                  (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#)) . #4#)
                  (GO G190) G191 (EXIT (NREVERSE #3#))))
            . #4#)
      (EXIT (SPADCALL |yil| (LIST (SPADCALL |yil| |f|)) (QREFELT $ 49))))))) 

(DEFUN |UTSODE;odeNre!0| (|y|) |y|) 

(DEFUN |UTSODE;iOde| (|f| |cl| $)
  (PROG ()
    (RETURN
     (|SPADfirst|
      (SPADCALL (CONS #'|UTSODE;iOde!0| (VECTOR $ |cl| |f|))
                (+ (LENGTH |cl|) 1) (QREFELT $ 52)))))) 

(DEFUN |UTSODE;iOde!0| (|ls| $$)
  (PROG (|f| |cl| $)
    (LETT |f| (QREFELT $$ 2) . #1=(|UTSODE;iOde|))
    (LETT |cl| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|UTSODE;odeNre| |f| |cl| |ls| $))))) 

(DEFUN |UTSODE;ode;MLUTS;16| (|f| |cl| $)
  (SPADCALL (|UTSODE;iOde| (SPADCALL |f| (QREFELT $ 24)) |cl| $) (QREFELT $ 9))) 

(DEFUN |UTSODE;simulre| (|cst| |lsf| |c| $)
  (PROG (#1=#:G223 |csti| #2=#:G224 |lsfi| #3=#:G222)
    (RETURN
     (SEQ
      (PROGN
       (LETT #3# NIL . #4=(|UTSODE;simulre|))
       (SEQ (LETT |lsfi| NIL . #4#) (LETT #2# |lsf| . #4#)
            (LETT |csti| NIL . #4#) (LETT #1# |cst| . #4#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |csti| (CAR #1#) . #4#) NIL)
                  (ATOM #2#) (PROGN (LETT |lsfi| (CAR #2#) . #4#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #3#
                    (CONS
                     (SPADCALL |csti|
                               (CONS #'|UTSODE;simulre!0|
                                     (VECTOR |lsfi| |c| $))
                               (QREFELT $ 45))
                     #3#)
                    . #4#)))
            (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#)) . #4#)
            (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(DEFUN |UTSODE;simulre!0| ($$)
  (PROG ($ |c| |lsfi|)
    (LETT $ (QREFELT $$ 2) . #1=(|UTSODE;simulre|))
    (LETT |c| (QREFELT $$ 1) . #1#)
    (LETT |lsfi| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL
        (SPADCALL (|spadConstant| $ 55) (|spadConstant| $ 57) (QREFELT $ 58))
        |c| (QREFELT $ 59))
       |lsfi|))))) 

(DEFUN |UTSODE;iMpsode| (|cs| |lsts| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|UTSODE;iMpsode!0| (VECTOR $ |lsts| |cs|)) (LENGTH |cs|)
               (QREFELT $ 52))))) 

(DEFUN |UTSODE;iMpsode!0| (|ls| $$)
  (PROG (|cs| |lsts| $)
    (LETT |cs| (QREFELT $$ 2) . #1=(|UTSODE;iMpsode|))
    (LETT |lsts| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|UTSODE;simulre| |cs| |lsts| |ls| $))))) 

(DEFUN |UTSODE;mpsode;LLL;19| (|cs| |lsts| $)
  (PROG (|stSol| #1=#:G235 |lst| #2=#:G234)
    (RETURN
     (SEQ
      (LETT |stSol|
            (|UTSODE;iMpsode| |cs|
             (PROGN
              (LETT #2# NIL . #3=(|UTSODE;mpsode;LLL;19|))
              (SEQ (LETT |lst| NIL . #3#) (LETT #1# |lsts| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |lst| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #2# (CONS (SPADCALL |lst| (QREFELT $ 24)) #2#)
                           . #3#)))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))
             $)
            . #3#)
      (EXIT (SPADCALL (ELT $ 9) |stSol| (QREFELT $ 21))))))) 

(DECLAIM (NOTINLINE |UnivariateTaylorSeriesODESolver;|)) 

(DEFUN |UnivariateTaylorSeriesODESolver| (&REST #1=#:G236)
  (PROG ()
    (RETURN
     (PROG (#2=#:G237)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|UnivariateTaylorSeriesODESolver|)
                                           '|domainEqualList|)
                . #3=(|UnivariateTaylorSeriesODESolver|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |UnivariateTaylorSeriesODESolver;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|UnivariateTaylorSeriesODESolver|))))))))))) 

(DEFUN |UnivariateTaylorSeriesODESolver;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|UnivariateTaylorSeriesODESolver|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|UnivariateTaylorSeriesODESolver| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 62) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|UnivariateTaylorSeriesODESolver|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|UnivariateTaylorSeriesODESolver| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Stream| 6) (0 . |series|) (5 . |coefficients|) (|Mapping| 8 8)
              (|Mapping| 7 7) |UTSODE;stFunc1;MM;1| (|Mapping| 8 8 8)
              (|Mapping| 7 7 7) |UTSODE;stFunc2;MM;2| (|List| 7)
              (|Mapping| 7 8) (|List| 8) (|ListFunctions2| 8 7) (10 . |map|)
              (|Mapping| 8 19) (|Mapping| 7 17) |UTSODE;stFuncN;MM;3| (16 . *)
              (|StreamTaylorSeriesOperations| 6) (22 . *) (28 . -) (34 . *)
              (40 . |concat|) (|Mapping| $) (46 . |delay|)
              (|ParadoxicalCombinatorsForStreams| 6) (51 . Y) (|Boolean|)
              (56 . |empty?|) (61 . |empty|) (65 . |frst|) (70 . |rst|)
              (75 . |zero?|) (|Union| $ '"failed") (80 . |recip|)
              |UTSODE;fixedPointExquo;3UTS;7| (|Mapping| 8)
              (85 . |lazyIntegrate|) |UTSODE;ode1;MCoefUTS;10| (91 . |deriv|)
              |UTSODE;ode2;M2CoefUTS;13| (96 . |concat|) (|Mapping| 19 19)
              (|Integer|) (102 . Y) (|List| 6) |UTSODE;ode;MLUTS;16|
              (108 . |One|) (112 . |One|) (116 . |One|) (120 . |monom|)
              (126 . |concat|) (|List| 23) |UTSODE;mpsode;LLL;19|)
           '#(|stFuncN| 132 |stFunc2| 137 |stFunc1| 142 |ode2| 147 |ode1| 154
              |ode| 160 |mpsode| 166 |fixedPointExquo| 172)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 61
                                                 '(1 7 0 8 9 1 7 8 0 10 2 20 17
                                                   18 19 21 2 6 0 0 0 25 2 26 8
                                                   8 8 27 2 26 8 8 8 28 2 26 8
                                                   6 8 29 2 8 0 6 0 30 1 8 0 31
                                                   32 1 33 8 11 34 1 8 35 0 36
                                                   0 8 0 37 1 8 6 0 38 1 8 0 0
                                                   39 1 6 35 0 40 1 6 41 0 42 2
                                                   26 8 6 44 45 1 26 8 8 47 2
                                                   19 0 0 0 49 2 33 19 50 51 52
                                                   0 6 0 55 0 7 0 56 0 51 0 57
                                                   2 26 8 6 51 58 2 19 0 8 0 59
                                                   1 0 22 23 24 1 0 14 15 16 1
                                                   0 11 12 13 3 0 7 15 6 6 48 2
                                                   0 7 12 6 46 2 0 7 23 53 54 2
                                                   0 17 53 60 61 2 0 7 7 7
                                                   43)))))
           '|lookupComplete|)) 
