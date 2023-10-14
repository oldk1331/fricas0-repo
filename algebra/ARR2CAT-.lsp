
(DEFUN |ARR2CAT-;any?;MSB;1| (|f| |m| $)
  (PROG (#1=#:G174 #2=#:G178 #3=#:G180 |j| #4=#:G179 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #5=(|ARR2CAT-;any?;MSB;1|))
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
                     (LETT #1# (PROGN (LETT #2# 'T . #5#) (GO #2#)) . #5#)
                     (GO #1#))))))
                (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL)))
          #1# (EXIT #1#))
         (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |ARR2CAT-;every?;MSB;2| (|f| |m| $)
  (PROG (#1=#:G182 #2=#:G185 #3=#:G187 |j| #4=#:G186 |i|)
    (RETURN
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
                   ((NULL (SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15)) |f|))
                    (PROGN
                     (LETT #1# (PROGN (LETT #2# 'NIL . #5#) (GO #2#)) . #5#)
                     (GO #1#))))))
                (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL)))
          #1# (EXIT #1#))
         (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ARR2CAT-;size?;SNniB;3| (|m| |n| $)
  (EQL (* (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |m| (QREFELT $ 22))) |n|)) 

(DEFUN |ARR2CAT-;less?;SNniB;4| (|m| |n| $)
  (< (* (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |m| (QREFELT $ 22))) |n|)) 

(DEFUN |ARR2CAT-;more?;SNniB;5| (|m| |n| $)
  (SPADCALL (* (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |m| (QREFELT $ 22))) |n|
            (QREFELT $ 25))) 

(DEFUN |ARR2CAT-;#;SNni;6| (|m| $)
  (* (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |m| (QREFELT $ 22)))) 

(DEFUN |ARR2CAT-;elt;S2I2R;7| (|m| |i| |j| |r| $)
  (COND
   ((OR (< |i| (SPADCALL |m| (QREFELT $ 11)))
        (SPADCALL |i| (SPADCALL |m| (QREFELT $ 12)) (QREFELT $ 28)))
    |r|)
   ((OR (< |j| (SPADCALL |m| (QREFELT $ 13)))
        (SPADCALL |j| (SPADCALL |m| (QREFELT $ 14)) (QREFELT $ 28)))
    |r|)
   ('T (SPADCALL |m| |i| |j| (QREFELT $ 15))))) 

(DEFUN |ARR2CAT-;count;MSNni;8| (|f| |m| $)
  (PROG (|num| #1=#:G204 |j| #2=#:G203 |i|)
    (RETURN
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
                         ((SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15)) |f|)
                          (LETT |num| (+ |num| 1) . #3#)))))
                      (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |num|))))) 

(DEFUN |ARR2CAT-;parts;SL;9| (|m| $)
  (PROG (|entryList| #1=#:G210 |j| #2=#:G209 |i|)
    (RETURN
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
                      (LETT |j| (+ |j| -1) . #3#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| -1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |entryList|))))) 

(DEFUN |ARR2CAT-;listOfLists;SL;10| (|x| $)
  (PROG (|ll| |l| #1=#:G217 |j| #2=#:G216 |i|)
    (RETURN
     (SEQ (LETT |ll| NIL . #3=(|ARR2CAT-;listOfLists;SL;10|))
          (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 12)) . #3#)
               (LETT #2# (SPADCALL |x| (QREFELT $ 11)) . #3#) G190
               (COND ((< |i| #2#) (GO G191)))
               (SEQ (LETT |l| NIL . #3#)
                    (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 14)) . #3#)
                         (LETT #1# (SPADCALL |x| (QREFELT $ 13)) . #3#) G190
                         (COND ((< |j| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |l|
                                 (CONS (SPADCALL |x| |i| |j| (QREFELT $ 15))
                                       |l|)
                                 . #3#)))
                         (LETT |j| (+ |j| -1) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |ll| (CONS |l| |ll|) . #3#)))
               (LETT |i| (+ |i| -1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ll|))))) 

(DEFUN |ARR2CAT-;subMatrix;S4IS;11| (|x| |i1| |i2| |j1| |j2| $)
  (PROG (#1=#:G229 |j| |l| #2=#:G228 |i| |k| |y| |cols| |rows|)
    (RETURN
     (SEQ
      (COND ((< (+ |i2| 1) |i1|) (|error| "subMatrix: bad row indices"))
            ((< (+ |j2| 1) |j1|) (|error| "subMatrix: bad column indices"))
            ('T
             (SEQ
              (LETT |rows| (+ (- |i2| |i1|) 1)
                    . #3=(|ARR2CAT-;subMatrix;S4IS;11|))
              (LETT |cols| (+ (- |j2| |j1|) 1) . #3#)
              (LETT |y| (SPADCALL |rows| |cols| (QREFELT $ 35)) . #3#)
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
              (SEQ (LETT |k| |i1| . #3#)
                   (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #3#)
                   (LETT #2# (SPADCALL |y| (QREFELT $ 12)) . #3#) G190
                   (COND ((OR (> |i| #2#) (> |k| |i2|)) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |l| |j1| . #3#)
                          (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #3#)
                          (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #3#) G190
                          (COND ((OR (> |j| #1#) (> |l| |j2|)) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |y| |i| |j|
                                      (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                      (QREFELT $ 36))))
                          (LETT |j|
                                (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #3#))
                                . #3#)
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |y|)))))))) 

(DEFUN |ARR2CAT-;elt;S2LS;12| (|x| |rowList| |colList| $)
  (PROG (#1=#:G244 |ej| #2=#:G245 |j| #3=#:G242 |ei| #4=#:G243 |i| |y|
         #5=#:G235 #6=#:G241 #7=#:G232 #8=#:G240)
    (RETURN
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
                  (GO #7#))))))
             (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL)))
       #7# (EXIT #7#))
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
                  (GO #5#))))))
             (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL)))
       #5# (EXIT #5#))
      (LETT |y| (SPADCALL (LENGTH |rowList|) (LENGTH |colList|) (QREFELT $ 35))
            . #9#)
      (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #9#)
           (LETT #4# (SPADCALL |y| (QREFELT $ 12)) . #9#) (LETT |ei| NIL . #9#)
           (LETT #3# |rowList| . #9#) G190
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
                  (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1) . #9#)) . #9#)
                  (GO G190) G191 (EXIT NIL))))
           (LETT #3# (PROG1 (CDR #3#) (LETT |i| (+ |i| 1) . #9#)) . #9#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |y|))))) 

(DEFUN |ARR2CAT-;check_seg| (|s| |lb| |ub| $)
  (PROG (|cc| |ii| |i2| |i1|)
    (RETURN
     (SEQ (LETT |ii| (SPADCALL |s| (QREFELT $ 41)) . #1=(|ARR2CAT-;check_seg|))
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
            (#2# (|error| "chec_seg: zero increment")))))))) 

(DEFUN |ARR2CAT-;elt;S2SS;14| (|x| |sr| |sc| $)
  (PROG (#1=#:G259 |j| |l| #2=#:G258 |i| |k| |y| |nc| |nr| |ic| |ir| |uc| |lc|
         |ur| |lr|)
    (RETURN
     (SEQ
      (LETT |lr| (SPADCALL |sr| (QREFELT $ 42)) . #3=(|ARR2CAT-;elt;S2SS;14|))
      (LETT |ur| (SPADCALL |sr| (QREFELT $ 43)) . #3#)
      (LETT |lc| (SPADCALL |sc| (QREFELT $ 42)) . #3#)
      (LETT |uc| (SPADCALL |sc| (QREFELT $ 43)) . #3#)
      (LETT |ir| (SPADCALL |sr| (QREFELT $ 41)) . #3#)
      (LETT |ic| (SPADCALL |sc| (QREFELT $ 41)) . #3#)
      (COND
       ((EQL |ir| 1)
        (COND
         ((EQL |ic| 1)
          (EXIT (SPADCALL |x| |lr| |ur| |lc| |uc| (QREFELT $ 44)))))))
      (LETT |nr|
            (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
             (SPADCALL |x| (QREFELT $ 12)) $)
            . #3#)
      (LETT |nc|
            (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
             (SPADCALL |x| (QREFELT $ 14)) $)
            . #3#)
      (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 35)) . #3#)
      (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
      (SEQ (LETT |k| |lr| . #3#) (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #3#)
           (LETT #2# (SPADCALL |y| (QREFELT $ 12)) . #3#) G190
           (COND
            ((OR (> |i| #2#)
                 (IF (MINUSP |ir|)
                     (< |k| |ur|)
                     (> |k| |ur|)))
             (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |l| |lc| . #3#)
                  (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #3#)
                  (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #3#) G190
                  (COND
                   ((OR (> |j| #1#)
                        (IF (MINUSP |ic|)
                            (< |l| |uc|)
                            (> |l| |uc|)))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |y| |i| |j| (SPADCALL |x| |k| |l| (QREFELT $ 15))
                              (QREFELT $ 36))))
                  (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| |ic|) . #3#))
                        . #3#)
                  (GO G190) G191 (EXIT NIL))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| |ir|) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |y|))))) 

(DEFUN |ARR2CAT-;check_segs| (|ls| |lb| |ub| $)
  (PROG (|res| #1=#:G263 |s|)
    (RETURN
     (SEQ (LETT |res| 0 . #2=(|ARR2CAT-;check_segs|))
          (SEQ (LETT |s| NIL . #2#) (LETT #1# |ls| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res| (+ |res| (|ARR2CAT-;check_seg| |s| |lb| |ub| $))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |ARR2CAT-;elt;S2LS;16| (|x| |lsr| |lsc| $)
  (PROG (|i| |j| #1=#:G275 #2=#:G276 |l| #3=#:G274 |sc| |k| |ir| |ur| |lr|
         #4=#:G273 |sr| |y| |nc| |nr|)
    (RETURN
     (SEQ
      (LETT |nr|
            (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
             (SPADCALL |x| (QREFELT $ 12)) $)
            . #5=(|ARR2CAT-;elt;S2LS;16|))
      (LETT |nc|
            (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
             (SPADCALL |x| (QREFELT $ 14)) $)
            . #5#)
      (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 35)) . #5#)
      (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
      (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #5#)
      (SEQ (LETT |sr| NIL . #5#) (LETT #4# |lsr| . #5#) G190
           (COND
            ((OR (ATOM #4#) (PROGN (LETT |sr| (CAR #4#) . #5#) NIL))
             (GO G191)))
           (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT $ 42)) . #5#)
                (LETT |ur| (SPADCALL |sr| (QREFELT $ 43)) . #5#)
                (LETT |ir| (SPADCALL |sr| (QREFELT $ 41)) . #5#)
                (EXIT
                 (SEQ (LETT |k| |lr| . #5#) G190
                      (COND
                       ((IF (MINUSP |ir|)
                            (< |k| |ur|)
                            (> |k| |ur|))
                        (GO G191)))
                      (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #5#)
                           (SEQ (LETT |sc| NIL . #5#) (LETT #3# |lsc| . #5#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |sc| (CAR #3#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ
                                   (LETT |l| (SPADCALL |sc| (QREFELT $ 42))
                                         . #5#)
                                   (LETT #2# (SPADCALL |sc| (QREFELT $ 43))
                                         . #5#)
                                   (LETT #1# (SPADCALL |sc| (QREFELT $ 41))
                                         . #5#)
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
                                    (EXIT (LETT |j| (+ |j| 1) . #5#)))
                                   (LETT |l| (+ |l| #1#) . #5#) (GO G190) G191
                                   (EXIT NIL))))
                                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (LETT |i| (+ |i| 1) . #5#)))
                      (LETT |k| (+ |k| |ir|) . #5#) (GO G190) G191
                      (EXIT NIL))))
           (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
      (EXIT |y|))))) 

(DEFUN |ARR2CAT-;setelt;S2L2S;17| (|x| |rowList| |colList| |y| $)
  (PROG (#1=#:G293 |ej| #2=#:G294 |j| #3=#:G291 |ei| #4=#:G292 |i| #5=#:G282
         #6=#:G290 #7=#:G279 #8=#:G289)
    (RETURN
     (SEQ
      (SEQ
       (EXIT
        (SEQ (LETT |ei| NIL . #9=(|ARR2CAT-;setelt;S2L2S;17|))
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
                  (LETT #7# (|error| "setelt: index out of range") . #9#)
                  (GO #7#))))))
             (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL)))
       #7# (EXIT #7#))
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
                  (LETT #5# (|error| "setelt: index out of range") . #9#)
                  (GO #5#))))))
             (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL)))
       #5# (EXIT #5#))
      (COND
       ((OR
         (SPADCALL (LENGTH |rowList|) (SPADCALL |y| (QREFELT $ 21))
                   (QREFELT $ 48))
         (SPADCALL (LENGTH |colList|) (SPADCALL |y| (QREFELT $ 22))
                   (QREFELT $ 48)))
        (EXIT (|error| "setelt: matrix has bad dimensions"))))
      (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #9#)
           (LETT #4# (SPADCALL |y| (QREFELT $ 12)) . #9#) (LETT |ei| NIL . #9#)
           (LETT #3# |rowList| . #9#) G190
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
                  (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1) . #9#)) . #9#)
                  (GO G190) G191 (EXIT NIL))))
           (LETT #3# (PROG1 (CDR #3#) (LETT |i| (+ |i| 1) . #9#)) . #9#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |y|))))) 

(DEFUN |ARR2CAT-;setelt;S2S2S;18| (|x| |sr| |sc| |y| $)
  (PROG (#1=#:G302 |j| |l| #2=#:G301 |i| |k| |nc| |nr| |ic| |ir| |uc| |lc| |ur|
         |lr|)
    (RETURN
     (SEQ
      (LETT |lr| (SPADCALL |sr| (QREFELT $ 42))
            . #3=(|ARR2CAT-;setelt;S2S2S;18|))
      (LETT |ur| (SPADCALL |sr| (QREFELT $ 43)) . #3#)
      (LETT |lc| (SPADCALL |sc| (QREFELT $ 42)) . #3#)
      (LETT |uc| (SPADCALL |sc| (QREFELT $ 43)) . #3#)
      (LETT |ir| (SPADCALL |sr| (QREFELT $ 41)) . #3#)
      (LETT |ic| (SPADCALL |sc| (QREFELT $ 41)) . #3#)
      (LETT |nr|
            (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
             (SPADCALL |x| (QREFELT $ 12)) $)
            . #3#)
      (LETT |nc|
            (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
             (SPADCALL |x| (QREFELT $ 14)) $)
            . #3#)
      (COND
       ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 50))
            (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 50)))
        (EXIT (|error| "setelt: matrix has bad dimensions"))))
      (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
      (SEQ (LETT |k| |lr| . #3#) (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #3#)
           (LETT #2# (SPADCALL |y| (QREFELT $ 12)) . #3#) G190
           (COND
            ((OR (> |i| #2#)
                 (IF (MINUSP |ir|)
                     (< |k| |ur|)
                     (> |k| |ur|)))
             (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |l| |lc| . #3#)
                  (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #3#)
                  (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #3#) G190
                  (COND
                   ((OR (> |j| #1#)
                        (IF (MINUSP |ic|)
                            (< |l| |uc|)
                            (> |l| |uc|)))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |x| |k| |l| (SPADCALL |y| |i| |j| (QREFELT $ 15))
                              (QREFELT $ 36))))
                  (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| |ic|) . #3#))
                        . #3#)
                  (GO G190) G191 (EXIT NIL))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| |ir|) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |y|))))) 

(DEFUN |ARR2CAT-;setelt;S2L2S;19| (|x| |lsr| |lsc| |y| $)
  (PROG (|i| |j| #1=#:G316 #2=#:G317 |l| #3=#:G315 |sc| |k| |ir| |ur| |lr|
         #4=#:G314 |sr| |nc| |nr|)
    (RETURN
     (SEQ
      (LETT |nr|
            (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
             (SPADCALL |x| (QREFELT $ 12)) $)
            . #5=(|ARR2CAT-;setelt;S2L2S;19|))
      (LETT |nc|
            (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
             (SPADCALL |x| (QREFELT $ 14)) $)
            . #5#)
      (COND
       ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 50))
            (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 50)))
        (EXIT (|error| "setelt: matrix has bad dimensions"))))
      (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
      (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #5#)
      (SEQ (LETT |sr| NIL . #5#) (LETT #4# |lsr| . #5#) G190
           (COND
            ((OR (ATOM #4#) (PROGN (LETT |sr| (CAR #4#) . #5#) NIL))
             (GO G191)))
           (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT $ 42)) . #5#)
                (LETT |ur| (SPADCALL |sr| (QREFELT $ 43)) . #5#)
                (LETT |ir| (SPADCALL |sr| (QREFELT $ 41)) . #5#)
                (EXIT
                 (SEQ (LETT |k| |lr| . #5#) G190
                      (COND
                       ((IF (MINUSP |ir|)
                            (< |k| |ur|)
                            (> |k| |ur|))
                        (GO G191)))
                      (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #5#)
                           (SEQ (LETT |sc| NIL . #5#) (LETT #3# |lsc| . #5#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |sc| (CAR #3#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ
                                   (LETT |l| (SPADCALL |sc| (QREFELT $ 42))
                                         . #5#)
                                   (LETT #2# (SPADCALL |sc| (QREFELT $ 43))
                                         . #5#)
                                   (LETT #1# (SPADCALL |sc| (QREFELT $ 41))
                                         . #5#)
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
                                    (EXIT (LETT |j| (+ |j| 1) . #5#)))
                                   (LETT |l| (+ |l| #1#) . #5#) (GO G190) G191
                                   (EXIT NIL))))
                                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (LETT |i| (+ |i| 1) . #5#)))
                      (LETT |k| (+ |k| |ir|) . #5#) (GO G190) G191
                      (EXIT NIL))))
           (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
      (EXIT |y|))))) 

(DEFUN |ARR2CAT-;setsubMatrix!;S2I2S;20| (|x| |i1| |j1| |y| $)
  (PROG (#1=#:G327 |j| |l| #2=#:G326 |i| |k| |j2| |i2|)
    (RETURN
     (SEQ
      (LETT |i2| (- (+ |i1| (SPADCALL |y| (QREFELT $ 21))) 1)
            . #3=(|ARR2CAT-;setsubMatrix!;S2I2S;20|))
      (LETT |j2| (- (+ |j1| (SPADCALL |y| (QREFELT $ 22))) 1) . #3#)
      (COND
       ((OR (< |i1| (SPADCALL |x| (QREFELT $ 11)))
            (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 28)))
        (EXIT
         (|error|
          ("setsubMatrix!: inserted matrix too big,"
           " use subMatrix to restrict it")))))
      (COND
       ((OR (< |j1| (SPADCALL |x| (QREFELT $ 13)))
            (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 28)))
        (EXIT
         (|error|
          ("setsubMatrix!: inserted matrix too big,"
           " use subMatrix to restrict it")))))
      (SEQ (LETT |k| |i1| . #3#) (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #3#)
           (LETT #2# (SPADCALL |y| (QREFELT $ 12)) . #3#) G190
           (COND ((OR (> |i| #2#) (> |k| |i2|)) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |l| |j1| . #3#)
                  (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #3#)
                  (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #3#) G190
                  (COND ((OR (> |j| #1#) (> |l| |j2|)) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |x| |k| |l| (SPADCALL |y| |i| |j| (QREFELT $ 15))
                              (QREFELT $ 36))))
                  (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #3#)) . #3#)
                  (GO G190) G191 (EXIT NIL))))
           (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |ARR2CAT-;swapRows!;S2IS;21| (|x| |i1| |i2| $)
  (PROG (|r| #1=#:G337 |j|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |i1| (SPADCALL |x| (QREFELT $ 11)))
            (OR (SPADCALL |i1| (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 28))
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
                 (SEQ (LETT |r| (SPADCALL |x| |i1| |j| (QREFELT $ 15)) . #2#)
                      (SPADCALL |x| |i1| |j|
                                (SPADCALL |x| |i2| |j| (QREFELT $ 15))
                                (QREFELT $ 36))
                      (EXIT (SPADCALL |x| |i2| |j| |r| (QREFELT $ 36))))
                 (LETT |j| (+ |j| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))))))))) 

(DEFUN |ARR2CAT-;swapColumns!;S2IS;22| (|x| |j1| |j2| $)
  (PROG (|r| #1=#:G347 |i|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |j1| (SPADCALL |x| (QREFELT $ 13)))
            (OR (SPADCALL |j1| (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 28))
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
                 (SEQ (LETT |r| (SPADCALL |x| |i| |j1| (QREFELT $ 15)) . #2#)
                      (SPADCALL |x| |i| |j1|
                                (SPADCALL |x| |i| |j2| (QREFELT $ 15))
                                (QREFELT $ 36))
                      (EXIT (SPADCALL |x| |i| |j2| |r| (QREFELT $ 36))))
                 (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))))))))) 

(DEFUN |ARR2CAT-;transpose;2S;23| (|x| $)
  (PROG (#1=#:G353 |j| #2=#:G352 |i| |ans|)
    (RETURN
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
      (EXIT |ans|))))) 

(DEFUN |ARR2CAT-;squareTop;2S;24| (|x| $)
  (PROG (#1=#:G360 |j| #2=#:G359 |i| |ans| |cols|)
    (RETURN
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
                         (LETT #1# (SPADCALL |x| (QREFELT $ 14)) . #3#) G190
                         (COND ((> |j| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |ans| |i| |j|
                                     (SPADCALL |x| |i| |j| (QREFELT $ 15))
                                     (QREFELT $ 36))))
                         (LETT |j| (+ |j| 1) . #3#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
             (EXIT |ans|)))))))) 

(DEFUN |ARR2CAT-;horizConcat;3S;25| (|x| |y| $)
  (SPADCALL (LIST |x| |y|) (QREFELT $ 59))) 

(DEFUN |ARR2CAT-;horizConcat;LS;26| (|la| $)
  (PROG (|l| #1=#:G375 |j| #2=#:G374 |a| #3=#:G373 |i| |ans| |nc| #4=#:G372
         |nr| |a1|)
    (RETURN
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
                         (SEQ (LETT |a| NIL . #5#) (LETT #2# |la| . #5#) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |a| (CAR #2#) . #5#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ
                                 (LETT |j| (SPADCALL |a| (QREFELT $ 13)) . #5#)
                                 (LETT #1# (SPADCALL |a| (QREFELT $ 14)) . #5#)
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
              (EXIT |ans|)))))))) 

(DEFUN |ARR2CAT-;vertConcat;3S;27| (|x| |y| $)
  (SPADCALL (LIST |x| |y|) (QREFELT $ 62))) 

(DEFUN |ARR2CAT-;vertConcat;LS;28| (|la| $)
  (PROG (|l| #1=#:G389 |j| #2=#:G388 |i| #3=#:G387 |a| |ans| |nr| #4=#:G386
         |nc| |a1|)
    (RETURN
     (SEQ
      (COND ((NULL |la|) (|error| "vertConcat: empty list"))
            ('T
             (SEQ
              (LETT |a1| (|SPADfirst| |la|) . #5=(|ARR2CAT-;vertConcat;LS;28|))
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
                          (LETT #2# (SPADCALL |a| (QREFELT $ 12)) . #5#) G190
                          (COND ((> |i| #2#) (GO G191)))
                          (SEQ
                           (SEQ (LETT |j| (SPADCALL |a| (QREFELT $ 13)) . #5#)
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
              (EXIT |ans|)))))))) 

(DEFUN |ARR2CAT-;blockConcat;LS;29| (LLA $)
  (PROG (#1=#:G393 LA #2=#:G392)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|ARR2CAT-;blockConcat;LS;29|))
        (SEQ (LETT LA NIL . #3#) (LETT #1# LLA . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT LA (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT (LETT #2# (CONS (SPADCALL LA (QREFELT $ 59)) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 62)))))) 

(DEFUN |ARR2CAT-;vertSplit;SPiL;30| (A |r| $)
  (PROG (#1=#:G402 |i| #2=#:G401 |mac| |mic| |mir| |dr|)
    (RETURN
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
                                        (- (+ |mir| (* (+ |i| 1) (QCDR |dr|)))
                                           1)
                                        |mic| |mac| (QREFELT $ 44))
                              #2#)
                             . #3#)))
                     (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))))))))))) 

(DEFUN |ARR2CAT-;vertSplit;SLL;31| (A |lr| $)
  (PROG (#1=#:G422 |i| #2=#:G421 |mac| |mic| |mir| |l|)
    (RETURN
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
                                      (SPADCALL |l| (- |i| 1) (QREFELT $ 77)))
                                   (-
                                    (+ |mir| (SPADCALL |l| |i| (QREFELT $ 77)))
                                    1)
                                   |mic| |mac| (QREFELT $ 44))
                         #2#)
                        . #3#)))
                (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                (EXIT (NREVERSE #2#)))))))))))) 

(DEFUN |ARR2CAT-;horizSplit;SPiL;32| (A |c| $)
  (PROG (#1=#:G431 |i| #2=#:G430 |mic| |mar| |mir| |dc|)
    (RETURN
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
                                        (- (+ |mic| (* (+ |i| 1) (QCDR |dc|)))
                                           1)
                                        (QREFELT $ 44))
                              #2#)
                             . #3#)))
                     (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))))))))))) 

(DEFUN |ARR2CAT-;horizSplit;SLL;33| (A |lc| $)
  (PROG (#1=#:G451 |i| #2=#:G450 |mic| |mar| |mir| |l|)
    (RETURN
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
                                      (SPADCALL |l| (- |i| 1) (QREFELT $ 77)))
                                   (-
                                    (+ |mic| (SPADCALL |l| |i| (QREFELT $ 77)))
                                    1)
                                   (QREFELT $ 44))
                         #2#)
                        . #3#)))
                (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                (EXIT (NREVERSE #2#)))))))))))) 

(DEFUN |ARR2CAT-;blockSplit;S2PiL;34| (A |nr| |nc| $)
  (PROG (#1=#:G455 X #2=#:G454)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|ARR2CAT-;blockSplit;S2PiL;34|))
       (SEQ (LETT X NIL . #3#)
            (LETT #1# (SPADCALL A |nr| (QREFELT $ 81)) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#) . #3#) NIL)) (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL X |nc| (QREFELT $ 82)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |ARR2CAT-;blockSplit;S2LL;35| (A |lr| |lc| $)
  (PROG (#1=#:G459 X #2=#:G458)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|ARR2CAT-;blockSplit;S2LL;35|))
       (SEQ (LETT X NIL . #3#)
            (LETT #1# (SPADCALL A |lr| (QREFELT $ 84)) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#) . #3#) NIL)) (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL X |lc| (QREFELT $ 85)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |ARR2CAT-;copy;2S;36| (|m| $)
  (PROG (#1=#:G465 |j| #2=#:G464 |i| |ans|)
    (RETURN
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
      (EXIT |ans|))))) 

(DEFUN |ARR2CAT-;fill!;SRS;37| (|m| |r| $)
  (PROG (#1=#:G471 |j| #2=#:G470 |i|)
    (RETURN
     (SEQ
      (SEQ
       (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3=(|ARR2CAT-;fill!;SRS;37|))
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
      (EXIT |m|))))) 

(DEFUN |ARR2CAT-;map;M2S;38| (|f| |m| $)
  (PROG (#1=#:G478 |j| #2=#:G477 |i| |ans|)
    (RETURN
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
                              (SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                        |f|)
                              (QREFELT $ 36))))
                  (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |ans|))))) 

(DEFUN |ARR2CAT-;map!;M2S;39| (|f| |m| $)
  (PROG (#1=#:G484 |j| #2=#:G483 |i|)
    (RETURN
     (SEQ
      (SEQ
       (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3=(|ARR2CAT-;map!;M2S;39|))
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
                          (SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15)) |f|)
                          (QREFELT $ 36))))
              (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
       (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |m|))))) 

(DEFUN |ARR2CAT-;map;M3S;40| (|f| |m| |n| $)
  (PROG (#1=#:G493 |j| #2=#:G492 |i| |ans|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (SPADCALL (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |n| (QREFELT $ 21))
                   (QREFELT $ 48))
         (SPADCALL (SPADCALL |m| (QREFELT $ 22)) (SPADCALL |n| (QREFELT $ 22))
                   (QREFELT $ 48)))
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
                                  (SPADCALL |n| |i| |j| (QREFELT $ 15)) |f|)
                                 (QREFELT $ 36))))
                     (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |ARR2CAT-;map;M2SRS;41| (|f| |m| |n| |r| $)
  (PROG (|j| |i| |ans| |maxCol| |maxRow|)
    (RETURN
     (SEQ
      (LETT |maxRow|
            (MAX (SPADCALL |m| (QREFELT $ 12)) (SPADCALL |n| (QREFELT $ 12)))
            . #1=(|ARR2CAT-;map;M2SRS;41|))
      (LETT |maxCol|
            (MAX (SPADCALL |m| (QREFELT $ 14)) (SPADCALL |n| (QREFELT $ 14)))
            . #1#)
      (LETT |ans|
            (SPADCALL
             (MAX (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |n| (QREFELT $ 21)))
             (MAX (SPADCALL |m| (QREFELT $ 22)) (SPADCALL |n| (QREFELT $ 22)))
             NIL (QREFELT $ 87))
            . #1#)
      (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #1#) G190
           (COND ((> |i| |maxRow|) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #1#) G190
                  (COND ((> |j| |maxCol|) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |ans| |i| |j|
                              (SPADCALL
                               (SPADCALL |m| |i| |j| |r| (QREFELT $ 95))
                               (SPADCALL |n| |i| |j| |r| (QREFELT $ 95)) |f|)
                              (QREFELT $ 36))))
                  (LETT |j| (+ |j| 1) . #1#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (+ |i| 1) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |ans|))))) 

(DEFUN |ARR2CAT-;setRow!;SIRowS;42| (|m| |i| |v| $)
  (PROG (#1=#:G503 |j| #2=#:G504 |k|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |i| (SPADCALL |m| (QREFELT $ 11)))
            (SPADCALL |i| (SPADCALL |m| (QREFELT $ 12)) (QREFELT $ 28)))
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
          (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
          (GO G190) G191 (EXIT NIL))
         (EXIT |m|)))))))) 

(DEFUN |ARR2CAT-;setColumn!;SIColS;43| (|m| |j| |v| $)
  (PROG (#1=#:G510 |i| #2=#:G511 |k|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |j| (SPADCALL |m| (QREFELT $ 13)))
            (SPADCALL |j| (SPADCALL |m| (QREFELT $ 14)) (QREFELT $ 28)))
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
          (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
          (GO G190) G191 (EXIT NIL))
         (EXIT |m|)))))))) 

(DEFUN |ARR2CAT-;=;2SB;44| (|m| |n| $)
  (PROG (#1=#:G515 #2=#:G519 #3=#:G521 |j| #4=#:G520 |i|)
    (RETURN
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
                            (LETT #1# (PROGN (LETT #2# 'NIL . #5#) (GO #2#))
                                  . #5#)
                            (GO #1#))))))
                       (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL)))
                 #1# (EXIT #1#))
                (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
               (EXIT 'T)))))
      #2# (EXIT #2#))))) 

(DEFUN |ARR2CAT-;member?;RSB;45| (|r| |m| $)
  (PROG (#1=#:G523 #2=#:G526 #3=#:G528 |j| #4=#:G527 |i|)
    (RETURN
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
                     (LETT #1# (PROGN (LETT #2# 'T . #5#) (GO #2#)) . #5#)
                     (GO #1#))))))
                (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL)))
          #1# (EXIT #1#))
         (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |ARR2CAT-;count;RSNni;46| (|r| |m| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|ARR2CAT-;count;RSNni;46!0| (VECTOR $ |r|)) |m|
               (QREFELT $ 109))))) 

(DEFUN |ARR2CAT-;count;RSNni;46!0| (|x| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|ARR2CAT-;count;RSNni;46|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |r| (QREFELT $ 106)))))) 

(DEFUN |ARR2CAT-;row;SIRow;47| (|m| |i| $)
  (PROG (#1=#:G536 |j| #2=#:G537 |k| |v|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |i| (SPADCALL |m| (QREFELT $ 11)))
            (SPADCALL |i| (SPADCALL |m| (QREFELT $ 12)) (QREFELT $ 28)))
        (|error| "row: index out of range"))
       ('T
        (SEQ
         (LETT |v| (SPADCALL (SPADCALL |m| (QREFELT $ 22)) NIL (QREFELT $ 111))
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
         (EXIT |v|)))))))) 

(DEFUN |ARR2CAT-;column;SICol;48| (|m| |j| $)
  (PROG (#1=#:G543 |i| #2=#:G544 |k| |v|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |j| (SPADCALL |m| (QREFELT $ 13)))
            (SPADCALL |j| (SPADCALL |m| (QREFELT $ 14)) (QREFELT $ 28)))
        (|error| "column: index out of range"))
       ('T
        (SEQ
         (LETT |v| (SPADCALL (SPADCALL |m| (QREFELT $ 21)) NIL (QREFELT $ 114))
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
         (EXIT |v|)))))))) 

(DEFUN |ARR2CAT-;coerce;SOf;49| (|m| $)
  (PROG (|l| #1=#:G552 |j| #2=#:G551 #3=#:G550 |i| #4=#:G549)
    (RETURN
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
                            (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #5#)
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
      (EXIT (SPADCALL |l| (QREFELT $ 119))))))) 

(DECLAIM (NOTINLINE |TwoDimensionalArrayCategory&;|)) 

(DEFUN |TwoDimensionalArrayCategory&| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
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
         (QSETREFV $ 108
                   (CONS (|dispatchFunction| |ARR2CAT-;member?;RSB;45|) $))
         (QSETREFV $ 110
                   (CONS (|dispatchFunction| |ARR2CAT-;count;RSNni;46|) $)))))
      (COND
       ((|HasCategory| |#3| '(|shallowlyMutable|))
        (QSETREFV $ 113
                  (CONS (|dispatchFunction| |ARR2CAT-;row;SIRow;47|) $))))
      (COND
       ((|HasCategory| |#4| '(|shallowlyMutable|))
        (QSETREFV $ 116
                  (CONS (|dispatchFunction| |ARR2CAT-;column;SICol;48|) $))))
      (COND
       ((|HasCategory| |#2| '(|CoercibleTo| (|OutputForm|)))
        (QSETREFV $ 120
                  (CONS (|dispatchFunction| |ARR2CAT-;coerce;SOf;49|) $))))
      $)))) 

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
              (87 . ~=) |ARR2CAT-;setelt;S2L2S;17| (93 . ~=)
              |ARR2CAT-;setelt;S2S2S;18| |ARR2CAT-;setelt;S2L2S;19|
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
              |setsubMatrix!| 362 |setelt| 370 |setRow!| 394 |setColumn!| 401
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
