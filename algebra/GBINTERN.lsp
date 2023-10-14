
(/VERSIONCHECK 2) 

(DEFUN |GBINTERN;virtualDegree;DpolNni;1| (|p| $) (SPADCALL |p| (QREFELT $ 11))) 

(PUT '|GBINTERN;virtualDegree;DpolNni;2| '|SPADreplace| '(XLAM (|p|) 0)) 

(DEFUN |GBINTERN;virtualDegree;DpolNni;2| (|p| $) 0) 

(DEFUN |GBINTERN;critpOrder;2RB;3| (|cp1| |cp2| $)
  (COND ((< (QVELT |cp1| 1) (QVELT |cp2| 1)) 'T)
        ((< (QVELT |cp2| 1) (QVELT |cp1| 1)) 'NIL)
        ('T (SPADCALL (QVELT |cp1| 0) (QVELT |cp2| 0) (QREFELT $ 14))))) 

(DEFUN |GBINTERN;makeCrit;RDpolNniR;4| (|sp1| |p2| |totdeg2| $)
  (PROG (|tdeg| |e2| #1=#:G124 |e1| |deg| |p1|)
    (RETURN
     (SEQ (LETT |p1| (QCDR |sp1|) . #2=(|GBINTERN;makeCrit;RDpolNniR;4|))
          (LETT |deg|
                (SPADCALL (SPADCALL |p1| (QREFELT $ 17))
                          (SPADCALL |p2| (QREFELT $ 17)) (QREFELT $ 18))
                . #2#)
          (LETT |e1|
                (PROG2
                    (LETT #1#
                          (SPADCALL |deg| (SPADCALL |p1| (QREFELT $ 17))
                                    (QREFELT $ 20))
                          . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                . #2#)
          (LETT |e2|
                (PROG2
                    (LETT #1#
                          (SPADCALL |deg| (SPADCALL |p2| (QREFELT $ 17))
                                    (QREFELT $ 20))
                          . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                . #2#)
          (LETT |tdeg|
                (MAX
                 (+ (QCAR |sp1|)
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 21) |e1| (QREFELT $ 23))
                     (QREFELT $ 12)))
                 (+ |totdeg2|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 21) |e2| (QREFELT $ 23))
                     (QREFELT $ 12))))
                . #2#)
          (EXIT (VECTOR |deg| |tdeg| |p1| |p2|)))))) 

(DEFUN |GBINTERN;gbasis;L2IL;5| (|Pol| |xx1| |xx2| $)
  (PROG (#1=#:G171 |x| #2=#:G170 |xx| |redPols| |basPols| D D1 #3=#:G169
         #4=#:G168 #5=#:G158 |h| |s| D0 #6=#:G167 #7=#:G166 #8=#:G165 #9=#:G164
         |toth| |Pol1|)
    (RETURN
     (SEQ
      (LETT |Pol1|
            (SPADCALL (CONS #'|GBINTERN;gbasis;L2IL;5!0| $) |Pol|
                      (QREFELT $ 29))
            . #10=(|GBINTERN;gbasis;L2IL;5|))
      (LETT |basPols|
            (SPADCALL (SPADCALL (|SPADfirst| |Pol1|) (QREFELT $ 30))
                      (SPADCALL (|SPADfirst| |Pol1|) (QREFELT $ 12)) NIL
                      (QREFELT $ 32))
            . #10#)
      (LETT |Pol1| (CDR |Pol1|) . #10#) (LETT D NIL . #10#)
      (SEQ G190 (COND ((NULL (COND ((NULL |Pol1|) 'NIL) ('T 'T))) (GO G191)))
           (SEQ
            (LETT |h| (SPADCALL (|SPADfirst| |Pol1|) (QREFELT $ 30)) . #10#)
            (LETT |Pol1| (CDR |Pol1|) . #10#)
            (LETT |toth| (SPADCALL |h| (QREFELT $ 12)) . #10#)
            (LETT D1
                  (PROGN
                   (LETT #9# NIL . #10#)
                   (SEQ (LETT |x| NIL . #10#) (LETT #8# |basPols| . #10#) G190
                        (COND
                         ((OR (ATOM #8#)
                              (PROGN (LETT |x| (CAR #8#) . #10#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #9#
                                (CONS (SPADCALL |x| |h| |toth| (QREFELT $ 25))
                                      #9#)
                                . #10#)))
                        (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                        (EXIT (NREVERSE #9#))))
                  . #10#)
            (LETT D
                  (SPADCALL
                   (SPADCALL (SPADCALL (ELT $ 16) D1 (QREFELT $ 35))
                             (QREFELT $ 36))
                   (SPADCALL |h| D (QREFELT $ 37)) (QREFELT $ 38))
                  . #10#)
            (EXIT
             (LETT |basPols| (SPADCALL |h| |toth| |basPols| (QREFELT $ 32))
                   . #10#)))
           NIL (GO G190) G191 (EXIT NIL))
      (LETT D (SPADCALL (ELT $ 16) D (QREFELT $ 35)) . #10#)
      (LETT |xx| |xx2| . #10#)
      (LETT |redPols|
            (PROGN
             (LETT #7# NIL . #10#)
             (SEQ (LETT |x| NIL . #10#) (LETT #6# |basPols| . #10#) G190
                  (COND
                   ((OR (ATOM #6#) (PROGN (LETT |x| (CAR #6#) . #10#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #7# (CONS (QCDR |x|) #7#) . #10#)))
                  (LETT #6# (CDR #6#) . #10#) (GO G190) G191
                  (EXIT (NREVERSE #7#))))
            . #10#)
      (SEQ
       (EXIT
        (SEQ G190 (COND ((NULL (COND ((NULL D) 'NIL) ('T 'T))) (GO G191)))
             (SEQ (LETT D0 (|SPADfirst| D) . #10#)
                  (LETT |s|
                        (SPADCALL (SPADCALL D0 (QREFELT $ 39)) (QREFELT $ 30))
                        . #10#)
                  (LETT D (CDR D) . #10#)
                  (LETT |h|
                        (SPADCALL (SPADCALL |s| |redPols| (QREFELT $ 40))
                                  (QREFELT $ 30))
                        . #10#)
                  (COND ((EQL |xx1| 1) (SPADCALL |h| (QREFELT $ 42))))
                  (EXIT
                   (COND
                    ((SPADCALL |h| (|spadConstant| $ 45) (QREFELT $ 46))
                     (SEQ
                      (COND
                       ((EQL |xx2| 1)
                        (SEQ
                         (SPADCALL D0 |s| |h| (LENGTH |basPols|) (LENGTH D)
                                   |xx| (QREFELT $ 48))
                         (EXIT (LETT |xx| 2 . #10#)))))
                      (EXIT " go to top of while ")))
                    ((SPADCALL (SPADCALL |h| (QREFELT $ 17))
                               (|spadConstant| $ 44) (QREFELT $ 49))
                     (SEQ (LETT D NIL . #10#)
                          (COND
                           ((EQL |xx2| 1)
                            (SEQ
                             (SPADCALL D0 |s| |h| (LENGTH |basPols|) (LENGTH D)
                                       |xx| (QREFELT $ 48))
                             (EXIT (LETT |xx| 2 . #10#)))))
                          (LETT |basPols| (SPADCALL |h| 0 NIL (QREFELT $ 32))
                                . #10#)
                          (EXIT
                           (PROGN (LETT #5# |$NoValue| . #10#) (GO #5#)))))
                    ('T
                     (SEQ
                      (LETT D1
                            (PROGN
                             (LETT #4# NIL . #10#)
                             (SEQ (LETT |x| NIL . #10#)
                                  (LETT #3# |basPols| . #10#) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN
                                         (LETT |x| (CAR #3#) . #10#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4#
                                          (CONS
                                           (SPADCALL |x| |h| (QVELT D0 1)
                                                     (QREFELT $ 25))
                                           #4#)
                                          . #10#)))
                                  (LETT #3# (CDR #3#) . #10#) (GO G190) G191
                                  (EXIT (NREVERSE #4#))))
                            . #10#)
                      (LETT D
                            (SPADCALL
                             (SPADCALL (SPADCALL (ELT $ 16) D1 (QREFELT $ 35))
                                       (QREFELT $ 36))
                             (SPADCALL |h| D (QREFELT $ 37)) (QREFELT $ 38))
                            . #10#)
                      (LETT |basPols|
                            (SPADCALL |h| (QVELT D0 1) |basPols|
                                      (QREFELT $ 32))
                            . #10#)
                      (LETT |redPols| (SPADCALL |redPols| |h| (QREFELT $ 50))
                            . #10#)
                      (EXIT
                       (COND
                        ((EQL |xx2| 1)
                         (SEQ
                          (SPADCALL D0 |s| |h| (LENGTH |basPols|) (LENGTH D)
                                    |xx| (QREFELT $ 48))
                          (EXIT (LETT |xx| 2 . #10#)))))))))))
             NIL (GO G190) G191 (EXIT NIL)))
       #5# (EXIT #5#))
      (LETT |Pol|
            (PROGN
             (LETT #2# NIL . #10#)
             (SEQ (LETT |x| NIL . #10#) (LETT #1# |basPols| . #10#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #10#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #2# (CONS (QCDR |x|) #2#) . #10#)))
                  (LETT #1# (CDR #1#) . #10#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #10#)
      (COND
       ((EQL |xx2| 1)
        (SEQ (SPADCALL |Pol| (QREFELT $ 51))
             (EXIT
              (SPADCALL "    THE GROEBNER BASIS POLYNOMIALS"
                        (QREFELT $ 54))))))
      (COND
       ((EQL |xx1| 1)
        (COND
         ((SPADCALL |xx2| 1 (QREFELT $ 55))
          (SPADCALL "    THE GROEBNER BASIS POLYNOMIALS" (QREFELT $ 54))))))
      (EXIT |Pol|))))) 

(DEFUN |GBINTERN;gbasis;L2IL;5!0| (|z1| |z2| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 17)) (SPADCALL |z2| (QREFELT $ 17))
            (QREFELT $ 26))) 

(DEFUN |GBINTERN;critMonD1;Expon2L;6| (|e| D2 $)
  (PROG (|x|)
    (RETURN
     (SEQ
      (COND ((NULL D2) NIL)
            (#1='T
             (SEQ (LETT |x| (|SPADfirst| D2) |GBINTERN;critMonD1;Expon2L;6|)
                  (EXIT
                   (COND
                    ((SPADCALL |e| (QVELT |x| 0) (QREFELT $ 57))
                     (SPADCALL |e| (CDR D2) (QREFELT $ 58)))
                    (#1#
                     (CONS |x| (SPADCALL |e| (CDR D2) (QREFELT $ 58))))))))))))) 

(DEFUN |GBINTERN;critMTonD1;2L;7| (D1 $)
  (PROG (|r1| |e1| |cT1| |s1| |f1|)
    (RETURN
     (SEQ
      (COND ((NULL D1) NIL)
            (#1='T
             (SEQ
              (LETT |f1| (|SPADfirst| D1) . #2=(|GBINTERN;critMTonD1;2L;7|))
              (LETT |s1| (LENGTH D1) . #2#)
              (LETT |cT1| (SPADCALL |f1| (QREFELT $ 59)) . #2#)
              (COND ((EQL |s1| 1) (COND (|cT1| (EXIT NIL)))))
              (EXIT
               (COND ((EQL |s1| 1) D1)
                     (#1#
                      (SEQ (LETT |e1| (QVELT |f1| 0) . #2#)
                           (LETT |r1| (CDR D1) . #2#)
                           (EXIT
                            (COND
                             ((SPADCALL |e1| (QVELT (|SPADfirst| |r1|) 0)
                                        (QREFELT $ 49))
                              (COND
                               (|cT1|
                                (SPADCALL (CONS |f1| (CDR |r1|))
                                          (QREFELT $ 36)))
                               (#1# (SPADCALL |r1| (QREFELT $ 36)))))
                             (#1#
                              (SEQ
                               (LETT D1 (SPADCALL |e1| |r1| (QREFELT $ 58))
                                     . #2#)
                               (EXIT
                                (COND (|cT1| (SPADCALL D1 (QREFELT $ 36)))
                                      (#1#
                                       (CONS |f1|
                                             (SPADCALL D1
                                                       (QREFELT $
                                                                36))))))))))))))))))))) 

(DEFUN |GBINTERN;critBonD;Dpol2L;8| (|h| D $)
  (PROG (|x|)
    (RETURN
     (SEQ
      (COND ((NULL D) NIL)
            (#1='T
             (SEQ (LETT |x| (|SPADfirst| D) |GBINTERN;critBonD;Dpol2L;8|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |h| (QREFELT $ 17)) (QVELT |x| 0)
                               (SPADCALL (QVELT |x| 2) (QREFELT $ 17))
                               (SPADCALL (QVELT |x| 3) (QREFELT $ 17))
                               (QREFELT $ 60))
                     (SPADCALL |h| (CDR D) (QREFELT $ 37)))
                    (#1#
                     (CONS |x| (SPADCALL |h| (CDR D) (QREFELT $ 37))))))))))))) 

(DEFUN |GBINTERN;updatF;DpolNni2L;9| (|h| |deg| F $)
  (PROG (|f1|)
    (RETURN
     (SEQ
      (COND ((NULL F) (LIST (CONS |deg| |h|)))
            (#1='T
             (SEQ (LETT |f1| (|SPADfirst| F) |GBINTERN;updatF;DpolNni2L;9|)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |h| (QREFELT $ 17))
                               (SPADCALL (QCDR |f1|) (QREFELT $ 17))
                               (QREFELT $ 57))
                     (SPADCALL |h| |deg| (CDR F) (QREFELT $ 32)))
                    (#1#
                     (CONS |f1|
                           (SPADCALL |h| |deg| (CDR F)
                                     (QREFELT $ 32))))))))))))) 

(DEFUN |GBINTERN;updatD;3L;10| (D1 D2 $)
  (PROG (|dl2| |dl1|)
    (RETURN
     (SEQ
      (COND ((NULL D1) D2) ((NULL D2) D1)
            (#1='T
             (SEQ (LETT |dl1| (|SPADfirst| D1) . #2=(|GBINTERN;updatD;3L;10|))
                  (LETT |dl2| (|SPADfirst| D2) . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL |dl1| |dl2| (QREFELT $ 16))
                     (CONS |dl1| (SPADCALL (CDR D1) D2 (QREFELT $ 38))))
                    (#1#
                     (CONS |dl2|
                           (SPADCALL D1 (CDR D2) (QREFELT $ 38))))))))))))) 

(DEFUN |GBINTERN;gcdCo| (|c1| |c2| $)
  (PROG (#1=#:G192 |d|)
    (RETURN
     (SEQ
      (LETT |d| (SPADCALL |c1| |c2| (QREFELT $ 61)) . #2=(|GBINTERN;gcdCo|))
      (EXIT
       (CONS
        (PROG2 (LETT #1# (SPADCALL |c1| |d| (QREFELT $ 62)) . #2#)
            (QCDR #1#)
          (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
        (PROG2 (LETT #1# (SPADCALL |c2| |d| (QREFELT $ 62)) . #2#)
            (QCDR #1#)
          (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#)))))))) 

(DEFUN |GBINTERN;sPol;RDpol;12| (|p| $)
  (PROG (#1=#:G198 |cc| |fj| |fi| |Tij|)
    (RETURN
     (SEQ (LETT |Tij| (QVELT |p| 0) . #2=(|GBINTERN;sPol;RDpol;12|))
          (LETT |fi| (QVELT |p| 2) . #2#) (LETT |fj| (QVELT |p| 3) . #2#)
          (LETT |cc|
                (|GBINTERN;gcdCo| (SPADCALL |fi| (QREFELT $ 63))
                 (SPADCALL |fj| (QREFELT $ 63)) $)
                . #2#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |fi| (QREFELT $ 64))
                      (SPADCALL (QCDR |cc|)
                                (PROG2
                                    (LETT #1#
                                          (SPADCALL |Tij|
                                                    (SPADCALL |fi|
                                                              (QREFELT $ 17))
                                                    (QREFELT $ 20))
                                          . #2#)
                                    (QCDR #1#)
                                  (|check_union| (QEQCAR #1# 0) (QREFELT $ 7)
                                                 #1#))
                                (QREFELT $ 23))
                      (QREFELT $ 65))
            (SPADCALL (SPADCALL |fj| (QREFELT $ 64))
                      (SPADCALL (QCAR |cc|)
                                (PROG2
                                    (LETT #1#
                                          (SPADCALL |Tij|
                                                    (SPADCALL |fj|
                                                              (QREFELT $ 17))
                                                    (QREFELT $ 20))
                                          . #2#)
                                    (QCDR #1#)
                                  (|check_union| (QEQCAR #1# 0) (QREFELT $ 7)
                                                 #1#))
                                (QREFELT $ 23))
                      (QREFELT $ 65))
            (QREFELT $ 66))))))) 

(DEFUN |GBINTERN;redPo;DpolLR;13| (|s| F $)
  (PROG (|m| |cc| |e| |s1| |f1| |Fh|)
    (RETURN
     (SEQ (LETT |m| (|spadConstant| $ 21) . #1=(|GBINTERN;redPo;DpolLR;13|))
          (LETT |Fh| F . #1#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((OR (SPADCALL |s| (|spadConstant| $ 45) (QREFELT $ 46))
                        (NULL F))
                    'NIL)
                   ('T 'T)))
                 (GO G191)))
               (SEQ (LETT |f1| (|SPADfirst| F) . #1#)
                    (LETT |s1| (SPADCALL |s| (QREFELT $ 17)) . #1#)
                    (LETT |e|
                          (SPADCALL |s1| (SPADCALL |f1| (QREFELT $ 17))
                                    (QREFELT $ 20))
                          . #1#)
                    (EXIT
                     (COND
                      ((QEQCAR |e| 0)
                       (SEQ
                        (LETT |cc|
                              (|GBINTERN;gcdCo| (SPADCALL |f1| (QREFELT $ 63))
                               (SPADCALL |s| (QREFELT $ 63)) $)
                              . #1#)
                        (LETT |s|
                              (SPADCALL
                               (SPADCALL (QCAR |cc|)
                                         (SPADCALL |s| (QREFELT $ 64))
                                         (QREFELT $ 67))
                               (SPADCALL
                                (SPADCALL (QCDR |cc|) (QCDR |e|)
                                          (QREFELT $ 23))
                                (SPADCALL |f1| (QREFELT $ 64)) (QREFELT $ 65))
                               (QREFELT $ 66))
                              . #1#)
                        (LETT |m| (SPADCALL |m| (QCAR |cc|) (QREFELT $ 68))
                              . #1#)
                        (EXIT (LETT F |Fh| . #1#))))
                      ('T (LETT F (CDR F) . #1#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |s| |m|)))))) 

(DEFUN |GBINTERN;redPol;DpolLDpol;14| (|s| F $)
  (SPADCALL (QCAR (SPADCALL |s| F (QREFELT $ 70))) F (QREFELT $ 71))) 

(DEFUN |GBINTERN;critT;RB;15| (|p| $)
  (SPADCALL (QVELT |p| 0)
            (SPADCALL (SPADCALL (QVELT |p| 2) (QREFELT $ 17))
                      (SPADCALL (QVELT |p| 3) (QREFELT $ 17)) (QREFELT $ 72))
            (QREFELT $ 49))) 

(DEFUN |GBINTERN;critM;2ExponB;16| (|e1| |e2| $)
  (PROG (|en|)
    (RETURN
     (QEQCAR
      (LETT |en| (SPADCALL |e2| |e1| (QREFELT $ 20))
            |GBINTERN;critM;2ExponB;16|)
      0)))) 

(DEFUN |GBINTERN;critB;4ExponB;17| (|eh| |eik| |ei| |ek| $)
  (COND
   ((SPADCALL |eh| |eik| (QREFELT $ 57))
    (COND
     ((SPADCALL |eik| (SPADCALL |eh| |ei| (QREFELT $ 18)) (QREFELT $ 73))
      (SPADCALL |eik| (SPADCALL |eh| |ek| (QREFELT $ 18)) (QREFELT $ 73)))
     (#1='T 'NIL)))
   (#1# 'NIL))) 

(DEFUN |GBINTERN;hMonic;2Dpol;18| (|p| $)
  (COND ((SPADCALL |p| (|spadConstant| $ 45) (QREFELT $ 46)) |p|)
        ('T (SPADCALL |p| (QREFELT $ 74))))) 

(DEFUN |GBINTERN;credPol;DpolLDpol;19| (|h| F $)
  (PROG (|h0| |hred|)
    (RETURN
     (SEQ
      (COND ((NULL F) |h|)
            ('T
             (SEQ
              (LETT |h0|
                    (SPADCALL (SPADCALL |h| (QREFELT $ 63))
                              (SPADCALL |h| (QREFELT $ 17)) (QREFELT $ 23))
                    . #1=(|GBINTERN;credPol;DpolLDpol;19|))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL (LETT |h| (SPADCALL |h| (QREFELT $ 64)) . #1#)
                                (|spadConstant| $ 45) (QREFELT $ 75)))
                     (GO G191)))
                   (SEQ (LETT |hred| (SPADCALL |h| F (QREFELT $ 70)) . #1#)
                        (LETT |h| (QCAR |hred|) . #1#)
                        (EXIT
                         (LETT |h0|
                               (SPADCALL
                                (SPADCALL (QCDR |hred|) |h0| (QREFELT $ 67))
                                (SPADCALL (SPADCALL |h| (QREFELT $ 63))
                                          (SPADCALL |h| (QREFELT $ 17))
                                          (QREFELT $ 23))
                                (QREFELT $ 76))
                               . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |h0|)))))))) 

(DEFUN |GBINTERN;minGbasis;2L;20| (F $)
  (PROG (|newbas|)
    (RETURN
     (SEQ
      (COND ((NULL F) NIL)
            ('T
             (SEQ
              (LETT |newbas| (SPADCALL (CDR F) (QREFELT $ 77))
                    |GBINTERN;minGbasis;2L;20|)
              (EXIT
               (CONS
                (SPADCALL (SPADCALL (|SPADfirst| F) |newbas| (QREFELT $ 71))
                          (QREFELT $ 30))
                |newbas|))))))))) 

(DEFUN |GBINTERN;lepol;DpolI;21| (|p1| $)
  (PROG (|n|)
    (RETURN
     (SEQ (LETT |n| 0 . #1=(|GBINTERN;lepol;DpolI;21|))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p1| (|spadConstant| $ 45) (QREFELT $ 75)))
                 (GO G191)))
               (SEQ (LETT |n| (+ |n| 1) . #1#)
                    (EXIT (LETT |p1| (SPADCALL |p1| (QREFELT $ 64)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |n|))))) 

(DEFUN |GBINTERN;prinb;IV;22| (|n| $)
  (PROG (|x|)
    (RETURN
     (SEQ (LETT |x| 1 . #1=(|GBINTERN;prinb;IV;22|)) G190
          (COND ((|greater_SI| |x| |n|) (GO G191)))
          (SEQ (EXIT (SPADCALL "    " (QREFELT $ 54))))
          (LETT |x| (|inc_SI| |x|) . #1#) (GO G190) G191 (EXIT NIL))))) 

(DEFUN |GBINTERN;prinshINFO;DpolV;23| (|h| $)
  (SEQ (SPADCALL 2 (QREFELT $ 79))
       (SPADCALL " reduced Critpair - Polynom :" (QREFELT $ 54))
       (SPADCALL 2 (QREFELT $ 79))
       (SPADCALL (SPADCALL |h| (QREFELT $ 80)) (QREFELT $ 81))
       (EXIT (SPADCALL 2 (QREFELT $ 79))))) 

(DEFUN |GBINTERN;prindINFO;R2Dpol4I;24| (|cp| |ps| |ph| |i1| |i2| |n| $)
  (PROG (|ll| |a| |cpj| |cpi|)
    (RETURN
     (SEQ (LETT |cpi| (QVELT |cp| 2) . #1=(|GBINTERN;prindINFO;R2Dpol4I;24|))
          (LETT |cpj| (QVELT |cp| 3) . #1#)
          (COND
           ((EQL |n| 1)
            (SEQ (SPADCALL 1 (QREFELT $ 79))
                 (SPADCALL "you choose option  -info-  " (QREFELT $ 54))
                 (SPADCALL "abbrev. for the following information strings are"
                           (QREFELT $ 54))
                 (SPADCALL
                  "  ci  =>  Leading monomial  for critpair calculation"
                  (QREFELT $ 54))
                 (SPADCALL "  tci =>  Number of terms of polynomial i"
                           (QREFELT $ 54))
                 (SPADCALL
                  "  cj  =>  Leading monomial  for critpair calculation"
                  (QREFELT $ 54))
                 (SPADCALL "  tcj =>  Number of terms of polynomial j"
                           (QREFELT $ 54))
                 (SPADCALL "  c   =>  Leading monomial of critpair polynomial"
                           (QREFELT $ 54))
                 (SPADCALL "  tc  =>  Number of terms of critpair polynomial"
                           (QREFELT $ 54))
                 (SPADCALL
                  "  rc  =>  Leading monomial of redcritpair polynomial"
                  (QREFELT $ 54))
                 (SPADCALL
                  "  trc =>  Number of terms of redcritpair polynomial"
                  (QREFELT $ 54))
                 (SPADCALL
                  "  tF  =>  Number of polynomials in reduction list F"
                  (QREFELT $ 54))
                 (SPADCALL "  tD  =>  Number of critpairs still to do"
                           (QREFELT $ 54))
                 (SPADCALL 4 (QREFELT $ 79)) (EXIT (LETT |n| 2 . #1#)))))
          (SPADCALL 1 (QREFELT $ 79)) (LETT |a| (|spadConstant| $ 21) . #1#)
          (EXIT
           (COND
            ((SPADCALL |ph| (|spadConstant| $ 45) (QREFELT $ 46))
             (COND
              ((SPADCALL |ps| (|spadConstant| $ 45) (QREFELT $ 46))
               (SEQ
                (LETT |ll|
                      (LIST
                       (VECTOR
                        (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |cpi| (QREFELT $ 78))
                        (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |cpj| (QREFELT $ 78)) |ps| 0 |ph| 0 |i1|
                        |i2|))
                      . #1#)
                (SPADCALL (SPADCALL |ll| (QREFELT $ 84)) (QREFELT $ 81))
                (SPADCALL 1 (QREFELT $ 79)) (EXIT |n|)))
              (#2='T
               (SEQ
                (LETT |ll|
                      (LIST
                       (VECTOR
                        (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |cpi| (QREFELT $ 78))
                        (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |cpj| (QREFELT $ 78))
                        (SPADCALL |a| (SPADCALL |ps| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |ps| (QREFELT $ 78)) |ph| 0 |i1| |i2|))
                      . #1#)
                (SPADCALL (SPADCALL |ll| (QREFELT $ 84)) (QREFELT $ 81))
                (SPADCALL 1 (QREFELT $ 79)) (EXIT |n|)))))
            (#2#
             (SEQ
              (LETT |ll|
                    (LIST
                     (VECTOR
                      (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 17))
                                (QREFELT $ 23))
                      (SPADCALL |cpi| (QREFELT $ 78))
                      (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 17))
                                (QREFELT $ 23))
                      (SPADCALL |cpj| (QREFELT $ 78))
                      (SPADCALL |a| (SPADCALL |ps| (QREFELT $ 17))
                                (QREFELT $ 23))
                      (SPADCALL |ps| (QREFELT $ 78))
                      (SPADCALL |a| (SPADCALL |ph| (QREFELT $ 17))
                                (QREFELT $ 23))
                      (SPADCALL |ph| (QREFELT $ 78)) |i1| |i2|))
                    . #1#)
              (SPADCALL (SPADCALL |ll| (QREFELT $ 84)) (QREFELT $ 81))
              (SPADCALL 1 (QREFELT $ 79)) (EXIT |n|))))))))) 

(DEFUN |GBINTERN;prinpolINFO;LV;25| (|pl| $)
  (PROG (|n|)
    (RETURN
     (SEQ (LETT |n| (LENGTH |pl|) |GBINTERN;prinpolINFO;LV;25|)
          (SPADCALL 1 (QREFELT $ 79))
          (EXIT
           (COND
            ((EQL |n| 1)
             (SEQ
              (SPADCALL "  There is 1  Groebner Basis Polynomial "
                        (QREFELT $ 54))
              (EXIT (SPADCALL 2 (QREFELT $ 79)))))
            ('T
             (SEQ (SPADCALL "  There are " (QREFELT $ 54))
                  (SPADCALL 1 (QREFELT $ 79))
                  (SPADCALL (SPADCALL |n| (QREFELT $ 85)) (QREFELT $ 81))
                  (SPADCALL 1 (QREFELT $ 79))
                  (SPADCALL "  Groebner Basis Polynomials. " (QREFELT $ 54))
                  (EXIT (SPADCALL 2 (QREFELT $ 79))))))))))) 

(DEFUN |GBINTERN;fprindINFO;R2Dpol5I;26| (|cp| |ps| |ph| |i1| |i2| |i3| |n| $)
  (PROG (|ll| |a| |cpj| |cpi|)
    (RETURN
     (SEQ (LETT |cpi| (QVELT |cp| 2) . #1=(|GBINTERN;fprindINFO;R2Dpol5I;26|))
          (LETT |cpj| (QVELT |cp| 3) . #1#)
          (COND
           ((EQL |n| 1)
            (SEQ (SPADCALL 1 (QREFELT $ 79))
                 (SPADCALL "you choose option  -info-  " (QREFELT $ 54))
                 (SPADCALL "abbrev. for the following information strings are"
                           (QREFELT $ 54))
                 (SPADCALL
                  "  ci  =>  Leading monomial  for critpair calculation"
                  (QREFELT $ 54))
                 (SPADCALL "  tci =>  Number of terms of polynomial i"
                           (QREFELT $ 54))
                 (SPADCALL
                  "  cj  =>  Leading monomial  for critpair calculation"
                  (QREFELT $ 54))
                 (SPADCALL "  tcj =>  Number of terms of polynomial j"
                           (QREFELT $ 54))
                 (SPADCALL "  c   =>  Leading monomial of critpair polynomial"
                           (QREFELT $ 54))
                 (SPADCALL "  tc  =>  Number of terms of critpair polynomial"
                           (QREFELT $ 54))
                 (SPADCALL
                  "  rc  =>  Leading monomial of redcritpair polynomial"
                  (QREFELT $ 54))
                 (SPADCALL
                  "  trc =>  Number of terms of redcritpair polynomial"
                  (QREFELT $ 54))
                 (SPADCALL
                  "  tF  =>  Number of polynomials in reduction list F"
                  (QREFELT $ 54))
                 (SPADCALL "  tD  =>  Number of critpairs still to do"
                           (QREFELT $ 54))
                 (SPADCALL "  tDF =>  Number of subproblems still to do"
                           (QREFELT $ 54))
                 (SPADCALL 4 (QREFELT $ 79)) (EXIT (LETT |n| 2 . #1#)))))
          (SPADCALL 1 (QREFELT $ 79)) (LETT |a| (|spadConstant| $ 21) . #1#)
          (EXIT
           (COND
            ((SPADCALL |ph| (|spadConstant| $ 45) (QREFELT $ 46))
             (COND
              ((SPADCALL |ps| (|spadConstant| $ 45) (QREFELT $ 46))
               (SEQ
                (LETT |ll|
                      (LIST
                       (VECTOR
                        (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |cpi| (QREFELT $ 78))
                        (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |cpj| (QREFELT $ 78)) |ps| 0 |ph| 0 |i1| |i2|
                        |i3|))
                      . #1#)
                (SPADCALL (SPADCALL |ll| (QREFELT $ 88)) (QREFELT $ 81))
                (SPADCALL 1 (QREFELT $ 79)) (EXIT |n|)))
              (#2='T
               (SEQ
                (LETT |ll|
                      (LIST
                       (VECTOR
                        (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |cpi| (QREFELT $ 78))
                        (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |cpj| (QREFELT $ 78))
                        (SPADCALL |a| (SPADCALL |ps| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |ps| (QREFELT $ 78)) |ph| 0 |i1| |i2| |i3|))
                      . #1#)
                (SPADCALL (SPADCALL |ll| (QREFELT $ 88)) (QREFELT $ 81))
                (SPADCALL 1 (QREFELT $ 79)) (EXIT |n|)))))
            (#2#
             (SEQ
              (LETT |ll|
                    (LIST
                     (VECTOR
                      (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 17))
                                (QREFELT $ 23))
                      (SPADCALL |cpi| (QREFELT $ 78))
                      (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 17))
                                (QREFELT $ 23))
                      (SPADCALL |cpj| (QREFELT $ 78))
                      (SPADCALL |a| (SPADCALL |ps| (QREFELT $ 17))
                                (QREFELT $ 23))
                      (SPADCALL |ps| (QREFELT $ 78))
                      (SPADCALL |a| (SPADCALL |ph| (QREFELT $ 17))
                                (QREFELT $ 23))
                      (SPADCALL |ph| (QREFELT $ 78)) |i1| |i2| |i3|))
                    . #1#)
              (SPADCALL (SPADCALL |ll| (QREFELT $ 88)) (QREFELT $ 81))
              (SPADCALL 1 (QREFELT $ 79)) (EXIT |n|))))))))) 

(DECLAIM (NOTINLINE |GroebnerInternalPackage;|)) 

(DEFUN |GroebnerInternalPackage| (&REST #1=#:G264)
  (PROG ()
    (RETURN
     (PROG (#2=#:G265)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|GroebnerInternalPackage|)
                                           '|domainEqualList|)
                . #3=(|GroebnerInternalPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |GroebnerInternalPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|GroebnerInternalPackage|))))))))))) 

(DEFUN |GroebnerInternalPackage;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|GroebnerInternalPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|GroebnerInternalPackage| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 90) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|GroebnerInternalPackage|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasSignature| |#4|
                        (LIST '|totalDegree|
                              (LIST '(|NonNegativeInteger|)
                                    (|devaluate| |#4|))))
        (QSETREFV $ 12
                  (CONS (|dispatchFunction| |GBINTERN;virtualDegree;DpolNni;1|)
                        $)))
       ('T
        (QSETREFV $ 12
                  (CONS (|dispatchFunction| |GBINTERN;virtualDegree;DpolNni;2|)
                        $))))
      $)))) 

(MAKEPROP '|GroebnerInternalPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|NonNegativeInteger|)
              (0 . |totalDegree|) (5 . |virtualDegree|) (|Boolean|) (10 . <)
              (|Record| (|:| |lcmfij| 7) (|:| |totdeg| 10) (|:| |poli| 9)
                        (|:| |polj| 9))
              |GBINTERN;critpOrder;2RB;3| (16 . |degree|) (21 . |sup|)
              (|Union| $ '"failed") (27 . |subtractIfCan|) (33 . |One|)
              (37 . |One|) (41 . |monomial|)
              (|Record| (|:| |totdeg| 10) (|:| |pol| 9))
              |GBINTERN;makeCrit;RDpolNniR;4| (47 . >) (|Mapping| 13 9 9)
              (|List| 9) (53 . |sort|) |GBINTERN;hMonic;2Dpol;18| (|List| 24)
              |GBINTERN;updatF;DpolNni2L;9| (|Mapping| 13 15 15) (|List| 15)
              (59 . |sort|) |GBINTERN;critMTonD1;2L;7|
              |GBINTERN;critBonD;Dpol2L;8| |GBINTERN;updatD;3L;10|
              |GBINTERN;sPol;RDpol;12| |GBINTERN;redPol;DpolLDpol;14| (|Void|)
              |GBINTERN;prinshINFO;DpolV;23| (65 . |Zero|) (69 . |Zero|)
              (73 . |Zero|) (77 . =) (|Integer|)
              |GBINTERN;prindINFO;R2Dpol4I;24| (83 . =) (89 . |concat|)
              |GBINTERN;prinpolINFO;LV;25| (|String|) (|OutputForm|)
              (95 . |messagePrint|) (100 . ~=) |GBINTERN;gbasis;L2IL;5|
              |GBINTERN;critM;2ExponB;16| |GBINTERN;critMonD1;Expon2L;6|
              |GBINTERN;critT;RB;15| |GBINTERN;critB;4ExponB;17| (106 . |gcd|)
              (112 . |exquo|) (118 . |leadingCoefficient|) (123 . |reductum|)
              (128 . *) (134 . -) (140 . *) (146 . *)
              (|Record| (|:| |poly| 9) (|:| |mult| 6))
              |GBINTERN;redPo;DpolLR;13| |GBINTERN;credPol;DpolLDpol;19|
              (152 . +) (158 . ~=) (164 . |primitivePart|) (169 . ~=) (175 . +)
              |GBINTERN;minGbasis;2L;20| |GBINTERN;lepol;DpolI;21|
              |GBINTERN;prinb;IV;22| (181 . |coerce|) (186 . |print|)
              (|Record| (|:| |ci| 9) (|:| |tci| 47) (|:| |cj| 9) (|:| |tcj| 47)
                        (|:| |c| 9) (|:| |tc| 47) (|:| |rc| 9) (|:| |trc| 47)
                        (|:| |tF| 47) (|:| |tD| 47))
              (|List| 82) (191 . |coerce|) (196 . |coerce|)
              (|Record| (|:| |ci| 9) (|:| |tci| 47) (|:| |cj| 9) (|:| |tcj| 47)
                        (|:| |c| 9) (|:| |tc| 47) (|:| |rc| 9) (|:| |trc| 47)
                        (|:| |tF| 47) (|:| |tDD| 47) (|:| |tDF| 47))
              (|List| 86) (201 . |coerce|) |GBINTERN;fprindINFO;R2Dpol5I;26|)
           '#(|virtualDegree| 206 |updatF| 211 |updatD| 218 |sPol| 224 |redPol|
              229 |redPo| 235 |prinshINFO| 241 |prinpolINFO| 246 |prindINFO|
              251 |prinb| 261 |minGbasis| 266 |makeCrit| 271 |lepol| 278
              |hMonic| 283 |gbasis| 288 |fprindINFO| 295 |critpOrder| 306
              |critT| 312 |critMonD1| 317 |critMTonD1| 323 |critM| 328
              |critBonD| 334 |critB| 340 |credPol| 348)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 89
                                                 '(1 9 10 0 11 1 0 10 9 12 2 7
                                                   13 0 0 14 1 9 7 0 17 2 7 0 0
                                                   0 18 2 7 19 0 0 20 0 6 0 21
                                                   0 9 0 22 2 9 0 6 7 23 2 7 13
                                                   0 0 26 2 28 0 27 0 29 2 34 0
                                                   33 0 35 0 6 0 43 0 7 0 44 0
                                                   9 0 45 2 9 13 0 0 46 2 7 13
                                                   0 0 49 2 28 0 0 9 50 1 53 41
                                                   52 54 2 47 13 0 0 55 2 6 0 0
                                                   0 61 2 6 19 0 0 62 1 9 6 0
                                                   63 1 9 0 0 64 2 9 0 0 0 65 2
                                                   9 0 0 0 66 2 9 0 6 0 67 2 6
                                                   0 0 0 68 2 7 0 0 0 72 2 7 13
                                                   0 0 73 1 9 0 0 74 2 9 13 0 0
                                                   75 2 9 0 0 0 76 1 9 53 0 80
                                                   1 53 41 0 81 1 83 53 0 84 1
                                                   47 53 0 85 1 87 53 0 88 1 0
                                                   10 9 12 3 0 31 9 10 31 32 2
                                                   0 34 34 34 38 1 0 9 15 39 2
                                                   0 9 9 28 40 2 0 69 9 28 70 1
                                                   0 41 9 42 1 0 41 28 51 6 0
                                                   47 15 9 9 47 47 47 48 1 0 41
                                                   47 79 1 0 28 28 77 3 0 15 24
                                                   9 10 25 1 0 47 9 78 1 0 9 9
                                                   30 3 0 28 28 47 47 56 7 0 47
                                                   15 9 9 47 47 47 47 89 2 0 13
                                                   15 15 16 1 0 13 15 59 2 0 34
                                                   7 34 58 1 0 34 34 36 2 0 13
                                                   7 7 57 2 0 34 9 34 37 4 0 13
                                                   7 7 7 7 60 2 0 9 9 28
                                                   71)))))
           '|lookupComplete|)) 
