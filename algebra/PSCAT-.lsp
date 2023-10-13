
(/VERSIONCHECK 2) 

(DEFUN |PSCAT-;*;I2S;1| (|n| |ps| $)
  (PROG ()
    (RETURN
     (COND ((ZEROP |n|) (|spadConstant| $ 10))
           ('T
            (SPADCALL (CONS #'|PSCAT-;*;I2S;1!0| (VECTOR $ |n|)) |ps|
                      (QREFELT $ 14))))))) 

(DEFUN |PSCAT-;*;I2S;1!0| (|r1| $$)
  (PROG (|n| $)
    (LETT |n| (QREFELT $$ 1) . #1=(|PSCAT-;*;I2S;1|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |n| |r1| (QREFELT $ 12)))))) 

(DEFUN |PSCAT-;*;Coef2S;2| (|r| |ps| $)
  (PROG ()
    (RETURN
     (COND ((SPADCALL |r| (QREFELT $ 17)) (|spadConstant| $ 10))
           ('T
            (SPADCALL (CONS #'|PSCAT-;*;Coef2S;2!0| (VECTOR $ |r|)) |ps|
                      (QREFELT $ 14))))))) 

(DEFUN |PSCAT-;*;Coef2S;2!0| (|r1| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|PSCAT-;*;Coef2S;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r| |r1| (QREFELT $ 18)))))) 

(DEFUN |PSCAT-;*;SCoefS;3| (|ps| |r| $)
  (PROG ()
    (RETURN
     (COND ((SPADCALL |r| (QREFELT $ 17)) (|spadConstant| $ 10))
           ('T
            (SPADCALL (CONS #'|PSCAT-;*;SCoefS;3!0| (VECTOR $ |r|)) |ps|
                      (QREFELT $ 14))))))) 

(DEFUN |PSCAT-;*;SCoefS;3!0| (|r1| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|PSCAT-;*;SCoefS;3|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |r| (QREFELT $ 18)))))) 

(DEFUN |PSCAT-;-;2S;4| (|ps| $) (SPADCALL (ELT $ 21) |ps| (QREFELT $ 14))) 

(DEFUN |PSCAT-;*;F2S;5| (|r| |ps| $)
  (PROG ()
    (RETURN
     (COND ((SPADCALL |r| (QREFELT $ 24)) (|spadConstant| $ 10))
           ('T
            (SPADCALL (CONS #'|PSCAT-;*;F2S;5!0| (VECTOR $ |r|)) |ps|
                      (QREFELT $ 14))))))) 

(DEFUN |PSCAT-;*;F2S;5!0| (|r1| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|PSCAT-;*;F2S;5|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r| |r1| (QREFELT $ 25)))))) 

(DEFUN |PSCAT-;*;SFS;6| (|ps| |r| $)
  (PROG ()
    (RETURN
     (COND ((SPADCALL |r| (QREFELT $ 24)) (|spadConstant| $ 10))
           ('T
            (SPADCALL (CONS #'|PSCAT-;*;SFS;6!0| (VECTOR $ |r|)) |ps|
                      (QREFELT $ 14))))))) 

(DEFUN |PSCAT-;*;SFS;6!0| (|r1| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|PSCAT-;*;SFS;6|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |r| (QREFELT $ 27)))))) 

(DEFUN |PSCAT-;/;SCoefS;7| (|ps| |r| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|PSCAT-;/;SCoefS;7!0| (VECTOR $ |r|)) |ps|
               (QREFELT $ 14))))) 

(DEFUN |PSCAT-;/;SCoefS;7!0| (|r1| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|PSCAT-;/;SCoefS;7|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r1| |r| (QREFELT $ 29)))))) 

(DEFUN |PowerSeriesCategory&| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PowerSeriesCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|PowerSeriesCategory&| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 33) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#2| '(|Algebra| (|Fraction| (|Integer|))))
        (PROGN
         (QSETREFV $ 26 (CONS (|dispatchFunction| |PSCAT-;*;F2S;5|) $))
         (QSETREFV $ 28 (CONS (|dispatchFunction| |PSCAT-;*;SFS;6|) $)))))
      (COND
       ((|HasCategory| |#2| '(|Field|))
        (QSETREFV $ 30 (CONS (|dispatchFunction| |PSCAT-;/;SCoefS;7|) $))))
      $)))) 

(MAKEPROP '|PowerSeriesCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |Zero|) (|Integer|) (4 . *)
              (|Mapping| 7 7) (10 . |map|) |PSCAT-;*;I2S;1| (|Boolean|)
              (16 . |zero?|) (21 . *) |PSCAT-;*;Coef2S;2| |PSCAT-;*;SCoefS;3|
              (27 . -) |PSCAT-;-;2S;4| (|Fraction| 11) (32 . |zero?|) (37 . *)
              (43 . *) (49 . *) (55 . *) (61 . /) (67 . /)
              (|NonNegativeInteger|) (|PositiveInteger|))
           '#(/ 73 - 79 * 84) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 30
                                                 '(0 6 0 10 2 7 0 11 0 12 2 6 0
                                                   13 0 14 1 7 16 0 17 2 7 0 0
                                                   0 18 1 7 0 0 21 1 23 16 0 24
                                                   2 7 0 23 0 25 2 0 0 23 0 26
                                                   2 7 0 0 23 27 2 0 0 0 23 28
                                                   2 7 0 0 0 29 2 0 0 0 7 30 2
                                                   0 0 0 7 30 1 0 0 0 22 2 0 0
                                                   0 23 28 2 0 0 11 0 15 2 0 0
                                                   23 0 26 2 0 0 7 0 19 2 0 0 0
                                                   7 20)))))
           '|lookupComplete|)) 
