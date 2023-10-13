
(/VERSIONCHECK 2) 

(DEFUN |QFORM;quadraticForm;Sm$;1| (|m| $)
  (COND
   ((NULL (SPADCALL |m| (QREFELT $ 10)))
    (|error| "quadraticForm requires a symmetric matrix"))
   ('T |m|))) 

(PUT '|QFORM;matrix;$Sm;2| '|SPADreplace| '(XLAM (|q|) |q|)) 

(DEFUN |QFORM;matrix;$Sm;2| (|q| $) |q|) 

(DEFUN |QFORM;elt;$DpK;3| (|q| |v| $)
  (SPADCALL |v| (SPADCALL (SPADCALL |q| (QREFELT $ 12)) |v| (QREFELT $ 14))
            (QREFELT $ 15))) 

(DEFUN |QFORM;convert;$If;4| (|q| $)
  (PROG (|qf| |mif|)
    (RETURN
     (SEQ
      (LETT |mif| (SPADCALL (SPADCALL |q| (QREFELT $ 12)) (QREFELT $ 18))
            . #1=(|QFORM;convert;$If;4|))
      (LETT |qf|
            (SPADCALL (SPADCALL '|quadraticForm| (QREFELT $ 21))
                      (QREFELT $ 22))
            . #1#)
      (EXIT (SPADCALL (LIST |qf| |mif|) (QREFELT $ 24))))))) 

(DEFUN |QuadraticForm| (&REST #1=#:G136)
  (PROG ()
    (RETURN
     (PROG (#2=#:G137)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|QuadraticForm|)
                                           '|domainEqualList|)
                . #3=(|QuadraticForm|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |QuadraticForm;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|QuadraticForm|))))))))))) 

(DEFUN |QuadraticForm;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|QuadraticForm|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|QuadraticForm| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 33) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory|
                                           (|SquareMatrix| |#1| |#2|)
                                           '(|ConvertibleTo| (|InputForm|)))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|QuadraticForm| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|SquareMatrix| |#1| |#2|))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 25 (CONS (|dispatchFunction| |QFORM;convert;$If;4|) $))))
      $)))) 

(MAKEPROP '|QuadraticForm| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SquareMatrix| 6 7) (|local| |#1|)
              (|local| |#2|) '|Rep| (|Boolean|) (0 . |symmetric?|)
              |QFORM;quadraticForm;Sm$;1| |QFORM;matrix;$Sm;2|
              (|DirectProduct| 6 7) (5 . *) (11 . |dot|) |QFORM;elt;$DpK;3|
              (|InputForm|) (17 . |convert|) (|Symbol|) (|SExpression|)
              (22 . |convert|) (27 . |convert|) (|List| $) (32 . |convert|)
              (37 . |convert|) (|Integer|) (|NonNegativeInteger|)
              (|Union| $ '"failed") (|PositiveInteger|) (|SingleInteger|)
              (|String|) (|OutputForm|))
           '#(~= 42 |zero?| 48 |subtractIfCan| 53 |sample| 59 |quadraticForm|
              63 |matrix| 68 |latex| 73 |hash| 78 |elt| 83 |convert| 89
              |coerce| 94 |Zero| 99 = 103 - 109 + 120 * 126)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 1))
                 (CONS
                  '#(|AbelianGroup&| NIL |AbelianMonoid&| |AbelianSemiGroup&|
                     |SetCategory&| |BasicType&| NIL NIL)
                  (CONS
                   '#((|AbelianGroup|) (|CancellationAbelianMonoid|)
                      (|AbelianMonoid|) (|AbelianSemiGroup|) (|SetCategory|)
                      (|BasicType|) (|CoercibleTo| 32) (|ConvertibleTo| 17))
                   (|makeByteWordVec2| 32
                                       '(1 8 9 0 10 2 8 13 0 13 14 2 13 7 0 0
                                         15 1 5 17 0 18 1 20 0 19 21 1 17 0 20
                                         22 1 17 0 23 24 1 0 17 0 25 2 0 9 0 0
                                         1 1 0 9 0 1 2 0 28 0 0 1 0 0 0 1 1 0 0
                                         5 11 1 0 5 0 12 1 0 31 0 1 1 0 30 0 1
                                         2 0 7 0 13 16 1 1 17 0 25 1 0 32 0 1 0
                                         0 0 1 2 0 9 0 0 1 2 0 0 0 0 1 1 0 0 0
                                         1 2 0 0 0 0 1 2 0 0 26 0 1 2 0 0 27 0
                                         1 2 0 0 29 0 1)))))
           '|lookupComplete|)) 
