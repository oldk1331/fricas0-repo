
(SDEFUN |OFACET;orientedFacet;IL$;1|
        ((|mul1| |Integer|) (|fac1| |List| (|NonNegativeInteger|)) ($ $))
        (SPROG
         ((|mul2| (|Integer|)) (|diff| (|NonNegativeInteger|)) (#1=#:G139 NIL)
          (|x| NIL) (#2=#:G140 NIL) (|y| NIL)
          (|fac2| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |mul2| |mul1| . #3=(|OFACET;orientedFacet;IL$;1|))
              (LETT |fac2| (SPADCALL |fac1| (QREFELT $ 8)) . #3#)
              (LETT |diff| 0 . #3#)
              (SEQ (LETT |y| NIL . #3#) (LETT #2# |fac2| . #3#)
                   (LETT |x| NIL . #3#) (LETT #1# |fac1| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL)
                         (ATOM #2#) (PROGN (LETT |y| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |x| |y| (QREFELT $ 11))
                       (LETT |diff| (+ |diff| 1) . #3#)))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (COND ((EQL |diff| 1) (|error| "cant construct orientedFacet")))
              (COND
               ((SPADCALL |diff| (QREFELT $ 13))
                (COND
                 ((SPADCALL |diff| 1 (QREFELT $ 14))
                  (LETT |mul2| (- |mul2|) . #3#)))))
              (EXIT (CONS |mul2| |fac2|))))) 

(SDEFUN |OFACET;orientedFacetUnsigned;L$;2| ((|fac1| |List| (|Integer|)) ($ $))
        (SPROG
         ((|lst| (|List| (|NonNegativeInteger|))) (#1=#:G141 NIL)
          (#2=#:G146 NIL) (|x| NIL) (#3=#:G145 NIL))
         (SEQ
          (LETT |lst|
                (PROGN
                 (LETT #3# NIL . #4=(|OFACET;orientedFacetUnsigned;L$;2|))
                 (SEQ (LETT |x| NIL . #4#) (LETT #2# |fac1| . #4#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (PROG1 (LETT #1# (ABS |x|) . #4#)
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               #3#)
                              . #4#)))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #4#)
          (LETT |lst| (SPADCALL |lst| (QREFELT $ 16)) . #4#)
          (EXIT (CONS 1 (SPADCALL |lst| (QREFELT $ 8))))))) 

(SDEFUN |OFACET;orientedFacetSigned;L$;3| ((|fac1| |List| (|Integer|)) ($ $))
        (SPROG
         ((|sig| (|Integer|)) (|lst| (|List| (|NonNegativeInteger|)))
          (#1=#:G147 NIL) (#2=#:G155 NIL) (|x| NIL) (#3=#:G154 NIL))
         (SEQ
          (LETT |lst|
                (PROGN
                 (LETT #3# NIL . #4=(|OFACET;orientedFacetSigned;L$;3|))
                 (SEQ (LETT |x| NIL . #4#) (LETT #2# |fac1| . #4#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (PROG1 (LETT #1# (ABS |x|) . #4#)
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               #3#)
                              . #4#)))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #4#)
          (LETT |lst| (SPADCALL |lst| (QREFELT $ 16)) . #4#)
          (LETT |sig| 1 . #4#)
          (COND
           ((< (LENGTH |fac1|) 1)
            (|error| "attempt to construct empty facet")))
          (COND ((< (|SPADfirst| |fac1|) 0) (LETT |sig| -1 . #4#)))
          (EXIT (CONS |sig| (SPADCALL |lst| (QREFELT $ 8))))))) 

(SDEFUN |OFACET;orientedFacet;I2$;4|
        ((|mul| |Integer|) (|fac1| |OrientedFacet|) ($ $))
        (CONS |mul| (SPADCALL |fac1| (QREFELT $ 21)))) 

(SDEFUN |OFACET;orientedFacet;L$;5| ((|boundary| |List| $) ($ $))
        (SPROG
         ((|mm| (|Integer|)) (#1=#:G173 NIL) (|e| NIL) (#2=#:G172 NIL)
          (|expected| (|List| $)) (|res| ($))
          (|indexes| (|List| (|NonNegativeInteger|))) (#3=#:G171 NIL) (|i| NIL)
          (|indexLst| (|List| (|List| (|NonNegativeInteger|)))) (#4=#:G170 NIL)
          (|subFacet| NIL) (|b| (|List| $)) (|multLst| (|List| (|Integer|))))
         (SEQ (LETT |indexLst| NIL . #5=(|OFACET;orientedFacet;L$;5|))
              (LETT |multLst| NIL . #5#)
              (COND
               ((< (SPADCALL |boundary| (QREFELT $ 24)) 1)
                (|error|
                 "cannot construct orientedFacet from empty boundary")))
              (LETT |b| (SPADCALL |boundary| (QREFELT $ 25)) . #5#)
              (SEQ (LETT |subFacet| NIL . #5#) (LETT #4# |b| . #5#) G190
                   (COND
                    ((OR (ATOM #4#)
                         (PROGN (LETT |subFacet| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |indexLst|
                           (SPADCALL |indexLst|
                                     (SPADCALL |subFacet| (QREFELT $ 26))
                                     (QREFELT $ 28))
                           . #5#)))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |indexes| NIL . #5#)
              (SEQ (LETT |i| NIL . #5#) (LETT #3# |indexLst| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |indexes| (SPADCALL |indexes| |i| (QREFELT $ 29))
                           . #5#)))
                   (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |indexes| (SPADCALL |indexes| (QREFELT $ 16)) . #5#)
              (LETT |indexes| (SPADCALL |indexes| (QREFELT $ 8)) . #5#)
              (LETT |res| (SPADCALL 1 |indexes| (QREFELT $ 15)) . #5#)
              (LETT |expected| (SPADCALL |res| (QREFELT $ 31)) . #5#)
              (LETT |mm|
                    (SPADCALL (SPADCALL |boundary| (QREFELT $ 32)) |expected|
                              (QREFELT $ 33))
                    . #5#)
              (COND
               ((< |mm| 0)
                (SEQ (LETT |res| (SPADCALL -1 |indexes| (QREFELT $ 15)) . #5#)
                     (EXIT
                      (LETT |expected| (SPADCALL |res| (QREFELT $ 31))
                            . #5#)))))
              (SEQ (LETT |e| NIL . #5#) (LETT #2# |expected| . #5#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |mm| (SPADCALL |e| |boundary| (QREFELT $ 33)) . #5#)
                    (EXIT
                     (COND
                      ((SPADCALL |mm| 0 (QREFELT $ 34))
                       (SEQ
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL "orientedFacet:" (QREFELT $ 37))
                                    (SPADCALL |e| (QREFELT $ 38))
                                    (QREFELT $ 39))
                          (SPADCALL
                           (COND ((EQL |mm| 0) "not in provided boundary")
                                 ('T "has opposite orientation"))
                           (QREFELT $ 37))
                          (QREFELT $ 39))
                         (QREFELT $ 41))
                        (EXIT (|error| "Not a boundary of a cell")))))))
                   (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |e| NIL . #5#) (LETT #1# |boundary| . #5#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |mm| (SPADCALL |e| |expected| (QREFELT $ 33)) . #5#)
                    (EXIT
                     (COND
                      ((SPADCALL |mm| 0 (QREFELT $ 34))
                       (SEQ
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL "orientedFacet:" (QREFELT $ 37))
                                    (SPADCALL |e| (QREFELT $ 38))
                                    (QREFELT $ 39))
                          (SPADCALL
                           (COND ((EQL |mm| 0) "not in constructed boundary")
                                 ('T "has opposite orientation"))
                           (QREFELT $ 37))
                          (QREFELT $ 39))
                         (QREFELT $ 41))
                        (EXIT (|error| "Not a boundary of a cell")))))))
                   (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |OFACET;order;$Nni;6| ((|f| $) ($ |NonNegativeInteger|))
        (SPROG ((|facet| (|List| (|NonNegativeInteger|))))
               (SEQ
                (LETT |facet| (SPADCALL |f| (QREFELT $ 26))
                      |OFACET;order;$Nni;6|)
                (EXIT (SPADCALL |facet| (QREFELT $ 43)))))) 

(PUT '|OFACET;getIndexes;$L;7| '|SPADreplace| 'QCDR) 

(SDEFUN |OFACET;getIndexes;$L;7| ((|orf| $) ($ |List| (|NonNegativeInteger|)))
        (QCDR |orf|)) 

(SDEFUN |OFACET;minIndex;$Nni;8| ((|orf| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (#1=#:G180 NIL) (|i| NIL)
          (|inds| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |m| 0 . #2=(|OFACET;minIndex;$Nni;8|))
              (LETT |inds| (SPADCALL |orf| (QREFELT $ 26)) . #2#)
              (SEQ (LETT |i| NIL . #2#) (LETT #1# |inds| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((OR (EQL |m| 0) (< |i| |m|)) (LETT |m| |i| . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |m|)))) 

(SDEFUN |OFACET;maxIndex;$Nni;9| ((|orf| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (#1=#:G184 NIL) (|i| NIL)
          (|inds| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |m| 0 . #2=(|OFACET;maxIndex;$Nni;9|))
              (LETT |inds| (SPADCALL |orf| (QREFELT $ 26)) . #2#)
              (SEQ (LETT |i| NIL . #2#) (LETT #1# |inds| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |i| |m| (QREFELT $ 14))
                       (LETT |m| |i| . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |m|)))) 

(SDEFUN |OFACET;getIndexesSigned;$L;10| ((|orf| $) ($ |List| (|Integer|)))
        (SPROG
         ((|neg| (|Boolean|)) (|res| (|List| (|Integer|))) (|i2| (|Integer|))
          (#1=#:G190 NIL) (|i| NIL))
         (SEQ (LETT |res| NIL . #2=(|OFACET;getIndexesSigned;$L;10|))
              (LETT |neg| (EQL (SPADCALL (QCAR |orf|) (QREFELT $ 47)) -1)
                    . #2#)
              (SEQ (LETT |i| NIL . #2#) (LETT #1# (QCDR |orf|) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |i2| (COND (|neg| (- |i|)) ('T |i|)) . #2#)
                        (LETT |res| (SPADCALL |res| |i2| (QREFELT $ 48)) . #2#)
                        (EXIT (LETT |neg| (NULL |neg|) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(PUT '|OFACET;getMult;$I;11| '|SPADreplace| 'QCAR) 

(SDEFUN |OFACET;getMult;$I;11| ((|orf| $) ($ |Integer|)) (QCAR |orf|)) 

(SDEFUN |OFACET;setMult!;$I$;12| ((|orf| $) (|m| |Integer|) ($ $))
        (SEQ (PROGN (RPLACA |orf| |m|) (QCAR |orf|)) (EXIT |orf|))) 

(SDEFUN |OFACET;delta;$L;13| ((|orf| $) ($ |List| $))
        (SPROG
         ((|res| (|List| $)) (|r1| ($)) (|even| (|Boolean|))
          (|m| #1=(|Integer|)) (|r| (|List| (|NonNegativeInteger|)))
          (#2=#:G198 NIL) (|x| NIL) (|mult| #1#)
          (|revFacet| (|List| (|NonNegativeInteger|)))
          (|facet| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |facet| (QCDR |orf|) . #3=(|OFACET;delta;$L;13|))
              (LETT |revFacet| (REVERSE |facet|) . #3#)
              (LETT |mult| (QCAR |orf|) . #3#) (LETT |res| NIL . #3#)
              (LETT |even| NIL . #3#)
              (SEQ (LETT |x| NIL . #3#) (LETT #2# |revFacet| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |r| (SPADCALL |x| |facet| (QREFELT $ 52)) . #3#)
                        (LETT |m| (COND (|even| (- |mult|)) ('T |mult|)) . #3#)
                        (LETT |even| (NULL |even|) . #3#)
                        (LETT |r1| (SPADCALL |m| |r| (QREFELT $ 15)) . #3#)
                        (EXIT
                         (LETT |res| (SPADCALL |res| |r1| (QREFELT $ 53))
                               . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |OFACET;addIfNew| ((|lst| |List| $) (|orf| $) ($ |List| $))
        (SPROG ((#1=#:G203 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((NULL (SPADCALL |orf| (QREFELT $ 54)))
                    (COND
                     ((SPADCALL |orf| |lst| (QREFELT $ 55))
                      (PROGN
                       (LETT #1# |lst| |OFACET;addIfNew|)
                       (GO #2=#:G202))))))
                  (EXIT (SPADCALL |lst| |orf| (QREFELT $ 53)))))
                #2# (EXIT #1#)))) 

(SDEFUN |OFACET;addIfNew2| ((|lst| |List| $) (|orfs| |List| $) ($ |List| $))
        (SPROG ((|res| (|List| $)) (#1=#:G211 NIL) (|orf| NIL) (#2=#:G210 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |orfs| (QREFELT $ 56))
                    (PROGN
                     (LETT #2# |lst| . #3=(|OFACET;addIfNew2|))
                     (GO #4=#:G209))))
                  (LETT |res| (SPADCALL |lst| (QREFELT $ 57)) . #3#)
                  (SEQ (LETT |orf| NIL . #3#) (LETT #1# |orfs| . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |orf| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |orf| (QREFELT $ 54)))
                           (COND
                            ((NULL (SPADCALL |orf| |res| (QREFELT $ 55)))
                             (LETT |res| (SPADCALL |res| |orf| (QREFELT $ 53))
                                   . #3#)))))))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))
                #4# (EXIT #2#)))) 

(SDEFUN |OFACET;allSubsets;$NniL;16|
        ((|orf| $) (|minDim| |NonNegativeInteger|) ($ |List| $))
        (SPROG
         ((|res| (|List| $)) (|sub| (|List| $)) (|r1| ($))
          (|r| (|List| (|NonNegativeInteger|))) (#1=#:G220 NIL) (|x| NIL)
          (#2=#:G219 NIL) (|mult| (|Integer|))
          (|facet| (|List| (|NonNegativeInteger|))))
         (SEQ
          (EXIT
           (SEQ (LETT |facet| (QCDR |orf|) . #3=(|OFACET;allSubsets;$NniL;16|))
                (LETT |mult| (QCAR |orf|) . #3#) (LETT |res| NIL . #3#)
                (COND
                 ((SPADCALL (SPADCALL |orf| (QREFELT $ 44)) |minDim|
                            (QREFELT $ 58))
                  (PROGN (LETT #2# |res| . #3#) (GO #4=#:G218))))
                (SEQ (LETT |x| NIL . #3#) (LETT #1# |facet| . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |r| (SPADCALL |x| |facet| (QREFELT $ 52)) . #3#)
                      (LETT |r1| (SPADCALL 1 |r| (QREFELT $ 15)) . #3#)
                      (LETT |res| (|OFACET;addIfNew| |res| |r1| $) . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |r1| (QREFELT $ 44)) |minDim|
                                   (QREFELT $ 14))
                         (SEQ
                          (LETT |sub| (SPADCALL |r1| |minDim| (QREFELT $ 59))
                                . #3#)
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |sub| (QREFELT $ 56)))
                             (LETT |res| (|OFACET;addIfNew2| |res| |sub| $)
                                   . #3#)))))))))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #4# (EXIT #2#)))) 

(SDEFUN |OFACET;allSubsets;$2NniL;17|
        ((|orf| $) (|minDim| |NonNegativeInteger|)
         (|maxDim| |NonNegativeInteger|) ($ |List| $))
        (SPROG
         ((|res2| (|List| $)) (#1=#:G226 NIL) (|y| NIL) (|res| (|List| $)))
         (SEQ
          (LETT |res| (SPADCALL |orf| |minDim| (QREFELT $ 59))
                . #2=(|OFACET;allSubsets;$2NniL;17|))
          (LETT |res2| NIL . #2#)
          (SEQ (LETT |y| NIL . #2#) (LETT #1# |res| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |y| (QREFELT $ 44)) |maxDim|
                             (QREFELT $ 58))
                   (LETT |res2| (SPADCALL |res2| |y| (QREFELT $ 53)) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res2|)))) 

(SDEFUN |OFACET;isSubsetOf?;2$B;18| ((|sa| $) (|sb| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G230 NIL) (#2=#:G231 NIL) (|vertex| NIL) (|all| (|List| $)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |all| (SPADCALL |sb| 1 (QREFELT $ 59))
                  . #3=(|OFACET;isSubsetOf?;2$B;18|))
            (SEQ (LETT |vertex| NIL . #3#) (LETT #2# |all| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |vertex| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |vertex| |sa| (QREFELT $ 61))
                     (PROGN (LETT #1# 'T . #3#) (GO #4=#:G229))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #4# (EXIT #1#)))) 

(SDEFUN |OFACET;subtract;3$;19| ((|sa| $) (|sb| $) ($ $))
        (SPROG ((|lst| (|List| (|NonNegativeInteger|))))
               (SEQ
                (LETT |lst| (SPADCALL (QCDR |sb|) (QCDR |sa|) (QREFELT $ 63))
                      |OFACET;subtract;3$;19|)
                (EXIT (CONS 1 |lst|))))) 

(SDEFUN |OFACET;reindex;2$;20| ((|sa| $) ($ $))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|))) (|ptr| (|Integer|))
          (#1=#:G241 NIL) (|v| NIL) (|i| (|NonNegativeInteger|))
          (|newval| (|List| (|NonNegativeInteger|)))
          (|oldval| (|List| (|NonNegativeInteger|))) (#2=#:G240 NIL)
          (|facet| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |facet| (QCDR |sa|) . #3=(|OFACET;reindex;2$;20|))
              (LETT |oldval| NIL . #3#) (LETT |newval| NIL . #3#)
              (LETT |i| 1 . #3#)
              (SEQ (LETT |v| NIL . #3#) (LETT #2# |facet| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |oldval| (SPADCALL |oldval| |v| (QREFELT $ 65))
                          . #3#)
                    (LETT |newval| (SPADCALL |newval| |i| (QREFELT $ 65))
                          . #3#)
                    (EXIT (LETT |i| (+ |i| 1) . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |res| NIL . #3#)
              (SEQ (LETT |v| NIL . #3#) (LETT #1# |facet| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ptr| (SPADCALL |v| |oldval| (QREFELT $ 66)) . #3#)
                    (COND ((< |ptr| 1) (|error| "error in reindex")))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL |newval| |ptr| (QREFELT $ 67))
                                     (QREFELT $ 65))
                           . #3#)))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 1 |res|))))) 

(SDEFUN |OFACET;boolWordPermute;2NniL;21|
        ((|numZeros| |NonNegativeInteger|) (|numOnes| |NonNegativeInteger|)
         ($ |List| (|List| (|Boolean|))))
        (SPADCALL NIL |numZeros| |numOnes| (QREFELT $ 70))) 

(SDEFUN |OFACET;boolWordPermute;L2NniL;22|
        ((|wordIn| |List| (|List| (|Boolean|)))
         (|numZeros| |NonNegativeInteger|) (|numOnes| |NonNegativeInteger|)
         ($ |List| (|List| (|Boolean|))))
        (SPROG
         ((|res| (|List| (|List| (|Boolean|))))
          (|word1| (|List| (|List| (|Boolean|))))
          (|subWord| (|List| (|Boolean|))) (#1=#:G258 NIL) (|x| NIL)
          (|z| (|NonNegativeInteger|)) (#2=#:G244 NIL)
          (|word0| (|List| (|List| (|Boolean|)))) (#3=#:G257 NIL)
          (#4=#:G256 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< |numZeros| 1)
              (COND
               ((< |numOnes| 1)
                (PROGN
                 (LETT #4# |wordIn| . #5=(|OFACET;boolWordPermute;L2NniL;22|))
                 (GO #6=#:G255))))))
            (LETT |res| NIL . #5#)
            (COND
             ((SPADCALL |numZeros| 0 (QREFELT $ 14))
              (SEQ
               (LETT |z|
                     (PROG2
                         (LETT #2# (SPADCALL |numZeros| 1 (QREFELT $ 73))
                               . #5#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                       (|Union| (|NonNegativeInteger|)
                                                #7="failed")
                                       #2#))
                     . #5#)
               (LETT |word0| NIL . #5#)
               (COND ((NULL |wordIn|) (LETT |word0| (LIST (LIST NIL)) . #5#)))
               (SEQ (LETT |x| NIL . #5#) (LETT #3# |wordIn| . #5#) G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (LETT |subWord| (SPADCALL |x| NIL (QREFELT $ 75)) . #5#)
                     (EXIT
                      (LETT |word0| (SPADCALL |word0| |subWord| (QREFELT $ 76))
                            . #5#)))
                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
               (EXIT
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL |word0| |z| |numOnes| (QREFELT $ 70))
                                (QREFELT $ 77))
                      . #5#)))))
            (COND
             ((SPADCALL |numOnes| 0 (QREFELT $ 14))
              (SEQ
               (LETT |z|
                     (PROG2
                         (LETT #2# (SPADCALL |numOnes| 1 (QREFELT $ 73)) . #5#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                       (|Union| (|NonNegativeInteger|) #7#)
                                       #2#))
                     . #5#)
               (LETT |word1| NIL . #5#)
               (COND ((NULL |wordIn|) (LETT |word1| (LIST (LIST 'T)) . #5#)))
               (SEQ (LETT |x| NIL . #5#) (LETT #1# |wordIn| . #5#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (LETT |subWord| (SPADCALL |x| 'T (QREFELT $ 75)) . #5#)
                     (EXIT
                      (LETT |word1| (SPADCALL |word1| |subWord| (QREFELT $ 76))
                            . #5#)))
                    (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
               (EXIT
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL |word1| |numZeros| |z|
                                          (QREFELT $ 70))
                                (QREFELT $ 77))
                      . #5#)))))
            (EXIT |res|)))
          #6# (EXIT #4#)))) 

(SDEFUN |OFACET;product;2$L;23| ((|a| $) (|b| $) ($ |List| (|ProductFacet|)))
        (SPROG
         ((|res| (|List| (|ProductFacet|))) (|pf| (|ProductFacet|))
          (|i2|
           (|List|
            #1=(|Record| (|:| |left| (|NonNegativeInteger|))
                         (|:| |right| (|NonNegativeInteger|)))))
          (|i| #1#) (|leftIndex| #2=(|NonNegativeInteger|)) (|rightIndex| #2#)
          (#3=#:G273 NIL) (#4=#:G272 NIL) (|perm| NIL)
          (|perms| (|List| (|List| (|Boolean|))))
          (|lenB| (|NonNegativeInteger|)) (#5=#:G260 NIL)
          (|lenA| (|NonNegativeInteger|))
          (|indB| #6=(|List| (|NonNegativeInteger|))) (|indA| #6#))
         (SEQ (LETT |res| NIL . #7=(|OFACET;product;2$L;23|))
              (LETT |indA| (SPADCALL |a| (QREFELT $ 26)) . #7#)
              (LETT |indB| (SPADCALL |b| (QREFELT $ 26)) . #7#)
              (LETT |lenA|
                    (PROG2
                        (LETT #5#
                              (SPADCALL (SPADCALL |indA| (QREFELT $ 43)) 1
                                        (QREFELT $ 73))
                              . #7#)
                        (QCDR #5#)
                      (|check_union2| (QEQCAR #5# 0) (|NonNegativeInteger|)
                                      (|Union| (|NonNegativeInteger|)
                                               #8="failed")
                                      #5#))
                    . #7#)
              (LETT |lenB|
                    (PROG2
                        (LETT #5#
                              (SPADCALL (SPADCALL |indB| (QREFELT $ 43)) 1
                                        (QREFELT $ 73))
                              . #7#)
                        (QCDR #5#)
                      (|check_union2| (QEQCAR #5# 0) (|NonNegativeInteger|)
                                      (|Union| (|NonNegativeInteger|) #8#)
                                      #5#))
                    . #7#)
              (LETT |perms| (REVERSE (SPADCALL |lenA| |lenB| (QREFELT $ 71)))
                    . #7#)
              (SEQ (LETT |perm| NIL . #7#) (LETT #4# |perms| . #7#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |perm| (CAR #4#) . #7#) NIL))
                     (GO G191)))
                   (SEQ (LETT |leftIndex| 1 . #7#) (LETT |rightIndex| 1 . #7#)
                        (LETT |i|
                              (CONS
                               (SPADCALL |indA| |leftIndex| (QREFELT $ 78))
                               (SPADCALL |indB| |rightIndex| (QREFELT $ 78)))
                              . #7#)
                        (LETT |i2| (LIST |i|) . #7#)
                        (SEQ (LETT |b| NIL . #7#) (LETT #3# |perm| . #7#) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |b| (CAR #3#) . #7#) NIL))
                               (GO G191)))
                             (SEQ
                              (COND
                               (|b|
                                (LETT |rightIndex| (+ |rightIndex| 1) . #7#))
                               ('T (LETT |leftIndex| (+ |leftIndex| 1) . #7#)))
                              (COND
                               ((SPADCALL |leftIndex|
                                          (SPADCALL |indA| (QREFELT $ 43))
                                          (QREFELT $ 14))
                                (|error| "leftIndex too high in product")))
                              (COND
                               ((SPADCALL |rightIndex|
                                          (SPADCALL |indB| (QREFELT $ 43))
                                          (QREFELT $ 14))
                                (|error| "rightIndex too high in product")))
                              (LETT |i|
                                    (CONS
                                     (SPADCALL |indA| |leftIndex|
                                               (QREFELT $ 78))
                                     (SPADCALL |indB| |rightIndex|
                                               (QREFELT $ 78)))
                                    . #7#)
                              (EXIT
                               (LETT |i2| (SPADCALL |i2| |i| (QREFELT $ 81))
                                     . #7#)))
                             (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |pf| (SPADCALL 1 |i2| (QREFELT $ 83)) . #7#)
                        (EXIT
                         (LETT |res| (SPADCALL |res| |pf| (QREFELT $ 85))
                               . #7#)))
                   (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |OFACET;position;$LI;24| ((|e| $) (|lst| |List| $) ($ |Integer|))
        (SPROG ((#1=#:G282 NIL) (|res| (|Integer|)) (#2=#:G283 NIL) (|x| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |res| 1 . #3=(|OFACET;position;$LI;24|))
                      (SEQ (LETT |x| NIL . #3#) (LETT #2# |lst| . #3#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL (QCDR |e|) (QCDR |x|) (QREFELT $ 87))
                              (SEQ
                               (COND
                                ((EQL (QCAR |e|) (QCAR |x|))
                                 (PROGN
                                  (LETT #1# |res| . #3#)
                                  (GO #4=#:G281))))
                               (EXIT
                                (PROGN (LETT #1# (- |res|) . #3#) (GO #4#))))))
                            (EXIT (LETT |res| (+ |res| 1) . #3#)))
                           (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (PROGN (LETT #1# 0 . #3#) (GO #4#)))))
                #4# (EXIT #1#)))) 

(SDEFUN |OFACET;addVertex;$Nni$;25| ((|sa| $) (|v| |NonNegativeInteger|) ($ $))
        (SPROG ((|f| (|List| (|NonNegativeInteger|))))
               (SEQ (LETT |f| (QCDR |sa|) . #1=(|OFACET;addVertex;$Nni$;25|))
                    (LETT |f| (SPADCALL |f| |v| (QREFELT $ 65)) . #1#)
                    (EXIT (SPADCALL 1 |f| (QREFELT $ 15)))))) 

(SDEFUN |OFACET;sameFace?;2$B;26| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG ((|vertsb| #1=(|List| (|NonNegativeInteger|))) (|vertsa| #1#))
               (SEQ (LETT |vertsa| (QCDR |a|) . #2=(|OFACET;sameFace?;2$B;26|))
                    (LETT |vertsb| (QCDR |b|) . #2#)
                    (EXIT (NULL (SPADCALL |vertsa| |vertsb| (QREFELT $ 89))))))) 

(SDEFUN |OFACET;ltLocal|
        ((|a| |List| (|NonNegativeInteger|))
         (|b| |List| (|NonNegativeInteger|)) ($ |Boolean|))
        (SPROG ((#1=#:G295 NIL) (|b1| #2=(|NonNegativeInteger|)) (|a1| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |a| |b| (QREFELT $ 87))
                    (PROGN
                     (LETT #1# NIL . #3=(|OFACET;ltLocal|))
                     (GO #4=#:G294))))
                  (COND
                   ((< (SPADCALL |a| (QREFELT $ 43)) 1)
                    (PROGN (LETT #1# 'T . #3#) (GO #4#))))
                  (COND
                   ((< (SPADCALL |b| (QREFELT $ 43)) 1)
                    (PROGN (LETT #1# NIL . #3#) (GO #4#))))
                  (LETT |a1| (|SPADfirst| |a|) . #3#)
                  (LETT |b1| (|SPADfirst| |b|) . #3#)
                  (COND ((< |a1| |b1|) (PROGN (LETT #1# 'T . #3#) (GO #4#))))
                  (COND
                   ((SPADCALL |a1| |b1| (QREFELT $ 14))
                    (PROGN (LETT #1# NIL . #3#) (GO #4#))))
                  (COND
                   ((< (SPADCALL |a| (QREFELT $ 43)) 2)
                    (PROGN (LETT #1# 'T . #3#) (GO #4#))))
                  (COND
                   ((< (SPADCALL |b| (QREFELT $ 43)) 2)
                    (PROGN (LETT #1# NIL . #3#) (GO #4#))))
                  (EXIT (|OFACET;ltLocal| (CDR |a|) (CDR |b|) $))))
                #4# (EXIT #1#)))) 

(SDEFUN |OFACET;<;2$B;28| ((|ain| $) (|bin| $) ($ |Boolean|))
        (SPROG ((|b| #1=(|List| (|NonNegativeInteger|))) (|a| #1#))
               (SEQ (LETT |a| (QCDR |ain|) . #2=(|OFACET;<;2$B;28|))
                    (LETT |b| (QCDR |bin|) . #2#)
                    (EXIT (|OFACET;ltLocal| |a| |b| $))))) 

(SDEFUN |OFACET;<=;2$B;29| ((|ain| $) (|bin| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G300 NIL) (|b| #2=(|List| (|NonNegativeInteger|))) (|a| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |a| (QCDR |ain|) . #3=(|OFACET;<=;2$B;29|))
                (LETT |b| (QCDR |bin|) . #3#)
                (COND
                 ((SPADCALL |a| |b| (QREFELT $ 87))
                  (PROGN (LETT #1# 'T . #3#) (GO #4=#:G299))))
                (EXIT (|OFACET;ltLocal| |a| |b| $))))
          #4# (EXIT #1#)))) 

(SDEFUN |OFACET;=;2$B;30| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG ((#1=#:G305 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 93))
                    (PROGN (LETT #1# NIL |OFACET;=;2$B;30|) (GO #2=#:G304))))
                  (EXIT (SPADCALL (QCDR |a|) (QCDR |b|) (QREFELT $ 87)))))
                #2# (EXIT #1#)))) 

(SDEFUN |OFACET;coerce;$Of;31| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|body| (|OutputForm|)) (|elements| (|List| (|OutputForm|)))
          (#1=#:G313 NIL) (|x| NIL) (#2=#:G312 NIL) (|prefix| (|OutputForm|))
          (|m| (|Integer|)))
         (SEQ
          (LETT |prefix| (SPADCALL "" (QREFELT $ 37))
                . #3=(|OFACET;coerce;$Of;31|))
          (LETT |m| (QCAR |s|) . #3#)
          (COND
           ((SPADCALL (ABS |m|) 1 (QREFELT $ 93))
            (LETT |prefix|
                  (SPADCALL (SPADCALL |m| (QREFELT $ 94))
                            (SPADCALL "*" (QREFELT $ 37)) (QREFELT $ 39))
                  . #3#)))
          (COND
           ((EQL |m| -1) (LETT |prefix| (SPADCALL "-" (QREFELT $ 37)) . #3#)))
          (LETT |elements|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |x| NIL . #3#) (LETT #1# (QCDR |s|) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 95)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (LETT |body| (SPADCALL |elements| (QREFELT $ 96)) . #3#)
          (EXIT (SPADCALL |prefix| |body| (QREFELT $ 39)))))) 

(DECLAIM (NOTINLINE |OrientedFacet;|)) 

(DEFUN |OrientedFacet| ()
  (SPROG NIL
         (PROG (#1=#:G315)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|OrientedFacet|)
                    . #2=(|OrientedFacet|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|OrientedFacet|
                             (LIST (CONS NIL (CONS 1 (|OrientedFacet;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|OrientedFacet|)))))))))) 

(DEFUN |OrientedFacet;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|OrientedFacet|) . #1=(|OrientedFacet|))
          (LETT $ (GETREFV 99) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
              (42 . |concat|) (48 . |concat|) (|List| $) |OFACET;delta;$L;13|
              (54 . |first|) |OFACET;position;$LI;24| (59 . <=) (|String|)
              (|OutputForm|) (65 . |message|) |OFACET;coerce;$Of;31|
              (70 . |hconcat|) (|Void|) (76 . |print|)
              |OFACET;orientedFacet;L$;5| (81 . |#|) |OFACET;order;$Nni;6|
              |OFACET;minIndex;$Nni;8| |OFACET;maxIndex;$Nni;9| (86 . |sign|)
              (91 . |concat|) |OFACET;getIndexesSigned;$L;10|
              |OFACET;getMult;$I;11| |OFACET;setMult!;$I$;12| (97 . |remove|)
              (103 . |concat|) (109 . |empty?|) (114 . |member?|)
              (120 . |empty?|) (125 . |copy|) (130 . <=)
              |OFACET;allSubsets;$NniL;16| |OFACET;allSubsets;$2NniL;17|
              |OFACET;=;2$B;30| |OFACET;isSubsetOf?;2$B;18|
              (136 . |setDifference|) |OFACET;subtract;3$;19| (142 . |concat|)
              (148 . |position|) (154 . |qelt|) |OFACET;reindex;2$;20|
              (|List| 74) |OFACET;boolWordPermute;L2NniL;22|
              |OFACET;boolWordPermute;2NniL;21| (|Union| $ '"failed")
              (160 . |subtractIfCan|) (|List| 9) (166 . |concat|)
              (172 . |concat|) (178 . |concat|) (184 . |elt|)
              (|Record| (|:| |left| 10) (|:| |right| 10)) (|List| 79)
              (190 . |concat|) (|ProductFacet|) (196 . |productFacet|)
              (|List| 82) (202 . |concat|) |OFACET;product;2$L;23| (208 . =)
              |OFACET;addVertex;$Nni$;25| (214 . ~=) |OFACET;sameFace?;2$B;26|
              |OFACET;<;2$B;28| |OFACET;<=;2$B;29| (220 . ~=) (226 . |coerce|)
              (231 . |coerce|) (236 . |paren|) (|SingleInteger|) (|HashState|))
           '#(~= 241 |subtract| 247 |smaller?| 253 |setMult!| 259 |sameFace?|
              265 |reindex| 271 |product| 276 |position| 282
              |orientedFacetUnsigned| 288 |orientedFacetSigned| 293
              |orientedFacet| 298 |order| 315 |minIndex| 320 |min| 325
              |maxIndex| 331 |max| 336 |latex| 342 |isSubsetOf?| 347
              |hashUpdate!| 353 |hash| 359 |getMult| 364 |getIndexesSigned| 369
              |getIndexes| 374 |empty?| 379 |delta| 384 |coerce| 389
              |boolWordPermute| 394 |allSubsets| 407 |addVertex| 420 >= 426 >
              432 = 438 <= 444 < 450)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|FacetCategory&| |OrderedSet&| NIL |SetCategory&|
                     |PartialOrder&| |BasicType&| NIL)
                  (CONS
                   '#((|FacetCategory|) (|OrderedSet|) (|Comparable|)
                      (|SetCategory|) (|PartialOrder|) (|BasicType|)
                      (|CoercibleTo| 36))
                   (|makeByteWordVec2| 98
                                       '(1 7 0 0 8 2 10 9 0 0 11 1 12 9 0 13 2
                                         10 9 0 0 14 1 7 0 0 16 1 20 7 0 21 1
                                         23 10 0 24 1 23 0 0 25 2 27 0 0 7 28 2
                                         7 0 0 0 29 1 23 2 0 32 2 12 9 0 0 34 1
                                         36 0 35 37 2 36 0 0 0 39 1 36 40 0 41
                                         1 7 10 0 43 1 12 12 0 47 2 17 0 0 12
                                         48 2 7 0 10 0 52 2 23 0 0 2 53 1 0 9 0
                                         54 2 23 9 2 0 55 1 23 9 0 56 1 23 0 0
                                         57 2 10 9 0 0 58 2 7 0 0 0 63 2 7 0 0
                                         10 65 2 7 12 10 0 66 2 7 10 0 12 67 2
                                         10 72 0 0 73 2 74 0 0 9 75 2 69 0 0 74
                                         76 2 69 0 0 0 77 2 7 10 0 12 78 2 80 0
                                         0 79 81 2 82 0 12 80 83 2 84 0 0 82 85
                                         2 7 9 0 0 87 2 7 9 0 0 89 2 12 9 0 0
                                         93 1 12 36 0 94 1 10 36 0 95 1 36 0 30
                                         96 2 0 9 0 0 1 2 0 0 0 0 64 2 0 9 0 0
                                         1 2 0 0 0 12 51 2 0 9 0 0 90 1 0 0 0
                                         68 2 0 84 0 0 86 2 0 12 0 30 33 1 0 0
                                         17 18 1 0 0 17 19 2 0 0 12 20 22 1 0 0
                                         30 42 2 0 0 12 7 15 1 0 10 0 44 1 0 10
                                         0 45 2 0 0 0 0 1 1 0 10 0 46 2 0 0 0 0
                                         1 1 0 35 0 1 2 0 9 0 0 62 2 0 98 98 0
                                         1 1 0 97 0 1 1 0 12 0 50 1 0 17 0 49 1
                                         0 7 0 26 1 0 9 0 54 1 0 30 0 31 1 0 36
                                         0 38 2 0 69 10 10 71 3 0 69 69 10 10
                                         70 2 0 30 0 10 59 3 0 30 0 10 10 60 2
                                         0 0 0 10 88 2 0 9 0 0 1 2 0 9 0 0 1 2
                                         0 9 0 0 61 2 0 9 0 0 92 2 0 9 0 0
                                         91)))))
           '|lookupComplete|)) 

(MAKEPROP '|OrientedFacet| 'NILADIC T) 
