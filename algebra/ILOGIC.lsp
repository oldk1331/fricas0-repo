
(SDEFUN |ILOGIC;proposition;S$;1| ((|s| |String|) ($ $)) (CONS 1 (LIST |s|))) 

(SDEFUN |ILOGIC;logicT;$;2| (($ $)) (CONS 0 (LIST 'T))) 

(SDEFUN |ILOGIC;logicF;$;3| (($ $)) (CONS 0 (LIST 'F))) 

(SDEFUN |ILOGIC;~;2$;4| ((|b| $) ($ $))
        (SPROG ((#1=#:G203 NIL) (|d| ($)) (|c| ($)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |b| 0)
                    (COND
                     ((EQUAL (QCAR (CDR |b|)) 'T)
                      (PROGN
                       (LETT #1# (CONS 0 (LIST 'F)) . #2=(|ILOGIC;~;2$;4|))
                       (GO #3=#:G202))))))
                  (COND
                   ((QEQCAR |b| 3)
                    (SEQ (LETT |c| (QCDR (CDR |b|)) . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |c| 3)
                            (SEQ (LETT |d| (QCDR (CDR |c|)) . #2#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |d| 0)
                                    (COND
                                     ((EQUAL (QCAR (CDR |d|)) 'T)
                                      (PROGN
                                       (LETT #1# (CONS 0 (LIST 'F)) . #2#)
                                       (GO #3#))))))))))))))
                  (EXIT (CONS 3 (CONS 'NOT |b|)))))
                #3# (EXIT #1#)))) 

(SDEFUN |ILOGIC;/\\;3$;5| ((|a| $) (|b| $) ($ $))
        (SPROG ((#1=#:G220 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |a| 0)
                    (COND
                     ((EQUAL (QCAR (CDR |a|)) 'F)
                      (PROGN
                       (LETT #1# (CONS 0 (LIST 'F)) . #2=(|ILOGIC;/\\;3$;5|))
                       (GO #3=#:G219))))))
                  (COND
                   ((QEQCAR |b| 0)
                    (COND
                     ((EQUAL (QCAR (CDR |b|)) 'F)
                      (PROGN (LETT #1# (CONS 0 (LIST 'F)) . #2#) (GO #3#))))))
                  (COND
                   ((SPADCALL |a| |b| (QREFELT $ 13))
                    (PROGN (LETT #1# |a| . #2#) (GO #3#))))
                  (COND
                   ((SPADCALL |a| (SPADCALL |b| (QREFELT $ 11)) (QREFELT $ 13))
                    (PROGN (LETT #1# (CONS 0 (LIST 'F)) . #2#) (GO #3#))))
                  (COND
                   ((SPADCALL (SPADCALL |a| (QREFELT $ 11)) |b| (QREFELT $ 13))
                    (PROGN (LETT #1# (CONS 0 (LIST 'F)) . #2#) (GO #3#))))
                  (COND
                   ((QEQCAR |b| 0)
                    (COND
                     ((EQUAL (QCAR (CDR |b|)) 'T)
                      (PROGN (LETT #1# |a| . #2#) (GO #3#))))))
                  (COND
                   ((QEQCAR |a| 0)
                    (COND
                     ((EQUAL (QCAR (CDR |a|)) 'T)
                      (PROGN (LETT #1# |b| . #2#) (GO #3#))))))
                  (EXIT (CONS 2 (VECTOR 'AND |a| |b|)))))
                #3# (EXIT #1#)))) 

(SDEFUN |ILOGIC;\\/;3$;6| ((|a| $) (|b| $) ($ $))
        (SPROG ((#1=#:G235 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |a| 0)
                    (COND
                     ((EQUAL (QCAR (CDR |a|)) 'T)
                      (PROGN
                       (LETT #1# (CONS 0 (LIST 'T)) . #2=(|ILOGIC;\\/;3$;6|))
                       (GO #3=#:G234))))))
                  (COND
                   ((QEQCAR |b| 0)
                    (COND
                     ((EQUAL (QCAR (CDR |b|)) 'T)
                      (PROGN (LETT #1# (CONS 0 (LIST 'T)) . #2#) (GO #3#))))))
                  (COND
                   ((SPADCALL |a| |b| (QREFELT $ 13))
                    (PROGN (LETT #1# |a| . #2#) (GO #3#))))
                  (COND
                   ((QEQCAR |b| 0)
                    (COND
                     ((EQUAL (QCAR (CDR |b|)) 'F)
                      (PROGN (LETT #1# |a| . #2#) (GO #3#))))))
                  (COND
                   ((QEQCAR |a| 0)
                    (COND
                     ((EQUAL (QCAR (CDR |a|)) 'F)
                      (PROGN (LETT #1# |b| . #2#) (GO #3#))))))
                  (EXIT (CONS 2 (VECTOR 'OR |a| |b|)))))
                #3# (EXIT #1#)))) 

(SDEFUN |ILOGIC;implies;3$;7| ((|a| $) (|b| $) ($ $))
        (SPROG ((#1=#:G249 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |a| 0)
                    (COND
                     ((QEQCAR |b| 0)
                      (SEQ
                       (COND
                        ((SPADCALL (QCAR (CDR |a|)) 'F (QREFELT $ 17))
                         (COND
                          ((EQUAL (QCAR (CDR |b|)) 'F)
                           (PROGN
                            (LETT #1# (CONS 0 (LIST 'F))
                                  . #2=(|ILOGIC;implies;3$;7|))
                            (GO #3=#:G248))))))
                       (EXIT
                        (PROGN
                         (LETT #1# (CONS 0 (LIST 'T)) . #2#)
                         (GO #3#))))))))
                  (EXIT (CONS 2 (VECTOR 'IMPLY |a| |b|)))))
                #3# (EXIT #1#)))) 

(SDEFUN |ILOGIC;redux;2$;8| ((|n| $) ($ $))
        (SPROG ((#1=#:G263 NIL) (#2=#:G173 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |n| 0)
                    (PROGN
                     (LETT #1# |n| . #3=(|ILOGIC;redux;2$;8|))
                     (GO #4=#:G262))))
                  (COND ((QEQCAR |n| 1) (PROGN (LETT #1# |n| . #3#) (GO #4#))))
                  (COND
                   ((QEQCAR |n| 2)
                    (SEQ
                     (COND
                      ((EQUAL
                        (QVELT
                         (PROG2 (LETT #2# |n| . #3#)
                             (QCDR #2#)
                           (|check_union| (QEQCAR #2# 2)
                                          (|Record| (|:| |typ| (|Symbol|))
                                                    (|:| |c1| $) (|:| |c2| $))
                                          #2#))
                         0)
                        'IMPLY)
                       (PROGN
                        (LETT #1#
                              (SPADCALL
                               (SPADCALL
                                (QVELT
                                 (PROG2 (LETT #2# |n| . #3#)
                                     (QCDR #2#)
                                   (|check_union| (QEQCAR #2# 2)
                                                  (|Record|
                                                   (|:| |typ| (|Symbol|))
                                                   (|:| |c1| $) (|:| |c2| $))
                                                  #2#))
                                 1)
                                (QREFELT $ 19))
                               (SPADCALL
                                (QVELT
                                 (PROG2 (LETT #2# |n| . #3#)
                                     (QCDR #2#)
                                   (|check_union| (QEQCAR #2# 2)
                                                  (|Record|
                                                   (|:| |typ| (|Symbol|))
                                                   (|:| |c1| $) (|:| |c2| $))
                                                  #2#))
                                 2)
                                (QREFELT $ 19))
                               (QREFELT $ 18))
                              . #3#)
                        (GO #4#))))
                     (COND
                      ((EQUAL
                        (QVELT
                         (PROG2 (LETT #2# |n| . #3#)
                             (QCDR #2#)
                           (|check_union| (QEQCAR #2# 2)
                                          (|Record| (|:| |typ| (|Symbol|))
                                                    (|:| |c1| $) (|:| |c2| $))
                                          #2#))
                         0)
                        'AND)
                       (PROGN
                        (LETT #1#
                              (SPADCALL
                               (SPADCALL
                                (QVELT
                                 (PROG2 (LETT #2# |n| . #3#)
                                     (QCDR #2#)
                                   (|check_union| (QEQCAR #2# 2)
                                                  (|Record|
                                                   (|:| |typ| (|Symbol|))
                                                   (|:| |c1| $) (|:| |c2| $))
                                                  #2#))
                                 1)
                                (QREFELT $ 19))
                               (SPADCALL
                                (QVELT
                                 (PROG2 (LETT #2# |n| . #3#)
                                     (QCDR #2#)
                                   (|check_union| (QEQCAR #2# 2)
                                                  (|Record|
                                                   (|:| |typ| (|Symbol|))
                                                   (|:| |c1| $) (|:| |c2| $))
                                                  #2#))
                                 2)
                                (QREFELT $ 19))
                               (QREFELT $ 14))
                              . #3#)
                        (GO #4#))))
                     (EXIT
                      (COND
                       ((EQUAL
                         (QVELT
                          (PROG2 (LETT #2# |n| . #3#)
                              (QCDR #2#)
                            (|check_union| (QEQCAR #2# 2)
                                           (|Record| (|:| |typ| (|Symbol|))
                                                     (|:| |c1| $) (|:| |c2| $))
                                           #2#))
                          0)
                         'OR)
                        (PROGN
                         (LETT #1#
                               (SPADCALL
                                (SPADCALL
                                 (QVELT
                                  (PROG2 (LETT #2# |n| . #3#)
                                      (QCDR #2#)
                                    (|check_union| (QEQCAR #2# 2)
                                                   (|Record|
                                                    (|:| |typ| (|Symbol|))
                                                    (|:| |c1| $) (|:| |c2| $))
                                                   #2#))
                                  1)
                                 (QREFELT $ 19))
                                (SPADCALL
                                 (QVELT
                                  (PROG2 (LETT #2# |n| . #3#)
                                      (QCDR #2#)
                                    (|check_union| (QEQCAR #2# 2)
                                                   (|Record|
                                                    (|:| |typ| (|Symbol|))
                                                    (|:| |c1| $) (|:| |c2| $))
                                                   #2#))
                                  2)
                                 (QREFELT $ 19))
                                (QREFELT $ 15))
                               . #3#)
                         (GO #4#))))))))
                  (COND
                   ((QEQCAR |n| 3)
                    (PROGN
                     (LETT #1#
                           (SPADCALL (SPADCALL (QCDR (CDR |n|)) (QREFELT $ 19))
                                     (QREFELT $ 11))
                           . #3#)
                     (GO #4#))))
                  (EXIT |n|)))
                #4# (EXIT #1#)))) 

(SDEFUN |ILOGIC;factor;$L;9| ((|n| $) ($ |List| $))
        (SPROG ((|ch| (|List| $)) (#1=#:G276 NIL) (#2=#:G173 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((NOT (QEQCAR |n| 2))
                    (PROGN
                     (LETT #1# (LIST |n|) . #3=(|ILOGIC;factor;$L;9|))
                     (GO #4=#:G275))))
                  (COND
                   ((NOT
                     (EQUAL
                      (QVELT
                       (PROG2 (LETT #2# |n| . #3#)
                           (QCDR #2#)
                         (|check_union| (QEQCAR #2# 2)
                                        (|Record| (|:| |typ| (|Symbol|))
                                                  (|:| |c1| $) (|:| |c2| $))
                                        #2#))
                       0)
                      'AND))
                    (PROGN (LETT #1# (LIST |n|) . #3#) (GO #4#))))
                  (LETT |ch| (SPADCALL |n| (QREFELT $ 21)) . #3#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |ch| (QREFELT $ 23)) (QREFELT $ 24))
                    (SPADCALL (SPADCALL |ch| (QREFELT $ 25)) (QREFELT $ 24))
                    (QREFELT $ 26)))))
                #4# (EXIT #1#)))) 

(SDEFUN |ILOGIC;removeDup| ((|a| |List| $) (|b| |List| $) ($ |List| $))
        (SPROG
         ((|res| (|List| $)) (|fnd| (|Boolean|)) (#1=#:G283 NIL) (|a1| NIL)
          (#2=#:G282 NIL) (|b1| NIL))
         (SEQ (LETT |res| NIL . #3=(|ILOGIC;removeDup|))
              (SEQ (LETT |b1| NIL . #3#) (LETT #2# |b| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |b1| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |fnd| 'NIL . #3#)
                        (SEQ (LETT |a1| NIL . #3#) (LETT #1# |a| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |a1| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |a1| |b1| (QREFELT $ 13))
                                 (LETT |fnd| 'T . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL |fnd|)
                           (LETT |res| (SPADCALL |res| |b1| (QREFELT $ 27))
                                 . #3#)))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |ILOGIC;deductions1| ((|ln| |List| $) ($ |List| $))
        (SPROG
         ((|res| (|List| $)) (#1=#:G300 NIL) (|n2| NIL) (|ch| (|List| $))
          (#2=#:G299 NIL) (|n| NIL))
         (SEQ (LETT |res| NIL . #3=(|ILOGIC;deductions1|))
              (SEQ (LETT |n| NIL . #3#) (LETT #2# |ln| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |n| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((QEQCAR |n| 2)
                       (COND
                        ((EQUAL (QVELT (CDR |n|) 0) 'IMPLY)
                         (SEQ (LETT |ch| (SPADCALL |n| (QREFELT $ 21)) . #3#)
                              (EXIT
                               (SEQ (LETT |n2| NIL . #3#) (LETT #1# |ln| . #3#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |n2| (CAR #1#) . #3#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |ch| (QREFELT $ 23)) |n2|
                                         (QREFELT $ 13))
                                        (LETT |res|
                                              (SPADCALL |res|
                                                        (SPADCALL |ch|
                                                                  (QREFELT $
                                                                           25))
                                                        (QREFELT $ 27))
                                              . #3#)))))
                                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                    (EXIT NIL))))))))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |ILOGIC;deductions;2L;12| ((|ln| |List| $) ($ |List| $))
        (SPROG
         ((|loopbreaker| (|NonNegativeInteger|)) (|emptyres| (|Boolean|))
          (|res| (|List| $)) (|thisres| (|List| $)) (|allres| (|List| $)))
         (SEQ (LETT |res| NIL . #1=(|ILOGIC;deductions;2L;12|))
              (LETT |thisres| (|ILOGIC;deductions1| |ln| $) . #1#)
              (LETT |res| (SPADCALL |res| |thisres| (QREFELT $ 26)) . #1#)
              (LETT |emptyres| (SPADCALL |thisres| (QREFELT $ 28)) . #1#)
              (LETT |loopbreaker| 1 . #1#)
              (SEQ G190
                   (COND
                    ((NULL (COND (|emptyres| 'NIL) ('T (< |loopbreaker| 20))))
                     (GO G191)))
                   (SEQ
                    (LETT |allres| (SPADCALL |ln| |res| (QREFELT $ 26)) . #1#)
                    (LETT |thisres| (|ILOGIC;deductions1| |allres| $) . #1#)
                    (LETT |thisres| (|ILOGIC;removeDup| |res| |thisres| $)
                          . #1#)
                    (LETT |thisres| (|ILOGIC;removeDup| |allres| |thisres| $)
                          . #1#)
                    (LETT |res| (SPADCALL |res| |thisres| (QREFELT $ 26))
                          . #1#)
                    (LETT |emptyres| (SPADCALL |thisres| (QREFELT $ 28)) . #1#)
                    (EXIT (LETT |loopbreaker| (+ |loopbreaker| 1) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |ILOGIC;opType;$S;13| ((|n| $) ($ |Symbol|))
        (SPROG ((#1=#:G308 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |n| 2)
                    (PROGN
                     (LETT #1# (QVELT (CDR |n|) 0)
                           . #2=(|ILOGIC;opType;$S;13|))
                     (GO #3=#:G307))))
                  (COND
                   ((QEQCAR |n| 3) (PROGN (LETT #1# 'NOT . #2#) (GO #3#))))
                  (EXIT 'OTHER)))
                #3# (EXIT #1#)))) 

(SDEFUN |ILOGIC;atom?;$B;14| ((|n| $) ($ |Boolean|))
        (COND ((QEQCAR |n| 1) 'T) ('T (QEQCAR |n| 0)))) 

(SDEFUN |ILOGIC;value;$S;15| ((|n| $) ($ |Symbol|))
        (SPROG ((#1=#:G323 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |n| 0)
                    (SEQ
                     (COND
                      ((EQUAL (QCAR (CDR |n|)) 'F)
                       (PROGN
                        (LETT #1# 'F . #2=(|ILOGIC;value;$S;15|))
                        (GO #3=#:G322))))
                     (COND
                      ((EQUAL (QCAR (CDR |n|)) 'T)
                       (PROGN (LETT #1# 'T . #2#) (GO #3#))))
                     (EXIT (PROGN (LETT #1# 'E . #2#) (GO #3#))))))
                  (COND ((QEQCAR |n| 1) (PROGN (LETT #1# 'P . #2#) (GO #3#))))
                  (EXIT 'C)))
                #3# (EXIT #1#)))) 

(SDEFUN |ILOGIC;getChildren;$L;16| ((|n| $) ($ |List| $))
        (SPROG ((#1=#:G329 NIL) (#2=#:G174 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |n| (QREFELT $ 31))
                    (PROGN
                     (LETT #1# NIL . #3=(|ILOGIC;getChildren;$L;16|))
                     (GO #4=#:G328))))
                  (COND
                   ((QEQCAR |n| 2)
                    (PROGN
                     (LETT #1# (LIST (QVELT (CDR |n|) 1) (QVELT (CDR |n|) 2))
                           . #3#)
                     (GO #4#))))
                  (EXIT
                   (COND
                    ((QEQCAR |n| 3)
                     (PROGN
                      (LETT #1#
                            (LIST
                             (QCDR
                              (PROG2 (LETT #2# |n| . #3#)
                                  (QCDR #2#)
                                (|check_union| (QEQCAR #2# 3)
                                               (|Record| (|:| |typ| (|Symbol|))
                                                         (|:| |c1| $))
                                               #2#))))
                            . #3#)
                      (GO #4#)))))))
                #4# (EXIT #1#)))) 

(SDEFUN |ILOGIC;=;2$B;17| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG ((#1=#:G354 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |a| 0)
                    (COND
                     ((QEQCAR |b| 0)
                      (SEQ
                       (COND
                        ((EQUAL (QCAR (CDR |a|)) 'F)
                         (COND
                          ((EQUAL (QCAR (CDR |b|)) 'F)
                           (PROGN
                            (LETT #1# 'T . #2=(|ILOGIC;=;2$B;17|))
                            (GO #3=#:G353))))))
                       (COND
                        ((EQUAL (QCAR (CDR |a|)) 'T)
                         (COND
                          ((EQUAL (QCAR (CDR |b|)) 'T)
                           (PROGN (LETT #1# 'T . #2#) (GO #3#))))))
                       (EXIT (PROGN (LETT #1# 'NIL . #2#) (GO #3#))))))))
                  (COND
                   ((QEQCAR |a| 1)
                    (COND
                     ((QEQCAR |b| 1)
                      (SEQ
                       (COND
                        ((EQUAL (QCAR (CDR |a|)) (QCAR (CDR |b|)))
                         (PROGN (LETT #1# 'T . #2#) (GO #3#))))
                       (EXIT (PROGN (LETT #1# 'NIL . #2#) (GO #3#))))))))
                  (COND
                   ((QEQCAR |a| 2)
                    (COND
                     ((QEQCAR |b| 2)
                      (SEQ
                       (COND
                        ((SPADCALL (QVELT (CDR |a|) 0) (QVELT (CDR |b|) 0)
                                   (QREFELT $ 17))
                         (PROGN (LETT #1# 'NIL . #2#) (GO #3#))))
                       (COND
                        ((SPADCALL (QVELT (CDR |a|) 1) (QVELT (CDR |b|) 1)
                                   (QREFELT $ 13))
                         (COND
                          ((SPADCALL (QVELT (CDR |a|) 2) (QVELT (CDR |b|) 2)
                                     (QREFELT $ 13))
                           (PROGN (LETT #1# 'T . #2#) (GO #3#))))))
                       (EXIT (PROGN (LETT #1# 'NIL . #2#) (GO #3#))))))))
                  (COND
                   ((QEQCAR |a| 3)
                    (COND
                     ((QEQCAR |b| 3)
                      (SEQ
                       (COND
                        ((SPADCALL (QCAR (CDR |a|)) (QCAR (CDR |b|))
                                   (QREFELT $ 17))
                         (PROGN (LETT #1# 'NIL . #2#) (GO #3#))))
                       (COND
                        ((SPADCALL (QCDR (CDR |a|)) (QCDR (CDR |b|))
                                   (QREFELT $ 13))
                         (PROGN (LETT #1# 'T . #2#) (GO #3#))))
                       (EXIT (PROGN (LETT #1# 'NIL . #2#) (GO #3#))))))))
                  (EXIT 'NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |ILOGIC;parseBracketTerm|
        ((|t1| |String|) (|pin| . #1=(|NonNegativeInteger|))
         ($ |Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|))))
        (SPROG
         ((|p1| #1#) (#2=#:G364 NIL) (|ch| (|Character|)) (|trm| ($))
          (|r2| (|Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|)))))
         (SEQ
          (EXIT
           (SEQ (LETT |p1| |pin| . #3=(|ILOGIC;parseBracketTerm|))
                (LETT |trm| (SPADCALL (QREFELT $ 9)) . #3#)
                (LETT |ch| (STR_ELT1 |t1| |p1|) . #3#)
                (COND
                 ((NULL (|eql_SI| |ch| (|STR_to_CHAR| "(")))
                  (SEQ (|error| "bracket term must start with (")
                       (EXIT
                        (PROGN
                         (LETT #2# (CONS |trm| |p1|) . #3#)
                         (GO #4=#:G363))))))
                (LETT |p1| (+ |p1| 1) . #3#)
                (COND
                 ((SPADCALL |p1| (SPADCALL |t1| (QREFELT $ 34)) (QREFELT $ 35))
                  (SEQ (|error| "opening but no closing bracket")
                       (EXIT
                        (PROGN (LETT #2# (CONS |trm| |p1|) . #3#) (GO #4#))))))
                (LETT |r2| (SPADCALL |t1| |p1| (QREFELT $ 38)) . #3#)
                (LETT |trm| (QCAR |r2|) . #3#) (LETT |p1| (QCDR |r2|) . #3#)
                (LETT |ch| (STR_ELT1 |t1| |p1|) . #3#)
                (COND
                 ((NULL (|eql_SI| |ch| (|STR_to_CHAR| ")")))
                  (SEQ (|error| "can't find closing bracket")
                       (EXIT
                        (PROGN (LETT #2# (CONS |trm| |p1|) . #3#) (GO #4#))))))
                (LETT |p1| (+ |p1| 1) . #3#) (EXIT (CONS |trm| |p1|))))
          #4# (EXIT #2#)))) 

(SDEFUN |ILOGIC;parseILand|
        ((|t1| |String|) (|pin| . #1=(|NonNegativeInteger|)) (|firstTerm| $)
         ($ |Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|))))
        (SPROG
         ((|p1| #1#) (|secondTerm| ($))
          (|r| (|Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|))))
          (#2=#:G371 NIL) (|ch| (|Character|)) (|trm| ($)) (|pt| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |p1| |pin| . #3=(|ILOGIC;parseILand|))
                (LETT |pt| |pin| . #3#)
                (LETT |trm| (SPADCALL (QREFELT $ 9)) . #3#)
                (LETT |ch| (STR_ELT1 |t1| |p1|) . #3#)
                (COND
                 ((NULL (|eql_SI| |ch| (|STR_to_CHAR| "/")))
                  (SEQ (|error| "expecting /\\")
                       (EXIT
                        (PROGN
                         (LETT #2# (CONS |trm| |p1|) . #3#)
                         (GO #4=#:G370))))))
                (LETT |p1| (+ |p1| 1) . #3#)
                (LETT |ch| (STR_ELT1 |t1| |p1|) . #3#)
                (COND
                 ((NULL (|eql_SI| |ch| (|STR_to_CHAR| "\\")))
                  (SEQ (|error| "expecting /\\")
                       (EXIT
                        (PROGN (LETT #2# (CONS |trm| |p1|) . #3#) (GO #4#))))))
                (LETT |p1| (+ |p1| 1) . #3#)
                (LETT |r| (SPADCALL |t1| |p1| (QREFELT $ 38)) . #3#)
                (LETT |secondTerm| (QCAR |r|) . #3#)
                (LETT |p1| (QCDR |r|) . #3#)
                (EXIT
                 (CONS (SPADCALL |firstTerm| |secondTerm| (QREFELT $ 14))
                       |p1|))))
          #4# (EXIT #2#)))) 

(SDEFUN |ILOGIC;parseILor|
        ((|t1| |String|) (|pin| . #1=(|NonNegativeInteger|)) (|firstTerm| $)
         ($ |Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|))))
        (SPROG
         ((|p1| #1#) (|secondTerm| ($))
          (|r| (|Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|))))
          (#2=#:G378 NIL) (|ch| (|Character|)) (|trm| ($)) (|pt| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |p1| |pin| . #3=(|ILOGIC;parseILor|))
                (LETT |pt| |pin| . #3#)
                (LETT |trm| (SPADCALL (QREFELT $ 9)) . #3#)
                (LETT |ch| (STR_ELT1 |t1| |p1|) . #3#)
                (COND
                 ((NULL (|eql_SI| |ch| (|STR_to_CHAR| "\\")))
                  (SEQ (|error| "expecting \\/")
                       (EXIT
                        (PROGN
                         (LETT #2# (CONS |trm| |p1|) . #3#)
                         (GO #4=#:G377))))))
                (LETT |p1| (+ |p1| 1) . #3#)
                (LETT |ch| (STR_ELT1 |t1| |p1|) . #3#)
                (COND
                 ((NULL (|eql_SI| |ch| (|STR_to_CHAR| "/")))
                  (SEQ (|error| "expecting \\/")
                       (EXIT
                        (PROGN (LETT #2# (CONS |trm| |p1|) . #3#) (GO #4#))))))
                (LETT |p1| (+ |p1| 1) . #3#)
                (LETT |r| (SPADCALL |t1| |p1| (QREFELT $ 38)) . #3#)
                (LETT |secondTerm| (QCAR |r|) . #3#)
                (LETT |p1| (QCDR |r|) . #3#)
                (EXIT
                 (CONS (SPADCALL |firstTerm| |secondTerm| (QREFELT $ 15))
                       |p1|))))
          #4# (EXIT #2#)))) 

(SDEFUN |ILOGIC;parseILfn|
        ((|t1| |String|) (|pin| . #1=(|NonNegativeInteger|)) (|firstTerm| $)
         ($ |Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|))))
        (SPROG
         ((|p1| #1#) (|secondTerm| ($))
          (|r| (|Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|))))
          (#2=#:G385 NIL) (|ch| (|Character|)) (|trm| ($)) (|pt| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |p1| |pin| . #3=(|ILOGIC;parseILfn|))
                (LETT |pt| |pin| . #3#)
                (LETT |trm| (SPADCALL (QREFELT $ 9)) . #3#)
                (LETT |ch| (STR_ELT1 |t1| |p1|) . #3#)
                (COND
                 ((NULL (|eql_SI| |ch| (|STR_to_CHAR| "-")))
                  (SEQ (|error| "expecting ->")
                       (EXIT
                        (PROGN
                         (LETT #2# (CONS |trm| |p1|) . #3#)
                         (GO #4=#:G384))))))
                (LETT |p1| (+ |p1| 1) . #3#)
                (LETT |ch| (STR_ELT1 |t1| |p1|) . #3#)
                (COND
                 ((NULL (|eql_SI| |ch| (|STR_to_CHAR| ">")))
                  (SEQ (|error| "expecting ->")
                       (EXIT
                        (PROGN (LETT #2# (CONS |trm| |p1|) . #3#) (GO #4#))))))
                (LETT |p1| (+ |p1| 1) . #3#)
                (LETT |r| (SPADCALL |t1| |p1| (QREFELT $ 38)) . #3#)
                (LETT |secondTerm| (QCAR |r|) . #3#)
                (LETT |p1| (QCDR |r|) . #3#)
                (EXIT
                 (CONS (SPADCALL |firstTerm| |secondTerm| (QREFELT $ 18))
                       |p1|))))
          #4# (EXIT #2#)))) 

(SDEFUN |ILOGIC;parseILName|
        ((|t1| |String|) (|pin| . #1=(|NonNegativeInteger|))
         ($ |Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|))))
        (SPROG
         ((|ch| (|Character|)) (#2=#:G391 NIL) (|pt| #1#) (|vnm| (|String|)))
         (SEQ
          (EXIT
           (SEQ (LETT |vnm| "" . #3=(|ILOGIC;parseILName|))
                (LETT |pt| |pin| . #3#) (LETT |ch| (STR_ELT1 |t1| |pt|) . #3#)
                (SEQ G190
                     (COND ((NULL (SPADCALL |ch| (QREFELT $ 40))) (GO G191)))
                     (SEQ
                      (LETT |vnm| (SPADCALL |vnm| |ch| (QREFELT $ 41)) . #3#)
                      (LETT |pt| (+ |pt| 1) . #3#)
                      (COND
                       ((SPADCALL |pt| (SPADCALL |t1| (QREFELT $ 34))
                                  (QREFELT $ 35))
                        (PROGN
                         (LETT #2# (CONS (SPADCALL |vnm| (QREFELT $ 8)) |pt|)
                               . #3#)
                         (GO #4=#:G390))))
                      (EXIT (LETT |ch| (STR_ELT1 |t1| |pt|) . #3#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (CONS (SPADCALL |vnm| (QREFELT $ 8)) |pt|))))
          #4# (EXIT #2#)))) 

(SDEFUN |ILOGIC;parseILTerm;SNniR;23|
        ((|t1| |String|) (|pin| |NonNegativeInteger|)
         ($ |Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|))))
        (SPROG
         ((|p1| (|NonNegativeInteger|)) (|res| ($))
          (|r| (|Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|))))
          (|ch| (|Character|)) (#1=#:G408 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |p1| |pin| . #2=(|ILOGIC;parseILTerm;SNniR;23|))
                (LETT |res| (SPADCALL (QREFELT $ 9)) . #2#)
                (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)
                (SEQ G190
                     (COND
                      ((NULL (|eql_SI| |ch| (|STR_to_CHAR| " "))) (GO G191)))
                     (SEQ (LETT |p1| (+ |p1| 1) . #2#)
                          (COND
                           ((SPADCALL |p1| (SPADCALL |t1| (QREFELT $ 34))
                                      (QREFELT $ 35))
                            (PROGN
                             (LETT #1# (CONS |res| |p1|) . #2#)
                             (GO #3=#:G407))))
                          (EXIT (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |r| (CONS |res| |p1|) . #2#)
                (COND
                 ((SPADCALL |ch| (QREFELT $ 42))
                  (LETT |r| (|ILOGIC;parseILName| |t1| |p1| $) . #2#)))
                (COND
                 ((|eql_SI| |ch| (|STR_to_CHAR| "("))
                  (LETT |r| (|ILOGIC;parseBracketTerm| |t1| |p1| $) . #2#)))
                (LETT |res| (QCAR |r|) . #2#) (LETT |p1| (QCDR |r|) . #2#)
                (COND
                 ((SPADCALL |p1| (SPADCALL |t1| (QREFELT $ 34)) (QREFELT $ 35))
                  (PROGN (LETT #1# (CONS |res| |p1|) . #2#) (GO #3#))))
                (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)
                (COND
                 ((|eql_SI| |ch| (|STR_to_CHAR| " "))
                  (SEQ (LETT |p1| (+ |p1| 1) . #2#)
                       (EXIT
                        (COND
                         ((SPADCALL |p1| (SPADCALL |t1| (QREFELT $ 34))
                                    (QREFELT $ 35))
                          (PROGN
                           (LETT #1# (CONS |res| |p1|) . #2#)
                           (GO #3#))))))))
                (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)
                (COND
                 ((|eql_SI| |ch| (|STR_to_CHAR| "/"))
                  (SEQ (LETT |r| (|ILOGIC;parseILand| |t1| |p1| |res| $) . #2#)
                       (LETT |res| (QCAR |r|) . #2#)
                       (EXIT (LETT |p1| (QCDR |r|) . #2#)))))
                (COND
                 ((|eql_SI| |ch| (|STR_to_CHAR| "\\"))
                  (SEQ (LETT |r| (|ILOGIC;parseILor| |t1| |p1| |res| $) . #2#)
                       (LETT |res| (QCAR |r|) . #2#)
                       (EXIT (LETT |p1| (QCDR |r|) . #2#)))))
                (COND
                 ((|eql_SI| |ch| (|STR_to_CHAR| "-"))
                  (SEQ (LETT |r| (|ILOGIC;parseILfn| |t1| |p1| |res| $) . #2#)
                       (LETT |res| (QCAR |r|) . #2#)
                       (EXIT (LETT |p1| (QCDR |r|) . #2#)))))
                (EXIT (CONS |res| |p1|))))
          #3# (EXIT #1#)))) 

(SDEFUN |ILOGIC;parseIL2;SNniR;24|
        ((|t1| |String|) (|pin| |NonNegativeInteger|)
         ($ |Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|))))
        (SPROG
         ((|p1| (|NonNegativeInteger|)) (|res| ($))
          (|r| (|Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|))))
          (|ch| (|Character|)) (#1=#:G416 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |p1| |pin| . #2=(|ILOGIC;parseIL2;SNniR;24|))
                (LETT |res| (SPADCALL (QREFELT $ 9)) . #2#)
                (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)
                (SEQ G190
                     (COND
                      ((NULL (|eql_SI| |ch| (|STR_to_CHAR| " "))) (GO G191)))
                     (SEQ (LETT |p1| (+ |p1| 1) . #2#)
                          (COND
                           ((SPADCALL |p1| (SPADCALL |t1| (QREFELT $ 34))
                                      (QREFELT $ 35))
                            (PROGN
                             (LETT #1# (CONS |res| |p1|) . #2#)
                             (GO #3=#:G415))))
                          (EXIT (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |r| (CONS |res| |p1|) . #2#)
                (COND
                 ((SPADCALL |ch| (QREFELT $ 42))
                  (LETT |r| (|ILOGIC;parseILName| |t1| |p1| $) . #2#)))
                (COND
                 ((|eql_SI| |ch| (|STR_to_CHAR| "("))
                  (LETT |r| (|ILOGIC;parseBracketTerm| |t1| |p1| $) . #2#)))
                (LETT |res| (QCAR |r|) . #2#) (LETT |p1| (QCDR |r|) . #2#)
                (EXIT (CONS |res| |p1|))))
          #3# (EXIT #1#)))) 

(SDEFUN |ILOGIC;parseIL;S$;25| ((|t1| |String|) ($ $))
        (SPROG
         ((|r| (|Record| (|:| |rft| $) (|:| |pout| (|NonNegativeInteger|))))
          (#1=#:G417 NIL))
         (SEQ
          (LETT |r|
                (SPADCALL |t1|
                          (PROG1
                              (LETT #1# (SPADCALL |t1| (QREFELT $ 44))
                                    . #2=(|ILOGIC;parseIL;S$;25|))
                            (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                             #1#))
                          (QREFELT $ 38))
                . #2#)
          (EXIT (QCAR |r|))))) 

(SDEFUN |ILOGIC;toString;$S;26| ((|n| $) ($ |String|))
        (SPROG ((#1=#:G436 NIL) (#2=#:G173 NIL) (|s1| (|String|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |n| 0)
                    (SEQ
                     (COND
                      ((EQUAL (QCAR (CDR |n|)) 'F)
                       (PROGN
                        (LETT #1# "_|_" . #3=(|ILOGIC;toString;$S;26|))
                        (GO #4=#:G435))))
                     (COND
                      ((EQUAL (QCAR (CDR |n|)) 'T)
                       (PROGN (LETT #1# "T" . #3#) (GO #4#))))
                     (EXIT (PROGN (LETT #1# "?" . #3#) (GO #4#))))))
                  (COND
                   ((QEQCAR |n| 1)
                    (PROGN (LETT #1# (QCAR (CDR |n|)) . #3#) (GO #4#))))
                  (COND
                   ((QEQCAR |n| 2)
                    (SEQ (LETT |s1| "->" . #3#)
                         (COND
                          ((EQUAL
                            (QVELT
                             (PROG2 (LETT #2# |n| . #3#)
                                 (QCDR #2#)
                               (|check_union| (QEQCAR #2# 2)
                                              (|Record| (|:| |typ| (|Symbol|))
                                                        (|:| |c1| $)
                                                        (|:| |c2| $))
                                              #2#))
                             0)
                            'AND)
                           (LETT |s1| "/\\" . #3#)))
                         (COND
                          ((EQUAL
                            (QVELT
                             (PROG2 (LETT #2# |n| . #3#)
                                 (QCDR #2#)
                               (|check_union| (QEQCAR #2# 2)
                                              (|Record| (|:| |typ| (|Symbol|))
                                                        (|:| |c1| $)
                                                        (|:| |c2| $))
                                              #2#))
                             0)
                            'OR)
                           (LETT |s1| "\\/" . #3#)))
                         (EXIT
                          (PROGN
                           (LETT #1#
                                 (SPADCALL
                                  (LIST "("
                                        (SPADCALL
                                         (QVELT
                                          (PROG2 (LETT #2# |n| . #3#)
                                              (QCDR #2#)
                                            (|check_union| (QEQCAR #2# 2)
                                                           (|Record|
                                                            (|:| |typ|
                                                                 (|Symbol|))
                                                            (|:| |c1| $)
                                                            (|:| |c2| $))
                                                           #2#))
                                          1)
                                         (QREFELT $ 46))
                                        |s1|
                                        (SPADCALL
                                         (QVELT
                                          (PROG2 (LETT #2# |n| . #3#)
                                              (QCDR #2#)
                                            (|check_union| (QEQCAR #2# 2)
                                                           (|Record|
                                                            (|:| |typ|
                                                                 (|Symbol|))
                                                            (|:| |c1| $)
                                                            (|:| |c2| $))
                                                           #2#))
                                          2)
                                         (QREFELT $ 46))
                                        ")")
                                  (QREFELT $ 47))
                                 . #3#)
                           (GO #4#))))))
                  (COND
                   ((QEQCAR |n| 3)
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (LIST "~("
                                  (SPADCALL (QCDR (CDR |n|)) (QREFELT $ 46))
                                  ")")
                            (QREFELT $ 47))
                           . #3#)
                     (GO #4#))))
                  (EXIT "error")))
                #4# (EXIT #1#)))) 

(SDEFUN |ILOGIC;toStringUnwrapped;$S;27| ((|n| $) ($ |String|))
        (SPROG ((#1=#:G453 NIL) (#2=#:G173 NIL) (|s1| (|String|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |n| 0)
                    (SEQ
                     (COND
                      ((EQUAL (QCAR (CDR |n|)) 'F)
                       (PROGN
                        (LETT #1# "_|_"
                              . #3=(|ILOGIC;toStringUnwrapped;$S;27|))
                        (GO #4=#:G452))))
                     (COND
                      ((EQUAL (QCAR (CDR |n|)) 'T)
                       (PROGN (LETT #1# "T" . #3#) (GO #4#))))
                     (EXIT (PROGN (LETT #1# "?" . #3#) (GO #4#))))))
                  (COND
                   ((QEQCAR |n| 1)
                    (PROGN (LETT #1# (QCAR (CDR |n|)) . #3#) (GO #4#))))
                  (COND
                   ((QEQCAR |n| 2)
                    (SEQ (LETT |s1| "->" . #3#)
                         (COND
                          ((EQUAL
                            (QVELT
                             (PROG2 (LETT #2# |n| . #3#)
                                 (QCDR #2#)
                               (|check_union| (QEQCAR #2# 2)
                                              (|Record| (|:| |typ| (|Symbol|))
                                                        (|:| |c1| $)
                                                        (|:| |c2| $))
                                              #2#))
                             0)
                            'AND)
                           (LETT |s1| "/\\" . #3#)))
                         (COND
                          ((EQUAL
                            (QVELT
                             (PROG2 (LETT #2# |n| . #3#)
                                 (QCDR #2#)
                               (|check_union| (QEQCAR #2# 2)
                                              (|Record| (|:| |typ| (|Symbol|))
                                                        (|:| |c1| $)
                                                        (|:| |c2| $))
                                              #2#))
                             0)
                            'OR)
                           (LETT |s1| "\\/" . #3#)))
                         (EXIT
                          (PROGN
                           (LETT #1#
                                 (SPADCALL
                                  (LIST
                                   (SPADCALL
                                    (QVELT
                                     (PROG2 (LETT #2# |n| . #3#)
                                         (QCDR #2#)
                                       (|check_union| (QEQCAR #2# 2)
                                                      (|Record|
                                                       (|:| |typ| (|Symbol|))
                                                       (|:| |c1| $)
                                                       (|:| |c2| $))
                                                      #2#))
                                     1)
                                    (QREFELT $ 46))
                                   |s1|
                                   (SPADCALL
                                    (QVELT
                                     (PROG2 (LETT #2# |n| . #3#)
                                         (QCDR #2#)
                                       (|check_union| (QEQCAR #2# 2)
                                                      (|Record|
                                                       (|:| |typ| (|Symbol|))
                                                       (|:| |c1| $)
                                                       (|:| |c2| $))
                                                      #2#))
                                     2)
                                    (QREFELT $ 46)))
                                  (QREFELT $ 47))
                                 . #3#)
                           (GO #4#))))))
                  (COND
                   ((QEQCAR |n| 3)
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (LIST "~("
                                  (SPADCALL (QCDR (CDR |n|)) (QREFELT $ 46))
                                  ")")
                            (QREFELT $ 47))
                           . #3#)
                     (GO #4#))))
                  (EXIT "error")))
                #4# (EXIT #1#)))) 

(SDEFUN |ILOGIC;coerce;$Of;28| ((|n| $) ($ |OutputForm|))
        (SPADCALL (SPADCALL |n| (QREFELT $ 46)) (QREFELT $ 50))) 

(DECLAIM (NOTINLINE |ILogic;|)) 

(DEFUN |ILogic| ()
  (SPROG NIL
         (PROG (#1=#:G456)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ILogic|) . #2=(|ILogic|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ILogic|
                             (LIST (CONS NIL (CONS 1 (|ILogic;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|ILogic|)))))))))) 

(DEFUN |ILogic;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ILogic|) . #1=(|ILogic|))
          (LETT $ (GETREFV 52) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ILogic| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                             (|:| |var| (|Record| (|:| |str| (|String|))))
                             (|:| |binaryOp|
                                  (|Record| (|:| |typ| (|Symbol|)) (|:| |c1| $)
                                            (|:| |c2| $)))
                             (|:| |unaryOp|
                                  (|Record| (|:| |typ| (|Symbol|))
                                            (|:| |c1| $)))))
          $))) 

(MAKEPROP '|ILogic| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|String|)
              |ILOGIC;proposition;S$;1| |ILOGIC;logicT;$;2| |ILOGIC;logicF;$;3|
              |ILOGIC;~;2$;4| (|Boolean|) |ILOGIC;=;2$B;17| |ILOGIC;/\\;3$;5|
              |ILOGIC;\\/;3$;6| (|Symbol|) (0 . ~=) |ILOGIC;implies;3$;7|
              |ILOGIC;redux;2$;8| (|List| $) |ILOGIC;getChildren;$L;16|
              (|List| $$) (6 . |first|) |ILOGIC;factor;$L;9| (11 . |second|)
              (16 . |concat|) (22 . |concat|) (28 . |empty?|)
              |ILOGIC;deductions;2L;12| |ILOGIC;opType;$S;13|
              |ILOGIC;atom?;$B;14| |ILOGIC;value;$S;15| (|Integer|)
              (33 . |maxIndex|) (38 . >)
              (|Record| (|:| |rft| $) (|:| |pout| 37)) (|NonNegativeInteger|)
              |ILOGIC;parseILTerm;SNniR;23| (|Character|)
              (44 . |alphanumeric?|) (49 . |concat|) (55 . |alphabetic?|)
              |ILOGIC;parseIL2;SNniR;24| (60 . |minIndex|)
              |ILOGIC;parseIL;S$;25| |ILOGIC;toString;$S;26| (65 . |concat|)
              |ILOGIC;toStringUnwrapped;$S;27| (|OutputForm|) (70 . |coerce|)
              |ILOGIC;coerce;$Of;28|)
           '#(~= 75 ~ 81 |value| 86 |toStringUnwrapped| 91 |toString| 96
              |redux| 101 |proposition| 106 |parseILTerm| 111 |parseIL2| 117
              |parseIL| 123 |opType| 128 |logicT| 133 |logicF| 137 |implies|
              141 |getChildren| 147 |factor| 152 |deductions| 157 |coerce| 162
              |atom?| 167 |\\/| 172 = 178 |/\\| 184)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|Logic&| |BasicType&| NIL)
                       (CONS '#((|Logic|) (|BasicType|) (|CoercibleTo| 49))
                             (|makeByteWordVec2| 51
                                                 '(2 16 12 0 0 17 1 22 2 0 23 1
                                                   22 2 0 25 2 22 0 0 0 26 2 22
                                                   0 0 2 27 1 22 12 0 28 1 7 33
                                                   0 34 2 33 12 0 0 35 1 39 12
                                                   0 40 2 7 0 0 39 41 1 39 12 0
                                                   42 1 7 33 0 44 1 7 0 20 47 1
                                                   7 49 0 50 2 0 12 0 0 1 1 0 0
                                                   0 11 1 0 16 0 32 1 0 7 0 48
                                                   1 0 7 0 46 1 0 0 0 19 1 0 0
                                                   7 8 2 0 36 7 37 38 2 0 36 7
                                                   37 43 1 0 0 7 45 1 0 16 0 30
                                                   0 0 0 9 0 0 0 10 2 0 0 0 0
                                                   18 1 0 20 0 21 1 0 20 0 24 1
                                                   0 20 20 29 1 0 49 0 51 1 0
                                                   12 0 31 2 0 0 0 0 15 2 0 12
                                                   0 0 13 2 0 0 0 0 14)))))
           '|lookupComplete|)) 

(MAKEPROP '|ILogic| 'NILADIC T) 
