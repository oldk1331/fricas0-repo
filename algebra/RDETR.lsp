
(SDEFUN |RDETR;polyRDE;3UPIMU;1|
        ((|aa| UP) (|bb| UP) (|cc| UP) (|d| |Integer|)
         (|derivation| |Mapping| UP UP)
         ($ |Union|
          (|:| |ans| (|Record| (|:| |ans| UP) (|:| |nosol| (|Boolean|))))
          (|:| |eq|
               (|Record| (|:| |b| UP) (|:| |c| UP) (|:| |m| (|Integer|))
                         (|:| |alpha| UP) (|:| |beta| UP)))))
        (SPROG
         ((|uansw|
           (|Union|
            (|:| |ans| (|Record| (|:| |ans| UP) (|:| |nosol| (|Boolean|))))
            (|:| |eq|
                 (|Record| (|:| |b| UP) (|:| |c| UP) (|:| |m| (|Integer|))
                           (|:| |alpha| UP) (|:| |beta| UP)))))
          (|answ| (|Record| (|:| |ans| UP) (|:| |nosol| (|Boolean|))))
          (|b0?| (|Boolean|)) (|n| (|Integer|)) (|baseCase?| (|Boolean|))
          (|dt| (UP))
          (|u|
           (|Union|
            (|Record| (|:| |b| UP) (|:| |c| UP) (|:| |m| (|Integer|))
                      (|:| |alpha| UP) (|:| |beta| UP))
            "failed")))
         (SEQ
          (LETT |u| (|RDETR;SPDE| |aa| |bb| |cc| |d| |derivation| $)
                . #1=(|RDETR;polyRDE;3UPIMU;1|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 0 (CONS (|spadConstant| $ 9) 'T)))
                 ((SPADCALL (QVELT (QCDR |u|) 1) (QREFELT $ 11))
                  (CONS 0 (CONS (QVELT (QCDR |u|) 4) 'NIL)))
                 (#2='T
                  (SEQ
                   (LETT |baseCase?|
                         (SPADCALL
                          (LETT |dt|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 12) 1
                                           (QREFELT $ 15))
                                 |derivation|)
                                . #1#)
                          (|spadConstant| $ 13) (QREFELT $ 16))
                         . #1#)
                   (LETT |n| (- (SPADCALL |dt| (QREFELT $ 17)) 1) . #1#)
                   (LETT |b0?| (SPADCALL (QVELT (QCDR |u|) 0) (QREFELT $ 11))
                         . #1#)
                   (COND
                    ((NOT |b0?|)
                     (COND
                      ((OR |baseCase?|
                           (SPADCALL
                            (SPADCALL (QVELT (QCDR |u|) 0) (QREFELT $ 17))
                            (MAX 0 |n|) (QREFELT $ 23)))
                       (EXIT
                        (SEQ
                         (LETT |answ|
                               (|RDETR;SPDEnocancel1| (QVELT (QCDR |u|) 0)
                                (QVELT (QCDR |u|) 1) (QVELT (QCDR |u|) 2)
                                |derivation| $)
                               . #1#)
                         (EXIT
                          (CONS 0
                                (CONS
                                 (SPADCALL
                                  (SPADCALL (QVELT (QCDR |u|) 3) (QCAR |answ|)
                                            (QREFELT $ 18))
                                  (QVELT (QCDR |u|) 4) (QREFELT $ 19))
                                 (QCDR |answ|))))))))))
                   (COND
                    ((SPADCALL |n| 0 (QREFELT $ 23))
                     (COND
                      ((OR |b0?|
                           (< (SPADCALL (QVELT (QCDR |u|) 0) (QREFELT $ 17))
                              |n|))
                       (EXIT
                        (SEQ
                         (LETT |uansw|
                               (|RDETR;SPDEnocancel2| (QVELT (QCDR |u|) 0)
                                (QVELT (QCDR |u|) 1) (QVELT (QCDR |u|) 2) |n|
                                (SPADCALL |dt| (QREFELT $ 24)) |derivation| $)
                               . #1#)
                         (EXIT
                          (COND
                           ((QEQCAR |uansw| 0)
                            (CONS 0
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL (QVELT (QCDR |u|) 3)
                                              (QCAR (CDR |uansw|))
                                              (QREFELT $ 18))
                                    (QVELT (QCDR |u|) 4) (QREFELT $ 19))
                                   (QCDR (CDR |uansw|)))))
                           (#2#
                            (CONS 1
                                  (VECTOR (QVELT (CDR |uansw|) 0)
                                          (QVELT (CDR |uansw|) 1)
                                          (QVELT (CDR |uansw|) 2)
                                          (SPADCALL (QVELT (QCDR |u|) 3)
                                                    (QVELT (CDR |uansw|) 3)
                                                    (QREFELT $ 18))
                                          (SPADCALL
                                           (SPADCALL (QVELT (QCDR |u|) 3)
                                                     (QVELT (CDR |uansw|) 4)
                                                     (QREFELT $ 18))
                                           (QVELT (QCDR |u|) 4)
                                           (QREFELT $ 19)))))))))))))
                   (COND
                    (|b0?|
                     (COND
                      (|baseCase?|
                       (EXIT
                        (COND
                         ((>= (SPADCALL (QVELT (QCDR |u|) 1) (QREFELT $ 17))
                              (QVELT (QCDR |u|) 2))
                          (CONS 0 (CONS (|spadConstant| $ 9) 'T)))
                         (#2#
                          (CONS 0
                                (CONS
                                 (SPADCALL
                                  (SPADCALL (QVELT (QCDR |u|) 3)
                                            (SPADCALL (QVELT (QCDR |u|) 1)
                                                      (QREFELT $ 25))
                                            (QREFELT $ 18))
                                  (QVELT (QCDR |u|) 4) (QREFELT $ 19))
                                 'NIL)))))))))
                   (EXIT (CONS 1 (QCDR |u|)))))))))) 

(SDEFUN |RDETR;SPDE|
        ((|aa| UP) (|bb| UP) (|cc| UP) (|d| |Integer|)
         (|derivation| |Mapping| UP UP)
         ($ |Union|
          (|Record| (|:| |b| UP) (|:| |c| UP) (|:| |m| (|Integer|))
                    (|:| |alpha| UP) (|:| |beta| UP))
          #1="failed"))
        (SPROG
         ((|v|
           (|Union|
            (|Record| (|:| |b| UP) (|:| |c| UP) (|:| |m| (|Integer|))
                      (|:| |alpha| UP) (|:| |beta| UP))
            #1#))
          (|r| (UP)) (|qr| (|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (|bc| (|Record| (|:| |coef1| UP) (|:| |coef2| UP))) (#2=#:G157 NIL)
          (|a1| (F)) (|ra| (|Union| F "failed")) (#3=#:G149 NIL)
          (|u| (|Union| UP "failed")) (|g| (UP)))
         (SEQ
          (COND
           ((SPADCALL |cc| (QREFELT $ 11))
            (CONS 0
                  (VECTOR (|spadConstant| $ 9) (|spadConstant| $ 9) 0
                          (|spadConstant| $ 9) (|spadConstant| $ 9))))
           ((< |d| 0) (CONS 1 "failed"))
           (#4='T
            (SEQ
             (LETT |u|
                   (SPADCALL |cc|
                             (LETT |g| (SPADCALL |aa| |bb| (QREFELT $ 31))
                                   . #5=(|RDETR;SPDE|))
                             (QREFELT $ 33))
                   . #5#)
             (EXIT
              (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                    (#4#
                     (SEQ
                      (LETT |aa|
                            (PROG2
                                (LETT #3# (SPADCALL |aa| |g| (QREFELT $ 33))
                                      . #5#)
                                (QCDR #3#)
                              (|check_union| (QEQCAR #3# 0) (QREFELT $ 7) #3#))
                            . #5#)
                      (LETT |bb|
                            (PROG2
                                (LETT #3# (SPADCALL |bb| |g| (QREFELT $ 33))
                                      . #5#)
                                (QCDR #3#)
                              (|check_union| (QEQCAR #3# 0) (QREFELT $ 7) #3#))
                            . #5#)
                      (LETT |cc| (QCDR |u|) . #5#)
                      (LETT |ra| (SPADCALL |aa| (QREFELT $ 35)) . #5#)
                      (EXIT
                       (COND
                        ((QEQCAR |ra| 0)
                         (SEQ
                          (LETT |a1| (SPADCALL (QCDR |ra|) (QREFELT $ 36))
                                . #5#)
                          (EXIT
                           (CONS 0
                                 (VECTOR (SPADCALL |a1| |bb| (QREFELT $ 37))
                                         (SPADCALL |a1| |cc| (QREFELT $ 37))
                                         |d| (|spadConstant| $ 13)
                                         (|spadConstant| $ 9))))))
                        (#4#
                         (SEQ
                          (LETT |bc|
                                (PROG2
                                    (LETT #2#
                                          (SPADCALL |bb| |aa| |cc|
                                                    (QREFELT $ 40))
                                          . #5#)
                                    (QCDR #2#)
                                  (|check_union| (QEQCAR #2# 0)
                                                 (|Record|
                                                  (|:| |coef1| (QREFELT $ 7))
                                                  (|:| |coef2| (QREFELT $ 7)))
                                                 #2#))
                                . #5#)
                          (LETT |qr| (SPADCALL (QCAR |bc|) |aa| (QREFELT $ 42))
                                . #5#)
                          (LETT |r| (QCDR |qr|) . #5#)
                          (LETT |v|
                                (|RDETR;SPDE| |aa|
                                 (SPADCALL |bb| (SPADCALL |aa| |derivation|)
                                           (QREFELT $ 19))
                                 (SPADCALL
                                  (SPADCALL (QCDR |bc|)
                                            (SPADCALL |bb| (QCAR |qr|)
                                                      (QREFELT $ 18))
                                            (QREFELT $ 19))
                                  (SPADCALL |r| |derivation|) (QREFELT $ 43))
                                 (- |d| (SPADCALL |aa| (QREFELT $ 17)))
                                 |derivation| $)
                                . #5#)
                          (EXIT
                           (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                                 (#4#
                                  (CONS 0
                                        (VECTOR (QVELT (QCDR |v|) 0)
                                                (QVELT (QCDR |v|) 1)
                                                (QVELT (QCDR |v|) 2)
                                                (SPADCALL |aa|
                                                          (QVELT (QCDR |v|) 3)
                                                          (QREFELT $ 18))
                                                (SPADCALL
                                                 (SPADCALL |aa|
                                                           (QVELT (QCDR |v|) 4)
                                                           (QREFELT $ 18))
                                                 |r|
                                                 (QREFELT $
                                                          19))))))))))))))))))))) 

(SDEFUN |RDETR;SPDEnocancel1|
        ((|bb| UP) (|cc| UP) (|d| |Integer|) (|derivation| |Mapping| UP UP)
         ($ |Record| (|:| |ans| UP) (|:| |nosol| (|Boolean|))))
        (SPROG
         ((|q| (UP)) (|r| (UP)) (#1=#:G168 NIL) (#2=#:G169 NIL) (#3=#:G172 NIL)
          (|n| (|Integer|)) (|lb| (F)) (|db| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |q| (|spadConstant| $ 9) . #4=(|RDETR;SPDEnocancel1|))
                (LETT |db| (SPADCALL |bb| (QREFELT $ 17)) . #4#)
                (LETT |lb| (SPADCALL |bb| (QREFELT $ 24)) . #4#)
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |cc| (|spadConstant| $ 9) (QREFELT $ 44)))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ
                        (COND
                         ((< |d| 0)
                          (EXIT
                           (PROGN (LETT #3# (CONS |q| 'T) . #4#) (GO #3#))))
                         ('T
                          (SEQ
                           (LETT |n| (- (SPADCALL |cc| (QREFELT $ 17)) |db|)
                                 . #4#)
                           (EXIT
                            (COND
                             ((OR (< |n| 0) (SPADCALL |n| |d| (QREFELT $ 23)))
                              (PROGN
                               (LETT #2#
                                     (PROGN
                                      (LETT #3# (CONS |q| 'T) . #4#)
                                      (GO #3#))
                                     . #4#)
                               (GO #2#))))))))
                        (LETT |r|
                              (SPADCALL
                               (SPADCALL (SPADCALL |cc| (QREFELT $ 24)) |lb|
                                         (QREFELT $ 45))
                               (PROG1 (LETT #1# |n| . #4#)
                                 (|check_subtype| (>= #1# 0)
                                                  '(|NonNegativeInteger|) #1#))
                               (QREFELT $ 15))
                              . #4#)
                        (LETT |cc|
                              (SPADCALL
                               (SPADCALL |cc|
                                         (SPADCALL |bb| |r| (QREFELT $ 18))
                                         (QREFELT $ 43))
                               (SPADCALL |r| |derivation|) (QREFELT $ 43))
                              . #4#)
                        (LETT |d| (- |n| 1) . #4#)
                        (EXIT
                         (LETT |q| (SPADCALL |q| |r| (QREFELT $ 19)) . #4#))))
                      #2# (EXIT #2#))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (CONS |q| 'NIL))))
          #3# (EXIT #3#)))) 

(SDEFUN |RDETR;SPDEnocancel2|
        ((|bb| UP) (|cc| UP) (|d| |Integer|) (|dtm1| |Integer|) (|lt| F)
         (|derivation| |Mapping| UP UP)
         ($ |Union|
          (|:| |ans| (|Record| (|:| |ans| UP) (|:| |nosol| (|Boolean|))))
          (|:| |eq|
               (|Record| (|:| |b| UP) (|:| |c| UP) (|:| |m| (|Integer|))
                         (|:| |alpha| UP) (|:| |beta| UP)))))
        (SPROG
         ((|q| (UP)) (|r| (F)) (#1=#:G187 NIL) (|db| (|NonNegativeInteger|))
          (#2=#:G178 NIL) (#3=#:G184 NIL) (|n| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |q| (|spadConstant| $ 9) . #4=(|RDETR;SPDEnocancel2|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |cc| (|spadConstant| $ 9) (QREFELT $ 44)))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ
                        (COND
                         ((< |d| 0)
                          (EXIT
                           (PROGN
                            (LETT #1# (CONS 0 (CONS |q| 'T)) . #4#)
                            (GO #1#))))
                         ('T
                          (SEQ
                           (LETT |n| (- (SPADCALL |cc| (QREFELT $ 17)) |dtm1|)
                                 . #4#)
                           (EXIT
                            (COND
                             ((OR (< |n| 0) (SPADCALL |n| |d| (QREFELT $ 23)))
                              (PROGN
                               (LETT #3#
                                     (PROGN
                                      (LETT #1# (CONS 0 (CONS |q| 'T)) . #4#)
                                      (GO #1#))
                                     . #4#)
                               (GO #3#))))))))
                        (EXIT
                         (COND
                          ((SPADCALL |n| 0 (QREFELT $ 23))
                           (SEQ
                            (LETT |r|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |cc| (QREFELT $ 24))
                                             (SPADCALL |n| |lt| (QREFELT $ 46))
                                             (QREFELT $ 45))
                                   (PROG1 (LETT #2# |n| . #4#)
                                     (|check_subtype| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      #2#))
                                   (QREFELT $ 15))
                                  . #4#)
                            (LETT |cc|
                                  (SPADCALL
                                   (SPADCALL |cc|
                                             (SPADCALL |bb| |r| (QREFELT $ 18))
                                             (QREFELT $ 43))
                                   (SPADCALL |r| |derivation|) (QREFELT $ 43))
                                  . #4#)
                            (LETT |d| (- |n| 1) . #4#)
                            (EXIT
                             (LETT |q| (SPADCALL |q| |r| (QREFELT $ 19))
                                   . #4#))))
                          ('T
                           (SEQ
                            (LETT |db|
                                  (COND ((SPADCALL |bb| (QREFELT $ 11)) 0)
                                        ('T (SPADCALL |bb| (QREFELT $ 17))))
                                  . #4#)
                            (EXIT
                             (COND
                              ((SPADCALL |db| (SPADCALL |cc| (QREFELT $ 17))
                                         (QREFELT $ 47))
                               (PROGN
                                (LETT #1# (CONS 0 (CONS |q| 'T)) . #4#)
                                (GO #1#)))
                              ((ZEROP |db|)
                               (PROGN
                                (LETT #1#
                                      (CONS 1
                                            (VECTOR |bb| |cc| 0
                                                    (|spadConstant| $ 13) |q|))
                                      . #4#)
                                (GO #1#)))
                              ('T
                               (SEQ
                                (LETT |r|
                                      (SPADCALL (SPADCALL |cc| (QREFELT $ 24))
                                                (SPADCALL |bb| (QREFELT $ 24))
                                                (QREFELT $ 45))
                                      . #4#)
                                (LETT |cc|
                                      (SPADCALL
                                       (SPADCALL |cc|
                                                 (SPADCALL |r| |bb|
                                                           (QREFELT $ 37))
                                                 (QREFELT $ 43))
                                       (SPADCALL (SPADCALL |r| (QREFELT $ 48))
                                                 |derivation|)
                                       (QREFELT $ 43))
                                      . #4#)
                                (LETT |d| -1 . #4#)
                                (EXIT
                                 (LETT |q|
                                       (SPADCALL |q|
                                                 (SPADCALL |r| (QREFELT $ 48))
                                                 (QREFELT $ 19))
                                       . #4#))))))))))))
                      #3# (EXIT #3#))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (CONS |q| 'NIL)))))
          #1# (EXIT #1#)))) 

(SDEFUN |RDETR;monomRDE;2FMU;5|
        ((|f| |Fraction| UP) (|g| |Fraction| UP) (|derivation| |Mapping| UP UP)
         ($ |Union|
          (|Record| (|:| |a| UP) (|:| |b| (|Fraction| UP))
                    (|:| |c| (|Fraction| UP)) (|:| |t| UP))
          "failed"))
        (SPROG
         ((|u| (|Union| UP "failed")) (|aa| (UP)) (|tt| (UP)) (#1=#:G197 NIL)
          (|gg| (UP)) (|e| (UP)) (|d| (UP)))
         (SEQ
          (LETT |gg|
                (SPADCALL
                 (LETT |d| (SPADCALL |f| |derivation| (QREFELT $ 51))
                       . #2=(|RDETR;monomRDE;2FMU;5|))
                 (LETT |e| (SPADCALL |g| |derivation| (QREFELT $ 51)) . #2#)
                 (QREFELT $ 31))
                . #2#)
          (LETT |tt|
                (PROG2
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL |e| (SPADCALL |e| (QREFELT $ 52))
                                     (QREFELT $ 31))
                           (SPADCALL |gg| (SPADCALL |gg| (QREFELT $ 52))
                                     (QREFELT $ 31))
                           (QREFELT $ 33))
                          . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                . #2#)
          (LETT |u|
                (SPADCALL
                 (SPADCALL |tt|
                           (LETT |aa| (SPADCALL |d| |tt| (QREFELT $ 18)) . #2#)
                           (QREFELT $ 18))
                 |e| (QREFELT $ 33))
                . #2#)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (VECTOR |aa|
                                (SPADCALL (SPADCALL |aa| |f| (QREFELT $ 53))
                                          (SPADCALL
                                           (SPADCALL |d|
                                                     (SPADCALL |tt|
                                                               |derivation|)
                                                     (QREFELT $ 18))
                                           (QREFELT $ 54))
                                          (QREFELT $ 55))
                                (SPADCALL
                                 (SPADCALL (QCDR |u|) |e| (QREFELT $ 18)) |g|
                                 (QREFELT $ 53))
                                |tt|)))))))) 

(SDEFUN |RDETR;baseRDE;2FR;6|
        ((|f| |Fraction| UP) (|g| |Fraction| UP)
         ($ |Record| (|:| |ans| (|Fraction| UP)) (|:| |nosol| (|Boolean|))))
        (SPROG
         ((|v| (|Record| (|:| |ans| UP) (|:| |nosol| (|Boolean|))))
          (#1=#:G214 NIL) (|n| (|Integer|)) (|cc| (UP)) (|bb| (UP))
          (|u|
           (|Union|
            (|Record| (|:| |a| UP) (|:| |b| (|Fraction| UP))
                      (|:| |c| (|Fraction| UP)) (|:| |t| UP))
            "failed")))
         (SEQ
          (LETT |u| (SPADCALL |f| |g| (ELT $ 52) (QREFELT $ 58))
                . #2=(|RDETR;baseRDE;2FR;6|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS (|spadConstant| $ 59) 'T))
                 ('T
                  (SEQ
                   (LETT |n|
                         (|RDETR;getBound| (QVELT (QCDR |u|) 0)
                          (LETT |bb|
                                (SPADCALL (QVELT (QCDR |u|) 1) (QREFELT $ 60))
                                . #2#)
                          (SPADCALL
                           (LETT |cc|
                                 (SPADCALL (QVELT (QCDR |u|) 2) (QREFELT $ 60))
                                 . #2#)
                           (QREFELT $ 17))
                          $)
                         . #2#)
                   (LETT |v|
                         (PROG2
                             (LETT #1#
                                   (SPADCALL (QVELT (QCDR |u|) 0) |bb| |cc| |n|
                                             (ELT $ 52) (QREFELT $ 30))
                                   . #2#)
                             (QCDR #1#)
                           (|check_union| (QEQCAR #1# 0)
                                          (|Record| (|:| |ans| (QREFELT $ 7))
                                                    (|:| |nosol| (|Boolean|)))
                                          #1#))
                         . #2#)
                   (EXIT
                    (CONS
                     (SPADCALL (QCAR |v|) (QVELT (QCDR |u|) 3) (QREFELT $ 61))
                     (QCDR |v|)))))))))) 

(SDEFUN |RDETR;getBound| ((|a| UP) (|b| UP) (|dc| |Integer|) ($ |Integer|))
        (SPROG
         ((|n| (|Union| (|Integer|) "failed")) (|db| (|Integer|))
          (|da| (|Integer|)))
         (SEQ (LETT |da| (SPADCALL |a| (QREFELT $ 17)) . #1=(|RDETR;getBound|))
              (EXIT
               (COND
                ((SPADCALL |b| (QREFELT $ 11)) (MAX 0 (+ (- |dc| |da|) 1)))
                (#2='T
                 (SEQ (LETT |db| (SPADCALL |b| (QREFELT $ 17)) . #1#)
                      (EXIT
                       (COND
                        ((SPADCALL |da| (+ |db| 1) (QREFELT $ 23))
                         (MAX 0 (+ (- |dc| |da|) 1)))
                        ((< |da| (+ |db| 1)) (- |dc| |db|))
                        (#2#
                         (SEQ
                          (LETT |n|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |b| (QREFELT $ 24))
                                            (SPADCALL |a| (QREFELT $ 24))
                                            (QREFELT $ 45))
                                  (QREFELT $ 64))
                                 (QREFELT $ 66))
                                . #1#)
                          (EXIT
                           (COND
                            ((QEQCAR |n| 0) (MAX (QCDR |n|) (- |dc| |db|)))
                            (#2# (- |dc| |db|))))))))))))))) 

(DECLAIM (NOTINLINE |TranscendentalRischDE;|)) 

(DEFUN |TranscendentalRischDE| (&REST #1=#:G229)
  (SPROG NIL
         (PROG (#2=#:G230)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|TranscendentalRischDE|)
                                               '|domainEqualList|)
                    . #3=(|TranscendentalRischDE|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |TranscendentalRischDE;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|TranscendentalRischDE|)))))))))) 

(DEFUN |TranscendentalRischDE;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|TranscendentalRischDE|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|TranscendentalRischDE| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 67) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TranscendentalRischDE|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|TranscendentalRischDE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (4 . |Zero|) (|Boolean|) (8 . |zero?|) (13 . |One|)
              (17 . |One|) (|NonNegativeInteger|) (21 . |monomial|) (27 . =)
              (33 . |degree|) (38 . *) (44 . +) (|Fraction| 22) (50 . |Zero|)
              (|Integer|) (54 . >) (60 . |leadingCoefficient|)
              (65 . |integrate|) (|Record| (|:| |ans| 7) (|:| |nosol| 10))
              (|Record| (|:| |b| 7) (|:| |c| 7) (|:| |m| 22) (|:| |alpha| 7)
                        (|:| |beta| 7))
              (|Union| (|:| |ans| 26) (|:| |eq| 27)) (|Mapping| 7 7)
              |RDETR;polyRDE;3UPIMU;1| (70 . |gcd|) (|Union| $ '"failed")
              (76 . |exquo|) (|Union| 6 '#1="failed") (82 . |retractIfCan|)
              (87 . |inv|) (92 . *) (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 38 '"failed") (98 . |extendedEuclidean|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (105 . |divide|) (111 . -) (117 . ~=) (123 . /) (129 . *)
              (135 . ~=) (141 . |coerce|) (|Fraction| 7)
              (|MonomialExtensionTools| 6 7) (146 . |normalDenom|)
              (152 . |differentiate|) (157 . *) (163 . |coerce|) (168 . -)
              (|Record| (|:| |a| 7) (|:| |b| 49) (|:| |c| 49) (|:| |t| 7))
              (|Union| 56 '"failed") |RDETR;monomRDE;2FMU;5| (174 . |Zero|)
              (178 . |retract|) (183 . /)
              (|Record| (|:| |ans| 49) (|:| |nosol| 10)) |RDETR;baseRDE;2FR;6|
              (189 . -) (|Union| 22 '#1#) (194 . |retractIfCan|))
           '#(|polyRDE| 199 |monomRDE| 208 |baseRDE| 215) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 66
                                                 '(0 6 0 8 0 7 0 9 1 7 10 0 11
                                                   0 6 0 12 0 7 0 13 2 7 0 6 14
                                                   15 2 7 10 0 0 16 1 7 14 0 17
                                                   2 7 0 0 0 18 2 7 0 0 0 19 0
                                                   20 0 21 2 22 10 0 0 23 1 7 6
                                                   0 24 1 7 0 0 25 2 7 0 0 0 31
                                                   2 7 32 0 0 33 1 7 34 0 35 1
                                                   6 0 0 36 2 7 0 6 0 37 3 7 39
                                                   0 0 0 40 2 7 41 0 0 42 2 7 0
                                                   0 0 43 2 7 10 0 0 44 2 6 0 0
                                                   0 45 2 6 0 22 0 46 2 14 10 0
                                                   0 47 1 7 0 6 48 2 50 7 49 29
                                                   51 1 7 0 0 52 2 49 0 7 0 53
                                                   1 49 0 7 54 2 49 0 0 0 55 0
                                                   49 0 59 1 49 7 0 60 2 49 0 7
                                                   7 61 1 6 0 0 64 1 6 65 0 66
                                                   5 0 28 7 7 7 22 29 30 3 0 57
                                                   49 49 29 58 2 0 62 49 49
                                                   63)))))
           '|lookupComplete|)) 
