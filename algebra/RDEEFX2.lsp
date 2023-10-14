
(DEFUN |RDEEFX2;risch_de_ext;I2FSMMR;1| (|n| |f| |g| |x| |lim| |ext| $)
  (SPADCALL |n| |f| |g| |x| |lim| |ext| (QREFELT $ 20))) 

(DEFUN |RDEEFX2;risch_de_ext;I2FSMMR;2| (|n| |f| |g| |x| |lim| |ext| $)
  (PROG (|res1|)
    (RETURN
     (SEQ
      (LETT |res1| (SPADCALL |n| |f| |g| |x| |lim| |ext| (QREFELT $ 32))
            |RDEEFX2;risch_de_ext;I2FSMMR;2|)
      (EXIT
       (VECTOR (QVELT |res1| 0) (QVELT |res1| 1) (|spadConstant| $ 33)
               (QVELT |res1| 2))))))) 

(DEFUN |RDEEFX2;risch_de_ext;I2FSMMR;3| (|n| |f| |g| |x| |lim| |ext| $)
  (PROG (|res1|)
    (RETURN
     (SEQ
      (LETT |res1| (SPADCALL |n| |f| |g| |x| |lim| |ext| (QREFELT $ 32))
            |RDEEFX2;risch_de_ext;I2FSMMR;3|)
      (EXIT
       (VECTOR (QVELT |res1| 0) (QVELT |res1| 1) (|spadConstant| $ 33)
               (QVELT |res1| 2))))))) 

(DECLAIM (NOTINLINE |ElementaryRischDEX2;|)) 

(DEFUN |ElementaryRischDEX2| (&REST #1=#:G161)
  (PROG ()
    (RETURN
     (PROG (#2=#:G162)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ElementaryRischDEX2|)
                                           '|domainEqualList|)
                . #3=(|ElementaryRischDEX2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ElementaryRischDEX2;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ElementaryRischDEX2|))))))))))) 

(DEFUN |ElementaryRischDEX2;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryRischDEX2|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ElementaryRischDEX2| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 34) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ElementaryRischDEX2| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|domainEqual| |#2| (|Expression| |#1|))
        (COND
         ((|HasCategory| |#1| '(|EuclideanDomain|))
          (QSETREFV $ 29
                    (CONS (|dispatchFunction| |RDEEFX2;risch_de_ext;I2FSMMR;1|)
                          $)))
         ('T
          (QSETREFV $ 29
                    (CONS (|dispatchFunction| |RDEEFX2;risch_de_ext;I2FSMMR;2|)
                          $)))))
       ('T
        (QSETREFV $ 29
                  (CONS (|dispatchFunction| |RDEEFX2;risch_de_ext;I2FSMMR;3|)
                        $))))
      $)))) 

(MAKEPROP '|ElementaryRischDEX2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |ans| 10) (|:| |right| 10) (|:| |primpart| 10)
                        (|:| |sol?| (|Boolean|)))
              (|Integer|) (|Expression| 6) (|Symbol|)
              (|Record| (|:| |coeff| 10) (|:| |logand| 10))
              (|Record| (|:| |mainpart| 10) (|:| |limitedlogs| (|List| 12)))
              (|Union| 13 '"failed") (|Mapping| 14 10 (|List| 10))
              (|Record| (|:| |ratpart| 10) (|:| |coeff| 10))
              (|Union| 16 '"failed") (|Mapping| 17 10 10)
              (|ElementaryRischDEX| 6) (0 . |ei_int|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |primpart| 7)
                        (|:| |sol?| (|Boolean|)))
              (|Record| (|:| |coeff| 7) (|:| |logand| 7))
              (|Record| (|:| |mainpart| 7) (|:| |limitedlogs| (|List| 22)))
              (|Union| 23 '"failed") (|Mapping| 24 7 (|List| 7))
              (|Record| (|:| |ratpart| 7) (|:| |coeff| 7))
              (|Union| 26 '"failed") (|Mapping| 27 7 7) (10 . |risch_de_ext|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |sol?| (|Boolean|)))
              (|ElementaryRischDE| 6 7) (20 . |rischDE|) (30 . |Zero|))
           '#(|risch_de_ext| 34) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 33
                                                 '(6 19 8 9 10 10 11 15 18 20 6
                                                   0 21 9 7 7 11 25 28 29 6 31
                                                   30 9 7 7 11 25 28 32 0 7 0
                                                   33 6 0 21 9 7 7 11 25 28
                                                   29)))))
           '|lookupComplete|)) 
