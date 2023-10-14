
(/VERSIONCHECK 2) 

(DEFUN |SHP;subresultantSequenceBegin| (|p1| |p2| $)
  (PROG (|Lc2| #1=#:G126 |Lc1| |c1| #2=#:G123 |LSubr| |i| |in2| |in1| #3=#:G119
         |Pr| |n| #4=#:G117 |d2| |d1|)
    (RETURN
     (SEQ
      (LETT |d1| (SPADCALL |p1| (QREFELT $ 10))
            . #5=(|SHP;subresultantSequenceBegin|))
      (LETT |d2| (SPADCALL |p2| (QREFELT $ 10)) . #5#)
      (LETT |n|
            (PROG1 (LETT #4# (- |d1| 1) . #5#)
              (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|) #4#))
            . #5#)
      (EXIT
       (COND
        ((EQL |d2| |n|)
         (SEQ (LETT |Pr| (SPADCALL |p1| |p2| (QREFELT $ 13)) . #5#)
              (EXIT (APPEND (LIST |p1| |p2|) (LIST |Pr|)))))
        ((EQL |d2|
              (PROG1 (LETT #3# (- |n| 1) . #5#)
                (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#)))
         (SEQ
          (LETT |Lc1|
                (SPADCALL
                 (SPADCALL (SPADCALL |p1| (QREFELT $ 14))
                           (SPADCALL |p2| (QREFELT $ 14)) (QREFELT $ 15))
                 |p2| (QREFELT $ 16))
                . #5#)
          (LETT |Lc2|
                (SPADCALL
                 (SPADCALL (SPADCALL |p1| (QREFELT $ 14))
                           (SPADCALL |p1| |p2| (QREFELT $ 13)) (QREFELT $ 16))
                 (QREFELT $ 17))
                . #5#)
          (EXIT (APPEND (LIST |p1| |p2|) (LIST |Lc1| |Lc2|)))))
        ('T
         (SEQ (LETT |LSubr| (LIST |p1| |p2|) . #5#)
              (LETT |in1| (+ |d2| 1) . #5#) (LETT |in2| (- |n| 1) . #5#)
              (SEQ (LETT |i| |in1| . #5#) G190 (COND ((> |i| |in2|) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |LSubr|
                           (APPEND |LSubr| (LIST (|spadConstant| $ 18)))
                           . #5#)))
                   (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |c1|
                    (SPADCALL
                     (SPADCALL (SPADCALL |p1| (QREFELT $ 14))
                               (SPADCALL |p2| (QREFELT $ 14)) (QREFELT $ 15))
                     (PROG1 (LETT #2# (- |n| |d2|) . #5#)
                       (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                        #2#))
                     (QREFELT $ 19))
                    . #5#)
              (LETT |Lc1|
                    (SPADCALL (SPADCALL |c1| 0 (QREFELT $ 21)) |p2|
                              (QREFELT $ 22))
                    . #5#)
              (LETT |Lc2|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |p1| (QREFELT $ 14)) (QREFELT $ 23))
                      (PROG1 (LETT #1# (- |n| |d2|) . #5#)
                        (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                         #1#))
                      (QREFELT $ 19))
                     (SPADCALL |p1| |p2| (QREFELT $ 13)) (QREFELT $ 16))
                    . #5#)
              (EXIT (APPEND |LSubr| (LIST |Lc1| |Lc2|))))))))))) 

(DEFUN |SHP;subresultantSequenceNext| (|LcsI| $)
  (PROG (|LSub| #1=#:G188 |k| |pr2| #2=#:G133 #3=#:G183 |pr1| #4=#:G178
         #5=#:G176 |c1| |in1| #6=#:G131 |d2| |d1| |p1| |p2|)
    (RETURN
     (SEQ
      (LETT |p2| (SPADCALL |LcsI| (QREFELT $ 25))
            . #7=(|SHP;subresultantSequenceNext|))
      (LETT |p1| (|SPADfirst| (CDR (REVERSE |LcsI|))) . #7#)
      (LETT |d1| (SPADCALL |p1| (QREFELT $ 10)) . #7#)
      (LETT |d2| (SPADCALL |p2| (QREFELT $ 10)) . #7#)
      (LETT |in1|
            (PROG1 (LETT #6# (- |d1| 1) . #7#)
              (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|) #6#))
            . #7#)
      (EXIT
       (COND
        ((EQL |d2| |in1|)
         (SEQ
          (LETT |pr1|
                (PROG2
                    (LETT #2#
                          (SPADCALL (SPADCALL |p1| |p2| (QREFELT $ 13))
                                    (SPADCALL (SPADCALL |p1| (QREFELT $ 14)) 2
                                              (QREFELT $ 27))
                                    (QREFELT $ 29))
                          . #7#)
                    (QCDR #2#)
                  (|check_union| (QEQCAR #2# 0)
                                 (|UnivariatePolynomial| (QREFELT $ 7)
                                                         (QREFELT $ 6))
                                 #2#))
                . #7#)
          (EXIT (APPEND |LcsI| (LIST |pr1|)))))
        ((< |d2| |in1|)
         (SEQ (LETT |c1| (SPADCALL |p1| (QREFELT $ 14)) . #7#)
              (LETT |pr1|
                    (PROG2
                        (LETT #2#
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |p2| (QREFELT $ 14))
                                          (PROG1
                                              (LETT #5# (- |in1| |d2|) . #7#)
                                            (|check_subtype| (>= #5# 0)
                                                             '(|NonNegativeInteger|)
                                                             #5#))
                                          (QREFELT $ 19))
                                |p2| (QREFELT $ 16))
                               (SPADCALL |c1|
                                         (PROG1 (LETT #4# (- |in1| |d2|) . #7#)
                                           (|check_subtype| (>= #4# 0)
                                                            '(|NonNegativeInteger|)
                                                            #4#))
                                         (QREFELT $ 19))
                               (QREFELT $ 29))
                              . #7#)
                        (QCDR #2#)
                      (|check_union| (QEQCAR #2# 0)
                                     (|UnivariatePolynomial| (QREFELT $ 7)
                                                             (QREFELT $ 6))
                                     #2#))
                    . #7#)
              (LETT |pr2|
                    (PROG2
                        (LETT #2#
                              (SPADCALL (SPADCALL |p1| |p2| (QREFELT $ 13))
                                        (SPADCALL
                                         (SPADCALL |c1| (QREFELT $ 23))
                                         (PROG1
                                             (LETT #3# (+ (- |in1| |d2|) 2)
                                                   . #7#)
                                           (|check_subtype| (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            #3#))
                                         (QREFELT $ 19))
                                        (QREFELT $ 29))
                              . #7#)
                        (QCDR #2#)
                      (|check_union| (QEQCAR #2# 0)
                                     (|UnivariatePolynomial| (QREFELT $ 7)
                                                             (QREFELT $ 6))
                                     #2#))
                    . #7#)
              (LETT |LSub| (LIST |pr1| |pr2|) . #7#)
              (SEQ (LETT |k| (+ |d2| 1) . #7#) (LETT #1# (- |in1| 1) . #7#)
                   G190 (COND ((> |k| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |LSub| (APPEND (LIST (|spadConstant| $ 18)) |LSub|)
                           . #7#)))
                   (LETT |k| (+ |k| 1) . #7#) (GO G190) G191 (EXIT NIL))
              (EXIT (APPEND |LcsI| |LSub|)))))))))) 

(DEFUN |SHP;subresultantSequenceInner| (|p1| |p2| $)
  (PROG (|Lin| #1=#:G196 |j| |indf|)
    (RETURN
     (SEQ
      (LETT |Lin| (|SHP;subresultantSequenceBegin| |p1| |p2| $)
            . #2=(|SHP;subresultantSequenceInner|))
      (LETT |indf|
            (COND
             ((SPADCALL (SPADCALL |Lin| '|last| (QREFELT $ 31))
                        (|spadConstant| $ 18) (QREFELT $ 33))
              0)
             ('T
              (SPADCALL (SPADCALL |Lin| '|last| (QREFELT $ 31))
                        (QREFELT $ 10))))
            . #2#)
      (SEQ G190 (COND ((NULL (COND ((EQL |indf| 0) 'NIL) ('T 'T))) (GO G191)))
           (SEQ (LETT |Lin| (|SHP;subresultantSequenceNext| |Lin| $) . #2#)
                (EXIT
                 (LETT |indf|
                       (COND
                        ((SPADCALL (SPADCALL |Lin| '|last| (QREFELT $ 31))
                                   (|spadConstant| $ 18) (QREFELT $ 33))
                         0)
                        ('T
                         (SPADCALL (SPADCALL |Lin| '|last| (QREFELT $ 31))
                                   (QREFELT $ 10))))
                       . #2#)))
           NIL (GO G190) G191 (EXIT NIL))
      (SEQ (LETT |j| (LENGTH |Lin|) . #2#)
           (LETT #1# (SPADCALL |p1| (QREFELT $ 10)) . #2#) G190
           (COND ((> |j| #1#) (GO G191)))
           (SEQ
            (EXIT
             (LETT |Lin| (APPEND |Lin| (LIST (|spadConstant| $ 18))) . #2#)))
           (LETT |j| (+ |j| 1) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |Lin|))))) 

(DEFUN |SHP;subresultantSequence;2UpL;4| (|p1| |p2| $)
  (PROG (|List2| |Pr1| #1=#:G203 #2=#:G201 |Pr0| #3=#:G209 |j| |c1| |List1| |q|
         |p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |p1| (QREFELT $ 10))
            . #4=(|SHP;subresultantSequence;2UpL;4|))
      (LETT |q| (SPADCALL |p2| (QREFELT $ 10)) . #4#)
      (LETT |List1| (|SHP;subresultantSequenceInner| |p1| |p2| $) . #4#)
      (LETT |List2| (LIST |p1| |p2|) . #4#)
      (LETT |c1| (SPADCALL |p1| (QREFELT $ 14)) . #4#)
      (SEQ (LETT |j| 3 . #4#) (LETT #3# (LENGTH |List1|) . #4#) G190
           (COND ((> |j| #3#) (GO G191)))
           (SEQ (LETT |Pr0| (SPADCALL |List1| |j| (QREFELT $ 35)) . #4#)
                (LETT |Pr1|
                      (PROG2
                          (LETT #1#
                                (SPADCALL |Pr0|
                                          (SPADCALL |c1|
                                                    (PROG1
                                                        (LETT #2#
                                                              (- (- |p| |q|) 1)
                                                              . #4#)
                                                      (|check_subtype|
                                                       (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       #2#))
                                                    (QREFELT $ 19))
                                          (QREFELT $ 29))
                                . #4#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0)
                                       (|UnivariatePolynomial| (QREFELT $ 7)
                                                               (QREFELT $ 6))
                                       #1#))
                      . #4#)
                (EXIT (LETT |List2| (APPEND |List2| (LIST |Pr1|)) . #4#)))
           (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT |List2|))))) 

(DEFUN |SHP;delta| (|int1| $)
  (PROG (#1=#:G211)
    (RETURN
     (SPADCALL (SPADCALL (|spadConstant| $ 11) (QREFELT $ 23))
               (PROG2
                   (LETT #1#
                         (SPADCALL (* |int1| (+ |int1| 1)) 2 (QREFELT $ 37))
                         |SHP;delta|)
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 0) (|NonNegativeInteger|) #1#))
               (QREFELT $ 19))))) 

(DEFUN |SHP;polsth1| (|p1| |p| |p2| |q| |c1| $)
  (PROG (|List2| |Pr6| #1=#:G343 #2=#:G342 #3=#:G349 |j| |List1| |Listf|
         #4=#:G348 |Pr5| #5=#:G330 #6=#:G328 |Pr4| #7=#:G240 |Pr3| #8=#:G228
         |r| |c2| |Pr2| #9=#:G215 |Pr1| |sc1|)
    (RETURN
     (SEQ
      (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 38)) (QREFELT $ 39))
            . #10=(|SHP;polsth1|))
      (LETT |Pr1|
            (SPADCALL
             (SPADCALL (SPADCALL |p1| (QREFELT $ 40)) |p2| (QREFELT $ 22)) |p1|
             (QREFELT $ 13))
            . #10#)
      (LETT |Pr2|
            (PROG2
                (LETT #9#
                      (SPADCALL |Pr1| (SPADCALL |c1| |q| (QREFELT $ 19))
                                (QREFELT $ 29))
                      . #10#)
                (QCDR #9#)
              (|check_union| (QEQCAR #9# 0)
                             (|UnivariatePolynomial| (QREFELT $ 7)
                                                     (QREFELT $ 6))
                             #9#))
            . #10#)
      (LETT |c2| (SPADCALL |Pr2| (QREFELT $ 14)) . #10#)
      (LETT |r| (SPADCALL |Pr2| (QREFELT $ 10)) . #10#)
      (LETT |Pr3|
            (SPADCALL
             (SPADCALL
              (SPADCALL |sc1|
                        (PROG1 (LETT #8# (- (- |p| |r|) 1) . #10#)
                          (|check_subtype| (>= #8# 0) '(|NonNegativeInteger|)
                                           #8#))
                        (QREFELT $ 19))
              0 (QREFELT $ 21))
             |p1| (QREFELT $ 22))
            . #10#)
      (LETT |Pr4|
            (SPADCALL
             (SPADCALL
              (SPADCALL |sc1|
                        (PROG1 (LETT #7# (- (- |p| |r|) 1) . #10#)
                          (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|)
                                           #7#))
                        (QREFELT $ 19))
              0 (QREFELT $ 21))
             |Pr2| (QREFELT $ 22))
            . #10#)
      (LETT |Listf| (LIST |Pr3| |Pr4|) . #10#)
      (COND
       ((< |r| (- |p| 1))
        (SEQ
         (LETT |Pr5|
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (|SHP;delta|
                   (PROG1 (LETT #6# (- (- |p| |r|) 1) . #10#)
                     (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|) #6#))
                   $)
                  (SPADCALL |c2|
                            (PROG1 (LETT #5# (- (- |p| |r|) 1) . #10#)
                              (|check_subtype| (>= #5# 0)
                                               '(|NonNegativeInteger|) #5#))
                            (QREFELT $ 19))
                  (QREFELT $ 15))
                 0 (QREFELT $ 21))
                |Pr2| (QREFELT $ 22))
               . #10#)
         (SEQ (LETT |j| (+ |r| 1) . #10#) (LETT #4# (- |p| 2) . #10#) G190
              (COND ((> |j| #4#) (GO G191)))
              (SEQ
               (EXIT
                (LETT |Listf| (APPEND |Listf| (LIST (|spadConstant| $ 18)))
                      . #10#)))
              (LETT |j| (+ |j| 1) . #10#) (GO G190) G191 (EXIT NIL))
         (EXIT (LETT |Listf| (APPEND |Listf| (LIST |Pr5|)) . #10#)))))
      (COND
       ((SPADCALL |Pr1| (|spadConstant| $ 18) (QREFELT $ 33))
        (LETT |List1| |Listf| . #10#))
       ('T (LETT |List1| (SPADCALL |p1| |Pr2| (QREFELT $ 36)) . #10#)))
      (LETT |List2| NIL . #10#)
      (SEQ (LETT |j| 0 . #10#) (LETT #3# (- |r| 1) . #10#) G190
           (COND ((|greater_SI| |j| #3#) (GO G191)))
           (SEQ
            (LETT |Pr6|
                  (SPADCALL
                   (SPADCALL
                    (|SHP;delta|
                     (PROG1 (LETT #2# (- (- |p| |j|) 1) . #10#)
                       (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                        #2#))
                     $)
                    0 (QREFELT $ 21))
                   (SPADCALL |List1|
                             (PROG1 (LETT #1# (+ (- |p| |j|) 1) . #10#)
                               (|check_subtype| (>= #1# 0)
                                                '(|NonNegativeInteger|) #1#))
                             (QREFELT $ 35))
                   (QREFELT $ 22))
                  . #10#)
            (EXIT (LETT |List2| (APPEND (LIST |Pr6|) |List2|) . #10#)))
           (LETT |j| (|inc_SI| |j|) . #10#) (GO G190) G191 (EXIT NIL))
      (EXIT (APPEND |Listf| |List2|)))))) 

(DEFUN |SHP;polsth2| (|p1| |p| |p2| |q| |c1| $)
  (PROG (|List2| |Pr5| #1=#:G361 |Pr4| #2=#:G359 #3=#:G358 #4=#:G367 |j|
         |List1| |Listf| |Pr3| |Pr2| |Pr1| |sc1|)
    (RETURN
     (SEQ
      (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 38)) (QREFELT $ 39))
            . #5=(|SHP;polsth2|))
      (LETT |Pr1|
            (SPADCALL (SPADCALL |sc1| 0 (QREFELT $ 21)) |p1| (QREFELT $ 22))
            . #5#)
      (LETT |Pr2| (SPADCALL (SPADCALL |p1| (QREFELT $ 40)) |p2| (QREFELT $ 22))
            . #5#)
      (LETT |Pr3|
            (SPADCALL (SPADCALL |sc1| 0 (QREFELT $ 21)) |Pr2| (QREFELT $ 22))
            . #5#)
      (LETT |Listf| (LIST |Pr1| |Pr3|) . #5#)
      (LETT |List1| (SPADCALL |p1| |Pr2| (QREFELT $ 36)) . #5#)
      (LETT |List2| NIL . #5#)
      (SEQ (LETT |j| 0 . #5#) (LETT #4# (- |p| 2) . #5#) G190
           (COND ((|greater_SI| |j| #4#) (GO G191)))
           (SEQ
            (LETT |Pr4|
                  (SPADCALL
                   (SPADCALL
                    (|SHP;delta|
                     (PROG1 (LETT #3# (- (- |p| |j|) 1) . #5#)
                       (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                        #3#))
                     $)
                    0 (QREFELT $ 21))
                   (SPADCALL |List1|
                             (PROG1 (LETT #2# (+ (- |p| |j|) 1) . #5#)
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             (QREFELT $ 35))
                   (QREFELT $ 22))
                  . #5#)
            (LETT |Pr5|
                  (PROG2 (LETT #1# (SPADCALL |Pr4| |c1| (QREFELT $ 29)) . #5#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0)
                                   (|UnivariatePolynomial| (QREFELT $ 7)
                                                           (QREFELT $ 6))
                                   #1#))
                  . #5#)
            (EXIT (LETT |List2| (APPEND (LIST |Pr5|) |List2|) . #5#)))
           (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191 (EXIT NIL))
      (EXIT (APPEND |Listf| |List2|)))))) 

(DEFUN |SHP;polsth3| (|p1| |p| |p2| |q| |c1| $)
  (PROG (|List2| |Pr3| #1=#:G382 |Pr2| #2=#:G380 #3=#:G379 #4=#:G388 #5=#:G370
         |j| |List1| |Listf| |Pr1| |v| |q1| #6=#:G368 |sc1|)
    (RETURN
     (SEQ
      (LETT |sc1| (SPADCALL (SPADCALL |c1| (QREFELT $ 38)) (QREFELT $ 39))
            . #7=(|SHP;polsth3|))
      (LETT |q1|
            (PROG1 (LETT #6# (- |q| 1) . #7#)
              (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|) #6#))
            . #7#)
      (LETT |v| (+ |p| |q1|) . #7#)
      (LETT |Pr1|
            (SPADCALL
             (SPADCALL
              (SPADCALL (|SHP;delta| |q1| $)
                        (SPADCALL |sc1| (+ |q| 1) (QREFELT $ 19))
                        (QREFELT $ 15))
              0 (QREFELT $ 21))
             |p1| (QREFELT $ 22))
            . #7#)
      (LETT |Listf| (LIST |Pr1|) . #7#)
      (LETT |List1|
            (SPADCALL
             (SPADCALL (SPADCALL |p1| (QREFELT $ 40)) |p2| (QREFELT $ 22)) |p1|
             (QREFELT $ 36))
            . #7#)
      (LETT |List2| NIL . #7#)
      (SEQ (LETT |j| 0 . #7#)
           (LETT #4#
                 (PROG1 (LETT #5# (- |p| 1) . #7#)
                   (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                 . #7#)
           G190 (COND ((|greater_SI| |j| #4#) (GO G191)))
           (SEQ
            (LETT |Pr2|
                  (SPADCALL
                   (SPADCALL
                    (|SHP;delta|
                     (PROG1 (LETT #3# (- |v| |j|) . #7#)
                       (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                        #3#))
                     $)
                    0 (QREFELT $ 21))
                   (SPADCALL |List1|
                             (PROG1 (LETT #2# (+ (- |v| |j|) 1) . #7#)
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             (QREFELT $ 35))
                   (QREFELT $ 22))
                  . #7#)
            (LETT |Pr3|
                  (PROG2 (LETT #1# (SPADCALL |Pr2| |c1| (QREFELT $ 29)) . #7#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0)
                                   (|UnivariatePolynomial| (QREFELT $ 7)
                                                           (QREFELT $ 6))
                                   #1#))
                  . #7#)
            (EXIT (LETT |List2| (APPEND (LIST |Pr3|) |List2|) . #7#)))
           (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT (APPEND |Listf| |List2|)))))) 

(DEFUN |SHP;SturmHabichtSequence;2UpL;9| (|p1| |p2| $)
  (PROG (|c1| |q| |p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |p1| (QREFELT $ 10))
            . #1=(|SHP;SturmHabichtSequence;2UpL;9|))
      (LETT |q| (SPADCALL |p2| (QREFELT $ 10)) . #1#)
      (LETT |c1| (SPADCALL |p1| (QREFELT $ 14)) . #1#)
      (COND
       ((OR (SPADCALL |c1| (|spadConstant| $ 11) (QREFELT $ 41)) (EQL |q| 1))
        (EXIT (|SHP;polsth1| |p1| |p| |p2| |q| |c1| $))))
      (EXIT
       (COND ((EQL |q| 0) (|SHP;polsth2| |p1| |p| |p2| |q| |c1| $))
             ('T (|SHP;polsth3| |p1| |p| |p2| |q| |c1| $)))))))) 

(DEFUN |SHP;SturmHabichtCoefficients;2UpL;10| (|p1| |p2| $)
  (PROG (#1=#:G391 #2=#:G396 |p| |j| #3=#:G395 |qp| |List1|)
    (RETURN
     (SEQ
      (LETT |List1| (SPADCALL |p1| |p2| (QREFELT $ 42))
            . #4=(|SHP;SturmHabichtCoefficients;2UpL;10|))
      (LETT |qp| (LENGTH |List1|) . #4#)
      (EXIT
       (PROGN
        (LETT #3# NIL . #4#)
        (SEQ (LETT |j| 1 . #4#) (LETT |p| NIL . #4#) (LETT #2# |List1| . #4#)
             G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #4#) NIL)
                   (|greater_SI| |j| |qp|))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #3#
                     (CONS
                      (SPADCALL |p|
                                (PROG1 (LETT #1# (- |qp| |j|) . #4#)
                                  (|check_subtype| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   #1#))
                                (QREFELT $ 43))
                      #3#)
                     . #4#)))
             (LETT #2# (PROG1 (CDR #2#) (LETT |j| (|inc_SI| |j|) . #4#)) . #4#)
             (GO G190) G191 (EXIT (NREVERSE #3#))))))))) 

(DEFUN |SHP;variation| (|Lsig| $)
  (PROG (|List1| |sig1| |elt2| |elt1|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |Lsig| 1 (QREFELT $ 46)) 0)
            (#1='T
             (SEQ (LETT |elt1| (|SPADfirst| |Lsig|) . #2=(|SHP;variation|))
                  (LETT |elt2| (SPADCALL |Lsig| 2 (QREFELT $ 47)) . #2#)
                  (LETT |sig1|
                        (SPADCALL
                         (SPADCALL (SPADCALL |elt1| |elt2| (QREFELT $ 15))
                                   (QREFELT $ 38))
                         (QREFELT $ 39))
                        . #2#)
                  (LETT |List1| (CDR |Lsig|) . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL |sig1| (|spadConstant| $ 11) (QREFELT $ 41))
                     (|SHP;variation| |List1| $))
                    (#1# (+ 1 (|SHP;variation| |List1| $)))))))))))) 

(DEFUN |SHP;permanence| (|Lsig| $)
  (PROG (|List1| |sig1| |elt2| |elt1|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |Lsig| 1 (QREFELT $ 46)) 0)
            (#1='T
             (SEQ (LETT |elt1| (|SPADfirst| |Lsig|) . #2=(|SHP;permanence|))
                  (LETT |elt2| (SPADCALL |Lsig| 2 (QREFELT $ 47)) . #2#)
                  (LETT |sig1|
                        (SPADCALL
                         (SPADCALL (SPADCALL |elt1| |elt2| (QREFELT $ 15))
                                   (QREFELT $ 38))
                         (QREFELT $ 39))
                        . #2#)
                  (LETT |List1| (CDR |Lsig|) . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL |sig1|
                               (SPADCALL (|spadConstant| $ 11) (QREFELT $ 23))
                               (QREFELT $ 41))
                     (|SHP;permanence| |List1| $))
                    (#1# (+ 1 (|SHP;permanence| |List1| $)))))))))))) 

(DEFUN |SHP;qzeros| (|Lsig| $)
  (SEQ
   (SEQ G190
        (COND
         ((NULL
           (SPADCALL (SPADCALL |Lsig| (QREFELT $ 48)) (|spadConstant| $ 20)
                     (QREFELT $ 41)))
          (GO G191)))
        (SEQ
         (EXIT (LETT |Lsig| (REVERSE (CDR (REVERSE |Lsig|))) |SHP;qzeros|)))
        NIL (GO G190) G191 (EXIT NIL))
   (EXIT |Lsig|))) 

(DEFUN |SHP;epsil| (|int1| |elt1| |elt2| $)
  (PROG (|ct4| |ct3| #1=#:G407 |ct2| |ct1|)
    (RETURN
     (SEQ
      (COND ((OR (EQL |int1| 0) (ODDP |int1|)) 0)
            ('T
             (SEQ
              (LETT |ct1|
                    (COND
                     ((SPADCALL |elt1| (|spadConstant| $ 20) (QREFELT $ 49)) 1)
                     (#2='T -1))
                    . #3=(|SHP;epsil|))
              (LETT |ct2|
                    (COND
                     ((SPADCALL |elt2| (|spadConstant| $ 20) (QREFELT $ 49)) 1)
                     (#2# -1))
                    . #3#)
              (LETT |ct3|
                    (PROG2 (LETT #1# (SPADCALL |int1| 2 (QREFELT $ 37)) . #3#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                     #1#))
                    . #3#)
              (LETT |ct4| (* |ct1| |ct2|) . #3#)
              (EXIT (* (EXPT -1 |ct3|) |ct4|))))))))) 

(DEFUN |SHP;numbnce| (|Lsig| $)
  (PROG (|eltp|)
    (RETURN
     (SEQ
      (COND ((NULL |Lsig|) 0)
            (#1='T
             (SEQ
              (LETT |eltp| (SPADCALL |Lsig| 1 (QREFELT $ 47)) |SHP;numbnce|)
              (EXIT
               (COND ((SPADCALL |eltp| (|spadConstant| $ 20) (QREFELT $ 41)) 0)
                     (#1# (+ 1 (|SHP;numbnce| (CDR |Lsig|) $)))))))))))) 

(DEFUN |SHP;numbce| (|Lsig| $)
  (PROG (|eltp|)
    (RETURN
     (SEQ
      (COND ((NULL |Lsig|) 0)
            (#1='T
             (SEQ (LETT |eltp| (SPADCALL |Lsig| 1 (QREFELT $ 47)) |SHP;numbce|)
                  (EXIT
                   (COND
                    ((SPADCALL |eltp| (|spadConstant| $ 20) (QREFELT $ 41))
                     (+ 1 (|SHP;numbce| (CDR |Lsig|) $)))
                    (#1# 0)))))))))) 

(DEFUN |SHP;wfunctaux| (|Lsig| $)
  (PROG (|ind4| |ind3| |ind2| |List1| |j| |cont2| |List2| |cont1|)
    (RETURN
     (SEQ
      (COND ((NULL |Lsig|) 0)
            ('T
             (SEQ (LETT |List2| NIL . #1=(|SHP;wfunctaux|))
                  (LETT |List1| |Lsig| . #1#)
                  (LETT |cont1| (|SHP;numbnce| |List1| $) . #1#)
                  (SEQ (LETT |j| 1 . #1#) G190
                       (COND ((|greater_SI| |j| |cont1|) (GO G191)))
                       (SEQ
                        (LETT |List2|
                              (APPEND |List2| (LIST (|SPADfirst| |List1|)))
                              . #1#)
                        (EXIT (LETT |List1| (CDR |List1|) . #1#)))
                       (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                       (EXIT NIL))
                  (LETT |ind2| 0 . #1#)
                  (LETT |cont2| (|SHP;numbce| |List1| $) . #1#)
                  (SEQ (LETT |j| 1 . #1#) G190
                       (COND ((|greater_SI| |j| |cont2|) (GO G191)))
                       (SEQ (LETT |List1| (CDR |List1|) . #1#)
                            (EXIT
                             (LETT |ind2|
                                   (|SHP;epsil| |cont2|
                                    (SPADCALL |List2| (QREFELT $ 48))
                                    (|SPADfirst| |List1|) $)
                                   . #1#)))
                       (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                       (EXIT NIL))
                  (LETT |ind3|
                        (- (|SHP;permanence| |List2| $)
                           (|SHP;variation| |List2| $))
                        . #1#)
                  (LETT |ind4| (+ |ind2| |ind3|) . #1#)
                  (EXIT (+ |ind4| (|SHP;wfunctaux| |List1| $)))))))))) 

(DEFUN |SHP;wfunct| (|Lsig| $)
  (PROG (|List1|)
    (RETURN
     (SEQ (LETT |List1| (|SHP;qzeros| |Lsig| $) |SHP;wfunct|)
          (EXIT (|SHP;wfunctaux| |List1| $)))))) 

(DEFUN |SHP;SturmHabicht;2UpI;19| (|p1| |p2| $)
  (PROG (#1=#:G424 #2=#:G430 |p| |j| #3=#:G429 |qp| |List1|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |p2| (|spadConstant| $ 18) (QREFELT $ 33))
            (EQL (SPADCALL |p1| (QREFELT $ 10)) 0))
        0)
       ('T
        (SEQ
         (LETT |List1| (SPADCALL |p1| |p2| (QREFELT $ 42))
               . #4=(|SHP;SturmHabicht;2UpI;19|))
         (LETT |qp| (LENGTH |List1|) . #4#)
         (EXIT
          (|SHP;wfunct|
           (PROGN
            (LETT #3# NIL . #4#)
            (SEQ (LETT |j| 1 . #4#) (LETT |p| NIL . #4#)
                 (LETT #2# |List1| . #4#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #4#) NIL)
                       (|greater_SI| |j| |qp|))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #3#
                         (CONS
                          (SPADCALL |p|
                                    (PROG1 (LETT #1# (- |qp| |j|) . #4#)
                                      (|check_subtype| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       #1#))
                                    (QREFELT $ 43))
                          #3#)
                         . #4#)))
                 (LETT #2# (PROG1 (CDR #2#) (LETT |j| (|inc_SI| |j|) . #4#))
                       . #4#)
                 (GO G190) G191 (EXIT (NREVERSE #3#))))
           $))))))))) 

(DEFUN |SHP;countRealRoots;UpI;20| (|p1| $)
  (SPADCALL |p1| (|spadConstant| $ 12) (QREFELT $ 50))) 

(DEFUN |SHP;SturmHabichtMultiple;2UpI;21| (|p1| |p2| $)
  (PROG (#1=#:G454 |f| #2=#:G453 |sqfr| SH |ans| #3=#:G432 #4=#:G452 |p| |j|
         #5=#:G451 |qp|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |p2| (|spadConstant| $ 18) (QREFELT $ 33))
            (EQL (SPADCALL |p1| (QREFELT $ 10)) 0))
        0)
       ('T
        (SEQ
         (LETT SH (SPADCALL |p1| |p2| (QREFELT $ 42))
               . #6=(|SHP;SturmHabichtMultiple;2UpI;21|))
         (LETT |qp| (LENGTH SH) . #6#)
         (LETT |ans|
               (|SHP;wfunct|
                (PROGN
                 (LETT #5# NIL . #6#)
                 (SEQ (LETT |j| 1 . #6#) (LETT |p| NIL . #6#)
                      (LETT #4# SH . #6#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #6#) NIL)
                            (|greater_SI| |j| |qp|))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5#
                              (CONS
                               (SPADCALL |p|
                                         (PROG1 (LETT #3# (- |qp| |j|) . #6#)
                                           (|check_subtype| (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            #3#))
                                         (QREFELT $ 43))
                               #5#)
                              . #6#)))
                      (LETT #4#
                            (PROG1 (CDR #4#) (LETT |j| (|inc_SI| |j|) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT (NREVERSE #5#))))
                $)
               . #6#)
         (LETT SH (REVERSE SH) . #6#)
         (SEQ G190
              (COND
               ((NULL
                 (SPADCALL (|SPADfirst| SH) (|spadConstant| $ 18)
                           (QREFELT $ 33)))
                (GO G191)))
              (SEQ (EXIT (LETT SH (CDR SH) . #6#))) NIL (GO G190) G191
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
                        . #6#)
                  (COND
                   ((EQL (LENGTH |sqfr|) 1)
                    (COND
                     ((EQL (QVELT (|SPADfirst| |sqfr|) 2) 1) (EXIT |ans|)))))
                  (EXIT
                   (SPADCALL (ELT $ 61)
                             (PROGN
                              (LETT #2# NIL . #6#)
                              (SEQ (LETT |f| NIL . #6#) (LETT #1# |sqfr| . #6#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |f| (CAR #1#) . #6#)
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
                                           . #6#)))
                                   (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT $ 64)))))))))))))) 

(DEFUN |SHP;countRealRootsMultiple;UpI;22| (|p1| $)
  (SPADCALL |p1| (|spadConstant| $ 12) (QREFELT $ 53))) 

(DECLAIM (NOTINLINE |SturmHabichtPackage;|)) 

(DEFUN |SturmHabichtPackage| (&REST #1=#:G456)
  (PROG ()
    (RETURN
     (PROG (#2=#:G457)
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
              (HREM |$ConstructorCache| '|SturmHabichtPackage|))))))))))) 

(DEFUN |SturmHabichtPackage;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
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
                                          (|HasCategory| |#1| '(|GcdDomain|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|SturmHabichtPackage| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 53
                   (CONS
                    (|dispatchFunction| |SHP;SturmHabichtMultiple;2UpI;21|) $))
         (QSETREFV $ 65
                   (CONS
                    (|dispatchFunction| |SHP;countRealRootsMultiple;UpI;22|)
                    $)))))
      $)))) 

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
