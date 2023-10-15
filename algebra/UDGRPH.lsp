
(PUT '|UDGRPH;isDirected?;B;1| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |UDGRPH;isDirected?;B;1| (($ |Boolean|)) NIL) 

(SDEFUN |UDGRPH;undirectedGraph;L$;2| ((|ob| |List| S) ($ $))
        (SPROG
         ((|objs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#1=#:G130 NIL) (|x| NIL) (#2=#:G129 NIL))
         (SEQ
          (LETT |objs|
                (PROGN
                 (LETT #2# NIL . #3=(|UDGRPH;undirectedGraph;L$;2|))
                 (SEQ (LETT |x| NIL . #3#) (LETT #1# |ob| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (VECTOR |x| 0 0) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (CONS |objs| NIL))))) 

(PUT '|UDGRPH;undirectedGraph;L$;3| '|SPADreplace|
     '(XLAM (|ob|) (CONS |ob| NIL))) 

(SDEFUN |UDGRPH;undirectedGraph;L$;3|
        ((|ob| |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|))))
         ($ $))
        (CONS |ob| NIL)) 

(PUT '|UDGRPH;undirectedGraph;LL$;4| '|SPADreplace| 'CONS) 

(SDEFUN |UDGRPH;undirectedGraph;LL$;4|
        ((|ob| |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|))))
         (|ar| |List|
          (|Record| (|:| |name| (|String|))
                    (|:| |arrType| (|NonNegativeInteger|))
                    (|:| |fromOb| (|NonNegativeInteger|))
                    (|:| |toOb| (|NonNegativeInteger|))
                    (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                    (|:| |map| (|List| (|NonNegativeInteger|)))))
         ($ $))
        (CONS |ob| |ar|)) 

(SDEFUN |UDGRPH;undirectedGraph;LL$;5|
        ((|objs| |List| S) (|am| |List| (|List| (|NonNegativeInteger|))) ($ $))
        (SPROG
         ((|ar|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (#2=#:G154 NIL) (|j| NIL) (#3=#:G153 NIL) (|i| NIL)
          (|obs|
           (|List|
            #4=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #4#) (|ob| (S)) (#5=#:G152 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #6=(|UDGRPH;undirectedGraph;LL$;5|))
              (SEQ (LETT |obn| 1 . #6#) (LETT #5# (LENGTH |objs|) . #6#) G190
                   (COND ((|greater_SI| |obn| #5#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 19)) . #6#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 21))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 22)))
                          . #6#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 23)) . #6#)))
                   (LETT |obn| (|inc_SI| |obn|) . #6#) (GO G190) G191
                   (EXIT NIL))
              (LETT |ar| NIL . #6#)
              (SEQ (LETT |i| 1 . #6#) (LETT #3# (LENGTH |am|) . #6#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #6#)
                          (LETT #2#
                                (SPADCALL (SPADCALL |am| |i| (QREFELT $ 26))
                                          (QREFELT $ 27))
                                . #6#)
                          G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((EQL
                               (SPADCALL (SPADCALL |am| |i| (QREFELT $ 26)) |j|
                                         (QREFELT $ 28))
                               1)
                              (SEQ
                               (LETT |a| (VECTOR "a" 0 |i| |j| 0 0 NIL) . #6#)
                               (EXIT
                                (LETT |ar| (SPADCALL |ar| |a| (QREFELT $ 29))
                                      . #6#)))))))
                          (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ar|))))) 

(SDEFUN |UDGRPH;addObject!;$S$;6| ((|s| $) (|n| S) ($ $))
        (SPROG
         ((|obj|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |obs| (QCAR |s|) . #1=(|UDGRPH;addObject!;$S$;6|))
              (LETT |obj| (VECTOR |n| 0 0) . #1#)
              (COND
               ((SPADCALL |obs| NIL (QREFELT $ 31))
                (PROGN (RPLACA |s| (LIST |obj|)) (QCAR |s|)))
               ('T
                (PROGN
                 (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT $ 23)))
                 (QCAR |s|))))
              (EXIT |s|)))) 

(SDEFUN |UDGRPH;addObject!;$R$;7|
        ((|s| $)
         (|n| |Record| (|:| |value| S)
          (|:| |posX| . #1=((|NonNegativeInteger|))) (|:| |posY| . #1#))
         ($ $))
        (SPROG
         ((|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |obs| (QCAR |s|) |UDGRPH;addObject!;$R$;7|)
              (COND
               ((SPADCALL |obs| NIL (QREFELT $ 31))
                (PROGN (RPLACA |s| (LIST |n|)) (QCAR |s|)))
               ('T
                (PROGN
                 (RPLACA |s| (SPADCALL |obs| |n| (QREFELT $ 23)))
                 (QCAR |s|))))
              (EXIT |s|)))) 

(SDEFUN |UDGRPH;addArrow!;$S2Nni$;8|
        ((|s| $) (|nm| |String|) (|n1| . #1=(|NonNegativeInteger|))
         (|n2| . #1#) ($ $))
        (SPROG
         ((#2=#:G172 NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|arrss|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ
          (EXIT
           (SEQ (LETT |arrss| (QCDR |s|) . #3=(|UDGRPH;addArrow!;$S2Nni$;8|))
                (LETT |a| (VECTOR |nm| 0 |n1| |n2| 0 0 NIL) . #3#)
                (EXIT
                 (COND
                  ((SPADCALL |arrss| NIL (QREFELT $ 34))
                   (SEQ (PROGN (RPLACD |s| (LIST |a|)) (QCDR |s|))
                        (EXIT (PROGN (LETT #2# |s| . #3#) (GO #4=#:G171)))))
                  ('T
                   (SEQ
                    (LETT |arrs| (SPADCALL |arrss| |a| (QREFELT $ 29)) . #3#)
                    (PROGN (RPLACD |s| |arrs|) (QCDR |s|))
                    (EXIT (PROGN (LETT #2# |s| . #3#) (GO #4#)))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |UDGRPH;addArrow!;$S2NniL$;9|
        ((|s| $) (|nm| |String|) (|n1| . #1=(|NonNegativeInteger|))
         (|n2| . #1#) (|mp| |List| #1#) ($ $))
        (SPROG
         ((#2=#:G180 NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|arrss|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ
          (EXIT
           (SEQ (LETT |arrss| (QCDR |s|) . #3=(|UDGRPH;addArrow!;$S2NniL$;9|))
                (LETT |a| (VECTOR |nm| 0 |n1| |n2| 0 0 |mp|) . #3#)
                (EXIT
                 (COND
                  ((SPADCALL |arrss| NIL (QREFELT $ 34))
                   (SEQ (PROGN (RPLACD |s| (LIST |a|)) (QCDR |s|))
                        (EXIT (PROGN (LETT #2# |s| . #3#) (GO #4=#:G179)))))
                  ('T
                   (SEQ
                    (LETT |arrs| (SPADCALL |arrss| |a| (QREFELT $ 29)) . #3#)
                    (PROGN (RPLACD |s| |arrs|) (QCDR |s|))
                    (EXIT (PROGN (LETT #2# |s| . #3#) (GO #4#)))))))))
          #4# (EXIT #2#)))) 

(PUT '|UDGRPH;getVertices;$L;10| '|SPADreplace| 'QCAR) 

(SDEFUN |UDGRPH;getVertices;$L;10|
        ((|s| $)
         ($ |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)))))
        (QCAR |s|)) 

(SDEFUN |UDGRPH;getArrows;$L;11|
        ((|s| $)
         ($ |List|
          #1=(|Record| (|:| |name| (|String|))
                       (|:| |arrType| (|NonNegativeInteger|))
                       (|:| |fromOb| (|NonNegativeInteger|))
                       (|:| |toOb| (|NonNegativeInteger|))
                       (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                       (|:| |map| (|List| (|NonNegativeInteger|))))))
        (SPROG
         ((|as|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|revAr| #1#) (#2=#:G191 NIL) (|a| NIL) (|forwAr| #1#)
          (#3=#:G190 NIL))
         (SEQ (LETT |as| NIL . #4=(|UDGRPH;getArrows;$L;11|))
              (SEQ (LETT |a| NIL . #4#) (LETT #3# (QCDR |s|) . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |forwAr|
                          (VECTOR (QVELT |a| 0) (QVELT |a| 1) (QVELT |a| 2)
                                  (QVELT |a| 3) (QVELT |a| 4) (QVELT |a| 5)
                                  (QVELT |a| 6))
                          . #4#)
                    (EXIT
                     (LETT |as| (SPADCALL |as| |forwAr| (QREFELT $ 29))
                           . #4#)))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |a| NIL . #4#) (LETT #2# (QCDR |s|) . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |revAr|
                          (VECTOR (QVELT |a| 0) (QVELT |a| 1) (QVELT |a| 3)
                                  (QVELT |a| 2) (QVELT |a| 4) (QVELT |a| 5)
                                  (QVELT |a| 6))
                          . #4#)
                    (EXIT
                     (LETT |as| (SPADCALL |as| |revAr| (QREFELT $ 29)) . #4#)))
                   (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |as|)))) 

(PUT '|UDGRPH;initial;$;12| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(SDEFUN |UDGRPH;initial;$;12| (($ $)) (CONS NIL NIL)) 

(SDEFUN |UDGRPH;terminal;S$;13| ((|a| S) ($ $))
        (SPROG
         ((|ar|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)))))
         (SEQ (LETT |o| (VECTOR |a| 0 0) . #1=(|UDGRPH;terminal;S$;13|))
              (LETT |ar| (VECTOR "loop" 0 1 1 0 0 NIL) . #1#)
              (EXIT (CONS (LIST |o|) (LIST |ar|)))))) 

(SDEFUN |UDGRPH;cycleOpen;LS$;14|
        ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|arn| (|Integer|))
          (|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (|next| (|NonNegativeInteger|))
          (|obs|
           (|List|
            #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #2#) (|ob| (S)) (#3=#:G207 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #4=(|UDGRPH;cycleOpen;LS$;14|))
              (LETT |ars| NIL . #4#) (LETT |arn| 1 . #4#)
              (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#) G190
                   (COND ((|greater_SI| |obn| #3#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 19)) . #4#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 21))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 22)))
                          . #4#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 23)) . #4#)
                    (LETT |next| (+ |obn| 1) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 42))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |next| 0 0 NIL)
                              . #4#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 29)) . #4#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #4#)))))))
                   (LETT |obn| (|inc_SI| |obn|) . #4#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |UDGRPH;cycleClosed;LS$;15|
        ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|arn| (|Integer|))
          (|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (|next| (|NonNegativeInteger|))
          (|obs|
           (|List|
            #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #2#) (|ob| (S)) (#3=#:G217 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #4=(|UDGRPH;cycleClosed;LS$;15|))
              (LETT |ars| NIL . #4#) (LETT |arn| 1 . #4#)
              (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#) G190
                   (COND ((|greater_SI| |obn| #3#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 19)) . #4#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 21))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 22)))
                          . #4#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 23)) . #4#)
                    (LETT |next| (+ |obn| 1) . #4#)
                    (COND
                     ((EQL (- |next| 1) (LENGTH |objs|))
                      (LETT |next| 1 . #4#)))
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 42))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |next| 0 0 NIL)
                              . #4#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 29)) . #4#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #4#)))))))
                   (LETT |obn| (|inc_SI| |obn|) . #4#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |UDGRPH;unit;LS$;16| ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|arn| (|Integer|))
          (|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#)
          (|obs|
           (|List|
            #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #2#) (|ob| (S)) (#3=#:G225 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #4=(|UDGRPH;unit;LS$;16|))
              (LETT |ars| NIL . #4#) (LETT |arn| 1 . #4#)
              (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#) G190
                   (COND ((|greater_SI| |obn| #3#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 19)) . #4#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 21))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 22)))
                          . #4#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 23)) . #4#)
                    (LETT |a|
                          (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|)) 0
                                  |obn| |obn| 0 0 NIL)
                          . #4#)
                    (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 29)) . #4#)
                    (EXIT (LETT |arn| (+ |arn| 1) . #4#)))
                   (LETT |obn| (|inc_SI| |obn|) . #4#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |UDGRPH;kgraph;LS$;17| ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|arn| (|Integer|))
          (|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (#2=#:G237 NIL) (|obm| NIL)
          (|obs|
           (|List|
            #3=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #3#) (|ob| (S)) (#4=#:G236 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #5=(|UDGRPH;kgraph;LS$;17|))
              (LETT |ars| NIL . #5#) (LETT |arn| 1 . #5#)
              (SEQ (LETT |obn| 1 . #5#) (LETT #4# (LENGTH |objs|) . #5#) G190
                   (COND ((|greater_SI| |obn| #4#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 19)) . #5#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 21))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 22)))
                          . #5#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 23)) . #5#)
                    (EXIT
                     (SEQ (LETT |obm| 1 . #5#) (LETT #2# (LENGTH |objs|) . #5#)
                          G190 (COND ((|greater_SI| |obm| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |obn| |obm| (QREFELT $ 46))
                              (SEQ
                               (LETT |a|
                                     (VECTOR
                                      (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |obm| 0 0 NIL)
                                     . #5#)
                               (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 29))
                                     . #5#)
                               (EXIT (LETT |arn| (+ |arn| 1) . #5#)))))))
                          (LETT |obm| (|inc_SI| |obm|) . #5#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |obn| (|inc_SI| |obn|) . #5#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |UDGRPH;+;3$;18| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|la|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|lb|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (#2=#:G245 NIL) (|ba| NIL)
          (|bStart| (|NonNegativeInteger|))
          (|lo|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |lo| (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 48))
                . #3=(|UDGRPH;+;3$;18|))
          (LETT |bStart| (LENGTH (QCAR |a|)) . #3#) (LETT |lb| NIL . #3#)
          (SEQ (LETT |ba| NIL . #3#) (LETT #2# (QCDR |b|) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |ba| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |arr|
                      (VECTOR (QVELT |ba| 0) (QVELT |ba| 1)
                              (+ (QVELT |ba| 2) |bStart|)
                              (+ (QVELT |ba| 3) |bStart|) (QVELT |ba| 4)
                              (QVELT |ba| 5) (QVELT |ba| 6))
                      . #3#)
                (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 29)) . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 49)) . #3#)
          (EXIT (CONS |lo| |la|))))) 

(SDEFUN |UDGRPH;merge;3$;19| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|la|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|lb|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|fromI| #2=(|NonNegativeInteger|)) (|toI| #2#)
          (#3=#:G265 NIL) (|ba| NIL) (|bStart| #4=(|NonNegativeInteger|))
          (|bmap| (|List| (|NonNegativeInteger|))) (#5=#:G253 NIL)
          (|newIndex| #4#)
          (|mergedObjects|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|i| (|Integer|)) (#6=#:G264 NIL) (|bob| NIL) (#7=#:G263 NIL)
          (|x| NIL) (#8=#:G262 NIL))
         (SEQ
          (LETT |bmap|
                (PROGN
                 (LETT #8# NIL . #9=(|UDGRPH;merge;3$;19|))
                 (SEQ (LETT |x| 1 . #9#) (LETT #7# (LENGTH (QCAR |a|)) . #9#)
                      G190 (COND ((|greater_SI| |x| #7#) (GO G191)))
                      (SEQ (EXIT (LETT #8# (CONS |x| #8#) . #9#)))
                      (LETT |x| (|inc_SI| |x|) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (LETT |newIndex| (LENGTH (QCAR |a|)) . #9#)
          (LETT |mergedObjects| (QCAR |a|) . #9#)
          (SEQ (LETT |bob| NIL . #9#) (LETT #6# (QCAR |b|) . #9#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |bob| (CAR #6#) . #9#) NIL))
                 (GO G191)))
               (SEQ (LETT |i| (SPADCALL |bob| (QCAR |a|) (QREFELT $ 51)) . #9#)
                    (EXIT
                     (COND
                      ((< |i| 1)
                       (SEQ
                        (LETT |mergedObjects|
                              (SPADCALL |mergedObjects| |bob| (QREFELT $ 23))
                              . #9#)
                        (LETT |newIndex| (+ |newIndex| 1) . #9#)
                        (EXIT
                         (LETT |bmap|
                               (SPADCALL |bmap| |newIndex| (QREFELT $ 52))
                               . #9#))))
                      ('T
                       (LETT |bmap|
                             (SPADCALL |bmap|
                                       (PROG1 (LETT #5# |i| . #9#)
                                         (|check_subtype2| (>= #5# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #5#))
                                       (QREFELT $ 52))
                             . #9#)))))
               (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |bStart| (LENGTH (QCAR |a|)) . #9#) (LETT |lb| NIL . #9#)
          (SEQ (LETT |ba| NIL . #9#) (LETT #3# (QCDR |b|) . #9#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |ba| (CAR #3#) . #9#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |toI|
                      (SPADCALL |bmap| (+ (QVELT |ba| 3) |bStart|)
                                (QREFELT $ 28))
                      . #9#)
                (LETT |fromI|
                      (SPADCALL |bmap| (+ (QVELT |ba| 2) |bStart|)
                                (QREFELT $ 28))
                      . #9#)
                (LETT |arr|
                      (VECTOR (QVELT |ba| 0) (QVELT |ba| 1) |fromI| |toI|
                              (QVELT |ba| 4) (QVELT |ba| 5) (QVELT |ba| 6))
                      . #9#)
                (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 29)) . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 49)) . #9#)
          (EXIT (CONS |mergedObjects| |la|))))) 

(SDEFUN |UDGRPH;objProd|
        ((|a| $) (|b| $)
         ($ |List|
          (|Record| (|:| |value| (|Product| S S))
                    (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)))))
        (SPROG
         ((|newObjs|
           (|List|
            (|Record| (|:| |value| (|Product| S S))
                      (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|ob|
           (|Record| (|:| |value| (|Product| S S))
                     (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|sp| (|Product| S S)) (|heighta| (|NonNegativeInteger|))
          (|widtha| (|NonNegativeInteger|)) (|y| #1=(|NonNegativeInteger|))
          (|x| #1#) (|byi| #2=(|NonNegativeInteger|))
          (|bxi| #3=(|NonNegativeInteger|)) (|bi| (S)) (#4=#:G276 NIL)
          (|boi| NIL) (|ayi| #2#) (|axi| #3#) (|ai| (S)) (#5=#:G275 NIL)
          (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #6=(|UDGRPH;objProd|))
              (SEQ (LETT |aoi| NIL . #6#) (LETT #5# (QCAR |a|) . #6#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |aoi| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ai| (QVELT |aoi| 0) . #6#)
                        (LETT |axi| (QVELT |aoi| 1) . #6#)
                        (LETT |ayi| (QVELT |aoi| 2) . #6#)
                        (EXIT
                         (SEQ (LETT |boi| NIL . #6#)
                              (LETT #4# (QCAR |b|) . #6#) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |boi| (CAR #4#) . #6#) NIL))
                                (GO G191)))
                              (SEQ (LETT |bi| (QVELT |boi| 0) . #6#)
                                   (LETT |bxi| (QVELT |boi| 1) . #6#)
                                   (LETT |byi| (QVELT |boi| 2) . #6#)
                                   (LETT |x|
                                         (+
                                          (* |bxi|
                                             (SPADCALL |a| (QREFELT $ 54)))
                                          |axi|)
                                         . #6#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 55)))
                                          |ayi|)
                                         . #6#)
                                   (LETT |widtha| (SPADCALL |a| (QREFELT $ 54))
                                         . #6#)
                                   (LETT |heighta|
                                         (SPADCALL |a| (QREFELT $ 55)) . #6#)
                                   (LETT |sp|
                                         (SPADCALL |ai| |bi| (QREFELT $ 57))
                                         . #6#)
                                   (LETT |ob| (VECTOR |sp| |x| |y|) . #6#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 60))
                                          . #6#)))
                              (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |UDGRPH;indexProd|
        ((|aObj| $) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G277 NIL))
               (+ |a|
                  (*
                   (PROG1 (LETT #1# (- |b| 1) |UDGRPH;indexProd|)
                     (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #1#))
                   (LENGTH (QCAR |aObj|)))))) 

(SDEFUN |UDGRPH;*;2$Ug;22|
        ((|a| $) (|b| $) ($ |UndirectedGraph| (|Product| S S)))
        (SPROG
         ((|newArrs|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|an| (|String|)) (#2=#:G299 NIL) (|bv| NIL)
          (#3=#:G298 NIL) (|bu| NIL) (#4=#:G297 NIL) (|av| NIL) (#5=#:G296 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|UDGRPH;*;2$Ug;22|))
              (SEQ (LETT |au| 1 . #6#) (LETT #5# (LENGTH (QCAR |a|)) . #6#)
                   G190 (COND ((|greater_SI| |au| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |av| 1 . #6#)
                          (LETT #4# (LENGTH (QCAR |a|)) . #6#) G190
                          (COND ((|greater_SI| |av| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |bu| 1 . #6#)
                                 (LETT #3# (LENGTH (QCAR |b|)) . #6#) G190
                                 (COND ((|greater_SI| |bu| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |bv| 1 . #6#)
                                        (LETT #2# (LENGTH (QCAR |b|)) . #6#)
                                        G190
                                        (COND
                                         ((|greater_SI| |bv| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |a| |au| |av|
                                                      (QREFELT $ 61))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 61))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          62))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          62)))
                                                      (QREFELT $ 64))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 29))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|UDGRPH;objProd| |a| |b| $) |newArrs|
                         (QREFELT $ 66)))))) 

(SDEFUN |UDGRPH;cartesian;2$Ug;23|
        ((|a| $) (|b| $) ($ |UndirectedGraph| (|Product| S S)))
        (SPROG
         ((|newArrs|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|an| (|String|)) (#2=#:G324 NIL) (|bv| NIL)
          (#3=#:G323 NIL) (|bu| NIL) (#4=#:G322 NIL) (|av| NIL) (#5=#:G321 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|UDGRPH;cartesian;2$Ug;23|))
              (SEQ (LETT |au| 1 . #6#) (LETT #5# (LENGTH (QCAR |a|)) . #6#)
                   G190 (COND ((|greater_SI| |au| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |av| 1 . #6#)
                          (LETT #4# (LENGTH (QCAR |a|)) . #6#) G190
                          (COND ((|greater_SI| |av| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |bu| 1 . #6#)
                                 (LETT #3# (LENGTH (QCAR |b|)) . #6#) G190
                                 (COND ((|greater_SI| |bu| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |bv| 1 . #6#)
                                        (LETT #2# (LENGTH (QCAR |b|)) . #6#)
                                        G190
                                        (COND
                                         ((|greater_SI| |bv| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((EQL |bu| |bv|)
                                            (COND
                                             ((SPADCALL |a| |au| |av|
                                                        (QREFELT $ 61))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            61))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              62))
                                                           #7="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 64)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              62))
                                                           #8="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 64)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            62))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 64))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 29))
                                                      . #6#))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT $ 61))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              61))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        $ 62))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT $ 64)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        $ 62))
                                                             #8#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT $ 64)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              62))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 64))))
                                                       . #6#)
                                                 (LETT |arr|
                                                       (VECTOR |an| 0
                                                               (|UDGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                $)
                                                               (|UDGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                $)
                                                               0 0 NIL)
                                                       . #6#)
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT $
                                                                           29))
                                                        . #6#))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 61))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            61))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              62))
                                                           #7#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 64)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              62))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 64)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            62))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 64))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 29))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|UDGRPH;objProd| |a| |b| $) |newArrs|
                         (QREFELT $ 66)))))) 

(SDEFUN |UDGRPH;closedObjProd|
        ((|a| $) (|b| $) (|f| |Mapping| S S S)
         ($ |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)))))
        (SPROG
         ((|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|ob|
           (|Record| (|:| |value| S) (|:| |posX| #1=(|NonNegativeInteger|))
                     (|:| |posY| #2=(|NonNegativeInteger|))))
          (|sp| (S)) (|heighta| (|NonNegativeInteger|))
          (|widtha| (|NonNegativeInteger|)) (|y| #3=(|NonNegativeInteger|))
          (|x| #3#) (|byi| #2#) (|bxi| #1#) (|bi| (S)) (#4=#:G333 NIL)
          (|boi| NIL) (|ayi| #2#) (|axi| #1#) (|ai| (S)) (#5=#:G332 NIL)
          (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #6=(|UDGRPH;closedObjProd|))
              (SEQ (LETT |aoi| NIL . #6#) (LETT #5# (QCAR |a|) . #6#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |aoi| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ai| (QVELT |aoi| 0) . #6#)
                        (LETT |axi| (QVELT |aoi| 1) . #6#)
                        (LETT |ayi| (QVELT |aoi| 2) . #6#)
                        (EXIT
                         (SEQ (LETT |boi| NIL . #6#)
                              (LETT #4# (QCAR |b|) . #6#) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |boi| (CAR #4#) . #6#) NIL))
                                (GO G191)))
                              (SEQ (LETT |bi| (QVELT |boi| 0) . #6#)
                                   (LETT |bxi| (QVELT |boi| 1) . #6#)
                                   (LETT |byi| (QVELT |boi| 2) . #6#)
                                   (LETT |x|
                                         (+
                                          (* |bxi|
                                             (SPADCALL |a| (QREFELT $ 54)))
                                          |axi|)
                                         . #6#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 55)))
                                          |ayi|)
                                         . #6#)
                                   (LETT |widtha| (SPADCALL |a| (QREFELT $ 54))
                                         . #6#)
                                   (LETT |heighta|
                                         (SPADCALL |a| (QREFELT $ 55)) . #6#)
                                   (LETT |sp| (SPADCALL |ai| |bi| |f|) . #6#)
                                   (LETT |ob| (VECTOR |sp| |x| |y|) . #6#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 23))
                                          . #6#)))
                              (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |UDGRPH;closedTensor;2$M$;25|
        ((|a| $) (|b| $) (|f| |Mapping| S S S) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|an| (|String|)) (#2=#:G354 NIL) (|bv| NIL)
          (#3=#:G353 NIL) (|bu| NIL) (#4=#:G352 NIL) (|av| NIL) (#5=#:G351 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|UDGRPH;closedTensor;2$M$;25|))
              (SEQ (LETT |au| 1 . #6#) (LETT #5# (LENGTH (QCAR |a|)) . #6#)
                   G190 (COND ((|greater_SI| |au| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |av| 1 . #6#)
                          (LETT #4# (LENGTH (QCAR |a|)) . #6#) G190
                          (COND ((|greater_SI| |av| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |bu| 1 . #6#)
                                 (LETT #3# (LENGTH (QCAR |b|)) . #6#) G190
                                 (COND ((|greater_SI| |bu| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |bv| 1 . #6#)
                                        (LETT #2# (LENGTH (QCAR |b|)) . #6#)
                                        G190
                                        (COND
                                         ((|greater_SI| |bv| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |a| |au| |av|
                                                      (QREFELT $ 61))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 61))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          62))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          62)))
                                                      (QREFELT $ 64))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 29))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|UDGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                         (QREFELT $ 17)))))) 

(SDEFUN |UDGRPH;closedCartesian;2$M$;26|
        ((|a| $) (|b| $) (|f| |Mapping| S S S) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|an| (|String|)) (#2=#:G380 NIL) (|bv| NIL)
          (#3=#:G379 NIL) (|bu| NIL) (#4=#:G378 NIL) (|av| NIL) (#5=#:G377 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|UDGRPH;closedCartesian;2$M$;26|))
              (SEQ (LETT |au| 1 . #6#) (LETT #5# (LENGTH (QCAR |a|)) . #6#)
                   G190 (COND ((|greater_SI| |au| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |av| 1 . #6#)
                          (LETT #4# (LENGTH (QCAR |a|)) . #6#) G190
                          (COND ((|greater_SI| |av| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |bu| 1 . #6#)
                                 (LETT #3# (LENGTH (QCAR |b|)) . #6#) G190
                                 (COND ((|greater_SI| |bu| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |bv| 1 . #6#)
                                        (LETT #2# (LENGTH (QCAR |b|)) . #6#)
                                        G190
                                        (COND
                                         ((|greater_SI| |bv| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((EQL |bu| |bv|)
                                            (COND
                                             ((SPADCALL |a| |au| |av|
                                                        (QREFELT $ 61))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            61))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              62))
                                                           #7="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 64)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              62))
                                                           #8="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 64)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            62))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 64))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 29))
                                                      . #6#))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT $ 61))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              61))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        $ 62))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT $ 64)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        $ 62))
                                                             #8#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT $ 64)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              62))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 64))))
                                                       . #6#)
                                                 (LETT |arr|
                                                       (VECTOR |an| 0
                                                               (|UDGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                $)
                                                               (|UDGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                $)
                                                               0 0 NIL)
                                                       . #6#)
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT $
                                                                           29))
                                                        . #6#))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 61))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            61))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              62))
                                                           #7#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 64)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              62))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 64)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            62))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 64))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 29))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|UDGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                         (QREFELT $ 17)))))) 

(SDEFUN |UDGRPH;map;$LL2I$;27|
        ((|s| $) (|m| |List| (|NonNegativeInteger|)) (|newOb| |List| S)
         (|offsetX| . #1=(|Integer|)) (|offsetY| . #1#) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            #2=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|newArr| #2#) (#3=#:G397 NIL) (|oldArrow| NIL) (#4=#:G385 NIL)
          (#5=#:G384 NIL) (|i| (|NonNegativeInteger|)) (#6=#:G396 NIL)
          (|oi| NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#7=#:G395 NIL) (|o| NIL) (#8=#:G394 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #8# NIL . #9=(|UDGRPH;map;$LL2I$;27|))
                 (SEQ (LETT |o| NIL . #9#) (LETT #7# |newOb| . #9#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |o| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #8# (CONS (VECTOR |o| 0 0) #8#) . #9#)))
                      (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (SEQ (LETT |oi| 1 . #9#) (LETT #6# (LENGTH (QCAR |s|)) . #9#) G190
               (COND ((|greater_SI| |oi| #6#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 28)) . #9#)
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 72))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 72))
                                            1)
                                           |offsetX|)
                                          . #9#)
                                  (|check_subtype2| (>= #5# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #5#))
                                (PROG1
                                    (LETT #4#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 72))
                                            2)
                                           |offsetY|)
                                          . #9#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#)))
                               (QREFELT $ 73))))
               (LETT |oi| (|inc_SI| |oi|) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |newArrs| NIL . #9#)
          (SEQ (LETT |oldArrow| NIL . #9#) (LETT #3# (QCDR |s|) . #9#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |oldArrow| (CAR #3#) . #9#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |newArr|
                      (VECTOR (QVELT |oldArrow| 0) (QVELT |oldArrow| 1)
                              (SPADCALL |m| (QVELT |oldArrow| 2)
                                        (QREFELT $ 28))
                              (SPADCALL |m| (QVELT |oldArrow| 3)
                                        (QREFELT $ 28))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6))
                      . #9#)
                (EXIT
                 (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 29))
                       . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(SDEFUN |UDGRPH;mapContra;$LL2I$;28|
        ((|s| $) (|m| |List| (|NonNegativeInteger|)) (|newOb| |List| S)
         (|offsetX| . #1=(|Integer|)) (|offsetY| . #1#) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            #2=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|newArr| #2#) (#3=#:G414 NIL) (|oldArrow| NIL) (#4=#:G402 NIL)
          (#5=#:G401 NIL) (|i| (|NonNegativeInteger|)) (#6=#:G413 NIL)
          (|oi| NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#7=#:G412 NIL) (|o| NIL) (#8=#:G411 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #8# NIL . #9=(|UDGRPH;mapContra;$LL2I$;28|))
                 (SEQ (LETT |o| NIL . #9#) (LETT #7# |newOb| . #9#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |o| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #8# (CONS (VECTOR |o| 0 0) #8#) . #9#)))
                      (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (SEQ (LETT |oi| 1 . #9#) (LETT #6# (LENGTH (QCAR |s|)) . #9#) G190
               (COND ((|greater_SI| |oi| #6#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 28)) . #9#)
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 72))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 72))
                                            1)
                                           |offsetX|)
                                          . #9#)
                                  (|check_subtype2| (>= #5# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #5#))
                                (PROG1
                                    (LETT #4#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 72))
                                            2)
                                           |offsetY|)
                                          . #9#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#)))
                               (QREFELT $ 73))))
               (LETT |oi| (|inc_SI| |oi|) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |newArrs| NIL . #9#)
          (SEQ (LETT |oldArrow| NIL . #9#) (LETT #3# (QCDR |s|) . #9#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |oldArrow| (CAR #3#) . #9#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |newArr|
                      (VECTOR (QVELT |oldArrow| 0) (QVELT |oldArrow| 1)
                              (SPADCALL |m| (QVELT |oldArrow| 3)
                                        (QREFELT $ 28))
                              (SPADCALL |m| (QVELT |oldArrow| 2)
                                        (QREFELT $ 28))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6))
                      . #9#)
                (EXIT
                 (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 29))
                       . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(DECLAIM (NOTINLINE |UndirectedGraph;|)) 

(DEFUN |UndirectedGraph| (#1=#:G415)
  (SPROG NIL
         (PROG (#2=#:G416)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|UndirectedGraph|)
                                               '|domainEqualList|)
                    . #3=(|UndirectedGraph|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|UndirectedGraph;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|UndirectedGraph|)))))))))) 

(DEFUN |UndirectedGraph;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|UndirectedGraph|))
          (LETT |dv$| (LIST '|UndirectedGraph| DV$1) . #1#)
          (LETT $ (GETREFV 87) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|UndirectedGraph| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record|
                     (|:| |objects|
                          (|List|
                           (|Record| (|:| |value| |#1|)
                                     (|:| |posX| (|NonNegativeInteger|))
                                     (|:| |posY| (|NonNegativeInteger|)))))
                     (|:| |arrows|
                          (|List|
                           (|Record| (|:| |name| (|String|))
                                     (|:| |arrType| (|NonNegativeInteger|))
                                     (|:| |fromOb| (|NonNegativeInteger|))
                                     (|:| |toOb| (|NonNegativeInteger|))
                                     (|:| |xOffset| (|Integer|))
                                     (|:| |yOffset| (|Integer|))
                                     (|:| |map|
                                          (|List| (|NonNegativeInteger|))))))))
          $))) 

(MAKEPROP '|UndirectedGraph| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|)
              |UDGRPH;isDirected?;B;1| (|List| 6) |UDGRPH;undirectedGraph;L$;2|
              (|Record| (|:| |value| 6) (|:| |posX| 20) (|:| |posY| 20))
              (|List| 12) |UDGRPH;undirectedGraph;L$;3|
              (|Record| (|:| |name| 35) (|:| |arrType| 20) (|:| |fromOb| 20)
                        (|:| |toOb| 20) (|:| |xOffset| 18) (|:| |yOffset| 18)
                        (|:| |map| 24))
              (|List| 15) |UDGRPH;undirectedGraph;LL$;4| (|Integer|)
              (0 . |elt|) (|NonNegativeInteger|) (6 . |createX|)
              (12 . |createY|) (18 . |concat|) (|List| 20) (|List| 24)
              (24 . |elt|) (30 . |#|) (35 . |elt|) (41 . |concat|)
              |UDGRPH;undirectedGraph;LL$;5| (47 . =) |UDGRPH;addObject!;$S$;6|
              |UDGRPH;addObject!;$R$;7| (53 . =) (|String|)
              |UDGRPH;addArrow!;$S2Nni$;8| |UDGRPH;addArrow!;$S2NniL$;9|
              |UDGRPH;getVertices;$L;10| |UDGRPH;getArrows;$L;11|
              |UDGRPH;initial;$;12| |UDGRPH;terminal;S$;13| (59 . <=)
              |UDGRPH;cycleOpen;LS$;14| |UDGRPH;cycleClosed;LS$;15|
              |UDGRPH;unit;LS$;16| (65 . ~=) |UDGRPH;kgraph;LS$;17|
              (71 . |concat|) (77 . |concat|) |UDGRPH;+;3$;18|
              (83 . |position|) (89 . |concat|) |UDGRPH;merge;3$;19|
              (95 . |diagramWidth|) (100 . |diagramHeight|) (|Product| 6 6)
              (105 . |construct|)
              (|Record| (|:| |value| 56) (|:| |posX| 20) (|:| |posY| 20))
              (|List| 58) (111 . |concat|) (117 . |isDirectSuccessor?|)
              (124 . |arrowName|) (|List| $) (131 . |concat|)
              (|UndirectedGraph| 56) (136 . |undirectedGraph|)
              |UDGRPH;*;2$Ug;22| |UDGRPH;cartesian;2$Ug;23| (|Mapping| 6 6 6)
              |UDGRPH;closedTensor;2$M$;25| |UDGRPH;closedCartesian;2$M$;26|
              (142 . |elt|) (148 . |setelt!|) |UDGRPH;map;$LL2I$;27|
              |UDGRPH;mapContra;$LL2I$;28| (|Void|) (|Scene| (|SCartesian| '2))
              (|Matrix| 18) (|Matrix| 20) (|List| (|Loop|)) (|Tree| 18)
              (|List| 81) (|DirectedGraph| $) (|SingleInteger|) (|OutputForm|)
              (|HashState|))
           '#(~= 155 |unit| 161 |undirectedGraph| 167 |terminal| 189
              |subdiagramSvg| 194 |spanningTreeNode| 202 |spanningTreeArrow|
              208 |spanningForestNode| 214 |spanningForestArrow| 219
              |routeNodes| 224 |routeArrows| 231 |outDegree| 238 |nodeToNode|
              244 |nodeToArrow| 250 |nodeFromNode| 256 |nodeFromArrow| 262
              |min| 268 |merge| 279 |max| 285 |mapContra| 296 |map| 305
              |looseEquals| 314 |loopsNodes| 320 |loopsAtNode| 325
              |loopsArrows| 331 |latex| 336 |laplacianMatrix| 341 |kgraph| 346
              |isGreaterThan?| 352 |isFunctional?| 359 |isFixPoint?| 364
              |isDirected?| 370 |isDirectSuccessor?| 374 |isAcyclic?| 381
              |initial| 386 |incidenceMatrix| 390 |inDegree| 395 |hashUpdate!|
              401 |hash| 407 |getVertices| 412 |getVertexIndex| 417 |getArrows|
              423 |getArrowIndex| 428 |flatten| 435 |distanceMatrix| 440
              |distance| 445 |diagramWidth| 452 |diagramSvg| 457
              |diagramHeight| 464 |deepDiagramSvg| 469 |cycleOpen| 476
              |cycleClosed| 482 |createY| 488 |createX| 494 |createWidth| 500
              |coerce| 505 |closedTensor| 515 |closedCartesian| 522 |cartesian|
              529 |arrowsToNode| 535 |arrowsToArrow| 541 |arrowsFromNode| 547
              |arrowsFromArrow| 553 |arrowName| 559 |adjacencyMatrix| 566
              |addObject!| 571 |addArrow!| 583 = 608 + 614 * 620)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|) (|CoercibleTo| 85)
                           (|BasicType|))
                        (|makeByteWordVec2| 86
                                            '(2 10 6 0 18 19 2 0 20 20 20 21 2
                                              0 20 20 20 22 2 13 0 0 12 23 2 25
                                              24 0 18 26 1 24 20 0 27 2 24 20 0
                                              18 28 2 16 0 0 15 29 2 13 8 0 0
                                              31 2 16 8 0 0 34 2 20 8 0 0 42 2
                                              20 8 0 0 46 2 13 0 0 0 48 2 16 0
                                              0 0 49 2 13 18 12 0 51 2 24 0 0
                                              20 52 1 0 20 0 54 1 0 20 0 55 2
                                              56 0 6 6 57 2 59 0 0 58 60 3 0 8
                                              0 20 20 61 3 0 35 0 20 20 62 1 35
                                              0 63 64 2 65 0 59 16 66 2 13 12 0
                                              18 72 3 13 12 0 18 12 73 2 0 8 0
                                              0 1 2 0 0 10 35 45 2 0 0 13 16 17
                                              2 0 0 10 25 30 1 0 0 13 14 1 0 0
                                              10 11 1 0 0 6 41 4 0 76 77 0 8 8
                                              1 2 0 81 0 20 1 2 0 81 0 20 1 1 0
                                              82 0 1 1 0 82 0 1 3 0 24 0 20 20
                                              1 3 0 24 0 20 20 1 2 0 20 0 20 1
                                              2 0 24 0 20 1 2 0 24 0 20 1 2 0
                                              24 0 20 1 2 0 24 0 20 1 2 0 20 0
                                              24 1 1 0 20 0 1 2 0 0 0 0 53 2 0
                                              20 0 24 1 1 0 20 0 1 5 0 0 0 24
                                              10 18 18 75 5 0 0 0 24 10 18 18
                                              74 2 0 8 0 0 1 1 0 80 0 1 2 0 80
                                              0 20 1 1 0 80 0 1 1 0 35 0 1 1 0
                                              78 0 1 2 0 0 10 35 47 3 0 8 0 20
                                              20 1 1 0 8 0 1 2 0 8 0 20 1 0 0 8
                                              9 3 0 8 0 20 20 61 1 0 8 0 1 0 0
                                              0 40 1 0 78 0 1 2 0 20 0 20 1 2 0
                                              86 86 0 1 1 0 84 0 1 1 0 13 0 38
                                              2 0 20 0 6 1 1 0 16 0 39 3 0 20 0
                                              20 20 1 1 0 0 83 1 1 0 78 0 1 3 0
                                              18 0 20 20 1 1 0 20 0 54 3 0 76
                                              35 0 8 1 1 0 20 0 55 3 0 76 35 0
                                              8 1 2 0 0 10 35 43 2 0 0 10 35 44
                                              2 0 20 20 20 22 2 0 20 20 20 21 1
                                              0 20 20 1 1 0 85 0 1 1 0 85 0 1 3
                                              0 0 0 0 69 70 3 0 0 0 0 69 71 2 0
                                              65 0 0 68 2 0 24 0 20 1 2 0 24 0
                                              20 1 2 0 24 0 20 1 2 0 24 0 20 1
                                              3 0 35 0 20 20 62 1 0 79 0 1 2 0
                                              0 0 12 33 2 0 0 0 6 32 5 0 0 0 35
                                              20 20 24 37 4 0 0 0 35 6 6 1 4 0
                                              0 0 35 20 20 36 2 0 8 0 0 1 2 0 0
                                              0 0 50 2 0 65 0 0 67)))))
           '|lookupComplete|)) 
