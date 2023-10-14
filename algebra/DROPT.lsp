
(/VERSIONCHECK 2) 

(PUT '|DROPT;length| '|SPADreplace| 'LENGTH) 

(DEFUN |DROPT;length| (|tup| $) (LENGTH |tup|)) 

(PUT '|DROPT;lengthR| '|SPADreplace| 'LENGTH) 

(DEFUN |DROPT;lengthR| (|tup| $) (LENGTH |tup|)) 

(PUT '|DROPT;lengthI| '|SPADreplace| 'LENGTH) 

(DEFUN |DROPT;lengthI| (|tup| $) (LENGTH |tup|)) 

(DEFUN |DROPT;viewpoint;R$;4| (|vp| $)
  (CONS '|viewpoint| (SPADCALL |vp| (QREFELT $ 10)))) 

(DEFUN |DROPT;title;S$;5| (|s| $) (CONS '|title| (SPADCALL |s| (QREFELT $ 14)))) 

(DEFUN |DROPT;style;S$;6| (|s| $) (CONS '|style| (SPADCALL |s| (QREFELT $ 14)))) 

(DEFUN |DROPT;toScale;B$;7| (|b| $)
  (CONS '|toScale| (SPADCALL |b| (QREFELT $ 19)))) 

(DEFUN |DROPT;clip;B$;8| (|b| $)
  (CONS '|clipBoolean| (SPADCALL |b| (QREFELT $ 19)))) 

(DEFUN |DROPT;adaptive;B$;9| (|b| $)
  (CONS '|adaptive| (SPADCALL |b| (QREFELT $ 19)))) 

(DEFUN |DROPT;pointColor;F$;10| (|x| $)
  (CONS '|pointColorFloat| (SPADCALL |x| (QREFELT $ 25)))) 

(DEFUN |DROPT;pointColor;P$;11| (|c| $)
  (CONS '|pointColorPalette| (SPADCALL |c| (QREFELT $ 29)))) 

(DEFUN |DROPT;curveColor;F$;12| (|x| $)
  (CONS '|curveColorFloat| (SPADCALL |x| (QREFELT $ 25)))) 

(DEFUN |DROPT;curveColor;P$;13| (|c| $)
  (CONS '|curveColorPalette| (SPADCALL |c| (QREFELT $ 29)))) 

(DEFUN |DROPT;colorFunction;M$;14| (|f| $)
  (CONS '|colorFunction1| (SPADCALL |f| (QREFELT $ 35)))) 

(DEFUN |DROPT;colorFunction;M$;15| (|f| $)
  (CONS '|colorFunction2| (SPADCALL |f| (QREFELT $ 39)))) 

(DEFUN |DROPT;colorFunction;M$;16| (|f| $)
  (CONS '|colorFunction3| (SPADCALL |f| (QREFELT $ 43)))) 

(DEFUN |DROPT;clip;L$;17| (|tup| $)
  (COND
   ((SPADCALL (|DROPT;length| |tup| $) 3 (QREFELT $ 46))
    (|error| "clip: at most 3 segments may be specified"))
   ('T (CONS '|clipSegment| (SPADCALL |tup| (QREFELT $ 49)))))) 

(DEFUN |DROPT;coordinates;M$;18| (|f| $)
  (CONS '|coordinates| (SPADCALL |f| (QREFELT $ 53)))) 

(DEFUN |DROPT;tubeRadius;F$;19| (|x| $)
  (CONS '|tubeRadius| (SPADCALL |x| (QREFELT $ 25)))) 

(DEFUN |DROPT;range;L$;20| (|tup| $)
  (PROG (|n|)
    (RETURN
     (SEQ (LETT |n| (|DROPT;length| |tup| $) |DROPT;range;L$;20|)
          (EXIT
           (COND
            ((SPADCALL |n| 3 (QREFELT $ 46))
             (|error| "range: at most 3 segments may be specified"))
            ((< |n| 2) (|error| "range: at least 2 segments may be specified"))
            ('T (CONS '|rangeFloat| (SPADCALL |tup| (QREFELT $ 49)))))))))) 

(DEFUN |DROPT;range;L$;21| (|tup| $)
  (PROG (|n|)
    (RETURN
     (SEQ (LETT |n| (|DROPT;lengthR| |tup| $) |DROPT;range;L$;21|)
          (EXIT
           (COND
            ((SPADCALL |n| 3 (QREFELT $ 46))
             (|error| "range: at most 3 segments may be specified"))
            ((< |n| 2) (|error| "range: at least 2 segments may be specified"))
            ('T (CONS '|rangeRat| (SPADCALL |tup| (QREFELT $ 59)))))))))) 

(DEFUN |DROPT;ranges;L$;22| (|s| $)
  (CONS '|ranges| (SPADCALL |s| (QREFELT $ 49)))) 

(DEFUN |DROPT;space;Ts$;23| (|s| $)
  (CONS '|space| (SPADCALL |s| (QREFELT $ 64)))) 

(DEFUN |DROPT;var1Steps;Pi$;24| (|s| $)
  (CONS '|var1Steps| (SPADCALL |s| (QREFELT $ 68)))) 

(DEFUN |DROPT;var2Steps;Pi$;25| (|s| $)
  (CONS '|var2Steps| (SPADCALL |s| (QREFELT $ 68)))) 

(DEFUN |DROPT;tubePoints;Pi$;26| (|s| $)
  (CONS '|tubePoints| (SPADCALL |s| (QREFELT $ 68)))) 

(DEFUN |DROPT;coord;M$;27| (|s| $)
  (CONS '|coord| (SPADCALL |s| (QREFELT $ 53)))) 

(DEFUN |DROPT;unit;L$;28| (|s| $) (CONS '|unit| (SPADCALL |s| (QREFELT $ 75)))) 

(DEFUN |DROPT;coerce;$Of;29| (|x| $)
  (SPADCALL (SPADCALL (QCAR |x|) (QREFELT $ 79))
            (SPADCALL (QCDR |x|) (QREFELT $ 80)) (QREFELT $ 81))) 

(DEFUN |DROPT;=;2$B;30| (|x| |y| $)
  (COND
   ((EQUAL (QCAR |x|) (QCAR |y|))
    (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 83)))
   ('T 'NIL))) 

(DEFUN |DROPT;option?;LSB;31| (|l| |s| $)
  (PROG (#1=#:G152 #2=#:G154 #3=#:G155 |x|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |x| NIL . #4=(|DROPT;option?;LSB;31|))
               (LETT #3# |l| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQUAL (QCAR |x|) |s|)
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #2#)) . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |DROPT;option;LSU;32| (|l| |s| $)
  (PROG (#1=#:G161 #2=#:G166 #3=#:G167 |x|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |x| NIL . #4=(|DROPT;option;LSU;32|)) (LETT #3# |l| . #4#)
               G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQUAL (QCAR |x|) |s|)
                   (PROGN
                    (LETT #1#
                          (PROGN (LETT #2# (CONS 0 (QCDR |x|)) . #4#) (GO #2#))
                          . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (CONS 1 "failed"))))
      #2# (EXIT #2#))))) 

(DECLAIM (NOTINLINE |DrawOption;|)) 

(DEFUN |DrawOption| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G169)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|DrawOption|)
                . #2=(|DrawOption|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|DrawOption|
                         (LIST (CONS NIL (CONS 1 (|DrawOption;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|DrawOption|))))))))))) 

(DEFUN |DrawOption;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|DrawOption|) . #1=(|DrawOption|))
      (LETT $ (GETREFV 91) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|DrawOption| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record| (|:| |keyword| (|Symbol|)) (|:| |value| (|Any|))))
      $)))) 

(MAKEPROP '|DrawOption| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Any|)
              (|Record| (|:| |theta| (|DoubleFloat|))
                        (|:| |phi| (|DoubleFloat|))
                        (|:| |scale| (|DoubleFloat|))
                        (|:| |scaleX| (|DoubleFloat|))
                        (|:| |scaleY| (|DoubleFloat|))
                        (|:| |scaleZ| (|DoubleFloat|))
                        (|:| |deltaX| (|DoubleFloat|))
                        (|:| |deltaY| (|DoubleFloat|)))
              (|AnyFunctions1| 8) (0 . |coerce|) |DROPT;viewpoint;R$;4|
              (|String|) (|AnyFunctions1| 12) (5 . |coerce|) |DROPT;title;S$;5|
              |DROPT;style;S$;6| (|Boolean|) (|AnyFunctions1| 17)
              (10 . |coerce|) |DROPT;toScale;B$;7| |DROPT;clip;B$;8|
              |DROPT;adaptive;B$;9| (|Float|) (|AnyFunctions1| 23)
              (15 . |coerce|) |DROPT;pointColor;F$;10| (|Palette|)
              (|AnyFunctions1| 27) (20 . |coerce|) |DROPT;pointColor;P$;11|
              |DROPT;curveColor;F$;12| |DROPT;curveColor;P$;13|
              (|Mapping| (|DoubleFloat|) (|DoubleFloat|)) (|AnyFunctions1| 33)
              (25 . |coerce|) |DROPT;colorFunction;M$;14|
              (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
              (|AnyFunctions1| 37) (30 . |coerce|) |DROPT;colorFunction;M$;15|
              (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|)
                         (|DoubleFloat|))
              (|AnyFunctions1| 41) (35 . |coerce|) |DROPT;colorFunction;M$;16|
              (|NonNegativeInteger|) (40 . >) (|List| (|Segment| 23))
              (|AnyFunctions1| 47) (46 . |coerce|) |DROPT;clip;L$;17|
              (|Mapping| (|Point| (|DoubleFloat|)) (|Point| (|DoubleFloat|)))
              (|AnyFunctions1| 51) (51 . |coerce|) |DROPT;coordinates;M$;18|
              |DROPT;tubeRadius;F$;19| |DROPT;range;L$;20|
              (|List| (|Segment| (|Fraction| (|Integer|))))
              (|AnyFunctions1| 57) (56 . |coerce|) |DROPT;range;L$;21|
              |DROPT;ranges;L$;22| (|ThreeSpace| (|DoubleFloat|))
              (|AnyFunctions1| 62) (61 . |coerce|) |DROPT;space;Ts$;23|
              (|PositiveInteger|) (|AnyFunctions1| 66) (66 . |coerce|)
              |DROPT;var1Steps;Pi$;24| |DROPT;var2Steps;Pi$;25|
              |DROPT;tubePoints;Pi$;26| |DROPT;coord;M$;27| (|List| 23)
              (|AnyFunctions1| 73) (71 . |coerce|) |DROPT;unit;L$;28|
              (|OutputForm|) (|Symbol|) (76 . |coerce|) (81 . |coerce|)
              (86 . =) |DROPT;coerce;$Of;29| (92 . =) |DROPT;=;2$B;30|
              (|List| $) |DROPT;option?;LSB;31| (|Union| 7 '"failed")
              |DROPT;option;LSU;32| (|SingleInteger|) (|HashState|))
           '#(~= 98 |viewpoint| 104 |var2Steps| 109 |var1Steps| 114 |unit| 119
              |tubeRadius| 124 |tubePoints| 129 |toScale| 134 |title| 139
              |style| 144 |space| 149 |ranges| 154 |range| 159 |pointColor| 169
              |option?| 179 |option| 185 |latex| 191 |hashUpdate!| 196 |hash|
              202 |curveColor| 207 |coordinates| 217 |coord| 222
              |colorFunction| 227 |coerce| 242 |clip| 247 |adaptive| 257 = 262)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 77))
                        (|makeByteWordVec2| 90
                                            '(1 9 7 8 10 1 13 7 12 14 1 18 7 17
                                              19 1 24 7 23 25 1 28 7 27 29 1 34
                                              7 33 35 1 38 7 37 39 1 42 7 41 43
                                              2 45 17 0 0 46 1 48 7 47 49 1 52
                                              7 51 53 1 58 7 57 59 1 63 7 62 64
                                              1 67 7 66 68 1 74 7 73 75 1 78 77
                                              0 79 1 7 77 0 80 2 77 0 0 0 81 2
                                              7 17 0 0 83 2 0 17 0 0 1 1 0 0 8
                                              11 1 0 0 66 70 1 0 0 66 69 1 0 0
                                              73 76 1 0 0 23 55 1 0 0 66 71 1 0
                                              0 17 20 1 0 0 12 15 1 0 0 12 16 1
                                              0 0 62 65 1 0 0 47 61 1 0 0 57 60
                                              1 0 0 47 56 1 0 0 27 30 1 0 0 23
                                              26 2 0 17 85 78 86 2 0 87 85 78
                                              88 1 0 12 0 1 2 0 90 90 0 1 1 0
                                              89 0 1 1 0 0 27 32 1 0 0 23 31 1
                                              0 0 51 54 1 0 0 51 72 1 0 0 37 40
                                              1 0 0 41 44 1 0 0 33 36 1 0 77 0
                                              82 1 0 0 47 50 1 0 0 17 21 1 0 0
                                              17 22 2 0 17 0 0 84)))))
           '|lookupComplete|)) 

(MAKEPROP '|DrawOption| 'NILADIC T) 
