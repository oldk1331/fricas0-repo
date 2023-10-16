
(SDEFUN |OFACET;orientedFacet;IL$;1|
        ((|mul1| |Integer|) (|fac1| |List| (|NonNegativeInteger|)) ($ $))
        (SPROG
         ((|mul2| (|Integer|)) (|diff| (|NonNegativeInteger|)) (#1=#:G139 NIL)
          (|x| NIL) (#2=#:G140 NIL) (|y| NIL)
          (|fac2| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |mul2| |mul1|)
              (LETT |fac2| (SPADCALL |fac1| (QREFELT $ 8))) (LETT |diff| 0)
              (SEQ (LETT |y| NIL) (LETT #2# |fac2|) (LETT |x| NIL)
                   (LETT #1# |fac1|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL) (ATOM #2#)
                         (PROGN (LETT |y| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |x| |y| (QREFELT $ 11))
                       (LETT |diff| (+ |diff| 1))))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#)))) (GO G190)
                   G191 (EXIT NIL))
              (COND ((EQL |diff| 1) (|error| "cant construct orientedFacet")))
              (COND
               ((SPADCALL |diff| (QREFELT $ 13))
                (COND
                 ((SPADCALL |diff| 1 (QREFELT $ 14))
                  (LETT |mul2| (- |mul2|))))))
              (EXIT (CONS |mul2| |fac2|))))) 

(SDEFUN |OFACET;orientedFacetUnsigned;L$;2| ((|fac1| |List| (|Integer|)) ($ $))
        (SPROG
         ((|lst| (|List| (|NonNegativeInteger|))) (#1=#:G141 NIL)
          (#2=#:G146 NIL) (|x| NIL) (#3=#:G145 NIL))
         (SEQ
          (LETT |lst|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |x| NIL) (LETT #2# |fac1|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (PROG1 (LETT #1# (ABS |x|))
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               #3#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (LETT |lst| (SPADCALL |lst| (QREFELT $ 16)))
          (EXIT (CONS 1 (SPADCALL |lst| (QREFELT $ 8))))))) 

(SDEFUN |OFACET;orientedFacetSigned;L$;3| ((|fac1| |List| (|Integer|)) ($ $))
        (SPROG
         ((|sig| (|Integer|)) (|lst| (|List| (|NonNegativeInteger|)))
          (#1=#:G147 NIL) (#2=#:G155 NIL) (|x| NIL) (#3=#:G154 NIL))
         (SEQ
          (LETT |lst|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |x| NIL) (LETT #2# |fac1|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (PROG1 (LETT #1# (ABS |x|))
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               #3#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (LETT |lst| (SPADCALL |lst| (QREFELT $ 16))) (LETT |sig| 1)
          (COND
           ((< (LENGTH |fac1|) 1)
            (|error| "attempt to construct empty facet")))
          (COND ((< (|SPADfirst| |fac1|) 0) (LETT |sig| -1)))
          (EXIT (CONS |sig| (SPADCALL |lst| (QREFELT $ 8))))))) 

(SDEFUN |OFACET;orientedFacet;I2$;4|
        ((|mul| |Integer|) (|fac1| |OrientedFacet|) ($ $))
        (CONS |mul| (SPADCALL |fac1| (QREFELT $ 21)))) 

(SDEFUN |OFACET;orientedFacetIfCan;LU;5|
        ((|boundary| |List| $) ($ |Union| $ "failed"))
        (SPROG
         ((#1=#:G174 NIL) (|mm| (|Integer|)) (#2=#:G178 NIL) (|e| NIL)
          (#3=#:G177 NIL) (|expected| (|List| $)) (|res| ($))
          (|indexes| (|List| (|NonNegativeInteger|))) (#4=#:G176 NIL) (|i| NIL)
          (|indexLst| (|List| (|List| (|NonNegativeInteger|)))) (#5=#:G175 NIL)
          (|subFacet| NIL) (|b| (|List| $)) (|multLst| (|List| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ (LETT |indexLst| NIL) (LETT |multLst| NIL)
                (COND
                 ((< (SPADCALL |boundary| (QREFELT $ 24)) 1)
                  (PROGN (LETT #1# (CONS 1 "failed")) (GO #6=#:G173))))
                (LETT |b| (SPADCALL |boundary| (QREFELT $ 25)))
                (SEQ (LETT |subFacet| NIL) (LETT #5# |b|) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |subFacet| (CAR #5#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |indexLst|
                             (SPADCALL |indexLst|
                                       (SPADCALL |subFacet| (QREFELT $ 26))
                                       (QREFELT $ 28)))))
                     (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                (LETT |indexes| NIL)
                (SEQ (LETT |i| NIL) (LETT #4# |indexLst|) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |indexes|
                             (SPADCALL |indexes| |i| (QREFELT $ 29)))))
                     (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                (LETT |indexes| (SPADCALL |indexes| (QREFELT $ 16)))
                (LETT |indexes| (SPADCALL |indexes| (QREFELT $ 8)))
                (LETT |res| (SPADCALL 1 |indexes| (QREFELT $ 15)))
                (LETT |expected| (SPADCALL |res| (QREFELT $ 31)))
                (LETT |mm|
                      (SPADCALL (SPADCALL |boundary| (QREFELT $ 32)) |expected|
                                (QREFELT $ 33)))
                (COND
                 ((< |mm| 0)
                  (SEQ (LETT |res| (SPADCALL -1 |indexes| (QREFELT $ 15)))
                       (EXIT
                        (LETT |expected| (SPADCALL |res| (QREFELT $ 31)))))))
                (SEQ (LETT |e| NIL) (LETT #3# |expected|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |e| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |mm| (SPADCALL |e| |boundary| (QREFELT $ 33)))
                          (EXIT
                           (COND
                            ((SPADCALL |mm| 0 (QREFELT $ 34))
                             (PROGN (LETT #1# (CONS 1 "failed")) (GO #6#))))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |e| NIL) (LETT #2# |boundary|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |mm| (SPADCALL |e| |expected| (QREFELT $ 33)))
                          (EXIT
                           (COND
                            ((SPADCALL |mm| 0 (QREFELT $ 34))
                             (PROGN (LETT #1# (CONS 1 "failed")) (GO #6#))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 |res|))))
          #6# (EXIT #1#)))) 

(SDEFUN |OFACET;order;$Nni;6| ((|f| $) ($ |NonNegativeInteger|))
        (SPROG ((|facet| (|List| (|NonNegativeInteger|))))
               (SEQ (LETT |facet| (SPADCALL |f| (QREFELT $ 26)))
                    (EXIT (SPADCALL |facet| (QREFELT $ 37)))))) 

(PUT '|OFACET;getIndexes;$L;7| '|SPADreplace| 'QCDR) 

(SDEFUN |OFACET;getIndexes;$L;7| ((|orf| $) ($ |List| (|NonNegativeInteger|)))
        (QCDR |orf|)) 

(SDEFUN |OFACET;minIndex;$Nni;8| ((|orf| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (#1=#:G185 NIL) (|i| NIL)
          (|inds| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |m| 0) (LETT |inds| (SPADCALL |orf| (QREFELT $ 26)))
              (SEQ (LETT |i| NIL) (LETT #1# |inds|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND ((OR (EQL |m| 0) (< |i| |m|)) (LETT |m| |i|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |m|)))) 

(SDEFUN |OFACET;maxIndex;$Nni;9| ((|orf| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (#1=#:G189 NIL) (|i| NIL)
          (|inds| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |m| 0) (LETT |inds| (SPADCALL |orf| (QREFELT $ 26)))
              (SEQ (LETT |i| NIL) (LETT #1# |inds|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |i| |m| (QREFELT $ 14)) (LETT |m| |i|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |m|)))) 

(SDEFUN |OFACET;getIndexesSigned;$L;10| ((|orf| $) ($ |List| (|Integer|)))
        (SPROG
         ((|neg| (|Boolean|)) (|res| (|List| (|Integer|))) (|i2| (|Integer|))
          (#1=#:G195 NIL) (|i| NIL))
         (SEQ (LETT |res| NIL)
              (LETT |neg| (EQL (SPADCALL (QCAR |orf|) (QREFELT $ 41)) -1))
              (SEQ (LETT |i| NIL) (LETT #1# (QCDR |orf|)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |i2| (COND (|neg| (- |i|)) ('T |i|)))
                        (LETT |res| (SPADCALL |res| |i2| (QREFELT $ 42)))
                        (EXIT (LETT |neg| (NULL |neg|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(PUT '|OFACET;getMult;$I;11| '|SPADreplace| 'QCAR) 

(SDEFUN |OFACET;getMult;$I;11| ((|orf| $) ($ |Integer|)) (QCAR |orf|)) 

(SDEFUN |OFACET;setMult!;$I$;12| ((|orf| $) (|m| |Integer|) ($ $))
        (SEQ (PROGN (RPLACA |orf| |m|) (QCAR |orf|)) (EXIT |orf|))) 

(SDEFUN |OFACET;boundary;$L;13| ((|orf| $) ($ |List| $))
        (SPROG
         ((|res| (|List| $)) (|r1| ($)) (|even| (|Boolean|))
          (|m| #1=(|Integer|)) (|r| (|List| (|NonNegativeInteger|)))
          (#2=#:G203 NIL) (|x| NIL) (|mult| #1#)
          (|revFacet| (|List| (|NonNegativeInteger|)))
          (|facet| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |facet| (QCDR |orf|)) (LETT |revFacet| (REVERSE |facet|))
              (LETT |mult| (QCAR |orf|)) (LETT |res| NIL) (LETT |even| NIL)
              (SEQ (LETT |x| NIL) (LETT #2# |revFacet|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |r| (SPADCALL |x| |facet| (QREFELT $ 46)))
                        (LETT |m| (COND (|even| (- |mult|)) ('T |mult|)))
                        (LETT |even| (NULL |even|))
                        (LETT |r1| (SPADCALL |m| |r| (QREFELT $ 15)))
                        (EXIT
                         (LETT |res| (SPADCALL |res| |r1| (QREFELT $ 47)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |OFACET;addIfNew| ((|lst| |List| $) (|orf| $) ($ |List| $))
        (SPROG ((#1=#:G208 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((NULL (SPADCALL |orf| (QREFELT $ 48)))
                    (COND
                     ((SPADCALL |orf| |lst| (QREFELT $ 49))
                      (PROGN (LETT #1# |lst|) (GO #2=#:G207))))))
                  (EXIT (SPADCALL |lst| |orf| (QREFELT $ 47)))))
                #2# (EXIT #1#)))) 

(SDEFUN |OFACET;addIfNew2| ((|lst| |List| $) (|orfs| |List| $) ($ |List| $))
        (SPROG ((|res| (|List| $)) (#1=#:G216 NIL) (|orf| NIL) (#2=#:G215 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |orfs| (QREFELT $ 50))
                    (PROGN (LETT #2# |lst|) (GO #3=#:G214))))
                  (LETT |res| (SPADCALL |lst| (QREFELT $ 51)))
                  (SEQ (LETT |orf| NIL) (LETT #1# |orfs|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |orf| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |orf| (QREFELT $ 48)))
                           (COND
                            ((NULL (SPADCALL |orf| |res| (QREFELT $ 49)))
                             (LETT |res|
                                   (SPADCALL |res| |orf| (QREFELT $ 47)))))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))
                #3# (EXIT #2#)))) 

(SDEFUN |OFACET;allSubsets;$NniL;16|
        ((|orf| $) (|minDim| |NonNegativeInteger|) ($ |List| $))
        (SPROG
         ((|res| (|List| $)) (|sub| (|List| $)) (|r1| ($))
          (|r| (|List| (|NonNegativeInteger|))) (#1=#:G225 NIL) (|x| NIL)
          (#2=#:G224 NIL) (|mult| (|Integer|))
          (|facet| (|List| (|NonNegativeInteger|))))
         (SEQ
          (EXIT
           (SEQ (LETT |facet| (QCDR |orf|)) (LETT |mult| (QCAR |orf|))
                (LETT |res| NIL)
                (COND
                 ((SPADCALL (SPADCALL |orf| (QREFELT $ 38)) |minDim|
                            (QREFELT $ 52))
                  (PROGN (LETT #2# |res|) (GO #3=#:G223))))
                (SEQ (LETT |x| NIL) (LETT #1# |facet|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |r| (SPADCALL |x| |facet| (QREFELT $ 46)))
                          (LETT |r1| (SPADCALL 1 |r| (QREFELT $ 15)))
                          (LETT |res| (|OFACET;addIfNew| |res| |r1| $))
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |r1| (QREFELT $ 38)) |minDim|
                                       (QREFELT $ 14))
                             (SEQ
                              (LETT |sub|
                                    (SPADCALL |r1| |minDim| (QREFELT $ 53)))
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |sub| (QREFELT $ 50)))
                                 (LETT |res|
                                       (|OFACET;addIfNew2| |res| |sub|
                                        $))))))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #3# (EXIT #2#)))) 

(SDEFUN |OFACET;allSubsets;$2NniL;17|
        ((|orf| $) (|minDim| |NonNegativeInteger|)
         (|maxDim| |NonNegativeInteger|) ($ |List| $))
        (SPROG
         ((|res2| (|List| $)) (#1=#:G231 NIL) (|y| NIL) (|res| (|List| $)))
         (SEQ (LETT |res| (SPADCALL |orf| |minDim| (QREFELT $ 53)))
              (LETT |res2| NIL)
              (SEQ (LETT |y| NIL) (LETT #1# |res|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |y| (QREFELT $ 38)) |maxDim|
                                 (QREFELT $ 52))
                       (LETT |res2| (SPADCALL |res2| |y| (QREFELT $ 47)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res2|)))) 

(SDEFUN |OFACET;isSubsetOf?;2$B;18| ((|sa| $) (|sb| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G235 NIL) (#2=#:G236 NIL) (|vertex| NIL) (|all| (|List| $)))
         (SEQ
          (EXIT
           (SEQ (LETT |all| (SPADCALL |sb| 1 (QREFELT $ 53)))
                (SEQ (LETT |vertex| NIL) (LETT #2# |all|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |vertex| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |vertex| |sa| (QREFELT $ 55))
                         (PROGN (LETT #1# 'T) (GO #3=#:G234))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT NIL)))
          #3# (EXIT #1#)))) 

(SDEFUN |OFACET;join;3$;19| ((|sa| $) (|sb| $) ($ $))
        (SPROG
         ((|mult| (|Integer|)) (|lst2| (|List| (|NonNegativeInteger|)))
          (|lst| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |lst| (SPADCALL (QCDR |sa|) (QCDR |sb|) (QREFELT $ 29)))
              (LETT |lst2|
                    (SPADCALL (SPADCALL |lst| (QREFELT $ 16)) (QREFELT $ 8)))
              (LETT |mult| (* (QCAR |sa|) (QCAR |sb|)))
              (EXIT (CONS |mult| |lst2|))))) 

(SDEFUN |OFACET;subtract;3$;20| ((|sa| $) (|sb| $) ($ $))
        (SPROG ((|lst| (|List| (|NonNegativeInteger|))))
               (SEQ
                (LETT |lst| (SPADCALL (QCDR |sb|) (QCDR |sa|) (QREFELT $ 58)))
                (EXIT (CONS 1 |lst|))))) 

(SDEFUN |OFACET;reindex;2$;21| ((|sa| $) ($ $))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|))) (|ptr| (|Integer|))
          (#1=#:G248 NIL) (|v| NIL) (|i| (|NonNegativeInteger|))
          (|newval| (|List| (|NonNegativeInteger|)))
          (|oldval| (|List| (|NonNegativeInteger|))) (#2=#:G247 NIL)
          (|facet| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |facet| (QCDR |sa|)) (LETT |oldval| NIL)
              (LETT |newval| NIL) (LETT |i| 1)
              (SEQ (LETT |v| NIL) (LETT #2# |facet|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |oldval| (SPADCALL |oldval| |v| (QREFELT $ 60)))
                        (LETT |newval| (SPADCALL |newval| |i| (QREFELT $ 60)))
                        (EXIT (LETT |i| (+ |i| 1))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (LETT |res| NIL)
              (SEQ (LETT |v| NIL) (LETT #1# |facet|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ptr| (SPADCALL |v| |oldval| (QREFELT $ 61)))
                        (COND ((< |ptr| 1) (|error| "error in reindex")))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res|
                                         (SPADCALL |newval| |ptr|
                                                   (QREFELT $ 62))
                                         (QREFELT $ 60)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 1 |res|))))) 

(SDEFUN |OFACET;boolWordPermute;2NniL;22|
        ((|numZeros| |NonNegativeInteger|) (|numOnes| |NonNegativeInteger|)
         ($ |List| (|List| (|Boolean|))))
        (SPADCALL NIL |numZeros| |numOnes| (QREFELT $ 65))) 

(SDEFUN |OFACET;boolWordPermute;L2NniL;23|
        ((|wordIn| |List| (|List| (|Boolean|)))
         (|numZeros| |NonNegativeInteger|) (|numOnes| |NonNegativeInteger|)
         ($ |List| (|List| (|Boolean|))))
        (SPROG
         ((|res| (|List| (|List| (|Boolean|))))
          (|word1| (|List| (|List| (|Boolean|))))
          (|subWord| (|List| (|Boolean|))) (#1=#:G265 NIL) (|x| NIL)
          (|z| (|NonNegativeInteger|)) (#2=#:G251 NIL)
          (|word0| (|List| (|List| (|Boolean|)))) (#3=#:G264 NIL)
          (#4=#:G263 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< |numZeros| 1)
              (COND
               ((< |numOnes| 1) (PROGN (LETT #4# |wordIn|) (GO #5=#:G262))))))
            (LETT |res| NIL)
            (COND
             ((SPADCALL |numZeros| 0 (QREFELT $ 14))
              (SEQ
               (LETT |z|
                     (PROG2 (LETT #2# (SPADCALL |numZeros| 1 (QREFELT $ 67)))
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                       (|Union| (|NonNegativeInteger|)
                                                #6="failed")
                                       #2#)))
               (LETT |word0| NIL)
               (COND ((NULL |wordIn|) (LETT |word0| (LIST (LIST NIL)))))
               (SEQ (LETT |x| NIL) (LETT #3# |wordIn|) G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                      (GO G191)))
                    (SEQ (LETT |subWord| (SPADCALL |x| NIL (QREFELT $ 69)))
                         (EXIT
                          (LETT |word0|
                                (SPADCALL |word0| |subWord| (QREFELT $ 70)))))
                    (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
               (EXIT
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL |word0| |z| |numOnes| (QREFELT $ 65))
                                (QREFELT $ 71)))))))
            (COND
             ((SPADCALL |numOnes| 0 (QREFELT $ 14))
              (SEQ
               (LETT |z|
                     (PROG2 (LETT #2# (SPADCALL |numOnes| 1 (QREFELT $ 67)))
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                       (|Union| (|NonNegativeInteger|) #6#)
                                       #2#)))
               (LETT |word1| NIL)
               (COND ((NULL |wordIn|) (LETT |word1| (LIST (LIST 'T)))))
               (SEQ (LETT |x| NIL) (LETT #1# |wordIn|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ (LETT |subWord| (SPADCALL |x| 'T (QREFELT $ 69)))
                         (EXIT
                          (LETT |word1|
                                (SPADCALL |word1| |subWord| (QREFELT $ 70)))))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
               (EXIT
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL |word1| |numZeros| |z|
                                          (QREFELT $ 65))
                                (QREFELT $ 71)))))))
            (EXIT |res|)))
          #5# (EXIT #4#)))) 

(SDEFUN |OFACET;product;2$L;24| ((|a| $) (|b| $) ($ |List| (|ProductFacet|)))
        (SPROG
         ((|res| (|List| (|ProductFacet|))) (|pf| (|ProductFacet|))
          (|i2|
           (|List|
            #1=(|Record| (|:| |left| (|NonNegativeInteger|))
                         (|:| |right| (|NonNegativeInteger|)))))
          (|i| #1#) (|leftIndex| #2=(|NonNegativeInteger|)) (|rightIndex| #2#)
          (#3=#:G280 NIL) (#4=#:G279 NIL) (|perm| NIL)
          (|perms| (|List| (|List| (|Boolean|))))
          (|lenB| (|NonNegativeInteger|)) (#5=#:G267 NIL)
          (|lenA| (|NonNegativeInteger|))
          (|indB| #6=(|List| (|NonNegativeInteger|))) (|indA| #6#))
         (SEQ (LETT |res| NIL) (LETT |indA| (SPADCALL |a| (QREFELT $ 26)))
              (LETT |indB| (SPADCALL |b| (QREFELT $ 26)))
              (LETT |lenA|
                    (PROG2
                        (LETT #5#
                              (SPADCALL (SPADCALL |indA| (QREFELT $ 37)) 1
                                        (QREFELT $ 67)))
                        (QCDR #5#)
                      (|check_union2| (QEQCAR #5# 0) (|NonNegativeInteger|)
                                      (|Union| (|NonNegativeInteger|)
                                               #7="failed")
                                      #5#)))
              (LETT |lenB|
                    (PROG2
                        (LETT #5#
                              (SPADCALL (SPADCALL |indB| (QREFELT $ 37)) 1
                                        (QREFELT $ 67)))
                        (QCDR #5#)
                      (|check_union2| (QEQCAR #5# 0) (|NonNegativeInteger|)
                                      (|Union| (|NonNegativeInteger|) #7#)
                                      #5#)))
              (LETT |perms| (REVERSE (SPADCALL |lenA| |lenB| (QREFELT $ 66))))
              (SEQ (LETT |perm| NIL) (LETT #4# |perms|) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |perm| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |leftIndex| 1) (LETT |rightIndex| 1)
                        (LETT |i|
                              (CONS
                               (SPADCALL |indA| |leftIndex| (QREFELT $ 72))
                               (SPADCALL |indB| |rightIndex| (QREFELT $ 72))))
                        (LETT |i2| (LIST |i|))
                        (SEQ (LETT |b| NIL) (LETT #3# |perm|) G190
                             (COND
                              ((OR (ATOM #3#) (PROGN (LETT |b| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (COND
                               (|b| (LETT |rightIndex| (+ |rightIndex| 1)))
                               ('T (LETT |leftIndex| (+ |leftIndex| 1))))
                              (COND
                               ((SPADCALL |leftIndex|
                                          (SPADCALL |indA| (QREFELT $ 37))
                                          (QREFELT $ 14))
                                (|error| "leftIndex too high in product")))
                              (COND
                               ((SPADCALL |rightIndex|
                                          (SPADCALL |indB| (QREFELT $ 37))
                                          (QREFELT $ 14))
                                (|error| "rightIndex too high in product")))
                              (LETT |i|
                                    (CONS
                                     (SPADCALL |indA| |leftIndex|
                                               (QREFELT $ 72))
                                     (SPADCALL |indB| |rightIndex|
                                               (QREFELT $ 72))))
                              (EXIT
                               (LETT |i2| (SPADCALL |i2| |i| (QREFELT $ 75)))))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                        (LETT |pf| (SPADCALL 1 |i2| (QREFELT $ 77)))
                        (EXIT
                         (LETT |res| (SPADCALL |res| |pf| (QREFELT $ 79)))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |OFACET;position;$LI;25| ((|e| $) (|lst| |List| $) ($ |Integer|))
        (SPROG ((#1=#:G289 NIL) (|res| (|Integer|)) (#2=#:G290 NIL) (|x| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |res| 1)
                      (SEQ (LETT |x| NIL) (LETT #2# |lst|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL (QCDR |e|) (QCDR |x|) (QREFELT $ 81))
                              (SEQ
                               (COND
                                ((EQL (QCAR |e|) (QCAR |x|))
                                 (PROGN (LETT #1# |res|) (GO #3=#:G288))))
                               (EXIT (PROGN (LETT #1# (- |res|)) (GO #3#))))))
                            (EXIT (LETT |res| (+ |res| 1))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT (PROGN (LETT #1# 0) (GO #3#)))))
                #3# (EXIT #1#)))) 

(SDEFUN |OFACET;addVertex;$Nni$;26| ((|sa| $) (|v| |NonNegativeInteger|) ($ $))
        (SPROG ((|f| (|List| (|NonNegativeInteger|))))
               (SEQ (LETT |f| (QCDR |sa|))
                    (LETT |f| (SPADCALL |f| |v| (QREFELT $ 60)))
                    (EXIT (SPADCALL 1 |f| (QREFELT $ 15)))))) 

(SDEFUN |OFACET;refactorIndexes;$Nni$;27|
        ((|a| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|newval| (|List| (|NonNegativeInteger|))) (#1=#:G296 NIL) (|v| NIL)
          (|facet| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |facet| (QCDR |a|)) (LETT |newval| NIL)
              (SEQ (LETT |v| NIL) (LETT #1# |facet|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |newval|
                           (SPADCALL |newval| (+ |v| |n|) (QREFELT $ 60)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (QCAR |a|) |newval|))))) 

(SDEFUN |OFACET;sameFace?;2$B;28| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG ((|vertsb| #1=(|List| (|NonNegativeInteger|))) (|vertsa| #1#))
               (SEQ (LETT |vertsa| (QCDR |a|)) (LETT |vertsb| (QCDR |b|))
                    (EXIT (NULL (SPADCALL |vertsa| |vertsb| (QREFELT $ 84))))))) 

(SDEFUN |OFACET;ltLocal|
        ((|a| |List| (|NonNegativeInteger|))
         (|b| |List| (|NonNegativeInteger|)) ($ |Boolean|))
        (SPROG ((#1=#:G306 NIL) (|b1| #2=(|NonNegativeInteger|)) (|a1| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |a| |b| (QREFELT $ 81))
                    (PROGN (LETT #1# NIL) (GO #3=#:G305))))
                  (COND
                   ((< (SPADCALL |a| (QREFELT $ 37)) 1)
                    (PROGN (LETT #1# 'T) (GO #3#))))
                  (COND
                   ((< (SPADCALL |b| (QREFELT $ 37)) 1)
                    (PROGN (LETT #1# NIL) (GO #3#))))
                  (LETT |a1| (|SPADfirst| |a|)) (LETT |b1| (|SPADfirst| |b|))
                  (COND ((< |a1| |b1|) (PROGN (LETT #1# 'T) (GO #3#))))
                  (COND
                   ((SPADCALL |a1| |b1| (QREFELT $ 14))
                    (PROGN (LETT #1# NIL) (GO #3#))))
                  (COND
                   ((< (SPADCALL |a| (QREFELT $ 37)) 2)
                    (PROGN (LETT #1# 'T) (GO #3#))))
                  (COND
                   ((< (SPADCALL |b| (QREFELT $ 37)) 2)
                    (PROGN (LETT #1# NIL) (GO #3#))))
                  (EXIT (|OFACET;ltLocal| (CDR |a|) (CDR |b|) $))))
                #3# (EXIT #1#)))) 

(SDEFUN |OFACET;<;2$B;30| ((|ain| $) (|bin| $) ($ |Boolean|))
        (SPROG ((|b| #1=(|List| (|NonNegativeInteger|))) (|a| #1#))
               (SEQ (LETT |a| (QCDR |ain|)) (LETT |b| (QCDR |bin|))
                    (EXIT (|OFACET;ltLocal| |a| |b| $))))) 

(SDEFUN |OFACET;<=;2$B;31| ((|ain| $) (|bin| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G311 NIL) (|b| #2=(|List| (|NonNegativeInteger|))) (|a| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |a| (QCDR |ain|)) (LETT |b| (QCDR |bin|))
                (COND
                 ((SPADCALL |a| |b| (QREFELT $ 81))
                  (PROGN (LETT #1# 'T) (GO #3=#:G310))))
                (EXIT (|OFACET;ltLocal| |a| |b| $))))
          #3# (EXIT #1#)))) 

(SDEFUN |OFACET;=;2$B;32| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG ((#1=#:G316 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 88))
                    (PROGN (LETT #1# NIL) (GO #2=#:G315))))
                  (EXIT (SPADCALL (QCDR |a|) (QCDR |b|) (QREFELT $ 81)))))
                #2# (EXIT #1#)))) 

(SDEFUN |OFACET;coerce;$Of;33| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|body| (|OutputForm|)) (|elements| (|List| (|OutputForm|)))
          (#1=#:G324 NIL) (|x| NIL) (#2=#:G323 NIL) (|prefix| (|OutputForm|))
          (|m| (|Integer|)))
         (SEQ (LETT |prefix| (SPADCALL "" (QREFELT $ 91)))
              (LETT |m| (QCAR |s|))
              (COND
               ((SPADCALL (ABS |m|) 1 (QREFELT $ 88))
                (LETT |prefix|
                      (SPADCALL (SPADCALL |m| (QREFELT $ 92))
                                (SPADCALL "*" (QREFELT $ 91))
                                (QREFELT $ 93)))))
              (COND
               ((EQL |m| -1) (LETT |prefix| (SPADCALL "-" (QREFELT $ 91)))))
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
                                  (CONS (SPADCALL |x| (QREFELT $ 94)) #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (LETT |body| (SPADCALL |elements| (QREFELT $ 95)))
              (EXIT (SPADCALL |prefix| |body| (QREFELT $ 93)))))) 

(DECLAIM (NOTINLINE |OrientedFacet;|)) 

(DEFUN |OrientedFacet| ()
  (SPROG NIL
         (PROG (#1=#:G326)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|OrientedFacet|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|OrientedFacet|
                             (LIST (CONS NIL (CONS 1 (|OrientedFacet;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|OrientedFacet|)))))))))) 

(DEFUN |OrientedFacet;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|OrientedFacet|))
          (LETT $ (GETREFV 99))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|OrientedFacet| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |mul| (|Integer|))
                              (|:| |fac| (|List| (|NonNegativeInteger|)))))
          $))) 

(MAKEPROP '|OrientedFacet| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| 10) (0 . |sort|)
              (|Boolean|) (|NonNegativeInteger|) (5 . ~=) (|Integer|)
              (11 . |even?|) (16 . >) |OFACET;orientedFacet;IL$;1|
              (22 . |removeDuplicates|) (|List| 12)
              |OFACET;orientedFacetUnsigned;L$;2|
              |OFACET;orientedFacetSigned;L$;3| (|OrientedFacet|)
              (27 . |getIndexes|) |OFACET;orientedFacet;I2$;4| (|List| $$)
              (32 . |#|) (37 . |sort|) |OFACET;getIndexes;$L;7| (|List| 7)
              (42 . |concat|) (48 . |concat|) (|List| $)
              |OFACET;boundary;$L;13| (54 . |first|) |OFACET;position;$LI;25|
              (59 . <=) (|Union| $ '"failed") |OFACET;orientedFacetIfCan;LU;5|
              (65 . |#|) |OFACET;order;$Nni;6| |OFACET;minIndex;$Nni;8|
              |OFACET;maxIndex;$Nni;9| (70 . |sign|) (75 . |concat|)
              |OFACET;getIndexesSigned;$L;10| |OFACET;getMult;$I;11|
              |OFACET;setMult!;$I$;12| (81 . |remove|) (87 . |concat|)
              (93 . |empty?|) (98 . |member?|) (104 . |empty?|) (109 . |copy|)
              (114 . <=) |OFACET;allSubsets;$NniL;16|
              |OFACET;allSubsets;$2NniL;17| |OFACET;=;2$B;32|
              |OFACET;isSubsetOf?;2$B;18| |OFACET;join;3$;19|
              (120 . |setDifference|) |OFACET;subtract;3$;20| (126 . |concat|)
              (132 . |position|) (138 . |qelt|) |OFACET;reindex;2$;21|
              (|List| 68) |OFACET;boolWordPermute;L2NniL;23|
              |OFACET;boolWordPermute;2NniL;22| (144 . |subtractIfCan|)
              (|List| 9) (150 . |concat|) (156 . |concat|) (162 . |concat|)
              (168 . |elt|) (|Record| (|:| |left| 10) (|:| |right| 10))
              (|List| 73) (174 . |concat|) (|ProductFacet|)
              (180 . |productFacet|) (|List| 76) (186 . |concat|)
              |OFACET;product;2$L;24| (192 . =) |OFACET;addVertex;$Nni$;26|
              |OFACET;refactorIndexes;$Nni$;27| (198 . ~=)
              |OFACET;sameFace?;2$B;28| |OFACET;<;2$B;30| |OFACET;<=;2$B;31|
              (204 . ~=) (|String|) (|OutputForm|) (210 . |message|)
              (215 . |coerce|) (220 . |hconcat|) (226 . |coerce|)
              (231 . |paren|) |OFACET;coerce;$Of;33| (|SingleInteger|)
              (|HashState|))
           '#(~= 236 |subtract| 242 |smaller?| 248 |setMult!| 254 |sameFace?|
              260 |reindex| 266 |refactorIndexes| 271 |product| 277 |position|
              283 |orientedFacetUnsigned| 289 |orientedFacetSigned| 294
              |orientedFacetIfCan| 299 |orientedFacet| 304 |order| 316
              |minIndex| 321 |min| 326 |maxIndex| 332 |max| 337 |latex| 343
              |join| 348 |isSubsetOf?| 354 |hashUpdate!| 360 |hash| 366
              |getMult| 371 |getIndexesSigned| 376 |getIndexes| 381 |empty?|
              386 |coerce| 391 |boundary| 396 |boolWordPermute| 401
              |allSubsets| 414 |addVertex| 427 >= 433 > 439 = 445 <= 451 < 457)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|FacetCategory&| |OrderedSet&| NIL |SetCategory&|
                     |PartialOrder&| |BasicType&| NIL)
                  (CONS
                   '#((|FacetCategory|) (|OrderedSet|) (|Comparable|)
                      (|SetCategory|) (|PartialOrder|) (|BasicType|)
                      (|CoercibleTo| 90))
                   (|makeByteWordVec2| 98
                                       '(1 7 0 0 8 2 10 9 0 0 11 1 12 9 0 13 2
                                         10 9 0 0 14 1 7 0 0 16 1 20 7 0 21 1
                                         23 10 0 24 1 23 0 0 25 2 27 0 0 7 28 2
                                         7 0 0 0 29 1 23 2 0 32 2 12 9 0 0 34 1
                                         7 10 0 37 1 12 12 0 41 2 17 0 0 12 42
                                         2 7 0 10 0 46 2 23 0 0 2 47 1 0 9 0 48
                                         2 23 9 2 0 49 1 23 9 0 50 1 23 0 0 51
                                         2 10 9 0 0 52 2 7 0 0 0 58 2 7 0 0 10
                                         60 2 7 12 10 0 61 2 7 10 0 12 62 2 10
                                         35 0 0 67 2 68 0 0 9 69 2 64 0 0 68 70
                                         2 64 0 0 0 71 2 7 10 0 12 72 2 74 0 0
                                         73 75 2 76 0 12 74 77 2 78 0 0 76 79 2
                                         7 9 0 0 81 2 7 9 0 0 84 2 12 9 0 0 88
                                         1 90 0 89 91 1 12 90 0 92 2 90 0 0 0
                                         93 1 10 90 0 94 1 90 0 30 95 2 0 9 0 0
                                         1 2 0 0 0 0 59 2 0 9 0 0 1 2 0 0 0 12
                                         45 2 0 9 0 0 85 1 0 0 0 63 2 0 0 0 10
                                         83 2 0 78 0 0 80 2 0 12 0 30 33 1 0 0
                                         17 18 1 0 0 17 19 1 0 35 30 36 2 0 0
                                         12 20 22 2 0 0 12 7 15 1 0 10 0 38 1 0
                                         10 0 39 2 0 0 0 0 1 1 0 10 0 40 2 0 0
                                         0 0 1 1 0 89 0 1 2 0 0 0 0 57 2 0 9 0
                                         0 56 2 0 98 98 0 1 1 0 97 0 1 1 0 12 0
                                         44 1 0 17 0 43 1 0 7 0 26 1 0 9 0 48 1
                                         0 90 0 96 1 0 30 0 31 2 0 64 10 10 66
                                         3 0 64 64 10 10 65 3 0 30 0 10 10 54 2
                                         0 30 0 10 53 2 0 0 0 10 82 2 0 9 0 0 1
                                         2 0 9 0 0 1 2 0 9 0 0 55 2 0 9 0 0 87
                                         2 0 9 0 0 86)))))
           '|lookupComplete|)) 

(MAKEPROP '|OrientedFacet| 'NILADIC T) 
