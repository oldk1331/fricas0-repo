
(SDEFUN |GRIMAGE;numberCheck| ((|nums| |Point| (|DoubleFloat|)) ($ |Void|))
        (SPROG ((#1=#:G123 NIL) (#2=#:G119 NIL) (#3=#:G124 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |i| (SPADCALL |nums| (QREFELT $ 9))
                        . #4=(|GRIMAGE;numberCheck|))
                  (LETT #3# (SPADCALL |nums| (QREFELT $ 10)) . #4#) G190
                  (COND ((> |i| #3#) (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((COMPLEXP
                       (SPADCALL |nums|
                                 (PROG1 (LETT #2# |i| . #4#)
                                   (|check_subtype2| (> #2# 0)
                                                     '(|PositiveInteger|)
                                                     '(|Integer|) #2#))
                                 (QREFELT $ 12)))
                      (PROGN
                       (LETT #1#
                             (|error|
                              "An unexpected complex number was encountered in the calculations.")
                             . #4#)
                       (GO #5=#:G121))))))
                  (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
                #5# (EXIT #1#)))) 

(SDEFUN |GRIMAGE;doOptions| ((|g| |Rep|) ($ |Void|))
        (SPROG
         ((|lu| (|List| (|Float|))) (|lr| (|List| (|Segment| (|Float|)))))
         (SEQ
          (LETT |lr|
                (SPADCALL (QVELT |g| 7) (SPADCALL |g| (QREFELT $ 14))
                          (QREFELT $ 17))
                . #1=(|GRIMAGE;doOptions|))
          (COND
           ((SPADCALL (LENGTH |lr|) 1 (QREFELT $ 19))
            (QSETVELT |g| 1
                      (LIST
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |lr| 1 (QREFELT $ 21))
                                   (QREFELT $ 23))
                         (QREFELT $ 24))
                        (SPADCALL
                         (SPADCALL (SPADCALL |lr| 1 (QREFELT $ 21))
                                   (QREFELT $ 25))
                         (QREFELT $ 24))
                        (QREFELT $ 27))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |lr| 2 (QREFELT $ 21))
                                   (QREFELT $ 23))
                         (QREFELT $ 24))
                        (SPADCALL
                         (SPADCALL (SPADCALL |lr| 2 (QREFELT $ 21))
                                   (QREFELT $ 25))
                         (QREFELT $ 24))
                        (QREFELT $ 27)))))
           (#2='T (QSETVELT |g| 1 NIL)))
          (LETT |lu|
                (SPADCALL (QVELT |g| 7) (SPADCALL |g| (QREFELT $ 29))
                          (QREFELT $ 30))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL (LENGTH |lu|) 1 (QREFELT $ 19))
             (QSETVELT |g| 2
                       (LIST
                        (SPADCALL (SPADCALL |lu| 1 (QREFELT $ 31))
                                  (QREFELT $ 24))
                        (SPADCALL (SPADCALL |lu| 2 (QREFELT $ 31))
                                  (QREFELT $ 24)))))
            (#2# (QSETVELT |g| 2 NIL))))))) 

(SDEFUN |GRIMAGE;putColorInfo;LLL;3|
        ((|llp| |List| (|List| (|Point| (|DoubleFloat|))))
         (|listOfPalettes| |List| (|Palette|))
         ($ |List| (|List| (|Point| (|DoubleFloat|)))))
        (SPROG
         ((|llp2| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|lp2| (|List| (|Point| (|DoubleFloat|))))
          (|p| (|Point| (|DoubleFloat|))) (|d| (|PositiveInteger|))
          (#1=#:G139 NIL) (|daShade| (|DoubleFloat|)) (|daHue| (|DoubleFloat|))
          (#2=#:G137 NIL) (|lp| NIL) (#3=#:G138 NIL) (|pal| NIL))
         (SEQ (LETT |llp2| NIL . #4=(|GRIMAGE;putColorInfo;LLL;3|))
              (SEQ (LETT |pal| NIL . #4#) (LETT #3# |listOfPalettes| . #4#)
                   (LETT |lp| NIL . #4#) (LETT #2# |llp| . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |lp| (CAR #2#) . #4#) NIL)
                         (ATOM #3#) (PROGN (LETT |pal| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |lp2| NIL . #4#)
                        (LETT |daHue|
                              (FLOAT
                               (SPADCALL (SPADCALL |pal| (QREFELT $ 34))
                                         (QREFELT $ 35))
                               MOST-POSITIVE-DOUBLE-FLOAT)
                              . #4#)
                        (LETT |daShade|
                              (FLOAT (SPADCALL |pal| (QREFELT $ 36))
                                     MOST-POSITIVE-DOUBLE-FLOAT)
                              . #4#)
                        (SEQ (LETT |p| NIL . #4#) (LETT #1# |lp| . #4#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |p| (CAR #1#) . #4#) NIL))
                               (GO G191)))
                             (SEQ
                              (SEQ
                               (LETT |d| (SPADCALL |p| (QREFELT $ 38)) . #4#)
                               (EXIT
                                (COND
                                 ((< |d| 3)
                                  (LETT |p|
                                        (SPADCALL |p| (LIST |daHue| |daShade|)
                                                  (QREFELT $ 40))
                                        . #4#))
                                 ('T
                                  (SEQ (SPADCALL |p| 3 |daHue| (QREFELT $ 41))
                                       (EXIT
                                        (COND
                                         ((< |d| 4)
                                          (LETT |p|
                                                (SPADCALL |p| (LIST |daShade|)
                                                          (QREFELT $ 40))
                                                . #4#))
                                         ('T
                                          (SPADCALL |p| 4 |daShade|
                                                    (QREFELT $ 41))))))))))
                              (EXIT (LETT |lp2| (CONS |p| |lp2|) . #4#)))
                             (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |llp2| (CONS (NREVERSE |lp2|) |llp2|) . #4#)))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |llp2|))))) 

(SDEFUN |GRIMAGE;graph| ((|demRanges| |List| (|Segment| (|Float|))) ($ $))
        (SPROG ((|demRangesSF| (|List| (|Segment| (|DoubleFloat|)))))
               (SEQ
                (COND
                 ((NULL |demRanges|) (VECTOR 0 NIL NIL NIL NIL NIL NIL NIL))
                 ('T
                  (SEQ
                   (LETT |demRangesSF|
                         (LIST
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |demRanges| 1 (QREFELT $ 21))
                                      (QREFELT $ 23))
                            (QREFELT $ 24))
                           (SPADCALL
                            (SPADCALL (SPADCALL |demRanges| 1 (QREFELT $ 21))
                                      (QREFELT $ 25))
                            (QREFELT $ 24))
                           (QREFELT $ 27))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |demRanges| 1 (QREFELT $ 21))
                                      (QREFELT $ 23))
                            (QREFELT $ 24))
                           (SPADCALL
                            (SPADCALL (SPADCALL |demRanges| 1 (QREFELT $ 21))
                                      (QREFELT $ 25))
                            (QREFELT $ 24))
                           (QREFELT $ 27)))
                         |GRIMAGE;graph|)
                   (EXIT (VECTOR 0 |demRangesSF| NIL NIL NIL NIL NIL NIL)))))))) 

(SDEFUN |GRIMAGE;scaleStep|
        ((|range_seg| |Segment| (|DoubleFloat|)) ($ |DoubleFloat|))
        (SPROG
         ((|scaleDown| (|DoubleFloat|)) (|numerals| (|String|))
          (|tryStep| (|DoubleFloat|)) (|range| (|DoubleFloat|))
          (|adjust| (|NonNegativeInteger|)))
         (SEQ
          (LETT |range|
                (|sub_DF| (SPADCALL |range_seg| (QREFELT $ 45))
                          (SPADCALL |range_seg| (QREFELT $ 46)))
                . #1=(|GRIMAGE;scaleStep|))
          (LETT |adjust| 0 . #1#)
          (SEQ G190
               (COND
                ((NULL
                  (|less_DF| |range|
                             (SPADCALL (SPADCALL 100 0 10 (QREFELT $ 47))
                                       (QREFELT $ 48))))
                 (GO G191)))
               (SEQ (LETT |adjust| (+ |adjust| 1) . #1#)
                    (EXIT
                     (LETT |range|
                           (|mul_DF| |range|
                                     (SPADCALL
                                      (SPADCALL 10 0 10 (QREFELT $ 47))
                                      (QREFELT $ 48)))
                           . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |tryStep|
                (|div_DF| |range|
                          (SPADCALL (SPADCALL 10 0 10 (QREFELT $ 47))
                                    (QREFELT $ 48)))
                . #1#)
          (LETT |numerals|
                (STRINGIMAGE
                 (SPADCALL (SPADCALL |tryStep| (QREFELT $ 49)) (QREFELT $ 50)))
                . #1#)
          (LETT |scaleDown|
                (FLOAT (EXPT 10 (- (QCSIZE |numerals|) 1))
                       MOST-POSITIVE-DOUBLE-FLOAT)
                . #1#)
          (EXIT
           (|div_DF|
            (|mul_DF| |scaleDown|
                      (SPADCALL
                       (|sub_DF| (|div_DF| |tryStep| |scaleDown|)
                                 (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 47))
                                           (QREFELT $ 48)))
                       (QREFELT $ 49)))
            (FLOAT (EXPT 10 |adjust|) MOST-POSITIVE-DOUBLE-FLOAT)))))) 

(SDEFUN |GRIMAGE;figureUnits|
        ((|ranges| |List| (|Segment| (|DoubleFloat|)))
         ($ |List| (|DoubleFloat|)))
        (LIST (|GRIMAGE;scaleStep| (|SPADfirst| |ranges|) $)
              (|GRIMAGE;scaleStep| (SPADCALL |ranges| (QREFELT $ 52)) $))) 

(SDEFUN |GRIMAGE;roundRange|
        ((|range| |Segment| (|DoubleFloat|)) ($ |Segment| (|DoubleFloat|)))
        (SPROG
         ((|high| (|DoubleFloat|)) (|low| (|DoubleFloat|))
          (|single_eps| (|DoubleFloat|)))
         (SEQ
          (LETT |single_eps|
                (|expt_DF_I|
                 (SPADCALL (SPADCALL 2 0 10 (QREFELT $ 47)) (QREFELT $ 48))
                 -19)
                . #1=(|GRIMAGE;roundRange|))
          (LETT |low| (SPADCALL |range| (QREFELT $ 46)) . #1#)
          (LETT |low|
                (COND
                 ((|less_DF| (|abs_DF| |low|) 1.0)
                  (|sub_DF| |low| |single_eps|))
                 ((|less_DF| |low| 0.0)
                  (|mul_DF|
                   (|add_DF|
                    (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 47)) (QREFELT $ 48))
                    |single_eps|)
                   |low|))
                 (#2='T
                  (|mul_DF|
                   (|sub_DF|
                    (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 47)) (QREFELT $ 48))
                    |single_eps|)
                   |low|)))
                . #1#)
          (LETT |high| (SPADCALL |range| (QREFELT $ 45)) . #1#)
          (LETT |high|
                (COND
                 ((|less_DF| (|abs_DF| |high|) 1.0)
                  (|add_DF| |high| |single_eps|))
                 ((|less_DF| |high| 0.0)
                  (|mul_DF|
                   (|sub_DF|
                    (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 47)) (QREFELT $ 48))
                    |single_eps|)
                   |high|))
                 (#2#
                  (|mul_DF|
                   (|add_DF|
                    (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 47)) (QREFELT $ 48))
                    |single_eps|)
                   |high|)))
                . #1#)
          (EXIT (SPADCALL |low| |high| (QREFELT $ 55)))))) 

(SDEFUN |GRIMAGE;roundRanges|
        ((|ranges| |List| (|Segment| (|DoubleFloat|)))
         ($ |List| (|Segment| (|DoubleFloat|))))
        (LIST (|GRIMAGE;roundRange| (|SPADfirst| |ranges|) $)
              (|GRIMAGE;roundRange| (SPADCALL |ranges| (QREFELT $ 52)) $))) 

(SDEFUN |GRIMAGE;plotLists|
        ((|graf| |Rep|)
         (|listOfListsOfPoints| |List| (|List| (|Point| (|DoubleFloat|))))
         (|listOfPointColors| |List| (|Palette|))
         (|listOfLineColors| |List| (|Palette|))
         (|listOfPointSizes| |List| (|PositiveInteger|)) ($ $))
        (SPROG
         ((#1=#:G183 NIL) (|givenLen| #2=(|NonNegativeInteger|))
          (#3=#:G173 NIL) (#4=#:G163 NIL) (|len| #2#) (#5=#:G188 NIL) (|l| NIL)
          (#6=#:G187 NIL))
         (SEQ
          (LETT |givenLen| (LENGTH |listOfListsOfPoints|)
                . #7=(|GRIMAGE;plotLists|))
          (LETT |listOfListsOfPoints|
                (PROGN
                 (LETT #6# NIL . #7#)
                 (SEQ (LETT |l| NIL . #7#)
                      (LETT #5# |listOfListsOfPoints| . #7#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |l| (CAR #5#) . #7#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (COND (|l| (LETT #6# (CONS |l| #6#) . #7#)))))
                      (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (COND
           ((NULL |listOfListsOfPoints|)
            (|error|
             "GraphImage was given a list that contained no valid point lists")))
          (COND
           ((SPADCALL (LETT |len| (LENGTH |listOfListsOfPoints|) . #7#)
                      |givenLen| (QREFELT $ 57))
            (|sayBrightly|
             (LIST
              (SPADCALL "   Warning: Ignoring pointless point list"
                        (QREFELT $ 60))))))
          (QSETVELT |graf| 3 |listOfListsOfPoints|)
          (SEQ (LETT |givenLen| (LENGTH |listOfPointColors|) . #7#)
               (EXIT
                (COND
                 ((SPADCALL |givenLen| |len| (QREFELT $ 61))
                  (QSETVELT |graf| 4
                            (SPADCALL |listOfPointColors|
                                      (SPADCALL
                                       (+
                                        (PROG1
                                            (LETT #4# (- |len| |givenLen|)
                                                  . #7#)
                                          (|check_subtype2| (>= #4# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #4#))
                                        1)
                                       (SPADCALL (QREFELT $ 63))
                                       (QREFELT $ 64))
                                      (QREFELT $ 65))))
                 (#8='T
                  (QSETVELT |graf| 4
                            (SPADCALL |listOfPointColors| |len|
                                      (QREFELT $ 66)))))))
          (SEQ (LETT |givenLen| (LENGTH |listOfLineColors|) . #7#)
               (EXIT
                (COND
                 ((SPADCALL |givenLen| |len| (QREFELT $ 61))
                  (QSETVELT |graf| 5
                            (SPADCALL |listOfLineColors|
                                      (SPADCALL
                                       (+
                                        (PROG1
                                            (LETT #3# (- |len| |givenLen|)
                                                  . #7#)
                                          (|check_subtype2| (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #3#))
                                        1)
                                       (SPADCALL (QREFELT $ 67))
                                       (QREFELT $ 64))
                                      (QREFELT $ 65))))
                 (#8#
                  (QSETVELT |graf| 5
                            (SPADCALL |listOfLineColors| |len|
                                      (QREFELT $ 66)))))))
          (SEQ (LETT |givenLen| (LENGTH |listOfPointSizes|) . #7#)
               (EXIT
                (COND
                 ((SPADCALL |givenLen| |len| (QREFELT $ 61))
                  (QSETVELT |graf| 6
                            (SPADCALL |listOfPointSizes|
                                      (SPADCALL
                                       (+
                                        (PROG1
                                            (LETT #1# (- |len| |givenLen|)
                                                  . #7#)
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        1)
                                       (SPADCALL (QREFELT $ 68))
                                       (QREFELT $ 70))
                                      (QREFELT $ 71))))
                 (#8#
                  (QSETVELT |graf| 6
                            (SPADCALL |listOfPointSizes| |len|
                                      (QREFELT $ 72)))))))
          (EXIT |graf|)))) 

(SDEFUN |GRIMAGE;sendGraphImage;$V;10| ((|graf| $) ($ |Void|))
        (SPROG
         ((|hueShade| (|Integer|)) (|aPoint| #1=(|Point| (|DoubleFloat|)))
          (#2=#:G205 NIL) (|p| NIL) (#3=#:G201 NIL) (|aList| NIL)
          (#4=#:G202 NIL) (|pColor| NIL) (#5=#:G203 NIL) (|lColor| NIL)
          (#6=#:G204 NIL) (|s| (|NonNegativeInteger|))
          (|tonto| (|List| (|Segment| (|DoubleFloat|))))
          (|transform| (|Mapping| #1# (|Point| (|DoubleFloat|)))))
         (SEQ (|GRIMAGE;doOptions| |graf| $)
              (LETT |s| (LENGTH (QVELT |graf| 3))
                    . #7=(|GRIMAGE;sendGraphImage;$V;10|))
              (EXIT
               (COND
                ((EQL |s| 0)
                 (|error| "You are trying to make a graph with no points"))
                ((SPADCALL (SPADCALL |graf| (QREFELT $ 73)) 0 (QREFELT $ 74))
                 (|error| "You are trying to draw over an existing graph"))
                ('T
                 (SEQ
                  (LETT |transform|
                        (SPADCALL (QVELT |graf| 7) (ELT $ 76) (QREFELT $ 78))
                        . #7#)
                  (QSETVELT |graf| 3
                            (SPADCALL (QVELT |graf| 3) (QVELT |graf| 4)
                                      (QREFELT $ 44)))
                  (COND
                   ((NULL (SPADCALL |graf| (QREFELT $ 14)))
                    (QSETVELT |graf| 1
                              (SPADCALL (QVELT |graf| 3) (QREFELT $ 80)))))
                  (QSETVELT |graf| 1
                            (|GRIMAGE;roundRanges| (QVELT |graf| 1) $))
                  (COND
                   ((NULL (SPADCALL |graf| (QREFELT $ 29)))
                    (QSETVELT |graf| 2
                              (|GRIMAGE;figureUnits| (QVELT |graf| 1) $))))
                  (|sayBrightly|
                   (LIST
                    (SPADCALL
                     "   Graph data being transmitted to the viewport manager..."
                     (QREFELT $ 81))))
                  (|sockSendInt| |$ViewportServer| 2)
                  (|sockSendInt| |$ViewportServer| -1)
                  (LETT |tonto| (QVELT |graf| 1) . #7#)
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (|SPADfirst| |tonto|)
                                             (QREFELT $ 46)))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (|SPADfirst| |tonto|)
                                             (QREFELT $ 45)))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (SPADCALL |tonto| (QREFELT $ 52))
                                             (QREFELT $ 46)))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (SPADCALL |tonto| (QREFELT $ 52))
                                             (QREFELT $ 45)))
                  (|sockSendFloat| |$ViewportServer|
                                   (|SPADfirst| (QVELT |graf| 2)))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (QVELT |graf| 2) (QREFELT $ 82)))
                  (|sockSendInt| |$ViewportServer| |s|)
                  (SEQ (LETT |s| NIL . #7#) (LETT #6# (QVELT |graf| 6) . #7#)
                       (LETT |lColor| NIL . #7#)
                       (LETT #5# (QVELT |graf| 5) . #7#)
                       (LETT |pColor| NIL . #7#)
                       (LETT #4# (QVELT |graf| 4) . #7#)
                       (LETT |aList| NIL . #7#)
                       (LETT #3# (QVELT |graf| 3) . #7#) G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |aList| (CAR #3#) . #7#) NIL)
                             (ATOM #4#)
                             (PROGN (LETT |pColor| (CAR #4#) . #7#) NIL)
                             (ATOM #5#)
                             (PROGN (LETT |lColor| (CAR #5#) . #7#) NIL)
                             (ATOM #6#) (PROGN (LETT |s| (CAR #6#) . #7#) NIL))
                         (GO G191)))
                       (SEQ (|sockSendInt| |$ViewportServer| (LENGTH |aList|))
                            (SEQ (LETT |p| NIL . #7#) (LETT #2# |aList| . #7#)
                                 G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT |p| (CAR #2#) . #7#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |aPoint| (SPADCALL |p| |transform|)
                                        . #7#)
                                  (|sockSendFloat| |$ViewportServer|
                                                   (SPADCALL |aPoint|
                                                             (QREFELT $ 84)))
                                  (|sockSendFloat| |$ViewportServer|
                                                   (SPADCALL |aPoint|
                                                             (QREFELT $ 85)))
                                  (|sockSendFloat| |$ViewportServer|
                                                   (SPADCALL |p|
                                                             (QREFELT $ 86)))
                                  (EXIT
                                   (|sockSendFloat| |$ViewportServer|
                                                    (SPADCALL |p|
                                                              (QREFELT $
                                                                       87)))))
                                 (LETT #2# (CDR #2#) . #7#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |hueShade|
                                  (+
                                   (SPADCALL (SPADCALL |pColor| (QREFELT $ 34))
                                             (QREFELT $ 35))
                                   (* (SPADCALL |pColor| (QREFELT $ 36))
                                      (SPADCALL (QREFELT $ 88))))
                                  . #7#)
                            (|sockSendInt| |$ViewportServer| |hueShade|)
                            (LETT |hueShade|
                                  (+
                                   (SPADCALL
                                    (-
                                     (SPADCALL
                                      (SPADCALL |lColor| (QREFELT $ 34))
                                      (QREFELT $ 35))
                                     1)
                                    5 (QREFELT $ 90))
                                   (SPADCALL |lColor| (QREFELT $ 36)))
                                  . #7#)
                            (|sockSendInt| |$ViewportServer| |hueShade|)
                            (EXIT (|sockSendInt| |$ViewportServer| |s|)))
                       (LETT #3#
                             (PROG1 (CDR #3#)
                               (LETT #4#
                                     (PROG1 (CDR #4#)
                                       (LETT #5#
                                             (PROG1 (CDR #5#)
                                               (LETT #6# (CDR #6#) . #7#))
                                             . #7#))
                                     . #7#))
                             . #7#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (QSETVELT |graf| 0 (|sockGetInt| |$ViewportServer|)))))))))) 

(PUT '|GRIMAGE;key;$I;11| '|SPADreplace| '(XLAM (|graf|) (QVELT |graf| 0))) 

(SDEFUN |GRIMAGE;key;$I;11| ((|graf| $) ($ |Integer|)) (QVELT |graf| 0)) 

(PUT '|GRIMAGE;pointLists;$L;12| '|SPADreplace|
     '(XLAM (|graf|) (QVELT |graf| 3))) 

(SDEFUN |GRIMAGE;pointLists;$L;12|
        ((|graf| $) ($ |List| (|List| (|Point| (|DoubleFloat|)))))
        (QVELT |graf| 3)) 

(SDEFUN |GRIMAGE;ranges;$L;13| ((|graf| $) ($ |List| (|Segment| (|Float|))))
        (COND ((NULL (QVELT |graf| 1)) NIL)
              ('T
               (LIST
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 1 (QREFELT $ 94))
                            (QREFELT $ 46))
                  (QREFELT $ 95))
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 1 (QREFELT $ 94))
                            (QREFELT $ 45))
                  (QREFELT $ 95))
                 (QREFELT $ 96))
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 2 (QREFELT $ 94))
                            (QREFELT $ 46))
                  (QREFELT $ 95))
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 2 (QREFELT $ 94))
                            (QREFELT $ 45))
                  (QREFELT $ 95))
                 (QREFELT $ 96)))))) 

(SDEFUN |GRIMAGE;ranges;$2L;14|
        ((|graf| $) (|rangesList| |List| (|Segment| (|Float|)))
         ($ |List| (|Segment| (|Float|))))
        (SEQ
         (QSETVELT |graf| 1
                   (LIST
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |rangesList| 1 (QREFELT $ 21))
                                (QREFELT $ 23))
                      (QREFELT $ 24))
                     (SPADCALL
                      (SPADCALL (SPADCALL |rangesList| 1 (QREFELT $ 21))
                                (QREFELT $ 25))
                      (QREFELT $ 24))
                     (QREFELT $ 27))
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |rangesList| 2 (QREFELT $ 21))
                                (QREFELT $ 23))
                      (QREFELT $ 24))
                     (SPADCALL
                      (SPADCALL (SPADCALL |rangesList| 2 (QREFELT $ 21))
                                (QREFELT $ 25))
                      (QREFELT $ 24))
                     (QREFELT $ 27))))
         (EXIT |rangesList|))) 

(SDEFUN |GRIMAGE;units;$L;15| ((|graf| $) ($ |List| (|Float|)))
        (COND ((NULL (QVELT |graf| 2)) NIL)
              ('T
               (LIST
                (SPADCALL (SPADCALL (QVELT |graf| 2) 1 (QREFELT $ 98))
                          (QREFELT $ 95))
                (SPADCALL (SPADCALL (QVELT |graf| 2) 2 (QREFELT $ 98))
                          (QREFELT $ 95)))))) 

(SDEFUN |GRIMAGE;units;$2L;16|
        ((|graf| $) (|unitsToBe| |List| (|Float|)) ($ |List| (|Float|)))
        (SEQ
         (QSETVELT |graf| 2
                   (LIST
                    (SPADCALL (SPADCALL |unitsToBe| 1 (QREFELT $ 31))
                              (QREFELT $ 24))
                    (SPADCALL (SPADCALL |unitsToBe| 2 (QREFELT $ 31))
                              (QREFELT $ 24))))
         (EXIT |unitsToBe|))) 

(SDEFUN |GRIMAGE;graphImage;$;17| (($ $)) (|GRIMAGE;graph| NIL $)) 

(SDEFUN |GRIMAGE;makeGraphImage;L$;18|
        ((|llp| |List| (|List| (|Point| (|DoubleFloat|)))) ($ $))
        (SPROG
         ((#1=#:G227 NIL) (|i| NIL) (#2=#:G226 NIL) (#3=#:G225 NIL)
          (#4=#:G224 NIL) (#5=#:G223 NIL) (|l| (|Integer|)) (#6=#:G222 NIL))
         (SEQ
          (SPADCALL |llp|
                    (PROGN
                     (LETT #6# NIL . #7=(|GRIMAGE;makeGraphImage;L$;18|))
                     (SEQ (LETT |i| 1 . #7#)
                          (LETT #5# (LETT |l| (LENGTH |llp|) . #7#) . #7#) G190
                          (COND ((|greater_SI| |i| #5#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6# (CONS (SPADCALL (QREFELT $ 63)) #6#)
                                  . #7#)))
                          (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    (PROGN
                     (LETT #4# NIL . #7#)
                     (SEQ (LETT |i| 1 . #7#) (LETT #3# |l| . #7#) G190
                          (COND ((|greater_SI| |i| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4# (CONS (SPADCALL (QREFELT $ 67)) #4#)
                                  . #7#)))
                          (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    (PROGN
                     (LETT #2# NIL . #7#)
                     (SEQ (LETT |i| 1 . #7#) (LETT #1# |l| . #7#) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL (QREFELT $ 68)) #2#)
                                  . #7#)))
                          (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (QREFELT $ 101))))) 

(SDEFUN |GRIMAGE;makeGraphImage;L2LL$;19|
        ((|llp| |List| (|List| (|Point| (|DoubleFloat|))))
         (|lpc| |List| (|Palette|)) (|llc| |List| (|Palette|))
         (|lps| |List| (|PositiveInteger|)) ($ $))
        (SPADCALL |llp| |lpc| |llc| |lps| NIL (QREFELT $ 103))) 

(SDEFUN |GRIMAGE;makeGraphImage;L2LLL$;20|
        ((|llp| |List| (|List| (|Point| (|DoubleFloat|))))
         (|lpc| |List| (|Palette|)) (|llc| |List| (|Palette|))
         (|lps| |List| (|PositiveInteger|)) (|opts| |List| (|DrawOption|))
         ($ $))
        (SPROG
         ((|aPoint| #1=(|Point| (|DoubleFloat|))) (#2=#:G236 NIL) (|p| NIL)
          (#3=#:G235 NIL) (|aList| NIL)
          (|transform| (|Mapping| #1# (|Point| (|DoubleFloat|)))) (|graf| ($)))
         (SEQ
          (LETT |graf| (|GRIMAGE;graph| (SPADCALL |opts| NIL (QREFELT $ 17)) $)
                . #4=(|GRIMAGE;makeGraphImage;L2LLL$;20|))
          (QSETVELT |graf| 7 |opts|)
          (LETT |graf| (|GRIMAGE;plotLists| |graf| |llp| |lpc| |llc| |lps| $)
                . #4#)
          (LETT |transform|
                (SPADCALL (QVELT |graf| 7) (ELT $ 76) (QREFELT $ 78)) . #4#)
          (SEQ (LETT |aList| NIL . #4#) (LETT #3# (QVELT |graf| 3) . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |aList| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |p| NIL . #4#) (LETT #2# |aList| . #4#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ (LETT |aPoint| (SPADCALL |p| |transform|) . #4#)
                           (EXIT (|GRIMAGE;numberCheck| |aPoint| $)))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |graf|)))) 

(SDEFUN |GRIMAGE;component;$L2PPiV;21|
        ((|graf| $) (|ListOfPoints| |List| (|Point| (|DoubleFloat|)))
         (|PointColor| |Palette|) (|LineColor| |Palette|)
         (|PointSize| |PositiveInteger|) ($ |Void|))
        (SEQ
         (QSETVELT |graf| 3
                   (SPADCALL (QVELT |graf| 3) (LIST |ListOfPoints|)
                             (QREFELT $ 104)))
         (QSETVELT |graf| 4
                   (SPADCALL (QVELT |graf| 4) (LIST |PointColor|)
                             (QREFELT $ 105)))
         (QSETVELT |graf| 5
                   (SPADCALL (QVELT |graf| 5) (LIST |LineColor|)
                             (QREFELT $ 105)))
         (EXIT
          (QSETVELT |graf| 6
                    (SPADCALL (QVELT |graf| 6) (LIST |PointSize|)
                              (QREFELT $ 106)))))) 

(SDEFUN |GRIMAGE;component;$PV;22|
        ((|graf| $) (|aPoint| |Point| (|DoubleFloat|)) ($ |Void|))
        (SPADCALL |graf| |aPoint| (SPADCALL (QREFELT $ 63))
                  (SPADCALL (QREFELT $ 67)) (SPADCALL (QREFELT $ 68))
                  (QREFELT $ 109))) 

(SDEFUN |GRIMAGE;component;$P2PPiV;23|
        ((|graf| $) (|aPoint| |Point| (|DoubleFloat|)) (|PointColor| |Palette|)
         (|LineColor| |Palette|) (|PointSize| |PositiveInteger|) ($ |Void|))
        (SPADCALL |graf| (LIST |aPoint|) |PointColor| |LineColor| |PointSize|
                  (QREFELT $ 108))) 

(SDEFUN |GRIMAGE;appendPoint;$PV;24|
        ((|graf| $) (|aPoint| |Point| (|DoubleFloat|)) ($ |Void|))
        (SPROG ((|num| (|Integer|)))
               (SEQ
                (LETT |num| (- (LENGTH (QVELT |graf| 3)) 1)
                      |GRIMAGE;appendPoint;$PV;24|)
                (EXIT
                 (COND ((< |num| 0) (|error| "No point lists to append to!"))
                       ('T
                        (SPADCALL (QVELT |graf| 3) |num|
                                  (SPADCALL
                                   (SPADCALL (QVELT |graf| 3) |num|
                                             (QREFELT $ 111))
                                   (LIST |aPoint|) (QREFELT $ 112))
                                  (QREFELT $ 113)))))))) 

(SDEFUN |GRIMAGE;point;$PPV;25|
        ((|graf| $) (|aPoint| |Point| (|DoubleFloat|)) (|PointColor| |Palette|)
         ($ |Void|))
        (SPADCALL |graf| |aPoint| |PointColor| (SPADCALL (QREFELT $ 67))
                  (SPADCALL (QREFELT $ 68)) (QREFELT $ 109))) 

(SDEFUN |GRIMAGE;coerce;L$;26|
        ((|llp| |List| (|List| (|Point| (|DoubleFloat|)))) ($ $))
        (SPROG
         ((#1=#:G254 NIL) (|i| NIL) (#2=#:G253 NIL) (#3=#:G252 NIL)
          (#4=#:G251 NIL) (#5=#:G250 NIL) (|l| (|Integer|)) (#6=#:G249 NIL))
         (SEQ
          (SPADCALL |llp|
                    (PROGN
                     (LETT #6# NIL . #7=(|GRIMAGE;coerce;L$;26|))
                     (SEQ (LETT |i| 1 . #7#)
                          (LETT #5# (LETT |l| (LENGTH |llp|) . #7#) . #7#) G190
                          (COND ((|greater_SI| |i| #5#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6# (CONS (SPADCALL (QREFELT $ 63)) #6#)
                                  . #7#)))
                          (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    (PROGN
                     (LETT #4# NIL . #7#)
                     (SEQ (LETT |i| 1 . #7#) (LETT #3# |l| . #7#) G190
                          (COND ((|greater_SI| |i| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4# (CONS (SPADCALL (QREFELT $ 67)) #4#)
                                  . #7#)))
                          (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    (PROGN
                     (LETT #2# NIL . #7#)
                     (SEQ (LETT |i| 1 . #7#) (LETT #1# |l| . #7#) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL (QREFELT $ 68)) #2#)
                                  . #7#)))
                          (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (QREFELT $ 101))))) 

(SDEFUN |GRIMAGE;coerce;$Of;27| ((|graf| $) ($ |OutputForm|))
        (SPROG ((|p| (|NonNegativeInteger|)))
               (SPADCALL
                (LIST (SPADCALL "Graph with " (QREFELT $ 81))
                      (SPADCALL
                       (LETT |p| (LENGTH (SPADCALL |graf| (QREFELT $ 93)))
                             |GRIMAGE;coerce;$Of;27|)
                       (QREFELT $ 117))
                      (SPADCALL
                       (COND ((EQL |p| 1) " point list") ('T " point lists"))
                       (QREFELT $ 81)))
                (QREFELT $ 119)))) 

(DECLAIM (NOTINLINE |GraphImage;|)) 

(DEFUN |GraphImage| ()
  (SPROG NIL
         (PROG (#1=#:G257)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|GraphImage|)
                    . #2=(|GraphImage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|GraphImage|
                             (LIST (CONS NIL (CONS 1 (|GraphImage;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|GraphImage|)))))))))) 

(DEFUN |GraphImage;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|GraphImage|) . #1=(|GraphImage|))
          (LETT $ (GETREFV 122) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|GraphImage| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |key| (|Integer|))
                              (|:| |rangesField|
                                   (|List| (|Segment| (|DoubleFloat|))))
                              (|:| |unitsField| (|List| (|DoubleFloat|)))
                              (|:| |llPoints|
                                   (|List| (|List| (|Point| (|DoubleFloat|)))))
                              (|:| |pointColors| (|List| (|Palette|)))
                              (|:| |lineColors| (|List| (|Palette|)))
                              (|:| |pointSizes| (|List| (|PositiveInteger|)))
                              (|:| |optionsField| (|List| (|DrawOption|)))))
          $))) 

(MAKEPROP '|GraphImage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Integer|) (|Point| 11)
              (0 . |minIndex|) (5 . |maxIndex|) (|DoubleFloat|) (10 . |elt|)
              (|List| 20) |GRIMAGE;ranges;$L;13| (|List| (|DrawOption|))
              (|DrawOptionFunctions0|) (16 . |ranges|) (|Boolean|) (22 . >)
              (|Segment| 22) (28 . |elt|) (|Float|) (34 . |lo|)
              (39 . |convert|) (44 . |hi|) (|Segment| 11) (49 . |segment|)
              (|List| 22) |GRIMAGE;units;$L;15| (55 . |units|) (61 . |elt|)
              (|Color|) (|Palette|) (67 . |hue|) (72 . |hue|) (77 . |shade|)
              (|PositiveInteger|) (82 . |dimension|) (|List| 11)
              (87 . |extend|) (93 . |setelt!|) (|List| 107) (|List| 33)
              |GRIMAGE;putColorInfo;LLL;3| (100 . |hi|) (105 . |lo|)
              (110 . |float|) (117 . |coerce|) (122 . |ceiling|)
              (127 . |retract|) (|List| 26) (132 . |second|) (137 . |Zero|)
              (141 . |One|) (145 . SEGMENT) (|NonNegativeInteger|) (151 . ~=)
              (|OutputForm|) (|String|) (157 . |coerce|) (162 . >)
              (|ViewDefaultsPackage|) (168 . |pointColorDefault|) (172 . |new|)
              (178 . |concat|) (184 . |first|) (190 . |lineColorDefault|)
              (194 . |pointSizeDefault|) (|List| 37) (198 . |new|)
              (204 . |concat|) (210 . |first|) |GRIMAGE;key;$I;11| (216 . ~=)
              (|CoordinateSystems| 11) (222 . |cartesian|) (|Mapping| 8 8)
              (227 . |coord|) (|PlotTools|) (233 . |calcRanges|)
              (238 . |message|) (243 . |second|) (|PointPackage| 11)
              (248 . |xCoord|) (253 . |yCoord|) (258 . |hue|) (263 . |shade|)
              (268 . |numberOfHues|) (|SingleInteger|) (272 . *) (|Void|)
              |GRIMAGE;sendGraphImage;$V;10| |GRIMAGE;pointLists;$L;12|
              (278 . |elt|) (284 . |convert|) (289 . |segment|)
              |GRIMAGE;ranges;$2L;14| (295 . |elt|) |GRIMAGE;units;$2L;16|
              |GRIMAGE;graphImage;$;17| |GRIMAGE;makeGraphImage;L2LL$;19|
              |GRIMAGE;makeGraphImage;L$;18| |GRIMAGE;makeGraphImage;L2LLL$;20|
              (301 . |append|) (307 . |append|) (313 . |append|) (|List| 8)
              |GRIMAGE;component;$L2PPiV;21| |GRIMAGE;component;$P2PPiV;23|
              |GRIMAGE;component;$PV;22| (319 . |elt|) (325 . |append|)
              (331 . |setelt!|) |GRIMAGE;appendPoint;$PV;24|
              |GRIMAGE;point;$PPV;25| |GRIMAGE;coerce;L$;26| (338 . |coerce|)
              (|List| $) (343 . |hconcat|) |GRIMAGE;coerce;$Of;27|
              (|HashState|))
           '#(~= 348 |units| 354 |sendGraphImage| 365 |ranges| 370
              |putColorInfo| 381 |pointLists| 387 |point| 392 |makeGraphImage|
              399 |latex| 421 |key| 426 |hashUpdate!| 431 |hash| 437
              |graphImage| 442 |component| 446 |coerce| 470 |appendPoint| 480 =
              486)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 58))
                        (|makeByteWordVec2| 121
                                            '(1 8 7 0 9 1 8 7 0 10 2 8 11 0 7
                                              12 2 16 13 15 13 17 2 7 18 0 0 19
                                              2 13 20 0 7 21 1 20 22 0 23 1 22
                                              11 0 24 1 20 22 0 25 2 26 0 11 11
                                              27 2 16 28 15 28 30 2 28 22 0 7
                                              31 1 33 32 0 34 1 32 7 0 35 1 33
                                              7 0 36 1 8 37 0 38 2 8 0 0 39 40
                                              3 8 11 0 7 11 41 1 26 11 0 45 1
                                              26 11 0 46 3 22 0 7 7 37 47 1 22
                                              11 0 48 1 11 0 0 49 1 11 7 0 50 1
                                              51 26 0 52 0 22 0 53 0 22 0 54 2
                                              26 0 11 11 55 2 56 18 0 0 57 1 59
                                              58 0 60 2 56 18 0 0 61 0 62 33 63
                                              2 43 0 56 33 64 2 43 0 0 0 65 2
                                              43 0 0 56 66 0 62 33 67 0 62 37
                                              68 2 69 0 56 37 70 2 69 0 0 0 71
                                              2 69 0 0 56 72 2 7 18 0 0 74 1 75
                                              8 8 76 2 16 77 15 77 78 1 79 51
                                              42 80 1 58 0 59 81 1 39 11 0 82 1
                                              83 11 8 84 1 83 11 8 85 1 83 11 8
                                              86 1 83 11 8 87 0 32 37 88 2 89 0
                                              7 0 90 2 51 26 0 7 94 1 11 22 0
                                              95 2 20 0 22 22 96 2 39 11 0 7 98
                                              2 42 0 0 0 104 2 43 0 0 0 105 2
                                              69 0 0 0 106 2 42 107 0 7 111 2
                                              107 0 0 0 112 3 42 107 0 7 107
                                              113 1 56 58 0 117 1 58 0 118 119
                                              2 0 18 0 0 1 1 0 28 0 29 2 0 28 0
                                              28 99 1 0 91 0 92 2 0 13 0 13 97
                                              1 0 13 0 14 2 0 42 42 43 44 1 0
                                              42 0 93 3 0 91 0 8 33 115 4 0 0
                                              42 43 43 69 101 5 0 0 42 43 43 69
                                              15 103 1 0 0 42 102 1 0 59 0 1 1
                                              0 7 0 73 2 0 121 121 0 1 1 0 89 0
                                              1 0 0 0 100 2 0 91 0 8 110 5 0 91
                                              0 8 33 33 37 109 5 0 91 0 107 33
                                              33 37 108 1 0 0 42 116 1 0 58 0
                                              120 2 0 91 0 8 114 2 0 18 0 0
                                              1)))))
           '|lookupComplete|)) 

(MAKEPROP '|GraphImage| 'NILADIC T) 
