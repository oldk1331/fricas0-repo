
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

(SDEFUN |EXPR;simplifyPower| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((|args| (|List| $)) (|k| (|List| (|Kernel| $))))
               (SEQ
                (LETT |k| (SPADCALL |x| (QREFELT $ 75))
                      . #1=(|EXPR;simplifyPower|))
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
                                   (QREFELT $ 83))
                         $)
                        (SPADCALL |args| 2 (QREFELT $ 81)) (QREFELT $ 84)))
                      (#2='T
                       (SPADCALL (SPADCALL |args| (QREFELT $ 85))
                                 (SPADCALL |n| (SPADCALL |args| (QREFELT $ 86))
                                           (QREFELT $ 59))
                                 (QREFELT $ 84)))))))
                  (#2#
                   (|EXPR;reduc| (SPADCALL |x| |n| (QREFELT $ 82))
                    (SPADCALL |x| (QREFELT $ 83)) $))))))) 

(SDEFUN |EXPR;^;$Nni$;19| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (COND ((EQL |n| 0) (|spadConstant| $ 49)) ((EQL |n| 1) |x|)
              ('T
               (SPADCALL
                (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT $ 88)) |n| $)
                (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT $ 89)) |n| $)
                (QREFELT $ 69))))) 

(SDEFUN |EXPR;^;$I$;20| ((|x| $) (|n| |Integer|) ($ $))
        (COND ((EQL |n| 0) (|spadConstant| $ 49)) ((EQL |n| 1) |x|)
              (#1='T
               (COND
                ((EQL |n| -1)
                 (SPADCALL (|spadConstant| $ 49) |x| (QREFELT $ 69)))
                (#1#
                 (SPADCALL
                  (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT $ 88)) |n| $)
                  (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT $ 89)) |n| $)
                  (QREFELT $ 69))))))) 

(SDEFUN |EXPR;^;$Pi$;21| ((|x| $) (|n| |PositiveInteger|) ($ $))
        (COND ((EQL |n| 1) |x|)
              ('T
               (SPADCALL
                (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT $ 88)) |n| $)
                (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT $ 89)) |n| $)
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
        (|EXPR;reduc| |x| (SPADCALL |x| (QREFELT $ 83)) $)) 

(SDEFUN |EXPR;commonk| ((|x| $) (|y| $) ($ |List| (|Kernel| $)))
        (|EXPR;commonk0| (SPADCALL |x| (QREFELT $ 83))
         (SPADCALL |y| (QREFELT $ 83)) $)) 

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
        (SPADCALL |f| (SPADCALL |f| (QREFELT $ 83)) (QREFELT $ 115))) 

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
                                (SPADCALL 2 (QREFELT $ 61)) (QREFELT $ 117))
                      NIL)
                     (#2='T
                      (SEQ (LETT |a| (SPADCALL |al| 1 (QREFELT $ 81)) . #1#)
                           (EXIT
                            (NULL
                             (SPADCALL
                              (LENGTH
                               (|EXPR;algkernels| (SPADCALL |a| (QREFELT $ 75))
                                $))
                              0 (QREFELT $ 118))))))))))
                 (#2# NIL))))) 

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
                (SPADCALL (SPADCALL |x| (QREFELT $ 101)) |r| (QREFELT $ 120))
                . #3#)
          (LETT |n0| (SPADCALL |x| (QREFELT $ 99)) . #3#)
          (LETT |c1| (SPADCALL |dp| (QREFELT $ 122)) . #3#)
          (LETT |c0| (SPADCALL (SPADCALL |dp| (QREFELT $ 123)) (QREFELT $ 122))
                . #3#)
          (LETT |n1|
                (SPADCALL |dn|
                          (SPADCALL (SPADCALL |c0| |n0| (QREFELT $ 124))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 103) |r| 1
                                                (QREFELT $ 125))
                                      |c1| (QREFELT $ 124))
                                     |n0| (QREFELT $ 124))
                                    (QREFELT $ 126))
                          (QREFELT $ 124))
                . #3#)
          (LETT |d1|
                (SPADCALL
                 (SPADCALL (SPADCALL |c0| |c0| (QREFELT $ 124)) |dn|
                           (QREFELT $ 124))
                 (SPADCALL (SPADCALL |an| |c1| (QREFELT $ 124)) |c1|
                           (QREFELT $ 124))
                 (QREFELT $ 126))
                . #3#)
          (EXIT
           (|EXPR;reduc| (SPADCALL |n1| |d1| (QREFELT $ 127)) (LIST |r|) $))))) 

(PUT '|EXPR;getSimplifyDenomsFlag;B;35| '|SPADreplace|
     '(XLAM NIL |algreduc_flag|)) 

(SDEFUN |EXPR;getSimplifyDenomsFlag;B;35| (($ |Boolean|)) |algreduc_flag|) 

(SDEFUN |EXPR;setSimplifyDenomsFlag;2B;36| ((|x| |Boolean|) ($ |Boolean|))
        (SPROG ((|res| (|Boolean|)))
               (SEQ
                (LETT |res| (SPADCALL (QREFELT $ 128))
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
                  ((SPADCALL (QREFELT $ 128))
                   (SEQ
                    (LETT |akl|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 103)
                                     (SPADCALL |x1| (QREFELT $ 101))
                                     (QREFELT $ 127))
                           (QREFELT $ 83))
                          . #3#)
                    (EXIT
                     (COND ((EQL (LENGTH |akl|) 0) |x1|)
                           (#4='T
                            (SEQ
                             (COND
                              ((EQL (LENGTH |akl|) 1)
                               (SEQ
                                (LETT |r| (SPADCALL |akl| 1 (QREFELT $ 130))
                                      . #3#)
                                (EXIT
                                 (COND
                                  ((|EXPR;simple_root| |r| $)
                                   (PROGN
                                    (LETT #2# (|EXPR;root_reduce| |x| |r| $)
                                          . #3#)
                                    (GO #5=#:G241))))))))
                             (LETT |sas| (SPADCALL (QREFELT $ 132)) . #3#)
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
                                                             (QREFELT $ 133))
                                                   (QREFELT $ 136))
                                         . #3#)
                                   (EXIT
                                    (LETT |x1|
                                          (SPADCALL
                                           (SPADCALL |q| |sas|
                                                     (SPADCALL |k|
                                                               (QREFELT $ 137))
                                                     (QREFELT $ 138))
                                           (QREFELT $ 139))
                                          . #3#)))
                                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT |x1|)))))))
                  (#4# |x1|)))))
          #5# (EXIT #2#)))) 

(SDEFUN |EXPR;/;2Smp$;38|
        ((|x| |SparseMultivariatePolynomial| R . #1=((|Kernel| $)))
         (|y| |SparseMultivariatePolynomial| R . #1#) ($ $))
        (|EXPR;reduc| (SPADCALL |x| |y| (QREFELT $ 127))
         (|EXPR;commonk| (SPADCALL |x| (|spadConstant| $ 103) (QREFELT $ 127))
          (SPADCALL |y| (|spadConstant| $ 103) (QREFELT $ 127)) $)
         $)) 

(SDEFUN |EXPR;reducedSystem;MM;39| ((|m| |Matrix| $) ($ |Matrix| R))
        (SPROG
         ((|mm| (|Matrix| (|SparseMultivariatePolynomial| R (|Kernel| $)))))
         (SEQ
          (LETT |mm|
                (SPADCALL
                 (SPADCALL (CONS (|function| |EXPR;toprat|) $) |m|
                           (QREFELT $ 143))
                 (QREFELT $ 146))
                |EXPR;reducedSystem;MM;39|)
          (EXIT (SPADCALL |mm| (QREFELT $ 148)))))) 

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
                           (QREFELT $ 143))
                 (SPADCALL (CONS (|function| |EXPR;toprat|) $) |v|
                           (QREFELT $ 151))
                 (QREFELT $ 154))
                |EXPR;reducedSystem;MVR;40|)
          (EXIT (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT $ 156)))))) 

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
                            ((SPADCALL |k| |y| (QREFELT $ 158))
                             (LETT |ans| (SPADCALL |k| |ans| (QREFELT $ 159))
                                   . #2#)))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |EXPR;rootOf;SupS$;42|
        ((|x| |SparseUnivariatePolynomial| $) (|v| |Symbol|) ($ $))
        (SPADCALL |x| |v| (QREFELT $ 161))) 

(SDEFUN |EXPR;rootSum;$SupS$;43|
        ((|x| $) (|p| |SparseUnivariatePolynomial| $) (|v| |Symbol|) ($ $))
        (SPADCALL |x| |p| |v| (QREFELT $ 163))) 

(SDEFUN |EXPR;pi;$;44| (($ $)) (SPADCALL (QREFELT $ 166))) 

(SDEFUN |EXPR;exp;2$;45| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 168))) 

(SDEFUN |EXPR;log;2$;46| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 170))) 

(SDEFUN |EXPR;sin;2$;47| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 172))) 

(SDEFUN |EXPR;cos;2$;48| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 174))) 

(SDEFUN |EXPR;tan;2$;49| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 176))) 

(SDEFUN |EXPR;cot;2$;50| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 178))) 

(SDEFUN |EXPR;sec;2$;51| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 180))) 

(SDEFUN |EXPR;csc;2$;52| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 182))) 

(SDEFUN |EXPR;asin;2$;53| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 184))) 

(SDEFUN |EXPR;acos;2$;54| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 186))) 

(SDEFUN |EXPR;atan;2$;55| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 188))) 

(SDEFUN |EXPR;acot;2$;56| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 190))) 

(SDEFUN |EXPR;asec;2$;57| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 192))) 

(SDEFUN |EXPR;acsc;2$;58| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 194))) 

(SDEFUN |EXPR;sinh;2$;59| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 196))) 

(SDEFUN |EXPR;cosh;2$;60| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 198))) 

(SDEFUN |EXPR;tanh;2$;61| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 200))) 

(SDEFUN |EXPR;coth;2$;62| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 202))) 

(SDEFUN |EXPR;sech;2$;63| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 204))) 

(SDEFUN |EXPR;csch;2$;64| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 206))) 

(SDEFUN |EXPR;asinh;2$;65| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 208))) 

(SDEFUN |EXPR;acosh;2$;66| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 210))) 

(SDEFUN |EXPR;atanh;2$;67| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 212))) 

(SDEFUN |EXPR;acoth;2$;68| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 214))) 

(SDEFUN |EXPR;asech;2$;69| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 216))) 

(SDEFUN |EXPR;acsch;2$;70| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 218))) 

(SDEFUN |EXPR;abs;2$;71| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 221))) 

(SDEFUN |EXPR;conjugate;2$;72| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 223))) 

(SDEFUN |EXPR;Gamma;2$;73| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 225))) 

(SDEFUN |EXPR;Gamma;3$;74| ((|a| $) (|x| $) ($ $))
        (SPADCALL |a| |x| (QREFELT $ 227))) 

(SDEFUN |EXPR;Beta;3$;75| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 229))) 

(SDEFUN |EXPR;digamma;2$;76| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 231))) 

(SDEFUN |EXPR;polygamma;3$;77| ((|k| $) (|x| $) ($ $))
        (SPADCALL |k| |x| (QREFELT $ 233))) 

(SDEFUN |EXPR;besselJ;3$;78| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 235))) 

(SDEFUN |EXPR;besselY;3$;79| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 237))) 

(SDEFUN |EXPR;besselI;3$;80| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 239))) 

(SDEFUN |EXPR;besselK;3$;81| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 241))) 

(SDEFUN |EXPR;airyAi;2$;82| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 243))) 

(SDEFUN |EXPR;airyAiPrime;2$;83| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 245))) 

(SDEFUN |EXPR;airyBi;2$;84| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 247))) 

(SDEFUN |EXPR;airyBiPrime;2$;85| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 249))) 

(SDEFUN |EXPR;lambertW;2$;86| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 251))) 

(SDEFUN |EXPR;polylog;3$;87| ((|s| $) (|x| $) ($ $))
        (SPADCALL |s| |x| (QREFELT $ 253))) 

(SDEFUN |EXPR;weierstrassP;4$;88| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 255))) 

(SDEFUN |EXPR;weierstrassPPrime;4$;89| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 257))) 

(SDEFUN |EXPR;weierstrassSigma;4$;90| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 259))) 

(SDEFUN |EXPR;weierstrassZeta;4$;91| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 261))) 

(SDEFUN |EXPR;weierstrassPInverse;4$;92| ((|g2| $) (|g3| $) (|z| $) ($ $))
        (SPADCALL |g2| |g3| |z| (QREFELT $ 263))) 

(SDEFUN |EXPR;whittakerM;4$;93| ((|k| $) (|m| $) (|z| $) ($ $))
        (SPADCALL |k| |m| |z| (QREFELT $ 265))) 

(SDEFUN |EXPR;whittakerW;4$;94| ((|k| $) (|m| $) (|z| $) ($ $))
        (SPADCALL |k| |m| |z| (QREFELT $ 267))) 

(SDEFUN |EXPR;angerJ;3$;95| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 269))) 

(SDEFUN |EXPR;weberE;3$;96| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 271))) 

(SDEFUN |EXPR;struveH;3$;97| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 273))) 

(SDEFUN |EXPR;struveL;3$;98| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 275))) 

(SDEFUN |EXPR;hankelH1;3$;99| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 277))) 

(SDEFUN |EXPR;hankelH2;3$;100| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 279))) 

(SDEFUN |EXPR;lommelS1;4$;101| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 281))) 

(SDEFUN |EXPR;lommelS2;4$;102| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 283))) 

(SDEFUN |EXPR;kummerM;4$;103| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 285))) 

(SDEFUN |EXPR;kummerU;4$;104| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 287))) 

(SDEFUN |EXPR;legendreP;4$;105| ((|nu| $) (|mu| $) (|z| $) ($ $))
        (SPADCALL |nu| |mu| |z| (QREFELT $ 289))) 

(SDEFUN |EXPR;legendreQ;4$;106| ((|nu| $) (|mu| $) (|z| $) ($ $))
        (SPADCALL |nu| |mu| |z| (QREFELT $ 291))) 

(SDEFUN |EXPR;kelvinBei;3$;107| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 293))) 

(SDEFUN |EXPR;kelvinBer;3$;108| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 295))) 

(SDEFUN |EXPR;kelvinKei;3$;109| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 297))) 

(SDEFUN |EXPR;kelvinKer;3$;110| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 299))) 

(SDEFUN |EXPR;ellipticK;2$;111| ((|m| $) ($ $)) (SPADCALL |m| (QREFELT $ 301))) 

(SDEFUN |EXPR;ellipticE;2$;112| ((|m| $) ($ $)) (SPADCALL |m| (QREFELT $ 303))) 

(SDEFUN |EXPR;ellipticE;3$;113| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 305))) 

(SDEFUN |EXPR;ellipticF;3$;114| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 307))) 

(SDEFUN |EXPR;ellipticPi;4$;115| ((|z| $) (|n| $) (|m| $) ($ $))
        (SPADCALL |z| |n| |m| (QREFELT $ 309))) 

(SDEFUN |EXPR;jacobiSn;3$;116| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 311))) 

(SDEFUN |EXPR;jacobiCn;3$;117| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 313))) 

(SDEFUN |EXPR;jacobiDn;3$;118| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 315))) 

(SDEFUN |EXPR;jacobiZeta;3$;119| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 317))) 

(SDEFUN |EXPR;jacobiTheta;3$;120| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 319))) 

(SDEFUN |EXPR;lerchPhi;4$;121| ((|z| $) (|s| $) (|a| $) ($ $))
        (SPADCALL |z| |s| |a| (QREFELT $ 321))) 

(SDEFUN |EXPR;riemannZeta;2$;122| ((|z| $) ($ $))
        (SPADCALL |z| (QREFELT $ 323))) 

(SDEFUN |EXPR;charlierC;4$;123| ((|n| $) (|a| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |z| (QREFELT $ 325))) 

(SDEFUN |EXPR;hermiteH;3$;124| ((|n| $) (|z| $) ($ $))
        (SPADCALL |n| |z| (QREFELT $ 327))) 

(SDEFUN |EXPR;jacobiP;5$;125| ((|n| $) (|a| $) (|b| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |b| |z| (QREFELT $ 329))) 

(SDEFUN |EXPR;laguerreL;4$;126| ((|n| $) (|a| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |z| (QREFELT $ 331))) 

(SDEFUN |EXPR;meixnerM;5$;127| ((|n| $) (|b| $) (|c| $) (|z| $) ($ $))
        (SPADCALL |n| |b| |c| |z| (QREFELT $ 333))) 

(SDEFUN |EXPR;hypergeometricF;2L2$;128|
        ((|la| . #1=(|List| $)) (|lb| . #1#) (|x| $) ($ $))
        (SPADCALL |la| |lb| |x| (QREFELT $ 335))) 

(SDEFUN |EXPR;meijerG;4L2$;129|
        ((|la| . #1=(|List| $)) (|lb| . #1#) (|lc| . #1#) (|ld| . #1#) (|x| $)
         ($ $))
        (SPADCALL |la| |lb| |lc| |ld| |x| (QREFELT $ 338))) 

(SDEFUN |EXPR;^;3$;130| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 341))) 

(SDEFUN |EXPR;factorial;2$;131| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 342))) 

(SDEFUN |EXPR;binomial;3$;132| ((|n| $) (|m| $) ($ $))
        (SPADCALL |n| |m| (QREFELT $ 344))) 

(SDEFUN |EXPR;permutation;3$;133| ((|n| $) (|m| $) ($ $))
        (SPADCALL |n| |m| (QREFELT $ 346))) 

(SDEFUN |EXPR;factorials;2$;134| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 348))) 

(SDEFUN |EXPR;factorials;$S$;135| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 350))) 

(SDEFUN |EXPR;summation;$S$;136| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 352))) 

(SDEFUN |EXPR;summation;$Sb$;137| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 355))) 

(SDEFUN |EXPR;product;$S$;138| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 358))) 

(SDEFUN |EXPR;product;$Sb$;139| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 360))) 

(SDEFUN |EXPR;erf;2$;140| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 363))) 

(SDEFUN |EXPR;erfi;2$;141| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 365))) 

(SDEFUN |EXPR;Ei;2$;142| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 367))) 

(SDEFUN |EXPR;Si;2$;143| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 369))) 

(SDEFUN |EXPR;Ci;2$;144| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 371))) 

(SDEFUN |EXPR;Shi;2$;145| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 373))) 

(SDEFUN |EXPR;Chi;2$;146| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 375))) 

(SDEFUN |EXPR;li;2$;147| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 377))) 

(SDEFUN |EXPR;dilog;2$;148| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 379))) 

(SDEFUN |EXPR;fresnelS;2$;149| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 381))) 

(SDEFUN |EXPR;fresnelC;2$;150| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 383))) 

(SDEFUN |EXPR;integral;$S$;151| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 385))) 

(SDEFUN |EXPR;integral;$Sb$;152| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 387))) 

(SDEFUN |EXPR;operator;2Bo;153| ((|op| . #1=(|BasicOperator|)) ($ . #1#))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |op| (QREFELT $ 389))
                  (SPADCALL |op| (QREFELT $ 390)))
                 ((SPADCALL |op| (QREFELT $ 391))
                  (SPADCALL |op| (QREFELT $ 392)))
                 ((SPADCALL |op| (QREFELT $ 393))
                  (SPADCALL |op| (QREFELT $ 394)))
                 ((SPADCALL |op| (QREFELT $ 395))
                  (SPADCALL |op| (QREFELT $ 396)))
                 ((SPADCALL |op| (QREFELT $ 397))
                  (SPADCALL |op| (QREFELT $ 398)))
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
         ((|p| (|SparseUnivariatePolynomial| $)) (#1=#:G388 NIL) (|k| NIL))
         (SEQ
          (SEQ (LETT |k| NIL . #2=(|EXPR;reduc|)) (LETT #1# |l| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |p| (SPADCALL |k| (QREFELT $ 133)) . #2#)
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
        (SPROG ((#1=#:G397 NIL))
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
                            (LETT #1# NIL . #2=(|EXPR;noalg?|))
                            (GO #3=#:G396)))
                          ('T
                           (LETT |p| (SPADCALL |p| (QREFELT $ 414)) . #2#)))))
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
                            (SPADCALL |p| (|spadConstant| $ 411)
                                      (QREFELT $ 412)))
                           (GO G191)))
                         (SEQ (LETT |lc| (SPADCALL |p| (QREFELT $ 413)) . #1#)
                              (LETT |res|
                                    (SPADCALL (SPADCALL |lc| (QREFELT $ 83))
                                              |res| (QREFELT $ 415))
                                    . #1#)
                              (EXIT
                               (LETT |p| (SPADCALL |p| (QREFELT $ 414))
                                     . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |res| (QREFELT $ 416)))))) 

(SDEFUN |EXPR;algpars| ((|lk| |List| (|Kernel| $)) ($ |List| (|Kernel| $)))
        (SPROG
         ((|res| (|List| (|Kernel| $))) (|arg| (|List| $)) (#1=#:G408 NIL)
          (|k| NIL))
         (SEQ (LETT |res| NIL . #2=(|EXPR;algpars|))
              (SEQ (LETT |k| NIL . #2#) (LETT #1# |lk| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |k| '|nthRoot| (QREFELT $ 116)))
                      (COND
                       ((NULL (SPADCALL |k| '|rootOf| (QREFELT $ 116)))
                        (EXIT (|error| "apars: unknown kernel"))))))
                    (LETT |arg| (SPADCALL |k| (QREFELT $ 79)) . #2#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL (SPADCALL |arg| 1 (QREFELT $ 81))
                                      (QREFELT $ 75))
                            |res| (QREFELT $ 415))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT $ 416)))))) 

(SDEFUN |EXPR;trivial_denoms|
        ((|p| |SparseUnivariatePolynomial| $) ($ |Boolean|))
        (SPADCALL (CONS #'|EXPR;trivial_denoms!0| $)
                  (SPADCALL |p| (QREFELT $ 418)) (QREFELT $ 420))) 

(SDEFUN |EXPR;trivial_denoms!0| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 101)) (|spadConstant| $ 103)
                  (QREFELT $ 417))) 

(SDEFUN |EXPR;SUP_to_SUPP|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| $))))
        (SPADCALL (ELT $ 99) |p| (QREFELT $ 423))) 

(SDEFUN |EXPR;def_poly|
        ((|k| |Kernel| $)
         ($ |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| $))))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G419 NIL)
          (|p1| (|SparseMultivariatePolynomial| R (|Kernel| $))) (|arg2| ($))
          (|arg1| ($)) (|args| (|List| $)))
         (SEQ
          (LETT |args| (SPADCALL |k| (QREFELT $ 79)) . #2=(|EXPR;def_poly|))
          (LETT |arg1| (SPADCALL |args| (QREFELT $ 85)) . #2#)
          (LETT |arg2| (SPADCALL |args| 2 (QREFELT $ 81)) . #2#)
          (EXIT
           (COND
            ((SPADCALL |k| '|rootOf| (QREFELT $ 116))
             (SEQ (LETT |p1| (SPADCALL |arg1| (QREFELT $ 99)) . #2#)
                  (EXIT
                   (SPADCALL |p1| (SPADCALL |arg2| (QREFELT $ 13))
                             (QREFELT $ 120)))))
            ((SPADCALL |k| '|nthRoot| (QREFELT $ 116))
             (SEQ
              (LETT |n|
                    (PROG1 (LETT #1# (SPADCALL |arg2| (QREFELT $ 424)) . #2#)
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#))
                    . #2#)
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |arg1| (QREFELT $ 101)) |n|
                          (QREFELT $ 425))
                (SPADCALL (SPADCALL |arg1| (QREFELT $ 99)) (QREFELT $ 426))
                (QREFELT $ 427)))))
            ('T (|error| "def_poly : unknown kernel"))))))) 

(SDEFUN |EXPR;varmap1|
        ((|k0| |Kernel| $) (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|))
         ($ |Symbol|))
        (SPROG
         ((#1=#:G427 NIL) (#2=#:G428 NIL) (|k| NIL) (#3=#:G429 NIL) (|s| NIL))
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
                    ((SPADCALL |k| |k0| (QREFELT $ 428))
                     (PROGN (LETT #1# |s| . #4#) (GO #5=#:G426))))))
                 (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#)) . #4#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT (|error| "varmap1: kernel not on the list"))))
          #5# (EXIT #1#)))) 

(SDEFUN |EXPR;varmap2|
        ((|s0| |Symbol|) (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|))
         ($ |Kernel| $))
        (SPROG
         ((#1=#:G433 NIL) (#2=#:G434 NIL) (|k| NIL) (#3=#:G435 NIL) (|s| NIL))
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
                     (PROGN (LETT #1# |k| . #4#) (GO #5=#:G432))))))
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
                         (ELT $ 433) |p| (QREFELT $ 437)))) 

(SDEFUN |EXPR;MP_to_PI!0| ((|k| NIL) ($$ NIL))
        (PROG ($ |lk| |ls|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;MP_to_PI|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |ls| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| $ 430) (|EXPR;varmap1| |k| |lk| |ls| $)
                      (|spadConstant| $ 431) (QREFELT $ 432)))))) 

(SDEFUN |EXPR;SUPP_to_PI|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| $)))
         (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|)) (|xk| |Kernel| $)
         ($ |Polynomial| (|Integer|)))
        (SPROG ((|p2| (|SparseMultivariatePolynomial| R (|Kernel| $))))
               (SEQ
                (LETT |p2| (SPADCALL |p| |xk| (QREFELT $ 438))
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
                          (ELT $ 442) |p| (QREFELT $ 446))
                . #1=(|EXPR;PI_to_SUP|))
          (LETT |p2| (SPADCALL |p1| |xk| (QREFELT $ 120)) . #1#)
          (EXIT
           (LETT |p3| (SPADCALL (ELT $ 104) |p2| (QREFELT $ 449)) . #1#))))) 

(SDEFUN |EXPR;PI_to_SUP!0| ((|s| NIL) ($$ NIL))
        (PROG ($ |lk| |ls|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;PI_to_SUP|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |ls| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| $ 103) (|EXPR;varmap2| |s| |lk| |ls| $)
                      (|spadConstant| $ 431) (QREFELT $ 125)))))) 

(SDEFUN |EXPR;to_RF|
        ((|c| $) (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|))
         ($ |Fraction| (|Polynomial| (|Integer|))))
        (SPADCALL (|EXPR;MP_to_PI| (SPADCALL |c| (QREFELT $ 99)) |lk| |ls| $)
                  (|EXPR;MP_to_PI| (SPADCALL |c| (QREFELT $ 101)) |lk| |ls| $)
                  (QREFELT $ 454))) 

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
          (LETT |p2| (SPADCALL |p| |k| (QREFELT $ 438))
                . #1=(|EXPR;SUPP_to_PT|))
          (LETT |up|
                (SPADCALL
                 (SPADCALL (|EXPR;MP_to_PI| |p2| |lk| |ls| $) (QREFELT $ 455))
                 (QREFELT $ 457))
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
                          (QREFELT $ 460))
                |EXPR;SUP_to_PT|)
          (EXIT (CONS |s| |up|))))) 

(SDEFUN |EXPR;SUP_to_PT!0| ((|c| NIL) ($$ NIL))
        (PROG (|lk| |ls| $)
          (LETT |lk| (QREFELT $$ 2) . #1=(|EXPR;SUP_to_PT|))
          (LETT |ls| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|EXPR;to_RF| |c| |lk| |ls| $))))) 

(SDEFUN |EXPR;gcdPolynomial;3Sup;172|
        ((|p| . #1=(|SparseUnivariatePolynomial| $)) (|q| . #1#) ($ . #1#))
        (SPROG
         ((|g2| (|Polynomial| (|Integer|)))
          (|lm2|
           (|List|
            (|Record| (|:| |var| (|Symbol|))
                      (|:| |coef|
                           (|SparseUnivariatePolynomial|
                            (|Fraction| (|Polynomial| (|Integer|))))))))
          (#2=#:G484 NIL) (|m| NIL) (#3=#:G485 NIL) (|k| NIL) (#4=#:G483 NIL)
          (|q2|
           #5=(|Record| (|:| |var| (|Symbol|))
                        (|:| |coef|
                             (|SparseUnivariatePolynomial|
                              (|Fraction| (|Polynomial| (|Integer|)))))))
          (|p2| #5#) (|g1| (|Polynomial| (|Integer|)))
          (|p_syms| (|List| (|Symbol|))) (|a_syms| (|List| (|Symbol|)))
          (#6=#:G482 NIL) (#7=#:G481 NIL)
          (|lm1| (|List| (|Polynomial| (|Integer|)))) (#8=#:G479 NIL)
          (#9=#:G480 NIL) (#10=#:G478 NIL)
          (|q1| #11=(|Polynomial| (|Integer|))) (|p1| #11#) (#12=#:G477 NIL)
          (#13=#:G476 NIL)
          (|lm|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| R (|Kernel| $)))))
          (#14=#:G475 NIL) (#15=#:G474 NIL) (|all_syms| (|List| (|Symbol|)))
          (|all_kers| (|List| (|Kernel| $))) (|xk| (|Kernel| $))
          (|x| #16=(|Symbol|)) (|all_syms0| (|List| #16#)) (#17=#:G473 NIL)
          (#18=#:G472 NIL) (|akers| (|List| (|Kernel| $)))
          (|all_kers0| (|List| (|Kernel| $))) (|apars| (|List| (|Kernel| $)))
          (|cl| (|List| $)))
         (SEQ
          (COND ((SPADCALL |p| (|spadConstant| $ 411) (QREFELT $ 461)) |q|)
                ((EQL (SPADCALL |p| (QREFELT $ 407)) 0) (|spadConstant| $ 462))
                ((SPADCALL |q| (|spadConstant| $ 411) (QREFELT $ 461)) |p|)
                (#19='T
                 (COND
                  ((EQL (SPADCALL |q| (QREFELT $ 407)) 0)
                   (|spadConstant| $ 462))
                  (#19#
                   (SEQ
                    (COND
                     ((|EXPR;noalg?| |p| $)
                      (COND
                       ((|EXPR;noalg?| |q| $)
                        (EXIT (SPADCALL |p| |q| (QREFELT $ 463)))))))
                    (LETT |cl|
                          (SPADCALL (SPADCALL |p| (QREFELT $ 418))
                                    (SPADCALL |q| (QREFELT $ 418))
                                    (QREFELT $ 464))
                          . #20=(|EXPR;gcdPolynomial;3Sup;172|))
                    (LETT |akers| (SPADCALL |cl| (QREFELT $ 465)) . #20#)
                    (LETT |apars| (|EXPR;algpars| |akers| $) . #20#)
                    (LETT |all_kers0|
                          (SPADCALL (SPADCALL |cl| (QREFELT $ 466)) |apars|
                                    (QREFELT $ 467))
                          . #20#)
                    (LETT |akers| (REVERSE (SPADCALL |akers| (QREFELT $ 468)))
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
                                        (CONS (SPADCALL (QREFELT $ 469)) #18#)
                                        . #20#)))
                                (LETT #17# (CDR #17#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #18#))))
                          . #20#)
                    (LETT |x| (SPADCALL (QREFELT $ 469)) . #20#)
                    (LETT |xk| (SPADCALL |x| (QREFELT $ 30)) . #20#)
                    (LETT |all_kers|
                          (SPADCALL |xk| |all_kers0| (QREFELT $ 470)) . #20#)
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
                          (SPADCALL |all_syms0| |a_syms| (QREFELT $ 471))
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
                                (SPADCALL |all_syms0| |a_syms| (QREFELT $ 471))
                                . #20#)
                          (LETT |g1|
                                (SPADCALL |p1| |q1| |lm1| |p_syms| |x| |a_syms|
                                          (QREFELT $ 473))
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
                                    (QREFELT $ 476))
                          . #20#)
                    (EXIT
                     (|EXPR;PI_to_SUP| |g2| |all_kers| |all_syms| |xk|
                      $)))))))))) 

(SDEFUN |EXPR;gcdPolynomial;3Sup;173|
        ((|p| . #1=(|SparseUnivariatePolynomial| $)) (|q| . #1#) ($ . #1#))
        (SEQ
         (COND
          ((|EXPR;noalg?| |p| $)
           (COND
            ((|EXPR;noalg?| |q| $)
             (EXIT (SPADCALL |p| |q| (QREFELT $ 463)))))))
         (EXIT (SPADCALL |p| |q| (QREFELT $ 479))))) 

(SDEFUN |EXPR;factorPolynomial;SupF;174|
        ((|x| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |x| (QREFELT $ 482))) 

(SDEFUN |EXPR;coerce;An$;175| ((|x| |AlgebraicNumber|) ($ $))
        (SPADCALL (SPADCALL |x| (|spadConstant| $ 486) (QREFELT $ 487))
                  (QREFELT $ 104))) 

(SDEFUN |EXPR;^;$F$;176| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL |x| |r| (QREFELT $ 491))) 

(SDEFUN |EXPR;minPoly;KSup;177|
        ((|k| |Kernel| . #1=($)) ($ |SparseUnivariatePolynomial| . #1#))
        (SPADCALL |k| (QREFELT $ 493))) 

(SDEFUN |EXPR;definingPolynomial;2$;178| ((|x| $) ($ $))
        (SPADCALL |x| (QREFELT $ 494))) 

(SDEFUN |EXPR;retract;$F;179| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL |x| (QREFELT $ 496))) 

(SDEFUN |EXPR;retractIfCan;$U;180|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPADCALL |x| (QREFELT $ 498))) 

(SDEFUN |EXPR;coerce;An$;181| ((|x| |AlgebraicNumber|) ($ $))
        (SPADCALL (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 500)) $)
                  (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 501)) $)
                  (QREFELT $ 69))) 

(SDEFUN |EXPR;k2expr| ((|k| |Kernel| (|AlgebraicNumber|)) ($ $))
        (SPADCALL (ELT $ 489) |k| (QREFELT $ 505))) 

(SDEFUN |EXPR;smp2expr|
        ((|p| |SparseMultivariatePolynomial| (|Integer|)
          (|Kernel| (|AlgebraicNumber|)))
         ($ $))
        (SPADCALL (CONS (|function| |EXPR;k2expr|) $) (ELT $ 61) |p|
                  (QREFELT $ 510))) 

(SDEFUN |EXPR;retractIfCan;$U;184|
        ((|x| $) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG
         ((#1=#:G514 NIL) (|d| #2=(|Union| (|AlgebraicNumber|) "failed"))
          (|n| #2#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |n| (|EXPR;smp2an| (SPADCALL |x| (QREFELT $ 99)) $)
                   . #3=(|EXPR;retractIfCan;$U;184|))
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
                                           (QREFELT $ 511)))
                           . #3#)
                     (GO #4=#:G509))))))))))
            (EXIT (CONS 1 "failed"))))
          #4# (EXIT #1#)))) 

(SDEFUN |EXPR;R2AN| ((|r| R) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG ((|u| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL (SPADCALL |r| (QREFELT $ 514)) (QREFELT $ 72))
                      |EXPR;R2AN|)
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 515))))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |EXPR;k2an| ((|k| |Kernel| $) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG
         ((|arg| (|List| (|AlgebraicNumber|))) (#1=#:G546 NIL)
          (|a| #2=(|Union| (|AlgebraicNumber|) #3="failed")) (#4=#:G547 NIL)
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
               (QREFELT $ 516)))
             (CONS 1 "failed"))
            ('T
             (COND
              ((SPADCALL |op| '|rootOf| (QREFELT $ 517))
               (SEQ (LETT |args| (SPADCALL |k| (QREFELT $ 79)) . #5#)
                    (LETT |a2| (SPADCALL |args| 2 (QREFELT $ 81)) . #5#)
                    (LETT |k1u| (SPADCALL |a2| (QREFELT $ 19)) . #5#)
                    (EXIT
                     (COND ((QEQCAR |k1u| 1) (CONS 1 "failed"))
                           (#6='T
                            (SEQ (LETT |k1| (QCDR |k1u|) . #5#)
                                 (LETT |s1u| (SPADCALL |a2| (QREFELT $ 519))
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
                                                  (QREFELT $ 520))
                                                 (|error|
                                                  "Bad argument to rootOf"))
                                                (#6#
                                                 (SEQ
                                                  (LETT |eq|
                                                        (SPADCALL
                                                         (SPADCALL |a1|
                                                                   (QREFELT $
                                                                            99))
                                                         |k1| (QREFELT $ 120))
                                                        . #5#)
                                                  (LETT |eqa|
                                                        (|spadConstant| $ 522)
                                                        . #5#)
                                                  (SEQ G190
                                                       (COND
                                                        ((NULL
                                                          (SPADCALL |eq|
                                                                    (|spadConstant|
                                                                     $ 523)
                                                                    (QREFELT $
                                                                             524)))
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |cc|
                                                              (SPADCALL
                                                               (SPADCALL |eq|
                                                                         (QREFELT
                                                                          $
                                                                          122))
                                                               (QREFELT $ 104))
                                                              . #5#)
                                                        (LETT |ccu|
                                                              (SPADCALL |cc|
                                                                        (QREFELT
                                                                         $
                                                                         513))
                                                              . #5#)
                                                        (EXIT
                                                         (COND
                                                          ((QEQCAR |ccu| 1)
                                                           (PROGN
                                                            (LETT #1#
                                                                  (CONS 1
                                                                        "failed")
                                                                  . #5#)
                                                            (GO #7=#:G545)))
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
                                                                              525))
                                                                    (QREFELT $
                                                                             526))
                                                                   (QREFELT $
                                                                            527))
                                                                  . #5#)
                                                            (EXIT
                                                             (LETT |eq|
                                                                   (SPADCALL
                                                                    |eq|
                                                                    (QREFELT $
                                                                             123))
                                                                   . #5#)))))))
                                                       NIL (GO G190) G191
                                                       (EXIT NIL))
                                                  (EXIT
                                                   (CONS 0
                                                         (SPADCALL |eqa| |s1|
                                                                   (QREFELT $
                                                                            528))))))))))))))))))
              (#6#
               (SEQ (LETT |arg| NIL . #5#)
                    (SEQ (LETT |x| NIL . #5#)
                         (LETT #4# (SPADCALL |k| (QREFELT $ 79)) . #5#) G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
                           (GO G191)))
                         (SEQ (LETT |a| (SPADCALL |x| (QREFELT $ 513)) . #5#)
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
                           (SPADCALL (SPADCALL |op| (QREFELT $ 529))
                                     (NREVERSE |arg|) (QREFELT $ 530))))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |EXPR;smp2an|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $))
         ($ |Union| (|AlgebraicNumber|) #1="failed"))
        (SPROG
         ((|c| (|Union| (|AlgebraicNumber|) #1#))
          (|up|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| $))))
          (|ans| (|AlgebraicNumber|)) (#2=#:G562 NIL)
          (|t| (|Union| (|AlgebraicNumber|) "failed")) (|k| (|Kernel| $))
          (|x1| (|Union| (|Kernel| $) "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |x1| (SPADCALL |p| (QREFELT $ 532)) . #3=(|EXPR;smp2an|))
                (EXIT
                 (COND
                  ((QEQCAR |x1| 1)
                   (|EXPR;R2AN| (SPADCALL |p| (QREFELT $ 533)) $))
                  (#4='T
                   (SEQ
                    (LETT |up|
                          (SPADCALL |p| (LETT |k| (QCDR |x1|) . #3#)
                                    (QREFELT $ 120))
                          . #3#)
                    (LETT |t| (|EXPR;k2an| |k| $) . #3#)
                    (EXIT
                     (COND ((QEQCAR |t| 1) (CONS 1 "failed"))
                           (#4#
                            (SEQ (LETT |ans| (|spadConstant| $ 534) . #3#)
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (NULL
                                          (SPADCALL |up| (QREFELT $ 535))))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |c|
                                             (|EXPR;smp2an|
                                              (SPADCALL |up| (QREFELT $ 122))
                                              $)
                                             . #3#)
                                       (EXIT
                                        (COND
                                         ((QEQCAR |c| 1)
                                          (PROGN
                                           (LETT #2# (CONS 1 "failed") . #3#)
                                           (GO #5=#:G561)))
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
                                                                        $ 525))
                                                                      (QREFELT
                                                                       $ 536))
                                                                     (QREFELT $
                                                                              537))
                                                           (QREFELT $ 538))
                                                 . #3#)
                                           (EXIT
                                            (LETT |up|
                                                  (SPADCALL |up|
                                                            (QREFELT $ 123))
                                                  . #3#)))))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (LETT |c|
                                       (|EXPR;smp2an|
                                        (SPADCALL |up| (QREFELT $ 122)) $)
                                       . #3#)
                                 (EXIT
                                  (COND ((QEQCAR |c| 1) (CONS 1 "failed"))
                                        (#4#
                                         (CONS 0
                                               (SPADCALL |ans| (QCDR |c|)
                                                         (QREFELT $
                                                                  538))))))))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |EXPR;convert;$If;188| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 540))) 

(SDEFUN |EXPR;eval;$Bo$S$;189|
        ((|f| $) (|op| |BasicOperator|) (|g| $) (|x| |Symbol|) ($ $))
        (SPADCALL |f| (LIST |op|) (LIST |g|) |x| (QREFELT $ 543))) 

(SDEFUN |EXPR;eval;$LLS$;190|
        ((|f| $) (|ls| |List| (|BasicOperator|)) (|lg| |List| $) (|x| |Symbol|)
         ($ $))
        (SPROG
         ((|res| ($)) (#1=#:G593 NIL) (|g| NIL) (#2=#:G592 NIL)
          (|nlg| (|List| $)) (#3=#:G591 NIL) (#4=#:G590 NIL)
          (|lbackwardSubs| (|List| (|Equation| $))) (#5=#:G588 NIL) (|i| NIL)
          (#6=#:G589 NIL) (|j| NIL) (#7=#:G587 NIL)
          (|lforwardSubs| (|List| (|Equation| $))) (#8=#:G585 NIL)
          (#9=#:G586 NIL) (#10=#:G584 NIL) (|ns| (|List| (|Symbol|)))
          (#11=#:G583 NIL) (#12=#:G582 NIL) (#13=#:G581 NIL) (#14=#:G580 NIL)
          (|lsd| (|List| (|Symbol|))) (|lsym| (|List| (|Symbol|)))
          (|llsym| (|List| (|List| (|Symbol|)))) (#15=#:G579 NIL)
          (#16=#:G578 NIL))
         (SEQ
          (LETT |llsym|
                (PROGN
                 (LETT #16# NIL . #17=(|EXPR;eval;$LLS$;190|))
                 (SEQ (LETT |g| NIL . #17#) (LETT #15# |lg| . #17#) G190
                      (COND
                       ((OR (ATOM #15#)
                            (PROGN (LETT |g| (CAR #15#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #16# (CONS (SPADCALL |g| (QREFELT $ 545)) #16#)
                              . #17#)))
                      (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #16#))))
                . #17#)
          (LETT |lsym|
                (SPADCALL (SPADCALL |llsym| (QREFELT $ 546)) (QREFELT $ 547))
                . #17#)
          (LETT |lsd| (SPADCALL (ELT $ 548) |lsym| (QREFELT $ 550)) . #17#)
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
                                     (CONS (SPADCALL |g| |x| (QREFELT $ 552))
                                           #14#)
                                     . #17#)))
                             (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                             (EXIT (NREVERSE #14#))))
                       (QREFELT $ 555)))
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
                            (LETT #12# (CONS (SPADCALL (QREFELT $ 469)) #12#)
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
                                   (SPADCALL (SPADCALL |i| (QREFELT $ 556))
                                             (SPADCALL |j| (QREFELT $ 556))
                                             (QREFELT $ 558))
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
                                   (SPADCALL (SPADCALL |j| (QREFELT $ 556))
                                             (SPADCALL |i| (QREFELT $ 556))
                                             (QREFELT $ 558))
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
                                             (QREFELT $ 560))
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
                                             (SPADCALL |g| |x| (QREFELT $ 552))
                                             #2#)
                                            . #17#)))
                                    (LETT #1# (CDR #1#) . #17#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 555))
                    . #17#)
              (EXIT (SPADCALL |res| |lbackwardSubs| (QREFELT $ 560)))))))))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;191|
        ((|x| $) (|p| |Pattern| #1=(|Integer|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 564))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;192|
        ((|x| $) (|p| |Pattern| #1=(|Float|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 570))) 

(SDEFUN |EXPR;Zero;$;193| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |EXPR;One;$;194| (($ $)) (|spadConstant| $ 48)) 

(SDEFUN |EXPR;-;2$;195| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |EXPR;*;I2$;196| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL |n| |x| (QREFELT $ 58))) 

(SDEFUN |EXPR;*;3$;197| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 62))) 

(SDEFUN |EXPR;+;3$;198| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 64))) 

(SDEFUN |EXPR;=;2$B;199| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(SDEFUN |EXPR;smaller?;2$B;200| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 94))) 

(PUT '|EXPR;numer;$Smp;201| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |EXPR;numer;$Smp;201|
        ((|x| $) ($ |SparseMultivariatePolynomial| R (|Kernel| $))) |x|) 

(PUT '|EXPR;coerce;Smp$;202| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |EXPR;coerce;Smp$;202|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) ($ $)) |p|) 

(SDEFUN |EXPR;coerce;P$;203| ((|p| |Polynomial| R) ($ $))
        (|EXPR;poly_to_MP| |p| $)) 

(SDEFUN |EXPR;reducedSystem;MM;204| ((|m| |Matrix| $) ($ |Matrix| R))
        (SPADCALL |m| (QREFELT $ 573))) 

(SDEFUN |EXPR;reducedSystem;MVR;205|
        ((|m| |Matrix| . #1=($)) (|v| |Vector| . #1#)
         ($ |Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R))))
        (SPADCALL |m| |v| (QREFELT $ 574))) 

(SDEFUN |EXPR;convert;$If;206| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 540))) 

(SDEFUN |EXPR;kintmatch|
        ((|k| |Kernel| $) (|p| |Pattern| (|Integer|))
         (|l| |PatternMatchResult| (|Integer|) |Rep|)
         ($ |PatternMatchResult| (|Integer|) |Rep|))
        (SPADCALL |k| |p| |l| (QREFELT $ 576))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;208|
        ((|x| $) (|p| |Pattern| #1=(|Integer|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kintmatch|) $)
                  (QREFELT $ 580))) 

(SDEFUN |EXPR;kfltmatch|
        ((|k| |Kernel| $) (|p| |Pattern| (|Float|))
         (|l| |PatternMatchResult| (|Float|) |Rep|)
         ($ |PatternMatchResult| (|Float|) |Rep|))
        (SPADCALL |k| |p| |l| (QREFELT $ 582))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;210|
        ((|x| $) (|p| |Pattern| #1=(|Float|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kfltmatch|) $)
                  (QREFELT $ 586))) 

(SDEFUN |EXPR;Zero;$;211| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |EXPR;+;3$;212| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 64))) 

(SDEFUN |EXPR;=;2$B;213| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(SDEFUN |EXPR;smaller?;2$B;214| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 94))) 

(SDEFUN |EXPR;coerce;K$;215| ((|k| |Kernel| $) ($ $))
        (SPADCALL |k| (QREFELT $ 587))) 

(SDEFUN |EXPR;kernels;$L;216| ((|x| $) ($ |List| (|Kernel| $)))
        (SPROG ((#1=#:G630 NIL) (|f| NIL) (#2=#:G629 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EXPR;kernels;$L;216|))
                 (SEQ (LETT |f| NIL . #3#)
                      (LETT #1# (SPADCALL |x| (QREFELT $ 590)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCAR |f|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EXPR;coerce;R$;217| ((|x| R) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 591)) (|spadConstant| $ 47))
              ('T (SPADCALL (SPADCALL |x| (QREFELT $ 592)) (QREFELT $ 137))))) 

(SDEFUN |EXPR;retract;$R;218| ((|x| $) ($ R))
        (COND ((SPADCALL |x| (QREFELT $ 54)) (|spadConstant| $ 87))
              ('T (|EXPR;retNotUnit| |x| $)))) 

(SDEFUN |EXPR;coerce;$Of;219| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 594))) 

(SDEFUN |EXPR;kereval|
        ((|k| |Kernel| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SPADCALL |lk| |lv| |k|
                         (CONS #'|EXPR;kereval!1| (VECTOR |lk| |lv| $))
                         (QREFELT $ 600)))) 

(SDEFUN |EXPR;kereval!1| ((|x2| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;kereval|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT |lk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|EXPR;kereval!0| (VECTOR $ |lv| |lk|))
                             |x2| (QREFELT $ 597))))))) 

(SDEFUN |EXPR;kereval!0| ((|x1| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x1| |lk| |lv| (QREFELT $ 596)))))) 

(SDEFUN |EXPR;subeval|
        ((|k| |Kernel| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |k|
                          (CONS #'|EXPR;subeval!0| (VECTOR |lv| |lk| $))
                          (QREFELT $ 600))))) 

(SDEFUN |EXPR;subeval!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |lk| |lv|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subeval|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |lv| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G654 NIL) (|a| NIL) (#3=#:G653 NIL))
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
                                                       (QREFELT $ 601))
                                             #3#)
                                            NIL)))
                                    (LETT #2# (CDR #2#) NIL) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              (QREFELT $ 602)))))))) 

(SDEFUN |EXPR;isPlus;$U;222| ((|x| $) ($ |Union| (|List| $) "failed"))
        (SPROG
         ((#1=#:G669 NIL) (|t| NIL) (#2=#:G668 NIL)
          (|l|
           (|List| (|Record| (|:| |k| (|Kernel| $)) (|:| |c| (|Integer|))))))
         (SEQ
          (COND
           ((OR
             (NULL
              (LETT |l| (SPADCALL |x| (QREFELT $ 590))
                    . #3=(|EXPR;isPlus;$U;222|)))
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
                                           (QREFELT $ 603))
                                 #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |EXPR;isMult;$U;223|
        ((|x| $)
         ($ |Union|
          (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| $)))
          "failed"))
        (SPROG
         ((|t| (|Record| (|:| |k| (|Kernel| $)) (|:| |c| (|Integer|))))
          (|l|
           (|List| (|Record| (|:| |k| (|Kernel| $)) (|:| |c| (|Integer|))))))
         (SEQ
          (COND
           ((OR
             (NULL
              (LETT |l| (SPADCALL |x| (QREFELT $ 590))
                    . #1=(|EXPR;isMult;$U;223|)))
             (NULL (NULL (CDR |l|))))
            (CONS 1 "failed"))
           ('T
            (SEQ (LETT |t| (SPADCALL |l| (QREFELT $ 606)) . #1#)
                 (EXIT (CONS 0 (CONS (QCDR |t|) (QCAR |t|)))))))))) 

(SDEFUN |EXPR;eval;$LL$;224|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG
         ((#1=#:G685 NIL) (#2=#:G684 ($)) (#3=#:G686 ($)) (#4=#:G688 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|EXPR;eval;$LL$;224|))
           (SEQ (LETT |t| NIL . #5#)
                (LETT #4# (SPADCALL |x| (QREFELT $ 590)) . #5#) G190
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

(SDEFUN |EXPR;subst;$LL$;225|
        ((|x| $) (|lk| |List| (|Kernel| . #1=($))) (|lv| |List| . #1#) ($ $))
        (SPROG
         ((#2=#:G691 NIL) (#3=#:G690 ($)) (#4=#:G692 ($)) (#5=#:G694 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #2# NIL . #6=(|EXPR;subst;$LL$;225|))
           (SEQ (LETT |t| NIL . #6#)
                (LETT #5# (SPADCALL |x| (QREFELT $ 590)) . #6#) G190
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

(SDEFUN |EXPR;retractIfCan;$U;226| ((|x| $) ($ |Union| R "failed"))
        (COND ((SPADCALL |x| (QREFELT $ 54)) (CONS 0 (|spadConstant| $ 87)))
              ('T (|EXPR;retNotUnitIfCan| |x| $)))) 

(SDEFUN |EXPR;-;2$;227| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |EXPR;smaller?;2$B;228| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 94))) 

(SDEFUN |EXPR;=;2$B;229| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(PUT '|EXPR;coerce;K$;230| '|SPADreplace| '(XLAM (|k|) |k|)) 

(SDEFUN |EXPR;coerce;K$;230| ((|k| |Kernel| $) ($ $)) |k|) 

(PUT '|EXPR;kernels;$L;231| '|SPADreplace| 'LIST) 

(SDEFUN |EXPR;kernels;$L;231| ((|x| $) ($ |List| (|Kernel| $))) (LIST |x|)) 

(SDEFUN |EXPR;coerce;R$;232| ((|x| R) ($ $)) (SPADCALL |x| (QREFELT $ 592))) 

(SDEFUN |EXPR;retract;$R;233| ((|x| $) ($ R)) (|EXPR;retNotUnit| |x| $)) 

(SDEFUN |EXPR;retractIfCan;$U;234| ((|x| $) ($ |Union| R "failed"))
        (|EXPR;retNotUnitIfCan| |x| $)) 

(SDEFUN |EXPR;coerce;$Of;235| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 594))) 

(SDEFUN |EXPR;eval;$LL$;236|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SPADCALL |lk| |lv| |x|
                         (CONS #'|EXPR;eval;$LL$;236!1| (VECTOR |lk| |lv| $))
                         (QREFELT $ 600)))) 

(SDEFUN |EXPR;eval;$LL$;236!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;eval;$LL$;236|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT |lk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (CONS #'|EXPR;eval;$LL$;236!0| (VECTOR $ |lv| |lk|)) |x1|
                    (QREFELT $ 597))))))) 

(SDEFUN |EXPR;eval;$LL$;236!0| ((|x2| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |lk| |lv| (QREFELT $ 596)))))) 

(SDEFUN |EXPR;subst;$LL$;237|
        ((|x| $) (|lk| |List| (|Kernel| . #1=($))) (|lv| |List| . #1#) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |x|
                          (CONS #'|EXPR;subst;$LL$;237!0| (VECTOR |lv| |lk| $))
                          (QREFELT $ 600))))) 

(SDEFUN |EXPR;subst;$LL$;237!0| ((|x1| NIL) ($$ NIL))
        (PROG ($ |lk| |lv|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subst;$LL$;237|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |lv| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G730 NIL) (|a| NIL) (#3=#:G729 NIL))
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
                                                       (QREFELT $ 601))
                                             #3#)
                                            NIL)))
                                    (LETT #2# (CDR #2#) NIL) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              (QREFELT $ 602)))))))) 

(SDEFUN |EXPR;convert;$If;238| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 540))) 

(DECLAIM (NOTINLINE |Expression;|)) 

(DEFUN |Expression| (#1=#:G776)
  (SPROG NIL
         (PROG (#2=#:G777)
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
   ((#1=#:G775 NIL) (|pv$| NIL) (#2=#:G771 NIL) (#3=#:G772 NIL) (#4=#:G773 NIL)
    (#5=#:G774 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #6=(|Expression|))
    (LETT |dv$| (LIST '|Expression| DV$1) . #6#)
    (LETT $ (GETREFV 644) . #6#)
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
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1| '(|Group|))
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
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
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiGroup|))
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            (|HasCategory| |#1|
                                                           '(|SemiGroup|)))
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            #5#)
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
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
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
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #5#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|))
                                              . #6#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #3#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|AbelianSemiGroup|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #5#)
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|SemiGroup|)))))
                    . #6#))
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
           . #6#)
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
          (QSETREFV $ 128
                    (CONS
                     (|dispatchFunction| |EXPR;getSimplifyDenomsFlag;B;35|) $))
          (QSETREFV $ 129
                    (CONS
                     (|dispatchFunction| |EXPR;setSimplifyDenomsFlag;2B;36|)
                     $))
          (QSETREFV $ 140 (CONS (|dispatchFunction| |EXPR;/;2Smp$;38|) $))
          (QSETREFV $ 149
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;39|) $))
          (QSETREFV $ 157
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;40|) $))
          (QSETREFV $ 162 (CONS (|dispatchFunction| |EXPR;rootOf;SupS$;42|) $))
          (QSETREFV $ 164
                    (CONS (|dispatchFunction| |EXPR;rootSum;$SupS$;43|) $))
          (QSETREFV $ 167 (CONS (|dispatchFunction| |EXPR;pi;$;44|) $))
          (QSETREFV $ 169 (CONS (|dispatchFunction| |EXPR;exp;2$;45|) $))
          (QSETREFV $ 171 (CONS (|dispatchFunction| |EXPR;log;2$;46|) $))
          (QSETREFV $ 173 (CONS (|dispatchFunction| |EXPR;sin;2$;47|) $))
          (QSETREFV $ 175 (CONS (|dispatchFunction| |EXPR;cos;2$;48|) $))
          (QSETREFV $ 177 (CONS (|dispatchFunction| |EXPR;tan;2$;49|) $))
          (QSETREFV $ 179 (CONS (|dispatchFunction| |EXPR;cot;2$;50|) $))
          (QSETREFV $ 181 (CONS (|dispatchFunction| |EXPR;sec;2$;51|) $))
          (QSETREFV $ 183 (CONS (|dispatchFunction| |EXPR;csc;2$;52|) $))
          (QSETREFV $ 185 (CONS (|dispatchFunction| |EXPR;asin;2$;53|) $))
          (QSETREFV $ 187 (CONS (|dispatchFunction| |EXPR;acos;2$;54|) $))
          (QSETREFV $ 189 (CONS (|dispatchFunction| |EXPR;atan;2$;55|) $))
          (QSETREFV $ 191 (CONS (|dispatchFunction| |EXPR;acot;2$;56|) $))
          (QSETREFV $ 193 (CONS (|dispatchFunction| |EXPR;asec;2$;57|) $))
          (QSETREFV $ 195 (CONS (|dispatchFunction| |EXPR;acsc;2$;58|) $))
          (QSETREFV $ 197 (CONS (|dispatchFunction| |EXPR;sinh;2$;59|) $))
          (QSETREFV $ 199 (CONS (|dispatchFunction| |EXPR;cosh;2$;60|) $))
          (QSETREFV $ 201 (CONS (|dispatchFunction| |EXPR;tanh;2$;61|) $))
          (QSETREFV $ 203 (CONS (|dispatchFunction| |EXPR;coth;2$;62|) $))
          (QSETREFV $ 205 (CONS (|dispatchFunction| |EXPR;sech;2$;63|) $))
          (QSETREFV $ 207 (CONS (|dispatchFunction| |EXPR;csch;2$;64|) $))
          (QSETREFV $ 209 (CONS (|dispatchFunction| |EXPR;asinh;2$;65|) $))
          (QSETREFV $ 211 (CONS (|dispatchFunction| |EXPR;acosh;2$;66|) $))
          (QSETREFV $ 213 (CONS (|dispatchFunction| |EXPR;atanh;2$;67|) $))
          (QSETREFV $ 215 (CONS (|dispatchFunction| |EXPR;acoth;2$;68|) $))
          (QSETREFV $ 217 (CONS (|dispatchFunction| |EXPR;asech;2$;69|) $))
          (QSETREFV $ 219 (CONS (|dispatchFunction| |EXPR;acsch;2$;70|) $))
          (QSETREFV $ 222 (CONS (|dispatchFunction| |EXPR;abs;2$;71|) $))
          (QSETREFV $ 224 (CONS (|dispatchFunction| |EXPR;conjugate;2$;72|) $))
          (QSETREFV $ 226 (CONS (|dispatchFunction| |EXPR;Gamma;2$;73|) $))
          (QSETREFV $ 228 (CONS (|dispatchFunction| |EXPR;Gamma;3$;74|) $))
          (QSETREFV $ 230 (CONS (|dispatchFunction| |EXPR;Beta;3$;75|) $))
          (QSETREFV $ 232 (CONS (|dispatchFunction| |EXPR;digamma;2$;76|) $))
          (QSETREFV $ 234 (CONS (|dispatchFunction| |EXPR;polygamma;3$;77|) $))
          (QSETREFV $ 236 (CONS (|dispatchFunction| |EXPR;besselJ;3$;78|) $))
          (QSETREFV $ 238 (CONS (|dispatchFunction| |EXPR;besselY;3$;79|) $))
          (QSETREFV $ 240 (CONS (|dispatchFunction| |EXPR;besselI;3$;80|) $))
          (QSETREFV $ 242 (CONS (|dispatchFunction| |EXPR;besselK;3$;81|) $))
          (QSETREFV $ 244 (CONS (|dispatchFunction| |EXPR;airyAi;2$;82|) $))
          (QSETREFV $ 246
                    (CONS (|dispatchFunction| |EXPR;airyAiPrime;2$;83|) $))
          (QSETREFV $ 248 (CONS (|dispatchFunction| |EXPR;airyBi;2$;84|) $))
          (QSETREFV $ 250
                    (CONS (|dispatchFunction| |EXPR;airyBiPrime;2$;85|) $))
          (QSETREFV $ 252 (CONS (|dispatchFunction| |EXPR;lambertW;2$;86|) $))
          (QSETREFV $ 254 (CONS (|dispatchFunction| |EXPR;polylog;3$;87|) $))
          (QSETREFV $ 256
                    (CONS (|dispatchFunction| |EXPR;weierstrassP;4$;88|) $))
          (QSETREFV $ 258
                    (CONS (|dispatchFunction| |EXPR;weierstrassPPrime;4$;89|)
                          $))
          (QSETREFV $ 260
                    (CONS (|dispatchFunction| |EXPR;weierstrassSigma;4$;90|)
                          $))
          (QSETREFV $ 262
                    (CONS (|dispatchFunction| |EXPR;weierstrassZeta;4$;91|) $))
          (QSETREFV $ 264
                    (CONS (|dispatchFunction| |EXPR;weierstrassPInverse;4$;92|)
                          $))
          (QSETREFV $ 266
                    (CONS (|dispatchFunction| |EXPR;whittakerM;4$;93|) $))
          (QSETREFV $ 268
                    (CONS (|dispatchFunction| |EXPR;whittakerW;4$;94|) $))
          (QSETREFV $ 270 (CONS (|dispatchFunction| |EXPR;angerJ;3$;95|) $))
          (QSETREFV $ 272 (CONS (|dispatchFunction| |EXPR;weberE;3$;96|) $))
          (QSETREFV $ 274 (CONS (|dispatchFunction| |EXPR;struveH;3$;97|) $))
          (QSETREFV $ 276 (CONS (|dispatchFunction| |EXPR;struveL;3$;98|) $))
          (QSETREFV $ 278 (CONS (|dispatchFunction| |EXPR;hankelH1;3$;99|) $))
          (QSETREFV $ 280 (CONS (|dispatchFunction| |EXPR;hankelH2;3$;100|) $))
          (QSETREFV $ 282 (CONS (|dispatchFunction| |EXPR;lommelS1;4$;101|) $))
          (QSETREFV $ 284 (CONS (|dispatchFunction| |EXPR;lommelS2;4$;102|) $))
          (QSETREFV $ 286 (CONS (|dispatchFunction| |EXPR;kummerM;4$;103|) $))
          (QSETREFV $ 288 (CONS (|dispatchFunction| |EXPR;kummerU;4$;104|) $))
          (QSETREFV $ 290
                    (CONS (|dispatchFunction| |EXPR;legendreP;4$;105|) $))
          (QSETREFV $ 292
                    (CONS (|dispatchFunction| |EXPR;legendreQ;4$;106|) $))
          (QSETREFV $ 294
                    (CONS (|dispatchFunction| |EXPR;kelvinBei;3$;107|) $))
          (QSETREFV $ 296
                    (CONS (|dispatchFunction| |EXPR;kelvinBer;3$;108|) $))
          (QSETREFV $ 298
                    (CONS (|dispatchFunction| |EXPR;kelvinKei;3$;109|) $))
          (QSETREFV $ 300
                    (CONS (|dispatchFunction| |EXPR;kelvinKer;3$;110|) $))
          (QSETREFV $ 302
                    (CONS (|dispatchFunction| |EXPR;ellipticK;2$;111|) $))
          (QSETREFV $ 304
                    (CONS (|dispatchFunction| |EXPR;ellipticE;2$;112|) $))
          (QSETREFV $ 306
                    (CONS (|dispatchFunction| |EXPR;ellipticE;3$;113|) $))
          (QSETREFV $ 308
                    (CONS (|dispatchFunction| |EXPR;ellipticF;3$;114|) $))
          (QSETREFV $ 310
                    (CONS (|dispatchFunction| |EXPR;ellipticPi;4$;115|) $))
          (QSETREFV $ 312 (CONS (|dispatchFunction| |EXPR;jacobiSn;3$;116|) $))
          (QSETREFV $ 314 (CONS (|dispatchFunction| |EXPR;jacobiCn;3$;117|) $))
          (QSETREFV $ 316 (CONS (|dispatchFunction| |EXPR;jacobiDn;3$;118|) $))
          (QSETREFV $ 318
                    (CONS (|dispatchFunction| |EXPR;jacobiZeta;3$;119|) $))
          (QSETREFV $ 320
                    (CONS (|dispatchFunction| |EXPR;jacobiTheta;3$;120|) $))
          (QSETREFV $ 322 (CONS (|dispatchFunction| |EXPR;lerchPhi;4$;121|) $))
          (QSETREFV $ 324
                    (CONS (|dispatchFunction| |EXPR;riemannZeta;2$;122|) $))
          (QSETREFV $ 326
                    (CONS (|dispatchFunction| |EXPR;charlierC;4$;123|) $))
          (QSETREFV $ 328 (CONS (|dispatchFunction| |EXPR;hermiteH;3$;124|) $))
          (QSETREFV $ 330 (CONS (|dispatchFunction| |EXPR;jacobiP;5$;125|) $))
          (QSETREFV $ 332
                    (CONS (|dispatchFunction| |EXPR;laguerreL;4$;126|) $))
          (QSETREFV $ 334 (CONS (|dispatchFunction| |EXPR;meixnerM;5$;127|) $))
          (COND
           ((|testBitVector| |pv$| 32)
            (PROGN
             (QSETREFV $ 337
                       (CONS
                        (|dispatchFunction| |EXPR;hypergeometricF;2L2$;128|)
                        (|getDomainView| $ '(|RetractableTo| (|Integer|)))))
             (QSETREFV $ 339
                       (CONS (|dispatchFunction| |EXPR;meijerG;4L2$;129|)
                             (|getDomainView| $
                                              '(|RetractableTo|
                                                (|Integer|))))))))
          (QSETREFV $ 84 (CONS (|dispatchFunction| |EXPR;^;3$;130|) $))
          (QSETREFV $ 343
                    (CONS (|dispatchFunction| |EXPR;factorial;2$;131|) $))
          (QSETREFV $ 345 (CONS (|dispatchFunction| |EXPR;binomial;3$;132|) $))
          (QSETREFV $ 347
                    (CONS (|dispatchFunction| |EXPR;permutation;3$;133|) $))
          (QSETREFV $ 349
                    (CONS (|dispatchFunction| |EXPR;factorials;2$;134|) $))
          (QSETREFV $ 351
                    (CONS (|dispatchFunction| |EXPR;factorials;$S$;135|) $))
          (QSETREFV $ 353
                    (CONS (|dispatchFunction| |EXPR;summation;$S$;136|) $))
          (QSETREFV $ 357
                    (CONS (|dispatchFunction| |EXPR;summation;$Sb$;137|) $))
          (QSETREFV $ 359 (CONS (|dispatchFunction| |EXPR;product;$S$;138|) $))
          (QSETREFV $ 361
                    (CONS (|dispatchFunction| |EXPR;product;$Sb$;139|) $))
          (QSETREFV $ 364 (CONS (|dispatchFunction| |EXPR;erf;2$;140|) $))
          (QSETREFV $ 366 (CONS (|dispatchFunction| |EXPR;erfi;2$;141|) $))
          (QSETREFV $ 368 (CONS (|dispatchFunction| |EXPR;Ei;2$;142|) $))
          (QSETREFV $ 370 (CONS (|dispatchFunction| |EXPR;Si;2$;143|) $))
          (QSETREFV $ 372 (CONS (|dispatchFunction| |EXPR;Ci;2$;144|) $))
          (QSETREFV $ 374 (CONS (|dispatchFunction| |EXPR;Shi;2$;145|) $))
          (QSETREFV $ 376 (CONS (|dispatchFunction| |EXPR;Chi;2$;146|) $))
          (QSETREFV $ 378 (CONS (|dispatchFunction| |EXPR;li;2$;147|) $))
          (QSETREFV $ 380 (CONS (|dispatchFunction| |EXPR;dilog;2$;148|) $))
          (QSETREFV $ 382 (CONS (|dispatchFunction| |EXPR;fresnelS;2$;149|) $))
          (QSETREFV $ 384 (CONS (|dispatchFunction| |EXPR;fresnelC;2$;150|) $))
          (QSETREFV $ 386
                    (CONS (|dispatchFunction| |EXPR;integral;$S$;151|) $))
          (QSETREFV $ 388
                    (CONS (|dispatchFunction| |EXPR;integral;$Sb$;152|) $))
          (QSETREFV $ 37 (CONS (|dispatchFunction| |EXPR;operator;2Bo;153|) $))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (PROGN
             (COND
              ((|domainEqual| |#1| (|Integer|))
               (PROGN
                (QSETREFV $ 439
                          (|Record| (|:| |svz| (|List| (|Symbol|)))
                                    (|:| |sm|
                                         (|List| (|Polynomial| (|Integer|))))
                                    (|:| |msizes| (|List| (|Integer|)))
                                    (|:| |sp| (|Integer|))))
                (QSETREFV $ 440 (|ModularAlgebraicGcdTools3|))
                (QSETREFV $ 441
                          (|ModularAlgebraicGcd|
                           (|SparseUnivariatePolynomial|
                            (|Polynomial| (|Integer|)))
                           (QREFELT $ 439) (QREFELT $ 440)))
                (QSETREFV $ 450 (|ModularEvaluation2|))
                (QSETREFV $ 451 (|ModularAlgebraicGcdTools4|))
                (QSETREFV $ 452
                          (|ModularAlgebraicGcd2|
                           (|Record| (|:| |var| (|Symbol|))
                                     (|:| |coef|
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|Polynomial| (|Integer|))))))
                           (|FakePolynomial|)
                           (|SparseUnivariatePolynomial|
                            (|Polynomial| (|Integer|)))
                           (QREFELT $ 439) (QREFELT $ 450) (QREFELT $ 451)))
                (QSETREFV $ 477
                          (CONS
                           (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;172|)
                           $))))
              ('T
               (QSETREFV $ 477
                         (CONS
                          (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;173|)
                          $))))
             (COND
              ((|testBitVector| |pv$| 26)
               (QSETREFV $ 484
                         (CONS
                          (|dispatchFunction| |EXPR;factorPolynomial;SupF;174|)
                          $)))))))
          (COND
           ((|domainEqual| |#1| (|AlgebraicNumber|))
            (QSETREFV $ 489
                      (CONS (|dispatchFunction| |EXPR;coerce;An$;175|) $))))
          (COND
           ((|testBitVector| |pv$| 15)
            (PROGN
             (QSETREFV $ 492 (CONS (|dispatchFunction| |EXPR;^;$F$;176|) $))
             (QSETREFV $ 133
                       (CONS (|dispatchFunction| |EXPR;minPoly;KSup;177|) $))
             (QSETREFV $ 495
                       (CONS
                        (|dispatchFunction| |EXPR;definingPolynomial;2$;178|)
                        $))
             (QSETREFV $ 497
                       (CONS (|dispatchFunction| |EXPR;retract;$F;179|) $))
             (QSETREFV $ 72
                       (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;180|)
                             $))
             (COND ((|domainEqual| |#1| (|AlgebraicNumber|)))
                   ('T
                    (PROGN
                     (QSETREFV $ 489
                               (CONS (|dispatchFunction| |EXPR;coerce;An$;181|)
                                     $))
                     (QSETREFV $ 513
                               (CONS
                                (|dispatchFunction| |EXPR;retractIfCan;$U;184|)
                                $))))))))
          (COND
           ((|testBitVector| |pv$| 10)
            (PROGN
             (QSETREFV $ 541
                       (CONS (|dispatchFunction| |EXPR;convert;$If;188|) $))
             (QSETREFV $ 544
                       (CONS (|dispatchFunction| |EXPR;eval;$Bo$S$;189|) $))
             (QSETREFV $ 543
                       (CONS (|dispatchFunction| |EXPR;eval;$LLS$;190|) $)))))
          (COND
           ((|testBitVector| |pv$| 14)
            (QSETREFV $ 566
                      (CONS (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;191|)
                            $))))
          (COND
           ((|testBitVector| |pv$| 13)
            (QSETREFV $ 572
                      (CONS (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;192|)
                            $))))))
        ('T
         (PROGN
          (SETELT $ 45 (|SparseMultivariatePolynomial| |#1| (|Kernel| $)))
          (QSETREFV $ 47
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;Zero;$;193|) $ 47)))
          (QSETREFV $ 49
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;One;$;194|) $ 49)))
          (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;195|) $))
          (QSETREFV $ 59 (CONS (|dispatchFunction| |EXPR;*;I2$;196|) $))
          (QSETREFV $ 63 (CONS (|dispatchFunction| |EXPR;*;3$;197|) $))
          (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;198|) $))
          (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;199|) $))
          (QSETREFV $ 95 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;200|) $))
          (QSETREFV $ 99 (CONS (|dispatchFunction| |EXPR;numer;$Smp;201|) $))
          (QSETREFV $ 104 (CONS (|dispatchFunction| |EXPR;coerce;Smp$;202|) $))
          (QSETREFV $ 106 (CONS (|dispatchFunction| |EXPR;coerce;P$;203|) $))
          (QSETREFV $ 149
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;204|) $))
          (QSETREFV $ 157
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;205|) $))
          (COND
           ((|testBitVector| |pv$| 10)
            (QSETREFV $ 541
                      (CONS (|dispatchFunction| |EXPR;convert;$If;206|) $))))
          (COND
           ((|testBitVector| |pv$| 14)
            (PROGN
             (QSETREFV $ 566
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;208|)
                        $)))))
          (COND
           ((|testBitVector| |pv$| 13)
            (PROGN
             (QSETREFV $ 572
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;210|)
                        $))))))))))
     ((|HasCategory| |#1| '(|AbelianMonoid|))
      (PROGN
       (SETELT $ 45 (|FreeModule| (|Integer|) (|Kernel| $)))
       (QSETREFV $ 47
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |EXPR;Zero;$;211|) $ 47)))
       (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;212|) $))
       (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;213|) $))
       (QSETREFV $ 95 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;214|) $))
       (QSETREFV $ 137 (CONS (|dispatchFunction| |EXPR;coerce;K$;215|) $))
       (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;216|) $))
       (QSETREFV $ 514 (CONS (|dispatchFunction| |EXPR;coerce;R$;217|) $))
       (QSETREFV $ 424 (CONS (|dispatchFunction| |EXPR;retract;$R;218|) $))
       (QSETREFV $ 595 (CONS (|dispatchFunction| |EXPR;coerce;$Of;219|) $))
       (QSETREFV $ 605 (CONS (|dispatchFunction| |EXPR;isPlus;$U;222|) $))
       (QSETREFV $ 609 (CONS (|dispatchFunction| |EXPR;isMult;$U;223|) $))
       (QSETREFV $ 596 (CONS (|dispatchFunction| |EXPR;eval;$LL$;224|) $))
       (QSETREFV $ 601 (CONS (|dispatchFunction| |EXPR;subst;$LL$;225|) $))
       (QSETREFV $ 610
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;226|) $))
       (COND
        ((|testBitVector| |pv$| 16)
         (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;227|) $))))))
     ('T
      (PROGN
       (SETELT $ 45 (|Kernel| $))
       (QSETREFV $ 95 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;228|) $))
       (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;229|) $))
       (QSETREFV $ 137 (CONS (|dispatchFunction| |EXPR;coerce;K$;230|) $))
       (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;231|) $))
       (QSETREFV $ 514 (CONS (|dispatchFunction| |EXPR;coerce;R$;232|) $))
       (QSETREFV $ 424 (CONS (|dispatchFunction| |EXPR;retract;$R;233|) $))
       (QSETREFV $ 610
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;234|) $))
       (QSETREFV $ 595 (CONS (|dispatchFunction| |EXPR;coerce;$Of;235|) $))
       (QSETREFV $ 596 (CONS (|dispatchFunction| |EXPR;eval;$LL$;236|) $))
       (QSETREFV $ 601 (CONS (|dispatchFunction| |EXPR;subst;$LL$;237|) $))
       (COND
        ((|testBitVector| |pv$| 10)
         (QSETREFV $ 541
                   (CONS (|dispatchFunction| |EXPR;convert;$If;238|) $)))))))
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
              (|Union| 490 '#1#) (220 . |retractIfCan|) (225 . |number?|)
              (|List| 12) (230 . |kernels|) (235 . |is?|) (241 . |first|)
              (|List| $$) (246 . |argument|) (251 . |#|) (256 . |elt|)
              (262 . ^) (268 . |algtower|) (273 . ^) (279 . |first|)
              (284 . |second|) (289 . |Zero|) (293 . |numerator|)
              (298 . |denominator|) (303 . ^) (309 . ^) (|PositiveInteger|)
              (315 . ^) (321 . |smaller?|) (327 . |smaller?|) (333 . =)
              (339 . |numer|) (|SparseMultivariatePolynomial| 6 12)
              (344 . |numer|) (349 . |denom|) (354 . |denom|) 'EREP
              (359 . |One|) (363 . |coerce|) (|Polynomial| 6) (368 . |coerce|)
              (|Fraction| 105) (373 . |numer|) (378 . |denom|) (383 . |coerce|)
              (388 . |reduce|) (|Mapping| 9 15) (393 . |select!|)
              (|AlgebraicManipulations| 6 $$) (399 . |ratDenom|) (405 . |is?|)
              (411 . ~=) (417 . >) (|SparseUnivariatePolynomial| $)
              (423 . |univariate|) (|SparseUnivariatePolynomial| 41)
              (429 . |leadingCoefficient|) (434 . |reductum|) (439 . *)
              (445 . |monomial|) (452 . -) (458 . /)
              (464 . |getSimplifyDenomsFlag|) (468 . |setSimplifyDenomsFlag|)
              (473 . |elt|) (|SingletonAsOrderedSet|) (479 . |create|)
              (483 . |minPoly|) (|SparseUnivariatePolynomial| $$)
              (|PolynomialCategoryQuotientFunctions| 485 15 6 41 $$)
              (488 . |univariate|) (495 . |coerce|) (500 . |eval|)
              (507 . |retract|) (512 . /) (|Mapping| $$ $$) (|Matrix| $$)
              (518 . |map|) (|Matrix| 41) (|Matrix| $) (524 . |reducedSystem|)
              (|Matrix| 6) (529 . |reducedSystem|) (534 . |reducedSystem|)
              (|Vector| $$) (539 . |map|)
              (|Record| (|:| |mat| 144) (|:| |vec| (|Vector| 41))) (|Vector| $)
              (545 . |reducedSystem|)
              (|Record| (|:| |mat| 147) (|:| |vec| (|Vector| 6)))
              (551 . |reducedSystem|) (557 . |reducedSystem|) (563 . |member?|)
              (569 . |concat|) (|AlgebraicFunction| 6 $$) (575 . |rootOf|)
              (581 . |rootOf|) (587 . |rootSum|) (594 . |rootSum|)
              (|ElementaryFunction| 6 $$) (601 . |pi|) (605 . |pi|)
              (609 . |exp|) (614 . |exp|) (619 . |log|) (624 . |log|)
              (629 . |sin|) (634 . |sin|) (639 . |cos|) (644 . |cos|)
              (649 . |tan|) (654 . |tan|) (659 . |cot|) (664 . |cot|)
              (669 . |sec|) (674 . |sec|) (679 . |csc|) (684 . |csc|)
              (689 . |asin|) (694 . |asin|) (699 . |acos|) (704 . |acos|)
              (709 . |atan|) (714 . |atan|) (719 . |acot|) (724 . |acot|)
              (729 . |asec|) (734 . |asec|) (739 . |acsc|) (744 . |acsc|)
              (749 . |sinh|) (754 . |sinh|) (759 . |cosh|) (764 . |cosh|)
              (769 . |tanh|) (774 . |tanh|) (779 . |coth|) (784 . |coth|)
              (789 . |sech|) (794 . |sech|) (799 . |csch|) (804 . |csch|)
              (809 . |asinh|) (814 . |asinh|) (819 . |acosh|) (824 . |acosh|)
              (829 . |atanh|) (834 . |atanh|) (839 . |acoth|) (844 . |acoth|)
              (849 . |asech|) (854 . |asech|) (859 . |acsch|) (864 . |acsch|)
              (|FunctionalSpecialFunction| 6 $$) (869 . |abs|) (874 . |abs|)
              (879 . |conjugate|) (884 . |conjugate|) (889 . |Gamma|)
              (894 . |Gamma|) (899 . |Gamma|) (905 . |Gamma|) (911 . |Beta|)
              (917 . |Beta|) (923 . |digamma|) (928 . |digamma|)
              (933 . |polygamma|) (939 . |polygamma|) (945 . |besselJ|)
              (951 . |besselJ|) (957 . |besselY|) (963 . |besselY|)
              (969 . |besselI|) (975 . |besselI|) (981 . |besselK|)
              (987 . |besselK|) (993 . |airyAi|) (998 . |airyAi|)
              (1003 . |airyAiPrime|) (1008 . |airyAiPrime|) (1013 . |airyBi|)
              (1018 . |airyBi|) (1023 . |airyBiPrime|) (1028 . |airyBiPrime|)
              (1033 . |lambertW|) (1038 . |lambertW|) (1043 . |polylog|)
              (1049 . |polylog|) (1055 . |weierstrassP|)
              (1062 . |weierstrassP|) (1069 . |weierstrassPPrime|)
              (1076 . |weierstrassPPrime|) (1083 . |weierstrassSigma|)
              (1090 . |weierstrassSigma|) (1097 . |weierstrassZeta|)
              (1104 . |weierstrassZeta|) (1111 . |weierstrassPInverse|)
              (1118 . |weierstrassPInverse|) (1125 . |whittakerM|)
              (1132 . |whittakerM|) (1139 . |whittakerW|) (1146 . |whittakerW|)
              (1153 . |angerJ|) (1159 . |angerJ|) (1165 . |weberE|)
              (1171 . |weberE|) (1177 . |struveH|) (1183 . |struveH|)
              (1189 . |struveL|) (1195 . |struveL|) (1201 . |hankelH1|)
              (1207 . |hankelH1|) (1213 . |hankelH2|) (1219 . |hankelH2|)
              (1225 . |lommelS1|) (1232 . |lommelS1|) (1239 . |lommelS2|)
              (1246 . |lommelS2|) (1253 . |kummerM|) (1260 . |kummerM|)
              (1267 . |kummerU|) (1274 . |kummerU|) (1281 . |legendreP|)
              (1288 . |legendreP|) (1295 . |legendreQ|) (1302 . |legendreQ|)
              (1309 . |kelvinBei|) (1315 . |kelvinBei|) (1321 . |kelvinBer|)
              (1327 . |kelvinBer|) (1333 . |kelvinKei|) (1339 . |kelvinKei|)
              (1345 . |kelvinKer|) (1351 . |kelvinKer|) (1357 . |ellipticK|)
              (1362 . |ellipticK|) (1367 . |ellipticE|) (1372 . |ellipticE|)
              (1377 . |ellipticE|) (1383 . |ellipticE|) (1389 . |ellipticF|)
              (1395 . |ellipticF|) (1401 . |ellipticPi|) (1408 . |ellipticPi|)
              (1415 . |jacobiSn|) (1421 . |jacobiSn|) (1427 . |jacobiCn|)
              (1433 . |jacobiCn|) (1439 . |jacobiDn|) (1445 . |jacobiDn|)
              (1451 . |jacobiZeta|) (1457 . |jacobiZeta|)
              (1463 . |jacobiTheta|) (1469 . |jacobiTheta|) (1475 . |lerchPhi|)
              (1482 . |lerchPhi|) (1489 . |riemannZeta|) (1494 . |riemannZeta|)
              (1499 . |charlierC|) (1506 . |charlierC|) (1513 . |hermiteH|)
              (1519 . |hermiteH|) (1525 . |jacobiP|) (1533 . |jacobiP|)
              (1541 . |laguerreL|) (1548 . |laguerreL|) (1555 . |meixnerM|)
              (1563 . |meixnerM|) (1571 . |hypergeometricF|) (|List| $)
              (1578 . |hypergeometricF|) (1585 . |meijerG|) (1594 . |meijerG|)
              (|CombinatorialFunction| 6 $$) (1603 . ^) (1609 . |factorial|)
              (1614 . |factorial|) (1619 . |binomial|) (1625 . |binomial|)
              (1631 . |permutation|) (1637 . |permutation|)
              (1643 . |factorials|) (1648 . |factorials|) (1653 . |factorials|)
              (1659 . |factorials|) (1665 . |summation|) (1671 . |summation|)
              (|SegmentBinding| $$) (1677 . |summation|) (|SegmentBinding| $)
              (1683 . |summation|) (1689 . |product|) (1695 . |product|)
              (1701 . |product|) (1707 . |product|)
              (|LiouvillianFunction| 6 $$) (1713 . |erf|) (1718 . |erf|)
              (1723 . |erfi|) (1728 . |erfi|) (1733 . |Ei|) (1738 . |Ei|)
              (1743 . |Si|) (1748 . |Si|) (1753 . |Ci|) (1758 . |Ci|)
              (1763 . |Shi|) (1768 . |Shi|) (1773 . |Chi|) (1778 . |Chi|)
              (1783 . |li|) (1788 . |li|) (1793 . |dilog|) (1798 . |dilog|)
              (1803 . |fresnelS|) (1808 . |fresnelS|) (1813 . |fresnelC|)
              (1818 . |fresnelC|) (1823 . |integral|) (1829 . |integral|)
              (1835 . |integral|) (1841 . |integral|) (1847 . |belong?|)
              (1852 . |operator|) (1857 . |belong?|) (1862 . |operator|)
              (1867 . |belong?|) (1872 . |operator|) (1877 . |belong?|)
              (1882 . |operator|) (1887 . |belong?|) (1892 . |operator|)
              (|Fraction| 41) (1897 . |coerce|) (|Fraction| 404)
              (|PolynomialCategoryQuotientFunctions| 485 15 6 41 399)
              (1902 . |univariate|) (|SparseUnivariatePolynomial| 399)
              (1908 . |numer|) (1913 . |degree|) (1919 . |degree|)
              (1924 . |rem|) (1930 . |coerce|) (1935 . |elt|) (1941 . |Zero|)
              (1945 . ~=) (1951 . |leadingCoefficient|) (1956 . |reductum|)
              (1961 . |concat|) (1967 . |removeDuplicates|) (1972 . =)
              (1978 . |coefficients|) (|Mapping| 9 $$) (1983 . |every?|)
              (|Mapping| 41 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 134 41 121)
              (1989 . |map|) (1995 . |retract|) (2000 . |monomial|)
              (2006 . |coerce|) (2011 . -) (2017 . =) (|Polynomial| 57)
              (2023 . |One|) (2027 . |One|) (2031 . |monomial|)
              (2038 . |coerce|) (|Mapping| 429 15) (|Mapping| 429 57)
              (|PolynomialCategoryLifting| 485 15 57 41 429) (2043 . |map|)
              (2050 . |multivariate|) 'MD 'MOP1 'MGCD1 (2056 . |coerce|)
              (|Mapping| 41 27) (|Mapping| 41 57)
              (|PolynomialCategoryLifting| (|IndexedExponents| 27) 27 57 429
                                           41)
              (2061 . |map|) (|Mapping| $$ 41)
              (|UnivariatePolynomialCategoryFunctions2| 41 121 $$ 134)
              (2068 . |map|) 'MEV2 'MOP2 'MGCD2 (|Fraction| 429) (2074 . /)
              (2080 . |coerce|) (|SparseUnivariatePolynomial| 453)
              (2085 . |coerce|) (|Mapping| 453 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 134 453 456)
              (2090 . |map|) (2096 . =) (2102 . |One|) (2106 . |gcdPolynomial|)
              (2112 . |concat|) (2118 . |algtower|) (2123 . |kernels|)
              (2128 . |setUnion|) (2134 . |sort|) (2139 . |new|)
              (2143 . |cons|) (2149 . |setDifference|) (|List| 429)
              (2155 . |algebraicGcd|)
              (|Record| (|:| |var| 27) (|:| |coef| 456)) (|List| 474)
              (2165 . |algebraicGcd|) (2175 . |gcdPolynomial|)
              (|GcdDomain&| $$) (2181 . |gcdPolynomial|) (|Factored| 134)
              (|ExpressionFactorPolynomial| 6 $$) (2187 . |factorPolynomial|)
              (|Factored| 119) (2192 . |factorPolynomial|)
              (|IndexedExponents| 15) (2197 . |Zero|) (2201 . |monomial|)
              (|AlgebraicNumber|) (2207 . |coerce|) (|Fraction| 57) (2212 . ^)
              (2218 . ^) (2224 . |minPoly|) (2229 . |definingPolynomial|)
              (2234 . |definingPolynomial|) (2239 . |retract|)
              (2244 . |retract|) (2249 . |retractIfCan|)
              (|SparseMultivariatePolynomial| 57 12) (2254 . |numer|)
              (2259 . |denom|) (|Mapping| $$ 488) (|Kernel| 488)
              (|ExpressionSpaceFunctions2| 488 $$) (2264 . |map|)
              (|Mapping| $$ 503) (|Mapping| $$ 57)
              (|SparseMultivariatePolynomial| 57 503)
              (|PolynomialCategoryLifting| (|IndexedExponents| 503) 503 57 508
                                           $$)
              (2270 . |map|) (2277 . /) (|Union| 488 '"failed")
              (2283 . |retractIfCan|) (2288 . |coerce|) (2293 . |coerce|)
              (2298 . |belong?|) (2303 . |is?|) (|Union| 27 '#1#)
              (2309 . |retractIfCan|) (2314 . ~=)
              (|SparseUnivariatePolynomial| 488) (2320 . |Zero|)
              (2324 . |Zero|) (2328 . ~=) (2334 . |degree|) (2339 . |monomial|)
              (2345 . +) (2351 . |rootOf|) (2357 . |operator|) (2362 . |elt|)
              (|Union| 15 '"failed") (2368 . |mainVariable|)
              (2373 . |leadingCoefficient|) (2378 . |Zero|) (2382 . |ground?|)
              (2387 . ^) (2393 . *) (2399 . +) (|InputForm|) (2405 . |convert|)
              (2410 . |convert|) (|List| 10) (2415 . |eval|) (2423 . |eval|)
              (2431 . |variables|) (2436 . |concat|)
              (2441 . |removeDuplicates|) (2446 . |scripted?|) (|Mapping| 9 27)
              (2451 . |select|) (|MakeUnaryCompiledFunction| $$ $$ $$)
              (2457 . |compiledFunction|) (|Mapping| $ $) (|List| 553)
              (2463 . |eval|) (2470 . |coerce|) (|Equation| $$) (2475 . =)
              (|List| 640) (2481 . |subst|) (|PatternMatchResult| 57 $$)
              (|Pattern| 57) (|PatternMatchFunctionSpace| 57 6 $$)
              (2487 . |patternMatch|) (|PatternMatchResult| 57 $)
              (2494 . |patternMatch|) (|PatternMatchResult| (|Float|) $$)
              (|Pattern| (|Float|))
              (|PatternMatchFunctionSpace| (|Float|) 6 $$)
              (2501 . |patternMatch|) (|PatternMatchResult| (|Float|) $)
              (2508 . |patternMatch|) (2515 . |reducedSystem|)
              (2520 . |reducedSystem|) (|PatternMatchKernel| 57 $$)
              (2526 . |patternMatch|) (|PatternMatchResult| 57 45)
              (|Mapping| 577 15 562 577)
              (|PatternMatchPolynomialCategory| 57 485 15 6 45)
              (2533 . |patternMatch|) (|PatternMatchKernel| (|Float|) $$)
              (2541 . |patternMatch|) (|PatternMatchResult| (|Float|) 45)
              (|Mapping| 583 15 568 583)
              (|PatternMatchPolynomialCategory| (|Float|) 485 15 6 45)
              (2548 . |patternMatch|) (2556 . |coerce|)
              (|Record| (|:| |k| 15) (|:| |c| 57)) (|List| 588)
              (2561 . |listOfTerms|) (2566 . |zero?|) (2571 . |constantKernel|)
              (|OutputForm|) (2576 . |coerce|) (2581 . |coerce|)
              (2586 . |eval|) (2593 . |map|) (|Mapping| $$ 15)
              (|ListToMap| 15 $$) (2599 . |match|) (2607 . |subst|)
              (2614 . |kernel|) (2620 . *) (|Union| 336 '#2="failed")
              (2626 . |isPlus|) (2631 . |first|)
              (|Record| (|:| |coef| 57) (|:| |var| 12)) (|Union| 607 '#2#)
              (2636 . |isMult|) (2641 . |retractIfCan|)
              (|Union| 153 '#3="failed") (|Union| 613 '#3#) (|List| 119)
              (|Record| (|:| |mat| 615) (|:| |vec| (|Vector| 57)))
              (|Matrix| 57) (|Union| $ '"failed") (|Factored| $) (|Fraction| 6)
              (|Polynomial| 618) (|Fraction| 119) (|Fraction| 619)
              (|Union| 107 '#1#) (|Polynomial| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |coef| 336) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 629 '"failed") (|Union| 57 '#1#)
              (|Record| (|:| |var| 12) (|:| |exponent| 57)) (|Union| 632 '#2#)
              (|Record| (|:| |val| $) (|:| |exponent| 57)) (|Union| 634 '#2#)
              (|List| 35) (|Mapping| $ 336) (|List| 637) (|Union| 105 '#1#)
              (|Equation| $) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 2646 |zerosOf| 2652 |zeroOf| 2679 |zero?| 2706 |whittakerW|
              2711 |whittakerM| 2718 |weierstrassZeta| 2725 |weierstrassSigma|
              2732 |weierstrassPPrime| 2739 |weierstrassPInverse| 2746
              |weierstrassP| 2753 |weberE| 2760 |variables| 2766 |univariate|
              2776 |unitNormal| 2782 |unitCanonical| 2787 |unit?| 2792 |tower|
              2797 |tanh| 2807 |tan| 2812 |summation| 2817 |subtractIfCan| 2829
              |subst| 2835 |struveL| 2854 |struveH| 2860 |squareFreePolynomial|
              2866 |squareFreePart| 2871 |squareFree| 2876 |sqrt| 2881
              |solveLinearPolynomialEquation| 2886 |smaller?| 2892 |sizeLess?|
              2898 |sinh| 2904 |sin| 2909 |setSimplifyDenomsFlag| 2914 |sech|
              2919 |sec| 2924 |sample| 2929 |rootsOf| 2933 |rootSum| 2960
              |rootOf| 2967 |rightRecip| 2994 |rightPower| 2999 |riemannZeta|
              3011 |retractIfCan| 3016 |retract| 3056 |rem| 3096
              |reducedSystem| 3102 |reduce| 3124 |recip| 3129 |quo| 3134
              |product| 3140 |principalIdeal| 3152 |prime?| 3157 |polylog| 3162
              |polygamma| 3168 |pi| 3174 |permutation| 3178 |patternMatch| 3184
              |paren| 3198 |opposite?| 3203 |operators| 3209 |operator| 3214
              |one?| 3219 |odd?| 3224 |numerator| 3229 |numer| 3234 |number?|
              3239 |nthRoot| 3244 |multiEuclidean| 3250 |minPoly| 3256
              |meixnerM| 3261 |meijerG| 3269 |map| 3278 |mainKernel| 3284
              |lommelS2| 3289 |lommelS1| 3296 |log| 3303 |li| 3308 |lerchPhi|
              3313 |legendreQ| 3320 |legendreP| 3327 |leftRecip| 3334
              |leftPower| 3339 |lcmCoef| 3351 |lcm| 3357 |latex| 3368
              |lambertW| 3373 |laguerreL| 3378 |kummerU| 3385 |kummerM| 3392
              |kernels| 3399 |kernel| 3409 |kelvinKer| 3421 |kelvinKei| 3427
              |kelvinBer| 3433 |kelvinBei| 3439 |jacobiZeta| 3445 |jacobiTheta|
              3451 |jacobiSn| 3457 |jacobiP| 3463 |jacobiDn| 3471 |jacobiCn|
              3477 |isTimes| 3483 |isPower| 3488 |isPlus| 3493 |isMult| 3498
              |isExpt| 3503 |is?| 3520 |inv| 3532 |integral| 3537
              |hypergeometricF| 3549 |hermiteH| 3556 |height| 3562
              |hashUpdate!| 3567 |hash| 3573 |hankelH2| 3578 |hankelH1| 3584
              |ground?| 3590 |ground| 3595 |getSimplifyDenomsFlag| 3600
              |gcdPolynomial| 3604 |gcd| 3610 |fresnelS| 3621 |fresnelC| 3626
              |freeOf?| 3631 |factorials| 3643 |factorial| 3654
              |factorSquareFreePolynomial| 3659 |factorPolynomial| 3664
              |factor| 3669 |extendedEuclidean| 3674 |exquo| 3687
              |expressIdealMember| 3693 |exp| 3699 |even?| 3704 |eval| 3709
              |euclideanSize| 3853 |erfi| 3858 |erf| 3863 |elt| 3868
              |ellipticPi| 3964 |ellipticK| 3971 |ellipticF| 3976 |ellipticE|
              3982 |divide| 3993 |distribute| 3999 |dilog| 4010 |digamma| 4015
              |differentiate| 4020 |denominator| 4046 |denom| 4051
              |definingPolynomial| 4056 |csch| 4061 |csc| 4066 |coth| 4071
              |cot| 4076 |cosh| 4081 |cos| 4086 |convert| 4091 |conjugate| 4111
              |conditionP| 4122 |commutator| 4127 |coerce| 4133 |charthRoot|
              4203 |charlierC| 4208 |characteristic| 4215 |box| 4219 |binomial|
              4224 |besselY| 4230 |besselK| 4236 |besselJ| 4242 |besselI| 4248
              |belong?| 4254 |atanh| 4259 |atan| 4264 |associator| 4269
              |associates?| 4276 |asinh| 4282 |asin| 4287 |asech| 4292 |asec|
              4297 |applyQuote| 4302 |antiCommutator| 4338 |annihilate?| 4344
              |angerJ| 4350 |algtower| 4356 |airyBiPrime| 4366 |airyBi| 4371
              |airyAiPrime| 4376 |airyAi| 4381 |acsch| 4386 |acsc| 4391 |acoth|
              4396 |acot| 4401 |acosh| 4406 |acos| 4411 |abs| 4416 ^ 4421
              |Zero| 4451 |Si| 4455 |Shi| 4460 |One| 4465 |Gamma| 4469 |Ei|
              4480 D 4485 |Ci| 4511 |Chi| 4516 |Beta| 4521 = 4527 / 4533 - 4545
              + 4556 * 4562)
           'NIL
           (CONS
            (|makeByteWordVec2| 30
                                '(1 0 1 1 27 1 1 1 1 1 1 1 5 1 1 1 1 2 3 4 5 7
                                  5 22 5 22 1 1 2 5 1 6 2 5 1 1 6 2 2 5 22 8 16
                                  16 5 18 0 0 29 17 18 22 0 13 14 18 1 30 0 0 0
                                  0 1 1 1 0 0 0 0 0 0 0 0 21 1 1 1 1 5 9 10 11
                                  12 15 19 1 1 1 1 1 1 1 1 1 20))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |FunctionSpace&|
                |AlgebraicallyClosedField&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| NIL NIL
                |DivisionRing&| |FullyLinearlyExplicitOver&| NIL |Algebra&|
                |EntireRing&| |Algebra&| |Algebra&| NIL NIL NIL NIL
                |PartialDifferentialRing&| NIL NIL |Rng&| |Module&| |Module&|
                |Module&| NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                NIL NIL |NonAssociativeRng&| |Group&| |AbelianGroup&| NIL NIL
                NIL |ExpressionSpace&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                NIL |NonAssociativeSemiRng&| NIL NIL NIL |Magma&| NIL
                |AbelianSemiGroup&| |SetCategory&| |FullyRetractableTo&| NIL
                |Evalable&| NIL |TranscendentalFunctionCategory&| NIL
                |BasicType&| |RetractableTo&| NIL |RetractableTo&|
                |InnerEvalable&| |InnerEvalable&| |RetractableTo&| NIL
                |RetractableTo&| |RetractableTo&| NIL NIL NIL |RetractableTo&|
                NIL NIL NIL NIL |RetractableTo&| NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL |RadicalCategory&| |RetractableTo&|)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 6) (|FunctionSpace| 6)
                 (|AlgebraicallyClosedField|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|LeftOreRing|)
                 (|DivisionRing|) (|FullyLinearlyExplicitOver| 6)
                 (|CommutativeRing|) (|Algebra| $$) (|EntireRing|)
                 (|Algebra| 490) (|Algebra| 6) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|LinearlyExplicitOver| 6)
                 (|LinearlyExplicitOver| 57) (|PartialDifferentialRing| 27)
                 (|Ring|) (|SemiRing|) (|Rng|) (|Module| $$) (|Module| 490)
                 (|Module| 6) (|SemiRng|) (|BiModule| 490 490)
                 (|BiModule| $$ $$) (|BiModule| 6 6) (|NonAssociativeRing|)
                 (|LeftModule| 490) (|RightModule| 490) (|LeftModule| $$)
                 (|LeftModule| 6) (|RightModule| 6) (|RightModule| $$)
                 (|NonAssociativeRng|) (|Group|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|ExpressionSpace|) (|FullyPatternMatchable| 6)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|Comparable|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 57)
                 (|Magma|) (|LiouvillianFunctionCategory|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|FullyRetractableTo| 6) (|Patternable| 6)
                 (|Evalable| $$) (|CommutativeStar|)
                 (|TranscendentalFunctionCategory|)
                 (|CombinatorialOpsCategory|) (|BasicType|) (|RetractableTo| 6)
                 (|Type|) (|RetractableTo| 27) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| 15 $$) (|RetractableTo| 15)
                 (|CoercibleTo| 593) (|RetractableTo| 490)
                 (|RetractableTo| (|Fraction| (|Polynomial| 6)))
                 (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|RetractableTo| (|Polynomial| 6))
                 (|TwoSidedRecip|) (|ConvertibleTo| 539) (|ConvertibleTo| 568)
                 (|ConvertibleTo| 562) (|RetractableTo| 57) (|unitsKnown|)
                 (|SpecialFunctionCategory|) (|PrimitiveFunctionCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|CombinatorialFunctionCategory|) (|RadicalCategory|)
                 (|RetractableTo| 488))
              (|makeByteWordVec2| 643
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
                                    57 82 1 0 74 0 83 2 0 0 0 0 84 1 78 2 0 85
                                    1 78 2 0 86 0 6 0 87 1 0 0 0 88 1 0 0 0 89
                                    2 0 0 0 35 90 2 0 0 0 57 91 2 0 0 0 92 93 2
                                    45 9 0 0 94 2 0 9 0 0 95 2 0 9 0 0 96 1 45
                                    41 0 97 1 0 98 0 99 1 45 41 0 100 1 0 98 0
                                    101 0 41 0 103 1 0 0 98 104 1 0 0 105 106 1
                                    107 105 0 108 1 107 105 0 109 1 0 0 107 110
                                    1 0 0 0 111 2 42 0 112 0 113 2 114 2 2 42
                                    115 2 15 9 0 27 116 2 0 9 0 0 117 2 35 9 0
                                    0 118 2 41 119 0 15 120 1 121 41 0 122 1
                                    121 0 0 123 2 41 0 0 0 124 3 41 0 0 15 35
                                    125 2 41 0 0 0 126 2 45 0 41 41 127 0 0 9
                                    128 1 0 9 9 129 2 42 15 0 57 130 0 131 0
                                    132 1 0 119 12 133 3 135 134 2 15 134 136 1
                                    0 0 12 137 3 134 0 0 131 2 138 1 134 2 0
                                    139 2 0 0 98 98 140 2 142 0 141 0 143 1 45
                                    144 145 146 1 41 147 145 148 1 0 147 145
                                    149 2 150 0 141 0 151 2 45 152 145 153 154
                                    2 41 155 145 153 156 2 0 155 145 153 157 2
                                    42 9 15 0 158 2 42 0 15 0 159 2 160 2 134
                                    27 161 2 0 0 119 27 162 3 160 2 2 134 27
                                    163 3 0 0 0 119 27 164 0 165 2 166 0 0 0
                                    167 1 165 2 2 168 1 0 0 0 169 1 165 2 2 170
                                    1 0 0 0 171 1 165 2 2 172 1 0 0 0 173 1 165
                                    2 2 174 1 0 0 0 175 1 165 2 2 176 1 0 0 0
                                    177 1 165 2 2 178 1 0 0 0 179 1 165 2 2 180
                                    1 0 0 0 181 1 165 2 2 182 1 0 0 0 183 1 165
                                    2 2 184 1 0 0 0 185 1 165 2 2 186 1 0 0 0
                                    187 1 165 2 2 188 1 0 0 0 189 1 165 2 2 190
                                    1 0 0 0 191 1 165 2 2 192 1 0 0 0 193 1 165
                                    2 2 194 1 0 0 0 195 1 165 2 2 196 1 0 0 0
                                    197 1 165 2 2 198 1 0 0 0 199 1 165 2 2 200
                                    1 0 0 0 201 1 165 2 2 202 1 0 0 0 203 1 165
                                    2 2 204 1 0 0 0 205 1 165 2 2 206 1 0 0 0
                                    207 1 165 2 2 208 1 0 0 0 209 1 165 2 2 210
                                    1 0 0 0 211 1 165 2 2 212 1 0 0 0 213 1 165
                                    2 2 214 1 0 0 0 215 1 165 2 2 216 1 0 0 0
                                    217 1 165 2 2 218 1 0 0 0 219 1 220 2 2 221
                                    1 0 0 0 222 1 220 2 2 223 1 0 0 0 224 1 220
                                    2 2 225 1 0 0 0 226 2 220 2 2 2 227 2 0 0 0
                                    0 228 2 220 2 2 2 229 2 0 0 0 0 230 1 220 2
                                    2 231 1 0 0 0 232 2 220 2 2 2 233 2 0 0 0 0
                                    234 2 220 2 2 2 235 2 0 0 0 0 236 2 220 2 2
                                    2 237 2 0 0 0 0 238 2 220 2 2 2 239 2 0 0 0
                                    0 240 2 220 2 2 2 241 2 0 0 0 0 242 1 220 2
                                    2 243 1 0 0 0 244 1 220 2 2 245 1 0 0 0 246
                                    1 220 2 2 247 1 0 0 0 248 1 220 2 2 249 1 0
                                    0 0 250 1 220 2 2 251 1 0 0 0 252 2 220 2 2
                                    2 253 2 0 0 0 0 254 3 220 2 2 2 2 255 3 0 0
                                    0 0 0 256 3 220 2 2 2 2 257 3 0 0 0 0 0 258
                                    3 220 2 2 2 2 259 3 0 0 0 0 0 260 3 220 2 2
                                    2 2 261 3 0 0 0 0 0 262 3 220 2 2 2 2 263 3
                                    0 0 0 0 0 264 3 220 2 2 2 2 265 3 0 0 0 0 0
                                    266 3 220 2 2 2 2 267 3 0 0 0 0 0 268 2 220
                                    2 2 2 269 2 0 0 0 0 270 2 220 2 2 2 271 2 0
                                    0 0 0 272 2 220 2 2 2 273 2 0 0 0 0 274 2
                                    220 2 2 2 275 2 0 0 0 0 276 2 220 2 2 2 277
                                    2 0 0 0 0 278 2 220 2 2 2 279 2 0 0 0 0 280
                                    3 220 2 2 2 2 281 3 0 0 0 0 0 282 3 220 2 2
                                    2 2 283 3 0 0 0 0 0 284 3 220 2 2 2 2 285 3
                                    0 0 0 0 0 286 3 220 2 2 2 2 287 3 0 0 0 0 0
                                    288 3 220 2 2 2 2 289 3 0 0 0 0 0 290 3 220
                                    2 2 2 2 291 3 0 0 0 0 0 292 2 220 2 2 2 293
                                    2 0 0 0 0 294 2 220 2 2 2 295 2 0 0 0 0 296
                                    2 220 2 2 2 297 2 0 0 0 0 298 2 220 2 2 2
                                    299 2 0 0 0 0 300 1 220 2 2 301 1 0 0 0 302
                                    1 220 2 2 303 1 0 0 0 304 2 220 2 2 2 305 2
                                    0 0 0 0 306 2 220 2 2 2 307 2 0 0 0 0 308 3
                                    220 2 2 2 2 309 3 0 0 0 0 0 310 2 220 2 2 2
                                    311 2 0 0 0 0 312 2 220 2 2 2 313 2 0 0 0 0
                                    314 2 220 2 2 2 315 2 0 0 0 0 316 2 220 2 2
                                    2 317 2 0 0 0 0 318 2 220 2 2 2 319 2 0 0 0
                                    0 320 3 220 2 2 2 2 321 3 0 0 0 0 0 322 1
                                    220 2 2 323 1 0 0 0 324 3 220 2 2 2 2 325 3
                                    0 0 0 0 0 326 2 220 2 2 2 327 2 0 0 0 0 328
                                    4 220 2 2 2 2 2 329 4 0 0 0 0 0 0 330 3 220
                                    2 2 2 2 331 3 0 0 0 0 0 332 4 220 2 2 2 2 2
                                    333 4 0 0 0 0 0 0 334 3 220 2 78 78 2 335 3
                                    0 0 336 336 0 337 5 220 2 78 78 78 78 2 338
                                    5 0 0 336 336 336 336 0 339 2 340 2 2 2 341
                                    1 340 2 2 342 1 0 0 0 343 2 340 2 2 2 344 2
                                    0 0 0 0 345 2 340 2 2 2 346 2 0 0 0 0 347 1
                                    340 2 2 348 1 0 0 0 349 2 340 2 2 27 350 2
                                    0 0 0 27 351 2 340 2 2 27 352 2 0 0 0 27
                                    353 2 340 2 2 354 355 2 0 0 0 356 357 2 340
                                    2 2 27 358 2 0 0 0 27 359 2 340 2 2 354 360
                                    2 0 0 0 356 361 1 362 2 2 363 1 0 0 0 364 1
                                    362 2 2 365 1 0 0 0 366 1 362 2 2 367 1 0 0
                                    0 368 1 362 2 2 369 1 0 0 0 370 1 362 2 2
                                    371 1 0 0 0 372 1 362 2 2 373 1 0 0 0 374 1
                                    362 2 2 375 1 0 0 0 376 1 362 2 2 377 1 0 0
                                    0 378 1 362 2 2 379 1 0 0 0 380 1 362 2 2
                                    381 1 0 0 0 382 1 362 2 2 383 1 0 0 0 384 2
                                    362 2 2 27 385 2 0 0 0 27 386 2 362 2 2 354
                                    387 2 0 0 0 356 388 1 160 9 10 389 1 160 10
                                    10 390 1 165 9 10 391 1 165 10 10 392 1 340
                                    9 10 393 1 340 10 10 394 1 362 9 10 395 1
                                    362 10 10 396 1 220 9 10 397 1 220 10 10
                                    398 1 399 0 41 400 2 402 401 399 15 403 1
                                    401 404 0 405 2 41 35 0 15 406 1 134 35 0
                                    407 2 134 0 0 0 408 1 41 0 15 409 2 404 399
                                    0 399 410 0 134 0 411 2 134 9 0 0 412 1 134
                                    2 0 413 1 134 0 0 414 2 42 0 0 0 415 1 42 0
                                    0 416 2 41 9 0 0 417 1 134 78 0 418 2 78 9
                                    419 0 420 2 422 121 421 134 423 1 0 6 0 424
                                    2 121 0 41 35 425 1 121 0 41 426 2 121 0 0
                                    0 427 2 15 9 0 0 428 0 429 0 430 0 35 0 431
                                    3 429 0 0 27 35 432 1 429 0 57 433 3 436
                                    429 434 435 41 437 2 41 0 119 15 438 1 41 0
                                    57 442 3 445 41 443 444 429 446 2 448 134
                                    447 121 449 2 453 0 429 429 454 1 453 0 429
                                    455 1 456 0 453 457 2 459 456 458 134 460 2
                                    134 9 0 0 461 0 134 0 462 2 45 119 119 119
                                    463 2 78 0 0 0 464 1 0 74 336 465 1 0 74
                                    336 466 2 42 0 0 0 467 1 42 0 0 468 0 27 0
                                    469 2 42 0 15 0 470 2 38 0 0 0 471 6 441
                                    429 429 429 472 38 27 38 473 6 452 429 474
                                    474 475 38 27 38 476 2 0 119 119 119 477 2
                                    478 119 119 119 479 1 481 480 134 482 1 0
                                    483 119 484 0 485 0 486 2 41 0 6 485 487 1
                                    0 0 488 489 2 160 2 2 490 491 2 0 0 0 490
                                    492 1 160 134 15 493 1 160 2 2 494 1 0 0 0
                                    495 1 45 490 0 496 1 0 490 0 497 1 45 71 0
                                    498 1 488 499 0 500 1 488 499 0 501 2 504 2
                                    502 503 505 3 509 2 506 507 508 510 2 488 0
                                    0 0 511 1 0 512 0 513 1 0 0 6 514 1 488 0
                                    490 515 1 488 9 10 516 2 10 9 0 27 517 1 0
                                    518 0 519 2 41 9 0 0 520 0 521 0 522 0 121
                                    0 523 2 121 9 0 0 524 1 121 35 0 525 2 521
                                    0 488 35 526 2 521 0 0 0 527 2 488 0 119 27
                                    528 1 488 10 10 529 2 488 0 10 336 530 1 41
                                    531 0 532 1 41 6 0 533 0 488 0 534 1 121 9
                                    0 535 2 488 0 0 35 536 2 488 0 0 0 537 2
                                    488 0 0 0 538 1 45 539 0 540 1 0 539 0 541
                                    4 0 0 0 542 336 27 543 4 0 0 0 10 0 27 544
                                    1 0 38 0 545 1 38 0 336 546 1 38 0 0 547 1
                                    27 9 0 548 2 38 0 549 0 550 2 551 141 2 27
                                    552 3 0 0 0 542 554 555 1 0 0 27 556 2 557
                                    0 2 2 558 2 0 0 0 559 560 3 563 561 2 562
                                    561 564 3 0 565 0 562 565 566 3 569 567 2
                                    568 567 570 3 0 571 0 568 571 572 1 45 147
                                    145 573 2 45 155 145 153 574 3 575 561 15
                                    562 561 576 4 579 577 45 562 577 578 580 3
                                    581 567 15 568 567 582 4 585 583 45 568 583
                                    584 586 1 45 0 15 587 1 45 589 0 590 1 6 9
                                    0 591 1 16 15 6 592 1 45 593 0 594 1 0 593
                                    0 595 3 0 0 0 74 336 596 2 0 0 553 12 597 4
                                    599 2 42 78 15 598 600 3 0 0 0 74 336 601 2
                                    0 0 10 336 602 2 45 0 57 15 603 1 0 604 0
                                    605 1 589 588 0 606 1 0 608 0 609 1 0 14 0
                                    610 2 0 9 0 0 117 2 1 336 0 27 1 1 1 336 0
                                    1 2 1 336 119 27 1 1 1 336 119 1 1 1 336
                                    623 1 2 1 0 0 27 1 1 1 0 0 1 2 1 0 119 27 1
                                    1 1 0 623 1 1 1 0 119 1 1 28 9 0 54 3 1 0 0
                                    0 0 268 3 1 0 0 0 0 266 3 1 0 0 0 0 262 3 1
                                    0 0 0 0 260 3 1 0 0 0 0 258 3 1 0 0 0 0 264
                                    3 1 0 0 0 0 256 2 1 0 0 0 272 1 0 38 336 1
                                    1 0 38 0 545 2 1 620 0 12 1 1 1 624 0 1 1 1
                                    0 0 1 1 1 9 0 1 1 0 74 336 1 1 0 74 0 1 1 1
                                    0 0 201 1 1 0 0 177 2 1 0 0 356 357 2 1 0 0
                                    27 353 2 16 616 0 0 1 3 0 0 0 74 336 601 2
                                    0 0 0 559 560 2 0 0 0 640 1 2 1 0 0 0 276 2
                                    1 0 0 0 274 1 27 483 119 1 1 1 0 0 1 1 1
                                    617 0 1 1 1 0 0 1 2 27 612 613 119 1 2 0 9
                                    0 0 95 2 1 9 0 0 1 1 1 0 0 197 1 1 0 0 173
                                    1 1 9 9 129 1 1 0 0 205 1 1 0 0 181 0 31 0
                                    1 2 1 336 0 27 1 1 1 336 0 1 2 1 336 119 27
                                    1 1 1 336 623 1 1 1 336 119 1 3 1 0 0 119
                                    27 164 2 1 0 0 27 1 1 1 0 0 1 1 1 0 119 1 2
                                    1 0 119 27 162 1 1 0 623 1 1 17 616 0 1 2
                                    17 0 0 35 1 2 17 0 0 92 1 1 1 0 0 324 1 20
                                    512 0 513 1 21 71 0 72 1 1 622 0 1 1 15 631
                                    0 1 1 5 639 0 1 1 0 14 0 610 1 0 518 0 519
                                    1 0 18 0 19 1 20 488 0 1 1 21 490 0 497 1 1
                                    107 0 1 1 15 57 0 1 1 5 105 0 1 1 0 6 0 424
                                    1 0 27 0 1 1 0 12 0 13 2 1 0 0 0 1 2 25 614
                                    145 153 1 1 25 615 145 1 2 5 155 145 153
                                    157 1 5 147 145 149 1 1 0 0 111 1 17 616 0
                                    1 2 1 0 0 0 1 2 1 0 0 356 361 2 1 0 0 27
                                    359 1 1 626 336 1 1 1 9 0 1 2 1 0 0 0 254 2
                                    1 0 0 0 234 0 1 0 167 2 1 0 0 0 347 3 13
                                    571 0 568 571 572 3 14 565 0 562 565 566 1
                                    0 0 0 1 2 28 9 0 0 1 1 0 542 0 1 1 0 10 10
                                    37 1 17 9 0 52 1 32 9 0 1 1 5 0 0 88 1 5 98
                                    0 99 1 1 9 0 73 2 1 0 0 57 1 2 1 604 336 0
                                    1 1 33 119 12 133 4 1 0 0 0 0 0 334 5 34 0
                                    336 336 336 336 0 339 2 0 0 553 12 597 1 0
                                    18 0 1 3 1 0 0 0 0 284 3 1 0 0 0 0 282 1 1
                                    0 0 171 1 1 0 0 378 3 1 0 0 0 0 322 3 1 0 0
                                    0 0 292 3 1 0 0 0 0 290 1 17 616 0 1 2 17 0
                                    0 35 1 2 17 0 0 92 1 2 1 625 0 0 1 2 1 0 0
                                    0 1 1 1 0 336 1 1 0 641 0 1 1 1 0 0 252 3 1
                                    0 0 0 0 332 3 1 0 0 0 0 288 3 1 0 0 0 0 286
                                    1 0 74 336 466 1 0 74 0 75 2 0 0 10 336 602
                                    2 0 0 10 0 1 2 1 0 0 0 300 2 1 0 0 0 298 2
                                    1 0 0 0 296 2 1 0 0 0 294 2 1 0 0 0 318 2 1
                                    0 0 0 320 2 1 0 0 0 312 4 1 0 0 0 0 0 330 2
                                    1 0 0 0 316 2 1 0 0 0 314 1 17 604 0 1 1 5
                                    635 0 1 1 28 604 0 605 1 28 608 0 609 2 5
                                    633 0 10 1 2 5 633 0 27 1 1 17 633 0 1 2 0
                                    9 0 27 76 2 0 9 0 10 1 1 9 0 0 1 2 1 0 0 27
                                    386 2 1 0 0 356 388 3 34 0 336 336 0 337 2
                                    1 0 0 0 328 1 0 35 0 1 2 0 643 643 0 1 1 0
                                    642 0 1 2 1 0 0 0 280 2 1 0 0 0 278 1 0 9 0
                                    70 1 0 6 0 1 0 1 9 128 2 1 119 119 119 477
                                    1 1 0 336 1 2 1 0 0 0 1 1 1 0 0 382 1 1 0 0
                                    384 2 0 9 0 27 1 2 0 9 0 0 1 1 1 0 0 349 2
                                    1 0 0 27 351 1 1 0 0 343 1 27 483 119 1 1
                                    27 483 119 484 1 1 617 0 1 2 1 628 0 0 1 3
                                    1 630 0 0 0 1 2 1 616 0 0 1 2 1 604 336 0 1
                                    1 1 0 0 169 1 32 9 0 1 4 10 0 0 10 0 27 544
                                    4 10 0 0 542 336 27 543 4 5 0 0 38 636 554
                                    1 4 5 0 0 27 35 637 1 4 5 0 0 38 636 638 1
                                    4 5 0 0 27 35 553 1 3 0 0 0 10 553 1 3 0 0
                                    0 542 638 1 3 0 0 0 10 637 1 3 0 0 0 27 553
                                    1 3 0 0 0 542 554 555 3 0 0 0 27 637 1 3 0
                                    0 0 38 554 1 3 0 0 0 38 638 1 3 0 0 0 0 0 1
                                    3 0 0 0 336 336 1 2 0 0 0 640 1 3 0 0 0 74
                                    336 596 2 0 0 0 559 1 3 0 0 0 12 0 1 1 1 35
                                    0 1 1 1 0 0 366 1 1 0 0 364 2 0 0 10 336 1
                                    10 0 0 10 0 0 0 0 0 0 0 0 0 1 8 0 0 10 0 0
                                    0 0 0 0 0 1 9 0 0 10 0 0 0 0 0 0 0 0 1 6 0
                                    0 10 0 0 0 0 0 1 7 0 0 10 0 0 0 0 0 0 1 5 0
                                    0 10 0 0 0 0 1 3 0 0 10 0 0 1 4 0 0 10 0 0
                                    0 1 2 0 0 10 0 1 3 1 0 0 0 0 310 1 1 0 0
                                    302 2 1 0 0 0 308 2 1 0 0 0 306 1 1 0 0 304
                                    2 1 627 0 0 1 1 0 0 0 1 2 0 0 0 0 1 1 1 0 0
                                    380 1 1 0 0 232 3 5 0 0 27 35 1 3 5 0 0 38
                                    636 1 2 5 0 0 38 1 2 5 0 0 27 1 1 1 0 0 89
                                    1 1 98 0 101 1 33 0 0 495 1 1 0 0 207 1 1 0
                                    0 183 1 1 0 0 203 1 1 0 0 179 1 1 0 0 199 1
                                    1 0 0 175 1 10 539 0 541 1 11 568 0 1 1 12
                                    562 0 1 1 1 0 617 1 2 8 0 0 0 1 1 1 0 0 224
                                    1 35 611 145 1 2 19 0 0 0 1 1 20 0 488 489
                                    1 24 0 490 1 1 23 0 57 61 1 1 0 618 1 1 1 0
                                    619 1 1 1 0 621 1 1 1 0 107 110 1 1 0 0 1 1
                                    5 0 98 104 1 5 0 105 106 1 0 0 6 514 1 0 0
                                    27 556 1 0 0 12 137 1 0 593 0 595 1 36 616
                                    0 1 3 1 0 0 0 0 326 0 5 35 1 1 0 0 0 1 2 1
                                    0 0 0 345 2 1 0 0 0 238 2 1 0 0 0 242 2 1 0
                                    0 0 236 2 1 0 0 0 240 1 0 9 10 11 1 1 0 0
                                    213 1 1 0 0 189 3 5 0 0 0 0 1 2 1 9 0 0 1 1
                                    1 0 0 209 1 1 0 0 185 1 1 0 0 217 1 1 0 0
                                    193 5 0 0 27 0 0 0 0 1 2 0 0 27 336 1 4 0 0
                                    27 0 0 0 1 2 0 0 27 0 1 3 0 0 27 0 0 1 2 5
                                    0 0 0 1 2 5 9 0 0 1 2 1 0 0 0 270 1 1 74
                                    336 465 1 1 74 0 83 1 1 0 0 250 1 1 0 0 248
                                    1 1 0 0 246 1 1 0 0 244 1 1 0 0 219 1 1 0 0
                                    195 1 1 0 0 215 1 1 0 0 191 1 1 0 0 211 1 1
                                    0 0 187 1 1 0 0 222 2 9 0 0 57 91 2 1 0 0 0
                                    84 2 1 0 0 490 492 2 17 0 0 35 90 2 17 0 0
                                    92 93 0 28 0 47 1 1 0 0 370 1 1 0 0 374 0
                                    17 0 49 1 1 0 0 226 2 1 0 0 0 228 1 1 0 0
                                    368 3 5 0 0 38 636 1 2 5 0 0 38 1 3 5 0 0
                                    27 35 1 2 5 0 0 27 1 1 1 0 0 372 1 1 0 0
                                    376 2 1 0 0 0 230 2 0 9 0 0 96 2 9 0 0 0 69
                                    2 1 0 98 98 140 1 16 0 0 56 2 16 0 0 0 67 2
                                    28 0 0 0 65 2 16 0 57 0 59 2 28 0 35 0 1 2
                                    28 0 92 0 1 2 2 0 6 0 1 2 2 0 0 6 1 2 1 0 0
                                    490 1 2 1 0 490 0 1 2 17 0 0 0 63)))))
           '|lookupComplete|)) 
