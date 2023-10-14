
(SDEFUN |MFGRPH;multifunctionGraph;L$;1| ((|ob| |List| S) ($ $))
        (SPROG
         ((|objs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))
                      (|:| |next| (|List| (|NonNegativeInteger|)))
                      (|:| |map| (|List| (|List| (|NonNegativeInteger|)))))))
          (#1=#:G122 NIL) (|x| NIL) (#2=#:G121 NIL))
         (SEQ
          (LETT |objs|
                (PROGN
                 (LETT #2# NIL . #3=(|MFGRPH;multifunctionGraph;L$;1|))
                 (SEQ (LETT |x| NIL . #3#) (LETT #1# |ob| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (VECTOR |x| 0 0 (LIST 1) NIL) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (LIST |objs|))))) 

(PUT '|MFGRPH;multifunctionGraph;L$;2| '|SPADreplace| 'LIST) 

(SDEFUN |MFGRPH;multifunctionGraph;L$;2|
        ((|ob| |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|))
                    (|:| |next| (|List| (|NonNegativeInteger|)))
                    (|:| |map| (|List| (|List| (|NonNegativeInteger|))))))
         ($ $))
        (LIST |ob|)) 

(SDEFUN |MFGRPH;multifunctionGraph;LL$;3|
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
                         (|:| |next| (|List| (|NonNegativeInteger|)))
                         (|:| |map|
                              (|List| (|List| (|NonNegativeInteger|)))))))
          (|fo| #1#) (#2=#:G147 NIL) (|f| NIL) (#3=#:G148 NIL) (|fn| NIL)
          (|too| (|NonNegativeInteger|)) (|fromo| (|NonNegativeInteger|))
          (#4=#:G146 NIL) (|a| NIL) (|arrs| (|List| (|NonNegativeInteger|)))
          (#5=#:G145 NIL) (|x| NIL) (#6=#:G144 NIL))
         (SEQ
          (LETT |arrs|
                (PROGN
                 (LETT #6# NIL . #7=(|MFGRPH;multifunctionGraph;LL$;3|))
                 (SEQ (LETT |x| 1 . #7#) (LETT #5# (LENGTH |ob|) . #7#) G190
                      (COND ((|greater_SI| |x| #5#) (GO G191)))
                      (SEQ (EXIT (LETT #6# (CONS |x| #6#) . #7#)))
                      (LETT |x| (|inc_SI| |x|) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (SEQ (LETT |a| NIL . #7#) (LETT #4# |ar| . #7#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |a| (CAR #4#) . #7#) NIL))
                 (GO G191)))
               (SEQ (LETT |fromo| (QVELT |a| 2) . #7#)
                    (LETT |too| (QVELT |a| 3) . #7#)
                    (EXIT (SPADCALL |arrs| |fromo| |too| (QREFELT $ 16))))
               (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
          (LETT |fobs| NIL . #7#)
          (SEQ (LETT |fn| 1 . #7#) (LETT #3# (LENGTH |ob|) . #7#)
               (LETT |f| NIL . #7#) (LETT #2# |ob| . #7#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #7#) NIL)
                     (|greater_SI| |fn| #3#))
                 (GO G191)))
               (SEQ
                (LETT |fo|
                      (VECTOR (QVELT |f| 0) (QVELT |f| 1) (QVELT |f| 2)
                              (LIST (SPADCALL |arrs| |fn| (QREFELT $ 17))) NIL)
                      . #7#)
                (EXIT
                 (LETT |fobs| (SPADCALL |fobs| |fo| (QREFELT $ 18)) . #7#)))
               (LETT #2# (PROG1 (CDR #2#) (LETT |fn| (|inc_SI| |fn|) . #7#))
                     . #7#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |fobs|))))) 

(SDEFUN |MFGRPH;multifunctionGraph;LL$;4|
        ((|objs| |List| S) (|am| |List| (|List| (|NonNegativeInteger|))) ($ $))
        (SPROG
         ((|fobs|
           (|List|
            #1=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |next| (|List| (|NonNegativeInteger|)))
                         (|:| |map|
                              (|List| (|List| (|NonNegativeInteger|)))))))
          (|fo| #1#) (#2=#:G160 NIL) (|f| NIL) (#3=#:G161 NIL) (|fn| NIL)
          (|obs|
           (|List|
            #4=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #4#) (|ob| (S)) (#5=#:G159 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #6=(|MFGRPH;multifunctionGraph;LL$;4|))
              (SEQ (LETT |obn| 1 . #6#) (LETT #5# (LENGTH |objs|) . #6#) G190
                   (COND ((|greater_SI| |obn| #5#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 24)) . #6#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 25))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 26)))
                          . #6#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 27)) . #6#)))
                   (LETT |obn| (|inc_SI| |obn|) . #6#) (GO G190) G191
                   (EXIT NIL))
              (LETT |fobs| NIL . #6#)
              (SEQ (LETT |fn| 1 . #6#) (LETT #3# (LENGTH |obs|) . #6#)
                   (LETT |f| NIL . #6#) (LETT #2# |obs| . #6#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #6#) NIL)
                         (|greater_SI| |fn| #3#))
                     (GO G191)))
                   (SEQ
                    (LETT |fo|
                          (VECTOR (QVELT |f| 0) (QVELT |f| 1) (QVELT |f| 2)
                                  (SPADCALL |am| |fn| (QREFELT $ 29)) NIL)
                          . #6#)
                    (EXIT
                     (LETT |fobs| (SPADCALL |fobs| |fo| (QREFELT $ 18))
                           . #6#)))
                   (LETT #2#
                         (PROG1 (CDR #2#) (LETT |fn| (|inc_SI| |fn|) . #6#))
                         . #6#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (LIST |fobs|))))) 

(SDEFUN |MFGRPH;multifunctionGraph;L$;5|
        ((|perms| |List| (|Permutation| S)) ($ $))
        (SPROG
         ((|verts|
           (|List|
            #1=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |next| (|List| (|NonNegativeInteger|)))
                         (|:| |map|
                              (|List| (|List| (|NonNegativeInteger|)))))))
          (|o| #1#) (#2=#:G312 NIL) (|vert| NIL) (#3=#:G313 NIL) (|i| NIL)
          (#4=#:G292 NIL) (#5=#:G291 NIL) (|pout| #6=(|Integer|)) (|pin| #6#)
          (#7=#:G311 NIL) (|pt| NIL) (|preim| #8=(|List| S))
          (|im| #9=(|List| S))
          (|lr| (|Record| (|:| |preimage| #8#) (|:| |image| #9#)))
          (#10=#:G309 NIL) (|perm| NIL) (#11=#:G310 NIL) (|pi| NIL)
          (|tab| (|List| (|List| (|NonNegativeInteger|)))) (#12=#:G308 NIL)
          (|a| NIL) (#13=#:G307 NIL) (#14=#:G306 NIL) (|b| NIL)
          (#15=#:G305 NIL) (|obs| (|List| S)) (#16=#:G304 NIL) (|v| NIL)
          (#17=#:G302 NIL) (#18=#:G303 NIL) (|px| NIL))
         (SEQ (LETT |obs| NIL . #19=(|MFGRPH;multifunctionGraph;L$;5|))
              (SEQ (LETT |px| 1 . #19#) (LETT #18# (LENGTH |perms|) . #19#)
                   (LETT |perm| NIL . #19#) (LETT #17# |perms| . #19#) G190
                   (COND
                    ((OR (ATOM #17#)
                         (PROGN (LETT |perm| (CAR #17#) . #19#) NIL)
                         (|greater_SI| |px| #18#))
                     (GO G191)))
                   (SEQ (LETT |lr| (SPADCALL |perm| (QREFELT $ 33)) . #19#)
                        (LETT |im| (QCDR |lr|) . #19#)
                        (LETT |preim| (QCAR |lr|) . #19#)
                        (EXIT
                         (COND ((EQL |px| 1) (LETT |obs| |im| . #19#))
                               ('T
                                (SEQ (LETT |v| NIL . #19#)
                                     (LETT #16# |im| . #19#) G190
                                     (COND
                                      ((OR (ATOM #16#)
                                           (PROGN
                                            (LETT |v| (CAR #16#) . #19#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((< (SPADCALL |v| |obs| (QREFELT $ 35))
                                            1)
                                         (LETT |obs|
                                               (SPADCALL |obs| |v|
                                                         (QREFELT $ 36))
                                               . #19#)))))
                                     (LETT #16# (CDR #16#) . #19#) (GO G190)
                                     G191 (EXIT NIL))))))
                   (LETT #17#
                         (PROG1 (CDR #17#) (LETT |px| (|inc_SI| |px|) . #19#))
                         . #19#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |tab|
                    (PROGN
                     (LETT #15# NIL . #19#)
                     (SEQ (LETT |b| 1 . #19#) (LETT #14# (LENGTH |obs|) . #19#)
                          G190 (COND ((|greater_SI| |b| #14#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #15#
                                  (CONS
                                   (PROGN
                                    (LETT #13# NIL . #19#)
                                    (SEQ (LETT |a| 1 . #19#)
                                         (LETT #12# (LENGTH |perms|) . #19#)
                                         G190
                                         (COND
                                          ((|greater_SI| |a| #12#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #13# (CONS |b| #13#) . #19#)))
                                         (LETT |a| (|inc_SI| |a|) . #19#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #13#))))
                                   #15#)
                                  . #19#)))
                          (LETT |b| (|inc_SI| |b|) . #19#) (GO G190) G191
                          (EXIT (NREVERSE #15#))))
                    . #19#)
              (SEQ (LETT |pi| 1 . #19#) (LETT #11# (LENGTH |perms|) . #19#)
                   (LETT |perm| NIL . #19#) (LETT #10# |perms| . #19#) G190
                   (COND
                    ((OR (ATOM #10#)
                         (PROGN (LETT |perm| (CAR #10#) . #19#) NIL)
                         (|greater_SI| |pi| #11#))
                     (GO G191)))
                   (SEQ (LETT |lr| (SPADCALL |perm| (QREFELT $ 33)) . #19#)
                        (LETT |im| (QCDR |lr|) . #19#)
                        (LETT |preim| (QCAR |lr|) . #19#)
                        (EXIT
                         (SEQ (LETT |pt| 1 . #19#)
                              (LETT #7# (LENGTH |im|) . #19#) G190
                              (COND ((|greater_SI| |pt| #7#) (GO G191)))
                              (SEQ
                               (LETT |pin|
                                     (SPADCALL
                                      (SPADCALL |im| |pt| (QREFELT $ 24)) |obs|
                                      (QREFELT $ 35))
                                     . #19#)
                               (LETT |pout|
                                     (SPADCALL
                                      (SPADCALL |preim| |pt| (QREFELT $ 24))
                                      |obs| (QREFELT $ 35))
                                     . #19#)
                               (EXIT
                                (SPADCALL
                                 (SPADCALL |tab|
                                           (PROG1 (LETT #5# |pin| . #19#)
                                             (|check_subtype2| (>= #5# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #5#))
                                           (QREFELT $ 29))
                                 |pi|
                                 (PROG1 (LETT #4# |pout| . #19#)
                                   (|check_subtype2| (>= #4# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #4#))
                                 (QREFELT $ 16))))
                              (LETT |pt| (|inc_SI| |pt|) . #19#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #10#
                         (PROG1 (CDR #10#) (LETT |pi| (|inc_SI| |pi|) . #19#))
                         . #19#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |verts| NIL . #19#)
              (SEQ (LETT |i| 1 . #19#) (LETT #3# (LENGTH |obs|) . #19#)
                   (LETT |vert| NIL . #19#) (LETT #2# |obs| . #19#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |vert| (CAR #2#) . #19#) NIL)
                         (|greater_SI| |i| #3#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |vert|
                                  (SPADCALL (LENGTH |obs|) |i| (QREFELT $ 25))
                                  (SPADCALL (LENGTH |obs|) |i| (QREFELT $ 26))
                                  (SPADCALL |tab| |i| (QREFELT $ 29)) NIL)
                          . #19#)
                    (EXIT
                     (LETT |verts| (SPADCALL |verts| |o| (QREFELT $ 18))
                           . #19#)))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #19#))
                         . #19#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (LIST |verts|))))) 

(SDEFUN |MFGRPH;addObject!;$S$;6| ((|s| $) (|n| S) ($ $))
        (SPROG
         ((|obj|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))
                     (|:| |next| (|List| (|NonNegativeInteger|)))
                     (|:| |map| (|List| (|List| (|NonNegativeInteger|))))))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))
                      (|:| |next| (|List| (|NonNegativeInteger|)))
                      (|:| |map| (|List| (|List| (|NonNegativeInteger|))))))))
         (SEQ (LETT |obs| (QCAR |s|) . #1=(|MFGRPH;addObject!;$S$;6|))
              (LETT |obj| (VECTOR |n| 0 0 (LIST (LENGTH |obs|)) NIL) . #1#)
              (COND
               ((SPADCALL |obs| NIL (QREFELT $ 40))
                (PROGN (RPLACA |s| (LIST |obj|)) (QCAR |s|)))
               ('T
                (PROGN
                 (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT $ 18)))
                 (QCAR |s|))))
              (EXIT |s|)))) 

(SDEFUN |MFGRPH;addObject!;$R$;7|
        ((|s| $)
         (|n| |Record| (|:| |value| S)
          (|:| |posX| . #1=((|NonNegativeInteger|))) (|:| |posY| . #1#))
         ($ $))
        (SEQ
         (|error|
          "this form of addObject! not supported in multifunctionGraph")
         (EXIT (LIST NIL)))) 

(SDEFUN |MFGRPH;addArrow!;$S2Nni$;8|
        ((|s| $) (|nm| |String|) (|n1| . #1=(|NonNegativeInteger|))
         (|n2| . #1#) ($ $))
        (SEQ
         (SPADCALL (QVELT (SPADCALL (QCAR |s|) |n1| (QREFELT $ 43)) 3) 1 |n2|
                   (QREFELT $ 16))
         (EXIT |s|))) 

(SDEFUN |MFGRPH;getVertices;$L;9|
        ((|s| $)
         ($ |List|
          #1=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                       (|:| |posY| (|NonNegativeInteger|)))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #1#) (#2=#:G334 NIL) (|soj| NIL))
         (SEQ (LETT |res| NIL . #3=(|MFGRPH;getVertices;$L;9|))
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
                     (LETT |res| (SPADCALL |res| |o| (QREFELT $ 27)) . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MFGRPH;getArrows;$L;10|
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
          (|a| #1#) (#2=#:G345 NIL) (|ar| NIL) (#3=#:G346 NIL) (|ai| NIL)
          (|soj|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))
                     (|:| |next| (|List| (|NonNegativeInteger|)))
                     (|:| |map| (|List| (|List| (|NonNegativeInteger|))))))
          (#4=#:G344 NIL) (|sojn| NIL))
         (SEQ (LETT |res| NIL . #5=(|MFGRPH;getArrows;$L;10|))
              (SEQ (LETT |sojn| 1 . #5#) (LETT #4# (LENGTH (QCAR |s|)) . #5#)
                   G190 (COND ((|greater_SI| |sojn| #4#) (GO G191)))
                   (SEQ
                    (LETT |soj| (SPADCALL (QCAR |s|) |sojn| (QREFELT $ 43))
                          . #5#)
                    (EXIT
                     (SEQ (LETT |ai| 1 . #5#)
                          (LETT #3# (SPADCALL (QVELT |soj| 3) (QREFELT $ 47))
                                . #5#)
                          (LETT |ar| NIL . #5#)
                          (LETT #2# (QVELT |soj| 3) . #5#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |ar| (CAR #2#) . #5#) NIL)
                                (|greater_SI| |ai| #3#))
                            (GO G191)))
                          (SEQ
                           (LETT |a|
                                 (VECTOR
                                  (STRCONC (STRINGIMAGE |sojn|)
                                           (STRINGIMAGE |ai|))
                                  0 |sojn| |ar| 0 0 NIL)
                                 . #5#)
                           (EXIT
                            (LETT |res| (SPADCALL |res| |a| (QREFELT $ 48))
                                  . #5#)))
                          (LETT #2#
                                (PROG1 (CDR #2#)
                                  (LETT |ai| (|inc_SI| |ai|) . #5#))
                                . #5#)
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |sojn| (|inc_SI| |sojn|) . #5#) (GO G190) G191
                   (EXIT NIL))
              (EXIT |res|)))) 

(PUT '|MFGRPH;initial;$;11| '|SPADreplace| '(XLAM NIL (LIST NIL))) 

(SDEFUN |MFGRPH;initial;$;11| (($ $)) (LIST NIL)) 

(SDEFUN |MFGRPH;terminal;S$;12| ((|a| S) ($ $))
        (SPROG
         ((|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))
                     (|:| |next| (|List| (|NonNegativeInteger|)))
                     (|:| |map| (|List| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |o| (VECTOR |a| 0 0 (LIST 1) NIL) |MFGRPH;terminal;S$;12|)
              (EXIT (LIST (LIST |o|)))))) 

(SDEFUN |MFGRPH;cycleOpen;LS$;13|
        ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|obs|
           (|List|
            #1=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |next| (|List| (|NonNegativeInteger|)))
                         (|:| |map|
                              (|List| (|List| (|NonNegativeInteger|)))))))
          (|o| #1#) (|n| (|NonNegativeInteger|)) (|ob| (S)) (#2=#:G359 NIL)
          (|obn| NIL))
         (SEQ (LETT |obs| NIL . #3=(|MFGRPH;cycleOpen;LS$;13|))
              (SEQ (LETT |obn| 1 . #3#) (LETT #2# (LENGTH |objs|) . #3#) G190
                   (COND ((|greater_SI| |obn| #2#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 24)) . #3#)
                    (LETT |n| (+ |obn| 1) . #3#)
                    (COND
                     ((EQL |obn| (LENGTH |objs|))
                      (LETT |n| (LENGTH |objs|) . #3#)))
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 25))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 26))
                                  (LIST |n|) NIL)
                          . #3#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 18)) . #3#)))
                   (LETT |obn| (|inc_SI| |obn|) . #3#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (LIST |obs|))))) 

(SDEFUN |MFGRPH;cycleClosed;LS$;14|
        ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|obs|
           (|List|
            #1=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |next| (|List| (|NonNegativeInteger|)))
                         (|:| |map|
                              (|List| (|List| (|NonNegativeInteger|)))))))
          (|o| #1#) (|n| (|NonNegativeInteger|)) (|ob| (S)) (#2=#:G367 NIL)
          (|obn| NIL))
         (SEQ (LETT |obs| NIL . #3=(|MFGRPH;cycleClosed;LS$;14|))
              (SEQ (LETT |obn| 1 . #3#) (LETT #2# (LENGTH |objs|) . #3#) G190
                   (COND ((|greater_SI| |obn| #2#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 24)) . #3#)
                    (LETT |n| (+ |obn| 1) . #3#)
                    (COND ((EQL |obn| (LENGTH |objs|)) (LETT |n| 1 . #3#)))
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 25))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 26))
                                  (LIST |n|) NIL)
                          . #3#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 18)) . #3#)))
                   (LETT |obn| (|inc_SI| |obn|) . #3#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (LIST |obs|))))) 

(SDEFUN |MFGRPH;unit;LS$;15| ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG ((#1=#:G373 NIL) (|x| NIL) (#2=#:G372 NIL))
               (SEQ
                (LETT |objs|
                      (PROGN
                       (LETT #2# NIL . #3=(|MFGRPH;unit;LS$;15|))
                       (SEQ (LETT |x| 1 . #3#) (LETT #1# (LENGTH |objs|) . #3#)
                            G190 (COND ((|greater_SI| |x| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (VECTOR
                                      (SPADCALL |objs| |x| (QREFELT $ 24)) 0 0
                                      (LIST |x|) NIL)
                                     #2#)
                                    . #3#)))
                            (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      . #3#)
                (EXIT (LIST |objs|))))) 

(SDEFUN |MFGRPH;kgraph;LS$;16| ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SEQ (|error| "kgraph not valid in function graph") (EXIT (LIST NIL)))) 

(SDEFUN |MFGRPH;+;3$;17| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|c|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))
                      (|:| |next| (|List| (|NonNegativeInteger|)))
                      (|:| |map| (|List| (|List| (|NonNegativeInteger|)))))))
          (#1=#:G385 NIL) (|x| NIL) (#2=#:G384 NIL)
          (|objs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))
                      (|:| |next| (|List| (|NonNegativeInteger|)))
                      (|:| |map| (|List| (|List| (|NonNegativeInteger|))))))))
         (SEQ (LETT |objs| (QCAR |b|) . #3=(|MFGRPH;+;3$;17|))
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
                                    (QVELT (SPADCALL |objs| |x| (QREFELT $ 43))
                                           0)
                                    (QVELT (SPADCALL |objs| |x| (QREFELT $ 43))
                                           1)
                                    (QVELT (SPADCALL |objs| |x| (QREFELT $ 43))
                                           2)
                                    (LIST (+ |x| (LENGTH (QCAR |a|)))) NIL)
                                   #2#)
                                  . #3#)))
                          (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (EXIT (LIST (SPADCALL (QCAR |a|) |c| (QREFELT $ 56))))))) 

(SDEFUN |MFGRPH;merge;3$;18| ((|a| $) (|b| $) ($ $))
        (SEQ (|error| "merge not valid in function graph") (EXIT (LIST NIL)))) 

(SDEFUN |MFGRPH;indexProd|
        ((|aObj| $) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G389 NIL))
               (+ |a|
                  (*
                   (PROG1 (LETT #1# (- |b| 1) |MFGRPH;indexProd|)
                     (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #1#))
                   (LENGTH (QCAR |aObj|)))))) 

(SDEFUN |MFGRPH;tensorNext|
        ((|aObj| $) (|a| |List| (|NonNegativeInteger|))
         (|b| |List| (|NonNegativeInteger|)) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|))) (|x| (|NonNegativeInteger|))
          (#1=#:G401 NIL) (|j| NIL) (#2=#:G400 NIL) (|i| NIL))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |a| (QREFELT $ 47))
                      (SPADCALL |b| (QREFELT $ 47)) (QREFELT $ 59))
            (|error|
             (SPADCALL
              (LIST "tensor product with different degree a="
                    (|mathObject2String| |a|) " b=" (|mathObject2String| |b|))
              (QREFELT $ 61)))))
          (LETT |res| NIL . #3=(|MFGRPH;tensorNext|))
          (SEQ (LETT |i| 1 . #3#)
               (LETT #2# (SPADCALL |a| (QREFELT $ 47)) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #3#)
                      (LETT #1# (SPADCALL |b| (QREFELT $ 47)) . #3#) G190
                      (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ
                       (LETT |x|
                             (|MFGRPH;indexProd| |aObj|
                              (SPADCALL |a| |i| (QREFELT $ 17))
                              (SPADCALL |b| |j| (QREFELT $ 17)) $)
                             . #3#)
                       (EXIT
                        (LETT |res| (SPADCALL |res| |x| (QREFELT $ 62))
                              . #3#)))
                      (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |MFGRPH;cartesianNext|
        ((|aObj| $) (|a| |List| (|NonNegativeInteger|))
         (|b| |List| (|NonNegativeInteger|)) (|an| |NonNegativeInteger|)
         (|bn| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|)))
          (|y| #1=(|NonNegativeInteger|)) (|x| #1#) (#2=#:G408 NIL) (|i| NIL))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |a| (QREFELT $ 47))
                      (SPADCALL |b| (QREFELT $ 47)) (QREFELT $ 59))
            (|error|
             (SPADCALL
              (LIST "Cartesian product with different degree a="
                    (|mathObject2String| |a|) " b=" (|mathObject2String| |b|))
              (QREFELT $ 61)))))
          (LETT |res| NIL . #3=(|MFGRPH;cartesianNext|))
          (SEQ (LETT |i| 1 . #3#)
               (LETT #2# (SPADCALL |a| (QREFELT $ 47)) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (LETT |x|
                      (|MFGRPH;indexProd| |aObj|
                       (SPADCALL |a| |i| (QREFELT $ 17)) |bn| $)
                      . #3#)
                (LETT |res| (SPADCALL |res| |x| (QREFELT $ 62)) . #3#)
                (LETT |y|
                      (|MFGRPH;indexProd| |aObj| |an|
                       (SPADCALL |b| |i| (QREFELT $ 17)) $)
                      . #3#)
                (EXIT (LETT |res| (SPADCALL |res| |y| (QREFELT $ 62)) . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |MFGRPH;*;2$Mg;22|
        ((|a| $) (|b| $) ($ |MultifunctionGraph| (|Product| S S)))
        (SPROG
         ((|newObjs|
           (|List|
            #1=(|Record| (|:| |value| (|Product| S S))
                         (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |next| (|List| (|NonNegativeInteger|)))
                         (|:| |map|
                              (|List| (|List| (|NonNegativeInteger|)))))))
          (|ob| #1#) (|sp| (|Product| S S))
          (|nextA| (|List| (|NonNegativeInteger|)))
          (|y| #2=(|NonNegativeInteger|)) (|x| #2#)
          (|bni| #3=(|List| (|NonNegativeInteger|)))
          (|byi| #4=(|NonNegativeInteger|)) (|bxi| #5=(|NonNegativeInteger|))
          (|bi| (S)) (#6=#:G419 NIL) (|boi| NIL) (|ani| #3#) (|ayi| #4#)
          (|axi| #5#) (|ai| (S)) (#7=#:G418 NIL) (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #8=(|MFGRPH;*;2$Mg;22|))
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
                                             (SPADCALL |a| (QREFELT $ 63)))
                                          |axi|)
                                         . #8#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 64)))
                                          |ayi|)
                                         . #8#)
                                   (LETT |nextA|
                                         (|MFGRPH;tensorNext| |b| |bni| |ani|
                                          $)
                                         . #8#)
                                   (LETT |sp|
                                         (SPADCALL |ai| |bi| (QREFELT $ 66))
                                         . #8#)
                                   (LETT |ob| (VECTOR |sp| |x| |y| |nextA| NIL)
                                         . #8#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 69))
                                          . #8#)))
                              (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |newObjs| (QREFELT $ 71)))))) 

(SDEFUN |MFGRPH;cartesian;2$Mg;23|
        ((|a| $) (|b| $) ($ |MultifunctionGraph| (|Product| S S)))
        (SPROG
         ((|newObjs|
           (|List|
            #1=(|Record| (|:| |value| (|Product| S S))
                         (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |next| (|List| (|NonNegativeInteger|)))
                         (|:| |map|
                              (|List| (|List| (|NonNegativeInteger|)))))))
          (|ob| #1#) (|sp| (|Product| S S))
          (|nextA| (|List| (|NonNegativeInteger|)))
          (|y| #2=(|NonNegativeInteger|)) (|x| #2#)
          (|bni| #3=(|List| (|NonNegativeInteger|)))
          (|byi| #4=(|NonNegativeInteger|)) (|bxi| #5=(|NonNegativeInteger|))
          (|bi| (S)) (#6=#:G432 NIL) (|bptr| NIL) (#7=#:G433 NIL) (|boi| NIL)
          (|ani| #3#) (|ayi| #4#) (|axi| #5#) (|ai| (S)) (#8=#:G430 NIL)
          (|aptr| NIL) (#9=#:G431 NIL) (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #10=(|MFGRPH;cartesian;2$Mg;23|))
              (SEQ (LETT |aoi| NIL . #10#) (LETT #9# (QCAR |a|) . #10#)
                   (LETT |aptr| 1 . #10#) (LETT #8# (LENGTH (QCAR |a|)) . #10#)
                   G190
                   (COND
                    ((OR (|greater_SI| |aptr| #8#) (ATOM #9#)
                         (PROGN (LETT |aoi| (CAR #9#) . #10#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ai| (QVELT |aoi| 0) . #10#)
                        (LETT |axi| (QVELT |aoi| 1) . #10#)
                        (LETT |ayi| (QVELT |aoi| 2) . #10#)
                        (LETT |ani| (QVELT |aoi| 3) . #10#)
                        (EXIT
                         (SEQ (LETT |boi| NIL . #10#)
                              (LETT #7# (QCAR |b|) . #10#)
                              (LETT |bptr| 1 . #10#)
                              (LETT #6# (LENGTH (QCAR |a|)) . #10#) G190
                              (COND
                               ((OR (|greater_SI| |bptr| #6#) (ATOM #7#)
                                    (PROGN (LETT |boi| (CAR #7#) . #10#) NIL))
                                (GO G191)))
                              (SEQ (LETT |bi| (QVELT |boi| 0) . #10#)
                                   (LETT |bxi| (QVELT |boi| 1) . #10#)
                                   (LETT |byi| (QVELT |boi| 2) . #10#)
                                   (LETT |bni| (QVELT |boi| 3) . #10#)
                                   (LETT |x|
                                         (+
                                          (* |bxi|
                                             (SPADCALL |a| (QREFELT $ 63)))
                                          |axi|)
                                         . #10#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 64)))
                                          |ayi|)
                                         . #10#)
                                   (LETT |nextA|
                                         (|MFGRPH;cartesianNext| |b| |bni|
                                          |ani| |bptr| |aptr| $)
                                         . #10#)
                                   (LETT |sp|
                                         (SPADCALL |ai| |bi| (QREFELT $ 66))
                                         . #10#)
                                   (LETT |ob| (VECTOR |sp| |x| |y| |nextA| NIL)
                                         . #10#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 69))
                                          . #10#)))
                              (LETT |bptr|
                                    (PROG1 (|inc_SI| |bptr|)
                                      (LETT #7# (CDR #7#) . #10#))
                                    . #10#)
                              (GO G190) G191 (EXIT NIL))))
                   (LETT |aptr|
                         (PROG1 (|inc_SI| |aptr|) (LETT #9# (CDR #9#) . #10#))
                         . #10#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |newObjs| (QREFELT $ 71)))))) 

(SDEFUN |MFGRPH;closedTensor;2$M$;24|
        ((|a| $) (|b| $) (|f| |Mapping| S S S) ($ $))
        (SPROG
         ((|newObjs|
           (|List|
            #1=(|Record| (|:| |value| S) (|:| |posX| #2=(|NonNegativeInteger|))
                         (|:| |posY| #3=(|NonNegativeInteger|))
                         (|:| |next| #4=(|List| (|NonNegativeInteger|)))
                         (|:| |map|
                              (|List| (|List| (|NonNegativeInteger|)))))))
          (|ob| #1#) (|sp| (S)) (|nextA| (|List| (|NonNegativeInteger|)))
          (|y| #5=(|NonNegativeInteger|)) (|x| #5#) (|bni| #4#) (|byi| #3#)
          (|bxi| #2#) (|bi| (S)) (#6=#:G443 NIL) (|boi| NIL) (|ani| #4#)
          (|ayi| #3#) (|axi| #2#) (|ai| (S)) (#7=#:G442 NIL) (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #8=(|MFGRPH;closedTensor;2$M$;24|))
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
                                             (SPADCALL |a| (QREFELT $ 63)))
                                          |axi|)
                                         . #8#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 64)))
                                          |ayi|)
                                         . #8#)
                                   (LETT |nextA|
                                         (|MFGRPH;tensorNext| |b| |bni| |ani|
                                          $)
                                         . #8#)
                                   (LETT |sp| (SPADCALL |ai| |bi| |f|) . #8#)
                                   (LETT |ob| (VECTOR |sp| |x| |y| |nextA| NIL)
                                         . #8#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 18))
                                          . #8#)))
                              (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |newObjs| (QREFELT $ 12)))))) 

(SDEFUN |MFGRPH;closedCartesian;2$M$;25|
        ((|a| $) (|b| $) (|f| |Mapping| S S S) ($ $))
        (SPROG
         ((|newObjs|
           (|List|
            #1=(|Record| (|:| |value| S) (|:| |posX| #2=(|NonNegativeInteger|))
                         (|:| |posY| #3=(|NonNegativeInteger|))
                         (|:| |next| #4=(|List| (|NonNegativeInteger|)))
                         (|:| |map|
                              (|List| (|List| (|NonNegativeInteger|)))))))
          (|ob| #1#) (|sp| (S)) (|nextA| (|List| (|NonNegativeInteger|)))
          (|y| #5=(|NonNegativeInteger|)) (|x| #5#) (|bni| #4#) (|byi| #3#)
          (|bxi| #2#) (|bi| (S)) (#6=#:G455 NIL) (|bptr| NIL) (#7=#:G456 NIL)
          (|boi| NIL) (|ani| #4#) (|ayi| #3#) (|axi| #2#) (|ai| (S))
          (#8=#:G453 NIL) (|aptr| NIL) (#9=#:G454 NIL) (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #10=(|MFGRPH;closedCartesian;2$M$;25|))
              (SEQ (LETT |aoi| NIL . #10#) (LETT #9# (QCAR |a|) . #10#)
                   (LETT |aptr| 1 . #10#) (LETT #8# (LENGTH (QCAR |a|)) . #10#)
                   G190
                   (COND
                    ((OR (|greater_SI| |aptr| #8#) (ATOM #9#)
                         (PROGN (LETT |aoi| (CAR #9#) . #10#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ai| (QVELT |aoi| 0) . #10#)
                        (LETT |axi| (QVELT |aoi| 1) . #10#)
                        (LETT |ayi| (QVELT |aoi| 2) . #10#)
                        (LETT |ani| (QVELT |aoi| 3) . #10#)
                        (EXIT
                         (SEQ (LETT |boi| NIL . #10#)
                              (LETT #7# (QCAR |b|) . #10#)
                              (LETT |bptr| 1 . #10#)
                              (LETT #6# (LENGTH (QCAR |a|)) . #10#) G190
                              (COND
                               ((OR (|greater_SI| |bptr| #6#) (ATOM #7#)
                                    (PROGN (LETT |boi| (CAR #7#) . #10#) NIL))
                                (GO G191)))
                              (SEQ (LETT |bi| (QVELT |boi| 0) . #10#)
                                   (LETT |bxi| (QVELT |boi| 1) . #10#)
                                   (LETT |byi| (QVELT |boi| 2) . #10#)
                                   (LETT |bni| (QVELT |boi| 3) . #10#)
                                   (LETT |x|
                                         (+
                                          (* |bxi|
                                             (SPADCALL |a| (QREFELT $ 63)))
                                          |axi|)
                                         . #10#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 64)))
                                          |ayi|)
                                         . #10#)
                                   (LETT |nextA|
                                         (|MFGRPH;cartesianNext| |b| |bni|
                                          |ani| |bptr| |aptr| $)
                                         . #10#)
                                   (LETT |sp| (SPADCALL |ai| |bi| |f|) . #10#)
                                   (LETT |ob| (VECTOR |sp| |x| |y| |nextA| NIL)
                                         . #10#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 18))
                                          . #10#)))
                              (LETT |bptr|
                                    (PROG1 (|inc_SI| |bptr|)
                                      (LETT #7# (CDR #7#) . #10#))
                                    . #10#)
                              (GO G190) G191 (EXIT NIL))))
                   (LETT |aptr|
                         (PROG1 (|inc_SI| |aptr|) (LETT #9# (CDR #9#) . #10#))
                         . #10#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |newObjs| (QREFELT $ 12)))))) 

(SDEFUN |MFGRPH;~;2$;26| ((|s| $) ($ $))
        (SPROG
         ((|newObjs|
           (|List|
            #1=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |next| (|List| (|NonNegativeInteger|)))
                         (|:| |map|
                              (|List| (|List| (|NonNegativeInteger|)))))))
          (|ob| #1#) (|nextA| (|List| (|NonNegativeInteger|))) (#2=#:G467 NIL)
          (|x| NIL) (#3=#:G466 NIL) (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #4=(|MFGRPH;~;2$;26|))
              (SEQ (LETT |aoi| NIL . #4#) (LETT #3# (QCAR |s|) . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |aoi| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |nextA| NIL . #4#)
                        (SEQ (LETT |x| 1 . #4#)
                             (LETT #2# (LENGTH (QCAR |s|)) . #4#) G190
                             (COND ((|greater_SI| |x| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((EQL
                                  (SPADCALL |x| (QVELT |aoi| 3) (QREFELT $ 77))
                                  0)
                                 (LETT |nextA|
                                       (SPADCALL |nextA| |x| (QREFELT $ 62))
                                       . #4#)))))
                             (LETT |x| (|inc_SI| |x|) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |ob|
                              (VECTOR (QVELT |aoi| 0) (QVELT |aoi| 1)
                                      (QVELT |aoi| 2) |nextA| NIL)
                              . #4#)
                        (EXIT
                         (LETT |newObjs|
                               (SPADCALL |newObjs| |ob| (QREFELT $ 18))
                               . #4#)))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (LIST |newObjs|))))) 

(SDEFUN |MFGRPH;map;$LL2I$;27|
        ((|s| $) (|m| |List| (|NonNegativeInteger|)) (|newOb| |List| S)
         (|offsetX| . #1=(|Integer|)) (|offsetY| . #1#) ($ $))
        (SPROG
         ((|nv|
           #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                        (|:| |posY| (|NonNegativeInteger|))
                        (|:| |next| (|List| (|NonNegativeInteger|)))
                        (|:| |map| (|List| (|List| (|NonNegativeInteger|))))))
          (|newNext| (|List| (|NonNegativeInteger|))) (#3=#:G483 NIL) (|n| NIL)
          (|newY| (|NonNegativeInteger|)) (#4=#:G473 NIL)
          (|newX| (|NonNegativeInteger|)) (#5=#:G472 NIL) (|newObj| (S))
          (|i| (|NonNegativeInteger|))
          (|oldObj|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))
                     (|:| |next| (|List| (|NonNegativeInteger|)))
                     (|:| |map| (|List| (|List| (|NonNegativeInteger|))))))
          (#6=#:G482 NIL) (|oi| NIL)
          (|oldObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))
                      (|:| |next| (|List| (|NonNegativeInteger|)))
                      (|:| |map| (|List| (|List| (|NonNegativeInteger|)))))))
          (|newObjs| (|List| #2#)) (#7=#:G481 NIL) (|o| NIL) (#8=#:G480 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #8# NIL . #9=(|MFGRPH;map;$LL2I$;27|))
                 (SEQ (LETT |o| NIL . #9#) (LETT #7# |newOb| . #9#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |o| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8# (CONS (VECTOR |o| 0 0 NIL NIL) #8#) . #9#)))
                      (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (LETT |oldObjs| (QCAR |s|) . #9#)
          (SEQ (LETT |oi| 1 . #9#) (LETT #6# (LENGTH |oldObjs|) . #9#) G190
               (COND ((|greater_SI| |oi| #6#) (GO G191)))
               (SEQ
                (LETT |oldObj| (SPADCALL |oldObjs| |oi| (QREFELT $ 43)) . #9#)
                (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 17)) . #9#)
                (LETT |newObj| (SPADCALL |newOb| |i| (QREFELT $ 24)) . #9#)
                (LETT |newX|
                      (PROG1 (LETT #5# (+ (QVELT |oldObj| 1) |offsetX|) . #9#)
                        (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #5#))
                      . #9#)
                (LETT |newY|
                      (PROG1 (LETT #4# (+ (QVELT |oldObj| 2) |offsetY|) . #9#)
                        (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #4#))
                      . #9#)
                (LETT |newNext| NIL . #9#)
                (SEQ (LETT |n| NIL . #9#) (LETT #3# (QVELT |oldObj| 3) . #9#)
                     G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |n| (CAR #3#) . #9#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |newNext|
                             (SPADCALL |newNext|
                                       (SPADCALL |m| |n| (QREFELT $ 17))
                                       (QREFELT $ 62))
                             . #9#)))
                     (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
                (LETT |nv| (VECTOR |newObj| |newX| |newY| |newNext| NIL) . #9#)
                (EXIT (SPADCALL |newObjs| |i| |nv| (QREFELT $ 79))))
               (LETT |oi| (|inc_SI| |oi|) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |newObjs|))))) 

(SDEFUN |MFGRPH;mapContra;$LL2I$;28|
        ((|s| $) (|m| |List| (|NonNegativeInteger|)) (|newOb| |List| S)
         (|offsetX| . #1=(|Integer|)) (|offsetY| . #1#) ($ $))
        (SPROG
         ((|nv|
           #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                        (|:| |posY| (|NonNegativeInteger|))
                        (|:| |next| (|List| (|NonNegativeInteger|)))
                        (|:| |map| (|List| (|List| (|NonNegativeInteger|))))))
          (|newNext| (|List| (|NonNegativeInteger|)))
          (|incoming| (|List| (|NonNegativeInteger|))) (#3=#:G500 NIL)
          (|n| NIL) (|newY| (|NonNegativeInteger|)) (#4=#:G489 NIL)
          (|newX| (|NonNegativeInteger|)) (#5=#:G488 NIL) (|newObj| (S))
          (|i| (|NonNegativeInteger|))
          (|oldObj|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))
                     (|:| |next| (|List| (|NonNegativeInteger|)))
                     (|:| |map| (|List| (|List| (|NonNegativeInteger|))))))
          (#6=#:G499 NIL) (|oi| NIL)
          (|oldObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))
                      (|:| |next| (|List| (|NonNegativeInteger|)))
                      (|:| |map| (|List| (|List| (|NonNegativeInteger|)))))))
          (|newObjs| (|List| #2#)) (#7=#:G498 NIL) (|o| NIL) (#8=#:G497 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #8# NIL . #9=(|MFGRPH;mapContra;$LL2I$;28|))
                 (SEQ (LETT |o| NIL . #9#) (LETT #7# |newOb| . #9#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |o| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8# (CONS (VECTOR |o| 0 0 NIL NIL) #8#) . #9#)))
                      (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (LETT |oldObjs| (QCAR |s|) . #9#)
          (SEQ (LETT |oi| 1 . #9#) (LETT #6# (LENGTH |oldObjs|) . #9#) G190
               (COND ((|greater_SI| |oi| #6#) (GO G191)))
               (SEQ
                (LETT |oldObj| (SPADCALL |oldObjs| |oi| (QREFELT $ 43)) . #9#)
                (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 17)) . #9#)
                (LETT |newObj| (SPADCALL |newOb| |i| (QREFELT $ 24)) . #9#)
                (LETT |newX|
                      (PROG1 (LETT #5# (+ (QVELT |oldObj| 1) |offsetX|) . #9#)
                        (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #5#))
                      . #9#)
                (LETT |newY|
                      (PROG1 (LETT #4# (+ (QVELT |oldObj| 2) |offsetY|) . #9#)
                        (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #4#))
                      . #9#)
                (LETT |newNext| NIL . #9#)
                (SEQ (LETT |n| NIL . #9#) (LETT #3# (QVELT |oldObj| 3) . #9#)
                     G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |n| (CAR #3#) . #9#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |incoming|
                            (SPADCALL |s| (SPADCALL |m| |n| (QREFELT $ 17))
                                      (QREFELT $ 81))
                            . #9#)
                      (EXIT
                       (LETT |newNext|
                             (SPADCALL |newNext| |incoming| (QREFELT $ 82))
                             . #9#)))
                     (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
                (LETT |nv| (VECTOR |newObj| |newX| |newY| |newNext| NIL) . #9#)
                (EXIT (SPADCALL |newObjs| |i| |nv| (QREFELT $ 79))))
               (LETT |oi| (|inc_SI| |oi|) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |newObjs|))))) 

(SDEFUN |MFGRPH;coAdjoint;$LU;29|
        ((|s| $) (|m| |List| (|NonNegativeInteger|))
         ($ |Union| (|List| (|NonNegativeInteger|)) "failed"))
        (SPROG
         ((|entry| (|NonNegativeInteger|)) (#1=#:G518 NIL)
          (|x| (|NonNegativeInteger|)) (#2=#:G525 NIL) (|ri| NIL)
          (#3=#:G524 NIL) (|mi| NIL)
          (|retOpt| (|List| (|List| (|NonNegativeInteger|)))) (#4=#:G523 NIL)
          (#5=#:G522 NIL) (|ret| (|List| (|NonNegativeInteger|)))
          (#6=#:G521 NIL) (#7=#:G520 NIL)
          (|codomainSize| (|NonNegativeInteger|)) (#8=#:G519 NIL)
          (|domainSize| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |domainSize| (LENGTH (QCAR |s|))
                  . #9=(|MFGRPH;coAdjoint;$LU;29|))
            (LETT |codomainSize| 0 . #9#)
            (SEQ (LETT |mi| NIL . #9#) (LETT #8# |m| . #9#) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |mi| (CAR #8#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |mi| |codomainSize| (QREFELT $ 84))
                     (LETT |codomainSize| |mi| . #9#)))))
                 (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
            (LETT |ret|
                  (PROGN
                   (LETT #7# NIL . #9#)
                   (SEQ (LETT |x| 1 . #9#) (LETT #6# |codomainSize| . #9#) G190
                        (COND ((|greater_SI| |x| #6#) (GO G191)))
                        (SEQ (EXIT (LETT #7# (CONS 0 #7#) . #9#)))
                        (LETT |x| (|inc_SI| |x|) . #9#) (GO G190) G191
                        (EXIT (NREVERSE #7#))))
                  . #9#)
            (LETT |retOpt|
                  (PROGN
                   (LETT #5# NIL . #9#)
                   (SEQ (LETT |x| 1 . #9#) (LETT #4# |codomainSize| . #9#) G190
                        (COND ((|greater_SI| |x| #4#) (GO G191)))
                        (SEQ (EXIT (LETT #5# (CONS NIL #5#) . #9#)))
                        (LETT |x| (|inc_SI| |x|) . #9#) (GO G190) G191
                        (EXIT (NREVERSE #5#))))
                  . #9#)
            (SEQ (LETT |mi| 1 . #9#)
                 (LETT #3# (SPADCALL |m| (QREFELT $ 47)) . #9#) G190
                 (COND ((|greater_SI| |mi| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SPADCALL |retOpt| (SPADCALL |m| |mi| (QREFELT $ 17))
                             (SPADCALL
                              (SPADCALL |retOpt|
                                        (SPADCALL |m| |mi| (QREFELT $ 17))
                                        (QREFELT $ 29))
                              |mi| (QREFELT $ 62))
                             (QREFELT $ 85))))
                 (LETT |mi| (|inc_SI| |mi|) . #9#) (GO G190) G191 (EXIT NIL))
            (LETT |entry| 1 . #9#)
            (SEQ (LETT |ri| NIL . #9#) (LETT #2# |retOpt| . #9#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |ri| (CAR #2#) . #9#) NIL))
                   (GO G191)))
                 (SEQ (LETT |x| (SPADCALL |s| |ri| (QREFELT $ 86)) . #9#)
                      (COND
                       ((EQL |x| 0)
                        (PROGN
                         (LETT #1# (CONS 1 "failed") . #9#)
                         (GO #10=#:G517))))
                      (SPADCALL |ret| |entry| |x| (QREFELT $ 16))
                      (EXIT (LETT |entry| (+ |entry| 1) . #9#)))
                 (LETT #2# (CDR #2#) . #9#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |ret|))))
          #10# (EXIT #1#)))) 

(SDEFUN |MFGRPH;contraAdjoint;$LU;30|
        ((|s| $) (|m| |List| (|NonNegativeInteger|))
         ($ |Union| (|List| (|NonNegativeInteger|)) "failed"))
        (SPROG
         ((|entry| (|NonNegativeInteger|)) (#1=#:G540 NIL)
          (|x| (|NonNegativeInteger|)) (#2=#:G547 NIL) (|ri| NIL)
          (#3=#:G546 NIL) (|mi| NIL)
          (|retOpt| (|List| (|List| (|NonNegativeInteger|)))) (#4=#:G545 NIL)
          (#5=#:G544 NIL) (|ret| (|List| (|NonNegativeInteger|)))
          (#6=#:G543 NIL) (#7=#:G542 NIL)
          (|codomainSize| (|NonNegativeInteger|)) (#8=#:G541 NIL)
          (|domainSize| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |domainSize| (LENGTH (QCAR |s|))
                  . #9=(|MFGRPH;contraAdjoint;$LU;30|))
            (LETT |codomainSize| 0 . #9#)
            (SEQ (LETT |mi| NIL . #9#) (LETT #8# |m| . #9#) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |mi| (CAR #8#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |mi| |codomainSize| (QREFELT $ 84))
                     (LETT |codomainSize| |mi| . #9#)))))
                 (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
            (LETT |ret|
                  (PROGN
                   (LETT #7# NIL . #9#)
                   (SEQ (LETT |x| 1 . #9#) (LETT #6# |codomainSize| . #9#) G190
                        (COND ((|greater_SI| |x| #6#) (GO G191)))
                        (SEQ (EXIT (LETT #7# (CONS 0 #7#) . #9#)))
                        (LETT |x| (|inc_SI| |x|) . #9#) (GO G190) G191
                        (EXIT (NREVERSE #7#))))
                  . #9#)
            (LETT |retOpt|
                  (PROGN
                   (LETT #5# NIL . #9#)
                   (SEQ (LETT |x| 1 . #9#) (LETT #4# |codomainSize| . #9#) G190
                        (COND ((|greater_SI| |x| #4#) (GO G191)))
                        (SEQ (EXIT (LETT #5# (CONS NIL #5#) . #9#)))
                        (LETT |x| (|inc_SI| |x|) . #9#) (GO G190) G191
                        (EXIT (NREVERSE #5#))))
                  . #9#)
            (SEQ (LETT |mi| 1 . #9#)
                 (LETT #3# (SPADCALL |m| (QREFELT $ 47)) . #9#) G190
                 (COND ((|greater_SI| |mi| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SPADCALL |retOpt| (SPADCALL |m| |mi| (QREFELT $ 17))
                             (SPADCALL
                              (SPADCALL |retOpt|
                                        (SPADCALL |m| |mi| (QREFELT $ 17))
                                        (QREFELT $ 29))
                              |mi| (QREFELT $ 62))
                             (QREFELT $ 85))))
                 (LETT |mi| (|inc_SI| |mi|) . #9#) (GO G190) G191 (EXIT NIL))
            (LETT |entry| 1 . #9#)
            (SEQ (LETT |ri| NIL . #9#) (LETT #2# |retOpt| . #9#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |ri| (CAR #2#) . #9#) NIL))
                   (GO G191)))
                 (SEQ (LETT |x| (SPADCALL |s| |ri| (QREFELT $ 89)) . #9#)
                      (COND
                       ((EQL |x| 0)
                        (PROGN
                         (LETT #1# (CONS 1 "failed") . #9#)
                         (GO #10=#:G539))))
                      (SPADCALL |ret| |entry| |x| (QREFELT $ 16))
                      (EXIT (LETT |entry| (+ |entry| 1) . #9#)))
                 (LETT #2# (CDR #2#) . #9#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |ret|))))
          #10# (EXIT #1#)))) 

(SDEFUN |MFGRPH;apply;$3Nni;31|
        ((|s| $) (|a| |NonNegativeInteger|) (|m| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPADCALL (QVELT (SPADCALL (QCAR |s|) |a| (QREFELT $ 43)) 3) |m|
                  (QREFELT $ 17))) 

(SDEFUN |MFGRPH;limit;$2NniL;32|
        ((|s| $) (|a| |NonNegativeInteger|) (|m| |NonNegativeInteger|)
         ($ |Loop|))
        (SPROG
         ((|ptr| (|NonNegativeInteger|)) (#1=#:G559 NIL)
          (|lp| (|List| (|Loop|))) (#2=#:G560 NIL) (|s1| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |ptr| |a| . #3=(|MFGRPH;limit;$2NniL;32|))
                (SEQ (LETT |s1| NIL . #3#) (LETT #2# (QCAR |s|) . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |s1| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ (LETT |lp| (SPADCALL |s| |ptr| (QREFELT $ 93)) . #3#)
                          (COND
                           ((SPADCALL (LENGTH |lp|) 1 (QREFELT $ 84))
                            (|error| "limit: cant have >1 loop through node")))
                          (COND
                           ((EQL (LENGTH |lp|) 1)
                            (PROGN
                             (LETT #1# (|SPADfirst| |lp|) . #3#)
                             (GO #4=#:G558))))
                          (EXIT
                           (LETT |ptr| (SPADCALL |s| |ptr| |m| (QREFELT $ 91))
                                 . #3#)))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL NIL (QREFELT $ 95)))))
          #4# (EXIT #1#)))) 

(SDEFUN |MFGRPH;coerce;Pg$;33| ((|pg| |PermutationGroup| S) ($ $))
        (SPADCALL (SPADCALL |pg| (QREFELT $ 98)) (QREFELT $ 38))) 

(SDEFUN |MFGRPH;permIndex|
        ((|entry| |Permutation| S) (|lps2| |List| (|Permutation| S))
         ($ |NonNegativeInteger|))
        (SPROG
         ((|resu| (|NonNegativeInteger|)) (|e2| (|Permutation| S))
          (#1=#:G566 NIL) (|i| NIL) (|dimen| (|NonNegativeInteger|)))
         (SEQ (LETT |dimen| (LENGTH |lps2|) . #2=(|MFGRPH;permIndex|))
              (LETT |resu| 0 . #2#)
              (SEQ (LETT |i| 1 . #2#) (LETT #1# |dimen| . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |e2| (SPADCALL |lps2| |i| (QREFELT $ 100)) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |entry| |e2| (QREFELT $ 101))
                           (LETT |resu| |i| . #2#)))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |resu|)))) 

(SDEFUN |MFGRPH;generateNewPerms|
        ((|gens2| |List| (|Permutation| S)) (|stngs| |List| (|String|))
         (|permutationNames| |Boolean|)
         ($ |Record| (|:| |prm| (|List| (|Permutation| S)))
          (|:| |nam| (|List| (|String|)))))
        (SPROG
         ((|resstr| (|List| (|String|))) (|resu| (|List| (|Permutation| S)))
          (|foundNew| (|Boolean|)) (|p| (|Permutation| S)) (#1=#:G577 NIL)
          (|j| NIL) (#2=#:G576 NIL) (|i| NIL) (|dimen| (|NonNegativeInteger|)))
         (SEQ (LETT |dimen| (LENGTH |gens2|) . #3=(|MFGRPH;generateNewPerms|))
              (LETT |resu| NIL . #3#) (LETT |resstr| NIL . #3#)
              (SEQ (LETT |i| 1 . #3#) (LETT #2# |dimen| . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #3#) (LETT #1# |dimen| . #3#) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (LETT |p|
                                 (SPADCALL
                                  (SPADCALL |gens2| |i| (QREFELT $ 100))
                                  (SPADCALL |gens2| |j| (QREFELT $ 100))
                                  (QREFELT $ 102))
                                 . #3#)
                           (LETT |foundNew|
                                 (COND
                                  ((OR (SPADCALL |p| |gens2| (QREFELT $ 103))
                                       (SPADCALL |p| |resu| (QREFELT $ 103)))
                                   'NIL)
                                  ('T 'T))
                                 . #3#)
                           (EXIT
                            (COND
                             (|foundNew|
                              (SEQ
                               (LETT |resu|
                                     (SPADCALL |resu| |p| (QREFELT $ 104))
                                     . #3#)
                               (EXIT
                                (COND
                                 (|permutationNames|
                                  (LETT |resstr|
                                        (SPADCALL |resstr|
                                                  (|mathObject2String| |p|)
                                                  (QREFELT $ 106))
                                        . #3#))
                                 ('T
                                  (LETT |resstr|
                                        (SPADCALL |resstr|
                                                  (STRCONC
                                                   (SPADCALL |stngs| |i|
                                                             (QREFELT $ 107))
                                                   (SPADCALL |stngs| |j|
                                                             (QREFELT $ 107)))
                                                  (QREFELT $ 106))
                                        . #3#)))))))))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |resu| |resstr|))))) 

(SDEFUN |MFGRPH;generateName| ((|n| |NonNegativeInteger|) ($ |String|))
        (SPROG ((|ascii| (|NonNegativeInteger|)))
               (SEQ (LETT |ascii| 96 . #1=(|MFGRPH;generateName|))
                    (COND
                     ((SPADCALL |n| 8 (QREFELT $ 84)) (LETT |ascii| 97 . #1#)))
                    (EXIT
                     (SPADCALL (SPADCALL (+ |ascii| |n|) (QREFELT $ 109))
                               (QREFELT $ 110)))))) 

(SDEFUN |MFGRPH;generateNames|
        ((|n| |NonNegativeInteger|) ($ |List| (|String|)))
        (SPROG ((#1=#:G583 NIL) (|ptr2| NIL) (#2=#:G582 NIL))
               (SEQ
                (COND ((EQL |n| 0) (LIST "0"))
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|MFGRPH;generateNames|))
                        (SEQ (LETT |ptr2| 1 . #3#) (LETT #1# |n| . #3#) G190
                             (COND ((|greater_SI| |ptr2| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS (|MFGRPH;generateName| |ptr2| $)
                                           #2#)
                                     . #3#)))
                             (LETT |ptr2| (|inc_SI| |ptr2|) . #3#) (GO G190)
                             G191 (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MFGRPH;generateNamesCycle|
        ((|g| |List| (|Permutation| S)) ($ |List| (|String|)))
        (SPROG
         ((|s2| (|List| (|String|))) (#1=#:G588 NIL) (|ptr2| NIL)
          (#2=#:G587 NIL) (|s1| (|String|)))
         (SEQ
          (LETT |s1| (|mathObject2String| (|spadConstant| $ 34))
                . #3=(|MFGRPH;generateNamesCycle|))
          (LETT |s2|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |ptr2| NIL . #3#) (LETT #1# |g| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |ptr2| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|mathObject2String| |ptr2|) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (CONS |s1| |s2|))))) 

(SDEFUN |MFGRPH;toCayleyGraph;LBMg;39|
        ((|permList| |List| (|Permutation| S)) (|permutationNames| |Boolean|)
         ($ |MultifunctionGraph| (|String|)))
        (SPROG
         ((|gens| (|List| (|List| (|NonNegativeInteger|)))) (#1=#:G608 NIL)
          (|i| NIL) (#2=#:G607 NIL)
          (|ct| (|List| (|List| (|NonNegativeInteger|)))) (#3=#:G606 NIL)
          (|j| NIL) (#4=#:G605 NIL) (#5=#:G604 NIL) (#6=#:G603 NIL)
          (|dimen| #7=(|NonNegativeInteger|)) (|strngs| (|List| (|String|)))
          (|elements| (|List| (|Permutation| S))) (|idPerm| (|Permutation| S))
          (|idPos| (|Integer|)) (|contin| (|Boolean|))
          (|resu|
           (|Record| (|:| |prm| (|List| (|Permutation| S)))
                     (|:| |nam| (|List| (|String|)))))
          (|numGenerators| #7#))
         (SEQ
          (LETT |elements| |permList| . #8=(|MFGRPH;toCayleyGraph;LBMg;39|))
          (LETT |numGenerators| (LENGTH |permList|) . #8#)
          (LETT |strngs| (|MFGRPH;generateNames| (LENGTH |elements|) $) . #8#)
          (COND
           (|permutationNames|
            (LETT |strngs| (|MFGRPH;generateNamesCycle| |permList| $) . #8#)))
          (LETT |contin| 'T . #8#)
          (SEQ G190 (COND ((NULL |contin|) (GO G191)))
               (SEQ
                (LETT |resu|
                      (|MFGRPH;generateNewPerms| |elements| |strngs|
                       |permutationNames| $)
                      . #8#)
                (LETT |contin| (COND ((NULL (QCAR |resu|)) 'NIL) ('T 'T))
                      . #8#)
                (EXIT
                 (COND
                  (|contin|
                   (SEQ
                    (LETT |elements| (APPEND |elements| (QCAR |resu|)) . #8#)
                    (EXIT
                     (LETT |strngs| (APPEND |strngs| (QCDR |resu|))
                           . #8#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |idPos| (SPADCALL (ELT $ 112) |elements| (QREFELT $ 114))
                . #8#)
          (COND
           ((SPADCALL |idPos| 1 (QREFELT $ 115))
            (SEQ
             (LETT |idPerm| (SPADCALL |elements| |idPos| (QREFELT $ 100))
                   . #8#)
             (LETT |elements|
                   (CONS |idPerm|
                         (SPADCALL |elements| |idPos| (QREFELT $ 116)))
                   . #8#)
             (EXIT
              (LETT |strngs|
                    (CONS "i" (SPADCALL |strngs| |idPos| (QREFELT $ 117)))
                    . #8#)))))
          (LETT |dimen| (LENGTH |elements|) . #8#)
          (LETT |ct|
                (PROGN
                 (LETT #6# NIL . #8#)
                 (SEQ (LETT |i| 1 . #8#) (LETT #5# |dimen| . #8#) G190
                      (COND ((|greater_SI| |i| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS
                               (PROGN
                                (LETT #4# NIL . #8#)
                                (SEQ (LETT |j| 1 . #8#)
                                     (LETT #3# |dimen| . #8#) G190
                                     (COND ((|greater_SI| |j| #3#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #4#
                                             (CONS
                                              (|MFGRPH;permIndex|
                                               (SPADCALL
                                                (SPADCALL |elements| |i|
                                                          (QREFELT $ 100))
                                                (SPADCALL |elements| |j|
                                                          (QREFELT $ 100))
                                                (QREFELT $ 102))
                                               |elements| $)
                                              #4#)
                                             . #8#)))
                                     (LETT |j| (|inc_SI| |j|) . #8#) (GO G190)
                                     G191 (EXIT (NREVERSE #4#))))
                               #6#)
                              . #8#)))
                      (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #8#)
          (LETT |gens|
                (PROGN
                 (LETT #2# NIL . #8#)
                 (SEQ (LETT |i| 1 . #8#) (LETT #1# |dimen| . #8#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL
                                (CDR (SPADCALL |ct| |i| (QREFELT $ 29)))
                                |numGenerators| (QREFELT $ 118))
                               #2#)
                              . #8#)))
                      (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #8#)
          (EXIT (SPADCALL |strngs| |gens| (QREFELT $ 120)))))) 

(SDEFUN |MFGRPH;toCayleyGraph;PgMg;40|
        ((|pg| |PermutationGroup| S) ($ |MultifunctionGraph| (|String|)))
        (SPROG ((|perms| (|List| (|Permutation| S))))
               (SEQ
                (LETT |perms| (SPADCALL |pg| (QREFELT $ 122))
                      |MFGRPH;toCayleyGraph;PgMg;40|)
                (EXIT (SPADCALL |perms| 'NIL (QREFELT $ 121)))))) 

(SDEFUN |MFGRPH;toPermutation;$Pg;41|
        ((|s| $) ($ |PermutationGroup| (|NonNegativeInteger|)))
        (SPROG
         ((|lp| (|List| (|Permutation| (|NonNegativeInteger|))))
          (|p| (|Permutation| (|NonNegativeInteger|)))
          (|imgs| (|List| (|NonNegativeInteger|))) (#1=#:G631 NIL) (|i| NIL)
          (|preImgs| (|List| (|NonNegativeInteger|))) (#2=#:G630 NIL)
          (#3=#:G629 NIL)
          (|cayleyTable| (|List| (|List| (|NonNegativeInteger|))))
          (#4=#:G628 NIL) (|j| NIL) (#5=#:G627 NIL) (#6=#:G626 NIL)
          (#7=#:G625 NIL) (|numCols| (|NonNegativeInteger|))
          (|numRows| (|NonNegativeInteger|))
          (|preTable| (|List| (|List| (|NonNegativeInteger|))))
          (|newNext| (|List| (|NonNegativeInteger|))) (#8=#:G623 NIL)
          (|obj| NIL) (#9=#:G624 NIL) (|oi| NIL)
          (|objs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))
                      (|:| |next| (|List| (|NonNegativeInteger|)))
                      (|:| |map| (|List| (|List| (|NonNegativeInteger|))))))))
         (SEQ (LETT |lp| NIL . #10=(|MFGRPH;toPermutation;$Pg;41|))
              (LETT |objs| (QCAR |s|) . #10#)
              (SEQ (LETT |oi| 1 . #10#) (LETT #9# (LENGTH |objs|) . #10#)
                   (LETT |obj| NIL . #10#) (LETT #8# |objs| . #10#) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |obj| (CAR #8#) . #10#) NIL)
                         (|greater_SI| |oi| #9#))
                     (GO G191)))
                   (SEQ (LETT |newNext| (QVELT |obj| 3) . #10#)
                        (EXIT
                         (LETT |preTable|
                               (SPADCALL |preTable| |newNext| (QREFELT $ 124))
                               . #10#)))
                   (LETT #8#
                         (PROG1 (CDR #8#) (LETT |oi| (|inc_SI| |oi|) . #10#))
                         . #10#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |numRows| (LENGTH |preTable|) . #10#)
              (LETT |numCols|
                    (SPADCALL (|SPADfirst| |preTable|) (QREFELT $ 47)) . #10#)
              (LETT |cayleyTable|
                    (PROGN
                     (LETT #7# NIL . #10#)
                     (SEQ (LETT |i| 1 . #10#) (LETT #6# |numCols| . #10#) G190
                          (COND ((|greater_SI| |i| #6#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (PROGN
                                    (LETT #5# NIL . #10#)
                                    (SEQ (LETT |j| 1 . #10#)
                                         (LETT #4# |numRows| . #10#) G190
                                         (COND
                                          ((|greater_SI| |j| #4#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #5#
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |preTable| |j|
                                                             (QREFELT $ 29))
                                                   |i| (QREFELT $ 17))
                                                  #5#)
                                                 . #10#)))
                                         (LETT |j| (|inc_SI| |j|) . #10#)
                                         (GO G190) G191 (EXIT (NREVERSE #5#))))
                                   #7#)
                                  . #10#)))
                          (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                          (EXIT (NREVERSE #7#))))
                    . #10#)
              (LETT |preImgs|
                    (PROGN
                     (LETT #3# NIL . #10#)
                     (SEQ (LETT |p| 1 . #10#) (LETT #2# |numRows| . #10#) G190
                          (COND ((|greater_SI| |p| #2#) (GO G191)))
                          (SEQ (EXIT (LETT #3# (CONS |p| #3#) . #10#)))
                          (LETT |p| (|inc_SI| |p|) . #10#) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    . #10#)
              (SEQ (LETT |i| 1 . #10#) (LETT #1# (LENGTH |cayleyTable|) . #10#)
                   G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |imgs| (SPADCALL |cayleyTable| |i| (QREFELT $ 29))
                          . #10#)
                    (LETT |p|
                          (SPADCALL (LIST |preImgs| |imgs|) (QREFELT $ 126))
                          . #10#)
                    (EXIT
                     (LETT |lp| (SPADCALL |lp| |p| (QREFELT $ 128)) . #10#)))
                   (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |lp| (QREFELT $ 130)))))) 

(DECLAIM (NOTINLINE |MultifunctionGraph;|)) 

(DEFUN |MultifunctionGraph| (#1=#:G632)
  (SPROG NIL
         (PROG (#2=#:G633)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|MultifunctionGraph|)
                                               '|domainEqualList|)
                    . #3=(|MultifunctionGraph|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|MultifunctionGraph;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|MultifunctionGraph|)))))))))) 

(DEFUN |MultifunctionGraph;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|MultifunctionGraph|))
          (LETT |dv$| (LIST '|MultifunctionGraph| DV$1) . #1#)
          (LETT $ (GETREFV 142) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|MultifunctionGraph| (LIST DV$1)
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
                                     (|:| |next|
                                          (|List| (|NonNegativeInteger|)))
                                     (|:| |map|
                                          (|List|
                                           (|List|
                                            (|NonNegativeInteger|)))))))))
          $))) 

(MAKEPROP '|MultifunctionGraph| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              |MFGRPH;multifunctionGraph;L$;1|
              (|Record| (|:| |value| 6) (|:| |posX| 13) (|:| |posY| 13)
                        (|:| |next| 15) (|:| |map| 28))
              (|List| 10) |MFGRPH;multifunctionGraph;L$;2|
              (|NonNegativeInteger|) (|Integer|) (|List| 13) (0 . |setelt!|)
              (7 . |elt|) (13 . |concat|)
              (|Record| (|:| |value| 6) (|:| |posX| 13) (|:| |posY| 13))
              (|List| 19)
              (|Record| (|:| |name| 44) (|:| |arrType| 13) (|:| |fromOb| 13)
                        (|:| |toOb| 13) (|:| |xOffset| 14) (|:| |yOffset| 14)
                        (|:| |map| 15))
              (|List| 21) |MFGRPH;multifunctionGraph;LL$;3| (19 . |elt|)
              (25 . |createX|) (31 . |createY|) (37 . |concat|) (|List| 15)
              (43 . |elt|) |MFGRPH;multifunctionGraph;LL$;4|
              (|Record| (|:| |preimage| 8) (|:| |image| 8)) (|Permutation| 6)
              (49 . |listRepresentation|) (54 . |One|) (58 . |position|)
              (64 . |concat|) (|List| 32) |MFGRPH;multifunctionGraph;L$;5|
              (|Boolean|) (70 . =) |MFGRPH;addObject!;$S$;6|
              |MFGRPH;addObject!;$R$;7| (76 . |elt|) (|String|)
              |MFGRPH;addArrow!;$S2Nni$;8| |MFGRPH;getVertices;$L;9| (82 . |#|)
              (87 . |concat|) |MFGRPH;getArrows;$L;10| |MFGRPH;initial;$;11|
              |MFGRPH;terminal;S$;12| |MFGRPH;cycleOpen;LS$;13|
              |MFGRPH;cycleClosed;LS$;14| |MFGRPH;unit;LS$;15|
              |MFGRPH;kgraph;LS$;16| (93 . |concat|) |MFGRPH;+;3$;17|
              |MFGRPH;merge;3$;18| (99 . ~=) (|List| $) (105 . |concat|)
              (110 . |concat|) (116 . |diagramWidth|) (121 . |diagramHeight|)
              (|Product| 6 6) (126 . |construct|)
              (|Record| (|:| |value| 65) (|:| |posX| 13) (|:| |posY| 13)
                        (|:| |next| 15) (|:| |map| 28))
              (|List| 67) (132 . |concat|) (|MultifunctionGraph| 65)
              (138 . |multifunctionGraph|) |MFGRPH;*;2$Mg;22|
              |MFGRPH;cartesian;2$Mg;23| (|Mapping| 6 6 6)
              |MFGRPH;closedTensor;2$M$;24| |MFGRPH;closedCartesian;2$M$;25|
              (143 . |position|) |MFGRPH;~;2$;26| (149 . |setelt!|)
              |MFGRPH;map;$LL2I$;27| (156 . |nodeToNode|) (162 . |concat|)
              |MFGRPH;mapContra;$LL2I$;28| (168 . >) (174 . |setelt!|)
              (181 . |max|) (|Union| 15 '"failed") |MFGRPH;coAdjoint;$LU;29|
              (187 . |min|) |MFGRPH;contraAdjoint;$LU;30|
              |MFGRPH;apply;$3Nni;31| (|List| 94) (193 . |loopsAtNode|)
              (|Loop|) (199 . |loop|) |MFGRPH;limit;$2NniL;32|
              (|PermutationGroup| 6) (204 . |coerce|) |MFGRPH;coerce;Pg$;33|
              (209 . |elt|) (215 . =) (221 . *) (227 . |member?|)
              (233 . |concat|) (|List| 44) (239 . |concat|) (245 . |elt|)
              (|Character|) (251 . |char|) (256 . |coerce|) (261 . |one?|)
              (266 . |one?|) (|Mapping| 39 32) (271 . |position|) (277 . >)
              (283 . |delete|) (289 . |delete|) (295 . |first|)
              (|MultifunctionGraph| 44) (301 . |multifunctionGraph|)
              |MFGRPH;toCayleyGraph;LBMg;39| (307 . |generators|)
              |MFGRPH;toCayleyGraph;PgMg;40| (312 . |concat|)
              (|Permutation| 13) (318 . |coercePreimagesImages|) (|List| 125)
              (323 . |concat|) (|PermutationGroup| 13)
              (329 . |permutationGroup|) |MFGRPH;toPermutation;$Pg;41| (|Void|)
              (|Scene| (|SCartesian| '2)) (|Matrix| 14) (|Matrix| 13)
              (|Tree| 14) (|List| 136) (|DirectedGraph| $) (|SingleInteger|)
              (|OutputForm|) (|HashState|))
           '#(~= 334 ~ 340 |unit| 345 |toPermutation| 351 |toCayleyGraph| 356
              |terminal| 367 |subdiagramSvg| 372 |spanningTreeNode| 380
              |spanningTreeArrow| 386 |spanningForestNode| 392
              |spanningForestArrow| 397 |routeNodes| 402 |routeArrows| 409
              |outDegree| 416 |nodeToNode| 422 |nodeToArrow| 428 |nodeFromNode|
              434 |nodeFromArrow| 440 |multifunctionGraph| 446 |min| 473
              |merge| 484 |max| 490 |mapContra| 501 |map| 510 |looseEquals| 519
              |loopsNodes| 525 |loopsAtNode| 530 |loopsArrows| 536 |limit| 541
              |latex| 548 |laplacianMatrix| 553 |kgraph| 558 |isGreaterThan?|
              564 |isFunctional?| 571 |isFixPoint?| 576 |isDirected?| 582
              |isDirectSuccessor?| 586 |isAcyclic?| 593 |initial| 598
              |incidenceMatrix| 602 |inDegree| 607 |hashUpdate!| 613 |hash| 619
              |getVertices| 624 |getVertexIndex| 629 |getArrows| 635
              |getArrowIndex| 640 |flatten| 647 |distanceMatrix| 652 |distance|
              657 |diagramWidth| 664 |diagramSvg| 669 |diagramHeight| 676
              |deepDiagramSvg| 681 |cycleOpen| 688 |cycleClosed| 694 |createY|
              700 |createX| 706 |createWidth| 712 |contraAdjoint| 717 |coerce|
              723 |coAdjoint| 738 |closedTensor| 744 |closedCartesian| 751
              |cartesian| 758 |arrowsToNode| 764 |arrowsToArrow| 770
              |arrowsFromNode| 776 |arrowsFromArrow| 782 |arrowName| 788
              |apply| 795 |adjacencyMatrix| 802 |addObject!| 807 |addArrow!|
              819 = 844 + 850 * 856)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|)
                           (|CoercibleTo| 140) (|BasicType|))
                        (|makeByteWordVec2| 141
                                            '(3 15 13 0 14 13 16 2 15 13 0 14
                                              17 2 11 0 0 10 18 2 8 6 0 14 24 2
                                              0 13 13 13 25 2 0 13 13 13 26 2
                                              20 0 0 19 27 2 28 15 0 14 29 1 32
                                              31 0 33 0 32 0 34 2 8 14 6 0 35 2
                                              8 0 0 6 36 2 11 39 0 0 40 2 11 10
                                              0 14 43 1 15 13 0 47 2 22 0 0 21
                                              48 2 11 0 0 0 56 2 13 39 0 0 59 1
                                              44 0 60 61 2 15 0 0 13 62 1 0 13
                                              0 63 1 0 13 0 64 2 65 0 6 6 66 2
                                              68 0 0 67 69 1 70 0 68 71 2 15 14
                                              13 0 77 3 11 10 0 14 10 79 2 0 15
                                              0 13 81 2 15 0 0 0 82 2 13 39 0 0
                                              84 3 28 15 0 14 15 85 2 0 13 0 15
                                              86 2 0 13 0 15 89 2 0 92 0 13 93
                                              1 94 0 15 95 1 97 37 0 98 2 37 32
                                              0 14 100 2 32 39 0 0 101 2 32 0 0
                                              0 102 2 37 39 32 0 103 2 37 0 0
                                              32 104 2 105 0 0 44 106 2 105 44
                                              0 14 107 1 108 0 14 109 1 44 0
                                              108 110 1 13 39 0 111 1 32 39 0
                                              112 2 37 14 113 0 114 2 14 39 0 0
                                              115 2 37 0 0 14 116 2 105 0 0 14
                                              117 2 15 0 0 13 118 2 119 0 105
                                              28 120 1 97 37 0 122 2 28 0 0 15
                                              124 1 125 0 28 126 2 127 0 0 125
                                              128 1 129 0 127 130 2 0 39 0 0 1
                                              1 0 0 0 78 2 0 0 8 44 54 1 0 129
                                              0 131 1 0 119 97 123 2 0 119 37
                                              39 121 1 0 0 6 51 4 0 132 133 0
                                              39 39 1 2 0 136 0 13 1 2 0 136 0
                                              13 1 1 0 137 0 1 1 0 137 0 1 3 0
                                              15 0 13 13 1 3 0 15 0 13 13 1 2 0
                                              13 0 13 1 2 0 15 0 13 81 2 0 15 0
                                              13 1 2 0 15 0 13 1 2 0 15 0 13 1
                                              1 0 0 37 38 2 0 0 20 22 23 2 0 0
                                              8 28 30 1 0 0 11 12 1 0 0 8 9 1 0
                                              13 0 1 2 0 13 0 15 89 2 0 0 0 0
                                              58 2 0 13 0 15 86 1 0 13 0 1 5 0
                                              0 0 15 8 14 14 83 5 0 0 0 15 8 14
                                              14 80 2 0 39 0 0 1 1 0 92 0 1 2 0
                                              92 0 13 93 1 0 92 0 1 3 0 94 0 13
                                              13 96 1 0 44 0 1 1 0 134 0 1 2 0
                                              0 8 44 55 3 0 39 0 13 13 1 1 0 39
                                              0 1 2 0 39 0 13 1 0 0 39 1 3 0 39
                                              0 13 13 1 1 0 39 0 1 0 0 0 50 1 0
                                              134 0 1 2 0 13 0 13 1 2 0 141 141
                                              0 1 1 0 139 0 1 1 0 20 0 46 2 0
                                              13 0 6 1 1 0 22 0 49 3 0 13 0 13
                                              13 1 1 0 0 138 1 1 0 134 0 1 3 0
                                              14 0 13 13 1 1 0 13 0 63 3 0 132
                                              44 0 39 1 1 0 13 0 64 3 0 132 44
                                              0 39 1 2 0 0 8 44 52 2 0 0 8 44
                                              53 2 0 13 13 13 26 2 0 13 13 13
                                              25 1 0 13 13 1 2 0 87 0 15 90 1 0
                                              0 97 99 1 0 140 0 1 1 0 140 0 1 2
                                              0 87 0 15 88 3 0 0 0 0 74 75 3 0
                                              0 0 0 74 76 2 0 70 0 0 73 2 0 15
                                              0 13 1 2 0 15 0 13 1 2 0 15 0 13
                                              1 2 0 15 0 13 1 3 0 44 0 13 13 1
                                              3 0 13 0 13 13 91 1 0 135 0 1 2 0
                                              0 0 19 42 2 0 0 0 6 41 4 0 0 0 44
                                              6 6 1 4 0 0 0 44 13 13 45 5 0 0 0
                                              44 13 13 15 1 2 0 39 0 0 1 2 0 0
                                              0 0 57 2 0 70 0 0 72)))))
           '|lookupComplete|)) 
