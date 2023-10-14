
(/VERSIONCHECK 2) 

(DEFUN |FIELD-;unitNormal;SR;1| (|x| $)
  (COND
   ((SPADCALL |x| (QREFELT $ 8))
    (VECTOR (|spadConstant| $ 9) (|spadConstant| $ 10) (|spadConstant| $ 9)))
   ('T (VECTOR |x| (|spadConstant| $ 9) (SPADCALL |x| (QREFELT $ 11)))))) 

(DEFUN |FIELD-;unitCanonical;2S;2| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 8)) |x|) ('T (|spadConstant| $ 9)))) 

(DEFUN |FIELD-;associates?;2SB;3| (|x| |y| $)
  (COND ((SPADCALL |x| (QREFELT $ 8)) (SPADCALL |y| (QREFELT $ 8)))
        ((SPADCALL |y| (QREFELT $ 8)) 'NIL) ('T 'T))) 

(DEFUN |FIELD-;inv;2S;4| (|x| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 17)) |FIELD-;inv;2S;4|)
          (EXIT
           (COND ((QEQCAR |u| 1) (|error| "not invertible"))
                 ('T (QCDR |u|)))))))) 

(DEFUN |FIELD-;exquo;2SU;5| (|x| |y| $)
  (COND ((SPADCALL |y| (|spadConstant| $ 10) (QREFELT $ 19)) (CONS 1 "failed"))
        ('T (CONS 0 (SPADCALL |x| |y| (QREFELT $ 20)))))) 

(DEFUN |FIELD-;gcd;3S;6| (|x| |y| $) (|spadConstant| $ 9)) 

(PUT '|FIELD-;euclideanSize;SNni;7| '|SPADreplace| '(XLAM (|x|) 0)) 

(DEFUN |FIELD-;euclideanSize;SNni;7| (|x| $) 0) 

(PUT '|FIELD-;prime?;SB;8| '|SPADreplace| '(XLAM (|x|) 'NIL)) 

(DEFUN |FIELD-;prime?;SB;8| (|x| $) 'NIL) 

(DEFUN |FIELD-;squareFree;SF;9| (|x| $) (SPADCALL |x| (QREFELT $ 27))) 

(DEFUN |FIELD-;factor;SF;10| (|x| $) (SPADCALL |x| (QREFELT $ 27))) 

(DEFUN |FIELD-;/;3S;11| (|x| |y| $)
  (COND ((SPADCALL |y| (QREFELT $ 8)) (|error| "catdef: division by zero"))
        ('T (SPADCALL |x| (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 31))))) 

(DEFUN |FIELD-;divide;2SR;12| (|x| |y| $)
  (CONS (SPADCALL |x| |y| (QREFELT $ 20)) (|spadConstant| $ 10))) 

(DECLAIM (NOTINLINE |Field&;|)) 

(DEFUN |Field&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Field&|))
      (LETT |dv$| (LIST '|Field&| DV$1) . #1#)
      (LETT $ (GETREFV 36) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|Field&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (0 . |zero?|)
              (5 . |One|) (9 . |Zero|) (13 . |inv|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              |FIELD-;unitNormal;SR;1| |FIELD-;unitCanonical;2S;2|
              |FIELD-;associates?;2SB;3| (|Union| $ '"failed") (18 . |recip|)
              |FIELD-;inv;2S;4| (23 . =) (29 . /) |FIELD-;exquo;2SU;5|
              |FIELD-;gcd;3S;6| (|NonNegativeInteger|)
              |FIELD-;euclideanSize;SNni;7| |FIELD-;prime?;SB;8| (|Factored| 6)
              (35 . |coerce|) (|Factored| $) |FIELD-;squareFree;SF;9|
              |FIELD-;factor;SF;10| (40 . *) |FIELD-;/;3S;11|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |FIELD-;divide;2SR;12| (|List| $))
           '#(|unitNormal| 46 |unitCanonical| 51 |squareFree| 56 |prime?| 61
              |inv| 66 |gcd| 71 |factor| 77 |exquo| 82 |euclideanSize| 88
              |divide| 93 |associates?| 99 / 105)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 34
                                                 '(1 6 7 0 8 0 6 0 9 0 6 0 10 1
                                                   6 0 0 11 1 6 16 0 17 2 6 7 0
                                                   0 19 2 6 0 0 0 20 1 26 0 6
                                                   27 2 6 0 0 0 31 1 0 12 0 13
                                                   1 0 0 0 14 1 0 28 0 29 1 0 7
                                                   0 25 1 0 0 0 18 2 0 0 0 0 22
                                                   1 0 28 0 30 2 0 16 0 0 21 1
                                                   0 23 0 24 2 0 33 0 0 34 2 0
                                                   7 0 0 15 2 0 0 0 0 32)))))
           '|lookupComplete|)) 
