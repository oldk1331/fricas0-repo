
(SDEFUN |CUBECF;sphereSolid;NniFcc;1|
        ((|dim| |NonNegativeInteger|) ($ |FiniteCubicalComplex| (|Integer|)))
        (SPROG
         ((|r| (ASIMP)) (|vs1| (|List| (|Integer|)))
          (|v1| (|List| (|List| (|List| (|Integer|))))) (#1=#:G109 NIL)
          (|n| NIL) (#2=#:G108 NIL)
          (ASIMP
           (|Join| (|SetCategory|)
                   (CATEGORY |domain|
                    (SIGNATURE |cubicalComplex|
                     ($ (|List| #3=(|Integer|)) (|List| (|CubicalFacet|))))
                    (SIGNATURE |cubicalComplex|
                     ($ (|List| #3#)
                      (|List| (|List| (|Segment| (|Integer|))))))
                    (SIGNATURE |cubicalComplex|
                     ($ (|List| #3#) (|List| (|List| (|List| (|Integer|))))))
                    (SIGNATURE |cubicalComplex| ($ (|List| #3#)))
                    (SIGNATURE |maxIndex| ((|NonNegativeInteger|) $))
                    (SIGNATURE |addCube| ($ $ (|CubicalFacet|)))
                    (SIGNATURE |grade| ((|List| (|List| (|CubicalFacet|))) $))
                    (SIGNATURE |addImpliedFaces|
                     ((|List| (|List| (|CubicalFacet|))) $))
                    (SIGNATURE |product| ($ $ $))
                    (SIGNATURE |fundamentalGroup| ((|GroupPresentation|) $))
                    (SIGNATURE |fundamentalGroup|
                     ((|GroupPresentation|) $ (|Boolean|) (|Boolean|)))
                    (SIGNATURE |homology| ((|List| (|Homology|)) $))
                    (SIGNATURE |boundary| ($ $))
                    (SIGNATURE |chain| ((|ChainComplex|) $))
                    (SIGNATURE |coerce| ((|DeltaComplex| #3#) $))))))
         (SEQ
          (LETT ASIMP (|FiniteCubicalComplex| (|Integer|))
                . #4=(|CUBECF;sphereSolid;NniFcc;1|))
          (LETT |v1|
                (LIST
                 (PROGN
                  (LETT #2# NIL . #4#)
                  (SEQ (LETT |n| 1 . #4#) (LETT #1# |dim| . #4#) G190
                       (COND ((|greater_SI| |n| #1#) (GO G191)))
                       (SEQ (EXIT (LETT #2# (CONS (LIST 1 2) #2#) . #4#)))
                       (LETT |n| (|inc_SI| |n|) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))
                . #4#)
          (LETT |vs1| NIL . #4#)
          (LETT |r|
                (SPADCALL |vs1| |v1|
                          (|compiledLookupCheck| '|cubicalComplex|
                                                 (LIST '$
                                                       (LIST '|List|
                                                             (LIST '|Integer|))
                                                       (LIST '|List|
                                                             (LIST '|List|
                                                                   (LIST
                                                                    '|List|
                                                                    (LIST
                                                                     '|Integer|)))))
                                                 ASIMP))
                . #4#)
          (EXIT |r|)))) 

(SDEFUN |CUBECF;sphereSurface;NniFcc;2|
        ((|dim| |NonNegativeInteger|) ($ |FiniteCubicalComplex| (|Integer|)))
        (SPROG
         ((|r| (|FiniteCubicalComplex| (|Integer|)))
          (|s| (|FiniteCubicalComplex| (|Integer|))))
         (SEQ
          (LETT |s| (SPADCALL |dim| (QREFELT $ 8))
                . #1=(|CUBECF;sphereSurface;NniFcc;2|))
          (LETT |r| (SPADCALL |s| (QREFELT $ 9)) . #1#) (EXIT |r|)))) 

(SDEFUN |CUBECF;torusSurface;Fcc;3| (($ |FiniteCubicalComplex| (|Integer|)))
        (SPROG ((|b| #1=(|FiniteCubicalComplex| (|Integer|))) (|a| #1#))
               (SEQ
                (LETT |a| (SPADCALL 2 (QREFELT $ 10))
                      . #2=(|CUBECF;torusSurface;Fcc;3|))
                (LETT |b| (SPADCALL 2 (QREFELT $ 10)) . #2#)
                (EXIT (SPADCALL |a| |b| (QREFELT $ 11)))))) 

(SDEFUN |CUBECF;band;Fcc;4| (($ |FiniteCubicalComplex| (|Integer|)))
        (SPROG
         ((|b| (ASIMP)) (|vs1| (|List| (|Integer|)))
          (|v1| (|List| (|List| (|List| (|Integer|)))))
          (ASIMP
           (|Join| (|SetCategory|)
                   (CATEGORY |domain|
                    (SIGNATURE |cubicalComplex|
                     ($ (|List| #1=(|Integer|)) (|List| (|CubicalFacet|))))
                    (SIGNATURE |cubicalComplex|
                     ($ (|List| #1#)
                      (|List| (|List| (|Segment| (|Integer|))))))
                    (SIGNATURE |cubicalComplex|
                     ($ (|List| #1#) (|List| (|List| (|List| (|Integer|))))))
                    (SIGNATURE |cubicalComplex| ($ (|List| #1#)))
                    (SIGNATURE |maxIndex| ((|NonNegativeInteger|) $))
                    (SIGNATURE |addCube| ($ $ (|CubicalFacet|)))
                    (SIGNATURE |grade| ((|List| (|List| (|CubicalFacet|))) $))
                    (SIGNATURE |addImpliedFaces|
                     ((|List| (|List| (|CubicalFacet|))) $))
                    (SIGNATURE |product| ($ $ $))
                    (SIGNATURE |fundamentalGroup| ((|GroupPresentation|) $))
                    (SIGNATURE |fundamentalGroup|
                     ((|GroupPresentation|) $ (|Boolean|) (|Boolean|)))
                    (SIGNATURE |homology| ((|List| (|Homology|)) $))
                    (SIGNATURE |boundary| ($ $))
                    (SIGNATURE |chain| ((|ChainComplex|) $))
                    (SIGNATURE |coerce| ((|DeltaComplex| #1#) $)))))
          (|a| (|FiniteCubicalComplex| (|Integer|))))
         (SEQ (LETT |a| (SPADCALL 2 (QREFELT $ 10)) . #2=(|CUBECF;band;Fcc;4|))
              (LETT ASIMP (|FiniteCubicalComplex| (|Integer|)) . #2#)
              (LETT |v1| (LIST (LIST (LIST 1 2))) . #2#) (LETT |vs1| NIL . #2#)
              (LETT |b|
                    (SPADCALL |vs1| |v1|
                              (|compiledLookupCheck| '|cubicalComplex|
                                                     (LIST '$
                                                           (LIST '|List|
                                                                 (LIST
                                                                  '|Integer|))
                                                           (LIST '|List|
                                                                 (LIST '|List|
                                                                       (LIST
                                                                        '|List|
                                                                        (LIST
                                                                         '|Integer|)))))
                                                     ASIMP))
                    . #2#)
              (EXIT (SPADCALL |a| |b| (QREFELT $ 11)))))) 

(SDEFUN |CUBECF;projectiveSpace;NniFcc;5|
        ((|dim| |NonNegativeInteger|) ($ |FiniteCubicalComplex| (|Integer|)))
        (SPROG
         ((|r| (ASIMP)) (|vs1| (|List| (|Integer|)))
          (|v1| (|List| (|List| (|List| (|Integer|)))))
          (ASIMP
           (|Join| (|SetCategory|)
                   (CATEGORY |domain|
                    (SIGNATURE |cubicalComplex|
                     ($ (|List| #1=(|Integer|)) (|List| (|CubicalFacet|))))
                    (SIGNATURE |cubicalComplex|
                     ($ (|List| #1#)
                      (|List| (|List| (|Segment| (|Integer|))))))
                    (SIGNATURE |cubicalComplex|
                     ($ (|List| #1#) (|List| (|List| (|List| (|Integer|))))))
                    (SIGNATURE |cubicalComplex| ($ (|List| #1#)))
                    (SIGNATURE |maxIndex| ((|NonNegativeInteger|) $))
                    (SIGNATURE |addCube| ($ $ (|CubicalFacet|)))
                    (SIGNATURE |grade| ((|List| (|List| (|CubicalFacet|))) $))
                    (SIGNATURE |addImpliedFaces|
                     ((|List| (|List| (|CubicalFacet|))) $))
                    (SIGNATURE |product| ($ $ $))
                    (SIGNATURE |fundamentalGroup| ((|GroupPresentation|) $))
                    (SIGNATURE |fundamentalGroup|
                     ((|GroupPresentation|) $ (|Boolean|) (|Boolean|)))
                    (SIGNATURE |homology| ((|List| (|Homology|)) $))
                    (SIGNATURE |boundary| ($ $))
                    (SIGNATURE |chain| ((|ChainComplex|) $))
                    (SIGNATURE |coerce| ((|DeltaComplex| #1#) $))))))
         (SEQ
          (LETT ASIMP (|FiniteCubicalComplex| (|Integer|))
                . #2=(|CUBECF;projectiveSpace;NniFcc;5|))
          (COND
           ((SPADCALL |dim| 2 (QREFELT $ 15))
            (|error| "projectiveSpace only defined for plane")))
          (LETT |v1|
                (LIST
                 (LIST (LIST 1 2) (LIST 1 1) (LIST 1 1) (LIST 1 2) (LIST 1 1))
                 (LIST (LIST 1 2) (LIST 1 1) (LIST 1 1) (LIST 1 1) (LIST 1 2))
                 (LIST (LIST 1 1) (LIST 1 2) (LIST 1 2) (LIST 1 1) (LIST 1 1))
                 (LIST (LIST 1 1) (LIST 1 2) (LIST 1 1) (LIST 1 2) (LIST 1 1))
                 (LIST (LIST 1 1) (LIST 1 1) (LIST 1 2) (LIST 1 1) (LIST 1 2))
                 (LIST (LIST 1 2) (LIST 1 2) (LIST 2 2) (LIST 1 1) (LIST 1 1))
                 (LIST (LIST 1 2) (LIST 2 2) (LIST 1 2) (LIST 1 1) (LIST 1 1))
                 (LIST (LIST 2 2) (LIST 1 2) (LIST 1 2) (LIST 1 1) (LIST 1 1))
                 (LIST (LIST 1 2) (LIST 1 2) (LIST 1 1) (LIST 1 1) (LIST 2 2))
                 (LIST (LIST 1 2) (LIST 2 2) (LIST 1 1) (LIST 1 1) (LIST 1 2))
                 (LIST (LIST 2 2) (LIST 1 2) (LIST 1 1) (LIST 1 1) (LIST 1 2))
                 (LIST (LIST 1 2) (LIST 1 1) (LIST 1 2) (LIST 2 2) (LIST 1 1))
                 (LIST (LIST 1 2) (LIST 1 1) (LIST 2 2) (LIST 1 2) (LIST 1 1))
                 (LIST (LIST 2 2) (LIST 1 1) (LIST 1 2) (LIST 1 2) (LIST 1 1))
                 (LIST (LIST 1 1) (LIST 1 2) (LIST 1 1) (LIST 1 2) (LIST 2 2))
                 (LIST (LIST 1 1) (LIST 1 2) (LIST 1 1) (LIST 2 2) (LIST 1 2))
                 (LIST (LIST 1 1) (LIST 2 2) (LIST 1 1) (LIST 1 2) (LIST 1 2))
                 (LIST (LIST 1 1) (LIST 1 1) (LIST 1 2) (LIST 1 2) (LIST 2 2))
                 (LIST (LIST 1 1) (LIST 1 1) (LIST 1 2) (LIST 2 2) (LIST 1 2))
                 (LIST (LIST 1 1) (LIST 1 1) (LIST 2 2) (LIST 1 2) (LIST 1 2)))
                . #2#)
          (LETT |vs1| NIL . #2#)
          (LETT |r|
                (SPADCALL |vs1| |v1|
                          (|compiledLookupCheck| '|cubicalComplex|
                                                 (LIST '$
                                                       (LIST '|List|
                                                             (LIST '|Integer|))
                                                       (LIST '|List|
                                                             (LIST '|List|
                                                                   (LIST
                                                                    '|List|
                                                                    (LIST
                                                                     '|Integer|)))))
                                                 ASIMP))
                . #2#)
          (EXIT |r|)))) 

(DECLAIM (NOTINLINE |CubicalComplexFactory;|)) 

(DEFUN |CubicalComplexFactory| ()
  (SPROG NIL
         (PROG (#1=#:G120)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|CubicalComplexFactory|)
                    . #2=(|CubicalComplexFactory|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CubicalComplexFactory|
                             (LIST
                              (CONS NIL (CONS 1 (|CubicalComplexFactory;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|CubicalComplexFactory|)))))))))) 

(DEFUN |CubicalComplexFactory;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CubicalComplexFactory|)
                . #1=(|CubicalComplexFactory|))
          (LETT $ (GETREFV 17) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|CubicalComplexFactory| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|CubicalComplexFactory| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|FiniteCubicalComplex| (|Integer|))
              (|NonNegativeInteger|) |CUBECF;sphereSolid;NniFcc;1|
              (0 . |boundary|) |CUBECF;sphereSurface;NniFcc;2| (5 . |product|)
              |CUBECF;torusSurface;Fcc;3| |CUBECF;band;Fcc;4| (|Boolean|)
              (11 . ~=) |CUBECF;projectiveSpace;NniFcc;5|)
           '#(|torusSurface| 17 |sphereSurface| 21 |sphereSolid| 26
              |projectiveSpace| 31 |moebiusBand| 36 |kleinBottle| 40 |band| 44)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 16
                                                 '(1 6 0 0 9 2 6 0 0 0 11 2 7
                                                   14 0 0 15 0 0 6 12 1 0 6 7
                                                   10 1 0 6 7 8 1 0 6 7 16 0 0
                                                   6 1 0 0 6 1 0 0 6 13)))))
           '|lookupComplete|)) 

(MAKEPROP '|CubicalComplexFactory| 'NILADIC T) 
