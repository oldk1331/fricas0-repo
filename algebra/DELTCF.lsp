
(SDEFUN |DELTCF;circle;Dc;1| (($ |DeltaComplex| (|VertexSetAbstract|)))
        (SPROG ((|vs1| (|VertexSetAbstract|)))
               (SEQ
                (LETT |vs1| (SPADCALL 1 (QREFELT $ 8)) |DELTCF;circle;Dc;1|)
                (EXIT
                 (SPADCALL |vs1| (LIST (LIST (LIST 1 -1))) (QREFELT $ 11)))))) 

(SDEFUN |DELTCF;dunceHat;Dc;2| (($ |DeltaComplex| (|VertexSetAbstract|)))
        (SPROG ((|vs1| (|VertexSetAbstract|)))
               (SEQ
                (LETT |vs1| (SPADCALL 1 (QREFELT $ 8)) |DELTCF;dunceHat;Dc;2|)
                (EXIT
                 (SPADCALL |vs1| (LIST (LIST (LIST 1 -1)) (LIST (LIST 1 1 -1)))
                           (QREFELT $ 11)))))) 

(SDEFUN |DELTCF;torusSurface;Dc;3| (($ |DeltaComplex| (|VertexSetAbstract|)))
        (SPROG ((|vs1| (|VertexSetAbstract|)))
               (SEQ
                (LETT |vs1| (SPADCALL 1 (QREFELT $ 8))
                      |DELTCF;torusSurface;Dc;3|)
                (EXIT
                 (SPADCALL |vs1|
                           (LIST (LIST (LIST 1 -1) (LIST 1 -1))
                                 (LIST (LIST 1 2 -1 -2)))
                           (QREFELT $ 11)))))) 

(SDEFUN |DELTCF;projectiveSpace;IDc;4|
        ((|n| |Integer|) ($ |DeltaComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|cl| (|List| (|List| (|List| (|Integer|))))) (#1=#:G115 NIL)
          (|i| NIL) (|vs1| (|VertexSetAbstract|)))
         (SEQ
          (LETT |vs1| (SPADCALL 1 (QREFELT $ 8))
                . #2=(|DELTCF;projectiveSpace;IDc;4|))
          (LETT |cl| NIL . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# |n| . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |cl|
                       (CONS (LIST (LIST 1 (COND ((ODDP |i|) -1) ('T 1))))
                             |cl|)
                       . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |vs1| (NREVERSE |cl|) (QREFELT $ 11)))))) 

(SDEFUN |DELTCF;kleinBottle;Dc;5| (($ |DeltaComplex| (|VertexSetAbstract|)))
        (SPROG ((|vs1| (|VertexSetAbstract|)))
               (SEQ
                (LETT |vs1| (SPADCALL 1 (QREFELT $ 8))
                      |DELTCF;kleinBottle;Dc;5|)
                (EXIT
                 (SPADCALL |vs1|
                           (LIST (LIST (LIST 1 -1) (LIST 1 -1))
                                 (LIST (LIST 1 2 1 -2)))
                           (QREFELT $ 11)))))) 

(DECLAIM (NOTINLINE |DeltaComplexFactory;|)) 

(DEFUN |DeltaComplexFactory| ()
  (SPROG NIL
         (PROG (#1=#:G119)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|DeltaComplexFactory|)
                    . #2=(|DeltaComplexFactory|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|DeltaComplexFactory|
                             (LIST
                              (CONS NIL (CONS 1 (|DeltaComplexFactory;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|DeltaComplexFactory|)))))))))) 

(DEFUN |DeltaComplexFactory;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DeltaComplexFactory|) . #1=(|DeltaComplexFactory|))
          (LETT $ (GETREFV 18) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|DeltaComplexFactory| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|DeltaComplexFactory| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|)
              (|VertexSetAbstract|) (0 . |vertexSeta|)
              (|List| (|List| (|List| 15))) (|DeltaComplex| 7)
              (5 . |deltaComplex|) |DELTCF;circle;Dc;1| |DELTCF;dunceHat;Dc;2|
              |DELTCF;torusSurface;Dc;3| (|Integer|)
              |DELTCF;projectiveSpace;IDc;4| |DELTCF;kleinBottle;Dc;5|)
           '#(|torusSurface| 11 |projectiveSpace| 15 |kleinBottle| 20
              |dunceHat| 24 |circle| 28)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 17
                                                 '(1 7 0 6 8 2 10 0 7 9 11 0 0
                                                   10 14 1 0 10 15 16 0 0 10 17
                                                   0 0 10 13 0 0 10 12)))))
           '|lookupComplete|)) 

(MAKEPROP '|DeltaComplexFactory| 'NILADIC T) 
