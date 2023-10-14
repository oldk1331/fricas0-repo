
(/VERSIONCHECK 2) 

(DEFUN |TSEREXPG;stream_taylor| (|f| |x| |xn| |d| |n| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL
       (CONS #'|TSEREXPG;stream_taylor!0| (VECTOR |x| |d| |xn| |f| |n| $))
       (QREFELT $ 23)))))) 

(DEFUN |TSEREXPG;stream_taylor!0| ($$)
  (PROG ($ |n| |f| |xn| |d| |x|)
    (LETT $ (QREFELT $$ 5) . #1=(|TSEREXPG;stream_taylor|))
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
          (LETT |qn| (SPADCALL (|spadConstant| $ 13) |n| (QREFELT $ 15)) NIL)
          (LETT |ninv| (SPADCALL |qn| (|spadConstant| $ 10) (QREFELT $ 16))
                NIL)
          (LETT |fn| (SPADCALL |f| |xn| (QREFELT $ 17)) NIL)
          (EXIT
           (SPADCALL |fn|
                     (|TSEREXPG;stream_taylor|
                      (SPADCALL (SPADCALL |ninv| |f| (QREFELT $ 18)) |d|) |x|
                      (SPADCALL |x| |xn| (QREFELT $ 17)) |d|
                      (SPADCALL |n| (|spadConstant| $ 13) (QREFELT $ 19)) $)
                     (QREFELT $ 21)))))))))) 

(DEFUN |TSEREXPG;taylor_via_deriv;UPSLLUPS;2| (|f| |lx| |ld| $)
  (PROG (|ss| |d1| |x1|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (LENGTH |lx|) (LENGTH |ld|) (QREFELT $ 26))
        (|error|
         "taylor_via_deriv: number of variables must equal number of derivatives"))
       ((EQL (LENGTH |lx|) 0) |f|)
       (#1='T
        (SEQ
         (LETT |x1|
               (SPADCALL (|SPADfirst| |lx|) (|spadConstant| $ 27)
                         (QREFELT $ 28))
               . #2=(|TSEREXPG;taylor_via_deriv;UPSLLUPS;2|))
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |x1| (|spadConstant| $ 27) (QREFELT $ 30))
                      (|spadConstant| $ 27) (QREFELT $ 31))
            (|error| "taylor_via_deriv: variable is of negative order"))
           ((SPADCALL (SPADCALL |x1| (|spadConstant| $ 27) (QREFELT $ 32))
                      (|spadConstant| $ 29) (QREFELT $ 33))
            (|error| "taylor_via_deriv: variable has constant term"))
           (#1#
            (SEQ
             (LETT |x1|
                   (COND
                    ((SPADCALL (SPADCALL |x1| (QREFELT $ 34))
                               (|spadConstant| $ 27) (QREFELT $ 35))
                     |x1|)
                    (#1# (SPADCALL |x1| (QREFELT $ 36))))
                   . #2#)
             (LETT |f| (SPADCALL |f| (CDR |lx|) (CDR |ld|) (QREFELT $ 40))
                   . #2#)
             (LETT |d1| (|SPADfirst| |ld|) . #2#)
             (LETT |ss|
                   (|TSEREXPG;stream_taylor| |f| |x1| (|spadConstant| $ 11)
                    (CONS #'|TSEREXPG;taylor_via_deriv;UPSLLUPS;2!0|
                          (VECTOR $ |d1|))
                    1 $)
                   . #2#)
             (SPADCALL (SPADCALL |ss| (QREFELT $ 43)) (QREFELT $ 45))
             (EXIT (SPADCALL |ss| (QREFELT $ 47)))))))))))))) 

(DEFUN |TSEREXPG;taylor_via_deriv;UPSLLUPS;2!0| (|y| $$)
  (PROG (|d1| $)
    (LETT |d1| (QREFELT $$ 1) . #1=(|TSEREXPG;taylor_via_deriv;UPSLLUPS;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |d1| |y| (QREFELT $ 41)))))) 

(DEFUN |TSEREXPG;taylor_via_lode;LUPSLUPS;3| (|la| |z| |lc| $)
  (PROG (|ts|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (LENGTH |lc|) (LENGTH |la|) (QREFELT $ 26))
        (|error|
         "taylor_via_lode: number of coefficient and initial values must be equal"))
       ('T
        (SEQ
         (LETT |ts|
               (SPADCALL
                (CONS #'|TSEREXPG;taylor_via_lode;LUPSLUPS;3!0|
                      (VECTOR |la| $))
                |lc| (QREFELT $ 56))
               |TSEREXPG;taylor_via_lode;LUPSLUPS;3|)
         (EXIT
          (SPADCALL (SPADCALL |ts| (QREFELT $ 58)) |z| (QREFELT $ 59)))))))))) 

(DEFUN |TSEREXPG;taylor_via_lode;LUPSLUPS;3!0| (|ls| $$)
  (PROG ($ |la|)
    (LETT $ (QREFELT $$ 1) . #1=(|TSEREXPG;taylor_via_lode;LUPSLUPS;3|))
    (LETT |la| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G162 |s| #3=#:G163 |a| #4=#:G161)
        (RETURN
         (SEQ
          (SPADCALL (ELT $ 48)
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
                                  (CONS (SPADCALL |s| |a| (QREFELT $ 49)) #4#)
                                  NIL)))
                          (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) NIL))
                                NIL)
                          (GO G190) G191 (EXIT (NREVERSE #4#))))
                    (QREFELT $ 52))))))))) 

(DEFUN |TSEREXPG;applyTaylor;M2UPS;4| (|g| |f| $)
  (PROG (|sg| |c0|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |f| (|spadConstant| $ 27) (QREFELT $ 28))
            . #1=(|TSEREXPG;applyTaylor;M2UPS;4|))
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |f| (QREFELT $ 34)) (|spadConstant| $ 27)
                   (QREFELT $ 31))
         (|error| "applyTaylor: f of negative degree"))
        ('T
         (SEQ
          (LETT |c0| (SPADCALL |f| (|spadConstant| $ 27) (QREFELT $ 32)) . #1#)
          (LETT |sg|
                (SPADCALL
                 (SPADCALL (SPADCALL |c0| (QREFELT $ 61))
                           (SPADCALL (|spadConstant| $ 10) 1 (QREFELT $ 62))
                           (QREFELT $ 48))
                 |g|)
                . #1#)
          (EXIT
           (SPADCALL (SPADCALL |sg| (QREFELT $ 58))
                     (SPADCALL |f| (SPADCALL |c0| (QREFELT $ 63))
                               (QREFELT $ 64))
                     (QREFELT $ 59))))))))))) 

(DECLAIM (NOTINLINE |TaylorSeriesExpansionGeneralized;|)) 

(DEFUN |TaylorSeriesExpansionGeneralized| (&REST #1=#:G171)
  (PROG ()
    (RETURN
     (PROG (#2=#:G172)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|TaylorSeriesExpansionGeneralized|)
                                           '|domainEqualList|)
                . #3=(|TaylorSeriesExpansionGeneralized|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |TaylorSeriesExpansionGeneralized;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|TaylorSeriesExpansionGeneralized|))))))))))) 

(DEFUN |TaylorSeriesExpansionGeneralized;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|TaylorSeriesExpansionGeneralized|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$|
            (LIST '|TaylorSeriesExpansionGeneralized| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 67) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TaylorSeriesExpansionGeneralized|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|TaylorSeriesExpansionGeneralized| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |One|) (4 . |One|) (|Integer|)
              (8 . |One|) (|Fraction| 12) (12 . /) (18 . *) (24 . *) (30 . *)
              (36 . +) (|Stream| 8) (42 . |concat|) (|Mapping| $)
              (48 . |delay|) (|Boolean|) (|NonNegativeInteger|) (53 . ~=)
              (59 . |Zero|) (63 . |removeZeros|) (69 . |Zero|) (73 . |order|)
              (79 . <) (85 . |coefficient|) (91 . ~=) (97 . |degree|) (102 . >)
              (108 . |reductum|) (|List| 8) (|Mapping| 6 6) (|List| 38)
              |TSEREXPG;taylor_via_deriv;UPSLLUPS;2| (113 . |map|)
              (|OutputForm|) (119 . |coerce|) (|Void|) (124 . |print|)
              (|Stream| $) (129 . |infsum|) (134 . +) (140 . *)
              (|Mapping| 9 9 9) (|List| 9) (146 . |reduce|) (|Mapping| 9 51)
              (|List| 6) (|UnivariateTaylorSeriesODESolver| 6 9) (152 . |ode|)
              (|Stream| 6) (158 . |coefficients|) (163 . |apply_taylor|)
              |TSEREXPG;taylor_via_lode;LUPSLUPS;3| (169 . |coerce|)
              (174 . |monomial|) (180 . |coerce|) (185 . -) (|Mapping| 9 9)
              |TSEREXPG;applyTaylor;M2UPS;4|)
           '#(|taylor_via_lode| 191 |taylor_via_deriv| 198 |applyTaylor| 212)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(|TaylorSeriesExpansion&|)
                       (CONS
                        '#((|TaylorSeriesExpansion| 6 7
                                                    (|SingletonAsOrderedSet|) 8
                                                    9))
                        (|makeByteWordVec2| 66
                                            '(0 6 0 10 0 8 0 11 0 12 0 13 2 14
                                              0 12 12 15 2 6 0 14 0 16 2 8 0 0
                                              0 17 2 8 0 6 0 18 2 12 0 0 0 19 2
                                              20 0 8 0 21 1 20 0 22 23 2 25 24
                                              0 0 26 0 7 0 27 2 8 0 0 7 28 0 6
                                              0 29 2 8 7 0 7 30 2 7 24 0 0 31 2
                                              8 6 0 7 32 2 6 24 0 0 33 1 8 7 0
                                              34 2 7 24 0 0 35 1 8 0 0 36 2 8 0
                                              38 0 41 1 20 42 0 43 1 42 44 0 45
                                              1 8 0 46 47 2 9 0 0 0 48 2 9 0 0
                                              0 49 2 51 9 50 0 52 2 55 9 53 54
                                              56 1 9 57 0 58 2 8 0 57 0 59 1 9
                                              0 6 61 2 9 0 6 25 62 1 8 0 6 63 2
                                              8 0 0 0 64 3 0 8 51 8 54 60 3 0 8
                                              8 37 39 40 3 0 8 6 37 39 1 2 0 8
                                              65 8 66)))))
           '|lookupComplete|)) 
