
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
                            (MAX 0 |n|) (QREFELT $ 26)))
                       (EXIT
                        (SEQ
                         (LETT |answ|
                               (SPADCALL (QVELT (QCDR |u|) 0)
                                         (QVELT (QCDR |u|) 1)
                                         (QVELT (QCDR |u|) 2) |derivation|
                                         (QREFELT $ 21))
                               . #1#)
                         (EXIT
                          (CONS 0
                                (CONS
                                 (SPADCALL
                                  (SPADCALL (QVELT (QCDR |u|) 3) (QCAR |answ|)
                                            (QREFELT $ 22))
                                  (QVELT (QCDR |u|) 4) (QREFELT $ 23))
                                 (QCDR |answ|))))))))))
                   (COND
                    ((SPADCALL |n| 0 (QREFELT $ 26))
                     (COND
                      ((OR |b0?|
                           (< (SPADCALL (QVELT (QCDR |u|) 0) (QREFELT $ 17))
                              |n|))
                       (EXIT
                        (SEQ
                         (LETT |uansw|
                               (|RDETR;SPDEnocancel2| (QVELT (QCDR |u|) 0)
                                (QVELT (QCDR |u|) 1) (QVELT (QCDR |u|) 2) |n|
                                (SPADCALL |dt| (QREFELT $ 27)) |derivation| $)
                               . #1#)
                         (EXIT
                          (COND
                           ((QEQCAR |uansw| 0)
                            (CONS 0
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL (QVELT (QCDR |u|) 3)
                                              (QCAR (CDR |uansw|))
                                              (QREFELT $ 22))
                                    (QVELT (QCDR |u|) 4) (QREFELT $ 23))
                                   (QCDR (CDR |uansw|)))))
                           (#2#
                            (CONS 1
                                  (VECTOR (QVELT (CDR |uansw|) 0)
                                          (QVELT (CDR |uansw|) 1)
                                          (QVELT (CDR |uansw|) 2)
                                          (SPADCALL (QVELT (QCDR |u|) 3)
                                                    (QVELT (CDR |uansw|) 3)
                                                    (QREFELT $ 22))
                                          (SPADCALL
                                           (SPADCALL (QVELT (QCDR |u|) 3)
                                                     (QVELT (CDR |uansw|) 4)
                                                     (QREFELT $ 22))
                                           (QVELT (QCDR |u|) 4)
                                           (QREFELT $ 23)))))))))))))
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
                                                      (QREFELT $ 28))
                                            (QREFELT $ 22))
                                  (QVELT (QCDR |u|) 4) (QREFELT $ 23))
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
          (|bc| (|Record| (|:| |coef1| UP) (|:| |coef2| UP))) (#2=#:G156 NIL)
          (|a1| (F)) (|ra| (|Union| F "failed")) (#3=#:G148 NIL)
          (|u| (|Union| UP #4="failed")) (|g| (UP)))
         (SEQ
          (COND
           ((SPADCALL |cc| (QREFELT $ 11))
            (CONS 0
                  (VECTOR (|spadConstant| $ 9) (|spadConstant| $ 9) 0
                          (|spadConstant| $ 9) (|spadConstant| $ 9))))
           ((< |d| 0) (CONS 1 "failed"))
           (#5='T
            (SEQ
             (LETT |u|
                   (SPADCALL |cc|
                             (LETT |g| (SPADCALL |aa| |bb| (QREFELT $ 32))
                                   . #6=(|RDETR;SPDE|))
                             (QREFELT $ 34))
                   . #6#)
             (EXIT
              (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                    (#5#
                     (SEQ
                      (LETT |aa|
                            (PROG2
                                (LETT #3# (SPADCALL |aa| |g| (QREFELT $ 34))
                                      . #6#)
                                (QCDR #3#)
                              (|check_union2| (QEQCAR #3# 0) (QREFELT $ 7)
                                              (|Union| (QREFELT $ 7) #4#) #3#))
                            . #6#)
                      (LETT |bb|
                            (PROG2
                                (LETT #3# (SPADCALL |bb| |g| (QREFELT $ 34))
                                      . #6#)
                                (QCDR #3#)
                              (|check_union2| (QEQCAR #3# 0) (QREFELT $ 7)
                                              (|Union| (QREFELT $ 7) #4#) #3#))
                            . #6#)
                      (LETT |cc| (QCDR |u|) . #6#)
                      (LETT |ra| (SPADCALL |aa| (QREFELT $ 36)) . #6#)
                      (EXIT
                       (COND
                        ((QEQCAR |ra| 0)
                         (SEQ
                          (LETT |a1| (SPADCALL (QCDR |ra|) (QREFELT $ 37))
                                . #6#)
                          (EXIT
                           (CONS 0
                                 (VECTOR (SPADCALL |a1| |bb| (QREFELT $ 38))
                                         (SPADCALL |a1| |cc| (QREFELT $ 38))
                                         |d| (|spadConstant| $ 13)
                                         (|spadConstant| $ 9))))))
                        (#5#
                         (SEQ
                          (LETT |bc|
                                (PROG2
                                    (LETT #2#
                                          (SPADCALL |bb| |aa| |cc|
                                                    (QREFELT $ 41))
                                          . #6#)
                                    (QCDR #2#)
                                  (|check_union2| (QEQCAR #2# 0)
                                                  (|Record|
                                                   (|:| |coef1| (QREFELT $ 7))
                                                   (|:| |coef2| (QREFELT $ 7)))
                                                  (|Union|
                                                   (|Record|
                                                    (|:| |coef1| (QREFELT $ 7))
                                                    (|:| |coef2|
                                                         (QREFELT $ 7)))
                                                   "failed")
                                                  #2#))
                                . #6#)
                          (LETT |qr| (SPADCALL (QCAR |bc|) |aa| (QREFELT $ 43))
                                . #6#)
                          (LETT |r| (QCDR |qr|) . #6#)
                          (LETT |v|
                                (|RDETR;SPDE| |aa|
                                 (SPADCALL |bb| (SPADCALL |aa| |derivation|)
                                           (QREFELT $ 23))
                                 (SPADCALL
                                  (SPADCALL (QCDR |bc|)
                                            (SPADCALL |bb| (QCAR |qr|)
                                                      (QREFELT $ 22))
                                            (QREFELT $ 23))
                                  (SPADCALL |r| |derivation|) (QREFELT $ 44))
                                 (- |d| (SPADCALL |aa| (QREFELT $ 17)))
                                 |derivation| $)
                                . #6#)
                          (EXIT
                           (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                                 (#5#
                                  (CONS 0
                                        (VECTOR (QVELT (QCDR |v|) 0)
                                                (QVELT (QCDR |v|) 1)
                                                (QVELT (QCDR |v|) 2)
                                                (SPADCALL |aa|
                                                          (QVELT (QCDR |v|) 3)
                                                          (QREFELT $ 22))
                                                (SPADCALL
                                                 (SPADCALL |aa|
                                                           (QVELT (QCDR |v|) 4)
                                                           (QREFELT $ 22))
                                                 |r|
                                                 (QREFELT $
                                                          23))))))))))))))))))))) 

(SDEFUN |RDETR;SPDEnocancel1;2UPIMR;3|
        ((|bb| UP) (|cc| UP) (|d| |Integer|) (|derivation| |Mapping| UP UP)
         ($ |Record| (|:| |ans| UP) (|:| |nosol| (|Boolean|))))
        (SPROG
         ((|q| (UP)) (|r| (UP)) (#1=#:G167 NIL) (#2=#:G172 NIL) (#3=#:G173 NIL)
          (|n| (|Integer|)) (|lb| (F)) (|db| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |q| (|spadConstant| $ 9)
                  . #4=(|RDETR;SPDEnocancel1;2UPIMR;3|))
            (LETT |db| (SPADCALL |bb| (QREFELT $ 17)) . #4#)
            (LETT |lb| (SPADCALL |bb| (QREFELT $ 27)) . #4#)
            (SEQ G190
                 (COND
                  ((NULL (SPADCALL |cc| (|spadConstant| $ 9) (QREFELT $ 45)))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ
                    (COND
                     ((< |d| 0)
                      (EXIT
                       (PROGN (LETT #3# (CONS |q| 'T) . #4#) (GO #5=#:G171))))
                     ('T
                      (SEQ
                       (LETT |n| (- (SPADCALL |cc| (QREFELT $ 17)) |db|) . #4#)
                       (EXIT
                        (COND
                         ((OR (< |n| 0) (SPADCALL |n| |d| (QREFELT $ 26)))
                          (PROGN
                           (LETT #2#
                                 (PROGN
                                  (LETT #3# (CONS |q| 'T) . #4#)
                                  (GO #5#))
                                 . #4#)
                           (GO #6=#:G168))))))))
                    (LETT |r|
                          (SPADCALL
                           (SPADCALL (SPADCALL |cc| (QREFELT $ 27)) |lb|
                                     (QREFELT $ 46))
                           (PROG1 (LETT #1# |n| . #4#)
                             (|check_subtype2| (>= #1# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT $ 15))
                          . #4#)
                    (LETT |cc|
                          (SPADCALL
                           (SPADCALL |cc| (SPADCALL |bb| |r| (QREFELT $ 22))
                                     (QREFELT $ 44))
                           (SPADCALL |r| |derivation|) (QREFELT $ 44))
                          . #4#)
                    (LETT |d| (- |n| 1) . #4#)
                    (EXIT (LETT |q| (SPADCALL |q| |r| (QREFELT $ 23)) . #4#))))
                  #6# (EXIT #2#))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS |q| 'NIL))))
          #5# (EXIT #3#)))) 

(SDEFUN |RDETR;SPDEnocancel2|
        ((|bb| UP) (|cc| UP) (|d| |Integer|) (|dtm1| |Integer|) (|lt| F)
         (|derivation| |Mapping| UP UP)
         ($ |Union|
          (|:| |ans| (|Record| (|:| |ans| UP) (|:| |nosol| (|Boolean|))))
          (|:| |eq|
               (|Record| (|:| |b| UP) (|:| |c| UP) (|:| |m| (|Integer|))
                         (|:| |alpha| UP) (|:| |beta| UP)))))
        (SPROG
         ((|q| (UP)) (|r| (F)) (#1=#:G190 NIL) (|db| (|NonNegativeInteger|))
          (#2=#:G179 NIL) (#3=#:G189 NIL) (|n| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |q| (|spadConstant| $ 9) . #4=(|RDETR;SPDEnocancel2|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |cc| (|spadConstant| $ 9) (QREFELT $ 45)))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ
                        (COND
                         ((< |d| 0)
                          (EXIT
                           (PROGN
                            (LETT #1# (CONS 0 (CONS |q| 'T)) . #4#)
                            (GO #5=#:G188))))
                         ('T
                          (SEQ
                           (LETT |n| (- (SPADCALL |cc| (QREFELT $ 17)) |dtm1|)
                                 . #4#)
                           (EXIT
                            (COND
                             ((OR (< |n| 0) (SPADCALL |n| |d| (QREFELT $ 26)))
                              (PROGN
                               (LETT #3#
                                     (PROGN
                                      (LETT #1# (CONS 0 (CONS |q| 'T)) . #4#)
                                      (GO #5#))
                                     . #4#)
                               (GO #6=#:G185))))))))
                        (EXIT
                         (COND
                          ((SPADCALL |n| 0 (QREFELT $ 26))
                           (SEQ
                            (LETT |r|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |cc| (QREFELT $ 27))
                                             (SPADCALL |n| |lt| (QREFELT $ 47))
                                             (QREFELT $ 46))
                                   (PROG1 (LETT #2# |n| . #4#)
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                   (QREFELT $ 15))
                                  . #4#)
                            (LETT |cc|
                                  (SPADCALL
                                   (SPADCALL |cc|
                                             (SPADCALL |bb| |r| (QREFELT $ 22))
                                             (QREFELT $ 44))
                                   (SPADCALL |r| |derivation|) (QREFELT $ 44))
                                  . #4#)
                            (LETT |d| (- |n| 1) . #4#)
                            (EXIT
                             (LETT |q| (SPADCALL |q| |r| (QREFELT $ 23))
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
                                         (QREFELT $ 48))
                               (PROGN
                                (LETT #1# (CONS 0 (CONS |q| 'T)) . #4#)
                                (GO #5#)))
                              ((ZEROP |db|)
                               (PROGN
                                (LETT #1#
                                      (CONS 1
                                            (VECTOR |bb| |cc| 0
                                                    (|spadConstant| $ 13) |q|))
                                      . #4#)
                                (GO #5#)))
                              ('T
                               (SEQ
                                (LETT |r|
                                      (SPADCALL (SPADCALL |cc| (QREFELT $ 27))
                                                (SPADCALL |bb| (QREFELT $ 27))
                                                (QREFELT $ 46))
                                      . #4#)
                                (LETT |cc|
                                      (SPADCALL
                                       (SPADCALL |cc|
                                                 (SPADCALL |r| |bb|
                                                           (QREFELT $ 38))
                                                 (QREFELT $ 44))
                                       (SPADCALL (SPADCALL |r| (QREFELT $ 49))
                                                 |derivation|)
                                       (QREFELT $ 44))
                                      . #4#)
                                (LETT |d| -1 . #4#)
                                (EXIT
                                 (LETT |q|
                                       (SPADCALL |q|
                                                 (SPADCALL |r| (QREFELT $ 49))
                                                 (QREFELT $ 23))
                                       . #4#))))))))))))
                      #6# (EXIT #3#))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (CONS |q| 'NIL)))))
          #5# (EXIT #1#)))) 

(SDEFUN |RDETR;monomRDE;2FMU;5|
        ((|f| |Fraction| UP) (|g| |Fraction| UP) (|derivation| |Mapping| UP UP)
         ($ |Union|
          (|Record| (|:| |a| UP) (|:| |b| (|Fraction| UP))
                    (|:| |c| (|Fraction| UP)) (|:| |t| UP))
          "failed"))
        (SPROG
         ((|u| (|Union| UP #1="failed")) (|aa| (UP)) (|tt| (UP))
          (#2=#:G200 NIL) (|gg| (UP)) (|e| (UP)) (|d| (UP)))
         (SEQ
          (LETT |gg|
                (SPADCALL
                 (LETT |d| (SPADCALL |f| |derivation| (QREFELT $ 52))
                       . #3=(|RDETR;monomRDE;2FMU;5|))
                 (LETT |e| (SPADCALL |g| |derivation| (QREFELT $ 52)) . #3#)
                 (QREFELT $ 32))
                . #3#)
          (LETT |tt|
                (PROG2
                    (LETT #2#
                          (SPADCALL
                           (SPADCALL |e| (SPADCALL |e| (QREFELT $ 53))
                                     (QREFELT $ 32))
                           (SPADCALL |gg| (SPADCALL |gg| (QREFELT $ 53))
                                     (QREFELT $ 32))
                           (QREFELT $ 34))
                          . #3#)
                    (QCDR #2#)
                  (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                  (|Union| (QREFELT $ 7) #1#) #2#))
                . #3#)
          (LETT |u|
                (SPADCALL
                 (SPADCALL |tt|
                           (LETT |aa| (SPADCALL |d| |tt| (QREFELT $ 22)) . #3#)
                           (QREFELT $ 22))
                 |e| (QREFELT $ 34))
                . #3#)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (VECTOR |aa|
                                (SPADCALL (SPADCALL |aa| |f| (QREFELT $ 54))
                                          (SPADCALL
                                           (SPADCALL |d|
                                                     (SPADCALL |tt|
                                                               |derivation|)
                                                     (QREFELT $ 22))
                                           (QREFELT $ 55))
                                          (QREFELT $ 56))
                                (SPADCALL
                                 (SPADCALL (QCDR |u|) |e| (QREFELT $ 22)) |g|
                                 (QREFELT $ 54))
                                |tt|)))))))) 

(SDEFUN |RDETR;baseRDE;2FR;6|
        ((|f| |Fraction| UP) (|g| |Fraction| UP)
         ($ |Record| (|:| |ans| (|Fraction| UP)) (|:| |nosol| (|Boolean|))))
        (SPROG
         ((|v| (|Record| (|:| |ans| UP) (|:| |nosol| (|Boolean|))))
          (#1=#:G217 NIL) (|n| (|Integer|)) (|cc| (UP)) (|bb| (UP))
          (|u|
           (|Union|
            (|Record| (|:| |a| UP) (|:| |b| (|Fraction| UP))
                      (|:| |c| (|Fraction| UP)) (|:| |t| UP))
            "failed")))
         (SEQ
          (LETT |u| (SPADCALL |f| |g| (ELT $ 53) (QREFELT $ 59))
                . #2=(|RDETR;baseRDE;2FR;6|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS (|spadConstant| $ 60) 'T))
                 ('T
                  (SEQ
                   (LETT |n|
                         (|RDETR;getBound| (QVELT (QCDR |u|) 0)
                          (LETT |bb|
                                (SPADCALL (QVELT (QCDR |u|) 1) (QREFELT $ 61))
                                . #2#)
                          (SPADCALL
                           (LETT |cc|
                                 (SPADCALL (QVELT (QCDR |u|) 2) (QREFELT $ 61))
                                 . #2#)
                           (QREFELT $ 17))
                          $)
                         . #2#)
                   (LETT |v|
                         (PROG2
                             (LETT #1#
                                   (SPADCALL (QVELT (QCDR |u|) 0) |bb| |cc| |n|
                                             (ELT $ 53) (QREFELT $ 31))
                                   . #2#)
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0)
                                           (|Record| (|:| |ans| (QREFELT $ 7))
                                                     (|:| |nosol| (|Boolean|)))
                                           (|Union|
                                            (|:| |ans|
                                                 (|Record|
                                                  (|:| |ans| (QREFELT $ 7))
                                                  (|:| |nosol| (|Boolean|))))
                                            (|:| |eq|
                                                 (|Record|
                                                  (|:| |b| (QREFELT $ 7))
                                                  (|:| |c| (QREFELT $ 7))
                                                  (|:| |m| (|Integer|))
                                                  (|:| |alpha| (QREFELT $ 7))
                                                  (|:| |beta| (QREFELT $ 7)))))
                                           #1#))
                         . #2#)
                   (EXIT
                    (CONS
                     (SPADCALL (QCAR |v|) (QVELT (QCDR |u|) 3) (QREFELT $ 62))
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
                        ((SPADCALL |da| (+ |db| 1) (QREFELT $ 26))
                         (MAX 0 (+ (- |dc| |da|) 1)))
                        ((< |da| (+ |db| 1)) (- |dc| |db|))
                        (#2#
                         (SEQ
                          (LETT |n|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |b| (QREFELT $ 27))
                                            (SPADCALL |a| (QREFELT $ 27))
                                            (QREFELT $ 46))
                                  (QREFELT $ 65))
                                 (QREFELT $ 67))
                                . #1#)
                          (EXIT
                           (COND
                            ((QEQCAR |n| 0) (MAX (QCDR |n|) (- |dc| |db|)))
                            (#2# (- |dc| |db|))))))))))))))) 

(DECLAIM (NOTINLINE |TranscendentalRischDE;|)) 

(DEFUN |TranscendentalRischDE| (&REST #1=#:G232)
  (SPROG NIL
         (PROG (#2=#:G233)
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
          (LETT $ (GETREFV 68) . #1#)
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
              (33 . |degree|) (|Record| (|:| |ans| 7) (|:| |nosol| 10))
              (|Integer|) (|Mapping| 7 7) |RDETR;SPDEnocancel1;2UPIMR;3|
              (38 . *) (44 . +) (|Fraction| 19) (50 . |Zero|) (54 . >)
              (60 . |leadingCoefficient|) (65 . |integrate|)
              (|Record| (|:| |b| 7) (|:| |c| 7) (|:| |m| 19) (|:| |alpha| 7)
                        (|:| |beta| 7))
              (|Union| (|:| |ans| 18) (|:| |eq| 29)) |RDETR;polyRDE;3UPIMU;1|
              (70 . |gcd|) (|Union| $ '"failed") (76 . |exquo|)
              (|Union| 6 '#1="failed") (82 . |retractIfCan|) (87 . |inv|)
              (92 . *) (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 39 '"failed") (98 . |extendedEuclidean|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (105 . |divide|) (111 . -) (117 . ~=) (123 . /) (129 . *)
              (135 . ~=) (141 . |coerce|) (|Fraction| 7)
              (|MonomialExtensionTools| 6 7) (146 . |normalDenom|)
              (152 . |differentiate|) (157 . *) (163 . |coerce|) (168 . -)
              (|Record| (|:| |a| 7) (|:| |b| 50) (|:| |c| 50) (|:| |t| 7))
              (|Union| 57 '"failed") |RDETR;monomRDE;2FMU;5| (174 . |Zero|)
              (178 . |retract|) (183 . /)
              (|Record| (|:| |ans| 50) (|:| |nosol| 10)) |RDETR;baseRDE;2FR;6|
              (189 . -) (|Union| 19 '#1#) (194 . |retractIfCan|))
           '#(|polyRDE| 199 |monomRDE| 208 |baseRDE| 215 |SPDEnocancel1| 221)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 67
                                                 '(0 6 0 8 0 7 0 9 1 7 10 0 11
                                                   0 6 0 12 0 7 0 13 2 7 0 6 14
                                                   15 2 7 10 0 0 16 1 7 14 0 17
                                                   2 7 0 0 0 22 2 7 0 0 0 23 0
                                                   24 0 25 2 19 10 0 0 26 1 7 6
                                                   0 27 1 7 0 0 28 2 7 0 0 0 32
                                                   2 7 33 0 0 34 1 7 35 0 36 1
                                                   6 0 0 37 2 7 0 6 0 38 3 7 40
                                                   0 0 0 41 2 7 42 0 0 43 2 7 0
                                                   0 0 44 2 7 10 0 0 45 2 6 0 0
                                                   0 46 2 6 0 19 0 47 2 14 10 0
                                                   0 48 1 7 0 6 49 2 51 7 50 20
                                                   52 1 7 0 0 53 2 50 0 7 0 54
                                                   1 50 0 7 55 2 50 0 0 0 56 0
                                                   50 0 60 1 50 7 0 61 2 50 0 7
                                                   7 62 1 6 0 0 65 1 6 66 0 67
                                                   5 0 30 7 7 7 19 20 31 3 0 58
                                                   50 50 20 59 2 0 63 50 50 64
                                                   4 0 18 7 7 19 20 21)))))
           '|lookupComplete|)) 
