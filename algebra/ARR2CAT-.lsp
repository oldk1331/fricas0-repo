
(/VERSIONCHECK 2) 

(DEFUN |ARR2CAT-;any?;MSB;1| (|f| |m| $)
  (PROG (#1=#:G157 #2=#:G161 #3=#:G163 |j| #4=#:G162 |i|)
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
  (PROG (#1=#:G165 #2=#:G168 #3=#:G170 |j| #4=#:G169 |i|)
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
  (PROG (|num| #1=#:G187 |j| #2=#:G186 |i|)
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
  (PROG (|entryList| #1=#:G193 |j| #2=#:G192 |i|)
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

(DEFUN |ARR2CAT-;copy;2S;10| (|m| $)
  (PROG (#1=#:G199 |j| #2=#:G198 |i| |ans|)
    (RETURN
     (SEQ
      (LETT |ans|
            (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                      (SPADCALL |m| (QREFELT $ 22)) NIL (QREFELT $ 33))
            . #3=(|ARR2CAT-;copy;2S;10|))
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
                              (QREFELT $ 34))))
                  (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |ans|))))) 

(DEFUN |ARR2CAT-;fill!;SRS;11| (|m| |r| $)
  (PROG (#1=#:G205 |j| #2=#:G204 |i|)
    (RETURN
     (SEQ
      (SEQ
       (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3=(|ARR2CAT-;fill!;SRS;11|))
       (LETT #2# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
       (COND ((> |i| #2#) (GO G191)))
       (SEQ
        (EXIT
         (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
              (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
              (COND ((> |j| #1#) (GO G191)))
              (SEQ (EXIT (SPADCALL |m| |i| |j| |r| (QREFELT $ 34))))
              (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
       (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |m|))))) 

(DEFUN |ARR2CAT-;map;M2S;12| (|f| |m| $)
  (PROG (#1=#:G212 |j| #2=#:G211 |i| |ans|)
    (RETURN
     (SEQ
      (LETT |ans|
            (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                      (SPADCALL |m| (QREFELT $ 22)) NIL (QREFELT $ 33))
            . #3=(|ARR2CAT-;map;M2S;12|))
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
                              (QREFELT $ 34))))
                  (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |ans|))))) 

(DEFUN |ARR2CAT-;map!;M2S;13| (|f| |m| $)
  (PROG (#1=#:G218 |j| #2=#:G217 |i|)
    (RETURN
     (SEQ
      (SEQ
       (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3=(|ARR2CAT-;map!;M2S;13|))
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
                          (QREFELT $ 34))))
              (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
       (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |m|))))) 

(DEFUN |ARR2CAT-;map;M3S;14| (|f| |m| |n| $)
  (PROG (#1=#:G227 |j| #2=#:G226 |i| |ans|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (SPADCALL (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |n| (QREFELT $ 21))
                   (QREFELT $ 40))
         (SPADCALL (SPADCALL |m| (QREFELT $ 22)) (SPADCALL |n| (QREFELT $ 22))
                   (QREFELT $ 40)))
        (|error| "map: arguments must have same dimensions"))
       ('T
        (SEQ
         (LETT |ans|
               (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                         (SPADCALL |m| (QREFELT $ 22)) NIL (QREFELT $ 33))
               . #3=(|ARR2CAT-;map;M3S;14|))
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
                                 (QREFELT $ 34))))
                     (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
              (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
         (EXIT |ans|)))))))) 

(DEFUN |ARR2CAT-;map;M2SRS;15| (|f| |m| |n| |r| $)
  (PROG (|j| |i| |ans| |maxCol| |maxRow|)
    (RETURN
     (SEQ
      (LETT |maxRow|
            (MAX (SPADCALL |m| (QREFELT $ 12)) (SPADCALL |n| (QREFELT $ 12)))
            . #1=(|ARR2CAT-;map;M2SRS;15|))
      (LETT |maxCol|
            (MAX (SPADCALL |m| (QREFELT $ 14)) (SPADCALL |n| (QREFELT $ 14)))
            . #1#)
      (LETT |ans|
            (SPADCALL
             (MAX (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |n| (QREFELT $ 21)))
             (MAX (SPADCALL |m| (QREFELT $ 22)) (SPADCALL |n| (QREFELT $ 22)))
             NIL (QREFELT $ 33))
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
                               (SPADCALL |m| |i| |j| |r| (QREFELT $ 43))
                               (SPADCALL |n| |i| |j| |r| (QREFELT $ 43)) |f|)
                              (QREFELT $ 34))))
                  (LETT |j| (+ |j| 1) . #1#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (+ |i| 1) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |ans|))))) 

(DEFUN |ARR2CAT-;setRow!;SIRowS;16| (|m| |i| |v| $)
  (PROG (#1=#:G237 |j| #2=#:G238 |k|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |i| (SPADCALL |m| (QREFELT $ 11)))
            (SPADCALL |i| (SPADCALL |m| (QREFELT $ 12)) (QREFELT $ 28)))
        (|error| "setRow!: index out of range"))
       ('T
        (SEQ
         (SEQ
          (LETT |k| (SPADCALL |v| (QREFELT $ 45))
                . #3=(|ARR2CAT-;setRow!;SIRowS;16|))
          (LETT #2# (SPADCALL |v| (QREFELT $ 46)) . #3#)
          (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
          (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
          (COND ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
          (SEQ
           (EXIT
            (SPADCALL |m| |i| |j| (SPADCALL |v| |k| (QREFELT $ 47))
                      (QREFELT $ 34))))
          (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
          (GO G190) G191 (EXIT NIL))
         (EXIT |m|)))))))) 

(DEFUN |ARR2CAT-;setColumn!;SIColS;17| (|m| |j| |v| $)
  (PROG (#1=#:G244 |i| #2=#:G245 |k|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |j| (SPADCALL |m| (QREFELT $ 13)))
            (SPADCALL |j| (SPADCALL |m| (QREFELT $ 14)) (QREFELT $ 28)))
        (|error| "setColumn!: index out of range"))
       ('T
        (SEQ
         (SEQ
          (LETT |k| (SPADCALL |v| (QREFELT $ 49))
                . #3=(|ARR2CAT-;setColumn!;SIColS;17|))
          (LETT #2# (SPADCALL |v| (QREFELT $ 50)) . #3#)
          (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3#)
          (LETT #1# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
          (COND ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
          (SEQ
           (EXIT
            (SPADCALL |m| |i| |j| (SPADCALL |v| |k| (QREFELT $ 51))
                      (QREFELT $ 34))))
          (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
          (GO G190) G191 (EXIT NIL))
         (EXIT |m|)))))))) 

(DEFUN |ARR2CAT-;=;2SB;18| (|m| |n| $)
  (PROG (#1=#:G249 #2=#:G253 #3=#:G255 |j| #4=#:G254 |i|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |m| |n| (QREFELT $ 53)) 'T)
             ((OR
               (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                         (SPADCALL |n| (QREFELT $ 21)) (QREFELT $ 40))
               (SPADCALL (SPADCALL |m| (QREFELT $ 22))
                         (SPADCALL |n| (QREFELT $ 22)) (QREFELT $ 40)))
              'NIL)
             ('T
              (SEQ
               (SEQ
                (LETT |i| (SPADCALL |m| (QREFELT $ 11))
                      . #5=(|ARR2CAT-;=;2SB;18|))
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
                                      (QREFELT $ 54)))
                           (PROGN
                            (LETT #1# (PROGN (LETT #2# 'NIL . #5#) (GO #2#))
                                  . #5#)
                            (GO #1#))))))
                       (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL)))
                 #1# (EXIT #1#))
                (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
               (EXIT 'T)))))
      #2# (EXIT #2#))))) 

(DEFUN |ARR2CAT-;member?;RSB;19| (|r| |m| $)
  (PROG (#1=#:G257 #2=#:G260 #3=#:G262 |j| #4=#:G261 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |i| (SPADCALL |m| (QREFELT $ 11))
               . #5=(|ARR2CAT-;member?;RSB;19|))
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
                              (QREFELT $ 54))
                    (PROGN
                     (LETT #1# (PROGN (LETT #2# 'T . #5#) (GO #2#)) . #5#)
                     (GO #1#))))))
                (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL)))
          #1# (EXIT #1#))
         (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |ARR2CAT-;count;RSNni;20| (|r| |m| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|ARR2CAT-;count;RSNni;20!0| (VECTOR $ |r|)) |m|
               (QREFELT $ 57))))) 

(DEFUN |ARR2CAT-;count;RSNni;20!0| (|x| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|ARR2CAT-;count;RSNni;20|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |r| (QREFELT $ 54)))))) 

(DEFUN |ARR2CAT-;row;SIRow;21| (|m| |i| $)
  (PROG (#1=#:G270 |j| #2=#:G271 |k| |v|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |i| (SPADCALL |m| (QREFELT $ 11)))
            (SPADCALL |i| (SPADCALL |m| (QREFELT $ 12)) (QREFELT $ 28)))
        (|error| "row: index out of range"))
       ('T
        (SEQ
         (LETT |v| (SPADCALL (SPADCALL |m| (QREFELT $ 22)) NIL (QREFELT $ 59))
               . #3=(|ARR2CAT-;row;SIRow;21|))
         (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 45)) . #3#)
              (LETT #2# (SPADCALL |v| (QREFELT $ 46)) . #3#)
              (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
              (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
              (COND ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
              (SEQ
               (EXIT
                (SPADCALL |v| |k| (SPADCALL |m| |i| |j| (QREFELT $ 15))
                          (QREFELT $ 60))))
              (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
              (GO G190) G191 (EXIT NIL))
         (EXIT |v|)))))))) 

(DEFUN |ARR2CAT-;column;SICol;22| (|m| |j| $)
  (PROG (#1=#:G277 |i| #2=#:G278 |k| |v|)
    (RETURN
     (SEQ
      (COND
       ((OR (< |j| (SPADCALL |m| (QREFELT $ 13)))
            (SPADCALL |j| (SPADCALL |m| (QREFELT $ 14)) (QREFELT $ 28)))
        (|error| "column: index out of range"))
       ('T
        (SEQ
         (LETT |v| (SPADCALL (SPADCALL |m| (QREFELT $ 21)) NIL (QREFELT $ 62))
               . #3=(|ARR2CAT-;column;SICol;22|))
         (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 49)) . #3#)
              (LETT #2# (SPADCALL |v| (QREFELT $ 50)) . #3#)
              (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3#)
              (LETT #1# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
              (COND ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
              (SEQ
               (EXIT
                (SPADCALL |v| |k| (SPADCALL |m| |i| |j| (QREFELT $ 15))
                          (QREFELT $ 63))))
              (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
              (GO G190) G191 (EXIT NIL))
         (EXIT |v|)))))))) 

(DEFUN |ARR2CAT-;coerce;SOf;23| (|m| $)
  (PROG (|l| #1=#:G286 |j| #2=#:G285 #3=#:G284 |i| #4=#:G283)
    (RETURN
     (SEQ
      (LETT |l|
            (PROGN
             (LETT #4# NIL . #5=(|ARR2CAT-;coerce;SOf;23|))
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
                                           (QREFELT $ 66))
                                          #2#)
                                         . #5#)))
                                 (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           #4#)
                          . #5#)))
                  (LETT |i| (+ |i| 1) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (EXIT (SPADCALL |l| (QREFELT $ 68))))))) 

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
      (LETT $ (GETREFV 70) . #1#)
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
         (QSETREFV $ 55 (CONS (|dispatchFunction| |ARR2CAT-;=;2SB;18|) $))
         (QSETREFV $ 56
                   (CONS (|dispatchFunction| |ARR2CAT-;member?;RSB;19|) $))
         (QSETREFV $ 58
                   (CONS (|dispatchFunction| |ARR2CAT-;count;RSNni;20|) $)))))
      (COND
       ((|HasCategory| |#3| '(|shallowlyMutable|))
        (QSETREFV $ 61 (CONS (|dispatchFunction| |ARR2CAT-;row;SIRow;21|) $))))
      (COND
       ((|HasCategory| |#4| '(|shallowlyMutable|))
        (QSETREFV $ 64
                  (CONS (|dispatchFunction| |ARR2CAT-;column;SICol;22|) $))))
      (COND
       ((|HasCategory| |#2| '(|CoercibleTo| (|OutputForm|)))
        (QSETREFV $ 69
                  (CONS (|dispatchFunction| |ARR2CAT-;coerce;SOf;23|) $))))
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
              |ARR2CAT-;parts;SL;9| (49 . |new|) (56 . |qsetelt!|)
              |ARR2CAT-;copy;2S;10| |ARR2CAT-;fill!;SRS;11| (|Mapping| 7 7)
              |ARR2CAT-;map;M2S;12| |ARR2CAT-;map!;M2S;13| (64 . ~=)
              (|Mapping| 7 7 7) |ARR2CAT-;map;M3S;14| (70 . |elt|)
              |ARR2CAT-;map;M2SRS;15| (78 . |minIndex|) (83 . |maxIndex|)
              (88 . |elt|) |ARR2CAT-;setRow!;SIRowS;16| (94 . |minIndex|)
              (99 . |maxIndex|) (104 . |elt|) |ARR2CAT-;setColumn!;SIColS;17|
              (110 . |eq?|) (116 . =) (122 . =) (128 . |member?|)
              (134 . |count|) (140 . |count|) (146 . |new|) (152 . |qsetelt!|)
              (159 . |row|) (165 . |new|) (171 . |qsetelt!|) (178 . |column|)
              (|OutputForm|) (184 . |coerce|) (|List| (|List| $))
              (189 . |matrix|) (194 . |coerce|))
           '#(|size?| 199 |setRow!| 205 |setColumn!| 212 |row| 219 |parts| 225
              |more?| 230 |member?| 236 |map!| 242 |map| 248 |less?| 269
              |fill!| 275 |every?| 281 |elt| 287 |count| 295 |copy| 307
              |column| 312 |coerce| 318 |any?| 323 = 329 |#| 335)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 69
                                                 '(1 6 10 0 11 1 6 10 0 12 1 6
                                                   10 0 13 1 6 10 0 14 3 6 7 0
                                                   10 10 15 1 6 20 0 21 1 6 20
                                                   0 22 2 20 16 0 0 25 2 10 16
                                                   0 0 28 3 6 0 20 20 7 33 4 6
                                                   7 0 10 10 7 34 2 10 16 0 0
                                                   40 4 6 7 0 10 10 7 43 1 8 10
                                                   0 45 1 8 10 0 46 2 8 7 0 10
                                                   47 1 9 10 0 49 1 9 10 0 50 2
                                                   9 7 0 10 51 2 6 16 0 0 53 2
                                                   7 16 0 0 54 2 0 16 0 0 55 2
                                                   0 16 7 0 56 2 6 20 17 0 57 2
                                                   0 20 7 0 58 2 8 0 20 7 59 3
                                                   8 7 0 10 7 60 2 0 8 0 10 61
                                                   2 9 0 20 7 62 3 9 7 0 10 7
                                                   63 2 0 9 0 10 64 1 7 65 0 66
                                                   1 65 0 67 68 1 0 65 0 69 2 0
                                                   16 0 20 23 3 0 0 0 10 8 48 3
                                                   0 0 0 10 9 52 2 0 8 0 10 61
                                                   1 0 31 0 32 2 0 16 0 20 26 2
                                                   0 16 7 0 56 2 0 0 37 0 39 4
                                                   0 0 41 0 0 7 44 3 0 0 41 0 0
                                                   42 2 0 0 37 0 38 2 0 16 0 20
                                                   24 2 0 0 0 7 36 2 0 16 17 0
                                                   19 4 0 7 0 10 10 7 29 2 0 20
                                                   7 0 58 2 0 20 17 0 30 1 0 0
                                                   0 35 2 0 9 0 10 64 1 0 65 0
                                                   69 2 0 16 17 0 18 2 0 16 0 0
                                                   55 1 0 20 0 27)))))
           '|lookupComplete|)) 
