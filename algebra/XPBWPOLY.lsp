
(SDEFUN |XPBWPOLY;outForm|
        ((|t|
          (|Record| (|:| |k| (|PoincareBirkhoffWittLyndonBasis| |VarSet|))
                    (|:| |c| R)))
         (% (|OutputForm|)))
        (COND
         ((SPADCALL (QCDR |t|) (|spadConstant| % 9) (QREFELT % 11))
          (SPADCALL (QCAR |t|) (QREFELT % 14)))
         ((SPADCALL (QCAR |t|) (|spadConstant| % 15) (QREFELT % 16))
          (SPADCALL (QCDR |t|) (QREFELT % 17)))
         ('T
          (SPADCALL (SPADCALL (QCDR |t|) (QREFELT % 17))
                    (SPADCALL (QCAR |t|) (QREFELT % 14)) (QREFELT % 18))))) 

(SDEFUN |XPBWPOLY;prod1|
        ((|b| (|PoincareBirkhoffWittLyndonBasis| |VarSet|)) (|p| (%)) (% (%)))
        (SPROG
         ((#1=#:G23 NIL) (#2=#:G22 (%)) (#3=#:G24 (%)) (#4=#:G26 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #4# |p|) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|)
                                   (|XPBWPOLY;prod| |b| (QCAR |t|) %)
                                   (QREFELT % 19)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 20))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| % 21))))))) 

(SDEFUN |XPBWPOLY;prod2|
        ((|p| (%)) (|b| (|PoincareBirkhoffWittLyndonBasis| |VarSet|)) (% (%)))
        (SPROG
         ((#1=#:G28 NIL) (#2=#:G27 (%)) (#3=#:G29 (%)) (#4=#:G31 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #4# |p|) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|)
                                   (|XPBWPOLY;prod| (QCAR |t|) |b| %)
                                   (QREFELT % 19)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 20))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| % 21))))))) 

(SDEFUN |XPBWPOLY;prod11|
        ((|b| (|PoincareBirkhoffWittLyndonBasis| |VarSet|)) (|p| (%))
         (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((#1=#:G33 NIL) (#2=#:G32 (%)) (#3=#:G34 (%)) (#4=#:G37 NIL) (|t| NIL)
          (|limit| (|Integer|)))
         (SEQ (LETT |limit| (- |n| (SPADCALL |b| (QREFELT % 23))))
              (EXIT
               (PROGN
                (LETT #1# NIL)
                (SEQ (LETT |t| NIL) (LETT #4# |p|) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((<= (SPADCALL (QCAR |t|) (QREFELT % 23)) |limit|)
                         (PROGN
                          (LETT #3#
                                (SPADCALL (QCDR |t|)
                                          (|XPBWPOLY;prod| |b| (QCAR |t|) %)
                                          (QREFELT % 19)))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 20))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))))
                     (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) ('T (|spadConstant| % 21)))))))) 

(SDEFUN |XPBWPOLY;prod22|
        ((|p| (%)) (|b| (|PoincareBirkhoffWittLyndonBasis| |VarSet|))
         (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((#1=#:G39 NIL) (#2=#:G38 (%)) (#3=#:G40 (%)) (#4=#:G43 NIL) (|t| NIL)
          (|limit| (|Integer|)))
         (SEQ (LETT |limit| (- |n| (SPADCALL |b| (QREFELT % 23))))
              (EXIT
               (PROGN
                (LETT #1# NIL)
                (SEQ (LETT |t| NIL) (LETT #4# |p|) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((<= (SPADCALL (QCAR |t|) (QREFELT % 23)) |limit|)
                         (PROGN
                          (LETT #3#
                                (SPADCALL (QCDR |t|)
                                          (|XPBWPOLY;prod| (QCAR |t|) |b| %)
                                          (QREFELT % 19)))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 20))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))))
                     (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) ('T (|spadConstant| % 21)))))))) 

(SDEFUN |XPBWPOLY;prod|
        ((|g| (|PoincareBirkhoffWittLyndonBasis| |VarSet|))
         (|d| (|PoincareBirkhoffWittLyndonBasis| |VarSet|)) (% (%)))
        (COND
         ((SPADCALL |d| (|spadConstant| % 15) (QREFELT % 16))
          (SPADCALL (|spadConstant| % 9) |g| (QREFELT % 25)))
         ((SPADCALL |g| (|spadConstant| % 15) (QREFELT % 16))
          (SPADCALL (|spadConstant| % 9) |d| (QREFELT % 25)))
         ('T
          (|XPBWPOLY;process| (REVERSE (SPADCALL |g| (QREFELT % 27)))
           (SPADCALL |d| (QREFELT % 29)) (CDR (SPADCALL |d| (QREFELT % 27)))
           %)))) 

(SDEFUN |XPBWPOLY;Dexpand|
        ((|b| (|PoincareBirkhoffWittLyndonBasis| |VarSet|))
         (% (|XDistributedPolynomial| |VarSet| R)))
        (SPROG
         ((#1=#:G46 NIL) (#2=#:G45 #3=(|XDistributedPolynomial| |VarSet| R))
          (#4=#:G47 #3#) (#5=#:G49 NIL) (|l| NIL))
         (SEQ
          (COND
           ((SPADCALL |b| (|spadConstant| % 15) (QREFELT % 16))
            (|spadConstant| % 31))
           (#6='T
            (PROGN
             (LETT #1# NIL)
             (SEQ (LETT |l| NIL) (LETT #5# (SPADCALL |b| (QREFELT % 27))) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |l| (CAR #5#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (SPADCALL (SPADCALL |l| (QREFELT % 33))
                                     (QREFELT % 34)))
                     (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT % 35))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                  (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# (|spadConstant| % 31))))))))) 

(SDEFUN |XPBWPOLY;Rexpand|
        ((|b| (|PoincareBirkhoffWittLyndonBasis| |VarSet|))
         (% (|XRecursivePolynomial| |VarSet| R)))
        (SPROG
         ((#1=#:G51 NIL) (#2=#:G50 #3=(|XRecursivePolynomial| |VarSet| R))
          (#4=#:G52 #3#) (#5=#:G54 NIL) (|l| NIL))
         (SEQ
          (COND
           ((SPADCALL |b| (|spadConstant| % 15) (QREFELT % 16))
            (|spadConstant| % 37))
           (#6='T
            (PROGN
             (LETT #1# NIL)
             (SEQ (LETT |l| NIL) (LETT #5# (SPADCALL |b| (QREFELT % 27))) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |l| (CAR #5#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (SPADCALL (SPADCALL |l| (QREFELT % 33))
                                     (QREFELT % 38)))
                     (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT % 39))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                  (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# (|spadConstant| % 37))))))))) 

(SDEFUN |XPBWPOLY;mirror1|
        ((|b| (|PoincareBirkhoffWittLyndonBasis| |VarSet|)) (% (%)))
        (SPROG ((|lp| (|LiePolynomial| |VarSet| R)))
               (SEQ
                (COND
                 ((SPADCALL |b| (|spadConstant| % 15) (QREFELT % 16))
                  (|spadConstant| % 24))
                 ('T
                  (SEQ
                   (LETT |lp|
                         (SPADCALL (SPADCALL |b| (QREFELT % 29))
                                   (QREFELT % 33)))
                   (LETT |lp| (SPADCALL |lp| (QREFELT % 40)))
                   (EXIT
                    (SPADCALL
                     (|XPBWPOLY;mirror1| (SPADCALL |b| (QREFELT % 41)) %)
                     (SPADCALL |lp| (QREFELT % 42)) (QREFELT % 43))))))))) 

(SDEFUN |XPBWPOLY;process|
        ((|gauche| (|List| (|LyndonWord| |VarSet|)))
         (|x| (|LyndonWord| |VarSet|))
         (|droite| (|List| (|LyndonWord| |VarSet|))) (% (%)))
        (SPROG
         ((|r2| (%)) (#1=#:G70 NIL) (#2=#:G69 (%)) (#3=#:G71 (%))
          (#4=#:G79 NIL) (|t| NIL) (|r1| (%)) (#5=#:G67 NIL) (#6=#:G66 (%))
          (#7=#:G68 (%)) (#8=#:G78 NIL) (#9=#:G64 NIL) (#10=#:G63 (%))
          (#11=#:G65 (%)) (#12=#:G77 NIL) (|fd| (|LyndonWord| |VarSet|))
          (|rd| (|List| (|LyndonWord| |VarSet|))) (#13=#:G60 NIL)
          (#14=#:G59 (%)) (#15=#:G61 (%)) (#16=#:G76 NIL)
          (|p| (|LiePolynomial| |VarSet| R)))
         (SEQ
          (COND
           ((NULL |gauche|)
            (SPADCALL (|spadConstant| % 9) (CONS |x| |droite|) (QREFELT % 25)))
           ((NULL (SPADCALL (|SPADfirst| |gauche|) |x| (QREFELT % 44)))
            (SPADCALL (|spadConstant| % 9)
                      (SPADCALL (REVERSE |gauche|) (CONS |x| |droite|)
                                (QREFELT % 45))
                      (QREFELT % 25)))
           ('T
            (SEQ
             (LETT |p| (SPADCALL (|SPADfirst| |gauche|) |x| (QREFELT % 46)))
             (EXIT
              (COND
               ((NULL |droite|)
                (SEQ
                 (LETT |r1|
                       (PROGN
                        (LETT #13# NIL)
                        (SEQ (LETT |t| NIL)
                             (LETT #16# (SPADCALL |p| (QREFELT % 49))) G190
                             (COND
                              ((OR (ATOM #16#)
                                   (PROGN (LETT |t| (CAR #16#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT #15#
                                      (SPADCALL (QCDR |t|)
                                                (|XPBWPOLY;process|
                                                 (CDR |gauche|) (QCAR |t|)
                                                 |droite| %)
                                                (QREFELT % 19)))
                                (COND
                                 (#13#
                                  (LETT #14#
                                        (SPADCALL #14# #15# (QREFELT % 20))))
                                 ('T
                                  (PROGN (LETT #14# #15#) (LETT #13# 'T)))))))
                             (LETT #16# (CDR #16#)) (GO G190) G191 (EXIT NIL))
                        (COND (#13# #14#) (#17='T (|spadConstant| % 21)))))
                 (LETT |r2|
                       (|XPBWPOLY;process| (CDR |gauche|) |x|
                        (SPADCALL (|SPADfirst| |gauche|) (QREFELT % 50)) %))
                 (EXIT (SPADCALL |r1| |r2| (QREFELT % 20)))))
               (#17#
                (SEQ (LETT |rd| (CDR |droite|))
                     (LETT |fd| (|SPADfirst| |droite|))
                     (LETT |r1|
                           (PROGN
                            (LETT #9# NIL)
                            (SEQ (LETT |t| NIL)
                                 (LETT #12# (SPADCALL |p| (QREFELT % 49))) G190
                                 (COND
                                  ((OR (ATOM #12#)
                                       (PROGN (LETT |t| (CAR #12#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #11#
                                          (SPADCALL (QCDR |t|)
                                                    (|XPBWPOLY;process|
                                                     (SPADCALL (QCAR |t|)
                                                               (QREFELT % 50))
                                                     |fd| |rd| %)
                                                    (QREFELT % 19)))
                                    (COND
                                     (#9#
                                      (LETT #10#
                                            (SPADCALL #10# #11#
                                                      (QREFELT % 20))))
                                     ('T
                                      (PROGN
                                       (LETT #10# #11#)
                                       (LETT #9# 'T)))))))
                                 (LETT #12# (CDR #12#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#9# #10#) (#17# (|spadConstant| % 21)))))
                     (LETT |r1|
                           (PROGN
                            (LETT #5# NIL)
                            (SEQ (LETT |t| NIL) (LETT #8# |r1|) G190
                                 (COND
                                  ((OR (ATOM #8#)
                                       (PROGN (LETT |t| (CAR #8#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #7#
                                          (SPADCALL (QCDR |t|)
                                                    (|XPBWPOLY;process|
                                                     (CDR |gauche|)
                                                     (SPADCALL (QCAR |t|)
                                                               (QREFELT % 29))
                                                     (CDR
                                                      (SPADCALL (QCAR |t|)
                                                                (QREFELT %
                                                                         27)))
                                                     %)
                                                    (QREFELT % 19)))
                                    (COND
                                     (#5#
                                      (LETT #6#
                                            (SPADCALL #6# #7# (QREFELT % 20))))
                                     ('T
                                      (PROGN (LETT #6# #7#) (LETT #5# 'T)))))))
                                 (LETT #8# (CDR #8#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#5# #6#) (#17# (|spadConstant| % 21)))))
                     (LETT |r2|
                           (|XPBWPOLY;process|
                            (LIST (|SPADfirst| |gauche|) |x|) |fd| |rd| %))
                     (LETT |r2|
                           (PROGN
                            (LETT #1# NIL)
                            (SEQ (LETT |t| NIL) (LETT #4# |r2|) G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN (LETT |t| (CAR #4#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #3#
                                          (SPADCALL (QCDR |t|)
                                                    (|XPBWPOLY;process|
                                                     (CDR |gauche|)
                                                     (SPADCALL (QCAR |t|)
                                                               (QREFELT % 29))
                                                     (CDR
                                                      (SPADCALL (QCAR |t|)
                                                                (QREFELT %
                                                                         27)))
                                                     %)
                                                    (QREFELT % 19)))
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #3# (QREFELT % 20))))
                                     ('T
                                      (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                                 (LETT #4# (CDR #4#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#1# #2#) (#17# (|spadConstant| % 21)))))
                     (EXIT (SPADCALL |r1| |r2| (QREFELT % 20))))))))))))) 

(SDEFUN |XPBWPOLY;One;%;11| ((% (%)))
        (SPADCALL (|spadConstant| % 9) (|spadConstant| % 15) (QREFELT % 25))) 

(SDEFUN |XPBWPOLY;coerce;R%;12| ((|r| (R)) (% (%)))
        (LIST (CONS (|spadConstant| % 15) |r|))) 

(SDEFUN |XPBWPOLY;coerce;%Of;13| ((|p| (%)) (% (|OutputForm|)))
        (SPROG ((|le| (|List| (|OutputForm|))) (#1=#:G89 NIL) (|rec| NIL))
               (SEQ
                (COND
                 ((NULL |p|) (SPADCALL (|spadConstant| % 52) (QREFELT % 17)))
                 ('T
                  (SEQ (LETT |le| NIL)
                       (SEQ (LETT |rec| NIL) (LETT #1# |p|) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |rec| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |le|
                                    (CONS (|XPBWPOLY;outForm| |rec| %) |le|))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                       (EXIT (SPADCALL (ELT % 53) |le| (QREFELT % 56))))))))) 

(SDEFUN |XPBWPOLY;coerce;VarSet%;14| ((|v| (|VarSet|)) (% (%)))
        (SPADCALL (|spadConstant| % 9) (SPADCALL |v| (QREFELT % 58))
                  (QREFELT % 25))) 

(SDEFUN |XPBWPOLY;coerce;Lp%;15| ((|p| (|LiePolynomial| |VarSet| R)) (% (%)))
        (SPROG ((#1=#:G96 NIL) (|t| NIL) (#2=#:G95 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |t| NIL) (LETT #1# (SPADCALL |p| (QREFELT % 49)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS (SPADCALL (QCAR |t|) (QREFELT % 60))
                                     (QCDR |t|))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |XPBWPOLY;coerce;%Xdp;16|
        ((|p| (%)) (% (|XDistributedPolynomial| |VarSet| R)))
        (SPROG
         ((#1=#:G98 NIL) (#2=#:G97 #3=(|XDistributedPolynomial| |VarSet| R))
          (#4=#:G99 #3#) (#5=#:G101 NIL) (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #5# |p|) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL (QCDR |t|) (|XPBWPOLY;Dexpand| (QCAR |t|) %)
                                   (QREFELT % 61)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT % 62))))
                         ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| % 63))))))) 

(SDEFUN |XPBWPOLY;coerce;%Xrp;17|
        ((|p| (%)) (% (|XRecursivePolynomial| |VarSet| R)))
        (SPROG
         ((#1=#:G103 NIL) (#2=#:G102 #3=(|XRecursivePolynomial| |VarSet| R))
          (#4=#:G104 #3#) (#5=#:G106 NIL) (|t| NIL))
         (SEQ
          (COND
           ((SPADCALL |p| (|spadConstant| % 21) (QREFELT % 65))
            (|spadConstant| % 66))
           (#6='T
            (PROGN
             (LETT #1# NIL)
             (SEQ (LETT |t| NIL) (LETT #5# |p|) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (SPADCALL (QCDR |t|)
                                     (|XPBWPOLY;Rexpand| (QCAR |t|) %)
                                     (QREFELT % 67)))
                     (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT % 68))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                  (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# (|spadConstant| % 66))))))))) 

(SDEFUN |XPBWPOLY;constant?;%B;18| ((|p| (%)) (% (|Boolean|)))
        (COND ((NULL |p|) 'T)
              ('T
               (SPADCALL (SPADCALL |p| (QREFELT % 70)) (|spadConstant| % 15)
                         (QREFELT % 16))))) 

(SDEFUN |XPBWPOLY;constant;%R;19| ((|p| (%)) (% (R)))
        (COND
         ((OR (NULL |p|)
              (NULL
               (SPADCALL (QCAR (SPADCALL |p| '|last| (QREFELT % 74)))
                         (|spadConstant| % 15) (QREFELT % 16))))
          (|spadConstant| % 52))
         ('T (QCDR (SPADCALL |p| '|last| (QREFELT % 74)))))) 

(SDEFUN |XPBWPOLY;quasiRegular?;%B;20| ((|p| (%)) (% (|Boolean|)))
        (COND ((SPADCALL |p| (|spadConstant| % 21) (QREFELT % 65)) 'T)
              ('T
               (SPADCALL (QCAR (SPADCALL |p| '|last| (QREFELT % 74)))
                         (|spadConstant| % 15) (QREFELT % 76))))) 

(SDEFUN |XPBWPOLY;quasiRegular;2%;21| ((|p| (%)) (% (%)))
        (COND
         ((OR (SPADCALL |p| (|spadConstant| % 21) (QREFELT % 65))
              (NULL
               (SPADCALL (QCAR (SPADCALL |p| '|last| (QREFELT % 74)))
                         (|spadConstant| % 15) (QREFELT % 16))))
          |p|)
         ('T (SPADCALL |p| (LENGTH |p|) (QREFELT % 79))))) 

(SDEFUN |XPBWPOLY;*;3%;22| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((#1=#:G116 NIL) (#2=#:G115 (%)) (#3=#:G117 (%)) (#4=#:G120 NIL)
          (|t| NIL))
         (SEQ
          (COND
           ((SPADCALL |y| (|spadConstant| % 21) (QREFELT % 65))
            (|spadConstant| % 21))
           (#5='T
            (PROGN
             (LETT #1# NIL)
             (SEQ (LETT |t| NIL) (LETT #4# |x|) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #3#
                           (SPADCALL (QCDR |t|)
                                     (|XPBWPOLY;prod1| (QCAR |t|) |y| %)
                                     (QREFELT % 19)))
                     (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 20))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                  (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#5# (|spadConstant| % 21))))))))) 

(SDEFUN |XPBWPOLY;varList;%L;23| ((|p| (%)) (% (|List| |VarSet|)))
        (SPROG
         ((|lv| #1=(|List| |VarSet|)) (#2=#:G122 NIL) (#3=#:G121 #1#)
          (#4=#:G123 #1#) (#5=#:G126 NIL) (|b| NIL))
         (SEQ
          (LETT |lv|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |b| NIL) (LETT #5# |p|) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |b| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# (SPADCALL (QCAR |b|) (QREFELT % 82)))
                         (COND
                          (#2# (LETT #3# (SPADCALL #3# #4# (QREFELT % 83))))
                          ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                      (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) ('T (|IdentityError| '|setUnion|)))))
          (EXIT (SPADCALL |lv| (QREFELT % 84)))))) 

(SDEFUN |XPBWPOLY;degree;%Nni;24| ((|p| (%)) (% (|NonNegativeInteger|)))
        (COND
         ((SPADCALL |p| (|spadConstant| % 21) (QREFELT % 65))
          (|error| "null polynomial"))
         ('T (SPADCALL (SPADCALL |p| (QREFELT % 70)) (QREFELT % 23))))) 

(SDEFUN |XPBWPOLY;trunc;%Nni%;25|
        ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (COND
         ((OR (SPADCALL |p| (|spadConstant| % 21) (QREFELT % 65))
              (NULL (> (SPADCALL |p| (QREFELT % 86)) |n|)))
          |p|)
         ('T (SPADCALL (SPADCALL |p| (QREFELT % 87)) |n| (QREFELT % 88))))) 

(SDEFUN |XPBWPOLY;product;2%Nni%;26|
        ((|x| (%)) (|y| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((#1=#:G131 NIL) (#2=#:G130 (%)) (#3=#:G132 (%)) (#4=#:G134 NIL)
          (|t| NIL))
         (SEQ
          (COND
           ((OR (SPADCALL |x| (|spadConstant| % 21) (QREFELT % 65))
                (SPADCALL |y| (|spadConstant| % 21) (QREFELT % 65)))
            (|spadConstant| % 21))
           ('T
            (PROGN
             (LETT #1# NIL)
             (SEQ (LETT |t| NIL) (LETT #4# |x|) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #3#
                           (SPADCALL (QCDR |t|)
                                     (|XPBWPOLY;prod11| (QCAR |t|) |y| |n| %)
                                     (QREFELT % 19)))
                     (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 20))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                  (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) ('T (|spadConstant| % 21))))))))) 

(SDEFUN |XPBWPOLY;exp;%Nni%;27|
        ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|r| (%)) (|s| (%)) (|k2| (R)) (|k1| (|Fraction| (|Integer|)))
          (#1=#:G141 NIL) (|i| NIL))
         (SEQ
          (COND
           ((SPADCALL |p| (|spadConstant| % 21) (QREFELT % 65))
            (|spadConstant| % 24))
           ((NULL (SPADCALL |p| (QREFELT % 77)))
            (|error| "a proper polynomial is required"))
           ('T
            (SEQ (LETT |s| (|spadConstant| % 24))
                 (LETT |r| (|spadConstant| % 24))
                 (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ (LETT |k1| (SPADCALL 1 |i| (QREFELT % 91)))
                           (LETT |k2|
                                 (SPADCALL |k1| (|spadConstant| % 9)
                                           (QREFELT % 92)))
                           (LETT |s|
                                 (SPADCALL |k2|
                                           (SPADCALL |p| |s| |n|
                                                     (QREFELT % 89))
                                           (QREFELT % 19)))
                           (EXIT (LETT |r| (SPADCALL |r| |s| (QREFELT % 20)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT |r|))))))) 

(SDEFUN |XPBWPOLY;log;%Nni%;28|
        ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|r| (%)) (|s| (%)) (|k2| (R)) (|k1| (|Fraction| (|Integer|)))
          (#1=#:G148 NIL) (|i| NIL) (|p1| (%)))
         (SEQ
          (COND
           ((SPADCALL |p| (|spadConstant| % 24) (QREFELT % 65))
            (|spadConstant| % 21))
           ('T
            (SEQ
             (LETT |p1| (SPADCALL (|spadConstant| % 24) |p| (QREFELT % 94)))
             (COND
              ((NULL (SPADCALL |p1| (QREFELT % 77)))
               (EXIT (|error| "constant term ~= 1, impossible log"))))
             (LETT |s| (SPADCALL (|spadConstant| % 24) (QREFELT % 95)))
             (LETT |r| (|spadConstant| % 21))
             (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ (LETT |k1| (SPADCALL 1 |i| (QREFELT % 91)))
                       (LETT |k2|
                             (SPADCALL |k1| (|spadConstant| % 9)
                                       (QREFELT % 92)))
                       (LETT |s| (SPADCALL |p1| |s| |n| (QREFELT % 89)))
                       (EXIT
                        (LETT |r|
                              (SPADCALL (SPADCALL |k2| |s| (QREFELT % 19)) |r|
                                        (QREFELT % 20)))))
                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
             (EXIT |r|))))))) 

(SDEFUN |XPBWPOLY;LiePolyIfCan;%U;29|
        ((|p| (%)) (% (|Union| (|LiePolynomial| |VarSet| R) "failed")))
        (SPROG
         ((|lt|
           (|List| (|Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R))))
          (#1=#:G166 NIL) (|t| NIL) (#2=#:G165 NIL) (#3=#:G153 NIL)
          (#4=#:G152 #5=(|Boolean|)) (#6=#:G154 #5#) (#7=#:G164 NIL))
         (SEQ
          (COND
           ((SPADCALL |p| (|spadConstant| % 21) (QREFELT % 65))
            (CONS 0 (|spadConstant| % 97)))
           ((PROGN
             (LETT #3# NIL)
             (SEQ (LETT |t| NIL) (LETT #7# |p|) G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |t| (CAR #7#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #6# (SPADCALL (QCAR |t|) (QREFELT % 98)))
                     (COND (#3# (LETT #4# (COND (#4# #6#) ('T NIL))))
                           ('T (PROGN (LETT #4# #6#) (LETT #3# 'T)))))))
                  (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
             (COND (#3# #4#) (#8='T 'T)))
            (SEQ
             (LETT |lt|
                   (PROGN
                    (LETT #2# NIL)
                    (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (CONS (SPADCALL (QCAR |t|) (QREFELT % 99))
                                        (QCDR |t|))
                                  #2#))))
                         (LETT #1# (CDR #1#)) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))
             (EXIT (CONS 0 |lt|))))
           (#8# (CONS 1 "failed")))))) 

(SDEFUN |XPBWPOLY;mirror;2%;30| ((|p| (%)) (% (%)))
        (SPROG
         ((#1=#:G168 NIL) (#2=#:G167 (%)) (#3=#:G169 (%)) (#4=#:G171 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #4# |p|) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|) (|XPBWPOLY;mirror1| (QCAR |t|) %)
                                   (QREFELT % 19)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 20))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| % 21))))))) 

(DECLAIM (NOTINLINE |XPBWPolynomial;|)) 

(DEFUN |XPBWPolynomial| (&REST #1=#:G186)
  (SPROG NIL
         (PROG (#2=#:G187)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|XPBWPolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |XPBWPolynomial;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|XPBWPolynomial|)))))))))) 

(DEFUN |XPBWPolynomial;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G185 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|XPBWPolynomial| DV$1 DV$2))
    (LETT % (GETREFV 116))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#2|
                                                       '(|noZeroDivisors|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|PoincareBirkhoffWittLyndonBasis|
                                                |#1|)
                                               '(|Comparable|)))
                                        (AND
                                         (|HasCategory| |#2| '(|Comparable|))
                                         #1#)
                                        (|HasCategory| |#2|
                                                       '(|Module|
                                                         (|Fraction|
                                                          (|Integer|))))))))
    (|haddProp| |$ConstructorCache| '|XPBWPolynomial| (LIST DV$1 DV$2)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8
              (|List|
               (|Record| (|:| |k| (|PoincareBirkhoffWittLyndonBasis| |#1|))
                         (|:| |c| |#2|))))
    (COND
     ((|testBitVector| |pv$| 5)
      (PROGN
       (QSETREFV % 93 (CONS (|dispatchFunction| |XPBWPOLY;exp;%Nni%;27|) %))
       (QSETREFV % 96 (CONS (|dispatchFunction| |XPBWPOLY;log;%Nni%;28|) %)))))
    %))) 

(MAKEPROP '|XPBWPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 7 13) (|local| |#1|)
              (|local| |#2|) '|Rep| (0 . |One|) (|Boolean|) (4 . =)
              (|OutputForm|) (|PoincareBirkhoffWittLyndonBasis| 6)
              (10 . |coerce|) (15 . |One|) (19 . =) (25 . |coerce|) (30 . *)
              (36 . *) (42 . +) (48 . |Zero|) (|NonNegativeInteger|)
              (52 . |length|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |XPBWPOLY;One;%;11|) %))
              (57 . |monomial|) (|List| 28) (63 . |listOfTerms|)
              (|LyndonWord| 6) (68 . |first|) (|XDistributedPolynomial| 6 7)
              (73 . |One|) (|LiePolynomial| 6 7) (77 . |LiePoly|)
              (82 . |coerce|) (87 . *) (|XRecursivePolynomial| 6 7)
              (93 . |One|) (97 . |coerce|) (102 . *) (108 . |mirror|)
              (113 . |rest|) |XPBWPOLY;coerce;Lp%;15| |XPBWPOLY;*;3%;22|
              (118 . |lexico|) (124 . |append|) (130 . |construct|)
              (|Record| (|:| |k| 28) (|:| |c| 7)) (|List| 47)
              (136 . |listOfTerms|) (141 . |list|) |XPBWPOLY;coerce;R%;12|
              (146 . |Zero|) (150 . +) (|Mapping| 12 12 12) (|List| 12)
              (156 . |reduce|) |XPBWPOLY;coerce;%Of;13| (162 . |coerce|)
              |XPBWPOLY;coerce;VarSet%;14| (167 . |coerce|) (172 . *) (178 . +)
              (184 . |Zero|) |XPBWPOLY;coerce;%Xdp;16| (188 . =) (194 . |Zero|)
              (198 . *) (204 . +) |XPBWPOLY;coerce;%Xrp;17|
              (210 . |leadingSupport|) |XPBWPOLY;constant?;%B;18|
              (|Record| (|:| |k| 13) (|:| |c| 7)) '"last" (215 . |elt|)
              |XPBWPOLY;constant;%R;19| (221 . ~=)
              |XPBWPOLY;quasiRegular?;%B;20| (|Integer|) (227 . |delete|)
              |XPBWPOLY;quasiRegular;2%;21| (|List| 6) (233 . |varList|)
              (238 . |setUnion|) (244 . |sort|) |XPBWPOLY;varList;%L;23|
              |XPBWPOLY;degree;%Nni;24| (249 . |reductum|)
              |XPBWPOLY;trunc;%Nni%;25| |XPBWPOLY;product;2%Nni%;26|
              (|Fraction| 78) (254 . /) (260 . *) (266 . |exp|) (272 . -)
              (278 . -) (283 . |log|) (289 . |Zero|) (293 . |retractable?|)
              (298 . |retract|) (|Union| 32 '"failed")
              |XPBWPOLY;LiePolyIfCan;%U;29| |XPBWPOLY;mirror;2%;30| (|String|)
              (|PositiveInteger|) (|Union| % '"failed") (|FreeMonoid| 6)
              (|Union| 7 '#1="failed") (|Union| 106 '#1#)
              (|Record| (|:| |k| 106) (|:| |c| 7)) (|Mapping| 7 7) (|List| %)
              (|List| 13) (|List| 7) (|List| 72) (|Mapping| 7 13))
           '#(~= 303 |zero?| 309 |varList| 314 |trunc| 319 |support| 325
              |subtractIfCan| 330 |smaller?| 336 |sh| 342 |sample| 354 |rquo|
              358 |rightRecip| 376 |rightPower| 381 |retractIfCan| 393
              |retract| 403 |reductum| 413 |recip| 418 |quasiRegular?| 423
              |quasiRegular| 428 |product| 433 |plenaryPower| 440 |opposite?|
              446 |one?| 452 |numberOfMonomials| 457 |monomials| 462
              |monomial?| 467 |monomial| 472 |mirror| 484 |mindegTerm| 489
              |mindeg| 494 |maxdeg| 499 |map| 504 |lquo| 510 |log| 528
              |listOfTerms| 534 |linearExtend| 539 |leftRecip| 545 |leftPower|
              550 |leadingTerm| 562 |leadingSupport| 567 |leadingMonomial| 572
              |leadingCoefficient| 577 |latex| 582 |exp| 587 |degree| 593
              |constructOrdered| 598 |construct| 603 |constant?| 608 |constant|
              613 |commutator| 618 |coerce| 624 |coefficients| 664
              |coefficient| 669 |coef| 675 |characteristic| 687 |associator|
              691 |antiCommutator| 698 |annihilate?| 704 ^ 710 |Zero| 722 |One|
              726 |LiePolyIfCan| 730 = 735 - 741 + 752 * 758)
           'NIL
           (CONS
            (|makeByteWordVec2| 4
                                '(0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 4 0 0 0 0 0 2 0 0 0 0 0))
            (CONS
             '#(NIL NIL NIL |Algebra&| NIL |NonAssociativeAlgebra&| NIL
                |FreeModuleCategory&| |Rng&| |Module&| NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL NIL
                |AbelianSemiGroup&| |Magma&| |SetCategory&| |RetractableTo&|
                |RetractableTo&| NIL NIL |BasicType&| NIL NIL NIL)
             (CONS
              '#((|XPolynomialsCat| 6 7) (|XFreeAlgebra| 6 7) (|XAlgebra| 7)
                 (|Algebra| 7) (|Ring|) (|NonAssociativeAlgebra| 7)
                 (|SemiRing|)
                 (|FreeModuleCategory| 7 (|PoincareBirkhoffWittLyndonBasis| 6))
                 (|Rng|) (|Module| 7) (|SemiRng|)
                 (|IndexedDirectProductCategory| 7
                                                 (|PoincareBirkhoffWittLyndonBasis|
                                                  6))
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|BiModule| 7 7)
                 (|IndexedProductCategory| 7
                                           (|PoincareBirkhoffWittLyndonBasis|
                                            6))
                 (|LeftModule| $$) (|RightModule| $$) (|NonAssociativeRng|)
                 (|RightModule| 7) (|LeftModule| 7)
                 (|AbelianProductCategory| 7) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|Comparable|)
                 (|AbelianSemiGroup|) (|Magma|) (|SetCategory|)
                 (|RetractableTo| 7) (|RetractableTo| (|FreeMonoid| 6))
                 (|noZeroDivisors|) (|CoercibleTo| 12) (|BasicType|)
                 (|unitsKnown|) (|CoercibleFrom| 7)
                 (|CoercibleFrom| (|FreeMonoid| 6)))
              (|makeByteWordVec2| 115
                                  '(0 7 0 9 2 7 10 0 0 11 1 13 12 0 14 0 13 0
                                    15 2 13 10 0 0 16 1 7 12 0 17 2 12 0 0 0 18
                                    2 0 0 7 0 19 2 0 0 0 0 20 0 0 0 21 1 13 22
                                    0 23 2 0 0 7 13 25 1 13 26 0 27 1 13 28 0
                                    29 0 30 0 31 1 32 0 28 33 1 32 30 0 34 2 30
                                    0 0 0 35 0 36 0 37 1 32 36 0 38 2 36 0 0 0
                                    39 1 32 0 0 40 1 13 0 0 41 2 28 10 0 0 44 2
                                    26 0 0 0 45 2 32 0 28 28 46 1 32 48 0 49 1
                                    26 0 28 50 0 7 0 52 2 12 0 0 0 53 2 55 12
                                    54 0 56 1 13 0 6 58 1 13 0 28 60 2 30 0 7 0
                                    61 2 30 0 0 0 62 0 30 0 63 2 0 10 0 0 65 0
                                    36 0 66 2 36 0 7 0 67 2 36 0 0 0 68 1 0 13
                                    0 70 2 8 72 0 73 74 2 13 10 0 0 76 2 8 0 0
                                    78 79 1 13 81 0 82 2 81 0 0 0 83 1 81 0 0
                                    84 1 0 0 0 87 2 90 0 78 78 91 2 7 0 90 0 92
                                    2 0 0 0 22 93 2 0 0 0 0 94 1 0 0 0 95 2 0 0
                                    0 22 96 0 32 0 97 1 13 10 0 98 1 13 28 0 99
                                    2 0 10 0 0 1 1 0 10 0 1 1 0 81 0 85 2 0 0 0
                                    22 88 1 0 112 0 1 2 0 105 0 0 1 2 4 10 0 0
                                    1 2 1 0 0 22 1 2 1 0 0 0 1 0 0 0 1 2 0 0 0
                                    6 1 2 0 0 0 106 1 2 0 0 0 0 1 1 0 105 0 1 2
                                    0 0 0 104 1 2 0 0 0 22 1 1 0 107 0 1 1 0
                                    108 0 1 1 0 7 0 1 1 0 106 0 1 1 3 0 0 87 1
                                    0 105 0 1 1 0 10 0 77 1 0 0 0 80 3 0 0 0 0
                                    22 89 2 1 0 0 104 1 2 0 10 0 0 1 1 0 10 0 1
                                    1 0 22 0 1 1 0 111 0 1 1 0 10 0 1 2 0 0 7
                                    106 1 2 0 0 7 13 25 1 0 0 0 102 1 0 109 0 1
                                    1 0 106 0 1 1 0 106 0 1 2 0 0 110 0 1 2 0 0
                                    0 6 1 2 0 0 0 106 1 2 0 0 0 0 1 2 5 0 0 22
                                    96 1 0 114 0 1 2 1 7 115 0 1 1 0 105 0 1 2
                                    0 0 0 104 1 2 0 0 0 22 1 1 3 72 0 1 1 3 13
                                    0 70 1 3 0 0 1 1 3 7 0 1 1 0 103 0 1 2 5 0
                                    0 22 93 1 0 22 0 86 1 3 0 114 1 1 0 0 114 1
                                    1 0 10 0 71 1 0 7 0 75 2 0 0 0 0 1 1 0 12 0
                                    57 1 0 0 78 1 1 0 0 7 51 1 0 0 106 1 1 0 0
                                    6 59 1 0 0 32 42 1 0 30 0 64 1 0 36 0 69 1
                                    0 113 0 1 2 0 7 0 13 1 2 0 7 0 106 1 2 0 7
                                    0 0 1 0 0 22 1 3 0 0 0 0 0 1 2 0 0 0 0 1 2
                                    0 10 0 0 1 2 0 0 0 104 1 2 0 0 0 22 1 0 0 0
                                    21 0 0 0 24 1 0 100 0 101 2 0 10 0 0 65 1 0
                                    0 0 95 2 0 0 0 0 94 2 0 0 0 0 20 2 0 0 104
                                    0 1 2 0 0 0 0 43 2 0 0 78 0 1 2 0 0 22 0 1
                                    2 0 0 0 7 1 2 0 0 7 0 19 2 0 0 6 0 1)))))
           '|lookupComplete|)) 
