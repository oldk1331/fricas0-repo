
(/VERSIONCHECK 2) 

(DEFUN |GBEUCLID;euclideanGroebner;2L;1| (|Pol| $)
  (|GBEUCLID;eminGbasis| (|GBEUCLID;strongGbasis| |Pol| 0 0 $) $)) 

(DEFUN |GBEUCLID;euclideanGroebner;LSL;2| (|Pol| |xx1| $)
  (SEQ
   (COND
    ((EQUAL |xx1| "redcrit")
     (|GBEUCLID;eminGbasis| (|GBEUCLID;strongGbasis| |Pol| 1 0 $) $))
    ((EQUAL |xx1| "info")
     (|GBEUCLID;eminGbasis| (|GBEUCLID;strongGbasis| |Pol| 2 1 $) $))
    ('T
     (SEQ (SPADCALL "   " (QREFELT $ 14))
          (SPADCALL "WARNING: options are - redcrit and/or info - "
                    (QREFELT $ 14))
          (SPADCALL "         you didn't type them correct" (QREFELT $ 14))
          (SPADCALL "         please try again" (QREFELT $ 14))
          (SPADCALL "   " (QREFELT $ 14)) (EXIT NIL)))))) 

(DEFUN |GBEUCLID;euclideanGroebner;L2SL;3| (|Pol| |xx1| |xx2| $)
  (SEQ
   (COND
    ((EQUAL |xx1| "redcrit")
     (COND
      ((EQUAL |xx2| "info")
       (EXIT (|GBEUCLID;eminGbasis| (|GBEUCLID;strongGbasis| |Pol| 1 1 $) $)))
      ((EQUAL |xx1| #1="info")
       (COND
        ((EQUAL |xx2| #2="redcrit")
         (EXIT
          (|GBEUCLID;eminGbasis| (|GBEUCLID;strongGbasis| |Pol| 1 1 $) $)))))))
    ((EQUAL |xx1| #1#)
     (COND
      ((EQUAL |xx2| #2#)
       (EXIT
        (|GBEUCLID;eminGbasis| (|GBEUCLID;strongGbasis| |Pol| 1 1 $) $))))))
   (COND
    ((EQUAL |xx1| "redcrit")
     (COND
      ((EQUAL |xx2| "redcrit")
       (EXIT
        (|GBEUCLID;eminGbasis| (|GBEUCLID;strongGbasis| |Pol| 1 0 $) $))))))
   (COND
    ((EQUAL |xx1| "info")
     (COND
      ((EQUAL |xx2| "info")
       (EXIT
        (|GBEUCLID;eminGbasis| (|GBEUCLID;strongGbasis| |Pol| 2 1 $) $))))))
   (SPADCALL "   " (QREFELT $ 14))
   (SPADCALL "WARNING:  options are - redcrit and/or info - " (QREFELT $ 14))
   (SPADCALL "          you didn't type them correct" (QREFELT $ 14))
   (SPADCALL "          please try again " (QREFELT $ 14))
   (SPADCALL "   " (QREFELT $ 14)) (EXIT NIL))) 

(DEFUN |GBEUCLID;strongGbasis| (|Pol| |xx1| |xx2| $)
  (PROG (|xx| |ala| H D |dd1| #1=#:G217 |x| #2=#:G216 |leh| |e| |eh| |ep| D0
         #3=#:G215 #4=#:G214 |lch| |en| |Pol1| |h|)
    (RETURN
     (SEQ
      (LETT |Pol1|
            (SPADCALL (CONS #'|GBEUCLID;strongGbasis!0| $) |Pol|
                      (QREFELT $ 27))
            . #5=(|GBEUCLID;strongGbasis|))
      (LETT |Pol| (LIST (|SPADfirst| |Pol1|)) . #5#) (LETT H |Pol| . #5#)
      (LETT |Pol1| (CDR |Pol1|) . #5#) (LETT D NIL . #5#)
      (SEQ G190 (COND ((NULL (COND ((NULL |Pol1|) 'NIL) ('T 'T))) (GO G191)))
           (SEQ (LETT |h| (|SPADfirst| |Pol1|) . #5#)
                (LETT |Pol1| (CDR |Pol1|) . #5#)
                (LETT |en| (SPADCALL |h| (QREFELT $ 18)) . #5#)
                (LETT |lch| (SPADCALL |h| (QREFELT $ 23)) . #5#)
                (LETT |dd1|
                      (PROGN
                       (LETT #4# NIL . #5#)
                       (SEQ (LETT |x| NIL . #5#) (LETT #3# |Pol| . #5#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |x| (CAR #3#) . #5#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #4#
                                    (CONS
                                     (VECTOR
                                      (SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                                |en| (QREFELT $ 28))
                                      (SPADCALL (SPADCALL |x| (QREFELT $ 23))
                                                |lch| (QREFELT $ 29))
                                      |x| |h|)
                                     #4#)
                                    . #5#)))
                            (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #4#))))
                      . #5#)
                (LETT D
                      (|GBEUCLID;updatD|
                       (|GBEUCLID;ecritMTondd1|
                        (SPADCALL (CONS #'|GBEUCLID;strongGbasis!1| $) |dd1|
                                  (QREFELT $ 34))
                        $)
                       (|GBEUCLID;ecritBonD| |h| D $) $)
                      . #5#)
                (LETT |Pol| (CONS |h| (|GBEUCLID;eupdatF| |h| |Pol| $)) . #5#)
                (COND
                 ((SPADCALL |en| (SPADCALL (|SPADfirst| H) (QREFELT $ 18))
                            (QREFELT $ 22))
                  (COND
                   ((SPADCALL (SPADCALL |h| (QREFELT $ 23))
                              (SPADCALL (|SPADfirst| H) (QREFELT $ 23))
                              (QREFELT $ 35))
                    (EXIT " go to top of while ")))))
                (LETT H
                      (|GBEUCLID;updatH| |h| H (|GBEUCLID;crithdelH| |h| H $)
                       (LIST |h|) $)
                      . #5#)
                (EXIT
                 (LETT H
                       (SPADCALL (CONS #'|GBEUCLID;strongGbasis!2| $) H
                                 (QREFELT $ 27))
                       . #5#)))
           NIL (GO G190) G191 (EXIT NIL))
      (LETT D (SPADCALL (CONS #'|GBEUCLID;strongGbasis!3| $) D (QREFELT $ 34))
            . #5#)
      (LETT |xx| |xx2| . #5#)
      (SEQ G190 (COND ((NULL (COND ((NULL D) 'NIL) ('T 'T))) (GO G191)))
           (SEQ (LETT D0 (|SPADfirst| D) . #5#)
                (LETT |ep| (|GBEUCLID;esPol| D0 $) . #5#)
                (LETT D (CDR D) . #5#)
                (LETT |eh|
                      (|GBEUCLID;ecredPol| (|GBEUCLID;eRed| |ep| H H $) H $)
                      . #5#)
                (COND ((EQL |xx1| 1) (|GBEUCLID;prinshINFO| |eh| $)))
                (EXIT
                 (COND
                  ((SPADCALL |eh| (|spadConstant| $ 40) (QREFELT $ 41))
                   (SEQ
                    (COND
                     ((EQL |xx2| 1)
                      (SEQ
                       (LETT |ala|
                             (|GBEUCLID;prindINFO| D0 |ep| |eh| (LENGTH H)
                              (LENGTH D) |xx| $)
                             . #5#)
                       (EXIT (LETT |xx| 2 . #5#)))))
                    (EXIT " go to top of while ")))
                  ('T
                   (SEQ (LETT |eh| (SPADCALL |eh| (QREFELT $ 42)) . #5#)
                        (LETT |e| (SPADCALL |eh| (QREFELT $ 18)) . #5#)
                        (LETT |leh| (SPADCALL |eh| (QREFELT $ 23)) . #5#)
                        (LETT |dd1|
                              (PROGN
                               (LETT #2# NIL . #5#)
                               (SEQ (LETT |x| NIL . #5#) (LETT #1# |Pol| . #5#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |x| (CAR #1#) . #5#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (VECTOR
                                              (SPADCALL
                                               (SPADCALL |x| (QREFELT $ 18))
                                               |e| (QREFELT $ 28))
                                              (SPADCALL
                                               (SPADCALL |x| (QREFELT $ 23))
                                               |leh| (QREFELT $ 29))
                                              |x| |eh|)
                                             #2#)
                                            . #5#)))
                                    (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              . #5#)
                        (LETT D
                              (|GBEUCLID;updatD|
                               (|GBEUCLID;ecritMTondd1|
                                (SPADCALL (CONS #'|GBEUCLID;strongGbasis!4| $)
                                          |dd1| (QREFELT $ 34))
                                $)
                               (|GBEUCLID;ecritBonD| |eh| D $) $)
                              . #5#)
                        (LETT |Pol|
                              (CONS |eh| (|GBEUCLID;eupdatF| |eh| |Pol| $))
                              . #5#)
                        (COND
                         ((|GBEUCLID;ecrithinH| |eh| H $)
                          (COND
                           ((SPADCALL |e|
                                      (SPADCALL (|SPADfirst| H) (QREFELT $ 18))
                                      (QREFELT $ 22))
                            (COND
                             ((SPADCALL (SPADCALL |eh| (QREFELT $ 23))
                                        (SPADCALL (|SPADfirst| H)
                                                  (QREFELT $ 23))
                                        (QREFELT $ 35))
                              (EXIT
                               (SEQ
                                (COND
                                 ((EQL |xx2| 1)
                                  (SEQ
                                   (LETT |ala|
                                         (|GBEUCLID;prindINFO| D0 |ep| |eh|
                                          (LENGTH H) (LENGTH D) |xx| $)
                                         . #5#)
                                   (EXIT (LETT |xx| 2 . #5#)))))
                                (EXIT #6=" go to top of while "))))))))
                         ('T
                          (EXIT
                           (SEQ
                            (COND
                             ((EQL |xx2| 1)
                              (SEQ
                               (LETT |ala|
                                     (|GBEUCLID;prindINFO| D0 |ep| |eh|
                                      (LENGTH H) (LENGTH D) |xx| $)
                                     . #5#)
                               (EXIT (LETT |xx| 2 . #5#)))))
                            (EXIT #6#)))))
                        (LETT H
                              (|GBEUCLID;updatH| |eh| H
                               (|GBEUCLID;crithdelH| |eh| H $) (LIST |eh|) $)
                              . #5#)
                        (LETT H
                              (SPADCALL (CONS #'|GBEUCLID;strongGbasis!5| $) H
                                        (QREFELT $ 27))
                              . #5#)
                        (EXIT
                         (COND
                          ((EQL |xx2| 1)
                           (SEQ
                            (LETT |ala|
                                  (|GBEUCLID;prindINFO| D0 |ep| |eh| (LENGTH H)
                                   (LENGTH D) |xx| $)
                                  . #5#)
                            (LETT |xx| 2 . #5#)
                            (EXIT " go to top of while "))))))))))
           NIL (GO G190) G191 (EXIT NIL))
      (COND
       ((EQL |xx2| 1)
        (SEQ (|GBEUCLID;prinpolINFO| |Pol| $)
             (EXIT
              (SPADCALL "    THE GROEBNER BASIS over EUCLIDEAN DOMAIN"
                        (QREFELT $ 14))))))
      (COND
       ((EQL |xx1| 1)
        (COND
         ((SPADCALL |xx2| 1 (QREFELT $ 44))
          (SPADCALL "    THE GROEBNER BASIS over EUCLIDEAN DOMAIN"
                    (QREFELT $ 14))))))
      (EXIT H))))) 

(DEFUN |GBEUCLID;strongGbasis!5| (|z1| |z2| $)
  (COND
   ((SPADCALL (SPADCALL |z1| (QREFELT $ 18)) (SPADCALL |z2| (QREFELT $ 18))
              (QREFELT $ 20))
    (|spadConstant| $ 21))
   ((SPADCALL (SPADCALL |z1| (QREFELT $ 18)) (SPADCALL |z2| (QREFELT $ 18))
              (QREFELT $ 22))
    (SPADCALL (SPADCALL |z2| (QREFELT $ 23)) (SPADCALL |z1| (QREFELT $ 23))
              (QREFELT $ 24)))
   ('T (|spadConstant| $ 25)))) 

(DEFUN |GBEUCLID;strongGbasis!4| (|z1| |z2| $)
  (COND
   ((SPADCALL (QVELT |z1| 0) (QVELT |z2| 0) (QREFELT $ 30))
    (|spadConstant| $ 21))
   ((SPADCALL (QVELT |z1| 0) (QVELT |z2| 0) (QREFELT $ 22))
    (SPADCALL (QVELT |z1| 1) (QVELT |z2| 1) (QREFELT $ 24)))
   ('T (|spadConstant| $ 25)))) 

(DEFUN |GBEUCLID;strongGbasis!3| (|z1| |z2| $)
  (COND
   ((SPADCALL (QVELT |z1| 0) (QVELT |z2| 0) (QREFELT $ 30))
    (|spadConstant| $ 21))
   ((SPADCALL (QVELT |z1| 0) (QVELT |z2| 0) (QREFELT $ 22))
    (SPADCALL (QVELT |z1| 1) (QVELT |z2| 1) (QREFELT $ 24)))
   ('T (|spadConstant| $ 25)))) 

(DEFUN |GBEUCLID;strongGbasis!2| (|z1| |z2| $)
  (COND
   ((SPADCALL (SPADCALL |z1| (QREFELT $ 18)) (SPADCALL |z2| (QREFELT $ 18))
              (QREFELT $ 20))
    (|spadConstant| $ 21))
   ((SPADCALL (SPADCALL |z1| (QREFELT $ 18)) (SPADCALL |z2| (QREFELT $ 18))
              (QREFELT $ 22))
    (SPADCALL (SPADCALL |z2| (QREFELT $ 23)) (SPADCALL |z1| (QREFELT $ 23))
              (QREFELT $ 24)))
   ('T (|spadConstant| $ 25)))) 

(DEFUN |GBEUCLID;strongGbasis!1| (|z1| |z2| $)
  (COND
   ((SPADCALL (QVELT |z1| 0) (QVELT |z2| 0) (QREFELT $ 30))
    (|spadConstant| $ 21))
   ((SPADCALL (QVELT |z1| 0) (QVELT |z2| 0) (QREFELT $ 22))
    (SPADCALL (QVELT |z1| 1) (QVELT |z2| 1) (QREFELT $ 24)))
   ('T (|spadConstant| $ 25)))) 

(DEFUN |GBEUCLID;strongGbasis!0| (|z1| |z2| $)
  (COND
   ((SPADCALL (SPADCALL |z1| (QREFELT $ 18)) (SPADCALL |z2| (QREFELT $ 18))
              (QREFELT $ 20))
    (|spadConstant| $ 21))
   ((SPADCALL (SPADCALL |z1| (QREFELT $ 18)) (SPADCALL |z2| (QREFELT $ 18))
              (QREFELT $ 22))
    (SPADCALL (SPADCALL |z2| (QREFELT $ 23)) (SPADCALL |z1| (QREFELT $ 23))
              (QREFELT $ 24)))
   ('T (|spadConstant| $ 25)))) 

(DEFUN |GBEUCLID;ecritMondd1| (|e| |c| D2 $)
  (PROG (|x|)
    (RETURN
     (SEQ
      (COND ((NULL D2) NIL)
            (#1='T
             (SEQ (LETT |x| (|SPADfirst| D2) |GBEUCLID;ecritMondd1|)
                  (EXIT
                   (COND
                    ((|GBEUCLID;ecritM| |e| |c| (QVELT |x| 0)
                      (SPADCALL (SPADCALL (QVELT |x| 2) (QREFELT $ 23))
                                (SPADCALL (QVELT |x| 3) (QREFELT $ 23))
                                (QREFELT $ 29))
                      $)
                     (|GBEUCLID;ecritMondd1| |e| |c| (CDR D2) $))
                    (#1#
                     (CONS |x|
                           (|GBEUCLID;ecritMondd1| |e| |c| (CDR D2)
                            $)))))))))))) 

(DEFUN |GBEUCLID;ecredPol| (|h| F $)
  (PROG (|h0|)
    (RETURN
     (SEQ (LETT |h0| (|spadConstant| $ 40) . #1=(|GBEUCLID;ecredPol|))
          (EXIT
           (COND ((NULL F) |h|)
                 ('T
                  (SEQ
                   (SEQ G190
                        (COND
                         ((NULL
                           (SPADCALL |h| (|spadConstant| $ 40) (QREFELT $ 45)))
                          (GO G191)))
                        (SEQ
                         (LETT |h0|
                               (SPADCALL |h0|
                                         (SPADCALL
                                          (SPADCALL |h| (QREFELT $ 23))
                                          (SPADCALL |h| (QREFELT $ 18))
                                          (QREFELT $ 46))
                                         (QREFELT $ 47))
                               . #1#)
                         (EXIT
                          (LETT |h|
                                (|GBEUCLID;eRed| (SPADCALL |h| (QREFELT $ 48))
                                 F F $)
                                . #1#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |h0|))))))))) 

(DEFUN |GBEUCLID;ecritMTondd1| (|dd1| $)
  (PROG (|f2| |r1| |e1| |cT1| |s1| |f1|)
    (RETURN
     (SEQ
      (COND ((NULL |dd1|) NIL)
            (#1='T
             (SEQ
              (LETT |f1| (|SPADfirst| |dd1|) . #2=(|GBEUCLID;ecritMTondd1|))
              (LETT |s1| (LENGTH |dd1|) . #2#)
              (LETT |cT1| (|GBEUCLID;ecritT| |f1| $) . #2#)
              (COND ((EQL |s1| 1) (COND (|cT1| (EXIT NIL)))))
              (EXIT
               (COND ((EQL |s1| 1) |dd1|)
                     (#1#
                      (SEQ (LETT |e1| (QVELT |f1| 0) . #2#)
                           (LETT |r1| (CDR |dd1|) . #2#)
                           (LETT |f2| (|SPADfirst| |r1|) . #2#)
                           (COND
                            ((SPADCALL |e1| (QVELT |f2| 0) (QREFELT $ 22))
                             (COND
                              ((SPADCALL (QVELT |f1| 1) (QVELT |f2| 1)
                                         (QREFELT $ 35))
                               (EXIT
                                (COND
                                 (|cT1|
                                  (|GBEUCLID;ecritMTondd1|
                                   (CONS |f1| (CDR |r1|)) $))
                                 (#1# (|GBEUCLID;ecritMTondd1| |r1| $))))))))
                           (LETT |dd1|
                                 (|GBEUCLID;ecritMondd1| |e1| (QVELT |f1| 1)
                                  |r1| $)
                                 . #2#)
                           (EXIT
                            (COND (|cT1| (|GBEUCLID;ecritMTondd1| |dd1| $))
                                  (#1#
                                   (CONS |f1|
                                         (|GBEUCLID;ecritMTondd1| |dd1|
                                          $)))))))))))))))) 

(DEFUN |GBEUCLID;ecritBonD| (|h| D $)
  (PROG (|x2| |x1| |x|)
    (RETURN
     (SEQ
      (COND ((NULL D) NIL)
            (#1='T
             (SEQ (LETT |x| (|SPADfirst| D) . #2=(|GBEUCLID;ecritBonD|))
                  (LETT |x1| (QVELT |x| 2) . #2#)
                  (LETT |x2| (QVELT |x| 3) . #2#)
                  (EXIT
                   (COND
                    ((|GBEUCLID;ecritB| (SPADCALL |h| (QREFELT $ 18))
                      (SPADCALL |h| (QREFELT $ 23))
                      (SPADCALL |x1| (QREFELT $ 18))
                      (SPADCALL |x1| (QREFELT $ 23))
                      (SPADCALL |x2| (QREFELT $ 18))
                      (SPADCALL |x2| (QREFELT $ 23)) $)
                     (|GBEUCLID;ecritBonD| |h| (CDR D) $))
                    (#1#
                     (CONS |x| (|GBEUCLID;ecritBonD| |h| (CDR D) $)))))))))))) 

(DEFUN |GBEUCLID;eupdatF| (|h| F $)
  (PROG (|f1|)
    (RETURN
     (SEQ
      (COND ((NULL F) NIL)
            (#1='T
             (SEQ (LETT |f1| (|SPADfirst| F) |GBEUCLID;eupdatF|)
                  (EXIT
                   (COND
                    ((|GBEUCLID;ecritM| (SPADCALL |h| (QREFELT $ 18))
                      (SPADCALL |h| (QREFELT $ 23))
                      (SPADCALL |f1| (QREFELT $ 18))
                      (SPADCALL |f1| (QREFELT $ 23)) $)
                     (|GBEUCLID;eupdatF| |h| (CDR F) $))
                    (#1#
                     (CONS |f1| (|GBEUCLID;eupdatF| |h| (CDR F) $)))))))))))) 

(DEFUN |GBEUCLID;updatH| (|h| H |Hh| |Hhh| $)
  (PROG (|hp| |hpp| #1=#:G238 |plc| |hlcm| |h1|)
    (RETURN
     (SEQ
      (COND ((NULL H) (APPEND |Hh| |Hhh|))
            ('T
             (SEQ (LETT |h1| (|SPADfirst| H) . #2=(|GBEUCLID;updatH|))
                  (LETT |hlcm|
                        (SPADCALL (SPADCALL |h1| (QREFELT $ 18))
                                  (SPADCALL |h| (QREFELT $ 18)) (QREFELT $ 28))
                        . #2#)
                  (LETT |plc|
                        (SPADCALL (SPADCALL |h| (QREFELT $ 23))
                                  (SPADCALL |h1| (QREFELT $ 23))
                                  (QREFELT $ 50))
                        . #2#)
                  (LETT |hp|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (QVELT |plc| 0)
                                    (PROG2
                                        (LETT #1#
                                              (SPADCALL |hlcm|
                                                        (SPADCALL |h|
                                                                  (QREFELT $
                                                                           18))
                                                        (QREFELT $ 52))
                                              . #2#)
                                        (QCDR #1#)
                                      (|check_union| (QEQCAR #1# 0)
                                                     (QREFELT $ 7) #1#))
                                    (QREFELT $ 46))
                          |h| (QREFELT $ 53))
                         (SPADCALL
                          (SPADCALL (QVELT |plc| 1)
                                    (PROG2
                                        (LETT #1#
                                              (SPADCALL |hlcm|
                                                        (SPADCALL |h1|
                                                                  (QREFELT $
                                                                           18))
                                                        (QREFELT $ 52))
                                              . #2#)
                                        (QCDR #1#)
                                      (|check_union| (QEQCAR #1# 0)
                                                     (QREFELT $ 7) #1#))
                                    (QREFELT $ 46))
                          |h1| (QREFELT $ 53))
                         (QREFELT $ 47))
                        . #2#)
                  (COND
                   ((|GBEUCLID;ecrithinH| |hp| |Hh| $)
                    (COND
                     ((|GBEUCLID;ecrithinH| |hp| |Hhh| $)
                      (EXIT
                       (SEQ (LETT |hpp| (APPEND (CDR H) |Hh|) . #2#)
                            (LETT |hp|
                                  (|GBEUCLID;ecredPol|
                                   (|GBEUCLID;eRed| |hp| |hpp| |hpp| $) |hpp|
                                   $)
                                  . #2#)
                            (EXIT
                             (|GBEUCLID;updatH| |h| (CDR H)
                              (|GBEUCLID;crithdelH| |hp| |Hh| $)
                              (CONS |hp| (|GBEUCLID;crithdelH| |hp| |Hhh| $))
                              $))))))))
                  (EXIT (|GBEUCLID;updatH| |h| (CDR H) |Hh| |Hhh| $))))))))) 

(DEFUN |GBEUCLID;crithdelH| (|h| H $)
  (PROG (#1=#:G247 |plc| |dh| |dh1| |h1|)
    (RETURN
     (SEQ
      (COND ((NULL H) NIL)
            (#2='T
             (SEQ (LETT |h1| (|SPADfirst| H) . #3=(|GBEUCLID;crithdelH|))
                  (LETT |dh1| (SPADCALL |h1| (QREFELT $ 18)) . #3#)
                  (LETT |dh| (SPADCALL |h| (QREFELT $ 18)) . #3#)
                  (EXIT
                   (COND
                    ((|GBEUCLID;ecritM| |dh| (SPADCALL |h| (QREFELT $ 23))
                      |dh1| (SPADCALL |h1| (QREFELT $ 23)) $)
                     (|GBEUCLID;crithdelH| |h| (CDR H) $))
                    ((SPADCALL |dh1| (SPADCALL |dh| |dh1| (QREFELT $ 28))
                               (QREFELT $ 22))
                     (SEQ
                      (LETT |plc|
                            (SPADCALL (SPADCALL |h1| (QREFELT $ 23))
                                      (SPADCALL |h| (QREFELT $ 23))
                                      (QREFELT $ 50))
                            . #3#)
                      (EXIT
                       (CONS
                        (SPADCALL
                         (SPADCALL (QVELT |plc| 0) |h1| (QREFELT $ 54))
                         (SPADCALL
                          (SPADCALL (QVELT |plc| 1)
                                    (PROG2
                                        (LETT #1#
                                              (SPADCALL |dh1| |dh|
                                                        (QREFELT $ 52))
                                              . #3#)
                                        (QCDR #1#)
                                      (|check_union| (QEQCAR #1# 0)
                                                     (QREFELT $ 7) #1#))
                                    (QREFELT $ 46))
                          |h| (QREFELT $ 53))
                         (QREFELT $ 47))
                        (|GBEUCLID;crithdelH| |h| (CDR H) $)))))
                    (#2#
                     (CONS |h1| (|GBEUCLID;crithdelH| |h| (CDR H) $)))))))))))) 

(DEFUN |GBEUCLID;eminGbasis| (F $)
  (PROG (|newbas|)
    (RETURN
     (SEQ
      (COND ((NULL F) NIL)
            ('T
             (SEQ
              (LETT |newbas| (|GBEUCLID;eminGbasis| (CDR F) $)
                    |GBEUCLID;eminGbasis|)
              (EXIT
               (CONS (|GBEUCLID;ecredPol| (|SPADfirst| F) |newbas| $)
                     |newbas|))))))))) 

(DEFUN |GBEUCLID;ecrithinH| (|h| H $)
  (PROG (|h1|)
    (RETURN
     (SEQ
      (COND ((NULL H) 'T)
            (#1='T
             (SEQ (LETT |h1| (|SPADfirst| H) |GBEUCLID;ecrithinH|)
                  (EXIT
                   (COND
                    ((|GBEUCLID;ecritM| (SPADCALL |h1| (QREFELT $ 18))
                      (SPADCALL |h1| (QREFELT $ 23))
                      (SPADCALL |h| (QREFELT $ 18))
                      (SPADCALL |h| (QREFELT $ 23)) $)
                     'NIL)
                    (#1# (|GBEUCLID;ecrithinH| |h| (CDR H) $))))))))))) 

(DEFUN |GBEUCLID;esPol| (|p| $)
  (PROG (#1=#:G261 #2=#:G258 |lij| |fj| |fi| |Tij|)
    (RETURN
     (SEQ (LETT |Tij| (QVELT |p| 0) . #3=(|GBEUCLID;esPol|))
          (LETT |fi| (QVELT |p| 2) . #3#) (LETT |fj| (QVELT |p| 3) . #3#)
          (LETT |lij|
                (SPADCALL (SPADCALL |fi| (QREFELT $ 23))
                          (SPADCALL |fj| (QREFELT $ 23)) (QREFELT $ 29))
                . #3#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |fi| (QREFELT $ 48))
                      (SPADCALL
                       (PROG2
                           (LETT #2#
                                 (SPADCALL |lij| (SPADCALL |fi| (QREFELT $ 23))
                                           (QREFELT $ 55))
                                 . #3#)
                           (QCDR #2#)
                         (|check_union| (QEQCAR #2# 0) (QREFELT $ 6) #2#))
                       (PROG2
                           (LETT #1#
                                 (SPADCALL |Tij| (SPADCALL |fi| (QREFELT $ 18))
                                           (QREFELT $ 52))
                                 . #3#)
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                       (QREFELT $ 46))
                      (QREFELT $ 53))
            (SPADCALL (SPADCALL |fj| (QREFELT $ 48))
                      (SPADCALL
                       (PROG2
                           (LETT #2#
                                 (SPADCALL |lij| (SPADCALL |fj| (QREFELT $ 23))
                                           (QREFELT $ 55))
                                 . #3#)
                           (QCDR #2#)
                         (|check_union| (QEQCAR #2# 0) (QREFELT $ 6) #2#))
                       (PROG2
                           (LETT #1#
                                 (SPADCALL |Tij| (SPADCALL |fj| (QREFELT $ 18))
                                           (QREFELT $ 52))
                                 . #3#)
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                       (QREFELT $ 46))
                      (QREFELT $ 53))
            (QREFELT $ 56))))))) 

(DEFUN |GBEUCLID;eRed| (|s| H |Hh| $)
  (PROG (|q1| |sdf1| #1=#:G271 |e| |ls| |lf1| |ds| |f1|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL |s| (|spadConstant| $ 40) (QREFELT $ 41)) (NULL H)) |s|)
        ('T
         (SEQ (LETT |f1| (|SPADfirst| H) . #2=(|GBEUCLID;eRed|))
              (LETT |ds| (SPADCALL |s| (QREFELT $ 18)) . #2#)
              (LETT |lf1| (SPADCALL |f1| (QREFELT $ 23)) . #2#)
              (LETT |ls| (SPADCALL |s| (QREFELT $ 23)) . #2#)
              (SEQ
               (LETT |e|
                     (SPADCALL |ds| (SPADCALL |f1| (QREFELT $ 18))
                               (QREFELT $ 52))
                     . #2#)
               (EXIT
                (COND
                 ((OR (QEQCAR |e| 1) (SPADCALL |ls| |lf1| (QREFELT $ 24)))
                  (PROGN
                   (LETT #1# (|GBEUCLID;eRed| |s| (CDR H) |Hh| $) . #2#)
                   (GO #1#))))))
              (LETT |sdf1| (SPADCALL |ls| |lf1| (QREFELT $ 58)) . #2#)
              (LETT |q1| (QCAR |sdf1|) . #2#)
              (EXIT
               (COND
                ((SPADCALL (QCDR |sdf1|) (|spadConstant| $ 38) (QREFELT $ 35))
                 (|GBEUCLID;eRed|
                  (SPADCALL (SPADCALL |s| (QREFELT $ 48))
                            (SPADCALL (SPADCALL |q1| (QCDR |e|) (QREFELT $ 46))
                                      (SPADCALL |f1| (QREFELT $ 48))
                                      (QREFELT $ 53))
                            (QREFELT $ 56))
                  |Hh| |Hh| $))
                ('T
                 (|GBEUCLID;eRed|
                  (SPADCALL |s|
                            (SPADCALL (SPADCALL |q1| (QCDR |e|) (QREFELT $ 46))
                                      |f1| (QREFELT $ 53))
                            (QREFELT $ 56))
                  (CDR H) |Hh| $))))))))
      #1# (EXIT #1#))))) 

(DEFUN |GBEUCLID;ecritT| (|p| $)
  (PROG (|cj| |ci| |pj| |pi|)
    (RETURN
     (SEQ (LETT |pi| (QVELT |p| 2) . #1=(|GBEUCLID;ecritT|))
          (LETT |pj| (QVELT |p| 3) . #1#)
          (LETT |ci| (SPADCALL |pi| (QREFELT $ 23)) . #1#)
          (LETT |cj| (SPADCALL |pj| (QREFELT $ 23)) . #1#)
          (EXIT
           (COND
            ((SPADCALL (QVELT |p| 0)
                       (SPADCALL (SPADCALL |pi| (QREFELT $ 18))
                                 (SPADCALL |pj| (QREFELT $ 18)) (QREFELT $ 59))
                       (QREFELT $ 22))
             (SPADCALL (QVELT |p| 1) (SPADCALL |ci| |cj| (QREFELT $ 60))
                       (QREFELT $ 35)))
            ('T 'NIL))))))) 

(DEFUN |GBEUCLID;ecritM| (|e1| |c1| |e2| |c2| $)
  (PROG (#1=#:G283 |en|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |en| (SPADCALL |e2| |e1| (QREFELT $ 52))
               . #2=(|GBEUCLID;ecritM|))
         (EXIT
          (COND
           ((OR (QEQCAR |en| 1) (QEQCAR (SPADCALL |c2| |c1| (QREFELT $ 55)) 1))
            (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |GBEUCLID;ecritB| (|eh| |ch| |ei| |ci| |ek| |ck| $)
  (PROG (|cik| |eik|)
    (RETURN
     (SEQ
      (LETT |eik| (SPADCALL |ei| |ek| (QREFELT $ 28)) . #1=(|GBEUCLID;ecritB|))
      (LETT |cik| (SPADCALL |ci| |ck| (QREFELT $ 29)) . #1#)
      (EXIT
       (COND
        ((|GBEUCLID;ecritM| |eh| |ch| |eik| |cik| $)
         (COND
          ((OR
            (|GBEUCLID;ecritM| |eik| |cik| (SPADCALL |ei| |eh| (QREFELT $ 28))
             (SPADCALL |ci| |ch| (QREFELT $ 29)) $)
            (|GBEUCLID;ecritM| |eik| |cik| (SPADCALL |ek| |eh| (QREFELT $ 28))
             (SPADCALL |ck| |ch| (QREFELT $ 29)) $))
           'NIL)
          ('T 'T)))
        ('T 'NIL))))))) 

(DEFUN |GBEUCLID;euclideanNormalForm;DpolLDpol;19| (|p1| |lp| $)
  (|GBEUCLID;eRed| |p1| |lp| |lp| $)) 

(DEFUN |GBEUCLID;sortin| (|p1| |lp| $)
  (PROG (|ep1| |elf1| |f1|)
    (RETURN
     (SEQ
      (COND ((NULL |lp|) (LIST |p1|))
            ('T
             (SEQ (LETT |f1| (|SPADfirst| |lp|) . #1=(|GBEUCLID;sortin|))
                  (LETT |elf1| (SPADCALL |f1| (QREFELT $ 18)) . #1#)
                  (LETT |ep1| (SPADCALL |p1| (QREFELT $ 18)) . #1#)
                  (COND
                   ((SPADCALL |elf1| |ep1| (QREFELT $ 30))
                    (EXIT (CONS |f1| (|GBEUCLID;sortin| |p1| (CDR |lp|) $))))
                   ((SPADCALL |elf1| |ep1| (QREFELT $ 22))
                    (COND
                     ((SPADCALL (SPADCALL |f1| (QREFELT $ 23))
                                (SPADCALL |p1| (QREFELT $ 23)) (QREFELT $ 24))
                      (EXIT
                       (CONS |f1| (|GBEUCLID;sortin| |p1| (CDR |lp|) $)))))))
                  (EXIT (CONS |p1| |lp|))))))))) 

(DEFUN |GBEUCLID;updatD| (D1 D2 $)
  (PROG (|dl2| |dl1|)
    (RETURN
     (SEQ
      (COND ((NULL D1) D2) ((NULL D2) D1)
            (#1='T
             (SEQ (LETT |dl1| (|SPADfirst| D1) . #2=(|GBEUCLID;updatD|))
                  (LETT |dl2| (|SPADfirst| D2) . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL (QVELT |dl1| 0) (QVELT |dl2| 0) (QREFELT $ 30))
                     (CONS |dl1| (|GBEUCLID;updatD| (CDR D1) D2 $)))
                    (#1#
                     (CONS |dl2| (|GBEUCLID;updatD| D1 (CDR D2) $)))))))))))) 

(DEFUN |GBEUCLID;lepol| (|p1| $)
  (PROG (|n|)
    (RETURN
     (SEQ (LETT |n| 0 . #1=(|GBEUCLID;lepol|))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p1| (|spadConstant| $ 40) (QREFELT $ 45)))
                 (GO G191)))
               (SEQ (LETT |n| (+ |n| 1) . #1#)
                    (EXIT (LETT |p1| (SPADCALL |p1| (QREFELT $ 48)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |n|))))) 

(DEFUN |GBEUCLID;prinb| (|n| $)
  (PROG (|i|)
    (RETURN
     (SEQ (LETT |i| 1 . #1=(|GBEUCLID;prinb|)) G190
          (COND ((|greater_SI| |i| |n|) (GO G191)))
          (SEQ (EXIT (SPADCALL "    " (QREFELT $ 62))))
          (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))))) 

(DEFUN |GBEUCLID;prinshINFO| (|h| $)
  (SEQ (|GBEUCLID;prinb| 2 $)
       (SPADCALL " reduced Critpair - Polynom :" (QREFELT $ 62))
       (|GBEUCLID;prinb| 2 $)
       (SPADCALL (SPADCALL |h| (QREFELT $ 63)) (QREFELT $ 14))
       (EXIT (|GBEUCLID;prinb| 2 $)))) 

(DEFUN |GBEUCLID;prindINFO| (|cp| |ps| |ph| |i1| |i2| |n| $)
  (PROG (|ll| |a| |cpj| |cpi|)
    (RETURN
     (SEQ (LETT |cpi| (QVELT |cp| 2) . #1=(|GBEUCLID;prindINFO|))
          (LETT |cpj| (QVELT |cp| 3) . #1#)
          (COND
           ((EQL |n| 1)
            (SEQ (|GBEUCLID;prinb| 1 $)
                 (SPADCALL "you choose option  -info-  " (QREFELT $ 62))
                 (SPADCALL "abbrev. for the following information strings are"
                           (QREFELT $ 62))
                 (SPADCALL
                  "  ci  =>  Leading monomial  for critpair calculation"
                  (QREFELT $ 62))
                 (SPADCALL "  tci =>  Number of terms of polynomial i"
                           (QREFELT $ 62))
                 (SPADCALL
                  "  cj  =>  Leading monomial  for critpair calculation"
                  (QREFELT $ 62))
                 (SPADCALL "  tcj =>  Number of terms of polynomial j"
                           (QREFELT $ 62))
                 (SPADCALL "  c   =>  Leading monomial of critpair polynomial"
                           (QREFELT $ 62))
                 (SPADCALL "  tc  =>  Number of terms of critpair polynomial"
                           (QREFELT $ 62))
                 (SPADCALL
                  "  rc  =>  Leading monomial of redcritpair polynomial"
                  (QREFELT $ 62))
                 (SPADCALL
                  "  trc =>  Number of terms of redcritpair polynomial"
                  (QREFELT $ 62))
                 (SPADCALL
                  "  tF  =>  Number of polynomials in reduction list F"
                  (QREFELT $ 62))
                 (SPADCALL "  tD  =>  Number of critpairs still to do"
                           (QREFELT $ 62))
                 (|GBEUCLID;prinb| 4 $) (EXIT (LETT |n| 2 . #1#)))))
          (|GBEUCLID;prinb| 1 $) (LETT |a| (|spadConstant| $ 36) . #1#)
          (EXIT
           (COND
            ((SPADCALL |ph| (|spadConstant| $ 40) (QREFELT $ 41))
             (COND
              ((SPADCALL |ps| (|spadConstant| $ 40) (QREFELT $ 41))
               (SEQ
                (LETT |ll|
                      (LIST
                       (VECTOR
                        (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 18))
                                  (QREFELT $ 46))
                        (|GBEUCLID;lepol| |cpi| $)
                        (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 18))
                                  (QREFELT $ 46))
                        (|GBEUCLID;lepol| |cpj| $) |ps| 0 |ph| 0 |i1| |i2|))
                      . #1#)
                (SPADCALL (SPADCALL |ll| (QREFELT $ 66)) (QREFELT $ 14))
                (|GBEUCLID;prinb| 1 $) (EXIT |n|)))
              (#2='T
               (SEQ
                (LETT |ll|
                      (LIST
                       (VECTOR
                        (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 18))
                                  (QREFELT $ 46))
                        (|GBEUCLID;lepol| |cpi| $)
                        (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 18))
                                  (QREFELT $ 46))
                        (|GBEUCLID;lepol| |cpj| $)
                        (SPADCALL |a| (SPADCALL |ps| (QREFELT $ 18))
                                  (QREFELT $ 46))
                        (|GBEUCLID;lepol| |ps| $) |ph| 0 |i1| |i2|))
                      . #1#)
                (SPADCALL (SPADCALL |ll| (QREFELT $ 66)) (QREFELT $ 14))
                (|GBEUCLID;prinb| 1 $) (EXIT |n|)))))
            (#2#
             (SEQ
              (LETT |ll|
                    (LIST
                     (VECTOR
                      (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 18))
                                (QREFELT $ 46))
                      (|GBEUCLID;lepol| |cpi| $)
                      (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 18))
                                (QREFELT $ 46))
                      (|GBEUCLID;lepol| |cpj| $)
                      (SPADCALL |a| (SPADCALL |ps| (QREFELT $ 18))
                                (QREFELT $ 46))
                      (|GBEUCLID;lepol| |ps| $)
                      (SPADCALL |a| (SPADCALL |ph| (QREFELT $ 18))
                                (QREFELT $ 46))
                      (|GBEUCLID;lepol| |ph| $) |i1| |i2|))
                    . #1#)
              (SPADCALL (SPADCALL |ll| (QREFELT $ 66)) (QREFELT $ 14))
              (|GBEUCLID;prinb| 1 $) (EXIT |n|))))))))) 

(DEFUN |GBEUCLID;prinpolINFO| (|pl| $)
  (PROG (|n|)
    (RETURN
     (SEQ (LETT |n| (LENGTH |pl|) |GBEUCLID;prinpolINFO|)
          (|GBEUCLID;prinb| 1 $)
          (EXIT
           (COND
            ((EQL |n| 1)
             (SEQ
              (SPADCALL "  There is 1  Groebner Basis Polynomial "
                        (QREFELT $ 14))
              (EXIT (|GBEUCLID;prinb| 2 $))))
            ('T
             (SEQ (SPADCALL "  There are " (QREFELT $ 14))
                  (|GBEUCLID;prinb| 1 $)
                  (SPADCALL (SPADCALL |n| (QREFELT $ 67)) (QREFELT $ 14))
                  (|GBEUCLID;prinb| 1 $)
                  (SPADCALL "  Groebner Basis Polynomials. " (QREFELT $ 14))
                  (EXIT (|GBEUCLID;prinb| 2 $)))))))))) 

(DEFUN |EuclideanGroebnerBasisPackage| (&REST #1=#:G316)
  (PROG ()
    (RETURN
     (PROG (#2=#:G317)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|EuclideanGroebnerBasisPackage|)
                                           '|domainEqualList|)
                . #3=(|EuclideanGroebnerBasisPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |EuclideanGroebnerBasisPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|EuclideanGroebnerBasisPackage|))))))))))) 

(DEFUN |EuclideanGroebnerBasisPackage;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|EuclideanGroebnerBasisPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|EuclideanGroebnerBasisPackage| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 68) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|EuclideanGroebnerBasisPackage|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|EuclideanGroebnerBasisPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|List| 9)
              |GBEUCLID;euclideanGroebner;2L;1| (|Void|) (|OutputForm|)
              (0 . |print|) (|String|) |GBEUCLID;euclideanGroebner;LSL;2|
              |GBEUCLID;euclideanGroebner;L2SL;3| (5 . |degree|) (|Boolean|)
              (10 . >) (16 . |true|) (20 . =) (26 . |leadingCoefficient|)
              (31 . |sizeLess?|) (37 . |false|) (|Mapping| 19 9 9)
              (41 . |sort|) (47 . |sup|) (53 . |lcm|) (59 . <)
              (|Record| (|:| |lcmfij| 7) (|:| |lcmcij| 6) (|:| |poli| 9)
                        (|:| |polj| 9))
              (|Mapping| 19 31 31) (|List| 31) (65 . |sort|) (71 . =)
              (77 . |One|) (81 . |One|) (85 . |Zero|) (89 . |Zero|)
              (93 . |Zero|) (97 . =) (103 . |unitCanonical|) (|Integer|)
              (108 . ~=) (114 . ~=) (120 . |monomial|) (126 . +)
              (132 . |reductum|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (137 . |extendedEuclidean|) (|Union| $ '"failed")
              (143 . |subtractIfCan|) (149 . *) (155 . *) (161 . |exquo|)
              (167 . -) (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (173 . |divide|) (179 . +) (185 . *)
              |GBEUCLID;euclideanNormalForm;DpolLDpol;19|
              (191 . |messagePrint|) (196 . |coerce|)
              (|Record| (|:| |ci| 9) (|:| |tci| 43) (|:| |cj| 9) (|:| |tcj| 43)
                        (|:| |c| 9) (|:| |tc| 43) (|:| |rc| 9) (|:| |trc| 43)
                        (|:| |tH| 43) (|:| |tD| 43))
              (|List| 64) (201 . |coerce|) (206 . |coerce|))
           '#(|euclideanNormalForm| 211 |euclideanGroebner| 217) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 67
                                                 '(1 13 12 0 14 1 9 7 0 18 2 7
                                                   19 0 0 20 0 19 0 21 2 7 19 0
                                                   0 22 1 9 6 0 23 2 6 19 0 0
                                                   24 0 19 0 25 2 10 0 26 0 27
                                                   2 7 0 0 0 28 2 6 0 0 0 29 2
                                                   7 19 0 0 30 2 33 0 32 0 34 2
                                                   6 19 0 0 35 0 6 0 36 0 9 0
                                                   37 0 6 0 38 0 7 0 39 0 9 0
                                                   40 2 9 19 0 0 41 1 9 0 0 42
                                                   2 43 19 0 0 44 2 9 19 0 0 45
                                                   2 9 0 6 7 46 2 9 0 0 0 47 1
                                                   9 0 0 48 2 6 49 0 0 50 2 7
                                                   51 0 0 52 2 9 0 0 0 53 2 9 0
                                                   6 0 54 2 6 51 0 0 55 2 9 0 0
                                                   0 56 2 6 57 0 0 58 2 7 0 0 0
                                                   59 2 6 0 0 0 60 1 13 12 15
                                                   62 1 9 13 0 63 1 65 13 0 66
                                                   1 43 13 0 67 2 0 9 9 10 61 1
                                                   0 10 10 11 3 0 10 10 15 15
                                                   17 2 0 10 10 15 16)))))
           '|lookupComplete|)) 
