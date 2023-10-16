
(PUT '|CUBEC;cubicalComplex;LL$;1| '|SPADreplace| 'CONS) 

(SDEFUN |CUBEC;cubicalComplex;LL$;1|
        ((|v| |List| VS) (|fs| |List| (|CubicalFacet|)) ($ $)) (CONS |v| |fs|)) 

(SDEFUN |CUBEC;cubicalComplex;LL$;2|
        ((|v| |List| VS) (|fs| |List| (|List| (|Segment| (|Integer|)))) ($ $))
        (SPROG ((|res| (|List| (|CubicalFacet|))) (#1=#:G120 NIL) (|f| NIL))
               (SEQ (LETT |res| NIL)
                    (SEQ (LETT |f| NIL) (LETT #1# |fs|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL 1 |f| (QREFELT $ 14))
                                           (QREFELT $ 15)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |v| |res| (QREFELT $ 10)))))) 

(SDEFUN |CUBEC;cubicalComplex;LL$;3|
        ((|v| |List| VS) (|fs| |List| (|List| (|List| (|Integer|)))) ($ $))
        (SPROG ((|res| (|List| (|CubicalFacet|))) (#1=#:G124 NIL) (|f| NIL))
               (SEQ (LETT |res| NIL)
                    (SEQ (LETT |f| NIL) (LETT #1# |fs|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL 1 |f| (QREFELT $ 19))
                                           (QREFELT $ 15)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |v| |res| (QREFELT $ 10)))))) 

(SDEFUN |CUBEC;cubicalComplex;L$;4| ((|v| |List| VS) ($ $))
        (SPROG ((|res| (|List| (|CubicalFacet|))))
               (SEQ (LETT |res| NIL) (EXIT (CONS |v| |res|))))) 

(SDEFUN |CUBEC;maxIndex;$Nni;5| ((|s| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|res| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|))
          (|i| (|List| (|Segment| (|Integer|)))) (#1=#:G131 NIL) (|fac| NIL)
          (|facs| (|List| (|CubicalFacet|))))
         (SEQ (LETT |res| 0) (LETT |facs| (QCDR |s|))
              (SEQ (LETT |fac| NIL) (LETT #1# |facs|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |fac| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |i| (SPADCALL |fac| (QREFELT $ 23)))
                        (LETT |m| (LENGTH |i|))
                        (EXIT
                         (COND
                          ((SPADCALL |m| |res| (QREFELT $ 26))
                           (LETT |res| |m|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CUBEC;addCube;$Cf$;6| ((|a| $) (|f| |CubicalFacet|) ($ $))
        (SPROG
         ((|res2| (|List| (|CubicalFacet|))) (|found| (|Boolean|))
          (|m| (|Integer|)) (#1=#:G139 NIL) (|orf| NIL)
          (|res| (|List| (|CubicalFacet|))))
         (SEQ (LETT |res| (QCDR |a|)) (LETT |res2| NIL) (LETT |found| NIL)
              (SEQ (LETT |orf| NIL) (LETT #1# |res|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |orf| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |orf| (QREFELT $ 23))
                                 (SPADCALL |f| (QREFELT $ 23)) (QREFELT $ 28))
                       (SEQ
                        (LETT |m|
                              (+ (SPADCALL |orf| (QREFELT $ 29))
                                 (SPADCALL |f| (QREFELT $ 29))))
                        (COND
                         ((SPADCALL |m| 0 (QREFELT $ 31))
                          (LETT |res2|
                                (SPADCALL |res2|
                                          (SPADCALL |orf| |m| (QREFELT $ 32))
                                          (QREFELT $ 15)))))
                        (EXIT (LETT |found| 'T))))
                      ('T
                       (LETT |res2| (SPADCALL |res2| |orf| (QREFELT $ 15)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL |found|)
                (LETT |res2| (SPADCALL |res2| |f| (QREFELT $ 15)))))
              (EXIT (SPADCALL (QCAR |a|) |res2| (QREFELT $ 10)))))) 

(SDEFUN |CUBEC;boundary;2$;7| ((|s| $) ($ $))
        (SPROG
         ((|res| ($)) (#1=#:G146 NIL) (|y| NIL) (|x| (|List| (|CubicalFacet|)))
          (#2=#:G145 NIL) (|facet| NIL))
         (SEQ (LETT |res| (SPADCALL (QCAR |s|) (QREFELT $ 22)))
              (SEQ (LETT |facet| NIL) (LETT #2# (QCDR |s|)) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |facet| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |x| (SPADCALL |facet| (QREFELT $ 35)))
                        (EXIT
                         (SEQ (LETT |y| NIL) (LETT #1# |x|) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |y| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |res|
                                      (SPADCALL |res| |y| (QREFELT $ 33)))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CUBEC;grade;$L;8| ((|s| $) ($ |List| (|List| (|CubicalFacet|))))
        (SPROG
         ((|gr| (|Integer|)) (#1=#:G157 NIL) (|face| NIL)
          (|res| (|List| (|List| (|CubicalFacet|)))) (#2=#:G156 NIL) (|a| NIL)
          (#3=#:G154 NIL) (|maxGrade| (|NonNegativeInteger|)) (#4=#:G155 NIL)
          (|simp| (|List| (|CubicalFacet|))))
         (SEQ
          (EXIT
           (SEQ (LETT |simp| (QCDR |s|)) (LETT |maxGrade| 0)
                (SEQ (LETT |face| NIL) (LETT #4# |simp|) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |face| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |face| (QREFELT $ 37)) |maxGrade|
                                   (QREFELT $ 26))
                         (LETT |maxGrade| (SPADCALL |face| (QREFELT $ 37)))))))
                     (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                (LETT |res| NIL)
                (COND
                 ((< |maxGrade| 0) (PROGN (LETT #3# |res|) (GO #5=#:G153))))
                (SEQ (LETT |a| 0) (LETT #2# |maxGrade|) G190
                     (COND ((|greater_SI| |a| #2#) (GO G191)))
                     (SEQ
                      (EXIT (LETT |res| (SPADCALL |res| NIL (QREFELT $ 39)))))
                     (LETT |a| (|inc_SI| |a|)) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |face| NIL) (LETT #1# |simp|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |face| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |gr| (+ (SPADCALL |face| (QREFELT $ 37)) 1))
                          (EXIT
                           (COND
                            ((SPADCALL |gr| 0 (QREFELT $ 40))
                             (SPADCALL |res| |gr|
                                       (SPADCALL
                                        (SPADCALL |res| |gr| (QREFELT $ 41))
                                        |face| (QREFELT $ 15))
                                       (QREFELT $ 42))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #5# (EXIT #3#)))) 

(SDEFUN |CUBEC;isNewFace?|
        ((|lst| |List| (|CubicalFacet|)) (|b| |CubicalFacet|) ($ |Boolean|))
        (SPROG ((#1=#:G162 NIL) (#2=#:G163 NIL) (|a| NIL))
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
                          ((SPADCALL |a| |b| (QREFELT $ 44))
                           (PROGN (LETT #1# NIL) (GO #3=#:G161))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |CUBEC;listUnion|
        ((|a| |List| (|CubicalFacet|)) (|b| |List| (|CubicalFacet|))
         ($ |List| (|CubicalFacet|)))
        (SPROG
         ((|res| (|List| (|CubicalFacet|))) (#1=#:G170 NIL) (|b1| NIL)
          (#2=#:G169 NIL) (|a1| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |a1| NIL) (LETT #2# |a|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |a1| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT (LETT |res| (SPADCALL |res| |a1| (QREFELT $ 15)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |b1| NIL) (LETT #1# |b|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |b1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((|CUBEC;isNewFace?| |a| |b1| $)
                       (LETT |res| (SPADCALL |res| |b1| (QREFELT $ 15)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CUBEC;addImpliedFaces;$L;11|
        ((|s| $) ($ |List| (|List| (|CubicalFacet|))))
        (SPROG
         ((|newFaces| (|List| (|CubicalFacet|))) (|len| (|NonNegativeInteger|))
          (#1=#:G187 NIL) (|face| NIL) (#2=#:G186 NIL) (#3=#:G185 NIL)
          (#4=#:G183 NIL) (|gr| NIL) (#5=#:G184 NIL) (|grn| NIL)
          (|res| (|List| (|List| (|CubicalFacet|)))) (#6=#:G182 NIL) (|a| NIL)
          (#7=#:G181 NIL) (|maxGrade| (|NonNegativeInteger|))
          (|inputList| (|List| (|List| (|CubicalFacet|)))))
         (SEQ
          (EXIT
           (SEQ (LETT |inputList| (REVERSE (SPADCALL |s| (QREFELT $ 43))))
                (LETT |res| NIL) (LETT |maxGrade| (LENGTH |inputList|))
                (COND
                 ((< |maxGrade| 1) (PROGN (LETT #7# |res|) (GO #8=#:G180))))
                (SEQ (LETT |a| 1) (LETT #6# |maxGrade|) G190
                     (COND ((|greater_SI| |a| #6#) (GO G191)))
                     (SEQ
                      (EXIT (LETT |res| (SPADCALL |res| NIL (QREFELT $ 39)))))
                     (LETT |a| (|inc_SI| |a|)) (GO G190) G191 (EXIT NIL))
                (LETT |newFaces| NIL)
                (SEQ (LETT |grn| 1) (LETT #5# |maxGrade|) (LETT |gr| NIL)
                     (LETT #4# |inputList|) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |gr| (CAR #4#)) NIL)
                           (|greater_SI| |grn| #5#))
                       (GO G191)))
                     (SEQ
                      (SEQ (LETT |face| NIL) (LETT #3# |gr|) G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN (LETT |face| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |res| |grn|
                                       (SPADCALL
                                        (SPADCALL |res| |grn| (QREFELT $ 41))
                                        |face| (QREFELT $ 15))
                                       (QREFELT $ 42))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                      (SEQ (LETT |face| NIL) (LETT #2# |newFaces|) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |face| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |res| |grn|
                                       (SPADCALL
                                        (SPADCALL |res| |grn| (QREFELT $ 41))
                                        |face| (QREFELT $ 15))
                                       (QREFELT $ 42))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (LETT |newFaces| NIL)
                      (EXIT
                       (SEQ (LETT |face| NIL)
                            (LETT #1# (SPADCALL |res| |grn| (QREFELT $ 41)))
                            G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |face| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |len|
                                   (- (SPADCALL |face| (QREFELT $ 37)) 1))
                             (EXIT
                              (COND
                               ((SPADCALL |len| -1 (QREFELT $ 40))
                                (LETT |newFaces|
                                      (|CUBEC;listUnion| |newFaces|
                                       (SPADCALL |face| |len| |len|
                                                 (QREFELT $ 45))
                                       $))))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                     (LETT #4# (PROG1 (CDR #4#) (LETT |grn| (|inc_SI| |grn|))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT (REVERSE |res|))))
          #8# (EXIT #7#)))) 

(SDEFUN |CUBEC;product;3$;12| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|res| (|List| (|CubicalFacet|))) (|p| (|CubicalFacet|))
          (#1=#:G199 NIL) (|cubeb| NIL) (#2=#:G198 NIL) (|cubea| NIL)
          (|vs| (|List| VS)) (|pp| (VS)) (#3=#:G197 NIL) (|pb| NIL)
          (#4=#:G196 NIL) (|pa| NIL) (|cubesb| #5=(|List| (|CubicalFacet|)))
          (|cubesa| #5#))
         (SEQ (LETT |cubesa| (QCDR |a|)) (LETT |cubesb| (QCDR |b|))
              (LETT |vs| NIL)
              (SEQ (LETT |pa| NIL) (LETT #4# (QCAR |a|)) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |pa| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |pb| NIL) (LETT #3# (QCAR |b|)) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |pb| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ (LETT |pp| (SPADCALL |pa| |pb| (QREFELT $ 47)))
                               (EXIT
                                (LETT |vs|
                                      (SPADCALL |vs| |pp| (QREFELT $ 48)))))
                          (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (LETT |res| NIL)
              (SEQ (LETT |cubea| NIL) (LETT #2# |cubesa|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |cubea| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |cubeb| NIL) (LETT #1# |cubesb|) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |cubeb| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |p| (SPADCALL |cubea| |cubeb| (QREFELT $ 49)))
                           (EXIT
                            (LETT |res| (SPADCALL |res| |p| (QREFELT $ 15)))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |vs| |res| (QREFELT $ 10)))))) 

(SDEFUN |CUBEC;fundamentalGroup;$Gp;13| ((|s| $) ($ |GroupPresentation|))
        (SPADCALL |s| 'T NIL (QREFELT $ 52))) 

(SDEFUN |CUBEC;fundamentalGroup;$2BGp;14|
        ((|s| $) (|simplify| |Boolean|) (|trace| |Boolean|)
         ($ |GroupPresentation|))
        (SPROG ((|dc| (|DeltaComplex| VS)))
               (SEQ (LETT |dc| (SPADCALL |s| (QREFELT $ 56)))
                    (EXIT (SPADCALL |dc| |simplify| |trace| (QREFELT $ 57)))))) 

(SDEFUN |CUBEC;homology;$L;15| ((|s| $) ($ |List| (|Homology|)))
        (SPROG ((|dc| (|DeltaComplex| VS)))
               (SEQ (LETT |dc| (SPADCALL |s| (QREFELT $ 56)))
                    (EXIT (SPADCALL |dc| (QREFELT $ 59)))))) 

(SDEFUN |CUBEC;chain;$Cc;16| ((|s| $) ($ |ChainComplex|))
        (SPROG ((|cc| (|ChainComplex|)) (|dc| (|DeltaComplex| VS)))
               (SEQ (LETT |dc| (SPADCALL |s| (QREFELT $ 56)))
                    (LETT |cc| (SPADCALL |dc| (QREFELT $ 62))) (EXIT |cc|)))) 

(SDEFUN |CUBEC;=;2$B;17| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G218 NIL) (#2=#:G222 NIL) (|f| NIL)
          (|x| (|NonNegativeInteger|)) (#3=#:G221 NIL) (|a1| NIL)
          (|flags| (|List| (|Boolean|))) (#4=#:G220 NIL) (#5=#:G219 NIL)
          (|len| (|NonNegativeInteger|)) (|bs| #6=(|List| (|CubicalFacet|)))
          (|as| #6#))
         (SEQ
          (EXIT
           (SEQ (LETT |as| (QCDR |a|)) (LETT |bs| (QCDR |b|))
                (LETT |len| (LENGTH |as|))
                (COND
                 ((SPADCALL |len| (LENGTH |bs|) (QREFELT $ 64))
                  (PROGN (LETT #1# NIL) (GO #7=#:G217))))
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
                                                        (QREFELT $ 65))
                                              (QREFELT $ 66))
                                    'T)
                                   ('T (SPADCALL |flags| |x| (QREFELT $ 68)))))
                                 (GO G191)))
                               (SEQ (LETT |x| (+ |x| 1))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |x| (LENGTH |as|)
                                                 (QREFELT $ 26))
                                       (PROGN (LETT #1# NIL) (GO #7#))))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (EXIT (SPADCALL |flags| |x| 'T (QREFELT $ 69))))
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

(SDEFUN |CUBEC;coerce;$Of;18| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|res| (|OutputForm|)) (#1=#:G228 NIL) (|a| NIL) (#2=#:G227 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |res| (SPADCALL (QREFELT $ 72)))
                (COND
                 ((NULL (QCDR |s|))
                  (PROGN
                   (LETT #2#
                         (SPADCALL (SPADCALL "empty" (QREFELT $ 74))
                                   (QREFELT $ 75)))
                   (GO #3=#:G226))))
                (SEQ (LETT |a| NIL) (LETT #1# (QCDR |s|)) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |res|
                             (SPADCALL |res| (SPADCALL |a| (QREFELT $ 76))
                                       (QREFELT $ 77)))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #3# (EXIT #2#)))) 

(SDEFUN |CUBEC;coerce;$Dc;19| ((|s| $) ($ |DeltaComplex| VS))
        (SPADCALL |s| (QREFELT $ 56))) 

(DECLAIM (NOTINLINE |FiniteCubicalComplex;|)) 

(DEFUN |FiniteCubicalComplex| (#1=#:G230)
  (SPROG NIL
         (PROG (#2=#:G231)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteCubicalComplex|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FiniteCubicalComplex;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FiniteCubicalComplex|)))))))))) 

(DEFUN |FiniteCubicalComplex;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|FiniteCubicalComplex| DV$1))
          (LETT $ (GETREFV 82))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FiniteCubicalComplex| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| VERTSET (|List| |#1|))
                              (|:| CUBE (|List| (|CubicalFacet|)))))
          $))) 

(MAKEPROP '|FiniteCubicalComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              (|List| 13) |CUBEC;cubicalComplex;LL$;1| (|Integer|)
              (|List| (|Segment| 11)) (|CubicalFacet|) (0 . |cubicalFacet|)
              (6 . |concat|) (|List| 12) |CUBEC;cubicalComplex;LL$;2|
              (|List| (|List| 11)) (12 . |cubicalFacet|) (|List| 18)
              |CUBEC;cubicalComplex;LL$;3| |CUBEC;cubicalComplex;L$;4|
              (18 . |getIntervals|) (|Boolean|) (|NonNegativeInteger|) (23 . >)
              |CUBEC;maxIndex;$Nni;5| (29 . =) (35 . |getMult|) (40 . |Zero|)
              (44 . ~=) (50 . |setMult|) |CUBEC;addCube;$Cf$;6| (|List| $)
              (56 . |boundary|) |CUBEC;boundary;2$;7| (61 . |order|) (|List| 9)
              (66 . |concat|) (72 . >) (78 . |elt|) (84 . |setelt!|)
              |CUBEC;grade;$L;8| (91 . |sameFace?|) (97 . |allSubsets|)
              |CUBEC;addImpliedFaces;$L;11| (104 . +) (110 . |concat|)
              (116 . |product|) |CUBEC;product;3$;12| (|GroupPresentation|)
              |CUBEC;fundamentalGroup;$2BGp;14| |CUBEC;fundamentalGroup;$Gp;13|
              (|FiniteCubicalComplex| 6) (|DeltaComplex| 6)
              (122 . |deltaComplex|) (127 . |fundamentalGroup|)
              (|List| (|Homology|)) (134 . |homology|) |CUBEC;homology;$L;15|
              (|ChainComplex|) (139 . |chain|) |CUBEC;chain;$Cc;16| (144 . ~=)
              (150 . |elt|) (156 . ~=) (|List| 24) (162 . |elt|)
              (168 . |setelt!|) |CUBEC;=;2$B;17| (|OutputForm|) (175 . |empty|)
              (|String|) (179 . |message|) (184 . |bracket|) (189 . |coerce|)
              (194 . |vconcat|) |CUBEC;coerce;$Of;18| |CUBEC;coerce;$Dc;19|
              (|SingleInteger|) (|HashState|))
           '#(~= 200 |product| 206 |maxIndex| 212 |latex| 217 |homology| 222
              |hashUpdate!| 227 |hash| 233 |grade| 238 |fundamentalGroup| 243
              |cubicalComplex| 255 |coerce| 278 |chain| 288 |boundary| 293
              |addImpliedFaces| 298 |addCube| 303 = 309)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 71))
                        (|makeByteWordVec2| 81
                                            '(2 13 0 11 12 14 2 9 0 0 13 15 2
                                              13 0 11 18 19 1 13 12 0 23 2 25
                                              24 0 0 26 2 12 24 0 0 28 1 13 11
                                              0 29 0 6 0 30 2 11 24 0 0 31 2 13
                                              0 0 11 32 1 13 34 0 35 1 13 25 0
                                              37 2 38 0 0 9 39 2 11 24 0 0 40 2
                                              38 9 0 11 41 3 38 9 0 11 9 42 2
                                              13 24 0 0 44 3 13 34 0 25 25 45 2
                                              6 0 0 0 47 2 8 0 0 6 48 2 13 0 0
                                              0 49 1 55 0 54 56 3 55 51 0 24 24
                                              57 1 55 58 0 59 1 55 61 0 62 2 25
                                              24 0 0 64 2 9 13 0 11 65 2 13 24
                                              0 0 66 2 67 24 0 11 68 3 67 24 0
                                              11 24 69 0 71 0 72 1 71 0 73 74 1
                                              71 0 0 75 1 13 71 0 76 2 71 0 0 0
                                              77 2 0 24 0 0 1 2 0 0 0 0 50 1 0
                                              25 0 27 1 0 73 0 1 1 0 58 0 60 2
                                              0 81 81 0 1 1 0 80 0 1 1 0 38 0
                                              43 3 0 51 0 24 24 52 1 0 51 0 53
                                              1 0 0 8 22 2 0 0 8 20 21 2 0 0 8
                                              9 10 2 0 0 8 16 17 1 0 55 0 79 1
                                              0 71 0 78 1 0 61 0 63 1 0 0 0 36
                                              1 0 38 0 46 2 0 0 0 13 33 2 0 24
                                              0 0 70)))))
           '|lookupComplete|)) 
