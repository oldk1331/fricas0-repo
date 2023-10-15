
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
         ((|vl2| (|List| (|Kernel| $))) (#1=#:G172 NIL) (|z| NIL)
          (#2=#:G171 NIL) (|vl1| (|List| (|Symbol|)))
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
         ((|x1| ($)) (|q| (|SparseUnivariatePolynomial| $)) (#1=#:G233 NIL)
          (|k| NIL) (|sas| (|SingletonAsOrderedSet|)) (#2=#:G232 NIL)
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
                                    (GO #5=#:G231))))))))
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
                             (EXIT (|EXPR;reduc| |x1| |akl| $))))))))
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
        (SPROG ((|ans| (|List| (|Kernel| $))) (#1=#:G248 NIL) (|k| NIL))
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

(SDEFUN |EXPR;whittakerM;4$;91| ((|k| $) (|m| $) (|z| $) ($ $))
        (SPADCALL |k| |m| |z| (QREFELT $ 266))) 

(SDEFUN |EXPR;whittakerW;4$;92| ((|k| $) (|m| $) (|z| $) ($ $))
        (SPADCALL |k| |m| |z| (QREFELT $ 268))) 

(SDEFUN |EXPR;angerJ;3$;93| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 270))) 

(SDEFUN |EXPR;weberE;3$;94| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 272))) 

(SDEFUN |EXPR;struveH;3$;95| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 274))) 

(SDEFUN |EXPR;struveL;3$;96| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 276))) 

(SDEFUN |EXPR;hankelH1;3$;97| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 278))) 

(SDEFUN |EXPR;hankelH2;3$;98| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 280))) 

(SDEFUN |EXPR;lommelS1;4$;99| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 282))) 

(SDEFUN |EXPR;lommelS2;4$;100| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 284))) 

(SDEFUN |EXPR;kummerM;4$;101| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 286))) 

(SDEFUN |EXPR;kummerU;4$;102| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 288))) 

(SDEFUN |EXPR;legendreP;4$;103| ((|nu| $) (|mu| $) (|z| $) ($ $))
        (SPADCALL |nu| |mu| |z| (QREFELT $ 290))) 

(SDEFUN |EXPR;legendreQ;4$;104| ((|nu| $) (|mu| $) (|z| $) ($ $))
        (SPADCALL |nu| |mu| |z| (QREFELT $ 292))) 

(SDEFUN |EXPR;kelvinBei;3$;105| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 294))) 

(SDEFUN |EXPR;kelvinBer;3$;106| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 296))) 

(SDEFUN |EXPR;kelvinKei;3$;107| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 298))) 

(SDEFUN |EXPR;kelvinKer;3$;108| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 300))) 

(SDEFUN |EXPR;ellipticK;2$;109| ((|m| $) ($ $)) (SPADCALL |m| (QREFELT $ 302))) 

(SDEFUN |EXPR;ellipticE;2$;110| ((|m| $) ($ $)) (SPADCALL |m| (QREFELT $ 304))) 

(SDEFUN |EXPR;ellipticE;3$;111| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 306))) 

(SDEFUN |EXPR;ellipticF;3$;112| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 308))) 

(SDEFUN |EXPR;ellipticPi;4$;113| ((|z| $) (|n| $) (|m| $) ($ $))
        (SPADCALL |z| |n| |m| (QREFELT $ 310))) 

(SDEFUN |EXPR;jacobiSn;3$;114| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 312))) 

(SDEFUN |EXPR;jacobiCn;3$;115| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 314))) 

(SDEFUN |EXPR;jacobiDn;3$;116| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 316))) 

(SDEFUN |EXPR;jacobiZeta;3$;117| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 318))) 

(SDEFUN |EXPR;jacobiTheta;3$;118| ((|q| $) (|z| $) ($ $))
        (SPADCALL |q| |z| (QREFELT $ 320))) 

(SDEFUN |EXPR;lerchPhi;4$;119| ((|z| $) (|s| $) (|a| $) ($ $))
        (SPADCALL |z| |s| |a| (QREFELT $ 322))) 

(SDEFUN |EXPR;riemannZeta;2$;120| ((|z| $) ($ $))
        (SPADCALL |z| (QREFELT $ 324))) 

(SDEFUN |EXPR;charlierC;4$;121| ((|n| $) (|a| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |z| (QREFELT $ 326))) 

(SDEFUN |EXPR;hermiteH;3$;122| ((|n| $) (|z| $) ($ $))
        (SPADCALL |n| |z| (QREFELT $ 328))) 

(SDEFUN |EXPR;jacobiP;5$;123| ((|n| $) (|a| $) (|b| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |b| |z| (QREFELT $ 330))) 

(SDEFUN |EXPR;laguerreL;4$;124| ((|n| $) (|a| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |z| (QREFELT $ 332))) 

(SDEFUN |EXPR;meixnerM;5$;125| ((|n| $) (|b| $) (|c| $) (|z| $) ($ $))
        (SPADCALL |n| |b| |c| |z| (QREFELT $ 334))) 

(SDEFUN |EXPR;hypergeometricF;2L2$;126|
        ((|la| . #1=(|List| $)) (|lb| . #1#) (|x| $) ($ $))
        (SPADCALL |la| |lb| |x| (QREFELT $ 336))) 

(SDEFUN |EXPR;meijerG;4L2$;127|
        ((|la| . #1=(|List| $)) (|lb| . #1#) (|lc| . #1#) (|ld| . #1#) (|x| $)
         ($ $))
        (SPADCALL |la| |lb| |lc| |ld| |x| (QREFELT $ 339))) 

(SDEFUN |EXPR;^;3$;128| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 342))) 

(SDEFUN |EXPR;factorial;2$;129| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 343))) 

(SDEFUN |EXPR;binomial;3$;130| ((|n| $) (|m| $) ($ $))
        (SPADCALL |n| |m| (QREFELT $ 345))) 

(SDEFUN |EXPR;permutation;3$;131| ((|n| $) (|m| $) ($ $))
        (SPADCALL |n| |m| (QREFELT $ 347))) 

(SDEFUN |EXPR;factorials;2$;132| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 349))) 

(SDEFUN |EXPR;factorials;$S$;133| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 351))) 

(SDEFUN |EXPR;summation;$S$;134| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 353))) 

(SDEFUN |EXPR;summation;$Sb$;135| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 356))) 

(SDEFUN |EXPR;product;$S$;136| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 359))) 

(SDEFUN |EXPR;product;$Sb$;137| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 361))) 

(SDEFUN |EXPR;erf;2$;138| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 364))) 

(SDEFUN |EXPR;erfi;2$;139| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 366))) 

(SDEFUN |EXPR;Ei;2$;140| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 368))) 

(SDEFUN |EXPR;Si;2$;141| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 370))) 

(SDEFUN |EXPR;Ci;2$;142| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 372))) 

(SDEFUN |EXPR;Shi;2$;143| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 374))) 

(SDEFUN |EXPR;Chi;2$;144| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 376))) 

(SDEFUN |EXPR;li;2$;145| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 378))) 

(SDEFUN |EXPR;dilog;2$;146| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 380))) 

(SDEFUN |EXPR;fresnelS;2$;147| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 382))) 

(SDEFUN |EXPR;fresnelC;2$;148| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 384))) 

(SDEFUN |EXPR;integral;$S$;149| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 386))) 

(SDEFUN |EXPR;integral;$Sb$;150| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 388))) 

(SDEFUN |EXPR;operator;2Bo;151| ((|op| . #1=(|BasicOperator|)) ($ . #1#))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |op| (QREFELT $ 390))
                  (SPADCALL |op| (QREFELT $ 391)))
                 ((SPADCALL |op| (QREFELT $ 392))
                  (SPADCALL |op| (QREFELT $ 393)))
                 ((SPADCALL |op| (QREFELT $ 394))
                  (SPADCALL |op| (QREFELT $ 395)))
                 ((SPADCALL |op| (QREFELT $ 396))
                  (SPADCALL |op| (QREFELT $ 397)))
                 ((SPADCALL |op| (QREFELT $ 398))
                  (SPADCALL |op| (QREFELT $ 399)))
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
                         |EXPR;operator;2Bo;151|)
                   (EXIT
                    (COND
                     ((QEQCAR |n| 1)
                      (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QREFELT $ 34)))
                     (#2#
                      (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QCDR |n|)
                                (QREFELT $ 36))))))))))) 

(SDEFUN |EXPR;reduc| ((|x| $) (|l| |List| (|Kernel| $)) ($ $))
        (SPROG
         ((|p| (|SparseUnivariatePolynomial| $)) (#1=#:G376 NIL) (|k| NIL))
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
        (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 400)) |k| (QREFELT $ 403))
                  (QREFELT $ 405))) 

(SDEFUN |EXPR;evl|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) (|k| |Kernel| $)
         (|m| |SparseUnivariatePolynomial| $)
         ($ |Fraction| (|SparseMultivariatePolynomial| R (|Kernel| $))))
        (COND
         ((< (SPADCALL |p| |k| (QREFELT $ 406)) (SPADCALL |m| (QREFELT $ 407)))
          (SPADCALL |p| (QREFELT $ 400)))
         ('T
          (SPADCALL (SPADCALL (|EXPR;evl0| |p| |k| $) |m| (QREFELT $ 408))
                    (SPADCALL (SPADCALL |k| (QREFELT $ 409)) (QREFELT $ 400))
                    (QREFELT $ 410))))) 

(SDEFUN |EXPR;noalg?| ((|p| |SparseUnivariatePolynomial| $) ($ |Boolean|))
        (SPROG ((#1=#:G385 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |p| (|spadConstant| $ 411)
                                    (QREFELT $ 412)))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (NULL
                             (|EXPR;algkernels|
                              (SPADCALL (SPADCALL |p| (QREFELT $ 413))
                                        (QREFELT $ 75))
                              $)))
                           (PROGN
                            (LETT #1# 'NIL . #2=(|EXPR;noalg?|))
                            (GO #3=#:G384)))
                          ('T
                           (LETT |p| (SPADCALL |p| (QREFELT $ 414)) . #2#)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |EXPR;gcdPolynomial;3Sup;156|
        ((|p| . #1=(|SparseUnivariatePolynomial| $)) (|q| . #1#) ($ . #1#))
        (SEQ
         (COND
          ((|EXPR;noalg?| |p| $)
           (COND
            ((|EXPR;noalg?| |q| $)
             (EXIT (SPADCALL |p| |q| (QREFELT $ 415)))))))
         (EXIT (SPADCALL |p| |q| (QREFELT $ 417))))) 

(SDEFUN |EXPR;factorPolynomial;SupF;157|
        ((|x| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |x| (QREFELT $ 421))) 

(SDEFUN |EXPR;coerce;An$;158| ((|x| |AlgebraicNumber|) ($ $))
        (SPADCALL (SPADCALL |x| (|spadConstant| $ 425) (QREFELT $ 426))
                  (QREFELT $ 109))) 

(SDEFUN |EXPR;^;$F$;159| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL |x| |r| (QREFELT $ 429))) 

(SDEFUN |EXPR;minPoly;KSup;160|
        ((|k| |Kernel| . #1=($)) ($ |SparseUnivariatePolynomial| . #1#))
        (SPADCALL |k| (QREFELT $ 431))) 

(SDEFUN |EXPR;definingPolynomial;2$;161| ((|x| $) ($ $))
        (SPADCALL |x| (QREFELT $ 432))) 

(SDEFUN |EXPR;retract;$F;162| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL |x| (QREFELT $ 434))) 

(SDEFUN |EXPR;retractIfCan;$U;163|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPADCALL |x| (QREFELT $ 436))) 

(SDEFUN |EXPR;coerce;An$;164| ((|x| |AlgebraicNumber|) ($ $))
        (SPADCALL (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 438)) $)
                  (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 439)) $)
                  (QREFELT $ 69))) 

(SDEFUN |EXPR;k2expr| ((|k| |Kernel| (|AlgebraicNumber|)) ($ $))
        (SPADCALL (ELT $ 428) |k| (QREFELT $ 443))) 

(SDEFUN |EXPR;smp2expr|
        ((|p| |SparseMultivariatePolynomial| (|Integer|)
          (|Kernel| (|AlgebraicNumber|)))
         ($ $))
        (SPADCALL (CONS (|function| |EXPR;k2expr|) $) (ELT $ 61) |p|
                  (QREFELT $ 448))) 

(SDEFUN |EXPR;retractIfCan;$U;167|
        ((|x| $) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG
         ((#1=#:G414 NIL) (|d| #2=(|Union| (|AlgebraicNumber|) "failed"))
          (|n| #2#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |n| (|EXPR;smp2an| (SPADCALL |x| (QREFELT $ 105)) $)
                   . #3=(|EXPR;retractIfCan;$U;167|))
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
                                           (QREFELT $ 449)))
                           . #3#)
                     (GO #4=#:G409))))))))))
            (EXIT (CONS 1 "failed"))))
          #4# (EXIT #1#)))) 

(SDEFUN |EXPR;R2AN| ((|r| R) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG ((|u| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL (SPADCALL |r| (QREFELT $ 452)) (QREFELT $ 72))
                      |EXPR;R2AN|)
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 453))))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |EXPR;k2an| ((|k| |Kernel| $) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG
         ((|arg| (|List| (|AlgebraicNumber|))) (#1=#:G446 NIL)
          (|a| #2=(|Union| (|AlgebraicNumber|) #3="failed")) (#4=#:G447 NIL)
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
               (QREFELT $ 454)))
             (CONS 1 "failed"))
            ('T
             (COND
              ((SPADCALL |op| '|rootOf| (QREFELT $ 455))
               (SEQ (LETT |args| (SPADCALL |k| (QREFELT $ 79)) . #5#)
                    (LETT |a2| (SPADCALL |args| 2 (QREFELT $ 81)) . #5#)
                    (LETT |k1u| (SPADCALL |a2| (QREFELT $ 19)) . #5#)
                    (EXIT
                     (COND ((QEQCAR |k1u| 1) (CONS 1 "failed"))
                           (#6='T
                            (SEQ (LETT |k1| (QCDR |k1u|) . #5#)
                                 (LETT |s1u| (SPADCALL |a2| (QREFELT $ 457))
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
                                                  (QREFELT $ 458))
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
                                                        (|spadConstant| $ 460)
                                                        . #5#)
                                                  (SEQ G190
                                                       (COND
                                                        ((NULL
                                                          (SPADCALL |eq|
                                                                    (|spadConstant|
                                                                     $ 461)
                                                                    (QREFELT $
                                                                             462)))
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
                                                                         451))
                                                              . #5#)
                                                        (EXIT
                                                         (COND
                                                          ((QEQCAR |ccu| 1)
                                                           (PROGN
                                                            (LETT #1#
                                                                  (CONS 1
                                                                        "failed")
                                                                  . #5#)
                                                            (GO #7=#:G445)))
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
                                                                              463))
                                                                    (QREFELT $
                                                                             464))
                                                                   (QREFELT $
                                                                            465))
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
                                                                            466))))))))))))))))))
              (#6#
               (SEQ (LETT |arg| NIL . #5#)
                    (SEQ (LETT |x| NIL . #5#)
                         (LETT #4# (SPADCALL |k| (QREFELT $ 79)) . #5#) G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
                           (GO G191)))
                         (SEQ (LETT |a| (SPADCALL |x| (QREFELT $ 451)) . #5#)
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
                           (SPADCALL (SPADCALL |op| (QREFELT $ 467))
                                     (NREVERSE |arg|) (QREFELT $ 468))))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |EXPR;smp2an|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $))
         ($ |Union| (|AlgebraicNumber|) #1="failed"))
        (SPROG
         ((|c| (|Union| (|AlgebraicNumber|) #1#))
          (|up|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| $))))
          (|ans| (|AlgebraicNumber|)) (#2=#:G462 NIL)
          (|t| (|Union| (|AlgebraicNumber|) "failed")) (|k| (|Kernel| $))
          (|x1| (|Union| (|Kernel| $) "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |x1| (SPADCALL |p| (QREFELT $ 470)) . #3=(|EXPR;smp2an|))
                (EXIT
                 (COND
                  ((QEQCAR |x1| 1)
                   (|EXPR;R2AN| (SPADCALL |p| (QREFELT $ 471)) $))
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
                            (SEQ (LETT |ans| (|spadConstant| $ 472) . #3#)
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND
                                          ((SPADCALL |up| (QREFELT $ 473))
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
                                           (GO #5=#:G461)))
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
                                                                        $ 463))
                                                                      (QREFELT
                                                                       $ 474))
                                                                     (QREFELT $
                                                                              475))
                                                           (QREFELT $ 476))
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
                                                                  476))))))))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |EXPR;convert;$If;171| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 478))) 

(SDEFUN |EXPR;eval;$Bo$S$;172|
        ((|f| $) (|op| |BasicOperator|) (|g| $) (|x| |Symbol|) ($ $))
        (SPADCALL |f| (LIST |op|) (LIST |g|) |x| (QREFELT $ 481))) 

(SDEFUN |EXPR;eval;$LLS$;173|
        ((|f| $) (|ls| |List| (|BasicOperator|)) (|lg| |List| $) (|x| |Symbol|)
         ($ $))
        (SPROG
         ((|res| ($)) (#1=#:G493 NIL) (|g| NIL) (#2=#:G492 NIL)
          (|nlg| (|List| $)) (#3=#:G491 NIL) (#4=#:G490 NIL)
          (|lbackwardSubs| (|List| (|Equation| $))) (#5=#:G488 NIL) (|i| NIL)
          (#6=#:G489 NIL) (|j| NIL) (#7=#:G487 NIL)
          (|lforwardSubs| (|List| (|Equation| $))) (#8=#:G485 NIL)
          (#9=#:G486 NIL) (#10=#:G484 NIL) (|ns| (|List| (|Symbol|)))
          (#11=#:G483 NIL) (#12=#:G482 NIL) (#13=#:G481 NIL) (#14=#:G480 NIL)
          (|lsd| (|List| (|Symbol|))) (|lsym| (|List| (|Symbol|)))
          (|llsym| (|List| (|List| (|Symbol|)))) (#15=#:G479 NIL)
          (#16=#:G478 NIL))
         (SEQ
          (LETT |llsym|
                (PROGN
                 (LETT #16# NIL . #17=(|EXPR;eval;$LLS$;173|))
                 (SEQ (LETT |g| NIL . #17#) (LETT #15# |lg| . #17#) G190
                      (COND
                       ((OR (ATOM #15#)
                            (PROGN (LETT |g| (CAR #15#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #16# (CONS (SPADCALL |g| (QREFELT $ 483)) #16#)
                              . #17#)))
                      (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #16#))))
                . #17#)
          (LETT |lsym|
                (SPADCALL (SPADCALL |llsym| (QREFELT $ 484)) (QREFELT $ 485))
                . #17#)
          (LETT |lsd| (SPADCALL (ELT $ 486) |lsym| (QREFELT $ 488)) . #17#)
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
                                     (CONS (SPADCALL |g| |x| (QREFELT $ 490))
                                           #14#)
                                     . #17#)))
                             (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                             (EXIT (NREVERSE #14#))))
                       (QREFELT $ 493)))
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
                            (LETT #12# (CONS (SPADCALL (QREFELT $ 494)) #12#)
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
                                   (SPADCALL (SPADCALL |i| (QREFELT $ 495))
                                             (SPADCALL |j| (QREFELT $ 495))
                                             (QREFELT $ 497))
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
                                   (SPADCALL (SPADCALL |j| (QREFELT $ 495))
                                             (SPADCALL |i| (QREFELT $ 495))
                                             (QREFELT $ 497))
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
                                             (QREFELT $ 499))
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
                                             (SPADCALL |g| |x| (QREFELT $ 490))
                                             #2#)
                                            . #17#)))
                                    (LETT #1# (CDR #1#) . #17#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 493))
                    . #17#)
              (EXIT (SPADCALL |res| |lbackwardSubs| (QREFELT $ 499)))))))))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;174|
        ((|x| $) (|p| |Pattern| #1=(|Integer|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 503))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;175|
        ((|x| $) (|p| |Pattern| #1=(|Float|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 509))) 

(SDEFUN |EXPR;Zero;$;176| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |EXPR;One;$;177| (($ $)) (|spadConstant| $ 48)) 

(SDEFUN |EXPR;-;2$;178| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |EXPR;*;I2$;179| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL |n| |x| (QREFELT $ 58))) 

(SDEFUN |EXPR;*;3$;180| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 62))) 

(SDEFUN |EXPR;+;3$;181| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 64))) 

(SDEFUN |EXPR;=;2$B;182| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(SDEFUN |EXPR;smaller?;2$B;183| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 100))) 

(PUT '|EXPR;numer;$Smp;184| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |EXPR;numer;$Smp;184|
        ((|x| $) ($ |SparseMultivariatePolynomial| R (|Kernel| $))) |x|) 

(PUT '|EXPR;coerce;Smp$;185| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |EXPR;coerce;Smp$;185|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) ($ $)) |p|) 

(SDEFUN |EXPR;coerce;P$;186| ((|p| |Polynomial| R) ($ $))
        (|EXPR;poly_to_MP| |p| $)) 

(SDEFUN |EXPR;reducedSystem;MM;187| ((|m| |Matrix| $) ($ |Matrix| R))
        (SPADCALL |m| (QREFELT $ 512))) 

(SDEFUN |EXPR;reducedSystem;MVR;188|
        ((|m| |Matrix| . #1=($)) (|v| |Vector| . #1#)
         ($ |Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R))))
        (SPADCALL |m| |v| (QREFELT $ 513))) 

(SDEFUN |EXPR;convert;$If;189| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 478))) 

(SDEFUN |EXPR;kintmatch|
        ((|k| |Kernel| $) (|p| |Pattern| (|Integer|))
         (|l| |PatternMatchResult| (|Integer|) |Rep|)
         ($ |PatternMatchResult| (|Integer|) |Rep|))
        (SPADCALL |k| |p| |l| (QREFELT $ 515))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;191|
        ((|x| $) (|p| |Pattern| #1=(|Integer|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kintmatch|) $)
                  (QREFELT $ 519))) 

(SDEFUN |EXPR;kfltmatch|
        ((|k| |Kernel| $) (|p| |Pattern| (|Float|))
         (|l| |PatternMatchResult| (|Float|) |Rep|)
         ($ |PatternMatchResult| (|Float|) |Rep|))
        (SPADCALL |k| |p| |l| (QREFELT $ 521))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;193|
        ((|x| $) (|p| |Pattern| #1=(|Float|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kfltmatch|) $)
                  (QREFELT $ 525))) 

(SDEFUN |EXPR;Zero;$;194| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |EXPR;+;3$;195| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 64))) 

(SDEFUN |EXPR;=;2$B;196| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(SDEFUN |EXPR;smaller?;2$B;197| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 100))) 

(SDEFUN |EXPR;coerce;K$;198| ((|k| |Kernel| $) ($ $))
        (SPADCALL |k| (QREFELT $ 526))) 

(SDEFUN |EXPR;kernels;$L;199| ((|x| $) ($ |List| (|Kernel| $)))
        (SPROG ((#1=#:G530 NIL) (|f| NIL) (#2=#:G529 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EXPR;kernels;$L;199|))
                 (SEQ (LETT |f| NIL . #3#)
                      (LETT #1# (SPADCALL |x| (QREFELT $ 529)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCAR |f|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EXPR;coerce;R$;200| ((|x| R) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 530)) (|spadConstant| $ 47))
              ('T (SPADCALL (SPADCALL |x| (QREFELT $ 531)) (QREFELT $ 142))))) 

(SDEFUN |EXPR;retract;$R;201| ((|x| $) ($ R))
        (COND ((SPADCALL |x| (QREFELT $ 54)) (|spadConstant| $ 93))
              ('T (|EXPR;retNotUnit| |x| $)))) 

(SDEFUN |EXPR;coerce;$Of;202| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 534))) 

(SDEFUN |EXPR;kereval|
        ((|k| |Kernel| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SPADCALL |lk| |lv| |k|
                         (CONS #'|EXPR;kereval!1| (VECTOR |lk| |lv| $))
                         (QREFELT $ 540)))) 

(SDEFUN |EXPR;kereval!1| ((|x2| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;kereval|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT |lk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|EXPR;kereval!0| (VECTOR $ |lv| |lk|))
                             |x2| (QREFELT $ 537))))))) 

(SDEFUN |EXPR;kereval!0| ((|x1| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x1| |lk| |lv| (QREFELT $ 536)))))) 

(SDEFUN |EXPR;subeval|
        ((|k| |Kernel| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |k|
                          (CONS #'|EXPR;subeval!0| (VECTOR |lv| |lk| $))
                          (QREFELT $ 540))))) 

(SDEFUN |EXPR;subeval!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |lk| |lv|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subeval|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |lv| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G554 NIL) (|a| NIL) (#3=#:G553 NIL))
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
                                                       (QREFELT $ 541))
                                             #3#)
                                            NIL)))
                                    (LETT #2# (CDR #2#) NIL) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              (QREFELT $ 542)))))))) 

(SDEFUN |EXPR;isPlus;$U;205| ((|x| $) ($ |Union| (|List| $) "failed"))
        (SPROG
         ((#1=#:G569 NIL) (|t| NIL) (#2=#:G568 NIL)
          (|l|
           (|List|
            (|Record| (|:| |gen| (|Kernel| $)) (|:| |exp| (|Integer|))))))
         (SEQ
          (COND
           ((OR
             (NULL
              (LETT |l| (SPADCALL |x| (QREFELT $ 529))
                    . #3=(|EXPR;isPlus;$U;205|)))
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
                                           (QREFELT $ 543))
                                 #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |EXPR;isMult;$U;206|
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
              (LETT |l| (SPADCALL |x| (QREFELT $ 529))
                    . #1=(|EXPR;isMult;$U;206|)))
             (NULL (NULL (CDR |l|))))
            (CONS 1 "failed"))
           ('T
            (SEQ (LETT |t| (SPADCALL |l| (QREFELT $ 546)) . #1#)
                 (EXIT (CONS 0 (CONS (QCDR |t|) (QCAR |t|)))))))))) 

(SDEFUN |EXPR;eval;$LL$;207|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG
         ((#1=#:G585 NIL) (#2=#:G584 ($)) (#3=#:G586 ($)) (#4=#:G588 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|EXPR;eval;$LL$;207|))
           (SEQ (LETT |t| NIL . #5#)
                (LETT #4# (SPADCALL |x| (QREFELT $ 529)) . #5#) G190
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

(SDEFUN |EXPR;subst;$LL$;208|
        ((|x| $) (|lk| |List| (|Kernel| . #1=($))) (|lv| |List| . #1#) ($ $))
        (SPROG
         ((#2=#:G591 NIL) (#3=#:G590 ($)) (#4=#:G592 ($)) (#5=#:G594 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #2# NIL . #6=(|EXPR;subst;$LL$;208|))
           (SEQ (LETT |t| NIL . #6#)
                (LETT #5# (SPADCALL |x| (QREFELT $ 529)) . #6#) G190
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

(SDEFUN |EXPR;retractIfCan;$U;209| ((|x| $) ($ |Union| R "failed"))
        (COND ((SPADCALL |x| (QREFELT $ 54)) (CONS 0 (|spadConstant| $ 93)))
              ('T (|EXPR;retNotUnitIfCan| |x| $)))) 

(SDEFUN |EXPR;-;2$;210| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |EXPR;smaller?;2$B;211| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 100))) 

(SDEFUN |EXPR;=;2$B;212| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(PUT '|EXPR;coerce;K$;213| '|SPADreplace| '(XLAM (|k|) |k|)) 

(SDEFUN |EXPR;coerce;K$;213| ((|k| |Kernel| $) ($ $)) |k|) 

(PUT '|EXPR;kernels;$L;214| '|SPADreplace| 'LIST) 

(SDEFUN |EXPR;kernels;$L;214| ((|x| $) ($ |List| (|Kernel| $))) (LIST |x|)) 

(SDEFUN |EXPR;coerce;R$;215| ((|x| R) ($ $)) (SPADCALL |x| (QREFELT $ 531))) 

(SDEFUN |EXPR;retract;$R;216| ((|x| $) ($ R)) (|EXPR;retNotUnit| |x| $)) 

(SDEFUN |EXPR;retractIfCan;$U;217| ((|x| $) ($ |Union| R "failed"))
        (|EXPR;retNotUnitIfCan| |x| $)) 

(SDEFUN |EXPR;coerce;$Of;218| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 534))) 

(SDEFUN |EXPR;eval;$LL$;219|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SPADCALL |lk| |lv| |x|
                         (CONS #'|EXPR;eval;$LL$;219!1| (VECTOR |lk| |lv| $))
                         (QREFELT $ 540)))) 

(SDEFUN |EXPR;eval;$LL$;219!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;eval;$LL$;219|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT |lk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (CONS #'|EXPR;eval;$LL$;219!0| (VECTOR $ |lv| |lk|)) |x1|
                    (QREFELT $ 537))))))) 

(SDEFUN |EXPR;eval;$LL$;219!0| ((|x2| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |lk| |lv| (QREFELT $ 536)))))) 

(SDEFUN |EXPR;subst;$LL$;220|
        ((|x| $) (|lk| |List| (|Kernel| . #1=($))) (|lv| |List| . #1#) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |x|
                          (CONS #'|EXPR;subst;$LL$;220!0| (VECTOR |lv| |lk| $))
                          (QREFELT $ 540))))) 

(SDEFUN |EXPR;subst;$LL$;220!0| ((|x1| NIL) ($$ NIL))
        (PROG ($ |lk| |lv|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subst;$LL$;220|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |lv| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G630 NIL) (|a| NIL) (#3=#:G629 NIL))
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
                                                       (QREFELT $ 541))
                                             #3#)
                                            NIL)))
                                    (LETT #2# (CDR #2#) NIL) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              (QREFELT $ 542)))))))) 

(SDEFUN |EXPR;convert;$If;221| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 478))) 

(DECLAIM (NOTINLINE |Expression;|)) 

(DEFUN |Expression| (#1=#:G678)
  (SPROG NIL
         (PROG (#2=#:G679)
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
   ((#1=#:G677 NIL) (|pv$| NIL) (#2=#:G671 NIL) (#3=#:G672 NIL) (#4=#:G673 NIL)
    (#5=#:G674 NIL) (#6=#:G675 NIL) (#7=#:G676 NIL) ($ NIL) (|dv$| NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #8=(|Expression|))
    (LETT |dv$| (LIST '|Expression| DV$1) . #8#)
    (LETT $ (GETREFV 584) . #8#)
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
                    (CONS (|dispatchFunction| |EXPR;whittakerM;4$;91|) $))
          (QSETREFV $ 269
                    (CONS (|dispatchFunction| |EXPR;whittakerW;4$;92|) $))
          (QSETREFV $ 271 (CONS (|dispatchFunction| |EXPR;angerJ;3$;93|) $))
          (QSETREFV $ 273 (CONS (|dispatchFunction| |EXPR;weberE;3$;94|) $))
          (QSETREFV $ 275 (CONS (|dispatchFunction| |EXPR;struveH;3$;95|) $))
          (QSETREFV $ 277 (CONS (|dispatchFunction| |EXPR;struveL;3$;96|) $))
          (QSETREFV $ 279 (CONS (|dispatchFunction| |EXPR;hankelH1;3$;97|) $))
          (QSETREFV $ 281 (CONS (|dispatchFunction| |EXPR;hankelH2;3$;98|) $))
          (QSETREFV $ 283 (CONS (|dispatchFunction| |EXPR;lommelS1;4$;99|) $))
          (QSETREFV $ 285 (CONS (|dispatchFunction| |EXPR;lommelS2;4$;100|) $))
          (QSETREFV $ 287 (CONS (|dispatchFunction| |EXPR;kummerM;4$;101|) $))
          (QSETREFV $ 289 (CONS (|dispatchFunction| |EXPR;kummerU;4$;102|) $))
          (QSETREFV $ 291
                    (CONS (|dispatchFunction| |EXPR;legendreP;4$;103|) $))
          (QSETREFV $ 293
                    (CONS (|dispatchFunction| |EXPR;legendreQ;4$;104|) $))
          (QSETREFV $ 295
                    (CONS (|dispatchFunction| |EXPR;kelvinBei;3$;105|) $))
          (QSETREFV $ 297
                    (CONS (|dispatchFunction| |EXPR;kelvinBer;3$;106|) $))
          (QSETREFV $ 299
                    (CONS (|dispatchFunction| |EXPR;kelvinKei;3$;107|) $))
          (QSETREFV $ 301
                    (CONS (|dispatchFunction| |EXPR;kelvinKer;3$;108|) $))
          (QSETREFV $ 303
                    (CONS (|dispatchFunction| |EXPR;ellipticK;2$;109|) $))
          (QSETREFV $ 305
                    (CONS (|dispatchFunction| |EXPR;ellipticE;2$;110|) $))
          (QSETREFV $ 307
                    (CONS (|dispatchFunction| |EXPR;ellipticE;3$;111|) $))
          (QSETREFV $ 309
                    (CONS (|dispatchFunction| |EXPR;ellipticF;3$;112|) $))
          (QSETREFV $ 311
                    (CONS (|dispatchFunction| |EXPR;ellipticPi;4$;113|) $))
          (QSETREFV $ 313 (CONS (|dispatchFunction| |EXPR;jacobiSn;3$;114|) $))
          (QSETREFV $ 315 (CONS (|dispatchFunction| |EXPR;jacobiCn;3$;115|) $))
          (QSETREFV $ 317 (CONS (|dispatchFunction| |EXPR;jacobiDn;3$;116|) $))
          (QSETREFV $ 319
                    (CONS (|dispatchFunction| |EXPR;jacobiZeta;3$;117|) $))
          (QSETREFV $ 321
                    (CONS (|dispatchFunction| |EXPR;jacobiTheta;3$;118|) $))
          (QSETREFV $ 323 (CONS (|dispatchFunction| |EXPR;lerchPhi;4$;119|) $))
          (QSETREFV $ 325
                    (CONS (|dispatchFunction| |EXPR;riemannZeta;2$;120|) $))
          (QSETREFV $ 327
                    (CONS (|dispatchFunction| |EXPR;charlierC;4$;121|) $))
          (QSETREFV $ 329 (CONS (|dispatchFunction| |EXPR;hermiteH;3$;122|) $))
          (QSETREFV $ 331 (CONS (|dispatchFunction| |EXPR;jacobiP;5$;123|) $))
          (QSETREFV $ 333
                    (CONS (|dispatchFunction| |EXPR;laguerreL;4$;124|) $))
          (QSETREFV $ 335 (CONS (|dispatchFunction| |EXPR;meixnerM;5$;125|) $))
          (COND
           ((|testBitVector| |pv$| 32)
            (PROGN
             (QSETREFV $ 338
                       (CONS
                        (|dispatchFunction| |EXPR;hypergeometricF;2L2$;126|)
                        (|getDomainView| $ '(|RetractableTo| (|Integer|)))))
             (QSETREFV $ 340
                       (CONS (|dispatchFunction| |EXPR;meijerG;4L2$;127|)
                             (|getDomainView| $
                                              '(|RetractableTo|
                                                (|Integer|))))))))
          (QSETREFV $ 89 (CONS (|dispatchFunction| |EXPR;^;3$;128|) $))
          (QSETREFV $ 344
                    (CONS (|dispatchFunction| |EXPR;factorial;2$;129|) $))
          (QSETREFV $ 346 (CONS (|dispatchFunction| |EXPR;binomial;3$;130|) $))
          (QSETREFV $ 348
                    (CONS (|dispatchFunction| |EXPR;permutation;3$;131|) $))
          (QSETREFV $ 350
                    (CONS (|dispatchFunction| |EXPR;factorials;2$;132|) $))
          (QSETREFV $ 352
                    (CONS (|dispatchFunction| |EXPR;factorials;$S$;133|) $))
          (QSETREFV $ 354
                    (CONS (|dispatchFunction| |EXPR;summation;$S$;134|) $))
          (QSETREFV $ 358
                    (CONS (|dispatchFunction| |EXPR;summation;$Sb$;135|) $))
          (QSETREFV $ 360 (CONS (|dispatchFunction| |EXPR;product;$S$;136|) $))
          (QSETREFV $ 362
                    (CONS (|dispatchFunction| |EXPR;product;$Sb$;137|) $))
          (QSETREFV $ 365 (CONS (|dispatchFunction| |EXPR;erf;2$;138|) $))
          (QSETREFV $ 367 (CONS (|dispatchFunction| |EXPR;erfi;2$;139|) $))
          (QSETREFV $ 369 (CONS (|dispatchFunction| |EXPR;Ei;2$;140|) $))
          (QSETREFV $ 371 (CONS (|dispatchFunction| |EXPR;Si;2$;141|) $))
          (QSETREFV $ 373 (CONS (|dispatchFunction| |EXPR;Ci;2$;142|) $))
          (QSETREFV $ 375 (CONS (|dispatchFunction| |EXPR;Shi;2$;143|) $))
          (QSETREFV $ 377 (CONS (|dispatchFunction| |EXPR;Chi;2$;144|) $))
          (QSETREFV $ 379 (CONS (|dispatchFunction| |EXPR;li;2$;145|) $))
          (QSETREFV $ 381 (CONS (|dispatchFunction| |EXPR;dilog;2$;146|) $))
          (QSETREFV $ 383 (CONS (|dispatchFunction| |EXPR;fresnelS;2$;147|) $))
          (QSETREFV $ 385 (CONS (|dispatchFunction| |EXPR;fresnelC;2$;148|) $))
          (QSETREFV $ 387
                    (CONS (|dispatchFunction| |EXPR;integral;$S$;149|) $))
          (QSETREFV $ 389
                    (CONS (|dispatchFunction| |EXPR;integral;$Sb$;150|) $))
          (QSETREFV $ 37 (CONS (|dispatchFunction| |EXPR;operator;2Bo;151|) $))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (PROGN
             (QSETREFV $ 418
                       (CONS (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;156|)
                             $))
             (COND
              ((|testBitVector| |pv$| 25)
               (QSETREFV $ 423
                         (CONS
                          (|dispatchFunction| |EXPR;factorPolynomial;SupF;157|)
                          $)))))))
          (COND
           ((|domainEqual| |#1| (|AlgebraicNumber|))
            (QSETREFV $ 428
                      (CONS (|dispatchFunction| |EXPR;coerce;An$;158|) $))))
          (COND
           ((|testBitVector| |pv$| 14)
            (PROGN
             (QSETREFV $ 430 (CONS (|dispatchFunction| |EXPR;^;$F$;159|) $))
             (QSETREFV $ 138
                       (CONS (|dispatchFunction| |EXPR;minPoly;KSup;160|) $))
             (QSETREFV $ 433
                       (CONS
                        (|dispatchFunction| |EXPR;definingPolynomial;2$;161|)
                        $))
             (QSETREFV $ 435
                       (CONS (|dispatchFunction| |EXPR;retract;$F;162|) $))
             (QSETREFV $ 72
                       (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;163|)
                             $))
             (COND ((|domainEqual| |#1| (|AlgebraicNumber|)))
                   ('T
                    (PROGN
                     (QSETREFV $ 428
                               (CONS (|dispatchFunction| |EXPR;coerce;An$;164|)
                                     $))
                     (QSETREFV $ 451
                               (CONS
                                (|dispatchFunction| |EXPR;retractIfCan;$U;167|)
                                $))))))))
          (COND
           ((|testBitVector| |pv$| 9)
            (PROGN
             (QSETREFV $ 479
                       (CONS (|dispatchFunction| |EXPR;convert;$If;171|) $))
             (QSETREFV $ 482
                       (CONS (|dispatchFunction| |EXPR;eval;$Bo$S$;172|) $))
             (QSETREFV $ 481
                       (CONS (|dispatchFunction| |EXPR;eval;$LLS$;173|) $)))))
          (COND
           ((|testBitVector| |pv$| 13)
            (QSETREFV $ 505
                      (CONS (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;174|)
                            $))))
          (COND
           ((|testBitVector| |pv$| 12)
            (QSETREFV $ 511
                      (CONS (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;175|)
                            $))))))
        ('T
         (PROGN
          (SETELT $ 45 (|SparseMultivariatePolynomial| |#1| (|Kernel| $)))
          (QSETREFV $ 47
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;Zero;$;176|) $ 47)))
          (QSETREFV $ 49
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;One;$;177|) $ 49)))
          (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;178|) $))
          (QSETREFV $ 59 (CONS (|dispatchFunction| |EXPR;*;I2$;179|) $))
          (QSETREFV $ 63 (CONS (|dispatchFunction| |EXPR;*;3$;180|) $))
          (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;181|) $))
          (QSETREFV $ 102 (CONS (|dispatchFunction| |EXPR;=;2$B;182|) $))
          (QSETREFV $ 101
                    (CONS (|dispatchFunction| |EXPR;smaller?;2$B;183|) $))
          (QSETREFV $ 105 (CONS (|dispatchFunction| |EXPR;numer;$Smp;184|) $))
          (QSETREFV $ 109 (CONS (|dispatchFunction| |EXPR;coerce;Smp$;185|) $))
          (QSETREFV $ 111 (CONS (|dispatchFunction| |EXPR;coerce;P$;186|) $))
          (QSETREFV $ 154
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;187|) $))
          (QSETREFV $ 162
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;188|) $))
          (COND
           ((|testBitVector| |pv$| 9)
            (QSETREFV $ 479
                      (CONS (|dispatchFunction| |EXPR;convert;$If;189|) $))))
          (COND
           ((|testBitVector| |pv$| 13)
            (PROGN
             (QSETREFV $ 505
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;191|)
                        $)))))
          (COND
           ((|testBitVector| |pv$| 12)
            (PROGN
             (QSETREFV $ 511
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;193|)
                        $))))))))))
     ((|HasCategory| |#1| '(|AbelianMonoid|))
      (PROGN
       (SETELT $ 45 (|FreeAbelianGroup| (|Kernel| $)))
       (QSETREFV $ 47
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |EXPR;Zero;$;194|) $ 47)))
       (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;195|) $))
       (QSETREFV $ 102 (CONS (|dispatchFunction| |EXPR;=;2$B;196|) $))
       (QSETREFV $ 101 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;197|) $))
       (QSETREFV $ 142 (CONS (|dispatchFunction| |EXPR;coerce;K$;198|) $))
       (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;199|) $))
       (QSETREFV $ 452 (CONS (|dispatchFunction| |EXPR;coerce;R$;200|) $))
       (QSETREFV $ 532 (CONS (|dispatchFunction| |EXPR;retract;$R;201|) $))
       (QSETREFV $ 535 (CONS (|dispatchFunction| |EXPR;coerce;$Of;202|) $))
       (QSETREFV $ 545 (CONS (|dispatchFunction| |EXPR;isPlus;$U;205|) $))
       (QSETREFV $ 549 (CONS (|dispatchFunction| |EXPR;isMult;$U;206|) $))
       (QSETREFV $ 536 (CONS (|dispatchFunction| |EXPR;eval;$LL$;207|) $))
       (QSETREFV $ 541 (CONS (|dispatchFunction| |EXPR;subst;$LL$;208|) $))
       (QSETREFV $ 550
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;209|) $))
       (COND
        ((|testBitVector| |pv$| 19)
         (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;210|) $))))))
     ('T
      (PROGN
       (SETELT $ 45 (|Kernel| $))
       (QSETREFV $ 101 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;211|) $))
       (QSETREFV $ 102 (CONS (|dispatchFunction| |EXPR;=;2$B;212|) $))
       (QSETREFV $ 142 (CONS (|dispatchFunction| |EXPR;coerce;K$;213|) $))
       (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;214|) $))
       (QSETREFV $ 452 (CONS (|dispatchFunction| |EXPR;coerce;R$;215|) $))
       (QSETREFV $ 532 (CONS (|dispatchFunction| |EXPR;retract;$R;216|) $))
       (QSETREFV $ 550
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;217|) $))
       (QSETREFV $ 535 (CONS (|dispatchFunction| |EXPR;coerce;$Of;218|) $))
       (QSETREFV $ 536 (CONS (|dispatchFunction| |EXPR;eval;$LL$;219|) $))
       (QSETREFV $ 541 (CONS (|dispatchFunction| |EXPR;subst;$LL$;220|) $))
       (COND
        ((|testBitVector| |pv$| 9)
         (QSETREFV $ 479
                   (CONS (|dispatchFunction| |EXPR;convert;$If;221|) $)))))))
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
              (|PolynomialCategoryQuotientFunctions| 424 15 6 41 $$)
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
              (1108 . |weierstrassZeta|) (1115 . |whittakerM|)
              (1122 . |whittakerM|) (1129 . |whittakerW|) (1136 . |whittakerW|)
              (1143 . |angerJ|) (1149 . |angerJ|) (1155 . |weberE|)
              (1161 . |weberE|) (1167 . |struveH|) (1173 . |struveH|)
              (1179 . |struveL|) (1185 . |struveL|) (1191 . |hankelH1|)
              (1197 . |hankelH1|) (1203 . |hankelH2|) (1209 . |hankelH2|)
              (1215 . |lommelS1|) (1222 . |lommelS1|) (1229 . |lommelS2|)
              (1236 . |lommelS2|) (1243 . |kummerM|) (1250 . |kummerM|)
              (1257 . |kummerU|) (1264 . |kummerU|) (1271 . |legendreP|)
              (1278 . |legendreP|) (1285 . |legendreQ|) (1292 . |legendreQ|)
              (1299 . |kelvinBei|) (1305 . |kelvinBei|) (1311 . |kelvinBer|)
              (1317 . |kelvinBer|) (1323 . |kelvinKei|) (1329 . |kelvinKei|)
              (1335 . |kelvinKer|) (1341 . |kelvinKer|) (1347 . |ellipticK|)
              (1352 . |ellipticK|) (1357 . |ellipticE|) (1362 . |ellipticE|)
              (1367 . |ellipticE|) (1373 . |ellipticE|) (1379 . |ellipticF|)
              (1385 . |ellipticF|) (1391 . |ellipticPi|) (1398 . |ellipticPi|)
              (1405 . |jacobiSn|) (1411 . |jacobiSn|) (1417 . |jacobiCn|)
              (1423 . |jacobiCn|) (1429 . |jacobiDn|) (1435 . |jacobiDn|)
              (1441 . |jacobiZeta|) (1447 . |jacobiZeta|)
              (1453 . |jacobiTheta|) (1459 . |jacobiTheta|) (1465 . |lerchPhi|)
              (1472 . |lerchPhi|) (1479 . |riemannZeta|) (1484 . |riemannZeta|)
              (1489 . |charlierC|) (1496 . |charlierC|) (1503 . |hermiteH|)
              (1509 . |hermiteH|) (1515 . |jacobiP|) (1523 . |jacobiP|)
              (1531 . |laguerreL|) (1538 . |laguerreL|) (1545 . |meixnerM|)
              (1553 . |meixnerM|) (1561 . |hypergeometricF|) (|List| $)
              (1568 . |hypergeometricF|) (1575 . |meijerG|) (1584 . |meijerG|)
              (|CombinatorialFunction| 6 $$) (1593 . ^) (1599 . |factorial|)
              (1604 . |factorial|) (1609 . |binomial|) (1615 . |binomial|)
              (1621 . |permutation|) (1627 . |permutation|)
              (1633 . |factorials|) (1638 . |factorials|) (1643 . |factorials|)
              (1649 . |factorials|) (1655 . |summation|) (1661 . |summation|)
              (|SegmentBinding| $$) (1667 . |summation|) (|SegmentBinding| $)
              (1673 . |summation|) (1679 . |product|) (1685 . |product|)
              (1691 . |product|) (1697 . |product|)
              (|LiouvillianFunction| 6 $$) (1703 . |erf|) (1708 . |erf|)
              (1713 . |erfi|) (1718 . |erfi|) (1723 . |Ei|) (1728 . |Ei|)
              (1733 . |Si|) (1738 . |Si|) (1743 . |Ci|) (1748 . |Ci|)
              (1753 . |Shi|) (1758 . |Shi|) (1763 . |Chi|) (1768 . |Chi|)
              (1773 . |li|) (1778 . |li|) (1783 . |dilog|) (1788 . |dilog|)
              (1793 . |fresnelS|) (1798 . |fresnelS|) (1803 . |fresnelC|)
              (1808 . |fresnelC|) (1813 . |integral|) (1819 . |integral|)
              (1825 . |integral|) (1831 . |integral|) (1837 . |belong?|)
              (1842 . |operator|) (1847 . |belong?|) (1852 . |operator|)
              (1857 . |belong?|) (1862 . |operator|) (1867 . |belong?|)
              (1872 . |operator|) (1877 . |belong?|) (1882 . |operator|)
              (1887 . |coerce|) (|Fraction| 404)
              (|PolynomialCategoryQuotientFunctions| 424 15 6 41 84)
              (1892 . |univariate|) (|SparseUnivariatePolynomial| 84)
              (1898 . |numer|) (1903 . |degree|) (1909 . |degree|)
              (1914 . |rem|) (1920 . |coerce|) (1925 . |elt|) (1931 . |Zero|)
              (1935 . ~=) (1941 . |leadingCoefficient|) (1946 . |reductum|)
              (1951 . |gcdPolynomial|) (|GcdDomain&| $$)
              (1957 . |gcdPolynomial|) (1963 . |gcdPolynomial|)
              (|Factored| 139) (|ExpressionFactorPolynomial| 6 $$)
              (1969 . |factorPolynomial|) (|Factored| 124)
              (1974 . |factorPolynomial|) (|IndexedExponents| 15)
              (1979 . |Zero|) (1983 . |monomial|) (|AlgebraicNumber|)
              (1989 . |coerce|) (1994 . ^) (2000 . ^) (2006 . |minPoly|)
              (2011 . |definingPolynomial|) (2016 . |definingPolynomial|)
              (2021 . |retract|) (2026 . |retract|) (2031 . |retractIfCan|)
              (|SparseMultivariatePolynomial| 57 12) (2036 . |numer|)
              (2041 . |denom|) (|Mapping| $$ 427) (|Kernel| 427)
              (|ExpressionSpaceFunctions2| 427 $$) (2046 . |map|)
              (|Mapping| $$ 441) (|Mapping| $$ 57)
              (|SparseMultivariatePolynomial| 57 441)
              (|PolynomialCategoryLifting| (|IndexedExponents| 441) 441 57 446
                                           $$)
              (2052 . |map|) (2059 . /) (|Union| 427 '"failed")
              (2065 . |retractIfCan|) (2070 . |coerce|) (2075 . |coerce|)
              (2080 . |belong?|) (2085 . |is?|) (|Union| 27 '#1#)
              (2091 . |retractIfCan|) (2096 . ~=)
              (|SparseUnivariatePolynomial| 427) (2102 . |Zero|)
              (2106 . |Zero|) (2110 . ~=) (2116 . |degree|) (2121 . |monomial|)
              (2127 . +) (2133 . |rootOf|) (2139 . |operator|) (2144 . |elt|)
              (|Union| 15 '"failed") (2150 . |mainVariable|)
              (2155 . |leadingCoefficient|) (2160 . |Zero|) (2164 . |ground?|)
              (2169 . ^) (2175 . *) (2181 . +) (|InputForm|) (2187 . |convert|)
              (2192 . |convert|) (|List| 10) (2197 . |eval|) (2205 . |eval|)
              (2213 . |variables|) (2218 . |concat|)
              (2223 . |removeDuplicates|) (2228 . |scripted?|) (|Mapping| 9 27)
              (2233 . |select|) (|MakeUnaryCompiledFunction| $$ $$ $$)
              (2239 . |compiledFunction|) (|Mapping| $ $) (|List| 491)
              (2245 . |eval|) (2252 . |new|) (2256 . |coerce|) (|Equation| $$)
              (2261 . =) (|List| 580) (2267 . |subst|)
              (|PatternMatchResult| 57 $$) (|Pattern| 57)
              (|PatternMatchFunctionSpace| 57 6 $$) (2273 . |patternMatch|)
              (|PatternMatchResult| 57 $) (2280 . |patternMatch|)
              (|PatternMatchResult| (|Float|) $$) (|Pattern| (|Float|))
              (|PatternMatchFunctionSpace| (|Float|) 6 $$)
              (2287 . |patternMatch|) (|PatternMatchResult| (|Float|) $)
              (2294 . |patternMatch|) (2301 . |reducedSystem|)
              (2306 . |reducedSystem|) (|PatternMatchKernel| 57 $$)
              (2312 . |patternMatch|) (|PatternMatchResult| 57 45)
              (|Mapping| 516 15 501 516)
              (|PatternMatchPolynomialCategory| 57 424 15 6 45)
              (2319 . |patternMatch|) (|PatternMatchKernel| (|Float|) $$)
              (2327 . |patternMatch|) (|PatternMatchResult| (|Float|) 45)
              (|Mapping| 522 15 507 522)
              (|PatternMatchPolynomialCategory| (|Float|) 424 15 6 45)
              (2334 . |patternMatch|) (2342 . |coerce|)
              (|Record| (|:| |gen| 15) (|:| |exp| 57)) (|List| 527)
              (2347 . |terms|) (2352 . |zero?|) (2357 . |constantKernel|)
              (2362 . |retract|) (|OutputForm|) (2367 . |coerce|)
              (2372 . |coerce|) (2377 . |eval|) (2384 . |map|)
              (|Mapping| $$ 15) (|ListToMap| 15 $$) (2390 . |match|)
              (2398 . |subst|) (2405 . |kernel|) (2411 . *)
              (|Union| 337 '#2="failed") (2417 . |isPlus|) (2422 . |first|)
              (|Record| (|:| |coef| 57) (|:| |var| 12)) (|Union| 547 '#2#)
              (2427 . |isMult|) (2432 . |retractIfCan|)
              (|Union| 158 '#3="failed") (|Union| 553 '#3#) (|List| 124)
              (|Matrix| 57)
              (|Record| (|:| |mat| 554) (|:| |vec| (|Vector| 57)))
              (|Union| $ '"failed") (|Factored| $) (|Fraction| 6)
              (|Fraction| 560) (|Polynomial| 558) (|Fraction| 124)
              (|Union| 112 '#1#) (|Polynomial| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |coef| 337) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 569 '"failed") (|Union| 57 '#1#)
              (|Record| (|:| |var| 12) (|:| |exponent| 57)) (|Union| 572 '#2#)
              (|Record| (|:| |val| $) (|:| |exponent| 57)) (|Union| 574 '#2#)
              (|List| 35) (|Mapping| $ 337) (|List| 577) (|Union| 110 '#1#)
              (|Equation| $) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 2437 |zerosOf| 2443 |zeroOf| 2470 |zero?| 2497 |whittakerW|
              2502 |whittakerM| 2509 |weierstrassZeta| 2516 |weierstrassSigma|
              2523 |weierstrassPPrime| 2530 |weierstrassP| 2537 |weberE| 2544
              |variables| 2550 |univariate| 2560 |unitNormal| 2566
              |unitCanonical| 2571 |unit?| 2576 |tower| 2581 |tanh| 2591 |tan|
              2596 |summation| 2601 |subtractIfCan| 2613 |subst| 2619 |struveL|
              2638 |struveH| 2644 |squareFreePolynomial| 2650 |squareFreePart|
              2655 |squareFree| 2660 |sqrt| 2665
              |solveLinearPolynomialEquation| 2670 |smaller?| 2676 |sizeLess?|
              2682 |sinh| 2688 |sin| 2693 |simplifyPower| 2698
              |setSimplifyDenomsFlag| 2704 |sech| 2709 |sec| 2714 |sample| 2719
              |rootsOf| 2723 |rootSum| 2750 |rootOf| 2757 |riemannZeta| 2784
              |retractIfCan| 2789 |retract| 2829 |rem| 2869 |reducedSystem|
              2875 |reduce| 2897 |recip| 2902 |quo| 2907 |product| 2913
              |principalIdeal| 2925 |prime?| 2930 |polylog| 2935 |polygamma|
              2941 |pi| 2947 |permutation| 2951 |patternMatch| 2957 |paren|
              2971 |opposite?| 2981 |operators| 2987 |operator| 2992 |one?|
              2997 |odd?| 3002 |numerator| 3007 |numer| 3012 |number?| 3017
              |nthRoot| 3022 |multiEuclidean| 3028 |minPoly| 3034 |meixnerM|
              3039 |meijerG| 3047 |map| 3056 |mainKernel| 3062 |lommelS2| 3067
              |lommelS1| 3074 |log| 3081 |li| 3086 |lerchPhi| 3091 |legendreQ|
              3098 |legendreP| 3105 |lcmCoef| 3112 |lcm| 3118 |latex| 3129
              |lambertW| 3134 |laguerreL| 3139 |kummerU| 3146 |kummerM| 3153
              |kernels| 3160 |kernel| 3170 |kelvinKer| 3182 |kelvinKei| 3188
              |kelvinBer| 3194 |kelvinBei| 3200 |jacobiZeta| 3206 |jacobiTheta|
              3212 |jacobiSn| 3218 |jacobiP| 3224 |jacobiDn| 3232 |jacobiCn|
              3238 |isTimes| 3244 |isPower| 3249 |isPlus| 3254 |isMult| 3259
              |isExpt| 3264 |is?| 3281 |inv| 3293 |integral| 3298
              |hypergeometricF| 3310 |hermiteH| 3317 |height| 3323
              |hashUpdate!| 3328 |hash| 3334 |hankelH2| 3339 |hankelH1| 3345
              |ground?| 3351 |ground| 3356 |getSimplifyDenomsFlag| 3361
              |gcdPolynomial| 3365 |gcd| 3371 |fresnelS| 3382 |fresnelC| 3387
              |freeOf?| 3392 |factorials| 3404 |factorial| 3415
              |factorSquareFreePolynomial| 3420 |factorPolynomial| 3425
              |factor| 3430 |extendedEuclidean| 3435 |exquo| 3448
              |expressIdealMember| 3454 |exp| 3460 |even?| 3465 |eval| 3470
              |euclideanSize| 3631 |erfi| 3636 |erf| 3641 |elt| 3646
              |ellipticPi| 3742 |ellipticK| 3749 |ellipticF| 3754 |ellipticE|
              3760 |divide| 3771 |distribute| 3777 |dilog| 3788 |digamma| 3793
              |differentiate| 3798 |denominator| 3824 |denom| 3829
              |definingPolynomial| 3834 |csch| 3839 |csc| 3844 |coth| 3849
              |cot| 3854 |cosh| 3859 |cos| 3864 |convert| 3869 |conjugate| 3889
              |conditionP| 3895 |commutator| 3900 |coerce| 3906 |charthRoot|
              3976 |charlierC| 3981 |characteristic| 3988 |box| 3992 |binomial|
              4002 |besselY| 4008 |besselK| 4014 |besselJ| 4020 |besselI| 4026
              |belong?| 4032 |atanh| 4037 |atan| 4042 |associates?| 4047
              |asinh| 4053 |asin| 4058 |asech| 4063 |asec| 4068 |applyQuote|
              4073 |annihilate?| 4109 |angerJ| 4115 |algtower| 4121
              |airyBiPrime| 4131 |airyBi| 4136 |airyAiPrime| 4141 |airyAi| 4146
              |acsch| 4151 |acsc| 4156 |acoth| 4161 |acot| 4166 |acosh| 4171
              |acos| 4176 |abs| 4181 ^ 4186 |Zero| 4216 |Si| 4220 |Shi| 4225
              |One| 4230 |Gamma| 4234 |Ei| 4245 D 4250 |Ci| 4276 |Chi| 4281
              |Beta| 4286 = 4292 / 4298 - 4310 + 4321 * 4327)
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
                 (|CoercibleTo| 533) (|RetractableTo| 87)
                 (|RetractableTo| (|Fraction| (|Polynomial| 6)))
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|RetractableTo| (|Polynomial| 6))
                 (|ConvertibleTo| 477) (|ConvertibleTo| 507)
                 (|ConvertibleTo| 501) (|RetractableTo| 57)
                 (|RetractableTo| 427) (|unitsKnown|)
                 (|SpecialFunctionCategory|) (|PrimitiveFunctionCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|CombinatorialFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 583
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
                                    269 2 225 2 2 2 270 2 0 0 0 0 271 2 225 2 2
                                    2 272 2 0 0 0 0 273 2 225 2 2 2 274 2 0 0 0
                                    0 275 2 225 2 2 2 276 2 0 0 0 0 277 2 225 2
                                    2 2 278 2 0 0 0 0 279 2 225 2 2 2 280 2 0 0
                                    0 0 281 3 225 2 2 2 2 282 3 0 0 0 0 0 283 3
                                    225 2 2 2 2 284 3 0 0 0 0 0 285 3 225 2 2 2
                                    2 286 3 0 0 0 0 0 287 3 225 2 2 2 2 288 3 0
                                    0 0 0 0 289 3 225 2 2 2 2 290 3 0 0 0 0 0
                                    291 3 225 2 2 2 2 292 3 0 0 0 0 0 293 2 225
                                    2 2 2 294 2 0 0 0 0 295 2 225 2 2 2 296 2 0
                                    0 0 0 297 2 225 2 2 2 298 2 0 0 0 0 299 2
                                    225 2 2 2 300 2 0 0 0 0 301 1 225 2 2 302 1
                                    0 0 0 303 1 225 2 2 304 1 0 0 0 305 2 225 2
                                    2 2 306 2 0 0 0 0 307 2 225 2 2 2 308 2 0 0
                                    0 0 309 3 225 2 2 2 2 310 3 0 0 0 0 0 311 2
                                    225 2 2 2 312 2 0 0 0 0 313 2 225 2 2 2 314
                                    2 0 0 0 0 315 2 225 2 2 2 316 2 0 0 0 0 317
                                    2 225 2 2 2 318 2 0 0 0 0 319 2 225 2 2 2
                                    320 2 0 0 0 0 321 3 225 2 2 2 2 322 3 0 0 0
                                    0 0 323 1 225 2 2 324 1 0 0 0 325 3 225 2 2
                                    2 2 326 3 0 0 0 0 0 327 2 225 2 2 2 328 2 0
                                    0 0 0 329 4 225 2 2 2 2 2 330 4 0 0 0 0 0 0
                                    331 3 225 2 2 2 2 332 3 0 0 0 0 0 333 4 225
                                    2 2 2 2 2 334 4 0 0 0 0 0 0 335 3 225 2 78
                                    78 2 336 3 0 0 337 337 0 338 5 225 2 78 78
                                    78 78 2 339 5 0 0 337 337 337 337 0 340 2
                                    341 2 2 2 342 1 341 2 2 343 1 0 0 0 344 2
                                    341 2 2 2 345 2 0 0 0 0 346 2 341 2 2 2 347
                                    2 0 0 0 0 348 1 341 2 2 349 1 0 0 0 350 2
                                    341 2 2 27 351 2 0 0 0 27 352 2 341 2 2 27
                                    353 2 0 0 0 27 354 2 341 2 2 355 356 2 0 0
                                    0 357 358 2 341 2 2 27 359 2 0 0 0 27 360 2
                                    341 2 2 355 361 2 0 0 0 357 362 1 363 2 2
                                    364 1 0 0 0 365 1 363 2 2 366 1 0 0 0 367 1
                                    363 2 2 368 1 0 0 0 369 1 363 2 2 370 1 0 0
                                    0 371 1 363 2 2 372 1 0 0 0 373 1 363 2 2
                                    374 1 0 0 0 375 1 363 2 2 376 1 0 0 0 377 1
                                    363 2 2 378 1 0 0 0 379 1 363 2 2 380 1 0 0
                                    0 381 1 363 2 2 382 1 0 0 0 383 1 363 2 2
                                    384 1 0 0 0 385 2 363 2 2 27 386 2 0 0 0 27
                                    387 2 363 2 2 355 388 2 0 0 0 357 389 1 165
                                    9 10 390 1 165 10 10 391 1 170 9 10 392 1
                                    170 10 10 393 1 341 9 10 394 1 341 10 10
                                    395 1 363 9 10 396 1 363 10 10 397 1 225 9
                                    10 398 1 225 10 10 399 1 84 0 41 400 2 402
                                    401 84 15 403 1 401 404 0 405 2 41 35 0 15
                                    406 1 139 35 0 407 2 139 0 0 0 408 1 41 0
                                    15 409 2 404 84 0 84 410 0 139 0 411 2 139
                                    9 0 0 412 1 139 2 0 413 1 139 0 0 414 2 45
                                    124 124 124 415 2 416 124 124 124 417 2 0
                                    124 124 124 418 1 420 419 139 421 1 0 422
                                    124 423 0 424 0 425 2 41 0 6 424 426 1 0 0
                                    427 428 2 165 2 2 87 429 2 0 0 0 87 430 1
                                    165 139 15 431 1 165 2 2 432 1 0 0 0 433 1
                                    45 87 0 434 1 0 87 0 435 1 45 71 0 436 1
                                    427 437 0 438 1 427 437 0 439 2 442 2 440
                                    441 443 3 447 2 444 445 446 448 2 427 0 0 0
                                    449 1 0 450 0 451 1 0 0 6 452 1 427 0 87
                                    453 1 427 9 10 454 2 10 9 0 27 455 1 0 456
                                    0 457 2 41 9 0 0 458 0 459 0 460 0 126 0
                                    461 2 126 9 0 0 462 1 126 35 0 463 2 459 0
                                    427 35 464 2 459 0 0 0 465 2 427 0 124 27
                                    466 1 427 10 10 467 2 427 0 10 337 468 1 41
                                    469 0 470 1 41 6 0 471 0 427 0 472 1 126 9
                                    0 473 2 427 0 0 35 474 2 427 0 0 0 475 2
                                    427 0 0 0 476 1 45 477 0 478 1 0 477 0 479
                                    4 0 0 0 480 337 27 481 4 0 0 0 10 0 27 482
                                    1 0 38 0 483 1 38 0 337 484 1 38 0 0 485 1
                                    27 9 0 486 2 38 0 487 0 488 2 489 146 2 27
                                    490 3 0 0 0 480 492 493 0 27 0 494 1 0 0 27
                                    495 2 496 0 2 2 497 2 0 0 0 498 499 3 502
                                    500 2 501 500 503 3 0 504 0 501 504 505 3
                                    508 506 2 507 506 509 3 0 510 0 507 510 511
                                    1 45 152 150 512 2 45 160 150 158 513 3 514
                                    500 15 501 500 515 4 518 516 45 501 516 517
                                    519 3 520 506 15 507 506 521 4 524 522 45
                                    507 522 523 525 1 45 0 15 526 1 45 528 0
                                    529 1 6 9 0 530 1 16 15 6 531 1 0 6 0 532 1
                                    45 533 0 534 1 0 533 0 535 3 0 0 0 74 337
                                    536 2 0 0 491 12 537 4 539 2 42 78 15 538
                                    540 3 0 0 0 74 337 541 2 0 0 10 337 542 2
                                    45 0 57 15 543 1 0 544 0 545 1 528 527 0
                                    546 1 0 548 0 549 1 0 14 0 550 2 0 9 0 0
                                    122 2 1 337 0 27 1 1 1 337 0 1 2 1 337 124
                                    27 1 1 1 337 124 1 1 1 337 563 1 2 1 0 0 27
                                    1 1 1 0 0 1 2 1 0 124 27 1 1 1 0 563 1 1 1
                                    0 124 1 1 27 9 0 54 3 1 0 0 0 0 269 3 1 0 0
                                    0 0 267 3 1 0 0 0 0 265 3 1 0 0 0 0 263 3 1
                                    0 0 0 0 261 3 1 0 0 0 0 259 2 1 0 0 0 273 1
                                    0 38 337 1 1 0 38 0 483 2 1 561 0 12 1 1 1
                                    564 0 1 1 1 0 0 1 1 1 9 0 1 1 0 74 337 1 1
                                    0 74 0 1 1 1 0 0 206 1 1 0 0 182 2 1 0 0
                                    357 358 2 1 0 0 27 354 2 19 556 0 0 1 2 0 0
                                    0 498 499 3 0 0 0 74 337 541 2 0 0 0 580 1
                                    2 1 0 0 0 277 2 1 0 0 0 275 1 26 422 124 1
                                    1 1 0 0 1 1 1 557 0 1 1 1 0 0 1 2 26 552
                                    553 124 1 2 0 9 0 0 101 2 1 9 0 0 1 1 1 0 0
                                    202 1 1 0 0 178 2 1 0 0 57 92 1 1 9 9 134 1
                                    1 0 0 210 1 1 0 0 186 0 31 0 1 2 1 337 0 27
                                    1 1 1 337 0 1 2 1 337 124 27 1 1 1 337 563
                                    1 1 1 337 124 1 3 1 0 0 124 27 169 2 1 0 0
                                    27 1 1 1 0 0 1 2 1 0 124 27 167 1 1 0 563 1
                                    1 1 0 124 1 1 1 0 0 325 1 15 450 0 451 1 16
                                    71 0 72 1 1 562 0 1 1 14 571 0 1 1 5 579 0
                                    1 1 0 14 0 550 1 0 456 0 457 1 0 18 0 19 1
                                    15 427 0 1 1 16 87 0 435 1 1 112 0 1 1 14
                                    57 0 1 1 5 110 0 1 1 0 6 0 532 1 0 27 0 1 1
                                    0 12 0 13 2 1 0 0 0 1 1 24 554 150 1 2 24
                                    555 150 158 1 2 5 160 150 158 162 1 5 152
                                    150 154 1 1 0 0 116 1 29 556 0 1 2 1 0 0 0
                                    1 2 1 0 0 357 362 2 1 0 0 27 360 1 1 566
                                    337 1 1 1 9 0 1 2 1 0 0 0 257 2 1 0 0 0 237
                                    0 1 0 172 2 1 0 0 0 348 3 12 510 0 507 510
                                    511 3 13 504 0 501 504 505 1 0 0 337 1 1 0
                                    0 0 1 2 27 9 0 0 1 1 0 480 0 1 1 0 10 10 37
                                    1 29 9 0 52 1 32 9 0 1 1 5 0 0 94 1 5 104 0
                                    105 1 1 9 0 73 2 1 0 0 57 1 2 1 544 337 0 1
                                    1 33 124 12 138 4 1 0 0 0 0 0 335 5 34 0
                                    337 337 337 337 0 340 2 0 0 491 12 537 1 0
                                    18 0 1 3 1 0 0 0 0 285 3 1 0 0 0 0 283 1 1
                                    0 0 176 1 1 0 0 379 3 1 0 0 0 0 323 3 1 0 0
                                    0 0 293 3 1 0 0 0 0 291 2 1 565 0 0 1 2 1 0
                                    0 0 1 1 1 0 337 1 1 0 581 0 1 1 1 0 0 255 3
                                    1 0 0 0 0 333 3 1 0 0 0 0 289 3 1 0 0 0 0
                                    287 1 0 74 0 75 1 0 74 337 1 2 0 0 10 337
                                    542 2 0 0 10 0 1 2 1 0 0 0 301 2 1 0 0 0
                                    299 2 1 0 0 0 297 2 1 0 0 0 295 2 1 0 0 0
                                    319 2 1 0 0 0 321 2 1 0 0 0 313 4 1 0 0 0 0
                                    0 331 2 1 0 0 0 317 2 1 0 0 0 315 1 29 544
                                    0 1 1 5 575 0 1 1 27 544 0 545 1 27 548 0
                                    549 2 5 573 0 27 1 2 5 573 0 10 1 1 29 573
                                    0 1 2 0 9 0 27 76 2 0 9 0 10 1 1 23 0 0 1 2
                                    1 0 0 357 389 2 1 0 0 27 387 3 34 0 337 337
                                    0 338 2 1 0 0 0 329 1 0 35 0 1 2 0 583 583
                                    0 1 1 0 582 0 1 2 1 0 0 0 281 2 1 0 0 0 279
                                    1 0 9 0 70 1 0 6 0 1 0 1 9 133 2 1 124 124
                                    124 418 1 1 0 337 1 2 1 0 0 0 1 1 1 0 0 383
                                    1 1 0 0 385 2 0 9 0 27 1 2 0 9 0 0 1 2 1 0
                                    0 27 352 1 1 0 0 350 1 1 0 0 344 1 26 422
                                    124 1 1 26 422 124 423 1 1 557 0 1 2 1 568
                                    0 0 1 3 1 570 0 0 0 1 2 1 556 0 0 1 2 1 544
                                    337 0 1 1 1 0 0 174 1 32 9 0 1 2 9 0 0 27 1
                                    2 9 0 0 38 1 4 9 0 0 10 0 27 482 1 9 0 0 1
                                    4 9 0 0 480 337 27 481 4 5 0 0 38 576 578 1
                                    4 5 0 0 38 576 492 1 4 5 0 0 27 35 491 1 4
                                    5 0 0 27 35 577 1 3 0 0 0 10 491 1 3 0 0 0
                                    480 578 1 3 0 0 0 10 577 1 3 0 0 0 480 492
                                    493 3 0 0 0 27 577 1 3 0 0 0 27 491 1 3 0 0
                                    0 38 492 1 3 0 0 0 38 578 1 3 0 0 0 0 0 1 3
                                    0 0 0 337 337 1 2 0 0 0 580 1 3 0 0 0 74
                                    337 536 2 0 0 0 498 1 3 0 0 0 12 0 1 1 1 35
                                    0 1 1 1 0 0 367 1 1 0 0 365 10 0 0 10 0 0 0
                                    0 0 0 0 0 0 1 2 0 0 10 337 1 9 0 0 10 0 0 0
                                    0 0 0 0 0 1 7 0 0 10 0 0 0 0 0 0 1 8 0 0 10
                                    0 0 0 0 0 0 0 1 5 0 0 10 0 0 0 0 1 6 0 0 10
                                    0 0 0 0 0 1 4 0 0 10 0 0 0 1 2 0 0 10 0 1 3
                                    0 0 10 0 0 1 3 1 0 0 0 0 311 1 1 0 0 303 2
                                    1 0 0 0 309 1 1 0 0 305 2 1 0 0 0 307 2 1
                                    567 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 1 0 0 381
                                    1 1 0 0 235 3 5 0 0 38 576 1 3 5 0 0 27 35
                                    1 2 5 0 0 27 1 2 5 0 0 38 1 1 1 0 0 95 1 1
                                    104 0 107 1 33 0 0 433 1 1 0 0 212 1 1 0 0
                                    188 1 1 0 0 208 1 1 0 0 184 1 1 0 0 204 1 1
                                    0 0 180 1 9 477 0 479 1 10 507 0 1 1 11 501
                                    0 1 1 1 0 557 1 2 8 0 0 0 1 1 35 551 150 1
                                    2 8 0 0 0 1 1 15 0 427 428 1 22 0 87 1 1 21
                                    0 57 61 1 1 0 558 1 1 1 0 559 1 1 1 0 560 1
                                    1 1 0 112 115 1 1 0 0 1 1 5 0 104 109 1 5 0
                                    110 111 1 0 0 6 452 1 0 0 27 495 1 0 0 12
                                    142 1 0 533 0 535 1 36 556 0 1 3 1 0 0 0 0
                                    327 0 5 35 1 1 0 0 337 1 1 0 0 0 1 2 1 0 0
                                    0 346 2 1 0 0 0 241 2 1 0 0 0 245 2 1 0 0 0
                                    239 2 1 0 0 0 243 1 0 9 10 11 1 1 0 0 218 1
                                    1 0 0 194 2 1 9 0 0 1 1 1 0 0 214 1 1 0 0
                                    190 1 1 0 0 222 1 1 0 0 198 5 0 0 27 0 0 0
                                    0 1 2 0 0 27 337 1 4 0 0 27 0 0 0 1 2 0 0
                                    27 0 1 3 0 0 27 0 0 1 2 5 9 0 0 1 2 1 0 0 0
                                    271 1 1 74 0 86 1 1 74 337 1 1 1 0 0 253 1
                                    1 0 0 251 1 1 0 0 249 1 1 0 0 247 1 1 0 0
                                    224 1 1 0 0 200 1 1 0 0 220 1 1 0 0 196 1 1
                                    0 0 216 1 1 0 0 192 1 1 0 0 227 2 23 0 0 57
                                    97 2 1 0 0 0 89 2 1 0 0 87 430 2 29 0 0 35
                                    96 2 29 0 0 98 99 0 27 0 47 1 1 0 0 371 1 1
                                    0 0 375 0 29 0 49 1 1 0 0 229 2 1 0 0 0 231
                                    1 1 0 0 369 3 5 0 0 27 35 1 3 5 0 0 38 576
                                    1 2 5 0 0 38 1 2 5 0 0 27 1 1 1 0 0 373 1 1
                                    0 0 377 2 1 0 0 0 233 2 0 9 0 0 102 2 23 0
                                    0 0 69 2 1 0 104 104 145 2 19 0 0 0 67 1 19
                                    0 0 56 2 27 0 0 0 65 2 19 0 57 0 59 2 27 0
                                    35 0 1 2 27 0 98 0 1 2 2 0 6 0 1 2 2 0 0 6
                                    1 2 1 0 87 0 1 2 1 0 0 87 1 2 29 0 0 0
                                    63)))))
           '|lookupComplete|)) 
