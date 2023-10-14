
(DEFUN |PLOT;Fnan?| (|x| $) (SPADCALL |x| |x| (QREFELT $ 17))) 

(DEFUN |PLOT;Pnan?| (|x| $)
  (SPADCALL (CONS (|function| |PLOT;Fnan?|) $) |x| (QREFELT $ 20))) 

(DEFUN |PLOT;listBranches;$L;3| (|plot| $)
  (PROG (|outList| |newl| #1=#:G139 |p| #2=#:G138 |curve|)
    (RETURN
     (SEQ (LETT |outList| NIL . #3=(|PLOT;listBranches;$L;3|))
          (SEQ (LETT |curve| NIL . #3#) (LETT #2# (QVELT |plot| 4) . #3#) G190
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
                                       (LETT |newl| (NREVERSE |newl|) . #3#)
                                       |outList|)
                                      . #3#)
                                (EXIT (LETT |newl| NIL . #3#))))))
                            ('T (LETT |newl| (CONS |p| |newl|) . #3#)))))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((NULL (NULL |newl|))
                       (LETT |outList|
                             (CONS (LETT |newl| (NREVERSE |newl|) . #3#)
                                   |outList|)
                             . #3#)))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |outList|))))) 

(DEFUN |PLOT;checkRange| (|r| $)
  (COND
   ((SPADCALL (SPADCALL |r| (QREFELT $ 24)) (SPADCALL |r| (QREFELT $ 25))
              (QREFELT $ 26))
    (|error| "ranges cannot be negative"))
   ('T |r|))) 

(DEFUN |PLOT;intersect| (|s| |t| $)
  (|PLOT;checkRange|
   (SPADCALL
    (|max_DF| (SPADCALL |s| (QREFELT $ 24)) (SPADCALL |t| (QREFELT $ 24)))
    (|min_DF| (SPADCALL |s| (QREFELT $ 25)) (SPADCALL |t| (QREFELT $ 25)))
    (QREFELT $ 27))
   $)) 

(DEFUN |PLOT;union| (|s| |t| $)
  (SPADCALL
   (|min_DF| (SPADCALL |s| (QREFELT $ 24)) (SPADCALL |t| (QREFELT $ 24)))
   (|max_DF| (SPADCALL |s| (QREFELT $ 25)) (SPADCALL |t| (QREFELT $ 25)))
   (QREFELT $ 27))) 

(DEFUN |PLOT;join| (|l| |i| $)
  (PROG (|u| #1=#:G148 |r| |rr|)
    (RETURN
     (SEQ (LETT |rr| (|SPADfirst| |l|) . #2=(|PLOT;join|))
          (LETT |u|
                (COND ((EQL |i| 0) (|SPADfirst| (QVELT |rr| 1)))
                      ((EQL |i| 1) (SPADCALL (QVELT |rr| 1) (QREFELT $ 29)))
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
                   (LETT |u| (|PLOT;union| |u| (|SPADfirst| (QVELT |r| 1)) $)
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
          (EXIT |u|))))) 

(DEFUN |PLOT;parametricRange| (|r| $) (|SPADfirst| (QVELT |r| 2))) 

(DEFUN |PLOT;minPoints;I;9| ($) (QREFELT $ 8)) 

(DEFUN |PLOT;setMinPoints;2I;10| (|n| $)
  (SEQ (COND ((< |n| 3) (|error| "three points minimum required")))
       (COND ((< (QREFELT $ 9) |n|) (SETELT $ 9 |n|))) (EXIT (SETELT $ 8 |n|)))) 

(DEFUN |PLOT;maxPoints;I;11| ($) (QREFELT $ 9)) 

(DEFUN |PLOT;setMaxPoints;2I;12| (|n| $)
  (SEQ (COND ((< |n| 3) (|error| "three points minimum required")))
       (COND ((SPADCALL (QREFELT $ 8) |n| (QREFELT $ 35)) (SETELT $ 8 |n|)))
       (EXIT (SETELT $ 9 |n|)))) 

(DEFUN |PLOT;screenResolution;I;13| ($) (QREFELT $ 11)) 

(DEFUN |PLOT;setScreenResolution;2I;14| (|n| $)
  (SEQ (COND ((< |n| 2) (|error| "buy a new terminal")))
       (EXIT (SETELT $ 11 |n|)))) 

(DEFUN |PLOT;adaptive?;B;15| ($) (QREFELT $ 7)) 

(DEFUN |PLOT;setAdaptive;2B;16| (|b| $) (SETELT $ 7 |b|)) 

(PUT '|PLOT;parametric?;$B;17| '|SPADreplace| '(XLAM (|p|) (QVELT |p| 0))) 

(DEFUN |PLOT;parametric?;$B;17| (|p| $) (QVELT |p| 0)) 

(DEFUN |PLOT;numFunEvals;I;18| ($) (QREFELT $ 10)) 

(DEFUN |PLOT;debug;2B;19| (|b| $) (SETELT $ 15 |b|)) 

(DEFUN |PLOT;xRange;$S;20| (|plot| $)
  (SPADCALL (QVELT |plot| 2) (QREFELT $ 29))) 

(DEFUN |PLOT;yRange;$S;21| (|plot| $)
  (SPADCALL (QVELT |plot| 2) (QREFELT $ 30))) 

(DEFUN |PLOT;tRange;$S;22| (|plot| $) (|SPADfirst| (QVELT |plot| 2))) 

(DEFUN |PLOT;select| (|l| |f| |g| $)
  (PROG (|m| |n| #1=#:G172 |p|)
    (RETURN
     (SEQ (LETT |m| (SPADCALL (|SPADfirst| |l|) |f|) . #2=(|PLOT;select|))
          (COND ((|PLOT;Fnan?| |m| $) (LETT |m| 0.0 . #2#)))
          (SEQ (LETT |p| NIL . #2#) (LETT #1# (CDR |l|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |n| |m| . #2#)
                    (LETT |m| (SPADCALL |m| (SPADCALL |p| |f|) |g|) . #2#)
                    (EXIT (COND ((|PLOT;Fnan?| |m| $) (LETT |m| |n| . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |m|))))) 

(DEFUN |PLOT;rangeRefine| (|curve| |nRange| $)
  (PROG (|yRange| |xRange| |p| |t| |i| |d| |n| |q| |c| |s| #1=#:G203 |f| |h|
         |l|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (|PLOT;checkRange| |nRange| $)
            (LETT |l| (SPADCALL |nRange| (QREFELT $ 24))
                  . #2=(|PLOT;rangeRefine|))
            (LETT |h| (SPADCALL |nRange| (QREFELT $ 25)) . #2#)
            (LETT |t| (QVELT |curve| 2) . #2#)
            (LETT |p| (QVELT |curve| 3) . #2#)
            (LETT |f| (QVELT |curve| 0) . #2#)
            (SEQ G190
                 (COND
                  ((NULL
                    (COND ((NULL |t|) 'NIL)
                          ('T (|less_DF| (|SPADfirst| |t|) |l|))))
                   (GO G191)))
                 (SEQ (LETT |t| (CDR |t|) . #2#)
                      (EXIT (LETT |p| (CDR |p|) . #2#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (LETT |c| NIL . #2#) (LETT |q| NIL . #2#)
            (SEQ G190
                 (COND
                  ((NULL
                    (COND ((NULL |t|) 'NIL)
                          ('T
                           (SPADCALL (|SPADfirst| |t|) |h| (QREFELT $ 47)))))
                   (GO G191)))
                 (SEQ (LETT |c| (CONS (|SPADfirst| |t|) |c|) . #2#)
                      (LETT |q| (CONS (|SPADfirst| |p|) |q|) . #2#)
                      (LETT |t| (CDR |t|) . #2#)
                      (EXIT (LETT |p| (CDR |p|) . #2#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (COND
             ((NULL |c|)
              (PROGN
               (LETT #1# (|PLOT;basicPlot| |f| |nRange| $) . #2#)
               (GO #1#))))
            (COND
             ((|less_DF| (|SPADfirst| |c|) |h|)
              (SEQ (LETT |c| (CONS |h| |c|) . #2#)
                   (LETT |q| (CONS (SPADCALL |h| |f|) |q|) . #2#)
                   (EXIT (SETELT $ 10 (+ (QREFELT $ 10) 1))))))
            (LETT |t| (LETT |c| (NREVERSE |c|) . #2#) . #2#)
            (LETT |p| (LETT |q| (NREVERSE |q|) . #2#) . #2#)
            (LETT |s|
                  (|div_DF| (|sub_DF| |h| |l|)
                            (|sub_DF|
                             (FLOAT (SPADCALL (QREFELT $ 32))
                                    MOST-POSITIVE-DOUBLE-FLOAT)
                             1.0))
                  . #2#)
            (COND
             ((SPADCALL (|SPADfirst| |t|) |l| (QREFELT $ 17))
              (SEQ (LETT |t| (LETT |c| (CONS |l| |c|) . #2#) . #2#)
                   (LETT |p| (LETT |q| (CONS (SPADCALL |l| |f|) |p|) . #2#)
                         . #2#)
                   (EXIT (SETELT $ 10 (+ (QREFELT $ 10) 1))))))
            (SEQ G190
                 (COND
                  ((NULL (COND ((NULL (CDR |t|)) 'NIL) ('T 'T))) (GO G191)))
                 (SEQ
                  (LETT |n|
                        (TRUNCATE
                         (|div_DF|
                          (|sub_DF| (SPADCALL |t| (QREFELT $ 49))
                                    (|SPADfirst| |t|))
                          |s|))
                        . #2#)
                  (LETT |d|
                        (|div_DF|
                         (|sub_DF| (SPADCALL |t| (QREFELT $ 49))
                                   (|SPADfirst| |t|))
                         (FLOAT (+ |n| 1) MOST-POSITIVE-DOUBLE-FLOAT))
                        . #2#)
                  (SEQ (LETT |i| 1 . #2#) G190
                       (COND ((|greater_SI| |i| |n|) (GO G191)))
                       (SEQ
                        (SPADCALL |t| '|rest|
                                  (CONS (|add_DF| (|SPADfirst| |t|) |d|)
                                        (CDR |t|))
                                  (QREFELT $ 51))
                        (SPADCALL |p| '|rest|
                                  (CONS
                                   (SPADCALL (SPADCALL |t| (QREFELT $ 49)) |f|)
                                   (CDR |p|))
                                  (QREFELT $ 53))
                        (SETELT $ 10 (+ (QREFELT $ 10) 1))
                        (LETT |t| (CDR |t|) . #2#)
                        (EXIT (LETT |p| (CDR |p|) . #2#)))
                       (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (LETT |t| (CDR |t|) . #2#) (EXIT (LETT |p| (CDR |p|) . #2#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (LETT |xRange|
                  (SPADCALL (|PLOT;select| |q| (ELT $ 55) (ELT $ 56) $)
                            (|PLOT;select| |q| (ELT $ 55) (ELT $ 57) $)
                            (QREFELT $ 27))
                  . #2#)
            (LETT |yRange|
                  (SPADCALL (|PLOT;select| |q| (ELT $ 58) (ELT $ 56) $)
                            (|PLOT;select| |q| (ELT $ 58) (ELT $ 57) $)
                            (QREFELT $ 27))
                  . #2#)
            (EXIT (VECTOR |f| (LIST |nRange| |xRange| |yRange|) |c| |q|))))
      #1# (EXIT #1#))))) 

(DEFUN |PLOT;adaptivePlot|
       (|curve| |tRange| |xRange| |yRange| |pixelfraction| $)
  (PROG (|p| |t| |todo2| |todo1| |tj| |tm| |st| |n| #1=#:G230 |dp| |s2| |s1|
         |b2| |a2| |b1| |a1| |y2| |x2| |y1| |x1| |y0| |x0| |sp| |t2| |t1| |t0|
         |todop| |todot| |headerp| |headert| |tLimit| |maxLength| |minLength|
         |f| |tDiff| |h| |l| |yDiff| |xDiff|)
    (RETURN
     (SEQ
      (LETT |xDiff|
            (|sub_DF| (SPADCALL |xRange| (QREFELT $ 25))
                      (SPADCALL |xRange| (QREFELT $ 24)))
            . #2=(|PLOT;adaptivePlot|))
      (LETT |yDiff|
            (|sub_DF| (SPADCALL |yRange| (QREFELT $ 25))
                      (SPADCALL |yRange| (QREFELT $ 24)))
            . #2#)
      (COND
       ((OR (|eql_DF| |xDiff| 0.0) (|eql_DF| |yDiff| 0.0)) (EXIT |curve|)))
      (LETT |l| (SPADCALL |tRange| (QREFELT $ 24)) . #2#)
      (LETT |h| (SPADCALL |tRange| (QREFELT $ 25)) . #2#)
      (LETT |tDiff| (|sub_DF| |h| |l|) . #2#)
      (EXIT
       (COND ((|eql_DF| |tDiff| 0.0) |curve|)
             (#3='T
              (SEQ (LETT |t| (QVELT |curve| 2) . #2#)
                   (EXIT
                    (COND ((< (LENGTH |t|) 3) |curve|)
                          (#3#
                           (SEQ (LETT |p| (QVELT |curve| 3) . #2#)
                                (LETT |f| (QVELT |curve| 0) . #2#)
                                (LETT |minLength|
                                      (|div_DF|
                                       (FLOAT 4 MOST-POSITIVE-DOUBLE-FLOAT)
                                       (FLOAT 500 MOST-POSITIVE-DOUBLE-FLOAT))
                                      . #2#)
                                (LETT |maxLength|
                                      (|div_DF| 1.0
                                                (FLOAT 6
                                                       MOST-POSITIVE-DOUBLE-FLOAT))
                                      . #2#)
                                (LETT |tLimit|
                                      (|div_DF| |tDiff|
                                                (FLOAT (* |pixelfraction| 500)
                                                       MOST-POSITIVE-DOUBLE-FLOAT))
                                      . #2#)
                                (SEQ G190
                                     (COND
                                      ((NULL
                                        (COND ((NULL |t|) 'NIL)
                                              ('T
                                               (|less_DF| (|SPADfirst| |t|)
                                                          |l|))))
                                       (GO G191)))
                                     (SEQ (LETT |t| (CDR |t|) . #2#)
                                          (EXIT (LETT |p| (CDR |p|) . #2#)))
                                     NIL (GO G190) G191 (EXIT NIL))
                                (EXIT
                                 (COND ((< (LENGTH |t|) 3) |curve|)
                                       (#3#
                                        (SEQ (LETT |headert| |t| . #2#)
                                             (LETT |headerp| |p| . #2#)
                                             (LETT |st| |t| . #2#)
                                             (LETT |sp| |p| . #2#)
                                             (LETT |todot| NIL . #2#)
                                             (LETT |todop| NIL . #2#)
                                             (SEQ G190
                                                  (COND
                                                   ((NULL
                                                     (COND
                                                      ((NULL (CDR (CDR |st|)))
                                                       'NIL)
                                                      ('T 'T)))
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |todot|
                                                         (SPADCALL |todot| |st|
                                                                   (QREFELT $
                                                                            60))
                                                         . #2#)
                                                   (LETT |todop|
                                                         (SPADCALL |todop| |sp|
                                                                   (QREFELT $
                                                                            61))
                                                         . #2#)
                                                   (LETT |st| (CDR |st|) . #2#)
                                                   (EXIT
                                                    (LETT |sp| (CDR |sp|)
                                                          . #2#)))
                                                  NIL (GO G190) G191
                                                  (EXIT NIL))
                                             (LETT |st| |headert| . #2#)
                                             (LETT |sp| |headerp| . #2#)
                                             (LETT |todo1| |todot| . #2#)
                                             (LETT |todo2| |todop| . #2#)
                                             (LETT |n| 0 . #2#)
                                             (SEQ
                                              (EXIT
                                               (SEQ G190
                                                    (COND
                                                     ((NULL
                                                       (COND
                                                        ((NULL |todo1|) 'NIL)
                                                        ('T 'T)))
                                                      (GO G191)))
                                                    (SEQ
                                                     (LETT |st|
                                                           (|SPADfirst|
                                                            |todo1|)
                                                           . #2#)
                                                     (LETT |t0|
                                                           (|SPADfirst| |st|)
                                                           . #2#)
                                                     (LETT |t1|
                                                           (SPADCALL |st|
                                                                     (QREFELT $
                                                                              49))
                                                           . #2#)
                                                     (LETT |t2|
                                                           (SPADCALL |st|
                                                                     (QREFELT $
                                                                              62))
                                                           . #2#)
                                                     (COND
                                                      ((SPADCALL |t2| |h|
                                                                 (QREFELT $
                                                                          26))
                                                       (PROGN
                                                        (LETT #1# |$NoValue|
                                                              . #2#)
                                                        (GO #1#))))
                                                     (EXIT
                                                      (COND
                                                       ((|less_DF|
                                                         (|sub_DF| |t2| |t0|)
                                                         |tLimit|)
                                                        (SEQ
                                                         (LETT |todo1|
                                                               (CDR |todo1|)
                                                               . #2#)
                                                         (LETT |todo2|
                                                               (CDR |todo2|)
                                                               . #2#)
                                                         (EXIT
                                                          (COND
                                                           ((NULL
                                                             (NULL |todo1|))
                                                            (SEQ
                                                             (LETT |t|
                                                                   (|SPADfirst|
                                                                    |todo1|)
                                                                   . #2#)
                                                             (EXIT
                                                              (LETT |p|
                                                                    (|SPADfirst|
                                                                     |todo2|)
                                                                    . #2#))))))))
                                                       ('T
                                                        (SEQ
                                                         (LETT |sp|
                                                               (|SPADfirst|
                                                                |todo2|)
                                                               . #2#)
                                                         (LETT |x0|
                                                               (SPADCALL
                                                                (|SPADfirst|
                                                                 |sp|)
                                                                (QREFELT $ 55))
                                                               . #2#)
                                                         (LETT |y0|
                                                               (SPADCALL
                                                                (|SPADfirst|
                                                                 |sp|)
                                                                (QREFELT $ 58))
                                                               . #2#)
                                                         (LETT |x1|
                                                               (SPADCALL
                                                                (SPADCALL |sp|
                                                                          (QREFELT
                                                                           $
                                                                           63))
                                                                (QREFELT $ 55))
                                                               . #2#)
                                                         (LETT |y1|
                                                               (SPADCALL
                                                                (SPADCALL |sp|
                                                                          (QREFELT
                                                                           $
                                                                           63))
                                                                (QREFELT $ 58))
                                                               . #2#)
                                                         (LETT |x2|
                                                               (SPADCALL
                                                                (SPADCALL |sp|
                                                                          (QREFELT
                                                                           $
                                                                           64))
                                                                (QREFELT $ 55))
                                                               . #2#)
                                                         (LETT |y2|
                                                               (SPADCALL
                                                                (SPADCALL |sp|
                                                                          (QREFELT
                                                                           $
                                                                           64))
                                                                (QREFELT $ 58))
                                                               . #2#)
                                                         (LETT |a1|
                                                               (|div_DF|
                                                                (|sub_DF| |x1|
                                                                          |x0|)
                                                                |xDiff|)
                                                               . #2#)
                                                         (LETT |b1|
                                                               (|div_DF|
                                                                (|sub_DF| |y1|
                                                                          |y0|)
                                                                |yDiff|)
                                                               . #2#)
                                                         (LETT |a2|
                                                               (|div_DF|
                                                                (|sub_DF| |x2|
                                                                          |x1|)
                                                                |xDiff|)
                                                               . #2#)
                                                         (LETT |b2|
                                                               (|div_DF|
                                                                (|sub_DF| |y2|
                                                                          |y1|)
                                                                |yDiff|)
                                                               . #2#)
                                                         (LETT |s1|
                                                               (SPADCALL
                                                                (|add_DF|
                                                                 (SPADCALL |a1|
                                                                           2
                                                                           (QREFELT
                                                                            $
                                                                            66))
                                                                 (SPADCALL |b1|
                                                                           2
                                                                           (QREFELT
                                                                            $
                                                                            66)))
                                                                (QREFELT $ 67))
                                                               . #2#)
                                                         (LETT |s2|
                                                               (SPADCALL
                                                                (|add_DF|
                                                                 (SPADCALL |a2|
                                                                           2
                                                                           (QREFELT
                                                                            $
                                                                            66))
                                                                 (SPADCALL |b2|
                                                                           2
                                                                           (QREFELT
                                                                            $
                                                                            66)))
                                                                (QREFELT $ 67))
                                                               . #2#)
                                                         (LETT |dp|
                                                               (|add_DF|
                                                                (|mul_DF| |a1|
                                                                          |a2|)
                                                                (|mul_DF| |b1|
                                                                          |b2|))
                                                               . #2#)
                                                         (COND
                                                          ((|less_DF| |s1|
                                                                      |maxLength|)
                                                           (COND
                                                            ((|less_DF| |s2|
                                                                        |maxLength|)
                                                             (COND
                                                              ((OR
                                                                (|eql_DF| |s1|
                                                                          0.0)
                                                                (|eql_DF| |s2|
                                                                          0.0))
                                                               (EXIT
                                                                (SEQ
                                                                 (LETT |todo1|
                                                                       (CDR
                                                                        |todo1|)
                                                                       . #2#)
                                                                 (LETT |todo2|
                                                                       (CDR
                                                                        |todo2|)
                                                                       . #2#)
                                                                 (EXIT
                                                                  (COND
                                                                   ((NULL
                                                                     (NULL
                                                                      |todo1|))
                                                                    (SEQ
                                                                     (LETT |t|
                                                                           (|SPADfirst|
                                                                            |todo1|)
                                                                           . #2#)
                                                                     (EXIT
                                                                      (LETT |p|
                                                                            (|SPADfirst|
                                                                             |todo2|)
                                                                            . #2#)))))))))
                                                              ((|less_DF| |s1|
                                                                          |minLength|)
                                                               (COND
                                                                ((OR
                                                                  (|less_DF|
                                                                   |s2|
                                                                   |minLength|)
                                                                  (SPADCALL
                                                                   (|div_DF|
                                                                    (|div_DF|
                                                                     |dp| |s1|)
                                                                    |s2|)
                                                                   (QREFELT $
                                                                            14)
                                                                   (QREFELT $
                                                                            26)))
                                                                 (EXIT
                                                                  (SEQ
                                                                   (LETT
                                                                    |todo1|
                                                                    (CDR
                                                                     |todo1|)
                                                                    . #2#)
                                                                   (LETT
                                                                    |todo2|
                                                                    (CDR
                                                                     |todo2|)
                                                                    . #2#)
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
                                                                        . #2#)
                                                                       (EXIT
                                                                        (LETT
                                                                         |p|
                                                                         (|SPADfirst|
                                                                          |todo2|)
                                                                         . #2#)))))))))))
                                                              ('T
                                                               (COND
                                                                ((SPADCALL
                                                                  (|div_DF|
                                                                   (|div_DF|
                                                                    |dp| |s1|)
                                                                   |s2|)
                                                                  (QREFELT $
                                                                           14)
                                                                  (QREFELT $
                                                                           26))
                                                                 (EXIT
                                                                  (SEQ
                                                                   (LETT
                                                                    |todo1|
                                                                    (CDR
                                                                     |todo1|)
                                                                    . #2#)
                                                                   (LETT
                                                                    |todo2|
                                                                    (CDR
                                                                     |todo2|)
                                                                    . #2#)
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
                                                                        . #2#)
                                                                       (EXIT
                                                                        (LETT
                                                                         |p|
                                                                         (|SPADfirst|
                                                                          |todo2|)
                                                                         . #2#))))))))))))))))
                                                         (COND
                                                          ((SPADCALL |n|
                                                                     (QREFELT $
                                                                              9)
                                                                     (QREFELT $
                                                                              35))
                                                           (PROGN
                                                            (LETT #1#
                                                                  |$NoValue|
                                                                  . #2#)
                                                            (GO #1#)))
                                                          ('T
                                                           (LETT |n| (+ |n| 1)
                                                                 . #2#)))
                                                         (LETT |st| (CDR |t|)
                                                               . #2#)
                                                         (EXIT
                                                          (COND
                                                           ((NULL
                                                             (CDR (CDR |st|)))
                                                            (SEQ
                                                             (LETT |tm|
                                                                   (|div_DF|
                                                                    (|add_DF|
                                                                     |t0| |t1|)
                                                                    (FLOAT 2
                                                                           MOST-POSITIVE-DOUBLE-FLOAT))
                                                                   . #2#)
                                                             (LETT |tj| |tm|
                                                                   . #2#)
                                                             (SPADCALL |t|
                                                                       '|rest|
                                                                       (CONS
                                                                        |tj|
                                                                        (CDR
                                                                         |t|))
                                                                       (QREFELT
                                                                        $ 51))
                                                             (SPADCALL |p|
                                                                       '|rest|
                                                                       (CONS
                                                                        (SPADCALL
                                                                         |tj|
                                                                         |f|)
                                                                        (CDR
                                                                         |p|))
                                                                       (QREFELT
                                                                        $ 53))
                                                             (LETT |todo1|
                                                                   (SPADCALL
                                                                    |todo1| |t|
                                                                    (QREFELT $
                                                                             60))
                                                                   . #2#)
                                                             (LETT |todo2|
                                                                   (SPADCALL
                                                                    |todo2| |p|
                                                                    (QREFELT $
                                                                             61))
                                                                   . #2#)
                                                             (LETT |t|
                                                                   (CDR |t|)
                                                                   . #2#)
                                                             (LETT |p|
                                                                   (CDR |p|)
                                                                   . #2#)
                                                             (LETT |todo1|
                                                                   (SPADCALL
                                                                    |todo1| |t|
                                                                    (QREFELT $
                                                                             60))
                                                                   . #2#)
                                                             (LETT |todo2|
                                                                   (SPADCALL
                                                                    |todo2| |p|
                                                                    (QREFELT $
                                                                             61))
                                                                   . #2#)
                                                             (LETT |t|
                                                                   (CDR |t|)
                                                                   . #2#)
                                                             (LETT |p|
                                                                   (CDR |p|)
                                                                   . #2#)
                                                             (LETT |tm|
                                                                   (|div_DF|
                                                                    (|add_DF|
                                                                     |t1| |t2|)
                                                                    (FLOAT 2
                                                                           MOST-POSITIVE-DOUBLE-FLOAT))
                                                                   . #2#)
                                                             (LETT |tj| |tm|
                                                                   . #2#)
                                                             (SPADCALL |t|
                                                                       '|rest|
                                                                       (CONS
                                                                        |tj|
                                                                        (CDR
                                                                         |t|))
                                                                       (QREFELT
                                                                        $ 51))
                                                             (SPADCALL |p|
                                                                       '|rest|
                                                                       (CONS
                                                                        (SPADCALL
                                                                         |tj|
                                                                         |f|)
                                                                        (CDR
                                                                         |p|))
                                                                       (QREFELT
                                                                        $ 53))
                                                             (LETT |todo1|
                                                                   (SPADCALL
                                                                    |todo1| |t|
                                                                    (QREFELT $
                                                                             60))
                                                                   . #2#)
                                                             (LETT |todo2|
                                                                   (SPADCALL
                                                                    |todo2| |p|
                                                                    (QREFELT $
                                                                             61))
                                                                   . #2#)
                                                             (LETT |todo1|
                                                                   (CDR
                                                                    |todo1|)
                                                                   . #2#)
                                                             (LETT |todo2|
                                                                   (CDR
                                                                    |todo2|)
                                                                   . #2#)
                                                             (EXIT
                                                              (COND
                                                               ((NULL
                                                                 (NULL
                                                                  |todo1|))
                                                                (SEQ
                                                                 (LETT |t|
                                                                       (|SPADfirst|
                                                                        |todo1|)
                                                                       . #2#)
                                                                 (EXIT
                                                                  (LETT |p|
                                                                        (|SPADfirst|
                                                                         |todo2|)
                                                                        . #2#))))))))
                                                           ('T
                                                            (SEQ
                                                             (LETT |tm|
                                                                   (|div_DF|
                                                                    (|add_DF|
                                                                     |t0| |t1|)
                                                                    (FLOAT 2
                                                                           MOST-POSITIVE-DOUBLE-FLOAT))
                                                                   . #2#)
                                                             (LETT |tj| |tm|
                                                                   . #2#)
                                                             (SPADCALL |t|
                                                                       '|rest|
                                                                       (CONS
                                                                        |tj|
                                                                        (CDR
                                                                         |t|))
                                                                       (QREFELT
                                                                        $ 51))
                                                             (SPADCALL |p|
                                                                       '|rest|
                                                                       (CONS
                                                                        (SPADCALL
                                                                         |tj|
                                                                         |f|)
                                                                        (CDR
                                                                         |p|))
                                                                       (QREFELT
                                                                        $ 53))
                                                             (LETT |todo1|
                                                                   (SPADCALL
                                                                    |todo1| |t|
                                                                    (QREFELT $
                                                                             60))
                                                                   . #2#)
                                                             (LETT |todo2|
                                                                   (SPADCALL
                                                                    |todo2| |p|
                                                                    (QREFELT $
                                                                             61))
                                                                   . #2#)
                                                             (LETT |t|
                                                                   (CDR |t|)
                                                                   . #2#)
                                                             (LETT |p|
                                                                   (CDR |p|)
                                                                   . #2#)
                                                             (LETT |todo1|
                                                                   (SPADCALL
                                                                    |todo1| |t|
                                                                    (QREFELT $
                                                                             60))
                                                                   . #2#)
                                                             (LETT |todo2|
                                                                   (SPADCALL
                                                                    |todo2| |p|
                                                                    (QREFELT $
                                                                             61))
                                                                   . #2#)
                                                             (LETT |t|
                                                                   (CDR |t|)
                                                                   . #2#)
                                                             (LETT |p|
                                                                   (CDR |p|)
                                                                   . #2#)
                                                             (LETT |todo1|
                                                                   (CDR
                                                                    |todo1|)
                                                                   . #2#)
                                                             (LETT |todo2|
                                                                   (CDR
                                                                    |todo2|)
                                                                   . #2#)
                                                             (LETT |tm|
                                                                   (|div_DF|
                                                                    (|add_DF|
                                                                     |t1| |t2|)
                                                                    (FLOAT 2
                                                                           MOST-POSITIVE-DOUBLE-FLOAT))
                                                                   . #2#)
                                                             (LETT |tj| |tm|
                                                                   . #2#)
                                                             (SPADCALL |t|
                                                                       '|rest|
                                                                       (CONS
                                                                        |tj|
                                                                        (CDR
                                                                         |t|))
                                                                       (QREFELT
                                                                        $ 51))
                                                             (SPADCALL |p|
                                                                       '|rest|
                                                                       (CONS
                                                                        (SPADCALL
                                                                         |tj|
                                                                         |f|)
                                                                        (CDR
                                                                         |p|))
                                                                       (QREFELT
                                                                        $ 53))
                                                             (LETT |todo1|
                                                                   (SPADCALL
                                                                    |todo1| |t|
                                                                    (QREFELT $
                                                                             60))
                                                                   . #2#)
                                                             (LETT |todo2|
                                                                   (SPADCALL
                                                                    |todo2| |p|
                                                                    (QREFELT $
                                                                             61))
                                                                   . #2#)
                                                             (LETT |t|
                                                                   (CDR |t|)
                                                                   . #2#)
                                                             (LETT |p|
                                                                   (CDR |p|)
                                                                   . #2#)
                                                             (LETT |todo1|
                                                                   (SPADCALL
                                                                    |todo1| |t|
                                                                    (QREFELT $
                                                                             60))
                                                                   . #2#)
                                                             (LETT |todo2|
                                                                   (SPADCALL
                                                                    |todo2| |p|
                                                                    (QREFELT $
                                                                             61))
                                                                   . #2#)
                                                             (LETT |todo1|
                                                                   (CDR
                                                                    |todo1|)
                                                                   . #2#)
                                                             (LETT |todo2|
                                                                   (CDR
                                                                    |todo2|)
                                                                   . #2#)
                                                             (EXIT
                                                              (COND
                                                               ((NULL
                                                                 (NULL
                                                                  |todo1|))
                                                                (SEQ
                                                                 (LETT |t|
                                                                       (|SPADfirst|
                                                                        |todo1|)
                                                                       . #2#)
                                                                 (EXIT
                                                                  (LETT |p|
                                                                        (|SPADfirst|
                                                                         |todo2|)
                                                                        . #2#)))))))))))))))
                                                    NIL (GO G190) G191
                                                    (EXIT NIL)))
                                              #1# (EXIT #1#))
                                             (EXIT
                                              (COND
                                               ((SPADCALL |n| 0 (QREFELT $ 35))
                                                (SEQ
                                                 (SETELT $ 10
                                                         (+ (QREFELT $ 10)
                                                            |n|))
                                                 (LETT |t| (QVELT |curve| 2)
                                                       . #2#)
                                                 (LETT |p| (QVELT |curve| 3)
                                                       . #2#)
                                                 (LETT |xRange|
                                                       (SPADCALL
                                                        (|PLOT;select| |p|
                                                         (ELT $ 55) (ELT $ 56)
                                                         $)
                                                        (|PLOT;select| |p|
                                                         (ELT $ 55) (ELT $ 57)
                                                         $)
                                                        (QREFELT $ 27))
                                                       . #2#)
                                                 (LETT |yRange|
                                                       (SPADCALL
                                                        (|PLOT;select| |p|
                                                         (ELT $ 58) (ELT $ 56)
                                                         $)
                                                        (|PLOT;select| |p|
                                                         (ELT $ 58) (ELT $ 57)
                                                         $)
                                                        (QREFELT $ 27))
                                                       . #2#)
                                                 (EXIT
                                                  (VECTOR (QVELT |curve| 0)
                                                          (LIST |tRange|
                                                                |xRange|
                                                                |yRange|)
                                                          |t| |p|))))
                                               (#3# |curve|))))))))))))))))))) 

(DEFUN |PLOT;basicPlot| (|f| |tRange| $)
  (PROG (|yRange| |xRange| |p| |t| |l| #1=#:G268 |i| |s| |h|)
    (RETURN
     (SEQ (|PLOT;checkRange| |tRange| $)
          (LETT |l| (SPADCALL |tRange| (QREFELT $ 24)) . #2=(|PLOT;basicPlot|))
          (LETT |h| (SPADCALL |tRange| (QREFELT $ 25)) . #2#)
          (LETT |t| (SPADCALL |l| (QREFELT $ 68)) . #2#)
          (LETT |p| (SPADCALL (SPADCALL |l| |f|) (QREFELT $ 69)) . #2#)
          (LETT |s|
                (|div_DF| (|sub_DF| |h| |l|)
                          (FLOAT (- (SPADCALL (QREFELT $ 32)) 1)
                                 MOST-POSITIVE-DOUBLE-FLOAT))
                . #2#)
          (SEQ (LETT |i| 2 . #2#)
               (LETT #1# (- (SPADCALL (QREFELT $ 32)) 1) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |l| (|add_DF| |l| |s|) . #2#)
                    (LETT |t| (CONS |l| |t|) . #2#)
                    (EXIT (LETT |p| (CONS (SPADCALL |l| |f|) |p|) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |t| (NREVERSE (CONS |h| |t|)) . #2#)
          (LETT |p| (NREVERSE (CONS (SPADCALL |h| |f|) |p|)) . #2#)
          (LETT |xRange|
                (SPADCALL (|PLOT;select| |p| (ELT $ 55) (ELT $ 56) $)
                          (|PLOT;select| |p| (ELT $ 55) (ELT $ 57) $)
                          (QREFELT $ 27))
                . #2#)
          (LETT |yRange|
                (SPADCALL (|PLOT;select| |p| (ELT $ 58) (ELT $ 56) $)
                          (|PLOT;select| |p| (ELT $ 58) (ELT $ 57) $)
                          (QREFELT $ 27))
                . #2#)
          (EXIT (VECTOR |f| (LIST |tRange| |xRange| |yRange|) |t| |p|)))))) 

(DEFUN |PLOT;zoom;$S$;27| (|p| |xRange| $)
  (VECTOR (QVELT |p| 0) (LIST |xRange| (SPADCALL (QVELT |p| 1) (QREFELT $ 30)))
          (QVELT |p| 2) (QVELT |p| 3) (QVELT |p| 4))) 

(DEFUN |PLOT;zoom;$2S$;28| (|p| |xRange| |yRange| $)
  (VECTOR (QVELT |p| 0) (LIST |xRange| |yRange|) (QVELT |p| 2) (QVELT |p| 3)
          (QVELT |p| 4))) 

(DEFUN |PLOT;basicRefine| (|curve| |nRange| $)
  (PROG (|yRange| |xRange| |p| |t| |pm| |tm| |f| |h| |l| |tRange|)
    (RETURN
     (SEQ
      (LETT |tRange| (|SPADfirst| (QVELT |curve| 1)) . #1=(|PLOT;basicRefine|))
      (LETT |curve|
            (VECTOR (QVELT |curve| 0) (QVELT |curve| 1) (QVELT |curve| 2)
                    (QVELT |curve| 3))
            . #1#)
      (LETT |t|
            (QSETVELT |curve| 2 (SPADCALL (QVELT |curve| 2) (QREFELT $ 72)))
            . #1#)
      (LETT |p|
            (QSETVELT |curve| 3 (SPADCALL (QVELT |curve| 3) (QREFELT $ 73)))
            . #1#)
      (LETT |l| (SPADCALL |nRange| (QREFELT $ 24)) . #1#)
      (LETT |h| (SPADCALL |nRange| (QREFELT $ 25)) . #1#)
      (LETT |f| (QVELT |curve| 0) . #1#)
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
               (SEQ (LETT |t| (CDR |t|) . #1#)
                    (EXIT (LETT |p| (CDR |p|) . #1#))))
              ('T
               (SEQ
                (LETT |tm|
                      (|div_DF|
                       (|add_DF| (|SPADfirst| |t|)
                                 (SPADCALL |t| (QREFELT $ 49)))
                       (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))
                      . #1#)
                (LETT |pm| (SPADCALL |tm| |f|) . #1#)
                (SETELT $ 10 (+ (QREFELT $ 10) 1))
                (SPADCALL |t| '|rest| (CONS |tm| (CDR |t|)) (QREFELT $ 51))
                (LETT |t| (CDR (CDR |t|)) . #1#)
                (SPADCALL |p| '|rest| (CONS |pm| (CDR |p|)) (QREFELT $ 53))
                (EXIT (LETT |p| (CDR (CDR |p|)) . #1#)))))))
           NIL (GO G190) G191 (EXIT NIL))
      (LETT |t| (QVELT |curve| 2) . #1#) (LETT |p| (QVELT |curve| 3) . #1#)
      (LETT |xRange|
            (SPADCALL (|PLOT;select| |p| (ELT $ 55) (ELT $ 56) $)
                      (|PLOT;select| |p| (ELT $ 55) (ELT $ 57) $)
                      (QREFELT $ 27))
            . #1#)
      (LETT |yRange|
            (SPADCALL (|PLOT;select| |p| (ELT $ 58) (ELT $ 56) $)
                      (|PLOT;select| |p| (ELT $ 58) (ELT $ 57) $)
                      (QREFELT $ 27))
            . #1#)
      (EXIT
       (VECTOR (QVELT |curve| 0) (LIST |tRange| |xRange| |yRange|) |t| |p|)))))) 

(DEFUN |PLOT;refine;2$;30| (|p| $)
  (SPADCALL |p| (|PLOT;parametricRange| |p| $) (QREFELT $ 74))) 

(DEFUN |PLOT;refine;$S$;31| (|p| |nRange| $)
  (PROG (|yRange| |xRange| |curves| #1=#:G306 |c| #2=#:G305 |tlimit| #3=#:G304
         #4=#:G303 |tRange|)
    (RETURN
     (SEQ (SETELT $ 10 0)
          (LETT |tRange| (|PLOT;parametricRange| |p| $)
                . #5=(|PLOT;refine;$S$;31|))
          (LETT |nRange| (|PLOT;intersect| |tRange| |nRange| $) . #5#)
          (LETT |curves|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |c| NIL . #5#) (LETT #3# (QVELT |p| 4) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |c| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS (|PLOT;basicRefine| |c| |nRange| $) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |xRange| (|PLOT;join| |curves| 1 $) . #5#)
          (LETT |yRange| (|PLOT;join| |curves| 2 $) . #5#)
          (COND
           ((SPADCALL (QREFELT $ 39))
            (SEQ
             (LETT |tlimit| (COND ((SPADCALL |p| (QREFELT $ 41)) 8) ('T 1))
                   . #5#)
             (LETT |curves|
                   (PROGN
                    (LETT #2# NIL . #5#)
                    (SEQ (LETT |c| NIL . #5#) (LETT #1# |curves| . #5#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |c| (CAR #1#) . #5#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (|PLOT;adaptivePlot| |c| |nRange| |xRange|
                                   |yRange| |tlimit| $)
                                  #2#)
                                 . #5#)))
                         (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   . #5#)
             (LETT |xRange| (|PLOT;join| |curves| 1 $) . #5#)
             (EXIT (LETT |yRange| (|PLOT;join| |curves| 2 $) . #5#)))))
          (EXIT
           (VECTOR (QVELT |p| 0) (QVELT |p| 1)
                   (LIST |tRange| |xRange| |yRange|) (QVELT |p| 3)
                   |curves|)))))) 

(DEFUN |PLOT;plot;$S$;32| (|p| |tRange| $)
  (PROG (|yRange| |xRange| |curves| #1=#:G317 |c| #2=#:G316 |tlimit| #3=#:G315
         #4=#:G314)
    (RETURN
     (SEQ (SETELT $ 10 0)
          (LETT |curves|
                (PROGN
                 (LETT #4# NIL . #5=(|PLOT;plot;$S$;32|))
                 (SEQ (LETT |c| NIL . #5#) (LETT #3# (QVELT |p| 4) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |c| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS (|PLOT;rangeRefine| |c| |tRange| $) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |xRange| (|PLOT;join| |curves| 1 $) . #5#)
          (LETT |yRange| (|PLOT;join| |curves| 2 $) . #5#)
          (COND
           ((SPADCALL (QREFELT $ 39))
            (SEQ
             (LETT |tlimit| (COND ((SPADCALL |p| (QREFELT $ 41)) 8) ('T 1))
                   . #5#)
             (LETT |curves|
                   (PROGN
                    (LETT #2# NIL . #5#)
                    (SEQ (LETT |c| NIL . #5#) (LETT #1# |curves| . #5#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |c| (CAR #1#) . #5#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (|PLOT;adaptivePlot| |c| |tRange| |xRange|
                                   |yRange| |tlimit| $)
                                  #2#)
                                 . #5#)))
                         (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   . #5#)
             (LETT |xRange| (|PLOT;join| |curves| 1 $) . #5#)
             (EXIT (LETT |yRange| (|PLOT;join| |curves| 2 $) . #5#)))))
          (EXIT
           (VECTOR (QVELT |p| 0) (LIST |xRange| |yRange|)
                   (LIST |tRange| |xRange| |yRange|) (QVELT |p| 3)
                   |curves|)))))) 

(DEFUN |PLOT;pt| (|xx| |yy| $)
  (PROG (|l|)
    (RETURN (SPADCALL (LETT |l| (LIST |xx| |yy|) |PLOT;pt|) (QREFELT $ 77))))) 

(DEFUN |PLOT;myTrap| (|ff| |f| $)
  (PROG (|r| |s|)
    (RETURN
     (SEQ
      (LETT |s| (|trapNumericErrors| (SPADCALL |f| |ff|)) . #1=(|PLOT;myTrap|))
      (EXIT
       (COND ((QEQCAR |s| 1) 0.0)
             (#2='T
              (SEQ (LETT |r| (QCDR |s|) . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL |r| MOST-POSITIVE-DOUBLE-FLOAT (QREFELT $ 26))
                      MOST-POSITIVE-DOUBLE-FLOAT)
                     ((|less_DF| |r| MOST-NEGATIVE-DOUBLE-FLOAT)
                      MOST-NEGATIVE-DOUBLE-FLOAT)
                     (#2# |r|))))))))))) 

(DEFUN |PLOT;plot;MS$;35| (|f| |xRange| $)
  (PROG (|r| |p|)
    (RETURN
     (SEQ
      (LETT |p|
            (|PLOT;basicPlot| (CONS #'|PLOT;plot;MS$;35!0| (VECTOR $ |f|))
             |xRange| $)
            . #1=(|PLOT;plot;MS$;35|))
      (LETT |r| (QVELT |p| 1) . #1#) (SETELT $ 10 (SPADCALL (QREFELT $ 32)))
      (COND
       ((SPADCALL (QREFELT $ 39))
        (SEQ
         (LETT |p|
               (|PLOT;adaptivePlot| |p| (|SPADfirst| |r|)
                (SPADCALL |r| (QREFELT $ 29)) (SPADCALL |r| (QREFELT $ 30)) 1
                $)
               . #1#)
         (EXIT (LETT |r| (QVELT |p| 1) . #1#)))))
      (EXIT (VECTOR 'NIL (CDR |r|) |r| NIL (LIST |p|))))))) 

(DEFUN |PLOT;plot;MS$;35!0| (|u1| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|PLOT;plot;MS$;35|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|PLOT;pt| |u1| (|PLOT;myTrap| |f| |u1| $) $))))) 

(DEFUN |PLOT;plot;M2S$;36| (|f| |xRange| |yRange| $)
  (PROG (|p|)
    (RETURN
     (SEQ (LETT |p| (SPADCALL |f| |xRange| (QREFELT $ 79)) |PLOT;plot;M2S$;36|)
          (QSETVELT |p| 1 (LIST |xRange| (|PLOT;checkRange| |yRange| $)))
          (EXIT |p|))))) 

(DEFUN |PLOT;plot;2MS$;37| (|f| |g| |tRange| $)
  (PROG (|r| |p|)
    (RETURN
     (SEQ
      (LETT |p|
            (|PLOT;basicPlot| (CONS #'|PLOT;plot;2MS$;37!0| (VECTOR |g| $ |f|))
             |tRange| $)
            . #1=(|PLOT;plot;2MS$;37|))
      (LETT |r| (QVELT |p| 1) . #1#) (SETELT $ 10 (SPADCALL (QREFELT $ 32)))
      (COND
       ((SPADCALL (QREFELT $ 39))
        (SEQ
         (LETT |p|
               (|PLOT;adaptivePlot| |p| (|SPADfirst| |r|)
                (SPADCALL |r| (QREFELT $ 29)) (SPADCALL |r| (QREFELT $ 30)) 8
                $)
               . #1#)
         (EXIT (LETT |r| (QVELT |p| 1) . #1#)))))
      (EXIT (VECTOR 'T (CDR |r|) |r| NIL (LIST |p|))))))) 

(DEFUN |PLOT;plot;2MS$;37!0| (|z1| $$)
  (PROG (|f| $ |g|)
    (LETT |f| (QREFELT $$ 2) . #1=(|PLOT;plot;2MS$;37|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |g| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|PLOT;pt| (|PLOT;myTrap| |f| |z1| $) (|PLOT;myTrap| |g| |z1| $) $))))) 

(DEFUN |PLOT;plot;2M3S$;38| (|f| |g| |tRange| |xRange| |yRange| $)
  (PROG (|p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |f| |g| |tRange| (QREFELT $ 81))
            |PLOT;plot;2M3S$;38|)
      (QSETVELT |p| 1
                (LIST (|PLOT;checkRange| |xRange| $)
                      (|PLOT;checkRange| |yRange| $)))
      (EXIT |p|))))) 

(DEFUN |PLOT;pointPlot;MS$;39| (|f| |tRange| $)
  (PROG (|r| |p|)
    (RETURN
     (SEQ
      (LETT |p| (|PLOT;basicPlot| |f| |tRange| $)
            . #1=(|PLOT;pointPlot;MS$;39|))
      (LETT |r| (QVELT |p| 1) . #1#) (SETELT $ 10 (SPADCALL (QREFELT $ 32)))
      (COND
       ((SPADCALL (QREFELT $ 39))
        (SEQ
         (LETT |p|
               (|PLOT;adaptivePlot| |p| (|SPADfirst| |r|)
                (SPADCALL |r| (QREFELT $ 29)) (SPADCALL |r| (QREFELT $ 30)) 8
                $)
               . #1#)
         (EXIT (LETT |r| (QVELT |p| 1) . #1#)))))
      (EXIT (VECTOR 'T (CDR |r|) |r| NIL (LIST |p|))))))) 

(DEFUN |PLOT;pointPlot;M3S$;40| (|f| |tRange| |xRange| |yRange| $)
  (PROG (|p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |f| |tRange| (QREFELT $ 84))
            |PLOT;pointPlot;M3S$;40|)
      (QSETVELT |p| 1
                (LIST (|PLOT;checkRange| |xRange| $)
                      (|PLOT;checkRange| |yRange| $)))
      (EXIT |p|))))) 

(DEFUN |PLOT;plot;LS$;41| (|l| |xRange| $)
  (PROG (|yRange| |t| #1=#:G369 |f| #2=#:G370 |p| #3=#:G368 #4=#:G367
         #5=#:G366)
    (RETURN
     (SEQ (COND ((NULL |l|) (|error| "empty list of functions")))
          (LETT |t|
                (PROGN
                 (LETT #5# NIL . #6=(|PLOT;plot;LS$;41|))
                 (SEQ (LETT |f| NIL . #6#) (LETT #4# |l| . #6#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5#
                              (CONS
                               (|PLOT;basicPlot|
                                (CONS #'|PLOT;plot;LS$;41!0| (VECTOR $ |f|))
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
                                  (|PLOT;adaptivePlot| |p| |xRange| |xRange|
                                   |yRange| 1 $)
                                  #3#)
                                 . #6#)))
                         (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #6#))
                               . #6#)
                         (GO G190) G191 (EXIT (NREVERSE #3#))))
                   . #6#)
             (EXIT (LETT |yRange| (|PLOT;join| |t| 2 $) . #6#)))))
          (EXIT
           (VECTOR 'NIL (LIST |xRange| |yRange|)
                   (LIST |xRange| |xRange| |yRange|) NIL |t|)))))) 

(DEFUN |PLOT;plot;LS$;41!0| (|z1| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|PLOT;plot;LS$;41|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|PLOT;pt| |z1| (|PLOT;myTrap| |f| |z1| $) $))))) 

(DEFUN |PLOT;plot;L2S$;42| (|l| |xRange| |yRange| $)
  (PROG (|p|)
    (RETURN
     (SEQ (LETT |p| (SPADCALL |l| |xRange| (QREFELT $ 87)) |PLOT;plot;L2S$;42|)
          (QSETVELT |p| 1 (LIST |xRange| (|PLOT;checkRange| |yRange| $)))
          (EXIT |p|))))) 

(DEFUN |PLOT;plotPolar;MS$;43| (|f| |thetaRange| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|PLOT;plotPolar;MS$;43!0| (VECTOR $ |f|))
               (CONS #'|PLOT;plotPolar;MS$;43!1| (VECTOR $ |f|)) |thetaRange|
               (QREFELT $ 81))))) 

(DEFUN |PLOT;plotPolar;MS$;43!1| (|v1| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|PLOT;plotPolar;MS$;43|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |v1| |f|) (SPADCALL |v1| (QREFELT $ 91))
                (QREFELT $ 90)))))) 

(DEFUN |PLOT;plotPolar;MS$;43!0| (|u1| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|PLOT;plotPolar;MS$;43|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |u1| |f|) (SPADCALL |u1| (QREFELT $ 89))
                (QREFELT $ 90)))))) 

(DEFUN |PLOT;plotPolar;M$;44| (|f| $)
  (SPADCALL |f|
            (SPADCALL 0.0
                      (SPADCALL 2 (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                                (QREFELT $ 93))
                      (QREFELT $ 94))
            (QREFELT $ 92))) 

(DEFUN |PLOT;coerce;$Of;45| (|r| $)
  (PROG (|f| |l| #1=#:G391 |p| #2=#:G390 |h| |yRange| |xRange| #3=#:G389
         |curve| |tRange| |plotSymbol| |tSymbol| |ySymbol| |xSymbol| |spaces|)
    (RETURN
     (SEQ
      (LETT |spaces| (SPADCALL "   " (QREFELT $ 97))
            . #4=(|PLOT;coerce;$Of;45|))
      (LETT |xSymbol| "x = " . #4#) (LETT |ySymbol| "y = " . #4#)
      (LETT |tSymbol| "t = " . #4#) (LETT |plotSymbol| "PLOT" . #4#)
      (LETT |tRange| (SPADCALL (|PLOT;parametricRange| |r| $) (QREFELT $ 98))
            . #4#)
      (LETT |f| NIL . #4#)
      (SEQ (LETT |curve| NIL . #4#) (LETT #3# (QVELT |r| 4) . #4#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |curve| (CAR #3#) . #4#) NIL))
             (GO G191)))
           (SEQ
            (LETT |xRange|
                  (SPADCALL (SPADCALL (QVELT |curve| 1) (QREFELT $ 29))
                            (QREFELT $ 98))
                  . #4#)
            (LETT |yRange|
                  (SPADCALL (SPADCALL (QVELT |curve| 1) (QREFELT $ 30))
                            (QREFELT $ 98))
                  . #4#)
            (LETT |l| (LIST |xSymbol| |xRange| |spaces| |ySymbol| |yRange|)
                  . #4#)
            (COND
             ((SPADCALL |r| (QREFELT $ 41))
              (LETT |l|
                    (SPADCALL (LIST |tSymbol| |tRange| |spaces|) |l|
                              (QREFELT $ 100))
                    . #4#)))
            (LETT |h| (SPADCALL |l| (QREFELT $ 102)) . #4#)
            (LETT |l|
                  (PROGN
                   (LETT #2# NIL . #4#)
                   (SEQ (LETT |p| NIL . #4#) (LETT #1# (QVELT |curve| 3) . #4#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |p| (CAR #1#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 103)) #2#)
                                . #4#)))
                        (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  . #4#)
            (EXIT
             (LETT |f| (CONS (SPADCALL (CONS |h| |l|) (QREFELT $ 104)) |f|)
                   . #4#)))
           (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL "PLOT" (NREVERSE |f|) (QREFELT $ 105))))))) 

(DECLAIM (NOTINLINE |Plot;|)) 

(DEFUN |Plot| ()
  (PROG ()
    (RETURN
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
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|Plot|))))))))))) 

(DEFUN |Plot;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
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
                          (|:| |display| (|List| (|Segment| (|DoubleFloat|))))
                          (|:| |bounds| (|List| (|Segment| (|DoubleFloat|))))
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
                                      (|List| (|Point| (|DoubleFloat|)))))))))
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
      $)))) 

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
