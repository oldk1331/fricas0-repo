
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
         ((|dd| (|NonNegativeInteger|)) (#1=#:G177 NIL) (#2=#:G168 NIL)
          (|f| (|Union| (|SparseUnivariatePolynomial| P) #3="failed"))
          (#4=#:G165 NIL)
          (|uterm|
           (|Record| (|:| |lpol| (|List| (|SparseUnivariatePolynomial| R)))
                     (|:| |lint| (|List| (|List| R)))
                     (|:| |mpol| (|SparseUnivariatePolynomial| P))))
          (|ugcd| (|List| (|SparseUnivariatePolynomial| R))) (#5=#:G159 NIL)
          (|du| (|NonNegativeInteger|)) (|u| (|SparseUnivariatePolynomial| R))
          (|uf2| #6=(|SparseUnivariatePolynomial| R)) (|uf1| #6#)
          (|lval| (|List| R)) (#7=#:G179 NIL) (|i| NIL) (#8=#:G178 NIL)
          (|range| (|Integer|)) (|nvr| (|NonNegativeInteger|))
          (|d2| #9=(|NonNegativeInteger|)) (|d1| #9#))
         (SEQ
          (EXIT
           (SEQ (LETT |d1| (SPADCALL |p1| (QREFELT $ 21)))
                (LETT |d2| (SPADCALL |p2| (QREFELT $ 21))) (LETT |dd| 0)
                (LETT |nvr| (LENGTH |lvr|)) (LETT |lval| NIL) (LETT |range| 8)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |range| (SPADCALL 2 |range| (QREFELT $ 22)))
                           (LETT |lval|
                                 (PROGN
                                  (LETT #8# NIL)
                                  (SEQ (LETT |i| 1) (LETT #7# |nvr|) G190
                                       (COND
                                        ((|greater_SI| |i| #7#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #8#
                                               (CONS
                                                (SPADCALL |range|
                                                          (QREFELT $ 24))
                                                #8#))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT (NREVERSE #8#)))))
                           (EXIT
                            (COND
                             ((SPADCALL |lval| |ltry| (QREFELT $ 28))
                              "new point")
                             ('T
                              (SEQ (LETT |ltry| (CONS |lval| |ltry|))
                                   (LETT |uf1|
                                         (SPADCALL |p1| |lvr| |lval|
                                                   (QREFELT $ 31)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL (SPADCALL |uf1| (QREFELT $ 32))
                                                |d1| (QREFELT $ 33))
                                      "new point")
                                     ('T
                                      (SEQ
                                       (LETT |uf2|
                                             (SPADCALL |p2| |lvr| |lval|
                                                       (QREFELT $ 31)))
                                       (EXIT
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |uf2| (QREFELT $ 32)) |d2|
                                           (QREFELT $ 33))
                                          "new point")
                                         ('T
                                          (SEQ
                                           (LETT |u|
                                                 (SPADCALL |uf1| |uf2|
                                                           (QREFELT $ 34)))
                                           (LETT |du|
                                                 (SPADCALL |u| (QREFELT $ 32)))
                                           (COND
                                            ((EQL |du| 0)
                                             (PROGN
                                              (LETT #1#
                                                    (CONS 0
                                                          (VECTOR
                                                           (LIST
                                                            (|spadConstant| $
                                                                            37))
                                                           |ltry|
                                                           (|spadConstant| $
                                                                           38))))
                                              (GO #10=#:G176))))
                                           (LETT |ugcd|
                                                 (LIST |u|
                                                       (PROG2
                                                           (LETT #5#
                                                                 (SPADCALL
                                                                  |uf1| |u|
                                                                  (QREFELT $
                                                                           39)))
                                                           (QCDR #5#)
                                                         (|check_union2|
                                                          (QEQCAR #5# 0)
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT $ 8))
                                                          (|Union|
                                                           (|SparseUnivariatePolynomial|
                                                            (QREFELT $ 8))
                                                           #3#)
                                                          #5#))
                                                       (PROG2
                                                           (LETT #5#
                                                                 (SPADCALL
                                                                  |uf2| |u|
                                                                  (QREFELT $
                                                                           39)))
                                                           (QCDR #5#)
                                                         (|check_union2|
                                                          (QEQCAR #5# 0)
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT $ 8))
                                                          (|Union|
                                                           (|SparseUnivariatePolynomial|
                                                            (QREFELT $ 8))
                                                           #3#)
                                                          #5#))))
                                           (LETT |uterm|
                                                 (VECTOR |ugcd| |ltry|
                                                         (|spadConstant| $
                                                                         38)))
                                           (EXIT
                                            (COND
                                             ((EQL |dd| 0) (LETT |dd| |du|))
                                             ((EQL |du| |dd|)
                                              (COND
                                               ((EQL |dd| |d1|)
                                                (SEQ
                                                 (SEQ
                                                  (LETT |f|
                                                        (SPADCALL |p2| |p1|
                                                                  (QREFELT $
                                                                           19)))
                                                  (EXIT
                                                   (COND
                                                    ((NULL (QEQCAR |f| 1))
                                                     (PROGN
                                                      (LETT #1#
                                                            (CONS 0
                                                                  (VECTOR
                                                                   (LIST |u|)
                                                                   |ltry|
                                                                   |p1|)))
                                                      (GO #10#))))))
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |dd| |d2|
                                                              (QREFELT $ 33))
                                                    (LETT |dd|
                                                          (PROG1
                                                              (LETT #4#
                                                                    (- |dd| 1))
                                                            (|check_subtype2|
                                                             (>= #4# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|)
                                                             #4#))))))))
                                               ((EQL |dd| |d2|)
                                                (SEQ
                                                 (SEQ
                                                  (LETT |f|
                                                        (SPADCALL |p1| |p2|
                                                                  (QREFELT $
                                                                           19)))
                                                  (EXIT
                                                   (COND
                                                    ((NULL (QEQCAR |f| 1))
                                                     (PROGN
                                                      (LETT #1#
                                                            (CONS 0
                                                                  (VECTOR
                                                                   (LIST |u|)
                                                                   |ltry|
                                                                   |p2|)))
                                                      (GO #10#))))))
                                                 (EXIT
                                                  (LETT |dd|
                                                        (PROG1
                                                            (LETT #2#
                                                                  (- |dd| 1))
                                                          (|check_subtype2|
                                                           (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|)
                                                           #2#))))))
                                               ('T
                                                (PROGN
                                                 (LETT #1# (CONS 0 |uterm|))
                                                 (GO #10#)))))
                                             ((< |du| |dd|)
                                              (LETT |dd| |du|)))))))))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #10# (EXIT #1#)))) 

(SDEFUN |PGCD;good|
        ((|f| |SparseUnivariatePolynomial| P) (|lvr| |List| OV)
         (|ltry| |List| (|List| R))
         ($ |Record| (|:| |upol| (|SparseUnivariatePolynomial| R))
          (|:| |inval| (|List| (|List| R)))))
        (SPROG
         ((#1=#:G187 NIL) (|uf| (|SparseUnivariatePolynomial| R))
          (|lval| (|List| R)) (#2=#:G189 NIL) (|i| NIL) (#3=#:G188 NIL)
          (|range| (|Integer|)) (|nvr| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |nvr| (LENGTH |lvr|)) (LETT |range| 1)
                (EXIT
                 (SEQ G190 (COND ((NULL 'T) (GO G191)))
                      (SEQ (LETT |range| (SPADCALL 2 |range| (QREFELT $ 22)))
                           (LETT |lval|
                                 (PROGN
                                  (LETT #3# NIL)
                                  (SEQ (LETT |i| 1) (LETT #2# |nvr|) G190
                                       (COND
                                        ((|greater_SI| |i| #2#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #3#
                                               (CONS
                                                (SPADCALL |range|
                                                          (QREFELT $ 24))
                                                #3#))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT (NREVERSE #3#)))))
                           (EXIT
                            (COND
                             ((SPADCALL |lval| |ltry| (QREFELT $ 28))
                              "new point")
                             ('T
                              (SEQ (LETT |ltry| (CONS |lval| |ltry|))
                                   (LETT |uf|
                                         (SPADCALL |f| |lvr| |lval|
                                                   (QREFELT $ 31)))
                                   (EXIT
                                    (COND
                                     ((EQL
                                       (SPADCALL
                                        (SPADCALL |uf|
                                                  (SPADCALL |uf|
                                                            (QREFELT $ 42))
                                                  (QREFELT $ 34))
                                        (QREFELT $ 32))
                                       0)
                                      (PROGN
                                       (LETT #1# (CONS |uf| |ltry|))
                                       (GO #4=#:G186))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #4# (EXIT #1#)))) 

(SDEFUN |PGCD;imposelc|
        ((|lipol| |List| (|SparseUnivariatePolynomial| R)) (|lvar| |List| OV)
         (|lval| |List| R) (|leadc| |List| P)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| R)) "failed"))
        (SPROG
         ((|result| (|List| (|SparseUnivariatePolynomial| R))) (#1=#:G200 NIL)
          (|p1u| (|Union| (|SparseUnivariatePolynomial| R) "failed"))
          (|p1| (|SparseUnivariatePolynomial| R)) (#2=#:G201 NIL) (|pol| NIL)
          (#3=#:G202 NIL) (|leadpol| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |result| NIL)
                (SEQ (LETT |leadpol| NIL) (LETT #3# |leadc|) (LETT |pol| NIL)
                     (LETT #2# |lipol|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |pol| (CAR #2#)) NIL)
                           (ATOM #3#) (PROGN (LETT |leadpol| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |p1|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL |leadpol| |lvar| |lval| (QREFELT $ 43))
                              (QREFELT $ 44))
                             |pol| (QREFELT $ 45)))
                      (LETT |p1u|
                            (SPADCALL |p1| (SPADCALL |pol| (QREFELT $ 46))
                                      (QREFELT $ 47)))
                      (EXIT
                       (COND
                        ((QEQCAR |p1u| 1)
                         (PROGN (LETT #1# (CONS 1 "failed")) (GO #4=#:G199)))
                        ('T (LETT |result| (CONS (QCDR |p1u|) |result|))))))
                     (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (REVERSE |result|)))))
          #4# (EXIT #1#)))) 

(SDEFUN |PGCD;notCoprime|
        ((|g| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P)
         (|ldeg| |List| (|NonNegativeInteger|)) (|lvar1| |List| OV)
         (|ltry| |List| (|List| R)) ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((|lval| (|List| R)) (|ul| #1=(|SparseUnivariatePolynomial| R))
          (|newchoice|
           (|Record| (|:| |upol| (|SparseUnivariatePolynomial| R))
                     (|:| |inval| (|List| (|List| R)))))
          (#2=#:G217 NIL)
          (|resu| (|Union| (|SparseUnivariatePolynomial| P) "failed"))
          (|ug2| #1#) (|ug1| #1#) (|lcpol| (|List| P))
          (|dp2l| #3=(|NonNegativeInteger|)) (|dg1| #3#)
          (|p2l| (|SparseUnivariatePolynomial| P)) (#4=#:G204 NIL) (|dl| #3#)
          (#5=#:G216 NIL)
          (|p2u| (|Union| (|SparseUnivariatePolynomial| P) #6="failed"))
          (|l| #7=(|SparseUnivariatePolynomial| P))
          (|#G30|
           (|Record| (|:| |locgcd| #7#) (|:| |goodint| (|List| (|List| R)))))
          (|l1| (|SparseUnivariatePolynomial| P))
          (|g1| (|SparseUnivariatePolynomial| P)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |g1|
                  (SPADCALL |g| (SPADCALL |g| (QREFELT $ 48)) (QREFELT $ 49)))
            (LETT |l1|
                  (PROG2 (LETT #4# (SPADCALL |g| |g1| (QREFELT $ 19)))
                      (QCDR #4#)
                    (|check_union2| (QEQCAR #4# 0)
                                    (|SparseUnivariatePolynomial|
                                     (QREFELT $ 9))
                                    (|Union|
                                     (|SparseUnivariatePolynomial|
                                      (QREFELT $ 9))
                                     #6#)
                                    #4#)))
            (SEQ
             (EXIT
              (SEQ G190 NIL
                   (SEQ
                    (PROGN
                     (LETT |#G30| (|PGCD;localgcd| |l1| |p2| |lvar1| |ltry| $))
                     (LETT |l| (QCAR |#G30|))
                     (LETT |ltry| (QCDR |#G30|))
                     |#G30|)
                    (LETT |p2u| (SPADCALL |p2| |l| (QREFELT $ 19)))
                    (EXIT
                     (COND
                      ((NULL (QEQCAR |p2u| 1))
                       (PROGN (LETT #5# |$NoValue|) (GO #8=#:G208))))))
                   NIL (GO G190) G191 (EXIT NIL)))
             #8# (EXIT #5#))
            (LETT |lval| (|SPADfirst| |ltry|))
            (LETT |dl| (SPADCALL |l| (QREFELT $ 21)))
            (LETT |p2l|
                  (PROG2 (LETT #4# |p2u|)
                      (QCDR #4#)
                    (|check_union2| (QEQCAR #4# 0)
                                    (|SparseUnivariatePolynomial|
                                     (QREFELT $ 9))
                                    (|Union|
                                     (|SparseUnivariatePolynomial|
                                      (QREFELT $ 9))
                                     #6#)
                                    #4#)))
            (LETT |ul| (SPADCALL |l| |lvar1| |lval| (QREFELT $ 31)))
            (LETT |dg1| (SPADCALL |g1| (QREFELT $ 21)))
            (LETT |dp2l| (SPADCALL |p2l| (QREFELT $ 21)))
            (LETT |lcpol|
                  (LIST (SPADCALL |g1| (QREFELT $ 50))
                        (SPADCALL |p2| (QREFELT $ 50))))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (COND
                    ((EQL |dl| (SPADCALL |ul| (QREFELT $ 32)))
                     (COND
                      ((EQL
                        (SPADCALL
                         (SPADCALL |ul| (SPADCALL |ul| (QREFELT $ 42))
                                   (QREFELT $ 34))
                         (QREFELT $ 32))
                        0)
                       (SEQ
                        (LETT |ug1|
                              (SPADCALL |g1| |lvar1| |lval| (QREFELT $ 31)))
                        (LETT |ug2|
                              (SPADCALL |p2l| |lvar1| |lval| (QREFELT $ 31)))
                        (LETT |resu|
                              (|PGCD;not_coprime2| |l| |ul| (LIST |ug1| |ug2|)
                               |lcpol| |ldeg| |lvar1| |lval| $))
                        (EXIT
                         (COND
                          ((QEQCAR |resu| 0)
                           (PROGN
                            (LETT #2# (QCDR |resu|))
                            (GO #9=#:G215))))))))))
                   (LETT |newchoice| (|PGCD;good| |l| |lvar1| |ltry| $))
                   (LETT |ul| (QCAR |newchoice|))
                   (LETT |ltry| (QCDR |newchoice|))
                   (EXIT (LETT |lval| (|SPADfirst| |ltry|))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #9# (EXIT #2#)))) 

(SDEFUN |PGCD;not_coprime2|
        ((|l| . #1=(|SparseUnivariatePolynomial| P))
         (|ul| |SparseUnivariatePolynomial| R)
         (|ulist| |List| (|SparseUnivariatePolynomial| R)) (|lcpol| |List| P)
         (|ldeg| |List| (|NonNegativeInteger|)) (|lvar1| |List| OV)
         (|lval| |List| R)
         ($ |Union| (|SparseUnivariatePolynomial| P) "failed"))
        (SPROG
         ((#2=#:G223 NIL) (#3=#:G235 NIL) (|uf| NIL) (#4=#:G234 NIL)
          (|gd1| #1#) (#5=#:G233 NIL)
          (|gdl| (|Union| (|SparseUnivariatePolynomial| P) "failed"))
          (|lgcd| (P)) (|lquo| (|SparseUnivariatePolynomial| R))
          (|d| (|SparseUnivariatePolynomial| R)))
         (SEQ
          (EXIT
           (SEQ (LETT |gd1| |l|)
                (EXIT
                 (SEQ G190 (COND ((NULL 'T) (GO G191)))
                      (SEQ
                       (LETT |d| (SPADCALL (CONS |ul| |ulist|) (QREFELT $ 52)))
                       (COND
                        ((EQL (SPADCALL |d| (QREFELT $ 32)) 0)
                         (PROGN (LETT #5# (CONS 0 |gd1|)) (GO #6=#:G232))))
                       (LETT |lquo|
                             (PROG2
                                 (LETT #2# (SPADCALL |ul| |d| (QREFELT $ 39)))
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 8))
                                               (|Union|
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 8))
                                                #7="failed")
                                               #2#)))
                       (COND
                        ((SPADCALL (SPADCALL |lquo| (QREFELT $ 32)) 0
                                   (QREFELT $ 33))
                         (SEQ
                          (LETT |lgcd|
                                (SPADCALL
                                 (CONS (SPADCALL |l| (QREFELT $ 50)) |lcpol|)
                                 (QREFELT $ 54)))
                          (LETT |gdl|
                                (|PGCD;lift| |l| |d| |lquo| |lgcd| |lvar1|
                                 |ldeg| |lval| $))
                          (EXIT
                           (COND
                            ((QEQCAR |gdl| 1)
                             (PROGN (LETT #5# (CONS 1 "failed")) (GO #6#)))
                            ('T
                             (SEQ (LETT |l| (QCDR |gdl|))
                                  (EXIT
                                   (LETT |ul|
                                         (SPADCALL |l| |lvar1| |lval|
                                                   (QREFELT $ 31)))))))))))
                       (LETT |gd1| (SPADCALL |gd1| |l| (QREFELT $ 55)))
                       (EXIT
                        (LETT |ulist|
                              (PROGN
                               (LETT #4# NIL)
                               (SEQ (LETT |uf| NIL) (LETT #3# |ulist|) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN (LETT |uf| (CAR #3#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #4#
                                            (CONS
                                             (PROG2
                                                 (LETT #2#
                                                       (SPADCALL |uf| |d|
                                                                 (QREFELT $
                                                                          39)))
                                                 (QCDR #2#)
                                               (|check_union2| (QEQCAR #2# 0)
                                                               (|SparseUnivariatePolynomial|
                                                                (QREFELT $ 8))
                                                               (|Union|
                                                                (|SparseUnivariatePolynomial|
                                                                 (QREFELT $ 8))
                                                                #7#)
                                                               #2#))
                                             #4#))))
                                    (LETT #3# (CDR #3#)) (GO G190) G191
                                    (EXIT (NREVERSE #4#)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #5#)))) 

(SDEFUN |PGCD;gcdPrimitive;3Sup;7|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((#1=#:G247 NIL) (|ltry| (|List| (|List| R)))
          (|result| #2=(|SparseUnivariatePolynomial| P))
          (|#G45|
           (|Record| (|:| |locgcd| #2#) (|:| |goodint| (|List| (|List| R)))))
          (|lvar| (|List| OV)) (|d2| #3=(|NonNegativeInteger|)) (|d1| #3#)
          (|#G44| #3#) (|#G43| #3#) (|#G42| (|SparseUnivariatePolynomial| P))
          (|#G41| (|SparseUnivariatePolynomial| P)))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |d1| (SPADCALL |p1| (QREFELT $ 21)))
                 (LETT |d2| (SPADCALL |p2| (QREFELT $ 21)))
                 (EXIT
                  (COND
                   ((SPADCALL |d1| |d2| (QREFELT $ 56))
                    (SEQ
                     (PROGN
                      (LETT |#G41| |p2|)
                      (LETT |#G42| |p1|)
                      (LETT |p1| |#G41|)
                      (LETT |p2| |#G42|))
                     (EXIT
                      (PROGN
                       (LETT |#G43| |d2|)
                       (LETT |#G44| |d1|)
                       (LETT |d1| |#G43|)
                       (LETT |d2| |#G44|))))))))
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
                                (QREFELT $ 63)))
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
                   (SEQ (LETT |ltry| NIL)
                        (EXIT
                         (SEQ G190 NIL
                              (SEQ
                               (PROGN
                                (LETT |#G45|
                                      (|PGCD;localgcd| |p1| |p2| |lvar| |ltry|
                                       $))
                                (LETT |result| (QCAR |#G45|))
                                (LETT |ltry| (QCDR |#G45|))
                                |#G45|)
                               (EXIT
                                (COND
                                 ((SPADCALL |result| (|spadConstant| $ 66)
                                            (QREFELT $ 57))
                                  (PROGN
                                   (LETT #1# (|spadConstant| $ 66))
                                   (GO #5=#:G246)))
                                 ((NULL (|PGCD;failtest| |result| |p1| |p2| $))
                                  (PROGN (LETT #1# |result|) (GO #5#))))))
                              NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PGCD;localgcd|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P) (|lvar| |List| OV)
         (|ltry| |List| (|List| R))
         ($ |Record| (|:| |locgcd| (|SparseUnivariatePolynomial| P))
          (|:| |goodint| (|List| (|List| R)))))
        (SPROG
         ((#1=#:G253 NIL)
          (|h|
           (|Union| (|:| |s| (|SparseUnivariatePolynomial| P))
                    (|:| |failed| #2="failed")
                    (|:| |notCoprime| #3="notCoprime")))
          (|ldeg| (|List| (|NonNegativeInteger|)))
          (|dd| (|NonNegativeInteger|)) (|ud| (|SparseUnivariatePolynomial| R))
          (|listpol| (|List| (|SparseUnivariatePolynomial| R)))
          (|uterm|
           (|Record| (|:| |lpol| (|List| (|SparseUnivariatePolynomial| R)))
                     (|:| |lint| (|List| (|List| R)))
                     (|:| |mpol| (|SparseUnivariatePolynomial| P))))
          (#4=#:G155 NIL))
         (SEQ
          (LETT |uterm|
                (PROG2 (LETT #4# (|PGCD;chooseVal| |p1| |p2| |lvar| |ltry| $))
                    (QCDR #4#)
                  (|check_union2| (QEQCAR #4# 0)
                                  (|Record|
                                   (|:| |lpol|
                                        (|List|
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT $ 8))))
                                   (|:| |lint| (|List| (|List| (QREFELT $ 8))))
                                   (|:| |mpol|
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 9))))
                                  (|Union|
                                   (|Record|
                                    (|:| |lpol|
                                         (|List|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 8))))
                                    (|:| |lint|
                                         (|List| (|List| (QREFELT $ 8))))
                                    (|:| |mpol|
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT $ 9))))
                                   "failed")
                                  #4#)))
          (LETT |ltry| (QVELT |uterm| 1)) (LETT |listpol| (QVELT |uterm| 0))
          (LETT |ud| (|SPADfirst| |listpol|))
          (LETT |dd| (SPADCALL |ud| (QREFELT $ 32)))
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
                                   (QREFELT $ 72)))
                   (LETT |h| (|PGCD;lift?| |p1| |p2| |uterm| |ldeg| |lvar| $))
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
                       (PROG2 (LETT #1# |h|)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0)
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT $ 9))
                                         (|Union|
                                          (|:| |s|
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 9)))
                                          (|:| |failed| #2#)
                                          (|:| |notCoprime| #3#))
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
                  (SEQ (LETT |md| (SPADCALL |p| (QREFELT $ 73)))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |p| (QREFELT $ 74))
                                   (QREFELT $ 54))
                         |md| (QREFELT $ 75))))))))) 

(SDEFUN |PGCD;better| ((|p1| P) (|p2| P) ($ |Boolean|))
        (SPROG ((#1=#:G263 NIL))
               (COND ((SPADCALL |p1| (QREFELT $ 76)) 'T)
                     ((SPADCALL |p2| (QREFELT $ 76)) NIL)
                     ('T
                      (<
                       (SPADCALL |p1|
                                 (PROG2
                                     (LETT #1# (SPADCALL |p1| (QREFELT $ 78)))
                                     (QCDR #1#)
                                   (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                                   (|Union| (QREFELT $ 7)
                                                            #2="failed")
                                                   #1#))
                                 (QREFELT $ 79))
                       (SPADCALL |p2|
                                 (PROG2
                                     (LETT #1# (SPADCALL |p2| (QREFELT $ 78)))
                                     (QCDR #1#)
                                   (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                                   (|Union| (QREFELT $ 7) #2#)
                                                   #1#))
                                 (QREFELT $ 79))))))) 

(SDEFUN |PGCD;best_to_front| ((|l| |List| P) ($ |List| P))
        (SPROG ((|ress| (|List| P)) (|best| (P)) (#1=#:G273 NIL) (|p| NIL))
               (SEQ (LETT |ress| NIL) (LETT |best| (|SPADfirst| |l|))
                    (SEQ (LETT |p| NIL) (LETT #1# (CDR |l|)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|PGCD;better| |p| |best| $)
                             (SEQ (LETT |ress| (CONS |best| |ress|))
                                  (EXIT (LETT |best| |p|))))
                            ('T (LETT |ress| (CONS |p| |ress|))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS |best| |ress|))))) 

(SDEFUN |PGCD;gcdTermList| ((|p1| P) (|p2| P) ($ P))
        (SPROG
         ((|q| (P)) (#1=#:G280 NIL) (|term| NIL) (#2=#:G281 NIL)
          (|termList| (|List| P)) (#3=#:G275 NIL))
         (SEQ
          (LETT |termList|
                (|PGCD;best_to_front|
                 (CONS |p1|
                       (SPADCALL
                        (SPADCALL |p2|
                                  (PROG2
                                      (LETT #3# (SPADCALL |p2| (QREFELT $ 78)))
                                      (QCDR #3#)
                                    (|check_union2| (QEQCAR #3# 0)
                                                    (QREFELT $ 7)
                                                    (|Union| (QREFELT $ 7)
                                                             "failed")
                                                    #3#))
                                  (QREFELT $ 81))
                        (QREFELT $ 74)))
                 $))
          (LETT |q| (|SPADfirst| |termList|))
          (SEQ (LETT #2# NIL) (LETT |term| NIL) (LETT #1# (CDR |termList|))
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#)) NIL) #2#)
                 (GO G191)))
               (SEQ (EXIT (LETT |q| (SPADCALL |q| |term| (QREFELT $ 82)))))
               (LETT #1#
                     (PROG1 (CDR #1#)
                       (LETT #2#
                             (SPADCALL |q| (|spadConstant| $ 41)
                                       (QREFELT $ 83)))))
               (GO G190) G191 (EXIT NIL))
          (EXIT |q|)))) 

(SDEFUN |PGCD;gcd;3Sup;13|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((#1=#:G219 NIL) (|c2| #2=(|SparseUnivariatePolynomial| P)) (|c1| #2#)
          (|#G63| (|SparseUnivariatePolynomial| P))
          (|#G62| (|SparseUnivariatePolynomial| P)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |p1| (QREFELT $ 21))
                      (SPADCALL |p2| (QREFELT $ 21)) (QREFELT $ 56))
            (PROGN
             (LETT |#G62| |p2|)
             (LETT |#G63| |p1|)
             (LETT |p1| |#G62|)
             (LETT |p2| |#G63|))))
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
             (SEQ (LETT |c1| (|PGCD;monomContent| |p1| $))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |p2| (QREFELT $ 86))
                               (|spadConstant| $ 38) (QREFELT $ 57))
                     (|PGCD;gcdMonom| |c1| |p2| $))
                    (#3#
                     (SEQ (LETT |c2| (|PGCD;monomContent| |p2| $))
                          (LETT |p1|
                                (PROG2
                                    (LETT #1#
                                          (SPADCALL |p1| |c1| (QREFELT $ 19)))
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0)
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 9))
                                                  (|Union|
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 9))
                                                   #4="failed")
                                                  #1#)))
                          (LETT |p2|
                                (PROG2
                                    (LETT #1#
                                          (SPADCALL |p2| |c2| (QREFELT $ 19)))
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0)
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT $ 9))
                                                  (|Union|
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 9))
                                                   #4#)
                                                  #1#)))
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
        ((|p1| . #1=(|SparseUnivariatePolynomial| P))
         (|p2| |SparseUnivariatePolynomial| P)
         (|uterm| |Record|
          (|:| |lpol| (|List| (|SparseUnivariatePolynomial| R)))
          (|:| |lint| (|List| (|List| R)))
          (|:| |mpol| (|SparseUnivariatePolynomial| P)))
         (|ldeg| |List| (|NonNegativeInteger|)) (|lvar| |List| OV)
         ($ |Union| (|:| |s| (|SparseUnivariatePolynomial| P))
          (|:| |failed| #2="failed") (|:| |notCoprime| #3="notCoprime")))
        (SPROG
         ((|l| (|Union| (|SparseUnivariatePolynomial| P) "failed"))
          (|lgcd| (P)) (#4=#:G296 NIL) (|f| #1#)
          (|uf| (|SparseUnivariatePolynomial| R))
          (|listpol| #5=(|List| (|SparseUnivariatePolynomial| R)))
          (|d| (|SparseUnivariatePolynomial| R)) (|lval| #6=(|List| R))
          (|#G72| #6#) (|#G71| #5#))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G71| (QVELT |uterm| 0))
             (LETT |#G72| (|SPADfirst| (QVELT |uterm| 1)))
             (LETT |listpol| |#G71|)
             (LETT |lval| |#G72|))
            (LETT |d| (|SPADfirst| |listpol|)) (LETT |listpol| (CDR |listpol|))
            (LETT |uf| (SPADCALL |listpol| 1 (QREFELT $ 88))) (LETT |f| |p1|)
            (COND
             ((SPADCALL
               (SPADCALL (SPADCALL |uf| |d| (QREFELT $ 34)) (QREFELT $ 32)) 0
               (QREFELT $ 33))
              (SEQ (LETT |uf| (SPADCALL |listpol| 2 (QREFELT $ 88)))
                   (LETT |f| |p2|)
                   (EXIT
                    (COND
                     ((SPADCALL
                       (SPADCALL (SPADCALL |uf| |d| (QREFELT $ 34))
                                 (QREFELT $ 32))
                       0 (QREFELT $ 33))
                      (PROGN (LETT #4# (CONS 2 #3#)) (GO #7=#:G295))))))))
            (LETT |lgcd|
                  (SPADCALL (SPADCALL |p1| (QREFELT $ 50))
                            (SPADCALL |p2| (QREFELT $ 50)) (QREFELT $ 82)))
            (LETT |l| (|PGCD;lift| |f| |d| |uf| |lgcd| |lvar| |ldeg| |lval| $))
            (EXIT
             (COND ((QEQCAR |l| 1) (CONS 1 #2#)) ('T (CONS 0 (QCDR |l|)))))))
          #7# (EXIT #4#)))) 

(SDEFUN |PGCD;lift|
        ((|f| |SparseUnivariatePolynomial| P)
         (|d| |SparseUnivariatePolynomial| R)
         (|uf| |SparseUnivariatePolynomial| R) (|lgcd| P) (|lvar| |List| OV)
         (|ldeg| |List| (|NonNegativeInteger|)) (|lval| |List| R)
         ($ |Union| (|SparseUnivariatePolynomial| P) "failed"))
        (SPROG
         ((|p1| #1=(|SparseUnivariatePolynomial| P))
          (|p0| #2=(|SparseUnivariatePolynomial| P)) (|#G85| #2#) (|#G84| #1#)
          (|#G83| #1#) (|#G82| #2#)
          (|plist| (|List| (|SparseUnivariatePolynomial| P)))
          (|pl| (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (|lg| (|List| (|SparseUnivariatePolynomial| R)))
          (|lgu| (|Union| (|List| (|SparseUnivariatePolynomial| R)) "failed"))
          (|leadlist| (|List| P))
          (|du| (|Union| (|SparseUnivariatePolynomial| R) "failed"))
          (|lgcd1| (R)) (|lcd| (R)) (#3=#:G314 NIL) (|n0| NIL) (#4=#:G315 NIL)
          (|n1| NIL) (#5=#:G313 NIL) (|leadpol| (|Boolean|))
          (|df| (|NonNegativeInteger|)) (|lcf| (P)))
         (SEQ (LETT |leadpol| NIL) (LETT |lcf| (SPADCALL |f| (QREFELT $ 50)))
              (LETT |df| (SPADCALL |f| (QREFELT $ 21))) (LETT |leadlist| NIL)
              (COND
               ((SPADCALL |lgcd| (|spadConstant| $ 41) (QREFELT $ 89))
                (SEQ (LETT |leadpol| 'T)
                     (LETT |f| (SPADCALL |lgcd| |f| (QREFELT $ 90)))
                     (LETT |ldeg|
                           (PROGN
                            (LETT #5# NIL)
                            (SEQ (LETT |n1| NIL)
                                 (LETT #4#
                                       (SPADCALL |lgcd| |lvar| (QREFELT $ 91)))
                                 (LETT |n0| NIL) (LETT #3# |ldeg|) G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT |n0| (CAR #3#)) NIL)
                                       (ATOM #4#)
                                       (PROGN (LETT |n1| (CAR #4#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT (LETT #5# (CONS (+ |n0| |n1|) #5#))))
                                 (LETT #3#
                                       (PROG1 (CDR #3#) (LETT #4# (CDR #4#))))
                                 (GO G190) G191 (EXIT (NREVERSE #5#)))))
                     (LETT |lcd| (SPADCALL |d| (QREFELT $ 46)))
                     (LETT |lgcd1|
                           (COND
                            ((SPADCALL (SPADCALL |lgcd| (QREFELT $ 92))
                                       (|spadConstant| $ 35) (QREFELT $ 93))
                             (SPADCALL |lgcd| (QREFELT $ 94)))
                            (#6='T
                             (SPADCALL
                              (SPADCALL |lgcd| |lvar| |lval| (QREFELT $ 43))
                              (QREFELT $ 94)))))
                     (LETT |du|
                           (SPADCALL (SPADCALL |lgcd1| |d| (QREFELT $ 95))
                                     |lcd| (QREFELT $ 47)))
                     (EXIT
                      (COND ((QEQCAR |du| 1) "failed")
                            (#6#
                             (SEQ (LETT |d| (QCDR |du|))
                                  (EXIT
                                   (LETT |uf|
                                         (SPADCALL |lcd| |uf|
                                                   (QREFELT $ 95)))))))))))
              (LETT |leadlist| (LIST |lgcd| |lcf|))
              (LETT |lgu|
                    (|PGCD;imposelc| (LIST |d| |uf|) |lvar| |lval| |leadlist|
                     $))
              (EXIT
               (COND ((QEQCAR |lgu| 1) (CONS 1 "failed"))
                     (#6#
                      (SEQ (LETT |lg| (QCDR |lgu|))
                           (LETT |pl|
                                 (SPADCALL |f| |lvar| |lg| |lval| |leadlist|
                                           |ldeg| (QREFELT $ 16)
                                           (QREFELT $ 98)))
                           (EXIT
                            (COND ((QEQCAR |pl| 1) (CONS 1 "failed"))
                                  (#6#
                                   (SEQ (LETT |plist| (QCDR |pl|))
                                        (PROGN
                                         (LETT |#G82| (|SPADfirst| |plist|))
                                         (LETT |#G83|
                                               (SPADCALL |plist| 2
                                                         (QREFELT $ 100)))
                                         (LETT |p0| |#G82|)
                                         (LETT |p1| |#G83|))
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |p0| |lvar| |lval|
                                                     (QREFELT $ 31))
                                           (|SPADfirst| |lg|) (QREFELT $ 101))
                                          (PROGN
                                           (LETT |#G84| |p1|)
                                           (LETT |#G85| |p0|)
                                           (LETT |p0| |#G84|)
                                           (LETT |p1| |#G85|))))
                                        (EXIT
                                         (COND
                                          (|leadpol|
                                           (SPADCALL |p0|
                                                     (SPADCALL |p0|
                                                               (QREFELT $ 84))
                                                     (QREFELT $ 102)))
                                          (#6# (CONS 0 |p0|))))))))))))))) 

(SDEFUN |PGCD;gcd;3P;17| ((|p1| P) (|p2| P) ($ P))
        (SPROG ((|mv2| (OV)) (#1=#:G322 NIL) (|mv1| (OV)))
               (SEQ
                (COND
                 ((SPADCALL |p1| (QREFELT $ 76))
                  (SEQ (LETT |p1| (SPADCALL |p1| (QREFELT $ 103)))
                       (EXIT
                        (COND
                         ((SPADCALL |p1| (|spadConstant| $ 41) (QREFELT $ 83))
                          |p1|)
                         ((SPADCALL |p1| (|spadConstant| $ 104) (QREFELT $ 83))
                          (SPADCALL |p2| (QREFELT $ 103)))
                         ((SPADCALL |p2| (QREFELT $ 76))
                          (SPADCALL
                           (SPADCALL (SPADCALL |p1| (QREFELT $ 94))
                                     (SPADCALL |p2| (QREFELT $ 94))
                                     (QREFELT $ 105))
                           (QREFELT $ 106)))
                         (#2='T (|PGCD;gcdTermList| |p1| |p2| $))))))
                 ((SPADCALL |p2| (QREFELT $ 76))
                  (SEQ (LETT |p2| (SPADCALL |p2| (QREFELT $ 103)))
                       (EXIT
                        (COND
                         ((SPADCALL |p2| (|spadConstant| $ 41) (QREFELT $ 83))
                          |p2|)
                         ((SPADCALL |p2| (|spadConstant| $ 104) (QREFELT $ 83))
                          (SPADCALL |p1| (QREFELT $ 103)))
                         (#2# (|PGCD;gcdTermList| |p2| |p1| $))))))
                 (#2#
                  (SEQ (LETT |p1| (SPADCALL |p1| (QREFELT $ 103)))
                       (LETT |p2| (SPADCALL |p2| (QREFELT $ 103)))
                       (EXIT
                        (COND ((SPADCALL |p1| |p2| (QREFELT $ 83)) |p1|)
                              (#2#
                               (SEQ
                                (LETT |mv1|
                                      (PROG2
                                          (LETT #1#
                                                (SPADCALL |p1| (QREFELT $ 78)))
                                          (QCDR #1#)
                                        (|check_union2| (QEQCAR #1# 0)
                                                        (QREFELT $ 7)
                                                        (|Union| (QREFELT $ 7)
                                                                 #3="failed")
                                                        #1#)))
                                (LETT |mv2|
                                      (PROG2
                                          (LETT #1#
                                                (SPADCALL |p2| (QREFELT $ 78)))
                                          (QCDR #1#)
                                        (|check_union2| (QEQCAR #1# 0)
                                                        (QREFELT $ 7)
                                                        (|Union| (QREFELT $ 7)
                                                                 #3#)
                                                        #1#)))
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
                                  (#2#
                                   (|PGCD;gcdTermList| |p2| |p1| $)))))))))))))) 

(SDEFUN |PGCD;gcd;LP;18| ((|listp| |List| P) ($ P))
        (SPROG
         ((#1=#:G333 NIL) (|f| (P)) (#2=#:G334 NIL) (|g| NIL)
          (|lf| (|List| P)))
         (SEQ
          (EXIT
           (SEQ (LETT |lf| (|PGCD;best_to_front| |listp| $))
                (LETT |f| (|SPADfirst| |lf|))
                (SEQ (LETT |g| NIL) (LETT #2# (CDR |lf|)) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |f| (SPADCALL |f| |g| (QREFELT $ 82)))
                          (EXIT
                           (COND
                            ((SPADCALL |f| (|spadConstant| $ 41)
                                       (QREFELT $ 83))
                             (PROGN (LETT #1# |f|) (GO #3=#:G332))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT |f|)))
          #3# (EXIT #1#)))) 

(SDEFUN |PGCD;gcd;LSup;19|
        ((|listp| |List| (|SparseUnivariatePolynomial| P))
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((#1=#:G344 NIL) (|f| (|SparseUnivariatePolynomial| P))
          (#2=#:G345 NIL) (|g| NIL)
          (|lf| (|List| (|SparseUnivariatePolynomial| P))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lf|
                  (SPADCALL (CONS #'|PGCD;gcd;LSup;19!0| $) |listp|
                            (QREFELT $ 112)))
            (LETT |f| (|SPADfirst| |lf|))
            (SEQ (LETT |g| NIL) (LETT #2# (CDR |lf|)) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#)) NIL)) (GO G191)))
                 (SEQ (LETT |f| (SPADCALL |f| |g| (QREFELT $ 49)))
                      (EXIT
                       (COND
                        ((SPADCALL |f| (|spadConstant| $ 66) (QREFELT $ 57))
                         (PROGN (LETT #1# |f|) (GO #3=#:G343))))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
            (EXIT |f|)))
          #3# (EXIT #1#)))) 

(SDEFUN |PGCD;gcd;LSup;19!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 21)) (SPADCALL |z2| (QREFELT $ 21))
                  (QREFELT $ 110))) 

(SDEFUN |PGCD;gcdPrimitive;3P;20| ((|p1| P) (|p2| P) ($ P))
        (SPROG
         ((|up2| #1=(|SparseUnivariatePolynomial| P)) (|up1| #1#)
          (#2=#:G353 NIL) (|mp| (P)) (|md| (|NonNegativeInteger|)) (|mv2| (OV))
          (#3=#:G350 NIL) (|mv1| (OV)))
         (SEQ (LETT |p1| (SPADCALL |p1| (QREFELT $ 103)))
              (LETT |p2| (SPADCALL |p2| (QREFELT $ 103)))
              (EXIT
               (COND ((SPADCALL |p1| |p2| (QREFELT $ 83)) |p1|)
                     ((SPADCALL |p1| (QREFELT $ 76))
                      (COND
                       ((SPADCALL |p2| (QREFELT $ 76))
                        (SPADCALL
                         (SPADCALL (SPADCALL |p1| (QREFELT $ 94))
                                   (SPADCALL |p2| (QREFELT $ 94))
                                   (QREFELT $ 105))
                         (QREFELT $ 106)))
                       ((SPADCALL |p1| (|spadConstant| $ 104) (QREFELT $ 83))
                        |p2|)
                       (#4='T (|spadConstant| $ 41))))
                     ((SPADCALL |p2| (QREFELT $ 76))
                      (COND
                       ((SPADCALL |p2| (|spadConstant| $ 104) (QREFELT $ 83))
                        |p1|)
                       (#4# (|spadConstant| $ 41))))
                     (#4#
                      (SEQ
                       (LETT |mv1|
                             (PROG2 (LETT #3# (SPADCALL |p1| (QREFELT $ 78)))
                                 (QCDR #3#)
                               (|check_union2| (QEQCAR #3# 0) (QREFELT $ 7)
                                               (|Union| (QREFELT $ 7)
                                                        #5="failed")
                                               #3#)))
                       (LETT |mv2|
                             (PROG2 (LETT #3# (SPADCALL |p2| (QREFELT $ 78)))
                                 (QCDR #3#)
                               (|check_union2| (QEQCAR #3# 0) (QREFELT $ 7)
                                               (|Union| (QREFELT $ 7) #5#)
                                               #3#)))
                       (EXIT
                        (COND
                         ((SPADCALL |mv1| |mv2| (QREFELT $ 107))
                          (SEQ
                           (LETT |md|
                                 (MIN (SPADCALL |p1| |mv1| (QREFELT $ 114))
                                      (SPADCALL |p2| |mv2| (QREFELT $ 114))))
                           (LETT |mp| (|spadConstant| $ 41))
                           (COND
                            ((SPADCALL |md| 1 (QREFELT $ 56))
                             (SEQ
                              (LETT |mp|
                                    (SPADCALL (SPADCALL |mv1| (QREFELT $ 115))
                                              |md| (QREFELT $ 116)))
                              (LETT |p1|
                                    (PROG2
                                        (LETT #2#
                                              (SPADCALL |p1| |mp|
                                                        (QREFELT $ 117)))
                                        (QCDR #2#)
                                      (|check_union2| (QEQCAR #2# 0)
                                                      (QREFELT $ 9)
                                                      (|Union| (QREFELT $ 9)
                                                               #6="failed")
                                                      #2#)))
                              (EXIT
                               (LETT |p2|
                                     (PROG2
                                         (LETT #2#
                                               (SPADCALL |p2| |mp|
                                                         (QREFELT $ 117)))
                                         (QCDR #2#)
                                       (|check_union2| (QEQCAR #2# 0)
                                                       (QREFELT $ 9)
                                                       (|Union| (QREFELT $ 9)
                                                                #6#)
                                                       #2#)))))))
                           (LETT |up1| (SPADCALL |p1| |mv1| (QREFELT $ 81)))
                           (LETT |up2| (SPADCALL |p2| |mv2| (QREFELT $ 81)))
                           (EXIT
                            (SPADCALL |mp|
                                      (SPADCALL
                                       (SPADCALL |up1| |up2| (QREFELT $ 67))
                                       |mv1| (QREFELT $ 108))
                                      (QREFELT $ 118)))))
                         (#4# (|spadConstant| $ 41))))))))))) 

(SDEFUN |PGCD;gcdPrimitive;LP;21| ((|listp| |List| P) ($ P))
        (SPROG
         ((#1=#:G368 NIL) (|f| (P)) (#2=#:G369 NIL) (|g| NIL)
          (|lf| (|List| P)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lf|
                  (SPADCALL (CONS (|function| |PGCD;better|) $) |listp|
                            (QREFELT $ 121)))
            (LETT |f| (|SPADfirst| |lf|))
            (SEQ (LETT |g| NIL) (LETT #2# (CDR |lf|)) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#)) NIL)) (GO G191)))
                 (SEQ (LETT |f| (SPADCALL |f| |g| (QREFELT $ 119)))
                      (EXIT
                       (COND
                        ((SPADCALL |f| (|spadConstant| $ 41) (QREFELT $ 83))
                         (PROGN (LETT #1# |f|) (GO #3=#:G367))))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
            (EXIT |f|)))
          #3# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |PolynomialGcdPackage;|)) 

(DEFUN |PolynomialGcdPackage| (&REST #1=#:G370)
  (SPROG NIL
         (PROG (#2=#:G371)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialGcdPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PolynomialGcdPackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PolynomialGcdPackage|)))))))))) 

(DEFUN |PolynomialGcdPackage;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|PolynomialGcdPackage| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 123))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
              (126 . |exquo|) (132 . |differentiate|) |PGCD;gcd;3Sup;13|
              (137 . |leadingCoefficient|) (|List| $) (142 . |gcd|) (|List| 9)
              |PGCD;gcd;LP;18| (147 . *) (153 . >) (159 . =)
              (165 . |unitCanonical|) (170 . >) (176 . |variables|)
              (181 . |setUnion|) (|Mapping| 25 7 7) (187 . |sort|)
              (193 . |lowerPolynomial|) (198 . |raisePolynomial|) (203 . |One|)
              |PGCD;gcdPrimitive;3Sup;7| (207 . |min|) (|List| 20)
              (213 . |degree|) (|Mapping| 20 20 20) (219 . |map|)
              (226 . |minimumDegree|) (231 . |coefficients|) (236 . |monomial|)
              (242 . |ground?|) (|Union| 7 '"failed") (247 . |mainVariable|)
              (252 . |degree|) (|SparseUnivariatePolynomial| $)
              (258 . |univariate|) |PGCD;gcd;3P;17| (264 . =) (270 . |content|)
              (275 . |coerce|) (280 . |reductum|) (|List| 29) (285 . |elt|)
              (291 . ~=) (297 . *) (303 . |degree|) (309 . |degree|) (314 . =)
              (320 . |retract|) (325 . *) (|Union| 99 '"failed")
              (|MultivariateLifting| 6 7 8 9) (331 . |lifting|) (|List| 18)
              (342 . |elt|) (348 . ~=) (354 . |exquo|) (360 . |unitCanonical|)
              (365 . |Zero|) (369 . |gcd|) (375 . |coerce|) (380 . =)
              (386 . |multivariate|) (392 . <) (398 . <) (|Mapping| 25 18 18)
              (404 . |sort|) |PGCD;gcd;LSup;19| (410 . |minimumDegree|)
              (416 . |coerce|) (421 . ^) (427 . |exquo|) (433 . *)
              |PGCD;gcdPrimitive;3P;20| (|Mapping| 25 9 9) (439 . |sort|)
              |PGCD;gcdPrimitive;LP;21|)
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
                                                   87 29 0 12 88 2 9 25 0 0 89
                                                   2 18 0 9 0 90 2 9 69 0 30 91
                                                   1 9 6 0 92 2 6 25 0 0 93 1 9
                                                   8 0 94 2 29 0 8 0 95 7 97 96
                                                   18 30 87 26 53 69 8 98 2 99
                                                   18 0 12 100 2 29 25 0 0 101
                                                   2 18 17 0 9 102 1 9 0 0 103
                                                   0 9 0 104 2 8 0 0 0 105 1 9
                                                   0 8 106 2 7 25 0 0 107 2 9 0
                                                   80 7 108 2 7 25 0 0 109 2 20
                                                   25 0 0 110 2 99 0 111 0 112
                                                   2 9 20 0 7 114 1 9 0 7 115 2
                                                   9 0 0 20 116 2 9 17 0 0 117
                                                   2 9 0 0 0 118 2 53 0 120 0
                                                   121 2 0 9 9 9 119 1 0 9 53
                                                   122 2 0 18 18 18 67 2 0 9 9
                                                   9 82 2 0 18 18 18 49 1 0 9
                                                   53 54 1 0 18 99 113)))))
           '|lookupComplete|)) 
