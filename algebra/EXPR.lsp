
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
         ((|vl2| (|List| (|Kernel| $))) (#1=#:G178 NIL) (|z| NIL)
          (#2=#:G177 NIL) (|vl1| (|List| (|Symbol|)))
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
         ((|ak1| (|List| #1=(|Kernel| $))) (#2=#:G241 NIL) (|k1| NIL)
          (|arg| (|List| $)) (|resl| (|List| (|Kernel| $)))
          (|needed| (|Boolean|)) (#3=#:G240 NIL) (#4=#:G239 NIL)
          (#5=#:G238 NIL) (|k| NIL) (|ak| (|List| #1#)) (#6=#:G237 NIL))
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
         ((|x1| ($)) (|q| (|SparseUnivariatePolynomial| $)) (#1=#:G263 NIL)
          (|k| NIL) (|sas| (|SingletonAsOrderedSet|)) (#2=#:G262 NIL)
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
                                    (GO #5=#:G261))))))))
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
          #5# (EXIT #2#)))) 

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
        (SPROG ((|ans| (|List| (|Kernel| $))) (#1=#:G278 NIL) (|k| NIL))
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

(SDEFUN |EXPR;charlierC;4$;123| ((|n| $) (|a| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |z| (QREFELT $ 324))) 

(SDEFUN |EXPR;hermiteH;3$;124| ((|n| $) (|z| $) ($ $))
        (SPADCALL |n| |z| (QREFELT $ 326))) 

(SDEFUN |EXPR;jacobiP;5$;125| ((|n| $) (|a| $) (|b| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |b| |z| (QREFELT $ 328))) 

(SDEFUN |EXPR;laguerreL;4$;126| ((|n| $) (|a| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |z| (QREFELT $ 330))) 

(SDEFUN |EXPR;meixnerM;5$;127| ((|n| $) (|b| $) (|c| $) (|z| $) ($ $))
        (SPADCALL |n| |b| |c| |z| (QREFELT $ 332))) 

(SDEFUN |EXPR;hypergeometricF;2L2$;128|
        ((|la| . #1=(|List| $)) (|lb| . #1#) (|x| $) ($ $))
        (SPADCALL |la| |lb| |x| (QREFELT $ 334))) 

(SDEFUN |EXPR;meijerG;4L2$;129|
        ((|la| . #1=(|List| $)) (|lb| . #1#) (|lc| . #1#) (|ld| . #1#) (|x| $)
         ($ $))
        (SPADCALL |la| |lb| |lc| |ld| |x| (QREFELT $ 337))) 

(SDEFUN |EXPR;^;3$;130| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 340))) 

(SDEFUN |EXPR;factorial;2$;131| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 341))) 

(SDEFUN |EXPR;binomial;3$;132| ((|n| $) (|m| $) ($ $))
        (SPADCALL |n| |m| (QREFELT $ 343))) 

(SDEFUN |EXPR;permutation;3$;133| ((|n| $) (|m| $) ($ $))
        (SPADCALL |n| |m| (QREFELT $ 345))) 

(SDEFUN |EXPR;factorials;2$;134| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 347))) 

(SDEFUN |EXPR;factorials;$S$;135| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 349))) 

(SDEFUN |EXPR;summation;$S$;136| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 351))) 

(SDEFUN |EXPR;summation;$Sb$;137| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 354))) 

(SDEFUN |EXPR;product;$S$;138| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 357))) 

(SDEFUN |EXPR;product;$Sb$;139| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 359))) 

(SDEFUN |EXPR;erf;2$;140| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 362))) 

(SDEFUN |EXPR;erfi;2$;141| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 364))) 

(SDEFUN |EXPR;Ei;2$;142| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 366))) 

(SDEFUN |EXPR;Si;2$;143| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 368))) 

(SDEFUN |EXPR;Ci;2$;144| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 370))) 

(SDEFUN |EXPR;Shi;2$;145| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 372))) 

(SDEFUN |EXPR;Chi;2$;146| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 374))) 

(SDEFUN |EXPR;li;2$;147| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 376))) 

(SDEFUN |EXPR;dilog;2$;148| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 378))) 

(SDEFUN |EXPR;fresnelS;2$;149| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 380))) 

(SDEFUN |EXPR;fresnelC;2$;150| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 382))) 

(SDEFUN |EXPR;integral;$S$;151| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 384))) 

(SDEFUN |EXPR;integral;$Sb$;152| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 386))) 

(SDEFUN |EXPR;operator;2Bo;153| ((|op| . #1=(|BasicOperator|)) ($ . #1#))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |op| (QREFELT $ 388))
                  (SPADCALL |op| (QREFELT $ 389)))
                 ((SPADCALL |op| (QREFELT $ 390))
                  (SPADCALL |op| (QREFELT $ 391)))
                 ((SPADCALL |op| (QREFELT $ 392))
                  (SPADCALL |op| (QREFELT $ 393)))
                 ((SPADCALL |op| (QREFELT $ 394))
                  (SPADCALL |op| (QREFELT $ 395)))
                 ((SPADCALL |op| (QREFELT $ 396))
                  (SPADCALL |op| (QREFELT $ 397)))
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
                         |EXPR;operator;2Bo;153|)
                   (EXIT
                    (COND
                     ((QEQCAR |n| 1)
                      (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QREFELT $ 34)))
                     (#2#
                      (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QCDR |n|)
                                (QREFELT $ 36))))))))))) 

(SDEFUN |EXPR;reduc| ((|x| $) (|l| |List| (|Kernel| $)) ($ $))
        (SPROG
         ((|p| (|SparseUnivariatePolynomial| $)) (#1=#:G406 NIL) (|k| NIL))
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
        (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 399)) |k| (QREFELT $ 402))
                  (QREFELT $ 404))) 

(SDEFUN |EXPR;evl|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) (|k| |Kernel| $)
         (|m| |SparseUnivariatePolynomial| $)
         ($ |Fraction| (|SparseMultivariatePolynomial| R (|Kernel| $))))
        (COND
         ((< (SPADCALL |p| |k| (QREFELT $ 405)) (SPADCALL |m| (QREFELT $ 406)))
          (SPADCALL |p| (QREFELT $ 399)))
         ('T
          (SPADCALL (SPADCALL (|EXPR;evl0| |p| |k| $) |m| (QREFELT $ 407))
                    (SPADCALL (SPADCALL |k| (QREFELT $ 408)) (QREFELT $ 399))
                    (QREFELT $ 409))))) 

(SDEFUN |EXPR;noalg?| ((|p| |SparseUnivariatePolynomial| $) ($ |Boolean|))
        (SPROG ((#1=#:G415 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |p| (|spadConstant| $ 410)
                                    (QREFELT $ 411)))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (NULL
                             (|EXPR;algkernels|
                              (SPADCALL (SPADCALL |p| (QREFELT $ 412))
                                        (QREFELT $ 75))
                              $)))
                           (PROGN
                            (LETT #1# 'NIL . #2=(|EXPR;noalg?|))
                            (GO #3=#:G414)))
                          ('T
                           (LETT |p| (SPADCALL |p| (QREFELT $ 413)) . #2#)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |EXPR;gcdPolynomial;3Sup;158|
        ((|p| . #1=(|SparseUnivariatePolynomial| $)) (|q| . #1#) ($ . #1#))
        (SEQ
         (COND
          ((|EXPR;noalg?| |p| $)
           (COND
            ((|EXPR;noalg?| |q| $)
             (EXIT (SPADCALL |p| |q| (QREFELT $ 414)))))))
         (EXIT (SPADCALL |p| |q| (QREFELT $ 416))))) 

(SDEFUN |EXPR;factorPolynomial;SupF;159|
        ((|x| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPROG
         ((|uf|
           (|Factored|
            (|SparseUnivariatePolynomial|
             (|Fraction| (|SparseMultivariatePolynomial| R (|Kernel| $)))))))
         (SEQ
          (LETT |uf| (SPADCALL |x| (QREFELT $ 420))
                |EXPR;factorPolynomial;SupF;159|)
          (EXIT |uf|)))) 

(SDEFUN |EXPR;squareFreePolynomial;SupF;160|
        ((|x| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPROG
         ((|uf|
           (|Factored|
            (|SparseUnivariatePolynomial|
             (|Fraction| (|SparseMultivariatePolynomial| R (|Kernel| $)))))))
         (SEQ
          (LETT |uf| (SPADCALL |x| (QREFELT $ 423))
                |EXPR;squareFreePolynomial;SupF;160|)
          (EXIT |uf|)))) 

(SDEFUN |EXPR;coerce;An$;161| ((|x| |AlgebraicNumber|) ($ $))
        (SPADCALL (SPADCALL |x| (|spadConstant| $ 426) (QREFELT $ 427))
                  (QREFELT $ 104))) 

(SDEFUN |EXPR;^;$F$;162| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL |x| |r| (QREFELT $ 431))) 

(SDEFUN |EXPR;minPoly;KSup;163|
        ((|k| |Kernel| . #1=($)) ($ |SparseUnivariatePolynomial| . #1#))
        (SPADCALL |k| (QREFELT $ 433))) 

(SDEFUN |EXPR;definingPolynomial;2$;164| ((|x| $) ($ $))
        (SPADCALL |x| (QREFELT $ 434))) 

(SDEFUN |EXPR;retract;$F;165| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL |x| (QREFELT $ 436))) 

(SDEFUN |EXPR;retractIfCan;$U;166|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPADCALL |x| (QREFELT $ 438))) 

(SDEFUN |EXPR;coerce;An$;167| ((|x| |AlgebraicNumber|) ($ $))
        (SPADCALL (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 440)) $)
                  (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 441)) $)
                  (QREFELT $ 69))) 

(SDEFUN |EXPR;k2expr| ((|k| |Kernel| (|AlgebraicNumber|)) ($ $))
        (SPADCALL (ELT $ 429) |k| (QREFELT $ 445))) 

(SDEFUN |EXPR;smp2expr|
        ((|p| |SparseMultivariatePolynomial| (|Integer|)
          (|Kernel| (|AlgebraicNumber|)))
         ($ $))
        (SPADCALL (CONS (|function| |EXPR;k2expr|) $) (ELT $ 61) |p|
                  (QREFELT $ 450))) 

(SDEFUN |EXPR;retractIfCan;$U;170|
        ((|x| $) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG
         ((#1=#:G447 NIL) (|d| #2=(|Union| (|AlgebraicNumber|) "failed"))
          (|n| #2#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |n| (|EXPR;smp2an| (SPADCALL |x| (QREFELT $ 99)) $)
                   . #3=(|EXPR;retractIfCan;$U;170|))
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
                                           (QREFELT $ 451)))
                           . #3#)
                     (GO #4=#:G442))))))))))
            (EXIT (CONS 1 "failed"))))
          #4# (EXIT #1#)))) 

(SDEFUN |EXPR;R2AN| ((|r| R) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG ((|u| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL (SPADCALL |r| (QREFELT $ 454)) (QREFELT $ 72))
                      |EXPR;R2AN|)
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 455))))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |EXPR;k2an| ((|k| |Kernel| $) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG
         ((|arg| (|List| (|AlgebraicNumber|))) (#1=#:G479 NIL)
          (|a| #2=(|Union| (|AlgebraicNumber|) #3="failed")) (#4=#:G480 NIL)
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
               (QREFELT $ 456)))
             (CONS 1 "failed"))
            ('T
             (COND
              ((SPADCALL |op| '|rootOf| (QREFELT $ 457))
               (SEQ (LETT |args| (SPADCALL |k| (QREFELT $ 79)) . #5#)
                    (LETT |a2| (SPADCALL |args| 2 (QREFELT $ 81)) . #5#)
                    (LETT |k1u| (SPADCALL |a2| (QREFELT $ 19)) . #5#)
                    (EXIT
                     (COND ((QEQCAR |k1u| 1) (CONS 1 "failed"))
                           (#6='T
                            (SEQ (LETT |k1| (QCDR |k1u|) . #5#)
                                 (LETT |s1u| (SPADCALL |a2| (QREFELT $ 459))
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
                                                  (QREFELT $ 460))
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
                                                        (|spadConstant| $ 462)
                                                        . #5#)
                                                  (SEQ G190
                                                       (COND
                                                        ((NULL
                                                          (SPADCALL |eq|
                                                                    (|spadConstant|
                                                                     $ 463)
                                                                    (QREFELT $
                                                                             464)))
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
                                                                         453))
                                                              . #5#)
                                                        (EXIT
                                                         (COND
                                                          ((QEQCAR |ccu| 1)
                                                           (PROGN
                                                            (LETT #1#
                                                                  (CONS 1
                                                                        "failed")
                                                                  . #5#)
                                                            (GO #7=#:G478)))
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
                                                                              465))
                                                                    (QREFELT $
                                                                             466))
                                                                   (QREFELT $
                                                                            467))
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
                                                                            468))))))))))))))))))
              (#6#
               (SEQ (LETT |arg| NIL . #5#)
                    (SEQ (LETT |x| NIL . #5#)
                         (LETT #4# (SPADCALL |k| (QREFELT $ 79)) . #5#) G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
                           (GO G191)))
                         (SEQ (LETT |a| (SPADCALL |x| (QREFELT $ 453)) . #5#)
                              (EXIT
                               (COND
                                ((QEQCAR |a| 1)
                                 (PROGN
                                  (LETT #1# (CONS 1 "failed") . #5#)
                                  (GO #7#)))
                                ('T
                                 (LETT |arg| (CONS (QCDR |a|) |arg|) . #5#)))))
                         (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (CONS 0
                           (SPADCALL (SPADCALL |op| (QREFELT $ 469))
                                     (NREVERSE |arg|) (QREFELT $ 470))))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |EXPR;smp2an|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $))
         ($ |Union| (|AlgebraicNumber|) #1="failed"))
        (SPROG
         ((|c| (|Union| (|AlgebraicNumber|) #1#))
          (|up|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| $))))
          (|ans| (|AlgebraicNumber|)) (#2=#:G495 NIL)
          (|t| (|Union| (|AlgebraicNumber|) "failed")) (|k| (|Kernel| $))
          (|x1| (|Union| (|Kernel| $) "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |x1| (SPADCALL |p| (QREFELT $ 472)) . #3=(|EXPR;smp2an|))
                (EXIT
                 (COND
                  ((QEQCAR |x1| 1)
                   (|EXPR;R2AN| (SPADCALL |p| (QREFELT $ 473)) $))
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
                            (SEQ (LETT |ans| (|spadConstant| $ 474) . #3#)
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND
                                          ((SPADCALL |up| (QREFELT $ 475))
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
                                           (GO #5=#:G494)))
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
                                                                        $ 465))
                                                                      (QREFELT
                                                                       $ 476))
                                                                     (QREFELT $
                                                                              477))
                                                           (QREFELT $ 478))
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
                                                                  478))))))))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |EXPR;convert;$If;174| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 480))) 

(SDEFUN |EXPR;eval;$Bo$S$;175|
        ((|f| $) (|op| |BasicOperator|) (|g| $) (|x| |Symbol|) ($ $))
        (SPADCALL |f| (LIST |op|) (LIST |g|) |x| (QREFELT $ 483))) 

(SDEFUN |EXPR;eval;$LLS$;176|
        ((|f| $) (|ls| |List| (|BasicOperator|)) (|lg| |List| $) (|x| |Symbol|)
         ($ $))
        (SPROG
         ((|res| ($)) (#1=#:G526 NIL) (|g| NIL) (#2=#:G525 NIL)
          (|nlg| (|List| $)) (#3=#:G524 NIL) (#4=#:G523 NIL)
          (|lbackwardSubs| (|List| (|Equation| $))) (#5=#:G521 NIL) (|i| NIL)
          (#6=#:G522 NIL) (|j| NIL) (#7=#:G520 NIL)
          (|lforwardSubs| (|List| (|Equation| $))) (#8=#:G518 NIL)
          (#9=#:G519 NIL) (#10=#:G517 NIL) (|ns| (|List| (|Symbol|)))
          (#11=#:G516 NIL) (#12=#:G515 NIL) (#13=#:G514 NIL) (#14=#:G513 NIL)
          (|lsd| (|List| (|Symbol|))) (|lsym| (|List| (|Symbol|)))
          (|llsym| (|List| (|List| (|Symbol|)))) (#15=#:G512 NIL)
          (#16=#:G511 NIL))
         (SEQ
          (LETT |llsym|
                (PROGN
                 (LETT #16# NIL . #17=(|EXPR;eval;$LLS$;176|))
                 (SEQ (LETT |g| NIL . #17#) (LETT #15# |lg| . #17#) G190
                      (COND
                       ((OR (ATOM #15#)
                            (PROGN (LETT |g| (CAR #15#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #16# (CONS (SPADCALL |g| (QREFELT $ 485)) #16#)
                              . #17#)))
                      (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #16#))))
                . #17#)
          (LETT |lsym|
                (SPADCALL (SPADCALL |llsym| (QREFELT $ 486)) (QREFELT $ 487))
                . #17#)
          (LETT |lsd| (SPADCALL (ELT $ 488) |lsym| (QREFELT $ 490)) . #17#)
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
                                     (CONS (SPADCALL |g| |x| (QREFELT $ 492))
                                           #14#)
                                     . #17#)))
                             (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                             (EXIT (NREVERSE #14#))))
                       (QREFELT $ 495)))
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
                            (LETT #12# (CONS (SPADCALL (QREFELT $ 496)) #12#)
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
                                   (SPADCALL (SPADCALL |i| (QREFELT $ 497))
                                             (SPADCALL |j| (QREFELT $ 497))
                                             (QREFELT $ 499))
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
                                   (SPADCALL (SPADCALL |j| (QREFELT $ 497))
                                             (SPADCALL |i| (QREFELT $ 497))
                                             (QREFELT $ 499))
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
                                             (QREFELT $ 501))
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
                                             (SPADCALL |g| |x| (QREFELT $ 492))
                                             #2#)
                                            . #17#)))
                                    (LETT #1# (CDR #1#) . #17#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 495))
                    . #17#)
              (EXIT (SPADCALL |res| |lbackwardSubs| (QREFELT $ 501)))))))))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;177|
        ((|x| $) (|p| |Pattern| #1=(|Integer|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 505))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;178|
        ((|x| $) (|p| |Pattern| #1=(|Float|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 511))) 

(SDEFUN |EXPR;Zero;$;179| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |EXPR;One;$;180| (($ $)) (|spadConstant| $ 48)) 

(SDEFUN |EXPR;-;2$;181| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |EXPR;*;I2$;182| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL |n| |x| (QREFELT $ 58))) 

(SDEFUN |EXPR;*;3$;183| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 62))) 

(SDEFUN |EXPR;+;3$;184| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 64))) 

(SDEFUN |EXPR;=;2$B;185| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(SDEFUN |EXPR;smaller?;2$B;186| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 94))) 

(PUT '|EXPR;numer;$Smp;187| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |EXPR;numer;$Smp;187|
        ((|x| $) ($ |SparseMultivariatePolynomial| R (|Kernel| $))) |x|) 

(PUT '|EXPR;coerce;Smp$;188| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |EXPR;coerce;Smp$;188|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) ($ $)) |p|) 

(SDEFUN |EXPR;coerce;P$;189| ((|p| |Polynomial| R) ($ $))
        (|EXPR;poly_to_MP| |p| $)) 

(SDEFUN |EXPR;reducedSystem;MM;190| ((|m| |Matrix| $) ($ |Matrix| R))
        (SPADCALL |m| (QREFELT $ 514))) 

(SDEFUN |EXPR;reducedSystem;MVR;191|
        ((|m| |Matrix| . #1=($)) (|v| |Vector| . #1#)
         ($ |Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R))))
        (SPADCALL |m| |v| (QREFELT $ 515))) 

(SDEFUN |EXPR;convert;$If;192| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 480))) 

(SDEFUN |EXPR;kintmatch|
        ((|k| |Kernel| $) (|p| |Pattern| (|Integer|))
         (|l| |PatternMatchResult| (|Integer|) |Rep|)
         ($ |PatternMatchResult| (|Integer|) |Rep|))
        (SPADCALL |k| |p| |l| (QREFELT $ 517))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;194|
        ((|x| $) (|p| |Pattern| #1=(|Integer|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kintmatch|) $)
                  (QREFELT $ 521))) 

(SDEFUN |EXPR;kfltmatch|
        ((|k| |Kernel| $) (|p| |Pattern| (|Float|))
         (|l| |PatternMatchResult| (|Float|) |Rep|)
         ($ |PatternMatchResult| (|Float|) |Rep|))
        (SPADCALL |k| |p| |l| (QREFELT $ 523))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;196|
        ((|x| $) (|p| |Pattern| #1=(|Float|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kfltmatch|) $)
                  (QREFELT $ 527))) 

(SDEFUN |EXPR;Zero;$;197| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |EXPR;+;3$;198| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 64))) 

(SDEFUN |EXPR;=;2$B;199| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(SDEFUN |EXPR;smaller?;2$B;200| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 94))) 

(SDEFUN |EXPR;coerce;K$;201| ((|k| |Kernel| $) ($ $))
        (SPADCALL |k| (QREFELT $ 528))) 

(SDEFUN |EXPR;kernels;$L;202| ((|x| $) ($ |List| (|Kernel| $)))
        (SPROG ((#1=#:G563 NIL) (|f| NIL) (#2=#:G562 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EXPR;kernels;$L;202|))
                 (SEQ (LETT |f| NIL . #3#)
                      (LETT #1# (SPADCALL |x| (QREFELT $ 531)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCAR |f|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EXPR;coerce;R$;203| ((|x| R) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 532)) (|spadConstant| $ 47))
              ('T (SPADCALL (SPADCALL |x| (QREFELT $ 533)) (QREFELT $ 140))))) 

(SDEFUN |EXPR;retract;$R;204| ((|x| $) ($ R))
        (COND ((SPADCALL |x| (QREFELT $ 54)) (|spadConstant| $ 87))
              ('T (|EXPR;retNotUnit| |x| $)))) 

(SDEFUN |EXPR;coerce;$Of;205| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 536))) 

(SDEFUN |EXPR;kereval|
        ((|k| |Kernel| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SPADCALL |lk| |lv| |k|
                         (CONS #'|EXPR;kereval!1| (VECTOR |lk| |lv| $))
                         (QREFELT $ 542)))) 

(SDEFUN |EXPR;kereval!1| ((|x2| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;kereval|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT |lk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|EXPR;kereval!0| (VECTOR $ |lv| |lk|))
                             |x2| (QREFELT $ 539))))))) 

(SDEFUN |EXPR;kereval!0| ((|x1| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x1| |lk| |lv| (QREFELT $ 538)))))) 

(SDEFUN |EXPR;subeval|
        ((|k| |Kernel| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |k|
                          (CONS #'|EXPR;subeval!0| (VECTOR |lv| |lk| $))
                          (QREFELT $ 542))))) 

(SDEFUN |EXPR;subeval!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |lk| |lv|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subeval|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |lv| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G587 NIL) (|a| NIL) (#3=#:G586 NIL))
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
                                                       (QREFELT $ 543))
                                             #3#)
                                            NIL)))
                                    (LETT #2# (CDR #2#) NIL) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              (QREFELT $ 544)))))))) 

(SDEFUN |EXPR;isPlus;$U;208| ((|x| $) ($ |Union| (|List| $) "failed"))
        (SPROG
         ((#1=#:G602 NIL) (|t| NIL) (#2=#:G601 NIL)
          (|l|
           (|List|
            (|Record| (|:| |gen| (|Kernel| $)) (|:| |exp| (|Integer|))))))
         (SEQ
          (COND
           ((OR
             (NULL
              (LETT |l| (SPADCALL |x| (QREFELT $ 531))
                    . #3=(|EXPR;isPlus;$U;208|)))
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
                                           (QREFELT $ 545))
                                 #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |EXPR;isMult;$U;209|
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
              (LETT |l| (SPADCALL |x| (QREFELT $ 531))
                    . #1=(|EXPR;isMult;$U;209|)))
             (NULL (NULL (CDR |l|))))
            (CONS 1 "failed"))
           ('T
            (SEQ (LETT |t| (SPADCALL |l| (QREFELT $ 548)) . #1#)
                 (EXIT (CONS 0 (CONS (QCDR |t|) (QCAR |t|)))))))))) 

(SDEFUN |EXPR;eval;$LL$;210|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG
         ((#1=#:G618 NIL) (#2=#:G617 ($)) (#3=#:G619 ($)) (#4=#:G621 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|EXPR;eval;$LL$;210|))
           (SEQ (LETT |t| NIL . #5#)
                (LETT #4# (SPADCALL |x| (QREFELT $ 531)) . #5#) G190
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

(SDEFUN |EXPR;subst;$LL$;211|
        ((|x| $) (|lk| |List| (|Kernel| . #1=($))) (|lv| |List| . #1#) ($ $))
        (SPROG
         ((#2=#:G624 NIL) (#3=#:G623 ($)) (#4=#:G625 ($)) (#5=#:G627 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #2# NIL . #6=(|EXPR;subst;$LL$;211|))
           (SEQ (LETT |t| NIL . #6#)
                (LETT #5# (SPADCALL |x| (QREFELT $ 531)) . #6#) G190
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

(SDEFUN |EXPR;retractIfCan;$U;212| ((|x| $) ($ |Union| R "failed"))
        (COND ((SPADCALL |x| (QREFELT $ 54)) (CONS 0 (|spadConstant| $ 87)))
              ('T (|EXPR;retNotUnitIfCan| |x| $)))) 

(SDEFUN |EXPR;-;2$;213| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |EXPR;smaller?;2$B;214| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 94))) 

(SDEFUN |EXPR;=;2$B;215| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(PUT '|EXPR;coerce;K$;216| '|SPADreplace| '(XLAM (|k|) |k|)) 

(SDEFUN |EXPR;coerce;K$;216| ((|k| |Kernel| $) ($ $)) |k|) 

(PUT '|EXPR;kernels;$L;217| '|SPADreplace| 'LIST) 

(SDEFUN |EXPR;kernels;$L;217| ((|x| $) ($ |List| (|Kernel| $))) (LIST |x|)) 

(SDEFUN |EXPR;coerce;R$;218| ((|x| R) ($ $)) (SPADCALL |x| (QREFELT $ 533))) 

(SDEFUN |EXPR;retract;$R;219| ((|x| $) ($ R)) (|EXPR;retNotUnit| |x| $)) 

(SDEFUN |EXPR;retractIfCan;$U;220| ((|x| $) ($ |Union| R "failed"))
        (|EXPR;retNotUnitIfCan| |x| $)) 

(SDEFUN |EXPR;coerce;$Of;221| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 536))) 

(SDEFUN |EXPR;eval;$LL$;222|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SPADCALL |lk| |lv| |x|
                         (CONS #'|EXPR;eval;$LL$;222!1| (VECTOR |lk| |lv| $))
                         (QREFELT $ 542)))) 

(SDEFUN |EXPR;eval;$LL$;222!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;eval;$LL$;222|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT |lk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (CONS #'|EXPR;eval;$LL$;222!0| (VECTOR $ |lv| |lk|)) |x1|
                    (QREFELT $ 539))))))) 

(SDEFUN |EXPR;eval;$LL$;222!0| ((|x2| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |lk| |lv| (QREFELT $ 538)))))) 

(SDEFUN |EXPR;subst;$LL$;223|
        ((|x| $) (|lk| |List| (|Kernel| . #1=($))) (|lv| |List| . #1#) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |x|
                          (CONS #'|EXPR;subst;$LL$;223!0| (VECTOR |lv| |lk| $))
                          (QREFELT $ 542))))) 

(SDEFUN |EXPR;subst;$LL$;223!0| ((|x1| NIL) ($$ NIL))
        (PROG ($ |lk| |lv|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subst;$LL$;223|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |lv| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G663 NIL) (|a| NIL) (#3=#:G662 NIL))
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
                                                       (QREFELT $ 543))
                                             #3#)
                                            NIL)))
                                    (LETT #2# (CDR #2#) NIL) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              (QREFELT $ 544)))))))) 

(SDEFUN |EXPR;convert;$If;224| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 480))) 

(DECLAIM (NOTINLINE |Expression;|)) 

(DEFUN |Expression| (#1=#:G703)
  (SPROG NIL
         (PROG (#2=#:G704)
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
   ((|pv$| NIL) (#1=#:G698 NIL) (#2=#:G699 NIL) (#3=#:G700 NIL) (#4=#:G701 NIL)
    (#5=#:G702 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #6=(|Expression|))
    (LETT |dv$| (LIST '|Expression| DV$1) . #6#)
    (LETT $ (GETREFV 583) . #6#)
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
          (QSETREFV $ 325
                    (CONS (|dispatchFunction| |EXPR;charlierC;4$;123|) $))
          (QSETREFV $ 327 (CONS (|dispatchFunction| |EXPR;hermiteH;3$;124|) $))
          (QSETREFV $ 329 (CONS (|dispatchFunction| |EXPR;jacobiP;5$;125|) $))
          (QSETREFV $ 331
                    (CONS (|dispatchFunction| |EXPR;laguerreL;4$;126|) $))
          (QSETREFV $ 333 (CONS (|dispatchFunction| |EXPR;meixnerM;5$;127|) $))
          (COND
           ((|testBitVector| |pv$| 31)
            (PROGN
             (QSETREFV $ 336
                       (CONS
                        (|dispatchFunction| |EXPR;hypergeometricF;2L2$;128|)
                        (|getDomainView| $ '(|RetractableTo| (|Integer|)))))
             (QSETREFV $ 338
                       (CONS (|dispatchFunction| |EXPR;meijerG;4L2$;129|)
                             (|getDomainView| $
                                              '(|RetractableTo|
                                                (|Integer|))))))))
          (QSETREFV $ 83 (CONS (|dispatchFunction| |EXPR;^;3$;130|) $))
          (QSETREFV $ 342
                    (CONS (|dispatchFunction| |EXPR;factorial;2$;131|) $))
          (QSETREFV $ 344 (CONS (|dispatchFunction| |EXPR;binomial;3$;132|) $))
          (QSETREFV $ 346
                    (CONS (|dispatchFunction| |EXPR;permutation;3$;133|) $))
          (QSETREFV $ 348
                    (CONS (|dispatchFunction| |EXPR;factorials;2$;134|) $))
          (QSETREFV $ 350
                    (CONS (|dispatchFunction| |EXPR;factorials;$S$;135|) $))
          (QSETREFV $ 352
                    (CONS (|dispatchFunction| |EXPR;summation;$S$;136|) $))
          (QSETREFV $ 356
                    (CONS (|dispatchFunction| |EXPR;summation;$Sb$;137|) $))
          (QSETREFV $ 358 (CONS (|dispatchFunction| |EXPR;product;$S$;138|) $))
          (QSETREFV $ 360
                    (CONS (|dispatchFunction| |EXPR;product;$Sb$;139|) $))
          (QSETREFV $ 363 (CONS (|dispatchFunction| |EXPR;erf;2$;140|) $))
          (QSETREFV $ 365 (CONS (|dispatchFunction| |EXPR;erfi;2$;141|) $))
          (QSETREFV $ 367 (CONS (|dispatchFunction| |EXPR;Ei;2$;142|) $))
          (QSETREFV $ 369 (CONS (|dispatchFunction| |EXPR;Si;2$;143|) $))
          (QSETREFV $ 371 (CONS (|dispatchFunction| |EXPR;Ci;2$;144|) $))
          (QSETREFV $ 373 (CONS (|dispatchFunction| |EXPR;Shi;2$;145|) $))
          (QSETREFV $ 375 (CONS (|dispatchFunction| |EXPR;Chi;2$;146|) $))
          (QSETREFV $ 377 (CONS (|dispatchFunction| |EXPR;li;2$;147|) $))
          (QSETREFV $ 379 (CONS (|dispatchFunction| |EXPR;dilog;2$;148|) $))
          (QSETREFV $ 381 (CONS (|dispatchFunction| |EXPR;fresnelS;2$;149|) $))
          (QSETREFV $ 383 (CONS (|dispatchFunction| |EXPR;fresnelC;2$;150|) $))
          (QSETREFV $ 385
                    (CONS (|dispatchFunction| |EXPR;integral;$S$;151|) $))
          (QSETREFV $ 387
                    (CONS (|dispatchFunction| |EXPR;integral;$Sb$;152|) $))
          (QSETREFV $ 37 (CONS (|dispatchFunction| |EXPR;operator;2Bo;153|) $))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (PROGN
             (QSETREFV $ 417
                       (CONS (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;158|)
                             $))
             (QSETREFV $ 422
                       (CONS
                        (|dispatchFunction| |EXPR;factorPolynomial;SupF;159|)
                        $))
             (QSETREFV $ 424
                       (CONS
                        (|dispatchFunction|
                         |EXPR;squareFreePolynomial;SupF;160|)
                        $)))))
          (COND
           ((|domainEqual| |#1| (|AlgebraicNumber|))
            (QSETREFV $ 429
                      (CONS (|dispatchFunction| |EXPR;coerce;An$;161|) $))))
          (COND
           ((|testBitVector| |pv$| 14)
            (PROGN
             (QSETREFV $ 432 (CONS (|dispatchFunction| |EXPR;^;$F$;162|) $))
             (QSETREFV $ 136
                       (CONS (|dispatchFunction| |EXPR;minPoly;KSup;163|) $))
             (QSETREFV $ 435
                       (CONS
                        (|dispatchFunction| |EXPR;definingPolynomial;2$;164|)
                        $))
             (QSETREFV $ 437
                       (CONS (|dispatchFunction| |EXPR;retract;$F;165|) $))
             (QSETREFV $ 72
                       (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;166|)
                             $))
             (COND ((|domainEqual| |#1| (|AlgebraicNumber|)))
                   ('T
                    (PROGN
                     (QSETREFV $ 429
                               (CONS (|dispatchFunction| |EXPR;coerce;An$;167|)
                                     $))
                     (QSETREFV $ 453
                               (CONS
                                (|dispatchFunction| |EXPR;retractIfCan;$U;170|)
                                $))))))))
          (COND
           ((|testBitVector| |pv$| 9)
            (PROGN
             (QSETREFV $ 481
                       (CONS (|dispatchFunction| |EXPR;convert;$If;174|) $))
             (QSETREFV $ 484
                       (CONS (|dispatchFunction| |EXPR;eval;$Bo$S$;175|) $))
             (QSETREFV $ 483
                       (CONS (|dispatchFunction| |EXPR;eval;$LLS$;176|) $)))))
          (COND
           ((|testBitVector| |pv$| 13)
            (QSETREFV $ 507
                      (CONS (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;177|)
                            $))))
          (COND
           ((|testBitVector| |pv$| 12)
            (QSETREFV $ 513
                      (CONS (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;178|)
                            $))))))
        ('T
         (PROGN
          (SETELT $ 45 (|SparseMultivariatePolynomial| |#1| (|Kernel| $)))
          (QSETREFV $ 47
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;Zero;$;179|) $ 47)))
          (QSETREFV $ 49
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;One;$;180|) $ 49)))
          (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;181|) $))
          (QSETREFV $ 59 (CONS (|dispatchFunction| |EXPR;*;I2$;182|) $))
          (QSETREFV $ 63 (CONS (|dispatchFunction| |EXPR;*;3$;183|) $))
          (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;184|) $))
          (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;185|) $))
          (QSETREFV $ 95 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;186|) $))
          (QSETREFV $ 99 (CONS (|dispatchFunction| |EXPR;numer;$Smp;187|) $))
          (QSETREFV $ 104 (CONS (|dispatchFunction| |EXPR;coerce;Smp$;188|) $))
          (QSETREFV $ 106 (CONS (|dispatchFunction| |EXPR;coerce;P$;189|) $))
          (QSETREFV $ 152
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;190|) $))
          (QSETREFV $ 160
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;191|) $))
          (COND
           ((|testBitVector| |pv$| 9)
            (QSETREFV $ 481
                      (CONS (|dispatchFunction| |EXPR;convert;$If;192|) $))))
          (COND
           ((|testBitVector| |pv$| 13)
            (PROGN
             (QSETREFV $ 507
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;194|)
                        $)))))
          (COND
           ((|testBitVector| |pv$| 12)
            (PROGN
             (QSETREFV $ 513
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;196|)
                        $))))))))))
     ((|HasCategory| |#1| '(|AbelianMonoid|))
      (PROGN
       (SETELT $ 45 (|FreeAbelianGroup| (|Kernel| $)))
       (QSETREFV $ 47
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |EXPR;Zero;$;197|) $ 47)))
       (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;198|) $))
       (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;199|) $))
       (QSETREFV $ 95 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;200|) $))
       (QSETREFV $ 140 (CONS (|dispatchFunction| |EXPR;coerce;K$;201|) $))
       (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;202|) $))
       (QSETREFV $ 454 (CONS (|dispatchFunction| |EXPR;coerce;R$;203|) $))
       (QSETREFV $ 534 (CONS (|dispatchFunction| |EXPR;retract;$R;204|) $))
       (QSETREFV $ 537 (CONS (|dispatchFunction| |EXPR;coerce;$Of;205|) $))
       (QSETREFV $ 547 (CONS (|dispatchFunction| |EXPR;isPlus;$U;208|) $))
       (QSETREFV $ 551 (CONS (|dispatchFunction| |EXPR;isMult;$U;209|) $))
       (QSETREFV $ 538 (CONS (|dispatchFunction| |EXPR;eval;$LL$;210|) $))
       (QSETREFV $ 543 (CONS (|dispatchFunction| |EXPR;subst;$LL$;211|) $))
       (QSETREFV $ 552
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;212|) $))
       (COND
        ((|testBitVector| |pv$| 19)
         (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;213|) $))))))
     ('T
      (PROGN
       (SETELT $ 45 (|Kernel| $))
       (QSETREFV $ 95 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;214|) $))
       (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;215|) $))
       (QSETREFV $ 140 (CONS (|dispatchFunction| |EXPR;coerce;K$;216|) $))
       (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;217|) $))
       (QSETREFV $ 454 (CONS (|dispatchFunction| |EXPR;coerce;R$;218|) $))
       (QSETREFV $ 534 (CONS (|dispatchFunction| |EXPR;retract;$R;219|) $))
       (QSETREFV $ 552
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;220|) $))
       (QSETREFV $ 537 (CONS (|dispatchFunction| |EXPR;coerce;$Of;221|) $))
       (QSETREFV $ 538 (CONS (|dispatchFunction| |EXPR;eval;$LL$;222|) $))
       (QSETREFV $ 543 (CONS (|dispatchFunction| |EXPR;subst;$LL$;223|) $))
       (COND
        ((|testBitVector| |pv$| 9)
         (QSETREFV $ 481
                   (CONS (|dispatchFunction| |EXPR;convert;$If;224|) $)))))))
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
              (|Union| 430 '#1#) (220 . |retractIfCan|) (225 . |number?|)
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
              (|PolynomialCategoryQuotientFunctions| 425 15 6 41 $$)
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
              (1493 . |charlierC|) (1500 . |charlierC|) (1507 . |hermiteH|)
              (1513 . |hermiteH|) (1519 . |jacobiP|) (1527 . |jacobiP|)
              (1535 . |laguerreL|) (1542 . |laguerreL|) (1549 . |meixnerM|)
              (1557 . |meixnerM|) (1565 . |hypergeometricF|) (|List| $)
              (1572 . |hypergeometricF|) (1579 . |meijerG|) (1588 . |meijerG|)
              (|CombinatorialFunction| 6 $$) (1597 . ^) (1603 . |factorial|)
              (1608 . |factorial|) (1613 . |binomial|) (1619 . |binomial|)
              (1625 . |permutation|) (1631 . |permutation|)
              (1637 . |factorials|) (1642 . |factorials|) (1647 . |factorials|)
              (1653 . |factorials|) (1659 . |summation|) (1665 . |summation|)
              (|SegmentBinding| $$) (1671 . |summation|) (|SegmentBinding| $)
              (1677 . |summation|) (1683 . |product|) (1689 . |product|)
              (1695 . |product|) (1701 . |product|)
              (|LiouvillianFunction| 6 $$) (1707 . |erf|) (1712 . |erf|)
              (1717 . |erfi|) (1722 . |erfi|) (1727 . |Ei|) (1732 . |Ei|)
              (1737 . |Si|) (1742 . |Si|) (1747 . |Ci|) (1752 . |Ci|)
              (1757 . |Shi|) (1762 . |Shi|) (1767 . |Chi|) (1772 . |Chi|)
              (1777 . |li|) (1782 . |li|) (1787 . |dilog|) (1792 . |dilog|)
              (1797 . |fresnelS|) (1802 . |fresnelS|) (1807 . |fresnelC|)
              (1812 . |fresnelC|) (1817 . |integral|) (1823 . |integral|)
              (1829 . |integral|) (1835 . |integral|) (1841 . |belong?|)
              (1846 . |operator|) (1851 . |belong?|) (1856 . |operator|)
              (1861 . |belong?|) (1866 . |operator|) (1871 . |belong?|)
              (1876 . |operator|) (1881 . |belong?|) (1886 . |operator|)
              (|Fraction| 41) (1891 . |coerce|) (|Fraction| 403)
              (|PolynomialCategoryQuotientFunctions| 425 15 6 41 398)
              (1896 . |univariate|) (|SparseUnivariatePolynomial| 398)
              (1902 . |numer|) (1907 . |degree|) (1913 . |degree|)
              (1918 . |rem|) (1924 . |coerce|) (1929 . |elt|) (1935 . |Zero|)
              (1939 . ~=) (1945 . |leadingCoefficient|) (1950 . |reductum|)
              (1955 . |gcdPolynomial|) (|GcdDomain&| $$)
              (1961 . |gcdPolynomial|) (1967 . |gcdPolynomial|)
              (|Factored| 403) (|SupFractionFactorizer| 425 15 6 41)
              (1973 . |factor|) (|Factored| 122) (1978 . |factorPolynomial|)
              (1983 . |squareFree|) (1988 . |squareFreePolynomial|)
              (|IndexedExponents| 15) (1993 . |Zero|) (1997 . |monomial|)
              (|AlgebraicNumber|) (2003 . |coerce|) (|Fraction| 57) (2008 . ^)
              (2014 . ^) (2020 . |minPoly|) (2025 . |definingPolynomial|)
              (2030 . |definingPolynomial|) (2035 . |retract|)
              (2040 . |retract|) (2045 . |retractIfCan|)
              (|SparseMultivariatePolynomial| 57 12) (2050 . |numer|)
              (2055 . |denom|) (|Mapping| $$ 428) (|Kernel| 428)
              (|ExpressionSpaceFunctions2| 428 $$) (2060 . |map|)
              (|Mapping| $$ 443) (|Mapping| $$ 57)
              (|SparseMultivariatePolynomial| 57 443)
              (|PolynomialCategoryLifting| (|IndexedExponents| 443) 443 57 448
                                           $$)
              (2066 . |map|) (2073 . /) (|Union| 428 '"failed")
              (2079 . |retractIfCan|) (2084 . |coerce|) (2089 . |coerce|)
              (2094 . |belong?|) (2099 . |is?|) (|Union| 27 '#1#)
              (2105 . |retractIfCan|) (2110 . ~=)
              (|SparseUnivariatePolynomial| 428) (2116 . |Zero|)
              (2120 . |Zero|) (2124 . ~=) (2130 . |degree|) (2135 . |monomial|)
              (2141 . +) (2147 . |rootOf|) (2153 . |operator|) (2158 . |elt|)
              (|Union| 15 '"failed") (2164 . |mainVariable|)
              (2169 . |leadingCoefficient|) (2174 . |Zero|) (2178 . |ground?|)
              (2183 . ^) (2189 . *) (2195 . +) (|InputForm|) (2201 . |convert|)
              (2206 . |convert|) (|List| 10) (2211 . |eval|) (2219 . |eval|)
              (2227 . |variables|) (2232 . |concat|)
              (2237 . |removeDuplicates|) (2242 . |scripted?|) (|Mapping| 9 27)
              (2247 . |select|) (|MakeUnaryCompiledFunction| $$ $$ $$)
              (2253 . |compiledFunction|) (|Mapping| $ $) (|List| 493)
              (2259 . |eval|) (2266 . |new|) (2270 . |coerce|) (|Equation| $$)
              (2275 . =) (|List| 579) (2281 . |subst|)
              (|PatternMatchResult| 57 $$) (|Pattern| 57)
              (|PatternMatchFunctionSpace| 57 6 $$) (2287 . |patternMatch|)
              (|PatternMatchResult| 57 $) (2294 . |patternMatch|)
              (|PatternMatchResult| (|Float|) $$) (|Pattern| (|Float|))
              (|PatternMatchFunctionSpace| (|Float|) 6 $$)
              (2301 . |patternMatch|) (|PatternMatchResult| (|Float|) $)
              (2308 . |patternMatch|) (2315 . |reducedSystem|)
              (2320 . |reducedSystem|) (|PatternMatchKernel| 57 $$)
              (2326 . |patternMatch|) (|PatternMatchResult| 57 45)
              (|Mapping| 518 15 503 518)
              (|PatternMatchPolynomialCategory| 57 425 15 6 45)
              (2333 . |patternMatch|) (|PatternMatchKernel| (|Float|) $$)
              (2341 . |patternMatch|) (|PatternMatchResult| (|Float|) 45)
              (|Mapping| 524 15 509 524)
              (|PatternMatchPolynomialCategory| (|Float|) 425 15 6 45)
              (2348 . |patternMatch|) (2356 . |coerce|)
              (|Record| (|:| |gen| 15) (|:| |exp| 57)) (|List| 529)
              (2361 . |terms|) (2366 . |zero?|) (2371 . |constantKernel|)
              (2376 . |retract|) (|OutputForm|) (2381 . |coerce|)
              (2386 . |coerce|) (2391 . |eval|) (2398 . |map|)
              (|Mapping| $$ 15) (|ListToMap| 15 $$) (2404 . |match|)
              (2412 . |subst|) (2419 . |kernel|) (2425 . *)
              (|Union| 335 '#2="failed") (2431 . |isPlus|) (2436 . |first|)
              (|Record| (|:| |coef| 57) (|:| |var| 12)) (|Union| 549 '#2#)
              (2441 . |isMult|) (2446 . |retractIfCan|) (|Matrix| 57)
              (|Record| (|:| |mat| 553) (|:| |vec| (|Vector| 57)))
              (|Union| $ '"failed") (|Factored| $) (|Polynomial| 558)
              (|Fraction| 6) (|Fraction| 557) (|Fraction| 122)
              (|Union| 107 '#1#) (|Polynomial| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |coef| 335) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 568 '"failed") (|Union| 57 '#1#)
              (|Record| (|:| |var| 12) (|:| |exponent| 57)) (|Union| 571 '#2#)
              (|Record| (|:| |val| $) (|:| |exponent| 57)) (|Union| 573 '#2#)
              (|List| 35) (|Mapping| $ 335) (|List| 576) (|Union| 105 '#1#)
              (|Equation| $) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 2451 |zerosOf| 2457 |zeroOf| 2484 |zero?| 2511 |whittakerW|
              2516 |whittakerM| 2523 |weierstrassZeta| 2530 |weierstrassSigma|
              2537 |weierstrassPPrime| 2544 |weierstrassP| 2551 |weberE| 2558
              |variables| 2564 |univariate| 2569 |unitNormal| 2575
              |unitCanonical| 2580 |unit?| 2585 |tower| 2590 |tanh| 2600 |tan|
              2605 |summation| 2610 |subtractIfCan| 2622 |subst| 2628 |struveL|
              2647 |struveH| 2653 |squareFreePolynomial| 2659 |squareFreePart|
              2664 |squareFree| 2669 |sqrt| 2674 |smaller?| 2679 |sizeLess?|
              2685 |sinh| 2691 |sin| 2696 |simplifyPower| 2701
              |setSimplifyDenomsFlag| 2707 |sech| 2712 |sec| 2717 |sample| 2722
              |rootsOf| 2726 |rootSum| 2753 |rootOf| 2760 |riemannZeta| 2787
              |retractIfCan| 2792 |retract| 2832 |rem| 2872 |reducedSystem|
              2878 |reduce| 2900 |recip| 2905 |quo| 2910 |product| 2916
              |principalIdeal| 2928 |prime?| 2933 |polylog| 2938 |polygamma|
              2944 |pi| 2950 |permutation| 2954 |patternMatch| 2960 |paren|
              2974 |opposite?| 2984 |operators| 2990 |operator| 2995 |one?|
              3000 |odd?| 3005 |numerator| 3010 |numer| 3015 |number?| 3020
              |nthRoot| 3025 |multiEuclidean| 3031 |minPoly| 3037 |meixnerM|
              3042 |meijerG| 3050 |map| 3059 |mainKernel| 3065 |lommelS2| 3070
              |lommelS1| 3077 |log| 3084 |li| 3089 |lerchPhi| 3094 |legendreQ|
              3101 |legendreP| 3108 |lcmCoef| 3115 |lcm| 3121 |latex| 3132
              |lambertW| 3137 |laguerreL| 3142 |kummerU| 3149 |kummerM| 3156
              |kernels| 3163 |kernel| 3173 |kelvinKer| 3185 |kelvinKei| 3191
              |kelvinBer| 3197 |kelvinBei| 3203 |jacobiZeta| 3209 |jacobiTheta|
              3215 |jacobiSn| 3221 |jacobiP| 3227 |jacobiDn| 3235 |jacobiCn|
              3241 |isTimes| 3247 |isPower| 3252 |isPlus| 3257 |isMult| 3262
              |isExpt| 3267 |is?| 3284 |inv| 3296 |integral| 3301
              |hypergeometricF| 3313 |hermiteH| 3320 |height| 3326
              |hashUpdate!| 3331 |hash| 3337 |hankelH2| 3342 |hankelH1| 3348
              |ground?| 3354 |ground| 3359 |getSimplifyDenomsFlag| 3364
              |gcdPolynomial| 3368 |gcd| 3374 |fresnelS| 3385 |fresnelC| 3390
              |freeOf?| 3395 |factorials| 3407 |factorial| 3418
              |factorPolynomial| 3423 |factor| 3428 |extendedEuclidean| 3433
              |exquo| 3446 |expressIdealMember| 3452 |exp| 3458 |even?| 3463
              |eval| 3468 |euclideanSize| 3629 |erfi| 3634 |erf| 3639 |elt|
              3644 |ellipticPi| 3740 |ellipticK| 3747 |ellipticF| 3752
              |ellipticE| 3758 |divide| 3769 |distribute| 3775 |dilog| 3786
              |digamma| 3791 |differentiate| 3796 |denominator| 3822 |denom|
              3827 |definingPolynomial| 3832 |csch| 3837 |csc| 3842 |coth| 3847
              |cot| 3852 |cosh| 3857 |cos| 3862 |convert| 3867 |conjugate| 3887
              |commutator| 3893 |coerce| 3899 |charthRoot| 3969 |charlierC|
              3974 |characteristic| 3981 |box| 3985 |binomial| 3995 |besselY|
              4001 |besselK| 4007 |besselJ| 4013 |besselI| 4019 |belong?| 4025
              |atanh| 4030 |atan| 4035 |associates?| 4040 |asinh| 4046 |asin|
              4051 |asech| 4056 |asec| 4061 |applyQuote| 4066 |annihilate?|
              4102 |angerJ| 4108 |airyBiPrime| 4114 |airyBi| 4119 |airyAiPrime|
              4124 |airyAi| 4129 |acsch| 4134 |acsc| 4139 |acoth| 4144 |acot|
              4149 |acosh| 4154 |acos| 4159 |abs| 4164 ^ 4169 |Zero| 4199 |Si|
              4203 |Shi| 4208 |One| 4213 |Gamma| 4217 |Ei| 4228 D 4233 |Ci|
              4259 |Chi| 4264 |Beta| 4269 = 4275 / 4281 - 4293 + 4304 * 4310)
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
                 (|Algebra| $$) (|LeftOreRing|) (|Algebra| 430) (|Algebra| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Module| $$)
                 (|EntireRing|) (|Module| 430) (|Module| 6)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 6) (|LinearlyExplicitRingOver| 57)
                 (|CommutativeRing|) (|PartialDifferentialRing| 27)
                 (|BiModule| $$ $$) (|BiModule| 430 430) (|BiModule| 6 6)
                 (|Ring|) (|RightModule| $$) (|LeftModule| 430)
                 (|RightModule| 430) (|LeftModule| $$) (|LeftModule| 6)
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
                 (|CoercibleTo| 535) (|RetractableTo| 430)
                 (|RetractableTo| (|Fraction| (|Polynomial| 6)))
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|RetractableTo| (|Polynomial| 6))
                 (|ConvertibleTo| 479) (|ConvertibleTo| 509)
                 (|ConvertibleTo| 503) (|RetractableTo| 57)
                 (|RetractableTo| 428) (|SpecialFunctionCategory|)
                 (|PrimitiveFunctionCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|CombinatorialFunctionCategory|) (|unitsKnown|)
                 (|RadicalCategory|))
              (|makeByteWordVec2| 582
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
                                    0 0 0 323 3 223 2 2 2 2 324 3 0 0 0 0 0 325
                                    2 223 2 2 2 326 2 0 0 0 0 327 4 223 2 2 2 2
                                    2 328 4 0 0 0 0 0 0 329 3 223 2 2 2 2 330 3
                                    0 0 0 0 0 331 4 223 2 2 2 2 2 332 4 0 0 0 0
                                    0 0 333 3 223 2 78 78 2 334 3 0 0 335 335 0
                                    336 5 223 2 78 78 78 78 2 337 5 0 0 335 335
                                    335 335 0 338 2 339 2 2 2 340 1 339 2 2 341
                                    1 0 0 0 342 2 339 2 2 2 343 2 0 0 0 0 344 2
                                    339 2 2 2 345 2 0 0 0 0 346 1 339 2 2 347 1
                                    0 0 0 348 2 339 2 2 27 349 2 0 0 0 27 350 2
                                    339 2 2 27 351 2 0 0 0 27 352 2 339 2 2 353
                                    354 2 0 0 0 355 356 2 339 2 2 27 357 2 0 0
                                    0 27 358 2 339 2 2 353 359 2 0 0 0 355 360
                                    1 361 2 2 362 1 0 0 0 363 1 361 2 2 364 1 0
                                    0 0 365 1 361 2 2 366 1 0 0 0 367 1 361 2 2
                                    368 1 0 0 0 369 1 361 2 2 370 1 0 0 0 371 1
                                    361 2 2 372 1 0 0 0 373 1 361 2 2 374 1 0 0
                                    0 375 1 361 2 2 376 1 0 0 0 377 1 361 2 2
                                    378 1 0 0 0 379 1 361 2 2 380 1 0 0 0 381 1
                                    361 2 2 382 1 0 0 0 383 2 361 2 2 27 384 2
                                    0 0 0 27 385 2 361 2 2 353 386 2 0 0 0 355
                                    387 1 163 9 10 388 1 163 10 10 389 1 168 9
                                    10 390 1 168 10 10 391 1 339 9 10 392 1 339
                                    10 10 393 1 361 9 10 394 1 361 10 10 395 1
                                    223 9 10 396 1 223 10 10 397 1 398 0 41 399
                                    2 401 400 398 15 402 1 400 403 0 404 2 41
                                    35 0 15 405 1 137 35 0 406 2 137 0 0 0 407
                                    1 41 0 15 408 2 403 398 0 398 409 0 137 0
                                    410 2 137 9 0 0 411 1 137 2 0 412 1 137 0 0
                                    413 2 45 122 122 122 414 2 415 122 122 122
                                    416 2 0 122 122 122 417 1 419 418 403 420 1
                                    0 421 122 422 1 419 418 403 423 1 0 421 122
                                    424 0 425 0 426 2 41 0 6 425 427 1 0 0 428
                                    429 2 163 2 2 430 431 2 0 0 0 430 432 1 163
                                    137 15 433 1 163 2 2 434 1 0 0 0 435 1 45
                                    430 0 436 1 0 430 0 437 1 45 71 0 438 1 428
                                    439 0 440 1 428 439 0 441 2 444 2 442 443
                                    445 3 449 2 446 447 448 450 2 428 0 0 0 451
                                    1 0 452 0 453 1 0 0 6 454 1 428 0 430 455 1
                                    428 9 10 456 2 10 9 0 27 457 1 0 458 0 459
                                    2 41 9 0 0 460 0 461 0 462 0 124 0 463 2
                                    124 9 0 0 464 1 124 35 0 465 2 461 0 428 35
                                    466 2 461 0 0 0 467 2 428 0 122 27 468 1
                                    428 10 10 469 2 428 0 10 335 470 1 41 471 0
                                    472 1 41 6 0 473 0 428 0 474 1 124 9 0 475
                                    2 428 0 0 35 476 2 428 0 0 0 477 2 428 0 0
                                    0 478 1 45 479 0 480 1 0 479 0 481 4 0 0 0
                                    482 335 27 483 4 0 0 0 10 0 27 484 1 0 38 0
                                    485 1 38 0 335 486 1 38 0 0 487 1 27 9 0
                                    488 2 38 0 489 0 490 2 491 144 2 27 492 3 0
                                    0 0 482 494 495 0 27 0 496 1 0 0 27 497 2
                                    498 0 2 2 499 2 0 0 0 500 501 3 504 502 2
                                    503 502 505 3 0 506 0 503 506 507 3 510 508
                                    2 509 508 511 3 0 512 0 509 512 513 1 45
                                    150 148 514 2 45 158 148 156 515 3 516 502
                                    15 503 502 517 4 520 518 45 503 518 519 521
                                    3 522 508 15 509 508 523 4 526 524 45 509
                                    524 525 527 1 45 0 15 528 1 45 530 0 531 1
                                    6 9 0 532 1 16 15 6 533 1 0 6 0 534 1 45
                                    535 0 536 1 0 535 0 537 3 0 0 0 74 335 538
                                    2 0 0 493 12 539 4 541 2 42 78 15 540 542 3
                                    0 0 0 74 335 543 2 0 0 10 335 544 2 45 0 57
                                    15 545 1 0 546 0 547 1 530 529 0 548 1 0
                                    550 0 551 1 0 14 0 552 2 0 9 0 0 120 2 1
                                    335 0 27 1 1 1 335 0 1 1 1 335 122 1 2 1
                                    335 122 27 1 1 1 335 562 1 2 1 0 0 27 1 1 1
                                    0 0 1 1 1 0 122 1 2 1 0 122 27 1 1 1 0 562
                                    1 1 25 9 0 54 3 1 0 0 0 0 267 3 1 0 0 0 0
                                    265 3 1 0 0 0 0 263 3 1 0 0 0 0 261 3 1 0 0
                                    0 0 259 3 1 0 0 0 0 257 2 1 0 0 0 271 1 0
                                    38 0 485 2 1 560 0 12 1 1 1 563 0 1 1 1 0 0
                                    1 1 1 9 0 1 1 0 74 335 1 1 0 74 0 1 1 1 0 0
                                    204 1 1 0 0 180 2 1 0 0 27 352 2 1 0 0 355
                                    356 2 19 555 0 0 1 2 0 0 0 500 501 3 0 0 0
                                    74 335 543 2 0 0 0 579 1 2 1 0 0 0 275 2 1
                                    0 0 0 273 1 30 421 122 424 1 1 0 0 1 1 1
                                    556 0 1 1 1 0 0 1 2 0 9 0 0 95 2 1 9 0 0 1
                                    1 1 0 0 200 1 1 0 0 176 2 1 0 0 57 86 1 1 9
                                    9 132 1 1 0 0 208 1 1 0 0 184 0 29 0 1 2 1
                                    335 0 27 1 1 1 335 0 1 2 1 335 122 27 1 1 1
                                    335 122 1 1 1 335 562 1 3 1 0 0 122 27 167
                                    2 1 0 0 27 1 1 1 0 0 1 2 1 0 122 27 165 1 1
                                    0 122 1 1 1 0 562 1 1 1 0 0 323 1 15 452 0
                                    453 1 16 71 0 72 1 1 561 0 1 1 14 570 0 1 1
                                    5 578 0 1 1 0 14 0 552 1 0 458 0 459 1 0 18
                                    0 19 1 15 428 0 1 1 16 430 0 437 1 1 107 0
                                    1 1 14 57 0 1 1 5 105 0 1 1 0 6 0 534 1 0
                                    27 0 1 1 0 12 0 13 2 1 0 0 0 1 1 24 553 148
                                    1 2 24 554 148 156 1 2 5 158 148 156 160 1
                                    5 150 148 152 1 1 0 0 111 1 27 555 0 1 2 1
                                    0 0 0 1 2 1 0 0 355 360 2 1 0 0 27 358 1 1
                                    565 335 1 1 1 9 0 1 2 1 0 0 0 255 2 1 0 0 0
                                    235 0 1 0 170 2 1 0 0 0 346 3 12 512 0 509
                                    512 513 3 13 506 0 503 506 507 1 0 0 335 1
                                    1 0 0 0 1 2 25 9 0 0 1 1 0 482 0 1 1 0 10
                                    10 37 1 27 9 0 52 1 31 9 0 1 1 5 0 0 88 1 5
                                    98 0 99 1 1 9 0 73 2 1 0 0 57 1 2 1 546 335
                                    0 1 1 32 122 12 136 4 1 0 0 0 0 0 333 5 33
                                    0 335 335 335 335 0 338 2 0 0 493 12 539 1
                                    0 18 0 1 3 1 0 0 0 0 283 3 1 0 0 0 0 281 1
                                    1 0 0 174 1 1 0 0 377 3 1 0 0 0 0 321 3 1 0
                                    0 0 0 291 3 1 0 0 0 0 289 2 1 564 0 0 1 2 1
                                    0 0 0 1 1 1 0 335 1 1 0 580 0 1 1 1 0 0 253
                                    3 1 0 0 0 0 331 3 1 0 0 0 0 287 3 1 0 0 0 0
                                    285 1 0 74 0 75 1 0 74 335 1 2 0 0 10 335
                                    544 2 0 0 10 0 1 2 1 0 0 0 299 2 1 0 0 0
                                    297 2 1 0 0 0 295 2 1 0 0 0 293 2 1 0 0 0
                                    317 2 1 0 0 0 319 2 1 0 0 0 311 4 1 0 0 0 0
                                    0 329 2 1 0 0 0 315 2 1 0 0 0 313 1 27 546
                                    0 1 1 5 574 0 1 1 25 546 0 547 1 25 550 0
                                    551 2 5 572 0 27 1 2 5 572 0 10 1 1 27 572
                                    0 1 2 0 9 0 27 76 2 0 9 0 10 1 1 23 0 0 1 2
                                    1 0 0 27 385 2 1 0 0 355 387 3 33 0 335 335
                                    0 336 2 1 0 0 0 327 1 0 35 0 1 2 0 582 582
                                    0 1 1 0 581 0 1 2 1 0 0 0 279 2 1 0 0 0 277
                                    1 0 9 0 70 1 0 6 0 1 0 1 9 131 2 1 122 122
                                    122 417 1 1 0 335 1 2 1 0 0 0 1 1 1 0 0 381
                                    1 1 0 0 383 2 0 9 0 27 1 2 0 9 0 0 1 1 1 0
                                    0 348 2 1 0 0 27 350 1 1 0 0 342 1 30 421
                                    122 422 1 1 556 0 1 2 1 567 0 0 1 3 1 569 0
                                    0 0 1 2 1 555 0 0 1 2 1 546 335 0 1 1 1 0 0
                                    172 1 31 9 0 1 2 9 0 0 38 1 2 9 0 0 27 1 4
                                    9 0 0 10 0 27 484 1 9 0 0 1 4 9 0 0 482 335
                                    27 483 4 5 0 0 38 575 577 1 4 5 0 0 38 575
                                    494 1 4 5 0 0 27 35 493 1 4 5 0 0 27 35 576
                                    1 3 0 0 0 10 493 1 3 0 0 0 482 577 1 3 0 0
                                    0 10 576 1 3 0 0 0 482 494 495 3 0 0 0 27
                                    576 1 3 0 0 0 27 493 1 3 0 0 0 38 494 1 3 0
                                    0 0 38 577 1 3 0 0 0 0 0 1 3 0 0 0 335 335
                                    1 2 0 0 0 579 1 3 0 0 0 74 335 538 2 0 0 0
                                    500 1 3 0 0 0 12 0 1 1 1 35 0 1 1 1 0 0 365
                                    1 1 0 0 363 10 0 0 10 0 0 0 0 0 0 0 0 0 1 2
                                    0 0 10 335 1 9 0 0 10 0 0 0 0 0 0 0 0 1 7 0
                                    0 10 0 0 0 0 0 0 1 8 0 0 10 0 0 0 0 0 0 0 1
                                    5 0 0 10 0 0 0 0 1 6 0 0 10 0 0 0 0 0 1 4 0
                                    0 10 0 0 0 1 2 0 0 10 0 1 3 0 0 10 0 0 1 3
                                    1 0 0 0 0 309 1 1 0 0 301 2 1 0 0 0 307 2 1
                                    0 0 0 305 1 1 0 0 303 2 1 566 0 0 1 2 0 0 0
                                    0 1 1 0 0 0 1 1 1 0 0 379 1 1 0 0 233 3 5 0
                                    0 27 35 1 3 5 0 0 38 575 1 2 5 0 0 38 1 2 5
                                    0 0 27 1 1 1 0 0 89 1 1 98 0 101 1 32 0 0
                                    435 1 1 0 0 210 1 1 0 0 186 1 1 0 0 206 1 1
                                    0 0 182 1 1 0 0 202 1 1 0 0 178 1 9 479 0
                                    481 1 10 509 0 1 1 11 503 0 1 1 1 0 556 1 2
                                    8 0 0 0 1 2 8 0 0 0 1 1 15 0 428 429 1 22 0
                                    430 1 1 21 0 57 61 1 1 0 557 1 1 1 0 558 1
                                    1 1 0 559 1 1 1 0 107 110 1 1 0 0 1 1 5 0
                                    98 104 1 5 0 105 106 1 0 0 6 454 1 0 0 27
                                    497 1 0 0 12 140 1 0 535 0 537 1 3 555 0 1
                                    3 1 0 0 0 0 325 0 5 35 1 1 0 0 335 1 1 0 0
                                    0 1 2 1 0 0 0 344 2 1 0 0 0 239 2 1 0 0 0
                                    243 2 1 0 0 0 237 2 1 0 0 0 241 1 0 9 10 11
                                    1 1 0 0 216 1 1 0 0 192 2 1 9 0 0 1 1 1 0 0
                                    212 1 1 0 0 188 1 1 0 0 220 1 1 0 0 196 5 0
                                    0 27 0 0 0 0 1 2 0 0 27 335 1 4 0 0 27 0 0
                                    0 1 2 0 0 27 0 1 3 0 0 27 0 0 1 2 5 9 0 0 1
                                    2 1 0 0 0 269 1 1 0 0 251 1 1 0 0 249 1 1 0
                                    0 247 1 1 0 0 245 1 1 0 0 222 1 1 0 0 198 1
                                    1 0 0 218 1 1 0 0 194 1 1 0 0 214 1 1 0 0
                                    190 1 1 0 0 225 2 23 0 0 57 91 2 1 0 0 0 83
                                    2 1 0 0 430 432 2 27 0 0 35 90 2 27 0 0 92
                                    93 0 25 0 47 1 1 0 0 369 1 1 0 0 373 0 27 0
                                    49 1 1 0 0 227 2 1 0 0 0 229 1 1 0 0 367 3
                                    5 0 0 38 575 1 3 5 0 0 27 35 1 2 5 0 0 27 1
                                    2 5 0 0 38 1 1 1 0 0 371 1 1 0 0 375 2 1 0
                                    0 0 231 2 0 9 0 0 96 2 23 0 0 0 69 2 1 0 98
                                    98 143 1 19 0 0 56 2 19 0 0 0 67 2 25 0 0 0
                                    65 2 19 0 57 0 59 2 25 0 35 0 1 2 25 0 92 0
                                    1 2 2 0 6 0 1 2 2 0 0 6 1 2 1 0 430 0 1 2 1
                                    0 0 430 1 2 27 0 0 0 63)))))
           '|lookupComplete|)) 
