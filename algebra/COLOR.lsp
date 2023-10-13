
(/VERSIONCHECK 2) 

(DEFUN |COLOR;*;Df2$;1| (|f| |c| $)
  (COND ((|zero?_DF| |f|) |c|)
        ('T (CONS (QCAR |c|) (|mul_DF| |f| (QCDR |c|)))))) 

(DEFUN |COLOR;+;3$;2| (|x| |y| $)
  (PROG (|ans| |offset| |diff| |moreThanHalf| |xHueSmaller| |c|)
    (RETURN
     (SEQ
      (COND
       ((EQL (QCAR |x|) (QCAR |y|))
        (CONS (QCAR |x|) (|add_DF| (QCDR |x|) (QCDR |y|))))
       (#1='T
        (SEQ
         (COND
          ((SPADCALL (QCDR |y|) (QCDR |x|) (QREFELT $ 10))
           (SEQ (LETT |c| |x| . #2=(|COLOR;+;3$;2|)) (LETT |x| |y| . #2#)
                (EXIT (LETT |y| |c| . #2#)))))
         (LETT |diff| (- (QCAR |x|) (QCAR |y|)) . #2#)
         (SEQ (LETT |xHueSmaller| (< |diff| 0) . #2#)
              (EXIT (COND (|xHueSmaller| (LETT |diff| (- |diff|) . #2#)))))
         (SEQ
          (LETT |moreThanHalf|
                (SPADCALL |diff| (QUOTIENT2 27 2) (QREFELT $ 12)) . #2#)
          (EXIT (COND (|moreThanHalf| (LETT |diff| (- 27 |diff|) . #2#)))))
         (LETT |offset|
               (TRUNCATE
                (SPADCALL
                 (|div_DF| (FLOAT |diff| MOST-POSITIVE-DOUBLE-FLOAT)
                           (SPADCALL (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                     (|div_DF| (QCDR |x|) (QCDR |y|))
                                     (QREFELT $ 13)))
                 (QREFELT $ 14)))
               . #2#)
         (COND
          (|xHueSmaller|
           (COND
            (|moreThanHalf|
             (COND
              ((OR |xHueSmaller| (NULL |moreThanHalf|))
               (LETT |ans| (- (QCAR |x|) |offset|) . #2#))
              ('T (LETT |ans| (+ (QCAR |x|) |offset|) . #2#))))
            (#1# (LETT |ans| (+ (QCAR |x|) |offset|) . #2#))))
          (|moreThanHalf| (LETT |ans| (+ (QCAR |x|) |offset|) . #2#))
          (#1# (LETT |ans| (- (QCAR |x|) |offset|) . #2#)))
         (COND ((< |ans| 0) (LETT |ans| (+ 27 |ans|) . #2#))
               ((SPADCALL |ans| 27 (QREFELT $ 12))
                (LETT |ans| (- |ans| 27) . #2#)))
         (EXIT (CONS |ans| 1.0))))))))) 

(DEFUN |COLOR;=;2$B;3| (|x| |y| $)
  (COND ((EQL (QCAR |x|) (QCAR |y|)) (|eql_DF| (QCDR |x|) (QCDR |y|)))
        ('T 'NIL))) 

(PUT '|COLOR;red;$;4| '|SPADreplace| '(XLAM NIL (CONS 1 1.0))) 

(DEFUN |COLOR;red;$;4| ($) (CONS 1 1.0)) 

(PUT '|COLOR;yellow;$;5| '|SPADreplace| '(XLAM NIL (CONS 11 1.0))) 

(DEFUN |COLOR;yellow;$;5| ($) (CONS 11 1.0)) 

(PUT '|COLOR;green;$;6| '|SPADreplace| '(XLAM NIL (CONS 14 1.0))) 

(DEFUN |COLOR;green;$;6| ($) (CONS 14 1.0)) 

(PUT '|COLOR;blue;$;7| '|SPADreplace| '(XLAM NIL (CONS 22 1.0))) 

(DEFUN |COLOR;blue;$;7| ($) (CONS 22 1.0)) 

(PUT '|COLOR;hue;$I;8| '|SPADreplace| 'QCAR) 

(DEFUN |COLOR;hue;$I;8| (|c| $) (QCAR |c|)) 

(DEFUN |COLOR;*;Pi2$;9| (|i| |c| $)
  (SPADCALL (FLOAT |i| MOST-POSITIVE-DOUBLE-FLOAT) |c| (QREFELT $ 8))) 

(PUT '|COLOR;numberOfHues;Pi;10| '|SPADreplace| '(XLAM NIL 27)) 

(DEFUN |COLOR;numberOfHues;Pi;10| ($) 27) 

(DEFUN |COLOR;color;I$;11| (|i| $)
  (SEQ
   (COND
    ((OR (< |i| 0) (SPADCALL |i| 27 (QREFELT $ 12)))
     (|error|
      (|concat| "Color should be in the range 1.." (|::| 27 (|String|))))))
   (EXIT (CONS |i| 1.0)))) 

(DEFUN |COLOR;coerce;$Of;12| (|c| $)
  (SPADCALL
   (LIST "Hue: " (SPADCALL (QCAR |c|) (QREFELT $ 27)) "  Weight: "
         (SPADCALL (QCDR |c|) (QREFELT $ 28)))
   (QREFELT $ 30))) 

(DEFUN |Color| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G155)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|Color|) . #2=(|Color|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|Color|
                         (LIST (CONS NIL (CONS 1 (|Color;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|Color|))))))))))) 

(DEFUN |Color;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|Color|) . #1=(|Color|))
      (LETT $ (GETREFV 34) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Color| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record| (|:| |hue| (|Integer|))
                          (|:| |weight| (|DoubleFloat|))))
      $)))) 

(MAKEPROP '|Color| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|DoubleFloat|) |COLOR;*;Df2$;1|
              (|Boolean|) (0 . >) (|Integer|) (6 . >) (12 . ^) (18 . |round|)
              |COLOR;+;3$;2| |COLOR;=;2$B;3| |COLOR;red;$;4| |COLOR;yellow;$;5|
              |COLOR;green;$;6| |COLOR;blue;$;7| |COLOR;hue;$I;8|
              (|PositiveInteger|) |COLOR;*;Pi2$;9| |COLOR;numberOfHues;Pi;10|
              |COLOR;color;I$;11| (|OutputForm|) (23 . |coerce|)
              (28 . |coerce|) (|List| $) (33 . |hconcat|) |COLOR;coerce;$Of;12|
              (|String|) (|SingleInteger|))
           '#(~= 38 |yellow| 44 |red| 48 |numberOfHues| 52 |latex| 56 |hue| 61
              |hash| 66 |green| 71 |color| 75 |coerce| 80 |blue| 85 = 89 + 95 *
              101)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|AbelianSemiGroup&| |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|AbelianSemiGroup|) (|SetCategory|) (|BasicType|)
                           (|CoercibleTo| 26))
                        (|makeByteWordVec2| 33
                                            '(2 7 9 0 0 10 2 11 9 0 0 12 2 7 0
                                              0 0 13 1 7 0 0 14 1 11 26 0 27 1
                                              7 26 0 28 1 26 0 29 30 2 0 9 0 0
                                              1 0 0 0 18 0 0 0 17 0 0 22 24 1 0
                                              32 0 1 1 0 11 0 21 1 0 33 0 1 0 0
                                              0 19 1 0 0 11 25 1 0 26 0 31 0 0
                                              0 20 2 0 9 0 0 16 2 0 0 0 0 15 2
                                              0 0 22 0 23 2 0 0 7 0 8)))))
           '|lookupComplete|)) 

(MAKEPROP '|Color| 'NILADIC T) 
