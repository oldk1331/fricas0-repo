
(/VERSIONCHECK 2) 

(DEFUN |DRAWCX;makeArrow| (|p1| |p2| |len| |arg| $)
  (PROG (|p4| |p3| |s2| |c2| |s1| |c1|)
    (RETURN
     (SEQ
      (LETT |c1| (|cos_DF| (|add_DF| |arg| (QREFELT $ 13)))
            . #1=(|DRAWCX;makeArrow|))
      (LETT |s1| (|sin_DF| (|add_DF| |arg| (QREFELT $ 13))) . #1#)
      (LETT |c2| (|cos_DF| (|sub_DF| |arg| (QREFELT $ 13))) . #1#)
      (LETT |s2| (|sin_DF| (|sub_DF| |arg| (QREFELT $ 13))) . #1#)
      (LETT |p3|
            (SPADCALL
             (LIST
              (|add_DF| (SPADCALL |p2| 1 (QREFELT $ 19))
                        (|mul_DF| (|mul_DF| |c1| (QREFELT $ 12)) |len|))
              (|add_DF| (SPADCALL |p2| 2 (QREFELT $ 19))
                        (|mul_DF| (|mul_DF| |s1| (QREFELT $ 12)) |len|))
              (SPADCALL |p2| 3 (QREFELT $ 19))
              (SPADCALL |p2| 4 (QREFELT $ 19)))
             (QREFELT $ 21))
            . #1#)
      (LETT |p4|
            (SPADCALL
             (LIST
              (|add_DF| (SPADCALL |p2| 1 (QREFELT $ 19))
                        (|mul_DF| (|mul_DF| |c2| (QREFELT $ 12)) |len|))
              (|add_DF| (SPADCALL |p2| 2 (QREFELT $ 19))
                        (|mul_DF| (|mul_DF| |s2| (QREFELT $ 12)) |len|))
              (SPADCALL |p2| 3 (QREFELT $ 19))
              (SPADCALL |p2| 4 (QREFELT $ 19)))
             (QREFELT $ 21))
            . #1#)
      (EXIT (LIST (LIST |p1| |p2| |p3|) (LIST |p2| |p4|))))))) 

(DEFUN |DRAWCX;clipFun| (|x| $)
  (|min_DF| (|max_DF| |x| (|minus_DF| (QREFELT $ 16))) (QREFELT $ 16))) 

(DEFUN |DRAWCX;drawComplex;M2SBTdv;3| (|f| |realRange| |imagRange| |arrows?| $)
  (PROG (|real| |imag| #1=#:G157 |a| |arrow| |p2| |len| |p1| |arg| #2=#:G156
         |j| #3=#:G155 |i| |space| |llp| |lp| |p| #4=#:G154 #5=#:G153 |z|
         #6=#:G152 #7=#:G151 |funTable| #8=#:G131 #9=#:G129 |delImag|
         |delReal|)
    (RETURN
     (SEQ
      (LETT |delReal|
            (|div_DF|
             (|sub_DF| (SPADCALL |realRange| (QREFELT $ 23))
                       (SPADCALL |realRange| (QREFELT $ 24)))
             (FLOAT (QREFELT $ 14) MOST-POSITIVE-DOUBLE-FLOAT))
            . #10=(|DRAWCX;drawComplex;M2SBTdv;3|))
      (LETT |delImag|
            (|div_DF|
             (|sub_DF| (SPADCALL |imagRange| (QREFELT $ 23))
                       (SPADCALL |imagRange| (QREFELT $ 24)))
             (FLOAT (QREFELT $ 15) MOST-POSITIVE-DOUBLE-FLOAT))
            . #10#)
      (LETT |funTable|
            (SPADCALL
             (+
              (PROG1 (LETT #9# (QREFELT $ 14) . #10#)
                (|check_subtype| (>= #9# 0) '(|NonNegativeInteger|) #9#))
              1)
             (+
              (PROG1 (LETT #8# (QREFELT $ 15) . #10#)
                (|check_subtype| (>= #8# 0) '(|NonNegativeInteger|) #8#))
              1)
             (CONS 0.0 0.0) (QREFELT $ 29))
            . #10#)
      (LETT |real| (SPADCALL |realRange| (QREFELT $ 24)) . #10#)
      (SEQ (LETT |i| 1 . #10#) (LETT #7# (+ (QREFELT $ 14) 1) . #10#) G190
           (COND ((|greater_SI| |i| #7#) (GO G191)))
           (SEQ (LETT |imag| (SPADCALL |imagRange| (QREFELT $ 24)) . #10#)
                (SEQ (LETT |j| 1 . #10#) (LETT #6# (+ (QREFELT $ 15) 1) . #10#)
                     G190 (COND ((|greater_SI| |j| #6#) (GO G191)))
                     (SEQ
                      (LETT |z|
                            (SPADCALL (SPADCALL |real| |imag| (QREFELT $ 31))
                                      |f|)
                            . #10#)
                      (SPADCALL |funTable| |i| |j|
                                (CONS
                                 (|DRAWCX;clipFun|
                                  (SPADCALL (SPADCALL |z| (QREFELT $ 32))
                                            (QREFELT $ 33))
                                  $)
                                 (SPADCALL |z| (QREFELT $ 34)))
                                (QREFELT $ 35))
                      (EXIT (LETT |imag| (|add_DF| |imag| |delImag|) . #10#)))
                     (LETT |j| (|inc_SI| |j|) . #10#) (GO G190) G191
                     (EXIT NIL))
                (EXIT (LETT |real| (|add_DF| |real| |delReal|) . #10#)))
           (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))
      (LETT |llp| NIL . #10#)
      (LETT |real| (SPADCALL |realRange| (QREFELT $ 24)) . #10#)
      (SEQ (LETT |i| 1 . #10#) (LETT #5# (+ (QREFELT $ 14) 1) . #10#) G190
           (COND ((|greater_SI| |i| #5#) (GO G191)))
           (SEQ (LETT |imag| (SPADCALL |imagRange| (QREFELT $ 24)) . #10#)
                (LETT |lp| NIL . #10#)
                (SEQ (LETT |j| 1 . #10#) (LETT #4# (+ (QREFELT $ 15) 1) . #10#)
                     G190 (COND ((|greater_SI| |j| #4#) (GO G191)))
                     (SEQ
                      (LETT |p|
                            (SPADCALL
                             (LIST |real| |imag|
                                   (QCAR
                                    (SPADCALL |funTable| |i| |j|
                                              (QREFELT $ 36)))
                                   (QCDR
                                    (SPADCALL |funTable| |i| |j|
                                              (QREFELT $ 36))))
                             (QREFELT $ 21))
                            . #10#)
                      (LETT |lp| (CONS |p| |lp|) . #10#)
                      (EXIT (LETT |imag| (|add_DF| |imag| |delImag|) . #10#)))
                     (LETT |j| (|inc_SI| |j|) . #10#) (GO G190) G191
                     (EXIT NIL))
                (LETT |real| (|add_DF| |real| |delReal|) . #10#)
                (EXIT (LETT |llp| (CONS |lp| |llp|) . #10#)))
           (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))
      (LETT |space| (SPADCALL |llp| (QREFELT $ 39)) . #10#)
      (COND
       (|arrows?|
        (SEQ (LETT |real| (SPADCALL |realRange| (QREFELT $ 24)) . #10#)
             (EXIT
              (SEQ (LETT |i| 1 . #10#) (LETT #3# (+ (QREFELT $ 14) 1) . #10#)
                   G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (LETT |imag| (SPADCALL |imagRange| (QREFELT $ 24)) . #10#)
                    (SEQ (LETT |j| 1 . #10#)
                         (LETT #2# (+ (QREFELT $ 15) 1) . #10#) G190
                         (COND ((|greater_SI| |j| #2#) (GO G191)))
                         (SEQ
                          (LETT |arg|
                                (QCDR
                                 (SPADCALL |funTable| |i| |j| (QREFELT $ 36)))
                                . #10#)
                          (LETT |p1|
                                (SPADCALL
                                 (LIST |real| |imag|
                                       (QCAR
                                        (SPADCALL |funTable| |i| |j|
                                                  (QREFELT $ 36)))
                                       |arg|)
                                 (QREFELT $ 21))
                                . #10#)
                          (LETT |len|
                                (|mul_DF| |delReal|
                                          (SPADCALL
                                           (SPADCALL 2 0 10 (QREFELT $ 9))
                                           (QREFELT $ 11)))
                                . #10#)
                          (LETT |p2|
                                (SPADCALL
                                 (LIST
                                  (|add_DF| (SPADCALL |p1| 1 (QREFELT $ 19))
                                            (|mul_DF| |len| (|cos_DF| |arg|)))
                                  (|add_DF| (SPADCALL |p1| 2 (QREFELT $ 19))
                                            (|mul_DF| |len| (|sin_DF| |arg|)))
                                  (SPADCALL |p1| 3 (QREFELT $ 19))
                                  (SPADCALL |p1| 4 (QREFELT $ 19)))
                                 (QREFELT $ 21))
                                . #10#)
                          (LETT |arrow|
                                (|DRAWCX;makeArrow| |p1| |p2| |len| |arg| $)
                                . #10#)
                          (SEQ (LETT |a| NIL . #10#) (LETT #1# |arrow| . #10#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |a| (CAR #1#) . #10#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT (SPADCALL |space| |a| (QREFELT $ 41))))
                               (LETT #1# (CDR #1#) . #10#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (LETT |imag| (|add_DF| |imag| |delImag|) . #10#)))
                         (LETT |j| (|inc_SI| |j|) . #10#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (LETT |real| (|add_DF| |real| |delReal|) . #10#)))
                   (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                   (EXIT NIL))))))
      (EXIT (SPADCALL |space| "Complex Function" (QREFELT $ 44))))))) 

(DEFUN |DRAWCX;drawComplexVectorField;M2STdv;4| (|f| |realRange| |imagRange| $)
  (PROG (|real| |imag| #1=#:G167 |a| |arrow| |p2| |scaleLen| |p1| |len| |arg|
         |z| #2=#:G166 |j| #3=#:G165 |i| |space| |delImag| |delReal|)
    (RETURN
     (SEQ
      (LETT |delReal|
            (|div_DF|
             (|sub_DF| (SPADCALL |realRange| (QREFELT $ 23))
                       (SPADCALL |realRange| (QREFELT $ 24)))
             (FLOAT (QREFELT $ 14) MOST-POSITIVE-DOUBLE-FLOAT))
            . #4=(|DRAWCX;drawComplexVectorField;M2STdv;4|))
      (LETT |delImag|
            (|div_DF|
             (|sub_DF| (SPADCALL |imagRange| (QREFELT $ 23))
                       (SPADCALL |imagRange| (QREFELT $ 24)))
             (FLOAT (QREFELT $ 15) MOST-POSITIVE-DOUBLE-FLOAT))
            . #4#)
      (LETT |space| (SPADCALL (QREFELT $ 48)) . #4#)
      (LETT |real| (SPADCALL |realRange| (QREFELT $ 24)) . #4#)
      (SEQ (LETT |i| 1 . #4#) (LETT #3# (+ (QREFELT $ 14) 1) . #4#) G190
           (COND ((|greater_SI| |i| #3#) (GO G191)))
           (SEQ (LETT |imag| (SPADCALL |imagRange| (QREFELT $ 24)) . #4#)
                (SEQ (LETT |j| 1 . #4#) (LETT #2# (+ (QREFELT $ 15) 1) . #4#)
                     G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                     (SEQ
                      (LETT |z|
                            (SPADCALL (SPADCALL |real| |imag| (QREFELT $ 31))
                                      |f|)
                            . #4#)
                      (LETT |arg| (SPADCALL |z| (QREFELT $ 34)) . #4#)
                      (LETT |len|
                            (|DRAWCX;clipFun|
                             (SPADCALL (SPADCALL |z| (QREFELT $ 32))
                                       (QREFELT $ 33))
                             $)
                            . #4#)
                      (LETT |p1|
                            (SPADCALL (LIST |real| |imag| 0.0 |arg|)
                                      (QREFELT $ 21))
                            . #4#)
                      (LETT |scaleLen| (|mul_DF| |delReal| |len|) . #4#)
                      (LETT |p2|
                            (SPADCALL
                             (LIST
                              (|add_DF| (SPADCALL |p1| 1 (QREFELT $ 19))
                                        (|mul_DF| |scaleLen| (|cos_DF| |arg|)))
                              (|add_DF| (SPADCALL |p1| 2 (QREFELT $ 19))
                                        (|mul_DF| |scaleLen| (|sin_DF| |arg|)))
                              0.0 |arg|)
                             (QREFELT $ 21))
                            . #4#)
                      (LETT |arrow|
                            (|DRAWCX;makeArrow| |p1| |p2| |scaleLen| |arg| $)
                            . #4#)
                      (SEQ (LETT |a| NIL . #4#) (LETT #1# |arrow| . #4#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |a| (CAR #1#) . #4#) NIL))
                             (GO G191)))
                           (SEQ (EXIT (SPADCALL |space| |a| (QREFELT $ 41))))
                           (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (LETT |imag| (|add_DF| |imag| |delImag|) . #4#)))
                     (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |real| (|add_DF| |real| |delReal|) . #4#)))
           (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |space| "Complex Vector Field" (QREFELT $ 44))))))) 

(DEFUN |DRAWCX;setRealSteps;2I;5| (|n| $) (SETELT $ 14 |n|)) 

(DEFUN |DRAWCX;setImagSteps;2I;6| (|n| $) (SETELT $ 15 |n|)) 

(DEFUN |DRAWCX;setClipValue;2Df;7| (|clip| $) (SETELT $ 16 |clip|)) 

(DEFUN |DrawComplex| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G172)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|DrawComplex|)
                . #2=(|DrawComplex|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|DrawComplex|
                         (LIST (CONS NIL (CONS 1 (|DrawComplex;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|DrawComplex|))))))))))) 

(DEFUN |DrawComplex;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|DrawComplex|) . #1=(|DrawComplex|))
      (LETT $ (GETREFV 53) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|DrawComplex| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 12
                (SPADCALL (SPADCALL 125 -3 10 (QREFELT $ 9)) (QREFELT $ 11)))
      (QSETREFV $ 13
                (|sub_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                          (|div_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                                    (FLOAT 20 MOST-POSITIVE-DOUBLE-FLOAT))))
      (QSETREFV $ 14 11)
      (QSETREFV $ 15 11)
      (QSETREFV $ 16 (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT))
      $)))) 

(MAKEPROP '|DrawComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|PositiveInteger|) (|Float|)
              (0 . |float|) (|DoubleFloat|) (7 . |coerce|) '|arrowScale|
              '|arrowAngle| '|realSteps| '|imagSteps| '|clipValue| (12 . |One|)
              (|Point| 10) (16 . |elt|) (|List| 10) (22 . |point|)
              (|Segment| 10) (27 . |hi|) (32 . |lo|) (37 . |Zero|)
              (|NonNegativeInteger|) (|Record| (|:| |rr| 10) (|:| |th| 10))
              (|TwoDimensionalArray| 27) (41 . |new|) (|Complex| 10)
              (48 . |complex|) (54 . |norm|) (59 . |sqrt|) (64 . |argument|)
              (69 . |setelt|) (77 . |elt|) (|List| 40) (|ThreeSpace| 10)
              (84 . |mesh|) (|List| 18) (89 . |curve|) (|String|)
              (|ThreeDimensionalViewport|) (95 . |makeViewport3D|)
              (|Mapping| 30 30) (|Boolean|) |DRAWCX;drawComplex;M2SBTdv;3|
              (101 . |create3Space|) |DRAWCX;drawComplexVectorField;M2STdv;4|
              |DRAWCX;setRealSteps;2I;5| |DRAWCX;setImagSteps;2I;6|
              |DRAWCX;setClipValue;2Df;7|)
           '#(|setRealSteps| 105 |setImagSteps| 110 |setClipValue| 115
              |drawComplexVectorField| 120 |drawComplex| 127)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 52
                                                 '(3 8 0 6 6 7 9 1 8 10 0 11 0
                                                   8 0 17 2 18 10 0 6 19 1 18 0
                                                   20 21 1 22 10 0 23 1 22 10 0
                                                   24 0 8 0 25 3 28 0 26 26 27
                                                   29 2 30 0 10 10 31 1 30 10 0
                                                   32 1 10 0 0 33 1 30 10 0 34
                                                   4 28 27 0 6 6 27 35 3 28 27
                                                   0 6 6 36 1 38 0 37 39 2 38 0
                                                   0 40 41 2 43 0 38 42 44 0 38
                                                   0 48 1 0 6 6 50 1 0 6 6 51 1
                                                   0 10 10 52 3 0 43 45 22 22
                                                   49 4 0 43 45 22 22 46
                                                   47)))))
           '|lookupComplete|)) 

(MAKEPROP '|DrawComplex| 'NILADIC T) 
