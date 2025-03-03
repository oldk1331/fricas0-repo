
(PUT '|FPOSET;finitePoset;LL%;1| '|SPADreplace| 'CONS) 

(SDEFUN |FPOSET;finitePoset;LL%;1|
        ((|carrier| (|List| S)) (|struct1| (|List| (|List| (|Boolean|))))
         (% (%)))
        (CONS |carrier| |struct1|)) 

(SDEFUN |FPOSET;finitePoset;LM%;2|
        ((|carrier| (|List| S)) (|pred| (|Mapping| (|Boolean|) S S)) (% (%)))
        (SPROG
         ((|struct1| (|List| (|List| (|Boolean|)))) (#1=#:G13 NIL) (|x| NIL)
          (#2=#:G12 NIL) (#3=#:G11 NIL) (|y| NIL) (#4=#:G10 NIL))
         (SEQ
          (LETT |struct1|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |y| NIL) (LETT #3# |carrier|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |y| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL)
                                (SEQ (LETT |x| NIL) (LETT #1# |carrier|) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN (LETT |x| (CAR #1#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS (SPADCALL |x| |y| |pred|)
                                                   #2#))))
                                     (LETT #1# (CDR #1#)) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               #4#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (EXIT (CONS |carrier| |struct1|))))) 

(PUT '|FPOSET;getVert;%L;3| '|SPADreplace| 'QCAR) 

(SDEFUN |FPOSET;getVert;%L;3| ((|s| (%)) (% (|List| S))) (QCAR |s|)) 

(PUT '|FPOSET;getArr;%L;4| '|SPADreplace| 'QCDR) 

(SDEFUN |FPOSET;getArr;%L;4| ((|s| (%)) (% (|List| (|List| (|Boolean|)))))
        (QCDR |s|)) 

(SDEFUN |FPOSET;setVert| ((|s| (%)) (|v| (|List| S)) (% (|Void|)))
        (SEQ (PROGN (RPLACA |s| |v|) (QCAR |s|))
             (EXIT (SPADCALL (QREFELT % 16))))) 

(SDEFUN |FPOSET;setArr|
        ((|s| (%)) (|v| (|List| (|List| (|Boolean|)))) (% (|Void|)))
        (SEQ (PROGN (RPLACD |s| |v|) (QCDR |s|))
             (EXIT (SPADCALL (QREFELT % 16))))) 

(DECLAIM (NOTINLINE |FinitePoset;|)) 

(DEFUN |FinitePoset| (#1=#:G27)
  (SPROG NIL
         (PROG (#2=#:G28)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FinitePoset|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|FinitePoset;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FinitePoset|)))))))))) 

(DEFUN |FinitePoset;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|FinitePoset| DV$1))
          (LETT % (GETREFV 37))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FinitePoset| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |set1| (|List| |#1|))
                              (|:| |struct1| (|List| (|List| (|Boolean|))))))
          %))) 

(MAKEPROP '|FinitePoset| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              (|List| (|List| 17)) |FPOSET;finitePoset;LL%;1|
              (|Mapping| 17 6 6) |FPOSET;finitePoset;LM%;2|
              |FPOSET;getVert;%L;3| |FPOSET;getArr;%L;4| (|Void|) (0 . |void|)
              (|Boolean|) (|OutputForm|) (|String|)
              (|Record| (|:| |value| 6) (|:| |posX| 21) (|:| |posY| 21))
              (|NonNegativeInteger|)
              (|Record| (|:| |name| 19) (|:| |arrType| 21) (|:| |fromOb| 21)
                        (|:| |toOb| 21) (|:| |xOffset| 27) (|:| |yOffset| 27)
                        (|:| |map| 23))
              (|List| 21) (|List| 20) (|DirectedGraph| %) (|List| 22)
              (|Integer|) (|Tree| 27) (|List| 28) (|List| (|Loop|))
              (|Matrix| 27) (|Matrix| 21) (|Scene| (|SCartesian| '2))
              (|List| %) (|Union| 21 '"failed") (|IncidenceAlgebra| 27 6))
           '#(~= 4 |zetaMatrix| 10 |upperSet| 15 |unit| 20 |terminal| 26
              |subdiagramSvg| 31 |spanningTreeNode| 39 |spanningTreeArrow| 45
              |spanningForestNode| 51 |spanningForestArrow| 56 |routeNodes| 61
              |routeArrows| 68 |outDegree| 75 |opposite| 81 |objectToIndex| 86
              |nodeToNode| 92 |nodeToArrow| 98 |nodeFromNode| 104
              |nodeFromArrow| 110 |moebius| 116 |min| 121 |merge| 132
              |meetIfCan| 138 |max| 151 |mapContra| 162 |map| 171 |lub| 180
              |lowerSet| 186 |looseEquals| 191 |loopsNodes| 197 |loopsAtNode|
              202 |loopsArrows| 208 |le| 213 |latex| 220 |laplacianMatrix| 225
              |kgraph| 230 |joinIfCan| 236 |isGreaterThan?| 249 |isFunctional?|
              256 |isFixPoint?| 261 |isDirected?| 267 |isDirectSuccessor?| 271
              |isChain?| 278 |isAntiChain?| 283 |isAcyclic?| 288 |initial| 293
              |indexToObject| 297 |incidenceMatrix| 303 |inDegree| 308
              |implies| 314 |glb| 321 |getVertices| 327 |getVertexIndex| 332
              |getVert| 338 |getArrows| 343 |getArrowIndex| 348 |getArr| 355
              |flatten| 360 |finitePoset| 365 |distanceMatrix| 377 |distance|
              382 |diagramsSvg| 389 |diagramWidth| 396 |diagramSvg| 401
              |diagramHeight| 408 |deepDiagramSvg| 413 |cycleOpen| 420
              |cycleClosed| 426 |createY| 432 |createX| 438 |createWidth| 444
              |coverMatrix| 449 |coerce| 454 |arrowsToNode| 459 |arrowsToArrow|
              465 |arrowsFromNode| 471 |arrowsFromArrow| 477 |arrowName| 483
              |adjacencyMatrix| 490 |addObject!| 495 |addObject| 507
              |addArrow!| 513 |addArrow| 544 = 551 + 557)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0))
                 (CONS
                  '#(|Poset&| NIL |FiniteGraph&| |SetCategory&| NIL
                     |BasicType&|)
                  (CONS
                   '#((|Poset| 6) (|Preorder| 6) (|FiniteGraph| 6)
                      (|SetCategory|) (|CoercibleTo| 18) (|BasicType|))
                   (|makeByteWordVec2| 36
                                       '(0 15 0 16 2 0 17 0 0 1 1 0 36 0 1 1 0
                                         0 0 1 2 0 0 8 19 1 1 0 0 6 1 4 0 15 33
                                         0 17 17 1 2 0 28 0 21 1 2 0 28 0 21 1
                                         1 0 29 0 1 1 0 29 0 1 3 0 23 0 21 21 1
                                         3 0 23 0 21 21 1 2 0 21 0 21 1 1 0 0 0
                                         1 2 0 21 0 6 1 2 0 23 0 21 1 2 0 23 0
                                         21 1 2 0 23 0 21 1 2 0 23 0 21 1 1 0
                                         36 0 1 2 0 21 0 23 1 1 0 21 0 1 2 0 0
                                         0 0 1 3 0 35 0 21 21 1 2 0 35 0 23 1 1
                                         0 21 0 1 2 0 21 0 23 1 5 0 0 0 23 8 27
                                         27 1 5 0 0 0 23 8 27 27 1 2 0 35 0 23
                                         1 1 0 0 0 1 2 0 17 0 0 1 1 0 30 0 1 2
                                         0 30 0 21 1 1 0 30 0 1 3 0 17 0 6 6 1
                                         1 0 19 0 1 1 0 31 0 1 2 0 0 8 19 1 3 0
                                         35 0 21 21 1 2 0 35 0 23 1 3 0 17 0 21
                                         21 1 1 0 17 0 1 2 0 17 0 21 1 0 0 17 1
                                         3 0 17 0 21 21 1 1 0 17 0 1 1 0 17 0 1
                                         1 0 17 0 1 0 0 0 1 2 0 6 0 21 1 1 0 31
                                         0 1 2 0 21 0 21 1 3 0 17 0 21 21 1 2 0
                                         35 0 23 1 1 0 24 0 1 2 0 21 0 6 1 1 0
                                         8 0 13 1 0 26 0 1 3 0 21 0 21 21 1 1 0
                                         9 0 14 1 0 0 25 1 2 0 0 8 11 12 2 0 0
                                         8 9 10 1 0 31 0 1 3 0 27 0 21 21 1 3 0
                                         15 19 34 17 1 1 0 21 0 1 3 0 15 19 0
                                         17 1 1 0 21 0 1 3 0 15 19 0 17 1 2 0 0
                                         8 19 1 2 0 0 8 19 1 2 0 21 21 21 1 2 0
                                         21 21 21 1 1 0 21 21 1 1 0 36 0 1 1 0
                                         18 0 1 2 0 23 0 21 1 2 0 23 0 21 1 2 0
                                         23 0 21 1 2 0 23 0 21 1 3 0 19 0 21 21
                                         1 1 0 32 0 1 2 0 0 0 6 1 2 0 0 0 20 1
                                         2 0 0 0 6 1 4 0 0 0 19 21 21 1 2 0 0 0
                                         22 1 5 0 0 0 19 21 21 23 1 4 0 0 0 19
                                         6 6 1 3 0 0 0 6 6 1 2 0 17 0 0 1 2 0 0
                                         0 0 1)))))
           '|lookupComplete|)) 
