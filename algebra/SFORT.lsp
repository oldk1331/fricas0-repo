
(PUT '|SFORT;fortran;SFstFS$;1| '|SPADreplace| 'VECTOR) 

(SDEFUN |SFORT;fortran;SFstFS$;1|
        ((|fname| |Symbol|) (|ftype| |FortranScalarType|) (|res| FS) ($ $))
        (VECTOR |fname| |ftype| |res|)) 

(PUT '|SFORT;nameOf| '|SPADreplace| '(XLAM (|u|) (QVELT |u| 0))) 

(SDEFUN |SFORT;nameOf| ((|u| $) ($ |Symbol|)) (QVELT |u| 0)) 

(SDEFUN |SFORT;typeOf| ((|u| $) ($ |Union| (|FortranScalarType|) "void"))
        (CONS 0 (QVELT |u| 1))) 

(PUT '|SFORT;bodyOf| '|SPADreplace| '(XLAM (|u|) (QVELT |u| 2))) 

(SDEFUN |SFORT;bodyOf| ((|u| $) ($ FS)) (QVELT |u| 2)) 

(SDEFUN |SFORT;argumentsOf| ((|u| $) ($ |List| (|Symbol|)))
        (SPADCALL (|SFORT;bodyOf| |u| $) (QREFELT $ 13))) 

(SDEFUN |SFORT;coerce;$Of;6| ((|u| $) ($ |OutputForm|))
        (SPADCALL (|SFORT;nameOf| |u| $) (QREFELT $ 15))) 

(SDEFUN |SFORT;outputAsFortran;$V;7| ((|u| $) ($ |Void|))
        (SPROG
         ((|val| (|OutputForm|)) (|nargs| (|OutputForm|))
          (|args| (|List| (|Symbol|))) (|fname| (|OutputForm|))
          (|ftype| (|OutputForm|)))
         (SEQ
          (LETT |ftype|
                (|checkType| (SPADCALL (|SFORT;typeOf| |u| $) (QREFELT $ 18)))
                . #1=(|SFORT;outputAsFortran;$V;7|))
          (LETT |fname| (SPADCALL (|SFORT;nameOf| |u| $) (QREFELT $ 15)) . #1#)
          (LETT |args| (|SFORT;argumentsOf| |u| $) . #1#)
          (LETT |nargs| (SPADCALL |args| (QREFELT $ 19)) . #1#)
          (LETT |val| (SPADCALL (|SFORT;bodyOf| |u| $) (QREFELT $ 20)) . #1#)
          (|fortFormatHead| |ftype| |fname| |nargs|)
          (|fortFormatTypes| |ftype| |args|)
          (|dispfortexp1| (LIST "=" |fname| |val|)) (|dispfortexp1| "RETURN")
          (|dispfortexp1| "END") (EXIT (SPADCALL (QREFELT $ 22)))))) 

(DECLAIM (NOTINLINE |SimpleFortranProgram;|)) 

(DEFUN |SimpleFortranProgram| (&REST #1=#:G120)
  (SPROG NIL
         (PROG (#2=#:G121)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SimpleFortranProgram|)
                                               '|domainEqualList|)
                    . #3=(|SimpleFortranProgram|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SimpleFortranProgram;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SimpleFortranProgram|)))))))))) 

(DEFUN |SimpleFortranProgram;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SimpleFortranProgram|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|SimpleFortranProgram| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 24) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SimpleFortranProgram|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|Record| (|:| |name| (|Symbol|))
                              (|:| |type| (|FortranScalarType|))
                              (|:| |body| |#2|)))
          $))) 

(MAKEPROP '|SimpleFortranProgram| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Symbol|) (|FortranScalarType|) |SFORT;fortran;SFstFS$;1|
              (|List| 9) (0 . |variables|) (|OutputForm|) (5 . |coerce|)
              |SFORT;coerce;$Of;6| (|Union| 10 '"void") (10 . |coerce|)
              (15 . |coerce|) (20 . |coerce|) (|Void|) (25 . |void|)
              |SFORT;outputAsFortran;$V;7|)
           '#(|outputAsFortran| 29 |fortran| 34 |coerce| 41) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(NIL NIL NIL)
                       (CONS
                        '#((|FortranProgramCategory|) (|Type|)
                           (|CoercibleTo| 14))
                        (|makeByteWordVec2| 23
                                            '(1 7 12 0 13 1 9 14 0 15 1 17 14 0
                                              18 1 12 14 0 19 1 7 14 0 20 0 21
                                              0 22 1 0 21 0 23 3 0 0 9 10 7 11
                                              1 0 14 0 16)))))
           '|lookupComplete|)) 
