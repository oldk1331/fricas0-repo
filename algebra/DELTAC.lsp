
(SDEFUN |DELTAC;dim1todim0|
        ((|dim1| |List| (|List| (|Integer|))) (|n| . #1=(|NonNegativeInteger|))
         ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|res| (|List| (|List| (|Integer|)))) (#2=#:G140 NIL) (|x| NIL)
          (#3=#:G139 NIL) (|m3| (|NonNegativeInteger|)) (#4=#:G127 NIL)
          (#5=#:G138 NIL) (|m2| NIL) (#6=#:G137 NIL) (|smp| NIL)
          (|pointsUsed| (|List| (|Boolean|))) (|m| #1#) (#7=#:G123 NIL)
          (#8=#:G136 NIL) (#9=#:G135 NIL))
         (SEQ (LETT |m| |n|)
              (SEQ (LETT |smp| NIL) (LETT #9# |dim1|) G190
                   (COND
                    ((OR (ATOM #9#) (PROGN (LETT |smp| (CAR #9#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |m2| NIL) (LETT #8# |smp|) G190
                          (COND
                           ((OR (ATOM #8#) (PROGN (LETT |m2| (CAR #8#)) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |m3|
                                 (PROG1 (LETT #7# (ABS |m2|))
                                   (|check_subtype2| (>= #7# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #7#)))
                           (EXIT
                            (COND
                             ((SPADCALL |m3| |m| (QREFELT $ 10))
                              (LETT |m| |m3|)))))
                          (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
              (LETT |pointsUsed| (SPADCALL |m| NIL (QREFELT $ 12)))
              (SEQ (LETT |smp| NIL) (LETT #6# |dim1|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |smp| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |m2| NIL) (LETT #5# |smp|) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |m2| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |m3|
                                 (PROG1 (LETT #4# (ABS |m2|))
                                   (|check_subtype2| (>= #4# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #4#)))
                           (EXIT
                            (SPADCALL |pointsUsed| |m3| 'T (QREFELT $ 14))))
                          (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (LETT |res|
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |x| NIL) (LETT #2# |pointsUsed|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS (COND (|x| (LIST 0)) ('T NIL)) #3#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #3#)))))
              (EXIT |res|)))) 

(SDEFUN |DELTAC;deltaComplex;LNniL$;2|
        ((|v| |List| VS) (|numPoints| |NonNegativeInteger|)
         (|f| |List| (|List| (|List| (|Integer|)))) ($ $))
        (SPROG
         ((|fp| (|List| (|List| (|List| (|Integer|)))))
          (|f0| (|List| (|List| (|Integer|)))))
         (SEQ
          (LETT |f0|
                (|DELTAC;dim1todim0| (SPADCALL |f| '|last| (QREFELT $ 18))
                 |numPoints| $))
          (LETT |fp| (SPADCALL |f| |f0| (QREFELT $ 19)))
          (EXIT (CONS |v| |fp|))))) 

(SDEFUN |DELTAC;deltaComplex;Fsc$;3|
        ((|fsc| |FiniteSimplicialComplex| VS) ($ $))
        (SPADCALL |fsc| NIL (QREFELT $ 23))) 

(SDEFUN |DELTAC;deltaComplex;FscB$;4|
        ((|fsc| |FiniteSimplicialComplex| VS) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|vs| #1=(|List| VS)) (|previousFaceList| (|List| (|OrientedFacet|)))
          (|faceMaps| (|List| (|List| (|List| (|Integer|)))))
          (|map1| (|List| (|List| (|Integer|))))
          (|newIndexes| (|List| (|Integer|))) (|i| (|Integer|)) (#2=#:G180 NIL)
          (|oldFaceLow| NIL) (|oldFacesLow| (|List| (|OrientedFacet|)))
          (#3=#:G179 NIL) (|oldFaceHigh| NIL) (#4=#:G178 NIL) (|x| NIL)
          (#5=#:G177 NIL) (|m3| (|NonNegativeInteger|)) (#6=#:G152 NIL)
          (#7=#:G176 NIL) (|m2| NIL) (#8=#:G175 NIL) (|smp| NIL)
          (|pointsUsed| (|List| (|Boolean|))) (|m| #9=(|NonNegativeInteger|))
          (#10=#:G148 NIL) (#11=#:G174 NIL) (#12=#:G173 NIL)
          (|map2| (|List| (|List| (|Integer|)))) (|fm| (|List| (|Integer|)))
          (#13=#:G172 NIL) (#14=#:G170 NIL) (|gradeList| NIL) (#15=#:G171 NIL)
          (|grn| NIL) (|allFacetsGraded| (|List| (|List| (|OrientedFacet|))))
          (#16=#:G169 NIL) (|l| NIL) (#17=#:G168 NIL)
          (|allFacets| (|List| (|List| (|OrientedFacet|))))
          (|fscRep|
           (|Record| (|:| VERTSET #1#) (|:| NUMPOINTS #9#)
                     (|:| SIMP (|List| (|OrientedFacet|))))))
         (SEQ (LETT |fscRep| |fsc|)
              (LETT |allFacets| (SPADCALL |fsc| (QREFELT $ 26)))
              (COND
               (|trace|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL "deltaComplex(" (QREFELT $ 29))
                             (SPADCALL |fsc| (QREFELT $ 30)) (QREFELT $ 31))
                   (SPADCALL ") allFacets=" (QREFELT $ 29)) (QREFELT $ 31))
                  (SPADCALL |allFacets| (QREFELT $ 32)) (QREFELT $ 31))
                 (QREFELT $ 34))))
              (LETT |allFacetsGraded|
                    (PROGN
                     (LETT #17# NIL)
                     (SEQ (LETT |l| NIL) (LETT #16# |allFacets|) G190
                          (COND
                           ((OR (ATOM #16#) (PROGN (LETT |l| (CAR #16#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #17#
                                  (CONS (SPADCALL |l| (QREFELT $ 36)) #17#))))
                          (LETT #16# (CDR #16#)) (GO G190) G191
                          (EXIT (NREVERSE #17#)))))
              (COND
               (|trace|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL "deltaComplex allFacetsGraded=" (QREFELT $ 29))
                  (SPADCALL |allFacetsGraded| (QREFELT $ 32)) (QREFELT $ 31))
                 (QREFELT $ 34))))
              (LETT |faceMaps| NIL) (LETT |previousFaceList| NIL)
              (SEQ (LETT |grn| 1) (LETT #15# (LENGTH |allFacetsGraded|))
                   (LETT |gradeList| NIL) (LETT #14# |allFacetsGraded|) G190
                   (COND
                    ((OR (ATOM #14#) (PROGN (LETT |gradeList| (CAR #14#)) NIL)
                         (|greater_SI| |grn| #15#))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|trace|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL "deltaComplex grad num=" (QREFELT $ 29))
                          (SPADCALL |grn| (QREFELT $ 37)) (QREFELT $ 31))
                         (SPADCALL "=" (QREFELT $ 29)) (QREFELT $ 31))
                        (SPADCALL |gradeList| (QREFELT $ 38)) (QREFELT $ 31))
                       (QREFELT $ 34))))
                    (LETT |map1| NIL)
                    (COND
                     ((EQL |grn| 1)
                      (SEQ (LETT |map2| NIL)
                           (SEQ (LETT |x| NIL) (LETT #13# |gradeList|) G190
                                (COND
                                 ((OR (ATOM #13#)
                                      (PROGN (LETT |x| (CAR #13#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |fm| (SPADCALL |x| (QREFELT $ 41)))
                                     (LETT |map2| (CONS |fm| |map2|))
                                     (EXIT
                                      (COND
                                       (|trace|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               "  deltaComplex getIndexesSigned("
                                               (QREFELT $ 29))
                                              (SPADCALL |x| (QREFELT $ 42))
                                              (QREFELT $ 31))
                                             (SPADCALL ") fm=" (QREFELT $ 29))
                                             (QREFELT $ 31))
                                            (SPADCALL |fm| (QREFELT $ 43))
                                            (QREFELT $ 31))
                                           (SPADCALL " map2=" (QREFELT $ 29))
                                           (QREFELT $ 31))
                                          (SPADCALL |map2| (QREFELT $ 44))
                                          (QREFELT $ 31))
                                         (QREFELT $ 34))))))
                                (LETT #13# (CDR #13#)) (GO G190) G191
                                (EXIT NIL))
                           (LETT |m| (QVELT |fscRep| 1))
                           (SEQ (LETT |smp| NIL) (LETT #12# |map2|) G190
                                (COND
                                 ((OR (ATOM #12#)
                                      (PROGN (LETT |smp| (CAR #12#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |m2| NIL) (LETT #11# |smp|) G190
                                       (COND
                                        ((OR (ATOM #11#)
                                             (PROGN
                                              (LETT |m2| (CAR #11#))
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |m3|
                                              (PROG1 (LETT #10# (ABS |m2|))
                                                (|check_subtype2| (>= #10# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #10#)))
                                        (EXIT
                                         (COND
                                          ((SPADCALL |m3| |m| (QREFELT $ 10))
                                           (LETT |m| |m3|)))))
                                       (LETT #11# (CDR #11#)) (GO G190) G191
                                       (EXIT NIL))))
                                (LETT #12# (CDR #12#)) (GO G190) G191
                                (EXIT NIL))
                           (COND
                            (|trace|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL "  deltaComplex m=" (QREFELT $ 29))
                               (SPADCALL |m| (QREFELT $ 37)) (QREFELT $ 31))
                              (QREFELT $ 34))))
                           (LETT |pointsUsed|
                                 (SPADCALL |m| NIL (QREFELT $ 12)))
                           (SEQ (LETT |smp| NIL) (LETT #8# |map2|) G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN (LETT |smp| (CAR #8#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |m2| NIL) (LETT #7# |smp|) G190
                                       (COND
                                        ((OR (ATOM #7#)
                                             (PROGN (LETT |m2| (CAR #7#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |m3|
                                              (PROG1 (LETT #6# (ABS |m2|))
                                                (|check_subtype2| (>= #6# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #6#)))
                                        (EXIT
                                         (SPADCALL |pointsUsed| |m3| 'T
                                                   (QREFELT $ 14))))
                                       (LETT #7# (CDR #7#)) (GO G190) G191
                                       (EXIT NIL))))
                                (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                           (LETT |map1|
                                 (PROGN
                                  (LETT #5# NIL)
                                  (SEQ (LETT |x| NIL) (LETT #4# |pointsUsed|)
                                       G190
                                       (COND
                                        ((OR (ATOM #4#)
                                             (PROGN (LETT |x| (CAR #4#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #5#
                                               (CONS
                                                (COND (|x| (LIST 0)) ('T NIL))
                                                #5#))))
                                       (LETT #4# (CDR #4#)) (GO G190) G191
                                       (EXIT (NREVERSE #5#)))))
                           (COND
                            (|trace|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL "  deltaComplex m="
                                             (QREFELT $ 29))
                                   (SPADCALL |m| (QREFELT $ 37))
                                   (QREFELT $ 31))
                                  (SPADCALL " map2=" (QREFELT $ 29))
                                  (QREFELT $ 31))
                                 (SPADCALL |map2| (QREFELT $ 44))
                                 (QREFELT $ 31))
                                (SPADCALL " map1=" (QREFELT $ 29))
                                (QREFELT $ 31))
                               (SPADCALL |map1| (QREFELT $ 44)) (QREFELT $ 31))
                              (QREFELT $ 34))))
                           (EXIT (LETT |map1| (REVERSE |map1|)))))
                     ('T
                      (SEQ (LETT |oldFaceHigh| NIL) (LETT #3# |gradeList|) G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN (LETT |oldFaceHigh| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |oldFacesLow|
                                  (SPADCALL |oldFaceHigh| (QREFELT $ 46)))
                            (LETT |newIndexes| NIL)
                            (SEQ (LETT |oldFaceLow| NIL)
                                 (LETT #2# |oldFacesLow|) G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN
                                        (LETT |oldFaceLow| (CAR #2#))
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (COND
                                   (|trace|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           "    deltaComplex oldFaceLow="
                                           (QREFELT $ 29))
                                          (SPADCALL |oldFaceLow|
                                                    (QREFELT $ 42))
                                          (QREFELT $ 31))
                                         (SPADCALL " previousFaceList="
                                                   (QREFELT $ 29))
                                         (QREFELT $ 31))
                                        (SPADCALL |previousFaceList|
                                                  (QREFELT $ 38))
                                        (QREFELT $ 31))
                                       (SPADCALL " allFacetsGraded.1="
                                                 (QREFELT $ 29))
                                       (QREFELT $ 31))
                                      (SPADCALL
                                       (SPADCALL |allFacetsGraded| 1
                                                 (QREFELT $ 47))
                                       (QREFELT $ 38))
                                      (QREFELT $ 31))
                                     (QREFELT $ 34))))
                                  (LETT |i|
                                        (SPADCALL |oldFaceLow|
                                                  |previousFaceList|
                                                  (QREFELT $ 48)))
                                  (COND
                                   ((EQL |i| 0)
                                    (SEQ
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL "  deltaComplex oldFaceLow="
                                                   (QREFELT $ 29))
                                         (SPADCALL |oldFaceLow| (QREFELT $ 42))
                                         (QREFELT $ 31))
                                        (SPADCALL
                                         " not found in previousFaceList="
                                         (QREFELT $ 29))
                                        (QREFELT $ 31))
                                       (SPADCALL |previousFaceList|
                                                 (QREFELT $ 38))
                                       (QREFELT $ 31))
                                      (QREFELT $ 34))
                                     (EXIT
                                      (|error|
                                       (STRCONC "cant find index:"
                                                (STRINGIMAGE |i|)))))))
                                  (EXIT
                                   (LETT |newIndexes|
                                         (CONS |i| |newIndexes|))))
                                 (LETT #2# (CDR #2#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (LETT |map1|
                                   (CONS (NREVERSE |newIndexes|) |map1|))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))))
                    (LETT |faceMaps| (CONS (NREVERSE |map1|) |faceMaps|))
                    (EXIT (LETT |previousFaceList| |gradeList|)))
                   (LETT #14# (PROG1 (CDR #14#) (LETT |grn| (|inc_SI| |grn|))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |vs| (QVELT |fscRep| 0))
              (COND
               (|trace|
                (SPADCALL
                 (SPADCALL (SPADCALL "deltaComplex faceMaps=" (QREFELT $ 29))
                           (SPADCALL |faceMaps| (QREFELT $ 50)) (QREFELT $ 31))
                 (QREFELT $ 34))))
              (EXIT (CONS |vs| |faceMaps|))))) 

(SDEFUN |DELTAC;deltaComplex;Fcc$;5| ((|fsc| |FiniteCubicalComplex| VS) ($ $))
        (SPROG
         ((|fp| (|List| (|List| (|List| (|Integer|)))))
          (|f0| (|List| (|List| (|Integer|)))) (|m| (|NonNegativeInteger|))
          (|vs| (|List| VS)) (|previousFaceList| (|List| (|CubicalFacet|)))
          (|faceMaps| (|List| (|List| (|List| (|Integer|)))))
          (|map1| (|List| (|List| (|Integer|))))
          (|newIndexes| (|List| (|Integer|))) (|i| (|Integer|)) (#1=#:G197 NIL)
          (|oldFaceLow| NIL) (|oldFacesLow| (|List| (|CubicalFacet|)))
          (#2=#:G196 NIL) (|oldFaceHigh| NIL) (#3=#:G194 NIL) (|gradeList| NIL)
          (#4=#:G195 NIL) (|grn| NIL)
          (|allFacetsGraded| (|List| (|List| (|CubicalFacet|))))
          (#5=#:G193 NIL) (|gradedList| NIL)
          (|allFacets| (|List| (|List| (|CubicalFacet|)))))
         (SEQ (LETT |allFacets| (SPADCALL |fsc| (QREFELT $ 53)))
              (LETT |allFacetsGraded| NIL)
              (SEQ (LETT |gradedList| NIL) (LETT #5# |allFacets|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |gradedList| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |allFacetsGraded|
                           (SPADCALL |allFacetsGraded|
                                     (SPADCALL |gradedList| (QREFELT $ 55))
                                     (QREFELT $ 56)))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (LETT |faceMaps| NIL)
              (LETT |previousFaceList| (|SPADfirst| |allFacetsGraded|))
              (SEQ (LETT |grn| 1) (LETT #4# (LENGTH |allFacetsGraded|))
                   (LETT |gradeList| NIL) (LETT #3# |allFacetsGraded|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |gradeList| (CAR #3#)) NIL)
                         (|greater_SI| |grn| #4#))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND ((EQL |grn| 1) "iterate")
                           ('T
                            (SEQ (LETT |map1| NIL)
                                 (SEQ (LETT |oldFaceHigh| NIL)
                                      (LETT #2# |gradeList|) G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN
                                             (LETT |oldFaceHigh| (CAR #2#))
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |oldFacesLow|
                                             (SPADCALL |oldFaceHigh|
                                                       (QREFELT $ 58)))
                                       (LETT |newIndexes| NIL)
                                       (SEQ (LETT |oldFaceLow| NIL)
                                            (LETT #1# |oldFacesLow|) G190
                                            (COND
                                             ((OR (ATOM #1#)
                                                  (PROGN
                                                   (LETT |oldFaceLow|
                                                         (CAR #1#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |i|
                                                   (SPADCALL |oldFaceLow|
                                                             |previousFaceList|
                                                             (QREFELT $ 59)))
                                             (COND
                                              ((EQL |i| 0)
                                               (SEQ
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     "  deltaComplex oldFaceLow="
                                                     (QREFELT $ 29))
                                                    (SPADCALL |oldFaceLow|
                                                              (QREFELT $ 60))
                                                    (QREFELT $ 31))
                                                   (SPADCALL
                                                    " not found in previousFaceList="
                                                    (QREFELT $ 29))
                                                   (QREFELT $ 31))
                                                  (SPADCALL |previousFaceList|
                                                            (QREFELT $ 61))
                                                  (QREFELT $ 31))
                                                 (QREFELT $ 34))
                                                (EXIT
                                                 (|error|
                                                  (STRCONC
                                                   "deltaComplex: cant find index:"
                                                   (STRINGIMAGE |i|)))))))
                                             (EXIT
                                              (LETT |newIndexes|
                                                    (CONS |i| |newIndexes|))))
                                            (LETT #1# (CDR #1#)) (GO G190) G191
                                            (EXIT NIL))
                                       (EXIT
                                        (LETT |map1|
                                              (CONS (NREVERSE |newIndexes|)
                                                    |map1|))))
                                      (LETT #2# (CDR #2#)) (GO G190) G191
                                      (EXIT NIL))
                                 (LETT |faceMaps|
                                       (CONS (NREVERSE |map1|) |faceMaps|))
                                 (EXIT
                                  (LETT |previousFaceList| |gradeList|)))))))
                   (LETT #3# (PROG1 (CDR #3#) (LETT |grn| (|inc_SI| |grn|))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |vs| (QCAR |fsc|))
              (LETT |m| (SPADCALL |fsc| (QREFELT $ 62)))
              (LETT |f0|
                    (|DELTAC;dim1todim0|
                     (SPADCALL |faceMaps| '|last| (QREFELT $ 18)) |m| $))
              (LETT |fp| (SPADCALL |faceMaps| |f0| (QREFELT $ 19)))
              (EXIT (CONS |vs| |fp|))))) 

(SDEFUN |DELTAC;link;2Nni$;6|
        ((|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|simp| (|List| (|List| (|List| (|Integer|)))))
          (|points| (|List| (|List| (|Integer|)))) (|vs| (|List| VS)))
         (SEQ (LETT |vs| NIL) (LETT |simp| (LIST (LIST (LIST |a| |b|))))
              (LETT |points| (|DELTAC;dim1todim0| (|SPADfirst| |simp|) 2 $))
              (LETT |simp| (SPADCALL |simp| |points| (QREFELT $ 19)))
              (EXIT (CONS |vs| |simp|))))) 

(SDEFUN |DELTAC;triangle;3Nni$;7|
        ((|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         (|c| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|simp| (|List| #1=(|List| (|List| (|Integer|))))) (|points| #1#)
          (|triangles| (|List| (|List| (|Integer|))))
          (|edges| (|List| (|List| (|Integer|)))) (|vs| (|List| VS)))
         (SEQ (LETT |vs| NIL)
              (LETT |edges|
                    (LIST (LIST |a| |b|) (LIST |a| |c|) (LIST |b| |c|)))
              (LETT |triangles| (LIST (LIST 1 -2 3)))
              (LETT |points| (|DELTAC;dim1todim0| |edges| 3 $))
              (LETT |simp| (LIST |triangles| |edges| |points|))
              (EXIT (CONS |vs| |simp|))))) 

(SDEFUN |DELTAC;faceMap;$NniL;8|
        ((|s| $) (|n| |NonNegativeInteger|) ($ |List| (|List| (|Integer|))))
        (SPROG
         ((#1=#:G205 NIL) (|maps1| (|List| (|List| (|List| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |maps1| (REVERSE (QCDR |s|)))
                (COND
                 ((SPADCALL |n| (LENGTH |maps1|) (QREFELT $ 10))
                  (PROGN (LETT #1# NIL) (GO #2=#:G204))))
                (EXIT (SPADCALL |maps1| |n| (QREFELT $ 66)))))
          #2# (EXIT #1#)))) 

(SDEFUN |DELTAC;chain;$Cc;9| ((|s| $) ($ |ChainComplex|))
        (SPROG
         ((|res| (|List| (|Matrix| (|Integer|)))) (|m| (|Matrix| (|Integer|)))
          (|n_rows| (|NonNegativeInteger|)) (|ele| (|Integer|))
          (|v2| (|Integer|)) (#1=#:G217 NIL) (|v| NIL) (#2=#:G215 NIL)
          (|u| NIL) (#3=#:G216 NIL) (|nu| NIL)
          (|n_cols| (|NonNegativeInteger|)) (#4=#:G214 NIL) (|faces| NIL)
          (|maps1| (|List| (|List| (|List| (|Integer|))))))
         (SEQ (LETT |res| NIL) (LETT |maps1| (REVERSE (QCDR |s|)))
              (LETT |n_rows| 1)
              (SEQ (LETT |faces| NIL) (LETT #4# |maps1|) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |faces| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |n_cols| (LENGTH |faces|))
                        (LETT |m| (SPADCALL |n_rows| |n_cols| (QREFELT $ 69)))
                        (SEQ (LETT |nu| 1) (LETT #3# (LENGTH |faces|))
                             (LETT |u| NIL) (LETT #2# |faces|) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |u| (CAR #2#)) NIL)
                                   (|greater_SI| |nu| #3#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |v| NIL) (LETT #1# |u|) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |v| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ (LETT |v2| (ABS |v|))
                                         (EXIT
                                          (COND
                                           ((SPADCALL |v2| 0 (QREFELT $ 70))
                                            (SEQ
                                             (LETT |ele|
                                                   (COND
                                                    ((SPADCALL |v| 0
                                                               (QREFELT $ 70))
                                                     1)
                                                    ('T -1)))
                                             (EXIT
                                              (SPADCALL |m| |v2| |nu|
                                                        (+
                                                         (QAREF2O |m| |v2| |nu|
                                                                  1 1)
                                                         |ele|)
                                                        (QREFELT $ 71))))))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT NIL))))
                             (LETT #2#
                                   (PROG1 (CDR #2#)
                                     (LETT |nu| (|inc_SI| |nu|))))
                             (GO G190) G191 (EXIT NIL))
                        (LETT |res| (CONS |m| |res|))
                        (EXIT (LETT |n_rows| |n_cols|)))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (LETT |m| (MAKE_MATRIX1 |n_rows| 0 0))
              (LETT |res| (CONS |m| |res|))
              (EXIT (SPADCALL (NREVERSE |res|) (QREFELT $ 74)))))) 

(SDEFUN |DELTAC;coChain;$Ccc;10| ((|s| $) ($ |CoChainComplex| VS))
        (SPADCALL (SPADCALL |s| (QREFELT $ 75)) (QREFELT $ 77))) 

(SDEFUN |DELTAC;homology;$L;11| ((|a| $) ($ |List| (|Homology|)))
        (SPROG ((|cc| (|ChainComplex|)))
               (SEQ (LETT |cc| (SPADCALL |a| (QREFELT $ 75)))
                    (SPADCALL |cc| (QREFELT $ 79))
                    (EXIT (SPADCALL |cc| (QREFELT $ 81)))))) 

(SDEFUN |DELTAC;coHomology;$L;12| ((|a| $) ($ |List| (|Homology|)))
        (SPROG ((|cc| (|CoChainComplex| VS)))
               (SEQ (LETT |cc| (SPADCALL |a| (QREFELT $ 78)))
                    (SPADCALL |cc| (QREFELT $ 83))
                    (EXIT (SPADCALL |cc| (QREFELT $ 84)))))) 

(SDEFUN |DELTAC;oneSkeleton;$Ug;13|
        ((|s| $) ($ |UndirectedGraph| (|NonNegativeInteger|)))
        (SPROG
         ((|nodes|
           (|List|
            (|Record| (|:| |value| (|NonNegativeInteger|))
                      (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#1=#:G235 NIL) (|m1| NIL)
          (|edges|
           (|List|
            #2=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|y| #2#) (|m| (|NonNegativeInteger|))
          (|to1| #3=(|NonNegativeInteger|)) (|from1| #3#) (#4=#:G234 NIL)
          (|x| NIL) (|edgeIndexes| (|List| (|List| (|Integer|))))
          (#5=#:G233 NIL)
          (GS
           (|Join| (|FiniteGraph| #6=(|NonNegativeInteger|))
                   (CATEGORY |domain|
                    (SIGNATURE |undirectedGraph| ($ (|List| #6#)))
                    (SIGNATURE |undirectedGraph|
                     ($
                      (|List|
                       (|Record| (|:| |value| #6#)
                                 (|:| |posX| (|NonNegativeInteger|))
                                 (|:| |posY| (|NonNegativeInteger|))))))
                    (SIGNATURE |undirectedGraph|
                     ($
                      (|List|
                       (|Record| (|:| |value| #6#)
                                 (|:| |posX| (|NonNegativeInteger|))
                                 (|:| |posY| (|NonNegativeInteger|))))
                      (|List|
                       (|Record| (|:| |name| (|String|))
                                 (|:| |arrType| (|NonNegativeInteger|))
                                 (|:| |fromOb| (|NonNegativeInteger|))
                                 (|:| |toOb| (|NonNegativeInteger|))
                                 (|:| |xOffset| (|Integer|))
                                 (|:| |yOffset| (|Integer|))
                                 (|:| |map|
                                      (|List| (|NonNegativeInteger|)))))))
                    (SIGNATURE |undirectedGraph|
                     ($ (|List| #6#)
                      (|List|
                       (|Record| (|:| |fromOb| (|NonNegativeInteger|))
                                 (|:| |toOb| (|NonNegativeInteger|))))))
                    (SIGNATURE |undirectedGraph| ($ (|FinitePoset| #6#)))
                    (SIGNATURE |undirectedGraph|
                     ($ (|List| #6#) (|List| (|List| (|NonNegativeInteger|)))))
                    (SIGNATURE * ((|UndirectedGraph| (|Product| #6# #6#)) $ $))
                    (SIGNATURE |cartesian|
                     ((|UndirectedGraph| (|Product| #6# #6#)) $ $))
                    (SIGNATURE |closedTensor| ($ $ $ (|Mapping| #6# #6# #6#)))
                    (SIGNATURE |closedCartesian|
                     ($ $ $ (|Mapping| #6# #6# #6#)))
                    (SIGNATURE |diagramSvg2|
                     ((|Void|) (|String|) $ (|Boolean|)))
                    (SIGNATURE |coerce| ($ (|FinitePoset| #6#)))))))
         (SEQ
          (EXIT
           (SEQ (LETT GS (|UndirectedGraph| (|NonNegativeInteger|)))
                (LETT |nodes| NIL) (LETT |edges| NIL)
                (COND
                 ((< (LENGTH (QCDR |s|)) 2)
                  (PROGN
                   (LETT #5#
                         (SPADCALL
                          (|compiledLookupCheck| '|initial| (LIST '$) GS)))
                   (GO #7=#:G232))))
                (LETT |m|
                      (LENGTH (SPADCALL (REVERSE (QCDR |s|)) (QREFELT $ 86))))
                (LETT |edgeIndexes|
                      (SPADCALL (REVERSE (QCDR |s|)) (QREFELT $ 86)))
                (SEQ (LETT |x| NIL) (LETT #4# |edgeIndexes|) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |from1| (ABS (SPADCALL |x| 1 (QREFELT $ 87))))
                          (COND
                           ((SPADCALL |from1| |m| (QREFELT $ 10))
                            (LETT |m| |from1|)))
                          (LETT |to1| (ABS (SPADCALL |x| 2 (QREFELT $ 87))))
                          (COND
                           ((SPADCALL |to1| |m| (QREFELT $ 10))
                            (LETT |m| |to1|)))
                          (LETT |y| (VECTOR "x" 0 |from1| |to1| 0 0 NIL))
                          (EXIT
                           (LETT |edges|
                                 (SPADCALL |edges| |y| (QREFELT $ 90)))))
                     (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |m1| 1) (LETT #1# |m|) G190
                     (COND ((|greater_SI| |m1| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |nodes|
                             (SPADCALL |nodes| (VECTOR |m1| 0 0)
                                       (QREFELT $ 93)))))
                     (LETT |m1| (|inc_SI| |m1|)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL |nodes| |edges|
                           (|compiledLookupCheck| '|undirectedGraph|
                                                  (LIST '$
                                                        (LIST '|List|
                                                              (LIST '|Record|
                                                                    (LIST '|:|
                                                                          '|value|
                                                                          (LIST
                                                                           '|NonNegativeInteger|))
                                                                    (LIST '|:|
                                                                          '|posX|
                                                                          (LIST
                                                                           '|NonNegativeInteger|))
                                                                    (LIST '|:|
                                                                          '|posY|
                                                                          (LIST
                                                                           '|NonNegativeInteger|))))
                                                        (LIST '|List|
                                                              (LIST '|Record|
                                                                    (LIST '|:|
                                                                          '|name|
                                                                          (LIST
                                                                           '|String|))
                                                                    (LIST '|:|
                                                                          '|arrType|
                                                                          (LIST
                                                                           '|NonNegativeInteger|))
                                                                    (LIST '|:|
                                                                          '|fromOb|
                                                                          (LIST
                                                                           '|NonNegativeInteger|))
                                                                    (LIST '|:|
                                                                          '|toOb|
                                                                          (LIST
                                                                           '|NonNegativeInteger|))
                                                                    (LIST '|:|
                                                                          '|xOffset|
                                                                          (LIST
                                                                           '|Integer|))
                                                                    (LIST '|:|
                                                                          '|yOffset|
                                                                          (LIST
                                                                           '|Integer|))
                                                                    (LIST '|:|
                                                                          '|map|
                                                                          (LIST
                                                                           '|List|
                                                                           (LIST
                                                                            '|NonNegativeInteger|))))))
                                                  GS)))))
          #7# (EXIT #5#)))) 

(SDEFUN |DELTAC;linksInTree|
        ((|res| |List| (|List| (|Integer|))) (|a| |Tree| (|Integer|))
         ($ |List| (|List| (|Integer|))))
        (SPROG
         ((#1=#:G242 NIL) (|x| NIL) (|newLink| (|List| #2=(|Integer|)))
          (|toNode| #2#) (#3=#:G241 NIL) (|fromNode| #2#))
         (SEQ (LETT |fromNode| (SPADCALL |a| (QREFELT $ 97)))
              (SEQ (LETT |x| NIL) (LETT #3# (SPADCALL |a| (QREFELT $ 98))) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |toNode| (SPADCALL |x| (QREFELT $ 97)))
                        (LETT |newLink| (LIST |fromNode| |toNode|))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res| |newLink| (QREFELT $ 99)))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |x| NIL) (LETT #1# (SPADCALL |a| (QREFELT $ 98))) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT |res| (|DELTAC;linksInTree| |res| |x| $))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |DELTAC;containsEdge?|
        ((|edge| |List| (|Integer|)) (|edges| |List| (|List| (|Integer|)))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G253 NIL) (|t2| #2=(|Integer|)) (|s2| #2#) (#3=#:G254 NIL)
          (|e| NIL) (|t| #2#) (|s| #2#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< (LENGTH |edge|) 2) (PROGN (LETT #1# NIL) (GO #4=#:G252))))
            (LETT |s| (SPADCALL |edge| 1 (QREFELT $ 87)))
            (LETT |t| (SPADCALL |edge| 2 (QREFELT $ 87)))
            (SEQ (LETT |e| NIL) (LETT #3# |edges|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |e| (CAR #3#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (LENGTH |e|) 1 (QREFELT $ 10))
                     (SEQ (LETT |s2| (SPADCALL |e| 1 (QREFELT $ 87)))
                          (LETT |t2| (SPADCALL |e| 2 (QREFELT $ 87)))
                          (COND
                           ((EQL (ABS |s|) (ABS |s2|))
                            (COND
                             ((EQL (ABS |t|) (ABS |t2|))
                              (PROGN (LETT #1# 'T) (GO #4#))))))
                          (EXIT
                           (COND
                            ((EQL (ABS |s|) (ABS |t2|))
                             (COND
                              ((EQL (ABS |t|) (ABS |s2|))
                               (PROGN (LETT #1# 'T) (GO #4#))))))))))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #4# (EXIT #1#)))) 

(SDEFUN |DELTAC;fundamentalGroup;$Gp;16| ((|s| $) ($ |GroupPresentation|))
        (SPADCALL |s| 'T NIL (QREFELT $ 101))) 

(SDEFUN |DELTAC;fundamentalGroup;$2BGp;17|
        ((|s| $) (|simplify| |Boolean|) (|trace| |Boolean|)
         ($ |GroupPresentation|))
        (SPROG
         ((#1=#:G268 NIL) (|gp| (|GroupPresentation|))
          (|generators| (|List| (|NonNegativeInteger|))) (#2=#:G275 NIL)
          (|x| NIL) (|m| (|NonNegativeInteger|))
          (|rules| (|List| (|List| (|Integer|)))) (|rule| (|List| (|Integer|)))
          (#3=#:G274 NIL) (|vertn| NIL) (#4=#:G273 NIL) (|t| NIL)
          (|polygons| #5=(|List| (|List| (|Integer|)))) (#6=#:G271 NIL)
          (|edge| NIL) (#7=#:G272 NIL) (|edgen| NIL)
          (|edgesInTree| (|List| (|Boolean|))) (#8=#:G270 NIL) (|y| NIL)
          (#9=#:G269 NIL) (|res| (|List| (|List| (|Integer|)))) (|edges| #5#)
          (|span| (|Tree| (|Integer|)))
          (|graph| (|UndirectedGraph| (|NonNegativeInteger|))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL "fundamentalGroup(" (QREFELT $ 29))
                          (SPADCALL |s| (QREFELT $ 103)) (QREFELT $ 31))
                (SPADCALL ")" (QREFELT $ 29)) (QREFELT $ 31))
               (QREFELT $ 34))))
            (LETT |graph| (SPADCALL |s| (QREFELT $ 95)))
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL (SPADCALL "fundamentalGroup graph=" (QREFELT $ 104))
                         (SPADCALL |graph| (QREFELT $ 105)) (QREFELT $ 31))
               (QREFELT $ 34))))
            (LETT |span| (SPADCALL |graph| 1 (QREFELT $ 106)))
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL (SPADCALL "fundamentalGroup span=" (QREFELT $ 29))
                         (SPADCALL |span| (QREFELT $ 107)) (QREFELT $ 31))
               (QREFELT $ 34))))
            (LETT |edges| (SPADCALL |s| 2 (QREFELT $ 67)))
            (LETT |res| (|DELTAC;linksInTree| |res| |span| $))
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL "fundamentalGroup edges=" (QREFELT $ 29))
                           (SPADCALL |edges| (QREFELT $ 44)) (QREFELT $ 31))
                 (SPADCALL " res=" (QREFELT $ 29)) (QREFELT $ 31))
                (SPADCALL |res| (QREFELT $ 44)) (QREFELT $ 31))
               (QREFELT $ 34))))
            (LETT |edgesInTree|
                  (PROGN
                   (LETT #9# NIL)
                   (SEQ (LETT |y| NIL) (LETT #8# |edges|) G190
                        (COND
                         ((OR (ATOM #8#) (PROGN (LETT |y| (CAR #8#)) NIL))
                          (GO G191)))
                        (SEQ (EXIT (LETT #9# (CONS NIL #9#))))
                        (LETT #8# (CDR #8#)) (GO G190) G191
                        (EXIT (NREVERSE #9#)))))
            (SEQ (LETT |edgen| 1) (LETT #7# (LENGTH |edges|)) (LETT |edge| NIL)
                 (LETT #6# |edges|) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |edge| (CAR #6#)) NIL)
                       (|greater_SI| |edgen| #7#))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((|DELTAC;containsEdge?| |edge| |res| $)
                     (SPADCALL |edgesInTree| |edgen| 'T (QREFELT $ 14))))))
                 (LETT #6# (PROG1 (CDR #6#) (LETT |edgen| (|inc_SI| |edgen|))))
                 (GO G190) G191 (EXIT NIL))
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL "fundamentalGroup linksInTree=" (QREFELT $ 29))
                  (SPADCALL |res| (QREFELT $ 44)) (QREFELT $ 31))
                 (SPADCALL " edgesInTree=" (QREFELT $ 29)) (QREFELT $ 31))
                (SPADCALL |edgesInTree| (QREFELT $ 108)) (QREFELT $ 31))
               (QREFELT $ 34))))
            (LETT |polygons| (SPADCALL |s| 3 (QREFELT $ 67)))
            (LETT |rules| NIL)
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL (SPADCALL "fundamentalGroup polygons=" (QREFELT $ 29))
                         (SPADCALL |polygons| (QREFELT $ 44)) (QREFELT $ 31))
               (QREFELT $ 34))))
            (SEQ (LETT |t| NIL) (LETT #4# |polygons|) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL)) (GO G191)))
                 (SEQ (LETT |rule| NIL)
                      (SEQ (LETT |vertn| 1) (LETT #3# (LENGTH |t|)) G190
                           (COND ((|greater_SI| |vertn| #3#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL |edgesInTree|
                                          (ABS
                                           (SPADCALL |t| |vertn|
                                                     (QREFELT $ 87)))
                                          (QREFELT $ 109)))
                               (LETT |rule|
                                     (SPADCALL |rule|
                                               (SPADCALL |t| |vertn|
                                                         (QREFELT $ 87))
                                               (QREFELT $ 110)))))))
                           (LETT |vertn| (|inc_SI| |vertn|)) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL (NULL |rule|))
                         (LETT |rules|
                               (SPADCALL |rules| |rule| (QREFELT $ 99)))))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL (SPADCALL "fundamentalGroup rules=" (QREFELT $ 29))
                         (SPADCALL |rules| (QREFELT $ 44)) (QREFELT $ 31))
               (QREFELT $ 34))))
            (LETT |m| (LENGTH |edges|)) (LETT |generators| NIL)
            (SEQ (LETT |x| 1) (LETT #2# |m|) G190
                 (COND ((|greater_SI| |x| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((NULL (SPADCALL |edgesInTree| |x| (QREFELT $ 109)))
                     (LETT |generators|
                           (SPADCALL |generators| |x| (QREFELT $ 112)))))))
                 (LETT |x| (|inc_SI| |x|)) (GO G190) G191 (EXIT NIL))
            (LETT |gp| (SPADCALL |generators| |rules| (QREFELT $ 113)))
            (COND ((NULL |simplify|) (PROGN (LETT #1# |gp|) (GO #10=#:G267))))
            (EXIT (SPADCALL |gp| |trace| (QREFELT $ 114)))))
          #10# (EXIT #1#)))) 

(SDEFUN |DELTAC;equalSimplex|
        ((|a| |List| (|Integer|)) (|b| |List| (|Integer|)) ($ |Boolean|))
        (SPROG
         ((|offset| (|Integer|)) (#1=#:G283 NIL) (#2=#:G284 NIL) (|n| NIL)
          (|fst| (|Integer|)) (|len| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |len| (LENGTH |a|))
                (COND
                 ((SPADCALL |len| (LENGTH |b|) (QREFELT $ 115))
                  (PROGN (LETT #1# NIL) (GO #3=#:G282))))
                (COND ((EQL |len| 0) (PROGN (LETT #1# 'T) (GO #3#))))
                (LETT |fst| (|SPADfirst| |a|))
                (LETT |offset| (SPADCALL |fst| |b| (QREFELT $ 116)))
                (COND ((< |offset| 1) (PROGN (LETT #1# NIL) (GO #3#))))
                (SEQ (LETT |n| 1) (LETT #2# (LENGTH |a|)) G190
                     (COND ((|greater_SI| |n| #2#) (GO G191)))
                     (SEQ
                      (COND
                       ((SPADCALL (SPADCALL |a| |n| (QREFELT $ 87))
                                  (SPADCALL |b| |offset| (QREFELT $ 87))
                                  (QREFELT $ 117))
                        (PROGN (LETT #1# NIL) (GO #3#))))
                      (LETT |offset| (+ |offset| 1))
                      (EXIT
                       (COND
                        ((SPADCALL |offset| (LENGTH |b|) (QREFELT $ 70))
                         (LETT |offset| 1)))))
                     (LETT |n| (|inc_SI| |n|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #3# (EXIT #1#)))) 

(SDEFUN |DELTAC;=;2$B;19| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G288 NIL) (|len| (|NonNegativeInteger|))
          (|bs| #2=(|List| (|List| (|List| (|Integer|))))) (|as| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |as| (QCDR |a|)) (LETT |bs| (QCDR |b|))
                (LETT |len| (LENGTH |as|))
                (COND
                 ((SPADCALL |len| (LENGTH |bs|) (QREFELT $ 115))
                  (PROGN (LETT #1# NIL) (GO #3=#:G287))))
                (EXIT 'T)))
          #3# (EXIT #1#)))) 

(SDEFUN |DELTAC;coerce;$Of;20| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|tabNum| (|Integer|)) (|res| (|OutputForm|)) (|row| (|OutputForm|))
          (#1=#:G295 NIL) (|a| NIL) (#2=#:G294 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |res| (SPADCALL (QREFELT $ 119)))
                (COND
                 ((NULL (QCDR |s|))
                  (PROGN
                   (LETT #2#
                         (SPADCALL
                          (LIST (SPADCALL "1D: points 1.." (QREFELT $ 29)))
                          (QREFELT $ 120)))
                   (GO #3=#:G293))))
                (LETT |tabNum| (- (LENGTH (QCDR |s|)) 1))
                (SEQ (LETT |a| NIL) (LETT #1# (QCDR |s|)) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |row|
                            (SPADCALL
                             (LIST (SPADCALL " " (QREFELT $ 29))
                                   (SPADCALL |tabNum| (QREFELT $ 121))
                                   (SPADCALL "D:" (QREFELT $ 29))
                                   (SPADCALL |a| (QREFELT $ 44)))
                             (QREFELT $ 120)))
                      (LETT |res| (SPADCALL |res| |row| (QREFELT $ 122)))
                      (EXIT (LETT |tabNum| (- |tabNum| 1))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #3# (EXIT #2#)))) 

(SDEFUN |DELTAC;coerce;$Fsc;21| ((|s| $) ($ |FiniteSimplicialComplex| VS))
        (SPROG ((#1=#:G297 NIL))
               (PROG2 (LETT #1# (SPADCALL |s| (QREFELT $ 125)))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0)
                                 (|FiniteSimplicialComplex| (QREFELT $ 6))
                                 (|Union|
                                  (|FiniteSimplicialComplex| (QREFELT $ 6))
                                  "failed")
                                 #1#)))) 

(DECLAIM (NOTINLINE |DeltaComplex;|)) 

(DEFUN |DeltaComplex| (#1=#:G300)
  (SPROG NIL
         (PROG (#2=#:G301)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|DeltaComplex|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|DeltaComplex;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|DeltaComplex|)))))))))) 

(DEFUN |DeltaComplex;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|DeltaComplex| DV$1))
          (LETT $ (GETREFV 129))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DeltaComplex| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| VERTSET (|List| |#1|))
                              (|:| MAPS
                                   (|List| (|List| (|List| (|Integer|)))))))
          $))) 

(MAKEPROP '|DeltaComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|)
              (|NonNegativeInteger|) (0 . >) (|List| 8) (6 . |new|) (|Integer|)
              (12 . |setelt!|) (|List| 39) '"last" (|List| 15) (19 . |elt|)
              (25 . |concat|) (|List| 6) |DELTAC;deltaComplex;LNniL$;2|
              (|FiniteSimplicialComplex| 6) |DELTAC;deltaComplex;FscB$;4|
              |DELTAC;deltaComplex;Fsc$;3| (|List| 35) (31 . |addImpliedFaces|)
              (|String|) (|OutputForm|) (36 . |message|) (41 . |coerce|)
              (46 . |hconcat|) (52 . |coerce|) (|Void|) (57 . |print|)
              (|List| 40) (62 . |sort|) (67 . |coerce|) (72 . |coerce|)
              (|List| 13) (|OrientedFacet|) (77 . |getIndexesSigned|)
              (82 . |coerce|) (87 . |coerce|) (92 . |coerce|) (|List| $)
              (97 . |boundary|) (102 . |elt|) (108 . |position|) (114 . |Zero|)
              (118 . |coerce|) (|List| 54) (|FiniteCubicalComplex| 6)
              (123 . |addImpliedFaces|) (|List| 57) (128 . |sort|)
              (133 . |concat|) (|CubicalFacet|) (139 . |boundary|)
              (144 . |position|) (150 . |coerce|) (155 . |coerce|)
              (160 . |maxIndex|) |DELTAC;deltaComplex;Fcc$;5|
              |DELTAC;link;2Nni$;6| |DELTAC;triangle;3Nni$;7| (165 . |elt|)
              |DELTAC;faceMap;$NniL;8| (|Matrix| 13) (171 . |zero|) (177 . >)
              (183 . |setelt!|) (|List| 68) (|ChainComplex|)
              (191 . |chainComplex|) |DELTAC;chain;$Cc;9| (|CoChainComplex| 6)
              (196 . |coChainComplex|) |DELTAC;coChain;$Ccc;10|
              (201 . |validate|) (|List| (|Homology|)) (206 . |homology|)
              |DELTAC;homology;$L;11| (211 . |validate|) (216 . |coHomology|)
              |DELTAC;coHomology;$L;12| (221 . |second|) (226 . |elt|)
              (|Record| (|:| |name| 27) (|:| |arrType| 9) (|:| |fromOb| 9)
                        (|:| |toOb| 9) (|:| |xOffset| 13) (|:| |yOffset| 13)
                        (|:| |map| 111))
              (|List| 88) (232 . |concat|)
              (|Record| (|:| |value| 9) (|:| |posX| 9) (|:| |posY| 9))
              (|List| 91) (238 . |concat|) (|UndirectedGraph| 9)
              |DELTAC;oneSkeleton;$Ug;13| (|Tree| 13) (244 . |value|)
              (249 . |children|) (254 . |concat|) (|GroupPresentation|)
              |DELTAC;fundamentalGroup;$2BGp;17|
              |DELTAC;fundamentalGroup;$Gp;16| |DELTAC;coerce;$Of;20|
              (260 . |coerce|) (265 . |coerce|) (270 . |spanningTreeNode|)
              (276 . |coerce|) (281 . |coerce|) (286 . |elt|) (292 . |concat|)
              (|List| 9) (298 . |concat|) (304 . |groupPresentation|)
              (310 . |simplify|) (316 . ~=) (322 . |position|) (328 . ~=)
              |DELTAC;=;2$B;19| (334 . |empty|) (338 . |hconcat|)
              (343 . |coerce|) (348 . |vconcat|) (|Union| $ '"failed")
              (|DeltaComplex| 6) (354 . |simplicialComplexIfCan|)
              |DELTAC;coerce;$Fsc;21| (|SingleInteger|) (|HashState|))
           '#(~= 359 |triangle| 365 |oneSkeleton| 372 |link| 377 |latex| 383
              |homology| 388 |hashUpdate!| 393 |hash| 399 |fundamentalGroup|
              404 |faceMap| 416 |deltaComplex| 422 |coerce| 445 |coHomology|
              455 |coChain| 460 |chain| 465 = 470)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 28))
                        (|makeByteWordVec2| 128
                                            '(2 9 8 0 0 10 2 11 0 9 8 12 3 11 8
                                              0 13 8 14 2 17 15 0 16 18 2 17 0
                                              0 15 19 1 22 25 0 26 1 28 0 27 29
                                              1 22 28 0 30 2 28 0 0 0 31 1 25
                                              28 0 32 1 28 33 0 34 1 35 0 0 36
                                              1 9 28 0 37 1 35 28 0 38 1 40 39
                                              0 41 1 40 28 0 42 1 39 28 0 43 1
                                              15 28 0 44 1 40 45 0 46 2 25 35 0
                                              13 47 2 40 13 0 45 48 0 6 0 49 1
                                              17 28 0 50 1 52 51 0 53 1 54 0 0
                                              55 2 51 0 0 54 56 1 57 45 0 58 2
                                              57 13 0 45 59 1 57 28 0 60 1 54
                                              28 0 61 1 52 9 0 62 2 17 15 0 13
                                              66 2 68 0 9 9 69 2 13 8 0 0 70 4
                                              68 13 0 13 13 13 71 1 73 0 72 74
                                              1 76 0 73 77 1 73 8 0 79 1 73 80
                                              0 81 1 76 8 0 83 1 76 80 0 84 1
                                              17 15 0 86 2 39 13 0 13 87 2 89 0
                                              0 88 90 2 92 0 0 91 93 1 96 13 0
                                              97 1 96 45 0 98 2 15 0 0 39 99 1
                                              27 28 0 104 1 94 28 0 105 2 94 96
                                              0 9 106 1 96 28 0 107 1 11 28 0
                                              108 2 11 8 0 13 109 2 39 0 0 13
                                              110 2 111 0 0 9 112 2 100 0 111
                                              15 113 2 100 0 0 8 114 2 9 8 0 0
                                              115 2 39 13 13 0 116 2 13 8 0 0
                                              117 0 28 0 119 1 28 0 45 120 1 13
                                              28 0 121 2 28 0 0 0 122 1 22 123
                                              124 125 2 0 8 0 0 1 3 0 0 9 9 9
                                              65 1 0 94 0 95 2 0 0 9 9 64 1 0
                                              27 0 1 1 0 80 0 82 2 0 128 128 0
                                              1 1 0 127 0 1 1 0 100 0 102 3 0
                                              100 0 8 8 101 2 0 15 0 9 67 1 0 0
                                              52 63 2 0 0 22 8 23 3 0 0 20 9 17
                                              21 1 0 0 22 24 1 0 22 0 126 1 0
                                              28 0 103 1 0 80 0 85 1 0 76 0 78
                                              1 0 73 0 75 2 0 8 0 0 118)))))
           '|lookupComplete|)) 
