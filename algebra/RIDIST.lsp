
(/VERSIONCHECK 2) 

(DEFUN |RIDIST;uniform;SM;1| (|aTob| $)
  (PROG () (RETURN (SEQ (CONS #'|RIDIST;uniform;SM;1!0| (VECTOR $ |aTob|)))))) 

(DEFUN |RIDIST;uniform;SM;1!0| ($$)
  (PROG (|aTob| $)
    (LETT |aTob| (QREFELT $$ 1) . #1=(|RIDIST;uniform;SM;1|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|a| |b| |l| |m| #2=#:G147 |w| |mqnext| |n| |mq|)
        (RETURN
         (SEQ (LETT |a| (SPADCALL |aTob| (QREFELT $ 8)) NIL)
              (LETT |b| (SPADCALL |aTob| (QREFELT $ 9)) NIL)
              (LETT |l| (SPADCALL |a| |b| (QREFELT $ 10)) NIL)
              (LETT |m|
                    (SPADCALL
                     (SPADCALL (SPADCALL |a| |b| (QREFELT $ 11))
                               (QREFELT $ 12))
                     (|spadConstant| $ 26) (QREFELT $ 14))
                    NIL)
              (LETT |w|
                    (SPADCALL 2
                              (PROG1
                                  (LETT #2#
                                        (SPADCALL
                                         (SPADCALL (SPADCALL (QREFELT $ 16))
                                                   (QREFELT $ 18))
                                         2 (QREFELT $ 19))
                                        NIL)
                                (|check_subtype| (>= #2# 0)
                                                 '(|NonNegativeInteger|) #2#))
                              (QREFELT $ 30))
                    NIL)
              (LETT |n| (|spadConstant| $ 22) NIL) (LETT |mq| |m| NIL)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL
                       (LETT |mqnext| (SPADCALL |mq| |w| (QREFELT $ 19)) NIL)
                       (|spadConstant| $ 22) (QREFELT $ 24)))
                     (GO G191)))
                   (SEQ
                    (LETT |n|
                          (SPADCALL |n| (|spadConstant| $ 26) (QREFELT $ 28))
                          NIL)
                    (EXIT (LETT |mq| |mqnext| NIL)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |mq| |n| |w| |l| (QREFELT $ 29)))))))))) 

(DEFUN |RIDIST;ridHack1;5I;2| (|mq| |n| |w| |l| $)
  (PROG (|r| |i|)
    (RETURN
     (SEQ
      (LETT |r| (SPADCALL |mq| (QREFELT $ 33)) . #1=(|RIDIST;ridHack1;5I;2|))
      (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ
            (EXIT
             (LETT |r| (+ (* |r| |w|) (SPADCALL |w| (QREFELT $ 33))) . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (+ |r| |l|)))))) 

(DEFUN |RandomIntegerDistributions| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G158)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|RandomIntegerDistributions|)
                . #2=(|RandomIntegerDistributions|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|RandomIntegerDistributions|
                         (LIST
                          (CONS NIL
                                (CONS 1 (|RandomIntegerDistributions;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|RandomIntegerDistributions|))))))))))) 

(DEFUN |RandomIntegerDistributions;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|RandomIntegerDistributions|)
            . #1=(|RandomIntegerDistributions|))
      (LETT $ (GETREFV 35) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|RandomIntegerDistributions| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|RandomIntegerDistributions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|Segment| 6) (0 . |lo|)
              (5 . |hi|) (10 . |min|) (16 . -) (22 . |abs|) (27 . |One|)
              (31 . +) (|RandomNumberSource|) (37 . |size|) (|IntegerBits|)
              (41 . |bitLength|) (46 . |quo|) (|NonNegativeInteger|) (52 . ^)
              (58 . |Zero|) (|Boolean|) (62 . >) (|PositiveInteger|)
              (68 . |One|) (72 . |One|) (76 . +) |RIDIST;ridHack1;5I;2|
              (82 . ^) (|Mapping| 6) |RIDIST;uniform;SM;1| (88 . |randnum|)
              (|Fraction| 6))
           '#(|uniform| 93 |ridHack1| 98 |poisson| 106 |geometric| 111
              |binomial| 116)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 34
                                                 '(1 7 6 0 8 1 7 6 0 9 2 6 0 0
                                                   0 10 2 6 0 0 0 11 1 6 0 0 12
                                                   0 6 0 13 2 6 0 0 0 14 0 15 6
                                                   16 1 17 6 6 18 2 6 0 0 0 19
                                                   2 6 0 0 20 21 0 20 0 22 2 6
                                                   23 0 0 24 0 25 0 26 0 20 0
                                                   27 2 20 0 0 0 28 2 25 0 0 20
                                                   30 1 15 6 6 33 1 0 31 7 32 4
                                                   0 6 6 6 6 6 29 1 0 31 34 1 1
                                                   0 31 34 1 2 0 31 6 34 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|RandomIntegerDistributions| 'NILADIC T) 
