
(DEFUN |STTFNC;exp;2S;1| (|z| $)
  (PROG (|expx|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 12))
        (SPADCALL (|spadConstant| $ 13) (QREFELT $ 15)))
       ((SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 17)
                  (QREFELT $ 18))
        (SEQ
         (LETT |expx|
               (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 20))
                         (QREFELT $ 22))
               |STTFNC;exp;2S;1|)
         (EXIT (SPADCALL |expx| |z| (QREFELT $ 23)))))
       ('T
        (|error|
         (SPADCALL (STRCONC "exp: " (QREFELT $ 7)) (QREFELT $ 26))))))))) 

(DEFUN |STTFNC;log;2S;2| (|z| $)
  (PROG (|log1PlusX|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |z| (QREFELT $ 12))
            (NULL
             (SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 13)
                       (QREFELT $ 18))))
        (|error| (SPADCALL (STRCONC "log: " (QREFELT $ 8)) (QREFELT $ 26))))
       ('T
        (SEQ
         (LETT |log1PlusX|
               (SPADCALL
                (SPADCALL (SPADCALL (|spadConstant| $ 13) 0 (QREFELT $ 20))
                          (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 20))
                          (QREFELT $ 28))
                (QREFELT $ 29))
               |STTFNC;log;2S;2|)
         (EXIT
          (SPADCALL |log1PlusX|
                    (SPADCALL |z|
                              (SPADCALL (|spadConstant| $ 13) 0 (QREFELT $ 20))
                              (QREFELT $ 30))
                    (QREFELT $ 23)))))))))) 

(DEFUN |STTFNC;^;3S;3| (|z1| |z2| $)
  (SPADCALL (SPADCALL (SPADCALL |z1| (QREFELT $ 31)) |z2| (QREFELT $ 32))
            (QREFELT $ 27))) 

(DEFUN |STTFNC;sin;2S;4| (|z| $)
  (PROG (|sinx|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 12))
        (SPADCALL (|spadConstant| $ 17) (QREFELT $ 15)))
       ((SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 17)
                  (QREFELT $ 18))
        (SEQ
         (LETT |sinx|
               (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 20))
                         (QREFELT $ 34))
               |STTFNC;sin;2S;4|)
         (EXIT (SPADCALL |sinx| |z| (QREFELT $ 23)))))
       ('T
        (|error|
         (SPADCALL (STRCONC "sin: " (QREFELT $ 7)) (QREFELT $ 26))))))))) 

(DEFUN |STTFNC;cos;2S;5| (|z| $)
  (PROG (|cosx|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 12))
        (SPADCALL (|spadConstant| $ 13) (QREFELT $ 15)))
       ((SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 17)
                  (QREFELT $ 18))
        (SEQ
         (LETT |cosx|
               (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 20))
                         (QREFELT $ 36))
               |STTFNC;cos;2S;5|)
         (EXIT (SPADCALL |cosx| |z| (QREFELT $ 23)))))
       ('T
        (|error|
         (SPADCALL (STRCONC "cos: " (QREFELT $ 7)) (QREFELT $ 26))))))))) 

(DEFUN |STTFNC;tan;2S;6| (|z| $)
  (PROG (|tanx|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 12))
        (SPADCALL (|spadConstant| $ 17) (QREFELT $ 15)))
       ((SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 17)
                  (QREFELT $ 18))
        (SEQ
         (LETT |tanx|
               (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 20))
                         (QREFELT $ 38))
               |STTFNC;tan;2S;6|)
         (EXIT (SPADCALL |tanx| |z| (QREFELT $ 23)))))
       ('T
        (|error|
         (SPADCALL (STRCONC "tan: " (QREFELT $ 7)) (QREFELT $ 26))))))))) 

(DEFUN |STTFNC;cot;2S;7| (|z| $)
  (COND ((SPADCALL |z| (QREFELT $ 12)) (|error| "cot: cot(0) is undefined"))
        ((SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 17)
                   (QREFELT $ 18))
         (|error| (SPADCALL (STRCONC "cot: " (QREFELT $ 9)) (QREFELT $ 26))))
        ('T
         (|error| (SPADCALL (STRCONC "cot: " (QREFELT $ 7)) (QREFELT $ 26)))))) 

(DEFUN |STTFNC;sec;2S;8| (|z| $)
  (PROG (|secx|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 12))
        (SPADCALL (|spadConstant| $ 13) (QREFELT $ 15)))
       ((SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 17)
                  (QREFELT $ 18))
        (SEQ
         (LETT |secx|
               (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 20))
                         (QREFELT $ 41))
               |STTFNC;sec;2S;8|)
         (EXIT (SPADCALL |secx| |z| (QREFELT $ 23)))))
       ('T
        (|error|
         (SPADCALL (STRCONC "sec: " (QREFELT $ 7)) (QREFELT $ 26))))))))) 

(DEFUN |STTFNC;csc;2S;9| (|z| $)
  (COND ((SPADCALL |z| (QREFELT $ 12)) (|error| "csc: csc(0) is undefined"))
        ((SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 17)
                   (QREFELT $ 18))
         (|error| (SPADCALL (STRCONC "csc: " (QREFELT $ 9)) (QREFELT $ 26))))
        ('T
         (|error| (SPADCALL (STRCONC "csc: " (QREFELT $ 7)) (QREFELT $ 26)))))) 

(DEFUN |STTFNC;asin;2S;10| (|z| $)
  (PROG (|asinx|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 12))
        (SPADCALL (|spadConstant| $ 17) (QREFELT $ 15)))
       ((SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 17)
                  (QREFELT $ 18))
        (SEQ
         (LETT |asinx|
               (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 20))
                         (QREFELT $ 44))
               |STTFNC;asin;2S;10|)
         (EXIT (SPADCALL |asinx| |z| (QREFELT $ 23)))))
       ('T
        (|error|
         (SPADCALL (STRCONC "asin: " (QREFELT $ 7)) (QREFELT $ 26))))))))) 

(DEFUN |STTFNC;atan;2S;11| (|z| $)
  (PROG (|atanx|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 12))
        (SPADCALL (|spadConstant| $ 17) (QREFELT $ 15)))
       ((SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 17)
                  (QREFELT $ 18))
        (SEQ
         (LETT |atanx|
               (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 20))
                         (QREFELT $ 46))
               |STTFNC;atan;2S;11|)
         (EXIT (SPADCALL |atanx| |z| (QREFELT $ 23)))))
       ('T
        (|error|
         (SPADCALL (STRCONC "atan: " (QREFELT $ 7)) (QREFELT $ 26))))))))) 

(PUT '|STTFNC;acos;2S;12| '|SPADreplace|
     '(XLAM (|z|) (|error| "acos: acos undefined on this coefficient domain"))) 

(DEFUN |STTFNC;acos;2S;12| (|z| $)
  (|error| "acos: acos undefined on this coefficient domain")) 

(PUT '|STTFNC;acot;2S;13| '|SPADreplace|
     '(XLAM (|z|) (|error| "acot: acot undefined on this coefficient domain"))) 

(DEFUN |STTFNC;acot;2S;13| (|z| $)
  (|error| "acot: acot undefined on this coefficient domain")) 

(PUT '|STTFNC;asec;2S;14| '|SPADreplace|
     '(XLAM (|z|) (|error| "asec: asec undefined on this coefficient domain"))) 

(DEFUN |STTFNC;asec;2S;14| (|z| $)
  (|error| "asec: asec undefined on this coefficient domain")) 

(PUT '|STTFNC;acsc;2S;15| '|SPADreplace|
     '(XLAM (|z|) (|error| "acsc: acsc undefined on this coefficient domain"))) 

(DEFUN |STTFNC;acsc;2S;15| (|z| $)
  (|error| "acsc: acsc undefined on this coefficient domain")) 

(DEFUN |STTFNC;sinh;2S;16| (|z| $)
  (PROG (|sinhx|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 12))
        (SPADCALL (|spadConstant| $ 17) (QREFELT $ 15)))
       ((SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 17)
                  (QREFELT $ 18))
        (SEQ
         (LETT |sinhx|
               (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 20))
                         (QREFELT $ 52))
               |STTFNC;sinh;2S;16|)
         (EXIT (SPADCALL |sinhx| |z| (QREFELT $ 23)))))
       ('T
        (|error|
         (SPADCALL (STRCONC "sinh: " (QREFELT $ 7)) (QREFELT $ 26))))))))) 

(DEFUN |STTFNC;cosh;2S;17| (|z| $)
  (PROG (|coshx|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 12))
        (SPADCALL (|spadConstant| $ 13) (QREFELT $ 15)))
       ((SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 17)
                  (QREFELT $ 18))
        (SEQ
         (LETT |coshx|
               (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 20))
                         (QREFELT $ 54))
               |STTFNC;cosh;2S;17|)
         (EXIT (SPADCALL |coshx| |z| (QREFELT $ 23)))))
       ('T
        (|error|
         (SPADCALL (STRCONC "cosh: " (QREFELT $ 7)) (QREFELT $ 26))))))))) 

(DEFUN |STTFNC;tanh;2S;18| (|z| $)
  (PROG (|tanhx|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 12))
        (SPADCALL (|spadConstant| $ 17) (QREFELT $ 15)))
       ((SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 17)
                  (QREFELT $ 18))
        (SEQ
         (LETT |tanhx|
               (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 20))
                         (QREFELT $ 56))
               |STTFNC;tanh;2S;18|)
         (EXIT (SPADCALL |tanhx| |z| (QREFELT $ 23)))))
       ('T
        (|error|
         (SPADCALL (STRCONC "tanh: " (QREFELT $ 7)) (QREFELT $ 26))))))))) 

(DEFUN |STTFNC;coth;2S;19| (|z| $)
  (COND ((SPADCALL |z| (QREFELT $ 12)) (|error| "coth: coth(0) is undefined"))
        ((SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 17)
                   (QREFELT $ 18))
         (|error| (SPADCALL (STRCONC "coth: " (QREFELT $ 9)) (QREFELT $ 26))))
        ('T
         (|error| (SPADCALL (STRCONC "coth: " (QREFELT $ 7)) (QREFELT $ 26)))))) 

(DEFUN |STTFNC;sech;2S;20| (|z| $)
  (PROG (|sechx|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 12))
        (SPADCALL (|spadConstant| $ 13) (QREFELT $ 15)))
       ((SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 17)
                  (QREFELT $ 18))
        (SEQ
         (LETT |sechx|
               (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 20))
                         (QREFELT $ 59))
               |STTFNC;sech;2S;20|)
         (EXIT (SPADCALL |sechx| |z| (QREFELT $ 23)))))
       ('T
        (|error|
         (SPADCALL (STRCONC "sech: " (QREFELT $ 7)) (QREFELT $ 26))))))))) 

(DEFUN |STTFNC;csch;2S;21| (|z| $)
  (COND ((SPADCALL |z| (QREFELT $ 12)) (|error| "csch: csch(0) is undefined"))
        ((SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 17)
                   (QREFELT $ 18))
         (|error| (SPADCALL (STRCONC "csch: " (QREFELT $ 9)) (QREFELT $ 26))))
        ('T
         (|error| (SPADCALL (STRCONC "csch: " (QREFELT $ 7)) (QREFELT $ 26)))))) 

(DEFUN |STTFNC;asinh;2S;22| (|z| $)
  (PROG (|asinhx|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 12))
        (SPADCALL (|spadConstant| $ 17) (QREFELT $ 15)))
       ((SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 17)
                  (QREFELT $ 18))
        (SEQ
         (LETT |asinhx|
               (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 20))
                         (QREFELT $ 62))
               |STTFNC;asinh;2S;22|)
         (EXIT (SPADCALL |asinhx| |z| (QREFELT $ 23)))))
       ('T
        (|error|
         (SPADCALL (STRCONC "asinh: " (QREFELT $ 7)) (QREFELT $ 26))))))))) 

(DEFUN |STTFNC;atanh;2S;23| (|z| $)
  (PROG (|atanhx|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 12))
        (SPADCALL (|spadConstant| $ 17) (QREFELT $ 15)))
       ((SPADCALL (SPADCALL |z| (QREFELT $ 16)) (|spadConstant| $ 17)
                  (QREFELT $ 18))
        (SEQ
         (LETT |atanhx|
               (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 20))
                         (QREFELT $ 64))
               |STTFNC;atanh;2S;23|)
         (EXIT (SPADCALL |atanhx| |z| (QREFELT $ 23)))))
       ('T
        (|error|
         (SPADCALL (STRCONC "atanh: " (QREFELT $ 7)) (QREFELT $ 26))))))))) 

(PUT '|STTFNC;acosh;2S;24| '|SPADreplace|
     '(XLAM (|z|)
       (|error| "acosh: acosh undefined on this coefficient domain"))) 

(DEFUN |STTFNC;acosh;2S;24| (|z| $)
  (|error| "acosh: acosh undefined on this coefficient domain")) 

(PUT '|STTFNC;acoth;2S;25| '|SPADreplace|
     '(XLAM (|z|)
       (|error| "acoth: acoth undefined on this coefficient domain"))) 

(DEFUN |STTFNC;acoth;2S;25| (|z| $)
  (|error| "acoth: acoth undefined on this coefficient domain")) 

(PUT '|STTFNC;asech;2S;26| '|SPADreplace|
     '(XLAM (|z|)
       (|error| "asech: asech undefined on this coefficient domain"))) 

(DEFUN |STTFNC;asech;2S;26| (|z| $)
  (|error| "asech: asech undefined on this coefficient domain")) 

(PUT '|STTFNC;acsch;2S;27| '|SPADreplace|
     '(XLAM (|z|)
       (|error| "acsch: acsch undefined on this coefficient domain"))) 

(DEFUN |STTFNC;acsch;2S;27| (|z| $)
  (|error| "acsch: acsch undefined on this coefficient domain")) 

(DECLAIM (NOTINLINE |StreamTranscendentalFunctionsNonCommutative;|)) 

(DEFUN |StreamTranscendentalFunctionsNonCommutative| (#1=#:G216)
  (PROG ()
    (RETURN
     (PROG (#2=#:G217)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|StreamTranscendentalFunctionsNonCommutative|)
                                           '|domainEqualList|)
                . #3=(|StreamTranscendentalFunctionsNonCommutative|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|StreamTranscendentalFunctionsNonCommutative;| #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|StreamTranscendentalFunctionsNonCommutative|))))))))))) 

(DEFUN |StreamTranscendentalFunctionsNonCommutative;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|StreamTranscendentalFunctionsNonCommutative|))
      (LETT |dv$| (LIST '|StreamTranscendentalFunctionsNonCommutative| DV$1)
            . #1#)
      (LETT $ (GETREFV 70) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache|
                  '|StreamTranscendentalFunctionsNonCommutative| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 "series must have constant coefficient zero")
      (QSETREFV $ 8 "series must have constant coefficient one")
      (QSETREFV $ 9 "series expansion has terms of negative degree")
      $)))) 

(MAKEPROP '|StreamTranscendentalFunctionsNonCommutative| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'ZERO 'ONE 'NPOWERS
              (|Boolean|) (|Stream| 6) (0 . |empty?|) (5 . |One|)
              (|StreamTaylorSeriesOperations| 6) (9 . |coerce|) (14 . |frst|)
              (19 . |Zero|) (23 . =) (|Integer|) (29 . |monom|)
              (|StreamTranscendentalFunctions| 6) (35 . |exp|) (40 . |compose|)
              (|OutputForm|) (|String|) (46 . |coerce|) |STTFNC;exp;2S;1|
              (51 . +) (57 . |log|) (62 . -) |STTFNC;log;2S;2| (68 . *)
              |STTFNC;^;3S;3| (74 . |sin|) |STTFNC;sin;2S;4| (79 . |cos|)
              |STTFNC;cos;2S;5| (84 . |tan|) |STTFNC;tan;2S;6|
              |STTFNC;cot;2S;7| (89 . |sec|) |STTFNC;sec;2S;8|
              |STTFNC;csc;2S;9| (94 . |asin|) |STTFNC;asin;2S;10| (99 . |atan|)
              |STTFNC;atan;2S;11| |STTFNC;acos;2S;12| |STTFNC;acot;2S;13|
              |STTFNC;asec;2S;14| |STTFNC;acsc;2S;15| (104 . |sinh|)
              |STTFNC;sinh;2S;16| (109 . |cosh|) |STTFNC;cosh;2S;17|
              (114 . |tanh|) |STTFNC;tanh;2S;18| |STTFNC;coth;2S;19|
              (119 . |sech|) |STTFNC;sech;2S;20| |STTFNC;csch;2S;21|
              (124 . |asinh|) |STTFNC;asinh;2S;22| (129 . |atanh|)
              |STTFNC;atanh;2S;23| |STTFNC;acosh;2S;24| |STTFNC;acoth;2S;25|
              |STTFNC;asech;2S;26| |STTFNC;acsch;2S;27|)
           '#(|tanh| 134 |tan| 139 |sinh| 144 |sin| 149 |sech| 154 |sec| 159
              |log| 164 |exp| 169 |csch| 174 |csc| 179 |coth| 184 |cot| 189
              |cosh| 194 |cos| 199 |atanh| 204 |atan| 209 |asinh| 214 |asin|
              219 |asech| 224 |asec| 229 |acsch| 234 |acsc| 239 |acoth| 244
              |acot| 249 |acosh| 254 |acos| 259 ^ 264)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 69
                                                 '(1 11 10 0 12 0 6 0 13 1 14
                                                   11 6 15 1 11 6 0 16 0 6 0 17
                                                   2 6 10 0 0 18 2 14 11 6 19
                                                   20 1 21 11 11 22 2 14 11 11
                                                   11 23 1 25 24 0 26 2 14 11
                                                   11 11 28 1 21 11 11 29 2 14
                                                   11 11 11 30 2 14 11 11 11 32
                                                   1 21 11 11 34 1 21 11 11 36
                                                   1 21 11 11 38 1 21 11 11 41
                                                   1 21 11 11 44 1 21 11 11 46
                                                   1 21 11 11 52 1 21 11 11 54
                                                   1 21 11 11 56 1 21 11 11 59
                                                   1 21 11 11 62 1 21 11 11 64
                                                   1 0 11 11 57 1 0 11 11 39 1
                                                   0 11 11 53 1 0 11 11 35 1 0
                                                   11 11 60 1 0 11 11 42 1 0 11
                                                   11 31 1 0 11 11 27 1 0 11 11
                                                   61 1 0 11 11 43 1 0 11 11 58
                                                   1 0 11 11 40 1 0 11 11 55 1
                                                   0 11 11 37 1 0 11 11 65 1 0
                                                   11 11 47 1 0 11 11 63 1 0 11
                                                   11 45 1 0 11 11 68 1 0 11 11
                                                   50 1 0 11 11 69 1 0 11 11 51
                                                   1 0 11 11 67 1 0 11 11 49 1
                                                   0 11 11 66 1 0 11 11 48 2 0
                                                   11 11 11 33)))))
           '|lookupComplete|)) 
