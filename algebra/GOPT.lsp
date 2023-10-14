
(/VERSIONCHECK 2) 

(DEFUN |GOPT;maxLevel;U$;1| (|d| $)
  (CONS '|maxLevel| (SPADCALL |d| (QREFELT $ 10)))) 

(DEFUN |GOPT;maxDerivative;U$;2| (|d| $)
  (CONS '|maxDerivative| (SPADCALL |d| (QREFELT $ 10)))) 

(DEFUN |GOPT;maxShift;U$;3| (|d| $) (SPADCALL |d| (QREFELT $ 12))) 

(DEFUN |GOPT;maxSubst;U$;4| (|d| $)
  (PROG (#1=#:G152)
    (RETURN
     (COND
      ((QEQCAR |d| 0)
       (SPADCALL
        (CONS 0
              (PROG1 (LETT #1# (- (QCDR |d|) 1) |GOPT;maxSubst;U$;4|)
                (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#)))
        (QREFELT $ 12)))
      ('T (SPADCALL (CONS 1 (QCDR |d|)) (QREFELT $ 12))))))) 

(DEFUN |GOPT;maxDegree;U$;5| (|d| $)
  (CONS '|maxDegree| (SPADCALL |d| (QREFELT $ 10)))) 

(DEFUN |GOPT;maxMixedDegree;Nni$;6| (|d| $)
  (CONS '|maxMixedDegree| (SPADCALL |d| (QREFELT $ 19)))) 

(DEFUN |GOPT;allDegrees;B$;7| (|d| $)
  (CONS '|allDegrees| (SPADCALL |d| (QREFELT $ 23)))) 

(DEFUN |GOPT;maxPower;U$;8| (|d| $)
  (CONS '|maxPower| (SPADCALL |d| (QREFELT $ 26)))) 

(DEFUN |GOPT;safety;Nni$;9| (|d| $)
  (CONS '|safety| (SPADCALL |d| (QREFELT $ 19)))) 

(DEFUN |GOPT;homogeneous;U$;10| (|d| $)
  (CONS '|homogeneous| (SPADCALL |d| (QREFELT $ 31)))) 

(DEFUN |GOPT;Somos;U$;11| (|d| $) (CONS '|Somos| (SPADCALL |d| (QREFELT $ 31)))) 

(DEFUN |GOPT;debug;B$;12| (|d| $) (CONS '|debug| (SPADCALL |d| (QREFELT $ 23)))) 

(DEFUN |GOPT;check;U$;13| (|d| $) (CONS '|check| (SPADCALL |d| (QREFELT $ 37)))) 

(DEFUN |GOPT;checkExtraValues;B$;14| (|d| $)
  (CONS '|checkExtraValues| (SPADCALL |d| (QREFELT $ 23)))) 

(DEFUN |GOPT;one;B$;15| (|d| $) (CONS '|one| (SPADCALL |d| (QREFELT $ 23)))) 

(DEFUN |GOPT;functionName;S$;16| (|d| $)
  (CONS '|functionName| (SPADCALL |d| (QREFELT $ 43)))) 

(DEFUN |GOPT;functionNames;L$;17| (|d| $)
  (CONS '|functionNames| (SPADCALL |d| (QREFELT $ 47)))) 

(DEFUN |GOPT;variableName;S$;18| (|d| $)
  (CONS '|variableName| (SPADCALL |d| (QREFELT $ 43)))) 

(DEFUN |GOPT;indexName;S$;19| (|d| $)
  (CONS '|indexName| (SPADCALL |d| (QREFELT $ 43)))) 

(DEFUN |GOPT;displayKind;S$;20| (|d| $)
  (CONS '|displayKind| (SPADCALL |d| (QREFELT $ 43)))) 

(DEFUN |GOPT;coerce;$Of;21| (|x| $)
  (SPADCALL (SPADCALL (QCAR |x|) (QREFELT $ 53))
            (SPADCALL (QCDR |x|) (QREFELT $ 54)) (QREFELT $ 55))) 

(DEFUN |GOPT;=;2$B;22| (|x| |y| $)
  (COND
   ((EQUAL (QCAR |x|) (QCAR |y|))
    (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 57)))
   ('T 'NIL))) 

(DEFUN |GOPT;option;LSU;23| (|l| |s| $)
  (PROG (#1=#:G208 #2=#:G213 #3=#:G214 |x|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |x| NIL . #4=(|GOPT;option;LSU;23|)) (LETT #3# |l| . #4#)
               G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQUAL (QCAR |x|) |s|)
                   (PROGN
                    (LETT #1#
                          (PROGN (LETT #2# (CONS 0 (QCDR |x|)) . #4#) (GO #2#))
                          . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (CONS 1 "failed"))))
      #2# (EXIT #2#))))) 

(DECLAIM (NOTINLINE |GuessOption;|)) 

(DEFUN |GuessOption| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G216)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|GuessOption|)
                . #2=(|GuessOption|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|GuessOption|
                         (LIST (CONS NIL (CONS 1 (|GuessOption;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|GuessOption|))))))))))) 

(DEFUN |GuessOption;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|GuessOption|) . #1=(|GuessOption|))
      (LETT $ (GETREFV 65) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|GuessOption| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record| (|:| |keyword| (|Symbol|)) (|:| |value| (|Any|))))
      $)))) 

(MAKEPROP '|GuessOption| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Any|) (|Union| 17 '"arbitrary")
              (|AnyFunctions1| 8) (0 . |coerce|) |GOPT;maxLevel;U$;1|
              |GOPT;maxDerivative;U$;2| |GOPT;maxShift;U$;3|
              (|Union| (|PositiveInteger|) '"arbitrary") |GOPT;maxSubst;U$;4|
              |GOPT;maxDegree;U$;5| (|NonNegativeInteger|) (|AnyFunctions1| 17)
              (5 . |coerce|) |GOPT;maxMixedDegree;Nni$;6| (|Boolean|)
              (|AnyFunctions1| 21) (10 . |coerce|) |GOPT;allDegrees;B$;7|
              (|AnyFunctions1| 14) (15 . |coerce|) |GOPT;maxPower;U$;8|
              |GOPT;safety;Nni$;9| (|Union| (|PositiveInteger|) 21)
              (|AnyFunctions1| 29) (20 . |coerce|) |GOPT;homogeneous;U$;10|
              |GOPT;Somos;U$;11| |GOPT;debug;B$;12|
              (|Union| '"skip" '"MonteCarlo" '"deterministic")
              (|AnyFunctions1| 35) (25 . |coerce|) |GOPT;check;U$;13|
              |GOPT;checkExtraValues;B$;14| |GOPT;one;B$;15| (|Symbol|)
              (|AnyFunctions1| 41) (30 . |coerce|) |GOPT;functionName;S$;16|
              (|List| 41) (|AnyFunctions1| 45) (35 . |coerce|)
              |GOPT;functionNames;L$;17| |GOPT;variableName;S$;18|
              |GOPT;indexName;S$;19| |GOPT;displayKind;S$;20| (|OutputForm|)
              (40 . |coerce|) (45 . |coerce|) (50 . =) |GOPT;coerce;$Of;21|
              (56 . =) |GOPT;=;2$B;22| (|Union| 7 '"failed") (|List| $)
              |GOPT;option;LSU;23| (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 62 |variableName| 68 |safety| 73 |option| 78 |one| 84
              |maxSubst| 89 |maxShift| 94 |maxPower| 99 |maxMixedDegree| 104
              |maxLevel| 109 |maxDerivative| 114 |maxDegree| 119 |latex| 124
              |indexName| 129 |homogeneous| 134 |hashUpdate!| 139 |hash| 145
              |functionNames| 150 |functionName| 155 |displayKind| 160 |debug|
              165 |coerce| 170 |checkExtraValues| 175 |check| 180 |allDegrees|
              185 |Somos| 190 = 195)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 52))
                        (|makeByteWordVec2| 64
                                            '(1 9 7 8 10 1 18 7 17 19 1 22 7 21
                                              23 1 25 7 14 26 1 30 7 29 31 1 36
                                              7 35 37 1 42 7 41 43 1 46 7 45 47
                                              1 41 52 0 53 1 7 52 0 54 2 52 0 0
                                              0 55 2 7 21 0 0 57 2 0 21 0 0 1 1
                                              0 0 41 49 1 0 0 17 28 2 0 59 60
                                              41 61 1 0 0 21 40 1 0 0 14 15 1 0
                                              0 8 13 1 0 0 14 27 1 0 0 17 20 1
                                              0 0 8 11 1 0 0 8 12 1 0 0 8 16 1
                                              0 63 0 1 1 0 0 41 50 1 0 0 29 32
                                              2 0 62 62 0 1 1 0 64 0 1 1 0 0 45
                                              48 1 0 0 41 44 1 0 0 41 51 1 0 0
                                              21 34 1 0 52 0 56 1 0 0 21 39 1 0
                                              0 35 38 1 0 0 21 24 1 0 0 29 33 2
                                              0 21 0 0 58)))))
           '|lookupComplete|)) 

(MAKEPROP '|GuessOption| 'NILADIC T) 
