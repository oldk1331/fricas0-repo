
(SDEFUN |SHP;subresultantSequenceBegin|
        ((|p1| . #1=(|UnivariatePolynomial| |x| R)) (|p2| . #1#)
         ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|LSubr| (|List| (|UnivariatePolynomial| |x| R))) (#2=#:G120 NIL)
          (|lc2| (R)) (|lc1| (R)) (|Pr| (|UnivariatePolynomial| |x| R))
          (|n| (|NonNegativeInteger|)) (#3=#:G119 NIL))
         (SEQ
          (LETT |n|
                (PROG1
                    (LETT #3#
                          (-
                           (- (SPADCALL |p1| (QREFELT $ 10))
                              (SPADCALL |p2| (QREFELT $ 10)))
                           1)
                          . #4=(|SHP;subresultantSequenceBegin|))
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#))
                . #4#)
          (LETT |Pr| (SPADCALL |p1| |p2| (QREFELT $ 12)) . #4#)
          (EXIT
           (COND ((EQL |n| 0) (LIST |p1| |p2| |Pr|))
                 (#5='T
                  (SEQ (LETT |lc1| (SPADCALL |p1| (QREFELT $ 15)) . #4#)
                       (LETT |lc2| (SPADCALL |p2| (QREFELT $ 15)) . #4#)
                       (EXIT
                        (COND
                         ((EQL |n| 1)
                          (LIST |p1| |p2|
                                (SPADCALL (SPADCALL |lc1| |lc2| (QREFELT $ 17))
                                          |p2| (QREFELT $ 18))
                                (SPADCALL (SPADCALL |lc1| |Pr| (QREFELT $ 18))
                                          (QREFELT $ 19))))
                         (#5#
                          (SEQ
                           (LETT |LSubr|
                                 (APPEND (LIST |p1| |p2|)
                                         (SPADCALL
                                          (PROG1 (LETT #2# (- |n| 1) . #4#)
                                            (|check_subtype2| (>= #2# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #2#))
                                          (|spadConstant| $ 14)
                                          (QREFELT $ 21)))
                                 . #4#)
                           (EXIT
                            (APPEND |LSubr|
                                    (LIST
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |lc1| |lc2| (QREFELT $ 17))
                                       |n| (QREFELT $ 22))
                                      |p2| (QREFELT $ 18))
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |lc1| (QREFELT $ 23))
                                                |n| (QREFELT $ 22))
                                      |Pr| (QREFELT $ 18)))))))))))))))) 

(SDEFUN |SHP;subresultantSequenceNext|
        ((|LcsI| |List| (|UnivariatePolynomial| |x| R))
         ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|LSub| (|List| (|UnivariatePolynomial| |x| R))) (#1=#:G129 NIL)
          (|pr2| (|UnivariatePolynomial| |x| R)) (#2=#:G127 NIL)
          (|pr1| (|UnivariatePolynomial| |x| R))
          (|Pr| (|UnivariatePolynomial| |x| R)) (|c1| (R))
          (|n| (|NonNegativeInteger|)) (#3=#:G125 NIL)
          (|p1| (|UnivariatePolynomial| |x| R))
          (|p2| (|UnivariatePolynomial| |x| R)))
         (SEQ
          (LETT |p2| (SPADCALL |LcsI| (QREFELT $ 24))
                . #4=(|SHP;subresultantSequenceNext|))
          (LETT |p1| (SPADCALL (REVERSE |LcsI|) (QREFELT $ 25)) . #4#)
          (LETT |n|
                (PROG1
                    (LETT #3#
                          (-
                           (- (SPADCALL |p1| (QREFELT $ 10))
                              (SPADCALL |p2| (QREFELT $ 10)))
                           1)
                          . #4#)
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#))
                . #4#)
          (LETT |c1| (SPADCALL |p1| (QREFELT $ 15)) . #4#)
          (LETT |Pr| (SPADCALL |p1| |p2| (QREFELT $ 12)) . #4#)
          (EXIT
           (COND
            ((EQL |n| 0)
             (APPEND |LcsI|
                     (LIST
                      (PROG2
                          (LETT #2#
                                (SPADCALL |Pr| (SPADCALL |c1| 2 (QREFELT $ 27))
                                          (QREFELT $ 29))
                                . #4#)
                          (QCDR #2#)
                        (|check_union2| (QEQCAR #2# 0)
                                        (|UnivariatePolynomial| (QREFELT $ 7)
                                                                (QREFELT $ 6))
                                        (|Union|
                                         (|UnivariatePolynomial| (QREFELT $ 7)
                                                                 (QREFELT $ 6))
                                         #5="failed")
                                        #2#)))))
            ('T
             (SEQ
              (LETT |pr1|
                    (PROG2
                        (LETT #2#
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |p2| (QREFELT $ 15)) |n|
                                          (QREFELT $ 22))
                                |p2| (QREFELT $ 18))
                               (SPADCALL |c1| |n| (QREFELT $ 22))
                               (QREFELT $ 29))
                              . #4#)
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0)
                                      (|UnivariatePolynomial| (QREFELT $ 7)
                                                              (QREFELT $ 6))
                                      (|Union|
                                       (|UnivariatePolynomial| (QREFELT $ 7)
                                                               (QREFELT $ 6))
                                       #5#)
                                      #2#))
                    . #4#)
              (LETT |pr2|
                    (PROG2
                        (LETT #2#
                              (SPADCALL |Pr|
                                        (SPADCALL
                                         (SPADCALL |c1| (QREFELT $ 23))
                                         (+ |n| 2) (QREFELT $ 22))
                                        (QREFELT $ 29))
                              . #4#)
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0)
                                      (|UnivariatePolynomial| (QREFELT $ 7)
                                                              (QREFELT $ 6))
                                      (|Union|
                                       (|UnivariatePolynomial| (QREFELT $ 7)
                                                               (QREFELT $ 6))
                                       #5#)
                                      #2#))
                    . #4#)
              (LETT |LSub|
                    (APPEND
                     (SPADCALL
                      (PROG1 (LETT #1# (- |n| 1) . #4#)
                        (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #1#))
                      (|spadConstant| $ 14) (QREFELT $ 21))
                     (LIST |pr1| |pr2|))
                    . #4#)
              (EXIT (APPEND |LcsI| |LSub|))))))))) 

(SDEFUN |SHP;subresultantSequenceInner|
        ((|p1| . #1=(|UnivariatePolynomial| |x| R)) (|p2| . #1#)
         ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|Lin| (|List| (|UnivariatePolynomial| |x| R))) (#2=#:G140 NIL)
          (|j| NIL) (|indf| (|NonNegativeInteger|)))
         (SEQ
          (LETT |Lin| (|SHP;subresultantSequenceBegin| |p1| |p2| $)
                . #3=(|SHP;subresultantSequenceInner|))
          (LETT |indf|
                (COND
                 ((SPADCALL (SPADCALL |Lin| '|last| (QREFELT $ 31))
                            (|spadConstant| $ 14) (QREFELT $ 33))
                  (SPADCALL (SPADCALL |Lin| '|last| (QREFELT $ 31))
                            (QREFELT $ 10)))
                 ('T 0))
                . #3#)
          (SEQ G190
               (COND ((NULL (SPADCALL |indf| 0 (QREFELT $ 34))) (GO G191)))
               (SEQ (LETT |Lin| (|SHP;subresultantSequenceNext| |Lin| $) . #3#)
                    (EXIT
                     (LETT |indf|
                           (COND
                            ((SPADCALL (SPADCALL |Lin| '|last| (QREFELT $ 31))
                                       (|spadConstant| $ 14) (QREFELT $ 33))
                             (SPADCALL (SPADCALL |Lin| '|last| (QREFELT $ 31))
                                       (QREFELT $ 10)))
                            ('T 0))
                           . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |j| (LENGTH |Lin|) . #3#)
               (LETT #2# (SPADCALL |p1| (QREFELT $ 10)) . #3#) G190
               (COND ((> |j| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |Lin| (APPEND |Lin| (LIST (|spadConstant| $ 14)))
                       . #3#)))
               (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |Lin|)))) 

(SDEFUN |SHP;subresultantSequence;2UpL;4|
        ((|p1| |UnivariatePolynomial| |x| R)
         (|p2| |UnivariatePolynomial| |x| R)
         ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|List2| (|List| (|UnivariatePolynomial| |x| R)))
          (|Pr1| (|UnivariatePolynomial| |x| R)) (#1=#:G149 NIL)
          (#2=#:G147 NIL) (|Pr0| (|UnivariatePolynomial| |x| R))
          (#3=#:G156 NIL) (|j| NIL) (|c1| (R))
          (|List1| (|List| (|UnivariatePolynomial| |x| R))) (|n| (|Integer|)))
         (SEQ
          (LETT |n|
                (-
                 (- (SPADCALL |p1| (QREFELT $ 10))
                    (SPADCALL |p2| (QREFELT $ 10)))
                 1)
                . #4=(|SHP;subresultantSequence;2UpL;4|))
          (EXIT
           (COND
            ((< |n| 0)
             (|error| "subresultantSequence : degree(p1) <= degree(p2)"))
            ('T
             (SEQ
              (LETT |List1| (|SHP;subresultantSequenceInner| |p1| |p2| $)
                    . #4#)
              (LETT |List2| (LIST |p1| |p2|) . #4#)
              (LETT |c1| (SPADCALL |p1| (QREFELT $ 15)) . #4#)
              (SEQ (LETT |j| 3 . #4#) (LETT #3# (LENGTH |List1|) . #4#) G190
                   (COND ((> |j| #3#) (GO G191)))
                   (SEQ
                    (LETT |Pr0| (SPADCALL |List1| |j| (QREFELT $ 36)) . #4#)
                    (LETT |Pr1|
                          (PROG2
                              (LETT #1#
                                    (SPADCALL |Pr0|
                                              (SPADCALL |c1|
                                                        (PROG1
                                                            (LETT #2# |n|
                                                                  . #4#)
                                                          (|check_subtype2|
                                                           (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #2#))
                                                        (QREFELT $ 22))
                                              (QREFELT $ 29))
                                    . #4#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0)
                                            (|UnivariatePolynomial|
                                             (QREFELT $ 7) (QREFELT $ 6))
                                            (|Union|
                                             (|UnivariatePolynomial|
                                              (QREFELT $ 7) (QREFELT $ 6))
                                             "failed")
                                            #1#))
                          . #4#)
                    (EXIT (LETT |List2| (APPEND |List2| (LIST |Pr1|)) . #4#)))
                   (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |List2|)))))))) 

(SDEFUN |SHP;delta| ((|int1| |NonNegativeInteger|) ($ R))
        (SPROG ((#1=#:G158 NIL))
               (SPADCALL (SPADCALL (|spadConstant| $ 11) (QREFELT $ 23))
                         (PROG2
                             (LETT #1#
                                   (SPADCALL (* |int1| (+ |int1| 1)) 2
                                             (QREFELT $ 38))
                                   |SHP;delta|)
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0)
                                           (|NonNegativeInteger|)
                                           (|Union| (|NonNegativeInteger|)
                                                    "failed")
                                           #1#))
                         (QREFELT $ 22)))) 

(SDEFUN |SHP;polsth1|
        ((|p1| |UnivariatePolynomial| |x| R) (|p| |NonNegativeInteger|)
         (|p2| |UnivariatePolynomial| |x| R) (|q| |NonNegativeInteger|)
         (|c1| R) ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|List2| (|List| (|UnivariatePolynomial| |x| R)))
          (|Pr6| #1=(|UnivariatePolynomial| |x| R)) (#2=#:G438 NIL)
          (#3=#:G437 NIL) (#4=#:G443 NIL) (|j| NIL)
          (|List1| (|List| (|UnivariatePolynomial| |x| R)))
          (|Listf| (|List| #1#)) (#5=#:G411 NIL) (|Pr5| #1#) (#6=#:G410 NIL)
          (#7=#:G408 NIL) (|Pr4| #1#) (#8=#:G215 NIL) (|Pr3| #1#)
          (#9=#:G189 NIL) (|r| (|NonNegativeInteger|)) (|c2| (R))
          (|Pr2| (|UnivariatePolynomial| |x| R)) (#10=#:G162 NIL)
          (|Pr1| (|UnivariatePolynomial| |x| R)) (|sc1| (R)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 39)) (QREFELT $ 40))
                . #11=(|SHP;polsth1|))
          (LETT |Pr1|
                (SPADCALL
                 (SPADCALL (SPADCALL |p1| (QREFELT $ 41)) |p2| (QREFELT $ 42))
                 |p1| (QREFELT $ 12))
                . #11#)
          (LETT |Pr2|
                (PROG2
                    (LETT #10#
                          (SPADCALL |Pr1| (SPADCALL |c1| |q| (QREFELT $ 22))
                                    (QREFELT $ 29))
                          . #11#)
                    (QCDR #10#)
                  (|check_union2| (QEQCAR #10# 0)
                                  (|UnivariatePolynomial| (QREFELT $ 7)
                                                          (QREFELT $ 6))
                                  (|Union|
                                   (|UnivariatePolynomial| (QREFELT $ 7)
                                                           (QREFELT $ 6))
                                   "failed")
                                  #10#))
                . #11#)
          (LETT |c2| (SPADCALL |Pr2| (QREFELT $ 15)) . #11#)
          (LETT |r| (SPADCALL |Pr2| (QREFELT $ 10)) . #11#)
          (LETT |Pr3|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |sc1|
                            (PROG1 (LETT #9# (- (- |p| |r|) 1) . #11#)
                              (|check_subtype2| (>= #9# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #9#))
                            (QREFELT $ 22))
                  0 (QREFELT $ 43))
                 |p1| (QREFELT $ 42))
                . #11#)
          (LETT |Pr4|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |sc1|
                            (PROG1 (LETT #8# (- (- |p| |r|) 1) . #11#)
                              (|check_subtype2| (>= #8# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #8#))
                            (QREFELT $ 22))
                  0 (QREFELT $ 43))
                 |Pr2| (QREFELT $ 42))
                . #11#)
          (LETT |Listf| (LIST |Pr3| |Pr4|) . #11#)
          (COND
           ((< |r| (- |p| 1))
            (SEQ
             (LETT |Pr5|
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (|SHP;delta|
                       (PROG1 (LETT #7# (- (- |p| |r|) 1) . #11#)
                         (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #7#))
                       $)
                      (SPADCALL |c2|
                                (PROG1 (LETT #6# (- (- |p| |r|) 1) . #11#)
                                  (|check_subtype2| (>= #6# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #6#))
                                (QREFELT $ 22))
                      (QREFELT $ 17))
                     0 (QREFELT $ 43))
                    |Pr2| (QREFELT $ 42))
                   . #11#)
             (LETT |Listf|
                   (APPEND |Listf|
                           (SPADCALL
                            (PROG1 (LETT #5# (- (- |p| |r|) 2) . #11#)
                              (|check_subtype2| (>= #5# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #5#))
                            (|spadConstant| $ 14) (QREFELT $ 21)))
                   . #11#)
             (EXIT (LETT |Listf| (APPEND |Listf| (LIST |Pr5|)) . #11#)))))
          (LETT |List1|
                (COND
                 ((SPADCALL |Pr1| (|spadConstant| $ 14) (QREFELT $ 44))
                  |Listf|)
                 ('T (SPADCALL |p1| |Pr2| (QREFELT $ 37))))
                . #11#)
          (LETT |List2| NIL . #11#)
          (SEQ (LETT |j| 0 . #11#) (LETT #4# (- |r| 1) . #11#) G190
               (COND ((|greater_SI| |j| #4#) (GO G191)))
               (SEQ
                (LETT |Pr6|
                      (SPADCALL
                       (SPADCALL
                        (|SHP;delta|
                         (PROG1 (LETT #3# (- (- |p| |j|) 1) . #11#)
                           (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #3#))
                         $)
                        0 (QREFELT $ 43))
                       (SPADCALL |List1|
                                 (PROG1 (LETT #2# (+ (- |p| |j|) 1) . #11#)
                                   (|check_subtype2| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                 (QREFELT $ 36))
                       (QREFELT $ 42))
                      . #11#)
                (EXIT (LETT |List2| (APPEND (LIST |Pr6|) |List2|) . #11#)))
               (LETT |j| (|inc_SI| |j|) . #11#) (GO G190) G191 (EXIT NIL))
          (EXIT (APPEND |Listf| |List2|))))) 

(SDEFUN |SHP;polsth2|
        ((|p1| |UnivariatePolynomial| |x| R) (|p| |NonNegativeInteger|)
         (|p2| |UnivariatePolynomial| |x| R) (|q| |NonNegativeInteger|)
         (|c1| R) ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|List2| (|List| (|UnivariatePolynomial| |x| R)))
          (|Pr5| (|UnivariatePolynomial| |x| R)) (#1=#:G470 NIL)
          (|Pr4| #2=(|UnivariatePolynomial| |x| R)) (#3=#:G468 NIL)
          (#4=#:G467 NIL) (#5=#:G476 NIL) (|j| NIL)
          (|List1| (|List| (|UnivariatePolynomial| |x| R)))
          (|Listf| (|List| #2#)) (|Pr3| #2#) (|Pr2| #2#) (|Pr1| #2#)
          (|sc1| (R)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 39)) (QREFELT $ 40))
                . #6=(|SHP;polsth2|))
          (LETT |Pr1|
                (SPADCALL (SPADCALL |sc1| 0 (QREFELT $ 43)) |p1|
                          (QREFELT $ 42))
                . #6#)
          (LETT |Pr2|
                (SPADCALL (SPADCALL |p1| (QREFELT $ 41)) |p2| (QREFELT $ 42))
                . #6#)
          (LETT |Pr3|
                (SPADCALL (SPADCALL |sc1| 0 (QREFELT $ 43)) |Pr2|
                          (QREFELT $ 42))
                . #6#)
          (LETT |Listf| (LIST |Pr1| |Pr3|) . #6#)
          (LETT |List1| (SPADCALL |p1| |Pr2| (QREFELT $ 37)) . #6#)
          (LETT |List2| NIL . #6#)
          (SEQ (LETT |j| 0 . #6#) (LETT #5# (- |p| 2) . #6#) G190
               (COND ((|greater_SI| |j| #5#) (GO G191)))
               (SEQ
                (LETT |Pr4|
                      (SPADCALL
                       (SPADCALL
                        (|SHP;delta|
                         (PROG1 (LETT #4# (- (- |p| |j|) 1) . #6#)
                           (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #4#))
                         $)
                        0 (QREFELT $ 43))
                       (SPADCALL |List1|
                                 (PROG1 (LETT #3# (+ (- |p| |j|) 1) . #6#)
                                   (|check_subtype2| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #3#))
                                 (QREFELT $ 36))
                       (QREFELT $ 42))
                      . #6#)
                (LETT |Pr5|
                      (PROG2
                          (LETT #1# (SPADCALL |Pr4| |c1| (QREFELT $ 29)) . #6#)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0)
                                        (|UnivariatePolynomial| (QREFELT $ 7)
                                                                (QREFELT $ 6))
                                        (|Union|
                                         (|UnivariatePolynomial| (QREFELT $ 7)
                                                                 (QREFELT $ 6))
                                         "failed")
                                        #1#))
                      . #6#)
                (EXIT (LETT |List2| (APPEND (LIST |Pr5|) |List2|) . #6#)))
               (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT (APPEND |Listf| |List2|))))) 

(SDEFUN |SHP;polsth3|
        ((|p1| |UnivariatePolynomial| |x| R) (|p| |NonNegativeInteger|)
         (|p2| |UnivariatePolynomial| |x| R) (|q| |NonNegativeInteger|)
         (|c1| R) ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|List2| (|List| (|UnivariatePolynomial| |x| R)))
          (|Pr3| (|UnivariatePolynomial| |x| R)) (#1=#:G506 NIL)
          (|Pr2| #2=(|UnivariatePolynomial| |x| R)) (#3=#:G504 NIL)
          (#4=#:G503 NIL) (#5=#:G512 NIL) (#6=#:G479 NIL) (|j| NIL)
          (|List1| (|List| (|UnivariatePolynomial| |x| R)))
          (|Listf| (|List| #2#)) (|Pr1| #2#) (|v| (|NonNegativeInteger|))
          (|q1| (|NonNegativeInteger|)) (#7=#:G477 NIL) (|sc1| (R)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 39)) (QREFELT $ 40))
                . #8=(|SHP;polsth3|))
          (LETT |q1|
                (PROG1 (LETT #7# (- |q| 1) . #8#)
                  (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #7#))
                . #8#)
          (LETT |v| (+ |p| |q1|) . #8#)
          (LETT |Pr1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (|SHP;delta| |q1| $)
                            (SPADCALL |sc1| (+ |q| 1) (QREFELT $ 22))
                            (QREFELT $ 17))
                  0 (QREFELT $ 43))
                 |p1| (QREFELT $ 42))
                . #8#)
          (LETT |Listf| (LIST |Pr1|) . #8#)
          (LETT |List1|
                (SPADCALL
                 (SPADCALL (SPADCALL |p1| (QREFELT $ 41)) |p2| (QREFELT $ 42))
                 |p1| (QREFELT $ 37))
                . #8#)
          (LETT |List2| NIL . #8#)
          (SEQ (LETT |j| 0 . #8#)
               (LETT #5#
                     (PROG1 (LETT #6# (- |p| 1) . #8#)
                       (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #6#))
                     . #8#)
               G190 (COND ((|greater_SI| |j| #5#) (GO G191)))
               (SEQ
                (LETT |Pr2|
                      (SPADCALL
                       (SPADCALL
                        (|SHP;delta|
                         (PROG1 (LETT #4# (- |v| |j|) . #8#)
                           (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #4#))
                         $)
                        0 (QREFELT $ 43))
                       (SPADCALL |List1|
                                 (PROG1 (LETT #3# (+ (- |v| |j|) 1) . #8#)
                                   (|check_subtype2| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #3#))
                                 (QREFELT $ 36))
                       (QREFELT $ 42))
                      . #8#)
                (LETT |Pr3|
                      (PROG2
                          (LETT #1# (SPADCALL |Pr2| |c1| (QREFELT $ 29)) . #8#)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0)
                                        (|UnivariatePolynomial| (QREFELT $ 7)
                                                                (QREFELT $ 6))
                                        (|Union|
                                         (|UnivariatePolynomial| (QREFELT $ 7)
                                                                 (QREFELT $ 6))
                                         "failed")
                                        #1#))
                      . #8#)
                (EXIT (LETT |List2| (APPEND (LIST |Pr3|) |List2|) . #8#)))
               (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT (APPEND |Listf| |List2|))))) 

(SDEFUN |SHP;SturmHabichtSequence;2UpL;9|
        ((|p1| |UnivariatePolynomial| |x| R)
         (|p2| |UnivariatePolynomial| |x| R)
         ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG ((|c1| (R)) (|q| #1=(|NonNegativeInteger|)) (|p| #1#))
               (SEQ
                (LETT |p| (SPADCALL |p1| (QREFELT $ 10))
                      . #2=(|SHP;SturmHabichtSequence;2UpL;9|))
                (LETT |q| (SPADCALL |p2| (QREFELT $ 10)) . #2#)
                (LETT |c1| (SPADCALL |p1| (QREFELT $ 15)) . #2#)
                (COND
                 ((OR (SPADCALL |c1| (|spadConstant| $ 11) (QREFELT $ 45))
                      (EQL |q| 1))
                  (EXIT (|SHP;polsth1| |p1| |p| |p2| |q| |c1| $))))
                (EXIT
                 (COND ((EQL |q| 0) (|SHP;polsth2| |p1| |p| |p2| |q| |c1| $))
                       ('T (|SHP;polsth3| |p1| |p| |p2| |q| |c1| $))))))) 

(SDEFUN |SHP;SturmHabichtCoefficients;2UpL;10|
        ((|p1| |UnivariatePolynomial| |x| R)
         (|p2| |UnivariatePolynomial| |x| R) ($ |List| R))
        (SPROG
         ((#1=#:G515 NIL) (#2=#:G520 NIL) (|p| NIL) (#3=#:G521 NIL) (|j| NIL)
          (#4=#:G519 NIL) (|qp| (|NonNegativeInteger|))
          (|List1| (|List| (|UnivariatePolynomial| |x| R))))
         (SEQ
          (LETT |List1| (SPADCALL |p1| |p2| (QREFELT $ 46))
                . #5=(|SHP;SturmHabichtCoefficients;2UpL;10|))
          (LETT |qp| (LENGTH |List1|) . #5#)
          (EXIT
           (PROGN
            (LETT #4# NIL . #5#)
            (SEQ (LETT |j| 1 . #5#) (LETT #3# |qp| . #5#) (LETT |p| NIL . #5#)
                 (LETT #2# |List1| . #5#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #5#) NIL)
                       (|greater_SI| |j| #3#))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (SPADCALL |p|
                                    (PROG1 (LETT #1# (- |qp| |j|) . #5#)
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))
                                    (QREFELT $ 47))
                          #4#)
                         . #5#)))
                 (LETT #2# (PROG1 (CDR #2#) (LETT |j| (|inc_SI| |j|) . #5#))
                       . #5#)
                 (GO G190) G191 (EXIT (NREVERSE #4#)))))))) 

(SDEFUN |SHP;variation| ((|Lsig| |List| R) ($ |Integer|))
        (SPROG ((|List1| (|List| R)) (|sig1| (R)) (|elt2| (R)) (|elt1| (R)))
               (SEQ
                (COND ((SPADCALL |Lsig| 1 (QREFELT $ 50)) 0)
                      (#1='T
                       (SEQ
                        (LETT |elt1| (|SPADfirst| |Lsig|)
                              . #2=(|SHP;variation|))
                        (LETT |elt2| (SPADCALL |Lsig| 2 (QREFELT $ 51)) . #2#)
                        (LETT |sig1|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |elt1| |elt2| (QREFELT $ 17))
                                (QREFELT $ 39))
                               (QREFELT $ 40))
                              . #2#)
                        (LETT |List1| (CDR |Lsig|) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |sig1| (|spadConstant| $ 11)
                                     (QREFELT $ 45))
                           (|SHP;variation| |List1| $))
                          (#1# (+ 1 (|SHP;variation| |List1| $))))))))))) 

(SDEFUN |SHP;permanence| ((|Lsig| |List| R) ($ |Integer|))
        (SPROG ((|List1| (|List| R)) (|sig1| (R)) (|elt2| (R)) (|elt1| (R)))
               (SEQ
                (COND ((SPADCALL |Lsig| 1 (QREFELT $ 50)) 0)
                      (#1='T
                       (SEQ
                        (LETT |elt1| (|SPADfirst| |Lsig|)
                              . #2=(|SHP;permanence|))
                        (LETT |elt2| (SPADCALL |Lsig| 2 (QREFELT $ 51)) . #2#)
                        (LETT |sig1|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |elt1| |elt2| (QREFELT $ 17))
                                (QREFELT $ 39))
                               (QREFELT $ 40))
                              . #2#)
                        (LETT |List1| (CDR |Lsig|) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |sig1|
                                     (SPADCALL (|spadConstant| $ 11)
                                               (QREFELT $ 23))
                                     (QREFELT $ 45))
                           (|SHP;permanence| |List1| $))
                          (#1# (+ 1 (|SHP;permanence| |List1| $))))))))))) 

(SDEFUN |SHP;qzeros| ((|Lsig| |List| R) ($ |List| R))
        (SEQ (LETT |Lsig| (REVERSE |Lsig|) . #1=(|SHP;qzeros|))
             (SEQ G190
                  (COND
                   ((NULL
                     (SPADCALL (|SPADfirst| |Lsig|) (|spadConstant| $ 13)
                               (QREFELT $ 45)))
                    (GO G191)))
                  (SEQ (EXIT (LETT |Lsig| (CDR |Lsig|) . #1#))) NIL (GO G190)
                  G191 (EXIT NIL))
             (EXIT (NREVERSE |Lsig|)))) 

(SDEFUN |SHP;epsil|
        ((|int1| |NonNegativeInteger|) (|elt1| R) (|elt2| R) ($ |Integer|))
        (SPROG
         ((|ct4| (|Integer|)) (|ct3| (|NonNegativeInteger|)) (#1=#:G532 NIL)
          (|ct2| #2=(|Integer|)) (|ct1| #2#))
         (SEQ
          (COND ((OR (EQL |int1| 0) (ODDP |int1|)) 0)
                ('T
                 (SEQ
                  (LETT |ct1|
                        (COND
                         ((SPADCALL |elt1| (|spadConstant| $ 13)
                                    (QREFELT $ 52))
                          1)
                         (#3='T -1))
                        . #4=(|SHP;epsil|))
                  (LETT |ct2|
                        (COND
                         ((SPADCALL |elt2| (|spadConstant| $ 13)
                                    (QREFELT $ 52))
                          1)
                         (#3# -1))
                        . #4#)
                  (LETT |ct3|
                        (PROG2
                            (LETT #1# (SPADCALL |int1| 2 (QREFELT $ 38)) . #4#)
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                          (|Union| (|NonNegativeInteger|)
                                                   "failed")
                                          #1#))
                        . #4#)
                  (LETT |ct4| (* |ct1| |ct2|) . #4#)
                  (EXIT (* (EXPT -1 |ct3|) |ct4|)))))))) 

(SDEFUN |SHP;numbnce| ((|Lsig| |List| R) ($ |NonNegativeInteger|))
        (COND
         ((OR (NULL |Lsig|)
              (SPADCALL (|SPADfirst| |Lsig|) (|spadConstant| $ 13)
                        (QREFELT $ 45)))
          0)
         ('T (+ 1 (|SHP;numbnce| (CDR |Lsig|) $))))) 

(SDEFUN |SHP;numbce| ((|Lsig| |List| R) ($ |NonNegativeInteger|))
        (COND
         ((OR (NULL |Lsig|)
              (SPADCALL (|SPADfirst| |Lsig|) (|spadConstant| $ 13)
                        (QREFELT $ 53)))
          0)
         ('T (+ 1 (|SHP;numbce| (CDR |Lsig|) $))))) 

(SDEFUN |SHP;wfunctaux| ((|Lsig| . #1=(|List| R)) ($ |Integer|))
        (SPROG
         ((|ind4| (|Integer|)) (|ind3| (|Integer|)) (|ind2| (|Integer|))
          (|List1| #1#) (#2=#:G547 NIL) (|j| NIL)
          (|cont2| (|NonNegativeInteger|)) (|List2| (|List| R)) (#3=#:G546 NIL)
          (|cont1| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |Lsig|) 0)
                ('T
                 (SEQ (LETT |List2| NIL . #4=(|SHP;wfunctaux|))
                      (LETT |List1| |Lsig| . #4#)
                      (LETT |cont1| (|SHP;numbnce| |List1| $) . #4#)
                      (SEQ (LETT |j| 1 . #4#) (LETT #3# |cont1| . #4#) G190
                           (COND ((|greater_SI| |j| #3#) (GO G191)))
                           (SEQ
                            (LETT |List2|
                                  (APPEND |List2| (LIST (|SPADfirst| |List1|)))
                                  . #4#)
                            (EXIT (LETT |List1| (CDR |List1|) . #4#)))
                           (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |ind2| 0 . #4#)
                      (LETT |cont2| (|SHP;numbce| |List1| $) . #4#)
                      (SEQ (LETT |j| 1 . #4#) (LETT #2# |cont2| . #4#) G190
                           (COND ((|greater_SI| |j| #2#) (GO G191)))
                           (SEQ (EXIT (LETT |List1| (CDR |List1|) . #4#)))
                           (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (COND
                       ((SPADCALL |cont2| 0 (QREFELT $ 54))
                        (LETT |ind2|
                              (|SHP;epsil| |cont2|
                               (SPADCALL |List2| (QREFELT $ 55))
                               (|SPADfirst| |List1|) $)
                              . #4#)))
                      (LETT |ind3|
                            (- (|SHP;permanence| |List2| $)
                               (|SHP;variation| |List2| $))
                            . #4#)
                      (LETT |ind4| (+ |ind2| |ind3|) . #4#)
                      (EXIT (+ |ind4| (|SHP;wfunctaux| |List1| $))))))))) 

(SDEFUN |SHP;wfunct| ((|Lsig| |List| R) ($ |Integer|))
        (SPROG ((|List1| (|List| R)))
               (SEQ (LETT |List1| (|SHP;qzeros| |Lsig| $) |SHP;wfunct|)
                    (EXIT (|SHP;wfunctaux| |List1| $))))) 

(SDEFUN |SHP;SturmHabicht;2UpI;19|
        ((|p1| |UnivariatePolynomial| |x| R)
         (|p2| |UnivariatePolynomial| |x| R) ($ |Integer|))
        (SPROG
         ((#1=#:G555 NIL) (|p| NIL) (#2=#:G554 NIL)
          (|List1| (|List| (|UnivariatePolynomial| |x| R))))
         (SEQ
          (COND
           ((OR (SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 44))
                (EQL (SPADCALL |p1| (QREFELT $ 10)) 0))
            0)
           ('T
            (SEQ
             (LETT |List1| (SPADCALL |p1| |p2| (QREFELT $ 46))
                   . #3=(|SHP;SturmHabicht;2UpI;19|))
             (EXIT
              (|SHP;wfunct|
               (PROGN
                (LETT #2# NIL . #3#)
                (SEQ (LETT |p| NIL . #3#) (LETT #1# |List1| . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 15)) #2#)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))
               $)))))))) 

(SDEFUN |SHP;countRealRoots;UpI;20|
        ((|p1| |UnivariatePolynomial| |x| R) ($ |Integer|))
        (SPADCALL |p1| (|spadConstant| $ 16) (QREFELT $ 56))) 

(SDEFUN |SHP;SturmHabichtMultiple;2UpI;21|
        ((|p1| |UnivariatePolynomial| |x| R)
         (|p2| |UnivariatePolynomial| |x| R) ($ |Integer|))
        (SPROG
         ((#1=#:G580 NIL) (|f| NIL) (#2=#:G579 NIL)
          (|sqfr|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| (|UnivariatePolynomial| |x| R))
                      (|:| |xpnt| (|Integer|)))))
          (SH (|List| (|UnivariatePolynomial| |x| R))) (|ans| (|Integer|))
          (#3=#:G557 NIL) (#4=#:G577 NIL) (|p| NIL) (#5=#:G578 NIL) (|j| NIL)
          (#6=#:G576 NIL) (|qp| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((OR (SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 44))
                (EQL (SPADCALL |p1| (QREFELT $ 10)) 0))
            0)
           ('T
            (SEQ
             (LETT SH (SPADCALL |p1| |p2| (QREFELT $ 46))
                   . #7=(|SHP;SturmHabichtMultiple;2UpI;21|))
             (LETT |qp| (LENGTH SH) . #7#)
             (LETT |ans|
                   (|SHP;wfunct|
                    (PROGN
                     (LETT #6# NIL . #7#)
                     (SEQ (LETT |j| 1 . #7#) (LETT #5# |qp| . #7#)
                          (LETT |p| NIL . #7#) (LETT #4# SH . #7#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |p| (CAR #4#) . #7#) NIL)
                                (|greater_SI| |j| #5#))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (SPADCALL |p|
                                             (PROG1
                                                 (LETT #3# (- |qp| |j|) . #7#)
                                               (|check_subtype2| (>= #3# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #3#))
                                             (QREFELT $ 47))
                                   #6#)
                                  . #7#)))
                          (LETT #4#
                                (PROG1 (CDR #4#)
                                  (LETT |j| (|inc_SI| |j|) . #7#))
                                . #7#)
                          (GO G190) G191 (EXIT (NREVERSE #6#))))
                    $)
                   . #7#)
             (LETT SH (REVERSE SH) . #7#)
             (SEQ G190
                  (COND
                   ((NULL
                     (SPADCALL (|SPADfirst| SH) (|spadConstant| $ 14)
                               (QREFELT $ 44)))
                    (GO G191)))
                  (SEQ (EXIT (LETT SH (CDR SH) . #7#))) NIL (GO G190) G191
                  (EXIT NIL))
             (EXIT
              (COND ((EQL (SPADCALL (|SPADfirst| SH) (QREFELT $ 10)) 0) |ans|)
                    ((QEQCAR
                      (SPADCALL (SPADCALL |p1| (QREFELT $ 41)) (|SPADfirst| SH)
                                (QREFELT $ 58))
                      0)
                     (+ |ans| (SPADCALL (|SPADfirst| SH) |p2| (QREFELT $ 59))))
                    ('T
                     (SEQ
                      (LETT |sqfr|
                            (SPADCALL (SPADCALL |p1| (QREFELT $ 61))
                                      (QREFELT $ 66))
                            . #7#)
                      (COND
                       ((EQL (LENGTH |sqfr|) 1)
                        (COND
                         ((EQL (QVELT (|SPADfirst| |sqfr|) 2) 1)
                          (EXIT |ans|)))))
                      (EXIT
                       (SPADCALL (ELT $ 67)
                                 (PROGN
                                  (LETT #2# NIL . #7#)
                                  (SEQ (LETT |f| NIL . #7#)
                                       (LETT #1# |sqfr| . #7#) G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |f| (CAR #1#) . #7#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (* (QVELT |f| 2)
                                                   (SPADCALL (QVELT |f| 1) |p2|
                                                             (QREFELT $ 56)))
                                                #2#)
                                               . #7#)))
                                       (LETT #1# (CDR #1#) . #7#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 70))))))))))))) 

(SDEFUN |SHP;countRealRootsMultiple;UpI;22|
        ((|p1| |UnivariatePolynomial| |x| R) ($ |Integer|))
        (SPADCALL |p1| (|spadConstant| $ 16) (QREFELT $ 59))) 

(DECLAIM (NOTINLINE |SturmHabichtPackage;|)) 

(DEFUN |SturmHabichtPackage| (&REST #1=#:G582)
  (SPROG NIL
         (PROG (#2=#:G583)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SturmHabichtPackage|)
                                               '|domainEqualList|)
                    . #3=(|SturmHabichtPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SturmHabichtPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SturmHabichtPackage|)))))))))) 

(DEFUN |SturmHabichtPackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SturmHabichtPackage|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|SturmHabichtPackage| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 72) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|SturmHabichtPackage|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 59
                       (CONS
                        (|dispatchFunction| |SHP;SturmHabichtMultiple;2UpI;21|)
                        $))
             (QSETREFV $ 71
                       (CONS
                        (|dispatchFunction|
                         |SHP;countRealRootsMultiple;UpI;22|)
                        $)))))
          $))) 

(MAKEPROP '|SturmHabichtPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (|UnivariatePolynomial| 7 6)
              (0 . |degree|) (5 . |One|) (9 . |pseudoRemainder|) (15 . |Zero|)
              (19 . |Zero|) (23 . |leadingCoefficient|) (28 . |One|) (32 . *)
              (38 . *) (44 . -) (|List| 9) (49 . |new|) (55 . ^) (61 . -)
              (66 . |last|) (71 . |second|) (|PositiveInteger|) (76 . ^)
              (|Union| $ '"failed") (82 . |exquo|) '"last" (88 . |elt|)
              (|Boolean|) (94 . ~=) (100 . ~=) (|Integer|) (106 . |elt|)
              |SHP;subresultantSequence;2UpL;4| (112 . |exquo|) (118 . |sign|)
              (123 . |coerce|) (128 . |differentiate|) (133 . *)
              (139 . |monomial|) (145 . =) (151 . =)
              |SHP;SturmHabichtSequence;2UpL;9| (157 . |coefficient|)
              (|List| 6) |SHP;SturmHabichtCoefficients;2UpL;10| (163 . |size?|)
              (169 . |elt|) (175 . >) (181 . ~=) (187 . >) (193 . |last|)
              |SHP;SturmHabicht;2UpI;19| |SHP;countRealRoots;UpI;20|
              (198 . |exquo|) (204 . |SturmHabichtMultiple|) (|Factored| $)
              (210 . |squareFree|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 62) (|:| |fctr| 9) (|:| |xpnt| 35))
              (|List| 63) (|Factored| 9) (215 . |factorList|) (220 . +)
              (|Mapping| 35 35 35) (|List| 35) (226 . |reduce|)
              (232 . |countRealRootsMultiple|))
           '#(|subresultantSequence| 237 |countRealRootsMultiple| 243
              |countRealRoots| 248 |SturmHabichtSequence| 253
              |SturmHabichtMultiple| 259 |SturmHabichtCoefficients| 265
              |SturmHabicht| 271)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 71
                                                 '(1 9 8 0 10 0 6 0 11 2 9 0 0
                                                   0 12 0 6 0 13 0 9 0 14 1 9 6
                                                   0 15 0 9 0 16 2 6 0 0 0 17 2
                                                   9 0 6 0 18 1 9 0 0 19 2 20 0
                                                   8 9 21 2 6 0 0 8 22 1 6 0 0
                                                   23 1 20 9 0 24 1 20 9 0 25 2
                                                   6 0 0 26 27 2 9 28 0 6 29 2
                                                   20 9 0 30 31 2 9 32 0 0 33 2
                                                   8 32 0 0 34 2 20 9 0 35 36 2
                                                   8 28 0 0 38 1 6 35 0 39 1 6
                                                   0 35 40 1 9 0 0 41 2 9 0 0 0
                                                   42 2 9 0 6 8 43 2 9 32 0 0
                                                   44 2 6 32 0 0 45 2 9 6 0 8
                                                   47 2 48 32 0 8 50 2 48 6 0
                                                   35 51 2 6 32 0 0 52 2 6 32 0
                                                   0 53 2 8 32 0 0 54 1 48 6 0
                                                   55 2 9 28 0 0 58 2 0 35 9 9
                                                   59 1 9 60 0 61 1 65 64 0 66
                                                   2 35 0 0 0 67 2 69 35 68 0
                                                   70 1 0 35 9 71 2 0 20 9 9 37
                                                   1 1 35 9 71 1 0 35 9 57 2 0
                                                   20 9 9 46 2 1 35 9 9 59 2 0
                                                   48 9 9 49 2 0 35 9 9 56)))))
           '|lookupComplete|)) 
