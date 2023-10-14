
(/VERSIONCHECK 2) 

(DEFUN |VARIABLE;coerce;$S;1| (|x| $) (QREFELT $ 6)) 

(DEFUN |VARIABLE;coerce;$Of;2| (|x| $) (SPADCALL (QREFELT $ 6) (QREFELT $ 10))) 

(DEFUN |VARIABLE;variable;S;3| ($) (QREFELT $ 6)) 

(PUT '|VARIABLE;=;2$B;4| '|SPADreplace| '(XLAM (|x| |y|) 'T)) 

(DEFUN |VARIABLE;=;2$B;4| (|x| |y| $) 'T) 

(DEFUN |VARIABLE;latex;$S;5| (|x| $) (SPADCALL (QREFELT $ 6) (QREFELT $ 16))) 

(DEFUN |Variable| (#1=#:G132)
  (PROG ()
    (RETURN
     (PROG (#2=#:G133)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|Variable|)
                                           '|domainEqualList|)
                . #3=(|Variable|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Variable;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Variable|))))))))))) 

(DEFUN |Variable;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Variable|))
      (LETT |dv$| (LIST '|Variable| DV$1) . #1#)
      (LETT $ (GETREFV 20) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Variable| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|Variable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|)
              |VARIABLE;coerce;$S;1| (|OutputForm|) (0 . |coerce|)
              |VARIABLE;coerce;$Of;2| |VARIABLE;variable;S;3| (|Boolean|)
              |VARIABLE;=;2$B;4| (|String|) (5 . |latex|) |VARIABLE;latex;$S;5|
              (|HashState|) (|SingleInteger|))
           '#(~= 10 |variable| 16 |latex| 20 |hashUpdate!| 25 |hash| 31
              |coerce| 36 = 46)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 7)
                           (|CoercibleTo| 9))
                        (|makeByteWordVec2| 19
                                            '(1 7 9 0 10 1 7 15 0 16 2 0 13 0 0
                                              1 0 0 7 12 1 0 15 0 17 2 0 18 18
                                              0 1 1 0 19 0 1 1 0 7 0 8 1 0 9 0
                                              11 2 0 13 0 0 14)))))
           '|lookupComplete|)) 
