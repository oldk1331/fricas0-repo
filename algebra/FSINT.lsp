
(SDEFUN |FSINT;K2KG|
        ((|k| (|Kernel| F)) ($ (|Kernel| (|Expression| (|Complex| R)))))
        (SPADCALL
         (SPADCALL
          (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 19))) (QREFELT $ 22))
          (QREFELT $ 23))
         (QREFELT $ 25))) 

(SDEFUN |FSINT;tan2temp| ((|k| (|Kernel| F)) ($ (|Kernel| F)))
        (SPADCALL (QREFELT $ 16) (SPADCALL |k| (QREFELT $ 19))
                  (SPADCALL |k| (QREFELT $ 26)) (QREFELT $ 27))) 

(SDEFUN |FSINT;trans?| ((|f| (F)) ($ (|Boolean|)))
        (SPADCALL (CONS #'|FSINT;trans?!0| $) (SPADCALL |f| (QREFELT $ 31))
                  (QREFELT $ 33))) 

(SDEFUN |FSINT;trans?!0| ((|x1| NIL) ($ NIL))
        (COND
         ((OR (SPADCALL |x1| '|log| (QREFELT $ 29))
              (SPADCALL |x1| '|exp| (QREFELT $ 29)))
          'T)
         ('T (SPADCALL |x1| '|atan| (QREFELT $ 29))))) 

(SDEFUN |FSINT;mkPrimh| ((|f| (F)) (|x| (|Symbol|)) (|h| (|Boolean|)) ($ (F)))
        (SPROG ((|g| (F)))
               (SEQ (LETT |g| (SPADCALL |f| |x| (QREFELT $ 35)))
                    (COND
                     (|h|
                      (COND
                       ((|FSINT;trans?| |g| $)
                        (EXIT (SPADCALL |g| (QREFELT $ 37)))))))
                    (EXIT |g|)))) 

(SDEFUN |FSINT;rinteg|
        ((|i| (|IntegrationResult| F)) (|f| (F)) (|x| (|Symbol|))
         (|h| (|Boolean|)) ($ (|List| F)))
        (SPROG ((#1=#:G150 NIL) (#2=#:G149 NIL))
               (SEQ
                (COND
                 ((NULL (SPADCALL |i| (QREFELT $ 39)))
                  (LIST (SPADCALL |f| |x| (QREFELT $ 40))))
                 ('T
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT #1# (SPADCALL |i| |x| (QREFELT $ 42))) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS (|FSINT;mkPrimh| |f| |x| |h| $) #2#))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |FSINT;halfangle| ((|a| (F)) ($ (F)))
        (SEQ (LETT |a| (SPADCALL 2 |a| (QREFELT $ 44)))
             (EXIT
              (SPADCALL
               (SPADCALL (|spadConstant| $ 46) (SPADCALL |a| (QREFELT $ 47))
                         (QREFELT $ 48))
               (SPADCALL (|spadConstant| $ 46) (SPADCALL |a| (QREFELT $ 47))
                         (QREFELT $ 49))
               (QREFELT $ 50))))) 

(SDEFUN |FSINT;Khalf| ((|k| (|Kernel| F)) ($ (F)))
        (SPROG ((|a| (F)))
               (SEQ
                (LETT |a|
                      (SPADCALL 2 (|SPADfirst| (SPADCALL |k| (QREFELT $ 19)))
                                (QREFELT $ 44)))
                (EXIT
                 (SPADCALL (SPADCALL |a| (QREFELT $ 51))
                           (SPADCALL (|spadConstant| $ 46)
                                     (SPADCALL |a| (QREFELT $ 47))
                                     (QREFELT $ 49))
                           (QREFELT $ 50)))))) 

(SDEFUN |FSINT;find_int|
        ((|i| (|Kernel| F)) (|t| (|List| (|Kernel| F))) ($ (|Kernel| F)))
        (SPROG
         ((#1=#:G161 NIL) (|akl| #2=(|List| F)) (#3=#:G162 NIL) (|k| NIL)
          (|ii| (F)) (|k0| (|NonNegativeInteger|)) (|ail| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |ail| (SPADCALL |i| (QREFELT $ 19)))
                (LETT |k0| (LENGTH |ail|))
                (LETT |ii| (SPADCALL |i| (QREFELT $ 52)))
                (SEQ (LETT |k| NIL) (LETT #3# |t|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |k| (QREFELT $ 53)) '|%iint|
                                   (QREFELT $ 29))
                         (SEQ (LETT |akl| (SPADCALL |k| (QREFELT $ 19)))
                              (EXIT
                               (COND
                                ((SPADCALL (LENGTH |akl|) |k0| (QREFELT $ 54))
                                 "iterate")
                                ((SPADCALL
                                  (SPADCALL
                                   (SPADCALL |ii| (SPADCALL |k| (QREFELT $ 52))
                                             (QREFELT $ 48))
                                   (QREFELT $ 56))
                                  (|spadConstant| $ 57) (QREFELT $ 58))
                                 (PROGN (LETT #1# |k|) (GO #4=#:G160))))))))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (EXIT |i|)))
          #4# (EXIT #1#)))) 

(SDEFUN |FSINT;try_real| ((|f| (F)) ($ (F)))
        (SPROG ((|pu| (|Union| F "failed")))
               (SEQ
                (LETT |pu| (|trappedSpadEval| (SPADCALL |f| (QREFELT $ 60))))
                (EXIT (COND ((QEQCAR |pu| 0) (QCDR |pu|)) ('T |f|)))))) 

(SDEFUN |FSINT;extend_tower|
        ((|lk| (|List| #1=(|Kernel| F))) ($ (|List| (|Kernel| F))))
        (SPROG
         ((|res| (|List| (|Kernel| F))) (#2=#:G183 NIL) (|k1| NIL)
          (|l1| (|List| #1#)) (|ke| (F)) (|i| (|Integer|))
          (|iu| (|Union| (|Integer|) "failed")) (|args| (|List| F))
          (|op| (|BasicOperator|)) (#3=#:G182 NIL) (|k| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |k| NIL) (LETT #3# |lk|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |l1| (LIST |k|))
                        (LETT |op| (SPADCALL |k| (QREFELT $ 53)))
                        (COND
                         ((EQUAL (SPADCALL |op| (QREFELT $ 61)) '|polylog|)
                          (SEQ (LETT |args| (SPADCALL |k| (QREFELT $ 19)))
                               (LETT |iu|
                                     (SPADCALL (|SPADfirst| |args|)
                                               (QREFELT $ 63)))
                               (EXIT
                                (COND
                                 ((QEQCAR |iu| 0)
                                  (SEQ (LETT |i| (QCDR |iu|))
                                       (EXIT
                                        (COND
                                         ((> |i| 0)
                                          (COND
                                           ((< |i| 10)
                                            (SEQ G190
                                                 (COND
                                                  ((NULL (> |i| 2)) (GO G191)))
                                                 (SEQ (LETT |i| (- |i| 1))
                                                      (LETT |ke|
                                                            (SPADCALL |op|
                                                                      (CONS
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         |i|
                                                                         (QREFELT
                                                                          $
                                                                          66))
                                                                        (QREFELT
                                                                         $ 67))
                                                                       (CDR
                                                                        |args|))
                                                                      (QREFELT
                                                                       $ 69)))
                                                      (EXIT
                                                       (LETT |l1|
                                                             (CONS
                                                              (SPADCALL |ke|
                                                                        (QREFELT
                                                                         $ 70))
                                                              |l1|))))
                                                 NIL (GO G190) G191
                                                 (EXIT NIL))))))))))))))
                        (EXIT
                         (SEQ (LETT |k1| NIL) (LETT #2# |l1|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |k1| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |k1| |res| (QREFELT $ 72))
                                  "iterate")
                                 ('T (LETT |res| (CONS |k1| |res|))))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |FSINT;postSubst|
        ((|f| (F)) (|otf| (|List| (|Kernel| F))) (|lv| (|List| F))
         (|lk| (|List| (|Kernel| F))) (|ltan| (|List| (|Kernel| F)))
         (|ekers| (|List| (|Kernel| F))) (|evals| (|List| F)) (|x| (|Symbol|))
         ($ (F)))
        (SPROG
         ((#1=#:G220 NIL) (#2=#:G219 NIL) (#3=#:G218 NIL) (#4=#:G217 NIL)
          (|ltemp| (|List| (|Kernel| F))) (#5=#:G216 NIL) (#6=#:G215 NIL)
          (|k| (|Kernel| F)) (|tf| (|List| (|Kernel| F))) (#7=#:G213 NIL)
          (#8=#:G214 NIL) (|v| NIL) (|vkv| (F)) (|vc| (F)) (|vkf| (F))
          (|vk| (|Kernel| F)) (|vkl| (|List| (|Kernel| F))) (#9=#:G212 NIL)
          (|kk| NIL) (#10=#:G211 NIL) (|uk| (|Kernel| F))
          (|u| (|Union| (|Kernel| F) "failed")) (#11=#:G209 NIL)
          (#12=#:G210 NIL))
         (SEQ
          (SEQ (LETT #12# |lk|) (LETT |v| NIL) (LETT #11# |lv|) G190
               (COND
                ((OR (ATOM #11#) (PROGN (LETT |v| (CAR #11#)) NIL) (ATOM #12#)
                     (PROGN (LETT |k| (CAR #12#)) NIL))
                 (GO G191)))
               (SEQ (LETT |u| (SPADCALL |v| (QREFELT $ 74)))
                    (EXIT
                     (COND
                      ((QEQCAR |u| 0)
                       (SEQ (LETT |uk| (QCDR |u|))
                            (COND
                             ((SPADCALL (SPADCALL |uk| (QREFELT $ 53))
                                        (QREFELT $ 11) (QREFELT $ 75))
                              (LETT |f|
                                    (SPADCALL
                                     (SPADCALL |f| |uk|
                                               (SPADCALL |uk| (QREFELT $ 77))
                                               (QREFELT $ 80))
                                     (SPADCALL |uk| (QREFELT $ 52))
                                     (QREFELT $ 81)))))
                            (EXIT
                             (LETT |f|
                                   (SPADCALL |f| (LIST |uk|)
                                             (LIST
                                              (SPADCALL |k| (QREFELT $ 52)))
                                             (QREFELT $ 83))))))
                      ((SPADCALL |k| '|nthRoot| (QREFELT $ 84))
                       (SEQ
                        (LETT |vkl|
                              (PROGN
                               (LETT #10# NIL)
                               (SEQ (LETT |kk| NIL)
                                    (LETT #9# (SPADCALL |v| (QREFELT $ 85)))
                                    G190
                                    (COND
                                     ((OR (ATOM #9#)
                                          (PROGN (LETT |kk| (CAR #9#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL |kk| '|nthRoot|
                                                  (QREFELT $ 84))
                                        (LETT #10# (CONS |kk| #10#))))))
                                    (LETT #9# (CDR #9#)) (GO G190) G191
                                    (EXIT (NREVERSE #10#)))))
                        (EXIT
                         (COND
                          ((EQL (LENGTH |vkl|) 1)
                           (SEQ (LETT |vk| (SPADCALL |vkl| 1 (QREFELT $ 86)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |vk| |otf| (QREFELT $ 72)) "skip")
                                  ('T
                                   (SEQ
                                    (LETT |vkf| (SPADCALL |vk| (QREFELT $ 52)))
                                    (LETT |vc|
                                          (SPADCALL |v| |vkf| (QREFELT $ 50)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |vk|
                                                 (SPADCALL |vc| (QREFELT $ 85))
                                                 (QREFELT $ 72))
                                       "skip")
                                      ('T
                                       (SEQ
                                        (LETT |vkv|
                                              (SPADCALL
                                               (SPADCALL |k| (QREFELT $ 52))
                                               |vc| (QREFELT $ 50)))
                                        (LETT |f|
                                              (SPADCALL
                                               (SPADCALL |f| |vk|
                                                         (SPADCALL |vk|
                                                                   (QREFELT $
                                                                            77))
                                                         (QREFELT $ 80))
                                               |vkf| (QREFELT $ 81)))
                                        (EXIT
                                         (LETT |f|
                                               (SPADCALL |f| (LIST |vk|)
                                                         (LIST |vkv|)
                                                         (QREFELT $
                                                                  83)))))))))))))))))))))
               (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#)))) (GO G190)
               G191 (EXIT NIL))
          (SEQ (LETT |v| NIL) (LETT #8# |evals|) (LETT #7# |ekers|) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |k| (CAR #7#)) NIL) (ATOM #8#)
                     (PROGN (LETT |v| (CAR #8#)) NIL))
                 (GO G191)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |k| (QREFELT $ 53)) '|%iint|
                            (QREFELT $ 29))
                  (COND
                   ((NULL
                     (SPADCALL |k| (LETT |tf| (SPADCALL |f| (QREFELT $ 87)))
                               (QREFELT $ 72)))
                    (LETT |k| (|FSINT;find_int| |k| |tf| $))))))
                (EXIT
                 (LETT |f|
                       (SPADCALL |f| (LIST |k|) (LIST |v|) (QREFELT $ 83)))))
               (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#)))) (GO G190) G191
               (EXIT NIL))
          (COND
           ((NULL (NULL |ltan|))
            (SEQ
             (LETT |ltemp|
                   (PROGN
                    (LETT #6# NIL)
                    (SEQ (LETT #5# |ltan|) G190
                         (COND
                          ((OR (ATOM #5#) (PROGN (LETT |k| (CAR #5#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #6# (CONS (|FSINT;tan2temp| |k| $) #6#))))
                         (LETT #5# (CDR #5#)) (GO G190) G191
                         (EXIT (NREVERSE #6#)))))
             (LETT |f|
                   (SPADCALL |f| |ltan|
                             (PROGN
                              (LETT #4# NIL)
                              (SEQ (LETT #3# |ltemp|) G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN (LETT |k| (CAR #3#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4#
                                           (CONS (SPADCALL |k| (QREFELT $ 52))
                                                 #4#))))
                                   (LETT #3# (CDR #3#)) (GO G190) G191
                                   (EXIT (NREVERSE #4#))))
                             (QREFELT $ 83)))
             (LETT |f|
                   (SPADCALL |f| '|%temptan| 2
                             (CONS (|function| |FSINT;halfangle|) $)
                             (QREFELT $ 89)))
             (EXIT
              (LETT |f|
                    (SPADCALL |f| |ltemp|
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT #1# |ltemp|) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |k| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS (|FSINT;Khalf| |k| $) #2#))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 83)))))))
          (LETT |f| (|FSINT;try_real| |f| $))
          (LETT |f| (SPADCALL |f| (QREFELT $ 90)))
          (EXIT (SPADCALL |f| |x| (QREFELT $ 91)))))) 

(SDEFUN |FSINT;inv_lst|
        ((|lt| (|List| (|Kernel| (|Expression| (|Complex| R)))))
         (|le| (|List| (|Expression| (|Complex| R))))
         ($
          (|Record|
           (|:| |ker| (|List| (|Kernel| (|Expression| (|Complex| R)))))
           (|:| |val| (|List| (|Expression| (|Complex| R)))))))
        (SPROG
         ((|rese| (|List| (|Expression| (|Complex| R))))
          (|resk| (|List| (|Kernel| (|Expression| (|Complex| R)))))
          (|ie| (|Expression| (|Complex| R)))
          (|ik| (|Kernel| (|Expression| (|Complex| R))))
          (|iku| (|Union| (|Kernel| (|Expression| (|Complex| R))) "failed"))
          (|k1| #1=(|Expression| (|Complex| R))) (|e1| #1#) (#2=#:G235 NIL)
          (|k| NIL) (#3=#:G236 NIL) (|e| NIL) (|im| (|Complex| R)))
         (SEQ (LETT |resk| NIL) (LETT |rese| NIL)
              (LETT |im|
                    (SPADCALL (|spadConstant| $ 64) (|spadConstant| $ 45)
                              (QREFELT $ 93)))
              (SEQ (LETT |e| NIL) (LETT #3# |le|) (LETT |k| NIL)
                   (LETT #2# |lt|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL) (ATOM #3#)
                         (PROGN (LETT |e| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |k| '|atan| (QREFELT $ 95)))
                      (COND
                       ((NULL (SPADCALL |k| '|tan| (QREFELT $ 95)))
                        (EXIT "iterate")))))
                    (COND
                     ((SPADCALL |k| '|atan| (QREFELT $ 95))
                      (SEQ
                       (LETT |ik|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL 2 |im| (QREFELT $ 96)) |e|
                                         (QREFELT $ 97))
                               (QREFELT $ 98))
                              (QREFELT $ 25)))
                       (LETT |ie|
                             (SPADCALL
                              (SPADCALL (SPADCALL 2 |im| (QREFELT $ 96))
                                        (SPADCALL |k| (QREFELT $ 99))
                                        (QREFELT $ 97))
                              (QREFELT $ 98)))
                       (LETT |resk| (CONS |ik| |resk|))
                       (EXIT (LETT |rese| (CONS |ie| |rese|))))))
                    (EXIT
                     (COND
                      ((SPADCALL |k| '|tan| (QREFELT $ 95))
                       (SEQ (LETT |e1| (SPADCALL |im| |e| (QREFELT $ 97)))
                            (LETT |k1|
                                  (SPADCALL |im| (SPADCALL |k| (QREFELT $ 99))
                                            (QREFELT $ 97)))
                            (LETT |iku|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |e1| (|spadConstant| $ 100)
                                               (QREFELT $ 101))
                                     (SPADCALL |e1| (|spadConstant| $ 100)
                                               (QREFELT $ 102))
                                     (QREFELT $ 103))
                                    (QREFELT $ 98))
                                   (QREFELT $ 104)))
                            (EXIT
                             (COND ((QEQCAR |iku| 1) "iterate")
                                   ('T
                                    (SEQ (LETT |ik| (QCDR |iku|))
                                         (LETT |ie|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |k1|
                                                           (|spadConstant| $
                                                                           100)
                                                           (QREFELT $ 101))
                                                 (SPADCALL |k1|
                                                           (|spadConstant| $
                                                                           100)
                                                           (QREFELT $ 102))
                                                 (QREFELT $ 103))
                                                (QREFELT $ 98)))
                                         (LETT |resk| (CONS |ik| |resk|))
                                         (EXIT
                                          (LETT |rese|
                                                (CONS |ie| |rese|))))))))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT (CONS (REVERSE |resk|) (REVERSE |rese|)))))) 

(SDEFUN |FSINT;inv_alg_lst|
        ((|lt| (|List| (|Kernel| F)))
         ($
          (|Record| (|:| |ker| (|List| (|Kernel| F))) (|:| |val| (|List| F)))))
        (SPROG
         ((|rese| (|List| F)) (|resk| (|List| (|Kernel| F)))
          (|ru1| (|Union| (|Kernel| F) "failed")) (|e2| (F))
          (|ckf| (|Expression| (|Complex| R)))
          (|ck| (|Kernel| (|Expression| (|Complex| R))))
          (|ckl| (|List| (|Kernel| (|Expression| (|Complex| R)))))
          (|e1| (|Expression| (|Complex| R))) (#1=#:G249 NIL) (|k| NIL)
          (|im| (F)))
         (SEQ (LETT |resk| NIL) (LETT |rese| NIL)
              (LETT |im|
                    (SPADCALL (SPADCALL (|spadConstant| $ 46) (QREFELT $ 105))
                              (QREFELT $ 106)))
              (SEQ (LETT |k| NIL) (LETT #1# |lt|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |k| '|nthRoot| (QREFELT $ 84)))
                       "iterate")
                      ('T
                       (SEQ
                        (LETT |e1|
                              (SPADCALL (SPADCALL |k| (QREFELT $ 52))
                                        (QREFELT $ 22)))
                        (LETT |ckl| (SPADCALL |e1| (QREFELT $ 107)))
                        (EXIT
                         (COND
                          ((SPADCALL (LENGTH |ckl|) 1 (QREFELT $ 54))
                           "iterate")
                          ('T
                           (SEQ (LETT |ck| (SPADCALL |ckl| 1 (QREFELT $ 109)))
                                (LETT |ckf| (SPADCALL |ck| (QREFELT $ 99)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |e1| |ckf| (QREFELT $ 110))
                                   "iterate")
                                  ('T
                                   (SEQ
                                    (LETT |e2|
                                          (SPADCALL |ckf| (QREFELT $ 111)))
                                    (LETT |ru1| (SPADCALL |e2| (QREFELT $ 74)))
                                    (EXIT
                                     (COND ((QEQCAR |ru1| 1) "iterate")
                                           ('T
                                            (SEQ
                                             (LETT |resk|
                                                   (CONS (QCDR |ru1|) |resk|))
                                             (EXIT
                                              (LETT |rese|
                                                    (CONS
                                                     (SPADCALL
                                                      (SPADCALL |k|
                                                                (QREFELT $ 52))
                                                      (SPADCALL
                                                       (SPADCALL |e1| |ckf|
                                                                 (QREFELT $
                                                                          103))
                                                       (QREFELT $ 111))
                                                      (QREFELT $ 50))
                                                     |rese|))))))))))))))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |resk|) (NREVERSE |rese|)))))) 

(SDEFUN |FSINT;to_real|
        ((|fg| (|Expression| (|Complex| R)))
         (|rtg|
          (|Record|
           (|:| |ker| (|List| (|Kernel| (|Expression| (|Complex| R)))))
           (|:| |val| (|List| (|Expression| (|Complex| R))))))
         (|ralg|
          (|Record| (|:| |ker| (|List| (|Kernel| F))) (|:| |val| (|List| F))))
         ($ (F)))
        (SPROG ((|f| (F)))
               (SEQ
                (LETT |f|
                      (SPADCALL
                       (SPADCALL |fg| (QCAR |rtg|) (QCDR |rtg|)
                                 (QREFELT $ 112))
                       (QREFELT $ 111)))
                (EXIT
                 (SPADCALL |f| (QCAR |ralg|) (QCDR |ralg|) (QREFELT $ 113)))))) 

(SDEFUN |FSINT;goComplex?|
        ((|rt| (|Boolean|)) (|l| (|List| (|Kernel| F)))
         (|ltan| (|List| (|Kernel| F))) ($ (|Boolean|)))
        (COND ((NULL |ltan|) |rt|) ('T 'T))) 

(SDEFUN |FSINT;integrate;FSU;16|
        ((|f| (F)) (|x| (|Symbol|)) ($ (|Union| F (|List| F))))
        (SPROG
         ((|rl| (|List| F)) (#1=#:G315 NIL) (|h| NIL) (#2=#:G314 NIL)
          (|ltg0| #3=(|List| (|Kernel| F))) (|i| (|IntegrationResult| F))
          (|gg| (|Expression| (|Complex| R)))
          (|rtg1|
           (|Record|
            (|:| |ker| (|List| (|Kernel| (|Expression| (|Complex| R)))))
            (|:| |val| (|List| (|Expression| (|Complex| R))))))
          (|tgg1| (|List| (|Expression| (|Complex| R)))) (#4=#:G313 NIL)
          (|k| NIL) (#5=#:G312 NIL)
          (|tgg0| (|List| (|Kernel| (|Expression| (|Complex| R)))))
          (|gg0| (|Expression| (|Complex| R)))
          (|ralg|
           (|Record| (|:| |ker| (|List| (|Kernel| F))) (|:| |val| (|List| F))))
          (|el| #6=(|Boolean|)) (|rtg| #6#) (|ltg| #3#)
          (|tg| (|List| (|Kernel| F))) (#7=#:G311 NIL) (#8=#:G310 NIL)
          (|tg0| #9=(|List| (|Kernel| F))) (|g| (F))
          (|nr_lst| (|List| (|Kernel| F))) (|ir_lst| (|List| F))
          (|rv_lst| (|List| F)) (|nk| (F)) (|ec| (F))
          (|r_lst| (|List| (|Kernel| F))) (|rnumu| (|Union| R "failed"))
          (|nak| (F))
          (|pr|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (|ak2| (|NonNegativeInteger|)) (#10=#:G278 NIL) (|ak1| (F))
          (|akl| (|List| F)) (#11=#:G309 NIL) (|tf2| #9#)
          (|rec|
           (|Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
                     (|:| |vals| (|List| F))))
          (|tf1| #9#) (|f1| (F)) (|evals| (|List| F))
          (|ekers| (|List| (|Kernel| F))) (|kn| (|Symbol|)) (|s| (F))
          (|vk| (|Kernel| F)) (|vu| (|Union| (|Kernel| F) "failed"))
          (#12=#:G307 NIL) (#13=#:G308 NIL) (|v| NIL) (|etf| (|List| F))
          (#14=#:G306 NIL) (#15=#:G305 NIL) (|ht| #6#) (|ltf| #3#)
          (|tf| (|List| (|Kernel| F))) (|ir| (|IntegrationResult| F)))
         (SEQ
          (COND
           ((OR (|HasSignature| (QREFELT $ 6) (LIST '|imaginary| (LIST '$)))
                (|domainEqual| (QREFELT $ 6) (|AlgebraicNumber|)))
            (SEQ (LETT |ir| (SPADCALL |f| |x| (QREFELT $ 115)))
                 (EXIT (CONS 0 (SPADCALL |ir| (QREFELT $ 116))))))
           ((NULL (SPADCALL |f| (QREFELT $ 117)))
            (CONS 0 (SPADCALL |f| |x| (QREFELT $ 119))))
           ('T
            (SEQ
             (LETT |f|
                   (SPADCALL |f| (SPADCALL |x| (QREFELT $ 120))
                             (QREFELT $ 121)))
             (LETT |tf| (|FSINT;extend_tower| (SPADCALL |f| (QREFELT $ 87)) $))
             (LETT |ltf|
                   (SPADCALL (CONS #'|FSINT;integrate;FSU;16!0| $) |tf|
                             (QREFELT $ 123)))
             (LETT |ht|
                   (SPADCALL
                    (CONS #'|FSINT;integrate;FSU;16!1|
                          (VECTOR (QREFELT $ 9) $))
                    |tf| (QREFELT $ 124)))
             (LETT |etf|
                   (PROGN
                    (LETT #15# NIL)
                    (SEQ (LETT |k| NIL) (LETT #14# |tf|) G190
                         (COND
                          ((OR (ATOM #14#) (PROGN (LETT |k| (CAR #14#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #15#
                                 (CONS
                                  (SPADCALL (SPADCALL |k| (QREFELT $ 52)) |x|
                                            (QREFELT $ 125))
                                  #15#))))
                         (LETT #14# (CDR #14#)) (GO G190) G191
                         (EXIT (NREVERSE #15#)))))
             (LETT |ekers| NIL) (LETT |evals| NIL)
             (SEQ (LETT |v| NIL) (LETT #13# |etf|) (LETT |k| NIL)
                  (LETT #12# |tf|) G190
                  (COND
                   ((OR (ATOM #12#) (PROGN (LETT |k| (CAR #12#)) NIL)
                        (ATOM #13#) (PROGN (LETT |v| (CAR #13#)) NIL))
                    (GO G191)))
                  (SEQ (LETT |s| (|spadConstant| $ 57))
                       (SEQ (LETT |vu| (SPADCALL |v| (QREFELT $ 74)))
                            (EXIT
                             (COND
                              ((QEQCAR |vu| 0)
                               (SEQ (LETT |vk| (QCDR |vu|))
                                    (EXIT (LETT |s| (|spadConstant| $ 46)))))
                              ('T
                               (SEQ
                                (LETT |vu|
                                      (SPADCALL (SPADCALL |v| (QREFELT $ 105))
                                                (QREFELT $ 74)))
                                (EXIT
                                 (COND
                                  ((QEQCAR |vu| 0)
                                   (SEQ (LETT |vk| (QCDR |vu|))
                                        (EXIT
                                         (LETT |s|
                                               (SPADCALL (|spadConstant| $ 46)
                                                         (QREFELT $
                                                                  105)))))))))))))
                       (EXIT
                        (COND
                         ((SPADCALL |s| (|spadConstant| $ 57) (QREFELT $ 126))
                          (SEQ
                           (LETT |kn|
                                 (SPADCALL (SPADCALL |vk| (QREFELT $ 53))
                                           (QREFELT $ 61)))
                           (EXIT
                            (COND
                             ((OR (EQUAL |kn| '|%iint|) (EQUAL |kn| '|atan|))
                              (SEQ (LETT |ekers| (CONS |vk| |ekers|))
                                   (EXIT
                                    (LETT |evals|
                                          (CONS
                                           (SPADCALL |s|
                                                     (SPADCALL |k|
                                                               (QREFELT $ 52))
                                                     (QREFELT $ 127))
                                           |evals|))))))))))))
                  (LETT #12# (PROG1 (CDR #12#) (LETT #13# (CDR #13#))))
                  (GO G190) G191 (EXIT NIL))
             (LETT |f1| (SPADCALL |f| |tf| |etf| (QREFELT $ 83)))
             (LETT |tf1| (SPADCALL |f1| (QREFELT $ 87)))
             (LETT |rec| (SPADCALL |f1| |x| (QREFELT $ 129)))
             (LETT |tf2| (SPADCALL (QVELT |rec| 0) (QREFELT $ 87)))
             (LETT |r_lst| NIL) (LETT |rv_lst| NIL) (LETT |nr_lst| NIL)
             (LETT |ir_lst| NIL)
             (SEQ (LETT |k| NIL) (LETT #11# |tf2|) G190
                  (COND
                   ((OR (ATOM #11#) (PROGN (LETT |k| (CAR #11#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((NULL (SPADCALL |k| '|nthRoot| (QREFELT $ 84)))
                      "iterate")
                     ('T
                      (SEQ (LETT |akl| (SPADCALL |k| (QREFELT $ 19)))
                           (LETT |ak1|
                                 (SPADCALL (|SPADfirst| |akl|) |r_lst| |rv_lst|
                                           (QREFELT $ 83)))
                           (LETT |ak2|
                                 (PROG1
                                     (LETT #10#
                                           (SPADCALL
                                            (SPADCALL |akl| 2 (QREFELT $ 130))
                                            (QREFELT $ 131)))
                                   (|check_subtype2| (>= #10# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #10#)))
                           (LETT |pr| (SPADCALL |ak1| |ak2| (QREFELT $ 134)))
                           (LETT |nak| (QVELT |pr| 2))
                           (LETT |rnumu|
                                 (SPADCALL (SPADCALL |nak| (QREFELT $ 136))
                                           (QREFELT $ 139)))
                           (COND
                            ((EQL (QVELT |pr| 0) |ak2|)
                             (COND
                              ((SPADCALL (QVELT |pr| 1) (|spadConstant| $ 46)
                                         (QREFELT $ 58))
                               (COND ((QEQCAR |rnumu| 1) (EXIT "iterate")))))))
                           (LETT |r_lst| (CONS |k| |r_lst|))
                           (LETT |ec|
                                 (SPADCALL (QVELT |pr| 1) |nr_lst| |ir_lst|
                                           (QREFELT $ 83)))
                           (COND
                            ((QEQCAR |rnumu| 0)
                             (SEQ
                              (LETT |nk|
                                    (SPADCALL (SPADCALL |k| (QREFELT $ 53))
                                              (LIST
                                               (SPADCALL (|spadConstant| $ 46)
                                                         |nak| (QREFELT $ 50))
                                               (SPADCALL (QVELT |pr| 0)
                                                         (QREFELT $ 140)))
                                              (QREFELT $ 69)))
                              (LETT |rv_lst|
                                    (CONS
                                     (SPADCALL (QVELT |pr| 1) |nk|
                                               (QREFELT $ 50))
                                     |rv_lst|))
                              (EXIT
                               (LETT |ir_lst|
                                     (CONS
                                      (SPADCALL |ec|
                                                (SPADCALL |k| (QREFELT $ 52))
                                                (QREFELT $ 50))
                                      |ir_lst|)))))
                            ('T
                             (SEQ
                              (LETT |nk|
                                    (SPADCALL (SPADCALL |k| (QREFELT $ 53))
                                              (LIST |nak|
                                                    (SPADCALL (QVELT |pr| 0)
                                                              (QREFELT $ 140)))
                                              (QREFELT $ 69)))
                              (LETT |rv_lst|
                                    (CONS
                                     (SPADCALL (QVELT |pr| 1) |nk|
                                               (QREFELT $ 127))
                                     |rv_lst|))
                              (EXIT
                               (LETT |ir_lst|
                                     (CONS
                                      (SPADCALL (SPADCALL |k| (QREFELT $ 52))
                                                (SPADCALL (QVELT |pr| 1)
                                                          |nr_lst| |ir_lst|
                                                          (QREFELT $ 83))
                                                (QREFELT $ 50))
                                      |ir_lst|))))))
                           (EXIT
                            (LETT |nr_lst|
                                  (CONS (SPADCALL |nk| (QREFELT $ 70))
                                        |nr_lst|))))))))
                  (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
             (LETT |g|
                   (SPADCALL (QVELT |rec| 0) |r_lst| |rv_lst| (QREFELT $ 113)))
             (LETT |tg0| (SPADCALL |g| (QREFELT $ 87)))
             (LETT |tg|
                   (PROGN
                    (LETT #8# NIL)
                    (SEQ (LETT |k| NIL) (LETT #7# |tg0|) G190
                         (COND
                          ((OR (ATOM #7#) (PROGN (LETT |k| (CAR #7#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |x|
                                       (SPADCALL (SPADCALL |k| (QREFELT $ 52))
                                                 (QREFELT $ 142))
                                       (QREFELT $ 143))
                             (LETT #8# (CONS |k| #8#))))))
                         (LETT #7# (CDR #7#)) (GO G190) G191
                         (EXIT (NREVERSE #8#)))))
             (LETT |ltg0|
                   (SPADCALL (CONS #'|FSINT;integrate;FSU;16!2| $) |tg0|
                             (QREFELT $ 123)))
             (LETT |ltg|
                   (SPADCALL (CONS #'|FSINT;integrate;FSU;16!3| $) |tg|
                             (QREFELT $ 123)))
             (LETT |rtg|
                   (SPADCALL
                    (CONS #'|FSINT;integrate;FSU;16!4|
                          (VECTOR (QREFELT $ 8) $))
                    |tg| (QREFELT $ 124)))
             (LETT |el|
                   (SPADCALL
                    (CONS #'|FSINT;integrate;FSU;16!5|
                          (VECTOR (QREFELT $ 10) $))
                    |tg| (QREFELT $ 124)))
             (COND
              ((|FSINT;goComplex?| |rtg| |tg| |ltg| $)
               (SEQ (LETT |ralg| (|FSINT;inv_alg_lst| |tg0| $))
                    (LETT |gg0| (SPADCALL |g| (QREFELT $ 22)))
                    (LETT |tgg0| (SPADCALL |gg0| (QREFELT $ 144)))
                    (LETT |tgg1|
                          (PROGN
                           (LETT #5# NIL)
                           (SEQ (LETT |k| NIL) (LETT #4# |tgg0|) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |k| (CAR #4#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |k| (QREFELT $ 99)) NIL
                                          (QREFELT $ 145))
                                         #5#))))
                                (LETT #4# (CDR #4#)) (GO G190) G191
                                (EXIT (NREVERSE #5#)))))
                    (LETT |rtg1| (|FSINT;inv_lst| |tgg0| |tgg1| $))
                    (LETT |gg| (SPADCALL |gg0| |tgg0| |tgg1| (QREFELT $ 146)))
                    (LETT |i|
                          (SPADCALL
                           (CONS #'|FSINT;integrate;FSU;16!6|
                                 (VECTOR $ |ralg| |rtg1|))
                           (SPADCALL |gg| |x| (QREFELT $ 149))
                           (QREFELT $ 152)))
                    (EXIT
                     (LETT |i|
                           (SPADCALL |i|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 46)
                                                 (QREFELT $ 105))
                                       (QREFELT $ 106))
                                      (QREFELT $ 70))
                                     (QREFELT $ 154))))))
              (#16='T (LETT |i| (SPADCALL |g| |x| (QREFELT $ 156)))))
             (LETT |i|
                   (SPADCALL
                    (CONS #'|FSINT;integrate;FSU;16!7|
                          (VECTOR $ |ir_lst| |nr_lst|))
                    |i| (QREFELT $ 159)))
             (LETT |ltg0| (SPADCALL |ltg0| |ltf| (QREFELT $ 160)))
             (LETT |rl|
                   (PROGN
                    (LETT #2# NIL)
                    (SEQ (LETT |h| NIL)
                         (LETT #1#
                               (|FSINT;rinteg| |i| |f| |x|
                                (COND (|el| |ht|) (#16# NIL)) $))
                         G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |h| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (|FSINT;postSubst| |h| |tf1| (QVELT |rec| 2)
                                   (QVELT |rec| 1) |ltg0| |ekers| |evals| |x|
                                   $)
                                  #2#))))
                         (LETT #1# (CDR #1#)) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))
             (EXIT
              (COND ((NULL (CDR |rl|)) (CONS 0 (|SPADfirst| |rl|)))
                    (#16# (CONS 1 |rl|)))))))))) 

(SDEFUN |FSINT;integrate;FSU;16!7| ((|ii| NIL) ($$ NIL))
        (PROG (|nr_lst| |ir_lst| $)
          (LETT |nr_lst| (QREFELT $$ 2))
          (LETT |ir_lst| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |ii| |nr_lst| |ir_lst| (QREFELT $ 83)))))) 

(SDEFUN |FSINT;integrate;FSU;16!6| ((|fg| NIL) ($$ NIL))
        (PROG (|rtg1| |ralg| $)
          (LETT |rtg1| (QREFELT $$ 2))
          (LETT |ralg| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|FSINT;to_real| |fg| |rtg1| |ralg| $))))) 

(SDEFUN |FSINT;integrate;FSU;16!5| ((|x1| NIL) ($$ NIL))
        (PROG ($ ELEM)
          (LETT $ (QREFELT $$ 1))
          (LETT ELEM (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x1| (QREFELT $ 53)) ELEM (QREFELT $ 75)))))) 

(SDEFUN |FSINT;integrate;FSU;16!4| ((|x1| NIL) ($$ NIL))
        (PROG ($ RTRIG)
          (LETT $ (QREFELT $$ 1))
          (LETT RTRIG (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x1| (QREFELT $ 53)) RTRIG (QREFELT $ 75)))))) 

(SDEFUN |FSINT;integrate;FSU;16!3| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 53)) '|tan| (QREFELT $ 29))) 

(SDEFUN |FSINT;integrate;FSU;16!2| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 53)) '|tan| (QREFELT $ 29))) 

(SDEFUN |FSINT;integrate;FSU;16!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ HTRIG)
          (LETT $ (QREFELT $$ 1))
          (LETT HTRIG (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x1| (QREFELT $ 53)) HTRIG (QREFELT $ 75)))))) 

(SDEFUN |FSINT;integrate;FSU;16!0| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 53)) '|tan| (QREFELT $ 29))) 

(DECLAIM (NOTINLINE |FunctionSpaceIntegration;|)) 

(DEFUN |FunctionSpaceIntegration| (&REST #1=#:G316)
  (SPROG NIL
         (PROG (#2=#:G317)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionSpaceIntegration|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FunctionSpaceIntegration;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FunctionSpaceIntegration|)))))))))) 

(DEFUN |FunctionSpaceIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|FunctionSpaceIntegration| DV$1 DV$2))
          (LETT $ (GETREFV 163))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FunctionSpaceIntegration|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|rtrig|)
          (QSETREFV $ 9 '|htrig|)
          (QSETREFV $ 10 '|elem|)
          (QSETREFV $ 11 '|%alg|)
          (QSETREFV $ 16 (SPADCALL '|%temptan| 1 (QREFELT $ 15)))
          $))) 

(MAKEPROP '|FunctionSpaceIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'RTRIG
              'HTRIG 'ELEM 'ALGOP (|Symbol|) (|NonNegativeInteger|)
              (|BasicOperator|) (0 . |operator|) '|optemp| (|List| 7)
              (|Kernel| 7) (6 . |argument|) (|Expression| 92)
              (|InnerTrigonometricManipulations| 6 7 20) (11 . F2FG)
              (16 . |tan|) (|Kernel| $) (21 . |retract|) (26 . |height|)
              (31 . |kernel|) (|Boolean|) (38 . |is?|) (|List| 14)
              (44 . |operators|) (|Mapping| 28 14) (49 . |any?|)
              (|IntegrationTools| 6 7) (55 . |mkPrim|)
              (|TranscendentalManipulations| 6 7) (61 . |htrigs|)
              (|IntegrationResult| 7) (66 . |elem?|) (71 . |integral|)
              (|IntegrationResultToFunction| 6 7) (77 . |expand|)
              (|PositiveInteger|) (83 . *) (89 . |One|) (93 . |One|)
              (97 . |cos|) (102 . -) (108 . +) (114 . /) (120 . |sin|)
              (125 . |coerce|) (130 . |operator|) (135 . ~=)
              (|ElementaryFunctionStructurePackage| 6 7) (141 . |normalize|)
              (146 . |Zero|) (150 . =) (|TrigonometricManipulations| 6 7)
              (156 . |real|) (161 . |name|) (|Union| 65 '#1="failed")
              (166 . |retractIfCan|) (171 . |Zero|) (|Integer|)
              (175 . |coerce|) (180 . |coerce|) (|List| $) (185 . |kernel|)
              (191 . |retract|) (|List| 18) (196 . |member?|) (|Union| 24 '#1#)
              (202 . |retractIfCan|) (207 . |has?|)
              (|SparseUnivariatePolynomial| $) (213 . |minPoly|)
              (|SparseUnivariatePolynomial| 7)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 18) 18
                                                     6 138 7)
              (218 . |univariate|) (225 . |elt|) (|List| 24) (231 . |eval|)
              (238 . |is?|) (244 . |kernels|) (249 . |elt|) (255 . |tower|)
              (|Mapping| $ $) (260 . |eval|) (268 . |removeSinSq|)
              (273 . |removeConstantTerm|) (|Complex| 6) (279 . |complex|)
              (|Kernel| 20) (285 . |is?|) (291 . *) (297 . *) (303 . -)
              (308 . |coerce|) (313 . |One|) (317 . +) (323 . -) (329 . /)
              (335 . |retractIfCan|) (340 . -) (345 . |sqrt|) (350 . |kernels|)
              (|List| 94) (355 . |elt|) (361 . =) (367 . FG2F) (372 . |subst|)
              (379 . |subst|) (|FunctionSpaceComplexIntegrationAux| 6 7)
              (386 . |internalIntegrate|) (392 . |complexExpand|)
              (397 . |real?|) (|FunctionSpaceComplexIntegration| 6 7)
              (402 . |complexIntegrate|) (408 . |coerce|) (413 . |distribute|)
              (|Mapping| 28 18) (419 . |select|) (425 . |any?|)
              (431 . |realLiouvillian|) (437 . ~=) (443 . *)
              (|Record| (|:| |func| 7) (|:| |kers| 71) (|:| |vals| 17))
              (449 . |rischNormalize|) (455 . |elt|) (461 . |retract|)
              (|Record| (|:| |exponent| 13) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 18) 18 6 138 7)
              (466 . |froot|) (|SparseMultivariatePolynomial| 6 24)
              (472 . |numer|) (|Union| 6 '"failed")
              (|SparseMultivariatePolynomial| 6 18) (477 . |retractIfCan|)
              (482 . |coerce|) (|List| 12) (487 . |variables|)
              (492 . |member?|) (498 . |tower|) (503 . |trigs2explogs|)
              (509 . |eval|) (|IntegrationResult| 20)
              (|ElementaryIntegration| 92 20) (516 . |lfintegrate|)
              (|Mapping| 7 20) (|IntegrationResultFunctions2| 20 7)
              (522 . |map|) (|GenusZeroIntegration| 6 7 7)
              (528 . |rationalize_ir|) (|ElementaryIntegration| 6 7)
              (534 . |lfintegrate|) (|Mapping| 7 7)
              (|IntegrationResultFunctions2| 7 7) (540 . |map|)
              (546 . |setDifference|) (|Union| 7 17) |FSINT;integrate;FSU;16|)
           '#(|integrate| 552) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|integrate|
                                 ((|Union| |#2| (|List| |#2|)) |#2|
                                  (|Symbol|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 162
                                            '(2 14 0 12 13 15 1 18 17 0 19 1 21
                                              20 7 22 1 20 0 0 23 1 20 24 0 25
                                              1 18 13 0 26 3 18 0 14 17 13 27 2
                                              14 28 0 12 29 1 7 30 0 31 2 30 28
                                              32 0 33 2 34 7 7 12 35 1 36 7 7
                                              37 1 38 28 0 39 2 7 0 0 12 40 2
                                              41 17 38 12 42 2 7 0 43 0 44 0 6
                                              0 45 0 7 0 46 1 7 0 0 47 2 7 0 0
                                              0 48 2 7 0 0 0 49 2 7 0 0 0 50 1
                                              7 0 0 51 1 7 0 24 52 1 18 14 0 53
                                              2 13 28 0 0 54 1 55 7 7 56 0 7 0
                                              57 2 7 28 0 0 58 1 59 7 7 60 1 14
                                              12 0 61 1 7 62 0 63 0 6 0 64 1 6
                                              0 65 66 1 7 0 6 67 2 7 0 14 68 69
                                              1 7 24 0 70 2 71 28 18 0 72 1 7
                                              73 0 74 2 14 28 0 12 75 1 7 76 24
                                              77 3 79 78 7 18 78 80 2 78 7 0 7
                                              81 3 7 0 0 82 68 83 2 18 28 0 12
                                              84 1 7 82 0 85 2 71 18 0 65 86 1
                                              7 82 0 87 4 7 0 0 12 13 88 89 1
                                              36 7 7 90 2 34 7 7 12 91 2 92 0 6
                                              6 93 2 94 28 0 12 95 2 92 0 43 0
                                              96 2 20 0 92 0 97 1 20 0 0 98 1
                                              20 0 24 99 0 20 0 100 2 20 0 0 0
                                              101 2 20 0 0 0 102 2 20 0 0 0 103
                                              1 20 73 0 104 1 7 0 0 105 1 7 0 0
                                              106 1 20 82 0 107 2 108 94 0 65
                                              109 2 20 28 0 0 110 1 21 7 20 111
                                              3 20 0 0 82 68 112 3 7 0 0 82 68
                                              113 2 114 38 7 12 115 1 41 7 38
                                              116 1 59 28 7 117 2 118 7 7 12
                                              119 1 7 0 12 120 2 7 0 0 0 121 2
                                              71 0 122 0 123 2 71 28 122 0 124
                                              2 55 7 7 12 125 2 7 28 0 0 126 2
                                              7 0 0 0 127 2 55 128 7 12 129 2
                                              17 7 0 65 130 1 7 65 0 131 2 133
                                              132 7 13 134 1 7 135 0 136 1 138
                                              137 0 139 1 7 0 65 140 1 7 141 0
                                              142 2 141 28 12 0 143 1 20 82 0
                                              144 2 21 20 20 108 145 3 20 0 0
                                              82 68 146 2 148 147 20 12 149 2
                                              151 38 150 147 152 2 153 38 38 18
                                              154 2 155 38 7 12 156 2 158 38
                                              157 38 159 2 71 0 0 0 160 2 0 161
                                              7 12 162)))))
           '|lookupComplete|)) 
