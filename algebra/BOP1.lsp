
(/VERSIONCHECK 2) 

(DEFUN |BOP1;evaluate;BoMBo;1| (|op| |func| $)
  (PROG ()
    (RETURN
     (SPADCALL |op| (CONS #'|BOP1;evaluate;BoMBo;1!0| (VECTOR |func| $))
               (QREFELT $ 14))))) 

(DEFUN |BOP1;evaluate;BoMBo;1!0| (|l1| $$)
  (PROG ($ |func|)
    (LETT $ (QREFELT $$ 1) . #1=(|BOP1;evaluate;BoMBo;1|))
    (LETT |func| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (SPADCALL |l1| (QREFELT $ 11)) |func|))))) 

(DEFUN |BOP1;evaluate;BoU;2| (|op| $)
  (PROG (|func|)
    (RETURN
     (SEQ
      (LETT |func| (SPADCALL |op| (QREFELT $ 7) (QREFELT $ 19))
            |BOP1;evaluate;BoU;2|)
      (EXIT
       (COND ((QEQCAR |func| 1) (CONS 1 "failed"))
             ('T (CONS 0 (QCDR |func|))))))))) 

(DEFUN |BOP1;evaluate;BoLU;3| (|op| |args| $)
  (PROG (|func|)
    (RETURN
     (SEQ
      (LETT |func| (SPADCALL |op| (QREFELT $ 7) (QREFELT $ 19))
            |BOP1;evaluate;BoLU;3|)
      (EXIT
       (COND ((QEQCAR |func| 1) (CONS 1 "failed"))
             ('T (CONS 0 (SPADCALL |args| (QCDR |func|)))))))))) 

(DEFUN |BOP1;evaluate;BoMBo;4| (|op| |func| $)
  (SPADCALL |op| (QREFELT $ 7) |func| (QREFELT $ 25))) 

(DEFUN |BOP1;derivative;BoU;5| (|op| $)
  (PROG (|func|)
    (RETURN
     (SEQ
      (LETT |func| (SPADCALL |op| (QREFELT $ 9) (QREFELT $ 19))
            |BOP1;derivative;BoU;5|)
      (EXIT
       (COND ((QEQCAR |func| 1) (CONS 1 "failed"))
             ('T (CONS 0 (QCDR |func|))))))))) 

(DEFUN |BOP1;derivative;BoLBo;6| (|op| |grad| $)
  (SPADCALL |op| (QREFELT $ 9) |grad| (QREFELT $ 25))) 

(DEFUN |BOP1;derivative;BoMBo;7| (|op| |f| $)
  (PROG ()
    (RETURN
     (COND
      ((OR (SPADCALL |op| (QREFELT $ 31)) (SPADCALL |op| (QREFELT $ 32)))
       (SPADCALL |op|
                 (LIST (CONS #'|BOP1;derivative;BoMBo;7!0| (VECTOR |f| $)))
                 (QREFELT $ 29)))
      ('T (|error| "Operator is not unary")))))) 

(DEFUN |BOP1;derivative;BoMBo;7!0| (|l1| $$)
  (PROG ($ |f|)
    (LETT $ (QREFELT $$ 1) . #1=(|BOP1;derivative;BoMBo;7|))
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (SPADCALL |l1| (QREFELT $ 11)) |f|))))) 

(PUT '|BOP1;cdisp| '|SPADreplace| '(XLAM (|a| |l|) |a|)) 

(DEFUN |BOP1;cdisp| (|a| |l| $) |a|) 

(PUT '|BOP1;csex| '|SPADreplace| '(XLAM (|a| |l|) |a|)) 

(DEFUN |BOP1;csex| (|a| |l| $) |a|) 

(DEFUN |BOP1;eqconst?| (|a| |b| $)
  (PROG (|vb| |va|)
    (RETURN
     (SEQ
      (LETT |va| (SPADCALL |a| (QREFELT $ 8) (QREFELT $ 19))
            . #1=(|BOP1;eqconst?|))
      (EXIT
       (COND
        ((QEQCAR |va| 1)
         (COND ((SPADCALL |b| (QREFELT $ 8) (QREFELT $ 34)) 'NIL) (#2='T 'T)))
        (#2#
         (SEQ (LETT |vb| (SPADCALL |b| (QREFELT $ 8) (QREFELT $ 19)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |vb| 0)
                 (SPADCALL (QCDR |va|) (QCDR |vb|) (QREFELT $ 35)))
                (#2# 'NIL))))))))))) 

(DEFUN |BOP1;ltconst?| (|a| |b| $)
  (PROG (|vb| |va|)
    (RETURN
     (SEQ
      (LETT |va| (SPADCALL |a| (QREFELT $ 8) (QREFELT $ 19))
            . #1=(|BOP1;ltconst?|))
      (EXIT
       (COND ((QEQCAR |va| 1) (SPADCALL |b| (QREFELT $ 8) (QREFELT $ 34)))
             (#2='T
              (SEQ
               (LETT |vb| (SPADCALL |b| (QREFELT $ 8) (QREFELT $ 19)) . #1#)
               (EXIT
                (COND
                 ((QEQCAR |vb| 0)
                  (SPADCALL (QCDR |va|) (QCDR |vb|) (QREFELT $ 36)))
                 (#2# 'NIL))))))))))) 

(DEFUN |BOP1;constOp| (|a| $)
  (PROG ()
    (RETURN
     (SPADCALL
      (SPADCALL (SPADCALL (QREFELT $ 42) (QREFELT $ 43))
                (CONS #'|BOP1;constOp!0| (VECTOR $ |a|)) (QREFELT $ 47))
      (QREFELT $ 8) |a| (QREFELT $ 25))))) 

(DEFUN |BOP1;constOp!0| (|l1| $$)
  (PROG (|a| $)
    (LETT |a| (QREFELT $$ 1) . #1=(|BOP1;constOp|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|BOP1;cdisp| (SPADCALL |a| (QREFELT $ 45)) |l1| $))))) 

(DEFUN |BOP1;constantOpIfCan;BoU;13| (|op| $)
  (PROG (#1=#:G330 |u|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL |op| '|constant| (QREFELT $ 48))
          (SEQ
           (LETT |u| (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 19))
                 . #2=(|BOP1;constantOpIfCan;BoU;13|))
           (EXIT
            (COND
             ((QEQCAR |u| 0)
              (PROGN (LETT #1# (CONS 0 (QCDR |u|)) . #2#) (GO #1#))))))))
        (EXIT (CONS 1 "failed"))))
      #1# (EXIT #1#))))) 

(DEFUN |BOP1;constantOperator;ABo;14| (|a| $)
  (PROG ()
    (RETURN
     (SPADCALL (|BOP1;constOp| |a| $)
               (CONS #'|BOP1;constantOperator;ABo;14!0| (VECTOR $ |a|))
               (QREFELT $ 53))))) 

(DEFUN |BOP1;constantOperator;ABo;14!0| (|l1| $$)
  (PROG (|a| $)
    (LETT |a| (QREFELT $$ 1) . #1=(|BOP1;constantOperator;ABo;14|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|BOP1;csex| (SPADCALL |a| (QREFELT $ 51)) |l1| $))))) 

(DEFUN |BOP1;constantOperator;ABo;15| (|a| $) (|BOP1;constOp| |a| $)) 

(DECLAIM (NOTINLINE |BasicOperatorFunctions1;|)) 

(DEFUN |BasicOperatorFunctions1| (#1=#:G335)
  (PROG ()
    (RETURN
     (PROG (#2=#:G336)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|BasicOperatorFunctions1|)
                                           '|domainEqualList|)
                . #3=(|BasicOperatorFunctions1|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|BasicOperatorFunctions1;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|BasicOperatorFunctions1|))))))))))) 

(DEFUN |BasicOperatorFunctions1;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|BasicOperatorFunctions1|))
      (LETT |dv$| (LIST '|BasicOperatorFunctions1| DV$1) . #1#)
      (LETT $ (GETREFV 55) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|BasicOperatorFunctions1| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 '|%eval|)
      (QSETREFV $ 8 '|%constant|)
      (QSETREFV $ 9 '|%diff|)
      (COND
       ((|HasCategory| |#1| '(|Comparable|))
        (PROGN
         (QSETREFV $ 42
                   (SPADCALL
                    (SPADCALL (SPADCALL '|constant| 0 (QREFELT $ 38))
                              (CONS (|function| |BOP1;eqconst?|) $)
                              (QREFELT $ 40))
                    (CONS (|function| |BOP1;ltconst?|) $) (QREFELT $ 41)))))
       ('T
        (SETELT $ 42
                (SPADCALL (SPADCALL '|constant| 0 (QREFELT $ 38))
                          (CONS (|function| |BOP1;eqconst?|) $)
                          (QREFELT $ 40)))))
      (COND
       ((|HasCategory| |#1| '(|ConvertibleTo| (|InputForm|)))
        (QSETREFV $ 54
                  (CONS (|dispatchFunction| |BOP1;constantOperator;ABo;14|)
                        $)))
       ('T
        (QSETREFV $ 54
                  (CONS (|dispatchFunction| |BOP1;constantOperator;ABo;15|)
                        $))))
      $)))) 

(MAKEPROP '|BasicOperatorFunctions1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'EVAL 'CONST 'DIFF
              (|List| 6) (0 . |first|) (|BasicOperator|) (|Mapping| 6 10)
              |BOP1;evaluate;BoMBo;4| (|Mapping| 6 6) |BOP1;evaluate;BoMBo;1|
              (|Union| 24 '"failed") (|Symbol|) (5 . |property|)
              (|Union| 13 '"failed") |BOP1;evaluate;BoU;2|
              (|Union| 6 '"failed") |BOP1;evaluate;BoLU;3| (|None|)
              (11 . |setProperty|) (|Union| 28 '"failed")
              |BOP1;derivative;BoU;5| (|List| 13) |BOP1;derivative;BoLBo;6|
              (|Boolean|) (18 . |unary?|) (23 . |nary?|)
              |BOP1;derivative;BoMBo;7| (28 . |has?|) (34 . =)
              (40 . |smaller?|) (|NonNegativeInteger|) (46 . |operator|)
              (|Mapping| 30 $ $) (52 . |equality|) (58 . |comparison|)
              '|opconst| (64 . |copy|) (|OutputForm|) (69 . |coerce|)
              (|Mapping| 44 (|List| 44)) (74 . |display|) (80 . |is?|)
              |BOP1;constantOpIfCan;BoU;13| (|InputForm|) (86 . |convert|)
              (|Mapping| 50 (|List| 50)) (91 . |input|)
              (97 . |constantOperator|))
           '#(|evaluate| 102 |derivative| 125 |constantOperator| 142
              |constantOpIfCan| 147)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 54
                                                 '(1 10 6 0 11 2 12 17 0 18 19
                                                   3 12 0 0 18 24 25 1 12 30 0
                                                   31 1 12 30 0 32 2 12 30 0 18
                                                   34 2 6 30 0 0 35 2 6 30 0 0
                                                   36 2 12 0 18 37 38 2 12 0 0
                                                   39 40 2 12 0 0 39 41 1 12 0
                                                   0 43 1 6 44 0 45 2 12 0 0 46
                                                   47 2 12 30 0 18 48 1 6 50 0
                                                   51 2 12 0 0 52 53 1 0 12 6
                                                   54 2 0 12 12 13 14 2 0 22 12
                                                   10 23 1 0 20 12 21 2 0 12 12
                                                   15 16 2 0 12 12 15 33 2 0 12
                                                   12 28 29 1 0 26 12 27 1 0 12
                                                   6 54 1 0 22 12 49)))))
           '|lookupComplete|)) 
