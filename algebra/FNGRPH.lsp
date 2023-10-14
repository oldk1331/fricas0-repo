
(SDEFUN |FNGRPH;functionGraph;L$;1| ((|ob| |List| S) ($ $))
        (SPROG
         ((|objs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))
                      (|:| |next| (|NonNegativeInteger|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (#1=#:G121 NIL) (|x| NIL) (#2=#:G120 NIL))
         (SEQ
          (LETT |objs|
                (PROGN
                 (LETT #2# NIL . #3=(|FNGRPH;functionGraph;L$;1|))
                 (SEQ (LETT |x| NIL . #3#) (LETT #1# |ob| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (VECTOR |x| 0 0 0 NIL) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (LIST |objs|))))) 

(PUT '|FNGRPH;functionGraph;L$;2| '|SPADreplace| 'LIST) 

(SDEFUN |FNGRPH;functionGraph;L$;2|
        ((|ob| |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|))
                    (|:| |next| (|NonNegativeInteger|))
                    (|:| |map| (|List| (|NonNegativeInteger|)))))
         ($ $))
        (LIST |ob|)) 

(SDEFUN |FNGRPH;functionGraph;LL$;3|
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
        (SPROG
         ((|fobs|
           (|List|
            #1=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |next| (|NonNegativeInteger|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|fo| #1#)
          (|f|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (#2=#:G145 NIL) (|fn| NIL) (|too| (|NonNegativeInteger|))
          (|fromo| (|NonNegativeInteger|)) (#3=#:G144 NIL) (|a| NIL)
          (|arrs| (|List| (|NonNegativeInteger|))) (#4=#:G143 NIL) (|x| NIL)
          (#5=#:G142 NIL))
         (SEQ
          (LETT |arrs|
                (PROGN
                 (LETT #5# NIL . #6=(|FNGRPH;functionGraph;LL$;3|))
                 (SEQ (LETT |x| 1 . #6#) (LETT #4# (LENGTH |ob|) . #6#) G190
                      (COND ((|greater_SI| |x| #4#) (GO G191)))
                      (SEQ (EXIT (LETT #5# (CONS |x| #5#) . #6#)))
                      (LETT |x| (|inc_SI| |x|) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #6#)
          (SEQ (LETT |a| NIL . #6#) (LETT #3# |ar| . #6#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #6#) NIL))
                 (GO G191)))
               (SEQ (LETT |fromo| (QVELT |a| 2) . #6#)
                    (LETT |too| (QVELT |a| 3) . #6#)
                    (EXIT (SPADCALL |arrs| |fromo| |too| (QREFELT $ 16))))
               (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |fobs| NIL . #6#)
          (SEQ (LETT |fn| 1 . #6#) (LETT #2# (LENGTH |ob|) . #6#) G190
               (COND ((|greater_SI| |fn| #2#) (GO G191)))
               (SEQ (LETT |f| (SPADCALL |ob| |fn| (QREFELT $ 19)) . #6#)
                    (LETT |fo|
                          (VECTOR (QVELT |f| 0) (QVELT |f| 1) (QVELT |f| 2)
                                  (SPADCALL |arrs| |fn| (QREFELT $ 20)) NIL)
                          . #6#)
                    (EXIT
                     (LETT |fobs| (SPADCALL |fobs| |fo| (QREFELT $ 21))
                           . #6#)))
               (LETT |fn| (|inc_SI| |fn|) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |fobs|))))) 

(SDEFUN |FNGRPH;functionGraph;L$;4| ((|perms| |List| (|Permutation| S)) ($ $))
        (SPROG
         ((|obs|
           (|List|
            #1=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |next| (|NonNegativeInteger|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|o| #1#) (|n| (|NonNegativeInteger|)) (#2=#:G158 NIL) (|j| NIL)
          (#3=#:G156 NIL) (|vert| NIL) (#4=#:G157 NIL) (|i| NIL)
          (|preim| #5=(|List| S)) (|im| #6=(|List| S))
          (|lr| (|Record| (|:| |preimage| #5#) (|:| |image| #6#)))
          (|perm| (|Permutation| S)))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |perms|) 1 (QREFELT $ 28))
            (|error| "functionGraph only needs one permutation")))
          (LETT |obs| NIL . #7=(|FNGRPH;functionGraph;L$;4|))
          (LETT |perm| (|SPADfirst| |perms|) . #7#)
          (LETT |lr| (SPADCALL |perm| (QREFELT $ 30)) . #7#)
          (LETT |im| (QCDR |lr|) . #7#) (LETT |preim| (QCAR |lr|) . #7#)
          (SEQ (LETT |i| 1 . #7#) (LETT #4# (LENGTH |im|) . #7#)
               (LETT |vert| NIL . #7#) (LETT #3# |im| . #7#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |vert| (CAR #3#) . #7#) NIL)
                     (|greater_SI| |i| #4#))
                 (GO G191)))
               (SEQ (LETT |n| 1 . #7#)
                    (SEQ (LETT |j| 1 . #7#) (LETT #2# (LENGTH |preim|) . #7#)
                         G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |im| |i| (QREFELT $ 31))
                                       (SPADCALL |preim| |j| (QREFELT $ 31))
                                       (QREFELT $ 32))
                             (LETT |n| |j| . #7#)))))
                         (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |o|
                          (VECTOR |vert|
                                  (SPADCALL (LENGTH |im|) |i| (QREFELT $ 33))
                                  (SPADCALL (LENGTH |im|) |i| (QREFELT $ 34))
                                  |n| NIL)
                          . #7#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #7#)))
               (LETT #3# (PROG1 (CDR #3#) (LETT |i| (|inc_SI| |i|) . #7#))
                     . #7#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |obs|))))) 

(SDEFUN |FNGRPH;addObject!;$S$;5| ((|s| $) (|n| S) ($ $))
        (SPROG
         ((|obj|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))
                     (|:| |next| (|NonNegativeInteger|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))
                      (|:| |next| (|NonNegativeInteger|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |obs| (QCAR |s|) . #1=(|FNGRPH;addObject!;$S$;5|))
              (LETT |obj| (VECTOR |n| 0 0 (LENGTH |obs|) NIL) . #1#)
              (COND
               ((SPADCALL |obs| NIL (QREFELT $ 37))
                (PROGN (RPLACA |s| (LIST |obj|)) (QCAR |s|)))
               ('T
                (PROGN
                 (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT $ 21)))
                 (QCAR |s|))))
              (EXIT |s|)))) 

(SDEFUN |FNGRPH;addObject!;$R$;6|
        ((|s| $)
         (|n| |Record| (|:| |value| S)
          (|:| |posX| . #1=((|NonNegativeInteger|))) (|:| |posY| . #1#))
         ($ $))
        (SEQ (|error| "this form of addObject! not supported in functionGraph")
             (EXIT (LIST NIL)))) 

(SDEFUN |FNGRPH;addArrow!;$S2Nni$;7|
        ((|s| $) (|nm| |String|) (|n1| . #1=(|NonNegativeInteger|))
         (|n2| . #1#) ($ $))
        (SEQ (QSETVELT (SPADCALL (QCAR |s|) |n1| (QREFELT $ 40)) 3 |n2|)
             (EXIT |s|))) 

(SDEFUN |FNGRPH;getVertices;$L;8|
        ((|s| $)
         ($ |List|
          #1=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                       (|:| |posY| (|NonNegativeInteger|)))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #1#) (#2=#:G179 NIL) (|soj| NIL))
         (SEQ (LETT |res| NIL . #3=(|FNGRPH;getVertices;$L;8|))
              (SEQ (LETT |soj| NIL . #3#) (LETT #2# (QCAR |s|) . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |soj| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR (QVELT |soj| 0) (QVELT |soj| 1)
                                  (QVELT |soj| 2))
                          . #3#)
                    (EXIT
                     (LETT |res| (SPADCALL |res| |o| (QREFELT $ 43)) . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FNGRPH;getArrows;$L;9|
        ((|s| $)
         ($ |List|
          #1=(|Record| (|:| |name| (|String|))
                       (|:| |arrType| (|NonNegativeInteger|))
                       (|:| |fromOb| (|NonNegativeInteger|))
                       (|:| |toOb| (|NonNegativeInteger|))
                       (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                       (|:| |map| (|List| (|NonNegativeInteger|))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#)
          (|soj|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))
                     (|:| |next| (|NonNegativeInteger|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (#2=#:G187 NIL) (|sojn| NIL))
         (SEQ (LETT |res| NIL . #3=(|FNGRPH;getArrows;$L;9|))
              (SEQ (LETT |sojn| 1 . #3#) (LETT #2# (LENGTH (QCAR |s|)) . #3#)
                   G190 (COND ((|greater_SI| |sojn| #2#) (GO G191)))
                   (SEQ
                    (LETT |soj| (SPADCALL (QCAR |s|) |sojn| (QREFELT $ 40))
                          . #3#)
                    (LETT |a|
                          (VECTOR (STRINGIMAGE |sojn|) 0 |sojn| (QVELT |soj| 3)
                                  0 0 (QVELT |soj| 4))
                          . #3#)
                    (EXIT
                     (LETT |res| (SPADCALL |res| |a| (QREFELT $ 45)) . #3#)))
                   (LETT |sojn| (|inc_SI| |sojn|) . #3#) (GO G190) G191
                   (EXIT NIL))
              (EXIT |res|)))) 

(PUT '|FNGRPH;initial;$;10| '|SPADreplace| '(XLAM NIL (LIST NIL))) 

(SDEFUN |FNGRPH;initial;$;10| (($ $)) (LIST NIL)) 

(SDEFUN |FNGRPH;terminal;S$;11| ((|a| S) ($ $))
        (SPROG
         ((|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))
                     (|:| |next| (|NonNegativeInteger|))
                     (|:| |map| (|List| (|NonNegativeInteger|))))))
         (SEQ (LETT |o| (VECTOR |a| 0 0 1 NIL) |FNGRPH;terminal;S$;11|)
              (EXIT (LIST (LIST |o|)))))) 

(SDEFUN |FNGRPH;cycleOpen;LS$;12|
        ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|obs|
           (|List|
            #1=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |next| (|NonNegativeInteger|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|o| #1#) (|n| (|NonNegativeInteger|)) (|ob| (S)) (#2=#:G200 NIL)
          (|obn| NIL))
         (SEQ (LETT |obs| NIL . #3=(|FNGRPH;cycleOpen;LS$;12|))
              (SEQ (LETT |obn| 1 . #3#) (LETT #2# (LENGTH |objs|) . #3#) G190
                   (COND ((|greater_SI| |obn| #2#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 31)) . #3#)
                    (LETT |n| (+ |obn| 1) . #3#)
                    (COND
                     ((EQL |obn| (LENGTH |objs|))
                      (LETT |n| (LENGTH |objs|) . #3#)))
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 33))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 34))
                                  |n| NIL)
                          . #3#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #3#)))
                   (LETT |obn| (|inc_SI| |obn|) . #3#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (LIST |obs|))))) 

(SDEFUN |FNGRPH;cycleClosed;LS$;13|
        ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|obs|
           (|List|
            #1=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |next| (|NonNegativeInteger|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|o| #1#) (|n| (|NonNegativeInteger|)) (|ob| (S)) (#2=#:G208 NIL)
          (|obn| NIL))
         (SEQ (LETT |obs| NIL . #3=(|FNGRPH;cycleClosed;LS$;13|))
              (SEQ (LETT |obn| 1 . #3#) (LETT #2# (LENGTH |objs|) . #3#) G190
                   (COND ((|greater_SI| |obn| #2#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 31)) . #3#)
                    (LETT |n| (+ |obn| 1) . #3#)
                    (COND ((EQL |obn| (LENGTH |objs|)) (LETT |n| 1 . #3#)))
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 33))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 34))
                                  |n| NIL)
                          . #3#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #3#)))
                   (LETT |obn| (|inc_SI| |obn|) . #3#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (LIST |obs|))))) 

(SDEFUN |FNGRPH;unit;LS$;14| ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG ((#1=#:G214 NIL) (|x| NIL) (#2=#:G213 NIL))
               (SEQ
                (LETT |objs|
                      (PROGN
                       (LETT #2# NIL . #3=(|FNGRPH;unit;LS$;14|))
                       (SEQ (LETT |x| 1 . #3#) (LETT #1# (LENGTH |objs|) . #3#)
                            G190 (COND ((|greater_SI| |x| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (VECTOR
                                      (SPADCALL |objs| |x| (QREFELT $ 31)) 0 0
                                      |x| NIL)
                                     #2#)
                                    . #3#)))
                            (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      . #3#)
                (EXIT (LIST |objs|))))) 

(SDEFUN |FNGRPH;kgraph;LS$;15| ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SEQ (|error| "kgraph not valid in function graph") (EXIT (LIST NIL)))) 

(SDEFUN |FNGRPH;+;3$;16| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|c|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))
                      (|:| |next| (|NonNegativeInteger|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (#1=#:G226 NIL) (|x| NIL) (#2=#:G225 NIL)
          (|objs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))
                      (|:| |next| (|NonNegativeInteger|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |objs| (QCAR |b|) . #3=(|FNGRPH;+;3$;16|))
              (LETT |c|
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |x| 1 . #3#) (LETT #1# (LENGTH |objs|) . #3#)
                          G190 (COND ((|greater_SI| |x| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (VECTOR
                                    (QVELT (SPADCALL |objs| |x| (QREFELT $ 40))
                                           0)
                                    (QVELT (SPADCALL |objs| |x| (QREFELT $ 40))
                                           1)
                                    (QVELT (SPADCALL |objs| |x| (QREFELT $ 40))
                                           2)
                                    (+ |x| (LENGTH (QCAR |a|)))
                                    (QVELT (SPADCALL |objs| |x| (QREFELT $ 40))
                                           4))
                                   #2#)
                                  . #3#)))
                          (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (EXIT (LIST (SPADCALL (QCAR |a|) |c| (QREFELT $ 53))))))) 

(SDEFUN |FNGRPH;merge;3$;17| ((|a| $) (|b| $) ($ $))
        (SEQ (|error| "merge not valid in function graph") (EXIT (LIST NIL)))) 

(SDEFUN |FNGRPH;indexProd|
        ((|aObj| $) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG ((|x| (|NonNegativeInteger|)) (#1=#:G230 NIL))
               (SEQ
                (LETT |x|
                      (+ |a|
                         (*
                          (PROG1 (LETT #1# (- |b| 1) . #2=(|FNGRPH;indexProd|))
                            (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                             #1#))
                          (LENGTH (QCAR |aObj|))))
                      . #2#)
                (EXIT |x|)))) 

(SDEFUN |FNGRPH;*;2$Fg;19|
        ((|a| $) (|b| $) ($ |FunctionGraph| (|Product| S S)))
        (SPROG
         ((|newObjs|
           (|List|
            #1=(|Record| (|:| |value| (|Product| S S))
                         (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |next| (|NonNegativeInteger|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|ob| #1#) (|sp| (|Product| S S)) (|nextA| (|NonNegativeInteger|))
          (|y| #2=(|NonNegativeInteger|)) (|x| #2#)
          (|bni| #3=(|NonNegativeInteger|)) (|byi| #4=(|NonNegativeInteger|))
          (|bxi| #5=(|NonNegativeInteger|)) (|bi| (S)) (#6=#:G245 NIL)
          (|boi| NIL) (|ani| #3#) (|ayi| #4#) (|axi| #5#) (|ai| (S))
          (#7=#:G244 NIL) (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #8=(|FNGRPH;*;2$Fg;19|))
              (SEQ (LETT |aoi| NIL . #8#) (LETT #7# (QCAR |a|) . #8#) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |aoi| (CAR #7#) . #8#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ai| (QVELT |aoi| 0) . #8#)
                        (LETT |axi| (QVELT |aoi| 1) . #8#)
                        (LETT |ayi| (QVELT |aoi| 2) . #8#)
                        (LETT |ani| (QVELT |aoi| 3) . #8#)
                        (EXIT
                         (SEQ (LETT |boi| NIL . #8#)
                              (LETT #6# (QCAR |b|) . #8#) G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT |boi| (CAR #6#) . #8#) NIL))
                                (GO G191)))
                              (SEQ (LETT |bi| (QVELT |boi| 0) . #8#)
                                   (LETT |bxi| (QVELT |boi| 1) . #8#)
                                   (LETT |byi| (QVELT |boi| 2) . #8#)
                                   (LETT |bni| (QVELT |boi| 3) . #8#)
                                   (LETT |x|
                                         (+
                                          (* |bxi|
                                             (SPADCALL |a| (QREFELT $ 56)))
                                          |axi|)
                                         . #8#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 57)))
                                          |ayi|)
                                         . #8#)
                                   (LETT |nextA|
                                         (|FNGRPH;indexProd| |b| |bni| |ani| $)
                                         . #8#)
                                   (LETT |sp|
                                         (SPADCALL |ai| |bi| (QREFELT $ 59))
                                         . #8#)
                                   (LETT |ob| (VECTOR |sp| |x| |y| |nextA| NIL)
                                         . #8#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 62))
                                          . #8#)))
                              (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |newObjs| (QREFELT $ 64)))))) 

(SDEFUN |FNGRPH;closedTensor;2$M$;20|
        ((|a| $) (|b| $) (|f| |Mapping| S S S) ($ $))
        (SPROG
         ((|newObjs|
           (|List|
            #1=(|Record| (|:| |value| S) (|:| |posX| #2=(|NonNegativeInteger|))
                         (|:| |posY| #3=(|NonNegativeInteger|))
                         (|:| |next| #4=(|NonNegativeInteger|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|ob| #1#) (|sp| (S)) (|nextA| (|NonNegativeInteger|))
          (|y| #5=(|NonNegativeInteger|)) (|x| #5#) (|bni| #4#) (|byi| #3#)
          (|bxi| #2#) (|bi| (S)) (#6=#:G255 NIL) (|boi| NIL) (|ani| #4#)
          (|ayi| #3#) (|axi| #2#) (|ai| (S)) (#7=#:G254 NIL) (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #8=(|FNGRPH;closedTensor;2$M$;20|))
              (SEQ (LETT |aoi| NIL . #8#) (LETT #7# (QCAR |a|) . #8#) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |aoi| (CAR #7#) . #8#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ai| (QVELT |aoi| 0) . #8#)
                        (LETT |axi| (QVELT |aoi| 1) . #8#)
                        (LETT |ayi| (QVELT |aoi| 2) . #8#)
                        (LETT |ani| (QVELT |aoi| 3) . #8#)
                        (EXIT
                         (SEQ (LETT |boi| NIL . #8#)
                              (LETT #6# (QCAR |b|) . #8#) G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT |boi| (CAR #6#) . #8#) NIL))
                                (GO G191)))
                              (SEQ (LETT |bi| (QVELT |boi| 0) . #8#)
                                   (LETT |bxi| (QVELT |boi| 1) . #8#)
                                   (LETT |byi| (QVELT |boi| 2) . #8#)
                                   (LETT |bni| (QVELT |boi| 3) . #8#)
                                   (LETT |x|
                                         (+
                                          (* |bxi|
                                             (SPADCALL |a| (QREFELT $ 56)))
                                          |axi|)
                                         . #8#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 57)))
                                          |ayi|)
                                         . #8#)
                                   (LETT |nextA|
                                         (|FNGRPH;indexProd| |b| |bni| |ani| $)
                                         . #8#)
                                   (LETT |sp| (SPADCALL |ai| |bi| |f|) . #8#)
                                   (LETT |ob| (VECTOR |sp| |x| |y| |nextA| NIL)
                                         . #8#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 21))
                                          . #8#)))
                              (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |newObjs| (QREFELT $ 12)))))) 

(SDEFUN |FNGRPH;map;$LL2I$;21|
        ((|s| $) (|m| |List| (|NonNegativeInteger|)) (|newOb| |List| S)
         (|offsetX| . #1=(|Integer|)) (|offsetY| . #1#) ($ $))
        (SPROG
         ((|nwob|
           #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                        (|:| |posY| (|NonNegativeInteger|))
                        (|:| |next| (|NonNegativeInteger|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (#3=#:G273 NIL) (|p| NIL)
          (|nv|
           #4=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                        (|:| |posY| (|NonNegativeInteger|))
                        (|:| |next| (|NonNegativeInteger|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|newNext| #5=(|NonNegativeInteger|)) (|newY| (|NonNegativeInteger|))
          (#6=#:G261 NIL) (|newX| (|NonNegativeInteger|)) (#7=#:G260 NIL)
          (|newObj| (S)) (|inext| #5#) (|i| #5#) (|oldObj| #2#) (#8=#:G272 NIL)
          (|oi| NIL)
          (|oldObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))
                      (|:| |next| (|NonNegativeInteger|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|newObjs| (|List| #4#)) (#9=#:G271 NIL) (|o| NIL) (#10=#:G270 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #10# NIL . #11=(|FNGRPH;map;$LL2I$;21|))
                 (SEQ (LETT |o| NIL . #11#) (LETT #9# |newOb| . #11#) G190
                      (COND
                       ((OR (ATOM #9#) (PROGN (LETT |o| (CAR #9#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10# (CONS (VECTOR |o| 0 0 0 NIL) #10#) . #11#)))
                      (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #10#))))
                . #11#)
          (LETT |oldObjs| (QCAR |s|) . #11#)
          (SEQ (LETT |oi| 1 . #11#) (LETT #8# (LENGTH |oldObjs|) . #11#) G190
               (COND ((|greater_SI| |oi| #8#) (GO G191)))
               (SEQ
                (LETT |oldObj| (SPADCALL |oldObjs| |oi| (QREFELT $ 40)) . #11#)
                (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 20)) . #11#)
                (LETT |inext| (SPADCALL |m| (QVELT |oldObj| 3) (QREFELT $ 20))
                      . #11#)
                (LETT |newObj| (SPADCALL |newOb| |i| (QREFELT $ 31)) . #11#)
                (LETT |newX|
                      (PROG1 (LETT #7# (+ (QVELT |oldObj| 1) |offsetX|) . #11#)
                        (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|)
                                         #7#))
                      . #11#)
                (LETT |newY|
                      (PROG1 (LETT #6# (+ (QVELT |oldObj| 2) |offsetY|) . #11#)
                        (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|)
                                         #6#))
                      . #11#)
                (LETT |newNext|
                      (SPADCALL |m| (QVELT |oldObj| 3) (QREFELT $ 20)) . #11#)
                (LETT |nv|
                      (VECTOR |newObj| |newX| |newY| |newNext|
                              (QVELT |oldObj| 4))
                      . #11#)
                (EXIT
                 (COND
                  ((SPADCALL |i| |inext| (QREFELT $ 28))
                   (SPADCALL |newObjs| |i| |nv| (QREFELT $ 68))))))
               (LETT |oi| (|inc_SI| |oi|) . #11#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |p| 1 . #11#) (LETT #3# (LENGTH |newObjs|) . #11#) G190
               (COND ((|greater_SI| |p| #3#) (GO G191)))
               (SEQ
                (LETT |nwob| (SPADCALL |newObjs| |p| (QREFELT $ 40)) . #11#)
                (EXIT (COND ((< (QVELT |nwob| 3) 1) (QSETVELT |nwob| 3 |p|)))))
               (LETT |p| (|inc_SI| |p|) . #11#) (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |newObjs|))))) 

(SDEFUN |FNGRPH;mapContra;$LL2I$;22|
        ((|s| $) (|m| |List| (|NonNegativeInteger|)) (|newOb| |List| S)
         (|offsetX| . #1=(|Integer|)) (|offsetY| . #1#) ($ $))
        (SPROG
         ((|nwob|
           #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                        (|:| |posY| (|NonNegativeInteger|))
                        (|:| |next| (|NonNegativeInteger|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (#3=#:G292 NIL) (|p| NIL)
          (|n|
           #4=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                        (|:| |posY| (|NonNegativeInteger|))
                        (|:| |next| (|NonNegativeInteger|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|newNext| #5=(|NonNegativeInteger|))
          (|incoming| (|List| (|NonNegativeInteger|)))
          (|newY| (|NonNegativeInteger|)) (#6=#:G279 NIL)
          (|newX| (|NonNegativeInteger|)) (#7=#:G278 NIL) (|newObj| (S))
          (|inext| #5#) (|i| #5#) (|oldObj| #2#) (#8=#:G291 NIL) (|oi| NIL)
          (|oldObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))
                      (|:| |next| (|NonNegativeInteger|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|newObjs| (|List| #4#)) (#9=#:G290 NIL) (|o| NIL) (#10=#:G289 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #10# NIL . #11=(|FNGRPH;mapContra;$LL2I$;22|))
                 (SEQ (LETT |o| NIL . #11#) (LETT #9# |newOb| . #11#) G190
                      (COND
                       ((OR (ATOM #9#) (PROGN (LETT |o| (CAR #9#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10# (CONS (VECTOR |o| 0 0 0 NIL) #10#) . #11#)))
                      (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #10#))))
                . #11#)
          (LETT |oldObjs| (QCAR |s|) . #11#)
          (SEQ (LETT |oi| 1 . #11#) (LETT #8# (LENGTH |oldObjs|) . #11#) G190
               (COND ((|greater_SI| |oi| #8#) (GO G191)))
               (SEQ
                (LETT |oldObj| (SPADCALL |oldObjs| |oi| (QREFELT $ 40)) . #11#)
                (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 20)) . #11#)
                (LETT |inext| (SPADCALL |m| (QVELT |oldObj| 3) (QREFELT $ 20))
                      . #11#)
                (LETT |newObj| (SPADCALL |newOb| |i| (QREFELT $ 31)) . #11#)
                (LETT |newX|
                      (PROG1 (LETT #7# (+ (QVELT |oldObj| 1) |offsetX|) . #11#)
                        (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|)
                                         #7#))
                      . #11#)
                (LETT |newY|
                      (PROG1 (LETT #6# (+ (QVELT |oldObj| 2) |offsetY|) . #11#)
                        (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|)
                                         #6#))
                      . #11#)
                (LETT |incoming| (SPADCALL |s| |oi| (QREFELT $ 70)) . #11#)
                (COND
                 ((SPADCALL (SPADCALL |incoming| (QREFELT $ 71)) 1
                            (QREFELT $ 28))
                  (|error| "not a FunctionGraph")))
                (LETT |newNext|
                      (SPADCALL |m| (|SPADfirst| |incoming|) (QREFELT $ 20))
                      . #11#)
                (LETT |n|
                      (VECTOR |newObj| |newX| |newY| |newNext|
                              (QVELT |oldObj| 4))
                      . #11#)
                (EXIT
                 (COND
                  ((SPADCALL |i| |inext| (QREFELT $ 28))
                   (SPADCALL |newObjs| |i| |n| (QREFELT $ 68))))))
               (LETT |oi| (|inc_SI| |oi|) . #11#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |p| 1 . #11#) (LETT #3# (LENGTH |newObjs|) . #11#) G190
               (COND ((|greater_SI| |p| #3#) (GO G191)))
               (SEQ
                (LETT |nwob| (SPADCALL |newObjs| |p| (QREFELT $ 40)) . #11#)
                (EXIT (COND ((< (QVELT |nwob| 3) 1) (QSETVELT |nwob| 3 |p|)))))
               (LETT |p| (|inc_SI| |p|) . #11#) (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |newObjs|))))) 

(SDEFUN |FNGRPH;coAdjoint;$LU;23|
        ((|s| $) (|m| |List| (|NonNegativeInteger|))
         ($ |Union| (|List| (|NonNegativeInteger|)) "failed"))
        (SPROG
         ((|entry| (|NonNegativeInteger|)) (#1=#:G309 NIL)
          (|x| (|NonNegativeInteger|)) (#2=#:G314 NIL) (|ri| NIL)
          (#3=#:G313 NIL) (|mi| NIL)
          (|retOpt| (|List| (|List| (|NonNegativeInteger|)))) (#4=#:G312 NIL)
          (|ret| (|List| (|NonNegativeInteger|))) (#5=#:G311 NIL)
          (|codomainSize| (|NonNegativeInteger|)) (#6=#:G310 NIL)
          (|domainSize| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |domainSize| (LENGTH (QCAR |s|))
                  . #7=(|FNGRPH;coAdjoint;$LU;23|))
            (LETT |codomainSize| 0 . #7#)
            (SEQ (LETT |mi| NIL . #7#) (LETT #6# |m| . #7#) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |mi| (CAR #6#) . #7#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |mi| |codomainSize| (QREFELT $ 73))
                     (LETT |codomainSize| |mi| . #7#)))))
                 (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
            (LETT |ret|
                  (PROGN
                   (LETT #5# NIL . #7#)
                   (SEQ (LETT |x| 1 . #7#) G190
                        (COND ((|greater_SI| |x| |codomainSize|) (GO G191)))
                        (SEQ (EXIT (LETT #5# (CONS 0 #5#) . #7#)))
                        (LETT |x| (|inc_SI| |x|) . #7#) (GO G190) G191
                        (EXIT (NREVERSE #5#))))
                  . #7#)
            (LETT |retOpt|
                  (PROGN
                   (LETT #4# NIL . #7#)
                   (SEQ (LETT |x| 1 . #7#) G190
                        (COND ((|greater_SI| |x| |codomainSize|) (GO G191)))
                        (SEQ (EXIT (LETT #4# (CONS NIL #4#) . #7#)))
                        (LETT |x| (|inc_SI| |x|) . #7#) (GO G190) G191
                        (EXIT (NREVERSE #4#))))
                  . #7#)
            (SEQ (LETT |mi| 1 . #7#)
                 (LETT #3# (SPADCALL |m| (QREFELT $ 71)) . #7#) G190
                 (COND ((|greater_SI| |mi| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SPADCALL |retOpt| (SPADCALL |m| |mi| (QREFELT $ 20))
                             (SPADCALL
                              (SPADCALL |retOpt|
                                        (SPADCALL |m| |mi| (QREFELT $ 20))
                                        (QREFELT $ 75))
                              |mi| (QREFELT $ 76))
                             (QREFELT $ 77))))
                 (LETT |mi| (|inc_SI| |mi|) . #7#) (GO G190) G191 (EXIT NIL))
            (LETT |entry| 1 . #7#)
            (SEQ (LETT |ri| NIL . #7#) (LETT #2# |retOpt| . #7#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |ri| (CAR #2#) . #7#) NIL))
                   (GO G191)))
                 (SEQ (LETT |x| (SPADCALL |s| |ri| (QREFELT $ 78)) . #7#)
                      (COND
                       ((EQL |x| 0)
                        (PROGN (LETT #1# (CONS 1 "failed") . #7#) (GO #1#))))
                      (SPADCALL |ret| |entry| |x| (QREFELT $ 16))
                      (EXIT (LETT |entry| (+ |entry| 1) . #7#)))
                 (LETT #2# (CDR #2#) . #7#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |ret|))))
          #1# (EXIT #1#)))) 

(SDEFUN |FNGRPH;contraAdjoint;$LU;24|
        ((|s| $) (|m| |List| (|NonNegativeInteger|))
         ($ |Union| (|List| (|NonNegativeInteger|)) "failed"))
        (SPROG
         ((|entry| (|NonNegativeInteger|)) (#1=#:G328 NIL)
          (|x| (|NonNegativeInteger|)) (#2=#:G333 NIL) (|ri| NIL)
          (#3=#:G332 NIL) (|mi| NIL)
          (|retOpt| (|List| (|List| (|NonNegativeInteger|)))) (#4=#:G331 NIL)
          (|ret| (|List| (|NonNegativeInteger|))) (#5=#:G330 NIL)
          (|codomainSize| (|NonNegativeInteger|)) (#6=#:G329 NIL)
          (|domainSize| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |domainSize| (LENGTH (QCAR |s|))
                  . #7=(|FNGRPH;contraAdjoint;$LU;24|))
            (LETT |codomainSize| 0 . #7#)
            (SEQ (LETT |mi| NIL . #7#) (LETT #6# |m| . #7#) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |mi| (CAR #6#) . #7#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |mi| |codomainSize| (QREFELT $ 73))
                     (LETT |codomainSize| |mi| . #7#)))))
                 (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
            (LETT |ret|
                  (PROGN
                   (LETT #5# NIL . #7#)
                   (SEQ (LETT |x| 1 . #7#) G190
                        (COND ((|greater_SI| |x| |codomainSize|) (GO G191)))
                        (SEQ (EXIT (LETT #5# (CONS 0 #5#) . #7#)))
                        (LETT |x| (|inc_SI| |x|) . #7#) (GO G190) G191
                        (EXIT (NREVERSE #5#))))
                  . #7#)
            (LETT |retOpt|
                  (PROGN
                   (LETT #4# NIL . #7#)
                   (SEQ (LETT |x| 1 . #7#) G190
                        (COND ((|greater_SI| |x| |codomainSize|) (GO G191)))
                        (SEQ (EXIT (LETT #4# (CONS NIL #4#) . #7#)))
                        (LETT |x| (|inc_SI| |x|) . #7#) (GO G190) G191
                        (EXIT (NREVERSE #4#))))
                  . #7#)
            (SEQ (LETT |mi| 1 . #7#)
                 (LETT #3# (SPADCALL |m| (QREFELT $ 71)) . #7#) G190
                 (COND ((|greater_SI| |mi| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SPADCALL |retOpt| (SPADCALL |m| |mi| (QREFELT $ 20))
                             (SPADCALL
                              (SPADCALL |retOpt|
                                        (SPADCALL |m| |mi| (QREFELT $ 20))
                                        (QREFELT $ 75))
                              |mi| (QREFELT $ 76))
                             (QREFELT $ 77))))
                 (LETT |mi| (|inc_SI| |mi|) . #7#) (GO G190) G191 (EXIT NIL))
            (LETT |entry| 1 . #7#)
            (SEQ (LETT |ri| NIL . #7#) (LETT #2# |retOpt| . #7#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |ri| (CAR #2#) . #7#) NIL))
                   (GO G191)))
                 (SEQ (LETT |x| (SPADCALL |s| |ri| (QREFELT $ 81)) . #7#)
                      (COND
                       ((EQL |x| 0)
                        (PROGN (LETT #1# (CONS 1 "failed") . #7#) (GO #1#))))
                      (SPADCALL |ret| |entry| |x| (QREFELT $ 16))
                      (EXIT (LETT |entry| (+ |entry| 1) . #7#)))
                 (LETT #2# (CDR #2#) . #7#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |ret|))))
          #1# (EXIT #1#)))) 

(SDEFUN |FNGRPH;apply;$2Nni;25|
        ((|s| $) (|a| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (QVELT (SPADCALL (QCAR |s|) |a| (QREFELT $ 40)) 3)) 

(SDEFUN |FNGRPH;limit;$NniL;26| ((|s| $) (|a| |NonNegativeInteger|) ($ |Loop|))
        (SPROG
         ((|ptr| (|NonNegativeInteger|)) (#1=#:G344 NIL)
          (|lp| (|List| (|Loop|))) (#2=#:G345 NIL) (|s1| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |ptr| |a| . #3=(|FNGRPH;limit;$NniL;26|))
                (SEQ (LETT |s1| NIL . #3#) (LETT #2# (QCAR |s|) . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |s1| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ (LETT |lp| (SPADCALL |s| |ptr| (QREFELT $ 85)) . #3#)
                          (COND
                           ((SPADCALL (LENGTH |lp|) 1 (QREFELT $ 73))
                            (|error| "limit: cant have >1 loop through node")))
                          (COND
                           ((EQL (LENGTH |lp|) 1)
                            (PROGN
                             (LETT #1# (|SPADfirst| |lp|) . #3#)
                             (GO #1#))))
                          (EXIT
                           (LETT |ptr| (SPADCALL |s| |ptr| (QREFELT $ 83))
                                 . #3#)))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL NIL (QREFELT $ 87)))))
          #1# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |FunctionGraph;|)) 

(DEFUN |FunctionGraph| (#1=#:G346)
  (SPROG NIL
         (PROG (#2=#:G347)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FunctionGraph|)
                                               '|domainEqualList|)
                    . #3=(|FunctionGraph|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|FunctionGraph;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FunctionGraph|)))))))))) 

(DEFUN |FunctionGraph;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionGraph|))
          (LETT |dv$| (LIST '|FunctionGraph| DV$1) . #1#)
          (LETT $ (GETREFV 99) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FunctionGraph| (LIST DV$1)
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
                                     (|:| |posY| (|NonNegativeInteger|))
                                     (|:| |next| (|NonNegativeInteger|))
                                     (|:| |map|
                                          (|List| (|NonNegativeInteger|))))))))
          $))) 

(MAKEPROP '|FunctionGraph| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              |FNGRPH;functionGraph;L$;1|
              (|Record| (|:| |value| 6) (|:| |posX| 13) (|:| |posY| 13)
                        (|:| |next| 13) (|:| |map| 15))
              (|List| 10) |FNGRPH;functionGraph;L$;2| (|NonNegativeInteger|)
              (|Integer|) (|List| 13) (0 . |setelt|)
              (|Record| (|:| |value| 6) (|:| |posX| 13) (|:| |posY| 13))
              (|List| 17) (7 . |elt|) (13 . |elt|) (19 . |concat|)
              (|Record| (|:| |name| 41) (|:| |arrType| 13) (|:| |fromOb| 13)
                        (|:| |toOb| 13) (|:| |xOffset| 14) (|:| |yOffset| 14)
                        (|:| |map| 15))
              (|List| 22) |FNGRPH;functionGraph;LL$;3| (|Permutation| 6)
              (25 . |One|) (|Boolean|) (29 . ~=)
              (|Record| (|:| |preimage| 8) (|:| |image| 8))
              (35 . |listRepresentation|) (40 . |elt|) (46 . =)
              (52 . |createX|) (58 . |createY|) (|List| 25)
              |FNGRPH;functionGraph;L$;4| (64 . =) |FNGRPH;addObject!;$S$;5|
              |FNGRPH;addObject!;$R$;6| (70 . |elt|) (|String|)
              |FNGRPH;addArrow!;$S2Nni$;7| (76 . |concat|)
              |FNGRPH;getVertices;$L;8| (82 . |concat|) |FNGRPH;getArrows;$L;9|
              |FNGRPH;initial;$;10| |FNGRPH;terminal;S$;11|
              |FNGRPH;cycleOpen;LS$;12| |FNGRPH;cycleClosed;LS$;13|
              |FNGRPH;unit;LS$;14| |FNGRPH;kgraph;LS$;15| (88 . |concat|)
              |FNGRPH;+;3$;16| |FNGRPH;merge;3$;17| (94 . |diagramWidth|)
              (99 . |diagramHeight|) (|Product| 6 6) (104 . |construct|)
              (|Record| (|:| |value| 58) (|:| |posX| 13) (|:| |posY| 13)
                        (|:| |next| 13) (|:| |map| 15))
              (|List| 60) (110 . |concat|) (|FunctionGraph| 58)
              (116 . |functionGraph|) |FNGRPH;*;2$Fg;19| (|Mapping| 6 6 6)
              |FNGRPH;closedTensor;2$M$;20| (121 . |setelt|)
              |FNGRPH;map;$LL2I$;21| (128 . |nodeToNode|) (134 . |#|)
              |FNGRPH;mapContra;$LL2I$;22| (139 . >) (|List| 15) (145 . |elt|)
              (151 . |concat|) (157 . |setelt|) (164 . |max|)
              (|Union| 15 '"failed") |FNGRPH;coAdjoint;$LU;23| (170 . |min|)
              |FNGRPH;contraAdjoint;$LU;24| |FNGRPH;apply;$2Nni;25| (|List| 86)
              (176 . |loopsAtNode|) (|Loop|) (182 . |loop|)
              |FNGRPH;limit;$NniL;26| (|Void|) (|Scene| (|SCartesian| '2))
              (|Matrix| 14) (|Matrix| 13) (|List| 94) (|Tree| 14)
              (|DirectedGraph| $) (|SingleInteger|) (|OutputForm|)
              (|HashState|))
           '#(~= 187 |unit| 193 |terminal| 199 |subdiagramSvg| 204
              |spanningTreeNode| 212 |spanningTreeArrow| 218
              |spanningForestNode| 224 |spanningForestArrow| 229 |routeNodes|
              234 |routeArrows| 241 |outDegree| 248 |nodeToNode| 254
              |nodeToArrow| 260 |nodeFromNode| 266 |nodeFromArrow| 272 |min|
              278 |merge| 289 |max| 295 |mapContra| 306 |map| 315 |looseEquals|
              324 |loopsNodes| 330 |loopsAtNode| 335 |loopsArrows| 341 |limit|
              346 |latex| 352 |laplacianMatrix| 357 |kgraph| 362
              |isGreaterThan?| 368 |isFunctional?| 375 |isFixPoint?| 380
              |isDirected?| 386 |isDirectSuccessor?| 390 |isAcyclic?| 397
              |initial| 402 |incidenceMatrix| 406 |inDegree| 411 |hashUpdate!|
              417 |hash| 423 |getVertices| 428 |getVertexIndex| 433 |getArrows|
              439 |getArrowIndex| 444 |functionGraph| 451 |flatten| 472
              |distanceMatrix| 477 |distance| 482 |diagramWidth| 489
              |diagramSvg| 494 |diagramHeight| 501 |deepDiagramSvg| 506
              |cycleOpen| 513 |cycleClosed| 519 |createY| 525 |createX| 531
              |createWidth| 537 |contraAdjoint| 542 |coerce| 548 |coAdjoint|
              558 |closedTensor| 564 |arrowsToNode| 571 |arrowsToArrow| 577
              |arrowsFromNode| 583 |arrowsFromArrow| 589 |arrowName| 595
              |apply| 602 |adjacencyMatrix| 608 |addObject!| 613 |addArrow!|
              625 = 650 + 656 * 662)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|) (|CoercibleTo| 97)
                           (|BasicType|))
                        (|makeByteWordVec2| 98
                                            '(3 15 13 0 14 13 16 2 18 17 0 14
                                              19 2 15 13 0 14 20 2 11 0 0 10 21
                                              0 25 0 26 2 13 27 0 0 28 1 25 29
                                              0 30 2 8 6 0 14 31 2 6 27 0 0 32
                                              2 0 13 13 13 33 2 0 13 13 13 34 2
                                              11 27 0 0 37 2 11 10 0 14 40 2 18
                                              0 0 17 43 2 23 0 0 22 45 2 11 0 0
                                              0 53 1 0 13 0 56 1 0 13 0 57 2 58
                                              0 6 6 59 2 61 0 0 60 62 1 63 0 61
                                              64 3 11 10 0 14 10 68 2 0 15 0 13
                                              70 1 15 13 0 71 2 13 27 0 0 73 2
                                              74 15 0 14 75 2 15 0 0 13 76 3 74
                                              15 0 14 15 77 2 0 13 0 15 78 2 0
                                              13 0 15 81 2 0 84 0 13 85 1 86 0
                                              15 87 2 0 27 0 0 1 2 0 0 8 41 51
                                              1 0 0 6 48 4 0 89 90 0 27 27 1 2
                                              0 94 0 13 1 2 0 94 0 13 1 1 0 93
                                              0 1 1 0 93 0 1 3 0 15 0 13 13 1 3
                                              0 15 0 13 13 1 2 0 13 0 13 1 2 0
                                              15 0 13 70 2 0 15 0 13 1 2 0 15 0
                                              13 1 2 0 15 0 13 1 1 0 13 0 1 2 0
                                              13 0 15 81 2 0 0 0 0 55 1 0 13 0
                                              1 2 0 13 0 15 78 5 0 0 0 15 8 14
                                              14 72 5 0 0 0 15 8 14 14 69 2 0
                                              27 0 0 1 1 0 84 0 1 2 0 84 0 13
                                              85 1 0 84 0 1 2 0 86 0 13 88 1 0
                                              41 0 1 1 0 91 0 1 2 0 0 8 41 52 3
                                              0 27 0 13 13 1 1 0 27 0 1 2 0 27
                                              0 13 1 0 0 27 1 3 0 27 0 13 13 1
                                              1 0 27 0 1 0 0 0 47 1 0 91 0 1 2
                                              0 13 0 13 1 2 0 98 98 0 1 1 0 96
                                              0 1 1 0 18 0 44 2 0 13 0 6 1 1 0
                                              23 0 46 3 0 13 0 13 13 1 1 0 0 35
                                              36 2 0 0 18 23 24 1 0 0 8 9 1 0 0
                                              11 12 1 0 0 95 1 1 0 91 0 1 3 0
                                              14 0 13 13 1 1 0 13 0 56 3 0 89
                                              41 0 27 1 1 0 13 0 57 3 0 89 41 0
                                              27 1 2 0 0 8 41 49 2 0 0 8 41 50
                                              2 0 13 13 13 34 2 0 13 13 13 33 1
                                              0 13 13 1 2 0 79 0 15 82 1 0 97 0
                                              1 1 0 97 0 1 2 0 79 0 15 80 3 0 0
                                              0 0 66 67 2 0 15 0 13 1 2 0 15 0
                                              13 1 2 0 15 0 13 1 2 0 15 0 13 1
                                              3 0 41 0 13 13 1 2 0 13 0 13 83 1
                                              0 92 0 1 2 0 0 0 17 39 2 0 0 0 6
                                              38 4 0 0 0 41 6 6 1 4 0 0 0 41 13
                                              13 42 5 0 0 0 41 13 13 15 1 2 0
                                              27 0 0 1 2 0 0 0 0 54 2 0 63 0 0
                                              65)))))
           '|lookupComplete|)) 
