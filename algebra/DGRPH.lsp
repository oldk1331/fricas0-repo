
(SDEFUN |DGRPH;directedGraph;L$;1| ((|objs| |List| S) ($ $))
        (SPROG
         ((|obs|
           (|List|
            #1=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #1#) (#2=#:G134 NIL) (|ob| NIL) (#3=#:G135 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #4=(|DGRPH;directedGraph;L$;1|))
              (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#)
                   (LETT |ob| NIL . #4#) (LETT #2# |objs| . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |ob| (CAR #2#) . #4#) NIL)
                         (|greater_SI| |obn| #3#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 10)))
                          . #4#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #4#)))
                   (LETT #2#
                         (PROG1 (CDR #2#) (LETT |obn| (|inc_SI| |obn|) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| NIL))))) 

(PUT '|DGRPH;directedGraph;L$;2| '|SPADreplace| '(XLAM (|ob|) (CONS |ob| NIL))) 

(SDEFUN |DGRPH;directedGraph;L$;2|
        ((|ob| |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|))))
         ($ $))
        (CONS |ob| NIL)) 

(PUT '|DGRPH;directedGraph;LL$;3| '|SPADreplace| 'CONS) 

(SDEFUN |DGRPH;directedGraph;LL$;3|
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

(SDEFUN |DGRPH;directedGraph;LL$;4|
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
          (|a| #1#) (#2=#:G158 NIL) (|j| NIL) (#3=#:G157 NIL) (|i| NIL)
          (|obs|
           (|List|
            #4=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #4#) (#5=#:G155 NIL) (|ob| NIL) (#6=#:G156 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #7=(|DGRPH;directedGraph;LL$;4|))
              (SEQ (LETT |obn| 1 . #7#) (LETT #6# (LENGTH |objs|) . #7#)
                   (LETT |ob| NIL . #7#) (LETT #5# |objs| . #7#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |ob| (CAR #5#) . #7#) NIL)
                         (|greater_SI| |obn| #6#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 10)))
                          . #7#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #7#)))
                   (LETT #5#
                         (PROG1 (CDR #5#) (LETT |obn| (|inc_SI| |obn|) . #7#))
                         . #7#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |ar| NIL . #7#)
              (SEQ (LETT |i| 1 . #7#) (LETT #3# (LENGTH |am|) . #7#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #7#)
                          (LETT #2#
                                (SPADCALL (SPADCALL |am| |i| (QREFELT $ 23))
                                          (QREFELT $ 24))
                                . #7#)
                          G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((EQL
                               (SPADCALL (SPADCALL |am| |i| (QREFELT $ 23)) |j|
                                         (QREFELT $ 25))
                               1)
                              (SEQ
                               (LETT |a| (VECTOR "a" 0 |i| |j| 0 0 NIL) . #7#)
                               (EXIT
                                (LETT |ar| (SPADCALL |ar| |a| (QREFELT $ 26))
                                      . #7#)))))))
                          (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ar|))))) 

(SDEFUN |DGRPH;directedGraph;L$;5| ((|perms| |List| (|Permutation| S)) ($ $))
        (SPROG
         ((|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (#2=#:G334 NIL) (|arrNum| NIL)
          (|verts|
           (|List|
            #3=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #3#) (#4=#:G332 NIL) (|vert| NIL) (#5=#:G333 NIL) (|i| NIL)
          (#6=#:G309 NIL) (#7=#:G308 NIL) (|pout| #8=(|Integer|)) (|pin| #8#)
          (#9=#:G331 NIL) (|pt| NIL) (|preim| #10=(|List| S))
          (|im| #11=(|List| S))
          (|lr| (|Record| (|:| |preimage| #10#) (|:| |image| #11#)))
          (#12=#:G329 NIL) (|perm| NIL) (#13=#:G330 NIL) (|pi| NIL)
          (|tab| (|List| (|List| (|NonNegativeInteger|)))) (#14=#:G328 NIL)
          (#15=#:G327 NIL) (#16=#:G326 NIL) (|b| NIL) (#17=#:G325 NIL)
          (|obs| (|List| S)) (#18=#:G324 NIL) (|v| NIL) (#19=#:G322 NIL)
          (#20=#:G323 NIL) (|px| NIL))
         (SEQ (LETT |obs| NIL . #21=(|DGRPH;directedGraph;L$;5|))
              (SEQ (LETT |px| 1 . #21#) (LETT #20# (LENGTH |perms|) . #21#)
                   (LETT |perm| NIL . #21#) (LETT #19# |perms| . #21#) G190
                   (COND
                    ((OR (ATOM #19#)
                         (PROGN (LETT |perm| (CAR #19#) . #21#) NIL)
                         (|greater_SI| |px| #20#))
                     (GO G191)))
                   (SEQ (LETT |lr| (SPADCALL |perm| (QREFELT $ 30)) . #21#)
                        (LETT |im| (QCDR |lr|) . #21#)
                        (EXIT
                         (COND ((EQL |px| 1) (LETT |obs| |im| . #21#))
                               ('T
                                (SEQ (LETT |v| NIL . #21#)
                                     (LETT #18# |im| . #21#) G190
                                     (COND
                                      ((OR (ATOM #18#)
                                           (PROGN
                                            (LETT |v| (CAR #18#) . #21#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((< (SPADCALL |v| |obs| (QREFELT $ 32))
                                            1)
                                         (LETT |obs|
                                               (SPADCALL |obs| |v|
                                                         (QREFELT $ 33))
                                               . #21#)))))
                                     (LETT #18# (CDR #18#) . #21#) (GO G190)
                                     G191 (EXIT NIL))))))
                   (LETT #19#
                         (PROG1 (CDR #19#) (LETT |px| (|inc_SI| |px|) . #21#))
                         . #21#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |tab|
                    (PROGN
                     (LETT #17# NIL . #21#)
                     (SEQ (LETT |b| 1 . #21#) (LETT #16# (LENGTH |obs|) . #21#)
                          G190 (COND ((|greater_SI| |b| #16#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #17#
                                  (CONS
                                   (PROGN
                                    (LETT #15# NIL . #21#)
                                    (SEQ (LETT |a| 1 . #21#)
                                         (LETT #14# (LENGTH |perms|) . #21#)
                                         G190
                                         (COND
                                          ((|greater_SI| |a| #14#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #15# (CONS |b| #15#) . #21#)))
                                         (LETT |a| (|inc_SI| |a|) . #21#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #15#))))
                                   #17#)
                                  . #21#)))
                          (LETT |b| (|inc_SI| |b|) . #21#) (GO G190) G191
                          (EXIT (NREVERSE #17#))))
                    . #21#)
              (SEQ (LETT |pi| 1 . #21#) (LETT #13# (LENGTH |perms|) . #21#)
                   (LETT |perm| NIL . #21#) (LETT #12# |perms| . #21#) G190
                   (COND
                    ((OR (ATOM #12#)
                         (PROGN (LETT |perm| (CAR #12#) . #21#) NIL)
                         (|greater_SI| |pi| #13#))
                     (GO G191)))
                   (SEQ (LETT |lr| (SPADCALL |perm| (QREFELT $ 30)) . #21#)
                        (LETT |im| (QCDR |lr|) . #21#)
                        (LETT |preim| (QCAR |lr|) . #21#)
                        (EXIT
                         (SEQ (LETT |pt| 1 . #21#)
                              (LETT #9# (LENGTH |im|) . #21#) G190
                              (COND ((|greater_SI| |pt| #9#) (GO G191)))
                              (SEQ
                               (LETT |pin|
                                     (SPADCALL
                                      (SPADCALL |im| |pt| (QREFELT $ 34)) |obs|
                                      (QREFELT $ 32))
                                     . #21#)
                               (LETT |pout|
                                     (SPADCALL
                                      (SPADCALL |preim| |pt| (QREFELT $ 34))
                                      |obs| (QREFELT $ 32))
                                     . #21#)
                               (EXIT
                                (SPADCALL
                                 (SPADCALL |tab|
                                           (PROG1 (LETT #7# |pin| . #21#)
                                             (|check_subtype2| (>= #7# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #7#))
                                           (QREFELT $ 23))
                                 |pi|
                                 (PROG1 (LETT #6# |pout| . #21#)
                                   (|check_subtype2| (>= #6# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #6#))
                                 (QREFELT $ 35))))
                              (LETT |pt| (|inc_SI| |pt|) . #21#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #12#
                         (PROG1 (CDR #12#) (LETT |pi| (|inc_SI| |pi|) . #21#))
                         . #21#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |verts| NIL . #21#) (LETT |ars| NIL . #21#)
              (SEQ (LETT |i| 1 . #21#) (LETT #5# (LENGTH |obs|) . #21#)
                   (LETT |vert| NIL . #21#) (LETT #4# |obs| . #21#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |vert| (CAR #4#) . #21#) NIL)
                         (|greater_SI| |i| #5#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |vert|
                                  (SPADCALL (LENGTH |obs|) |i| (QREFELT $ 9))
                                  (SPADCALL (LENGTH |obs|) |i| (QREFELT $ 10)))
                          . #21#)
                    (LETT |verts| (SPADCALL |verts| |o| (QREFELT $ 13)) . #21#)
                    (EXIT
                     (SEQ (LETT |arrNum| NIL . #21#)
                          (LETT #2# (SPADCALL |tab| |i| (QREFELT $ 23)) . #21#)
                          G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |arrNum| (CAR #2#) . #21#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |a| (VECTOR "a" 0 |i| |arrNum| 0 0 NIL)
                                 . #21#)
                           (EXIT
                            (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 26))
                                  . #21#)))
                          (LETT #2# (CDR #2#) . #21#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #4# (PROG1 (CDR #4#) (LETT |i| (|inc_SI| |i|) . #21#))
                         . #21#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |verts| |ars|))))) 

(SDEFUN |DGRPH;addObject!;$S$;6| ((|s| $) (|n| S) ($ $))
        (SPROG
         ((|obj|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |obs| (QCAR |s|) . #1=(|DGRPH;addObject!;$S$;6|))
              (LETT |obj| (VECTOR |n| 0 0) . #1#)
              (COND
               ((SPADCALL |obs| NIL (QREFELT $ 39))
                (PROGN (RPLACA |s| (LIST |obj|)) (QCAR |s|)))
               ('T
                (PROGN
                 (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT $ 13)))
                 (QCAR |s|))))
              (EXIT |s|)))) 

(SDEFUN |DGRPH;addObject!;$R$;7|
        ((|s| $)
         (|n| |Record| (|:| |value| S)
          (|:| |posX| . #1=((|NonNegativeInteger|))) (|:| |posY| . #1#))
         ($ $))
        (SPROG
         ((|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |obs| (QCAR |s|) |DGRPH;addObject!;$R$;7|)
              (COND
               ((SPADCALL |obs| NIL (QREFELT $ 39))
                (PROGN (RPLACA |s| (LIST |n|)) (QCAR |s|)))
               ('T
                (PROGN
                 (RPLACA |s| (SPADCALL |obs| |n| (QREFELT $ 13)))
                 (QCAR |s|))))
              (EXIT |s|)))) 

(SDEFUN |DGRPH;addArrow!;$S2Nni$;8|
        ((|s| $) (|nm| |String|) (|n1| . #1=(|NonNegativeInteger|))
         (|n2| . #1#) ($ $))
        (SPROG
         ((#2=#:G352 NIL)
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
           (SEQ (LETT |arrss| (QCDR |s|) . #3=(|DGRPH;addArrow!;$S2Nni$;8|))
                (LETT |a| (VECTOR |nm| 0 |n1| |n2| 0 0 NIL) . #3#)
                (EXIT
                 (COND
                  ((SPADCALL |arrss| NIL (QREFELT $ 42))
                   (SEQ (PROGN (RPLACD |s| (LIST |a|)) (QCDR |s|))
                        (EXIT (PROGN (LETT #2# |s| . #3#) (GO #4=#:G351)))))
                  ('T
                   (SEQ
                    (LETT |arrs| (SPADCALL |arrss| |a| (QREFELT $ 26)) . #3#)
                    (PROGN (RPLACD |s| |arrs|) (QCDR |s|))
                    (EXIT (PROGN (LETT #2# |s| . #3#) (GO #4#)))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |DGRPH;addArrow!;$S2NniL$;9|
        ((|s| $) (|nm| |String|) (|n1| . #1=(|NonNegativeInteger|))
         (|n2| . #1#) (|mp| |List| #1#) ($ $))
        (SPROG
         ((#2=#:G360 NIL)
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
           (SEQ (LETT |arrss| (QCDR |s|) . #3=(|DGRPH;addArrow!;$S2NniL$;9|))
                (LETT |a| (VECTOR |nm| 0 |n1| |n2| 0 0 |mp|) . #3#)
                (EXIT
                 (COND
                  ((SPADCALL |arrss| NIL (QREFELT $ 42))
                   (SEQ (PROGN (RPLACD |s| (LIST |a|)) (QCDR |s|))
                        (EXIT (PROGN (LETT #2# |s| . #3#) (GO #4=#:G359)))))
                  ('T
                   (SEQ
                    (LETT |arrs| (SPADCALL |arrss| |a| (QREFELT $ 26)) . #3#)
                    (PROGN (RPLACD |s| |arrs|) (QCDR |s|))
                    (EXIT (PROGN (LETT #2# |s| . #3#) (GO #4#)))))))))
          #4# (EXIT #2#)))) 

(PUT '|DGRPH;getVertices;$L;10| '|SPADreplace| 'QCAR) 

(SDEFUN |DGRPH;getVertices;$L;10|
        ((|s| $)
         ($ |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)))))
        (QCAR |s|)) 

(PUT '|DGRPH;getArrows;$L;11| '|SPADreplace| 'QCDR) 

(SDEFUN |DGRPH;getArrows;$L;11|
        ((|s| $)
         ($ |List|
          (|Record| (|:| |name| (|String|))
                    (|:| |arrType| (|NonNegativeInteger|))
                    (|:| |fromOb| (|NonNegativeInteger|))
                    (|:| |toOb| (|NonNegativeInteger|))
                    (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                    (|:| |map| (|List| (|NonNegativeInteger|))))))
        (QCDR |s|)) 

(SDEFUN |DGRPH;flatten;Dg$;12| ((|n| |DirectedGraph| $) ($ $))
        (SPROG
         ((|a|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr|
           #1=(|Record| (|:| |name| #2=(|String|))
                        (|:| |arrType| #3=(|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| #4=(|Integer|))
                        (|:| |yOffset| #5=(|Integer|))
                        (|:| |map| #6=(|List| (|NonNegativeInteger|)))))
          (|toOb3| #7=(|NonNegativeInteger|)) (|fromOb3| #7#) (#8=#:G390 NIL)
          (|endi| NIL) (#9=#:G391 NIL) (|starti| NIL) (|map3| #6#)
          (|yOffset3| #5#) (|xOffset3| #4#) (|arrType3| #3#) (|name3| #2#)
          (#10=#:G389 NIL) (|oa3| NIL)
          (|outerArrows|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|map2| #6#) (|yOffset2| #5#) (|xOffset2| #4#) (|toOb2| #7#)
          (|fromOb2| #7#) (|arrType2| #3#) (|name2| #2#) (#11=#:G388 NIL)
          (|a3| NIL) (#12=#:G386 NIL) (|a2| NIL) (#13=#:G387 NIL) (|a2n| NIL)
          (|iv|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|offset| (|NonNegativeInteger|))
          (|offsets| (|List| (|NonNegativeInteger|)))
          (|innerArrows| (|List| (|List| #1#)))
          (|ina|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|innerValues|
           (|List|
            #14=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                          (|:| |posY| (|NonNegativeInteger|)))))
          (|obs2|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|ob2| #14#) (|py| #7#) (|px| #7#) (#15=#:G385 NIL) (|ob| NIL)
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|v3| ($)) (#16=#:G384 NIL) (|v2| NIL)
          (|v|
           (|List|
            (|Record| (|:| |value| $) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |v| (SPADCALL |n| (QREFELT $ 51))
                . #17=(|DGRPH;flatten;Dg$;12|))
          (LETT |innerValues| NIL . #17#) (LETT |offset| 0 . #17#)
          (LETT |offsets| NIL . #17#) (LETT |innerArrows| NIL . #17#)
          (SEQ (LETT |v2| NIL . #17#) (LETT #16# |v| . #17#) G190
               (COND
                ((OR (ATOM #16#) (PROGN (LETT |v2| (CAR #16#) . #17#) NIL))
                 (GO G191)))
               (SEQ (LETT |v3| (QVELT |v2| 0) . #17#)
                    (LETT |obs| (SPADCALL |v3| (QREFELT $ 46)) . #17#)
                    (LETT |obs2| NIL . #17#)
                    (SEQ (LETT |ob| NIL . #17#) (LETT #15# |obs| . #17#) G190
                         (COND
                          ((OR (ATOM #15#)
                               (PROGN (LETT |ob| (CAR #15#) . #17#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |px|
                                (+ (QVELT |ob| 1)
                                   (SPADCALL 4 (QVELT |v2| 1) (QREFELT $ 53)))
                                . #17#)
                          (LETT |py|
                                (+ (QVELT |ob| 2)
                                   (SPADCALL 4 (QVELT |v2| 2) (QREFELT $ 53)))
                                . #17#)
                          (LETT |ob2| (VECTOR (QVELT |ob| 0) |px| |py|) . #17#)
                          (EXIT
                           (LETT |obs2| (SPADCALL |obs2| |ob2| (QREFELT $ 13))
                                 . #17#)))
                         (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |innerValues|
                          (SPADCALL |innerValues| |obs2| (QREFELT $ 54))
                          . #17#)
                    (LETT |ina| (SPADCALL |v3| (QREFELT $ 47)) . #17#)
                    (LETT |innerArrows|
                          (SPADCALL |innerArrows| |ina| (QREFELT $ 56)) . #17#)
                    (LETT |offsets|
                          (SPADCALL |offsets| |offset| (QREFELT $ 57)) . #17#)
                    (EXIT (LETT |offset| (+ |offset| (LENGTH |obs|)) . #17#)))
               (LETT #16# (CDR #16#) . #17#) (GO G190) G191 (EXIT NIL))
          (LETT |iv| |innerValues| . #17#) (LETT |a| NIL . #17#)
          (SEQ (LETT |a2n| 1 . #17#) (LETT #13# (LENGTH |innerArrows|) . #17#)
               (LETT |a2| NIL . #17#) (LETT #12# |innerArrows| . #17#) G190
               (COND
                ((OR (ATOM #12#) (PROGN (LETT |a2| (CAR #12#) . #17#) NIL)
                     (|greater_SI| |a2n| #13#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |a3| NIL . #17#) (LETT #11# |a2| . #17#) G190
                      (COND
                       ((OR (ATOM #11#)
                            (PROGN (LETT |a3| (CAR #11#) . #17#) NIL))
                        (GO G191)))
                      (SEQ (LETT |name2| (QVELT |a3| 0) . #17#)
                           (LETT |arrType2| (QVELT |a3| 1) . #17#)
                           (LETT |fromOb2|
                                 (+ (QVELT |a3| 2)
                                    (SPADCALL |offsets| |a2n| (QREFELT $ 25)))
                                 . #17#)
                           (LETT |toOb2|
                                 (+ (QVELT |a3| 3)
                                    (SPADCALL |offsets| |a2n| (QREFELT $ 25)))
                                 . #17#)
                           (LETT |xOffset2| (QVELT |a3| 4) . #17#)
                           (LETT |yOffset2| (QVELT |a3| 5) . #17#)
                           (LETT |map2| (QVELT |a3| 6) . #17#)
                           (LETT |arr|
                                 (VECTOR |name2| |arrType2| |fromOb2| |toOb2|
                                         |xOffset2| |yOffset2| |map2|)
                                 . #17#)
                           (EXIT
                            (LETT |a| (SPADCALL |a| |arr| (QREFELT $ 26))
                                  . #17#)))
                      (LETT #11# (CDR #11#) . #17#) (GO G190) G191
                      (EXIT NIL))))
               (LETT #12#
                     (PROG1 (CDR #12#) (LETT |a2n| (|inc_SI| |a2n|) . #17#))
                     . #17#)
               (GO G190) G191 (EXIT NIL))
          (LETT |outerArrows| (SPADCALL |n| (QREFELT $ 58)) . #17#)
          (SEQ (LETT |oa3| NIL . #17#) (LETT #10# |outerArrows| . #17#) G190
               (COND
                ((OR (ATOM #10#) (PROGN (LETT |oa3| (CAR #10#) . #17#) NIL))
                 (GO G191)))
               (SEQ (LETT |name3| (QVELT |oa3| 0) . #17#)
                    (LETT |arrType3| (QVELT |oa3| 1) . #17#)
                    (LETT |fromOb3|
                          (+
                           (SPADCALL |offsets| (QVELT |oa3| 2) (QREFELT $ 25))
                           1)
                          . #17#)
                    (LETT |toOb3|
                          (+
                           (SPADCALL |offsets| (QVELT |oa3| 3) (QREFELT $ 25))
                           1)
                          . #17#)
                    (LETT |xOffset3| (QVELT |oa3| 4) . #17#)
                    (LETT |yOffset3| (QVELT |oa3| 5) . #17#)
                    (LETT |map3| (QVELT |oa3| 6) . #17#)
                    (EXIT
                     (SEQ (LETT |starti| 1 . #17#)
                          (LETT #9# (SPADCALL |map3| (QREFELT $ 24)) . #17#)
                          (LETT |endi| NIL . #17#) (LETT #8# |map3| . #17#)
                          G190
                          (COND
                           ((OR (ATOM #8#)
                                (PROGN (LETT |endi| (CAR #8#) . #17#) NIL)
                                (|greater_SI| |starti| #9#))
                            (GO G191)))
                          (SEQ
                           (LETT |fromOb3|
                                 (+
                                  (SPADCALL |offsets| (QVELT |oa3| 2)
                                            (QREFELT $ 25))
                                  |starti|)
                                 . #17#)
                           (LETT |toOb3|
                                 (+
                                  (SPADCALL |offsets| (QVELT |oa3| 3)
                                            (QREFELT $ 25))
                                  |endi|)
                                 . #17#)
                           (LETT |arr|
                                 (VECTOR |name3| |arrType3| |fromOb3| |toOb3|
                                         |xOffset3| |yOffset3| NIL)
                                 . #17#)
                           (EXIT
                            (LETT |a| (SPADCALL |a| |arr| (QREFELT $ 26))
                                  . #17#)))
                          (LETT #8#
                                (PROG1 (CDR #8#)
                                  (LETT |starti| (|inc_SI| |starti|) . #17#))
                                . #17#)
                          (GO G190) G191 (EXIT NIL))))
               (LETT #10# (CDR #10#) . #17#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |iv| |a|))))) 

(PUT '|DGRPH;initial;$;13| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(SDEFUN |DGRPH;initial;$;13| (($ $)) (CONS NIL NIL)) 

(SDEFUN |DGRPH;terminal;S$;14| ((|a| S) ($ $))
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
         (SEQ (LETT |o| (VECTOR |a| 0 0) . #1=(|DGRPH;terminal;S$;14|))
              (LETT |ar| (VECTOR "loop" 0 1 1 0 0 NIL) . #1#)
              (EXIT (CONS (LIST |o|) (LIST |ar|)))))) 

(SDEFUN |DGRPH;cycleOpen;LS$;15|
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
          (|o| #2#) (#3=#:G408 NIL) (|ob| NIL) (#4=#:G409 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #5=(|DGRPH;cycleOpen;LS$;15|))
              (LETT |ars| NIL . #5#) (LETT |arn| 1 . #5#)
              (SEQ (LETT |obn| 1 . #5#) (LETT #4# (LENGTH |objs|) . #5#)
                   (LETT |ob| NIL . #5#) (LETT #3# |objs| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |ob| (CAR #3#) . #5#) NIL)
                         (|greater_SI| |obn| #4#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 10)))
                          . #5#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #5#)
                    (LETT |next| (+ |obn| 1) . #5#)
                    (COND
                     ((EQL (- |next| 1) (LENGTH |objs|))
                      (LETT |next| |obn| . #5#)))
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 63))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |next| 0 0 NIL)
                              . #5#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 26)) . #5#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #5#)))))))
                   (LETT #3#
                         (PROG1 (CDR #3#) (LETT |obn| (|inc_SI| |obn|) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |DGRPH;cycleClosed;LS$;16|
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
          (|o| #2#) (#3=#:G419 NIL) (|ob| NIL) (#4=#:G420 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #5=(|DGRPH;cycleClosed;LS$;16|))
              (LETT |ars| NIL . #5#) (LETT |arn| 1 . #5#)
              (SEQ (LETT |obn| 1 . #5#) (LETT #4# (LENGTH |objs|) . #5#)
                   (LETT |ob| NIL . #5#) (LETT #3# |objs| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |ob| (CAR #3#) . #5#) NIL)
                         (|greater_SI| |obn| #4#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 10)))
                          . #5#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #5#)
                    (LETT |next| (+ |obn| 1) . #5#)
                    (COND
                     ((EQL (- |next| 1) (LENGTH |objs|))
                      (LETT |next| 1 . #5#)))
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 63))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |next| 0 0 NIL)
                              . #5#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 26)) . #5#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #5#)))))))
                   (LETT #3#
                         (PROG1 (CDR #3#) (LETT |obn| (|inc_SI| |obn|) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |DGRPH;unit;LS$;17| ((|objs| |List| S) (|arrowName| |String|) ($ $))
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
          (|o| #2#) (#3=#:G427 NIL) (|ob| NIL) (#4=#:G428 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #5=(|DGRPH;unit;LS$;17|))
              (LETT |ars| NIL . #5#) (LETT |arn| 1 . #5#)
              (SEQ (LETT |obn| 1 . #5#) (LETT #4# (LENGTH |objs|) . #5#)
                   (LETT |ob| NIL . #5#) (LETT #3# |objs| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |ob| (CAR #3#) . #5#) NIL)
                         (|greater_SI| |obn| #4#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 10)))
                          . #5#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #5#)
                    (LETT |a|
                          (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|)) 0
                                  |obn| |obn| 0 0 NIL)
                          . #5#)
                    (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 26)) . #5#)
                    (EXIT (LETT |arn| (+ |arn| 1) . #5#)))
                   (LETT #3#
                         (PROG1 (CDR #3#) (LETT |obn| (|inc_SI| |obn|) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |DGRPH;kgraph;LS$;18| ((|objs| |List| S) (|arrowName| |String|) ($ $))
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
          (|a| #1#) (#2=#:G440 NIL) (|obm| NIL)
          (|obs|
           (|List|
            #3=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #3#) (#4=#:G438 NIL) (|ob| NIL) (#5=#:G439 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #6=(|DGRPH;kgraph;LS$;18|))
              (LETT |ars| NIL . #6#) (LETT |arn| 1 . #6#)
              (SEQ (LETT |obn| 1 . #6#) (LETT #5# (LENGTH |objs|) . #6#)
                   (LETT |ob| NIL . #6#) (LETT #4# |objs| . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |ob| (CAR #4#) . #6#) NIL)
                         (|greater_SI| |obn| #5#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 10)))
                          . #6#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #6#)
                    (EXIT
                     (SEQ (LETT |obm| 1 . #6#) (LETT #2# (LENGTH |objs|) . #6#)
                          G190 (COND ((|greater_SI| |obm| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |obn| |obm| (QREFELT $ 67))
                              (SEQ
                               (LETT |a|
                                     (VECTOR
                                      (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |obm| 0 0 NIL)
                                     . #6#)
                               (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 26))
                                     . #6#)
                               (EXIT (LETT |arn| (+ |arn| 1) . #6#)))))))
                          (LETT |obm| (|inc_SI| |obm|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #4#
                         (PROG1 (CDR #4#) (LETT |obn| (|inc_SI| |obn|) . #6#))
                         . #6#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |DGRPH;+;3$;19| ((|a| $) (|b| $) ($ $))
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
          (|arr| #1#) (#2=#:G448 NIL) (|ba| NIL)
          (|bStart| (|NonNegativeInteger|))
          (|lo|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |lo| (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 54))
                . #3=(|DGRPH;+;3$;19|))
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
                              (QVELT |ba| 5) NIL)
                      . #3#)
                (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 26)) . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 69)) . #3#)
          (EXIT (CONS |lo| |la|))))) 

(SDEFUN |DGRPH;merge;3$;20| ((|a| $) (|b| $) ($ $))
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
          (#3=#:G469 NIL) (|ba| NIL) (|bStart| #4=(|NonNegativeInteger|))
          (|bmap| (|List| (|NonNegativeInteger|))) (#5=#:G457 NIL)
          (|newIndex| #4#)
          (|mergedObjects|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|i| (|Integer|)) (#6=#:G468 NIL) (|bob| NIL) (#7=#:G467 NIL)
          (|x| NIL) (#8=#:G466 NIL))
         (SEQ
          (LETT |bmap|
                (PROGN
                 (LETT #8# NIL . #9=(|DGRPH;merge;3$;20|))
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
               (SEQ (LETT |i| (SPADCALL |bob| (QCAR |a|) (QREFELT $ 71)) . #9#)
                    (EXIT
                     (COND
                      ((< |i| 1)
                       (SEQ
                        (LETT |mergedObjects|
                              (SPADCALL |mergedObjects| |bob| (QREFELT $ 13))
                              . #9#)
                        (LETT |newIndex| (+ |newIndex| 1) . #9#)
                        (EXIT
                         (LETT |bmap|
                               (SPADCALL |bmap| |newIndex| (QREFELT $ 57))
                               . #9#))))
                      ('T
                       (LETT |bmap|
                             (SPADCALL |bmap|
                                       (PROG1 (LETT #5# |i| . #9#)
                                         (|check_subtype2| (>= #5# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #5#))
                                       (QREFELT $ 57))
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
                                (QREFELT $ 25))
                      . #9#)
                (LETT |fromI|
                      (SPADCALL |bmap| (+ (QVELT |ba| 2) |bStart|)
                                (QREFELT $ 25))
                      . #9#)
                (LETT |arr|
                      (VECTOR (QVELT |ba| 0) (QVELT |ba| 1) |fromI| |toI|
                              (QVELT |ba| 4) (QVELT |ba| 5) (QVELT |ba| 6))
                      . #9#)
                (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 26)) . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 69)) . #9#)
          (EXIT (CONS |mergedObjects| |la|))))) 

(SDEFUN |DGRPH;objProd|
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
          (|bxi| #3=(|NonNegativeInteger|)) (|bi| (S)) (#4=#:G480 NIL)
          (|boi| NIL) (|ayi| #2#) (|axi| #3#) (|ai| (S)) (#5=#:G479 NIL)
          (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #6=(|DGRPH;objProd|))
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
                                             (SPADCALL |a| (QREFELT $ 73)))
                                          |axi|)
                                         . #6#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 74)))
                                          |ayi|)
                                         . #6#)
                                   (LETT |widtha| (SPADCALL |a| (QREFELT $ 73))
                                         . #6#)
                                   (LETT |heighta|
                                         (SPADCALL |a| (QREFELT $ 74)) . #6#)
                                   (LETT |sp|
                                         (SPADCALL |ai| |bi| (QREFELT $ 76))
                                         . #6#)
                                   (LETT |ob| (VECTOR |sp| |x| |y|) . #6#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 79))
                                          . #6#)))
                              (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |DGRPH;indexProd|
        ((|aObj| $) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G481 NIL))
               (+ |a|
                  (*
                   (PROG1 (LETT #1# (- |b| 1) |DGRPH;indexProd|)
                     (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #1#))
                   (LENGTH (QCAR |aObj|)))))) 

(SDEFUN |DGRPH;*;2$Dg;23| ((|a| $) (|b| $) ($ |DirectedGraph| (|Product| S S)))
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
          (|arr| #1#) (|an| (|String|)) (#2=#:G503 NIL) (|bv| NIL)
          (#3=#:G502 NIL) (|bu| NIL) (#4=#:G501 NIL) (|av| NIL) (#5=#:G500 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|DGRPH;*;2$Dg;23|))
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
                                                      (QREFELT $ 80))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 80))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          81))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          81)))
                                                      (QREFELT $ 83))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 26))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|DGRPH;objProd| |a| |b| $) |newArrs|
                         (QREFELT $ 85)))))) 

(SDEFUN |DGRPH;cartesian;2$Dg;24|
        ((|a| $) (|b| $) ($ |DirectedGraph| (|Product| S S)))
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
          (|arr| #1#) (|an| (|String|)) (#2=#:G528 NIL) (|bv| NIL)
          (#3=#:G527 NIL) (|bu| NIL) (#4=#:G526 NIL) (|av| NIL) (#5=#:G525 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|DGRPH;cartesian;2$Dg;24|))
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
                                                        (QREFELT $ 80))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            80))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              81))
                                                           #7="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 83)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              81))
                                                           #8="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 83)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            81))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 83))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 26))
                                                      . #6#))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT $ 80))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              80))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        $ 81))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT $ 83)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        $ 81))
                                                             #8#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT $ 83)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              81))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 83))))
                                                       . #6#)
                                                 (LETT |arr|
                                                       (VECTOR |an| 0
                                                               (|DGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                $)
                                                               (|DGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                $)
                                                               0 0 NIL)
                                                       . #6#)
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT $
                                                                           26))
                                                        . #6#))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 80))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            80))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              81))
                                                           #7#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 83)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              81))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 83)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            81))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 83))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 26))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|DGRPH;objProd| |a| |b| $) |newArrs|
                         (QREFELT $ 85)))))) 

(SDEFUN |DGRPH;closedObjProd|
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
          (|x| #3#) (|byi| #2#) (|bxi| #1#) (|bi| (S)) (#4=#:G537 NIL)
          (|boi| NIL) (|ayi| #2#) (|axi| #1#) (|ai| (S)) (#5=#:G536 NIL)
          (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #6=(|DGRPH;closedObjProd|))
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
                                             (SPADCALL |a| (QREFELT $ 73)))
                                          |axi|)
                                         . #6#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 74)))
                                          |ayi|)
                                         . #6#)
                                   (LETT |widtha| (SPADCALL |a| (QREFELT $ 73))
                                         . #6#)
                                   (LETT |heighta|
                                         (SPADCALL |a| (QREFELT $ 74)) . #6#)
                                   (LETT |sp| (SPADCALL |ai| |bi| |f|) . #6#)
                                   (LETT |ob| (VECTOR |sp| |x| |y|) . #6#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 13))
                                          . #6#)))
                              (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |DGRPH;closedTensor;2$M$;26|
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
          (|arr| #1#) (|an| (|String|)) (#2=#:G558 NIL) (|bv| NIL)
          (#3=#:G557 NIL) (|bu| NIL) (#4=#:G556 NIL) (|av| NIL) (#5=#:G555 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|DGRPH;closedTensor;2$M$;26|))
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
                                                      (QREFELT $ 80))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 80))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          81))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          81)))
                                                      (QREFELT $ 83))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 26))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|DGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                         (QREFELT $ 19)))))) 

(SDEFUN |DGRPH;closedCartesian;2$M$;27|
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
          (|arr| #1#) (|an| (|String|)) (#2=#:G584 NIL) (|bv| NIL)
          (#3=#:G583 NIL) (|bu| NIL) (#4=#:G582 NIL) (|av| NIL) (#5=#:G581 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|DGRPH;closedCartesian;2$M$;27|))
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
                                                        (QREFELT $ 80))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            80))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              81))
                                                           #7="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 83)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              81))
                                                           #8="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 83)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            81))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 83))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 26))
                                                      . #6#))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT $ 80))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              80))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        $ 81))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT $ 83)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        $ 81))
                                                             #8#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT $ 83)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              81))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 83))))
                                                       . #6#)
                                                 (LETT |arr|
                                                       (VECTOR |an| 0
                                                               (|DGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                $)
                                                               (|DGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                $)
                                                               0 0 NIL)
                                                       . #6#)
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT $
                                                                           26))
                                                        . #6#))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 80))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            80))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              81))
                                                           #7#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 83)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              81))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 83)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            81))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 83))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 26))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|DGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                         (QREFELT $ 19)))))) 

(SDEFUN |DGRPH;~;2$;28| ((|s| $) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|newArr|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (#1=#:G595 NIL) (|j| NIL) (#2=#:G594 NIL) (|i| NIL)
          (|ars|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |obs| (QCAR |s|) . #3=(|DGRPH;~;2$;28|))
              (LETT |ars| (QCDR |s|) . #3#) (LETT |newArrs| NIL . #3#)
              (SEQ (LETT |i| 1 . #3#) (LETT #2# (LENGTH |obs|) . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #3#) (LETT #1# (LENGTH |obs|) . #3#)
                          G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL (SPADCALL |s| |i| |j| (QREFELT $ 80)))
                              (SEQ
                               (LETT |newArr|
                                     (VECTOR
                                      (STRCONC (STRINGIMAGE |i|)
                                               (STRINGIMAGE |j|))
                                      0 |i| |j| 0 0 NIL)
                                     . #3#)
                               (EXIT
                                (LETT |newArrs|
                                      (SPADCALL |newArrs| |newArr|
                                                (QREFELT $ 26))
                                      . #3#)))))))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |newArrs|))))) 

(SDEFUN |DGRPH;map;$LL2I$;29|
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
          (|newArr| #2#) (#3=#:G612 NIL) (|oldArrow| NIL) (#4=#:G600 NIL)
          (#5=#:G599 NIL) (|i| (|NonNegativeInteger|)) (#6=#:G611 NIL)
          (|oi| NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#7=#:G610 NIL) (|o| NIL) (#8=#:G609 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #8# NIL . #9=(|DGRPH;map;$LL2I$;29|))
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
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 25)) . #9#)
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 92))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 92))
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
                                                      (QREFELT $ 92))
                                            2)
                                           |offsetY|)
                                          . #9#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#)))
                               (QREFELT $ 93))))
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
                                        (QREFELT $ 25))
                              (SPADCALL |m| (QVELT |oldArrow| 3)
                                        (QREFELT $ 25))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6))
                      . #9#)
                (EXIT
                 (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 26))
                       . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(SDEFUN |DGRPH;mapContra;$LL2I$;30|
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
          (|newArr| #2#) (#3=#:G629 NIL) (|oldArrow| NIL) (#4=#:G617 NIL)
          (#5=#:G616 NIL) (|i| (|NonNegativeInteger|)) (#6=#:G628 NIL)
          (|oi| NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#7=#:G627 NIL) (|o| NIL) (#8=#:G626 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #8# NIL . #9=(|DGRPH;mapContra;$LL2I$;30|))
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
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 25)) . #9#)
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 92))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 92))
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
                                                      (QREFELT $ 92))
                                            2)
                                           |offsetY|)
                                          . #9#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#)))
                               (QREFELT $ 93))))
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
                                        (QREFELT $ 25))
                              (SPADCALL |m| (QVELT |oldArrow| 2)
                                        (QREFELT $ 25))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6))
                      . #9#)
                (EXIT
                 (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 26))
                       . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(SDEFUN |DGRPH;coerce;Pg$;31| ((|pg| |PermutationGroup| S) ($ $))
        (SPADCALL (SPADCALL |pg| (QREFELT $ 97)) (QREFELT $ 37))) 

(SDEFUN |DGRPH;coerce;L$;32| ((|lst| |List| S) ($ $))
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
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (#2=#:G637 NIL) (|ob| NIL) (#3=#:G638 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #4=(|DGRPH;coerce;L$;32|))
              (LETT |ars| NIL . #4#) (LETT |arn| 1 . #4#)
              (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |lst|) . #4#)
                   (LETT |ob| NIL . #4#) (LETT #2# |lst| . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |ob| (CAR #2#) . #4#) NIL)
                         (|greater_SI| |obn| #3#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |lst|) |obn| (QREFELT $ 9))
                                  (SPADCALL (LENGTH |lst|) |obn|
                                            (QREFELT $ 10)))
                          . #4#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #4#)
                    (LETT |next| (+ |obn| 1) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |lst|) (QREFELT $ 63))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC "a" (STRINGIMAGE |arn|)) 0 |obn|
                                      |next| 0 0 NIL)
                              . #4#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 26)) . #4#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #4#)))))))
                   (LETT #2#
                         (PROG1 (CDR #2#) (LETT |obn| (|inc_SI| |obn|) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(DECLAIM (NOTINLINE |DirectedGraph;|)) 

(DEFUN |DirectedGraph| (#1=#:G639)
  (SPROG NIL
         (PROG (#2=#:G640)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|DirectedGraph|)
                                               '|domainEqualList|)
                    . #3=(|DirectedGraph|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|DirectedGraph;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|DirectedGraph|)))))))))) 

(DEFUN |DirectedGraph;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|DirectedGraph|))
          (LETT |dv$| (LIST '|DirectedGraph| DV$1) . #1#)
          (LETT $ (GETREFV 110) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|DirectedGraph| (LIST DV$1)
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

(MAKEPROP '|DirectedGraph| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) (0 . |createX|) (6 . |createY|)
              (|Record| (|:| |value| 6) (|:| |posX| 8) (|:| |posY| 8))
              (|List| 11) (12 . |concat|) (|List| 6) |DGRPH;directedGraph;L$;1|
              |DGRPH;directedGraph;L$;2|
              (|Record| (|:| |name| 43) (|:| |arrType| 8) (|:| |fromOb| 8)
                        (|:| |toOb| 8) (|:| |xOffset| 21) (|:| |yOffset| 21)
                        (|:| |map| 20))
              (|List| 17) |DGRPH;directedGraph;LL$;3| (|List| 8) (|Integer|)
              (|List| 20) (18 . |elt|) (24 . |#|) (29 . |elt|) (35 . |concat|)
              |DGRPH;directedGraph;LL$;4|
              (|Record| (|:| |preimage| 14) (|:| |image| 14)) (|Permutation| 6)
              (41 . |listRepresentation|) (46 . |One|) (50 . |position|)
              (56 . |concat|) (62 . |elt|) (68 . |setelt!|) (|List| 29)
              |DGRPH;directedGraph;L$;5| (|Boolean|) (75 . =)
              |DGRPH;addObject!;$S$;6| |DGRPH;addObject!;$R$;7| (81 . =)
              (|String|) |DGRPH;addArrow!;$S2Nni$;8|
              |DGRPH;addArrow!;$S2NniL$;9| |DGRPH;getVertices;$L;10|
              |DGRPH;getArrows;$L;11|
              (|Record| (|:| |value| $$) (|:| |posX| 8) (|:| |posY| 8))
              (|List| 48) (|DirectedGraph| $$) (87 . |getVertices|)
              (|PositiveInteger|) (92 . *) (98 . |concat|) (|List| 18)
              (104 . |concat|) (110 . |concat|) (116 . |getArrows|)
              (|DirectedGraph| $) |DGRPH;flatten;Dg$;12| |DGRPH;initial;$;13|
              |DGRPH;terminal;S$;14| (121 . <=) |DGRPH;cycleOpen;LS$;15|
              |DGRPH;cycleClosed;LS$;16| |DGRPH;unit;LS$;17| (127 . ~=)
              |DGRPH;kgraph;LS$;18| (133 . |concat|) |DGRPH;+;3$;19|
              (139 . |position|) |DGRPH;merge;3$;20| (145 . |diagramWidth|)
              (150 . |diagramHeight|) (|Product| 6 6) (155 . |construct|)
              (|Record| (|:| |value| 75) (|:| |posX| 8) (|:| |posY| 8))
              (|List| 77) (161 . |concat|) (167 . |isDirectSuccessor?|)
              (174 . |arrowName|) (|List| $) (181 . |concat|)
              (|DirectedGraph| 75) (186 . |directedGraph|) |DGRPH;*;2$Dg;23|
              |DGRPH;cartesian;2$Dg;24| (|Mapping| 6 6 6)
              |DGRPH;closedTensor;2$M$;26| |DGRPH;closedCartesian;2$M$;27|
              |DGRPH;~;2$;28| (192 . |elt|) (198 . |setelt!|)
              |DGRPH;map;$LL2I$;29| |DGRPH;mapContra;$LL2I$;30|
              (|PermutationGroup| 6) (205 . |coerce|) |DGRPH;coerce;Pg$;31|
              |DGRPH;coerce;L$;32| (|Void|) (|Scene| (|SCartesian| '2))
              (|Matrix| 21) (|Matrix| 8) (|List| (|Loop|)) (|Tree| 21)
              (|List| 105) (|SingleInteger|) (|OutputForm|) (|HashState|))
           '#(~= 210 ~ 216 |unit| 221 |terminal| 227 |subdiagramSvg| 232
              |spanningTreeNode| 240 |spanningTreeArrow| 246
              |spanningForestNode| 252 |spanningForestArrow| 257 |routeNodes|
              262 |routeArrows| 269 |outDegree| 276 |nodeToNode| 282
              |nodeToArrow| 288 |nodeFromNode| 294 |nodeFromArrow| 300 |min|
              306 |merge| 317 |max| 323 |mapContra| 334 |map| 343 |looseEquals|
              352 |loopsNodes| 358 |loopsAtNode| 363 |loopsArrows| 369 |latex|
              374 |laplacianMatrix| 379 |kgraph| 384 |isGreaterThan?| 390
              |isFunctional?| 397 |isFixPoint?| 402 |isDirected?| 408
              |isDirectSuccessor?| 412 |isAcyclic?| 419 |initial| 424
              |incidenceMatrix| 428 |inDegree| 433 |hashUpdate!| 439 |hash| 445
              |getVertices| 450 |getVertexIndex| 455 |getArrows| 461
              |getArrowIndex| 466 |flatten| 473 |distanceMatrix| 478 |distance|
              483 |directedGraph| 490 |diagramWidth| 517 |diagramSvg| 522
              |diagramHeight| 529 |deepDiagramSvg| 534 |cycleOpen| 541
              |cycleClosed| 547 |createY| 553 |createX| 559 |createWidth| 565
              |coerce| 570 |closedTensor| 590 |closedCartesian| 597 |cartesian|
              604 |arrowsToNode| 610 |arrowsToArrow| 616 |arrowsFromNode| 622
              |arrowsFromArrow| 628 |arrowName| 634 |adjacencyMatrix| 641
              |addObject!| 646 |addArrow!| 658 = 683 + 689 * 695)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|)
                           (|CoercibleTo| 108) (|BasicType|))
                        (|makeByteWordVec2| 109
                                            '(2 0 8 8 8 9 2 0 8 8 8 10 2 12 0 0
                                              11 13 2 22 20 0 21 23 1 20 8 0 24
                                              2 20 8 0 21 25 2 18 0 0 17 26 1
                                              29 28 0 30 0 29 0 31 2 14 21 6 0
                                              32 2 14 0 0 6 33 2 14 6 0 21 34 3
                                              20 8 0 21 8 35 2 12 38 0 0 39 2
                                              18 38 0 0 42 1 50 49 0 51 2 8 0
                                              52 0 53 2 12 0 0 0 54 2 55 0 0 18
                                              56 2 20 0 0 8 57 1 50 18 0 58 2 8
                                              38 0 0 63 2 8 38 0 0 67 2 18 0 0
                                              0 69 2 12 21 11 0 71 1 0 8 0 73 1
                                              0 8 0 74 2 75 0 6 6 76 2 78 0 0
                                              77 79 3 0 38 0 8 8 80 3 0 43 0 8
                                              8 81 1 43 0 82 83 2 84 0 78 18 85
                                              2 12 11 0 21 92 3 12 11 0 21 11
                                              93 1 96 36 0 97 2 0 38 0 0 1 1 0
                                              0 0 91 2 0 0 14 43 66 1 0 0 6 62
                                              4 0 100 101 0 38 38 1 2 0 105 0 8
                                              1 2 0 105 0 8 1 1 0 106 0 1 1 0
                                              106 0 1 3 0 20 0 8 8 1 3 0 20 0 8
                                              8 1 2 0 8 0 8 1 2 0 20 0 8 1 2 0
                                              20 0 8 1 2 0 20 0 8 1 2 0 20 0 8
                                              1 2 0 8 0 20 1 1 0 8 0 1 2 0 0 0
                                              0 72 1 0 8 0 1 2 0 8 0 20 1 5 0 0
                                              0 20 14 21 21 95 5 0 0 0 20 14 21
                                              21 94 2 0 38 0 0 1 1 0 104 0 1 2
                                              0 104 0 8 1 1 0 104 0 1 1 0 43 0
                                              1 1 0 102 0 1 2 0 0 14 43 68 3 0
                                              38 0 8 8 1 1 0 38 0 1 2 0 38 0 8
                                              1 0 0 38 1 3 0 38 0 8 8 80 1 0 38
                                              0 1 0 0 0 61 1 0 102 0 1 2 0 8 0
                                              8 1 2 0 109 109 0 1 1 0 107 0 1 1
                                              0 12 0 46 2 0 8 0 6 1 1 0 18 0 47
                                              3 0 8 0 8 8 1 1 0 0 59 60 1 0 102
                                              0 1 3 0 21 0 8 8 1 1 0 0 36 37 2
                                              0 0 12 18 19 2 0 0 14 22 27 1 0 0
                                              14 15 1 0 0 12 16 1 0 8 0 73 3 0
                                              100 43 0 38 1 1 0 8 0 74 3 0 100
                                              43 0 38 1 2 0 0 14 43 64 2 0 0 14
                                              43 65 2 0 8 8 8 10 2 0 8 8 8 9 1
                                              0 8 8 1 1 0 0 96 98 1 0 0 14 99 1
                                              0 108 0 1 1 0 108 0 1 3 0 0 0 0
                                              88 89 3 0 0 0 0 88 90 2 0 84 0 0
                                              87 2 0 20 0 8 1 2 0 20 0 8 1 2 0
                                              20 0 8 1 2 0 20 0 8 1 3 0 43 0 8
                                              8 81 1 0 103 0 1 2 0 0 0 11 41 2
                                              0 0 0 6 40 4 0 0 0 43 6 6 1 4 0 0
                                              0 43 8 8 44 5 0 0 0 43 8 8 20 45
                                              2 0 38 0 0 1 2 0 0 0 0 70 2 0 84
                                              0 0 86)))))
           '|lookupComplete|)) 
