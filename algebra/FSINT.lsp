
(SDEFUN |FSINT;K2KG|
        ((|k| |Kernel| F) ($ |Kernel| (|Expression| (|Complex| R))))
        (SPADCALL
         (SPADCALL
          (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 19))) (QREFELT $ 22))
          (QREFELT $ 23))
         (QREFELT $ 25))) 

(SDEFUN |FSINT;tan2temp| ((|k| |Kernel| F) ($ |Kernel| F))
        (SPADCALL (QREFELT $ 16) (SPADCALL |k| (QREFELT $ 19))
                  (SPADCALL |k| (QREFELT $ 26)) (QREFELT $ 27))) 

(SDEFUN |FSINT;trans?| ((|f| F) ($ |Boolean|))
        (SPADCALL (CONS #'|FSINT;trans?!0| $) (SPADCALL |f| (QREFELT $ 32))
                  (QREFELT $ 34))) 

(SDEFUN |FSINT;trans?!0| ((|x1| NIL) ($ NIL))
        (COND
         ((OR (SPADCALL |x1| '|log| (QREFELT $ 29))
              (SPADCALL |x1| '|exp| (QREFELT $ 29)))
          (|spadConstant| $ 30))
         ('T (SPADCALL |x1| '|atan| (QREFELT $ 29))))) 

(SDEFUN |FSINT;mkPrimh| ((|f| F) (|x| |Symbol|) (|h| |Boolean|) ($ F))
        (SPROG ((|g| (F)))
               (SEQ
                (LETT |g| (SPADCALL |f| |x| (QREFELT $ 36)) |FSINT;mkPrimh|)
                (COND
                 (|h|
                  (COND
                   ((|FSINT;trans?| |g| $)
                    (EXIT (SPADCALL |g| (QREFELT $ 38)))))))
                (EXIT |g|)))) 

(SDEFUN |FSINT;rinteg|
        ((|i| |IntegrationResult| F) (|f| F) (|x| |Symbol|) (|h| |Boolean|)
         ($ |Union| F (|List| F)))
        (SPROG ((|l| (|List| F)) (#1=#:G148 NIL) (#2=#:G147 NIL))
               (SEQ
                (COND
                 ((NULL (SPADCALL |i| (QREFELT $ 40)))
                  (CONS 0 (SPADCALL |f| |x| (QREFELT $ 41))))
                 ('T
                  (COND
                   ((NULL
                     (CDR
                      (LETT |l|
                            (PROGN
                             (LETT #2# NIL . #3=(|FSINT;rinteg|))
                             (SEQ (LETT |f| NIL . #3#)
                                  (LETT #1# (SPADCALL |i| (QREFELT $ 43))
                                        . #3#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS (|FSINT;mkPrimh| |f| |x| |h| $)
                                                #2#)
                                          . #3#)))
                                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            . #3#)))
                    (CONS 0 (|SPADfirst| |l|)))
                   ('T (CONS 1 |l|)))))))) 

(SDEFUN |FSINT;halfangle| ((|a| F) ($ F))
        (SEQ (LETT |a| (SPADCALL 2 |a| (QREFELT $ 45)) |FSINT;halfangle|)
             (EXIT
              (SPADCALL
               (SPADCALL (|spadConstant| $ 47) (SPADCALL |a| (QREFELT $ 48))
                         (QREFELT $ 49))
               (SPADCALL (|spadConstant| $ 47) (SPADCALL |a| (QREFELT $ 48))
                         (QREFELT $ 50))
               (QREFELT $ 51))))) 

(SDEFUN |FSINT;Khalf| ((|k| |Kernel| F) ($ F))
        (SPROG ((|a| (F)))
               (SEQ
                (LETT |a|
                      (SPADCALL 2 (|SPADfirst| (SPADCALL |k| (QREFELT $ 19)))
                                (QREFELT $ 45))
                      |FSINT;Khalf|)
                (EXIT
                 (SPADCALL (SPADCALL |a| (QREFELT $ 52))
                           (SPADCALL (|spadConstant| $ 47)
                                     (SPADCALL |a| (QREFELT $ 48))
                                     (QREFELT $ 50))
                           (QREFELT $ 51)))))) 

(SDEFUN |FSINT;find_int|
        ((|i| |Kernel| F) (|t| |List| (|Kernel| F)) ($ |Kernel| F))
        (SPROG
         ((#1=#:G159 NIL) (|akl| #2=(|List| F)) (#3=#:G160 NIL) (|k| NIL)
          (|ii| (F)) (|k0| (|NonNegativeInteger|)) (|ail| #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ail| (SPADCALL |i| (QREFELT $ 19)) . #4=(|FSINT;find_int|))
            (LETT |k0| (LENGTH |ail|) . #4#)
            (LETT |ii| (SPADCALL |i| (QREFELT $ 53)) . #4#)
            (SEQ (LETT |k| NIL . #4#) (LETT #3# |t| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |k| (QREFELT $ 54)) '|%iint|
                               (QREFELT $ 29))
                     (SEQ (LETT |akl| (SPADCALL |k| (QREFELT $ 19)) . #4#)
                          (EXIT
                           (COND
                            ((SPADCALL (LENGTH |akl|) |k0| (QREFELT $ 55))
                             "iterate")
                            ((SPADCALL
                              (SPADCALL
                               (SPADCALL |ii| (SPADCALL |k| (QREFELT $ 53))
                                         (QREFELT $ 49))
                               (QREFELT $ 57))
                              (|spadConstant| $ 58) (QREFELT $ 59))
                             (PROGN
                              (LETT #1# |k| . #4#)
                              (GO #5=#:G158))))))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT |i|)))
          #5# (EXIT #1#)))) 

(SDEFUN |FSINT;try_real| ((|f| F) ($ F))
        (SPROG ((|pu| (|Union| F "failed")))
               (SEQ
                (LETT |pu| (|trappedSpadEval| (SPADCALL |f| (QREFELT $ 61)))
                      |FSINT;try_real|)
                (EXIT (COND ((QEQCAR |pu| 0) (QCDR |pu|)) ('T |f|)))))) 

(SDEFUN |FSINT;postSubst|
        ((|f| F) (|otf| |List| (|Kernel| F)) (|lv| |List| F)
         (|lk| |List| (|Kernel| F)) (|ltan| |List| (|Kernel| F)) (|x| |Symbol|)
         ($ F))
        (SPROG
         ((#1=#:G198 NIL) (|k| NIL) (#2=#:G197 NIL) (#3=#:G196 NIL)
          (#4=#:G195 NIL) (|ltemp| (|List| (|Kernel| F))) (#5=#:G194 NIL)
          (#6=#:G193 NIL) (|vkv| (F)) (|vc| (F)) (|vkf| (F))
          (|vk| (|Kernel| F)) (|vkl| (|List| (|Kernel| F))) (#7=#:G192 NIL)
          (|kk| NIL) (#8=#:G191 NIL) (|uk| (|Kernel| F))
          (|tf| (|List| (|Kernel| F))) (|u| (|Union| (|Kernel| F) "failed"))
          (#9=#:G189 NIL) (|v| NIL) (#10=#:G190 NIL))
         (SEQ
          (SEQ (LETT |k| NIL . #11=(|FSINT;postSubst|)) (LETT #10# |lk| . #11#)
               (LETT |v| NIL . #11#) (LETT #9# |lv| . #11#) G190
               (COND
                ((OR (ATOM #9#) (PROGN (LETT |v| (CAR #9#) . #11#) NIL)
                     (ATOM #10#) (PROGN (LETT |k| (CAR #10#) . #11#) NIL))
                 (GO G191)))
               (SEQ (LETT |u| (SPADCALL |v| (QREFELT $ 63)) . #11#)
                    (EXIT
                     (COND
                      ((QEQCAR |u| 0)
                       (SEQ (LETT |uk| (QCDR |u|) . #11#)
                            (COND
                             ((SPADCALL (SPADCALL |uk| (QREFELT $ 54))
                                        (QREFELT $ 11) (QREFELT $ 64))
                              (LETT |f|
                                    (SPADCALL
                                     (SPADCALL |f| |uk|
                                               (SPADCALL |uk| (QREFELT $ 66))
                                               (QREFELT $ 69))
                                     (SPADCALL |uk| (QREFELT $ 53))
                                     (QREFELT $ 70))
                                    . #11#)))
                            (COND
                             ((SPADCALL (SPADCALL |uk| (QREFELT $ 54)) '|%iint|
                                        (QREFELT $ 29))
                              (COND
                               ((NULL
                                 (SPADCALL |uk|
                                           (LETT |tf|
                                                 (SPADCALL |f| (QREFELT $ 72))
                                                 . #11#)
                                           (QREFELT $ 74)))
                                (LETT |uk| (|FSINT;find_int| |uk| |tf| $)
                                      . #11#)))))
                            (EXIT
                             (LETT |f|
                                   (SPADCALL |f| (LIST |uk|)
                                             (LIST
                                              (SPADCALL |k| (QREFELT $ 53)))
                                             (QREFELT $ 76))
                                   . #11#))))
                      ((SPADCALL |k| '|nthRoot| (QREFELT $ 77))
                       (SEQ
                        (LETT |vkl|
                              (PROGN
                               (LETT #8# NIL . #11#)
                               (SEQ (LETT |kk| NIL . #11#)
                                    (LETT #7# (SPADCALL |v| (QREFELT $ 78))
                                          . #11#)
                                    G190
                                    (COND
                                     ((OR (ATOM #7#)
                                          (PROGN
                                           (LETT |kk| (CAR #7#) . #11#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL |kk| '|nthRoot|
                                                  (QREFELT $ 77))
                                        (LETT #8# (CONS |kk| #8#) . #11#)))))
                                    (LETT #7# (CDR #7#) . #11#) (GO G190) G191
                                    (EXIT (NREVERSE #8#))))
                              . #11#)
                        (EXIT
                         (COND
                          ((EQL (LENGTH |vkl|) 1)
                           (SEQ
                            (LETT |vk| (SPADCALL |vkl| 1 (QREFELT $ 80))
                                  . #11#)
                            (EXIT
                             (COND
                              ((SPADCALL |vk| |otf| (QREFELT $ 74)) "skip")
                              ('T
                               (SEQ
                                (LETT |vkf| (SPADCALL |vk| (QREFELT $ 53))
                                      . #11#)
                                (LETT |vc| (SPADCALL |v| |vkf| (QREFELT $ 51))
                                      . #11#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |vk|
                                             (SPADCALL |vc| (QREFELT $ 78))
                                             (QREFELT $ 74))
                                   "skip")
                                  ('T
                                   (SEQ
                                    (LETT |vkv|
                                          (SPADCALL
                                           (SPADCALL |k| (QREFELT $ 53)) |vc|
                                           (QREFELT $ 51))
                                          . #11#)
                                    (LETT |f|
                                          (SPADCALL
                                           (SPADCALL |f| |vk|
                                                     (SPADCALL |vk|
                                                               (QREFELT $ 66))
                                                     (QREFELT $ 69))
                                           |vkf| (QREFELT $ 70))
                                          . #11#)
                                    (EXIT
                                     (LETT |f|
                                           (SPADCALL |f| (LIST |vk|)
                                                     (LIST |vkv|)
                                                     (QREFELT $ 76))
                                           . #11#)))))))))))))))))))
               (LETT #9# (PROG1 (CDR #9#) (LETT #10# (CDR #10#) . #11#))
                     . #11#)
               (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL (NULL |ltan|))
            (SEQ
             (LETT |ltemp|
                   (PROGN
                    (LETT #6# NIL . #11#)
                    (SEQ (LETT |k| NIL . #11#) (LETT #5# |ltan| . #11#) G190
                         (COND
                          ((OR (ATOM #5#)
                               (PROGN (LETT |k| (CAR #5#) . #11#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #6# (CONS (|FSINT;tan2temp| |k| $) #6#)
                                 . #11#)))
                         (LETT #5# (CDR #5#) . #11#) (GO G190) G191
                         (EXIT (NREVERSE #6#))))
                   . #11#)
             (LETT |f|
                   (SPADCALL |f| |ltan|
                             (PROGN
                              (LETT #4# NIL . #11#)
                              (SEQ (LETT |k| NIL . #11#)
                                   (LETT #3# |ltemp| . #11#) G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN
                                          (LETT |k| (CAR #3#) . #11#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4#
                                           (CONS (SPADCALL |k| (QREFELT $ 53))
                                                 #4#)
                                           . #11#)))
                                   (LETT #3# (CDR #3#) . #11#) (GO G190) G191
                                   (EXIT (NREVERSE #4#))))
                             (QREFELT $ 76))
                   . #11#)
             (LETT |f|
                   (SPADCALL |f| '|%temptan| 2
                             (CONS (|function| |FSINT;halfangle|) $)
                             (QREFELT $ 82))
                   . #11#)
             (EXIT
              (LETT |f|
                    (SPADCALL |f| |ltemp|
                              (PROGN
                               (LETT #2# NIL . #11#)
                               (SEQ (LETT |k| NIL . #11#)
                                    (LETT #1# |ltemp| . #11#) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |k| (CAR #1#) . #11#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS (|FSINT;Khalf| |k| $) #2#)
                                            . #11#)))
                                    (LETT #1# (CDR #1#) . #11#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 76))
                    . #11#)))))
          (LETT |f| (|FSINT;try_real| |f| $) . #11#)
          (LETT |f| (SPADCALL |f| (QREFELT $ 83)) . #11#)
          (EXIT (SPADCALL |f| |x| (QREFELT $ 84)))))) 

(SDEFUN |FSINT;inv_lst|
        ((|lt| |List| (|Kernel| (|Expression| (|Complex| R))))
         (|le| |List| (|Expression| (|Complex| R)))
         ($ |Record|
          (|:| |ker| (|List| (|Kernel| (|Expression| (|Complex| R)))))
          (|:| |val| (|List| (|Expression| (|Complex| R))))))
        (SPROG
         ((|rese| (|List| (|Expression| (|Complex| R))))
          (|resk| (|List| (|Kernel| (|Expression| (|Complex| R)))))
          (|ie| (|Expression| (|Complex| R)))
          (|ik| (|Kernel| (|Expression| (|Complex| R))))
          (|k1| #1=(|Expression| (|Complex| R))) (|e1| #1#) (#2=#:G210 NIL)
          (|k| NIL) (#3=#:G211 NIL) (|e| NIL) (|im| (|Complex| R)))
         (SEQ (LETT |resk| NIL . #4=(|FSINT;inv_lst|)) (LETT |rese| NIL . #4#)
              (LETT |im|
                    (SPADCALL (|spadConstant| $ 85) (|spadConstant| $ 46)
                              (QREFELT $ 87))
                    . #4#)
              (SEQ (LETT |e| NIL . #4#) (LETT #3# |le| . #4#)
                   (LETT |k| NIL . #4#) (LETT #2# |lt| . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #4#) NIL)
                         (ATOM #3#) (PROGN (LETT |e| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |k| '|atan| (QREFELT $ 89)))
                      (COND
                       ((NULL (SPADCALL |k| '|tan| (QREFELT $ 89)))
                        (EXIT "iterate")))))
                    (COND
                     ((SPADCALL |k| '|atan| (QREFELT $ 89))
                      (SEQ
                       (LETT |ik|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL 2 |im| (QREFELT $ 90)) |e|
                                         (QREFELT $ 91))
                               (QREFELT $ 92))
                              (QREFELT $ 25))
                             . #4#)
                       (EXIT
                        (LETT |ie|
                              (SPADCALL
                               (SPADCALL (SPADCALL 2 |im| (QREFELT $ 90))
                                         (SPADCALL |k| (QREFELT $ 93))
                                         (QREFELT $ 91))
                               (QREFELT $ 92))
                              . #4#)))))
                    (COND
                     ((SPADCALL |k| '|tan| (QREFELT $ 89))
                      (SEQ (LETT |e1| (SPADCALL |im| |e| (QREFELT $ 91)) . #4#)
                           (LETT |k1|
                                 (SPADCALL |im| (SPADCALL |k| (QREFELT $ 93))
                                           (QREFELT $ 91))
                                 . #4#)
                           (LETT |ik|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |e1| (|spadConstant| $ 94)
                                              (QREFELT $ 95))
                                    (SPADCALL |e1| (|spadConstant| $ 94)
                                              (QREFELT $ 96))
                                    (QREFELT $ 97))
                                   (QREFELT $ 92))
                                  (QREFELT $ 25))
                                 . #4#)
                           (EXIT
                            (LETT |ie|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |k1| (|spadConstant| $ 94)
                                              (QREFELT $ 95))
                                    (SPADCALL |k1| (|spadConstant| $ 94)
                                              (QREFELT $ 96))
                                    (QREFELT $ 97))
                                   (QREFELT $ 92))
                                  . #4#)))))
                    (LETT |resk| (CONS |ik| |resk|) . #4#)
                    (EXIT (LETT |rese| (CONS |ie| |rese|) . #4#)))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (REVERSE |resk|) (REVERSE |rese|)))))) 

(SDEFUN |FSINT;inv_alg_lst|
        ((|lt| |List| (|Kernel| F))
         ($ |Record| (|:| |ker| (|List| (|Kernel| F))) (|:| |val| (|List| F))))
        (SPROG
         ((|rese| (|List| F)) (|resk| (|List| (|Kernel| F)))
          (|ru1| (|Union| (|Kernel| F) "failed")) (|e2| (F))
          (|ckf| (|Expression| (|Complex| R)))
          (|ck| (|Kernel| (|Expression| (|Complex| R))))
          (|ckl| (|List| (|Kernel| (|Expression| (|Complex| R)))))
          (|e1| (|Expression| (|Complex| R))) (#1=#:G224 NIL) (|k| NIL)
          (|im| (F)))
         (SEQ (LETT |resk| NIL . #2=(|FSINT;inv_alg_lst|))
              (LETT |rese| NIL . #2#)
              (LETT |im|
                    (SPADCALL (SPADCALL (|spadConstant| $ 47) (QREFELT $ 98))
                              (QREFELT $ 99))
                    . #2#)
              (SEQ (LETT |k| NIL . #2#) (LETT #1# |lt| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |k| '|nthRoot| (QREFELT $ 77)))
                       "iterate")
                      ('T
                       (SEQ
                        (LETT |e1|
                              (SPADCALL (SPADCALL |k| (QREFELT $ 53))
                                        (QREFELT $ 22))
                              . #2#)
                        (LETT |ckl| (SPADCALL |e1| (QREFELT $ 100)) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL (LENGTH |ckl|) 1 (QREFELT $ 55))
                           "iterate")
                          ('T
                           (SEQ
                            (LETT |ck| (SPADCALL |ckl| 1 (QREFELT $ 102))
                                  . #2#)
                            (LETT |ckf| (SPADCALL |ck| (QREFELT $ 93)) . #2#)
                            (EXIT
                             (COND
                              ((SPADCALL |e1| |ckf| (QREFELT $ 103)) "iterate")
                              ('T
                               (SEQ
                                (LETT |e2| (SPADCALL |ckf| (QREFELT $ 104))
                                      . #2#)
                                (LETT |ru1| (SPADCALL |e2| (QREFELT $ 63))
                                      . #2#)
                                (EXIT
                                 (COND ((QEQCAR |ru1| 1) "iterate")
                                       ('T
                                        (SEQ
                                         (LETT |resk|
                                               (CONS (QCDR |ru1|) |resk|)
                                               . #2#)
                                         (EXIT
                                          (LETT |rese|
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |k| (QREFELT $ 53))
                                                  (SPADCALL
                                                   (SPADCALL |e1| |ckf|
                                                             (QREFELT $ 97))
                                                   (QREFELT $ 104))
                                                  (QREFELT $ 51))
                                                 |rese|)
                                                . #2#)))))))))))))))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |resk|) (NREVERSE |rese|)))))) 

(SDEFUN |FSINT;to_real|
        ((|fg| |Expression| (|Complex| R))
         (|rtg| |Record|
          (|:| |ker| (|List| (|Kernel| (|Expression| (|Complex| R)))))
          (|:| |val| (|List| (|Expression| (|Complex| R)))))
         (|ralg| |Record| (|:| |ker| (|List| (|Kernel| F)))
          (|:| |val| (|List| F)))
         ($ F))
        (SPROG ((|f| (F)))
               (SEQ
                (LETT |f|
                      (SPADCALL
                       (SPADCALL |fg| (QCAR |rtg|) (QCDR |rtg|)
                                 (QREFELT $ 105))
                       (QREFELT $ 104))
                      |FSINT;to_real|)
                (EXIT
                 (SPADCALL |f| (QCAR |ralg|) (QCDR |ralg|) (QREFELT $ 76)))))) 

(SDEFUN |FSINT;goComplex?|
        ((|rt| |Boolean|) (|l| |List| (|Kernel| F))
         (|ltan| |List| (|Kernel| F)) ($ |Boolean|))
        (COND ((NULL |ltan|) |rt|) ((NULL (CDR (CDR |l|))) 'NIL) ('T 'T))) 

(SDEFUN |FSINT;integrate;FSU;15|
        ((|f| F) (|x| |Symbol|) ($ |Union| F (|List| F)))
        (SPROG
         ((#1=#:G270 NIL) (|h| NIL) (#2=#:G269 NIL)
          (|u| (|Union| F (|List| F))) (|ovals| (|List| F))
          (|okers| (|List| (|Kernel| F))) (|ltg| #3=(|List| (|Kernel| F)))
          (|i| (|IntegrationResult| F)) (|gg| (|Expression| (|Complex| R)))
          (|rtg1|
           (|Record|
            (|:| |ker| (|List| (|Kernel| (|Expression| (|Complex| R)))))
            (|:| |val| (|List| (|Expression| (|Complex| R))))))
          (|tgg1| (|List| (|Expression| (|Complex| R)))) (#4=#:G268 NIL)
          (|k| NIL) (#5=#:G267 NIL)
          (|tgg0| (|List| (|Kernel| (|Expression| (|Complex| R)))))
          (|gg0| (|Expression| (|Complex| R)))
          (|ralg|
           (|Record| (|:| |ker| (|List| (|Kernel| F))) (|:| |val| (|List| F))))
          (|el| #6=(|Boolean|)) (|rtg| #6#) (|tg| (|List| (|Kernel| F)))
          (#7=#:G266 NIL) (#8=#:G265 NIL) (|tg0| #9=(|List| (|Kernel| F)))
          (|g| (F))
          (|rec|
           (|Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
                     (|:| |vals| (|List| F))))
          (|tf1| #9#) (|f1| (F)) (|evals| (|List| F))
          (|ekers| (|List| (|Kernel| F))) (|kn| (|Symbol|)) (|vk| (|Kernel| F))
          (|vu| (|Union| (|Kernel| F) "failed")) (#10=#:G263 NIL)
          (#11=#:G264 NIL) (|v| NIL) (|etf| (|List| F)) (#12=#:G262 NIL)
          (#13=#:G261 NIL) (|ht| #6#) (|ltf| #3#) (|tf| #9#))
         (SEQ
          (COND
           ((OR (|HasSignature| (QREFELT $ 6) (LIST '|imaginary| (LIST '$)))
                (|domainEqual| (QREFELT $ 6) (|AlgebraicNumber|)))
            (CONS 0 (SPADCALL |f| |x| (QREFELT $ 107))))
           ((NULL (SPADCALL |f| (QREFELT $ 108)))
            (CONS 0 (SPADCALL |f| |x| (QREFELT $ 107))))
           ('T
            (SEQ
             (LETT |f|
                   (SPADCALL |f| (SPADCALL |x| (QREFELT $ 109))
                             (QREFELT $ 110))
                   . #14=(|FSINT;integrate;FSU;15|))
             (LETT |tf| (SPADCALL |f| (QREFELT $ 72)) . #14#)
             (LETT |ltf|
                   (SPADCALL (CONS #'|FSINT;integrate;FSU;15!0| $) |tf|
                             (QREFELT $ 112))
                   . #14#)
             (LETT |ht|
                   (SPADCALL
                    (CONS #'|FSINT;integrate;FSU;15!1|
                          (VECTOR (QREFELT $ 9) $))
                    |tf| (QREFELT $ 113))
                   . #14#)
             (LETT |etf|
                   (PROGN
                    (LETT #13# NIL . #14#)
                    (SEQ (LETT |k| NIL . #14#) (LETT #12# |tf| . #14#) G190
                         (COND
                          ((OR (ATOM #12#)
                               (PROGN (LETT |k| (CAR #12#) . #14#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #13#
                                 (CONS
                                  (SPADCALL (SPADCALL |k| (QREFELT $ 53)) |x|
                                            (QREFELT $ 114))
                                  #13#)
                                 . #14#)))
                         (LETT #12# (CDR #12#) . #14#) (GO G190) G191
                         (EXIT (NREVERSE #13#))))
                   . #14#)
             (LETT |ekers| NIL . #14#) (LETT |evals| NIL . #14#)
             (SEQ (LETT |v| NIL . #14#) (LETT #11# |etf| . #14#)
                  (LETT |k| NIL . #14#) (LETT #10# |tf| . #14#) G190
                  (COND
                   ((OR (ATOM #10#) (PROGN (LETT |k| (CAR #10#) . #14#) NIL)
                        (ATOM #11#) (PROGN (LETT |v| (CAR #11#) . #14#) NIL))
                    (GO G191)))
                  (SEQ (LETT |vu| (SPADCALL |v| (QREFELT $ 63)) . #14#)
                       (EXIT
                        (COND
                         ((QEQCAR |vu| 0)
                          (SEQ (LETT |vk| (QCDR |vu|) . #14#)
                               (LETT |kn|
                                     (SPADCALL (SPADCALL |vk| (QREFELT $ 54))
                                               (QREFELT $ 115))
                                     . #14#)
                               (EXIT
                                (COND
                                 ((OR (EQUAL |kn| '|%iint|)
                                      (EQUAL |kn| '|atan|))
                                  (SEQ (LETT |ekers| (CONS |k| |ekers|) . #14#)
                                       (EXIT
                                        (LETT |evals| (CONS |v| |evals|)
                                              . #14#)))))))))))
                  (LETT #10# (PROG1 (CDR #10#) (LETT #11# (CDR #11#) . #14#))
                        . #14#)
                  (GO G190) G191 (EXIT NIL))
             (LETT |f1| (SPADCALL |f| |tf| |etf| (QREFELT $ 76)) . #14#)
             (LETT |tf1| (SPADCALL |f1| (QREFELT $ 72)) . #14#)
             (LETT |rec| (SPADCALL |f1| |x| (QREFELT $ 117)) . #14#)
             (LETT |g| (SPADCALL (QVELT |rec| 0) (QREFELT $ 119)) . #14#)
             (LETT |tg0| (SPADCALL |g| (QREFELT $ 72)) . #14#)
             (LETT |tg|
                   (PROGN
                    (LETT #8# NIL . #14#)
                    (SEQ (LETT |k| NIL . #14#) (LETT #7# |tg0| . #14#) G190
                         (COND
                          ((OR (ATOM #7#)
                               (PROGN (LETT |k| (CAR #7#) . #14#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |x|
                                       (SPADCALL (SPADCALL |k| (QREFELT $ 53))
                                                 (QREFELT $ 121))
                                       (QREFELT $ 122))
                             (LETT #8# (CONS |k| #8#) . #14#)))))
                         (LETT #7# (CDR #7#) . #14#) (GO G190) G191
                         (EXIT (NREVERSE #8#))))
                   . #14#)
             (LETT |ltg|
                   (SPADCALL (CONS #'|FSINT;integrate;FSU;15!2| $) |tg|
                             (QREFELT $ 112))
                   . #14#)
             (LETT |rtg|
                   (SPADCALL
                    (CONS #'|FSINT;integrate;FSU;15!3|
                          (VECTOR (QREFELT $ 8) $))
                    |tg| (QREFELT $ 113))
                   . #14#)
             (LETT |el|
                   (SPADCALL
                    (CONS #'|FSINT;integrate;FSU;15!4|
                          (VECTOR (QREFELT $ 10) $))
                    |tg| (QREFELT $ 113))
                   . #14#)
             (COND
              ((|FSINT;goComplex?| |rtg| |tg| |ltg| $)
               (SEQ (LETT |ralg| (|FSINT;inv_alg_lst| |tg0| $) . #14#)
                    (LETT |gg0| (SPADCALL |g| (QREFELT $ 22)) . #14#)
                    (LETT |tgg0| (SPADCALL |gg0| (QREFELT $ 123)) . #14#)
                    (LETT |tgg1|
                          (PROGN
                           (LETT #5# NIL . #14#)
                           (SEQ (LETT |k| NIL . #14#) (LETT #4# |tgg0| . #14#)
                                G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |k| (CAR #4#) . #14#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |k| (QREFELT $ 93)) NIL
                                          (QREFELT $ 124))
                                         #5#)
                                        . #14#)))
                                (LETT #4# (CDR #4#) . #14#) (GO G190) G191
                                (EXIT (NREVERSE #5#))))
                          . #14#)
                    (LETT |rtg1| (|FSINT;inv_lst| |tgg0| |tgg1| $) . #14#)
                    (LETT |gg| (SPADCALL |gg0| |tgg0| |tgg1| (QREFELT $ 105))
                          . #14#)
                    (LETT |i|
                          (SPADCALL
                           (CONS #'|FSINT;integrate;FSU;15!5|
                                 (VECTOR $ |ralg| |rtg1|))
                           (SPADCALL |gg| |x| (QREFELT $ 127)) (QREFELT $ 130))
                          . #14#)
                    (EXIT
                     (LETT |i|
                           (SPADCALL |i|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 47)
                                                 (QREFELT $ 98))
                                       (QREFELT $ 99))
                                      (QREFELT $ 131))
                                     (QREFELT $ 133))
                           . #14#))))
              (#15='T (LETT |i| (SPADCALL |g| |x| (QREFELT $ 135)) . #14#)))
             (LETT |ltg| (SPADCALL |ltg| |ltf| (QREFELT $ 136)) . #14#)
             (LETT |okers| (SPADCALL (QVELT |rec| 1) |ekers| (QREFELT $ 137))
                   . #14#)
             (LETT |ovals| (SPADCALL (QVELT |rec| 2) |evals| (QREFELT $ 138))
                   . #14#)
             (LETT |u|
                   (|FSINT;rinteg| |i| |f| |x| (COND (|el| |ht|) (#15# 'NIL))
                    $)
                   . #14#)
             (EXIT
              (COND
               ((QEQCAR |u| 0)
                (CONS 0
                      (|FSINT;postSubst| (QCDR |u|) |tf1| |ovals| |okers| |ltg|
                       |x| $)))
               (#15#
                (CONS 1
                      (PROGN
                       (LETT #2# NIL . #14#)
                       (SEQ (LETT |h| NIL . #14#) (LETT #1# (QCDR |u|) . #14#)
                            G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |h| (CAR #1#) . #14#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (|FSINT;postSubst| |h| |tf1| |ovals|
                                      |okers| |ltg| |x| $)
                                     #2#)
                                    . #14#)))
                            (LETT #1# (CDR #1#) . #14#) (GO G190) G191
                            (EXIT (NREVERSE #2#)))))))))))))) 

(SDEFUN |FSINT;integrate;FSU;15!5| ((|fg| NIL) ($$ NIL))
        (PROG (|rtg1| |ralg| $)
          (LETT |rtg1| (QREFELT $$ 2) . #1=(|FSINT;integrate;FSU;15|))
          (LETT |ralg| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FSINT;to_real| |fg| |rtg1| |ralg| $))))) 

(SDEFUN |FSINT;integrate;FSU;15!4| ((|x1| NIL) ($$ NIL))
        (PROG ($ ELEM)
          (LETT $ (QREFELT $$ 1) . #1=(|FSINT;integrate;FSU;15|))
          (LETT ELEM (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x1| (QREFELT $ 54)) ELEM (QREFELT $ 64)))))) 

(SDEFUN |FSINT;integrate;FSU;15!3| ((|x1| NIL) ($$ NIL))
        (PROG ($ RTRIG)
          (LETT $ (QREFELT $$ 1) . #1=(|FSINT;integrate;FSU;15|))
          (LETT RTRIG (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x1| (QREFELT $ 54)) RTRIG (QREFELT $ 64)))))) 

(SDEFUN |FSINT;integrate;FSU;15!2| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 54)) '|tan| (QREFELT $ 29))) 

(SDEFUN |FSINT;integrate;FSU;15!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ HTRIG)
          (LETT $ (QREFELT $$ 1) . #1=(|FSINT;integrate;FSU;15|))
          (LETT HTRIG (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x1| (QREFELT $ 54)) HTRIG (QREFELT $ 64)))))) 

(SDEFUN |FSINT;integrate;FSU;15!0| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 54)) '|tan| (QREFELT $ 29))) 

(DECLAIM (NOTINLINE |FunctionSpaceIntegration;|)) 

(DEFUN |FunctionSpaceIntegration| (&REST #1=#:G271)
  (SPROG NIL
         (PROG (#2=#:G272)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionSpaceIntegration|)
                                               '|domainEqualList|)
                    . #3=(|FunctionSpaceIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FunctionSpaceIntegration;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FunctionSpaceIntegration|)))))))))) 

(DEFUN |FunctionSpaceIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionSpaceIntegration|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FunctionSpaceIntegration| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 141) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
              (|Kernel| 7) (6 . |argument|) (|Expression| 86)
              (|InnerTrigonometricManipulations| 6 7 20) (11 . F2FG)
              (16 . |tan|) (|Kernel| $) (21 . |retract|) (26 . |height|)
              (31 . |kernel|) (|Boolean|) (38 . |is?|) (44 . |true|)
              (|List| 14) (48 . |operators|) (|Mapping| 28 14) (53 . |any?|)
              (|IntegrationTools| 6 7) (59 . |mkPrim|)
              (|TranscendentalManipulations| 6 7) (65 . |htrigs|)
              (|IntegrationResult| 7) (70 . |elem?|) (75 . |integral|)
              (|IntegrationResultToFunction| 6 7) (81 . |expand|)
              (|PositiveInteger|) (86 . *) (92 . |One|) (96 . |One|)
              (100 . |cos|) (105 . -) (111 . +) (117 . /) (123 . |sin|)
              (128 . |coerce|) (133 . |operator|) (138 . ~=)
              (|ElementaryFunctionStructurePackage| 6 7) (144 . |normalize|)
              (149 . |Zero|) (153 . =) (|TrigonometricManipulations| 6 7)
              (159 . |real|) (|Union| 24 '"failed") (164 . |retractIfCan|)
              (169 . |has?|) (|SparseUnivariatePolynomial| $) (175 . |minPoly|)
              (|SparseUnivariatePolynomial| 7)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 18) 18
                                                     6
                                                     (|SparseMultivariatePolynomial|
                                                      6 18)
                                                     7)
              (180 . |univariate|) (187 . |elt|) (|List| 24) (193 . |tower|)
              (|List| 18) (198 . |member?|) (|List| $) (204 . |eval|)
              (211 . |is?|) (217 . |kernels|) (|Integer|) (222 . |elt|)
              (|Mapping| $ $) (228 . |eval|) (236 . |removeSinSq|)
              (241 . |removeConstantTerm|) (247 . |Zero|) (|Complex| 6)
              (251 . |complex|) (|Kernel| 20) (257 . |is?|) (263 . *) (269 . *)
              (275 . -) (280 . |coerce|) (285 . |One|) (289 . +) (295 . -)
              (301 . /) (307 . -) (312 . |sqrt|) (317 . |kernels|) (|List| 88)
              (322 . |elt|) (328 . =) (334 . FG2F) (339 . |eval|)
              (|FunctionSpaceComplexIntegration| 6 7)
              (346 . |complexIntegrate|) (352 . |real?|) (357 . |coerce|)
              (362 . |distribute|) (|Mapping| 28 18) (368 . |select|)
              (374 . |any?|) (380 . |realLiouvillian|) (386 . |name|)
              (|Record| (|:| |func| 7) (|:| |kers| 73) (|:| |vals| 17))
              (391 . |rischNormalize|) (|AlgebraicManipulations| 6 7)
              (397 . |rootSimp|) (|List| 12) (402 . |variables|)
              (407 . |member?|) (413 . |tower|) (418 . |trigs2explogs|)
              (|IntegrationResult| 20) (|ElementaryIntegration| 86 20)
              (424 . |lfintegrate|) (|Mapping| 7 20)
              (|IntegrationResultFunctions2| 20 7) (430 . |map|)
              (436 . |retract|) (|GenusZeroIntegration| 6 7 7)
              (441 . |rationalize_ir|) (|ElementaryIntegration| 6 7)
              (447 . |lfintegrate|) (453 . |setDifference|) (459 . |concat|)
              (465 . |concat|) (|Union| 7 17) |FSINT;integrate;FSU;15|)
           '#(|integrate| 471) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 140
                                                 '(2 14 0 12 13 15 1 18 17 0 19
                                                   1 21 20 7 22 1 20 0 0 23 1
                                                   20 24 0 25 1 18 13 0 26 3 18
                                                   0 14 17 13 27 2 14 28 0 12
                                                   29 0 28 0 30 1 7 31 0 32 2
                                                   31 28 33 0 34 2 35 7 7 12 36
                                                   1 37 7 7 38 1 39 28 0 40 2 7
                                                   0 0 12 41 1 42 17 39 43 2 7
                                                   0 44 0 45 0 6 0 46 0 7 0 47
                                                   1 7 0 0 48 2 7 0 0 0 49 2 7
                                                   0 0 0 50 2 7 0 0 0 51 1 7 0
                                                   0 52 1 7 0 24 53 1 18 14 0
                                                   54 2 13 28 0 0 55 1 56 7 7
                                                   57 0 7 0 58 2 7 28 0 0 59 1
                                                   60 7 7 61 1 7 62 0 63 2 14
                                                   28 0 12 64 1 7 65 24 66 3 68
                                                   67 7 18 67 69 2 67 7 0 7 70
                                                   1 7 71 0 72 2 73 28 18 0 74
                                                   3 7 0 0 71 75 76 2 18 28 0
                                                   12 77 1 7 71 0 78 2 73 18 0
                                                   79 80 4 7 0 0 12 13 81 82 1
                                                   37 7 7 83 2 35 7 7 12 84 0 6
                                                   0 85 2 86 0 6 6 87 2 88 28 0
                                                   12 89 2 86 0 44 0 90 2 20 0
                                                   86 0 91 1 20 0 0 92 1 20 0
                                                   24 93 0 20 0 94 2 20 0 0 0
                                                   95 2 20 0 0 0 96 2 20 0 0 0
                                                   97 1 7 0 0 98 1 7 0 0 99 1
                                                   20 71 0 100 2 101 88 0 79
                                                   102 2 20 28 0 0 103 1 21 7
                                                   20 104 3 20 0 0 71 75 105 2
                                                   106 7 7 12 107 1 60 28 7 108
                                                   1 7 0 12 109 2 7 0 0 0 110 2
                                                   73 0 111 0 112 2 73 28 111 0
                                                   113 2 56 7 7 12 114 1 14 12
                                                   0 115 2 56 116 7 12 117 1
                                                   118 7 7 119 1 7 120 0 121 2
                                                   120 28 12 0 122 1 20 71 0
                                                   123 2 21 20 20 101 124 2 126
                                                   125 20 12 127 2 129 39 128
                                                   125 130 1 7 24 0 131 2 132
                                                   39 39 18 133 2 134 39 7 12
                                                   135 2 73 0 0 0 136 2 73 0 0
                                                   0 137 2 17 0 0 0 138 2 0 139
                                                   7 12 140)))))
           '|lookupComplete|)) 
