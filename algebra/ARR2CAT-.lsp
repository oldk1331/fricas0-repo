
(SDEFUN |ARR2CAT-;any?;MSB;1|
        ((|f| |Mapping| (|Boolean|) R) (|m| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G180 NIL) (#2=#:G181 NIL) (#3=#:G183 NIL) (|j| NIL)
          (#4=#:G182 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |i| (SPADCALL |m| (QREFELT $ 11))
                   . #5=(|ARR2CAT-;any?;MSB;1|))
             (LETT #4# (SPADCALL |m| (QREFELT $ 12)) . #5#) G190
             (COND ((> |i| #4#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #5#)
                    (LETT #3# (SPADCALL |m| (QREFELT $ 14)) . #5#) G190
                    (COND ((> |j| #3#) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15)) |f|)
                        (PROGN
                         (LETT #1# (PROGN (LETT #2# 'T . #5#) (GO #6=#:G179))
                               . #5#)
                         (GO #7=#:G175))))))
                    (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL)))
              #7# (EXIT #1#))
             (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT 'NIL)))
          #6# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;every?;MSB;2|
        ((|f| |Mapping| (|Boolean|) R) (|m| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G189 NIL) (#2=#:G190 NIL) (#3=#:G192 NIL) (|j| NIL)
          (#4=#:G191 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |i| (SPADCALL |m| (QREFELT $ 11))
                   . #5=(|ARR2CAT-;every?;MSB;2|))
             (LETT #4# (SPADCALL |m| (QREFELT $ 12)) . #5#) G190
             (COND ((> |i| #4#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #5#)
                    (LETT #3# (SPADCALL |m| (QREFELT $ 14)) . #5#) G190
                    (COND ((> |j| #3#) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((NULL
                         (SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15)) |f|))
                        (PROGN
                         (LETT #1# (PROGN (LETT #2# 'NIL . #5#) (GO #6=#:G188))
                               . #5#)
                         (GO #7=#:G185))))))
                    (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL)))
              #7# (EXIT #1#))
             (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;size?;SNniB;3|
        ((|m| S) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (EQL (* (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |m| (QREFELT $ 22)))
             |n|)) 

(SDEFUN |ARR2CAT-;less?;SNniB;4|
        ((|m| S) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (< (* (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |m| (QREFELT $ 22))) |n|)) 

(SDEFUN |ARR2CAT-;more?;SNniB;5|
        ((|m| S) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (SPADCALL
         (* (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |m| (QREFELT $ 22))) |n|
         (QREFELT $ 25))) 

(SDEFUN |ARR2CAT-;#;SNni;6| ((|m| S) ($ |NonNegativeInteger|))
        (* (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |m| (QREFELT $ 22)))) 

(SDEFUN |ARR2CAT-;elt;S2I2R;7|
        ((|m| S) (|i| |Integer|) (|j| |Integer|) (|r| R) ($ R))
        (COND
         ((OR (< |i| (SPADCALL |m| (QREFELT $ 11)))
              (SPADCALL |i| (SPADCALL |m| (QREFELT $ 12)) (QREFELT $ 28)))
          |r|)
         ((OR (< |j| (SPADCALL |m| (QREFELT $ 13)))
              (SPADCALL |j| (SPADCALL |m| (QREFELT $ 14)) (QREFELT $ 28)))
          |r|)
         ('T (SPADCALL |m| |i| |j| (QREFELT $ 15))))) 

(SDEFUN |ARR2CAT-;count;MSNni;8|
        ((|f| |Mapping| (|Boolean|) R) (|m| S) ($ |NonNegativeInteger|))
        (SPROG
         ((|num| (|NonNegativeInteger|)) (#1=#:G209 NIL) (|j| NIL)
          (#2=#:G208 NIL) (|i| NIL))
         (SEQ (LETT |num| 0 . #3=(|ARR2CAT-;count;MSNni;8|))
              (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3#)
                   (LETT #2# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                          (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                          (COND ((> |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                        |f|)
                              (LETT |num| (+ |num| 1) . #3#)))))
                          (LETT |j| (+ |j| 1) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |num|)))) 

(SDEFUN |ARR2CAT-;parts;SL;9| ((|m| S) ($ |List| R))
        (SPROG
         ((|entryList| (|List| R)) (#1=#:G215 NIL) (|j| NIL) (#2=#:G214 NIL)
          (|i| NIL))
         (SEQ (LETT |entryList| NIL . #3=(|ARR2CAT-;parts;SL;9|))
              (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 12)) . #3#)
                   (LETT #2# (SPADCALL |m| (QREFELT $ 11)) . #3#) G190
                   (COND ((< |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 14)) . #3#)
                          (LETT #1# (SPADCALL |m| (QREFELT $ 13)) . #3#) G190
                          (COND ((< |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |entryList|
                                  (CONS (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                        |entryList|)
                                  . #3#)))
                          (LETT |j| (+ |j| -1) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (+ |i| -1) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |entryList|)))) 

(SDEFUN |ARR2CAT-;listOfLists;SL;10| ((|x| S) ($ |List| (|List| R)))
        (SPROG
         ((|ll| (|List| (|List| R))) (|l| (|List| R)) (#1=#:G222 NIL) (|j| NIL)
          (#2=#:G221 NIL) (|i| NIL))
         (SEQ (LETT |ll| NIL . #3=(|ARR2CAT-;listOfLists;SL;10|))
              (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 12)) . #3#)
                   (LETT #2# (SPADCALL |x| (QREFELT $ 11)) . #3#) G190
                   (COND ((< |i| #2#) (GO G191)))
                   (SEQ (LETT |l| NIL . #3#)
                        (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 14)) . #3#)
                             (LETT #1# (SPADCALL |x| (QREFELT $ 13)) . #3#)
                             G190 (COND ((< |j| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |l|
                                     (CONS
                                      (SPADCALL |x| |i| |j| (QREFELT $ 15))
                                      |l|)
                                     . #3#)))
                             (LETT |j| (+ |j| -1) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |ll| (CONS |l| |ll|) . #3#)))
                   (LETT |i| (+ |i| -1) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |ll|)))) 

(SDEFUN |ARR2CAT-;subMatrix;S4IS;11|
        ((|x| S) (|i1| |Integer|) (|i2| |Integer|) (|j1| |Integer|)
         (|j2| |Integer|) ($ S))
        (SPROG
         ((#1=#:G234 NIL) (|j| NIL) (|l| NIL) (#2=#:G233 NIL) (|i| NIL)
          (|k| NIL) (|y| (S)) (|cols| #3=(|NonNegativeInteger|)) (|rows| #3#))
         (SEQ
          (COND ((< (+ |i2| 1) |i1|) (|error| "subMatrix: bad row indices"))
                ((< (+ |j2| 1) |j1|) (|error| "subMatrix: bad column indices"))
                ('T
                 (SEQ
                  (LETT |rows| (+ (- |i2| |i1|) 1)
                        . #4=(|ARR2CAT-;subMatrix;S4IS;11|))
                  (LETT |cols| (+ (- |j2| |j1|) 1) . #4#)
                  (LETT |y| (SPADCALL |rows| |cols| (QREFELT $ 35)) . #4#)
                  (COND ((OR (EQL |rows| 0) (EQL |cols| 0)) (EXIT |y|)))
                  (COND
                   ((OR (< |i1| (SPADCALL |x| (QREFELT $ 11)))
                        (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 12))
                                  (QREFELT $ 28)))
                    (EXIT (|error| "subMatrix: index out of range"))))
                  (COND
                   ((OR (< |j1| (SPADCALL |x| (QREFELT $ 13)))
                        (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 14))
                                  (QREFELT $ 28)))
                    (EXIT (|error| "subMatrix: index out of range"))))
                  (SEQ (LETT |k| |i1| . #4#)
                       (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #4#)
                       (LETT #2# (SPADCALL |y| (QREFELT $ 12)) . #4#) G190
                       (COND ((OR (> |i| #2#) (> |k| |i2|)) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |l| |j1| . #4#)
                              (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #4#)
                              (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #4#)
                              G190
                              (COND ((OR (> |j| #1#) (> |l| |j2|)) (GO G191)))
                              (SEQ
                               (EXIT
                                (SPADCALL |y| |i| |j|
                                          (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                          (QREFELT $ 36))))
                              (LETT |j|
                                    (PROG1 (+ |j| 1)
                                      (LETT |l| (+ |l| 1) . #4#))
                                    . #4#)
                              (GO G190) G191 (EXIT NIL))))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #4#))
                             . #4#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |y|))))))) 

(SDEFUN |ARR2CAT-;elt;S2LS;12|
        ((|x| S) (|rowList| |List| (|Integer|)) (|colList| |List| (|Integer|))
         ($ S))
        (SPROG
         ((#1=#:G251 NIL) (|ej| NIL) (#2=#:G252 NIL) (|j| NIL) (#3=#:G249 NIL)
          (|ei| NIL) (#4=#:G250 NIL) (|i| NIL) (|y| (S)) (#5=#:G245 NIL)
          (#6=#:G248 NIL) (#7=#:G246 NIL) (#8=#:G247 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL . #9=(|ARR2CAT-;elt;S2LS;12|))
                 (LETT #8# |rowList| . #9#) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |ei| (CAR #8#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT $ 11)))
                         (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 12))
                                   (QREFELT $ 28)))
                     (PROGN
                      (LETT #7# (|error| "elt: index out of range") . #9#)
                      (GO #10=#:G237))))))
                 (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL)))
           #10# (EXIT #7#))
          (SEQ
           (EXIT
            (SEQ (LETT |ej| NIL . #9#) (LETT #6# |colList| . #9#) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |ej| (CAR #6#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ej| (SPADCALL |x| (QREFELT $ 13)))
                         (SPADCALL |ej| (SPADCALL |x| (QREFELT $ 14))
                                   (QREFELT $ 28)))
                     (PROGN
                      (LETT #5# (|error| "elt: index out of range") . #9#)
                      (GO #11=#:G240))))))
                 (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL)))
           #11# (EXIT #5#))
          (LETT |y|
                (SPADCALL (LENGTH |rowList|) (LENGTH |colList|) (QREFELT $ 35))
                . #9#)
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #9#)
               (LETT #4# (SPADCALL |y| (QREFELT $ 12)) . #9#)
               (LETT |ei| NIL . #9#) (LETT #3# |rowList| . #9#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |ei| (CAR #3#) . #9#) NIL)
                     (> |i| #4#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #9#)
                      (LETT #2# (SPADCALL |y| (QREFELT $ 14)) . #9#)
                      (LETT |ej| NIL . #9#) (LETT #1# |colList| . #9#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#) . #9#) NIL)
                            (> |j| #2#))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |y| |i| |j|
                                  (SPADCALL |x| |ei| |ej| (QREFELT $ 15))
                                  (QREFELT $ 36))))
                      (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1) . #9#))
                            . #9#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT #3# (PROG1 (CDR #3#) (LETT |i| (+ |i| 1) . #9#)) . #9#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;check_seg|
        ((|s| |Segment| (|Integer|)) (|lb| |Integer|) (|ub| |Integer|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((|cc| (|NonNegativeInteger|)) (|ii| (|Integer|)) (|i2| (|Integer|))
          (|i1| (|Integer|)))
         (SEQ
          (LETT |ii| (SPADCALL |s| (QREFELT $ 41)) . #1=(|ARR2CAT-;check_seg|))
          (LETT |i1| (SPADCALL |s| (QREFELT $ 42)) . #1#)
          (LETT |i2| (SPADCALL |s| (QREFELT $ 43)) . #1#)
          (EXIT
           (COND
            ((< 0 |ii|)
             (COND
              ((< (+ |i2| 1) |i1|) (|error| "check_seg: index out of range"))
              (#2='T
               (SEQ (LETT |cc| (+ (- |i2| |i1|) |ii|) . #1#)
                    (EXIT
                     (COND ((< |cc| |ii|) |cc|)
                           ((OR (< |i1| |lb|) (< |ub| |i2|))
                            (|error| "check_seg: index out of range"))
                           (#3='T
                            (COND ((EQL |ii| 1) |cc|)
                                  (#2# (QUOTIENT2 |cc| |ii|))))))))))
            ((< |ii| 0)
             (SEQ (LETT |ii| (- |ii|) . #1#)
                  (COND
                   ((OR (OR (< (+ |i1| 1) |i2|) (< |i2| |lb|)) (< |ub| |i1|))
                    (EXIT (|error| "check_seg: index out of range"))))
                  (LETT |cc| (+ (- |i1| |i2|) |ii|) . #1#)
                  (EXIT
                   (COND ((< |cc| |ii|) |cc|)
                         ((OR (< |i2| |lb|) (< |ub| |i1|))
                          (|error| "check_seg: index out of range"))
                         (#3#
                          (COND ((EQL |ii| 1) |cc|)
                                (#2# (QUOTIENT2 |cc| |ii|))))))))
            (#2# (|error| "chec_seg: zero increment"))))))) 

(SDEFUN |ARR2CAT-;elt;S2SS;14|
        ((|x| S) (|sr| |Segment| (|Integer|)) (|sc| |Segment| (|Integer|))
         ($ S))
        (SPROG
         ((#1=#:G266 NIL) (|j| NIL) (|l| NIL) (#2=#:G265 NIL) (|i| NIL)
          (|k| NIL) (|y| (S)) (|nc| #3=(|NonNegativeInteger|)) (|nr| #3#)
          (|ic| #4=(|Integer|)) (|ir| #4#) (|uc| #5=(|Integer|))
          (|lc| #6=(|Integer|)) (|ur| #5#) (|lr| #6#))
         (SEQ
          (LETT |lr| (SPADCALL |sr| (QREFELT $ 42))
                . #7=(|ARR2CAT-;elt;S2SS;14|))
          (LETT |ur| (SPADCALL |sr| (QREFELT $ 43)) . #7#)
          (LETT |lc| (SPADCALL |sc| (QREFELT $ 42)) . #7#)
          (LETT |uc| (SPADCALL |sc| (QREFELT $ 43)) . #7#)
          (LETT |ir| (SPADCALL |sr| (QREFELT $ 41)) . #7#)
          (LETT |ic| (SPADCALL |sc| (QREFELT $ 41)) . #7#)
          (COND
           ((EQL |ir| 1)
            (COND
             ((EQL |ic| 1)
              (EXIT (SPADCALL |x| |lr| |ur| |lc| |uc| (QREFELT $ 44)))))))
          (LETT |nr|
                (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #7#)
          (LETT |nc|
                (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #7#)
          (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 35)) . #7#)
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (SEQ (LETT |k| |lr| . #7#)
               (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #7#)
               (LETT #2# (SPADCALL |y| (QREFELT $ 12)) . #7#) G190
               (COND
                ((OR (> |i| #2#)
                     (IF (MINUSP |ir|)
                         (< |k| |ur|)
                         (> |k| |ur|)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| |lc| . #7#)
                      (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #7#)
                      (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #7#) G190
                      (COND
                       ((OR (> |j| #1#)
                            (IF (MINUSP |ic|)
                                (< |l| |uc|)
                                (> |l| |uc|)))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |y| |i| |j|
                                  (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                  (QREFELT $ 36))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| |ic|) . #7#))
                            . #7#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| |ir|) . #7#)) . #7#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;check_segs|
        ((|ls| |List| (|Segment| (|Integer|))) (|lb| |Integer|)
         (|ub| |Integer|) ($ |NonNegativeInteger|))
        (SPROG ((|res| (|NonNegativeInteger|)) (#1=#:G270 NIL) (|s| NIL))
               (SEQ (LETT |res| 0 . #2=(|ARR2CAT-;check_segs|))
                    (SEQ (LETT |s| NIL . #2#) (LETT #1# |ls| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |s| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (+ |res|
                                    (|ARR2CAT-;check_seg| |s| |lb| |ub| $))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |ARR2CAT-;elt;S2LS;16|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|)))
         (|lsc| |List| (|Segment| (|Integer|))) ($ S))
        (SPROG
         ((|i| (|Integer|)) (|j| (|Integer|)) (#1=#:G282 NIL) (#2=#:G283 NIL)
          (|l| NIL) (#3=#:G281 NIL) (|sc| NIL) (|k| NIL) (|ir| (|Integer|))
          (|ur| (|Integer|)) (|lr| (|Integer|)) (#4=#:G280 NIL) (|sr| NIL)
          (|y| (S)) (|nc| #5=(|NonNegativeInteger|)) (|nr| #5#))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #6=(|ARR2CAT-;elt;S2LS;16|))
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #6#)
          (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 35)) . #6#)
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #6#)
          (SEQ (LETT |sr| NIL . #6#) (LETT #4# |lsr| . #6#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |sr| (CAR #4#) . #6#) NIL))
                 (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT $ 42)) . #6#)
                    (LETT |ur| (SPADCALL |sr| (QREFELT $ 43)) . #6#)
                    (LETT |ir| (SPADCALL |sr| (QREFELT $ 41)) . #6#)
                    (EXIT
                     (SEQ (LETT |k| |lr| . #6#) G190
                          (COND
                           ((IF (MINUSP |ir|)
                                (< |k| |ur|)
                                (> |k| |ur|))
                            (GO G191)))
                          (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #6#)
                               (SEQ (LETT |sc| NIL . #6#)
                                    (LETT #3# |lsc| . #6#) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN
                                           (LETT |sc| (CAR #3#) . #6#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SEQ
                                       (LETT |l| (SPADCALL |sc| (QREFELT $ 42))
                                             . #6#)
                                       (LETT #2# (SPADCALL |sc| (QREFELT $ 43))
                                             . #6#)
                                       (LETT #1# (SPADCALL |sc| (QREFELT $ 41))
                                             . #6#)
                                       G190
                                       (COND
                                        ((IF (MINUSP #1#)
                                             (< |l| #2#)
                                             (> |l| #2#))
                                         (GO G191)))
                                       (SEQ
                                        (SPADCALL |y| |i| |j|
                                                  (SPADCALL |x| |k| |l|
                                                            (QREFELT $ 15))
                                                  (QREFELT $ 36))
                                        (EXIT (LETT |j| (+ |j| 1) . #6#)))
                                       (LETT |l| (+ |l| #1#) . #6#) (GO G190)
                                       G191 (EXIT NIL))))
                                    (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |i| (+ |i| 1) . #6#)))
                          (LETT |k| (+ |k| |ir|) . #6#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;S2L2S;17|
        ((|x| S) (|rowList| |List| (|Integer|)) (|colList| |List| (|Integer|))
         (|y| S) ($ S))
        (SPROG
         ((#1=#:G302 NIL) (|ej| NIL) (#2=#:G303 NIL) (|j| NIL) (#3=#:G300 NIL)
          (|ei| NIL) (#4=#:G301 NIL) (|i| NIL) (#5=#:G296 NIL) (#6=#:G299 NIL)
          (#7=#:G297 NIL) (#8=#:G298 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL . #9=(|ARR2CAT-;setelt!;S2L2S;17|))
                 (LETT #8# |rowList| . #9#) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |ei| (CAR #8#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT $ 11)))
                         (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 12))
                                   (QREFELT $ 28)))
                     (PROGN
                      (LETT #7# (|error| "setelt!: index out of range") . #9#)
                      (GO #10=#:G286))))))
                 (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL)))
           #10# (EXIT #7#))
          (SEQ
           (EXIT
            (SEQ (LETT |ej| NIL . #9#) (LETT #6# |colList| . #9#) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |ej| (CAR #6#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ej| (SPADCALL |x| (QREFELT $ 13)))
                         (SPADCALL |ej| (SPADCALL |x| (QREFELT $ 14))
                                   (QREFELT $ 28)))
                     (PROGN
                      (LETT #5# (|error| "setelt!: index out of range") . #9#)
                      (GO #11=#:G289))))))
                 (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL)))
           #11# (EXIT #5#))
          (COND
           ((OR
             (SPADCALL (LENGTH |rowList|) (SPADCALL |y| (QREFELT $ 21))
                       (QREFELT $ 48))
             (SPADCALL (LENGTH |colList|) (SPADCALL |y| (QREFELT $ 22))
                       (QREFELT $ 48)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #9#)
               (LETT #4# (SPADCALL |y| (QREFELT $ 12)) . #9#)
               (LETT |ei| NIL . #9#) (LETT #3# |rowList| . #9#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |ei| (CAR #3#) . #9#) NIL)
                     (> |i| #4#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #9#)
                      (LETT #2# (SPADCALL |y| (QREFELT $ 14)) . #9#)
                      (LETT |ej| NIL . #9#) (LETT #1# |colList| . #9#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#) . #9#) NIL)
                            (> |j| #2#))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |x| |ei| |ej|
                                  (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                  (QREFELT $ 36))))
                      (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1) . #9#))
                            . #9#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT #3# (PROG1 (CDR #3#) (LETT |i| (+ |i| 1) . #9#)) . #9#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;S2S2S;18|
        ((|x| S) (|sr| |Segment| (|Integer|)) (|sc| |Segment| (|Integer|))
         (|y| S) ($ S))
        (SPROG
         ((#1=#:G311 NIL) (|j| NIL) (|l| NIL) (#2=#:G310 NIL) (|i| NIL)
          (|k| NIL) (|nc| #3=(|NonNegativeInteger|)) (|nr| #3#)
          (|ic| #4=(|Integer|)) (|ir| #4#) (|uc| #5=(|Integer|))
          (|lc| #6=(|Integer|)) (|ur| #5#) (|lr| #6#))
         (SEQ
          (LETT |lr| (SPADCALL |sr| (QREFELT $ 42))
                . #7=(|ARR2CAT-;setelt!;S2S2S;18|))
          (LETT |ur| (SPADCALL |sr| (QREFELT $ 43)) . #7#)
          (LETT |lc| (SPADCALL |sc| (QREFELT $ 42)) . #7#)
          (LETT |uc| (SPADCALL |sc| (QREFELT $ 43)) . #7#)
          (LETT |ir| (SPADCALL |sr| (QREFELT $ 41)) . #7#)
          (LETT |ic| (SPADCALL |sc| (QREFELT $ 41)) . #7#)
          (LETT |nr|
                (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #7#)
          (LETT |nc|
                (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #7#)
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 50))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 50)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (SEQ (LETT |k| |lr| . #7#)
               (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #7#)
               (LETT #2# (SPADCALL |y| (QREFELT $ 12)) . #7#) G190
               (COND
                ((OR (> |i| #2#)
                     (IF (MINUSP |ir|)
                         (< |k| |ur|)
                         (> |k| |ur|)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| |lc| . #7#)
                      (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #7#)
                      (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #7#) G190
                      (COND
                       ((OR (> |j| #1#)
                            (IF (MINUSP |ic|)
                                (< |l| |uc|)
                                (> |l| |uc|)))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |x| |k| |l|
                                  (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                  (QREFELT $ 36))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| |ic|) . #7#))
                            . #7#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| |ir|) . #7#)) . #7#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;S2L2S;19|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|)))
         (|lsc| |List| (|Segment| (|Integer|))) (|y| S) ($ S))
        (SPROG
         ((|i| (|Integer|)) (|j| (|Integer|)) (#1=#:G325 NIL) (#2=#:G326 NIL)
          (|l| NIL) (#3=#:G324 NIL) (|sc| NIL) (|k| NIL) (|ir| (|Integer|))
          (|ur| (|Integer|)) (|lr| (|Integer|)) (#4=#:G323 NIL) (|sr| NIL)
          (|nc| #5=(|NonNegativeInteger|)) (|nr| #5#))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #6=(|ARR2CAT-;setelt!;S2L2S;19|))
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #6#)
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 50))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 50)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #6#)
          (SEQ (LETT |sr| NIL . #6#) (LETT #4# |lsr| . #6#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |sr| (CAR #4#) . #6#) NIL))
                 (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT $ 42)) . #6#)
                    (LETT |ur| (SPADCALL |sr| (QREFELT $ 43)) . #6#)
                    (LETT |ir| (SPADCALL |sr| (QREFELT $ 41)) . #6#)
                    (EXIT
                     (SEQ (LETT |k| |lr| . #6#) G190
                          (COND
                           ((IF (MINUSP |ir|)
                                (< |k| |ur|)
                                (> |k| |ur|))
                            (GO G191)))
                          (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #6#)
                               (SEQ (LETT |sc| NIL . #6#)
                                    (LETT #3# |lsc| . #6#) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN
                                           (LETT |sc| (CAR #3#) . #6#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SEQ
                                       (LETT |l| (SPADCALL |sc| (QREFELT $ 42))
                                             . #6#)
                                       (LETT #2# (SPADCALL |sc| (QREFELT $ 43))
                                             . #6#)
                                       (LETT #1# (SPADCALL |sc| (QREFELT $ 41))
                                             . #6#)
                                       G190
                                       (COND
                                        ((IF (MINUSP #1#)
                                             (< |l| #2#)
                                             (> |l| #2#))
                                         (GO G191)))
                                       (SEQ
                                        (SPADCALL |x| |k| |l|
                                                  (SPADCALL |y| |i| |j|
                                                            (QREFELT $ 15))
                                                  (QREFELT $ 36))
                                        (EXIT (LETT |j| (+ |j| 1) . #6#)))
                                       (LETT |l| (+ |l| #1#) . #6#) (GO G190)
                                       G191 (EXIT NIL))))
                                    (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |i| (+ |i| 1) . #6#)))
                          (LETT |k| (+ |k| |ir|) . #6#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setsubMatrix!;S2I2S;20|
        ((|x| S) (|i1| |Integer|) (|j1| |Integer|) (|y| S) ($ S))
        (SPROG
         ((#1=#:G336 NIL) (|j| NIL) (|l| NIL) (#2=#:G335 NIL) (|i| NIL)
          (|k| NIL) (|j2| #3=(|Integer|)) (|i2| #3#))
         (SEQ
          (LETT |i2| (- (+ |i1| (SPADCALL |y| (QREFELT $ 21))) 1)
                . #4=(|ARR2CAT-;setsubMatrix!;S2I2S;20|))
          (LETT |j2| (- (+ |j1| (SPADCALL |y| (QREFELT $ 22))) 1) . #4#)
          (COND
           ((OR (< |i1| (SPADCALL |x| (QREFELT $ 11)))
                (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 28)))
            (EXIT
             (|error|
              (LIST "setsubMatrix!: inserted matrix too big,"
                    "use subMatrix to restrict it")))))
          (COND
           ((OR (< |j1| (SPADCALL |x| (QREFELT $ 13)))
                (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 28)))
            (EXIT
             (|error|
              (LIST "setsubMatrix!: inserted matrix too big,"
                    "use subMatrix to restrict it")))))
          (SEQ (LETT |k| |i1| . #4#)
               (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #4#)
               (LETT #2# (SPADCALL |y| (QREFELT $ 12)) . #4#) G190
               (COND ((OR (> |i| #2#) (> |k| |i2|)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| |j1| . #4#)
                      (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #4#)
                      (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #4#) G190
                      (COND ((OR (> |j| #1#) (> |l| |j2|)) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |x| |k| |l|
                                  (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                  (QREFELT $ 36))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #4#))
                            . #4#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #4#)) . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |x|)))) 

(SDEFUN |ARR2CAT-;swapRows!;S2IS;21|
        ((|x| S) (|i1| |Integer|) (|i2| |Integer|) ($ S))
        (SPROG ((|r| (R)) (#1=#:G346 NIL) (|j| NIL))
               (SEQ
                (COND
                 ((OR (< |i1| (SPADCALL |x| (QREFELT $ 11)))
                      (OR
                       (SPADCALL |i1| (SPADCALL |x| (QREFELT $ 12))
                                 (QREFELT $ 28))
                       (OR (< |i2| (SPADCALL |x| (QREFELT $ 11)))
                           (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 12))
                                     (QREFELT $ 28)))))
                  (|error| "swapRows!: index out of range"))
                 ('T
                  (COND ((EQL |i1| |i2|) |x|)
                        ('T
                         (SEQ
                          (SEQ
                           (LETT |j| (SPADCALL |x| (QREFELT $ 13))
                                 . #2=(|ARR2CAT-;swapRows!;S2IS;21|))
                           (LETT #1# (SPADCALL |x| (QREFELT $ 14)) . #2#) G190
                           (COND ((> |j| #1#) (GO G191)))
                           (SEQ
                            (LETT |r| (SPADCALL |x| |i1| |j| (QREFELT $ 15))
                                  . #2#)
                            (SPADCALL |x| |i1| |j|
                                      (SPADCALL |x| |i2| |j| (QREFELT $ 15))
                                      (QREFELT $ 36))
                            (EXIT (SPADCALL |x| |i2| |j| |r| (QREFELT $ 36))))
                           (LETT |j| (+ |j| 1) . #2#) (GO G190) G191
                           (EXIT NIL))
                          (EXIT |x|))))))))) 

(SDEFUN |ARR2CAT-;swapColumns!;S2IS;22|
        ((|x| S) (|j1| |Integer|) (|j2| |Integer|) ($ S))
        (SPROG ((|r| (R)) (#1=#:G356 NIL) (|i| NIL))
               (SEQ
                (COND
                 ((OR (< |j1| (SPADCALL |x| (QREFELT $ 13)))
                      (OR
                       (SPADCALL |j1| (SPADCALL |x| (QREFELT $ 14))
                                 (QREFELT $ 28))
                       (OR (< |j2| (SPADCALL |x| (QREFELT $ 13)))
                           (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 14))
                                     (QREFELT $ 28)))))
                  (|error| "swapColumns!: index out of range"))
                 ('T
                  (COND ((EQL |j1| |j2|) |x|)
                        ('T
                         (SEQ
                          (SEQ
                           (LETT |i| (SPADCALL |x| (QREFELT $ 11))
                                 . #2=(|ARR2CAT-;swapColumns!;S2IS;22|))
                           (LETT #1# (SPADCALL |x| (QREFELT $ 12)) . #2#) G190
                           (COND ((> |i| #1#) (GO G191)))
                           (SEQ
                            (LETT |r| (SPADCALL |x| |i| |j1| (QREFELT $ 15))
                                  . #2#)
                            (SPADCALL |x| |i| |j1|
                                      (SPADCALL |x| |i| |j2| (QREFELT $ 15))
                                      (QREFELT $ 36))
                            (EXIT (SPADCALL |x| |i| |j2| |r| (QREFELT $ 36))))
                           (LETT |i| (+ |i| 1) . #2#) (GO G190) G191
                           (EXIT NIL))
                          (EXIT |x|))))))))) 

(SDEFUN |ARR2CAT-;transpose;2S;23| ((|x| S) ($ S))
        (SPROG
         ((#1=#:G362 NIL) (|j| NIL) (#2=#:G361 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |x| (QREFELT $ 22))
                          (SPADCALL |x| (QREFELT $ 21)) (QREFELT $ 35))
                . #3=(|ARR2CAT-;transpose;2S;23|))
          (SEQ (LETT |i| (SPADCALL |ans| (QREFELT $ 11)) . #3#)
               (LETT #2# (SPADCALL |ans| (QREFELT $ 12)) . #3#) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |ans| (QREFELT $ 13)) . #3#)
                      (LETT #1# (SPADCALL |ans| (QREFELT $ 14)) . #3#) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL |x| |j| |i| (QREFELT $ 15))
                                  (QREFELT $ 36))))
                      (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;squareTop;2S;24| ((|x| S) ($ S))
        (SPROG
         ((#1=#:G369 NIL) (|j| NIL) (#2=#:G368 NIL) (|i| NIL) (|ans| (S))
          (|cols| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((< (SPADCALL |x| (QREFELT $ 21))
               (LETT |cols| (SPADCALL |x| (QREFELT $ 22))
                     . #3=(|ARR2CAT-;squareTop;2S;24|)))
            (|error| "squareTop: number of columns exceeds number of rows"))
           ('T
            (SEQ (LETT |ans| (SPADCALL |cols| |cols| (QREFELT $ 35)) . #3#)
                 (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 11)) . #3#)
                      (LETT #2# (- (+ (SPADCALL |x| (QREFELT $ 11)) |cols|) 1)
                            . #3#)
                      G190 (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 13)) . #3#)
                             (LETT #1# (SPADCALL |x| (QREFELT $ 14)) . #3#)
                             G190 (COND ((> |j| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |ans| |i| |j|
                                         (SPADCALL |x| |i| |j| (QREFELT $ 15))
                                         (QREFELT $ 36))))
                             (LETT |j| (+ |j| 1) . #3#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
                 (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;horizConcat;3S;25| ((|x| S) (|y| S) ($ S))
        (SPADCALL (LIST |x| |y|) (QREFELT $ 59))) 

(SDEFUN |ARR2CAT-;horizConcat;LS;26| ((|la| |List| S) ($ S))
        (SPROG
         ((|l| (|Integer|)) (#1=#:G384 NIL) (|j| NIL) (#2=#:G383 NIL) (|a| NIL)
          (#3=#:G382 NIL) (|i| NIL) (|ans| (S)) (|nc| (|NonNegativeInteger|))
          (#4=#:G381 NIL) (|nr| (|NonNegativeInteger|)) (|a1| (S)))
         (SEQ
          (COND ((NULL |la|) (|error| "horizConcat: empty list"))
                ('T
                 (SEQ
                  (LETT |a1| (|SPADfirst| |la|)
                        . #5=(|ARR2CAT-;horizConcat;LS;26|))
                  (LETT |nr| (SPADCALL |a1| (QREFELT $ 21)) . #5#)
                  (LETT |nc| (SPADCALL |a1| (QREFELT $ 22)) . #5#)
                  (SEQ (LETT |a| NIL . #5#) (LETT #4# (CDR |la|) . #5#) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |a| (CAR #4#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |nr| (SPADCALL |a| (QREFELT $ 21))
                                     (QREFELT $ 50))
                           (|error|
                            "horizConcat: array must have same number of rows"))
                          ('T
                           (LETT |nc| (+ |nc| (SPADCALL |a| (QREFELT $ 22)))
                                 . #5#)))))
                       (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                  (LETT |ans| (SPADCALL |nr| |nc| (QREFELT $ 35)) . #5#)
                  (SEQ (LETT |i| (SPADCALL |a1| (QREFELT $ 11)) . #5#)
                       (LETT #3# (SPADCALL |a1| (QREFELT $ 12)) . #5#) G190
                       (COND ((> |i| #3#) (GO G191)))
                       (SEQ (LETT |l| (SPADCALL |ans| (QREFELT $ 13)) . #5#)
                            (EXIT
                             (SEQ (LETT |a| NIL . #5#) (LETT #2# |la| . #5#)
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |a| (CAR #2#) . #5#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (LETT |j| (SPADCALL |a| (QREFELT $ 13))
                                           . #5#)
                                     (LETT #1# (SPADCALL |a| (QREFELT $ 14))
                                           . #5#)
                                     G190 (COND ((> |j| #1#) (GO G191)))
                                     (SEQ
                                      (SPADCALL |ans| |i| |l|
                                                (SPADCALL |a| |i| |j|
                                                          (QREFELT $ 15))
                                                (QREFELT $ 36))
                                      (EXIT (LETT |l| (+ |l| 1) . #5#)))
                                     (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                                     (EXIT NIL))))
                                  (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                                  (EXIT NIL))))
                       (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
                  (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;vertConcat;3S;27| ((|x| S) (|y| S) ($ S))
        (SPADCALL (LIST |x| |y|) (QREFELT $ 62))) 

(SDEFUN |ARR2CAT-;vertConcat;LS;28| ((|la| |List| S) ($ S))
        (SPROG
         ((|l| (|Integer|)) (#1=#:G398 NIL) (|j| NIL) (#2=#:G397 NIL) (|i| NIL)
          (#3=#:G396 NIL) (|a| NIL) (|ans| (S)) (|nr| (|NonNegativeInteger|))
          (#4=#:G395 NIL) (|nc| (|NonNegativeInteger|)) (|a1| (S)))
         (SEQ
          (COND ((NULL |la|) (|error| "vertConcat: empty list"))
                ('T
                 (SEQ
                  (LETT |a1| (|SPADfirst| |la|)
                        . #5=(|ARR2CAT-;vertConcat;LS;28|))
                  (LETT |nr| (SPADCALL |a1| (QREFELT $ 21)) . #5#)
                  (LETT |nc| (SPADCALL |a1| (QREFELT $ 22)) . #5#)
                  (SEQ (LETT |a| NIL . #5#) (LETT #4# (CDR |la|) . #5#) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |a| (CAR #4#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |nc| (SPADCALL |a| (QREFELT $ 22))
                                     (QREFELT $ 50))
                           (|error|
                            "vertConcat: array must have same number of columns"))
                          ('T
                           (LETT |nr| (+ |nr| (SPADCALL |a| (QREFELT $ 21)))
                                 . #5#)))))
                       (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                  (LETT |ans| (SPADCALL |nr| |nc| (QREFELT $ 35)) . #5#)
                  (LETT |l| (SPADCALL |ans| (QREFELT $ 11)) . #5#)
                  (SEQ (LETT |a| NIL . #5#) (LETT #3# |la| . #5#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |i| (SPADCALL |a| (QREFELT $ 11)) . #5#)
                              (LETT #2# (SPADCALL |a| (QREFELT $ 12)) . #5#)
                              G190 (COND ((> |i| #2#) (GO G191)))
                              (SEQ
                               (SEQ
                                (LETT |j| (SPADCALL |a| (QREFELT $ 13)) . #5#)
                                (LETT #1# (SPADCALL |a| (QREFELT $ 14)) . #5#)
                                G190 (COND ((> |j| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |ans| |l| |j|
                                            (SPADCALL |a| |i| |j|
                                                      (QREFELT $ 15))
                                            (QREFELT $ 36))))
                                (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                                (EXIT NIL))
                               (EXIT (LETT |l| (+ |l| 1) . #5#)))
                              (LETT |i| (+ |i| 1) . #5#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
                  (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;blockConcat;LS;29| ((LLA |List| (|List| S)) ($ S))
        (SPROG ((#1=#:G402 NIL) (LA NIL) (#2=#:G401 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|ARR2CAT-;blockConcat;LS;29|))
                  (SEQ (LETT LA NIL . #3#) (LETT #1# LLA . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT LA (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL LA (QREFELT $ 59)) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 62))))) 

(SDEFUN |ARR2CAT-;vertSplit;SPiL;30|
        ((A S) (|r| |PositiveInteger|) ($ |List| S))
        (SPROG
         ((#1=#:G411 NIL) (|i| NIL) (#2=#:G410 NIL) (|mac| (|Integer|))
          (|mic| (|Integer|)) (|mir| (|Integer|))
          (|dr| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (LETT |dr| (SPADCALL (SPADCALL A (QREFELT $ 21)) |r| (QREFELT $ 68))
                . #3=(|ARR2CAT-;vertSplit;SPiL;30|))
          (EXIT
           (COND
            ((QEQCAR |dr| 1)
             (|error| "split does not result in an equal division"))
            ('T
             (SEQ (LETT |mir| (SPADCALL A (QREFELT $ 11)) . #3#)
                  (LETT |mic| (SPADCALL A (QREFELT $ 13)) . #3#)
                  (LETT |mac| (SPADCALL A (QREFELT $ 14)) . #3#)
                  (EXIT
                   (PROGN
                    (LETT #2# NIL . #3#)
                    (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |r| 1) . #3#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL A (+ |mir| (* |i| (QCDR |dr|)))
                                            (-
                                             (+ |mir|
                                                (* (+ |i| 1) (QCDR |dr|)))
                                             1)
                                            |mic| |mac| (QREFELT $ 44))
                                  #2#)
                                 . #3#)))
                         (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |ARR2CAT-;vertSplit;SLL;31|
        ((A S) (|lr| |List| (|PositiveInteger|)) ($ |List| S))
        (SPROG
         ((#1=#:G431 NIL) (|i| NIL) (#2=#:G430 NIL) (|mac| (|Integer|))
          (|mic| (|Integer|)) (|mir| (|Integer|))
          (|l| (|List| (|PositiveInteger|))))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL (ELT $ 71) |lr| (QREFELT $ 74))
                      (SPADCALL A (QREFELT $ 21)) (QREFELT $ 50))
            (|error| "split does not result in proper partition"))
           ('T
            (SEQ
             (LETT |l| (CONS 1 (SPADCALL (ELT $ 71) |lr| 1 (QREFELT $ 76)))
                   . #3=(|ARR2CAT-;vertSplit;SLL;31|))
             (LETT |mir| (- (SPADCALL A (QREFELT $ 11)) 1) . #3#)
             (LETT |mic| (SPADCALL A (QREFELT $ 13)) . #3#)
             (LETT |mac| (SPADCALL A (QREFELT $ 14)) . #3#)
             (EXIT
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |i| 2 . #3#) (LETT #1# (LENGTH |l|) . #3#) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (SPADCALL A
                                       (+ |mir|
                                          (SPADCALL |l| (- |i| 1)
                                                    (QREFELT $ 77)))
                                       (-
                                        (+ |mir|
                                           (SPADCALL |l| |i| (QREFELT $ 77)))
                                        1)
                                       |mic| |mac| (QREFELT $ 44))
                             #2#)
                            . #3#)))
                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |ARR2CAT-;horizSplit;SPiL;32|
        ((A S) (|c| |PositiveInteger|) ($ |List| S))
        (SPROG
         ((#1=#:G440 NIL) (|i| NIL) (#2=#:G439 NIL) (|mic| (|Integer|))
          (|mar| (|Integer|)) (|mir| (|Integer|))
          (|dc| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (LETT |dc| (SPADCALL (SPADCALL A (QREFELT $ 22)) |c| (QREFELT $ 68))
                . #3=(|ARR2CAT-;horizSplit;SPiL;32|))
          (EXIT
           (COND
            ((QEQCAR |dc| 1)
             (|error| "split does not result in an equal division"))
            ('T
             (SEQ (LETT |mir| (SPADCALL A (QREFELT $ 11)) . #3#)
                  (LETT |mar| (SPADCALL A (QREFELT $ 12)) . #3#)
                  (LETT |mic| (SPADCALL A (QREFELT $ 13)) . #3#)
                  (EXIT
                   (PROGN
                    (LETT #2# NIL . #3#)
                    (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |c| 1) . #3#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL A |mir| |mar|
                                            (+ |mic| (* |i| (QCDR |dc|)))
                                            (-
                                             (+ |mic|
                                                (* (+ |i| 1) (QCDR |dc|)))
                                             1)
                                            (QREFELT $ 44))
                                  #2#)
                                 . #3#)))
                         (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |ARR2CAT-;horizSplit;SLL;33|
        ((A S) (|lc| |List| (|PositiveInteger|)) ($ |List| S))
        (SPROG
         ((#1=#:G460 NIL) (|i| NIL) (#2=#:G459 NIL) (|mic| (|Integer|))
          (|mar| (|Integer|)) (|mir| (|Integer|))
          (|l| (|List| (|PositiveInteger|))))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL (ELT $ 71) |lc| (QREFELT $ 74))
                      (SPADCALL A (QREFELT $ 22)) (QREFELT $ 50))
            (|error| "split does not result in proper partition"))
           ('T
            (SEQ
             (LETT |l| (CONS 1 (SPADCALL (ELT $ 71) |lc| 1 (QREFELT $ 76)))
                   . #3=(|ARR2CAT-;horizSplit;SLL;33|))
             (LETT |mir| (SPADCALL A (QREFELT $ 11)) . #3#)
             (LETT |mar| (SPADCALL A (QREFELT $ 12)) . #3#)
             (LETT |mic| (- (SPADCALL A (QREFELT $ 13)) 1) . #3#)
             (EXIT
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |i| 2 . #3#) (LETT #1# (LENGTH |l|) . #3#) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (SPADCALL A |mir| |mar|
                                       (+ |mic|
                                          (SPADCALL |l| (- |i| 1)
                                                    (QREFELT $ 77)))
                                       (-
                                        (+ |mic|
                                           (SPADCALL |l| |i| (QREFELT $ 77)))
                                        1)
                                       (QREFELT $ 44))
                             #2#)
                            . #3#)))
                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |ARR2CAT-;blockSplit;S2PiL;34|
        ((A S) (|nr| |PositiveInteger|) (|nc| |PositiveInteger|)
         ($ |List| (|List| S)))
        (SPROG ((#1=#:G464 NIL) (X NIL) (#2=#:G463 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|ARR2CAT-;blockSplit;S2PiL;34|))
                 (SEQ (LETT X NIL . #3#)
                      (LETT #1# (SPADCALL A |nr| (QREFELT $ 81)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL X |nc| (QREFELT $ 82)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |ARR2CAT-;blockSplit;S2LL;35|
        ((A S) (|lr| |List| (|PositiveInteger|))
         (|lc| |List| (|PositiveInteger|)) ($ |List| (|List| S)))
        (SPROG ((#1=#:G468 NIL) (X NIL) (#2=#:G467 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|ARR2CAT-;blockSplit;S2LL;35|))
                 (SEQ (LETT X NIL . #3#)
                      (LETT #1# (SPADCALL A |lr| (QREFELT $ 84)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL X |lc| (QREFELT $ 85)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |ARR2CAT-;copy;2S;36| ((|m| S) ($ S))
        (SPROG
         ((#1=#:G474 NIL) (|j| NIL) (#2=#:G473 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                          (SPADCALL |m| (QREFELT $ 22)) NIL (QREFELT $ 87))
                . #3=(|ARR2CAT-;copy;2S;36|))
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3#)
               (LETT #2# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                      (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                  (QREFELT $ 36))))
                      (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;fill!;SRS;37| ((|m| S) (|r| R) ($ S))
        (SPROG ((#1=#:G480 NIL) (|j| NIL) (#2=#:G479 NIL) (|i| NIL))
               (SEQ
                (SEQ
                 (LETT |i| (SPADCALL |m| (QREFELT $ 11))
                       . #3=(|ARR2CAT-;fill!;SRS;37|))
                 (LETT #2# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
                 (COND ((> |i| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                        (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                        (COND ((> |j| #1#) (GO G191)))
                        (SEQ (EXIT (SPADCALL |m| |i| |j| |r| (QREFELT $ 36))))
                        (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |ARR2CAT-;map;M2S;38| ((|f| |Mapping| R R) (|m| S) ($ S))
        (SPROG
         ((#1=#:G487 NIL) (|j| NIL) (#2=#:G486 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                          (SPADCALL |m| (QREFELT $ 22)) NIL (QREFELT $ 87))
                . #3=(|ARR2CAT-;map;M2S;38|))
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3#)
               (LETT #2# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                      (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL
                                   (SPADCALL |m| |i| |j| (QREFELT $ 15)) |f|)
                                  (QREFELT $ 36))))
                      (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;map!;M2S;39| ((|f| |Mapping| R R) (|m| S) ($ S))
        (SPROG ((#1=#:G493 NIL) (|j| NIL) (#2=#:G492 NIL) (|i| NIL))
               (SEQ
                (SEQ
                 (LETT |i| (SPADCALL |m| (QREFELT $ 11))
                       . #3=(|ARR2CAT-;map!;M2S;39|))
                 (LETT #2# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
                 (COND ((> |i| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                        (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                        (COND ((> |j| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |m| |i| |j|
                                    (SPADCALL
                                     (SPADCALL |m| |i| |j| (QREFELT $ 15)) |f|)
                                    (QREFELT $ 36))))
                        (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |ARR2CAT-;map;M3S;40| ((|f| |Mapping| R R R) (|m| S) (|n| S) ($ S))
        (SPROG
         ((#1=#:G502 NIL) (|j| NIL) (#2=#:G501 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (COND
           ((OR
             (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                       (SPADCALL |n| (QREFELT $ 21)) (QREFELT $ 48))
             (SPADCALL (SPADCALL |m| (QREFELT $ 22))
                       (SPADCALL |n| (QREFELT $ 22)) (QREFELT $ 48)))
            (|error| "map: arguments must have same dimensions"))
           ('T
            (SEQ
             (LETT |ans|
                   (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                             (SPADCALL |m| (QREFELT $ 22)) NIL (QREFELT $ 87))
                   . #3=(|ARR2CAT-;map;M3S;40|))
             (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3#)
                  (LETT #2# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
                  (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                         (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                         (COND ((> |j| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |ans| |i| |j|
                                     (SPADCALL
                                      (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                      (SPADCALL |n| |i| |j| (QREFELT $ 15))
                                      |f|)
                                     (QREFELT $ 36))))
                         (LETT |j| (+ |j| 1) . #3#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
             (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;map;M2SRS;41|
        ((|f| |Mapping| R R R) (|m| S) (|n| S) (|r| R) ($ S))
        (SPROG
         ((|j| NIL) (|i| NIL) (|ans| (S)) (|maxCol| #1=(|Integer|))
          (|maxRow| #1#))
         (SEQ
          (LETT |maxRow|
                (MAX (SPADCALL |m| (QREFELT $ 12))
                     (SPADCALL |n| (QREFELT $ 12)))
                . #2=(|ARR2CAT-;map;M2SRS;41|))
          (LETT |maxCol|
                (MAX (SPADCALL |m| (QREFELT $ 14))
                     (SPADCALL |n| (QREFELT $ 14)))
                . #2#)
          (LETT |ans|
                (SPADCALL
                 (MAX (SPADCALL |m| (QREFELT $ 21))
                      (SPADCALL |n| (QREFELT $ 21)))
                 (MAX (SPADCALL |m| (QREFELT $ 22))
                      (SPADCALL |n| (QREFELT $ 22)))
                 NIL (QREFELT $ 87))
                . #2#)
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #2#) G190
               (COND ((> |i| |maxRow|) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #2#) G190
                      (COND ((> |j| |maxCol|) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL
                                   (SPADCALL |m| |i| |j| |r| (QREFELT $ 95))
                                   (SPADCALL |n| |i| |j| |r| (QREFELT $ 95))
                                   |f|)
                                  (QREFELT $ 36))))
                      (LETT |j| (+ |j| 1) . #2#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;setRow!;SIRowS;42|
        ((|m| S) (|i| |Integer|) (|v| |Row|) ($ S))
        (SPROG ((#1=#:G512 NIL) (|j| NIL) (#2=#:G513 NIL) (|k| NIL))
               (SEQ
                (COND
                 ((OR (< |i| (SPADCALL |m| (QREFELT $ 11)))
                      (SPADCALL |i| (SPADCALL |m| (QREFELT $ 12))
                                (QREFELT $ 28)))
                  (|error| "setRow!: index out of range"))
                 ('T
                  (SEQ
                   (SEQ
                    (LETT |k| (SPADCALL |v| (QREFELT $ 97))
                          . #3=(|ARR2CAT-;setRow!;SIRowS;42|))
                    (LETT #2# (SPADCALL |v| (QREFELT $ 98)) . #3#)
                    (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                    (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                    (COND ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
                    (SEQ
                     (EXIT
                      (SPADCALL |m| |i| |j| (SPADCALL |v| |k| (QREFELT $ 99))
                                (QREFELT $ 36))))
                    (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #3#))
                          . #3#)
                    (GO G190) G191 (EXIT NIL))
                   (EXIT |m|))))))) 

(SDEFUN |ARR2CAT-;setColumn!;SIColS;43|
        ((|m| S) (|j| |Integer|) (|v| |Col|) ($ S))
        (SPROG ((#1=#:G519 NIL) (|i| NIL) (#2=#:G520 NIL) (|k| NIL))
               (SEQ
                (COND
                 ((OR (< |j| (SPADCALL |m| (QREFELT $ 13)))
                      (SPADCALL |j| (SPADCALL |m| (QREFELT $ 14))
                                (QREFELT $ 28)))
                  (|error| "setColumn!: index out of range"))
                 ('T
                  (SEQ
                   (SEQ
                    (LETT |k| (SPADCALL |v| (QREFELT $ 101))
                          . #3=(|ARR2CAT-;setColumn!;SIColS;43|))
                    (LETT #2# (SPADCALL |v| (QREFELT $ 102)) . #3#)
                    (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3#)
                    (LETT #1# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
                    (COND ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
                    (SEQ
                     (EXIT
                      (SPADCALL |m| |i| |j| (SPADCALL |v| |k| (QREFELT $ 103))
                                (QREFELT $ 36))))
                    (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#))
                          . #3#)
                    (GO G190) G191 (EXIT NIL))
                   (EXIT |m|))))))) 

(SDEFUN |ARR2CAT-;=;2SB;44| ((|m| S) (|n| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G529 NIL) (#2=#:G530 NIL) (#3=#:G532 NIL) (|j| NIL)
          (#4=#:G531 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |m| |n| (QREFELT $ 105)) 'T)
                 ((OR
                   (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                             (SPADCALL |n| (QREFELT $ 21)) (QREFELT $ 48))
                   (SPADCALL (SPADCALL |m| (QREFELT $ 22))
                             (SPADCALL |n| (QREFELT $ 22)) (QREFELT $ 48)))
                  'NIL)
                 ('T
                  (SEQ
                   (SEQ
                    (LETT |i| (SPADCALL |m| (QREFELT $ 11))
                          . #5=(|ARR2CAT-;=;2SB;44|))
                    (LETT #4# (SPADCALL |m| (QREFELT $ 12)) . #5#) G190
                    (COND ((> |i| #4#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #5#)
                           (LETT #3# (SPADCALL |m| (QREFELT $ 14)) . #5#) G190
                           (COND ((> |j| #3#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                          (SPADCALL |n| |i| |j| (QREFELT $ 15))
                                          (QREFELT $ 106)))
                               (PROGN
                                (LETT #1#
                                      (PROGN
                                       (LETT #2# 'NIL . #5#)
                                       (GO #6=#:G528))
                                      . #5#)
                                (GO #7=#:G524))))))
                           (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                           (EXIT NIL)))
                     #7# (EXIT #1#))
                    (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
                   (EXIT 'T)))))
          #6# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;member?;RSB;45| ((|r| R) (|m| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G538 NIL) (#2=#:G539 NIL) (#3=#:G541 NIL) (|j| NIL)
          (#4=#:G540 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |i| (SPADCALL |m| (QREFELT $ 11))
                   . #5=(|ARR2CAT-;member?;RSB;45|))
             (LETT #4# (SPADCALL |m| (QREFELT $ 12)) . #5#) G190
             (COND ((> |i| #4#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #5#)
                    (LETT #3# (SPADCALL |m| (QREFELT $ 14)) . #5#) G190
                    (COND ((> |j| #3#) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15)) |r|
                                  (QREFELT $ 106))
                        (PROGN
                         (LETT #1# (PROGN (LETT #2# 'T . #5#) (GO #6=#:G537))
                               . #5#)
                         (GO #7=#:G534))))))
                    (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL)))
              #7# (EXIT #1#))
             (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT 'NIL)))
          #6# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;count;RSNni;46| ((|r| R) (|m| S) ($ |NonNegativeInteger|))
        (SPROG NIL
               (SPADCALL (CONS #'|ARR2CAT-;count;RSNni;46!0| (VECTOR $ |r|))
                         |m| (QREFELT $ 109)))) 

(SDEFUN |ARR2CAT-;count;RSNni;46!0| ((|x| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|ARR2CAT-;count;RSNni;46|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |r| (QREFELT $ 106)))))) 

(SDEFUN |ARR2CAT-;row;SIRow;47| ((|m| S) (|i| |Integer|) ($ |Row|))
        (SPROG
         ((#1=#:G549 NIL) (|j| NIL) (#2=#:G550 NIL) (|k| NIL) (|v| (|Row|)))
         (SEQ
          (COND
           ((OR (< |i| (SPADCALL |m| (QREFELT $ 11)))
                (SPADCALL |i| (SPADCALL |m| (QREFELT $ 12)) (QREFELT $ 28)))
            (|error| "row: index out of range"))
           ('T
            (SEQ
             (LETT |v|
                   (SPADCALL (SPADCALL |m| (QREFELT $ 22)) NIL (QREFELT $ 111))
                   . #3=(|ARR2CAT-;row;SIRow;47|))
             (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 97)) . #3#)
                  (LETT #2# (SPADCALL |v| (QREFELT $ 98)) . #3#)
                  (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                  (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                  (COND ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |v| |k| (SPADCALL |m| |i| |j| (QREFELT $ 15))
                              (QREFELT $ 112))))
                  (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT |v|))))))) 

(SDEFUN |ARR2CAT-;column;SICol;48| ((|m| S) (|j| |Integer|) ($ |Col|))
        (SPROG
         ((#1=#:G556 NIL) (|i| NIL) (#2=#:G557 NIL) (|k| NIL) (|v| (|Col|)))
         (SEQ
          (COND
           ((OR (< |j| (SPADCALL |m| (QREFELT $ 13)))
                (SPADCALL |j| (SPADCALL |m| (QREFELT $ 14)) (QREFELT $ 28)))
            (|error| "column: index out of range"))
           ('T
            (SEQ
             (LETT |v|
                   (SPADCALL (SPADCALL |m| (QREFELT $ 21)) NIL (QREFELT $ 114))
                   . #3=(|ARR2CAT-;column;SICol;48|))
             (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 101)) . #3#)
                  (LETT #2# (SPADCALL |v| (QREFELT $ 102)) . #3#)
                  (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3#)
                  (LETT #1# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
                  (COND ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |v| |k| (SPADCALL |m| |i| |j| (QREFELT $ 15))
                              (QREFELT $ 115))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT |v|))))))) 

(SDEFUN |ARR2CAT-;coerce;SOf;49| ((|m| S) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|List| (|OutputForm|)))) (#1=#:G565 NIL) (|j| NIL)
          (#2=#:G564 NIL) (#3=#:G563 NIL) (|i| NIL) (#4=#:G562 NIL))
         (SEQ
          (LETT |l|
                (PROGN
                 (LETT #4# NIL . #5=(|ARR2CAT-;coerce;SOf;49|))
                 (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #5#)
                      (LETT #3# (SPADCALL |m| (QREFELT $ 12)) . #5#) G190
                      (COND ((> |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL . #5#)
                                (SEQ
                                 (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #5#)
                                 (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #5#)
                                 G190 (COND ((> |j| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS
                                          (SPADCALL
                                           (SPADCALL |m| |i| |j|
                                                     (QREFELT $ 15))
                                           (QREFELT $ 118))
                                          #2#)
                                         . #5#)))
                                 (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                               #4#)
                              . #5#)))
                      (LETT |i| (+ |i| 1) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT (SPADCALL |l| (QREFELT $ 119)))))) 

(DECLAIM (NOTINLINE |TwoDimensionalArrayCategory&;|)) 

(DEFUN |TwoDimensionalArrayCategory&| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|TwoDimensionalArrayCategory&|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|TwoDimensionalArrayCategory&| DV$1 DV$2 DV$3 DV$4)
          . #1#)
    (LETT $ (GETREFV 121) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasSignature| |#2|
                      (LIST '=
                            (LIST '(|Boolean|) (|devaluate| |#2|)
                                  (|devaluate| |#2|))))
      (PROGN
       (QSETREFV $ 107 (CONS (|dispatchFunction| |ARR2CAT-;=;2SB;44|) $))
       (QSETREFV $ 108 (CONS (|dispatchFunction| |ARR2CAT-;member?;RSB;45|) $))
       (QSETREFV $ 110
                 (CONS (|dispatchFunction| |ARR2CAT-;count;RSNni;46|) $)))))
    (COND
     ((|HasCategory| |#3| '(|shallowlyMutable|))
      (QSETREFV $ 113 (CONS (|dispatchFunction| |ARR2CAT-;row;SIRow;47|) $))))
    (COND
     ((|HasCategory| |#4| '(|shallowlyMutable|))
      (QSETREFV $ 116
                (CONS (|dispatchFunction| |ARR2CAT-;column;SICol;48|) $))))
    (COND
     ((|HasCategory| |#2| '(|CoercibleTo| (|OutputForm|)))
      (QSETREFV $ 120 (CONS (|dispatchFunction| |ARR2CAT-;coerce;SOf;49|) $))))
    $))) 

(MAKEPROP '|TwoDimensionalArrayCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|) (0 . |minRowIndex|)
              (5 . |maxRowIndex|) (10 . |minColIndex|) (15 . |maxColIndex|)
              (20 . |qelt|) (|Boolean|) (|Mapping| 16 7) |ARR2CAT-;any?;MSB;1|
              |ARR2CAT-;every?;MSB;2| (|NonNegativeInteger|) (27 . |nrows|)
              (32 . |ncols|) |ARR2CAT-;size?;SNniB;3| |ARR2CAT-;less?;SNniB;4|
              (37 . >) |ARR2CAT-;more?;SNniB;5| |ARR2CAT-;#;SNni;6| (43 . >)
              |ARR2CAT-;elt;S2I2R;7| |ARR2CAT-;count;MSNni;8| (|List| 7)
              |ARR2CAT-;parts;SL;9| (|List| 31) |ARR2CAT-;listOfLists;SL;10|
              (49 . |qnew|) (55 . |qsetelt!|) |ARR2CAT-;subMatrix;S4IS;11|
              (|List| 10) |ARR2CAT-;elt;S2LS;12| (|Segment| 10) (63 . |incr|)
              (68 . |low|) (73 . |high|) (78 . |subMatrix|)
              |ARR2CAT-;elt;S2SS;14| (|List| 40) |ARR2CAT-;elt;S2LS;16|
              (87 . ~=) |ARR2CAT-;setelt!;S2L2S;17| (93 . ~=)
              |ARR2CAT-;setelt!;S2S2S;18| |ARR2CAT-;setelt!;S2L2S;19|
              |ARR2CAT-;setsubMatrix!;S2I2S;20| |ARR2CAT-;swapRows!;S2IS;21|
              |ARR2CAT-;swapColumns!;S2IS;22| |ARR2CAT-;transpose;2S;23|
              |ARR2CAT-;squareTop;2S;24| (|List| $) (99 . |horizConcat|)
              |ARR2CAT-;horizConcat;3S;25| |ARR2CAT-;horizConcat;LS;26|
              (104 . |vertConcat|) |ARR2CAT-;vertConcat;3S;27|
              |ARR2CAT-;vertConcat;LS;28| (|List| 58)
              |ARR2CAT-;blockConcat;LS;29| (|Union| $ '"failed")
              (109 . |exquo|) (|PositiveInteger|) |ARR2CAT-;vertSplit;SPiL;30|
              (115 . +) (|Mapping| 69 69 69) (|List| 69) (121 . |reduce|)
              (|ListFunctions2| 69 69) (127 . |scan|) (134 . |elt|)
              |ARR2CAT-;vertSplit;SLL;31| |ARR2CAT-;horizSplit;SPiL;32|
              |ARR2CAT-;horizSplit;SLL;33| (140 . |vertSplit|)
              (146 . |horizSplit|) |ARR2CAT-;blockSplit;S2PiL;34|
              (152 . |vertSplit|) (158 . |horizSplit|)
              |ARR2CAT-;blockSplit;S2LL;35| (164 . |new|) |ARR2CAT-;copy;2S;36|
              |ARR2CAT-;fill!;SRS;37| (|Mapping| 7 7) |ARR2CAT-;map;M2S;38|
              |ARR2CAT-;map!;M2S;39| (|Mapping| 7 7 7) |ARR2CAT-;map;M3S;40|
              (171 . |elt|) |ARR2CAT-;map;M2SRS;41| (179 . |minIndex|)
              (184 . |maxIndex|) (189 . |elt|) |ARR2CAT-;setRow!;SIRowS;42|
              (195 . |minIndex|) (200 . |maxIndex|) (205 . |elt|)
              |ARR2CAT-;setColumn!;SIColS;43| (211 . |eq?|) (217 . =) (223 . =)
              (229 . |member?|) (235 . |count|) (241 . |count|) (247 . |new|)
              (253 . |qsetelt!|) (260 . |row|) (266 . |new|) (272 . |qsetelt!|)
              (279 . |column|) (|OutputForm|) (285 . |coerce|) (290 . |matrix|)
              (295 . |coerce|))
           '#(|vertSplit| 300 |vertConcat| 312 |transpose| 323 |swapRows!| 328
              |swapColumns!| 335 |subMatrix| 342 |squareTop| 351 |size?| 356
              |setsubMatrix!| 362 |setelt!| 370 |setRow!| 394 |setColumn!| 401
              |row| 408 |parts| 414 |more?| 419 |member?| 425 |map!| 431 |map|
              437 |listOfLists| 458 |less?| 463 |horizSplit| 469 |horizConcat|
              481 |fill!| 492 |every?| 498 |elt| 504 |count| 533 |copy| 545
              |column| 550 |coerce| 556 |blockSplit| 561 |blockConcat| 575
              |any?| 580 = 586 |#| 592)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 120
                                                 '(1 6 10 0 11 1 6 10 0 12 1 6
                                                   10 0 13 1 6 10 0 14 3 6 7 0
                                                   10 10 15 1 6 20 0 21 1 6 20
                                                   0 22 2 20 16 0 0 25 2 10 16
                                                   0 0 28 2 6 0 20 20 35 4 6 7
                                                   0 10 10 7 36 1 40 10 0 41 1
                                                   40 10 0 42 1 40 10 0 43 5 6
                                                   0 0 10 10 10 10 44 2 10 16 0
                                                   0 48 2 20 16 0 0 50 1 6 0 58
                                                   59 1 6 0 58 62 2 20 67 0 0
                                                   68 2 69 0 0 0 71 2 73 69 72
                                                   0 74 3 75 73 72 73 69 76 2
                                                   73 69 0 10 77 2 6 58 0 69 81
                                                   2 6 58 0 69 82 2 6 58 0 73
                                                   84 2 6 58 0 73 85 3 6 0 20
                                                   20 7 87 4 6 7 0 10 10 7 95 1
                                                   8 10 0 97 1 8 10 0 98 2 8 7
                                                   0 10 99 1 9 10 0 101 1 9 10
                                                   0 102 2 9 7 0 10 103 2 6 16
                                                   0 0 105 2 7 16 0 0 106 2 0
                                                   16 0 0 107 2 0 16 7 0 108 2
                                                   6 20 17 0 109 2 0 20 7 0 110
                                                   2 8 0 20 7 111 3 8 7 0 10 7
                                                   112 2 0 8 0 10 113 2 9 0 20
                                                   7 114 3 9 7 0 10 7 115 2 0 9
                                                   0 10 116 1 7 117 0 118 1 117
                                                   0 65 119 1 0 117 0 120 2 0
                                                   58 0 69 70 2 0 58 0 73 78 2
                                                   0 0 0 0 63 1 0 0 58 64 1 0 0
                                                   0 56 3 0 0 0 10 10 54 3 0 0
                                                   0 10 10 55 5 0 0 0 10 10 10
                                                   10 37 1 0 0 0 57 2 0 16 0 20
                                                   23 4 0 0 0 10 10 0 53 4 0 0
                                                   0 40 40 0 51 4 0 0 0 46 46 0
                                                   52 4 0 0 0 38 38 0 49 3 0 0
                                                   0 10 8 100 3 0 0 0 10 9 104
                                                   2 0 8 0 10 113 1 0 31 0 32 2
                                                   0 16 0 20 26 2 0 16 7 0 108
                                                   2 0 0 90 0 92 4 0 0 93 0 0 7
                                                   96 3 0 0 93 0 0 94 2 0 0 90
                                                   0 91 1 0 33 0 34 2 0 16 0 20
                                                   24 2 0 58 0 73 80 2 0 58 0
                                                   69 79 1 0 0 58 61 2 0 0 0 0
                                                   60 2 0 0 0 7 89 2 0 16 17 0
                                                   19 3 0 0 0 40 40 45 3 0 0 0
                                                   46 46 47 3 0 0 0 38 38 39 4
                                                   0 7 0 10 10 7 29 2 0 20 7 0
                                                   110 2 0 20 17 0 30 1 0 0 0
                                                   88 2 0 9 0 10 116 1 0 117 0
                                                   120 3 0 65 0 73 73 86 3 0 65
                                                   0 69 69 83 1 0 0 65 66 2 0
                                                   16 17 0 18 2 0 16 0 0 107 1
                                                   0 20 0 27)))))
           '|lookupComplete|)) 
