
(SDEFUN |GBINTERN;virtualDegree;DpolNni;1|
        ((|p| |Dpol|) ($ |NonNegativeInteger|)) (SPADCALL |p| (QREFELT $ 11))) 

(PUT '|GBINTERN;virtualDegree;DpolNni;2| '|SPADreplace| '(XLAM (|p|) 0)) 

(SDEFUN |GBINTERN;virtualDegree;DpolNni;2|
        ((|p| |Dpol|) ($ |NonNegativeInteger|)) 0) 

(SDEFUN |GBINTERN;critpOrder;2RB;3|
        ((|cp1| |Record| (|:| |lcmfij| |Expon|)
          (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
          (|:| |polj| |Dpol|))
         (|cp2| |Record| (|:| |lcmfij| |Expon|)
          (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
          (|:| |polj| |Dpol|))
         ($ |Boolean|))
        (COND ((< (QVELT |cp1| 1) (QVELT |cp2| 1)) 'T)
              ((< (QVELT |cp2| 1) (QVELT |cp1| 1)) NIL)
              ('T (SPADCALL (QVELT |cp1| 0) (QVELT |cp2| 0) (QREFELT $ 14))))) 

(SDEFUN |GBINTERN;makeCrit;RDpolNniR;4|
        ((|sp1| |Record| (|:| |totdeg| (|NonNegativeInteger|))
          (|:| |pol| |Dpol|))
         (|p2| |Dpol|) (|totdeg2| |NonNegativeInteger|)
         ($ |Record| (|:| |lcmfij| |Expon|)
          (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
          (|:| |polj| |Dpol|)))
        (SPROG
         ((|tdeg| (|NonNegativeInteger|)) (|e2| (|Expon|)) (#1=#:G135 NIL)
          (|e1| (|Expon|)) (|deg| (|Expon|)) (|p1| (|Dpol|)))
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
                      (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                      (|Union| (QREFELT $ 7) #3="failed") #1#))
                    . #2#)
              (LETT |e2|
                    (PROG2
                        (LETT #1#
                              (SPADCALL |deg| (SPADCALL |p2| (QREFELT $ 17))
                                        (QREFELT $ 20))
                              . #2#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                      (|Union| (QREFELT $ 7) #3#) #1#))
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
              (EXIT (VECTOR |deg| |tdeg| |p1| |p2|))))) 

(SDEFUN |GBINTERN;gbasis;L2IL;5|
        ((|Pol| |List| |Dpol|) (|xx1| |Integer|) (|xx2| |Integer|)
         ($ |List| |Dpol|))
        (SPROG
         ((#1=#:G188 NIL) (|x| NIL) (#2=#:G187 NIL) (|xx| (|Integer|))
          (|redPols| (|List| |Dpol|))
          (|basPols|
           (|List|
            (|Record| (|:| |totdeg| (|NonNegativeInteger|))
                      (|:| |pol| |Dpol|))))
          (D
           (|List|
            #3=(|Record| (|:| |lcmfij| |Expon|)
                         (|:| |totdeg| (|NonNegativeInteger|))
                         (|:| |poli| |Dpol|) (|:| |polj| |Dpol|))))
          (D1 (|List| #3#)) (#4=#:G186 NIL) (#5=#:G185 NIL) (#6=#:G180 NIL)
          (|h| (|Dpol|)) (|s| (|Dpol|))
          (D0
           (|Record| (|:| |lcmfij| |Expon|)
                     (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                     (|:| |polj| |Dpol|)))
          (#7=#:G184 NIL) (#8=#:G183 NIL) (#9=#:G182 NIL) (#10=#:G181 NIL)
          (|toth| (|NonNegativeInteger|)) (|Pol1| (|List| |Dpol|)))
         (SEQ
          (LETT |Pol1|
                (SPADCALL (CONS #'|GBINTERN;gbasis;L2IL;5!0| $) |Pol|
                          (QREFELT $ 29))
                . #11=(|GBINTERN;gbasis;L2IL;5|))
          (LETT |basPols|
                (SPADCALL (SPADCALL (|SPADfirst| |Pol1|) (QREFELT $ 30))
                          (SPADCALL (|SPADfirst| |Pol1|) (QREFELT $ 12)) NIL
                          (QREFELT $ 32))
                . #11#)
          (LETT |Pol1| (CDR |Pol1|) . #11#) (LETT D NIL . #11#)
          (SEQ G190 (COND ((NULL (NULL (NULL |Pol1|))) (GO G191)))
               (SEQ
                (LETT |h| (SPADCALL (|SPADfirst| |Pol1|) (QREFELT $ 30))
                      . #11#)
                (LETT |Pol1| (CDR |Pol1|) . #11#)
                (LETT |toth| (SPADCALL |h| (QREFELT $ 12)) . #11#)
                (LETT D1
                      (PROGN
                       (LETT #10# NIL . #11#)
                       (SEQ (LETT |x| NIL . #11#) (LETT #9# |basPols| . #11#)
                            G190
                            (COND
                             ((OR (ATOM #9#)
                                  (PROGN (LETT |x| (CAR #9#) . #11#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #10#
                                    (CONS
                                     (SPADCALL |x| |h| |toth| (QREFELT $ 25))
                                     #10#)
                                    . #11#)))
                            (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                            (EXIT (NREVERSE #10#))))
                      . #11#)
                (LETT D
                      (SPADCALL
                       (SPADCALL (SPADCALL (ELT $ 16) D1 (QREFELT $ 35))
                                 (QREFELT $ 36))
                       (SPADCALL |h| D (QREFELT $ 37)) (QREFELT $ 38))
                      . #11#)
                (EXIT
                 (LETT |basPols| (SPADCALL |h| |toth| |basPols| (QREFELT $ 32))
                       . #11#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT D (SPADCALL (ELT $ 16) D (QREFELT $ 35)) . #11#)
          (LETT |xx| |xx2| . #11#)
          (LETT |redPols|
                (PROGN
                 (LETT #8# NIL . #11#)
                 (SEQ (LETT |x| NIL . #11#) (LETT #7# |basPols| . #11#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |x| (CAR #7#) . #11#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #8# (CONS (QCDR |x|) #8#) . #11#)))
                      (LETT #7# (CDR #7#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #11#)
          (SEQ
           (EXIT
            (SEQ G190 (COND ((NULL (NULL (NULL D))) (GO G191)))
                 (SEQ (LETT D0 (|SPADfirst| D) . #11#)
                      (LETT |s|
                            (SPADCALL (SPADCALL D0 (QREFELT $ 39))
                                      (QREFELT $ 30))
                            . #11#)
                      (LETT D (CDR D) . #11#)
                      (LETT |h|
                            (SPADCALL (SPADCALL |s| |redPols| (QREFELT $ 40))
                                      (QREFELT $ 30))
                            . #11#)
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
                             (EXIT (LETT |xx| 2 . #11#)))))
                          (EXIT " go to top of while ")))
                        ((SPADCALL (SPADCALL |h| (QREFELT $ 17))
                                   (|spadConstant| $ 44) (QREFELT $ 49))
                         (SEQ (LETT D NIL . #11#)
                              (COND
                               ((EQL |xx2| 1)
                                (SEQ
                                 (SPADCALL D0 |s| |h| (LENGTH |basPols|)
                                           (LENGTH D) |xx| (QREFELT $ 48))
                                 (EXIT (LETT |xx| 2 . #11#)))))
                              (LETT |basPols|
                                    (SPADCALL |h| 0 NIL (QREFELT $ 32)) . #11#)
                              (EXIT
                               (PROGN
                                (LETT #6# |$NoValue| . #11#)
                                (GO #12=#:G174)))))
                        ('T
                         (SEQ
                          (LETT D1
                                (PROGN
                                 (LETT #5# NIL . #11#)
                                 (SEQ (LETT |x| NIL . #11#)
                                      (LETT #4# |basPols| . #11#) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN
                                             (LETT |x| (CAR #4#) . #11#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #5#
                                              (CONS
                                               (SPADCALL |x| |h| (QVELT D0 1)
                                                         (QREFELT $ 25))
                                               #5#)
                                              . #11#)))
                                      (LETT #4# (CDR #4#) . #11#) (GO G190)
                                      G191 (EXIT (NREVERSE #5#))))
                                . #11#)
                          (LETT D
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (ELT $ 16) D1 (QREFELT $ 35))
                                  (QREFELT $ 36))
                                 (SPADCALL |h| D (QREFELT $ 37))
                                 (QREFELT $ 38))
                                . #11#)
                          (LETT |basPols|
                                (SPADCALL |h| (QVELT D0 1) |basPols|
                                          (QREFELT $ 32))
                                . #11#)
                          (LETT |redPols|
                                (SPADCALL |redPols| |h| (QREFELT $ 50)) . #11#)
                          (EXIT
                           (COND
                            ((EQL |xx2| 1)
                             (SEQ
                              (SPADCALL D0 |s| |h| (LENGTH |basPols|)
                                        (LENGTH D) |xx| (QREFELT $ 48))
                              (EXIT (LETT |xx| 2 . #11#)))))))))))
                 NIL (GO G190) G191 (EXIT NIL)))
           #12# (EXIT #6#))
          (LETT |Pol|
                (PROGN
                 (LETT #2# NIL . #11#)
                 (SEQ (LETT |x| NIL . #11#) (LETT #1# |basPols| . #11#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #11#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCDR |x|) #2#) . #11#)))
                      (LETT #1# (CDR #1#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #11#)
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
              (SPADCALL "    THE GROEBNER BASIS POLYNOMIALS"
                        (QREFELT $ 54))))))
          (EXIT |Pol|)))) 

(SDEFUN |GBINTERN;gbasis;L2IL;5!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 17)) (SPADCALL |z2| (QREFELT $ 17))
                  (QREFELT $ 26))) 

(SDEFUN |GBINTERN;critMonD1;Expon2L;6|
        ((|e| |Expon|)
         (D2 |List|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|)))
         ($ |List|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|))))
        (SPROG ((#1=#:G194 NIL) (|x| NIL) (#2=#:G193 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|GBINTERN;critMonD1;Expon2L;6|))
                 (SEQ (LETT |x| NIL . #3#) (LETT #1# D2 . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL (SPADCALL |e| (QVELT |x| 0) (QREFELT $ 57)))
                          (LETT #2# (CONS |x| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GBINTERN;critMTonD1;2L;7|
        ((D1 |List|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|)))
         ($ |List|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|))))
        (SPROG
         ((|r1|
           (|List|
            (|Record| (|:| |lcmfij| |Expon|)
                      (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                      (|:| |polj| |Dpol|))))
          (|e1| (|Expon|)) (|cT1| (|Boolean|)) (|s1| (|NonNegativeInteger|))
          (|f1|
           (|Record| (|:| |lcmfij| |Expon|)
                     (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                     (|:| |polj| |Dpol|))))
         (SEQ
          (COND ((NULL D1) NIL)
                (#1='T
                 (SEQ
                  (LETT |f1| (|SPADfirst| D1)
                        . #2=(|GBINTERN;critMTonD1;2L;7|))
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
                                                                    36)))))))))))))))))))) 

(SDEFUN |GBINTERN;critBonD;Dpol2L;8|
        ((|h| |Dpol|)
         (D |List|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|)))
         ($ |List|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|))))
        (SPROG ((#1=#:G208 NIL) (|x| NIL) (#2=#:G207 NIL) (|d| (|Expon|)))
               (SEQ
                (LETT |d| (SPADCALL |h| (QREFELT $ 17))
                      . #3=(|GBINTERN;critBonD;Dpol2L;8|))
                (EXIT
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |x| NIL . #3#) (LETT #1# D . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL |d| (QVELT |x| 0)
                                      (SPADCALL (QVELT |x| 2) (QREFELT $ 17))
                                      (SPADCALL (QVELT |x| 3) (QREFELT $ 17))
                                      (QREFELT $ 60)))
                           (LETT #2# (CONS |x| #2#) . #3#)))))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |GBINTERN;updatF;DpolNni2L;9|
        ((|h| |Dpol|) (|deg| |NonNegativeInteger|)
         (F |List|
          (|Record| (|:| |totdeg| (|NonNegativeInteger|)) (|:| |pol| |Dpol|)))
         ($ |List|
          (|Record| (|:| |totdeg| (|NonNegativeInteger|)) (|:| |pol| |Dpol|))))
        (SPROG ((#1=#:G215 NIL) (|f| NIL) (#2=#:G214 NIL) (|d| (|Expon|)))
               (SEQ
                (LETT |d| (SPADCALL |h| (QREFELT $ 17))
                      . #3=(|GBINTERN;updatF;DpolNni2L;9|))
                (EXIT
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL . #3#)
                   (SEQ (LETT |f| NIL . #3#) (LETT #1# F . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL
                             (SPADCALL |d| (SPADCALL (QCDR |f|) (QREFELT $ 17))
                                       (QREFELT $ 57)))
                            (LETT #2# (CONS |f| #2#) . #3#)))))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (CONS |deg| |h|) (QREFELT $ 61)))))) 

(SDEFUN |GBINTERN;updatD;3L;10|
        ((D1 |List|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|)))
         (D2 |List|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|)))
         ($ |List|
          (|Record| (|:| |lcmfij| |Expon|)
                    (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                    (|:| |polj| |Dpol|))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |lcmfij| |Expon|)
                      (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
                      (|:| |polj| |Dpol|))))
          (#1=#:G232 NIL) (|e| NIL) (#2=#:G231 NIL)
          (|dl2|
           #3=(|Record| (|:| |lcmfij| |Expon|)
                        (|:| |totdeg| (|NonNegativeInteger|))
                        (|:| |poli| |Dpol|) (|:| |polj| |Dpol|)))
          (|dl1| #3#))
         (SEQ
          (COND ((NULL D1) D2) ((NULL D2) D1)
                ('T
                 (SEQ (LETT |res| NIL . #4=(|GBINTERN;updatD;3L;10|))
                      (SEQ G190
                           (COND
                            ((NULL
                              (COND ((NULL D1) NIL) ('T (NULL (NULL D2)))))
                             (GO G191)))
                           (SEQ (LETT |dl1| (|SPADfirst| D1) . #4#)
                                (LETT |dl2| (|SPADfirst| D2) . #4#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |dl1| |dl2| (QREFELT $ 16))
                                   (SEQ (LETT |res| (CONS |dl1| |res|) . #4#)
                                        (EXIT (LETT D1 (CDR D1) . #4#))))
                                  ('T
                                   (SEQ (LETT |res| (CONS |dl2| |res|) . #4#)
                                        (EXIT (LETT D2 (CDR D2) . #4#)))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (SEQ (LETT |e| NIL . #4#) (LETT #2# D1 . #4#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |e| (CAR #2#) . #4#) NIL))
                             (GO G191)))
                           (SEQ (EXIT (LETT |res| (CONS |e| |res|) . #4#)))
                           (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (SEQ (LETT |e| NIL . #4#) (LETT #1# D2 . #4#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |e| (CAR #1#) . #4#) NIL))
                             (GO G191)))
                           (SEQ (EXIT (LETT |res| (CONS |e| |res|) . #4#)))
                           (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (NREVERSE |res|)))))))) 

(SDEFUN |GBINTERN;gcdCo|
        ((|c1| |Dom|) (|c2| |Dom|)
         ($ |Record| (|:| |co1| |Dom|) (|:| |co2| |Dom|)))
        (SPROG ((#1=#:G235 NIL) (|d| (|Dom|)))
               (SEQ
                (LETT |d| (SPADCALL |c1| |c2| (QREFELT $ 62))
                      . #2=(|GBINTERN;gcdCo|))
                (EXIT
                 (CONS
                  (PROG2 (LETT #1# (SPADCALL |c1| |d| (QREFELT $ 63)) . #2#)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                    (|Union| (QREFELT $ 6) #3="failed") #1#))
                  (PROG2 (LETT #1# (SPADCALL |c2| |d| (QREFELT $ 63)) . #2#)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                    (|Union| (QREFELT $ 6) #3#) #1#))))))) 

(SDEFUN |GBINTERN;sPol;RDpol;12|
        ((|p| |Record| (|:| |lcmfij| |Expon|)
          (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
          (|:| |polj| |Dpol|))
         ($ |Dpol|))
        (SPROG
         ((#1=#:G241 NIL) (|cc| (|Record| (|:| |co1| |Dom|) (|:| |co2| |Dom|)))
          (|fj| (|Dpol|)) (|fi| (|Dpol|)) (|Tij| (|Expon|)))
         (SEQ (LETT |Tij| (QVELT |p| 0) . #2=(|GBINTERN;sPol;RDpol;12|))
              (LETT |fi| (QVELT |p| 2) . #2#) (LETT |fj| (QVELT |p| 3) . #2#)
              (LETT |cc|
                    (|GBINTERN;gcdCo| (SPADCALL |fi| (QREFELT $ 64))
                     (SPADCALL |fj| (QREFELT $ 64)) $)
                    . #2#)
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |fi| (QREFELT $ 65))
                          (SPADCALL (QCDR |cc|)
                                    (PROG2
                                        (LETT #1#
                                              (SPADCALL |Tij|
                                                        (SPADCALL |fi|
                                                                  (QREFELT $
                                                                           17))
                                                        (QREFELT $ 20))
                                              . #2#)
                                        (QCDR #1#)
                                      (|check_union2| (QEQCAR #1# 0)
                                                      (QREFELT $ 7)
                                                      (|Union| (QREFELT $ 7)
                                                               #3="failed")
                                                      #1#))
                                    (QREFELT $ 23))
                          (QREFELT $ 66))
                (SPADCALL (SPADCALL |fj| (QREFELT $ 65))
                          (SPADCALL (QCAR |cc|)
                                    (PROG2
                                        (LETT #1#
                                              (SPADCALL |Tij|
                                                        (SPADCALL |fj|
                                                                  (QREFELT $
                                                                           17))
                                                        (QREFELT $ 20))
                                              . #2#)
                                        (QCDR #1#)
                                      (|check_union2| (QEQCAR #1# 0)
                                                      (QREFELT $ 7)
                                                      (|Union| (QREFELT $ 7)
                                                               #3#)
                                                      #1#))
                                    (QREFELT $ 23))
                          (QREFELT $ 66))
                (QREFELT $ 67)))))) 

(SDEFUN |GBINTERN;redPo;DpolLR;13|
        ((|s| |Dpol|) (F |List| |Dpol|)
         ($ |Record| (|:| |poly| |Dpol|) (|:| |mult| |Dom|)))
        (SPROG
         ((|m| (|Dom|)) (|cc| (|Record| (|:| |co1| |Dom|) (|:| |co2| |Dom|)))
          (|e| (|Union| |Expon| "failed")) (|s1| (|Expon|)) (|f1| (|Dpol|))
          (|Fh| (|List| |Dpol|)))
         (SEQ
          (LETT |m| (|spadConstant| $ 21) . #1=(|GBINTERN;redPo;DpolLR;13|))
          (LETT |Fh| F . #1#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |s| (|spadConstant| $ 45) (QREFELT $ 46)) NIL)
                   ('T (NULL (NULL F)))))
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
                              (|GBINTERN;gcdCo| (SPADCALL |f1| (QREFELT $ 64))
                               (SPADCALL |s| (QREFELT $ 64)) $)
                              . #1#)
                        (LETT |s|
                              (SPADCALL
                               (SPADCALL (QCAR |cc|)
                                         (SPADCALL |s| (QREFELT $ 65))
                                         (QREFELT $ 68))
                               (SPADCALL
                                (SPADCALL (QCDR |cc|) (QCDR |e|)
                                          (QREFELT $ 23))
                                (SPADCALL |f1| (QREFELT $ 65)) (QREFELT $ 66))
                               (QREFELT $ 67))
                              . #1#)
                        (LETT |m| (SPADCALL |m| (QCAR |cc|) (QREFELT $ 69))
                              . #1#)
                        (EXIT (LETT F |Fh| . #1#))))
                      ('T (LETT F (CDR F) . #1#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |s| |m|))))) 

(SDEFUN |GBINTERN;redPol;DpolLDpol;14|
        ((|s| |Dpol|) (F |List| |Dpol|) ($ |Dpol|))
        (SPADCALL (QCAR (SPADCALL |s| F (QREFELT $ 71))) F (QREFELT $ 72))) 

(SDEFUN |GBINTERN;critT;RB;15|
        ((|p| |Record| (|:| |lcmfij| |Expon|)
          (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
          (|:| |polj| |Dpol|))
         ($ |Boolean|))
        (SPADCALL (QVELT |p| 0)
                  (SPADCALL (SPADCALL (QVELT |p| 2) (QREFELT $ 17))
                            (SPADCALL (QVELT |p| 3) (QREFELT $ 17))
                            (QREFELT $ 73))
                  (QREFELT $ 49))) 

(SDEFUN |GBINTERN;critM;2ExponB;16|
        ((|e1| |Expon|) (|e2| |Expon|) ($ |Boolean|))
        (SPROG ((|en| (|Union| |Expon| "failed")))
               (QEQCAR
                (LETT |en| (SPADCALL |e2| |e1| (QREFELT $ 20))
                      |GBINTERN;critM;2ExponB;16|)
                0))) 

(SDEFUN |GBINTERN;critB;4ExponB;17|
        ((|eh| |Expon|) (|eik| |Expon|) (|ei| |Expon|) (|ek| |Expon|)
         ($ |Boolean|))
        (COND
         ((SPADCALL |eh| |eik| (QREFELT $ 57))
          (COND
           ((SPADCALL |eik| (SPADCALL |eh| |ei| (QREFELT $ 18)) (QREFELT $ 74))
            (SPADCALL |eik| (SPADCALL |eh| |ek| (QREFELT $ 18))
                      (QREFELT $ 74)))
           (#1='T NIL)))
         (#1# NIL))) 

(SDEFUN |GBINTERN;hMonic;2Dpol;18| ((|p| |Dpol|) ($ |Dpol|))
        (COND ((SPADCALL |p| (|spadConstant| $ 45) (QREFELT $ 46)) |p|)
              ('T (SPADCALL |p| (QREFELT $ 75))))) 

(SDEFUN |GBINTERN;credPol;DpolLDpol;19|
        ((|h| |Dpol|) (F |List| |Dpol|) ($ |Dpol|))
        (SPROG
         ((|h0| (|Dpol|))
          (|hred| (|Record| (|:| |poly| |Dpol|) (|:| |mult| |Dom|))))
         (SEQ
          (COND ((NULL F) |h|)
                ('T
                 (SEQ
                  (LETT |h0|
                        (SPADCALL (SPADCALL |h| (QREFELT $ 64))
                                  (SPADCALL |h| (QREFELT $ 17)) (QREFELT $ 23))
                        . #1=(|GBINTERN;credPol;DpolLDpol;19|))
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL
                           (LETT |h| (SPADCALL |h| (QREFELT $ 65)) . #1#)
                           (|spadConstant| $ 45) (QREFELT $ 76)))
                         (GO G191)))
                       (SEQ (LETT |hred| (SPADCALL |h| F (QREFELT $ 71)) . #1#)
                            (LETT |h| (QCAR |hred|) . #1#)
                            (EXIT
                             (LETT |h0|
                                   (SPADCALL
                                    (SPADCALL (QCDR |hred|) |h0|
                                              (QREFELT $ 68))
                                    (SPADCALL (SPADCALL |h| (QREFELT $ 64))
                                              (SPADCALL |h| (QREFELT $ 17))
                                              (QREFELT $ 23))
                                    (QREFELT $ 77))
                                   . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |h0|))))))) 

(SDEFUN |GBINTERN;minGbasis;2L;20| ((F |List| |Dpol|) ($ |List| |Dpol|))
        (SPROG ((|newbas| (|List| |Dpol|)))
               (SEQ
                (COND ((NULL F) NIL)
                      ('T
                       (SEQ
                        (LETT |newbas| (SPADCALL (CDR F) (QREFELT $ 78))
                              |GBINTERN;minGbasis;2L;20|)
                        (EXIT
                         (CONS
                          (SPADCALL
                           (SPADCALL (|SPADfirst| F) |newbas| (QREFELT $ 72))
                           (QREFELT $ 30))
                          |newbas|)))))))) 

(SDEFUN |GBINTERN;lepol;DpolI;21| ((|p1| |Dpol|) ($ |Integer|))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| 0 . #1=(|GBINTERN;lepol;DpolI;21|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p1| (|spadConstant| $ 45)
                                      (QREFELT $ 76)))
                           (GO G191)))
                         (SEQ (LETT |n| (+ |n| 1) . #1#)
                              (EXIT
                               (LETT |p1| (SPADCALL |p1| (QREFELT $ 65))
                                     . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |n|)))) 

(SDEFUN |GBINTERN;prinb;IV;22| ((|n| |Integer|) ($ |Void|))
        (SPROG ((#1=#:G284 NIL) (|x| NIL))
               (SEQ (LETT |x| 1 . #2=(|GBINTERN;prinb;IV;22|))
                    (LETT #1# |n| . #2#) G190
                    (COND ((|greater_SI| |x| #1#) (GO G191)))
                    (SEQ (EXIT (SPADCALL "    " (QREFELT $ 54))))
                    (LETT |x| (|inc_SI| |x|) . #2#) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |GBINTERN;prinshINFO;DpolV;23| ((|h| |Dpol|) ($ |Void|))
        (SEQ (SPADCALL 2 (QREFELT $ 80))
             (SPADCALL " reduced Critpair - Polynom :" (QREFELT $ 54))
             (SPADCALL 2 (QREFELT $ 80))
             (SPADCALL (SPADCALL |h| (QREFELT $ 81)) (QREFELT $ 82))
             (EXIT (SPADCALL 2 (QREFELT $ 80))))) 

(SDEFUN |GBINTERN;prindINFO;R2Dpol4I;24|
        ((|cp| |Record| (|:| |lcmfij| |Expon|)
          (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
          (|:| |polj| |Dpol|))
         (|ps| |Dpol|) (|ph| |Dpol|) (|i1| |Integer|) (|i2| |Integer|)
         (|n| |Integer|) ($ |Integer|))
        (SPROG
         ((|ll|
           (|List|
            (|Record| (|:| |ci| |Dpol|) (|:| |tci| (|Integer|))
                      (|:| |cj| |Dpol|) (|:| |tcj| (|Integer|))
                      (|:| |c| |Dpol|) (|:| |tc| (|Integer|)) (|:| |rc| |Dpol|)
                      (|:| |trc| (|Integer|)) (|:| |tF| (|Integer|))
                      (|:| |tD| (|Integer|)))))
          (|a| (|Dom|)) (|cpj| (|Dpol|)) (|cpi| (|Dpol|)))
         (SEQ
          (LETT |cpi| (QVELT |cp| 2) . #1=(|GBINTERN;prindINFO;R2Dpol4I;24|))
          (LETT |cpj| (QVELT |cp| 3) . #1#)
          (COND
           ((EQL |n| 1)
            (SEQ (SPADCALL 1 (QREFELT $ 80))
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
                 (SPADCALL 4 (QREFELT $ 80)) (EXIT (LETT |n| 2 . #1#)))))
          (SPADCALL 1 (QREFELT $ 80)) (LETT |a| (|spadConstant| $ 21) . #1#)
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
                        (SPADCALL |cpi| (QREFELT $ 79))
                        (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |cpj| (QREFELT $ 79)) |ps| 0 |ph| 0 |i1|
                        |i2|))
                      . #1#)
                (SPADCALL (SPADCALL |ll| (QREFELT $ 85)) (QREFELT $ 82))
                (SPADCALL 1 (QREFELT $ 80)) (EXIT |n|)))
              (#2='T
               (SEQ
                (LETT |ll|
                      (LIST
                       (VECTOR
                        (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |cpi| (QREFELT $ 79))
                        (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |cpj| (QREFELT $ 79))
                        (SPADCALL |a| (SPADCALL |ps| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |ps| (QREFELT $ 79)) |ph| 0 |i1| |i2|))
                      . #1#)
                (SPADCALL (SPADCALL |ll| (QREFELT $ 85)) (QREFELT $ 82))
                (SPADCALL 1 (QREFELT $ 80)) (EXIT |n|)))))
            (#2#
             (SEQ
              (LETT |ll|
                    (LIST
                     (VECTOR
                      (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 17))
                                (QREFELT $ 23))
                      (SPADCALL |cpi| (QREFELT $ 79))
                      (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 17))
                                (QREFELT $ 23))
                      (SPADCALL |cpj| (QREFELT $ 79))
                      (SPADCALL |a| (SPADCALL |ps| (QREFELT $ 17))
                                (QREFELT $ 23))
                      (SPADCALL |ps| (QREFELT $ 79))
                      (SPADCALL |a| (SPADCALL |ph| (QREFELT $ 17))
                                (QREFELT $ 23))
                      (SPADCALL |ph| (QREFELT $ 79)) |i1| |i2|))
                    . #1#)
              (SPADCALL (SPADCALL |ll| (QREFELT $ 85)) (QREFELT $ 82))
              (SPADCALL 1 (QREFELT $ 80)) (EXIT |n|)))))))) 

(SDEFUN |GBINTERN;prinpolINFO;LV;25| ((|pl| |List| |Dpol|) ($ |Void|))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (LENGTH |pl|) |GBINTERN;prinpolINFO;LV;25|)
                    (SPADCALL 1 (QREFELT $ 80))
                    (EXIT
                     (COND
                      ((EQL |n| 1)
                       (SEQ
                        (SPADCALL "  There is 1  Groebner Basis Polynomial "
                                  (QREFELT $ 54))
                        (EXIT (SPADCALL 2 (QREFELT $ 80)))))
                      ('T
                       (SEQ (SPADCALL "  There are " (QREFELT $ 54))
                            (SPADCALL 1 (QREFELT $ 80))
                            (SPADCALL (SPADCALL |n| (QREFELT $ 86))
                                      (QREFELT $ 82))
                            (SPADCALL 1 (QREFELT $ 80))
                            (SPADCALL "  Groebner Basis Polynomials. "
                                      (QREFELT $ 54))
                            (EXIT (SPADCALL 2 (QREFELT $ 80)))))))))) 

(SDEFUN |GBINTERN;fprindINFO;R2Dpol5I;26|
        ((|cp| |Record| (|:| |lcmfij| |Expon|)
          (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
          (|:| |polj| |Dpol|))
         (|ps| |Dpol|) (|ph| |Dpol|) (|i1| |Integer|) (|i2| |Integer|)
         (|i3| |Integer|) (|n| |Integer|) ($ |Integer|))
        (SPROG
         ((|ll|
           (|List|
            (|Record| (|:| |ci| |Dpol|) (|:| |tci| (|Integer|))
                      (|:| |cj| |Dpol|) (|:| |tcj| (|Integer|))
                      (|:| |c| |Dpol|) (|:| |tc| (|Integer|)) (|:| |rc| |Dpol|)
                      (|:| |trc| (|Integer|)) (|:| |tF| (|Integer|))
                      (|:| |tDD| (|Integer|)) (|:| |tDF| (|Integer|)))))
          (|a| (|Dom|)) (|cpj| (|Dpol|)) (|cpi| (|Dpol|)))
         (SEQ
          (LETT |cpi| (QVELT |cp| 2) . #1=(|GBINTERN;fprindINFO;R2Dpol5I;26|))
          (LETT |cpj| (QVELT |cp| 3) . #1#)
          (COND
           ((EQL |n| 1)
            (SEQ (SPADCALL 1 (QREFELT $ 80))
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
                 (SPADCALL 4 (QREFELT $ 80)) (EXIT (LETT |n| 2 . #1#)))))
          (SPADCALL 1 (QREFELT $ 80)) (LETT |a| (|spadConstant| $ 21) . #1#)
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
                        (SPADCALL |cpi| (QREFELT $ 79))
                        (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |cpj| (QREFELT $ 79)) |ps| 0 |ph| 0 |i1| |i2|
                        |i3|))
                      . #1#)
                (SPADCALL (SPADCALL |ll| (QREFELT $ 89)) (QREFELT $ 82))
                (SPADCALL 1 (QREFELT $ 80)) (EXIT |n|)))
              (#2='T
               (SEQ
                (LETT |ll|
                      (LIST
                       (VECTOR
                        (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |cpi| (QREFELT $ 79))
                        (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |cpj| (QREFELT $ 79))
                        (SPADCALL |a| (SPADCALL |ps| (QREFELT $ 17))
                                  (QREFELT $ 23))
                        (SPADCALL |ps| (QREFELT $ 79)) |ph| 0 |i1| |i2| |i3|))
                      . #1#)
                (SPADCALL (SPADCALL |ll| (QREFELT $ 89)) (QREFELT $ 82))
                (SPADCALL 1 (QREFELT $ 80)) (EXIT |n|)))))
            (#2#
             (SEQ
              (LETT |ll|
                    (LIST
                     (VECTOR
                      (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 17))
                                (QREFELT $ 23))
                      (SPADCALL |cpi| (QREFELT $ 79))
                      (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 17))
                                (QREFELT $ 23))
                      (SPADCALL |cpj| (QREFELT $ 79))
                      (SPADCALL |a| (SPADCALL |ps| (QREFELT $ 17))
                                (QREFELT $ 23))
                      (SPADCALL |ps| (QREFELT $ 79))
                      (SPADCALL |a| (SPADCALL |ph| (QREFELT $ 17))
                                (QREFELT $ 23))
                      (SPADCALL |ph| (QREFELT $ 79)) |i1| |i2| |i3|))
                    . #1#)
              (SPADCALL (SPADCALL |ll| (QREFELT $ 89)) (QREFELT $ 82))
              (SPADCALL 1 (QREFELT $ 80)) (EXIT |n|)))))))) 

(DECLAIM (NOTINLINE |GroebnerInternalPackage;|)) 

(DEFUN |GroebnerInternalPackage| (&REST #1=#:G311)
  (SPROG NIL
         (PROG (#2=#:G312)
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
                  (HREM |$ConstructorCache| '|GroebnerInternalPackage|)))))))))) 

(DEFUN |GroebnerInternalPackage;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|GroebnerInternalPackage|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|GroebnerInternalPackage| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 91) . #1#)
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
                            (LIST '(|NonNegativeInteger|) (|devaluate| |#4|))))
      (QSETREFV $ 12
                (CONS (|dispatchFunction| |GBINTERN;virtualDegree;DpolNni;1|)
                      $)))
     ('T
      (QSETREFV $ 12
                (CONS (|dispatchFunction| |GBINTERN;virtualDegree;DpolNni;2|)
                      $))))
    $))) 

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
              |GBINTERN;critT;RB;15| |GBINTERN;critB;4ExponB;17|
              (106 . |concat!|) (112 . |gcd|) (118 . |exquo|)
              (124 . |leadingCoefficient|) (129 . |reductum|) (134 . *)
              (140 . -) (146 . *) (152 . *)
              (|Record| (|:| |poly| 9) (|:| |mult| 6))
              |GBINTERN;redPo;DpolLR;13| |GBINTERN;credPol;DpolLDpol;19|
              (158 . +) (164 . ~=) (170 . |primitivePart|) (175 . ~=) (181 . +)
              |GBINTERN;minGbasis;2L;20| |GBINTERN;lepol;DpolI;21|
              |GBINTERN;prinb;IV;22| (187 . |coerce|) (192 . |print|)
              (|Record| (|:| |ci| 9) (|:| |tci| 47) (|:| |cj| 9) (|:| |tcj| 47)
                        (|:| |c| 9) (|:| |tc| 47) (|:| |rc| 9) (|:| |trc| 47)
                        (|:| |tF| 47) (|:| |tD| 47))
              (|List| 83) (197 . |coerce|) (202 . |coerce|)
              (|Record| (|:| |ci| 9) (|:| |tci| 47) (|:| |cj| 9) (|:| |tcj| 47)
                        (|:| |c| 9) (|:| |tc| 47) (|:| |rc| 9) (|:| |trc| 47)
                        (|:| |tF| 47) (|:| |tDD| 47) (|:| |tDF| 47))
              (|List| 87) (207 . |coerce|) |GBINTERN;fprindINFO;R2Dpol5I;26|)
           '#(|virtualDegree| 212 |updatF| 217 |updatD| 224 |sPol| 230 |redPol|
              235 |redPo| 241 |prinshINFO| 247 |prinpolINFO| 252 |prindINFO|
              257 |prinb| 267 |minGbasis| 272 |makeCrit| 277 |lepol| 284
              |hMonic| 289 |gbasis| 294 |fprindINFO| 301 |critpOrder| 312
              |critT| 318 |critMonD1| 323 |critMTonD1| 329 |critM| 334
              |critBonD| 340 |critB| 346 |credPol| 354)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 90
                                                 '(1 9 10 0 11 1 0 10 9 12 2 7
                                                   13 0 0 14 1 9 7 0 17 2 7 0 0
                                                   0 18 2 7 19 0 0 20 0 6 0 21
                                                   0 9 0 22 2 9 0 6 7 23 2 7 13
                                                   0 0 26 2 28 0 27 0 29 2 34 0
                                                   33 0 35 0 6 0 43 0 7 0 44 0
                                                   9 0 45 2 9 13 0 0 46 2 7 13
                                                   0 0 49 2 28 0 0 9 50 1 53 41
                                                   52 54 2 47 13 0 0 55 2 31 0
                                                   0 24 61 2 6 0 0 0 62 2 6 19
                                                   0 0 63 1 9 6 0 64 1 9 0 0 65
                                                   2 9 0 0 0 66 2 9 0 0 0 67 2
                                                   9 0 6 0 68 2 6 0 0 0 69 2 7
                                                   0 0 0 73 2 7 13 0 0 74 1 9 0
                                                   0 75 2 9 13 0 0 76 2 9 0 0 0
                                                   77 1 9 53 0 81 1 53 41 0 82
                                                   1 84 53 0 85 1 47 53 0 86 1
                                                   88 53 0 89 1 0 10 9 12 3 0
                                                   31 9 10 31 32 2 0 34 34 34
                                                   38 1 0 9 15 39 2 0 9 9 28 40
                                                   2 0 70 9 28 71 1 0 41 9 42 1
                                                   0 41 28 51 6 0 47 15 9 9 47
                                                   47 47 48 1 0 41 47 80 1 0 28
                                                   28 78 3 0 15 24 9 10 25 1 0
                                                   47 9 79 1 0 9 9 30 3 0 28 28
                                                   47 47 56 7 0 47 15 9 9 47 47
                                                   47 47 90 2 0 13 15 15 16 1 0
                                                   13 15 59 2 0 34 7 34 58 1 0
                                                   34 34 36 2 0 13 7 7 57 2 0
                                                   34 9 34 37 4 0 13 7 7 7 7 60
                                                   2 0 9 9 28 72)))))
           '|lookupComplete|)) 
