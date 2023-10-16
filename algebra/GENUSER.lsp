
(PUT '|GENUSER;terms;$S;1| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |GENUSER;terms;$S;1|
        ((|x| $) ($ |Stream| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))))
        |x|) 

(SDEFUN |GENUSER;center;$Coef;2| ((|x| $) ($ |Coef|)) (QREFELT $ 9)) 

(SDEFUN |GENUSER;variable;$S;3| ((|x| $) ($ |Symbol|)) (QREFELT $ 8)) 

(SDEFUN |GENUSER;pole?;$B;4| ((|x| $) ($ |Boolean|))
        (SEQ
         (COND ((SPADCALL |x| (QREFELT $ 18)) NIL)
               ('T
                (SEQ
                 (LETT |x| (SPADCALL |x| (|spadConstant| $ 21) (QREFELT $ 22)))
                 (EXIT
                  (SPADCALL (SPADCALL |x| (QREFELT $ 23)) (|spadConstant| $ 21)
                            (QREFELT $ 24)))))))) 

(SDEFUN |GENUSER;Zero;$;5| (($ $)) (SPADCALL (QREFELT $ 26))) 

(SDEFUN |GENUSER;One;$;6| (($ $))
        (SPADCALL (CONS (|spadConstant| $ 21) (|spadConstant| $ 27))
                  (SPADCALL (QREFELT $ 26)) (QREFELT $ 28))) 

(SDEFUN |GENUSER;reductum;2$;7| ((|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 18)) |x|)
              ('T (SPADCALL |x| (QREFELT $ 30))))) 

(SDEFUN |GENUSER;characteristic;Nni;8| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 33))) 

(SDEFUN |GENUSER;monomial;CoefExpon$;9| ((|ci| |Coef|) (|ki| |Expon|) ($ $))
        (SPADCALL (CONS |ki| |ci|) (SPADCALL (QREFELT $ 26)) (QREFELT $ 28))) 

(SDEFUN |GENUSER;termOutput|
        ((|ki| |Expon|) (|ci| |Coef|) (|vv| |OutputForm|) ($ |OutputForm|))
        (SPROG ((|mon| (|OutputForm|)))
               (SEQ
                (COND
                 ((SPADCALL |ki| (|spadConstant| $ 21) (QREFELT $ 36))
                  (SPADCALL |ci| (QREFELT $ 38)))
                 (#1='T
                  (SEQ
                   (LETT |mon|
                         (COND
                          ((SPADCALL |ki| (|spadConstant| $ 39) (QREFELT $ 36))
                           |vv|)
                          (#1#
                           (SPADCALL |vv| (SPADCALL |ki| (QREFELT $ 40))
                                     (QREFELT $ 41)))))
                   (EXIT
                    (COND
                     ((SPADCALL |ci| (|spadConstant| $ 27) (QREFELT $ 42))
                      |mon|)
                     ((SPADCALL |ci|
                                (SPADCALL (|spadConstant| $ 27) (QREFELT $ 43))
                                (QREFELT $ 42))
                      (SPADCALL |mon| (QREFELT $ 44)))
                     (#1#
                      (SPADCALL (SPADCALL |ci| (QREFELT $ 38)) |mon|
                                (QREFELT $ 45))))))))))) 

(SDEFUN |GENUSER;coerce;$Of;11| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (|xs| (|Rep|))
          (|ti| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))) (#1=#:G199 NIL)
          (|n| NIL) (|count| (|Integer|)) (|vv| (|OutputForm|)))
         (SEQ (LETT |xs| |x|)
              (EXIT
               (COND
                ((SPADCALL |xs| (QREFELT $ 18))
                 (SPADCALL (|spadConstant| $ 19) (QREFELT $ 38)))
                (#2='T
                 (SEQ
                  (LETT |vv|
                        (COND
                         ((SPADCALL (QREFELT $ 9) (QREFELT $ 46))
                          (SPADCALL (QREFELT $ 8) (QREFELT $ 47)))
                         (#2#
                          (SPADCALL
                           (SPADCALL (SPADCALL (QREFELT $ 8) (QREFELT $ 47))
                                     (SPADCALL (QREFELT $ 9) (QREFELT $ 38))
                                     (QREFELT $ 48))
                           (QREFELT $ 49)))))
                  (LETT |count| |$streamCount|) (LETT |l| NIL)
                  (SEQ (LETT |n| 0) (LETT #1# |count|) G190
                       (COND
                        ((OR (|greater_SI| |n| #1#)
                             (NULL (NULL (SPADCALL |xs| (QREFELT $ 18)))))
                         (GO G191)))
                       (SEQ (LETT |ti| (SPADCALL |xs| (QREFELT $ 50)))
                            (COND
                             ((SPADCALL (QCDR |ti|) (|spadConstant| $ 19)
                                        (QREFELT $ 51))
                              (LETT |l|
                                    (CONS
                                     (|GENUSER;termOutput| (QCAR |ti|)
                                      (QCDR |ti|) |vv| $)
                                     |l|))))
                            (EXIT (LETT |xs| (SPADCALL |xs| (QREFELT $ 30)))))
                       (LETT |n| (|inc_SI| |n|)) (GO G190) G191 (EXIT NIL))
                  (LETT |l|
                        (COND ((SPADCALL |xs| (QREFELT $ 52)) |l|)
                              (#2#
                               (CONS
                                (SPADCALL (SPADCALL "o" (QREFELT $ 54))
                                          (LIST
                                           (SPADCALL |vv|
                                                     (SPADCALL (QCAR |ti|)
                                                               (QREFELT $ 40))
                                                     (QREFELT $ 41)))
                                          (QREFELT $ 56))
                                |l|))))
                  (EXIT
                   (COND
                    ((NULL |l|)
                     (SPADCALL (|spadConstant| $ 19) (QREFELT $ 38)))
                    (#2#
                     (SPADCALL (ELT $ 57) (NREVERSE |l|)
                               (QREFELT $ 60)))))))))))) 

(SDEFUN |GENUSER;degree;$Expon;12| ((|x| $) ($ |Expon|))
        (COND ((SPADCALL |x| (QREFELT $ 18)) (|spadConstant| $ 21))
              ('T (QCAR (SPADCALL |x| (QREFELT $ 50)))))) 

(SDEFUN |GENUSER;map;M2$;13| ((|fn| |Mapping| |Coef| |Coef|) (|x| $) ($ $))
        (SPADCALL (CONS #'|GENUSER;map;M2$;13!0| |fn|) |x| (QREFELT $ 63))) 

(SDEFUN |GENUSER;map;M2$;13!0| ((|ti| NIL) (|fn| NIL))
        (CONS (QCAR |ti|) (SPADCALL (QCDR |ti|) |fn|))) 

(SDEFUN |GENUSER;*;Coef2$;14| ((|c1| |Coef|) (|x| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|GENUSER;*;Coef2$;14!0| (VECTOR $ |c1|)) |x|
                         (QREFELT $ 63)))) 

(SDEFUN |GENUSER;*;Coef2$;14!0| ((|ti| NIL) ($$ NIL))
        (PROG (|c1| $)
          (LETT |c1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (CONS (QCAR |ti|) (SPADCALL (QCDR |ti|) |c1| (QREFELT $ 66))))))) 

(SDEFUN |GENUSER;multiplyExponents;$Pi$;15|
        ((|x| $) (|n| |PositiveInteger|) ($ $))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GENUSER;multiplyExponents;$Pi$;15!0| (VECTOR $ |n|))
                |x| (QREFELT $ 63)))) 

(SDEFUN |GENUSER;multiplyExponents;$Pi$;15!0| ((|ti| NIL) ($$ NIL))
        (PROG (|n| $)
          (LETT |n| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (CONS (SPADCALL |n| (QCAR |ti|) (QREFELT $ 69)) (QCDR |ti|)))))) 

(SDEFUN |GENUSER;-;2$;16| ((|x| $) ($ $))
        (SPADCALL (CONS #'|GENUSER;-;2$;16!0| $) |x| (QREFELT $ 63))) 

(SDEFUN |GENUSER;-;2$;16!0| ((|ti| NIL) ($ NIL))
        (CONS (QCAR |ti|) (SPADCALL (QCDR |ti|) (QREFELT $ 43)))) 

(SDEFUN |GENUSER;+;3$;17| ((|x| $) (|y| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|GENUSER;+;3$;17!0| (VECTOR |y| $ |x|))
                          (QREFELT $ 75))))) 

(SDEFUN |GENUSER;+;3$;17!0| (($$ NIL))
        (PROG (|x| $ |y|)
          (LETT |x| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |y| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|tx| NIL) (|ty| NIL))
                   (SEQ
                    (COND ((SPADCALL |x| (QREFELT $ 18)) |y|)
                          ((SPADCALL |y| (QREFELT $ 18)) |x|)
                          ('T
                           (SEQ (LETT |tx| (SPADCALL |x| (QREFELT $ 50)))
                                (LETT |ty| (SPADCALL |y| (QREFELT $ 50)))
                                (EXIT
                                 (COND
                                  ((SPADCALL (QCAR |tx|) (QCAR |ty|)
                                             (QREFELT $ 24))
                                   (SPADCALL (CONS (QCAR |tx|) (QCDR |tx|))
                                             (SPADCALL
                                              (SPADCALL |x| (QREFELT $ 30)) |y|
                                              (QREFELT $ 72))
                                             (QREFELT $ 28)))
                                  ((SPADCALL (QCAR |ty|) (QCAR |tx|)
                                             (QREFELT $ 24))
                                   (SPADCALL (CONS (QCAR |ty|) (QCDR |ty|))
                                             (SPADCALL |x|
                                                       (SPADCALL |y|
                                                                 (QREFELT $
                                                                          30))
                                                       (QREFELT $ 72))
                                             (QREFELT $ 28)))
                                  ('T
                                   (SPADCALL
                                    (CONS (QCAR |tx|)
                                          (SPADCALL (QCDR |tx|) (QCDR |ty|)
                                                    (QREFELT $ 73)))
                                    (SPADCALL (SPADCALL |x| (QREFELT $ 30))
                                              (SPADCALL |y| (QREFELT $ 30))
                                              (QREFELT $ 72))
                                    (QREFELT $ 28)))))))))))))) 

(SDEFUN |GENUSER;-;3$;18| ((|x| $) (|y| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|GENUSER;-;3$;18!0| (VECTOR |y| $ |x|))
                          (QREFELT $ 75))))) 

(SDEFUN |GENUSER;-;3$;18!0| (($$ NIL))
        (PROG (|x| $ |y|)
          (LETT |x| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |y| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|tx| NIL) (|ty| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT $ 18))
                      (SPADCALL |y| (QREFELT $ 71)))
                     ((SPADCALL |y| (QREFELT $ 18)) |x|)
                     ('T
                      (SEQ (LETT |tx| (SPADCALL |x| (QREFELT $ 50)))
                           (LETT |ty| (SPADCALL |y| (QREFELT $ 50)))
                           (EXIT
                            (COND
                             ((SPADCALL (QCAR |tx|) (QCAR |ty|) (QREFELT $ 24))
                              (SPADCALL (CONS (QCAR |tx|) (QCDR |tx|))
                                        (SPADCALL (SPADCALL |x| (QREFELT $ 30))
                                                  |y| (QREFELT $ 76))
                                        (QREFELT $ 28)))
                             ((SPADCALL (QCAR |ty|) (QCAR |tx|) (QREFELT $ 24))
                              (SPADCALL (CONS (QCAR |ty|) (QCDR |ty|))
                                        (SPADCALL |x|
                                                  (SPADCALL |y| (QREFELT $ 30))
                                                  (QREFELT $ 76))
                                        (QREFELT $ 28)))
                             ('T
                              (SPADCALL
                               (CONS (QCAR |tx|)
                                     (SPADCALL (QCDR |tx|) (QCDR |ty|)
                                               (QREFELT $ 77)))
                               (SPADCALL (SPADCALL |x| (QREFELT $ 30))
                                         (SPADCALL |y| (QREFELT $ 30))
                                         (QREFELT $ 76))
                               (QREFELT $ 28)))))))))))))) 

(SDEFUN |GENUSER;*;3$;19| ((|x| $) (|y| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|GENUSER;*;3$;19!0| (VECTOR |y| $ |x|))
                          (QREFELT $ 75))))) 

(SDEFUN |GENUSER;*;3$;19!0| (($$ NIL))
        (PROG (|x| $ |y|)
          (LETT |x| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |y| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|tx| NIL) (|ty| NIL) (|x1| NIL))
                   (SEQ
                    (COND
                     ((OR (SPADCALL |x| (QREFELT $ 18))
                          (SPADCALL |y| (QREFELT $ 18)))
                      (|spadConstant| $ 20))
                     ('T
                      (SEQ (LETT |tx| (SPADCALL |x| (QREFELT $ 50)))
                           (LETT |ty| (SPADCALL |y| (QREFELT $ 50)))
                           (LETT |x1|
                                 (SPADCALL |tx| (SPADCALL (QREFELT $ 26))
                                           (QREFELT $ 28)))
                           (EXIT
                            (SPADCALL
                             (CONS
                              (SPADCALL (QCAR |tx|) (QCAR |ty|) (QREFELT $ 78))
                              (SPADCALL (QCDR |tx|) (QCDR |ty|)
                                        (QREFELT $ 66)))
                             (SPADCALL
                              (SPADCALL |x1| (SPADCALL |y| (QREFELT $ 30))
                                        (QREFELT $ 79))
                              (SPADCALL (SPADCALL |x| (QREFELT $ 30)) |y|
                                        (QREFELT $ 79))
                              (QREFELT $ 72))
                             (QREFELT $ 28)))))))))))) 

(SDEFUN |GENUSER;exquo1|
        ((|x| $) (|y| $) (|cyinv| |Coef|) (|ky| |Expon|) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|GENUSER;exquo1!0| (VECTOR |y| |cyinv| |ky| $ |x|))
                 (QREFELT $ 75))))) 

(SDEFUN |GENUSER;exquo1!0| (($$ NIL))
        (PROG (|x| $ |ky| |cyinv| |y|)
          (LETT |x| (QREFELT $$ 4))
          (LETT $ (QREFELT $$ 3))
          (LETT |ky| (QREFELT $$ 2))
          (LETT |cyinv| (QREFELT $$ 1))
          (LETT |y| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|tx| NIL) (|dkiu| NIL) (|dki| NIL) (|ci| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT $ 18)) (SPADCALL (QREFELT $ 26)))
                     ('T
                      (SEQ (LETT |tx| (SPADCALL |x| (QREFELT $ 50)))
                           (LETT |dkiu|
                                 (SPADCALL (QCAR |tx|) |ky| (QREFELT $ 81)))
                           (EXIT
                            (COND
                             ((QEQCAR |dkiu| 1)
                              (|error| "cannot subtract exponents"))
                             ('T
                              (SEQ (LETT |dki| (QCDR |dkiu|))
                                   (LETT |ci|
                                         (SPADCALL |cyinv| (QCDR |tx|)
                                                   (QREFELT $ 66)))
                                   (EXIT
                                    (SPADCALL (CONS |dki| |ci|)
                                              (|GENUSER;exquo1|
                                               (SPADCALL
                                                (SPADCALL |x| (QREFELT $ 30))
                                                (SPADCALL
                                                 (SPADCALL |ci| |dki|
                                                           (QREFELT $ 35))
                                                 (SPADCALL |y| (QREFELT $ 30))
                                                 (QREFELT $ 79))
                                                (QREFELT $ 76))
                                               |y| |cyinv| |ky| $)
                                              (QREFELT $ 28)))))))))))))))) 

(SDEFUN |GENUSER;exquo2| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (SPROG
         ((#1=#:G339 NIL) (#2=#:G337 NIL)
          (|tx| #3=(|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))) (|n| NIL)
          (|cyinv| (|Union| |Coef| "failed")) (|ky| (|Expon|)) (#4=#:G338 NIL)
          (|ty| #3#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (EXIT
              (SEQ (LETT |n| 1) G190 NIL
                   (SEQ
                    (EXIT
                     (COND
                      ((OR (SPADCALL |n| 1000 (QREFELT $ 82))
                           (SPADCALL |y| (QREFELT $ 18)))
                       (PROGN (LETT #1# (CONS 1 "failed")) (GO #5=#:G336)))
                      ('T
                       (SEQ (LETT |ty| (SPADCALL |y| (QREFELT $ 50)))
                            (COND
                             ((NULL
                               (SPADCALL (QCDR |ty|) (|spadConstant| $ 19)
                                         (QREFELT $ 42)))
                              (EXIT
                               (PROGN (LETT #4# |$NoValue|) (GO #6=#:G322)))))
                            (EXIT
                             (LETT |y| (SPADCALL |y| (QREFELT $ 30)))))))))
                   (LETT |n| (|inc_SI| |n|)) (GO G190) G191 (EXIT NIL)))
             #6# (EXIT #4#))
            (LETT |ky| (QCAR |ty|))
            (LETT |cyinv| (SPADCALL (QCDR |ty|) (QREFELT $ 83)))
            (EXIT
             (COND ((QEQCAR |cyinv| 1) (CONS 1 "failed"))
                   ('T
                    (SEQ
                     (SEQ
                      (EXIT
                       (SEQ (LETT |n| 1) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |n| 1000 (QREFELT $ 82))
                                (PROGN (LETT #1# (CONS 1 "failed")) (GO #5#)))
                               ((SPADCALL |x| (QREFELT $ 18))
                                (PROGN
                                 (LETT #1# (CONS 0 (SPADCALL (QREFELT $ 26))))
                                 (GO #5#)))
                               ('T
                                (SEQ (LETT |tx| (SPADCALL |x| (QREFELT $ 50)))
                                     (EXIT
                                      (COND
                                       ((QEQCAR
                                         (SPADCALL (QCAR |tx|) |ky|
                                                   (QREFELT $ 81))
                                         0)
                                        (PROGN
                                         (LETT #2# |$NoValue|)
                                         (GO #7=#:G333)))
                                       ((NULL
                                         (SPADCALL (QCDR |tx|)
                                                   (|spadConstant| $ 19)
                                                   (QREFELT $ 42)))
                                        (PROGN
                                         (LETT #1# (CONS 1 "failed"))
                                         (GO #5#)))
                                       ('T
                                        (LETT |x|
                                              (SPADCALL |x|
                                                        (QREFELT $
                                                                 30)))))))))))
                            (LETT |n| (|inc_SI| |n|)) (GO G190) G191
                            (EXIT NIL)))
                      #7# (EXIT #2#))
                     (EXIT
                      (CONS 0
                            (|GENUSER;exquo1| |x| |y| (QCDR |cyinv|) |ky|
                             $)))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |GENUSER;exquo;2$U;22| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (|GENUSER;exquo2| |x| |y| $)) 

(SDEFUN |GENUSER;recip;$U;23| ((|x| $) ($ |Union| $ "failed"))
        (|GENUSER;exquo2| (|spadConstant| $ 29) |x| $)) 

(SDEFUN |GENUSER;/;3$;24| ((|x| $) (|y| $) ($ $))
        (SPROG ((|resu| (|Union| $ "failed")))
               (SEQ (LETT |resu| (SPADCALL |x| |y| (QREFELT $ 84)))
                    (EXIT
                     (COND
                      ((QEQCAR |resu| 1)
                       (|error| "division by possibly zero series"))
                      ('T (QCDR |resu|))))))) 

(SDEFUN |GENUSER;infsum1|
        ((|stx| |Stream| $) (|k1| |Expon|) (|c1| |Coef|) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|GENUSER;infsum1!0| (VECTOR |c1| |k1| $ |stx|))
                 (QREFELT $ 75))))) 

(SDEFUN |GENUSER;infsum1!0| (($$ NIL))
        (PROG (|stx| $ |k1| |c1|)
          (LETT |stx| (QREFELT $$ 3))
          (LETT $ (QREFELT $$ 2))
          (LETT |k1| (QREFELT $$ 1))
          (LETT |c1| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|stx1| NIL) (|t1| NIL) (|x1| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |stx| (QREFELT $ 88))
                      (SPADCALL (CONS |k1| |c1|) (SPADCALL (QREFELT $ 26))
                                (QREFELT $ 28)))
                     ('T
                      (SEQ (LETT |x1| (SPADCALL |stx| (QREFELT $ 89)))
                           (LETT |stx1| (SPADCALL |stx| (QREFELT $ 90)))
                           (EXIT
                            (COND
                             ((SPADCALL |x1| (QREFELT $ 18))
                              (|GENUSER;infsum1| |stx1| |k1| |c1| $))
                             ('T
                              (SEQ (LETT |t1| (SPADCALL |x1| (QREFELT $ 50)))
                                   (LETT |x1| (SPADCALL |x1| (QREFELT $ 30)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |k1| (QCAR |t1|)
                                                (QREFELT $ 24))
                                      (SPADCALL (CONS |k1| |c1|)
                                                (SPADCALL |x1|
                                                          (|GENUSER;infsum1|
                                                           |stx1| (QCAR |t1|)
                                                           (QCDR |t1|) $)
                                                          (QREFELT $ 72))
                                                (QREFELT $ 28)))
                                     ((SPADCALL (QCAR |t1|) |k1|
                                                (QREFELT $ 24))
                                      (|error| "infsum: degrees not monotone"))
                                     ('T
                                      (SPADCALL |x1|
                                                (|GENUSER;infsum1| |stx1| |k1|
                                                 (SPADCALL |c1| (QCDR |t1|)
                                                           (QREFELT $ 73))
                                                 $)
                                                (QREFELT $ 72)))))))))))))))))) 

(SDEFUN |GENUSER;infsum;S$;26| ((|stx| |Stream| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|GENUSER;infsum;S$;26!0| (VECTOR $ |stx|))
                          (QREFELT $ 75))))) 

(SDEFUN |GENUSER;infsum;S$;26!0| (($$ NIL))
        (PROG (|stx| $)
          (LETT |stx| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|x1| NIL) (|t1| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |stx| (QREFELT $ 88)) (|spadConstant| $ 20))
                     ('T
                      (SEQ (LETT |x1| (SPADCALL |stx| (QREFELT $ 89)))
                           (EXIT
                            (COND
                             ((SPADCALL |x1| (QREFELT $ 18))
                              (SPADCALL (SPADCALL |stx| (QREFELT $ 90))
                                        (QREFELT $ 92)))
                             ('T
                              (SEQ (LETT |t1| (SPADCALL |x1| (QREFELT $ 50)))
                                   (EXIT
                                    (SPADCALL (SPADCALL |x1| (QREFELT $ 30))
                                              (|GENUSER;infsum1|
                                               (SPADCALL |stx| (QREFELT $ 90))
                                               (QCAR |t1|) (QCDR |t1|) $)
                                              (QREFELT $ 72)))))))))))))))) 

(SDEFUN |GENUSER;apply_taylor1|
        ((|stc| |Stream| |Coef|) (|x| $) (|xn| $) ($ |Stream| $))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|GENUSER;apply_taylor1!0| (VECTOR |x| |xn| $ |stc|))
                 (QREFELT $ 99))))) 

(SDEFUN |GENUSER;apply_taylor1!0| (($$ NIL))
        (PROG (|stc| $ |xn| |x|)
          (LETT |stc| (QREFELT $$ 3))
          (LETT $ (QREFELT $$ 2))
          (LETT |xn| (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|c1| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |stc| (QREFELT $ 94))
                      (SPADCALL (QREFELT $ 97)))
                     ('T
                      (SEQ (LETT |c1| (SPADCALL |stc| (QREFELT $ 95)))
                           (EXIT
                            (SPADCALL (SPADCALL |c1| |xn| (QREFELT $ 67))
                                      (|GENUSER;apply_taylor1|
                                       (SPADCALL |stc| (QREFELT $ 96)) |x|
                                       (SPADCALL |x| |xn| (QREFELT $ 79)) $)
                                      (QREFELT $ 98)))))))))))) 

(SDEFUN |GENUSER;removeZeros;$Expon$;28| ((|x| $) (|ki| |Expon|) ($ $))
        (SPROG
         ((|xs| (|Rep|)) (#1=#:G405 NIL)
          (|tx| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))))
         (SEQ
          (EXIT
           (SEQ (LETT |xs| |x|)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |xs| (QREFELT $ 18))
                          (PROGN (LETT #1# |xs|) (GO #2=#:G404)))
                         ('T
                          (SEQ (LETT |tx| (SPADCALL |xs| (QREFELT $ 50)))
                               (COND
                                ((NULL
                                  (SPADCALL (QCAR |tx|) |ki| (QREFELT $ 24)))
                                 (EXIT (PROGN (LETT #1# |xs|) (GO #2#)))))
                               (COND
                                ((NULL
                                  (SPADCALL (QCDR |tx|) (|spadConstant| $ 19)
                                            (QREFELT $ 42)))
                                 (EXIT (PROGN (LETT #1# |xs|) (GO #2#)))))
                               (EXIT
                                (LETT |xs|
                                      (SPADCALL |xs| (QREFELT $ 30)))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |GENUSER;apply_taylor;S2$;29| ((|stc| |Stream| |Coef|) (|x| $) ($ $))
        (SPROG
         ((|xs| (|Rep|)) (#1=#:G416 NIL)
          (|tx| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))))
         (SEQ (LETT |xs| |x|)
              (SEQ
               (EXIT
                (SEQ G190 NIL
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |xs| (QREFELT $ 18))
                         (PROGN (LETT #1# |$NoValue|) (GO #2=#:G411)))
                        ('T
                         (SEQ (LETT |tx| (SPADCALL |xs| (QREFELT $ 50)))
                              (EXIT
                               (COND
                                ((OR
                                  (SPADCALL (|spadConstant| $ 21) (QCAR |tx|)
                                            (QREFELT $ 24))
                                  (NULL
                                   (SPADCALL (QCDR |tx|) (|spadConstant| $ 19)
                                             (QREFELT $ 42))))
                                 (PROGN (LETT #1# |$NoValue|) (GO #2#)))
                                ('T
                                 (LETT |xs|
                                       (SPADCALL |xs| (QREFELT $ 30)))))))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #2# (EXIT #1#))
              (EXIT
               (COND
                ((SPADCALL |xs| (QREFELT $ 18))
                 (COND ((SPADCALL |stc| (QREFELT $ 94)) (|spadConstant| $ 20))
                       (#3='T
                        (SPADCALL
                         (CONS (|spadConstant| $ 21)
                               (SPADCALL |stc| (QREFELT $ 95)))
                         (SPADCALL (QREFELT $ 26)) (QREFELT $ 28)))))
                ((SPADCALL (|spadConstant| $ 21) (QCAR |tx|) (QREFELT $ 24))
                 (SPADCALL
                  (|GENUSER;apply_taylor1| |stc| |xs| (|spadConstant| $ 29) $)
                  (QREFELT $ 92)))
                (#3#
                 (|error| "apply_taylor: x does not have positive order"))))))) 

(SDEFUN |GENUSER;=;2$B;30| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG
         ((|st| (|Rep|)) (#1=#:G424 NIL)
          (|tst| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))) (#2=#:G425 NIL)
          (|i| NIL) (|n| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |st| (SPADCALL |x| |y| (QREFELT $ 76)))
                (LETT |n| |$streamCount|)
                (SEQ (LETT |i| 0) (LETT #2# |n|) G190
                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |st| (QREFELT $ 18))
                         (PROGN (LETT #1# 'T) (GO #3=#:G423)))
                        ('T
                         (SEQ (LETT |tst| (SPADCALL |st| (QREFELT $ 50)))
                              (COND
                               ((NULL
                                 (SPADCALL (QCDR |tst|) (|spadConstant| $ 19)
                                           (QREFELT $ 42)))
                                (EXIT (PROGN (LETT #1# NIL) (GO #3#)))))
                              (EXIT
                               (LETT |st| (SPADCALL |st| (QREFELT $ 30)))))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |st| (QREFELT $ 18)))))
          #3# (EXIT #1#)))) 

(SDEFUN |GENUSER;order;$2Expon;31| ((|x| $) (|ki| |Expon|) ($ |Expon|))
        (SPROG
         ((|xs| (|Rep|)) (#1=#:G434 NIL)
          (|tx| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))))
         (SEQ
          (EXIT
           (SEQ (LETT |xs| |x|)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |xs| (QREFELT $ 18))
                          (PROGN (LETT #1# |ki|) (GO #2=#:G433)))
                         ('T
                          (SEQ (LETT |tx| (SPADCALL |xs| (QREFELT $ 50)))
                               (COND
                                ((NULL
                                  (SPADCALL (QCAR |tx|) |ki| (QREFELT $ 24)))
                                 (EXIT (PROGN (LETT #1# |ki|) (GO #2#)))))
                               (COND
                                ((NULL
                                  (SPADCALL (QCDR |tx|) (|spadConstant| $ 19)
                                            (QREFELT $ 42)))
                                 (EXIT
                                  (PROGN (LETT #1# (QCAR |tx|)) (GO #2#)))))
                               (EXIT
                                (LETT |xs|
                                      (SPADCALL |xs| (QREFELT $ 30)))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |GENUSER;order;$Expon;32| ((|x| $) ($ |Expon|))
        (SPROG
         ((|xs| (|Rep|)) (#1=#:G442 NIL)
          (|tx| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))))
         (SEQ
          (EXIT
           (SEQ (LETT |xs| |x|)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |xs| (QREFELT $ 18))
                          (|error| "series of infinite order"))
                         ('T
                          (SEQ (LETT |tx| (SPADCALL |xs| (QREFELT $ 50)))
                               (COND
                                ((NULL
                                  (SPADCALL (QCDR |tx|) (|spadConstant| $ 19)
                                            (QREFELT $ 42)))
                                 (EXIT
                                  (PROGN
                                   (LETT #1# (QCAR |tx|))
                                   (GO #2=#:G441)))))
                               (EXIT
                                (LETT |xs|
                                      (SPADCALL |xs| (QREFELT $ 30)))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |GENUSER;extend;$Expon$;33| ((|x| $) (|ki| |Expon|) ($ $))
        (SPROG
         ((|xs| (|Rep|)) (#1=#:G450 NIL)
          (|tx| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))))
         (SEQ
          (EXIT
           (SEQ (LETT |xs| |x|)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |xs| (QREFELT $ 18))
                          (PROGN (LETT #1# |x|) (GO #2=#:G449)))
                         ('T
                          (SEQ (LETT |tx| (SPADCALL |xs| (QREFELT $ 50)))
                               (COND
                                ((NULL
                                  (SPADCALL (QCAR |tx|) |ki| (QREFELT $ 24)))
                                 (EXIT (PROGN (LETT #1# |x|) (GO #2#)))))
                               (EXIT
                                (LETT |xs|
                                      (SPADCALL |xs| (QREFELT $ 30)))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |GENUSER;truncate;$Expon$;34| ((|x| $) (|ki| |Expon|) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|GENUSER;truncate;$Expon$;34!0| (VECTOR |ki| $ |x|))
                 (QREFELT $ 75))))) 

(SDEFUN |GENUSER;truncate;$Expon$;34!0| (($$ NIL))
        (PROG (|x| $ |ki|)
          (LETT |x| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |ki| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|xs| NIL) (|tx| NIL))
                   (SEQ (LETT |xs| |x|)
                        (EXIT
                         (COND
                          ((SPADCALL |xs| (QREFELT $ 18))
                           (SPADCALL (QREFELT $ 26)))
                          ('T
                           (SEQ (LETT |tx| (SPADCALL |xs| (QREFELT $ 50)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |ki| (QCAR |tx|) (QREFELT $ 24))
                                   (SPADCALL (QREFELT $ 26)))
                                  ('T
                                   (SPADCALL |tx|
                                             (SPADCALL
                                              (SPADCALL |xs| (QREFELT $ 30))
                                              |ki| (QREFELT $ 105))
                                             (QREFELT $ 28))))))))))))))) 

(SDEFUN |GENUSER;truncate;$2Expon$;35|
        ((|x| $) (|k1| |Expon|) (|k2| |Expon|) ($ $))
        (SPROG
         ((|xs| (|Rep|)) (#1=#:G473 NIL)
          (|tx| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))) (#2=#:G474 NIL)
          (|#G70| (|Expon|)) (|#G69| (|Expon|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |k2| |k1| (QREFELT $ 24))
              (PROGN
               (LETT |#G69| |k2|)
               (LETT |#G70| |k1|)
               (LETT |k1| |#G69|)
               (LETT |k2| |#G70|))))
            (LETT |xs| |x|)
            (SEQ
             (EXIT
              (SEQ G190 NIL
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |xs| (QREFELT $ 18))
                       (PROGN
                        (LETT #2# (SPADCALL (QREFELT $ 26)))
                        (GO #3=#:G472)))
                      ('T
                       (SEQ (LETT |tx| (SPADCALL |xs| (QREFELT $ 50)))
                            (COND
                             ((NULL (SPADCALL (QCAR |tx|) |k1| (QREFELT $ 24)))
                              (EXIT
                               (PROGN (LETT #1# |$NoValue|) (GO #4=#:G470)))))
                            (EXIT
                             (LETT |xs| (SPADCALL |xs| (QREFELT $ 30)))))))))
                   NIL (GO G190) G191 (EXIT NIL)))
             #4# (EXIT #1#))
            (EXIT (SPADCALL |xs| |k2| (QREFELT $ 105)))))
          #3# (EXIT #2#)))) 

(SDEFUN |GENUSER;complete;2$;36| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 107))) 

(SDEFUN |GENUSER;coefficient;$ExponCoef;37| ((|x| $) (|ki| |Expon|) ($ |Coef|))
        (SPROG
         ((|xs| (|Rep|)) (#1=#:G483 NIL)
          (|tx| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))))
         (SEQ
          (EXIT
           (SEQ (LETT |xs| |x|)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |xs| (QREFELT $ 18))
                          (PROGN
                           (LETT #1# (|spadConstant| $ 19))
                           (GO #2=#:G482)))
                         ('T
                          (SEQ (LETT |tx| (SPADCALL |xs| (QREFELT $ 50)))
                               (EXIT
                                (COND
                                 ((SPADCALL |ki| (QCAR |tx|) (QREFELT $ 24))
                                  (PROGN
                                   (LETT #1# (|spadConstant| $ 19))
                                   (GO #2#)))
                                 ((SPADCALL |ki| (QCAR |tx|) (QREFELT $ 36))
                                  (PROGN (LETT #1# (QCDR |tx|)) (GO #2#)))
                                 ('T
                                  (LETT |xs|
                                        (SPADCALL |xs| (QREFELT $ 30)))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |GENUSER;elt;$ExponCoef;38| ((|x| $) (|ki| |Expon|) ($ |Coef|))
        (SPADCALL |x| |ki| (QREFELT $ 109))) 

(SDEFUN |GENUSER;leadingMonomial;2$;39| ((|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 18)) (|spadConstant| $ 20))
              ('T
               (SPADCALL (SPADCALL |x| (QREFELT $ 111))
                         (SPADCALL (QREFELT $ 26)) (QREFELT $ 28))))) 

(SDEFUN |GENUSER;apply_or_error|
        ((|fn| |Mapping| #1=(|Union| $ "failed") $) (|xs| |String|) (|x| $)
         ($ $))
        (SPROG ((|resu| #1#))
               (SEQ (LETT |resu| (SPADCALL |x| |fn|))
                    (EXIT
                     (COND
                      ((QEQCAR |resu| 1) (|error| (STRCONC |xs| ": failed")))
                      ('T (QCDR |resu|))))))) 

(SDEFUN |GENUSER;exp;2$;41| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 115) "exp" |x| $)) 

(SDEFUN |GENUSER;log;2$;42| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 117) "log" |x| $)) 

(SDEFUN |GENUSER;sin;2$;43| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 119) "sin" |x| $)) 

(SDEFUN |GENUSER;cos;2$;44| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 121) "cos" |x| $)) 

(SDEFUN |GENUSER;tan;2$;45| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 123) "tan" |x| $)) 

(SDEFUN |GENUSER;cot;2$;46| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 125) "cot" |x| $)) 

(SDEFUN |GENUSER;sec;2$;47| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 127) "sec" |x| $)) 

(SDEFUN |GENUSER;csc;2$;48| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 129) "csc" |x| $)) 

(SDEFUN |GENUSER;asin;2$;49| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 131) "asin" |x| $)) 

(SDEFUN |GENUSER;acos;2$;50| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 133) "acos" |x| $)) 

(SDEFUN |GENUSER;atan;2$;51| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 135) "atan" |x| $)) 

(SDEFUN |GENUSER;acot;2$;52| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 137) "acot" |x| $)) 

(SDEFUN |GENUSER;asec;2$;53| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 139) "asec" |x| $)) 

(SDEFUN |GENUSER;acsc;2$;54| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 141) "acsc" |x| $)) 

(SDEFUN |GENUSER;sinh;2$;55| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 143) "sinh" |x| $)) 

(SDEFUN |GENUSER;cosh;2$;56| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 145) "cosh" |x| $)) 

(SDEFUN |GENUSER;tanh;2$;57| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 147) "tanh" |x| $)) 

(SDEFUN |GENUSER;coth;2$;58| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 149) "coth" |x| $)) 

(SDEFUN |GENUSER;sech;2$;59| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 151) "sech" |x| $)) 

(SDEFUN |GENUSER;csch;2$;60| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 153) "csch" |x| $)) 

(SDEFUN |GENUSER;asinh;2$;61| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 155) "asinh" |x| $)) 

(SDEFUN |GENUSER;acosh;2$;62| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 157) "acosh" |x| $)) 

(SDEFUN |GENUSER;atanh;2$;63| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 159) "atanh" |x| $)) 

(SDEFUN |GENUSER;acoth;2$;64| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 161) "acoth" |x| $)) 

(SDEFUN |GENUSER;asech;2$;65| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 163) "asech" |x| $)) 

(SDEFUN |GENUSER;acsch;2$;66| ((|x| $) ($ $))
        (|GENUSER;apply_or_error| (ELT $ 165) "acsch" |x| $)) 

(SDEFUN |GENUSER;pi;$;67| (($ $))
        (SPADCALL (SPADCALL (QREFELT $ 167)) (|spadConstant| $ 21)
                  (QREFELT $ 35))) 

(DECLAIM (NOTINLINE |GeneralizedUnivariatePowerSeries;|)) 

(DEFUN |GeneralizedUnivariatePowerSeries| (&REST #1=#:G645)
  (SPROG NIL
         (PROG (#2=#:G646)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GeneralizedUnivariatePowerSeries|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GeneralizedUnivariatePowerSeries;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GeneralizedUnivariatePowerSeries|)))))))))) 

(DEFUN |GeneralizedUnivariatePowerSeries;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (#1=#:G636 NIL) (#2=#:G637 NIL) (#3=#:G638 NIL) (#4=#:G639 NIL)
    (#5=#:G640 NIL) (#6=#:G641 NIL) (#7=#:G643 NIL) ($ NIL) (|dv$| NIL)
    (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|GeneralizedUnivariatePowerSeries| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 185))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#2|)
                                                               (|devaluate|
                                                                |#1|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#2|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| |#2| '(|SemiGroup|))
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1| '(|Field|))
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #7#
                                            (|HasCategory| |#1| '(|Field|)))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#2|))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#2|))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (LETT #6#
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              #6#
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#2|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              #6#))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR #7#
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             #6#)
                                            #5#)
                                        (OR
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              #6#)
                                         #5#)
                                        (OR #7# (|HasCategory| |#1| '(|Field|))
                                            #5#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #5#)
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #4#
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              #6#
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#2|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #3# #4#
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              #6#
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              #6#
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianMonoid|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#2|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #2#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#2|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #1#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #1#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#2|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #7# (|HasCategory| |#1| '(|Field|))
                                         #5# #1#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#2|)
                                                                (|devaluate|
                                                                 |#1|)))))))))
    (|haddProp| |$ConstructorCache| '|GeneralizedUnivariatePowerSeries|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianGroup|))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|Field|)) #6#)
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) (|devaluate| |#2|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 2147483648))
    (AND
     (OR #4# (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|Field|)) #6#)
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) (|devaluate| |#2|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR #3# (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|Field|)) #6#)
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) (|devaluate| |#2|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 8589934592))
    (AND
     (OR (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|Field|)) #6#)
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #2#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) (|devaluate| |#2|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 17179869184))
    (AND
     (OR (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|Field|)) #6#)
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #1#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) (|devaluate| |#2|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 34359738368))
    (AND
     (OR (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|Field|)) #6#)
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 68719476736))
    (AND
     (OR (AND (|HasCategory| |#1| '(|Field|)) #6#)
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 137438953472))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10 (|Stream| (|Record| (|:| |k| |#2|) (|:| |c| |#1|))))
    (COND
     ((|HasCategory| |#2| '(|CancellationAbelianMonoid|))
      (PROGN
       (QSETREFV $ 84 (CONS (|dispatchFunction| |GENUSER;exquo;2$U;22|) $))
       (QSETREFV $ 85 (CONS (|dispatchFunction| |GENUSER;recip;$U;23|) $))
       (COND
        ((|testBitVector| |pv$| 7)
         (COND
          ((|testBitVector| |pv$| 13)
           (QSETREFV $ 86
                     (CONS (|dispatchFunction| |GENUSER;/;3$;24|) $)))))))))
    (COND
     ((|testBitVector| |pv$| 6)
      (PROGN
       (QSETREFV $ 116 (CONS (|dispatchFunction| |GENUSER;exp;2$;41|) $))
       (QSETREFV $ 118 (CONS (|dispatchFunction| |GENUSER;log;2$;42|) $))
       (QSETREFV $ 120 (CONS (|dispatchFunction| |GENUSER;sin;2$;43|) $))
       (QSETREFV $ 122 (CONS (|dispatchFunction| |GENUSER;cos;2$;44|) $))
       (QSETREFV $ 124 (CONS (|dispatchFunction| |GENUSER;tan;2$;45|) $))
       (QSETREFV $ 126 (CONS (|dispatchFunction| |GENUSER;cot;2$;46|) $))
       (QSETREFV $ 128 (CONS (|dispatchFunction| |GENUSER;sec;2$;47|) $))
       (QSETREFV $ 130 (CONS (|dispatchFunction| |GENUSER;csc;2$;48|) $))
       (QSETREFV $ 132 (CONS (|dispatchFunction| |GENUSER;asin;2$;49|) $))
       (QSETREFV $ 134 (CONS (|dispatchFunction| |GENUSER;acos;2$;50|) $))
       (QSETREFV $ 136 (CONS (|dispatchFunction| |GENUSER;atan;2$;51|) $))
       (QSETREFV $ 138 (CONS (|dispatchFunction| |GENUSER;acot;2$;52|) $))
       (QSETREFV $ 140 (CONS (|dispatchFunction| |GENUSER;asec;2$;53|) $))
       (QSETREFV $ 142 (CONS (|dispatchFunction| |GENUSER;acsc;2$;54|) $))
       (QSETREFV $ 144 (CONS (|dispatchFunction| |GENUSER;sinh;2$;55|) $))
       (QSETREFV $ 146 (CONS (|dispatchFunction| |GENUSER;cosh;2$;56|) $))
       (QSETREFV $ 148 (CONS (|dispatchFunction| |GENUSER;tanh;2$;57|) $))
       (QSETREFV $ 150 (CONS (|dispatchFunction| |GENUSER;coth;2$;58|) $))
       (QSETREFV $ 152 (CONS (|dispatchFunction| |GENUSER;sech;2$;59|) $))
       (QSETREFV $ 154 (CONS (|dispatchFunction| |GENUSER;csch;2$;60|) $))
       (QSETREFV $ 156 (CONS (|dispatchFunction| |GENUSER;asinh;2$;61|) $))
       (QSETREFV $ 158 (CONS (|dispatchFunction| |GENUSER;acosh;2$;62|) $))
       (QSETREFV $ 160 (CONS (|dispatchFunction| |GENUSER;atanh;2$;63|) $))
       (QSETREFV $ 162 (CONS (|dispatchFunction| |GENUSER;acoth;2$;64|) $))
       (QSETREFV $ 164 (CONS (|dispatchFunction| |GENUSER;asech;2$;65|) $))
       (QSETREFV $ 166 (CONS (|dispatchFunction| |GENUSER;acsch;2$;66|) $)))))
    (COND
     ((|HasCategory| |#1| '(|TranscendentalFunctionCategory|))
      (QSETREFV $ 168 (CONS (|dispatchFunction| |GENUSER;pi;$;67|) $))))
    $))) 

(MAKEPROP '|GeneralizedUnivariatePowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|Rep|
              (|Record| (|:| |k| 7) (|:| |c| 6)) (|Stream| 11)
              |GENUSER;terms;$S;1| |GENUSER;center;$Coef;2| (|Symbol|)
              |GENUSER;variable;$S;3| (|Boolean|) (0 . |empty?|) (5 . |Zero|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |GENUSER;Zero;$;5|) $))
              (9 . |Zero|) |GENUSER;removeZeros;$Expon$;28|
              |GENUSER;degree;$Expon;12| (13 . <) |GENUSER;pole?;$B;4|
              (19 . |empty|) (23 . |One|) (27 . |concat|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |GENUSER;One;$;6|) $))
              (33 . |rst|) |GENUSER;reductum;2$;7| (|NonNegativeInteger|)
              (38 . |characteristic|) |GENUSER;characteristic;Nni;8|
              |GENUSER;monomial;CoefExpon$;9| (42 . =) (|OutputForm|)
              (48 . |coerce|) (53 . |One|) (57 . |coerce|) (62 . ^) (68 . =)
              (74 . -) (79 . -) (84 . *) (90 . |zero?|) (95 . |coerce|)
              (100 . -) (106 . |paren|) (111 . |frst|) (116 . ~=)
              (122 . |explicitlyEmpty?|) (|String|) (127 . |message|)
              (|List| $) (132 . |prefix|) (138 . +) (|Mapping| 37 37 37)
              (|List| 37) (144 . |reduce|) |GENUSER;coerce;$Of;11|
              (|Mapping| 11 11) (150 . |map|) (|Mapping| 6 6)
              |GENUSER;map;M2$;13| (156 . *) |GENUSER;*;Coef2$;14|
              (|PositiveInteger|) (162 . *) |GENUSER;multiplyExponents;$Pi$;15|
              |GENUSER;-;2$;16| |GENUSER;+;3$;17| (168 . +) (|Mapping| $)
              (174 . |delay|) |GENUSER;-;3$;18| (179 . -) (185 . +)
              |GENUSER;*;3$;19| (|Union| $ '"failed") (191 . |subtractIfCan|)
              (197 . >) (203 . |recip|) (208 . |exquo|) (214 . |recip|)
              (219 . /) (|Stream| $$) (225 . |empty?|) (230 . |frst|)
              (235 . |rst|) (|Stream| $) |GENUSER;infsum;S$;26| (|Stream| 6)
              (240 . |empty?|) (245 . |frst|) (250 . |rst|) (255 . |empty|)
              (259 . |concat|) (265 . |delay|) |GENUSER;apply_taylor;S2$;29|
              |GENUSER;=;2$B;30| |GENUSER;order;$2Expon;31|
              |GENUSER;order;$Expon;32| |GENUSER;extend;$Expon$;33|
              |GENUSER;truncate;$Expon$;34| |GENUSER;truncate;$2Expon$;35|
              (270 . |complete|) |GENUSER;complete;2$;36|
              |GENUSER;coefficient;$ExponCoef;37| |GENUSER;elt;$ExponCoef;38|
              (275 . |first|) |GENUSER;leadingMonomial;2$;39|
              (|Union| $$ '"failed")
              (|ElementaryFunctionsGeneralizedUnivariatePowerSeries| 6 7 $$)
              (280 . |expIfCan|) (285 . |exp|) (290 . |logIfCan|) (295 . |log|)
              (300 . |sinIfCan|) (305 . |sin|) (310 . |cosIfCan|) (315 . |cos|)
              (320 . |tanIfCan|) (325 . |tan|) (330 . |cotIfCan|) (335 . |cot|)
              (340 . |secIfCan|) (345 . |sec|) (350 . |cscIfCan|) (355 . |csc|)
              (360 . |asinIfCan|) (365 . |asin|) (370 . |acosIfCan|)
              (375 . |acos|) (380 . |atanIfCan|) (385 . |atan|)
              (390 . |acotIfCan|) (395 . |acot|) (400 . |asecIfCan|)
              (405 . |asec|) (410 . |acscIfCan|) (415 . |acsc|)
              (420 . |sinhIfCan|) (425 . |sinh|) (430 . |coshIfCan|)
              (435 . |cosh|) (440 . |tanhIfCan|) (445 . |tanh|)
              (450 . |cothIfCan|) (455 . |coth|) (460 . |sechIfCan|)
              (465 . |sech|) (470 . |cschIfCan|) (475 . |csch|)
              (480 . |asinhIfCan|) (485 . |asinh|) (490 . |acoshIfCan|)
              (495 . |acosh|) (500 . |atanhIfCan|) (505 . |atanh|)
              (510 . |acothIfCan|) (515 . |acoth|) (520 . |asechIfCan|)
              (525 . |asech|) (530 . |acschIfCan|) (535 . |acsch|) (540 . |pi|)
              (544 . |pi|) (|Integer|) (|Factored| $) (|Union| 55 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 173 '#1#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 55) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| 15) (|List| 32)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 169) (|SingleInteger|) (|HashState|))
           '#(~= 548 |zero?| 554 |variable| 559 |unitNormal| 564
              |unitCanonical| 569 |unit?| 574 |truncate| 579 |terms| 592 |tanh|
              597 |tan| 602 |subtractIfCan| 607 |squareFreePart| 613
              |squareFree| 618 |sizeLess?| 623 |sinh| 629 |sin| 634 |sech| 639
              |sec| 644 |sample| 649 |rightRecip| 653 |rightPower| 658
              |removeZeros| 670 |rem| 676 |reductum| 682 |recip| 687 |quo| 692
              |principalIdeal| 698 |prime?| 703 |pole?| 708 |pi| 713 |order|
              717 |opposite?| 728 |one?| 734 |multiplyExponents| 739
              |multiEuclidean| 745 |monomial?| 751 |monomial| 756 |map| 762
              |log| 768 |leftRecip| 773 |leftPower| 778 |leadingMonomial| 790
              |leadingCoefficient| 795 |lcmCoef| 800 |lcm| 806 |latex| 817
              |inv| 822 |infsum| 827 |hashUpdate!| 832 |hash| 838
              |gcdPolynomial| 843 |gcd| 849 |factor| 860 |extendedEuclidean|
              865 |extend| 878 |exquo| 884 |expressIdealMember| 890 |exp| 896
              |eval| 901 |euclideanSize| 907 |elt| 912 |divide| 924
              |differentiate| 930 |degree| 967 |csch| 972 |csc| 977 |coth| 982
              |cot| 987 |cosh| 992 |cos| 997 |complete| 1002 |commutator| 1007
              |coerce| 1013 |coefficient| 1038 |charthRoot| 1044
              |characteristic| 1049 |center| 1053 |atanh| 1058 |atan| 1063
              |associator| 1068 |associates?| 1075 |asinh| 1081 |asin| 1086
              |asech| 1091 |asec| 1096 |approximate| 1101 |apply_taylor| 1107
              |antiCommutator| 1113 |annihilate?| 1119 |acsch| 1125 |acsc| 1130
              |acoth| 1135 |acot| 1140 |acosh| 1145 |acos| 1150 ^ 1155 |Zero|
              1179 |One| 1183 D 1187 = 1224 / 1230 - 1242 + 1253 * 1259)
           'NIL
           (CONS
            (|makeByteWordVec2| 30
                                '(14 0 14 0 14 14 0 14 21 14 20 14 1 2 9 4 3 18
                                  21 16 30 27 30 0 9 18 16 0 0 29 16 0 0 0 0 30
                                  16 16 15 23 27 27 0 0 25 27 0 0 0 6 18 0 0 0
                                  5 6 6 6 6 6 29 18 19 14 14))
            (CONS
             '#(|Field&| |UnivariatePowerSeriesCategory&| |EuclideanDomain&|
                |PowerSeriesCategory&| NIL |UniqueFactorizationDomain&|
                |AbelianMonoidRing&| |GcdDomain&| NIL NIL NIL |DivisionRing&|
                NIL NIL |Algebra&| |PartialDifferentialRing&|
                |DifferentialRing&| |Algebra&| |EntireRing&| |Algebra&| NIL NIL
                |Rng&| NIL |Module&| |Module&| |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL |AbelianGroup&| NIL NIL NIL |NonAssociativeSemiRng&|
                NIL |AbelianMonoid&| |MagmaWithUnit&| |Magma&|
                |AbelianSemiGroup&| |SetCategory&|
                |TranscendentalFunctionCategory&| NIL NIL |BasicType&| NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL NIL NIL NIL)
             (CONS
              '#((|Field|) (|UnivariatePowerSeriesCategory| 6 7)
                 (|EuclideanDomain|)
                 (|PowerSeriesCategory| 6 7 (|SingletonAsOrderedSet|))
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 7) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Algebra| 6)
                 (|PartialDifferentialRing| 15) (|DifferentialRing|)
                 (|Algebra| $$) (|EntireRing|) (|Algebra| 182) (|Ring|)
                 (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| 6) (|Module| $$)
                 (|Module| 182) (|BiModule| 6 6) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|BiModule| 182 182) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| 182) (|RightModule| 182)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Magma|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|TranscendentalFunctionCategory|)
                 (|CommutativeStar|) (|VariablesCommuteWithCoefficients|)
                 (|BasicType|) (|CoercibleTo| 37) (|Eltable| $$ $$)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|))
              (|makeByteWordVec2| 184
                                  '(1 10 17 0 18 0 6 0 19 0 7 0 21 2 7 17 0 0
                                    24 0 10 0 26 0 6 0 27 2 10 0 11 0 28 1 10 0
                                    0 30 0 6 32 33 2 7 17 0 0 36 1 6 37 0 38 0
                                    7 0 39 1 7 37 0 40 2 37 0 0 0 41 2 6 17 0 0
                                    42 1 6 0 0 43 1 37 0 0 44 2 37 0 0 0 45 1 6
                                    17 0 46 1 15 37 0 47 2 37 0 0 0 48 1 37 0 0
                                    49 1 10 11 0 50 2 6 17 0 0 51 1 10 17 0 52
                                    1 37 0 53 54 2 37 0 0 55 56 2 37 0 0 0 57 2
                                    59 37 58 0 60 2 10 0 62 0 63 2 6 0 0 0 66 2
                                    7 0 68 0 69 2 6 0 0 0 73 1 10 0 74 75 2 6 0
                                    0 0 77 2 7 0 0 0 78 2 7 80 0 0 81 2 32 17 0
                                    0 82 1 6 80 0 83 2 0 80 0 0 84 1 0 80 0 85
                                    2 0 0 0 0 86 1 87 17 0 88 1 87 2 0 89 1 87
                                    0 0 90 1 93 17 0 94 1 93 6 0 95 1 93 0 0 96
                                    0 87 0 97 2 87 0 2 0 98 1 87 0 74 99 1 10 0
                                    0 107 1 10 11 0 111 1 114 113 2 115 1 0 0 0
                                    116 1 114 113 2 117 1 0 0 0 118 1 114 113 2
                                    119 1 0 0 0 120 1 114 113 2 121 1 0 0 0 122
                                    1 114 113 2 123 1 0 0 0 124 1 114 113 2 125
                                    1 0 0 0 126 1 114 113 2 127 1 0 0 0 128 1
                                    114 113 2 129 1 0 0 0 130 1 114 113 2 131 1
                                    0 0 0 132 1 114 113 2 133 1 0 0 0 134 1 114
                                    113 2 135 1 0 0 0 136 1 114 113 2 137 1 0 0
                                    0 138 1 114 113 2 139 1 0 0 0 140 1 114 113
                                    2 141 1 0 0 0 142 1 114 113 2 143 1 0 0 0
                                    144 1 114 113 2 145 1 0 0 0 146 1 114 113 2
                                    147 1 0 0 0 148 1 114 113 2 149 1 0 0 0 150
                                    1 114 113 2 151 1 0 0 0 152 1 114 113 2 153
                                    1 0 0 0 154 1 114 113 2 155 1 0 0 0 156 1
                                    114 113 2 157 1 0 0 0 158 1 114 113 2 159 1
                                    0 0 0 160 1 114 113 2 161 1 0 0 0 162 1 114
                                    113 2 163 1 0 0 0 164 1 114 113 2 165 1 0 0
                                    0 166 0 6 0 167 0 0 0 168 2 0 17 0 0 1 1 34
                                    17 0 1 1 0 15 0 16 1 38 181 0 1 1 38 0 0 1
                                    1 38 17 0 1 2 0 0 0 7 105 3 0 0 0 7 7 106 1
                                    0 12 0 13 1 6 0 0 148 1 6 0 0 124 2 33 80 0
                                    0 1 1 14 0 0 1 1 14 170 0 1 2 14 17 0 0 1 1
                                    6 0 0 144 1 6 0 0 120 1 6 0 0 152 1 6 0 0
                                    128 0 34 0 1 1 35 80 0 1 2 35 0 0 32 1 2 0
                                    0 0 68 1 2 0 0 0 7 22 2 14 0 0 0 1 1 0 0 0
                                    31 1 35 80 0 85 2 14 0 0 0 1 1 14 176 55 1
                                    1 14 17 0 1 1 0 17 0 25 0 6 0 168 1 0 7 0
                                    103 2 0 7 0 7 102 2 34 17 0 0 1 1 35 17 0 1
                                    2 0 0 0 68 70 2 14 171 55 0 1 1 0 17 0 1 2
                                    0 0 6 7 35 2 0 0 64 0 65 1 6 0 0 118 1 35
                                    80 0 1 2 35 0 0 32 1 2 0 0 0 68 1 1 0 0 0
                                    112 1 0 6 0 1 2 14 178 0 0 1 1 14 0 55 1 2
                                    14 0 0 0 1 1 0 53 0 1 1 14 0 0 1 1 0 0 91
                                    92 2 0 184 184 0 1 1 0 183 0 1 2 14 177 177
                                    177 1 1 14 0 55 1 2 14 0 0 0 1 1 14 170 0 1
                                    2 14 172 0 0 1 3 14 174 0 0 0 1 2 0 0 0 7
                                    104 2 38 80 0 0 84 2 14 171 55 0 1 1 6 0 0
                                    116 2 10 93 0 6 1 1 14 32 0 1 2 5 0 0 0 1 2
                                    0 6 0 7 110 2 14 175 0 0 1 2 4 0 0 179 1 2
                                    4 0 0 15 1 3 4 0 0 179 180 1 3 4 0 0 15 32
                                    1 1 3 0 0 1 2 3 0 0 32 1 1 0 7 0 23 1 6 0 0
                                    154 1 6 0 0 130 1 6 0 0 150 1 6 0 0 126 1 6
                                    0 0 146 1 6 0 0 122 1 0 0 0 108 2 36 0 0 0
                                    1 1 31 0 6 1 1 36 0 169 1 1 37 0 0 1 1 16 0
                                    182 1 1 0 37 0 61 2 0 6 0 7 109 1 1 80 0 1
                                    0 36 32 34 1 0 6 0 14 1 6 0 0 160 1 6 0 0
                                    136 3 36 0 0 0 0 1 2 38 17 0 0 1 1 6 0 0
                                    156 1 6 0 0 132 1 6 0 0 164 1 6 0 0 140 2
                                    11 6 0 7 1 2 0 0 93 0 100 2 0 0 0 0 1 2 36
                                    17 0 0 1 1 6 0 0 166 1 6 0 0 142 1 6 0 0
                                    162 1 6 0 0 138 1 6 0 0 158 1 6 0 0 134 2
                                    14 0 0 169 1 2 35 0 0 32 1 2 6 0 0 0 1 2 0
                                    0 0 68 1 0 34 0 20 0 35 0 29 2 4 0 0 179 1
                                    2 4 0 0 15 1 3 4 0 0 179 180 1 3 4 0 0 15
                                    32 1 1 3 0 0 1 2 3 0 0 32 1 2 0 17 0 0 101
                                    2 14 0 0 0 86 2 7 0 0 6 1 1 32 0 0 71 2 32
                                    0 0 0 76 2 0 0 0 0 72 2 32 0 169 0 1 2 34 0
                                    32 0 1 2 16 0 182 0 1 2 16 0 0 182 1 2 0 0
                                    6 0 67 2 0 0 0 6 1 2 0 0 0 0 79 2 0 0 68 0
                                    1)))))
           '|lookupComplete|)) 
