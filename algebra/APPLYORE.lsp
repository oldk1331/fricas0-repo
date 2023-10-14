
(/VERSIONCHECK 2) 

(DEFUN |APPLYORE;apply;PM2M;1| (|p| |f| |m| $)
  (PROG (|mn| |w| #1=#:G132 |i|)
    (RETURN
     (SEQ (LETT |w| (|spadConstant| $ 9) . #2=(|APPLYORE;apply;PM2M;1|))
          (LETT |mn| |m| . #2#)
          (SEQ (LETT |i| 0 . #2#)
               (LETT #1# (SPADCALL |p| (QREFELT $ 11)) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |w|
                      (SPADCALL |w|
                                (SPADCALL (SPADCALL |p| |i| (QREFELT $ 12))
                                          |mn| (QREFELT $ 13))
                                (QREFELT $ 14))
                      . #2#)
                (EXIT (LETT |mn| (SPADCALL |mn| |f|) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |w|))))) 

(DEFUN |ApplyUnivariateSkewPolynomial| (&REST #1=#:G133)
  (PROG ()
    (RETURN
     (PROG (#2=#:G134)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ApplyUnivariateSkewPolynomial|)
                                           '|domainEqualList|)
                . #3=(|ApplyUnivariateSkewPolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ApplyUnivariateSkewPolynomial;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|ApplyUnivariateSkewPolynomial|))))))))))) 

(DEFUN |ApplyUnivariateSkewPolynomial;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ApplyUnivariateSkewPolynomial|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|ApplyUnivariateSkewPolynomial| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 17) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ApplyUnivariateSkewPolynomial|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ApplyUnivariateSkewPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |Zero|) (|NonNegativeInteger|) (4 . |degree|)
              (9 . |coefficient|) (15 . *) (21 . +) (|Mapping| 7 7)
              |APPLYORE;apply;PM2M;1|)
           '#(|apply| 27) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 16
                                                 '(0 7 0 9 1 8 10 0 11 2 8 6 0
                                                   10 12 2 7 0 6 0 13 2 7 0 0 0
                                                   14 3 0 7 8 15 7 16)))))
           '|lookupComplete|)) 
