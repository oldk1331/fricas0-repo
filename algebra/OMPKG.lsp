
(SDEFUN |OMPKG;OMunhandledSymbol;2SE;1|
        ((|u| |String|) (|v| |String|) ($ |Exit|))
        (|error|
         (SPADCALL
          (SPADCALL
           (LIST "AXIOM is unable to process the symbol " |u| " from CD " |v|
                 ".")
           (QREFELT $ 8))
          (QREFELT $ 10)))) 

(SDEFUN |OMPKG;OMread;OmdA;2| ((|dev| |OpenMathDevice|) ($ |Any|))
        (SPADCALL (OM-READ |dev|) (QREFELT $ 15))) 

(SDEFUN |OMPKG;OMreadFile;SA;3| ((|filename| |String|) ($ |Any|))
        (SPROG ((|res| (|Any|)) (|dev| (|OpenMathDevice|)))
               (SEQ
                (LETT |dev|
                      (SPADCALL |filename| "r" (SPADCALL (QREFELT $ 19))
                                (QREFELT $ 20))
                      . #1=(|OMPKG;OMreadFile;SA;3|))
                (LETT |res| (SPADCALL (OM-READ |dev|) (QREFELT $ 15)) . #1#)
                (SPADCALL |dev| (QREFELT $ 22)) (EXIT |res|)))) 

(SDEFUN |OMPKG;OMreadStr;SA;4| ((|str| |String|) ($ |Any|))
        (SPROG ((|res| (|Any|)) (|dev| (|OpenMathDevice|)) (|strp| NIL))
               (SEQ
                (LETT |strp| (OM-STRINGTOSTRINGPTR |str|)
                      . #1=(|OMPKG;OMreadStr;SA;4|))
                (LETT |dev|
                      (SPADCALL |strp| (SPADCALL (QREFELT $ 19))
                                (QREFELT $ 24))
                      . #1#)
                (LETT |res| (SPADCALL (OM-READ |dev|) (QREFELT $ 15)) . #1#)
                (SPADCALL |dev| (QREFELT $ 22)) (EXIT |res|)))) 

(PUT '|OMPKG;OMlistCDs;L;5| '|SPADreplace| 'OM-LISTCDS) 

(SDEFUN |OMPKG;OMlistCDs;L;5| (($ |List| (|String|))) (OM-LISTCDS)) 

(PUT '|OMPKG;OMlistSymbols;SL;6| '|SPADreplace| 'OM-LISTSYMBOLS) 

(SDEFUN |OMPKG;OMlistSymbols;SL;6| ((|cd| |String|) ($ |List| (|String|)))
        (OM-LISTSYMBOLS |cd|)) 

(SDEFUN |OMPKG;OMsupportsCD?;SB;7| ((|cd| |String|) ($ |Boolean|))
        (COND ((SPADCALL (OM-SUPPORTSCD |cd|) (QREFELT $ 31)) 'NIL) ('T 'T))) 

(SDEFUN |OMPKG;OMsupportsSymbol?;2SB;8|
        ((|cd| |String|) (|name| |String|) ($ |Boolean|))
        (COND ((SPADCALL (OM-SUPPORTSSYMBOL |cd| |name|) (QREFELT $ 31)) 'NIL)
              ('T 'T))) 

(DECLAIM (NOTINLINE |OpenMathPackage;|)) 

(DEFUN |OpenMathPackage| ()
  (SPROG NIL
         (PROG (#1=#:G118)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|OpenMathPackage|)
                    . #2=(|OpenMathPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|OpenMathPackage|
                             (LIST (CONS NIL (CONS 1 (|OpenMathPackage;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|OpenMathPackage|)))))))))) 

(DEFUN |OpenMathPackage;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|OpenMathPackage|) . #1=(|OpenMathPackage|))
          (LETT $ (GETREFV 34) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|OpenMathPackage| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|OpenMathPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| $) (|String|) (0 . |concat|)
              (|OutputForm|) (5 . |coerce|) (|Exit|)
              |OMPKG;OMunhandledSymbol;2SE;1| (|Any|) (|InputForm|)
              (10 . |interpret|) (|OpenMathDevice|) |OMPKG;OMread;OmdA;2|
              (|OpenMathEncoding|) (15 . |OMencodingUnknown|)
              (19 . |OMopenFile|) (|Void|) (26 . |OMclose|)
              |OMPKG;OMreadFile;SA;3| (31 . |OMopenString|)
              |OMPKG;OMreadStr;SA;4| (|List| 7) |OMPKG;OMlistCDs;L;5|
              |OMPKG;OMlistSymbols;SL;6| (|Boolean|) (|SExpression|)
              (37 . |null?|) |OMPKG;OMsupportsCD?;SB;7|
              |OMPKG;OMsupportsSymbol?;2SB;8|)
           '#(|OMunhandledSymbol| 42 |OMsupportsSymbol?| 48 |OMsupportsCD?| 54
              |OMreadStr| 59 |OMreadFile| 64 |OMread| 69 |OMlistSymbols| 74
              |OMlistCDs| 79)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 33
                                                 '(1 7 0 6 8 1 7 9 0 10 1 14 13
                                                   0 15 0 18 0 19 3 16 0 7 7 18
                                                   20 1 16 21 0 22 2 16 0 7 18
                                                   24 1 30 29 0 31 2 0 11 7 7
                                                   12 2 0 29 7 7 33 1 0 29 7 32
                                                   1 0 13 7 25 1 0 13 7 23 1 0
                                                   13 16 17 1 0 26 7 28 0 0 26
                                                   27)))))
           '|lookupComplete|)) 

(MAKEPROP '|OpenMathPackage| 'NILADIC T) 
