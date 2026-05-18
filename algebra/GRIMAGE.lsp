
(SDEFUN |GRIMAGE;numberCheck| ((|nums| (|Point| (|DoubleFloat|))) (% (|Void|)))
        (SPROG ((|i| NIL) (#1=#:G24 NIL) (#2=#:G19 NIL) (#3=#:G23 NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |i| (SPADCALL |nums| (QREFELT % 9)))
                      (LETT #1# (SPADCALL |nums| (QREFELT % 10))) G190
                      (COND ((> |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COMPLEXP
                           (SPADCALL |nums|
                                     (PROG1 (LETT #2# |i|)
                                       (|check_subtype2| (> #2# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #2#))
                                     (QREFELT % 12)))
                          (PROGN
                           (LETT #3#
                                 (|error|
                                  "An unexpected complex number was encountered in the calculations."))
                           (GO #4=#:G21))))))
                      (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL)))
                #4# (EXIT #3#)))) 

(SDEFUN |GRIMAGE;doOptions| ((|g| (|Rep|)) (% (|Void|)))
        (SPROG
         ((|lr| (|List| (|Segment| (|Float|)))) (|lu| (|List| (|Float|))))
         (SEQ
          (LETT |lr|
                (SPADCALL (QVELT |g| 7) (SPADCALL |g| (QREFELT % 14))
                          (QREFELT % 17)))
          (COND
           ((> (LENGTH |lr|) 1)
            (QSETVELT |g| 1
                      (LIST
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |lr| 1 (QREFELT % 19))
                                   (QREFELT % 21))
                         (QREFELT % 22))
                        (SPADCALL
                         (SPADCALL (SPADCALL |lr| 1 (QREFELT % 19))
                                   (QREFELT % 23))
                         (QREFELT % 22))
                        (QREFELT % 25))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |lr| 2 (QREFELT % 19))
                                   (QREFELT % 21))
                         (QREFELT % 22))
                        (SPADCALL
                         (SPADCALL (SPADCALL |lr| 2 (QREFELT % 19))
                                   (QREFELT % 23))
                         (QREFELT % 22))
                        (QREFELT % 25)))))
           (#1='T (QSETVELT |g| 1 NIL)))
          (LETT |lu|
                (SPADCALL (QVELT |g| 7) (SPADCALL |g| (QREFELT % 27))
                          (QREFELT % 28)))
          (EXIT
           (COND
            ((> (LENGTH |lu|) 1)
             (QSETVELT |g| 2
                       (LIST
                        (SPADCALL (SPADCALL |lu| 1 (QREFELT % 29))
                                  (QREFELT % 22))
                        (SPADCALL (SPADCALL |lu| 2 (QREFELT % 29))
                                  (QREFELT % 22)))))
            (#1# (QSETVELT |g| 2 NIL))))))) 

(SDEFUN |GRIMAGE;putColorInfo;LLL;3|
        ((|llp| (|List| (|List| (|Point| (|DoubleFloat|)))))
         (|listOfPalettes| (|List| (|Palette|)))
         (% (|List| (|List| (|Point| (|DoubleFloat|))))))
        (SPROG
         ((|pal| NIL) (#1=#:G40 NIL) (|lp| NIL) (#2=#:G39 NIL)
          (|daHue| (|DoubleFloat|)) (|daShade| (|DoubleFloat|)) (#3=#:G41 NIL)
          (|d| (|PositiveInteger|)) (|p| (|Point| (|DoubleFloat|)))
          (|lp2| (|List| (|Point| (|DoubleFloat|))))
          (|llp2| (|List| (|List| (|Point| (|DoubleFloat|))))))
         (SEQ (LETT |llp2| NIL)
              (SEQ (LETT |pal| NIL) (LETT #1# |listOfPalettes|) (LETT |lp| NIL)
                   (LETT #2# |llp|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |lp| (CAR #2#)) NIL)
                         (ATOM #1#) (PROGN (LETT |pal| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |lp2| NIL)
                        (LETT |daHue|
                              (FLOAT
                               (SPADCALL (SPADCALL |pal| (QREFELT % 32))
                                         (QREFELT % 33))
                               MOST-POSITIVE-DOUBLE-FLOAT))
                        (LETT |daShade|
                              (FLOAT (SPADCALL |pal| (QREFELT % 34))
                                     MOST-POSITIVE-DOUBLE-FLOAT))
                        (SEQ (LETT #3# |lp|) G190
                             (COND
                              ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (SEQ (LETT |d| (SPADCALL |p| (QREFELT % 36)))
                                   (EXIT
                                    (COND
                                     ((< |d| 3)
                                      (LETT |p|
                                            (SPADCALL |p|
                                                      (LIST |daHue| |daShade|)
                                                      (QREFELT % 38))))
                                     ('T
                                      (SEQ
                                       (SPADCALL |p| 3 |daHue| (QREFELT % 39))
                                       (EXIT
                                        (COND
                                         ((< |d| 4)
                                          (LETT |p|
                                                (SPADCALL |p| (LIST |daShade|)
                                                          (QREFELT % 38))))
                                         ('T
                                          (SPADCALL |p| 4 |daShade|
                                                    (QREFELT % 39))))))))))
                              (EXIT (LETT |lp2| (CONS |p| |lp2|))))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |llp2| (CONS (NREVERSE |lp2|) |llp2|))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT (NREVERSE |llp2|))))) 

(SDEFUN |GRIMAGE;graph| ((|demRanges| (|List| (|Segment| (|Float|)))) (% (%)))
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
                            (SPADCALL (SPADCALL |demRanges| 1 (QREFELT % 19))
                                      (QREFELT % 21))
                            (QREFELT % 22))
                           (SPADCALL
                            (SPADCALL (SPADCALL |demRanges| 1 (QREFELT % 19))
                                      (QREFELT % 23))
                            (QREFELT % 22))
                           (QREFELT % 25))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |demRanges| 1 (QREFELT % 19))
                                      (QREFELT % 21))
                            (QREFELT % 22))
                           (SPADCALL
                            (SPADCALL (SPADCALL |demRanges| 1 (QREFELT % 19))
                                      (QREFELT % 23))
                            (QREFELT % 22))
                           (QREFELT % 25))))
                   (EXIT (VECTOR 0 |demRangesSF| NIL NIL NIL NIL NIL NIL)))))))) 

(SDEFUN |GRIMAGE;scaleStep|
        ((|range_seg| (|Segment| (|DoubleFloat|))) (% (|DoubleFloat|)))
        (SPROG
         ((|adjust| (|NonNegativeInteger|)) (|range| (|DoubleFloat|))
          (|tryStep| (|DoubleFloat|)) (|numerals| (|String|))
          (|scaleDown| (|DoubleFloat|)))
         (SEQ
          (LETT |range|
                (|sub_DF| (SPADCALL |range_seg| (QREFELT % 43))
                          (SPADCALL |range_seg| (QREFELT % 44))))
          (LETT |adjust| 0)
          (SEQ G190
               (COND ((NULL (|less_DF| |range| (|mk_DF| 100 0))) (GO G191)))
               (SEQ (LETT |adjust| (+ |adjust| 1))
                    (EXIT (LETT |range| (|mul_DF| |range| (|mk_DF| 10 0)))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |tryStep| (|div_DF| |range| (|mk_DF| 10 0)))
          (LETT |numerals|
                (STRINGIMAGE
                 (SPADCALL (SPADCALL |tryStep| (QREFELT % 45))
                           (QREFELT % 46))))
          (LETT |scaleDown|
                (FLOAT (EXPT 10 (- (QCSIZE |numerals|) 1))
                       MOST-POSITIVE-DOUBLE-FLOAT))
          (EXIT
           (|div_DF|
            (|mul_DF| |scaleDown|
                      (SPADCALL
                       (|sub_DF| (|div_DF| |tryStep| |scaleDown|)
                                 (|mk_DF| 5 -1))
                       (QREFELT % 45)))
            (FLOAT (EXPT 10 |adjust|) MOST-POSITIVE-DOUBLE-FLOAT)))))) 

(SDEFUN |GRIMAGE;figureUnits|
        ((|ranges| (|List| (|Segment| (|DoubleFloat|))))
         (% (|List| (|DoubleFloat|))))
        (LIST (|GRIMAGE;scaleStep| (|SPADfirst| |ranges|) %)
              (|GRIMAGE;scaleStep| (SPADCALL |ranges| (QREFELT % 48)) %))) 

(SDEFUN |GRIMAGE;roundRange|
        ((|range| (|Segment| (|DoubleFloat|))) (% (|Segment| (|DoubleFloat|))))
        (SPROG
         ((|single_eps| (|DoubleFloat|)) (|low| (|DoubleFloat|))
          (|high| (|DoubleFloat|)))
         (SEQ (LETT |single_eps| (|expt_DF_I| (|mk_DF| 2 0) -19))
              (LETT |low| (SPADCALL |range| (QREFELT % 44)))
              (LETT |low|
                    (COND
                     ((|less_DF| (|abs_DF| |low|) 1.0)
                      (|sub_DF| |low| |single_eps|))
                     ((|less_DF| |low| 0.0)
                      (|mul_DF| (|add_DF| (|mk_DF| 1 0) |single_eps|) |low|))
                     (#1='T
                      (|mul_DF| (|sub_DF| (|mk_DF| 1 0) |single_eps|) |low|))))
              (LETT |high| (SPADCALL |range| (QREFELT % 43)))
              (LETT |high|
                    (COND
                     ((|less_DF| (|abs_DF| |high|) 1.0)
                      (|add_DF| |high| |single_eps|))
                     ((|less_DF| |high| 0.0)
                      (|mul_DF| (|sub_DF| (|mk_DF| 1 0) |single_eps|) |high|))
                     (#1#
                      (|mul_DF| (|add_DF| (|mk_DF| 1 0) |single_eps|)
                                |high|))))
              (EXIT (SPADCALL |low| |high| (QREFELT % 49)))))) 

(SDEFUN |GRIMAGE;roundRanges|
        ((|ranges| (|List| (|Segment| (|DoubleFloat|))))
         (% (|List| (|Segment| (|DoubleFloat|)))))
        (LIST (|GRIMAGE;roundRange| (|SPADfirst| |ranges|) %)
              (|GRIMAGE;roundRange| (SPADCALL |ranges| (QREFELT % 48)) %))) 

(SDEFUN |GRIMAGE;plotLists|
        ((|graf| (|Rep|))
         (|listOfListsOfPoints| (|List| (|List| (|Point| (|DoubleFloat|)))))
         (|listOfPointColors| (|List| (|Palette|)))
         (|listOfLineColors| (|List| (|Palette|)))
         (|listOfPointSizes| (|List| (|PositiveInteger|))) (% (%)))
        (SPROG
         ((#1=#:G94 NIL) (|l| NIL) (#2=#:G95 NIL)
          (|len| #3=(|NonNegativeInteger|)) (#4=#:G70 NIL) (#5=#:G80 NIL)
          (|givenLen| #3#) (#6=#:G90 NIL))
         (SEQ (LETT |givenLen| (LENGTH |listOfListsOfPoints|))
              (LETT |listOfListsOfPoints|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |l| NIL) (LETT #2# |listOfListsOfPoints|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |l| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL (NULL |l|)) (LETT #1# (CONS |l| #1#))))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (COND
               ((NULL |listOfListsOfPoints|)
                (|error|
                 "GraphImage was given a list that contained no valid point lists")))
              (COND
               ((SPADCALL (LETT |len| (LENGTH |listOfListsOfPoints|))
                          |givenLen| (QREFELT % 52))
                (SPADCALL "   Warning: Ignoring pointless point list"
                          (QREFELT % 56))))
              (QSETVELT |graf| 3 |listOfListsOfPoints|)
              (SEQ (LETT |givenLen| (LENGTH |listOfPointColors|))
                   (EXIT
                    (COND
                     ((> |givenLen| |len|)
                      (QSETVELT |graf| 4
                                (SPADCALL |listOfPointColors|
                                          (SPADCALL
                                           (+
                                            (PROG1
                                                (LETT #4# (- |len| |givenLen|))
                                              (|check_subtype2| (>= #4# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #4#))
                                            1)
                                           (SPADCALL (QREFELT % 58))
                                           (QREFELT % 59))
                                          (QREFELT % 60))))
                     (#7='T
                      (QSETVELT |graf| 4
                                (SPADCALL |listOfPointColors| |len|
                                          (QREFELT % 61)))))))
              (SEQ (LETT |givenLen| (LENGTH |listOfLineColors|))
                   (EXIT
                    (COND
                     ((> |givenLen| |len|)
                      (QSETVELT |graf| 5
                                (SPADCALL |listOfLineColors|
                                          (SPADCALL
                                           (+
                                            (PROG1
                                                (LETT #5# (- |len| |givenLen|))
                                              (|check_subtype2| (>= #5# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #5#))
                                            1)
                                           (SPADCALL (QREFELT % 62))
                                           (QREFELT % 59))
                                          (QREFELT % 60))))
                     (#7#
                      (QSETVELT |graf| 5
                                (SPADCALL |listOfLineColors| |len|
                                          (QREFELT % 61)))))))
              (SEQ (LETT |givenLen| (LENGTH |listOfPointSizes|))
                   (EXIT
                    (COND
                     ((> |givenLen| |len|)
                      (QSETVELT |graf| 6
                                (SPADCALL |listOfPointSizes|
                                          (SPADCALL
                                           (+
                                            (PROG1
                                                (LETT #6# (- |len| |givenLen|))
                                              (|check_subtype2| (>= #6# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #6#))
                                            1)
                                           (SPADCALL (QREFELT % 63))
                                           (QREFELT % 65))
                                          (QREFELT % 66))))
                     (#7#
                      (QSETVELT |graf| 6
                                (SPADCALL |listOfPointSizes| |len|
                                          (QREFELT % 67)))))))
              (EXIT |graf|)))) 

(SDEFUN |GRIMAGE;sendGraphImage;%V;10| ((|graf| (%)) (% (|Void|)))
        (SPROG
         ((|s| (|NonNegativeInteger|))
          (|transform|
           (|Mapping| #1=(|Point| (|DoubleFloat|)) (|Point| (|DoubleFloat|))))
          (|tonto| (|List| (|Segment| (|DoubleFloat|)))) (#2=#:G113 NIL)
          (|lColor| NIL) (#3=#:G112 NIL) (|pColor| NIL) (#4=#:G111 NIL)
          (|aList| NIL) (#5=#:G110 NIL) (|p| NIL) (#6=#:G114 NIL)
          (|aPoint| #1#) (|hueShade| (|Integer|)))
         (SEQ (|GRIMAGE;doOptions| |graf| %)
              (LETT |s| (LENGTH (QVELT |graf| 3)))
              (EXIT
               (COND
                ((EQL |s| 0)
                 (|error| "You are trying to make a graph with no points"))
                ((SPADCALL (SPADCALL |graf| (QREFELT % 68)) 0 (QREFELT % 69))
                 (|error| "You are trying to draw over an existing graph"))
                ('T
                 (SEQ
                  (LETT |transform|
                        (SPADCALL (QVELT |graf| 7) (ELT % 71) (QREFELT % 73)))
                  (QSETVELT |graf| 3
                            (SPADCALL (QVELT |graf| 3) (QVELT |graf| 4)
                                      (QREFELT % 42)))
                  (COND
                   ((NULL (SPADCALL |graf| (QREFELT % 14)))
                    (QSETVELT |graf| 1
                              (SPADCALL (QVELT |graf| 3) (QREFELT % 75)))))
                  (QSETVELT |graf| 1
                            (|GRIMAGE;roundRanges| (QVELT |graf| 1) %))
                  (COND
                   ((NULL (SPADCALL |graf| (QREFELT % 27)))
                    (QSETVELT |graf| 2
                              (|GRIMAGE;figureUnits| (QVELT |graf| 1) %))))
                  (SPADCALL
                   "   Graph data being transmitted to the viewport manager..."
                   (QREFELT % 56))
                  (|sockSendInt| |$ViewportServer| 2)
                  (|sockSendInt| |$ViewportServer| -1)
                  (LETT |tonto| (QVELT |graf| 1))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (|SPADfirst| |tonto|)
                                             (QREFELT % 44)))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (|SPADfirst| |tonto|)
                                             (QREFELT % 43)))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (SPADCALL |tonto| (QREFELT % 48))
                                             (QREFELT % 44)))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (SPADCALL |tonto| (QREFELT % 48))
                                             (QREFELT % 43)))
                  (|sockSendFloat| |$ViewportServer|
                                   (|SPADfirst| (QVELT |graf| 2)))
                  (|sockSendFloat| |$ViewportServer|
                                   (SPADCALL (QVELT |graf| 2) (QREFELT % 76)))
                  (|sockSendInt| |$ViewportServer| |s|)
                  (SEQ (LETT #2# (QVELT |graf| 6)) (LETT |lColor| NIL)
                       (LETT #3# (QVELT |graf| 5)) (LETT |pColor| NIL)
                       (LETT #4# (QVELT |graf| 4)) (LETT |aList| NIL)
                       (LETT #5# (QVELT |graf| 3)) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |aList| (CAR #5#)) NIL)
                             (ATOM #4#) (PROGN (LETT |pColor| (CAR #4#)) NIL)
                             (ATOM #3#) (PROGN (LETT |lColor| (CAR #3#)) NIL)
                             (ATOM #2#) (PROGN (LETT |s| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ (|sockSendInt| |$ViewportServer| (LENGTH |aList|))
                            (SEQ (LETT |p| NIL) (LETT #6# |aList|) G190
                                 (COND
                                  ((OR (ATOM #6#)
                                       (PROGN (LETT |p| (CAR #6#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |aPoint| (SPADCALL |p| |transform|))
                                  (|sockSendFloat| |$ViewportServer|
                                                   (SPADCALL |aPoint|
                                                             (QREFELT % 78)))
                                  (|sockSendFloat| |$ViewportServer|
                                                   (SPADCALL |aPoint|
                                                             (QREFELT % 79)))
                                  (|sockSendFloat| |$ViewportServer|
                                                   (SPADCALL |p|
                                                             (QREFELT % 80)))
                                  (EXIT
                                   (|sockSendFloat| |$ViewportServer|
                                                    (SPADCALL |p|
                                                              (QREFELT %
                                                                       81)))))
                                 (LETT #6# (CDR #6#)) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |hueShade|
                                  (+
                                   (SPADCALL (SPADCALL |pColor| (QREFELT % 32))
                                             (QREFELT % 33))
                                   (* (SPADCALL |pColor| (QREFELT % 34))
                                      (SPADCALL (QREFELT % 82)))))
                            (|sockSendInt| |$ViewportServer| |hueShade|)
                            (LETT |hueShade|
                                  (+
                                   (SPADCALL
                                    (-
                                     (SPADCALL
                                      (SPADCALL |lColor| (QREFELT % 32))
                                      (QREFELT % 33))
                                     1)
                                    5 (QREFELT % 84))
                                   (SPADCALL |lColor| (QREFELT % 34))))
                            (|sockSendInt| |$ViewportServer| |hueShade|)
                            (EXIT (|sockSendInt| |$ViewportServer| |s|)))
                       (LETT #5#
                             (PROG1 (CDR #5#)
                               (LETT #4#
                                     (PROG1 (CDR #4#)
                                       (LETT #3#
                                             (PROG1 (CDR #3#)
                                               (LETT #2# (CDR #2#))))))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (QSETVELT |graf| 0 (|sockGetInt| |$ViewportServer|)))))))))) 

(MAKEPROP '|GRIMAGE;key;%I;11| '|SPADreplace| '(XLAM (|graf|) (QVELT |graf| 0))) 

(SDEFUN |GRIMAGE;key;%I;11| ((|graf| (%)) (% (|Integer|))) (QVELT |graf| 0)) 

(MAKEPROP '|GRIMAGE;pointLists;%L;12| '|SPADreplace|
          '(XLAM (|graf|) (QVELT |graf| 3))) 

(SDEFUN |GRIMAGE;pointLists;%L;12|
        ((|graf| (%)) (% (|List| (|List| (|Point| (|DoubleFloat|))))))
        (QVELT |graf| 3)) 

(SDEFUN |GRIMAGE;ranges;%L;13|
        ((|graf| (%)) (% (|List| (|Segment| (|Float|)))))
        (COND ((NULL (QVELT |graf| 1)) NIL)
              ('T
               (LIST
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 1 (QREFELT % 87))
                            (QREFELT % 44))
                  (QREFELT % 88))
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 1 (QREFELT % 87))
                            (QREFELT % 43))
                  (QREFELT % 88))
                 (QREFELT % 89))
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 2 (QREFELT % 87))
                            (QREFELT % 44))
                  (QREFELT % 88))
                 (SPADCALL
                  (SPADCALL (SPADCALL (QVELT |graf| 1) 2 (QREFELT % 87))
                            (QREFELT % 43))
                  (QREFELT % 88))
                 (QREFELT % 89)))))) 

(SDEFUN |GRIMAGE;ranges;%2L;14|
        ((|graf| (%)) (|rangesList| (|List| (|Segment| (|Float|))))
         (% (|List| (|Segment| (|Float|)))))
        (SEQ
         (QSETVELT |graf| 1
                   (LIST
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |rangesList| 1 (QREFELT % 19))
                                (QREFELT % 21))
                      (QREFELT % 22))
                     (SPADCALL
                      (SPADCALL (SPADCALL |rangesList| 1 (QREFELT % 19))
                                (QREFELT % 23))
                      (QREFELT % 22))
                     (QREFELT % 25))
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |rangesList| 2 (QREFELT % 19))
                                (QREFELT % 21))
                      (QREFELT % 22))
                     (SPADCALL
                      (SPADCALL (SPADCALL |rangesList| 2 (QREFELT % 19))
                                (QREFELT % 23))
                      (QREFELT % 22))
                     (QREFELT % 25))))
         (EXIT |rangesList|))) 

(SDEFUN |GRIMAGE;units;%L;15| ((|graf| (%)) (% (|List| (|Float|))))
        (COND ((NULL (QVELT |graf| 2)) NIL)
              ('T
               (LIST
                (SPADCALL (SPADCALL (QVELT |graf| 2) 1 (QREFELT % 91))
                          (QREFELT % 88))
                (SPADCALL (SPADCALL (QVELT |graf| 2) 2 (QREFELT % 91))
                          (QREFELT % 88)))))) 

(SDEFUN |GRIMAGE;units;%2L;16|
        ((|graf| (%)) (|unitsToBe| (|List| (|Float|))) (% (|List| (|Float|))))
        (SEQ
         (QSETVELT |graf| 2
                   (LIST
                    (SPADCALL (SPADCALL |unitsToBe| 1 (QREFELT % 29))
                              (QREFELT % 22))
                    (SPADCALL (SPADCALL |unitsToBe| 2 (QREFELT % 29))
                              (QREFELT % 22))))
         (EXIT |unitsToBe|))) 

(SDEFUN |GRIMAGE;graphImage;%;17| ((% (%))) (|GRIMAGE;graph| NIL %)) 

(SDEFUN |GRIMAGE;makeGraphImage;L%;18|
        ((|llp| (|List| (|List| (|Point| (|DoubleFloat|))))) (% (%)))
        (SPROG
         ((#1=#:G134 NIL) (|l| (|Integer|)) (#2=#:G135 NIL) (#3=#:G136 NIL)
          (#4=#:G137 NIL) (#5=#:G138 NIL) (|i| NIL) (#6=#:G139 NIL))
         (SEQ
          (SPADCALL |llp|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |i| 1) (LETT #2# (LETT |l| (LENGTH |llp|)))
                          G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1# (CONS (SPADCALL (QREFELT % 58)) #1#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #1#))))
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |i| 1) (LETT #4# |l|) G190
                          (COND ((|greater_SI| |i| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3# (CONS (SPADCALL (QREFELT % 62)) #3#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |i| 1) (LETT #6# |l|) G190
                          (COND ((|greater_SI| |i| #6#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5# (CONS (SPADCALL (QREFELT % 63)) #5#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    (QREFELT % 95))))) 

(SDEFUN |GRIMAGE;makeGraphImage;L2LL%;19|
        ((|llp| (|List| (|List| (|Point| (|DoubleFloat|)))))
         (|lpc| (|List| (|Palette|))) (|llc| (|List| (|Palette|)))
         (|lps| (|List| (|PositiveInteger|))) (% (%)))
        (SPADCALL |llp| |lpc| |llc| |lps| NIL (QREFELT % 97))) 

(SDEFUN |GRIMAGE;makeGraphImage;L2LLL%;20|
        ((|llp| (|List| (|List| (|Point| (|DoubleFloat|)))))
         (|lpc| (|List| (|Palette|))) (|llc| (|List| (|Palette|)))
         (|lps| (|List| (|PositiveInteger|))) (|opts| (|List| (|DrawOption|)))
         (% (%)))
        (SPROG
         ((|graf| (%))
          (|transform|
           (|Mapping| #1=(|Point| (|DoubleFloat|)) (|Point| (|DoubleFloat|))))
          (|aList| NIL) (#2=#:G149 NIL) (|p| NIL) (#3=#:G150 NIL)
          (|aPoint| #1#))
         (SEQ
          (LETT |graf|
                (|GRIMAGE;graph| (SPADCALL |opts| NIL (QREFELT % 17)) %))
          (QSETVELT |graf| 7 |opts|)
          (LETT |graf| (|GRIMAGE;plotLists| |graf| |llp| |lpc| |llc| |lps| %))
          (LETT |transform|
                (SPADCALL (QVELT |graf| 7) (ELT % 71) (QREFELT % 73)))
          (SEQ (LETT |aList| NIL) (LETT #2# (QVELT |graf| 3)) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |aList| (CAR #2#)) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |p| NIL) (LETT #3# |aList|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |aPoint| (SPADCALL |p| |transform|))
                           (EXIT (|GRIMAGE;numberCheck| |aPoint| %)))
                      (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (EXIT |graf|)))) 

(SDEFUN |GRIMAGE;component;%L2PPiV;21|
        ((|graf| (%)) (|ListOfPoints| (|List| (|Point| (|DoubleFloat|))))
         (|PointColor| (|Palette|)) (|LineColor| (|Palette|))
         (|PointSize| (|PositiveInteger|)) (% (|Void|)))
        (SEQ
         (QSETVELT |graf| 3
                   (SPADCALL (QVELT |graf| 3) (LIST |ListOfPoints|)
                             (QREFELT % 98)))
         (QSETVELT |graf| 4
                   (SPADCALL (QVELT |graf| 4) (LIST |PointColor|)
                             (QREFELT % 99)))
         (QSETVELT |graf| 5
                   (SPADCALL (QVELT |graf| 5) (LIST |LineColor|)
                             (QREFELT % 99)))
         (EXIT
          (QSETVELT |graf| 6
                    (SPADCALL (QVELT |graf| 6) (LIST |PointSize|)
                              (QREFELT % 100)))))) 

(SDEFUN |GRIMAGE;component;%PV;22|
        ((|graf| (%)) (|aPoint| (|Point| (|DoubleFloat|))) (% (|Void|)))
        (SPADCALL |graf| |aPoint| (SPADCALL (QREFELT % 58))
                  (SPADCALL (QREFELT % 62)) (SPADCALL (QREFELT % 63))
                  (QREFELT % 103))) 

(SDEFUN |GRIMAGE;component;%P2PPiV;23|
        ((|graf| (%)) (|aPoint| (|Point| (|DoubleFloat|)))
         (|PointColor| (|Palette|)) (|LineColor| (|Palette|))
         (|PointSize| (|PositiveInteger|)) (% (|Void|)))
        (SPADCALL |graf| (LIST |aPoint|) |PointColor| |LineColor| |PointSize|
                  (QREFELT % 102))) 

(SDEFUN |GRIMAGE;appendPoint;%PV;24|
        ((|graf| (%)) (|aPoint| (|Point| (|DoubleFloat|))) (% (|Void|)))
        (SPROG ((|num| (|Integer|)))
               (SEQ (LETT |num| (LENGTH (QVELT |graf| 3)))
                    (EXIT
                     (COND
                      ((<= |num| 0) (|error| "No point lists to append to!"))
                      ('T
                       (SPADCALL (QVELT |graf| 3) |num|
                                 (SPADCALL
                                  (SPADCALL (QVELT |graf| 3) |num|
                                            (QREFELT % 105))
                                  (LIST |aPoint|) (QREFELT % 106))
                                 (QREFELT % 107)))))))) 

(SDEFUN |GRIMAGE;point;%PPV;25|
        ((|graf| (%)) (|aPoint| (|Point| (|DoubleFloat|)))
         (|PointColor| (|Palette|)) (% (|Void|)))
        (SPADCALL |graf| |aPoint| |PointColor| (SPADCALL (QREFELT % 62))
                  (SPADCALL (QREFELT % 63)) (QREFELT % 103))) 

(SDEFUN |GRIMAGE;coerce;L%;26|
        ((|llp| (|List| (|List| (|Point| (|DoubleFloat|))))) (% (%)))
        (SPROG
         ((#1=#:G166 NIL) (|l| (|Integer|)) (#2=#:G167 NIL) (#3=#:G168 NIL)
          (#4=#:G169 NIL) (#5=#:G170 NIL) (|i| NIL) (#6=#:G171 NIL))
         (SEQ
          (SPADCALL |llp|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |i| 1) (LETT #2# (LETT |l| (LENGTH |llp|)))
                          G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1# (CONS (SPADCALL (QREFELT % 58)) #1#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #1#))))
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |i| 1) (LETT #4# |l|) G190
                          (COND ((|greater_SI| |i| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3# (CONS (SPADCALL (QREFELT % 62)) #3#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |i| 1) (LETT #6# |l|) G190
                          (COND ((|greater_SI| |i| #6#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5# (CONS (SPADCALL (QREFELT % 63)) #5#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    (QREFELT % 95))))) 

(SDEFUN |GRIMAGE;coerce;%Of;27| ((|graf| (%)) (% (|OutputForm|)))
        (SPROG ((|p| (|NonNegativeInteger|)))
               (SPADCALL
                (LIST (SPADCALL "Graph with " (QREFELT % 112))
                      (SPADCALL
                       (LETT |p| (LENGTH (SPADCALL |graf| (QREFELT % 86))))
                       (QREFELT % 113))
                      (SPADCALL
                       (COND ((EQL |p| 1) " point list") ('T " point lists"))
                       (QREFELT % 112)))
                (QREFELT % 115)))) 

(DECLAIM (NOTINLINE |GraphImage;|)) 

(DEFUN |GraphImage;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|GraphImage|))
          (LETT % (GETREFV 117))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|GraphImage| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
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
          %))) 

(DEFUN |GraphImage| ()
  (SPROG NIL
         (PROG (#1=#:G174)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|GraphImage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|GraphImage|
                             (LIST (CONS NIL (CONS 1 (|GraphImage;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|GraphImage|)))))))))) 

(MAKEPROP '|GraphImage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Integer|) (|Point| 11)
              (0 . |minIndex|) (5 . |maxIndex|) (|DoubleFloat|) (10 . |elt|)
              (|List| 18) |GRIMAGE;ranges;%L;13| (|List| (|DrawOption|))
              (|DrawOptionFunctions0|) (16 . |ranges|) (|Segment| 20)
              (22 . |elt|) (|Float|) (28 . |low|) (33 . |convert|)
              (38 . |high|) (|Segment| 11) (43 . |segment|) (|List| 20)
              |GRIMAGE;units;%L;15| (49 . |units|) (55 . |elt|) (|Color|)
              (|Palette|) (61 . |hue|) (66 . |hue|) (71 . |shade|)
              (|PositiveInteger|) (76 . |dimension|) (|List| 11)
              (81 . |extend|) (87 . |setelt!|) (|List| 101) (|List| 31)
              |GRIMAGE;putColorInfo;LLL;3| (94 . |high|) (99 . |low|)
              (104 . |ceiling|) (109 . |retract|) (|List| 24) (114 . |second|)
              (119 . SEGMENT) (|Boolean|) (|NonNegativeInteger|) (125 . ~=)
              (|Void|) (|String|) (|DisplayPackage|) (131 . |say|)
              (|ViewDefaultsPackage|) (136 . |pointColorDefault|) (140 . |new|)
              (146 . |concat|) (152 . |first|) (158 . |lineColorDefault|)
              (162 . |pointSizeDefault|) (|List| 35) (166 . |new|)
              (172 . |concat|) (178 . |first|) |GRIMAGE;key;%I;11| (184 . ~=)
              (|CoordinateSystems| 11) (190 . |cartesian|) (|Mapping| 8 8)
              (195 . |coord|) (|PlotTools|) (201 . |calcRanges|)
              (206 . |second|) (|PointPackage| 11) (211 . |xCoord|)
              (216 . |yCoord|) (221 . |hue|) (226 . |shade|)
              (231 . |numberOfHues|) (|SingleInteger|) (235 . *)
              |GRIMAGE;sendGraphImage;%V;10| |GRIMAGE;pointLists;%L;12|
              (241 . |elt|) (247 . |convert|) (252 . |segment|)
              |GRIMAGE;ranges;%2L;14| (258 . |elt|) (264 . |1|)
              |GRIMAGE;units;%2L;16| |GRIMAGE;graphImage;%;17|
              |GRIMAGE;makeGraphImage;L2LL%;19| |GRIMAGE;makeGraphImage;L%;18|
              |GRIMAGE;makeGraphImage;L2LLL%;20| (268 . |append|)
              (274 . |append|) (280 . |append|) (|List| 8)
              |GRIMAGE;component;%L2PPiV;21| |GRIMAGE;component;%P2PPiV;23|
              |GRIMAGE;component;%PV;22| (286 . |elt|) (292 . |append|)
              (298 . |setelt!|) |GRIMAGE;appendPoint;%PV;24|
              |GRIMAGE;point;%PPV;25| |GRIMAGE;coerce;L%;26| (|OutputForm|)
              (305 . |message|) (310 . |coerce|) (|List| %) (315 . |hconcat|)
              |GRIMAGE;coerce;%Of;27|)
           '#(~= 320 |units| 326 |sendGraphImage| 337 |ranges| 342
              |putColorInfo| 353 |pointLists| 359 |point| 364 |makeGraphImage|
              371 |latex| 393 |key| 398 |graphImage| 403 |component| 407
              |coerce| 431 |appendPoint| 441 = 447)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 111) (|BasicType|))
                        (|makeByteWordVec2| 116
                                            '(1 8 7 0 9 1 8 7 0 10 2 8 11 0 7
                                              12 2 16 13 15 13 17 2 13 18 0 7
                                              19 1 18 20 0 21 1 20 11 0 22 1 18
                                              20 0 23 2 24 0 11 11 25 2 16 26
                                              15 26 28 2 26 20 0 7 29 1 31 30 0
                                              32 1 30 7 0 33 1 31 7 0 34 1 8 35
                                              0 36 2 8 0 0 37 38 3 8 11 0 7 11
                                              39 1 24 11 0 43 1 24 11 0 44 1 11
                                              0 0 45 1 11 7 0 46 1 47 24 0 48 2
                                              24 0 11 11 49 2 51 50 0 0 52 1 55
                                              53 54 56 0 57 31 58 2 41 0 51 31
                                              59 2 41 0 0 0 60 2 41 0 0 51 61 0
                                              57 31 62 0 57 35 63 2 64 0 51 35
                                              65 2 64 0 0 0 66 2 64 0 0 51 67 2
                                              7 50 0 0 69 1 70 8 8 71 2 16 72
                                              15 72 73 1 74 47 40 75 1 37 11 0
                                              76 1 77 11 8 78 1 77 11 8 79 1 77
                                              11 8 80 1 77 11 8 81 0 30 35 82 2
                                              83 0 7 0 84 2 47 24 0 7 87 1 11
                                              20 0 88 2 18 0 20 20 89 2 37 11 0
                                              7 91 0 20 0 92 2 40 0 0 0 98 2 41
                                              0 0 0 99 2 64 0 0 0 100 2 40 101
                                              0 7 105 2 101 0 0 0 106 3 40 101
                                              0 7 101 107 1 111 0 54 112 1 51
                                              111 0 113 1 111 0 114 115 2 0 50
                                              0 0 1 1 0 26 0 27 2 0 26 0 26 93
                                              1 0 53 0 85 2 0 13 0 13 90 1 0 13
                                              0 14 2 0 40 40 41 42 1 0 40 0 86
                                              3 0 53 0 8 31 109 4 0 0 40 41 41
                                              64 95 1 0 0 40 96 5 0 0 40 41 41
                                              64 15 97 1 0 54 0 1 1 0 7 0 68 0
                                              0 0 94 5 0 53 0 101 31 31 35 102
                                              2 0 53 0 8 104 5 0 53 0 8 31 31
                                              35 103 1 0 111 0 116 1 0 0 40 110
                                              2 0 53 0 8 108 2 0 50 0 0 1)))))
           '|lookupComplete|)) 
