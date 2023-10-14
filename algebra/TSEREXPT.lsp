
(/VERSIONCHECK 2) 

(DEFUN |TSEREXPT;stream_taylor| (|f| |x| |xn| |d| |n| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL
       (CONS #'|TSEREXPT;stream_taylor!0| (VECTOR |x| |d| |xn| |f| |n| $))
       (QREFELT $ 23)))))) 

(DEFUN |TSEREXPT;stream_taylor!0| ($$)
  (PROG ($ |n| |f| |xn| |d| |x|)
    (LETT $ (QREFELT $$ 5) . #1=(|TSEREXPT;stream_taylor|))
    (LETT |n| (QREFELT $$ 4) . #1#)
    (LETT |f| (QREFELT $$ 3) . #1#)
    (LETT |xn| (QREFELT $$ 2) . #1#)
    (LETT |d| (QREFELT $$ 1) . #1#)
    (LETT |x| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|qn| |ninv| |fn|)
        (RETURN
         (SEQ
          (LETT |qn| (SPADCALL (|spadConstant| $ 11) |n| (QREFELT $ 13)) NIL)
          (LETT |ninv| (SPADCALL |qn| (|spadConstant| $ 8) (QREFELT $ 14)) NIL)
          (LETT |fn| (SPADCALL |f| |xn| (QREFELT $ 17)) NIL)
          (EXIT
           (SPADCALL |fn|
                     (|TSEREXPT;stream_taylor|
                      (SPADCALL (SPADCALL |ninv| |f| (QREFELT $ 18)) |d|) |x|
                      (SPADCALL |x| |xn| (QREFELT $ 17)) |d|
                      (SPADCALL |n| (|spadConstant| $ 11) (QREFELT $ 19)) $)
                     (QREFELT $ 21)))))))))) 

(DEFUN |TSEREXPT;taylor_via_deriv;UTSLLUTS;2| (|f| |lx| |ld| $)
  (PROG (|ds| |one| |xs| |fs| |x1|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (LENGTH |lx|) (LENGTH |ld|) (QREFELT $ 26))
        (|error|
         "taylor_via_deriv: number of variables must equal number of derivatives"))
       ((EQL (LENGTH |lx|) 0) |f|)
       (#1='T
        (SEQ
         (LETT |x1| (|SPADfirst| |lx|)
               . #2=(|TSEREXPT;taylor_via_deriv;UTSLLUTS;2|))
         (EXIT
          (COND
           ((< (SPADCALL |x1| 1 (QREFELT $ 27)) 1)
            (|error| "taylor_via_deriv: variable has constant term"))
           (#1#
            (SEQ
             (LETT |f| (SPADCALL |f| (CDR |lx|) (CDR |ld|) (QREFELT $ 31))
                   . #2#)
             (LETT |fs| (SPADCALL |f| (QREFELT $ 32)) . #2#)
             (LETT |xs| (SPADCALL |x1| (QREFELT $ 32)) . #2#)
             (EXIT
              (COND ((SPADCALL |xs| (QREFELT $ 33)) |f|)
                    (#1#
                     (SEQ (LETT |xs| (SPADCALL |xs| (QREFELT $ 34)) . #2#)
                          (LETT |one|
                                (SPADCALL (|spadConstant| $ 9) (QREFELT $ 32))
                                . #2#)
                          (LETT |ds|
                                (|TSEREXPT;stream_taylor| |fs| |xs| |one|
                                 (CONS
                                  #'|TSEREXPT;taylor_via_deriv;UTSLLUTS;2!0|
                                  (VECTOR $ |ld|))
                                 1 $)
                                . #2#)
                          (EXIT
                           (SPADCALL (SPADCALL |ds| (QREFELT $ 37))
                                     (QREFELT $ 38)))))))))))))))))) 

(DEFUN |TSEREXPT;taylor_via_deriv;UTSLLUTS;2!0| (|s| $$)
  (PROG (|ld| $)
    (LETT |ld| (QREFELT $$ 1) . #1=(|TSEREXPT;taylor_via_deriv;UTSLLUTS;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |ld| (QREFELT $ 35)) |s| (QREFELT $ 36)))))) 

(DEFUN |TSEREXPT;taylor_via_lode;LUTSLUTS;3| (|la| |z| |lc| $)
  (PROG ()
    (RETURN
     (SEQ
      (COND
       ((< (SPADCALL |z| 1 (QREFELT $ 27)) 1)
        (|error| "taylor_via_lode: variable has constant term"))
       ((SPADCALL (LENGTH |lc|) (LENGTH |la|) (QREFELT $ 26))
        (|error|
         "taylor_via_lode: number of coefficient and initial values must be equal"))
       ('T
        (SPADCALL
         (SPADCALL
          (CONS #'|TSEREXPT;taylor_via_lode;LUTSLUTS;3!0| (VECTOR |la| $)) |lc|
          (QREFELT $ 46))
         |z| (QREFELT $ 47)))))))) 

(DEFUN |TSEREXPT;taylor_via_lode;LUTSLUTS;3!0| (|ls| $$)
  (PROG ($ |la|)
    (LETT $ (QREFELT $$ 1) . #1=(|TSEREXPT;taylor_via_lode;LUTSLUTS;3|))
    (LETT |la| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G167 |s| #3=#:G168 |a| #4=#:G166)
        (RETURN
         (SEQ
          (SPADCALL (ELT $ 39)
                    (PROGN
                     (LETT #4# NIL NIL)
                     (SEQ (LETT |a| NIL NIL) (LETT #3# |la| NIL)
                          (LETT |s| NIL NIL) (LETT #2# |ls| NIL) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#) NIL) NIL)
                                (ATOM #3#)
                                (PROGN (LETT |a| (CAR #3#) NIL) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS (SPADCALL |s| |a| (QREFELT $ 40)) #4#)
                                  NIL)))
                          (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) NIL))
                                NIL)
                          (GO G190) G191 (EXIT (NREVERSE #4#))))
                    (QREFELT $ 42))))))))) 

(PUT '|TSEREXPT;applyTaylor;M2UTS;4| '|SPADreplace|
     '(XLAM (|g| |f|) (SPADCALL |f| |g|))) 

(DEFUN |TSEREXPT;applyTaylor;M2UTS;4| (|g| |f| $) (SPADCALL |f| |g|)) 

(DECLAIM (NOTINLINE |TaylorSeriesExpansionTaylor;|)) 

(DEFUN |TaylorSeriesExpansionTaylor| (&REST #1=#:G174)
  (PROG ()
    (RETURN
     (PROG (#2=#:G175)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|TaylorSeriesExpansionTaylor|)
                                           '|domainEqualList|)
                . #3=(|TaylorSeriesExpansionTaylor|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |TaylorSeriesExpansionTaylor;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|TaylorSeriesExpansionTaylor|))))))))))) 

(DEFUN |TaylorSeriesExpansionTaylor;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|TaylorSeriesExpansionTaylor|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|TaylorSeriesExpansionTaylor| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 51) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TaylorSeriesExpansionTaylor|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|TaylorSeriesExpansionTaylor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . |One|) (|Integer|) (8 . |One|) (|Fraction| 10) (12 . /)
              (18 . *) (|Stream| 6) (|StreamTaylorSeriesOperations| 6) (24 . *)
              (30 . *) (36 . +) (|Stream| 15) (42 . |concat|) (|Mapping| $)
              (48 . |delay|) (|Boolean|) (|NonNegativeInteger|) (53 . ~=)
              (59 . |order|) (|List| 7) (|Mapping| 6 6) (|List| 29)
              |TSEREXPT;taylor_via_deriv;UTSLLUTS;2| (65 . |coefficients|)
              (70 . |empty?|) (75 . |rest|) (80 . |first|) (85 . |map|)
              (91 . |addiag|) (96 . |series|) (101 . +) (107 . *)
              (|Mapping| 7 7 7) (113 . |reduce|) (|Mapping| 7 28) (|List| 6)
              (|UnivariateTaylorSeriesODESolver| 6 7) (119 . |ode|)
              (125 . |elt|) |TSEREXPT;taylor_via_lode;LUTSLUTS;3|
              (|Mapping| 7 7) |TSEREXPT;applyTaylor;M2UTS;4|)
           '#(|taylor_via_lode| 131 |taylor_via_deriv| 138 |applyTaylor| 152)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(|TaylorSeriesExpansion&|)
                       (CONS
                        '#((|TaylorSeriesExpansion| 6 25
                                                    (|SingletonAsOrderedSet|) 7
                                                    7))
                        (|makeByteWordVec2| 50
                                            '(0 6 0 8 0 7 0 9 0 10 0 11 2 12 0
                                              10 10 13 2 6 0 12 0 14 2 16 15 15
                                              15 17 2 16 15 6 15 18 2 10 0 0 0
                                              19 2 20 0 15 0 21 1 20 0 22 23 2
                                              25 24 0 0 26 2 7 25 0 25 27 1 7
                                              15 0 32 1 15 24 0 33 1 15 0 0 34
                                              1 30 29 0 35 2 15 0 29 0 36 1 16
                                              15 20 37 1 7 0 15 38 2 7 0 0 0 39
                                              2 7 0 0 0 40 2 28 7 41 0 42 2 45
                                              7 43 44 46 2 7 0 0 0 47 3 0 7 28
                                              7 44 48 3 0 7 7 28 30 31 3 0 7 6
                                              28 30 1 2 0 7 49 7 50)))))
           '|lookupComplete|)) 
