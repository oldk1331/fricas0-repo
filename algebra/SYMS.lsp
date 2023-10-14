
(DEFUN |SYMS;newEntry| ($)
  (VECTOR (SPADCALL (QREFELT $ 12)) (CONS 1 "void") NIL)) 

(DEFUN |SYMS;checkIfEntryExists| (|name| |tab| $)
  (SEQ
   (COND ((SPADCALL |name| |tab| (QREFELT $ 15)) (SPADCALL (QREFELT $ 17)))
         ('T
          (SEQ (SPADCALL |tab| |name| (|SYMS;newEntry| $) (QREFELT $ 18))
               (EXIT (SPADCALL (QREFELT $ 17)))))))) 

(DEFUN |SYMS;returnTypeOf;S$U;3| (|name| |tab| $)
  (QVELT (SPADCALL |tab| |name| (QREFELT $ 19)) 1)) 

(DEFUN |SYMS;argumentListOf;S$L;4| (|name| |tab| $)
  (QVELT (SPADCALL |tab| |name| (QREFELT $ 19)) 2)) 

(DEFUN |SYMS;symbolTableOf;S$St;5| (|name| |tab| $)
  (QVELT (SPADCALL |tab| |name| (QREFELT $ 19)) 0)) 

(DEFUN |SYMS;coerce;$Of;6| (|u| $) (SPADCALL |u| (QREFELT $ 26))) 

(DEFUN |SYMS;showTheSymbolTable;$;7| ($) (QREFELT $ 9)) 

(DEFUN |SYMS;clearTheSymbolTable;V;8| ($)
  (SEQ (SETELT $ 9 (SPADCALL (QREFELT $ 8))) (EXIT (SPADCALL (QREFELT $ 17))))) 

(DEFUN |SYMS;clearTheSymbolTable;SV;9| (|u| $)
  (SEQ (SPADCALL |u| (QREFELT $ 9) (QREFELT $ 31))
       (EXIT (SPADCALL (QREFELT $ 17))))) 

(DEFUN |SYMS;empty;$;10| ($) (SPADCALL (QREFELT $ 8))) 

(DEFUN |SYMS;currentSubProgram;S;11| ($) (QREFELT $ 10)) 

(DEFUN |SYMS;endSubProgram;S;12| ($) (SETELT $ 10 'MAIN)) 

(DEFUN |SYMS;newSubProgram;SV;13| (|u| $)
  (SEQ (SPADCALL (QREFELT $ 9) |u| (|SYMS;newEntry| $) (QREFELT $ 18))
       (SETELT $ 10 |u|) (EXIT (SPADCALL (QREFELT $ 17))))) 

(DEFUN |SYMS;argumentList!;SL$V;14| (|u| |args| |symbols| $)
  (SEQ (|SYMS;checkIfEntryExists| |u| |symbols| $)
       (EXIT (QSETVELT (SPADCALL |symbols| |u| (QREFELT $ 19)) 2 |args|)))) 

(DEFUN |SYMS;argumentList!;SLV;15| (|u| |args| $)
  (SPADCALL |u| |args| (QREFELT $ 9) (QREFELT $ 37))) 

(DEFUN |SYMS;argumentList!;LV;16| (|args| $)
  (SEQ (|SYMS;checkIfEntryExists| (QREFELT $ 10) (QREFELT $ 9) $)
       (EXIT
        (QSETVELT (SPADCALL (QREFELT $ 9) (QREFELT $ 10) (QREFELT $ 19)) 2
                  |args|)))) 

(DEFUN |SYMS;returnType!;SU$V;17| (|u| |type| |symbols| $)
  (SEQ (|SYMS;checkIfEntryExists| |u| |symbols| $)
       (EXIT (QSETVELT (SPADCALL |symbols| |u| (QREFELT $ 19)) 1 |type|)))) 

(DEFUN |SYMS;returnType!;SUV;18| (|u| |type| $)
  (SPADCALL |u| |type| (QREFELT $ 9) (QREFELT $ 40))) 

(DEFUN |SYMS;returnType!;UV;19| (|type| $)
  (SEQ (|SYMS;checkIfEntryExists| (QREFELT $ 10) (QREFELT $ 9) $)
       (EXIT
        (QSETVELT (SPADCALL (QREFELT $ 9) (QREFELT $ 10) (QREFELT $ 19)) 1
                  |type|)))) 

(DEFUN |SYMS;declare!;S2Ft;20| (|u| |type| $)
  (SPADCALL |u| |type| (QREFELT $ 10) (QREFELT $ 9) (QREFELT $ 44))) 

(DEFUN |SYMS;declare!;SFtS$Ft;21| (|u| |type| |asp| |symbols| $)
  (SEQ (|SYMS;checkIfEntryExists| |asp| |symbols| $)
       (EXIT
        (SPADCALL |u| |type|
                  (QVELT (SPADCALL |symbols| |asp| (QREFELT $ 19)) 0)
                  (QREFELT $ 46))))) 

(DEFUN |SYMS;declare!;LFtS$Ft;22| (|u| |type| |asp| |syms| $)
  (SEQ (|SYMS;checkIfEntryExists| |asp| |syms| $)
       (EXIT
        (SPADCALL |u| |type| (QVELT (SPADCALL |syms| |asp| (QREFELT $ 19)) 0)
                  (QREFELT $ 47))))) 

(DEFUN |SYMS;declare!;SFtSFt;23| (|u| |type| |asp| $)
  (SEQ (|SYMS;checkIfEntryExists| |asp| (QREFELT $ 9) $)
       (EXIT
        (SPADCALL |u| |type|
                  (QVELT (SPADCALL (QREFELT $ 9) |asp| (QREFELT $ 19)) 0)
                  (QREFELT $ 46))))) 

(DEFUN |SYMS;printHeader;S$V;24| (|u| |symbols| $)
  (PROG (|entry|)
    (RETURN
     (SEQ
      (LETT |entry| (SPADCALL |symbols| |u| (QREFELT $ 19))
            |SYMS;printHeader;S$V;24|)
      (|fortFormatHead| (SPADCALL (QVELT |entry| 1) (QREFELT $ 50))
                        (SPADCALL |u| (QREFELT $ 51))
                        (SPADCALL (QVELT |entry| 2) (QREFELT $ 52)))
      (EXIT (SPADCALL (QVELT |entry| 0) (QREFELT $ 53))))))) 

(DEFUN |SYMS;printHeader;SV;25| (|u| $)
  (SPADCALL |u| (QREFELT $ 9) (QREFELT $ 54))) 

(DEFUN |SYMS;printHeader;V;26| ($)
  (SPADCALL (QREFELT $ 10) (QREFELT $ 9) (QREFELT $ 54))) 

(DEFUN |SYMS;printTypes;SV;27| (|u| $)
  (SPADCALL (QVELT (SPADCALL (QREFELT $ 9) |u| (QREFELT $ 19)) 0)
            (QREFELT $ 53))) 

(DECLAIM (NOTINLINE |TheSymbolTable;|)) 

(DEFUN |TheSymbolTable| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G161)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|TheSymbolTable|)
                . #2=(|TheSymbolTable|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|TheSymbolTable|
                         (LIST (CONS NIL (CONS 1 (|TheSymbolTable;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|TheSymbolTable|))))))))))) 

(DEFUN |TheSymbolTable;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|TheSymbolTable|) . #1=(|TheSymbolTable|))
      (LETT $ (GETREFV 58) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TheSymbolTable| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record| (|:| |symtab| (|SymbolTable|))
                          (|:| |returnType|
                               (|Union| (|:| |fst| (|FortranScalarType|))
                                        (|:| |void| "void")))
                          (|:| |argList| (|List| (|Symbol|)))))
      (QSETREFV $ 7 (|Table| (|Symbol|) (QREFELT $ 6)))
      (QSETREFV $ 9 (SPADCALL (QREFELT $ 8)))
      (QSETREFV $ 10 'MAIN)
      $)))) 

(MAKEPROP '|TheSymbolTable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Entry| '|Rep| (0 . |empty|)
              '|theSymbolTable| '|currentSubProgramName| (|SymbolTable|)
              (4 . |empty|) (|Boolean|) (|Symbol|) (8 . |key?|) (|Void|)
              (14 . |void|) (18 . |setelt|) (25 . |elt|)
              (|Union| (|:| |fst| (|FortranScalarType|)) (|:| |void| '"void"))
              |SYMS;returnTypeOf;S$U;3| (|List| 14) |SYMS;argumentListOf;S$L;4|
              |SYMS;symbolTableOf;S$St;5| (|OutputForm|) (31 . |coerce|)
              |SYMS;coerce;$Of;6| |SYMS;showTheSymbolTable;$;7|
              |SYMS;clearTheSymbolTable;V;8| (|Union| 6 '"failed")
              (36 . |remove!|) |SYMS;clearTheSymbolTable;SV;9|
              |SYMS;empty;$;10| |SYMS;currentSubProgram;S;11|
              |SYMS;endSubProgram;S;12| |SYMS;newSubProgram;SV;13|
              |SYMS;argumentList!;SL$V;14| |SYMS;argumentList!;SLV;15|
              |SYMS;argumentList!;LV;16| |SYMS;returnType!;SU$V;17|
              |SYMS;returnType!;SUV;18| |SYMS;returnType!;UV;19|
              (|FortranType|) |SYMS;declare!;SFtS$Ft;21|
              |SYMS;declare!;S2Ft;20| (42 . |declare!|) (49 . |declare!|)
              |SYMS;declare!;LFtS$Ft;22| |SYMS;declare!;SFtSFt;23|
              (56 . |coerce|) (61 . |coerce|) (66 . |coerce|)
              (71 . |printTypes|) |SYMS;printHeader;S$V;24|
              |SYMS;printHeader;SV;25| |SYMS;printHeader;V;26|
              |SYMS;printTypes;SV;27|)
           '#(|symbolTableOf| 76 |showTheSymbolTable| 82 |returnTypeOf| 86
              |returnType!| 92 |printTypes| 110 |printHeader| 115
              |newSubProgram| 130 |endSubProgram| 135 |empty| 139 |declare!|
              143 |currentSubProgram| 172 |coerce| 176 |clearTheSymbolTable|
              181 |argumentListOf| 190 |argumentList!| 196)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|CoercibleTo| 25))
                             (|makeByteWordVec2| 57
                                                 '(0 7 0 8 0 11 0 12 2 7 13 14
                                                   0 15 0 16 0 17 3 7 6 0 14 6
                                                   18 2 7 6 0 14 19 1 7 25 0 26
                                                   2 7 30 14 0 31 3 11 43 14 43
                                                   0 46 3 11 43 22 43 0 47 1 20
                                                   25 0 50 1 14 25 0 51 1 22 25
                                                   0 52 1 11 16 0 53 2 0 11 14
                                                   0 24 0 0 0 28 2 0 20 14 0 21
                                                   1 0 16 20 42 2 0 16 14 20 41
                                                   3 0 16 14 20 0 40 1 0 16 14
                                                   57 0 0 16 56 1 0 16 14 55 2
                                                   0 16 14 0 54 1 0 16 14 36 0
                                                   0 14 35 0 0 0 33 3 0 43 14
                                                   43 14 49 2 0 43 14 43 45 4 0
                                                   43 14 43 14 0 44 4 0 43 22
                                                   43 14 0 48 0 0 14 34 1 0 25
                                                   0 27 0 0 16 29 1 0 16 14 32
                                                   2 0 22 14 0 23 1 0 16 22 39
                                                   2 0 16 14 22 38 3 0 16 14 22
                                                   0 37)))))
           '|lookupComplete|)) 

(MAKEPROP '|TheSymbolTable| 'NILADIC T) 
