
(DEFUN |PGCD;failtest| (|f| |p1| |p2| $)
  (COND ((QEQCAR (SPADCALL |p1| |f| (QREFELT $ 19)) 1) 'T)
        ('T (QEQCAR (SPADCALL |p2| |f| (QREFELT $ 19)) 1)))) 

(DEFUN |PGCD;chooseVal| (|p1| |p2| |lvr| |ltry| $)
  (PROG (|dd| #1=#:G164 #2=#:G156 |f| #3=#:G153 |uterm| |ugcd| #4=#:G147 |du|
         |u| |uf2| |uf1| |lval| |i| #5=#:G165 |range| |nvr| |d2| |d1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |d1| (SPADCALL |p1| (QREFELT $ 21)) . #6=(|PGCD;chooseVal|))
            (LETT |d2| (SPADCALL |p2| (QREFELT $ 21)) . #6#)
            (LETT |dd| 0 . #6#) (LETT |nvr| (LENGTH |lvr|) . #6#)
            (LETT |lval| NIL . #6#) (LETT |range| 8 . #6#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ (LETT |range| (SPADCALL 2 |range| (QREFELT $ 22)) . #6#)
                       (LETT |lval|
                             (PROGN
                              (LETT #5# NIL . #6#)
                              (SEQ (LETT |i| 1 . #6#) G190
                                   (COND ((|greater_SI| |i| |nvr|) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #5#
                                           (CONS
                                            (SPADCALL |range| (QREFELT $ 24))
                                            #5#)
                                           . #6#)))
                                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190)
                                   G191 (EXIT (NREVERSE #5#))))
                             . #6#)
                       (EXIT
                        (COND
                         ((SPADCALL |lval| |ltry| (QREFELT $ 28)) "new point")
                         ('T
                          (SEQ (LETT |ltry| (CONS |lval| |ltry|) . #6#)
                               (LETT |uf1|
                                     (SPADCALL |p1| |lvr| |lval|
                                               (QREFELT $ 31))
                                     . #6#)
                               (EXIT
                                (COND
                                 ((SPADCALL (SPADCALL |uf1| (QREFELT $ 32))
                                            |d1| (QREFELT $ 33))
                                  "new point")
                                 ('T
                                  (SEQ
                                   (LETT |uf2|
                                         (SPADCALL |p2| |lvr| |lval|
                                                   (QREFELT $ 31))
                                         . #6#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL (SPADCALL |uf2| (QREFELT $ 32))
                                                |d2| (QREFELT $ 33))
                                      "new point")
                                     ('T
                                      (SEQ
                                       (LETT |u|
                                             (SPADCALL |uf1| |uf2|
                                                       (QREFELT $ 34))
                                             . #6#)
                                       (LETT |du| (SPADCALL |u| (QREFELT $ 32))
                                             . #6#)
                                       (COND
                                        ((EQL |du| 0)
                                         (PROGN
                                          (LETT #1#
                                                (CONS 0
                                                      (VECTOR
                                                       (LIST
                                                        (|spadConstant| $ 37))
                                                       |ltry|
                                                       (|spadConstant| $ 38)))
                                                . #6#)
                                          (GO #1#))))
                                       (LETT |ugcd|
                                             (LIST |u|
                                                   (PROG2
                                                       (LETT #4#
                                                             (SPADCALL |uf1|
                                                                       |u|
                                                                       (QREFELT
                                                                        $ 39))
                                                             . #6#)
                                                       (QCDR #4#)
                                                     (|check_union|
                                                      (QEQCAR #4# 0)
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT $ 8))
                                                      #4#))
                                                   (PROG2
                                                       (LETT #4#
                                                             (SPADCALL |uf2|
                                                                       |u|
                                                                       (QREFELT
                                                                        $ 39))
                                                             . #6#)
                                                       (QCDR #4#)
                                                     (|check_union|
                                                      (QEQCAR #4# 0)
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT $ 8))
                                                      #4#)))
                                             . #6#)
                                       (LETT |uterm|
                                             (VECTOR |ugcd| |ltry|
                                                     (|spadConstant| $ 38))
                                             . #6#)
                                       (EXIT
                                        (COND
                                         ((EQL |dd| 0) (LETT |dd| |du| . #6#))
                                         ((EQL |du| |dd|)
                                          (COND
                                           ((EQL |dd| |d1|)
                                            (SEQ
                                             (SEQ
                                              (LETT |f|
                                                    (SPADCALL |p2| |p1|
                                                              (QREFELT $ 19))
                                                    . #6#)
                                              (EXIT
                                               (COND
                                                ((NULL (QEQCAR |f| 1))
                                                 (PROGN
                                                  (LETT #1#
                                                        (CONS 0
                                                              (VECTOR
                                                               (LIST |u|)
                                                               |ltry| |p1|))
                                                        . #6#)
                                                  (GO #1#))))))
                                             (EXIT
                                              (COND
                                               ((SPADCALL |dd| |d2|
                                                          (QREFELT $ 33))
                                                (LETT |dd|
                                                      (PROG1
                                                          (LETT #3# (- |dd| 1)
                                                                . #6#)
                                                        (|check_subtype|
                                                         (>= #3# 0)
                                                         '(|NonNegativeInteger|)
                                                         #3#))
                                                      . #6#))))))
                                           ((EQL |dd| |d2|)
                                            (SEQ
                                             (SEQ
                                              (LETT |f|
                                                    (SPADCALL |p1| |p2|
                                                              (QREFELT $ 19))
                                                    . #6#)
                                              (EXIT
                                               (COND
                                                ((NULL (QEQCAR |f| 1))
                                                 (PROGN
                                                  (LETT #1#
                                                        (CONS 0
                                                              (VECTOR
                                                               (LIST |u|)
                                                               |ltry| |p2|))
                                                        . #6#)
                                                  (GO #1#))))))
                                             (EXIT
                                              (LETT |dd|
                                                    (PROG1
                                                        (LETT #2# (- |dd| 1)
                                                              . #6#)
                                                      (|check_subtype|
                                                       (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       #2#))
                                                    . #6#))))
                                           ('T
                                            (PROGN
                                             (LETT #1# (CONS 0 |uterm|) . #6#)
                                             (GO #1#)))))
                                         ((< |du| |dd|)
                                          (LETT |dd| |du|
                                                . #6#)))))))))))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |PGCD;good| (|f| |lvr| |ltry| $)
  (PROG (#1=#:G172 |uf| |lval| |i| #2=#:G173 |range| |nvr|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |nvr| (LENGTH |lvr|) . #3=(|PGCD;good|))
            (LETT |range| 1 . #3#)
            (EXIT
             (SEQ G190 (COND ((NULL 'T) (GO G191)))
                  (SEQ (LETT |range| (SPADCALL 2 |range| (QREFELT $ 22)) . #3#)
                       (LETT |lval|
                             (PROGN
                              (LETT #2# NIL . #3#)
                              (SEQ (LETT |i| 1 . #3#) G190
                                   (COND ((|greater_SI| |i| |nvr|) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (SPADCALL |range| (QREFELT $ 24))
                                            #2#)
                                           . #3#)))
                                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190)
                                   G191 (EXIT (NREVERSE #2#))))
                             . #3#)
                       (EXIT
                        (COND
                         ((SPADCALL |lval| |ltry| (QREFELT $ 28)) "new point")
                         ('T
                          (SEQ (LETT |ltry| (CONS |lval| |ltry|) . #3#)
                               (LETT |uf|
                                     (SPADCALL |f| |lvr| |lval| (QREFELT $ 31))
                                     . #3#)
                               (EXIT
                                (COND
                                 ((EQL
                                   (SPADCALL
                                    (SPADCALL |uf|
                                              (SPADCALL |uf| (QREFELT $ 42))
                                              (QREFELT $ 34))
                                    (QREFELT $ 32))
                                   0)
                                  (PROGN
                                   (LETT #1# (CONS |uf| |ltry|) . #3#)
                                   (GO #1#))))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |PGCD;imposelc| (|lipol| |lvar| |lval| |leadc| $)
  (PROG (|result| #1=#:G183 |p1u| |p1| #2=#:G184 |pol| #3=#:G185 |leadpol|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |result| NIL . #4=(|PGCD;imposelc|))
            (SEQ (LETT |leadpol| NIL . #4#) (LETT #3# |leadc| . #4#)
                 (LETT |pol| NIL . #4#) (LETT #2# |lipol| . #4#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |pol| (CAR #2#) . #4#) NIL)
                       (ATOM #3#) (PROGN (LETT |leadpol| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |p1|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |leadpol| |lvar| |lval| (QREFELT $ 43))
                          (QREFELT $ 44))
                         |pol| (QREFELT $ 45))
                        . #4#)
                  (LETT |p1u|
                        (SPADCALL |p1| (SPADCALL |pol| (QREFELT $ 46))
                                  (QREFELT $ 47))
                        . #4#)
                  (EXIT
                   (COND
                    ((QEQCAR |p1u| 1)
                     (PROGN (LETT #1# (CONS 1 "failed") . #4#) (GO #1#)))
                    ('T (LETT |result| (CONS (QCDR |p1u|) |result|) . #4#)))))
                 (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#)) . #4#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 (REVERSE |result|)))))
      #1# (EXIT #1#))))) 

(DEFUN |PGCD;notCoprime| (|g| |p2| |ldeg| |lvar1| |ltry| $)
  (PROG (|ulist| #1=#:G194 #2=#:G205 |uf| #3=#:G204 |gd1| |dl| |ul| |l| |gd2|
         #4=#:G203 |gdl| |lgcd| |lquo| |d| |lcpol| |ug1| |lval| |newchoice|
         |#G33| |#G32| |p2l| #5=#:G187 |#G31| |#G30| |lg| |l1| |g1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |g1| (SPADCALL |g| (SPADCALL |g| (QREFELT $ 48)) (QREFELT $ 49))
              . #6=(|PGCD;notCoprime|))
        (LETT |l1|
              (PROG2 (LETT #5# (SPADCALL |g| |g1| (QREFELT $ 19)) . #6#)
                  (QCDR #5#)
                (|check_union| (QEQCAR #5# 0)
                               (|SparseUnivariatePolynomial| (QREFELT $ 9))
                               #5#))
              . #6#)
        (LETT |lg| (|PGCD;localgcd| |l1| |p2| |lvar1| |ltry| $) . #6#)
        (PROGN
         (LETT |#G30| (QCAR |lg|) . #6#)
         (LETT |#G31| (QCDR |lg|) . #6#)
         (LETT |l| |#G30| . #6#)
         (LETT |ltry| |#G31| . #6#))
        (LETT |lval| (|SPADfirst| |ltry|) . #6#)
        (LETT |p2l|
              (PROG2 (LETT #5# (SPADCALL |p2| |l| (QREFELT $ 19)) . #6#)
                  (QCDR #5#)
                (|check_union| (QEQCAR #5# 0)
                               (|SparseUnivariatePolynomial| (QREFELT $ 9))
                               #5#))
              . #6#)
        (PROGN
         (LETT |#G32| |l| . #6#)
         (LETT |#G33| |l| . #6#)
         (LETT |gd1| |#G32| . #6#)
         (LETT |gd2| |#G33| . #6#))
        (LETT |ul| (SPADCALL |l| |lvar1| |lval| (QREFELT $ 31)) . #6#)
        (LETT |dl| (SPADCALL |ul| (QREFELT $ 32)) . #6#)
        (COND
         ((SPADCALL
           (SPADCALL
            (SPADCALL |ul| (SPADCALL |ul| (QREFELT $ 42)) (QREFELT $ 34))
            (QREFELT $ 32))
           0 (QREFELT $ 33))
          (SEQ (LETT |newchoice| (|PGCD;good| |l| |lvar1| |ltry| $) . #6#)
               (LETT |ul| (QCAR |newchoice|) . #6#)
               (LETT |ltry| (QCDR |newchoice|) . #6#)
               (EXIT (LETT |lval| (|SPADfirst| |ltry|) . #6#)))))
        (LETT |ug1| (SPADCALL |g1| |lvar1| |lval| (QREFELT $ 31)) . #6#)
        (LETT |ulist|
              (LIST |ug1| (SPADCALL |p2l| |lvar1| |lval| (QREFELT $ 31)))
              . #6#)
        (LETT |lcpol|
              (LIST (SPADCALL |g1| (QREFELT $ 50))
                    (SPADCALL |p2| (QREFELT $ 50)))
              . #6#)
        (EXIT
         (SEQ G190 (COND ((NULL 'T) (GO G191)))
              (SEQ
               (LETT |d| (SPADCALL (CONS |ul| |ulist|) (QREFELT $ 52)) . #6#)
               (COND
                ((EQL (SPADCALL |d| (QREFELT $ 32)) 0)
                 (PROGN (LETT #4# |gd1| . #6#) (GO #4#))))
               (LETT |lquo|
                     (PROG2 (LETT #1# (SPADCALL |ul| |d| (QREFELT $ 39)) . #6#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 0)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 8))
                                      #1#))
                     . #6#)
               (COND
                ((SPADCALL (SPADCALL |lquo| (QREFELT $ 32)) 0 (QREFELT $ 33))
                 (SEQ
                  (LETT |lgcd|
                        (SPADCALL (CONS (SPADCALL |l| (QREFELT $ 50)) |lcpol|)
                                  (QREFELT $ 54))
                        . #6#)
                  (LETT |gdl|
                        (|PGCD;lift| |l| |d| |lquo| |lgcd| |lvar1| |ldeg|
                         |lval| $)
                        . #6#)
                  (EXIT
                   (COND
                    ((QEQCAR |gdl| 1)
                     (PROGN
                      (LETT #4#
                            (|PGCD;notCoprime| |g| |p2| |ldeg| |lvar1| |ltry|
                             $)
                            . #6#)
                      (GO #4#)))
                    ('T
                     (SEQ (LETT |l| (LETT |gd2| (QCDR |gdl|) . #6#) . #6#)
                          (LETT |ul|
                                (SPADCALL |l| |lvar1| |lval| (QREFELT $ 31))
                                . #6#)
                          (EXIT
                           (LETT |dl| (SPADCALL |ul| (QREFELT $ 32))
                                 . #6#)))))))))
               (LETT |gd1| (SPADCALL |gd1| |gd2| (QREFELT $ 55)) . #6#)
               (EXIT
                (LETT |ulist|
                      (PROGN
                       (LETT #3# NIL . #6#)
                       (SEQ (LETT |uf| NIL . #6#) (LETT #2# |ulist| . #6#) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |uf| (CAR #2#) . #6#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #3#
                                    (CONS
                                     (PROG2
                                         (LETT #1#
                                               (SPADCALL |uf| |d|
                                                         (QREFELT $ 39))
                                               . #6#)
                                         (QCDR #1#)
                                       (|check_union| (QEQCAR #1# 0)
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT $ 8))
                                                      #1#))
                                     #3#)
                                    . #6#)))
                            (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                            (EXIT (NREVERSE #3#))))
                      . #6#)))
              NIL (GO G190) G191 (EXIT NIL)))))
      #4# (EXIT #4#))))) 

(DEFUN |PGCD;gcdPrimitive;3Sup;6| (|p1| |p2| $)
  (PROG (|result| |totResult| |ltry| |lvar| |d2| |d1| |#G40| |#G39| |#G38|
         |#G37|)
    (RETURN
     (SEQ
      (SEQ
       (LETT |d1| (SPADCALL |p1| (QREFELT $ 21))
             . #1=(|PGCD;gcdPrimitive;3Sup;6|))
       (LETT |d2| (SPADCALL |p2| (QREFELT $ 21)) . #1#)
       (EXIT
        (COND
         ((SPADCALL |d1| |d2| (QREFELT $ 56))
          (SEQ
           (PROGN
            (LETT |#G37| |p2| . #1#)
            (LETT |#G38| |p1| . #1#)
            (LETT |p1| |#G37| . #1#)
            (LETT |p2| |#G38| . #1#))
           (EXIT
            (PROGN
             (LETT |#G39| |d2| . #1#)
             (LETT |#G40| |d1| . #1#)
             (LETT |d1| |#G39| . #1#)
             (LETT |d2| |#G40| . #1#))))))))
      (EXIT
       (COND
        ((EQL (SPADCALL |p1| (QREFELT $ 21)) 0)
         (COND
          ((SPADCALL |p1| (|spadConstant| $ 38) (QREFELT $ 57))
           (SPADCALL |p2| (QREFELT $ 58)))
          (#2='T (SPADCALL |p1| (QREFELT $ 58)))))
        (#2#
         (SEQ
          (LETT |lvar|
                (SPADCALL (ELT $ 59)
                          (SPADCALL (SPADCALL |p1| (QREFELT $ 60))
                                    (SPADCALL |p2| (QREFELT $ 60))
                                    (QREFELT $ 61))
                          (QREFELT $ 63))
                . #1#)
          (EXIT
           (COND
            ((NULL |lvar|)
             (SPADCALL
              (SPADCALL (SPADCALL |p1| (QREFELT $ 64))
                        (SPADCALL |p2| (QREFELT $ 64)) (QREFELT $ 34))
              (QREFELT $ 65)))
            ((QEQCAR (SPADCALL |p2| |p1| (QREFELT $ 19)) 0)
             (SPADCALL |p1| (QREFELT $ 58)))
            (#2#
             (SEQ (LETT |ltry| NIL . #1#)
                  (LETT |totResult| (|PGCD;localgcd| |p1| |p2| |lvar| |ltry| $)
                        . #1#)
                  (LETT |result| (QCAR |totResult|) . #1#)
                  (EXIT
                   (COND
                    ((SPADCALL |result| (|spadConstant| $ 66) (QREFELT $ 57))
                     (|spadConstant| $ 66))
                    (#2#
                     (SEQ
                      (SEQ G190
                           (COND
                            ((NULL (|PGCD;failtest| |result| |p1| |p2| $))
                             (GO G191)))
                           (SEQ (LETT |ltry| (QCDR |totResult|) . #1#)
                                (LETT |totResult|
                                      (|PGCD;localgcd| |p1| |p2| |lvar| |ltry|
                                       $)
                                      . #1#)
                                (EXIT
                                 (LETT |result| (QCAR |totResult|) . #1#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |result|))))))))))))))))) 

(DEFUN |PGCD;localgcd| (|p1| |p2| |lvar| |ltry| $)
  (PROG (#1=#:G225 |h| |ldeg| |dd| |ud| |listpol| |uterm| #2=#:G143)
    (RETURN
     (SEQ
      (LETT |uterm|
            (PROG2
                (LETT #2# (|PGCD;chooseVal| |p1| |p2| |lvar| |ltry| $)
                      . #3=(|PGCD;localgcd|))
                (QCDR #2#)
              (|check_union| (QEQCAR #2# 0)
                             (|Record|
                              (|:| |lpol|
                                   (|List|
                                    (|SparseUnivariatePolynomial|
                                     (QREFELT $ 8))))
                              (|:| |lint| (|List| (|List| (QREFELT $ 8))))
                              (|:| |mpol|
                                   (|SparseUnivariatePolynomial|
                                    (QREFELT $ 9))))
                             #2#))
            . #3#)
      (LETT |ltry| (QVELT |uterm| 1) . #3#)
      (LETT |listpol| (QVELT |uterm| 0) . #3#)
      (LETT |ud| (|SPADfirst| |listpol|) . #3#)
      (LETT |dd| (SPADCALL |ud| (QREFELT $ 32)) . #3#)
      (EXIT
       (COND ((EQL |dd| 0) (CONS (|spadConstant| $ 66) |ltry|))
             ((OR (EQL |dd| (SPADCALL |p1| (QREFELT $ 21)))
                  (EQL |dd| (SPADCALL |p2| (QREFELT $ 21))))
              (CONS (QVELT |uterm| 2) |ltry|))
             ('T
              (SEQ
               (LETT |ldeg|
                     (SPADCALL (ELT $ 68) (SPADCALL |p1| |lvar| (QREFELT $ 70))
                               (SPADCALL |p2| |lvar| (QREFELT $ 70))
                               (QREFELT $ 72))
                     . #3#)
               (LETT |h| (|PGCD;lift?| |p1| |p2| |uterm| |ldeg| |lvar| $)
                     . #3#)
               (EXIT
                (COND
                 ((QEQCAR |h| 2)
                  (CONS (|PGCD;notCoprime| |p1| |p2| |ldeg| |lvar| |ltry| $)
                        |ltry|))
                 ((QEQCAR |h| 1) (|PGCD;localgcd| |p1| |p2| |lvar| |ltry| $))
                 ('T
                  (CONS
                   (PROG2 (LETT #1# |h| . #3#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0)
                                    (|SparseUnivariatePolynomial|
                                     (QREFELT $ 9))
                                    #1#))
                   |ltry|)))))))))))) 

(DEFUN |PGCD;monomContent| (|p| $)
  (PROG (|md|)
    (RETURN
     (SEQ
      (COND ((EQL (SPADCALL |p| (QREFELT $ 21)) 0) (|spadConstant| $ 66))
            ('T
             (SEQ (LETT |md| (SPADCALL |p| (QREFELT $ 73)) |PGCD;monomContent|)
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |p| (QREFELT $ 74)) (QREFELT $ 54))
                    |md| (QREFELT $ 75)))))))))) 

(DEFUN |PGCD;better| (|p1| |p2| $)
  (PROG (#1=#:G235)
    (RETURN
     (COND ((SPADCALL |p1| (QREFELT $ 76)) 'T)
           ((SPADCALL |p2| (QREFELT $ 76)) 'NIL)
           ('T
            (<
             (SPADCALL |p1|
                       (PROG2
                           (LETT #1# (SPADCALL |p1| (QREFELT $ 78))
                                 . #2=(|PGCD;better|))
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                       (QREFELT $ 79))
             (SPADCALL |p2|
                       (PROG2 (LETT #1# (SPADCALL |p2| (QREFELT $ 78)) . #2#)
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                       (QREFELT $ 79)))))))) 

(DEFUN |PGCD;best_to_front| (|l| $)
  (PROG (|ress| |best| #1=#:G245 |p|)
    (RETURN
     (SEQ (LETT |ress| NIL . #2=(|PGCD;best_to_front|))
          (LETT |best| (|SPADfirst| |l|) . #2#)
          (SEQ (LETT |p| NIL . #2#) (LETT #1# (CDR |l|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((|PGCD;better| |p| |best| $)
                   (SEQ (LETT |ress| (CONS |best| |ress|) . #2#)
                        (EXIT (LETT |best| |p| . #2#))))
                  ('T (LETT |ress| (CONS |p| |ress|) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |best| |ress|)))))) 

(DEFUN |PGCD;gcdTermList| (|p1| |p2| $)
  (PROG (|q| #1=#:G252 |term| #2=#:G253 |termList| #3=#:G247)
    (RETURN
     (SEQ
      (LETT |termList|
            (|PGCD;best_to_front|
             (CONS |p1|
                   (SPADCALL
                    (SPADCALL |p2|
                              (PROG2
                                  (LETT #3# (SPADCALL |p2| (QREFELT $ 78))
                                        . #4=(|PGCD;gcdTermList|))
                                  (QCDR #3#)
                                (|check_union| (QEQCAR #3# 0) (QREFELT $ 7)
                                               #3#))
                              (QREFELT $ 81))
                    (QREFELT $ 74)))
             $)
            . #4#)
      (LETT |q| (|SPADfirst| |termList|) . #4#)
      (SEQ (LETT #2# NIL . #4#) (LETT |term| NIL . #4#)
           (LETT #1# (CDR |termList|) . #4#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#) . #4#) NIL) #2#)
             (GO G191)))
           (SEQ (EXIT (LETT |q| (SPADCALL |q| |term| (QREFELT $ 82)) . #4#)))
           (LETT #1#
                 (PROG1 (CDR #1#)
                   (LETT #2#
                         (SPADCALL |q| (|spadConstant| $ 41) (QREFELT $ 83))
                         . #4#))
                 . #4#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |q|))))) 

(DEFUN |PGCD;gcd;3Sup;12| (|p1| |p2| $)
  (PROG (#1=#:G256 |c2| |c1| |#G58| |#G57|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |p1| (QREFELT $ 21)) (SPADCALL |p2| (QREFELT $ 21))
                  (QREFELT $ 56))
        (PROGN
         (LETT |#G57| |p2| . #2=(|PGCD;gcd;3Sup;12|))
         (LETT |#G58| |p1| . #2#)
         (LETT |p1| |#G57| . #2#)
         (LETT |p2| |#G58| . #2#))))
      (EXIT
       (COND
        ((EQL (SPADCALL |p1| (QREFELT $ 21)) 0)
         (COND
          ((SPADCALL |p1| (|spadConstant| $ 38) (QREFELT $ 57))
           (SPADCALL |p2| (QREFELT $ 58)))
          ((SPADCALL |p1| (|spadConstant| $ 66) (QREFELT $ 57))
           (SPADCALL |p1| (QREFELT $ 58)))
          (#3='T
           (SPADCALL
            (SPADCALL (SPADCALL |p1| (QREFELT $ 50))
                      (SPADCALL |p2| (QREFELT $ 84)) (QREFELT $ 82))
            (QREFELT $ 85)))))
        ((SPADCALL (SPADCALL |p1| (QREFELT $ 86)) (|spadConstant| $ 38)
                   (QREFELT $ 57))
         (|PGCD;gcdMonom| |p1| (|PGCD;monomContent| |p2| $) $))
        (#3#
         (SEQ (LETT |c1| (|PGCD;monomContent| |p1| $) . #2#)
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |p2| (QREFELT $ 86)) (|spadConstant| $ 38)
                           (QREFELT $ 57))
                 (|PGCD;gcdMonom| |c1| |p2| $))
                (#3#
                 (SEQ (LETT |c2| (|PGCD;monomContent| |p2| $) . #2#)
                      (LETT |p1|
                            (PROG2
                                (LETT #1# (SPADCALL |p1| |c1| (QREFELT $ 19))
                                      . #2#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0)
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 9))
                                             #1#))
                            . #2#)
                      (LETT |p2|
                            (PROG2
                                (LETT #1# (SPADCALL |p2| |c2| (QREFELT $ 19))
                                      . #2#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0)
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 9))
                                             #1#))
                            . #2#)
                      (EXIT
                       (SPADCALL (SPADCALL |p1| |p2| (QREFELT $ 67))
                                 (|PGCD;gcdMonom| |c1| |c2| $)
                                 (QREFELT $ 55))))))))))))))) 

(DEFUN |PGCD;gcdMonom| (|m1| |m2| $)
  (SPADCALL
   (SPADCALL (SPADCALL |m1| (QREFELT $ 50)) (SPADCALL |m2| (QREFELT $ 50))
             (QREFELT $ 82))
   (MIN (SPADCALL |m1| (QREFELT $ 21)) (SPADCALL |m2| (QREFELT $ 21)))
   (QREFELT $ 75))) 

(DEFUN |PGCD;lift?| (|p1| |p2| |uterm| |ldeg| |lvar| $)
  (PROG (|l| |lgcd| |f| #1=#:G268 |nolift| #2=#:G275 |uf| |listpol| |d| |lval|
         |#G67| |#G66| |leadpol|)
    (RETURN
     (SEQ (LETT |leadpol| 'NIL . #3=(|PGCD;lift?|))
          (PROGN
           (LETT |#G66| (QVELT |uterm| 0) . #3#)
           (LETT |#G67| (|SPADfirst| (QVELT |uterm| 1)) . #3#)
           (LETT |listpol| |#G66| . #3#)
           (LETT |lval| |#G67| . #3#))
          (LETT |d| (|SPADfirst| |listpol|) . #3#)
          (LETT |listpol| (CDR |listpol|) . #3#) (LETT |nolift| 'T . #3#)
          (SEQ
           (EXIT
            (SEQ (LETT |uf| NIL . #3#) (LETT #2# |listpol| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |uf| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQL
                      (SPADCALL (SPADCALL |uf| |d| (QREFELT $ 34))
                                (QREFELT $ 32))
                      0)
                     (PROGN
                      (LETT #1# (LETT |nolift| 'NIL . #3#) . #3#)
                      (GO #1#))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL)))
           #1# (EXIT #1#))
          (EXIT
           (COND (|nolift| (CONS 2 "notCoprime"))
                 (#4='T
                  (SEQ
                   (LETT |f|
                         (SPADCALL (LIST |p1| |p2|)
                                   (SPADCALL |uf| |listpol| (QREFELT $ 88))
                                   (QREFELT $ 90))
                         . #3#)
                   (LETT |lgcd|
                         (SPADCALL (SPADCALL |p1| (QREFELT $ 50))
                                   (SPADCALL |p2| (QREFELT $ 50))
                                   (QREFELT $ 82))
                         . #3#)
                   (LETT |l|
                         (|PGCD;lift| |f| |d| |uf| |lgcd| |lvar| |ldeg| |lval|
                          $)
                         . #3#)
                   (EXIT
                    (COND ((QEQCAR |l| 1) (CONS 1 "failed"))
                          (#4# (CONS 0 (QCDR |l|))))))))))))) 

(DEFUN |PGCD;lift| (|f| |d| |uf| |lgcd| |lvar| |ldeg| |lval| $)
  (PROG (|p1| |p0| |#G83| |#G82| |#G81| |#G80| |plist| |pl| |lg| |lgu|
         |leadlist| #1=#:G281 |lcd| #2=#:G295 |n0| #3=#:G296 |n1| #4=#:G294
         |leadpol| |df| |lcf|)
    (RETURN
     (SEQ (LETT |leadpol| 'NIL . #5=(|PGCD;lift|))
          (LETT |lcf| (SPADCALL |f| (QREFELT $ 50)) . #5#)
          (LETT |df| (SPADCALL |f| (QREFELT $ 21)) . #5#)
          (LETT |leadlist| NIL . #5#)
          (COND
           ((SPADCALL |lgcd| (|spadConstant| $ 41) (QREFELT $ 91))
            (SEQ (LETT |leadpol| 'T . #5#)
                 (LETT |f| (SPADCALL |lgcd| |f| (QREFELT $ 92)) . #5#)
                 (LETT |ldeg|
                       (PROGN
                        (LETT #4# NIL . #5#)
                        (SEQ (LETT |n1| NIL . #5#)
                             (LETT #3# (SPADCALL |lgcd| |lvar| (QREFELT $ 93))
                                   . #5#)
                             (LETT |n0| NIL . #5#) (LETT #2# |ldeg| . #5#) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |n0| (CAR #2#) . #5#) NIL)
                                   (ATOM #3#)
                                   (PROGN (LETT |n1| (CAR #3#) . #5#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT (LETT #4# (CONS (+ |n0| |n1|) #4#) . #5#)))
                             (LETT #2#
                                   (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #5#))
                                   . #5#)
                             (GO G190) G191 (EXIT (NREVERSE #4#))))
                       . #5#)
                 (LETT |lcd| (SPADCALL |d| (QREFELT $ 46)) . #5#)
                 (COND
                  ((SPADCALL (SPADCALL |lgcd| (QREFELT $ 94))
                             (|spadConstant| $ 35) (QREFELT $ 95))
                   (LETT |d|
                         (PROG2
                             (LETT #1#
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |lgcd| (QREFELT $ 96))
                                              |d| (QREFELT $ 97))
                                    |lcd| (QREFELT $ 47))
                                   . #5#)
                             (QCDR #1#)
                           (|check_union| (QEQCAR #1# 0)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 8))
                                          #1#))
                         . #5#))
                  (#6='T
                   (LETT |d|
                         (PROG2
                             (LETT #1#
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |lgcd| |lvar| |lval|
                                                (QREFELT $ 43))
                                      (QREFELT $ 96))
                                     |d| (QREFELT $ 97))
                                    |lcd| (QREFELT $ 47))
                                   . #5#)
                             (QCDR #1#)
                           (|check_union| (QEQCAR #1# 0)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 8))
                                          #1#))
                         . #5#)))
                 (EXIT
                  (LETT |uf| (SPADCALL |lcd| |uf| (QREFELT $ 97)) . #5#)))))
          (LETT |leadlist| (LIST |lgcd| |lcf|) . #5#)
          (LETT |lgu|
                (|PGCD;imposelc| (LIST |d| |uf|) |lvar| |lval| |leadlist| $)
                . #5#)
          (EXIT
           (COND ((QEQCAR |lgu| 1) (CONS 1 "failed"))
                 (#6#
                  (SEQ (LETT |lg| (QCDR |lgu|) . #5#)
                       (LETT |pl|
                             (SPADCALL |f| |lvar| |lg| |lval| |leadlist| |ldeg|
                                       (QREFELT $ 16) (QREFELT $ 100))
                             . #5#)
                       (EXIT
                        (COND ((QEQCAR |pl| 1) (CONS 1 "failed"))
                              (#6#
                               (SEQ (LETT |plist| (QCDR |pl|) . #5#)
                                    (PROGN
                                     (LETT |#G80| (|SPADfirst| |plist|) . #5#)
                                     (LETT |#G81|
                                           (SPADCALL |plist| 2 (QREFELT $ 90))
                                           . #5#)
                                     (LETT |p0| |#G80| . #5#)
                                     (LETT |p1| |#G81| . #5#))
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |p0| |lvar| |lval|
                                                 (QREFELT $ 31))
                                       (|SPADfirst| |lg|) (QREFELT $ 101))
                                      (PROGN
                                       (LETT |#G82| |p1| . #5#)
                                       (LETT |#G83| |p0| . #5#)
                                       (LETT |p0| |#G82| . #5#)
                                       (LETT |p1| |#G83| . #5#))))
                                    (EXIT
                                     (COND
                                      (|leadpol|
                                       (SPADCALL |p0|
                                                 (SPADCALL |p0| (QREFELT $ 84))
                                                 (QREFELT $ 102)))
                                      (#6# (CONS 0 |p0|)))))))))))))))) 

(DEFUN |PGCD;gcd;3P;16| (|p1| |p2| $)
  (PROG (|mv2| #1=#:G301 |mv1|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p1| (QREFELT $ 76))
        (SEQ
         (LETT |p1| (SPADCALL |p1| (QREFELT $ 103)) . #2=(|PGCD;gcd;3P;16|))
         (EXIT
          (COND ((SPADCALL |p1| (|spadConstant| $ 41) (QREFELT $ 83)) |p1|)
                ((SPADCALL |p1| (|spadConstant| $ 104) (QREFELT $ 83))
                 (SPADCALL |p2| (QREFELT $ 103)))
                (#3='T
                 (COND
                  ((SPADCALL |p2| (QREFELT $ 76))
                   (SPADCALL
                    (SPADCALL (SPADCALL |p1| (QREFELT $ 96))
                              (SPADCALL |p2| (QREFELT $ 96)) (QREFELT $ 105))
                    (QREFELT $ 106)))
                  (#3# (|PGCD;gcdTermList| |p1| |p2| $))))))))
       ((SPADCALL |p2| (QREFELT $ 76))
        (SEQ (LETT |p2| (SPADCALL |p2| (QREFELT $ 103)) . #2#)
             (EXIT
              (COND ((SPADCALL |p2| (|spadConstant| $ 41) (QREFELT $ 83)) |p2|)
                    ((SPADCALL |p2| (|spadConstant| $ 104) (QREFELT $ 83))
                     (SPADCALL |p1| (QREFELT $ 103)))
                    (#3# (|PGCD;gcdTermList| |p2| |p1| $))))))
       (#3#
        (SEQ (LETT |p1| (SPADCALL |p1| (QREFELT $ 103)) . #2#)
             (LETT |p2| (SPADCALL |p2| (QREFELT $ 103)) . #2#)
             (EXIT
              (COND ((SPADCALL |p1| |p2| (QREFELT $ 83)) |p1|)
                    (#3#
                     (SEQ
                      (LETT |mv1|
                            (PROG2
                                (LETT #1# (SPADCALL |p1| (QREFELT $ 78)) . #2#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                            . #2#)
                      (LETT |mv2|
                            (PROG2
                                (LETT #1# (SPADCALL |p2| (QREFELT $ 78)) . #2#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                            . #2#)
                      (EXIT
                       (COND
                        ((SPADCALL |mv1| |mv2| (QREFELT $ 107))
                         (SPADCALL
                          (SPADCALL (SPADCALL |p1| |mv1| (QREFELT $ 81))
                                    (SPADCALL |p2| |mv1| (QREFELT $ 81))
                                    (QREFELT $ 49))
                          |mv1| (QREFELT $ 108)))
                        ((SPADCALL |mv1| |mv2| (QREFELT $ 109))
                         (|PGCD;gcdTermList| |p1| |p2| $))
                        (#3# (|PGCD;gcdTermList| |p2| |p1| $))))))))))))))) 

(DEFUN |PGCD;gcd;LP;17| (|listp| $)
  (PROG (#1=#:G311 |f| #2=#:G312 |g| |lf|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |lf| (|PGCD;best_to_front| |listp| $) . #3=(|PGCD;gcd;LP;17|))
        (LETT |f| (|SPADfirst| |lf|) . #3#)
        (SEQ (LETT |g| NIL . #3#) (LETT #2# (CDR |lf|) . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ (LETT |f| (SPADCALL |f| |g| (QREFELT $ 82)) . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL |f| (|spadConstant| $ 41) (QREFELT $ 83))
                     (PROGN (LETT #1# |f| . #3#) (GO #1#))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT |f|)))
      #1# (EXIT #1#))))) 

(DEFUN |PGCD;gcd;LSup;18| (|listp| $)
  (PROG (#1=#:G321 |f| #2=#:G322 |g| |lf|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |lf|
              (SPADCALL (CONS #'|PGCD;gcd;LSup;18!0| $) |listp|
                        (QREFELT $ 112))
              . #3=(|PGCD;gcd;LSup;18|))
        (LETT |f| (|SPADfirst| |lf|) . #3#)
        (SEQ (LETT |g| NIL . #3#) (LETT #2# (CDR |lf|) . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ (LETT |f| (SPADCALL |f| |g| (QREFELT $ 49)) . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL |f| (|spadConstant| $ 66) (QREFELT $ 57))
                     (PROGN (LETT #1# |f| . #3#) (GO #1#))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT |f|)))
      #1# (EXIT #1#))))) 

(DEFUN |PGCD;gcd;LSup;18!0| (|z1| |z2| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 21)) (SPADCALL |z2| (QREFELT $ 21))
            (QREFELT $ 110))) 

(DEFUN |PGCD;gcdPrimitive;3P;19| (|p1| |p2| $)
  (PROG (|up2| |up1| #1=#:G328 |mp| |md| |mv2| #2=#:G325 |mv1|)
    (RETURN
     (SEQ
      (LETT |p1| (SPADCALL |p1| (QREFELT $ 103))
            . #3=(|PGCD;gcdPrimitive;3P;19|))
      (LETT |p2| (SPADCALL |p2| (QREFELT $ 103)) . #3#)
      (EXIT
       (COND ((SPADCALL |p1| |p2| (QREFELT $ 83)) |p1|)
             ((SPADCALL |p1| (QREFELT $ 76))
              (COND
               ((SPADCALL |p2| (QREFELT $ 76))
                (SPADCALL
                 (SPADCALL (SPADCALL |p1| (QREFELT $ 96))
                           (SPADCALL |p2| (QREFELT $ 96)) (QREFELT $ 105))
                 (QREFELT $ 106)))
               ((SPADCALL |p1| (|spadConstant| $ 104) (QREFELT $ 83)) |p2|)
               (#4='T (|spadConstant| $ 41))))
             ((SPADCALL |p2| (QREFELT $ 76))
              (COND
               ((SPADCALL |p2| (|spadConstant| $ 104) (QREFELT $ 83)) |p1|)
               (#4# (|spadConstant| $ 41))))
             (#4#
              (SEQ
               (LETT |mv1|
                     (PROG2 (LETT #2# (SPADCALL |p1| (QREFELT $ 78)) . #3#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#))
                     . #3#)
               (LETT |mv2|
                     (PROG2 (LETT #2# (SPADCALL |p2| (QREFELT $ 78)) . #3#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#))
                     . #3#)
               (EXIT
                (COND
                 ((SPADCALL |mv1| |mv2| (QREFELT $ 107))
                  (SEQ
                   (LETT |md|
                         (MIN (SPADCALL |p1| |mv1| (QREFELT $ 114))
                              (SPADCALL |p2| |mv2| (QREFELT $ 114)))
                         . #3#)
                   (LETT |mp| (|spadConstant| $ 41) . #3#)
                   (COND
                    ((SPADCALL |md| 1 (QREFELT $ 56))
                     (SEQ
                      (LETT |mp|
                            (SPADCALL (SPADCALL |mv1| (QREFELT $ 115)) |md|
                                      (QREFELT $ 116))
                            . #3#)
                      (LETT |p1|
                            (PROG2
                                (LETT #1# (SPADCALL |p1| |mp| (QREFELT $ 117))
                                      . #3#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
                            . #3#)
                      (EXIT
                       (LETT |p2|
                             (PROG2
                                 (LETT #1# (SPADCALL |p2| |mp| (QREFELT $ 117))
                                       . #3#)
                                 (QCDR #1#)
                               (|check_union| (QEQCAR #1# 0) (QREFELT $ 9)
                                              #1#))
                             . #3#)))))
                   (LETT |up1| (SPADCALL |p1| |mv1| (QREFELT $ 81)) . #3#)
                   (LETT |up2| (SPADCALL |p2| |mv2| (QREFELT $ 81)) . #3#)
                   (EXIT
                    (SPADCALL |mp|
                              (SPADCALL (SPADCALL |up1| |up2| (QREFELT $ 67))
                                        |mv1| (QREFELT $ 108))
                              (QREFELT $ 118)))))
                 (#4# (|spadConstant| $ 41)))))))))))) 

(DEFUN |PGCD;gcdPrimitive;LP;20| (|listp| $)
  (PROG (#1=#:G342 |f| #2=#:G343 |g| |lf|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |lf|
              (SPADCALL (CONS (|function| |PGCD;better|) $) |listp|
                        (QREFELT $ 121))
              . #3=(|PGCD;gcdPrimitive;LP;20|))
        (LETT |f| (|SPADfirst| |lf|) . #3#)
        (SEQ (LETT |g| NIL . #3#) (LETT #2# (CDR |lf|) . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ (LETT |f| (SPADCALL |f| |g| (QREFELT $ 119)) . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL |f| (|spadConstant| $ 41) (QREFELT $ 83))
                     (PROGN (LETT #1# |f| . #3#) (GO #1#))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT |f|)))
      #1# (EXIT #1#))))) 

(DECLAIM (NOTINLINE |PolynomialGcdPackage;|)) 

(DEFUN |PolynomialGcdPackage| (&REST #1=#:G344)
  (PROG ()
    (RETURN
     (PROG (#2=#:G345)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PolynomialGcdPackage|)
                                           '|domainEqualList|)
                . #3=(|PolynomialGcdPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PolynomialGcdPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|PolynomialGcdPackage|))))))))))) 

(DEFUN |PolynomialGcdPackage;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialGcdPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|PolynomialGcdPackage| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 123) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PolynomialGcdPackage|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 16
                (SPADCALL (SPADCALL (EXPT 2 26) (QREFELT $ 14))
                          (QREFELT $ 15)))
      $)))) 

(MAKEPROP '|PolynomialGcdPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|PositiveInteger|) (0 . ^)
              (|Integer|) (|IntegerPrimesPackage| 12) (6 . |prevPrime|)
              (11 . |coerce|) '|pmod| (|Union| $ '"failed")
              (|SparseUnivariatePolynomial| 9) (16 . |exquo|)
              (|NonNegativeInteger|) (22 . |degree|) (27 . *)
              (|FactoringUtilities| 6 7 8 9) (33 . |ran|) (|Boolean|)
              (|List| 8) (|List| 26) (38 . |member?|)
              (|SparseUnivariatePolynomial| 8) (|List| 7) (44 . |completeEval|)
              (51 . |degree|) (56 . ~=) (62 . |gcd|) (68 . |Zero|)
              (72 . |Zero|) (76 . |One|) (80 . |Zero|) (84 . |exquo|)
              (90 . |One|) (94 . |One|) (98 . |differentiate|) (103 . |eval|)
              (110 . |univariate|) (115 . *) (121 . |leadingCoefficient|)
              (126 . |exquo|) (132 . |differentiate|) |PGCD;gcd;3Sup;12|
              (137 . |leadingCoefficient|) (|List| $) (142 . |gcd|) (|List| 9)
              |PGCD;gcd;LP;17| (147 . *) (153 . >) (159 . =)
              (165 . |unitCanonical|) (170 . >) (176 . |variables|)
              (181 . |setUnion|) (|Mapping| 25 7 7) (187 . |sort|)
              (193 . |lowerPolynomial|) (198 . |raisePolynomial|) (203 . |One|)
              |PGCD;gcdPrimitive;3Sup;6| (207 . |min|) (|List| 20)
              (213 . |degree|) (|Mapping| 20 20 20) (219 . |map|)
              (226 . |minimumDegree|) (231 . |coefficients|) (236 . |monomial|)
              (242 . |ground?|) (|Union| 7 '"failed") (247 . |mainVariable|)
              (252 . |degree|) (|SparseUnivariatePolynomial| $)
              (258 . |univariate|) |PGCD;gcd;3P;16| (264 . =) (270 . |content|)
              (275 . |coerce|) (280 . |reductum|) (|List| 29)
              (285 . |position|) (|List| 18) (291 . |elt|) (297 . ~=) (303 . *)
              (309 . |degree|) (315 . |degree|) (320 . =) (326 . |retract|)
              (331 . *) (|Union| 89 '"failed") (|MultivariateLifting| 6 7 8 9)
              (337 . |lifting|) (348 . ~=) (354 . |exquo|)
              (360 . |unitCanonical|) (365 . |Zero|) (369 . |gcd|)
              (375 . |coerce|) (380 . =) (386 . |multivariate|) (392 . <)
              (398 . <) (|Mapping| 25 18 18) (404 . |sort|) |PGCD;gcd;LSup;18|
              (410 . |minimumDegree|) (416 . |coerce|) (421 . ^)
              (427 . |exquo|) (433 . *) |PGCD;gcdPrimitive;3P;19|
              (|Mapping| 25 9 9) (439 . |sort|) |PGCD;gcdPrimitive;LP;20|)
           '#(|gcdPrimitive| 445 |gcd| 462) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 122
                                                 '(2 10 0 0 10 11 1 13 12 12 14
                                                   1 8 0 12 15 2 18 17 0 0 19 1
                                                   18 20 0 21 2 12 0 10 0 22 1
                                                   23 8 12 24 2 27 25 26 0 28 3
                                                   23 29 18 30 26 31 1 29 20 0
                                                   32 2 20 25 0 0 33 2 29 0 0 0
                                                   34 0 6 0 35 0 8 0 36 0 29 0
                                                   37 0 18 0 38 2 29 17 0 0 39
                                                   0 8 0 40 0 9 0 41 1 29 0 0
                                                   42 3 9 0 0 30 26 43 1 9 29 0
                                                   44 2 29 0 0 0 45 1 29 8 0 46
                                                   2 29 17 0 8 47 1 18 0 0 48 1
                                                   18 9 0 50 1 29 0 51 52 2 18
                                                   0 0 0 55 2 20 25 0 0 56 2 18
                                                   25 0 0 57 1 18 0 0 58 2 7 25
                                                   0 0 59 1 23 30 18 60 2 30 0
                                                   0 0 61 2 30 0 62 0 63 1 23
                                                   29 18 64 1 23 18 29 65 0 18
                                                   0 66 2 20 0 0 0 68 2 23 69
                                                   18 30 70 3 69 0 71 0 0 72 1
                                                   18 20 0 73 1 18 53 0 74 2 18
                                                   0 9 20 75 1 9 25 0 76 1 9 77
                                                   0 78 2 9 20 0 7 79 2 9 80 0
                                                   7 81 2 9 25 0 0 83 1 18 9 0
                                                   84 1 18 0 9 85 1 18 0 0 86 2
                                                   87 12 29 0 88 2 89 18 0 12
                                                   90 2 9 25 0 0 91 2 18 0 9 0
                                                   92 2 9 69 0 30 93 1 9 6 0 94
                                                   2 6 25 0 0 95 1 9 8 0 96 2
                                                   29 0 8 0 97 7 99 98 18 30 87
                                                   26 53 69 8 100 2 29 25 0 0
                                                   101 2 18 17 0 9 102 1 9 0 0
                                                   103 0 9 0 104 2 8 0 0 0 105
                                                   1 9 0 8 106 2 7 25 0 0 107 2
                                                   9 0 80 7 108 2 7 25 0 0 109
                                                   2 20 25 0 0 110 2 89 0 111 0
                                                   112 2 9 20 0 7 114 1 9 0 7
                                                   115 2 9 0 0 20 116 2 9 17 0
                                                   0 117 2 9 0 0 0 118 2 53 0
                                                   120 0 121 2 0 9 9 9 119 1 0
                                                   9 53 122 2 0 18 18 18 67 2 0
                                                   9 9 9 82 2 0 18 18 18 49 1 0
                                                   9 53 54 1 0 18 89 113)))))
           '|lookupComplete|)) 
