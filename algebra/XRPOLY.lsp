
(PUT '|XRPOLY;construct| '|SPADreplace| '(XLAM (|lt|) |lt|)) 

(SDEFUN |XRPOLY;construct|
        ((|lt| (|List| (|Record| (|:| |k| |VarSet|) (|:| |c| $))))
         ($ (|FreeModule| $ |VarSet|)))
        |lt|) 

(SDEFUN |XRPOLY;=;2$B;2| ((|p1| ($)) (|p2| ($)) ($ (|Boolean|)))
        (COND
         ((QEQCAR |p1| 0)
          (COND
           ((QEQCAR |p2| 0) (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 10)))
           (#1='T NIL)))
         ((QEQCAR |p2| 0) NIL)
         (#1#
          (COND
           ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 10))
            (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT $ 12)))
           (#1# NIL))))) 

(SDEFUN |XRPOLY;monom;FmR$;3| ((|w| (|FreeMonoid| |VarSet|)) (|r| (R)) ($ ($)))
        (COND
         ((SPADCALL |r| (QCDR (|spadConstant| $ 14)) (QREFELT $ 10))
          (|spadConstant| $ 14))
         ('T (SPADCALL |r| (SPADCALL |w| (QREFELT $ 17)) (QREFELT $ 18))))) 

(SDEFUN |XRPOLY;rquo;3$;4| ((|p1| ($)) (|p2| ($)) ($ ($)))
        (SPROG
         ((|x| (|FreeModule| $ |VarSet|)) (|a| ($)) (#1=#:G154 NIL) (|t| NIL)
          (#2=#:G153 NIL))
         (SEQ
          (COND ((QEQCAR |p2| 0) (SPADCALL |p1| (QCDR |p2|) (QREFELT $ 20)))
                ((QEQCAR |p1| 0)
                 (SPADCALL |p1| (CONS 0 (QCAR (QCDR |p2|))) (QREFELT $ 21)))
                ('T
                 (SEQ
                  (LETT |x|
                        (SPADCALL
                         (PROGN
                          (LETT #2# NIL)
                          (SEQ (LETT |t| NIL)
                               (LETT #1#
                                     (SPADCALL (QCDR (QCDR |p1|))
                                               (QREFELT $ 24)))
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |t| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL
                                    (LETT |a|
                                          (SPADCALL (QCDR |t|) |p2|
                                                    (QREFELT $ 25)))
                                    (|spadConstant| $ 14) (QREFELT $ 26))
                                   (LETT #2#
                                         (CONS (CONS (QCAR |t|) |a|) #2#))))))
                               (LETT #1# (CDR #1#)) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT $ 27)))
                  (EXIT
                   (|XRPOLY;simplifie|
                    (CONS (SPADCALL |p1| |p2| (QREFELT $ 28)) |x|) $)))))))) 

(SDEFUN |XRPOLY;trunc;$Nni$;5| ((|p| ($)) (|n| (|NonNegativeInteger|)) ($ ($)))
        (SPROG
         ((|x| (|FreeModule| $ |VarSet|))
          (|lt| (|List| (|Record| (|:| |k| |VarSet|) (|:| |c| $)))) (|r| ($))
          (#1=#:G164 NIL) (|t| NIL) (#2=#:G163 NIL)
          (|n1| (|NonNegativeInteger|)) (#3=#:G158 NIL))
         (SEQ
          (COND
           ((OR (EQL |n| 0) (QEQCAR |p| 0))
            (CONS 0 (SPADCALL |p| (QREFELT $ 29))))
           ('T
            (SEQ
             (LETT |n1|
                   (PROG1 (LETT #3# (- |n| 1))
                     (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #3#)))
             (LETT |lt|
                   (PROGN
                    (LETT #2# NIL)
                    (SEQ (LETT |t| NIL)
                         (LETT #1# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24)))
                         G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL
                              (LETT |r|
                                    (SPADCALL (QCDR |t|) |n1| (QREFELT $ 33)))
                              (|spadConstant| $ 14) (QREFELT $ 26))
                             (LETT #2# (CONS (CONS (QCAR |t|) |r|) #2#))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))
             (LETT |x| (SPADCALL |lt| (QREFELT $ 27)))
             (EXIT
              (|XRPOLY;simplifie| (CONS (SPADCALL |p| (QREFELT $ 29)) |x|)
               $)))))))) 

(SDEFUN |XRPOLY;unexpand;Xdp$;6|
        ((|p| (|XDistributedPolynomial| |VarSet| R)) ($ ($)))
        (SPROG
         ((|x| (|FreeModule| $ |VarSet|))
          (|r| (|XDistributedPolynomial| |VarSet| R)) (#1=#:G174 NIL) (|v| NIL)
          (#2=#:G173 NIL) (|vl| (|List| |VarSet|)))
         (SEQ
          (COND
           ((SPADCALL |p| (QREFELT $ 35))
            (CONS 0 (SPADCALL |p| (QREFELT $ 36))))
           ('T
            (SEQ
             (LETT |vl|
                   (SPADCALL (ELT $ 37) (SPADCALL |p| (QREFELT $ 39))
                             (QREFELT $ 41)))
             (LETT |x|
                   (SPADCALL
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |v| NIL) (LETT #1# |vl|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (LETT |r| (SPADCALL |p| |v| (QREFELT $ 42)))
                               (|spadConstant| $ 43) (QREFELT $ 44))
                              (LETT #2#
                                    (CONS
                                     (CONS |v| (SPADCALL |r| (QREFELT $ 45)))
                                     #2#))))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (QREFELT $ 27)))
             (EXIT (CONS 1 (CONS (SPADCALL |p| (QREFELT $ 36)) |x|))))))))) 

(SDEFUN |XRPOLY;sh;$Nni$;7| ((|p| ($)) (|n| (|NonNegativeInteger|)) ($ ($)))
        (SPROG
         ((|lt| (|List| (|Record| (|:| |k| |VarSet|) (|:| |c| $))))
          (#1=#:G184 NIL) (|t| NIL) (#2=#:G183 NIL) (|p1| ($))
          (|n1| (|NonNegativeInteger|)) (#3=#:G178 NIL))
         (SEQ
          (COND ((EQL |n| 0) (|spadConstant| $ 30))
                ((QEQCAR |p| 0)
                 (SPADCALL (CONS 0 (QCDR |p|)) |n| (QREFELT $ 46)))
                ('T
                 (SEQ
                  (LETT |n1|
                        (PROG1 (LETT #3# (- |n| 1))
                          (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #3#)))
                  (LETT |p1|
                        (SPADCALL |n| (SPADCALL |p| |n1| (QREFELT $ 47))
                                  (QREFELT $ 48)))
                  (LETT |lt|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |t| NIL)
                              (LETT #1#
                                    (SPADCALL (QCDR (QCDR |p|))
                                              (QREFELT $ 24)))
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |t| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (CONS (QCAR |t|)
                                             (SPADCALL (QCDR |t|) |p1|
                                                       (QREFELT $ 49)))
                                       #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))
                  (EXIT
                   (CONS 1
                         (CONS
                          (QCDR
                           (SPADCALL (CONS 0 (QCAR (QCDR |p|))) |n|
                                     (QREFELT $ 46)))
                          (SPADCALL |lt| (QREFELT $ 27))))))))))) 

(SDEFUN |XRPOLY;sh;3$;8| ((|p1| ($)) (|p2| ($)) ($ ($)))
        (SPROG
         ((|y| #1=(|FreeModule| $ |VarSet|)) (#2=#:G193 NIL) (|t| NIL)
          (#3=#:G192 NIL) (|x| #1#) (#4=#:G191 NIL) (#5=#:G190 NIL)
          (|lt2| #6=(|List| (|Record| (|:| |k| |VarSet|) (|:| |c| $))))
          (|lt1| #6#))
         (SEQ
          (COND ((QEQCAR |p1| 0) (SPADCALL (QCDR |p1|) |p2| (QREFELT $ 18)))
                ((QEQCAR |p2| 0) (SPADCALL |p1| (QCDR |p2|) (QREFELT $ 20)))
                ('T
                 (SEQ (LETT |lt1| (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 24)))
                      (LETT |lt2| (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 24)))
                      (LETT |x|
                            (SPADCALL
                             (PROGN
                              (LETT #5# NIL)
                              (SEQ (LETT |t| NIL) (LETT #4# |lt1|) G190
                                   (COND
                                    ((OR (ATOM #4#)
                                         (PROGN (LETT |t| (CAR #4#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #5#
                                           (CONS
                                            (CONS (QCAR |t|)
                                                  (SPADCALL (QCDR |t|) |p2|
                                                            (QREFELT $ 49)))
                                            #5#))))
                                   (LETT #4# (CDR #4#)) (GO G190) G191
                                   (EXIT (NREVERSE #5#))))
                             (QREFELT $ 27)))
                      (LETT |y|
                            (SPADCALL
                             (PROGN
                              (LETT #3# NIL)
                              (SEQ (LETT |t| NIL) (LETT #2# |lt2|) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |t| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #3#
                                           (CONS
                                            (CONS (QCAR |t|)
                                                  (SPADCALL |p1| (QCDR |t|)
                                                            (QREFELT $ 49)))
                                            #3#))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT (NREVERSE #3#))))
                             (QREFELT $ 27)))
                      (EXIT
                       (CONS 1
                             (CONS
                              (QCDR
                               (SPADCALL (CONS 0 (QCAR (QCDR |p1|)))
                                         (CONS 0 (QCAR (QCDR |p2|)))
                                         (QREFELT $ 21)))
                              (SPADCALL |x| |y| (QREFELT $ 50))))))))))) 

(SDEFUN |XRPOLY;RemainderList;$L;9|
        ((|p| ($)) ($ (|List| (|Record| (|:| |k| |VarSet|) (|:| |c| $)))))
        (COND ((QEQCAR |p| 0) NIL)
              ('T (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))))) 

(SDEFUN |XRPOLY;lquo;3$;10| ((|p1| ($)) (|p2| ($)) ($ ($)))
        (COND ((QEQCAR |p2| 0) (SPADCALL |p1| |p2| (QREFELT $ 21)))
              ((QEQCAR |p1| 0)
               (CONS 0
                     (SPADCALL (QCDR |p1|) (QCAR (QCDR |p2|)) (QREFELT $ 54))))
              ('T
               (SPADCALL
                (SPADCALL |p1| (CONS 0 (QCAR (QCDR |p2|))) (QREFELT $ 21))
                (|XRPOLY;lquo1| (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 24))
                 (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 24)) $)
                (QREFELT $ 55))))) 

(SDEFUN |XRPOLY;lquo1|
        ((|x| (|List| (|Record| (|:| |k| |VarSet|) (|:| |c| $))))
         (|y| (|List| (|Record| (|:| |k| |VarSet|) (|:| |c| $)))) ($ ($)))
        (SPROG ((#1=#:G209 NIL))
               (SEQ
                (EXIT
                 (COND ((OR (NULL |x|) (NULL |y|)) (|spadConstant| $ 14))
                       ((SPADCALL (QCAR (SPADCALL |x| '|first| (QREFELT $ 58)))
                                  (QCAR (SPADCALL |y| '|first| (QREFELT $ 58)))
                                  (QREFELT $ 59))
                        (|XRPOLY;lquo1| |x| (CDR |y|) $))
                       ((SPADCALL (QCAR (SPADCALL |x| '|first| (QREFELT $ 58)))
                                  (QCAR (SPADCALL |y| '|first| (QREFELT $ 58)))
                                  (QREFELT $ 60))
                        (SPADCALL
                         (SPADCALL
                          (QCDR (SPADCALL |x| '|first| (QREFELT $ 58)))
                          (QCDR (SPADCALL |y| '|first| (QREFELT $ 58)))
                          (QREFELT $ 56))
                         (|XRPOLY;lquo1| (CDR |x|) (CDR |y|) $)
                         (QREFELT $ 55)))
                       ('T
                        (PROGN
                         (LETT #1# (|XRPOLY;lquo1| (CDR |x|) |y| $))
                         (GO #2=#:G208)))))
                #2# (EXIT #1#)))) 

(SDEFUN |XRPOLY;coef;2$R;12| ((|p1| ($)) (|p2| ($)) ($ (R)))
        (COND
         ((QEQCAR |p1| 0)
          (QCDR
           (SPADCALL (QCDR |p1|) (CONS 0 (SPADCALL |p2| (QREFELT $ 29)))
                     (QREFELT $ 18))))
         ((QEQCAR |p2| 0)
          (QCDR
           (SPADCALL (CONS 0 (QCAR (QCDR |p1|))) (CONS 0 (QCDR |p2|))
                     (QREFELT $ 21))))
         ('T
          (SPADCALL
           (QCDR
            (SPADCALL (CONS 0 (QCAR (QCDR |p1|))) (CONS 0 (QCAR (QCDR |p2|)))
                      (QREFELT $ 21)))
           (|XRPOLY;coef1| (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 24))
            (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 24)) $)
           (QREFELT $ 61))))) 

(SDEFUN |XRPOLY;coef1|
        ((|x| (|List| (|Record| (|:| |k| |VarSet|) (|:| |c| $))))
         (|y| (|List| (|Record| (|:| |k| |VarSet|) (|:| |c| $)))) ($ (R)))
        (SPROG ((#1=#:G221 NIL))
               (SEQ
                (EXIT
                 (COND ((OR (NULL |x|) (NULL |y|)) (|spadConstant| $ 15))
                       ((SPADCALL (QCAR (SPADCALL |x| '|first| (QREFELT $ 58)))
                                  (QCAR (SPADCALL |y| '|first| (QREFELT $ 58)))
                                  (QREFELT $ 59))
                        (|XRPOLY;coef1| |x| (CDR |y|) $))
                       ((SPADCALL (QCAR (SPADCALL |x| '|first| (QREFELT $ 58)))
                                  (QCAR (SPADCALL |y| '|first| (QREFELT $ 58)))
                                  (QREFELT $ 60))
                        (QCDR
                         (SPADCALL
                          (CONS 0
                                (SPADCALL
                                 (QCDR (SPADCALL |x| '|first| (QREFELT $ 58)))
                                 (QCDR (SPADCALL |y| '|first| (QREFELT $ 58)))
                                 (QREFELT $ 28)))
                          (CONS 0 (|XRPOLY;coef1| (CDR |x|) (CDR |y|) $))
                          (QREFELT $ 55))))
                       ('T
                        (PROGN
                         (LETT #1# (|XRPOLY;coef1| (CDR |x|) |y| $))
                         (GO #2=#:G220)))))
                #2# (EXIT #1#)))) 

(SDEFUN |XRPOLY;outForm| ((|p| (|FreeModule| $ |VarSet|)) ($ (|OutputForm|)))
        (SPROG
         ((|le| (|List| (|OutputForm|))) (#1=#:G229 NIL) (|t| NIL)
          (#2=#:G228 NIL))
         (SEQ
          (LETT |le|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |t| NIL) (LETT #1# (SPADCALL |p| (QREFELT $ 24)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL (QCAR |t|) (QREFELT $ 63))
                                         (SPADCALL (QCDR |t|) (QREFELT $ 64))
                                         (QREFELT $ 65))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT (SPADCALL (ELT $ 66) (NREVERSE |le|) (QREFELT $ 69)))))) 

(SDEFUN |XRPOLY;coerce;$Of;15| ((|p| ($)) ($ (|OutputForm|)))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 70)))
              ((SPADCALL (CONS 0 (QCAR (QCDR |p|))) (|spadConstant| $ 14)
                         (QREFELT $ 13))
               (|XRPOLY;outForm| (QCDR (QCDR |p|)) $))
              ('T
               (SPADCALL (SPADCALL (QCAR (QCDR |p|)) (QREFELT $ 70))
                         (|XRPOLY;outForm| (QCDR (QCDR |p|)) $)
                         (QREFELT $ 66))))) 

(SDEFUN |XRPOLY;Zero;$;16| (($ ($))) (CONS 0 (|spadConstant| $ 15))) 

(SDEFUN |XRPOLY;One;$;17| (($ ($))) (CONS 0 (|spadConstant| $ 31))) 

(PUT '|XRPOLY;constant?;$B;18| '|SPADreplace| '(XLAM (|p|) (QEQCAR |p| 0))) 

(SDEFUN |XRPOLY;constant?;$B;18| ((|p| ($)) ($ (|Boolean|))) (QEQCAR |p| 0)) 

(SDEFUN |XRPOLY;constant;$R;19| ((|p| ($)) ($ (R)))
        (COND ((QEQCAR |p| 0) (QCDR |p|)) ('T (QCAR (QCDR |p|))))) 

(SDEFUN |XRPOLY;simplifie|
        ((|p| (|Record| (|:| |c0| R) (|:| |reg| (|FreeModule| $ |VarSet|))))
         ($ ($)))
        (COND
         ((SPADCALL (QCDR |p|) (|spadConstant| $ 72) (QREFELT $ 12))
          (CONS 0 (QCAR |p|)))
         ('T (CONS 1 |p|)))) 

(SDEFUN |XRPOLY;coerce;VarSet$;21| ((|v| (|VarSet|)) ($ ($)))
        (CONS 1
              (CONS (|spadConstant| $ 15)
                    (SPADCALL (|spadConstant| $ 30) |v| (QREFELT $ 73))))) 

(PUT '|XRPOLY;coerce;R$;22| '|SPADreplace| '(XLAM (|r|) (CONS 0 |r|))) 

(SDEFUN |XRPOLY;coerce;R$;22| ((|r| (R)) ($ ($))) (CONS 0 |r|)) 

(SDEFUN |XRPOLY;coerce;I$;23| ((|n| (|Integer|)) ($ ($)))
        (CONS 0 (SPADCALL |n| (QREFELT $ 77)))) 

(SDEFUN |XRPOLY;coerce;Fm$;24| ((|w| (|FreeMonoid| |VarSet|)) ($ ($)))
        (COND
         ((SPADCALL |w| (|spadConstant| $ 79) (QREFELT $ 80))
          (CONS 0 (|spadConstant| $ 31)))
         ('T
          (SPADCALL (SPADCALL |w| (QREFELT $ 81))
                    (SPADCALL (SPADCALL |w| (QREFELT $ 82)) (QREFELT $ 17))
                    (QREFELT $ 83))))) 

(SDEFUN |XRPOLY;expand;$Xdp;25|
        ((|p| ($)) ($ (|XDistributedPolynomial| |VarSet| R)))
        (SPROG
         ((|ep| (|XDistributedPolynomial| |VarSet| R)) (#1=#:G252 NIL)
          (|t| NIL) (|lt| (|List| (|Record| (|:| |k| |VarSet|) (|:| |c| $)))))
         (SEQ
          (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 84)))
                ('T
                 (SEQ (LETT |lt| (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24)))
                      (LETT |ep| (SPADCALL (QCAR (QCDR |p|)) (QREFELT $ 84)))
                      (SEQ (LETT |t| NIL) (LETT #1# |lt|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |ep|
                                   (SPADCALL |ep|
                                             (SPADCALL (QCAR |t|)
                                                       (SPADCALL (QCDR |t|)
                                                                 (QREFELT $
                                                                          85))
                                                       (QREFELT $ 86))
                                             (QREFELT $ 87)))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |ep|))))))) 

(SDEFUN |XRPOLY;-;2$;26| ((|p| ($)) ($ ($)))
        (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) (QREFELT $ 88))))
              ('T
               (CONS 1
                     (CONS
                      (QCDR
                       (SPADCALL (CONS 0 (QCAR (QCDR |p|))) (QREFELT $ 89)))
                      (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 90))))))) 

(SDEFUN |XRPOLY;+;3$;27| ((|p1| ($)) (|p2| ($)) ($ ($)))
        (SEQ
         (COND
          ((QEQCAR |p1| 0)
           (COND
            ((QEQCAR |p2| 0)
             (EXIT
              (CONS 0 (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 61))))))))
         (EXIT
          (COND
           ((QEQCAR |p1| 0)
            (CONS 1
                  (CONS
                   (SPADCALL (QCDR |p1|) (QCAR (QCDR |p2|)) (QREFELT $ 61))
                   (QCDR (QCDR |p2|)))))
           ((QEQCAR |p2| 0)
            (CONS 1
                  (CONS
                   (SPADCALL (QCDR |p2|) (QCAR (QCDR |p1|)) (QREFELT $ 61))
                   (QCDR (QCDR |p1|)))))
           ('T
            (|XRPOLY;simplifie|
             (CONS
              (QCDR
               (SPADCALL (CONS 0 (QCAR (QCDR |p1|)))
                         (CONS 0 (QCAR (QCDR |p2|))) (QREFELT $ 55)))
              (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT $ 50)))
             $)))))) 

(SDEFUN |XRPOLY;-;3$;28| ((|p1| ($)) (|p2| ($)) ($ ($)))
        (SEQ
         (COND
          ((QEQCAR |p1| 0)
           (COND
            ((QEQCAR |p2| 0)
             (EXIT
              (CONS 0 (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 91))))))))
         (EXIT
          (COND
           ((QEQCAR |p1| 0)
            (CONS 1
                  (CONS
                   (SPADCALL (QCDR |p1|) (QCAR (QCDR |p2|)) (QREFELT $ 91))
                   (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 90)))))
           ((QEQCAR |p2| 0)
            (CONS 1
                  (CONS
                   (QCDR
                    (SPADCALL (CONS 0 (QCAR (QCDR |p1|))) |p2| (QREFELT $ 92)))
                   (QCDR (QCDR |p1|)))))
           ('T
            (|XRPOLY;simplifie|
             (CONS
              (QCDR
               (SPADCALL (CONS 0 (QCAR (QCDR |p1|)))
                         (CONS 0 (QCAR (QCDR |p2|))) (QREFELT $ 92)))
              (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT $ 93)))
             $)))))) 

(SDEFUN |XRPOLY;*;I2$;29| ((|n| (|Integer|)) (|p| ($)) ($ ($)))
        (COND ((EQL |n| 0) (|spadConstant| $ 14))
              ((QEQCAR |p| 0)
               (CONS 0 (SPADCALL |n| (QCDR |p|) (QREFELT $ 94))))
              ('T
               (|XRPOLY;simplifie|
                (CONS
                 (QCDR
                  (SPADCALL |n| (CONS 0 (QCAR (QCDR |p|))) (QREFELT $ 95)))
                 (SPADCALL |n| (QCDR (QCDR |p|)) (QREFELT $ 96)))
                $)))) 

(SDEFUN |XRPOLY;*;R2$;30| ((|r| (R)) (|p| ($)) ($ ($)))
        (COND
         ((SPADCALL |r| (QCDR (|spadConstant| $ 14)) (QREFELT $ 10))
          (|spadConstant| $ 14))
         ((QEQCAR |p| 0) (CONS 0 (SPADCALL |r| (QCDR |p|) (QREFELT $ 54))))
         ('T
          (|XRPOLY;simplifie|
           (CONS
            (QCDR (SPADCALL |r| (CONS 0 (QCAR (QCDR |p|))) (QREFELT $ 18)))
            (SPADCALL (CONS 0 |r|) (QCDR (QCDR |p|)) (QREFELT $ 97)))
           $)))) 

(SDEFUN |XRPOLY;*;$R$;31| ((|p| ($)) (|r| (R)) ($ ($)))
        (COND
         ((SPADCALL |r| (QCDR (|spadConstant| $ 14)) (QREFELT $ 10))
          (|spadConstant| $ 14))
         ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) |r| (QREFELT $ 54))))
         ('T
          (|XRPOLY;simplifie|
           (CONS
            (QCDR (SPADCALL |r| (CONS 0 (QCAR (QCDR |p|))) (QREFELT $ 18)))
            (SPADCALL (CONS 0 |r|) (QCDR (QCDR |p|)) (QREFELT $ 97)))
           $)))) 

(SDEFUN |XRPOLY;*;VarSet2$;32| ((|v| (|VarSet|)) (|p| ($)) ($ ($)))
        (COND
         ((SPADCALL |p| (|spadConstant| $ 14) (QREFELT $ 13))
          (|spadConstant| $ 14))
         ('T
          (CONS 1
                (CONS (|spadConstant| $ 15)
                      (SPADCALL |p| |v| (QREFELT $ 73))))))) 

(SDEFUN |XRPOLY;*;3$;33| ((|p1| ($)) (|p2| ($)) ($ ($)))
        (SPROG
         ((|y| (|FreeModule| $ |VarSet|)) (|x| (|FreeModule| $ |VarSet|)))
         (SEQ
          (COND ((QEQCAR |p1| 0) (SPADCALL (QCDR |p1|) |p2| (QREFELT $ 18)))
                ((QEQCAR |p2| 0) (SPADCALL |p1| (QCDR |p2|) (QREFELT $ 20)))
                ('T
                 (SEQ
                  (LETT |x| (SPADCALL (QCDR (QCDR |p1|)) |p2| (QREFELT $ 98)))
                  (LETT |y|
                        (SPADCALL (CONS 0 (QCAR (QCDR |p1|)))
                                  (QCDR (QCDR |p2|)) (QREFELT $ 97)))
                  (EXIT
                   (|XRPOLY;simplifie|
                    (CONS
                     (QCDR
                      (SPADCALL (CONS 0 (QCAR (QCDR |p1|)))
                                (CONS 0 (QCAR (QCDR |p2|))) (QREFELT $ 21)))
                     (SPADCALL |x| |y| (QREFELT $ 50)))
                    $)))))))) 

(SDEFUN |XRPOLY;lquo;$VarSet$;34| ((|p| ($)) (|v| (|VarSet|)) ($ ($)))
        (COND ((QEQCAR |p| 0) (|spadConstant| $ 14))
              ('T (SPADCALL (QCDR (QCDR |p|)) |v| (QREFELT $ 99))))) 

(SDEFUN |XRPOLY;lquo;$Fm$;35| ((|p| ($)) (|w| (|FreeMonoid| |VarSet|)) ($ ($)))
        (COND ((SPADCALL |w| (|spadConstant| $ 79) (QREFELT $ 80)) |p|)
              ('T
               (SPADCALL
                (SPADCALL |p| (SPADCALL |w| (QREFELT $ 81)) (QREFELT $ 100))
                (SPADCALL |w| (QREFELT $ 82)) (QREFELT $ 101))))) 

(SDEFUN |XRPOLY;rquo;$VarSet$;36| ((|p| ($)) (|v| (|VarSet|)) ($ ($)))
        (SPROG
         ((|x| (|FreeModule| $ |VarSet|)) (|a| ($)) (#1=#:G275 NIL) (|t| NIL)
          (#2=#:G274 NIL))
         (SEQ
          (COND ((QEQCAR |p| 0) (|spadConstant| $ 14))
                ('T
                 (SEQ
                  (LETT |x|
                        (SPADCALL
                         (PROGN
                          (LETT #2# NIL)
                          (SEQ (LETT |t| NIL)
                               (LETT #1#
                                     (SPADCALL (QCDR (QCDR |p|))
                                               (QREFELT $ 24)))
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |t| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL
                                    (LETT |a|
                                          (SPADCALL (QCDR |t|) |v|
                                                    (QREFELT $ 102)))
                                    (|spadConstant| $ 14) (QREFELT $ 26))
                                   (LETT #2#
                                         (CONS (CONS (QCAR |t|) |a|) #2#))))))
                               (LETT #1# (CDR #1#)) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT $ 27)))
                  (EXIT
                   (|XRPOLY;simplifie|
                    (CONS
                     (SPADCALL (SPADCALL (QCDR (QCDR |p|)) |v| (QREFELT $ 99))
                               (QREFELT $ 29))
                     |x|)
                    $)))))))) 

(SDEFUN |XRPOLY;rquo;$Fm$;37| ((|p| ($)) (|w| (|FreeMonoid| |VarSet|)) ($ ($)))
        (COND ((SPADCALL |w| (|spadConstant| $ 79) (QREFELT $ 80)) |p|)
              ('T
               (SPADCALL
                (SPADCALL |p| (SPADCALL |w| (QREFELT $ 82)) (QREFELT $ 103))
                (SPADCALL |w| (QREFELT $ 81)) (QREFELT $ 102))))) 

(SDEFUN |XRPOLY;coef;$FmR;38| ((|p| ($)) (|w| (|FreeMonoid| |VarSet|)) ($ (R)))
        (SPADCALL (SPADCALL |p| |w| (QREFELT $ 101)) (QREFELT $ 29))) 

(SDEFUN |XRPOLY;quasiRegular?;$B;39| ((|p| ($)) ($ (|Boolean|)))
        (COND
         ((QEQCAR |p| 0)
          (SPADCALL |p| (CONS 0 (|spadConstant| $ 15)) (QREFELT $ 13)))
         ('T
          (SPADCALL (CONS 0 (QCAR (QCDR |p|))) (CONS 0 (|spadConstant| $ 15))
                    (QREFELT $ 13))))) 

(SDEFUN |XRPOLY;quasiRegular;2$;40| ((|p| ($)) ($ ($)))
        (COND ((QEQCAR |p| 0) (|spadConstant| $ 14))
              ('T (CONS 1 (CONS (|spadConstant| $ 15) (QCDR (QCDR |p|))))))) 

(SDEFUN |XRPOLY;characteristic;Nni;41| (($ (|NonNegativeInteger|)))
        (SPADCALL (QREFELT $ 107))) 

(SDEFUN |XRPOLY;recip;$U;42| ((|p| ($)) ($ (|Union| $ "failed")))
        (COND ((QEQCAR |p| 0) (SPADCALL (CONS 0 (QCDR |p|)) (QREFELT $ 110)))
              ('T (CONS 1 "failed")))) 

(SDEFUN |XRPOLY;mindeg;$Fm;43| ((|p| ($)) ($ (|FreeMonoid| |VarSet|)))
        (SPROG
         ((#1=#:G288 NIL) (#2=#:G287 #3=(|FreeMonoid| |VarSet|))
          (#4=#:G289 #3#) (#5=#:G292 NIL) (|t| NIL))
         (SEQ
          (COND
           ((QEQCAR |p| 0)
            (COND
             ((SPADCALL |p| (|spadConstant| $ 14) (QREFELT $ 13))
              (|error| "XRPOLY.mindeg: zero polynomial !!"))
             (#6='T (|spadConstant| $ 79))))
           ((SPADCALL (CONS 0 (QCAR (QCDR |p|))) (|spadConstant| $ 14)
                      (QREFELT $ 26))
            (|spadConstant| $ 79))
           (#6#
            (PROGN
             (LETT #1# NIL)
             (SEQ (LETT |t| NIL)
                  (LETT #5# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (SPADCALL (QCAR |t|)
                                     (SPADCALL (QCDR |t|) (QREFELT $ 111))
                                     (QREFELT $ 112)))
                     (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 113))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                  (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# (|IdentityError| '|min|))))))))) 

(SDEFUN |XRPOLY;maxdeg;$Fm;44| ((|p| ($)) ($ (|FreeMonoid| |VarSet|)))
        (SPROG
         ((#1=#:G295 NIL) (#2=#:G294 #3=(|FreeMonoid| |VarSet|))
          (#4=#:G296 #3#) (#5=#:G298 NIL) (|t| NIL))
         (SEQ
          (COND
           ((QEQCAR |p| 0)
            (COND
             ((SPADCALL |p| (|spadConstant| $ 14) (QREFELT $ 13))
              (|error| "XRPOLY.maxdeg: zero polynomial !!"))
             (#6='T (|spadConstant| $ 79))))
           (#6#
            (PROGN
             (LETT #1# NIL)
             (SEQ (LETT |t| NIL)
                  (LETT #5# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (SPADCALL (QCAR |t|)
                                     (SPADCALL (QCDR |t|) (QREFELT $ 114))
                                     (QREFELT $ 112)))
                     (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 115))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                  (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# (|IdentityError| '|max|))))))))) 

(SDEFUN |XRPOLY;degree;$Nni;45| ((|p| ($)) ($ (|NonNegativeInteger|)))
        (COND
         ((SPADCALL |p| (|spadConstant| $ 14) (QREFELT $ 13))
          (|error| "XRPOLY.degree: zero polynomial !!"))
         ('T (SPADCALL (SPADCALL |p| (QREFELT $ 114)) (QREFELT $ 116))))) 

(SDEFUN |XRPOLY;map;M2$;46| ((|fn| (|Mapping| R R)) (|p| ($)) ($ ($)))
        (SPROG
         ((|x| (|FreeModule| $ |VarSet|)) (|a| ($)) (#1=#:G306 NIL) (|t| NIL)
          (#2=#:G305 NIL))
         (SEQ
          (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) |fn|)))
                ('T
                 (SEQ
                  (LETT |x|
                        (SPADCALL
                         (PROGN
                          (LETT #2# NIL)
                          (SEQ (LETT |t| NIL)
                               (LETT #1#
                                     (SPADCALL (QCDR (QCDR |p|))
                                               (QREFELT $ 24)))
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |t| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL
                                    (LETT |a|
                                          (SPADCALL |fn| (QCDR |t|)
                                                    (QREFELT $ 119)))
                                    (|spadConstant| $ 14) (QREFELT $ 26))
                                   (LETT #2#
                                         (CONS (CONS (QCAR |t|) |a|) #2#))))))
                               (LETT #1# (CDR #1#)) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT $ 27)))
                  (EXIT
                   (|XRPOLY;simplifie|
                    (CONS (SPADCALL (QCAR (QCDR |p|)) |fn|) |x|) $)))))))) 

(SDEFUN |XRPOLY;varList;$L;47| ((|p| ($)) ($ (|List| |VarSet|)))
        (SPROG
         ((|lv| #1=(|List| |VarSet|)) (#2=#:G316 NIL) (|t| NIL) (#3=#:G315 NIL)
          (#4=#:G309 NIL) (#5=#:G308 #1#) (#6=#:G310 #1#) (#7=#:G314 NIL))
         (SEQ
          (COND ((QEQCAR |p| 0) NIL)
                (#8='T
                 (SEQ
                  (LETT |lv|
                        (PROGN
                         (LETT #4# NIL)
                         (SEQ (LETT |t| NIL)
                              (LETT #7#
                                    (SPADCALL (QCDR (QCDR |p|))
                                              (QREFELT $ 24)))
                              G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |t| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #6#
                                       (SPADCALL (QCDR |t|) (QREFELT $ 120)))
                                 (COND
                                  (#4#
                                   (LETT #5#
                                         (SPADCALL #5# #6# (QREFELT $ 121))))
                                  ('T (PROGN (LETT #5# #6#) (LETT #4# 'T)))))))
                              (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                         (COND (#4# #5#) (#8# (|IdentityError| '|setUnion|)))))
                  (LETT |lv|
                        (SPADCALL |lv|
                                  (PROGN
                                   (LETT #3# NIL)
                                   (SEQ (LETT |t| NIL)
                                        (LETT #2#
                                              (SPADCALL (QCDR (QCDR |p|))
                                                        (QREFELT $ 24)))
                                        G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN (LETT |t| (CAR #2#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #3# (CONS (QCAR |t|) #3#))))
                                        (LETT #2# (CDR #2#)) (GO G190) G191
                                        (EXIT (NREVERSE #3#))))
                                  (QREFELT $ 121)))
                  (EXIT (SPADCALL |lv| (QREFELT $ 122))))))))) 

(DECLAIM (NOTINLINE |XRecursivePolynomial;|)) 

(DEFUN |XRecursivePolynomial| (&REST #1=#:G321)
  (SPROG NIL
         (PROG (#2=#:G322)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|XRecursivePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |XRecursivePolynomial;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|XRecursivePolynomial|)))))))))) 

(DEFUN |XRecursivePolynomial;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|XRecursivePolynomial| DV$1 DV$2))
          (LETT $ (GETREFV 129))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#2|
                                                             '(|noZeroDivisors|))))))
          (|haddProp| |$ConstructorCache| '|XRecursivePolynomial|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|Union| |#2|
                             (|Record| (|:| |c0| |#2|)
                                       (|:| |reg| (|FreeModule| $ |#1|)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 47 (CONS (|dispatchFunction| |XRPOLY;sh;$Nni$;7|) $))
             (QSETREFV $ 49 (CONS (|dispatchFunction| |XRPOLY;sh;3$;8|) $)))))
          $))) 

(MAKEPROP '|XRecursivePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Boolean|) (0 . =) (|FreeModule| $$ 6) (6 . =) |XRPOLY;=;2$B;2|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |XRPOLY;Zero;$;16|) $))
              (12 . |Zero|) (|FreeMonoid| 6) |XRPOLY;coerce;Fm$;24|
              |XRPOLY;*;R2$;30| |XRPOLY;monom;FmR$;3| |XRPOLY;*;$R$;31|
              |XRPOLY;*;3$;33| (|Record| (|:| |k| 6) (|:| |c| $$)) (|List| 22)
              (16 . |listOfTerms|) |XRPOLY;rquo;3$;4| (21 . ~=)
              (27 . |construct|) |XRPOLY;coef;2$R;12| |XRPOLY;constant;$R;19|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |XRPOLY;One;$;17|) $))
              (32 . |One|) (|NonNegativeInteger|) |XRPOLY;trunc;$Nni$;5|
              (|XDistributedPolynomial| 6 7) (36 . |constant?|)
              (41 . |constant|) (46 . >) (|List| 6) (52 . |varList|)
              (|Mapping| 9 6 6) (57 . |sort|) (63 . |lquo|) (69 . |Zero|)
              (73 . ~=) |XRPOLY;unexpand;Xdp$;6| (79 . ^) (85 . |sh|) (91 . *)
              (97 . |sh|) (103 . +) (|Record| (|:| |k| 6) (|:| |c| $))
              (|List| 51) |XRPOLY;RemainderList;$L;9| (109 . *)
              |XRPOLY;+;3$;27| |XRPOLY;lquo;3$;10| '"first" (115 . |elt|)
              (121 . <) (127 . =) (133 . +) (|OutputForm|) (139 . |coerce|)
              |XRPOLY;coerce;$Of;15| (144 . *) (150 . +) (|Mapping| 62 62 62)
              (|List| 62) (156 . |reduce|) (162 . |coerce|)
              |XRPOLY;constant?;$B;18| (167 . |Zero|) (171 . |monomial|)
              |XRPOLY;coerce;VarSet$;21| |XRPOLY;coerce;R$;22| (|Integer|)
              (177 . |coerce|) |XRPOLY;coerce;I$;23| (182 . |One|) (186 . =)
              (192 . |first|) (197 . |rest|) |XRPOLY;*;VarSet2$;32|
              (202 . |coerce|) |XRPOLY;expand;$Xdp;25| (207 . *) (213 . +)
              (219 . -) |XRPOLY;-;2$;26| (224 . -) (229 . -) |XRPOLY;-;3$;28|
              (235 . -) (241 . *) |XRPOLY;*;I2$;29| (247 . *) (253 . *)
              (259 . *) (265 . |coefficient|) |XRPOLY;lquo;$VarSet$;34|
              |XRPOLY;lquo;$Fm$;35| |XRPOLY;rquo;$VarSet$;36|
              |XRPOLY;rquo;$Fm$;37| |XRPOLY;coef;$FmR;38|
              |XRPOLY;quasiRegular?;$B;39| |XRPOLY;quasiRegular;2$;40|
              (271 . |characteristic|) |XRPOLY;characteristic;Nni;41|
              (|Union| $ '"failed") |XRPOLY;recip;$U;42| |XRPOLY;mindeg;$Fm;43|
              (275 . *) (281 . |min|) |XRPOLY;maxdeg;$Fm;44| (287 . |max|)
              (293 . |length|) |XRPOLY;degree;$Nni;45| (|Mapping| 7 7)
              |XRPOLY;map;M2$;46| |XRPOLY;varList;$L;47| (298 . |setUnion|)
              (304 . |sort!|) (|Record| (|:| |k| 16) (|:| |c| 7))
              (|Union| 16 '"failed") (|PositiveInteger|) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 309 |zero?| 315 |varList| 320 |unexpand| 325 |trunc| 330
              |subtractIfCan| 336 |sh| 342 |sample| 354 |rquo| 358 |rightRecip|
              376 |rightPower| 381 |retractIfCan| 393 |retract| 398 |recip| 403
              |quasiRegular?| 408 |quasiRegular| 413 |opposite?| 418 |one?| 424
              |monomial?| 429 |monom| 434 |mirror| 440 |mindegTerm| 445
              |mindeg| 450 |maxdeg| 455 |map| 460 |lquo| 466 |leftRecip| 484
              |leftPower| 489 |latex| 501 |hashUpdate!| 506 |hash| 512 |expand|
              517 |degree| 522 |constant?| 527 |constant| 532 |commutator| 537
              |coerce| 543 |coef| 568 |characteristic| 580 |associator| 584
              |antiCommutator| 591 |annihilate?| 597 ^ 603 |Zero| 615
              |RemainderList| 619 |One| 624 = 628 - 634 + 645 * 651)
           'NIL
           (CONS
            (|makeByteWordVec2| 2
                                '(0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 2))
            (CONS
             '#(NIL NIL NIL |Algebra&| NIL |Rng&| NIL NIL |Module&| NIL
                |NonAssociativeRing&| NIL NIL NIL |NonAssociativeRng&| NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| |Magma&|
                |AbelianSemiGroup&| |RetractableTo&| |SetCategory&| NIL NIL
                |BasicType&| NIL NIL)
             (CONS
              '#((|XPolynomialsCat| 6 7) (|XFreeAlgebra| 6 7) (|XAlgebra| 7)
                 (|Algebra| 7) (|Ring|) (|Rng|) (|SemiRing|) (|SemiRng|)
                 (|Module| 7) (|BiModule| 7 7) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|LeftModule| 7) (|RightModule| 7)
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| $$)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Magma|)
                 (|AbelianSemiGroup|) (|RetractableTo| (|FreeMonoid| 6))
                 (|SetCategory|) (|CoercibleFrom| (|FreeMonoid| 6))
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 62)
                 (|noZeroDivisors|))
              (|makeByteWordVec2| 128
                                  '(2 7 9 0 0 10 2 11 9 0 0 12 0 7 0 15 1 11 23
                                    0 24 2 0 9 0 0 26 1 11 0 23 27 0 7 0 31 1
                                    34 9 0 35 1 34 7 0 36 2 6 9 0 0 37 1 34 38
                                    0 39 2 38 0 40 0 41 2 34 0 0 6 42 0 34 0 43
                                    2 34 9 0 0 44 2 0 0 0 32 46 2 0 0 0 32 47 2
                                    0 0 32 0 48 2 0 0 0 0 49 2 11 0 0 0 50 2 7
                                    0 0 0 54 2 23 22 0 57 58 2 6 9 0 0 59 2 6 9
                                    0 0 60 2 7 0 0 0 61 1 6 62 0 63 2 62 0 0 0
                                    65 2 62 0 0 0 66 2 68 62 67 0 69 1 7 62 0
                                    70 0 11 0 72 2 11 0 2 6 73 1 7 0 76 77 0 16
                                    0 79 2 16 9 0 0 80 1 16 6 0 81 1 16 0 0 82
                                    1 34 0 7 84 2 34 0 6 0 86 2 34 0 0 0 87 1 7
                                    0 0 88 1 11 0 0 90 2 7 0 0 0 91 2 11 0 0 0
                                    93 2 7 0 76 0 94 2 11 0 76 0 96 2 11 0 2 0
                                    97 2 11 0 0 2 98 2 11 2 0 6 99 0 7 32 107 2
                                    16 0 6 0 112 2 16 0 0 0 113 2 16 0 0 0 115
                                    1 16 32 0 116 2 38 0 0 0 121 1 38 0 0 122 2
                                    0 9 0 0 26 1 0 9 0 1 1 0 38 0 120 1 0 0 34
                                    45 2 0 0 0 32 33 2 0 109 0 0 1 2 1 0 0 0 49
                                    2 1 0 0 32 47 0 0 0 1 2 0 0 0 0 25 2 0 0 0
                                    6 102 2 0 0 0 16 103 1 0 109 0 1 2 0 0 0 32
                                    1 2 0 0 0 125 1 1 0 124 0 1 1 0 16 0 1 1 0
                                    109 0 110 1 0 9 0 105 1 0 0 0 106 2 0 9 0 0
                                    1 1 0 9 0 1 1 0 9 0 1 2 0 0 16 7 19 1 0 0 0
                                    1 1 0 123 0 1 1 0 16 0 111 1 0 16 0 114 2 0
                                    0 118 0 119 2 0 0 0 16 101 2 0 0 0 0 56 2 0
                                    0 0 6 100 1 0 109 0 1 2 0 0 0 32 1 2 0 0 0
                                    125 1 1 0 126 0 1 2 0 128 128 0 1 1 0 127 0
                                    1 1 0 34 0 85 1 0 32 0 117 1 0 9 0 71 1 0 7
                                    0 29 2 0 0 0 0 1 1 0 0 6 74 1 0 0 16 17 1 0
                                    0 7 75 1 0 0 76 78 1 0 62 0 64 2 0 7 0 16
                                    104 2 0 7 0 0 28 0 0 32 108 3 0 0 0 0 0 1 2
                                    0 0 0 0 1 2 0 9 0 0 1 2 0 0 0 32 46 2 0 0 0
                                    125 1 0 0 0 14 1 0 52 0 53 0 0 0 30 2 0 9 0
                                    0 13 2 0 0 0 0 92 1 0 0 0 89 2 0 0 0 0 55 2
                                    0 0 6 0 83 2 0 0 0 7 20 2 0 0 7 0 18 2 0 0
                                    32 0 48 2 0 0 76 0 95 2 0 0 0 0 21 2 0 0
                                    125 0 1)))))
           '|lookupComplete|)) 
