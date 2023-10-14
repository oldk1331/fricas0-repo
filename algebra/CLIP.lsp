
(/VERSIONCHECK 2) 

(DEFUN |CLIP;Fnan?| (|x| $) (SPADCALL |x| |x| (QREFELT $ 8))) 

(DEFUN |CLIP;Pnan?| (|p| $)
  (SPADCALL (CONS (|function| |CLIP;Fnan?|) $) |p| (QREFELT $ 11))) 

(DEFUN |CLIP;iClipParametric| (|pointLists| |fraction| |scale| $)
  (PROG (|yseg| |xseg| |yMax| |xMax| |yMin| |xMin| |ys| |xs| |newclip| |denn|
         |numm| |single_eps| |yDiff| |xDiff| |k| #1=#:G195 |pt| |firstPt|
         |lastN| |clipNum| |den| |num| |n| |sortedList|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |fraction| (|spadConstant| $ 13) (QREFELT $ 14))
            (SPADCALL |fraction| (|spadConstant| $ 15) (QREFELT $ 16)))
        (|error| "clipDraw: fraction should be between 0 and 1"))
       ('T
        (COND
         ((NULL |pointLists|)
          (VECTOR NIL (SPADCALL 0.0 0.0 (QREFELT $ 18))
                  (SPADCALL 0.0 0.0 (QREFELT $ 18))))
         (#2='T
          (SEQ
           (LETT |sortedList|
                 (SPADCALL (CONS #'|CLIP;iClipParametric!0| $)
                           (SPADCALL (CONS #'|CLIP;iClipParametric!1| $)
                                     (SPADCALL |pointLists| (QREFELT $ 24))
                                     (QREFELT $ 26))
                           (QREFELT $ 28))
                 . #3=(|CLIP;iClipParametric|))
           (EXIT
            (COND
             ((NULL |sortedList|)
              (VECTOR NIL (SPADCALL 0.0 0.0 (QREFELT $ 18))
                      (SPADCALL 0.0 0.0 (QREFELT $ 18))))
             (#2#
              (SEQ (LETT |n| (LENGTH |sortedList|) . #3#)
                   (LETT |num| (SPADCALL |fraction| (QREFELT $ 30)) . #3#)
                   (LETT |den| (SPADCALL |fraction| (QREFELT $ 31)) . #3#)
                   (LETT |clipNum|
                         (QUOTIENT2 (SPADCALL |n| |num| (QREFELT $ 33)) |den|)
                         . #3#)
                   (LETT |lastN| (- (- |n| 1) |clipNum|) . #3#)
                   (LETT |firstPt| (|SPADfirst| |sortedList|) . #3#)
                   (LETT |xMin| (SPADCALL |firstPt| (QREFELT $ 35)) . #3#)
                   (LETT |xMax| (SPADCALL |firstPt| (QREFELT $ 35)) . #3#)
                   (LETT |yMin| (SPADCALL |firstPt| (QREFELT $ 36)) . #3#)
                   (LETT |yMax| (SPADCALL |firstPt| (QREFELT $ 36)) . #3#)
                   (SEQ (LETT |pt| NIL . #3#)
                        (LETT #1# (CDR |sortedList|) . #3#) (LETT |k| 0 . #3#)
                        G190
                        (COND
                         ((OR (|greater_SI| |k| |lastN|) (ATOM #1#)
                              (PROGN (LETT |pt| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |xMin|
                               (|min_DF| |xMin| (SPADCALL |pt| (QREFELT $ 35)))
                               . #3#)
                         (LETT |xMax|
                               (|max_DF| |xMax| (SPADCALL |pt| (QREFELT $ 35)))
                               . #3#)
                         (LETT |yMin|
                               (|min_DF| |yMin| (SPADCALL |pt| (QREFELT $ 36)))
                               . #3#)
                         (EXIT
                          (LETT |yMax|
                                (|max_DF| |yMax|
                                          (SPADCALL |pt| (QREFELT $ 36)))
                                . #3#)))
                        (LETT |k|
                              (PROG1 (|inc_SI| |k|) (LETT #1# (CDR #1#) . #3#))
                              . #3#)
                        (GO G190) G191 (EXIT NIL))
                   (LETT |xDiff| (|sub_DF| |xMax| |xMin|) . #3#)
                   (LETT |yDiff| (|sub_DF| |yMax| |yMin|) . #3#)
                   (EXIT
                    (COND
                     ((|eql_DF| |xDiff| 0.0)
                      (COND
                       ((|eql_DF| |yDiff| 0.0)
                        (VECTOR |pointLists|
                                (SPADCALL (|sub_DF| |xMin| 1.0)
                                          (|add_DF| |xMax| 1.0) (QREFELT $ 18))
                                (SPADCALL (|sub_DF| |yMin| 1.0)
                                          (|add_DF| |yMax| 1.0)
                                          (QREFELT $ 18))))
                       (#2#
                        (VECTOR |pointLists|
                                (SPADCALL (|sub_DF| |xMin| 1.0)
                                          (|add_DF| |xMax| 1.0) (QREFELT $ 18))
                                (SPADCALL |yMin| |yMax| (QREFELT $ 18))))))
                     (#2#
                      (SEQ
                       (LETT |single_eps|
                             (|expt_DF_I|
                              (SPADCALL (SPADCALL 2 0 10 (QREFELT $ 39))
                                        (QREFELT $ 40))
                              -19)
                             . #3#)
                       (COND
                        ((|less_DF| |yDiff| |single_eps|)
                         (SEQ
                          (LETT |yMin|
                                (COND
                                 ((|less_DF| (FLOAT-SIGN 1.0 |yMin|) 1.0)
                                  (|sub_DF| |yMin| |single_eps|))
                                 ((|less_DF| |yMin| 0.0)
                                  (|mul_DF| |yMin|
                                            (|add_DF| 1.0 |single_eps|)))
                                 (#2#
                                  (|mul_DF| |yMin|
                                            (|sub_DF| 1.0 |single_eps|))))
                                . #3#)
                          (EXIT
                           (LETT |yMax|
                                 (COND
                                  ((|less_DF| (FLOAT-SIGN 1.0 |yMax|) 1.0)
                                   (|add_DF| |yMax| |single_eps|))
                                  ((|less_DF| |yMax| 0.0)
                                   (|mul_DF| |yMax|
                                             (|sub_DF| 1.0 |single_eps|)))
                                  (#2#
                                   (|mul_DF| |yMax|
                                             (|add_DF| 1.0 |single_eps|))))
                                 . #3#)))))
                       (LETT |numm| (SPADCALL |scale| (QREFELT $ 30)) . #3#)
                       (LETT |denn| (SPADCALL |scale| (QREFELT $ 31)) . #3#)
                       (LETT |xMin|
                             (|sub_DF| |xMin|
                                       (|div_DF|
                                        (|mul_DF|
                                         (FLOAT |numm|
                                                MOST-POSITIVE-DOUBLE-FLOAT)
                                         |xDiff|)
                                        (FLOAT |denn|
                                               MOST-POSITIVE-DOUBLE-FLOAT)))
                             . #3#)
                       (LETT |xMax|
                             (|add_DF| |xMax|
                                       (|div_DF|
                                        (|mul_DF|
                                         (FLOAT |numm|
                                                MOST-POSITIVE-DOUBLE-FLOAT)
                                         |xDiff|)
                                        (FLOAT |denn|
                                               MOST-POSITIVE-DOUBLE-FLOAT)))
                             . #3#)
                       (LETT |yMin|
                             (|sub_DF| |yMin|
                                       (|div_DF|
                                        (|mul_DF|
                                         (FLOAT |numm|
                                                MOST-POSITIVE-DOUBLE-FLOAT)
                                         |yDiff|)
                                        (FLOAT |denn|
                                               MOST-POSITIVE-DOUBLE-FLOAT)))
                             . #3#)
                       (LETT |yMax|
                             (|add_DF| |yMax|
                                       (|div_DF|
                                        (|mul_DF|
                                         (FLOAT |numm|
                                                MOST-POSITIVE-DOUBLE-FLOAT)
                                         |yDiff|)
                                        (FLOAT |denn|
                                               MOST-POSITIVE-DOUBLE-FLOAT)))
                             . #3#)
                       (LETT |newclip|
                             (SPADCALL |pointLists| |xMin| |xMax| |yMin| |yMax|
                                       (QREFELT $ 43))
                             . #3#)
                       (EXIT
                        (COND
                         ((SPADCALL (LENGTH (QVELT |newclip| 0))
                                    (LENGTH |pointLists|) (QREFELT $ 44))
                          |newclip|)
                         (#2#
                          (SEQ
                           (LETT |xs|
                                 (SPADCALL (ELT $ 35) |sortedList|
                                           (QREFELT $ 48))
                                 . #3#)
                           (LETT |ys|
                                 (SPADCALL (ELT $ 36) |sortedList|
                                           (QREFELT $ 48))
                                 . #3#)
                           (LETT |xMin|
                                 (SPADCALL (ELT $ 50) |xs| (QREFELT $ 52))
                                 . #3#)
                           (LETT |yMin|
                                 (SPADCALL (ELT $ 50) |ys| (QREFELT $ 52))
                                 . #3#)
                           (LETT |xMax|
                                 (SPADCALL (ELT $ 54) |xs| (QREFELT $ 52))
                                 . #3#)
                           (LETT |yMax|
                                 (SPADCALL (ELT $ 54) |ys| (QREFELT $ 52))
                                 . #3#)
                           (LETT |xseg| (SPADCALL |xMin| |xMax| (QREFELT $ 55))
                                 . #3#)
                           (LETT |yseg| (SPADCALL |yMin| |yMax| (QREFELT $ 55))
                                 . #3#)
                           (EXIT
                            (VECTOR |pointLists| |xseg|
                                    |yseg|))))))))))))))))))))))) 

(DEFUN |CLIP;iClipParametric!1| (|z| $)
  (COND ((|CLIP;Pnan?| |z| $) (|spadConstant| $ 20))
        ('T (|spadConstant| $ 21)))) 

(DEFUN |CLIP;iClipParametric!0| (|x| |y| $)
  (SPADCALL (|CLIP;norm| |x| $) (|CLIP;norm| |y| $) (QREFELT $ 19))) 

(DEFUN |CLIP;point| (|xx| |yy| $)
  (PROG (|l|)
    (RETURN
     (SPADCALL (LETT |l| (LIST |xx| |yy|) |CLIP;point|) (QREFELT $ 56))))) 

(DEFUN |CLIP;intersectWithHorizLine| (|x1| |y1| |x2| |y2| |yy| $)
  (COND ((|eql_DF| |x1| |x2|) (|CLIP;point| |x1| |yy| $))
        ('T
         (|CLIP;point|
          (|add_DF| |x1|
                    (|div_DF|
                     (|mul_DF| (|sub_DF| |x2| |x1|) (|sub_DF| |yy| |y1|))
                     (|sub_DF| |y2| |y1|)))
          |yy| $)))) 

(DEFUN |CLIP;intersectWithVertLine| (|x1| |y1| |x2| |y2| |xx| $)
  (COND ((|eql_DF| |y1| |y2|) (|CLIP;point| |xx| |y1| $))
        ('T
         (|CLIP;point| |xx|
          (|add_DF| |y1|
                    (|div_DF|
                     (|mul_DF| (|sub_DF| |y2| |y1|) (|sub_DF| |xx| |x1|))
                     (|sub_DF| |x2| |x1|)))
          $)))) 

(DEFUN |CLIP;intersectWithBdry| (|xMin| |xMax| |yMin| |yMax| |pt1| |pt2| $)
  (PROG (|y2| |x2| |y1| |x1|)
    (RETURN
     (SEQ
      (LETT |x1| (SPADCALL |pt1| (QREFELT $ 35))
            . #1=(|CLIP;intersectWithBdry|))
      (LETT |y1| (SPADCALL |pt1| (QREFELT $ 36)) . #1#)
      (LETT |x2| (SPADCALL |pt2| (QREFELT $ 35)) . #1#)
      (LETT |y2| (SPADCALL |pt2| (QREFELT $ 36)) . #1#)
      (COND
       ((SPADCALL |y2| |yMax| (QREFELT $ 57))
        (SEQ
         (LETT |pt2|
               (|CLIP;intersectWithHorizLine| |x1| |y1| |x2| |y2| |yMax| $)
               . #1#)
         (LETT |x2| (SPADCALL |pt2| (QREFELT $ 35)) . #1#)
         (EXIT (LETT |y2| (SPADCALL |pt2| (QREFELT $ 36)) . #1#)))))
      (COND
       ((|less_DF| |y2| |yMin|)
        (SEQ
         (LETT |pt2|
               (|CLIP;intersectWithHorizLine| |x1| |y1| |x2| |y2| |yMin| $)
               . #1#)
         (LETT |x2| (SPADCALL |pt2| (QREFELT $ 35)) . #1#)
         (EXIT (LETT |y2| (SPADCALL |pt2| (QREFELT $ 36)) . #1#)))))
      (COND
       ((SPADCALL |x2| |xMax| (QREFELT $ 57))
        (SEQ
         (LETT |pt2|
               (|CLIP;intersectWithVertLine| |x1| |y1| |x2| |y2| |xMax| $)
               . #1#)
         (LETT |x2| (SPADCALL |pt2| (QREFELT $ 35)) . #1#)
         (EXIT (LETT |y2| (SPADCALL |pt2| (QREFELT $ 36)) . #1#)))))
      (COND
       ((|less_DF| |x2| |xMin|)
        (LETT |pt2| (|CLIP;intersectWithVertLine| |x1| |y1| |x2| |y2| |xMin| $)
              . #1#)))
      (EXIT |pt2|))))) 

(DEFUN |CLIP;discardAndSplit|
       (|pointList| |pred| |xMin| |xMax| |yMin| |yMax| $)
  (PROG (|list| |lastPt?| |lastPt| |ans| |bdryPt| |pt|)
    (RETURN
     (SEQ (LETT |ans| NIL . #1=(|CLIP;discardAndSplit|))
          (LETT |list| NIL . #1#) (LETT |lastPt?| 'NIL . #1#)
          (LETT |lastPt| (|CLIP;point| 0.0 0.0 $) . #1#)
          (SEQ G190
               (COND
                ((NULL (COND ((NULL |pointList|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ (LETT |pt| (|SPADfirst| |pointList|) . #1#)
                    (LETT |pointList| (CDR |pointList|) . #1#)
                    (EXIT
                     (COND
                      ((SPADCALL |pt| |pred|)
                       (SEQ
                        (COND
                         ((NULL |list|)
                          (COND
                           (|lastPt?|
                            (LETT |bdryPt|
                                  (|CLIP;intersectWithBdry| |xMin| |xMax|
                                   |yMin| |yMax| |pt| |lastPt| $)
                                  . #1#)))))
                        (EXIT (LETT |list| (CONS |pt| |list|) . #1#))))
                      ('T
                       (SEQ
                        (COND
                         ((NULL (NULL |list|))
                          (SEQ
                           (LETT |bdryPt|
                                 (|CLIP;intersectWithBdry| |xMin| |xMax| |yMin|
                                  |yMax| (|SPADfirst| |list|) |pt| $)
                                 . #1#)
                           (EXIT (LETT |ans| (CONS |list| |ans|) . #1#)))))
                        (LETT |lastPt| |pt| . #1#) (LETT |lastPt?| 'T . #1#)
                        (EXIT (LETT |list| NIL . #1#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND ((NULL |list|) |ans|)
                 ('T (NREVERSE (CONS (NREVERSE |list|) |ans|))))))))) 

(DEFUN |CLIP;clip;P2FR;9| (|plot| |fraction| |scale| $)
  (PROG (|yMax| |yMin| #1=#:G234 |pt| #2=#:G233 |list| |lists| |xMax| |xMin|
         |denn| |numm| |yDiff| |clipNum| |den| |num| |n| |sortedList|
         |pointList| |pointLists| |xVals|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |fraction| (|spadConstant| $ 13) (QREFELT $ 14))
            (SPADCALL |fraction| (SPADCALL 1 2 (QREFELT $ 58)) (QREFELT $ 16)))
        (|error| "clipDraw: fraction should be between 0 and 1/2"))
       ('T
        (SEQ
         (LETT |xVals| (SPADCALL |plot| (QREFELT $ 60))
               . #3=(|CLIP;clip;P2FR;9|))
         (EXIT
          (COND
           ((NULL (LETT |pointLists| (SPADCALL |plot| (QREFELT $ 61)) . #3#))
            (VECTOR NIL |xVals| (SPADCALL 0.0 0.0 (QREFELT $ 18))))
           ((SPADCALL
             (LETT |pointLists| (SPADCALL |plot| (QREFELT $ 61)) . #3#) 1
             (QREFELT $ 62))
            (|error| "clipDraw: plot has more than one branch"))
           ((NULL (LETT |pointList| (|SPADfirst| |pointLists|) . #3#))
            (VECTOR NIL |xVals| (SPADCALL 0.0 0.0 (QREFELT $ 18))))
           (#4='T
            (SEQ
             (LETT |sortedList|
                   (SPADCALL (CONS #'|CLIP;clip;P2FR;9!0| $) |pointList|
                             (QREFELT $ 28))
                   . #3#)
             (LETT |n| (LENGTH |sortedList|) . #3#)
             (LETT |num| (SPADCALL |fraction| (QREFELT $ 30)) . #3#)
             (LETT |den| (SPADCALL |fraction| (QREFELT $ 31)) . #3#)
             (LETT |clipNum|
                   (QUOTIENT2 (SPADCALL |n| |num| (QREFELT $ 33)) |den|) . #3#)
             (LETT |yMin|
                   (SPADCALL (SPADCALL |sortedList| |clipNum| (QREFELT $ 63))
                             (QREFELT $ 36))
                   . #3#)
             (LETT |yMax|
                   (SPADCALL
                    (SPADCALL |sortedList| (- (- |n| 1) |clipNum|)
                              (QREFELT $ 63))
                    (QREFELT $ 36))
                   . #3#)
             (COND ((|CLIP;Fnan?| |yMin| $) (LETT |yMin| 0.0 . #3#)))
             (COND ((|CLIP;Fnan?| |yMax| $) (LETT |yMax| 0.0 . #3#)))
             (LETT |yDiff| (|sub_DF| |yMax| |yMin|) . #3#)
             (EXIT
              (COND
               ((|eql_DF| |yDiff| 0.0)
                (VECTOR |pointLists| (SPADCALL |plot| (QREFELT $ 60))
                        (SPADCALL (|sub_DF| |yMin| 1.0) (|add_DF| |yMax| 1.0)
                                  (QREFELT $ 18))))
               (#4#
                (SEQ (LETT |numm| (SPADCALL |scale| (QREFELT $ 30)) . #3#)
                     (LETT |denn| (SPADCALL |scale| (QREFELT $ 31)) . #3#)
                     (LETT |xMin| (SPADCALL |xVals| (QREFELT $ 64)) . #3#)
                     (LETT |xMax| (SPADCALL |xVals| (QREFELT $ 65)) . #3#)
                     (LETT |yMin|
                           (|sub_DF| |yMin|
                                     (|div_DF|
                                      (|mul_DF|
                                       (FLOAT |numm|
                                              MOST-POSITIVE-DOUBLE-FLOAT)
                                       |yDiff|)
                                      (FLOAT |denn|
                                             MOST-POSITIVE-DOUBLE-FLOAT)))
                           . #3#)
                     (LETT |yMax|
                           (|add_DF| |yMax|
                                     (|div_DF|
                                      (|mul_DF|
                                       (FLOAT |numm|
                                              MOST-POSITIVE-DOUBLE-FLOAT)
                                       |yDiff|)
                                      (FLOAT |denn|
                                             MOST-POSITIVE-DOUBLE-FLOAT)))
                           . #3#)
                     (LETT |lists|
                           (|CLIP;discardAndSplit| |pointList|
                            (CONS #'|CLIP;clip;P2FR;9!1|
                                  (VECTOR |yMin| |yMax| $))
                            |xMin| |xMax| |yMin| |yMax| $)
                           . #3#)
                     (LETT |yMin|
                           (SPADCALL
                            (SPADCALL |sortedList| |clipNum| (QREFELT $ 63))
                            (QREFELT $ 36))
                           . #3#)
                     (LETT |yMax|
                           (SPADCALL
                            (SPADCALL |sortedList| (- (- |n| 1) |clipNum|)
                                      (QREFELT $ 63))
                            (QREFELT $ 36))
                           . #3#)
                     (COND ((|CLIP;Fnan?| |yMin| $) (LETT |yMin| 0.0 . #3#)))
                     (COND ((|CLIP;Fnan?| |yMax| $) (LETT |yMax| 0.0 . #3#)))
                     (SEQ (LETT |list| NIL . #3#) (LETT #2# |lists| . #3#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |list| (CAR #2#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |pt| NIL . #3#) (LETT #1# |list| . #3#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |pt| (CAR #1#) . #3#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((NULL
                                      (|CLIP;Fnan?|
                                       (SPADCALL |pt| (QREFELT $ 36)) $))
                                     (SEQ
                                      (LETT |yMin|
                                            (|min_DF| |yMin|
                                                      (SPADCALL |pt|
                                                                (QREFELT $
                                                                         36)))
                                            . #3#)
                                      (EXIT
                                       (LETT |yMax|
                                             (|max_DF| |yMax|
                                                       (SPADCALL |pt|
                                                                 (QREFELT $
                                                                          36)))
                                             . #3#)))))))
                                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                     (EXIT
                      (VECTOR |lists| |xVals|
                              (SPADCALL |yMin| |yMax|
                                        (QREFELT $ 18))))))))))))))))))) 

(DEFUN |CLIP;clip;P2FR;9!1| (|x| $$)
  (PROG ($ |yMax| |yMin|)
    (LETT $ (QREFELT $$ 2) . #1=(|CLIP;clip;P2FR;9|))
    (LETT |yMax| (QREFELT $$ 1) . #1#)
    (LETT |yMin| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (COND
       ((SPADCALL (SPADCALL |x| (QREFELT $ 36)) |yMax| (QREFELT $ 19))
        (SPADCALL (SPADCALL |x| (QREFELT $ 36)) |yMin| (QREFELT $ 57)))
       ('T (|spadConstant| $ 20))))))) 

(DEFUN |CLIP;clip;P2FR;9!0| (|x| |y| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 36)) (SPADCALL |y| (QREFELT $ 36))
            (QREFELT $ 19))) 

(DEFUN |CLIP;clip;PR;10| (|plot| $)
  (SPADCALL |plot| (SPADCALL 1 4 (QREFELT $ 58)) (SPADCALL 5 1 (QREFELT $ 58))
            (QREFELT $ 66))) 

(DEFUN |CLIP;norm| (|pt| $)
  (PROG (|r| |y| |x|)
    (RETURN
     (SEQ (LETT |x| (SPADCALL |pt| (QREFELT $ 35)) . #1=(|CLIP;norm|))
          (LETT |y| (SPADCALL |pt| (QREFELT $ 36)) . #1#)
          (COND
           ((|CLIP;Fnan?| |x| $)
            (COND ((|CLIP;Fnan?| |y| $) (LETT |r| 0.0 . #1#))
                  (#2='T (LETT |r| (SPADCALL |y| 2 (QREFELT $ 68)) . #1#))))
           ((|CLIP;Fnan?| |y| $)
            (LETT |r| (SPADCALL |x| 2 (QREFELT $ 68)) . #1#))
           (#2#
            (LETT |r|
                  (|add_DF| (SPADCALL |x| 2 (QREFELT $ 68))
                            (SPADCALL |y| 2 (QREFELT $ 68)))
                  . #1#)))
          (EXIT |r|))))) 

(DEFUN |CLIP;findPt| (|lists| $)
  (PROG (#1=#:G248 #2=#:G246 #3=#:G250 #4=#:G252 |p| #5=#:G251 |list|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |list| NIL . #6=(|CLIP;findPt|)) (LETT #5# |lists| . #6#)
               G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |list| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL (NULL |list|))
                   (PROGN
                    (LETT #1#
                          (SEQ
                           (EXIT
                            (SEQ (LETT |p| NIL . #6#) (LETT #4# |list| . #6#)
                                 G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN (LETT |p| (CAR #4#) . #6#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((NULL (|CLIP;Pnan?| |p| $))
                                     (PROGN
                                      (LETT #2#
                                            (PROGN
                                             (LETT #3# (CONS 0 |p|) . #6#)
                                             (GO #3#))
                                            . #6#)
                                      (GO #2#))))))
                                 (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                                 (EXIT NIL)))
                           #2# (EXIT #2#))
                          . #6#)
                    (GO #1#))))))
               (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (CONS 1 "failed"))))
      #3# (EXIT #3#))))) 

(DEFUN |CLIP;clipWithRanges;L4DfR;13|
       (|pointLists| |xMin| |xMax| |yMin| |yMax| $)
  (PROG (#1=#:G287 |pt| #2=#:G286 |list| |firstPt| |lists| #3=#:G285
         |pointList|)
    (RETURN
     (SEQ (LETT |lists| NIL . #4=(|CLIP;clipWithRanges;L4DfR;13|))
          (SEQ (LETT |pointList| NIL . #4#) (LETT #3# |pointLists| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |pointList| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |lists|
                       (SPADCALL |lists|
                                 (|CLIP;discardAndSplit| |pointList|
                                  (CONS #'|CLIP;clipWithRanges;L4DfR;13!0|
                                        (VECTOR |yMin| |yMax| |xMin| |xMax| $))
                                  |xMin| |xMax| |yMin| |yMax| $)
                                 (QREFELT $ 71))
                       . #4#)))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |pt| (|CLIP;findPt| |lists| $) . #4#)
          (EXIT
           (COND
            ((QEQCAR |pt| 1)
             (VECTOR NIL (SPADCALL 0.0 0.0 (QREFELT $ 18))
                     (SPADCALL 0.0 0.0 (QREFELT $ 18))))
            ('T
             (SEQ (LETT |firstPt| (QCDR |pt|) . #4#)
                  (LETT |xMin| (SPADCALL |firstPt| (QREFELT $ 35)) . #4#)
                  (LETT |xMax| (SPADCALL |firstPt| (QREFELT $ 35)) . #4#)
                  (LETT |yMin| (SPADCALL |firstPt| (QREFELT $ 36)) . #4#)
                  (LETT |yMax| (SPADCALL |firstPt| (QREFELT $ 36)) . #4#)
                  (SEQ (LETT |list| NIL . #4#) (LETT #2# |lists| . #4#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |list| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |pt| NIL . #4#) (LETT #1# |list| . #4#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |pt| (CAR #1#) . #4#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((NULL (|CLIP;Pnan?| |pt| $))
                                  (SEQ
                                   (LETT |xMin|
                                         (|min_DF| |xMin|
                                                   (SPADCALL |pt|
                                                             (QREFELT $ 35)))
                                         . #4#)
                                   (LETT |xMax|
                                         (|max_DF| |xMax|
                                                   (SPADCALL |pt|
                                                             (QREFELT $ 35)))
                                         . #4#)
                                   (LETT |yMin|
                                         (|min_DF| |yMin|
                                                   (SPADCALL |pt|
                                                             (QREFELT $ 36)))
                                         . #4#)
                                   (EXIT
                                    (LETT |yMax|
                                          (|max_DF| |yMax|
                                                    (SPADCALL |pt|
                                                              (QREFELT $ 36)))
                                          . #4#)))))))
                              (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (VECTOR |lists| (SPADCALL |xMin| |xMax| (QREFELT $ 18))
                           (SPADCALL |yMin| |yMax| (QREFELT $ 18)))))))))))) 

(DEFUN |CLIP;clipWithRanges;L4DfR;13!0| (|x| $$)
  (PROG ($ |xMax| |xMin| |yMax| |yMin|)
    (LETT $ (QREFELT $$ 4) . #1=(|CLIP;clipWithRanges;L4DfR;13|))
    (LETT |xMax| (QREFELT $$ 3) . #1#)
    (LETT |xMin| (QREFELT $$ 2) . #1#)
    (LETT |yMax| (QREFELT $$ 1) . #1#)
    (LETT |yMin| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (COND
       ((SPADCALL (SPADCALL |x| (QREFELT $ 35)) |xMax| (QREFELT $ 69))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 35)) |xMin| (QREFELT $ 70))
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT $ 36)) |yMax| (QREFELT $ 69))
            (SPADCALL (SPADCALL |x| (QREFELT $ 36)) |yMin| (QREFELT $ 70)))
           ('T (|spadConstant| $ 20))))
         ('T (|spadConstant| $ 20))))
       ('T (|spadConstant| $ 20))))))) 

(DEFUN |CLIP;clipParametric;P2FR;14| (|plot| |fraction| |scale| $)
  (|CLIP;iClipParametric| (SPADCALL |plot| (QREFELT $ 61)) |fraction| |scale|
   $)) 

(DEFUN |CLIP;clipParametric;PR;15| (|plot| $)
  (SPADCALL |plot| (SPADCALL 1 2 (QREFELT $ 58)) (SPADCALL 5 1 (QREFELT $ 58))
            (QREFELT $ 72))) 

(DEFUN |CLIP;clip;LR;16| (|l| $)
  (|CLIP;iClipParametric| (SPADCALL |l| (QREFELT $ 74))
   (SPADCALL 1 2 (QREFELT $ 58)) (SPADCALL 5 1 (QREFELT $ 58)) $)) 

(DEFUN |CLIP;clip;LR;17| (|l| $)
  (|CLIP;iClipParametric| |l| (SPADCALL 1 2 (QREFELT $ 58))
   (SPADCALL 5 1 (QREFELT $ 58)) $)) 

(DEFUN |TwoDimensionalPlotClipping| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G297)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|TwoDimensionalPlotClipping|)
                . #2=(|TwoDimensionalPlotClipping|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|TwoDimensionalPlotClipping|
                         (LIST
                          (CONS NIL
                                (CONS 1 (|TwoDimensionalPlotClipping;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|TwoDimensionalPlotClipping|))))))))))) 

(DEFUN |TwoDimensionalPlotClipping;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|TwoDimensionalPlotClipping|)
            . #1=(|TwoDimensionalPlotClipping|))
      (LETT $ (GETREFV 77) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TwoDimensionalPlotClipping| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|TwoDimensionalPlotClipping| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Boolean|) (|DoubleFloat|) (0 . ~=)
              (|Mapping| 6 7) (|Point| 7) (6 . |any?|) (|Fraction| 29)
              (12 . |Zero|) (16 . <) (22 . |One|) (26 . >) (|Segment| 7)
              (32 . |segment|) (38 . <) (44 . |false|) (48 . |true|) (|List| $)
              (|List| 10) (52 . |concat|) (|Mapping| 6 10) (57 . |select|)
              (|Mapping| 6 10 10) (63 . |sort|) (|Integer|) (69 . |numer|)
              (74 . |denom|) (|NonNegativeInteger|) (79 . *) (|PointPackage| 7)
              (85 . |xCoord|) (90 . |yCoord|) (|PositiveInteger|) (|Float|)
              (95 . |float|) (102 . |coerce|)
              (|Record| (|:| |brans| 42) (|:| |xValues| 17) (|:| |yValues| 17))
              (|List| 23) |CLIP;clipWithRanges;L4DfR;13| (107 . >) (|List| 7)
              (|Mapping| 7 10) (|ListFunctions2| 10 7) (113 . |map|)
              (119 . |min|) (123 . |min|) (|Mapping| 7 7 7) (129 . |reduce|)
              (135 . |max|) (139 . |max|) (145 . SEGMENT) (151 . |point|)
              (156 . >) (162 . /) (|Plot|) (168 . |xRange|)
              (173 . |listBranches|) (178 . |more?|) (184 . |elt|) (190 . |lo|)
              (195 . |hi|) |CLIP;clip;P2FR;9| |CLIP;clip;PR;10| (200 . ^)
              (206 . <=) (212 . >=) (218 . |concat|)
              |CLIP;clipParametric;P2FR;14| |CLIP;clipParametric;PR;15|
              (224 . |list|) |CLIP;clip;LR;16| |CLIP;clip;LR;17|)
           '#(|clipWithRanges| 229 |clipParametric| 238 |clip| 250) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 76
                                                 '(2 7 6 0 0 8 2 10 6 9 0 11 0
                                                   12 0 13 2 12 6 0 0 14 0 12 0
                                                   15 2 12 6 0 0 16 2 17 0 7 7
                                                   18 2 7 6 0 0 19 0 6 0 20 0 6
                                                   0 21 1 23 0 22 24 2 23 0 25
                                                   0 26 2 23 0 27 0 28 1 12 29
                                                   0 30 1 12 29 0 31 2 29 0 32
                                                   0 33 1 34 7 10 35 1 34 7 10
                                                   36 3 38 0 29 29 37 39 1 38 7
                                                   0 40 2 32 6 0 0 44 2 47 45
                                                   46 23 48 0 38 0 49 2 7 0 0 0
                                                   50 2 45 7 51 0 52 0 38 0 53
                                                   2 7 0 0 0 54 2 17 0 7 7 55 1
                                                   10 0 45 56 2 7 6 0 0 57 2 12
                                                   0 29 29 58 1 59 17 0 60 1 59
                                                   42 0 61 2 42 6 0 32 62 2 23
                                                   10 0 29 63 1 17 7 0 64 1 17
                                                   7 0 65 2 7 0 0 37 68 2 7 6 0
                                                   0 69 2 7 6 0 0 70 2 42 0 0 0
                                                   71 1 42 0 23 74 5 0 41 42 7
                                                   7 7 7 43 1 0 41 59 73 3 0 41
                                                   59 12 12 72 1 0 41 59 67 3 0
                                                   41 59 12 12 66 1 0 41 42 76
                                                   1 0 41 23 75)))))
           '|lookupComplete|)) 

(MAKEPROP '|TwoDimensionalPlotClipping| 'NILADIC T) 
