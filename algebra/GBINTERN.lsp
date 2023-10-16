
(SDEFUN |GBINTERN;virtualDegree;DpolNni;1|
        ((|p| |Dpol|) ($ |NonNegativeInteger|)) (SPADCALL |p| (QREFELT $ 10))) 

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
              ('T (SPADCALL (QVELT |cp1| 0) (QVELT |cp2| 0) (QREFELT $ 13))))) 

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
                    (SPADCALL (SPADCALL |p1| (QREFELT $ 16))
                              (SPADCALL |p2| (QREFELT $ 16)) (QREFELT $ 17))
                    . #2#)
              (LETT |e1|
                    (PROG2
                        (LETT #1#
                              (SPADCALL |deg| (SPADCALL |p1| (QREFELT $ 16))
                                        (QREFELT $ 19))
                              . #2#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                      (|Union| (QREFELT $ 7) #3="failed") #1#))
                    . #2#)
              (LETT |e2|
                    (PROG2
                        (LETT #1#
                              (SPADCALL |deg| (SPADCALL |p2| (QREFELT $ 16))
                                        (QREFELT $ 19))
                              . #2#)
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                      (|Union| (QREFELT $ 7) #3#) #1#))
                    . #2#)
              (LETT |tdeg|
                    (MAX
                     (+ (QCAR |sp1|)
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 20) |e1| (QREFELT $ 22))
                         (QREFELT $ 11)))
                     (+ |totdeg2|
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 20) |e2| (QREFELT $ 22))
                         (QREFELT $ 11))))
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
                          (QREFELT $ 28))
                . #11=(|GBINTERN;gbasis;L2IL;5|))
          (LETT |basPols|
                (SPADCALL (SPADCALL (|SPADfirst| |Pol1|) (QREFELT $ 29))
                          (SPADCALL (|SPADfirst| |Pol1|) (QREFELT $ 11)) NIL
                          (QREFELT $ 31))
                . #11#)
          (LETT |Pol1| (CDR |Pol1|) . #11#) (LETT D NIL . #11#)
          (SEQ G190 (COND ((NULL (NULL (NULL |Pol1|))) (GO G191)))
               (SEQ
                (LETT |h| (SPADCALL (|SPADfirst| |Pol1|) (QREFELT $ 29))
                      . #11#)
                (LETT |Pol1| (CDR |Pol1|) . #11#)
                (LETT |toth| (SPADCALL |h| (QREFELT $ 11)) . #11#)
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
                                     (SPADCALL |x| |h| |toth| (QREFELT $ 24))
                                     #10#)
                                    . #11#)))
                            (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                            (EXIT (NREVERSE #10#))))
                      . #11#)
                (LETT D
                      (SPADCALL
                       (SPADCALL (SPADCALL (ELT $ 15) D1 (QREFELT $ 34))
                                 (QREFELT $ 35))
                       (SPADCALL |h| D (QREFELT $ 36)) (QREFELT $ 37))
                      . #11#)
                (EXIT
                 (LETT |basPols| (SPADCALL |h| |toth| |basPols| (QREFELT $ 31))
                       . #11#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT D (SPADCALL (ELT $ 15) D (QREFELT $ 34)) . #11#)
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
                            (SPADCALL (SPADCALL D0 (QREFELT $ 38))
                                      (QREFELT $ 29))
                            . #11#)
                      (LETT D (CDR D) . #11#)
                      (LETT |h|
                            (SPADCALL (SPADCALL |s| |redPols| (QREFELT $ 39))
                                      (QREFELT $ 29))
                            . #11#)
                      (COND ((EQL |xx1| 1) (SPADCALL |h| (QREFELT $ 41))))
                      (EXIT
                       (COND
                        ((SPADCALL |h| (|spadConstant| $ 44) (QREFELT $ 45))
                         (SEQ
                          (COND
                           ((EQL |xx2| 1)
                            (SEQ
                             (SPADCALL D0 |s| |h| (LENGTH |basPols|) (LENGTH D)
                                       |xx| (QREFELT $ 47))
                             (EXIT (LETT |xx| 2 . #11#)))))
                          (EXIT " go to top of while ")))
                        ((SPADCALL (SPADCALL |h| (QREFELT $ 16))
                                   (|spadConstant| $ 43) (QREFELT $ 48))
                         (SEQ (LETT D NIL . #11#)
                              (COND
                               ((EQL |xx2| 1)
                                (SEQ
                                 (SPADCALL D0 |s| |h| (LENGTH |basPols|)
                                           (LENGTH D) |xx| (QREFELT $ 47))
                                 (EXIT (LETT |xx| 2 . #11#)))))
                              (LETT |basPols|
                                    (SPADCALL |h| 0 NIL (QREFELT $ 31)) . #11#)
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
                                                         (QREFELT $ 24))
                                               #5#)
                                              . #11#)))
                                      (LETT #4# (CDR #4#) . #11#) (GO G190)
                                      G191 (EXIT (NREVERSE #5#))))
                                . #11#)
                          (LETT D
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (ELT $ 15) D1 (QREFELT $ 34))
                                  (QREFELT $ 35))
                                 (SPADCALL |h| D (QREFELT $ 36))
                                 (QREFELT $ 37))
                                . #11#)
                          (LETT |basPols|
                                (SPADCALL |h| (QVELT D0 1) |basPols|
                                          (QREFELT $ 31))
                                . #11#)
                          (LETT |redPols|
                                (SPADCALL |redPols| |h| (QREFELT $ 49)) . #11#)
                          (EXIT
                           (COND
                            ((EQL |xx2| 1)
                             (SEQ
                              (SPADCALL D0 |s| |h| (LENGTH |basPols|)
                                        (LENGTH D) |xx| (QREFELT $ 47))
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
            (SEQ (SPADCALL |Pol| (QREFELT $ 50))
                 (EXIT
                  (SPADCALL "    THE GROEBNER BASIS POLYNOMIALS"
                            (QREFELT $ 53))))))
          (COND
           ((EQL |xx1| 1)
            (COND
             ((SPADCALL |xx2| 1 (QREFELT $ 54))
              (SPADCALL "    THE GROEBNER BASIS POLYNOMIALS"
                        (QREFELT $ 53))))))
          (EXIT |Pol|)))) 

(SDEFUN |GBINTERN;gbasis;L2IL;5!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 16)) (SPADCALL |z2| (QREFELT $ 16))
                  (QREFELT $ 25))) 

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
                         ((NULL (SPADCALL |e| (QVELT |x| 0) (QREFELT $ 56)))
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
                  (LETT |cT1| (SPADCALL |f1| (QREFELT $ 58)) . #2#)
                  (COND ((EQL |s1| 1) (COND (|cT1| (EXIT NIL)))))
                  (EXIT
                   (COND ((EQL |s1| 1) D1)
                         (#1#
                          (SEQ (LETT |e1| (QVELT |f1| 0) . #2#)
                               (LETT |r1| (CDR D1) . #2#)
                               (EXIT
                                (COND
                                 ((SPADCALL |e1| (QVELT (|SPADfirst| |r1|) 0)
                                            (QREFELT $ 48))
                                  (COND
                                   (|cT1|
                                    (SPADCALL (CONS |f1| (CDR |r1|))
                                              (QREFELT $ 35)))
                                   (#1# (SPADCALL |r1| (QREFELT $ 35)))))
                                 (#1#
                                  (SEQ
                                   (LETT D1 (SPADCALL |e1| |r1| (QREFELT $ 57))
                                         . #2#)
                                   (EXIT
                                    (COND (|cT1| (SPADCALL D1 (QREFELT $ 35)))
                                          (#1#
                                           (CONS |f1|
                                                 (SPADCALL D1
                                                           (QREFELT $
                                                                    35)))))))))))))))))))) 

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
                (LETT |d| (SPADCALL |h| (QREFELT $ 16))
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
                                      (SPADCALL (QVELT |x| 2) (QREFELT $ 16))
                                      (SPADCALL (QVELT |x| 3) (QREFELT $ 16))
                                      (QREFELT $ 59)))
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
                (LETT |d| (SPADCALL |h| (QREFELT $ 16))
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
                             (SPADCALL |d| (SPADCALL (QCDR |f|) (QREFELT $ 16))
                                       (QREFELT $ 56)))
                            (LETT #2# (CONS |f| #2#) . #3#)))))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (CONS |deg| |h|) (QREFELT $ 60)))))) 

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
                                  ((SPADCALL |dl1| |dl2| (QREFELT $ 15))
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
                (LETT |d| (SPADCALL |c1| |c2| (QREFELT $ 61))
                      . #2=(|GBINTERN;gcdCo|))
                (EXIT
                 (CONS
                  (PROG2 (LETT #1# (SPADCALL |c1| |d| (QREFELT $ 62)) . #2#)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                    (|Union| (QREFELT $ 6) #3="failed") #1#))
                  (PROG2 (LETT #1# (SPADCALL |c2| |d| (QREFELT $ 62)) . #2#)
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
                                                                  (QREFELT $
                                                                           16))
                                                        (QREFELT $ 19))
                                              . #2#)
                                        (QCDR #1#)
                                      (|check_union2| (QEQCAR #1# 0)
                                                      (QREFELT $ 7)
                                                      (|Union| (QREFELT $ 7)
                                                               #3="failed")
                                                      #1#))
                                    (QREFELT $ 22))
                          (QREFELT $ 65))
                (SPADCALL (SPADCALL |fj| (QREFELT $ 64))
                          (SPADCALL (QCAR |cc|)
                                    (PROG2
                                        (LETT #1#
                                              (SPADCALL |Tij|
                                                        (SPADCALL |fj|
                                                                  (QREFELT $
                                                                           16))
                                                        (QREFELT $ 19))
                                              . #2#)
                                        (QCDR #1#)
                                      (|check_union2| (QEQCAR #1# 0)
                                                      (QREFELT $ 7)
                                                      (|Union| (QREFELT $ 7)
                                                               #3#)
                                                      #1#))
                                    (QREFELT $ 22))
                          (QREFELT $ 65))
                (QREFELT $ 66)))))) 

(SDEFUN |GBINTERN;redPo;DpolLR;13|
        ((|s| |Dpol|) (F |List| |Dpol|)
         ($ |Record| (|:| |poly| |Dpol|) (|:| |mult| |Dom|)))
        (SPROG
         ((|m| (|Dom|)) (|cc| (|Record| (|:| |co1| |Dom|) (|:| |co2| |Dom|)))
          (|e| (|Union| |Expon| "failed")) (|s1| (|Expon|)) (|f1| (|Dpol|))
          (|Fh| (|List| |Dpol|)))
         (SEQ
          (LETT |m| (|spadConstant| $ 20) . #1=(|GBINTERN;redPo;DpolLR;13|))
          (LETT |Fh| F . #1#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |s| (|spadConstant| $ 44) (QREFELT $ 45)) NIL)
                   ('T (NULL (NULL F)))))
                 (GO G191)))
               (SEQ (LETT |f1| (|SPADfirst| F) . #1#)
                    (LETT |s1| (SPADCALL |s| (QREFELT $ 16)) . #1#)
                    (LETT |e|
                          (SPADCALL |s1| (SPADCALL |f1| (QREFELT $ 16))
                                    (QREFELT $ 19))
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
                                          (QREFELT $ 22))
                                (SPADCALL |f1| (QREFELT $ 64)) (QREFELT $ 65))
                               (QREFELT $ 66))
                              . #1#)
                        (LETT |m| (SPADCALL |m| (QCAR |cc|) (QREFELT $ 68))
                              . #1#)
                        (EXIT (LETT F |Fh| . #1#))))
                      ('T (LETT F (CDR F) . #1#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |s| |m|))))) 

(SDEFUN |GBINTERN;redPol;DpolLDpol;14|
        ((|s| |Dpol|) (F |List| |Dpol|) ($ |Dpol|))
        (SPADCALL (QCAR (SPADCALL |s| F (QREFELT $ 70))) F (QREFELT $ 71))) 

(SDEFUN |GBINTERN;critT;RB;15|
        ((|p| |Record| (|:| |lcmfij| |Expon|)
          (|:| |totdeg| (|NonNegativeInteger|)) (|:| |poli| |Dpol|)
          (|:| |polj| |Dpol|))
         ($ |Boolean|))
        (SPADCALL (QVELT |p| 0)
                  (SPADCALL (SPADCALL (QVELT |p| 2) (QREFELT $ 16))
                            (SPADCALL (QVELT |p| 3) (QREFELT $ 16))
                            (QREFELT $ 72))
                  (QREFELT $ 48))) 

(SDEFUN |GBINTERN;critM;2ExponB;16|
        ((|e1| |Expon|) (|e2| |Expon|) ($ |Boolean|))
        (SPROG ((|en| (|Union| |Expon| "failed")))
               (QEQCAR
                (LETT |en| (SPADCALL |e2| |e1| (QREFELT $ 19))
                      |GBINTERN;critM;2ExponB;16|)
                0))) 

(SDEFUN |GBINTERN;critB;4ExponB;17|
        ((|eh| |Expon|) (|eik| |Expon|) (|ei| |Expon|) (|ek| |Expon|)
         ($ |Boolean|))
        (COND
         ((SPADCALL |eh| |eik| (QREFELT $ 56))
          (COND
           ((SPADCALL |eik| (SPADCALL |eh| |ei| (QREFELT $ 17)) (QREFELT $ 73))
            (SPADCALL |eik| (SPADCALL |eh| |ek| (QREFELT $ 17))
                      (QREFELT $ 73)))
           (#1='T NIL)))
         (#1# NIL))) 

(SDEFUN |GBINTERN;hMonic;2Dpol;18| ((|p| |Dpol|) ($ |Dpol|))
        (COND ((SPADCALL |p| (|spadConstant| $ 44) (QREFELT $ 45)) |p|)
              ('T (SPADCALL |p| (QREFELT $ 74))))) 

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
                        (SPADCALL (SPADCALL |h| (QREFELT $ 63))
                                  (SPADCALL |h| (QREFELT $ 16)) (QREFELT $ 22))
                        . #1=(|GBINTERN;credPol;DpolLDpol;19|))
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL
                           (LETT |h| (SPADCALL |h| (QREFELT $ 64)) . #1#)
                           (|spadConstant| $ 44) (QREFELT $ 75)))
                         (GO G191)))
                       (SEQ (LETT |hred| (SPADCALL |h| F (QREFELT $ 70)) . #1#)
                            (LETT |h| (QCAR |hred|) . #1#)
                            (EXIT
                             (LETT |h0|
                                   (SPADCALL
                                    (SPADCALL (QCDR |hred|) |h0|
                                              (QREFELT $ 67))
                                    (SPADCALL (SPADCALL |h| (QREFELT $ 63))
                                              (SPADCALL |h| (QREFELT $ 16))
                                              (QREFELT $ 22))
                                    (QREFELT $ 76))
                                   . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |h0|))))))) 

(SDEFUN |GBINTERN;minGbasis;2L;20| ((F |List| |Dpol|) ($ |List| |Dpol|))
        (SPROG ((|newbas| (|List| |Dpol|)))
               (SEQ
                (COND ((NULL F) NIL)
                      ('T
                       (SEQ
                        (LETT |newbas| (SPADCALL (CDR F) (QREFELT $ 77))
                              |GBINTERN;minGbasis;2L;20|)
                        (EXIT
                         (CONS
                          (SPADCALL
                           (SPADCALL (|SPADfirst| F) |newbas| (QREFELT $ 71))
                           (QREFELT $ 29))
                          |newbas|)))))))) 

(SDEFUN |GBINTERN;lepol;DpolI;21| ((|p1| |Dpol|) ($ |Integer|))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| 0 . #1=(|GBINTERN;lepol;DpolI;21|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p1| (|spadConstant| $ 44)
                                      (QREFELT $ 75)))
                           (GO G191)))
                         (SEQ (LETT |n| (+ |n| 1) . #1#)
                              (EXIT
                               (LETT |p1| (SPADCALL |p1| (QREFELT $ 64))
                                     . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |n|)))) 

(SDEFUN |GBINTERN;prinb;IV;22| ((|n| |Integer|) ($ |Void|))
        (SPROG ((#1=#:G284 NIL) (|x| NIL))
               (SEQ (LETT |x| 1 . #2=(|GBINTERN;prinb;IV;22|))
                    (LETT #1# |n| . #2#) G190
                    (COND ((|greater_SI| |x| #1#) (GO G191)))
                    (SEQ (EXIT (SPADCALL "    " (QREFELT $ 53))))
                    (LETT |x| (|inc_SI| |x|) . #2#) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |GBINTERN;prinshINFO;DpolV;23| ((|h| |Dpol|) ($ |Void|))
        (SEQ (SPADCALL 2 (QREFELT $ 79))
             (SPADCALL " reduced Critpair - Polynom :" (QREFELT $ 53))
             (SPADCALL 2 (QREFELT $ 79))
             (SPADCALL (SPADCALL |h| (QREFELT $ 80)) (QREFELT $ 81))
             (EXIT (SPADCALL 2 (QREFELT $ 79))))) 

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
            (SEQ (SPADCALL 1 (QREFELT $ 79))
                 (SPADCALL "you choose option  -info-  " (QREFELT $ 53))
                 (SPADCALL "abbrev. for the following information strings are"
                           (QREFELT $ 53))
                 (SPADCALL
                  "  ci  =>  Leading monomial  for critpair calculation"
                  (QREFELT $ 53))
                 (SPADCALL "  tci =>  Number of terms of polynomial i"
                           (QREFELT $ 53))
                 (SPADCALL
                  "  cj  =>  Leading monomial  for critpair calculation"
                  (QREFELT $ 53))
                 (SPADCALL "  tcj =>  Number of terms of polynomial j"
                           (QREFELT $ 53))
                 (SPADCALL "  c   =>  Leading monomial of critpair polynomial"
                           (QREFELT $ 53))
                 (SPADCALL "  tc  =>  Number of terms of critpair polynomial"
                           (QREFELT $ 53))
                 (SPADCALL
                  "  rc  =>  Leading monomial of redcritpair polynomial"
                  (QREFELT $ 53))
                 (SPADCALL
                  "  trc =>  Number of terms of redcritpair polynomial"
                  (QREFELT $ 53))
                 (SPADCALL
                  "  tF  =>  Number of polynomials in reduction list F"
                  (QREFELT $ 53))
                 (SPADCALL "  tD  =>  Number of critpairs still to do"
                           (QREFELT $ 53))
                 (SPADCALL 4 (QREFELT $ 79)) (EXIT (LETT |n| 2 . #1#)))))
          (SPADCALL 1 (QREFELT $ 79)) (LETT |a| (|spadConstant| $ 20) . #1#)
          (EXIT
           (COND
            ((SPADCALL |ph| (|spadConstant| $ 44) (QREFELT $ 45))
             (COND
              ((SPADCALL |ps| (|spadConstant| $ 44) (QREFELT $ 45))
               (SEQ
                (LETT |ll|
                      (LIST
                       (VECTOR
                        (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 16))
                                  (QREFELT $ 22))
                        (SPADCALL |cpi| (QREFELT $ 78))
                        (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 16))
                                  (QREFELT $ 22))
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
                        (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 16))
                                  (QREFELT $ 22))
                        (SPADCALL |cpi| (QREFELT $ 78))
                        (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 16))
                                  (QREFELT $ 22))
                        (SPADCALL |cpj| (QREFELT $ 78))
                        (SPADCALL |a| (SPADCALL |ps| (QREFELT $ 16))
                                  (QREFELT $ 22))
                        (SPADCALL |ps| (QREFELT $ 78)) |ph| 0 |i1| |i2|))
                      . #1#)
                (SPADCALL (SPADCALL |ll| (QREFELT $ 84)) (QREFELT $ 81))
                (SPADCALL 1 (QREFELT $ 79)) (EXIT |n|)))))
            (#2#
             (SEQ
              (LETT |ll|
                    (LIST
                     (VECTOR
                      (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 16))
                                (QREFELT $ 22))
                      (SPADCALL |cpi| (QREFELT $ 78))
                      (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 16))
                                (QREFELT $ 22))
                      (SPADCALL |cpj| (QREFELT $ 78))
                      (SPADCALL |a| (SPADCALL |ps| (QREFELT $ 16))
                                (QREFELT $ 22))
                      (SPADCALL |ps| (QREFELT $ 78))
                      (SPADCALL |a| (SPADCALL |ph| (QREFELT $ 16))
                                (QREFELT $ 22))
                      (SPADCALL |ph| (QREFELT $ 78)) |i1| |i2|))
                    . #1#)
              (SPADCALL (SPADCALL |ll| (QREFELT $ 84)) (QREFELT $ 81))
              (SPADCALL 1 (QREFELT $ 79)) (EXIT |n|)))))))) 

(SDEFUN |GBINTERN;prinpolINFO;LV;25| ((|pl| |List| |Dpol|) ($ |Void|))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (LENGTH |pl|) |GBINTERN;prinpolINFO;LV;25|)
                    (SPADCALL 1 (QREFELT $ 79))
                    (EXIT
                     (COND
                      ((EQL |n| 1)
                       (SEQ
                        (SPADCALL "  There is 1  Groebner Basis Polynomial "
                                  (QREFELT $ 53))
                        (EXIT (SPADCALL 2 (QREFELT $ 79)))))
                      ('T
                       (SEQ (SPADCALL "  There are " (QREFELT $ 53))
                            (SPADCALL 1 (QREFELT $ 79))
                            (SPADCALL (SPADCALL |n| (QREFELT $ 85))
                                      (QREFELT $ 81))
                            (SPADCALL 1 (QREFELT $ 79))
                            (SPADCALL "  Groebner Basis Polynomials. "
                                      (QREFELT $ 53))
                            (EXIT (SPADCALL 2 (QREFELT $ 79)))))))))) 

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
            (SEQ (SPADCALL 1 (QREFELT $ 79))
                 (SPADCALL "you choose option  -info-  " (QREFELT $ 53))
                 (SPADCALL "abbrev. for the following information strings are"
                           (QREFELT $ 53))
                 (SPADCALL
                  "  ci  =>  Leading monomial  for critpair calculation"
                  (QREFELT $ 53))
                 (SPADCALL "  tci =>  Number of terms of polynomial i"
                           (QREFELT $ 53))
                 (SPADCALL
                  "  cj  =>  Leading monomial  for critpair calculation"
                  (QREFELT $ 53))
                 (SPADCALL "  tcj =>  Number of terms of polynomial j"
                           (QREFELT $ 53))
                 (SPADCALL "  c   =>  Leading monomial of critpair polynomial"
                           (QREFELT $ 53))
                 (SPADCALL "  tc  =>  Number of terms of critpair polynomial"
                           (QREFELT $ 53))
                 (SPADCALL
                  "  rc  =>  Leading monomial of redcritpair polynomial"
                  (QREFELT $ 53))
                 (SPADCALL
                  "  trc =>  Number of terms of redcritpair polynomial"
                  (QREFELT $ 53))
                 (SPADCALL
                  "  tF  =>  Number of polynomials in reduction list F"
                  (QREFELT $ 53))
                 (SPADCALL "  tD  =>  Number of critpairs still to do"
                           (QREFELT $ 53))
                 (SPADCALL "  tDF =>  Number of subproblems still to do"
                           (QREFELT $ 53))
                 (SPADCALL 4 (QREFELT $ 79)) (EXIT (LETT |n| 2 . #1#)))))
          (SPADCALL 1 (QREFELT $ 79)) (LETT |a| (|spadConstant| $ 20) . #1#)
          (EXIT
           (COND
            ((SPADCALL |ph| (|spadConstant| $ 44) (QREFELT $ 45))
             (COND
              ((SPADCALL |ps| (|spadConstant| $ 44) (QREFELT $ 45))
               (SEQ
                (LETT |ll|
                      (LIST
                       (VECTOR
                        (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 16))
                                  (QREFELT $ 22))
                        (SPADCALL |cpi| (QREFELT $ 78))
                        (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 16))
                                  (QREFELT $ 22))
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
                        (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 16))
                                  (QREFELT $ 22))
                        (SPADCALL |cpi| (QREFELT $ 78))
                        (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 16))
                                  (QREFELT $ 22))
                        (SPADCALL |cpj| (QREFELT $ 78))
                        (SPADCALL |a| (SPADCALL |ps| (QREFELT $ 16))
                                  (QREFELT $ 22))
                        (SPADCALL |ps| (QREFELT $ 78)) |ph| 0 |i1| |i2| |i3|))
                      . #1#)
                (SPADCALL (SPADCALL |ll| (QREFELT $ 88)) (QREFELT $ 81))
                (SPADCALL 1 (QREFELT $ 79)) (EXIT |n|)))))
            (#2#
             (SEQ
              (LETT |ll|
                    (LIST
                     (VECTOR
                      (SPADCALL |a| (SPADCALL |cpi| (QREFELT $ 16))
                                (QREFELT $ 22))
                      (SPADCALL |cpi| (QREFELT $ 78))
                      (SPADCALL |a| (SPADCALL |cpj| (QREFELT $ 16))
                                (QREFELT $ 22))
                      (SPADCALL |cpj| (QREFELT $ 78))
                      (SPADCALL |a| (SPADCALL |ps| (QREFELT $ 16))
                                (QREFELT $ 22))
                      (SPADCALL |ps| (QREFELT $ 78))
                      (SPADCALL |a| (SPADCALL |ph| (QREFELT $ 16))
                                (QREFELT $ 22))
                      (SPADCALL |ph| (QREFELT $ 78)) |i1| |i2| |i3|))
                    . #1#)
              (SPADCALL (SPADCALL |ll| (QREFELT $ 88)) (QREFELT $ 81))
              (SPADCALL 1 (QREFELT $ 79)) (EXIT |n|)))))))) 

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

(DEFUN |GroebnerInternalPackage;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|GroebnerInternalPackage|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|GroebnerInternalPackage| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 90) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|GroebnerInternalPackage|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasSignature| |#3|
                            (LIST '|totalDegree|
                                  (LIST '(|NonNegativeInteger|)
                                        (|devaluate| |#3|))))
            (QSETREFV $ 11
                      (CONS
                       (|dispatchFunction| |GBINTERN;virtualDegree;DpolNni;1|)
                       $)))
           ('T
            (QSETREFV $ 11
                      (CONS
                       (|dispatchFunction| |GBINTERN;virtualDegree;DpolNni;2|)
                       $))))
          $))) 

(MAKEPROP '|GroebnerInternalPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|NonNegativeInteger|) (0 . |totalDegree|)
              (5 . |virtualDegree|) (|Boolean|) (10 . <)
              (|Record| (|:| |lcmfij| 7) (|:| |totdeg| 9) (|:| |poli| 8)
                        (|:| |polj| 8))
              |GBINTERN;critpOrder;2RB;3| (16 . |degree|) (21 . |sup|)
              (|Union| $ '"failed") (27 . |subtractIfCan|) (33 . |One|)
              (37 . |One|) (41 . |monomial|)
              (|Record| (|:| |totdeg| 9) (|:| |pol| 8))
              |GBINTERN;makeCrit;RDpolNniR;4| (47 . >) (|Mapping| 12 8 8)
              (|List| 8) (53 . |sort|) |GBINTERN;hMonic;2Dpol;18| (|List| 23)
              |GBINTERN;updatF;DpolNni2L;9| (|Mapping| 12 14 14) (|List| 14)
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
              (|Record| (|:| |poly| 8) (|:| |mult| 6))
              |GBINTERN;redPo;DpolLR;13| |GBINTERN;credPol;DpolLDpol;19|
              (158 . +) (164 . ~=) (170 . |primitivePart|) (175 . ~=) (181 . +)
              |GBINTERN;minGbasis;2L;20| |GBINTERN;lepol;DpolI;21|
              |GBINTERN;prinb;IV;22| (187 . |coerce|) (192 . |print|)
              (|Record| (|:| |ci| 8) (|:| |tci| 46) (|:| |cj| 8) (|:| |tcj| 46)
                        (|:| |c| 8) (|:| |tc| 46) (|:| |rc| 8) (|:| |trc| 46)
                        (|:| |tF| 46) (|:| |tD| 46))
              (|List| 82) (197 . |coerce|) (202 . |coerce|)
              (|Record| (|:| |ci| 8) (|:| |tci| 46) (|:| |cj| 8) (|:| |tcj| 46)
                        (|:| |c| 8) (|:| |tc| 46) (|:| |rc| 8) (|:| |trc| 46)
                        (|:| |tF| 46) (|:| |tDD| 46) (|:| |tDF| 46))
              (|List| 86) (207 . |coerce|) |GBINTERN;fprindINFO;R2Dpol5I;26|)
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
                             (|makeByteWordVec2| 89
                                                 '(1 8 9 0 10 1 0 9 8 11 2 7 12
                                                   0 0 13 1 8 7 0 16 2 7 0 0 0
                                                   17 2 7 18 0 0 19 0 6 0 20 0
                                                   8 0 21 2 8 0 6 7 22 2 7 12 0
                                                   0 25 2 27 0 26 0 28 2 33 0
                                                   32 0 34 0 6 0 42 0 7 0 43 0
                                                   8 0 44 2 8 12 0 0 45 2 7 12
                                                   0 0 48 2 27 0 0 8 49 1 52 40
                                                   51 53 2 46 12 0 0 54 2 30 0
                                                   0 23 60 2 6 0 0 0 61 2 6 18
                                                   0 0 62 1 8 6 0 63 1 8 0 0 64
                                                   2 8 0 0 0 65 2 8 0 0 0 66 2
                                                   8 0 6 0 67 2 6 0 0 0 68 2 7
                                                   0 0 0 72 2 7 12 0 0 73 1 8 0
                                                   0 74 2 8 12 0 0 75 2 8 0 0 0
                                                   76 1 8 52 0 80 1 52 40 0 81
                                                   1 83 52 0 84 1 46 52 0 85 1
                                                   87 52 0 88 1 0 9 8 11 3 0 30
                                                   8 9 30 31 2 0 33 33 33 37 1
                                                   0 8 14 38 2 0 8 8 27 39 2 0
                                                   69 8 27 70 1 0 40 8 41 1 0
                                                   40 27 50 6 0 46 14 8 8 46 46
                                                   46 47 1 0 40 46 79 1 0 27 27
                                                   77 3 0 14 23 8 9 24 1 0 46 8
                                                   78 1 0 8 8 29 3 0 27 27 46
                                                   46 55 7 0 46 14 8 8 46 46 46
                                                   46 89 2 0 12 14 14 15 1 0 12
                                                   14 58 2 0 33 7 33 57 1 0 33
                                                   33 35 2 0 12 7 7 56 2 0 33 8
                                                   33 36 4 0 12 7 7 7 7 59 2 0
                                                   8 8 27 71)))))
           '|lookupComplete|)) 
