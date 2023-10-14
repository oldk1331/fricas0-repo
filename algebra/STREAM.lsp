
(SDEFUN |STREAM;explicitlyEmpty?;$B;1| ((|x| $) ($ |Boolean|))
        (EQ (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 7))) 

(SDEFUN |STREAM;lazy?;$B;2| ((|x| $) ($ |Boolean|))
        (EQ (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 8))) 

(SDEFUN |STREAM;uninitialized?| ((|x| $) ($ |Boolean|))
        (EQ (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 9))) 

(PUT '|STREAM;frst;$S;4| '|SPADreplace| 'QCAR) 

(SDEFUN |STREAM;frst;$S;4| ((|x| $) ($ S)) (QCAR |x|)) 

(PUT '|STREAM;rst;2$;5| '|SPADreplace| 'QCDR) 

(SDEFUN |STREAM;rst;2$;5| ((|x| $) ($ $)) (QCDR |x|)) 

(SDEFUN |STREAM;setfrst!| ((|x| $) (|s| S) ($ S))
        (PROGN (RPLACA |x| |s|) (QCAR |x|))) 

(SDEFUN |STREAM;setrst!| ((|x| $) (|y| $) ($ $))
        (PROGN (RPLACD |x| |y|) (QCDR |x|))) 

(SDEFUN |STREAM;setToNil!| ((|x| $) ($ $))
        (SEQ (|STREAM;setfrst!| |x| (QREFELT $ 7) $)
             (|STREAM;setrst!| |x| NIL $) (EXIT |x|))) 

(SDEFUN |STREAM;getm|
        ((|x| $) (|le| |List| (|OutputForm|)) (|n| |Integer|)
         ($ |List| (|OutputForm|)))
        (COND ((SPADCALL |x| (QREFELT $ 13)) |le|)
              ((SPADCALL |x| (QREFELT $ 14))
               (COND
                ((SPADCALL |n| 0 (QREFELT $ 17))
                 (COND ((SPADCALL |x| (QREFELT $ 18)) |le|)
                       (#1='T
                        (|STREAM;getm| (SPADCALL |x| (QREFELT $ 15))
                         (CONS
                          (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                    (QREFELT $ 20))
                          |le|)
                         (- |n| 1) $))))
                (#1# (CONS (SPADCALL "..." (QREFELT $ 22)) |le|))))
              ((SPADCALL |x| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 23))
               (CONS
                (SPADCALL
                 (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 20))
                 (QREFELT $ 24))
                |le|))
              ((SPADCALL |n| 0 (QREFELT $ 17))
               (|STREAM;getm| (SPADCALL |x| (QREFELT $ 15))
                (CONS (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 20))
                      |le|)
                (- |n| 1) $))
              (#1# (CONS (SPADCALL "..." (QREFELT $ 22)) |le|)))) 

(SDEFUN |STREAM;streamCountCoerce| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|pp| (|OutputForm|)) (|pl| #1=(|List| (|OutputForm|)))
          (#2=#:G212 NIL) (|i| NIL) (|le| #1#) (#3=#:G211 NIL)
          (|fc|
           (|Record| (|:| |cycle?| (|Boolean|))
                     (|:| |prefix| (|NonNegativeInteger|))
                     (|:| |period| (|NonNegativeInteger|))))
          (|y| ($)) (|count| NIL))
         (SEQ (LETT |count| |$streamCount| . #4=(|STREAM;streamCountCoerce|))
              (LETT |y| |x| . #4#)
              (SEQ (LETT |i| 1 . #4#) G190
                   (COND
                    ((OR (|greater_SI| |i| |count|)
                         (NULL
                          (COND ((SPADCALL |y| (QREFELT $ 18)) 'NIL) ('T 'T))))
                     (GO G191)))
                   (SEQ (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 15)) . #4#)))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |fc| (SPADCALL |count| |x| (QREFELT $ 27)) . #4#)
              (COND
               ((NULL (QVELT |fc| 0))
                (EXIT
                 (SPADCALL (NREVERSE (|STREAM;getm| |x| NIL |count| $))
                           (QREFELT $ 29)))))
              (LETT |le| NIL . #4#)
              (SEQ (LETT |i| 1 . #4#) (LETT #3# (QVELT |fc| 1) . #4#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (LETT |le|
                          (CONS
                           (SPADCALL (SPADCALL |x| (QREFELT $ 30))
                                     (QREFELT $ 20))
                           |le|)
                          . #4#)
                    (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 31)) . #4#)))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |pp|
                    (COND
                     ((EQL (QVELT |fc| 2) 1)
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 20))
                       (QREFELT $ 24)))
                     ('T
                      (SEQ (LETT |pl| NIL . #4#)
                           (SEQ (LETT |i| 1 . #4#)
                                (LETT #2# (QVELT |fc| 2) . #4#) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ
                                 (LETT |pl|
                                       (CONS
                                        (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                                  (QREFELT $ 20))
                                        |pl|)
                                       . #4#)
                                 (EXIT
                                  (LETT |x| (SPADCALL |x| (QREFELT $ 31))
                                        . #4#)))
                                (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (SPADCALL (SPADCALL (NREVERSE |pl|) (QREFELT $ 32))
                                      (QREFELT $ 24))))))
                    . #4#)
              (EXIT (SPADCALL (NREVERSE (CONS |pp| |le|)) (QREFELT $ 29)))))) 

(SDEFUN |STREAM;listm|
        ((|x| $) (|le| |List| (|OutputForm|)) (|n| |Integer|)
         ($ |List| (|OutputForm|)))
        (COND ((SPADCALL |x| (QREFELT $ 13)) |le|)
              ((SPADCALL |x| (QREFELT $ 14))
               (COND
                ((SPADCALL |n| 0 (QREFELT $ 17))
                 (COND ((SPADCALL |x| (QREFELT $ 18)) |le|)
                       (#1='T
                        (|STREAM;listm| (SPADCALL |x| (QREFELT $ 15))
                         (CONS
                          (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                    (QREFELT $ 20))
                          |le|)
                         (- |n| 1) $))))
                (#1# (CONS (SPADCALL "..." (QREFELT $ 22)) |le|))))
              (#1#
               (|STREAM;listm| (SPADCALL |x| (QREFELT $ 15))
                (CONS (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 20))
                      |le|)
                (- |n| 1) $)))) 

(SDEFUN |STREAM;showAllElements;$Of;12| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|pp| (|OutputForm|)) (|pl| (|List| (|OutputForm|))) (|i| NIL)
          (|len| (|NonNegativeInteger|)) (|le| (|List| (|OutputForm|)))
          (|cycEnt| ($)) (|cycElt| (|Union| $ "failed")))
         (SEQ (SPADCALL |x| |$streamCount| (QREFELT $ 33))
              (LETT |cycElt| (SPADCALL |x| (QREFELT $ 36))
                    . #1=(|STREAM;showAllElements;$Of;12|))
              (EXIT
               (COND
                ((QEQCAR |cycElt| 1)
                 (SEQ
                  (LETT |le| (|STREAM;listm| |x| NIL |$streamCount| $) . #1#)
                  (EXIT (SPADCALL (NREVERSE |le|) (QREFELT $ 29)))))
                (#2='T
                 (SEQ
                  (LETT |cycEnt| (SPADCALL |x| (QCDR |cycElt|) (QREFELT $ 37))
                        . #1#)
                  (LETT |le| NIL . #1#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((SPADCALL |x| |cycEnt| (QREFELT $ 23)) 'NIL)
                                ('T 'T)))
                         (GO G191)))
                       (SEQ
                        (LETT |le|
                              (CONS
                               (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                         (QREFELT $ 20))
                               |le|)
                              . #1#)
                        (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 15)) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |len| (SPADCALL (QCDR |cycElt|) (QREFELT $ 38)) . #1#)
                  (LETT |pp|
                        (COND
                         ((EQL |len| 1)
                          (SPADCALL
                           (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                     (QREFELT $ 20))
                           (QREFELT $ 24)))
                         (#2#
                          (SEQ (LETT |pl| NIL . #1#)
                               (SEQ (LETT |i| 1 . #1#) G190
                                    (COND ((|greater_SI| |i| |len|) (GO G191)))
                                    (SEQ
                                     (LETT |pl|
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |x| (QREFELT $ 11))
                                             (QREFELT $ 20))
                                            |pl|)
                                           . #1#)
                                     (EXIT
                                      (LETT |x| (SPADCALL |x| (QREFELT $ 15))
                                            . #1#)))
                                    (LETT |i| (|inc_SI| |i|) . #1#) (GO G190)
                                    G191 (EXIT NIL))
                               (EXIT
                                (SPADCALL
                                 (SPADCALL (NREVERSE |pl|) (QREFELT $ 32))
                                 (QREFELT $ 24))))))
                        . #1#)
                  (EXIT
                   (SPADCALL (NREVERSE (CONS |pp| |le|)) (QREFELT $ 29)))))))))) 

(SDEFUN |STREAM;showAll?;B;13| (($ |Boolean|))
        (COND ((NULL |$streamsShowAll|) 'NIL) ('T 'T))) 

(SDEFUN |STREAM;coerce;$Of;14| ((|x| $) ($ |OutputForm|))
        (COND ((SPADCALL (QREFELT $ 40)) (SPADCALL |x| (QREFELT $ 39)))
              ('T (|STREAM;streamCountCoerce| |x| $)))) 

(SDEFUN |STREAM;lazyCopy| ((|x| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;lazyCopy!0| (VECTOR $ |x|))
                         (QREFELT $ 46)))) 

(SDEFUN |STREAM;lazyCopy!0| (($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|STREAM;lazyCopy|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT $ 18)) (SPADCALL (QREFELT $ 42)))
                  ('T
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (SPADCALL (SPADCALL |x| (QREFELT $ 15))
                                       (QREFELT $ 43))
                             (QREFELT $ 44)))))))) 

(SDEFUN |STREAM;copy;2$;16| ((|x| $) ($ $))
        (SPROG
         ((|head| ($)) (#1=#:G251 NIL) (|cycle| ($)) (|d| (|Integer|))
          (|e| ($)) (|len| (|NonNegativeInteger|)) (|ce| ($))
          (|cycElt| (|Union| $ "failed")))
         (SEQ
          (LETT |cycElt| (SPADCALL |x| (QREFELT $ 36))
                . #2=(|STREAM;copy;2$;16|))
          (EXIT
           (COND ((QEQCAR |cycElt| 1) (|STREAM;lazyCopy| |x| $))
                 (#3='T
                  (SEQ (LETT |ce| (QCDR |cycElt|) . #2#)
                       (LETT |len| (SPADCALL |ce| (QREFELT $ 38)) . #2#)
                       (LETT |e| (SPADCALL |x| |ce| (QREFELT $ 37)) . #2#)
                       (LETT |d| (SPADCALL |x| |e| (QREFELT $ 47)) . #2#)
                       (LETT |cycle|
                             (SPADCALL (SPADCALL |e| |len| (QREFELT $ 48))
                                       (QREFELT $ 49))
                             . #2#)
                       (|STREAM;setrst!| (SPADCALL |cycle| (QREFELT $ 50))
                        |cycle| $)
                       (EXIT
                        (COND ((EQL |d| 0) |cycle|)
                              (#3#
                               (SEQ
                                (LETT |head|
                                      (SPADCALL
                                       (SPADCALL |x|
                                                 (PROG1 (LETT #1# |d| . #2#)
                                                   (|check_subtype| (>= #1# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    #1#))
                                                 (QREFELT $ 48))
                                       (QREFELT $ 49))
                                      . #2#)
                                (|STREAM;setrst!|
                                 (SPADCALL |head| (QREFELT $ 50)) |cycle| $)
                                (EXIT |head|)))))))))))) 

(SDEFUN |STREAM;construct;L$;17| ((|l| |List| S) ($ $))
        (COND ((NULL |l|) (SPADCALL (QREFELT $ 42)))
              ('T
               (SPADCALL (|SPADfirst| |l|) (SPADCALL (CDR |l|) (QREFELT $ 52))
                         (QREFELT $ 44))))) 

(SDEFUN |STREAM;elt;$IS;18| ((|x| $) (|n| |Integer|) ($ S))
        (COND
         ((OR (< |n| 1) (SPADCALL |x| (QREFELT $ 18)))
          (|error| "elt: no such element"))
         ('T
          (COND ((EQL |n| 1) (SPADCALL |x| (QREFELT $ 11)))
                ('T
                 (SPADCALL (SPADCALL |x| (QREFELT $ 15)) (- |n| 1)
                           (QREFELT $ 53))))))) 

(SDEFUN |STREAM;seteltt| ((|x| $) (|n| |Integer|) (|s| S) ($ S))
        (COND ((EQL |n| 1) (|STREAM;setfrst!| |x| |s| $))
              ('T
               (|STREAM;seteltt| (SPADCALL |x| (QREFELT $ 15)) (- |n| 1) |s|
                $)))) 

(SDEFUN |STREAM;setelt;$I2S;20| ((|x| $) (|n| |Integer|) (|s| S) ($ S))
        (SEQ
         (COND
          ((OR (< |n| 1) (SPADCALL |x| (QREFELT $ 18)))
           (|error| "setelt: no such element"))
          ('T
           (SEQ
            (LETT |x| (|STREAM;expand!| |x| (+ (- |n| 1) 1) $)
                  |STREAM;setelt;$I2S;20|)
            (EXIT (|STREAM;seteltt| |x| |n| |s| $))))))) 

(SDEFUN |STREAM;removee| ((|p| |Mapping| (|Boolean|) S) (|x| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;removee!0| (VECTOR |p| $ |x|))
                         (QREFELT $ 46)))) 

(SDEFUN |STREAM;removee!0| (($$ NIL))
        (PROG (|x| $ |p|)
          (LETT |x| (QREFELT $$ 2) . #1=(|STREAM;removee|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |p| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT $ 18)) (SPADCALL (QREFELT $ 42)))
                  ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) |p|)
                   (SPADCALL |p| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 56)))
                  ('T
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (SPADCALL |p| (SPADCALL |x| (QREFELT $ 15))
                                       (QREFELT $ 56))
                             (QREFELT $ 44)))))))) 

(SDEFUN |STREAM;remove;M2$;22| ((|p| |Mapping| (|Boolean|) S) (|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 13)) (SPADCALL (QREFELT $ 42)))
              ((SPADCALL |x| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 23))
               (COND
                ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) |p|)
                 (SPADCALL (QREFELT $ 42)))
                (#1='T |x|)))
              (#1# (|STREAM;removee| |p| |x| $)))) 

(SDEFUN |STREAM;selectt| ((|p| |Mapping| (|Boolean|) S) (|x| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;selectt!0| (VECTOR |p| $ |x|))
                         (QREFELT $ 46)))) 

(SDEFUN |STREAM;selectt!0| (($$ NIL))
        (PROG (|x| $ |p|)
          (LETT |x| (QREFELT $$ 2) . #1=(|STREAM;selectt|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |p| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT $ 18)) (SPADCALL (QREFELT $ 42)))
                  ((NULL (SPADCALL (SPADCALL |x| (QREFELT $ 11)) |p|))
                   (SPADCALL |p| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 57)))
                  ('T
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (SPADCALL |p| (SPADCALL |x| (QREFELT $ 15))
                                       (QREFELT $ 57))
                             (QREFELT $ 44)))))))) 

(SDEFUN |STREAM;select;M2$;24| ((|p| |Mapping| (|Boolean|) S) (|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 13)) (SPADCALL (QREFELT $ 42)))
              ((SPADCALL |x| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 23))
               (COND ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) |p|) |x|)
                     (#1='T (SPADCALL (QREFELT $ 42)))))
              (#1# (|STREAM;selectt| |p| |x| $)))) 

(SDEFUN |STREAM;map;M2$;25| ((|f| |Mapping| S S) (|x| $) ($ $))
        (SPADCALL |f| |x| (QREFELT $ 61))) 

(SDEFUN |STREAM;map;M3$;26| ((|g| |Mapping| S S S) (|x| $) (|y| $) ($ $))
        (SPROG ((|ys| (|Stream| S)) (|xs| (|Stream| S)))
               (SEQ (LETT |xs| |x| . #1=(|STREAM;map;M3$;26|))
                    (LETT |ys| |y| . #1#)
                    (EXIT (SPADCALL |g| |xs| |ys| (QREFELT $ 65)))))) 

(SDEFUN |STREAM;fill!;$S$;27| ((|x| $) (|s| S) ($ $))
        (SEQ (|STREAM;setfrst!| |x| |s| $) (EXIT (|STREAM;setrst!| |x| |x| $)))) 

(SDEFUN |STREAM;map!;M2$;28| ((|f| |Mapping| S S) (|x| $) ($ $))
        (SPROG ((|y| ($)) (#1=#:G401 NIL) (|tail| ($)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 68))
                  (SEQ
                   (LETT |tail| (SPADCALL |x| (QREFELT $ 69))
                         . #2=(|STREAM;map!;M2$;28|))
                   (LETT |y| |x| . #2#)
                   (SEQ (LETT #1# NIL . #2#) G190 (COND (#1# (GO G191)))
                        (SEQ
                         (|STREAM;setfrst!| |y|
                          (SPADCALL (SPADCALL |y| (QREFELT $ 11)) |f|) $)
                         (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 15)) . #2#)))
                        (LETT #1# (SPADCALL |y| |tail| (QREFELT $ 70)) . #2#)
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |x|)))
                 ((SPADCALL |x| (QREFELT $ 71))
                  (SEQ (LETT |y| |x| . #2#)
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND ((SPADCALL |y| (QREFELT $ 18)) 'NIL)
                                     ('T 'T)))
                              (GO G191)))
                            (SEQ
                             (|STREAM;setfrst!| |y|
                              (SPADCALL (SPADCALL |y| (QREFELT $ 11)) |f|) $)
                             (EXIT
                              (LETT |y| (SPADCALL |y| (QREFELT $ 15)) . #2#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |x|)))
                 ('T (|error| "map!: stream with lazy evaluation")))))) 

(SDEFUN |STREAM;swap!;$2IV;29|
        ((|x| $) (|m| . #1=(|Integer|)) (|n| . #1#) ($ |Void|))
        (SPROG ((|xn| (S)) (|xm| (S)))
               (SEQ
                (COND
                 ((SPADCALL |m| |x| (QREFELT $ 73))
                  (COND
                   ((NULL (SPADCALL |n| |x| (QREFELT $ 73)))
                    (EXIT (|error| #2="swap!: no such elements")))))
                 ('T (EXIT (|error| #2#))))
                (LETT |x| (|STREAM;expand!| |x| (+ (- (MAX |m| |n|) 1) 1) $)
                      . #3=(|STREAM;swap!;$2IV;29|))
                (LETT |xm| (SPADCALL |x| |m| (QREFELT $ 53)) . #3#)
                (LETT |xn| (SPADCALL |x| |n| (QREFELT $ 53)) . #3#)
                (SPADCALL |x| |m| |xn| (QREFELT $ 54))
                (SPADCALL |x| |n| |xm| (QREFELT $ 54)) (EXIT |x|)))) 

(SDEFUN |STREAM;concat;$S$;30| ((|x| $) (|s| S) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;concat;$S$;30!0| (VECTOR |s| $ |x|))
                         (QREFELT $ 46)))) 

(SDEFUN |STREAM;concat;$S$;30!0| (($$ NIL))
        (PROG (|x| $ |s|)
          (LETT |x| (QREFELT $$ 2) . #1=(|STREAM;concat;$S$;30|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |s| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |x| (QREFELT $ 18))
              (SPADCALL |s| (SPADCALL (QREFELT $ 42)) (QREFELT $ 44)))
             ('T
              (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                        (SPADCALL (SPADCALL |x| (QREFELT $ 15)) |s|
                                  (QREFELT $ 76))
                        (QREFELT $ 44)))))))) 

(SDEFUN |STREAM;concat;3$;31| ((|x| $) (|y| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;concat;3$;31!0| (VECTOR |y| $ |x|))
                         (QREFELT $ 46)))) 

(SDEFUN |STREAM;concat;3$;31!0| (($$ NIL))
        (PROG (|x| $ |y|)
          (LETT |x| (QREFELT $$ 2) . #1=(|STREAM;concat;3$;31|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |y| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT $ 18)) (SPADCALL |y| (QREFELT $ 43)))
                  ('T
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (SPADCALL (SPADCALL |x| (QREFELT $ 15)) |y|
                                       (QREFELT $ 77))
                             (QREFELT $ 44)))))))) 

(SDEFUN |STREAM;concat;L$;32| ((|l| |List| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;concat;L$;32!0| (VECTOR $ |l|))
                         (QREFELT $ 46)))) 

(SDEFUN |STREAM;concat;L$;32!0| (($$ NIL))
        (PROG (|l| $)
          (LETT |l| (QREFELT $$ 1) . #1=(|STREAM;concat;L$;32|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|x| NIL))
                   (COND
                    ((SPADCALL |l| (QREFELT $ 79)) (SPADCALL (QREFELT $ 42)))
                    ((SPADCALL (LETT |x| (SPADCALL |l| (QREFELT $ 80)) NIL)
                               (QREFELT $ 18))
                     (SPADCALL (SPADCALL |l| (QREFELT $ 81)) (QREFELT $ 82)))
                    ('T
                     (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                               (SPADCALL (SPADCALL |x| (QREFELT $ 15))
                                         (SPADCALL
                                          (SPADCALL |l| (QREFELT $ 81))
                                          (QREFELT $ 82))
                                         (QREFELT $ 77))
                               (QREFELT $ 44))))))))) 

(SDEFUN |STREAM;setelt;$Us2S;33|
        ((|x| $) (|seg| |UniversalSegment| (|Integer|)) (|s| S) ($ S))
        (SPROG
         ((#1=#:G467 NIL) (|y| ($)) (#2=#:G471 NIL) (|i| NIL) (#3=#:G461 NIL)
          (|high| (|Integer|)) (|low| (|Integer|)))
         (SEQ
          (LETT |low| (SPADCALL |seg| (QREFELT $ 84))
                . #4=(|STREAM;setelt;$Us2S;33|))
          (EXIT
           (COND
            ((SPADCALL |seg| (QREFELT $ 85))
             (SEQ (LETT |high| (SPADCALL |seg| (QREFELT $ 86)) . #4#)
                  (EXIT
                   (COND ((< |high| |low|) |s|)
                         (#5='T
                          (SEQ
                           (COND
                            ((SPADCALL |low| |x| (QREFELT $ 73))
                             (COND
                              ((NULL (SPADCALL |high| |x| (QREFELT $ 73)))
                               (EXIT
                                (|error| #6="setelt: index out of range")))))
                            (#5# (EXIT (|error| #6#))))
                           (LETT |x|
                                 (|STREAM;expand!| |x| (+ (- |high| 1) 1) $)
                                 . #4#)
                           (LETT |y|
                                 (SPADCALL |x|
                                           (PROG1 (LETT #3# (- |low| 1) . #4#)
                                             (|check_subtype| (>= #3# 0)
                                                              '(|NonNegativeInteger|)
                                                              #3#))
                                           (QREFELT $ 87))
                                 . #4#)
                           (SEQ (LETT |i| 0 . #4#)
                                (LETT #2# (- |high| |low|) . #4#) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ (|STREAM;setfrst!| |y| |s| $)
                                     (EXIT
                                      (LETT |y| (SPADCALL |y| (QREFELT $ 15))
                                            . #4#)))
                                (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |s|)))))))
            ((NULL (SPADCALL |low| |x| (QREFELT $ 73)))
             (|error| "setelt: index out of range"))
            ('T
             (SEQ
              (LETT |x|
                    (SPADCALL |x|
                              (PROG1 (LETT #1# (- |low| 1) . #4#)
                                (|check_subtype| (>= #1# 0)
                                                 '(|NonNegativeInteger|) #1#))
                              (QREFELT $ 87))
                    . #4#)
              (|STREAM;setrst!| |x| |x| $)
              (EXIT (|STREAM;setfrst!| |x| |s| $))))))))) 

(SDEFUN |STREAM;empty;$;34| (($ $)) (CONS (QREFELT $ 7) NIL)) 

(SDEFUN |STREAM;lazyEval| ((|x| $) ($ $))
        (SPADCALL (SPADCALL |x| (QREFELT $ 15)))) 

(SDEFUN |STREAM;lazyEvaluate;2$;36| ((|x| $) ($ $))
        (SPROG ((|st| ($)))
               (SEQ
                (LETT |st| (|STREAM;lazyEval| |x| $)
                      |STREAM;lazyEvaluate;2$;36|)
                (|STREAM;setfrst!| |x| (SPADCALL |st| (QREFELT $ 11)) $)
                (|STREAM;setrst!| |x|
                 (COND ((EQ (SPADCALL |st| (QREFELT $ 15)) |st|) |x|)
                       ('T (SPADCALL |st| (QREFELT $ 15))))
                 $)
                (EXIT |x|)))) 

(SDEFUN |STREAM;empty?;$B;37| ((|x| $) ($ |Boolean|))
        (SPROG ((|st| ($)))
               (SEQ
                (SEQ G190
                     (COND ((NULL (SPADCALL |x| (QREFELT $ 14))) (GO G191)))
                     (SEQ
                      (LETT |st| (|STREAM;lazyEval| |x| $)
                            |STREAM;empty?;$B;37|)
                      (|STREAM;setfrst!| |x| (SPADCALL |st| (QREFELT $ 11)) $)
                      (EXIT
                       (|STREAM;setrst!| |x|
                        (COND ((EQ (SPADCALL |st| (QREFELT $ 15)) |st|) |x|)
                              ('T (SPADCALL |st| (QREFELT $ 15))))
                        $)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((|STREAM;uninitialized?| |x| $)
                   (|error| "Trying to use uninitialized stream"))
                  ('T (SPADCALL |x| (QREFELT $ 13)))))))) 

(SDEFUN |STREAM;first;$Nni$;38| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;first;$Nni$;38!0| (VECTOR |x| $ |n|))
                         (QREFELT $ 46)))) 

(SDEFUN |STREAM;first;$Nni$;38!0| (($$ NIL))
        (PROG (|n| $ |x|)
          (LETT |n| (QREFELT $$ 2) . #1=(|STREAM;first;$Nni$;38|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G514 NIL))
                   (COND
                    ((OR (SPADCALL |n| (|spadConstant| $ 90) (QREFELT $ 92))
                         (SPADCALL |x| (QREFELT $ 18)))
                     (SPADCALL (QREFELT $ 42)))
                    ('T
                     (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                               (SPADCALL (SPADCALL |x| (QREFELT $ 15))
                                         (PROG1
                                             (LETT #2#
                                                   (SPADCALL |n|
                                                             (|spadConstant| $
                                                                             93)
                                                             (QREFELT $ 95))
                                                   NIL)
                                           (|check_subtype| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            #2#))
                                         (QREFELT $ 48))
                               (QREFELT $ 44))))))))) 

(PUT '|STREAM;concat;S2$;39| '|SPADreplace| 'CONS) 

(SDEFUN |STREAM;concat;S2$;39| ((|s| S) (|x| $) ($ $)) (CONS |s| |x|)) 

(SDEFUN |STREAM;cons;S2$;40| ((|s| S) (|x| $) ($ $))
        (SPADCALL |s| |x| (QREFELT $ 44))) 

(SDEFUN |STREAM;cycleSplit!;2$;41| ((|x| $) ($ $))
        (SPROG
         ((|z| ($)) (#1=#:G532 NIL) (|y| ($)) (|cycElt| (|Union| $ "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |cycElt| (SPADCALL |x| (QREFELT $ 36))
                  . #2=(|STREAM;cycleSplit!;2$;41|))
            (EXIT
             (COND
              ((QEQCAR |cycElt| 1) (|error| "cycleSplit!: non-cyclic stream"))
              (#3='T
               (SEQ
                (LETT |y| (SPADCALL |x| (QCDR |cycElt|) (QREFELT $ 37)) . #2#)
                (EXIT
                 (COND
                  ((SPADCALL |x| |y| (QREFELT $ 23))
                   (SEQ (|STREAM;setToNil!| |x| $)
                        (EXIT (PROGN (LETT #1# |y| . #2#) (GO #4=#:G531)))))
                  (#3#
                   (SEQ (LETT |z| (SPADCALL |x| (QREFELT $ 15)) . #2#)
                        (EXIT
                         (SEQ G190 NIL
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |y| |z| (QREFELT $ 23))
                                  (SEQ
                                   (SPADCALL |x| (SPADCALL (QREFELT $ 42))
                                             (QREFELT $ 97))
                                   (EXIT
                                    (PROGN (LETT #1# |y| . #2#) (GO #4#)))))
                                 ('T
                                  (SEQ (LETT |x| |z| . #2#)
                                       (EXIT
                                        (LETT |z| (SPADCALL |z| (QREFELT $ 15))
                                              . #2#)))))))
                              NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |STREAM;expand!| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG
         ((#1=#:G543 NIL) (|e| ($)) (|y| ($)) (|nLessD| (|NonNegativeInteger|))
          (#2=#:G542 NIL) (|t| ($)) (|d| (|Integer|))
          (|cycElt| (|Union| $ "failed")) (|i| NIL))
         (SEQ
          (COND ((< |n| 1) |x|)
                (#3='T
                 (SEQ (LETT |y| |x| . #4=(|STREAM;expand!|))
                      (SEQ (LETT |i| 1 . #4#) G190
                           (COND
                            ((OR (|greater_SI| |i| |n|)
                                 (NULL
                                  (COND ((SPADCALL |y| (QREFELT $ 18)) 'NIL)
                                        ('T 'T))))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |y| (SPADCALL |y| (QREFELT $ 15)) . #4#)))
                           (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |cycElt| (SPADCALL |x| (QREFELT $ 36)) . #4#)
                      (EXIT
                       (COND ((QEQCAR |cycElt| 1) |x|)
                             (#3#
                              (SEQ
                               (LETT |e|
                                     (SPADCALL |x| (QCDR |cycElt|)
                                               (QREFELT $ 37))
                                     . #4#)
                               (LETT |d| (SPADCALL |x| |e| (QREFELT $ 47))
                                     . #4#)
                               (EXIT
                                (COND ((>= |d| |n|) |x|)
                                      (#3#
                                       (SEQ
                                        (COND
                                         ((EQL |d| 0)
                                          (SEQ (LETT |d| 1 . #4#)
                                               (LETT |t|
                                                     (SPADCALL |e|
                                                               (QREFELT $ 69))
                                                     . #4#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |t| |e|
                                                            (QREFELT $ 23))
                                                  (SEQ
                                                   (LETT |t|
                                                         (SPADCALL
                                                          (SPADCALL |t|
                                                                    (QREFELT $
                                                                             11))
                                                          (SPADCALL
                                                           (QREFELT $ 42))
                                                          (QREFELT $ 44))
                                                         . #4#)
                                                   (LETT |e|
                                                         (|STREAM;setrst!| |t|
                                                          |t| $)
                                                         . #4#)
                                                   (EXIT
                                                    (|STREAM;setrst!| |x| |e|
                                                     $))))
                                                 (#3#
                                                  (SEQ
                                                   (|STREAM;setrst!| |t|
                                                    (SPADCALL
                                                     (SPADCALL |e|
                                                               (QREFELT $ 11))
                                                     (SPADCALL |e|
                                                               (QREFELT $ 15))
                                                     (QREFELT $ 44))
                                                    $)
                                                   (EXIT
                                                    (LETT |e|
                                                          (SPADCALL |e|
                                                                    (QREFELT $
                                                                             15))
                                                          . #4#)))))))))
                                        (LETT |nLessD|
                                              (PROG1
                                                  (LETT #2# (- |n| |d|) . #4#)
                                                (|check_subtype| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #2#))
                                              . #4#)
                                        (LETT |y|
                                              (SPADCALL
                                               (SPADCALL |e| |nLessD|
                                                         (QREFELT $ 48))
                                               (QREFELT $ 49))
                                              . #4#)
                                        (LETT |e|
                                              (SPADCALL |e| |nLessD|
                                                        (QREFELT $ 87))
                                              . #4#)
                                        (|STREAM;setrst!|
                                         (SPADCALL |y| (QREFELT $ 50)) |e| $)
                                        (|STREAM;setrst!|
                                         (SPADCALL |x|
                                                   (PROG1
                                                       (LETT #1# (- |d| 1)
                                                             . #4#)
                                                     (|check_subtype|
                                                      (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      #1#))
                                                   (QREFELT $ 87))
                                         |y| $)
                                        (EXIT |x|))))))))))))))) 

(SDEFUN |STREAM;first;$S;43| ((|x| $) ($ S))
        (COND
         ((SPADCALL |x| (QREFELT $ 18))
          (|error| "Can't take the first of an empty stream."))
         ('T (SPADCALL |x| (QREFELT $ 11))))) 

(SDEFUN |STREAM;concat!;3$;44| ((|x| $) (|y| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 18)) |y|)
              ('T (|STREAM;setrst!| (SPADCALL |x| (QREFELT $ 50)) |y| $)))) 

(SDEFUN |STREAM;concat!;$S$;45| ((|x| $) (|s| S) ($ $))
        (SPADCALL |x| (SPADCALL |s| (SPADCALL (QREFELT $ 42)) (QREFELT $ 44))
                  (QREFELT $ 99))) 

(SDEFUN |STREAM;setfirst!;$2S;46| ((|x| $) (|s| S) ($ S))
        (SPADCALL |x| 0 |s| (QREFELT $ 54))) 

(SDEFUN |STREAM;setelt;$first2S;47| ((|x| $) (T5 "first") (|s| S) ($ S))
        (SPADCALL |x| |s| (QREFELT $ 101))) 

(SDEFUN |STREAM;setrest!;3$;48| ((|x| $) (|y| $) ($ $))
        (COND
         ((SPADCALL |x| (QREFELT $ 18)) (|error| "setrest!: empty stream"))
         ('T (|STREAM;setrst!| |x| |y| $)))) 

(SDEFUN |STREAM;setelt;$rest2$;49| ((|x| $) (T6 "rest") (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 97))) 

(SDEFUN |STREAM;setlast!;$2S;50| ((|x| $) (|s| S) ($ S))
        (COND
         ((SPADCALL |x| (QREFELT $ 18)) (|error| "setlast!: empty stream"))
         ('T (|STREAM;setfrst!| (SPADCALL |x| (QREFELT $ 50)) |s| $)))) 

(SDEFUN |STREAM;setelt;$last2S;51| ((|x| $) (T7 "last") (|s| S) ($ S))
        (SPADCALL |x| |s| (QREFELT $ 106))) 

(SDEFUN |STREAM;split!;$I$;52| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((|y| ($)) (#1=#:G562 NIL))
               (SEQ
                (COND ((< |n| 1) (|error| "split!: index out of range"))
                      ((EQL |n| 1)
                       (SEQ
                        (LETT |y| (SPADCALL (QREFELT $ 42))
                              . #2=(|STREAM;split!;$I$;52|))
                        (|STREAM;setfrst!| |y| (SPADCALL |x| (QREFELT $ 11)) $)
                        (|STREAM;setrst!| |y| (SPADCALL |x| (QREFELT $ 15)) $)
                        (|STREAM;setToNil!| |x| $) (EXIT |y|)))
                      ('T
                       (SEQ (LETT |x| (|STREAM;expand!| |x| (- |n| 1) $) . #2#)
                            (LETT |x|
                                  (SPADCALL |x|
                                            (PROG1
                                                (LETT #1# (- (- |n| 1) 1)
                                                      . #2#)
                                              (|check_subtype| (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               #1#))
                                            (QREFELT $ 87))
                                  . #2#)
                            (LETT |y| (SPADCALL |x| (QREFELT $ 31)) . #2#)
                            (|STREAM;setrst!| |x| (SPADCALL (QREFELT $ 42)) $)
                            (EXIT |y|))))))) 

(SDEFUN |STREAM;coerce;L$;53| ((|l| |List| S) ($ $))
        (SPADCALL |l| (QREFELT $ 52))) 

(SDEFUN |STREAM;repeating;L$;54| ((|l| |List| S) ($ $))
        (SPROG ((|x| ($)) (|x0| ($)))
               (SEQ
                (COND
                 ((NULL |l|)
                  (|error| "Need a non-null list to make a repeating stream."))
                 ('T
                  (SEQ
                   (LETT |x0|
                         (LETT |x| (SPADCALL |l| (QREFELT $ 52))
                               . #1=(|STREAM;repeating;L$;54|))
                         . #1#)
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND
                            ((SPADCALL (SPADCALL |x| (QREFELT $ 15))
                                       (QREFELT $ 18))
                             'NIL)
                            ('T 'T)))
                          (GO G191)))
                        (SEQ
                         (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 15)) . #1#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT (|STREAM;setrst!| |x| |x0| $)))))))) 

(SDEFUN |STREAM;repeating?;L$B;55| ((|l| |List| S) (|x| $) ($ |Boolean|))
        (SPROG ((#1=#:G582 NIL) (#2=#:G583 NIL) (|s| NIL) (|x0| ($)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL |l|)
                   (|error|
                    "Need a non-empty? list to make a repeating stream."))
                  ((NULL (CDR |l|))
                   (COND
                    ((OR (SPADCALL |x| (QREFELT $ 18))
                         (NULL
                          (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                    (|SPADfirst| |l|) (QREFELT $ 112))))
                     'NIL)
                    ('T
                     (SPADCALL |x| (SPADCALL |x| (QREFELT $ 15))
                               (QREFELT $ 113)))))
                  ('T
                   (SEQ (LETT |x0| |x| . #3=(|STREAM;repeating?;L$B;55|))
                        (SEQ (LETT |s| NIL . #3#) (LETT #2# |l| . #3#) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |s| (CAR #2#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((OR (SPADCALL |x| (QREFELT $ 18))
                                     (SPADCALL |s|
                                               (SPADCALL |x| (QREFELT $ 11))
                                               (QREFELT $ 114)))
                                 (PROGN (LETT #1# 'NIL . #3#) (GO #4=#:G581)))
                                ('T
                                 (LETT |x| (SPADCALL |x| (QREFELT $ 15))
                                       . #3#)))))
                             (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (SPADCALL |x| |x0| (QREFELT $ 23)))))))
                #4# (EXIT #1#)))) 

(SDEFUN |STREAM;findCycle;Nni$R;56|
        ((|n| |NonNegativeInteger|) (|x| $)
         ($ |Record| (|:| |cycle?| (|Boolean|))
          (|:| |prefix| (|NonNegativeInteger|))
          (|:| |period| (|NonNegativeInteger|))))
        (SPROG
         ((|npp| #1=(|NonNegativeInteger|)) (|xp| ($))
          (|per| (|NonNegativeInteger|)) (|i| #1#) (|tl| ($)) (|hd| ($)))
         (SEQ (LETT |hd| |x| . #2=(|STREAM;findCycle;Nni$R;56|))
              (LETT |tl| (SPADCALL |x| |n| (QREFELT $ 87)) . #2#)
              (EXIT
               (COND ((SPADCALL |tl| (QREFELT $ 13)) (VECTOR 'NIL 0 0))
                     (#3='T
                      (SEQ (LETT |i| 0 . #2#)
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (COND
                                    ((SPADCALL |x| |tl| (QREFELT $ 23)) 'NIL)
                                    ('T 'T)))
                                  (GO G191)))
                                (SEQ
                                 (LETT |x| (SPADCALL |x| (QREFELT $ 15)) . #2#)
                                 (EXIT (LETT |i| (+ |i| 1) . #2#)))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (COND ((EQL |i| |n|) (VECTOR 'NIL 0 0))
                                  (#3#
                                   (SEQ
                                    (LETT |x| (SPADCALL |x| (QREFELT $ 15))
                                          . #2#)
                                    (LETT |per| 1 . #2#)
                                    (SEQ G190
                                         (COND
                                          ((NULL
                                            (COND
                                             ((SPADCALL |x| |tl|
                                                        (QREFELT $ 23))
                                              'NIL)
                                             ('T 'T)))
                                           (GO G191)))
                                         (SEQ
                                          (LETT |x|
                                                (SPADCALL |x| (QREFELT $ 15))
                                                . #2#)
                                          (EXIT
                                           (LETT |per| (+ |per| 1) . #2#)))
                                         NIL (GO G190) G191 (EXIT NIL))
                                    (LETT |x| |hd| . #2#)
                                    (LETT |xp|
                                          (SPADCALL |hd| |per| (QREFELT $ 87))
                                          . #2#)
                                    (LETT |npp| 0 . #2#)
                                    (SEQ G190
                                         (COND
                                          ((NULL
                                            (COND
                                             ((SPADCALL |x| |xp|
                                                        (QREFELT $ 23))
                                              'NIL)
                                             ('T 'T)))
                                           (GO G191)))
                                         (SEQ
                                          (LETT |x|
                                                (SPADCALL |x| (QREFELT $ 15))
                                                . #2#)
                                          (LETT |xp|
                                                (SPADCALL |xp| (QREFELT $ 15))
                                                . #2#)
                                          (EXIT
                                           (LETT |npp| (+ |npp| 1) . #2#)))
                                         NIL (GO G190) G191 (EXIT NIL))
                                    (EXIT (VECTOR 'T |npp| |per|))))))))))))) 

(SDEFUN |STREAM;delay;M$;57| ((|fs| |Mapping| $) ($ $))
        (CONS (QREFELT $ 8) |fs|)) 

(SDEFUN |STREAM;explicitEntries?;$B;58| ((|x| $) ($ |Boolean|))
        (COND
         ((OR (SPADCALL |x| (QREFELT $ 13)) (SPADCALL |x| (QREFELT $ 14)))
          'NIL)
         ('T 'T))) 

(SDEFUN |STREAM;numberOfComputedEntries;$Nni;59|
        ((|x| $) ($ |NonNegativeInteger|))
        (COND
         ((SPADCALL |x| (QREFELT $ 116))
          (+ (SPADCALL (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 117)) 1))
         ('T 0))) 

(SDEFUN |STREAM;output;I$V;60| ((|n| |Integer|) (|x| $) ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL |n| 0 (QREFELT $ 17))
           (COND
            ((SPADCALL |x| (QREFELT $ 18)) (EXIT (SPADCALL (QREFELT $ 118))))))
          ('T (EXIT (SPADCALL (QREFELT $ 118)))))
         (|mathPrint| (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 20)))
         (EXIT
          (SPADCALL (- |n| 1) (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 119))))) 

(SDEFUN |STREAM;setrestt!| ((|x| $) (|n| |Integer|) (|y| $) ($ $))
        (COND ((EQL |n| 0) (|STREAM;setrst!| |x| |y| $))
              ('T
               (|STREAM;setrestt!| (SPADCALL |x| (QREFELT $ 15)) (- |n| 1) |y|
                $)))) 

(SDEFUN |STREAM;setrest!;$I2$;62| ((|x| $) (|n| |Integer|) (|y| $) ($ $))
        (SEQ
         (COND
          ((OR (< |n| 0) (SPADCALL |x| (QREFELT $ 18)))
           (|error| "setrest!: no such rest"))
          ('T
           (SEQ
            (LETT |x| (|STREAM;expand!| |x| (+ |n| 1) $)
                  |STREAM;setrest!;$I2$;62|)
            (EXIT (|STREAM;setrestt!| |x| |n| |y| $))))))) 

(SDEFUN |STREAM;stream;M$;63| ((|f| |Mapping| S) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;stream;M$;63!0| (VECTOR $ |f|))
                         (QREFELT $ 46)))) 

(SDEFUN |STREAM;stream;M$;63!0| (($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|STREAM;stream;M$;63|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |f|) (SPADCALL |f| (QREFELT $ 122))
                      (QREFELT $ 44)))))) 

(SDEFUN |STREAM;gen| ((|f| |Mapping| S S) (|s| S) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|STREAM;gen!0| (VECTOR $ |f| |s|))
                          (QREFELT $ 46))))) 

(SDEFUN |STREAM;gen!0| (($$ NIL))
        (PROG (|s| |f| $)
          (LETT |s| (QREFELT $$ 2) . #1=(|STREAM;gen|))
          (LETT |f| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|ss| NIL))
                   (SEQ (LETT |ss| (SPADCALL |s| |f|) NIL)
                        (EXIT
                         (SPADCALL |ss| (|STREAM;gen| |f| |ss| $)
                                   (QREFELT $ 44))))))))) 

(SDEFUN |STREAM;stream;MS$;65| ((|f| |Mapping| S S) (|s| S) ($ $))
        (SPADCALL |s| (|STREAM;gen| |f| |s| $) (QREFELT $ 44))) 

(SDEFUN |STREAM;concat;3$;66| ((|x| $) (|y| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;concat;3$;66!0| (VECTOR |y| $ |x|))
                         (QREFELT $ 46)))) 

(SDEFUN |STREAM;concat;3$;66!0| (($$ NIL))
        (PROG (|x| $ |y|)
          (LETT |x| (QREFELT $$ 2) . #1=(|STREAM;concat;3$;66|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |y| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT $ 18)) |y|)
                  ('T
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (SPADCALL (SPADCALL |x| (QREFELT $ 15)) |y|
                                       (QREFELT $ 77))
                             (QREFELT $ 44)))))))) 

(SDEFUN |STREAM;swhilee| ((|p| |Mapping| (|Boolean|) S) (|x| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;swhilee!0| (VECTOR |p| $ |x|))
                         (QREFELT $ 46)))) 

(SDEFUN |STREAM;swhilee!0| (($$ NIL))
        (PROG (|x| $ |p|)
          (LETT |x| (QREFELT $$ 2) . #1=(|STREAM;swhilee|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |p| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((OR (SPADCALL |x| (QREFELT $ 18))
                  (NULL (SPADCALL (SPADCALL |x| (QREFELT $ 11)) |p|)))
              (SPADCALL (QREFELT $ 42)))
             ('T
              (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                        (SPADCALL |p| (SPADCALL |x| (QREFELT $ 15))
                                  (QREFELT $ 124))
                        (QREFELT $ 44)))))))) 

(SDEFUN |STREAM;filterWhile;M2$;68|
        ((|p| |Mapping| (|Boolean|) S) (|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 13)) (SPADCALL (QREFELT $ 42)))
              ((SPADCALL |x| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 23))
               (COND ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) |p|) |x|)
                     (#1='T (SPADCALL (QREFELT $ 42)))))
              (#1# (|STREAM;swhilee| |p| |x| $)))) 

(SDEFUN |STREAM;suntill| ((|p| |Mapping| (|Boolean|) S) (|x| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|STREAM;suntill!0| (VECTOR |p| $ |x|))
                         (QREFELT $ 46)))) 

(SDEFUN |STREAM;suntill!0| (($$ NIL))
        (PROG (|x| $ |p|)
          (LETT |x| (QREFELT $$ 2) . #1=(|STREAM;suntill|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |p| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT $ 18)) (SPADCALL (QREFELT $ 42)))
                  ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) |p|)
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (SPADCALL (QREFELT $ 42)) (QREFELT $ 44)))
                  ('T
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (SPADCALL |p| (SPADCALL |x| (QREFELT $ 15))
                                       (QREFELT $ 125))
                             (QREFELT $ 44)))))))) 

(SDEFUN |STREAM;filterUntil;M2$;70|
        ((|p| |Mapping| (|Boolean|) S) (|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 13)) (SPADCALL (QREFELT $ 42)))
              ((SPADCALL |x| (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 23))
               (COND
                ((SPADCALL (SPADCALL |x| (QREFELT $ 11)) |p|)
                 (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                           (SPADCALL (QREFELT $ 42)) (QREFELT $ 44)))
                (#1='T |x|)))
              (#1# (|STREAM;suntill| |p| |x| $)))) 

(DECLAIM (NOTINLINE |Stream;|)) 

(DEFUN |Stream| (#1=#:G757)
  (SPROG NIL
         (PROG (#2=#:G758)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Stream|)
                                               '|domainEqualList|)
                    . #3=(|Stream|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Stream;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Stream|)))))))))) 

(DEFUN |Stream;| (|#1|)
  (SPROG
   ((#1=#:G756 NIL) (|pv$| NIL) (#2=#:G753 NIL) (#3=#:G754 NIL) (#4=#:G755 NIL)
    ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|Stream|))
    (LETT |dv$| (LIST '|Stream| DV$1) . #5#)
    (LETT $ (GETREFV 134) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #5#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #4#)
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))
                                              . #5#)
                                        (OR #3# #4#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #5#)
                                        (OR #2#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #4#))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|Stream| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 256))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| $ '(|finiteAggregate|)))
           . #5#)
     (|augmentPredVector| $ 512))
    (AND (OR #1# #4#) (|augmentPredVector| $ 1024))
    (AND #4# (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 2048))
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 4096))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 |$NullStream|)
    (QSETREFV $ 8 |$NonNullStream|)
    (QSETREFV $ 9 |$UninitializedStream|)
    (QSETREFV $ 10 (|Record| (|:| |firstElt| |#1|) (|:| |restOfStream| $)))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 39
                 (CONS (|dispatchFunction| |STREAM;showAllElements;$Of;12|) $))
       (QSETREFV $ 40 (CONS (|dispatchFunction| |STREAM;showAll?;B;13|) $))
       (QSETREFV $ 41 (CONS (|dispatchFunction| |STREAM;coerce;$Of;14|) $)))))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV $ 115
                (CONS (|dispatchFunction| |STREAM;repeating?;L$B;55|) $))))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV $ 119 (CONS (|dispatchFunction| |STREAM;output;I$V;60|) $))))
    $))) 

(MAKEPROP '|Stream| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|NullStream|
              '|NonNullStream| '|UninitializedStream| '|Rep| |STREAM;frst;$S;4|
              (|Boolean|) |STREAM;explicitlyEmpty?;$B;1| |STREAM;lazy?;$B;2|
              |STREAM;rst;2$;5| (|Integer|) (0 . >) |STREAM;empty?;$B;37|
              (|OutputForm|) (6 . |coerce|) (|String|) (11 . |message|)
              (16 . |eq?|) (22 . |overbar|)
              (|Record| (|:| |cycle?| 12) (|:| |prefix| 26) (|:| |period| 26))
              (|NonNegativeInteger|) |STREAM;findCycle;Nni$R;56| (|List| $)
              (27 . |bracket|) |STREAM;first;$S;43| (32 . |rest|)
              (37 . |commaSeparate|) (42 . |extend|) (|Union| $$ '"failed")
              (|CyclicStreamTools| 6 $$) (48 . |cycleElt|)
              (53 . |computeCycleEntry|) (59 . |computeCycleLength|)
              (64 . |showAllElements|) (69 . |showAll?|) (73 . |coerce|)
              |STREAM;empty;$;34| |STREAM;copy;2$;16| |STREAM;concat;S2$;39|
              (|Mapping| $) |STREAM;delay;M$;57| (78 . |distance|)
              |STREAM;first;$Nni$;38| (84 . |complete|) (89 . |tail|)
              (|List| 6) |STREAM;construct;L$;17| |STREAM;elt;$IS;18|
              |STREAM;setelt;$I2S;20| (|Mapping| 12 6) |STREAM;remove;M2$;22|
              |STREAM;select;M2$;24| (|Stream| 6) (|Mapping| 6 6)
              (|StreamFunctions2| 6 6) (94 . |map|) |STREAM;map;M2$;25|
              (|Mapping| 6 6 6) (|StreamFunctions3| 6 6 6) (100 . |map|)
              |STREAM;map;M3$;26| |STREAM;fill!;$S$;27| (107 . |cyclic?|)
              (112 . |cycleTail|) (117 . =) (123 . |explicitlyFinite?|)
              |STREAM;map!;M2$;28| (128 . |index?|) (|Void|)
              |STREAM;swap!;$2IV;29| |STREAM;concat;$S$;30|
              |STREAM;concat;3$;66| (|List| $$) (134 . |empty?|)
              (139 . |first|) (144 . |rest|) |STREAM;concat;L$;32|
              (|UniversalSegment| 16) (149 . |lo|) (154 . |hasHi|) (159 . |hi|)
              (164 . |rest|) |STREAM;setelt;$Us2S;33|
              |STREAM;lazyEvaluate;2$;36| (170 . |Zero|) (174 . |Zero|)
              (178 . =) (184 . |One|) (188 . |One|) (192 . -)
              |STREAM;cons;S2$;40| |STREAM;setrest!;3$;48|
              |STREAM;cycleSplit!;2$;41| |STREAM;concat!;3$;44|
              |STREAM;concat!;$S$;45| |STREAM;setfirst!;$2S;46| '"first"
              |STREAM;setelt;$first2S;47| '"rest" |STREAM;setelt;$rest2$;49|
              |STREAM;setlast!;$2S;50| '"last" |STREAM;setelt;$last2S;51|
              |STREAM;split!;$I$;52| |STREAM;coerce;L$;53|
              |STREAM;repeating;L$;54| (198 . =) (204 . =) (210 . ~=)
              (216 . |repeating?|) |STREAM;explicitEntries?;$B;58|
              |STREAM;numberOfComputedEntries;$Nni;59| (222 . |void|)
              (226 . |output|) |STREAM;setrest!;$I2$;62| (|Mapping| 6)
              |STREAM;stream;M$;63| |STREAM;stream;MS$;65|
              |STREAM;filterWhile;M2$;68| |STREAM;filterUntil;M2$;70|
              (|List| 127) (|Equation| 6) '"value" (|InputForm|)
              (|SingleInteger|) (|HashState|) (|List| 16)
              (|Union| 6 '"failed"))
           '#(~= 232 |value| 238 |third| 243 |tail| 248 |swap!| 253 |stream|
              260 |split!| 271 |size?| 277 |showAllElements| 283 |showAll?| 288
              |setvalue!| 292 |setrest!| 298 |setlast!| 311 |setfirst!| 317
              |setelt| 323 |setchildren!| 365 |select| 371 |second| 377
              |sample| 382 |rst| 386 |rest| 391 |repeating?| 402 |repeating|
              408 |removeDuplicates| 413 |remove| 418 |reduce| 430 |qsetelt!|
              451 |qelt| 458 |possiblyInfinite?| 464 |parts| 469 |output| 474
              |numberOfComputedEntries| 480 |nodes| 485 |node?| 490 |new| 496
              |more?| 502 |minIndex| 508 |members| 513 |member?| 518 |maxIndex|
              524 |map!| 529 |map| 535 |less?| 548 |leaves| 554 |leaf?| 559
              |lazyEvaluate| 564 |lazy?| 569 |latex| 574 |last| 579 |insert|
              590 |indices| 604 |index?| 609 |hashUpdate!| 615 |hash| 621
              |frst| 626 |first| 631 |findCycle| 642 |find| 648 |filterWhile|
              654 |filterUntil| 660 |fill!| 666 |extend| 672
              |explicitlyFinite?| 678 |explicitlyEmpty?| 683 |explicitEntries?|
              688 |every?| 693 |eval| 699 |eq?| 725 |entry?| 731 |entries| 737
              |empty?| 742 |empty| 747 |elt| 751 |distance| 794 |delete| 800
              |delay| 812 |cyclic?| 817 |cycleTail| 822 |cycleSplit!| 827
              |cycleLength| 832 |cycleEntry| 837 |count| 842 |copy| 854
              |convert| 859 |construct| 864 |cons| 869 |concat!| 875 |concat|
              887 |complete| 910 |coerce| 915 |children| 925 |child?| 930
              |any?| 936 = 942 |#| 948)
           'NIL
           (CONS
            (|makeByteWordVec2| 7 '(0 0 0 0 0 0 0 0 0 0 2 1 0 0 0 2 5 7 3))
            (CONS
             '#(|LazyStreamAggregate&| |StreamAggregate&|
                |UnaryRecursiveAggregate&| |LinearAggregate&|
                |RecursiveAggregate&| |Collection&| |IndexedAggregate&|
                |HomogeneousAggregate&| |EltableAggregate&| |Aggregate&|
                |Evalable&| |SetCategory&| NIL NIL NIL |InnerEvalable&|
                |BasicType&| NIL NIL)
             (CONS
              '#((|LazyStreamAggregate| 6) (|StreamAggregate| 6)
                 (|UnaryRecursiveAggregate| 6) (|LinearAggregate| 6)
                 (|RecursiveAggregate| 6) (|Collection| 6)
                 (|IndexedAggregate| 16 6) (|HomogeneousAggregate| 6)
                 (|EltableAggregate| 16 6) (|Aggregate|) (|Evalable| 6)
                 (|SetCategory|) (|shallowlyMutable|) (|Eltable| 16 6) (|Type|)
                 (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 19)
                 (|ConvertibleTo| 129))
              (|makeByteWordVec2| 133
                                  '(2 16 12 0 0 17 1 6 19 0 20 1 19 0 21 22 2 0
                                    12 0 0 23 1 19 0 0 24 1 19 0 28 29 1 0 0 0
                                    31 1 19 0 28 32 2 0 0 0 16 33 1 35 34 2 36
                                    2 35 2 2 2 37 1 35 26 2 38 1 0 19 0 39 0 0
                                    12 40 1 0 19 0 41 2 0 16 0 0 47 1 0 0 0 49
                                    1 0 0 0 50 2 60 58 59 58 61 3 64 58 63 58
                                    58 65 1 0 12 0 68 1 0 0 0 69 2 10 12 2 2 70
                                    1 0 12 0 71 2 0 12 16 0 73 1 78 12 0 79 1
                                    78 2 0 80 1 78 0 0 81 1 83 16 0 84 1 83 12
                                    0 85 1 83 16 0 86 2 0 0 0 26 87 0 26 0 90 0
                                    16 0 91 2 26 12 0 0 92 0 26 0 93 0 16 0 94
                                    2 16 0 0 0 95 2 6 12 0 0 112 2 0 12 0 0 113
                                    2 6 12 0 0 114 2 0 12 51 0 115 0 74 0 118 2
                                    0 74 16 0 119 2 11 12 0 0 1 1 0 6 0 1 1 0 6
                                    0 1 1 0 0 0 50 3 13 74 0 16 16 75 2 0 0 59
                                    6 123 1 0 0 121 122 2 13 0 0 16 109 2 0 12
                                    0 26 1 1 1 19 0 39 0 1 12 40 2 13 6 0 6 1 2
                                    13 0 0 0 97 3 0 0 0 16 0 120 2 13 6 0 6 106
                                    2 13 6 0 6 101 3 13 6 0 16 6 54 3 13 6 0 83
                                    6 88 3 13 6 0 107 6 108 3 13 0 0 104 0 105
                                    3 13 6 0 102 6 103 3 13 6 0 128 6 1 2 13 0
                                    0 28 1 2 0 0 55 0 57 1 0 6 0 1 0 0 0 1 1 0
                                    0 0 15 2 0 0 0 26 87 1 0 0 0 31 2 1 12 51 0
                                    115 1 0 0 51 111 1 10 0 0 1 2 10 0 6 0 1 2
                                    0 0 55 0 56 4 10 6 63 0 6 6 1 3 9 6 63 0 6
                                    1 2 9 6 63 0 1 3 13 6 0 16 6 1 2 0 6 0 16 1
                                    1 0 12 0 1 1 9 51 0 1 2 1 74 16 0 119 1 0
                                    26 0 117 1 0 28 0 1 2 1 12 0 0 1 2 0 0 26 6
                                    1 2 0 12 0 26 1 1 8 16 0 1 1 9 51 0 1 2 10
                                    12 6 0 1 1 8 16 0 1 2 13 0 59 0 72 3 0 0 63
                                    0 0 66 2 0 0 59 0 62 2 0 12 0 26 1 1 0 51 0
                                    1 1 0 12 0 1 1 0 0 0 89 1 0 12 0 14 1 1 21
                                    0 1 2 0 0 0 26 1 1 0 6 0 1 3 0 0 0 0 16 1 3
                                    0 0 6 0 16 1 1 0 132 0 1 2 0 12 16 0 73 2 1
                                    131 131 0 1 1 1 130 0 1 1 0 6 0 11 2 0 0 0
                                    26 48 1 0 6 0 30 2 0 25 26 0 27 2 0 133 55
                                    0 1 2 0 0 55 0 124 2 0 0 55 0 125 2 13 0 0
                                    6 67 2 0 0 0 16 33 1 0 12 0 71 1 0 12 0 13
                                    1 0 12 0 116 2 9 12 55 0 1 3 2 0 0 6 6 1 3
                                    2 0 0 51 51 1 2 2 0 0 126 1 2 2 0 0 127 1 2
                                    0 12 0 0 23 2 12 12 6 0 1 1 0 51 0 1 1 0 12
                                    0 18 0 0 0 42 3 0 6 0 16 6 1 2 0 6 0 16 53
                                    2 0 0 0 83 1 2 0 6 0 107 1 2 0 0 0 104 1 2
                                    0 6 0 102 1 2 0 6 0 128 1 2 0 16 0 0 47 2 0
                                    0 0 83 1 2 0 0 0 16 1 1 0 0 45 46 1 0 12 0
                                    68 1 0 0 0 69 1 13 0 0 98 1 0 26 0 1 1 0 0
                                    0 1 2 10 26 6 0 1 2 9 26 55 0 1 1 0 0 0 43
                                    1 3 129 0 1 1 0 0 51 52 2 0 0 6 0 96 2 13 0
                                    0 0 99 2 13 0 0 6 100 1 0 0 28 82 2 0 0 0 6
                                    76 2 0 0 6 0 44 2 0 0 0 0 77 1 0 0 0 49 1 6
                                    19 0 41 1 0 0 51 110 1 0 28 0 1 2 1 12 0 0
                                    1 2 9 12 55 0 1 2 11 12 0 0 113 1 9 26 0
                                    1)))))
           '|lookupComplete|)) 
