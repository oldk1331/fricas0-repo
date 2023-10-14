
(/VERSIONCHECK 2) 

(DEFUN |SPFUTS;lambertW0;2UTS;1| (|x| $)
  (PROG (|dx|)
    (RETURN
     (SEQ (LETT |dx| (SPADCALL |x| (QREFELT $ 8)) |SPFUTS;lambertW0;2UTS;1|)
          (EXIT
           (SPADCALL
            (SPADCALL (CONS #'|SPFUTS;lambertW0;2UTS;1!1| (VECTOR |dx| $))
                      (QREFELT $ 27))
            (QREFELT $ 12))))))) 

(DEFUN |SPFUTS;lambertW0;2UTS;1!1| (|s| $$)
  (PROG ($ |dx|)
    (LETT $ (QREFELT $$ 1) . #1=(|SPFUTS;lambertW0;2UTS;1|))
    (LETT |dx| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL (|spadConstant| $ 9)
                   (CONS #'|SPFUTS;lambertW0;2UTS;1!0| (VECTOR $ |s| |dx|))
                   (QREFELT $ 24)))))))) 

(DEFUN |SPFUTS;lambertW0;2UTS;1!0| ($$)
  (PROG (|dx| |s| $)
    (LETT |dx| (QREFELT $$ 2) NIL)
    (LETT |s| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL
        (SPADCALL |dx|
                  (SPADCALL
                   (SPADCALL (SPADCALL |s| (QREFELT $ 12)) (QREFELT $ 13))
                   (QREFELT $ 14))
                  (QREFELT $ 15))
        (SPADCALL
         (SPADCALL (|spadConstant| $ 16) (SPADCALL |s| (QREFELT $ 12))
                   (QREFELT $ 17))
         (SPADCALL (|spadConstant| $ 18) (QREFELT $ 19)) (QREFELT $ 20))
        (QREFELT $ 15))
       (QREFELT $ 21)))))) 

(DEFUN |SPFUTS;compose| (|s| |x| $)
  (SPADCALL (SPADCALL |s| (SPADCALL |x| (QREFELT $ 21)) (QREFELT $ 29))
            (QREFELT $ 12))) 

(DEFUN |SPFUTS;p_re| (|k| |lcr| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL (CONS #'|SPFUTS;p_re!0| (VECTOR |k| $ |lcr|))
                (QREFELT $ 46)))))) 

(DEFUN |SPFUTS;p_re!0| ($$)
  (PROG (|lcr| $ |k|)
    (LETT |lcr| (QREFELT $$ 2) . #1=(|SPFUTS;p_re|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |k| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|lm| |ck_m| #2=#:G147 |cm| #3=#:G146 |m| #4=#:G145 |ss| |two|
             |three| |ck|)
        (RETURN
         (SEQ (LETT |lm| (SPADCALL |lcr| (QREFELT $ 31)) NIL)
              (LETT |ss| (|spadConstant| $ 9) NIL)
              (SEQ (LETT |ck_m| NIL NIL)
                   (LETT #2# (SPADCALL |lcr| (QREFELT $ 34)) NIL)
                   (LETT |cm| NIL NIL) (LETT #3# |lm| NIL) (LETT |m| 2 NIL)
                   (LETT #4# (SPADCALL |k| 2 (QREFELT $ 33)) NIL) G190
                   (COND
                    ((OR (|greater_SI| |m| #4#) (ATOM #3#)
                         (PROGN (LETT |cm| (CAR #3#) NIL) NIL) (ATOM #2#)
                         (PROGN (LETT |ck_m| (CAR #2#) NIL) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |ss|
                           (SPADCALL |ss| (SPADCALL |cm| |ck_m| (QREFELT $ 35))
                                     (QREFELT $ 36))
                           NIL)))
                   (LETT |m|
                         (PROG1 (|inc_SI| |m|)
                           (LETT #3# (PROG1 (CDR #3#) (LETT #2# (CDR #2#) NIL))
                                 NIL))
                         NIL)
                   (GO G190) G191 (EXIT NIL))
              (LETT |two|
                    (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 18)
                              (QREFELT $ 36))
                    NIL)
              (LETT |three|
                    (SPADCALL |two| (|spadConstant| $ 18) (QREFELT $ 36)) NIL)
              (LETT |ck|
                    (SPADCALL (SPADCALL |three| |ss| (QREFELT $ 35))
                              (SPADCALL
                               (SPADCALL (SPADCALL |k| |two| (QREFELT $ 37))
                                         (|spadConstant| $ 18) (QREFELT $ 36))
                               (SPADCALL
                                (SPADCALL |k| (|spadConstant| $ 18)
                                          (QREFELT $ 37))
                                |three| (QREFELT $ 38))
                               (QREFELT $ 35))
                              (QREFELT $ 39))
                    NIL)
              (EXIT
               (SPADCALL |ck|
                         (|SPFUTS;p_re|
                          (SPADCALL |k| (|spadConstant| $ 41) (QREFELT $ 42))
                          (SPADCALL |ck| |lcr| (QREFELT $ 43)) $)
                         (QREFELT $ 44)))))))))) 

(DEFUN |SPFUTS;p_stream| (|g2| |g3| $)
  (PROG (|c28| |c20| |c5| |c4| |c2|)
    (RETURN
     (SEQ
      (LETT |c2|
            (SPADCALL (|spadConstant| $ 18) (|spadConstant| $ 18)
                      (QREFELT $ 36))
            . #1=(|SPFUTS;p_stream|))
      (LETT |c4| (SPADCALL |c2| |c2| (QREFELT $ 36)) . #1#)
      (LETT |c5| (SPADCALL |c4| (|spadConstant| $ 18) (QREFELT $ 36)) . #1#)
      (LETT |c20| (SPADCALL |c4| |c5| (QREFELT $ 35)) . #1#)
      (LETT |c28|
            (SPADCALL |c4| (SPADCALL |c5| |c2| (QREFELT $ 36)) (QREFELT $ 35))
            . #1#)
      (EXIT
       (SPADCALL (|spadConstant| $ 9)
                 (SPADCALL (SPADCALL |g2| |c20| (QREFELT $ 39))
                           (SPADCALL (SPADCALL |g3| |c28| (QREFELT $ 39))
                                     (|SPFUTS;p_re| 4
                                      (LIST
                                       (SPADCALL |g3| |c28| (QREFELT $ 39))
                                       (SPADCALL |g2| |c20| (QREFELT $ 39)))
                                      $)
                                     (QREFELT $ 44))
                           (QREFELT $ 44))
                 (QREFELT $ 44))))))) 

(DEFUN |SPFUTS;weierstrassP0;2Coef2UTS;5| (|g2| |g3| |x| $)
  (|SPFUTS;compose| (|SPFUTS;p_stream| |g2| |g3| $)
   (SPADCALL |x| |x| (QREFELT $ 15)) $)) 

(DEFUN |SPFUTS;weierstrassPPrime0;2Coef2UTS;6| (|g2| |g3| |x| $)
  (SPADCALL (SPADCALL (+ 1 1) |x| (QREFELT $ 49))
            (|SPFUTS;compose|
             (SPADCALL (|SPFUTS;p_stream| |g2| |g3| $) (QREFELT $ 50))
             (SPADCALL |x| |x| (QREFELT $ 15)) $)
            (QREFELT $ 15))) 

(DEFUN |SPFUTS;weierstrassZeta0;2Coef2UTS;7| (|g2| |g3| |x| $)
  (PROG (|ps2|)
    (RETURN
     (SEQ
      (LETT |ps2|
            (SPADCALL (|SPFUTS;p_stream| |g2| |g3| $)
                      (SPADCALL (SPADCALL |x| |x| (QREFELT $ 15))
                                (QREFELT $ 21))
                      (QREFELT $ 29))
            |SPFUTS;weierstrassZeta0;2Coef2UTS;7|)
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL (|spadConstant| $ 9) |ps2| (QREFELT $ 52))
                  (QREFELT $ 12))
        (QREFELT $ 13))))))) 

(DEFUN |SPFUTS;weierstrassSigma0;2Coef2UTS;8| (|g2| |g3| |x| $)
  (PROG (|lsigma| |zs| |ps2|)
    (RETURN
     (SEQ
      (LETT |ps2|
            (SPADCALL (|SPFUTS;p_stream| |g2| |g3| $)
                      (SPADCALL (SPADCALL |x| |x| (QREFELT $ 15))
                                (QREFELT $ 21))
                      (QREFELT $ 29))
            . #1=(|SPFUTS;weierstrassSigma0;2Coef2UTS;8|))
      (LETT |zs| (SPADCALL (|spadConstant| $ 9) |ps2| (QREFELT $ 52)) . #1#)
      (LETT |lsigma|
            (SPADCALL (|spadConstant| $ 9) (SPADCALL |zs| (QREFELT $ 54))
                      (QREFELT $ 52))
            . #1#)
      (EXIT
       (SPADCALL |x|
                 (SPADCALL (SPADCALL |lsigma| (QREFELT $ 56)) (QREFELT $ 12))
                 (QREFELT $ 15))))))) 

(DEFUN |SpecialFunctionUnivariateTaylorSeries| (&REST #1=#:G157)
  (PROG ()
    (RETURN
     (PROG (#2=#:G158)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|SpecialFunctionUnivariateTaylorSeries|)
                                           '|domainEqualList|)
                . #3=(|SpecialFunctionUnivariateTaylorSeries|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |SpecialFunctionUnivariateTaylorSeries;|)
                         #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|SpecialFunctionUnivariateTaylorSeries|))))))))))) 

(DEFUN |SpecialFunctionUnivariateTaylorSeries;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|SpecialFunctionUnivariateTaylorSeries|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|SpecialFunctionUnivariateTaylorSeries| DV$1 DV$2)
            . #1#)
      (LETT $ (GETREFV 58) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SpecialFunctionUnivariateTaylorSeries|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|SpecialFunctionUnivariateTaylorSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |differentiate|) (5 . |Zero|) (9 . |Zero|) (|Stream| 6)
              (13 . |series|) (18 . -) (23 . |exp|) (28 . *) (34 . |One|)
              (38 . +) (44 . |One|) (48 . -) (53 . ^) (59 . |coefficients|)
              (|Mapping| 11) (|StreamTaylorSeriesOperations| 6)
              (64 . |lazyIntegrate|) (|Mapping| 11 11)
              (|ParadoxicalCombinatorsForStreams| 6) (70 . Y)
              |SPFUTS;lambertW0;2UTS;1| (75 . |compose|) (|List| 6)
              (81 . |reverse|) (|Integer|) (86 . -) (92 . |rest|) (97 . *)
              (103 . +) (109 . *) (115 . -) (121 . /) (|SingleInteger|)
              (127 . |One|) (131 . +) (137 . |cons|) (143 . |concat|)
              (|Mapping| $) (149 . |delay|) |SPFUTS;weierstrassP0;2Coef2UTS;5|
              (|PositiveInteger|) (154 . *) (160 . |deriv|)
              |SPFUTS;weierstrassPPrime0;2Coef2UTS;6| (165 . |integrate|)
              |SPFUTS;weierstrassZeta0;2Coef2UTS;7| (171 . -)
              (|StreamTranscendentalFunctions| 6) (176 . |exp|)
              |SPFUTS;weierstrassSigma0;2Coef2UTS;8|)
           '#(|weierstrassZeta0| 181 |weierstrassSigma0| 188
              |weierstrassPPrime0| 195 |weierstrassP0| 202 |lambertW0| 209)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 57
                                                 '(1 7 0 0 8 0 6 0 9 0 7 0 10 1
                                                   7 0 11 12 1 7 0 0 13 1 7 0 0
                                                   14 2 7 0 0 0 15 0 7 0 16 2 7
                                                   0 0 0 17 0 6 0 18 1 6 0 0 19
                                                   2 7 0 0 6 20 1 7 11 0 21 2
                                                   23 11 6 22 24 1 26 11 25 27
                                                   2 23 11 11 11 29 1 30 0 0 31
                                                   2 32 0 0 0 33 1 30 0 0 34 2
                                                   6 0 0 0 35 2 6 0 0 0 36 2 6
                                                   0 32 0 37 2 6 0 0 0 38 2 6 0
                                                   0 0 39 0 40 0 41 2 32 0 0 0
                                                   42 2 30 0 6 0 43 2 11 0 6 0
                                                   44 1 11 0 45 46 2 7 0 48 0
                                                   49 1 23 11 11 50 2 23 11 6
                                                   11 52 1 23 11 11 54 1 55 11
                                                   11 56 3 0 7 6 6 7 53 3 0 7 6
                                                   6 7 57 3 0 7 6 6 7 51 3 0 7
                                                   6 6 7 47 1 0 7 7 28)))))
           '|lookupComplete|)) 
