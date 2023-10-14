
(/VERSIONCHECK 2) 

(DEFUN |FST;=;2$B;1| (|u| |v| $)
  (SEQ (COND ((QEQCAR |u| 0) (COND ((QEQCAR |v| 0) (EXIT 'T)))))
       (COND ((QEQCAR |u| 1) (COND ((QEQCAR |v| 1) (EXIT 'T)))))
       (COND ((QEQCAR |u| 2) (COND ((QEQCAR |v| 2) (EXIT 'T)))))
       (COND ((QEQCAR |u| 4) (COND ((QEQCAR |v| 4) (EXIT 'T)))))
       (COND ((QEQCAR |u| 3) (COND ((QEQCAR |v| 3) (EXIT 'T)))))
       (COND ((QEQCAR |u| 5) (COND ((QEQCAR |v| 5) (EXIT 'T)))))
       (COND ((QEQCAR |u| 6) (COND ((QEQCAR |v| 6) (EXIT 'T))))) (EXIT 'NIL))) 

(DEFUN |FST;coerce;$Of;2| (|t| $)
  (COND ((QEQCAR |t| 0) (SPADCALL 'REAL (QREFELT $ 15)))
        ((QEQCAR |t| 1) (SPADCALL 'INTEGER (QREFELT $ 15)))
        ((QEQCAR |t| 2) (SPADCALL 'COMPLEX (QREFELT $ 15)))
        ((QEQCAR |t| 3) (SPADCALL 'CHARACTER (QREFELT $ 15)))
        ((QEQCAR |t| 5) (SPADCALL (QREFELT $ 8) (QREFELT $ 15)))
        ((QEQCAR |t| 6) (SPADCALL (QREFELT $ 10) (QREFELT $ 15)))
        ('T (SPADCALL 'LOGICAL (QREFELT $ 15))))) 

(DEFUN |FST;coerce;$Se;3| (|t| $)
  (SPADCALL (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 19))) 

(DEFUN |FST;coerce;$S;4| (|t| $)
  (COND ((QEQCAR |t| 0) '|real|) ((QEQCAR |t| 1) '|integer|)
        ((QEQCAR |t| 2) '|complex|) ((QEQCAR |t| 3) '|character|)
        ((QEQCAR |t| 5) (QREFELT $ 7)) ((QEQCAR |t| 5) (QREFELT $ 9))
        ('T '|logical|))) 

(DEFUN |FST;coerce;S$;5| (|s| $)
  (COND ((OR (EQUAL |s| '|real|) (EQUAL |s| 'REAL)) (CONS 0 "real"))
        ((OR (EQUAL |s| '|integer|) (EQUAL |s| 'INTEGER)) (CONS 1 "integer"))
        ((OR (EQUAL |s| '|complex|) (EQUAL |s| 'COMPLEX)) (CONS 2 "complex"))
        ((OR (EQUAL |s| '|character|) (EQUAL |s| 'CHARACTER))
         (CONS 3 "character"))
        ((OR (EQUAL |s| '|logical|) (EQUAL |s| 'LOGICAL)) (CONS 4 "logical"))
        ((OR (EQUAL |s| (QREFELT $ 7)) (EQUAL |s| (QREFELT $ 8)))
         (CONS 5 "double precision"))
        ((OR (EQUAL |s| (QREFELT $ 9)) (EQUAL |s| (QREFELT $ 10)))
         (CONS 6 "double complex")))) 

(DEFUN |FST;coerce;S$;6| (|s| $)
  (COND ((EQUAL |s| "real") (CONS 0 #1="real"))
        ((EQUAL |s| "integer") (CONS 1 #2="integer"))
        ((EQUAL |s| "complex") (CONS 2 #3="complex"))
        ((EQUAL |s| "character") (CONS 3 #4="character"))
        ((EQUAL |s| "logical") (CONS 4 #5="logical"))
        ((EQUAL |s| "double precision") (CONS 5 #6="double precision"))
        ((EQUAL |s| "double complex") (CONS 6 #7="double complex"))
        ((EQUAL |s| "REAL") (CONS 0 #1#)) ((EQUAL |s| "INTEGER") (CONS 1 #2#))
        ((EQUAL |s| "COMPLEX") (CONS 2 #3#))
        ((EQUAL |s| "CHARACTER") (CONS 3 #4#))
        ((EQUAL |s| "LOGICAL") (CONS 4 #5#))
        ((EQUAL |s| "DOUBLE PRECISION") (CONS 5 #6#))
        ((EQUAL |s| "DOUBLE COMPLEX") (CONS 6 #7#))
        ('T
         (|error|
          (SPADCALL
           (SPADCALL (LIST |s| " is invalid as a Fortran Type") (QREFELT $ 24))
           (QREFELT $ 25)))))) 

(PUT '|FST;real?;$B;7| '|SPADreplace| '(XLAM (|t|) (QEQCAR |t| 0))) 

(DEFUN |FST;real?;$B;7| (|t| $) (QEQCAR |t| 0)) 

(PUT '|FST;double?;$B;8| '|SPADreplace| '(XLAM (|t|) (QEQCAR |t| 5))) 

(DEFUN |FST;double?;$B;8| (|t| $) (QEQCAR |t| 5)) 

(PUT '|FST;logical?;$B;9| '|SPADreplace| '(XLAM (|t|) (QEQCAR |t| 4))) 

(DEFUN |FST;logical?;$B;9| (|t| $) (QEQCAR |t| 4)) 

(PUT '|FST;integer?;$B;10| '|SPADreplace| '(XLAM (|t|) (QEQCAR |t| 1))) 

(DEFUN |FST;integer?;$B;10| (|t| $) (QEQCAR |t| 1)) 

(PUT '|FST;character?;$B;11| '|SPADreplace| '(XLAM (|t|) (QEQCAR |t| 3))) 

(DEFUN |FST;character?;$B;11| (|t| $) (QEQCAR |t| 3)) 

(PUT '|FST;complex?;$B;12| '|SPADreplace| '(XLAM (|t|) (QEQCAR |t| 2))) 

(DEFUN |FST;complex?;$B;12| (|t| $) (QEQCAR |t| 2)) 

(PUT '|FST;doubleComplex?;$B;13| '|SPADreplace| '(XLAM (|t|) (QEQCAR |t| 6))) 

(DEFUN |FST;doubleComplex?;$B;13| (|t| $) (QEQCAR |t| 6)) 

(DEFUN |FortranScalarType| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G181)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|FortranScalarType|)
                . #2=(|FortranScalarType|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|FortranScalarType|
                         (LIST (CONS NIL (CONS 1 (|FortranScalarType;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|FortranScalarType|))))))))))) 

(DEFUN |FortranScalarType;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|FortranScalarType|) . #1=(|FortranScalarType|))
      (LETT $ (GETREFV 34) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FortranScalarType| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Union| (|:| |RealThing| "real")
                         (|:| |IntegerThing| "integer")
                         (|:| |ComplexThing| "complex")
                         (|:| |CharacterThing| "character")
                         (|:| |LogicalThing| "logical")
                         (|:| |DoublePrecisionThing| "double precision")
                         (|:| |DoubleComplexThing| "double complex")))
      (QSETREFV $ 7 '|double precision|)
      (QSETREFV $ 8 '|DOUBLE PRECISION|)
      (QSETREFV $ 9 '|double complex|)
      (QSETREFV $ 10 '|DOUBLE COMPLEX|)
      $)))) 

(MAKEPROP '|FortranScalarType| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| '|doubleSymbol|
              '|upperDoubleSymbol| '|doubleComplexSymbol|
              '|upperDoubleComplexSymbol| (|Boolean|) |FST;=;2$B;1|
              (|OutputForm|) (|Symbol|) (0 . |coerce|) |FST;coerce;$Of;2|
              |FST;coerce;$S;4| (|SExpression|) (5 . |convert|)
              |FST;coerce;$Se;3| |FST;coerce;S$;5| (|List| $) (|String|)
              (10 . |concat|) (15 . |coerce|) |FST;coerce;S$;6|
              |FST;real?;$B;7| |FST;double?;$B;8| |FST;logical?;$B;9|
              |FST;integer?;$B;10| |FST;character?;$B;11| |FST;complex?;$B;12|
              |FST;doubleComplex?;$B;13|)
           '#(|real?| 20 |logical?| 25 |integer?| 30 |doubleComplex?| 35
              |double?| 40 |complex?| 45 |coerce| 50 |character?| 75 = 80)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|CoercibleTo| 13))
                             (|makeByteWordVec2| 33
                                                 '(1 14 13 0 15 1 18 0 14 19 1
                                                   23 0 22 24 1 23 13 0 25 1 0
                                                   11 0 27 1 0 11 0 29 1 0 11 0
                                                   30 1 0 11 0 33 1 0 11 0 28 1
                                                   0 11 0 32 1 0 18 0 20 1 0 0
                                                   14 21 1 0 14 0 17 1 0 13 0
                                                   16 1 0 0 23 26 1 0 11 0 31 2
                                                   0 11 0 0 12)))))
           '|lookupComplete|)) 

(MAKEPROP '|FortranScalarType| 'NILADIC T) 
