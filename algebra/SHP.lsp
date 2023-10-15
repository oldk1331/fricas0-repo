
(SDEFUN |SHP;subresultantSequenceBegin|
        ((|p1| . #1=(|UnivariatePolynomial| |x| R)) (|p2| . #1#)
         ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|Lc2| (|UnivariatePolynomial| |x| R)) (#2=#:G130 NIL)
          (|Lc1| (|UnivariatePolynomial| |x| R)) (|c1| (R)) (#3=#:G124 NIL)
          (|LSubr| (|List| #1#)) (#4=#:G135 NIL) (|i| NIL) (|in2| (|Integer|))
          (|in1| (|Integer|)) (#5=#:G120 NIL)
          (|Pr| (|UnivariatePolynomial| |x| R)) (|n| (|NonNegativeInteger|))
          (#6=#:G118 NIL) (|d2| #7=(|NonNegativeInteger|)) (|d1| #7#))
         (SEQ
          (LETT |d1| (SPADCALL |p1| (QREFELT $ 10))
                . #8=(|SHP;subresultantSequenceBegin|))
          (LETT |d2| (SPADCALL |p2| (QREFELT $ 10)) . #8#)
          (LETT |n|
                (PROG1 (LETT #6# (- |d1| 1) . #8#)
                  (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #6#))
                . #8#)
          (EXIT
           (COND
            ((EQL |d2| |n|)
             (SEQ (LETT |Pr| (SPADCALL |p1| |p2| (QREFELT $ 13)) . #8#)
                  (EXIT (APPEND (LIST |p1| |p2|) (LIST |Pr|)))))
            ((EQL |d2|
                  (PROG1 (LETT #5# (- |n| 1) . #8#)
                    (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #5#)))
             (SEQ
              (LETT |Lc1|
                    (SPADCALL
                     (SPADCALL (SPADCALL |p1| (QREFELT $ 14))
                               (SPADCALL |p2| (QREFELT $ 14)) (QREFELT $ 15))
                     |p2| (QREFELT $ 16))
                    . #8#)
              (LETT |Lc2|
                    (SPADCALL
                     (SPADCALL (SPADCALL |p1| (QREFELT $ 14))
                               (SPADCALL |p1| |p2| (QREFELT $ 13))
                               (QREFELT $ 16))
                     (QREFELT $ 17))
                    . #8#)
              (EXIT (APPEND (LIST |p1| |p2|) (LIST |Lc1| |Lc2|)))))
            ('T
             (SEQ (LETT |LSubr| (LIST |p1| |p2|) . #8#)
                  (LETT |in1| (+ |d2| 1) . #8#) (LETT |in2| (- |n| 1) . #8#)
                  (SEQ (LETT |i| |in1| . #8#) (LETT #4# |in2| . #8#) G190
                       (COND ((> |i| #4#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |LSubr|
                               (APPEND |LSubr| (LIST (|spadConstant| $ 18)))
                               . #8#)))
                       (LETT |i| (+ |i| 1) . #8#) (GO G190) G191 (EXIT NIL))
                  (LETT |c1|
                        (SPADCALL
                         (SPADCALL (SPADCALL |p1| (QREFELT $ 14))
                                   (SPADCALL |p2| (QREFELT $ 14))
                                   (QREFELT $ 15))
                         (PROG1 (LETT #3# (- |n| |d2|) . #8#)
                           (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #3#))
                         (QREFELT $ 19))
                        . #8#)
                  (LETT |Lc1|
                        (SPADCALL (SPADCALL |c1| 0 (QREFELT $ 21)) |p2|
                                  (QREFELT $ 22))
                        . #8#)
                  (LETT |Lc2|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |p1| (QREFELT $ 14))
                                    (QREFELT $ 23))
                          (PROG1 (LETT #2# (- |n| |d2|) . #8#)
                            (|check_subtype2| (>= #2# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #2#))
                          (QREFELT $ 19))
                         (SPADCALL |p1| |p2| (QREFELT $ 13)) (QREFELT $ 16))
                        . #8#)
                  (EXIT (APPEND |LSubr| (LIST |Lc1| |Lc2|)))))))))) 

(SDEFUN |SHP;subresultantSequenceNext|
        ((|LcsI| |List| (|UnivariatePolynomial| |x| R))
         ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|LSub| (|List| #1=(|UnivariatePolynomial| |x| R))) (#2=#:G202 NIL)
          (|k| NIL) (|pr2| #1#) (#3=#:G138 NIL) (#4=#:G197 NIL)
          (|pr1| (|UnivariatePolynomial| |x| R)) (#5=#:G192 NIL)
          (#6=#:G190 NIL) (|c1| (R)) (|in1| (|NonNegativeInteger|))
          (#7=#:G136 NIL) (|d2| #8=(|NonNegativeInteger|)) (|d1| #8#)
          (|p1| (|UnivariatePolynomial| |x| R))
          (|p2| (|UnivariatePolynomial| |x| R)))
         (SEQ
          (LETT |p2| (SPADCALL |LcsI| (QREFELT $ 25))
                . #9=(|SHP;subresultantSequenceNext|))
          (LETT |p1| (|SPADfirst| (CDR (REVERSE |LcsI|))) . #9#)
          (LETT |d1| (SPADCALL |p1| (QREFELT $ 10)) . #9#)
          (LETT |d2| (SPADCALL |p2| (QREFELT $ 10)) . #9#)
          (LETT |in1|
                (PROG1 (LETT #7# (- |d1| 1) . #9#)
                  (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #7#))
                . #9#)
          (EXIT
           (COND
            ((EQL |d2| |in1|)
             (SEQ
              (LETT |pr1|
                    (PROG2
                        (LETT #3#
                              (SPADCALL (SPADCALL |p1| |p2| (QREFELT $ 13))
                                        (SPADCALL
                                         (SPADCALL |p1| (QREFELT $ 14)) 2
                                         (QREFELT $ 27))
                                        (QREFELT $ 29))
                              . #9#)
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|UnivariatePolynomial| (QREFELT $ 7)
                                                              (QREFELT $ 6))
                                      (|Union|
                                       (|UnivariatePolynomial| (QREFELT $ 7)
                                                               (QREFELT $ 6))
                                       #10="failed")
                                      #3#))
                    . #9#)
              (EXIT (APPEND |LcsI| (LIST |pr1|)))))
            ((< |d2| |in1|)
             (SEQ (LETT |c1| (SPADCALL |p1| (QREFELT $ 14)) . #9#)
                  (LETT |pr1|
                        (PROG2
                            (LETT #3#
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |p2| (QREFELT $ 14))
                                              (PROG1
                                                  (LETT #6# (- |in1| |d2|)
                                                        . #9#)
                                                (|check_subtype2| (>= #6# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #6#))
                                              (QREFELT $ 19))
                                    |p2| (QREFELT $ 16))
                                   (SPADCALL |c1|
                                             (PROG1
                                                 (LETT #5# (- |in1| |d2|)
                                                       . #9#)
                                               (|check_subtype2| (>= #5# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #5#))
                                             (QREFELT $ 19))
                                   (QREFELT $ 29))
                                  . #9#)
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 0)
                                          (|UnivariatePolynomial| (QREFELT $ 7)
                                                                  (QREFELT $
                                                                           6))
                                          (|Union|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 7) (QREFELT $ 6))
                                           #10#)
                                          #3#))
                        . #9#)
                  (LETT |pr2|
                        (PROG2
                            (LETT #3#
                                  (SPADCALL (SPADCALL |p1| |p2| (QREFELT $ 13))
                                            (SPADCALL
                                             (SPADCALL |c1| (QREFELT $ 23))
                                             (PROG1
                                                 (LETT #4# (+ (- |in1| |d2|) 2)
                                                       . #9#)
                                               (|check_subtype2| (>= #4# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #4#))
                                             (QREFELT $ 19))
                                            (QREFELT $ 29))
                                  . #9#)
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 0)
                                          (|UnivariatePolynomial| (QREFELT $ 7)
                                                                  (QREFELT $
                                                                           6))
                                          (|Union|
                                           (|UnivariatePolynomial|
                                            (QREFELT $ 7) (QREFELT $ 6))
                                           #10#)
                                          #3#))
                        . #9#)
                  (LETT |LSub| (LIST |pr1| |pr2|) . #9#)
                  (SEQ (LETT |k| (+ |d2| 1) . #9#) (LETT #2# (- |in1| 1) . #9#)
                       G190 (COND ((> |k| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |LSub|
                               (APPEND (LIST (|spadConstant| $ 18)) |LSub|)
                               . #9#)))
                       (LETT |k| (+ |k| 1) . #9#) (GO G190) G191 (EXIT NIL))
                  (EXIT (APPEND |LcsI| |LSub|))))))))) 

(SDEFUN |SHP;subresultantSequenceInner|
        ((|p1| . #1=(|UnivariatePolynomial| |x| R)) (|p2| . #1#)
         ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|Lin| (|List| (|UnivariatePolynomial| |x| R))) (#2=#:G210 NIL)
          (|j| NIL) (|indf| (|NonNegativeInteger|)))
         (SEQ
          (LETT |Lin| (|SHP;subresultantSequenceBegin| |p1| |p2| $)
                . #3=(|SHP;subresultantSequenceInner|))
          (LETT |indf|
                (COND
                 ((SPADCALL (SPADCALL |Lin| '|last| (QREFELT $ 31))
                            (|spadConstant| $ 18) (QREFELT $ 33))
                  0)
                 ('T
                  (SPADCALL (SPADCALL |Lin| '|last| (QREFELT $ 31))
                            (QREFELT $ 10))))
                . #3#)
          (SEQ G190 (COND ((NULL (NULL (EQL |indf| 0))) (GO G191)))
               (SEQ (LETT |Lin| (|SHP;subresultantSequenceNext| |Lin| $) . #3#)
                    (EXIT
                     (LETT |indf|
                           (COND
                            ((SPADCALL (SPADCALL |Lin| '|last| (QREFELT $ 31))
                                       (|spadConstant| $ 18) (QREFELT $ 33))
                             0)
                            ('T
                             (SPADCALL (SPADCALL |Lin| '|last| (QREFELT $ 31))
                                       (QREFELT $ 10))))
                           . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |j| (LENGTH |Lin|) . #3#)
               (LETT #2# (SPADCALL |p1| (QREFELT $ 10)) . #3#) G190
               (COND ((> |j| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |Lin| (APPEND |Lin| (LIST (|spadConstant| $ 18)))
                       . #3#)))
               (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |Lin|)))) 

(SDEFUN |SHP;subresultantSequence;2UpL;4|
        ((|p1| |UnivariatePolynomial| |x| R)
         (|p2| |UnivariatePolynomial| |x| R)
         ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|List2| (|List| (|UnivariatePolynomial| |x| R)))
          (|Pr1| (|UnivariatePolynomial| |x| R)) (#1=#:G217 NIL)
          (#2=#:G215 NIL) (|Pr0| (|UnivariatePolynomial| |x| R))
          (#3=#:G223 NIL) (|j| NIL) (|c1| (R))
          (|List1| (|List| (|UnivariatePolynomial| |x| R)))
          (|q| #4=(|NonNegativeInteger|)) (|p| #4#))
         (SEQ
          (LETT |p| (SPADCALL |p1| (QREFELT $ 10))
                . #5=(|SHP;subresultantSequence;2UpL;4|))
          (LETT |q| (SPADCALL |p2| (QREFELT $ 10)) . #5#)
          (LETT |List1| (|SHP;subresultantSequenceInner| |p1| |p2| $) . #5#)
          (LETT |List2| (LIST |p1| |p2|) . #5#)
          (LETT |c1| (SPADCALL |p1| (QREFELT $ 14)) . #5#)
          (SEQ (LETT |j| 3 . #5#) (LETT #3# (LENGTH |List1|) . #5#) G190
               (COND ((> |j| #3#) (GO G191)))
               (SEQ (LETT |Pr0| (SPADCALL |List1| |j| (QREFELT $ 35)) . #5#)
                    (LETT |Pr1|
                          (PROG2
                              (LETT #1#
                                    (SPADCALL |Pr0|
                                              (SPADCALL |c1|
                                                        (PROG1
                                                            (LETT #2#
                                                                  (-
                                                                   (- |p| |q|)
                                                                   1)
                                                                  . #5#)
                                                          (|check_subtype2|
                                                           (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #2#))
                                                        (QREFELT $ 19))
                                              (QREFELT $ 29))
                                    . #5#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0)
                                            (|UnivariatePolynomial|
                                             (QREFELT $ 7) (QREFELT $ 6))
                                            (|Union|
                                             (|UnivariatePolynomial|
                                              (QREFELT $ 7) (QREFELT $ 6))
                                             "failed")
                                            #1#))
                          . #5#)
                    (EXIT (LETT |List2| (APPEND |List2| (LIST |Pr1|)) . #5#)))
               (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT |List2|)))) 

(SDEFUN |SHP;delta| ((|int1| |NonNegativeInteger|) ($ R))
        (SPROG ((#1=#:G225 NIL))
               (SPADCALL (SPADCALL (|spadConstant| $ 11) (QREFELT $ 23))
                         (PROG2
                             (LETT #1#
                                   (SPADCALL (* |int1| (+ |int1| 1)) 2
                                             (QREFELT $ 37))
                                   |SHP;delta|)
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0)
                                           (|NonNegativeInteger|)
                                           (|Union| (|NonNegativeInteger|)
                                                    "failed")
                                           #1#))
                         (QREFELT $ 19)))) 

(SDEFUN |SHP;polsth1|
        ((|p1| |UnivariatePolynomial| |x| R) (|p| |NonNegativeInteger|)
         (|p2| |UnivariatePolynomial| |x| R) (|q| |NonNegativeInteger|)
         (|c1| R) ($ |List| (|UnivariatePolynomial| |x| R)))
        (SPROG
         ((|List2| (|List| (|UnivariatePolynomial| |x| R)))
          (|Pr6| #1=(|UnivariatePolynomial| |x| R)) (#2=#:G405 NIL)
          (#3=#:G404 NIL) (#4=#:G411 NIL) (|j| NIL)
          (|List1| (|List| (|UnivariatePolynomial| |x| R)))
          (|Listf| (|List| #1#)) (#5=#:G410 NIL) (|Pr5| #1#) (#6=#:G382 NIL)
          (#7=#:G380 NIL) (|Pr4| #1#) (#8=#:G262 NIL) (|Pr3| #1#)
          (#9=#:G246 NIL) (|r| (|NonNegativeInteger|)) (|c2| (R))
          (|Pr2| (|UnivariatePolynomial| |x| R)) (#10=#:G229 NIL)
          (|Pr1| (|UnivariatePolynomial| |x| R)) (|sc1| (R)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 38)) (QREFELT $ 39))
                . #11=(|SHP;polsth1|))
          (LETT |Pr1|
                (SPADCALL
                 (SPADCALL (SPADCALL |p1| (QREFELT $ 40)) |p2| (QREFELT $ 22))
                 |p1| (QREFELT $ 13))
                . #11#)
          (LETT |Pr2|
                (PROG2
                    (LETT #10#
                          (SPADCALL |Pr1| (SPADCALL |c1| |q| (QREFELT $ 19))
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
          (LETT |c2| (SPADCALL |Pr2| (QREFELT $ 14)) . #11#)
          (LETT |r| (SPADCALL |Pr2| (QREFELT $ 10)) . #11#)
          (LETT |Pr3|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |sc1|
                            (PROG1 (LETT #9# (- (- |p| |r|) 1) . #11#)
                              (|check_subtype2| (>= #9# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #9#))
                            (QREFELT $ 19))
                  0 (QREFELT $ 21))
                 |p1| (QREFELT $ 22))
                . #11#)
          (LETT |Pr4|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |sc1|
                            (PROG1 (LETT #8# (- (- |p| |r|) 1) . #11#)
                              (|check_subtype2| (>= #8# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #8#))
                            (QREFELT $ 19))
                  0 (QREFELT $ 21))
                 |Pr2| (QREFELT $ 22))
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
                                (QREFELT $ 19))
                      (QREFELT $ 15))
                     0 (QREFELT $ 21))
                    |Pr2| (QREFELT $ 22))
                   . #11#)
             (SEQ (LETT |j| (+ |r| 1) . #11#) (LETT #5# (- |p| 2) . #11#) G190
                  (COND ((> |j| #5#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT |Listf| (APPEND |Listf| (LIST (|spadConstant| $ 18)))
                          . #11#)))
                  (LETT |j| (+ |j| 1) . #11#) (GO G190) G191 (EXIT NIL))
             (EXIT (LETT |Listf| (APPEND |Listf| (LIST |Pr5|)) . #11#)))))
          (COND
           ((SPADCALL |Pr1| (|spadConstant| $ 18) (QREFELT $ 33))
            (LETT |List1| |Listf| . #11#))
           ('T (LETT |List1| (SPADCALL |p1| |Pr2| (QREFELT $ 36)) . #11#)))
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
                        0 (QREFELT $ 21))
                       (SPADCALL |List1|
                                 (PROG1 (LETT #2# (+ (- |p| |j|) 1) . #11#)
                                   (|check_subtype2| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                 (QREFELT $ 35))
                       (QREFELT $ 22))
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
          (|Pr5| (|UnivariatePolynomial| |x| R)) (#1=#:G433 NIL)
          (|Pr4| #2=(|UnivariatePolynomial| |x| R)) (#3=#:G431 NIL)
          (#4=#:G430 NIL) (#5=#:G439 NIL) (|j| NIL)
          (|List1| (|List| (|UnivariatePolynomial| |x| R)))
          (|Listf| (|List| #2#)) (|Pr3| #2#) (|Pr2| #2#) (|Pr1| #2#)
          (|sc1| (R)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 38)) (QREFELT $ 39))
                . #6=(|SHP;polsth2|))
          (LETT |Pr1|
                (SPADCALL (SPADCALL |sc1| 0 (QREFELT $ 21)) |p1|
                          (QREFELT $ 22))
                . #6#)
          (LETT |Pr2|
                (SPADCALL (SPADCALL |p1| (QREFELT $ 40)) |p2| (QREFELT $ 22))
                . #6#)
          (LETT |Pr3|
                (SPADCALL (SPADCALL |sc1| 0 (QREFELT $ 21)) |Pr2|
                          (QREFELT $ 22))
                . #6#)
          (LETT |Listf| (LIST |Pr1| |Pr3|) . #6#)
          (LETT |List1| (SPADCALL |p1| |Pr2| (QREFELT $ 36)) . #6#)
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
                        0 (QREFELT $ 21))
                       (SPADCALL |List1|
                                 (PROG1 (LETT #3# (+ (- |p| |j|) 1) . #6#)
                                   (|check_subtype2| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #3#))
                                 (QREFELT $ 35))
                       (QREFELT $ 22))
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
          (|Pr3| (|UnivariatePolynomial| |x| R)) (#1=#:G464 NIL)
          (|Pr2| #2=(|UnivariatePolynomial| |x| R)) (#3=#:G462 NIL)
          (#4=#:G461 NIL) (#5=#:G470 NIL) (#6=#:G442 NIL) (|j| NIL)
          (|List1| (|List| (|UnivariatePolynomial| |x| R)))
          (|Listf| (|List| #2#)) (|Pr1| #2#) (|v| (|NonNegativeInteger|))
          (|q1| (|NonNegativeInteger|)) (#7=#:G440 NIL) (|sc1| (R)))
         (SEQ
          (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 38)) (QREFELT $ 39))
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
                            (SPADCALL |sc1| (+ |q| 1) (QREFELT $ 19))
                            (QREFELT $ 15))
                  0 (QREFELT $ 21))
                 |p1| (QREFELT $ 22))
                . #8#)
          (LETT |Listf| (LIST |Pr1|) . #8#)
          (LETT |List1|
                (SPADCALL
                 (SPADCALL (SPADCALL |p1| (QREFELT $ 40)) |p2| (QREFELT $ 22))
                 |p1| (QREFELT $ 36))
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
                        0 (QREFELT $ 21))
                       (SPADCALL |List1|
                                 (PROG1 (LETT #3# (+ (- |v| |j|) 1) . #8#)
                                   (|check_subtype2| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #3#))
                                 (QREFELT $ 35))
                       (QREFELT $ 22))
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
                (LETT |c1| (SPADCALL |p1| (QREFELT $ 14)) . #2#)
                (COND
                 ((OR (SPADCALL |c1| (|spadConstant| $ 11) (QREFELT $ 41))
                      (EQL |q| 1))
                  (EXIT (|SHP;polsth1| |p1| |p| |p2| |q| |c1| $))))
                (EXIT
                 (COND ((EQL |q| 0) (|SHP;polsth2| |p1| |p| |p2| |q| |c1| $))
                       ('T (|SHP;polsth3| |p1| |p| |p2| |q| |c1| $))))))) 

(SDEFUN |SHP;SturmHabichtCoefficients;2UpL;10|
        ((|p1| |UnivariatePolynomial| |x| R)
         (|p2| |UnivariatePolynomial| |x| R) ($ |List| R))
        (SPROG
         ((#1=#:G473 NIL) (#2=#:G478 NIL) (|p| NIL) (#3=#:G479 NIL) (|j| NIL)
          (#4=#:G477 NIL) (|qp| (|NonNegativeInteger|))
          (|List1| (|List| (|UnivariatePolynomial| |x| R))))
         (SEQ
          (LETT |List1| (SPADCALL |p1| |p2| (QREFELT $ 42))
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
                                    (QREFELT $ 43))
                          #4#)
                         . #5#)))
                 (LETT #2# (PROG1 (CDR #2#) (LETT |j| (|inc_SI| |j|) . #5#))
                       . #5#)
                 (GO G190) G191 (EXIT (NREVERSE #4#)))))))) 

(SDEFUN |SHP;variation| ((|Lsig| |List| R) ($ |Integer|))
        (SPROG ((|List1| (|List| R)) (|sig1| (R)) (|elt2| (R)) (|elt1| (R)))
               (SEQ
                (COND ((SPADCALL |Lsig| 1 (QREFELT $ 46)) 0)
                      (#1='T
                       (SEQ
                        (LETT |elt1| (|SPADfirst| |Lsig|)
                              . #2=(|SHP;variation|))
                        (LETT |elt2| (SPADCALL |Lsig| 2 (QREFELT $ 47)) . #2#)
                        (LETT |sig1|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |elt1| |elt2| (QREFELT $ 15))
                                (QREFELT $ 38))
                               (QREFELT $ 39))
                              . #2#)
                        (LETT |List1| (CDR |Lsig|) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |sig1| (|spadConstant| $ 11)
                                     (QREFELT $ 41))
                           (|SHP;variation| |List1| $))
                          (#1# (+ 1 (|SHP;variation| |List1| $))))))))))) 

(SDEFUN |SHP;permanence| ((|Lsig| |List| R) ($ |Integer|))
        (SPROG ((|List1| (|List| R)) (|sig1| (R)) (|elt2| (R)) (|elt1| (R)))
               (SEQ
                (COND ((SPADCALL |Lsig| 1 (QREFELT $ 46)) 0)
                      (#1='T
                       (SEQ
                        (LETT |elt1| (|SPADfirst| |Lsig|)
                              . #2=(|SHP;permanence|))
                        (LETT |elt2| (SPADCALL |Lsig| 2 (QREFELT $ 47)) . #2#)
                        (LETT |sig1|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |elt1| |elt2| (QREFELT $ 15))
                                (QREFELT $ 38))
                               (QREFELT $ 39))
                              . #2#)
                        (LETT |List1| (CDR |Lsig|) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |sig1|
                                     (SPADCALL (|spadConstant| $ 11)
                                               (QREFELT $ 23))
                                     (QREFELT $ 41))
                           (|SHP;permanence| |List1| $))
                          (#1# (+ 1 (|SHP;permanence| |List1| $))))))))))) 

(SDEFUN |SHP;qzeros| ((|Lsig| |List| R) ($ |List| R))
        (SEQ
         (SEQ G190
              (COND
               ((NULL
                 (SPADCALL (SPADCALL |Lsig| (QREFELT $ 48))
                           (|spadConstant| $ 20) (QREFELT $ 41)))
                (GO G191)))
              (SEQ
               (EXIT
                (LETT |Lsig| (REVERSE (CDR (REVERSE |Lsig|))) |SHP;qzeros|)))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT |Lsig|))) 

(SDEFUN |SHP;epsil|
        ((|int1| |NonNegativeInteger|) (|elt1| R) (|elt2| R) ($ |Integer|))
        (SPROG
         ((|ct4| (|Integer|)) (|ct3| (|NonNegativeInteger|)) (#1=#:G490 NIL)
          (|ct2| #2=(|Integer|)) (|ct1| #2#))
         (SEQ
          (COND ((OR (EQL |int1| 0) (ODDP |int1|)) 0)
                ('T
                 (SEQ
                  (LETT |ct1|
                        (COND
                         ((SPADCALL |elt1| (|spadConstant| $ 20)
                                    (QREFELT $ 49))
                          1)
                         (#3='T -1))
                        . #4=(|SHP;epsil|))
                  (LETT |ct2|
                        (COND
                         ((SPADCALL |elt2| (|spadConstant| $ 20)
                                    (QREFELT $ 49))
                          1)
                         (#3# -1))
                        . #4#)
                  (LETT |ct3|
                        (PROG2
                            (LETT #1# (SPADCALL |int1| 2 (QREFELT $ 37)) . #4#)
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                          (|Union| (|NonNegativeInteger|)
                                                   "failed")
                                          #1#))
                        . #4#)
                  (LETT |ct4| (* |ct1| |ct2|) . #4#)
                  (EXIT (* (EXPT -1 |ct3|) |ct4|)))))))) 

(SDEFUN |SHP;numbnce| ((|Lsig| |List| R) ($ |NonNegativeInteger|))
        (SPROG ((|eltp| (R)))
               (SEQ
                (COND ((NULL |Lsig|) 0)
                      (#1='T
                       (SEQ
                        (LETT |eltp| (SPADCALL |Lsig| 1 (QREFELT $ 47))
                              |SHP;numbnce|)
                        (EXIT
                         (COND
                          ((SPADCALL |eltp| (|spadConstant| $ 20)
                                     (QREFELT $ 41))
                           0)
                          (#1# (+ 1 (|SHP;numbnce| (CDR |Lsig|) $))))))))))) 

(SDEFUN |SHP;numbce| ((|Lsig| |List| R) ($ |NonNegativeInteger|))
        (SPROG ((|eltp| (R)))
               (SEQ
                (COND ((NULL |Lsig|) 0)
                      (#1='T
                       (SEQ
                        (LETT |eltp| (SPADCALL |Lsig| 1 (QREFELT $ 47))
                              |SHP;numbce|)
                        (EXIT
                         (COND
                          ((SPADCALL |eltp| (|spadConstant| $ 20)
                                     (QREFELT $ 41))
                           (+ 1 (|SHP;numbce| (CDR |Lsig|) $)))
                          (#1# 0))))))))) 

(SDEFUN |SHP;wfunctaux| ((|Lsig| . #1=(|List| R)) ($ |Integer|))
        (SPROG
         ((|ind4| (|Integer|)) (|ind3| (|Integer|)) (|ind2| (|Integer|))
          (|List1| #1#) (#2=#:G506 NIL) (|j| NIL)
          (|cont2| (|NonNegativeInteger|)) (|List2| (|List| R)) (#3=#:G505 NIL)
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
                           (SEQ (LETT |List1| (CDR |List1|) . #4#)
                                (EXIT
                                 (LETT |ind2|
                                       (|SHP;epsil| |cont2|
                                        (SPADCALL |List2| (QREFELT $ 48))
                                        (|SPADfirst| |List1|) $)
                                       . #4#)))
                           (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                           (EXIT NIL))
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
         ((#1=#:G514 NIL) (|p| NIL) (#2=#:G513 NIL)
          (|List1| (|List| (|UnivariatePolynomial| |x| R))))
         (SEQ
          (COND
           ((OR (SPADCALL |p2| (|spadConstant| $ 18) (QREFELT $ 33))
                (EQL (SPADCALL |p1| (QREFELT $ 10)) 0))
            0)
           ('T
            (SEQ
             (LETT |List1| (SPADCALL |p1| |p2| (QREFELT $ 42))
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
                       (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 14)) #2#)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))
               $)))))))) 

(SDEFUN |SHP;countRealRoots;UpI;20|
        ((|p1| |UnivariatePolynomial| |x| R) ($ |Integer|))
        (SPADCALL |p1| (|spadConstant| $ 12) (QREFELT $ 50))) 

(SDEFUN |SHP;SturmHabichtMultiple;2UpI;21|
        ((|p1| |UnivariatePolynomial| |x| R)
         (|p2| |UnivariatePolynomial| |x| R) ($ |Integer|))
        (SPROG
         ((#1=#:G539 NIL) (|f| NIL) (#2=#:G538 NIL)
          (|sqfr|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| (|UnivariatePolynomial| |x| R))
                      (|:| |xpnt| (|Integer|)))))
          (SH (|List| (|UnivariatePolynomial| |x| R))) (|ans| (|Integer|))
          (#3=#:G516 NIL) (#4=#:G536 NIL) (|p| NIL) (#5=#:G537 NIL) (|j| NIL)
          (#6=#:G535 NIL) (|qp| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((OR (SPADCALL |p2| (|spadConstant| $ 18) (QREFELT $ 33))
                (EQL (SPADCALL |p1| (QREFELT $ 10)) 0))
            0)
           ('T
            (SEQ
             (LETT SH (SPADCALL |p1| |p2| (QREFELT $ 42))
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
                                             (QREFELT $ 43))
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
                     (SPADCALL (|SPADfirst| SH) (|spadConstant| $ 18)
                               (QREFELT $ 33)))
                    (GO G191)))
                  (SEQ (EXIT (LETT SH (CDR SH) . #7#))) NIL (GO G190) G191
                  (EXIT NIL))
             (EXIT
              (COND ((EQL (SPADCALL (|SPADfirst| SH) (QREFELT $ 10)) 0) |ans|)
                    ((QEQCAR
                      (SPADCALL (SPADCALL |p1| (QREFELT $ 40)) (|SPADfirst| SH)
                                (QREFELT $ 52))
                      0)
                     (+ |ans| (SPADCALL (|SPADfirst| SH) |p2| (QREFELT $ 53))))
                    ('T
                     (SEQ
                      (LETT |sqfr|
                            (SPADCALL (SPADCALL |p1| (QREFELT $ 55))
                                      (QREFELT $ 60))
                            . #7#)
                      (COND
                       ((EQL (LENGTH |sqfr|) 1)
                        (COND
                         ((EQL (QVELT (|SPADfirst| |sqfr|) 2) 1)
                          (EXIT |ans|)))))
                      (EXIT
                       (SPADCALL (ELT $ 61)
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
                                                             (QREFELT $ 50)))
                                                #2#)
                                               . #7#)))
                                       (LETT #1# (CDR #1#) . #7#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 64))))))))))))) 

(SDEFUN |SHP;countRealRootsMultiple;UpI;22|
        ((|p1| |UnivariatePolynomial| |x| R) ($ |Integer|))
        (SPADCALL |p1| (|spadConstant| $ 12) (QREFELT $ 53))) 

(DECLAIM (NOTINLINE |SturmHabichtPackage;|)) 

(DEFUN |SturmHabichtPackage| (&REST #1=#:G541)
  (SPROG NIL
         (PROG (#2=#:G542)
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
          (LETT $ (GETREFV 66) . #1#)
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
             (QSETREFV $ 53
                       (CONS
                        (|dispatchFunction| |SHP;SturmHabichtMultiple;2UpI;21|)
                        $))
             (QSETREFV $ 65
                       (CONS
                        (|dispatchFunction|
                         |SHP;countRealRootsMultiple;UpI;22|)
                        $)))))
          $))) 

(MAKEPROP '|SturmHabichtPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (|UnivariatePolynomial| 7 6)
              (0 . |degree|) (5 . |One|) (9 . |One|) (13 . |pseudoRemainder|)
              (19 . |leadingCoefficient|) (24 . *) (30 . *) (36 . -)
              (41 . |Zero|) (45 . ^) (51 . |Zero|) (55 . |monomial|) (61 . *)
              (67 . -) (|List| 9) (72 . |last|) (|PositiveInteger|) (77 . ^)
              (|Union| $ '"failed") (83 . |exquo|) '"last" (89 . |elt|)
              (|Boolean|) (95 . =) (|Integer|) (101 . |elt|)
              |SHP;subresultantSequence;2UpL;4| (107 . |exquo|) (113 . |sign|)
              (118 . |coerce|) (123 . |differentiate|) (128 . =)
              |SHP;SturmHabichtSequence;2UpL;9| (134 . |coefficient|)
              (|List| 6) |SHP;SturmHabichtCoefficients;2UpL;10| (140 . |size?|)
              (146 . |elt|) (152 . |last|) (157 . >) |SHP;SturmHabicht;2UpI;19|
              |SHP;countRealRoots;UpI;20| (163 . |exquo|)
              (169 . |SturmHabichtMultiple|) (|Factored| $)
              (175 . |squareFree|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 56) (|:| |fctr| 9) (|:| |xpnt| 34))
              (|List| 57) (|Factored| 9) (180 . |factorList|) (185 . +)
              (|Mapping| 34 34 34) (|List| 34) (191 . |reduce|)
              (197 . |countRealRootsMultiple|))
           '#(|subresultantSequence| 202 |countRealRootsMultiple| 208
              |countRealRoots| 213 |SturmHabichtSequence| 218
              |SturmHabichtMultiple| 224 |SturmHabichtCoefficients| 230
              |SturmHabicht| 236)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 65
                                                 '(1 9 8 0 10 0 6 0 11 0 9 0 12
                                                   2 9 0 0 0 13 1 9 6 0 14 2 6
                                                   0 0 0 15 2 9 0 6 0 16 1 9 0
                                                   0 17 0 9 0 18 2 6 0 0 8 19 0
                                                   6 0 20 2 9 0 6 8 21 2 9 0 0
                                                   0 22 1 6 0 0 23 1 24 9 0 25
                                                   2 6 0 0 26 27 2 9 28 0 6 29
                                                   2 24 9 0 30 31 2 9 32 0 0 33
                                                   2 24 9 0 34 35 2 8 28 0 0 37
                                                   1 6 34 0 38 1 6 0 34 39 1 9
                                                   0 0 40 2 6 32 0 0 41 2 9 6 0
                                                   8 43 2 44 32 0 8 46 2 44 6 0
                                                   34 47 1 44 6 0 48 2 6 32 0 0
                                                   49 2 9 28 0 0 52 2 0 34 9 9
                                                   53 1 9 54 0 55 1 59 58 0 60
                                                   2 34 0 0 0 61 2 63 34 62 0
                                                   64 1 0 34 9 65 2 0 24 9 9 36
                                                   1 1 34 9 65 1 0 34 9 51 2 0
                                                   24 9 9 42 2 1 34 9 9 53 2 0
                                                   44 9 9 45 2 0 34 9 9 50)))))
           '|lookupComplete|)) 
