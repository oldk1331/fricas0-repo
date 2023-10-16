
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
         ((|i| #1=(|NonNegativeInteger|)) (#2=#:G165 NIL) (#3=#:G164 #1#)
          (#4=#:G166 #1#) (#5=#:G171 NIL) (|c| NIL))
         (SEQ
          (COND ((QEQCAR |t| 1) 0)
                (#6='T
                 (SEQ
                  (LETT |i|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |c| NIL)
                              (LETT #5# (SPADCALL |t| (QREFELT $ 12))) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |c| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4# (SPADCALL |n| |c| (QREFELT $ 16)))
                                 (COND (#2# (LETT #3# (+ #3# #4#)))
                                       ('T
                                        (PROGN
                                         (LETT #3# #4#)
                                         (LETT #2# 'T)))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (COND (#2# #3#) (#6# 0))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |t| (QREFELT $ 17)) |n|
                               (QREFELT $ 18))
                     (+ |i| 1))
                    (#6# |i|))))))))) 

(SDEFUN |TREE;count;M$Nni;7|
        ((|fn| |Mapping| (|Boolean|) S) (|t| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|i| #1=(|NonNegativeInteger|)) (#2=#:G173 NIL) (#3=#:G172 #1#)
          (#4=#:G174 #1#) (#5=#:G178 NIL) (|c| NIL))
         (SEQ
          (COND ((QEQCAR |t| 1) 0)
                (#6='T
                 (SEQ
                  (LETT |i|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |c| NIL)
                              (LETT #5# (SPADCALL |t| (QREFELT $ 12))) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |c| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4# (SPADCALL |fn| |c| (QREFELT $ 20)))
                                 (COND (#2# (LETT #3# (+ #3# #4#)))
                                       ('T
                                        (PROGN
                                         (LETT #3# #4#)
                                         (LETT #2# 'T)))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (COND (#2# #3#) (#6# 0))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|) (+ |i| 1))
                    (#6# |i|))))))))) 

(SDEFUN |TREE;map;M2$;8| ((|fn| |Mapping| S S) (|t| $) ($ $))
        (SPROG ((#1=#:G183 NIL) (|c| NIL) (#2=#:G182 NIL))
               (SEQ
                (COND ((QEQCAR |t| 1) |t|)
                      ('T
                       (SPADCALL (SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|)
                                 (PROGN
                                  (LETT #2# NIL)
                                  (SEQ (LETT |c| NIL)
                                       (LETT #1# (SPADCALL |t| (QREFELT $ 12)))
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN (LETT |c| (CAR #1#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL |fn| |c|
                                                          (QREFELT $ 22))
                                                #2#))))
                                       (LETT #1# (CDR #1#)) (GO G190) G191
                                       (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 23))))))) 

(SDEFUN |TREE;map!;M2$;9| ((|fn| |Mapping| S S) (|t| $) ($ $))
        (SPROG ((#1=#:G188 NIL) (|c| NIL))
               (SEQ
                (COND ((QEQCAR |t| 1) |t|)
                      ('T
                       (SEQ
                        (SPADCALL |t|
                                  (SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|)
                                  (QREFELT $ 14))
                        (SEQ (LETT |c| NIL)
                             (LETT #1# (SPADCALL |t| (QREFELT $ 12))) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ (EXIT (SPADCALL |fn| |c| (QREFELT $ 24))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT |t|))))))) 

(SDEFUN |TREE;tree;SL$;10| ((|s| S) (|lt| |List| $) ($ $))
        (CONS 0 (CONS |s| |lt|))) 

(SDEFUN |TREE;tree;S$;11| ((|s| S) ($ $)) (CONS 0 (CONS |s| NIL))) 

(SDEFUN |TREE;tree;L$;12| ((|ls| |List| S) ($ $))
        (SPROG ((#1=#:G195 NIL) (|s| NIL) (#2=#:G194 NIL))
               (SEQ
                (COND ((NULL |ls|) (SPADCALL (QREFELT $ 10)))
                      ('T
                       (SPADCALL (|SPADfirst| |ls|)
                                 (PROGN
                                  (LETT #2# NIL)
                                  (SEQ (LETT |s| NIL) (LETT #1# (CDR |ls|))
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN (LETT |s| (CAR #1#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL |s| (QREFELT $ 25))
                                                #2#))))
                                       (LETT #1# (CDR #1#)) (GO G190) G191
                                       (EXIT (NREVERSE #2#))))
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
         ((#2=#:G203 NIL) (#3=#:G202 #1#) (#4=#:G204 #1#) (#5=#:G209 NIL)
          (#6=#:G104 NIL) (|u| (|List| #1#)) (|n| #1#) (#7=#:G208 NIL)
          (|t| NIL) (#8=#:G207 NIL))
         (SEQ
          (COND ((SPADCALL |t1| |t2| (QREFELT $ 31)) 0) ((QEQCAR |t2| 1) -1)
                (#9='T
                 (SEQ
                  (LETT |u|
                        (PROGN
                         (LETT #8# NIL)
                         (SEQ (LETT |t| NIL)
                              (LETT #7# (SPADCALL |t2| (QREFELT $ 12))) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |t| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((>= (LETT |n| (|TREE;distance1| |t1| |t| $))
                                      0)
                                  (LETT #8# (CONS |n| #8#))))))
                              (LETT #7# (CDR #7#)) (GO G190) G191
                              (EXIT (NREVERSE #8#)))))
                  (EXIT
                   (COND
                    ((SPADCALL (LENGTH |u|) 0 (QREFELT $ 33))
                     (+ 1
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT #6# NIL) (LETT #5# |u|) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT #6# (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4# #6#)
                                 (COND (#2# (LETT #3# (MIN #3# #4#)))
                                       ('T
                                        (PROGN
                                         (LETT #3# #4#)
                                         (LETT #2# 'T)))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (COND (#2# #3#) (#9# (|IdentityError| '|min|))))))
                    (#9# -1))))))))) 

(SDEFUN |TREE;distance;2$I;16| ((|t1| $) (|t2| $) ($ |Integer|))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (|TREE;distance1| |t1| |t2| $))
                    (EXIT
                     (COND ((>= |n| 0) |n|)
                           ('T (|TREE;distance1| |t2| |t1| $))))))) 

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
          (LETT |t1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |t1| |t| (QREFELT $ 35)))))) 

(SDEFUN |TREE;leaf?;$B;18| ((|t| $) ($ |Boolean|))
        (COND ((QEQCAR |t| 1) NIL)
              ('T (SPADCALL (SPADCALL |t| (QREFELT $ 12)) (QREFELT $ 38))))) 

(SDEFUN |TREE;less?;$NniB;19|
        ((|t| $) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (< (SPADCALL |t| (QREFELT $ 40)) |n|)) 

(SDEFUN |TREE;more?;$NniB;20|
        ((|t| $) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (SPADCALL (SPADCALL |t| (QREFELT $ 40)) |n| (QREFELT $ 42))) 

(SDEFUN |TREE;size?;$NniB;21|
        ((|t| $) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (EQL (SPADCALL |t| (QREFELT $ 40)) |n|)) 

(SDEFUN |TREE;any?;M$B;22|
        ((|fn| |Mapping| #1=(|Boolean|) S) (|t| $) ($ . #1#))
        (SPROG ((#2=#:G232 NIL) (#3=#:G233 NIL) (|c| NIL))
               (SEQ
                (EXIT
                 (COND ((QEQCAR |t| 1) NIL)
                       ((SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|) 'T)
                       ('T
                        (SEQ
                         (SEQ (LETT |c| NIL)
                              (LETT #3# (SPADCALL |t| (QREFELT $ 12))) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |c| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |fn| |c| (QREFELT $ 45))
                                  (PROGN (LETT #2# 'T) (GO #4=#:G231))))))
                              (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                         (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |TREE;every?;M$B;23|
        ((|fn| |Mapping| #1=(|Boolean|) S) (|t| $) ($ . #1#))
        (SPROG ((#2=#:G240 NIL) (#3=#:G241 NIL) (|c| NIL))
               (SEQ
                (EXIT
                 (COND ((QEQCAR |t| 1) 'T)
                       ((NULL (SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|))
                        NIL)
                       ('T
                        (SEQ
                         (SEQ (LETT |c| NIL)
                              (LETT #3# (SPADCALL |t| (QREFELT $ 12))) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |c| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((NULL (SPADCALL |fn| |c| (QREFELT $ 46)))
                                  (PROGN (LETT #2# NIL) (GO #4=#:G239))))))
                              (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                         (EXIT 'T)))))
                #4# (EXIT #2#)))) 

(SDEFUN |TREE;member?;S$B;24| ((|n| S) (|t| $) ($ |Boolean|))
        (SPROG NIL
               (COND ((QEQCAR |t| 1) NIL)
                     ((SPADCALL |n| (SPADCALL |t| (QREFELT $ 17))
                                (QREFELT $ 18))
                      'T)
                     ('T
                      (SPADCALL (CONS #'|TREE;member?;S$B;24!0| (VECTOR $ |n|))
                                (SPADCALL |t| (QREFELT $ 12))
                                (QREFELT $ 37)))))) 

(SDEFUN |TREE;member?;S$B;24!0| ((|c| NIL) ($$ NIL))
        (PROG (|n| $)
          (LETT |n| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |n| |c| (QREFELT $ 47)))))) 

(SDEFUN |TREE;members;$L;25| ((|t| $) ($ |List| S))
        (SPADCALL |t| (QREFELT $ 48))) 

(SDEFUN |TREE;parts;$L;26| ((|t| $) ($ |List| S))
        (SPROG
         ((#1=#:G253 NIL) (#2=#:G252 #3=(|List| S)) (#4=#:G254 #3#)
          (#5=#:G259 NIL) (#6=#:G105 NIL) (|u| (|List| #3#)) (#7=#:G258 NIL)
          (|c| NIL) (#8=#:G257 NIL))
         (SEQ
          (COND ((QEQCAR |t| 1) NIL)
                (#9='T
                 (SEQ
                  (LETT |u|
                        (PROGN
                         (LETT #8# NIL)
                         (SEQ (LETT |c| NIL)
                              (LETT #7# (SPADCALL |t| (QREFELT $ 12))) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |c| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #8#
                                      (CONS (SPADCALL |c| (QREFELT $ 48))
                                            #8#))))
                              (LETT #7# (CDR #7#)) (GO G190) G191
                              (EXIT (NREVERSE #8#)))))
                  (EXIT
                   (COND
                    ((SPADCALL |u| NIL (QREFELT $ 51))
                     (LIST (SPADCALL |t| (QREFELT $ 17))))
                    (#9#
                     (CONS (SPADCALL |t| (QREFELT $ 17))
                           (PROGN
                            (LETT #1# NIL)
                            (SEQ (LETT #6# NIL) (LETT #5# |u|) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT #6# (CAR #5#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #4# #6#)
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #4# (QREFELT $ 52))))
                                     ('T
                                      (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                                 (LETT #5# (CDR #5#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#1# #2#) (#9# NIL))))))))))))) 

(SDEFUN |TREE;hashUpdate!;Hs$Hs;27| ((|s| |HashState|) (|t| $) ($ |HashState|))
        (SPROG ((#1=#:G265 NIL) (|subt| NIL))
               (SEQ
                (COND ((QEQCAR |t| 1) |s|)
                      ('T
                       (SEQ
                        (LETT |s|
                              (SPADCALL |s| (SPADCALL |t| (QREFELT $ 17))
                                        (QREFELT $ 54)))
                        (SEQ (LETT |subt| NIL)
                             (LETT #1# (SPADCALL |t| (QREFELT $ 12))) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |subt| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s|
                                     (SPADCALL |s| |subt| (QREFELT $ 55)))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT |s|))))))) 

(SDEFUN |TREE;=;2$B;28| ((|t1| $) (|t2| $) ($ |Boolean|))
        (|TREE;equal?| |t1| |t2| |t1| |t2| 0 $)) 

(SDEFUN |TREE;equal?|
        ((|t1| $) (|t2| $) (|ot1| $) (|ot2| $) (|k| |Integer|) ($ |Boolean|))
        (SPROG
         ((#1=#:G279 NIL) (#2=#:G280 NIL) (|x| NIL) (#3=#:G281 NIL) (|y| NIL)
          (#4=#:G278 NIL) (|c2| #5=(|List| $)) (|c1| #5#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((EQL |k| 5)
              (COND
               ((OR (SPADCALL |ot1| (QREFELT $ 56))
                    (SPADCALL |ot2| (QREFELT $ 56)))
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
                         (SEQ (LETT |c1| (SPADCALL |t1| (QREFELT $ 12)))
                              (LETT |c2| (SPADCALL |t2| (QREFELT $ 12)))
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |c1| |c2| (QREFELT $ 57)))
                                 (PROGN (LETT #4# NIL) (GO #7=#:G275)))))))
                        (#6# (EXIT NIL)))
                       (SEQ (LETT |y| NIL) (LETT #3# |c2|) (LETT |x| NIL)
                            (LETT #2# |c1|) G190
                            (COND
                             ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL)
                                  (ATOM #3#) (PROGN (LETT |y| (CAR #3#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL
                                 (|TREE;equal?| |x| |y| |ot1| |ot2| (+ |k| 1)
                                  $))
                                (PROGN (LETT #1# NIL) (GO #8=#:G277))))))
                            (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#))))
                            (GO G190) G191 (EXIT NIL))
                       (EXIT 'T)))
                     #7# (EXIT #4#)))))))
          #8# (EXIT #1#)))) 

(SDEFUN |TREE;#;$Nni;30| ((|t| $) ($ |NonNegativeInteger|))
        (|TREE;treeCount| |t| |t| 0 $)) 

(SDEFUN |TREE;treeCount|
        ((|t| $) (|origTree| $) (|k| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G290 NIL) (#2=#:G289 #3=(|NonNegativeInteger|)) (#4=#:G291 #3#)
          (#5=#:G294 NIL) (|c| NIL))
         (SEQ
          (COND
           ((EQL |k| 5)
            (COND
             ((SPADCALL |origTree| (QREFELT $ 56))
              (EXIT (|error| "# is not defined on cyclic trees"))))))
          (EXIT
           (COND ((QEQCAR |t| 1) 0)
                 (#6='T
                  (+ 1
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |c| NIL)
                           (LETT #5# (SPADCALL |t| (QREFELT $ 12))) G190
                           (COND
                            ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #4#
                                    (|TREE;treeCount| |c| |origTree| (+ |k| 1)
                                     $))
                              (COND (#1# (LETT #2# (+ #2# #4#)))
                                    ('T
                                     (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                           (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                      (COND (#1# #2#) (#6# 0)))))))))) 

(SDEFUN |TREE;copy;2$;32| ((|t| $) ($ $)) (|TREE;copy1| |t| |t| 0 $)) 

(SDEFUN |TREE;copy1| ((|t| $) (|origTree| $) (|k| |Integer|) ($ $))
        (SPROG ((#1=#:G304 NIL) (|x| NIL) (#2=#:G303 NIL))
               (SEQ
                (COND
                 ((EQL |k| 5)
                  (COND
                   ((SPADCALL |origTree| (QREFELT $ 56))
                    (EXIT (|error| "use cyclicCopy to copy a cyclic tree"))))))
                (EXIT
                 (COND ((QEQCAR |t| 1) |t|)
                       ((SPADCALL (SPADCALL |t| (QREFELT $ 12)) (QREFELT $ 38))
                        (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                                  (QREFELT $ 25)))
                       ('T
                        (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                                  (PROGN
                                   (LETT #2# NIL)
                                   (SEQ (LETT |x| NIL)
                                        (LETT #1#
                                              (SPADCALL |t| (QREFELT $ 12)))
                                        G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN (LETT |x| (CAR #1#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (|TREE;copy1| |x| |origTree|
                                                  (+ |k| 1) $)
                                                 #2#))))
                                        (LETT #1# (CDR #1#)) (GO G190) G191
                                        (EXIT (NREVERSE #2#))))
                                  (QREFELT $ 23)))))))) 

(SDEFUN |TREE;coerce;$Of;34| ((|t| $) ($ |OutputForm|))
        (|TREE;coerce1| |t| (SPADCALL (QREFELT $ 59))
         (SPADCALL |t| (QREFELT $ 60)) $)) 

(SDEFUN |TREE;coerce1|
        ((|t| $) (|parents| |List| $) (|pl| |List| $) ($ |OutputForm|))
        (SPROG
         ((#1=#:G315 NIL) (|br| NIL) (#2=#:G314 NIL)
          (|nodeForm| (|OutputForm|)) (|k| (|Integer|)))
         (SEQ
          (COND ((QEQCAR |t| 1) (SPADCALL NIL (QREFELT $ 63)))
                ((|TREE;eqMember?| |t| |parents| $)
                 (|TREE;multipleOverbar| (SPADCALL "." (QREFELT $ 65))
                  (|TREE;eqMemberIndex| |t| |pl| 0 $) |pl| $))
                ((SPADCALL (SPADCALL |t| (QREFELT $ 12)) (QREFELT $ 38))
                 (SPADCALL (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 66)))
                ('T
                 (SEQ
                  (LETT |nodeForm|
                        (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                                  (QREFELT $ 66)))
                  (SEQ (LETT |k| (|TREE;eqMemberIndex| |t| |pl| 0 $))
                       (EXIT
                        (COND
                         ((SPADCALL |k| 0 (QREFELT $ 33))
                          (LETT |nodeForm|
                                (|TREE;multipleOverbar| |nodeForm| |k| |pl|
                                 $))))))
                  (EXIT
                   (SPADCALL |nodeForm|
                             (PROGN
                              (LETT #2# NIL)
                              (SEQ (LETT |br| NIL)
                                   (LETT #1# (SPADCALL |t| (QREFELT $ 12)))
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |br| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (|TREE;coerce1| |br|
                                             (SPADCALL |t| |parents|
                                                       (QREFELT $ 67))
                                             |pl| $)
                                            #2#))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT $ 68))))))))) 

(SDEFUN |TREE;multipleOverbar|
        ((|x| |OutputForm|) (|k| |Integer|) (|pl| |List| $) ($ |OutputForm|))
        (SPROG ((|c| (|Character|)) (|s| (|String|)))
               (SEQ
                (COND ((< |k| 1) |x|)
                      ((EQL (SPADCALL |pl| (QREFELT $ 69)) 1)
                       (SPADCALL |x| (QREFELT $ 70)))
                      ('T
                       (SEQ (LETT |s| "abcdefghijklmnopqrstuvwxyz")
                            (LETT |c|
                                  (SPADCALL |s| (+ 1 (REM (- |k| 1) 26))
                                            (QREFELT $ 72)))
                            (EXIT
                             (SPADCALL (SPADCALL |c| (QREFELT $ 73)) |x|
                                       (QREFELT $ 74))))))))) 

(SDEFUN |TREE;cyclic?;$B;37| ((|t| $) ($ |Boolean|))
        (|TREE;cyclic2?| |t| (SPADCALL (QREFELT $ 59)) $)) 

(SDEFUN |TREE;cyclic2?| ((|x| $) (|parents| |List| $) ($ |Boolean|))
        (SPROG ((#1=#:G328 NIL) (#2=#:G329 NIL) (#3=#:G330 NIL) (|y| NIL))
               (SEQ
                (EXIT
                 (COND ((SPADCALL |x| (QREFELT $ 9)) NIL)
                       ((|TREE;eqMember?| |x| |parents| $) 'T)
                       ('T
                        (SEQ
                         (SEQ
                          (EXIT
                           (SEQ (LETT |y| NIL)
                                (LETT #3# (SPADCALL |x| (QREFELT $ 12))) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |y| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((|TREE;cyclic2?| |y|
                                     (SPADCALL |x| |parents| (QREFELT $ 67)) $)
                                    (PROGN
                                     (LETT #1#
                                           (PROGN
                                            (LETT #2# 'T)
                                            (GO #4=#:G327)))
                                     (GO #5=#:G323))))))
                                (LETT #3# (CDR #3#)) (GO G190) G191
                                (EXIT NIL)))
                          #5# (EXIT #1#))
                         (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |TREE;cyclicCopy;2$;39| ((|t| $) ($ $))
        (|TREE;cyclicCopy2| |t| (SPADCALL |t| (QREFELT $ 75)) $)) 

(SDEFUN |TREE;cyclicCopy2| ((|t| $) (|cycles| |List| $) ($ $))
        (SPROG ((#1=#:G336 NIL) (|c| NIL) (#2=#:G335 NIL))
               (SEQ
                (COND
                 ((|TREE;eqMember?| |t| |cycles| $)
                  (|TREE;copyCycle2| |t| |cycles| $))
                 ('T
                  (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |c| NIL)
                                  (LETT #1# (SPADCALL |t| (QREFELT $ 12))) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |c| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (|TREE;cyclicCopy2| |c| |cycles| $)
                                           #2#))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            (QREFELT $ 23))))))) 

(SDEFUN |TREE;copyCycle2| ((|cycle| $) (|cycleList| |List| $) ($ $))
        (SPROG ((#1=#:G341 NIL) (|c| NIL) (#2=#:G340 NIL) (|newCycle| ($)))
               (SEQ
                (LETT |newCycle|
                      (SPADCALL (SPADCALL |cycle| (QREFELT $ 17)) NIL
                                (QREFELT $ 23)))
                (SPADCALL |newCycle|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |c| NIL)
                                (LETT #1# (SPADCALL |cycle| (QREFELT $ 12)))
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |c| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (|TREE;copyCycle4| |c| |cycle|
                                          |newCycle| |cycleList| $)
                                         #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 13))
                (EXIT |newCycle|)))) 

(SDEFUN |TREE;copyCycle4|
        ((|t| $) (|cycle| $) (|newCycle| $) (|cycleList| |List| $) ($ $))
        (SPROG ((#1=#:G348 NIL) (|c| NIL) (#2=#:G347 NIL))
               (SEQ
                (COND
                 ((SPADCALL |cycle| (QREFELT $ 9)) (SPADCALL (QREFELT $ 10)))
                 ((SPADCALL |t| |cycle| (QREFELT $ 77)) |newCycle|)
                 ((|TREE;eqMember?| |t| |cycleList| $)
                  (|TREE;copyCycle2| |t| |cycleList| $))
                 ('T
                  (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |c| NIL)
                                  (LETT #1# (SPADCALL |t| (QREFELT $ 12))) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |c| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (|TREE;copyCycle4| |c| |cycle|
                                            |newCycle| |cycleList| $)
                                           #2#))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            (QREFELT $ 23))))))) 

(SDEFUN |TREE;cyclicEntries;$L;43| ((|t| $) ($ |List| $))
        (|TREE;cyclicEntries3| |t| (SPADCALL (QREFELT $ 59))
         (SPADCALL (QREFELT $ 59)) $)) 

(SDEFUN |TREE;cyclicEntries3|
        ((|t| $) (|parents| |List| $) (|cl| |List| $) ($ |List| $))
        (SPROG ((#1=#:G355 NIL) (|y| NIL))
               (SEQ
                (COND ((SPADCALL |t| (QREFELT $ 9)) |cl|)
                      ((|TREE;eqMember?| |t| |parents| $)
                       (|TREE;insert| |t| |cl| $))
                      ('T
                       (SEQ
                        (LETT |parents|
                              (SPADCALL |t| |parents| (QREFELT $ 67)))
                        (SEQ (LETT |y| NIL)
                             (LETT #1# (SPADCALL |t| (QREFELT $ 12))) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |cl|
                                     (|TREE;cyclicEntries3| |t| |parents| |cl|
                                      $))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT |cl|))))))) 

(SDEFUN |TREE;cyclicEqual?;2$B;45| ((|t1| $) (|t2| $) ($ |Boolean|))
        (SPROG ((|cp2| #1=(|List| $)) (|cp1| #1#))
               (SEQ (LETT |cp1| (SPADCALL |t1| (QREFELT $ 60)))
                    (LETT |cp2| (SPADCALL |t2| (QREFELT $ 60)))
                    (COND
                     ((OR
                       (SPADCALL (SPADCALL |cp1| (QREFELT $ 69))
                                 (SPADCALL |cp2| (QREFELT $ 69))
                                 (QREFELT $ 78))
                       (SPADCALL |cp1| (QREFELT $ 38)))
                      (EXIT (SPADCALL |t1| |t2| (QREFELT $ 31)))))
                    (EXIT (|TREE;cyclicEqual4?| |t1| |t2| |cp1| |cp2| $))))) 

(SDEFUN |TREE;cyclicEqual4?|
        ((|t1| $) (|t2| $) (|cp1| |List| $) (|cp2| |List| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G370 NIL) (#2=#:G371 NIL) (|x| NIL) (#3=#:G372 NIL) (|y| NIL)
          (|k| (|Integer|)))
         (SEQ
          (EXIT
           (COND ((QEQCAR |t1| 1) (QEQCAR |t2| 1)) ((QEQCAR |t2| 1) NIL)
                 (#4='T
                  (COND
                   ((SPADCALL 0
                              (LETT |k| (|TREE;eqMemberIndex| |t1| |cp1| 0 $))
                              (QREFELT $ 78))
                    (SPADCALL |t2| (SPADCALL |cp2| |k| (QREFELT $ 80))
                              (QREFELT $ 77)))
                   ((SPADCALL (SPADCALL |t1| (QREFELT $ 17))
                              (SPADCALL |t2| (QREFELT $ 17)) (QREFELT $ 81))
                    NIL)
                   (#4#
                    (SEQ
                     (SEQ (LETT |y| NIL)
                          (LETT #3# (SPADCALL |t2| (QREFELT $ 12)))
                          (LETT |x| NIL)
                          (LETT #2# (SPADCALL |t1| (QREFELT $ 12))) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL)
                                (ATOM #3#) (PROGN (LETT |y| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL
                               (|TREE;cyclicEqual4?| |x| |y| |cp1| |cp2| $))
                              (PROGN (LETT #1# NIL) (GO #5=#:G369))))))
                          (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#))))
                          (GO G190) G191 (EXIT NIL))
                     (EXIT 'T)))))))
          #5# (EXIT #1#)))) 

(SDEFUN |TREE;cyclicParents;$L;47| ((|t| $) ($ |List| $))
        (|TREE;cyclicParents3| |t| (SPADCALL (QREFELT $ 59))
         (SPADCALL (QREFELT $ 59)) $)) 

(SDEFUN |TREE;cyclicParents3|
        ((|x| $) (|parents| |List| $) (|pl| |List| $) ($ |List| $))
        (SPROG
         ((#1=#:G384 NIL) (|y| NIL) (|cycleMembers| (|List| $)) (#2=#:G383 NIL)
          (#3=#:G382 NIL))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 9)) |pl|)
                ((|TREE;eqMember?| |x| |parents| $)
                 (SEQ
                  (LETT |cycleMembers|
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |y| NIL) (LETT #2# |parents|) G190
                              (COND
                               ((OR (ATOM #2#) (PROGN (LETT |y| (CAR #2#)) NIL)
                                    (NULL
                                     (NULL (SPADCALL |x| |y| (QREFELT $ 77)))))
                                (GO G191)))
                              (SEQ (EXIT (LETT #3# (CONS |y| #3#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #3#)))))
                  (EXIT
                   (|TREE;eqUnion| (SPADCALL |x| |cycleMembers| (QREFELT $ 67))
                    |pl| $))))
                ('T
                 (SEQ (LETT |parents| (SPADCALL |x| |parents| (QREFELT $ 67)))
                      (SEQ (LETT |y| NIL)
                           (LETT #1# (SPADCALL |x| (QREFELT $ 12))) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |pl|
                                   (|TREE;cyclicParents3| |y| |parents| |pl|
                                    $))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |pl|))))))) 

(SDEFUN |TREE;insert| ((|x| $) (|l| |List| $) ($ |List| $))
        (COND ((|TREE;eqMember?| |x| |l| $) |l|)
              ('T (SPADCALL |x| |l| (QREFELT $ 67))))) 

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
                     (SPADCALL (SPADCALL |l| (QREFELT $ 82)) (QREFELT $ 38))))
                   (GO G191)))
                 (SEQ (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 82))))) NIL
                 (GO G190) G191 (EXIT NIL))
            (EXIT |l|)))))) 

(SDEFUN |TREE;eqMember?| ((|y| $) (|l| |List| $) ($ |Boolean|))
        (SPROG ((#1=#:G398 NIL) (#2=#:G399 NIL) (#3=#:G400 NIL) (|x| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |x| NIL) (LETT #3# |l|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |x| |y| (QREFELT $ 77))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# 'T) (GO #4=#:G397)))
                              (GO #5=#:G395))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT NIL)))
                #4# (EXIT #2#)))) 

(SDEFUN |TREE;eqMemberIndex|
        ((|x| $) (|l| |List| $) (|k| |Integer|) ($ |Integer|))
        (SEQ
         (COND ((SPADCALL |l| (QREFELT $ 38)) |k|)
               (#1='T
                (SEQ (LETT |k| (+ |k| 1))
                     (EXIT
                      (COND
                       ((SPADCALL |x| (SPADCALL |l| (QREFELT $ 83))
                                  (QREFELT $ 77))
                        |k|)
                       (#1#
                        (|TREE;eqMemberIndex| |x| (SPADCALL |l| (QREFELT $ 82))
                         |k| $))))))))) 

(SDEFUN |TREE;eqUnion| ((|u| |List| $) (|v| |List| $) ($ |List| $))
        (SPROG ((|newV| (|List| $)) (|x| ($)))
               (SEQ
                (COND ((SPADCALL |u| (QREFELT $ 38)) |v|)
                      (#1='T
                       (SEQ (LETT |x| (SPADCALL |u| (QREFELT $ 83)))
                            (LETT |newV|
                                  (COND ((|TREE;eqMember?| |x| |v| $) |v|)
                                        (#1#
                                         (SPADCALL |x| |v| (QREFELT $ 67)))))
                            (EXIT
                             (|TREE;eqUnion| (SPADCALL |u| (QREFELT $ 82))
                              |newV| $)))))))) 

(DECLAIM (NOTINLINE |Tree;|)) 

(DEFUN |Tree| (#1=#:G412)
  (SPROG NIL
         (PROG (#2=#:G413)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Tree|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Tree;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Tree|)))))))))) 

(DEFUN |Tree;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G409 NIL) (#2=#:G410 NIL) (#3=#:G411 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Tree| DV$1))
    (LETT $ (GETREFV 89))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #3#)
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|)))
                                        (OR #2# #3#)
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #3#))))))
    (|haddProp| |$ConstructorCache| '|Tree| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 128))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 256))
    (AND #2# (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 512))
    (AND (OR (AND #2# (|HasCategory| $ '(|finiteAggregate|))) #3#)
         (|augmentPredVector| $ 1024))
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 2048))
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
              |TREE;child?;2$B;14| |TREE;=;2$B;28| (|Integer|) (12 . >)
              |TREE;distance;2$I;16| |TREE;node?;2$B;17| (|Mapping| 8 $$)
              (18 . |any?|) (24 . |empty?|) |TREE;leaf?;$B;18| |TREE;#;$Nni;30|
              |TREE;less?;$NniB;19| (29 . >) |TREE;more?;$NniB;20|
              |TREE;size?;$NniB;21| |TREE;any?;M$B;22| |TREE;every?;M$B;23|
              |TREE;member?;S$B;24| |TREE;parts;$L;26| |TREE;members;$L;25|
              (|List| 26) (35 . =) (41 . |append|) (|HashState|)
              (47 . |hashUpdate!|) |TREE;hashUpdate!;Hs$Hs;27|
              |TREE;cyclic?;$B;37| (53 . =) |TREE;copy;2$;32| (59 . |empty|)
              |TREE;cyclicParents;$L;47| (|OutputForm|) |TREE;coerce;$Of;34|
              (63 . |coerce|) (|String|) (68 . |message|) (73 . |coerce|)
              (78 . |cons|) (84 . |prefix|) (90 . |#|) (95 . |overbar|)
              (|Character|) (100 . |elt|) (106 . |coerce|) (111 . |overlabel|)
              |TREE;cyclicEntries;$L;43| |TREE;cyclicCopy;2$;39| (117 . |eq?|)
              (123 . ~=) |TREE;cyclicEqual?;2$B;45| (129 . |elt|) (135 . ~=)
              (141 . |rest|) (146 . |first|) (|Equation| 6) (|List| 84)
              (|Mapping| 8 6 6) '"value" (|SingleInteger|))
           '#(~= 151 |value| 157 |tree| 162 |size?| 178 |setvalue!| 184
              |setelt!| 190 |setchildren!| 197 |sample| 203 |parts| 207 |nodes|
              212 |node?| 217 |more?| 223 |min| 229 |members| 234 |member?| 239
              |max| 245 |map!| 256 |map| 262 |less?| 268 |leaves| 274 |leaf?|
              279 |latex| 284 |hashUpdate!| 289 |hash| 295 |every?| 300 |eval|
              306 |eq?| 332 |empty?| 338 |empty| 343 |elt| 347 |distance| 353
              |cyclicParents| 359 |cyclicEqual?| 364 |cyclicEntries| 370
              |cyclicCopy| 375 |cyclic?| 380 |count| 385 |copy| 397 |coerce|
              402 |children| 407 |child?| 412 |any?| 418 = 424 |#| 430)
           'NIL
           (CONS (|makeByteWordVec2| 7 '(0 0 0 2 1 0 0 0 2 5 7))
                 (CONS
                  '#(|RecursiveAggregate&| |HomogeneousAggregate&| |Aggregate&|
                     |Evalable&| |SetCategory&| NIL NIL NIL |InnerEvalable&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|RecursiveAggregate| 6) (|HomogeneousAggregate| 6)
                      (|Aggregate|) (|Evalable| 6) (|SetCategory|) (|Type|)
                      (|shallowlyMutable|) (|finiteAggregate|)
                      (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 61))
                   (|makeByteWordVec2| 88
                                       '(2 6 8 0 0 18 2 28 8 2 0 29 2 32 8 0 0
                                         33 2 28 8 36 0 37 1 28 8 0 38 2 15 8 0
                                         0 42 2 50 8 0 0 51 2 26 0 0 0 52 2 6
                                         53 53 0 54 2 28 8 0 0 57 0 28 0 59 1
                                         26 61 0 63 1 61 0 64 65 1 6 61 0 66 2
                                         28 0 2 0 67 2 61 0 0 11 68 1 28 15 0
                                         69 1 61 0 0 70 2 64 71 0 32 72 1 71 61
                                         0 73 2 61 0 0 0 74 2 0 8 0 0 77 2 32 8
                                         0 0 78 2 28 2 0 32 80 2 6 8 0 0 81 1
                                         28 0 0 82 1 28 2 0 83 2 11 8 0 0 1 1 0
                                         6 0 17 1 0 0 26 27 1 0 0 6 25 2 0 0 6
                                         11 23 2 0 8 0 15 44 2 12 6 0 6 14 3 12
                                         6 0 87 6 1 2 12 0 0 11 13 0 0 0 1 1 8
                                         26 0 48 1 0 11 0 1 2 4 8 0 0 35 2 0 8
                                         0 15 43 1 9 6 0 1 1 8 26 0 49 2 10 8 6
                                         0 47 1 9 6 0 1 2 8 6 86 0 1 2 12 0 21
                                         0 24 2 0 0 21 0 22 2 0 8 0 15 41 1 0
                                         26 0 1 1 0 8 0 39 1 1 64 0 1 2 1 53 53
                                         0 55 1 1 88 0 1 2 8 8 19 0 46 3 2 0 0
                                         6 6 1 3 2 0 0 26 26 1 2 2 0 0 84 1 2 2
                                         0 0 85 1 2 0 8 0 0 77 1 0 8 0 9 0 0 0
                                         10 2 0 6 0 87 1 2 0 32 0 0 34 1 0 11 0
                                         60 2 0 8 0 0 79 1 0 11 0 75 1 0 0 0 76
                                         1 0 8 0 56 2 10 15 6 0 16 2 8 15 19 0
                                         20 1 0 0 0 58 1 6 61 0 62 1 0 11 0 12
                                         2 4 8 0 0 30 2 8 8 19 0 45 2 11 8 0 0
                                         31 1 8 15 0 40)))))
           '|lookupComplete|)) 
