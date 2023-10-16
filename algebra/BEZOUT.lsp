
(SDEFUN |BEZOUT;sylvesterMatrix;2UPM;1| ((|p| UP) (|q| UP) ($ M))
        (SPROG
         ((#1=#:G124 NIL) (|i| NIL) (|q0| (UP))
          (|deg| #2=(|NonNegativeInteger|)) (|coef| (R)) (#3=#:G123 NIL)
          (|p0| (UP)) (|minC| (|Integer|)) (|minR| (|Integer|)) (|sylmat| (M))
          (|n| (|NonNegativeInteger|)) (|n2| #2#) (|n1| #2#))
         (SEQ
          (COND
           ((OR (SPADCALL |p| (|spadConstant| $ 12) (QREFELT $ 14))
                (SPADCALL |q| (|spadConstant| $ 12) (QREFELT $ 14)))
            (|error| "sylvesterMatrix: argument is zero")))
          (LETT |n1| (SPADCALL |p| (QREFELT $ 16)))
          (LETT |n2| (SPADCALL |q| (QREFELT $ 16))) (LETT |n| (+ |n1| |n2|))
          (LETT |sylmat|
                (SPADCALL |n| |n| (|spadConstant| $ 11) (QREFELT $ 17)))
          (LETT |minR| (SPADCALL |sylmat| (QREFELT $ 19)))
          (LETT |minC| (SPADCALL |sylmat| (QREFELT $ 20))) (LETT |p0| |p|)
          (SEQ G190
               (COND ((NULL (NULL (SPADCALL |p0| (QREFELT $ 21)))) (GO G191)))
               (SEQ (LETT |coef| (SPADCALL |p0| (QREFELT $ 22)))
                    (LETT |deg| (SPADCALL |p0| (QREFELT $ 16)))
                    (LETT |p0| (SPADCALL |p0| (QREFELT $ 23)))
                    (EXIT
                     (SEQ (LETT |i| 0) (LETT #3# (- |n2| 1)) G190
                          (COND ((|greater_SI| |i| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |sylmat| (+ |minR| |i|)
                                      (+ (- (+ |minC| |n1|) |deg|) |i|) |coef|
                                      (QREFELT $ 26))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |q0| |q|)
          (SEQ G190
               (COND ((NULL (NULL (SPADCALL |q0| (QREFELT $ 21)))) (GO G191)))
               (SEQ (LETT |coef| (SPADCALL |q0| (QREFELT $ 22)))
                    (LETT |deg| (SPADCALL |q0| (QREFELT $ 16)))
                    (LETT |q0| (SPADCALL |q0| (QREFELT $ 23)))
                    (EXIT
                     (SEQ (LETT |i| 0) (LETT #1# (- |n1| 1)) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |sylmat| (+ (+ |minR| |n2|) |i|)
                                      (+ (- (+ |minC| |n2|) |deg|) |i|) |coef|
                                      (QREFELT $ 26))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |sylmat|)))) 

(SDEFUN |BEZOUT;subSylvesterMatrix;MNniM;2|
        ((|sylmat| M) (|j| |NonNegativeInteger|) ($ M))
        (SPROG
         ((|colRange| (|Segment| (|Integer|)))
          (|rowRange| (|List| (|Segment| (|Integer|)))) (|n| #1=(|Integer|))
          (|m| #1#) (|colIndex| (|Integer|)) (|firstcol| (|Col|))
          (|len| (|NonNegativeInteger|)) (|maxC| (|Integer|))
          (|maxR| (|Integer|)) (|minC| (|Integer|)) (|minR| (|Integer|)))
         (SEQ
          (COND ((EQL |j| 0) |sylmat|)
                ((SPADCALL |sylmat| (QREFELT $ 28))
                 (|error|
                  "one of the polynomials that form this SylvesterMatrix has degree 0"))
                (#2='T
                 (SEQ (LETT |minR| (SPADCALL |sylmat| (QREFELT $ 19)))
                      (LETT |minC| (SPADCALL |sylmat| (QREFELT $ 20)))
                      (LETT |maxR| (SPADCALL |sylmat| (QREFELT $ 29)))
                      (LETT |maxC| (SPADCALL |sylmat| (QREFELT $ 30)))
                      (LETT |len| (SPADCALL |sylmat| (QREFELT $ 31)))
                      (LETT |firstcol|
                            (SPADCALL |sylmat| |minC| (QREFELT $ 32)))
                      (LETT |colIndex| (SPADCALL |firstcol| (QREFELT $ 33)))
                      (LETT |m|
                            (-
                             (+
                              (SPADCALL
                               (CONS #'|BEZOUT;subSylvesterMatrix;MNniM;2!0| $)
                               (SPADCALL |firstcol| |colIndex| (QREFELT $ 35))
                               (QREFELT $ 37))
                              1)
                             |colIndex|))
                      (LETT |n| (- |len| |m|))
                      (EXIT
                       (COND
                        ((>= |j| (MIN |n| |m|))
                         (|error| "index is too big for this SylvesterMatrix"))
                        (#2#
                         (SEQ
                          (LETT |rowRange|
                                (CONS
                                 (SPADCALL (- |minR| 1)
                                           (SPADCALL 1 (- |m| |j|)
                                                     (QREFELT $ 39))
                                           (QREFELT $ 40))
                                 (LIST
                                  (SPADCALL (+ |minR| |m|) (- |maxR| |j|)
                                            (QREFELT $ 39)))))
                          (LETT |colRange|
                                (SPADCALL |minC| |maxC| (QREFELT $ 39)))
                          (EXIT
                           (SPADCALL |sylmat| |rowRange| |colRange|
                                     (QREFELT $ 42))))))))))))) 

(SDEFUN |BEZOUT;subSylvesterMatrix;MNniM;2!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 11) (QREFELT $ 34))) 

(SDEFUN |BEZOUT;subSylvesterMatrix;M2NniM;3|
        ((|sylmat| M) (|j| |NonNegativeInteger|) (|i| |NonNegativeInteger|)
         ($ M))
        (SPROG
         ((|colRange| (|List| (|Segment| (|Integer|))))
          (|rowRange| (|Segment| (|Integer|))) (|maxC| (|Integer|))
          (|maxR| (|Integer|)) (|minC| (|Integer|)) (|minR| (|Integer|)))
         (SEQ
          (COND
           ((SPADCALL |i| |j| (QREFELT $ 44))
            (|error| "subSylvesterMatrix: i can't be larger than j"))
           ('T
            (SEQ (LETT |sylmat| (SPADCALL |sylmat| |j| (QREFELT $ 43)))
                 (LETT |minR| (SPADCALL |sylmat| (QREFELT $ 19)))
                 (LETT |minC| (SPADCALL |sylmat| (QREFELT $ 20)))
                 (LETT |maxR| (SPADCALL |sylmat| (QREFELT $ 29)))
                 (LETT |maxC| (SPADCALL |sylmat| (QREFELT $ 30)))
                 (LETT |rowRange| (SPADCALL |minR| |maxR| (QREFELT $ 39)))
                 (LETT |colRange|
                       (CONS
                        (SPADCALL |minC|
                                  (- (- |maxC| (SPADCALL 2 |j| (QREFELT $ 46)))
                                     1)
                                  (QREFELT $ 39))
                        (LIST
                         (SPADCALL (- (- |maxC| |i|) |j|) (QREFELT $ 47)))))
                 (EXIT
                  (SPADCALL |sylmat| |rowRange| |colRange|
                            (QREFELT $ 48))))))))) 

(SDEFUN |BEZOUT;bezoutMatrix;2UPM;4| ((|p| UP) (|q| UP) ($ M))
        (SPROG
         ((#1=#:G223 NIL) (|k| NIL) (#2=#:G222 NIL) (|i| NIL) (|p0| (UP))
          (|c| (R)) (#3=#:G221 NIL) (|coef| (R))
          (|deg| #4=(|NonNegativeInteger|)) (|q0| (UP)) (#5=#:G220 NIL)
          (|bound| #6=(|Integer|)) (#7=#:G219 NIL) (|bezmat| (M))
          (#8=#:G218 NIL) (#9=#:G217 NIL) (|maxC| (|Integer|))
          (|maxR| (|Integer|)) (|minC| (|Integer|)) (|minR| (|Integer|))
          (|sylmat| (M)) (|m| #6#) (|m2| #6#) (|m1| #6#)
          (|n| (|NonNegativeInteger|)) (|n2| #4#) (|n1| #4#))
         (SEQ (LETT |n1| (SPADCALL |p| (QREFELT $ 16)))
              (LETT |n2| (SPADCALL |q| (QREFELT $ 16)))
              (LETT |n| (+ |n1| |n2|))
              (EXIT
               (COND ((< |n1| |n2|) (SPADCALL |q| |p| (QREFELT $ 50)))
                     ('T
                      (SEQ (LETT |m1| (- |n1| 1)) (LETT |m2| (- |n2| 1))
                           (LETT |m| (- |n| 1))
                           (LETT |sylmat|
                                 (SPADCALL |n| |n1| (|spadConstant| $ 11)
                                           (QREFELT $ 17)))
                           (LETT |minR| (SPADCALL |sylmat| (QREFELT $ 19)))
                           (LETT |minC| (SPADCALL |sylmat| (QREFELT $ 20)))
                           (LETT |maxR| (SPADCALL |sylmat| (QREFELT $ 29)))
                           (LETT |maxC| (SPADCALL |sylmat| (QREFELT $ 30)))
                           (LETT |p0| |p|)
                           (SEQ G190
                                (COND
                                 ((NULL (NULL (SPADCALL |p0| (QREFELT $ 51))))
                                  (GO G191)))
                                (SEQ
                                 (LETT |coef| (SPADCALL |p0| (QREFELT $ 22)))
                                 (LETT |deg| (SPADCALL |p0| (QREFELT $ 16)))
                                 (LETT |p0| (SPADCALL |p0| (QREFELT $ 23)))
                                 (EXIT
                                  (SEQ (LETT |i| 0)
                                       (LETT #9# (MIN |m2| (- |deg| 1))) G190
                                       (COND
                                        ((|greater_SI| |i| #9#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |sylmat| (+ |minR| |i|)
                                                   (+ (- (+ |minC| |n1|) |deg|)
                                                      |i|)
                                                   |coef| (QREFELT $ 26))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT NIL))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (LETT |q0| |q|)
                           (SEQ G190
                                (COND
                                 ((NULL (NULL (SPADCALL |q0| (QREFELT $ 21))))
                                  (GO G191)))
                                (SEQ
                                 (LETT |coef| (SPADCALL |q0| (QREFELT $ 22)))
                                 (LETT |deg| (SPADCALL |q0| (QREFELT $ 16)))
                                 (LETT |q0| (SPADCALL |q0| (QREFELT $ 23)))
                                 (EXIT
                                  (SEQ (LETT |i| 0)
                                       (LETT #8# (- (- (+ |deg| |n1|) |n2|) 1))
                                       G190
                                       (COND
                                        ((|greater_SI| |i| #8#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |sylmat|
                                                   (+ (+ |minR| |n2|) |i|)
                                                   (+ (- (+ |minC| |n2|) |deg|)
                                                      |i|)
                                                   |coef| (QREFELT $ 26))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT NIL))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (LETT |bezmat|
                                 (SPADCALL |n1| |n1| (|spadConstant| $ 11)
                                           (QREFELT $ 17)))
                           (SEQ (LETT |i| 0) (LETT #7# |m2|) G190
                                (COND ((|greater_SI| |i| #7#) (GO G191)))
                                (SEQ (LETT |bound| (- |n2| |i|))
                                     (LETT |q0| |q|)
                                     (SEQ G190
                                          (COND
                                           ((NULL
                                             (NULL
                                              (SPADCALL |q0| (QREFELT $ 21))))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |deg|
                                                 (SPADCALL |q0|
                                                           (QREFELT $ 16)))
                                           (COND
                                            ((< |deg| |bound|)
                                             (SEQ
                                              (LETT |coef|
                                                    (SPADCALL |q0|
                                                              (QREFELT $ 22)))
                                              (EXIT
                                               (SEQ (LETT |k| |minC|)
                                                    (LETT #5# |maxC|) G190
                                                    (COND
                                                     ((> |k| #5#) (GO G191)))
                                                    (SEQ
                                                     (LETT |c|
                                                           (SPADCALL
                                                            (SPADCALL |coef|
                                                                      (SPADCALL
                                                                       |sylmat|
                                                                       (-
                                                                        (-
                                                                         (+
                                                                          |minR|
                                                                          |m2|)
                                                                         |i|)
                                                                        |deg|)
                                                                       |k|
                                                                       (QREFELT
                                                                        $ 52))
                                                                      (QREFELT
                                                                       $ 53))
                                                            (SPADCALL |bezmat|
                                                                      (-
                                                                       (+
                                                                        |minR|
                                                                        |m2|)
                                                                       |i|)
                                                                      |k|
                                                                      (QREFELT
                                                                       $ 52))
                                                            (QREFELT $ 54)))
                                                     (EXIT
                                                      (SPADCALL |bezmat|
                                                                (-
                                                                 (+ |minR|
                                                                    |m2|)
                                                                 |i|)
                                                                |k| |c|
                                                                (QREFELT $
                                                                         26))))
                                                    (LETT |k| (+ |k| 1))
                                                    (GO G190) G191
                                                    (EXIT NIL))))))
                                           (EXIT
                                            (LETT |q0|
                                                  (SPADCALL |q0|
                                                            (QREFELT $ 23)))))
                                          NIL (GO G190) G191 (EXIT NIL))
                                     (LETT |p0| |p|)
                                     (EXIT
                                      (SEQ G190
                                           (COND
                                            ((NULL
                                              (NULL
                                               (SPADCALL |p0| (QREFELT $ 21))))
                                             (GO G191)))
                                           (SEQ
                                            (LETT |deg|
                                                  (SPADCALL |p0|
                                                            (QREFELT $ 16)))
                                            (COND
                                             ((< |deg| |bound|)
                                              (SEQ
                                               (LETT |coef|
                                                     (SPADCALL |p0|
                                                               (QREFELT $ 22)))
                                               (EXIT
                                                (SEQ (LETT |k| |minC|)
                                                     (LETT #3# |maxC|) G190
                                                     (COND
                                                      ((> |k| #3#) (GO G191)))
                                                     (SEQ
                                                      (LETT |c|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL |coef|
                                                                        (SPADCALL
                                                                         |sylmat|
                                                                         (-
                                                                          (-
                                                                           (+
                                                                            |minR|
                                                                            |m|)
                                                                           |i|)
                                                                          |deg|)
                                                                         |k|
                                                                         (QREFELT
                                                                          $
                                                                          52))
                                                                        (QREFELT
                                                                         $ 53))
                                                              (QREFELT $ 55))
                                                             (SPADCALL |bezmat|
                                                                       (-
                                                                        (+
                                                                         |minR|
                                                                         |m2|)
                                                                        |i|)
                                                                       |k|
                                                                       (QREFELT
                                                                        $ 52))
                                                             (QREFELT $ 54)))
                                                      (EXIT
                                                       (SPADCALL |bezmat|
                                                                 (-
                                                                  (+ |minR|
                                                                     |m2|)
                                                                  |i|)
                                                                 |k| |c|
                                                                 (QREFELT $
                                                                          26))))
                                                     (LETT |k| (+ |k| 1))
                                                     (GO G190) G191
                                                     (EXIT NIL))))))
                                            (EXIT
                                             (LETT |p0|
                                                   (SPADCALL |p0|
                                                             (QREFELT $ 23)))))
                                           NIL (GO G190) G191 (EXIT NIL))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT NIL))
                           (SEQ (LETT |i| |n2|) (LETT #2# |m1|) G190
                                (COND ((> |i| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |k| |minC|) (LETT #1# |maxC|) G190
                                       (COND ((> |k| #1#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |bezmat| (+ |minR| |i|) |k|
                                                   (SPADCALL |sylmat|
                                                             (+ |minR| |i|) |k|
                                                             (QREFELT $ 52))
                                                   (QREFELT $ 26))))
                                       (LETT |k| (+ |k| 1)) (GO G190) G191
                                       (EXIT NIL))))
                                (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                           (EXIT |bezmat|)))))))) 

(SDEFUN |BEZOUT;subresultant| ((|m| M) (|j| |NonNegativeInteger|) ($ UP))
        (SPROG
         ((#1=#:G225 NIL) (#2=#:G224 (UP)) (#3=#:G226 (UP)) (#4=#:G229 NIL)
          (|k| NIL) (|x| (UP)))
         (SEQ
          (COND
           ((EQL |j| 0)
            (SPADCALL (SPADCALL |m| (QREFELT $ 56)) (QREFELT $ 57)))
           (#5='T
            (SEQ (LETT |x| (SPADCALL (|spadConstant| $ 24) 1 (QREFELT $ 58)))
                 (EXIT
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |k| 0) (LETT #4# |j|) G190
                        (COND ((|greater_SI| |k| #4#) (GO G191)))
                        (SEQ
                         (EXIT
                          (PROGN
                           (LETT #3#
                                 (SPADCALL (SPADCALL |x| |k| (QREFELT $ 59))
                                           (SPADCALL
                                            (SPADCALL |m| |j| |k|
                                                      (QREFELT $ 49))
                                            (QREFELT $ 56))
                                           (QREFELT $ 60)))
                           (COND
                            (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 61))))
                            ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                        (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                   (COND (#1# #2#) (#5# (|spadConstant| $ 12))))))))))) 

(SDEFUN |BEZOUT;subresultants;2UPIv;6|
        ((|p| UP) (|q| UP) ($ |IndexedVector| UP (|Zero|)))
        (SPROG
         ((#1=#:G236 NIL) (|i| NIL) (#2=#:G235 NIL)
          (|j| (|NonNegativeInteger|)) (#3=#:G230 NIL) (|m| (M))
          (|mindeg| (|NonNegativeInteger|)))
         (SEQ
          (LETT |mindeg|
                (MIN (SPADCALL |p| (QREFELT $ 16))
                     (SPADCALL |q| (QREFELT $ 16))))
          (LETT |m| (SPADCALL |p| |q| (QREFELT $ 27)))
          (EXIT
           (COND
            ((EQL |mindeg| 0)
             (SPADCALL (LIST (|BEZOUT;subresultant| |m| 0 $)) (QREFELT $ 64)))
            ('T
             (SEQ
              (LETT |j|
                    (PROG1 (LETT #3# (- |mindeg| 1))
                      (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #3#)))
              (EXIT
               (SPADCALL
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 0) (LETT #1# |j|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (|BEZOUT;subresultant| |m| |i| $) #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 64)))))))))) 

(SDEFUN |BEZOUT;bezoutResultant;2UPR;7| ((|f| UP) (|g| UP) ($ R))
        (SPADCALL (SPADCALL |f| |g| (QREFELT $ 50)) (QREFELT $ 56))) 

(SDEFUN |BEZOUT;bezoutDiscriminant;UPR;8| ((|f| UP) ($ R))
        (SPROG ((#1=#:G239 NIL) (|degMod4| (|Integer|)))
               (SEQ (LETT |degMod4| (REM (SPADCALL |f| (QREFELT $ 16)) 4))
                    (COND
                     ((OR (EQL |degMod4| 0) (EQL |degMod4| 1))
                      (EXIT
                       (PROG2
                           (LETT #1#
                                 (SPADCALL
                                  (SPADCALL |f| (SPADCALL |f| (QREFELT $ 67))
                                            (QREFELT $ 66))
                                  (SPADCALL |f| (QREFELT $ 22))
                                  (QREFELT $ 69)))
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                         (|Union| (QREFELT $ 6) #2="failed")
                                         #1#)))))
                    (EXIT
                     (SPADCALL
                      (PROG2
                          (LETT #1#
                                (SPADCALL
                                 (SPADCALL |f| (SPADCALL |f| (QREFELT $ 67))
                                           (QREFELT $ 66))
                                 (SPADCALL |f| (QREFELT $ 22)) (QREFELT $ 69)))
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                        (|Union| (QREFELT $ 6) #2#) #1#))
                      (QREFELT $ 55)))))) 

(SDEFUN |BEZOUT;bezoutDiscriminant;UPR;9| ((|f| UP) ($ R))
        (SPROG ((|degMod4| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |f| (QREFELT $ 22)) (|spadConstant| $ 24)
                            (QREFELT $ 71))
                  (SEQ (LETT |degMod4| (REM (SPADCALL |f| (QREFELT $ 16)) 4))
                       (COND
                        ((OR (EQL |degMod4| 0) (EQL |degMod4| 1))
                         (EXIT
                          (SPADCALL |f| (SPADCALL |f| (QREFELT $ 67))
                                    (QREFELT $ 66)))))
                       (EXIT
                        (SPADCALL
                         (SPADCALL |f| (SPADCALL |f| (QREFELT $ 67))
                                   (QREFELT $ 66))
                         (QREFELT $ 55)))))
                 ('T
                  (|error|
                   "bezoutDiscriminant: leading coefficient must be 1")))))) 

(DECLAIM (NOTINLINE |BezoutMatrix;|)) 

(DEFUN |BezoutMatrix| (&REST #1=#:G246)
  (SPROG NIL
         (PROG (#2=#:G247)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|BezoutMatrix|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |BezoutMatrix;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|BezoutMatrix|)))))))))) 

(DEFUN |BezoutMatrix;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$| (LIST '|BezoutMatrix| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT $ (GETREFV 72))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))))))
    (|haddProp| |$ConstructorCache| '|BezoutMatrix|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 65
                 (CONS (|dispatchFunction| |BEZOUT;subresultants;2UPIv;6|) $))
       (QSETREFV $ 66
                 (CONS (|dispatchFunction| |BEZOUT;bezoutResultant;2UPR;7|) $))
       (COND
        ((|HasCategory| |#1| '(|IntegralDomain|))
         (QSETREFV $ 70
                   (CONS (|dispatchFunction| |BEZOUT;bezoutDiscriminant;UPR;8|)
                         $)))
        ('T
         (QSETREFV $ 70
                   (CONS (|dispatchFunction| |BEZOUT;bezoutDiscriminant;UPR;9|)
                         $)))))))
    $))) 

(MAKEPROP '|BezoutMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (0 . |Zero|)
              (4 . |Zero|) (|Boolean|) (8 . =) (|NonNegativeInteger|)
              (14 . |degree|) (19 . |new|) (|Integer|) (26 . |minRowIndex|)
              (31 . |minColIndex|) (36 . |zero?|) (41 . |leadingCoefficient|)
              (46 . |reductum|) (51 . |One|) (55 . |One|) (59 . |qsetelt!|)
              |BEZOUT;sylvesterMatrix;2UPM;1| (67 . |diagonal?|)
              (72 . |maxRowIndex|) (77 . |maxColIndex|) (82 . |ncols|)
              (87 . |column|) (93 . |minIndex|) (98 . ~=) (104 . |delete|)
              (|Mapping| 13 6) (110 . |position|) (|Segment| 18)
              (116 . SEGMENT) (122 . +) (|List| 38) (128 . |elt|)
              |BEZOUT;subSylvesterMatrix;MNniM;2| (135 . >) (|PositiveInteger|)
              (141 . *) (147 . |convert|) (152 . |elt|)
              |BEZOUT;subSylvesterMatrix;M2NniM;3| |BEZOUT;bezoutMatrix;2UPM;4|
              (159 . |ground?|) (164 . |qelt|) (171 . *) (177 . +) (183 . -)
              (188 . |determinant|) (193 . |coerce|) (198 . |monomial|)
              (204 . ^) (210 . *) (216 . +) (|List| 7)
              (|IndexedVector| 7 (NRTEVAL 0)) (222 . |construct|)
              (227 . |subresultants|) (233 . |bezoutResultant|)
              (239 . |differentiate|) (|Union| $ '"failed") (244 . |exquo|)
              (250 . |bezoutDiscriminant|) (255 . =))
           '#(|sylvesterMatrix| 261 |subresultants| 267 |subSylvesterMatrix|
              273 |bezoutResultant| 286 |bezoutMatrix| 292 |bezoutDiscriminant|
              298)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 71
                                                 '(0 6 0 11 0 7 0 12 2 7 13 0 0
                                                   14 1 7 15 0 16 3 8 0 15 15 6
                                                   17 1 8 18 0 19 1 8 18 0 20 1
                                                   7 13 0 21 1 7 6 0 22 1 7 0 0
                                                   23 0 6 0 24 0 7 0 25 4 8 6 0
                                                   18 18 6 26 1 8 13 0 28 1 8
                                                   18 0 29 1 8 18 0 30 1 8 15 0
                                                   31 2 8 10 0 18 32 1 10 18 0
                                                   33 2 6 13 0 0 34 2 10 0 0 18
                                                   35 2 10 18 36 0 37 2 38 0 18
                                                   18 39 2 38 0 18 0 40 3 8 0 0
                                                   41 38 42 2 15 13 0 0 44 2 15
                                                   0 45 0 46 1 38 0 18 47 3 8 0
                                                   0 38 41 48 1 7 13 0 51 3 8 6
                                                   0 18 18 52 2 6 0 0 0 53 2 6
                                                   0 0 0 54 1 6 0 0 55 1 8 6 0
                                                   56 1 7 0 6 57 2 7 0 6 15 58
                                                   2 7 0 0 15 59 2 7 0 0 6 60 2
                                                   7 0 0 0 61 1 63 0 62 64 2 0
                                                   63 7 7 65 2 0 6 7 7 66 1 7 0
                                                   0 67 2 6 68 0 0 69 1 0 6 7
                                                   70 2 6 13 0 0 71 2 0 8 7 7
                                                   27 2 1 63 7 7 65 3 0 8 8 15
                                                   15 49 2 0 8 8 15 43 2 1 6 7
                                                   7 66 2 0 8 7 7 50 1 1 6 7
                                                   70)))))
           '|lookupComplete|)) 
