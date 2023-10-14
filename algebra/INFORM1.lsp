
(/VERSIONCHECK 2) 

(DEFUN |INFORM1;getType;If;1| ($) (QREFELT $ 7)) 

(DEFUN |INFORM1;packageCall;SIf;2| (|name| $)
  (SPADCALL
   (LIST (SPADCALL '|$elt| (QREFELT $ 11)) (QREFELT $ 7)
         (SPADCALL |name| (QREFELT $ 11)))
   (QREFELT $ 13))) 

(DEFUN |INFORM1;packageCall;SLIf;3| (|name| |args| $)
  (SPADCALL (CONS (SPADCALL |name| (QREFELT $ 14)) |args|) (QREFELT $ 13))) 

(DEFUN |INFORM1;coerceToType;2If;4| (|form| $)
  (SPADCALL (LIST (SPADCALL '|::| (QREFELT $ 11)) |form| (QREFELT $ 7))
            (QREFELT $ 13))) 

(DEFUN |INFORM1;atType;2If;5| (|form| $)
  (SPADCALL (LIST (SPADCALL '@ (QREFELT $ 11)) |form| (QREFELT $ 7))
            (QREFELT $ 13))) 

(DEFUN |INFORM1;pretendOfType;2If;6| (|form| $)
  (SPADCALL (LIST (SPADCALL '|pretend| (QREFELT $ 11)) |form| (QREFELT $ 7))
            (QREFELT $ 13))) 

(DEFUN |INFORM1;interpret;IfR;7| (|form| $)
  (SPADCALL (SPADCALL (SPADCALL |form| (QREFELT $ 18)) (QREFELT $ 21))
            (QREFELT $ 23))) 

(DECLAIM (NOTINLINE |InputFormFunctions1;|)) 

(DEFUN |InputFormFunctions1| (#1=#:G134)
  (PROG ()
    (RETURN
     (PROG (#2=#:G135)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|InputFormFunctions1|)
                                           '|domainEqualList|)
                . #3=(|InputFormFunctions1|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|InputFormFunctions1;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|InputFormFunctions1|))))))))))) 

(DEFUN |InputFormFunctions1;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|InputFormFunctions1|))
      (LETT |dv$| (LIST '|InputFormFunctions1| DV$1) . #1#)
      (LETT $ (GETREFV 25) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|InputFormFunctions1| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|typeToInputForm| |#1|))
      $)))) 

(MAKEPROP '|InputFormFunctions1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rname| (|InputForm|)
              |INFORM1;getType;If;1| (|Symbol|) (0 . |convert|) (|List| $)
              (5 . |convert|) |INFORM1;packageCall;SIf;2| (|List| 8)
              |INFORM1;packageCall;SLIf;3| |INFORM1;coerceToType;2If;4|
              |INFORM1;atType;2If;5| |INFORM1;pretendOfType;2If;6| (|Any|)
              (10 . |interpret|) (|AnyFunctions1| 6) (15 . |retract|)
              |INFORM1;interpret;IfR;7|)
           '#(|pretendOfType| 20 |packageCall| 25 |interpret| 36 |getType| 41
              |coerceToType| 45 |atType| 50)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 24
                                                 '(1 8 0 10 11 1 8 0 12 13 1 8
                                                   20 0 21 1 22 6 20 23 1 0 8 8
                                                   19 1 0 8 10 14 2 0 8 10 15
                                                   16 1 0 6 8 24 0 0 8 9 1 0 8
                                                   8 17 1 0 8 8 18)))))
           '|lookupComplete|)) 
