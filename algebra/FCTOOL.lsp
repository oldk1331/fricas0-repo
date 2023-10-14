
(PUT '|FCTOOL;fort_clean_lines;2L;1| '|SPADreplace| '|fortran2Lines|) 

(SDEFUN |FCTOOL;fort_clean_lines;2L;1|
        ((|l| |List| (|String|)) ($ |List| (|String|))) (|fortran2Lines| |l|)) 

(PUT '|FCTOOL;do_with_error_env2;BML;2| '|SPADreplace| '|do_with_error_env2|) 

(SDEFUN |FCTOOL;do_with_error_env2;BML;2|
        ((|int_to_floats?| |Boolean|) (|f| |Mapping| (|List| (|String|)))
         ($ |List| (|String|)))
        (|do_with_error_env2| |int_to_floats?| |f|)) 

(PUT '|FCTOOL;do_with_error_env0;ML;3| '|SPADreplace| '|do_with_error_env0|) 

(SDEFUN |FCTOOL;do_with_error_env0;ML;3|
        ((|f| |Mapping| (|List| (|String|))) ($ |List| (|String|)))
        (|do_with_error_env0| |f|)) 

(SDEFUN |FCTOOL;do_with_error_env1;ML;4|
        ((|f| |Mapping| (|List| (|String|))) ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL
                (CONS #'|FCTOOL;do_with_error_env1;ML;4!0| (VECTOR $ |f|))
                (QREFELT $ 11)))) 

(SDEFUN |FCTOOL;do_with_error_env1;ML;4!0| (($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|FCTOOL;do_with_error_env1;ML;4|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |f|) (QREFELT $ 7)))))) 

(PUT '|FCTOOL;expression2Fortran1;SBOfBL;5| '|SPADreplace|
     '|expression2Fortran1|) 

(SDEFUN |FCTOOL;expression2Fortran1;SBOfBL;5|
        ((|name| |Symbol|) (|use_name?| |Boolean|) (|of| |OutputForm|)
         (|int_to_floats?| |Boolean|) ($ |List| (|String|)))
        (|expression2Fortran1| |name| |use_name?| |of| |int_to_floats?|)) 

(SDEFUN |FCTOOL;statement2Fortran;OfL;6|
        ((|of| |OutputForm|) ($ |List| (|String|)))
        (SPADCALL 'DUMMY 'T |of| 'NIL (QREFELT $ 15))) 

(SDEFUN |FCTOOL;expression2Fortran;OfL;7|
        ((|of| |OutputForm|) ($ |List| (|String|)))
        (SPADCALL 'DUMMY 'NIL |of| 'NIL (QREFELT $ 15))) 

(PUT '|FCTOOL;changeExprLength;IV;8| '|SPADreplace| '|changeExprLength|) 

(SDEFUN |FCTOOL;changeExprLength;IV;8| ((|i| |Integer|) ($ |Void|))
        (|changeExprLength| |i|)) 

(SDEFUN |FCTOOL;getStatement;OfBL;9|
        ((|of| |OutputForm|) (|int_to_floats?| |Boolean|)
         ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL |int_to_floats?|
                         (CONS #'|FCTOOL;getStatement;OfBL;9!0|
                               (VECTOR $ |of|))
                         (QREFELT $ 10)))) 

(SDEFUN |FCTOOL;getStatement;OfBL;9!0| (($$ NIL))
        (PROG (|of| $)
          (LETT |of| (QREFELT $$ 1) . #1=(|FCTOOL;getStatement;OfBL;9|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |of| (QREFELT $ 16)))))) 

(PUT '|FCTOOL;displayLines1;LV;10| '|SPADreplace| '|displayLines1|) 

(SDEFUN |FCTOOL;displayLines1;LV;10| ((|l| |List| (|String|)) ($ |Void|))
        (|displayLines1| |l|)) 

(SDEFUN |FCTOOL;dispStatement;OfV;11| ((|of| |OutputForm|) ($ |Void|))
        (SPROG ((|l| (|List| (|String|))))
               (SEQ
                (LETT |l| (SPADCALL |of| 'NIL (QREFELT $ 21))
                      |FCTOOL;dispStatement;OfV;11|)
                (EXIT (SPADCALL |l| (QREFELT $ 22)))))) 

(DECLAIM (NOTINLINE |FortranCodeTools;|)) 

(DEFUN |FortranCodeTools| ()
  (SPROG NIL
         (PROG (#1=#:G120)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FortranCodeTools|)
                    . #2=(|FortranCodeTools|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FortranCodeTools|
                             (LIST (CONS NIL (CONS 1 (|FortranCodeTools;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|FortranCodeTools|)))))))))) 

(DEFUN |FortranCodeTools;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FortranCodeTools|) . #1=(|FortranCodeTools|))
          (LETT $ (GETREFV 24) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FortranCodeTools| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FortranCodeTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| (|String|))
              |FCTOOL;fort_clean_lines;2L;1| (|Boolean|) (|Mapping| 6)
              |FCTOOL;do_with_error_env2;BML;2|
              |FCTOOL;do_with_error_env0;ML;3| |FCTOOL;do_with_error_env1;ML;4|
              (|Symbol|) (|OutputForm|) |FCTOOL;expression2Fortran1;SBOfBL;5|
              |FCTOOL;statement2Fortran;OfL;6|
              |FCTOOL;expression2Fortran;OfL;7| (|Void|) (|Integer|)
              |FCTOOL;changeExprLength;IV;8| |FCTOOL;getStatement;OfBL;9|
              |FCTOOL;displayLines1;LV;10| |FCTOOL;dispStatement;OfV;11|)
           '#(|statement2Fortran| 0 |getStatement| 5 |fort_clean_lines| 11
              |expression2Fortran1| 16 |expression2Fortran| 24
              |do_with_error_env2| 29 |do_with_error_env1| 35
              |do_with_error_env0| 40 |displayLines1| 45 |dispStatement| 50
              |changeExprLength| 55)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 23
                                                 '(1 0 6 14 16 2 0 6 14 8 21 1
                                                   0 6 6 7 4 0 6 13 8 14 8 15 1
                                                   0 6 14 17 2 0 6 8 9 10 1 0 6
                                                   9 12 1 0 6 9 11 1 0 18 6 22
                                                   1 0 18 14 23 1 0 18 19
                                                   20)))))
           '|lookupComplete|)) 

(MAKEPROP '|FortranCodeTools| 'NILADIC T) 
