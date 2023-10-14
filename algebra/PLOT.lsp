
(SDEFUN |PLOT;Fnan?| ((|x| |DoubleFloat|) ($ |Boolean|))
        (SPADCALL |x| |x| (QREFELT $ 17))) 

(SDEFUN |PLOT;Pnan?| ((|x| |Point| (|DoubleFloat|)) ($ |Boolean|))
        (SPADCALL (CONS (|function| |PLOT;Fnan?|) $) |x| (QREFELT $ 20))) 

(SDEFUN |PLOT;listBranches;$L;3|
        ((|plot| $) ($ |List| (|List| (|Point| (|DoubleFloat|)))))
        (SPROG
         ((|outList| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|newl| (|List| (|Point| (|DoubleFloat|)))) (#1=#:G139 NIL) (|p| NIL)
          (#2=#:G138 NIL) (|curve| NIL))
         (SEQ (LETT |outList| NIL . #3=(|PLOT;listBranches;$L;3|))
              (SEQ (LETT |curve| NIL . #3#) (LETT #2# (QVELT |plot| 4) . #3#)
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |curve| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |newl| NIL . #3#)
                        (SEQ (LETT |p| NIL . #3#)
                             (LETT #1# (QVELT |curve| 3) . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((|PLOT;Pnan?| |p| $)
                                 (COND
                                  ((NULL (NULL |newl|))
                                   (SEQ
                                    (LETT |outList|
                                          (CONS
                                           (LETT |newl| (NREVERSE |newl|)
                                                 . #3#)
                                           |outList|)
                                          . #3#)
                                    (EXIT (LETT |newl| NIL . #3#))))))
                                ('T (LETT |newl| (CONS |p| |newl|) . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL (NULL |newl|))
                           (LETT |outList|
                                 (CONS (LETT |newl| (NREVERSE |newl|) . #3#)
                                       |outList|)
                                 . #3#)))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |outList|)))) 

(SDEFUN |PLOT;checkRange|
        ((|r| |Segment| (|DoubleFloat|)) ($ |Segment| (|DoubleFloat|)))
        (COND
         ((SPADCALL (SPADCALL |r| (QREFELT $ 24)) (SPADCALL |r| (QREFELT $ 25))
                    (QREFELT $ 26))
          (|error| "ranges cannot be negative"))
         ('T |r|))) 

(SDEFUN |PLOT;intersect|
        ((|s| |Segment| (|DoubleFloat|)) (|t| |Segment| (|DoubleFloat|))
         ($ |Segment| (|DoubleFloat|)))
        (|PLOT;checkRange|
         (SPADCALL
          (|max_DF| (SPADCALL |s| (QREFELT $ 24))
                    (SPADCALL |t| (QREFELT $ 24)))
          (|min_DF| (SPADCALL |s| (QREFELT $ 25))
                    (SPADCALL |t| (QREFELT $ 25)))
          (QREFELT $ 27))
         $)) 

(SDEFUN |PLOT;union|
        ((|s| |Segment| (|DoubleFloat|)) (|t| |Segment| (|DoubleFloat|))
         ($ |Segment| (|DoubleFloat|)))
        (SPADCALL
         (|min_DF| (SPADCALL |s| (QREFELT $ 24)) (SPADCALL |t| (QREFELT $ 24)))
         (|max_DF| (SPADCALL |s| (QREFELT $ 25)) (SPADCALL |t| (QREFELT $ 25)))
         (QREFELT $ 27))) 

(SDEFUN |PLOT;join|
        ((|l| |List|
          (|Record|
           (|:| |source| (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
           (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
           (|:| |knots| (|List| (|DoubleFloat|)))
           (|:| |points| (|List| (|Point| (|DoubleFloat|))))))
         (|i| |Integer|) ($ |Segment| (|DoubleFloat|)))
        (SPROG
         ((|u| (|Segment| (|DoubleFloat|))) (#1=#:G148 NIL) (|r| NIL)
          (|rr|
           (|Record|
            (|:| |source|
                 (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
            (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
            (|:| |knots| (|List| (|DoubleFloat|)))
            (|:| |points| (|List| (|Point| (|DoubleFloat|)))))))
         (SEQ (LETT |rr| (|SPADfirst| |l|) . #2=(|PLOT;join|))
              (LETT |u|
                    (COND ((EQL |i| 0) (|SPADfirst| (QVELT |rr| 1)))
                          ((EQL |i| 1)
                           (SPADCALL (QVELT |rr| 1) (QREFELT $ 29)))
                          ('T (SPADCALL (QVELT |rr| 1) (QREFELT $ 30))))
                    . #2#)
              (SEQ (LETT |r| NIL . #2#) (LETT #1# (CDR |l|) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL |i| 0)
                       (LETT |u|
                             (|PLOT;union| |u| (|SPADfirst| (QVELT |r| 1)) $)
                             . #2#))
                      ((EQL |i| 1)
                       (LETT |u|
                             (|PLOT;union| |u|
                              (SPADCALL (QVELT |r| 1) (QREFELT $ 29)) $)
                             . #2#))
                      ('T
                       (LETT |u|
                             (|PLOT;union| |u|
                              (SPADCALL (QVELT |r| 1) (QREFELT $ 30)) $)
                             . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |u|)))) 

(SDEFUN |PLOT;parametricRange| ((|r| $) ($ |Segment| (|DoubleFloat|)))
        (|SPADfirst| (QVELT |r| 2))) 

(SDEFUN |PLOT;minPoints;I;9| (($ |Integer|)) (QREFELT $ 8)) 

(SDEFUN |PLOT;setMinPoints;2I;10| ((|n| |Integer|) ($ |Integer|))
        (SEQ (COND ((< |n| 3) (|error| "three points minimum required")))
             (COND ((< (QREFELT $ 9) |n|) (SETELT $ 9 |n|)))
             (EXIT (SETELT $ 8 |n|)))) 

(SDEFUN |PLOT;maxPoints;I;11| (($ |Integer|)) (QREFELT $ 9)) 

(SDEFUN |PLOT;setMaxPoints;2I;12| ((|n| |Integer|) ($ |Integer|))
        (SEQ (COND ((< |n| 3) (|error| "three points minimum required")))
             (COND
              ((SPADCALL (QREFELT $ 8) |n| (QREFELT $ 35)) (SETELT $ 8 |n|)))
             (EXIT (SETELT $ 9 |n|)))) 

(SDEFUN |PLOT;screenResolution;I;13| (($ |Integer|)) (QREFELT $ 11)) 

(SDEFUN |PLOT;setScreenResolution;2I;14| ((|n| |Integer|) ($ |Integer|))
        (SEQ (COND ((< |n| 2) (|error| "buy a new terminal")))
             (EXIT (SETELT $ 11 |n|)))) 

(SDEFUN |PLOT;adaptive?;B;15| (($ |Boolean|)) (QREFELT $ 7)) 

(SDEFUN |PLOT;setAdaptive;2B;16| ((|b| |Boolean|) ($ |Boolean|))
        (SETELT $ 7 |b|)) 

(PUT '|PLOT;parametric?;$B;17| '|SPADreplace| '(XLAM (|p|) (QVELT |p| 0))) 

(SDEFUN |PLOT;parametric?;$B;17| ((|p| $) ($ |Boolean|)) (QVELT |p| 0)) 

(SDEFUN |PLOT;numFunEvals;I;18| (($ |Integer|)) (QREFELT $ 10)) 

(SDEFUN |PLOT;debug;2B;19| ((|b| |Boolean|) ($ |Boolean|)) (SETELT $ 15 |b|)) 

(SDEFUN |PLOT;xRange;$S;20| ((|plot| $) ($ |Segment| (|DoubleFloat|)))
        (SPADCALL (QVELT |plot| 2) (QREFELT $ 29))) 

(SDEFUN |PLOT;yRange;$S;21| ((|plot| $) ($ |Segment| (|DoubleFloat|)))
        (SPADCALL (QVELT |plot| 2) (QREFELT $ 30))) 

(SDEFUN |PLOT;tRange;$S;22| ((|plot| $) ($ |Segment| (|DoubleFloat|)))
        (|SPADfirst| (QVELT |plot| 2))) 

(SDEFUN |PLOT;select|
        ((|l| |List| (|Point| (|DoubleFloat|)))
         (|f| |Mapping| #1=(|DoubleFloat|) (|Point| (|DoubleFloat|)))
         (|g| |Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
         ($ |DoubleFloat|))
        (SPROG ((|m| #1#) (|n| #1#) (#2=#:G172 NIL) (|p| NIL))
               (SEQ
                (LETT |m| (SPADCALL (|SPADfirst| |l|) |f|)
                      . #3=(|PLOT;select|))
                (COND ((|PLOT;Fnan?| |m| $) (LETT |m| 0.0 . #3#)))
                (SEQ (LETT |p| NIL . #3#) (LETT #2# (CDR |l|) . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ (LETT |n| |m| . #3#)
                          (LETT |m| (SPADCALL |m| (SPADCALL |p| |f|) |g|)
                                . #3#)
                          (EXIT
                           (COND ((|PLOT;Fnan?| |m| $) (LETT |m| |n| . #3#)))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |PLOT;rangeRefine|
        ((|curve| |Record|
          (|:| |source| (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
          (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
          (|:| |knots| (|List| (|DoubleFloat|)))
          (|:| |points| (|List| (|Point| (|DoubleFloat|)))))
         (|nRange| |Segment| (|DoubleFloat|))
         ($ |Record|
          (|:| |source|
               #1=(|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
          (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
          (|:| |knots| #2=(|List| (|DoubleFloat|)))
          (|:| |points| #3=(|List| (|Point| (|DoubleFloat|))))))
        (SPROG
         ((|yRange| #4=(|Segment| (|DoubleFloat|))) (|xRange| #4#) (|p| #3#)
          (|t| #2#) (|i| NIL) (|d| #5=(|DoubleFloat|)) (|n| (|Integer|))
          (|q| (|List| (|Point| (|DoubleFloat|))))
          (|c| (|List| (|DoubleFloat|))) (|s| #5#) (#6=#:G203 NIL) (|f| #1#)
          (|h| (|DoubleFloat|)) (|l| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ (|PLOT;checkRange| |nRange| $)
                (LETT |l| (SPADCALL |nRange| (QREFELT $ 24))
                      . #7=(|PLOT;rangeRefine|))
                (LETT |h| (SPADCALL |nRange| (QREFELT $ 25)) . #7#)
                (LETT |t| (QVELT |curve| 2) . #7#)
                (LETT |p| (QVELT |curve| 3) . #7#)
                (LETT |f| (QVELT |curve| 0) . #7#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |t|) 'NIL)
                              ('T (|less_DF| (|SPADfirst| |t|) |l|))))
                       (GO G191)))
                     (SEQ (LETT |t| (CDR |t|) . #7#)
                          (EXIT (LETT |p| (CDR |p|) . #7#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |c| NIL . #7#) (LETT |q| NIL . #7#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL |t|) 'NIL)
                              ('T
                               (SPADCALL (|SPADfirst| |t|) |h|
                                         (QREFELT $ 47)))))
                       (GO G191)))
                     (SEQ (LETT |c| (CONS (|SPADfirst| |t|) |c|) . #7#)
                          (LETT |q| (CONS (|SPADfirst| |p|) |q|) . #7#)
                          (LETT |t| (CDR |t|) . #7#)
                          (EXIT (LETT |p| (CDR |p|) . #7#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 ((NULL |c|)
                  (PROGN
                   (LETT #6# (|PLOT;basicPlot| |f| |nRange| $) . #7#)
                   (GO #6#))))
                (COND
                 ((|less_DF| (|SPADfirst| |c|) |h|)
                  (SEQ (LETT |c| (CONS |h| |c|) . #7#)
                       (LETT |q| (CONS (SPADCALL |h| |f|) |q|) . #7#)
                       (EXIT (SETELT $ 10 (+ (QREFELT $ 10) 1))))))
                (LETT |t| (LETT |c| (NREVERSE |c|) . #7#) . #7#)
                (LETT |p| (LETT |q| (NREVERSE |q|) . #7#) . #7#)
                (LETT |s|
                      (|div_DF| (|sub_DF| |h| |l|)
                                (|sub_DF|
                                 (FLOAT (SPADCALL (QREFELT $ 32))
                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                 1.0))
                      . #7#)
                (COND
                 ((SPADCALL (|SPADfirst| |t|) |l| (QREFELT $ 17))
                  (SEQ (LETT |t| (LETT |c| (CONS |l| |c|) . #7#) . #7#)
                       (LETT |p| (LETT |q| (CONS (SPADCALL |l| |f|) |p|) . #7#)
                             . #7#)
                       (EXIT (SETELT $ 10 (+ (QREFELT $ 10) 1))))))
                (SEQ G190
                     (COND
                      ((NULL (COND ((NULL (CDR |t|)) 'NIL) ('T 'T)))
                       (GO G191)))
                     (SEQ
                      (LETT |n|
                            (TRUNCATE
                             (|div_DF|
                              (|sub_DF| (SPADCALL |t| (QREFELT $ 49))
                                        (|SPADfirst| |t|))
                              |s|))
                            . #7#)
                      (LETT |d|
                            (|div_DF|
                             (|sub_DF| (SPADCALL |t| (QREFELT $ 49))
                                       (|SPADfirst| |t|))
                             (FLOAT (+ |n| 1) MOST-POSITIVE-DOUBLE-FLOAT))
                            . #7#)
                      (SEQ (LETT |i| 1 . #7#) G190
                           (COND ((|greater_SI| |i| |n|) (GO G191)))
                           (SEQ
                            (SPADCALL |t| '|rest|
                                      (CONS (|add_DF| (|SPADfirst| |t|) |d|)
                                            (CDR |t|))
                                      (QREFELT $ 51))
                            (SPADCALL |p| '|rest|
                                      (CONS
                                       (SPADCALL (SPADCALL |t| (QREFELT $ 49))
                                                 |f|)
                                       (CDR |p|))
                                      (QREFELT $ 53))
                            (SETELT $ 10 (+ (QREFELT $ 10) 1))
                            (LETT |t| (CDR |t|) . #7#)
                            (EXIT (LETT |p| (CDR |p|) . #7#)))
                           (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |t| (CDR |t|) . #7#)
                      (EXIT (LETT |p| (CDR |p|) . #7#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |xRange|
                      (SPADCALL (|PLOT;select| |q| (ELT $ 55) (ELT $ 56) $)
                                (|PLOT;select| |q| (ELT $ 55) (ELT $ 57) $)
                                (QREFELT $ 27))
                      . #7#)
                (LETT |yRange|
                      (SPADCALL (|PLOT;select| |q| (ELT $ 58) (ELT $ 56) $)
                                (|PLOT;select| |q| (ELT $ 58) (ELT $ 57) $)
                                (QREFELT $ 27))
                      . #7#)
                (EXIT (VECTOR |f| (LIST |nRange| |xRange| |yRange|) |c| |q|))))
          #6# (EXIT #6#)))) 

(SDEFUN |PLOT;adaptivePlot|
        ((|curve| |Record|
          (|:| |source| (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
          (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
          (|:| |knots| (|List| (|DoubleFloat|)))
          (|:| |points| (|List| (|Point| (|DoubleFloat|)))))
         (|tRange| |Segment| (|DoubleFloat|))
         (|xRange| |Segment| (|DoubleFloat|))
         (|yRange| |Segment| (|DoubleFloat|)) (|pixelfraction| |Integer|)
         ($ |Record|
          (|:| |source|
               #1=(|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
          (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
          (|:| |knots| #2=(|List| (|DoubleFloat|)))
          (|:| |points| #3=(|List| (|Point| (|DoubleFloat|))))))
        (SPROG
         ((|p| #3#) (|t| #2#)
          (|todo2| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|todo1| (|List| (|List| (|DoubleFloat|)))) (|tj| #4=(|DoubleFloat|))
          (|tm| #4#) (|st| #5=(|List| (|DoubleFloat|))) (|n| (|Integer|))
          (#6=#:G230 NIL) (|dp| (|DoubleFloat|)) (|s2| #7=(|DoubleFloat|))
          (|s1| #7#) (|b2| #4#) (|a2| #4#) (|b1| #4#) (|a1| #4#)
          (|y2| #8=(|DoubleFloat|)) (|x2| #9=(|DoubleFloat|)) (|y1| #8#)
          (|x1| #9#) (|y0| #8#) (|x0| #9#)
          (|sp| #10=(|List| (|Point| (|DoubleFloat|)))) (|t2| (|DoubleFloat|))
          (|t1| (|DoubleFloat|)) (|t0| (|DoubleFloat|))
          (|todop| (|List| (|List| (|Point| (|DoubleFloat|)))))
          (|todot| (|List| (|List| (|DoubleFloat|)))) (|headerp| #10#)
          (|headert| #5#) (|tLimit| #4#) (|maxLength| #4#) (|minLength| #4#)
          (|f| #1#) (|tDiff| #11=(|DoubleFloat|)) (|h| (|DoubleFloat|))
          (|l| (|DoubleFloat|)) (|yDiff| #11#) (|xDiff| #11#))
         (SEQ
          (LETT |xDiff|
                (|sub_DF| (SPADCALL |xRange| (QREFELT $ 25))
                          (SPADCALL |xRange| (QREFELT $ 24)))
                . #12=(|PLOT;adaptivePlot|))
          (LETT |yDiff|
                (|sub_DF| (SPADCALL |yRange| (QREFELT $ 25))
                          (SPADCALL |yRange| (QREFELT $ 24)))
                . #12#)
          (COND
           ((OR (|eql_DF| |xDiff| 0.0) (|eql_DF| |yDiff| 0.0)) (EXIT |curve|)))
          (LETT |l| (SPADCALL |tRange| (QREFELT $ 24)) . #12#)
          (LETT |h| (SPADCALL |tRange| (QREFELT $ 25)) . #12#)
          (LETT |tDiff| (|sub_DF| |h| |l|) . #12#)
          (EXIT
           (COND ((|eql_DF| |tDiff| 0.0) |curve|)
                 (#13='T
                  (SEQ (LETT |t| (QVELT |curve| 2) . #12#)
                       (EXIT
                        (COND ((< (LENGTH |t|) 3) |curve|)
                              (#13#
                               (SEQ (LETT |p| (QVELT |curve| 3) . #12#)
                                    (LETT |f| (QVELT |curve| 0) . #12#)
                                    (LETT |minLength|
                                          (|div_DF|
                                           (FLOAT 4 MOST-POSITIVE-DOUBLE-FLOAT)
                                           (FLOAT 500
                                                  MOST-POSITIVE-DOUBLE-FLOAT))
                                          . #12#)
                                    (LETT |maxLength|
                                          (|div_DF| 1.0
                                                    (FLOAT 6
                                                           MOST-POSITIVE-DOUBLE-FLOAT))
                                          . #12#)
                                    (LETT |tLimit|
                                          (|div_DF| |tDiff|
                                                    (FLOAT
                                                     (* |pixelfraction| 500)
                                                     MOST-POSITIVE-DOUBLE-FLOAT))
                                          . #12#)
                                    (SEQ G190
                                         (COND
                                          ((NULL
                                            (COND ((NULL |t|) 'NIL)
                                                  ('T
                                                   (|less_DF| (|SPADfirst| |t|)
                                                              |l|))))
                                           (GO G191)))
                                         (SEQ (LETT |t| (CDR |t|) . #12#)
                                              (EXIT
                                               (LETT |p| (CDR |p|) . #12#)))
                                         NIL (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (COND ((< (LENGTH |t|) 3) |curve|)
                                           (#13#
                                            (SEQ (LETT |headert| |t| . #12#)
                                                 (LETT |headerp| |p| . #12#)
                                                 (LETT |st| |t| . #12#)
                                                 (LETT |sp| |p| . #12#)
                                                 (LETT |todot| NIL . #12#)
                                                 (LETT |todop| NIL . #12#)
                                                 (SEQ G190
                                                      (COND
                                                       ((NULL
                                                         (COND
                                                          ((NULL
                                                            (CDR (CDR |st|)))
                                                           'NIL)
                                                          ('T 'T)))
                                                        (GO G191)))
                                                      (SEQ
                                                       (LETT |todot|
                                                             (SPADCALL |todot|
                                                                       |st|
                                                                       (QREFELT
                                                                        $ 60))
                                                             . #12#)
                                                       (LETT |todop|
                                                             (SPADCALL |todop|
                                                                       |sp|
                                                                       (QREFELT
                                                                        $ 61))
                                                             . #12#)
                                                       (LETT |st| (CDR |st|)
                                                             . #12#)
                                                       (EXIT
                                                        (LETT |sp| (CDR |sp|)
                                                              . #12#)))
                                                      NIL (GO G190) G191
                                                      (EXIT NIL))
                                                 (LETT |st| |headert| . #12#)
                                                 (LETT |sp| |headerp| . #12#)
                                                 (LETT |todo1| |todot| . #12#)
                                                 (LETT |todo2| |todop| . #12#)
                                                 (LETT |n| 0 . #12#)
                                                 (SEQ
                                                  (EXIT
                                                   (SEQ G190
                                                        (COND
                                                         ((NULL
                                                           (COND
                                                            ((NULL |todo1|)
                                                             'NIL)
                                                            ('T 'T)))
                                                          (GO G191)))
                                                        (SEQ
                                                         (LETT |st|
                                                               (|SPADfirst|
                                                                |todo1|)
                                                               . #12#)
                                                         (LETT |t0|
                                                               (|SPADfirst|
                                                                |st|)
                                                               . #12#)
                                                         (LETT |t1|
                                                               (SPADCALL |st|
                                                                         (QREFELT
                                                                          $
                                                                          49))
                                                               . #12#)
                                                         (LETT |t2|
                                                               (SPADCALL |st|
                                                                         (QREFELT
                                                                          $
                                                                          62))
                                                               . #12#)
                                                         (COND
                                                          ((SPADCALL |t2| |h|
                                                                     (QREFELT $
                                                                              26))
                                                           (PROGN
                                                            (LETT #6#
                                                                  |$NoValue|
                                                                  . #12#)
                                                            (GO #6#))))
                                                         (EXIT
                                                          (COND
                                                           ((|less_DF|
                                                             (|sub_DF| |t2|
                                                                       |t0|)
                                                             |tLimit|)
                                                            (SEQ
                                                             (LETT |todo1|
                                                                   (CDR
                                                                    |todo1|)
                                                                   . #12#)
                                                             (LETT |todo2|
                                                                   (CDR
                                                                    |todo2|)
                                                                   . #12#)
                                                             (EXIT
                                                              (COND
                                                               ((NULL
                                                                 (NULL
                                                                  |todo1|))
                                                                (SEQ
                                                                 (LETT |t|
                                                                       (|SPADfirst|
                                                                        |todo1|)
                                                                       . #12#)
                                                                 (EXIT
                                                                  (LETT |p|
                                                                        (|SPADfirst|
                                                                         |todo2|)
                                                                        . #12#))))))))
                                                           ('T
                                                            (SEQ
                                                             (LETT |sp|
                                                                   (|SPADfirst|
                                                                    |todo2|)
                                                                   . #12#)
                                                             (LETT |x0|
                                                                   (SPADCALL
                                                                    (|SPADfirst|
                                                                     |sp|)
                                                                    (QREFELT $
                                                                             55))
                                                                   . #12#)
                                                             (LETT |y0|
                                                                   (SPADCALL
                                                                    (|SPADfirst|
                                                                     |sp|)
                                                                    (QREFELT $
                                                                             58))
                                                                   . #12#)
                                                             (LETT |x1|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |sp|
                                                                     (QREFELT $
                                                                              63))
                                                                    (QREFELT $
                                                                             55))
                                                                   . #12#)
                                                             (LETT |y1|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |sp|
                                                                     (QREFELT $
                                                                              63))
                                                                    (QREFELT $
                                                                             58))
                                                                   . #12#)
                                                             (LETT |x2|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |sp|
                                                                     (QREFELT $
                                                                              64))
                                                                    (QREFELT $
                                                                             55))
                                                                   . #12#)
                                                             (LETT |y2|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |sp|
                                                                     (QREFELT $
                                                                              64))
                                                                    (QREFELT $
                                                                             58))
                                                                   . #12#)
                                                             (LETT |a1|
                                                                   (|div_DF|
                                                                    (|sub_DF|
                                                                     |x1| |x0|)
                                                                    |xDiff|)
                                                                   . #12#)
                                                             (LETT |b1|
                                                                   (|div_DF|
                                                                    (|sub_DF|
                                                                     |y1| |y0|)
                                                                    |yDiff|)
                                                                   . #12#)
                                                             (LETT |a2|
                                                                   (|div_DF|
                                                                    (|sub_DF|
                                                                     |x2| |x1|)
                                                                    |xDiff|)
                                                                   . #12#)
                                                             (LETT |b2|
                                                                   (|div_DF|
                                                                    (|sub_DF|
                                                                     |y2| |y1|)
                                                                    |yDiff|)
                                                                   . #12#)
                                                             (LETT |s1|
                                                                   (SPADCALL
                                                                    (|add_DF|
                                                                     (SPADCALL
                                                                      |a1| 2
                                                                      (QREFELT
                                                                       $ 66))
                                                                     (SPADCALL
                                                                      |b1| 2
                                                                      (QREFELT
                                                                       $ 66)))
                                                                    (QREFELT $
                                                                             67))
                                                                   . #12#)
                                                             (LETT |s2|
                                                                   (SPADCALL
                                                                    (|add_DF|
                                                                     (SPADCALL
                                                                      |a2| 2
                                                                      (QREFELT
                                                                       $ 66))
                                                                     (SPADCALL
                                                                      |b2| 2
                                                                      (QREFELT
                                                                       $ 66)))
                                                                    (QREFELT $
                                                                             67))
                                                                   . #12#)
                                                             (LETT |dp|
                                                                   (|add_DF|
                                                                    (|mul_DF|
                                                                     |a1| |a2|)
                                                                    (|mul_DF|
                                                                     |b1|
                                                                     |b2|))
                                                                   . #12#)
                                                             (COND
                                                              ((|less_DF| |s1|
                                                                          |maxLength|)
                                                               (COND
                                                                ((|less_DF|
                                                                  |s2|
                                                                  |maxLength|)
                                                                 (COND
                                                                  ((OR
                                                                    (|eql_DF|
                                                                     |s1| 0.0)
                                                                    (|eql_DF|
                                                                     |s2| 0.0))
                                                                   (EXIT
                                                                    (SEQ
                                                                     (LETT
                                                                      |todo1|
                                                                      (CDR
                                                                       |todo1|)
                                                                      . #12#)
                                                                     (LETT
                                                                      |todo2|
                                                                      (CDR
                                                                       |todo2|)
                                                                      . #12#)
                                                                     (EXIT
                                                                      (COND
                                                                       ((NULL
                                                                         (NULL
                                                                          |todo1|))
                                                                        (SEQ
                                                                         (LETT
                                                                          |t|
                                                                          (|SPADfirst|
                                                                           |todo1|)
                                                                          . #12#)
                                                                         (EXIT
                                                                          (LETT
                                                                           |p|
                                                                           (|SPADfirst|
                                                                            |todo2|)
                                                                           . #12#)))))))))
                                                                  ((|less_DF|
                                                                    |s1|
                                                                    |minLength|)
                                                                   (COND
                                                                    ((OR
                                                                      (|less_DF|
                                                                       |s2|
                                                                       |minLength|)
                                                                      (SPADCALL
                                                                       (|div_DF|
                                                                        (|div_DF|
                                                                         |dp|
                                                                         |s1|)
                                                                        |s2|)
                                                                       (QREFELT
                                                                        $ 14)
                                                                       (QREFELT
                                                                        $ 26)))
                                                                     (EXIT
                                                                      (SEQ
                                                                       (LETT
                                                                        |todo1|
                                                                        (CDR
                                                                         |todo1|)
                                                                        . #12#)
                                                                       (LETT
                                                                        |todo2|
                                                                        (CDR
                                                                         |todo2|)
                                                                        . #12#)
                                                                       (EXIT
                                                                        (COND
                                                                         ((NULL
                                                                           (NULL
                                                                            |todo1|))
                                                                          (SEQ
                                                                           (LETT
                                                                            |t|
                                                                            (|SPADfirst|
                                                                             |todo1|)
                                                                            . #12#)
                                                                           (EXIT
                                                                            (LETT
                                                                             |p|
                                                                             (|SPADfirst|
                                                                              |todo2|)
                                                                             . #12#)))))))))))
                                                                  ('T
                                                                   (COND
                                                                    ((SPADCALL
                                                                      (|div_DF|
                                                                       (|div_DF|
                                                                        |dp|
                                                                        |s1|)
                                                                       |s2|)
                                                                      (QREFELT
                                                                       $ 14)
                                                                      (QREFELT
                                                                       $ 26))
                                                                     (EXIT
                                                                      (SEQ
                                                                       (LETT
                                                                        |todo1|
                                                                        (CDR
                                                                         |todo1|)
                                                                        . #12#)
                                                                       (LETT
                                                                        |todo2|
                                                                        (CDR
                                                                         |todo2|)
                                                                        . #12#)
                                                                       (EXIT
                                                                        (COND
                                                                         ((NULL
                                                                           (NULL
                                                                            |todo1|))
                                                                          (SEQ
                                                                           (LETT
                                                                            |t|
                                                                            (|SPADfirst|
                                                                             |todo1|)
                                                                            . #12#)
                                                                           (EXIT
                                                                            (LETT
                                                                             |p|
                                                                             (|SPADfirst|
                                                                              |todo2|)
                                                                             . #12#))))))))))))))))
                                                             (COND
                                                              ((SPADCALL |n|
                                                                         (QREFELT
                                                                          $ 9)
                                                                         (QREFELT
                                                                          $
                                                                          35))
                                                               (PROGN
                                                                (LETT #6#
                                                                      |$NoValue|
                                                                      . #12#)
                                                                (GO #6#)))
                                                              ('T
                                                               (LETT |n|
                                                                     (+ |n| 1)
                                                                     . #12#)))
                                                             (LETT |st|
                                                                   (CDR |t|)
                                                                   . #12#)
                                                             (EXIT
                                                              (COND
                                                               ((NULL
                                                                 (CDR
                                                                  (CDR |st|)))
                                                                (SEQ
                                                                 (LETT |tm|
                                                                       (|div_DF|
                                                                        (|add_DF|
                                                                         |t0|
                                                                         |t1|)
                                                                        (FLOAT
                                                                         2
                                                                         MOST-POSITIVE-DOUBLE-FLOAT))
                                                                       . #12#)
                                                                 (LETT |tj|
                                                                       |tm|
                                                                       . #12#)
                                                                 (SPADCALL |t|
                                                                           '|rest|
                                                                           (CONS
                                                                            |tj|
                                                                            (CDR
                                                                             |t|))
                                                                           (QREFELT
                                                                            $
                                                                            51))
                                                                 (SPADCALL |p|
                                                                           '|rest|
                                                                           (CONS
                                                                            (SPADCALL
                                                                             |tj|
                                                                             |f|)
                                                                            (CDR
                                                                             |p|))
                                                                           (QREFELT
                                                                            $
                                                                            53))
                                                                 (LETT |todo1|
                                                                       (SPADCALL
                                                                        |todo1|
                                                                        |t|
                                                                        (QREFELT
                                                                         $ 60))
                                                                       . #12#)
                                                                 (LETT |todo2|
                                                                       (SPADCALL
                                                                        |todo2|
                                                                        |p|
                                                                        (QREFELT
                                                                         $ 61))
                                                                       . #12#)
                                                                 (LETT |t|
                                                                       (CDR
                                                                        |t|)
                                                                       . #12#)
                                                                 (LETT |p|
                                                                       (CDR
                                                                        |p|)
                                                                       . #12#)
                                                                 (LETT |todo1|
                                                                       (SPADCALL
                                                                        |todo1|
                                                                        |t|
                                                                        (QREFELT
                                                                         $ 60))
                                                                       . #12#)
                                                                 (LETT |todo2|
                                                                       (SPADCALL
                                                                        |todo2|
                                                                        |p|
                                                                        (QREFELT
                                                                         $ 61))
                                                                       . #12#)
                                                                 (LETT |t|
                                                                       (CDR
                                                                        |t|)
                                                                       . #12#)
                                                                 (LETT |p|
                                                                       (CDR
                                                                        |p|)
                                                                       . #12#)
                                                                 (LETT |tm|
                                                                       (|div_DF|
                                                                        (|add_DF|
                                                                         |t1|
                                                                         |t2|)
                                                                        (FLOAT
                                                                         2
                                                                         MOST-POSITIVE-DOUBLE-FLOAT))
                                                                       . #12#)
                                                                 (LETT |tj|
                                                                       |tm|
                                                                       . #12#)
                                                                 (SPADCALL |t|
                                                                           '|rest|
                                                                           (CONS
                                                                            |tj|
                                                                            (CDR
                                                                             |t|))
                                                                           (QREFELT
                                                                            $
                                                                            51))
                                                                 (SPADCALL |p|
                                                                           '|rest|
                                                                           (CONS
                                                                            (SPADCALL
                                                                             |tj|
                                                                             |f|)
                                                                            (CDR
                                                                             |p|))
                                                                           (QREFELT
                                                                            $
                                                                            53))
                                                                 (LETT |todo1|
                                                                       (SPADCALL
                                                                        |todo1|
                                                                        |t|
                                                                        (QREFELT
                                                                         $ 60))
                                                                       . #12#)
                                                                 (LETT |todo2|
                                                                       (SPADCALL
                                                                        |todo2|
                                                                        |p|
                                                                        (QREFELT
                                                                         $ 61))
                                                                       . #12#)
                                                                 (LETT |todo1|
                                                                       (CDR
                                                                        |todo1|)
                                                                       . #12#)
                                                                 (LETT |todo2|
                                                                       (CDR
                                                                        |todo2|)
                                                                       . #12#)
                                                                 (EXIT
                                                                  (COND
                                                                   ((NULL
                                                                     (NULL
                                                                      |todo1|))
                                                                    (SEQ
                                                                     (LETT |t|
                                                                           (|SPADfirst|
                                                                            |todo1|)
                                                                           . #12#)
                                                                     (EXIT
                                                                      (LETT |p|
                                                                            (|SPADfirst|
                                                                             |todo2|)
                                                                            . #12#))))))))
                                                               ('T
                                                                (SEQ
                                                                 (LETT |tm|
                                                                       (|div_DF|
                                                                        (|add_DF|
                                                                         |t0|
                                                                         |t1|)
                                                                        (FLOAT
                                                                         2
                                                                         MOST-POSITIVE-DOUBLE-FLOAT))
                                                                       . #12#)
                                                                 (LETT |tj|
                                                                       |tm|
                                                                       . #12#)
                                                                 (SPADCALL |t|
                                                                           '|rest|
                                                                           (CONS
                                                                            |tj|
                                                                            (CDR
                                                                             |t|))
                                                                           (QREFELT
                                                                            $
                                                                            51))
                                                                 (SPADCALL |p|
                                                                           '|rest|
                                                                           (CONS
                                                                            (SPADCALL
                                                                             |tj|
                                                                             |f|)
                                                                            (CDR
                                                                             |p|))
                                                                           (QREFELT
                                                                            $
                                                                            53))
                                                                 (LETT |todo1|
                                                                       (SPADCALL
                                                                        |todo1|
                                                                        |t|
                                                                        (QREFELT
                                                                         $ 60))
                                                                       . #12#)
                                                                 (LETT |todo2|
                                                                       (SPADCALL
                                                                        |todo2|
                                                                        |p|
                                                                        (QREFELT
                                                                         $ 61))
                                                                       . #12#)
                                                                 (LETT |t|
                                                                       (CDR
                                                                        |t|)
                                                                       . #12#)
                                                                 (LETT |p|
                                                                       (CDR
                                                                        |p|)
                                                                       . #12#)
                                                                 (LETT |todo1|
                                                                       (SPADCALL
                                                                        |todo1|
                                                                        |t|
                                                                        (QREFELT
                                                                         $ 60))
                                                                       . #12#)
                                                                 (LETT |todo2|
                                                                       (SPADCALL
                                                                        |todo2|
                                                                        |p|
                                                                        (QREFELT
                                                                         $ 61))
                                                                       . #12#)
                                                                 (LETT |t|
                                                                       (CDR
                                                                        |t|)
                                                                       . #12#)
                                                                 (LETT |p|
                                                                       (CDR
                                                                        |p|)
                                                                       . #12#)
                                                                 (LETT |todo1|
                                                                       (CDR
                                                                        |todo1|)
                                                                       . #12#)
                                                                 (LETT |todo2|
                                                                       (CDR
                                                                        |todo2|)
                                                                       . #12#)
                                                                 (LETT |tm|
                                                                       (|div_DF|
                                                                        (|add_DF|
                                                                         |t1|
                                                                         |t2|)
                                                                        (FLOAT
                                                                         2
                                                                         MOST-POSITIVE-DOUBLE-FLOAT))
                                                                       . #12#)
                                                                 (LETT |tj|
                                                                       |tm|
                                                                       . #12#)
                                                                 (SPADCALL |t|
                                                                           '|rest|
                                                                           (CONS
                                                                            |tj|
                                                                            (CDR
                                                                             |t|))
                                                                           (QREFELT
                                                                            $
                                                                            51))
                                                                 (SPADCALL |p|
                                                                           '|rest|
                                                                           (CONS
                                                                            (SPADCALL
                                                                             |tj|
                                                                             |f|)
                                                                            (CDR
                                                                             |p|))
                                                                           (QREFELT
                                                                            $
                                                                            53))
                                                                 (LETT |todo1|
                                                                       (SPADCALL
                                                                        |todo1|
                                                                        |t|
                                                                        (QREFELT
                                                                         $ 60))
                                                                       . #12#)
                                                                 (LETT |todo2|
                                                                       (SPADCALL
                                                                        |todo2|
                                                                        |p|
                                                                        (QREFELT
                                                                         $ 61))
                                                                       . #12#)
                                                                 (LETT |t|
                                                                       (CDR
                                                                        |t|)
                                                                       . #12#)
                                                                 (LETT |p|
                                                                       (CDR
                                                                        |p|)
                                                                       . #12#)
                                                                 (LETT |todo1|
                                                                       (SPADCALL
                                                                        |todo1|
                                                                        |t|
                                                                        (QREFELT
                                                                         $ 60))
                                                                       . #12#)
                                                                 (LETT |todo2|
                                                                       (SPADCALL
                                                                        |todo2|
                                                                        |p|
                                                                        (QREFELT
                                                                         $ 61))
                                                                       . #12#)
                                                                 (LETT |todo1|
                                                                       (CDR
                                                                        |todo1|)
                                                                       . #12#)
                                                                 (LETT |todo2|
                                                                       (CDR
                                                                        |todo2|)
                                                                       . #12#)
                                                                 (EXIT
                                                                  (COND
                                                                   ((NULL
                                                                     (NULL
                                                                      |todo1|))
                                                                    (SEQ
                                                                     (LETT |t|
                                                                           (|SPADfirst|
                                                                            |todo1|)
                                                                           . #12#)
                                                                     (EXIT
                                                                      (LETT |p|
                                                                            (|SPADfirst|
                                                                             |todo2|)
                                                                            . #12#)))))))))))))))
                                                        NIL (GO G190) G191
                                                        (EXIT NIL)))
                                                  #6# (EXIT #6#))
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |n| 0
                                                              (QREFELT $ 35))
                                                    (SEQ
                                                     (SETELT $ 10
                                                             (+ (QREFELT $ 10)
                                                                |n|))
                                                     (LETT |t|
                                                           (QVELT |curve| 2)
                                                           . #12#)
                                                     (LETT |p|
                                                           (QVELT |curve| 3)
                                                           . #12#)
                                                     (LETT |xRange|
                                                           (SPADCALL
                                                            (|PLOT;select| |p|
                                                             (ELT $ 55)
                                                             (ELT $ 56) $)
                                                            (|PLOT;select| |p|
                                                             (ELT $ 55)
                                                             (ELT $ 57) $)
                                                            (QREFELT $ 27))
                                                           . #12#)
                                                     (LETT |yRange|
                                                           (SPADCALL
                                                            (|PLOT;select| |p|
                                                             (ELT $ 58)
                                                             (ELT $ 56) $)
                                                            (|PLOT;select| |p|
                                                             (ELT $ 58)
                                                             (ELT $ 57) $)
                                                            (QREFELT $ 27))
                                                           . #12#)
                                                     (EXIT
                                                      (VECTOR (QVELT |curve| 0)
                                                              (LIST |tRange|
                                                                    |xRange|
                                                                    |yRange|)
                                                              |t| |p|))))
                                                   (#13#
                                                    |curve|)))))))))))))))))) 

(SDEFUN |PLOT;basicPlot|
        ((|f| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|))
         ($ |Record|
          (|:| |source| (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
          (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
          (|:| |knots| (|List| (|DoubleFloat|)))
          (|:| |points| (|List| (|Point| (|DoubleFloat|))))))
        (SPROG
         ((|yRange| #1=(|Segment| (|DoubleFloat|))) (|xRange| #1#)
          (|p| (|List| (|Point| (|DoubleFloat|))))
          (|t| (|List| (|DoubleFloat|))) (|l| (|DoubleFloat|)) (#2=#:G268 NIL)
          (|i| NIL) (|s| (|DoubleFloat|)) (|h| (|DoubleFloat|)))
         (SEQ (|PLOT;checkRange| |tRange| $)
              (LETT |l| (SPADCALL |tRange| (QREFELT $ 24))
                    . #3=(|PLOT;basicPlot|))
              (LETT |h| (SPADCALL |tRange| (QREFELT $ 25)) . #3#)
              (LETT |t| (SPADCALL |l| (QREFELT $ 68)) . #3#)
              (LETT |p| (SPADCALL (SPADCALL |l| |f|) (QREFELT $ 69)) . #3#)
              (LETT |s|
                    (|div_DF| (|sub_DF| |h| |l|)
                              (FLOAT (- (SPADCALL (QREFELT $ 32)) 1)
                                     MOST-POSITIVE-DOUBLE-FLOAT))
                    . #3#)
              (SEQ (LETT |i| 2 . #3#)
                   (LETT #2# (- (SPADCALL (QREFELT $ 32)) 1) . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |l| (|add_DF| |l| |s|) . #3#)
                        (LETT |t| (CONS |l| |t|) . #3#)
                        (EXIT (LETT |p| (CONS (SPADCALL |l| |f|) |p|) . #3#)))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |t| (NREVERSE (CONS |h| |t|)) . #3#)
              (LETT |p| (NREVERSE (CONS (SPADCALL |h| |f|) |p|)) . #3#)
              (LETT |xRange|
                    (SPADCALL (|PLOT;select| |p| (ELT $ 55) (ELT $ 56) $)
                              (|PLOT;select| |p| (ELT $ 55) (ELT $ 57) $)
                              (QREFELT $ 27))
                    . #3#)
              (LETT |yRange|
                    (SPADCALL (|PLOT;select| |p| (ELT $ 58) (ELT $ 56) $)
                              (|PLOT;select| |p| (ELT $ 58) (ELT $ 57) $)
                              (QREFELT $ 27))
                    . #3#)
              (EXIT (VECTOR |f| (LIST |tRange| |xRange| |yRange|) |t| |p|))))) 

(SDEFUN |PLOT;zoom;$S$;27| ((|p| $) (|xRange| |Segment| (|DoubleFloat|)) ($ $))
        (VECTOR (QVELT |p| 0)
                (LIST |xRange| (SPADCALL (QVELT |p| 1) (QREFELT $ 30)))
                (QVELT |p| 2) (QVELT |p| 3) (QVELT |p| 4))) 

(SDEFUN |PLOT;zoom;$2S$;28|
        ((|p| $) (|xRange| |Segment| (|DoubleFloat|))
         (|yRange| |Segment| (|DoubleFloat|)) ($ $))
        (VECTOR (QVELT |p| 0) (LIST |xRange| |yRange|) (QVELT |p| 2)
                (QVELT |p| 3) (QVELT |p| 4))) 

(SDEFUN |PLOT;basicRefine|
        ((|curve| |Record|
          (|:| |source| (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
          (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
          (|:| |knots| (|List| (|DoubleFloat|)))
          (|:| |points| (|List| (|Point| (|DoubleFloat|)))))
         (|nRange| |Segment| (|DoubleFloat|))
         ($ |Record|
          (|:| |source|
               #1=(|Mapping| #2=(|Point| (|DoubleFloat|)) (|DoubleFloat|)))
          (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
          (|:| |knots| #3=(|List| (|DoubleFloat|)))
          (|:| |points| #4=(|List| (|Point| (|DoubleFloat|))))))
        (SPROG
         ((|yRange| #5=(|Segment| (|DoubleFloat|))) (|xRange| #5#) (|p| #4#)
          (|t| #3#) (|pm| #2#) (|tm| (|DoubleFloat|)) (|f| #1#)
          (|h| (|DoubleFloat|)) (|l| (|DoubleFloat|))
          (|tRange| (|Segment| (|DoubleFloat|))))
         (SEQ
          (LETT |tRange| (|SPADfirst| (QVELT |curve| 1))
                . #6=(|PLOT;basicRefine|))
          (LETT |curve|
                (VECTOR (QVELT |curve| 0) (QVELT |curve| 1) (QVELT |curve| 2)
                        (QVELT |curve| 3))
                . #6#)
          (LETT |t|
                (QSETVELT |curve| 2
                          (SPADCALL (QVELT |curve| 2) (QREFELT $ 72)))
                . #6#)
          (LETT |p|
                (QSETVELT |curve| 3
                          (SPADCALL (QVELT |curve| 3) (QREFELT $ 73)))
                . #6#)
          (LETT |l| (SPADCALL |nRange| (QREFELT $ 24)) . #6#)
          (LETT |h| (SPADCALL |nRange| (QREFELT $ 25)) . #6#)
          (LETT |f| (QVELT |curve| 0) . #6#)
          (SEQ G190
               (COND
                ((NULL
                  (COND ((NULL (CDR |t|)) 'NIL)
                        ('T (|less_DF| (|SPADfirst| |t|) |h|))))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((|less_DF| (SPADCALL |t| (QREFELT $ 49)) |l|)
                   (SEQ (LETT |t| (CDR |t|) . #6#)
                        (EXIT (LETT |p| (CDR |p|) . #6#))))
                  ('T
                   (SEQ
                    (LETT |tm|
                          (|div_DF|
                           (|add_DF| (|SPADfirst| |t|)
                                     (SPADCALL |t| (QREFELT $ 49)))
                           (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))
                          . #6#)
                    (LETT |pm| (SPADCALL |tm| |f|) . #6#)
                    (SETELT $ 10 (+ (QREFELT $ 10) 1))
                    (SPADCALL |t| '|rest| (CONS |tm| (CDR |t|)) (QREFELT $ 51))
                    (LETT |t| (CDR (CDR |t|)) . #6#)
                    (SPADCALL |p| '|rest| (CONS |pm| (CDR |p|)) (QREFELT $ 53))
                    (EXIT (LETT |p| (CDR (CDR |p|)) . #6#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |t| (QVELT |curve| 2) . #6#) (LETT |p| (QVELT |curve| 3) . #6#)
          (LETT |xRange|
                (SPADCALL (|PLOT;select| |p| (ELT $ 55) (ELT $ 56) $)
                          (|PLOT;select| |p| (ELT $ 55) (ELT $ 57) $)
                          (QREFELT $ 27))
                . #6#)
          (LETT |yRange|
                (SPADCALL (|PLOT;select| |p| (ELT $ 58) (ELT $ 56) $)
                          (|PLOT;select| |p| (ELT $ 58) (ELT $ 57) $)
                          (QREFELT $ 27))
                . #6#)
          (EXIT
           (VECTOR (QVELT |curve| 0) (LIST |tRange| |xRange| |yRange|) |t|
                   |p|))))) 

(SDEFUN |PLOT;refine;2$;30| ((|p| $) ($ $))
        (SPADCALL |p| (|PLOT;parametricRange| |p| $) (QREFELT $ 74))) 

(SDEFUN |PLOT;refine;$S$;31|
        ((|p| $) (|nRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG
         ((|yRange| #1=(|Segment| (|DoubleFloat|))) (|xRange| #1#)
          (|curves|
           (|List|
            (|Record|
             (|:| |source|
                  (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
             (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
             (|:| |knots| (|List| (|DoubleFloat|)))
             (|:| |points| (|List| (|Point| (|DoubleFloat|)))))))
          (#2=#:G306 NIL) (|c| NIL) (#3=#:G305 NIL)
          (|tlimit| (|PositiveInteger|)) (#4=#:G304 NIL) (#5=#:G303 NIL)
          (|tRange| (|Segment| (|DoubleFloat|))))
         (SEQ (SETELT $ 10 0)
              (LETT |tRange| (|PLOT;parametricRange| |p| $)
                    . #6=(|PLOT;refine;$S$;31|))
              (LETT |nRange| (|PLOT;intersect| |tRange| |nRange| $) . #6#)
              (LETT |curves|
                    (PROGN
                     (LETT #5# NIL . #6#)
                     (SEQ (LETT |c| NIL . #6#) (LETT #4# (QVELT |p| 4) . #6#)
                          G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |c| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS (|PLOT;basicRefine| |c| |nRange| $)
                                        #5#)
                                  . #6#)))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #6#)
              (LETT |xRange| (|PLOT;join| |curves| 1 $) . #6#)
              (LETT |yRange| (|PLOT;join| |curves| 2 $) . #6#)
              (COND
               ((SPADCALL (QREFELT $ 39))
                (SEQ
                 (LETT |tlimit| (COND ((SPADCALL |p| (QREFELT $ 41)) 8) ('T 1))
                       . #6#)
                 (LETT |curves|
                       (PROGN
                        (LETT #3# NIL . #6#)
                        (SEQ (LETT |c| NIL . #6#) (LETT #2# |curves| . #6#)
                             G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |c| (CAR #2#) . #6#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS
                                      (|PLOT;adaptivePlot| |c| |nRange|
                                       |xRange| |yRange| |tlimit| $)
                                      #3#)
                                     . #6#)))
                             (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                             (EXIT (NREVERSE #3#))))
                       . #6#)
                 (LETT |xRange| (|PLOT;join| |curves| 1 $) . #6#)
                 (EXIT (LETT |yRange| (|PLOT;join| |curves| 2 $) . #6#)))))
              (EXIT
               (VECTOR (QVELT |p| 0) (QVELT |p| 1)
                       (LIST |tRange| |xRange| |yRange|) (QVELT |p| 3)
                       |curves|))))) 

(SDEFUN |PLOT;plot;$S$;32| ((|p| $) (|tRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG
         ((|yRange| #1=(|Segment| (|DoubleFloat|))) (|xRange| #1#)
          (|curves|
           (|List|
            (|Record|
             (|:| |source|
                  (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
             (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
             (|:| |knots| (|List| (|DoubleFloat|)))
             (|:| |points| (|List| (|Point| (|DoubleFloat|)))))))
          (#2=#:G317 NIL) (|c| NIL) (#3=#:G316 NIL)
          (|tlimit| (|PositiveInteger|)) (#4=#:G315 NIL) (#5=#:G314 NIL))
         (SEQ (SETELT $ 10 0)
              (LETT |curves|
                    (PROGN
                     (LETT #5# NIL . #6=(|PLOT;plot;$S$;32|))
                     (SEQ (LETT |c| NIL . #6#) (LETT #4# (QVELT |p| 4) . #6#)
                          G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |c| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS (|PLOT;rangeRefine| |c| |tRange| $)
                                        #5#)
                                  . #6#)))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #6#)
              (LETT |xRange| (|PLOT;join| |curves| 1 $) . #6#)
              (LETT |yRange| (|PLOT;join| |curves| 2 $) . #6#)
              (COND
               ((SPADCALL (QREFELT $ 39))
                (SEQ
                 (LETT |tlimit| (COND ((SPADCALL |p| (QREFELT $ 41)) 8) ('T 1))
                       . #6#)
                 (LETT |curves|
                       (PROGN
                        (LETT #3# NIL . #6#)
                        (SEQ (LETT |c| NIL . #6#) (LETT #2# |curves| . #6#)
                             G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |c| (CAR #2#) . #6#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS
                                      (|PLOT;adaptivePlot| |c| |tRange|
                                       |xRange| |yRange| |tlimit| $)
                                      #3#)
                                     . #6#)))
                             (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                             (EXIT (NREVERSE #3#))))
                       . #6#)
                 (LETT |xRange| (|PLOT;join| |curves| 1 $) . #6#)
                 (EXIT (LETT |yRange| (|PLOT;join| |curves| 2 $) . #6#)))))
              (EXIT
               (VECTOR (QVELT |p| 0) (LIST |xRange| |yRange|)
                       (LIST |tRange| |xRange| |yRange|) (QVELT |p| 3)
                       |curves|))))) 

(SDEFUN |PLOT;pt|
        ((|xx| |DoubleFloat|) (|yy| . #1=(|DoubleFloat|))
         ($ |Point| (|DoubleFloat|)))
        (SPROG ((|l| (|List| #1#)))
               (SPADCALL (LETT |l| (LIST |xx| |yy|) |PLOT;pt|) (QREFELT $ 77)))) 

(SDEFUN |PLOT;myTrap|
        ((|ff| |Mapping| (|DoubleFloat|) (|DoubleFloat|)) (|f| |DoubleFloat|)
         ($ |DoubleFloat|))
        (SPROG ((|r| (|DoubleFloat|)) (|s| (|Union| (|DoubleFloat|) "failed")))
               (SEQ
                (LETT |s| (|trapNumericErrors| (SPADCALL |f| |ff|))
                      . #1=(|PLOT;myTrap|))
                (EXIT
                 (COND ((QEQCAR |s| 1) 0.0)
                       (#2='T
                        (SEQ (LETT |r| (QCDR |s|) . #1#)
                             (EXIT
                              (COND
                               ((SPADCALL |r| MOST-POSITIVE-DOUBLE-FLOAT
                                          (QREFELT $ 26))
                                MOST-POSITIVE-DOUBLE-FLOAT)
                               ((|less_DF| |r| MOST-NEGATIVE-DOUBLE-FLOAT)
                                MOST-NEGATIVE-DOUBLE-FLOAT)
                               (#2# |r|)))))))))) 

(SDEFUN |PLOT;plot;MS$;35|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|xRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG
         ((|r| #1=(|List| (|Segment| (|DoubleFloat|))))
          (|p|
           (|Record|
            (|:| |source|
                 (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
            (|:| |ranges| #1#) (|:| |knots| (|List| (|DoubleFloat|)))
            (|:| |points| (|List| (|Point| (|DoubleFloat|)))))))
         (SEQ
          (LETT |p|
                (|PLOT;basicPlot| (CONS #'|PLOT;plot;MS$;35!0| (VECTOR $ |f|))
                 |xRange| $)
                . #2=(|PLOT;plot;MS$;35|))
          (LETT |r| (QVELT |p| 1) . #2#)
          (SETELT $ 10 (SPADCALL (QREFELT $ 32)))
          (COND
           ((SPADCALL (QREFELT $ 39))
            (SEQ
             (LETT |p|
                   (|PLOT;adaptivePlot| |p| (|SPADfirst| |r|)
                    (SPADCALL |r| (QREFELT $ 29)) (SPADCALL |r| (QREFELT $ 30))
                    1 $)
                   . #2#)
             (EXIT (LETT |r| (QVELT |p| 1) . #2#)))))
          (EXIT (VECTOR 'NIL (CDR |r|) |r| NIL (LIST |p|)))))) 

(SDEFUN |PLOT;plot;MS$;35!0| ((|u1| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|PLOT;plot;MS$;35|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|PLOT;pt| |u1| (|PLOT;myTrap| |f| |u1| $) $))))) 

(SDEFUN |PLOT;plot;M2S$;36|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|xRange| |Segment| (|DoubleFloat|))
         (|yRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG ((|p| ($)))
               (SEQ
                (LETT |p| (SPADCALL |f| |xRange| (QREFELT $ 79))
                      |PLOT;plot;M2S$;36|)
                (QSETVELT |p| 1 (LIST |xRange| (|PLOT;checkRange| |yRange| $)))
                (EXIT |p|)))) 

(SDEFUN |PLOT;plot;2MS$;37|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|g| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG
         ((|r| #1=(|List| (|Segment| (|DoubleFloat|))))
          (|p|
           (|Record|
            (|:| |source|
                 (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
            (|:| |ranges| #1#) (|:| |knots| (|List| (|DoubleFloat|)))
            (|:| |points| (|List| (|Point| (|DoubleFloat|)))))))
         (SEQ
          (LETT |p|
                (|PLOT;basicPlot|
                 (CONS #'|PLOT;plot;2MS$;37!0| (VECTOR |g| $ |f|)) |tRange| $)
                . #2=(|PLOT;plot;2MS$;37|))
          (LETT |r| (QVELT |p| 1) . #2#)
          (SETELT $ 10 (SPADCALL (QREFELT $ 32)))
          (COND
           ((SPADCALL (QREFELT $ 39))
            (SEQ
             (LETT |p|
                   (|PLOT;adaptivePlot| |p| (|SPADfirst| |r|)
                    (SPADCALL |r| (QREFELT $ 29)) (SPADCALL |r| (QREFELT $ 30))
                    8 $)
                   . #2#)
             (EXIT (LETT |r| (QVELT |p| 1) . #2#)))))
          (EXIT (VECTOR 'T (CDR |r|) |r| NIL (LIST |p|)))))) 

(SDEFUN |PLOT;plot;2MS$;37!0| ((|z1| NIL) ($$ NIL))
        (PROG (|f| $ |g|)
          (LETT |f| (QREFELT $$ 2) . #1=(|PLOT;plot;2MS$;37|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |g| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|PLOT;pt| (|PLOT;myTrap| |f| |z1| $) (|PLOT;myTrap| |g| |z1| $)
             $))))) 

(SDEFUN |PLOT;plot;2M3S$;38|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|g| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|))
         (|xRange| |Segment| (|DoubleFloat|))
         (|yRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG ((|p| ($)))
               (SEQ
                (LETT |p| (SPADCALL |f| |g| |tRange| (QREFELT $ 81))
                      |PLOT;plot;2M3S$;38|)
                (QSETVELT |p| 1
                          (LIST (|PLOT;checkRange| |xRange| $)
                                (|PLOT;checkRange| |yRange| $)))
                (EXIT |p|)))) 

(SDEFUN |PLOT;pointPlot;MS$;39|
        ((|f| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG
         ((|r| #1=(|List| (|Segment| (|DoubleFloat|))))
          (|p|
           (|Record|
            (|:| |source|
                 (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
            (|:| |ranges| #1#) (|:| |knots| (|List| (|DoubleFloat|)))
            (|:| |points| (|List| (|Point| (|DoubleFloat|)))))))
         (SEQ
          (LETT |p| (|PLOT;basicPlot| |f| |tRange| $)
                . #2=(|PLOT;pointPlot;MS$;39|))
          (LETT |r| (QVELT |p| 1) . #2#)
          (SETELT $ 10 (SPADCALL (QREFELT $ 32)))
          (COND
           ((SPADCALL (QREFELT $ 39))
            (SEQ
             (LETT |p|
                   (|PLOT;adaptivePlot| |p| (|SPADfirst| |r|)
                    (SPADCALL |r| (QREFELT $ 29)) (SPADCALL |r| (QREFELT $ 30))
                    8 $)
                   . #2#)
             (EXIT (LETT |r| (QVELT |p| 1) . #2#)))))
          (EXIT (VECTOR 'T (CDR |r|) |r| NIL (LIST |p|)))))) 

(SDEFUN |PLOT;pointPlot;M3S$;40|
        ((|f| |Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|))
         (|tRange| |Segment| (|DoubleFloat|))
         (|xRange| |Segment| (|DoubleFloat|))
         (|yRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG ((|p| ($)))
               (SEQ
                (LETT |p| (SPADCALL |f| |tRange| (QREFELT $ 84))
                      |PLOT;pointPlot;M3S$;40|)
                (QSETVELT |p| 1
                          (LIST (|PLOT;checkRange| |xRange| $)
                                (|PLOT;checkRange| |yRange| $)))
                (EXIT |p|)))) 

(SDEFUN |PLOT;plot;LS$;41|
        ((|l| |List| (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|xRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG
         ((|yRange| (|Segment| (|DoubleFloat|)))
          (|t|
           (|List|
            (|Record|
             (|:| |source|
                  (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)))
             (|:| |ranges| (|List| (|Segment| (|DoubleFloat|))))
             (|:| |knots| (|List| (|DoubleFloat|)))
             (|:| |points| (|List| (|Point| (|DoubleFloat|)))))))
          (#1=#:G369 NIL) (|f| NIL) (#2=#:G370 NIL) (|p| NIL) (#3=#:G368 NIL)
          (#4=#:G367 NIL) (#5=#:G366 NIL))
         (SEQ (COND ((NULL |l|) (|error| "empty list of functions")))
              (LETT |t|
                    (PROGN
                     (LETT #5# NIL . #6=(|PLOT;plot;LS$;41|))
                     (SEQ (LETT |f| NIL . #6#) (LETT #4# |l| . #6#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |f| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS
                                   (|PLOT;basicPlot|
                                    (CONS #'|PLOT;plot;LS$;41!0|
                                          (VECTOR $ |f|))
                                    |xRange| $)
                                   #5#)
                                  . #6#)))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #6#)
              (LETT |yRange| (|PLOT;join| |t| 2 $) . #6#)
              (SETELT $ 10 (* (LENGTH |l|) (SPADCALL (QREFELT $ 32))))
              (COND
               ((SPADCALL (QREFELT $ 39))
                (SEQ
                 (LETT |t|
                       (PROGN
                        (LETT #3# NIL . #6#)
                        (SEQ (LETT |p| NIL . #6#) (LETT #2# |t| . #6#)
                             (LETT |f| NIL . #6#) (LETT #1# |l| . #6#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |f| (CAR #1#) . #6#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |p| (CAR #2#) . #6#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS
                                      (|PLOT;adaptivePlot| |p| |xRange|
                                       |xRange| |yRange| 1 $)
                                      #3#)
                                     . #6#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #6#))
                                   . #6#)
                             (GO G190) G191 (EXIT (NREVERSE #3#))))
                       . #6#)
                 (EXIT (LETT |yRange| (|PLOT;join| |t| 2 $) . #6#)))))
              (EXIT
               (VECTOR 'NIL (LIST |xRange| |yRange|)
                       (LIST |xRange| |xRange| |yRange|) NIL |t|))))) 

(SDEFUN |PLOT;plot;LS$;41!0| ((|z1| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|PLOT;plot;LS$;41|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|PLOT;pt| |z1| (|PLOT;myTrap| |f| |z1| $) $))))) 

(SDEFUN |PLOT;plot;L2S$;42|
        ((|l| |List| (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
         (|xRange| |Segment| (|DoubleFloat|))
         (|yRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG ((|p| ($)))
               (SEQ
                (LETT |p| (SPADCALL |l| |xRange| (QREFELT $ 87))
                      |PLOT;plot;L2S$;42|)
                (QSETVELT |p| 1 (LIST |xRange| (|PLOT;checkRange| |yRange| $)))
                (EXIT |p|)))) 

(SDEFUN |PLOT;plotPolar;MS$;43|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|))
         (|thetaRange| |Segment| (|DoubleFloat|)) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|PLOT;plotPolar;MS$;43!0| (VECTOR $ |f|))
                         (CONS #'|PLOT;plotPolar;MS$;43!1| (VECTOR $ |f|))
                         |thetaRange| (QREFELT $ 81)))) 

(SDEFUN |PLOT;plotPolar;MS$;43!1| ((|v1| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|PLOT;plotPolar;MS$;43|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |v1| |f|) (SPADCALL |v1| (QREFELT $ 91))
                      (QREFELT $ 90)))))) 

(SDEFUN |PLOT;plotPolar;MS$;43!0| ((|u1| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|PLOT;plotPolar;MS$;43|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |u1| |f|) (SPADCALL |u1| (QREFELT $ 89))
                      (QREFELT $ 90)))))) 

(SDEFUN |PLOT;plotPolar;M$;44|
        ((|f| |Mapping| (|DoubleFloat|) (|DoubleFloat|)) ($ $))
        (SPADCALL |f|
                  (SPADCALL 0.0
                            (SPADCALL 2 (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                                      (QREFELT $ 93))
                            (QREFELT $ 94))
                  (QREFELT $ 92))) 

(SDEFUN |PLOT;coerce;$Of;45| ((|r| $) ($ |OutputForm|))
        (SPROG
         ((|f| (|List| (|OutputForm|))) (|l| (|List| #1=(|OutputForm|)))
          (#2=#:G391 NIL) (|p| NIL) (#3=#:G390 NIL) (|h| (|OutputForm|))
          (|yRange| #1#) (|xRange| (|OutputForm|)) (#4=#:G389 NIL)
          (|curve| NIL) (|tRange| (|OutputForm|)) (|plotSymbol| (|OutputForm|))
          (|tSymbol| (|OutputForm|)) (|ySymbol| (|OutputForm|))
          (|xSymbol| (|OutputForm|)) (|spaces| (|OutputForm|)))
         (SEQ
          (LETT |spaces| (SPADCALL "   " (QREFELT $ 97))
                . #5=(|PLOT;coerce;$Of;45|))
          (LETT |xSymbol| "x = " . #5#) (LETT |ySymbol| "y = " . #5#)
          (LETT |tSymbol| "t = " . #5#) (LETT |plotSymbol| "PLOT" . #5#)
          (LETT |tRange|
                (SPADCALL (|PLOT;parametricRange| |r| $) (QREFELT $ 98)) . #5#)
          (LETT |f| NIL . #5#)
          (SEQ (LETT |curve| NIL . #5#) (LETT #4# (QVELT |r| 4) . #5#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |curve| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |xRange|
                      (SPADCALL (SPADCALL (QVELT |curve| 1) (QREFELT $ 29))
                                (QREFELT $ 98))
                      . #5#)
                (LETT |yRange|
                      (SPADCALL (SPADCALL (QVELT |curve| 1) (QREFELT $ 30))
                                (QREFELT $ 98))
                      . #5#)
                (LETT |l| (LIST |xSymbol| |xRange| |spaces| |ySymbol| |yRange|)
                      . #5#)
                (COND
                 ((SPADCALL |r| (QREFELT $ 41))
                  (LETT |l|
                        (SPADCALL (LIST |tSymbol| |tRange| |spaces|) |l|
                                  (QREFELT $ 100))
                        . #5#)))
                (LETT |h| (SPADCALL |l| (QREFELT $ 102)) . #5#)
                (LETT |l|
                      (PROGN
                       (LETT #3# NIL . #5#)
                       (SEQ (LETT |p| NIL . #5#)
                            (LETT #2# (QVELT |curve| 3) . #5#) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |p| (CAR #2#) . #5#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #3#
                                    (CONS (SPADCALL |p| (QREFELT $ 103)) #3#)
                                    . #5#)))
                            (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #3#))))
                      . #5#)
                (EXIT
                 (LETT |f| (CONS (SPADCALL (CONS |h| |l|) (QREFELT $ 104)) |f|)
                       . #5#)))
               (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL "PLOT" (NREVERSE |f|) (QREFELT $ 105)))))) 

(DECLAIM (NOTINLINE |Plot;|)) 

(DEFUN |Plot| ()
  (SPROG NIL
         (PROG (#1=#:G393)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Plot|) . #2=(|Plot|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Plot|
                             (LIST (CONS NIL (CONS 1 (|Plot;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Plot|)))))))))) 

(DEFUN |Plot;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Plot|) . #1=(|Plot|))
          (LETT $ (GETREFV 107) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Plot| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |parametric| (|Boolean|))
                              (|:| |display|
                                   (|List| (|Segment| (|DoubleFloat|))))
                              (|:| |bounds|
                                   (|List| (|Segment| (|DoubleFloat|))))
                              (|:| |axisLabels| (|List| (|String|)))
                              (|:| |functions|
                                   (|List|
                                    (|Record|
                                     (|:| |source|
                                          (|Mapping| (|Point| (|DoubleFloat|))
                                                     (|DoubleFloat|)))
                                     (|:| |ranges|
                                          (|List| (|Segment| (|DoubleFloat|))))
                                     (|:| |knots| (|List| (|DoubleFloat|)))
                                     (|:| |points|
                                          (|List|
                                           (|Point| (|DoubleFloat|)))))))))
          (QSETREFV $ 7 'T)
          (QSETREFV $ 8 49)
          (QSETREFV $ 9 1000)
          (QSETREFV $ 10 0)
          (QSETREFV $ 11 500)
          (QSETREFV $ 14
                    (|cos_DF|
                     (SPADCALL (FLOAT 4 MOST-POSITIVE-DOUBLE-FLOAT)
                               (QREFELT $ 13))))
          (QSETREFV $ 15 'NIL)
          $))) 

(MAKEPROP '|Plot| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| 'ADAPTIVE 'MINPOINTS 'MAXPOINTS
              'NUMFUNEVALS 'SCREENRES (|DoubleFloat|) (0 . |inv|) 'ANGLEBOUND
              'DEBUG (|Boolean|) (5 . ~=) (|Mapping| 16 12) (|Point| 12)
              (11 . |any?|) (|List| 52) |PLOT;listBranches;$L;3| (|Segment| 12)
              (17 . |lo|) (22 . |hi|) (27 . >) (33 . SEGMENT) (|List| 23)
              (39 . |second|) (44 . |third|) (|Integer|) |PLOT;minPoints;I;9|
              |PLOT;setMinPoints;2I;10| |PLOT;maxPoints;I;11| (49 . >)
              |PLOT;setMaxPoints;2I;12| |PLOT;screenResolution;I;13|
              |PLOT;setScreenResolution;2I;14| |PLOT;adaptive?;B;15|
              |PLOT;setAdaptive;2B;16| |PLOT;parametric?;$B;17|
              |PLOT;numFunEvals;I;18| |PLOT;debug;2B;19| |PLOT;xRange;$S;20|
              |PLOT;yRange;$S;21| |PLOT;tRange;$S;22| (55 . <=) (|List| 12)
              (61 . |second|) '"rest" (66 . |setelt|) (|List| 19)
              (73 . |setelt|) (|PointPackage| 12) (80 . |xCoord|) (85 . |min|)
              (91 . |max|) (97 . |yCoord|) (|List| 48) (102 . |concat!|)
              (108 . |concat!|) (114 . |third|) (119 . |second|)
              (124 . |third|) (|PositiveInteger|) (129 . ^) (135 . |sqrt|)
              (140 . |list|) (145 . |list|) |PLOT;zoom;$S$;27|
              |PLOT;zoom;$2S$;28| (150 . |copy|) (155 . |copy|)
              |PLOT;refine;$S$;31| |PLOT;refine;2$;30| |PLOT;plot;$S$;32|
              (160 . |point|) (|Mapping| 12 12) |PLOT;plot;MS$;35|
              |PLOT;plot;M2S$;36| |PLOT;plot;2MS$;37| |PLOT;plot;2M3S$;38|
              (|Mapping| 19 12) |PLOT;pointPlot;MS$;39|
              |PLOT;pointPlot;M3S$;40| (|List| 78) |PLOT;plot;LS$;41|
              |PLOT;plot;L2S$;42| (165 . |cos|) (170 . *) (176 . |sin|)
              |PLOT;plotPolar;MS$;43| (181 . *) (187 . |segment|)
              |PLOT;plotPolar;M$;44| (|OutputForm|) (193 . |coerce|)
              (198 . |coerce|) (|List| 96) (203 . |concat!|) (|List| $)
              (209 . |hconcat|) (214 . |coerce|) (219 . |vconcat|)
              (224 . |prefix|) |PLOT;coerce;$Of;45|)
           '#(|zoom| 230 |yRange| 243 |xRange| 248 |tRange| 253
              |setScreenResolution| 258 |setMinPoints| 263 |setMaxPoints| 268
              |setAdaptive| 273 |screenResolution| 278 |refine| 282 |pointPlot|
              293 |plotPolar| 307 |plot| 318 |parametric?| 366 |numFunEvals|
              371 |minPoints| 375 |maxPoints| 379 |listBranches| 383 |debug|
              388 |coerce| 393 |adaptive?| 398)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0))
                 (CONS '#(NIL NIL)
                       (CONS
                        '#((|PlottablePlaneCurveCategory|) (|CoercibleTo| 96))
                        (|makeByteWordVec2| 106
                                            '(1 12 0 0 13 2 12 16 0 0 17 2 19
                                              16 18 0 20 1 23 12 0 24 1 23 12 0
                                              25 2 12 16 0 0 26 2 23 0 12 12 27
                                              1 28 23 0 29 1 28 23 0 30 2 31 16
                                              0 0 35 2 12 16 0 0 47 1 48 12 0
                                              49 3 48 0 0 50 0 51 3 52 0 0 50 0
                                              53 1 54 12 19 55 2 12 0 0 0 56 2
                                              12 0 0 0 57 1 54 12 19 58 2 59 0
                                              0 48 60 2 21 0 0 52 61 1 48 12 0
                                              62 1 52 19 0 63 1 52 19 0 64 2 12
                                              0 0 65 66 1 12 0 0 67 1 48 0 12
                                              68 1 52 0 19 69 1 48 0 0 72 1 52
                                              0 0 73 1 19 0 48 77 1 12 0 0 89 2
                                              12 0 0 0 90 1 12 0 0 91 2 12 0 65
                                              0 93 2 23 0 12 12 94 1 96 96 0 97
                                              1 23 96 0 98 2 99 0 0 0 100 1 96
                                              0 101 102 1 19 96 0 103 1 96 0
                                              101 104 2 96 0 0 101 105 2 0 0 0
                                              23 70 3 0 0 0 23 23 71 1 0 23 0
                                              45 1 0 23 0 44 1 0 23 0 46 1 0 31
                                              31 38 1 0 31 31 33 1 0 31 31 36 1
                                              0 16 16 40 0 0 31 37 2 0 0 0 23
                                              74 1 0 0 0 75 2 0 0 83 23 84 4 0
                                              0 83 23 23 23 85 2 0 0 78 23 92 1
                                              0 0 78 95 2 0 0 0 23 76 3 0 0 78
                                              78 23 81 5 0 0 78 78 23 23 23 82
                                              2 0 0 86 23 87 3 0 0 86 23 23 88
                                              2 0 0 78 23 79 3 0 0 78 23 23 80
                                              1 0 16 0 41 0 0 31 42 0 0 31 32 0
                                              0 31 34 1 0 21 0 22 1 0 16 16 43
                                              1 0 96 0 106 0 0 16 39)))))
           '|lookupComplete|)) 

(MAKEPROP '|Plot| 'NILADIC T) 
