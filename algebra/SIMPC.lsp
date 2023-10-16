
(SDEFUN |SIMPC;simplicialComplex;LNniL$;1|
        ((|v| |List| VS) (|numPoints| |NonNegativeInteger|)
         (|fs| |List| (|List| (|NonNegativeInteger|))) ($ $))
        (SPROG ((|res| (|List| (|OrientedFacet|))) (#1=#:G133 NIL) (|f| NIL))
               (SEQ (LETT |res| NIL)
                    (SEQ (LETT |f| NIL) (LETT #1# |fs|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL 1 |f| (QREFELT $ 11))
                                           (QREFELT $ 13)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (VECTOR |v| |numPoints| |res|))))) 

(SDEFUN |SIMPC;simplicialComplex;LL$;2|
        ((|v| |List| VS) (|fs| |List| (|List| (|NonNegativeInteger|))) ($ $))
        (SPROG
         ((|numPoints| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|))
          (#1=#:G140 NIL) (|fac| NIL) (|facs| (|List| (|OrientedFacet|)))
          (#2=#:G139 NIL) (|f| NIL))
         (SEQ (LETT |facs| NIL)
              (SEQ (LETT |f| NIL) (LETT #2# |fs|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |facs|
                           (SPADCALL |facs| (SPADCALL 1 |f| (QREFELT $ 11))
                                     (QREFELT $ 13)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (LETT |numPoints| 0)
              (SEQ (LETT |fac| NIL) (LETT #1# |facs|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |fac| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |fac| (QREFELT $ 18)))
                        (EXIT
                         (COND
                          ((SPADCALL |m| |numPoints| (QREFELT $ 20))
                           (LETT |numPoints| |m|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |v| |numPoints| |facs|))))) 

(SDEFUN |SIMPC;simplicialComplex;L$;3| ((|v| |List| VS) ($ $))
        (SPROG ((|res| (|List| (|OrientedFacet|))))
               (SEQ (LETT |res| NIL) (EXIT (VECTOR |v| 0 |res|))))) 

(SDEFUN |SIMPC;simplicialComplexIfCan;DcU;4|
        ((|dc| |DeltaComplex| VS) ($ |Union| $ "failed"))
        (SPADCALL |dc| NIL (QREFELT $ 26))) 

(SDEFUN |SIMPC;simplicialComplexIfCan;DcBU;5|
        ((|dc| |DeltaComplex| VS) (|trace| |Boolean|) ($ |Union| $ "failed"))
        (SPROG
         ((|res| (|List| (|OrientedFacet|))) (#1=#:G175 NIL) (|r| NIL)
          (|orf| (|OrientedFacet|)) (#2=#:G169 NIL)
          (|orfx| (|Union| (|OrientedFacet|) "failed"))
          (|subFacets| (|List| (|OrientedFacet|)))
          (|deleteList| (|List| (|OrientedFacet|)))
          (|subFacet2| (|OrientedFacet|)) (|m| (|Integer|))
          (|subFacet| (|OrientedFacet|)) (|ind| (|NonNegativeInteger|))
          (#3=#:G156 NIL) (#4=#:G174 NIL) (|i| NIL) (#5=#:G173 NIL)
          (|facet| NIL) (|thisPoint| #6=(|NonNegativeInteger|)) (#7=#:G172 NIL)
          (|NumPoints| #6#) (|lastMap| (|List| (|List| (|OrientedFacet|))))
          (#8=#:G170 NIL) (|map| NIL) (#9=#:G171 NIL) (|grade| NIL)
          (|maps| (|List| (|List| (|List| (|Integer|)))))
          (|vertset| #10=(|List| VS))
          (|dcrep|
           (|Record| (|:| VERTSET #10#)
                     (|:| MAPS (|List| (|List| (|List| (|Integer|))))))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL "simplicialComplex(" (QREFELT $ 30))
                          (SPADCALL |dc| (QREFELT $ 31)) (QREFELT $ 32))
                (SPADCALL ")" (QREFELT $ 30)) (QREFELT $ 32))
               (QREFELT $ 34))))
            (LETT |dcrep| |dc|) (LETT |NumPoints| 0)
            (LETT |vertset| (QCAR |dcrep|))
            (LETT |maps| (REVERSE (QCDR |dcrep|))) (LETT |res| NIL)
            (LETT |deleteList| NIL) (LETT |lastMap| NIL)
            (SEQ (LETT |grade| 1) (LETT #9# (LENGTH |maps|)) (LETT |map| NIL)
                 (LETT #8# |maps|) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |map| (CAR #8#)) NIL)
                       (|greater_SI| |grade| #9#))
                   (GO G191)))
                 (SEQ (LETT |lastMap| (SPADCALL |lastMap| NIL (QREFELT $ 36)))
                      (COND
                       (|trace|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL "simplicialComplex map="
                                        (QREFELT $ 37))
                              (SPADCALL |map| (QREFELT $ 39)) (QREFELT $ 32))
                             (SPADCALL " grade=" (QREFELT $ 37))
                             (QREFELT $ 32))
                            (SPADCALL |grade| (QREFELT $ 40)) (QREFELT $ 32))
                           (SPADCALL " lastMap=" (QREFELT $ 37))
                           (QREFELT $ 32))
                          (SPADCALL |lastMap| (QREFELT $ 41)) (QREFELT $ 32))
                         (QREFELT $ 34))))
                      (COND
                       ((EQL |grade| 1)
                        (SEQ (LETT |NumPoints| (LENGTH |map|))
                             (LETT |thisPoint| 0)
                             (EXIT
                              (SEQ (LETT |facet| NIL) (LETT #7# |map|) G190
                                   (COND
                                    ((OR (ATOM #7#)
                                         (PROGN (LETT |facet| (CAR #7#)) NIL))
                                     (GO G191)))
                                   (SEQ (LETT |thisPoint| (+ |thisPoint| 1))
                                        (EXIT
                                         (COND
                                          ((NULL (NULL |facet|))
                                           (SEQ
                                            (LETT |orf|
                                                  (SPADCALL (LIST |thisPoint|)
                                                            (QREFELT $ 43)))
                                            (COND
                                             (|trace|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL
                                                   "simplicialComplex add point="
                                                   (QREFELT $ 30))
                                                  (SPADCALL |orf|
                                                            (QREFELT $ 44))
                                                  (QREFELT $ 32))
                                                 (SPADCALL " from face="
                                                           (QREFELT $ 30))
                                                 (QREFELT $ 32))
                                                (SPADCALL |facet|
                                                          (QREFELT $ 45))
                                                (QREFELT $ 32))
                                               (QREFELT $ 34))))
                                            (LETT |res|
                                                  (SPADCALL |res| |orf|
                                                            (QREFELT $ 13)))
                                            (EXIT
                                             (SPADCALL |lastMap| |grade|
                                                       (SPADCALL
                                                        (SPADCALL |lastMap|
                                                                  |grade|
                                                                  (QREFELT $
                                                                           46))
                                                        |orf| (QREFELT $ 13))
                                                       (QREFELT $ 47))))))))
                                   (LETT #7# (CDR #7#)) (GO G190) G191
                                   (EXIT NIL))))))
                      (EXIT
                       (COND
                        ((SPADCALL |grade| 1 (QREFELT $ 20))
                         (SEQ (LETT |facet| NIL) (LETT #5# |map|) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |facet| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |subFacets| NIL)
                                   (SEQ (LETT |i| NIL) (LETT #4# |facet|) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN (LETT |i| (CAR #4#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |ind|
                                               (PROG1 (LETT #3# (ABS |i|))
                                                 (|check_subtype2| (>= #3# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #3#)))
                                         (LETT |subFacet|
                                               (SPADCALL
                                                (SPADCALL |lastMap|
                                                          (- |grade| 1)
                                                          (QREFELT $ 46))
                                                |ind| (QREFELT $ 48)))
                                         (LETT |m|
                                               (COND ((< |i| 1) -1) ('T 1)))
                                         (LETT |subFacet2|
                                               (SPADCALL |m| |subFacet|
                                                         (QREFELT $ 49)))
                                         (LETT |deleteList|
                                               (SPADCALL |deleteList|
                                                         |subFacet|
                                                         (QREFELT $ 13)))
                                         (EXIT
                                          (LETT |subFacets|
                                                (SPADCALL |subFacets|
                                                          |subFacet2|
                                                          (QREFELT $ 13)))))
                                        (LETT #4# (CDR #4#)) (GO G190) G191
                                        (EXIT NIL))
                                   (LETT |orfx|
                                         (SPADCALL |subFacets| (QREFELT $ 51)))
                                   (COND
                                    ((QEQCAR |orfx| 1)
                                     (PROGN
                                      (LETT #2# (CONS 1 "failed"))
                                      (GO #11=#:G168))))
                                   (LETT |orf| (QCDR |orfx|))
                                   (LETT |res|
                                         (SPADCALL |res| |orf| (QREFELT $ 13)))
                                   (EXIT
                                    (SPADCALL |lastMap| |grade|
                                              (SPADCALL
                                               (SPADCALL |lastMap| |grade|
                                                         (QREFELT $ 46))
                                               |orf| (QREFELT $ 13))
                                              (QREFELT $ 47))))
                              (LETT #5# (CDR #5#)) (GO G190) G191
                              (EXIT NIL))))))
                 (LETT #8# (PROG1 (CDR #8#) (LETT |grade| (|inc_SI| |grade|))))
                 (GO G190) G191 (EXIT NIL))
            (SEQ (LETT |r| NIL) (LETT #1# |deleteList|) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL)) (GO G191)))
                 (SEQ (EXIT (LETT |res| (SPADCALL |r| |res| (QREFELT $ 52)))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL "simplicialComplex construct res=" (QREFELT $ 30))
                (SPADCALL |res| (QREFELT $ 53)) (QREFELT $ 32))
               (QREFELT $ 34))))
            (EXIT (CONS 0 (VECTOR |vertset| |NumPoints| |res|)))))
          #11# (EXIT #2#)))) 

(SDEFUN |SIMPC;addSimplex;$Of$;6| ((|a| $) (|f| |OrientedFacet|) ($ $))
        (SPROG
         ((|numPoints| (|NonNegativeInteger|)) (|max| (|NonNegativeInteger|))
          (#1=#:G188 NIL) (|orf2| NIL) (|res2| (|List| (|OrientedFacet|)))
          (#2=#:G187 NIL) (|orf| NIL) (|res| (|List| (|OrientedFacet|)))
          (|found| (|Boolean|)) (|m| (|Integer|)) (#3=#:G186 NIL))
         (SEQ (LETT |res| (QVELT |a| 2)) (LETT |found| NIL)
              (SEQ (LETT |orf| NIL) (LETT #3# |res|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |orf| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |orf| (QREFELT $ 54))
                                 (SPADCALL |f| (QREFELT $ 54)) (QREFELT $ 55))
                       (SEQ
                        (LETT |m|
                              (+ (SPADCALL |orf| (QREFELT $ 56))
                                 (SPADCALL |f| (QREFELT $ 56))))
                        (SPADCALL |orf| |m| (QREFELT $ 57))
                        (EXIT (LETT |found| 'T)))))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL |found|)
                (LETT |res| (SPADCALL |res| |f| (QREFELT $ 13)))))
              (LETT |res2| NIL)
              (SEQ (LETT |orf| NIL) (LETT #2# |res|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |orf| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |orf| (QREFELT $ 56)) 0
                                 (QREFELT $ 58))
                       (LETT |res2| (SPADCALL |res2| |orf| (QREFELT $ 13)))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (LETT |numPoints| 0)
              (SEQ (LETT |orf2| NIL) (LETT #1# |res2|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |orf2| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |max| (SPADCALL |orf2| (QREFELT $ 18)))
                        (EXIT
                         (COND
                          ((SPADCALL |max| |numPoints| (QREFELT $ 20))
                           (LETT |numPoints| |max|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR (QVELT |a| 0) |numPoints| |res2|))))) 

(SDEFUN |SIMPC;maxIndex;$Nni;7| ((|s| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|res| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|))
          (#1=#:G193 NIL) (|fac| NIL) (|facs| (|List| (|OrientedFacet|))))
         (SEQ (LETT |res| 0) (LETT |facs| (QVELT |s| 2))
              (SEQ (LETT |fac| NIL) (LETT #1# |facs|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |fac| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |fac| (QREFELT $ 18)))
                        (EXIT
                         (COND
                          ((SPADCALL |m| |res| (QREFELT $ 20))
                           (LETT |res| |m|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |SIMPC;minIndex;$Nni;8| ((|s| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|res| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|))
          (#1=#:G201 NIL) (|fac| NIL) (#2=#:G200 NIL)
          (|facs| (|List| (|OrientedFacet|))))
         (SEQ
          (EXIT
           (SEQ (LETT |res| 10000) (LETT |facs| (QVELT |s| 2))
                (COND
                 ((EQL (LENGTH |facs|) 0) (PROGN (LETT #2# 0) (GO #3=#:G199))))
                (SEQ (LETT |fac| NIL) (LETT #1# |facs|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |fac| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |m| (SPADCALL |fac| (QREFELT $ 61)))
                          (EXIT (COND ((< |m| |res|) (LETT |res| |m|)))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #3# (EXIT #2#)))) 

(SDEFUN |SIMPC;grade;$L;9| ((|s| $) ($ |List| (|List| (|OrientedFacet|))))
        (SPROG
         ((|gr| (|Integer|)) (#1=#:G212 NIL) (|face| NIL)
          (|res| (|List| (|List| (|OrientedFacet|)))) (#2=#:G211 NIL) (|a| NIL)
          (#3=#:G209 NIL) (|maxGrade| (|NonNegativeInteger|)) (#4=#:G210 NIL)
          (|simp| (|List| (|OrientedFacet|))))
         (SEQ
          (EXIT
           (SEQ (LETT |simp| (QVELT |s| 2)) (LETT |maxGrade| 0)
                (SEQ (LETT |face| NIL) (LETT #4# |simp|) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |face| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |face| (QREFELT $ 63)) |maxGrade|
                                   (QREFELT $ 20))
                         (LETT |maxGrade| (SPADCALL |face| (QREFELT $ 63)))))))
                     (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                (LETT |res| NIL)
                (COND
                 ((< |maxGrade| 1) (PROGN (LETT #3# |res|) (GO #5=#:G208))))
                (SEQ (LETT |a| 1) (LETT #2# |maxGrade|) G190
                     (COND ((|greater_SI| |a| #2#) (GO G191)))
                     (SEQ
                      (EXIT (LETT |res| (SPADCALL |res| NIL (QREFELT $ 36)))))
                     (LETT |a| (|inc_SI| |a|)) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |face| NIL) (LETT #1# |simp|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |face| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |gr| (SPADCALL |face| (QREFELT $ 63)))
                          (EXIT
                           (COND
                            ((SPADCALL |gr| 0 (QREFELT $ 64))
                             (SPADCALL |res| |gr|
                                       (SPADCALL
                                        (SPADCALL |res| |gr| (QREFELT $ 46))
                                        |face| (QREFELT $ 13))
                                       (QREFELT $ 47))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #5# (EXIT #3#)))) 

(SDEFUN |SIMPC;sort;2$;10| ((|s| $) ($ $))
        (SPROG ((|fs| (|List| (|OrientedFacet|))) (|v| (|List| VS)))
               (SEQ (LETT |v| (QVELT |s| 0)) (LETT |fs| (QVELT |s| 2))
                    (EXIT
                     (VECTOR |v| (QVELT |s| 1)
                             (SPADCALL |fs| (QREFELT $ 66))))))) 

(SDEFUN |SIMPC;orderedPermutation|
        ((|lst| |List| (|Integer|)) (|len| |NonNegativeInteger|)
         ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|reslt| (|List| (|List| (|Integer|)))) (|r1| (|List| (|Integer|)))
          (#1=#:G228 NIL) (#2=#:G220 NIL) (|x| NIL)
          (|rst| (|List| (|Integer|))) (|fst| (|Integer|)) (#3=#:G226 NIL)
          (#4=#:G227 NIL) (|y| NIL))
         (SEQ
          (EXIT
           (SEQ (COND ((< |len| 1) (PROGN (LETT #3# NIL) (GO #5=#:G225))))
                (COND
                 ((SPADCALL |len| (LENGTH |lst|) (QREFELT $ 20))
                  (PROGN (LETT #3# NIL) (GO #5#))))
                (COND
                 ((EQL |len| (LENGTH |lst|))
                  (PROGN (LETT #3# (LIST |lst|)) (GO #5#))))
                (LETT |reslt| NIL)
                (COND
                 ((EQL |len| 1)
                  (SEQ
                   (SEQ (LETT |y| NIL) (LETT #4# |lst|) G190
                        (COND
                         ((OR (ATOM #4#) (PROGN (LETT |y| (CAR #4#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |reslt|
                                (SPADCALL |reslt| (LIST |y|) (QREFELT $ 68)))))
                        (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                   (EXIT (PROGN (LETT #3# |reslt|) (GO #5#))))))
                (LETT |fst| (|SPADfirst| |lst|)) (LETT |rst| (CDR |lst|))
                (SEQ (LETT |x| NIL)
                     (LETT #1#
                           (|SIMPC;orderedPermutation| |rst|
                            (PROG2 (LETT #2# (SPADCALL |len| 1 (QREFELT $ 69)))
                                (QCDR #2#)
                              (|check_union2| (QEQCAR #2# 0)
                                              (|NonNegativeInteger|)
                                              (|Union| (|NonNegativeInteger|)
                                                       "failed")
                                              #2#))
                            $))
                     G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |r1| (CONS |fst| |x|))
                          (EXIT
                           (LETT |reslt|
                                 (SPADCALL |reslt| |r1| (QREFELT $ 68)))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (LETT |reslt|
                      (SPADCALL |reslt|
                                (|SIMPC;orderedPermutation| |rst| |len| $)
                                (QREFELT $ 70)))
                (EXIT |reslt|)))
          #5# (EXIT #3#)))) 

(SDEFUN |SIMPC;isNewFace?|
        ((|lst| |List| (|OrientedFacet|)) (|b| |OrientedFacet|) ($ |Boolean|))
        (SPROG ((#1=#:G233 NIL) (#2=#:G234 NIL) (|a| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |a| NIL) (LETT #2# |lst|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |a| |b| (QREFELT $ 71))
                           (PROGN (LETT #1# NIL) (GO #3=#:G232))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |SIMPC;unorientedUnion|
        ((|a| . #1=(|List| (|OrientedFacet|))) (|b| |List| (|OrientedFacet|))
         ($ |List| (|OrientedFacet|)))
        (SPROG ((|res| #1#) (#2=#:G239 NIL) (|b1| NIL))
               (SEQ (LETT |res| |a|)
                    (SEQ (LETT |b1| NIL) (LETT #2# |b|) G190
                         (COND
                          ((OR (ATOM #2#) (PROGN (LETT |b1| (CAR #2#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|SIMPC;isNewFace?| |a| |b1| $)
                             (LETT |res| (CONS |b1| |res|))))))
                         (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |SIMPC;addImpliedFaces;$L;14|
        ((|s| $) ($ |List| (|List| (|OrientedFacet|))))
        (SPROG
         ((|newFaces| (|List| (|OrientedFacet|)))
          (|len| (|NonNegativeInteger|)) (#1=#:G249 NIL) (|face| NIL)
          (|res| (|List| (|List| (|OrientedFacet|))))
          (|all_faces| (|List| (|OrientedFacet|))) (#2=#:G248 NIL) (|gr| NIL)
          (#3=#:G247 NIL) (|maxGrade| (|NonNegativeInteger|))
          (|inputList| (|List| (|List| (|OrientedFacet|)))))
         (SEQ
          (EXIT
           (SEQ (LETT |inputList| (REVERSE (SPADCALL |s| (QREFELT $ 65))))
                (LETT |res| NIL) (LETT |maxGrade| (LENGTH |inputList|))
                (COND
                 ((< |maxGrade| 1)
                  (SEQ
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL "addImpliedFaces return because empty"
                               (QREFELT $ 30))
                     (SPADCALL |maxGrade| (QREFELT $ 40)) (QREFELT $ 32))
                    (QREFELT $ 34))
                   (EXIT (PROGN (LETT #3# |res|) (GO #4=#:G246))))))
                (LETT |res| NIL) (LETT |newFaces| NIL)
                (SEQ (LETT |gr| NIL) (LETT #2# |inputList|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |gr| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |all_faces|
                            (|SIMPC;unorientedUnion| |newFaces| |gr| $))
                      (LETT |res| (CONS |all_faces| |res|))
                      (LETT |newFaces| NIL)
                      (EXIT
                       (SEQ (LETT |face| NIL) (LETT #1# |all_faces|) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |face| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |len|
                                   (- (SPADCALL |face| (QREFELT $ 63)) 1))
                             (EXIT
                              (COND
                               ((SPADCALL |len| 0 (QREFELT $ 20))
                                (LETT |newFaces|
                                      (|SIMPC;unorientedUnion| |newFaces|
                                       (SPADCALL |face| |len| |len|
                                                 (QREFELT $ 72))
                                       $))))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #4# (EXIT #3#)))) 

(SDEFUN |SIMPC;boundary;2$;15| ((|s| $) ($ $))
        (SPROG
         ((|res| ($)) (#1=#:G256 NIL) (|y| NIL)
          (|x| (|List| (|OrientedFacet|))) (#2=#:G255 NIL) (|facet| NIL))
         (SEQ (LETT |res| (SPADCALL (QVELT |s| 0) (QREFELT $ 23)))
              (SEQ (LETT |facet| NIL) (LETT #2# (QVELT |s| 2)) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |facet| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |x| (SPADCALL |facet| (QREFELT $ 74)))
                        (EXIT
                         (SEQ (LETT |y| NIL) (LETT #1# |x|) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |y| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |res|
                                      (SPADCALL |res| |y| (QREFELT $ 59)))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |SIMPC;star;$Of$;16| ((|s| $) (|simplex| |OrientedFacet|) ($ $))
        (SPROG
         ((|res| (|List| (|OrientedFacet|))) (#1=#:G261 NIL) (|simp| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |simp| NIL) (LETT #1# (QVELT |s| 2)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |simp| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |simplex| |simp| (QREFELT $ 76))
                       (LETT |res| (SPADCALL |res| |simp| (QREFELT $ 13)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR (QVELT |s| 0) (QVELT |s| 1) |res|))))) 

(SDEFUN |SIMPC;link;$Of$;17| ((|s| $) (|simplex| |OrientedFacet|) ($ $))
        (SPROG
         ((|res| (|List| (|OrientedFacet|))) (|x| (|List| (|OrientedFacet|)))
          (#1=#:G267 NIL) (|facet| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |facet| NIL) (LETT #1# (QVELT |s| 2)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |facet| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |simplex| |facet| (QREFELT $ 76))
                       (SEQ (LETT |x| (SPADCALL |facet| (QREFELT $ 74)))
                            (EXIT
                             (LETT |res|
                                   (SPADCALL |res| |x| (QREFELT $ 78)))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR (QVELT |s| 0) (QVELT |s| 1) |res|))))) 

(SDEFUN |SIMPC;cone;$Nni$;18| ((|s| $) (|vertex| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|res| (|List| (|OrientedFacet|))) (|x| (|OrientedFacet|))
          (#1=#:G272 NIL) (|facet| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |facet| NIL) (LETT #1# (QVELT |s| 2)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |facet| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |x| (SPADCALL |facet| |vertex| (QREFELT $ 80)))
                        (EXIT
                         (LETT |res| (SPADCALL |res| |x| (QREFELT $ 13)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR (QVELT |s| 0) (QVELT |s| 1) |res|))))) 

(SDEFUN |SIMPC;refactorIndexes;$Nni$;19|
        ((|a| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|res| (|List| (|OrientedFacet|))) (|r| (|OrientedFacet|))
          (#1=#:G277 NIL) (|facet| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |facet| NIL) (LETT #1# (QVELT |a| 2)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |facet| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |r| (SPADCALL |facet| |n| (QREFELT $ 82)))
                        (EXIT
                         (LETT |res| (SPADCALL |res| |r| (QREFELT $ 13)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR (QVELT |a| 0) (QVELT |a| 1) |res|))))) 

(SDEFUN |SIMPC;makeDisjoint;3$;20| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((#1=#:G280 NIL) (|maxb| #2=(|NonNegativeInteger|))
          (|minb| #3=(|NonNegativeInteger|)) (|maxa| #2#) (|mina| #3#))
         (SEQ
          (EXIT
           (SEQ (LETT |mina| (SPADCALL |a| (QREFELT $ 62)))
                (LETT |maxa| (SPADCALL |a| (QREFELT $ 60)))
                (LETT |minb| (SPADCALL |b| (QREFELT $ 62)))
                (LETT |maxb| (SPADCALL |b| (QREFELT $ 60)))
                (COND
                 ((< |maxa| |minb|) (PROGN (LETT #1# |b|) (GO #4=#:G279))))
                (COND ((< |maxb| |mina|) (PROGN (LETT #1# |b|) (GO #4#))))
                (EXIT (SPADCALL |b| |maxa| (QREFELT $ 83)))))
          #4# (EXIT #1#)))) 

(SDEFUN |SIMPC;simplicialJoin;2$B$;21|
        ((|a| $) (|b| $) (|enforceDisjoint| |Boolean|) ($ $))
        (SPROG
         ((|numPoints| (|NonNegativeInteger|)) (|verts| (|List| VS))
          (|res| (|List| (|OrientedFacet|))) (|fac| (|OrientedFacet|))
          (#1=#:G290 NIL) (|y| NIL) (#2=#:G289 NIL) (|x| NIL) (|b2| ($))
          (#3=#:G288 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND ((NULL (QVELT |a| 2)) (PROGN (LETT #3# |b|) (GO #4=#:G287))))
            (COND ((NULL (QVELT |b| 2)) (PROGN (LETT #3# |a|) (GO #4#))))
            (LETT |b2|
                  (COND (|enforceDisjoint| (SPADCALL |a| |b| (QREFELT $ 84)))
                        ('T |b|)))
            (LETT |res| NIL)
            (SEQ (LETT |x| NIL) (LETT #2# (QVELT |a| 2)) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |y| NIL) (LETT #1# (QVELT |b2| 2)) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ (LETT |fac| (SPADCALL |x| |y| (QREFELT $ 85)))
                             (EXIT
                              (LETT |res|
                                    (SPADCALL |res| |fac| (QREFELT $ 13)))))
                        (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
            (LETT |verts|
                  (SPADCALL (QVELT |a| 0) (QVELT |b| 0) (QREFELT $ 86)))
            (LETT |numPoints| (+ (QVELT |a| 1) (QVELT |b| 1)))
            (EXIT (VECTOR |verts| |numPoints| |res|))))
          #4# (EXIT #3#)))) 

(SDEFUN |SIMPC;merge;3$;22| ((|a| $) (|b| $) ($ $))
        (SPROG ((|res| ($)) (#1=#:G294 NIL) (|x| NIL))
               (SEQ (LETT |res| (MOVEVEC (MAKE_VEC 3) |a|))
                    (SEQ (LETT |x| NIL) (LETT #1# (QVELT |b| 2)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res| (SPADCALL |res| |x| (QREFELT $ 59)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |SIMPC;concatIfNew|
        ((|a| |List|
          (|Record| (|:| |value| (|NonNegativeInteger|))
                    (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|))))
         (|b| |NonNegativeInteger|)
         ($ |List|
          (|Record| (|:| |value| (|NonNegativeInteger|))
                    (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)))))
        (SPROG ((#1=#:G302 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (VECTOR |b| 0 0) |a| (QREFELT $ 91))
                    (PROGN (LETT #1# |a|) (GO #2=#:G301))))
                  (EXIT (SPADCALL |a| (VECTOR |b| 0 0) (QREFELT $ 92)))))
                #2# (EXIT #1#)))) 

(SDEFUN |SIMPC;concatIfNewArrow|
        ((|a| |List|
          (|Record| (|:| |name| (|String|))
                    (|:| |arrType| (|NonNegativeInteger|))
                    (|:| |fromOb| (|NonNegativeInteger|))
                    (|:| |toOb| (|NonNegativeInteger|))
                    (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                    (|:| |map| (|List| (|NonNegativeInteger|)))))
         (|p| |NonNegativeInteger|) (|m| |NonNegativeInteger|)
         ($ |List|
          (|Record| (|:| |name| (|String|))
                    (|:| |arrType| (|NonNegativeInteger|))
                    (|:| |fromOb| (|NonNegativeInteger|))
                    (|:| |toOb| (|NonNegativeInteger|))
                    (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                    (|:| |map| (|List| (|NonNegativeInteger|))))))
        (SPROG ((#1=#:G313 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (VECTOR "x" 0 |p| |m| 0 0 NIL) |a|
                              (QREFELT $ 95))
                    (PROGN (LETT #1# |a|) (GO #2=#:G312))))
                  (COND
                   ((SPADCALL (VECTOR "x" 0 |m| |p| 0 0 NIL) |a|
                              (QREFELT $ 95))
                    (PROGN (LETT #1# |a|) (GO #2#))))
                  (EXIT
                   (SPADCALL |a| (VECTOR "x" 0 |p| |m| 0 0 NIL)
                             (QREFELT $ 96)))))
                #2# (EXIT #1#)))) 

(SDEFUN |SIMPC;oneSkeleton;$Dg;25|
        ((|s| $) ($ |DirectedGraph| (|NonNegativeInteger|)))
        (SPROG
         ((|edges|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (#1=#:G325 NIL) (|p| NIL)
          (|nodes|
           (|List|
            (|Record| (|:| |value| (|NonNegativeInteger|))
                      (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#2=#:G324 NIL) (|m| NIL)
          (|y|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|indexes| (|List| (|NonNegativeInteger|)))
          (|n| (|NonNegativeInteger|)) (#3=#:G323 NIL) (|x| NIL)
          (GS
           (|Join| (|FiniteGraph| #4=(|NonNegativeInteger|))
                   (CATEGORY |domain|
                    (SIGNATURE |directedGraph| ($ (|List| #4#)))
                    (SIGNATURE |directedGraph|
                     ($
                      (|List|
                       (|Record| (|:| |value| #4#)
                                 (|:| |posX| (|NonNegativeInteger|))
                                 (|:| |posY| (|NonNegativeInteger|))))))
                    (SIGNATURE |directedGraph|
                     ($
                      (|List|
                       (|Record| (|:| |value| #4#)
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
                    (SIGNATURE |directedGraph|
                     ($ (|List| #4#)
                      (|List|
                       (|Record| (|:| |fromOb| (|NonNegativeInteger|))
                                 (|:| |toOb| (|NonNegativeInteger|))))))
                    (SIGNATURE |directedGraph|
                     ($ (|List| #4#) (|List| (|List| (|NonNegativeInteger|)))))
                    (SIGNATURE |directedGraph|
                     ($ (|List| (|Permutation| #4#))))
                    (SIGNATURE |directedGraph| ($ (|FinitePoset| #4#)))
                    (SIGNATURE * ((|DirectedGraph| (|Product| #4# #4#)) $ $))
                    (SIGNATURE |cartesian|
                     ((|DirectedGraph| (|Product| #4# #4#)) $ $))
                    (SIGNATURE |closedTensor| ($ $ $ (|Mapping| #4# #4# #4#)))
                    (SIGNATURE |closedCartesian|
                     ($ $ $ (|Mapping| #4# #4# #4#)))
                    (SIGNATURE ~ ($ $))
                    (SIGNATURE |coerce| ($ (|PermutationGroup| #4#)))
                    (SIGNATURE |coerce| ($ (|FinitePoset| #4#)))
                    (SIGNATURE |coerce| ($ (|List| #4#)))))))
         (SEQ (LETT GS (|DirectedGraph| (|NonNegativeInteger|)))
              (LETT |nodes| NIL) (LETT |edges| NIL)
              (SEQ (LETT |x| NIL) (LETT #3# (QVELT |s| 2)) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |n| (SPADCALL |x| (QREFELT $ 63)))
                        (LETT |indexes| (SPADCALL |x| (QREFELT $ 54)))
                        (COND
                         ((EQL |n| 2)
                          (SEQ
                           (LETT |nodes|
                                 (|SIMPC;concatIfNew| |nodes|
                                  (SPADCALL |indexes| 1 (QREFELT $ 97)) $))
                           (LETT |nodes|
                                 (|SIMPC;concatIfNew| |nodes|
                                  (SPADCALL |indexes| 2 (QREFELT $ 97)) $))
                           (LETT |y|
                                 (VECTOR "x" 0
                                         (SPADCALL |indexes| 1 (QREFELT $ 97))
                                         (SPADCALL |indexes| 2 (QREFELT $ 97))
                                         0 0 NIL))
                           (EXIT
                            (LETT |edges|
                                  (SPADCALL |edges| |y| (QREFELT $ 96)))))))
                        (EXIT
                         (COND
                          ((SPADCALL |n| 2 (QREFELT $ 20))
                           (SEQ (LETT |m| NIL) (LETT #2# |indexes|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |m| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |nodes|
                                       (|SIMPC;concatIfNew| |nodes| |m| $))
                                 (EXIT
                                  (SEQ (LETT |p| NIL) (LETT #1# |indexes|) G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN (LETT |p| (CAR #1#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((< |p| |m|)
                                           (LETT |edges|
                                                 (|SIMPC;concatIfNewArrow|
                                                  |edges| |p| |m| $))))))
                                       (LETT #1# (CDR #1#)) (GO G190) G191
                                       (EXIT NIL))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT NIL))))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |nodes| |edges|
                         (|compiledLookupCheck| '|directedGraph|
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
                                                GS)))))) 

(SDEFUN |SIMPC;fundamentalGroup;$Gp;26| ((|s| $) ($ |GroupPresentation|))
        (SPADCALL |s| 'T NIL (QREFELT $ 101))) 

(SDEFUN |SIMPC;fundamentalGroup;$2BGp;27|
        ((|s| $) (|simplify| |Boolean|) (|trace| |Boolean|)
         ($ |GroupPresentation|))
        (SPROG ((|dc| (|DeltaComplex| VS)))
               (SEQ (LETT |dc| (SPADCALL |s| (QREFELT $ 104)))
                    (EXIT (SPADCALL |dc| |simplify| |trace| (QREFELT $ 105)))))) 

(SDEFUN |SIMPC;chain;$Cc;28| ((|s| $) ($ |ChainComplex|))
        (SPROG ((|dc| (|DeltaComplex| VS)))
               (SEQ (LETT |dc| (SPADCALL |s| (QREFELT $ 104)))
                    (EXIT (SPADCALL |dc| (QREFELT $ 107)))))) 

(SDEFUN |SIMPC;coChain;$Ccc;29| ((|s| $) ($ |CoChainComplex| VS))
        (SPADCALL (SPADCALL |s| (QREFELT $ 108)) (QREFELT $ 110))) 

(SDEFUN |SIMPC;homology;$L;30| ((|s| $) ($ |List| (|Homology|)))
        (SPROG ((|dc| (|DeltaComplex| VS)))
               (SEQ (LETT |dc| (SPADCALL |s| (QREFELT $ 104)))
                    (EXIT (SPADCALL |dc| (QREFELT $ 113)))))) 

(SDEFUN |SIMPC;coHomology;$L;31| ((|s| $) ($ |List| (|Homology|)))
        (SPROG ((|dc| (|DeltaComplex| VS)))
               (SEQ (LETT |dc| (SPADCALL |s| (QREFELT $ 104)))
                    (EXIT (SPADCALL |dc| (QREFELT $ 115)))))) 

(SDEFUN |SIMPC;product;3$;32| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|numPoints| (|NonNegativeInteger|))
          (|res3| (|List| (|OrientedFacet|)))
          (|inds2| (|List| (|NonNegativeInteger|)))
          (|newIndex| (|NonNegativeInteger|)) (|r| (|NonNegativeInteger|))
          (#1=#:G347 NIL) (|l| (|NonNegativeInteger|)) (#2=#:G362 NIL)
          (|y| NIL) (|mul| (|Integer|))
          (|inds|
           (|List|
            (|Record| (|:| |left| (|NonNegativeInteger|))
                      (|:| |right| (|NonNegativeInteger|)))))
          (#3=#:G361 NIL) (|x| NIL) (|dimb| #4=(|NonNegativeInteger|))
          (|bz| (|NonNegativeInteger|)) (|dima| #4#)
          (|az| (|NonNegativeInteger|)) (#5=#:G360 NIL) (|z| NIL)
          (|res2| (|List| (|ProductFacet|))) (#6=#:G359 NIL) (|e| NIL)
          (|res| (|List| (|ProductFacet|))) (#7=#:G358 NIL) (|simpb| NIL)
          (#8=#:G357 NIL) (|simpa| NIL) (|vs| (|List| VS)) (|pp| (VS))
          (#9=#:G356 NIL) (|pb| NIL) (#10=#:G355 NIL) (|pa| NIL)
          (|simpsb| #11=(|List| (|OrientedFacet|))) (|simpsa| #11#))
         (SEQ (LETT |simpsa| (QVELT |a| 2)) (LETT |simpsb| (QVELT |b| 2))
              (LETT |vs| NIL)
              (SEQ (LETT |pa| NIL) (LETT #10# (QVELT |a| 0)) G190
                   (COND
                    ((OR (ATOM #10#) (PROGN (LETT |pa| (CAR #10#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |pb| NIL) (LETT #9# (QVELT |b| 0)) G190
                          (COND
                           ((OR (ATOM #9#) (PROGN (LETT |pb| (CAR #9#)) NIL))
                            (GO G191)))
                          (SEQ (LETT |pp| (SPADCALL |pa| |pb| (QREFELT $ 117)))
                               (EXIT
                                (LETT |vs|
                                      (SPADCALL |vs| |pp| (QREFELT $ 118)))))
                          (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #10# (CDR #10#)) (GO G190) G191 (EXIT NIL))
              (LETT |res| NIL)
              (SEQ (LETT |simpa| NIL) (LETT #8# |simpsa|) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |simpa| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |simpb| NIL) (LETT #7# |simpsb|) G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |simpb| (CAR #7#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |res|
                                  (SPADCALL |res|
                                            (SPADCALL |simpa| |simpb|
                                                      (QREFELT $ 120))
                                            (QREFELT $ 121)))))
                          (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
              (LETT |res2| NIL)
              (SEQ (LETT |e| NIL) (LETT #6# |res|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |e| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |e| |res2| (QREFELT $ 123)))
                       (LETT |res2| (SPADCALL |res2| |e| (QREFELT $ 124)))))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (LETT |res3| NIL) (LETT |dima| 0) (LETT |dimb| 0)
              (SEQ (LETT |z| NIL) (LETT #5# |res2|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |z| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |az| (SPADCALL |z| (QREFELT $ 125)))
                        (COND
                         ((SPADCALL |az| |dima| (QREFELT $ 20))
                          (LETT |dima| |az|)))
                        (LETT |bz| (SPADCALL |z| (QREFELT $ 126)))
                        (EXIT
                         (COND
                          ((SPADCALL |bz| |dimb| (QREFELT $ 20))
                           (LETT |dimb| |bz|)))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |x| NIL) (LETT #3# |res2|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |inds| (SPADCALL |x| (QREFELT $ 129)))
                        (LETT |inds2| NIL)
                        (LETT |mul| (SPADCALL |x| (QREFELT $ 130)))
                        (SEQ (LETT |y| NIL) (LETT #2# |inds|) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |y| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |l|
                                    (PROG2
                                        (LETT #1#
                                              (SPADCALL (QCAR |y|) 1
                                                        (QREFELT $ 69)))
                                        (QCDR #1#)
                                      (|check_union2| (QEQCAR #1# 0)
                                                      (|NonNegativeInteger|)
                                                      (|Union|
                                                       (|NonNegativeInteger|)
                                                       #12="failed")
                                                      #1#)))
                              (LETT |r|
                                    (PROG2
                                        (LETT #1#
                                              (SPADCALL (QCDR |y|) 1
                                                        (QREFELT $ 69)))
                                        (QCDR #1#)
                                      (|check_union2| (QEQCAR #1# 0)
                                                      (|NonNegativeInteger|)
                                                      (|Union|
                                                       (|NonNegativeInteger|)
                                                       #12#)
                                                      #1#)))
                              (LETT |newIndex| (+ (+ (* |l| |dimb|) |r|) 1))
                              (EXIT
                               (LETT |inds2|
                                     (SPADCALL |inds2| |newIndex|
                                               (QREFELT $ 131)))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |res3|
                               (SPADCALL |res3|
                                         (SPADCALL |mul| |inds2|
                                                   (QREFELT $ 11))
                                         (QREFELT $ 13)))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (LETT |numPoints| (* (QVELT |a| 1) (QVELT |b| 1)))
              (EXIT (VECTOR |vs| |numPoints| |res3|))))) 

(SDEFUN |SIMPC;equalSimplex|
        ((|a| |List| (|NonNegativeInteger|))
         (|b| |List| (|NonNegativeInteger|)) ($ |Boolean|))
        (SPROG
         ((|offset| (|Integer|)) (#1=#:G370 NIL) (#2=#:G371 NIL) (|n| NIL)
          (|fst| (|NonNegativeInteger|)) (|len| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |len| (SPADCALL |a| (QREFELT $ 133)))
                (COND
                 ((SPADCALL |len| (SPADCALL |b| (QREFELT $ 133))
                            (QREFELT $ 134))
                  (PROGN (LETT #1# NIL) (GO #3=#:G369))))
                (COND ((EQL |len| 0) (PROGN (LETT #1# 'T) (GO #3#))))
                (LETT |fst| (|SPADfirst| |a|))
                (LETT |offset| (SPADCALL |fst| |b| (QREFELT $ 135)))
                (COND ((< |offset| 1) (PROGN (LETT #1# NIL) (GO #3#))))
                (SEQ (LETT |n| 1) (LETT #2# (SPADCALL |a| (QREFELT $ 133)))
                     G190 (COND ((|greater_SI| |n| #2#) (GO G191)))
                     (SEQ
                      (COND
                       ((SPADCALL (SPADCALL |a| |n| (QREFELT $ 97))
                                  (SPADCALL |b| |offset| (QREFELT $ 97))
                                  (QREFELT $ 134))
                        (PROGN (LETT #1# NIL) (GO #3#))))
                      (LETT |offset| (+ |offset| 1))
                      (EXIT
                       (COND
                        ((SPADCALL |offset| (SPADCALL |b| (QREFELT $ 133))
                                   (QREFELT $ 64))
                         (LETT |offset| 1)))))
                     (LETT |n| (|inc_SI| |n|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #3# (EXIT #1#)))) 

(SDEFUN |SIMPC;=;2$B;34| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G383 NIL) (#2=#:G387 NIL) (|f| NIL)
          (|x| (|NonNegativeInteger|)) (#3=#:G386 NIL) (|a1| NIL)
          (|flags| (|List| (|Boolean|))) (#4=#:G385 NIL) (#5=#:G384 NIL)
          (|len| (|NonNegativeInteger|)) (|bs| #6=(|List| (|OrientedFacet|)))
          (|as| #6#))
         (SEQ
          (EXIT
           (SEQ (LETT |as| (QVELT |a| 2)) (LETT |bs| (QVELT |b| 2))
                (LETT |len| (LENGTH |as|))
                (COND
                 ((SPADCALL |len| (LENGTH |bs|) (QREFELT $ 134))
                  (PROGN (LETT #1# NIL) (GO #7=#:G382))))
                (LETT |flags|
                      (PROGN
                       (LETT #5# NIL)
                       (SEQ (LETT |x| NIL) (LETT #4# |as|) G190
                            (COND
                             ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL))
                              (GO G191)))
                            (SEQ (EXIT (LETT #5# (CONS NIL #5#))))
                            (LETT #4# (CDR #4#)) (GO G190) G191
                            (EXIT (NREVERSE #5#)))))
                (SEQ (LETT |a1| NIL) (LETT #3# |as|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |a1| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |x| 1)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (COND
                                   ((SPADCALL |a1|
                                              (SPADCALL |bs| |x|
                                                        (QREFELT $ 48))
                                              (QREFELT $ 136))
                                    'T)
                                   ('T
                                    (SPADCALL |flags| |x| (QREFELT $ 138)))))
                                 (GO G191)))
                               (SEQ (LETT |x| (+ |x| 1))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |x| (LENGTH |as|)
                                                 (QREFELT $ 20))
                                       (PROGN (LETT #1# NIL) (GO #7#))))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (EXIT (SPADCALL |flags| |x| 'T (QREFELT $ 139))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |f| NIL) (LETT #2# |flags|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((|BooleanEquality| |f| NIL)
                         (PROGN (LETT #1# NIL) (GO #7#))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #7# (EXIT #1#)))) 

(SDEFUN |SIMPC;coerce;$Of;35| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|res| (|OutputForm|)) (#1=#:G393 NIL) (|a| NIL) (#2=#:G392 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |res|
                  (SPADCALL
                   (LIST (SPADCALL "points 1.." (QREFELT $ 30))
                         (SPADCALL (QVELT |s| 1) (QREFELT $ 40)))
                   (QREFELT $ 141)))
            (COND
             ((NULL (QVELT |s| 2))
              (PROGN
               (LETT #2#
                     (SPADCALL (SPADCALL "empty" (QREFELT $ 30))
                               (QREFELT $ 142)))
               (GO #3=#:G391))))
            (SEQ (LETT |a| NIL) (LETT #1# (QVELT |s| 2)) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |res|
                         (SPADCALL |res| (SPADCALL |a| (QREFELT $ 44))
                                   (QREFELT $ 143)))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #3# (EXIT #2#)))) 

(SDEFUN |SIMPC;coerce;$Dc;36| ((|s| $) ($ |DeltaComplex| VS))
        (SPADCALL |s| (QREFELT $ 104))) 

(DECLAIM (NOTINLINE |FiniteSimplicialComplex;|)) 

(DEFUN |FiniteSimplicialComplex| (#1=#:G395)
  (SPROG NIL
         (PROG (#2=#:G396)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteSimplicialComplex|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FiniteSimplicialComplex;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FiniteSimplicialComplex|)))))))))) 

(DEFUN |FiniteSimplicialComplex;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|FiniteSimplicialComplex| DV$1))
          (LETT $ (GETREFV 148))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FiniteSimplicialComplex|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| VERTSET (|List| |#1|))
                              (|:| NUMPOINTS (|NonNegativeInteger|))
                              (|:| SIMP (|List| (|OrientedFacet|)))))
          $))) 

(MAKEPROP '|FiniteSimplicialComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Integer|)
              (|List| 15) (|OrientedFacet|) (0 . |orientedFacet|) (|List| 10)
              (6 . |concat|) (|List| 6) (|NonNegativeInteger|) (|List| 9)
              |SIMPC;simplicialComplex;LNniL$;1| (12 . |maxIndex|) (|Boolean|)
              (17 . >) |SIMPC;simplicialComplex;LL$;2| (23 . |Zero|)
              |SIMPC;simplicialComplex;L$;3| (|Union| $ '"failed")
              (|DeltaComplex| 6) |SIMPC;simplicialComplexIfCan;DcBU;5|
              |SIMPC;simplicialComplexIfCan;DcU;4| (|String|) (|OutputForm|)
              (27 . |message|) (32 . |coerce|) (37 . |hconcat|) (|Void|)
              (43 . |print|) (|List| 12) (48 . |concat|) (54 . |coerce|)
              (|List| 42) (59 . |coerce|) (64 . |coerce|) (69 . |coerce|)
              (|List| 8) (74 . |orientedFacetSigned|) (79 . |coerce|)
              (84 . |coerce|) (89 . |elt|) (95 . |setelt!|) (102 . |elt|)
              (108 . |orientedFacet|) (|List| $) (114 . |orientedFacetIfCan|)
              (119 . |remove|) (125 . |coerce|) (130 . |getIndexes|) (135 . =)
              (141 . |getMult|) (146 . |setMult!|) (152 . ~=)
              |SIMPC;addSimplex;$Of$;6| |SIMPC;maxIndex;$Nni;7|
              (158 . |minIndex|) |SIMPC;minIndex;$Nni;8| (163 . |order|)
              (168 . >) |SIMPC;grade;$L;9| (174 . |sort|) |SIMPC;sort;2$;10|
              (179 . |concat|) (185 . |subtractIfCan|) (191 . |concat|)
              (197 . |sameFace?|) (203 . |allSubsets|)
              |SIMPC;addImpliedFaces;$L;14| (210 . |boundary|)
              |SIMPC;boundary;2$;15| (215 . |isSubsetOf?|) |SIMPC;star;$Of$;16|
              (221 . |concat|) |SIMPC;link;$Of$;17| (227 . |addVertex|)
              |SIMPC;cone;$Nni$;18| (233 . |refactorIndexes|)
              |SIMPC;refactorIndexes;$Nni$;19| |SIMPC;makeDisjoint;3$;20|
              (239 . |join|) (245 . |concat|) |SIMPC;simplicialJoin;2$B$;21|
              |SIMPC;merge;3$;22|
              (|Record| (|:| |value| 15) (|:| |posX| 15) (|:| |posY| 15))
              (|List| 89) (251 . |member?|) (257 . |concat|)
              (|Record| (|:| |name| 28) (|:| |arrType| 15) (|:| |fromOb| 15)
                        (|:| |toOb| 15) (|:| |xOffset| 8) (|:| |yOffset| 8)
                        (|:| |map| 9))
              (|List| 93) (263 . |member?|) (269 . |concat|) (275 . |elt|)
              (|DirectedGraph| 15) |SIMPC;oneSkeleton;$Dg;25|
              (|GroupPresentation|) |SIMPC;fundamentalGroup;$2BGp;27|
              |SIMPC;fundamentalGroup;$Gp;26| (|FiniteSimplicialComplex| 6)
              (281 . |deltaComplex|) (286 . |fundamentalGroup|)
              (|ChainComplex|) (293 . |chain|) |SIMPC;chain;$Cc;28|
              (|CoChainComplex| 6) (298 . |coChainComplex|)
              |SIMPC;coChain;$Ccc;29| (|List| (|Homology|)) (303 . |homology|)
              |SIMPC;homology;$L;30| (308 . |coHomology|)
              |SIMPC;coHomology;$L;31| (313 . +) (319 . |concat|) (|List| 122)
              (325 . |product|) (331 . |concat|) (|ProductFacet|)
              (337 . |member?|) (343 . |concat|) (349 . |getMaxLeft|)
              (354 . |getMaxRight|) (|Record| (|:| |left| 15) (|:| |right| 15))
              (|List| 127) (359 . |getIndexs|) (364 . |getMult|)
              (369 . |concat|) |SIMPC;product;3$;32| (375 . |#|) (380 . ~=)
              (386 . |position|) (392 . ~=) (|List| 19) (398 . |elt|)
              (404 . |setelt!|) |SIMPC;=;2$B;34| (411 . |hconcat|)
              (416 . |bracket|) (421 . |vconcat|) |SIMPC;coerce;$Of;35|
              |SIMPC;coerce;$Dc;36| (|SingleInteger|) (|HashState|))
           '#(~= 427 |star| 433 |sort| 439 |simplicialJoin| 444
              |simplicialComplexIfCan| 451 |simplicialComplex| 462
              |refactorIndexes| 480 |product| 486 |oneSkeleton| 492 |minIndex|
              497 |merge| 502 |maxIndex| 508 |makeDisjoint| 513 |link| 519
              |latex| 525 |homology| 530 |hashUpdate!| 535 |hash| 541 |grade|
              546 |fundamentalGroup| 551 |cone| 563 |coerce| 569 |coHomology|
              579 |coChain| 584 |chain| 589 |boundary| 594 |addSimplex| 599
              |addImpliedFaces| 605 = 610)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 29))
                        (|makeByteWordVec2| 147
                                            '(2 10 0 8 9 11 2 12 0 0 10 13 1 10
                                              15 0 18 2 15 19 0 0 20 0 6 0 22 1
                                              29 0 28 30 1 25 29 0 31 2 29 0 0
                                              0 32 1 29 33 0 34 2 35 0 0 12 36
                                              1 28 29 0 37 1 38 29 0 39 1 15 29
                                              0 40 1 35 29 0 41 1 10 0 42 43 1
                                              10 29 0 44 1 42 29 0 45 2 35 12 0
                                              8 46 3 35 12 0 8 12 47 2 12 10 0
                                              8 48 2 10 0 8 10 49 1 10 24 50 51
                                              2 12 0 10 0 52 1 12 29 0 53 1 10
                                              9 0 54 2 9 19 0 0 55 1 10 8 0 56
                                              2 10 0 0 8 57 2 8 19 0 0 58 1 10
                                              15 0 61 1 10 15 0 63 2 8 19 0 0
                                              64 1 12 0 0 66 2 38 0 0 42 68 2
                                              15 24 0 0 69 2 38 0 0 0 70 2 10
                                              19 0 0 71 3 10 50 0 15 15 72 1 10
                                              50 0 74 2 10 19 0 0 76 2 12 0 0 0
                                              78 2 10 0 0 15 80 2 10 0 0 15 82
                                              2 10 0 0 0 85 2 14 0 0 0 86 2 90
                                              19 89 0 91 2 90 0 0 89 92 2 94 19
                                              93 0 95 2 94 0 0 93 96 2 9 15 0 8
                                              97 1 25 0 103 104 3 25 100 0 19
                                              19 105 1 25 106 0 107 1 109 0 106
                                              110 1 25 112 0 113 1 25 112 0 115
                                              2 6 0 0 0 117 2 14 0 0 6 118 2 10
                                              119 0 0 120 2 119 0 0 0 121 2 119
                                              19 122 0 123 2 119 0 0 122 124 1
                                              122 15 0 125 1 122 15 0 126 1 122
                                              128 0 129 1 122 8 0 130 2 9 0 0
                                              15 131 1 9 15 0 133 2 15 19 0 0
                                              134 2 9 8 15 0 135 2 10 19 0 0
                                              136 2 137 19 0 8 138 3 137 19 0 8
                                              19 139 1 29 0 50 141 1 29 0 0 142
                                              2 29 0 0 0 143 2 0 19 0 0 1 2 0 0
                                              0 10 77 1 0 0 0 67 3 0 0 0 0 19
                                              87 2 0 24 25 19 26 1 0 24 25 27 2
                                              0 0 14 16 21 1 0 0 14 23 3 0 0 14
                                              15 16 17 2 0 0 0 15 83 2 0 0 0 0
                                              132 1 0 98 0 99 1 0 15 0 62 2 0 0
                                              0 0 88 1 0 15 0 60 2 0 0 0 0 84 2
                                              0 0 0 10 79 1 0 28 0 1 1 0 112 0
                                              114 2 0 147 147 0 1 1 0 146 0 1 1
                                              0 35 0 65 3 0 100 0 19 19 101 1 0
                                              100 0 102 2 0 0 0 15 81 1 0 25 0
                                              145 1 0 29 0 144 1 0 112 0 116 1
                                              0 109 0 111 1 0 106 0 108 1 0 0 0
                                              75 2 0 0 0 10 59 1 0 35 0 73 2 0
                                              19 0 0 140)))))
           '|lookupComplete|)) 
