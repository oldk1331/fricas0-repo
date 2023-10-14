
(PUT '|GENUSER;terms;$S;1| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |GENUSER;terms;$S;1|
        ((|x| $) ($ |Stream| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))))
        |x|) 

(SDEFUN |GENUSER;center;$Coef;2| ((|x| $) ($ |Coef|)) (QREFELT $ 9)) 

(SDEFUN |GENUSER;variable;$S;3| ((|x| $) ($ |Symbol|)) (QREFELT $ 8)) 

(SDEFUN |GENUSER;pole?;$B;4| ((|x| $) ($ |Boolean|))
        (SEQ
         (COND ((SPADCALL |x| (QREFELT $ 18)) 'NIL)
               ('T
                (SEQ
                 (LETT |x| (SPADCALL |x| (|spadConstant| $ 21) (QREFELT $ 22))
                       |GENUSER;pole?;$B;4|)
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
                                     (QREFELT $ 41))))
                         |GENUSER;termOutput|)
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
          (|ti| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))) (|n| NIL)
          (|count| (|Integer|)) (|vv| (|OutputForm|)))
         (SEQ (LETT |xs| |x| . #1=(|GENUSER;coerce;$Of;11|))
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
                           (QREFELT $ 49))))
                        . #1#)
                  (LETT |count| |$streamCount| . #1#) (LETT |l| NIL . #1#)
                  (SEQ (LETT |n| 0 . #1#) G190
                       (COND
                        ((OR (|greater_SI| |n| |count|)
                             (NULL
                              (COND ((SPADCALL |xs| (QREFELT $ 18)) 'NIL)
                                    ('T 'T))))
                         (GO G191)))
                       (SEQ (LETT |ti| (SPADCALL |xs| (QREFELT $ 50)) . #1#)
                            (COND
                             ((SPADCALL (QCDR |ti|) (|spadConstant| $ 19)
                                        (QREFELT $ 51))
                              (LETT |l|
                                    (CONS
                                     (|GENUSER;termOutput| (QCAR |ti|)
                                      (QCDR |ti|) |vv| $)
                                     |l|)
                                    . #1#)))
                            (EXIT
                             (LETT |xs| (SPADCALL |xs| (QREFELT $ 30)) . #1#)))
                       (LETT |n| (|inc_SI| |n|) . #1#) (GO G190) G191
                       (EXIT NIL))
                  (LETT |l|
                        (COND ((SPADCALL |xs| (QREFELT $ 52)) |l|)
                              (#2#
                               (CONS
                                (SPADCALL "o"
                                          (LIST
                                           (SPADCALL |vv|
                                                     (SPADCALL (QCAR |ti|)
                                                               (QREFELT $ 40))
                                                     (QREFELT $ 41)))
                                          (QREFELT $ 54))
                                |l|)))
                        . #1#)
                  (EXIT
                   (COND
                    ((NULL |l|)
                     (SPADCALL (|spadConstant| $ 19) (QREFELT $ 38)))
                    (#2#
                     (SPADCALL (ELT $ 55) (NREVERSE |l|)
                               (QREFELT $ 58)))))))))))) 

(SDEFUN |GENUSER;degree;$Expon;12| ((|x| $) ($ |Expon|))
        (COND ((SPADCALL |x| (QREFELT $ 18)) (|spadConstant| $ 21))
              ('T (QCAR (SPADCALL |x| (QREFELT $ 50)))))) 

(SDEFUN |GENUSER;map;M2$;13| ((|fn| |Mapping| |Coef| |Coef|) (|x| $) ($ $))
        (SPADCALL (CONS #'|GENUSER;map;M2$;13!0| |fn|) |x| (QREFELT $ 61))) 

(SDEFUN |GENUSER;map;M2$;13!0| ((|ti| NIL) (|fn| NIL))
        (CONS (QCAR |ti|) (SPADCALL (QCDR |ti|) |fn|))) 

(SDEFUN |GENUSER;*;Coef2$;14| ((|c1| |Coef|) (|x| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|GENUSER;*;Coef2$;14!0| (VECTOR $ |c1|)) |x|
                         (QREFELT $ 61)))) 

(SDEFUN |GENUSER;*;Coef2$;14!0| ((|ti| NIL) ($$ NIL))
        (PROG (|c1| $)
          (LETT |c1| (QREFELT $$ 1) . #1=(|GENUSER;*;Coef2$;14|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (CONS (QCAR |ti|) (SPADCALL (QCDR |ti|) |c1| (QREFELT $ 64))))))) 

(SDEFUN |GENUSER;multiplyExponents;$Pi$;15|
        ((|x| $) (|n| |PositiveInteger|) ($ $))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GENUSER;multiplyExponents;$Pi$;15!0| (VECTOR $ |n|))
                |x| (QREFELT $ 61)))) 

(SDEFUN |GENUSER;multiplyExponents;$Pi$;15!0| ((|ti| NIL) ($$ NIL))
        (PROG (|n| $)
          (LETT |n| (QREFELT $$ 1) . #1=(|GENUSER;multiplyExponents;$Pi$;15|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (CONS (SPADCALL |n| (QCAR |ti|) (QREFELT $ 67)) (QCDR |ti|)))))) 

(SDEFUN |GENUSER;-;2$;16| ((|x| $) ($ $))
        (SPADCALL (CONS #'|GENUSER;-;2$;16!0| $) |x| (QREFELT $ 61))) 

(SDEFUN |GENUSER;-;2$;16!0| ((|ti| NIL) ($ NIL))
        (CONS (QCAR |ti|) (SPADCALL (QCDR |ti|) (QREFELT $ 43)))) 

(SDEFUN |GENUSER;+;3$;17| ((|x| $) (|y| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|GENUSER;+;3$;17!0| (VECTOR |y| $ |x|))
                          (QREFELT $ 73))))) 

(SDEFUN |GENUSER;+;3$;17!0| (($$ NIL))
        (PROG (|x| $ |y|)
          (LETT |x| (QREFELT $$ 2) . #1=(|GENUSER;+;3$;17|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |y| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|tx| NIL) (|ty| NIL))
                   (SEQ
                    (COND ((SPADCALL |x| (QREFELT $ 18)) |y|)
                          ((SPADCALL |y| (QREFELT $ 18)) |x|)
                          ('T
                           (SEQ (LETT |tx| (SPADCALL |x| (QREFELT $ 50)) NIL)
                                (LETT |ty| (SPADCALL |y| (QREFELT $ 50)) NIL)
                                (EXIT
                                 (COND
                                  ((SPADCALL (QCAR |tx|) (QCAR |ty|)
                                             (QREFELT $ 24))
                                   (SPADCALL (CONS (QCAR |tx|) (QCDR |tx|))
                                             (SPADCALL
                                              (SPADCALL |x| (QREFELT $ 30)) |y|
                                              (QREFELT $ 70))
                                             (QREFELT $ 28)))
                                  ((SPADCALL (QCAR |ty|) (QCAR |tx|)
                                             (QREFELT $ 24))
                                   (SPADCALL (CONS (QCAR |ty|) (QCDR |ty|))
                                             (SPADCALL |x|
                                                       (SPADCALL |y|
                                                                 (QREFELT $
                                                                          30))
                                                       (QREFELT $ 70))
                                             (QREFELT $ 28)))
                                  ('T
                                   (SPADCALL
                                    (CONS (QCAR |tx|)
                                          (SPADCALL (QCDR |tx|) (QCDR |ty|)
                                                    (QREFELT $ 71)))
                                    (SPADCALL (SPADCALL |x| (QREFELT $ 30))
                                              (SPADCALL |y| (QREFELT $ 30))
                                              (QREFELT $ 70))
                                    (QREFELT $ 28)))))))))))))) 

(SDEFUN |GENUSER;-;3$;18| ((|x| $) (|y| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|GENUSER;-;3$;18!0| (VECTOR |y| $ |x|))
                          (QREFELT $ 73))))) 

(SDEFUN |GENUSER;-;3$;18!0| (($$ NIL))
        (PROG (|x| $ |y|)
          (LETT |x| (QREFELT $$ 2) . #1=(|GENUSER;-;3$;18|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |y| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|tx| NIL) (|ty| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT $ 18))
                      (SPADCALL |y| (QREFELT $ 69)))
                     ((SPADCALL |y| (QREFELT $ 18)) |x|)
                     ('T
                      (SEQ (LETT |tx| (SPADCALL |x| (QREFELT $ 50)) NIL)
                           (LETT |ty| (SPADCALL |y| (QREFELT $ 50)) NIL)
                           (EXIT
                            (COND
                             ((SPADCALL (QCAR |tx|) (QCAR |ty|) (QREFELT $ 24))
                              (SPADCALL (CONS (QCAR |tx|) (QCDR |tx|))
                                        (SPADCALL (SPADCALL |x| (QREFELT $ 30))
                                                  |y| (QREFELT $ 74))
                                        (QREFELT $ 28)))
                             ((SPADCALL (QCAR |ty|) (QCAR |tx|) (QREFELT $ 24))
                              (SPADCALL (CONS (QCAR |ty|) (QCDR |ty|))
                                        (SPADCALL |x|
                                                  (SPADCALL |y| (QREFELT $ 30))
                                                  (QREFELT $ 74))
                                        (QREFELT $ 28)))
                             ('T
                              (SPADCALL
                               (CONS (QCAR |tx|)
                                     (SPADCALL (QCDR |tx|) (QCDR |ty|)
                                               (QREFELT $ 75)))
                               (SPADCALL (SPADCALL |x| (QREFELT $ 30))
                                         (SPADCALL |y| (QREFELT $ 30))
                                         (QREFELT $ 74))
                               (QREFELT $ 28)))))))))))))) 

(SDEFUN |GENUSER;*;3$;19| ((|x| $) (|y| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|GENUSER;*;3$;19!0| (VECTOR |y| $ |x|))
                          (QREFELT $ 73))))) 

(SDEFUN |GENUSER;*;3$;19!0| (($$ NIL))
        (PROG (|x| $ |y|)
          (LETT |x| (QREFELT $$ 2) . #1=(|GENUSER;*;3$;19|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |y| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|tx| NIL) (|ty| NIL) (|x1| NIL))
                   (SEQ
                    (COND
                     ((OR (SPADCALL |x| (QREFELT $ 18))
                          (SPADCALL |y| (QREFELT $ 18)))
                      (|spadConstant| $ 20))
                     ('T
                      (SEQ (LETT |tx| (SPADCALL |x| (QREFELT $ 50)) NIL)
                           (LETT |ty| (SPADCALL |y| (QREFELT $ 50)) NIL)
                           (LETT |x1|
                                 (SPADCALL |tx| (SPADCALL (QREFELT $ 26))
                                           (QREFELT $ 28))
                                 NIL)
                           (EXIT
                            (SPADCALL
                             (CONS
                              (SPADCALL (QCAR |tx|) (QCAR |ty|) (QREFELT $ 76))
                              (SPADCALL (QCDR |tx|) (QCDR |ty|)
                                        (QREFELT $ 64)))
                             (SPADCALL
                              (SPADCALL |x1| (SPADCALL |y| (QREFELT $ 30))
                                        (QREFELT $ 77))
                              (SPADCALL (SPADCALL |x| (QREFELT $ 30)) |y|
                                        (QREFELT $ 77))
                              (QREFELT $ 70))
                             (QREFELT $ 28)))))))))))) 

(SDEFUN |GENUSER;exquo1|
        ((|x| $) (|y| $) (|cyinv| |Coef|) (|ky| |Expon|) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|GENUSER;exquo1!0| (VECTOR |y| |cyinv| |ky| $ |x|))
                 (QREFELT $ 73))))) 

(SDEFUN |GENUSER;exquo1!0| (($$ NIL))
        (PROG (|x| $ |ky| |cyinv| |y|)
          (LETT |x| (QREFELT $$ 4) . #1=(|GENUSER;exquo1|))
          (LETT $ (QREFELT $$ 3) . #1#)
          (LETT |ky| (QREFELT $$ 2) . #1#)
          (LETT |cyinv| (QREFELT $$ 1) . #1#)
          (LETT |y| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|tx| NIL) (|dkiu| NIL) (|dki| NIL) (|ci| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT $ 18)) (SPADCALL (QREFELT $ 26)))
                     ('T
                      (SEQ (LETT |tx| (SPADCALL |x| (QREFELT $ 50)) NIL)
                           (LETT |dkiu|
                                 (SPADCALL (QCAR |tx|) |ky| (QREFELT $ 79))
                                 NIL)
                           (EXIT
                            (COND
                             ((QEQCAR |dkiu| 1)
                              (|error| "cannot subtract exponents"))
                             ('T
                              (SEQ (LETT |dki| (QCDR |dkiu|) NIL)
                                   (LETT |ci|
                                         (SPADCALL |cyinv| (QCDR |tx|)
                                                   (QREFELT $ 64))
                                         NIL)
                                   (EXIT
                                    (SPADCALL (CONS |dki| |ci|)
                                              (|GENUSER;exquo1|
                                               (SPADCALL
                                                (SPADCALL |x| (QREFELT $ 30))
                                                (SPADCALL
                                                 (SPADCALL |ci| |dki|
                                                           (QREFELT $ 35))
                                                 (SPADCALL |y| (QREFELT $ 30))
                                                 (QREFELT $ 77))
                                                (QREFELT $ 74))
                                               |y| |cyinv| |ky| $)
                                              (QREFELT $ 28)))))))))))))))) 

(SDEFUN |GENUSER;exquo2| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (SPROG
         ((#1=#:G408 NIL) (#2=#:G406 NIL)
          (|tx| #3=(|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))) (|n| NIL)
          (|cyinv| (|Union| |Coef| "failed")) (|ky| (|Expon|)) (#4=#:G407 NIL)
          (|ty| #3#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (EXIT
              (SEQ (LETT |n| 1 . #5=(|GENUSER;exquo2|)) G190 NIL
                   (SEQ
                    (EXIT
                     (COND
                      ((OR (SPADCALL |n| 1000 (QREFELT $ 80))
                           (SPADCALL |y| (QREFELT $ 18)))
                       (PROGN
                        (LETT #1# (CONS 1 "failed") . #5#)
                        (GO #6=#:G405)))
                      ('T
                       (SEQ (LETT |ty| (SPADCALL |y| (QREFELT $ 50)) . #5#)
                            (COND
                             ((NULL
                               (SPADCALL (QCDR |ty|) (|spadConstant| $ 19)
                                         (QREFELT $ 42)))
                              (EXIT
                               (PROGN
                                (LETT #4# |$NoValue| . #5#)
                                (GO #7=#:G391)))))
                            (EXIT
                             (LETT |y| (SPADCALL |y| (QREFELT $ 30))
                                   . #5#)))))))
                   (LETT |n| (|inc_SI| |n|) . #5#) (GO G190) G191 (EXIT NIL)))
             #7# (EXIT #4#))
            (LETT |ky| (QCAR |ty|) . #5#)
            (LETT |cyinv| (SPADCALL (QCDR |ty|) (QREFELT $ 81)) . #5#)
            (EXIT
             (COND ((QEQCAR |cyinv| 1) (CONS 1 "failed"))
                   ('T
                    (SEQ
                     (SEQ
                      (EXIT
                       (SEQ (LETT |n| 1 . #5#) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |n| 1000 (QREFELT $ 80))
                                (PROGN
                                 (LETT #1# (CONS 1 "failed") . #5#)
                                 (GO #6#)))
                               ((SPADCALL |x| (QREFELT $ 18))
                                (PROGN
                                 (LETT #1# (CONS 0 (SPADCALL (QREFELT $ 26)))
                                       . #5#)
                                 (GO #6#)))
                               ('T
                                (SEQ
                                 (LETT |tx| (SPADCALL |x| (QREFELT $ 50))
                                       . #5#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR
                                     (SPADCALL (QCAR |tx|) |ky| (QREFELT $ 79))
                                     0)
                                    (PROGN
                                     (LETT #2# |$NoValue| . #5#)
                                     (GO #8=#:G402)))
                                   ((NULL
                                     (SPADCALL (QCDR |tx|)
                                               (|spadConstant| $ 19)
                                               (QREFELT $ 42)))
                                    (PROGN
                                     (LETT #1# (CONS 1 "failed") . #5#)
                                     (GO #6#)))
                                   ('T
                                    (LETT |x| (SPADCALL |x| (QREFELT $ 30))
                                          . #5#)))))))))
                            (LETT |n| (|inc_SI| |n|) . #5#) (GO G190) G191
                            (EXIT NIL)))
                      #8# (EXIT #2#))
                     (EXIT
                      (CONS 0
                            (|GENUSER;exquo1| |x| |y| (QCDR |cyinv|) |ky|
                             $)))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |GENUSER;exquo;2$U;22| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (|GENUSER;exquo2| |x| |y| $)) 

(SDEFUN |GENUSER;recip;$U;23| ((|x| $) ($ |Union| $ "failed"))
        (|GENUSER;exquo2| (|spadConstant| $ 29) |x| $)) 

(SDEFUN |GENUSER;/;3$;24| ((|x| $) (|y| $) ($ $))
        (SPROG ((|resu| (|Union| $ "failed")))
               (SEQ
                (LETT |resu| (SPADCALL |x| |y| (QREFELT $ 82))
                      |GENUSER;/;3$;24|)
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
                 (QREFELT $ 73))))) 

(SDEFUN |GENUSER;infsum1!0| (($$ NIL))
        (PROG (|stx| $ |k1| |c1|)
          (LETT |stx| (QREFELT $$ 3) . #1=(|GENUSER;infsum1|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |k1| (QREFELT $$ 1) . #1#)
          (LETT |c1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|stx1| NIL) (|t1| NIL) (|x1| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |stx| (QREFELT $ 86))
                      (SPADCALL (CONS |k1| |c1|) (SPADCALL (QREFELT $ 26))
                                (QREFELT $ 28)))
                     ('T
                      (SEQ (LETT |x1| (SPADCALL |stx| (QREFELT $ 87)) NIL)
                           (LETT |stx1| (SPADCALL |stx| (QREFELT $ 88)) NIL)
                           (EXIT
                            (COND
                             ((SPADCALL |x1| (QREFELT $ 18))
                              (|GENUSER;infsum1| |stx1| |k1| |c1| $))
                             ('T
                              (SEQ
                               (LETT |t1| (SPADCALL |x1| (QREFELT $ 50)) NIL)
                               (LETT |x1| (SPADCALL |x1| (QREFELT $ 30)) NIL)
                               (EXIT
                                (COND
                                 ((SPADCALL |k1| (QCAR |t1|) (QREFELT $ 24))
                                  (SPADCALL (CONS |k1| |c1|)
                                            (SPADCALL |x1|
                                                      (|GENUSER;infsum1| |stx1|
                                                       (QCAR |t1|) (QCDR |t1|)
                                                       $)
                                                      (QREFELT $ 70))
                                            (QREFELT $ 28)))
                                 ((SPADCALL (QCAR |t1|) |k1| (QREFELT $ 24))
                                  (|error| "infsum: degrees not monotone"))
                                 ('T
                                  (SPADCALL |x1|
                                            (|GENUSER;infsum1| |stx1| |k1|
                                             (SPADCALL |c1| (QCDR |t1|)
                                                       (QREFELT $ 71))
                                             $)
                                            (QREFELT $ 70)))))))))))))))))) 

(SDEFUN |GENUSER;infsum;S$;26| ((|stx| |Stream| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|GENUSER;infsum;S$;26!0| (VECTOR $ |stx|))
                          (QREFELT $ 73))))) 

(SDEFUN |GENUSER;infsum;S$;26!0| (($$ NIL))
        (PROG (|stx| $)
          (LETT |stx| (QREFELT $$ 1) . #1=(|GENUSER;infsum;S$;26|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|x1| NIL) (|t1| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |stx| (QREFELT $ 86)) (|spadConstant| $ 20))
                     ('T
                      (SEQ (LETT |x1| (SPADCALL |stx| (QREFELT $ 87)) NIL)
                           (EXIT
                            (COND
                             ((SPADCALL |x1| (QREFELT $ 18))
                              (SPADCALL (SPADCALL |stx| (QREFELT $ 88))
                                        (QREFELT $ 90)))
                             ('T
                              (SEQ
                               (LETT |t1| (SPADCALL |x1| (QREFELT $ 50)) NIL)
                               (EXIT
                                (SPADCALL (SPADCALL |x1| (QREFELT $ 30))
                                          (|GENUSER;infsum1|
                                           (SPADCALL |stx| (QREFELT $ 88))
                                           (QCAR |t1|) (QCDR |t1|) $)
                                          (QREFELT $ 70)))))))))))))))) 

(SDEFUN |GENUSER;apply_taylor1|
        ((|stc| |Stream| |Coef|) (|x| $) (|xn| $) ($ |Stream| $))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|GENUSER;apply_taylor1!0| (VECTOR |x| |xn| $ |stc|))
                 (QREFELT $ 97))))) 

(SDEFUN |GENUSER;apply_taylor1!0| (($$ NIL))
        (PROG (|stc| $ |xn| |x|)
          (LETT |stc| (QREFELT $$ 3) . #1=(|GENUSER;apply_taylor1|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |xn| (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|c1| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |stc| (QREFELT $ 92))
                      (SPADCALL (QREFELT $ 95)))
                     ('T
                      (SEQ (LETT |c1| (SPADCALL |stc| (QREFELT $ 93)) NIL)
                           (EXIT
                            (SPADCALL (SPADCALL |c1| |xn| (QREFELT $ 65))
                                      (|GENUSER;apply_taylor1|
                                       (SPADCALL |stc| (QREFELT $ 94)) |x|
                                       (SPADCALL |x| |xn| (QREFELT $ 77)) $)
                                      (QREFELT $ 96)))))))))))) 

(SDEFUN |GENUSER;removeZeros;$Expon$;28| ((|x| $) (|ki| |Expon|) ($ $))
        (SPROG
         ((|xs| (|Rep|)) (#1=#:G509 NIL)
          (|tx| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))))
         (SEQ
          (EXIT
           (SEQ (LETT |xs| |x| . #2=(|GENUSER;removeZeros;$Expon$;28|))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |xs| (QREFELT $ 18))
                          (PROGN (LETT #1# |xs| . #2#) (GO #3=#:G508)))
                         ('T
                          (SEQ (LETT |tx| (SPADCALL |xs| (QREFELT $ 50)) . #2#)
                               (COND
                                ((NULL
                                  (SPADCALL (QCAR |tx|) |ki| (QREFELT $ 24)))
                                 (EXIT
                                  (PROGN (LETT #1# |xs| . #2#) (GO #3#)))))
                               (COND
                                ((NULL
                                  (SPADCALL (QCDR |tx|) (|spadConstant| $ 19)
                                            (QREFELT $ 42)))
                                 (EXIT
                                  (PROGN (LETT #1# |xs| . #2#) (GO #3#)))))
                               (EXIT
                                (LETT |xs| (SPADCALL |xs| (QREFELT $ 30))
                                      . #2#)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

(SDEFUN |GENUSER;apply_taylor;S2$;29| ((|stc| |Stream| |Coef|) (|x| $) ($ $))
        (SPROG
         ((|xs| (|Rep|)) (#1=#:G520 NIL)
          (|tx| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))))
         (SEQ (LETT |xs| |x| . #2=(|GENUSER;apply_taylor;S2$;29|))
              (SEQ
               (EXIT
                (SEQ G190 NIL
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |xs| (QREFELT $ 18))
                         (PROGN (LETT #1# |$NoValue| . #2#) (GO #3=#:G515)))
                        ('T
                         (SEQ (LETT |tx| (SPADCALL |xs| (QREFELT $ 50)) . #2#)
                              (EXIT
                               (COND
                                ((OR
                                  (SPADCALL (|spadConstant| $ 21) (QCAR |tx|)
                                            (QREFELT $ 24))
                                  (NULL
                                   (SPADCALL (QCDR |tx|) (|spadConstant| $ 19)
                                             (QREFELT $ 42))))
                                 (PROGN (LETT #1# |$NoValue| . #2#) (GO #3#)))
                                ('T
                                 (LETT |xs| (SPADCALL |xs| (QREFELT $ 30))
                                       . #2#)))))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #3# (EXIT #1#))
              (EXIT
               (COND
                ((SPADCALL |xs| (QREFELT $ 18))
                 (COND ((SPADCALL |stc| (QREFELT $ 92)) (|spadConstant| $ 20))
                       (#4='T
                        (SPADCALL
                         (CONS (|spadConstant| $ 21)
                               (SPADCALL |stc| (QREFELT $ 93)))
                         (SPADCALL (QREFELT $ 26)) (QREFELT $ 28)))))
                ((SPADCALL (|spadConstant| $ 21) (QCAR |tx|) (QREFELT $ 24))
                 (SPADCALL
                  (|GENUSER;apply_taylor1| |stc| |xs| (|spadConstant| $ 29) $)
                  (QREFELT $ 90)))
                (#4# (|error| "apply_taylor: x has negative order"))))))) 

(SDEFUN |GENUSER;=;2$B;30| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG
         ((|st| (|Rep|)) (#1=#:G528 NIL)
          (|tst| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))) (|i| NIL)
          (|n| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |st| (SPADCALL |x| |y| (QREFELT $ 74))
                  . #2=(|GENUSER;=;2$B;30|))
            (LETT |n| |$streamCount| . #2#)
            (SEQ (LETT |i| 0 . #2#) G190
                 (COND ((|greater_SI| |i| |n|) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |st| (QREFELT $ 18))
                     (PROGN (LETT #1# 'T . #2#) (GO #3=#:G527)))
                    ('T
                     (SEQ (LETT |tst| (SPADCALL |st| (QREFELT $ 50)) . #2#)
                          (COND
                           ((NULL
                             (SPADCALL (QCDR |tst|) (|spadConstant| $ 19)
                                       (QREFELT $ 42)))
                            (EXIT (PROGN (LETT #1# 'NIL . #2#) (GO #3#)))))
                          (EXIT
                           (LETT |st| (SPADCALL |st| (QREFELT $ 30))
                                 . #2#)))))))
                 (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
            (EXIT (SPADCALL |st| (QREFELT $ 18)))))
          #3# (EXIT #1#)))) 

(SDEFUN |GENUSER;order;$2Expon;31| ((|x| $) (|ki| |Expon|) ($ |Expon|))
        (SPROG
         ((|xs| (|Rep|)) (#1=#:G537 NIL)
          (|tx| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))))
         (SEQ
          (EXIT
           (SEQ (LETT |xs| |x| . #2=(|GENUSER;order;$2Expon;31|))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |xs| (QREFELT $ 18))
                          (PROGN (LETT #1# |ki| . #2#) (GO #3=#:G536)))
                         ('T
                          (SEQ (LETT |tx| (SPADCALL |xs| (QREFELT $ 50)) . #2#)
                               (COND
                                ((NULL
                                  (SPADCALL (QCAR |tx|) |ki| (QREFELT $ 24)))
                                 (EXIT
                                  (PROGN (LETT #1# |ki| . #2#) (GO #3#)))))
                               (COND
                                ((NULL
                                  (SPADCALL (QCDR |tx|) (|spadConstant| $ 19)
                                            (QREFELT $ 42)))
                                 (EXIT
                                  (PROGN
                                   (LETT #1# (QCAR |tx|) . #2#)
                                   (GO #3#)))))
                               (EXIT
                                (LETT |xs| (SPADCALL |xs| (QREFELT $ 30))
                                      . #2#)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

(SDEFUN |GENUSER;order;$Expon;32| ((|x| $) ($ |Expon|))
        (SPROG
         ((|xs| (|Rep|)) (#1=#:G545 NIL)
          (|tx| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))))
         (SEQ
          (EXIT
           (SEQ (LETT |xs| |x| . #2=(|GENUSER;order;$Expon;32|))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |xs| (QREFELT $ 18))
                          (|error| "series of infinite order"))
                         ('T
                          (SEQ (LETT |tx| (SPADCALL |xs| (QREFELT $ 50)) . #2#)
                               (COND
                                ((NULL
                                  (SPADCALL (QCDR |tx|) (|spadConstant| $ 19)
                                            (QREFELT $ 42)))
                                 (EXIT
                                  (PROGN
                                   (LETT #1# (QCAR |tx|) . #2#)
                                   (GO #3=#:G544)))))
                               (EXIT
                                (LETT |xs| (SPADCALL |xs| (QREFELT $ 30))
                                      . #2#)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

(SDEFUN |GENUSER;extend;$Expon$;33| ((|x| $) (|ki| |Expon|) ($ $))
        (SPROG
         ((|xs| (|Rep|)) (#1=#:G553 NIL)
          (|tx| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))))
         (SEQ
          (EXIT
           (SEQ (LETT |xs| |x| . #2=(|GENUSER;extend;$Expon$;33|))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |xs| (QREFELT $ 18))
                          (PROGN (LETT #1# |x| . #2#) (GO #3=#:G552)))
                         ('T
                          (SEQ (LETT |tx| (SPADCALL |xs| (QREFELT $ 50)) . #2#)
                               (COND
                                ((NULL
                                  (SPADCALL (QCAR |tx|) |ki| (QREFELT $ 24)))
                                 (EXIT (PROGN (LETT #1# |x| . #2#) (GO #3#)))))
                               (EXIT
                                (LETT |xs| (SPADCALL |xs| (QREFELT $ 30))
                                      . #2#)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

(SDEFUN |GENUSER;truncate;$Expon$;34| ((|x| $) (|ki| |Expon|) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|GENUSER;truncate;$Expon$;34!0| (VECTOR |ki| $ |x|))
                 (QREFELT $ 73))))) 

(SDEFUN |GENUSER;truncate;$Expon$;34!0| (($$ NIL))
        (PROG (|x| $ |ki|)
          (LETT |x| (QREFELT $$ 2) . #1=(|GENUSER;truncate;$Expon$;34|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |ki| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|xs| NIL) (|tx| NIL))
                   (SEQ (LETT |xs| |x| NIL)
                        (EXIT
                         (COND
                          ((SPADCALL |xs| (QREFELT $ 18))
                           (SPADCALL (QREFELT $ 26)))
                          ('T
                           (SEQ (LETT |tx| (SPADCALL |xs| (QREFELT $ 50)) NIL)
                                (EXIT
                                 (COND
                                  ((SPADCALL |ki| (QCAR |tx|) (QREFELT $ 24))
                                   (SPADCALL (QREFELT $ 26)))
                                  ('T
                                   (SPADCALL |tx|
                                             (SPADCALL
                                              (SPADCALL |xs| (QREFELT $ 30))
                                              |ki| (QREFELT $ 103))
                                             (QREFELT $ 28))))))))))))))) 

(SDEFUN |GENUSER;truncate;$2Expon$;35|
        ((|x| $) (|k1| |Expon|) (|k2| |Expon|) ($ $))
        (SPROG
         ((|xs| (|Rep|)) (#1=#:G586 NIL)
          (|tx| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))) (#2=#:G587 NIL)
          (|#G70| (|Expon|)) (|#G69| (|Expon|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |k2| |k1| (QREFELT $ 24))
              (PROGN
               (LETT |#G69| |k2| . #3=(|GENUSER;truncate;$2Expon$;35|))
               (LETT |#G70| |k1| . #3#)
               (LETT |k1| |#G69| . #3#)
               (LETT |k2| |#G70| . #3#))))
            (LETT |xs| |x| . #3#)
            (SEQ
             (EXIT
              (SEQ G190 NIL
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |xs| (QREFELT $ 18))
                       (PROGN
                        (LETT #2# (SPADCALL (QREFELT $ 26)) . #3#)
                        (GO #4=#:G585)))
                      ('T
                       (SEQ (LETT |tx| (SPADCALL |xs| (QREFELT $ 50)) . #3#)
                            (COND
                             ((NULL (SPADCALL (QCAR |tx|) |k1| (QREFELT $ 24)))
                              (EXIT
                               (PROGN
                                (LETT #1# |$NoValue| . #3#)
                                (GO #5=#:G583)))))
                            (EXIT
                             (LETT |xs| (SPADCALL |xs| (QREFELT $ 30))
                                   . #3#)))))))
                   NIL (GO G190) G191 (EXIT NIL)))
             #5# (EXIT #1#))
            (EXIT (SPADCALL |xs| |k2| (QREFELT $ 103)))))
          #4# (EXIT #2#)))) 

(SDEFUN |GENUSER;complete;2$;36| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 105))) 

(SDEFUN |GENUSER;coefficient;$ExponCoef;37| ((|x| $) (|ki| |Expon|) ($ |Coef|))
        (SPROG
         ((|xs| (|Rep|)) (#1=#:G596 NIL)
          (|tx| (|Record| (|:| |k| |Expon|) (|:| |c| |Coef|))))
         (SEQ
          (EXIT
           (SEQ (LETT |xs| |x| . #2=(|GENUSER;coefficient;$ExponCoef;37|))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |xs| (QREFELT $ 18))
                          (PROGN
                           (LETT #1# (|spadConstant| $ 19) . #2#)
                           (GO #3=#:G595)))
                         ('T
                          (SEQ (LETT |tx| (SPADCALL |xs| (QREFELT $ 50)) . #2#)
                               (EXIT
                                (COND
                                 ((SPADCALL |ki| (QCAR |tx|) (QREFELT $ 24))
                                  (PROGN
                                   (LETT #1# (|spadConstant| $ 19) . #2#)
                                   (GO #3#)))
                                 ((SPADCALL |ki| (QCAR |tx|) (QREFELT $ 36))
                                  (PROGN
                                   (LETT #1# (QCDR |tx|) . #2#)
                                   (GO #3#)))
                                 ('T
                                  (LETT |xs| (SPADCALL |xs| (QREFELT $ 30))
                                        . #2#)))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

(SDEFUN |GENUSER;elt;$ExponCoef;38| ((|x| $) (|ki| |Expon|) ($ |Coef|))
        (SPADCALL |x| |ki| (QREFELT $ 107))) 

(SDEFUN |GENUSER;leadingMonomial;2$;39| ((|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 18)) (|spadConstant| $ 20))
              ('T
               (SPADCALL (SPADCALL |x| (QREFELT $ 109))
                         (SPADCALL (QREFELT $ 26)) (QREFELT $ 28))))) 

(SDEFUN |GENUSER;apply_or_error|
        ((|fn| |Mapping| #1=(|Union| $ "failed") $) (|xs| |String|) (|x| $)
         ($ $))
        (SPROG ((|resu| #1#))
               (SEQ (LETT |resu| (SPADCALL |x| |fn|) |GENUSER;apply_or_error|)
                    (EXIT
                     (COND
                      ((QEQCAR |resu| 1)
                       (|error|
                        (SPADCALL (STRCONC |xs| ": failed") (QREFELT $ 112))))
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

(DEFUN |GeneralizedUnivariatePowerSeries| (&REST #1=#:G757)
  (SPROG NIL
         (PROG (#2=#:G758)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GeneralizedUnivariatePowerSeries|)
                                               '|domainEqualList|)
                    . #3=(|GeneralizedUnivariatePowerSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GeneralizedUnivariatePowerSeries;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GeneralizedUnivariatePowerSeries|)))))))))) 

(DEFUN |GeneralizedUnivariatePowerSeries;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (#1=#:G750 NIL) (#2=#:G751 NIL) (#3=#:G752 NIL) (#4=#:G753 NIL)
    (#5=#:G755 NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #6=(|GeneralizedUnivariatePowerSeries|))
    (LETT DV$2 (|devaluate| |#2|) . #6#)
    (LETT DV$3 (|devaluate| |#3|) . #6#)
    (LETT DV$4 (|devaluate| |#4|) . #6#)
    (LETT |dv$| (LIST '|GeneralizedUnivariatePowerSeries| DV$1 DV$2 DV$3 DV$4)
          . #6#)
    (LETT $ (GETREFV 188) . #6#)
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
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #6#)
                                        (OR #5#
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
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              . #6#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             #4#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              #4#))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #6#)
                                        (OR #5#
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             #4#)
                                            #3#)
                                        (OR
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              #4#)
                                         #3#)
                                        (OR #5# (|HasCategory| |#1| '(|Field|))
                                            #3#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #3#)
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|))
                                              . #6#)
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
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #6#)
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
                                         #5# (|HasCategory| |#1| '(|Field|))
                                         #3# #1#
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
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5# (|HasCategory| |#1| '(|Field|))
                                         #3# #1#
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
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5# (|HasCategory| |#1| '(|Field|))
                                         #3# #1#
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
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5# (|HasCategory| |#1| '(|Field|))
                                         #3# #1#
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
                                         #5# (|HasCategory| |#1| '(|Field|))
                                         #3# #1#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#2|)
                                                                (|devaluate|
                                                                 |#1|)))))))
                    . #6#))
    (|haddProp| |$ConstructorCache| '|GeneralizedUnivariatePowerSeries|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 2147483648))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|Field|)) #4#)
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) (|devaluate| |#2|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 4294967296))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|Field|)) #4#)
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) (|devaluate| |#2|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 8589934592))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianGroup|))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|Field|)) #4#)
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) (|devaluate| |#2|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 17179869184))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|Field|)) #4#)
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #2#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) (|devaluate| |#2|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 34359738368))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|Field|)) #4#)
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #1#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) (|devaluate| |#2|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 68719476736))
    (AND
     (OR (AND (|HasCategory| |#1| '(|Field|)) #4#)
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 137438953472))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10 (|Stream| (|Record| (|:| |k| |#2|) (|:| |c| |#1|))))
    (COND
     ((|HasCategory| |#2| '(|CancellationAbelianMonoid|))
      (PROGN
       (QSETREFV $ 82 (CONS (|dispatchFunction| |GENUSER;exquo;2$U;22|) $))
       (QSETREFV $ 83 (CONS (|dispatchFunction| |GENUSER;recip;$U;23|) $))
       (COND
        ((|testBitVector| |pv$| 7)
         (COND
          ((|testBitVector| |pv$| 13)
           (QSETREFV $ 84
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
              (122 . |explicitlyEmpty?|) (|List| $) (127 . |prefix|) (133 . +)
              (|Mapping| 37 37 37) (|List| 37) (139 . |reduce|)
              |GENUSER;coerce;$Of;11| (|Mapping| 11 11) (145 . |map|)
              (|Mapping| 6 6) |GENUSER;map;M2$;13| (151 . *)
              |GENUSER;*;Coef2$;14| (|PositiveInteger|) (157 . *)
              |GENUSER;multiplyExponents;$Pi$;15| |GENUSER;-;2$;16|
              |GENUSER;+;3$;17| (163 . +) (|Mapping| $) (169 . |delay|)
              |GENUSER;-;3$;18| (174 . -) (180 . +) |GENUSER;*;3$;19|
              (|Union| $ '"failed") (186 . |subtractIfCan|) (192 . >)
              (198 . |recip|) (203 . |exquo|) (209 . |recip|) (214 . /)
              (|Stream| $$) (220 . |empty?|) (225 . |frst|) (230 . |rst|)
              (|Stream| $) |GENUSER;infsum;S$;26| (|Stream| 6) (235 . |empty?|)
              (240 . |frst|) (245 . |rst|) (250 . |empty|) (254 . |concat|)
              (260 . |delay|) |GENUSER;apply_taylor;S2$;29| |GENUSER;=;2$B;30|
              |GENUSER;order;$2Expon;31| |GENUSER;order;$Expon;32|
              |GENUSER;extend;$Expon$;33| |GENUSER;truncate;$Expon$;34|
              |GENUSER;truncate;$2Expon$;35| (265 . |complete|)
              |GENUSER;complete;2$;36| |GENUSER;coefficient;$ExponCoef;37|
              |GENUSER;elt;$ExponCoef;38| (270 . |first|)
              |GENUSER;leadingMonomial;2$;39| (|String|) (275 . |coerce|)
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
              (544 . |pi|) (|Integer|) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 171 '#1="failed") (|Union| 53 '#1#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 53) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| 15) (|List| 32)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 169) (|List| 184) (|SingletonAsOrderedSet|)
              (|List| 7) (|SingleInteger|) (|HashState|))
           '#(~= 548 |zero?| 554 |variables| 559 |variable| 564 |unitNormal|
              569 |unitCanonical| 574 |unit?| 579 |truncate| 584 |terms| 597
              |tanh| 602 |tan| 607 |subtractIfCan| 612 |squareFreePart| 618
              |squareFree| 623 |sizeLess?| 628 |sinh| 634 |sin| 639 |sech| 644
              |sec| 649 |sample| 654 |removeZeros| 658 |rem| 664 |reductum| 670
              |recip| 675 |quo| 680 |principalIdeal| 686 |prime?| 691 |pole?|
              696 |pi| 701 |order| 705 |opposite?| 716 |one?| 722
              |multiplyExponents| 727 |multiEuclidean| 733 |monomial?| 739
              |monomial| 744 |map| 764 |log| 770 |leadingMonomial| 775
              |leadingCoefficient| 780 |lcmCoef| 785 |lcm| 791 |latex| 802
              |inv| 807 |infsum| 812 |hashUpdate!| 817 |hash| 823
              |gcdPolynomial| 828 |gcd| 834 |factor| 845 |extendedEuclidean|
              850 |extend| 863 |exquo| 869 |expressIdealMember| 875 |exp| 881
              |eval| 886 |euclideanSize| 892 |elt| 897 |divide| 909
              |differentiate| 915 |degree| 952 |csch| 957 |csc| 962 |coth| 967
              |cot| 972 |cosh| 977 |cos| 982 |complete| 987 |coerce| 992
              |coefficient| 1017 |charthRoot| 1023 |characteristic| 1028
              |center| 1032 |atanh| 1037 |atan| 1042 |associates?| 1047 |asinh|
              1053 |asin| 1058 |asech| 1063 |asec| 1068 |approximate| 1073
              |apply_taylor| 1079 |annihilate?| 1085 |acsch| 1091 |acsc| 1096
              |acoth| 1101 |acot| 1106 |acosh| 1111 |acos| 1116 ^ 1121 |Zero|
              1145 |One| 1149 D 1153 = 1190 / 1196 - 1208 + 1219 * 1225)
           'NIL
           (CONS
            (|makeByteWordVec2| 31
                                '(14 0 14 0 14 14 0 14 20 14 9 18 14 15 1 2 9 4
                                  3 18 19 20 15 0 19 31 15 0 0 17 27 31 15 15
                                  30 24 29 0 24 28 0 0 0 6 0 0 0 5 6 6 6 6 6 26
                                  17 18 14 14))
            (CONS
             '#(|Field&| |UnivariatePowerSeriesCategory&| |EuclideanDomain&|
                |PowerSeriesCategory&| NIL |UniqueFactorizationDomain&|
                |AbelianMonoidRing&| |GcdDomain&| NIL |DivisionRing&|
                |Algebra&| |Algebra&| NIL |Algebra&| NIL NIL |Module&|
                |PartialDifferentialRing&| |DifferentialRing&| |Module&| NIL
                |EntireRing&| |Module&| NIL NIL |Ring&| NIL NIL NIL NIL NIL
                |Rng&| NIL NIL |AbelianGroup&| NIL NIL NIL |Monoid&|
                |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&|
                |SetCategory&| |TranscendentalFunctionCategory&| NIL
                |BasicType&| NIL NIL |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL NIL NIL NIL)
             (CONS
              '#((|Field|) (|UnivariatePowerSeriesCategory| 6 7)
                 (|EuclideanDomain|) (|PowerSeriesCategory| 6 7 184)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 7) (|GcdDomain|) (|IntegralDomain|)
                 (|DivisionRing|) (|Algebra| 6) (|Algebra| $$) (|LeftOreRing|)
                 (|Algebra| 182) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 6)
                 (|PartialDifferentialRing| 15) (|DifferentialRing|)
                 (|Module| $$) (|CommutativeRing|) (|EntireRing|)
                 (|Module| 182) (|BiModule| 6 6) (|BiModule| $$ $$) (|Ring|)
                 (|BiModule| 182 182) (|LeftModule| 6) (|RightModule| 6)
                 (|RightModule| $$) (|LeftModule| $$) (|Rng|)
                 (|LeftModule| 182) (|RightModule| 182) (|AbelianGroup|)
                 (|SemiRing|) (|CancellationAbelianMonoid|) (|SemiRng|)
                 (|Monoid|) (|AbelianMonoid|) (|AbelianSemiGroup|)
                 (|SemiGroup|) (|SetCategory|)
                 (|TranscendentalFunctionCategory|)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 37) (|Eltable| $$ $$)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|unitsKnown|)
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|))
              (|makeByteWordVec2| 187
                                  '(1 10 17 0 18 0 6 0 19 0 7 0 21 2 7 17 0 0
                                    24 0 10 0 26 0 6 0 27 2 10 0 11 0 28 1 10 0
                                    0 30 0 6 32 33 2 7 17 0 0 36 1 6 37 0 38 0
                                    7 0 39 1 7 37 0 40 2 37 0 0 0 41 2 6 17 0 0
                                    42 1 6 0 0 43 1 37 0 0 44 2 37 0 0 0 45 1 6
                                    17 0 46 1 15 37 0 47 2 37 0 0 0 48 1 37 0 0
                                    49 1 10 11 0 50 2 6 17 0 0 51 1 10 17 0 52
                                    2 37 0 0 53 54 2 37 0 0 0 55 2 57 37 56 0
                                    58 2 10 0 60 0 61 2 6 0 0 0 64 2 7 0 66 0
                                    67 2 6 0 0 0 71 1 10 0 72 73 2 6 0 0 0 75 2
                                    7 0 0 0 76 2 7 78 0 0 79 2 32 17 0 0 80 1 6
                                    78 0 81 2 0 78 0 0 82 1 0 78 0 83 2 0 0 0 0
                                    84 1 85 17 0 86 1 85 2 0 87 1 85 0 0 88 1
                                    91 17 0 92 1 91 6 0 93 1 91 0 0 94 0 85 0
                                    95 2 85 0 2 0 96 1 85 0 72 97 1 10 0 0 105
                                    1 10 11 0 109 1 111 37 0 112 1 114 113 2
                                    115 1 0 0 0 116 1 114 113 2 117 1 0 0 0 118
                                    1 114 113 2 119 1 0 0 0 120 1 114 113 2 121
                                    1 0 0 0 122 1 114 113 2 123 1 0 0 0 124 1
                                    114 113 2 125 1 0 0 0 126 1 114 113 2 127 1
                                    0 0 0 128 1 114 113 2 129 1 0 0 0 130 1 114
                                    113 2 131 1 0 0 0 132 1 114 113 2 133 1 0 0
                                    0 134 1 114 113 2 135 1 0 0 0 136 1 114 113
                                    2 137 1 0 0 0 138 1 114 113 2 139 1 0 0 0
                                    140 1 114 113 2 141 1 0 0 0 142 1 114 113 2
                                    143 1 0 0 0 144 1 114 113 2 145 1 0 0 0 146
                                    1 114 113 2 147 1 0 0 0 148 1 114 113 2 149
                                    1 0 0 0 150 1 114 113 2 151 1 0 0 0 152 1
                                    114 113 2 153 1 0 0 0 154 1 114 113 2 155 1
                                    0 0 0 156 1 114 113 2 157 1 0 0 0 158 1 114
                                    113 2 159 1 0 0 0 160 1 114 113 2 161 1 0 0
                                    0 162 1 114 113 2 163 1 0 0 0 164 1 114 113
                                    2 165 1 0 0 0 166 0 6 0 167 0 0 0 168 2 0
                                    17 0 0 1 1 33 17 0 1 1 0 183 0 1 1 0 15 0
                                    16 1 38 181 0 1 1 38 0 0 1 1 38 17 0 1 3 0
                                    0 0 7 7 104 2 0 0 0 7 103 1 0 12 0 13 1 6 0
                                    0 148 1 6 0 0 124 2 34 78 0 0 1 1 14 0 0 1
                                    1 14 170 0 1 2 14 17 0 0 1 1 6 0 0 144 1 6
                                    0 0 120 1 6 0 0 152 1 6 0 0 128 0 33 0 1 2
                                    0 0 0 7 22 2 14 0 0 0 1 1 0 0 0 31 1 36 78
                                    0 83 2 14 0 0 0 1 1 14 176 53 1 1 14 17 0 1
                                    1 0 17 0 25 0 6 0 168 1 0 7 0 101 2 0 7 0 7
                                    100 2 33 17 0 0 1 1 36 17 0 1 2 0 0 0 66 68
                                    2 14 173 53 0 1 1 0 17 0 1 3 0 0 0 184 7 1
                                    3 0 0 0 183 185 1 2 0 0 6 7 35 2 0 0 62 0
                                    63 1 6 0 0 118 1 0 0 0 110 1 0 6 0 1 2 14
                                    178 0 0 1 1 14 0 53 1 2 14 0 0 0 1 1 0 111
                                    0 1 1 14 0 0 1 1 0 0 89 90 2 0 187 187 0 1
                                    1 0 186 0 1 2 14 177 177 177 1 1 14 0 53 1
                                    2 14 0 0 0 1 1 14 170 0 1 3 14 172 0 0 0 1
                                    2 14 174 0 0 1 2 0 0 0 7 102 2 38 78 0 0 82
                                    2 14 173 53 0 1 1 6 0 0 116 2 10 91 0 6 1 1
                                    14 32 0 1 2 5 0 0 0 1 2 0 6 0 7 108 2 14
                                    175 0 0 1 2 4 0 0 179 1 2 4 0 0 15 1 3 4 0
                                    0 179 180 1 3 4 0 0 15 32 1 1 3 0 0 1 2 3 0
                                    0 32 1 1 0 7 0 23 1 6 0 0 154 1 6 0 0 130 1
                                    6 0 0 150 1 6 0 0 126 1 6 0 0 146 1 6 0 0
                                    122 1 0 0 0 106 1 32 0 6 1 1 37 0 169 1 1
                                    38 0 0 1 1 15 0 182 1 1 0 37 0 59 2 0 6 0 7
                                    107 1 1 78 0 1 0 37 32 34 1 0 6 0 14 1 6 0
                                    0 160 1 6 0 0 136 2 38 17 0 0 1 1 6 0 0 156
                                    1 6 0 0 132 1 6 0 0 164 1 6 0 0 140 2 11 6
                                    0 7 1 2 0 0 91 0 98 2 37 17 0 0 1 1 6 0 0
                                    166 1 6 0 0 142 1 6 0 0 162 1 6 0 0 138 1 6
                                    0 0 158 1 6 0 0 134 2 14 0 0 169 1 2 36 0 0
                                    32 1 2 6 0 0 0 1 2 0 0 0 66 1 0 33 0 20 0
                                    36 0 29 2 4 0 0 179 1 2 4 0 0 15 1 3 4 0 0
                                    179 180 1 3 4 0 0 15 32 1 1 3 0 0 1 2 3 0 0
                                    32 1 2 0 17 0 0 99 2 14 0 0 0 84 2 7 0 0 6
                                    1 2 35 0 0 0 74 1 35 0 0 69 2 0 0 0 0 70 2
                                    35 0 169 0 1 2 33 0 32 0 1 2 15 0 0 182 1 2
                                    15 0 182 0 1 2 0 0 6 0 65 2 0 0 0 0 77 2 0
                                    0 0 6 1 2 0 0 66 0 1)))))
           '|lookupComplete|)) 
