
(PUT '|EXPR;belong?;BoB;1| '|SPADreplace| '(XLAM (|op|) 'T)) 

(SDEFUN |EXPR;belong?;BoB;1| ((|op| |BasicOperator|) ($ |Boolean|)) 'T) 

(SDEFUN |EXPR;retNotUnit| ((|x| $) ($ R))
        (SPROG ((|u| (|Union| R "failed")) (|k| (|Kernel| $)))
               (SEQ
                (LETT |u|
                      (SPADCALL
                       (LETT |k| (SPADCALL |x| (QREFELT $ 13))
                             . #1=(|EXPR;retNotUnit|))
                       (QREFELT $ 17))
                      . #1#)
                (EXIT
                 (COND ((QEQCAR |u| 0) (QCDR |u|))
                       ('T (|error| "Not retractable"))))))) 

(SDEFUN |EXPR;retNotUnitIfCan| ((|x| $) ($ |Union| R "failed"))
        (SPROG ((|r| (|Union| (|Kernel| $) "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 19)) |EXPR;retNotUnitIfCan|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                       ('T (SPADCALL (QCDR |r|) (QREFELT $ 17)))))))) 

(SDEFUN |EXPR;operator;2Bo;4| ((|op| . #1=(|BasicOperator|)) ($ . #1#))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |op| (QREFELT $ 21))
                  (SPADCALL |op| (QREFELT $ 22)))
                 ((SPADCALL |op| (QREFELT $ 24))
                  (SPADCALL |op| (QREFELT $ 25)))
                 (#2='T
                  (SEQ
                   (COND
                    ((SPADCALL |op| (QREFELT $ 26))
                     (COND
                      ((SPADCALL |op| (QREFELT $ 7) (QREFELT $ 28))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |op| (QREFELT $ 29))
                                   (QREFELT $ 30))
                         (QREFELT $ 31)))))))
                   (LETT |n| (SPADCALL |op| (QREFELT $ 33))
                         |EXPR;operator;2Bo;4|)
                   (EXIT
                    (COND
                     ((QEQCAR |n| 1)
                      (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QREFELT $ 34)))
                     (#2#
                      (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QCDR |n|)
                                (QREFELT $ 36))))))))))) 

(SDEFUN |EXPR;poly_to_MP|
        ((|p| |Polynomial| R)
         ($ |SparseMultivariatePolynomial| R (|Kernel| $)))
        (SPROG
         ((|vl2| (|List| (|Kernel| $))) (#1=#:G177 NIL) (|z| NIL)
          (#2=#:G176 NIL) (|vl1| (|List| (|Symbol|)))
          (|ps| (|SparseMultivariatePolynomial| R (|Symbol|))))
         (SEQ (LETT |ps| |p| . #3=(|EXPR;poly_to_MP|))
              (LETT |vl1| (SPADCALL |ps| (QREFELT $ 40)) . #3#)
              (LETT |vl2|
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |z| NIL . #3#) (LETT #1# |vl1| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |z| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL |z| (QREFELT $ 30)) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (EXIT (SPADCALL |ps| |vl1| |vl2| (QREFELT $ 44)))))) 

(SDEFUN |EXPR;Zero;$;6| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |EXPR;One;$;7| (($ $)) (|spadConstant| $ 48)) 

(SDEFUN |EXPR;one?;$B;8| ((|x| $) ($ |Boolean|))
        (SPADCALL |x| (|spadConstant| $ 49) (QREFELT $ 51))) 

(SDEFUN |EXPR;zero?;$B;9| ((|x| $) ($ |Boolean|)) (SPADCALL |x| (QREFELT $ 53))) 

(SDEFUN |EXPR;-;2$;10| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |EXPR;*;I2$;11| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL |n| |x| (QREFELT $ 58))) 

(SDEFUN |EXPR;coerce;I$;12| ((|n| |Integer|) ($ $))
        (SPADCALL |n| (QREFELT $ 60))) 

(SDEFUN |EXPR;*;3$;13| ((|x| $) (|y| $) ($ $))
        (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT $ 62))
         (|EXPR;commonk| |x| |y| $) $)) 

(SDEFUN |EXPR;+;3$;14| ((|x| $) (|y| $) ($ $))
        (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT $ 64))
         (|EXPR;commonk| |x| |y| $) $)) 

(SDEFUN |EXPR;-;3$;15| ((|x| $) (|y| $) ($ $))
        (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT $ 66))
         (|EXPR;commonk| |x| |y| $) $)) 

(SDEFUN |EXPR;/;3$;16| ((|x| $) (|y| $) ($ $))
        (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT $ 68))
         (|EXPR;commonk| |x| |y| $) $)) 

(SDEFUN |EXPR;number?;$B;17| ((|x| $) ($ |Boolean|))
        (COND
         ((|HasCategory| (QREFELT $ 6) (LIST '|RetractableTo| '(|Integer|)))
          (COND ((SPADCALL |x| (QREFELT $ 70)) 'T)
                (#1='T (QEQCAR (SPADCALL |x| (QREFELT $ 72)) 0))))
         (#1# (SPADCALL |x| (QREFELT $ 70))))) 

(SDEFUN |EXPR;simplifyPower;$I$;18| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((|args| (|List| $)) (|k| (|List| (|Kernel| $))))
               (SEQ
                (LETT |k| (SPADCALL |x| (QREFELT $ 75))
                      . #1=(|EXPR;simplifyPower;$I$;18|))
                (EXIT
                 (COND
                  ((SPADCALL |x| '|%power| (QREFELT $ 76))
                   (SEQ
                    (LETT |args|
                          (SPADCALL (SPADCALL |k| (QREFELT $ 77))
                                    (QREFELT $ 79))
                          . #1#)
                    (COND
                     ((NULL (EQL (SPADCALL |args| (QREFELT $ 80)) 2))
                      (EXIT (|error| "Too many arguments to ^"))))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |args| 1 (QREFELT $ 81))
                                 (QREFELT $ 73))
                       (SPADCALL
                        (|EXPR;reduc|
                         (SPADCALL (SPADCALL |args| 1 (QREFELT $ 81)) |n|
                                   (QREFELT $ 82))
                         (|EXPR;algtower| (SPADCALL |args| 1 (QREFELT $ 81)) $)
                         $)
                        (SPADCALL |args| 2 (QREFELT $ 81)) (QREFELT $ 83)))
                      (#2='T
                       (SPADCALL (SPADCALL |args| (QREFELT $ 84))
                                 (SPADCALL |n| (SPADCALL |args| (QREFELT $ 85))
                                           (QREFELT $ 59))
                                 (QREFELT $ 83)))))))
                  (#2#
                   (|EXPR;reduc| (SPADCALL |x| |n| (QREFELT $ 82))
                    (|EXPR;algtower| |x| $) $))))))) 

(SDEFUN |EXPR;^;$Nni$;19| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (COND ((EQL |n| 0) (|spadConstant| $ 49)) ((EQL |n| 1) |x|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT $ 88)) |n| (QREFELT $ 86))
                (SPADCALL (SPADCALL |x| (QREFELT $ 89)) |n| (QREFELT $ 86))
                (QREFELT $ 69))))) 

(SDEFUN |EXPR;^;$I$;20| ((|x| $) (|n| |Integer|) ($ $))
        (COND ((EQL |n| 0) (|spadConstant| $ 49)) ((EQL |n| 1) |x|)
              (#1='T
               (COND
                ((EQL |n| -1)
                 (SPADCALL (|spadConstant| $ 49) |x| (QREFELT $ 69)))
                (#1#
                 (SPADCALL
                  (SPADCALL (SPADCALL |x| (QREFELT $ 88)) |n| (QREFELT $ 86))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 89)) |n| (QREFELT $ 86))
                  (QREFELT $ 69))))))) 

(SDEFUN |EXPR;^;$Pi$;21| ((|x| $) (|n| |PositiveInteger|) ($ $))
        (COND ((EQL |n| 1) |x|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT $ 88)) |n| (QREFELT $ 86))
                (SPADCALL (SPADCALL |x| (QREFELT $ 89)) |n| (QREFELT $ 86))
                (QREFELT $ 69))))) 

(SDEFUN |EXPR;smaller?;2$B;22| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 94))) 

(SDEFUN |EXPR;=;2$B;23| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |x| |y| (QREFELT $ 67)) (|spadConstant| $ 46)
                  (QREFELT $ 51))) 

(SDEFUN |EXPR;numer;$Smp;24|
        ((|x| $) ($ |SparseMultivariatePolynomial| R (|Kernel| $)))
        (SPADCALL |x| (QREFELT $ 97))) 

(SDEFUN |EXPR;denom;$Smp;25|
        ((|x| $) ($ |SparseMultivariatePolynomial| R (|Kernel| $)))
        (SPADCALL |x| (QREFELT $ 100))) 

(SDEFUN |EXPR;coerce;Smp$;26|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) ($ $))
        (CONS |p| (|spadConstant| $ 103))) 

(SDEFUN |EXPR;coerce;P$;27| ((|p| |Polynomial| R) ($ $))
        (SPROG ((|en| (|SparseMultivariatePolynomial| R (|Kernel| $))))
               (SEQ (LETT |en| (|EXPR;poly_to_MP| |p| $) |EXPR;coerce;P$;27|)
                    (EXIT (CONS |en| (|spadConstant| $ 103)))))) 

(SDEFUN |EXPR;coerce;F$;28| ((|pq| |Fraction| (|Polynomial| R)) ($ $))
        (SPROG
         ((|ed| #1=(|SparseMultivariatePolynomial| R (|Kernel| $))) (|en| #1#))
         (SEQ
          (LETT |en| (|EXPR;poly_to_MP| (SPADCALL |pq| (QREFELT $ 108)) $)
                . #2=(|EXPR;coerce;F$;28|))
          (LETT |ed| (|EXPR;poly_to_MP| (SPADCALL |pq| (QREFELT $ 109)) $)
                . #2#)
          (EXIT (CONS |en| |ed|))))) 

(SDEFUN |EXPR;reduce;2$;29| ((|x| $) ($ $))
        (|EXPR;reduc| |x| (|EXPR;algtower| |x| $) $)) 

(SDEFUN |EXPR;commonk| ((|x| $) (|y| $) ($ |List| (|Kernel| $)))
        (|EXPR;commonk0| (|EXPR;algtower| |x| $) (|EXPR;algtower| |y| $) $)) 

(SDEFUN |EXPR;algkernels| ((|l| |List| (|Kernel| $)) ($ |List| (|Kernel| $)))
        (SPROG NIL
               (SPADCALL (CONS #'|EXPR;algkernels!0| (VECTOR (QREFELT $ 8) $))
                         |l| (QREFELT $ 113)))) 

(SDEFUN |EXPR;algkernels!0| ((|x| NIL) ($$ NIL))
        (PROG ($ ALGOP)
          (LETT $ (QREFELT $$ 1) . #1=(|EXPR;algkernels|))
          (LETT ALGOP (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 31)) ALGOP (QREFELT $ 28)))))) 

(SDEFUN |EXPR;toprat| ((|f| $) ($ $))
        (SPADCALL |f| (|EXPR;algtower| |f| $) (QREFELT $ 115))) 

(SDEFUN |EXPR;alg_ker_set| ((|x| $) ($ |List| (|Kernel| $)))
        (SPROG
         ((|ak1| (|List| #1=(|Kernel| $))) (#2=#:G240 NIL) (|k1| NIL)
          (|arg| (|List| $)) (|resl| (|List| (|Kernel| $)))
          (|needed| (|Boolean|)) (#3=#:G239 NIL) (#4=#:G238 NIL)
          (#5=#:G237 NIL) (|k| NIL) (|ak| (|List| #1#)) (#6=#:G236 NIL))
         (SEQ (LETT |resl| NIL . #7=(|EXPR;alg_ker_set|))
              (LETT |ak1| NIL . #7#)
              (SEQ (LETT |k| NIL . #7#)
                   (LETT #6# (SPADCALL |x| (QREFELT $ 75)) . #7#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |k| (CAR #6#) . #7#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |k| '|nthRoot| (QREFELT $ 116)))
                      (COND
                       ((NULL (SPADCALL |k| '|rootOf| (QREFELT $ 116)))
                        (EXIT "iterate")))))
                    (EXIT
                     (LETT |ak1| (SPADCALL |k| |ak1| (QREFELT $ 117)) . #7#)))
                   (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
              (SEQ G190
                   (COND ((NULL (COND ((NULL |ak1|) 'NIL) ('T 'T))) (GO G191)))
                   (SEQ (LETT |ak| |ak1| . #7#) (LETT |ak1| NIL . #7#)
                        (EXIT
                         (SEQ (LETT |k| NIL . #7#) (LETT #5# |ak| . #7#) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |k| (CAR #5#) . #7#) NIL))
                                (GO G191)))
                              (SEQ (LETT |needed| 'T . #7#)
                                   (SEQ (LETT |k1| NIL . #7#)
                                        (LETT #4# |resl| . #7#) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN
                                               (LETT |k1| (CAR #4#) . #7#)
                                               NIL)
                                              (NULL |needed|))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((EQ |k1| |k|)
                                            (LETT |needed| 'NIL . #7#)))))
                                        (LETT #4# (CDR #4#) . #7#) (GO G190)
                                        G191 (EXIT NIL))
                                   (SEQ (LETT |k1| NIL . #7#)
                                        (LETT #3# |resl| . #7#) G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN
                                               (LETT |k1| (CAR #3#) . #7#)
                                               NIL)
                                              (NULL |needed|))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |k1| |k| (QREFELT $ 118))
                                            (LETT |needed| 'NIL . #7#)))))
                                        (LETT #3# (CDR #3#) . #7#) (GO G190)
                                        G191 (EXIT NIL))
                                   (EXIT
                                    (COND
                                     (|needed|
                                      (SEQ
                                       (LETT |resl|
                                             (SPADCALL |k| |resl|
                                                       (QREFELT $ 117))
                                             . #7#)
                                       (LETT |ak1|
                                             (SPADCALL |k| |ak1|
                                                       (QREFELT $ 117))
                                             . #7#)
                                       (LETT |arg|
                                             (SPADCALL |k| (QREFELT $ 79))
                                             . #7#)
                                       (EXIT
                                        (SEQ (LETT |k1| NIL . #7#)
                                             (LETT #2#
                                                   (SPADCALL
                                                    (SPADCALL |arg| 1
                                                              (QREFELT $ 81))
                                                    (QREFELT $ 75))
                                                   . #7#)
                                             G190
                                             (COND
                                              ((OR (ATOM #2#)
                                                   (PROGN
                                                    (LETT |k1| (CAR #2#) . #7#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((OR
                                                  (SPADCALL |k1| '|nthRoot|
                                                            (QREFELT $ 116))
                                                  (SPADCALL |k1| '|rootOf|
                                                            (QREFELT $ 116)))
                                                 (LETT |ak1|
                                                       (SPADCALL |k1| |ak1|
                                                                 (QREFELT $
                                                                          117))
                                                       . #7#)))))
                                             (LETT #2# (CDR #2#) . #7#)
                                             (GO G190) G191 (EXIT NIL)))))
                                     ('T "iterate"))))
                              (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                              (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |resl|)))) 

(SDEFUN |EXPR;algtower| ((|x| $) ($ |List| (|Kernel| $)))
        (NREVERSE (SPADCALL (|EXPR;alg_ker_set| |x| $) (QREFELT $ 119)))) 

(SDEFUN |EXPR;simple_root| ((|r| |Kernel| $) ($ |Boolean|))
        (SPROG ((|a| ($)) (|al| (|List| $)))
               (SEQ
                (COND
                 ((SPADCALL |r| '|nthRoot| (QREFELT $ 116))
                  (SEQ
                   (LETT |al| (SPADCALL |r| (QREFELT $ 79))
                         . #1=(|EXPR;simple_root|))
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |al| 2 (QREFELT $ 81))
                                (SPADCALL 2 (QREFELT $ 61)) (QREFELT $ 120))
                      'NIL)
                     (#2='T
                      (SEQ (LETT |a| (SPADCALL |al| 1 (QREFELT $ 81)) . #1#)
                           (EXIT
                            (COND
                             ((SPADCALL
                               (LENGTH
                                (|EXPR;algkernels|
                                 (SPADCALL |a| (QREFELT $ 75)) $))
                               0 (QREFELT $ 121))
                              'NIL)
                             (#2# 'T)))))))))
                 (#2# 'NIL))))) 

(SDEFUN |EXPR;root_reduce| ((|x| $) (|r| |Kernel| $) ($ $))
        (SPROG
         ((|d1| (|SparseMultivariatePolynomial| R (|Kernel| $)))
          (|n1| (|SparseMultivariatePolynomial| R (|Kernel| $)))
          (|c0| #1=(|SparseMultivariatePolynomial| R (|Kernel| $))) (|c1| #1#)
          (|n0| #2=(|SparseMultivariatePolynomial| R (|Kernel| $)))
          (|dp|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| $))))
          (|dn| (|SparseMultivariatePolynomial| R (|Kernel| $))) (|an| #2#)
          (|a| ($)))
         (SEQ
          (LETT |a| (SPADCALL (SPADCALL |r| (QREFELT $ 79)) 1 (QREFELT $ 81))
                . #3=(|EXPR;root_reduce|))
          (LETT |an| (SPADCALL |a| (QREFELT $ 99)) . #3#)
          (LETT |dn| (SPADCALL |a| (QREFELT $ 101)) . #3#)
          (LETT |dp|
                (SPADCALL (SPADCALL |x| (QREFELT $ 101)) |r| (QREFELT $ 123))
                . #3#)
          (LETT |n0| (SPADCALL |x| (QREFELT $ 99)) . #3#)
          (LETT |c1| (SPADCALL |dp| (QREFELT $ 125)) . #3#)
          (LETT |c0| (SPADCALL (SPADCALL |dp| (QREFELT $ 126)) (QREFELT $ 125))
                . #3#)
          (LETT |n1|
                (SPADCALL |dn|
                          (SPADCALL (SPADCALL |c0| |n0| (QREFELT $ 127))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 103) |r| 1
                                                (QREFELT $ 128))
                                      |c1| (QREFELT $ 127))
                                     |n0| (QREFELT $ 127))
                                    (QREFELT $ 129))
                          (QREFELT $ 127))
                . #3#)
          (LETT |d1|
                (SPADCALL
                 (SPADCALL (SPADCALL |c0| |c0| (QREFELT $ 127)) |dn|
                           (QREFELT $ 127))
                 (SPADCALL (SPADCALL |an| |c1| (QREFELT $ 127)) |c1|
                           (QREFELT $ 127))
                 (QREFELT $ 129))
                . #3#)
          (EXIT
           (|EXPR;reduc| (SPADCALL |n1| |d1| (QREFELT $ 130)) (LIST |r|) $))))) 

(PUT '|EXPR;getSimplifyDenomsFlag;B;37| '|SPADreplace|
     '(XLAM NIL |algreduc_flag|)) 

(SDEFUN |EXPR;getSimplifyDenomsFlag;B;37| (($ |Boolean|)) |algreduc_flag|) 

(SDEFUN |EXPR;setSimplifyDenomsFlag;2B;38| ((|x| |Boolean|) ($ |Boolean|))
        (SPROG ((|res| (|Boolean|)))
               (SEQ
                (LETT |res| (SPADCALL (QREFELT $ 131))
                      |EXPR;setSimplifyDenomsFlag;2B;38|)
                (SETF |algreduc_flag| |x|) (EXIT |res|)))) 

(SDEFUN |EXPR;algreduc| ((|x| $) (|ckl| |List| (|Kernel| $)) ($ $))
        (SPROG
         ((|x1| ($)) (|q| (|SparseUnivariatePolynomial| $)) (#1=#:G261 NIL)
          (|k| NIL) (|sas| (|SingletonAsOrderedSet|)) (#2=#:G260 NIL)
          (|r| (|Kernel| $)) (|akl| (|List| (|Kernel| $))))
         (SEQ
          (EXIT
           (SEQ (LETT |x1| (|EXPR;reduc| |x| |ckl| $) . #3=(|EXPR;algreduc|))
                (EXIT
                 (COND
                  ((SPADCALL (QREFELT $ 131))
                   (SEQ
                    (LETT |akl|
                          (|EXPR;algtower|
                           (SPADCALL (|spadConstant| $ 103)
                                     (SPADCALL |x1| (QREFELT $ 101))
                                     (QREFELT $ 130))
                           $)
                          . #3#)
                    (EXIT
                     (COND ((EQL (LENGTH |akl|) 0) |x1|)
                           (#4='T
                            (SEQ
                             (COND
                              ((EQL (LENGTH |akl|) 1)
                               (SEQ
                                (LETT |r| (SPADCALL |akl| 1 (QREFELT $ 133))
                                      . #3#)
                                (EXIT
                                 (COND
                                  ((|EXPR;simple_root| |r| $)
                                   (PROGN
                                    (LETT #2# (|EXPR;root_reduce| |x| |r| $)
                                          . #3#)
                                    (GO #2#))))))))
                             (LETT |sas| (SPADCALL (QREFELT $ 135)) . #3#)
                             (SEQ (LETT |k| NIL . #3#) (LETT #1# |akl| . #3#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |q|
                                         (SPADCALL |x1| |k|
                                                   (SPADCALL |k|
                                                             (QREFELT $ 136))
                                                   (QREFELT $ 139))
                                         . #3#)
                                   (EXIT
                                    (LETT |x1|
                                          (SPADCALL
                                           (SPADCALL |q| |sas|
                                                     (SPADCALL |k|
                                                               (QREFELT $ 140))
                                                     (QREFELT $ 141))
                                           (QREFELT $ 142))
                                          . #3#)))
                                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (|EXPR;reduc| |x1| |akl| $))))))))
                  (#4# |x1|)))))
          #2# (EXIT #2#)))) 

(SDEFUN |EXPR;/;2Smp$;40|
        ((|x| |SparseMultivariatePolynomial| R . #1=((|Kernel| $)))
         (|y| |SparseMultivariatePolynomial| R . #1#) ($ $))
        (|EXPR;reduc| (SPADCALL |x| |y| (QREFELT $ 130))
         (|EXPR;commonk| (SPADCALL |x| (|spadConstant| $ 103) (QREFELT $ 130))
          (SPADCALL |y| (|spadConstant| $ 103) (QREFELT $ 130)) $)
         $)) 

(SDEFUN |EXPR;reducedSystem;MM;41| ((|m| |Matrix| $) ($ |Matrix| R))
        (SPROG
         ((|mm| (|Matrix| (|SparseMultivariatePolynomial| R (|Kernel| $)))))
         (SEQ
          (LETT |mm|
                (SPADCALL
                 (SPADCALL (CONS (|function| |EXPR;toprat|) $) |m|
                           (QREFELT $ 146))
                 (QREFELT $ 149))
                |EXPR;reducedSystem;MM;41|)
          (EXIT (SPADCALL |mm| (QREFELT $ 151)))))) 

(SDEFUN |EXPR;reducedSystem;MVR;42|
        ((|m| |Matrix| . #1=($)) (|v| |Vector| . #1#)
         ($ |Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R))))
        (SPROG
         ((|r|
           (|Record|
            (|:| |mat|
                 (|Matrix| (|SparseMultivariatePolynomial| R (|Kernel| $))))
            (|:| |vec|
                 (|Vector| (|SparseMultivariatePolynomial| R (|Kernel| $)))))))
         (SEQ
          (LETT |r|
                (SPADCALL
                 (SPADCALL (CONS (|function| |EXPR;toprat|) $) |m|
                           (QREFELT $ 146))
                 (SPADCALL (CONS (|function| |EXPR;toprat|) $) |v|
                           (QREFELT $ 154))
                 (QREFELT $ 157))
                |EXPR;reducedSystem;MVR;42|)
          (EXIT (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT $ 159)))))) 

(SDEFUN |EXPR;commonk0|
        ((|x| |List| (|Kernel| $)) (|y| |List| (|Kernel| $))
         ($ |List| (|Kernel| $)))
        (SPROG ((|ans| (|List| (|Kernel| $))) (#1=#:G276 NIL) (|k| NIL))
               (SEQ (LETT |ans| NIL . #2=(|EXPR;commonk0|))
                    (SEQ (LETT |k| NIL . #2#) (LETT #1# (NREVERSE |x|) . #2#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |k| |y| (QREFELT $ 161))
                             (LETT |ans| (SPADCALL |k| |ans| (QREFELT $ 162))
                                   . #2#)))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |EXPR;rootOf;SupS$;44|
        ((|x| |SparseUnivariatePolynomial| $) (|v| |Symbol|) ($ $))
        (SPADCALL |x| |v| (QREFELT $ 164))) 

(SDEFUN |EXPR;rootSum;$SupS$;45|
        ((|x| $) (|p| |SparseUnivariatePolynomial| $) (|v| |Symbol|) ($ $))
        (SPADCALL |x| |p| |v| (QREFELT $ 166))) 

(SDEFUN |EXPR;pi;$;46| (($ $)) (SPADCALL (QREFELT $ 169))) 

(SDEFUN |EXPR;exp;2$;47| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 171))) 

(SDEFUN |EXPR;log;2$;48| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 173))) 

(SDEFUN |EXPR;sin;2$;49| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 175))) 

(SDEFUN |EXPR;cos;2$;50| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 177))) 

(SDEFUN |EXPR;tan;2$;51| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 179))) 

(SDEFUN |EXPR;cot;2$;52| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 181))) 

(SDEFUN |EXPR;sec;2$;53| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 183))) 

(SDEFUN |EXPR;csc;2$;54| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 185))) 

(SDEFUN |EXPR;asin;2$;55| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 187))) 

(SDEFUN |EXPR;acos;2$;56| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 189))) 

(SDEFUN |EXPR;atan;2$;57| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 191))) 

(SDEFUN |EXPR;acot;2$;58| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 193))) 

(SDEFUN |EXPR;asec;2$;59| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 195))) 

(SDEFUN |EXPR;acsc;2$;60| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 197))) 

(SDEFUN |EXPR;sinh;2$;61| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 199))) 

(SDEFUN |EXPR;cosh;2$;62| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 201))) 

(SDEFUN |EXPR;tanh;2$;63| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 203))) 

(SDEFUN |EXPR;coth;2$;64| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 205))) 

(SDEFUN |EXPR;sech;2$;65| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 207))) 

(SDEFUN |EXPR;csch;2$;66| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 209))) 

(SDEFUN |EXPR;asinh;2$;67| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 211))) 

(SDEFUN |EXPR;acosh;2$;68| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 213))) 

(SDEFUN |EXPR;atanh;2$;69| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 215))) 

(SDEFUN |EXPR;acoth;2$;70| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 217))) 

(SDEFUN |EXPR;asech;2$;71| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 219))) 

(SDEFUN |EXPR;acsch;2$;72| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 221))) 

(SDEFUN |EXPR;abs;2$;73| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 224))) 

(SDEFUN |EXPR;Gamma;2$;74| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 226))) 

(SDEFUN |EXPR;Gamma;3$;75| ((|a| $) (|x| $) ($ $))
        (SPADCALL |a| |x| (QREFELT $ 228))) 

(SDEFUN |EXPR;Beta;3$;76| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 230))) 

(SDEFUN |EXPR;digamma;2$;77| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 232))) 

(SDEFUN |EXPR;polygamma;3$;78| ((|k| $) (|x| $) ($ $))
        (SPADCALL |k| |x| (QREFELT $ 234))) 

(SDEFUN |EXPR;besselJ;3$;79| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 236))) 

(SDEFUN |EXPR;besselY;3$;80| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 238))) 

(SDEFUN |EXPR;besselI;3$;81| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 240))) 

(SDEFUN |EXPR;besselK;3$;82| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 242))) 

(SDEFUN |EXPR;airyAi;2$;83| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 244))) 

(SDEFUN |EXPR;airyAiPrime;2$;84| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 246))) 

(SDEFUN |EXPR;airyBi;2$;85| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 248))) 

(SDEFUN |EXPR;airyBiPrime;2$;86| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 250))) 

(SDEFUN |EXPR;lambertW;2$;87| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 252))) 

(SDEFUN |EXPR;polylog;3$;88| ((|s| $) (|x| $) ($ $))
        (SPADCALL |s| |x| (QREFELT $ 254))) 

(SDEFUN |EXPR;weierstrassP;4$;89| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 256))) 

(SDEFUN |EXPR;weierstrassPPrime;4$;90| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 258))) 

(SDEFUN |EXPR;weierstrassSigma;4$;91| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 260))) 

(SDEFUN |EXPR;weierstrassZeta;4$;92| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 262))) 

(SDEFUN |EXPR;whittakerM;4$;93| ((|k| $) (|m| $) (|z| $) ($ $))
        (SPADCALL |k| |m| |z| (QREFELT $ 264))) 

(SDEFUN |EXPR;whittakerW;4$;94| ((|k| $) (|m| $) (|z| $) ($ $))
        (SPADCALL |k| |m| |z| (QREFELT $ 266))) 

(SDEFUN |EXPR;angerJ;3$;95| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 268))) 

(SDEFUN |EXPR;weberE;3$;96| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 270))) 

(SDEFUN |EXPR;struveH;3$;97| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 272))) 

(SDEFUN |EXPR;struveL;3$;98| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 274))) 

(SDEFUN |EXPR;hankelH1;3$;99| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 276))) 

(SDEFUN |EXPR;hankelH2;3$;100| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 278))) 

(SDEFUN |EXPR;lommelS1;4$;101| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 280))) 

(SDEFUN |EXPR;lommelS2;4$;102| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 282))) 

(SDEFUN |EXPR;kummerM;4$;103| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 284))) 

(SDEFUN |EXPR;kummerU;4$;104| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 286))) 

(SDEFUN |EXPR;legendreP;4$;105| ((|nu| $) (|mu| $) (|z| $) ($ $))
        (SPADCALL |nu| |mu| |z| (QREFELT $ 288))) 

(SDEFUN |EXPR;legendreQ;4$;106| ((|nu| $) (|mu| $) (|z| $) ($ $))
        (SPADCALL |nu| |mu| |z| (QREFELT $ 290))) 

(SDEFUN |EXPR;kelvinBei;3$;107| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 292))) 

(SDEFUN |EXPR;kelvinBer;3$;108| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 294))) 

(SDEFUN |EXPR;kelvinKei;3$;109| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 296))) 

(SDEFUN |EXPR;kelvinKer;3$;110| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 298))) 

(SDEFUN |EXPR;ellipticK;2$;111| ((|m| $) ($ $)) (SPADCALL |m| (QREFELT $ 300))) 

(SDEFUN |EXPR;ellipticE;2$;112| ((|m| $) ($ $)) (SPADCALL |m| (QREFELT $ 302))) 

(SDEFUN |EXPR;ellipticE;3$;113| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 304))) 

(SDEFUN |EXPR;ellipticF;3$;114| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 306))) 

(SDEFUN |EXPR;ellipticPi;4$;115| ((|z| $) (|n| $) (|m| $) ($ $))
        (SPADCALL |z| |n| |m| (QREFELT $ 308))) 

(SDEFUN |EXPR;jacobiSn;3$;116| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 310))) 

(SDEFUN |EXPR;jacobiCn;3$;117| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 312))) 

(SDEFUN |EXPR;jacobiDn;3$;118| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 314))) 

(SDEFUN |EXPR;jacobiZeta;3$;119| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 316))) 

(SDEFUN |EXPR;jacobiTheta;3$;120| ((|q| $) (|z| $) ($ $))
        (SPADCALL |q| |z| (QREFELT $ 318))) 

(SDEFUN |EXPR;lerchPhi;4$;121| ((|z| $) (|s| $) (|a| $) ($ $))
        (SPADCALL |z| |s| |a| (QREFELT $ 320))) 

(SDEFUN |EXPR;riemannZeta;2$;122| ((|z| $) ($ $))
        (SPADCALL |z| (QREFELT $ 322))) 

(SDEFUN |EXPR;hypergeometricF;2L2$;123|
        ((|la| . #1=(|List| $)) (|lb| . #1#) (|x| $) ($ $))
        (SPADCALL |la| |lb| |x| (QREFELT $ 324))) 

(SDEFUN |EXPR;meijerG;4L2$;124|
        ((|la| . #1=(|List| $)) (|lb| . #1#) (|lc| . #1#) (|ld| . #1#) (|x| $)
         ($ $))
        (SPADCALL |la| |lb| |lc| |ld| |x| (QREFELT $ 327))) 

(SDEFUN |EXPR;^;3$;125| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 330))) 

(SDEFUN |EXPR;factorial;2$;126| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 331))) 

(SDEFUN |EXPR;binomial;3$;127| ((|n| $) (|m| $) ($ $))
        (SPADCALL |n| |m| (QREFELT $ 333))) 

(SDEFUN |EXPR;permutation;3$;128| ((|n| $) (|m| $) ($ $))
        (SPADCALL |n| |m| (QREFELT $ 335))) 

(SDEFUN |EXPR;factorials;2$;129| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 337))) 

(SDEFUN |EXPR;factorials;$S$;130| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 339))) 

(SDEFUN |EXPR;summation;$S$;131| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 341))) 

(SDEFUN |EXPR;summation;$Sb$;132| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 344))) 

(SDEFUN |EXPR;product;$S$;133| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 347))) 

(SDEFUN |EXPR;product;$Sb$;134| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 349))) 

(SDEFUN |EXPR;erf;2$;135| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 352))) 

(SDEFUN |EXPR;erfi;2$;136| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 354))) 

(SDEFUN |EXPR;Ei;2$;137| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 356))) 

(SDEFUN |EXPR;Si;2$;138| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 358))) 

(SDEFUN |EXPR;Ci;2$;139| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 360))) 

(SDEFUN |EXPR;Shi;2$;140| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 362))) 

(SDEFUN |EXPR;Chi;2$;141| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 364))) 

(SDEFUN |EXPR;li;2$;142| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 366))) 

(SDEFUN |EXPR;dilog;2$;143| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 368))) 

(SDEFUN |EXPR;fresnelS;2$;144| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 370))) 

(SDEFUN |EXPR;fresnelC;2$;145| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 372))) 

(SDEFUN |EXPR;integral;$S$;146| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 374))) 

(SDEFUN |EXPR;integral;$Sb$;147| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 376))) 

(SDEFUN |EXPR;operator;2Bo;148| ((|op| . #1=(|BasicOperator|)) ($ . #1#))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |op| (QREFELT $ 378))
                  (SPADCALL |op| (QREFELT $ 379)))
                 ((SPADCALL |op| (QREFELT $ 380))
                  (SPADCALL |op| (QREFELT $ 381)))
                 ((SPADCALL |op| (QREFELT $ 382))
                  (SPADCALL |op| (QREFELT $ 383)))
                 ((SPADCALL |op| (QREFELT $ 384))
                  (SPADCALL |op| (QREFELT $ 385)))
                 ((SPADCALL |op| (QREFELT $ 386))
                  (SPADCALL |op| (QREFELT $ 387)))
                 ((SPADCALL |op| (QREFELT $ 21))
                  (SPADCALL |op| (QREFELT $ 22)))
                 ((SPADCALL |op| (QREFELT $ 24))
                  (SPADCALL |op| (QREFELT $ 25)))
                 (#2='T
                  (SEQ
                   (COND
                    ((SPADCALL |op| (QREFELT $ 26))
                     (COND
                      ((SPADCALL |op| (QREFELT $ 7) (QREFELT $ 28))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |op| (QREFELT $ 29))
                                   (QREFELT $ 30))
                         (QREFELT $ 31)))))))
                   (LETT |n| (SPADCALL |op| (QREFELT $ 33))
                         |EXPR;operator;2Bo;148|)
                   (EXIT
                    (COND
                     ((QEQCAR |n| 1)
                      (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QREFELT $ 34)))
                     (#2#
                      (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QCDR |n|)
                                (QREFELT $ 36))))))))))) 

(SDEFUN |EXPR;reduc| ((|x| $) (|l| |List| (|Kernel| $)) ($ $))
        (SPROG
         ((|p| (|SparseUnivariatePolynomial| $)) (#1=#:G399 NIL) (|k| NIL))
         (SEQ
          (SEQ (LETT |k| NIL . #2=(|EXPR;reduc|)) (LETT #1# |l| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |p| (SPADCALL |k| (QREFELT $ 136)) . #2#)
                    (EXIT
                     (LETT |x|
                           (SPADCALL
                            (|EXPR;evl| (SPADCALL |x| (QREFELT $ 99)) |k| |p|
                             $)
                            (|EXPR;evl| (SPADCALL |x| (QREFELT $ 101)) |k| |p|
                             $)
                            (QREFELT $ 68))
                           . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |x|)))) 

(SDEFUN |EXPR;evl0|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) (|k| |Kernel| $)
         ($ |SparseUnivariatePolynomial|
          (|Fraction| (|SparseMultivariatePolynomial| R (|Kernel| $)))))
        (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 389)) |k| (QREFELT $ 392))
                  (QREFELT $ 394))) 

(SDEFUN |EXPR;evl|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) (|k| |Kernel| $)
         (|m| |SparseUnivariatePolynomial| $)
         ($ |Fraction| (|SparseMultivariatePolynomial| R (|Kernel| $))))
        (COND
         ((< (SPADCALL |p| |k| (QREFELT $ 395)) (SPADCALL |m| (QREFELT $ 396)))
          (SPADCALL |p| (QREFELT $ 389)))
         ('T
          (SPADCALL (SPADCALL (|EXPR;evl0| |p| |k| $) |m| (QREFELT $ 397))
                    (SPADCALL (SPADCALL |k| (QREFELT $ 398)) (QREFELT $ 389))
                    (QREFELT $ 399))))) 

(SDEFUN |EXPR;noalg?| ((|p| |SparseUnivariatePolynomial| $) ($ |Boolean|))
        (SPROG ((#1=#:G407 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |p| (|spadConstant| $ 400)
                                    (QREFELT $ 401)))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (NULL
                             (|EXPR;algkernels|
                              (SPADCALL (SPADCALL |p| (QREFELT $ 402))
                                        (QREFELT $ 75))
                              $)))
                           (PROGN
                            (LETT #1# 'NIL . #2=(|EXPR;noalg?|))
                            (GO #1#)))
                          ('T
                           (LETT |p| (SPADCALL |p| (QREFELT $ 403)) . #2#)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #1# (EXIT #1#)))) 

(SDEFUN |EXPR;gcdPolynomial;3Sup;153|
        ((|p| . #1=(|SparseUnivariatePolynomial| $)) (|q| . #1#) ($ . #1#))
        (SEQ
         (COND
          ((|EXPR;noalg?| |p| $)
           (COND
            ((|EXPR;noalg?| |q| $)
             (EXIT (SPADCALL |p| |q| (QREFELT $ 404)))))))
         (EXIT (SPADCALL |p| |q| (QREFELT $ 406))))) 

(SDEFUN |EXPR;factorPolynomial;SupF;154|
        ((|x| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPROG
         ((|uf|
           (|Factored|
            (|SparseUnivariatePolynomial|
             (|Fraction| (|SparseMultivariatePolynomial| R (|Kernel| $)))))))
         (SEQ
          (LETT |uf| (SPADCALL |x| (QREFELT $ 410))
                |EXPR;factorPolynomial;SupF;154|)
          (EXIT |uf|)))) 

(SDEFUN |EXPR;squareFreePolynomial;SupF;155|
        ((|x| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPROG
         ((|uf|
           (|Factored|
            (|SparseUnivariatePolynomial|
             (|Fraction| (|SparseMultivariatePolynomial| R (|Kernel| $)))))))
         (SEQ
          (LETT |uf| (SPADCALL |x| (QREFELT $ 413))
                |EXPR;squareFreePolynomial;SupF;155|)
          (EXIT |uf|)))) 

(SDEFUN |EXPR;coerce;An$;156| ((|x| |AlgebraicNumber|) ($ $))
        (SPADCALL (SPADCALL |x| (|spadConstant| $ 416) (QREFELT $ 417))
                  (QREFELT $ 104))) 

(SDEFUN |EXPR;^;$F$;157| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL |x| |r| (QREFELT $ 421))) 

(SDEFUN |EXPR;minPoly;KSup;158|
        ((|k| |Kernel| . #1=($)) ($ |SparseUnivariatePolynomial| . #1#))
        (SPADCALL |k| (QREFELT $ 423))) 

(SDEFUN |EXPR;definingPolynomial;2$;159| ((|x| $) ($ $))
        (SPADCALL |x| (QREFELT $ 424))) 

(SDEFUN |EXPR;retract;$F;160| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL |x| (QREFELT $ 426))) 

(SDEFUN |EXPR;retractIfCan;$U;161|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPADCALL |x| (QREFELT $ 428))) 

(SDEFUN |EXPR;coerce;An$;162| ((|x| |AlgebraicNumber|) ($ $))
        (SPADCALL (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 430)) $)
                  (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 431)) $)
                  (QREFELT $ 69))) 

(SDEFUN |EXPR;k2expr| ((|k| |Kernel| (|AlgebraicNumber|)) ($ $))
        (SPADCALL (ELT $ 419) |k| (QREFELT $ 435))) 

(SDEFUN |EXPR;smp2expr|
        ((|p| |SparseMultivariatePolynomial| (|Integer|)
          (|Kernel| (|AlgebraicNumber|)))
         ($ $))
        (SPADCALL (CONS (|function| |EXPR;k2expr|) $) (ELT $ 61) |p|
                  (QREFELT $ 440))) 

(SDEFUN |EXPR;retractIfCan;$U;165|
        ((|x| $) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG
         ((#1=#:G434 NIL) (|d| #2=(|Union| (|AlgebraicNumber|) "failed"))
          (|n| #2#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |n| (|EXPR;smp2an| (SPADCALL |x| (QREFELT $ 99)) $)
                   . #3=(|EXPR;retractIfCan;$U;165|))
             (EXIT
              (COND
               ((QEQCAR |n| 0)
                (SEQ
                 (LETT |d| (|EXPR;smp2an| (SPADCALL |x| (QREFELT $ 101)) $)
                       . #3#)
                 (EXIT
                  (COND
                   ((QEQCAR |d| 0)
                    (PROGN
                     (LETT #1#
                           (CONS 0
                                 (SPADCALL (QCDR |n|) (QCDR |d|)
                                           (QREFELT $ 441)))
                           . #3#)
                     (GO #1#))))))))))
            (EXIT (CONS 1 "failed"))))
          #1# (EXIT #1#)))) 

(SDEFUN |EXPR;R2AN| ((|r| R) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG ((|u| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL (SPADCALL |r| (QREFELT $ 444)) (QREFELT $ 72))
                      |EXPR;R2AN|)
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 445))))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |EXPR;k2an| ((|k| |Kernel| $) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG
         ((|arg| (|List| (|AlgebraicNumber|))) (#1=#:G469 NIL)
          (|a| #2=(|Union| (|AlgebraicNumber|) #3="failed")) (#4=#:G470 NIL)
          (|x| NIL)
          (|eq|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| $))))
          (|eqa| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
          (|ccu| #2#) (|cc| ($)) (|a1| ($)) (|s1| (|Symbol|))
          (|s1u| (|Union| (|Symbol|) #3#)) (|k1| (|Kernel| $))
          (|k1u| (|Union| (|Kernel| $) #3#)) (|a2| ($)) (|args| (|List| $))
          (|op| (|BasicOperator|)))
         (SEQ
          (EXIT
           (COND
            ((NULL
              (SPADCALL
               (LETT |op| (SPADCALL |k| (QREFELT $ 31)) . #5=(|EXPR;k2an|))
               (QREFELT $ 446)))
             (CONS 1 "failed"))
            ('T
             (COND
              ((SPADCALL |op| '|rootOf| (QREFELT $ 447))
               (SEQ (LETT |args| (SPADCALL |k| (QREFELT $ 79)) . #5#)
                    (LETT |a2| (SPADCALL |args| 2 (QREFELT $ 81)) . #5#)
                    (LETT |k1u| (SPADCALL |a2| (QREFELT $ 19)) . #5#)
                    (EXIT
                     (COND ((QEQCAR |k1u| 1) (CONS 1 "failed"))
                           (#6='T
                            (SEQ (LETT |k1| (QCDR |k1u|) . #5#)
                                 (LETT |s1u| (SPADCALL |a2| (QREFELT $ 449))
                                       . #5#)
                                 (EXIT
                                  (COND ((QEQCAR |s1u| 1) (CONS 1 "failed"))
                                        (#6#
                                         (SEQ (LETT |s1| (QCDR |s1u|) . #5#)
                                              (LETT |a1|
                                                    (SPADCALL |args| 1
                                                              (QREFELT $ 81))
                                                    . #5#)
                                              (EXIT
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL |a1|
                                                            (QREFELT $ 101))
                                                  (|spadConstant| $ 103)
                                                  (QREFELT $ 450))
                                                 (|error|
                                                  "Bad argument to rootOf"))
                                                (#6#
                                                 (SEQ
                                                  (LETT |eq|
                                                        (SPADCALL
                                                         (SPADCALL |a1|
                                                                   (QREFELT $
                                                                            99))
                                                         |k1| (QREFELT $ 123))
                                                        . #5#)
                                                  (LETT |eqa|
                                                        (|spadConstant| $ 452)
                                                        . #5#)
                                                  (SEQ G190
                                                       (COND
                                                        ((NULL
                                                          (SPADCALL |eq|
                                                                    (|spadConstant|
                                                                     $ 453)
                                                                    (QREFELT $
                                                                             454)))
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |cc|
                                                              (SPADCALL
                                                               (SPADCALL |eq|
                                                                         (QREFELT
                                                                          $
                                                                          125))
                                                               (QREFELT $ 104))
                                                              . #5#)
                                                        (LETT |ccu|
                                                              (SPADCALL |cc|
                                                                        (QREFELT
                                                                         $
                                                                         443))
                                                              . #5#)
                                                        (EXIT
                                                         (COND
                                                          ((QEQCAR |ccu| 1)
                                                           (PROGN
                                                            (LETT #1#
                                                                  (CONS 1
                                                                        "failed")
                                                                  . #5#)
                                                            (GO #1#)))
                                                          ('T
                                                           (SEQ
                                                            (LETT |eqa|
                                                                  (SPADCALL
                                                                   |eqa|
                                                                   (SPADCALL
                                                                    (QCDR
                                                                     |ccu|)
                                                                    (SPADCALL
                                                                     |eq|
                                                                     (QREFELT $
                                                                              455))
                                                                    (QREFELT $
                                                                             456))
                                                                   (QREFELT $
                                                                            457))
                                                                  . #5#)
                                                            (EXIT
                                                             (LETT |eq|
                                                                   (SPADCALL
                                                                    |eq|
                                                                    (QREFELT $
                                                                             126))
                                                                   . #5#)))))))
                                                       NIL (GO G190) G191
                                                       (EXIT NIL))
                                                  (EXIT
                                                   (CONS 0
                                                         (SPADCALL |eqa| |s1|
                                                                   (QREFELT $
                                                                            458))))))))))))))))))
              (#6#
               (SEQ (LETT |arg| NIL . #5#)
                    (SEQ (LETT |x| NIL . #5#)
                         (LETT #4# (SPADCALL |k| (QREFELT $ 79)) . #5#) G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
                           (GO G191)))
                         (SEQ (LETT |a| (SPADCALL |x| (QREFELT $ 443)) . #5#)
                              (EXIT
                               (COND
                                ((QEQCAR |a| 1)
                                 (PROGN
                                  (LETT #1# (CONS 1 "failed") . #5#)
                                  (GO #1#)))
                                ('T
                                 (LETT |arg| (CONS (QCDR |a|) |arg|) . #5#)))))
                         (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (CONS 0
                           (SPADCALL (SPADCALL |op| (QREFELT $ 459))
                                     (NREVERSE |arg|) (QREFELT $ 460))))))))))
          #1# (EXIT #1#)))) 

(SDEFUN |EXPR;smp2an|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $))
         ($ |Union| (|AlgebraicNumber|) #1="failed"))
        (SPROG
         ((|c| (|Union| (|AlgebraicNumber|) #1#))
          (|up|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| $))))
          (|ans| (|AlgebraicNumber|)) (#2=#:G484 NIL)
          (|t| (|Union| (|AlgebraicNumber|) "failed")) (|k| (|Kernel| $))
          (|x1| (|Union| (|Kernel| $) "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |x1| (SPADCALL |p| (QREFELT $ 462)) . #3=(|EXPR;smp2an|))
                (EXIT
                 (COND
                  ((QEQCAR |x1| 1)
                   (|EXPR;R2AN| (SPADCALL |p| (QREFELT $ 463)) $))
                  (#4='T
                   (SEQ
                    (LETT |up|
                          (SPADCALL |p| (LETT |k| (QCDR |x1|) . #3#)
                                    (QREFELT $ 123))
                          . #3#)
                    (LETT |t| (|EXPR;k2an| |k| $) . #3#)
                    (EXIT
                     (COND ((QEQCAR |t| 1) (CONS 1 "failed"))
                           (#4#
                            (SEQ (LETT |ans| (|spadConstant| $ 464) . #3#)
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND
                                          ((SPADCALL |up| (QREFELT $ 465))
                                           'NIL)
                                          ('T 'T)))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |c|
                                             (|EXPR;smp2an|
                                              (SPADCALL |up| (QREFELT $ 125))
                                              $)
                                             . #3#)
                                       (EXIT
                                        (COND
                                         ((QEQCAR |c| 1)
                                          (PROGN
                                           (LETT #2# (CONS 1 "failed") . #3#)
                                           (GO #2#)))
                                         ('T
                                          (SEQ
                                           (LETT |ans|
                                                 (SPADCALL |ans|
                                                           (SPADCALL (QCDR |c|)
                                                                     (SPADCALL
                                                                      (QCDR
                                                                       |t|)
                                                                      (SPADCALL
                                                                       |up|
                                                                       (QREFELT
                                                                        $ 455))
                                                                      (QREFELT
                                                                       $ 466))
                                                                     (QREFELT $
                                                                              467))
                                                           (QREFELT $ 468))
                                                 . #3#)
                                           (EXIT
                                            (LETT |up|
                                                  (SPADCALL |up|
                                                            (QREFELT $ 126))
                                                  . #3#)))))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (LETT |c|
                                       (|EXPR;smp2an|
                                        (SPADCALL |up| (QREFELT $ 125)) $)
                                       . #3#)
                                 (EXIT
                                  (COND ((QEQCAR |c| 1) (CONS 1 "failed"))
                                        (#4#
                                         (CONS 0
                                               (SPADCALL |ans| (QCDR |c|)
                                                         (QREFELT $
                                                                  468))))))))))))))))
          #2# (EXIT #2#)))) 

(SDEFUN |EXPR;convert;$If;169| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 470))) 

(SDEFUN |EXPR;eval;$Bo$S$;170|
        ((|f| $) (|op| |BasicOperator|) (|g| $) (|x| |Symbol|) ($ $))
        (SPADCALL |f| (LIST |op|) (LIST |g|) |x| (QREFELT $ 473))) 

(SDEFUN |EXPR;eval;$LLS$;171|
        ((|f| $) (|ls| |List| (|BasicOperator|)) (|lg| |List| $) (|x| |Symbol|)
         ($ $))
        (SPROG
         ((|res| ($)) (#1=#:G515 NIL) (|g| NIL) (#2=#:G514 NIL)
          (|nlg| (|List| $)) (#3=#:G513 NIL) (#4=#:G512 NIL)
          (|lbackwardSubs| (|List| (|Equation| $))) (#5=#:G510 NIL) (|i| NIL)
          (#6=#:G511 NIL) (|j| NIL) (#7=#:G509 NIL)
          (|lforwardSubs| (|List| (|Equation| $))) (#8=#:G507 NIL)
          (#9=#:G508 NIL) (#10=#:G506 NIL) (|ns| (|List| (|Symbol|)))
          (#11=#:G505 NIL) (#12=#:G504 NIL) (#13=#:G503 NIL) (#14=#:G502 NIL)
          (|lsd| (|List| (|Symbol|))) (|lsym| (|List| (|Symbol|)))
          (|llsym| (|List| (|List| (|Symbol|)))) (#15=#:G501 NIL)
          (#16=#:G500 NIL))
         (SEQ
          (LETT |llsym|
                (PROGN
                 (LETT #16# NIL . #17=(|EXPR;eval;$LLS$;171|))
                 (SEQ (LETT |g| NIL . #17#) (LETT #15# |lg| . #17#) G190
                      (COND
                       ((OR (ATOM #15#)
                            (PROGN (LETT |g| (CAR #15#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #16# (CONS (SPADCALL |g| (QREFELT $ 475)) #16#)
                              . #17#)))
                      (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #16#))))
                . #17#)
          (LETT |lsym|
                (SPADCALL (SPADCALL |llsym| (QREFELT $ 476)) (QREFELT $ 477))
                . #17#)
          (LETT |lsd| (SPADCALL (ELT $ 478) |lsym| (QREFELT $ 480)) . #17#)
          (EXIT
           (COND
            ((NULL |lsd|)
             (SPADCALL |f| |ls|
                       (PROGN
                        (LETT #14# NIL . #17#)
                        (SEQ (LETT |g| NIL . #17#) (LETT #13# |lg| . #17#) G190
                             (COND
                              ((OR (ATOM #13#)
                                   (PROGN (LETT |g| (CAR #13#) . #17#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #14#
                                     (CONS (SPADCALL |g| |x| (QREFELT $ 482))
                                           #14#)
                                     . #17#)))
                             (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                             (EXIT (NREVERSE #14#))))
                       (QREFELT $ 485)))
            ('T
             (SEQ
              (LETT |ns|
                    (PROGN
                     (LETT #12# NIL . #17#)
                     (SEQ (LETT |i| NIL . #17#) (LETT #11# |lsd| . #17#) G190
                          (COND
                           ((OR (ATOM #11#)
                                (PROGN (LETT |i| (CAR #11#) . #17#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #12# (CONS (SPADCALL (QREFELT $ 486)) #12#)
                                  . #17#)))
                          (LETT #11# (CDR #11#) . #17#) (GO G190) G191
                          (EXIT (NREVERSE #12#))))
                    . #17#)
              (LETT |lforwardSubs|
                    (PROGN
                     (LETT #10# NIL . #17#)
                     (SEQ (LETT |j| NIL . #17#) (LETT #9# |ns| . #17#)
                          (LETT |i| NIL . #17#) (LETT #8# |lsd| . #17#) G190
                          (COND
                           ((OR (ATOM #8#)
                                (PROGN (LETT |i| (CAR #8#) . #17#) NIL)
                                (ATOM #9#)
                                (PROGN (LETT |j| (CAR #9#) . #17#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #10#
                                  (CONS
                                   (SPADCALL (SPADCALL |i| (QREFELT $ 487))
                                             (SPADCALL |j| (QREFELT $ 487))
                                             (QREFELT $ 489))
                                   #10#)
                                  . #17#)))
                          (LETT #8#
                                (PROG1 (CDR #8#) (LETT #9# (CDR #9#) . #17#))
                                . #17#)
                          (GO G190) G191 (EXIT (NREVERSE #10#))))
                    . #17#)
              (LETT |lbackwardSubs|
                    (PROGN
                     (LETT #7# NIL . #17#)
                     (SEQ (LETT |j| NIL . #17#) (LETT #6# |ns| . #17#)
                          (LETT |i| NIL . #17#) (LETT #5# |lsd| . #17#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |i| (CAR #5#) . #17#) NIL)
                                (ATOM #6#)
                                (PROGN (LETT |j| (CAR #6#) . #17#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (SPADCALL (SPADCALL |j| (QREFELT $ 487))
                                             (SPADCALL |i| (QREFELT $ 487))
                                             (QREFELT $ 489))
                                   #7#)
                                  . #17#)))
                          (LETT #5#
                                (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #17#))
                                . #17#)
                          (GO G190) G191 (EXIT (NREVERSE #7#))))
                    . #17#)
              (LETT |nlg|
                    (PROGN
                     (LETT #4# NIL . #17#)
                     (SEQ (LETT |g| NIL . #17#) (LETT #3# |lg| . #17#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |g| (CAR #3#) . #17#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (SPADCALL |g| |lforwardSubs|
                                             (QREFELT $ 491))
                                   #4#)
                                  . #17#)))
                          (LETT #3# (CDR #3#) . #17#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #17#)
              (LETT |res|
                    (SPADCALL |f| |ls|
                              (PROGN
                               (LETT #2# NIL . #17#)
                               (SEQ (LETT |g| NIL . #17#)
                                    (LETT #1# |nlg| . #17#) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |g| (CAR #1#) . #17#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL |g| |x| (QREFELT $ 482))
                                             #2#)
                                            . #17#)))
                                    (LETT #1# (CDR #1#) . #17#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 485))
                    . #17#)
              (EXIT (SPADCALL |res| |lbackwardSubs| (QREFELT $ 491)))))))))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;172|
        ((|x| $) (|p| |Pattern| #1=(|Integer|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 495))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;173|
        ((|x| $) (|p| |Pattern| #1=(|Float|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 501))) 

(SDEFUN |EXPR;Zero;$;174| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |EXPR;One;$;175| (($ $)) (|spadConstant| $ 48)) 

(SDEFUN |EXPR;-;2$;176| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |EXPR;*;I2$;177| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL |n| |x| (QREFELT $ 58))) 

(SDEFUN |EXPR;*;3$;178| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 62))) 

(SDEFUN |EXPR;+;3$;179| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 64))) 

(SDEFUN |EXPR;=;2$B;180| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(SDEFUN |EXPR;smaller?;2$B;181| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 94))) 

(PUT '|EXPR;numer;$Smp;182| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |EXPR;numer;$Smp;182|
        ((|x| $) ($ |SparseMultivariatePolynomial| R (|Kernel| $))) |x|) 

(PUT '|EXPR;coerce;Smp$;183| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |EXPR;coerce;Smp$;183|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) ($ $)) |p|) 

(SDEFUN |EXPR;coerce;P$;184| ((|p| |Polynomial| R) ($ $))
        (|EXPR;poly_to_MP| |p| $)) 

(SDEFUN |EXPR;reducedSystem;MM;185| ((|m| |Matrix| $) ($ |Matrix| R))
        (SPADCALL |m| (QREFELT $ 504))) 

(SDEFUN |EXPR;reducedSystem;MVR;186|
        ((|m| |Matrix| . #1=($)) (|v| |Vector| . #1#)
         ($ |Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R))))
        (SPADCALL |m| |v| (QREFELT $ 505))) 

(SDEFUN |EXPR;convert;$If;187| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 470))) 

(SDEFUN |EXPR;kintmatch|
        ((|k| |Kernel| $) (|p| |Pattern| (|Integer|))
         (|l| |PatternMatchResult| (|Integer|) |Rep|)
         ($ |PatternMatchResult| (|Integer|) |Rep|))
        (SPADCALL |k| |p| |l| (QREFELT $ 507))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;189|
        ((|x| $) (|p| |Pattern| #1=(|Integer|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kintmatch|) $)
                  (QREFELT $ 511))) 

(SDEFUN |EXPR;kfltmatch|
        ((|k| |Kernel| $) (|p| |Pattern| (|Float|))
         (|l| |PatternMatchResult| (|Float|) |Rep|)
         ($ |PatternMatchResult| (|Float|) |Rep|))
        (SPADCALL |k| |p| |l| (QREFELT $ 513))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;191|
        ((|x| $) (|p| |Pattern| #1=(|Float|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kfltmatch|) $)
                  (QREFELT $ 517))) 

(SDEFUN |EXPR;Zero;$;192| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |EXPR;+;3$;193| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 64))) 

(SDEFUN |EXPR;=;2$B;194| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(SDEFUN |EXPR;smaller?;2$B;195| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 94))) 

(SDEFUN |EXPR;coerce;K$;196| ((|k| |Kernel| $) ($ $))
        (SPADCALL |k| (QREFELT $ 518))) 

(SDEFUN |EXPR;kernels;$L;197| ((|x| $) ($ |List| (|Kernel| $)))
        (SPROG ((#1=#:G552 NIL) (|f| NIL) (#2=#:G551 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EXPR;kernels;$L;197|))
                 (SEQ (LETT |f| NIL . #3#)
                      (LETT #1# (SPADCALL |x| (QREFELT $ 521)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCAR |f|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EXPR;coerce;R$;198| ((|x| R) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 522)) (|spadConstant| $ 47))
              ('T (SPADCALL (SPADCALL |x| (QREFELT $ 523)) (QREFELT $ 140))))) 

(SDEFUN |EXPR;retract;$R;199| ((|x| $) ($ R))
        (COND ((SPADCALL |x| (QREFELT $ 54)) (|spadConstant| $ 87))
              ('T (|EXPR;retNotUnit| |x| $)))) 

(SDEFUN |EXPR;coerce;$Of;200| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 526))) 

(SDEFUN |EXPR;kereval|
        ((|k| |Kernel| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SPADCALL |lk| |lv| |k|
                         (CONS #'|EXPR;kereval!1| (VECTOR |lk| |lv| $ $$))
                         (QREFELT $ 532)))) 

(SDEFUN |EXPR;kereval!1| ((|x2| NIL) ($$ NIL))
        (PROG ($$ $ |lv| |lk|)
          (LETT $$ (QREFELT $$ 3) . #1=(|EXPR;kereval|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT |lk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|EXPR;kereval!0| (VECTOR $ |lv| |lk|))
                             |x2| (QREFELT $ 529))))))) 

(SDEFUN |EXPR;kereval!0| ((|x1| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x1| |lk| |lv| (QREFELT $ 528)))))) 

(SDEFUN |EXPR;subeval|
        ((|k| |Kernel| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |k|
                          (CONS #'|EXPR;subeval!0| (VECTOR |lv| |lk| $))
                          (QREFELT $ 532))))) 

(SDEFUN |EXPR;subeval!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |lk| |lv|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subeval|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |lv| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G576 NIL) (|a| NIL) (#3=#:G575 NIL))
                   (SEQ
                    (SPADCALL (SPADCALL |x| (QREFELT $ 31))
                              (PROGN
                               (LETT #3# NIL NIL)
                               (SEQ (LETT |a| NIL NIL)
                                    (LETT #2# (SPADCALL |x| (QREFELT $ 79))
                                          NIL)
                                    G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN (LETT |a| (CAR #2#) NIL) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #3#
                                            (CONS
                                             (SPADCALL |a| |lk| |lv|
                                                       (QREFELT $ 533))
                                             #3#)
                                            NIL)))
                                    (LETT #2# (CDR #2#) NIL) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              (QREFELT $ 534)))))))) 

(SDEFUN |EXPR;isPlus;$U;203| ((|x| $) ($ |Union| (|List| $) "failed"))
        (SPROG
         ((#1=#:G591 NIL) (|t| NIL) (#2=#:G590 NIL)
          (|l|
           (|List|
            (|Record| (|:| |gen| (|Kernel| $)) (|:| |exp| (|Integer|))))))
         (SEQ
          (COND
           ((OR
             (NULL
              (LETT |l| (SPADCALL |x| (QREFELT $ 521))
                    . #3=(|EXPR;isPlus;$U;203|)))
             (NULL (CDR |l|)))
            (CONS 1 "failed"))
           ('T
            (CONS 0
                  (PROGN
                   (LETT #2# NIL . #3#)
                   (SEQ (LETT |t| NIL . #3#) (LETT #1# |l| . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (SPADCALL (QCDR |t|) (QCAR |t|)
                                           (QREFELT $ 535))
                                 #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |EXPR;isMult;$U;204|
        ((|x| $)
         ($ |Union|
          (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| $)))
          "failed"))
        (SPROG
         ((|t| (|Record| (|:| |gen| (|Kernel| $)) (|:| |exp| (|Integer|))))
          (|l|
           (|List|
            (|Record| (|:| |gen| (|Kernel| $)) (|:| |exp| (|Integer|))))))
         (SEQ
          (COND
           ((OR
             (NULL
              (LETT |l| (SPADCALL |x| (QREFELT $ 521))
                    . #1=(|EXPR;isMult;$U;204|)))
             (NULL (NULL (CDR |l|))))
            (CONS 1 "failed"))
           ('T
            (SEQ (LETT |t| (SPADCALL |l| (QREFELT $ 538)) . #1#)
                 (EXIT (CONS 0 (CONS (QCDR |t|) (QCAR |t|)))))))))) 

(SDEFUN |EXPR;eval;$LL$;205|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG
         ((#1=#:G607 NIL) (#2=#:G606 ($)) (#3=#:G608 ($)) (#4=#:G610 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|EXPR;eval;$LL$;205|))
           (SEQ (LETT |t| NIL . #5#)
                (LETT #4# (SPADCALL |x| (QREFELT $ 521)) . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|)
                                   (|EXPR;kereval| (QCAR |t|) |lk| |lv| $)
                                   (QREFELT $ 58))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 65)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 47))))))) 

(SDEFUN |EXPR;subst;$LL$;206|
        ((|x| $) (|lk| |List| (|Kernel| . #1=($))) (|lv| |List| . #1#) ($ $))
        (SPROG
         ((#2=#:G613 NIL) (#3=#:G612 ($)) (#4=#:G614 ($)) (#5=#:G616 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #2# NIL . #6=(|EXPR;subst;$LL$;206|))
           (SEQ (LETT |t| NIL . #6#)
                (LETT #5# (SPADCALL |x| (QREFELT $ 521)) . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL (QCDR |t|)
                                   (|EXPR;subeval| (QCAR |t|) |lk| |lv| $)
                                   (QREFELT $ 58))
                         . #6#)
                   (COND
                    (#2# (LETT #3# (SPADCALL #3# #4# (QREFELT $ 65)) . #6#))
                    ('T (PROGN (LETT #3# #4# . #6#) (LETT #2# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#2# #3#) ('T (|spadConstant| $ 47))))))) 

(SDEFUN |EXPR;retractIfCan;$U;207| ((|x| $) ($ |Union| R "failed"))
        (COND ((SPADCALL |x| (QREFELT $ 54)) (CONS 0 (|spadConstant| $ 87)))
              ('T (|EXPR;retNotUnitIfCan| |x| $)))) 

(SDEFUN |EXPR;-;2$;208| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |EXPR;smaller?;2$B;209| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 94))) 

(SDEFUN |EXPR;=;2$B;210| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(PUT '|EXPR;coerce;K$;211| '|SPADreplace| '(XLAM (|k|) |k|)) 

(SDEFUN |EXPR;coerce;K$;211| ((|k| |Kernel| $) ($ $)) |k|) 

(PUT '|EXPR;kernels;$L;212| '|SPADreplace| 'LIST) 

(SDEFUN |EXPR;kernels;$L;212| ((|x| $) ($ |List| (|Kernel| $))) (LIST |x|)) 

(SDEFUN |EXPR;coerce;R$;213| ((|x| R) ($ $)) (SPADCALL |x| (QREFELT $ 523))) 

(SDEFUN |EXPR;retract;$R;214| ((|x| $) ($ R)) (|EXPR;retNotUnit| |x| $)) 

(SDEFUN |EXPR;retractIfCan;$U;215| ((|x| $) ($ |Union| R "failed"))
        (|EXPR;retNotUnitIfCan| |x| $)) 

(SDEFUN |EXPR;coerce;$Of;216| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 526))) 

(SDEFUN |EXPR;eval;$LL$;217|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SPADCALL |lk| |lv| |x|
                         (CONS #'|EXPR;eval;$LL$;217!1|
                               (VECTOR |lk| |lv| $ $$))
                         (QREFELT $ 532)))) 

(SDEFUN |EXPR;eval;$LL$;217!1| ((|x1| NIL) ($$ NIL))
        (PROG ($$ $ |lv| |lk|)
          (LETT $$ (QREFELT $$ 3) . #1=(|EXPR;eval;$LL$;217|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT |lk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (CONS #'|EXPR;eval;$LL$;217!0| (VECTOR $ |lv| |lk|)) |x1|
                    (QREFELT $ 529))))))) 

(SDEFUN |EXPR;eval;$LL$;217!0| ((|x2| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |lk| |lv| (QREFELT $ 528)))))) 

(SDEFUN |EXPR;subst;$LL$;218|
        ((|x| $) (|lk| |List| (|Kernel| . #1=($))) (|lv| |List| . #1#) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |x|
                          (CONS #'|EXPR;subst;$LL$;218!0| (VECTOR |lv| |lk| $))
                          (QREFELT $ 532))))) 

(SDEFUN |EXPR;subst;$LL$;218!0| ((|x1| NIL) ($$ NIL))
        (PROG ($ |lk| |lv|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subst;$LL$;218|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |lv| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G652 NIL) (|a| NIL) (#3=#:G651 NIL))
                   (SEQ
                    (SPADCALL (SPADCALL |x1| (QREFELT $ 31))
                              (PROGN
                               (LETT #3# NIL NIL)
                               (SEQ (LETT |a| NIL NIL)
                                    (LETT #2# (SPADCALL |x1| (QREFELT $ 79))
                                          NIL)
                                    G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN (LETT |a| (CAR #2#) NIL) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #3#
                                            (CONS
                                             (SPADCALL |a| |lk| |lv|
                                                       (QREFELT $ 533))
                                             #3#)
                                            NIL)))
                                    (LETT #2# (CDR #2#) NIL) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              (QREFELT $ 534)))))))) 

(SDEFUN |EXPR;convert;$If;219| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 470))) 

(DECLAIM (NOTINLINE |Expression;|)) 

(DEFUN |Expression| (#1=#:G692)
  (SPROG NIL
         (PROG (#2=#:G693)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Expression|)
                                               '|domainEqualList|)
                    . #3=(|Expression|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Expression;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|Expression|)))))))))) 

(DEFUN |Expression;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G687 NIL) (#2=#:G688 NIL) (#3=#:G689 NIL) (#4=#:G690 NIL)
    (#5=#:G691 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #6=(|Expression|))
    (LETT |dv$| (LIST '|Expression| DV$1) . #6#)
    (LETT $ (GETREFV 573) . #6#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #5#
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #5#)
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitRingOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1| '(|Group|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#1|
                                                              '(|IntegralDomain|)))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #4#)
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            #5#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #5#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #5#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Integer|)))
                                         #5#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|)))
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         #5#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|AbelianSemiGroup|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         #3# #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #5#)
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|SemiGroup|))
                                              . #6#)
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            #1#)
                                        (OR #2# #1#)
                                        (AND
                                         (|HasCategory| |#1| '(|GcdDomain|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|)))))
                    . #6#))
    (|haddProp| |$ConstructorCache| '|Expression| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
         (|augmentPredVector| $ 1073741824))
    (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 2147483648))
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| $ '(|RetractableTo| (|Integer|)))
         (|augmentPredVector| $ 4294967296))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 '|%symbol|)
    (QSETREFV $ 8 '|%alg|)
    (COND ((|testBitVector| |pv$| 1))
          ('T
           (QSETREFV $ 37
                     (CONS (|dispatchFunction| |EXPR;operator;2Bo;4|) $))))
    (COND
     ((|testBitVector| |pv$| 5)
      (PROGN
       (COND
        ((|testBitVector| |pv$| 1)
         (PROGN
          (QSETREFV $ 45
                    (|Fraction|
                     (|SparseMultivariatePolynomial| |#1| (|Kernel| $))))
          (QSETREFV $ 47
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;Zero;$;6|) $ 47)))
          (QSETREFV $ 49
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;One;$;7|) $ 49)))
          (QSETREFV $ 52 (CONS (|dispatchFunction| |EXPR;one?;$B;8|) $))
          (QSETREFV $ 54 (CONS (|dispatchFunction| |EXPR;zero?;$B;9|) $))
          (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;10|) $))
          (QSETREFV $ 59 (CONS (|dispatchFunction| |EXPR;*;I2$;11|) $))
          (QSETREFV $ 61 (CONS (|dispatchFunction| |EXPR;coerce;I$;12|) $))
          (QSETREFV $ 63 (CONS (|dispatchFunction| |EXPR;*;3$;13|) $))
          (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;14|) $))
          (QSETREFV $ 67 (CONS (|dispatchFunction| |EXPR;-;3$;15|) $))
          (QSETREFV $ 69 (CONS (|dispatchFunction| |EXPR;/;3$;16|) $))
          (QSETREFV $ 73 (CONS (|dispatchFunction| |EXPR;number?;$B;17|) $))
          (QSETREFV $ 86
                    (CONS (|dispatchFunction| |EXPR;simplifyPower;$I$;18|) $))
          (QSETREFV $ 90 (CONS (|dispatchFunction| |EXPR;^;$Nni$;19|) $))
          (QSETREFV $ 91 (CONS (|dispatchFunction| |EXPR;^;$I$;20|) $))
          (QSETREFV $ 93 (CONS (|dispatchFunction| |EXPR;^;$Pi$;21|) $))
          (QSETREFV $ 95 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;22|) $))
          (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;23|) $))
          (QSETREFV $ 99 (CONS (|dispatchFunction| |EXPR;numer;$Smp;24|) $))
          (QSETREFV $ 101 (CONS (|dispatchFunction| |EXPR;denom;$Smp;25|) $))
          (QSETREFV $ 102
                    (|Record|
                     (|:| |num|
                          (|SparseMultivariatePolynomial| |#1| (|Kernel| $)))
                     (|:| |den|
                          (|SparseMultivariatePolynomial| |#1| (|Kernel| $)))))
          (QSETREFV $ 104 (CONS (|dispatchFunction| |EXPR;coerce;Smp$;26|) $))
          (QSETREFV $ 106 (CONS (|dispatchFunction| |EXPR;coerce;P$;27|) $))
          (QSETREFV $ 110 (CONS (|dispatchFunction| |EXPR;coerce;F$;28|) $))
          (QSETREFV $ 111 (CONS (|dispatchFunction| |EXPR;reduce;2$;29|) $))
          (DEFVAR |algreduc_flag| 'NIL)
          (QSETREFV $ 131
                    (CONS
                     (|dispatchFunction| |EXPR;getSimplifyDenomsFlag;B;37|) $))
          (QSETREFV $ 132
                    (CONS
                     (|dispatchFunction| |EXPR;setSimplifyDenomsFlag;2B;38|)
                     $))
          (QSETREFV $ 143 (CONS (|dispatchFunction| |EXPR;/;2Smp$;40|) $))
          (QSETREFV $ 152
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;41|) $))
          (QSETREFV $ 160
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;42|) $))
          (QSETREFV $ 165 (CONS (|dispatchFunction| |EXPR;rootOf;SupS$;44|) $))
          (QSETREFV $ 167
                    (CONS (|dispatchFunction| |EXPR;rootSum;$SupS$;45|) $))
          (QSETREFV $ 170 (CONS (|dispatchFunction| |EXPR;pi;$;46|) $))
          (QSETREFV $ 172 (CONS (|dispatchFunction| |EXPR;exp;2$;47|) $))
          (QSETREFV $ 174 (CONS (|dispatchFunction| |EXPR;log;2$;48|) $))
          (QSETREFV $ 176 (CONS (|dispatchFunction| |EXPR;sin;2$;49|) $))
          (QSETREFV $ 178 (CONS (|dispatchFunction| |EXPR;cos;2$;50|) $))
          (QSETREFV $ 180 (CONS (|dispatchFunction| |EXPR;tan;2$;51|) $))
          (QSETREFV $ 182 (CONS (|dispatchFunction| |EXPR;cot;2$;52|) $))
          (QSETREFV $ 184 (CONS (|dispatchFunction| |EXPR;sec;2$;53|) $))
          (QSETREFV $ 186 (CONS (|dispatchFunction| |EXPR;csc;2$;54|) $))
          (QSETREFV $ 188 (CONS (|dispatchFunction| |EXPR;asin;2$;55|) $))
          (QSETREFV $ 190 (CONS (|dispatchFunction| |EXPR;acos;2$;56|) $))
          (QSETREFV $ 192 (CONS (|dispatchFunction| |EXPR;atan;2$;57|) $))
          (QSETREFV $ 194 (CONS (|dispatchFunction| |EXPR;acot;2$;58|) $))
          (QSETREFV $ 196 (CONS (|dispatchFunction| |EXPR;asec;2$;59|) $))
          (QSETREFV $ 198 (CONS (|dispatchFunction| |EXPR;acsc;2$;60|) $))
          (QSETREFV $ 200 (CONS (|dispatchFunction| |EXPR;sinh;2$;61|) $))
          (QSETREFV $ 202 (CONS (|dispatchFunction| |EXPR;cosh;2$;62|) $))
          (QSETREFV $ 204 (CONS (|dispatchFunction| |EXPR;tanh;2$;63|) $))
          (QSETREFV $ 206 (CONS (|dispatchFunction| |EXPR;coth;2$;64|) $))
          (QSETREFV $ 208 (CONS (|dispatchFunction| |EXPR;sech;2$;65|) $))
          (QSETREFV $ 210 (CONS (|dispatchFunction| |EXPR;csch;2$;66|) $))
          (QSETREFV $ 212 (CONS (|dispatchFunction| |EXPR;asinh;2$;67|) $))
          (QSETREFV $ 214 (CONS (|dispatchFunction| |EXPR;acosh;2$;68|) $))
          (QSETREFV $ 216 (CONS (|dispatchFunction| |EXPR;atanh;2$;69|) $))
          (QSETREFV $ 218 (CONS (|dispatchFunction| |EXPR;acoth;2$;70|) $))
          (QSETREFV $ 220 (CONS (|dispatchFunction| |EXPR;asech;2$;71|) $))
          (QSETREFV $ 222 (CONS (|dispatchFunction| |EXPR;acsch;2$;72|) $))
          (QSETREFV $ 225 (CONS (|dispatchFunction| |EXPR;abs;2$;73|) $))
          (QSETREFV $ 227 (CONS (|dispatchFunction| |EXPR;Gamma;2$;74|) $))
          (QSETREFV $ 229 (CONS (|dispatchFunction| |EXPR;Gamma;3$;75|) $))
          (QSETREFV $ 231 (CONS (|dispatchFunction| |EXPR;Beta;3$;76|) $))
          (QSETREFV $ 233 (CONS (|dispatchFunction| |EXPR;digamma;2$;77|) $))
          (QSETREFV $ 235 (CONS (|dispatchFunction| |EXPR;polygamma;3$;78|) $))
          (QSETREFV $ 237 (CONS (|dispatchFunction| |EXPR;besselJ;3$;79|) $))
          (QSETREFV $ 239 (CONS (|dispatchFunction| |EXPR;besselY;3$;80|) $))
          (QSETREFV $ 241 (CONS (|dispatchFunction| |EXPR;besselI;3$;81|) $))
          (QSETREFV $ 243 (CONS (|dispatchFunction| |EXPR;besselK;3$;82|) $))
          (QSETREFV $ 245 (CONS (|dispatchFunction| |EXPR;airyAi;2$;83|) $))
          (QSETREFV $ 247
                    (CONS (|dispatchFunction| |EXPR;airyAiPrime;2$;84|) $))
          (QSETREFV $ 249 (CONS (|dispatchFunction| |EXPR;airyBi;2$;85|) $))
          (QSETREFV $ 251
                    (CONS (|dispatchFunction| |EXPR;airyBiPrime;2$;86|) $))
          (QSETREFV $ 253 (CONS (|dispatchFunction| |EXPR;lambertW;2$;87|) $))
          (QSETREFV $ 255 (CONS (|dispatchFunction| |EXPR;polylog;3$;88|) $))
          (QSETREFV $ 257
                    (CONS (|dispatchFunction| |EXPR;weierstrassP;4$;89|) $))
          (QSETREFV $ 259
                    (CONS (|dispatchFunction| |EXPR;weierstrassPPrime;4$;90|)
                          $))
          (QSETREFV $ 261
                    (CONS (|dispatchFunction| |EXPR;weierstrassSigma;4$;91|)
                          $))
          (QSETREFV $ 263
                    (CONS (|dispatchFunction| |EXPR;weierstrassZeta;4$;92|) $))
          (QSETREFV $ 265
                    (CONS (|dispatchFunction| |EXPR;whittakerM;4$;93|) $))
          (QSETREFV $ 267
                    (CONS (|dispatchFunction| |EXPR;whittakerW;4$;94|) $))
          (QSETREFV $ 269 (CONS (|dispatchFunction| |EXPR;angerJ;3$;95|) $))
          (QSETREFV $ 271 (CONS (|dispatchFunction| |EXPR;weberE;3$;96|) $))
          (QSETREFV $ 273 (CONS (|dispatchFunction| |EXPR;struveH;3$;97|) $))
          (QSETREFV $ 275 (CONS (|dispatchFunction| |EXPR;struveL;3$;98|) $))
          (QSETREFV $ 277 (CONS (|dispatchFunction| |EXPR;hankelH1;3$;99|) $))
          (QSETREFV $ 279 (CONS (|dispatchFunction| |EXPR;hankelH2;3$;100|) $))
          (QSETREFV $ 281 (CONS (|dispatchFunction| |EXPR;lommelS1;4$;101|) $))
          (QSETREFV $ 283 (CONS (|dispatchFunction| |EXPR;lommelS2;4$;102|) $))
          (QSETREFV $ 285 (CONS (|dispatchFunction| |EXPR;kummerM;4$;103|) $))
          (QSETREFV $ 287 (CONS (|dispatchFunction| |EXPR;kummerU;4$;104|) $))
          (QSETREFV $ 289
                    (CONS (|dispatchFunction| |EXPR;legendreP;4$;105|) $))
          (QSETREFV $ 291
                    (CONS (|dispatchFunction| |EXPR;legendreQ;4$;106|) $))
          (QSETREFV $ 293
                    (CONS (|dispatchFunction| |EXPR;kelvinBei;3$;107|) $))
          (QSETREFV $ 295
                    (CONS (|dispatchFunction| |EXPR;kelvinBer;3$;108|) $))
          (QSETREFV $ 297
                    (CONS (|dispatchFunction| |EXPR;kelvinKei;3$;109|) $))
          (QSETREFV $ 299
                    (CONS (|dispatchFunction| |EXPR;kelvinKer;3$;110|) $))
          (QSETREFV $ 301
                    (CONS (|dispatchFunction| |EXPR;ellipticK;2$;111|) $))
          (QSETREFV $ 303
                    (CONS (|dispatchFunction| |EXPR;ellipticE;2$;112|) $))
          (QSETREFV $ 305
                    (CONS (|dispatchFunction| |EXPR;ellipticE;3$;113|) $))
          (QSETREFV $ 307
                    (CONS (|dispatchFunction| |EXPR;ellipticF;3$;114|) $))
          (QSETREFV $ 309
                    (CONS (|dispatchFunction| |EXPR;ellipticPi;4$;115|) $))
          (QSETREFV $ 311 (CONS (|dispatchFunction| |EXPR;jacobiSn;3$;116|) $))
          (QSETREFV $ 313 (CONS (|dispatchFunction| |EXPR;jacobiCn;3$;117|) $))
          (QSETREFV $ 315 (CONS (|dispatchFunction| |EXPR;jacobiDn;3$;118|) $))
          (QSETREFV $ 317
                    (CONS (|dispatchFunction| |EXPR;jacobiZeta;3$;119|) $))
          (QSETREFV $ 319
                    (CONS (|dispatchFunction| |EXPR;jacobiTheta;3$;120|) $))
          (QSETREFV $ 321 (CONS (|dispatchFunction| |EXPR;lerchPhi;4$;121|) $))
          (QSETREFV $ 323
                    (CONS (|dispatchFunction| |EXPR;riemannZeta;2$;122|) $))
          (COND
           ((|testBitVector| |pv$| 31)
            (PROGN
             (QSETREFV $ 326
                       (CONS
                        (|dispatchFunction| |EXPR;hypergeometricF;2L2$;123|)
                        (|getDomainView| $ '(|RetractableTo| (|Integer|)))))
             (QSETREFV $ 328
                       (CONS (|dispatchFunction| |EXPR;meijerG;4L2$;124|)
                             (|getDomainView| $
                                              '(|RetractableTo|
                                                (|Integer|))))))))
          (QSETREFV $ 83 (CONS (|dispatchFunction| |EXPR;^;3$;125|) $))
          (QSETREFV $ 332
                    (CONS (|dispatchFunction| |EXPR;factorial;2$;126|) $))
          (QSETREFV $ 334 (CONS (|dispatchFunction| |EXPR;binomial;3$;127|) $))
          (QSETREFV $ 336
                    (CONS (|dispatchFunction| |EXPR;permutation;3$;128|) $))
          (QSETREFV $ 338
                    (CONS (|dispatchFunction| |EXPR;factorials;2$;129|) $))
          (QSETREFV $ 340
                    (CONS (|dispatchFunction| |EXPR;factorials;$S$;130|) $))
          (QSETREFV $ 342
                    (CONS (|dispatchFunction| |EXPR;summation;$S$;131|) $))
          (QSETREFV $ 346
                    (CONS (|dispatchFunction| |EXPR;summation;$Sb$;132|) $))
          (QSETREFV $ 348 (CONS (|dispatchFunction| |EXPR;product;$S$;133|) $))
          (QSETREFV $ 350
                    (CONS (|dispatchFunction| |EXPR;product;$Sb$;134|) $))
          (QSETREFV $ 353 (CONS (|dispatchFunction| |EXPR;erf;2$;135|) $))
          (QSETREFV $ 355 (CONS (|dispatchFunction| |EXPR;erfi;2$;136|) $))
          (QSETREFV $ 357 (CONS (|dispatchFunction| |EXPR;Ei;2$;137|) $))
          (QSETREFV $ 359 (CONS (|dispatchFunction| |EXPR;Si;2$;138|) $))
          (QSETREFV $ 361 (CONS (|dispatchFunction| |EXPR;Ci;2$;139|) $))
          (QSETREFV $ 363 (CONS (|dispatchFunction| |EXPR;Shi;2$;140|) $))
          (QSETREFV $ 365 (CONS (|dispatchFunction| |EXPR;Chi;2$;141|) $))
          (QSETREFV $ 367 (CONS (|dispatchFunction| |EXPR;li;2$;142|) $))
          (QSETREFV $ 369 (CONS (|dispatchFunction| |EXPR;dilog;2$;143|) $))
          (QSETREFV $ 371 (CONS (|dispatchFunction| |EXPR;fresnelS;2$;144|) $))
          (QSETREFV $ 373 (CONS (|dispatchFunction| |EXPR;fresnelC;2$;145|) $))
          (QSETREFV $ 375
                    (CONS (|dispatchFunction| |EXPR;integral;$S$;146|) $))
          (QSETREFV $ 377
                    (CONS (|dispatchFunction| |EXPR;integral;$Sb$;147|) $))
          (QSETREFV $ 37 (CONS (|dispatchFunction| |EXPR;operator;2Bo;148|) $))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (PROGN
             (QSETREFV $ 407
                       (CONS (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;153|)
                             $))
             (QSETREFV $ 412
                       (CONS
                        (|dispatchFunction| |EXPR;factorPolynomial;SupF;154|)
                        $))
             (QSETREFV $ 414
                       (CONS
                        (|dispatchFunction|
                         |EXPR;squareFreePolynomial;SupF;155|)
                        $)))))
          (COND
           ((|domainEqual| |#1| (|AlgebraicNumber|))
            (QSETREFV $ 419
                      (CONS (|dispatchFunction| |EXPR;coerce;An$;156|) $))))
          (COND
           ((|testBitVector| |pv$| 14)
            (PROGN
             (QSETREFV $ 422 (CONS (|dispatchFunction| |EXPR;^;$F$;157|) $))
             (QSETREFV $ 136
                       (CONS (|dispatchFunction| |EXPR;minPoly;KSup;158|) $))
             (QSETREFV $ 425
                       (CONS
                        (|dispatchFunction| |EXPR;definingPolynomial;2$;159|)
                        $))
             (QSETREFV $ 427
                       (CONS (|dispatchFunction| |EXPR;retract;$F;160|) $))
             (QSETREFV $ 72
                       (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;161|)
                             $))
             (COND ((|domainEqual| |#1| (|AlgebraicNumber|)))
                   ('T
                    (PROGN
                     (QSETREFV $ 419
                               (CONS (|dispatchFunction| |EXPR;coerce;An$;162|)
                                     $))
                     (QSETREFV $ 443
                               (CONS
                                (|dispatchFunction| |EXPR;retractIfCan;$U;165|)
                                $))))))))
          (COND
           ((|testBitVector| |pv$| 9)
            (PROGN
             (QSETREFV $ 471
                       (CONS (|dispatchFunction| |EXPR;convert;$If;169|) $))
             (QSETREFV $ 474
                       (CONS (|dispatchFunction| |EXPR;eval;$Bo$S$;170|) $))
             (QSETREFV $ 473
                       (CONS (|dispatchFunction| |EXPR;eval;$LLS$;171|) $)))))
          (COND
           ((|testBitVector| |pv$| 13)
            (QSETREFV $ 497
                      (CONS (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;172|)
                            $))))
          (COND
           ((|testBitVector| |pv$| 12)
            (QSETREFV $ 503
                      (CONS (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;173|)
                            $))))))
        ('T
         (PROGN
          (SETELT $ 45 (|SparseMultivariatePolynomial| |#1| (|Kernel| $)))
          (QSETREFV $ 47
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;Zero;$;174|) $ 47)))
          (QSETREFV $ 49
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;One;$;175|) $ 49)))
          (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;176|) $))
          (QSETREFV $ 59 (CONS (|dispatchFunction| |EXPR;*;I2$;177|) $))
          (QSETREFV $ 63 (CONS (|dispatchFunction| |EXPR;*;3$;178|) $))
          (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;179|) $))
          (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;180|) $))
          (QSETREFV $ 95 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;181|) $))
          (QSETREFV $ 99 (CONS (|dispatchFunction| |EXPR;numer;$Smp;182|) $))
          (QSETREFV $ 104 (CONS (|dispatchFunction| |EXPR;coerce;Smp$;183|) $))
          (QSETREFV $ 106 (CONS (|dispatchFunction| |EXPR;coerce;P$;184|) $))
          (QSETREFV $ 152
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;185|) $))
          (QSETREFV $ 160
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;186|) $))
          (COND
           ((|testBitVector| |pv$| 9)
            (QSETREFV $ 471
                      (CONS (|dispatchFunction| |EXPR;convert;$If;187|) $))))
          (COND
           ((|testBitVector| |pv$| 13)
            (PROGN
             (QSETREFV $ 497
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;189|)
                        $)))))
          (COND
           ((|testBitVector| |pv$| 12)
            (PROGN
             (QSETREFV $ 503
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;191|)
                        $))))))))))
     ((|HasCategory| |#1| '(|AbelianMonoid|))
      (PROGN
       (SETELT $ 45 (|FreeAbelianGroup| (|Kernel| $)))
       (QSETREFV $ 47
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |EXPR;Zero;$;192|) $ 47)))
       (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;193|) $))
       (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;194|) $))
       (QSETREFV $ 95 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;195|) $))
       (QSETREFV $ 140 (CONS (|dispatchFunction| |EXPR;coerce;K$;196|) $))
       (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;197|) $))
       (QSETREFV $ 444 (CONS (|dispatchFunction| |EXPR;coerce;R$;198|) $))
       (QSETREFV $ 524 (CONS (|dispatchFunction| |EXPR;retract;$R;199|) $))
       (QSETREFV $ 527 (CONS (|dispatchFunction| |EXPR;coerce;$Of;200|) $))
       (QSETREFV $ 537 (CONS (|dispatchFunction| |EXPR;isPlus;$U;203|) $))
       (QSETREFV $ 541 (CONS (|dispatchFunction| |EXPR;isMult;$U;204|) $))
       (QSETREFV $ 528 (CONS (|dispatchFunction| |EXPR;eval;$LL$;205|) $))
       (QSETREFV $ 533 (CONS (|dispatchFunction| |EXPR;subst;$LL$;206|) $))
       (QSETREFV $ 542
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;207|) $))
       (COND
        ((|testBitVector| |pv$| 19)
         (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;208|) $))))))
     ('T
      (PROGN
       (SETELT $ 45 (|Kernel| $))
       (QSETREFV $ 95 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;209|) $))
       (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;210|) $))
       (QSETREFV $ 140 (CONS (|dispatchFunction| |EXPR;coerce;K$;211|) $))
       (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;212|) $))
       (QSETREFV $ 444 (CONS (|dispatchFunction| |EXPR;coerce;R$;213|) $))
       (QSETREFV $ 524 (CONS (|dispatchFunction| |EXPR;retract;$R;214|) $))
       (QSETREFV $ 542
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;215|) $))
       (QSETREFV $ 527 (CONS (|dispatchFunction| |EXPR;coerce;$Of;216|) $))
       (QSETREFV $ 528 (CONS (|dispatchFunction| |EXPR;eval;$LL$;217|) $))
       (QSETREFV $ 533 (CONS (|dispatchFunction| |EXPR;subst;$LL$;218|) $))
       (COND
        ((|testBitVector| |pv$| 9)
         (QSETREFV $ 471
                   (CONS (|dispatchFunction| |EXPR;convert;$If;219|) $)))))))
    $))) 

(MAKEPROP '|Expression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'SYMBOL 'ALGOP (|Boolean|)
              (|BasicOperator|) |EXPR;belong?;BoB;1| (|Kernel| $)
              (0 . |retract|) (|Union| 6 '"failed") (|Kernel| $$)
              (|KernelFunctions2| 6 $$) (5 . |constantIfCan|)
              (|Union| 12 '#1="failed") (10 . |retractIfCan|)
              (|FunctionSpace&| $$ 6) (15 . |belong?|) (20 . |operator|)
              (|ExpressionSpace&| $$) (25 . |belong?|) (30 . |operator|)
              (35 . |nullary?|) (|Symbol|) (40 . |has?|) (46 . |name|)
              (51 . |kernel|) (56 . |operator|) (|Union| 35 '"failed")
              (61 . |arity|) (66 . |operator|) (|NonNegativeInteger|)
              (71 . |operator|) (77 . |operator|) (|List| 27)
              (|SparseMultivariatePolynomial| 6 27) (82 . |variables|)
              (|SparseMultivariatePolynomial| 6 15) (|List| 15)
              (|SparsePolynomialCoercionHelpers| 6 27 15)
              (87 . |remap_variables|) '|Rep| (94 . |Zero|) (98 . |Zero|)
              (102 . |One|) (106 . |One|) (110 . |One|) (114 . =)
              (120 . |one?|) (125 . |zero?|) (130 . |zero?|) (135 . -)
              (140 . -) (|Integer|) (145 . *) (151 . *) (157 . |coerce|)
              (162 . |coerce|) (167 . *) (173 . *) (179 . +) (185 . +)
              (191 . -) (197 . -) (203 . /) (209 . /) (215 . |ground?|)
              (|Union| 420 '#1#) (220 . |retractIfCan|) (225 . |number?|)
              (|List| 12) (230 . |kernels|) (235 . |is?|) (241 . |first|)
              (|List| $$) (246 . |argument|) (251 . |#|) (256 . |elt|)
              (262 . ^) (268 . ^) (274 . |first|) (279 . |second|)
              (284 . |simplifyPower|) (290 . |Zero|) (294 . |numerator|)
              (299 . |denominator|) (304 . ^) (310 . ^) (|PositiveInteger|)
              (316 . ^) (322 . |smaller?|) (328 . |smaller?|) (334 . =)
              (340 . |numer|) (|SparseMultivariatePolynomial| 6 12)
              (345 . |numer|) (350 . |denom|) (355 . |denom|) 'EREP
              (360 . |One|) (364 . |coerce|) (|Polynomial| 6) (369 . |coerce|)
              (|Fraction| 105) (374 . |numer|) (379 . |denom|) (384 . |coerce|)
              (389 . |reduce|) (|Mapping| 9 15) (394 . |select!|)
              (|AlgebraicManipulations| 6 $$) (400 . |ratDenom|) (406 . |is?|)
              (412 . |cons|) (418 . =) (424 . |sort!|) (429 . ~=) (435 . >)
              (|SparseUnivariatePolynomial| $) (441 . |univariate|)
              (|SparseUnivariatePolynomial| 41) (447 . |leadingCoefficient|)
              (452 . |reductum|) (457 . *) (463 . |monomial|) (470 . -)
              (476 . /) (482 . |getSimplifyDenomsFlag|)
              (486 . |setSimplifyDenomsFlag|) (491 . |elt|)
              (|SingletonAsOrderedSet|) (497 . |create|) (501 . |minPoly|)
              (|SparseUnivariatePolynomial| $$)
              (|PolynomialCategoryQuotientFunctions| 415 15 6 41 $$)
              (506 . |univariate|) (513 . |coerce|) (518 . |eval|)
              (525 . |retract|) (530 . /) (|Mapping| $$ $$) (|Matrix| $$)
              (536 . |map|) (|Matrix| 41) (|Matrix| $) (542 . |reducedSystem|)
              (|Matrix| 6) (547 . |reducedSystem|) (552 . |reducedSystem|)
              (|Vector| $$) (557 . |map|)
              (|Record| (|:| |mat| 147) (|:| |vec| (|Vector| 41))) (|Vector| $)
              (563 . |reducedSystem|)
              (|Record| (|:| |mat| 150) (|:| |vec| (|Vector| 6)))
              (569 . |reducedSystem|) (575 . |reducedSystem|) (581 . |member?|)
              (587 . |concat|) (|AlgebraicFunction| 6 $$) (593 . |rootOf|)
              (599 . |rootOf|) (605 . |rootSum|) (612 . |rootSum|)
              (|ElementaryFunction| 6 $$) (619 . |pi|) (623 . |pi|)
              (627 . |exp|) (632 . |exp|) (637 . |log|) (642 . |log|)
              (647 . |sin|) (652 . |sin|) (657 . |cos|) (662 . |cos|)
              (667 . |tan|) (672 . |tan|) (677 . |cot|) (682 . |cot|)
              (687 . |sec|) (692 . |sec|) (697 . |csc|) (702 . |csc|)
              (707 . |asin|) (712 . |asin|) (717 . |acos|) (722 . |acos|)
              (727 . |atan|) (732 . |atan|) (737 . |acot|) (742 . |acot|)
              (747 . |asec|) (752 . |asec|) (757 . |acsc|) (762 . |acsc|)
              (767 . |sinh|) (772 . |sinh|) (777 . |cosh|) (782 . |cosh|)
              (787 . |tanh|) (792 . |tanh|) (797 . |coth|) (802 . |coth|)
              (807 . |sech|) (812 . |sech|) (817 . |csch|) (822 . |csch|)
              (827 . |asinh|) (832 . |asinh|) (837 . |acosh|) (842 . |acosh|)
              (847 . |atanh|) (852 . |atanh|) (857 . |acoth|) (862 . |acoth|)
              (867 . |asech|) (872 . |asech|) (877 . |acsch|) (882 . |acsch|)
              (|FunctionalSpecialFunction| 6 $$) (887 . |abs|) (892 . |abs|)
              (897 . |Gamma|) (902 . |Gamma|) (907 . |Gamma|) (913 . |Gamma|)
              (919 . |Beta|) (925 . |Beta|) (931 . |digamma|) (936 . |digamma|)
              (941 . |polygamma|) (947 . |polygamma|) (953 . |besselJ|)
              (959 . |besselJ|) (965 . |besselY|) (971 . |besselY|)
              (977 . |besselI|) (983 . |besselI|) (989 . |besselK|)
              (995 . |besselK|) (1001 . |airyAi|) (1006 . |airyAi|)
              (1011 . |airyAiPrime|) (1016 . |airyAiPrime|) (1021 . |airyBi|)
              (1026 . |airyBi|) (1031 . |airyBiPrime|) (1036 . |airyBiPrime|)
              (1041 . |lambertW|) (1046 . |lambertW|) (1051 . |polylog|)
              (1057 . |polylog|) (1063 . |weierstrassP|)
              (1070 . |weierstrassP|) (1077 . |weierstrassPPrime|)
              (1084 . |weierstrassPPrime|) (1091 . |weierstrassSigma|)
              (1098 . |weierstrassSigma|) (1105 . |weierstrassZeta|)
              (1112 . |weierstrassZeta|) (1119 . |whittakerM|)
              (1126 . |whittakerM|) (1133 . |whittakerW|) (1140 . |whittakerW|)
              (1147 . |angerJ|) (1153 . |angerJ|) (1159 . |weberE|)
              (1165 . |weberE|) (1171 . |struveH|) (1177 . |struveH|)
              (1183 . |struveL|) (1189 . |struveL|) (1195 . |hankelH1|)
              (1201 . |hankelH1|) (1207 . |hankelH2|) (1213 . |hankelH2|)
              (1219 . |lommelS1|) (1226 . |lommelS1|) (1233 . |lommelS2|)
              (1240 . |lommelS2|) (1247 . |kummerM|) (1254 . |kummerM|)
              (1261 . |kummerU|) (1268 . |kummerU|) (1275 . |legendreP|)
              (1282 . |legendreP|) (1289 . |legendreQ|) (1296 . |legendreQ|)
              (1303 . |kelvinBei|) (1309 . |kelvinBei|) (1315 . |kelvinBer|)
              (1321 . |kelvinBer|) (1327 . |kelvinKei|) (1333 . |kelvinKei|)
              (1339 . |kelvinKer|) (1345 . |kelvinKer|) (1351 . |ellipticK|)
              (1356 . |ellipticK|) (1361 . |ellipticE|) (1366 . |ellipticE|)
              (1371 . |ellipticE|) (1377 . |ellipticE|) (1383 . |ellipticF|)
              (1389 . |ellipticF|) (1395 . |ellipticPi|) (1402 . |ellipticPi|)
              (1409 . |jacobiSn|) (1415 . |jacobiSn|) (1421 . |jacobiCn|)
              (1427 . |jacobiCn|) (1433 . |jacobiDn|) (1439 . |jacobiDn|)
              (1445 . |jacobiZeta|) (1451 . |jacobiZeta|)
              (1457 . |jacobiTheta|) (1463 . |jacobiTheta|) (1469 . |lerchPhi|)
              (1476 . |lerchPhi|) (1483 . |riemannZeta|) (1488 . |riemannZeta|)
              (1493 . |hypergeometricF|) (|List| $) (1500 . |hypergeometricF|)
              (1507 . |meijerG|) (1516 . |meijerG|)
              (|CombinatorialFunction| 6 $$) (1525 . ^) (1531 . |factorial|)
              (1536 . |factorial|) (1541 . |binomial|) (1547 . |binomial|)
              (1553 . |permutation|) (1559 . |permutation|)
              (1565 . |factorials|) (1570 . |factorials|) (1575 . |factorials|)
              (1581 . |factorials|) (1587 . |summation|) (1593 . |summation|)
              (|SegmentBinding| $$) (1599 . |summation|) (|SegmentBinding| $)
              (1605 . |summation|) (1611 . |product|) (1617 . |product|)
              (1623 . |product|) (1629 . |product|)
              (|LiouvillianFunction| 6 $$) (1635 . |erf|) (1640 . |erf|)
              (1645 . |erfi|) (1650 . |erfi|) (1655 . |Ei|) (1660 . |Ei|)
              (1665 . |Si|) (1670 . |Si|) (1675 . |Ci|) (1680 . |Ci|)
              (1685 . |Shi|) (1690 . |Shi|) (1695 . |Chi|) (1700 . |Chi|)
              (1705 . |li|) (1710 . |li|) (1715 . |dilog|) (1720 . |dilog|)
              (1725 . |fresnelS|) (1730 . |fresnelS|) (1735 . |fresnelC|)
              (1740 . |fresnelC|) (1745 . |integral|) (1751 . |integral|)
              (1757 . |integral|) (1763 . |integral|) (1769 . |belong?|)
              (1774 . |operator|) (1779 . |belong?|) (1784 . |operator|)
              (1789 . |belong?|) (1794 . |operator|) (1799 . |belong?|)
              (1804 . |operator|) (1809 . |belong?|) (1814 . |operator|)
              (|Fraction| 41) (1819 . |coerce|) (|Fraction| 393)
              (|PolynomialCategoryQuotientFunctions| 415 15 6 41 388)
              (1824 . |univariate|) (|SparseUnivariatePolynomial| 388)
              (1830 . |numer|) (1835 . |degree|) (1841 . |degree|)
              (1846 . |rem|) (1852 . |coerce|) (1857 . |elt|) (1863 . |Zero|)
              (1867 . ~=) (1873 . |leadingCoefficient|) (1878 . |reductum|)
              (1883 . |gcdPolynomial|) (|GcdDomain&| $$)
              (1889 . |gcdPolynomial|) (1895 . |gcdPolynomial|)
              (|Factored| 393) (|SupFractionFactorizer| 415 15 6 41)
              (1901 . |factor|) (|Factored| 122) (1906 . |factorPolynomial|)
              (1911 . |squareFree|) (1916 . |squareFreePolynomial|)
              (|IndexedExponents| 15) (1921 . |Zero|) (1925 . |monomial|)
              (|AlgebraicNumber|) (1931 . |coerce|) (|Fraction| 57) (1936 . ^)
              (1942 . ^) (1948 . |minPoly|) (1953 . |definingPolynomial|)
              (1958 . |definingPolynomial|) (1963 . |retract|)
              (1968 . |retract|) (1973 . |retractIfCan|)
              (|SparseMultivariatePolynomial| 57 12) (1978 . |numer|)
              (1983 . |denom|) (|Mapping| $$ 418) (|Kernel| 418)
              (|ExpressionSpaceFunctions2| 418 $$) (1988 . |map|)
              (|Mapping| $$ 433) (|Mapping| $$ 57)
              (|SparseMultivariatePolynomial| 57 433)
              (|PolynomialCategoryLifting| (|IndexedExponents| 433) 433 57 438
                                           $$)
              (1994 . |map|) (2001 . /) (|Union| 418 '"failed")
              (2007 . |retractIfCan|) (2012 . |coerce|) (2017 . |coerce|)
              (2022 . |belong?|) (2027 . |is?|) (|Union| 27 '#1#)
              (2033 . |retractIfCan|) (2038 . ~=)
              (|SparseUnivariatePolynomial| 418) (2044 . |Zero|)
              (2048 . |Zero|) (2052 . ~=) (2058 . |degree|) (2063 . |monomial|)
              (2069 . +) (2075 . |rootOf|) (2081 . |operator|) (2086 . |elt|)
              (|Union| 15 '"failed") (2092 . |mainVariable|)
              (2097 . |leadingCoefficient|) (2102 . |Zero|) (2106 . |ground?|)
              (2111 . ^) (2117 . *) (2123 . +) (|InputForm|) (2129 . |convert|)
              (2134 . |convert|) (|List| 10) (2139 . |eval|) (2147 . |eval|)
              (2155 . |variables|) (2160 . |concat|)
              (2165 . |removeDuplicates|) (2170 . |scripted?|) (|Mapping| 9 27)
              (2175 . |select|) (|MakeUnaryCompiledFunction| $$ $$ $$)
              (2181 . |compiledFunction|) (|Mapping| $ $) (|List| 483)
              (2187 . |eval|) (2194 . |new|) (2198 . |coerce|) (|Equation| $$)
              (2203 . =) (|List| 569) (2209 . |subst|)
              (|PatternMatchResult| 57 $$) (|Pattern| 57)
              (|PatternMatchFunctionSpace| 57 6 $$) (2215 . |patternMatch|)
              (|PatternMatchResult| 57 $) (2222 . |patternMatch|)
              (|PatternMatchResult| (|Float|) $$) (|Pattern| (|Float|))
              (|PatternMatchFunctionSpace| (|Float|) 6 $$)
              (2229 . |patternMatch|) (|PatternMatchResult| (|Float|) $)
              (2236 . |patternMatch|) (2243 . |reducedSystem|)
              (2248 . |reducedSystem|) (|PatternMatchKernel| 57 $$)
              (2254 . |patternMatch|) (|PatternMatchResult| 57 45)
              (|Mapping| 508 15 493 508)
              (|PatternMatchPolynomialCategory| 57 415 15 6 45)
              (2261 . |patternMatch|) (|PatternMatchKernel| (|Float|) $$)
              (2269 . |patternMatch|) (|PatternMatchResult| (|Float|) 45)
              (|Mapping| 514 15 499 514)
              (|PatternMatchPolynomialCategory| (|Float|) 415 15 6 45)
              (2276 . |patternMatch|) (2284 . |coerce|)
              (|Record| (|:| |gen| 15) (|:| |exp| 57)) (|List| 519)
              (2289 . |terms|) (2294 . |zero?|) (2299 . |constantKernel|)
              (2304 . |retract|) (|OutputForm|) (2309 . |coerce|)
              (2314 . |coerce|) (2319 . |eval|) (2326 . |map|)
              (|Mapping| $$ 15) (|ListToMap| 15 $$) (2332 . |match|)
              (2340 . |subst|) (2347 . |kernel|) (2353 . *)
              (|Union| 325 '#2="failed") (2359 . |isPlus|) (2364 . |first|)
              (|Record| (|:| |coef| 57) (|:| |var| 12)) (|Union| 539 '#2#)
              (2369 . |isMult|) (2374 . |retractIfCan|) (|Matrix| 57)
              (|Record| (|:| |mat| 543) (|:| |vec| (|Vector| 57)))
              (|Union| $ '"failed") (|Factored| $) (|Polynomial| 548)
              (|Fraction| 6) (|Fraction| 547) (|Fraction| 122)
              (|Union| 107 '#1#) (|Polynomial| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |coef| 325) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 558 '"failed") (|Union| 57 '#1#)
              (|Record| (|:| |var| 12) (|:| |exponent| 57)) (|Union| 561 '#2#)
              (|Record| (|:| |val| $) (|:| |exponent| 57)) (|Union| 563 '#2#)
              (|List| 35) (|Mapping| $ 325) (|List| 566) (|Union| 105 '#1#)
              (|Equation| $) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 2379 |zerosOf| 2385 |zeroOf| 2412 |zero?| 2439 |whittakerW|
              2444 |whittakerM| 2451 |weierstrassZeta| 2458 |weierstrassSigma|
              2465 |weierstrassPPrime| 2472 |weierstrassP| 2479 |weberE| 2486
              |variables| 2492 |univariate| 2497 |unitNormal| 2503
              |unitCanonical| 2508 |unit?| 2513 |tower| 2518 |tanh| 2528 |tan|
              2533 |summation| 2538 |subtractIfCan| 2550 |subst| 2556 |struveL|
              2575 |struveH| 2581 |squareFreePolynomial| 2587 |squareFreePart|
              2592 |squareFree| 2597 |sqrt| 2602 |smaller?| 2607 |sizeLess?|
              2613 |sinh| 2619 |sin| 2624 |simplifyPower| 2629
              |setSimplifyDenomsFlag| 2635 |sech| 2640 |sec| 2645 |sample| 2650
              |rootsOf| 2654 |rootSum| 2681 |rootOf| 2688 |riemannZeta| 2715
              |retractIfCan| 2720 |retract| 2760 |rem| 2800 |reducedSystem|
              2806 |reduce| 2828 |recip| 2833 |quo| 2838 |product| 2844
              |principalIdeal| 2856 |prime?| 2861 |polylog| 2866 |polygamma|
              2872 |pi| 2878 |permutation| 2882 |patternMatch| 2888 |paren|
              2902 |opposite?| 2912 |operators| 2918 |operator| 2923 |one?|
              2928 |odd?| 2933 |numerator| 2938 |numer| 2943 |number?| 2948
              |nthRoot| 2953 |multiEuclidean| 2959 |minPoly| 2965 |meijerG|
              2970 |map| 2979 |mainKernel| 2985 |lommelS2| 2990 |lommelS1| 2997
              |log| 3004 |li| 3009 |lerchPhi| 3014 |legendreQ| 3021 |legendreP|
              3028 |lcmCoef| 3035 |lcm| 3041 |latex| 3052 |lambertW| 3057
              |kummerU| 3062 |kummerM| 3069 |kernels| 3076 |kernel| 3086
              |kelvinKer| 3098 |kelvinKei| 3104 |kelvinBer| 3110 |kelvinBei|
              3116 |jacobiZeta| 3122 |jacobiTheta| 3128 |jacobiSn| 3134
              |jacobiDn| 3140 |jacobiCn| 3146 |isTimes| 3152 |isPower| 3157
              |isPlus| 3162 |isMult| 3167 |isExpt| 3172 |is?| 3189 |inv| 3201
              |integral| 3206 |hypergeometricF| 3218 |height| 3225
              |hashUpdate!| 3230 |hash| 3236 |hankelH2| 3241 |hankelH1| 3247
              |ground?| 3253 |ground| 3258 |getSimplifyDenomsFlag| 3263
              |gcdPolynomial| 3267 |gcd| 3273 |fresnelS| 3284 |fresnelC| 3289
              |freeOf?| 3294 |factorials| 3306 |factorial| 3317
              |factorPolynomial| 3322 |factor| 3327 |extendedEuclidean| 3332
              |exquo| 3345 |expressIdealMember| 3351 |exp| 3357 |even?| 3362
              |eval| 3367 |euclideanSize| 3528 |erfi| 3533 |erf| 3538 |elt|
              3543 |ellipticPi| 3639 |ellipticK| 3646 |ellipticF| 3651
              |ellipticE| 3657 |divide| 3668 |distribute| 3674 |dilog| 3685
              |digamma| 3690 |differentiate| 3695 |denominator| 3721 |denom|
              3726 |definingPolynomial| 3731 |csch| 3736 |csc| 3741 |coth| 3746
              |cot| 3751 |cosh| 3756 |cos| 3761 |convert| 3766 |conjugate| 3786
              |commutator| 3792 |coerce| 3798 |charthRoot| 3868
              |characteristic| 3873 |box| 3877 |binomial| 3887 |besselY| 3893
              |besselK| 3899 |besselJ| 3905 |besselI| 3911 |belong?| 3917
              |atanh| 3922 |atan| 3927 |associates?| 3932 |asinh| 3938 |asin|
              3943 |asech| 3948 |asec| 3953 |applyQuote| 3958 |annihilate?|
              3994 |angerJ| 4000 |airyBiPrime| 4006 |airyBi| 4011 |airyAiPrime|
              4016 |airyAi| 4021 |acsch| 4026 |acsc| 4031 |acoth| 4036 |acot|
              4041 |acosh| 4046 |acos| 4051 |abs| 4056 ^ 4061 |Zero| 4091 |Si|
              4095 |Shi| 4100 |One| 4105 |Gamma| 4109 |Ei| 4120 D 4125 |Ci|
              4151 |Chi| 4156 |Beta| 4161 = 4167 / 4173 - 4185 + 4196 * 4202)
           'NIL
           (CONS
            (|makeByteWordVec2| 28
                                '(1 0 1 1 1 1 1 1 1 1 1 1 1 2 5 1 1 1 2 3 4 5 7
                                  1 5 1 1 2 18 1 1 1 6 2 2 18 20 8 5 20 0 0 5
                                  28 26 0 12 13 1 28 26 0 0 0 0 1 1 0 0 0 0 0 0
                                  0 0 16 1 1 1 1 1 5 9 10 11 14 15 1 1 1 1 1 1
                                  1 1 17 1))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |FunctionSpace&|
                |AlgebraicallyClosedField&| |Field&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| |DivisionRing&|
                NIL |Algebra&| NIL |Algebra&| |Algebra&|
                |FullyLinearlyExplicitRingOver&| |Module&| |EntireRing&|
                |Module&| |Module&| NIL NIL NIL NIL NIL
                |PartialDifferentialRing&| NIL NIL NIL |Ring&| NIL NIL NIL NIL
                NIL NIL |Rng&| |AbelianGroup&| |Group&| NIL NIL
                |ExpressionSpace&| NIL NIL |Monoid&| |AbelianMonoid&| NIL NIL
                NIL NIL |SemiGroup&| |AbelianSemiGroup&| |SetCategory&|
                |FullyRetractableTo&| NIL |Evalable&|
                |TranscendentalFunctionCategory&| NIL |BasicType&|
                |RetractableTo&| NIL |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |RetractableTo&|
                |RetractableTo&| NIL NIL NIL NIL |RetractableTo&| NIL NIL NIL
                |RetractableTo&| |RetractableTo&| NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL |RadicalCategory&|)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 6) (|FunctionSpace| 6)
                 (|AlgebraicallyClosedField|) (|Field|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|Algebra| $$) (|LeftOreRing|) (|Algebra| 420) (|Algebra| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Module| $$)
                 (|EntireRing|) (|Module| 420) (|Module| 6)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 6) (|LinearlyExplicitRingOver| 57)
                 (|CommutativeRing|) (|PartialDifferentialRing| 27)
                 (|BiModule| $$ $$) (|BiModule| 420 420) (|BiModule| 6 6)
                 (|Ring|) (|RightModule| $$) (|LeftModule| 420)
                 (|RightModule| 420) (|LeftModule| $$) (|LeftModule| 6)
                 (|RightModule| 6) (|Rng|) (|AbelianGroup|) (|Group|)
                 (|SemiRing|) (|CancellationAbelianMonoid|) (|ExpressionSpace|)
                 (|FullyPatternMatchable| 6) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|Comparable|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 57)
                 (|LiouvillianFunctionCategory|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|FullyRetractableTo| 6)
                 (|Patternable| 6) (|Evalable| $$)
                 (|TranscendentalFunctionCategory|)
                 (|CombinatorialOpsCategory|) (|BasicType|) (|RetractableTo| 6)
                 (|Type|) (|RetractableTo| 27) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| 15 $$) (|RetractableTo| 15)
                 (|CoercibleTo| 525) (|RetractableTo| 420)
                 (|RetractableTo| (|Fraction| (|Polynomial| 6)))
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|RetractableTo| (|Polynomial| 6))
                 (|ConvertibleTo| 469) (|ConvertibleTo| 499)
                 (|ConvertibleTo| 493) (|RetractableTo| 57)
                 (|RetractableTo| 418) (|SpecialFunctionCategory|)
                 (|PrimitiveFunctionCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|CombinatorialFunctionCategory|) (|unitsKnown|)
                 (|RadicalCategory|))
              (|makeByteWordVec2| 572
                                  '(1 0 12 0 13 1 16 14 15 17 1 0 18 0 19 1 20
                                    9 10 21 1 20 10 10 22 1 23 9 10 24 1 23 10
                                    10 25 1 10 9 0 26 2 10 9 0 27 28 1 10 27 0
                                    29 1 15 0 27 30 1 15 10 0 31 1 10 32 0 33 1
                                    10 0 27 34 2 10 0 27 35 36 1 0 10 10 37 1
                                    39 38 0 40 3 43 41 39 38 42 44 0 45 0 46 0
                                    0 0 47 0 45 0 48 0 0 0 49 0 6 0 50 2 45 9 0
                                    0 51 1 0 9 0 52 1 45 9 0 53 1 0 9 0 54 1 45
                                    0 0 55 1 0 0 0 56 2 45 0 57 0 58 2 0 0 57 0
                                    59 1 45 0 57 60 1 0 0 57 61 2 45 0 0 0 62 2
                                    0 0 0 0 63 2 45 0 0 0 64 2 0 0 0 0 65 2 45
                                    0 0 0 66 2 0 0 0 0 67 2 45 0 0 0 68 2 0 0 0
                                    0 69 1 0 9 0 70 1 0 71 0 72 1 0 9 0 73 1 0
                                    74 0 75 2 0 9 0 27 76 1 42 15 0 77 1 15 78
                                    0 79 1 78 35 0 80 2 78 2 0 57 81 2 45 0 0
                                    57 82 2 0 0 0 0 83 1 78 2 0 84 1 78 2 0 85
                                    2 0 0 0 57 86 0 6 0 87 1 0 0 0 88 1 0 0 0
                                    89 2 0 0 0 35 90 2 0 0 0 57 91 2 0 0 0 92
                                    93 2 45 9 0 0 94 2 0 9 0 0 95 2 0 9 0 0 96
                                    1 45 41 0 97 1 0 98 0 99 1 45 41 0 100 1 0
                                    98 0 101 0 41 0 103 1 0 0 98 104 1 0 0 105
                                    106 1 107 105 0 108 1 107 105 0 109 1 0 0
                                    107 110 1 0 0 0 111 2 42 0 112 0 113 2 114
                                    2 2 42 115 2 15 9 0 27 116 2 42 0 15 0 117
                                    2 15 9 0 0 118 1 42 0 0 119 2 0 9 0 0 120 2
                                    35 9 0 0 121 2 41 122 0 15 123 1 124 41 0
                                    125 1 124 0 0 126 2 41 0 0 0 127 3 41 0 0
                                    15 35 128 2 41 0 0 0 129 2 45 0 41 41 130 0
                                    0 9 131 1 0 9 9 132 2 42 15 0 57 133 0 134
                                    0 135 1 0 122 12 136 3 138 137 2 15 137 139
                                    1 0 0 12 140 3 137 0 0 134 2 141 1 137 2 0
                                    142 2 0 0 98 98 143 2 145 0 144 0 146 1 45
                                    147 148 149 1 41 150 148 151 1 0 150 148
                                    152 2 153 0 144 0 154 2 45 155 148 156 157
                                    2 41 158 148 156 159 2 0 158 148 156 160 2
                                    42 9 15 0 161 2 42 0 15 0 162 2 163 2 137
                                    27 164 2 0 0 122 27 165 3 163 2 2 137 27
                                    166 3 0 0 0 122 27 167 0 168 2 169 0 0 0
                                    170 1 168 2 2 171 1 0 0 0 172 1 168 2 2 173
                                    1 0 0 0 174 1 168 2 2 175 1 0 0 0 176 1 168
                                    2 2 177 1 0 0 0 178 1 168 2 2 179 1 0 0 0
                                    180 1 168 2 2 181 1 0 0 0 182 1 168 2 2 183
                                    1 0 0 0 184 1 168 2 2 185 1 0 0 0 186 1 168
                                    2 2 187 1 0 0 0 188 1 168 2 2 189 1 0 0 0
                                    190 1 168 2 2 191 1 0 0 0 192 1 168 2 2 193
                                    1 0 0 0 194 1 168 2 2 195 1 0 0 0 196 1 168
                                    2 2 197 1 0 0 0 198 1 168 2 2 199 1 0 0 0
                                    200 1 168 2 2 201 1 0 0 0 202 1 168 2 2 203
                                    1 0 0 0 204 1 168 2 2 205 1 0 0 0 206 1 168
                                    2 2 207 1 0 0 0 208 1 168 2 2 209 1 0 0 0
                                    210 1 168 2 2 211 1 0 0 0 212 1 168 2 2 213
                                    1 0 0 0 214 1 168 2 2 215 1 0 0 0 216 1 168
                                    2 2 217 1 0 0 0 218 1 168 2 2 219 1 0 0 0
                                    220 1 168 2 2 221 1 0 0 0 222 1 223 2 2 224
                                    1 0 0 0 225 1 223 2 2 226 1 0 0 0 227 2 223
                                    2 2 2 228 2 0 0 0 0 229 2 223 2 2 2 230 2 0
                                    0 0 0 231 1 223 2 2 232 1 0 0 0 233 2 223 2
                                    2 2 234 2 0 0 0 0 235 2 223 2 2 2 236 2 0 0
                                    0 0 237 2 223 2 2 2 238 2 0 0 0 0 239 2 223
                                    2 2 2 240 2 0 0 0 0 241 2 223 2 2 2 242 2 0
                                    0 0 0 243 1 223 2 2 244 1 0 0 0 245 1 223 2
                                    2 246 1 0 0 0 247 1 223 2 2 248 1 0 0 0 249
                                    1 223 2 2 250 1 0 0 0 251 1 223 2 2 252 1 0
                                    0 0 253 2 223 2 2 2 254 2 0 0 0 0 255 3 223
                                    2 2 2 2 256 3 0 0 0 0 0 257 3 223 2 2 2 2
                                    258 3 0 0 0 0 0 259 3 223 2 2 2 2 260 3 0 0
                                    0 0 0 261 3 223 2 2 2 2 262 3 0 0 0 0 0 263
                                    3 223 2 2 2 2 264 3 0 0 0 0 0 265 3 223 2 2
                                    2 2 266 3 0 0 0 0 0 267 2 223 2 2 2 268 2 0
                                    0 0 0 269 2 223 2 2 2 270 2 0 0 0 0 271 2
                                    223 2 2 2 272 2 0 0 0 0 273 2 223 2 2 2 274
                                    2 0 0 0 0 275 2 223 2 2 2 276 2 0 0 0 0 277
                                    2 223 2 2 2 278 2 0 0 0 0 279 3 223 2 2 2 2
                                    280 3 0 0 0 0 0 281 3 223 2 2 2 2 282 3 0 0
                                    0 0 0 283 3 223 2 2 2 2 284 3 0 0 0 0 0 285
                                    3 223 2 2 2 2 286 3 0 0 0 0 0 287 3 223 2 2
                                    2 2 288 3 0 0 0 0 0 289 3 223 2 2 2 2 290 3
                                    0 0 0 0 0 291 2 223 2 2 2 292 2 0 0 0 0 293
                                    2 223 2 2 2 294 2 0 0 0 0 295 2 223 2 2 2
                                    296 2 0 0 0 0 297 2 223 2 2 2 298 2 0 0 0 0
                                    299 1 223 2 2 300 1 0 0 0 301 1 223 2 2 302
                                    1 0 0 0 303 2 223 2 2 2 304 2 0 0 0 0 305 2
                                    223 2 2 2 306 2 0 0 0 0 307 3 223 2 2 2 2
                                    308 3 0 0 0 0 0 309 2 223 2 2 2 310 2 0 0 0
                                    0 311 2 223 2 2 2 312 2 0 0 0 0 313 2 223 2
                                    2 2 314 2 0 0 0 0 315 2 223 2 2 2 316 2 0 0
                                    0 0 317 2 223 2 2 2 318 2 0 0 0 0 319 3 223
                                    2 2 2 2 320 3 0 0 0 0 0 321 1 223 2 2 322 1
                                    0 0 0 323 3 223 2 78 78 2 324 3 0 0 325 325
                                    0 326 5 223 2 78 78 78 78 2 327 5 0 0 325
                                    325 325 325 0 328 2 329 2 2 2 330 1 329 2 2
                                    331 1 0 0 0 332 2 329 2 2 2 333 2 0 0 0 0
                                    334 2 329 2 2 2 335 2 0 0 0 0 336 1 329 2 2
                                    337 1 0 0 0 338 2 329 2 2 27 339 2 0 0 0 27
                                    340 2 329 2 2 27 341 2 0 0 0 27 342 2 329 2
                                    2 343 344 2 0 0 0 345 346 2 329 2 2 27 347
                                    2 0 0 0 27 348 2 329 2 2 343 349 2 0 0 0
                                    345 350 1 351 2 2 352 1 0 0 0 353 1 351 2 2
                                    354 1 0 0 0 355 1 351 2 2 356 1 0 0 0 357 1
                                    351 2 2 358 1 0 0 0 359 1 351 2 2 360 1 0 0
                                    0 361 1 351 2 2 362 1 0 0 0 363 1 351 2 2
                                    364 1 0 0 0 365 1 351 2 2 366 1 0 0 0 367 1
                                    351 2 2 368 1 0 0 0 369 1 351 2 2 370 1 0 0
                                    0 371 1 351 2 2 372 1 0 0 0 373 2 351 2 2
                                    27 374 2 0 0 0 27 375 2 351 2 2 343 376 2 0
                                    0 0 345 377 1 163 9 10 378 1 163 10 10 379
                                    1 168 9 10 380 1 168 10 10 381 1 329 9 10
                                    382 1 329 10 10 383 1 351 9 10 384 1 351 10
                                    10 385 1 223 9 10 386 1 223 10 10 387 1 388
                                    0 41 389 2 391 390 388 15 392 1 390 393 0
                                    394 2 41 35 0 15 395 1 137 35 0 396 2 137 0
                                    0 0 397 1 41 0 15 398 2 393 388 0 388 399 0
                                    137 0 400 2 137 9 0 0 401 1 137 2 0 402 1
                                    137 0 0 403 2 45 122 122 122 404 2 405 122
                                    122 122 406 2 0 122 122 122 407 1 409 408
                                    393 410 1 0 411 122 412 1 409 408 393 413 1
                                    0 411 122 414 0 415 0 416 2 41 0 6 415 417
                                    1 0 0 418 419 2 163 2 2 420 421 2 0 0 0 420
                                    422 1 163 137 15 423 1 163 2 2 424 1 0 0 0
                                    425 1 45 420 0 426 1 0 420 0 427 1 45 71 0
                                    428 1 418 429 0 430 1 418 429 0 431 2 434 2
                                    432 433 435 3 439 2 436 437 438 440 2 418 0
                                    0 0 441 1 0 442 0 443 1 0 0 6 444 1 418 0
                                    420 445 1 418 9 10 446 2 10 9 0 27 447 1 0
                                    448 0 449 2 41 9 0 0 450 0 451 0 452 0 124
                                    0 453 2 124 9 0 0 454 1 124 35 0 455 2 451
                                    0 418 35 456 2 451 0 0 0 457 2 418 0 122 27
                                    458 1 418 10 10 459 2 418 0 10 325 460 1 41
                                    461 0 462 1 41 6 0 463 0 418 0 464 1 124 9
                                    0 465 2 418 0 0 35 466 2 418 0 0 0 467 2
                                    418 0 0 0 468 1 45 469 0 470 1 0 469 0 471
                                    4 0 0 0 472 325 27 473 4 0 0 0 10 0 27 474
                                    1 0 38 0 475 1 38 0 325 476 1 38 0 0 477 1
                                    27 9 0 478 2 38 0 479 0 480 2 481 144 2 27
                                    482 3 0 0 0 472 484 485 0 27 0 486 1 0 0 27
                                    487 2 488 0 2 2 489 2 0 0 0 490 491 3 494
                                    492 2 493 492 495 3 0 496 0 493 496 497 3
                                    500 498 2 499 498 501 3 0 502 0 499 502 503
                                    1 45 150 148 504 2 45 158 148 156 505 3 506
                                    492 15 493 492 507 4 510 508 45 493 508 509
                                    511 3 512 498 15 499 498 513 4 516 514 45
                                    499 514 515 517 1 45 0 15 518 1 45 520 0
                                    521 1 6 9 0 522 1 16 15 6 523 1 0 6 0 524 1
                                    45 525 0 526 1 0 525 0 527 3 0 0 0 74 325
                                    528 2 0 0 483 12 529 4 531 2 42 78 15 530
                                    532 3 0 0 0 74 325 533 2 0 0 10 325 534 2
                                    45 0 57 15 535 1 0 536 0 537 1 520 519 0
                                    538 1 0 540 0 541 1 0 14 0 542 2 0 9 0 0
                                    120 2 1 325 0 27 1 1 1 325 0 1 2 1 325 122
                                    27 1 1 1 325 552 1 1 1 325 122 1 2 1 0 0 27
                                    1 1 1 0 0 1 1 1 0 122 1 2 1 0 122 27 1 1 1
                                    0 552 1 1 25 9 0 54 3 1 0 0 0 0 267 3 1 0 0
                                    0 0 265 3 1 0 0 0 0 263 3 1 0 0 0 0 261 3 1
                                    0 0 0 0 259 3 1 0 0 0 0 257 2 1 0 0 0 271 1
                                    0 38 0 475 2 1 550 0 12 1 1 1 553 0 1 1 1 0
                                    0 1 1 1 9 0 1 1 0 74 0 1 1 0 74 325 1 1 1 0
                                    0 204 1 1 0 0 180 2 1 0 0 345 346 2 1 0 0
                                    27 342 2 19 545 0 0 1 3 0 0 0 74 325 533 2
                                    0 0 0 569 1 2 0 0 0 490 491 2 1 0 0 0 275 2
                                    1 0 0 0 273 1 30 411 122 414 1 1 0 0 1 1 1
                                    546 0 1 1 1 0 0 1 2 0 9 0 0 95 2 1 9 0 0 1
                                    1 1 0 0 200 1 1 0 0 176 2 1 0 0 57 86 1 1 9
                                    9 132 1 1 0 0 208 1 1 0 0 184 0 29 0 1 2 1
                                    325 0 27 1 1 1 325 0 1 1 1 325 122 1 2 1
                                    325 122 27 1 1 1 325 552 1 3 1 0 0 122 27
                                    167 2 1 0 0 27 1 1 1 0 0 1 2 1 0 122 27 165
                                    1 1 0 122 1 1 1 0 552 1 1 1 0 0 323 1 15
                                    442 0 443 1 16 71 0 72 1 1 551 0 1 1 14 560
                                    0 1 1 5 568 0 1 1 0 14 0 542 1 0 448 0 449
                                    1 0 18 0 19 1 15 418 0 1 1 16 420 0 427 1 1
                                    107 0 1 1 14 57 0 1 1 5 105 0 1 1 0 6 0 524
                                    1 0 27 0 1 1 0 12 0 13 2 1 0 0 0 1 1 24 543
                                    148 1 2 24 544 148 156 1 2 5 158 148 156
                                    160 1 5 150 148 152 1 1 0 0 111 1 27 545 0
                                    1 2 1 0 0 0 1 2 1 0 0 345 350 2 1 0 0 27
                                    348 1 1 555 325 1 1 1 9 0 1 2 1 0 0 0 255 2
                                    1 0 0 0 235 0 1 0 170 2 1 0 0 0 336 3 12
                                    502 0 499 502 503 3 13 496 0 493 496 497 1
                                    0 0 0 1 1 0 0 325 1 2 25 9 0 0 1 1 0 472 0
                                    1 1 0 10 10 37 1 27 9 0 52 1 31 9 0 1 1 5 0
                                    0 88 1 5 98 0 99 1 1 9 0 73 2 1 0 0 57 1 2
                                    1 536 325 0 1 1 32 122 12 136 5 33 0 325
                                    325 325 325 0 328 2 0 0 483 12 529 1 0 18 0
                                    1 3 1 0 0 0 0 283 3 1 0 0 0 0 281 1 1 0 0
                                    174 1 1 0 0 367 3 1 0 0 0 0 321 3 1 0 0 0 0
                                    291 3 1 0 0 0 0 289 2 1 554 0 0 1 1 1 0 325
                                    1 2 1 0 0 0 1 1 0 570 0 1 1 1 0 0 253 3 1 0
                                    0 0 0 287 3 1 0 0 0 0 285 1 0 74 325 1 1 0
                                    74 0 75 2 0 0 10 0 1 2 0 0 10 325 534 2 1 0
                                    0 0 299 2 1 0 0 0 297 2 1 0 0 0 295 2 1 0 0
                                    0 293 2 1 0 0 0 317 2 1 0 0 0 319 2 1 0 0 0
                                    311 2 1 0 0 0 315 2 1 0 0 0 313 1 27 536 0
                                    1 1 5 564 0 1 1 25 536 0 537 1 25 540 0 541
                                    2 5 562 0 10 1 2 5 562 0 27 1 1 27 562 0 1
                                    2 0 9 0 10 1 2 0 9 0 27 76 1 23 0 0 1 2 1 0
                                    0 345 377 2 1 0 0 27 375 3 33 0 325 325 0
                                    326 1 0 35 0 1 2 0 572 572 0 1 1 0 571 0 1
                                    2 1 0 0 0 279 2 1 0 0 0 277 1 0 9 0 70 1 0
                                    6 0 1 0 1 9 131 2 1 122 122 122 407 1 1 0
                                    325 1 2 1 0 0 0 1 1 1 0 0 371 1 1 0 0 373 2
                                    0 9 0 0 1 2 0 9 0 27 1 2 1 0 0 27 340 1 1 0
                                    0 338 1 1 0 0 332 1 30 411 122 412 1 1 546
                                    0 1 2 1 557 0 0 1 3 1 559 0 0 0 1 2 1 545 0
                                    0 1 2 1 536 325 0 1 1 1 0 0 172 1 31 9 0 1
                                    2 9 0 0 38 1 2 9 0 0 27 1 1 9 0 0 1 4 9 0 0
                                    472 325 27 473 4 9 0 0 10 0 27 474 4 5 0 0
                                    38 565 567 1 4 5 0 0 38 565 484 1 4 5 0 0
                                    27 35 566 1 4 5 0 0 27 35 483 1 3 0 0 0 10
                                    483 1 3 0 0 0 472 567 1 3 0 0 0 10 566 1 3
                                    0 0 0 27 483 1 3 0 0 0 472 484 485 3 0 0 0
                                    27 566 1 3 0 0 0 38 484 1 3 0 0 0 38 567 1
                                    3 0 0 0 0 0 1 3 0 0 0 325 325 1 2 0 0 0 569
                                    1 3 0 0 0 74 325 528 2 0 0 0 490 1 3 0 0 0
                                    12 0 1 1 1 35 0 1 1 1 0 0 355 1 1 0 0 353
                                    10 0 0 10 0 0 0 0 0 0 0 0 0 1 2 0 0 10 325
                                    1 9 0 0 10 0 0 0 0 0 0 0 0 1 7 0 0 10 0 0 0
                                    0 0 0 1 8 0 0 10 0 0 0 0 0 0 0 1 5 0 0 10 0
                                    0 0 0 1 6 0 0 10 0 0 0 0 0 1 4 0 0 10 0 0 0
                                    1 2 0 0 10 0 1 3 0 0 10 0 0 1 3 1 0 0 0 0
                                    309 1 1 0 0 301 2 1 0 0 0 307 1 1 0 0 303 2
                                    1 0 0 0 305 2 1 556 0 0 1 2 0 0 0 0 1 1 0 0
                                    0 1 1 1 0 0 369 1 1 0 0 233 3 5 0 0 38 565
                                    1 2 5 0 0 38 1 3 5 0 0 27 35 1 2 5 0 0 27 1
                                    1 1 0 0 89 1 1 98 0 101 1 32 0 0 425 1 1 0
                                    0 210 1 1 0 0 186 1 1 0 0 206 1 1 0 0 182 1
                                    1 0 0 202 1 1 0 0 178 1 9 469 0 471 1 10
                                    499 0 1 1 11 493 0 1 1 1 0 546 1 2 8 0 0 0
                                    1 2 8 0 0 0 1 1 15 0 418 419 1 22 0 420 1 1
                                    21 0 57 61 1 1 0 547 1 1 1 0 548 1 1 1 0
                                    549 1 1 1 0 107 110 1 1 0 0 1 1 5 0 98 104
                                    1 5 0 105 106 1 0 0 6 444 1 0 0 27 487 1 0
                                    0 12 140 1 0 525 0 527 1 3 545 0 1 0 5 35 1
                                    1 0 0 0 1 1 0 0 325 1 2 1 0 0 0 334 2 1 0 0
                                    0 239 2 1 0 0 0 243 2 1 0 0 0 237 2 1 0 0 0
                                    241 1 0 9 10 11 1 1 0 0 216 1 1 0 0 192 2 1
                                    9 0 0 1 1 1 0 0 212 1 1 0 0 188 1 1 0 0 220
                                    1 1 0 0 196 5 0 0 27 0 0 0 0 1 2 0 0 27 325
                                    1 3 0 0 27 0 0 1 4 0 0 27 0 0 0 1 2 0 0 27
                                    0 1 2 5 9 0 0 1 2 1 0 0 0 269 1 1 0 0 251 1
                                    1 0 0 249 1 1 0 0 247 1 1 0 0 245 1 1 0 0
                                    222 1 1 0 0 198 1 1 0 0 218 1 1 0 0 194 1 1
                                    0 0 214 1 1 0 0 190 1 1 0 0 225 2 23 0 0 57
                                    91 2 1 0 0 0 83 2 1 0 0 420 422 2 27 0 0 35
                                    90 2 27 0 0 92 93 0 25 0 47 1 1 0 0 359 1 1
                                    0 0 363 0 27 0 49 1 1 0 0 227 2 1 0 0 0 229
                                    1 1 0 0 357 3 5 0 0 27 35 1 3 5 0 0 38 565
                                    1 2 5 0 0 27 1 2 5 0 0 38 1 1 1 0 0 361 1 1
                                    0 0 365 2 1 0 0 0 231 2 0 9 0 0 96 2 23 0 0
                                    0 69 2 1 0 98 98 143 2 19 0 0 0 67 1 19 0 0
                                    56 2 25 0 0 0 65 2 19 0 57 0 59 2 25 0 35 0
                                    1 2 25 0 92 0 1 2 2 0 6 0 1 2 2 0 0 6 1 2 1
                                    0 0 420 1 2 1 0 420 0 1 2 27 0 0 0 63)))))
           '|lookupComplete|)) 
