
(/VERSIONCHECK 2) 

(DEFUN |TRANFUN-;pi;S;1| ($)
  (SPADCALL 2 (SPADCALL (|spadConstant| $ 7) (QREFELT $ 8)) (QREFELT $ 10))) 

(DEFUN |TRANFUN-;acsch;2S;2| (|x| $)
  (PROG (|a|)
    (RETURN
     (SEQ (LETT |a| (SPADCALL |x| (QREFELT $ 13)) |TRANFUN-;acsch;2S;2|)
          (EXIT
           (COND ((QEQCAR |a| 1) (|error| "acsch: no reciprocal"))
                 ('T (SPADCALL (QCDR |a|) (QREFELT $ 14))))))))) 

(DEFUN |TRANFUN-;asech;2S;3| (|x| $)
  (PROG (|a|)
    (RETURN
     (SEQ (LETT |a| (SPADCALL |x| (QREFELT $ 13)) |TRANFUN-;asech;2S;3|)
          (EXIT
           (COND ((QEQCAR |a| 1) (|error| "asech: no reciprocal"))
                 ('T (SPADCALL (QCDR |a|) (QREFELT $ 16))))))))) 

(DEFUN |TRANFUN-;acoth;2S;4| (|x| $)
  (PROG (|a|)
    (RETURN
     (SEQ (LETT |a| (SPADCALL |x| (QREFELT $ 13)) |TRANFUN-;acoth;2S;4|)
          (EXIT
           (COND ((QEQCAR |a| 1) (|error| "acoth: no reciprocal"))
                 ('T (SPADCALL (QCDR |a|) (QREFELT $ 18))))))))) 

(DEFUN |TRANFUN-;asin;2S;5| (|x| $)
  (SPADCALL
   (SPADCALL |x|
             (SPADCALL
              (SPADCALL (|spadConstant| $ 7) (SPADCALL |x| 2 (QREFELT $ 20))
                        (QREFELT $ 21))
              (QREFELT $ 22))
             (QREFELT $ 23))
   (QREFELT $ 24))) 

(DEFUN |TRANFUN-;acos;2S;6| (|x| $)
  (SPADCALL
   (SPADCALL (SPADCALL (QREFELT $ 26)) (SPADCALL 2 (QREFELT $ 28))
             (QREFELT $ 23))
   (SPADCALL |x| (QREFELT $ 8)) (QREFELT $ 21))) 

(DEFUN |TRANFUN-;acot;2S;7| (|x| $)
  (SPADCALL
   (SPADCALL (SPADCALL (QREFELT $ 26)) (SPADCALL 2 (QREFELT $ 28))
             (QREFELT $ 23))
   (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 21))) 

(DEFUN |TRANFUN-;asinh;2S;8| (|x| $)
  (SPADCALL
   (SPADCALL |x|
             (SPADCALL
              (SPADCALL (SPADCALL |x| 2 (QREFELT $ 20)) (|spadConstant| $ 7)
                        (QREFELT $ 31))
              (QREFELT $ 22))
             (QREFELT $ 31))
   (QREFELT $ 32))) 

(DEFUN |TRANFUN-;acosh;2S;9| (|x| $)
  (SPADCALL 2
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 31))
                         (SPADCALL 2 (QREFELT $ 28)) (QREFELT $ 23))
               (QREFELT $ 22))
              (SPADCALL
               (SPADCALL (SPADCALL |x| (|spadConstant| $ 7) (QREFELT $ 21))
                         (SPADCALL 2 (QREFELT $ 28)) (QREFELT $ 23))
               (QREFELT $ 22))
              (QREFELT $ 31))
             (QREFELT $ 32))
            (QREFELT $ 10))) 

(DEFUN |TRANFUN-;atanh;2S;10| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL (|spadConstant| $ 7) |x| (QREFELT $ 31))
              (QREFELT $ 32))
    (SPADCALL (SPADCALL (|spadConstant| $ 7) |x| (QREFELT $ 21))
              (QREFELT $ 32))
    (QREFELT $ 21))
   (SPADCALL 2 (QREFELT $ 28)) (QREFELT $ 23))) 

(DECLAIM (NOTINLINE |TranscendentalFunctionCategory&;|)) 

(DEFUN |TranscendentalFunctionCategory&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|TranscendentalFunctionCategory&|))
      (LETT |dv$| (LIST '|TranscendentalFunctionCategory&| DV$1) . #1#)
      (LETT $ (GETREFV 36) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| '(|Ring|))
        (PROGN
         (QSETREFV $ 11 (CONS (|dispatchFunction| |TRANFUN-;pi;S;1|) $))
         (QSETREFV $ 15 (CONS (|dispatchFunction| |TRANFUN-;acsch;2S;2|) $))
         (QSETREFV $ 17 (CONS (|dispatchFunction| |TRANFUN-;asech;2S;3|) $))
         (QSETREFV $ 19 (CONS (|dispatchFunction| |TRANFUN-;acoth;2S;4|) $)))))
      (COND
       ((|HasCategory| |#1| '(|Field|))
        (COND
         ((|HasSignature| |#1|
                          (LIST '|sqrt|
                                (LIST (|devaluate| |#1|) (|devaluate| |#1|))))
          (PROGN
           (QSETREFV $ 25 (CONS (|dispatchFunction| |TRANFUN-;asin;2S;5|) $))
           (QSETREFV $ 29 (CONS (|dispatchFunction| |TRANFUN-;acos;2S;6|) $))
           (QSETREFV $ 30 (CONS (|dispatchFunction| |TRANFUN-;acot;2S;7|) $))
           (QSETREFV $ 33 (CONS (|dispatchFunction| |TRANFUN-;asinh;2S;8|) $))
           (QSETREFV $ 34 (CONS (|dispatchFunction| |TRANFUN-;acosh;2S;9|) $))
           (QSETREFV $ 35
                     (CONS (|dispatchFunction| |TRANFUN-;atanh;2S;10|) $)))))))
      $)))) 

(MAKEPROP '|TranscendentalFunctionCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |One|) (4 . |asin|)
              (|PositiveInteger|) (9 . *) (15 . |pi|) (|Union| $ '"failed")
              (19 . |recip|) (24 . |asinh|) (29 . |acsch|) (34 . |acosh|)
              (39 . |asech|) (44 . |atanh|) (49 . |acoth|) (54 . ^) (60 . -)
              (66 . |sqrt|) (71 . /) (77 . |atan|) (82 . |asin|) (87 . |pi|)
              (|Integer|) (91 . |coerce|) (96 . |acos|) (101 . |acot|)
              (106 . +) (112 . |log|) (117 . |asinh|) (122 . |acosh|)
              (127 . |atanh|))
           '#(|pi| 132 |atanh| 136 |asinh| 141 |asin| 146 |asech| 151 |acsch|
              156 |acoth| 161 |acot| 166 |acosh| 171 |acos| 176)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 35
                                                 '(0 6 0 7 1 6 0 0 8 2 6 0 9 0
                                                   10 0 0 0 11 1 6 12 0 13 1 6
                                                   0 0 14 1 0 0 0 15 1 6 0 0 16
                                                   1 0 0 0 17 1 6 0 0 18 1 0 0
                                                   0 19 2 6 0 0 9 20 2 6 0 0 0
                                                   21 1 6 0 0 22 2 6 0 0 0 23 1
                                                   6 0 0 24 1 0 0 0 25 0 6 0 26
                                                   1 6 0 27 28 1 0 0 0 29 1 0 0
                                                   0 30 2 6 0 0 0 31 1 6 0 0 32
                                                   1 0 0 0 33 1 0 0 0 34 1 0 0
                                                   0 35 0 0 0 11 1 0 0 0 35 1 0
                                                   0 0 33 1 0 0 0 25 1 0 0 0 17
                                                   1 0 0 0 15 1 0 0 0 19 1 0 0
                                                   0 30 1 0 0 0 34 1 0 0 0
                                                   29)))))
           '|lookupComplete|)) 
