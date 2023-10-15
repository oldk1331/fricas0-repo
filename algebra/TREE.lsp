
(PUT '|TREE;empty?;$B;1| '|SPADreplace| '(XLAM (|t|) (QEQCAR |t| 1))) 

(SDEFUN |TREE;empty?;$B;1| ((|t| $) ($ |Boolean|)) (QEQCAR |t| 1)) 

(PUT '|TREE;empty;$;2| '|SPADreplace| '(XLAM NIL (CONS 1 "empty"))) 

(SDEFUN |TREE;empty;$;2| (($ $)) (CONS 1 "empty")) 

(SDEFUN |TREE;children;$L;3| ((|t| $) ($ |List| $))
        (COND
         ((QEQCAR |t| 1) (|error| "cannot take the children of an empty tree"))
         ('T (QCDR (CDR |t|))))) 

(SDEFUN |TREE;setchildren!;$L$;4| ((|t| $) (|lt| |List| $) ($ $))
        (SEQ
         (COND
          ((QEQCAR |t| 1) (|error| "cannot set children of an empty tree"))
          ('T (SEQ (PROGN (RPLACD #1=(CDR |t|) |lt|) (QCDR #1#)) (EXIT |t|)))))) 

(SDEFUN |TREE;setvalue!;$2S;5| ((|t| $) (|s| S) ($ S))
        (SEQ
         (COND ((QEQCAR |t| 1) (|error| "cannot set value of an empty tree"))
               ('T
                (SEQ (PROGN (RPLACA #1=(CDR |t|) |s|) (QCAR #1#))
                     (EXIT |s|)))))) 

(SDEFUN |TREE;count;S$Nni;6| ((|n| S) (|t| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|i| #1=(|NonNegativeInteger|)) (#2=#:G167 NIL) (#3=#:G166 #1#)
          (#4=#:G168 #1#) (#5=#:G173 NIL) (|c| NIL))
         (SEQ
          (COND ((QEQCAR |t| 1) 0)
                (#6='T
                 (SEQ
                  (LETT |i|
                        (PROGN
                         (LETT #2# NIL . #7=(|TREE;count;S$Nni;6|))
                         (SEQ (LETT |c| NIL . #7#)
                              (LETT #5# (SPADCALL |t| (QREFELT $ 12)) . #7#)
                              G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |c| (CAR #5#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4# (SPADCALL |n| |c| (QREFELT $ 16))
                                       . #7#)
                                 (COND (#2# (LETT #3# (+ #3# #4#) . #7#))
                                       ('T
                                        (PROGN
                                         (LETT #3# #4# . #7#)
                                         (LETT #2# 'T . #7#)))))))
                              (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#2# #3#) (#6# 0)))
                        . #7#)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |t| (QREFELT $ 17)) |n|
                               (QREFELT $ 18))
                     (+ |i| 1))
                    (#6# |i|))))))))) 

(SDEFUN |TREE;count;M$Nni;7|
        ((|fn| |Mapping| (|Boolean|) S) (|t| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|i| #1=(|NonNegativeInteger|)) (#2=#:G175 NIL) (#3=#:G174 #1#)
          (#4=#:G176 #1#) (#5=#:G180 NIL) (|c| NIL))
         (SEQ
          (COND ((QEQCAR |t| 1) 0)
                (#6='T
                 (SEQ
                  (LETT |i|
                        (PROGN
                         (LETT #2# NIL . #7=(|TREE;count;M$Nni;7|))
                         (SEQ (LETT |c| NIL . #7#)
                              (LETT #5# (SPADCALL |t| (QREFELT $ 12)) . #7#)
                              G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |c| (CAR #5#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4# (SPADCALL |fn| |c| (QREFELT $ 20))
                                       . #7#)
                                 (COND (#2# (LETT #3# (+ #3# #4#) . #7#))
                                       ('T
                                        (PROGN
                                         (LETT #3# #4# . #7#)
                                         (LETT #2# 'T . #7#)))))))
                              (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#2# #3#) (#6# 0)))
                        . #7#)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|) (+ |i| 1))
                    (#6# |i|))))))))) 

(SDEFUN |TREE;map;M2$;8| ((|fn| |Mapping| S S) (|t| $) ($ $))
        (SPROG ((#1=#:G185 NIL) (|c| NIL) (#2=#:G184 NIL))
               (SEQ
                (COND ((QEQCAR |t| 1) |t|)
                      ('T
                       (SPADCALL (SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|)
                                 (PROGN
                                  (LETT #2# NIL . #3=(|TREE;map;M2$;8|))
                                  (SEQ (LETT |c| NIL . #3#)
                                       (LETT #1# (SPADCALL |t| (QREFELT $ 12))
                                             . #3#)
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |c| (CAR #1#) . #3#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL |fn| |c|
                                                          (QREFELT $ 22))
                                                #2#)
                                               . #3#)))
                                       (LETT #1# (CDR #1#) . #3#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 23))))))) 

(SDEFUN |TREE;map!;M2$;9| ((|fn| |Mapping| S S) (|t| $) ($ $))
        (SPROG ((#1=#:G190 NIL) (|c| NIL))
               (SEQ
                (COND ((QEQCAR |t| 1) |t|)
                      ('T
                       (SEQ
                        (SPADCALL |t|
                                  (SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|)
                                  (QREFELT $ 14))
                        (SEQ (LETT |c| NIL . #2=(|TREE;map!;M2$;9|))
                             (LETT #1# (SPADCALL |t| (QREFELT $ 12)) . #2#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |c| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ (EXIT (SPADCALL |fn| |c| (QREFELT $ 24))))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |t|))))))) 

(SDEFUN |TREE;tree;SL$;10| ((|s| S) (|lt| |List| $) ($ $))
        (CONS 0 (CONS |s| |lt|))) 

(SDEFUN |TREE;tree;S$;11| ((|s| S) ($ $)) (CONS 0 (CONS |s| NIL))) 

(SDEFUN |TREE;tree;L$;12| ((|ls| |List| S) ($ $))
        (SPROG ((#1=#:G197 NIL) (|s| NIL) (#2=#:G196 NIL))
               (SEQ
                (COND ((NULL |ls|) (SPADCALL (QREFELT $ 10)))
                      ('T
                       (SPADCALL (|SPADfirst| |ls|)
                                 (PROGN
                                  (LETT #2# NIL . #3=(|TREE;tree;L$;12|))
                                  (SEQ (LETT |s| NIL . #3#)
                                       (LETT #1# (CDR |ls|) . #3#) G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |s| (CAR #1#) . #3#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL |s| (QREFELT $ 25))
                                                #2#)
                                               . #3#)))
                                       (LETT #1# (CDR #1#) . #3#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 23))))))) 

(SDEFUN |TREE;value;$S;13| ((|t| $) ($ S))
        (COND
         ((QEQCAR |t| 1) (|error| "cannot take the value of an empty tree"))
         ('T (QCAR (CDR |t|))))) 

(SDEFUN |TREE;child?;2$B;14| ((|t1| $) (|t2| $) ($ |Boolean|))
        (COND ((SPADCALL |t2| (QREFELT $ 9)) NIL)
              ('T
               (SPADCALL |t1| (SPADCALL |t2| (QREFELT $ 12)) (QREFELT $ 29))))) 

(SDEFUN |TREE;distance1| ((|t1| $) (|t2| $) ($ . #1=(|Integer|)))
        (SPROG
         ((#2=#:G205 NIL) (#3=#:G204 #1#) (#4=#:G206 #1#) (#5=#:G211 NIL)
          (#6=#:G104 NIL) (|u| (|List| #1#)) (|n| #1#) (#7=#:G210 NIL)
          (|t| NIL) (#8=#:G209 NIL))
         (SEQ
          (COND ((SPADCALL |t1| |t2| (QREFELT $ 31)) 0) ((QEQCAR |t2| 1) -1)
                (#9='T
                 (SEQ
                  (LETT |u|
                        (PROGN
                         (LETT #8# NIL . #10=(|TREE;distance1|))
                         (SEQ (LETT |t| NIL . #10#)
                              (LETT #7# (SPADCALL |t2| (QREFELT $ 12)) . #10#)
                              G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |t| (CAR #7#) . #10#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((>=
                                   (LETT |n| (|TREE;distance1| |t1| |t| $)
                                         . #10#)
                                   0)
                                  (LETT #8# (CONS |n| #8#) . #10#)))))
                              (LETT #7# (CDR #7#) . #10#) (GO G190) G191
                              (EXIT (NREVERSE #8#))))
                        . #10#)
                  (EXIT
                   (COND
                    ((SPADCALL (LENGTH |u|) 0 (QREFELT $ 33))
                     (+ 1
                        (PROGN
                         (LETT #2# NIL . #10#)
                         (SEQ (LETT #6# NIL . #10#) (LETT #5# |u| . #10#) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT #6# (CAR #5#) . #10#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4# #6# . #10#)
                                 (COND (#2# (LETT #3# (MIN #3# #4#) . #10#))
                                       ('T
                                        (PROGN
                                         (LETT #3# #4# . #10#)
                                         (LETT #2# 'T . #10#)))))))
                              (LETT #5# (CDR #5#) . #10#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#2# #3#) (#9# (|IdentityError| '|min|))))))
                    (#9# -1))))))))) 

(SDEFUN |TREE;distance;2$I;16| ((|t1| $) (|t2| $) ($ |Integer|))
        (SPROG ((|n| (|Integer|)))
               (SEQ
                (LETT |n| (|TREE;distance1| |t1| |t2| $)
                      |TREE;distance;2$I;16|)
                (EXIT
                 (COND ((>= |n| 0) |n|) ('T (|TREE;distance1| |t2| |t1| $))))))) 

(SDEFUN |TREE;node?;2$B;17| ((|t1| $) (|t2| $) ($ |Boolean|))
        (SPROG NIL
               (COND ((SPADCALL |t1| |t2| (QREFELT $ 31)) 'T)
                     ((QEQCAR |t2| 1) NIL)
                     ('T
                      (SPADCALL (CONS #'|TREE;node?;2$B;17!0| (VECTOR $ |t1|))
                                (SPADCALL |t2| (QREFELT $ 12))
                                (QREFELT $ 37)))))) 

(SDEFUN |TREE;node?;2$B;17!0| ((|t| NIL) ($$ NIL))
        (PROG (|t1| $)
          (LETT |t1| (QREFELT $$ 1) . #1=(|TREE;node?;2$B;17|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |t1| |t| (QREFELT $ 35)))))) 

(SDEFUN |TREE;leaf?;$B;18| ((|t| $) ($ |Boolean|))
        (COND ((QEQCAR |t| 1) NIL)
              ('T (SPADCALL (SPADCALL |t| (QREFELT $ 12)) (QREFELT $ 38))))) 

(SDEFUN |TREE;leaves;$L;19| ((|t| $) ($ |List| S))
        (SPROG
         ((#1=#:G225 NIL) (#2=#:G224 #3=(|List| S)) (#4=#:G226 #3#)
          (#5=#:G229 NIL) (|c| NIL))
         (SEQ
          (COND ((QEQCAR |t| 1) NIL)
                ((SPADCALL |t| (QREFELT $ 39))
                 (LIST (SPADCALL |t| (QREFELT $ 17))))
                (#6='T
                 (PROGN
                  (LETT #1# NIL . #7=(|TREE;leaves;$L;19|))
                  (SEQ (LETT |c| NIL . #7#)
                       (LETT #5# (SPADCALL |t| (QREFELT $ 12)) . #7#) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4# (SPADCALL |c| (QREFELT $ 40)) . #7#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #4# (QREFELT $ 41)) . #7#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #7#)
                             (LETT #1# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# NIL)))))))) 

(SDEFUN |TREE;less?;$NniB;20|
        ((|t| $) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (< (SPADCALL |t| (QREFELT $ 42)) |n|)) 

(SDEFUN |TREE;more?;$NniB;21|
        ((|t| $) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (SPADCALL (SPADCALL |t| (QREFELT $ 42)) |n| (QREFELT $ 44))) 

(SDEFUN |TREE;nodes;$L;22| ((|t| $) ($ |List| $))
        (SPROG
         ((#1=#:G234 NIL) (#2=#:G233 #3=(|List| $)) (#4=#:G235 #3#)
          (#5=#:G240 NIL) (#6=#:G105 NIL) (|nl| (|List| #3#)) (#7=#:G239 NIL)
          (|c| NIL) (#8=#:G238 NIL))
         (SEQ
          (COND ((QEQCAR |t| 1) (SPADCALL (QREFELT $ 46)))
                (#9='T
                 (SEQ
                  (LETT |nl|
                        (PROGN
                         (LETT #8# NIL . #10=(|TREE;nodes;$L;22|))
                         (SEQ (LETT |c| NIL . #10#)
                              (LETT #7# (SPADCALL |t| (QREFELT $ 12)) . #10#)
                              G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |c| (CAR #7#) . #10#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #8#
                                      (CONS (SPADCALL |c| (QREFELT $ 47)) #8#)
                                      . #10#)))
                              (LETT #7# (CDR #7#) . #10#) (GO G190) G191
                              (EXIT (NREVERSE #8#))))
                        . #10#)
                  (EXIT
                   (COND ((SPADCALL |nl| NIL (QREFELT $ 49)) (LIST |t|))
                         (#9#
                          (SPADCALL |t|
                                    (PROGN
                                     (LETT #1# NIL . #10#)
                                     (SEQ (LETT #6# NIL . #10#)
                                          (LETT #5# |nl| . #10#) G190
                                          (COND
                                           ((OR (ATOM #5#)
                                                (PROGN
                                                 (LETT #6# (CAR #5#) . #10#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #4# #6# . #10#)
                                             (COND
                                              (#1#
                                               (LETT #2#
                                                     (SPADCALL #2# #4#
                                                               (QREFELT $ 50))
                                                     . #10#))
                                              ('T
                                               (PROGN
                                                (LETT #2# #4# . #10#)
                                                (LETT #1# 'T . #10#)))))))
                                          (LETT #5# (CDR #5#) . #10#) (GO G190)
                                          G191 (EXIT NIL))
                                     (COND (#1# #2#) (#9# NIL)))
                                    (QREFELT $ 51))))))))))) 

(SDEFUN |TREE;size?;$NniB;23|
        ((|t| $) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (EQL (SPADCALL |t| (QREFELT $ 42)) |n|)) 

(SDEFUN |TREE;any?;M$B;24|
        ((|fn| |Mapping| #1=(|Boolean|) S) (|t| $) ($ . #1#))
        (SPROG ((#2=#:G249 NIL) (#3=#:G250 NIL) (|c| NIL))
               (SEQ
                (EXIT
                 (COND ((QEQCAR |t| 1) NIL)
                       ((SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|) 'T)
                       ('T
                        (SEQ
                         (SEQ (LETT |c| NIL . #4=(|TREE;any?;M$B;24|))
                              (LETT #3# (SPADCALL |t| (QREFELT $ 12)) . #4#)
                              G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |c| (CAR #3#) . #4#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |fn| |c| (QREFELT $ 53))
                                  (PROGN
                                   (LETT #2# 'T . #4#)
                                   (GO #5=#:G248))))))
                              (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT NIL)))))
                #5# (EXIT #2#)))) 

(SDEFUN |TREE;every?;M$B;25|
        ((|fn| |Mapping| #1=(|Boolean|) S) (|t| $) ($ . #1#))
        (SPROG ((#2=#:G257 NIL) (#3=#:G258 NIL) (|c| NIL))
               (SEQ
                (EXIT
                 (COND ((QEQCAR |t| 1) 'T)
                       ((NULL (SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|))
                        NIL)
                       ('T
                        (SEQ
                         (SEQ (LETT |c| NIL . #4=(|TREE;every?;M$B;25|))
                              (LETT #3# (SPADCALL |t| (QREFELT $ 12)) . #4#)
                              G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |c| (CAR #3#) . #4#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((NULL (SPADCALL |fn| |c| (QREFELT $ 54)))
                                  (PROGN
                                   (LETT #2# NIL . #4#)
                                   (GO #5=#:G256))))))
                              (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT 'T)))))
                #5# (EXIT #2#)))) 

(SDEFUN |TREE;member?;S$B;26| ((|n| S) (|t| $) ($ |Boolean|))
        (SPROG NIL
               (COND ((QEQCAR |t| 1) NIL)
                     ((SPADCALL |n| (SPADCALL |t| (QREFELT $ 17))
                                (QREFELT $ 18))
                      'T)
                     ('T
                      (SPADCALL (CONS #'|TREE;member?;S$B;26!0| (VECTOR $ |n|))
                                (SPADCALL |t| (QREFELT $ 12))
                                (QREFELT $ 37)))))) 

(SDEFUN |TREE;member?;S$B;26!0| ((|c| NIL) ($$ NIL))
        (PROG (|n| $)
          (LETT |n| (QREFELT $$ 1) . #1=(|TREE;member?;S$B;26|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |n| |c| (QREFELT $ 55)))))) 

(SDEFUN |TREE;members;$L;27| ((|t| $) ($ |List| S))
        (SPADCALL |t| (QREFELT $ 56))) 

(SDEFUN |TREE;parts;$L;28| ((|t| $) ($ |List| S))
        (SPROG
         ((#1=#:G270 NIL) (#2=#:G269 #3=(|List| S)) (#4=#:G271 #3#)
          (#5=#:G276 NIL) (#6=#:G106 NIL) (|u| (|List| #3#)) (#7=#:G275 NIL)
          (|c| NIL) (#8=#:G274 NIL))
         (SEQ
          (COND ((QEQCAR |t| 1) NIL)
                (#9='T
                 (SEQ
                  (LETT |u|
                        (PROGN
                         (LETT #8# NIL . #10=(|TREE;parts;$L;28|))
                         (SEQ (LETT |c| NIL . #10#)
                              (LETT #7# (SPADCALL |t| (QREFELT $ 12)) . #10#)
                              G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |c| (CAR #7#) . #10#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #8#
                                      (CONS (SPADCALL |c| (QREFELT $ 56)) #8#)
                                      . #10#)))
                              (LETT #7# (CDR #7#) . #10#) (GO G190) G191
                              (EXIT (NREVERSE #8#))))
                        . #10#)
                  (EXIT
                   (COND
                    ((SPADCALL |u| NIL (QREFELT $ 59))
                     (LIST (SPADCALL |t| (QREFELT $ 17))))
                    (#9#
                     (CONS (SPADCALL |t| (QREFELT $ 17))
                           (PROGN
                            (LETT #1# NIL . #10#)
                            (SEQ (LETT #6# NIL . #10#) (LETT #5# |u| . #10#)
                                 G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT #6# (CAR #5#) . #10#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #4# #6# . #10#)
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #4# (QREFELT $ 41))
                                            . #10#))
                                     ('T
                                      (PROGN
                                       (LETT #2# #4# . #10#)
                                       (LETT #1# 'T . #10#)))))))
                                 (LETT #5# (CDR #5#) . #10#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#1# #2#) (#9# NIL))))))))))))) 

(SDEFUN |TREE;hashUpdate!;Hs$Hs;29| ((|s| |HashState|) (|t| $) ($ |HashState|))
        (SPROG ((#1=#:G282 NIL) (|subt| NIL))
               (SEQ
                (COND ((QEQCAR |t| 1) |s|)
                      ('T
                       (SEQ
                        (LETT |s|
                              (SPADCALL |s| (SPADCALL |t| (QREFELT $ 17))
                                        (QREFELT $ 61))
                              . #2=(|TREE;hashUpdate!;Hs$Hs;29|))
                        (SEQ (LETT |subt| NIL . #2#)
                             (LETT #1# (SPADCALL |t| (QREFELT $ 12)) . #2#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |subt| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s| (SPADCALL |s| |subt| (QREFELT $ 62))
                                     . #2#)))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |s|))))))) 

(SDEFUN |TREE;=;2$B;30| ((|t1| $) (|t2| $) ($ |Boolean|))
        (|TREE;equal?| |t1| |t2| |t1| |t2| 0 $)) 

(SDEFUN |TREE;equal?|
        ((|t1| $) (|t2| $) (|ot1| $) (|ot2| $) (|k| |Integer|) ($ |Boolean|))
        (SPROG
         ((#1=#:G296 NIL) (#2=#:G297 NIL) (|x| NIL) (#3=#:G298 NIL) (|y| NIL)
          (#4=#:G295 NIL) (|c2| #5=(|List| $)) (|c1| #5#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((EQL |k| 5)
              (COND
               ((OR (SPADCALL |ot1| (QREFELT $ 63))
                    (SPADCALL |ot2| (QREFELT $ 63)))
                (EXIT
                 (|error|
                  "use cyclicEqual? to test equality on cyclic trees"))))))
            (EXIT
             (COND ((QEQCAR |t1| 1) (QEQCAR |t2| 1)) ((QEQCAR |t2| 1) NIL)
                   (#6='T
                    (SEQ
                     (EXIT
                      (SEQ
                       (COND
                        ((SPADCALL (SPADCALL |t1| (QREFELT $ 17))
                                   (SPADCALL |t2| (QREFELT $ 17))
                                   (QREFELT $ 18))
                         (SEQ
                          (LETT |c1| (SPADCALL |t1| (QREFELT $ 12))
                                . #7=(|TREE;equal?|))
                          (LETT |c2| (SPADCALL |t2| (QREFELT $ 12)) . #7#)
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |c1| |c2| (QREFELT $ 64)))
                             (PROGN (LETT #4# NIL . #7#) (GO #8=#:G292)))))))
                        (#6# (EXIT NIL)))
                       (SEQ (LETT |y| NIL . #7#) (LETT #3# |c2| . #7#)
                            (LETT |x| NIL . #7#) (LETT #2# |c1| . #7#) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |x| (CAR #2#) . #7#) NIL)
                                  (ATOM #3#)
                                  (PROGN (LETT |y| (CAR #3#) . #7#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL
                                 (|TREE;equal?| |x| |y| |ot1| |ot2| (+ |k| 1)
                                  $))
                                (PROGN (LETT #1# NIL . #7#) (GO #9=#:G294))))))
                            (LETT #2#
                                  (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #7#))
                                  . #7#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT 'T)))
                     #8# (EXIT #4#)))))))
          #9# (EXIT #1#)))) 

(SDEFUN |TREE;#;$Nni;32| ((|t| $) ($ |NonNegativeInteger|))
        (|TREE;treeCount| |t| |t| 0 $)) 

(SDEFUN |TREE;treeCount|
        ((|t| $) (|origTree| $) (|k| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G307 NIL) (#2=#:G306 #3=(|NonNegativeInteger|)) (#4=#:G308 #3#)
          (#5=#:G311 NIL) (|c| NIL))
         (SEQ
          (COND
           ((EQL |k| 5)
            (COND
             ((SPADCALL |origTree| (QREFELT $ 63))
              (EXIT (|error| "# is not defined on cyclic trees"))))))
          (EXIT
           (COND ((QEQCAR |t| 1) 0)
                 (#6='T
                  (+ 1
                     (PROGN
                      (LETT #1# NIL . #7=(|TREE;treeCount|))
                      (SEQ (LETT |c| NIL . #7#)
                           (LETT #5# (SPADCALL |t| (QREFELT $ 12)) . #7#) G190
                           (COND
                            ((OR (ATOM #5#)
                                 (PROGN (LETT |c| (CAR #5#) . #7#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #4#
                                    (|TREE;treeCount| |c| |origTree| (+ |k| 1)
                                     $)
                                    . #7#)
                              (COND (#1# (LETT #2# (+ #2# #4#) . #7#))
                                    ('T
                                     (PROGN
                                      (LETT #2# #4# . #7#)
                                      (LETT #1# 'T . #7#)))))))
                           (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#1# #2#) (#6# 0)))))))))) 

(SDEFUN |TREE;copy;2$;34| ((|t| $) ($ $)) (|TREE;copy1| |t| |t| 0 $)) 

(SDEFUN |TREE;copy1| ((|t| $) (|origTree| $) (|k| |Integer|) ($ $))
        (SPROG ((#1=#:G321 NIL) (|x| NIL) (#2=#:G320 NIL))
               (SEQ
                (COND
                 ((EQL |k| 5)
                  (COND
                   ((SPADCALL |origTree| (QREFELT $ 63))
                    (EXIT (|error| "use cyclicCopy to copy a cyclic tree"))))))
                (EXIT
                 (COND ((QEQCAR |t| 1) |t|)
                       ((SPADCALL (SPADCALL |t| (QREFELT $ 12)) (QREFELT $ 38))
                        (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                                  (QREFELT $ 25)))
                       ('T
                        (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                                  (PROGN
                                   (LETT #2# NIL . #3=(|TREE;copy1|))
                                   (SEQ (LETT |x| NIL . #3#)
                                        (LETT #1# (SPADCALL |t| (QREFELT $ 12))
                                              . #3#)
                                        G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |x| (CAR #1#) . #3#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (|TREE;copy1| |x| |origTree|
                                                  (+ |k| 1) $)
                                                 #2#)
                                                . #3#)))
                                        (LETT #1# (CDR #1#) . #3#) (GO G190)
                                        G191 (EXIT (NREVERSE #2#))))
                                  (QREFELT $ 23)))))))) 

(SDEFUN |TREE;coerce;$Of;36| ((|t| $) ($ |OutputForm|))
        (|TREE;coerce1| |t| (SPADCALL (QREFELT $ 46))
         (SPADCALL |t| (QREFELT $ 66)) $)) 

(SDEFUN |TREE;coerce1|
        ((|t| $) (|parents| |List| $) (|pl| |List| $) ($ |OutputForm|))
        (SPROG
         ((#1=#:G332 NIL) (|br| NIL) (#2=#:G331 NIL)
          (|nodeForm| (|OutputForm|)) (|k| (|Integer|)))
         (SEQ
          (COND ((QEQCAR |t| 1) (SPADCALL NIL (QREFELT $ 69)))
                ((|TREE;eqMember?| |t| |parents| $)
                 (|TREE;multipleOverbar| (SPADCALL "." (QREFELT $ 71))
                  (|TREE;eqMemberIndex| |t| |pl| 0 $) |pl| $))
                ((SPADCALL (SPADCALL |t| (QREFELT $ 12)) (QREFELT $ 38))
                 (SPADCALL (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 72)))
                ('T
                 (SEQ
                  (LETT |nodeForm|
                        (SPADCALL (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 72))
                        . #3=(|TREE;coerce1|))
                  (SEQ (LETT |k| (|TREE;eqMemberIndex| |t| |pl| 0 $) . #3#)
                       (EXIT
                        (COND
                         ((SPADCALL |k| 0 (QREFELT $ 33))
                          (LETT |nodeForm|
                                (|TREE;multipleOverbar| |nodeForm| |k| |pl| $)
                                . #3#)))))
                  (EXIT
                   (SPADCALL |nodeForm|
                             (PROGN
                              (LETT #2# NIL . #3#)
                              (SEQ (LETT |br| NIL . #3#)
                                   (LETT #1# (SPADCALL |t| (QREFELT $ 12))
                                         . #3#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |br| (CAR #1#) . #3#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (|TREE;coerce1| |br|
                                             (SPADCALL |t| |parents|
                                                       (QREFELT $ 51))
                                             |pl| $)
                                            #2#)
                                           . #3#)))
                                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT $ 73))))))))) 

(SDEFUN |TREE;multipleOverbar|
        ((|x| |OutputForm|) (|k| |Integer|) (|pl| |List| $) ($ |OutputForm|))
        (SPROG ((|c| (|Character|)) (|s| (|String|)))
               (SEQ
                (COND ((< |k| 1) |x|)
                      ((EQL (SPADCALL |pl| (QREFELT $ 74)) 1)
                       (SPADCALL |x| (QREFELT $ 75)))
                      ('T
                       (SEQ
                        (LETT |s| "abcdefghijklmnopqrstuvwxyz"
                              . #1=(|TREE;multipleOverbar|))
                        (LETT |c|
                              (SPADCALL |s| (+ 1 (REM (- |k| 1) 26))
                                        (QREFELT $ 77))
                              . #1#)
                        (EXIT
                         (SPADCALL (SPADCALL |c| (QREFELT $ 78)) |x|
                                   (QREFELT $ 79))))))))) 

(SDEFUN |TREE;cyclic?;$B;39| ((|t| $) ($ |Boolean|))
        (|TREE;cyclic2?| |t| (SPADCALL (QREFELT $ 46)) $)) 

(SDEFUN |TREE;cyclic2?| ((|x| $) (|parents| |List| $) ($ |Boolean|))
        (SPROG ((#1=#:G345 NIL) (#2=#:G346 NIL) (#3=#:G347 NIL) (|y| NIL))
               (SEQ
                (EXIT
                 (COND ((SPADCALL |x| (QREFELT $ 9)) NIL)
                       ((|TREE;eqMember?| |x| |parents| $) 'T)
                       ('T
                        (SEQ
                         (SEQ
                          (EXIT
                           (SEQ (LETT |y| NIL . #4=(|TREE;cyclic2?|))
                                (LETT #3# (SPADCALL |x| (QREFELT $ 12)) . #4#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |y| (CAR #3#) . #4#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((|TREE;cyclic2?| |y|
                                     (SPADCALL |x| |parents| (QREFELT $ 51)) $)
                                    (PROGN
                                     (LETT #1#
                                           (PROGN
                                            (LETT #2# 'T . #4#)
                                            (GO #5=#:G344))
                                           . #4#)
                                     (GO #6=#:G340))))))
                                (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                                (EXIT NIL)))
                          #6# (EXIT #1#))
                         (EXIT NIL)))))
                #5# (EXIT #2#)))) 

(SDEFUN |TREE;cyclicCopy;2$;41| ((|t| $) ($ $))
        (|TREE;cyclicCopy2| |t| (SPADCALL |t| (QREFELT $ 80)) $)) 

(SDEFUN |TREE;cyclicCopy2| ((|t| $) (|cycles| |List| $) ($ $))
        (SPROG ((#1=#:G353 NIL) (|c| NIL) (#2=#:G352 NIL))
               (SEQ
                (COND
                 ((|TREE;eqMember?| |t| |cycles| $)
                  (|TREE;copyCycle2| |t| |cycles| $))
                 ('T
                  (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                            (PROGN
                             (LETT #2# NIL . #3=(|TREE;cyclicCopy2|))
                             (SEQ (LETT |c| NIL . #3#)
                                  (LETT #1# (SPADCALL |t| (QREFELT $ 12))
                                        . #3#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (|TREE;cyclicCopy2| |c| |cycles| $)
                                           #2#)
                                          . #3#)))
                                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            (QREFELT $ 23))))))) 

(SDEFUN |TREE;copyCycle2| ((|cycle| $) (|cycleList| |List| $) ($ $))
        (SPROG ((#1=#:G358 NIL) (|c| NIL) (#2=#:G357 NIL) (|newCycle| ($)))
               (SEQ
                (LETT |newCycle|
                      (SPADCALL (SPADCALL |cycle| (QREFELT $ 17)) NIL
                                (QREFELT $ 23))
                      . #3=(|TREE;copyCycle2|))
                (SPADCALL |newCycle|
                          (PROGN
                           (LETT #2# NIL . #3#)
                           (SEQ (LETT |c| NIL . #3#)
                                (LETT #1# (SPADCALL |cycle| (QREFELT $ 12))
                                      . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (|TREE;copyCycle4| |c| |cycle|
                                          |newCycle| |cycleList| $)
                                         #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 13))
                (EXIT |newCycle|)))) 

(SDEFUN |TREE;copyCycle4|
        ((|t| $) (|cycle| $) (|newCycle| $) (|cycleList| |List| $) ($ $))
        (SPROG ((#1=#:G365 NIL) (|c| NIL) (#2=#:G364 NIL))
               (SEQ
                (COND
                 ((SPADCALL |cycle| (QREFELT $ 9)) (SPADCALL (QREFELT $ 10)))
                 ((SPADCALL |t| |cycle| (QREFELT $ 82)) |newCycle|)
                 ((|TREE;eqMember?| |t| |cycleList| $)
                  (|TREE;copyCycle2| |t| |cycleList| $))
                 ('T
                  (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                            (PROGN
                             (LETT #2# NIL . #3=(|TREE;copyCycle4|))
                             (SEQ (LETT |c| NIL . #3#)
                                  (LETT #1# (SPADCALL |t| (QREFELT $ 12))
                                        . #3#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (|TREE;copyCycle4| |c| |cycle|
                                            |newCycle| |cycleList| $)
                                           #2#)
                                          . #3#)))
                                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            (QREFELT $ 23))))))) 

(SDEFUN |TREE;cyclicEntries;$L;45| ((|t| $) ($ |List| $))
        (|TREE;cyclicEntries3| |t| (SPADCALL (QREFELT $ 46))
         (SPADCALL (QREFELT $ 46)) $)) 

(SDEFUN |TREE;cyclicEntries3|
        ((|t| $) (|parents| |List| $) (|cl| |List| $) ($ |List| $))
        (SPROG ((#1=#:G372 NIL) (|y| NIL))
               (SEQ
                (COND ((SPADCALL |t| (QREFELT $ 9)) |cl|)
                      ((|TREE;eqMember?| |t| |parents| $)
                       (|TREE;insert| |t| |cl| $))
                      ('T
                       (SEQ
                        (LETT |parents| (SPADCALL |t| |parents| (QREFELT $ 51))
                              . #2=(|TREE;cyclicEntries3|))
                        (SEQ (LETT |y| NIL . #2#)
                             (LETT #1# (SPADCALL |t| (QREFELT $ 12)) . #2#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |y| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |cl|
                                     (|TREE;cyclicEntries3| |t| |parents| |cl|
                                      $)
                                     . #2#)))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |cl|))))))) 

(SDEFUN |TREE;cyclicEqual?;2$B;47| ((|t1| $) (|t2| $) ($ |Boolean|))
        (SPROG ((|cp2| #1=(|List| $)) (|cp1| #1#))
               (SEQ
                (LETT |cp1| (SPADCALL |t1| (QREFELT $ 66))
                      . #2=(|TREE;cyclicEqual?;2$B;47|))
                (LETT |cp2| (SPADCALL |t2| (QREFELT $ 66)) . #2#)
                (COND
                 ((OR
                   (SPADCALL (SPADCALL |cp1| (QREFELT $ 74))
                             (SPADCALL |cp2| (QREFELT $ 74)) (QREFELT $ 83))
                   (SPADCALL |cp1| (QREFELT $ 38)))
                  (EXIT (SPADCALL |t1| |t2| (QREFELT $ 31)))))
                (EXIT (|TREE;cyclicEqual4?| |t1| |t2| |cp1| |cp2| $))))) 

(SDEFUN |TREE;cyclicEqual4?|
        ((|t1| $) (|t2| $) (|cp1| |List| $) (|cp2| |List| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G387 NIL) (#2=#:G388 NIL) (|x| NIL) (#3=#:G389 NIL) (|y| NIL)
          (|k| (|Integer|)))
         (SEQ
          (EXIT
           (COND ((QEQCAR |t1| 1) (QEQCAR |t2| 1)) ((QEQCAR |t2| 1) NIL)
                 (#4='T
                  (COND
                   ((SPADCALL 0
                              (LETT |k| (|TREE;eqMemberIndex| |t1| |cp1| 0 $)
                                    . #5=(|TREE;cyclicEqual4?|))
                              (QREFELT $ 83))
                    (SPADCALL |t2| (SPADCALL |cp2| |k| (QREFELT $ 85))
                              (QREFELT $ 82)))
                   ((SPADCALL (SPADCALL |t1| (QREFELT $ 17))
                              (SPADCALL |t2| (QREFELT $ 17)) (QREFELT $ 86))
                    NIL)
                   (#4#
                    (SEQ
                     (SEQ (LETT |y| NIL . #5#)
                          (LETT #3# (SPADCALL |t2| (QREFELT $ 12)) . #5#)
                          (LETT |x| NIL . #5#)
                          (LETT #2# (SPADCALL |t1| (QREFELT $ 12)) . #5#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |x| (CAR #2#) . #5#) NIL)
                                (ATOM #3#)
                                (PROGN (LETT |y| (CAR #3#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL
                               (|TREE;cyclicEqual4?| |x| |y| |cp1| |cp2| $))
                              (PROGN (LETT #1# NIL . #5#) (GO #6=#:G386))))))
                          (LETT #2#
                                (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #5#))
                                . #5#)
                          (GO G190) G191 (EXIT NIL))
                     (EXIT 'T)))))))
          #6# (EXIT #1#)))) 

(SDEFUN |TREE;cyclicParents;$L;49| ((|t| $) ($ |List| $))
        (|TREE;cyclicParents3| |t| (SPADCALL (QREFELT $ 46))
         (SPADCALL (QREFELT $ 46)) $)) 

(SDEFUN |TREE;cyclicParents3|
        ((|x| $) (|parents| |List| $) (|pl| |List| $) ($ |List| $))
        (SPROG
         ((#1=#:G401 NIL) (|y| NIL) (|cycleMembers| (|List| $)) (#2=#:G400 NIL)
          (#3=#:G399 NIL))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 9)) |pl|)
                ((|TREE;eqMember?| |x| |parents| $)
                 (SEQ
                  (LETT |cycleMembers|
                        (PROGN
                         (LETT #3# NIL . #4=(|TREE;cyclicParents3|))
                         (SEQ (LETT |y| NIL . #4#) (LETT #2# |parents| . #4#)
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |y| (CAR #2#) . #4#) NIL)
                                    (NULL
                                     (NULL (SPADCALL |x| |y| (QREFELT $ 82)))))
                                (GO G191)))
                              (SEQ (EXIT (LETT #3# (CONS |y| #3#) . #4#)))
                              (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #4#)
                  (EXIT
                   (|TREE;eqUnion| (SPADCALL |x| |cycleMembers| (QREFELT $ 51))
                    |pl| $))))
                ('T
                 (SEQ
                  (LETT |parents| (SPADCALL |x| |parents| (QREFELT $ 51))
                        . #4#)
                  (SEQ (LETT |y| NIL . #4#)
                       (LETT #1# (SPADCALL |x| (QREFELT $ 12)) . #4#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |pl|
                               (|TREE;cyclicParents3| |y| |parents| |pl| $)
                               . #4#)))
                       (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT |pl|))))))) 

(SDEFUN |TREE;insert| ((|x| $) (|l| |List| $) ($ |List| $))
        (COND ((|TREE;eqMember?| |x| |l| $) |l|)
              ('T (SPADCALL |x| |l| (QREFELT $ 51))))) 

(SDEFUN |TREE;lastNode| ((|l| |List| $) ($ |List| $))
        (SEQ
         (COND
          ((SPADCALL |l| (QREFELT $ 38))
           (|error| "empty tree has no last node"))
          ('T
           (SEQ
            (SEQ G190
                 (COND
                  ((NULL
                    (NULL
                     (SPADCALL (SPADCALL |l| (QREFELT $ 87)) (QREFELT $ 38))))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |l| (SPADCALL |l| (QREFELT $ 87)) |TREE;lastNode|)))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT |l|)))))) 

(SDEFUN |TREE;eqMember?| ((|y| $) (|l| |List| $) ($ |Boolean|))
        (SPROG ((#1=#:G415 NIL) (#2=#:G416 NIL) (#3=#:G417 NIL) (|x| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |x| NIL . #4=(|TREE;eqMember?|))
                         (LETT #3# |l| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |x| |y| (QREFELT $ 82))
                             (PROGN
                              (LETT #1#
                                    (PROGN (LETT #2# 'T . #4#) (GO #5=#:G414))
                                    . #4#)
                              (GO #6=#:G412))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT NIL)))
                #5# (EXIT #2#)))) 

(SDEFUN |TREE;eqMemberIndex|
        ((|x| $) (|l| |List| $) (|k| |Integer|) ($ |Integer|))
        (SEQ
         (COND ((SPADCALL |l| (QREFELT $ 38)) |k|)
               (#1='T
                (SEQ (LETT |k| (+ |k| 1) |TREE;eqMemberIndex|)
                     (EXIT
                      (COND
                       ((SPADCALL |x| (SPADCALL |l| (QREFELT $ 88))
                                  (QREFELT $ 82))
                        |k|)
                       (#1#
                        (|TREE;eqMemberIndex| |x| (SPADCALL |l| (QREFELT $ 87))
                         |k| $))))))))) 

(SDEFUN |TREE;eqUnion| ((|u| |List| $) (|v| |List| $) ($ |List| $))
        (SPROG ((|newV| (|List| $)) (|x| ($)))
               (SEQ
                (COND ((SPADCALL |u| (QREFELT $ 38)) |v|)
                      (#1='T
                       (SEQ
                        (LETT |x| (SPADCALL |u| (QREFELT $ 88))
                              . #2=(|TREE;eqUnion|))
                        (LETT |newV|
                              (COND ((|TREE;eqMember?| |x| |v| $) |v|)
                                    (#1# (SPADCALL |x| |v| (QREFELT $ 51))))
                              . #2#)
                        (EXIT
                         (|TREE;eqUnion| (SPADCALL |u| (QREFELT $ 87)) |newV|
                          $)))))))) 

(DECLAIM (NOTINLINE |Tree;|)) 

(DEFUN |Tree| (#1=#:G428)
  (SPROG NIL
         (PROG (#2=#:G429)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Tree|)
                                               '|domainEqualList|)
                    . #3=(|Tree|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Tree;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Tree|)))))))))) 

(DEFUN |Tree;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G425 NIL) (#2=#:G426 NIL) (#3=#:G427 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #4=(|Tree|))
    (LETT |dv$| (LIST '|Tree| DV$1) . #4#)
    (LETT $ (GETREFV 93) . #4#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #4#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #3#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))
                                              . #4#)
                                        (OR #2# #3#)
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #4#)
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #3#))))
                    . #4#))
    (|haddProp| |$ConstructorCache| '|Tree| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 64))
    (AND #2# (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 128))
    (AND (OR (AND #2# (|HasCategory| $ '(|finiteAggregate|))) #3#)
         (|augmentPredVector| $ 256))
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 512))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7
              (|Union|
               (|:| |node|
                    (|Record| (|:| |value| |#1|) (|:| |args| (|List| $))))
               (|:| |empty| "empty")))
    $))) 

(MAKEPROP '|Tree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|)
              |TREE;empty?;$B;1| |TREE;empty;$;2| (|List| $)
              |TREE;children;$L;3| |TREE;setchildren!;$L$;4|
              |TREE;setvalue!;$2S;5| (|NonNegativeInteger|)
              |TREE;count;S$Nni;6| |TREE;value;$S;13| (0 . =) (|Mapping| 8 6)
              |TREE;count;M$Nni;7| (|Mapping| 6 6) |TREE;map;M2$;8|
              |TREE;tree;SL$;10| |TREE;map!;M2$;9| |TREE;tree;S$;11| (|List| 6)
              |TREE;tree;L$;12| (|List| $$) (6 . |member?|)
              |TREE;child?;2$B;14| |TREE;=;2$B;30| (|Integer|) (12 . >)
              |TREE;distance;2$I;16| |TREE;node?;2$B;17| (|Mapping| 8 $$)
              (18 . |any?|) (24 . |empty?|) |TREE;leaf?;$B;18|
              |TREE;leaves;$L;19| (29 . |append|) |TREE;#;$Nni;32|
              |TREE;less?;$NniB;20| (35 . >) |TREE;more?;$NniB;21|
              (41 . |empty|) |TREE;nodes;$L;22| (|List| 28) (45 . =)
              (51 . |append|) (57 . |cons|) |TREE;size?;$NniB;23|
              |TREE;any?;M$B;24| |TREE;every?;M$B;25| |TREE;member?;S$B;26|
              |TREE;parts;$L;28| |TREE;members;$L;27| (|List| 26) (63 . =)
              (|HashState|) (69 . |hashUpdate!|) |TREE;hashUpdate!;Hs$Hs;29|
              |TREE;cyclic?;$B;39| (75 . =) |TREE;copy;2$;34|
              |TREE;cyclicParents;$L;49| (|OutputForm|) |TREE;coerce;$Of;36|
              (81 . |coerce|) (|String|) (86 . |message|) (91 . |coerce|)
              (96 . |prefix|) (102 . |#|) (107 . |overbar|) (|Character|)
              (112 . |elt|) (118 . |coerce|) (123 . |overlabel|)
              |TREE;cyclicEntries;$L;45| |TREE;cyclicCopy;2$;41| (129 . |eq?|)
              (135 . ~=) |TREE;cyclicEqual?;2$B;47| (141 . |elt|) (147 . ~=)
              (153 . |rest|) (158 . |first|) (|List| 90) (|Equation| 6)
              '"value" (|SingleInteger|))
           '#(~= 163 |value| 169 |tree| 174 |size?| 190 |setvalue!| 196
              |setelt!| 202 |setchildren!| 209 |sample| 215 |parts| 219 |nodes|
              224 |node?| 229 |more?| 235 |members| 241 |member?| 246 |map!|
              252 |map| 258 |less?| 264 |leaves| 270 |leaf?| 275 |latex| 280
              |hashUpdate!| 285 |hash| 291 |every?| 296 |eval| 302 |eq?| 328
              |empty?| 334 |empty| 339 |elt| 343 |distance| 349 |cyclicParents|
              355 |cyclicEqual?| 360 |cyclicEntries| 366 |cyclicCopy| 371
              |cyclic?| 376 |count| 381 |copy| 393 |coerce| 398 |children| 403
              |child?| 408 |any?| 414 = 420 |#| 426)
           'NIL
           (CONS (|makeByteWordVec2| 6 '(0 0 0 2 1 0 0 0 2 4 6))
                 (CONS
                  '#(|RecursiveAggregate&| |HomogeneousAggregate&| |Aggregate&|
                     |Evalable&| |SetCategory&| NIL NIL NIL |InnerEvalable&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|RecursiveAggregate| 6) (|HomogeneousAggregate| 6)
                      (|Aggregate|) (|Evalable| 6) (|SetCategory|) (|Type|)
                      (|shallowlyMutable|) (|finiteAggregate|)
                      (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 67))
                   (|makeByteWordVec2| 92
                                       '(2 6 8 0 0 18 2 28 8 2 0 29 2 32 8 0 0
                                         33 2 28 8 36 0 37 1 28 8 0 38 2 26 0 0
                                         0 41 2 15 8 0 0 44 0 28 0 46 2 48 8 0
                                         0 49 2 28 0 0 0 50 2 28 0 2 0 51 2 58
                                         8 0 0 59 2 6 60 60 0 61 2 28 8 0 0 64
                                         1 26 67 0 69 1 67 0 70 71 1 6 67 0 72
                                         2 67 0 0 11 73 1 28 15 0 74 1 67 0 0
                                         75 2 70 76 0 32 77 1 76 67 0 78 2 67 0
                                         0 0 79 2 0 8 0 0 82 2 32 8 0 0 83 2 28
                                         2 0 32 85 2 6 8 0 0 86 1 28 0 0 87 1
                                         28 2 0 88 2 9 8 0 0 1 1 0 6 0 17 1 0 0
                                         26 27 1 0 0 6 25 2 0 0 6 11 23 2 0 8 0
                                         15 52 2 10 6 0 6 14 3 10 6 0 91 6 1 2
                                         10 0 0 11 13 0 0 0 1 1 7 26 0 56 1 0
                                         11 0 47 2 3 8 0 0 35 2 0 8 0 15 45 1 7
                                         26 0 57 2 8 8 6 0 55 2 10 0 21 0 24 2
                                         0 0 21 0 22 2 0 8 0 15 43 1 0 26 0 40
                                         1 0 8 0 39 1 1 70 0 1 2 1 60 60 0 62 1
                                         1 92 0 1 2 7 8 19 0 54 3 2 0 0 26 26 1
                                         3 2 0 0 6 6 1 2 2 0 0 89 1 2 2 0 0 90
                                         1 2 0 8 0 0 82 1 0 8 0 9 0 0 0 10 2 0
                                         6 0 91 1 2 0 32 0 0 34 1 0 11 0 66 2 0
                                         8 0 0 84 1 0 11 0 80 1 0 0 0 81 1 0 8
                                         0 63 2 8 15 6 0 16 2 7 15 19 0 20 1 0
                                         0 0 65 1 5 67 0 68 1 0 11 0 12 2 3 8 0
                                         0 30 2 7 8 19 0 53 2 9 8 0 0 31 1 7 15
                                         0 42)))))
           '|lookupComplete|)) 
