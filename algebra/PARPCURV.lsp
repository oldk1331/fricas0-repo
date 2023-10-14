
(/VERSIONCHECK 2) 

(PUT '|PARPCURV;curve;2ComponentFunction$;1| '|SPADreplace| 'CONS) 

(DEFUN |PARPCURV;curve;2ComponentFunction$;1| (|x| |y| $) (CONS |x| |y|)) 

(DEFUN |PARPCURV;coordinate;$NniComponentFunction;2| (|c| |n| $)
  (COND ((EQL |n| 1) (QCAR |c|)) ((EQL |n| 2) (QCDR |c|))
        ('T (|error| "coordinate: index out of bounds")))) 

(DEFUN |ParametricPlaneCurve| (#1=#:G132)
  (PROG ()
    (RETURN
     (PROG (#2=#:G133)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|ParametricPlaneCurve|)
                                           '|domainEqualList|)
                . #3=(|ParametricPlaneCurve|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|ParametricPlaneCurve;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ParametricPlaneCurve|))))))))))) 

(DEFUN |ParametricPlaneCurve;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ParametricPlaneCurve|))
      (LETT |dv$| (LIST '|ParametricPlaneCurve| DV$1) . #1#)
      (LETT $ (GETREFV 11) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ParametricPlaneCurve| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|Record| (|:| |xCoord| |#1|) (|:| |yCoord| |#1|)))
      $)))) 

(MAKEPROP '|ParametricPlaneCurve| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              |PARPCURV;curve;2ComponentFunction$;1| (|NonNegativeInteger|)
              |PARPCURV;coordinate;$NniComponentFunction;2|)
           '#(|curve| 0 |coordinate| 6) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 10
                                                 '(2 0 0 6 6 8 2 0 6 0 9
                                                   10)))))
           '|lookupComplete|)) 
