
(SDEFUN |BEZOUT;sylvesterMatrix;2UPM;1| ((|p| UP) (|q| UP) ($ M))
        (SPROG
         ((#1=#:G124 NIL) (|i| NIL) (|q0| (UP))
          (|deg| #2=(|NonNegativeInteger|)) (|coef| (R)) (#3=#:G123 NIL)
          (|p0| (UP)) (|minC| (|Integer|)) (|minR| (|Integer|)) (|sylmat| (M))
          (|n| (|NonNegativeInteger|)) (|n2| #2#) (|n1| #2#))
         (SEQ
          (LETT |n1| (SPADCALL |p| (QREFELT $ 12))
                . #4=(|BEZOUT;sylvesterMatrix;2UPM;1|))
          (LETT |n2| (SPADCALL |q| (QREFELT $ 12)) . #4#)
          (LETT |n| (+ |n1| |n2|) . #4#)
          (LETT |sylmat|
                (SPADCALL |n| |n| (|spadConstant| $ 13) (QREFELT $ 15)) . #4#)
          (LETT |minR| (SPADCALL |sylmat| (QREFELT $ 17)) . #4#)
          (LETT |minC| (SPADCALL |sylmat| (QREFELT $ 18)) . #4#)
          (LETT |p0| |p| . #4#)
          (SEQ G190
               (COND ((NULL (NULL (SPADCALL |p0| (QREFELT $ 20)))) (GO G191)))
               (SEQ (LETT |coef| (SPADCALL |p0| (QREFELT $ 21)) . #4#)
                    (LETT |deg| (SPADCALL |p0| (QREFELT $ 12)) . #4#)
                    (LETT |p0| (SPADCALL |p0| (QREFELT $ 22)) . #4#)
                    (EXIT
                     (SEQ (LETT |i| 0 . #4#) (LETT #3# (- |n2| 1) . #4#) G190
                          (COND ((|greater_SI| |i| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |sylmat| (+ |minR| |i|)
                                      (+ (- (+ |minC| |n1|) |deg|) |i|) |coef|
                                      (QREFELT $ 25))))
                          (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                          (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |q0| |q| . #4#)
          (SEQ G190
               (COND ((NULL (NULL (SPADCALL |q0| (QREFELT $ 20)))) (GO G191)))
               (SEQ (LETT |coef| (SPADCALL |q0| (QREFELT $ 21)) . #4#)
                    (LETT |deg| (SPADCALL |q0| (QREFELT $ 12)) . #4#)
                    (LETT |q0| (SPADCALL |q0| (QREFELT $ 22)) . #4#)
                    (EXIT
                     (SEQ (LETT |i| 0 . #4#) (LETT #1# (- |n1| 1) . #4#) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |sylmat| (+ (+ |minR| |n2|) |i|)
                                      (+ (- (+ |minC| |n2|) |deg|) |i|) |coef|
                                      (QREFELT $ 25))))
                          (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
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
                ((SPADCALL |sylmat| (QREFELT $ 27))
                 (|error|
                  "one of the polynomials that form this SylvesterMatrix has degree 0"))
                (#2='T
                 (SEQ
                  (LETT |minR| (SPADCALL |sylmat| (QREFELT $ 17))
                        . #3=(|BEZOUT;subSylvesterMatrix;MNniM;2|))
                  (LETT |minC| (SPADCALL |sylmat| (QREFELT $ 18)) . #3#)
                  (LETT |maxR| (SPADCALL |sylmat| (QREFELT $ 28)) . #3#)
                  (LETT |maxC| (SPADCALL |sylmat| (QREFELT $ 29)) . #3#)
                  (LETT |len| (SPADCALL |sylmat| (QREFELT $ 30)) . #3#)
                  (LETT |firstcol| (SPADCALL |sylmat| |minC| (QREFELT $ 31))
                        . #3#)
                  (LETT |colIndex| (SPADCALL |firstcol| (QREFELT $ 32)) . #3#)
                  (LETT |m|
                        (-
                         (+
                          (SPADCALL
                           (CONS #'|BEZOUT;subSylvesterMatrix;MNniM;2!0| $)
                           (SPADCALL |firstcol| |colIndex| (QREFELT $ 34))
                           (QREFELT $ 36))
                          1)
                         |colIndex|)
                        . #3#)
                  (LETT |n| (- |len| |m|) . #3#)
                  (EXIT
                   (COND
                    ((>= |j| (MIN |n| |m|))
                     (|error| "index is too big for this SylvesterMatrix"))
                    (#2#
                     (SEQ
                      (LETT |rowRange|
                            (CONS
                             (SPADCALL (- |minR| 1)
                                       (SPADCALL 1 (- |m| |j|) (QREFELT $ 38))
                                       (QREFELT $ 39))
                             (LIST
                              (SPADCALL (+ |minR| |m|) (- |maxR| |j|)
                                        (QREFELT $ 38))))
                            . #3#)
                      (LETT |colRange| (SPADCALL |minC| |maxC| (QREFELT $ 38))
                            . #3#)
                      (EXIT
                       (SPADCALL |sylmat| |rowRange| |colRange|
                                 (QREFELT $ 41))))))))))))) 

(SDEFUN |BEZOUT;subSylvesterMatrix;MNniM;2!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 13) (QREFELT $ 33))) 

(SDEFUN |BEZOUT;subSylvesterMatrix;M2NniM;3|
        ((|sylmat| M) (|j| |NonNegativeInteger|) (|i| |NonNegativeInteger|)
         ($ M))
        (SPROG
         ((|colRange| (|List| (|Segment| (|Integer|))))
          (|rowRange| (|Segment| (|Integer|))) (|maxC| (|Integer|))
          (|maxR| (|Integer|)) (|minC| (|Integer|)) (|minR| (|Integer|)))
         (SEQ
          (COND
           ((SPADCALL |i| |j| (QREFELT $ 43))
            (|error| "subSylvesterMatrix: i can't be larger than j"))
           ('T
            (SEQ
             (LETT |sylmat| (SPADCALL |sylmat| |j| (QREFELT $ 42))
                   . #1=(|BEZOUT;subSylvesterMatrix;M2NniM;3|))
             (LETT |minR| (SPADCALL |sylmat| (QREFELT $ 17)) . #1#)
             (LETT |minC| (SPADCALL |sylmat| (QREFELT $ 18)) . #1#)
             (LETT |maxR| (SPADCALL |sylmat| (QREFELT $ 28)) . #1#)
             (LETT |maxC| (SPADCALL |sylmat| (QREFELT $ 29)) . #1#)
             (LETT |rowRange| (SPADCALL |minR| |maxR| (QREFELT $ 38)) . #1#)
             (LETT |colRange|
                   (CONS
                    (SPADCALL |minC|
                              (- (- |maxC| (SPADCALL 2 |j| (QREFELT $ 45))) 1)
                              (QREFELT $ 38))
                    (LIST (SPADCALL (- (- |maxC| |i|) |j|) (QREFELT $ 46))))
                   . #1#)
             (EXIT
              (SPADCALL |sylmat| |rowRange| |colRange| (QREFELT $ 47))))))))) 

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
         (SEQ
          (LETT |n1| (SPADCALL |p| (QREFELT $ 12))
                . #10=(|BEZOUT;bezoutMatrix;2UPM;4|))
          (LETT |n2| (SPADCALL |q| (QREFELT $ 12)) . #10#)
          (LETT |n| (+ |n1| |n2|) . #10#)
          (EXIT
           (COND ((< |n1| |n2|) (SPADCALL |q| |p| (QREFELT $ 49)))
                 ('T
                  (SEQ (LETT |m1| (- |n1| 1) . #10#)
                       (LETT |m2| (- |n2| 1) . #10#)
                       (LETT |m| (- |n| 1) . #10#)
                       (LETT |sylmat|
                             (SPADCALL |n| |n1| (|spadConstant| $ 13)
                                       (QREFELT $ 15))
                             . #10#)
                       (LETT |minR| (SPADCALL |sylmat| (QREFELT $ 17)) . #10#)
                       (LETT |minC| (SPADCALL |sylmat| (QREFELT $ 18)) . #10#)
                       (LETT |maxR| (SPADCALL |sylmat| (QREFELT $ 28)) . #10#)
                       (LETT |maxC| (SPADCALL |sylmat| (QREFELT $ 29)) . #10#)
                       (LETT |p0| |p| . #10#)
                       (SEQ G190
                            (COND
                             ((NULL (NULL (SPADCALL |p0| (QREFELT $ 50))))
                              (GO G191)))
                            (SEQ
                             (LETT |coef| (SPADCALL |p0| (QREFELT $ 21))
                                   . #10#)
                             (LETT |deg| (SPADCALL |p0| (QREFELT $ 12)) . #10#)
                             (LETT |p0| (SPADCALL |p0| (QREFELT $ 22)) . #10#)
                             (EXIT
                              (SEQ (LETT |i| 0 . #10#)
                                   (LETT #9# (MIN |m2| (- |deg| 1)) . #10#)
                                   G190
                                   (COND ((|greater_SI| |i| #9#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |sylmat| (+ |minR| |i|)
                                               (+ (- (+ |minC| |n1|) |deg|)
                                                  |i|)
                                               |coef| (QREFELT $ 25))))
                                   (LETT |i| (|inc_SI| |i|) . #10#) (GO G190)
                                   G191 (EXIT NIL))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (LETT |q0| |q| . #10#)
                       (SEQ G190
                            (COND
                             ((NULL (NULL (SPADCALL |q0| (QREFELT $ 20))))
                              (GO G191)))
                            (SEQ
                             (LETT |coef| (SPADCALL |q0| (QREFELT $ 21))
                                   . #10#)
                             (LETT |deg| (SPADCALL |q0| (QREFELT $ 12)) . #10#)
                             (LETT |q0| (SPADCALL |q0| (QREFELT $ 22)) . #10#)
                             (EXIT
                              (SEQ (LETT |i| 0 . #10#)
                                   (LETT #8# (- (- (+ |deg| |n1|) |n2|) 1)
                                         . #10#)
                                   G190
                                   (COND ((|greater_SI| |i| #8#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |sylmat| (+ (+ |minR| |n2|) |i|)
                                               (+ (- (+ |minC| |n2|) |deg|)
                                                  |i|)
                                               |coef| (QREFELT $ 25))))
                                   (LETT |i| (|inc_SI| |i|) . #10#) (GO G190)
                                   G191 (EXIT NIL))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (LETT |bezmat|
                             (SPADCALL |n1| |n1| (|spadConstant| $ 13)
                                       (QREFELT $ 15))
                             . #10#)
                       (SEQ (LETT |i| 0 . #10#) (LETT #7# |m2| . #10#) G190
                            (COND ((|greater_SI| |i| #7#) (GO G191)))
                            (SEQ (LETT |bound| (- |n2| |i|) . #10#)
                                 (LETT |q0| |q| . #10#)
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (NULL (SPADCALL |q0| (QREFELT $ 20))))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |deg|
                                             (SPADCALL |q0| (QREFELT $ 12))
                                             . #10#)
                                       (COND
                                        ((< |deg| |bound|)
                                         (SEQ
                                          (LETT |coef|
                                                (SPADCALL |q0| (QREFELT $ 21))
                                                . #10#)
                                          (EXIT
                                           (SEQ (LETT |k| |minC| . #10#)
                                                (LETT #5# |maxC| . #10#) G190
                                                (COND ((> |k| #5#) (GO G191)))
                                                (SEQ
                                                 (LETT |c|
                                                       (SPADCALL
                                                        (SPADCALL |coef|
                                                                  (SPADCALL
                                                                   |sylmat|
                                                                   (-
                                                                    (-
                                                                     (+ |minR|
                                                                        |m2|)
                                                                     |i|)
                                                                    |deg|)
                                                                   |k|
                                                                   (QREFELT $
                                                                            51))
                                                                  (QREFELT $
                                                                           52))
                                                        (SPADCALL |bezmat|
                                                                  (-
                                                                   (+ |minR|
                                                                      |m2|)
                                                                   |i|)
                                                                  |k|
                                                                  (QREFELT $
                                                                           51))
                                                        (QREFELT $ 53))
                                                       . #10#)
                                                 (EXIT
                                                  (SPADCALL |bezmat|
                                                            (- (+ |minR| |m2|)
                                                               |i|)
                                                            |k| |c|
                                                            (QREFELT $ 25))))
                                                (LETT |k| (+ |k| 1) . #10#)
                                                (GO G190) G191 (EXIT NIL))))))
                                       (EXIT
                                        (LETT |q0|
                                              (SPADCALL |q0| (QREFELT $ 22))
                                              . #10#)))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (LETT |p0| |p| . #10#)
                                 (EXIT
                                  (SEQ G190
                                       (COND
                                        ((NULL
                                          (NULL
                                           (SPADCALL |p0| (QREFELT $ 20))))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |deg|
                                              (SPADCALL |p0| (QREFELT $ 12))
                                              . #10#)
                                        (COND
                                         ((< |deg| |bound|)
                                          (SEQ
                                           (LETT |coef|
                                                 (SPADCALL |p0| (QREFELT $ 21))
                                                 . #10#)
                                           (EXIT
                                            (SEQ (LETT |k| |minC| . #10#)
                                                 (LETT #3# |maxC| . #10#) G190
                                                 (COND ((> |k| #3#) (GO G191)))
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
                                                                     (QREFELT $
                                                                              51))
                                                                    (QREFELT $
                                                                             52))
                                                          (QREFELT $ 54))
                                                         (SPADCALL |bezmat|
                                                                   (-
                                                                    (+ |minR|
                                                                       |m2|)
                                                                    |i|)
                                                                   |k|
                                                                   (QREFELT $
                                                                            51))
                                                         (QREFELT $ 53))
                                                        . #10#)
                                                  (EXIT
                                                   (SPADCALL |bezmat|
                                                             (- (+ |minR| |m2|)
                                                                |i|)
                                                             |k| |c|
                                                             (QREFELT $ 25))))
                                                 (LETT |k| (+ |k| 1) . #10#)
                                                 (GO G190) G191 (EXIT NIL))))))
                                        (EXIT
                                         (LETT |p0|
                                               (SPADCALL |p0| (QREFELT $ 22))
                                               . #10#)))
                                       NIL (GO G190) G191 (EXIT NIL))))
                            (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                            (EXIT NIL))
                       (SEQ (LETT |i| |n2| . #10#) (LETT #2# |m1| . #10#) G190
                            (COND ((> |i| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| |minC| . #10#)
                                   (LETT #1# |maxC| . #10#) G190
                                   (COND ((> |k| #1#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |bezmat| (+ |minR| |i|) |k|
                                               (SPADCALL |sylmat|
                                                         (+ |minR| |i|) |k|
                                                         (QREFELT $ 51))
                                               (QREFELT $ 25))))
                                   (LETT |k| (+ |k| 1) . #10#) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT |i| (+ |i| 1) . #10#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |bezmat|)))))))) 

(SDEFUN |BEZOUT;subResultant;2UPNniUP;5|
        ((|p| UP) (|q| UP) (|j| |NonNegativeInteger|) ($ UP))
        (SPROG
         ((#1=#:G225 NIL) (#2=#:G224 (UP)) (#3=#:G226 (UP)) (#4=#:G230 NIL)
          (|k| NIL) (|x| (UP)) (|sylmat| (M)))
         (SEQ
          (LETT |sylmat| (SPADCALL |p| |q| (QREFELT $ 26))
                . #5=(|BEZOUT;subResultant;2UPNniUP;5|))
          (EXIT
           (COND
            ((EQL |j| 0)
             (SPADCALL (SPADCALL |sylmat| (QREFELT $ 55)) (QREFELT $ 56)))
            (#6='T
             (SEQ
              (LETT |x| (SPADCALL (|spadConstant| $ 23) 1 (QREFELT $ 57))
                    . #5#)
              (EXIT
               (PROGN
                (LETT #1# NIL . #5#)
                (SEQ (LETT |k| 0 . #5#) (LETT #4# |j| . #5#) G190
                     (COND ((|greater_SI| |k| #4#) (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #3#
                              (SPADCALL (SPADCALL |x| |k| (QREFELT $ 58))
                                        (SPADCALL
                                         (SPADCALL |sylmat| |j| |k|
                                                   (QREFELT $ 48))
                                         (QREFELT $ 55))
                                        (QREFELT $ 59))
                              . #5#)
                        (COND
                         (#1#
                          (LETT #2# (SPADCALL #2# #3# (QREFELT $ 60)) . #5#))
                         ('T
                          (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                     (LETT |k| (|inc_SI| |k|) . #5#) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) (#6# (|spadConstant| $ 14)))))))))))) 

(SDEFUN |BEZOUT;subResultantList;2UPL;6| ((|p| UP) (|q| UP) ($ |List| UP))
        (SPROG
         ((|i| NIL) (#1=#:G236 NIL) (|j| (|PositiveInteger|)) (#2=#:G231 NIL)
          (|mindeg| (|NonNegativeInteger|)))
         (SEQ
          (LETT |mindeg|
                (MIN (SPADCALL |p| (QREFELT $ 12))
                     (SPADCALL |q| (QREFELT $ 12)))
                . #3=(|BEZOUT;subResultantList;2UPL;6|))
          (EXIT
           (COND
            ((SPADCALL |mindeg| 1 (QREFELT $ 62))
             (LIST (SPADCALL |p| |q| 0 (QREFELT $ 61))))
            ('T
             (SEQ
              (LETT |j|
                    (PROG1 (LETT #2# (- |mindeg| 1) . #3#)
                      (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                        '(|Integer|) #2#))
                    . #3#)
              (EXIT
               (PROGN
                (LETT #1# NIL . #3#)
                (SEQ (LETT |i| |j| . #3#) G190 (COND ((< |i| 0) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #1#
                             (CONS (SPADCALL |p| |q| |i| (QREFELT $ 61)) #1#)
                             . #3#)))
                     (LETT |i| (+ |i| -1) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #1#)))))))))))) 

(SDEFUN |BEZOUT;bezoutResultant;2UPR;7| ((|f| UP) (|g| UP) ($ R))
        (SPADCALL (SPADCALL |f| |g| (QREFELT $ 49)) (QREFELT $ 55))) 

(SDEFUN |BEZOUT;bezoutDiscriminant;UPR;8| ((|f| UP) ($ R))
        (SPROG ((#1=#:G239 NIL) (|degMod4| (|Integer|)))
               (SEQ
                (LETT |degMod4| (REM (SPADCALL |f| (QREFELT $ 12)) 4)
                      . #2=(|BEZOUT;bezoutDiscriminant;UPR;8|))
                (COND
                 ((OR (EQL |degMod4| 0) (EQL |degMod4| 1))
                  (EXIT
                   (PROG2
                       (LETT #1#
                             (SPADCALL
                              (SPADCALL |f| (SPADCALL |f| (QREFELT $ 66))
                                        (QREFELT $ 65))
                              (SPADCALL |f| (QREFELT $ 21)) (QREFELT $ 68))
                             . #2#)
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                     (|Union| (QREFELT $ 6) #3="failed")
                                     #1#)))))
                (EXIT
                 (SPADCALL
                  (PROG2
                      (LETT #1#
                            (SPADCALL
                             (SPADCALL |f| (SPADCALL |f| (QREFELT $ 66))
                                       (QREFELT $ 65))
                             (SPADCALL |f| (QREFELT $ 21)) (QREFELT $ 68))
                            . #2#)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                    (|Union| (QREFELT $ 6) #3#) #1#))
                  (QREFELT $ 54)))))) 

(SDEFUN |BEZOUT;bezoutDiscriminant;UPR;9| ((|f| UP) ($ R))
        (SPROG ((|degMod4| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |f| (QREFELT $ 21)) (|spadConstant| $ 23)
                            (QREFELT $ 70))
                  (SEQ
                   (LETT |degMod4| (REM (SPADCALL |f| (QREFELT $ 12)) 4)
                         |BEZOUT;bezoutDiscriminant;UPR;9|)
                   (COND
                    ((OR (EQL |degMod4| 0) (EQL |degMod4| 1))
                     (EXIT
                      (SPADCALL |f| (SPADCALL |f| (QREFELT $ 66))
                                (QREFELT $ 65)))))
                   (EXIT
                    (SPADCALL
                     (SPADCALL |f| (SPADCALL |f| (QREFELT $ 66))
                               (QREFELT $ 65))
                     (QREFELT $ 54)))))
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
                                               '|domainEqualList|)
                    . #3=(|BezoutMatrix|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |BezoutMatrix;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|BezoutMatrix|)))))))))) 

(DEFUN |BezoutMatrix;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|BezoutMatrix|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|BezoutMatrix| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 71) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))))
                    . #1#))
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
       (QSETREFV $ 61
                 (CONS (|dispatchFunction| |BEZOUT;subResultant;2UPNniUP;5|)
                       $))
       (QSETREFV $ 64
                 (CONS (|dispatchFunction| |BEZOUT;subResultantList;2UPL;6|)
                       $))
       (QSETREFV $ 65
                 (CONS (|dispatchFunction| |BEZOUT;bezoutResultant;2UPR;7|) $))
       (COND
        ((|HasCategory| |#1| '(|IntegralDomain|))
         (QSETREFV $ 69
                   (CONS (|dispatchFunction| |BEZOUT;bezoutDiscriminant;UPR;8|)
                         $)))
        ('T
         (QSETREFV $ 69
                   (CONS (|dispatchFunction| |BEZOUT;bezoutDiscriminant;UPR;9|)
                         $)))))))
    $))) 

(MAKEPROP '|BezoutMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|NonNegativeInteger|) (0 . |degree|) (5 . |Zero|) (9 . |Zero|)
              (13 . |new|) (|Integer|) (20 . |minRowIndex|)
              (25 . |minColIndex|) (|Boolean|) (30 . |zero?|)
              (35 . |leadingCoefficient|) (40 . |reductum|) (45 . |One|)
              (49 . |One|) (53 . |qsetelt!|) |BEZOUT;sylvesterMatrix;2UPM;1|
              (61 . |diagonal?|) (66 . |maxRowIndex|) (71 . |maxColIndex|)
              (76 . |ncols|) (81 . |column|) (87 . |minIndex|) (92 . ~=)
              (98 . |delete|) (|Mapping| 19 6) (104 . |position|)
              (|Segment| 16) (110 . SEGMENT) (116 . +) (|List| 37)
              (122 . |elt|) |BEZOUT;subSylvesterMatrix;MNniM;2| (129 . >)
              (|PositiveInteger|) (135 . *) (141 . |convert|) (146 . |elt|)
              |BEZOUT;subSylvesterMatrix;M2NniM;3| |BEZOUT;bezoutMatrix;2UPM;4|
              (153 . |ground?|) (158 . |qelt|) (165 . *) (171 . +) (177 . -)
              (182 . |determinant|) (187 . |coerce|) (192 . |monomial|)
              (198 . ^) (204 . *) (210 . +) (216 . |subResultant|) (223 . <=)
              (|List| 7) (229 . |subResultantList|) (235 . |bezoutResultant|)
              (241 . |differentiate|) (|Union| $ '"failed") (246 . |exquo|)
              (252 . |bezoutDiscriminant|) (257 . =))
           '#(|sylvesterMatrix| 263 |subSylvesterMatrix| 269 |subResultantList|
              282 |subResultant| 288 |bezoutResultant| 295 |bezoutMatrix| 301
              |bezoutDiscriminant| 307)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 70
                                                 '(1 7 11 0 12 0 6 0 13 0 7 0
                                                   14 3 8 0 11 11 6 15 1 8 16 0
                                                   17 1 8 16 0 18 1 7 19 0 20 1
                                                   7 6 0 21 1 7 0 0 22 0 6 0 23
                                                   0 7 0 24 4 8 6 0 16 16 6 25
                                                   1 8 19 0 27 1 8 16 0 28 1 8
                                                   16 0 29 1 8 11 0 30 2 8 10 0
                                                   16 31 1 10 16 0 32 2 6 19 0
                                                   0 33 2 10 0 0 16 34 2 10 16
                                                   35 0 36 2 37 0 16 16 38 2 37
                                                   0 16 0 39 3 8 0 0 40 37 41 2
                                                   11 19 0 0 43 2 11 0 44 0 45
                                                   1 37 0 16 46 3 8 0 0 37 40
                                                   47 1 7 19 0 50 3 8 6 0 16 16
                                                   51 2 6 0 0 0 52 2 6 0 0 0 53
                                                   1 6 0 0 54 1 8 6 0 55 1 7 0
                                                   6 56 2 7 0 6 11 57 2 7 0 0
                                                   11 58 2 7 0 0 6 59 2 7 0 0 0
                                                   60 3 0 7 7 7 11 61 2 11 19 0
                                                   0 62 2 0 63 7 7 64 2 0 6 7 7
                                                   65 1 7 0 0 66 2 6 67 0 0 68
                                                   1 0 6 7 69 2 6 19 0 0 70 2 0
                                                   8 7 7 26 2 0 8 8 11 42 3 0 8
                                                   8 11 11 48 2 1 63 7 7 64 3 1
                                                   7 7 7 11 61 2 1 6 7 7 65 2 0
                                                   8 7 7 49 1 1 6 7 69)))))
           '|lookupComplete|)) 
