
(SDEFUN |PGCD;failtest|
        ((|f| |SparseUnivariatePolynomial| P)
         (|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P) ($ |Boolean|))
        (COND ((QEQCAR (SPADCALL |p1| |f| (QREFELT $ 19)) 1) 'T)
              ('T (QEQCAR (SPADCALL |p2| |f| (QREFELT $ 19)) 1)))) 

(SDEFUN |PGCD;chooseVal|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P) (|lvr| |List| OV)
         (|ltry| |List| (|List| R))
         ($ |Union|
          (|Record| (|:| |lpol| (|List| (|SparseUnivariatePolynomial| R)))
                    (|:| |lint| (|List| (|List| R)))
                    (|:| |mpol| (|SparseUnivariatePolynomial| P)))
          "failed"))
        (SPROG
         ((|dd| (|NonNegativeInteger|)) (#1=#:G164 NIL) (#2=#:G156 NIL)
          (|f| (|Union| (|SparseUnivariatePolynomial| P) "failed"))
          (#3=#:G153 NIL)
          (|uterm|
           (|Record| (|:| |lpol| (|List| (|SparseUnivariatePolynomial| R)))
                     (|:| |lint| (|List| (|List| R)))
                     (|:| |mpol| (|SparseUnivariatePolynomial| P))))
          (|ugcd| (|List| (|SparseUnivariatePolynomial| R))) (#4=#:G147 NIL)
          (|du| (|NonNegativeInteger|)) (|u| (|SparseUnivariatePolynomial| R))
          (|uf2| #5=(|SparseUnivariatePolynomial| R)) (|uf1| #5#)
          (|lval| (|List| R)) (|i| NIL) (#6=#:G165 NIL) (|range| (|Integer|))
          (|nvr| (|NonNegativeInteger|)) (|d2| #7=(|NonNegativeInteger|))
          (|d1| #7#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |d1| (SPADCALL |p1| (QREFELT $ 21)) . #8=(|PGCD;chooseVal|))
            (LETT |d2| (SPADCALL |p2| (QREFELT $ 21)) . #8#)
            (LETT |dd| 0 . #8#) (LETT |nvr| (LENGTH |lvr|) . #8#)
            (LETT |lval| NIL . #8#) (LETT |range| 8 . #8#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ (LETT |range| (SPADCALL 2 |range| (QREFELT $ 22)) . #8#)
                       (LETT |lval|
                             (PROGN
                              (LETT #6# NIL . #8#)
                              (SEQ (LETT |i| 1 . #8#) G190
                                   (COND ((|greater_SI| |i| |nvr|) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #6#
                                           (CONS
                                            (SPADCALL |range| (QREFELT $ 24))
                                            #6#)
                                           . #8#)))
                                   (LETT |i| (|inc_SI| |i|) . #8#) (GO G190)
                                   G191 (EXIT (NREVERSE #6#))))
                             . #8#)
                       (EXIT
                        (COND
                         ((SPADCALL |lval| |ltry| (QREFELT $ 28)) "new point")
                         ('T
                          (SEQ (LETT |ltry| (CONS |lval| |ltry|) . #8#)
                               (LETT |uf1|
                                     (SPADCALL |p1| |lvr| |lval|
                                               (QREFELT $ 31))
                                     . #8#)
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
                                         . #8#)
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
                                             . #8#)
                                       (LETT |du| (SPADCALL |u| (QREFELT $ 32))
                                             . #8#)
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
                                                . #8#)
                                          (GO #1#))))
                                       (LETT |ugcd|
                                             (LIST |u|
                                                   (PROG2
                                                       (LETT #4#
                                                             (SPADCALL |uf1|
                                                                       |u|
                                                                       (QREFELT
                                                                        $ 39))
                                                             . #8#)
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
                                                             . #8#)
                                                       (QCDR #4#)
                                                     (|check_union|
                                                      (QEQCAR #4# 0)
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT $ 8))
                                                      #4#)))
                                             . #8#)
                                       (LETT |uterm|
                                             (VECTOR |ugcd| |ltry|
                                                     (|spadConstant| $ 38))
                                             . #8#)
                                       (EXIT
                                        (COND
                                         ((EQL |dd| 0) (LETT |dd| |du| . #8#))
                                         ((EQL |du| |dd|)
                                          (COND
                                           ((EQL |dd| |d1|)
                                            (SEQ
                                             (SEQ
                                              (LETT |f|
                                                    (SPADCALL |p2| |p1|
                                                              (QREFELT $ 19))
                                                    . #8#)
                                              (EXIT
                                               (COND
                                                ((NULL (QEQCAR |f| 1))
                                                 (PROGN
                                                  (LETT #1#
                                                        (CONS 0
                                                              (VECTOR
                                                               (LIST |u|)
                                                               |ltry| |p1|))
                                                        . #8#)
                                                  (GO #1#))))))
                                             (EXIT
                                              (COND
                                               ((SPADCALL |dd| |d2|
                                                          (QREFELT $ 33))
                                                (LETT |dd|
                                                      (PROG1
                                                          (LETT #3# (- |dd| 1)
                                                                . #8#)
                                                        (|check_subtype|
                                                         (>= #3# 0)
                                                         '(|NonNegativeInteger|)
                                                         #3#))
                                                      . #8#))))))
                                           ((EQL |dd| |d2|)
                                            (SEQ
                                             (SEQ
                                              (LETT |f|
                                                    (SPADCALL |p1| |p2|
                                                              (QREFELT $ 19))
                                                    . #8#)
                                              (EXIT
                                               (COND
                                                ((NULL (QEQCAR |f| 1))
                                                 (PROGN
                                                  (LETT #1#
                                                        (CONS 0
                                                              (VECTOR
                                                               (LIST |u|)
                                                               |ltry| |p2|))
                                                        . #8#)
                                                  (GO #1#))))))
                                             (EXIT
                                              (LETT |dd|
                                                    (PROG1
                                                        (LETT #2# (- |dd| 1)
                                                              . #8#)
                                                      (|check_subtype|
                                                       (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       #2#))
                                                    . #8#))))
                                           ('T
                                            (PROGN
                                             (LETT #1# (CONS 0 |uterm|) . #8#)
                                             (GO #1#)))))
                                         ((< |du| |dd|)
                                          (LETT |dd| |du|
                                                . #8#)))))))))))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #1# (EXIT #1#)))) 

(SDEFUN |PGCD;good|
        ((|f| |SparseUnivariatePolynomial| P) (|lvr| |List| OV)
         (|ltry| |List| (|List| R))
         ($ |Record| (|:| |upol| (|SparseUnivariatePolynomial| R))
          (|:| |inval| (|List| (|List| R)))))
        (SPROG
         ((#1=#:G172 NIL) (|uf| (|SparseUnivariatePolynomial| R))
          (|lval| (|List| R)) (|i| NIL) (#2=#:G173 NIL) (|range| (|Integer|))
          (|nvr| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |nvr| (LENGTH |lvr|) . #3=(|PGCD;good|))
                (LETT |range| 1 . #3#)
                (EXIT
                 (SEQ G190 (COND ((NULL 'T) (GO G191)))
                      (SEQ
                       (LETT |range| (SPADCALL 2 |range| (QREFELT $ 22)) . #3#)
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
          #1# (EXIT #1#)))) 

(SDEFUN |PGCD;imposelc|
        ((|lipol| |List| (|SparseUnivariatePolynomial| R)) (|lvar| |List| OV)
         (|lval| |List| R) (|leadc| |List| P)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| R)) "failed"))
        (SPROG
         ((|result| (|List| (|SparseUnivariatePolynomial| R))) (#1=#:G183 NIL)
          (|p1u| (|Union| (|SparseUnivariatePolynomial| R) "failed"))
          (|p1| (|SparseUnivariatePolynomial| R)) (#2=#:G184 NIL) (|pol| NIL)
          (#3=#:G185 NIL) (|leadpol| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |result| NIL . #4=(|PGCD;imposelc|))
                (SEQ (LETT |leadpol| NIL . #4#) (LETT #3# |leadc| . #4#)
                     (LETT |pol| NIL . #4#) (LETT #2# |lipol| . #4#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |pol| (CAR #2#) . #4#) NIL)
                           (ATOM #3#)
                           (PROGN (LETT |leadpol| (CAR #3#) . #4#) NIL))
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
                        ('T
                         (LETT |result| (CONS (QCDR |p1u|) |result|) . #4#)))))
                     (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#))
                           . #4#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (REVERSE |result|)))))
          #1# (EXIT #1#)))) 

(SDEFUN |PGCD;notCoprime|
        ((|g| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P)
         (|ldeg| |List| (|NonNegativeInteger|)) (|lvar1| |List| OV)
         (|ltry| |List| (|List| R)) ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((|ulist| (|List| #1=(|SparseUnivariatePolynomial| R)))
          (#2=#:G194 NIL) (#3=#:G205 NIL) (|uf| NIL) (#4=#:G204 NIL)
          (|gd1| #5=(|SparseUnivariatePolynomial| P))
          (|dl| (|NonNegativeInteger|)) (|ul| #1#) (|l| #5#) (|gd2| #5#)
          (#6=#:G203 NIL)
          (|gdl| (|Union| (|SparseUnivariatePolynomial| P) "failed"))
          (|lgcd| (P)) (|lquo| (|SparseUnivariatePolynomial| R))
          (|d| (|SparseUnivariatePolynomial| R)) (|lcpol| (|List| P))
          (|ug1| #1#) (|lval| (|List| R))
          (|newchoice|
           (|Record| (|:| |upol| (|SparseUnivariatePolynomial| R))
                     (|:| |inval| (|List| (|List| R)))))
          (|#G33| #5#) (|#G32| #5#) (|p2l| (|SparseUnivariatePolynomial| P))
          (#7=#:G187 NIL) (|#G31| (|List| (|List| R))) (|#G30| #5#)
          (|lg|
           (|Record| (|:| |locgcd| (|SparseUnivariatePolynomial| P))
                     (|:| |goodint| (|List| (|List| R)))))
          (|l1| (|SparseUnivariatePolynomial| P))
          (|g1| (|SparseUnivariatePolynomial| P)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |g1|
                  (SPADCALL |g| (SPADCALL |g| (QREFELT $ 48)) (QREFELT $ 49))
                  . #8=(|PGCD;notCoprime|))
            (LETT |l1|
                  (PROG2 (LETT #7# (SPADCALL |g| |g1| (QREFELT $ 19)) . #8#)
                      (QCDR #7#)
                    (|check_union| (QEQCAR #7# 0)
                                   (|SparseUnivariatePolynomial| (QREFELT $ 9))
                                   #7#))
                  . #8#)
            (LETT |lg| (|PGCD;localgcd| |l1| |p2| |lvar1| |ltry| $) . #8#)
            (PROGN
             (LETT |#G30| (QCAR |lg|) . #8#)
             (LETT |#G31| (QCDR |lg|) . #8#)
             (LETT |l| |#G30| . #8#)
             (LETT |ltry| |#G31| . #8#))
            (LETT |lval| (|SPADfirst| |ltry|) . #8#)
            (LETT |p2l|
                  (PROG2 (LETT #7# (SPADCALL |p2| |l| (QREFELT $ 19)) . #8#)
                      (QCDR #7#)
                    (|check_union| (QEQCAR #7# 0)
                                   (|SparseUnivariatePolynomial| (QREFELT $ 9))
                                   #7#))
                  . #8#)
            (PROGN
             (LETT |#G32| |l| . #8#)
             (LETT |#G33| |l| . #8#)
             (LETT |gd1| |#G32| . #8#)
             (LETT |gd2| |#G33| . #8#))
            (LETT |ul| (SPADCALL |l| |lvar1| |lval| (QREFELT $ 31)) . #8#)
            (LETT |dl| (SPADCALL |ul| (QREFELT $ 32)) . #8#)
            (COND
             ((SPADCALL
               (SPADCALL
                (SPADCALL |ul| (SPADCALL |ul| (QREFELT $ 42)) (QREFELT $ 34))
                (QREFELT $ 32))
               0 (QREFELT $ 33))
              (SEQ (LETT |newchoice| (|PGCD;good| |l| |lvar1| |ltry| $) . #8#)
                   (LETT |ul| (QCAR |newchoice|) . #8#)
                   (LETT |ltry| (QCDR |newchoice|) . #8#)
                   (EXIT (LETT |lval| (|SPADfirst| |ltry|) . #8#)))))
            (LETT |ug1| (SPADCALL |g1| |lvar1| |lval| (QREFELT $ 31)) . #8#)
            (LETT |ulist|
                  (LIST |ug1| (SPADCALL |p2l| |lvar1| |lval| (QREFELT $ 31)))
                  . #8#)
            (LETT |lcpol|
                  (LIST (SPADCALL |g1| (QREFELT $ 50))
                        (SPADCALL |p2| (QREFELT $ 50)))
                  . #8#)
            (EXIT
             (SEQ G190 (COND ((NULL 'T) (GO G191)))
                  (SEQ
                   (LETT |d| (SPADCALL (CONS |ul| |ulist|) (QREFELT $ 52))
                         . #8#)
                   (COND
                    ((EQL (SPADCALL |d| (QREFELT $ 32)) 0)
                     (PROGN (LETT #6# |gd1| . #8#) (GO #6#))))
                   (LETT |lquo|
                         (PROG2
                             (LETT #2# (SPADCALL |ul| |d| (QREFELT $ 39))
                                   . #8#)
                             (QCDR #2#)
                           (|check_union| (QEQCAR #2# 0)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 8))
                                          #2#))
                         . #8#)
                   (COND
                    ((SPADCALL (SPADCALL |lquo| (QREFELT $ 32)) 0
                               (QREFELT $ 33))
                     (SEQ
                      (LETT |lgcd|
                            (SPADCALL
                             (CONS (SPADCALL |l| (QREFELT $ 50)) |lcpol|)
                             (QREFELT $ 54))
                            . #8#)
                      (LETT |gdl|
                            (|PGCD;lift| |l| |d| |lquo| |lgcd| |lvar1| |ldeg|
                             |lval| $)
                            . #8#)
                      (EXIT
                       (COND
                        ((QEQCAR |gdl| 1)
                         (PROGN
                          (LETT #6#
                                (|PGCD;notCoprime| |g| |p2| |ldeg| |lvar1|
                                 |ltry| $)
                                . #8#)
                          (GO #6#)))
                        ('T
                         (SEQ (LETT |l| (LETT |gd2| (QCDR |gdl|) . #8#) . #8#)
                              (LETT |ul|
                                    (SPADCALL |l| |lvar1| |lval|
                                              (QREFELT $ 31))
                                    . #8#)
                              (EXIT
                               (LETT |dl| (SPADCALL |ul| (QREFELT $ 32))
                                     . #8#)))))))))
                   (LETT |gd1| (SPADCALL |gd1| |gd2| (QREFELT $ 55)) . #8#)
                   (EXIT
                    (LETT |ulist|
                          (PROGN
                           (LETT #4# NIL . #8#)
                           (SEQ (LETT |uf| NIL . #8#) (LETT #3# |ulist| . #8#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |uf| (CAR #3#) . #8#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS
                                         (PROG2
                                             (LETT #2#
                                                   (SPADCALL |uf| |d|
                                                             (QREFELT $ 39))
                                                   . #8#)
                                             (QCDR #2#)
                                           (|check_union| (QEQCAR #2# 0)
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT $ 8))
                                                          #2#))
                                         #4#)
                                        . #8#)))
                                (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          . #8#)))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #6#)))) 

(SDEFUN |PGCD;gcdPrimitive;3Sup;6|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((|result| #1=(|SparseUnivariatePolynomial| P))
          (|totResult|
           (|Record| (|:| |locgcd| #1#) (|:| |goodint| (|List| (|List| R)))))
          (|ltry| (|List| (|List| R))) (|lvar| (|List| OV))
          (|d2| #2=(|NonNegativeInteger|)) (|d1| #2#) (|#G40| #2#) (|#G39| #2#)
          (|#G38| (|SparseUnivariatePolynomial| P))
          (|#G37| (|SparseUnivariatePolynomial| P)))
         (SEQ
          (SEQ
           (LETT |d1| (SPADCALL |p1| (QREFELT $ 21))
                 . #3=(|PGCD;gcdPrimitive;3Sup;6|))
           (LETT |d2| (SPADCALL |p2| (QREFELT $ 21)) . #3#)
           (EXIT
            (COND
             ((SPADCALL |d1| |d2| (QREFELT $ 56))
              (SEQ
               (PROGN
                (LETT |#G37| |p2| . #3#)
                (LETT |#G38| |p1| . #3#)
                (LETT |p1| |#G37| . #3#)
                (LETT |p2| |#G38| . #3#))
               (EXIT
                (PROGN
                 (LETT |#G39| |d2| . #3#)
                 (LETT |#G40| |d1| . #3#)
                 (LETT |d1| |#G39| . #3#)
                 (LETT |d2| |#G40| . #3#))))))))
          (EXIT
           (COND
            ((EQL (SPADCALL |p1| (QREFELT $ 21)) 0)
             (COND
              ((SPADCALL |p1| (|spadConstant| $ 38) (QREFELT $ 57))
               (SPADCALL |p2| (QREFELT $ 58)))
              (#4='T (SPADCALL |p1| (QREFELT $ 58)))))
            (#4#
             (SEQ
              (LETT |lvar|
                    (SPADCALL (ELT $ 59)
                              (SPADCALL (SPADCALL |p1| (QREFELT $ 60))
                                        (SPADCALL |p2| (QREFELT $ 60))
                                        (QREFELT $ 61))
                              (QREFELT $ 63))
                    . #3#)
              (EXIT
               (COND
                ((NULL |lvar|)
                 (SPADCALL
                  (SPADCALL (SPADCALL |p1| (QREFELT $ 64))
                            (SPADCALL |p2| (QREFELT $ 64)) (QREFELT $ 34))
                  (QREFELT $ 65)))
                ((QEQCAR (SPADCALL |p2| |p1| (QREFELT $ 19)) 0)
                 (SPADCALL |p1| (QREFELT $ 58)))
                (#4#
                 (SEQ (LETT |ltry| NIL . #3#)
                      (LETT |totResult|
                            (|PGCD;localgcd| |p1| |p2| |lvar| |ltry| $) . #3#)
                      (LETT |result| (QCAR |totResult|) . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL |result| (|spadConstant| $ 66)
                                   (QREFELT $ 57))
                         (|spadConstant| $ 66))
                        (#4#
                         (SEQ
                          (SEQ G190
                               (COND
                                ((NULL (|PGCD;failtest| |result| |p1| |p2| $))
                                 (GO G191)))
                               (SEQ (LETT |ltry| (QCDR |totResult|) . #3#)
                                    (LETT |totResult|
                                          (|PGCD;localgcd| |p1| |p2| |lvar|
                                           |ltry| $)
                                          . #3#)
                                    (EXIT
                                     (LETT |result| (QCAR |totResult|) . #3#)))
                               NIL (GO G190) G191 (EXIT NIL))
                          (EXIT |result|)))))))))))))))) 

(SDEFUN |PGCD;localgcd|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ltry| |List| (|List| R))
         ($ |Record| (|:| |locgcd| (|SparseUnivariatePolynomial| P))
          (|:| |goodint| (|List| (|List| R)))))
        (SPROG
         ((#1=#:G225 NIL)
          (|h|
           (|Union| (|:| |s| (|SparseUnivariatePolynomial| P))
                    (|:| |failed| "failed") (|:| |notCoprime| "notCoprime")))
          (|ldeg| (|List| (|NonNegativeInteger|)))
          (|dd| (|NonNegativeInteger|)) (|ud| (|SparseUnivariatePolynomial| R))
          (|listpol| (|List| (|SparseUnivariatePolynomial| R)))
          (|uterm|
           (|Record| (|:| |lpol| (|List| (|SparseUnivariatePolynomial| R)))
                     (|:| |lint| (|List| (|List| R)))
                     (|:| |mpol| (|SparseUnivariatePolynomial| P))))
          (#2=#:G143 NIL))
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
                         (SPADCALL (ELT $ 68)
                                   (SPADCALL |p1| |lvar| (QREFELT $ 70))
                                   (SPADCALL |p2| |lvar| (QREFELT $ 70))
                                   (QREFELT $ 72))
                         . #3#)
                   (LETT |h| (|PGCD;lift?| |p1| |p2| |uterm| |ldeg| |lvar| $)
                         . #3#)
                   (EXIT
                    (COND
                     ((QEQCAR |h| 2)
                      (CONS
                       (|PGCD;notCoprime| |p1| |p2| |ldeg| |lvar| |ltry| $)
                       |ltry|))
                     ((QEQCAR |h| 1)
                      (|PGCD;localgcd| |p1| |p2| |lvar| |ltry| $))
                     ('T
                      (CONS
                       (PROG2 (LETT #1# |h| . #3#)
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 0)
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 9))
                                        #1#))
                       |ltry|))))))))))) 

(SDEFUN |PGCD;monomContent|
        ((|p| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG ((|md| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((EQL (SPADCALL |p| (QREFELT $ 21)) 0) (|spadConstant| $ 66))
                 ('T
                  (SEQ
                   (LETT |md| (SPADCALL |p| (QREFELT $ 73))
                         |PGCD;monomContent|)
                   (EXIT
                    (SPADCALL
                     (SPADCALL (SPADCALL |p| (QREFELT $ 74)) (QREFELT $ 54))
                     |md| (QREFELT $ 75))))))))) 

(SDEFUN |PGCD;better| ((|p1| P) (|p2| P) ($ |Boolean|))
        (SPROG ((#1=#:G235 NIL))
               (COND ((SPADCALL |p1| (QREFELT $ 76)) 'T)
                     ((SPADCALL |p2| (QREFELT $ 76)) 'NIL)
                     ('T
                      (<
                       (SPADCALL |p1|
                                 (PROG2
                                     (LETT #1# (SPADCALL |p1| (QREFELT $ 78))
                                           . #2=(|PGCD;better|))
                                     (QCDR #1#)
                                   (|check_union| (QEQCAR #1# 0) (QREFELT $ 7)
                                                  #1#))
                                 (QREFELT $ 79))
                       (SPADCALL |p2|
                                 (PROG2
                                     (LETT #1# (SPADCALL |p2| (QREFELT $ 78))
                                           . #2#)
                                     (QCDR #1#)
                                   (|check_union| (QEQCAR #1# 0) (QREFELT $ 7)
                                                  #1#))
                                 (QREFELT $ 79))))))) 

(SDEFUN |PGCD;best_to_front| ((|l| |List| P) ($ |List| P))
        (SPROG ((|ress| (|List| P)) (|best| (P)) (#1=#:G245 NIL) (|p| NIL))
               (SEQ (LETT |ress| NIL . #2=(|PGCD;best_to_front|))
                    (LETT |best| (|SPADfirst| |l|) . #2#)
                    (SEQ (LETT |p| NIL . #2#) (LETT #1# (CDR |l|) . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|PGCD;better| |p| |best| $)
                             (SEQ (LETT |ress| (CONS |best| |ress|) . #2#)
                                  (EXIT (LETT |best| |p| . #2#))))
                            ('T (LETT |ress| (CONS |p| |ress|) . #2#)))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS |best| |ress|))))) 

(SDEFUN |PGCD;gcdTermList| ((|p1| P) (|p2| P) ($ P))
        (SPROG
         ((|q| (P)) (#1=#:G252 NIL) (|term| NIL) (#2=#:G253 NIL)
          (|termList| (|List| P)) (#3=#:G247 NIL))
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
               (SEQ
                (EXIT (LETT |q| (SPADCALL |q| |term| (QREFELT $ 82)) . #4#)))
               (LETT #1#
                     (PROG1 (CDR #1#)
                       (LETT #2#
                             (SPADCALL |q| (|spadConstant| $ 41)
                                       (QREFELT $ 83))
                             . #4#))
                     . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |q|)))) 

(SDEFUN |PGCD;gcd;3Sup;12|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((#1=#:G256 NIL) (|c2| #2=(|SparseUnivariatePolynomial| P)) (|c1| #2#)
          (|#G58| (|SparseUnivariatePolynomial| P))
          (|#G57| (|SparseUnivariatePolynomial| P)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |p1| (QREFELT $ 21))
                      (SPADCALL |p2| (QREFELT $ 21)) (QREFELT $ 56))
            (PROGN
             (LETT |#G57| |p2| . #3=(|PGCD;gcd;3Sup;12|))
             (LETT |#G58| |p1| . #3#)
             (LETT |p1| |#G57| . #3#)
             (LETT |p2| |#G58| . #3#))))
          (EXIT
           (COND
            ((EQL (SPADCALL |p1| (QREFELT $ 21)) 0)
             (COND
              ((SPADCALL |p1| (|spadConstant| $ 38) (QREFELT $ 57))
               (SPADCALL |p2| (QREFELT $ 58)))
              ((SPADCALL |p1| (|spadConstant| $ 66) (QREFELT $ 57))
               (SPADCALL |p1| (QREFELT $ 58)))
              (#4='T
               (SPADCALL
                (SPADCALL (SPADCALL |p1| (QREFELT $ 50))
                          (SPADCALL |p2| (QREFELT $ 84)) (QREFELT $ 82))
                (QREFELT $ 85)))))
            ((SPADCALL (SPADCALL |p1| (QREFELT $ 86)) (|spadConstant| $ 38)
                       (QREFELT $ 57))
             (|PGCD;gcdMonom| |p1| (|PGCD;monomContent| |p2| $) $))
            (#4#
             (SEQ (LETT |c1| (|PGCD;monomContent| |p1| $) . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |p2| (QREFELT $ 86))
                               (|spadConstant| $ 38) (QREFELT $ 57))
                     (|PGCD;gcdMonom| |c1| |p2| $))
                    (#4#
                     (SEQ (LETT |c2| (|PGCD;monomContent| |p2| $) . #3#)
                          (LETT |p1|
                                (PROG2
                                    (LETT #1#
                                          (SPADCALL |p1| |c1| (QREFELT $ 19))
                                          . #3#)
                                    (QCDR #1#)
                                  (|check_union| (QEQCAR #1# 0)
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT $ 9))
                                                 #1#))
                                . #3#)
                          (LETT |p2|
                                (PROG2
                                    (LETT #1#
                                          (SPADCALL |p2| |c2| (QREFELT $ 19))
                                          . #3#)
                                    (QCDR #1#)
                                  (|check_union| (QEQCAR #1# 0)
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT $ 9))
                                                 #1#))
                                . #3#)
                          (EXIT
                           (SPADCALL (SPADCALL |p1| |p2| (QREFELT $ 67))
                                     (|PGCD;gcdMonom| |c1| |c2| $)
                                     (QREFELT $ 55)))))))))))))) 

(SDEFUN |PGCD;gcdMonom|
        ((|m1| |SparseUnivariatePolynomial| P)
         (|m2| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPADCALL
         (SPADCALL (SPADCALL |m1| (QREFELT $ 50))
                   (SPADCALL |m2| (QREFELT $ 50)) (QREFELT $ 82))
         (MIN (SPADCALL |m1| (QREFELT $ 21)) (SPADCALL |m2| (QREFELT $ 21)))
         (QREFELT $ 75))) 

(SDEFUN |PGCD;lift?|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P)
         (|uterm| |Record|
          (|:| |lpol| (|List| (|SparseUnivariatePolynomial| R)))
          (|:| |lint| (|List| (|List| R)))
          (|:| |mpol| (|SparseUnivariatePolynomial| P)))
         (|ldeg| |List| (|NonNegativeInteger|)) (|lvar| |List| OV)
         ($ |Union| (|:| |s| (|SparseUnivariatePolynomial| P))
          (|:| |failed| #1="failed") (|:| |notCoprime| #2="notCoprime")))
        (SPROG
         ((|l| (|Union| (|SparseUnivariatePolynomial| P) "failed"))
          (|lgcd| (P)) (|f| (|SparseUnivariatePolynomial| P)) (#3=#:G268 NIL)
          (|nolift| (|Boolean|)) (#4=#:G275 NIL) (|uf| NIL)
          (|listpol| #5=(|List| (|SparseUnivariatePolynomial| R)))
          (|d| (|SparseUnivariatePolynomial| R)) (|lval| #6=(|List| R))
          (|#G67| #6#) (|#G66| #5#) (|leadpol| (|Boolean|)))
         (SEQ (LETT |leadpol| 'NIL . #7=(|PGCD;lift?|))
              (PROGN
               (LETT |#G66| (QVELT |uterm| 0) . #7#)
               (LETT |#G67| (|SPADfirst| (QVELT |uterm| 1)) . #7#)
               (LETT |listpol| |#G66| . #7#)
               (LETT |lval| |#G67| . #7#))
              (LETT |d| (|SPADfirst| |listpol|) . #7#)
              (LETT |listpol| (CDR |listpol|) . #7#) (LETT |nolift| 'T . #7#)
              (SEQ
               (EXIT
                (SEQ (LETT |uf| NIL . #7#) (LETT #4# |listpol| . #7#) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |uf| (CAR #4#) . #7#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQL
                          (SPADCALL (SPADCALL |uf| |d| (QREFELT $ 34))
                                    (QREFELT $ 32))
                          0)
                         (PROGN
                          (LETT #3# (LETT |nolift| 'NIL . #7#) . #7#)
                          (GO #3#))))))
                     (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL)))
               #3# (EXIT #3#))
              (EXIT
               (COND (|nolift| (CONS 2 #2#))
                     (#8='T
                      (SEQ
                       (LETT |f|
                             (SPADCALL (LIST |p1| |p2|)
                                       (SPADCALL |uf| |listpol| (QREFELT $ 88))
                                       (QREFELT $ 90))
                             . #7#)
                       (LETT |lgcd|
                             (SPADCALL (SPADCALL |p1| (QREFELT $ 50))
                                       (SPADCALL |p2| (QREFELT $ 50))
                                       (QREFELT $ 82))
                             . #7#)
                       (LETT |l|
                             (|PGCD;lift| |f| |d| |uf| |lgcd| |lvar| |ldeg|
                              |lval| $)
                             . #7#)
                       (EXIT
                        (COND ((QEQCAR |l| 1) (CONS 1 #1#))
                              (#8# (CONS 0 (QCDR |l|)))))))))))) 

(SDEFUN |PGCD;lift|
        ((|f| |SparseUnivariatePolynomial| P)
         (|d| |SparseUnivariatePolynomial| R)
         (|uf| |SparseUnivariatePolynomial| R) (|lgcd| P) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|)) (|lval| |List| R)
         ($ |Union| (|SparseUnivariatePolynomial| P) "failed"))
        (SPROG
         ((|p1| #1=(|SparseUnivariatePolynomial| P))
          (|p0| #2=(|SparseUnivariatePolynomial| P)) (|#G83| #2#) (|#G82| #1#)
          (|#G81| #1#) (|#G80| #2#)
          (|plist| (|List| (|SparseUnivariatePolynomial| P)))
          (|pl| (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (|lg| (|List| (|SparseUnivariatePolynomial| R)))
          (|lgu| (|Union| (|List| (|SparseUnivariatePolynomial| R)) "failed"))
          (|leadlist| (|List| P)) (#3=#:G281 NIL) (|lcd| (R)) (#4=#:G295 NIL)
          (|n0| NIL) (#5=#:G296 NIL) (|n1| NIL) (#6=#:G294 NIL)
          (|leadpol| (|Boolean|)) (|df| (|NonNegativeInteger|)) (|lcf| (P)))
         (SEQ (LETT |leadpol| 'NIL . #7=(|PGCD;lift|))
              (LETT |lcf| (SPADCALL |f| (QREFELT $ 50)) . #7#)
              (LETT |df| (SPADCALL |f| (QREFELT $ 21)) . #7#)
              (LETT |leadlist| NIL . #7#)
              (COND
               ((SPADCALL |lgcd| (|spadConstant| $ 41) (QREFELT $ 91))
                (SEQ (LETT |leadpol| 'T . #7#)
                     (LETT |f| (SPADCALL |lgcd| |f| (QREFELT $ 92)) . #7#)
                     (LETT |ldeg|
                           (PROGN
                            (LETT #6# NIL . #7#)
                            (SEQ (LETT |n1| NIL . #7#)
                                 (LETT #5#
                                       (SPADCALL |lgcd| |lvar| (QREFELT $ 93))
                                       . #7#)
                                 (LETT |n0| NIL . #7#) (LETT #4# |ldeg| . #7#)
                                 G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN (LETT |n0| (CAR #4#) . #7#) NIL)
                                       (ATOM #5#)
                                       (PROGN (LETT |n1| (CAR #5#) . #7#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #6# (CONS (+ |n0| |n1|) #6#) . #7#)))
                                 (LETT #4#
                                       (PROG1 (CDR #4#)
                                         (LETT #5# (CDR #5#) . #7#))
                                       . #7#)
                                 (GO G190) G191 (EXIT (NREVERSE #6#))))
                           . #7#)
                     (LETT |lcd| (SPADCALL |d| (QREFELT $ 46)) . #7#)
                     (COND
                      ((SPADCALL (SPADCALL |lgcd| (QREFELT $ 94))
                                 (|spadConstant| $ 35) (QREFELT $ 95))
                       (LETT |d|
                             (PROG2
                                 (LETT #3#
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |lgcd| (QREFELT $ 96)) |d|
                                         (QREFELT $ 97))
                                        |lcd| (QREFELT $ 47))
                                       . #7#)
                                 (QCDR #3#)
                               (|check_union| (QEQCAR #3# 0)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 8))
                                              #3#))
                             . #7#))
                      (#8='T
                       (LETT |d|
                             (PROG2
                                 (LETT #3#
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |lgcd| |lvar| |lval|
                                                    (QREFELT $ 43))
                                          (QREFELT $ 96))
                                         |d| (QREFELT $ 97))
                                        |lcd| (QREFELT $ 47))
                                       . #7#)
                                 (QCDR #3#)
                               (|check_union| (QEQCAR #3# 0)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 8))
                                              #3#))
                             . #7#)))
                     (EXIT
                      (LETT |uf| (SPADCALL |lcd| |uf| (QREFELT $ 97))
                            . #7#)))))
              (LETT |leadlist| (LIST |lgcd| |lcf|) . #7#)
              (LETT |lgu|
                    (|PGCD;imposelc| (LIST |d| |uf|) |lvar| |lval| |leadlist|
                     $)
                    . #7#)
              (EXIT
               (COND ((QEQCAR |lgu| 1) (CONS 1 "failed"))
                     (#8#
                      (SEQ (LETT |lg| (QCDR |lgu|) . #7#)
                           (LETT |pl|
                                 (SPADCALL |f| |lvar| |lg| |lval| |leadlist|
                                           |ldeg| (QREFELT $ 16)
                                           (QREFELT $ 100))
                                 . #7#)
                           (EXIT
                            (COND ((QEQCAR |pl| 1) (CONS 1 "failed"))
                                  (#8#
                                   (SEQ (LETT |plist| (QCDR |pl|) . #7#)
                                        (PROGN
                                         (LETT |#G80| (|SPADfirst| |plist|)
                                               . #7#)
                                         (LETT |#G81|
                                               (SPADCALL |plist| 2
                                                         (QREFELT $ 90))
                                               . #7#)
                                         (LETT |p0| |#G80| . #7#)
                                         (LETT |p1| |#G81| . #7#))
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |p0| |lvar| |lval|
                                                     (QREFELT $ 31))
                                           (|SPADfirst| |lg|) (QREFELT $ 101))
                                          (PROGN
                                           (LETT |#G82| |p1| . #7#)
                                           (LETT |#G83| |p0| . #7#)
                                           (LETT |p0| |#G82| . #7#)
                                           (LETT |p1| |#G83| . #7#))))
                                        (EXIT
                                         (COND
                                          (|leadpol|
                                           (SPADCALL |p0|
                                                     (SPADCALL |p0|
                                                               (QREFELT $ 84))
                                                     (QREFELT $ 102)))
                                          (#8# (CONS 0 |p0|))))))))))))))) 

(SDEFUN |PGCD;gcd;3P;16| ((|p1| P) (|p2| P) ($ P))
        (SPROG ((|mv2| (OV)) (#1=#:G301 NIL) (|mv1| (OV)))
               (SEQ
                (COND
                 ((SPADCALL |p1| (QREFELT $ 76))
                  (SEQ
                   (LETT |p1| (SPADCALL |p1| (QREFELT $ 103))
                         . #2=(|PGCD;gcd;3P;16|))
                   (EXIT
                    (COND
                     ((SPADCALL |p1| (|spadConstant| $ 41) (QREFELT $ 83))
                      |p1|)
                     ((SPADCALL |p1| (|spadConstant| $ 104) (QREFELT $ 83))
                      (SPADCALL |p2| (QREFELT $ 103)))
                     (#3='T
                      (COND
                       ((SPADCALL |p2| (QREFELT $ 76))
                        (SPADCALL
                         (SPADCALL (SPADCALL |p1| (QREFELT $ 96))
                                   (SPADCALL |p2| (QREFELT $ 96))
                                   (QREFELT $ 105))
                         (QREFELT $ 106)))
                       (#3# (|PGCD;gcdTermList| |p1| |p2| $))))))))
                 ((SPADCALL |p2| (QREFELT $ 76))
                  (SEQ (LETT |p2| (SPADCALL |p2| (QREFELT $ 103)) . #2#)
                       (EXIT
                        (COND
                         ((SPADCALL |p2| (|spadConstant| $ 41) (QREFELT $ 83))
                          |p2|)
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
                                          (LETT #1#
                                                (SPADCALL |p1| (QREFELT $ 78))
                                                . #2#)
                                          (QCDR #1#)
                                        (|check_union| (QEQCAR #1# 0)
                                                       (QREFELT $ 7) #1#))
                                      . #2#)
                                (LETT |mv2|
                                      (PROG2
                                          (LETT #1#
                                                (SPADCALL |p2| (QREFELT $ 78))
                                                . #2#)
                                          (QCDR #1#)
                                        (|check_union| (QEQCAR #1# 0)
                                                       (QREFELT $ 7) #1#))
                                      . #2#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |mv1| |mv2| (QREFELT $ 107))
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |p1| |mv1| (QREFELT $ 81))
                                     (SPADCALL |p2| |mv1| (QREFELT $ 81))
                                     (QREFELT $ 49))
                                    |mv1| (QREFELT $ 108)))
                                  ((SPADCALL |mv1| |mv2| (QREFELT $ 109))
                                   (|PGCD;gcdTermList| |p1| |p2| $))
                                  (#3#
                                   (|PGCD;gcdTermList| |p2| |p1| $)))))))))))))) 

(SDEFUN |PGCD;gcd;LP;17| ((|listp| |List| P) ($ P))
        (SPROG
         ((#1=#:G311 NIL) (|f| (P)) (#2=#:G312 NIL) (|g| NIL)
          (|lf| (|List| P)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lf| (|PGCD;best_to_front| |listp| $)
                  . #3=(|PGCD;gcd;LP;17|))
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
          #1# (EXIT #1#)))) 

(SDEFUN |PGCD;gcd;LSup;18|
        ((|listp| |List| (|SparseUnivariatePolynomial| P))
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((#1=#:G321 NIL) (|f| (|SparseUnivariatePolynomial| P))
          (#2=#:G322 NIL) (|g| NIL)
          (|lf| (|List| (|SparseUnivariatePolynomial| P))))
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
          #1# (EXIT #1#)))) 

(SDEFUN |PGCD;gcd;LSup;18!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 21)) (SPADCALL |z2| (QREFELT $ 21))
                  (QREFELT $ 110))) 

(SDEFUN |PGCD;gcdPrimitive;3P;19| ((|p1| P) (|p2| P) ($ P))
        (SPROG
         ((|up2| #1=(|SparseUnivariatePolynomial| P)) (|up1| #1#)
          (#2=#:G328 NIL) (|mp| (P)) (|md| (|NonNegativeInteger|)) (|mv2| (OV))
          (#3=#:G325 NIL) (|mv1| (OV)))
         (SEQ
          (LETT |p1| (SPADCALL |p1| (QREFELT $ 103))
                . #4=(|PGCD;gcdPrimitive;3P;19|))
          (LETT |p2| (SPADCALL |p2| (QREFELT $ 103)) . #4#)
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
                   (#5='T (|spadConstant| $ 41))))
                 ((SPADCALL |p2| (QREFELT $ 76))
                  (COND
                   ((SPADCALL |p2| (|spadConstant| $ 104) (QREFELT $ 83)) |p1|)
                   (#5# (|spadConstant| $ 41))))
                 (#5#
                  (SEQ
                   (LETT |mv1|
                         (PROG2 (LETT #3# (SPADCALL |p1| (QREFELT $ 78)) . #4#)
                             (QCDR #3#)
                           (|check_union| (QEQCAR #3# 0) (QREFELT $ 7) #3#))
                         . #4#)
                   (LETT |mv2|
                         (PROG2 (LETT #3# (SPADCALL |p2| (QREFELT $ 78)) . #4#)
                             (QCDR #3#)
                           (|check_union| (QEQCAR #3# 0) (QREFELT $ 7) #3#))
                         . #4#)
                   (EXIT
                    (COND
                     ((SPADCALL |mv1| |mv2| (QREFELT $ 107))
                      (SEQ
                       (LETT |md|
                             (MIN (SPADCALL |p1| |mv1| (QREFELT $ 114))
                                  (SPADCALL |p2| |mv2| (QREFELT $ 114)))
                             . #4#)
                       (LETT |mp| (|spadConstant| $ 41) . #4#)
                       (COND
                        ((SPADCALL |md| 1 (QREFELT $ 56))
                         (SEQ
                          (LETT |mp|
                                (SPADCALL (SPADCALL |mv1| (QREFELT $ 115)) |md|
                                          (QREFELT $ 116))
                                . #4#)
                          (LETT |p1|
                                (PROG2
                                    (LETT #2#
                                          (SPADCALL |p1| |mp| (QREFELT $ 117))
                                          . #4#)
                                    (QCDR #2#)
                                  (|check_union| (QEQCAR #2# 0) (QREFELT $ 9)
                                                 #2#))
                                . #4#)
                          (EXIT
                           (LETT |p2|
                                 (PROG2
                                     (LETT #2#
                                           (SPADCALL |p2| |mp| (QREFELT $ 117))
                                           . #4#)
                                     (QCDR #2#)
                                   (|check_union| (QEQCAR #2# 0) (QREFELT $ 9)
                                                  #2#))
                                 . #4#)))))
                       (LETT |up1| (SPADCALL |p1| |mv1| (QREFELT $ 81)) . #4#)
                       (LETT |up2| (SPADCALL |p2| |mv2| (QREFELT $ 81)) . #4#)
                       (EXIT
                        (SPADCALL |mp|
                                  (SPADCALL
                                   (SPADCALL |up1| |up2| (QREFELT $ 67)) |mv1|
                                   (QREFELT $ 108))
                                  (QREFELT $ 118)))))
                     (#5# (|spadConstant| $ 41))))))))))) 

(SDEFUN |PGCD;gcdPrimitive;LP;20| ((|listp| |List| P) ($ P))
        (SPROG
         ((#1=#:G342 NIL) (|f| (P)) (#2=#:G343 NIL) (|g| NIL)
          (|lf| (|List| P)))
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
          #1# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |PolynomialGcdPackage;|)) 

(DEFUN |PolynomialGcdPackage| (&REST #1=#:G344)
  (SPROG NIL
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
                  (HREM |$ConstructorCache| '|PolynomialGcdPackage|)))))))))) 

(DEFUN |PolynomialGcdPackage;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
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
              (SPADCALL (SPADCALL (EXPT 2 26) (QREFELT $ 14)) (QREFELT $ 15)))
    $))) 

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
