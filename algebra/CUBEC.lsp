
(PUT '|CUBEC;cubicalComplex;VSL$;1| '|SPADreplace| 'CONS) 

(SDEFUN |CUBEC;cubicalComplex;VSL$;1|
        ((|v| VS) (|fs| |List| (|CubicalFacet|)) ($ $)) (CONS |v| |fs|)) 

(SDEFUN |CUBEC;cubicalComplex;VSL$;2|
        ((|v| VS) (|fs| |List| (|List| (|Segment| (|Integer|)))) ($ $))
        (SPROG ((|res| (|List| (|CubicalFacet|))) (#1=#:G120 NIL) (|f| NIL))
               (SEQ (LETT |res| NIL . #2=(|CUBEC;cubicalComplex;VSL$;2|))
                    (SEQ (LETT |f| NIL . #2#) (LETT #1# |fs| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL 1 |f| (QREFELT $ 13))
                                           (QREFELT $ 14))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |v| |res| (QREFELT $ 9)))))) 

(SDEFUN |CUBEC;cubicalComplex;VSL$;3|
        ((|v| VS) (|fs| |List| (|List| (|List| (|Integer|)))) ($ $))
        (SPROG ((|res| (|List| (|CubicalFacet|))) (#1=#:G124 NIL) (|f| NIL))
               (SEQ (LETT |res| NIL . #2=(|CUBEC;cubicalComplex;VSL$;3|))
                    (SEQ (LETT |f| NIL . #2#) (LETT #1# |fs| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL 1 |f| (QREFELT $ 18))
                                           (QREFELT $ 14))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |v| |res| (QREFELT $ 9)))))) 

(SDEFUN |CUBEC;cubicalComplex;VS$;4| ((|v| VS) ($ $))
        (SPROG ((|res| (|List| (|CubicalFacet|))))
               (SEQ (LETT |res| NIL |CUBEC;cubicalComplex;VS$;4|)
                    (EXIT (CONS |v| |res|))))) 

(SDEFUN |CUBEC;addCube;$Cf$;5| ((|a| $) (|f| |CubicalFacet|) ($ $))
        (SPROG
         ((|res2| (|List| (|CubicalFacet|))) (|found| (|Boolean|))
          (|m| (|Integer|)) (#1=#:G134 NIL) (|orf| NIL)
          (|res| (|List| (|CubicalFacet|))))
         (SEQ (LETT |res| (QCDR |a|) . #2=(|CUBEC;addCube;$Cf$;5|))
              (LETT |res2| NIL . #2#) (LETT |found| NIL . #2#)
              (SEQ (LETT |orf| NIL . #2#) (LETT #1# |res| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |orf| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |orf| (QREFELT $ 22))
                                 (SPADCALL |f| (QREFELT $ 22)) (QREFELT $ 24))
                       (SEQ
                        (LETT |m|
                              (+ (SPADCALL |orf| (QREFELT $ 25))
                                 (SPADCALL |f| (QREFELT $ 25)))
                              . #2#)
                        (COND
                         ((SPADCALL |m| 0 (QREFELT $ 26))
                          (LETT |res2|
                                (SPADCALL |res2|
                                          (SPADCALL |orf| |m| (QREFELT $ 27))
                                          (QREFELT $ 14))
                                . #2#)))
                        (EXIT (LETT |found| 'T . #2#))))
                      ('T
                       (LETT |res2| (SPADCALL |res2| |orf| (QREFELT $ 14))
                             . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL |found|)
                (LETT |res2| (SPADCALL |res2| |f| (QREFELT $ 14)) . #2#)))
              (EXIT (SPADCALL (QCAR |a|) |res2| (QREFELT $ 9)))))) 

(SDEFUN |CUBEC;delta;2$;6| ((|s| $) ($ $))
        (SPROG
         ((|res| ($)) (#1=#:G141 NIL) (|y| NIL) (|x| (|List| (|CubicalFacet|)))
          (#2=#:G140 NIL) (|facet| NIL))
         (SEQ
          (LETT |res| (SPADCALL (QCAR |s|) (QREFELT $ 21))
                . #3=(|CUBEC;delta;2$;6|))
          (SEQ (LETT |facet| NIL . #3#) (LETT #2# (QCDR |s|) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |facet| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |x| (SPADCALL |facet| (QREFELT $ 30)) . #3#)
                    (EXIT
                     (SEQ (LETT |y| NIL . #3#) (LETT #1# |x| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |y| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |res| (SPADCALL |res| |y| (QREFELT $ 28))
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |CUBEC;grade;$L;7| ((|s| $) ($ |List| (|List| (|CubicalFacet|))))
        (SPROG
         ((|gr| (|Integer|)) (#1=#:G152 NIL) (|face| NIL)
          (|res| (|List| (|List| (|CubicalFacet|)))) (#2=#:G151 NIL) (|a| NIL)
          (#3=#:G149 NIL) (|maxGrade| (|NonNegativeInteger|)) (#4=#:G150 NIL)
          (|simp| (|List| (|CubicalFacet|))))
         (SEQ
          (EXIT
           (SEQ (LETT |simp| (QCDR |s|) . #5=(|CUBEC;grade;$L;7|))
                (LETT |maxGrade| 0 . #5#)
                (SEQ (LETT |face| NIL . #5#) (LETT #4# |simp| . #5#) G190
                     (COND
                      ((OR (ATOM #4#)
                           (PROGN (LETT |face| (CAR #4#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |face| (QREFELT $ 33)) |maxGrade|
                                   (QREFELT $ 34))
                         (LETT |maxGrade| (SPADCALL |face| (QREFELT $ 33))
                               . #5#)))))
                     (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                (LETT |res| NIL . #5#)
                (COND
                 ((< |maxGrade| 0)
                  (PROGN (LETT #3# |res| . #5#) (GO #6=#:G148))))
                (SEQ (LETT |a| 0 . #5#) (LETT #2# |maxGrade| . #5#) G190
                     (COND ((|greater_SI| |a| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |res| (SPADCALL |res| NIL (QREFELT $ 36)) . #5#)))
                     (LETT |a| (|inc_SI| |a|) . #5#) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |face| NIL . #5#) (LETT #1# |simp| . #5#) G190
                     (COND
                      ((OR (ATOM #1#)
                           (PROGN (LETT |face| (CAR #1#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |gr| (+ (SPADCALL |face| (QREFELT $ 33)) 1) . #5#)
                      (EXIT
                       (COND
                        ((SPADCALL |gr| 0 (QREFELT $ 37))
                         (SPADCALL |res| |gr|
                                   (SPADCALL
                                    (SPADCALL |res| |gr| (QREFELT $ 38)) |face|
                                    (QREFELT $ 14))
                                   (QREFELT $ 39))))))
                     (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #6# (EXIT #3#)))) 

(SDEFUN |CUBEC;isNewFace?|
        ((|lst| |List| (|CubicalFacet|)) (|b| |CubicalFacet|) ($ |Boolean|))
        (SPROG ((#1=#:G157 NIL) (#2=#:G158 NIL) (|a| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |a| NIL . #3=(|CUBEC;isNewFace?|))
                       (LETT #2# |lst| . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |a| |b| (QREFELT $ 41))
                           (PROGN (LETT #1# NIL . #3#) (GO #4=#:G156))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #4# (EXIT #1#)))) 

(SDEFUN |CUBEC;listUnion|
        ((|a| |List| (|CubicalFacet|)) (|b| |List| (|CubicalFacet|))
         ($ |List| (|CubicalFacet|)))
        (SPROG
         ((|res| (|List| (|CubicalFacet|))) (#1=#:G165 NIL) (|b1| NIL)
          (#2=#:G164 NIL) (|a1| NIL))
         (SEQ (LETT |res| NIL . #3=(|CUBEC;listUnion|))
              (SEQ (LETT |a1| NIL . #3#) (LETT #2# |a| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |a1| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res| (SPADCALL |res| |a1| (QREFELT $ 14)) . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |b1| NIL . #3#) (LETT #1# |b| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |b1| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((|CUBEC;isNewFace?| |a| |b1| $)
                       (LETT |res| (SPADCALL |res| |b1| (QREFELT $ 14))
                             . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CUBEC;addImpliedFaces;$L;10|
        ((|s| $) ($ |List| (|List| (|CubicalFacet|))))
        (SPROG
         ((|newFaces| (|List| (|CubicalFacet|))) (|len| (|NonNegativeInteger|))
          (#1=#:G182 NIL) (|face| NIL) (#2=#:G181 NIL) (#3=#:G180 NIL)
          (#4=#:G178 NIL) (|gr| NIL) (#5=#:G179 NIL) (|grn| NIL)
          (|res| (|List| (|List| (|CubicalFacet|)))) (#6=#:G177 NIL) (|a| NIL)
          (#7=#:G176 NIL) (|maxGrade| (|NonNegativeInteger|))
          (|inputList| (|List| (|List| (|CubicalFacet|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |inputList| (REVERSE (SPADCALL |s| (QREFELT $ 40)))
                  . #8=(|CUBEC;addImpliedFaces;$L;10|))
            (LETT |res| NIL . #8#) (LETT |maxGrade| (LENGTH |inputList|) . #8#)
            (COND
             ((< |maxGrade| 1) (PROGN (LETT #7# |res| . #8#) (GO #9=#:G175))))
            (SEQ (LETT |a| 1 . #8#) (LETT #6# |maxGrade| . #8#) G190
                 (COND ((|greater_SI| |a| #6#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |res| (SPADCALL |res| NIL (QREFELT $ 36)) . #8#)))
                 (LETT |a| (|inc_SI| |a|) . #8#) (GO G190) G191 (EXIT NIL))
            (LETT |newFaces| NIL . #8#)
            (SEQ (LETT |grn| 1 . #8#) (LETT #5# |maxGrade| . #8#)
                 (LETT |gr| NIL . #8#) (LETT #4# |inputList| . #8#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |gr| (CAR #4#) . #8#) NIL)
                       (|greater_SI| |grn| #5#))
                   (GO G191)))
                 (SEQ
                  (SEQ (LETT |face| NIL . #8#) (LETT #3# |gr| . #8#) G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |face| (CAR #3#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |grn|
                                   (SPADCALL
                                    (SPADCALL |res| |grn| (QREFELT $ 38))
                                    |face| (QREFELT $ 14))
                                   (QREFELT $ 39))))
                       (LETT #3# (CDR #3#) . #8#) (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |face| NIL . #8#) (LETT #2# |newFaces| . #8#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |face| (CAR #2#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |grn|
                                   (SPADCALL
                                    (SPADCALL |res| |grn| (QREFELT $ 38))
                                    |face| (QREFELT $ 14))
                                   (QREFELT $ 39))))
                       (LETT #2# (CDR #2#) . #8#) (GO G190) G191 (EXIT NIL))
                  (LETT |newFaces| NIL . #8#)
                  (EXIT
                   (SEQ (LETT |face| NIL . #8#)
                        (LETT #1# (SPADCALL |res| |grn| (QREFELT $ 38)) . #8#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |face| (CAR #1#) . #8#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |len| (- (SPADCALL |face| (QREFELT $ 33)) 1)
                               . #8#)
                         (EXIT
                          (COND
                           ((SPADCALL |len| -1 (QREFELT $ 37))
                            (LETT |newFaces|
                                  (|CUBEC;listUnion| |newFaces|
                                   (SPADCALL |face| |len| |len| (QREFELT $ 42))
                                   $)
                                  . #8#)))))
                        (LETT #1# (CDR #1#) . #8#) (GO G190) G191 (EXIT NIL))))
                 (LETT #4#
                       (PROG1 (CDR #4#) (LETT |grn| (|inc_SI| |grn|) . #8#))
                       . #8#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT (REVERSE |res|))))
          #9# (EXIT #7#)))) 

(SDEFUN |CUBEC;product;3$;11| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|res| (|List| (|CubicalFacet|))) (|p| (|CubicalFacet|))
          (#1=#:G189 NIL) (|cubeb| NIL) (#2=#:G188 NIL) (|cubea| NIL)
          (|vs| (VS)) (|cubesb| #3=(|List| (|CubicalFacet|))) (|cubesa| #3#))
         (SEQ (LETT |cubesa| (QCDR |a|) . #4=(|CUBEC;product;3$;11|))
              (LETT |cubesb| (QCDR |b|) . #4#)
              (LETT |vs| (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 44)) . #4#)
              (LETT |res| NIL . #4#)
              (SEQ (LETT |cubea| NIL . #4#) (LETT #2# |cubesa| . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |cubea| (CAR #2#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |cubeb| NIL . #4#) (LETT #1# |cubesb| . #4#)
                          G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |cubeb| (CAR #1#) . #4#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |p| (SPADCALL |cubea| |cubeb| (QREFELT $ 45))
                                 . #4#)
                           (EXIT
                            (LETT |res| (SPADCALL |res| |p| (QREFELT $ 14))
                                  . #4#)))
                          (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |vs| |res| (QREFELT $ 9)))))) 

(SDEFUN |CUBEC;fundamentalGroup;$Gp;12| ((|s| $) ($ |GroupPresentation|))
        (SPADCALL |s| 'T NIL (QREFELT $ 48))) 

(SDEFUN |CUBEC;fundamentalGroup;$2BGp;13|
        ((|s| $) (|simplify| |Boolean|) (|trace| |Boolean|)
         ($ |GroupPresentation|))
        (SPROG ((|dc| (|DeltaComplex| VS)))
               (SEQ
                (LETT |dc| (SPADCALL |s| (QREFELT $ 52))
                      |CUBEC;fundamentalGroup;$2BGp;13|)
                (EXIT (SPADCALL |dc| |simplify| |trace| (QREFELT $ 53)))))) 

(SDEFUN |CUBEC;homology;$L;14| ((|s| $) ($ |List| (|Homology|)))
        (SPROG ((|dc| (|DeltaComplex| VS)))
               (SEQ
                (LETT |dc| (SPADCALL |s| (QREFELT $ 52))
                      |CUBEC;homology;$L;14|)
                (EXIT (SPADCALL |dc| (QREFELT $ 55)))))) 

(SDEFUN |CUBEC;chain;$Cc;15| ((|s| $) ($ |ChainComplex|))
        (SPROG ((|cc| (|ChainComplex|)) (|dc| (|DeltaComplex| VS)))
               (SEQ
                (LETT |dc| (SPADCALL |s| (QREFELT $ 52))
                      . #1=(|CUBEC;chain;$Cc;15|))
                (LETT |cc| (SPADCALL |dc| (QREFELT $ 58)) . #1#) (EXIT |cc|)))) 

(SDEFUN |CUBEC;=;2$B;16| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G208 NIL) (#2=#:G212 NIL) (|f| NIL)
          (|x| (|NonNegativeInteger|)) (#3=#:G211 NIL) (|a1| NIL)
          (|flags| (|List| (|Boolean|))) (#4=#:G210 NIL) (#5=#:G209 NIL)
          (|len| (|NonNegativeInteger|)) (|bs| #6=(|List| (|CubicalFacet|)))
          (|as| #6#))
         (SEQ
          (EXIT
           (SEQ (LETT |as| (QCDR |a|) . #7=(|CUBEC;=;2$B;16|))
                (LETT |bs| (QCDR |b|) . #7#) (LETT |len| (LENGTH |as|) . #7#)
                (COND
                 ((SPADCALL |len| (LENGTH |bs|) (QREFELT $ 60))
                  (PROGN (LETT #1# NIL . #7#) (GO #8=#:G207))))
                (LETT |flags|
                      (PROGN
                       (LETT #5# NIL . #7#)
                       (SEQ (LETT |x| NIL . #7#) (LETT #4# |as| . #7#) G190
                            (COND
                             ((OR (ATOM #4#)
                                  (PROGN (LETT |x| (CAR #4#) . #7#) NIL))
                              (GO G191)))
                            (SEQ (EXIT (LETT #5# (CONS NIL #5#) . #7#)))
                            (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                            (EXIT (NREVERSE #5#))))
                      . #7#)
                (SEQ (LETT |a1| NIL . #7#) (LETT #3# |as| . #7#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |a1| (CAR #3#) . #7#) NIL))
                       (GO G191)))
                     (SEQ (LETT |x| 1 . #7#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (COND
                                   ((SPADCALL |a1|
                                              (SPADCALL |bs| |x|
                                                        (QREFELT $ 61))
                                              (QREFELT $ 62))
                                    'T)
                                   ('T (SPADCALL |flags| |x| (QREFELT $ 64)))))
                                 (GO G191)))
                               (SEQ (LETT |x| (+ |x| 1) . #7#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |x| (LENGTH |as|)
                                                 (QREFELT $ 34))
                                       (PROGN
                                        (LETT #1# NIL . #7#)
                                        (GO #8#))))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (EXIT (SPADCALL |flags| |x| 'T (QREFELT $ 65))))
                     (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |f| NIL . #7#) (LETT #2# |flags| . #7#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #7#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((|BooleanEquality| |f| NIL)
                         (PROGN (LETT #1# NIL . #7#) (GO #8#))))))
                     (LETT #2# (CDR #2#) . #7#) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #8# (EXIT #1#)))) 

(SDEFUN |CUBEC;coerce;$Of;17| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|res| (|OutputForm|)) (#1=#:G218 NIL) (|a| NIL) (#2=#:G217 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |res| (SPADCALL (QREFELT $ 68)) . #3=(|CUBEC;coerce;$Of;17|))
            (COND
             ((NULL (QCDR |s|))
              (PROGN
               (LETT #2#
                     (SPADCALL (SPADCALL "empty" (QREFELT $ 70))
                               (QREFELT $ 71))
                     . #3#)
               (GO #4=#:G216))))
            (SEQ (LETT |a| NIL . #3#) (LETT #1# (QCDR |s|) . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |res|
                         (SPADCALL |res| (SPADCALL |a| (QREFELT $ 72))
                                   (QREFELT $ 73))
                         . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #4# (EXIT #2#)))) 

(SDEFUN |CUBEC;coerce;$Dc;18| ((|s| $) ($ |DeltaComplex| VS))
        (SPADCALL |s| (QREFELT $ 52))) 

(DECLAIM (NOTINLINE |FiniteCubicalComplex;|)) 

(DEFUN |FiniteCubicalComplex| (#1=#:G220)
  (SPROG NIL
         (PROG (#2=#:G221)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteCubicalComplex|)
                                               '|domainEqualList|)
                    . #3=(|FiniteCubicalComplex|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FiniteCubicalComplex;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FiniteCubicalComplex|)))))))))) 

(DEFUN |FiniteCubicalComplex;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteCubicalComplex|))
          (LETT |dv$| (LIST '|FiniteCubicalComplex| DV$1) . #1#)
          (LETT $ (GETREFV 78) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FiniteCubicalComplex| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| VERTSET |#1|)
                              (|:| CUBE (|List| (|CubicalFacet|)))))
          $))) 

(MAKEPROP '|FiniteCubicalComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 12)
              |CUBEC;cubicalComplex;VSL$;1| (|Integer|) (|List| (|Segment| 10))
              (|CubicalFacet|) (0 . |cubicalFacet|) (6 . |concat|) (|List| 11)
              |CUBEC;cubicalComplex;VSL$;2| (|List| (|List| 10))
              (12 . |cubicalFacet|) (|List| 17) |CUBEC;cubicalComplex;VSL$;3|
              |CUBEC;cubicalComplex;VS$;4| (18 . |getIntervals|) (|Boolean|)
              (23 . =) (29 . |getMult|) (34 . ~=) (40 . |setMult|)
              |CUBEC;addCube;$Cf$;5| (|List| $) (46 . |delta|)
              |CUBEC;delta;2$;6| (|NonNegativeInteger|) (51 . |order|) (56 . >)
              (|List| 8) (62 . |concat|) (68 . >) (74 . |elt|) (80 . |setelt!|)
              |CUBEC;grade;$L;7| (87 . |sameFace?|) (93 . |allSubsets|)
              |CUBEC;addImpliedFaces;$L;10| (100 . |prod|) (106 . |product|)
              |CUBEC;product;3$;11| (|GroupPresentation|)
              |CUBEC;fundamentalGroup;$2BGp;13| |CUBEC;fundamentalGroup;$Gp;12|
              (|FiniteCubicalComplex| 6) (|DeltaComplex| 6)
              (112 . |deltaComplex|) (117 . |fundamentalGroup|)
              (|List| (|Homology|)) (124 . |homology|) |CUBEC;homology;$L;14|
              (|ChainComplex|) (129 . |chain|) |CUBEC;chain;$Cc;15| (134 . ~=)
              (140 . |elt|) (146 . ~=) (|List| 23) (152 . |elt|)
              (158 . |setelt!|) |CUBEC;=;2$B;16| (|OutputForm|) (165 . |empty|)
              (|String|) (169 . |message|) (174 . |bracket|) (179 . |coerce|)
              (184 . |vconcat|) |CUBEC;coerce;$Of;17| |CUBEC;coerce;$Dc;18|
              (|SingleInteger|) (|HashState|))
           '#(~= 190 |product| 196 |latex| 202 |homology| 207 |hashUpdate!| 212
              |hash| 218 |grade| 223 |fundamentalGroup| 228 |delta| 240
              |cubicalComplex| 245 |coerce| 268 |chain| 278 |addImpliedFaces|
              283 |addCube| 288 = 294)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 67))
                        (|makeByteWordVec2| 77
                                            '(2 12 0 10 11 13 2 8 0 0 12 14 2
                                              12 0 10 17 18 1 12 11 0 22 2 11
                                              23 0 0 24 1 12 10 0 25 2 10 23 0
                                              0 26 2 12 0 0 10 27 1 12 29 0 30
                                              1 12 32 0 33 2 32 23 0 0 34 2 35
                                              0 0 8 36 2 10 23 0 0 37 2 35 8 0
                                              10 38 3 35 8 0 10 8 39 2 12 23 0
                                              0 41 3 12 29 0 32 32 42 2 6 0 0 0
                                              44 2 12 0 0 0 45 1 51 0 50 52 3
                                              51 47 0 23 23 53 1 51 54 0 55 1
                                              51 57 0 58 2 32 23 0 0 60 2 8 12
                                              0 10 61 2 12 23 0 0 62 2 63 23 0
                                              10 64 3 63 23 0 10 23 65 0 67 0
                                              68 1 67 0 69 70 1 67 0 0 71 1 12
                                              67 0 72 2 67 0 0 0 73 2 0 23 0 0
                                              1 2 0 0 0 0 46 1 0 69 0 1 1 0 54
                                              0 56 2 0 77 77 0 1 1 0 76 0 1 1 0
                                              35 0 40 3 0 47 0 23 23 48 1 0 47
                                              0 49 1 0 0 0 31 2 0 0 6 19 20 1 0
                                              0 6 21 2 0 0 6 15 16 2 0 0 6 8 9
                                              1 0 51 0 75 1 0 67 0 74 1 0 57 0
                                              59 1 0 35 0 43 2 0 0 0 12 28 2 0
                                              23 0 0 66)))))
           '|lookupComplete|)) 
