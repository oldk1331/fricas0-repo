
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
         ((|vl2| (|List| (|Kernel| $))) (#1=#:G182 NIL) (|z| NIL)
          (#2=#:G181 NIL) (|vl1| (|List| (|Symbol|)))
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
                         (SPADCALL (SPADCALL |args| 1 (QREFELT $ 81))
                                   (QREFELT $ 86))
                         $)
                        (SPADCALL |args| 2 (QREFELT $ 81)) (QREFELT $ 89)))
                      (#2='T
                       (SPADCALL (SPADCALL |args| (QREFELT $ 90))
                                 (SPADCALL |n| (SPADCALL |args| (QREFELT $ 91))
                                           (QREFELT $ 59))
                                 (QREFELT $ 89)))))))
                  (#2#
                   (|EXPR;reduc| (SPADCALL |x| |n| (QREFELT $ 82))
                    (SPADCALL |x| (QREFELT $ 86)) $))))))) 

(SDEFUN |EXPR;^;$Nni$;19| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (COND ((EQL |n| 0) (|spadConstant| $ 49)) ((EQL |n| 1) |x|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT $ 94)) |n| (QREFELT $ 92))
                (SPADCALL (SPADCALL |x| (QREFELT $ 95)) |n| (QREFELT $ 92))
                (QREFELT $ 69))))) 

(SDEFUN |EXPR;^;$I$;20| ((|x| $) (|n| |Integer|) ($ $))
        (COND ((EQL |n| 0) (|spadConstant| $ 49)) ((EQL |n| 1) |x|)
              (#1='T
               (COND
                ((EQL |n| -1)
                 (SPADCALL (|spadConstant| $ 49) |x| (QREFELT $ 69)))
                (#1#
                 (SPADCALL
                  (SPADCALL (SPADCALL |x| (QREFELT $ 94)) |n| (QREFELT $ 92))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 95)) |n| (QREFELT $ 92))
                  (QREFELT $ 69))))))) 

(SDEFUN |EXPR;^;$Pi$;21| ((|x| $) (|n| |PositiveInteger|) ($ $))
        (COND ((EQL |n| 1) |x|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT $ 94)) |n| (QREFELT $ 92))
                (SPADCALL (SPADCALL |x| (QREFELT $ 95)) |n| (QREFELT $ 92))
                (QREFELT $ 69))))) 

(SDEFUN |EXPR;smaller?;2$B;22| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 100))) 

(SDEFUN |EXPR;=;2$B;23| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |x| |y| (QREFELT $ 67)) (|spadConstant| $ 46)
                  (QREFELT $ 51))) 

(SDEFUN |EXPR;numer;$Smp;24|
        ((|x| $) ($ |SparseMultivariatePolynomial| R (|Kernel| $)))
        (SPADCALL |x| (QREFELT $ 103))) 

(SDEFUN |EXPR;denom;$Smp;25|
        ((|x| $) ($ |SparseMultivariatePolynomial| R (|Kernel| $)))
        (SPADCALL |x| (QREFELT $ 106))) 

(SDEFUN |EXPR;coerce;Smp$;26|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) ($ $))
        (CONS |p| (|spadConstant| $ 83))) 

(SDEFUN |EXPR;coerce;P$;27| ((|p| |Polynomial| R) ($ $))
        (SPROG ((|en| (|SparseMultivariatePolynomial| R (|Kernel| $))))
               (SEQ (LETT |en| (|EXPR;poly_to_MP| |p| $) |EXPR;coerce;P$;27|)
                    (EXIT (CONS |en| (|spadConstant| $ 83)))))) 

(SDEFUN |EXPR;coerce;F$;28| ((|pq| |Fraction| (|Polynomial| R)) ($ $))
        (SPROG
         ((|ed| #1=(|SparseMultivariatePolynomial| R (|Kernel| $))) (|en| #1#))
         (SEQ
          (LETT |en| (|EXPR;poly_to_MP| (SPADCALL |pq| (QREFELT $ 113)) $)
                . #2=(|EXPR;coerce;F$;28|))
          (LETT |ed| (|EXPR;poly_to_MP| (SPADCALL |pq| (QREFELT $ 114)) $)
                . #2#)
          (EXIT (CONS |en| |ed|))))) 

(SDEFUN |EXPR;reduce;2$;29| ((|x| $) ($ $))
        (|EXPR;reduc| |x| (SPADCALL |x| (QREFELT $ 86)) $)) 

(SDEFUN |EXPR;commonk| ((|x| $) (|y| $) ($ |List| (|Kernel| $)))
        (|EXPR;commonk0| (SPADCALL |x| (QREFELT $ 86))
         (SPADCALL |y| (QREFELT $ 86)) $)) 

(SDEFUN |EXPR;algkernels| ((|l| |List| (|Kernel| $)) ($ |List| (|Kernel| $)))
        (SPROG NIL
               (SPADCALL (CONS #'|EXPR;algkernels!0| (VECTOR (QREFELT $ 8) $))
                         |l| (QREFELT $ 118)))) 

(SDEFUN |EXPR;algkernels!0| ((|x| NIL) ($$ NIL))
        (PROG ($ ALGOP)
          (LETT $ (QREFELT $$ 1) . #1=(|EXPR;algkernels|))
          (LETT ALGOP (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 31)) ALGOP (QREFELT $ 28)))))) 

(SDEFUN |EXPR;toprat| ((|f| $) ($ $))
        (SPADCALL |f| (SPADCALL |f| (QREFELT $ 86)) (QREFELT $ 120))) 

(SDEFUN |EXPR;simple_root| ((|r| |Kernel| $) ($ |Boolean|))
        (SPROG ((|a| ($)) (|al| (|List| $)))
               (SEQ
                (COND
                 ((SPADCALL |r| '|nthRoot| (QREFELT $ 121))
                  (SEQ
                   (LETT |al| (SPADCALL |r| (QREFELT $ 79))
                         . #1=(|EXPR;simple_root|))
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |al| 2 (QREFELT $ 81))
                                (SPADCALL 2 (QREFELT $ 61)) (QREFELT $ 122))
                      'NIL)
                     (#2='T
                      (SEQ (LETT |a| (SPADCALL |al| 1 (QREFELT $ 81)) . #1#)
                           (EXIT
                            (COND
                             ((SPADCALL
                               (LENGTH
                                (|EXPR;algkernels|
                                 (SPADCALL |a| (QREFELT $ 75)) $))
                               0 (QREFELT $ 123))
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
          (LETT |an| (SPADCALL |a| (QREFELT $ 105)) . #3#)
          (LETT |dn| (SPADCALL |a| (QREFELT $ 107)) . #3#)
          (LETT |dp|
                (SPADCALL (SPADCALL |x| (QREFELT $ 107)) |r| (QREFELT $ 125))
                . #3#)
          (LETT |n0| (SPADCALL |x| (QREFELT $ 105)) . #3#)
          (LETT |c1| (SPADCALL |dp| (QREFELT $ 127)) . #3#)
          (LETT |c0| (SPADCALL (SPADCALL |dp| (QREFELT $ 128)) (QREFELT $ 127))
                . #3#)
          (LETT |n1|
                (SPADCALL |dn|
                          (SPADCALL (SPADCALL |c0| |n0| (QREFELT $ 129))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 83) |r| 1
                                                (QREFELT $ 130))
                                      |c1| (QREFELT $ 129))
                                     |n0| (QREFELT $ 129))
                                    (QREFELT $ 131))
                          (QREFELT $ 129))
                . #3#)
          (LETT |d1|
                (SPADCALL
                 (SPADCALL (SPADCALL |c0| |c0| (QREFELT $ 129)) |dn|
                           (QREFELT $ 129))
                 (SPADCALL (SPADCALL |an| |c1| (QREFELT $ 129)) |c1|
                           (QREFELT $ 129))
                 (QREFELT $ 131))
                . #3#)
          (EXIT
           (|EXPR;reduc| (SPADCALL |n1| |d1| (QREFELT $ 132)) (LIST |r|) $))))) 

(PUT '|EXPR;getSimplifyDenomsFlag;B;35| '|SPADreplace|
     '(XLAM NIL |algreduc_flag|)) 

(SDEFUN |EXPR;getSimplifyDenomsFlag;B;35| (($ |Boolean|)) |algreduc_flag|) 

(SDEFUN |EXPR;setSimplifyDenomsFlag;2B;36| ((|x| |Boolean|) ($ |Boolean|))
        (SPROG ((|res| (|Boolean|)))
               (SEQ
                (LETT |res| (SPADCALL (QREFELT $ 133))
                      |EXPR;setSimplifyDenomsFlag;2B;36|)
                (SETF |algreduc_flag| |x|) (EXIT |res|)))) 

(SDEFUN |EXPR;algreduc| ((|x| $) (|ckl| |List| (|Kernel| $)) ($ $))
        (SPROG
         ((|x1| ($)) (|q| (|SparseUnivariatePolynomial| $)) (#1=#:G243 NIL)
          (|k| NIL) (|sas| (|SingletonAsOrderedSet|)) (#2=#:G242 NIL)
          (|r| (|Kernel| $)) (|akl| (|List| (|Kernel| $))))
         (SEQ
          (EXIT
           (SEQ (LETT |x1| (|EXPR;reduc| |x| |ckl| $) . #3=(|EXPR;algreduc|))
                (EXIT
                 (COND
                  ((SPADCALL (QREFELT $ 133))
                   (SEQ
                    (LETT |akl|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 83)
                                     (SPADCALL |x1| (QREFELT $ 107))
                                     (QREFELT $ 132))
                           (QREFELT $ 86))
                          . #3#)
                    (EXIT
                     (COND ((EQL (LENGTH |akl|) 0) |x1|)
                           (#4='T
                            (SEQ
                             (COND
                              ((EQL (LENGTH |akl|) 1)
                               (SEQ
                                (LETT |r| (SPADCALL |akl| 1 (QREFELT $ 135))
                                      . #3#)
                                (EXIT
                                 (COND
                                  ((|EXPR;simple_root| |r| $)
                                   (PROGN
                                    (LETT #2# (|EXPR;root_reduce| |x| |r| $)
                                          . #3#)
                                    (GO #5=#:G241))))))))
                             (LETT |sas| (SPADCALL (QREFELT $ 137)) . #3#)
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
                                                             (QREFELT $ 138))
                                                   (QREFELT $ 141))
                                         . #3#)
                                   (EXIT
                                    (LETT |x1|
                                          (SPADCALL
                                           (SPADCALL |q| |sas|
                                                     (SPADCALL |k|
                                                               (QREFELT $ 142))
                                                     (QREFELT $ 143))
                                           (QREFELT $ 144))
                                          . #3#)))
                                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT |x1|)))))))
                  (#4# |x1|)))))
          #5# (EXIT #2#)))) 

(SDEFUN |EXPR;/;2Smp$;38|
        ((|x| |SparseMultivariatePolynomial| R . #1=((|Kernel| $)))
         (|y| |SparseMultivariatePolynomial| R . #1#) ($ $))
        (|EXPR;reduc| (SPADCALL |x| |y| (QREFELT $ 132))
         (|EXPR;commonk| (SPADCALL |x| (|spadConstant| $ 83) (QREFELT $ 132))
          (SPADCALL |y| (|spadConstant| $ 83) (QREFELT $ 132)) $)
         $)) 

(SDEFUN |EXPR;reducedSystem;MM;39| ((|m| |Matrix| $) ($ |Matrix| R))
        (SPROG
         ((|mm| (|Matrix| (|SparseMultivariatePolynomial| R (|Kernel| $)))))
         (SEQ
          (LETT |mm|
                (SPADCALL
                 (SPADCALL (CONS (|function| |EXPR;toprat|) $) |m|
                           (QREFELT $ 148))
                 (QREFELT $ 151))
                |EXPR;reducedSystem;MM;39|)
          (EXIT (SPADCALL |mm| (QREFELT $ 153)))))) 

(SDEFUN |EXPR;reducedSystem;MVR;40|
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
                           (QREFELT $ 148))
                 (SPADCALL (CONS (|function| |EXPR;toprat|) $) |v|
                           (QREFELT $ 156))
                 (QREFELT $ 159))
                |EXPR;reducedSystem;MVR;40|)
          (EXIT (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT $ 161)))))) 

(SDEFUN |EXPR;commonk0|
        ((|x| |List| (|Kernel| $)) (|y| |List| (|Kernel| $))
         ($ |List| (|Kernel| $)))
        (SPROG ((|ans| (|List| (|Kernel| $))) (#1=#:G258 NIL) (|k| NIL))
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
                            ((SPADCALL |k| |y| (QREFELT $ 163))
                             (LETT |ans| (SPADCALL |k| |ans| (QREFELT $ 164))
                                   . #2#)))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |EXPR;rootOf;SupS$;42|
        ((|x| |SparseUnivariatePolynomial| $) (|v| |Symbol|) ($ $))
        (SPADCALL |x| |v| (QREFELT $ 166))) 

(SDEFUN |EXPR;rootSum;$SupS$;43|
        ((|x| $) (|p| |SparseUnivariatePolynomial| $) (|v| |Symbol|) ($ $))
        (SPADCALL |x| |p| |v| (QREFELT $ 168))) 

(SDEFUN |EXPR;pi;$;44| (($ $)) (SPADCALL (QREFELT $ 171))) 

(SDEFUN |EXPR;exp;2$;45| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 173))) 

(SDEFUN |EXPR;log;2$;46| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 175))) 

(SDEFUN |EXPR;sin;2$;47| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 177))) 

(SDEFUN |EXPR;cos;2$;48| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 179))) 

(SDEFUN |EXPR;tan;2$;49| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 181))) 

(SDEFUN |EXPR;cot;2$;50| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 183))) 

(SDEFUN |EXPR;sec;2$;51| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 185))) 

(SDEFUN |EXPR;csc;2$;52| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 187))) 

(SDEFUN |EXPR;asin;2$;53| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 189))) 

(SDEFUN |EXPR;acos;2$;54| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 191))) 

(SDEFUN |EXPR;atan;2$;55| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 193))) 

(SDEFUN |EXPR;acot;2$;56| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 195))) 

(SDEFUN |EXPR;asec;2$;57| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 197))) 

(SDEFUN |EXPR;acsc;2$;58| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 199))) 

(SDEFUN |EXPR;sinh;2$;59| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 201))) 

(SDEFUN |EXPR;cosh;2$;60| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 203))) 

(SDEFUN |EXPR;tanh;2$;61| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 205))) 

(SDEFUN |EXPR;coth;2$;62| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 207))) 

(SDEFUN |EXPR;sech;2$;63| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 209))) 

(SDEFUN |EXPR;csch;2$;64| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 211))) 

(SDEFUN |EXPR;asinh;2$;65| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 213))) 

(SDEFUN |EXPR;acosh;2$;66| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 215))) 

(SDEFUN |EXPR;atanh;2$;67| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 217))) 

(SDEFUN |EXPR;acoth;2$;68| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 219))) 

(SDEFUN |EXPR;asech;2$;69| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 221))) 

(SDEFUN |EXPR;acsch;2$;70| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 223))) 

(SDEFUN |EXPR;abs;2$;71| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 226))) 

(SDEFUN |EXPR;Gamma;2$;72| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 228))) 

(SDEFUN |EXPR;Gamma;3$;73| ((|a| $) (|x| $) ($ $))
        (SPADCALL |a| |x| (QREFELT $ 230))) 

(SDEFUN |EXPR;Beta;3$;74| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 232))) 

(SDEFUN |EXPR;digamma;2$;75| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 234))) 

(SDEFUN |EXPR;polygamma;3$;76| ((|k| $) (|x| $) ($ $))
        (SPADCALL |k| |x| (QREFELT $ 236))) 

(SDEFUN |EXPR;besselJ;3$;77| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 238))) 

(SDEFUN |EXPR;besselY;3$;78| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 240))) 

(SDEFUN |EXPR;besselI;3$;79| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 242))) 

(SDEFUN |EXPR;besselK;3$;80| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 244))) 

(SDEFUN |EXPR;airyAi;2$;81| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 246))) 

(SDEFUN |EXPR;airyAiPrime;2$;82| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 248))) 

(SDEFUN |EXPR;airyBi;2$;83| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 250))) 

(SDEFUN |EXPR;airyBiPrime;2$;84| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 252))) 

(SDEFUN |EXPR;lambertW;2$;85| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 254))) 

(SDEFUN |EXPR;polylog;3$;86| ((|s| $) (|x| $) ($ $))
        (SPADCALL |s| |x| (QREFELT $ 256))) 

(SDEFUN |EXPR;weierstrassP;4$;87| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 258))) 

(SDEFUN |EXPR;weierstrassPPrime;4$;88| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 260))) 

(SDEFUN |EXPR;weierstrassSigma;4$;89| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 262))) 

(SDEFUN |EXPR;weierstrassZeta;4$;90| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 264))) 

(SDEFUN |EXPR;weierstrassPInverse;4$;91| ((|g2| $) (|g3| $) (|z| $) ($ $))
        (SPADCALL |g2| |g3| |z| (QREFELT $ 266))) 

(SDEFUN |EXPR;whittakerM;4$;92| ((|k| $) (|m| $) (|z| $) ($ $))
        (SPADCALL |k| |m| |z| (QREFELT $ 268))) 

(SDEFUN |EXPR;whittakerW;4$;93| ((|k| $) (|m| $) (|z| $) ($ $))
        (SPADCALL |k| |m| |z| (QREFELT $ 270))) 

(SDEFUN |EXPR;angerJ;3$;94| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 272))) 

(SDEFUN |EXPR;weberE;3$;95| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 274))) 

(SDEFUN |EXPR;struveH;3$;96| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 276))) 

(SDEFUN |EXPR;struveL;3$;97| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 278))) 

(SDEFUN |EXPR;hankelH1;3$;98| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 280))) 

(SDEFUN |EXPR;hankelH2;3$;99| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 282))) 

(SDEFUN |EXPR;lommelS1;4$;100| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 284))) 

(SDEFUN |EXPR;lommelS2;4$;101| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 286))) 

(SDEFUN |EXPR;kummerM;4$;102| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 288))) 

(SDEFUN |EXPR;kummerU;4$;103| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 290))) 

(SDEFUN |EXPR;legendreP;4$;104| ((|nu| $) (|mu| $) (|z| $) ($ $))
        (SPADCALL |nu| |mu| |z| (QREFELT $ 292))) 

(SDEFUN |EXPR;legendreQ;4$;105| ((|nu| $) (|mu| $) (|z| $) ($ $))
        (SPADCALL |nu| |mu| |z| (QREFELT $ 294))) 

(SDEFUN |EXPR;kelvinBei;3$;106| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 296))) 

(SDEFUN |EXPR;kelvinBer;3$;107| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 298))) 

(SDEFUN |EXPR;kelvinKei;3$;108| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 300))) 

(SDEFUN |EXPR;kelvinKer;3$;109| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 302))) 

(SDEFUN |EXPR;ellipticK;2$;110| ((|m| $) ($ $)) (SPADCALL |m| (QREFELT $ 304))) 

(SDEFUN |EXPR;ellipticE;2$;111| ((|m| $) ($ $)) (SPADCALL |m| (QREFELT $ 306))) 

(SDEFUN |EXPR;ellipticE;3$;112| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 308))) 

(SDEFUN |EXPR;ellipticF;3$;113| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 310))) 

(SDEFUN |EXPR;ellipticPi;4$;114| ((|z| $) (|n| $) (|m| $) ($ $))
        (SPADCALL |z| |n| |m| (QREFELT $ 312))) 

(SDEFUN |EXPR;jacobiSn;3$;115| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 314))) 

(SDEFUN |EXPR;jacobiCn;3$;116| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 316))) 

(SDEFUN |EXPR;jacobiDn;3$;117| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 318))) 

(SDEFUN |EXPR;jacobiZeta;3$;118| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 320))) 

(SDEFUN |EXPR;jacobiTheta;3$;119| ((|q| $) (|z| $) ($ $))
        (SPADCALL |q| |z| (QREFELT $ 322))) 

(SDEFUN |EXPR;lerchPhi;4$;120| ((|z| $) (|s| $) (|a| $) ($ $))
        (SPADCALL |z| |s| |a| (QREFELT $ 324))) 

(SDEFUN |EXPR;riemannZeta;2$;121| ((|z| $) ($ $))
        (SPADCALL |z| (QREFELT $ 326))) 

(SDEFUN |EXPR;charlierC;4$;122| ((|n| $) (|a| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |z| (QREFELT $ 328))) 

(SDEFUN |EXPR;hermiteH;3$;123| ((|n| $) (|z| $) ($ $))
        (SPADCALL |n| |z| (QREFELT $ 330))) 

(SDEFUN |EXPR;jacobiP;5$;124| ((|n| $) (|a| $) (|b| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |b| |z| (QREFELT $ 332))) 

(SDEFUN |EXPR;laguerreL;4$;125| ((|n| $) (|a| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |z| (QREFELT $ 334))) 

(SDEFUN |EXPR;meixnerM;5$;126| ((|n| $) (|b| $) (|c| $) (|z| $) ($ $))
        (SPADCALL |n| |b| |c| |z| (QREFELT $ 336))) 

(SDEFUN |EXPR;hypergeometricF;2L2$;127|
        ((|la| . #1=(|List| $)) (|lb| . #1#) (|x| $) ($ $))
        (SPADCALL |la| |lb| |x| (QREFELT $ 338))) 

(SDEFUN |EXPR;meijerG;4L2$;128|
        ((|la| . #1=(|List| $)) (|lb| . #1#) (|lc| . #1#) (|ld| . #1#) (|x| $)
         ($ $))
        (SPADCALL |la| |lb| |lc| |ld| |x| (QREFELT $ 341))) 

(SDEFUN |EXPR;^;3$;129| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 344))) 

(SDEFUN |EXPR;factorial;2$;130| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 345))) 

(SDEFUN |EXPR;binomial;3$;131| ((|n| $) (|m| $) ($ $))
        (SPADCALL |n| |m| (QREFELT $ 347))) 

(SDEFUN |EXPR;permutation;3$;132| ((|n| $) (|m| $) ($ $))
        (SPADCALL |n| |m| (QREFELT $ 349))) 

(SDEFUN |EXPR;factorials;2$;133| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 351))) 

(SDEFUN |EXPR;factorials;$S$;134| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 353))) 

(SDEFUN |EXPR;summation;$S$;135| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 355))) 

(SDEFUN |EXPR;summation;$Sb$;136| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 358))) 

(SDEFUN |EXPR;product;$S$;137| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 361))) 

(SDEFUN |EXPR;product;$Sb$;138| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 363))) 

(SDEFUN |EXPR;erf;2$;139| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 366))) 

(SDEFUN |EXPR;erfi;2$;140| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 368))) 

(SDEFUN |EXPR;Ei;2$;141| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 370))) 

(SDEFUN |EXPR;Si;2$;142| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 372))) 

(SDEFUN |EXPR;Ci;2$;143| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 374))) 

(SDEFUN |EXPR;Shi;2$;144| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 376))) 

(SDEFUN |EXPR;Chi;2$;145| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 378))) 

(SDEFUN |EXPR;li;2$;146| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 380))) 

(SDEFUN |EXPR;dilog;2$;147| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 382))) 

(SDEFUN |EXPR;fresnelS;2$;148| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 384))) 

(SDEFUN |EXPR;fresnelC;2$;149| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 386))) 

(SDEFUN |EXPR;integral;$S$;150| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 388))) 

(SDEFUN |EXPR;integral;$Sb$;151| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 390))) 

(SDEFUN |EXPR;operator;2Bo;152| ((|op| . #1=(|BasicOperator|)) ($ . #1#))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |op| (QREFELT $ 392))
                  (SPADCALL |op| (QREFELT $ 393)))
                 ((SPADCALL |op| (QREFELT $ 394))
                  (SPADCALL |op| (QREFELT $ 395)))
                 ((SPADCALL |op| (QREFELT $ 396))
                  (SPADCALL |op| (QREFELT $ 397)))
                 ((SPADCALL |op| (QREFELT $ 398))
                  (SPADCALL |op| (QREFELT $ 399)))
                 ((SPADCALL |op| (QREFELT $ 400))
                  (SPADCALL |op| (QREFELT $ 401)))
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
                         |EXPR;operator;2Bo;152|)
                   (EXIT
                    (COND
                     ((QEQCAR |n| 1)
                      (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QREFELT $ 34)))
                     (#2#
                      (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QCDR |n|)
                                (QREFELT $ 36))))))))))) 

(SDEFUN |EXPR;reduc| ((|x| $) (|l| |List| (|Kernel| $)) ($ $))
        (SPROG
         ((|p| (|SparseUnivariatePolynomial| $)) (#1=#:G387 NIL) (|k| NIL))
         (SEQ
          (SEQ (LETT |k| NIL . #2=(|EXPR;reduc|)) (LETT #1# |l| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |p| (SPADCALL |k| (QREFELT $ 138)) . #2#)
                    (EXIT
                     (LETT |x|
                           (SPADCALL
                            (|EXPR;evl| (SPADCALL |x| (QREFELT $ 105)) |k| |p|
                             $)
                            (|EXPR;evl| (SPADCALL |x| (QREFELT $ 107)) |k| |p|
                             $)
                            (QREFELT $ 68))
                           . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |x|)))) 

(SDEFUN |EXPR;evl0|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) (|k| |Kernel| $)
         ($ |SparseUnivariatePolynomial|
          (|Fraction| (|SparseMultivariatePolynomial| R (|Kernel| $)))))
        (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 402)) |k| (QREFELT $ 405))
                  (QREFELT $ 407))) 

(SDEFUN |EXPR;evl|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) (|k| |Kernel| $)
         (|m| |SparseUnivariatePolynomial| $)
         ($ |Fraction| (|SparseMultivariatePolynomial| R (|Kernel| $))))
        (COND
         ((< (SPADCALL |p| |k| (QREFELT $ 408)) (SPADCALL |m| (QREFELT $ 409)))
          (SPADCALL |p| (QREFELT $ 402)))
         ('T
          (SPADCALL (SPADCALL (|EXPR;evl0| |p| |k| $) |m| (QREFELT $ 410))
                    (SPADCALL (SPADCALL |k| (QREFELT $ 411)) (QREFELT $ 402))
                    (QREFELT $ 412))))) 

(SDEFUN |EXPR;noalg?| ((|p| |SparseUnivariatePolynomial| $) ($ |Boolean|))
        (SPROG ((#1=#:G396 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |p| (|spadConstant| $ 413)
                                    (QREFELT $ 414)))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (NULL
                             (|EXPR;algkernels|
                              (SPADCALL (SPADCALL |p| (QREFELT $ 415))
                                        (QREFELT $ 75))
                              $)))
                           (PROGN
                            (LETT #1# 'NIL . #2=(|EXPR;noalg?|))
                            (GO #3=#:G395)))
                          ('T
                           (LETT |p| (SPADCALL |p| (QREFELT $ 416)) . #2#)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |EXPR;algkers|
        ((|p| |SparseUnivariatePolynomial| $) ($ |List| (|Kernel| $)))
        (SPROG ((|res| (|List| (|Kernel| $))) (|lc| ($)))
               (SEQ (LETT |res| NIL . #1=(|EXPR;algkers|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| $ 413)
                                      (QREFELT $ 414)))
                           (GO G191)))
                         (SEQ (LETT |lc| (SPADCALL |p| (QREFELT $ 415)) . #1#)
                              (LETT |res|
                                    (SPADCALL (SPADCALL |lc| (QREFELT $ 86))
                                              |res| (QREFELT $ 417))
                                    . #1#)
                              (EXIT
                               (LETT |p| (SPADCALL |p| (QREFELT $ 416))
                                     . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |res| (QREFELT $ 418)))))) 

(SDEFUN |EXPR;algpars| ((|lk| |List| (|Kernel| $)) ($ |List| (|Kernel| $)))
        (SPROG
         ((|res| (|List| (|Kernel| $))) (|arg| (|List| $)) (#1=#:G407 NIL)
          (|k| NIL))
         (SEQ (LETT |res| NIL . #2=(|EXPR;algpars|))
              (SEQ (LETT |k| NIL . #2#) (LETT #1# |lk| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |k| '|nthRoot| (QREFELT $ 121)))
                      (COND
                       ((NULL (SPADCALL |k| '|rootOf| (QREFELT $ 121)))
                        (EXIT (|error| "apars: unknown kernel"))))))
                    (LETT |arg| (SPADCALL |k| (QREFELT $ 79)) . #2#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL (SPADCALL |arg| 1 (QREFELT $ 81))
                                      (QREFELT $ 75))
                            |res| (QREFELT $ 417))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT $ 418)))))) 

(SDEFUN |EXPR;trivial_denoms|
        ((|p| |SparseUnivariatePolynomial| $) ($ |Boolean|))
        (SPADCALL (CONS #'|EXPR;trivial_denoms!0| $)
                  (SPADCALL |p| (QREFELT $ 420)) (QREFELT $ 422))) 

(SDEFUN |EXPR;trivial_denoms!0| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 107)) (|spadConstant| $ 83)
                  (QREFELT $ 419))) 

(SDEFUN |EXPR;SUP_to_SUPP|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| $))))
        (SPADCALL (ELT $ 105) |p| (QREFELT $ 425))) 

(SDEFUN |EXPR;def_poly|
        ((|k| |Kernel| $)
         ($ |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| $))))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G418 NIL)
          (|p1| (|SparseMultivariatePolynomial| R (|Kernel| $))) (|arg2| ($))
          (|arg1| ($)) (|args| (|List| $)))
         (SEQ
          (LETT |args| (SPADCALL |k| (QREFELT $ 79)) . #2=(|EXPR;def_poly|))
          (LETT |arg1| (SPADCALL |args| (QREFELT $ 90)) . #2#)
          (LETT |arg2| (SPADCALL |args| 2 (QREFELT $ 81)) . #2#)
          (EXIT
           (COND
            ((SPADCALL |k| '|rootOf| (QREFELT $ 121))
             (SEQ (LETT |p1| (SPADCALL |arg1| (QREFELT $ 105)) . #2#)
                  (EXIT
                   (SPADCALL |p1| (SPADCALL |arg2| (QREFELT $ 13))
                             (QREFELT $ 125)))))
            ((SPADCALL |k| '|nthRoot| (QREFELT $ 121))
             (SEQ
              (LETT |n|
                    (PROG1 (LETT #1# (SPADCALL |arg2| (QREFELT $ 426)) . #2#)
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#))
                    . #2#)
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |arg1| (QREFELT $ 107)) |n|
                          (QREFELT $ 427))
                (SPADCALL (SPADCALL |arg1| (QREFELT $ 105)) (QREFELT $ 428))
                (QREFELT $ 429)))))
            ('T (|error| "def_poly : unknown kernel"))))))) 

(SDEFUN |EXPR;varmap1|
        ((|k0| |Kernel| $) (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|))
         ($ |Symbol|))
        (SPROG
         ((#1=#:G426 NIL) (#2=#:G427 NIL) (|k| NIL) (#3=#:G428 NIL) (|s| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |s| NIL . #4=(|EXPR;varmap1|)) (LETT #3# |ls| . #4#)
                 (LETT |k| NIL . #4#) (LETT #2# |lk| . #4#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #4#) NIL)
                       (ATOM #3#) (PROGN (LETT |s| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |k| |k0| (QREFELT $ 430))
                     (PROGN (LETT #1# |s| . #4#) (GO #5=#:G425))))))
                 (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#)) . #4#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT (|error| "varmap1: kernel not on the list"))))
          #5# (EXIT #1#)))) 

(SDEFUN |EXPR;varmap2|
        ((|s0| |Symbol|) (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|))
         ($ |Kernel| $))
        (SPROG
         ((#1=#:G432 NIL) (#2=#:G433 NIL) (|k| NIL) (#3=#:G434 NIL) (|s| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |s| NIL . #4=(|EXPR;varmap2|)) (LETT #3# |ls| . #4#)
                 (LETT |k| NIL . #4#) (LETT #2# |lk| . #4#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #4#) NIL)
                       (ATOM #3#) (PROGN (LETT |s| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQUAL |s| |s0|)
                     (PROGN (LETT #1# |k| . #4#) (GO #5=#:G431))))))
                 (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#)) . #4#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT (|error| "varmap2: symbol not on the list"))))
          #5# (EXIT #1#)))) 

(SDEFUN |EXPR;MP_to_PI|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $))
         (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|))
         ($ |Polynomial| (|Integer|)))
        (SPROG NIL
               (SPADCALL (CONS #'|EXPR;MP_to_PI!0| (VECTOR |ls| |lk| $))
                         (ELT $ 435) |p| (QREFELT $ 439)))) 

(SDEFUN |EXPR;MP_to_PI!0| ((|k| NIL) ($$ NIL))
        (PROG ($ |lk| |ls|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;MP_to_PI|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |ls| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| $ 432) (|EXPR;varmap1| |k| |lk| |ls| $)
                      (|spadConstant| $ 433) (QREFELT $ 434)))))) 

(SDEFUN |EXPR;SUPP_to_PI|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| $)))
         (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|)) (|xk| |Kernel| $)
         ($ |Polynomial| (|Integer|)))
        (SPROG ((|p2| (|SparseMultivariatePolynomial| R (|Kernel| $))))
               (SEQ
                (LETT |p2| (SPADCALL |p| |xk| (QREFELT $ 440))
                      |EXPR;SUPP_to_PI|)
                (EXIT (|EXPR;MP_to_PI| |p2| |lk| |ls| $))))) 

(SDEFUN |EXPR;SUP_to_PI|
        ((|p| |SparseUnivariatePolynomial| $) (|lk| |List| (|Kernel| $))
         (|ls| |List| (|Symbol|)) (|xk| |Kernel| $)
         ($ |Polynomial| (|Integer|)))
        (SPROG
         ((|p1|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| $)))))
         (SEQ (LETT |p1| (|EXPR;SUP_to_SUPP| |p| $) |EXPR;SUP_to_PI|)
              (EXIT (|EXPR;SUPP_to_PI| |p1| |lk| |ls| |xk| $))))) 

(SDEFUN |EXPR;PI_to_SUP|
        ((|p| |Polynomial| (|Integer|)) (|lk| |List| (|Kernel| $))
         (|ls| |List| (|Symbol|)) (|xk| |Kernel| $)
         ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|p3| (|SparseUnivariatePolynomial| $))
          (|p2|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| $))))
          (|p1| (|SparseMultivariatePolynomial| R (|Kernel| $))))
         (SEQ
          (LETT |p1|
                (SPADCALL (CONS #'|EXPR;PI_to_SUP!0| (VECTOR |ls| |lk| $))
                          (ELT $ 444) |p| (QREFELT $ 448))
                . #1=(|EXPR;PI_to_SUP|))
          (LETT |p2| (SPADCALL |p1| |xk| (QREFELT $ 125)) . #1#)
          (EXIT
           (LETT |p3| (SPADCALL (ELT $ 109) |p2| (QREFELT $ 451)) . #1#))))) 

(SDEFUN |EXPR;PI_to_SUP!0| ((|s| NIL) ($$ NIL))
        (PROG ($ |lk| |ls|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;PI_to_SUP|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |ls| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| $ 83) (|EXPR;varmap2| |s| |lk| |ls| $)
                      (|spadConstant| $ 433) (QREFELT $ 130)))))) 

(SDEFUN |EXPR;to_RF|
        ((|c| $) (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|))
         ($ |Fraction| (|Polynomial| (|Integer|))))
        (SPADCALL (|EXPR;MP_to_PI| (SPADCALL |c| (QREFELT $ 105)) |lk| |ls| $)
                  (|EXPR;MP_to_PI| (SPADCALL |c| (QREFELT $ 107)) |lk| |ls| $)
                  (QREFELT $ 456))) 

(SDEFUN |EXPR;SUPP_to_PT|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| $)))
         (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|)) (|k| |Kernel| $)
         (|s| |Symbol|)
         ($ |Record| (|:| |var| (|Symbol|))
          (|:| |coef|
               (|SparseUnivariatePolynomial|
                (|Fraction| (|Polynomial| (|Integer|)))))))
        (SPROG
         ((|up|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|Polynomial| (|Integer|)))))
          (|p2| (|SparseMultivariatePolynomial| R (|Kernel| $))))
         (SEQ
          (LETT |p2| (SPADCALL |p| |k| (QREFELT $ 440))
                . #1=(|EXPR;SUPP_to_PT|))
          (LETT |up|
                (SPADCALL
                 (SPADCALL (|EXPR;MP_to_PI| |p2| |lk| |ls| $) (QREFELT $ 457))
                 (QREFELT $ 459))
                . #1#)
          (EXIT (CONS |s| |up|))))) 

(SDEFUN |EXPR;SUP_to_PT|
        ((|p| |SparseUnivariatePolynomial| $) (|lk| |List| (|Kernel| $))
         (|ls| |List| (|Symbol|)) (|s| |Symbol|)
         ($ |Record| (|:| |var| (|Symbol|))
          (|:| |coef|
               (|SparseUnivariatePolynomial|
                (|Fraction| (|Polynomial| (|Integer|)))))))
        (SPROG
         ((|up|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|Polynomial| (|Integer|))))))
         (SEQ
          (LETT |up|
                (SPADCALL (CONS #'|EXPR;SUP_to_PT!0| (VECTOR $ |ls| |lk|)) |p|
                          (QREFELT $ 462))
                |EXPR;SUP_to_PT|)
          (EXIT (CONS |s| |up|))))) 

(SDEFUN |EXPR;SUP_to_PT!0| ((|c| NIL) ($$ NIL))
        (PROG (|lk| |ls| $)
          (LETT |lk| (QREFELT $$ 2) . #1=(|EXPR;SUP_to_PT|))
          (LETT |ls| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|EXPR;to_RF| |c| |lk| |ls| $))))) 

(SDEFUN |EXPR;gcdPolynomial;3Sup;171|
        ((|p| . #1=(|SparseUnivariatePolynomial| $)) (|q| . #1#) ($ . #1#))
        (SPROG
         ((|g2| (|Polynomial| (|Integer|)))
          (|lm2|
           (|List|
            (|Record| (|:| |var| (|Symbol|))
                      (|:| |coef|
                           (|SparseUnivariatePolynomial|
                            (|Fraction| (|Polynomial| (|Integer|))))))))
          (#2=#:G483 NIL) (|m| NIL) (#3=#:G484 NIL) (|k| NIL) (#4=#:G482 NIL)
          (|q2|
           #5=(|Record| (|:| |var| (|Symbol|))
                        (|:| |coef|
                             (|SparseUnivariatePolynomial|
                              (|Fraction| (|Polynomial| (|Integer|)))))))
          (|p2| #5#) (|g1| (|Polynomial| (|Integer|)))
          (|p_syms| (|List| (|Symbol|))) (|a_syms| (|List| (|Symbol|)))
          (#6=#:G481 NIL) (#7=#:G480 NIL)
          (|lm1| (|List| (|Polynomial| (|Integer|)))) (#8=#:G478 NIL)
          (#9=#:G479 NIL) (#10=#:G477 NIL)
          (|q1| #11=(|Polynomial| (|Integer|))) (|p1| #11#) (#12=#:G476 NIL)
          (#13=#:G475 NIL)
          (|lm|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| R (|Kernel| $)))))
          (#14=#:G474 NIL) (#15=#:G473 NIL) (|all_syms| (|List| (|Symbol|)))
          (|all_kers| (|List| (|Kernel| $))) (|xk| (|Kernel| $))
          (|x| #16=(|Symbol|)) (|all_syms0| (|List| #16#)) (#17=#:G472 NIL)
          (#18=#:G471 NIL) (|akers| (|List| (|Kernel| $)))
          (|all_kers0| (|List| (|Kernel| $))) (|apars| (|List| (|Kernel| $)))
          (|cl| (|List| $)))
         (SEQ
          (COND ((SPADCALL |p| (|spadConstant| $ 413) (QREFELT $ 463)) |q|)
                ((EQL (SPADCALL |p| (QREFELT $ 409)) 0) (|spadConstant| $ 464))
                ((SPADCALL |q| (|spadConstant| $ 413) (QREFELT $ 463)) |p|)
                (#19='T
                 (COND
                  ((EQL (SPADCALL |q| (QREFELT $ 409)) 0)
                   (|spadConstant| $ 464))
                  (#19#
                   (SEQ
                    (COND
                     ((|EXPR;noalg?| |p| $)
                      (COND
                       ((|EXPR;noalg?| |q| $)
                        (EXIT (SPADCALL |p| |q| (QREFELT $ 465)))))))
                    (LETT |cl|
                          (SPADCALL (SPADCALL |p| (QREFELT $ 420))
                                    (SPADCALL |q| (QREFELT $ 420))
                                    (QREFELT $ 466))
                          . #20=(|EXPR;gcdPolynomial;3Sup;171|))
                    (LETT |akers| (SPADCALL |cl| (QREFELT $ 467)) . #20#)
                    (LETT |apars| (|EXPR;algpars| |akers| $) . #20#)
                    (LETT |all_kers0|
                          (SPADCALL (SPADCALL |cl| (QREFELT $ 468)) |apars|
                                    (QREFELT $ 469))
                          . #20#)
                    (LETT |akers| (REVERSE (SPADCALL |akers| (QREFELT $ 470)))
                          . #20#)
                    (LETT |all_syms0|
                          (PROGN
                           (LETT #18# NIL . #20#)
                           (SEQ (LETT |k| NIL . #20#)
                                (LETT #17# |all_kers0| . #20#) G190
                                (COND
                                 ((OR (ATOM #17#)
                                      (PROGN (LETT |k| (CAR #17#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #18#
                                        (CONS (SPADCALL (QREFELT $ 471)) #18#)
                                        . #20#)))
                                (LETT #17# (CDR #17#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #18#))))
                          . #20#)
                    (LETT |x| (SPADCALL (QREFELT $ 471)) . #20#)
                    (LETT |xk| (SPADCALL |x| (QREFELT $ 30)) . #20#)
                    (LETT |all_kers|
                          (SPADCALL |xk| |all_kers0| (QREFELT $ 472)) . #20#)
                    (LETT |all_syms| (CONS |x| |all_syms0|) . #20#)
                    (LETT |lm|
                          (PROGN
                           (LETT #15# NIL . #20#)
                           (SEQ (LETT |k| NIL . #20#)
                                (LETT #14# |akers| . #20#) G190
                                (COND
                                 ((OR (ATOM #14#)
                                      (PROGN (LETT |k| (CAR #14#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #15#
                                        (CONS (|EXPR;def_poly| |k| $) #15#)
                                        . #20#)))
                                (LETT #14# (CDR #14#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #15#))))
                          . #20#)
                    (LETT |a_syms|
                          (PROGN
                           (LETT #13# NIL . #20#)
                           (SEQ (LETT |k| NIL . #20#)
                                (LETT #12# |akers| . #20#) G190
                                (COND
                                 ((OR (ATOM #12#)
                                      (PROGN (LETT |k| (CAR #12#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #13#
                                        (CONS
                                         (|EXPR;varmap1| |k| |all_kers|
                                          |all_syms| $)
                                         #13#)
                                        . #20#)))
                                (LETT #12# (CDR #12#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #13#))))
                          . #20#)
                    (LETT |p_syms|
                          (SPADCALL |all_syms0| |a_syms| (QREFELT $ 473))
                          . #20#)
                    (COND
                     ((|EXPR;trivial_denoms| |p| $)
                      (COND
                       ((|EXPR;trivial_denoms| |q| $)
                        (EXIT
                         (SEQ
                          (LETT |p1|
                                (|EXPR;SUP_to_PI| |p| |all_kers| |all_syms|
                                 |xk| $)
                                . #20#)
                          (LETT |q1|
                                (|EXPR;SUP_to_PI| |q| |all_kers| |all_syms|
                                 |xk| $)
                                . #20#)
                          (LETT |lm1|
                                (PROGN
                                 (LETT #10# NIL . #20#)
                                 (SEQ (LETT |k| NIL . #20#)
                                      (LETT #9# |akers| . #20#)
                                      (LETT |m| NIL . #20#)
                                      (LETT #8# |lm| . #20#) G190
                                      (COND
                                       ((OR (ATOM #8#)
                                            (PROGN
                                             (LETT |m| (CAR #8#) . #20#)
                                             NIL)
                                            (ATOM #9#)
                                            (PROGN
                                             (LETT |k| (CAR #9#) . #20#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #10#
                                              (CONS
                                               (|EXPR;SUPP_to_PI| |m|
                                                |all_kers| |all_syms| |k| $)
                                               #10#)
                                              . #20#)))
                                      (LETT #8#
                                            (PROG1 (CDR #8#)
                                              (LETT #9# (CDR #9#) . #20#))
                                            . #20#)
                                      (GO G190) G191 (EXIT (NREVERSE #10#))))
                                . #20#)
                          (LETT |a_syms|
                                (PROGN
                                 (LETT #7# NIL . #20#)
                                 (SEQ (LETT |k| NIL . #20#)
                                      (LETT #6# |akers| . #20#) G190
                                      (COND
                                       ((OR (ATOM #6#)
                                            (PROGN
                                             (LETT |k| (CAR #6#) . #20#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #7#
                                              (CONS
                                               (|EXPR;varmap1| |k| |all_kers|
                                                |all_syms| $)
                                               #7#)
                                              . #20#)))
                                      (LETT #6# (CDR #6#) . #20#) (GO G190)
                                      G191 (EXIT (NREVERSE #7#))))
                                . #20#)
                          (LETT |p_syms|
                                (SPADCALL |all_syms0| |a_syms| (QREFELT $ 473))
                                . #20#)
                          (LETT |g1|
                                (SPADCALL |p1| |q1| |lm1| |p_syms| |x| |a_syms|
                                          (QREFELT $ 475))
                                . #20#)
                          (EXIT
                           (|EXPR;PI_to_SUP| |g1| |all_kers| |all_syms| |xk|
                            $))))))))
                    (LETT |p2|
                          (|EXPR;SUP_to_PT| |p| |all_kers0| |all_syms0| |x| $)
                          . #20#)
                    (LETT |q2|
                          (|EXPR;SUP_to_PT| |q| |all_kers0| |all_syms0| |x| $)
                          . #20#)
                    (LETT |lm2|
                          (PROGN
                           (LETT #4# NIL . #20#)
                           (SEQ (LETT |k| NIL . #20#) (LETT #3# |akers| . #20#)
                                (LETT |m| NIL . #20#) (LETT #2# |lm| . #20#)
                                G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |m| (CAR #2#) . #20#) NIL)
                                      (ATOM #3#)
                                      (PROGN (LETT |k| (CAR #3#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS
                                         (|EXPR;SUPP_to_PT| |m| |all_kers0|
                                          |all_syms0| |k| |x| $)
                                         #4#)
                                        . #20#)))
                                (LETT #2#
                                      (PROG1 (CDR #2#)
                                        (LETT #3# (CDR #3#) . #20#))
                                      . #20#)
                                (GO G190) G191 (EXIT (NREVERSE #4#))))
                          . #20#)
                    (LETT |g2|
                          (SPADCALL |p2| |q2| |lm2| |p_syms| |x| |a_syms|
                                    (QREFELT $ 478))
                          . #20#)
                    (EXIT
                     (|EXPR;PI_to_SUP| |g2| |all_kers| |all_syms| |xk|
                      $)))))))))) 

(SDEFUN |EXPR;gcdPolynomial;3Sup;172|
        ((|p| . #1=(|SparseUnivariatePolynomial| $)) (|q| . #1#) ($ . #1#))
        (SEQ
         (COND
          ((|EXPR;noalg?| |p| $)
           (COND
            ((|EXPR;noalg?| |q| $)
             (EXIT (SPADCALL |p| |q| (QREFELT $ 465)))))))
         (EXIT (SPADCALL |p| |q| (QREFELT $ 481))))) 

(SDEFUN |EXPR;factorPolynomial;SupF;173|
        ((|x| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |x| (QREFELT $ 484))) 

(SDEFUN |EXPR;coerce;An$;174| ((|x| |AlgebraicNumber|) ($ $))
        (SPADCALL (SPADCALL |x| (|spadConstant| $ 488) (QREFELT $ 489))
                  (QREFELT $ 109))) 

(SDEFUN |EXPR;^;$F$;175| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL |x| |r| (QREFELT $ 492))) 

(SDEFUN |EXPR;minPoly;KSup;176|
        ((|k| |Kernel| . #1=($)) ($ |SparseUnivariatePolynomial| . #1#))
        (SPADCALL |k| (QREFELT $ 494))) 

(SDEFUN |EXPR;definingPolynomial;2$;177| ((|x| $) ($ $))
        (SPADCALL |x| (QREFELT $ 495))) 

(SDEFUN |EXPR;retract;$F;178| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL |x| (QREFELT $ 497))) 

(SDEFUN |EXPR;retractIfCan;$U;179|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPADCALL |x| (QREFELT $ 499))) 

(SDEFUN |EXPR;coerce;An$;180| ((|x| |AlgebraicNumber|) ($ $))
        (SPADCALL (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 501)) $)
                  (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 502)) $)
                  (QREFELT $ 69))) 

(SDEFUN |EXPR;k2expr| ((|k| |Kernel| (|AlgebraicNumber|)) ($ $))
        (SPADCALL (ELT $ 491) |k| (QREFELT $ 506))) 

(SDEFUN |EXPR;smp2expr|
        ((|p| |SparseMultivariatePolynomial| (|Integer|)
          (|Kernel| (|AlgebraicNumber|)))
         ($ $))
        (SPADCALL (CONS (|function| |EXPR;k2expr|) $) (ELT $ 61) |p|
                  (QREFELT $ 511))) 

(SDEFUN |EXPR;retractIfCan;$U;183|
        ((|x| $) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG
         ((#1=#:G513 NIL) (|d| #2=(|Union| (|AlgebraicNumber|) "failed"))
          (|n| #2#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |n| (|EXPR;smp2an| (SPADCALL |x| (QREFELT $ 105)) $)
                   . #3=(|EXPR;retractIfCan;$U;183|))
             (EXIT
              (COND
               ((QEQCAR |n| 0)
                (SEQ
                 (LETT |d| (|EXPR;smp2an| (SPADCALL |x| (QREFELT $ 107)) $)
                       . #3#)
                 (EXIT
                  (COND
                   ((QEQCAR |d| 0)
                    (PROGN
                     (LETT #1#
                           (CONS 0
                                 (SPADCALL (QCDR |n|) (QCDR |d|)
                                           (QREFELT $ 512)))
                           . #3#)
                     (GO #4=#:G508))))))))))
            (EXIT (CONS 1 "failed"))))
          #4# (EXIT #1#)))) 

(SDEFUN |EXPR;R2AN| ((|r| R) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG ((|u| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL (SPADCALL |r| (QREFELT $ 515)) (QREFELT $ 72))
                      |EXPR;R2AN|)
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 516))))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |EXPR;k2an| ((|k| |Kernel| $) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG
         ((|arg| (|List| (|AlgebraicNumber|))) (#1=#:G545 NIL)
          (|a| #2=(|Union| (|AlgebraicNumber|) #3="failed")) (#4=#:G546 NIL)
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
               (QREFELT $ 517)))
             (CONS 1 "failed"))
            ('T
             (COND
              ((SPADCALL |op| '|rootOf| (QREFELT $ 518))
               (SEQ (LETT |args| (SPADCALL |k| (QREFELT $ 79)) . #5#)
                    (LETT |a2| (SPADCALL |args| 2 (QREFELT $ 81)) . #5#)
                    (LETT |k1u| (SPADCALL |a2| (QREFELT $ 19)) . #5#)
                    (EXIT
                     (COND ((QEQCAR |k1u| 1) (CONS 1 "failed"))
                           (#6='T
                            (SEQ (LETT |k1| (QCDR |k1u|) . #5#)
                                 (LETT |s1u| (SPADCALL |a2| (QREFELT $ 520))
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
                                                            (QREFELT $ 107))
                                                  (|spadConstant| $ 83)
                                                  (QREFELT $ 521))
                                                 (|error|
                                                  "Bad argument to rootOf"))
                                                (#6#
                                                 (SEQ
                                                  (LETT |eq|
                                                        (SPADCALL
                                                         (SPADCALL |a1|
                                                                   (QREFELT $
                                                                            105))
                                                         |k1| (QREFELT $ 125))
                                                        . #5#)
                                                  (LETT |eqa|
                                                        (|spadConstant| $ 523)
                                                        . #5#)
                                                  (SEQ G190
                                                       (COND
                                                        ((NULL
                                                          (SPADCALL |eq|
                                                                    (|spadConstant|
                                                                     $ 524)
                                                                    (QREFELT $
                                                                             525)))
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |cc|
                                                              (SPADCALL
                                                               (SPADCALL |eq|
                                                                         (QREFELT
                                                                          $
                                                                          127))
                                                               (QREFELT $ 109))
                                                              . #5#)
                                                        (LETT |ccu|
                                                              (SPADCALL |cc|
                                                                        (QREFELT
                                                                         $
                                                                         514))
                                                              . #5#)
                                                        (EXIT
                                                         (COND
                                                          ((QEQCAR |ccu| 1)
                                                           (PROGN
                                                            (LETT #1#
                                                                  (CONS 1
                                                                        "failed")
                                                                  . #5#)
                                                            (GO #7=#:G544)))
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
                                                                              526))
                                                                    (QREFELT $
                                                                             527))
                                                                   (QREFELT $
                                                                            528))
                                                                  . #5#)
                                                            (EXIT
                                                             (LETT |eq|
                                                                   (SPADCALL
                                                                    |eq|
                                                                    (QREFELT $
                                                                             128))
                                                                   . #5#)))))))
                                                       NIL (GO G190) G191
                                                       (EXIT NIL))
                                                  (EXIT
                                                   (CONS 0
                                                         (SPADCALL |eqa| |s1|
                                                                   (QREFELT $
                                                                            529))))))))))))))))))
              (#6#
               (SEQ (LETT |arg| NIL . #5#)
                    (SEQ (LETT |x| NIL . #5#)
                         (LETT #4# (SPADCALL |k| (QREFELT $ 79)) . #5#) G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
                           (GO G191)))
                         (SEQ (LETT |a| (SPADCALL |x| (QREFELT $ 514)) . #5#)
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
                           (SPADCALL (SPADCALL |op| (QREFELT $ 530))
                                     (NREVERSE |arg|) (QREFELT $ 531))))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |EXPR;smp2an|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $))
         ($ |Union| (|AlgebraicNumber|) #1="failed"))
        (SPROG
         ((|c| (|Union| (|AlgebraicNumber|) #1#))
          (|up|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| $))))
          (|ans| (|AlgebraicNumber|)) (#2=#:G561 NIL)
          (|t| (|Union| (|AlgebraicNumber|) "failed")) (|k| (|Kernel| $))
          (|x1| (|Union| (|Kernel| $) "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |x1| (SPADCALL |p| (QREFELT $ 533)) . #3=(|EXPR;smp2an|))
                (EXIT
                 (COND
                  ((QEQCAR |x1| 1)
                   (|EXPR;R2AN| (SPADCALL |p| (QREFELT $ 534)) $))
                  (#4='T
                   (SEQ
                    (LETT |up|
                          (SPADCALL |p| (LETT |k| (QCDR |x1|) . #3#)
                                    (QREFELT $ 125))
                          . #3#)
                    (LETT |t| (|EXPR;k2an| |k| $) . #3#)
                    (EXIT
                     (COND ((QEQCAR |t| 1) (CONS 1 "failed"))
                           (#4#
                            (SEQ (LETT |ans| (|spadConstant| $ 535) . #3#)
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND
                                          ((SPADCALL |up| (QREFELT $ 536))
                                           'NIL)
                                          ('T 'T)))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |c|
                                             (|EXPR;smp2an|
                                              (SPADCALL |up| (QREFELT $ 127))
                                              $)
                                             . #3#)
                                       (EXIT
                                        (COND
                                         ((QEQCAR |c| 1)
                                          (PROGN
                                           (LETT #2# (CONS 1 "failed") . #3#)
                                           (GO #5=#:G560)))
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
                                                                        $ 526))
                                                                      (QREFELT
                                                                       $ 537))
                                                                     (QREFELT $
                                                                              538))
                                                           (QREFELT $ 539))
                                                 . #3#)
                                           (EXIT
                                            (LETT |up|
                                                  (SPADCALL |up|
                                                            (QREFELT $ 128))
                                                  . #3#)))))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (LETT |c|
                                       (|EXPR;smp2an|
                                        (SPADCALL |up| (QREFELT $ 127)) $)
                                       . #3#)
                                 (EXIT
                                  (COND ((QEQCAR |c| 1) (CONS 1 "failed"))
                                        (#4#
                                         (CONS 0
                                               (SPADCALL |ans| (QCDR |c|)
                                                         (QREFELT $
                                                                  539))))))))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |EXPR;convert;$If;187| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 541))) 

(SDEFUN |EXPR;eval;$Bo$S$;188|
        ((|f| $) (|op| |BasicOperator|) (|g| $) (|x| |Symbol|) ($ $))
        (SPADCALL |f| (LIST |op|) (LIST |g|) |x| (QREFELT $ 544))) 

(SDEFUN |EXPR;eval;$LLS$;189|
        ((|f| $) (|ls| |List| (|BasicOperator|)) (|lg| |List| $) (|x| |Symbol|)
         ($ $))
        (SPROG
         ((|res| ($)) (#1=#:G592 NIL) (|g| NIL) (#2=#:G591 NIL)
          (|nlg| (|List| $)) (#3=#:G590 NIL) (#4=#:G589 NIL)
          (|lbackwardSubs| (|List| (|Equation| $))) (#5=#:G587 NIL) (|i| NIL)
          (#6=#:G588 NIL) (|j| NIL) (#7=#:G586 NIL)
          (|lforwardSubs| (|List| (|Equation| $))) (#8=#:G584 NIL)
          (#9=#:G585 NIL) (#10=#:G583 NIL) (|ns| (|List| (|Symbol|)))
          (#11=#:G582 NIL) (#12=#:G581 NIL) (#13=#:G580 NIL) (#14=#:G579 NIL)
          (|lsd| (|List| (|Symbol|))) (|lsym| (|List| (|Symbol|)))
          (|llsym| (|List| (|List| (|Symbol|)))) (#15=#:G578 NIL)
          (#16=#:G577 NIL))
         (SEQ
          (LETT |llsym|
                (PROGN
                 (LETT #16# NIL . #17=(|EXPR;eval;$LLS$;189|))
                 (SEQ (LETT |g| NIL . #17#) (LETT #15# |lg| . #17#) G190
                      (COND
                       ((OR (ATOM #15#)
                            (PROGN (LETT |g| (CAR #15#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #16# (CONS (SPADCALL |g| (QREFELT $ 546)) #16#)
                              . #17#)))
                      (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #16#))))
                . #17#)
          (LETT |lsym|
                (SPADCALL (SPADCALL |llsym| (QREFELT $ 547)) (QREFELT $ 548))
                . #17#)
          (LETT |lsd| (SPADCALL (ELT $ 549) |lsym| (QREFELT $ 551)) . #17#)
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
                                     (CONS (SPADCALL |g| |x| (QREFELT $ 553))
                                           #14#)
                                     . #17#)))
                             (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                             (EXIT (NREVERSE #14#))))
                       (QREFELT $ 556)))
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
                            (LETT #12# (CONS (SPADCALL (QREFELT $ 471)) #12#)
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
                                   (SPADCALL (SPADCALL |i| (QREFELT $ 557))
                                             (SPADCALL |j| (QREFELT $ 557))
                                             (QREFELT $ 559))
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
                                   (SPADCALL (SPADCALL |j| (QREFELT $ 557))
                                             (SPADCALL |i| (QREFELT $ 557))
                                             (QREFELT $ 559))
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
                                             (QREFELT $ 561))
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
                                             (SPADCALL |g| |x| (QREFELT $ 553))
                                             #2#)
                                            . #17#)))
                                    (LETT #1# (CDR #1#) . #17#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 556))
                    . #17#)
              (EXIT (SPADCALL |res| |lbackwardSubs| (QREFELT $ 561)))))))))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;190|
        ((|x| $) (|p| |Pattern| #1=(|Integer|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 565))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;191|
        ((|x| $) (|p| |Pattern| #1=(|Float|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 571))) 

(SDEFUN |EXPR;Zero;$;192| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |EXPR;One;$;193| (($ $)) (|spadConstant| $ 48)) 

(SDEFUN |EXPR;-;2$;194| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |EXPR;*;I2$;195| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL |n| |x| (QREFELT $ 58))) 

(SDEFUN |EXPR;*;3$;196| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 62))) 

(SDEFUN |EXPR;+;3$;197| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 64))) 

(SDEFUN |EXPR;=;2$B;198| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(SDEFUN |EXPR;smaller?;2$B;199| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 100))) 

(PUT '|EXPR;numer;$Smp;200| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |EXPR;numer;$Smp;200|
        ((|x| $) ($ |SparseMultivariatePolynomial| R (|Kernel| $))) |x|) 

(PUT '|EXPR;coerce;Smp$;201| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |EXPR;coerce;Smp$;201|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) ($ $)) |p|) 

(SDEFUN |EXPR;coerce;P$;202| ((|p| |Polynomial| R) ($ $))
        (|EXPR;poly_to_MP| |p| $)) 

(SDEFUN |EXPR;reducedSystem;MM;203| ((|m| |Matrix| $) ($ |Matrix| R))
        (SPADCALL |m| (QREFELT $ 574))) 

(SDEFUN |EXPR;reducedSystem;MVR;204|
        ((|m| |Matrix| . #1=($)) (|v| |Vector| . #1#)
         ($ |Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R))))
        (SPADCALL |m| |v| (QREFELT $ 575))) 

(SDEFUN |EXPR;convert;$If;205| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 541))) 

(SDEFUN |EXPR;kintmatch|
        ((|k| |Kernel| $) (|p| |Pattern| (|Integer|))
         (|l| |PatternMatchResult| (|Integer|) |Rep|)
         ($ |PatternMatchResult| (|Integer|) |Rep|))
        (SPADCALL |k| |p| |l| (QREFELT $ 577))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;207|
        ((|x| $) (|p| |Pattern| #1=(|Integer|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kintmatch|) $)
                  (QREFELT $ 581))) 

(SDEFUN |EXPR;kfltmatch|
        ((|k| |Kernel| $) (|p| |Pattern| (|Float|))
         (|l| |PatternMatchResult| (|Float|) |Rep|)
         ($ |PatternMatchResult| (|Float|) |Rep|))
        (SPADCALL |k| |p| |l| (QREFELT $ 583))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;209|
        ((|x| $) (|p| |Pattern| #1=(|Float|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kfltmatch|) $)
                  (QREFELT $ 587))) 

(SDEFUN |EXPR;Zero;$;210| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |EXPR;+;3$;211| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 64))) 

(SDEFUN |EXPR;=;2$B;212| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(SDEFUN |EXPR;smaller?;2$B;213| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 100))) 

(SDEFUN |EXPR;coerce;K$;214| ((|k| |Kernel| $) ($ $))
        (SPADCALL |k| (QREFELT $ 588))) 

(SDEFUN |EXPR;kernels;$L;215| ((|x| $) ($ |List| (|Kernel| $)))
        (SPROG ((#1=#:G629 NIL) (|f| NIL) (#2=#:G628 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EXPR;kernels;$L;215|))
                 (SEQ (LETT |f| NIL . #3#)
                      (LETT #1# (SPADCALL |x| (QREFELT $ 591)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCAR |f|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EXPR;coerce;R$;216| ((|x| R) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 592)) (|spadConstant| $ 47))
              ('T (SPADCALL (SPADCALL |x| (QREFELT $ 593)) (QREFELT $ 142))))) 

(SDEFUN |EXPR;retract;$R;217| ((|x| $) ($ R))
        (COND ((SPADCALL |x| (QREFELT $ 54)) (|spadConstant| $ 93))
              ('T (|EXPR;retNotUnit| |x| $)))) 

(SDEFUN |EXPR;coerce;$Of;218| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 595))) 

(SDEFUN |EXPR;kereval|
        ((|k| |Kernel| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SPADCALL |lk| |lv| |k|
                         (CONS #'|EXPR;kereval!1| (VECTOR |lk| |lv| $))
                         (QREFELT $ 601)))) 

(SDEFUN |EXPR;kereval!1| ((|x2| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;kereval|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT |lk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|EXPR;kereval!0| (VECTOR $ |lv| |lk|))
                             |x2| (QREFELT $ 598))))))) 

(SDEFUN |EXPR;kereval!0| ((|x1| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x1| |lk| |lv| (QREFELT $ 597)))))) 

(SDEFUN |EXPR;subeval|
        ((|k| |Kernel| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |k|
                          (CONS #'|EXPR;subeval!0| (VECTOR |lv| |lk| $))
                          (QREFELT $ 601))))) 

(SDEFUN |EXPR;subeval!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |lk| |lv|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subeval|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |lv| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G653 NIL) (|a| NIL) (#3=#:G652 NIL))
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
                                                       (QREFELT $ 602))
                                             #3#)
                                            NIL)))
                                    (LETT #2# (CDR #2#) NIL) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              (QREFELT $ 603)))))))) 

(SDEFUN |EXPR;isPlus;$U;221| ((|x| $) ($ |Union| (|List| $) "failed"))
        (SPROG
         ((#1=#:G668 NIL) (|t| NIL) (#2=#:G667 NIL)
          (|l|
           (|List|
            (|Record| (|:| |gen| (|Kernel| $)) (|:| |exp| (|Integer|))))))
         (SEQ
          (COND
           ((OR
             (NULL
              (LETT |l| (SPADCALL |x| (QREFELT $ 591))
                    . #3=(|EXPR;isPlus;$U;221|)))
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
                                           (QREFELT $ 604))
                                 #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |EXPR;isMult;$U;222|
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
              (LETT |l| (SPADCALL |x| (QREFELT $ 591))
                    . #1=(|EXPR;isMult;$U;222|)))
             (NULL (NULL (CDR |l|))))
            (CONS 1 "failed"))
           ('T
            (SEQ (LETT |t| (SPADCALL |l| (QREFELT $ 607)) . #1#)
                 (EXIT (CONS 0 (CONS (QCDR |t|) (QCAR |t|)))))))))) 

(SDEFUN |EXPR;eval;$LL$;223|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG
         ((#1=#:G684 NIL) (#2=#:G683 ($)) (#3=#:G685 ($)) (#4=#:G687 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|EXPR;eval;$LL$;223|))
           (SEQ (LETT |t| NIL . #5#)
                (LETT #4# (SPADCALL |x| (QREFELT $ 591)) . #5#) G190
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

(SDEFUN |EXPR;subst;$LL$;224|
        ((|x| $) (|lk| |List| (|Kernel| . #1=($))) (|lv| |List| . #1#) ($ $))
        (SPROG
         ((#2=#:G690 NIL) (#3=#:G689 ($)) (#4=#:G691 ($)) (#5=#:G693 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #2# NIL . #6=(|EXPR;subst;$LL$;224|))
           (SEQ (LETT |t| NIL . #6#)
                (LETT #5# (SPADCALL |x| (QREFELT $ 591)) . #6#) G190
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

(SDEFUN |EXPR;retractIfCan;$U;225| ((|x| $) ($ |Union| R "failed"))
        (COND ((SPADCALL |x| (QREFELT $ 54)) (CONS 0 (|spadConstant| $ 93)))
              ('T (|EXPR;retNotUnitIfCan| |x| $)))) 

(SDEFUN |EXPR;-;2$;226| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |EXPR;smaller?;2$B;227| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 100))) 

(SDEFUN |EXPR;=;2$B;228| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(PUT '|EXPR;coerce;K$;229| '|SPADreplace| '(XLAM (|k|) |k|)) 

(SDEFUN |EXPR;coerce;K$;229| ((|k| |Kernel| $) ($ $)) |k|) 

(PUT '|EXPR;kernels;$L;230| '|SPADreplace| 'LIST) 

(SDEFUN |EXPR;kernels;$L;230| ((|x| $) ($ |List| (|Kernel| $))) (LIST |x|)) 

(SDEFUN |EXPR;coerce;R$;231| ((|x| R) ($ $)) (SPADCALL |x| (QREFELT $ 593))) 

(SDEFUN |EXPR;retract;$R;232| ((|x| $) ($ R)) (|EXPR;retNotUnit| |x| $)) 

(SDEFUN |EXPR;retractIfCan;$U;233| ((|x| $) ($ |Union| R "failed"))
        (|EXPR;retNotUnitIfCan| |x| $)) 

(SDEFUN |EXPR;coerce;$Of;234| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 595))) 

(SDEFUN |EXPR;eval;$LL$;235|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SPADCALL |lk| |lv| |x|
                         (CONS #'|EXPR;eval;$LL$;235!1| (VECTOR |lk| |lv| $))
                         (QREFELT $ 601)))) 

(SDEFUN |EXPR;eval;$LL$;235!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;eval;$LL$;235|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT |lk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (CONS #'|EXPR;eval;$LL$;235!0| (VECTOR $ |lv| |lk|)) |x1|
                    (QREFELT $ 598))))))) 

(SDEFUN |EXPR;eval;$LL$;235!0| ((|x2| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |lk| |lv| (QREFELT $ 597)))))) 

(SDEFUN |EXPR;subst;$LL$;236|
        ((|x| $) (|lk| |List| (|Kernel| . #1=($))) (|lv| |List| . #1#) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |x|
                          (CONS #'|EXPR;subst;$LL$;236!0| (VECTOR |lv| |lk| $))
                          (QREFELT $ 601))))) 

(SDEFUN |EXPR;subst;$LL$;236!0| ((|x1| NIL) ($$ NIL))
        (PROG ($ |lk| |lv|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subst;$LL$;236|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |lv| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G729 NIL) (|a| NIL) (#3=#:G728 NIL))
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
                                                       (QREFELT $ 602))
                                             #3#)
                                            NIL)))
                                    (LETT #2# (CDR #2#) NIL) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              (QREFELT $ 603)))))))) 

(SDEFUN |EXPR;convert;$If;237| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 541))) 

(DECLAIM (NOTINLINE |Expression;|)) 

(DEFUN |Expression| (#1=#:G777)
  (SPROG NIL
         (PROG (#2=#:G778)
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
   ((#1=#:G776 NIL) (|pv$| NIL) (#2=#:G770 NIL) (#3=#:G771 NIL) (#4=#:G772 NIL)
    (#5=#:G773 NIL) (#6=#:G774 NIL) (#7=#:G775 NIL) ($ NIL) (|dv$| NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #8=(|Expression|))
    (LETT |dv$| (LIST '|Expression| DV$1) . #8#)
    (LETT $ (GETREFV 645) . #8#)
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
                                        (LETT #7#
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #8#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #7#)
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
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#1|
                                                              '(|IntegralDomain|)))
                                              . #8#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #6#)
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            #7#)
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
                                         #7#)
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #8#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         #5#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #7#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Integer|)))
                                         #7#)
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
                                         #7#)
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|))
                                              . #8#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|AbelianSemiGroup|))
                                              . #8#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         #5# #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #7#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SemiGroup|))
                                              . #8#)
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            #2#)
                                        (OR #3# #2#)))
                    . #8#))
    (|haddProp| |$ConstructorCache| '|Expression| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
         (|augmentPredVector| $ 2147483648))
    (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 4294967296))
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| $ '(|RetractableTo| (|Integer|)))
         (|augmentPredVector| $ 8589934592))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #8#)
     (|augmentPredVector| $ 17179869184))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 34359738368))
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
          (QSETREFV $ 92
                    (CONS (|dispatchFunction| |EXPR;simplifyPower;$I$;18|) $))
          (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;^;$Nni$;19|) $))
          (QSETREFV $ 97 (CONS (|dispatchFunction| |EXPR;^;$I$;20|) $))
          (QSETREFV $ 99 (CONS (|dispatchFunction| |EXPR;^;$Pi$;21|) $))
          (QSETREFV $ 101 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;22|) $))
          (QSETREFV $ 102 (CONS (|dispatchFunction| |EXPR;=;2$B;23|) $))
          (QSETREFV $ 105 (CONS (|dispatchFunction| |EXPR;numer;$Smp;24|) $))
          (QSETREFV $ 107 (CONS (|dispatchFunction| |EXPR;denom;$Smp;25|) $))
          (QSETREFV $ 108
                    (|Record|
                     (|:| |num|
                          (|SparseMultivariatePolynomial| |#1| (|Kernel| $)))
                     (|:| |den|
                          (|SparseMultivariatePolynomial| |#1| (|Kernel| $)))))
          (QSETREFV $ 109 (CONS (|dispatchFunction| |EXPR;coerce;Smp$;26|) $))
          (QSETREFV $ 111 (CONS (|dispatchFunction| |EXPR;coerce;P$;27|) $))
          (QSETREFV $ 115 (CONS (|dispatchFunction| |EXPR;coerce;F$;28|) $))
          (QSETREFV $ 116 (CONS (|dispatchFunction| |EXPR;reduce;2$;29|) $))
          (DEFVAR |algreduc_flag| 'NIL)
          (QSETREFV $ 133
                    (CONS
                     (|dispatchFunction| |EXPR;getSimplifyDenomsFlag;B;35|) $))
          (QSETREFV $ 134
                    (CONS
                     (|dispatchFunction| |EXPR;setSimplifyDenomsFlag;2B;36|)
                     $))
          (QSETREFV $ 145 (CONS (|dispatchFunction| |EXPR;/;2Smp$;38|) $))
          (QSETREFV $ 154
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;39|) $))
          (QSETREFV $ 162
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;40|) $))
          (QSETREFV $ 167 (CONS (|dispatchFunction| |EXPR;rootOf;SupS$;42|) $))
          (QSETREFV $ 169
                    (CONS (|dispatchFunction| |EXPR;rootSum;$SupS$;43|) $))
          (QSETREFV $ 172 (CONS (|dispatchFunction| |EXPR;pi;$;44|) $))
          (QSETREFV $ 174 (CONS (|dispatchFunction| |EXPR;exp;2$;45|) $))
          (QSETREFV $ 176 (CONS (|dispatchFunction| |EXPR;log;2$;46|) $))
          (QSETREFV $ 178 (CONS (|dispatchFunction| |EXPR;sin;2$;47|) $))
          (QSETREFV $ 180 (CONS (|dispatchFunction| |EXPR;cos;2$;48|) $))
          (QSETREFV $ 182 (CONS (|dispatchFunction| |EXPR;tan;2$;49|) $))
          (QSETREFV $ 184 (CONS (|dispatchFunction| |EXPR;cot;2$;50|) $))
          (QSETREFV $ 186 (CONS (|dispatchFunction| |EXPR;sec;2$;51|) $))
          (QSETREFV $ 188 (CONS (|dispatchFunction| |EXPR;csc;2$;52|) $))
          (QSETREFV $ 190 (CONS (|dispatchFunction| |EXPR;asin;2$;53|) $))
          (QSETREFV $ 192 (CONS (|dispatchFunction| |EXPR;acos;2$;54|) $))
          (QSETREFV $ 194 (CONS (|dispatchFunction| |EXPR;atan;2$;55|) $))
          (QSETREFV $ 196 (CONS (|dispatchFunction| |EXPR;acot;2$;56|) $))
          (QSETREFV $ 198 (CONS (|dispatchFunction| |EXPR;asec;2$;57|) $))
          (QSETREFV $ 200 (CONS (|dispatchFunction| |EXPR;acsc;2$;58|) $))
          (QSETREFV $ 202 (CONS (|dispatchFunction| |EXPR;sinh;2$;59|) $))
          (QSETREFV $ 204 (CONS (|dispatchFunction| |EXPR;cosh;2$;60|) $))
          (QSETREFV $ 206 (CONS (|dispatchFunction| |EXPR;tanh;2$;61|) $))
          (QSETREFV $ 208 (CONS (|dispatchFunction| |EXPR;coth;2$;62|) $))
          (QSETREFV $ 210 (CONS (|dispatchFunction| |EXPR;sech;2$;63|) $))
          (QSETREFV $ 212 (CONS (|dispatchFunction| |EXPR;csch;2$;64|) $))
          (QSETREFV $ 214 (CONS (|dispatchFunction| |EXPR;asinh;2$;65|) $))
          (QSETREFV $ 216 (CONS (|dispatchFunction| |EXPR;acosh;2$;66|) $))
          (QSETREFV $ 218 (CONS (|dispatchFunction| |EXPR;atanh;2$;67|) $))
          (QSETREFV $ 220 (CONS (|dispatchFunction| |EXPR;acoth;2$;68|) $))
          (QSETREFV $ 222 (CONS (|dispatchFunction| |EXPR;asech;2$;69|) $))
          (QSETREFV $ 224 (CONS (|dispatchFunction| |EXPR;acsch;2$;70|) $))
          (QSETREFV $ 227 (CONS (|dispatchFunction| |EXPR;abs;2$;71|) $))
          (QSETREFV $ 229 (CONS (|dispatchFunction| |EXPR;Gamma;2$;72|) $))
          (QSETREFV $ 231 (CONS (|dispatchFunction| |EXPR;Gamma;3$;73|) $))
          (QSETREFV $ 233 (CONS (|dispatchFunction| |EXPR;Beta;3$;74|) $))
          (QSETREFV $ 235 (CONS (|dispatchFunction| |EXPR;digamma;2$;75|) $))
          (QSETREFV $ 237 (CONS (|dispatchFunction| |EXPR;polygamma;3$;76|) $))
          (QSETREFV $ 239 (CONS (|dispatchFunction| |EXPR;besselJ;3$;77|) $))
          (QSETREFV $ 241 (CONS (|dispatchFunction| |EXPR;besselY;3$;78|) $))
          (QSETREFV $ 243 (CONS (|dispatchFunction| |EXPR;besselI;3$;79|) $))
          (QSETREFV $ 245 (CONS (|dispatchFunction| |EXPR;besselK;3$;80|) $))
          (QSETREFV $ 247 (CONS (|dispatchFunction| |EXPR;airyAi;2$;81|) $))
          (QSETREFV $ 249
                    (CONS (|dispatchFunction| |EXPR;airyAiPrime;2$;82|) $))
          (QSETREFV $ 251 (CONS (|dispatchFunction| |EXPR;airyBi;2$;83|) $))
          (QSETREFV $ 253
                    (CONS (|dispatchFunction| |EXPR;airyBiPrime;2$;84|) $))
          (QSETREFV $ 255 (CONS (|dispatchFunction| |EXPR;lambertW;2$;85|) $))
          (QSETREFV $ 257 (CONS (|dispatchFunction| |EXPR;polylog;3$;86|) $))
          (QSETREFV $ 259
                    (CONS (|dispatchFunction| |EXPR;weierstrassP;4$;87|) $))
          (QSETREFV $ 261
                    (CONS (|dispatchFunction| |EXPR;weierstrassPPrime;4$;88|)
                          $))
          (QSETREFV $ 263
                    (CONS (|dispatchFunction| |EXPR;weierstrassSigma;4$;89|)
                          $))
          (QSETREFV $ 265
                    (CONS (|dispatchFunction| |EXPR;weierstrassZeta;4$;90|) $))
          (QSETREFV $ 267
                    (CONS (|dispatchFunction| |EXPR;weierstrassPInverse;4$;91|)
                          $))
          (QSETREFV $ 269
                    (CONS (|dispatchFunction| |EXPR;whittakerM;4$;92|) $))
          (QSETREFV $ 271
                    (CONS (|dispatchFunction| |EXPR;whittakerW;4$;93|) $))
          (QSETREFV $ 273 (CONS (|dispatchFunction| |EXPR;angerJ;3$;94|) $))
          (QSETREFV $ 275 (CONS (|dispatchFunction| |EXPR;weberE;3$;95|) $))
          (QSETREFV $ 277 (CONS (|dispatchFunction| |EXPR;struveH;3$;96|) $))
          (QSETREFV $ 279 (CONS (|dispatchFunction| |EXPR;struveL;3$;97|) $))
          (QSETREFV $ 281 (CONS (|dispatchFunction| |EXPR;hankelH1;3$;98|) $))
          (QSETREFV $ 283 (CONS (|dispatchFunction| |EXPR;hankelH2;3$;99|) $))
          (QSETREFV $ 285 (CONS (|dispatchFunction| |EXPR;lommelS1;4$;100|) $))
          (QSETREFV $ 287 (CONS (|dispatchFunction| |EXPR;lommelS2;4$;101|) $))
          (QSETREFV $ 289 (CONS (|dispatchFunction| |EXPR;kummerM;4$;102|) $))
          (QSETREFV $ 291 (CONS (|dispatchFunction| |EXPR;kummerU;4$;103|) $))
          (QSETREFV $ 293
                    (CONS (|dispatchFunction| |EXPR;legendreP;4$;104|) $))
          (QSETREFV $ 295
                    (CONS (|dispatchFunction| |EXPR;legendreQ;4$;105|) $))
          (QSETREFV $ 297
                    (CONS (|dispatchFunction| |EXPR;kelvinBei;3$;106|) $))
          (QSETREFV $ 299
                    (CONS (|dispatchFunction| |EXPR;kelvinBer;3$;107|) $))
          (QSETREFV $ 301
                    (CONS (|dispatchFunction| |EXPR;kelvinKei;3$;108|) $))
          (QSETREFV $ 303
                    (CONS (|dispatchFunction| |EXPR;kelvinKer;3$;109|) $))
          (QSETREFV $ 305
                    (CONS (|dispatchFunction| |EXPR;ellipticK;2$;110|) $))
          (QSETREFV $ 307
                    (CONS (|dispatchFunction| |EXPR;ellipticE;2$;111|) $))
          (QSETREFV $ 309
                    (CONS (|dispatchFunction| |EXPR;ellipticE;3$;112|) $))
          (QSETREFV $ 311
                    (CONS (|dispatchFunction| |EXPR;ellipticF;3$;113|) $))
          (QSETREFV $ 313
                    (CONS (|dispatchFunction| |EXPR;ellipticPi;4$;114|) $))
          (QSETREFV $ 315 (CONS (|dispatchFunction| |EXPR;jacobiSn;3$;115|) $))
          (QSETREFV $ 317 (CONS (|dispatchFunction| |EXPR;jacobiCn;3$;116|) $))
          (QSETREFV $ 319 (CONS (|dispatchFunction| |EXPR;jacobiDn;3$;117|) $))
          (QSETREFV $ 321
                    (CONS (|dispatchFunction| |EXPR;jacobiZeta;3$;118|) $))
          (QSETREFV $ 323
                    (CONS (|dispatchFunction| |EXPR;jacobiTheta;3$;119|) $))
          (QSETREFV $ 325 (CONS (|dispatchFunction| |EXPR;lerchPhi;4$;120|) $))
          (QSETREFV $ 327
                    (CONS (|dispatchFunction| |EXPR;riemannZeta;2$;121|) $))
          (QSETREFV $ 329
                    (CONS (|dispatchFunction| |EXPR;charlierC;4$;122|) $))
          (QSETREFV $ 331 (CONS (|dispatchFunction| |EXPR;hermiteH;3$;123|) $))
          (QSETREFV $ 333 (CONS (|dispatchFunction| |EXPR;jacobiP;5$;124|) $))
          (QSETREFV $ 335
                    (CONS (|dispatchFunction| |EXPR;laguerreL;4$;125|) $))
          (QSETREFV $ 337 (CONS (|dispatchFunction| |EXPR;meixnerM;5$;126|) $))
          (COND
           ((|testBitVector| |pv$| 32)
            (PROGN
             (QSETREFV $ 340
                       (CONS
                        (|dispatchFunction| |EXPR;hypergeometricF;2L2$;127|)
                        (|getDomainView| $ '(|RetractableTo| (|Integer|)))))
             (QSETREFV $ 342
                       (CONS (|dispatchFunction| |EXPR;meijerG;4L2$;128|)
                             (|getDomainView| $
                                              '(|RetractableTo|
                                                (|Integer|))))))))
          (QSETREFV $ 89 (CONS (|dispatchFunction| |EXPR;^;3$;129|) $))
          (QSETREFV $ 346
                    (CONS (|dispatchFunction| |EXPR;factorial;2$;130|) $))
          (QSETREFV $ 348 (CONS (|dispatchFunction| |EXPR;binomial;3$;131|) $))
          (QSETREFV $ 350
                    (CONS (|dispatchFunction| |EXPR;permutation;3$;132|) $))
          (QSETREFV $ 352
                    (CONS (|dispatchFunction| |EXPR;factorials;2$;133|) $))
          (QSETREFV $ 354
                    (CONS (|dispatchFunction| |EXPR;factorials;$S$;134|) $))
          (QSETREFV $ 356
                    (CONS (|dispatchFunction| |EXPR;summation;$S$;135|) $))
          (QSETREFV $ 360
                    (CONS (|dispatchFunction| |EXPR;summation;$Sb$;136|) $))
          (QSETREFV $ 362 (CONS (|dispatchFunction| |EXPR;product;$S$;137|) $))
          (QSETREFV $ 364
                    (CONS (|dispatchFunction| |EXPR;product;$Sb$;138|) $))
          (QSETREFV $ 367 (CONS (|dispatchFunction| |EXPR;erf;2$;139|) $))
          (QSETREFV $ 369 (CONS (|dispatchFunction| |EXPR;erfi;2$;140|) $))
          (QSETREFV $ 371 (CONS (|dispatchFunction| |EXPR;Ei;2$;141|) $))
          (QSETREFV $ 373 (CONS (|dispatchFunction| |EXPR;Si;2$;142|) $))
          (QSETREFV $ 375 (CONS (|dispatchFunction| |EXPR;Ci;2$;143|) $))
          (QSETREFV $ 377 (CONS (|dispatchFunction| |EXPR;Shi;2$;144|) $))
          (QSETREFV $ 379 (CONS (|dispatchFunction| |EXPR;Chi;2$;145|) $))
          (QSETREFV $ 381 (CONS (|dispatchFunction| |EXPR;li;2$;146|) $))
          (QSETREFV $ 383 (CONS (|dispatchFunction| |EXPR;dilog;2$;147|) $))
          (QSETREFV $ 385 (CONS (|dispatchFunction| |EXPR;fresnelS;2$;148|) $))
          (QSETREFV $ 387 (CONS (|dispatchFunction| |EXPR;fresnelC;2$;149|) $))
          (QSETREFV $ 389
                    (CONS (|dispatchFunction| |EXPR;integral;$S$;150|) $))
          (QSETREFV $ 391
                    (CONS (|dispatchFunction| |EXPR;integral;$Sb$;151|) $))
          (QSETREFV $ 37 (CONS (|dispatchFunction| |EXPR;operator;2Bo;152|) $))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (PROGN
             (COND
              ((|domainEqual| |#1| (|Integer|))
               (PROGN
                (QSETREFV $ 441
                          (|Record| (|:| |svz| (|List| (|Symbol|)))
                                    (|:| |sm|
                                         (|List| (|Polynomial| (|Integer|))))
                                    (|:| |msizes| (|List| (|Integer|)))
                                    (|:| |sp| (|Integer|))))
                (QSETREFV $ 442 (|ModularAlgebraicGcdTools3|))
                (QSETREFV $ 443
                          (|ModularAlgebraicGcd|
                           (|SparseUnivariatePolynomial|
                            (|Polynomial| (|Integer|)))
                           (QREFELT $ 441) (QREFELT $ 442)))
                (QSETREFV $ 452 (|ModularEvaluation2|))
                (QSETREFV $ 453 (|ModularAlgebraicGcdTools4|))
                (QSETREFV $ 454
                          (|ModularAlgebraicGcd2|
                           (|Record| (|:| |var| (|Symbol|))
                                     (|:| |coef|
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|Polynomial| (|Integer|))))))
                           (|FakePolynomial|)
                           (|SparseUnivariatePolynomial|
                            (|Polynomial| (|Integer|)))
                           (QREFELT $ 441) (QREFELT $ 452) (QREFELT $ 453)))
                (QSETREFV $ 479
                          (CONS
                           (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;171|)
                           $))))
              ('T
               (QSETREFV $ 479
                         (CONS
                          (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;172|)
                          $))))
             (COND
              ((|testBitVector| |pv$| 25)
               (QSETREFV $ 486
                         (CONS
                          (|dispatchFunction| |EXPR;factorPolynomial;SupF;173|)
                          $)))))))
          (COND
           ((|domainEqual| |#1| (|AlgebraicNumber|))
            (QSETREFV $ 491
                      (CONS (|dispatchFunction| |EXPR;coerce;An$;174|) $))))
          (COND
           ((|testBitVector| |pv$| 14)
            (PROGN
             (QSETREFV $ 493 (CONS (|dispatchFunction| |EXPR;^;$F$;175|) $))
             (QSETREFV $ 138
                       (CONS (|dispatchFunction| |EXPR;minPoly;KSup;176|) $))
             (QSETREFV $ 496
                       (CONS
                        (|dispatchFunction| |EXPR;definingPolynomial;2$;177|)
                        $))
             (QSETREFV $ 498
                       (CONS (|dispatchFunction| |EXPR;retract;$F;178|) $))
             (QSETREFV $ 72
                       (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;179|)
                             $))
             (COND ((|domainEqual| |#1| (|AlgebraicNumber|)))
                   ('T
                    (PROGN
                     (QSETREFV $ 491
                               (CONS (|dispatchFunction| |EXPR;coerce;An$;180|)
                                     $))
                     (QSETREFV $ 514
                               (CONS
                                (|dispatchFunction| |EXPR;retractIfCan;$U;183|)
                                $))))))))
          (COND
           ((|testBitVector| |pv$| 9)
            (PROGN
             (QSETREFV $ 542
                       (CONS (|dispatchFunction| |EXPR;convert;$If;187|) $))
             (QSETREFV $ 545
                       (CONS (|dispatchFunction| |EXPR;eval;$Bo$S$;188|) $))
             (QSETREFV $ 544
                       (CONS (|dispatchFunction| |EXPR;eval;$LLS$;189|) $)))))
          (COND
           ((|testBitVector| |pv$| 13)
            (QSETREFV $ 567
                      (CONS (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;190|)
                            $))))
          (COND
           ((|testBitVector| |pv$| 12)
            (QSETREFV $ 573
                      (CONS (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;191|)
                            $))))))
        ('T
         (PROGN
          (SETELT $ 45 (|SparseMultivariatePolynomial| |#1| (|Kernel| $)))
          (QSETREFV $ 47
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;Zero;$;192|) $ 47)))
          (QSETREFV $ 49
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;One;$;193|) $ 49)))
          (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;194|) $))
          (QSETREFV $ 59 (CONS (|dispatchFunction| |EXPR;*;I2$;195|) $))
          (QSETREFV $ 63 (CONS (|dispatchFunction| |EXPR;*;3$;196|) $))
          (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;197|) $))
          (QSETREFV $ 102 (CONS (|dispatchFunction| |EXPR;=;2$B;198|) $))
          (QSETREFV $ 101
                    (CONS (|dispatchFunction| |EXPR;smaller?;2$B;199|) $))
          (QSETREFV $ 105 (CONS (|dispatchFunction| |EXPR;numer;$Smp;200|) $))
          (QSETREFV $ 109 (CONS (|dispatchFunction| |EXPR;coerce;Smp$;201|) $))
          (QSETREFV $ 111 (CONS (|dispatchFunction| |EXPR;coerce;P$;202|) $))
          (QSETREFV $ 154
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;203|) $))
          (QSETREFV $ 162
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;204|) $))
          (COND
           ((|testBitVector| |pv$| 9)
            (QSETREFV $ 542
                      (CONS (|dispatchFunction| |EXPR;convert;$If;205|) $))))
          (COND
           ((|testBitVector| |pv$| 13)
            (PROGN
             (QSETREFV $ 567
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;207|)
                        $)))))
          (COND
           ((|testBitVector| |pv$| 12)
            (PROGN
             (QSETREFV $ 573
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;209|)
                        $))))))))))
     ((|HasCategory| |#1| '(|AbelianMonoid|))
      (PROGN
       (SETELT $ 45 (|FreeAbelianGroup| (|Kernel| $)))
       (QSETREFV $ 47
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |EXPR;Zero;$;210|) $ 47)))
       (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;211|) $))
       (QSETREFV $ 102 (CONS (|dispatchFunction| |EXPR;=;2$B;212|) $))
       (QSETREFV $ 101 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;213|) $))
       (QSETREFV $ 142 (CONS (|dispatchFunction| |EXPR;coerce;K$;214|) $))
       (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;215|) $))
       (QSETREFV $ 515 (CONS (|dispatchFunction| |EXPR;coerce;R$;216|) $))
       (QSETREFV $ 426 (CONS (|dispatchFunction| |EXPR;retract;$R;217|) $))
       (QSETREFV $ 596 (CONS (|dispatchFunction| |EXPR;coerce;$Of;218|) $))
       (QSETREFV $ 606 (CONS (|dispatchFunction| |EXPR;isPlus;$U;221|) $))
       (QSETREFV $ 610 (CONS (|dispatchFunction| |EXPR;isMult;$U;222|) $))
       (QSETREFV $ 597 (CONS (|dispatchFunction| |EXPR;eval;$LL$;223|) $))
       (QSETREFV $ 602 (CONS (|dispatchFunction| |EXPR;subst;$LL$;224|) $))
       (QSETREFV $ 611
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;225|) $))
       (COND
        ((|testBitVector| |pv$| 19)
         (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;226|) $))))))
     ('T
      (PROGN
       (SETELT $ 45 (|Kernel| $))
       (QSETREFV $ 101 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;227|) $))
       (QSETREFV $ 102 (CONS (|dispatchFunction| |EXPR;=;2$B;228|) $))
       (QSETREFV $ 142 (CONS (|dispatchFunction| |EXPR;coerce;K$;229|) $))
       (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;230|) $))
       (QSETREFV $ 515 (CONS (|dispatchFunction| |EXPR;coerce;R$;231|) $))
       (QSETREFV $ 426 (CONS (|dispatchFunction| |EXPR;retract;$R;232|) $))
       (QSETREFV $ 611
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;233|) $))
       (QSETREFV $ 596 (CONS (|dispatchFunction| |EXPR;coerce;$Of;234|) $))
       (QSETREFV $ 597 (CONS (|dispatchFunction| |EXPR;eval;$LL$;235|) $))
       (QSETREFV $ 602 (CONS (|dispatchFunction| |EXPR;subst;$LL$;236|) $))
       (COND
        ((|testBitVector| |pv$| 9)
         (QSETREFV $ 542
                   (CONS (|dispatchFunction| |EXPR;convert;$If;237|) $)))))))
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
              (|Union| 87 '#1#) (220 . |retractIfCan|) (225 . |number?|)
              (|List| 12) (230 . |kernels|) (235 . |is?|) (241 . |first|)
              (|List| $$) (246 . |argument|) (251 . |#|) (256 . |elt|)
              (262 . ^) (268 . |One|) (|Fraction| 41) (272 . |One|)
              (276 . |algtower|) (|Fraction| 57) (281 . |One|) (285 . ^)
              (291 . |first|) (296 . |second|) (301 . |simplifyPower|)
              (307 . |Zero|) (311 . |numerator|) (316 . |denominator|)
              (321 . ^) (327 . ^) (|PositiveInteger|) (333 . ^)
              (339 . |smaller?|) (345 . |smaller?|) (351 . =) (357 . |numer|)
              (|SparseMultivariatePolynomial| 6 12) (362 . |numer|)
              (367 . |denom|) (372 . |denom|) 'EREP (377 . |coerce|)
              (|Polynomial| 6) (382 . |coerce|) (|Fraction| 110)
              (387 . |numer|) (392 . |denom|) (397 . |coerce|) (402 . |reduce|)
              (|Mapping| 9 15) (407 . |select!|)
              (|AlgebraicManipulations| 6 $$) (413 . |ratDenom|) (419 . |is?|)
              (425 . ~=) (431 . >) (|SparseUnivariatePolynomial| $)
              (437 . |univariate|) (|SparseUnivariatePolynomial| 41)
              (443 . |leadingCoefficient|) (448 . |reductum|) (453 . *)
              (459 . |monomial|) (466 . -) (472 . /)
              (478 . |getSimplifyDenomsFlag|) (482 . |setSimplifyDenomsFlag|)
              (487 . |elt|) (|SingletonAsOrderedSet|) (493 . |create|)
              (497 . |minPoly|) (|SparseUnivariatePolynomial| $$)
              (|PolynomialCategoryQuotientFunctions| 487 15 6 41 $$)
              (502 . |univariate|) (509 . |coerce|) (514 . |eval|)
              (521 . |retract|) (526 . /) (|Mapping| $$ $$) (|Matrix| $$)
              (532 . |map|) (|Matrix| 41) (|Matrix| $) (538 . |reducedSystem|)
              (|Matrix| 6) (543 . |reducedSystem|) (548 . |reducedSystem|)
              (|Vector| $$) (553 . |map|)
              (|Record| (|:| |mat| 149) (|:| |vec| (|Vector| 41))) (|Vector| $)
              (559 . |reducedSystem|)
              (|Record| (|:| |mat| 152) (|:| |vec| (|Vector| 6)))
              (565 . |reducedSystem|) (571 . |reducedSystem|) (577 . |member?|)
              (583 . |concat|) (|AlgebraicFunction| 6 $$) (589 . |rootOf|)
              (595 . |rootOf|) (601 . |rootSum|) (608 . |rootSum|)
              (|ElementaryFunction| 6 $$) (615 . |pi|) (619 . |pi|)
              (623 . |exp|) (628 . |exp|) (633 . |log|) (638 . |log|)
              (643 . |sin|) (648 . |sin|) (653 . |cos|) (658 . |cos|)
              (663 . |tan|) (668 . |tan|) (673 . |cot|) (678 . |cot|)
              (683 . |sec|) (688 . |sec|) (693 . |csc|) (698 . |csc|)
              (703 . |asin|) (708 . |asin|) (713 . |acos|) (718 . |acos|)
              (723 . |atan|) (728 . |atan|) (733 . |acot|) (738 . |acot|)
              (743 . |asec|) (748 . |asec|) (753 . |acsc|) (758 . |acsc|)
              (763 . |sinh|) (768 . |sinh|) (773 . |cosh|) (778 . |cosh|)
              (783 . |tanh|) (788 . |tanh|) (793 . |coth|) (798 . |coth|)
              (803 . |sech|) (808 . |sech|) (813 . |csch|) (818 . |csch|)
              (823 . |asinh|) (828 . |asinh|) (833 . |acosh|) (838 . |acosh|)
              (843 . |atanh|) (848 . |atanh|) (853 . |acoth|) (858 . |acoth|)
              (863 . |asech|) (868 . |asech|) (873 . |acsch|) (878 . |acsch|)
              (|FunctionalSpecialFunction| 6 $$) (883 . |abs|) (888 . |abs|)
              (893 . |Gamma|) (898 . |Gamma|) (903 . |Gamma|) (909 . |Gamma|)
              (915 . |Beta|) (921 . |Beta|) (927 . |digamma|) (932 . |digamma|)
              (937 . |polygamma|) (943 . |polygamma|) (949 . |besselJ|)
              (955 . |besselJ|) (961 . |besselY|) (967 . |besselY|)
              (973 . |besselI|) (979 . |besselI|) (985 . |besselK|)
              (991 . |besselK|) (997 . |airyAi|) (1002 . |airyAi|)
              (1007 . |airyAiPrime|) (1012 . |airyAiPrime|) (1017 . |airyBi|)
              (1022 . |airyBi|) (1027 . |airyBiPrime|) (1032 . |airyBiPrime|)
              (1037 . |lambertW|) (1042 . |lambertW|) (1047 . |polylog|)
              (1053 . |polylog|) (1059 . |weierstrassP|)
              (1066 . |weierstrassP|) (1073 . |weierstrassPPrime|)
              (1080 . |weierstrassPPrime|) (1087 . |weierstrassSigma|)
              (1094 . |weierstrassSigma|) (1101 . |weierstrassZeta|)
              (1108 . |weierstrassZeta|) (1115 . |weierstrassPInverse|)
              (1122 . |weierstrassPInverse|) (1129 . |whittakerM|)
              (1136 . |whittakerM|) (1143 . |whittakerW|) (1150 . |whittakerW|)
              (1157 . |angerJ|) (1163 . |angerJ|) (1169 . |weberE|)
              (1175 . |weberE|) (1181 . |struveH|) (1187 . |struveH|)
              (1193 . |struveL|) (1199 . |struveL|) (1205 . |hankelH1|)
              (1211 . |hankelH1|) (1217 . |hankelH2|) (1223 . |hankelH2|)
              (1229 . |lommelS1|) (1236 . |lommelS1|) (1243 . |lommelS2|)
              (1250 . |lommelS2|) (1257 . |kummerM|) (1264 . |kummerM|)
              (1271 . |kummerU|) (1278 . |kummerU|) (1285 . |legendreP|)
              (1292 . |legendreP|) (1299 . |legendreQ|) (1306 . |legendreQ|)
              (1313 . |kelvinBei|) (1319 . |kelvinBei|) (1325 . |kelvinBer|)
              (1331 . |kelvinBer|) (1337 . |kelvinKei|) (1343 . |kelvinKei|)
              (1349 . |kelvinKer|) (1355 . |kelvinKer|) (1361 . |ellipticK|)
              (1366 . |ellipticK|) (1371 . |ellipticE|) (1376 . |ellipticE|)
              (1381 . |ellipticE|) (1387 . |ellipticE|) (1393 . |ellipticF|)
              (1399 . |ellipticF|) (1405 . |ellipticPi|) (1412 . |ellipticPi|)
              (1419 . |jacobiSn|) (1425 . |jacobiSn|) (1431 . |jacobiCn|)
              (1437 . |jacobiCn|) (1443 . |jacobiDn|) (1449 . |jacobiDn|)
              (1455 . |jacobiZeta|) (1461 . |jacobiZeta|)
              (1467 . |jacobiTheta|) (1473 . |jacobiTheta|) (1479 . |lerchPhi|)
              (1486 . |lerchPhi|) (1493 . |riemannZeta|) (1498 . |riemannZeta|)
              (1503 . |charlierC|) (1510 . |charlierC|) (1517 . |hermiteH|)
              (1523 . |hermiteH|) (1529 . |jacobiP|) (1537 . |jacobiP|)
              (1545 . |laguerreL|) (1552 . |laguerreL|) (1559 . |meixnerM|)
              (1567 . |meixnerM|) (1575 . |hypergeometricF|) (|List| $)
              (1582 . |hypergeometricF|) (1589 . |meijerG|) (1598 . |meijerG|)
              (|CombinatorialFunction| 6 $$) (1607 . ^) (1613 . |factorial|)
              (1618 . |factorial|) (1623 . |binomial|) (1629 . |binomial|)
              (1635 . |permutation|) (1641 . |permutation|)
              (1647 . |factorials|) (1652 . |factorials|) (1657 . |factorials|)
              (1663 . |factorials|) (1669 . |summation|) (1675 . |summation|)
              (|SegmentBinding| $$) (1681 . |summation|) (|SegmentBinding| $)
              (1687 . |summation|) (1693 . |product|) (1699 . |product|)
              (1705 . |product|) (1711 . |product|)
              (|LiouvillianFunction| 6 $$) (1717 . |erf|) (1722 . |erf|)
              (1727 . |erfi|) (1732 . |erfi|) (1737 . |Ei|) (1742 . |Ei|)
              (1747 . |Si|) (1752 . |Si|) (1757 . |Ci|) (1762 . |Ci|)
              (1767 . |Shi|) (1772 . |Shi|) (1777 . |Chi|) (1782 . |Chi|)
              (1787 . |li|) (1792 . |li|) (1797 . |dilog|) (1802 . |dilog|)
              (1807 . |fresnelS|) (1812 . |fresnelS|) (1817 . |fresnelC|)
              (1822 . |fresnelC|) (1827 . |integral|) (1833 . |integral|)
              (1839 . |integral|) (1845 . |integral|) (1851 . |belong?|)
              (1856 . |operator|) (1861 . |belong?|) (1866 . |operator|)
              (1871 . |belong?|) (1876 . |operator|) (1881 . |belong?|)
              (1886 . |operator|) (1891 . |belong?|) (1896 . |operator|)
              (1901 . |coerce|) (|Fraction| 406)
              (|PolynomialCategoryQuotientFunctions| 487 15 6 41 84)
              (1906 . |univariate|) (|SparseUnivariatePolynomial| 84)
              (1912 . |numer|) (1917 . |degree|) (1923 . |degree|)
              (1928 . |rem|) (1934 . |coerce|) (1939 . |elt|) (1945 . |Zero|)
              (1949 . ~=) (1955 . |leadingCoefficient|) (1960 . |reductum|)
              (1965 . |concat|) (1971 . |removeDuplicates|) (1976 . =)
              (1982 . |coefficients|) (|Mapping| 9 $$) (1987 . |every?|)
              (|Mapping| 41 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 139 41 126)
              (1993 . |map|) (1999 . |retract|) (2004 . |monomial|)
              (2010 . |coerce|) (2015 . -) (2021 . =) (|Polynomial| 57)
              (2027 . |One|) (2031 . |One|) (2035 . |monomial|)
              (2042 . |coerce|) (|Mapping| 431 15) (|Mapping| 431 57)
              (|PolynomialCategoryLifting| 487 15 57 41 431) (2047 . |map|)
              (2054 . |multivariate|) 'MD 'MOP1 'MGCD1 (2060 . |coerce|)
              (|Mapping| 41 27) (|Mapping| 41 57)
              (|PolynomialCategoryLifting| (|IndexedExponents| 27) 27 57 431
                                           41)
              (2065 . |map|) (|Mapping| $$ 41)
              (|UnivariatePolynomialCategoryFunctions2| 41 126 $$ 139)
              (2072 . |map|) 'MEV2 'MOP2 'MGCD2 (|Fraction| 431) (2078 . /)
              (2084 . |coerce|) (|SparseUnivariatePolynomial| 455)
              (2089 . |coerce|) (|Mapping| 455 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 139 455 458)
              (2094 . |map|) (2100 . =) (2106 . |One|) (2110 . |gcdPolynomial|)
              (2116 . |concat|) (2122 . |algtower|) (2127 . |kernels|)
              (2132 . |setUnion|) (2138 . |sort|) (2143 . |new|)
              (2147 . |cons|) (2153 . |setDifference|) (|List| 431)
              (2159 . |algebraicGcd|)
              (|Record| (|:| |var| 27) (|:| |coef| 458)) (|List| 476)
              (2169 . |algebraicGcd|) (2179 . |gcdPolynomial|)
              (|GcdDomain&| $$) (2185 . |gcdPolynomial|) (|Factored| 139)
              (|ExpressionFactorPolynomial| 6 $$) (2191 . |factorPolynomial|)
              (|Factored| 124) (2196 . |factorPolynomial|)
              (|IndexedExponents| 15) (2201 . |Zero|) (2205 . |monomial|)
              (|AlgebraicNumber|) (2211 . |coerce|) (2216 . ^) (2222 . ^)
              (2228 . |minPoly|) (2233 . |definingPolynomial|)
              (2238 . |definingPolynomial|) (2243 . |retract|)
              (2248 . |retract|) (2253 . |retractIfCan|)
              (|SparseMultivariatePolynomial| 57 12) (2258 . |numer|)
              (2263 . |denom|) (|Mapping| $$ 490) (|Kernel| 490)
              (|ExpressionSpaceFunctions2| 490 $$) (2268 . |map|)
              (|Mapping| $$ 504) (|Mapping| $$ 57)
              (|SparseMultivariatePolynomial| 57 504)
              (|PolynomialCategoryLifting| (|IndexedExponents| 504) 504 57 509
                                           $$)
              (2274 . |map|) (2281 . /) (|Union| 490 '"failed")
              (2287 . |retractIfCan|) (2292 . |coerce|) (2297 . |coerce|)
              (2302 . |belong?|) (2307 . |is?|) (|Union| 27 '#1#)
              (2313 . |retractIfCan|) (2318 . ~=)
              (|SparseUnivariatePolynomial| 490) (2324 . |Zero|)
              (2328 . |Zero|) (2332 . ~=) (2338 . |degree|) (2343 . |monomial|)
              (2349 . +) (2355 . |rootOf|) (2361 . |operator|) (2366 . |elt|)
              (|Union| 15 '"failed") (2372 . |mainVariable|)
              (2377 . |leadingCoefficient|) (2382 . |Zero|) (2386 . |ground?|)
              (2391 . ^) (2397 . *) (2403 . +) (|InputForm|) (2409 . |convert|)
              (2414 . |convert|) (|List| 10) (2419 . |eval|) (2427 . |eval|)
              (2435 . |variables|) (2440 . |concat|)
              (2445 . |removeDuplicates|) (2450 . |scripted?|) (|Mapping| 9 27)
              (2455 . |select|) (|MakeUnaryCompiledFunction| $$ $$ $$)
              (2461 . |compiledFunction|) (|Mapping| $ $) (|List| 554)
              (2467 . |eval|) (2474 . |coerce|) (|Equation| $$) (2479 . =)
              (|List| 641) (2485 . |subst|) (|PatternMatchResult| 57 $$)
              (|Pattern| 57) (|PatternMatchFunctionSpace| 57 6 $$)
              (2491 . |patternMatch|) (|PatternMatchResult| 57 $)
              (2498 . |patternMatch|) (|PatternMatchResult| (|Float|) $$)
              (|Pattern| (|Float|))
              (|PatternMatchFunctionSpace| (|Float|) 6 $$)
              (2505 . |patternMatch|) (|PatternMatchResult| (|Float|) $)
              (2512 . |patternMatch|) (2519 . |reducedSystem|)
              (2524 . |reducedSystem|) (|PatternMatchKernel| 57 $$)
              (2530 . |patternMatch|) (|PatternMatchResult| 57 45)
              (|Mapping| 578 15 563 578)
              (|PatternMatchPolynomialCategory| 57 487 15 6 45)
              (2537 . |patternMatch|) (|PatternMatchKernel| (|Float|) $$)
              (2545 . |patternMatch|) (|PatternMatchResult| (|Float|) 45)
              (|Mapping| 584 15 569 584)
              (|PatternMatchPolynomialCategory| (|Float|) 487 15 6 45)
              (2552 . |patternMatch|) (2560 . |coerce|)
              (|Record| (|:| |gen| 15) (|:| |exp| 57)) (|List| 589)
              (2565 . |terms|) (2570 . |zero?|) (2575 . |constantKernel|)
              (|OutputForm|) (2580 . |coerce|) (2585 . |coerce|)
              (2590 . |eval|) (2597 . |map|) (|Mapping| $$ 15)
              (|ListToMap| 15 $$) (2603 . |match|) (2611 . |subst|)
              (2618 . |kernel|) (2624 . *) (|Union| 339 '#2="failed")
              (2630 . |isPlus|) (2635 . |first|)
              (|Record| (|:| |coef| 57) (|:| |var| 12)) (|Union| 608 '#2#)
              (2640 . |isMult|) (2645 . |retractIfCan|)
              (|Union| 158 '#3="failed") (|Union| 614 '#3#) (|List| 124)
              (|Matrix| 57)
              (|Record| (|:| |mat| 615) (|:| |vec| (|Vector| 57)))
              (|Union| $ '"failed") (|Factored| $) (|Fraction| 6)
              (|Fraction| 621) (|Polynomial| 619) (|Fraction| 124)
              (|Union| 112 '#1#) (|Polynomial| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |coef| 339) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 630 '"failed") (|Union| 57 '#1#)
              (|Record| (|:| |var| 12) (|:| |exponent| 57)) (|Union| 633 '#2#)
              (|Record| (|:| |val| $) (|:| |exponent| 57)) (|Union| 635 '#2#)
              (|List| 35) (|Mapping| $ 339) (|List| 638) (|Union| 110 '#1#)
              (|Equation| $) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 2650 |zerosOf| 2656 |zeroOf| 2683 |zero?| 2710 |whittakerW|
              2715 |whittakerM| 2722 |weierstrassZeta| 2729 |weierstrassSigma|
              2736 |weierstrassPPrime| 2743 |weierstrassPInverse| 2750
              |weierstrassP| 2757 |weberE| 2764 |variables| 2770 |univariate|
              2780 |unitNormal| 2786 |unitCanonical| 2791 |unit?| 2796 |tower|
              2801 |tanh| 2811 |tan| 2816 |summation| 2821 |subtractIfCan| 2833
              |subst| 2839 |struveL| 2858 |struveH| 2864 |squareFreePolynomial|
              2870 |squareFreePart| 2875 |squareFree| 2880 |sqrt| 2885
              |solveLinearPolynomialEquation| 2890 |smaller?| 2896 |sizeLess?|
              2902 |sinh| 2908 |sin| 2913 |simplifyPower| 2918
              |setSimplifyDenomsFlag| 2924 |sech| 2929 |sec| 2934 |sample| 2939
              |rootsOf| 2943 |rootSum| 2970 |rootOf| 2977 |riemannZeta| 3004
              |retractIfCan| 3009 |retract| 3049 |rem| 3089 |reducedSystem|
              3095 |reduce| 3117 |recip| 3122 |quo| 3127 |product| 3133
              |principalIdeal| 3145 |prime?| 3150 |polylog| 3155 |polygamma|
              3161 |pi| 3167 |permutation| 3171 |patternMatch| 3177 |paren|
              3191 |opposite?| 3201 |operators| 3207 |operator| 3212 |one?|
              3217 |odd?| 3222 |numerator| 3227 |numer| 3232 |number?| 3237
              |nthRoot| 3242 |multiEuclidean| 3248 |minPoly| 3254 |meixnerM|
              3259 |meijerG| 3267 |map| 3276 |mainKernel| 3282 |lommelS2| 3287
              |lommelS1| 3294 |log| 3301 |li| 3306 |lerchPhi| 3311 |legendreQ|
              3318 |legendreP| 3325 |lcmCoef| 3332 |lcm| 3338 |latex| 3349
              |lambertW| 3354 |laguerreL| 3359 |kummerU| 3366 |kummerM| 3373
              |kernels| 3380 |kernel| 3390 |kelvinKer| 3402 |kelvinKei| 3408
              |kelvinBer| 3414 |kelvinBei| 3420 |jacobiZeta| 3426 |jacobiTheta|
              3432 |jacobiSn| 3438 |jacobiP| 3444 |jacobiDn| 3452 |jacobiCn|
              3458 |isTimes| 3464 |isPower| 3469 |isPlus| 3474 |isMult| 3479
              |isExpt| 3484 |is?| 3501 |inv| 3513 |integral| 3518
              |hypergeometricF| 3530 |hermiteH| 3537 |height| 3543
              |hashUpdate!| 3548 |hash| 3554 |hankelH2| 3559 |hankelH1| 3565
              |ground?| 3571 |ground| 3576 |getSimplifyDenomsFlag| 3581
              |gcdPolynomial| 3585 |gcd| 3591 |fresnelS| 3602 |fresnelC| 3607
              |freeOf?| 3612 |factorials| 3624 |factorial| 3635
              |factorSquareFreePolynomial| 3640 |factorPolynomial| 3645
              |factor| 3650 |extendedEuclidean| 3655 |exquo| 3668
              |expressIdealMember| 3674 |exp| 3680 |even?| 3685 |eval| 3690
              |euclideanSize| 3851 |erfi| 3856 |erf| 3861 |elt| 3866
              |ellipticPi| 3962 |ellipticK| 3969 |ellipticF| 3974 |ellipticE|
              3980 |divide| 3991 |distribute| 3997 |dilog| 4008 |digamma| 4013
              |differentiate| 4018 |denominator| 4044 |denom| 4049
              |definingPolynomial| 4054 |csch| 4059 |csc| 4064 |coth| 4069
              |cot| 4074 |cosh| 4079 |cos| 4084 |convert| 4089 |conjugate| 4109
              |conditionP| 4115 |commutator| 4120 |coerce| 4126 |charthRoot|
              4196 |charlierC| 4201 |characteristic| 4208 |box| 4212 |binomial|
              4222 |besselY| 4228 |besselK| 4234 |besselJ| 4240 |besselI| 4246
              |belong?| 4252 |atanh| 4257 |atan| 4262 |associates?| 4267
              |asinh| 4273 |asin| 4278 |asech| 4283 |asec| 4288 |applyQuote|
              4293 |annihilate?| 4329 |angerJ| 4335 |algtower| 4341
              |airyBiPrime| 4351 |airyBi| 4356 |airyAiPrime| 4361 |airyAi| 4366
              |acsch| 4371 |acsc| 4376 |acoth| 4381 |acot| 4386 |acosh| 4391
              |acos| 4396 |abs| 4401 ^ 4406 |Zero| 4436 |Si| 4440 |Shi| 4445
              |One| 4450 |Gamma| 4454 |Ei| 4465 D 4470 |Ci| 4496 |Chi| 4501
              |Beta| 4506 = 4512 / 4518 - 4530 + 4541 * 4547)
           'NIL
           (CONS
            (|makeByteWordVec2| 30
                                '(1 0 1 1 26 1 1 1 1 1 1 1 1 1 2 5 1 1 1 2 3 4
                                  5 7 1 5 1 1 2 18 1 1 1 6 2 2 18 20 8 5 20 0 0
                                  5 30 28 0 12 13 30 1 28 0 0 0 0 1 1 0 0 0 0 0
                                  0 0 0 16 1 1 1 1 1 5 9 10 11 14 15 17 1 1 1 1
                                  1 1 1 1 1))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |FunctionSpace&|
                |AlgebraicallyClosedField&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| |DivisionRing&|
                NIL |Algebra&| NIL |Algebra&| |Algebra&|
                |FullyLinearlyExplicitRingOver&| |Module&| |EntireRing&|
                |Module&| |Module&| NIL NIL NIL NIL NIL
                |PartialDifferentialRing&| NIL NIL NIL |Ring&| NIL NIL NIL NIL
                NIL NIL |Rng&| |AbelianGroup&| |Group&| NIL NIL
                |ExpressionSpace&| NIL NIL |Monoid&| |AbelianMonoid&| NIL NIL
                NIL |SemiGroup&| NIL |AbelianSemiGroup&| |SetCategory&|
                |FullyRetractableTo&| NIL |Evalable&|
                |TranscendentalFunctionCategory&| NIL |BasicType&|
                |RetractableTo&| NIL |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |RetractableTo&|
                |RetractableTo&| NIL NIL NIL NIL |RetractableTo&| NIL NIL NIL
                |RetractableTo&| |RetractableTo&| NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL |RadicalCategory&|)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 6) (|FunctionSpace| 6)
                 (|AlgebraicallyClosedField|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|Algebra| $$) (|LeftOreRing|) (|Algebra| 87) (|Algebra| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Module| $$)
                 (|EntireRing|) (|Module| 87) (|Module| 6)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 6) (|LinearlyExplicitRingOver| 57)
                 (|CommutativeRing|) (|PartialDifferentialRing| 27)
                 (|BiModule| $$ $$) (|BiModule| 87 87) (|BiModule| 6 6)
                 (|Ring|) (|RightModule| $$) (|LeftModule| 87)
                 (|RightModule| 87) (|LeftModule| $$) (|LeftModule| 6)
                 (|RightModule| 6) (|Rng|) (|AbelianGroup|) (|Group|)
                 (|SemiRing|) (|CancellationAbelianMonoid|) (|ExpressionSpace|)
                 (|FullyPatternMatchable| 6) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|Comparable|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 57)
                 (|SemiGroup|) (|LiouvillianFunctionCategory|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|FullyRetractableTo| 6)
                 (|Patternable| 6) (|Evalable| $$)
                 (|TranscendentalFunctionCategory|)
                 (|CombinatorialOpsCategory|) (|BasicType|) (|RetractableTo| 6)
                 (|Type|) (|RetractableTo| 27) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| 15 $$) (|RetractableTo| 15)
                 (|CoercibleTo| 594) (|RetractableTo| 87)
                 (|RetractableTo| (|Fraction| (|Polynomial| 6)))
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|RetractableTo| (|Polynomial| 6))
                 (|ConvertibleTo| 540) (|ConvertibleTo| 569)
                 (|ConvertibleTo| 563) (|RetractableTo| 57)
                 (|RetractableTo| 490) (|unitsKnown|)
                 (|SpecialFunctionCategory|) (|PrimitiveFunctionCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|CombinatorialFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 644
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
                                    57 82 0 41 0 83 0 84 0 85 1 0 74 0 86 0 87
                                    0 88 2 0 0 0 0 89 1 78 2 0 90 1 78 2 0 91 2
                                    0 0 0 57 92 0 6 0 93 1 0 0 0 94 1 0 0 0 95
                                    2 0 0 0 35 96 2 0 0 0 57 97 2 0 0 0 98 99 2
                                    45 9 0 0 100 2 0 9 0 0 101 2 0 9 0 0 102 1
                                    45 41 0 103 1 0 104 0 105 1 45 41 0 106 1 0
                                    104 0 107 1 0 0 104 109 1 0 0 110 111 1 112
                                    110 0 113 1 112 110 0 114 1 0 0 112 115 1 0
                                    0 0 116 2 42 0 117 0 118 2 119 2 2 42 120 2
                                    15 9 0 27 121 2 0 9 0 0 122 2 35 9 0 0 123
                                    2 41 124 0 15 125 1 126 41 0 127 1 126 0 0
                                    128 2 41 0 0 0 129 3 41 0 0 15 35 130 2 41
                                    0 0 0 131 2 45 0 41 41 132 0 0 9 133 1 0 9
                                    9 134 2 42 15 0 57 135 0 136 0 137 1 0 124
                                    12 138 3 140 139 2 15 139 141 1 0 0 12 142
                                    3 139 0 0 136 2 143 1 139 2 0 144 2 0 0 104
                                    104 145 2 147 0 146 0 148 1 45 149 150 151
                                    1 41 152 150 153 1 0 152 150 154 2 155 0
                                    146 0 156 2 45 157 150 158 159 2 41 160 150
                                    158 161 2 0 160 150 158 162 2 42 9 15 0 163
                                    2 42 0 15 0 164 2 165 2 139 27 166 2 0 0
                                    124 27 167 3 165 2 2 139 27 168 3 0 0 0 124
                                    27 169 0 170 2 171 0 0 0 172 1 170 2 2 173
                                    1 0 0 0 174 1 170 2 2 175 1 0 0 0 176 1 170
                                    2 2 177 1 0 0 0 178 1 170 2 2 179 1 0 0 0
                                    180 1 170 2 2 181 1 0 0 0 182 1 170 2 2 183
                                    1 0 0 0 184 1 170 2 2 185 1 0 0 0 186 1 170
                                    2 2 187 1 0 0 0 188 1 170 2 2 189 1 0 0 0
                                    190 1 170 2 2 191 1 0 0 0 192 1 170 2 2 193
                                    1 0 0 0 194 1 170 2 2 195 1 0 0 0 196 1 170
                                    2 2 197 1 0 0 0 198 1 170 2 2 199 1 0 0 0
                                    200 1 170 2 2 201 1 0 0 0 202 1 170 2 2 203
                                    1 0 0 0 204 1 170 2 2 205 1 0 0 0 206 1 170
                                    2 2 207 1 0 0 0 208 1 170 2 2 209 1 0 0 0
                                    210 1 170 2 2 211 1 0 0 0 212 1 170 2 2 213
                                    1 0 0 0 214 1 170 2 2 215 1 0 0 0 216 1 170
                                    2 2 217 1 0 0 0 218 1 170 2 2 219 1 0 0 0
                                    220 1 170 2 2 221 1 0 0 0 222 1 170 2 2 223
                                    1 0 0 0 224 1 225 2 2 226 1 0 0 0 227 1 225
                                    2 2 228 1 0 0 0 229 2 225 2 2 2 230 2 0 0 0
                                    0 231 2 225 2 2 2 232 2 0 0 0 0 233 1 225 2
                                    2 234 1 0 0 0 235 2 225 2 2 2 236 2 0 0 0 0
                                    237 2 225 2 2 2 238 2 0 0 0 0 239 2 225 2 2
                                    2 240 2 0 0 0 0 241 2 225 2 2 2 242 2 0 0 0
                                    0 243 2 225 2 2 2 244 2 0 0 0 0 245 1 225 2
                                    2 246 1 0 0 0 247 1 225 2 2 248 1 0 0 0 249
                                    1 225 2 2 250 1 0 0 0 251 1 225 2 2 252 1 0
                                    0 0 253 1 225 2 2 254 1 0 0 0 255 2 225 2 2
                                    2 256 2 0 0 0 0 257 3 225 2 2 2 2 258 3 0 0
                                    0 0 0 259 3 225 2 2 2 2 260 3 0 0 0 0 0 261
                                    3 225 2 2 2 2 262 3 0 0 0 0 0 263 3 225 2 2
                                    2 2 264 3 0 0 0 0 0 265 3 225 2 2 2 2 266 3
                                    0 0 0 0 0 267 3 225 2 2 2 2 268 3 0 0 0 0 0
                                    269 3 225 2 2 2 2 270 3 0 0 0 0 0 271 2 225
                                    2 2 2 272 2 0 0 0 0 273 2 225 2 2 2 274 2 0
                                    0 0 0 275 2 225 2 2 2 276 2 0 0 0 0 277 2
                                    225 2 2 2 278 2 0 0 0 0 279 2 225 2 2 2 280
                                    2 0 0 0 0 281 2 225 2 2 2 282 2 0 0 0 0 283
                                    3 225 2 2 2 2 284 3 0 0 0 0 0 285 3 225 2 2
                                    2 2 286 3 0 0 0 0 0 287 3 225 2 2 2 2 288 3
                                    0 0 0 0 0 289 3 225 2 2 2 2 290 3 0 0 0 0 0
                                    291 3 225 2 2 2 2 292 3 0 0 0 0 0 293 3 225
                                    2 2 2 2 294 3 0 0 0 0 0 295 2 225 2 2 2 296
                                    2 0 0 0 0 297 2 225 2 2 2 298 2 0 0 0 0 299
                                    2 225 2 2 2 300 2 0 0 0 0 301 2 225 2 2 2
                                    302 2 0 0 0 0 303 1 225 2 2 304 1 0 0 0 305
                                    1 225 2 2 306 1 0 0 0 307 2 225 2 2 2 308 2
                                    0 0 0 0 309 2 225 2 2 2 310 2 0 0 0 0 311 3
                                    225 2 2 2 2 312 3 0 0 0 0 0 313 2 225 2 2 2
                                    314 2 0 0 0 0 315 2 225 2 2 2 316 2 0 0 0 0
                                    317 2 225 2 2 2 318 2 0 0 0 0 319 2 225 2 2
                                    2 320 2 0 0 0 0 321 2 225 2 2 2 322 2 0 0 0
                                    0 323 3 225 2 2 2 2 324 3 0 0 0 0 0 325 1
                                    225 2 2 326 1 0 0 0 327 3 225 2 2 2 2 328 3
                                    0 0 0 0 0 329 2 225 2 2 2 330 2 0 0 0 0 331
                                    4 225 2 2 2 2 2 332 4 0 0 0 0 0 0 333 3 225
                                    2 2 2 2 334 3 0 0 0 0 0 335 4 225 2 2 2 2 2
                                    336 4 0 0 0 0 0 0 337 3 225 2 78 78 2 338 3
                                    0 0 339 339 0 340 5 225 2 78 78 78 78 2 341
                                    5 0 0 339 339 339 339 0 342 2 343 2 2 2 344
                                    1 343 2 2 345 1 0 0 0 346 2 343 2 2 2 347 2
                                    0 0 0 0 348 2 343 2 2 2 349 2 0 0 0 0 350 1
                                    343 2 2 351 1 0 0 0 352 2 343 2 2 27 353 2
                                    0 0 0 27 354 2 343 2 2 27 355 2 0 0 0 27
                                    356 2 343 2 2 357 358 2 0 0 0 359 360 2 343
                                    2 2 27 361 2 0 0 0 27 362 2 343 2 2 357 363
                                    2 0 0 0 359 364 1 365 2 2 366 1 0 0 0 367 1
                                    365 2 2 368 1 0 0 0 369 1 365 2 2 370 1 0 0
                                    0 371 1 365 2 2 372 1 0 0 0 373 1 365 2 2
                                    374 1 0 0 0 375 1 365 2 2 376 1 0 0 0 377 1
                                    365 2 2 378 1 0 0 0 379 1 365 2 2 380 1 0 0
                                    0 381 1 365 2 2 382 1 0 0 0 383 1 365 2 2
                                    384 1 0 0 0 385 1 365 2 2 386 1 0 0 0 387 2
                                    365 2 2 27 388 2 0 0 0 27 389 2 365 2 2 357
                                    390 2 0 0 0 359 391 1 165 9 10 392 1 165 10
                                    10 393 1 170 9 10 394 1 170 10 10 395 1 343
                                    9 10 396 1 343 10 10 397 1 365 9 10 398 1
                                    365 10 10 399 1 225 9 10 400 1 225 10 10
                                    401 1 84 0 41 402 2 404 403 84 15 405 1 403
                                    406 0 407 2 41 35 0 15 408 1 139 35 0 409 2
                                    139 0 0 0 410 1 41 0 15 411 2 406 84 0 84
                                    412 0 139 0 413 2 139 9 0 0 414 1 139 2 0
                                    415 1 139 0 0 416 2 42 0 0 0 417 1 42 0 0
                                    418 2 41 9 0 0 419 1 139 78 0 420 2 78 9
                                    421 0 422 2 424 126 423 139 425 1 0 6 0 426
                                    2 126 0 41 35 427 1 126 0 41 428 2 126 0 0
                                    0 429 2 15 9 0 0 430 0 431 0 432 0 35 0 433
                                    3 431 0 0 27 35 434 1 431 0 57 435 3 438
                                    431 436 437 41 439 2 41 0 124 15 440 1 41 0
                                    57 444 3 447 41 445 446 431 448 2 450 139
                                    449 126 451 2 455 0 431 431 456 1 455 0 431
                                    457 1 458 0 455 459 2 461 458 460 139 462 2
                                    139 9 0 0 463 0 139 0 464 2 45 124 124 124
                                    465 2 78 0 0 0 466 1 0 74 339 467 1 0 74
                                    339 468 2 42 0 0 0 469 1 42 0 0 470 0 27 0
                                    471 2 42 0 15 0 472 2 38 0 0 0 473 6 443
                                    431 431 431 474 38 27 38 475 6 454 431 476
                                    476 477 38 27 38 478 2 0 124 124 124 479 2
                                    480 124 124 124 481 1 483 482 139 484 1 0
                                    485 124 486 0 487 0 488 2 41 0 6 487 489 1
                                    0 0 490 491 2 165 2 2 87 492 2 0 0 0 87 493
                                    1 165 139 15 494 1 165 2 2 495 1 0 0 0 496
                                    1 45 87 0 497 1 0 87 0 498 1 45 71 0 499 1
                                    490 500 0 501 1 490 500 0 502 2 505 2 503
                                    504 506 3 510 2 507 508 509 511 2 490 0 0 0
                                    512 1 0 513 0 514 1 0 0 6 515 1 490 0 87
                                    516 1 490 9 10 517 2 10 9 0 27 518 1 0 519
                                    0 520 2 41 9 0 0 521 0 522 0 523 0 126 0
                                    524 2 126 9 0 0 525 1 126 35 0 526 2 522 0
                                    490 35 527 2 522 0 0 0 528 2 490 0 124 27
                                    529 1 490 10 10 530 2 490 0 10 339 531 1 41
                                    532 0 533 1 41 6 0 534 0 490 0 535 1 126 9
                                    0 536 2 490 0 0 35 537 2 490 0 0 0 538 2
                                    490 0 0 0 539 1 45 540 0 541 1 0 540 0 542
                                    4 0 0 0 543 339 27 544 4 0 0 0 10 0 27 545
                                    1 0 38 0 546 1 38 0 339 547 1 38 0 0 548 1
                                    27 9 0 549 2 38 0 550 0 551 2 552 146 2 27
                                    553 3 0 0 0 543 555 556 1 0 0 27 557 2 558
                                    0 2 2 559 2 0 0 0 560 561 3 564 562 2 563
                                    562 565 3 0 566 0 563 566 567 3 570 568 2
                                    569 568 571 3 0 572 0 569 572 573 1 45 152
                                    150 574 2 45 160 150 158 575 3 576 562 15
                                    563 562 577 4 580 578 45 563 578 579 581 3
                                    582 568 15 569 568 583 4 586 584 45 569 584
                                    585 587 1 45 0 15 588 1 45 590 0 591 1 6 9
                                    0 592 1 16 15 6 593 1 45 594 0 595 1 0 594
                                    0 596 3 0 0 0 74 339 597 2 0 0 554 12 598 4
                                    600 2 42 78 15 599 601 3 0 0 0 74 339 602 2
                                    0 0 10 339 603 2 45 0 57 15 604 1 0 605 0
                                    606 1 590 589 0 607 1 0 609 0 610 1 0 14 0
                                    611 2 0 9 0 0 122 2 1 339 0 27 1 1 1 339 0
                                    1 2 1 339 124 27 1 1 1 339 124 1 1 1 339
                                    624 1 2 1 0 0 27 1 1 1 0 0 1 2 1 0 124 27 1
                                    1 1 0 624 1 1 1 0 124 1 1 27 9 0 54 3 1 0 0
                                    0 0 271 3 1 0 0 0 0 269 3 1 0 0 0 0 265 3 1
                                    0 0 0 0 263 3 1 0 0 0 0 261 3 1 0 0 0 0 267
                                    3 1 0 0 0 0 259 2 1 0 0 0 275 1 0 38 339 1
                                    1 0 38 0 546 2 1 622 0 12 1 1 1 625 0 1 1 1
                                    0 0 1 1 1 9 0 1 1 0 74 339 1 1 0 74 0 1 1 1
                                    0 0 206 1 1 0 0 182 2 1 0 0 359 360 2 1 0 0
                                    27 356 2 19 617 0 0 1 2 0 0 0 560 561 3 0 0
                                    0 74 339 602 2 0 0 0 641 1 2 1 0 0 0 279 2
                                    1 0 0 0 277 1 26 485 124 1 1 1 0 0 1 1 1
                                    618 0 1 1 1 0 0 1 2 26 613 614 124 1 2 0 9
                                    0 0 101 2 1 9 0 0 1 1 1 0 0 202 1 1 0 0 178
                                    2 1 0 0 57 92 1 1 9 9 134 1 1 0 0 210 1 1 0
                                    0 186 0 31 0 1 2 1 339 0 27 1 1 1 339 0 1 2
                                    1 339 124 27 1 1 1 339 624 1 1 1 339 124 1
                                    3 1 0 0 124 27 169 2 1 0 0 27 1 1 1 0 0 1 2
                                    1 0 124 27 167 1 1 0 624 1 1 1 0 124 1 1 1
                                    0 0 327 1 15 513 0 514 1 16 71 0 72 1 1 623
                                    0 1 1 14 632 0 1 1 5 640 0 1 1 0 14 0 611 1
                                    0 519 0 520 1 0 18 0 19 1 15 490 0 1 1 16
                                    87 0 498 1 1 112 0 1 1 14 57 0 1 1 5 110 0
                                    1 1 0 6 0 426 1 0 27 0 1 1 0 12 0 13 2 1 0
                                    0 0 1 1 24 615 150 1 2 24 616 150 158 1 2 5
                                    160 150 158 162 1 5 152 150 154 1 1 0 0 116
                                    1 29 617 0 1 2 1 0 0 0 1 2 1 0 0 359 364 2
                                    1 0 0 27 362 1 1 627 339 1 1 1 9 0 1 2 1 0
                                    0 0 257 2 1 0 0 0 237 0 1 0 172 2 1 0 0 0
                                    350 3 12 572 0 569 572 573 3 13 566 0 563
                                    566 567 1 0 0 339 1 1 0 0 0 1 2 27 9 0 0 1
                                    1 0 543 0 1 1 0 10 10 37 1 29 9 0 52 1 32 9
                                    0 1 1 5 0 0 94 1 5 104 0 105 1 1 9 0 73 2 1
                                    0 0 57 1 2 1 605 339 0 1 1 33 124 12 138 4
                                    1 0 0 0 0 0 337 5 34 0 339 339 339 339 0
                                    342 2 0 0 554 12 598 1 0 18 0 1 3 1 0 0 0 0
                                    287 3 1 0 0 0 0 285 1 1 0 0 176 1 1 0 0 381
                                    3 1 0 0 0 0 325 3 1 0 0 0 0 295 3 1 0 0 0 0
                                    293 2 1 626 0 0 1 2 1 0 0 0 1 1 1 0 339 1 1
                                    0 642 0 1 1 1 0 0 255 3 1 0 0 0 0 335 3 1 0
                                    0 0 0 291 3 1 0 0 0 0 289 1 0 74 0 75 1 0
                                    74 339 468 2 0 0 10 339 603 2 0 0 10 0 1 2
                                    1 0 0 0 303 2 1 0 0 0 301 2 1 0 0 0 299 2 1
                                    0 0 0 297 2 1 0 0 0 321 2 1 0 0 0 323 2 1 0
                                    0 0 315 4 1 0 0 0 0 0 333 2 1 0 0 0 319 2 1
                                    0 0 0 317 1 29 605 0 1 1 5 636 0 1 1 27 605
                                    0 606 1 27 609 0 610 2 5 634 0 27 1 2 5 634
                                    0 10 1 1 29 634 0 1 2 0 9 0 27 76 2 0 9 0
                                    10 1 1 23 0 0 1 2 1 0 0 359 391 2 1 0 0 27
                                    389 3 34 0 339 339 0 340 2 1 0 0 0 331 1 0
                                    35 0 1 2 0 644 644 0 1 1 0 643 0 1 2 1 0 0
                                    0 283 2 1 0 0 0 281 1 0 9 0 70 1 0 6 0 1 0
                                    1 9 133 2 1 124 124 124 479 1 1 0 339 1 2 1
                                    0 0 0 1 1 1 0 0 385 1 1 0 0 387 2 0 9 0 27
                                    1 2 0 9 0 0 1 2 1 0 0 27 354 1 1 0 0 352 1
                                    1 0 0 346 1 26 485 124 1 1 26 485 124 486 1
                                    1 618 0 1 2 1 629 0 0 1 3 1 631 0 0 0 1 2 1
                                    617 0 0 1 2 1 605 339 0 1 1 1 0 0 174 1 32
                                    9 0 1 2 9 0 0 27 1 2 9 0 0 38 1 4 9 0 0 10
                                    0 27 545 1 9 0 0 1 4 9 0 0 543 339 27 544 4
                                    5 0 0 38 637 639 1 4 5 0 0 38 637 555 1 4 5
                                    0 0 27 35 554 1 4 5 0 0 27 35 638 1 3 0 0 0
                                    10 554 1 3 0 0 0 543 639 1 3 0 0 0 10 638 1
                                    3 0 0 0 543 555 556 3 0 0 0 27 638 1 3 0 0
                                    0 27 554 1 3 0 0 0 38 555 1 3 0 0 0 38 639
                                    1 3 0 0 0 0 0 1 3 0 0 0 339 339 1 2 0 0 0
                                    641 1 3 0 0 0 74 339 597 2 0 0 0 560 1 3 0
                                    0 0 12 0 1 1 1 35 0 1 1 1 0 0 369 1 1 0 0
                                    367 10 0 0 10 0 0 0 0 0 0 0 0 0 1 2 0 0 10
                                    339 1 9 0 0 10 0 0 0 0 0 0 0 0 1 7 0 0 10 0
                                    0 0 0 0 0 1 8 0 0 10 0 0 0 0 0 0 0 1 5 0 0
                                    10 0 0 0 0 1 6 0 0 10 0 0 0 0 0 1 4 0 0 10
                                    0 0 0 1 2 0 0 10 0 1 3 0 0 10 0 0 1 3 1 0 0
                                    0 0 313 1 1 0 0 305 2 1 0 0 0 311 1 1 0 0
                                    307 2 1 0 0 0 309 2 1 628 0 0 1 2 0 0 0 0 1
                                    1 0 0 0 1 1 1 0 0 383 1 1 0 0 235 3 5 0 0
                                    38 637 1 3 5 0 0 27 35 1 2 5 0 0 27 1 2 5 0
                                    0 38 1 1 1 0 0 95 1 1 104 0 107 1 33 0 0
                                    496 1 1 0 0 212 1 1 0 0 188 1 1 0 0 208 1 1
                                    0 0 184 1 1 0 0 204 1 1 0 0 180 1 9 540 0
                                    542 1 10 569 0 1 1 11 563 0 1 1 1 0 618 1 2
                                    8 0 0 0 1 1 35 612 150 1 2 8 0 0 0 1 1 15 0
                                    490 491 1 22 0 87 1 1 21 0 57 61 1 1 0 619
                                    1 1 1 0 620 1 1 1 0 621 1 1 1 0 112 115 1 1
                                    0 0 1 1 5 0 104 109 1 5 0 110 111 1 0 0 6
                                    515 1 0 0 27 557 1 0 0 12 142 1 0 594 0 596
                                    1 36 617 0 1 3 1 0 0 0 0 329 0 5 35 1 1 0 0
                                    339 1 1 0 0 0 1 2 1 0 0 0 348 2 1 0 0 0 241
                                    2 1 0 0 0 245 2 1 0 0 0 239 2 1 0 0 0 243 1
                                    0 9 10 11 1 1 0 0 218 1 1 0 0 194 2 1 9 0 0
                                    1 1 1 0 0 214 1 1 0 0 190 1 1 0 0 222 1 1 0
                                    0 198 5 0 0 27 0 0 0 0 1 2 0 0 27 339 1 4 0
                                    0 27 0 0 0 1 2 0 0 27 0 1 3 0 0 27 0 0 1 2
                                    5 9 0 0 1 2 1 0 0 0 273 1 1 74 0 86 1 1 74
                                    339 467 1 1 0 0 253 1 1 0 0 251 1 1 0 0 249
                                    1 1 0 0 247 1 1 0 0 224 1 1 0 0 200 1 1 0 0
                                    220 1 1 0 0 196 1 1 0 0 216 1 1 0 0 192 1 1
                                    0 0 227 2 23 0 0 57 97 2 1 0 0 0 89 2 1 0 0
                                    87 493 2 29 0 0 35 96 2 29 0 0 98 99 0 27 0
                                    47 1 1 0 0 373 1 1 0 0 377 0 29 0 49 1 1 0
                                    0 229 2 1 0 0 0 231 1 1 0 0 371 3 5 0 0 27
                                    35 1 3 5 0 0 38 637 1 2 5 0 0 38 1 2 5 0 0
                                    27 1 1 1 0 0 375 1 1 0 0 379 2 1 0 0 0 233
                                    2 0 9 0 0 102 2 23 0 0 0 69 2 1 0 104 104
                                    145 2 19 0 0 0 67 1 19 0 0 56 2 27 0 0 0 65
                                    2 19 0 57 0 59 2 27 0 35 0 1 2 27 0 98 0 1
                                    2 2 0 6 0 1 2 2 0 0 6 1 2 1 0 87 0 1 2 1 0
                                    0 87 1 2 29 0 0 0 63)))))
           '|lookupComplete|)) 
