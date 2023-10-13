
(/VERSIONCHECK 2) 

(DEFUN |COMPLPAT;convert;CSP;1| (|cs| $)
  (COND
   ((SPADCALL (SPADCALL |cs| (QREFELT $ 14)) (QREFELT $ 15))
    (SPADCALL (SPADCALL |cs| (QREFELT $ 16)) (QREFELT $ 17)))
   ('T
    (SPADCALL (SPADCALL (SPADCALL |cs| (QREFELT $ 16)) (QREFELT $ 17))
              (SPADCALL (QREFELT $ 13)
                        (SPADCALL (SPADCALL |cs| (QREFELT $ 14))
                                  (QREFELT $ 17))
                        (QREFELT $ 18))
              (QREFELT $ 19))))) 

(DEFUN |ComplexPattern| (&REST #1=#:G128)
  (PROG ()
    (RETURN
     (PROG (#2=#:G129)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ComplexPattern|)
                                           '|domainEqualList|)
                . #3=(|ComplexPattern|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ComplexPattern;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|ComplexPattern|))))))))))) 

(DEFUN |ComplexPattern;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ComplexPattern|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|ComplexPattern| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 21) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ComplexPattern| (LIST DV$1 DV$2 DV$3)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 13 (SPADCALL '|%i| 'T 'NIL 'NIL (QREFELT $ 12)))
      $)))) 

(MAKEPROP '|ComplexPattern| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Symbol|) (|Boolean|) (|Pattern| 6)
              (0 . |patternVariable|) '|ipat| (8 . |imag|) (13 . |zero?|)
              (18 . |real|) (23 . |convert|) (28 . *) (34 . +)
              |COMPLPAT;convert;CSP;1|)
           '#(|convert| 40) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 20
                                                 '(4 11 0 9 10 10 10 12 1 8 7 0
                                                   14 1 7 10 0 15 1 8 7 0 16 1
                                                   7 11 0 17 2 11 0 0 0 18 2 11
                                                   0 0 0 19 1 0 11 8 20)))))
           '|lookupComplete|)) 
