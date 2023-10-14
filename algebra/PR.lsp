
(/VERSIONCHECK 2) 

(DEFUN |PR;One;$;1| ($)
  (LIST (CONS (|spadConstant| $ 10) (|spadConstant| $ 11)))) 

(DEFUN |PR;characteristic;Nni;2| ($) (SPADCALL (QREFELT $ 14))) 

(PUT '|PR;numberOfMonomials;$Nni;3| '|SPADreplace| 'LENGTH) 

(DEFUN |PR;numberOfMonomials;$Nni;3| (|x| $) (LENGTH |x|)) 

(DEFUN |PR;degree;$E;4| (|p| $)
  (COND ((NULL |p|) (|spadConstant| $ 10)) ('T (QCAR (|SPADfirst| |p|))))) 

(DEFUN |PR;minimumDegree;$E;5| (|p| $)
  (COND ((NULL |p|) (|spadConstant| $ 10))
        ('T (QCAR (SPADCALL |p| (QREFELT $ 19)))))) 

(DEFUN |PR;leadingCoefficient;$R;6| (|p| $)
  (COND ((NULL |p|) (|spadConstant| $ 21)) ('T (QCDR (|SPADfirst| |p|))))) 

(DEFUN |PR;leadingMonomial;2$;7| (|p| $)
  (COND ((NULL |p|) (|spadConstant| $ 23)) ('T (LIST (|SPADfirst| |p|))))) 

(DEFUN |PR;reductum;2$;8| (|p| $) (COND ((NULL |p|) |p|) ('T (CDR |p|)))) 

(DEFUN |PR;retractIfCan;$U;9| (|p| $)
  (COND ((NULL |p|) (CONS 0 (|spadConstant| $ 21)))
        ((NULL (NULL (CDR |p|))) (CONS 1 "failed"))
        ('T
         (COND
          ((SPADCALL (QCAR (|SPADfirst| |p|)) (QREFELT $ 27))
           (CONS 0 (QCDR (|SPADfirst| |p|))))
          ('T (CONS 1 "failed")))))) 

(DEFUN |PR;coefficient;$ER;10| (|p| |e| $)
  (PROG (#1=#:G180 #2=#:G185 #3=#:G187 |tm| |ks| #4=#:G186 |tms| |es| |ps|
         |degp|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL |p|) (|spadConstant| $ 21))
             (#5='T
              (SEQ
               (LETT |degp| (QCAR (|SPADfirst| |p|))
                     . #6=(|PR;coefficient;$ER;10|))
               (EXIT
                (COND
                 ((< |degp| MOST-POSITIVE-FIXNUM)
                  (COND
                   ((NULL (< |e| MOST-POSITIVE-FIXNUM)) (|spadConstant| $ 21))
                   ('T
                    (SEQ (LETT |ps| |p| . #6#) (LETT |es| |e| . #6#)
                         (SEQ (LETT |tms| NIL . #6#) (LETT #4# |ps| . #6#) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |tms| (CAR #4#) . #6#) NIL))
                                (GO G191)))
                              (SEQ (LETT |ks| (QCAR |tms|) . #6#)
                                   (EXIT
                                    (COND
                                     ((|eql_SI| |ks| |es|)
                                      (PROGN
                                       (LETT #2# (QCDR |tms|) . #6#)
                                       (GO #2#)))
                                     ((|less_SI| |ks| |es|)
                                      (PROGN
                                       (LETT #2# (|spadConstant| $ 21) . #6#)
                                       (GO #2#))))))
                              (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (PROGN
                           (LETT #2# (|spadConstant| $ 21) . #6#)
                           (GO #2#)))))))
                 (#5#
                  (SEQ
                   (SEQ (LETT |tm| NIL . #6#) (LETT #3# |p| . #6#) G190
                        (COND
                         ((OR (ATOM #3#)
                              (PROGN (LETT |tm| (CAR #3#) . #6#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((EQL (QCAR |tm|) |e|)
                            (PROGN (LETT #2# (QCDR |tm|) . #6#) (GO #2#)))
                           ('T
                            (SEQ
                             (EXIT
                              (COND
                               ((< (QCAR |tm|) |e|)
                                (PROGN
                                 (LETT #1#
                                       (PROGN
                                        (LETT #2# (|spadConstant| $ 21) . #6#)
                                        (GO #2#))
                                       . #6#)
                                 (GO #1#)))))
                             #1# (EXIT #1#))))))
                        (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
                   (EXIT (|spadConstant| $ 21))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |PR;coefficient;$ER;11| (|p| |e| $)
  (PROG (#1=#:G189 #2=#:G193 #3=#:G194 |tm|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |tm| NIL . #4=(|PR;coefficient;$ER;11|))
             (LETT #3# |p| . #4#) G190
             (COND
              ((OR (ATOM #3#) (PROGN (LETT |tm| (CAR #3#) . #4#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL (QCAR |tm|) |e| (QREFELT $ 31))
                 (PROGN (LETT #2# (QCDR |tm|) . #4#) (GO #2#)))
                ('T
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (QCAR |tm|) |e| (QREFELT $ 32))
                     (PROGN
                      (LETT #1#
                            (PROGN
                             (LETT #2# (|spadConstant| $ 21) . #4#)
                             (GO #2#))
                            . #4#)
                      (GO #1#)))))
                  #1# (EXIT #1#))))))
             (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT (|spadConstant| $ 21))))
      #2# (EXIT #2#))))) 

(DEFUN |PR;recip;$U;12| (|p| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (COND
       ((OR (NULL |p|)
            (SPADCALL (QCAR (|SPADfirst| |p|)) (|spadConstant| $ 10)
                      (QREFELT $ 33)))
        (CONS 1 "failed"))
       ('T
        (SEQ
         (LETT |u| (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 35))
               |PR;recip;$U;12|)
         (EXIT
          (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                ('T (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 36))))))))))))) 

(DEFUN |PR;coerce;R$;13| (|r| $)
  (COND ((SPADCALL |r| (QREFELT $ 38)) (|spadConstant| $ 23))
        ('T (LIST (CONS (|spadConstant| $ 10) |r|))))) 

(DEFUN |PR;coerce;I$;14| (|n| $)
  (SPADCALL (SPADCALL |n| (QREFELT $ 40)) (QREFELT $ 36))) 

(DEFUN |PR;ground?;$B;15| (|p| $)
  (COND ((NULL |p|) 'T)
        ((NULL (CDR |p|))
         (SPADCALL (SPADCALL |p| (QREFELT $ 17)) (QREFELT $ 27)))
        ('T 'NIL))) 

(DEFUN |PR;times!| (|r| |x| $)
  (PROG (|endcell| |res| |xx| |newend| |tx| #1=#:G226)
    (RETURN
     (SEQ
      (COND
       ((QREFELT $ 43)
        (SEQ
         (SEQ (LETT |tx| NIL . #2=(|PR;times!|)) (LETT #1# |x| . #2#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |tx| (CAR #1#) . #2#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (RPLACD |tx| (SPADCALL |r| (QCDR |tx|) (QREFELT $ 44)))
                 (QCDR |tx|))))
              (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
         (EXIT |x|)))
       ('T
        (SEQ (LETT |xx| |x| . #2#) (LETT |res| NIL . #2#)
             (SEQ G190
                  (COND ((NULL (COND ((NULL |xx|) 'NIL) ('T 'T))) (GO G191)))
                  (SEQ (LETT |tx| (|SPADfirst| |xx|) . #2#)
                       (PROGN
                        (RPLACD |tx| (SPADCALL |r| (QCDR |tx|) (QREFELT $ 44)))
                        (QCDR |tx|))
                       (EXIT
                        (COND
                         ((SPADCALL (QCDR |tx|) (QREFELT $ 38))
                          (LETT |xx| (CDR |xx|) . #2#))
                         ('T
                          (SEQ (LETT |newend| |xx| . #2#)
                               (LETT |xx| (CDR |xx|) . #2#)
                               (EXIT
                                (COND
                                 ((NULL |res|)
                                  (SEQ (LETT |res| |newend| . #2#)
                                       (EXIT (LETT |endcell| |res| . #2#))))
                                 ('T
                                  (SEQ (RPLACD |endcell| |newend|)
                                       (EXIT
                                        (LETT |endcell| |newend|
                                              . #2#)))))))))))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT |res|)))))))) 

(DEFUN |PR;termTimes| (|r| |e| |tx| $)
  (CONS (SPADCALL |e| (QCAR |tx|) (QREFELT $ 45))
        (SPADCALL |r| (QCDR |tx|) (QREFELT $ 44)))) 

(DEFUN |PR;times| (|tco| |tex| |rx| $)
  (PROG (|r| #1=#:G234 |tx| #2=#:G233)
    (RETURN
     (SEQ
      (COND
       ((QREFELT $ 43)
        (SPADCALL (CONS #'|PR;times!0| (VECTOR $ |tex| |tco|)) |rx|
                  (QREFELT $ 47)))
       (#3='T
        (PROGN
         (LETT #2# NIL . #4=(|PR;times|))
         (SEQ (LETT |tx| NIL . #4#) (LETT #1# |rx| . #4#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |tx| (CAR #1#) . #4#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (COND
                 ((COND
                   ((SPADCALL
                     (LETT |r| (SPADCALL |tco| (QCDR |tx|) (QREFELT $ 44))
                           . #4#)
                     (QREFELT $ 38))
                    'NIL)
                   (#3# 'T))
                  (LETT #2#
                        (CONS
                         (CONS (SPADCALL |tex| (QCAR |tx|) (QREFELT $ 45)) |r|)
                         #2#)
                        . #4#)))))
              (LETT #1# (CDR #1#) . #4#) (GO G190) G191
              (EXIT (NREVERSE #2#)))))))))) 

(DEFUN |PR;times!0| (|x1| $$)
  (PROG (|tco| |tex| $)
    (LETT |tco| (QREFELT $$ 2) . #1=(|PR;times|))
    (LETT |tex| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|PR;termTimes| |tco| |tex| |x1| $))))) 

(DEFUN |PR;addm!| (|p1| |coef| |exp| |p2| $)
  (PROG (|newcell| |endcell| |res| |ttt| |newcoef| |exy| |ty| |tx|)
    (RETURN
     (SEQ
      (SEQ (LETT |res| NIL . #1=(|PR;addm!|)) (LETT |endcell| NIL . #1#)
           (EXIT
            (SEQ G190
                 (COND
                  ((NULL (COND ((OR (NULL |p1|) (NULL |p2|)) 'NIL) ('T 'T)))
                   (GO G191)))
                 (SEQ (LETT |tx| (|SPADfirst| |p1|) . #1#)
                      (LETT |ty| (|SPADfirst| |p2|) . #1#)
                      (LETT |exy| (SPADCALL |exp| (QCAR |ty|) (QREFELT $ 45))
                            . #1#)
                      (LETT |newcell| NIL . #1#)
                      (COND
                       ((SPADCALL (QCAR |tx|) |exy| (QREFELT $ 31))
                        (SEQ
                         (LETT |newcoef|
                               (SPADCALL (QCDR |tx|)
                                         (SPADCALL |coef| (QCDR |ty|)
                                                   (QREFELT $ 44))
                                         (QREFELT $ 48))
                               . #1#)
                         (COND
                          ((NULL (SPADCALL |newcoef| (QREFELT $ 38)))
                           (SEQ (PROGN (RPLACD |tx| |newcoef|) (QCDR |tx|))
                                (EXIT (LETT |newcell| |p1| . #1#)))))
                         (LETT |p1| (CDR |p1|) . #1#)
                         (EXIT (LETT |p2| (CDR |p2|) . #1#))))
                       ((SPADCALL |exy| (QCAR |tx|) (QREFELT $ 32))
                        (SEQ (LETT |newcell| |p1| . #1#)
                             (EXIT (LETT |p1| (CDR |p1|) . #1#))))
                       ('T
                        (SEQ
                         (LETT |newcoef|
                               (SPADCALL |coef| (QCDR |ty|) (QREFELT $ 44))
                               . #1#)
                         (COND
                          ((OR (QREFELT $ 43)
                               (NULL (SPADCALL |newcoef| (QREFELT $ 38))))
                           (SEQ (LETT |ttt| (CONS |exy| |newcoef|) . #1#)
                                (EXIT
                                 (LETT |newcell| (CONS |ttt| NIL) . #1#))))
                          ('T (LETT |newcell| NIL . #1#)))
                         (EXIT (LETT |p2| (CDR |p2|) . #1#)))))
                      (EXIT
                       (COND
                        ((NULL (NULL |newcell|))
                         (COND
                          ((NULL |res|)
                           (SEQ (LETT |res| |newcell| . #1#)
                                (EXIT (LETT |endcell| |res| . #1#))))
                          ('T
                           (SEQ (RPLACD |endcell| |newcell|)
                                (EXIT (LETT |endcell| |newcell| . #1#)))))))))
                 NIL (GO G190) G191 (EXIT NIL))))
      (COND
       ((NULL |p1|) (LETT |newcell| (|PR;times| |coef| |exp| |p2| $) . #1#))
       (#2='T (LETT |newcell| |p1| . #1#)))
      (EXIT
       (COND ((NULL |res|) |newcell|)
             (#2# (SEQ (RPLACD |endcell| |newcell|) (EXIT |res|))))))))) 

(DEFUN |PR;pomopo!;$RE2$;20| (|p1| |r| |e| |p2| $)
  (|PR;addm!| |p1| |r| |e| |p2| $)) 

(DEFUN |PR;addms!| (|pp1| |coef| |exp1| |pp2| $)
  (PROG (|newcell| |endcell| |res| |p2| |ttt| |newcoef| |p1| |exy| |ty| |tx|
         |exp|)
    (RETURN
     (SEQ (LETT |p1| |pp1| . #1=(|PR;addms!|)) (LETT |p2| |pp2| . #1#)
          (LETT |exp| |exp1| . #1#)
          (SEQ (LETT |res| NIL . #1#) (LETT |endcell| NIL . #1#)
               (EXIT
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((OR (NULL |p1|) (NULL |p2|)) 'NIL) ('T 'T)))
                       (GO G191)))
                     (SEQ (LETT |tx| (|SPADfirst| |p1|) . #1#)
                          (LETT |ty| (|SPADfirst| |p2|) . #1#)
                          (LETT |exy| (|add_SI| |exp| (QCAR |ty|)) . #1#)
                          (LETT |newcell| NIL . #1#)
                          (COND
                           ((|eql_SI| (QCAR |tx|) |exy|)
                            (SEQ
                             (LETT |newcoef|
                                   (SPADCALL (QCDR |tx|)
                                             (SPADCALL |coef| (QCDR |ty|)
                                                       (QREFELT $ 44))
                                             (QREFELT $ 48))
                                   . #1#)
                             (COND
                              ((NULL (SPADCALL |newcoef| (QREFELT $ 38)))
                               (SEQ (PROGN (RPLACD |tx| |newcoef|) (QCDR |tx|))
                                    (EXIT (LETT |newcell| |p1| . #1#)))))
                             (LETT |p1| (CDR |p1|) . #1#)
                             (EXIT (LETT |p2| (CDR |p2|) . #1#))))
                           ((|less_SI| |exy| (QCAR |tx|))
                            (SEQ (LETT |newcell| |p1| . #1#)
                                 (EXIT (LETT |p1| (CDR |p1|) . #1#))))
                           ('T
                            (SEQ
                             (LETT |newcoef|
                                   (SPADCALL |coef| (QCDR |ty|) (QREFELT $ 44))
                                   . #1#)
                             (COND
                              ((OR (QREFELT $ 43)
                                   (NULL (SPADCALL |newcoef| (QREFELT $ 38))))
                               (SEQ (LETT |ttt| (CONS |exy| |newcoef|) . #1#)
                                    (EXIT
                                     (LETT |newcell| (CONS |ttt| NIL) . #1#))))
                              ('T (LETT |newcell| NIL . #1#)))
                             (EXIT (LETT |p2| (CDR |p2|) . #1#)))))
                          (EXIT
                           (COND
                            ((NULL (NULL |newcell|))
                             (COND
                              ((NULL |res|)
                               (SEQ (LETT |res| |newcell| . #1#)
                                    (EXIT (LETT |endcell| |res| . #1#))))
                              ('T
                               (SEQ (RPLACD |endcell| |newcell|)
                                    (EXIT
                                     (LETT |endcell| |newcell| . #1#)))))))))
                     NIL (GO G190) G191 (EXIT NIL))))
          (COND
           ((NULL |p1|)
            (LETT |newcell| (|PR;times| |coef| |exp| |p2| $) . #1#))
           (#2='T (LETT |newcell| |p1| . #1#)))
          (EXIT
           (COND ((NULL |res|) |newcell|)
                 (#2# (SEQ (RPLACD |endcell| |newcell|) (EXIT |res|))))))))) 

(DEFUN |PR;*;3$;22| (|p1| |p2| $)
  (PROG (|res| #1=#:G293 |tx| #2=#:G292 |xx| |degy| |degx| |#G70| |#G69| |yy|
         |#G68| |#G67| |ly| |lx|)
    (RETURN
     (SEQ (LETT |xx| |p1| . #3=(|PR;*;3$;22|))
          (EXIT
           (COND ((NULL |xx|) |p1|)
                 (#4='T
                  (SEQ (LETT |yy| |p2| . #3#)
                       (EXIT
                        (COND ((NULL |yy|) |p2|)
                              (#4#
                               (SEQ
                                (COND
                                 ((QREFELT $ 9)
                                  (SEQ (LETT |lx| (LENGTH |xx|) . #3#)
                                       (LETT |ly| (LENGTH |yy|) . #3#)
                                       (EXIT
                                        (COND
                                         ((< |ly| |lx|)
                                          (SEQ
                                           (PROGN
                                            (LETT |#G67| |yy| . #3#)
                                            (LETT |#G68| |xx| . #3#)
                                            (LETT |xx| |#G67| . #3#)
                                            (LETT |yy| |#G68| . #3#))
                                           (EXIT
                                            (PROGN
                                             (LETT |#G69| |p2| . #3#)
                                             (LETT |#G70| |p1| . #3#)
                                             (LETT |p1| |#G69| . #3#)
                                             (LETT |p2| |#G70| . #3#))))))))))
                                (LETT |degx| (QCAR (|SPADfirst| |xx|)) . #3#)
                                (LETT |degy| (QCAR (|SPADfirst| |yy|)) . #3#)
                                (EXIT
                                 (COND
                                  ((ZEROP |degx|)
                                   (SPADCALL (QCDR (|SPADfirst| |xx|)) |p2|
                                             (QREFELT $ 50)))
                                  ((ZEROP |degy|)
                                   (SPADCALL |p1| (QCDR (|SPADfirst| |yy|))
                                             (QREFELT $ 51)))
                                  (#4#
                                   (SEQ (LETT |xx| (REVERSE |xx|) . #3#)
                                        (LETT |res| NIL . #3#)
                                        (COND
                                         ((< (+ |degx| |degy|)
                                             MOST-POSITIVE-FIXNUM)
                                          (SEQ (LETT |tx| NIL . #3#)
                                               (LETT #2# |xx| . #3#) G190
                                               (COND
                                                ((OR (ATOM #2#)
                                                     (PROGN
                                                      (LETT |tx| (CAR #2#)
                                                            . #3#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT |res|
                                                       (|PR;addms!| |res|
                                                        (QCDR |tx|) (QCAR |tx|)
                                                        |yy| $)
                                                       . #3#)))
                                               (LETT #2# (CDR #2#) . #3#)
                                               (GO G190) G191 (EXIT NIL)))
                                         (#4#
                                          (SEQ (LETT |tx| NIL . #3#)
                                               (LETT #1# |xx| . #3#) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |tx| (CAR #1#)
                                                            . #3#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT |res|
                                                       (|PR;addm!| |res|
                                                        (QCDR |tx|) (QCAR |tx|)
                                                        |yy| $)
                                                       . #3#)))
                                               (LETT #1# (CDR #1#) . #3#)
                                               (GO G190) G191 (EXIT NIL))))
                                        (EXIT |res|))))))))))))))))) 

(DEFUN |PR;*;3$;23| (|p1| |p2| $)
  (PROG (|res| #1=#:G301 |tx| |xx| |yy|)
    (RETURN
     (SEQ (LETT |xx| |p1| . #2=(|PR;*;3$;23|))
          (EXIT
           (COND ((NULL |xx|) |p1|)
                 (#3='T
                  (SEQ (LETT |yy| |p2| . #2#)
                       (EXIT
                        (COND ((NULL |yy|) |p2|)
                              ((SPADCALL (QCAR (|SPADfirst| |xx|))
                                         (QREFELT $ 27))
                               (SPADCALL (QCDR (|SPADfirst| |xx|)) |p2|
                                         (QREFELT $ 50)))
                              ((SPADCALL (QCAR (|SPADfirst| |yy|))
                                         (QREFELT $ 27))
                               (SPADCALL |p1| (QCDR (|SPADfirst| |yy|))
                                         (QREFELT $ 51)))
                              (#3#
                               (SEQ (LETT |xx| (REVERSE |xx|) . #2#)
                                    (LETT |res| NIL . #2#)
                                    (SEQ (LETT |tx| NIL . #2#)
                                         (LETT #1# |xx| . #2#) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |tx| (CAR #1#) . #2#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |res|
                                                 (|PR;addm!| |res| (QCDR |tx|)
                                                  (QCAR |tx|) |yy| $)
                                                 . #2#)))
                                         (LETT #1# (CDR #1#) . #2#) (GO G190)
                                         G191 (EXIT NIL))
                                    (EXIT |res|))))))))))))) 

(DEFUN |PR;^;$Pi$;24| (|p| |np| $) (SPADCALL |p| |np| (QREFELT $ 53))) 

(DEFUN |PR;^;$Nni$;25| (|p| |nn| $)
  (PROG (|cc|)
    (RETURN
     (COND ((NULL |p|) (|spadConstant| $ 23))
           ((ZEROP |nn|) (|spadConstant| $ 12)) ((EQL |nn| 1) |p|)
           (#1='T
            (COND
             ((NULL (CDR |p|))
              (COND
               ((SPADCALL
                 (LETT |cc|
                       (SPADCALL (QCDR (|SPADfirst| |p|)) |nn| (QREFELT $ 56))
                       |PR;^;$Nni$;25|)
                 (QREFELT $ 38))
                (|spadConstant| $ 23))
               (#1#
                (LIST
                 (CONS (SPADCALL |nn| (QCAR (|SPADfirst| |p|)) (QREFELT $ 57))
                       |cc|)))))
             (#1#
              (SPADCALL (LIST (|SPADfirst| |p|)) (CDR |p|) |nn|
                        (QREFELT $ 58))))))))) 

(DEFUN |PR;unitNormal;$R;26| (|p| $)
  (PROG (|a| #1=#:G309 |lcf| |#G1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((NULL |p|)
          (EXIT (VECTOR (|spadConstant| $ 12) |p| (|spadConstant| $ 12))))
         ('T
          (SEQ
           (LETT |#G1| (QCDR (|SPADfirst| |p|)) . #2=(|PR;unitNormal;$R;26|))
           (LETT |lcf| |#G1| . #2#)
           (EXIT
            (COND
             ((SPADCALL |#G1| (|spadConstant| $ 11) (QREFELT $ 59))
              (PROGN
               (LETT #1#
                     (VECTOR (|spadConstant| $ 12) |p| (|spadConstant| $ 12))
                     . #2#)
               (GO #1#))))))))
        (LETT |a| (SPADCALL |lcf| (QREFELT $ 60)) . #2#)
        (EXIT
         (VECTOR (SPADCALL |lcf| (QREFELT $ 36))
                 (CONS (CONS (QCAR (|SPADfirst| |p|)) (|spadConstant| $ 11))
                       (SPADCALL |a| (CDR |p|) (QREFELT $ 50)))
                 (SPADCALL |a| (QREFELT $ 36))))))
      #1# (EXIT #1#))))) 

(DEFUN |PR;unitCanonical;2$;27| (|p| $)
  (PROG (|a| #1=#:G313 |lcf| |#G2|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND ((NULL |p|) (EXIT |p|))
              ('T
               (SEQ
                (LETT |#G2| (QCDR (|SPADfirst| |p|))
                      . #2=(|PR;unitCanonical;2$;27|))
                (LETT |lcf| |#G2| . #2#)
                (EXIT
                 (COND
                  ((SPADCALL |#G2| (|spadConstant| $ 11) (QREFELT $ 59))
                   (PROGN (LETT #1# |p| . #2#) (GO #1#))))))))
        (LETT |a| (SPADCALL |lcf| (QREFELT $ 60)) . #2#)
        (EXIT
         (CONS (CONS (QCAR (|SPADfirst| |p|)) (|spadConstant| $ 11))
               (SPADCALL |a| (CDR |p|) (QREFELT $ 50))))))
      #1# (EXIT #1#))))) 

(DEFUN |PR;unitNormal;$R;28| (|p| $)
  (PROG (|a| |cf| |u| |#G86|)
    (RETURN
     (SEQ
      (COND
       ((OR (NULL |p|)
            (SPADCALL (QCDR (|SPADfirst| |p|)) (|spadConstant| $ 11)
                      (QREFELT $ 59)))
        (VECTOR (|spadConstant| $ 12) |p| (|spadConstant| $ 12)))
       ('T
        (SEQ
         (PROGN
          (LETT |#G86| (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 64))
                . #1=(|PR;unitNormal;$R;28|))
          (LETT |u| (QVELT |#G86| 0) . #1#)
          (LETT |cf| (QVELT |#G86| 1) . #1#)
          (LETT |a| (QVELT |#G86| 2) . #1#)
          |#G86|)
         (EXIT
          (VECTOR (SPADCALL |u| (QREFELT $ 36))
                  (CONS (CONS (QCAR (|SPADfirst| |p|)) |cf|)
                        (SPADCALL |a| (CDR |p|) (QREFELT $ 50)))
                  (SPADCALL |a| (QREFELT $ 36))))))))))) 

(DEFUN |PR;unitCanonical;2$;29| (|p| $)
  (PROG (|a| |cf| |u| |#G88|)
    (RETURN
     (SEQ
      (COND
       ((OR (NULL |p|)
            (SPADCALL (QCDR (|SPADfirst| |p|)) (|spadConstant| $ 11)
                      (QREFELT $ 59)))
        |p|)
       ('T
        (SEQ
         (PROGN
          (LETT |#G88| (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 64))
                . #1=(|PR;unitCanonical;2$;29|))
          (LETT |u| (QVELT |#G88| 0) . #1#)
          (LETT |cf| (QVELT |#G88| 1) . #1#)
          (LETT |a| (QVELT |#G88| 2) . #1#)
          |#G88|)
         (EXIT
          (CONS (CONS (QCAR (|SPADfirst| |p|)) |cf|)
                (SPADCALL |a| (CDR |p|) (QREFELT $ 50))))))))))) 

(DEFUN |PR;associates?;2$B;30| (|p1| |p2| $)
  (PROG (#1=#:G325)
    (RETURN
     (COND ((NULL |p1|) (NULL |p2|)) ((NULL |p2|) 'NIL)
           (#2='T
            (COND
             ((SPADCALL (QCAR (|SPADfirst| |p1|)) (QCAR (|SPADfirst| |p2|))
                        (QREFELT $ 31))
              (COND
               ((SPADCALL (QCDR (|SPADfirst| |p1|)) (QCDR (|SPADfirst| |p2|))
                          (QREFELT $ 65))
                (SPADCALL
                 (SPADCALL
                  (PROG2
                      (LETT #1#
                            (SPADCALL (QCDR (|SPADfirst| |p2|))
                                      (QCDR (|SPADfirst| |p1|)) (QREFELT $ 66))
                            |PR;associates?;2$B;30|)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                  (CDR |p1|) (QREFELT $ 50))
                 (CDR |p2|) (QREFELT $ 67)))
               (#2# 'NIL)))
             (#2# 'NIL))))))) 

(DEFUN |PR;exquo;$RU;31| (|p| |r| $)
  (PROG (#1=#:G338 |a| #2=#:G340 |tm| #3=#:G339)
    (RETURN
     (SEQ
      (EXIT
       (CONS 0
             (PROGN
              (LETT #3# NIL . #4=(|PR;exquo;$RU;31|))
              (SEQ (LETT |tm| NIL . #4#) (LETT #2# |p| . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |tm| (CAR #2#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #3#
                           (CONS
                            (SEQ
                             (LETT |a|
                                   (SPADCALL (QCDR |tm|) |r| (QREFELT $ 66))
                                   . #4#)
                             (EXIT
                              (COND
                               ((QEQCAR |a| 1)
                                (PROGN
                                 (LETT #1# (CONS 1 "failed") . #4#)
                                 (GO #1#)))
                               ('T (CONS (QCAR |tm|) (QCDR |a|))))))
                            #3#)
                           . #4#)))
                   (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                   (EXIT (NREVERSE #3#))))))
      #1# (EXIT #1#))))) 

(DEFUN |PR;fmecg;$ER2$;32| (|p1| |e| |r| |p2| $)
  (PROG (|rout| |u| |c2| |e2| #1=#:G350 |tm|)
    (RETURN
     (SEQ (LETT |rout| NIL . #2=(|PR;fmecg;$ER2$;32|))
          (LETT |r| (SPADCALL |r| (QREFELT $ 70)) . #2#)
          (SEQ (LETT |tm| NIL . #2#) (LETT #1# |p2| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |tm| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |e2| (SPADCALL |e| (QCAR |tm|) (QREFELT $ 45)) . #2#)
                    (LETT |c2| (SPADCALL |r| (QCDR |tm|) (QREFELT $ 44)) . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |c2| (|spadConstant| $ 21) (QREFELT $ 59))
                       "next term")
                      ('T
                       (SEQ
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |p1|) 'NIL)
                                      ('T
                                       (SPADCALL (QCAR (|SPADfirst| |p1|)) |e2|
                                                 (QREFELT $ 33)))))
                               (GO G191)))
                             (SEQ
                              (LETT |rout| (CONS (|SPADfirst| |p1|) |rout|)
                                    . #2#)
                              (EXIT (LETT |p1| (CDR |p1|) . #2#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (COND
                         ((OR (NULL |p1|)
                              (SPADCALL (QCAR (|SPADfirst| |p1|)) |e2|
                                        (QREFELT $ 32)))
                          (EXIT
                           (LETT |rout| (CONS (CONS |e2| |c2|) |rout|)
                                 . #2#))))
                        (COND
                         ((SPADCALL
                           (LETT |u|
                                 (SPADCALL (QCDR (|SPADfirst| |p1|)) |c2|
                                           (QREFELT $ 48))
                                 . #2#)
                           (|spadConstant| $ 21) (QREFELT $ 71))
                          (LETT |rout| (CONS (CONS |e2| |u|) |rout|) . #2#)))
                        (EXIT (LETT |p1| (CDR |p1|) . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (NRECONC |rout| |p1|)))))) 

(DEFUN |PR;exquo;2$U;33| (|p1| |p2| $)
  (PROG (|rout| #1=#:G365 |ee| |a|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL |p2|) (|error| "Division by 0"))
             ((SPADCALL |p2| (|spadConstant| $ 12) (QREFELT $ 67))
              (CONS 0 |p1|))
             ((SPADCALL |p1| |p2| (QREFELT $ 67))
              (CONS 0 (|spadConstant| $ 12)))
             (#2='T
              (SEQ (LETT |rout| NIL . #3=(|PR;exquo;2$U;33|))
                   (SEQ G190
                        (COND
                         ((NULL (COND ((NULL |p1|) 'NIL) ('T 'T))) (GO G191)))
                        (SEQ
                         (LETT |a|
                               (SPADCALL (QCDR (|SPADfirst| |p1|))
                                         (QCDR (|SPADfirst| |p2|))
                                         (QREFELT $ 66))
                               . #3#)
                         (EXIT
                          (COND
                           ((QEQCAR |a| 1)
                            (PROGN
                             (LETT #1# (CONS 1 "failed") . #3#)
                             (GO #1#)))
                           ('T
                            (SEQ
                             (LETT |ee|
                                   (SPADCALL (QCAR (|SPADfirst| |p1|))
                                             (QCAR (|SPADfirst| |p2|))
                                             (QREFELT $ 73))
                                   . #3#)
                             (EXIT
                              (COND
                               ((QEQCAR |ee| 1)
                                (PROGN
                                 (LETT #1# (CONS 1 "failed") . #3#)
                                 (GO #1#)))
                               ('T
                                (SEQ
                                 (LETT |p1|
                                       (SPADCALL (CDR |p1|) (QCDR |ee|)
                                                 (QCDR |a|) (CDR |p2|)
                                                 (QREFELT $ 72))
                                       . #3#)
                                 (EXIT
                                  (LETT |rout|
                                        (CONS (CONS (QCDR |ee|) (QCDR |a|))
                                              |rout|)
                                        . #3#)))))))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (COND ((NULL |p1|) (CONS 0 (REVERSE |rout|)))
                          (#2# (CONS 1 "failed"))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PR;exquo;2$U;34| (|p1| |p2| $)
  (PROG (|rout| #1=#:G380 |ee| |a|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL |p2|) (|error| "Division by 0"))
             ((SPADCALL |p2| (|spadConstant| $ 12) (QREFELT $ 67))
              (CONS 0 |p1|))
             (#2='T
              (SEQ (LETT |rout| NIL . #3=(|PR;exquo;2$U;34|))
                   (SEQ G190
                        (COND
                         ((NULL (COND ((NULL |p1|) 'NIL) ('T 'T))) (GO G191)))
                        (SEQ
                         (LETT |a|
                               (SPADCALL (QCDR (|SPADfirst| |p1|))
                                         (QCDR (|SPADfirst| |p2|))
                                         (QREFELT $ 66))
                               . #3#)
                         (EXIT
                          (COND
                           ((QEQCAR |a| 1)
                            (PROGN
                             (LETT #1# (CONS 1 "failed") . #3#)
                             (GO #1#)))
                           ('T
                            (SEQ
                             (LETT |ee|
                                   (SPADCALL (QCAR (|SPADfirst| |p1|))
                                             (QCAR (|SPADfirst| |p2|))
                                             (QREFELT $ 73))
                                   . #3#)
                             (EXIT
                              (COND
                               ((QEQCAR |ee| 1)
                                (PROGN
                                 (LETT #1# (CONS 1 "failed") . #3#)
                                 (GO #1#)))
                               ('T
                                (SEQ
                                 (LETT |p1|
                                       (SPADCALL (CDR |p1|) (QCDR |ee|)
                                                 (QCDR |a|) (CDR |p2|)
                                                 (QREFELT $ 72))
                                       . #3#)
                                 (EXIT
                                  (LETT |rout|
                                        (CONS (CONS (QCDR |ee|) (QCDR |a|))
                                              |rout|)
                                        . #3#)))))))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (COND ((NULL |p1|) (CONS 0 (REVERSE |rout|)))
                          (#2# (CONS 1 "failed"))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PR;/;$R$;35| (|x| |r| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 60)) |x| (QREFELT $ 50))) 

(DECLAIM (NOTINLINE |PolynomialRing;|)) 

(DEFUN |PolynomialRing| (&REST #1=#:G394)
  (PROG ()
    (RETURN
     (PROG (#2=#:G395)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PolynomialRing|)
                                           '|domainEqualList|)
                . #3=(|PolynomialRing|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PolynomialRing;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|PolynomialRing|))))))))))) 

(DEFUN |PolynomialRing;| (|#1| |#2|)
  (PROG (|pv$| #1=#:G390 #2=#:G391 #3=#:G392 #4=#:G393 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #5=(|PolynomialRing|))
      (LETT DV$2 (|devaluate| |#2|) . #5#)
      (LETT |dv$| (LIST '|PolynomialRing| DV$1 DV$2) . #5#)
      (LETT $ (GETREFV 86) . #5#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1| '(|EntireRing|))
                                          (|HasCategory| |#1| '(|SemiRing|))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#1|
                                                         '(|canonicalUnitNormal|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|)))))
                                          (|HasCategory| |#1| '(|GcdDomain|))
                                          (LETT #4#
                                                (|HasCategory| |#1|
                                                               '(|CommutativeRing|))
                                                . #5#)
                                          (OR #4#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #4#
                                           (|HasCategory| |#1| '(|EntireRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#1| '(|Ring|)))
                                          (OR #4#
                                              (|HasCategory| |#1|
                                                             '(|EntireRing|))
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1| '(|Ring|)))
                                          (OR #4#
                                              (|HasCategory| |#1|
                                                             '(|EntireRing|))
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (OR #4#
                                              (|HasCategory| |#1|
                                                             '(|EntireRing|)))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|AbelianGroup|))
                                                . #5#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #3#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #4#
                                           (|HasCategory| |#1| '(|EntireRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#1| '(|Ring|)))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|CancellationAbelianMonoid|))
                                                . #5#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #3# #2#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #4#
                                           (|HasCategory| |#1| '(|EntireRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#1| '(|Ring|)))
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|AbelianMonoid|))
                                                . #5#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #3# #1# #2#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #4#
                                           (|HasCategory| |#1| '(|EntireRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#1| '(|Ring|)))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#2|
                                                          '(|CancellationAbelianMonoid|)))))
                      . #5#))
      (|haddProp| |$ConstructorCache| '|PolynomialRing| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
           (|augmentPredVector| $ 134217728))
      (AND (|HasCategory| $ '(|CommutativeRing|))
           (|augmentPredVector| $ 268435456))
      (AND
       (OR (|HasCategory| |#1| '(|EntireRing|))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 536870912))
      (AND
       (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
           (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasCategory| |#1| '(|Ring|)))
       (|augmentPredVector| $ 1073741824))
      (AND
       (OR (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasCategory| |#1| '(|SemiRing|)))
       (|augmentPredVector| $ 2147483648))
      (AND
       (OR (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (|HasCategory| |#1| '(|Ring|)))
       (|augmentPredVector| $ 4294967296))
      (AND
       (OR #3#
           (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 8589934592))
      (AND
       (OR #2#
           (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 17179869184))
      (AND
       (OR #1#
           (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 34359738368))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|List| (|Record| (|:| |k| |#2|) (|:| |c| |#1|))))
      (QSETREFV $ 9 (|HasCategory| |#1| '(|CommutativeRing|)))
      (COND
       ((|testBitVector| |pv$| 25)
        (QSETREFV $ 12
                  (CONS #'|makeSpadConstant|
                        (LIST (|dispatchFunction| |PR;One;$;1|) $ 12)))))
      (COND
       ((|testBitVector| |pv$| 7)
        (QSETREFV $ 15
                  (CONS (|dispatchFunction| |PR;characteristic;Nni;2|) $))))
      (COND
       ((|domainEqual| |#2| (|NonNegativeInteger|))
        (QSETREFV $ 30 (CONS (|dispatchFunction| |PR;coefficient;$ER;10|) $)))
       ('T
        (QSETREFV $ 30 (CONS (|dispatchFunction| |PR;coefficient;$ER;11|) $))))
      (COND
       ((|testBitVector| |pv$| 7)
        (QSETREFV $ 41 (CONS (|dispatchFunction| |PR;coerce;I$;14|) $))))
      (QSETREFV $ 43 (|HasCategory| |#1| '(|noZeroDivisors|)))
      (COND
       ((|domainEqual| |#2| (|NonNegativeInteger|))
        (PROGN (QSETREFV $ 52 (CONS (|dispatchFunction| |PR;*;3$;22|) $))))
       ('T (QSETREFV $ 52 (CONS (|dispatchFunction| |PR;*;3$;23|) $))))
      (COND
       ((|testBitVector| |pv$| 29)
        (PROGN
         (QSETREFV $ 55
                   (CONS (|dispatchFunction| |PR;^;$Pi$;24|)
                         (|getDomainView| $ '(|CommutativeRing|))))
         (QSETREFV $ 53
                   (CONS (|dispatchFunction| |PR;^;$Nni$;25|)
                         (|getDomainView| $ '(|CommutativeRing|)))))))
      (COND
       ((|testBitVector| |pv$| 12)
        (PROGN
         (QSETREFV $ 62 (CONS (|dispatchFunction| |PR;unitNormal;$R;26|) $))
         (QSETREFV $ 63
                   (CONS (|dispatchFunction| |PR;unitCanonical;2$;27|) $))))
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 62 (CONS (|dispatchFunction| |PR;unitNormal;$R;28|) $))
         (QSETREFV $ 63
                   (CONS (|dispatchFunction| |PR;unitCanonical;2$;29|) $)))))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 68 (CONS (|dispatchFunction| |PR;associates?;2$B;30|) $))
         (QSETREFV $ 69 (CONS (|dispatchFunction| |PR;exquo;$RU;31|) $))
         (COND
          ((|HasCategory| |#2| '(|CancellationAbelianMonoid|))
           (PROGN
            (QSETREFV $ 72 (CONS (|dispatchFunction| |PR;fmecg;$ER2$;32|) $))
            (COND
             ((|HasCategory| |#1| '(|Approximate|))
              (QSETREFV $ 74 (CONS (|dispatchFunction| |PR;exquo;2$U;33|) $)))
             ('T
              (QSETREFV $ 74
                        (CONS (|dispatchFunction| |PR;exquo;2$U;34|)
                              $))))))))))
      (COND
       ((|testBitVector| |pv$| 12)
        (QSETREFV $ 75 (CONS (|dispatchFunction| |PR;/;$R$;35|) $))))
      $)))) 

(MAKEPROP '|PolynomialRing| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 6 7) (|local| |#1|)
              (|local| |#2|) '|Rep| '|commutative| (0 . |Zero|) (4 . |One|)
              (8 . |One|) (|NonNegativeInteger|) (12 . |characteristic|)
              (16 . |characteristic|) |PR;numberOfMonomials;$Nni;3|
              |PR;degree;$E;4| (|Record| (|:| |k| 7) (|:| |c| 6)) (20 . |last|)
              |PR;minimumDegree;$E;5| (25 . |Zero|)
              |PR;leadingCoefficient;$R;6| (29 . |Zero|)
              |PR;leadingMonomial;2$;7| |PR;reductum;2$;8| (|Boolean|)
              (33 . |zero?|) (|Union| 6 '"failed") |PR;retractIfCan;$U;9|
              (38 . |coefficient|) (44 . =) (50 . <) (56 . >)
              (|Union| $ '"failed") (62 . |recip|) |PR;coerce;R$;13|
              |PR;recip;$U;12| (67 . |zero?|) (|Integer|) (72 . |coerce|)
              (77 . |coerce|) |PR;ground?;$B;15| '|entireRing?| (82 . *)
              (88 . +) (|Mapping| 18 18) (94 . |map|) (100 . +)
              |PR;pomopo!;$RE2$;20| (106 . *) (112 . *) (118 . *) (124 . ^)
              (|PositiveInteger|) (130 . ^) (136 . ^) (142 . *)
              (148 . |binomThmExpt|) (155 . =) (161 . |inv|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (166 . |unitNormal|) (171 . |unitCanonical|) (176 . |unitNormal|)
              (181 . |associates?|) (187 . |exquo|) (193 . =)
              (199 . |associates?|) (205 . |exquo|) (211 . -) (216 . ~=)
              (222 . |fmecg|) (230 . |subtractIfCan|) (236 . |exquo|) (242 . /)
              (|Fraction| 39) (|Union| 76 '#1="failed") (|Union| 39 '#1#)
              (|Mapping| 7 7) (|List| 6) (|Mapping| 6 6) (|String|)
              (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 248 |zero?| 254 |unitNormal| 259 |unitCanonical| 264 |unit?|
              269 |subtractIfCan| 274 |smaller?| 280 |sample| 286
              |retractIfCan| 290 |retract| 305 |reductum| 320 |recip| 325
              |primitivePart| 330 |pomopo!| 335 |opposite?| 343 |one?| 349
              |numberOfMonomials| 354 |monomial?| 359 |monomial| 364
              |minimumDegree| 370 |mapExponents| 375 |map| 381
              |leadingMonomial| 387 |leadingCoefficient| 392 |latex| 397
              |hashUpdate!| 402 |hash| 408 |ground?| 413 |ground| 418 |fmecg|
              423 |exquo| 431 |degree| 443 |content| 448 |coerce| 453
              |coefficients| 478 |coefficient| 483 |charthRoot| 489
              |characteristic| 494 |binomThmExpt| 498 |associates?| 505
              |annihilate?| 511 ^ 517 |Zero| 529 |One| 533 = 537 / 543 - 549 +
              560 * 566)
           'NIL
           (CONS
            (|makeByteWordVec2| 26
                                '(0 0 2 1 2 16 1 16 2 3 4 16 5 0 1 17 19 0 0 1
                                  1 17 18 20 22 24 6 0 26 6 0 0 10 0 0 0 0 0 0
                                  16 7 5 8 9 11))
            (CONS
             '#(|FiniteAbelianMonoidRing&| |AbelianMonoidRing&| NIL |Algebra&|
                |Algebra&| |Algebra&| |Module&| NIL |Module&| NIL NIL |Module&|
                |EntireRing&| NIL NIL |Ring&| NIL NIL NIL NIL NIL |Rng&| NIL
                NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&| |Monoid&|
                |AbelianSemiGroup&| |SemiGroup&| NIL |FullyRetractableTo&|
                |SetCategory&| NIL |RetractableTo&| |BasicType&| NIL NIL NIL
                NIL |RetractableTo&| |RetractableTo&| NIL)
             (CONS
              '#((|FiniteAbelianMonoidRing| 6 7) (|AbelianMonoidRing| 6 7)
                 (|IntegralDomain|) (|Algebra| 76) (|Algebra| $$) (|Algebra| 6)
                 (|Module| 76) (|CommutativeRing|) (|Module| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|EntireRing|) (|BiModule| 6 6) (|BiModule| 76 76) (|Ring|)
                 (|BiModule| $$ $$) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| 76) (|RightModule| 76) (|Rng|) (|LeftModule| $$)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|SemiRng|)
                 (|AbelianMonoid|) (|Monoid|) (|AbelianSemiGroup|)
                 (|SemiGroup|) (|Comparable|) (|FullyRetractableTo| 6)
                 (|SetCategory|) (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| 6) (|BasicType|) (|CoercibleTo| 85)
                 (|CommutativeStar|) (|unitsKnown|) (|noZeroDivisors|)
                 (|RetractableTo| 76) (|RetractableTo| 39)
                 (|canonicalUnitNormal|))
              (|makeByteWordVec2| 85
                                  '(0 7 0 10 0 6 0 11 0 0 0 12 0 6 13 14 0 0 13
                                    15 1 8 18 0 19 0 6 0 21 0 0 0 23 1 7 26 0
                                    27 2 0 6 0 7 30 2 7 26 0 0 31 2 7 26 0 0 32
                                    2 7 26 0 0 33 1 6 34 0 35 1 6 26 0 38 1 6 0
                                    39 40 1 0 0 39 41 2 6 0 0 0 44 2 7 0 0 0 45
                                    2 8 0 46 0 47 2 6 0 0 0 48 2 0 0 6 0 50 2 0
                                    0 0 6 51 2 0 0 0 0 52 2 0 0 0 13 53 2 0 0 0
                                    54 55 2 6 0 0 13 56 2 7 0 13 0 57 3 0 0 0 0
                                    13 58 2 6 26 0 0 59 1 6 0 0 60 1 0 61 0 62
                                    1 0 0 0 63 1 6 61 0 64 2 6 26 0 0 65 2 6 34
                                    0 0 66 2 0 26 0 0 67 2 0 26 0 0 68 2 0 34 0
                                    6 69 1 6 0 0 70 2 6 26 0 0 71 4 0 0 0 7 6 0
                                    72 2 7 34 0 0 73 2 0 34 0 0 74 2 0 0 0 6 75
                                    2 0 26 0 0 1 1 36 26 0 1 1 30 61 0 62 1 30
                                    0 0 63 1 30 26 0 1 2 35 34 0 0 1 2 10 26 0
                                    0 1 0 36 0 1 1 8 77 0 1 1 9 78 0 1 1 0 28 0
                                    29 1 8 76 0 1 1 9 39 0 1 1 0 6 0 1 1 0 0 0
                                    25 1 32 34 0 37 1 14 0 0 1 4 0 0 0 6 7 0 49
                                    2 36 26 0 0 1 1 32 26 0 1 1 0 13 0 16 1 0
                                    26 0 1 2 0 0 6 7 1 1 0 7 0 20 2 0 0 79 0 1
                                    2 0 0 81 0 1 1 0 0 0 24 1 0 6 0 22 1 0 82 0
                                    1 2 0 84 84 0 1 1 0 83 0 1 1 0 26 0 42 1 0
                                    6 0 1 4 27 0 0 7 6 0 72 2 30 34 0 0 74 2 5
                                    34 0 6 69 1 0 7 0 17 1 14 6 0 1 1 28 0 0 1
                                    1 31 0 39 41 1 13 0 76 1 1 0 0 6 36 1 0 85
                                    0 1 1 0 80 0 1 2 0 6 0 7 30 1 3 34 0 1 0 33
                                    13 15 3 29 0 0 0 13 58 2 30 26 0 0 68 2 33
                                    26 0 0 1 2 32 0 0 13 53 2 0 0 0 54 55 0 36
                                    0 23 0 32 0 12 2 0 26 0 0 67 2 12 0 0 6 75
                                    2 34 0 0 0 1 1 34 0 0 1 2 0 0 0 0 1 2 34 0
                                    39 0 1 2 36 0 13 0 1 2 1 0 0 76 1 2 1 0 76
                                    0 1 2 0 0 6 0 50 2 0 0 0 0 52 2 0 0 0 6 51
                                    2 0 0 54 0 1)))))
           '|lookupComplete|)) 
