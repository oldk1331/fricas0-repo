
(SDEFUN |ALGMANIP;ratDenom;2F;1| ((|x| (F)) (% (F)))
        (|ALGMANIP;innerRF| |x|
         (|ALGMANIP;algkernels| (SPADCALL |x| (QREFELT % 15)) %) %)) 

(SDEFUN |ALGMANIP;ratDenom;FLF;2|
        ((|x| (F)) (|l| (|List| (|Kernel| F))) (% (F)))
        (|ALGMANIP;innerRF| |x| (|ALGMANIP;algkernels| |l| %) %)) 

(SDEFUN |ALGMANIP;ratDenom;3F;3| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL |x| (LIST |y|) (QREFELT % 20))) 

(SDEFUN |ALGMANIP;ratDenom;FLF;4| ((|x| (F)) (|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G19 NIL) (|y| NIL) (#2=#:G18 NIL))
               (SEQ
                (SPADCALL |x|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |y| NIL) (LETT #1# |l|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |y| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |y| (QREFELT % 23))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT % 18))))) 

(SDEFUN |ALGMANIP;algkernels|
        ((|l| (|List| (|Kernel| F))) (% (|List| (|Kernel| F))))
        (SPROG NIL
               (SPADCALL
                (CONS #'|ALGMANIP;algkernels!0| (VECTOR (QREFELT % 8) %)) |l|
                (QREFELT % 29)))) 

(SDEFUN |ALGMANIP;algkernels!0| ((|z1| NIL) ($$ NIL))
        (PROG (% ALGOP)
          (LETT % (QREFELT $$ 1))
          (LETT ALGOP (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z1| (QREFELT % 25)) ALGOP (QREFELT % 27)))))) 

(SDEFUN |ALGMANIP;rootkernels|
        ((|l| (|List| (|Kernel| F))) (% (|List| (|Kernel| F))))
        (SPADCALL (CONS #'|ALGMANIP;rootkernels!0| %) |l| (QREFELT % 31))) 

(SDEFUN |ALGMANIP;rootkernels!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 25)) '|nthRoot| (QREFELT % 30))) 

(SDEFUN |ALGMANIP;ratPoly;FSup;7|
        ((|x| (F)) (% (|SparseUnivariatePolynomial| F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL (QREFELT % 13) (QREFELT % 33))
                         (QREFELT % 35))
               |x| (QREFELT % 36))
              (QREFELT % 37))
             (QREFELT % 16))
            (QREFELT % 38))
           (QREFELT % 35))
          (QREFELT % 13) (QREFELT % 41))
         (QREFELT % 43))) 

(SDEFUN |ALGMANIP;rootSplit;2F;8| ((|x| (F)) (% (F)))
        (SPROG
         ((|lv| (|List| F)) (|lk| (|List| (|Kernel| F))) (|v| (F))
          (#1=#:G30 NIL) (|k| NIL) (|lk0| (|List| (|Kernel| F))))
         (SEQ
          (LETT |lk0| (|ALGMANIP;rootkernels| (SPADCALL |x| (QREFELT % 15)) %))
          (LETT |lk| NIL) (LETT |lv| NIL)
          (SEQ (LETT |k| NIL) (LETT #1# |lk0|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (LETT |v| (|ALGMANIP;rootExpand| |lk| |lv| |k| %))
                    (LETT |lk| (CONS |k| |lk|))
                    (EXIT (LETT |lv| (CONS |v| |lv|))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |x| |lk| |lv| (QREFELT % 46)))))) 

(SDEFUN |ALGMANIP;rootExpand|
        ((|lk| (|List| (|Kernel| F))) (|lv| (|List| F)) (|k| (|Kernel| F))
         (% (F)))
        (SPROG ((|x| (F)) (|op| (|BasicOperator|)) (|n| (F)))
               (SEQ (LETT |x| (|SPADfirst| (SPADCALL |k| (QREFELT % 48))))
                    (LETT |n|
                          (SPADCALL (SPADCALL |k| (QREFELT % 48))
                                    (QREFELT % 49)))
                    (LETT |op| (SPADCALL |k| (QREFELT % 25)))
                    (LETT |x| (SPADCALL |x| |lk| |lv| (QREFELT % 46)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL |op|
                                (SPADCALL (SPADCALL |x| (QREFELT % 50))
                                          (QREFELT % 35))
                                |n| (QREFELT % 51))
                      (SPADCALL |op|
                                (SPADCALL (SPADCALL |x| (QREFELT % 38))
                                          (QREFELT % 35))
                                |n| (QREFELT % 51))
                      (QREFELT % 52)))))) 

(SDEFUN |ALGMANIP;innerRF| ((|x| (F)) (|ll| (|List| (|Kernel| F))) (% (F)))
        (SPROG
         ((|q| (|SparseUnivariatePolynomial| F)) (#1=#:G82 NIL) (|kk| NIL)
          (#2=#:G81 NIL) (#3=#:G77 NIL) (#4=#:G78 NIL) (#5=#:G80 NIL)
          (#6=#:G79 NIL) (|l| (|List| (|Kernel| F)))
          (|lk| (|List| (|Kernel| F))) (|k| (|Kernel| F)))
         (SEQ
          (EXIT
           (COND
            ((OR
              (NULL
               (LETT |l|
                     (SPADCALL (ELT % 53) (SPADCALL |x| (QREFELT % 54))
                               (QREFELT % 56))))
              (NULL
               (SPADCALL |ll| (SPADCALL |x| (QREFELT % 15)) (QREFELT % 57))))
             |x|)
            ('T
             (SEQ (LETT |lk| NIL)
                  (SEQ G190
                       (COND
                        ((NULL
                          (NULL
                           (SPADCALL (LETT |k| (|SPADfirst| |l|)) |ll|
                                     (QREFELT % 58))))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |lk| (CONS |k| |lk|))
                              (EXIT
                               (COND
                                ((NULL (LETT |l| (CDR |l|)))
                                 (PROGN
                                  (LETT #3#
                                        (PROGN
                                         (LETT #4#
                                               (SPADCALL |x| |lk|
                                                         (PROGN
                                                          (LETT #6# NIL)
                                                          (SEQ (LETT |kk| NIL)
                                                               (LETT #5# |lk|)
                                                               G190
                                                               (COND
                                                                ((OR (ATOM #5#)
                                                                     (PROGN
                                                                      (LETT
                                                                       |kk|
                                                                       (CAR
                                                                        #5#))
                                                                      NIL))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT #6#
                                                                       (CONS
                                                                        (SPADCALL
                                                                         (CONS
                                                                          #'|ALGMANIP;innerRF!0|
                                                                          (VECTOR
                                                                           %
                                                                           |ll|))
                                                                         |kk|
                                                                         (QREFELT
                                                                          %
                                                                          60))
                                                                        #6#))))
                                                               (LETT #5#
                                                                     (CDR #5#))
                                                               (GO G190) G191
                                                               (EXIT
                                                                (NREVERSE
                                                                 #6#))))
                                                         (QREFELT % 46)))
                                         (GO #7=#:G76)))
                                  (GO #8=#:G40)))))))
                        #8# (EXIT #3#))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |q|
                        (SPADCALL
                         (SPADCALL |x| |lk|
                                   (PROGN
                                    (LETT #2# NIL)
                                    (SEQ (LETT |kk| NIL) (LETT #1# |lk|) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |kk| (CAR #1#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #2#
                                                 (CONS
                                                  (SPADCALL
                                                   (CONS #'|ALGMANIP;innerRF!1|
                                                         (VECTOR % |ll|))
                                                   |kk| (QREFELT % 60))
                                                  #2#))))
                                         (LETT #1# (CDR #1#)) (GO G190) G191
                                         (EXIT (NREVERSE #2#))))
                                   (QREFELT % 46))
                         |k| (SPADCALL |k| (QREFELT % 62)) (QREFELT % 63)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (CONS #'|ALGMANIP;innerRF!2| (VECTOR % |ll|)) |q|
                              (QREFELT % 65))
                    (SPADCALL (CONS #'|ALGMANIP;innerRF!3| (VECTOR % |ll|)) |k|
                              (QREFELT % 60))
                    (QREFELT % 66)))))))
          #7# (EXIT #4#)))) 

(SDEFUN |ALGMANIP;innerRF!3| ((|z1| NIL) ($$ NIL))
        (PROG (|ll| %)
          (LETT |ll| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|ALGMANIP;innerRF| |z1| |ll| %))))) 

(SDEFUN |ALGMANIP;innerRF!2| ((|z1| NIL) ($$ NIL))
        (PROG (|ll| %)
          (LETT |ll| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|ALGMANIP;innerRF| |z1| |ll| %))))) 

(SDEFUN |ALGMANIP;innerRF!1| ((|z1| NIL) ($$ NIL))
        (PROG (|ll| %)
          (LETT |ll| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|ALGMANIP;innerRF| |z1| |ll| %))))) 

(SDEFUN |ALGMANIP;innerRF!0| ((|z1| NIL) ($$ NIL))
        (PROG (|ll| %)
          (LETT |ll| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|ALGMANIP;innerRF| |z1| |ll| %))))) 

(SDEFUN |ALGMANIP;fp_root|
        ((|fp| (|Factored| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (|op| (|BasicOperator|)) (|n| (|NonNegativeInteger|)) (% (F)))
        (SPROG
         ((|res| (F)) (|rr| (F)) (|ce| (|NonNegativeInteger|))
          (|ne| (|NonNegativeInteger|)) (#1=#:G89 NIL) (#2=#:G87 NIL)
          (|nn| (|Integer|)) (|ng| (|NonNegativeInteger|)) (#3=#:G94 NIL)
          (|fr| NIL) (|u| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ (LETT |res| (|spadConstant| % 68))
              (COND
               ((SPADCALL (LETT |u| (SPADCALL |fp| (QREFELT % 70)))
                          (|spadConstant| % 72) (QREFELT % 73))
                (LETT |res|
                      (SPADCALL |op|
                                (LIST (SPADCALL |u| (QREFELT % 74))
                                      (SPADCALL |n| (QREFELT % 76)))
                                (QREFELT % 77)))))
              (SEQ (LETT |fr| NIL) (LETT #3# (SPADCALL |fp| (QREFELT % 81)))
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |fr| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ne| (REM (QVELT |fr| 2) |n|))
                        (LETT |ng| (GCD |ne| |n|))
                        (LETT |nn|
                              (PROG2 (LETT #2# (|exquo_INT| |n| |ng|))
                                  (QCDR #2#)
                                (|check_union2| (QEQCAR #2# 0)
                                                (|NonNegativeInteger|)
                                                (|Union| (|NonNegativeInteger|)
                                                         #4="failed")
                                                #2#)))
                        (LETT |ne|
                              (PROG1
                                  (LETT #1#
                                        (PROG2
                                            (LETT #2# (|exquo_INT| |ne| |ng|))
                                            (QCDR #2#)
                                          (|check_union2| (QEQCAR #2# 0)
                                                          (|NonNegativeInteger|)
                                                          (|Union|
                                                           (|NonNegativeInteger|)
                                                           #4#)
                                                          #2#)))
                                (|check_subtype2| (>= #1# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #1#)))
                        (LETT |ce| (|quotient_INT| (QVELT |fr| 2) |n|))
                        (LETT |rr|
                              (COND
                               ((> |nn| 1)
                                (SPADCALL |op|
                                          (LIST
                                           (SPADCALL
                                            (SPADCALL (QVELT |fr| 1) |ne|
                                                      (QREFELT % 83))
                                            (QREFELT % 74))
                                           (SPADCALL |nn| (QREFELT % 76)))
                                          (QREFELT % 77)))
                               ('T (|spadConstant| % 68))))
                        (EXIT
                         (LETT |res|
                               (SPADCALL
                                (SPADCALL |res|
                                          (SPADCALL
                                           (SPADCALL (QVELT |fr| 1) |ce|
                                                     (QREFELT % 83))
                                           (QREFELT % 74))
                                          (QREFELT % 84))
                                |rr| (QREFELT % 84)))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |ALGMANIP;pol_root|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (|op| (|BasicOperator|)) (|n| (|NonNegativeInteger|)) (% (F)))
        (SPROG
         ((|pp| (|SparseMultivariatePolynomial| R (|Kernel| F))) (#1=#:G96 NIL)
          (|cp| (R)))
         (SEQ (LETT |cp| (SPADCALL |p| (QREFELT % 85)))
              (LETT |pp|
                    (PROG2
                        (LETT #1#
                              (SPADCALL |p| (SPADCALL |cp| (QREFELT % 86))
                                        (QREFELT % 88)))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0)
                                      (|SparseMultivariatePolynomial|
                                       (QREFELT % 6) (|Kernel| (QREFELT % 7)))
                                      (|Union|
                                       (|SparseMultivariatePolynomial|
                                        (QREFELT % 6) (|Kernel| (QREFELT % 7)))
                                       "failed")
                                      #1#)))
              (EXIT
               (SPADCALL
                (|ALGMANIP;fp_root| (SPADCALL |pp| (QREFELT % 89)) |op| |n| %)
                (|ALGMANIP;fp_root|
                 (SPADCALL (ELT % 86) (SPADCALL |cp| (QREFELT % 91))
                           (QREFELT % 95))
                 |op| |n| %)
                (QREFELT % 84)))))) 

(SDEFUN |ALGMANIP;root_factor_k|
        ((|lk| (|List| (|Kernel| F))) (|lv| (|List| F)) (|k| (|Kernel| F))
         (% (F)))
        (SPROG
         ((|x| (F)) (|op| (|BasicOperator|)) (|n| (|NonNegativeInteger|))
          (#1=#:G100 NIL) (|nf| (F)))
         (SEQ (LETT |x| (|SPADfirst| (SPADCALL |k| (QREFELT % 48))))
              (LETT |nf|
                    (SPADCALL (SPADCALL |k| (QREFELT % 48)) (QREFELT % 49)))
              (LETT |n|
                    (PROG1 (LETT #1# (SPADCALL |nf| (QREFELT % 96)))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#)))
              (LETT |op| (SPADCALL |k| (QREFELT % 25)))
              (LETT |x| (SPADCALL |x| |lk| |lv| (QREFELT % 46)))
              (EXIT
               (SPADCALL
                (|ALGMANIP;pol_root| (SPADCALL |x| (QREFELT % 50)) |op| |n| %)
                (|ALGMANIP;pol_root| (SPADCALL |x| (QREFELT % 38)) |op| |n| %)
                (QREFELT % 52)))))) 

(SDEFUN |ALGMANIP;rootFactor;2F;14| ((|x| (F)) (% (F)))
        (SPROG
         ((|lv| (|List| F)) (|lk| (|List| (|Kernel| F))) (|v| (F))
          (#1=#:G108 NIL) (|k| NIL) (|lk0| (|List| (|Kernel| F))))
         (SEQ
          (LETT |lk0| (|ALGMANIP;rootkernels| (SPADCALL |x| (QREFELT % 15)) %))
          (LETT |lk| NIL) (LETT |lv| NIL)
          (SEQ (LETT |k| NIL) (LETT #1# |lk0|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (LETT |v| (|ALGMANIP;root_factor_k| |lk| |lv| |k| %))
                    (LETT |lk| (CONS |k| |lk|))
                    (EXIT (LETT |lv| (CONS |v| |lv|))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |x| |lk| |lv| (QREFELT % 46)))))) 

(SDEFUN |ALGMANIP;rootKerSimp;BoFNniF;15|
        ((|op| (|BasicOperator|)) (|x| (F)) (|n| (|NonNegativeInteger|))
         (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 99)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 0)
                       (SPADCALL (SPADCALL (QCDR |r|) |n| (QREFELT % 100))
                                 (QREFELT % 101)))
                      ('T (|ALGMANIP;inroot| |op| |x| |n| %))))))) 

(SDEFUN |ALGMANIP;rootKerSimp;BoFNniF;16|
        ((|op| (|BasicOperator|)) (|x| (F)) (|n| (|NonNegativeInteger|))
         (% (F)))
        (|ALGMANIP;inroot| |op| |x| |n| %)) 

(SDEFUN |ALGMANIP;breakup|
        ((|l| (|List| (|Kernel| F)))
         (%
          (|List|
           (|Record| (|:| |ker| (|List| (|Kernel| F)))
                     (|:| |exponent| (|List| (|Integer|)))))))
        (SPROG
         ((|ll|
           (|List|
            (|Record| (|:| |ker| (|List| (|Kernel| F)))
                      (|:| |exponent| (|List| (|Integer|))))))
          (|others| #1=(|List| (|Kernel| F))) (|expo| (|List| (|Integer|)))
          (|same| #1#) (|arg| (|List| F)) (#2=#:G123 NIL) (|kk| NIL)
          (|n| (|Integer|)) (|a| (F)) (|k| (|Kernel| F)))
         (SEQ
          (COND ((NULL |l|) NIL)
                ('T
                 (SEQ (LETT |k| (|SPADfirst| |l|))
                      (LETT |a|
                            (|SPADfirst|
                             (LETT |arg| (SPADCALL |k| (QREFELT % 48)))))
                      (LETT |n|
                            (SPADCALL (SPADCALL |arg| (QREFELT % 49))
                                      (QREFELT % 96)))
                      (LETT |expo| NIL) (LETT |others| (LETT |same| NIL))
                      (SEQ (LETT |kk| NIL) (LETT #2# (CDR |l|)) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |kk| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |a|
                                         (|SPADfirst|
                                          (LETT |arg|
                                                (SPADCALL |kk|
                                                          (QREFELT % 48))))
                                         (QREFELT % 103))
                               (SEQ (LETT |same| (CONS |kk| |same|))
                                    (EXIT
                                     (LETT |expo|
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |arg| (QREFELT % 49))
                                             (QREFELT % 96))
                                            |expo|)))))
                              ('T (LETT |others| (CONS |kk| |others|))))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (LETT |ll| (|ALGMANIP;breakup| |others| %))
                      (EXIT
                       (CONS (CONS (CONS |k| |same|) (CONS |n| |expo|))
                             |ll|)))))))) 

(SDEFUN |ALGMANIP;rootProduct;2F;18| ((|x| (F)) (% (F)))
        (SPROG
         ((|lv| (|List| F)) (#1=#:G128 NIL) (#2=#:G137 NIL) (|m| NIL)
          (#3=#:G136 NIL) (|k| (|Kernel| F)) (|n| (|Integer|))
          (|k0| (|Kernel| F)) (|l| (|List| (|Kernel| F))) (#4=#:G135 NIL)
          (|rec| NIL))
         (SEQ
          (SEQ (LETT |rec| NIL)
               (LETT #4#
                     (|ALGMANIP;breakup|
                      (|ALGMANIP;rootkernels| (SPADCALL |x| (QREFELT % 15)) %)
                      %))
               G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |rec| (CAR #4#)) NIL)) (GO G191)))
               (SEQ (LETT |k0| (|SPADfirst| (LETT |l| (QCAR |rec|))))
                    (EXIT
                     (COND
                      ((NULL (NULL (CDR |l|)))
                       (SEQ (LETT |n| (SPADCALL (QCDR |rec|) (QREFELT % 104)))
                            (LETT |k|
                                  (SPADCALL (SPADCALL |k0| (QREFELT % 25))
                                            (LIST
                                             (|SPADfirst|
                                              (SPADCALL |k0| (QREFELT % 48)))
                                             (SPADCALL |n| (QREFELT % 76)))
                                            (SPADCALL |k0| (QREFELT % 105))
                                            (QREFELT % 106)))
                            (LETT |lv|
                                  (PROGN
                                   (LETT #3# NIL)
                                   (SEQ (LETT |m| NIL) (LETT #2# (QCDR |rec|))
                                        G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN (LETT |m| (CAR #2#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #3#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |k|
                                                            (QREFELT % 107))
                                                  (PROG1
                                                      (LETT #1#
                                                            (|quotient_INT| |n|
                                                                            |m|))
                                                    (|check_subtype2|
                                                     (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                                  (QREFELT % 108))
                                                 #3#))))
                                        (LETT #2# (CDR #2#)) (GO G190) G191
                                        (EXIT (NREVERSE #3#)))))
                            (EXIT
                             (LETT |x|
                                   (SPADCALL |x| |l| |lv|
                                             (QREFELT % 46)))))))))
               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |x| (QREFELT % 109)))))) 

(SDEFUN |ALGMANIP;rootPower1|
        ((|x| (F)) (|lk| (|List| (|Kernel| F))) (|nlk| (|List| F)) (% (F)))
        (SPROG ((#1=#:G143 NIL) (|k| NIL))
               (SEQ (LETT |x| (SPADCALL |x| |lk| |nlk| (QREFELT % 46)))
                    (SEQ (LETT |k| NIL)
                         (LETT #1# (SPADCALL |x| (QREFELT % 54))) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |k| (QREFELT % 25)) '|nthRoot|
                                       (QREFELT % 30))
                             (LETT |x|
                                   (SPADCALL
                                    (|ALGMANIP;radeval|
                                     (SPADCALL |x| (QREFELT % 50)) |k| %)
                                    (|ALGMANIP;radeval|
                                     (SPADCALL |x| (QREFELT % 38)) |k| %)
                                    (QREFELT % 52)))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |x|)))) 

(SDEFUN |ALGMANIP;rootPower;2F;20| ((|x| (F)) (% (F)))
        (SPROG
         ((|nlk| (|List| F)) (|lk| (|List| (|Kernel| F))) (|nk| (F))
          (|nargs| (|List| F)) (#1=#:G151 NIL) (|k| NIL))
         (SEQ (LETT |lk| NIL) (LETT |nlk| NIL)
              (SEQ (LETT |k| NIL) (LETT #1# (SPADCALL |x| (QREFELT % 15))) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |nargs|
                          (SPADCALL
                           (CONS #'|ALGMANIP;rootPower;2F;20!0|
                                 (VECTOR % |nlk| |lk|))
                           (SPADCALL |k| (QREFELT % 48)) (QREFELT % 111)))
                    (LETT |nk|
                          (SPADCALL (SPADCALL |k| (QREFELT % 25)) |nargs|
                                    (QREFELT % 112)))
                    (LETT |lk| (CONS |k| |lk|))
                    (EXIT (LETT |nlk| (CONS |nk| |nlk|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (|ALGMANIP;rootPower1| |x| |lk| |nlk| %))))) 

(SDEFUN |ALGMANIP;rootPower;2F;20!0| ((|k1| NIL) ($$ NIL))
        (PROG (|lk| |nlk| %)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |nlk| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|ALGMANIP;rootPower1| |k1| |lk| |nlk| %))))) 

(SDEFUN |ALGMANIP;radeval|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (|k| (|Kernel| F)) (% (F)))
        (SPROG
         ((|q|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|ans| (F)) (|term| (F)) (|g| (|NonNegativeInteger|))
          (|d| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|))
          (#1=#:G156 NIL) (|a| (F)) (|arg| (|List| F)) (|ka| (|Kernel| F))
          (|ka1| (|Union| (|Kernel| F) "failed")) (#2=#:G152 NIL))
         (SEQ
          (LETT |a| (|SPADfirst| (LETT |arg| (SPADCALL |k| (QREFELT % 48)))))
          (LETT |n|
                (PROG1
                    (LETT #2#
                          (SPADCALL (SPADCALL |arg| (QREFELT % 49))
                                    (QREFELT % 96)))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (LETT |ans| (|spadConstant| % 113))
          (LETT |q| (SPADCALL |p| |k| (QREFELT % 114)))
          (LETT |ka1| (SPADCALL |a| (QREFELT % 116)))
          (COND
           ((QEQCAR |ka1| 0)
            (COND
             ((SPADCALL (QCDR |ka1|) '|nthRoot| (QREFELT % 117))
              (SEQ (LETT |ka| (QCDR |ka1|))
                   (LETT |arg| (SPADCALL |ka| (QREFELT % 48)))
                   (LETT |a| (|SPADfirst| |arg|))
                   (LETT |n|
                         (* |n|
                            (PROG1
                                (LETT #1#
                                      (SPADCALL (SPADCALL |arg| (QREFELT % 49))
                                                (QREFELT % 96)))
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#))))
                   (EXIT
                    (LETT |k|
                          (SPADCALL (SPADCALL |ka| (QREFELT % 25))
                                    (LIST |a| (SPADCALL |n| (QREFELT % 76)))
                                    (SPADCALL |ka| (QREFELT % 105))
                                    (QREFELT % 106)))))))))
          (SEQ G190
               (COND
                ((NULL (> (LETT |d| (SPADCALL |q| (QREFELT % 119))) 0))
                 (GO G191)))
               (SEQ
                (LETT |term|
                      (SEQ (LETT |g| (GCD |d| |n|))
                           (EXIT
                            (COND
                             ((EQL |g| |n|)
                              (SPADCALL |a| (|quotient_INT| |d| |g|)
                                        (QREFELT % 108)))
                             ((EQL |g| 1)
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 72) |k| |d|
                                         (QREFELT % 120))
                               (QREFELT % 74)))
                             ('T
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 72)
                                         (SPADCALL
                                          (SPADCALL |k| (QREFELT % 25))
                                          (LIST |a|
                                                (SPADCALL
                                                 (|quotient_INT| |n| |g|)
                                                 (QREFELT % 76)))
                                          (SPADCALL |k| (QREFELT % 105))
                                          (QREFELT % 106))
                                         (|quotient_INT| |d| |g|)
                                         (QREFELT % 120))
                               (QREFELT % 74)))))))
                (LETT |ans|
                      (SPADCALL |ans|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |q| (QREFELT % 121))
                                           (QREFELT % 74))
                                 |term| (QREFELT % 84))
                                (QREFELT % 122)))
                (EXIT (LETT |q| (SPADCALL |q| (QREFELT % 123)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT % 121)) (QREFELT % 74))
                     |ans| (QREFELT % 122)))))) 

(SDEFUN |ALGMANIP;inroot|
        ((|op| (|BasicOperator|)) (|x| (F)) (|n| (|NonNegativeInteger|))
         (% (F)))
        (SPROG
         ((#1=#:G206 NIL)
          (|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (|q| (|Fraction| (|Integer|)))
          (|pr|
           (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|)))
            "failed"))
          (#2=#:G210 NIL)
          (|num| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ
          (COND ((SPADCALL |x| (|spadConstant| % 68) (QREFELT % 103)) |x|)
                (#3='T
                 (SEQ
                  (EXIT
                   (SEQ
                    (COND
                     ((SPADCALL |x|
                                (SPADCALL (|spadConstant| % 68)
                                          (QREFELT % 124))
                                (QREFELT % 125))
                      (SEQ (LETT |num| (SPADCALL |x| (QREFELT % 50)))
                           (EXIT
                            (COND
                             ((OR
                               (SPADCALL |num| (|spadConstant| % 72)
                                         (QREFELT % 126))
                               (SPADCALL |num|
                                         (SPADCALL (|spadConstant| % 72)
                                                   (QREFELT % 128))
                                         (QREFELT % 126)))
                              (PROGN
                               (LETT #2#
                                     (SPADCALL
                                      (|ALGMANIP;inroot| |op|
                                       (SPADCALL
                                        (SPADCALL |num|
                                                  (SPADCALL |x| (QREFELT % 38))
                                                  (QREFELT % 127))
                                        (QREFELT % 74))
                                       |n| %)
                                      (QREFELT % 37)))
                               (GO #4=#:G208))))))))
                    (LETT |u| (SPADCALL |x| |op| (QREFELT % 131)))
                    (EXIT
                     (COND
                      ((QEQCAR |u| 1)
                       (SPADCALL |op| (LIST |x| (SPADCALL |n| (QREFELT % 76)))
                                 (QREFELT % 77)))
                      (#3#
                       (SEQ (LETT |pr| (QCDR |u|))
                            (LETT |q|
                                  (SPADCALL (QCDR |pr|)
                                            (* |n|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL (QCAR |pr|)
                                                           (QREFELT % 48))
                                                 (QREFELT % 49))
                                                (QREFELT % 96)))
                                            (QREFELT % 133)))
                            (LETT |qr|
                                  (|divide_INT| (SPADCALL |q| (QREFELT % 134))
                                                (SPADCALL |q|
                                                          (QREFELT % 135))))
                            (LETT |x|
                                  (|SPADfirst|
                                   (SPADCALL (QCAR |pr|) (QREFELT % 48))))
                            (EXIT
                             (SPADCALL
                              (SPADCALL |x| (QCAR |qr|) (QREFELT % 136))
                              (SPADCALL
                               (SPADCALL |op| |x|
                                         (PROG1
                                             (LETT #1#
                                                   (SPADCALL |q|
                                                             (QREFELT % 135)))
                                           (|check_subtype2| (>= #1# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #1#))
                                         (QREFELT % 102))
                               (QCDR |qr|) (QREFELT % 136))
                              (QREFELT % 84)))))))))
                  #4# (EXIT #2#))))))) 

(SDEFUN |ALGMANIP;sroot|
        ((|k| (|Kernel| F)) (|lk| (|List| (|Kernel| F))) (|nlk| (|List| F))
         (% (F)))
        (SPROG
         ((|pr|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (#1=#:G211 NIL) (|narg1| (F)) (|arg| (|List| F)))
         (SEQ
          (LETT |narg1|
                (SPADCALL
                 (|SPADfirst| (LETT |arg| (SPADCALL |k| (QREFELT % 48)))) |lk|
                 |nlk| (QREFELT % 46)))
          (LETT |pr|
                (SPADCALL |narg1|
                          (PROG1
                              (LETT #1#
                                    (SPADCALL (SPADCALL |arg| (QREFELT % 49))
                                              (QREFELT % 96)))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          (QREFELT % 139)))
          (EXIT
           (SPADCALL (QVELT |pr| 1)
                     (SPADCALL (SPADCALL |k| (QREFELT % 25)) (QVELT |pr| 2)
                               (QVELT |pr| 0) (QREFELT % 102))
                     (QREFELT % 84)))))) 

(SDEFUN |ALGMANIP;rootSimp;2F;24| ((|x| (F)) (% (F)))
        (SPROG
         ((|nlk| (|List| F)) (|lk| (|List| (|Kernel| F))) (|nk| (F))
          (#1=#:G220 NIL) (|k| NIL) (|tk| (|List| (|Kernel| F))))
         (SEQ
          (LETT |tk| (|ALGMANIP;rootkernels| (SPADCALL |x| (QREFELT % 15)) %))
          (LETT |lk| NIL) (LETT |nlk| NIL)
          (SEQ (LETT |k| NIL) (LETT #1# |tk|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (LETT |nk| (|ALGMANIP;sroot| |k| |lk| |nlk| %))
                    (LETT |lk| (CONS |k| |lk|))
                    (EXIT (LETT |nlk| (CONS |nk| |nlk|))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |x| |lk| |nlk| (QREFELT % 46)))))) 

(DECLAIM (NOTINLINE |AlgebraicManipulations;|)) 

(DEFUN |AlgebraicManipulations;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|AlgebraicManipulations| DV$1 DV$2))
          (LETT % (GETREFV 141))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#1|
                                                              '(|Comparable|))
                                               (|HasCategory| |#1|
                                                              '(|GcdDomain|))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FunctionSpace|
                                                               (|devaluate|
                                                                |#1|))))
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#1|
                                                              '(|Comparable|))
                                               (|HasCategory| |#1|
                                                              '(|GcdDomain|))
                                               (|HasCategory| |#1|
                                                              '(|UniqueFactorizationDomain|))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|FunctionSpace|
                                                               (|devaluate|
                                                                |#1|))))))))
          (|haddProp| |$ConstructorCache| '|AlgebraicManipulations|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8 '|%alg|)
          (QSETREFV % 13 (SPADCALL (SPADCALL (QREFELT % 10)) (QREFELT % 12)))
          (COND
           ((|HasCategory| |#1| '(|Comparable|))
            (COND
             ((|HasCategory| |#1| '(|GcdDomain|))
              (COND
               ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
                (COND
                 ((|HasCategory| |#2|
                                 (LIST '|FunctionSpace| (|devaluate| |#1|)))
                  (PROGN
                   (COND
                    ((|HasCategory| |#1| '(|UniqueFactorizationDomain|))
                     (COND
                      ((|HasCategory| |#1| '(|CharacteristicZero|))
                       (COND
                        ((|HasCategory| |#1|
                                        '(|PolynomialFactorizationExplicit|))
                         (PROGN
                          (QSETREFV % 67
                                    (|MultivariateFactorize| (|Kernel| |#2|)
                                                             (|IndexedExponents|
                                                              (|Kernel| |#2|))
                                                             |#1|
                                                             (|SparseMultivariatePolynomial|
                                                              |#1|
                                                              (|Kernel|
                                                               |#2|))))
                          (QSETREFV % 97
                                    (CONS
                                     (|dispatchFunction|
                                      |ALGMANIP;rootFactor;2F;14|)
                                     %)))))))))
                   (COND
                    ((|HasCategory| |#1| '(|RadicalCategory|))
                     (QSETREFV % 102
                               (CONS
                                (|dispatchFunction|
                                 |ALGMANIP;rootKerSimp;BoFNniF;15|)
                                %)))
                    ('T
                     (QSETREFV % 102
                               (CONS
                                (|dispatchFunction|
                                 |ALGMANIP;rootKerSimp;BoFNniF;16|)
                                %))))
                   (QSETREFV % 110
                             (CONS
                              (|dispatchFunction| |ALGMANIP;rootProduct;2F;18|)
                              %))
                   (QSETREFV % 109
                             (CONS
                              (|dispatchFunction| |ALGMANIP;rootPower;2F;20|)
                              %))
                   (QSETREFV % 140
                             (CONS
                              (|dispatchFunction| |ALGMANIP;rootSimp;2F;24|)
                              %)))))))))))
          %))) 

(DEFUN |AlgebraicManipulations| (&REST #1=#:G221)
  (SPROG NIL
         (PROG (#2=#:G222)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AlgebraicManipulations|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AlgebraicManipulations;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AlgebraicManipulations|)))))))))) 

(MAKEPROP '|AlgebraicManipulations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              (|Symbol|) (0 . |new|) (|Kernel| 7) (4 . |kernel|) '|dummy|
              (|List| 22) (9 . |tower|) |ALGMANIP;ratDenom;2F;1| (|List| 11)
              |ALGMANIP;ratDenom;FLF;2| (|List| 7) |ALGMANIP;ratDenom;FLF;4|
              |ALGMANIP;ratDenom;3F;3| (|Kernel| %) (14 . |retract|)
              (|BasicOperator|) (19 . |operator|) (|Boolean|) (24 . |has?|)
              (|Mapping| 26 11) (30 . |select|) (36 . |is?|) (42 . |select!|)
              (|SparseMultivariatePolynomial| 6 11) (48 . |coerce|)
              (|SparseMultivariatePolynomial| 6 22) (53 . |coerce|) (58 . -)
              (64 . |inv|) (69 . |denom|) (|Fraction| 42)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 11) 11
                                                     6 32 7)
              (74 . |univariate|) (|SparseUnivariatePolynomial| 7)
              (80 . |numer|) |ALGMANIP;ratPoly;FSup;7| (|List| %) (85 . |eval|)
              |ALGMANIP;rootSplit;2F;8| (92 . |argument|) (97 . |second|)
              (102 . |numer|) (107 . |elt|) (114 . /) (120 . >)
              (126 . |kernels|) (|Mapping| 26 11 11) (131 . |sort!|)
              (137 . |setIntersection|) (143 . |member?|) (|Mapping| % %)
              (149 . |map|) (|SparseUnivariatePolynomial| %) (155 . |minPoly|)
              (160 . |univariate|) (|Mapping| 7 7) (167 . |map|) (173 . |elt|)
              '|MPfact| (179 . |One|) (|Factored| 32) (183 . |unit|)
              (188 . |One|) (192 . |One|) (196 . ~=) (202 . |coerce|)
              (|Integer|) (207 . |coerce|) (212 . |kernel|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 78) (|:| |factor| 32) (|:| |exponent| 82))
              (|List| 79) (218 . |factorList|) (|NonNegativeInteger|) (223 . ^)
              (229 . *) (235 . |content|) (240 . |coerce|)
              (|Union| % '"failed") (245 . |exquo|) (251 . |factor|)
              (|Factored| %) (256 . |factor|) (|Mapping| 32 6) (|Factored| 6)
              (|FactoredFunctions2| 6 32) (261 . |map|) (267 . |retract|)
              (272 . |rootFactor|) (|Union| 6 '#1="failed")
              (277 . |retractIfCan|) (282 . |nthRoot|) (288 . |coerce|)
              (293 . |rootKerSimp|) (300 . =) (306 . |lcm|) (311 . |height|)
              (316 . |kernel|) (323 . |coerce|) (328 . ^) (334 . |rootPower|)
              (339 . |rootProduct|) (344 . |map|) (350 . |elt|) (356 . |Zero|)
              (360 . |univariate|) (|Union| 22 '#1#) (366 . |retractIfCan|)
              (371 . |is?|) (|SparseUnivariatePolynomial| 32) (377 . |degree|)
              (382 . |monomial|) (389 . |leadingCoefficient|) (394 . +)
              (400 . |reductum|) (405 . -) (410 . ~=) (416 . =) (422 . *)
              (428 . -) (|Record| (|:| |var| 22) (|:| |exponent| 75))
              (|Union| 129 '"failed") (433 . |isExpt|) (|Fraction| 75)
              (439 . /) (445 . |numer|) (450 . |denom|) (455 . ^)
              (|Record| (|:| |exponent| 82) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 11) 11 6 32 7)
              (461 . |froot|) (467 . |rootSimp|))
           '#(|rootSplit| 472 |rootSimp| 477 |rootProduct| 482 |rootPower| 487
              |rootKerSimp| 492 |rootFactor| 499 |ratPoly| 504 |ratDenom| 509)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|rootSplit| (|#2| |#2|)) T)
                                   '((|ratDenom| (|#2| |#2|)) T)
                                   '((|ratDenom| (|#2| |#2| |#2|)) T)
                                   '((|ratDenom| (|#2| |#2| (|List| |#2|))) T)
                                   '((|ratDenom|
                                      (|#2| |#2| (|List| (|Kernel| |#2|))))
                                     T)
                                   '((|ratPoly|
                                      ((|SparseUnivariatePolynomial| |#2|)
                                       |#2|))
                                     T)
                                   '((|rootFactor| (|#2| |#2|))
                                     (AND
                                      (|has| 6 (|UniqueFactorizationDomain|))
                                      (|has| 7 (|FunctionSpace| 6))
                                      (|has| 6 (|RetractableTo| 75))
                                      (|has| 6 (|GcdDomain|))
                                      (|has| 6 (|Comparable|))))
                                   '((|rootPower| (|#2| |#2|))
                                     (AND (|has| 7 (|FunctionSpace| 6))
                                          (|has| 6 (|RetractableTo| 75))
                                          (|has| 6 (|GcdDomain|))
                                          (|has| 6 (|Comparable|))))
                                   '((|rootProduct| (|#2| |#2|))
                                     (AND (|has| 7 (|FunctionSpace| 6))
                                          (|has| 6 (|RetractableTo| 75))
                                          (|has| 6 (|GcdDomain|))
                                          (|has| 6 (|Comparable|))))
                                   '((|rootSimp| (|#2| |#2|))
                                     (AND (|has| 7 (|FunctionSpace| 6))
                                          (|has| 6 (|RetractableTo| 75))
                                          (|has| 6 (|GcdDomain|))
                                          (|has| 6 (|Comparable|))))
                                   '((|rootKerSimp|
                                      (|#2| (|BasicOperator|) |#2|
                                       (|NonNegativeInteger|)))
                                     (AND (|has| 7 (|FunctionSpace| 6))
                                          (|has| 6 (|RetractableTo| 75))
                                          (|has| 6 (|GcdDomain|))
                                          (|has| 6 (|Comparable|)))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 140
                                            '(0 9 0 10 1 11 0 9 12 1 7 14 0 15
                                              1 7 22 0 23 1 11 24 0 25 2 24 26
                                              0 9 27 2 17 0 28 0 29 2 24 26 0 9
                                              30 2 17 0 28 0 31 1 32 0 11 33 1
                                              7 0 34 35 2 7 0 0 0 36 1 7 0 0 37
                                              1 7 34 0 38 2 40 39 7 11 41 1 39
                                              42 0 43 3 7 0 0 14 45 46 1 11 19
                                              0 48 1 19 7 0 49 1 7 34 0 50 3 7
                                              0 24 0 0 51 2 7 0 0 0 52 2 11 26
                                              0 0 53 1 7 14 0 54 2 17 0 55 0 56
                                              2 17 0 0 0 57 2 17 26 11 0 58 2 7
                                              0 59 22 60 1 7 61 22 62 3 40 42 7
                                              11 42 63 2 42 0 64 0 65 2 42 7 0
                                              7 66 0 7 0 68 1 69 32 0 70 0 6 0
                                              71 0 32 0 72 2 32 26 0 0 73 1 7 0
                                              34 74 1 7 0 75 76 2 7 0 24 45 77
                                              1 69 80 0 81 2 32 0 0 82 83 2 7 0
                                              0 0 84 1 32 6 0 85 1 32 0 6 86 2
                                              32 87 0 0 88 1 67 69 32 89 1 6 90
                                              0 91 2 94 69 92 93 95 1 7 75 0 96
                                              1 0 7 7 97 1 7 98 0 99 2 6 0 0 75
                                              100 1 7 0 6 101 3 0 7 24 7 82 102
                                              2 7 26 0 0 103 1 75 0 45 104 1 11
                                              82 0 105 3 11 0 24 19 82 106 1 7
                                              0 22 107 2 7 0 0 82 108 1 0 7 7
                                              109 1 0 7 7 110 2 19 0 64 0 111 2
                                              7 0 24 45 112 0 7 0 113 2 32 61 0
                                              11 114 1 7 115 0 116 2 11 26 0 9
                                              117 1 118 82 0 119 3 32 0 0 11 82
                                              120 1 118 32 0 121 2 7 0 0 0 122
                                              1 118 0 0 123 1 7 0 0 124 2 7 26
                                              0 0 125 2 32 26 0 0 126 2 32 0 0
                                              0 127 1 32 0 0 128 2 7 130 0 24
                                              131 2 132 0 75 75 133 1 132 75 0
                                              134 1 132 75 0 135 2 7 0 0 75 136
                                              2 138 137 7 82 139 1 0 7 7 140 1
                                              0 7 7 47 1 1 7 7 140 1 1 7 7 110
                                              1 1 7 7 109 3 1 7 24 7 82 102 1 2
                                              7 7 97 1 0 42 7 44 2 0 7 7 19 20
                                              2 0 7 7 17 18 2 0 7 7 7 21 1 0 7
                                              7 16)))))
           '|lookupComplete|)) 
