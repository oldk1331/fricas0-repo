
(SDEFUN |WGRPH;weightedGraph;L$;1| ((|ob| |List| S) ($ $))
        (SPROG
         ((|objs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
          (#1=#:G146 NIL) (|x| NIL) (#2=#:G145 NIL))
         (SEQ
          (LETT |objs|
                (PROGN
                 (LETT #2# NIL . #3=(|WGRPH;weightedGraph;L$;1|))
                 (SEQ (LETT |x| NIL . #3#) (LETT #1# |ob| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (VECTOR |x| 0 0 (|spadConstant| $ 9)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (CONS |objs| NIL))))) 

(PUT '|WGRPH;weightedGraph;L$;2| '|SPADreplace| '(XLAM (|ob|) (CONS |ob| NIL))) 

(SDEFUN |WGRPH;weightedGraph;L$;2|
        ((|ob| |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))
         ($ $))
        (CONS |ob| NIL)) 

(PUT '|WGRPH;weightedGraph;LL$;3| '|SPADreplace| 'CONS) 

(SDEFUN |WGRPH;weightedGraph;LL$;3|
        ((|ob| |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))
         (|ar| |List|
          (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                    (|:| |fromOb| (|NonNegativeInteger|))
                    (|:| |toOb| (|NonNegativeInteger|))
                    (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                    (|:| |map| (|List| (|NonNegativeInteger|)))))
         ($ $))
        (CONS |ob| |ar|)) 

(SDEFUN |WGRPH;weightedGraph;LL$;4|
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
                         (|:| |weight| W))))
          (|fo| #1#) (#2=#:G173 NIL) (|f| NIL) (#3=#:G174 NIL) (|fn| NIL)
          (|arrs|
           (|List|
            #4=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arro| #4#) (#5=#:G172 NIL) (|a| NIL))
         (SEQ (LETT |arrs| NIL . #6=(|WGRPH;weightedGraph;LL$;4|))
              (SEQ (LETT |a| NIL . #6#) (LETT #5# |ar| . #6#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |a| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |arro|
                          (VECTOR (QVELT |a| 0) (|spadConstant| $ 9)
                                  (QVELT |a| 2) (QVELT |a| 3) (QVELT |a| 4)
                                  (QVELT |a| 5) (QVELT |a| 6))
                          . #6#)
                    (EXIT
                     (LETT |arrs| (SPADCALL |arrs| |arro| (QREFELT $ 18))
                           . #6#)))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (LETT |fobs| NIL . #6#)
              (SEQ (LETT |fn| 1 . #6#) (LETT #3# (LENGTH |ob|) . #6#)
                   (LETT |f| NIL . #6#) (LETT #2# |ob| . #6#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #6#) NIL)
                         (|greater_SI| |fn| #3#))
                     (GO G191)))
                   (SEQ
                    (LETT |fo|
                          (VECTOR (QVELT |f| 0) (QVELT |f| 1) (QVELT |f| 2)
                                  (|spadConstant| $ 9))
                          . #6#)
                    (EXIT
                     (LETT |fobs| (SPADCALL |fobs| |fo| (QREFELT $ 19))
                           . #6#)))
                   (LETT #2#
                         (PROG1 (CDR #2#) (LETT |fn| (|inc_SI| |fn|) . #6#))
                         . #6#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |fobs| |arrs|))))) 

(SDEFUN |WGRPH;weightedGraph;LL$;5|
        ((|objs| |List| S) (|am| |List| (|List| (|NonNegativeInteger|))) ($ $))
        (SPROG
         ((|ar|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (#2=#:G188 NIL) (|j| NIL) (#3=#:G187 NIL) (|i| NIL)
          (|obs|
           (|List|
            #4=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |weight| W))))
          (|o| #4#) (|ob| (S)) (#5=#:G186 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #6=(|WGRPH;weightedGraph;LL$;5|))
              (SEQ (LETT |obn| 1 . #6#) (LETT #5# (LENGTH |objs|) . #6#) G190
                   (COND ((|greater_SI| |obn| #5#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 26)) . #6#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 28))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 29))
                                  (|spadConstant| $ 9))
                          . #6#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 19)) . #6#)))
                   (LETT |obn| (|inc_SI| |obn|) . #6#) (GO G190) G191
                   (EXIT NIL))
              (LETT |ar| NIL . #6#)
              (SEQ (LETT |i| 1 . #6#) (LETT #3# (LENGTH |am|) . #6#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #6#)
                          (LETT #2#
                                (SPADCALL (SPADCALL |am| |i| (QREFELT $ 32))
                                          (QREFELT $ 33))
                                . #6#)
                          G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((EQL
                               (SPADCALL (SPADCALL |am| |i| (QREFELT $ 32)) |j|
                                         (QREFELT $ 34))
                               1)
                              (SEQ
                               (LETT |a|
                                     (VECTOR "a" (|spadConstant| $ 9) |i| |j| 0
                                             0 NIL)
                                     . #6#)
                               (EXIT
                                (LETT |ar| (SPADCALL |ar| |a| (QREFELT $ 18))
                                      . #6#)))))))
                          (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ar|))))) 

(SDEFUN |WGRPH;addObject!;$S$;6| ((|s| $) (|n| S) ($ $))
        (SPROG
         ((|obj|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))))
         (SEQ (LETT |obs| (QCAR |s|) . #1=(|WGRPH;addObject!;$S$;6|))
              (LETT |obj| (VECTOR |n| 0 0 (|spadConstant| $ 9)) . #1#)
              (COND
               ((SPADCALL |obs| NIL (QREFELT $ 37))
                (PROGN (RPLACA |s| (LIST |obj|)) (QCAR |s|)))
               ('T
                (PROGN
                 (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT $ 19)))
                 (QCAR |s|))))
              (EXIT |s|)))) 

(SDEFUN |WGRPH;addObject!;$R$;7|
        ((|s| $)
         (|n| |Record| (|:| |value| S)
          (|:| |posX| . #1=((|NonNegativeInteger|))) (|:| |posY| . #1#))
         ($ $))
        (SEQ
         (|error|
          "this form of addObject! not supported in multifunctionGraph")
         (EXIT (CONS NIL NIL)))) 

(SDEFUN |WGRPH;addArrow!;$S2Nni$;8|
        ((|s| $) (|nm| |String|) (|n1| . #1=(|NonNegativeInteger|))
         (|n2| . #1#) ($ $))
        (SPADCALL |s| |nm| |n1| |n2| (|spadConstant| $ 9) (QREFELT $ 41))) 

(SDEFUN |WGRPH;addWArrow!;$S2NniW$;9|
        ((|s| $) (|nm| |String|) (|n1| |NonNegativeInteger|)
         (|n2| |NonNegativeInteger|) (|w| W) ($ $))
        (SPROG
         ((#1=#:G207 NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a|
           (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|arrss|
           (|List|
            (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ
          (EXIT
           (SEQ (LETT |arrss| (QCDR |s|) . #2=(|WGRPH;addWArrow!;$S2NniW$;9|))
                (LETT |a| (VECTOR |nm| |w| |n1| |n2| 0 0 NIL) . #2#)
                (EXIT
                 (COND
                  ((SPADCALL |arrss| NIL (QREFELT $ 43))
                   (SEQ (PROGN (RPLACD |s| (LIST |a|)) (QCDR |s|))
                        (EXIT (PROGN (LETT #1# |s| . #2#) (GO #3=#:G206)))))
                  ('T
                   (SEQ
                    (LETT |arrs| (SPADCALL |arrss| |a| (QREFELT $ 18)) . #2#)
                    (PROGN (RPLACD |s| |arrs|) (QCDR |s|))
                    (EXIT (PROGN (LETT #1# |s| . #2#) (GO #3#)))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |WGRPH;getVertices;$L;10|
        ((|s| $)
         ($ |List|
          #1=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                       (|:| |posY| (|NonNegativeInteger|)))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #1#) (#2=#:G214 NIL) (|soj| NIL))
         (SEQ (LETT |res| NIL . #3=(|WGRPH;getVertices;$L;10|))
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
                     (LETT |res| (SPADCALL |res| |o| (QREFELT $ 44)) . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |WGRPH;getArrows;$L;11|
        ((|s| $)
         ($ |List|
          #1=(|Record| (|:| |name| (|String|))
                       (|:| |arrType| (|NonNegativeInteger|))
                       (|:| |fromOb| (|NonNegativeInteger|))
                       (|:| |toOb| (|NonNegativeInteger|))
                       (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                       (|:| |map| (|List| (|NonNegativeInteger|))))))
        (SPROG
         ((|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|aw| #1#) (#2=#:G221 NIL) (|a| NIL))
         (SEQ (LETT |arrs| NIL . #3=(|WGRPH;getArrows;$L;11|))
              (SEQ (LETT |a| NIL . #3#) (LETT #2# (QCDR |s|) . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |aw|
                          (VECTOR (QVELT |a| 0) 0 (QVELT |a| 2) (QVELT |a| 3)
                                  (QVELT |a| 4) (QVELT |a| 5) (QVELT |a| 6))
                          . #3#)
                    (EXIT
                     (LETT |arrs| (SPADCALL |arrs| |aw| (QREFELT $ 46))
                           . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |arrs|)))) 

(PUT '|WGRPH;initial;$;12| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(SDEFUN |WGRPH;initial;$;12| (($ $)) (CONS NIL NIL)) 

(SDEFUN |WGRPH;terminal;S$;13| ((|a| S) ($ $))
        (SPROG
         ((|ar|
           (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
         (SEQ
          (LETT |o| (VECTOR |a| 0 0 (|spadConstant| $ 9))
                . #1=(|WGRPH;terminal;S$;13|))
          (LETT |ar| (VECTOR "loop" (|spadConstant| $ 9) 1 1 0 0 NIL) . #1#)
          (EXIT (CONS (LIST |o|) (LIST |ar|)))))) 

(SDEFUN |WGRPH;cycleOpen;LS$;14|
        ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|arn| (|Integer|))
          (|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (|next| (|NonNegativeInteger|))
          (|obs|
           (|List|
            #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |weight| W))))
          (|o| #2#) (|ob| (S)) (#3=#:G237 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #4=(|WGRPH;cycleOpen;LS$;14|))
              (LETT |ars| NIL . #4#) (LETT |arn| 1 . #4#)
              (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#) G190
                   (COND ((|greater_SI| |obn| #3#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 26)) . #4#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 28))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 29))
                                  (|spadConstant| $ 9))
                          . #4#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 19)) . #4#)
                    (LETT |next| (+ |obn| 1) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 50))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      (|spadConstant| $ 9) |obn| |next| 0 0
                                      NIL)
                              . #4#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 18)) . #4#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #4#)))))))
                   (LETT |obn| (|inc_SI| |obn|) . #4#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |WGRPH;cycleClosed;LS$;15|
        ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|arn| (|Integer|))
          (|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (|next| (|NonNegativeInteger|))
          (|obs|
           (|List|
            #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |weight| W))))
          (|o| #2#) (|ob| (S)) (#3=#:G247 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #4=(|WGRPH;cycleClosed;LS$;15|))
              (LETT |ars| NIL . #4#) (LETT |arn| 1 . #4#)
              (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#) G190
                   (COND ((|greater_SI| |obn| #3#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 26)) . #4#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 28))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 29))
                                  (|spadConstant| $ 9))
                          . #4#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 19)) . #4#)
                    (LETT |next| (+ |obn| 1) . #4#)
                    (COND
                     ((EQL (- |next| 1) (LENGTH |objs|))
                      (LETT |next| 1 . #4#)))
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 50))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      (|spadConstant| $ 9) |obn| |next| 0 0
                                      NIL)
                              . #4#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 18)) . #4#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #4#)))))))
                   (LETT |obn| (|inc_SI| |obn|) . #4#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |WGRPH;unit;LS$;16| ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|arn| (|Integer|))
          (|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#)
          (|obs|
           (|List|
            #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |weight| W))))
          (|o| #2#) (|ob| (S)) (#3=#:G255 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #4=(|WGRPH;unit;LS$;16|))
              (LETT |ars| NIL . #4#) (LETT |arn| 1 . #4#)
              (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#) G190
                   (COND ((|greater_SI| |obn| #3#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 26)) . #4#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 28))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 29))
                                  (|spadConstant| $ 9))
                          . #4#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 19)) . #4#)
                    (LETT |a|
                          (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                  (|spadConstant| $ 9) |obn| |obn| 0 0 NIL)
                          . #4#)
                    (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 18)) . #4#)
                    (EXIT (LETT |arn| (+ |arn| 1) . #4#)))
                   (LETT |obn| (|inc_SI| |obn|) . #4#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |WGRPH;kgraph;LS$;17| ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|arn| (|Integer|))
          (|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (#2=#:G267 NIL) (|obm| NIL)
          (|obs|
           (|List|
            #3=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |weight| W))))
          (|o| #3#) (|ob| (S)) (#4=#:G266 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #5=(|WGRPH;kgraph;LS$;17|))
              (LETT |ars| NIL . #5#) (LETT |arn| 1 . #5#)
              (SEQ (LETT |obn| 1 . #5#) (LETT #4# (LENGTH |objs|) . #5#) G190
                   (COND ((|greater_SI| |obn| #4#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 26)) . #5#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 28))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 29))
                                  (|spadConstant| $ 9))
                          . #5#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 19)) . #5#)
                    (EXIT
                     (SEQ (LETT |obm| 1 . #5#) (LETT #2# (LENGTH |objs|) . #5#)
                          G190 (COND ((|greater_SI| |obm| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |obn| |obm| (QREFELT $ 54))
                              (SEQ
                               (LETT |a|
                                     (VECTOR
                                      (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      (|spadConstant| $ 9) |obn| |obm| 0 0 NIL)
                                     . #5#)
                               (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 18))
                                     . #5#)
                               (EXIT (LETT |arn| (+ |arn| 1) . #5#)))))))
                          (LETT |obm| (|inc_SI| |obm|) . #5#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |obn| (|inc_SI| |obn|) . #5#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |WGRPH;+;3$;18| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|la|
           (|List|
            (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|lb|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (#2=#:G275 NIL) (|ba| NIL)
          (|bStart| (|NonNegativeInteger|))
          (|lo|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))))
         (SEQ
          (LETT |lo| (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 56))
                . #3=(|WGRPH;+;3$;18|))
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
                (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 18)) . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 57)) . #3#)
          (EXIT (CONS |lo| |la|))))) 

(SDEFUN |WGRPH;merge;3$;19| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|la|
           (|List|
            (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|lb|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|fromI| #2=(|NonNegativeInteger|)) (|toI| #2#)
          (#3=#:G295 NIL) (|ba| NIL) (|bStart| #4=(|NonNegativeInteger|))
          (|bmap| (|List| (|NonNegativeInteger|))) (#5=#:G283 NIL)
          (|newIndex| #4#)
          (|mergedObjects|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
          (|i| (|Integer|)) (#6=#:G294 NIL) (|bob| NIL) (#7=#:G293 NIL)
          (|x| NIL) (#8=#:G292 NIL))
         (SEQ
          (LETT |bmap|
                (PROGN
                 (LETT #8# NIL . #9=(|WGRPH;merge;3$;19|))
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
               (SEQ (LETT |i| (SPADCALL |bob| (QCAR |a|) (QREFELT $ 59)) . #9#)
                    (EXIT
                     (COND
                      ((< |i| 1)
                       (SEQ
                        (LETT |mergedObjects|
                              (SPADCALL |mergedObjects| |bob| (QREFELT $ 19))
                              . #9#)
                        (LETT |newIndex| (+ |newIndex| 1) . #9#)
                        (EXIT
                         (LETT |bmap|
                               (SPADCALL |bmap| |newIndex| (QREFELT $ 60))
                               . #9#))))
                      ('T
                       (LETT |bmap|
                             (SPADCALL |bmap|
                                       (PROG1 (LETT #5# |i| . #9#)
                                         (|check_subtype| (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          #5#))
                                       (QREFELT $ 60))
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
                                (QREFELT $ 34))
                      . #9#)
                (LETT |fromI|
                      (SPADCALL |bmap| (+ (QVELT |ba| 2) |bStart|)
                                (QREFELT $ 34))
                      . #9#)
                (LETT |arr|
                      (VECTOR (QVELT |ba| 0) (QVELT |ba| 1) |fromI| |toI|
                              (QVELT |ba| 4) (QVELT |ba| 5) (QVELT |ba| 6))
                      . #9#)
                (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 18)) . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 57)) . #9#)
          (EXIT (CONS |mergedObjects| |la|))))) 

(SDEFUN |WGRPH;objProd|
        ((|a| $) (|b| $)
         ($ |List|
          (|Record| (|:| |value| (|Product| S S))
                    (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
        (SPROG
         ((|newObjs|
           (|List|
            (|Record| (|:| |value| (|Product| S S))
                      (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
          (|ob|
           (|Record| (|:| |value| (|Product| S S))
                     (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))
          (|sp| (|Product| S S)) (|heighta| (|NonNegativeInteger|))
          (|widtha| (|NonNegativeInteger|)) (|y| #1=(|NonNegativeInteger|))
          (|x| #1#) (|byi| #2=(|NonNegativeInteger|))
          (|bxi| #3=(|NonNegativeInteger|)) (|bi| (S)) (#4=#:G306 NIL)
          (|boi| NIL) (|ayi| #2#) (|axi| #3#) (|ai| (S)) (#5=#:G305 NIL)
          (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #6=(|WGRPH;objProd|))
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
                                             (SPADCALL |a| (QREFELT $ 62)))
                                          |axi|)
                                         . #6#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 63)))
                                          |ayi|)
                                         . #6#)
                                   (LETT |widtha| (SPADCALL |a| (QREFELT $ 62))
                                         . #6#)
                                   (LETT |heighta|
                                         (SPADCALL |a| (QREFELT $ 63)) . #6#)
                                   (LETT |sp|
                                         (SPADCALL |ai| |bi| (QREFELT $ 65))
                                         . #6#)
                                   (LETT |ob|
                                         (VECTOR |sp| |x| |y|
                                                 (|spadConstant| $ 9))
                                         . #6#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 68))
                                          . #6#)))
                              (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |WGRPH;indexProd|
        ((|aObj| $) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G307 NIL))
               (+ |a|
                  (*
                   (PROG1 (LETT #1# (- |b| 1) |WGRPH;indexProd|)
                     (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                   (LENGTH (QCAR |aObj|)))))) 

(SDEFUN |WGRPH;*;2$Wg;22|
        ((|a| $) (|b| $) ($ |WeightedGraph| (|Product| S S) W))
        (SPROG
         ((|newArrs|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|an| (|String|)) (#2=#:G329 NIL) (|bv| NIL)
          (#3=#:G328 NIL) (|bu| NIL) (#4=#:G327 NIL) (|av| NIL) (#5=#:G326 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|WGRPH;*;2$Wg;22|))
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
                                                      (QREFELT $ 69))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 69))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          70))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          70)))
                                                      (QREFELT $ 72))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| $
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 18))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|WGRPH;objProd| |a| |b| $) |newArrs|
                         (QREFELT $ 74)))))) 

(SDEFUN |WGRPH;cartesian;2$Wg;23|
        ((|a| $) (|b| $) ($ |WeightedGraph| (|Product| S S) W))
        (SPROG
         ((|newArrs|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|an| (|String|)) (#2=#:G354 NIL) (|bv| NIL)
          (#3=#:G353 NIL) (|bu| NIL) (#4=#:G352 NIL) (|av| NIL) (#5=#:G351 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|WGRPH;cartesian;2$Wg;23|))
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
                                                        (QREFELT $ 69))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            69))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              70))
                                                           #7="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 72)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              70))
                                                           #8="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 72)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            70))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 72))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| $
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 18))
                                                      . #6#))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT $ 69))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              69))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        $ 70))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT $ 72)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        $ 70))
                                                             #8#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT $ 72)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              70))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 72))))
                                                       . #6#)
                                                 (LETT |arr|
                                                       (VECTOR |an|
                                                               (|spadConstant|
                                                                $ 9)
                                                               (|WGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                $)
                                                               (|WGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                $)
                                                               0 0 NIL)
                                                       . #6#)
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT $
                                                                           18))
                                                        . #6#))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 69))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            69))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              70))
                                                           #7#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 72)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              70))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 72)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            70))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 72))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| $
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 18))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|WGRPH;objProd| |a| |b| $) |newArrs|
                         (QREFELT $ 74)))))) 

(SDEFUN |WGRPH;closedObjProd|
        ((|a| $) (|b| $) (|f| |Mapping| S S S)
         ($ |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
        (SPROG
         ((|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
          (|ob|
           (|Record| (|:| |value| S) (|:| |posX| #1=(|NonNegativeInteger|))
                     (|:| |posY| #2=(|NonNegativeInteger|)) (|:| |weight| W)))
          (|sp| (S)) (|heighta| (|NonNegativeInteger|))
          (|widtha| (|NonNegativeInteger|)) (|y| #3=(|NonNegativeInteger|))
          (|x| #3#) (|byi| #2#) (|bxi| #1#) (|bi| (S)) (#4=#:G363 NIL)
          (|boi| NIL) (|ayi| #2#) (|axi| #1#) (|ai| (S)) (#5=#:G362 NIL)
          (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #6=(|WGRPH;closedObjProd|))
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
                                             (SPADCALL |a| (QREFELT $ 62)))
                                          |axi|)
                                         . #6#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 63)))
                                          |ayi|)
                                         . #6#)
                                   (LETT |widtha| (SPADCALL |a| (QREFELT $ 62))
                                         . #6#)
                                   (LETT |heighta|
                                         (SPADCALL |a| (QREFELT $ 63)) . #6#)
                                   (LETT |sp| (SPADCALL |ai| |bi| |f|) . #6#)
                                   (LETT |ob|
                                         (VECTOR |sp| |x| |y|
                                                 (|spadConstant| $ 9))
                                         . #6#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 19))
                                          . #6#)))
                              (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |WGRPH;closedTensor;2$M$;25|
        ((|a| $) (|b| $) (|f| |Mapping| S S S) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|an| (|String|)) (#2=#:G384 NIL) (|bv| NIL)
          (#3=#:G383 NIL) (|bu| NIL) (#4=#:G382 NIL) (|av| NIL) (#5=#:G381 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|WGRPH;closedTensor;2$M$;25|))
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
                                                      (QREFELT $ 69))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 69))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          70))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          70)))
                                                      (QREFELT $ 72))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| $
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 18))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|WGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                         (QREFELT $ 17)))))) 

(SDEFUN |WGRPH;closedCartesian;2$M$;26|
        ((|a| $) (|b| $) (|f| |Mapping| S S S) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|an| (|String|)) (#2=#:G410 NIL) (|bv| NIL)
          (#3=#:G409 NIL) (|bu| NIL) (#4=#:G408 NIL) (|av| NIL) (#5=#:G407 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|WGRPH;closedCartesian;2$M$;26|))
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
                                                        (QREFELT $ 69))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            69))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              70))
                                                           #7="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 72)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              70))
                                                           #8="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 72)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            70))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 72))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| $
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 18))
                                                      . #6#))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT $ 69))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              69))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        $ 70))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT $ 72)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        $ 70))
                                                             #8#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT $ 72)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              70))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 72))))
                                                       . #6#)
                                                 (LETT |arr|
                                                       (VECTOR |an|
                                                               (|spadConstant|
                                                                $ 9)
                                                               (|WGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                $)
                                                               (|WGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                $)
                                                               0 0 NIL)
                                                       . #6#)
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT $
                                                                           18))
                                                        . #6#))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 69))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            69))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              70))
                                                           #7#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 72)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              70))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 72)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            70))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 72))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| $
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 18))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|WGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                         (QREFELT $ 17)))))) 

(SDEFUN |WGRPH;map;$LL2I$;27|
        ((|s| $) (|m| |List| (|NonNegativeInteger|)) (|newOb| |List| S)
         (|offsetX| . #1=(|Integer|)) (|offsetY| . #1#) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            #2=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|newArr| #2#) (#3=#:G427 NIL) (|oldArrow| NIL) (#4=#:G415 NIL)
          (#5=#:G414 NIL) (|i| (|NonNegativeInteger|)) (#6=#:G426 NIL)
          (|oi| NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
          (#7=#:G425 NIL) (|o| NIL) (#8=#:G424 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #8# NIL . #9=(|WGRPH;map;$LL2I$;27|))
                 (SEQ (LETT |o| NIL . #9#) (LETT #7# |newOb| . #9#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |o| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8#
                              (CONS (VECTOR |o| 0 0 (|spadConstant| $ 9)) #8#)
                              . #9#)))
                      (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (SEQ (LETT |oi| 1 . #9#) (LETT #6# (LENGTH (QCAR |s|)) . #9#) G190
               (COND ((|greater_SI| |oi| #6#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 34)) . #9#)
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 80))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 80))
                                            1)
                                           |offsetX|)
                                          . #9#)
                                  (|check_subtype| (>= #5# 0)
                                                   '(|NonNegativeInteger|)
                                                   #5#))
                                (PROG1
                                    (LETT #4#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 80))
                                            2)
                                           |offsetY|)
                                          . #9#)
                                  (|check_subtype| (>= #4# 0)
                                                   '(|NonNegativeInteger|)
                                                   #4#))
                                (|spadConstant| $ 9))
                               (QREFELT $ 81))))
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
                                        (QREFELT $ 34))
                              (SPADCALL |m| (QVELT |oldArrow| 3)
                                        (QREFELT $ 34))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6))
                      . #9#)
                (EXIT
                 (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 18))
                       . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(SDEFUN |WGRPH;mapContra;$LL2I$;28|
        ((|s| $) (|m| |List| (|NonNegativeInteger|)) (|newOb| |List| S)
         (|offsetX| . #1=(|Integer|)) (|offsetY| . #1#) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            #2=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|newArr| #2#) (#3=#:G444 NIL) (|oldArrow| NIL) (#4=#:G432 NIL)
          (#5=#:G431 NIL) (|i| (|NonNegativeInteger|)) (#6=#:G443 NIL)
          (|oi| NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
          (#7=#:G442 NIL) (|o| NIL) (#8=#:G441 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #8# NIL . #9=(|WGRPH;mapContra;$LL2I$;28|))
                 (SEQ (LETT |o| NIL . #9#) (LETT #7# |newOb| . #9#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |o| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8#
                              (CONS (VECTOR |o| 0 0 (|spadConstant| $ 9)) #8#)
                              . #9#)))
                      (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (SEQ (LETT |oi| 1 . #9#) (LETT #6# (LENGTH (QCAR |s|)) . #9#) G190
               (COND ((|greater_SI| |oi| #6#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 34)) . #9#)
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 80))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 80))
                                            1)
                                           |offsetX|)
                                          . #9#)
                                  (|check_subtype| (>= #5# 0)
                                                   '(|NonNegativeInteger|)
                                                   #5#))
                                (PROG1
                                    (LETT #4#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 80))
                                            2)
                                           |offsetY|)
                                          . #9#)
                                  (|check_subtype| (>= #4# 0)
                                                   '(|NonNegativeInteger|)
                                                   #4#))
                                (|spadConstant| $ 9))
                               (QREFELT $ 81))))
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
                                        (QREFELT $ 34))
                              (SPADCALL |m| (QVELT |oldArrow| 2)
                                        (QREFELT $ 34))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6))
                      . #9#)
                (EXIT
                 (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 18))
                       . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(SDEFUN |WGRPH;routeNodeRecursive|
        ((|s| $) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         (|visited| |List| (|NonNegativeInteger|))
         ($ . #1=(|List| (|NonNegativeInteger|))))
        (SPROG
         ((#2=#:G457 NIL) (|shortest| (|List| (|NonNegativeInteger|)))
          (|d| #1#) (#3=#:G458 NIL) (|arr| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |visited| (QREFELT $ 33))
                        (LENGTH (SPADCALL |s| (QREFELT $ 45))) (QREFELT $ 84))
              (PROGN
               (LETT #2# NIL . #4=(|WGRPH;routeNodeRecursive|))
               (GO #5=#:G456))))
            (LETT |shortest| NIL . #4#)
            (COND ((EQL |a| |b|) (PROGN (LETT #2# (LIST |a|) . #4#) (GO #5#))))
            (COND
             ((SPADCALL |s| |a| |b| (QREFELT $ 69))
              (PROGN (LETT #2# (LIST |a| |b|) . #4#) (GO #5#))))
            (SEQ (LETT |arr| NIL . #4#)
                 (LETT #3# (SPADCALL |s| (QREFELT $ 47)) . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |arr| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 69))
                     (SEQ
                      (LETT |d|
                            (|WGRPH;routeNodeRecursive| |s| (QVELT |arr| 2) |b|
                             (SPADCALL |visited| |a| (QREFELT $ 60)) $)
                            . #4#)
                      (EXIT
                       (COND
                        ((SPADCALL |shortest| NIL (QREFELT $ 85))
                         (LETT |shortest| |d| . #4#))
                        ((SPADCALL |d| NIL (QREFELT $ 86))
                         (COND
                          ((SPADCALL
                            (SPADCALL |s| (CONS |a| |d|) (QREFELT $ 87))
                            (SPADCALL |s| (CONS |a| |shortest|) (QREFELT $ 87))
                            (QREFELT $ 88))
                           (LETT |shortest| |d| . #4#)))))))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |shortest| NIL (QREFELT $ 85))
              (PROGN (LETT #2# NIL . #4#) (GO #5#))))
            (EXIT (CONS |a| |shortest|))))
          #5# (EXIT #2#)))) 

(SDEFUN |WGRPH;routeNodes;$2NniL;30|
        ((|s| $) (|a| . #1=(|NonNegativeInteger|)) (|b| . #1#)
         ($ |List| (|NonNegativeInteger|)))
        (|WGRPH;routeNodeRecursive| |s| |a| |b| NIL $)) 

(SDEFUN |WGRPH;routeArrowRecursive|
        ((|s| $) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         (|visited| |List| (|NonNegativeInteger|))
         ($ . #1=(|List| (|NonNegativeInteger|))))
        (SPROG
         ((#2=#:G475 NIL)
          (|shortestFullPath| (|List| #3=(|NonNegativeInteger|)))
          (|shortest| (|List| #3#))
          (|fullPath| (|List| (|NonNegativeInteger|))) (|d| #1#) (|aa| #3#)
          (#4=#:G476 NIL) (|arr| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arrn| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |visited| (QREFELT $ 33))
                        (LENGTH (SPADCALL |s| (QREFELT $ 45))) (QREFELT $ 84))
              (PROGN
               (LETT #2# (LIST 0) . #5=(|WGRPH;routeArrowRecursive|))
               (GO #6=#:G474))))
            (LETT |shortest| (LIST 0) . #5#)
            (COND ((EQL |a| |b|) (PROGN (LETT #2# NIL . #5#) (GO #6#))))
            (LETT |arrn| (SPADCALL |s| |a| |b| (QREFELT $ 90)) . #5#)
            (COND
             ((SPADCALL |arrn| 0 (QREFELT $ 54))
              (PROGN (LETT #2# (LIST |arrn|) . #5#) (GO #6#))))
            (LETT |aa| 0 . #5#) (LETT |shortestFullPath| (LIST 0) . #5#)
            (LETT |arrs| (SPADCALL |s| (QREFELT $ 47)) . #5#)
            (SEQ (LETT |arr| NIL . #5#) (LETT #4# |arrs| . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |arr| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 69))
                     (SEQ
                      (LETT |aa|
                            (SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 90))
                            . #5#)
                      (LETT |d|
                            (|WGRPH;routeArrowRecursive| |s| (QVELT |arr| 2)
                             |b| (SPADCALL |visited| |a| (QREFELT $ 60)) $)
                            . #5#)
                      (LETT |fullPath| (CONS |aa| |d|) . #5#)
                      (EXIT
                       (COND
                        ((SPADCALL |shortest| (LIST 0) (QREFELT $ 85))
                         (SEQ (LETT |shortest| |d| . #5#)
                              (EXIT
                               (LETT |shortestFullPath| |fullPath| . #5#))))
                        ((SPADCALL |d| (LIST 0) (QREFELT $ 86))
                         (COND
                          ((SPADCALL (SPADCALL |s| |fullPath| (QREFELT $ 91))
                                     (SPADCALL |s| |shortestFullPath|
                                               (QREFELT $ 91))
                                     (QREFELT $ 88))
                           (SEQ (LETT |shortest| |d| . #5#)
                                (EXIT
                                 (LETT |shortestFullPath| |fullPath|
                                       . #5#)))))))))))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |shortest| (LIST 0) (QREFELT $ 85))
              (PROGN (LETT #2# (LIST 0) . #5#) (GO #6#))))
            (EXIT |shortestFullPath|)))
          #6# (EXIT #2#)))) 

(SDEFUN |WGRPH;routeArrows;$2NniL;32|
        ((|s| $) (|a| . #1=(|NonNegativeInteger|)) (|b| . #1#)
         ($ |List| (|NonNegativeInteger|)))
        (|WGRPH;routeArrowRecursive| |s| |a| |b| NIL $)) 

(SDEFUN |WGRPH;distanceWeighted;$2NniU;33|
        ((|s| $) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Union| W "disjoint"))
        (SPROG ((#1=#:G488 NIL) (|r| (|List| (|NonNegativeInteger|))))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |r| (|WGRPH;routeNodeRecursive| |s| |a| |b| NIL $)
                        . #2=(|WGRPH;distanceWeighted;$2NniU;33|))
                  (COND
                   ((EQL (SPADCALL |r| (QREFELT $ 33)) 0)
                    (PROGN
                     (LETT #1# (CONS 1 "disjoint") . #2#)
                     (GO #3=#:G487))))
                  (EXIT (CONS 0 (SPADCALL |s| |r| (QREFELT $ 87))))))
                #3# (EXIT #1#)))) 

(SDEFUN |WGRPH;getWeightBetween|
        ((|s| $) (|i1| |NonNegativeInteger|) (|i2| |NonNegativeInteger|) ($ W))
        (SPROG
         ((|res| (W)) (|isDisjoint| (|Boolean|)) (#1=#:G500 NIL) (|arr| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |isDisjoint| 'T . #2=(|WGRPH;getWeightBetween|))
              (LETT |res| (|spadConstant| $ 9) . #2#)
              (LETT |arrs| (QCDR |s|) . #2#)
              (SEQ (LETT |arr| NIL . #2#) (LETT #1# |arrs| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |arr| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      (|isDisjoint|
                       (COND
                        ((EQL (QVELT |arr| 2) |i1|)
                         (COND
                          ((EQL (QVELT |arr| 3) |i2|)
                           (SEQ (LETT |res| (QVELT |arr| 1) . #2#)
                                (EXIT (LETT |isDisjoint| 'NIL . #2#))))))))
                      ((EQL (QVELT |arr| 2) |i1|)
                       (COND
                        ((EQL (QVELT |arr| 3) |i2|)
                         (COND
                          ((SPADCALL (QVELT |arr| 1) |res| (QREFELT $ 88))
                           (LETT |res| (QVELT |arr| 1) . #2#)))))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |WGRPH;routeNodeWeight;$LW;35|
        ((|s| $) (|r| |List| (|NonNegativeInteger|)) ($ W))
        (SPROG
         ((|lasti| (|NonNegativeInteger|)) (|fst| (|Boolean|)) (|res| (W))
          (|w| (W)) (#1=#:G506 NIL) (|i| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 9)
                . #2=(|WGRPH;routeNodeWeight;$LW;35|))
          (LETT |fst| 'T . #2#) (LETT |lasti| 0 . #2#)
          (SEQ (LETT |i| NIL . #2#) (LETT #1# |r| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (COND
                 ((NULL |fst|)
                  (SEQ
                   (LETT |w| (|WGRPH;getWeightBetween| |s| |lasti| |i| $)
                         . #2#)
                   (EXIT
                    (LETT |res| (SPADCALL |res| |w| (QREFELT $ 95)) . #2#)))))
                (LETT |fst| 'NIL . #2#) (EXIT (LETT |lasti| |i| . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |WGRPH;routeArrowWeight;$LW;36|
        ((|s| $) (|r| |List| (|NonNegativeInteger|)) ($ W))
        (SPROG
         ((|res| (W))
          (|a|
           (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (#1=#:G512 NIL) (|i| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 9)
                . #2=(|WGRPH;routeArrowWeight;$LW;36|))
          (SEQ (LETT |i| NIL . #2#) (LETT #1# |r| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |a| (SPADCALL (QCDR |s|) |i| (QREFELT $ 96)) . #2#)
                    (EXIT
                     (LETT |res| (SPADCALL |res| (QVELT |a| 1) (QREFELT $ 95))
                           . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |WGRPH;weightedDistanceMatrix;$Tda;37|
        ((|s| $) ($ |TwoDimensionalArray| (|Union| W #1="disjoint")))
        (SPROG
         ((|v| NIL) (|u| NIL) (|m| (|TwoDimensionalArray| (|Union| W #1#)))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (LENGTH (SPADCALL |s| (QREFELT $ 45)))
                . #2=(|WGRPH;weightedDistanceMatrix;$Tda;37|))
          (LETT |m| (MAKE_MATRIX1 |n| |n| (CONS 0 (|spadConstant| $ 9))) . #2#)
          (SEQ (LETT |u| 1 . #2#) G190
               (COND ((|greater_SI| |u| |n|) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |v| 1 . #2#) G190
                      (COND ((|greater_SI| |v| |n|) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF2O |m| |u| |v|
                                    (SPADCALL |s| |u| |v| (QREFELT $ 94)) 1
                                    1)))
                      (LETT |v| (|inc_SI| |v|) . #2#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |u| (|inc_SI| |u|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |m|)))) 

(DECLAIM (NOTINLINE |WeightedGraph;|)) 

(DEFUN |WeightedGraph| (&REST #1=#:G525)
  (SPROG NIL
         (PROG (#2=#:G526)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|WeightedGraph|)
                                               '|domainEqualList|)
                    . #3=(|WeightedGraph|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |WeightedGraph;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|WeightedGraph|)))))))))) 

(DEFUN |WeightedGraph;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|WeightedGraph|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|WeightedGraph| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 110) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|WeightedGraph| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|Record|
                     (|:| |objects|
                          (|List|
                           (|Record| (|:| |value| |#1|)
                                     (|:| |posX| (|NonNegativeInteger|))
                                     (|:| |posY| (|NonNegativeInteger|))
                                     (|:| |weight| |#2|))))
                     (|:| |arrows|
                          (|List|
                           (|Record| (|:| |name| (|String|))
                                     (|:| |weight| |#2|)
                                     (|:| |fromOb| (|NonNegativeInteger|))
                                     (|:| |toOb| (|NonNegativeInteger|))
                                     (|:| |xOffset| (|Integer|))
                                     (|:| |yOffset| (|Integer|))
                                     (|:| |map|
                                          (|List| (|NonNegativeInteger|))))))))
          $))) 

(MAKEPROP '|WeightedGraph| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (0 . |Zero|) (|List| 6) |WGRPH;weightedGraph;L$;1|
              (|Record| (|:| |value| 6) (|:| |posX| 27) (|:| |posY| 27)
                        (|:| |weight| 7))
              (|List| 12) |WGRPH;weightedGraph;L$;2|
              (|Record| (|:| |name| 40) (|:| |weight| 7) (|:| |fromOb| 27)
                        (|:| |toOb| 27) (|:| |xOffset| 25) (|:| |yOffset| 25)
                        (|:| |map| 30))
              (|List| 15) |WGRPH;weightedGraph;LL$;3| (4 . |concat|)
              (10 . |concat|)
              (|Record| (|:| |value| 6) (|:| |posX| 27) (|:| |posY| 27))
              (|List| 20)
              (|Record| (|:| |name| 40) (|:| |arrType| 27) (|:| |fromOb| 27)
                        (|:| |toOb| 27) (|:| |xOffset| 25) (|:| |yOffset| 25)
                        (|:| |map| 30))
              (|List| 22) |WGRPH;weightedGraph;LL$;4| (|Integer|) (16 . |elt|)
              (|NonNegativeInteger|) (22 . |createX|) (28 . |createY|)
              (|List| 27) (|List| 30) (34 . |elt|) (40 . |#|) (45 . |elt|)
              |WGRPH;weightedGraph;LL$;5| (|Boolean|) (51 . =)
              |WGRPH;addObject!;$S$;6| |WGRPH;addObject!;$R$;7| (|String|)
              |WGRPH;addWArrow!;$S2NniW$;9| |WGRPH;addArrow!;$S2Nni$;8|
              (57 . =) (63 . |concat|) |WGRPH;getVertices;$L;10|
              (69 . |concat|) |WGRPH;getArrows;$L;11| |WGRPH;initial;$;12|
              |WGRPH;terminal;S$;13| (75 . <=) |WGRPH;cycleOpen;LS$;14|
              |WGRPH;cycleClosed;LS$;15| |WGRPH;unit;LS$;16| (81 . ~=)
              |WGRPH;kgraph;LS$;17| (87 . |concat|) (93 . |concat|)
              |WGRPH;+;3$;18| (99 . |position|) (105 . |concat|)
              |WGRPH;merge;3$;19| (111 . |diagramWidth|)
              (116 . |diagramHeight|) (|Product| 6 6) (121 . |construct|)
              (|Record| (|:| |value| 64) (|:| |posX| 27) (|:| |posY| 27)
                        (|:| |weight| 7))
              (|List| 66) (127 . |concat|) (133 . |isDirectSuccessor?|)
              (140 . |arrowName|) (|List| $) (147 . |concat|)
              (|WeightedGraph| 64 7) (152 . |weightedGraph|) |WGRPH;*;2$Wg;22|
              |WGRPH;cartesian;2$Wg;23| (|Mapping| 6 6 6)
              |WGRPH;closedTensor;2$M$;25| |WGRPH;closedCartesian;2$M$;26|
              (158 . |elt|) (164 . |setelt|) |WGRPH;map;$LL2I$;27|
              |WGRPH;mapContra;$LL2I$;28| (171 . >) (177 . =) (183 . ~=)
              |WGRPH;routeNodeWeight;$LW;35| (189 . <)
              |WGRPH;routeNodes;$2NniL;30| (195 . |getArrowIndex|)
              |WGRPH;routeArrowWeight;$LW;36| |WGRPH;routeArrows;$2NniL;32|
              (|Union| 7 '"disjoint") |WGRPH;distanceWeighted;$2NniU;33|
              (202 . +) (208 . |elt|) (|TwoDimensionalArray| 93)
              |WGRPH;weightedDistanceMatrix;$Tda;37| (|Void|)
              (|Scene| (|SCartesian| '2)) (|Matrix| 25) (|Matrix| 27)
              (|List| (|Loop|)) (|List| 105) (|Tree| 25) (|DirectedGraph| $)
              (|SingleInteger|) (|OutputForm|) (|HashState|))
           '#(~= 214 |weightedGraph| 220 |weightedDistanceMatrix| 248 |unit|
              253 |terminal| 259 |subdiagramSvg| 264 |spanningTreeNode| 272
              |spanningTreeArrow| 278 |spanningForestNode| 284
              |spanningForestArrow| 289 |routeNodes| 294 |routeNodeWeight| 301
              |routeArrows| 307 |routeArrowWeight| 314 |outDegree| 320
              |nodeToNode| 326 |nodeToArrow| 332 |nodeFromNode| 338
              |nodeFromArrow| 344 |min| 350 |merge| 361 |max| 367 |mapContra|
              378 |map| 387 |looseEquals| 396 |loopsNodes| 402 |loopsAtNode|
              407 |loopsArrows| 413 |latex| 418 |laplacianMatrix| 423 |kgraph|
              428 |isGreaterThan?| 434 |isFunctional?| 441 |isFixPoint?| 446
              |isDirected?| 452 |isDirectSuccessor?| 456 |isAcyclic?| 463
              |initial| 468 |incidenceMatrix| 472 |inDegree| 477 |hashUpdate!|
              483 |hash| 489 |getVertices| 494 |getVertexIndex| 499 |getArrows|
              505 |getArrowIndex| 510 |flatten| 517 |distanceWeighted| 522
              |distanceMatrix| 529 |distance| 534 |diagramWidth| 541
              |diagramSvg| 546 |diagramHeight| 553 |deepDiagramSvg| 558
              |cycleOpen| 565 |cycleClosed| 571 |createY| 577 |createX| 583
              |createWidth| 589 |coerce| 594 |closedTensor| 604
              |closedCartesian| 611 |cartesian| 618 |arrowsToNode| 624
              |arrowsToArrow| 630 |arrowsFromNode| 636 |arrowsFromArrow| 642
              |arrowName| 648 |adjacencyMatrix| 655 |addWArrow!| 660
              |addObject!| 669 |addArrow!| 681 = 706 + 712 * 718)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|)
                           (|CoercibleTo| 108) (|BasicType|))
                        (|makeByteWordVec2| 109
                                            '(0 7 0 9 2 16 0 0 15 18 2 13 0 0
                                              12 19 2 10 6 0 25 26 2 0 27 27 27
                                              28 2 0 27 27 27 29 2 31 30 0 25
                                              32 1 30 27 0 33 2 30 27 0 25 34 2
                                              13 36 0 0 37 2 16 36 0 0 43 2 21
                                              0 0 20 44 2 23 0 0 22 46 2 27 36
                                              0 0 50 2 27 36 0 0 54 2 13 0 0 0
                                              56 2 16 0 0 0 57 2 13 25 12 0 59
                                              2 30 0 0 27 60 1 0 27 0 62 1 0 27
                                              0 63 2 64 0 6 6 65 2 67 0 0 66 68
                                              3 0 36 0 27 27 69 3 0 40 0 27 27
                                              70 1 40 0 71 72 2 73 0 67 16 74 2
                                              13 12 0 25 80 3 13 12 0 25 12 81
                                              2 27 36 0 0 84 2 30 36 0 0 85 2
                                              30 36 0 0 86 2 7 36 0 0 88 3 0 27
                                              0 27 27 90 2 7 0 0 0 95 2 16 15 0
                                              25 96 2 0 36 0 0 1 2 0 0 10 31 35
                                              2 0 0 13 16 17 2 0 0 21 23 24 1 0
                                              0 13 14 1 0 0 10 11 1 0 97 0 98 2
                                              0 0 10 40 53 1 0 0 6 49 4 0 99
                                              100 0 36 36 1 2 0 105 0 27 1 2 0
                                              105 0 27 1 1 0 104 0 1 1 0 104 0
                                              1 3 0 30 0 27 27 89 2 0 7 0 30 87
                                              3 0 30 0 27 27 92 2 0 7 0 30 91 2
                                              0 27 0 27 1 2 0 30 0 27 1 2 0 30
                                              0 27 1 2 0 30 0 27 1 2 0 30 0 27
                                              1 2 0 27 0 30 1 1 0 27 0 1 2 0 0
                                              0 0 61 2 0 27 0 30 1 1 0 27 0 1 5
                                              0 0 0 30 10 25 25 83 5 0 0 0 30
                                              10 25 25 82 2 0 36 0 0 1 1 0 103
                                              0 1 2 0 103 0 27 1 1 0 103 0 1 1
                                              0 40 0 1 1 0 101 0 1 2 0 0 10 40
                                              55 3 0 36 0 27 27 1 1 0 36 0 1 2
                                              0 36 0 27 1 0 0 36 1 3 0 36 0 27
                                              27 69 1 0 36 0 1 0 0 0 48 1 0 101
                                              0 1 2 0 27 0 27 1 2 0 109 109 0 1
                                              1 0 107 0 1 1 0 21 0 45 2 0 27 0
                                              6 1 1 0 23 0 47 3 0 27 0 27 27 90
                                              1 0 0 106 1 3 0 93 0 27 27 94 1 0
                                              101 0 1 3 0 25 0 27 27 1 1 0 27 0
                                              62 3 0 99 40 0 36 1 1 0 27 0 63 3
                                              0 99 40 0 36 1 2 0 0 10 40 51 2 0
                                              0 10 40 52 2 0 27 27 27 29 2 0 27
                                              27 27 28 1 0 27 27 1 1 0 108 0 1
                                              1 0 108 0 1 3 0 0 0 0 77 78 3 0 0
                                              0 0 77 79 2 0 73 0 0 76 2 0 30 0
                                              27 1 2 0 30 0 27 1 2 0 30 0 27 1
                                              2 0 30 0 27 1 3 0 40 0 27 27 70 1
                                              0 102 0 1 5 0 0 0 40 27 27 7 41 2
                                              0 0 0 20 39 2 0 0 0 6 38 4 0 0 0
                                              40 6 6 1 4 0 0 0 40 27 27 42 5 0
                                              0 0 40 27 27 30 1 2 0 36 0 0 1 2
                                              0 0 0 0 58 2 0 73 0 0 75)))))
           '|lookupComplete|)) 
