
(SDEFUN |MSET;elt| ((|t| |Table| S (|Integer|)) (|s| S) ($ |Integer|))
        (SPROG ((|a| (|Union| (|Integer|) "failed")))
               (SEQ (LETT |a| (SPADCALL |s| |t| (QREFELT $ 10)) |MSET;elt|)
                    (EXIT (COND ((QEQCAR |a| 1) 0) ('T (QCDR |a|))))))) 

(SDEFUN |MSET;empty;$;2| (($ $)) (CONS 0 (SPADCALL (QREFELT $ 11)))) 

(SDEFUN |MSET;multiset;$;3| (($ $)) (SPADCALL (QREFELT $ 12))) 

(SDEFUN |MSET;dictionary;$;4| (($ $)) (SPADCALL (QREFELT $ 12))) 

(SDEFUN |MSET;set;$;5| (($ $)) (SPADCALL (QREFELT $ 12))) 

(SDEFUN |MSET;brace;$;6| (($ $)) (SPADCALL (QREFELT $ 12))) 

(SDEFUN |MSET;construct;L$;7| ((|l| |List| S) ($ $))
        (SPROG
         ((|n| (|Integer|)) (#1=#:G132 NIL) (|e| NIL)
          (|t| (|Table| S (|Integer|))))
         (SEQ (LETT |t| (SPADCALL (QREFELT $ 11)) . #2=(|MSET;construct;L$;7|))
              (LETT |n| 0 . #2#)
              (SEQ (LETT |e| NIL . #2#) (LETT #1# |l| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (SPADCALL |t| |e| (+ (|MSET;elt| |t| |e| $) 1)
                              (QREFELT $ 18))
                    (EXIT (LETT |n| (+ |n| 1) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |n| |t|))))) 

(SDEFUN |MSET;multiset;L$;8| ((|l| |List| S) ($ $))
        (SPADCALL |l| (QREFELT $ 20))) 

(SDEFUN |MSET;bag;L$;9| ((|l| |List| S) ($ $)) (SPADCALL |l| (QREFELT $ 20))) 

(SDEFUN |MSET;dictionary;L$;10| ((|l| |List| S) ($ $))
        (SPADCALL |l| (QREFELT $ 20))) 

(SDEFUN |MSET;set;L$;11| ((|l| |List| S) ($ $)) (SPADCALL |l| (QREFELT $ 20))) 

(SDEFUN |MSET;brace;L$;12| ((|l| |List| S) ($ $)) (SPADCALL |l| (QREFELT $ 20))) 

(SDEFUN |MSET;multiset;S$;13| ((|s| S) ($ $))
        (SPADCALL (LIST |s|) (QREFELT $ 20))) 

(SDEFUN |MSET;convert;$If;14| ((|ms| $) ($ |InputForm|))
        (SPADCALL
         (LIST (SPADCALL '|multiset| (QREFELT $ 29))
               (SPADCALL (SPADCALL |ms| (QREFELT $ 30)) (QREFELT $ 31)))
         (QREFELT $ 33))) 

(SDEFUN |MSET;members;$L;15| ((|ms| $) ($ |List| S))
        (SPADCALL (QCDR |ms|) (QREFELT $ 35))) 

(SDEFUN |MSET;coerce;$Of;16| ((|ms| $) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (|item| #1=(|OutputForm|))
          (|n| (|Integer|)) (|ex| #1#) (#2=#:G146 NIL) (|e| NIL)
          (|colon| (|OutputForm|)) (|t| (|Table| S (|Integer|))))
         (SEQ (LETT |l| NIL . #3=(|MSET;coerce;$Of;16|))
              (LETT |t| (QCDR |ms|) . #3#) (LETT |colon| ": " . #3#)
              (SEQ (LETT |e| NIL . #3#)
                   (LETT #2# (SPADCALL |t| (QREFELT $ 35)) . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ex| (SPADCALL |e| (QREFELT $ 38)) . #3#)
                        (LETT |n| (|MSET;elt| |t| |e| $) . #3#)
                        (LETT |item|
                              (COND
                               ((SPADCALL |n| 1 (QREFELT $ 40))
                                (SPADCALL
                                 (LIST (SPADCALL |n| (QREFELT $ 41)) |colon|
                                       |ex|)
                                 (QREFELT $ 42)))
                               ('T |ex|))
                              . #3#)
                        (EXIT (LETT |l| (CONS |item| |l|) . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |l| (QREFELT $ 43)))))) 

(SDEFUN |MSET;duplicates;$L;17|
        ((|ms| $)
         ($ |List|
          (|Record| (|:| |entry| S) (|:| |count| (|NonNegativeInteger|)))))
        (SPROG
         ((|ld|
           (|List|
            (|Record| (|:| |entry| S) (|:| |count| (|NonNegativeInteger|)))))
          (#1=#:G150 NIL) (|n| (|Integer|)) (#2=#:G156 NIL) (|e| NIL)
          (|t| (|Table| S (|Integer|))))
         (SEQ (LETT |ld| NIL . #3=(|MSET;duplicates;$L;17|))
              (LETT |t| (QCDR |ms|) . #3#)
              (SEQ (LETT |e| NIL . #3#)
                   (LETT #2# (SPADCALL |t| (QREFELT $ 35)) . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (LETT |n| (|MSET;elt| |t| |e| $) . #3#) 1
                                 (QREFELT $ 40))
                       (LETT |ld|
                             (CONS
                              (CONS |e|
                                    (PROG1 (LETT #1# |n| . #3#)
                                      (|check_subtype| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       #1#)))
                              |ld|)
                             . #3#)))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |ld|)))) 

(SDEFUN |MSET;extract!;$S;18| ((|ms| $) ($ S))
        (SPROG ((|n| (|Integer|)) (|e| (S)) (|t| (|Table| S (|Integer|))))
               (SEQ
                (COND
                 ((SPADCALL |ms| (QREFELT $ 48))
                  (|error| "extract: Empty multiset"))
                 (#1='T
                  (SEQ (PROGN (RPLACA |ms| (- (QCAR |ms|) 1)) (QCAR |ms|))
                       (LETT |t| (QCDR |ms|) . #2=(|MSET;extract!;$S;18|))
                       (LETT |e| (QCAR (SPADCALL |t| (QREFELT $ 50))) . #2#)
                       (SEQ (LETT |n| (|MSET;elt| |t| |e| $) . #2#)
                            (EXIT
                             (COND
                              ((SPADCALL |n| 1 (QREFELT $ 40))
                               (SPADCALL |t| |e| (- |n| 1) (QREFELT $ 18)))
                              (#1# (SPADCALL |e| |t| (QREFELT $ 51))))))
                       (EXIT |e|))))))) 

(SDEFUN |MSET;inspect;$S;19| ((|ms| $) ($ S))
        (QCAR (SPADCALL (QCDR |ms|) (QREFELT $ 50)))) 

(SDEFUN |MSET;insert!;S2$;20| ((|e| S) (|ms| $) ($ $))
        (SEQ (PROGN (RPLACA |ms| (+ (QCAR |ms|) 1)) (QCAR |ms|))
             (SPADCALL (QCDR |ms|) |e| (+ (|MSET;elt| (QCDR |ms|) |e| $) 1)
                       (QREFELT $ 18))
             (EXIT |ms|))) 

(SDEFUN |MSET;member?;S$B;21| ((|e| S) (|ms| $) ($ |Boolean|))
        (SPADCALL |e| (SPADCALL (QCDR |ms|) (QREFELT $ 35)) (QREFELT $ 55))) 

(SDEFUN |MSET;empty?;$B;22| ((|ms| $) ($ |Boolean|)) (EQL (QCAR |ms|) 0)) 

(SDEFUN |MSET;#;$Nni;23| ((|ms| $) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G173 NIL))
               (PROG1 (LETT #1# (QCAR |ms|) |MSET;#;$Nni;23|)
                 (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |MSET;count;S$Nni;24| ((|e| S) (|ms| $) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G175 NIL))
               (PROG1
                   (LETT #1# (|MSET;elt| (QCDR |ms|) |e| $)
                         |MSET;count;S$Nni;24|)
                 (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |MSET;remove!;S$I$;25| ((|e| S) (|ms| $) (|max| |Integer|) ($ $))
        (SPROG ((|n| (|Integer|)) (|t| (|Table| S (|Integer|))))
               (SEQ
                (COND ((ZEROP |max|) (SPADCALL |e| |ms| (QREFELT $ 60)))
                      (#1='T
                       (SEQ
                        (LETT |t| (QCDR |ms|) . #2=(|MSET;remove!;S$I$;25|))
                        (COND
                         ((SPADCALL |e| (SPADCALL |t| (QREFELT $ 35))
                                    (QREFELT $ 55))
                          (SEQ (LETT |n| (|MSET;elt| |t| |e| $) . #2#)
                               (EXIT
                                (COND
                                 ((SPADCALL |n| |max| (QREFELT $ 61))
                                  (SEQ (SPADCALL |e| |t| (QREFELT $ 51))
                                       (EXIT
                                        (PROGN
                                         (RPLACA |ms| (- (QCAR |ms|) |n|))
                                         (QCAR |ms|)))))
                                 ((SPADCALL |max| 0 (QREFELT $ 40))
                                  (SEQ
                                   (SPADCALL |t| |e| (- |n| |max|)
                                             (QREFELT $ 18))
                                   (EXIT
                                    (PROGN
                                     (RPLACA |ms| (- (QCAR |ms|) |max|))
                                     (QCAR |ms|)))))
                                 (#1#
                                  (SEQ (LETT |n| (+ |n| |max|) . #2#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |n| 0 (QREFELT $ 40))
                                          (SEQ
                                           (SPADCALL |t| |e| (- |max|)
                                                     (QREFELT $ 18))
                                           (EXIT
                                            (PROGN
                                             (RPLACA |ms| (- (QCAR |ms|) |n|))
                                             (QCAR |ms|))))))))))))))
                        (EXIT |ms|))))))) 

(SDEFUN |MSET;remove!;M$I$;26|
        ((|p| |Mapping| (|Boolean|) S) (|ms| $) (|max| |Integer|) ($ $))
        (SPROG
         ((#1=#:G192 NIL) (|n| (|Integer|)) (#2=#:G198 NIL) (|e| NIL)
          (|t| (|Table| S (|Integer|))))
         (SEQ
          (COND ((ZEROP |max|) (SPADCALL |p| |ms| (QREFELT $ 64)))
                ('T
                 (SEQ (LETT |t| (QCDR |ms|) . #3=(|MSET;remove!;M$I$;26|))
                      (SEQ (LETT |e| NIL . #3#)
                           (LETT #2# (SPADCALL |t| (QREFELT $ 35)) . #3#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |e| (CAR #2#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |e| |p|)
                               (SEQ (LETT |n| (|MSET;elt| |t| |e| $) . #3#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |n| |max| (QREFELT $ 61))
                                       (SEQ (SPADCALL |e| |t| (QREFELT $ 51))
                                            (EXIT
                                             (PROGN
                                              (RPLACA |ms| (- (QCAR |ms|) |n|))
                                              (QCAR |ms|)))))
                                      ((SPADCALL |max| 0 (QREFELT $ 40))
                                       (SEQ
                                        (SPADCALL |t| |e| (- |n| |max|)
                                                  (QREFELT $ 18))
                                        (EXIT
                                         (PROGN
                                          (RPLACA |ms| (- (QCAR |ms|) |max|))
                                          (QCAR |ms|)))))
                                      ('T
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |n| (+ |n| |max|) . #3#)
                                              (EXIT
                                               (COND
                                                ((SPADCALL |n| 0
                                                           (QREFELT $ 40))
                                                 (PROGN
                                                  (LETT #1#
                                                        (SEQ
                                                         (SPADCALL |t| |e|
                                                                   (- |max|)
                                                                   (QREFELT $
                                                                            18))
                                                         (EXIT
                                                          (PROGN
                                                           (RPLACA |ms|
                                                                   (-
                                                                    (QCAR |ms|)
                                                                    |n|))
                                                           (QCAR |ms|))))
                                                        . #3#)
                                                  (GO #1#)))))))
                                        #1# (EXIT #1#))))))))))
                           (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT |ms|))))))) 

(SDEFUN |MSET;remove;S$I$;27| ((|e| S) (|ms| $) (|max| |Integer|) ($ $))
        (SPADCALL |e| (SPADCALL |ms| (QREFELT $ 66)) |max| (QREFELT $ 62))) 

(SDEFUN |MSET;remove;M$I$;28|
        ((|p| |Mapping| (|Boolean|) S) (|ms| $) (|max| |Integer|) ($ $))
        (SPADCALL |p| (SPADCALL |ms| (QREFELT $ 66)) |max| (QREFELT $ 65))) 

(SDEFUN |MSET;remove!;S2$;29| ((|e| S) (|ms| $) ($ $))
        (SPROG ((|t| (|Table| S (|Integer|))))
               (SEQ (LETT |t| (QCDR |ms|) |MSET;remove!;S2$;29|)
                    (COND
                     ((SPADCALL |e| (SPADCALL |t| (QREFELT $ 35))
                                (QREFELT $ 55))
                      (SEQ
                       (PROGN
                        (RPLACA |ms| (- (QCAR |ms|) (|MSET;elt| |t| |e| $)))
                        (QCAR |ms|))
                       (EXIT (SPADCALL |e| |t| (QREFELT $ 51))))))
                    (EXIT |ms|)))) 

(SDEFUN |MSET;remove!;M2$;30| ((|p| |Mapping| (|Boolean|) S) (|ms| $) ($ $))
        (SPROG ((#1=#:G212 NIL) (|e| NIL) (|t| (|Table| S (|Integer|))))
               (SEQ (LETT |t| (QCDR |ms|) . #2=(|MSET;remove!;M2$;30|))
                    (SEQ (LETT |e| NIL . #2#)
                         (LETT #1# (SPADCALL |t| (QREFELT $ 35)) . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |e| |p|)
                             (SEQ
                              (PROGN
                               (RPLACA |ms|
                                       (- (QCAR |ms|) (|MSET;elt| |t| |e| $)))
                               (QCAR |ms|))
                              (EXIT (SPADCALL |e| |t| (QREFELT $ 51))))))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |ms|)))) 

(SDEFUN |MSET;select!;M2$;31| ((|p| |Mapping| (|Boolean|) S) (|ms| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|MSET;select!;M2$;31!0| (VECTOR $ |p|)) |ms|
                         (QREFELT $ 64)))) 

(SDEFUN |MSET;select!;M2$;31!0| ((|s1| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1) . #1=(|MSET;select!;M2$;31|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND ((SPADCALL |s1| |p|) (|spadConstant| $ 69))
                  ('T (|spadConstant| $ 70))))))) 

(SDEFUN |MSET;removeDuplicates!;2$;32| ((|ms| $) ($ $))
        (SPROG
         ((#1=#:G223 NIL) (|e| NIL) (|l| (|List| S))
          (|t| (|Table| S (|Integer|))))
         (SEQ (LETT |t| (QCDR |ms|) . #2=(|MSET;removeDuplicates!;2$;32|))
              (LETT |l| (SPADCALL |t| (QREFELT $ 35)) . #2#)
              (SEQ (LETT |e| NIL . #2#) (LETT #1# |l| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |t| |e| 1 (QREFELT $ 18))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (PROGN (RPLACA |ms| (LENGTH |l|)) (QCAR |ms|)) (EXIT |ms|)))) 

(SDEFUN |MSET;insert!;S$Nni$;33|
        ((|e| S) (|ms| $) (|more| |NonNegativeInteger|) ($ $))
        (SEQ (PROGN (RPLACA |ms| (+ (QCAR |ms|) |more|)) (QCAR |ms|))
             (SPADCALL (QCDR |ms|) |e|
                       (+ (|MSET;elt| (QCDR |ms|) |e| $) |more|)
                       (QREFELT $ 18))
             (EXIT |ms|))) 

(SDEFUN |MSET;map!;M2$;34| ((|f| |Mapping| S S) (|ms| $) ($ $))
        (SPROG
         ((#1=#:G232 NIL) (|e| NIL) (|t1| (|Table| S (|Integer|)))
          (|t| (|Table| S (|Integer|))))
         (SEQ (LETT |t| (QCDR |ms|) . #2=(|MSET;map!;M2$;34|))
              (LETT |t1| (SPADCALL (QREFELT $ 11)) . #2#)
              (SEQ (LETT |e| NIL . #2#)
                   (LETT #1# (SPADCALL |t| (QREFELT $ 35)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (SPADCALL |t1| (SPADCALL |e| |f|) (|MSET;elt| |t| |e| $)
                              (QREFELT $ 18))
                    (EXIT (SPADCALL |e| |t| (QREFELT $ 51))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (PROGN (RPLACD |ms| |t1|) (QCDR |ms|)) (EXIT |ms|)))) 

(SDEFUN |MSET;map;M2$;35| ((|f| |Mapping| S S) (|ms| $) ($ $))
        (SPADCALL |f| (SPADCALL |ms| (QREFELT $ 66)) (QREFELT $ 75))) 

(SDEFUN |MSET;parts;$L;36| ((|m| $) ($ |List| S))
        (SPROG
         ((|l| (|List| S)) (#1=#:G240 NIL) (|i| NIL) (#2=#:G239 NIL) (|e| NIL)
          (|t| (|Table| S (|Integer|))))
         (SEQ (LETT |l| NIL . #3=(|MSET;parts;$L;36|))
              (LETT |t| (QCDR |m|) . #3#)
              (SEQ (LETT |e| NIL . #3#)
                   (LETT #2# (SPADCALL |t| (QREFELT $ 35)) . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |i| 1 . #3#)
                          (LETT #1# (|MSET;elt| |t| |e| $) . #3#) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ (EXIT (LETT |l| (CONS |e| |l|) . #3#)))
                          (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |l|)))) 

(SDEFUN |MSET;union;3$;37| ((|m1| $) (|m2| $) ($ $))
        (SPROG
         ((#1=#:G246 NIL) (|e| NIL) (#2=#:G245 NIL)
          (|t2| #3=(|Table| S (|Integer|))) (|t1| #3#)
          (|t| (|Table| S (|Integer|))))
         (SEQ (LETT |t| (SPADCALL (QREFELT $ 11)) . #4=(|MSET;union;3$;37|))
              (LETT |t1| (QCDR |m1|) . #4#) (LETT |t2| (QCDR |m2|) . #4#)
              (SEQ (LETT |e| NIL . #4#)
                   (LETT #2# (SPADCALL |t1| (QREFELT $ 35)) . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |t| |e| (|MSET;elt| |t1| |e| $)
                               (QREFELT $ 18))))
                   (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |e| NIL . #4#)
                   (LETT #1# (SPADCALL |t2| (QREFELT $ 35)) . #4#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |t| |e|
                               (+ (|MSET;elt| |t2| |e| $)
                                  (|MSET;elt| |t| |e| $))
                               (QREFELT $ 18))))
                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (+ (QCAR |m1|) (QCAR |m2|)) |t|))))) 

(SDEFUN |MSET;intersect;3$;38| ((|m1| $) (|m2| $) ($ $))
        (SPROG
         ((|n| (|Integer|)) (|m| (|Integer|)) (#1=#:G252 NIL) (|e| NIL)
          (|t2| #2=(|Table| S (|Integer|))) (|t1| #2#)
          (|t| (|Table| S (|Integer|))))
         (SEQ
          (LETT |t| (SPADCALL (QREFELT $ 11)) . #3=(|MSET;intersect;3$;38|))
          (LETT |t1| (QCDR |m1|) . #3#) (LETT |t2| (QCDR |m2|) . #3#)
          (LETT |n| 0 . #3#)
          (SEQ (LETT |e| NIL . #3#)
               (LETT #1# (SPADCALL |t1| (QREFELT $ 35)) . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |m| (MIN (|MSET;elt| |t1| |e| $) (|MSET;elt| |t2| |e| $))
                      . #3#)
                (EXIT
                 (COND
                  ((SPADCALL |m| 0 (QREFELT $ 40))
                   (SEQ
                    (LETT |m|
                          (+ (|MSET;elt| |t1| |e| $) (|MSET;elt| |t2| |e| $))
                          . #3#)
                    (SPADCALL |t| |e| |m| (QREFELT $ 18))
                    (EXIT (LETT |n| (+ |n| |m|) . #3#)))))))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |n| |t|))))) 

(SDEFUN |MSET;difference;3$;39| ((|m1| $) (|m2| $) ($ $))
        (SPROG
         ((|n| (|Integer|)) (|k2| #1=(|Integer|)) (|k1| #1#) (#2=#:G258 NIL)
          (|e| NIL) (|t2| #3=(|Table| S (|Integer|))) (|t1| #3#)
          (|t| (|Table| S (|Integer|))))
         (SEQ
          (LETT |t| (SPADCALL (QREFELT $ 11)) . #4=(|MSET;difference;3$;39|))
          (LETT |t1| (QCDR |m1|) . #4#) (LETT |t2| (QCDR |m2|) . #4#)
          (LETT |n| 0 . #4#)
          (SEQ (LETT |e| NIL . #4#)
               (LETT #2# (SPADCALL |t1| (QREFELT $ 35)) . #4#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |k1| (|MSET;elt| |t1| |e| $) . #4#)
                    (LETT |k2| (|MSET;elt| |t2| |e| $) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |k1| 0 (QREFELT $ 40))
                       (COND
                        ((EQL |k2| 0)
                         (SEQ (SPADCALL |t| |e| |k1| (QREFELT $ 18))
                              (EXIT (LETT |n| (+ |n| |k1|) . #4#)))))))))
               (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND ((EQL |n| 0) (SPADCALL (QREFELT $ 12)))
                 ('T (CONS |n| |t|))))))) 

(SDEFUN |MSET;symmetricDifference;3$;40| ((|m1| $) (|m2| $) ($ $))
        (SPADCALL (SPADCALL |m1| |m2| (QREFELT $ 79))
                  (SPADCALL |m2| |m1| (QREFELT $ 79)) (QREFELT $ 77))) 

(SDEFUN |MSET;=;2$B;41| ((|m1| $) (|m2| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G264 NIL) (#2=#:G267 NIL) (#3=#:G269 NIL) (|e| NIL)
          (#4=#:G262 NIL) (#5=#:G268 NIL) (|t2| #6=(|Table| S (|Integer|)))
          (|t1| #6#))
         (SEQ
          (EXIT
           (COND ((SPADCALL (QCAR |m1|) (QCAR |m2|) (QREFELT $ 81)) 'NIL)
                 ('T
                  (SEQ (LETT |t1| (QCDR |m1|) . #7=(|MSET;=;2$B;41|))
                       (LETT |t2| (QCDR |m2|) . #7#)
                       (SEQ
                        (EXIT
                         (SEQ (LETT |e| NIL . #7#)
                              (LETT #5# (SPADCALL |t1| (QREFELT $ 35)) . #7#)
                              G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |e| (CAR #5#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (|MSET;elt| |t1| |e| $)
                                            (|MSET;elt| |t2| |e| $)
                                            (QREFELT $ 81))
                                  (PROGN
                                   (LETT #4#
                                         (PROGN (LETT #2# 'NIL . #7#) (GO #2#))
                                         . #7#)
                                   (GO #4#))))))
                              (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                              (EXIT NIL)))
                        #4# (EXIT #4#))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |e| NIL . #7#)
                              (LETT #3# (SPADCALL |t2| (QREFELT $ 35)) . #7#)
                              G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |e| (CAR #3#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (|MSET;elt| |t1| |e| $)
                                            (|MSET;elt| |t2| |e| $)
                                            (QREFELT $ 81))
                                  (PROGN
                                   (LETT #1#
                                         (PROGN (LETT #2# 'NIL . #7#) (GO #2#))
                                         . #7#)
                                   (GO #1#))))))
                              (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                              (EXIT NIL)))
                        #1# (EXIT #1#))
                       (EXIT 'T)))))
          #2# (EXIT #2#)))) 

(SDEFUN |MSET;<;2$B;42| ((|m1| $) (|m2| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G272 NIL) (#2=#:G275 NIL) (#3=#:G276 NIL) (|e| NIL)
          (|t2| #4=(|Table| S (|Integer|))) (|t1| #4#))
         (SEQ
          (EXIT
           (COND ((>= (QCAR |m1|) (QCAR |m2|)) 'NIL)
                 ('T
                  (SEQ (LETT |t1| (QCDR |m1|) . #5=(|MSET;<;2$B;42|))
                       (LETT |t2| (QCDR |m2|) . #5#)
                       (SEQ
                        (EXIT
                         (SEQ (LETT |e| NIL . #5#)
                              (LETT #3# (SPADCALL |t1| (QREFELT $ 35)) . #5#)
                              G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |e| (CAR #3#) . #5#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (|MSET;elt| |t1| |e| $)
                                            (|MSET;elt| |t2| |e| $)
                                            (QREFELT $ 40))
                                  (PROGN
                                   (LETT #1#
                                         (PROGN (LETT #2# 'NIL . #5#) (GO #2#))
                                         . #5#)
                                   (GO #1#))))))
                              (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                              (EXIT NIL)))
                        #1# (EXIT #1#))
                       (EXIT (< (QCAR |m1|) (QCAR |m2|)))))))
          #2# (EXIT #2#)))) 

(SDEFUN |MSET;subset?;2$B;43| ((|m1| $) (|m2| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G279 NIL) (#2=#:G282 NIL) (#3=#:G283 NIL) (|e| NIL)
          (|t2| #4=(|Table| S (|Integer|))) (|t1| #4#))
         (SEQ
          (EXIT
           (COND ((SPADCALL (QCAR |m1|) (QCAR |m2|) (QREFELT $ 40)) 'NIL)
                 ('T
                  (SEQ (LETT |t1| (QCDR |m1|) . #5=(|MSET;subset?;2$B;43|))
                       (LETT |t2| (QCDR |m2|) . #5#)
                       (SEQ
                        (EXIT
                         (SEQ (LETT |e| NIL . #5#)
                              (LETT #3# (SPADCALL |t1| (QREFELT $ 35)) . #5#)
                              G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |e| (CAR #3#) . #5#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (|MSET;elt| |t1| |e| $)
                                            (|MSET;elt| |t2| |e| $)
                                            (QREFELT $ 40))
                                  (PROGN
                                   (LETT #1#
                                         (PROGN (LETT #2# 'NIL . #5#) (GO #2#))
                                         . #5#)
                                   (GO #1#))))))
                              (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                              (EXIT NIL)))
                        #1# (EXIT #1#))
                       (EXIT 'T)))))
          #2# (EXIT #2#)))) 

(SDEFUN |MSET;<=;2$B;44| ((|m1| $) (|m2| $) ($ |Boolean|))
        (SPADCALL |m1| |m2| (QREFELT $ 84))) 

(DECLAIM (NOTINLINE |Multiset;|)) 

(DEFUN |Multiset| (#1=#:G290)
  (SPROG NIL
         (PROG (#2=#:G291)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Multiset|)
                                               '|domainEqualList|)
                    . #3=(|Multiset|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Multiset;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Multiset|)))))))))) 

(DEFUN |Multiset;| (|#1|)
  (SPROG ((#1=#:G289 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|Multiset|))
          (LETT |dv$| (LIST '|Multiset| DV$1) . #2#)
          (LETT $ (GETREFV 93) . #2#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               (|HasCategory| |#1|
                                                              '(|SetCategory|)))
                                              (|HasCategory| |#1|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))))
                          . #2#))
          (|haddProp| |$ConstructorCache| '|Multiset| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (AND (|HasCategory| $ '(|shallowlyMutable|))
               (|augmentPredVector| $ 8))
          (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #2#)
               (|augmentPredVector| $ 16))
          (AND (|HasCategory| |#1| '(|BasicType|)) #1#
               (|augmentPredVector| $ 32))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |count| (|Integer|))
                              (|:| |table| (|Table| |#1| (|Integer|)))))
          (COND
           ((|testBitVector| |pv$| 2)
            (QSETREFV $ 34
                      (CONS (|dispatchFunction| |MSET;convert;$If;14|) $))))
          $))) 

(MAKEPROP '|Multiset| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|Union| 17 '"failed") (|Table| 6 17) (0 . |search|)
              (6 . |table|) |MSET;empty;$;2| |MSET;multiset;$;3|
              |MSET;dictionary;$;4| |MSET;set;$;5| |MSET;brace;$;6| (|Integer|)
              (10 . |setelt|) (|List| 6) |MSET;construct;L$;7|
              |MSET;multiset;L$;8| |MSET;bag;L$;9| |MSET;dictionary;L$;10|
              |MSET;set;L$;11| |MSET;brace;L$;12| |MSET;multiset;S$;13|
              (|Symbol|) (|InputForm|) (17 . |convert|) |MSET;parts;$L;36|
              (22 . |convert|) (|List| $) (27 . |convert|) (32 . |convert|)
              (37 . |keys|) |MSET;members;$L;15| (|OutputForm|) (42 . |coerce|)
              (|Boolean|) (47 . >) (53 . |coerce|) (58 . |hconcat|)
              (63 . |brace|) |MSET;coerce;$Of;16|
              (|Record| (|:| |entry| 6) (|:| |count| 57)) (|List| 45)
              |MSET;duplicates;$L;17| |MSET;empty?;$B;22|
              (|Record| (|:| |key| 6) (|:| |entry| 17)) (68 . |inspect|)
              (73 . |remove!|) |MSET;extract!;$S;18| |MSET;inspect;$S;19|
              |MSET;insert!;S2$;20| (79 . |member?|) |MSET;member?;S$B;21|
              (|NonNegativeInteger|) |MSET;#;$Nni;23| |MSET;count;S$Nni;24|
              |MSET;remove!;S2$;29| (85 . <=) |MSET;remove!;S$I$;25|
              (|Mapping| 39 6) |MSET;remove!;M2$;30| |MSET;remove!;M$I$;26|
              (91 . |copy|) |MSET;remove;S$I$;27| |MSET;remove;M$I$;28|
              (96 . |false|) (100 . |true|) |MSET;select!;M2$;31|
              |MSET;removeDuplicates!;2$;32| |MSET;insert!;S$Nni$;33|
              (|Mapping| 6 6) |MSET;map!;M2$;34| |MSET;map;M2$;35|
              |MSET;union;3$;37| |MSET;intersect;3$;38| |MSET;difference;3$;39|
              |MSET;symmetricDifference;3$;40| (104 . ~=) |MSET;=;2$B;41|
              |MSET;<;2$B;42| |MSET;subset?;2$B;43| |MSET;<=;2$B;44|
              (|Mapping| 6 6 6) (|List| 88) (|Equation| 6) (|HashState|)
              (|SingleInteger|) (|String|) (|Union| 6 '"failed"))
           '#(~= 110 |union| 116 |symmetricDifference| 134 |subset?| 140
              |size?| 146 |set| 152 |select!| 161 |select| 167 |sample| 173
              |removeDuplicates!| 177 |removeDuplicates| 182 |remove!| 187
              |remove| 213 |reduce| 239 |parts| 260 |multiset| 265 |more?| 279
              |members| 285 |member?| 290 |map!| 296 |map| 302 |less?| 308
              |latex| 314 |intersect| 319 |inspect| 325 |insert!| 330
              |hashUpdate!| 343 |hash| 349 |find| 354 |extract!| 360 |every?|
              365 |eval| 371 |eq?| 397 |empty?| 403 |empty| 408 |duplicates|
              412 |difference| 417 |dictionary| 429 |count| 438 |copy| 450
              |convert| 455 |construct| 460 |coerce| 465 |brace| 470 |bag| 479
              |any?| 484 >= 490 > 496 = 502 <= 508 < 514 |#| 520)
           'NIL
           (CONS (|makeByteWordVec2| 2 '(0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 2))
                 (CONS
                  '#(NIL NIL |DictionaryOperations&| |SetAggregate&|
                     |BagAggregate&| |Collection&| |HomogeneousAggregate&|
                     |SetCategory&| |Aggregate&| |Evalable&| NIL
                     |PartialOrder&| NIL |BasicType&| NIL NIL |InnerEvalable&|
                     NIL)
                  (CONS
                   '#((|MultisetAggregate| 6) (|MultiDictionary| 6)
                      (|DictionaryOperations| 6) (|SetAggregate| 6)
                      (|BagAggregate| 6) (|Collection| 6)
                      (|HomogeneousAggregate| 6) (|SetCategory|) (|Aggregate|)
                      (|Evalable| 6) (|finiteAggregate|) (|PartialOrder|)
                      (|CoercibleTo| 37) (|BasicType|) (|Type|)
                      (|shallowlyMutable|) (|InnerEvalable| 6 6)
                      (|ConvertibleTo| 28))
                   (|makeByteWordVec2| 92
                                       '(2 9 8 6 0 10 0 9 0 11 3 9 17 0 6 17 18
                                         1 28 0 27 29 1 19 28 0 31 1 28 0 32 33
                                         1 0 28 0 34 1 9 19 0 35 1 6 37 0 38 2
                                         17 39 0 0 40 1 17 37 0 41 1 37 0 32 42
                                         1 37 0 32 43 1 9 49 0 50 2 9 8 6 0 51
                                         2 19 39 6 0 55 2 17 39 0 0 61 1 0 0 0
                                         66 0 39 0 69 0 39 0 70 2 17 39 0 0 81
                                         2 0 39 0 0 1 2 0 0 0 6 1 2 0 0 0 0 77
                                         2 0 0 6 0 1 2 0 0 0 0 80 2 0 39 0 0 84
                                         2 0 39 0 57 1 1 0 0 19 24 0 0 0 15 2 5
                                         0 63 0 71 2 5 0 63 0 1 0 0 0 1 1 0 0 0
                                         72 1 6 0 0 1 2 6 0 6 0 60 2 5 0 63 0
                                         64 3 0 0 6 0 17 62 3 0 0 63 0 17 65 2
                                         6 0 6 0 1 2 5 0 63 0 1 3 0 0 6 0 17 67
                                         3 0 0 63 0 17 68 4 6 6 86 0 6 6 1 3 5
                                         6 86 0 6 1 2 5 6 86 0 1 1 5 19 0 30 1
                                         0 0 19 21 1 0 0 6 26 0 0 0 13 2 0 39 0
                                         57 1 1 0 19 0 36 2 6 39 6 0 56 2 4 0
                                         74 0 75 2 0 0 74 0 76 2 0 39 0 57 1 1
                                         0 91 0 1 2 0 0 0 0 78 1 0 6 0 53 3 0 0
                                         6 0 57 73 2 0 0 6 0 54 2 0 89 89 0 1 1
                                         0 90 0 1 2 0 92 63 0 1 1 0 6 0 52 2 5
                                         39 63 0 1 3 1 0 0 6 6 1 3 1 0 0 19 19
                                         1 2 1 0 0 87 1 2 1 0 0 88 1 2 0 39 0 0
                                         1 1 0 39 0 48 0 0 0 12 1 0 46 0 47 2 0
                                         0 0 0 79 2 0 0 0 6 1 0 0 0 14 1 0 0 19
                                         23 2 6 57 6 0 59 2 5 57 63 0 1 1 0 0 0
                                         66 1 2 28 0 34 1 0 0 19 20 1 0 37 0 44
                                         1 0 0 19 25 0 0 0 16 1 0 0 19 22 2 5
                                         39 63 0 1 2 0 39 0 0 1 2 0 39 0 0 1 2
                                         0 39 0 0 82 2 0 39 0 0 85 2 0 39 0 0
                                         83 1 5 57 0 58)))))
           '|lookupComplete|)) 
