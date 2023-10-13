
(/VERSIONCHECK 2) 

(DEFUN |PLOT3D;point| (|xx| |yy| |zz| |col| $)
  (PROG (|l|)
    (RETURN
     (SPADCALL (LETT |l| (LIST |xx| |yy| |zz| |col|) |PLOT3D;point|)
               (QREFELT $ 18))))) 

(DEFUN |PLOT3D;fourth| (|list| $) (|SPADfirst| (CDR (CDR (CDR |list|))))) 

(DEFUN |PLOT3D;checkRange| (|r| $)
  (COND
   ((SPADCALL (SPADCALL |r| (QREFELT $ 20)) (SPADCALL |r| (QREFELT $ 21))
              (QREFELT $ 23))
    (|error| "ranges cannot be negative"))
   ('T |r|))) 

(DEFUN |PLOT3D;intersect| (|s| |t| $)
  (|PLOT3D;checkRange|
   (SPADCALL
    (|max_DF| (SPADCALL |s| (QREFELT $ 20)) (SPADCALL |t| (QREFELT $ 20)))
    (|min_DF| (SPADCALL |s| (QREFELT $ 21)) (SPADCALL |t| (QREFELT $ 21)))
    (QREFELT $ 24))
   $)) 

(DEFUN |PLOT3D;union| (|s| |t| $)
  (SPADCALL
   (|min_DF| (SPADCALL |s| (QREFELT $ 20)) (SPADCALL |t| (QREFELT $ 20)))
   (|max_DF| (SPADCALL |s| (QREFELT $ 21)) (SPADCALL |t| (QREFELT $ 21)))
   (QREFELT $ 24))) 

(DEFUN |PLOT3D;join| (|l| |i| $)
  (PROG (|u| #1=#:G151 |r| |rr|)
    (RETURN
     (SEQ (LETT |rr| (|SPADfirst| |l|) . #2=(|PLOT3D;join|))
          (LETT |u|
                (COND ((EQL |i| 0) (|SPADfirst| (QVELT |rr| 1)))
                      ((EQL |i| 1) (SPADCALL (QVELT |rr| 1) (QREFELT $ 26)))
                      ((EQL |i| 2) (SPADCALL (QVELT |rr| 1) (QREFELT $ 27)))
                      ('T (|PLOT3D;fourth| (QVELT |rr| 1) $)))
                . #2#)
          (SEQ (LETT |r| NIL . #2#) (LETT #1# (CDR |l|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQL |i| 0)
                   (LETT |u| (|PLOT3D;union| |u| (|SPADfirst| (QVELT |r| 1)) $)
                         . #2#))
                  ((EQL |i| 1)
                   (LETT |u|
                         (|PLOT3D;union| |u|
                          (SPADCALL (QVELT |r| 1) (QREFELT $ 26)) $)
                         . #2#))
                  ((EQL |i| 2)
                   (LETT |u|
                         (|PLOT3D;union| |u|
                          (SPADCALL (QVELT |r| 1) (QREFELT $ 27)) $)
                         . #2#))
                  ('T
                   (LETT |u|
                         (|PLOT3D;union| |u| (|PLOT3D;fourth| (QVELT |r| 1) $)
                          $)
                         . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |u|))))) 

(DEFUN |PLOT3D;parametricRange| (|r| $) (|SPADfirst| (QVELT |r| 1))) 

(DEFUN |PLOT3D;minPoints3D;I;8| ($) (QREFELT $ 8)) 

(DEFUN |PLOT3D;setMinPoints3D;2I;9| (|n| $)
  (SEQ (COND ((< |n| 3) (|error| "three points minimum required")))
       (COND ((< (QREFELT $ 9) |n|) (SETELT $ 9 |n|))) (EXIT (SETELT $ 8 |n|)))) 

(DEFUN |PLOT3D;maxPoints3D;I;10| ($) (QREFELT $ 9)) 

(DEFUN |PLOT3D;setMaxPoints3D;2I;11| (|n| $)
  (SEQ (COND ((< |n| 3) (|error| "three points minimum required")))
       (COND ((SPADCALL (QREFELT $ 8) |n| (QREFELT $ 32)) (SETELT $ 8 |n|)))
       (EXIT (SETELT $ 9 |n|)))) 

(DEFUN |PLOT3D;screenResolution3D;I;12| ($) (QREFELT $ 11)) 

(DEFUN |PLOT3D;setScreenResolution3D;2I;13| (|n| $)
  (SEQ (COND ((< |n| 2) (|error| "buy a new terminal")))
       (EXIT (SETELT $ 11 |n|)))) 

(DEFUN |PLOT3D;adaptive3D?;B;14| ($) (QREFELT $ 7)) 

(DEFUN |PLOT3D;setAdaptive3D;2B;15| (|b| $) (SETELT $ 7 |b|)) 

(DEFUN |PLOT3D;numFunEvals3D;I;16| ($) (QREFELT $ 10)) 

(DEFUN |PLOT3D;debug3D;2B;17| (|b| $) (SETELT $ 15 |b|)) 

(DEFUN |PLOT3D;xRange;$S;18| (|plot| $)
  (SPADCALL (QVELT |plot| 1) (QREFELT $ 26))) 

(DEFUN |PLOT3D;yRange;$S;19| (|plot| $)
  (SPADCALL (QVELT |plot| 1) (QREFELT $ 27))) 

(DEFUN |PLOT3D;zRange;$S;20| (|plot| $) (|PLOT3D;fourth| (QVELT |plot| 1) $)) 

(DEFUN |PLOT3D;tRange;$S;21| (|plot| $) (|SPADfirst| (QVELT |plot| 1))) 

(DEFUN |PLOT3D;tValues;$L;22| (|plot| $)
  (PROG (|outList| #1=#:G174 |curve|)
    (RETURN
     (SEQ (LETT |outList| NIL . #2=(|PLOT3D;tValues;$L;22|))
          (SEQ (LETT |curve| NIL . #2#) (LETT #1# (QVELT |plot| 4) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |curve| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |outList| (CONS (QVELT |curve| 2) |outList|) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |outList|))))) 

(DEFUN |PLOT3D;select| (|l| |f| |g| $)
  (PROG (|m| |fp| #1=#:G179 |p|)
    (RETURN
     (SEQ (LETT |m| (SPADCALL (|SPADfirst| |l|) |f|) . #2=(|PLOT3D;select|))
          (SEQ (LETT |p| NIL . #2#) (LETT #1# (CDR |l|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |fp| (SPADCALL |p| |f|) . #2#)
                    (EXIT (LETT |m| (SPADCALL |m| |fp| |g|) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |m|))))) 

(DEFUN |PLOT3D;rangeRefine| (|curve| |nRange| $)
  (PROG (|zRange| |yRange| |xRange| |p| |t| |t1| |i| |d| |n| |q| |c| |s|
         #1=#:G216 |f| |h| |l|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (|PLOT3D;checkRange| |nRange| $)
            (LETT |l| (SPADCALL |nRange| (QREFELT $ 20))
                  . #2=(|PLOT3D;rangeRefine|))
            (LETT |h| (SPADCALL |nRange| (QREFELT $ 21)) . #2#)
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
                           (SPADCALL (|SPADfirst| |t|) |h| (QREFELT $ 46)))))
                   (GO G191)))
                 (SEQ (LETT |c| (CONS (|SPADfirst| |t|) |c|) . #2#)
                      (LETT |q| (CONS (|SPADfirst| |p|) |q|) . #2#)
                      (LETT |t| (CDR |t|) . #2#)
                      (EXIT (LETT |p| (CDR |p|) . #2#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (COND
             ((NULL |c|)
              (PROGN
               (LETT #1# (|PLOT3D;basicPlot| |f| |nRange| $) . #2#)
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
                             (FLOAT (QREFELT $ 8) MOST-POSITIVE-DOUBLE-FLOAT)
                             1.0))
                  . #2#)
            (COND
             ((SPADCALL (|SPADfirst| |t|) |l| (QREFELT $ 47))
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
                          (|sub_DF| (SPADCALL |t| (QREFELT $ 48))
                                    (|SPADfirst| |t|))
                          |s|))
                        . #2#)
                  (LETT |d|
                        (|div_DF|
                         (|sub_DF| (SPADCALL |t| (QREFELT $ 48))
                                   (|SPADfirst| |t|))
                         (FLOAT (+ |n| 1) MOST-POSITIVE-DOUBLE-FLOAT))
                        . #2#)
                  (SEQ (LETT |i| 1 . #2#) G190
                       (COND ((|greater_SI| |i| |n|) (GO G191)))
                       (SEQ
                        (SPADCALL |t| '|rest|
                                  (CONS (|add_DF| (|SPADfirst| |t|) |d|)
                                        (CDR |t|))
                                  (QREFELT $ 50))
                        (LETT |t1| (SPADCALL |t| (QREFELT $ 48)) . #2#)
                        (SPADCALL |p| '|rest|
                                  (CONS (SPADCALL |t1| |f|) (CDR |p|))
                                  (QREFELT $ 52))
                        (SETELT $ 10 (+ (QREFELT $ 10) 1))
                        (LETT |t| (CDR |t|) . #2#)
                        (EXIT (LETT |p| (CDR |p|) . #2#)))
                       (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (LETT |t| (CDR |t|) . #2#) (EXIT (LETT |p| (CDR |p|) . #2#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (LETT |xRange|
                  (SPADCALL (|PLOT3D;select| |q| (ELT $ 54) (ELT $ 55) $)
                            (|PLOT3D;select| |q| (ELT $ 54) (ELT $ 56) $)
                            (QREFELT $ 24))
                  . #2#)
            (LETT |yRange|
                  (SPADCALL (|PLOT3D;select| |q| (ELT $ 57) (ELT $ 55) $)
                            (|PLOT3D;select| |q| (ELT $ 57) (ELT $ 56) $)
                            (QREFELT $ 24))
                  . #2#)
            (LETT |zRange|
                  (SPADCALL (|PLOT3D;select| |q| (ELT $ 58) (ELT $ 55) $)
                            (|PLOT3D;select| |q| (ELT $ 58) (ELT $ 56) $)
                            (QREFELT $ 24))
                  . #2#)
            (EXIT
             (VECTOR |f| (LIST |nRange| |xRange| |yRange| |zRange|) |c| |q|))))
      #1# (EXIT #1#))))) 

(DEFUN |PLOT3D;adaptivePlot|
       (|curve| |tRg| |xRg| |yRg| |zRg| |pixelfraction| |resolution| $)
  (PROG (|p| |t| |todo2| |todo1| |tj| |tm| |st| |n| #1=#:G243 |dp| |s2| |s1|
         |c2| |b2| |a2| |c1| |b1| |a1| |z2| |y2| |x2| |z1| |y1| |x1| |z0| |y0|
         |x0| |sp| |t2| |t1| |t0| |todop| |todot| |headerp| |headert| |tLimit|
         |maxLength| |minLength| |f| |tDiff| |h| |l| |zDiff| |yDiff| |xDiff|)
    (RETURN
     (SEQ
      (LETT |xDiff|
            (|sub_DF| (SPADCALL |xRg| (QREFELT $ 21))
                      (SPADCALL |xRg| (QREFELT $ 20)))
            . #2=(|PLOT3D;adaptivePlot|))
      (LETT |yDiff|
            (|sub_DF| (SPADCALL |yRg| (QREFELT $ 21))
                      (SPADCALL |yRg| (QREFELT $ 20)))
            . #2#)
      (LETT |zDiff|
            (|sub_DF| (SPADCALL |zRg| (QREFELT $ 21))
                      (SPADCALL |zRg| (QREFELT $ 20)))
            . #2#)
      (COND ((|eql_DF| |xDiff| 0.0) (LETT |xDiff| 1.0 . #2#)))
      (COND ((|eql_DF| |yDiff| 0.0) (LETT |yDiff| 1.0 . #2#)))
      (COND ((|eql_DF| |zDiff| 0.0) (LETT |zDiff| 1.0 . #2#)))
      (LETT |l| (SPADCALL |tRg| (QREFELT $ 20)) . #2#)
      (LETT |h| (SPADCALL |tRg| (QREFELT $ 21)) . #2#)
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
                                       (FLOAT |resolution|
                                              MOST-POSITIVE-DOUBLE-FLOAT))
                                      . #2#)
                                (LETT |maxLength|
                                      (|div_DF| 1.0
                                                (FLOAT 4
                                                       MOST-POSITIVE-DOUBLE-FLOAT))
                                      . #2#)
                                (LETT |tLimit|
                                      (|div_DF| |tDiff|
                                                (FLOAT
                                                 (* |pixelfraction|
                                                    |resolution|)
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
                                                                            59))
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
                                                                              48))
                                                           . #2#)
                                                     (LETT |t2|
                                                           (SPADCALL |st|
                                                                     (QREFELT $
                                                                              62))
                                                           . #2#)
                                                     (COND
                                                      ((SPADCALL |t2| |h|
                                                                 (QREFELT $
                                                                          23))
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
                                                                (QREFELT $ 54))
                                                               . #2#)
                                                         (LETT |y0|
                                                               (SPADCALL
                                                                (|SPADfirst|
                                                                 |sp|)
                                                                (QREFELT $ 57))
                                                               . #2#)
                                                         (LETT |z0|
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
                                                                (QREFELT $ 54))
                                                               . #2#)
                                                         (LETT |y1|
                                                               (SPADCALL
                                                                (SPADCALL |sp|
                                                                          (QREFELT
                                                                           $
                                                                           63))
                                                                (QREFELT $ 57))
                                                               . #2#)
                                                         (LETT |z1|
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
                                                                (QREFELT $ 54))
                                                               . #2#)
                                                         (LETT |y2|
                                                               (SPADCALL
                                                                (SPADCALL |sp|
                                                                          (QREFELT
                                                                           $
                                                                           64))
                                                                (QREFELT $ 57))
                                                               . #2#)
                                                         (LETT |z2|
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
                                                         (LETT |c1|
                                                               (|div_DF|
                                                                (|sub_DF| |z1|
                                                                          |z0|)
                                                                |zDiff|)
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
                                                         (LETT |c2|
                                                               (|div_DF|
                                                                (|sub_DF| |z2|
                                                                          |z1|)
                                                                |zDiff|)
                                                               . #2#)
                                                         (LETT |s1|
                                                               (SPADCALL
                                                                (|add_DF|
                                                                 (|add_DF|
                                                                  (SPADCALL
                                                                   |a1| 2
                                                                   (QREFELT $
                                                                            66))
                                                                  (SPADCALL
                                                                   |b1| 2
                                                                   (QREFELT $
                                                                            66)))
                                                                 (SPADCALL |c1|
                                                                           2
                                                                           (QREFELT
                                                                            $
                                                                            66)))
                                                                (QREFELT $ 67))
                                                               . #2#)
                                                         (LETT |s2|
                                                               (SPADCALL
                                                                (|add_DF|
                                                                 (|add_DF|
                                                                  (SPADCALL
                                                                   |a2| 2
                                                                   (QREFELT $
                                                                            66))
                                                                  (SPADCALL
                                                                   |b2| 2
                                                                   (QREFELT $
                                                                            66)))
                                                                 (SPADCALL |c2|
                                                                           2
                                                                           (QREFELT
                                                                            $
                                                                            66)))
                                                                (QREFELT $ 67))
                                                               . #2#)
                                                         (LETT |dp|
                                                               (|add_DF|
                                                                (|add_DF|
                                                                 (|mul_DF| |a1|
                                                                           |a2|)
                                                                 (|mul_DF| |b1|
                                                                           |b2|))
                                                                (|mul_DF| |c1|
                                                                          |c2|))
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
                                                                            23)))
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
                                                                           23))
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
                                                          ((EQL |n|
                                                                (QREFELT $ 9))
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
                                                                        $ 50))
                                                             (SPADCALL |p|
                                                                       '|rest|
                                                                       (CONS
                                                                        (SPADCALL
                                                                         |tj|
                                                                         |f|)
                                                                        (CDR
                                                                         |p|))
                                                                       (QREFELT
                                                                        $ 52))
                                                             (LETT |todo1|
                                                                   (SPADCALL
                                                                    |todo1| |t|
                                                                    (QREFELT $
                                                                             59))
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
                                                                             59))
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
                                                                        $ 50))
                                                             (SPADCALL |p|
                                                                       '|rest|
                                                                       (CONS
                                                                        (SPADCALL
                                                                         |tj|
                                                                         |f|)
                                                                        (CDR
                                                                         |p|))
                                                                       (QREFELT
                                                                        $ 52))
                                                             (LETT |todo1|
                                                                   (SPADCALL
                                                                    |todo1| |t|
                                                                    (QREFELT $
                                                                             59))
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
                                                                        $ 50))
                                                             (SPADCALL |p|
                                                                       '|rest|
                                                                       (CONS
                                                                        (SPADCALL
                                                                         |tj|
                                                                         |f|)
                                                                        (CDR
                                                                         |p|))
                                                                       (QREFELT
                                                                        $ 52))
                                                             (LETT |todo1|
                                                                   (SPADCALL
                                                                    |todo1| |t|
                                                                    (QREFELT $
                                                                             59))
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
                                                                             59))
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
                                                                        $ 50))
                                                             (SPADCALL |p|
                                                                       '|rest|
                                                                       (CONS
                                                                        (SPADCALL
                                                                         |tj|
                                                                         |f|)
                                                                        (CDR
                                                                         |p|))
                                                                       (QREFELT
                                                                        $ 52))
                                                             (LETT |todo1|
                                                                   (SPADCALL
                                                                    |todo1| |t|
                                                                    (QREFELT $
                                                                             59))
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
                                                                             59))
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
                                               ((SPADCALL |n| 0 (QREFELT $ 32))
                                                (SEQ
                                                 (SETELT $ 10
                                                         (+ (QREFELT $ 10)
                                                            |n|))
                                                 (LETT |t| (QVELT |curve| 2)
                                                       . #2#)
                                                 (LETT |p| (QVELT |curve| 3)
                                                       . #2#)
                                                 (LETT |xRg|
                                                       (SPADCALL
                                                        (|PLOT3D;select| |p|
                                                         (ELT $ 54) (ELT $ 55)
                                                         $)
                                                        (|PLOT3D;select| |p|
                                                         (ELT $ 54) (ELT $ 56)
                                                         $)
                                                        (QREFELT $ 24))
                                                       . #2#)
                                                 (LETT |yRg|
                                                       (SPADCALL
                                                        (|PLOT3D;select| |p|
                                                         (ELT $ 57) (ELT $ 55)
                                                         $)
                                                        (|PLOT3D;select| |p|
                                                         (ELT $ 57) (ELT $ 56)
                                                         $)
                                                        (QREFELT $ 24))
                                                       . #2#)
                                                 (LETT |zRg|
                                                       (SPADCALL
                                                        (|PLOT3D;select| |p|
                                                         (ELT $ 58) (ELT $ 55)
                                                         $)
                                                        (|PLOT3D;select| |p|
                                                         (ELT $ 58) (ELT $ 56)
                                                         $)
                                                        (QREFELT $ 24))
                                                       . #2#)
                                                 (EXIT
                                                  (VECTOR (QVELT |curve| 0)
                                                          (LIST |tRg| |xRg|
                                                                |yRg| |zRg|)
                                                          |t| |p|))))
                                               (#3# |curve|))))))))))))))))))) 

(DEFUN |PLOT3D;basicPlot| (|f| |tRange| $)
  (PROG (|zRange| |yRange| |xRange| |p| |t| |l| #1=#:G293 |i| |s| |h|)
    (RETURN
     (SEQ (|PLOT3D;checkRange| |tRange| $)
          (LETT |l| (SPADCALL |tRange| (QREFELT $ 20))
                . #2=(|PLOT3D;basicPlot|))
          (LETT |h| (SPADCALL |tRange| (QREFELT $ 21)) . #2#)
          (LETT |t| (SPADCALL |l| (QREFELT $ 68)) . #2#)
          (LETT |p| (SPADCALL (SPADCALL |l| |f|) (QREFELT $ 69)) . #2#)
          (LETT |s|
                (|div_DF| (|sub_DF| |h| |l|)
                          (FLOAT (- (QREFELT $ 8) 1)
                                 MOST-POSITIVE-DOUBLE-FLOAT))
                . #2#)
          (SEQ (LETT |i| 2 . #2#) (LETT #1# (- (QREFELT $ 8) 1) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |l| (|add_DF| |l| |s|) . #2#)
                    (LETT |t| (CONS |l| |t|) . #2#)
                    (EXIT (LETT |p| (CONS (SPADCALL |l| |f|) |p|) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |t| (NREVERSE (CONS |h| |t|)) . #2#)
          (LETT |p| (NREVERSE (CONS (SPADCALL |h| |f|) |p|)) . #2#)
          (LETT |xRange|
                (SPADCALL (|PLOT3D;select| |p| (ELT $ 54) (ELT $ 55) $)
                          (|PLOT3D;select| |p| (ELT $ 54) (ELT $ 56) $)
                          (QREFELT $ 24))
                . #2#)
          (LETT |yRange|
                (SPADCALL (|PLOT3D;select| |p| (ELT $ 57) (ELT $ 55) $)
                          (|PLOT3D;select| |p| (ELT $ 57) (ELT $ 56) $)
                          (QREFELT $ 24))
                . #2#)
          (LETT |zRange|
                (SPADCALL (|PLOT3D;select| |p| (ELT $ 58) (ELT $ 55) $)
                          (|PLOT3D;select| |p| (ELT $ 58) (ELT $ 56) $)
                          (QREFELT $ 24))
                . #2#)
          (EXIT
           (VECTOR |f| (LIST |tRange| |xRange| |yRange| |zRange|) |t| |p|)))))) 

(DEFUN |PLOT3D;zoom;$3S$;27| (|p| |xRange| |yRange| |zRange| $)
  (VECTOR (LIST |xRange| |yRange| |zRange|) (QVELT |p| 1) (QVELT |p| 2)
          (QVELT |p| 3) (QVELT |p| 4))) 

(DEFUN |PLOT3D;basicRefine| (|curve| |nRange| $)
  (PROG (|zRange| |yRange| |xRange| |p| |t| |pm| |tm| |f| |h| |l| |tRange|)
    (RETURN
     (SEQ
      (LETT |tRange| (|SPADfirst| (QVELT |curve| 1))
            . #1=(|PLOT3D;basicRefine|))
      (LETT |curve|
            (VECTOR (QVELT |curve| 0) (QVELT |curve| 1) (QVELT |curve| 2)
                    (QVELT |curve| 3))
            . #1#)
      (LETT |t|
            (QSETVELT |curve| 2 (SPADCALL (QVELT |curve| 2) (QREFELT $ 71)))
            . #1#)
      (LETT |p|
            (QSETVELT |curve| 3 (SPADCALL (QVELT |curve| 3) (QREFELT $ 72)))
            . #1#)
      (LETT |l| (SPADCALL |nRange| (QREFELT $ 20)) . #1#)
      (LETT |h| (SPADCALL |nRange| (QREFELT $ 21)) . #1#)
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
              ((|less_DF| (SPADCALL |t| (QREFELT $ 48)) |l|)
               (SEQ (LETT |t| (CDR |t|) . #1#)
                    (EXIT (LETT |p| (CDR |p|) . #1#))))
              ('T
               (SEQ
                (LETT |tm|
                      (|div_DF|
                       (|add_DF| (|SPADfirst| |t|)
                                 (SPADCALL |t| (QREFELT $ 48)))
                       (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))
                      . #1#)
                (LETT |pm| (SPADCALL |tm| |f|) . #1#)
                (SETELT $ 10 (+ (QREFELT $ 10) 1))
                (SPADCALL |t| '|rest| (CONS |tm| (CDR |t|)) (QREFELT $ 50))
                (LETT |t| (CDR (CDR |t|)) . #1#)
                (SPADCALL |p| '|rest| (CONS |pm| (CDR |p|)) (QREFELT $ 52))
                (EXIT (LETT |p| (CDR (CDR |p|)) . #1#)))))))
           NIL (GO G190) G191 (EXIT NIL))
      (LETT |t| (QVELT |curve| 2) . #1#) (LETT |p| (QVELT |curve| 3) . #1#)
      (LETT |xRange|
            (SPADCALL (|PLOT3D;select| |p| (ELT $ 54) (ELT $ 55) $)
                      (|PLOT3D;select| |p| (ELT $ 54) (ELT $ 56) $)
                      (QREFELT $ 24))
            . #1#)
      (LETT |yRange|
            (SPADCALL (|PLOT3D;select| |p| (ELT $ 57) (ELT $ 55) $)
                      (|PLOT3D;select| |p| (ELT $ 57) (ELT $ 56) $)
                      (QREFELT $ 24))
            . #1#)
      (LETT |zRange|
            (SPADCALL (|PLOT3D;select| |p| (ELT $ 58) (ELT $ 55) $)
                      (|PLOT3D;select| |p| (ELT $ 58) (ELT $ 56) $)
                      (QREFELT $ 24))
            . #1#)
      (EXIT
       (VECTOR (QVELT |curve| 0) (LIST |tRange| |xRange| |yRange| |zRange|) |t|
               |p|)))))) 

(DEFUN |PLOT3D;refine;2$;29| (|p| $)
  (SPADCALL |p| (|PLOT3D;parametricRange| |p| $) (QREFELT $ 73))) 

(DEFUN |PLOT3D;refine;$S$;30| (|p| |nRange| $)
  (PROG (|zRange| |yRange| |xRange| |curves| |scrres| #1=#:G334 |c| #2=#:G333
         |tlimit| #3=#:G332 #4=#:G331 |tRange|)
    (RETURN
     (SEQ (SETELT $ 10 0)
          (LETT |tRange| (|PLOT3D;parametricRange| |p| $)
                . #5=(|PLOT3D;refine;$S$;30|))
          (LETT |nRange| (|PLOT3D;intersect| |tRange| |nRange| $) . #5#)
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
                              (CONS (|PLOT3D;basicRefine| |c| |nRange| $) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |xRange| (|PLOT3D;join| |curves| 1 $) . #5#)
          (LETT |yRange| (|PLOT3D;join| |curves| 2 $) . #5#)
          (LETT |zRange| (|PLOT3D;join| |curves| 3 $) . #5#)
          (LETT |scrres| (QVELT |p| 2) . #5#)
          (COND
           ((SPADCALL (QREFELT $ 36))
            (SEQ (LETT |tlimit| 8 . #5#)
                 (LETT |curves|
                       (PROGN
                        (LETT #2# NIL . #5#)
                        (SEQ (LETT |c| NIL . #5#) (LETT #1# |curves| . #5#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |c| (CAR #1#) . #5#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (|PLOT3D;adaptivePlot| |c| |nRange|
                                       |xRange| |yRange| |zRange| |tlimit|
                                       (LETT |scrres|
                                             (SPADCALL 2 |scrres|
                                                       (QREFELT $ 75))
                                             . #5#)
                                       $)
                                      #2#)
                                     . #5#)))
                             (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       . #5#)
                 (LETT |xRange| (|PLOT3D;join| |curves| 1 $) . #5#)
                 (LETT |yRange| (|PLOT3D;join| |curves| 2 $) . #5#)
                 (EXIT (LETT |zRange| (|PLOT3D;join| |curves| 3 $) . #5#)))))
          (EXIT
           (VECTOR (QVELT |p| 0) (LIST |tRange| |xRange| |yRange| |zRange|)
                   |scrres| (QVELT |p| 3) |curves|)))))) 

(DEFUN |PLOT3D;plot;$S$;31| (|p| |tRange| $)
  (PROG (|zRange| |yRange| |xRange| |curves| #1=#:G344 |c| #2=#:G343 |tlimit|
         #3=#:G342 #4=#:G341)
    (RETURN
     (SEQ (SETELT $ 10 0)
          (LETT |curves|
                (PROGN
                 (LETT #4# NIL . #5=(|PLOT3D;plot;$S$;31|))
                 (SEQ (LETT |c| NIL . #5#) (LETT #3# (QVELT |p| 4) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |c| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS (|PLOT3D;rangeRefine| |c| |tRange| $) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |xRange| (|PLOT3D;join| |curves| 1 $) . #5#)
          (LETT |yRange| (|PLOT3D;join| |curves| 2 $) . #5#)
          (LETT |zRange| (|PLOT3D;join| |curves| 3 $) . #5#)
          (COND
           ((SPADCALL (QREFELT $ 36))
            (SEQ (LETT |tlimit| 8 . #5#)
                 (LETT |curves|
                       (PROGN
                        (LETT #2# NIL . #5#)
                        (SEQ (LETT |c| NIL . #5#) (LETT #1# |curves| . #5#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |c| (CAR #1#) . #5#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (|PLOT3D;adaptivePlot| |c| |tRange|
                                       |xRange| |yRange| |zRange| |tlimit|
                                       (QVELT |p| 2) $)
                                      #2#)
                                     . #5#)))
                             (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       . #5#)
                 (LETT |xRange| (|PLOT3D;join| |curves| 1 $) . #5#)
                 (LETT |yRange| (|PLOT3D;join| |curves| 2 $) . #5#)
                 (EXIT (LETT |zRange| (|PLOT3D;join| |curves| 3 $) . #5#)))))
          (EXIT
           (VECTOR (LIST |xRange| |yRange| |zRange|)
                   (LIST |tRange| |xRange| |yRange| |zRange|) (QVELT |p| 2)
                   (QVELT |p| 3) |curves|)))))) 

(DEFUN |PLOT3D;pointPlot;MS$;32| (|f| |tRange| $)
  (PROG (|p| |r|)
    (RETURN
     (SEQ
      (LETT |p| (|PLOT3D;basicPlot| |f| |tRange| $)
            . #1=(|PLOT3D;pointPlot;MS$;32|))
      (LETT |r| (QVELT |p| 1) . #1#) (SETELT $ 10 (QREFELT $ 8))
      (COND
       ((SPADCALL (QREFELT $ 36))
        (LETT |p|
              (|PLOT3D;adaptivePlot| |p| (|SPADfirst| |r|)
               (SPADCALL |r| (QREFELT $ 26)) (SPADCALL |r| (QREFELT $ 27))
               (|PLOT3D;fourth| |r| $) 8 (QREFELT $ 11) $)
              . #1#)))
      (EXIT (VECTOR (CDR |r|) |r| (QREFELT $ 11) NIL (LIST |p|))))))) 

(DEFUN |PLOT3D;pointPlot;M4S$;33| (|f| |tRange| |xRange| |yRange| |zRange| $)
  (PROG (|p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |f| |tRange| (QREFELT $ 78))
            |PLOT3D;pointPlot;M4S$;33|)
      (QSETVELT |p| 0
                (LIST (|PLOT3D;checkRange| |xRange| $)
                      (|PLOT3D;checkRange| |yRange| $)
                      (|PLOT3D;checkRange| |zRange| $)))
      (EXIT |p|))))) 

(DEFUN |PLOT3D;myTrap| (|ff| |f| $)
  (PROG (|r| |s|)
    (RETURN
     (SEQ
      (LETT |s| (|trapNumericErrors| (SPADCALL |f| |ff|))
            . #1=(|PLOT3D;myTrap|))
      (COND ((QEQCAR |s| 1) (LETT |r| 0.0 . #1#))
            ('T (LETT |r| (QCDR |s|) . #1#)))
      (EXIT |r|))))) 

(DEFUN |PLOT3D;plot;4MS$;35| (|f1| |f2| |f3| |col| |tRange| $)
  (PROG (|p| |r|)
    (RETURN
     (SEQ
      (LETT |p|
            (|PLOT3D;basicPlot|
             (CONS #'|PLOT3D;plot;4MS$;35!0| (VECTOR |col| |f3| |f2| $ |f1|))
             |tRange| $)
            . #1=(|PLOT3D;plot;4MS$;35|))
      (LETT |r| (QVELT |p| 1) . #1#) (SETELT $ 10 (QREFELT $ 8))
      (COND
       ((SPADCALL (QREFELT $ 36))
        (LETT |p|
              (|PLOT3D;adaptivePlot| |p| (|SPADfirst| |r|)
               (SPADCALL |r| (QREFELT $ 26)) (SPADCALL |r| (QREFELT $ 27))
               (|PLOT3D;fourth| |r| $) 8 (QREFELT $ 11) $)
              . #1#)))
      (EXIT (VECTOR (CDR |r|) |r| (QREFELT $ 11) NIL (LIST |p|))))))) 

(DEFUN |PLOT3D;plot;4MS$;35!0| (|z1| $$)
  (PROG (|f1| $ |f2| |f3| |col|)
    (LETT |f1| (QREFELT $$ 4) . #1=(|PLOT3D;plot;4MS$;35|))
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |f2| (QREFELT $$ 2) . #1#)
    (LETT |f3| (QREFELT $$ 1) . #1#)
    (LETT |col| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|PLOT3D;point| (|PLOT3D;myTrap| |f1| |z1| $)
       (|PLOT3D;myTrap| |f2| |z1| $) (|PLOT3D;myTrap| |f3| |z1| $)
       (SPADCALL |z1| |col|) $))))) 

(DEFUN |PLOT3D;plot;4M4S$;36|
       (|f1| |f2| |f3| |col| |tRange| |xRange| |yRange| |zRange| $)
  (PROG (|p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |f1| |f2| |f3| |col| |tRange| (QREFELT $ 81))
            |PLOT3D;plot;4M4S$;36|)
      (QSETVELT |p| 0
                (LIST (|PLOT3D;checkRange| |xRange| $)
                      (|PLOT3D;checkRange| |yRange| $)
                      (|PLOT3D;checkRange| |zRange| $)))
      (EXIT |p|))))) 

(DEFUN |PLOT3D;coerce;$Of;37| (|r| $)
  (PROG (|f| |l| #1=#:G381 |p| #2=#:G380 |h| |zRange| |yRange| |xRange|
         #3=#:G379 |curve| |tRange| |tSymbol| |zSymbol| |ySymbol| |xSymbol|
         |spaces|)
    (RETURN
     (SEQ (LETT |spaces| "   " . #4=(|PLOT3D;coerce;$Of;37|))
          (LETT |xSymbol| "x = " . #4#) (LETT |ySymbol| "y = " . #4#)
          (LETT |zSymbol| "z = " . #4#) (LETT |tSymbol| "t = " . #4#)
          (LETT |tRange|
                (SPADCALL (|PLOT3D;parametricRange| |r| $) (QREFELT $ 84))
                . #4#)
          (LETT |f| NIL . #4#)
          (SEQ (LETT |curve| NIL . #4#) (LETT #3# (QVELT |r| 4) . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |curve| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |xRange|
                      (SPADCALL (SPADCALL (QVELT |curve| 1) 1 (QREFELT $ 85))
                                (QREFELT $ 84))
                      . #4#)
                (LETT |yRange|
                      (SPADCALL (SPADCALL (QVELT |curve| 1) 2 (QREFELT $ 85))
                                (QREFELT $ 84))
                      . #4#)
                (LETT |zRange|
                      (SPADCALL (SPADCALL (QVELT |curve| 1) 3 (QREFELT $ 85))
                                (QREFELT $ 84))
                      . #4#)
                (LETT |l|
                      (LIST |xSymbol| |xRange| |spaces| |ySymbol| |yRange|
                            |spaces| |zSymbol| |zRange|)
                      . #4#)
                (LETT |l|
                      (SPADCALL (LIST |tSymbol| |tRange| |spaces|) |l|
                                (QREFELT $ 87))
                      . #4#)
                (LETT |h| (SPADCALL |l| (QREFELT $ 89)) . #4#)
                (LETT |l|
                      (PROGN
                       (LETT #2# NIL . #4#)
                       (SEQ (LETT |p| NIL . #4#)
                            (LETT #1# (QVELT |curve| 3) . #4#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |p| (CAR #1#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (SPADCALL |p| (QREFELT $ 90)) #2#)
                                    . #4#)))
                            (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      . #4#)
                (EXIT
                 (LETT |f| (CONS (SPADCALL (CONS |h| |l|) (QREFELT $ 91)) |f|)
                       . #4#)))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL "PLOT" (NREVERSE |f|) (QREFELT $ 92))))))) 

(DEFUN |PLOT3D;listBranches;$L;38| (|plot| $)
  (PROG (|outList| #1=#:G386 |curve|)
    (RETURN
     (SEQ (LETT |outList| NIL . #2=(|PLOT3D;listBranches;$L;38|))
          (SEQ (LETT |curve| NIL . #2#) (LETT #1# (QVELT |plot| 4) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |curve| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |outList| (CONS (QVELT |curve| 3) |outList|) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |outList|))))) 

(DEFUN |Plot3D| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G388)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|Plot3D|) . #2=(|Plot3D|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|Plot3D|
                         (LIST (CONS NIL (CONS 1 (|Plot3D;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|Plot3D|))))))))))) 

(DEFUN |Plot3D;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|Plot3D|) . #1=(|Plot3D|))
      (LETT $ (GETREFV 95) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Plot3D| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record| (|:| |display| (|List| (|Segment| (|DoubleFloat|))))
                          (|:| |bounds| (|List| (|Segment| (|DoubleFloat|))))
                          (|:| |screenres| (|Integer|))
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

(MAKEPROP '|Plot3D| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| 'ADAPTIVE 'MINPOINTS 'MAXPOINTS
              'NUMFUNEVALS 'SCREENRES (|DoubleFloat|) (0 . |inv|) 'ANGLEBOUND
              'DEBUG (|List| 12) (|Point| 12) (5 . |point|) (|Segment| 12)
              (10 . |lo|) (15 . |hi|) (|Boolean|) (20 . >) (26 . SEGMENT)
              (|List| 19) (32 . |second|) (37 . |third|) (|Integer|)
              |PLOT3D;minPoints3D;I;8| |PLOT3D;setMinPoints3D;2I;9|
              |PLOT3D;maxPoints3D;I;10| (42 . >) |PLOT3D;setMaxPoints3D;2I;11|
              |PLOT3D;screenResolution3D;I;12|
              |PLOT3D;setScreenResolution3D;2I;13| |PLOT3D;adaptive3D?;B;14|
              |PLOT3D;setAdaptive3D;2B;15| |PLOT3D;numFunEvals3D;I;16|
              |PLOT3D;debug3D;2B;17| |PLOT3D;xRange;$S;18|
              |PLOT3D;yRange;$S;19| |PLOT3D;zRange;$S;20| |PLOT3D;tRange;$S;21|
              (|List| 16) |PLOT3D;tValues;$L;22| (48 . <=) (54 . ~=)
              (60 . |second|) '"rest" (65 . |setelt|) (|List| 17)
              (72 . |setelt|) (|PointPackage| 12) (79 . |xCoord|) (84 . |min|)
              (90 . |max|) (96 . |yCoord|) (101 . |zCoord|) (106 . |concat!|)
              (|List| 51) (112 . |concat!|) (118 . |third|) (123 . |second|)
              (128 . |third|) (|PositiveInteger|) (133 . ^) (139 . |sqrt|)
              (144 . |list|) (149 . |list|) |PLOT3D;zoom;$3S$;27|
              (154 . |copy|) (159 . |copy|) |PLOT3D;refine;$S$;30|
              |PLOT3D;refine;2$;29| (164 . *) |PLOT3D;plot;$S$;31|
              (|Mapping| 17 12) |PLOT3D;pointPlot;MS$;32|
              |PLOT3D;pointPlot;M4S$;33| (|Mapping| 12 12)
              |PLOT3D;plot;4MS$;35| |PLOT3D;plot;4M4S$;36| (|OutputForm|)
              (170 . |coerce|) (175 . |elt|) (|List| 83) (181 . |concat!|)
              (|List| $) (187 . |hconcat|) (192 . |coerce|) (197 . |vconcat|)
              (202 . |prefix|) |PLOT3D;coerce;$Of;37|
              |PLOT3D;listBranches;$L;38|)
           '#(|zoom| 208 |zRange| 216 |yRange| 221 |xRange| 226 |tValues| 231
              |tRange| 236 |setScreenResolution3D| 241 |setMinPoints3D| 246
              |setMaxPoints3D| 251 |setAdaptive3D| 256 |screenResolution3D| 261
              |refine| 265 |pointPlot| 276 |plot| 291 |numFunEvals3D| 318
              |minPoints3D| 322 |maxPoints3D| 326 |listBranches| 330 |debug3D|
              335 |coerce| 340 |adaptive3D?| 345)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0))
                 (CONS '#(NIL NIL)
                       (CONS
                        '#((|PlottableSpaceCurveCategory|) (|CoercibleTo| 83))
                        (|makeByteWordVec2| 94
                                            '(1 12 0 0 13 1 17 0 16 18 1 19 12
                                              0 20 1 19 12 0 21 2 12 22 0 0 23
                                              2 19 0 12 12 24 1 25 19 0 26 1 25
                                              19 0 27 2 28 22 0 0 32 2 12 22 0
                                              0 46 2 12 22 0 0 47 1 16 12 0 48
                                              3 16 0 0 49 0 50 3 51 0 0 49 0 52
                                              1 53 12 17 54 2 12 0 0 0 55 2 12
                                              0 0 0 56 1 53 12 17 57 1 53 12 17
                                              58 2 44 0 0 16 59 2 60 0 0 51 61
                                              1 16 12 0 62 1 51 17 0 63 1 51 17
                                              0 64 2 12 0 0 65 66 1 12 0 0 67 1
                                              16 0 12 68 1 51 0 17 69 1 16 0 0
                                              71 1 51 0 0 72 2 28 0 65 0 75 1
                                              19 83 0 84 2 25 19 0 28 85 2 86 0
                                              0 0 87 1 83 0 88 89 1 17 83 0 90
                                              1 83 0 88 91 2 83 0 0 88 92 4 0 0
                                              0 19 19 19 70 1 0 19 0 42 1 0 19
                                              0 41 1 0 19 0 40 1 0 44 0 45 1 0
                                              19 0 43 1 0 28 28 35 1 0 28 28 30
                                              1 0 28 28 33 1 0 22 22 37 0 0 28
                                              34 1 0 0 0 74 2 0 0 0 19 73 5 0 0
                                              77 19 19 19 19 79 2 0 0 77 19 78
                                              2 0 0 0 19 76 5 0 0 80 80 80 80
                                              19 81 8 0 0 80 80 80 80 19 19 19
                                              19 82 0 0 28 38 0 0 28 29 0 0 28
                                              31 1 0 60 0 94 1 0 22 22 39 1 0
                                              83 0 93 0 0 22 36)))))
           '|lookupComplete|)) 

(MAKEPROP '|Plot3D| 'NILADIC T) 
