
(/VERSIONCHECK 2) 

(DEFUN |SPECOUT;juxtaposeTerms| (|l| $) (SPADCALL |l| (QREFELT $ 8))) 

(DEFUN |SPECOUT;outputAsFortran;OfV;2| (|e| $)
  (SEQ (|dispfortexp| |e|) (EXIT (SPADCALL (QREFELT $ 10))))) 

(DEFUN |SPECOUT;outputAsFortran;SOfV;3| (|var| |e| $)
  (SEQ
   (LETT |e|
         (SPADCALL (SPADCALL (SPADCALL |var| (QREFELT $ 14)) (QREFELT $ 15))
                   |e| (QREFELT $ 16))
         |SPECOUT;outputAsFortran;SOfV;3|)
   (|dispfortexp| |e|) (EXIT (SPADCALL (QREFELT $ 10))))) 

(DEFUN |SPECOUT;outputAsFortran;LV;4| (|l| $)
  (SEQ (|dispfortexp| (|SPECOUT;juxtaposeTerms| |l| $))
       (EXIT (SPADCALL (QREFELT $ 10))))) 

(DEFUN |SPECOUT;outputAsScript;OfV;5| (|e| $)
  (SEQ (|formulaFormat| |e|) (EXIT (SPADCALL (QREFELT $ 10))))) 

(DEFUN |SPECOUT;outputAsScript;LV;6| (|l| $)
  (SEQ (|formulaFormat| (|SPECOUT;juxtaposeTerms| |l| $))
       (EXIT (SPADCALL (QREFELT $ 10))))) 

(DEFUN |SPECOUT;outputAsTex;OfV;7| (|e| $)
  (SEQ (|texFormat| |e|) (EXIT (SPADCALL (QREFELT $ 10))))) 

(DEFUN |SPECOUT;outputAsTex;LV;8| (|l| $)
  (SEQ (|texFormat| (|SPECOUT;juxtaposeTerms| |l| $))
       (EXIT (SPADCALL (QREFELT $ 10))))) 

(DECLAIM (NOTINLINE |SpecialOutputPackage;|)) 

(DEFUN |SpecialOutputPackage| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G119)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|SpecialOutputPackage|)
                . #2=(|SpecialOutputPackage|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|SpecialOutputPackage|
                         (LIST (CONS NIL (CONS 1 (|SpecialOutputPackage;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|SpecialOutputPackage|))))))))))) 

(DEFUN |SpecialOutputPackage;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|SpecialOutputPackage|) . #1=(|SpecialOutputPackage|))
      (LETT $ (GETREFV 24) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SpecialOutputPackage| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|SpecialOutputPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| $) (|OutputForm|)
              (0 . |blankSeparate|) (|Void|) (5 . |void|)
              |SPECOUT;outputAsFortran;OfV;2| (|String|) (|Symbol|)
              (9 . |coerce|) (14 . |coerce|) (19 . =)
              |SPECOUT;outputAsFortran;SOfV;3| (|List| 7)
              |SPECOUT;outputAsFortran;LV;4| |SPECOUT;outputAsScript;OfV;5|
              |SPECOUT;outputAsScript;LV;6| |SPECOUT;outputAsTex;OfV;7|
              |SPECOUT;outputAsTex;LV;8|)
           '#(|outputAsTex| 25 |outputAsScript| 35 |outputAsFortran| 45) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 23
                                                 '(1 7 0 6 8 0 9 0 10 1 13 0 12
                                                   14 1 13 7 0 15 2 7 0 0 0 16
                                                   1 0 9 7 22 1 0 9 18 23 1 0 9
                                                   7 20 1 0 9 18 21 2 0 9 12 7
                                                   17 1 0 9 7 11 1 0 9 18
                                                   19)))))
           '|lookupComplete|)) 

(MAKEPROP '|SpecialOutputPackage| 'NILADIC T) 
