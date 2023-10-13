
(/VERSIONCHECK 2) 

(DEFUN |GRIMAGE;numberCheck| (|nums| $)
  (PROG (#1=#:G142 #2=#:G140 #3=#:G144 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |i| (SPADCALL |nums| (QREFELT $ 9)) . #4=(|GRIMAGE;numberCheck|))
        (LETT #3# (SPADCALL |nums| (QREFELT $ 10)) . #4#) G190
        (COND ((> |i| #3#) (GO G191)))
        (SEQ
         (EXIT
          (COND
           ((COMPLEXP
             (SPADCALL |nums|
                       (PROG1 (LETT #2# |i| . #4#)
                         (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#))
                       (QREFELT $ 12)))
            (PROGN
             (LETT #1#
                   (|error|
                    "An unexpected complex number was encountered in the calculations.")
                   . #4#)
             (GO #1#))))))
        (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |GRIMAGE;doOptions| (|g| $)
  (PROG (|lu| |lr|)
    (RETURN
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
                     (SPADCALL (SPADCALL |lr| 1 (QREFELT $ 21)) (QREFELT $ 23))
                     (QREFELT $ 24))
                    (SPADCALL
                     (SPADCALL (SPADCALL |lr| 1 (QREFELT $ 21)) (QREFELT $ 25))
                     (QREFELT $ 24))
                    (QREFELT $ 27))
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL |lr| 2 (QREFELT $ 21)) (QREFELT $ 23))
                     (QREFELT $ 24))
                    (SPADCALL
                     (SPADCALL (SPADCALL |lr| 2 (QREFELT $ 21)) (QREFELT $ 25))
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
                    (SPADCALL (SPADCALL |lu| 1 (QREFELT $ 31)) (QREFELT $ 24))
                    (SPADCALL (SPADCALL |lu| 2 (QREFELT $ 31))
                              (QREFELT $ 24)))))
        (#2# (QSETVELT |g| 2 NIL)))))))) 

(DEFUN |GRIMAGE;putColorInfo;LLL;3| (|llp| |listOfPalettes| $)
  (PROG (|llp2| |lp2| |p| |d| #1=#:G159 |daShade| |daHue| #2=#:G157 |lp|
         #3=#:G158 |pal|)
    (RETURN
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
                          (SEQ (LETT |d| (SPADCALL |p| (QREFELT $ 38)) . #4#)
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
                         (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |llp2| (CONS (NREVERSE |lp2|) |llp2|) . #4#)))
               (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#)) . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (NREVERSE |llp2|)))))) 

(DEFUN |GRIMAGE;graph| (|demRanges| $)
  (PROG (|demRangesSF|)
    (RETURN
     (SEQ
      (COND ((NULL |demRanges|) (VECTOR 0 NIL NIL NIL NIL NIL NIL NIL))
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
              (EXIT (VECTOR 0 |demRangesSF| NIL NIL NIL NIL NIL NIL))))))))) 

(DEFUN |GRIMAGE;scaleStep| (|range_seg| $)
  (PROG (|scaleDown| |numerals| |tryStep| |range| |adjust|)
    (RETURN
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
                                 (SPADCALL (SPADCALL 10 0 10 (QREFELT $ 47))
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
        (FLOAT (EXPT 10 |adjust|) MOST-POSITIVE-DOUBLE-FLOAT))))))) 

(DEFUN |GRIMAGE;figureUnits| (|ranges| $)
  (LIST (|GRIMAGE;scaleStep| (|SPADfirst| |ranges|) $)
        (|GRIMAGE;scaleStep| (SPADCALL |ranges| (QREFELT $ 52)) $))) 

(DEFUN |GRIMAGE;roundRange| (|range| $)
  (PROG (|high| |low| |single_eps|)
    (RETURN
     (SEQ
      (LETT |single_eps|
            (|expt_DF_I|
             (SPADCALL (SPADCALL 2 0 10 (QREFELT $ 47)) (QREFELT $ 48)) -19)
            . #1=(|GRIMAGE;roundRange|))
      (LETT |low| (SPADCALL |range| (QREFELT $ 46)) . #1#)
      (LETT |low|
            (COND
             ((|less_DF| (FLOAT-SIGN 1.0 |low|) 1.0)
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
             ((|less_DF| (FLOAT-SIGN 1.0 |high|) 1.0)
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
      (EXIT (SPADCALL |low| |high| (QREFELT $ 55))))))) 

(DEFUN |GRIMAGE;roundRanges| (|ranges| $)
  (LIST (|GRIMAGE;roundRange| (|SPADfirst| |ranges|) $)
        (|GRIMAGE;roundRange| (SPADCALL |ranges| (QREFELT $ 52)) $))) 

(DEFUN |GRIMAGE;plotLists|
       (|graf| |listOfListsOfPoints| |listOfPointColors| |listOfLineColors|
        |listOfPointSizes| $)
  (PROG (#1=#:G197 |givenLen| #2=#:G189 #3=#:G181 |len| #4=#:G202 |l|
         #5=#:G201)
    (RETURN
     (SEQ
      (LETT |givenLen| (LENGTH |listOfListsOfPoints|)
            . #6=(|GRIMAGE;plotLists|))
      (LETT |listOfListsOfPoints|
            (PROGN
             (LETT #5# NIL . #6#)
             (SEQ (LETT |l| NIL . #6#) (LETT #4# |listOfListsOfPoints| . #6#)
                  G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |l| (CAR #4#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((COND ((NULL |l|) 'NIL) (#7='T 'T))
                      (LETT #5# (CONS |l| #5#) . #6#)))))
                  (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                  (EXIT (NREVERSE #5#))))
            . #6#)
      (COND
       ((NULL |listOfListsOfPoints|)
        (|error|
         "GraphImage was given a list that contained no valid point lists")))
      (COND
       ((SPADCALL (LETT |len| (LENGTH |listOfListsOfPoints|) . #6#) |givenLen|
                  (QREFELT $ 57))
        (|sayBrightly| (LIST "   Warning: Ignoring pointless point list"))))
      (QSETVELT |graf| 3 |listOfListsOfPoints|)
      (SEQ (LETT |givenLen| (LENGTH |listOfPointColors|) . #6#)
           (EXIT
            (COND
             ((SPADCALL |givenLen| |len| (QREFELT $ 58))
              (QSETVELT |graf| 4
                        (SPADCALL |listOfPointColors|
                                  (SPADCALL
                                   (+
                                    (PROG1
                                        (LETT #3# (- |len| |givenLen|) . #6#)
                                      (|check_subtype| (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       #3#))
                                    1)
                                   (SPADCALL (QREFELT $ 60)) (QREFELT $ 61))
                                  (QREFELT $ 62))))
             (#7#
              (QSETVELT |graf| 4
                        (SPADCALL |listOfPointColors| |len|
                                  (QREFELT $ 63)))))))
      (SEQ (LETT |givenLen| (LENGTH |listOfLineColors|) . #6#)
           (EXIT
            (COND
             ((SPADCALL |givenLen| |len| (QREFELT $ 58))
              (QSETVELT |graf| 5
                        (SPADCALL |listOfLineColors|
                                  (SPADCALL
                                   (+
                                    (PROG1
                                        (LETT #2# (- |len| |givenLen|) . #6#)
                                      (|check_subtype| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       #2#))
                                    1)
                                   (SPADCALL (QREFELT $ 64)) (QREFELT $ 61))
                                  (QREFELT $ 62))))
             (#7#
              (QSETVELT |graf| 5
                        (SPADCALL |listOfLineColors| |len| (QREFELT $ 63)))))))
      (SEQ (LETT |givenLen| (LENGTH |listOfPointSizes|) . #6#)
           (EXIT
            (COND
             ((SPADCALL |givenLen| |len| (QREFELT $ 58))
              (QSETVELT |graf| 6
                        (SPADCALL |listOfPointSizes|
                                  (SPADCALL
                                   (+
                                    (PROG1
                                        (LETT #1# (- |len| |givenLen|) . #6#)
                                      (|check_subtype| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       #1#))
                                    1)
                                   (SPADCALL (QREFELT $ 65)) (QREFELT $ 67))
                                  (QREFELT $ 68))))
             (#7#
              (QSETVELT |graf| 6
                        (SPADCALL |listOfPointSizes| |len| (QREFELT $ 69)))))))
      (EXIT |graf|))))) 

(DEFUN |GRIMAGE;makeGraph| (|graf| $)
  (PROG (|hueShade| |aPoint| #1=#:G219 |p| #2=#:G215 |aList| #3=#:G216 |pColor|
         #4=#:G217 |lColor| #5=#:G218 |s| |tonto| |transform|)
    (RETURN
     (SEQ (|GRIMAGE;doOptions| |graf| $)
          (LETT |s| (LENGTH (QVELT |graf| 3)) . #6=(|GRIMAGE;makeGraph|))
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
                    . #6#)
              (QSETVELT |graf| 3
                        (SPADCALL (QVELT |graf| 3) (QVELT |graf| 4)
                                  (QREFELT $ 44)))
              (COND
               ((NULL (SPADCALL |graf| (QREFELT $ 14)))
                (QSETVELT |graf| 1
                          (SPADCALL (QVELT |graf| 3) (QREFELT $ 77)))))
              (QSETVELT |graf| 1 (|GRIMAGE;roundRanges| (QVELT |graf| 1) $))
              (COND
               ((NULL (SPADCALL |graf| (QREFELT $ 29)))
                (QSETVELT |graf| 2
                          (|GRIMAGE;figureUnits| (QVELT |graf| 1) $))))
              (|sayBrightly|
               (LIST
                "   Graph data being transmitted to the viewport manager..."))
              (|sockSendInt| |$ViewportServer| 2)
              (|sockSendInt| |$ViewportServer| -1)
              (LETT |tonto| (QVELT |graf| 1) . #6#)
              (|sockSendFloat| |$ViewportServer|
                               (SPADCALL (|SPADfirst| |tonto|) (QREFELT $ 46)))
              (|sockSendFloat| |$ViewportServer|
                               (SPADCALL (|SPADfirst| |tonto|) (QREFELT $ 45)))
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
              (SEQ (LETT |s| NIL . #6#) (LETT #5# (QVELT |graf| 6) . #6#)
                   (LETT |lColor| NIL . #6#) (LETT #4# (QVELT |graf| 5) . #6#)
                   (LETT |pColor| NIL . #6#) (LETT #3# (QVELT |graf| 4) . #6#)
                   (LETT |aList| NIL . #6#) (LETT #2# (QVELT |graf| 3) . #6#)
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |aList| (CAR #2#) . #6#) NIL)
                         (ATOM #3#) (PROGN (LETT |pColor| (CAR #3#) . #6#) NIL)
                         (ATOM #4#) (PROGN (LETT |lColor| (CAR #4#) . #6#) NIL)
                         (ATOM #5#) (PROGN (LETT |s| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ (|sockSendInt| |$ViewportServer| (LENGTH |aList|))
                        (SEQ (LETT |p| NIL . #6#) (LETT #1# |aList| . #6#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |p| (CAR #1#) . #6#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |aPoint| (SPADCALL |p| |transform|) . #6#)
                              (|sockSendFloat| |$ViewportServer|
                                               (SPADCALL |aPoint|
                                                         (QREFELT $ 80)))
                              (|sockSendFloat| |$ViewportServer|
                                               (SPADCALL |aPoint|
                                                         (QREFELT $ 81)))
                              (|sockSendFloat| |$ViewportServer|
                                               (SPADCALL |p| (QREFELT $ 82)))
                              (EXIT
                               (|sockSendFloat| |$ViewportServer|
                                                (SPADCALL |p|
                                                          (QREFELT $ 83)))))
                             (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |hueShade|
                              (+
                               (SPADCALL (SPADCALL |pColor| (QREFELT $ 34))
                                         (QREFELT $ 35))
                               (* (SPADCALL |pColor| (QREFELT $ 36))
                                  (SPADCALL (QREFELT $ 84))))
                              . #6#)
                        (|sockSendInt| |$ViewportServer| |hueShade|)
                        (LETT |hueShade|
                              (+
                               (SPADCALL
                                (-
                                 (SPADCALL (SPADCALL |lColor| (QREFELT $ 34))
                                           (QREFELT $ 35))
                                 1)
                                5 (QREFELT $ 86))
                               (SPADCALL |lColor| (QREFELT $ 36)))
                              . #6#)
                        (|sockSendInt| |$ViewportServer| |hueShade|)
                        (EXIT (|sockSendInt| |$ViewportServer| |s|)))
                   (LETT #2#
                         (PROG1 (CDR #2#)
                           (LETT #3#
                                 (PROG1 (CDR #3#)
                                   (LETT #4#
                                         (PROG1 (CDR #4#)
                                           (LETT #5# (CDR #5#) . #6#))
                                         . #6#))
                                 . #6#))
                         . #6#)
                   (GO G190) G191 (EXIT NIL))
              (QSETVELT |graf| 0 (|sockGetInt| |$ViewportServer|))
              (EXIT |graf|))))))))) 

(DEFUN |GRIMAGE;makeGraphImage;2$;11| (|graf| $) (|GRIMAGE;makeGraph| |graf| $)) 

(PUT '|GRIMAGE;key;$I;12| '|SPADreplace| '(XLAM (|graf|) (QVELT |graf| 0))) 

(DEFUN |GRIMAGE;key;$I;12| (|graf| $) (QVELT |graf| 0)) 

(PUT '|GRIMAGE;pointLists;$L;13| '|SPADreplace|
     '(XLAM (|graf|) (QVELT |graf| 3))) 

(DEFUN |GRIMAGE;pointLists;$L;13| (|graf| $) (QVELT |graf| 3)) 

(DEFUN |GRIMAGE;ranges;$L;14| (|graf| $)
  (COND ((NULL (QVELT |graf| 1)) NIL)
        ('T
         (LIST
          (SPADCALL
           (SPADCALL
            (SPADCALL (SPADCALL (QVELT |graf| 1) 1 (QREFELT $ 89))
                      (QREFELT $ 46))
            (QREFELT $ 90))
           (SPADCALL
            (SPADCALL (SPADCALL (QVELT |graf| 1) 1 (QREFELT $ 89))
                      (QREFELT $ 45))
            (QREFELT $ 90))
           (QREFELT $ 91))
          (SPADCALL
           (SPADCALL
            (SPADCALL (SPADCALL (QVELT |graf| 1) 2 (QREFELT $ 89))
                      (QREFELT $ 46))
            (QREFELT $ 90))
           (SPADCALL
            (SPADCALL (SPADCALL (QVELT |graf| 1) 2 (QREFELT $ 89))
                      (QREFELT $ 45))
            (QREFELT $ 90))
           (QREFELT $ 91)))))) 

(DEFUN |GRIMAGE;ranges;$2L;15| (|graf| |rangesList| $)
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

(DEFUN |GRIMAGE;units;$L;16| (|graf| $)
  (COND ((NULL (QVELT |graf| 2)) NIL)
        ('T
         (LIST
          (SPADCALL (SPADCALL (QVELT |graf| 2) 1 (QREFELT $ 93))
                    (QREFELT $ 90))
          (SPADCALL (SPADCALL (QVELT |graf| 2) 2 (QREFELT $ 93))
                    (QREFELT $ 90)))))) 

(DEFUN |GRIMAGE;units;$2L;17| (|graf| |unitsToBe| $)
  (SEQ
   (QSETVELT |graf| 2
             (LIST
              (SPADCALL (SPADCALL |unitsToBe| 1 (QREFELT $ 31)) (QREFELT $ 24))
              (SPADCALL (SPADCALL |unitsToBe| 2 (QREFELT $ 31))
                        (QREFELT $ 24))))
   (EXIT |unitsToBe|))) 

(DEFUN |GRIMAGE;graphImage;$;18| ($) (|GRIMAGE;graph| NIL $)) 

(DEFUN |GRIMAGE;makeGraphImage;L$;19| (|llp| $)
  (PROG (|i| #1=#:G240 #2=#:G239 #3=#:G238 |l| #4=#:G237)
    (RETURN
     (SEQ
      (SPADCALL |llp|
                (PROGN
                 (LETT #4# NIL . #5=(|GRIMAGE;makeGraphImage;L$;19|))
                 (SEQ (LETT |i| 1 . #5#)
                      (LETT #3# (LETT |l| (LENGTH |llp|) . #5#) . #5#) G190
                      (COND ((|greater_SI| |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL (QREFELT $ 60)) #4#) . #5#)))
                      (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |i| 1 . #5#) G190
                      (COND ((|greater_SI| |i| |l|) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL (QREFELT $ 64)) #2#) . #5#)))
                      (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (PROGN
                 (LETT #1# NIL . #5#)
                 (SEQ (LETT |i| 1 . #5#) G190
                      (COND ((|greater_SI| |i| |l|) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (SPADCALL (QREFELT $ 65)) #1#) . #5#)))
                      (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #1#))))
                (QREFELT $ 96)))))) 

(DEFUN |GRIMAGE;makeGraphImage;L2LL$;20| (|llp| |lpc| |llc| |lps| $)
  (SPADCALL |llp| |lpc| |llc| |lps| NIL (QREFELT $ 98))) 

(DEFUN |GRIMAGE;makeGraphImage;L2LLL$;21| (|llp| |lpc| |llc| |lps| |opts| $)
  (PROG (|aPoint| #1=#:G249 |p| #2=#:G248 |aList| |transform| |graf|)
    (RETURN
     (SEQ
      (LETT |graf| (|GRIMAGE;graph| (SPADCALL |opts| NIL (QREFELT $ 17)) $)
            . #3=(|GRIMAGE;makeGraphImage;L2LLL$;21|))
      (QSETVELT |graf| 7 |opts|)
      (LETT |graf| (|GRIMAGE;plotLists| |graf| |llp| |lpc| |llc| |lps| $)
            . #3#)
      (LETT |transform| (SPADCALL (QVELT |graf| 7) (ELT $ 73) (QREFELT $ 75))
            . #3#)
      (SEQ (LETT |aList| NIL . #3#) (LETT #2# (QVELT |graf| 3) . #3#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |aList| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |p| NIL . #3#) (LETT #1# |aList| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ (LETT |aPoint| (SPADCALL |p| |transform|) . #3#)
                       (EXIT (|GRIMAGE;numberCheck| |aPoint| $)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT (|GRIMAGE;makeGraph| |graf| $)))))) 

(DEFUN |GRIMAGE;component;$L2PPiV;22|
       (|graf| |ListOfPoints| |PointColor| |LineColor| |PointSize| $)
  (SEQ (QSETVELT |graf| 3 (APPEND (QVELT |graf| 3) (LIST |ListOfPoints|)))
       (QSETVELT |graf| 4 (APPEND (QVELT |graf| 4) (LIST |PointColor|)))
       (QSETVELT |graf| 5 (APPEND (QVELT |graf| 5) (LIST |LineColor|)))
       (EXIT (QSETVELT |graf| 6 (APPEND (QVELT |graf| 6) (LIST |PointSize|)))))) 

(DEFUN |GRIMAGE;component;$PV;23| (|graf| |aPoint| $)
  (SPADCALL |graf| |aPoint| (SPADCALL (QREFELT $ 60)) (SPADCALL (QREFELT $ 64))
            (SPADCALL (QREFELT $ 65)) (QREFELT $ 102))) 

(DEFUN |GRIMAGE;component;$P2PPiV;24|
       (|graf| |aPoint| |PointColor| |LineColor| |PointSize| $)
  (SPADCALL |graf| (LIST |aPoint|) |PointColor| |LineColor| |PointSize|
            (QREFELT $ 101))) 

(DEFUN |GRIMAGE;appendPoint;$PV;25| (|graf| |aPoint| $)
  (PROG (|num|)
    (RETURN
     (SEQ
      (LETT |num| (- (LENGTH (QVELT |graf| 3)) 1) |GRIMAGE;appendPoint;$PV;25|)
      (EXIT
       (COND ((< |num| 0) (|error| "No point lists to append to!"))
             ('T
              (SPADCALL (QVELT |graf| 3) |num|
                        (APPEND
                         (SPADCALL (QVELT |graf| 3) |num| (QREFELT $ 104))
                         (LIST |aPoint|))
                        (QREFELT $ 105))))))))) 

(DEFUN |GRIMAGE;point;$PPV;26| (|graf| |aPoint| |PointColor| $)
  (SPADCALL |graf| |aPoint| |PointColor| (SPADCALL (QREFELT $ 64))
            (SPADCALL (QREFELT $ 65)) (QREFELT $ 102))) 

(DEFUN |GRIMAGE;coerce;L$;27| (|llp| $)
  (PROG (|i| #1=#:G265 #2=#:G264 #3=#:G263 |l| #4=#:G262)
    (RETURN
     (SEQ
      (SPADCALL |llp|
                (PROGN
                 (LETT #4# NIL . #5=(|GRIMAGE;coerce;L$;27|))
                 (SEQ (LETT |i| 1 . #5#)
                      (LETT #3# (LETT |l| (LENGTH |llp|) . #5#) . #5#) G190
                      (COND ((|greater_SI| |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL (QREFELT $ 60)) #4#) . #5#)))
                      (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |i| 1 . #5#) G190
                      (COND ((|greater_SI| |i| |l|) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL (QREFELT $ 64)) #2#) . #5#)))
                      (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (PROGN
                 (LETT #1# NIL . #5#)
                 (SEQ (LETT |i| 1 . #5#) G190
                      (COND ((|greater_SI| |i| |l|) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (SPADCALL (QREFELT $ 65)) #1#) . #5#)))
                      (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #1#))))
                (QREFELT $ 96)))))) 

(DEFUN |GRIMAGE;coerce;$Of;28| (|graf| $)
  (PROG (|p|)
    (RETURN
     (SPADCALL
      (LIST "Graph with "
            (SPADCALL
             (LETT |p| (LENGTH (SPADCALL |graf| (QREFELT $ 88)))
                   |GRIMAGE;coerce;$Of;28|)
             (QREFELT $ 110))
            (COND ((EQL |p| 1) " point list") ('T " point lists")))
      (QREFELT $ 112))))) 

(DEFUN |GraphImage| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G268)
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
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|GraphImage|))))))))))) 

(DEFUN |GraphImage;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|GraphImage|) . #1=(|GraphImage|))
      (LETT $ (GETREFV 115) . #1#)
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
      $)))) 

(MAKEPROP '|GraphImage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Integer|) (|Point| 11)
              (0 . |minIndex|) (5 . |maxIndex|) (|DoubleFloat|) (10 . |elt|)
              (|List| 20) |GRIMAGE;ranges;$L;14| (|List| (|DrawOption|))
              (|DrawOptionFunctions0|) (16 . |ranges|) (|Boolean|) (22 . >)
              (|Segment| 22) (28 . |elt|) (|Float|) (34 . |lo|)
              (39 . |convert|) (44 . |hi|) (|Segment| 11) (49 . |segment|)
              (|List| 22) |GRIMAGE;units;$L;16| (55 . |units|) (61 . |elt|)
              (|Color|) (|Palette|) (67 . |hue|) (72 . |hue|) (77 . |shade|)
              (|PositiveInteger|) (82 . |dimension|) (|List| 11)
              (87 . |extend|) (93 . |setelt|) (|List| 100) (|List| 33)
              |GRIMAGE;putColorInfo;LLL;3| (100 . |hi|) (105 . |lo|)
              (110 . |float|) (117 . |coerce|) (122 . |ceiling|)
              (127 . |retract|) (|List| 26) (132 . |second|) (137 . |Zero|)
              (141 . |One|) (145 . SEGMENT) (|NonNegativeInteger|) (151 . ~=)
              (157 . >) (|ViewDefaultsPackage|) (163 . |pointColorDefault|)
              (167 . |new|) (173 . |concat|) (179 . |first|)
              (185 . |lineColorDefault|) (189 . |pointSizeDefault|) (|List| 37)
              (193 . |new|) (199 . |concat|) (205 . |first|)
              |GRIMAGE;key;$I;12| (211 . ~=) (|CoordinateSystems| 11)
              (217 . |cartesian|) (|Mapping| 8 8) (222 . |coord|) (|PlotTools|)
              (228 . |calcRanges|) (233 . |second|) (|PointPackage| 11)
              (238 . |xCoord|) (243 . |yCoord|) (248 . |hue|) (253 . |shade|)
              (258 . |numberOfHues|) (|SingleInteger|) (262 . *)
              |GRIMAGE;makeGraphImage;2$;11| |GRIMAGE;pointLists;$L;13|
              (268 . |elt|) (274 . |convert|) (279 . |segment|)
              |GRIMAGE;ranges;$2L;15| (285 . |elt|) |GRIMAGE;units;$2L;17|
              |GRIMAGE;graphImage;$;18| |GRIMAGE;makeGraphImage;L2LL$;20|
              |GRIMAGE;makeGraphImage;L$;19| |GRIMAGE;makeGraphImage;L2LLL$;21|
              (|Void|) (|List| 8) |GRIMAGE;component;$L2PPiV;22|
              |GRIMAGE;component;$P2PPiV;24| |GRIMAGE;component;$PV;23|
              (291 . |elt|) (297 . |setelt|) |GRIMAGE;appendPoint;$PV;25|
              |GRIMAGE;point;$PPV;26| |GRIMAGE;coerce;L$;27| (|OutputForm|)
              (304 . |coerce|) (|List| $) (309 . |hconcat|)
              |GRIMAGE;coerce;$Of;28| (|String|))
           '#(~= 314 |units| 320 |ranges| 331 |putColorInfo| 342 |pointLists|
              348 |point| 353 |makeGraphImage| 360 |latex| 387 |key| 392 |hash|
              397 |graphImage| 402 |component| 406 |coerce| 430 |appendPoint|
              440 = 446)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 109))
                        (|makeByteWordVec2| 114
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
                                              85 0 7 0 86 2 51 26 0 7 89 1 11
                                              22 0 90 2 20 0 22 22 91 2 39 11 0
                                              7 93 2 42 100 0 7 104 3 42 100 0
                                              7 100 105 1 56 109 0 110 1 109 0
                                              111 112 2 0 18 0 0 1 2 0 28 0 28
                                              94 1 0 28 0 29 1 0 13 0 14 2 0 13
                                              0 13 92 2 0 42 42 43 44 1 0 42 0
                                              88 3 0 99 0 8 33 107 5 0 0 42 43
                                              43 66 15 98 4 0 0 42 43 43 66 96
                                              1 0 0 0 87 1 0 0 42 97 1 0 114 0
                                              1 1 0 7 0 70 1 0 85 0 1 0 0 0 95
                                              5 0 99 0 8 33 33 37 102 2 0 99 0
                                              8 103 5 0 99 0 100 33 33 37 101 1
                                              0 0 42 108 1 0 109 0 113 2 0 99 0
                                              8 106 2 0 18 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|GraphImage| 'NILADIC T) 
