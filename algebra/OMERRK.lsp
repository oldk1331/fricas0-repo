
(/VERSIONCHECK 2) 

(PUT '|OMERRK;OMParseError?;$B;1| '|SPADreplace| '(XLAM (|u|) (QEQCAR |u| 0))) 

(DEFUN |OMERRK;OMParseError?;$B;1| (|u| $) (QEQCAR |u| 0)) 

(PUT '|OMERRK;OMUnknownCD?;$B;2| '|SPADreplace| '(XLAM (|u|) (QEQCAR |u| 1))) 

(DEFUN |OMERRK;OMUnknownCD?;$B;2| (|u| $) (QEQCAR |u| 1)) 

(PUT '|OMERRK;OMUnknownSymbol?;$B;3| '|SPADreplace|
     '(XLAM (|u|) (QEQCAR |u| 2))) 

(DEFUN |OMERRK;OMUnknownSymbol?;$B;3| (|u| $) (QEQCAR |u| 2)) 

(PUT '|OMERRK;OMReadError?;$B;4| '|SPADreplace| '(XLAM (|u|) (QEQCAR |u| 3))) 

(DEFUN |OMERRK;OMReadError?;$B;4| (|u| $) (QEQCAR |u| 3)) 

(DEFUN |OMERRK;coerce;S$;5| (|s| $)
  (COND ((EQUAL |s| '|OMParseError|) (CONS 0 "OMParseError"))
        ((EQUAL |s| '|OMUnknownCD|) (CONS 1 "OMUnknownCD"))
        ((EQUAL |s| '|OMUnknownSymbol|) (CONS 2 "OMUnknownSymbol"))
        ((EQUAL |s| '|OMReadError|) (CONS 3 "OMReadError"))
        ('T
         (|error|
          (SPADCALL
           (STRCONC (SPADCALL |s| (QREFELT $ 14))
                    " is not a valid OpenMathErrorKind.")
           (QREFELT $ 16)))))) 

(DEFUN |OMERRK;=;2$B;6| (|a| |b| $) (SPADCALL |a| |b| (QREFELT $ 18))) 

(DEFUN |OMERRK;coerce;$Of;7| (|e| $) (SPADCALL |e| (QREFELT $ 20))) 

(DEFUN |OpenMathErrorKind| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G149)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|OpenMathErrorKind|)
                . #2=(|OpenMathErrorKind|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|OpenMathErrorKind|
                         (LIST (CONS NIL (CONS 1 (|OpenMathErrorKind;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|OpenMathErrorKind|))))))))))) 

(DEFUN |OpenMathErrorKind;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|OpenMathErrorKind|) . #1=(|OpenMathErrorKind|))
      (LETT $ (GETREFV 23) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|OpenMathErrorKind| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Union| (|:| |parseError| "OMParseError")
                         (|:| |unknownCD| "OMUnknownCD")
                         (|:| |unknownSymbol| "OMUnknownSymbol")
                         (|:| |readError| "OMReadError")))
      $)))) 

(MAKEPROP '|OpenMathErrorKind| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|)
              |OMERRK;OMParseError?;$B;1| |OMERRK;OMUnknownCD?;$B;2|
              |OMERRK;OMUnknownSymbol?;$B;3| |OMERRK;OMReadError?;$B;4|
              (|String|) (|Symbol|) (0 . |string|) (|OutputForm|)
              (5 . |coerce|) |OMERRK;coerce;S$;5| (10 . =) |OMERRK;=;2$B;6|
              (16 . |coerce|) |OMERRK;coerce;$Of;7| (|SingleInteger|))
           '#(~= 21 |latex| 27 |hash| 32 |coerce| 37 |OMUnknownSymbol?| 47
              |OMUnknownCD?| 52 |OMReadError?| 57 |OMParseError?| 62 = 67)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 15))
                        (|makeByteWordVec2| 22
                                            '(1 13 12 0 14 1 12 15 0 16 2 6 7 2
                                              2 18 1 6 15 2 20 2 0 7 0 0 1 1 0
                                              12 0 1 1 0 22 0 1 1 0 0 13 17 1 0
                                              15 0 21 1 0 7 0 10 1 0 7 0 9 1 0
                                              7 0 11 1 0 7 0 8 2 0 7 0 0
                                              19)))))
           '|lookupComplete|)) 

(MAKEPROP '|OpenMathErrorKind| 'NILADIC T) 
