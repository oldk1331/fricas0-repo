
(/VERSIONCHECK 2) 

(DEFUN |OMERR;coerce;$Of;1| (|e| $)
  (PROG (|infoSize|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (QCAR |e|) (QREFELT $ 9))
        (SPADCALL "Error parsing OpenMath object" (QREFELT $ 12)))
       (#1='T
        (SEQ (LETT |infoSize| (LENGTH (QCDR |e|)) |OMERR;coerce;$Of;1|)
             (EXIT
              (COND
               ((SPADCALL (QCAR |e|) (QREFELT $ 13))
                (COND
                 ((EQL |infoSize| 1)
                  (SPADCALL
                   (STRCONC "Cannot handle CD "
                            (SPADCALL (|SPADfirst| (QCDR |e|)) (QREFELT $ 15)))
                   (QREFELT $ 12)))
                 (#1# (|error| "Malformed info list in OMUnknownCD"))))
               ((SPADCALL (QCAR |e|) (QREFELT $ 16))
                (COND
                 ((EQL 2 |infoSize|)
                  (SPADCALL
                   (SPADCALL
                    (LIST "Cannot handle Symbol "
                          (SPADCALL (SPADCALL (QCDR |e|) 2 (QREFELT $ 19))
                                    (QREFELT $ 15))
                          " from CD "
                          (SPADCALL (SPADCALL (QCDR |e|) 1 (QREFELT $ 19))
                                    (QREFELT $ 15)))
                    (QREFELT $ 21))
                   (QREFELT $ 12)))
                 (#1# (|error| "Malformed info list in OMUnknownSymbol"))))
               ((SPADCALL (QCAR |e|) (QREFELT $ 22))
                (SPADCALL "OpenMath read error" (QREFELT $ 12)))
               (#1# (|error| "Malformed OpenMath Error"))))))))))) 

(PUT '|OMERR;omError;OmekL$;2| '|SPADreplace| 'CONS) 

(DEFUN |OMERR;omError;OmekL$;2| (|e| |i| $) (CONS |e| |i|)) 

(PUT '|OMERR;errorKind;$Omek;3| '|SPADreplace| 'QCAR) 

(DEFUN |OMERR;errorKind;$Omek;3| (|e| $) (QCAR |e|)) 

(PUT '|OMERR;errorInfo;$L;4| '|SPADreplace| 'QCDR) 

(DEFUN |OMERR;errorInfo;$L;4| (|e| $) (QCDR |e|)) 

(DEFUN |OpenMathError| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G141)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|OpenMathError|)
                . #2=(|OpenMathError|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|OpenMathError|
                         (LIST (CONS NIL (CONS 1 (|OpenMathError;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|OpenMathError|))))))))))) 

(DEFUN |OpenMathError;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|OpenMathError|) . #1=(|OpenMathError|))
      (LETT $ (GETREFV 28) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|OpenMathError| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record| (|:| |err| (|OpenMathErrorKind|))
                          (|:| |info| (|List| (|Symbol|)))))
      $)))) 

(MAKEPROP '|OpenMathError| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|) (|OpenMathErrorKind|)
              (0 . |OMParseError?|) (|String|) (|OutputForm|) (5 . |message|)
              (10 . |OMUnknownCD?|) (|Symbol|) (15 . |string|)
              (20 . |OMUnknownSymbol?|) (|Integer|) (|List| 14) (25 . |elt|)
              (|List| $) (31 . |concat|) (36 . |OMReadError?|)
              |OMERR;coerce;$Of;1| |OMERR;omError;OmekL$;2|
              |OMERR;errorKind;$Omek;3| |OMERR;errorInfo;$L;4|
              (|SingleInteger|))
           '#(~= 41 |omError| 47 |latex| 53 |hash| 58 |errorKind| 63
              |errorInfo| 68 |coerce| 73 = 78)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 11))
                        (|makeByteWordVec2| 27
                                            '(1 8 7 0 9 1 11 0 10 12 1 8 7 0 13
                                              1 14 10 0 15 1 8 7 0 16 2 18 14 0
                                              17 19 1 10 0 20 21 1 8 7 0 22 2 0
                                              7 0 0 1 2 0 0 8 18 24 1 0 10 0 1
                                              1 0 27 0 1 1 0 8 0 25 1 0 18 0 26
                                              1 0 11 0 23 2 0 7 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|OpenMathError| 'NILADIC T) 
