
(/VERSIONCHECK 2) 

(DEFUN |MAPPKG3;curryRight;MBM;1| (|fabc| |b| $)
  (PROG () (RETURN (CONS #'|MAPPKG3;curryRight;MBM;1!0| (VECTOR |fabc| |b|))))) 

(DEFUN |MAPPKG3;curryRight;MBM;1!0| (|a| $$)
  (PROG (|b| |fabc|)
    (LETT |b| (QREFELT $$ 1) . #1=(|MAPPKG3;curryRight;MBM;1|))
    (LETT |fabc| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |a| |b| |fabc|))))) 

(DEFUN |MAPPKG3;curryLeft;MAM;2| (|fabc| |a| $)
  (PROG () (RETURN (CONS #'|MAPPKG3;curryLeft;MAM;2!0| (VECTOR |fabc| |a|))))) 

(DEFUN |MAPPKG3;curryLeft;MAM;2!0| (|b| $$)
  (PROG (|a| |fabc|)
    (LETT |a| (QREFELT $$ 1) . #1=(|MAPPKG3;curryLeft;MAM;2|))
    (LETT |fabc| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |a| |b| |fabc|))))) 

(DEFUN |MAPPKG3;constantRight;MM;3| (|fac| $)
  (CONS #'|MAPPKG3;constantRight;MM;3!0| |fac|)) 

(DEFUN |MAPPKG3;constantRight;MM;3!0| (|a| |b| |fac|) (SPADCALL |a| |fac|)) 

(DEFUN |MAPPKG3;constantLeft;MM;4| (|fbc| $)
  (CONS #'|MAPPKG3;constantLeft;MM;4!0| |fbc|)) 

(DEFUN |MAPPKG3;constantLeft;MM;4!0| (|a| |b| |fbc|) (SPADCALL |b| |fbc|)) 

(DEFUN |MAPPKG3;twist;MM;5| (|fabc| $) (CONS #'|MAPPKG3;twist;MM;5!0| |fabc|)) 

(DEFUN |MAPPKG3;twist;MM;5!0| (|b| |a| |fabc|) (SPADCALL |a| |b| |fabc|)) 

(DEFUN |MAPPKG3;*;MMM;6| (|fbc| |fab| $)
  (PROG () (RETURN (CONS #'|MAPPKG3;*;MMM;6!0| (VECTOR $ |fab| |fbc|))))) 

(DEFUN |MAPPKG3;*;MMM;6!0| (|a| $$)
  (PROG (|fbc| |fab| $)
    (LETT |fbc| (QREFELT $$ 2) . #1=(|MAPPKG3;*;MMM;6|))
    (LETT |fab| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |fbc| |fab| |a| (QREFELT $ 20)))))) 

(DECLAIM (NOTINLINE |MappingPackage3;|)) 

(DEFUN |MappingPackage3| (&REST #1=#:G121)
  (PROG ()
    (RETURN
     (PROG (#2=#:G122)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|MappingPackage3|)
                                           '|domainEqualList|)
                . #3=(|MappingPackage3|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |MappingPackage3;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|MappingPackage3|))))))))))) 

(DEFUN |MappingPackage3;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MappingPackage3|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|MappingPackage3| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 22) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MappingPackage3| (LIST DV$1 DV$2 DV$3)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MappingPackage3| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Mapping| 8 6) (|Mapping| 8 6 7)
              |MAPPKG3;curryRight;MBM;1| (|Mapping| 8 7)
              |MAPPKG3;curryLeft;MAM;2| |MAPPKG3;constantRight;MM;3|
              |MAPPKG3;constantLeft;MM;4| (|Mapping| 8 7 6)
              |MAPPKG3;twist;MM;5| (|Mapping| 7 6)
              (|MappingPackageInternalHacks3| 6 7 8) (0 . |comp|)
              |MAPPKG3;*;MMM;6|)
           '#(|twist| 7 |curryRight| 12 |curryLeft| 18 |constantRight| 24
              |constantLeft| 29 * 34)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 21
                                                 '(3 19 8 12 18 6 20 1 0 16 10
                                                   17 2 0 9 10 7 11 2 0 12 10 6
                                                   13 1 0 10 9 14 1 0 10 12 15
                                                   2 0 9 12 18 21)))))
           '|lookupComplete|)) 
