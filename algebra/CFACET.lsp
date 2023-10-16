
(SDEFUN |CFACET;cubicalFacet;IL$;1|
        ((|mul1| |Integer|) (|fac1| |List| (|Segment| (|Integer|))) ($ $))
        (SPROG
         ((|mul2| (|Integer|)) (|fac2| (|List| (|Segment| (|Integer|))))
          (|invert| (|Boolean|)) (|interv| (|Segment| (|Integer|)))
          (|hi| (|Integer|)) (|lo| (|Integer|)) (#1=#:G133 NIL) (|x| NIL))
         (SEQ (LETT |mul2| |mul1|) (LETT |fac2| NIL) (LETT |invert| NIL)
              (SEQ (LETT |x| NIL) (LETT #1# |fac1|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |interv| |x|)
                        (LETT |lo| (SPADCALL |x| (QREFELT $ 9)))
                        (LETT |hi| (SPADCALL |x| (QREFELT $ 10)))
                        (COND
                         ((SPADCALL |lo| |hi| (QREFELT $ 12))
                          (SEQ
                           (LETT |interv| (SPADCALL |hi| |lo| (QREFELT $ 13)))
                           (EXIT (LETT |invert| (NULL |invert|))))))
                        (EXIT
                         (LETT |fac2|
                               (SPADCALL |fac2| |interv| (QREFELT $ 15)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (COND (|invert| (LETT |mul2| (- |mul2|))))
              (EXIT (CONS |mul2| |fac2|))))) 

(SDEFUN |CFACET;cubicalFacet;IL$;2|
        ((|mul1| |Integer|) (|fac1| |List| (|List| (|Integer|))) ($ $))
        (SPROG
         ((|fac2| (|List| (|Segment| (|Integer|))))
          (|interv| (|Segment| (|Integer|))) (#1=#:G140 NIL) (|x| NIL))
         (SEQ (LETT |fac2| NIL)
              (SEQ (LETT |x| NIL) (LETT #1# |fac1|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL (LENGTH |x|) 2 (QREFELT $ 17))
                      (|error| "inner list should contain low, high")))
                    (LETT |interv|
                          (SPADCALL (|SPADfirst| |x|)
                                    (SPADCALL |x| (QREFELT $ 19))
                                    (QREFELT $ 13)))
                    (EXIT
                     (LETT |fac2| (SPADCALL |fac2| |interv| (QREFELT $ 15)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |mul1| |fac2|))))) 

(SDEFUN |CFACET;cubicalFacet;I2$;3|
        ((|mul1| |Integer|) (|fac1| |CubicalFacet|) ($ $))
        (SPROG ((|fac2| (|List| (|Segment| (|Integer|)))))
               (SEQ (LETT |fac2| (SPADCALL |fac1| (QREFELT $ 23)))
                    (EXIT (CONS |mul1| |fac2|))))) 

(PUT '|CFACET;getIntervals;$L;4| '|SPADreplace| 'QCDR) 

(SDEFUN |CFACET;getIntervals;$L;4|
        ((|orf| $) ($ |List| (|Segment| (|Integer|)))) (QCDR |orf|)) 

(SDEFUN |CFACET;order;$Nni;5| ((|f| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|value| (|NonNegativeInteger|)) (#1=#:G144 NIL) (|hi| (|Integer|))
          (|lo| (|Integer|)) (#2=#:G149 NIL) (|seg| NIL)
          (|facet| (|List| (|Segment| (|Integer|)))))
         (SEQ (LETT |value| 0) (LETT |facet| (QCDR |f|))
              (SEQ (LETT |seg| NIL) (LETT #2# |facet|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |seg| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |lo| (SPADCALL |seg| (QREFELT $ 9)))
                        (LETT |hi| (SPADCALL |seg| (QREFELT $ 10)))
                        (EXIT
                         (LETT |value|
                               (+ |value|
                                  (PROG1 (LETT #1# (ABS (- |hi| |lo|)))
                                    (|check_subtype2| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |value|)))) 

(PUT '|CFACET;getMult;$I;6| '|SPADreplace| 'QCAR) 

(SDEFUN |CFACET;getMult;$I;6| ((|orf| $) ($ |Integer|)) (QCAR |orf|)) 

(SDEFUN |CFACET;setMult;$I$;7| ((|orf| $) (|m| |Integer|) ($ $))
        (SPROG ((|fac2| (|List| (|Segment| (|Integer|)))))
               (SEQ (LETT |fac2| (SPADCALL |orf| (QREFELT $ 25)))
                    (EXIT (SPADCALL |m| |fac2| (QREFELT $ 16)))))) 

(SDEFUN |CFACET;position;$LI;8| ((|e| $) (|lst| |List| $) ($ |Integer|))
        (SPROG ((#1=#:G161 NIL) (|res| (|Integer|)) (#2=#:G162 NIL) (|x| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |res| 1)
                      (SEQ (LETT |x| NIL) (LETT #2# |lst|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL (QCDR |e|) (QCDR |x|) (QREFELT $ 30))
                              (SEQ
                               (COND
                                ((EQL (QCAR |e|) (QCAR |x|))
                                 (PROGN (LETT #1# |res|) (GO #3=#:G160))))
                               (EXIT (PROGN (LETT #1# (- |res|)) (GO #3#))))))
                            (EXIT (LETT |res| (+ |res| 1))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT (PROGN (LETT #1# 0) (GO #3#)))))
                #3# (EXIT #1#)))) 

(SDEFUN |CFACET;product;3$;9| ((|a| $) (|b| $) ($ $))
        (SPROG ((|bint| #1=(|List| (|Segment| (|Integer|)))) (|aint| #1#))
               (SEQ (LETT |aint| (SPADCALL |a| (QREFELT $ 25)))
                    (LETT |bint| (SPADCALL |b| (QREFELT $ 25)))
                    (EXIT
                     (SPADCALL 1 (SPADCALL |aint| |bint| (QREFELT $ 33))
                               (QREFELT $ 16)))))) 

(SDEFUN |CFACET;boundaryOneDimension|
        ((|orf| $) (|dim| |NonNegativeInteger|) (|invert| |Boolean|)
         ($ |List| $))
        (SPROG
         ((|res| (|List| $)) (|r2| ($)) (|r1| ($)) (|mult| (|Integer|))
          (|subFacet2| (|List| (|Segment| (|Integer|))))
          (|subFacet1| (|List| (|Segment| (|Integer|)))) (|hi| (|Integer|))
          (|lo| (|Integer|)) (#1=#:G171 NIL) (|seg| NIL) (#2=#:G172 NIL)
          (|segn| NIL) (|facet| (|List| (|Segment| (|Integer|)))))
         (SEQ (LETT |facet| (QCDR |orf|)) (LETT |mult| (QCAR |orf|))
              (LETT |subFacet1| NIL) (LETT |subFacet2| NIL)
              (SEQ (LETT |segn| 1) (LETT #2# (LENGTH |facet|)) (LETT |seg| NIL)
                   (LETT #1# |facet|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |seg| (CAR #1#)) NIL)
                         (|greater_SI| |segn| #2#))
                     (GO G191)))
                   (SEQ (LETT |lo| (SPADCALL |seg| (QREFELT $ 9)))
                        (LETT |hi| (SPADCALL |seg| (QREFELT $ 10)))
                        (EXIT
                         (COND
                          ((EQL |segn| |dim|)
                           (SEQ
                            (LETT |subFacet1|
                                  (SPADCALL |subFacet1|
                                            (SPADCALL |lo| |lo| (QREFELT $ 13))
                                            (QREFELT $ 15)))
                            (EXIT
                             (LETT |subFacet2|
                                   (SPADCALL |subFacet2|
                                             (SPADCALL |hi| |hi|
                                                       (QREFELT $ 13))
                                             (QREFELT $ 15))))))
                          ('T
                           (SEQ
                            (LETT |subFacet1|
                                  (SPADCALL |subFacet1| |seg| (QREFELT $ 15)))
                            (EXIT
                             (LETT |subFacet2|
                                   (SPADCALL |subFacet2| |seg|
                                             (QREFELT $ 15)))))))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT |segn| (|inc_SI| |segn|))))
                   (GO G190) G191 (EXIT NIL))
              (COND (|invert| (LETT |mult| (- |mult|)))) (LETT |res| NIL)
              (LETT |r1| (SPADCALL (- |mult|) |subFacet1| (QREFELT $ 16)))
              (LETT |res| (SPADCALL |res| |r1| (QREFELT $ 36)))
              (LETT |r2| (SPADCALL |mult| |subFacet2| (QREFELT $ 16)))
              (LETT |res| (SPADCALL |res| |r2| (QREFELT $ 36))) (EXIT |res|)))) 

(SDEFUN |CFACET;boundary;$L;11| ((|orf| $) ($ |List| $))
        (SPROG
         ((|invert| (|Boolean|)) (|res| (|List| $)) (#1=#:G182 NIL) (|dim| NIL)
          (|dims| (|List| (|NonNegativeInteger|))) (|hi| (|Integer|))
          (|lo| (|Integer|)) (#2=#:G180 NIL) (|seg| NIL) (#3=#:G181 NIL)
          (|segn| NIL) (|mult| (|Integer|))
          (|facet| (|List| (|Segment| (|Integer|)))))
         (SEQ (LETT |facet| (QCDR |orf|)) (LETT |mult| (QCAR |orf|))
              (LETT |dims| NIL)
              (SEQ (LETT |segn| 1) (LETT #3# (LENGTH |facet|)) (LETT |seg| NIL)
                   (LETT #2# |facet|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |seg| (CAR #2#)) NIL)
                         (|greater_SI| |segn| #3#))
                     (GO G191)))
                   (SEQ (LETT |lo| (SPADCALL |seg| (QREFELT $ 9)))
                        (LETT |hi| (SPADCALL |seg| (QREFELT $ 10)))
                        (EXIT
                         (COND
                          ((SPADCALL |lo| |hi| (QREFELT $ 17))
                           (LETT |dims|
                                 (SPADCALL |dims| |segn| (QREFELT $ 38)))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |segn| (|inc_SI| |segn|))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |res| NIL) (LETT |invert| NIL)
              (SEQ (LETT |dim| NIL) (LETT #1# |dims|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |dim| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |res|
                          (SPADCALL |res|
                                    (|CFACET;boundaryOneDimension| |orf| |dim|
                                     |invert| $)
                                    (QREFELT $ 39)))
                    (EXIT (LETT |invert| (NULL |invert|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CFACET;addIfNew| ((|lst| |List| $) (|orf| $) ($ |List| $))
        (SPROG ((#1=#:G187 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((NULL (SPADCALL |orf| (QREFELT $ 41)))
                    (COND
                     ((SPADCALL |orf| |lst| (QREFELT $ 42))
                      (PROGN (LETT #1# |lst|) (GO #2=#:G186))))))
                  (EXIT (SPADCALL |lst| |orf| (QREFELT $ 36)))))
                #2# (EXIT #1#)))) 

(SDEFUN |CFACET;addIfNew2| ((|lst| |List| $) (|orfs| |List| $) ($ |List| $))
        (SPROG ((|res| (|List| $)) (#1=#:G195 NIL) (|orf| NIL) (#2=#:G194 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |orfs| (QREFELT $ 43))
                    (PROGN (LETT #2# |lst|) (GO #3=#:G193))))
                  (LETT |res| (SPADCALL |lst| (QREFELT $ 44)))
                  (SEQ (LETT |orf| NIL) (LETT #1# |orfs|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |orf| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |orf| (QREFELT $ 41)))
                           (COND
                            ((NULL (SPADCALL |orf| |res| (QREFELT $ 42)))
                             (LETT |res|
                                   (SPADCALL |res| |orf| (QREFELT $ 36)))))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))
                #3# (EXIT #2#)))) 

(SDEFUN |CFACET;allSubsets;$NniL;14|
        ((|orf| $) (|minDim| |NonNegativeInteger|) ($ |List| $))
        (SPROG
         ((|res| (|List| $)) (|sub| (|List| $)) (|rHi1| ($))
          (|rHi| #1=(|List| (|Segment| (|Integer|)))) (|rLo1| ($)) (|rLo| #1#)
          (|segHi| #2=(|Segment| (|Integer|))) (|segLo| #2#) (|hi| (|Integer|))
          (|lo| (|Integer|)) (#3=#:G207 NIL) (|x| NIL) (#4=#:G208 NIL)
          (|xn| NIL) (#5=#:G206 NIL) (|mult| (|Integer|))
          (|facet| (|List| (|Segment| (|Integer|)))))
         (SEQ
          (EXIT
           (SEQ (LETT |facet| (QCDR |orf|)) (LETT |mult| (QCAR |orf|))
                (LETT |res| NIL)
                (COND
                 ((SPADCALL (SPADCALL |orf| (QREFELT $ 27)) |minDim|
                            (QREFELT $ 45))
                  (PROGN (LETT #5# |res|) (GO #6=#:G205))))
                (SEQ (LETT |xn| 1) (LETT #4# (LENGTH |facet|)) (LETT |x| NIL)
                     (LETT #3# |facet|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL)
                           (|greater_SI| |xn| #4#))
                       (GO G191)))
                     (SEQ (LETT |lo| (SPADCALL |x| (QREFELT $ 9)))
                          (LETT |hi| (SPADCALL |x| (QREFELT $ 10)))
                          (EXIT
                           (COND
                            ((SPADCALL |lo| |hi| (QREFELT $ 17))
                             (SEQ
                              (LETT |segLo|
                                    (SPADCALL |lo| |lo| (QREFELT $ 13)))
                              (LETT |segHi|
                                    (SPADCALL |hi| |hi| (QREFELT $ 13)))
                              (LETT |rLo| (SPADCALL |facet| (QREFELT $ 46)))
                              (SPADCALL |rLo| |xn| |segLo| (QREFELT $ 47))
                              (LETT |rLo1| (SPADCALL 1 |rLo| (QREFELT $ 16)))
                              (LETT |res| (|CFACET;addIfNew| |res| |rLo1| $))
                              (LETT |rHi| (SPADCALL |facet| (QREFELT $ 46)))
                              (SPADCALL |rHi| |xn| |segHi| (QREFELT $ 47))
                              (LETT |rHi1| (SPADCALL 1 |rHi| (QREFELT $ 16)))
                              (LETT |res| (|CFACET;addIfNew| |res| |rHi1| $))
                              (COND
                               ((SPADCALL (SPADCALL |rLo1| (QREFELT $ 27))
                                          |minDim| (QREFELT $ 48))
                                (SEQ
                                 (LETT |sub|
                                       (SPADCALL |rLo1| |minDim|
                                                 (QREFELT $ 49)))
                                 (EXIT
                                  (COND
                                   ((NULL (SPADCALL |sub| (QREFELT $ 43)))
                                    (LETT |res|
                                          (|CFACET;addIfNew2| |res| |sub|
                                           $))))))))
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |rHi1| (QREFELT $ 27))
                                           |minDim| (QREFELT $ 48))
                                 (SEQ
                                  (LETT |sub|
                                        (SPADCALL |rHi1| |minDim|
                                                  (QREFELT $ 49)))
                                  (EXIT
                                   (COND
                                    ((NULL (SPADCALL |sub| (QREFELT $ 43)))
                                     (LETT |res|
                                           (|CFACET;addIfNew2| |res| |sub|
                                            $))))))))))))))
                     (LETT #3# (PROG1 (CDR #3#) (LETT |xn| (|inc_SI| |xn|))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #6# (EXIT #5#)))) 

(SDEFUN |CFACET;allSubsets;$2NniL;15|
        ((|orf| $) (|minDim| |NonNegativeInteger|)
         (|maxDim| |NonNegativeInteger|) ($ |List| $))
        (SPROG
         ((|res2| (|List| $)) (#1=#:G214 NIL) (|y| NIL) (|res| (|List| $)))
         (SEQ (LETT |res| (SPADCALL |orf| |minDim| (QREFELT $ 49)))
              (LETT |res2| NIL)
              (SEQ (LETT |y| NIL) (LETT #1# |res|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |y| (QREFELT $ 27)) |maxDim|
                                 (QREFELT $ 45))
                       (LETT |res2| (SPADCALL |res2| |y| (QREFELT $ 36)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res2|)))) 

(SDEFUN |CFACET;sameFace?;2$B;16| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG ((|vertsb| #1=(|List| (|Segment| (|Integer|)))) (|vertsa| #1#))
               (SEQ (LETT |vertsa| (QCDR |a|)) (LETT |vertsb| (QCDR |b|))
                    (EXIT (NULL (SPADCALL |vertsa| |vertsb| (QREFELT $ 51))))))) 

(SDEFUN |CFACET;ltLocal|
        ((|a| |List| (|Segment| (|Integer|)))
         (|b| |List| (|Segment| (|Integer|))) ($ |Boolean|))
        (SPROG
         ((#1=#:G224 NIL) (|hib| #2=(|Integer|)) (|lob| #3=(|Integer|))
          (|hia| #2#) (|loa| #3#) (#4=#:G225 NIL) (|a1| NIL) (#5=#:G226 NIL)
          (|b1| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |a| |b| (QREFELT $ 30))
              (PROGN (LETT #1# NIL) (GO #6=#:G223))))
            (COND ((< (LENGTH |a|) 1) (PROGN (LETT #1# 'T) (GO #6#))))
            (COND ((< (LENGTH |b|) 1) (PROGN (LETT #1# NIL) (GO #6#))))
            (SEQ (LETT |b1| NIL) (LETT #5# |b|) (LETT |a1| NIL) (LETT #4# |a|)
                 G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |a1| (CAR #4#)) NIL) (ATOM #5#)
                       (PROGN (LETT |b1| (CAR #5#)) NIL))
                   (GO G191)))
                 (SEQ (LETT |loa| (SPADCALL |a1| (QREFELT $ 9)))
                      (LETT |hia| (SPADCALL |a1| (QREFELT $ 10)))
                      (LETT |lob| (SPADCALL |b1| (QREFELT $ 9)))
                      (LETT |hib| (SPADCALL |b1| (QREFELT $ 10)))
                      (COND ((< |loa| |lob|) (PROGN (LETT #1# 'T) (GO #6#))))
                      (COND
                       ((SPADCALL |loa| |lob| (QREFELT $ 12))
                        (PROGN (LETT #1# NIL) (GO #6#))))
                      (COND ((< |hia| |hib|) (PROGN (LETT #1# 'T) (GO #6#))))
                      (EXIT
                       (COND
                        ((SPADCALL |hia| |hib| (QREFELT $ 12))
                         (PROGN (LETT #1# NIL) (GO #6#))))))
                 (LETT #4# (PROG1 (CDR #4#) (LETT #5# (CDR #5#)))) (GO G190)
                 G191 (EXIT NIL))
            (EXIT NIL)))
          #6# (EXIT #1#)))) 

(SDEFUN |CFACET;<;2$B;18| ((|ain| $) (|bin| $) ($ |Boolean|))
        (SPROG ((|b| #1=(|List| (|Segment| (|Integer|)))) (|a| #1#))
               (SEQ (LETT |a| (QCDR |ain|)) (LETT |b| (QCDR |bin|))
                    (EXIT (|CFACET;ltLocal| |a| |b| $))))) 

(SDEFUN |CFACET;<=;2$B;19| ((|ain| $) (|bin| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G231 NIL) (|b| #2=(|List| (|Segment| (|Integer|)))) (|a| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |a| (QCDR |ain|)) (LETT |b| (QCDR |bin|))
                (COND
                 ((SPADCALL |a| |b| (QREFELT $ 30))
                  (PROGN (LETT #1# 'T) (GO #3=#:G230))))
                (EXIT (|CFACET;ltLocal| |a| |b| $))))
          #3# (EXIT #1#)))) 

(SDEFUN |CFACET;=;2$B;20| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG ((#1=#:G236 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 17))
                    (PROGN (LETT #1# NIL) (GO #2=#:G235))))
                  (EXIT (SPADCALL (QCDR |a|) (QCDR |b|) (QREFELT $ 30)))))
                #2# (EXIT #1#)))) 

(SDEFUN |CFACET;coerce;$Of;21| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|body| (|OutputForm|)) (|elements| (|List| (|OutputForm|)))
          (#1=#:G244 NIL) (|x| NIL) (#2=#:G243 NIL) (|prefix| (|OutputForm|))
          (|m| (|Integer|)))
         (SEQ (LETT |prefix| (SPADCALL "" (QREFELT $ 58)))
              (LETT |m| (QCAR |s|))
              (COND
               ((SPADCALL (ABS |m|) 1 (QREFELT $ 17))
                (LETT |prefix|
                      (SPADCALL (SPADCALL |m| (QREFELT $ 59))
                                (SPADCALL "*" (QREFELT $ 58))
                                (QREFELT $ 60)))))
              (COND
               ((EQL |m| -1) (LETT |prefix| (SPADCALL "-" (QREFELT $ 58)))))
              (LETT |elements|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |x| NIL) (LETT #1# (QCDR |s|)) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (SPADCALL |x| (QREFELT $ 61)) #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (LETT |body| (SPADCALL |elements| (QREFELT $ 62)))
              (EXIT (SPADCALL |prefix| |body| (QREFELT $ 60)))))) 

(DECLAIM (NOTINLINE |CubicalFacet;|)) 

(DEFUN |CubicalFacet| ()
  (SPROG NIL
         (PROG (#1=#:G246)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|CubicalFacet|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CubicalFacet|
                             (LIST (CONS NIL (CONS 1 (|CubicalFacet;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|CubicalFacet|)))))))))) 

(DEFUN |CubicalFacet;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CubicalFacet|))
          (LETT $ (GETREFV 66))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CubicalFacet| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |mul| (|Integer|))
                              (|:| |fac| (|List| (|Segment| (|Integer|))))))
          $))) 

(MAKEPROP '|CubicalFacet| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Integer|) (|Segment| 7)
              (0 . |low|) (5 . |high|) (|Boolean|) (10 . >) (16 . |segment|)
              (|List| 8) (22 . |concat|) |CFACET;cubicalFacet;IL$;1| (28 . ~=)
              (|List| 7) (34 . |second|) (|List| 18)
              |CFACET;cubicalFacet;IL$;2| (|CubicalFacet|)
              (39 . |getIntervals|) |CFACET;cubicalFacet;I2$;3|
              |CFACET;getIntervals;$L;4| (|NonNegativeInteger|)
              |CFACET;order;$Nni;5| |CFACET;getMult;$I;6|
              |CFACET;setMult;$I$;7| (44 . =) (|List| $)
              |CFACET;position;$LI;8| (50 . |concat|) |CFACET;product;3$;9|
              (|List| $$) (56 . |concat|) (|List| 26) (62 . |concat|)
              (68 . |concat|) |CFACET;boundary;$L;11| (74 . |empty?|)
              (79 . |member?|) (85 . |empty?|) (90 . |copy|) (95 . <=)
              (101 . |copy|) (106 . |setelt!|) (113 . >)
              |CFACET;allSubsets;$NniL;14| |CFACET;allSubsets;$2NniL;15|
              (119 . ~=) |CFACET;sameFace?;2$B;16| |CFACET;<;2$B;18|
              |CFACET;<=;2$B;19| |CFACET;=;2$B;20| (|String|) (|OutputForm|)
              (125 . |message|) (130 . |coerce|) (135 . |hconcat|)
              (141 . |coerce|) (146 . |paren|) |CFACET;coerce;$Of;21|
              (|HashState|) (|SingleInteger|))
           '#(~= 151 |smaller?| 157 |setMult| 163 |sameFace?| 169 |product| 175
              |position| 181 |order| 187 |min| 192 |max| 198 |latex| 204
              |hashUpdate!| 209 |hash| 215 |getMult| 220 |getIntervals| 225
              |empty?| 230 |cubicalFacet| 235 |coerce| 253 |boundary| 258
              |allSubsets| 263 >= 276 > 282 = 288 <= 294 < 300)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|FacetCategory&| |OrderedSet&| NIL |SetCategory&|
                     |PartialOrder&| |BasicType&| NIL)
                  (CONS
                   '#((|FacetCategory|) (|OrderedSet|) (|Comparable|)
                      (|SetCategory|) (|PartialOrder|) (|BasicType|)
                      (|CoercibleTo| 57))
                   (|makeByteWordVec2| 65
                                       '(1 8 7 0 9 1 8 7 0 10 2 7 11 0 0 12 2 8
                                         0 7 7 13 2 14 0 0 8 15 2 7 11 0 0 17 1
                                         18 7 0 19 1 22 14 0 23 2 14 11 0 0 30
                                         2 14 0 0 0 33 2 35 0 0 2 36 2 37 0 0
                                         26 38 2 35 0 0 0 39 1 0 11 0 41 2 35
                                         11 2 0 42 1 35 11 0 43 1 35 0 0 44 2
                                         26 11 0 0 45 1 14 0 0 46 3 14 8 0 7 8
                                         47 2 26 11 0 0 48 2 14 11 0 0 51 1 57
                                         0 56 58 1 7 57 0 59 2 57 0 0 0 60 1 8
                                         57 0 61 1 57 0 31 62 2 0 11 0 0 1 2 0
                                         11 0 0 1 2 0 0 0 7 29 2 0 11 0 0 52 2
                                         0 0 0 0 34 2 0 7 0 31 32 1 0 26 0 27 2
                                         0 0 0 0 1 2 0 0 0 0 1 1 0 56 0 1 2 0
                                         64 64 0 1 1 0 65 0 1 1 0 7 0 28 1 0 14
                                         0 25 1 0 11 0 41 2 0 0 7 22 24 2 0 0 7
                                         14 16 2 0 0 7 20 21 1 0 57 0 63 1 0 31
                                         0 40 3 0 31 0 26 26 50 2 0 31 0 26 49
                                         2 0 11 0 0 1 2 0 11 0 0 1 2 0 11 0 0
                                         55 2 0 11 0 0 54 2 0 11 0 0 53)))))
           '|lookupComplete|)) 

(MAKEPROP '|CubicalFacet| 'NILADIC T) 
