
(/VERSIONCHECK 2) 

(DEFUN |PUSHVAR;pushdown;PPROVPPR;1| (|g| |x| $)
  (SPADCALL |g| |x|
            (SPADCALL (|spadConstant| $ 13) (SPADCALL |x| (QREFELT $ 15)) 1
                      (QREFELT $ 17))
            (QREFELT $ 18))) 

(DEFUN |PUSHVAR;pushdown;PPRLPPR;2| (|g| |lv| $)
  (PROG (|vals| #1=#:G134 |x| #2=#:G133)
    (RETURN
     (SEQ
      (LETT |vals|
            (PROGN
             (LETT #2# NIL . #3=(|PUSHVAR;pushdown;PPRLPPR;2|))
             (SEQ (LETT |x| NIL . #3#) (LETT #1# |lv| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (SPADCALL (|spadConstant| $ 13)
                                     (SPADCALL |x| (QREFELT $ 15)) 1
                                     (QREFELT $ 17))
                           #2#)
                          . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (SPADCALL |g| |lv| |vals| (QREFELT $ 22))))))) 

(DEFUN |PUSHVAR;map;M2PPR;3| (|f| |p| $)
  (PROG (|v| #1=#:G136)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 25))
        (SPADCALL (SPADCALL |p| (QREFELT $ 26)) |f|))
       ('T
        (SEQ
         (LETT |v|
               (PROG2
                   (LETT #1# (SPADCALL |p| (QREFELT $ 28))
                         . #2=(|PUSHVAR;map;M2PPR;3|))
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 0) (QREFELT $ 8) #1#))
               . #2#)
         (EXIT
          (SPADCALL
           (SPADCALL (CONS #'|PUSHVAR;map;M2PPR;3!0| (VECTOR $ |f|))
                     (SPADCALL |p| |v| (QREFELT $ 32)) (QREFELT $ 35))
           |v| (QREFELT $ 36)))))))))) 

(DEFUN |PUSHVAR;map;M2PPR;3!0| (|x| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|PUSHVAR;map;M2PPR;3|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |f| |x| (QREFELT $ 30)))))) 

(DEFUN |PUSHVAR;pushupCoef| (|c| |lv| $)
  (PROG (|uc| |ppr| |v2| |v| #1=#:G154)
    (RETURN
     (SEQ
      (COND ((SPADCALL |c| (QREFELT $ 37)) (SPADCALL |c| (QREFELT $ 38)))
            (#2='T
             (SEQ
              (LETT |v|
                    (PROG2
                        (LETT #1# (SPADCALL |c| (QREFELT $ 40))
                              . #3=(|PUSHVAR;pushupCoef|))
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0) (|Symbol|) #1#))
                    . #3#)
              (LETT |v2| (SPADCALL |v| (QREFELT $ 42)) . #3#)
              (LETT |uc| (SPADCALL |c| |v| (QREFELT $ 43)) . #3#)
              (LETT |ppr| (|spadConstant| $ 44) . #3#)
              (EXIT
               (COND
                ((QEQCAR |v2| 0)
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((SPADCALL |uc| (QREFELT $ 46)) 'NIL) ('T 'T)))
                         (GO G191)))
                       (SEQ
                        (LETT |ppr|
                              (SPADCALL |ppr|
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 11)
                                                   (QCDR |v2|)
                                                   (SPADCALL |uc|
                                                             (QREFELT $ 47))
                                                   (QREFELT $ 48))
                                         (|PUSHVAR;pushupCoef|
                                          (SPADCALL |uc| (QREFELT $ 49)) |lv|
                                          $)
                                         (QREFELT $ 50))
                                        (QREFELT $ 51))
                              . #3#)
                        (EXIT
                         (LETT |uc| (SPADCALL |uc| (QREFELT $ 52)) . #3#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |ppr|)))
                (#2#
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((SPADCALL |uc| (QREFELT $ 46)) 'NIL) ('T 'T)))
                         (GO G191)))
                       (SEQ
                        (LETT |ppr|
                              (SPADCALL |ppr|
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 13) |v|
                                                   (SPADCALL |uc|
                                                             (QREFELT $ 47))
                                                   (QREFELT $ 17))
                                         (|PUSHVAR;pushupCoef|
                                          (SPADCALL |uc| (QREFELT $ 49)) |lv|
                                          $)
                                         (QREFELT $ 53))
                                        (QREFELT $ 51))
                              . #3#)
                        (EXIT
                         (LETT |uc| (SPADCALL |uc| (QREFELT $ 52)) . #3#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |ppr|)))))))))))) 

(DEFUN |PUSHVAR;pushup;PPROVPPR;5| (|f| |x| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|PUSHVAR;pushup;PPROVPPR;5!0| (VECTOR $ |x|)) |f|
               (QREFELT $ 30))))) 

(DEFUN |PUSHVAR;pushup;PPROVPPR;5!0| (|y| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|PUSHVAR;pushup;PPROVPPR;5|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|PUSHVAR;pushupCoef| |y| (LIST |x|) $))))) 

(DEFUN |PUSHVAR;pushup;PPRLPPR;6| (|g| |lv| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|PUSHVAR;pushup;PPRLPPR;6!0| (VECTOR $ |lv|)) |g|
               (QREFELT $ 30))))) 

(DEFUN |PUSHVAR;pushup;PPRLPPR;6!0| (|y| $$)
  (PROG (|lv| $)
    (LETT |lv| (QREFELT $$ 1) . #1=(|PUSHVAR;pushup;PPRLPPR;6|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|PUSHVAR;pushupCoef| |y| |lv| $))))) 

(DEFUN |PushVariables| (&REST #1=#:G174)
  (PROG ()
    (RETURN
     (PROG (#2=#:G175)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PushVariables|)
                                           '|domainEqualList|)
                . #3=(|PushVariables|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PushVariables;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|PushVariables|))))))))))) 

(DEFUN |PushVariables;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PushVariables|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|PushVariables| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 56) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PushVariables|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PushVariables| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |One|) (4 . |One|)
              (|Polynomial| 6) (8 . |One|) (|Symbol|) (12 . |convert|)
              (|NonNegativeInteger|) (17 . |monomial|) (24 . |eval|)
              |PUSHVAR;pushdown;PPROVPPR;1| (|List| 8) (|List| 12)
              (31 . |eval|) |PUSHVAR;pushdown;PPRLPPR;2| (|Boolean|)
              (38 . |ground?|) (43 . |retract|) (|Union| 8 '"failed")
              (48 . |mainVariable|) (|Mapping| 9 12) |PUSHVAR;map;M2PPR;3|
              (|SparseUnivariatePolynomial| $) (53 . |univariate|)
              (|Mapping| 9 9) (|SparseUnivariatePolynomial| 9) (59 . |map|)
              (65 . |multivariate|) (71 . |ground?|) (76 . |coerce|)
              (|Union| 14 '"failed") (81 . |mainVariable|)
              (|Union| $ '"failed") (86 . |variable|) (91 . |univariate|)
              (97 . |Zero|) (|SparseUnivariatePolynomial| 12) (101 . |zero?|)
              (106 . |degree|) (111 . |monomial|) (118 . |leadingCoefficient|)
              (123 . *) (129 . +) (135 . |reductum|) (140 . *)
              |PUSHVAR;pushup;PPROVPPR;5| |PUSHVAR;pushup;PPRLPPR;6|)
           '#(|pushup| 146 |pushdown| 158 |map| 170) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 55
                                                 '(0 6 0 10 0 9 0 11 0 12 0 13
                                                   1 8 14 0 15 3 12 0 0 14 16
                                                   17 3 9 0 0 8 12 18 3 9 0 0
                                                   20 21 22 1 9 24 0 25 1 9 12
                                                   0 26 1 9 27 0 28 2 9 31 0 8
                                                   32 2 34 0 33 0 35 2 9 0 31 8
                                                   36 1 12 24 0 37 1 9 0 12 38
                                                   1 12 39 0 40 1 8 41 14 42 2
                                                   12 31 0 14 43 0 9 0 44 1 45
                                                   24 0 46 1 45 16 0 47 3 9 0 0
                                                   8 16 48 1 45 12 0 49 2 9 0 0
                                                   0 50 2 9 0 0 0 51 1 45 0 0
                                                   52 2 9 0 12 0 53 2 0 9 9 8
                                                   54 2 0 9 9 20 55 2 0 9 9 20
                                                   23 2 0 9 9 8 19 2 0 9 29 9
                                                   30)))))
           '|lookupComplete|)) 
