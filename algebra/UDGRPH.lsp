
(PUT '|UDGRPH;isDirected?;B;1| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |UDGRPH;isDirected?;B;1| (($ |Boolean|)) NIL) 

(SDEFUN |UDGRPH;undirectedGraph;L$;2| ((|ob| |List| S) ($ $))
        (SPROG
         ((|objs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#1=#:G132 NIL) (|x| NIL) (#2=#:G131 NIL))
         (SEQ
          (LETT |objs|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |x| NIL) (LETT #1# |ob|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (VECTOR |x| 0 0) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
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
        ((|obs| |List| S)
         (|ars| |List|
          (|Record| (|:| |fromOb| (|NonNegativeInteger|))
                    (|:| |toOb| (|NonNegativeInteger|))))
         ($ $))
        (SPROG
         ((|edges|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (#1=#:G156 NIL) (|ar| NIL) (#2=#:G157 NIL) (|arn| NIL)
          (|nodes|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (#3=#:G154 NIL) (|ob| NIL) (#4=#:G155 NIL) (|obn| NIL))
         (SEQ (LETT |nodes| NIL)
              (SEQ (LETT |obn| 1) (LETT #4# (LENGTH |obs|)) (LETT |ob| NIL)
                   (LETT #3# |obs|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |ob| (CAR #3#)) NIL)
                         (|greater_SI| |obn| #4#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |obs|) |obn|
                                            (QREFELT $ 19))
                                  (SPADCALL (LENGTH |obs|) |obn|
                                            (QREFELT $ 20))))
                    (EXIT
                     (LETT |nodes| (SPADCALL |nodes| |o| (QREFELT $ 21)))))
                   (LETT #3# (PROG1 (CDR #3#) (LETT |obn| (|inc_SI| |obn|))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |edges| NIL)
              (SEQ (LETT |arn| 1) (LETT #2# (LENGTH |ars|)) (LETT |ar| NIL)
                   (LETT #1# |ars|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ar| (CAR #1#)) NIL)
                         (|greater_SI| |arn| #2#))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |edges|
                           (SPADCALL |edges|
                                     (VECTOR (STRCONC "a" (STRINGIMAGE |arn|))
                                             0 (QCAR |ar|) (QCDR |ar|) 0 0 NIL)
                                     (QREFELT $ 22)))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT |arn| (|inc_SI| |arn|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |nodes| |edges|))))) 

(SDEFUN |UDGRPH;undirectedGraph;Fp$;6| ((|poset| |FinitePoset| S) ($ $))
        (SPROG
         ((|ars|
           (|List|
            #1=(|Record| (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|)))))
          (|z| #1#) (#2=#:G166 NIL) (|y| NIL) (#3=#:G167 NIL) (|yn| NIL)
          (#4=#:G164 NIL) (|x| NIL) (#5=#:G165 NIL) (|xn| NIL)
          (|mat| (|List| (|List| (|Boolean|)))) (|obs| (|List| S)))
         (SEQ (LETT |obs| (SPADCALL |poset| (QREFELT $ 27))) (LETT |ars| NIL)
              (LETT |mat| (SPADCALL |poset| (QREFELT $ 29)))
              (SEQ (LETT |xn| 1) (LETT #5# (LENGTH |mat|)) (LETT |x| NIL)
                   (LETT #4# |mat|) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL)
                         (|greater_SI| |xn| #5#))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |yn| 1) (LETT #3# (LENGTH |x|)) (LETT |y| NIL)
                          (LETT #2# |x|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |y| (CAR #2#)) NIL)
                                (|greater_SI| |yn| #3#))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             (|y|
                              (SEQ (LETT |z| (CONS |xn| |yn|))
                                   (EXIT
                                    (LETT |ars|
                                          (SPADCALL |ars| |z|
                                                    (QREFELT $ 30)))))))))
                          (LETT #2#
                                (PROG1 (CDR #2#) (LETT |yn| (|inc_SI| |yn|))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT #4# (PROG1 (CDR #4#) (LETT |xn| (|inc_SI| |xn|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |obs| |ars| (QREFELT $ 25)))))) 

(SDEFUN |UDGRPH;undirectedGraph;LL$;7|
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
          (|a| #1#) (#2=#:G181 NIL) (|j| NIL) (#3=#:G180 NIL) (|i| NIL)
          (|obs|
           (|List|
            #4=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #4#) (|ob| (S)) (#5=#:G179 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL)
              (SEQ (LETT |obn| 1) (LETT #5# (LENGTH |objs|)) G190
                   (COND ((|greater_SI| |obn| #5#) (GO G191)))
                   (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 33)))
                        (LETT |o|
                              (VECTOR |ob|
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT $ 19))
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT $ 20))))
                        (EXIT
                         (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)))))
                   (LETT |obn| (|inc_SI| |obn|)) (GO G190) G191 (EXIT NIL))
              (LETT |ar| NIL)
              (SEQ (LETT |i| 1) (LETT #3# (LENGTH |am|)) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1)
                          (LETT #2#
                                (SPADCALL (SPADCALL |am| |i| (QREFELT $ 36))
                                          (QREFELT $ 37)))
                          G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((EQL
                               (SPADCALL (SPADCALL |am| |i| (QREFELT $ 36)) |j|
                                         (QREFELT $ 38))
                               1)
                              (SEQ (LETT |a| (VECTOR "a" 0 |i| |j| 0 0 NIL))
                                   (EXIT
                                    (LETT |ar|
                                          (SPADCALL |ar| |a|
                                                    (QREFELT $ 22)))))))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ar|))))) 

(SDEFUN |UDGRPH;addObject!;$S$;8| ((|s| $) (|n| S) ($ $))
        (SPROG
         ((|obj|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |obs| (QCAR |s|)) (LETT |obj| (VECTOR |n| 0 0))
              (COND
               ((SPADCALL |obs| NIL (QREFELT $ 40))
                (PROGN (RPLACA |s| (LIST |obj|)) (QCAR |s|)))
               ('T
                (PROGN
                 (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT $ 21)))
                 (QCAR |s|))))
              (EXIT |s|)))) 

(SDEFUN |UDGRPH;addObject!;$R$;9|
        ((|s| $)
         (|n| |Record| (|:| |value| S)
          (|:| |posX| . #1=((|NonNegativeInteger|))) (|:| |posY| . #1#))
         ($ $))
        (SPROG
         ((|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |obs| (QCAR |s|))
              (COND
               ((SPADCALL |obs| NIL (QREFELT $ 40))
                (PROGN (RPLACA |s| (LIST |n|)) (QCAR |s|)))
               ('T
                (PROGN
                 (RPLACA |s| (SPADCALL |obs| |n| (QREFELT $ 21)))
                 (QCAR |s|))))
              (EXIT |s|)))) 

(SDEFUN |UDGRPH;addArrow!;$R$;10|
        ((|s| $)
         (|ar| |Record| (|:| |name| (|String|))
          (|:| |arrType| . #1=((|NonNegativeInteger|))) (|:| |fromOb| . #1#)
          (|:| |toOb| . #1#) (|:| |xOffset| . #2=((|Integer|)))
          (|:| |yOffset| . #2#) (|:| |map| (|List| . #1#)))
         ($ $))
        (SEQ
         (PROGN
          (RPLACD |s| (SPADCALL (QCDR |s|) |ar| (QREFELT $ 22)))
          (QCDR |s|))
         (EXIT |s|))) 

(SDEFUN |UDGRPH;addArrow!;$S2Nni$;11|
        ((|s| $) (|nm| |String|) (|n1| . #1=(|NonNegativeInteger|))
         (|n2| . #1#) ($ $))
        (SPROG
         ((|a|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|))))))
         (SEQ (LETT |a| (VECTOR |nm| 0 |n1| |n2| 0 0 NIL))
              (EXIT (SPADCALL |s| |a| (QREFELT $ 43)))))) 

(SDEFUN |UDGRPH;addArrow!;$S2NniL$;12|
        ((|s| $) (|nm| |String|) (|n1| . #1=(|NonNegativeInteger|))
         (|n2| . #1#) (|mp| |List| #1#) ($ $))
        (SPROG
         ((|a|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|))))))
         (SEQ (LETT |a| (VECTOR |nm| 0 |n1| |n2| 0 0 |mp|))
              (EXIT (SPADCALL |s| |a| (QREFELT $ 43)))))) 

(PUT '|UDGRPH;getVertices;$L;13| '|SPADreplace| 'QCAR) 

(SDEFUN |UDGRPH;getVertices;$L;13|
        ((|s| $)
         ($ |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)))))
        (QCAR |s|)) 

(SDEFUN |UDGRPH;getArrows;$L;14|
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
          (|revAr| #1#) (#2=#:G211 NIL) (|a| NIL) (|forwAr| #1#)
          (#3=#:G210 NIL))
         (SEQ (LETT |as| NIL)
              (SEQ (LETT |a| NIL) (LETT #3# (QCDR |s|)) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |forwAr|
                          (VECTOR (QVELT |a| 0) (QVELT |a| 1) (QVELT |a| 2)
                                  (QVELT |a| 3) (QVELT |a| 4) (QVELT |a| 5)
                                  (QVELT |a| 6)))
                    (EXIT (LETT |as| (SPADCALL |as| |forwAr| (QREFELT $ 22)))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |a| NIL) (LETT #2# (QCDR |s|)) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |revAr|
                          (VECTOR (QVELT |a| 0) (QVELT |a| 1) (QVELT |a| 3)
                                  (QVELT |a| 2) (QVELT |a| 4) (QVELT |a| 5)
                                  (QVELT |a| 6)))
                    (EXIT (LETT |as| (SPADCALL |as| |revAr| (QREFELT $ 22)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |as|)))) 

(PUT '|UDGRPH;initial;$;15| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(SDEFUN |UDGRPH;initial;$;15| (($ $)) (CONS NIL NIL)) 

(SDEFUN |UDGRPH;terminal;S$;16| ((|a| S) ($ $))
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
         (SEQ (LETT |o| (VECTOR |a| 0 0))
              (LETT |ar| (VECTOR "loop" 0 1 1 0 0 NIL))
              (EXIT (CONS (LIST |o|) (LIST |ar|)))))) 

(SDEFUN |UDGRPH;cycleOpen;LS$;17|
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
          (|o| #2#) (|ob| (S)) (#3=#:G227 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL) (LETT |ars| NIL) (LETT |arn| 1)
              (SEQ (LETT |obn| 1) (LETT #3# (LENGTH |objs|)) G190
                   (COND ((|greater_SI| |obn| #3#) (GO G191)))
                   (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 33)))
                        (LETT |o|
                              (VECTOR |ob|
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT $ 19))
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT $ 20))))
                        (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)))
                        (LETT |next| (+ |obn| 1))
                        (EXIT
                         (COND
                          ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 51))
                           (SEQ
                            (LETT |a|
                                  (VECTOR
                                   (STRCONC |arrowName| (STRINGIMAGE |arn|)) 0
                                   |obn| |next| 0 0 NIL))
                            (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 22)))
                            (EXIT (LETT |arn| (+ |arn| 1))))))))
                   (LETT |obn| (|inc_SI| |obn|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |UDGRPH;cycleClosed;LS$;18|
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
          (|o| #2#) (|ob| (S)) (#3=#:G237 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL) (LETT |ars| NIL) (LETT |arn| 1)
              (SEQ (LETT |obn| 1) (LETT #3# (LENGTH |objs|)) G190
                   (COND ((|greater_SI| |obn| #3#) (GO G191)))
                   (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 33)))
                        (LETT |o|
                              (VECTOR |ob|
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT $ 19))
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT $ 20))))
                        (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)))
                        (LETT |next| (+ |obn| 1))
                        (COND
                         ((EQL (- |next| 1) (LENGTH |objs|)) (LETT |next| 1)))
                        (EXIT
                         (COND
                          ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 51))
                           (SEQ
                            (LETT |a|
                                  (VECTOR
                                   (STRCONC |arrowName| (STRINGIMAGE |arn|)) 0
                                   |obn| |next| 0 0 NIL))
                            (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 22)))
                            (EXIT (LETT |arn| (+ |arn| 1))))))))
                   (LETT |obn| (|inc_SI| |obn|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |UDGRPH;unit;LS$;19| ((|objs| |List| S) (|arrowName| |String|) ($ $))
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
          (|o| #2#) (|ob| (S)) (#3=#:G245 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL) (LETT |ars| NIL) (LETT |arn| 1)
              (SEQ (LETT |obn| 1) (LETT #3# (LENGTH |objs|)) G190
                   (COND ((|greater_SI| |obn| #3#) (GO G191)))
                   (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 33)))
                        (LETT |o|
                              (VECTOR |ob|
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT $ 19))
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT $ 20))))
                        (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)))
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |obn| 0 0 NIL))
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 22)))
                        (EXIT (LETT |arn| (+ |arn| 1))))
                   (LETT |obn| (|inc_SI| |obn|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |UDGRPH;kgraph;LS$;20| ((|objs| |List| S) (|arrowName| |String|) ($ $))
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
          (|a| #1#) (#2=#:G257 NIL) (|obm| NIL)
          (|obs|
           (|List|
            #3=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #3#) (|ob| (S)) (#4=#:G256 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL) (LETT |ars| NIL) (LETT |arn| 1)
              (SEQ (LETT |obn| 1) (LETT #4# (LENGTH |objs|)) G190
                   (COND ((|greater_SI| |obn| #4#) (GO G191)))
                   (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 33)))
                        (LETT |o|
                              (VECTOR |ob|
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT $ 19))
                                      (SPADCALL (LENGTH |objs|) |obn|
                                                (QREFELT $ 20))))
                        (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)))
                        (EXIT
                         (SEQ (LETT |obm| 1) (LETT #2# (LENGTH |objs|)) G190
                              (COND ((|greater_SI| |obm| #2#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |obn| |obm| (QREFELT $ 55))
                                  (SEQ
                                   (LETT |a|
                                         (VECTOR
                                          (STRCONC |arrowName|
                                                   (STRINGIMAGE |arn|))
                                          0 |obn| |obm| 0 0 NIL))
                                   (LETT |ars|
                                         (SPADCALL |ars| |a| (QREFELT $ 22)))
                                   (EXIT (LETT |arn| (+ |arn| 1))))))))
                              (LETT |obm| (|inc_SI| |obm|)) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |obn| (|inc_SI| |obn|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |UDGRPH;+;3$;21| ((|a| $) (|b| $) ($ $))
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
          (|arr| #1#) (#2=#:G265 NIL) (|ba| NIL)
          (|bStart| (|NonNegativeInteger|))
          (|lo|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |lo| (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 57)))
              (LETT |bStart| (LENGTH (QCAR |a|))) (LETT |lb| NIL)
              (SEQ (LETT |ba| NIL) (LETT #2# (QCDR |b|)) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |ba| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |arr|
                          (VECTOR (QVELT |ba| 0) (QVELT |ba| 1)
                                  (+ (QVELT |ba| 2) |bStart|)
                                  (+ (QVELT |ba| 3) |bStart|) (QVELT |ba| 4)
                                  (QVELT |ba| 5) (QVELT |ba| 6)))
                    (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 22)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 58)))
              (EXIT (CONS |lo| |la|))))) 

(SDEFUN |UDGRPH;merge;3$;22| ((|a| $) (|b| $) ($ $))
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
          (#3=#:G286 NIL) (|ba| NIL) (|bStart| #4=(|NonNegativeInteger|))
          (|bmap| (|List| (|NonNegativeInteger|))) (#5=#:G274 NIL)
          (|newIndex| #4#)
          (|mergedObjects|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|i| (|Integer|)) (#6=#:G285 NIL) (|bob| NIL) (#7=#:G284 NIL)
          (|x| NIL) (#8=#:G283 NIL))
         (SEQ
          (LETT |bmap|
                (PROGN
                 (LETT #8# NIL)
                 (SEQ (LETT |x| 1) (LETT #7# (LENGTH (QCAR |a|))) G190
                      (COND ((|greater_SI| |x| #7#) (GO G191)))
                      (SEQ (EXIT (LETT #8# (CONS |x| #8#))))
                      (LETT |x| (|inc_SI| |x|)) (GO G190) G191
                      (EXIT (NREVERSE #8#)))))
          (LETT |newIndex| (LENGTH (QCAR |a|)))
          (LETT |mergedObjects| (QCAR |a|))
          (SEQ (LETT |bob| NIL) (LETT #6# (QCAR |b|)) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |bob| (CAR #6#)) NIL)) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |bob| (QCAR |a|) (QREFELT $ 60)))
                    (EXIT
                     (COND
                      ((< |i| 1)
                       (SEQ
                        (LETT |mergedObjects|
                              (SPADCALL |mergedObjects| |bob| (QREFELT $ 21)))
                        (LETT |newIndex| (+ |newIndex| 1))
                        (EXIT
                         (LETT |bmap|
                               (SPADCALL |bmap| |newIndex| (QREFELT $ 61))))))
                      ('T
                       (LETT |bmap|
                             (SPADCALL |bmap|
                                       (PROG1 (LETT #5# |i|)
                                         (|check_subtype2| (>= #5# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #5#))
                                       (QREFELT $ 61)))))))
               (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
          (LETT |bStart| (LENGTH (QCAR |a|))) (LETT |lb| NIL)
          (SEQ (LETT |ba| NIL) (LETT #3# (QCDR |b|)) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |ba| (CAR #3#)) NIL)) (GO G191)))
               (SEQ
                (LETT |toI|
                      (SPADCALL |bmap| (+ (QVELT |ba| 3) |bStart|)
                                (QREFELT $ 38)))
                (LETT |fromI|
                      (SPADCALL |bmap| (+ (QVELT |ba| 2) |bStart|)
                                (QREFELT $ 38)))
                (LETT |arr|
                      (VECTOR (QVELT |ba| 0) (QVELT |ba| 1) |fromI| |toI|
                              (QVELT |ba| 4) (QVELT |ba| 5) (QVELT |ba| 6)))
                (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 22)))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 58)))
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
          (|bxi| #3=(|NonNegativeInteger|)) (|bi| (S)) (#4=#:G297 NIL)
          (|boi| NIL) (|ayi| #2#) (|axi| #3#) (|ai| (S)) (#5=#:G296 NIL)
          (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL)
              (SEQ (LETT |aoi| NIL) (LETT #5# (QCAR |a|)) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |aoi| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ai| (QVELT |aoi| 0))
                        (LETT |axi| (QVELT |aoi| 1))
                        (LETT |ayi| (QVELT |aoi| 2))
                        (EXIT
                         (SEQ (LETT |boi| NIL) (LETT #4# (QCAR |b|)) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |boi| (CAR #4#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |bi| (QVELT |boi| 0))
                                   (LETT |bxi| (QVELT |boi| 1))
                                   (LETT |byi| (QVELT |boi| 2))
                                   (LETT |x|
                                         (+
                                          (* |bxi|
                                             (SPADCALL |a| (QREFELT $ 63)))
                                          |axi|))
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 64)))
                                          |ayi|))
                                   (LETT |widtha|
                                         (SPADCALL |a| (QREFELT $ 63)))
                                   (LETT |heighta|
                                         (SPADCALL |a| (QREFELT $ 64)))
                                   (LETT |sp|
                                         (SPADCALL |ai| |bi| (QREFELT $ 66)))
                                   (LETT |ob| (VECTOR |sp| |x| |y|))
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 69)))))
                              (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |UDGRPH;indexProd|
        ((|aObj| $) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G298 NIL))
               (+ |a|
                  (*
                   (PROG1 (LETT #1# (- |b| 1))
                     (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #1#))
                   (LENGTH (QCAR |aObj|)))))) 

(SDEFUN |UDGRPH;*;2$Ug;25|
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
          (|arr| #1#) (|an| (|String|)) (#2=#:G320 NIL) (|bv| NIL)
          (#3=#:G319 NIL) (|bu| NIL) (#4=#:G318 NIL) (|av| NIL) (#5=#:G317 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL)
              (SEQ (LETT |au| 1) (LETT #5# (LENGTH (QCAR |a|))) G190
                   (COND ((|greater_SI| |au| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |av| 1) (LETT #4# (LENGTH (QCAR |a|))) G190
                          (COND ((|greater_SI| |av| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |bu| 1) (LETT #3# (LENGTH (QCAR |b|)))
                                 G190
                                 (COND ((|greater_SI| |bu| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |bv| 1)
                                        (LETT #2# (LENGTH (QCAR |b|))) G190
                                        (COND
                                         ((|greater_SI| |bv| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |a| |au| |av|
                                                      (QREFELT $ 70))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 70))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          71))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          71)))
                                                      (QREFELT $ 73)))
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $
                                                                         22)))))))))))
                                        (LETT |bv| (|inc_SI| |bv|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|UDGRPH;objProd| |a| |b| $) |newArrs|
                         (QREFELT $ 75)))))) 

(SDEFUN |UDGRPH;cartesian;2$Ug;26|
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
          (|arr| #1#) (|an| (|String|)) (#2=#:G345 NIL) (|bv| NIL)
          (#3=#:G344 NIL) (|bu| NIL) (#4=#:G343 NIL) (|av| NIL) (#5=#:G342 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL)
              (SEQ (LETT |au| 1) (LETT #5# (LENGTH (QCAR |a|))) G190
                   (COND ((|greater_SI| |au| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |av| 1) (LETT #4# (LENGTH (QCAR |a|))) G190
                          (COND ((|greater_SI| |av| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |bu| 1) (LETT #3# (LENGTH (QCAR |b|)))
                                 G190
                                 (COND ((|greater_SI| |bu| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |bv| 1)
                                        (LETT #2# (LENGTH (QCAR |b|))) G190
                                        (COND
                                         ((|greater_SI| |bv| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((EQL |bu| |bv|)
                                            (COND
                                             ((SPADCALL |a| |au| |av|
                                                        (QREFELT $ 70))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            70))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              71))
                                                           #6="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 73)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              71))
                                                           #7="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 73)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            71))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 73)))))
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $
                                                                         22))))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT $ 70))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              70))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        $ 71))
                                                             #6#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT $ 73)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        $ 71))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT $ 73)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              71))
                                                           #7#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 73)))))
                                                 (LETT |arr|
                                                       (VECTOR |an| 0
                                                               (|UDGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                $)
                                                               (|UDGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                $)
                                                               0 0 NIL))
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT $
                                                                           22))))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 70))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            70))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              71))
                                                           #6#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 73)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              71))
                                                           #7#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 73)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            71))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 73)))))
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $
                                                                         22)))))))))))
                                        (LETT |bv| (|inc_SI| |bv|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|UDGRPH;objProd| |a| |b| $) |newArrs|
                         (QREFELT $ 75)))))) 

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
          (|x| #3#) (|byi| #2#) (|bxi| #1#) (|bi| (S)) (#4=#:G354 NIL)
          (|boi| NIL) (|ayi| #2#) (|axi| #1#) (|ai| (S)) (#5=#:G353 NIL)
          (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL)
              (SEQ (LETT |aoi| NIL) (LETT #5# (QCAR |a|)) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |aoi| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ai| (QVELT |aoi| 0))
                        (LETT |axi| (QVELT |aoi| 1))
                        (LETT |ayi| (QVELT |aoi| 2))
                        (EXIT
                         (SEQ (LETT |boi| NIL) (LETT #4# (QCAR |b|)) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |boi| (CAR #4#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |bi| (QVELT |boi| 0))
                                   (LETT |bxi| (QVELT |boi| 1))
                                   (LETT |byi| (QVELT |boi| 2))
                                   (LETT |x|
                                         (+
                                          (* |bxi|
                                             (SPADCALL |a| (QREFELT $ 63)))
                                          |axi|))
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 64)))
                                          |ayi|))
                                   (LETT |widtha|
                                         (SPADCALL |a| (QREFELT $ 63)))
                                   (LETT |heighta|
                                         (SPADCALL |a| (QREFELT $ 64)))
                                   (LETT |sp| (SPADCALL |ai| |bi| |f|))
                                   (LETT |ob| (VECTOR |sp| |x| |y|))
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 21)))))
                              (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |UDGRPH;closedTensor;2$M$;28|
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
          (|arr| #1#) (|an| (|String|)) (#2=#:G375 NIL) (|bv| NIL)
          (#3=#:G374 NIL) (|bu| NIL) (#4=#:G373 NIL) (|av| NIL) (#5=#:G372 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL)
              (SEQ (LETT |au| 1) (LETT #5# (LENGTH (QCAR |a|))) G190
                   (COND ((|greater_SI| |au| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |av| 1) (LETT #4# (LENGTH (QCAR |a|))) G190
                          (COND ((|greater_SI| |av| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |bu| 1) (LETT #3# (LENGTH (QCAR |b|)))
                                 G190
                                 (COND ((|greater_SI| |bu| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |bv| 1)
                                        (LETT #2# (LENGTH (QCAR |b|))) G190
                                        (COND
                                         ((|greater_SI| |bv| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |a| |au| |av|
                                                      (QREFELT $ 70))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 70))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          71))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          71)))
                                                      (QREFELT $ 73)))
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $
                                                                         22)))))))))))
                                        (LETT |bv| (|inc_SI| |bv|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|UDGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                         (QREFELT $ 17)))))) 

(SDEFUN |UDGRPH;closedCartesian;2$M$;29|
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
          (|arr| #1#) (|an| (|String|)) (#2=#:G401 NIL) (|bv| NIL)
          (#3=#:G400 NIL) (|bu| NIL) (#4=#:G399 NIL) (|av| NIL) (#5=#:G398 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL)
              (SEQ (LETT |au| 1) (LETT #5# (LENGTH (QCAR |a|))) G190
                   (COND ((|greater_SI| |au| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |av| 1) (LETT #4# (LENGTH (QCAR |a|))) G190
                          (COND ((|greater_SI| |av| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |bu| 1) (LETT #3# (LENGTH (QCAR |b|)))
                                 G190
                                 (COND ((|greater_SI| |bu| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |bv| 1)
                                        (LETT #2# (LENGTH (QCAR |b|))) G190
                                        (COND
                                         ((|greater_SI| |bv| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((EQL |bu| |bv|)
                                            (COND
                                             ((SPADCALL |a| |au| |av|
                                                        (QREFELT $ 70))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            70))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              71))
                                                           #6="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 73)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              71))
                                                           #7="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 73)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            71))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 73)))))
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $
                                                                         22))))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT $ 70))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              70))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        $ 71))
                                                             #6#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT $ 73)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        $ 71))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT $ 73)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              71))
                                                           #7#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 73)))))
                                                 (LETT |arr|
                                                       (VECTOR |an| 0
                                                               (|UDGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                $)
                                                               (|UDGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                $)
                                                               0 0 NIL))
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT $
                                                                           22))))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 70))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            70))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              71))
                                                           #6#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 73)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              71))
                                                           #7#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 73)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            71))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 73)))))
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL))
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $
                                                                         22)))))))))))
                                        (LETT |bv| (|inc_SI| |bv|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|UDGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                         (QREFELT $ 17)))))) 

(SDEFUN |UDGRPH;map;$LL2I$;30|
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
          (|newArr| #2#) (#3=#:G418 NIL) (|oldArrow| NIL) (#4=#:G406 NIL)
          (#5=#:G405 NIL) (|i| (|NonNegativeInteger|)) (#6=#:G417 NIL)
          (|oi| NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#7=#:G416 NIL) (|o| NIL) (#8=#:G415 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #8# NIL)
                 (SEQ (LETT |o| NIL) (LETT #7# |newOb|) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |o| (CAR #7#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #8# (CONS (VECTOR |o| 0 0) #8#))))
                      (LETT #7# (CDR #7#)) (GO G190) G191
                      (EXIT (NREVERSE #8#)))))
          (SEQ (LETT |oi| 1) (LETT #6# (LENGTH (QCAR |s|))) G190
               (COND ((|greater_SI| |oi| #6#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 38)))
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 81))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 81))
                                            1)
                                           |offsetX|))
                                  (|check_subtype2| (>= #5# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #5#))
                                (PROG1
                                    (LETT #4#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 81))
                                            2)
                                           |offsetY|))
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#)))
                               (QREFELT $ 82))))
               (LETT |oi| (|inc_SI| |oi|)) (GO G190) G191 (EXIT NIL))
          (LETT |newArrs| NIL)
          (SEQ (LETT |oldArrow| NIL) (LETT #3# (QCDR |s|)) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |oldArrow| (CAR #3#)) NIL))
                 (GO G191)))
               (SEQ
                (LETT |newArr|
                      (VECTOR (QVELT |oldArrow| 0) (QVELT |oldArrow| 1)
                              (SPADCALL |m| (QVELT |oldArrow| 2)
                                        (QREFELT $ 38))
                              (SPADCALL |m| (QVELT |oldArrow| 3)
                                        (QREFELT $ 38))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6)))
                (EXIT
                 (LETT |newArrs|
                       (SPADCALL |newArrs| |newArr| (QREFELT $ 22)))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(SDEFUN |UDGRPH;mapContra;$LL2I$;31|
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
          (|newArr| #2#) (#3=#:G435 NIL) (|oldArrow| NIL) (#4=#:G423 NIL)
          (#5=#:G422 NIL) (|i| (|NonNegativeInteger|)) (#6=#:G434 NIL)
          (|oi| NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#7=#:G433 NIL) (|o| NIL) (#8=#:G432 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #8# NIL)
                 (SEQ (LETT |o| NIL) (LETT #7# |newOb|) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |o| (CAR #7#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #8# (CONS (VECTOR |o| 0 0) #8#))))
                      (LETT #7# (CDR #7#)) (GO G190) G191
                      (EXIT (NREVERSE #8#)))))
          (SEQ (LETT |oi| 1) (LETT #6# (LENGTH (QCAR |s|))) G190
               (COND ((|greater_SI| |oi| #6#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 38)))
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 81))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 81))
                                            1)
                                           |offsetX|))
                                  (|check_subtype2| (>= #5# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #5#))
                                (PROG1
                                    (LETT #4#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 81))
                                            2)
                                           |offsetY|))
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#)))
                               (QREFELT $ 82))))
               (LETT |oi| (|inc_SI| |oi|)) (GO G190) G191 (EXIT NIL))
          (LETT |newArrs| NIL)
          (SEQ (LETT |oldArrow| NIL) (LETT #3# (QCDR |s|)) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |oldArrow| (CAR #3#)) NIL))
                 (GO G191)))
               (SEQ
                (LETT |newArr|
                      (VECTOR (QVELT |oldArrow| 0) (QVELT |oldArrow| 1)
                              (SPADCALL |m| (QVELT |oldArrow| 3)
                                        (QREFELT $ 38))
                              (SPADCALL |m| (QVELT |oldArrow| 2)
                                        (QREFELT $ 38))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6)))
                (EXIT
                 (LETT |newArrs|
                       (SPADCALL |newArrs| |newArr| (QREFELT $ 22)))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(SDEFUN |UDGRPH;coerce;Fp$;32| ((|poset| |FinitePoset| S) ($ $))
        (SPADCALL |poset| (QREFELT $ 31))) 

(SDEFUN |UDGRPH;coerce;$Of;33| ((|n| $) ($ |OutputForm|))
        (SPROG
         ((|arrows| #1=(|OutputForm|)) (|laof| (|List| (|OutputForm|)))
          (#2=#:G447 NIL) (|ar| NIL) (#3=#:G446 NIL) (#4=#:G443 NIL)
          (|la|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|vertices| #1#) (|lvof| (|List| (|OutputForm|))) (#5=#:G445 NIL)
          (|v| NIL) (#6=#:G444 NIL)
          (|lv|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |vertices| (SPADCALL "Vertices: " (QREFELT $ 87)))
                (LETT |lv| (SPADCALL |n| (QREFELT $ 47)))
                (LETT |lvof|
                      (PROGN
                       (LETT #6# NIL)
                       (SEQ (LETT |v| NIL) (LETT #5# |lv|) G190
                            (COND
                             ((OR (ATOM #5#) (PROGN (LETT |v| (CAR #5#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #6#
                                    (CONS
                                     (SPADCALL (QVELT |v| 0) (QREFELT $ 88))
                                     #6#))))
                            (LETT #5# (CDR #5#)) (GO G190) G191
                            (EXIT (NREVERSE #6#)))))
                (LETT |vertices|
                      (SPADCALL |vertices| (SPADCALL |lvof| (QREFELT $ 89))
                                (QREFELT $ 90)))
                (LETT |arrows| (SPADCALL "Edges: " (QREFELT $ 87)))
                (LETT |la| (SPADCALL |n| (QREFELT $ 48)))
                (COND
                 ((NULL |la|) (PROGN (LETT #4# |vertices|) (GO #7=#:G442))))
                (LETT |laof|
                      (PROGN
                       (LETT #3# NIL)
                       (SEQ (LETT |ar| NIL) (LETT #2# |la|) G190
                            (COND
                             ((OR (ATOM #2#) (PROGN (LETT |ar| (CAR #2#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #3#
                                    (CONS
                                     (SPADCALL
                                      (LIST
                                       (SPADCALL (QVELT |ar| 2) (QREFELT $ 91))
                                       (SPADCALL "-" (QREFELT $ 87))
                                       (SPADCALL (QVELT |ar| 3)
                                                 (QREFELT $ 91)))
                                      (QREFELT $ 92))
                                     #3#))))
                            (LETT #2# (CDR #2#)) (GO G190) G191
                            (EXIT (NREVERSE #3#)))))
                (LETT |arrows|
                      (SPADCALL |arrows| (SPADCALL |laof| (QREFELT $ 89))
                                (QREFELT $ 90)))
                (EXIT (SPADCALL (LIST |vertices| |arrows|) (QREFELT $ 93)))))
          #7# (EXIT #4#)))) 

(SDEFUN |UDGRPH;subdiagramSvg;S$2BV;34|
        ((|sc| |Scene| (|SCartesian| 2)) (|n| $)
         (|dispArrowName| . #1=(|Boolean|)) (|deep| . #1#) ($ |Void|))
        (SPROG
         ((#2=#:G465 NIL) (|s| (|String|))
          (|arrNode| (|Scene| (|SCartesian| 2))) (|offset| (|SCartesian| 2))
          (|tnode| #3=(|Scene| (|SCartesian| 2))) (|fnode| #3#)
          (|rema| (|Integer|)) (|arrNumber| (|Integer|))
          (|arrIndex| (|List| (|NonNegativeInteger|)))
          (|midY| #4=(|NonNegativeInteger|)) (|midX| #4#)
          (|toY| #5=(|NonNegativeInteger|)) (#6=#:G458 NIL) (|fromY| #5#)
          (#7=#:G457 NIL) (|toX| #5#) (#8=#:G456 NIL) (|fromX| #5#)
          (#9=#:G455 NIL) (#10=#:G467 NIL) (|arrow| NIL) (#11=#:G468 NIL)
          (|arrn| NIL)
          (|innerOb|
           (|List|
            (|List|
             (|Record| (|:| |value| (|DirectedGraph| (|String|)))
                       (|:| |posX| (|NonNegativeInteger|))
                       (|:| |posY| (|NonNegativeInteger|))))))
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|indexBounds| (|List| (|Scene| (|SCartesian| 2))))
          (|tn| (|Scene| (|SCartesian| 2)))
          (|indexPointy| (|List| (|NonNegativeInteger|)))
          (|indexPointx| (|List| (|NonNegativeInteger|)))
          (|y| (|NonNegativeInteger|)) (|x| (|NonNegativeInteger|))
          (|indexNodes| (|List| S)) (#12=#:G466 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|mt| (|Scene| (|SCartesian| 2))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mt|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "black"
                            "black" (QREFELT $ 97)))
            (LETT |ls| (SPADCALL |n| (QREFELT $ 47))) (LETT |indexPointx| NIL)
            (LETT |indexPointy| NIL) (LETT |indexBounds| NIL)
            (LETT |indexNodes| NIL)
            (SEQ (LETT |i| NIL) (LETT #12# |ls|) G190
                 (COND
                  ((OR (ATOM #12#) (PROGN (LETT |i| (CAR #12#)) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |indexNodes|
                        (SPADCALL |indexNodes| (QVELT |i| 0) (QREFELT $ 98)))
                  (LETT |s| (|mathObject2String| (QVELT |i| 0)))
                  (LETT |x| (QVELT |i| 1)) (LETT |y| (QVELT |i| 2))
                  (LETT |indexPointx|
                        (SPADCALL |indexPointx| |x| (QREFELT $ 61)))
                  (LETT |indexPointy|
                        (SPADCALL |indexPointy| |y| (QREFELT $ 61)))
                  (LETT |tn|
                        (SPADCALL |sc| |s| 32
                                  (SPADCALL |x| |y| (QREFELT $ 100))
                                  (QREFELT $ 101)))
                  (EXIT
                   (LETT |indexBounds|
                         (SPADCALL |indexBounds| |tn| (QREFELT $ 103)))))
                 (LETT #12# (CDR #12#)) (GO G190) G191 (EXIT NIL))
            (LETT |arrs| (SPADCALL |n| (QREFELT $ 48)))
            (COND
             ((NULL |arrs|)
              (PROGN (LETT #2# (SPADCALL (QREFELT $ 105))) (GO #13=#:G464))))
            (LETT |innerOb| NIL)
            (SEQ (LETT |arrn| 1) (LETT #11# (LENGTH |arrs|)) (LETT |arrow| NIL)
                 (LETT #10# |arrs|) G190
                 (COND
                  ((OR (ATOM #10#) (PROGN (LETT |arrow| (CAR #10#)) NIL)
                       (|greater_SI| |arrn| #11#))
                   (GO G191)))
                 (SEQ
                  (LETT |fromX|
                        (SPADCALL |indexPointx| (QVELT |arrow| 2)
                                  (QREFELT $ 38)))
                  (LETT |toX|
                        (SPADCALL |indexPointx| (QVELT |arrow| 3)
                                  (QREFELT $ 38)))
                  (LETT |fromY|
                        (SPADCALL |indexPointy| (QVELT |arrow| 2)
                                  (QREFELT $ 38)))
                  (LETT |toY|
                        (SPADCALL |indexPointy| (QVELT |arrow| 3)
                                  (QREFELT $ 38)))
                  (LETT |fromX|
                        (PROG1 (LETT #9# (+ |fromX| (QVELT |arrow| 4)))
                          (|check_subtype2| (>= #9# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #9#)))
                  (LETT |toX|
                        (PROG1 (LETT #8# (+ |toX| (QVELT |arrow| 4)))
                          (|check_subtype2| (>= #8# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #8#)))
                  (LETT |fromY|
                        (PROG1 (LETT #7# (+ |fromY| (QVELT |arrow| 5)))
                          (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #7#)))
                  (LETT |toY|
                        (PROG1 (LETT #6# (+ |toY| (QVELT |arrow| 5)))
                          (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #6#)))
                  (LETT |midX| (ASH (+ |toX| |fromX|) -1))
                  (LETT |midY| (ASH (+ |toY| |fromY|) -1))
                  (LETT |arrIndex|
                        (SPADCALL |n| (QVELT |arrow| 2) (QREFELT $ 106)))
                  (LETT |arrNumber|
                        (SPADCALL |arrn| |arrIndex| (QREFELT $ 107)))
                  (LETT |rema| (QCDR (DIVIDE2 |arrNumber| 8)))
                  (LETT |fnode|
                        (SPADCALL |indexBounds| (QVELT |arrow| 2)
                                  (QREFELT $ 108)))
                  (LETT |tnode|
                        (SPADCALL |indexBounds| (QVELT |arrow| 3)
                                  (QREFELT $ 108)))
                  (LETT |offset|
                        (SPADCALL (QVELT |arrow| 4) (QVELT |arrow| 5)
                                  (QREFELT $ 100)))
                  (LETT |arrNode|
                        (SPADCALL |mt| |fnode| |tnode|
                                  (FLOAT (+ (SPADCALL |n| (QREFELT $ 63)) 10)
                                         MOST-POSITIVE-DOUBLE-FLOAT)
                                  |deep| (QREFELT $ 109)))
                  (EXIT
                   (COND
                    (|dispArrowName|
                     (SEQ (LETT |s| (QVELT |arrow| 0))
                          (EXIT
                           (SPADCALL |mt| |s| 32
                                     (SPADCALL |midX| |midY| (QREFELT $ 100))
                                     (QREFELT $ 101))))))))
                 (LETT #10# (PROG1 (CDR #10#) (LETT |arrn| (|inc_SI| |arrn|))))
                 (GO G190) G191 (EXIT NIL))
            (EXIT (PROGN (LETT #2# (SPADCALL (QREFELT $ 105))) (GO #13#)))))
          #13# (EXIT #2#)))) 

(SDEFUN |UDGRPH;diagramSvg;S$BV;35|
        ((|fileName| |String|) (|n| $) (|dispArrowName| |Boolean|) ($ |Void|))
        (SPROG
         ((|sc| (|Scene| (|SCartesian| 2)))
          (|view| (|SBoundary| (|SCartesian| 2))))
         (SEQ
          (LETT |view|
                (SPADCALL (SPADCALL 0 0 (QREFELT $ 100))
                          (SPADCALL (+ (SPADCALL |n| (QREFELT $ 63)) 10)
                                    (+ (SPADCALL |n| (QREFELT $ 64)) 10)
                                    (QREFELT $ 100))
                          (QREFELT $ 112)))
          (LETT |sc| (SPADCALL |view| (QREFELT $ 113)))
          (SPADCALL |sc| |n| |dispArrowName| 'T (QREFELT $ 110))
          (EXIT (SPADCALL |sc| |fileName| (QREFELT $ 114)))))) 

(SDEFUN |UDGRPH;diagramSvg2;S$BV;36|
        ((|fileName| |String|) (|n| $) (|dispArrowName| |Boolean|) ($ |Void|))
        (SPROG
         ((|sc| (|Scene| (|SCartesian| 2)))
          (|view| (|SBoundary| (|SCartesian| 2))))
         (SEQ
          (LETT |view|
                (SPADCALL (SPADCALL 0 0 (QREFELT $ 100))
                          (SPADCALL (+ (SPADCALL |n| (QREFELT $ 63)) 10)
                                    (+ (SPADCALL |n| (QREFELT $ 64)) 10)
                                    (QREFELT $ 100))
                          (QREFELT $ 112)))
          (LETT |sc| (SPADCALL |view| (QREFELT $ 113)))
          (SPADCALL |sc| |n| |dispArrowName| NIL (QREFELT $ 110))
          (EXIT (SPADCALL |sc| |fileName| (QREFELT $ 114)))))) 

(DECLAIM (NOTINLINE |UndirectedGraph;|)) 

(DEFUN |UndirectedGraph| (#1=#:G473)
  (SPROG NIL
         (PROG (#2=#:G474)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|UndirectedGraph|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|UndirectedGraph;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|UndirectedGraph|)))))))))) 

(DEFUN |UndirectedGraph;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|UndirectedGraph| DV$1))
          (LETT $ (GETREFV 125))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
              (|Record| (|:| |value| 6) (|:| |posX| 18) (|:| |posY| 18))
              (|List| 12) |UDGRPH;undirectedGraph;L$;3|
              (|Record| (|:| |name| 44) (|:| |arrType| 18) (|:| |fromOb| 18)
                        (|:| |toOb| 18) (|:| |xOffset| 32) (|:| |yOffset| 32)
                        (|:| |map| 34))
              (|List| 15) |UDGRPH;undirectedGraph;LL$;4| (|NonNegativeInteger|)
              (0 . |createX|) (6 . |createY|) (12 . |concat|) (18 . |concat|)
              (|Record| (|:| |fromOb| 18) (|:| |toOb| 18)) (|List| 23)
              |UDGRPH;undirectedGraph;LL$;5| (|FinitePoset| 6) (24 . |getVert|)
              (|List| (|List| 8)) (29 . |getArr|) (34 . |concat|)
              |UDGRPH;undirectedGraph;Fp$;6| (|Integer|) (40 . |elt|)
              (|List| 18) (|List| 34) (46 . |elt|) (52 . |#|) (57 . |elt|)
              |UDGRPH;undirectedGraph;LL$;7| (63 . =) |UDGRPH;addObject!;$S$;8|
              |UDGRPH;addObject!;$R$;9| |UDGRPH;addArrow!;$R$;10| (|String|)
              |UDGRPH;addArrow!;$S2Nni$;11| |UDGRPH;addArrow!;$S2NniL$;12|
              |UDGRPH;getVertices;$L;13| |UDGRPH;getArrows;$L;14|
              |UDGRPH;initial;$;15| |UDGRPH;terminal;S$;16| (69 . <=)
              |UDGRPH;cycleOpen;LS$;17| |UDGRPH;cycleClosed;LS$;18|
              |UDGRPH;unit;LS$;19| (75 . ~=) |UDGRPH;kgraph;LS$;20|
              (81 . |concat|) (87 . |concat|) |UDGRPH;+;3$;21|
              (93 . |position|) (99 . |concat|) |UDGRPH;merge;3$;22|
              (105 . |diagramWidth|) (110 . |diagramHeight|) (|Product| 6 6)
              (115 . |construct|)
              (|Record| (|:| |value| 65) (|:| |posX| 18) (|:| |posY| 18))
              (|List| 67) (121 . |concat|) (127 . |isDirectSuccessor?|)
              (134 . |arrowName|) (|List| $) (141 . |concat|)
              (|UndirectedGraph| 65) (146 . |undirectedGraph|)
              |UDGRPH;*;2$Ug;25| |UDGRPH;cartesian;2$Ug;26| (|Mapping| 6 6 6)
              |UDGRPH;closedTensor;2$M$;28| |UDGRPH;closedCartesian;2$M$;29|
              (152 . |elt|) (158 . |setelt!|) |UDGRPH;map;$LL2I$;30|
              |UDGRPH;mapContra;$LL2I$;31| |UDGRPH;coerce;Fp$;32|
              (|OutputForm|) (165 . |message|) (170 . |coerce|)
              (175 . |commaSeparate|) (180 . |hconcat|) (186 . |coerce|)
              (191 . |hconcat|) (196 . |pile|) |UDGRPH;coerce;$Of;33|
              (|DoubleFloat|) (|Scene| 99) (201 . |addSceneMaterial|)
              (209 . |concat|) (|SCartesian| '2) (215 . |sipnt|)
              (221 . |addSceneText|) (|List| 96) (229 . |concat|) (|Void|)
              (235 . |void|) (239 . |arrowsToNode|) (245 . |position|)
              (251 . |elt|) (257 . |addSceneLine|)
              |UDGRPH;subdiagramSvg;S$2BV;34| (|SBoundary| 99)
              (266 . |boxBoundary|) (272 . |createSceneRoot|)
              (277 . |writeSvgQuantised|) |UDGRPH;diagramSvg;S$BV;35|
              |UDGRPH;diagramSvg2;S$BV;36| (|Matrix| 32) (|Matrix| 18)
              (|List| (|Loop|)) (|Tree| 32) (|List| 120) (|DirectedGraph| $)
              (|SingleInteger|) (|HashState|))
           '#(~= 283 |unit| 289 |undirectedGraph| 295 |terminal| 328
              |subdiagramSvg| 333 |spanningTreeNode| 341 |spanningTreeArrow|
              347 |spanningForestNode| 353 |spanningForestArrow| 358
              |routeNodes| 363 |routeArrows| 370 |outDegree| 377 |nodeToNode|
              383 |nodeToArrow| 389 |nodeFromNode| 395 |nodeFromArrow| 401
              |min| 407 |merge| 418 |max| 424 |mapContra| 435 |map| 444
              |looseEquals| 453 |loopsNodes| 459 |loopsAtNode| 464
              |loopsArrows| 470 |latex| 475 |laplacianMatrix| 480 |kgraph| 485
              |isGreaterThan?| 491 |isFunctional?| 498 |isFixPoint?| 503
              |isDirected?| 509 |isDirectSuccessor?| 513 |isAcyclic?| 520
              |initial| 525 |incidenceMatrix| 529 |inDegree| 534 |hashUpdate!|
              540 |hash| 546 |getVertices| 551 |getVertexIndex| 556 |getArrows|
              562 |getArrowIndex| 567 |flatten| 574 |distanceMatrix| 579
              |distance| 584 |diagramsSvg| 591 |diagramWidth| 598 |diagramSvg2|
              603 |diagramSvg| 610 |diagramHeight| 617 |deepDiagramSvg| 622
              |cycleOpen| 629 |cycleClosed| 635 |createY| 641 |createX| 647
              |createWidth| 653 |coerce| 658 |closedTensor| 668
              |closedCartesian| 675 |cartesian| 682 |arrowsToNode| 688
              |arrowsToArrow| 694 |arrowsFromNode| 700 |arrowsFromArrow| 706
              |arrowName| 712 |adjacencyMatrix| 719 |addObject!| 724
              |addArrow!| 736 = 767 + 773 * 779)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|) (|BasicType|)
                           (|CoercibleTo| 86))
                        (|makeByteWordVec2| 124
                                            '(2 0 18 18 18 19 2 0 18 18 18 20 2
                                              13 0 0 12 21 2 16 0 0 15 22 1 26
                                              10 0 27 1 26 28 0 29 2 24 0 0 23
                                              30 2 10 6 0 32 33 2 35 34 0 32 36
                                              1 34 18 0 37 2 34 18 0 32 38 2 13
                                              8 0 0 40 2 18 8 0 0 51 2 18 8 0 0
                                              55 2 13 0 0 0 57 2 16 0 0 0 58 2
                                              13 32 12 0 60 2 34 0 0 18 61 1 0
                                              18 0 63 1 0 18 0 64 2 65 0 6 6 66
                                              2 68 0 0 67 69 3 0 8 0 18 18 70 3
                                              0 44 0 18 18 71 1 44 0 72 73 2 74
                                              0 68 16 75 2 13 12 0 32 81 3 13
                                              12 0 32 12 82 1 86 0 44 87 1 6 86
                                              0 88 1 86 0 72 89 2 86 0 0 0 90 1
                                              18 86 0 91 1 86 0 72 92 1 86 0 72
                                              93 4 96 0 0 95 44 44 97 2 10 0 0
                                              6 98 2 99 0 32 32 100 4 96 0 0 44
                                              18 99 101 2 102 0 0 96 103 0 104
                                              0 105 2 0 34 0 18 106 2 34 32 18
                                              0 107 2 102 96 0 32 108 5 96 0 0
                                              0 0 95 8 109 2 111 0 99 99 112 1
                                              96 0 111 113 2 96 104 0 44 114 2
                                              0 8 0 0 1 2 0 0 10 44 54 2 0 0 10
                                              35 39 1 0 0 26 31 2 0 0 13 16 17
                                              2 0 0 10 24 25 1 0 0 10 11 1 0 0
                                              13 14 1 0 0 6 50 4 0 104 96 0 8 8
                                              110 2 0 120 0 18 1 2 0 120 0 18 1
                                              1 0 121 0 1 1 0 121 0 1 3 0 34 0
                                              18 18 1 3 0 34 0 18 18 1 2 0 18 0
                                              18 1 2 0 34 0 18 1 2 0 34 0 18 1
                                              2 0 34 0 18 1 2 0 34 0 18 1 2 0
                                              18 0 34 1 1 0 18 0 1 2 0 0 0 0 62
                                              1 0 18 0 1 2 0 18 0 34 1 5 0 0 0
                                              34 10 32 32 84 5 0 0 0 34 10 32
                                              32 83 2 0 8 0 0 1 1 0 119 0 1 2 0
                                              119 0 18 1 1 0 119 0 1 1 0 44 0 1
                                              1 0 117 0 1 2 0 0 10 44 56 3 0 8
                                              0 18 18 1 1 0 8 0 1 2 0 8 0 18 1
                                              0 0 8 9 3 0 8 0 18 18 70 1 0 8 0
                                              1 0 0 0 49 1 0 117 0 1 2 0 18 0
                                              18 1 2 0 124 124 0 1 1 0 123 0 1
                                              1 0 13 0 47 2 0 18 0 6 1 1 0 16 0
                                              48 3 0 18 0 18 18 1 1 0 0 122 1 1
                                              0 117 0 1 3 0 32 0 18 18 1 3 0
                                              104 44 72 8 1 1 0 18 0 63 3 0 104
                                              44 0 8 116 3 0 104 44 0 8 115 1 0
                                              18 0 64 3 0 104 44 0 8 1 2 0 0 10
                                              44 52 2 0 0 10 44 53 2 0 18 18 18
                                              20 2 0 18 18 18 19 1 0 18 18 1 1
                                              0 0 26 85 1 0 86 0 94 3 0 0 0 0
                                              78 79 3 0 0 0 0 78 80 2 0 74 0 0
                                              77 2 0 34 0 18 106 2 0 34 0 18 1
                                              2 0 34 0 18 1 2 0 34 0 18 1 3 0
                                              44 0 18 18 71 1 0 118 0 1 2 0 0 0
                                              6 41 2 0 0 0 12 42 4 0 0 0 44 6 6
                                              1 4 0 0 0 44 18 18 45 5 0 0 0 44
                                              18 18 34 46 2 0 0 0 15 43 2 0 8 0
                                              0 1 2 0 0 0 0 59 2 0 74 0 0
                                              76)))))
           '|lookupComplete|)) 
