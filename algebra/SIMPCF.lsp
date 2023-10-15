
(SDEFUN |SIMPCF;sphereSolid;NniFsc;1|
        ((|dim| |NonNegativeInteger|)
         ($ |FiniteSimplicialComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (|FiniteSimplicialComplex| (|VertexSetAbstract|)))
          (|vs1| (|VertexSetAbstract|))
          (|v1| (|List| (|List| (|NonNegativeInteger|)))) (#1=#:G108 NIL)
          (|n| NIL) (#2=#:G107 NIL))
         (SEQ
          (LETT |v1|
                (LIST
                 (PROGN
                  (LETT #2# NIL . #3=(|SIMPCF;sphereSolid;NniFsc;1|))
                  (SEQ (LETT |n| 1 . #3#) (LETT #1# (+ |dim| 1) . #3#) G190
                       (COND ((|greater_SI| |n| #1#) (GO G191)))
                       (SEQ (EXIT (LETT #2# (CONS |n| #2#) . #3#)))
                       (LETT |n| (|inc_SI| |n|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))
                . #3#)
          (LETT |vs1| (SPADCALL (+ |dim| 1) (QREFELT $ 8)) . #3#)
          (LETT |r| (SPADCALL |vs1| |v1| (QREFELT $ 11)) . #3#) (EXIT |r|)))) 

(SDEFUN |SIMPCF;sphereSurface;NniFsc;2|
        ((|dim| |NonNegativeInteger|)
         ($ |FiniteSimplicialComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (|FiniteSimplicialComplex| (|VertexSetAbstract|)))
          (|s| (|FiniteSimplicialComplex| (|VertexSetAbstract|))))
         (SEQ
          (LETT |s| (SPADCALL |dim| (QREFELT $ 12))
                . #1=(|SIMPCF;sphereSurface;NniFsc;2|))
          (LETT |r| (SPADCALL |s| (QREFELT $ 13)) . #1#) (EXIT |r|)))) 

(SDEFUN |SIMPCF;torusSurface;Fsc;3|
        (($ |FiniteSimplicialComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (|FiniteSimplicialComplex| (|VertexSetAbstract|)))
          (|vs1| (|VertexSetAbstract|))
          (|v1| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |v1|
                (LIST (LIST 1 2 3) (LIST 2 3 5) (LIST 2 4 5) (LIST 2 4 7)
                      (LIST 1 2 6) (LIST 2 6 7) (LIST 3 4 6) (LIST 3 5 6)
                      (LIST 3 4 7) (LIST 1 3 7) (LIST 1 4 5) (LIST 1 4 6)
                      (LIST 5 6 7) (LIST 1 5 7))
                . #1=(|SIMPCF;torusSurface;Fsc;3|))
          (LETT |vs1| (SPADCALL 7 (QREFELT $ 8)) . #1#)
          (LETT |r| (SPADCALL |vs1| |v1| (QREFELT $ 11)) . #1#) (EXIT |r|)))) 

(SDEFUN |SIMPCF;band;Fsc;4|
        (($ |FiniteSimplicialComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (|FiniteSimplicialComplex| (|VertexSetAbstract|)))
          (|vs1| (|VertexSetAbstract|))
          (|v1| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |v1|
                (LIST (LIST 1 2 3) (LIST 1 2 6) (LIST 1 5 6) (LIST 2 3 4)
                      (LIST 3 4 5) (LIST 4 5 6))
                . #1=(|SIMPCF;band;Fsc;4|))
          (LETT |vs1| (SPADCALL 6 (QREFELT $ 8)) . #1#)
          (LETT |r| (SPADCALL |vs1| |v1| (QREFELT $ 11)) . #1#) (EXIT |r|)))) 

(SDEFUN |SIMPCF;moebiusBand;Fsc;5|
        (($ |FiniteSimplicialComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (|FiniteSimplicialComplex| (|VertexSetAbstract|)))
          (|vs1| (|VertexSetAbstract|))
          (|v1| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |v1|
                (LIST (LIST 1 2 3) (LIST 2 3 4) (LIST 3 4 5) (LIST 1 4 5)
                      (LIST 1 2 5))
                . #1=(|SIMPCF;moebiusBand;Fsc;5|))
          (LETT |vs1| (SPADCALL 5 (QREFELT $ 8)) . #1#)
          (LETT |r| (SPADCALL |vs1| |v1| (QREFELT $ 11)) . #1#) (EXIT |r|)))) 

(SDEFUN |SIMPCF;projectivePlane;Fsc;6|
        (($ |FiniteSimplicialComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (|FiniteSimplicialComplex| (|VertexSetAbstract|)))
          (|vs1| (|VertexSetAbstract|))
          (|v1| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |v1|
                (LIST (LIST 1 2 3) (LIST 1 3 4) (LIST 1 2 6) (LIST 1 5 6)
                      (LIST 1 4 5) (LIST 2 3 5) (LIST 2 4 5) (LIST 2 4 6)
                      (LIST 3 4 6) (LIST 3 5 6))
                . #1=(|SIMPCF;projectivePlane;Fsc;6|))
          (LETT |vs1| (SPADCALL 6 (QREFELT $ 8)) . #1#)
          (LETT |r| (SPADCALL |vs1| |v1| (QREFELT $ 11)) . #1#) (EXIT |r|)))) 

(SDEFUN |SIMPCF;kleinBottle;Fsc;7|
        (($ |FiniteSimplicialComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (|FiniteSimplicialComplex| (|VertexSetAbstract|)))
          (|vs1| (|VertexSetAbstract|))
          (|v1| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |v1|
                (LIST (LIST 3 4 8) (LIST 2 3 4) (LIST 2 4 6) (LIST 2 6 8)
                      (LIST 2 5 8) (LIST 3 5 7) (LIST 2 3 7) (LIST 2 7 1)
                      (LIST 2 5 1) (LIST 3 5 1) (LIST 4 5 8) (LIST 4 5 7)
                      (LIST 4 6 7) (LIST 6 7 1) (LIST 3 6 1) (LIST 3 6 8))
                . #1=(|SIMPCF;kleinBottle;Fsc;7|))
          (LETT |vs1| (SPADCALL 8 (QREFELT $ 8)) . #1#)
          (LETT |r| (SPADCALL |vs1| |v1| (QREFELT $ 11)) . #1#) (EXIT |r|)))) 

(SDEFUN |SIMPCF;dunceHat;Fsc;8|
        (($ |FiniteSimplicialComplex| (|VertexSetAbstract|)))
        (SPROG
         ((|r| (|FiniteSimplicialComplex| (|VertexSetAbstract|)))
          (|vs1| (|VertexSetAbstract|))
          (|v1| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |v1|
                (LIST (LIST 1 2 8) (LIST 2 3 8) (LIST 3 7 8) (LIST 1 3 7)
                      (LIST 1 2 7) (LIST 1 6 8) (LIST 1 2 6) (LIST 6 7 8)
                      (LIST 2 4 6) (LIST 5 6 7) (LIST 2 5 7) (LIST 4 5 6)
                      (LIST 2 3 4) (LIST 2 3 5) (LIST 1 3 4) (LIST 1 4 5)
                      (LIST 1 3 5))
                . #1=(|SIMPCF;dunceHat;Fsc;8|))
          (LETT |vs1| (SPADCALL 8 (QREFELT $ 8)) . #1#)
          (LETT |r| (SPADCALL |vs1| |v1| (QREFELT $ 11)) . #1#) (EXIT |r|)))) 

(DECLAIM (NOTINLINE |SimplicialComplexFactory;|)) 

(DEFUN |SimplicialComplexFactory| ()
  (SPROG NIL
         (PROG (#1=#:G124)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|SimplicialComplexFactory|)
                    . #2=(|SimplicialComplexFactory|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|SimplicialComplexFactory|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|SimplicialComplexFactory;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|SimplicialComplexFactory|)))))))))) 

(DEFUN |SimplicialComplexFactory;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|SimplicialComplexFactory|)
                . #1=(|SimplicialComplexFactory|))
          (LETT $ (GETREFV 21) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SimplicialComplexFactory| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|SimplicialComplexFactory| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|)
              (|VertexSetAbstract|) (0 . |vertexSeta|) (|List| (|List| 6))
              (|FiniteSimplicialComplex| 7) (5 . |simplicialComplex|)
              |SIMPCF;sphereSolid;NniFsc;1| (11 . |delta|)
              |SIMPCF;sphereSurface;NniFsc;2| |SIMPCF;torusSurface;Fsc;3|
              |SIMPCF;band;Fsc;4| |SIMPCF;moebiusBand;Fsc;5|
              |SIMPCF;projectivePlane;Fsc;6| |SIMPCF;kleinBottle;Fsc;7|
              |SIMPCF;dunceHat;Fsc;8|)
           '#(|torusSurface| 16 |sphereSurface| 20 |sphereSolid| 25
              |projectivePlane| 30 |moebiusBand| 34 |kleinBottle| 38 |dunceHat|
              42 |band| 46)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 20
                                                 '(1 7 0 6 8 2 10 0 7 9 11 1 10
                                                   0 0 13 0 0 10 15 1 0 10 6 14
                                                   1 0 10 6 12 0 0 10 18 0 0 10
                                                   17 0 0 10 19 0 0 10 20 0 0
                                                   10 16)))))
           '|lookupComplete|)) 

(MAKEPROP '|SimplicialComplexFactory| 'NILADIC T) 
