
(/VERSIONCHECK 2) 

(DEFUN |VECTCAT-;+;3S;1| (|u| |v| $)
  (PROG (|n|)
    (RETURN
     (COND
      ((SPADCALL (LETT |n| (SPADCALL |u| (QREFELT $ 9)) |VECTCAT-;+;3S;1|)
                 (SPADCALL |v| (QREFELT $ 9)) (QREFELT $ 11))
       (|error| "Vectors must be of the same length"))
      ('T (SPADCALL (ELT $ 12) |u| |v| (QREFELT $ 14))))))) 

(DEFUN |VECTCAT-;zero;NniS;2| (|n| $)
  (SPADCALL |n| (|spadConstant| $ 16) (QREFELT $ 17))) 

(DEFUN |VECTCAT-;-;2S;3| (|u| $) (SPADCALL (ELT $ 19) |u| (QREFELT $ 21))) 

(DEFUN |VECTCAT-;*;I2S;4| (|n| |u| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|VECTCAT-;*;I2S;4!0| (VECTOR $ |n|)) |u|
               (QREFELT $ 21))))) 

(DEFUN |VECTCAT-;*;I2S;4!0| (|x| $$)
  (PROG (|n| $)
    (LETT |n| (QREFELT $$ 1) . #1=(|VECTCAT-;*;I2S;4|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |n| |x| (QREFELT $ 24)))))) 

(DEFUN |VECTCAT-;-;3S;5| (|u| |v| $)
  (SPADCALL |u| (SPADCALL |v| (QREFELT $ 26)) (QREFELT $ 27))) 

(DEFUN |VECTCAT-;*;SRS;6| (|u| |r| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|VECTCAT-;*;SRS;6!0| (VECTOR $ |r|)) |u|
               (QREFELT $ 21))))) 

(DEFUN |VECTCAT-;*;SRS;6!0| (|x| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|VECTCAT-;*;SRS;6|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |r| (QREFELT $ 29)))))) 

(DEFUN |VECTCAT-;*;R2S;7| (|r| |u| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|VECTCAT-;*;R2S;7!0| (VECTOR $ |r|)) |u|
               (QREFELT $ 21))))) 

(DEFUN |VECTCAT-;*;R2S;7!0| (|x| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|VECTCAT-;*;R2S;7|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r| |x| (QREFELT $ 29)))))) 

(DEFUN |VECTCAT-;dot;2SR;8| (|u| |v| $)
  (PROG (#1=#:G152 #2=#:G151 #3=#:G153 #4=#:G156 |i|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |u| (QREFELT $ 9)) (SPADCALL |v| (QREFELT $ 9))
                  (QREFELT $ 11))
        (|error| "Vectors must be of the same length"))
       (#5='T
        (PROGN
         (LETT #1# NIL . #6=(|VECTCAT-;dot;2SR;8|))
         (SEQ (LETT |i| (SPADCALL |u| (QREFELT $ 32)) . #6#)
              (LETT #4# (SPADCALL |u| (QREFELT $ 33)) . #6#) G190
              (COND ((> |i| #4#) (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #3#
                       (SPADCALL (SPADCALL |u| |i| (QREFELT $ 34))
                                 (SPADCALL |v| |i| (QREFELT $ 34))
                                 (QREFELT $ 29))
                       . #6#)
                 (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 12)) . #6#))
                       ('T
                        (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
              (LETT |i| (+ |i| 1) . #6#) (GO G190) G191 (EXIT NIL))
         (COND (#1# #2#) (#5# (|spadConstant| $ 16)))))))))) 

(DEFUN |VECTCAT-;outerProduct;2SM;9| (|u| |v| $)
  (PROG (#1=#:G163 |i| #2=#:G162 #3=#:G161 |j| #4=#:G160)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #4# NIL . #5=(|VECTCAT-;outerProduct;2SM;9|))
        (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 32)) . #5#)
             (LETT #3# (SPADCALL |v| (QREFELT $ 33)) . #5#) G190
             (COND ((> |j| #3#) (GO G191)))
             (SEQ
              (EXIT
               (LETT #4#
                     (CONS
                      (PROGN
                       (LETT #2# NIL . #5#)
                       (SEQ (LETT |i| (SPADCALL |u| (QREFELT $ 32)) . #5#)
                            (LETT #1# (SPADCALL |u| (QREFELT $ 33)) . #5#) G190
                            (COND ((> |i| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL |u| |i| (QREFELT $ 34))
                                      (SPADCALL |v| |j| (QREFELT $ 34))
                                      (QREFELT $ 29))
                                     #2#)
                                    . #5#)))
                            (LETT |i| (+ |i| 1) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      #4#)
                     . #5#)))
             (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT (NREVERSE #4#))))
       (QREFELT $ 38)))))) 

(DEFUN |VECTCAT-;cross;3S;10| (|u| |v| $)
  (COND
   ((OR (SPADCALL (SPADCALL |u| (QREFELT $ 9)) 3 (QREFELT $ 11))
        (SPADCALL (SPADCALL |v| (QREFELT $ 9)) 3 (QREFELT $ 11)))
    (|error| "Vectors must be of length 3"))
   ('T
    (SPADCALL
     (LIST
      (SPADCALL
       (SPADCALL (SPADCALL |u| 2 (QREFELT $ 34))
                 (SPADCALL |v| 3 (QREFELT $ 34)) (QREFELT $ 29))
       (SPADCALL (SPADCALL |u| 3 (QREFELT $ 34))
                 (SPADCALL |v| 2 (QREFELT $ 34)) (QREFELT $ 29))
       (QREFELT $ 40))
      (SPADCALL
       (SPADCALL (SPADCALL |u| 3 (QREFELT $ 34))
                 (SPADCALL |v| 1 (QREFELT $ 34)) (QREFELT $ 29))
       (SPADCALL (SPADCALL |u| 1 (QREFELT $ 34))
                 (SPADCALL |v| 3 (QREFELT $ 34)) (QREFELT $ 29))
       (QREFELT $ 40))
      (SPADCALL
       (SPADCALL (SPADCALL |u| 1 (QREFELT $ 34))
                 (SPADCALL |v| 2 (QREFELT $ 34)) (QREFELT $ 29))
       (SPADCALL (SPADCALL |u| 2 (QREFELT $ 34))
                 (SPADCALL |v| 1 (QREFELT $ 34)) (QREFELT $ 29))
       (QREFELT $ 40)))
     (QREFELT $ 43))))) 

(DEFUN |VECTCAT-;length;SR;11| (|p| $)
  (SPADCALL (SPADCALL |p| |p| (QREFELT $ 45)) (QREFELT $ 46))) 

(DEFUN |VECTCAT-;magnitude;SR;12| (|p| $)
  (SPADCALL (SPADCALL |p| |p| (QREFELT $ 45)) (QREFELT $ 46))) 

(DEFUN |VectorCategory&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|VectorCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|VectorCategory&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 49) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|RadicalCategory|))
                                          (|HasCategory| |#2| '(|Ring|))
                                          (|HasCategory| |#2| '(|Monoid|))
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#2|
                                                         '(|AbelianMonoid|))
                                          (|HasCategory| |#2|
                                                         '(|AbelianSemiGroup|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 6)
        (QSETREFV $ 15 (CONS (|dispatchFunction| |VECTCAT-;+;3S;1|) $))))
      (COND
       ((|testBitVector| |pv$| 5)
        (QSETREFV $ 18 (CONS (|dispatchFunction| |VECTCAT-;zero;NniS;2|) $))))
      (COND
       ((|testBitVector| |pv$| 4)
        (PROGN
         (QSETREFV $ 22 (CONS (|dispatchFunction| |VECTCAT-;-;2S;3|) $))
         (QSETREFV $ 25 (CONS (|dispatchFunction| |VECTCAT-;*;I2S;4|) $))
         (QSETREFV $ 28 (CONS (|dispatchFunction| |VECTCAT-;-;3S;5|) $)))))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 30 (CONS (|dispatchFunction| |VECTCAT-;*;SRS;6|) $))
         (QSETREFV $ 31 (CONS (|dispatchFunction| |VECTCAT-;*;R2S;7|) $)))))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 35 (CONS (|dispatchFunction| |VECTCAT-;dot;2SR;8|) $))
         (QSETREFV $ 39
                   (CONS (|dispatchFunction| |VECTCAT-;outerProduct;2SM;9|) $))
         (QSETREFV $ 44
                   (CONS (|dispatchFunction| |VECTCAT-;cross;3S;10|) $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (COND
         ((|testBitVector| |pv$| 2)
          (PROGN
           (QSETREFV $ 47
                     (CONS (|dispatchFunction| |VECTCAT-;length;SR;11|) $))
           (QSETREFV $ 48
                     (CONS (|dispatchFunction| |VECTCAT-;magnitude;SR;12|)
                           $)))))))
      $)))) 

(MAKEPROP '|VectorCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |#|) (|Boolean|) (5 . ~=) (11 . +)
              (|Mapping| 7 7 7) (17 . |map|) (24 . +) (30 . |Zero|)
              (34 . |new|) (40 . |zero|) (45 . -) (|Mapping| 7 7) (50 . |map|)
              (56 . -) (|Integer|) (61 . *) (67 . *) (73 . -) (78 . +) (84 . -)
              (90 . *) (96 . *) (102 . *) (108 . |minIndex|) (113 . |maxIndex|)
              (118 . |qelt|) (124 . |dot|) (|List| 42) (|Matrix| 7)
              (130 . |matrix|) (135 . |outerProduct|) (141 . -) (147 . |One|)
              (|List| 7) (151 . |construct|) (156 . |cross|) (162 . |dot|)
              (168 . |sqrt|) (173 . |length|) (178 . |magnitude|))
           '#(|zero| 183 |outerProduct| 188 |magnitude| 194 |length| 199 |dot|
              204 |cross| 210 - 216 + 227 * 233)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 48
                                                 '(1 6 8 0 9 2 8 10 0 0 11 2 7
                                                   0 0 0 12 3 6 0 13 0 0 14 2 0
                                                   0 0 0 15 0 7 0 16 2 6 0 8 7
                                                   17 1 0 0 8 18 1 7 0 0 19 2 6
                                                   0 20 0 21 1 0 0 0 22 2 7 0
                                                   23 0 24 2 0 0 23 0 25 1 6 0
                                                   0 26 2 6 0 0 0 27 2 0 0 0 0
                                                   28 2 7 0 0 0 29 2 0 0 0 7 30
                                                   2 0 0 7 0 31 1 6 23 0 32 1 6
                                                   23 0 33 2 6 7 0 23 34 2 0 7
                                                   0 0 35 1 37 0 36 38 2 0 37 0
                                                   0 39 2 7 0 0 0 40 0 7 0 41 1
                                                   6 0 42 43 2 0 0 0 0 44 2 6 7
                                                   0 0 45 1 7 0 0 46 1 0 7 0 47
                                                   1 0 7 0 48 1 0 0 8 18 2 0 37
                                                   0 0 39 1 0 7 0 48 1 0 7 0 47
                                                   2 0 7 0 0 35 2 0 0 0 0 44 2
                                                   0 0 0 0 28 1 0 0 0 22 2 0 0
                                                   0 0 15 2 0 0 0 7 30 2 0 0 7
                                                   0 31 2 0 0 23 0 25)))))
           '|lookupComplete|)) 
