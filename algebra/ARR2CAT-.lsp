
(SDEFUN |ARR2CAT-;any?;MSB;1|
        ((|f| |Mapping| (|Boolean|) R) (|m| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G215 NIL) (#2=#:G216 NIL) (#3=#:G218 NIL) (|j| NIL)
          (#4=#:G217 NIL) (|i| NIL))
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
                         (LETT #1# (PROGN (LETT #2# 'T . #5#) (GO #6=#:G214))
                               . #5#)
                         (GO #7=#:G210))))))
                    (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL)))
              #7# (EXIT #1#))
             (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #6# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;every?;MSB;2|
        ((|f| |Mapping| (|Boolean|) R) (|m| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G224 NIL) (#2=#:G225 NIL) (#3=#:G227 NIL) (|j| NIL)
          (#4=#:G226 NIL) (|i| NIL))
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
                         (LETT #1# (PROGN (LETT #2# NIL . #5#) (GO #6=#:G223))
                               . #5#)
                         (GO #7=#:G220))))))
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
         ((|num| (|NonNegativeInteger|)) (#1=#:G244 NIL) (|j| NIL)
          (#2=#:G243 NIL) (|i| NIL))
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
         ((|entryList| (|List| R)) (#1=#:G250 NIL) (|j| NIL) (#2=#:G249 NIL)
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
         ((|ll| (|List| (|List| R))) (|l| (|List| R)) (#1=#:G257 NIL) (|j| NIL)
          (#2=#:G256 NIL) (|i| NIL))
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
         ((#1=#:G270 NIL) (|j| NIL) (#2=#:G271 NIL) (|l| NIL) (#3=#:G268 NIL)
          (|i| NIL) (#4=#:G269 NIL) (|k| NIL) (|y| (S))
          (|cols| #5=(|NonNegativeInteger|)) (|rows| #5#))
         (SEQ
          (COND ((< (+ |i2| 1) |i1|) (|error| "subMatrix: bad row indices"))
                ((< (+ |j2| 1) |j1|) (|error| "subMatrix: bad column indices"))
                ('T
                 (SEQ
                  (LETT |rows| (+ (- |i2| |i1|) 1)
                        . #6=(|ARR2CAT-;subMatrix;S4IS;11|))
                  (LETT |cols| (+ (- |j2| |j1|) 1) . #6#)
                  (LETT |y| (SPADCALL |rows| |cols| (QREFELT $ 35)) . #6#)
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
                  (SEQ (LETT |k| |i1| . #6#) (LETT #4# |i2| . #6#)
                       (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #6#)
                       (LETT #3# (SPADCALL |y| (QREFELT $ 12)) . #6#) G190
                       (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |l| |j1| . #6#) (LETT #2# |j2| . #6#)
                              (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #6#)
                              (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #6#)
                              G190
                              (COND ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
                              (SEQ
                               (EXIT
                                (SPADCALL |y| |i| |j|
                                          (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                          (QREFELT $ 36))))
                              (LETT |j|
                                    (PROG1 (+ |j| 1)
                                      (LETT |l| (+ |l| 1) . #6#))
                                    . #6#)
                              (GO G190) G191 (EXIT NIL))))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #6#))
                             . #6#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |y|))))))) 

(SDEFUN |ARR2CAT-;elt;SILS;12|
        ((|x| S) (|row| |Integer|) (|colList| |List| (|Integer|)) ($ S))
        (SPROG
         ((#1=#:G282 NIL) (|ej| NIL) (#2=#:G283 NIL) (|j| NIL) (|y| (S))
          (#3=#:G280 NIL) (#4=#:G281 NIL))
         (SEQ
          (COND
           ((OR (< |row| (SPADCALL |x| (QREFELT $ 11)))
                (SPADCALL |row| (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 28)))
            (|error| "elt: index out of range"))
           ('T
            (SEQ
             (SEQ
              (EXIT
               (SEQ (LETT |ej| NIL . #5=(|ARR2CAT-;elt;SILS;12|))
                    (LETT #4# |colList| . #5#) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |ej| (CAR #4#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((OR (< |ej| (SPADCALL |x| (QREFELT $ 13)))
                            (SPADCALL |ej| (SPADCALL |x| (QREFELT $ 14))
                                      (QREFELT $ 28)))
                        (PROGN
                         (LETT #3# (|error| "elt: index out of range") . #5#)
                         (GO #6=#:G276))))))
                    (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL)))
              #6# (EXIT #3#))
             (LETT |y| (SPADCALL 1 (LENGTH |colList|) (QREFELT $ 35)) . #5#)
             (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #5#)
                  (LETT #2# (SPADCALL |y| (QREFELT $ 14)) . #5#)
                  (LETT |ej| NIL . #5#) (LETT #1# |colList| . #5#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#) . #5#) NIL)
                        (> |j| #2#))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |y| 1 |j|
                              (SPADCALL |x| |row| |ej| (QREFELT $ 15))
                              (QREFELT $ 36))))
                  (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1) . #5#)) . #5#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT |y|))))))) 

(SDEFUN |ARR2CAT-;elt;SLIS;13|
        ((|x| S) (|rowList| |List| (|Integer|)) (|col| |Integer|) ($ S))
        (SPROG
         ((#1=#:G294 NIL) (|ei| NIL) (#2=#:G295 NIL) (|i| NIL) (|y| (S))
          (#3=#:G292 NIL) (#4=#:G293 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL . #5=(|ARR2CAT-;elt;SLIS;13|))
                 (LETT #4# |rowList| . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |ei| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT $ 11)))
                         (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 12))
                                   (QREFELT $ 28)))
                     (PROGN
                      (LETT #3# (|error| "elt: index out of range") . #5#)
                      (GO #6=#:G286))))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL)))
           #6# (EXIT #3#))
          (COND
           ((OR (< |col| (SPADCALL |x| (QREFELT $ 13)))
                (SPADCALL |col| (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 28)))
            (EXIT (|error| "elt: index out of range"))))
          (LETT |y| (SPADCALL (LENGTH |rowList|) 1 (QREFELT $ 35)) . #5#)
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #5#)
               (LETT #2# (SPADCALL |y| (QREFELT $ 12)) . #5#)
               (LETT |ei| NIL . #5#) (LETT #1# |rowList| . #5#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ei| (CAR #1#) . #5#) NIL)
                     (> |i| #2#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |y| |i| 1 (SPADCALL |x| |ei| |col| (QREFELT $ 15))
                           (QREFELT $ 36))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |i| (+ |i| 1) . #5#)) . #5#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;S2LS;14|
        ((|x| S) (|rowList| |List| (|Integer|)) (|colList| |List| (|Integer|))
         ($ S))
        (SPROG
         ((#1=#:G312 NIL) (|ej| NIL) (#2=#:G313 NIL) (|j| NIL) (#3=#:G310 NIL)
          (|ei| NIL) (#4=#:G311 NIL) (|i| NIL) (|y| (S)) (#5=#:G306 NIL)
          (#6=#:G309 NIL) (#7=#:G307 NIL) (#8=#:G308 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL . #9=(|ARR2CAT-;elt;S2LS;14|))
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
                      (GO #10=#:G298))))))
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
                      (GO #11=#:G301))))))
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
          (LETT |ii| (SPADCALL |s| (QREFELT $ 43)) . #1=(|ARR2CAT-;check_seg|))
          (LETT |i1| (SPADCALL |s| (QREFELT $ 44)) . #1#)
          (LETT |i2| (SPADCALL |s| (QREFELT $ 45)) . #1#)
          (COND
           ((SPADCALL |ii| 0 (QREFELT $ 28))
            (COND
             ((< (+ |i2| 1) |i1|) (EXIT (|error| #2="check_seg: bad indices")))
             ((< |ii| 0) (COND ((< (+ |i1| 1) |i2|) (EXIT (|error| #2#)))))))
           ((< |ii| 0) (COND ((< (+ |i1| 1) |i2|) (EXIT (|error| #2#))))))
          (COND
           ((SPADCALL |i1| |i2| (QREFELT $ 28))
            (COND ((SPADCALL |ii| 0 (QREFELT $ 28)) (EXIT 0))
                  ((SPADCALL |i2| |i1| (QREFELT $ 28))
                   (COND ((< |ii| 0) (EXIT 0))))))
           ((SPADCALL |i2| |i1| (QREFELT $ 28)) (COND ((< |ii| 0) (EXIT 0)))))
          (EXIT
           (COND
            ((< 0 |ii|)
             (COND
              ((< (+ |i2| 1) |i1|) (|error| "check_seg: index out of range"))
              (#3='T
               (SEQ (LETT |cc| (+ (- |i2| |i1|) |ii|) . #1#)
                    (EXIT
                     (COND ((< |cc| |ii|) |cc|)
                           ((OR (< |i1| |lb|) (< |ub| |i2|))
                            (|error| "check_seg: index out of range"))
                           (#4='T
                            (COND ((EQL |ii| 1) |cc|)
                                  (#3# (QUOTIENT2 |cc| |ii|))))))))))
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
                         (#4#
                          (COND ((EQL |ii| 1) |cc|)
                                (#3# (QUOTIENT2 |cc| |ii|))))))))
            (#3# (|error| "chec_seg: zero increment"))))))) 

(SDEFUN |ARR2CAT-;elt;SLSS;16|
        ((|x| S) (|rowList| |List| (|Integer|)) (|sc| |Segment| (|Integer|))
         ($ S))
        (SPROG
         ((#1=#:G331 NIL) (|j| NIL) (#2=#:G332 NIL) (#3=#:G333 NIL) (|l| NIL)
          (#4=#:G329 NIL) (|i| NIL) (#5=#:G330 NIL) (|k| NIL) (|y| (S))
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|ic| (|Integer|)) (|uc| (|Integer|)) (|lc| (|Integer|)))
         (SEQ
          (LETT |lc| (SPADCALL |sc| (QREFELT $ 44))
                . #6=(|ARR2CAT-;elt;SLSS;16|))
          (LETT |uc| (SPADCALL |sc| (QREFELT $ 45)) . #6#)
          (LETT |ic| (SPADCALL |sc| (QREFELT $ 43)) . #6#)
          (LETT |nr| (LENGTH |rowList|) . #6#)
          (LETT |nc|
                (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #6#)
          (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 35)) . #6#)
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (SEQ (LETT |k| NIL . #6#) (LETT #5# |rowList| . #6#)
               (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #6#)
               (LETT #4# (SPADCALL |y| (QREFELT $ 12)) . #6#) G190
               (COND
                ((OR (> |i| #4#) (ATOM #5#)
                     (PROGN (LETT |k| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| |lc| . #6#) (LETT #3# |uc| . #6#)
                      (LETT #2# |ic| . #6#)
                      (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #6#)
                      (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #6#) G190
                      (COND
                       ((OR (> |j| #1#)
                            (IF (MINUSP #2#)
                                (< |l| #3#)
                                (> |l| #3#)))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |y| |i| |j|
                                  (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                  (QREFELT $ 36))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#) . #6#)) . #6#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;SSLS;17|
        ((|x| S) (|sr| |Segment| (|Integer|)) (|colList| |List| (|Integer|))
         ($ S))
        (SPROG
         ((#1=#:G341 NIL) (|j| NIL) (#2=#:G342 NIL) (|l| NIL) (#3=#:G338 NIL)
          (|i| NIL) (#4=#:G339 NIL) (#5=#:G340 NIL) (|k| NIL) (|y| (S))
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|ir| (|Integer|)) (|ur| (|Integer|)) (|lr| (|Integer|)))
         (SEQ
          (LETT |lr| (SPADCALL |sr| (QREFELT $ 44))
                . #6=(|ARR2CAT-;elt;SSLS;17|))
          (LETT |ur| (SPADCALL |sr| (QREFELT $ 45)) . #6#)
          (LETT |ir| (SPADCALL |sr| (QREFELT $ 43)) . #6#)
          (LETT |nr|
                (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #6#)
          (LETT |nc| (LENGTH |colList|) . #6#)
          (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 35)) . #6#)
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (SEQ (LETT |k| |lr| . #6#) (LETT #5# |ur| . #6#)
               (LETT #4# |ir| . #6#)
               (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #6#)
               (LETT #3# (SPADCALL |y| (QREFELT $ 12)) . #6#) G190
               (COND
                ((OR (> |i| #3#)
                     (IF (MINUSP #4#)
                         (< |k| #5#)
                         (> |k| #5#)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| NIL . #6#) (LETT #2# |colList| . #6#)
                      (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #6#)
                      (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #6#) G190
                      (COND
                       ((OR (> |j| #1#) (ATOM #2#)
                            (PROGN (LETT |l| (CAR #2#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |y| |i| |j|
                                  (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                  (QREFELT $ 36))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT #2# (CDR #2#) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #4#) . #6#)) . #6#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;S2SS;18|
        ((|x| S) (|sr| |Segment| (|Integer|)) (|sc| |Segment| (|Integer|))
         ($ S))
        (SPROG
         ((#1=#:G350 NIL) (|j| NIL) (#2=#:G351 NIL) (#3=#:G352 NIL) (|l| NIL)
          (#4=#:G347 NIL) (|i| NIL) (#5=#:G348 NIL) (#6=#:G349 NIL) (|k| NIL)
          (|y| (S)) (|nc| #7=(|NonNegativeInteger|)) (|nr| #7#)
          (|ic| #8=(|Integer|)) (|ir| #8#) (|uc| #9=(|Integer|))
          (|lc| #10=(|Integer|)) (|ur| #9#) (|lr| #10#))
         (SEQ
          (LETT |lr| (SPADCALL |sr| (QREFELT $ 44))
                . #11=(|ARR2CAT-;elt;S2SS;18|))
          (LETT |ur| (SPADCALL |sr| (QREFELT $ 45)) . #11#)
          (LETT |lc| (SPADCALL |sc| (QREFELT $ 44)) . #11#)
          (LETT |uc| (SPADCALL |sc| (QREFELT $ 45)) . #11#)
          (LETT |ir| (SPADCALL |sr| (QREFELT $ 43)) . #11#)
          (LETT |ic| (SPADCALL |sc| (QREFELT $ 43)) . #11#)
          (COND
           ((EQL |ir| 1)
            (COND
             ((EQL |ic| 1)
              (EXIT (SPADCALL |x| |lr| |ur| |lc| |uc| (QREFELT $ 48)))))))
          (LETT |nr|
                (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #11#)
          (LETT |nc|
                (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #11#)
          (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 35)) . #11#)
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (SEQ (LETT |k| |lr| . #11#) (LETT #6# |ur| . #11#)
               (LETT #5# |ir| . #11#)
               (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #11#)
               (LETT #4# (SPADCALL |y| (QREFELT $ 12)) . #11#) G190
               (COND
                ((OR (> |i| #4#)
                     (IF (MINUSP #5#)
                         (< |k| #6#)
                         (> |k| #6#)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| |lc| . #11#) (LETT #3# |uc| . #11#)
                      (LETT #2# |ic| . #11#)
                      (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #11#)
                      (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #11#) G190
                      (COND
                       ((OR (> |j| #1#)
                            (IF (MINUSP #2#)
                                (< |l| #3#)
                                (> |l| #3#)))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |y| |i| |j|
                                  (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                  (QREFELT $ 36))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#) . #11#))
                            . #11#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #5#) . #11#))
                     . #11#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;check_segs|
        ((|ls| |List| (|Segment| (|Integer|))) (|lb| |Integer|)
         (|ub| |Integer|) ($ |NonNegativeInteger|))
        (SPROG ((|res| (|NonNegativeInteger|)) (#1=#:G356 NIL) (|s| NIL))
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

(SDEFUN |ARR2CAT-;elt;SILS;20|
        ((|x| S) (|row| |Integer|) (|lsc| |List| (|Segment| (|Integer|)))
         ($ S))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G364 NIL) (#2=#:G365 NIL) (|l| NIL)
          (#3=#:G363 NIL) (|sc| NIL) (|y| (S)) (|nc| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #4=(|ARR2CAT-;elt;SILS;20|))
          (LETT |y| (SPADCALL 1 |nc| (QREFELT $ 35)) . #4#)
          (EXIT
           (COND ((EQL |nc| 0) |y|)
                 ('T
                  (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #4#)
                       (SEQ (LETT |sc| NIL . #4#) (LETT #3# |lsc| . #4#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |sc| (CAR #3#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ
                               (LETT |l| (SPADCALL |sc| (QREFELT $ 44)) . #4#)
                               (LETT #2# (SPADCALL |sc| (QREFELT $ 45)) . #4#)
                               (LETT #1# (SPADCALL |sc| (QREFELT $ 43)) . #4#)
                               G190
                               (COND
                                ((IF (MINUSP #1#)
                                     (< |l| #2#)
                                     (> |l| #2#))
                                 (GO G191)))
                               (SEQ
                                (SPADCALL |y| 1 |j|
                                          (SPADCALL |x| |row| |l|
                                                    (QREFELT $ 15))
                                          (QREFELT $ 36))
                                (EXIT (LETT |j| (+ |j| 1) . #4#)))
                               (LETT |l| (+ |l| #1#) . #4#) (GO G190) G191
                               (EXIT NIL))))
                            (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;elt;SLIS;21|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|))) (|col| |Integer|)
         ($ S))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G373 NIL) (#2=#:G374 NIL) (|k| NIL)
          (#3=#:G372 NIL) (|sr| NIL) (|y| (S)) (|nr| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #4=(|ARR2CAT-;elt;SLIS;21|))
          (LETT |y| (SPADCALL |nr| 1 (QREFELT $ 35)) . #4#)
          (EXIT
           (COND ((EQL |nr| 0) |y|)
                 ('T
                  (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #4#)
                       (SEQ (LETT |sr| NIL . #4#) (LETT #3# |lsr| . #4#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |sr| (CAR #3#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ
                               (LETT |k| (SPADCALL |sr| (QREFELT $ 44)) . #4#)
                               (LETT #2# (SPADCALL |sr| (QREFELT $ 45)) . #4#)
                               (LETT #1# (SPADCALL |sr| (QREFELT $ 43)) . #4#)
                               G190
                               (COND
                                ((IF (MINUSP #1#)
                                     (< |k| #2#)
                                     (> |k| #2#))
                                 (GO G191)))
                               (SEQ
                                (SPADCALL |y| |i| 1
                                          (SPADCALL |x| |k| |col|
                                                    (QREFELT $ 15))
                                          (QREFELT $ 36))
                                (EXIT (LETT |i| (+ |i| 1) . #4#)))
                               (LETT |k| (+ |k| #1#) . #4#) (GO G190) G191
                               (EXIT NIL))))
                            (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;elt;SSLS;22|
        ((|x| S) (|sr| |Segment| (|Integer|))
         (|lsc| |List| (|Segment| (|Integer|))) ($ S))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G384 NIL) (|i| NIL) (#2=#:G385 NIL)
          (#3=#:G386 NIL) (|k| NIL) (#4=#:G382 NIL) (#5=#:G383 NIL) (|l| NIL)
          (#6=#:G381 NIL) (|sc| NIL) (|y| (S)) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)) (|ir| (|Integer|)) (|ur| (|Integer|))
          (|lr| (|Integer|)))
         (SEQ
          (LETT |lr| (SPADCALL |sr| (QREFELT $ 44))
                . #7=(|ARR2CAT-;elt;SSLS;22|))
          (LETT |ur| (SPADCALL |sr| (QREFELT $ 45)) . #7#)
          (LETT |ir| (SPADCALL |sr| (QREFELT $ 43)) . #7#)
          (LETT |nr|
                (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #7#)
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #7#)
          (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 35)) . #7#)
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #7#)
          (SEQ (LETT |sc| NIL . #7#) (LETT #6# |lsc| . #7#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |sc| (CAR #6#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| (SPADCALL |sc| (QREFELT $ 44)) . #7#)
                      (LETT #5# (SPADCALL |sc| (QREFELT $ 45)) . #7#)
                      (LETT #4# (SPADCALL |sc| (QREFELT $ 43)) . #7#) G190
                      (COND
                       ((IF (MINUSP #4#)
                            (< |l| #5#)
                            (> |l| #5#))
                        (GO G191)))
                      (SEQ
                       (SEQ (LETT |k| |lr| . #7#) (LETT #3# |ur| . #7#)
                            (LETT #2# |ir| . #7#)
                            (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #7#)
                            (LETT #1# (SPADCALL |y| (QREFELT $ 12)) . #7#) G190
                            (COND
                             ((OR (> |i| #1#)
                                  (IF (MINUSP #2#)
                                      (< |k| #3#)
                                      (> |k| #3#)))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |y| |i| |j|
                                        (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                        (QREFELT $ 36))))
                            (LETT |i|
                                  (PROG1 (+ |i| 1)
                                    (LETT |k| (+ |k| #2#) . #7#))
                                  . #7#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT (LETT |j| (+ |j| 1) . #7#)))
                      (LETT |l| (+ |l| #4#) . #7#) (GO G190) G191 (EXIT NIL))))
               (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;SLSS;23|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|)))
         (|sc| |Segment| (|Integer|)) ($ S))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G396 NIL) (|j| NIL) (#2=#:G397 NIL)
          (#3=#:G398 NIL) (|l| NIL) (#4=#:G394 NIL) (#5=#:G395 NIL) (|k| NIL)
          (#6=#:G393 NIL) (|sr| NIL) (|y| (S)) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)) (|ic| (|Integer|)) (|uc| (|Integer|))
          (|lc| (|Integer|)))
         (SEQ
          (LETT |lc| (SPADCALL |sc| (QREFELT $ 44))
                . #7=(|ARR2CAT-;elt;SLSS;23|))
          (LETT |uc| (SPADCALL |sc| (QREFELT $ 45)) . #7#)
          (LETT |ic| (SPADCALL |sc| (QREFELT $ 43)) . #7#)
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #7#)
          (LETT |nc|
                (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #7#)
          (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 35)) . #7#)
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #7#)
          (SEQ (LETT |sr| NIL . #7#) (LETT #6# |lsr| . #7#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |sr| (CAR #6#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |k| (SPADCALL |sr| (QREFELT $ 44)) . #7#)
                      (LETT #5# (SPADCALL |sr| (QREFELT $ 45)) . #7#)
                      (LETT #4# (SPADCALL |sr| (QREFELT $ 43)) . #7#) G190
                      (COND
                       ((IF (MINUSP #4#)
                            (< |k| #5#)
                            (> |k| #5#))
                        (GO G191)))
                      (SEQ
                       (SEQ (LETT |l| |lc| . #7#) (LETT #3# |uc| . #7#)
                            (LETT #2# |ic| . #7#)
                            (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #7#)
                            (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #7#) G190
                            (COND
                             ((OR (> |j| #1#)
                                  (IF (MINUSP #2#)
                                      (< |l| #3#)
                                      (> |l| #3#)))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |y| |i| |j|
                                        (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                        (QREFELT $ 36))))
                            (LETT |j|
                                  (PROG1 (+ |j| 1)
                                    (LETT |l| (+ |l| #2#) . #7#))
                                  . #7#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT (LETT |i| (+ |i| 1) . #7#)))
                      (LETT |k| (+ |k| #4#) . #7#) (GO G190) G191 (EXIT NIL))))
               (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;S2LS;24|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|)))
         (|lsc| |List| (|Segment| (|Integer|))) ($ S))
        (SPROG
         ((|i| (|Integer|)) (|j| (|Integer|)) (#1=#:G412 NIL) (#2=#:G413 NIL)
          (|l| NIL) (#3=#:G411 NIL) (|sc| NIL) (#4=#:G409 NIL) (#5=#:G410 NIL)
          (|k| NIL) (|ir| (|Integer|)) (|ur| (|Integer|)) (|lr| (|Integer|))
          (#6=#:G408 NIL) (|sr| NIL) (|y| (S)) (|nc| #7=(|NonNegativeInteger|))
          (|nr| #7#))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #8=(|ARR2CAT-;elt;S2LS;24|))
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #8#)
          (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 35)) . #8#)
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #8#)
          (SEQ (LETT |sr| NIL . #8#) (LETT #6# |lsr| . #8#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |sr| (CAR #6#) . #8#) NIL))
                 (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT $ 44)) . #8#)
                    (LETT |ur| (SPADCALL |sr| (QREFELT $ 45)) . #8#)
                    (LETT |ir| (SPADCALL |sr| (QREFELT $ 43)) . #8#)
                    (EXIT
                     (SEQ (LETT |k| |lr| . #8#) (LETT #5# |ur| . #8#)
                          (LETT #4# |ir| . #8#) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |k| #5#)
                                (> |k| #5#))
                            (GO G191)))
                          (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #8#)
                               (SEQ (LETT |sc| NIL . #8#)
                                    (LETT #3# |lsc| . #8#) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN
                                           (LETT |sc| (CAR #3#) . #8#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SEQ
                                       (LETT |l| (SPADCALL |sc| (QREFELT $ 44))
                                             . #8#)
                                       (LETT #2# (SPADCALL |sc| (QREFELT $ 45))
                                             . #8#)
                                       (LETT #1# (SPADCALL |sc| (QREFELT $ 43))
                                             . #8#)
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
                                        (EXIT (LETT |j| (+ |j| 1) . #8#)))
                                       (LETT |l| (+ |l| #1#) . #8#) (GO G190)
                                       G191 (EXIT NIL))))
                                    (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |i| (+ |i| 1) . #8#)))
                          (LETT |k| (+ |k| #4#) . #8#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;rowSlice;SS;25| ((|x| S) ($ |Segment| (|Integer|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (SPADCALL |x| (QREFELT $ 12))
                  (QREFELT $ 56))) 

(SDEFUN |ARR2CAT-;colSlice;SS;26| ((|x| S) ($ |Segment| (|Integer|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 13)) (SPADCALL |x| (QREFELT $ 14))
                  (QREFELT $ 56))) 

(SDEFUN |ARR2CAT-;setelt!;SIL2S;27|
        ((|x| S) (|row| |Integer|) (|colList| |List| (|Integer|)) (|y| S)
         ($ S))
        (SPROG
         ((#1=#:G428 NIL) (|ej| NIL) (#2=#:G429 NIL) (|j| NIL)
          (|rowiy| (|Integer|)) (#3=#:G426 NIL) (#4=#:G427 NIL))
         (SEQ
          (COND
           ((OR (< |row| (SPADCALL |x| (QREFELT $ 11)))
                (SPADCALL |row| (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 28)))
            (|error| "setelt!: index out of range"))
           ('T
            (SEQ
             (SEQ
              (EXIT
               (SEQ (LETT |ej| NIL . #5=(|ARR2CAT-;setelt!;SIL2S;27|))
                    (LETT #4# |colList| . #5#) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |ej| (CAR #4#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((OR (< |ej| (SPADCALL |x| (QREFELT $ 13)))
                            (SPADCALL |ej| (SPADCALL |x| (QREFELT $ 14))
                                      (QREFELT $ 28)))
                        (PROGN
                         (LETT #3# (|error| "setelt!: index out of range")
                               . #5#)
                         (GO #6=#:G420))))))
                    (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL)))
              #6# (EXIT #3#))
             (COND
              ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) 1 (QREFELT $ 59))
                   (SPADCALL (LENGTH |colList|) (SPADCALL |y| (QREFELT $ 22))
                             (QREFELT $ 59)))
               (EXIT (|error| "setelt!: matrix has bad dimensions"))))
             (LETT |rowiy| (SPADCALL |y| (QREFELT $ 11)) . #5#)
             (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #5#)
                  (LETT #2# (SPADCALL |y| (QREFELT $ 14)) . #5#)
                  (LETT |ej| NIL . #5#) (LETT #1# |colList| . #5#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#) . #5#) NIL)
                        (> |j| #2#))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |x| |row| |ej|
                              (SPADCALL |y| |rowiy| |j| (QREFELT $ 15))
                              (QREFELT $ 36))))
                  (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1) . #5#)) . #5#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT |y|))))))) 

(SDEFUN |ARR2CAT-;setelt!;SLI2S;28|
        ((|x| S) (|rowList| |List| (|Integer|)) (|col| |Integer|) (|y| S)
         ($ S))
        (SPROG
         ((#1=#:G442 NIL) (|ei| NIL) (#2=#:G443 NIL) (|i| NIL)
          (|coliy| (|Integer|)) (#3=#:G440 NIL) (#4=#:G441 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL . #5=(|ARR2CAT-;setelt!;SLI2S;28|))
                 (LETT #4# |rowList| . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |ei| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT $ 11)))
                         (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 12))
                                   (QREFELT $ 28)))
                     (PROGN
                      (LETT #3# (|error| "setelt!: index out of range") . #5#)
                      (GO #6=#:G432))))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL)))
           #6# (EXIT #3#))
          (COND
           ((OR (< |col| (SPADCALL |x| (QREFELT $ 13)))
                (SPADCALL |col| (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 28)))
            (EXIT (|error| "setelt!: index out of range"))))
          (COND
           ((OR
             (SPADCALL (LENGTH |rowList|) (SPADCALL |y| (QREFELT $ 21))
                       (QREFELT $ 59))
             (SPADCALL (SPADCALL |y| (QREFELT $ 22)) 1 (QREFELT $ 59)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (LETT |coliy| (SPADCALL |y| (QREFELT $ 13)) . #5#)
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #5#)
               (LETT #2# (SPADCALL |y| (QREFELT $ 12)) . #5#)
               (LETT |ei| NIL . #5#) (LETT #1# |rowList| . #5#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ei| (CAR #1#) . #5#) NIL)
                     (> |i| #2#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |x| |ei| |col|
                           (SPADCALL |y| |i| |coliy| (QREFELT $ 15))
                           (QREFELT $ 36))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |i| (+ |i| 1) . #5#)) . #5#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;S2L2S;29|
        ((|x| S) (|rowList| |List| (|Integer|)) (|colList| |List| (|Integer|))
         (|y| S) ($ S))
        (SPROG
         ((#1=#:G462 NIL) (|ej| NIL) (#2=#:G463 NIL) (|j| NIL) (#3=#:G460 NIL)
          (|ei| NIL) (#4=#:G461 NIL) (|i| NIL) (#5=#:G456 NIL) (#6=#:G459 NIL)
          (#7=#:G457 NIL) (#8=#:G458 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL . #9=(|ARR2CAT-;setelt!;S2L2S;29|))
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
                      (GO #10=#:G446))))))
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
                      (GO #11=#:G449))))))
                 (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL)))
           #11# (EXIT #5#))
          (COND
           ((OR
             (SPADCALL (LENGTH |rowList|) (SPADCALL |y| (QREFELT $ 21))
                       (QREFELT $ 59))
             (SPADCALL (LENGTH |colList|) (SPADCALL |y| (QREFELT $ 22))
                       (QREFELT $ 59)))
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

(SDEFUN |ARR2CAT-;setelt!;S2S2S;30|
        ((|x| S) (|sr| |Segment| (|Integer|)) (|sc| |Segment| (|Integer|))
         (|y| S) ($ S))
        (SPROG
         ((#1=#:G473 NIL) (|j| NIL) (#2=#:G474 NIL) (#3=#:G475 NIL) (|l| NIL)
          (#4=#:G470 NIL) (|i| NIL) (#5=#:G471 NIL) (#6=#:G472 NIL) (|k| NIL)
          (|nc| #7=(|NonNegativeInteger|)) (|nr| #7#) (|ic| #8=(|Integer|))
          (|ir| #8#) (|uc| #9=(|Integer|)) (|lc| #10=(|Integer|)) (|ur| #9#)
          (|lr| #10#))
         (SEQ
          (LETT |lr| (SPADCALL |sr| (QREFELT $ 44))
                . #11=(|ARR2CAT-;setelt!;S2S2S;30|))
          (LETT |ur| (SPADCALL |sr| (QREFELT $ 45)) . #11#)
          (LETT |lc| (SPADCALL |sc| (QREFELT $ 44)) . #11#)
          (LETT |uc| (SPADCALL |sc| (QREFELT $ 45)) . #11#)
          (LETT |ir| (SPADCALL |sr| (QREFELT $ 43)) . #11#)
          (LETT |ic| (SPADCALL |sc| (QREFELT $ 43)) . #11#)
          (LETT |nr|
                (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #11#)
          (LETT |nc|
                (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #11#)
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 63))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 63)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (SEQ (LETT |k| |lr| . #11#) (LETT #6# |ur| . #11#)
               (LETT #5# |ir| . #11#)
               (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #11#)
               (LETT #4# (SPADCALL |y| (QREFELT $ 12)) . #11#) G190
               (COND
                ((OR (> |i| #4#)
                     (IF (MINUSP #5#)
                         (< |k| #6#)
                         (> |k| #6#)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| |lc| . #11#) (LETT #3# |uc| . #11#)
                      (LETT #2# |ic| . #11#)
                      (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #11#)
                      (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #11#) G190
                      (COND
                       ((OR (> |j| #1#)
                            (IF (MINUSP #2#)
                                (< |l| #3#)
                                (> |l| #3#)))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |x| |k| |l|
                                  (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                  (QREFELT $ 36))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#) . #11#))
                            . #11#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #5#) . #11#))
                     . #11#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SLS2S;31|
        ((|x| S) (|rowList| |List| (|Integer|)) (|sc| |Segment| (|Integer|))
         (|y| S) ($ S))
        (SPROG
         ((#1=#:G484 NIL) (|j| NIL) (#2=#:G485 NIL) (#3=#:G486 NIL) (|l| NIL)
          (#4=#:G482 NIL) (|i| NIL) (#5=#:G483 NIL) (|k| NIL)
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|ic| (|Integer|)) (|uc| (|Integer|)) (|lc| (|Integer|)))
         (SEQ
          (LETT |lc| (SPADCALL |sc| (QREFELT $ 44))
                . #6=(|ARR2CAT-;setelt!;SLS2S;31|))
          (LETT |uc| (SPADCALL |sc| (QREFELT $ 45)) . #6#)
          (LETT |ic| (SPADCALL |sc| (QREFELT $ 43)) . #6#)
          (LETT |nr| (LENGTH |rowList|) . #6#)
          (LETT |nc|
                (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #6#)
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 63))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 63)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (SEQ (LETT |k| NIL . #6#) (LETT #5# |rowList| . #6#)
               (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #6#)
               (LETT #4# (SPADCALL |y| (QREFELT $ 12)) . #6#) G190
               (COND
                ((OR (> |i| #4#) (ATOM #5#)
                     (PROGN (LETT |k| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| |lc| . #6#) (LETT #3# |uc| . #6#)
                      (LETT #2# |ic| . #6#)
                      (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #6#)
                      (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #6#) G190
                      (COND
                       ((OR (> |j| #1#)
                            (IF (MINUSP #2#)
                                (< |l| #3#)
                                (> |l| #3#)))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |x| |k| |l|
                                  (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                  (QREFELT $ 36))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#) . #6#)) . #6#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SSL2S;32|
        ((|x| S) (|sr| |Segment| (|Integer|)) (|colList| |List| (|Integer|))
         (|y| S) ($ S))
        (SPROG
         ((#1=#:G496 NIL) (|j| NIL) (#2=#:G497 NIL) (|l| NIL) (#3=#:G493 NIL)
          (|i| NIL) (#4=#:G494 NIL) (#5=#:G495 NIL) (|k| NIL)
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|ir| (|Integer|)) (|ur| (|Integer|)) (|lr| (|Integer|)))
         (SEQ
          (LETT |lr| (SPADCALL |sr| (QREFELT $ 44))
                . #6=(|ARR2CAT-;setelt!;SSL2S;32|))
          (LETT |ur| (SPADCALL |sr| (QREFELT $ 45)) . #6#)
          (LETT |ir| (SPADCALL |sr| (QREFELT $ 43)) . #6#)
          (LETT |nr|
                (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #6#)
          (LETT |nc| (LENGTH |colList|) . #6#)
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 63))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 63)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (SEQ (LETT |k| |lr| . #6#) (LETT #5# |ur| . #6#)
               (LETT #4# |ir| . #6#)
               (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #6#)
               (LETT #3# (SPADCALL |y| (QREFELT $ 12)) . #6#) G190
               (COND
                ((OR (> |i| #3#)
                     (IF (MINUSP #4#)
                         (< |k| #5#)
                         (> |k| #5#)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| NIL . #6#) (LETT #2# |colList| . #6#)
                      (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #6#)
                      (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #6#) G190
                      (COND
                       ((OR (> |j| #1#) (ATOM #2#)
                            (PROGN (LETT |l| (CAR #2#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |x| |k| |l|
                                  (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                  (QREFELT $ 36))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT #2# (CDR #2#) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #4#) . #6#)) . #6#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SIL2S;33|
        ((|x| S) (|row| |Integer|) (|lsc| |List| (|Segment| (|Integer|)))
         (|y| S) ($ S))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G507 NIL) (#2=#:G508 NIL) (|l| NIL)
          (#3=#:G506 NIL) (|sc| NIL) (|i| (|Integer|))
          (|nc| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #4=(|ARR2CAT-;setelt!;SIL2S;33|))
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) 1 (QREFELT $ 63))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 63)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (EXIT
           (COND ((EQL |nc| 0) |y|)
                 ('T
                  (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #4#)
                       (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #4#)
                       (SEQ (LETT |sc| NIL . #4#) (LETT #3# |lsc| . #4#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |sc| (CAR #3#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ
                               (LETT |l| (SPADCALL |sc| (QREFELT $ 44)) . #4#)
                               (LETT #2# (SPADCALL |sc| (QREFELT $ 45)) . #4#)
                               (LETT #1# (SPADCALL |sc| (QREFELT $ 43)) . #4#)
                               G190
                               (COND
                                ((IF (MINUSP #1#)
                                     (< |l| #2#)
                                     (> |l| #2#))
                                 (GO G191)))
                               (SEQ
                                (SPADCALL |x| |row| |l|
                                          (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                          (QREFELT $ 36))
                                (EXIT (LETT |j| (+ |j| 1) . #4#)))
                               (LETT |l| (+ |l| #1#) . #4#) (GO G190) G191
                               (EXIT NIL))))
                            (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;setelt!;SLI2S;34|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|))) (|col| |Integer|)
         (|y| S) ($ S))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G518 NIL) (#2=#:G519 NIL) (|k| NIL)
          (#3=#:G517 NIL) (|sr| NIL) (|j| (|Integer|))
          (|nr| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #4=(|ARR2CAT-;setelt!;SLI2S;34|))
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 63))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) 1 (QREFELT $ 63)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (EXIT
           (COND ((EQL |nr| 0) |y|)
                 ('T
                  (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #4#)
                       (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #4#)
                       (SEQ (LETT |sr| NIL . #4#) (LETT #3# |lsr| . #4#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |sr| (CAR #3#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ
                               (LETT |k| (SPADCALL |sr| (QREFELT $ 44)) . #4#)
                               (LETT #2# (SPADCALL |sr| (QREFELT $ 45)) . #4#)
                               (LETT #1# (SPADCALL |sr| (QREFELT $ 43)) . #4#)
                               G190
                               (COND
                                ((IF (MINUSP #1#)
                                     (< |k| #2#)
                                     (> |k| #2#))
                                 (GO G191)))
                               (SEQ
                                (SPADCALL |x| |k| |col|
                                          (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                          (QREFELT $ 36))
                                (EXIT (LETT |i| (+ |i| 1) . #4#)))
                               (LETT |k| (+ |k| #1#) . #4#) (GO G190) G191
                               (EXIT NIL))))
                            (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;setelt!;SSL2S;35|
        ((|x| S) (|sr| |Segment| (|Integer|))
         (|lsc| |List| (|Segment| (|Integer|))) (|y| S) ($ S))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G531 NIL) (|i| NIL) (#2=#:G532 NIL)
          (#3=#:G533 NIL) (|k| NIL) (#4=#:G529 NIL) (#5=#:G530 NIL) (|l| NIL)
          (#6=#:G528 NIL) (|sc| NIL) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)) (|ir| (|Integer|)) (|ur| (|Integer|))
          (|lr| (|Integer|)))
         (SEQ
          (LETT |lr| (SPADCALL |sr| (QREFELT $ 44))
                . #7=(|ARR2CAT-;setelt!;SSL2S;35|))
          (LETT |ur| (SPADCALL |sr| (QREFELT $ 45)) . #7#)
          (LETT |ir| (SPADCALL |sr| (QREFELT $ 43)) . #7#)
          (LETT |nr|
                (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #7#)
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #7#)
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 63))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 63)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #7#)
          (SEQ (LETT |sc| NIL . #7#) (LETT #6# |lsc| . #7#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |sc| (CAR #6#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| (SPADCALL |sc| (QREFELT $ 44)) . #7#)
                      (LETT #5# (SPADCALL |sc| (QREFELT $ 45)) . #7#)
                      (LETT #4# (SPADCALL |sc| (QREFELT $ 43)) . #7#) G190
                      (COND
                       ((IF (MINUSP #4#)
                            (< |l| #5#)
                            (> |l| #5#))
                        (GO G191)))
                      (SEQ
                       (SEQ (LETT |k| |lr| . #7#) (LETT #3# |ur| . #7#)
                            (LETT #2# |ir| . #7#)
                            (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #7#)
                            (LETT #1# (SPADCALL |y| (QREFELT $ 12)) . #7#) G190
                            (COND
                             ((OR (> |i| #1#)
                                  (IF (MINUSP #2#)
                                      (< |k| #3#)
                                      (> |k| #3#)))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |x| |k| |l|
                                        (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                        (QREFELT $ 36))))
                            (LETT |i|
                                  (PROG1 (+ |i| 1)
                                    (LETT |k| (+ |k| #2#) . #7#))
                                  . #7#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT (LETT |j| (+ |j| 1) . #7#)))
                      (LETT |l| (+ |l| #4#) . #7#) (GO G190) G191 (EXIT NIL))))
               (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SLS2S;36|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|)))
         (|sc| |Segment| (|Integer|)) (|y| S) ($ S))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G545 NIL) (|j| NIL) (#2=#:G546 NIL)
          (#3=#:G547 NIL) (|l| NIL) (#4=#:G543 NIL) (#5=#:G544 NIL) (|k| NIL)
          (#6=#:G542 NIL) (|sr| NIL) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)) (|ic| (|Integer|)) (|uc| (|Integer|))
          (|lc| (|Integer|)))
         (SEQ
          (LETT |lc| (SPADCALL |sc| (QREFELT $ 44))
                . #7=(|ARR2CAT-;setelt!;SLS2S;36|))
          (LETT |uc| (SPADCALL |sc| (QREFELT $ 45)) . #7#)
          (LETT |ic| (SPADCALL |sc| (QREFELT $ 43)) . #7#)
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #7#)
          (LETT |nc|
                (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #7#)
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 63))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 63)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #7#)
          (SEQ (LETT |sr| NIL . #7#) (LETT #6# |lsr| . #7#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |sr| (CAR #6#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |k| (SPADCALL |sr| (QREFELT $ 44)) . #7#)
                      (LETT #5# (SPADCALL |sr| (QREFELT $ 45)) . #7#)
                      (LETT #4# (SPADCALL |sr| (QREFELT $ 43)) . #7#) G190
                      (COND
                       ((IF (MINUSP #4#)
                            (< |k| #5#)
                            (> |k| #5#))
                        (GO G191)))
                      (SEQ
                       (SEQ (LETT |l| |lc| . #7#) (LETT #3# |uc| . #7#)
                            (LETT #2# |ic| . #7#)
                            (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #7#)
                            (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #7#) G190
                            (COND
                             ((OR (> |j| #1#)
                                  (IF (MINUSP #2#)
                                      (< |l| #3#)
                                      (> |l| #3#)))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |x| |k| |l|
                                        (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                        (QREFELT $ 36))))
                            (LETT |j|
                                  (PROG1 (+ |j| 1)
                                    (LETT |l| (+ |l| #2#) . #7#))
                                  . #7#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT (LETT |i| (+ |i| 1) . #7#)))
                      (LETT |k| (+ |k| #4#) . #7#) (GO G190) G191 (EXIT NIL))))
               (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;S2L2S;37|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|)))
         (|lsc| |List| (|Segment| (|Integer|))) (|y| S) ($ S))
        (SPROG
         ((|i| (|Integer|)) (|j| (|Integer|)) (#1=#:G563 NIL) (#2=#:G564 NIL)
          (|l| NIL) (#3=#:G562 NIL) (|sc| NIL) (#4=#:G560 NIL) (#5=#:G561 NIL)
          (|k| NIL) (|ir| (|Integer|)) (|ur| (|Integer|)) (|lr| (|Integer|))
          (#6=#:G559 NIL) (|sr| NIL) (|nc| #7=(|NonNegativeInteger|))
          (|nr| #7#))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #8=(|ARR2CAT-;setelt!;S2L2S;37|))
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #8#)
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 63))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 63)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #8#)
          (SEQ (LETT |sr| NIL . #8#) (LETT #6# |lsr| . #8#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |sr| (CAR #6#) . #8#) NIL))
                 (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT $ 44)) . #8#)
                    (LETT |ur| (SPADCALL |sr| (QREFELT $ 45)) . #8#)
                    (LETT |ir| (SPADCALL |sr| (QREFELT $ 43)) . #8#)
                    (EXIT
                     (SEQ (LETT |k| |lr| . #8#) (LETT #5# |ur| . #8#)
                          (LETT #4# |ir| . #8#) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |k| #5#)
                                (> |k| #5#))
                            (GO G191)))
                          (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #8#)
                               (SEQ (LETT |sc| NIL . #8#)
                                    (LETT #3# |lsc| . #8#) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN
                                           (LETT |sc| (CAR #3#) . #8#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SEQ
                                       (LETT |l| (SPADCALL |sc| (QREFELT $ 44))
                                             . #8#)
                                       (LETT #2# (SPADCALL |sc| (QREFELT $ 45))
                                             . #8#)
                                       (LETT #1# (SPADCALL |sc| (QREFELT $ 43))
                                             . #8#)
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
                                        (EXIT (LETT |j| (+ |j| 1) . #8#)))
                                       (LETT |l| (+ |l| #1#) . #8#) (GO G190)
                                       G191 (EXIT NIL))))
                                    (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |i| (+ |i| 1) . #8#)))
                          (LETT |k| (+ |k| #4#) . #8#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setsubMatrix!;S2I2S;38|
        ((|x| S) (|i1| |Integer|) (|j1| |Integer|) (|y| S) ($ S))
        (SPROG
         ((#1=#:G575 NIL) (|j| NIL) (#2=#:G576 NIL) (|l| NIL) (#3=#:G573 NIL)
          (|i| NIL) (#4=#:G574 NIL) (|k| NIL) (|j2| #5=(|Integer|)) (|i2| #5#))
         (SEQ
          (LETT |i2| (- (+ |i1| (SPADCALL |y| (QREFELT $ 21))) 1)
                . #6=(|ARR2CAT-;setsubMatrix!;S2I2S;38|))
          (LETT |j2| (- (+ |j1| (SPADCALL |y| (QREFELT $ 22))) 1) . #6#)
          (COND
           ((OR (< |i1| (SPADCALL |x| (QREFELT $ 11)))
                (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 28)))
            (EXIT
             (|error|
              (SPADCALL "setsubMatrix!: inserted matrix too big, "
                        "use subMatrix to restrict it" (QREFELT $ 73))))))
          (COND
           ((OR (< |j1| (SPADCALL |x| (QREFELT $ 13)))
                (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 28)))
            (EXIT
             (|error|
              (SPADCALL "setsubMatrix!: inserted matrix too big, "
                        "use subMatrix to restrict it" (QREFELT $ 73))))))
          (SEQ (LETT |k| |i1| . #6#) (LETT #4# |i2| . #6#)
               (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #6#)
               (LETT #3# (SPADCALL |y| (QREFELT $ 12)) . #6#) G190
               (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| |j1| . #6#) (LETT #2# |j2| . #6#)
                      (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #6#)
                      (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #6#) G190
                      (COND ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |x| |k| |l|
                                  (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                  (QREFELT $ 36))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #6#)) . #6#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |x|)))) 

(SDEFUN |ARR2CAT-;swapRows!;S2IS;39|
        ((|x| S) (|i1| |Integer|) (|i2| |Integer|) ($ S))
        (SPROG ((|r| (R)) (#1=#:G586 NIL) (|j| NIL))
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
                                 . #2=(|ARR2CAT-;swapRows!;S2IS;39|))
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

(SDEFUN |ARR2CAT-;swapColumns!;S2IS;40|
        ((|x| S) (|j1| |Integer|) (|j2| |Integer|) ($ S))
        (SPROG ((|r| (R)) (#1=#:G596 NIL) (|i| NIL))
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
                                 . #2=(|ARR2CAT-;swapColumns!;S2IS;40|))
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

(SDEFUN |ARR2CAT-;transpose;2S;41| ((|x| S) ($ S))
        (SPROG
         ((#1=#:G602 NIL) (|j| NIL) (#2=#:G601 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |x| (QREFELT $ 22))
                          (SPADCALL |x| (QREFELT $ 21)) (QREFELT $ 35))
                . #3=(|ARR2CAT-;transpose;2S;41|))
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

(SDEFUN |ARR2CAT-;squareTop;2S;42| ((|x| S) ($ S))
        (SPROG
         ((#1=#:G609 NIL) (|j| NIL) (#2=#:G608 NIL) (|i| NIL) (|ans| (S))
          (|cols| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((< (SPADCALL |x| (QREFELT $ 21))
               (LETT |cols| (SPADCALL |x| (QREFELT $ 22))
                     . #3=(|ARR2CAT-;squareTop;2S;42|)))
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

(SDEFUN |ARR2CAT-;horizConcat;3S;43| ((|x| S) (|y| S) ($ S))
        (SPADCALL (LIST |x| |y|) (QREFELT $ 80))) 

(SDEFUN |ARR2CAT-;horizConcat;LS;44| ((|la| |List| S) ($ S))
        (SPROG
         ((|l| (|Integer|)) (#1=#:G624 NIL) (|j| NIL) (#2=#:G623 NIL) (|a| NIL)
          (#3=#:G622 NIL) (|i| NIL) (|ans| (S)) (|nc| (|NonNegativeInteger|))
          (#4=#:G621 NIL) (|nr| (|NonNegativeInteger|)) (|a1| (S)))
         (SEQ
          (COND ((NULL |la|) (|error| "horizConcat: empty list"))
                ('T
                 (SEQ
                  (LETT |a1| (|SPADfirst| |la|)
                        . #5=(|ARR2CAT-;horizConcat;LS;44|))
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
                                     (QREFELT $ 63))
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

(SDEFUN |ARR2CAT-;vertConcat;3S;45| ((|x| S) (|y| S) ($ S))
        (SPADCALL (LIST |x| |y|) (QREFELT $ 83))) 

(SDEFUN |ARR2CAT-;vertConcat;LS;46| ((|la| |List| S) ($ S))
        (SPROG
         ((|l| (|Integer|)) (#1=#:G638 NIL) (|j| NIL) (#2=#:G637 NIL) (|i| NIL)
          (#3=#:G636 NIL) (|a| NIL) (|ans| (S)) (|nr| (|NonNegativeInteger|))
          (#4=#:G635 NIL) (|nc| (|NonNegativeInteger|)) (|a1| (S)))
         (SEQ
          (COND ((NULL |la|) (|error| "vertConcat: empty list"))
                ('T
                 (SEQ
                  (LETT |a1| (|SPADfirst| |la|)
                        . #5=(|ARR2CAT-;vertConcat;LS;46|))
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
                                     (QREFELT $ 63))
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

(SDEFUN |ARR2CAT-;blockConcat;LS;47| ((LLA |List| (|List| S)) ($ S))
        (SPROG ((#1=#:G642 NIL) (LA NIL) (#2=#:G641 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|ARR2CAT-;blockConcat;LS;47|))
                  (SEQ (LETT LA NIL . #3#) (LETT #1# LLA . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT LA (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL LA (QREFELT $ 80)) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 83))))) 

(SDEFUN |ARR2CAT-;vertSplit;SPiL;48|
        ((A S) (|r| |PositiveInteger|) ($ |List| S))
        (SPROG
         ((#1=#:G651 NIL) (|i| NIL) (#2=#:G650 NIL) (|mac| (|Integer|))
          (|mic| (|Integer|)) (|mir| (|Integer|))
          (|dr| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (LETT |dr| (SPADCALL (SPADCALL A (QREFELT $ 21)) |r| (QREFELT $ 89))
                . #3=(|ARR2CAT-;vertSplit;SPiL;48|))
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
                                            |mic| |mac| (QREFELT $ 48))
                                  #2#)
                                 . #3#)))
                         (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |ARR2CAT-;vertSplit;SLL;49|
        ((A S) (|lr| |List| (|NonNegativeInteger|)) ($ |List| S))
        (SPROG
         ((#1=#:G669 NIL) (|i| NIL) (#2=#:G668 NIL) (|mac| (|Integer|))
          (|mic| (|Integer|)) (|mir| (|Integer|))
          (|l| (|List| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL (ELT $ 92) |lr| (QREFELT $ 95))
                      (SPADCALL A (QREFELT $ 21)) (QREFELT $ 63))
            (|error| "split does not result in proper partition"))
           ('T
            (SEQ
             (LETT |l| (CONS 1 (SPADCALL (ELT $ 92) |lr| 1 (QREFELT $ 97)))
                   . #3=(|ARR2CAT-;vertSplit;SLL;49|))
             (LETT |mir| (- (SPADCALL A (QREFELT $ 11)) 1) . #3#)
             (LETT |mic| (SPADCALL A (QREFELT $ 13)) . #3#)
             (LETT |mac| (SPADCALL A (QREFELT $ 14)) . #3#)
             (EXIT
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |i| 2 . #3#)
                    (LETT #1# (SPADCALL |l| (QREFELT $ 98)) . #3#) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (SPADCALL A
                                       (+ |mir|
                                          (SPADCALL |l| (- |i| 1)
                                                    (QREFELT $ 99)))
                                       (-
                                        (+ |mir|
                                           (SPADCALL |l| |i| (QREFELT $ 99)))
                                        1)
                                       |mic| |mac| (QREFELT $ 48))
                             #2#)
                            . #3#)))
                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |ARR2CAT-;horizSplit;SPiL;50|
        ((A S) (|c| |PositiveInteger|) ($ |List| S))
        (SPROG
         ((#1=#:G678 NIL) (|i| NIL) (#2=#:G677 NIL) (|mic| (|Integer|))
          (|mar| (|Integer|)) (|mir| (|Integer|))
          (|dc| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (LETT |dc| (SPADCALL (SPADCALL A (QREFELT $ 22)) |c| (QREFELT $ 89))
                . #3=(|ARR2CAT-;horizSplit;SPiL;50|))
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
                                            (QREFELT $ 48))
                                  #2#)
                                 . #3#)))
                         (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |ARR2CAT-;horizSplit;SLL;51|
        ((A S) (|lc| |List| (|NonNegativeInteger|)) ($ |List| S))
        (SPROG
         ((#1=#:G696 NIL) (|i| NIL) (#2=#:G695 NIL) (|mic| (|Integer|))
          (|mar| (|Integer|)) (|mir| (|Integer|))
          (|l| (|List| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL (ELT $ 92) |lc| (QREFELT $ 95))
                      (SPADCALL A (QREFELT $ 22)) (QREFELT $ 63))
            (|error| "split does not result in proper partition"))
           ('T
            (SEQ
             (LETT |l| (CONS 1 (SPADCALL (ELT $ 92) |lc| 1 (QREFELT $ 97)))
                   . #3=(|ARR2CAT-;horizSplit;SLL;51|))
             (LETT |mir| (SPADCALL A (QREFELT $ 11)) . #3#)
             (LETT |mar| (SPADCALL A (QREFELT $ 12)) . #3#)
             (LETT |mic| (- (SPADCALL A (QREFELT $ 13)) 1) . #3#)
             (EXIT
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |i| 2 . #3#)
                    (LETT #1# (SPADCALL |l| (QREFELT $ 98)) . #3#) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (SPADCALL A |mir| |mar|
                                       (+ |mic|
                                          (SPADCALL |l| (- |i| 1)
                                                    (QREFELT $ 99)))
                                       (-
                                        (+ |mic|
                                           (SPADCALL |l| |i| (QREFELT $ 99)))
                                        1)
                                       (QREFELT $ 48))
                             #2#)
                            . #3#)))
                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |ARR2CAT-;blockSplit;S2PiL;52|
        ((A S) (|nr| |PositiveInteger|) (|nc| |PositiveInteger|)
         ($ |List| (|List| S)))
        (SPROG ((#1=#:G700 NIL) (X NIL) (#2=#:G699 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|ARR2CAT-;blockSplit;S2PiL;52|))
                 (SEQ (LETT X NIL . #3#)
                      (LETT #1# (SPADCALL A |nr| (QREFELT $ 103)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL X |nc| (QREFELT $ 104)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |ARR2CAT-;blockSplit;S2LL;53|
        ((A S) (|lr| |List| (|NonNegativeInteger|))
         (|lc| |List| (|NonNegativeInteger|)) ($ |List| (|List| S)))
        (SPROG ((#1=#:G704 NIL) (X NIL) (#2=#:G703 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|ARR2CAT-;blockSplit;S2LL;53|))
                 (SEQ (LETT X NIL . #3#)
                      (LETT #1# (SPADCALL A |lr| (QREFELT $ 106)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL X |lc| (QREFELT $ 107)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |ARR2CAT-;copy;2S;54| ((|m| S) ($ S))
        (SPROG
         ((#1=#:G710 NIL) (|j| NIL) (#2=#:G709 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                          (SPADCALL |m| (QREFELT $ 22)) NIL (QREFELT $ 109))
                . #3=(|ARR2CAT-;copy;2S;54|))
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

(SDEFUN |ARR2CAT-;fill!;SRS;55| ((|m| S) (|r| R) ($ S))
        (SPROG ((#1=#:G716 NIL) (|j| NIL) (#2=#:G715 NIL) (|i| NIL))
               (SEQ
                (SEQ
                 (LETT |i| (SPADCALL |m| (QREFELT $ 11))
                       . #3=(|ARR2CAT-;fill!;SRS;55|))
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

(SDEFUN |ARR2CAT-;map;M2S;56| ((|f| |Mapping| R R) (|m| S) ($ S))
        (SPROG
         ((#1=#:G723 NIL) (|j| NIL) (#2=#:G722 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                          (SPADCALL |m| (QREFELT $ 22)) NIL (QREFELT $ 109))
                . #3=(|ARR2CAT-;map;M2S;56|))
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

(SDEFUN |ARR2CAT-;map!;M2S;57| ((|f| |Mapping| R R) (|m| S) ($ S))
        (SPROG ((#1=#:G729 NIL) (|j| NIL) (#2=#:G728 NIL) (|i| NIL))
               (SEQ
                (SEQ
                 (LETT |i| (SPADCALL |m| (QREFELT $ 11))
                       . #3=(|ARR2CAT-;map!;M2S;57|))
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

(SDEFUN |ARR2CAT-;map;M3S;58| ((|f| |Mapping| R R R) (|m| S) (|n| S) ($ S))
        (SPROG
         ((#1=#:G738 NIL) (|j| NIL) (#2=#:G737 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (COND
           ((OR
             (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                       (SPADCALL |n| (QREFELT $ 21)) (QREFELT $ 59))
             (SPADCALL (SPADCALL |m| (QREFELT $ 22))
                       (SPADCALL |n| (QREFELT $ 22)) (QREFELT $ 59)))
            (|error| "map: arguments must have same dimensions"))
           ('T
            (SEQ
             (LETT |ans|
                   (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                             (SPADCALL |m| (QREFELT $ 22)) NIL (QREFELT $ 109))
                   . #3=(|ARR2CAT-;map;M3S;58|))
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

(SDEFUN |ARR2CAT-;map;M2SRS;59|
        ((|f| |Mapping| R R R) (|m| S) (|n| S) (|r| R) ($ S))
        (SPROG
         ((#1=#:G744 NIL) (|j| NIL) (#2=#:G743 NIL) (|i| NIL) (|ans| (S))
          (|maxCol| #3=(|Integer|)) (|maxRow| #3#))
         (SEQ
          (LETT |maxRow|
                (MAX (SPADCALL |m| (QREFELT $ 12))
                     (SPADCALL |n| (QREFELT $ 12)))
                . #4=(|ARR2CAT-;map;M2SRS;59|))
          (LETT |maxCol|
                (MAX (SPADCALL |m| (QREFELT $ 14))
                     (SPADCALL |n| (QREFELT $ 14)))
                . #4#)
          (LETT |ans|
                (SPADCALL
                 (MAX (SPADCALL |m| (QREFELT $ 21))
                      (SPADCALL |n| (QREFELT $ 21)))
                 (MAX (SPADCALL |m| (QREFELT $ 22))
                      (SPADCALL |n| (QREFELT $ 22)))
                 NIL (QREFELT $ 109))
                . #4#)
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #4#)
               (LETT #2# |maxRow| . #4#) G190 (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #4#)
                      (LETT #1# |maxCol| . #4#) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL
                                   (SPADCALL |m| |i| |j| |r| (QREFELT $ 117))
                                   (SPADCALL |n| |i| |j| |r| (QREFELT $ 117))
                                   |f|)
                                  (QREFELT $ 36))))
                      (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;setRow!;SIRowS;60|
        ((|m| S) (|i| |Integer|) (|v| |Row|) ($ S))
        (SPROG ((#1=#:G750 NIL) (|j| NIL) (#2=#:G751 NIL) (|k| NIL))
               (SEQ
                (COND
                 ((OR (< |i| (SPADCALL |m| (QREFELT $ 11)))
                      (SPADCALL |i| (SPADCALL |m| (QREFELT $ 12))
                                (QREFELT $ 28)))
                  (|error| "setRow!: index out of range"))
                 ('T
                  (SEQ
                   (SEQ
                    (LETT |k| (SPADCALL |v| (QREFELT $ 119))
                          . #3=(|ARR2CAT-;setRow!;SIRowS;60|))
                    (LETT #2# (SPADCALL |v| (QREFELT $ 120)) . #3#)
                    (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                    (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                    (COND ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
                    (SEQ
                     (EXIT
                      (SPADCALL |m| |i| |j| (SPADCALL |v| |k| (QREFELT $ 121))
                                (QREFELT $ 36))))
                    (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #3#))
                          . #3#)
                    (GO G190) G191 (EXIT NIL))
                   (EXIT |m|))))))) 

(SDEFUN |ARR2CAT-;setColumn!;SIColS;61|
        ((|m| S) (|j| |Integer|) (|v| |Col|) ($ S))
        (SPROG ((#1=#:G757 NIL) (|i| NIL) (#2=#:G758 NIL) (|k| NIL))
               (SEQ
                (COND
                 ((OR (< |j| (SPADCALL |m| (QREFELT $ 13)))
                      (SPADCALL |j| (SPADCALL |m| (QREFELT $ 14))
                                (QREFELT $ 28)))
                  (|error| "setColumn!: index out of range"))
                 ('T
                  (SEQ
                   (SEQ
                    (LETT |k| (SPADCALL |v| (QREFELT $ 123))
                          . #3=(|ARR2CAT-;setColumn!;SIColS;61|))
                    (LETT #2# (SPADCALL |v| (QREFELT $ 124)) . #3#)
                    (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3#)
                    (LETT #1# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
                    (COND ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
                    (SEQ
                     (EXIT
                      (SPADCALL |m| |i| |j| (SPADCALL |v| |k| (QREFELT $ 125))
                                (QREFELT $ 36))))
                    (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#))
                          . #3#)
                    (GO G190) G191 (EXIT NIL))
                   (EXIT |m|))))))) 

(SDEFUN |ARR2CAT-;=;2SB;62| ((|m| S) (|n| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G767 NIL) (#2=#:G768 NIL) (#3=#:G770 NIL) (|j| NIL)
          (#4=#:G769 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |m| |n| (QREFELT $ 127)) 'T)
                 ((OR
                   (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                             (SPADCALL |n| (QREFELT $ 21)) (QREFELT $ 59))
                   (SPADCALL (SPADCALL |m| (QREFELT $ 22))
                             (SPADCALL |n| (QREFELT $ 22)) (QREFELT $ 59)))
                  NIL)
                 ('T
                  (SEQ
                   (SEQ
                    (LETT |i| (SPADCALL |m| (QREFELT $ 11))
                          . #5=(|ARR2CAT-;=;2SB;62|))
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
                                          (QREFELT $ 128)))
                               (PROGN
                                (LETT #1#
                                      (PROGN
                                       (LETT #2# NIL . #5#)
                                       (GO #6=#:G766))
                                      . #5#)
                                (GO #7=#:G762))))))
                           (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                           (EXIT NIL)))
                     #7# (EXIT #1#))
                    (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
                   (EXIT 'T)))))
          #6# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;member?;RSB;63| ((|r| R) (|m| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G776 NIL) (#2=#:G777 NIL) (#3=#:G779 NIL) (|j| NIL)
          (#4=#:G778 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |i| (SPADCALL |m| (QREFELT $ 11))
                   . #5=(|ARR2CAT-;member?;RSB;63|))
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
                                  (QREFELT $ 128))
                        (PROGN
                         (LETT #1# (PROGN (LETT #2# 'T . #5#) (GO #6=#:G775))
                               . #5#)
                         (GO #7=#:G772))))))
                    (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL)))
              #7# (EXIT #1#))
             (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #6# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;count;RSNni;64| ((|r| R) (|m| S) ($ |NonNegativeInteger|))
        (SPROG NIL
               (SPADCALL (CONS #'|ARR2CAT-;count;RSNni;64!0| (VECTOR $ |r|))
                         |m| (QREFELT $ 131)))) 

(SDEFUN |ARR2CAT-;count;RSNni;64!0| ((|x| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|ARR2CAT-;count;RSNni;64|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |r| (QREFELT $ 128)))))) 

(SDEFUN |ARR2CAT-;row;SIRow;65| ((|m| S) (|i| |Integer|) ($ |Row|))
        (SPROG
         ((#1=#:G787 NIL) (|j| NIL) (#2=#:G788 NIL) (|k| NIL) (|v| (|Row|)))
         (SEQ
          (COND
           ((OR (< |i| (SPADCALL |m| (QREFELT $ 11)))
                (SPADCALL |i| (SPADCALL |m| (QREFELT $ 12)) (QREFELT $ 28)))
            (|error| "row: index out of range"))
           ('T
            (SEQ
             (LETT |v|
                   (SPADCALL (SPADCALL |m| (QREFELT $ 22)) NIL (QREFELT $ 133))
                   . #3=(|ARR2CAT-;row;SIRow;65|))
             (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 119)) . #3#)
                  (LETT #2# (SPADCALL |v| (QREFELT $ 120)) . #3#)
                  (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                  (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                  (COND ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |v| |k| (SPADCALL |m| |i| |j| (QREFELT $ 15))
                              (QREFELT $ 134))))
                  (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT |v|))))))) 

(SDEFUN |ARR2CAT-;column;SICol;66| ((|m| S) (|j| |Integer|) ($ |Col|))
        (SPROG
         ((#1=#:G794 NIL) (|i| NIL) (#2=#:G795 NIL) (|k| NIL) (|v| (|Col|)))
         (SEQ
          (COND
           ((OR (< |j| (SPADCALL |m| (QREFELT $ 13)))
                (SPADCALL |j| (SPADCALL |m| (QREFELT $ 14)) (QREFELT $ 28)))
            (|error| "column: index out of range"))
           ('T
            (SEQ
             (LETT |v|
                   (SPADCALL (SPADCALL |m| (QREFELT $ 21)) NIL (QREFELT $ 136))
                   . #3=(|ARR2CAT-;column;SICol;66|))
             (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 123)) . #3#)
                  (LETT #2# (SPADCALL |v| (QREFELT $ 124)) . #3#)
                  (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3#)
                  (LETT #1# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
                  (COND ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |v| |k| (SPADCALL |m| |i| |j| (QREFELT $ 15))
                              (QREFELT $ 137))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT |v|))))))) 

(SDEFUN |ARR2CAT-;coerce;SOf;67| ((|m| S) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|List| (|OutputForm|)))) (#1=#:G803 NIL) (|j| NIL)
          (#2=#:G802 NIL) (#3=#:G801 NIL) (|i| NIL) (#4=#:G800 NIL))
         (SEQ
          (LETT |l|
                (PROGN
                 (LETT #4# NIL . #5=(|ARR2CAT-;coerce;SOf;67|))
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
                                           (QREFELT $ 140))
                                          #2#)
                                         . #5#)))
                                 (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                               #4#)
                              . #5#)))
                      (LETT |i| (+ |i| 1) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT (SPADCALL |l| (QREFELT $ 141)))))) 

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
    (LETT $ (GETREFV 143) . #1#)
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
       (QSETREFV $ 129 (CONS (|dispatchFunction| |ARR2CAT-;=;2SB;62|) $))
       (QSETREFV $ 130 (CONS (|dispatchFunction| |ARR2CAT-;member?;RSB;63|) $))
       (QSETREFV $ 132
                 (CONS (|dispatchFunction| |ARR2CAT-;count;RSNni;64|) $)))))
    (COND
     ((|HasCategory| |#3| '(|shallowlyMutable|))
      (QSETREFV $ 135 (CONS (|dispatchFunction| |ARR2CAT-;row;SIRow;65|) $))))
    (COND
     ((|HasCategory| |#4| '(|shallowlyMutable|))
      (QSETREFV $ 138
                (CONS (|dispatchFunction| |ARR2CAT-;column;SICol;66|) $))))
    (COND
     ((|HasCategory| |#2| '(|CoercibleTo| (|OutputForm|)))
      (QSETREFV $ 142 (CONS (|dispatchFunction| |ARR2CAT-;coerce;SOf;67|) $))))
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
              (|List| 10) |ARR2CAT-;elt;SILS;12| |ARR2CAT-;elt;SLIS;13|
              |ARR2CAT-;elt;S2LS;14| (|Segment| 10) (63 . |incr|) (68 . |low|)
              (73 . |high|) |ARR2CAT-;elt;SLSS;16| |ARR2CAT-;elt;SSLS;17|
              (78 . |subMatrix|) |ARR2CAT-;elt;S2SS;18| (|List| 42)
              |ARR2CAT-;elt;SILS;20| |ARR2CAT-;elt;SLIS;21|
              |ARR2CAT-;elt;SSLS;22| |ARR2CAT-;elt;SLSS;23|
              |ARR2CAT-;elt;S2LS;24| (87 . SEGMENT) |ARR2CAT-;rowSlice;SS;25|
              |ARR2CAT-;colSlice;SS;26| (93 . ~=) |ARR2CAT-;setelt!;SIL2S;27|
              |ARR2CAT-;setelt!;SLI2S;28| |ARR2CAT-;setelt!;S2L2S;29| (99 . ~=)
              |ARR2CAT-;setelt!;S2S2S;30| |ARR2CAT-;setelt!;SLS2S;31|
              |ARR2CAT-;setelt!;SSL2S;32| |ARR2CAT-;setelt!;SIL2S;33|
              |ARR2CAT-;setelt!;SLI2S;34| |ARR2CAT-;setelt!;SSL2S;35|
              |ARR2CAT-;setelt!;SLS2S;36| |ARR2CAT-;setelt!;S2L2S;37|
              (|String|) (105 . |elt|) |ARR2CAT-;setsubMatrix!;S2I2S;38|
              |ARR2CAT-;swapRows!;S2IS;39| |ARR2CAT-;swapColumns!;S2IS;40|
              |ARR2CAT-;transpose;2S;41| |ARR2CAT-;squareTop;2S;42| (|List| $)
              (111 . |horizConcat|) |ARR2CAT-;horizConcat;3S;43|
              |ARR2CAT-;horizConcat;LS;44| (116 . |vertConcat|)
              |ARR2CAT-;vertConcat;3S;45| |ARR2CAT-;vertConcat;LS;46|
              (|List| 79) |ARR2CAT-;blockConcat;LS;47| (|Union| $ '"failed")
              (121 . |exquo|) (|PositiveInteger|) |ARR2CAT-;vertSplit;SPiL;48|
              (127 . +) (|Mapping| 20 20 20) (|List| 20) (133 . |reduce|)
              (|ListFunctions2| 20 20) (139 . |scan|) (146 . |#|) (151 . |elt|)
              |ARR2CAT-;vertSplit;SLL;49| |ARR2CAT-;horizSplit;SPiL;50|
              |ARR2CAT-;horizSplit;SLL;51| (157 . |vertSplit|)
              (163 . |horizSplit|) |ARR2CAT-;blockSplit;S2PiL;52|
              (169 . |vertSplit|) (175 . |horizSplit|)
              |ARR2CAT-;blockSplit;S2LL;53| (181 . |new|) |ARR2CAT-;copy;2S;54|
              |ARR2CAT-;fill!;SRS;55| (|Mapping| 7 7) |ARR2CAT-;map;M2S;56|
              |ARR2CAT-;map!;M2S;57| (|Mapping| 7 7 7) |ARR2CAT-;map;M3S;58|
              (188 . |elt|) |ARR2CAT-;map;M2SRS;59| (196 . |minIndex|)
              (201 . |maxIndex|) (206 . |elt|) |ARR2CAT-;setRow!;SIRowS;60|
              (212 . |minIndex|) (217 . |maxIndex|) (222 . |elt|)
              |ARR2CAT-;setColumn!;SIColS;61| (228 . |eq?|) (234 . =) (240 . =)
              (246 . |member?|) (252 . |count|) (258 . |count|) (264 . |new|)
              (270 . |qsetelt!|) (277 . |row|) (283 . |new|) (289 . |qsetelt!|)
              (296 . |column|) (|OutputForm|) (302 . |coerce|) (307 . |matrix|)
              (312 . |coerce|))
           '#(|vertSplit| 317 |vertConcat| 329 |transpose| 340 |swapRows!| 345
              |swapColumns!| 352 |subMatrix| 359 |squareTop| 368 |size?| 373
              |setsubMatrix!| 379 |setelt!| 387 |setRow!| 475 |setColumn!| 482
              |rowSlice| 489 |row| 494 |parts| 500 |more?| 505 |member?| 511
              |map!| 517 |map| 523 |listOfLists| 544 |less?| 549 |horizSplit|
              555 |horizConcat| 567 |fill!| 578 |every?| 584 |elt| 590 |count|
              675 |copy| 687 |column| 692 |colSlice| 698 |coerce| 703
              |blockSplit| 708 |blockConcat| 722 |any?| 727 = 733 |#| 739)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 142
                                                 '(1 6 10 0 11 1 6 10 0 12 1 6
                                                   10 0 13 1 6 10 0 14 3 6 7 0
                                                   10 10 15 1 6 20 0 21 1 6 20
                                                   0 22 2 20 16 0 0 25 2 10 16
                                                   0 0 28 2 6 0 20 20 35 4 6 7
                                                   0 10 10 7 36 1 42 10 0 43 1
                                                   42 10 0 44 1 42 10 0 45 5 6
                                                   0 0 10 10 10 10 48 2 42 0 10
                                                   10 56 2 10 16 0 0 59 2 20 16
                                                   0 0 63 2 72 0 0 0 73 1 6 0
                                                   79 80 1 6 0 79 83 2 20 88 0
                                                   0 89 2 20 0 0 0 92 2 94 20
                                                   93 0 95 3 96 94 93 94 20 97
                                                   1 94 20 0 98 2 94 20 0 10 99
                                                   2 6 79 0 90 103 2 6 79 0 90
                                                   104 2 6 79 0 94 106 2 6 79 0
                                                   94 107 3 6 0 20 20 7 109 4 6
                                                   7 0 10 10 7 117 1 8 10 0 119
                                                   1 8 10 0 120 2 8 7 0 10 121
                                                   1 9 10 0 123 1 9 10 0 124 2
                                                   9 7 0 10 125 2 6 16 0 0 127
                                                   2 7 16 0 0 128 2 0 16 0 0
                                                   129 2 0 16 7 0 130 2 6 20 17
                                                   0 131 2 0 20 7 0 132 2 8 0
                                                   20 7 133 3 8 7 0 10 7 134 2
                                                   0 8 0 10 135 2 9 0 20 7 136
                                                   3 9 7 0 10 7 137 2 0 9 0 10
                                                   138 1 7 139 0 140 1 139 0 86
                                                   141 1 0 139 0 142 2 0 79 0
                                                   94 100 2 0 79 0 90 91 2 0 0
                                                   0 0 84 1 0 0 79 85 1 0 0 0
                                                   77 3 0 0 0 10 10 75 3 0 0 0
                                                   10 10 76 5 0 0 0 10 10 10 10
                                                   37 1 0 0 0 78 2 0 16 0 20 23
                                                   4 0 0 0 10 10 0 74 4 0 0 0
                                                   50 50 0 71 4 0 0 0 42 50 0
                                                   69 4 0 0 0 50 42 0 70 4 0 0
                                                   0 38 42 0 65 4 0 0 0 42 38 0
                                                   66 4 0 0 0 38 38 0 62 4 0 0
                                                   0 42 42 0 64 4 0 0 0 10 38 0
                                                   60 4 0 0 0 38 10 0 61 4 0 0
                                                   0 50 10 0 68 4 0 0 0 10 50 0
                                                   67 3 0 0 0 10 8 122 3 0 0 0
                                                   10 9 126 1 0 42 0 57 2 0 8 0
                                                   10 135 1 0 31 0 32 2 0 16 0
                                                   20 26 2 0 16 7 0 130 2 0 0
                                                   112 0 114 3 0 0 115 0 0 116
                                                   4 0 0 115 0 0 7 118 2 0 0
                                                   112 0 113 1 0 33 0 34 2 0 16
                                                   0 20 24 2 0 79 0 94 102 2 0
                                                   79 0 90 101 2 0 0 0 0 81 1 0
                                                   0 79 82 2 0 0 0 7 111 2 0 16
                                                   17 0 19 3 0 0 0 50 42 54 3 0
                                                   0 0 50 50 55 3 0 0 0 42 50
                                                   53 3 0 0 0 50 10 52 3 0 0 0
                                                   42 38 47 3 0 0 0 10 50 51 3
                                                   0 0 0 42 42 49 3 0 0 0 38 42
                                                   46 3 0 0 0 38 10 40 3 0 0 0
                                                   38 38 41 3 0 0 0 10 38 39 4
                                                   0 7 0 10 10 7 29 2 0 20 7 0
                                                   132 2 0 20 17 0 30 1 0 0 0
                                                   110 2 0 9 0 10 138 1 0 42 0
                                                   58 1 0 139 0 142 3 0 86 0 94
                                                   94 108 3 0 86 0 90 90 105 1
                                                   0 0 86 87 2 0 16 17 0 18 2 0
                                                   16 0 0 129 1 0 20 0 27)))))
           '|lookupComplete|)) 
