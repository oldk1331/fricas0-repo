
(SDEFUN |IDEAL;npoly| ((|f| |DPoly|) ($ |newPoly|))
        (COND
         ((SPADCALL |f| (|spadConstant| $ 13) (QREFELT $ 15))
          (|spadConstant| $ 16))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |f| (QREFELT $ 17))
                     (SPADCALL 0 (SPADCALL |f| (QREFELT $ 20)) (QREFELT $ 22))
                     (QREFELT $ 23))
           (|IDEAL;npoly| (SPADCALL |f| (QREFELT $ 24)) $) (QREFELT $ 25))))) 

(SDEFUN |IDEAL;oldpoly| ((|q| |newPoly|) ($ . #1=(|Union| |DPoly| "failed")))
        (SPROG ((|g| #1#) (|n| (|NonNegativeInteger|)) (|dq| (|newExpon|)))
               (SEQ
                (COND
                 ((SPADCALL |q| (|spadConstant| $ 16) (QREFELT $ 26))
                  (CONS 0 (|spadConstant| $ 13)))
                 (#2='T
                  (SEQ
                   (LETT |dq| (SPADCALL |q| (QREFELT $ 27))
                         . #3=(|IDEAL;oldpoly|))
                   (LETT |n| (SPADCALL |dq| (QREFELT $ 28)) . #3#)
                   (EXIT
                    (COND ((SPADCALL |n| 0 (QREFELT $ 29)) (CONS 1 "failed"))
                          (#2#
                           (SEQ
                            (LETT |g|
                                  (|IDEAL;oldpoly|
                                   (SPADCALL |q| (QREFELT $ 30)) $)
                                  . #3#)
                            (EXIT
                             (COND ((QEQCAR |g| 1) (CONS 1 "failed"))
                                   (#2#
                                    (CONS 0
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |q| (QREFELT $ 31))
                                            (SPADCALL |dq| (QREFELT $ 32))
                                            (QREFELT $ 33))
                                           (QCDR |g|)
                                           (QREFELT $ 34)))))))))))))))) 

(SDEFUN |IDEAL;leadterm| ((|f| |DPoly|) (|lvar| |List| |VarSet|) ($ |DPoly|))
        (SPROG ((|lf| (|List| |VarSet|)))
               (COND
                ((OR
                  (NULL
                   (LETT |lf| (SPADCALL |f| (QREFELT $ 36)) |IDEAL;leadterm|))
                  (SPADCALL |lf| |lvar| (QREFELT $ 37)))
                 |f|)
                ('T
                 (|IDEAL;leadterm|
                  (SPADCALL (SPADCALL |f| (|SPADfirst| |lf|) (QREFELT $ 39))
                            (QREFELT $ 41))
                  |lvar| $))))) 

(SDEFUN |IDEAL;choosel| ((|f| |DPoly|) (|g| |DPoly|) ($ |DPoly|))
        (SPROG ((|f1| (|Union| |DPoly| "failed")))
               (SEQ
                (COND ((SPADCALL |g| (|spadConstant| $ 13) (QREFELT $ 15)) |f|)
                      (#1='T
                       (SEQ
                        (LETT |f1| (SPADCALL |f| |g| (QREFELT $ 43))
                              |IDEAL;choosel|)
                        (EXIT
                         (COND ((QEQCAR |f1| 1) |f|)
                               (#1# (|IDEAL;choosel| (QCDR |f1|) |g| $)))))))))) 

(SDEFUN |IDEAL;contractGrob| ((I1 |List| |newPoly|) ($ $))
        (SPROG
         ((#1=#:G136 NIL) (#2=#:G152 NIL) (|f| NIL) (#3=#:G151 NIL)
          (J1 (|List| |newPoly|)))
         (SEQ
          (LETT J1 (SPADCALL I1 (QREFELT $ 46)) . #4=(|IDEAL;contractGrob|))
          (SEQ G190
               (COND
                ((NULL (QEQCAR (|IDEAL;oldpoly| (|SPADfirst| J1) $) 1))
                 (GO G191)))
               (SEQ (EXIT (LETT J1 (CDR J1) . #4#))) NIL (GO G190) G191
               (EXIT NIL))
          (EXIT
           (CONS
            (PROGN
             (LETT #3# NIL . #4#)
             (SEQ (LETT |f| NIL . #4#) (LETT #2# J1 . #4#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #4#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #3#
                          (CONS
                           (PROG2 (LETT #1# (|IDEAL;oldpoly| |f| $) . #4#)
                               (QCDR #1#)
                             (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
                           #3#)
                          . #4#)))
                  (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #3#))))
            'T))))) 

(SDEFUN |IDEAL;makeleast|
        ((|fullVars| |List| |VarSet|) (|leastVars| |List| |VarSet|)
         ($ |List| |VarSet|))
        (SPROG
         ((#1=#:G158 NIL) (|vv| NIL) (#2=#:G157 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |leastVars|) . #3=(|IDEAL;makeleast|))
              (EXIT
               (COND ((< (LENGTH |fullVars|) |n|) (|error| "wrong vars"))
                     ((EQL |n| 0) |fullVars|)
                     (#4='T
                      (APPEND
                       (PROGN
                        (LETT #2# NIL . #3#)
                        (SEQ (LETT |vv| NIL . #3#) (LETT #1# |fullVars| . #3#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |vv| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((COND
                                  ((SPADCALL |vv| |leastVars| (QREFELT $ 47))
                                   'NIL)
                                  (#4# 'T))
                                 (LETT #2# (CONS |vv| #2#) . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       |leastVars|))))))) 

(SDEFUN |IDEAL;isMonic?| ((|f| |DPoly|) (|x| |VarSet|) ($ |Boolean|))
        (SPADCALL (SPADCALL (SPADCALL |f| |x| (QREFELT $ 39)) (QREFELT $ 41))
                  (QREFELT $ 48))) 

(SDEFUN |IDEAL;subset|
        ((|lv| |List| |VarSet|) ($ . #1=(|List| (|List| |VarSet|))))
        (SPROG
         ((|l1| (|List| (|List| |VarSet|))) (#2=#:G166 NIL) (|set| NIL)
          (#3=#:G165 NIL) (|ll| #1#) (|v| (|VarSet|)))
         (SEQ
          (COND ((EQL (LENGTH |lv|) 1) (LIST |lv| NIL))
                ('T
                 (SEQ
                  (LETT |v| (SPADCALL |lv| 1 (QREFELT $ 52))
                        . #4=(|IDEAL;subset|))
                  (LETT |ll| (|IDEAL;subset| (CDR |lv|) $) . #4#)
                  (LETT |l1|
                        (PROGN
                         (LETT #3# NIL . #4#)
                         (SEQ (LETT |set| NIL . #4#) (LETT #2# |ll| . #4#) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |set| (CAR #2#) . #4#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3# (CONS (CONS |v| |set|) #3#) . #4#)))
                              (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #4#)
                  (EXIT (SPADCALL |l1| |ll| (QREFELT $ 54))))))))) 

(SDEFUN |IDEAL;monomDim|
        ((|listm| $) (|lv| . #1=(|List| |VarSet|)) ($ |NonNegativeInteger|))
        (SPROG
         ((#2=#:G178 NIL) (|ldif| #1#) (#3=#:G181 NIL)
          (|mvset| (|List| |VarSet|)) (#4=#:G180 NIL) (|subs| NIL)
          (|lsubset| (|List| (|List| |VarSet|)))
          (|monvar| (|List| (|List| |VarSet|))) (#5=#:G179 NIL) (|f| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |monvar| NIL . #6=(|IDEAL;monomDim|))
                (SEQ (LETT |f| NIL . #6#)
                     (LETT #5# (SPADCALL |listm| (QREFELT $ 56)) . #6#) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#) . #6#) NIL))
                       (GO G191)))
                     (SEQ (LETT |mvset| (SPADCALL |f| (QREFELT $ 36)) . #6#)
                          (EXIT
                           (COND
                            ((SPADCALL (LENGTH |mvset|) 1 (QREFELT $ 57))
                             (LETT |monvar| (CONS |mvset| |monvar|) . #6#))
                            ('T
                             (LETT |lv|
                                   (SPADCALL |lv|
                                             (SPADCALL
                                              (SPADCALL |mvset| 1
                                                        (QREFELT $ 52))
                                              |lv| (QREFELT $ 59))
                                             (QREFELT $ 60))
                                   . #6#)))))
                     (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND ((NULL |lv|) 0)
                       ('T
                        (SEQ
                         (LETT |lsubset|
                               (SPADCALL (CONS #'|IDEAL;monomDim!0| $)
                                         (|IDEAL;subset| |lv| $)
                                         (QREFELT $ 63))
                               . #6#)
                         (SEQ (LETT |subs| NIL . #6#)
                              (LETT #4# |lsubset| . #6#) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |subs| (CAR #4#) . #6#) NIL))
                                (GO G191)))
                              (SEQ (LETT |ldif| |lv| . #6#)
                                   (SEQ (LETT |mvset| NIL . #6#)
                                        (LETT #3# |monvar| . #6#) G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN
                                               (LETT |mvset| (CAR #3#) . #6#)
                                               NIL)
                                              (NULL
                                               (SPADCALL |ldif| NIL
                                                         (QREFELT $ 64))))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |ldif|
                                                (SPADCALL |mvset| |subs|
                                                          (QREFELT $ 65))
                                                . #6#)))
                                        (LETT #3# (CDR #3#) . #6#) (GO G190)
                                        G191 (EXIT NIL))
                                   (EXIT
                                    (COND
                                     ((NULL (NULL |ldif|))
                                      (PROGN
                                       (LETT #2# (LENGTH |subs|) . #6#)
                                       (GO #7=#:G177))))))
                              (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT 0)))))))
          #7# (EXIT #2#)))) 

(SDEFUN |IDEAL;monomDim!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 61)) (SPADCALL |z2| (QREFELT $ 61))
                  (QREFELT $ 57))) 

(SDEFUN |IDEAL;=;2$B;10| ((I $) (J $) ($ |Boolean|))
        (COND ((SPADCALL I J (QREFELT $ 66)) (SPADCALL J I (QREFELT $ 66)))
              ('T 'NIL))) 

(SDEFUN |IDEAL;element?;DPoly$B;11| ((|f| |DPoly|) (I $) ($ |Boolean|))
        (SPROG ((|Id| (|List| |DPoly|)))
               (SEQ
                (LETT |Id| (QCAR (SPADCALL I (QREFELT $ 68)))
                      |IDEAL;element?;DPoly$B;11|)
                (EXIT
                 (COND
                  ((NULL |Id|)
                   (SPADCALL |f| (|spadConstant| $ 13) (QREFELT $ 15)))
                  ('T
                   (SPADCALL (SPADCALL |f| |Id| (QREFELT $ 70))
                             (|spadConstant| $ 13) (QREFELT $ 15)))))))) 

(SDEFUN |IDEAL;in?;2$B;12| ((I $) (J $) ($ |Boolean|))
        (SPROG
         ((#1=#:G188 NIL) (#2=#:G187 #3=(|Boolean|)) (#4=#:G189 #3#)
          (#5=#:G192 NIL) (|f| NIL))
         (SEQ (LETT J (SPADCALL J (QREFELT $ 68)) . #6=(|IDEAL;in?;2$B;12|))
              (EXIT
               (COND ((NULL (QCAR I)) 'T)
                     (#7='T
                      (PROGN
                       (LETT #1# NIL . #6#)
                       (SEQ (LETT |f| NIL . #6#) (LETT #5# (QCAR I) . #6#) G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |f| (CAR #5#) . #6#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #4# (SPADCALL |f| J (QREFELT $ 71)) . #6#)
                               (COND
                                (#1#
                                 (LETT #2# (COND (#2# #4#) ('T 'NIL)) . #6#))
                                ('T
                                 (PROGN
                                  (LETT #2# #4# . #6#)
                                  (LETT #1# 'T . #6#)))))))
                            (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#1# #2#) (#7# 'T))))))))) 

(SDEFUN |IDEAL;groebner;2$;13| ((I $) ($ $))
        (SPROG
         ((#1=#:G194 NIL) (#2=#:G193 #3=(|Boolean|)) (#4=#:G195 #3#)
          (#5=#:G200 NIL) (|f| NIL))
         (SEQ
          (COND
           ((QCDR I)
            (COND
             ((PROGN
               (LETT #1# NIL . #6=(|IDEAL;groebner;2$;13|))
               (SEQ (LETT |f| NIL . #6#) (LETT #5# (QCAR I) . #6#) G190
                    (COND
                     ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#) . #6#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (PROGN
                       (LETT #4#
                             (COND ((SPADCALL |f| (QREFELT $ 72)) 'NIL)
                                   ('T 'T))
                             . #6#)
                       (COND (#1# (LETT #2# (COND (#2# 'T) ('T #4#)) . #6#))
                             ('T
                              (PROGN
                               (LETT #2# #4# . #6#)
                               (LETT #1# 'T . #6#)))))))
                    (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
               (COND (#1# #2#) (#7='T 'NIL)))
              I)
             (#7# (CONS NIL 'T))))
           (#7# (CONS (SPADCALL (QCAR I) (QREFELT $ 73)) 'T)))))) 

(SDEFUN |IDEAL;intersect;3$;14| ((I $) (J $) ($ $))
        (SPROG
         ((#1=#:G211 NIL) (|f| NIL) (#2=#:G210 NIL) (#3=#:G209 NIL)
          (#4=#:G208 NIL) (|tp1| (|newPoly|)) (|tp| (|newPoly|))
          (|Jd| #5=(|List| |DPoly|)) (|Id| #5#))
         (SEQ
          (COND ((NULL (LETT |Id| (QCAR I) . #6=(|IDEAL;intersect;3$;14|))) I)
                ((NULL (LETT |Jd| (QCAR J) . #6#)) J)
                ('T
                 (SEQ
                  (LETT |tp|
                        (SPADCALL (|spadConstant| $ 49)
                                  (SPADCALL 1 (|spadConstant| $ 19)
                                            (QREFELT $ 22))
                                  (QREFELT $ 23))
                        . #6#)
                  (LETT |tp1|
                        (SPADCALL |tp| (|spadConstant| $ 74) (QREFELT $ 75))
                        . #6#)
                  (EXIT
                   (|IDEAL;contractGrob|
                    (SPADCALL
                     (PROGN
                      (LETT #4# NIL . #6#)
                      (SEQ (LETT |f| NIL . #6#) (LETT #3# |Id| . #6#) G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN (LETT |f| (CAR #3#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #4#
                                   (CONS
                                    (SPADCALL |tp| (|IDEAL;npoly| |f| $)
                                              (QREFELT $ 76))
                                    #4#)
                                   . #6#)))
                           (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     (PROGN
                      (LETT #2# NIL . #6#)
                      (SEQ (LETT |f| NIL . #6#) (LETT #1# |Jd| . #6#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |f| (CAR #1#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL |tp1| (|IDEAL;npoly| |f| $)
                                              (QREFELT $ 76))
                                    #2#)
                                   . #6#)))
                           (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 77))
                    $)))))))) 

(SDEFUN |IDEAL;intersect;L$;15| ((|lid| |List| $) ($ $))
        (SPROG
         ((#1=#:G213 NIL) (#2=#:G212 ($)) (#3=#:G214 ($)) (#4=#:G216 NIL)
          (|l| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|IDEAL;intersect;L$;15|))
           (SEQ (LETT |l| NIL . #5#) (LETT #4# |lid| . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |l| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3# |l| . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 78)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|IdentityError| '|intersect|))))))) 

(SDEFUN |IDEAL;quotient;$DPoly$;16| ((I $) (|f| |DPoly|) ($ $))
        (SPROG ((#1=#:G136 NIL) (#2=#:G222 NIL) (|g| NIL) (#3=#:G221 NIL))
               (SEQ
                (CONS
                 (SPADCALL
                  (PROGN
                   (LETT #3# NIL . #4=(|IDEAL;quotient;$DPoly$;16|))
                   (SEQ (LETT |g| NIL . #4#)
                        (LETT #2#
                              (QCAR
                               (SPADCALL I (SPADCALL (LIST |f|) (QREFELT $ 81))
                                         (QREFELT $ 78)))
                              . #4#)
                        G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |g| (CAR #2#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #3#
                                (CONS
                                 (PROG2
                                     (LETT #1#
                                           (SPADCALL |g| |f| (QREFELT $ 43))
                                           . #4#)
                                     (QCDR #1#)
                                   (|check_union| (QEQCAR #1# 0) (QREFELT $ 9)
                                                  #1#))
                                 #3#)
                                . #4#)))
                        (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                        (EXIT (NREVERSE #3#))))
                  (QREFELT $ 83))
                 'T)))) 

(SDEFUN |IDEAL;quotient;3$;17| ((I $) (J $) ($ $))
        (SPROG
         ((#1=#:G227 NIL) (#2=#:G226 ($)) (#3=#:G228 ($)) (#4=#:G231 NIL)
          (|f| NIL) (|Jdl| (|List| |DPoly|)))
         (SEQ (LETT |Jdl| (QCAR J) . #5=(|IDEAL;quotient;3$;17|))
              (EXIT
               (COND
                ((NULL |Jdl|)
                 (SPADCALL (LIST (|spadConstant| $ 50)) (QREFELT $ 85)))
                (#6='T
                 (CONS
                  (QCAR
                   (PROGN
                    (LETT #1# NIL . #5#)
                    (SEQ (LETT |f| NIL . #5#) (LETT #4# |Jdl| . #5#) G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #3# (SPADCALL I |f| (QREFELT $ 84)) . #5#)
                            (COND
                             (#1#
                              (LETT #2# (SPADCALL #2# #3# (QREFELT $ 78))
                                    . #5#))
                             ('T
                              (PROGN
                               (LETT #2# #3# . #5#)
                               (LETT #1# 'T . #5#)))))))
                         (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                    (COND (#1# #2#) (#6# (|IdentityError| '|intersect|)))))
                  'T))))))) 

(SDEFUN |IDEAL;+;3$;18| ((I $) (J $) ($ $))
        (CONS
         (SPADCALL (SPADCALL (QCAR I) (QCAR J) (QREFELT $ 87)) (QREFELT $ 73))
         'T)) 

(SDEFUN |IDEAL;*;3$;19| ((I $) (J $) ($ $))
        (SPROG
         ((#1=#:G234 NIL) (#2=#:G233 #3=(|List| |DPoly|)) (#4=#:G235 #3#)
          (#5=#:G240 NIL) (|f| NIL) (#6=#:G239 NIL) (#7=#:G238 NIL) (|g| NIL))
         (SEQ
          (CONS
           (SPADCALL
            (PROGN
             (LETT #1# NIL . #8=(|IDEAL;*;3$;19|))
             (SEQ (LETT |g| NIL . #8#) (LETT #7# (QCAR J) . #8#) G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |g| (CAR #7#) . #8#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (PROGN
                            (LETT #6# NIL . #8#)
                            (SEQ (LETT |f| NIL . #8#) (LETT #5# (QCAR I) . #8#)
                                 G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT |f| (CAR #5#) . #8#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #6#
                                         (CONS
                                          (SPADCALL |f| |g| (QREFELT $ 89))
                                          #6#)
                                         . #8#)))
                                 (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                                 (EXIT (NREVERSE #6#))))
                           . #8#)
                     (COND (#1# (LETT #2# (APPEND #2# #4#) . #8#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #8#)
                             (LETT #1# 'T . #8#)))))))
                  (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) ('T NIL)))
            (QREFELT $ 73))
           'T)))) 

(SDEFUN |IDEAL;^;$Nni$;20| ((I $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G241 NIL))
               (COND ((EQL |n| 0) (CONS (LIST (|spadConstant| $ 50)) 'T))
                     ('T
                      (SPADCALL I
                                (SPADCALL I
                                          (PROG1
                                              (LETT #1# (- |n| 1)
                                                    |IDEAL;^;$Nni$;20|)
                                            (|check_subtype| (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             #1#))
                                          (QREFELT $ 91))
                                (QREFELT $ 90)))))) 

(SDEFUN |IDEAL;saturate;$DPoly$;21| ((I $) (|f| |DPoly|) ($ $))
        (SPROG ((#1=#:G247 NIL) (|g| NIL) (#2=#:G246 NIL) (|tp| (|newPoly|)))
               (SEQ
                (COND
                 ((SPADCALL |f| (|spadConstant| $ 13) (QREFELT $ 15))
                  (|error| "f is zero"))
                 ('T
                  (SEQ
                   (LETT |tp|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 49)
                                     (SPADCALL 1 (|spadConstant| $ 19)
                                               (QREFELT $ 22))
                                     (QREFELT $ 23))
                           (|IDEAL;npoly| |f| $) (QREFELT $ 76))
                          (|spadConstant| $ 74) (QREFELT $ 75))
                         . #3=(|IDEAL;saturate;$DPoly$;21|))
                   (EXIT
                    (|IDEAL;contractGrob|
                     (CONS |tp|
                           (PROGN
                            (LETT #2# NIL . #3#)
                            (SEQ (LETT |g| NIL . #3#) (LETT #1# (QCAR I) . #3#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |g| (CAR #1#) . #3#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2# (CONS (|IDEAL;npoly| |g| $) #2#)
                                         . #3#)))
                                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                 (EXIT (NREVERSE #2#)))))
                     $)))))))) 

(SDEFUN |IDEAL;saturate;$DPolyL$;22|
        ((I $) (|f| |DPoly|) (|lvar| |List| |VarSet|) ($ $))
        (SPROG
         ((#1=#:G273 NIL) (|g| NIL) (#2=#:G272 NIL)
          (|fullPol| (|List| |DPoly|)) (#3=#:G271 NIL) (|vv| NIL)
          (#4=#:G270 NIL) (|s| (|DPoly|)) (#5=#:G256 NIL) (#6=#:G255 (|DPoly|))
          (#7=#:G257 (|DPoly|)) (#8=#:G269 NIL) (|ltg| NIL)
          (|ltJ| (|List| |DPoly|)) (#9=#:G268 NIL) (#10=#:G267 NIL)
          (J (|List| |DPoly|)) (#11=#:G266 NIL) (#12=#:G265 NIL)
          (|subVars| (|List| |DPoly|)) (#13=#:G264 NIL) (#14=#:G263 NIL)
          (|newVars| (|List| |VarSet|)) (|fullVars| #15=(|List| |VarSet|))
          (#16=#:G249 NIL) (#17=#:G248 #15#) (#18=#:G250 #15#) (#19=#:G262 NIL)
          (|Id| (|List| |DPoly|)))
         (SEQ (LETT |Id| (QCAR I) . #20=(|IDEAL;saturate;$DPolyL$;22|))
              (LETT |fullVars|
                    (PROGN
                     (LETT #16# NIL . #20#)
                     (SEQ (LETT |g| NIL . #20#) (LETT #19# |Id| . #20#) G190
                          (COND
                           ((OR (ATOM #19#)
                                (PROGN (LETT |g| (CAR #19#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #18# (SPADCALL |g| (QREFELT $ 36)) . #20#)
                             (COND
                              (#16#
                               (LETT #17# (SPADCALL #17# #18# (QREFELT $ 96))
                                     . #20#))
                              ('T
                               (PROGN
                                (LETT #17# #18# . #20#)
                                (LETT #16# 'T . #20#)))))))
                          (LETT #19# (CDR #19#) . #20#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#16# #17#) (#21='T (|IdentityError| '|setUnion|))))
                    . #20#)
              (LETT |newVars| (|IDEAL;makeleast| |fullVars| |lvar| $) . #20#)
              (LETT |subVars|
                    (PROGN
                     (LETT #14# NIL . #20#)
                     (SEQ (LETT |vv| NIL . #20#) (LETT #13# |newVars| . #20#)
                          G190
                          (COND
                           ((OR (ATOM #13#)
                                (PROGN (LETT |vv| (CAR #13#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #14#
                                  (CONS
                                   (SPADCALL (|spadConstant| $ 50) |vv| 1
                                             (QREFELT $ 97))
                                   #14#)
                                  . #20#)))
                          (LETT #13# (CDR #13#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #14#))))
                    . #20#)
              (LETT J
                    (SPADCALL
                     (PROGN
                      (LETT #12# NIL . #20#)
                      (SEQ (LETT |g| NIL . #20#) (LETT #11# |Id| . #20#) G190
                           (COND
                            ((OR (ATOM #11#)
                                 (PROGN (LETT |g| (CAR #11#) . #20#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #12#
                                   (CONS
                                    (SPADCALL |g| |fullVars| |subVars|
                                              (QREFELT $ 98))
                                    #12#)
                                   . #20#)))
                           (LETT #11# (CDR #11#) . #20#) (GO G190) G191
                           (EXIT (NREVERSE #12#))))
                     (QREFELT $ 73))
                    . #20#)
              (LETT |ltJ|
                    (PROGN
                     (LETT #10# NIL . #20#)
                     (SEQ (LETT |g| NIL . #20#) (LETT #9# J . #20#) G190
                          (COND
                           ((OR (ATOM #9#)
                                (PROGN (LETT |g| (CAR #9#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #10#
                                  (CONS (|IDEAL;leadterm| |g| |lvar| $) #10#)
                                  . #20#)))
                          (LETT #9# (CDR #9#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #10#))))
                    . #20#)
              (LETT |s|
                    (PROGN
                     (LETT #5# NIL . #20#)
                     (SEQ (LETT |ltg| NIL . #20#) (LETT #8# |ltJ| . #20#) G190
                          (COND
                           ((OR (ATOM #8#)
                                (PROGN (LETT |ltg| (CAR #8#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #7# (|IDEAL;choosel| |ltg| |f| $) . #20#)
                             (COND
                              (#5#
                               (LETT #6# (SPADCALL #6# #7# (QREFELT $ 89))
                                     . #20#))
                              ('T
                               (PROGN
                                (LETT #6# #7# . #20#)
                                (LETT #5# 'T . #20#)))))))
                          (LETT #8# (CDR #8#) . #20#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#5# #6#) (#21# (|spadConstant| $ 50))))
                    . #20#)
              (LETT |fullPol|
                    (PROGN
                     (LETT #4# NIL . #20#)
                     (SEQ (LETT |vv| NIL . #20#) (LETT #3# |fullVars| . #20#)
                          G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |vv| (CAR #3#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (SPADCALL (|spadConstant| $ 50) |vv| 1
                                             (QREFELT $ 97))
                                   #4#)
                                  . #20#)))
                          (LETT #3# (CDR #3#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #20#)
              (EXIT
               (CONS
                (PROGN
                 (LETT #2# NIL . #20#)
                 (SEQ (LETT |g| NIL . #20#)
                      (LETT #1#
                            (QCAR
                             (SPADCALL (SPADCALL J (QREFELT $ 81)) |s|
                                       (QREFELT $ 95)))
                            . #20#)
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#) . #20#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL |g| |newVars| |fullPol|
                                         (QREFELT $ 98))
                               #2#)
                              . #20#)))
                      (LETT #1# (CDR #1#) . #20#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                'T))))) 

(SDEFUN |IDEAL;zeroDim?;$LB;23| ((I $) (|lvar| |List| |VarSet|) ($ |Boolean|))
        (SPROG
         ((|x| (|VarSet|)) (#1=#:G276 NIL) (#2=#:G285 NIL) (|f| NIL)
          (|n| (|NonNegativeInteger|)) (J (|List| |DPoly|)))
         (SEQ
          (LETT J (QCAR (SPADCALL I (QREFELT $ 68)))
                . #3=(|IDEAL;zeroDim?;$LB;23|))
          (EXIT
           (COND
            ((OR (NULL J)
                 (SPADCALL J (LIST (|spadConstant| $ 50)) (QREFELT $ 100)))
             'NIL)
            ('T
             (SEQ (LETT |n| (LENGTH |lvar|) . #3#)
                  (EXIT
                   (COND ((< (LENGTH J) |n|) 'NIL)
                         ('T
                          (SEQ
                           (SEQ (LETT |f| NIL . #3#) (LETT #2# J . #3#) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |f| (CAR #2#) . #3#) NIL)
                                      (NULL
                                       (COND ((NULL |lvar|) 'NIL) ('T 'T))))
                                  (GO G191)))
                                (SEQ
                                 (LETT |x|
                                       (PROG2
                                           (LETT #1#
                                                 (SPADCALL |f| (QREFELT $ 102))
                                                 . #3#)
                                           (QCDR #1#)
                                         (|check_union| (QEQCAR #1# 0)
                                                        (QREFELT $ 8) #1#))
                                       . #3#)
                                 (EXIT
                                  (COND
                                   ((|IDEAL;isMonic?| |f| |x| $)
                                    (LETT |lvar|
                                          (SPADCALL |lvar|
                                                    (SPADCALL |x| |lvar|
                                                              (QREFELT $ 59))
                                                    (QREFELT $ 60))
                                          . #3#)))))
                                (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (NULL |lvar|))))))))))))) 

(SDEFUN |IDEAL;zeroDim?;$B;24| ((I $) ($ |Boolean|))
        (SPROG
         ((#1=#:G287 NIL) (#2=#:G286 #3=(|List| |VarSet|)) (#4=#:G288 #3#)
          (#5=#:G291 NIL) (|g| NIL))
         (SEQ
          (SPADCALL I
                    (PROGN
                     (LETT #1# NIL . #6=(|IDEAL;zeroDim?;$B;24|))
                     (SEQ (LETT |g| NIL . #6#) (LETT #5# (QCAR I) . #6#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |g| (CAR #5#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4# (SPADCALL |g| (QREFELT $ 36)) . #6#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #4# (QREFELT $ 96))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #2# #4# . #6#)
                                (LETT #1# 'T . #6#)))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|IdentityError| '|setUnion|))))
                    (QREFELT $ 103))))) 

(SDEFUN |IDEAL;inRadical?;DPoly$B;25| ((|f| |DPoly|) (I $) ($ |Boolean|))
        (SPROG
         ((#1=#:G353 NIL) (|g| NIL) (#2=#:G352 NIL) (|Id| (|List| |DPoly|))
          (|tp| (|newPoly|)))
         (SEQ
          (COND ((SPADCALL |f| (|spadConstant| $ 13) (QREFELT $ 15)) 'T)
                ('T
                 (SEQ
                  (LETT |tp|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 49)
                                    (SPADCALL 1 (|spadConstant| $ 19)
                                              (QREFELT $ 22))
                                    (QREFELT $ 23))
                          (|IDEAL;npoly| |f| $) (QREFELT $ 76))
                         (|spadConstant| $ 74) (QREFELT $ 75))
                        . #3=(|IDEAL;inRadical?;DPoly$B;25|))
                  (LETT |Id| (QCAR I) . #3#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL (|spadConstant| $ 74)
                              (SPADCALL
                               (CONS |tp|
                                     (PROGN
                                      (LETT #2# NIL . #3#)
                                      (SEQ (LETT |g| NIL . #3#)
                                           (LETT #1# |Id| . #3#) G190
                                           (COND
                                            ((OR (ATOM #1#)
                                                 (PROGN
                                                  (LETT |g| (CAR #1#) . #3#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #2#
                                                   (CONS (|IDEAL;npoly| |g| $)
                                                         #2#)
                                                   . #3#)))
                                           (LETT #1# (CDR #1#) . #3#) (GO G190)
                                           G191 (EXIT (NREVERSE #2#)))))
                               (QREFELT $ 46))
                              (QREFELT $ 105))
                    (|spadConstant| $ 16) (QREFELT $ 26))))))))) 

(SDEFUN |IDEAL;dimension;$LI;26| ((I $) (|lvar| |List| |VarSet|) ($ |Integer|))
        (SPROG
         ((|n1| (|Integer|)) (|leadid| ($)) (|ed| (|Integer|))
          (|truelist| #1=(|List| |VarSet|)) (#2=#:G359 NIL)
          (#3=#:G358 #4=(|Boolean|)) (#5=#:G360 #4#) (#6=#:G368 NIL) (|vv| NIL)
          (#7=#:G355 NIL) (#8=#:G354 #1#) (#9=#:G356 #1#) (#10=#:G367 NIL)
          (|f| NIL))
         (SEQ
          (LETT I (SPADCALL I (QREFELT $ 68)) . #11=(|IDEAL;dimension;$LI;26|))
          (EXIT
           (COND ((NULL (QCAR I)) (LENGTH |lvar|))
                 ((SPADCALL (|spadConstant| $ 50) I (QREFELT $ 71)) -1)
                 (#12='T
                  (SEQ
                   (LETT |truelist|
                         (PROGN
                          (LETT #7# NIL . #11#)
                          (SEQ (LETT |f| NIL . #11#)
                               (LETT #10# (QCAR I) . #11#) G190
                               (COND
                                ((OR (ATOM #10#)
                                     (PROGN (LETT |f| (CAR #10#) . #11#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #9# (SPADCALL |f| (QREFELT $ 36))
                                        . #11#)
                                  (COND
                                   (#7#
                                    (LETT #8# (SPADCALL #8# #9# (QREFELT $ 96))
                                          . #11#))
                                   ('T
                                    (PROGN
                                     (LETT #8# #9# . #11#)
                                     (LETT #7# 'T . #11#)))))))
                               (LETT #10# (CDR #10#) . #11#) (GO G190) G191
                               (EXIT NIL))
                          (COND (#7# #8#)
                                (#12# (|IdentityError| '|setUnion|))))
                         . #11#)
                   (EXIT
                    (COND
                     ((PROGN
                       (LETT #2# NIL . #11#)
                       (SEQ (LETT |vv| NIL . #11#) (LETT #6# |truelist| . #11#)
                            G190
                            (COND
                             ((OR (ATOM #6#)
                                  (PROGN (LETT |vv| (CAR #6#) . #11#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #5#
                                     (COND
                                      ((SPADCALL |vv| |lvar| (QREFELT $ 47))
                                       'NIL)
                                      ('T 'T))
                                     . #11#)
                               (COND
                                (#2#
                                 (LETT #3# (COND (#3# 'T) ('T #5#)) . #11#))
                                ('T
                                 (PROGN
                                  (LETT #3# #5# . #11#)
                                  (LETT #2# 'T . #11#)))))))
                            (LETT #6# (CDR #6#) . #11#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#2# #3#) (#12# 'NIL)))
                      (|error| "wrong variables"))
                     (#12#
                      (SEQ
                       (LETT |truelist|
                             (SPADCALL |lvar|
                                       (SPADCALL |lvar| |truelist|
                                                 (QREFELT $ 65))
                                       (QREFELT $ 65))
                             . #11#)
                       (LETT |ed| (- (LENGTH |lvar|) (LENGTH |truelist|))
                             . #11#)
                       (LETT |leadid| (SPADCALL I (QREFELT $ 107)) . #11#)
                       (LETT |n1| (|IDEAL;monomDim| |leadid| |truelist| $)
                             . #11#)
                       (EXIT (+ |ed| |n1|))))))))))))) 

(SDEFUN |IDEAL;dimension;$I;27| ((I $) ($ |Integer|))
        (SPROG
         ((#1=#:G370 NIL) (#2=#:G369 #3=(|List| |VarSet|)) (#4=#:G371 #3#)
          (#5=#:G374 NIL) (|g| NIL))
         (SEQ
          (SPADCALL I
                    (PROGN
                     (LETT #1# NIL . #6=(|IDEAL;dimension;$I;27|))
                     (SEQ (LETT |g| NIL . #6#) (LETT #5# (QCAR I) . #6#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |g| (CAR #5#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4# (SPADCALL |g| (QREFELT $ 36)) . #6#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #4# (QREFELT $ 96))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #2# #4# . #6#)
                                (LETT #1# 'T . #6#)))))))
                          (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|IdentityError| '|setUnion|))))
                    (QREFELT $ 108))))) 

(SDEFUN |IDEAL;leadingIdeal;2$;28| ((I $) ($ $))
        (SPROG
         ((#1=#:G379 NIL) (|f| NIL) (#2=#:G378 NIL) (|Idl| (|List| |DPoly|)))
         (SEQ
          (LETT |Idl| (QCAR (SPADCALL I (QREFELT $ 68)))
                . #3=(|IDEAL;leadingIdeal;2$;28|))
          (EXIT
           (CONS
            (PROGN
             (LETT #2# NIL . #3#)
             (SEQ (LETT |f| NIL . #3#) (LETT #1# |Idl| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (SPADCALL |f| (SPADCALL |f| (QREFELT $ 24))
                                     (QREFELT $ 110))
                           #2#)
                          . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            'T))))) 

(SDEFUN |IDEAL;monompol|
        ((|df| |List| (|NonNegativeInteger|)) (|lcf| F) (|lv| |List| |VarSet|)
         ($ |Polynomial| F))
        (SPROG
         ((|g| (|Polynomial| F)) (#1=#:G383 NIL) (|dd| NIL) (#2=#:G384 NIL)
          (|v| NIL))
         (SEQ
          (LETT |g| (SPADCALL |lcf| (QREFELT $ 112)) . #3=(|IDEAL;monompol|))
          (SEQ (LETT |v| NIL . #3#) (LETT #2# |lv| . #3#) (LETT |dd| NIL . #3#)
               (LETT #1# |df| . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |dd| (CAR #1#) . #3#) NIL)
                     (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |g|
                       (SPADCALL |g| (SPADCALL |v| (QREFELT $ 114)) |dd|
                                 (QREFELT $ 115))
                       . #3#)))
               (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |g|)))) 

(SDEFUN |IDEAL;relationsIdeal;LSt;30|
        ((|listf| |List| |DPoly|)
         ($ |SuchThat| (|List| (|Polynomial| F))
          (|List| (|Equation| (|Polynomial| F)))))
        (SPROG
         ((|solsn| (|List| (|Polynomial| F))) (|g| #1=(|Polynomial| F))
          (#2=#:G404 NIL) (#3=#:G403 #4=(|Polynomial| F)) (#5=#:G405 #4#)
          (#6=#:G427 NIL) (|p| NIL) (|j| NIL)
          (|vdq| (|Vector| (|NonNegativeInteger|))) (|q| (|nPoly|)) (|lcq| (F))
          (|dq| (|nExponent|)) (#7=#:G426 NIL) (|lf| (|List| |nPoly|))
          (#8=#:G413 NIL) (|n| (|Expon|))
          (|leq| (|List| (|Equation| (|Polynomial| F)))) (#9=#:G424 NIL)
          (#10=#:G425 NIL) (|pol| #1#) (#11=#:G423 NIL)
          (|npol| (|List| (|Polynomial| F))) (#12=#:G422 NIL) (|v| NIL)
          (#13=#:G421 NIL) (|lp| (|List| (|Polynomial| F))) (|f| (|DPoly|))
          (|lcf| (F)) (|df| (|List| (|NonNegativeInteger|)))
          (|vec2| (|Vector| (|NonNegativeInteger|))) (#14=#:G420 NIL) (|i| NIL)
          (|gp|
           (CATEGORY |package|
            (SIGNATURE |groebner| ((|List| |nPoly|) (|List| |nPoly|)))
            (SIGNATURE |groebner|
             ((|List| |nPoly|) (|List| |nPoly|) (|String|)))
            (SIGNATURE |groebner|
             ((|List| |nPoly|) (|List| |nPoly|) (|String|) (|String|)))
            (IF (|has| F (|Field|))
                (SIGNATURE |normalForm| (|nPoly| |nPoly| (|List| |nPoly|)))
                |noBranch|)))
          (|nPoly|
           (|Join| (|FiniteAbelianMonoidRing| F |nExponent|)
                   (|VariablesCommuteWithCoefficients|)
                   (CATEGORY |domain|
                    (IF (|has| F (|IntegralDomain|))
                        (IF (|has| |nExponent| (|CancellationAbelianMonoid|))
                            (SIGNATURE |fmecg| ($ $ |nExponent| F $))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| F (|canonicalUnitNormal|))
                        (ATTRIBUTE (|canonicalUnitNormal|))
                        |noBranch|)
                    (IF (|has| F (|Comparable|))
                        (ATTRIBUTE (|Comparable|))
                        |noBranch|))))
          (|nExponent|
           (|Join| (|SetCategory|)
                   (CATEGORY |domain|
                    (IF (|has| |Expon| (|Finite|))
                        (IF (|has| |DirP| (|Finite|))
                            (ATTRIBUTE (|Finite|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|Monoid|))
                        (IF (|has| |DirP| (|Monoid|))
                            (ATTRIBUTE (|Monoid|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|AbelianMonoid|))
                        (IF (|has| |DirP| (|AbelianMonoid|))
                            (ATTRIBUTE (|AbelianMonoid|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|CancellationAbelianMonoid|))
                        (IF (|has| |DirP| (|CancellationAbelianMonoid|))
                            (ATTRIBUTE (|CancellationAbelianMonoid|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|Group|))
                        (IF (|has| |DirP| (|Group|))
                            (ATTRIBUTE (|Group|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|AbelianGroup|))
                        (IF (|has| |DirP| (|AbelianGroup|))
                            (ATTRIBUTE (|AbelianGroup|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|OrderedAbelianMonoidSup|))
                        (IF (|has| |DirP| (|OrderedAbelianMonoidSup|))
                            (ATTRIBUTE (|OrderedAbelianMonoidSup|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| |Expon| (|OrderedSet|))
                        (IF (|has| |DirP| (|OrderedSet|))
                            (ATTRIBUTE (|OrderedSet|))
                            |noBranch|)
                        |noBranch|)
                    (SIGNATURE |construct| ($ |Expon| |DirP|))
                    (SIGNATURE |first| (|Expon| $))
                    (SIGNATURE |second| (|DirP| $)))))
          (|DirP| (|DirectProductCategory| |nf| (|NonNegativeInteger|)))
          (|lv1| (|List| |VarSet1|)) (#15=#:G392 NIL) (#16=#:G419 NIL)
          (|vv| NIL) (#17=#:G418 NIL)
          (|VarSet1|
           (|Join| (|OrderedFinite|) (|ConvertibleTo| (|Symbol|))
                   (|ConvertibleTo| (|InputForm|))
                   (|ConvertibleTo| (|Pattern| (|Float|)))
                   (|ConvertibleTo| (|Pattern| (|Integer|)))
                   (CATEGORY |domain|
                    (SIGNATURE |variable| ((|Union| $ "failed") (|Symbol|))))))
          (|nvar| (|List| (|Symbol|))) (#18=#:G417 NIL)
          (|vl| (|List| (|Symbol|))) (#19=#:G416 NIL) (#20=#:G415 NIL)
          (|lvint| #21=(|List| |VarSet|)) (#22=#:G386 NIL) (#23=#:G385 #21#)
          (#24=#:G387 #21#) (#25=#:G414 NIL) (|nf| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |listf|) (SPADCALL NIL NIL (QREFELT $ 119)))
                (#26='T
                 (SEQ
                  (LETT |nf| (LENGTH |listf|)
                        . #27=(|IDEAL;relationsIdeal;LSt;30|))
                  (LETT |lvint|
                        (PROGN
                         (LETT #22# NIL . #27#)
                         (SEQ (LETT |g| NIL . #27#) (LETT #25# |listf| . #27#)
                              G190
                              (COND
                               ((OR (ATOM #25#)
                                    (PROGN (LETT |g| (CAR #25#) . #27#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #24# (SPADCALL |g| (QREFELT $ 36))
                                       . #27#)
                                 (COND
                                  (#22#
                                   (LETT #23#
                                         (SPADCALL #23# #24# (QREFELT $ 96))
                                         . #27#))
                                  ('T
                                   (PROGN
                                    (LETT #23# #24# . #27#)
                                    (LETT #22# 'T . #27#)))))))
                              (LETT #25# (CDR #25#) . #27#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#22# #23#)
                               (#26# (|IdentityError| '|setUnion|))))
                        . #27#)
                  (LETT |vl|
                        (PROGN
                         (LETT #20# NIL . #27#)
                         (SEQ (LETT |vv| NIL . #27#) (LETT #19# |lvint| . #27#)
                              G190
                              (COND
                               ((OR (ATOM #19#)
                                    (PROGN (LETT |vv| (CAR #19#) . #27#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #20#
                                      (CONS (SPADCALL |vv| (QREFELT $ 114))
                                            #20#)
                                      . #27#)))
                              (LETT #19# (CDR #19#) . #27#) (GO G190) G191
                              (EXIT (NREVERSE #20#))))
                        . #27#)
                  (LETT |nvar|
                        (PROGN
                         (LETT #18# NIL . #27#)
                         (SEQ (LETT |i| 1 . #27#) G190
                              (COND ((|greater_SI| |i| |nf|) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #18#
                                      (CONS (SPADCALL (QREFELT $ 120)) #18#)
                                      . #27#)))
                              (LETT |i| (|inc_SI| |i|) . #27#) (GO G190) G191
                              (EXIT (NREVERSE #18#))))
                        . #27#)
                  (LETT |VarSet1|
                        (|OrderedVariableList|
                         (SPADCALL |vl| |nvar| (QREFELT $ 122)))
                        . #27#)
                  (LETT |lv1|
                        (PROGN
                         (LETT #17# NIL . #27#)
                         (SEQ (LETT |vv| NIL . #27#) (LETT #16# |nvar| . #27#)
                              G190
                              (COND
                               ((OR (ATOM #16#)
                                    (PROGN (LETT |vv| (CAR #16#) . #27#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #17#
                                      (CONS
                                       (PROG2
                                           (LETT #15#
                                                 (SPADCALL |vv|
                                                           (|compiledLookupCheck|
                                                            '|variable|
                                                            (LIST
                                                             (LIST '|Union| '$
                                                                   '"failed")
                                                             (LIST '|Symbol|))
                                                            |VarSet1|))
                                                 . #27#)
                                           (QCDR #15#)
                                         (|check_union| (QEQCAR #15# 0)
                                                        |VarSet1| #15#))
                                       #17#)
                                      . #27#)))
                              (LETT #16# (CDR #16#) . #27#) (GO G190) G191
                              (EXIT (NREVERSE #17#))))
                        . #27#)
                  (LETT |DirP| (|DirectProduct| |nf| (|NonNegativeInteger|))
                        . #27#)
                  (LETT |nExponent| (|Product| (QREFELT $ 7) |DirP|) . #27#)
                  (LETT |nPoly| (|PolynomialRing| (QREFELT $ 6) |nExponent|)
                        . #27#)
                  (LETT |gp|
                        (|GroebnerPackage| (QREFELT $ 6) |nExponent| |VarSet1|
                                           |nPoly|)
                        . #27#)
                  (LETT |lf| NIL . #27#) (LETT |lp| NIL . #27#)
                  (SEQ (LETT |i| 1 . #27#) (LETT |f| NIL . #27#)
                       (LETT #14# |listf| . #27#) G190
                       (COND
                        ((OR (ATOM #14#)
                             (PROGN (LETT |f| (CAR #14#) . #27#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |vec2| (SPADCALL |nf| 0 (QREFELT $ 124)) . #27#)
                        (SPADCALL |vec2| |i| 1 (QREFELT $ 125))
                        (LETT |g|
                              (SPADCALL
                               (|compiledLookupCheck| '|Zero| (LIST '$)
                                                      |nPoly|))
                              . #27#)
                        (LETT |pol| (|spadConstant| $ 126) . #27#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (SPADCALL |f| (|spadConstant| $ 13)
                                          (QREFELT $ 127)))
                               (GO G191)))
                             (SEQ
                              (LETT |df|
                                    (SPADCALL
                                     (SPADCALL |f|
                                               (SPADCALL |f| (QREFELT $ 24))
                                               (QREFELT $ 110))
                                     |lvint| (QREFELT $ 129))
                                    . #27#)
                              (LETT |lcf| (SPADCALL |f| (QREFELT $ 17)) . #27#)
                              (LETT |pol|
                                    (SPADCALL |pol|
                                              (|IDEAL;monompol| |df| |lcf|
                                               |lvint| $)
                                              (QREFELT $ 130))
                                    . #27#)
                              (LETT |g|
                                    (SPADCALL |g|
                                              (SPADCALL |lcf|
                                                        (SPADCALL
                                                         (SPADCALL |f|
                                                                   (QREFELT $
                                                                            20))
                                                         (SPADCALL
                                                          (|compiledLookupCheck|
                                                           '|Zero| (LIST '$)
                                                           |DirP|))
                                                         (|compiledLookupCheck|
                                                          '|construct|
                                                          (LIST '$
                                                                (|devaluate|
                                                                 (ELT $ 7))
                                                                (|devaluate|
                                                                 |DirP|))
                                                          |nExponent|))
                                                        (|compiledLookupCheck|
                                                         '|monomial|
                                                         (LIST '$
                                                               (|devaluate|
                                                                (ELT $ 6))
                                                               (|devaluate|
                                                                |nExponent|))
                                                         |nPoly|))
                                              (|compiledLookupCheck| '+
                                                                     (LIST '$
                                                                           '$
                                                                           '$)
                                                                     |nPoly|))
                                    . #27#)
                              (EXIT
                               (LETT |f| (SPADCALL |f| (QREFELT $ 24))
                                     . #27#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (LETT |lp| (CONS |pol| |lp|) . #27#)
                        (EXIT
                         (LETT |lf|
                               (CONS
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 49)
                                           (SPADCALL (|spadConstant| $ 19)
                                                     (SPADCALL |vec2|
                                                               (|compiledLookupCheck|
                                                                '|directProduct|
                                                                (LIST '$
                                                                      (LIST
                                                                       '|Vector|
                                                                       (LIST
                                                                        '|NonNegativeInteger|)))
                                                                |DirP|))
                                                     (|compiledLookupCheck|
                                                      '|construct|
                                                      (LIST '$
                                                            (|devaluate|
                                                             (ELT $ 7))
                                                            (|devaluate|
                                                             |DirP|))
                                                      |nExponent|))
                                           (|compiledLookupCheck| '|monomial|
                                                                  (LIST '$
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              6))
                                                                        (|devaluate|
                                                                         |nExponent|))
                                                                  |nPoly|))
                                 |g|
                                 (|compiledLookupCheck| '- (LIST '$ '$ '$)
                                                        |nPoly|))
                                |lf|)
                               . #27#)))
                       (LETT #14#
                             (PROG1 (CDR #14#)
                               (LETT |i| (|inc_SI| |i|) . #27#))
                             . #27#)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |npol|
                        (PROGN
                         (LETT #13# NIL . #27#)
                         (SEQ (LETT |v| NIL . #27#) (LETT #12# |nvar| . #27#)
                              G190
                              (COND
                               ((OR (ATOM #12#)
                                    (PROGN (LETT |v| (CAR #12#) . #27#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #13#
                                      (CONS (SPADCALL |v| (QREFELT $ 138))
                                            #13#)
                                      . #27#)))
                              (LETT #12# (CDR #12#) . #27#) (GO G190) G191
                              (EXIT (NREVERSE #13#))))
                        . #27#)
                  (LETT |leq|
                        (PROGN
                         (LETT #11# NIL . #27#)
                         (SEQ (LETT |pol| NIL . #27#)
                              (LETT #10# (REVERSE |lp|) . #27#)
                              (LETT |p| NIL . #27#) (LETT #9# |npol| . #27#)
                              G190
                              (COND
                               ((OR (ATOM #9#)
                                    (PROGN (LETT |p| (CAR #9#) . #27#) NIL)
                                    (ATOM #10#)
                                    (PROGN (LETT |pol| (CAR #10#) . #27#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #11#
                                      (CONS
                                       (SPADCALL |p| |pol| (QREFELT $ 139))
                                       #11#)
                                      . #27#)))
                              (LETT #9#
                                    (PROG1 (CDR #9#)
                                      (LETT #10# (CDR #10#) . #27#))
                                    . #27#)
                              (GO G190) G191 (EXIT (NREVERSE #11#))))
                        . #27#)
                  (LETT |lf|
                        (SPADCALL |lf|
                                  (|compiledLookupCheck| '|groebner|
                                                         (LIST
                                                          (LIST '|List|
                                                                (|devaluate|
                                                                 |nPoly|))
                                                          (LIST '|List|
                                                                (|devaluate|
                                                                 |nPoly|)))
                                                         |gp|))
                        . #27#)
                  (SEQ
                   (EXIT
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |lf| NIL
                                      (|compiledLookupCheck| '~=
                                                             (LIST
                                                              (LIST '|Boolean|)
                                                              '$ '$)
                                                             (|List|
                                                              |nPoly|))))
                           (GO G191)))
                         (SEQ (LETT |q| (|SPADfirst| |lf|) . #27#)
                              (LETT |dq|
                                    (SPADCALL |q|
                                              (|compiledLookupCheck| '|degree|
                                                                     (LIST
                                                                      (|devaluate|
                                                                       |nExponent|)
                                                                      '$)
                                                                     |nPoly|))
                                    . #27#)
                              (LETT |n|
                                    (SPADCALL |dq|
                                              (|compiledLookupCheck| '|first|
                                                                     (LIST
                                                                      (|devaluate|
                                                                       (ELT $
                                                                            7))
                                                                      '$)
                                                                     |nExponent|))
                                    . #27#)
                              (COND
                               ((SPADCALL |n| (|spadConstant| $ 19)
                                          (QREFELT $ 140))
                                (PROGN
                                 (LETT #8# |$NoValue| . #27#)
                                 (GO #28=#:G402))))
                              (EXIT (LETT |lf| (CDR |lf|) . #27#)))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #28# (EXIT #8#))
                  (LETT |solsn| NIL . #27#)
                  (SEQ (LETT |q| NIL . #27#) (LETT #7# |lf| . #27#) G190
                       (COND
                        ((OR (ATOM #7#)
                             (PROGN (LETT |q| (CAR #7#) . #27#) NIL))
                         (GO G191)))
                       (SEQ (LETT |g| (|spadConstant| $ 126) . #27#)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (SPADCALL |q|
                                              (SPADCALL
                                               (|compiledLookupCheck| '|Zero|
                                                                      (LIST '$)
                                                                      |nPoly|))
                                              (|compiledLookupCheck| '~=
                                                                     (LIST
                                                                      (LIST
                                                                       '|Boolean|)
                                                                      '$ '$)
                                                                     |nPoly|)))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |dq|
                                        (SPADCALL |q|
                                                  (|compiledLookupCheck|
                                                   '|degree|
                                                   (LIST
                                                    (|devaluate| |nExponent|)
                                                    '$)
                                                   |nPoly|))
                                        . #27#)
                                  (LETT |lcq|
                                        (SPADCALL |q|
                                                  (|compiledLookupCheck|
                                                   '|leadingCoefficient|
                                                   (LIST
                                                    (|devaluate| (ELT $ 6)) '$)
                                                   |nPoly|))
                                        . #27#)
                                  (LETT |q|
                                        (SPADCALL |q|
                                                  (|compiledLookupCheck|
                                                   '|reductum| (LIST '$ '$)
                                                   |nPoly|))
                                        . #27#)
                                  (LETT |vdq|
                                        (SPADCALL |dq|
                                                  (|compiledLookupCheck|
                                                   '|second|
                                                   (LIST (|devaluate| |DirP|)
                                                         '$)
                                                   |nExponent|))
                                        . #27#)
                                  (EXIT
                                   (LETT |g|
                                         (SPADCALL |g|
                                                   (SPADCALL |lcq|
                                                             (PROGN
                                                              (LETT #2# NIL
                                                                    . #27#)
                                                              (SEQ
                                                               (LETT |j| 1
                                                                     . #27#)
                                                               (LETT |p| NIL
                                                                     . #27#)
                                                               (LETT #6# |npol|
                                                                     . #27#)
                                                               G190
                                                               (COND
                                                                ((OR (ATOM #6#)
                                                                     (PROGN
                                                                      (LETT |p|
                                                                            (CAR
                                                                             #6#)
                                                                            . #27#)
                                                                      NIL))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (PROGN
                                                                  (LETT #5#
                                                                        (SPADCALL
                                                                         |p|
                                                                         (SPADCALL
                                                                          |vdq|
                                                                          |j|
                                                                          (QREFELT
                                                                           $
                                                                           141))
                                                                         (QREFELT
                                                                          $
                                                                          142))
                                                                        . #27#)
                                                                  (COND
                                                                   (#2#
                                                                    (LETT #3#
                                                                          (SPADCALL
                                                                           #3#
                                                                           #5#
                                                                           (QREFELT
                                                                            $
                                                                            143))
                                                                          . #27#))
                                                                   ('T
                                                                    (PROGN
                                                                     (LETT #3#
                                                                           #5#
                                                                           . #27#)
                                                                     (LETT #2#
                                                                           'T
                                                                           . #27#)))))))
                                                               (LETT #6#
                                                                     (PROG1
                                                                         (CDR
                                                                          #6#)
                                                                       (LETT
                                                                        |j|
                                                                        (|inc_SI|
                                                                         |j|)
                                                                        . #27#))
                                                                     . #27#)
                                                               (GO G190) G191
                                                               (EXIT NIL))
                                                              (COND (#2# #3#)
                                                                    ('T
                                                                     (|spadConstant|
                                                                      $ 144))))
                                                             (QREFELT $ 145))
                                                   (QREFELT $ 130))
                                         . #27#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT (LETT |solsn| (CONS |g| |solsn|) . #27#)))
                       (LETT #7# (CDR #7#) . #27#) (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL |solsn| |leq| (QREFELT $ 119))))))))) 

(SDEFUN |IDEAL;coerce;L$;31| ((|Id| |List| |DPoly|) ($ $)) (CONS |Id| 'NIL)) 

(SDEFUN |IDEAL;coerce;$Of;32| ((I $) ($ |OutputForm|))
        (SPROG ((|Idl| (|List| |DPoly|)))
               (SEQ (LETT |Idl| (QCAR I) |IDEAL;coerce;$Of;32|)
                    (EXIT
                     (COND
                      ((NULL |Idl|)
                       (SPADCALL (LIST (|spadConstant| $ 13)) (QREFELT $ 148)))
                      ('T (SPADCALL |Idl| (QREFELT $ 148)))))))) 

(SDEFUN |IDEAL;ideal;L$;33| ((|Id| |List| |DPoly|) ($ $))
        (SPROG ((#1=#:G434 NIL) (|f| NIL) (#2=#:G433 NIL))
               (SEQ
                (CONS
                 (PROGN
                  (LETT #2# NIL . #3=(|IDEAL;ideal;L$;33|))
                  (SEQ (LETT |f| NIL . #3#) (LETT #1# |Id| . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |f| (|spadConstant| $ 13) (QREFELT $ 127))
                           (LETT #2# (CONS |f| #2#) . #3#)))))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 'NIL)))) 

(SDEFUN |IDEAL;groebnerIdeal;L$;34| ((|Id| |List| |DPoly|) ($ $))
        (CONS |Id| 'T)) 

(PUT '|IDEAL;generators;$L;35| '|SPADreplace| 'QCAR) 

(SDEFUN |IDEAL;generators;$L;35| ((I $) ($ |List| |DPoly|)) (QCAR I)) 

(PUT '|IDEAL;groebner?;$B;36| '|SPADreplace| 'QCDR) 

(SDEFUN |IDEAL;groebner?;$B;36| ((I $) ($ |Boolean|)) (QCDR I)) 

(SDEFUN |IDEAL;one?;$B;37| ((I $) ($ |Boolean|))
        (SPADCALL (|spadConstant| $ 50) I (QREFELT $ 71))) 

(SDEFUN |IDEAL;zero?;$B;38| ((I $) ($ |Boolean|))
        (NULL (QCAR (SPADCALL I (QREFELT $ 68))))) 

(DECLAIM (NOTINLINE |PolynomialIdeal;|)) 

(DEFUN |PolynomialIdeal| (&REST #1=#:G441)
  (SPROG NIL
         (PROG (#2=#:G442)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialIdeal|)
                                               '|domainEqualList|)
                    . #3=(|PolynomialIdeal|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PolynomialIdeal;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PolynomialIdeal|)))))))))) 

(DEFUN |PolynomialIdeal;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialIdeal|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|PolynomialIdeal| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 158) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#3|
                                                       '(|ConvertibleTo|
                                                         (|Symbol|)))))
                    . #1#))
    (|haddProp| |$ConstructorCache| '|PolynomialIdeal|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10
              (|Record| (|:| |idl| (|List| |#4|)) (|:| |isGr| (|Boolean|))))
    (QSETREFV $ 11 (|Product| (|NonNegativeInteger|) |#2|))
    (QSETREFV $ 12 (|PolynomialRing| |#1| (QREFELT $ 11)))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 146
                 (CONS (|dispatchFunction| |IDEAL;relationsIdeal;LSt;30|)
                       $)))))
    $))) 

(MAKEPROP '|PolynomialIdeal| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|Rep| '|newExpon| '|newPoly|
              (0 . |Zero|) (|Boolean|) (4 . =) (10 . |Zero|)
              (14 . |leadingCoefficient|) (19 . |Zero|) (23 . |Zero|)
              (27 . |degree|) (|NonNegativeInteger|) (32 . |construct|)
              (38 . |monomial|) (44 . |reductum|) (49 . +) (55 . =)
              (61 . |degree|) (66 . |first|) (71 . ~=) (77 . |reductum|)
              (82 . |leadingCoefficient|) (87 . |second|) (92 . |monomial|)
              (98 . +) (|List| 8) (104 . |variables|) (109 . =)
              (|SparseUnivariatePolynomial| $) (115 . |univariate|)
              (|SparseUnivariatePolynomial| 9) (121 . |leadingCoefficient|)
              (|Union| $ '"failed") (126 . |exquo|) (|List| 12)
              (|GroebnerPackage| 6 11 8 12) (132 . |groebner|)
              (137 . |member?|) (143 . |ground?|) (148 . |One|) (152 . |One|)
              (|Integer|) (156 . |elt|) (|List| 35) (162 . |concat|) (|List| 9)
              |IDEAL;generators;$L;35| (168 . >) (174 . |One|)
              (178 . |position|) (184 . |delete|) (190 . |#|)
              (|Mapping| 14 35 35) (195 . |sort|) (201 . ~=)
              (207 . |setDifference|) |IDEAL;in?;2$B;12| |IDEAL;=;2$B;10|
              |IDEAL;groebner;2$;13| (|GroebnerPackage| 6 7 8 9)
              (213 . |normalForm|) |IDEAL;element?;DPoly$B;11| (219 . |zero?|)
              (224 . |groebner|) (229 . |One|) (233 . -) (239 . *)
              (245 . |concat|) |IDEAL;intersect;3$;14| (|List| $)
              |IDEAL;intersect;L$;15| |IDEAL;coerce;L$;31|
              (|GroebnerInternalPackage| 6 7 8 9) (251 . |minGbasis|)
              |IDEAL;quotient;$DPoly$;16| |IDEAL;ideal;L$;33|
              |IDEAL;quotient;3$;17| (256 . |concat|) |IDEAL;+;3$;18| (262 . *)
              |IDEAL;*;3$;19| |IDEAL;^;$Nni$;20| (268 . |One|) (|Fraction| 51)
              (272 . |One|) |IDEAL;saturate;$DPoly$;21| (276 . |setUnion|)
              (282 . |monomial|) (289 . |eval|) |IDEAL;saturate;$DPolyL$;22|
              (296 . =) (|Union| 8 '"failed") (302 . |mainVariable|)
              |IDEAL;zeroDim?;$LB;23| |IDEAL;zeroDim?;$B;24|
              (307 . |normalForm|) |IDEAL;inRadical?;DPoly$B;25|
              |IDEAL;leadingIdeal;2$;28| |IDEAL;dimension;$LI;26|
              |IDEAL;dimension;$I;27| (313 . -) (|Polynomial| 6)
              (319 . |coerce|) (|Symbol|) (324 . |convert|) (329 . |monomial|)
              (|List| 111) (|List| 132) (|SuchThat| 116 117)
              (336 . |construct|) (342 . |new|) (|List| 113) (346 . |concat|)
              (|Vector| 21) (352 . |new|) (358 . |setelt!|) (365 . |Zero|)
              (369 . ~=) (|List| 21) (375 . |degree|) (381 . +) (387 . |Zero|)
              (|Equation| 111) (391 . |Zero|) (|Product| 21 7) (395 . |Zero|)
              (|IndexedExponents| 113) (399 . |Zero|) (403 . |coerce|)
              (408 . =) (414 . =) (420 . |elt|) (426 . ^) (432 . *)
              (438 . |One|) (442 . *) (448 . |relationsIdeal|) (|OutputForm|)
              (453 . |coerce|) |IDEAL;coerce;$Of;32|
              |IDEAL;groebnerIdeal;L$;34| |IDEAL;groebner?;$B;36|
              |IDEAL;one?;$B;37| |IDEAL;zero?;$B;38|
              (|Record| (|:| |mval| (|Matrix| 6)) (|:| |invmval| (|Matrix| 6))
                        (|:| |genIdeal| $))
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 458 |zeroDim?| 464 |zero?| 475 |saturate| 480 |relationsIdeal|
              493 |quotient| 498 |one?| 510 |leadingIdeal| 515 |latex| 520
              |intersect| 525 |inRadical?| 536 |in?| 542 |ideal| 548
              |hashUpdate!| 553 |hash| 559 |groebnerIdeal| 564 |groebner?| 569
              |groebner| 574 |generators| 579 |generalPosition| 584 |element?|
              590 |dimension| 596 |coerce| 607 |backOldPos| 617 ^ 622 = 628 +
              634 * 640)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 147))
                        (|makeByteWordVec2| 157
                                            '(0 9 0 13 2 9 14 0 0 15 0 12 0 16
                                              1 9 6 0 17 0 6 0 18 0 7 0 19 1 9
                                              7 0 20 2 11 0 21 7 22 2 12 0 6 11
                                              23 1 9 0 0 24 2 12 0 0 0 25 2 12
                                              14 0 0 26 1 12 11 0 27 1 11 21 0
                                              28 2 21 14 0 0 29 1 12 0 0 30 1
                                              12 6 0 31 1 11 7 0 32 2 9 0 6 7
                                              33 2 9 0 0 0 34 1 9 35 0 36 2 35
                                              14 0 0 37 2 9 38 0 8 39 1 40 9 0
                                              41 2 9 42 0 0 43 1 45 44 44 46 2
                                              35 14 8 0 47 1 9 14 0 48 0 6 0 49
                                              0 9 0 50 2 35 8 0 51 52 2 53 0 0
                                              0 54 2 21 14 0 0 57 0 21 0 58 2
                                              35 51 8 0 59 2 35 0 0 51 60 1 35
                                              21 0 61 2 53 0 62 0 63 2 35 14 0
                                              0 64 2 35 0 0 0 65 2 69 9 9 55 70
                                              1 9 14 0 72 1 69 55 55 73 0 12 0
                                              74 2 12 0 0 0 75 2 12 0 0 0 76 2
                                              44 0 0 0 77 1 82 55 55 83 2 55 0
                                              0 0 87 2 9 0 0 0 89 0 11 0 92 0
                                              93 0 94 2 35 0 0 0 96 3 9 0 0 8
                                              21 97 3 9 0 0 35 79 98 2 55 14 0
                                              0 100 1 9 101 0 102 2 45 12 12 44
                                              105 2 9 0 0 0 110 1 111 0 6 112 1
                                              8 113 0 114 3 111 0 0 113 21 115
                                              2 118 0 116 117 119 0 113 0 120 2
                                              121 0 0 0 122 2 123 0 21 21 124 3
                                              123 21 0 51 21 125 0 111 0 126 2
                                              9 14 0 0 127 2 9 128 0 35 129 2
                                              111 0 0 0 130 0 11 0 131 0 132 0
                                              133 0 134 0 135 0 136 0 137 1 111
                                              0 113 138 2 132 0 111 111 139 2 7
                                              14 0 0 140 2 123 21 0 51 141 2
                                              111 0 0 21 142 2 111 0 0 0 143 0
                                              111 0 144 2 111 0 6 0 145 1 0 118
                                              55 146 1 55 147 0 148 2 0 14 0 0
                                              1 1 0 14 0 104 2 0 14 0 35 103 1
                                              0 14 0 153 3 0 0 0 9 35 99 2 0 0
                                              0 9 95 1 1 118 55 146 2 0 0 0 9
                                              84 2 0 0 0 0 86 1 0 14 0 152 1 0
                                              0 0 107 1 0 155 0 1 1 0 0 79 80 2
                                              0 0 0 0 78 2 0 14 9 0 106 2 0 14
                                              0 0 66 1 0 0 55 85 2 0 157 157 0
                                              1 1 0 156 0 1 1 0 0 55 150 1 0 14
                                              0 151 1 0 0 0 68 1 0 55 0 56 2 0
                                              154 0 35 1 2 0 14 9 0 71 1 0 51 0
                                              109 2 0 51 0 35 108 1 0 0 55 81 1
                                              0 147 0 149 1 0 0 154 1 2 0 0 0
                                              21 91 2 0 14 0 0 67 2 0 0 0 0 88
                                              2 0 0 0 0 90)))))
           '|lookupComplete|)) 
