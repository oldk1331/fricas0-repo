
(/VERSIONCHECK 2) 

(DEFUN |FT;coerce;$Of;1| (|a| $)
  (PROG (#1=#:G140 |u| #2=#:G139 |t|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |a| (QREFELT $ 8))
        (COND
         ((QEQCAR (SPADCALL |a| (QREFELT $ 10)) 1)
          (LETT |t| "EXTERNAL" . #3=(|FT;coerce;$Of;1|)))
         (#4='T
          (LETT |t|
                (SPADCALL
                 (LIST "EXTERNAL"
                       (SPADCALL (SPADCALL |a| (QREFELT $ 10)) (QREFELT $ 12)))
                 (QREFELT $ 14))
                . #3#))))
       (#4#
        (LETT |t| (SPADCALL (SPADCALL |a| (QREFELT $ 10)) (QREFELT $ 12))
              . #3#)))
      (EXIT
       (COND ((NULL (SPADCALL |a| (QREFELT $ 16))) |t|)
             (#4#
              (SPADCALL |t|
                        (SPADCALL
                         (PROGN
                          (LETT #2# NIL . #3#)
                          (SEQ (LETT |u| NIL . #3#)
                               (LETT #1# (SPADCALL |a| (QREFELT $ 16)) . #3#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS (SPADCALL |u| (QREFELT $ 18)) #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT $ 19))
                        (QREFELT $ 20))))))))) 

(PUT '|FT;scalarTypeOf;$U;2| '|SPADreplace| '(XLAM (|u|) (QVELT |u| 0))) 

(DEFUN |FT;scalarTypeOf;$U;2| (|u| $) (QVELT |u| 0)) 

(PUT '|FT;dimensionsOf;$L;3| '|SPADreplace| '(XLAM (|u|) (QVELT |u| 1))) 

(DEFUN |FT;dimensionsOf;$L;3| (|u| $) (QVELT |u| 1)) 

(PUT '|FT;external?;$B;4| '|SPADreplace| '(XLAM (|u|) (QVELT |u| 2))) 

(DEFUN |FT;external?;$B;4| (|u| $) (QVELT |u| 2)) 

(DEFUN |FT;construct;ULB$;5| (|t| |d| |e| $)
  (PROG (#1=#:G153 |l| #2=#:G152)
    (RETURN
     (SEQ
      (COND
       (|e|
        (COND
         ((NULL (NULL |d|))
          (EXIT (|error| "EXTERNAL objects cannot have dimensions"))))))
      (COND
       ((NULL |e|)
        (COND
         ((QEQCAR |t| 1) (EXIT (|error| "VOID objects must be EXTERNAL"))))))
      (EXIT
       (VECTOR |t|
               (PROGN
                (LETT #2# NIL . #3=(|FT;construct;ULB$;5|))
                (SEQ (LETT |l| NIL . #3#) (LETT #1# |d| . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |l| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |l| (QREFELT $ 23)) #2#)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))
               |e|)))))) 

(DEFUN |FT;construct;ULB$;6| (|t| |d| |e| $)
  (SEQ
   (COND
    (|e|
     (COND
      ((NULL (NULL |d|))
       (EXIT (|error| "EXTERNAL objects cannot have dimensions"))))))
   (COND
    ((NULL |e|)
     (COND ((QEQCAR |t| 1) (EXIT (|error| "VOID objects must be EXTERNAL"))))))
   (EXIT (VECTOR |t| |d| |e|)))) 

(DEFUN |FT;coerce;Fst$;7| (|u| $)
  (SPADCALL (CONS 0 |u|) NIL 'NIL (QREFELT $ 26))) 

(DEFUN |FT;fortranReal;$;8| ($)
  (SPADCALL (SPADCALL "real" (QREFELT $ 30)) (QREFELT $ 28))) 

(DEFUN |FT;fortranDouble;$;9| ($)
  (SPADCALL (SPADCALL "double precision" (QREFELT $ 30)) (QREFELT $ 28))) 

(DEFUN |FT;fortranInteger;$;10| ($)
  (SPADCALL (SPADCALL "integer" (QREFELT $ 30)) (QREFELT $ 28))) 

(DEFUN |FT;fortranComplex;$;11| ($)
  (SPADCALL (SPADCALL "complex" (QREFELT $ 30)) (QREFELT $ 28))) 

(DEFUN |FT;fortranDoubleComplex;$;12| ($)
  (SPADCALL (SPADCALL "double complex" (QREFELT $ 30)) (QREFELT $ 28))) 

(DEFUN |FT;fortranCharacter;$;13| ($)
  (SPADCALL (SPADCALL "character" (QREFELT $ 30)) (QREFELT $ 28))) 

(DEFUN |FT;fortranLogical;$;14| ($)
  (SPADCALL (SPADCALL "logical" (QREFELT $ 30)) (QREFELT $ 28))) 

(DEFUN |FortranType| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G177)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|FortranType|)
                . #2=(|FortranType|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|FortranType|
                         (LIST (CONS NIL (CONS 1 (|FortranType;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|FortranType|))))))))))) 

(DEFUN |FortranType;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|FortranType|) . #1=(|FortranType|))
      (LETT $ (GETREFV 39) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FortranType| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record|
                 (|:| |type|
                      (|Union| (|:| |fst| (|FortranScalarType|))
                               (|:| |void| "void")))
                 (|:| |dimensions| (|List| (|Polynomial| (|Integer|))))
                 (|:| |external| (|Boolean|))))
      $)))) 

(MAKEPROP '|FortranType| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|) |FT;external?;$B;4|
              (|Union| (|:| |fst| 27) (|:| |void| '"void"))
              |FT;scalarTypeOf;$U;2| (|OutputForm|) (0 . |coerce|) (|List| $)
              (5 . |blankSeparate|) (|List| 17) |FT;dimensionsOf;$L;3|
              (|Polynomial| (|Integer|)) (10 . |coerce|) (15 . |paren|)
              (20 . |sub|) |FT;coerce;$Of;1| (|Symbol|) (26 . |coerce|)
              (|List| 22) |FT;construct;ULB$;5| |FT;construct;ULB$;6|
              (|FortranScalarType|) |FT;coerce;Fst$;7| (|String|)
              (31 . |coerce|) |FT;fortranReal;$;8| |FT;fortranDouble;$;9|
              |FT;fortranInteger;$;10| |FT;fortranComplex;$;11|
              |FT;fortranDoubleComplex;$;12| |FT;fortranCharacter;$;13|
              |FT;fortranLogical;$;14| (|SingleInteger|))
           '#(~= 36 |scalarTypeOf| 42 |latex| 47 |hash| 52 |fortranReal| 57
              |fortranLogical| 61 |fortranInteger| 65 |fortranDoubleComplex| 69
              |fortranDouble| 73 |fortranComplex| 77 |fortranCharacter| 81
              |external?| 85 |dimensionsOf| 90 |construct| 95 |coerce| 109 =
              119)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 11))
                        (|makeByteWordVec2| 38
                                            '(1 9 11 0 12 1 11 0 13 14 1 17 11
                                              0 18 1 11 0 13 19 2 11 0 0 0 20 1
                                              17 0 22 23 1 27 0 29 30 2 0 7 0 0
                                              1 1 0 9 0 10 1 0 29 0 1 1 0 38 0
                                              1 0 0 0 31 0 0 0 37 0 0 0 33 0 0
                                              0 35 0 0 0 32 0 0 0 34 0 0 0 36 1
                                              0 7 0 8 1 0 15 0 16 3 0 0 9 24 7
                                              25 3 0 0 9 15 7 26 1 0 0 27 28 1
                                              0 11 0 21 2 0 7 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|FortranType| 'NILADIC T) 
