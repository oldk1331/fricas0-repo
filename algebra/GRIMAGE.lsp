
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
         ((#1=#:G177 NIL) (|givenLen| #2=(|NonNegativeInteger|))
          (#3=#:G169 NIL) (#4=#:G161 NIL) (|len| #2#) (#5=#:G182 NIL) (|l| NIL)
          (#6=#:G181 NIL))
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
                      (SEQ
                       (EXIT
                        (COND
                         ((COND ((NULL |l|) 'NIL) (#8='T 'T))
                          (LETT #6# (CONS |l| #6#) . #7#)))))
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
             (LIST "   Warning: Ignoring pointless point list"))))
          (QSETVELT |graf| 3 |listOfListsOfPoints|)
          (SEQ (LETT |givenLen| (LENGTH |listOfPointColors|) . #7#)
               (EXIT
                (COND
                 ((SPADCALL |givenLen| |len| (QREFELT $ 58))
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
                                       (SPADCALL (QREFELT $ 60))
                                       (QREFELT $ 61))
                                      (QREFELT $ 62))))
                 (#8#
                  (QSETVELT |graf| 4
                            (SPADCALL |listOfPointColors| |len|
                                      (QREFELT $ 63)))))))
          (SEQ (LETT |givenLen| (LENGTH |listOfLineColors|) . #7#)
               (EXIT
                (COND
                 ((SPADCALL |givenLen| |len| (QREFELT $ 58))
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
                                       (SPADCALL (QREFELT $ 64))
                                       (QREFELT $ 61))
                                      (QREFELT $ 62))))
                 (#8#
                  (QSETVELT |graf| 5
                            (SPADCALL |listOfLineColors| |len|
                                      (QREFELT $ 63)))))))
          (SEQ (LETT |givenLen| (LENGTH |listOfPointSizes|) . #7#)
               (EXIT
                (COND
                 ((SPADCALL |givenLen| |len| (QREFELT $ 58))
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
                                       (SPADCALL (QREFELT $ 65))
                                       (QREFELT $ 67))
                                      (QREFELT $ 68))))
                 (#8#
                  (QSETVELT |graf| 6
                            (SPADCALL |listOfPointSizes| |len|
                                      (QREFELT $ 69)))))))
          (EXIT |graf|)))) 

(SDEFUN |GRIMAGE;sendGraphImage;$V;10| ((|graf| $) ($ |Void|))
        (SPROG
         ((|hueShade| (|Integer|)) (|aPoint| #1=(|Point| (|DoubleFloat|)))
          (#2=#:G199 NIL) (|p| NIL) (#3=#:G195 NIL) (|aList| NIL)
          (#4=#:G196 NIL) (|pColor| NIL) (#5=#:G197 NIL) (|lColor| NIL)
          (#6=#:G198 NIL) (|s| (|NonNegativeInteger|))
          (|tonto| (|List| (|Segment| (|DoubleFloat|))))
          (|transform| (|Mapping| #1# (|Point| (|DoubleFloat|)))))
         (SEQ (|GRIMAGE;doOptions| |graf| $)
              (LETT |s| (LENGTH (QVELT |graf| 3))
                    . #7=(|GRIMAGE;sendGraphImage;$V;10|))
              (EXIT
               (COND
                ((EQL |s| 0)
                 (|error| "You are trying to make a graph with no points"))
                ((SPADCALL (SPADCALL |graf| (QREFELT $ 70)) 0 (QREFELT $ 71))
                 (|error| "You are trying to draw over an existing graph"))
                ('T
                 (SEQ
                  (LETT |transform|
                        (SPADCALL (QVELT |graf| 7) (ELT $ 73) (QREFELT $ 75))
                        . #7#)
                  (QSETVELT |graf| 3
                            (SPADCALL (QVELT |graf| 3) (QVELT |graf| 4)
                                      (QREFELT $ 44)))
                  (COND
                   ((NULL (SPADCALL |graf| (QREFELT $ 14)))
                    (QSETVELT |graf| 1
                              (SPADCALL (QVELT |graf| 3) (QREFELT $ 77)))))
                  (QSETVELT |graf| 1
                            (|GRIMAGE;roundRanges| (QVELT |graf| 1) $))
                  (COND
                   ((NULL (SPADCALL |graf| (QREFELT $ 29)))
                    (QSETVELT |graf| 2
                              (|GRIMAGE;figureUnits| (QVELT |graf| 1) $))))
                  (|sayBrightly|
                   (LIST
                    "   Graph data being transmitted to the viewport manager..."))
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
                                   (SPADCALL (QVELT |graf| 2) (QREFELT $ 78)))
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
                                                             (QREFELT $ 80)))
                                  (|sockSendFloat| |$ViewportServer|
                                                   (SPADCALL |aPoint|
                                                             (QREFELT $ 81)))
                                  (|sockSendFloat| |$ViewportServer|
                                                   (SPADCALL |p|
                                                             (QREFELT $ 82)))
                                  (EXIT
                                   (|sockSendFloat| |$ViewportServer|
                                                    (SPADCALL |p|
                                                              (QREFELT $
                                                                       83)))))
                                 (LETT #2# (CDR #2#) . #7#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |hueShade|
                                  (+
                                   (SPADCALL (SPADCALL |pColor| (QREFELT $ 34))
                                             (QREFELT $ 35))
                                   (* (SPADCALL |pColor| (QREFELT $ 36))
                                      (SPADCALL (QREFELT $ 84))))
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
                                    5 (QREFELT $ 86))
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
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 1 (QREFELT $ 90))
                            (QREFELT $ 46))
                  (QREFELT $ 91))
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 1 (QREFELT $ 90))
                            (QREFELT $ 45))
                  (QREFELT $ 91))
                 (QREFELT $ 92))
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 2 (QREFELT $ 90))
                            (QREFELT $ 46))
                  (QREFELT $ 91))
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 2 (QREFELT $ 90))
                            (QREFELT $ 45))
                  (QREFELT $ 91))
                 (QREFELT $ 92)))))) 

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
                (SPADCALL (SPADCALL (QVELT |graf| 2) 1 (QREFELT $ 94))
                          (QREFELT $ 91))
                (SPADCALL (SPADCALL (QVELT |graf| 2) 2 (QREFELT $ 94))
                          (QREFELT $ 91)))))) 

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
         ((|i| NIL) (#1=#:G219 NIL) (#2=#:G218 NIL) (#3=#:G217 NIL)
          (|l| (|Integer|)) (#4=#:G216 NIL))
         (SEQ
          (SPADCALL |llp|
                    (PROGN
                     (LETT #4# NIL . #5=(|GRIMAGE;makeGraphImage;L$;18|))
                     (SEQ (LETT |i| 1 . #5#)
                          (LETT #3# (LETT |l| (LENGTH |llp|) . #5#) . #5#) G190
                          (COND ((|greater_SI| |i| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4# (CONS (SPADCALL (QREFELT $ 60)) #4#)
                                  . #5#)))
                          (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    (PROGN
                     (LETT #2# NIL . #5#)
                     (SEQ (LETT |i| 1 . #5#) G190
                          (COND ((|greater_SI| |i| |l|) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL (QREFELT $ 64)) #2#)
                                  . #5#)))
                          (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (PROGN
                     (LETT #1# NIL . #5#)
                     (SEQ (LETT |i| 1 . #5#) G190
                          (COND ((|greater_SI| |i| |l|) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1# (CONS (SPADCALL (QREFELT $ 65)) #1#)
                                  . #5#)))
                          (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #1#))))
                    (QREFELT $ 97))))) 

(SDEFUN |GRIMAGE;makeGraphImage;L2LL$;19|
        ((|llp| |List| (|List| (|Point| (|DoubleFloat|))))
         (|lpc| |List| (|Palette|)) (|llc| |List| (|Palette|))
         (|lps| |List| (|PositiveInteger|)) ($ $))
        (SPADCALL |llp| |lpc| |llc| |lps| NIL (QREFELT $ 99))) 

(SDEFUN |GRIMAGE;makeGraphImage;L2LLL$;20|
        ((|llp| |List| (|List| (|Point| (|DoubleFloat|))))
         (|lpc| |List| (|Palette|)) (|llc| |List| (|Palette|))
         (|lps| |List| (|PositiveInteger|)) (|opts| |List| (|DrawOption|))
         ($ $))
        (SPROG
         ((|aPoint| #1=(|Point| (|DoubleFloat|))) (#2=#:G228 NIL) (|p| NIL)
          (#3=#:G227 NIL) (|aList| NIL)
          (|transform| (|Mapping| #1# (|Point| (|DoubleFloat|)))) (|graf| ($)))
         (SEQ
          (LETT |graf| (|GRIMAGE;graph| (SPADCALL |opts| NIL (QREFELT $ 17)) $)
                . #4=(|GRIMAGE;makeGraphImage;L2LLL$;20|))
          (QSETVELT |graf| 7 |opts|)
          (LETT |graf| (|GRIMAGE;plotLists| |graf| |llp| |lpc| |llc| |lps| $)
                . #4#)
          (LETT |transform|
                (SPADCALL (QVELT |graf| 7) (ELT $ 73) (QREFELT $ 75)) . #4#)
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
         (QSETVELT |graf| 3 (APPEND (QVELT |graf| 3) (LIST |ListOfPoints|)))
         (QSETVELT |graf| 4 (APPEND (QVELT |graf| 4) (LIST |PointColor|)))
         (QSETVELT |graf| 5 (APPEND (QVELT |graf| 5) (LIST |LineColor|)))
         (EXIT
          (QSETVELT |graf| 6 (APPEND (QVELT |graf| 6) (LIST |PointSize|)))))) 

(SDEFUN |GRIMAGE;component;$PV;22|
        ((|graf| $) (|aPoint| |Point| (|DoubleFloat|)) ($ |Void|))
        (SPADCALL |graf| |aPoint| (SPADCALL (QREFELT $ 60))
                  (SPADCALL (QREFELT $ 64)) (SPADCALL (QREFELT $ 65))
                  (QREFELT $ 102))) 

(SDEFUN |GRIMAGE;component;$P2PPiV;23|
        ((|graf| $) (|aPoint| |Point| (|DoubleFloat|)) (|PointColor| |Palette|)
         (|LineColor| |Palette|) (|PointSize| |PositiveInteger|) ($ |Void|))
        (SPADCALL |graf| (LIST |aPoint|) |PointColor| |LineColor| |PointSize|
                  (QREFELT $ 101))) 

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
                                  (APPEND
                                   (SPADCALL (QVELT |graf| 3) |num|
                                             (QREFELT $ 104))
                                   (LIST |aPoint|))
                                  (QREFELT $ 105)))))))) 

(SDEFUN |GRIMAGE;point;$PPV;25|
        ((|graf| $) (|aPoint| |Point| (|DoubleFloat|)) (|PointColor| |Palette|)
         ($ |Void|))
        (SPADCALL |graf| |aPoint| |PointColor| (SPADCALL (QREFELT $ 64))
                  (SPADCALL (QREFELT $ 65)) (QREFELT $ 102))) 

(SDEFUN |GRIMAGE;coerce;L$;26|
        ((|llp| |List| (|List| (|Point| (|DoubleFloat|)))) ($ $))
        (SPROG
         ((|i| NIL) (#1=#:G244 NIL) (#2=#:G243 NIL) (#3=#:G242 NIL)
          (|l| (|Integer|)) (#4=#:G241 NIL))
         (SEQ
          (SPADCALL |llp|
                    (PROGN
                     (LETT #4# NIL . #5=(|GRIMAGE;coerce;L$;26|))
                     (SEQ (LETT |i| 1 . #5#)
                          (LETT #3# (LETT |l| (LENGTH |llp|) . #5#) . #5#) G190
                          (COND ((|greater_SI| |i| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4# (CONS (SPADCALL (QREFELT $ 60)) #4#)
                                  . #5#)))
                          (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    (PROGN
                     (LETT #2# NIL . #5#)
                     (SEQ (LETT |i| 1 . #5#) G190
                          (COND ((|greater_SI| |i| |l|) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL (QREFELT $ 64)) #2#)
                                  . #5#)))
                          (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (PROGN
                     (LETT #1# NIL . #5#)
                     (SEQ (LETT |i| 1 . #5#) G190
                          (COND ((|greater_SI| |i| |l|) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1# (CONS (SPADCALL (QREFELT $ 65)) #1#)
                                  . #5#)))
                          (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #1#))))
                    (QREFELT $ 97))))) 

(SDEFUN |GRIMAGE;coerce;$Of;27| ((|graf| $) ($ |OutputForm|))
        (SPROG ((|p| (|NonNegativeInteger|)))
               (SPADCALL
                (LIST "Graph with "
                      (SPADCALL
                       (LETT |p| (LENGTH (SPADCALL |graf| (QREFELT $ 89)))
                             |GRIMAGE;coerce;$Of;27|)
                       (QREFELT $ 110))
                      (COND ((EQL |p| 1) " point list") ('T " point lists")))
                (QREFELT $ 112)))) 

(DECLAIM (NOTINLINE |GraphImage;|)) 

(DEFUN |GraphImage| ()
  (SPROG NIL
         (PROG (#1=#:G247)
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
          (LETT $ (GETREFV 116) . #1#)
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
              (87 . |extend|) (93 . |setelt!|) (|List| 100) (|List| 33)
              |GRIMAGE;putColorInfo;LLL;3| (100 . |hi|) (105 . |lo|)
              (110 . |float|) (117 . |coerce|) (122 . |ceiling|)
              (127 . |retract|) (|List| 26) (132 . |second|) (137 . |Zero|)
              (141 . |One|) (145 . SEGMENT) (|NonNegativeInteger|) (151 . ~=)
              (157 . >) (|ViewDefaultsPackage|) (163 . |pointColorDefault|)
              (167 . |new|) (173 . |concat|) (179 . |first|)
              (185 . |lineColorDefault|) (189 . |pointSizeDefault|) (|List| 37)
              (193 . |new|) (199 . |concat|) (205 . |first|)
              |GRIMAGE;key;$I;11| (211 . ~=) (|CoordinateSystems| 11)
              (217 . |cartesian|) (|Mapping| 8 8) (222 . |coord|) (|PlotTools|)
              (228 . |calcRanges|) (233 . |second|) (|PointPackage| 11)
              (238 . |xCoord|) (243 . |yCoord|) (248 . |hue|) (253 . |shade|)
              (258 . |numberOfHues|) (|SingleInteger|) (262 . *) (|Void|)
              |GRIMAGE;sendGraphImage;$V;10| |GRIMAGE;pointLists;$L;12|
              (268 . |elt|) (274 . |convert|) (279 . |segment|)
              |GRIMAGE;ranges;$2L;14| (285 . |elt|) |GRIMAGE;units;$2L;16|
              |GRIMAGE;graphImage;$;17| |GRIMAGE;makeGraphImage;L2LL$;19|
              |GRIMAGE;makeGraphImage;L$;18| |GRIMAGE;makeGraphImage;L2LLL$;20|
              (|List| 8) |GRIMAGE;component;$L2PPiV;21|
              |GRIMAGE;component;$P2PPiV;23| |GRIMAGE;component;$PV;22|
              (291 . |elt|) (297 . |setelt!|) |GRIMAGE;appendPoint;$PV;24|
              |GRIMAGE;point;$PPV;25| |GRIMAGE;coerce;L$;26| (|OutputForm|)
              (304 . |coerce|) (|List| $) (309 . |hconcat|)
              |GRIMAGE;coerce;$Of;27| (|String|) (|HashState|))
           '#(~= 314 |units| 320 |sendGraphImage| 331 |ranges| 336
              |putColorInfo| 347 |pointLists| 353 |point| 358 |makeGraphImage|
              365 |latex| 387 |key| 392 |hashUpdate!| 397 |hash| 403
              |graphImage| 408 |component| 412 |coerce| 436 |appendPoint| 446 =
              452)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 109))
                        (|makeByteWordVec2| 115
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
                                              26 0 11 11 55 2 56 18 0 0 57 2 56
                                              18 0 0 58 0 59 33 60 2 43 0 56 33
                                              61 2 43 0 0 0 62 2 43 0 0 56 63 0
                                              59 33 64 0 59 37 65 2 66 0 56 37
                                              67 2 66 0 0 0 68 2 66 0 0 56 69 2
                                              7 18 0 0 71 1 72 8 8 73 2 16 74
                                              15 74 75 1 76 51 42 77 1 39 11 0
                                              78 1 79 11 8 80 1 79 11 8 81 1 79
                                              11 8 82 1 79 11 8 83 0 32 37 84 2
                                              85 0 7 0 86 2 51 26 0 7 90 1 11
                                              22 0 91 2 20 0 22 22 92 2 39 11 0
                                              7 94 2 42 100 0 7 104 3 42 100 0
                                              7 100 105 1 56 109 0 110 1 109 0
                                              111 112 2 0 18 0 0 1 1 0 28 0 29
                                              2 0 28 0 28 95 1 0 87 0 88 2 0 13
                                              0 13 93 1 0 13 0 14 2 0 42 42 43
                                              44 1 0 42 0 89 3 0 87 0 8 33 107
                                              4 0 0 42 43 43 66 97 5 0 0 42 43
                                              43 66 15 99 1 0 0 42 98 1 0 114 0
                                              1 1 0 7 0 70 2 0 115 115 0 1 1 0
                                              85 0 1 0 0 0 96 2 0 87 0 8 103 5
                                              0 87 0 8 33 33 37 102 5 0 87 0
                                              100 33 33 37 101 1 0 0 42 108 1 0
                                              109 0 113 2 0 87 0 8 106 2 0 18 0
                                              0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|GraphImage| 'NILADIC T) 
